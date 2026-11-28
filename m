Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795832179;
	b=L4a2oQla3Q/MFrDhxSNFZATqj/i9KU9Q0AAnK+TxLmhBjFxb1B19GCPHbbJ/L5DlqUDL
	 EUAEFrIrS7wMWsATipjvQxUdBExlH0PUUwIFSIJ+mISya2BICB66aGYMgIWAnfGdhJrGn
	 4yul4O4dRQjCi39IRRDsuwSGs1bScoe+2VN20ADRo3irZE/6RtFuUyHmS5AoLbKrXYinT
	 o6jGxRx5lei/YYEivYbRa51DerT3NaGqp3gkwxSguzYwM1groSv+H7I/kcKwVhjB/D7BT
	 REA+N9dUeElycXgpLbTkOHSyLyYM+L5Yxv2d0NdBWCciWdL1b7HA2ZMCfy1YFoQ5vLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795832179;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=BX41Ft0DNxvYpkJpPvZb3AW6+fbIeu7cSO3y0hWHCvs=;
	b=MJlD4b2CPk2HdZ9ZtGmc2e9HErnni/gNW3v50J+shgjS2klHHsNkOuTU7ztEyLSuburt
	 Swd1tbUF8FDqroS0RZAUNEmVgpIvh4SYnCF9Egw8p1zU9QsJc+MpTjqA0CxvOif+cHTYB
	 XO3FaBFzNS37dzJ2qpq1IPZSAgfEkosrMiH+FKq4UHDcFKXLiDe+WE4zVEp1XtIbgrrhy
	 cFhj76nGBaJscc6qFx/oGb1PhcpFnlHNrg6Ip2TzTbvMZTTLxTGfSIuut4IVMB+Mb42Zi
	 3rOe5NoOKV2LRHI1ZZMoQdUM0nx2WLuUX2Cw6POMtaIk6oc6VZ+6RnHQtqV4ZXWTolw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=FnxRx2tv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B97606A321;
	Sat, 28 Nov 2026 02:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B97606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=FnxRx2tv
ARC-Seal: i=1; a=rsa-sha256; t=1795832162; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jE+PtAKy+iCy7XhLlhUJbXvZrNNHtXNzlQLqIDAWo6YejzSLsz+zVekJqBaggK/MxrmAvsflCaxeDTHaSyDWf+aH+LDBfRWgDsD4Z9XsrnQGbsfVnVELJSRAZFgRDHFLUYXBevbrLZvRVNtIYhm2VUHqbgRMu4HSfkK75AGz7RQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795832162; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BX41Ft0DNxvYpkJpPvZb3AW6+fbIeu7cSO3y0hWHCvs=; 
	b=NYW9jKXM9yDJzKkkoe617wMbiHh2nFBssTpeRUydY5sPYQVDjeRUaYJS3f0N3UiIPUTcNnYEyRQ+/zfE12bLlcSNpnPGpCEnVmXlFvIRCkYTXAdf6Io50c3wmY3uNjS3rt2F1dcVIyMmk6RtTSVP6X+QNr2pvgqD6yoar4EMVLk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=FnxRx2tvUb11HYwMo++TrG4MWOoK0fbc8zN69sbeZD3e+C1v0+vycHZjex3BCx4TwH305+kci4PYQkOSqeHdGpznhsxCZcSEVS/NJ4h02cslu0m7gMQdmX/K6fTMm6q9hM9IVfR6fsrg8RJ4HNyNwGU3n3RciYQLXWy1bX8W1ss=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=BX41Ft0DNxvYpkJpPvZb3AW6+fbIeu7cSO3y0hWHCvs=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795832161088674.5408442475073;
	Fri, 27 Nov 2026 18:16:01 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 27 Nov 2026 23:15:39 -0300
Subject: [PATCH 2/9] drm/tyr: report mmu page faults
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
Message-Id: <20261127-tyr-mmu-irq-v1-2-2fcb9f9465cd@collabora.com>
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

A page fault sets the address space's bit in the mmu IRQ and records the
fault in that address space's FAULTSTATUS and FAULTADDRESS registers.
Tyr keeps every mmu IRQ source masked, so page faults go unreported.

Unmask the page-fault interrupt of every present address space, and log
each fault with its address space, address, exception type, access type
and source.

Nothing resolves the fault yet, and an address space that faulted can
fault again, so mask its page-fault interrupt once the fault is reported
to avoid interrupt storms, like panthor does.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs  |   4 +-
 drivers/gpu/drm/tyr/mmu/irq.rs | 120 ++++++++++++++++++++++++++++++++++++-----
 2 files changed, 108 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 44ff1f522902..1fb91d0757f7 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -82,7 +82,7 @@ pub(crate) struct TyrDrmRegistrationData<'drm> {
 
     // `TyrIrqRegistration::drop()` writes to the GPU registers, so keep this
     // field before the clocks and regulators.
-    _mmu_irq: Pin<KBox<TyrIrqRegistration<'drm, MmuIrq>>>,
+    _mmu_irq: Pin<KBox<TyrIrqRegistration<'drm, MmuIrq<'drm>>>>,
 
     #[pin]
     clks: Mutex<Clocks>,
@@ -155,7 +155,7 @@ fn probe<'bound>(
 
             // SAFETY: The registration ends up in `TyrDrmRegistrationData`, which `_reg`
             // drops at unbind, and every error path before that drops it.
-            let mmu_irq = unsafe { mmu_irq_init(pdev, hw.clone()) }?;
+            let mmu_irq = unsafe { mmu_irq_init(pdev, hw.clone(), &gpu_info) }?;
 
             let firmware = Firmware::new(
                 pdev.as_ref(),
diff --git a/drivers/gpu/drm/tyr/mmu/irq.rs b/drivers/gpu/drm/tyr/mmu/irq.rs
index 7f8b02613e9e..53ff1b2151ee 100644
--- a/drivers/gpu/drm/tyr/mmu/irq.rs
+++ b/drivers/gpu/drm/tyr/mmu/irq.rs
@@ -5,30 +5,61 @@
 //! The MMU IRQ reports page faults and completed commands for each address space.
 
 use kernel::{
-    device::Bound,
-    io::Io,
+    device::{
+        Bound,
+        Device, //
+    },
+    io::{
+        register::Array,
+        Io, //
+    },
+    num::casts::FromSafeCast,
     platform,
     prelude::*,
-    sync::Arc, //
+    sync::{
+        atomic::{
+            ordering,
+            Atomic, //
+        },
+        Arc, //
+    }, //
 };
 
 use crate::{
     driver::IoMem,
+    gpu::GpuInfo,
     irq::{
         TyrIrqRegistration,
         TyrIrqTrait, //
     },
-    regs::mmu_control::{
-        IRQ_CLEAR,
-        IRQ_MASK,
-        IRQ_RAWSTAT,
-        IRQ_STATUS, //
+    regs::{
+        gpu_control::AS_PRESENT,
+        join_u64,
+        mmu_control::{
+            mmu_as_control::{
+                FAULTADDRESS_HI,
+                FAULTADDRESS_LO,
+                FAULTSTATUS, //
+            },
+            IRQ_CLEAR,
+            IRQ_MASK,
+            IRQ_RAWSTAT,
+            IRQ_STATUS, //
+        }, //
     },
     reset::HwGate, //
 };
 
 /// The MMU IRQ, signalling events from the address spaces.
-pub(crate) struct MmuIrq;
+pub(crate) struct MmuIrq<'a> {
+    /// Device used for logging.
+    dev: &'a Device<Bound>,
+    /// Shared gate that coordinates hardware access with GPU reset.
+    hw: Arc<HwGate<'a>>,
+    /// Interrupt sources to unmask: the page-fault bit of each present address
+    /// space that has not faulted yet.
+    mask: Atomic<u32>,
+}
 
 /// Requests a threaded IRQ registration for the MMU IRQ.
 ///
@@ -39,8 +70,14 @@
 pub(crate) unsafe fn mmu_irq_init<'a>(
     pdev: &'a platform::Device<Bound>,
     hw: Arc<HwGate<'a>>,
-) -> Result<Pin<KBox<TyrIrqRegistration<'a, MmuIrq>>>> {
-    let mmu_irq = MmuIrq;
+    gpu_info: &GpuInfo,
+) -> Result<Pin<KBox<TyrIrqRegistration<'a, MmuIrq<'a>>>>> {
+    let present = AS_PRESENT::from_raw(gpu_info.as_present).present().get();
+    let mmu_irq = MmuIrq {
+        dev: pdev.as_ref(),
+        hw: hw.clone(),
+        mask: Atomic::new(IRQ_MASK::zeroed().try_with_page_fault(present)?.into_raw()),
+    };
     // Ensure interrupt sources are disabled until the handler is registered.
     mmu_irq.clear_mask(hw.access().iomem());
 
@@ -48,7 +85,41 @@ pub(crate) unsafe fn mmu_irq_init<'a>(
     unsafe { TyrIrqRegistration::request(pdev, c"mmu", c"tyr-mmu", mmu_irq, hw) }
 }
 
-impl TyrIrqTrait for MmuIrq {
+impl MmuIrq<'_> {
+    /// Logs the page fault reported by address space `as_nr`.
+    fn report_fault(&self, io: &IoMem<'_>, as_nr: usize) -> Result {
+        let fault = io.read(FAULTSTATUS::try_at(as_nr).ok_or(EINVAL)?);
+        let address = join_u64(
+            io.read(FAULTADDRESS_LO::try_at(as_nr).ok_or(EINVAL)?)
+                .into_raw(),
+            io.read(FAULTADDRESS_HI::try_at(as_nr).ok_or(EINVAL)?)
+                .into_raw(),
+        );
+
+        match fault.exception_type() {
+            Ok(exception) => dev_err!(
+                self.dev,
+                "Page fault in AS{} at VA {:#018x}: {:?} on {:?} access, source {:#x}\n",
+                as_nr,
+                address,
+                exception,
+                fault.access_type(),
+                fault.source_id().get()
+            ),
+            Err(_) => dev_err!(
+                self.dev,
+                "Page fault in AS{} at VA {:#018x}: FAULTSTATUS {:#010x}\n",
+                as_nr,
+                address,
+                fault.into_raw()
+            ),
+        }
+
+        Ok(())
+    }
+}
+
+impl TyrIrqTrait for MmuIrq<'_> {
     fn read_status(&self, io: &IoMem<'_>) -> u32 {
         io.read(IRQ_STATUS).into_raw()
     }
@@ -70,8 +141,29 @@ fn clear_status(&self, io: &IoMem<'_>, status: u32) {
     }
 
     fn mask(&self) -> u32 {
-        IRQ_MASK::zeroed().into_raw()
+        self.mask.load(ordering::Relaxed)
     }
 
-    fn handle(&self, _status: u32) {}
+    fn handle(&self, status: u32) {
+        let faults = IRQ_RAWSTAT::from_raw(status).page_fault();
+        let hw_guard = self.hw.access();
+        let io = hw_guard.iomem();
+
+        let mut pending = faults.get();
+        while pending != 0 {
+            // The lowest set bit is the next address space that faulted.
+            let as_nr = usize::from_safe_cast(pending.trailing_zeros());
+            pending &= pending - 1;
+
+            let _ = self.report_fault(io, as_nr);
+        }
+
+        // Nothing resolves these faults yet, and an address space that faulted
+        // can fault again, so stop reporting to avoid storms.
+        let faulted = IRQ_MASK::zeroed().with_page_fault(faults).into_raw();
+        self.mask.store(
+            self.mask.load(ordering::Relaxed) & !faulted,
+            ordering::Relaxed,
+        );
+    }
 }

-- 
2.56.0

