Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C002D73A1;
	Mon,  9 Mar 2026 22:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773096854; cv=none; b=W27NHAbQy9u8/C8kMIYAbtK2EAuHPsr2cQCYGRLMlNqpTPLM+P5uh1Ur3kif7BqAcU6Tmsh+R9RSHlmOKBGwNZUvh9641a0hIX0jArtxl+g8WrpU17D2ueq0mF9za53J3IWsuRZ6nGfqigDhVgwyXyw+Y6qGTlYoQkfg/cF0k+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773096854; c=relaxed/simple;
	bh=CM+b09gantZoiEoPoLZ9ClvloNmdrwoMovABA/Vy84I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gu70wgNcfY+4NLwYRR+EbsBfeZJcE0asxoPVh5nBMs9cPzXVJfDlTylyp1wbqogUI/YvWbFgitE/gYW5LUk7dNR9mcNE0J3g7XKM8lVezwtxcTKOnsMPb0A12C6WVRu7t5av561oInZWL5A7gveXgaBASpJtNXXFBw41t24vQig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QrFe7FnZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QrFe7FnZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50469C4CEF7;
	Mon,  9 Mar 2026 22:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773096854;
	bh=CM+b09gantZoiEoPoLZ9ClvloNmdrwoMovABA/Vy84I=;
	h=From:To:Cc:Subject:Date:From;
	b=QrFe7FnZnPBFJA4RWGrT9BW0S/+Bx6F3E6Qj/A50DRYRfWqkSqNUEVyHJVHnxIaHW
	 i7nffCVtopE+zFsoRRksM9NSL7D8hh9KpbcLh/oiMc82+tQ+DfIi9y/msuF6ivZVvE
	 a4CdjrkECCUfSkx6sGZT8mB81RY/EXu/TumZCvut2vYGezEuJIdfpL+Mf3v87k7iJA
	 iEPmTrdlgXJAgyju8CgGqI0s84oLcK8h27J3JkVcOkENz2B5xodSIeHVV30pe1WJfa
	 OwFtoZxdb0YDzfEzNNylLeX7cDYNNaFg2UnzuISR39T3QLJhDwvrPVB9ZOkPT/U8x/
	 cJDhpigdaGLUg==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	aliceryhl@google.com
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>
Subject: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer accessors
Date: Mon,  9 Mar 2026 23:53:24 +0100
Message-ID: <20260309225408.27714-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DmaGspMem pointer accessor methods (gsp_write_ptr, gsp_read_ptr,
cpu_read_ptr, cpu_write_ptr, advance_cpu_read_ptr,
advance_cpu_write_ptr) dereference a raw pointer to DMA memory, creating
an intermediate reference before calling volatile read/write methods.

This is undefined behavior since DMA memory can be concurrently modified
by the device.

Fix this by moving the implementations into a gsp_mem module in fw.rs
that uses the dma_read!() / dma_write!() macros, making the original
methods on DmaGspMem thin forwarding wrappers.

An alternative approach would have been to wrap the shared memory in
Opaque, but that would have required even more unsafe code.

Since the gsp_mem module lives in fw.rs (to access firmware-specific
binding field names), GspMem, Msgq, DmaGspMem and their relevant fields
are temporarily widened to pub(in crate::gsp). This will be reverted
once IoView projections are available.

Cc: Gary Guo <gary@garyguo.net>
Closes: https://lore.kernel.org/nouveau/DGUT14ILG35P.1UMNRKU93JUM1@kernel.org/
Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gsp/cmdq.rs |  71 +++++----------------
 drivers/gpu/nova-core/gsp/fw.rs   | 101 ++++++++++++++++++++----------
 2 files changed, 84 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index ae54708c38eb..00a4062a47dc 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -2,11 +2,7 @@
 
 use core::{
     cmp,
-    mem,
-    sync::atomic::{
-        fence,
-        Ordering, //
-    }, //
+    mem, //
 };
 
 use kernel::{
@@ -146,30 +142,32 @@ struct MsgqData {
 #[repr(C)]
 // There is no struct defined for this in the open-gpu-kernel-source headers.
 // Instead it is defined by code in `GspMsgQueuesInit()`.
-struct Msgq {
+// TODO: Revert to private once `IoView` projections replace the `gsp_mem` module.
+pub(in crate::gsp) struct Msgq {
     /// Header for sending messages, including the write pointer.
-    tx: MsgqTxHeader,
+    pub(in crate::gsp) tx: MsgqTxHeader,
     /// Header for receiving messages, including the read pointer.
-    rx: MsgqRxHeader,
+    pub(in crate::gsp) rx: MsgqRxHeader,
     /// The message queue proper.
     msgq: MsgqData,
 }
 
 /// Structure shared between the driver and the GSP and containing the command and message queues.
 #[repr(C)]
-struct GspMem {
+// TODO: Revert to private once `IoView` projections replace the `gsp_mem` module.
+pub(in crate::gsp) struct GspMem {
     /// Self-mapping page table entries.
     ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
     /// CPU queue: the driver writes commands here, and the GSP reads them. It also contains the
     /// write and read pointers that the CPU updates.
     ///
     /// This member is read-only for the GSP.
-    cpuq: Msgq,
+    pub(in crate::gsp) cpuq: Msgq,
     /// GSP queue: the GSP writes messages here, and the driver reads them. It also contains the
     /// write and read pointers that the GSP updates.
     ///
     /// This member is read-only for the driver.
-    gspq: Msgq,
+    pub(in crate::gsp) gspq: Msgq,
 }
 
 // SAFETY: These structs don't meet the no-padding requirements of AsBytes but
@@ -321,12 +319,7 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
     //
     // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
     fn gsp_write_ptr(&self) -> u32 {
-        let gsp_mem = self.0.start_ptr();
-
-        // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
-        (unsafe { (*gsp_mem).gspq.tx.write_ptr() } % MSGQ_NUM_PAGES)
+        super::fw::gsp_mem::gsp_write_ptr(&self.0)
     }
 
     // Returns the index of the memory page the GSP will read the next command from.
@@ -335,12 +328,7 @@ fn gsp_write_ptr(&self) -> u32 {
     //
     // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
     fn gsp_read_ptr(&self) -> u32 {
-        let gsp_mem = self.0.start_ptr();
-
-        // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
-        (unsafe { (*gsp_mem).gspq.rx.read_ptr() } % MSGQ_NUM_PAGES)
+        super::fw::gsp_mem::gsp_read_ptr(&self.0)
     }
 
     // Returns the index of the memory page the CPU can read the next message from.
@@ -349,27 +337,12 @@ fn gsp_read_ptr(&self) -> u32 {
     //
     // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
     fn cpu_read_ptr(&self) -> u32 {
-        let gsp_mem = self.0.start_ptr();
-
-        // SAFETY:
-        //  - The ['CoherentAllocation'] contains at least one object.
-        //  - By the invariants of CoherentAllocation the pointer is valid.
-        (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
+        super::fw::gsp_mem::cpu_read_ptr(&self.0)
     }
 
     // Informs the GSP that it can send `elem_count` new pages into the message queue.
     fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
-        let rptr = self.cpu_read_ptr().wrapping_add(elem_count) % MSGQ_NUM_PAGES;
-
-        // Ensure read pointer is properly ordered.
-        fence(Ordering::SeqCst);
-
-        let gsp_mem = self.0.start_ptr_mut();
-
-        // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
-        unsafe { (*gsp_mem).cpuq.rx.set_read_ptr(rptr) };
+        super::fw::gsp_mem::advance_cpu_read_ptr(&self.0, elem_count)
     }
 
     // Returns the index of the memory page the CPU can write the next command to.
@@ -378,26 +351,12 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
     //
     // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
     fn cpu_write_ptr(&self) -> u32 {
-        let gsp_mem = self.0.start_ptr();
-
-        // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
-        (unsafe { (*gsp_mem).cpuq.tx.write_ptr() } % MSGQ_NUM_PAGES)
+        super::fw::gsp_mem::cpu_write_ptr(&self.0)
     }
 
     // Informs the GSP that it can process `elem_count` new pages from the command queue.
     fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
-        let wptr = self.cpu_write_ptr().wrapping_add(elem_count) & MSGQ_NUM_PAGES;
-        let gsp_mem = self.0.start_ptr_mut();
-
-        // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
-        unsafe { (*gsp_mem).cpuq.tx.set_write_ptr(wptr) };
-
-        // Ensure all command data is visible before triggering the GSP read.
-        fence(Ordering::SeqCst);
+        super::fw::gsp_mem::advance_cpu_write_ptr(&self.0, elem_count)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 83ff91614e36..ca03d497246d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -40,6 +40,75 @@
     },
 };
 
+// TODO: Replace with `IoView` projections once available; the `unwrap()` calls go away once we
+// switch to the new `dma::Coherent` API.
+pub(in crate::gsp) mod gsp_mem {
+    use core::sync::atomic::{
+        fence,
+        Ordering, //
+    };
+
+    use kernel::{
+        dma::CoherentAllocation,
+        dma_read,
+        dma_write,
+        prelude::*, //
+    };
+
+    use crate::gsp::cmdq::{
+        GspMem,
+        MSGQ_NUM_PAGES, //
+    };
+
+    pub(in crate::gsp) fn gsp_write_ptr(qs: &CoherentAllocation<GspMem>) -> u32 {
+        // PANIC: A `dma::CoherentAllocation` always contains at least one element.
+        || -> Result<u32> { Ok(dma_read!(qs, [0]?.gspq.tx.0.writePtr) % MSGQ_NUM_PAGES) }().unwrap()
+    }
+
+    pub(in crate::gsp) fn gsp_read_ptr(qs: &CoherentAllocation<GspMem>) -> u32 {
+        // PANIC: A `dma::CoherentAllocation` always contains at least one element.
+        || -> Result<u32> { Ok(dma_read!(qs, [0]?.gspq.rx.0.readPtr) % MSGQ_NUM_PAGES) }().unwrap()
+    }
+
+    pub(in crate::gsp) fn cpu_read_ptr(qs: &CoherentAllocation<GspMem>) -> u32 {
+        // PANIC: A `dma::CoherentAllocation` always contains at least one element.
+        || -> Result<u32> { Ok(dma_read!(qs, [0]?.cpuq.rx.0.readPtr) % MSGQ_NUM_PAGES) }().unwrap()
+    }
+
+    pub(in crate::gsp) fn advance_cpu_read_ptr(qs: &CoherentAllocation<GspMem>, count: u32) {
+        let rptr = cpu_read_ptr(qs).wrapping_add(count) % MSGQ_NUM_PAGES;
+
+        // Ensure read pointer is properly ordered.
+        fence(Ordering::SeqCst);
+
+        // PANIC: A `dma::CoherentAllocation` always contains at least one element.
+        || -> Result {
+            dma_write!(qs, [0]?.cpuq.rx.0.readPtr, rptr);
+            Ok(())
+        }()
+        .unwrap()
+    }
+
+    pub(in crate::gsp) fn cpu_write_ptr(qs: &CoherentAllocation<GspMem>) -> u32 {
+        // PANIC: A `dma::CoherentAllocation` always contains at least one element.
+        || -> Result<u32> { Ok(dma_read!(qs, [0]?.cpuq.tx.0.writePtr) % MSGQ_NUM_PAGES) }().unwrap()
+    }
+
+    pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &CoherentAllocation<GspMem>, count: u32) {
+        let wptr = cpu_write_ptr(qs).wrapping_add(count) & MSGQ_NUM_PAGES;
+
+        // PANIC: A `dma::CoherentAllocation` always contains at least one element.
+        || -> Result {
+            dma_write!(qs, [0]?.cpuq.tx.0.writePtr, wptr);
+            Ok(())
+        }()
+        .unwrap();
+
+        // Ensure all command data is visible before triggering the GSP read.
+        fence(Ordering::SeqCst);
+    }
+}
+
 /// Empty type to group methods related to heap parameters for running the GSP firmware.
 enum GspFwHeapParams {}
 
@@ -708,22 +777,6 @@ pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32, msg_count: u32) -> Self {
             entryOff: num::usize_into_u32::<GSP_PAGE_SIZE>(),
         })
     }
-
-    /// Returns the value of the write pointer for this queue.
-    pub(crate) fn write_ptr(&self) -> u32 {
-        let ptr = core::ptr::from_ref(&self.0.writePtr);
-
-        // SAFETY: `ptr` is a valid pointer to a `u32`.
-        unsafe { ptr.read_volatile() }
-    }
-
-    /// Sets the value of the write pointer for this queue.
-    pub(crate) fn set_write_ptr(&mut self, val: u32) {
-        let ptr = core::ptr::from_mut(&mut self.0.writePtr);
-
-        // SAFETY: `ptr` is a valid pointer to a `u32`.
-        unsafe { ptr.write_volatile(val) }
-    }
 }
 
 // SAFETY: Padding is explicit and does not contain uninitialized data.
@@ -739,22 +792,6 @@ impl MsgqRxHeader {
     pub(crate) fn new() -> Self {
         Self(Default::default())
     }
-
-    /// Returns the value of the read pointer for this queue.
-    pub(crate) fn read_ptr(&self) -> u32 {
-        let ptr = core::ptr::from_ref(&self.0.readPtr);
-
-        // SAFETY: `ptr` is a valid pointer to a `u32`.
-        unsafe { ptr.read_volatile() }
-    }
-
-    /// Sets the value of the read pointer for this queue.
-    pub(crate) fn set_read_ptr(&mut self, val: u32) {
-        let ptr = core::ptr::from_mut(&mut self.0.readPtr);
-
-        // SAFETY: `ptr` is a valid pointer to a `u32`.
-        unsafe { ptr.write_volatile(val) }
-    }
 }
 
 // SAFETY: Padding is explicit and does not contain uninitialized data.

base-commit: 4da879a0d3fd170a70994b73baa554c6913918b5
-- 
2.53.0

