Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445943;
	b=pPA8wGGOIPRUY00ryxes5S1LpONJj2QYfO81/FXEiSdpa8XG6SiWg3QLZB9zSQMhXISv
	 JLmXtiUio0jXxvEJxFKVIuKbaXDHWUQYfdviPaMX9n+/3+qEJMYPnmFq0dbI37vPIf3n3
	 SkurjP6LbbNdzfKmPDD+M5hk8wXVX7ybfD0rzXIZ4vcHHjyJPvsPTxBmZ74VFbISw1DLe
	 s1fc4UF1g7lN5exA7g/VCOb+TNlGFN+Px7Ngq87aAVEgFBwjicowl6n91AwX62g3KjGop
	 MPTZE2N+WzAPXX8+CMT6rQ9ClqZ5WdQVEW81Wrr2bVHZB7BFN0hydaeblO6eh9SDN+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445943;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=6ryUKBEMsHMKrtyBnqn9qq5xsW6I4bsdHHqJLlq1rp0=;
	b=KAucQ7IRH0ywpyhwCwxJR6EfF9vmko76d16rLUQ4h5cllvFQA2cJXSKEh0czH+siZtx+
	 dpsONFTiuqS6RO2YfRYZzgDjh/GHf/wDQsICwcXJrV/FOl4mbyht7M3yHXr8DP3vZmHRw
	 uOTab4hsvpBaDoqYsZeYNldIn5BrBn3j31KIiuD/QwxlIMXkLKC2IEx9LTUv1/BcHx8Bp
	 4jRoR/f+KdL6L/KVLEO3Qi0AU2bvzASw7aWqN9IH3psm0yx9az49eNaIjrp9vy3/5nFx2
	 c2uGNtc/D7dTWELzSw4AR2PajzrA9vw7hq/l35pJRjUowwntjt/0Q++RxLlHZ25vSCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GodwH80L;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F554606A6AD;
	Mon, 23 Nov 2026 14:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F554606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GodwH80L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795445941;
	bh=h/OafDnGArsfXhsRGtHqF88KhWz28oSbPN5GqCRnvEs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GodwH80LOlb/mPTjpQqY6tdKW73FThEJnJuURcUgQ1kX7Fwo02sGDIZISuAyGPEMr
	 mMnm912HP5J8C71NUB7A/Q33kEjdQCdcP91yd0TCSFdiUH5TvgdXbfBtse4r9eoGZT
	 XD7rDr/R7ofB09b7IR89M4V/sbsI0v2NTV7pRSoI3gBzXgclBQugaKMA6v7Zn+jCs9
	 +lfy+qvBGbf0wOu2ggveODWWtBVP28Bpq7sl1sAxCrfjW3sIbRn4oq7hplcdzBFui1
	 83HRvHTQPjVR4Ewgi1Fw6WgDsDvBT7gF2VijsmmY7IHx1uapBpPpvjb2dLKVN+qXTi
	 4mtdl+G9GwxZg==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1733917E0EBD;
	Mon, 23 Nov 2026 15:59:01 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
Date: Mon, 23 Nov 2026 15:58:47 +0100
Subject: [PATCH v7 3/3] drm/tyr: add Job IRQ handling
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-tyr-irq-v2-v7-3-4e172e58e28c@collabora.com>
References: <20260728-tyr-irq-v2-v7-0-4e172e58e28c@collabora.com>
In-Reply-To: <20260728-tyr-irq-v2-v7-0-4e172e58e28c@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, kernel@collabora.com, 
 Laura Nao <laura.nao@collabora.com>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.12.0

The Job IRQ reports requests from the CSF firmware, including global
interface requests and CSG attention bits. Only the GLB bit is currently
handled, as it will be used to check firmware readiness. CSG bits
handling will be added at a later stage. The Job IRQ handler masks the
interrupt in the primary IRQ handler, processes pending raw status in
the threaded handler, clears the handled bits, and reenables the mask
before returning.
Add JobIrqEvents to hold the wait queue and the ready flag used to
signal firmware readiness when the GLB bit is set.

Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/gpu/drm/tyr/fw.rs     |   1 +
 drivers/gpu/drm/tyr/fw/irq.rs | 148 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/irq.rs    |   1 -
 3 files changed, 149 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/fw.rs b/drivers/gpu/drm/tyr/fw.rs
index f2e0404addf2..ecf2ea171bc9 100644
--- a/drivers/gpu/drm/tyr/fw.rs
+++ b/drivers/gpu/drm/tyr/fw.rs
@@ -69,6 +69,7 @@
     vm::Vm, //
 };
 
+pub(crate) mod irq;
 mod parser;
 
 pub(super) const CSF_MCU_SHARED_REGION_START: u32 = 0x04000000;
diff --git a/drivers/gpu/drm/tyr/fw/irq.rs b/drivers/gpu/drm/tyr/fw/irq.rs
new file mode 100644
index 000000000000..a736d8cd4374
--- /dev/null
+++ b/drivers/gpu/drm/tyr/fw/irq.rs
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! IRQ handling for the Job IRQ.
+//!
+//! The Job IRQ signals events from the MCU, including global interface acknowledgements.
+#![allow(dead_code)]
+
+use kernel::{
+    device::Bound, //
+    io::Io,
+    new_waitqueue,
+    platform,
+    prelude::*,
+    sync::{
+        atomic::{
+            ordering,
+            Atomic, //
+        },
+        Arc,
+        WaitQueue, //
+    },
+    time::{
+        Delta,
+        Msecs, //
+    },
+};
+
+use crate::{
+    irq::{
+        TyrIrqRegistration,
+        TyrIrqTrait, //
+    },
+    regs::job_control::{
+        JOB_IRQ_CLEAR,
+        JOB_IRQ_MASK,
+        JOB_IRQ_RAWSTAT,
+        JOB_IRQ_STATUS, //
+    },
+    driver::IoMem,
+    reset::HwGate, //
+};
+
+/// The firmware events published by the Job IRQ handler, and the queue used to announce them.
+#[pin_data]
+pub(crate) struct JobIrqEvents {
+    #[pin]
+    wait: WaitQueue,
+    /// Set once the firmware has signalled that the global interface is ready.
+    ready: Atomic<bool>,
+}
+
+impl JobIrqEvents {
+    /// Creates a new, empty set of Job IRQ events.
+    pub(crate) fn new() -> Result<Arc<Self>> {
+        Arc::pin_init(
+            pin_init!(JobIrqEvents {
+                wait <- new_waitqueue!(),
+                ready: Atomic::new(false),
+            }),
+            GFP_KERNEL,
+        )
+    }
+
+    /// Clears the firmware-ready state.
+    #[expect(dead_code)]
+    pub(crate) fn clear_ready(&self) {
+        self.ready.store(false, ordering::Relaxed);
+    }
+
+    /// Waits until the firmware signals readiness via the GLB IRQ bit, or the timeout expires.
+    pub(crate) fn wait_ready(&self, timeout_ms: Msecs) -> Result {
+        self.wait.wait_event_timeout(
+            || self.ready.load(ordering::Acquire),
+            Delta::from_millis(timeout_ms.into()).to_jiffies_timeout(),
+        )?;
+
+        Ok(())
+    }
+
+    /// Updates state and wakes up waiters
+    fn signal(&self, status: u32) {
+        // TODO: handle other Job IRQ events (e.g. CSG attention bits) here once
+        // support for them is added.
+
+        // The GLB bit only signals firmware readiness once, at power up
+        if JOB_IRQ_RAWSTAT::from_raw(status).glb() && !self.ready.load(ordering::Relaxed) {
+            self.ready.store(true, ordering::Release);
+        }
+
+        self.wait.wake_up_all();
+    }
+}
+
+// The Job IRQ, signalling requests or notification from the MCU.
+pub(crate) struct JobIrq {
+    /// Firmware events signalled by this IRQ.
+    events: Arc<JobIrqEvents>,
+}
+
+
+/// Requests a threaded IRQ registration for the Job IRQ.
+///
+/// # Safety
+///
+/// Callers must not `mem::forget()` the resulting registration or otherwise prevent its
+/// [`Drop`] implementation from running.
+pub(crate) unsafe fn job_irq_init<'a>(
+    pdev: &'a platform::Device<Bound>,
+    hw: Arc<HwGate<'a>>,
+    events: Arc<JobIrqEvents>,
+) -> Result<Pin<KBox<TyrIrqRegistration<'a, JobIrq>>>> {
+    let job_irq = JobIrq { events };
+    // Ensure interrupt sources are disabled until the handler is registered.
+    job_irq.clear_mask(hw.access().iomem());
+
+    // SAFETY: The caller guarantees the resulting registration will not be leaked.
+    unsafe { TyrIrqRegistration::request(pdev, c"job", job_irq, hw) }
+}
+
+impl TyrIrqTrait for JobIrq {
+    fn read_status(&self, io: &IoMem<'_>) -> u32 {
+        io.read(JOB_IRQ_STATUS).into_raw()
+    }
+
+    fn clear_mask(&self, io: &IoMem<'_>) {
+        io.write_reg(JOB_IRQ_MASK::zeroed());
+    }
+
+    fn reenable_mask(&self, io: &IoMem<'_>) {
+        io.write_reg(JOB_IRQ_MASK::from_raw(self.mask()));
+    }
+
+    fn read_raw_status(&self, io: &IoMem<'_>) -> u32 {
+        io.read(JOB_IRQ_RAWSTAT).into_raw()
+    }
+
+    fn clear_status(&self, io: &IoMem<'_>, status: u32) {
+        io.write_reg(JOB_IRQ_CLEAR::from_raw(status));
+    }
+
+    fn mask(&self) -> u32 {
+        JOB_IRQ_MASK::zeroed().with_glb(true).into_raw()
+    }
+
+    fn handle(&self, status: u32) {
+        self.events.signal(status);
+    }
+}
diff --git a/drivers/gpu/drm/tyr/irq.rs b/drivers/gpu/drm/tyr/irq.rs
index 4a065c6272c5..5632f50b0a13 100644
--- a/drivers/gpu/drm/tyr/irq.rs
+++ b/drivers/gpu/drm/tyr/irq.rs
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
 //! Threaded IRQ wrapper shared by all Tyr interrupt sources.
-#![allow(dead_code)]
 use core::marker::PhantomPinned;
 
 use kernel::{

-- 
2.39.5

