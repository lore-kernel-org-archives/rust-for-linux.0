Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795832189;
	b=nT1qkFqPH8uI/NQxDeHf1mtS2wxsROTJpdvrKdoMkbUavoj5VHPtZoz6SIGnXUC30/2c
	 IhxSIJwW8ZGb5djwk4eNQHz+rQ04WYoVU9PmnghMre043ef3tSRjic1JnsCd+d5vp3Rhq
	 6gI8ziQy87ClR+28yVTYd8FaIrDssUcYBOixGl/oB5SaLOBjwrflf2WAmkb/2J1ybWJcs
	 2Q1tBvwPOWwxON/8FKLoeFwB1wfTaDoZbsRn1T6fHxuoKUOLN7W5nWAXM/2F84OkhzApn
	 sIc39PA/lizCHjIFXYiagnQ4YNsy7QUWId2Kv+cwxMgBGo2YzMny5pB8f/v4xQ5Kcww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795832189;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=9raKRrSllCu05uDQ+E8GcUzWg7XKNVW+zeXTgiM6ny8=;
	b=0wmvKrZFBnwYBgXqh00z7NZILLEvHOAz1/pth2dU1EJcjtebuNMbL2lH7/MYzKGovfsi
	 t3YgU8gPONOfepaVQq3Y/m3HG/CNy0pWBwvtPqDcbGeKaLMfdbs9SbRSYjlk/yshFocwd
	 OFM/hste4URCQufynrTf/pbUyhcvGqW9wIFUCkYaDkAZNc+XOQhVGbkMORZnUhB389GLm
	 LE/Sbd5lAJcM159u33jNB0FW1JJdzoGIP+jDWILCNJaGwaqZ+Rf+rajF8h0tIlFzbZisi
	 PIun0monDvc69xnuy1knqoEQxKXYxIJ5QKruuc0xNno8j6oPYhwMX/m/NY5rYOVk1zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=gILOaS8G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F54606A685;
	Sat, 28 Nov 2026 02:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F54606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=gILOaS8G
ARC-Seal: i=1; a=rsa-sha256; t=1795832168; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FQ/pjUDoDdCrQw3orv3wbuktagb3dOfsdxkqr1f/AVVbsNXxUGXQ5CFDVtQ6fGqQ6gpUuCUULAuxyPSs00VLILQp6YPy1Uq2l6f4SqzudFkfL2Vz7fKxvxmuADzR+PspFsZFSHi5fo11+OAhzbBLifRoDyUS+YffVhJGw/N18vM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795832168; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9raKRrSllCu05uDQ+E8GcUzWg7XKNVW+zeXTgiM6ny8=; 
	b=oA/BdxdZABjgFqHiJ9GT3UizKnfrDiieKOXwVtrLTgMajNnnJPjnMVvzHxrMZHVbwDykWBTyJX5EgYH55a8mD/LsU/aWWdZI1lSl09cMG5+lZ6XffSkTuAviYYtP1qPbqEkiVrrJtDXQNrDiwemZpyFFYYT1Zz7uRrYq8QLyRPk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=gILOaS8GH1MB/Wu/Pi4bqsuKfJK03MveX17sAQqpX6R6OC4AsOhoEIzFCENoDAb1xDEuawbdMooKd4jx6uhypX5imURHLP0lpzDlADCkvfl+jtJ5hLYdk3i+rdC04o1qd97BEhXAQUtnqxJOFLmrjO5J3LSxvjwKDNb/8OE/Nxo=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=9raKRrSllCu05uDQ+E8GcUzWg7XKNVW+zeXTgiM6ny8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795832166752104.2427414020658;
	Fri, 27 Nov 2026 18:16:06 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 27 Nov 2026 23:15:41 -0300
Subject: [PATCH 4/9] drm/tyr: report gpu faults
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
Message-Id: <20261127-tyr-mmu-irq-v1-4-2fcb9f9465cd@collabora.com>
References: <20261127-tyr-mmu-irq-v1-0-2fcb9f9465cd@collabora.com>
In-Reply-To: <20261127-tyr-mmu-irq-v1-0-2fcb9f9465cd@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Laura Nao <laura.nao@collabora.com>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

A gpu fault sets GPU_FAULT in the gpu IRQ and records the fault in
GPU_FAULTSTATUS and, when known, its physical address in
GPU_FAULTADDRESS. Tyr keeps every gpu IRQ source masked, so gpu faults
go unreported.

Unmask GPU_FAULT and log each fault with its exception type, access
type, source and, when valid, address. Then issue CLEAR_FAULT, since the
fault registers keep a fault until it is cleared, and until then, no
further gpu faults are reported.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs  |  2 +-
 drivers/gpu/drm/tyr/gpu/irq.rs | 75 +++++++++++++++++++++++++++++++++++-------
 2 files changed, 64 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 383335e8707d..c88fc5194dc2 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -92,7 +92,7 @@ pub(crate) struct TyrDrmRegistrationData<'drm> {
 
     // `TyrIrqRegistration::drop()` writes to the GPU registers, so keep this
     // field before the clocks and regulators.
-    _gpu_irq: Pin<KBox<TyrIrqRegistration<'drm, GpuIrq>>>,
+    _gpu_irq: Pin<KBox<TyrIrqRegistration<'drm, GpuIrq<'drm>>>>,
 
     #[pin]
     clks: Mutex<Clocks>,
diff --git a/drivers/gpu/drm/tyr/gpu/irq.rs b/drivers/gpu/drm/tyr/gpu/irq.rs
index a27ccf5c37a6..3dd1f634c847 100644
--- a/drivers/gpu/drm/tyr/gpu/irq.rs
+++ b/drivers/gpu/drm/tyr/gpu/irq.rs
@@ -5,7 +5,10 @@
 //! The GPU IRQ reports GPU-wide events, such as faults, completed resets and power changes.
 
 use kernel::{
-    device::Bound,
+    device::{
+        Bound,
+        Device, //
+    },
     io::Io,
     platform,
     prelude::*,
@@ -18,17 +21,29 @@
         TyrIrqRegistration,
         TyrIrqTrait, //
     },
-    regs::gpu_control::{
-        GPU_IRQ_CLEAR,
-        GPU_IRQ_MASK,
-        GPU_IRQ_RAWSTAT,
-        GPU_IRQ_STATUS, //
+    regs::{
+        gpu_control::{
+            GPU_COMMAND,
+            GPU_FAULTADDRESS_HI,
+            GPU_FAULTADDRESS_LO,
+            GPU_FAULTSTATUS,
+            GPU_IRQ_CLEAR,
+            GPU_IRQ_MASK,
+            GPU_IRQ_RAWSTAT,
+            GPU_IRQ_STATUS, //
+        },
+        join_u64, //
     },
     reset::HwGate, //
 };
 
 /// The GPU IRQ, signalling GPU-wide events.
-pub(crate) struct GpuIrq;
+pub(crate) struct GpuIrq<'a> {
+    /// Device used for logging.
+    dev: &'a Device<Bound>,
+    /// Shared gate that coordinates hardware access with GPU reset.
+    hw: Arc<HwGate<'a>>,
+}
 
 /// Requests a threaded IRQ registration for the GPU IRQ.
 ///
@@ -39,8 +54,11 @@
 pub(crate) unsafe fn gpu_irq_init<'a>(
     pdev: &'a platform::Device<Bound>,
     hw: Arc<HwGate<'a>>,
-) -> Result<Pin<KBox<TyrIrqRegistration<'a, GpuIrq>>>> {
-    let gpu_irq = GpuIrq;
+) -> Result<Pin<KBox<TyrIrqRegistration<'a, GpuIrq<'a>>>>> {
+    let gpu_irq = GpuIrq {
+        dev: pdev.as_ref(),
+        hw: hw.clone(),
+    };
     // Ensure interrupt sources are disabled until the handler is registered.
     gpu_irq.clear_mask(hw.access().iomem());
 
@@ -48,7 +66,7 @@ pub(crate) unsafe fn gpu_irq_init<'a>(
     unsafe { TyrIrqRegistration::request(pdev, c"gpu", c"tyr-gpu", gpu_irq, hw) }
 }
 
-impl TyrIrqTrait for GpuIrq {
+impl TyrIrqTrait for GpuIrq<'_> {
     fn read_status(&self, io: &IoMem<'_>) -> u32 {
         io.read(GPU_IRQ_STATUS).into_raw()
     }
@@ -70,8 +88,41 @@ fn clear_status(&self, io: &IoMem<'_>, status: u32) {
     }
 
     fn mask(&self) -> u32 {
-        GPU_IRQ_MASK::zeroed().into_raw()
+        // Only GPU faults are handled. DOORBELL_MIRROR must stay masked because
+        // GPU_IRQ_CLEAR cannot clear it.
+        GPU_IRQ_MASK::zeroed().with_gpu_fault(true).into_raw()
     }
 
-    fn handle(&self, _status: u32) {}
+    fn handle(&self, _status: u32) {
+        let hw_guard = self.hw.access();
+        let io = hw_guard.iomem();
+        let fault = io.read(GPU_FAULTSTATUS);
+
+        match fault.exception_type() {
+            Ok(exception) => dev_err!(
+                self.dev,
+                "GPU fault: {:?} on {:?} access, source {:#x}\n",
+                exception,
+                fault.access_type(),
+                fault.source_id().get()
+            ),
+            Err(_) => dev_err!(
+                self.dev,
+                "GPU fault: GPU_FAULTSTATUS {:#010x}\n",
+                fault.into_raw()
+            ),
+        }
+
+        if fault.address_valid() {
+            let address = join_u64(
+                io.read(GPU_FAULTADDRESS_LO).into_raw(),
+                io.read(GPU_FAULTADDRESS_HI).into_raw(),
+            );
+            dev_err!(self.dev, "GPU fault at PA {:#018x}\n", address);
+        }
+
+        // The fault registers keep this fault until it is cleared, and until
+        // then, no further GPU faults are reported.
+        io.write_reg(GPU_COMMAND::clear_fault());
+    }
 }

-- 
2.56.0

