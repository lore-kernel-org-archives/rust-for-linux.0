Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401BE4078C0;
	Wed, 19 Aug 2026 18:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787165219; cv=none; b=f4xWyrEDea3Eb++oPh4hrJpbhUP6Rkznmwrhq8kZPFL+I330CC39DPPiit8MWpy2INclvI+iO8ZLfjfGJiih0ZeBqrTU1/88w20f9RopjLUhsDOFpWor3Sf6BziJc5ZKGdgY21i9CPnGsm8wsBffQMHpMnuBGu16HghQrUC4Jgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787165219; c=relaxed/simple;
	bh=Nmk5Wdp4Onxva3zIfgBiMd/9+KAm2j+BPD5m0/d2jgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vGJrx5IHIsicR5uUBxRfzwCUHhMHhRKUc+9F996vm0ESlM1RVCUDrWy7W5D4zHa6gxeD5e6duNymxMR47qCKZ0yv2/olj5oMyJnMx+4VnRtzyqzdAmPaEV2grNgvuM22lrXLFViWqdUTbJdj/TAJh1cTyBcTYlUjjUny3L7V/+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=behxHfbL; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="behxHfbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1787165210; x=1787424410;
	bh=2ru+gs+Jq83c2A8YgYGC+gq/sq3nKYaz6hANLO97shk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=behxHfbLxvuaXgx5CDAZwzSP/uB9IJGCTYT7IPXDPT6qUVSqd2fs6DaROa77fUyRX
	 xPv9LxxLiVZ0bMPqNtIs3uxfAibOUHmWLlurb9BXA/eoqof57IpC2MUuK5GyMJIw6t
	 uNNIVWMmiYEGbTUBjn6eBVOKyzUDf/d9Wix6OnligON/FIiFfw6Y/tt538lZy8Y8BW
	 8GydTS6dyKyN1CbLUtUlhbzitcLRVcxAwC09LaRElDFykIh62mtDNRxmxJ3/MBdnUw
	 PMNZEXy0vpdsJo243N7SWCrXkeYKUypvAc5QPBfLtWcqxauBQOs24ZEM1IufdnnIJg
	 ZojLWWTARM6Zg==
X-Pm-Submission-Id: 4hQFsh1t4wz1DDWl
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v6 2/3] drm/tyr: add GPU reset infrastructure
Date: Wed, 19 Aug 2026 21:45:40 +0300
Message-ID: <20260819-tyr-reset-impl-v6-2-7b4e1e041fe5@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260819-tyr-reset-impl-v6-0-7b4e1e041fe5@onurozkan.dev>
References: <20260819-tyr-reset-impl-v6-0-7b4e1e041fe5@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Add support for scheduling GPU resets on a dedicated workqueue. Track
the reset state to avoid queueing another reset while one is already
pending or in progress.

Use an SRCU based gate with mutex-protected reader admission to block
hardware accesses while reset work runs and wait for current users
before resetting.

Stop new reset requests during teardown and drain any queued or running
reset work before releasing the device resources.

This is the initial reset infrastructure only. It is not wired to a reset
source yet as those will follow in separate work.

Link: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/28
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 drivers/gpu/drm/tyr/driver.rs        |  41 ++----
 drivers/gpu/drm/tyr/reset.rs         | 249 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tyr/reset/hw_gate.rs |  80 +++++++++++
 drivers/gpu/drm/tyr/tyr.rs           |   1 +
 4 files changed, 343 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 90d6cd988cd2..52b1f16fa405 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -8,7 +8,6 @@
     device::{
         Bound,
         Core,
-        Device,
         DeviceContext, //
     },
     dma::{
@@ -17,13 +16,9 @@
     },
     drm,
     drm::ioctl,
-    io::{
-        poll,
-        Io, //
-    },
     new_mutex,
     of,
-    platform,
+    platform, //
     prelude::*,
     regulator,
     regulator::Regulator,
@@ -33,7 +28,6 @@
         Arc,
         Mutex, //
     },
-    time,
     types::ForLt, //
 };
 
@@ -41,10 +35,10 @@
     file::TyrDrmFileData,
     fw::Firmware,
     gem::BoData,
-    gpu,
     gpu::GpuInfo,
     mmu::Mmu,
-    regs::gpu_control::*, //
+    regs::gpu_control::*,
+    reset, //
 };
 
 pub(crate) type IoMem<'a> = kernel::io::mem::IoMem<'a, SZ_2M>;
@@ -67,6 +61,12 @@ pub(crate) struct TyrDrmRegistrationData<'bound> {
     /// Parent platform device.
     pub(crate) pdev: &'bound platform::Device<Bound>,
 
+    // `ResetHandle::drop()` drains queued/running works and this must happen
+    // before clocks/regulators are dropped. So keep this field before them to
+    // ensure the correct drop order.
+    #[pin]
+    pub(crate) reset: reset::ResetHandle<'bound>,
+
     /// Firmware sections.
     pub(crate) fw: Arc<Firmware<'bound>>,
 
@@ -85,23 +85,6 @@ pub(crate) struct TyrDrmRegistrationData<'bound> {
     pub(crate) gpu_info: GpuInfo,
 }
 
-fn issue_soft_reset(dev: &Device, iomem: &IoMem<'_>) -> Result {
-    // Clear any stale reset IRQ state before issuing a new soft reset.
-    iomem.write_reg(GPU_IRQ_CLEAR::zeroed().with_reset_completed(true));
-
-    iomem.write_reg(GPU_COMMAND::reset(ResetMode::SoftReset));
-
-    poll::read_poll_timeout(
-        || Ok(iomem.read(GPU_IRQ_RAWSTAT)),
-        |status| status.reset_completed(),
-        time::Delta::from_millis(1),
-        time::Delta::from_millis(100),
-    )
-    .inspect_err(|_| dev_err!(dev, "GPU reset failed."))?;
-
-    Ok(())
-}
-
 kernel::of_device_table!(
     OF_TABLE,
     MODULE_OF_TABLE,
@@ -136,8 +119,7 @@ fn probe<'bound>(
 
         let iomem = Arc::new(request.iomap_sized::<SZ_2M>()?, GFP_KERNEL)?;
 
-        issue_soft_reset(pdev.as_ref(), &iomem)?;
-        gpu::l2_power_on(pdev.as_ref(), &iomem)?;
+        reset::run_reset(pdev.as_ref(), &iomem)?;
 
         let gpu_info = GpuInfo::new(&iomem);
         gpu_info.log(pdev.as_ref());
@@ -167,6 +149,9 @@ fn probe<'bound>(
 
         let reg_data = try_pin_init!(TyrDrmRegistrationData {
                 pdev,
+                // SAFETY: `Registration` is stored in the platform driver data and
+                // not leaked, so `ResetHandle` is dropped before borrowed data expires.
+                reset <- unsafe { reset::ResetHandle::new(pdev, iomem.as_arc_borrow())? },
                 fw: firmware,
                 clks <- new_mutex!(Clocks {
                     core: core_clk,
diff --git a/drivers/gpu/drm/tyr/reset.rs b/drivers/gpu/drm/tyr/reset.rs
new file mode 100644
index 000000000000..a41158c7ea21
--- /dev/null
+++ b/drivers/gpu/drm/tyr/reset.rs
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! Provides asynchronous reset handling for the Tyr DRM driver via [`ResetHandle`].
+//!
+//! [`ResetHandle::schedule`] runs reset work on a dedicated ordered
+//! [`ScopedQueue`] and avoids duplicate pending reset requests.
+//!
+//! # High-level Execution Flow
+//!
+//! ```text
+//! +------+  schedule()  +---------+  reset_work()  +------------+
+//! | Idle |------------->| Pending |--------------->| InProgress |
+//! +------+              +---------+                +------------+
+//!    ^                                             |
+//!    |               work complete                 |
+//!    +---------------------------------------------+
+//!
+//! Teardown transitions any state to ShuttingDown, then drains pending and
+//! running work.
+//! ```
+
+mod hw_gate;
+
+use hw_gate::HwGate;
+
+use kernel::{
+    device::{
+        Bound,
+        Device, //
+    },
+    io::{
+        poll,
+        Io, //
+    },
+    platform,
+    prelude::*,
+    sync::{
+        atomic::{
+            Atomic,
+            AtomicType,
+            Full,
+            Release, //
+        },
+        Arc,
+        ArcBorrow, //
+    },
+    time,
+    workqueue::{
+        ScopedQueue,
+        ScopedWork,
+        ScopedWorkItem,
+        ScopedWorkRef, //
+    },
+};
+
+use crate::{
+    driver::IoMem,
+    gpu,
+    regs::gpu_control::*, //
+};
+
+/// Lifecycle state of the reset worker.
+#[derive(Clone, Copy, Debug, PartialEq, Eq)]
+#[repr(i32)]
+enum ResetState {
+    /// Hardware is available and no reset request exists.
+    Idle = 0,
+    /// Reset work item is queued and waiting to be claimed by the worker.
+    Pending = 1,
+    /// Worker has claimed the request and is resetting hardware.
+    InProgress = 2,
+    /// Teardown has started and no new reset request may start.
+    ShuttingDown = 3,
+}
+
+// SAFETY: `ResetState` and `i32` have the same size and alignment, and are
+// round-trip transmutable.
+unsafe impl AtomicType for ResetState {
+    type Repr = i32;
+}
+
+/// Internal reset orchestrator that owns the state, [`HwGate`], and work item.
+#[pin_data]
+struct Controller<'ctrl> {
+    /// Parent platform device.
+    pdev: &'ctrl platform::Device<Bound>,
+    /// Mapped register space needed for reset operations.
+    iomem: Arc<IoMem<'ctrl>>,
+    /// State shared by reset schedulers and the worker.
+    state: Atomic<ResetState>,
+    /// Drains reset-sensitive hardware accesses before a reset.
+    #[pin]
+    hw: HwGate,
+}
+
+impl<'ctrl> ScopedWorkItem for Controller<'ctrl> {
+    fn run(work: &ScopedWorkRef<Self>) {
+        work.reset_work();
+    }
+}
+
+impl<'ctrl> Controller<'ctrl> {
+    /// Creates a reset controller.
+    fn new(
+        pdev: &'ctrl platform::Device<Bound>,
+        iomem: Arc<IoMem<'ctrl>>,
+    ) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            pdev,
+            iomem,
+            state: Atomic::new(ResetState::Idle),
+            hw <- HwGate::new(),
+        })
+    }
+
+    /// Attempts to transition the reset state from `from` to `to`.
+    #[inline]
+    fn try_transition(&self, from: ResetState, to: ResetState) -> bool {
+        self.state.cmpxchg(from, to, Full).is_ok()
+    }
+
+    /// Processes one scheduled reset request.
+    ///
+    /// If the pending reset cannot be claimed, the worker returns immediately.
+    ///
+    /// It first claims [`ResetState::Pending`], then waits for earlier hardware
+    /// accesses to complete before issuing the reset and returning the worker
+    /// state to [`ResetState::Idle`].
+    ///
+    /// Panthor reference:
+    /// - drivers/gpu/drm/panthor/panthor_device.c::panthor_device_reset_work()
+    fn reset_work(&self) {
+        if !self.try_transition(ResetState::Pending, ResetState::InProgress) {
+            return;
+        }
+
+        dev_dbg!(self.pdev, "Starting GPU reset.\n");
+
+        // Wait for current hardware accesses to finish before resetting.
+        let reset_guard = self.hw.close();
+        let reset_result = run_reset(self.pdev.as_ref(), &self.iomem);
+        drop(reset_guard);
+
+        if let Err(e) = reset_result {
+            dev_err!(self.pdev, "GPU reset failed: {:?}\n", e);
+
+            // TODO: Unplug the GPU.
+            // There is no API for unplugging the GPU and this is unreachable
+            // for now since there are no hardware users for reset API.
+        } else {
+            dev_dbg!(self.pdev, "GPU reset completed.\n");
+        }
+
+        let _ = self.try_transition(ResetState::InProgress, ResetState::Idle);
+    }
+}
+
+/// User-facing handle for scheduling resets.
+///
+/// Dropping the handle drains any queued or in-flight reset work before the
+/// [`ScopedQueue`] and the clock and regulator resources are released.
+#[pin_data(PinnedDrop)]
+pub(crate) struct ResetHandle<'reset> {
+    #[pin]
+    controller: ScopedWork<Controller<'reset>>,
+    wq: ScopedQueue<'reset>,
+}
+
+impl<'reset> ResetHandle<'reset> {
+    /// Creates [`ResetHandle`].
+    ///
+    /// # Safety
+    ///
+    /// The returned handle must not be leaked or otherwise prevented from
+    /// running [`Drop`], since it owns work that may borrow from `'reset`.
+    pub(crate) unsafe fn new(
+        pdev: &'reset platform::Device<Bound>,
+        iomem: ArcBorrow<'_, IoMem<'reset>>,
+    ) -> Result<impl PinInit<Self, Error>> {
+        let iomem = iomem.into();
+
+        Ok(try_pin_init!(Self {
+            controller <- kernel::new_scoped_work!("tyr::reset", Controller::new(pdev, iomem)),
+            // SAFETY: The caller guarantees the handle is dropped.
+            wq: unsafe { ScopedQueue::new(c"tyr-reset-wq")? },
+        }))
+    }
+
+    /// Schedules a GPU reset on the dedicated workqueue.
+    ///
+    /// If a reset is already pending or in progress the call is a no-op.
+    #[expect(dead_code)]
+    pub(crate) fn schedule(&'reset self) {
+        // TODO: Similar to `panthor_device_schedule_reset()` in Panthor, add a
+        // power management check once Tyr supports it.
+
+        if self
+            .controller
+            .try_transition(ResetState::Idle, ResetState::Pending)
+        {
+            let _ = self.wq.enqueue(&self.controller);
+        }
+    }
+}
+
+#[pinned_drop]
+impl<'reset> PinnedDrop for ResetHandle<'reset> {
+    fn drop(self: Pin<&mut Self>) {
+        // Stop new reset requests before draining queued/running work.
+        self.controller
+            .state
+            .store(ResetState::ShuttingDown, Release);
+    }
+}
+
+/// Issues a soft reset command and waits for reset-complete IRQ status.
+fn issue_soft_reset(dev: &Device<Bound>, io: &IoMem<'_>) -> Result {
+    // Clear any stale reset-complete IRQ state before issuing a new soft reset.
+    io.write_reg(GPU_IRQ_CLEAR::zeroed().with_reset_completed(true));
+
+    io.write_reg(GPU_COMMAND::reset(ResetMode::SoftReset));
+
+    poll::read_poll_timeout(
+        || Ok(io.read(GPU_IRQ_RAWSTAT)),
+        |status| status.reset_completed(),
+        time::Delta::from_millis(1),
+        time::Delta::from_millis(100),
+    )
+    .inspect_err(|_| dev_err!(dev, "GPU reset timed out."))?;
+
+    Ok(())
+}
+
+/// Runs one synchronous GPU reset pass.
+///
+/// Its visibility is `pub(super)` only so the probe path can run an
+/// initial reset; it is not part of this module's public API.
+///
+/// On success, the GPU is left in a state suitable for reinitialization.
+///
+/// The sequence is as follows:
+///   - Trigger a GPU soft reset.
+///   - Wait for the reset-complete IRQ status.
+///   - Power L2 back on.
+pub(super) fn run_reset(dev: &Device<Bound>, iomem: &IoMem<'_>) -> Result {
+    issue_soft_reset(dev, iomem)?;
+    gpu::l2_power_on(dev, iomem)?;
+    Ok(())
+}
diff --git a/drivers/gpu/drm/tyr/reset/hw_gate.rs b/drivers/gpu/drm/tyr/reset/hw_gate.rs
new file mode 100644
index 000000000000..54754f9fc05f
--- /dev/null
+++ b/drivers/gpu/drm/tyr/reset/hw_gate.rs
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+//! Hardware-access gate for the GPU reset cycle.
+//!
+//! [`HwGate`] uses a mutex and [`Srcu`] to coordinate reset-sensitive hardware
+//! access with reset. Readers hold the mutex while entering SRCU, then release
+//! it before accessing hardware. The reset worker holds the mutex while waiting
+//! for admitted readers and resetting hardware.
+
+use kernel::{
+    prelude::*,
+    sync::{
+        new_mutex,
+        srcu,
+        Mutex,
+        MutexGuard,
+        Srcu, //
+    },
+};
+
+/// Synchronizes GPU hardware access with reset.
+#[pin_data]
+pub(super) struct HwGate {
+    /// Admits readers and is held exclusively while the reset worker owns the
+    /// hardware.
+    #[pin]
+    gate_lock: Mutex<()>,
+    /// Drains readers that entered before the reset worker acquired `gate_lock`.
+    #[pin]
+    srcu: Srcu,
+}
+
+impl HwGate {
+    /// Creates an open hardware-access gate.
+    pub(super) fn new() -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            gate_lock <- new_mutex!(()),
+            srcu <- kernel::new_srcu!(),
+        })
+    }
+
+    /// Enters a reset-sensitive hardware-access section.
+    #[expect(dead_code)]
+    fn access(&self) -> HwAccessGuard<'_> {
+        let gate_lock = self.gate_lock.lock();
+        let srcu = self.srcu.read_lock();
+        drop(gate_lock);
+
+        HwAccessGuard { _srcu: srcu }
+    }
+
+    /// Stops new readers and drains admitted readers for the reset worker.
+    ///
+    /// Callers must serialize write-side access. The reset controller's state
+    /// machine provides that serialization.
+    pub(super) fn close(&self) -> HwClosedGuard<'_> {
+        let gate_lock = self.gate_lock.lock();
+
+        // Holding `gate_lock` prevents new readers from entering SRCU. Readers
+        // admitted before us are enrolled, so wait for their read-side work.
+        self.srcu.synchronize();
+
+        HwClosedGuard {
+            _gate_lock: gate_lock,
+        }
+    }
+}
+
+/// Shared hardware access that blocks reset until dropped.
+#[must_use = "the gate is released when the guard is dropped"]
+struct HwAccessGuard<'a> {
+    _srcu: srcu::Guard<'a>,
+}
+
+/// Exclusive hardware access for the reset worker that blocks new hardware
+/// accesses until dropped.
+#[must_use = "the gate stays closed until the guard is dropped"]
+pub(super) struct HwClosedGuard<'a> {
+    _gate_lock: MutexGuard<'a, ()>,
+}
diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
index 3f6fe5fbeb0f..63873628c843 100644
--- a/drivers/gpu/drm/tyr/tyr.rs
+++ b/drivers/gpu/drm/tyr/tyr.rs
@@ -14,6 +14,7 @@
 mod gpu;
 mod mmu;
 mod regs;
+mod reset;
 mod slot;
 mod vm;
 mod wait;

-- 
2.51.2
