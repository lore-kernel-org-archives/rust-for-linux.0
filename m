Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795832181;
	b=w8sBMui1ra6nmZzvpz5q+3VOTI4dN6Q59Z+DaPqoDLQeBuYZ1sTq+pDd2oQjI8DlCB51
	 r0IcIGuEcotk7/6T79/CT5uB5U2z4v8eoau4I6dQVrtk3ETsHTvaoMTaikcLo6J6AQbM4
	 gmYNrHN7ZTLz2dpjO5M56tjw+clC0YAWmD2K6MBfwC8T9kVvQjlQQ1cvppT9tmQMJp2+Y
	 LCroDp6MpSxAXddz7Tmg3NSyT9v//zwa5m59YXds1BHog1Zqavgm0n3BjKWn5rQ3aUjeO
	 GhRAVMOawRwhkpxgVBdw650BNI3e+0XYspJ/vo5dfegNLxIkvIIEsVKLTlLVcHCOVqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795832181;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=burL5KmTbeFmlZUskko+KLdoMnvGp13Hw0GTaVj5ukc=;
	b=J0qddLHaFXwJby/JBSgY5d55MyJ5/jlAcQEVZ7ECGhlh+QjBs3bpuzAzS21k1D3ngFGJ
	 rY6FeUPkEG4pPvVW6QzEmPf/LHYZbGJnOUsVgvFG10un6iG1fgVJAnYQVodK/FgSwx56y
	 pzPZy5bStLd+FSKUy0Kw89PM6dITxDMP6HIcUItkvGtfgrTO/HehiSerEp2/U3OP9MSHT
	 iKf8Fo/s05Vb/stikI7cM6Mg2Rxt3v2ldKTC1xHlwwFvB8U8fdwSnsW9wdXazvaIEX7q1
	 NJ/1Ny38IXdeR6BRhCRqyz2xklUA9gISZQFbpMxbp8ArcV3Nt30elbir1YCJLBg+HLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Hdi+9Xj9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E31606A334;
	Sat, 28 Nov 2026 02:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E31606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Hdi+9Xj9
ARC-Seal: i=1; a=rsa-sha256; t=1795832166; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VEguT3rOQgBTZ9SG2NAr4/Pk18LkKjNsUiRuuFixYJ/6wOZ6YhesDMbcSrR1LzefyaDQWjpegSEMEuSOUOAHRaCvflRQrAyWtg00jCl7TRllrU+lJHrZ4HT8FbpYRAQLJ5HaMAywiDyFbFT65XCERmuHbRac3kxZwy/gxYZRqUQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795832166; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=burL5KmTbeFmlZUskko+KLdoMnvGp13Hw0GTaVj5ukc=; 
	b=fGmkruP0OgdEErByxeq7GmRoMJF7m6AeB8IbQdxZ8Qigj9MDmdtJ+h8JVvIKyF5BdssNRSn4PFLCNbc8y0rjoMPFJnt2HAfpclBQpy09AI/z0fNVhrvWNHVBCuNVUuCJr/EP5GbDLq59U39eHq8bglFnUpZU8lNKD3eNOvQwcBA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Hdi+9Xj9KAO6f1qdeqAVs4xGRes8IDwI5ZdTSE91eCeAj78TVvlYHR7AgVxJi3g1Zb6NhRS2M+BH11Zlpfc0uwEAucodVt3zdXEH8Tret7A/Dsul07pIEPJ5h3J/ixs5OtWZsvSyZMf/vqAQkFPabOjoa2TdUrylxeVSbIhY1r8=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=burL5KmTbeFmlZUskko+KLdoMnvGp13Hw0GTaVj5ukc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795832163938125.18566182892107;
	Fri, 27 Nov 2026 18:16:03 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 27 Nov 2026 23:15:40 -0300
Subject: [PATCH 3/9] drm/tyr: request the gpu IRQ
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
Message-Id: <20261127-tyr-mmu-irq-v1-3-2fcb9f9465cd@collabora.com>
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

The gpu IRQ reports gpu-wide events, such as gpu faults, completed
resets and power changes. Tyr does not request it, so nothing can report
a gpu fault.

Add GpuIrq, a TyrIrqTrait implementation for the GPU_CONTROL IRQ
registers, and request the "gpu" interrupt in probe before the firmware
is loaded. Keep the registration in TyrDrmRegistrationData ahead of the
clocks and regulators, since dropping it writes the IRQ mask through
MMIO, which needs them enabled.

All interrupt sources stay masked for now. The next patch unmasks and
reports gpu faults.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs  | 17 +++++++++-
 drivers/gpu/drm/tyr/gpu.rs     |  2 ++
 drivers/gpu/drm/tyr/gpu/irq.rs | 77 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 1fb91d0757f7..383335e8707d 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -33,7 +33,13 @@
     file::TyrDrmFileData,
     fw::Firmware,
     gem::Bo,
-    gpu::GpuInfo,
+    gpu::{
+        irq::{
+            gpu_irq_init,
+            GpuIrq, //
+        },
+        GpuInfo, //
+    },
     irq::TyrIrqRegistration,
     mmu::{
         irq::{
@@ -84,6 +90,10 @@ pub(crate) struct TyrDrmRegistrationData<'drm> {
     // field before the clocks and regulators.
     _mmu_irq: Pin<KBox<TyrIrqRegistration<'drm, MmuIrq<'drm>>>>,
 
+    // `TyrIrqRegistration::drop()` writes to the GPU registers, so keep this
+    // field before the clocks and regulators.
+    _gpu_irq: Pin<KBox<TyrIrqRegistration<'drm, GpuIrq>>>,
+
     #[pin]
     clks: Mutex<Clocks>,
 
@@ -157,6 +167,10 @@ fn probe<'bound>(
             // drops at unbind, and every error path before that drops it.
             let mmu_irq = unsafe { mmu_irq_init(pdev, hw.clone(), &gpu_info) }?;
 
+            // SAFETY: The registration ends up in `TyrDrmRegistrationData`, which `_reg`
+            // drops at unbind, and every error path before that drops it.
+            let gpu_irq = unsafe { gpu_irq_init(pdev, hw.clone()) }?;
+
             let firmware = Firmware::new(
                 pdev.as_ref(),
                 hw.clone(),
@@ -180,6 +194,7 @@ fn probe<'bound>(
                         reset <- reset::ResetHandle::new(pdev, hw.clone()),
                         fw: firmware,
                         _mmu_irq: mmu_irq,
+                        _gpu_irq: gpu_irq,
                         clks <- new_mutex!(Clocks {
                             core: core_clk,
                             stacks: stacks_clk,
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 820de9d60c19..cc86ea04607d 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -28,6 +28,8 @@
     }, //
 };
 
+pub(crate) mod irq;
+
 /// Struct containing information that can be queried by userspace. This is read from
 /// the GPU's registers.
 #[repr(transparent)]
diff --git a/drivers/gpu/drm/tyr/gpu/irq.rs b/drivers/gpu/drm/tyr/gpu/irq.rs
new file mode 100644
index 000000000000..a27ccf5c37a6
--- /dev/null
+++ b/drivers/gpu/drm/tyr/gpu/irq.rs
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! IRQ handling for the GPU IRQ.
+//!
+//! The GPU IRQ reports GPU-wide events, such as faults, completed resets and power changes.
+
+use kernel::{
+    device::Bound,
+    io::Io,
+    platform,
+    prelude::*,
+    sync::Arc, //
+};
+
+use crate::{
+    driver::IoMem,
+    irq::{
+        TyrIrqRegistration,
+        TyrIrqTrait, //
+    },
+    regs::gpu_control::{
+        GPU_IRQ_CLEAR,
+        GPU_IRQ_MASK,
+        GPU_IRQ_RAWSTAT,
+        GPU_IRQ_STATUS, //
+    },
+    reset::HwGate, //
+};
+
+/// The GPU IRQ, signalling GPU-wide events.
+pub(crate) struct GpuIrq;
+
+/// Requests a threaded IRQ registration for the GPU IRQ.
+///
+/// # Safety
+///
+/// Callers must not `mem::forget()` the resulting registration or otherwise prevent its
+/// [`Drop`] implementation from running.
+pub(crate) unsafe fn gpu_irq_init<'a>(
+    pdev: &'a platform::Device<Bound>,
+    hw: Arc<HwGate<'a>>,
+) -> Result<Pin<KBox<TyrIrqRegistration<'a, GpuIrq>>>> {
+    let gpu_irq = GpuIrq;
+    // Ensure interrupt sources are disabled until the handler is registered.
+    gpu_irq.clear_mask(hw.access().iomem());
+
+    // SAFETY: The caller guarantees the resulting registration will not be leaked.
+    unsafe { TyrIrqRegistration::request(pdev, c"gpu", c"tyr-gpu", gpu_irq, hw) }
+}
+
+impl TyrIrqTrait for GpuIrq {
+    fn read_status(&self, io: &IoMem<'_>) -> u32 {
+        io.read(GPU_IRQ_STATUS).into_raw()
+    }
+
+    fn clear_mask(&self, io: &IoMem<'_>) {
+        io.write_reg(GPU_IRQ_MASK::zeroed());
+    }
+
+    fn reenable_mask(&self, io: &IoMem<'_>) {
+        io.write_reg(GPU_IRQ_MASK::from_raw(self.mask()));
+    }
+
+    fn read_raw_status(&self, io: &IoMem<'_>) -> u32 {
+        io.read(GPU_IRQ_RAWSTAT).into_raw()
+    }
+
+    fn clear_status(&self, io: &IoMem<'_>, status: u32) {
+        io.write_reg(GPU_IRQ_CLEAR::from_raw(status));
+    }
+
+    fn mask(&self) -> u32 {
+        GPU_IRQ_MASK::zeroed().into_raw()
+    }
+
+    fn handle(&self, _status: u32) {}
+}

-- 
2.56.0

