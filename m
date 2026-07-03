Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DF8317177
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047771; cv=none; b=WANQzrjSBuMCkz2hPUuiR8BSfdxFQFmjLM5JSIfGJ5yXS6AmDkHMiyMPmwx9sxCSjlatyh3csbSFuLeTgePMs+GBmlral/9VORU04zUo83+kURiqF2XKdefbXPSEoPpBK5UYboga89uEpi4F+xYSQrz4+xsZVH/zGf67m0evelQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047771; c=relaxed/simple;
	bh=KIx9+mxNiGnfq85XR96lt59hDrEzjOlhDPkNw3cXgRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TvRgG+Sm2JKG6A/pOWi2a3ULATLZmS+7wOVSXLdqcCl1GUO7ifbGh6jAOw7MUuj5d2nCJ9CoK7nMEd0xjUJ6JTdpvYOmOHeXGGSqFfCTRhc0LoRcyjnTeixMPoOBFDHTpM+4KwKnVnTsfwhLCsPf9N52yyJM7TRw+c/QjQzw3G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=iT6CyCOG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="iT6CyCOG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c7902f47so274065e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047767; x=1783652567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4C21vd6TOW9/JoMLq0xfLbPJocFlTioPr7GLhNRTko=;
        b=iT6CyCOG3WEnp+aaFdQ+/hWh1STlBO0V87SH+mmC14Wu7YkT5iJ3v9vAqpWg35HQYi
         L7pHhFXDa5wqLyzy2zeF/0pDD/aCqkMIAOGWoGYKQ0nJxlN7RaK0p0x0mRuVlQPWw3PR
         DXY1F/wSeM1RzsKEKbDJtZ5z8Rbuiq96Z7niw2YpHOmUfB8pNufSqrtbEE0zW57p63+S
         ECrwTBCqstktKV3mFIk+5itoNP593K1GuuPzL25635XTmF6E1FlZav2BEBezItNfG6IC
         7+I4Lxhh/Gbz3bAZRFs9Ps9bYT4LydS9vM70JClQ+v13+EuCg470UVLgoKoclGeIdKtr
         likA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047767; x=1783652567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F4C21vd6TOW9/JoMLq0xfLbPJocFlTioPr7GLhNRTko=;
        b=P+N/93a+SAo7omuwb56ZFOGjiEX9J5jRHHoUugrE7B88n3+Ct6AIcQLY/5v3JdFCpl
         JSbpmanwKRMvBg691VDb737bLOvmhD5bWULQ4CmJOdV5E2J+L2G8G2xAB+cwpwlYNAt2
         n9hvsOqPm9kZHtg+MsENTh7gCCqr3TtPvtfIfXqDIsbIyTRKswRpGvX50f8ZcJJlg5mG
         l3lNFzRsaO2QqvTJR6qFe812x13ryxIcKPkNIfFrWBHnLmwaxsGk/gAZyeTFsWxEtMc2
         O6afazxajNR2/QB3CtLF5UpsRWOjZ9UNc1wGgeFR5MO3vAoWLR8rL4/Yw8w0Lw9lAJKd
         xg7g==
X-Gm-Message-State: AOJu0Yzal9UEL2mI9HqgR3uYpkLLO9vEC45dhq1ecMKKIgIOYvDvbKN7
	Oh+lueLbEUag2b+iX80d6p4DvpHvKf0p9/lLzKh1+wCuV1MVQFIMRDB1F1jnLQTSM3xTPn3JfDT
	BABSdxiTK
X-Gm-Gg: AfdE7clmuavkLz8jg2cd36aOqajfXOfLJVxeExOzn1HIzH6c36SiJ0QXJSEW5BjWAjE
	/I7AYeWymUk3AyYgdpZBgHlns9fphUC22Azm9w1EQQg8JOgX2N1fI6jH+Mkc3+Qls1RiinOpN9w
	J397VGwjdMtEYXxfc7iGlC19A4m6oqrTuDv7O52Sp4DbrlRRSNfHKLRKy4k5emQf+uCF0c+aUZC
	B+pDeRLsF69BhMiu0evNAoJmbQijTrjr2VRAlJFmHc2KD3VkifVF8TzEf737Jvyf246ihB7+ZVX
	kKau9RAqanl0MNqde96JyjSWe4LAv2wIJ3AixK4QOR+8xbVHCHskvlzC7C7ie3A5zhEGC4LYnP3
	B//yhvyK4eXD+PumqAdueHvNkB3wwyEOoZnUjfMx7MUoko5D4zmAqbW/m0Fczd7e0fkH8svee4y
	Ce6iyq5gxYMQnxiiz3fr477/0lec0Ph899Y6XsgcC4dtIb+GScXgB69Zv1
X-Received: by 2002:a05:600d:c:b0:493:b771:ddf9 with SMTP id 5b1f17b1804b1-493c2b3d048mr94277605e9.1.1783047767064;
        Thu, 02 Jul 2026 20:02:47 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4a343csm141233875e9.0.2026.07.02.20.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:02:45 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 10/10] drm/vino: hrtimer-driven software vblank
Date: Fri,  3 Jul 2026 04:02:15 +0100
Message-ID: <20260703030217.2886-11-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030217.2886-1-mike@fireburn.co.uk>
References: <20260617151249.2937-1-mike@fireburn.co.uk>
 <20260703030217.2886-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The atomic helpers were completing every page-flip immediately via
drm_atomic_helper_fake_vblank(), because the CRTC had no vblank support --
so a compositor got no refresh-rate pacing and updates arrived in bursts.

Implement VblankSupport for VinoCrtc backed by a per-CRTC hrtimer that
fires once per frame (from the mode's framedur_ns) and drives
drm_crtc_handle_vblank(). The CRTC now enables/disables vblank around
scanout (drm_crtc_vblank_on/off) and arms the page-flip completion event
to the next vblank in atomic_flush (drm_crtc_arm_vblank_event via the safe
PendingVblankEvent::arm()), so flips are paced to the display's refresh
rate. The timer free-runs once started and is cancelled when the CRTC is
dropped at teardown.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 drivers/gpu/drm/vino/drm_sink.rs | 146 +++++++++++++++++++++++++++++--
 1 file changed, 139 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vino/drm_sink.rs b/drivers/gpu/drm/vino/drm_sink.rs
index ee04a5af9f7d..ce04c8b65461 100644
--- a/drivers/gpu/drm/vino/drm_sink.rs
+++ b/drivers/gpu/drm/vino/drm_sink.rs
@@ -39,21 +39,32 @@
 //! its content-protection channel for vino (see `docs/BLOCKER.md`), so `atomic_update`
 //! never gets past the first `bulk_send`.
 
+use core::sync::atomic::{AtomicBool, AtomicI64, AtomicPtr, Ordering};
 use kernel::{
     bindings, drm,
     drm::kms::{
         self,
         connector::{self, Connector, ConnectorGuard, ModeStatus, Status},
-        crtc::{self, CrtcAtomicCommit, RawCrtc as _, RawCrtcState as _},
+        crtc::{self, AsRawCrtc as _, CrtcAtomicCommit, RawCrtc as _, RawCrtcState as _},
         encoder,
         modes::DisplayMode,
         plane::{self, PlaneAtomicCommit, RawPlaneState as _},
+        vblank::{RawVblankCrtcState as _, VblankGuard, VblankSupport, VblankTimestamp},
         KmsDriver, ModeConfigGuard, ModeConfigInfo, ModeObject as _, NewKmsDevice, Probing,
     },
     i2c,
     error::code::EINVAL,
+    impl_has_hr_timer,
+    interrupt::LocalInterruptDisabled,
     prelude::*,
-    sync::{aref::ARef, new_mutex, Mutex},
+    sync::{aref::ARef, new_mutex, new_spinlock, Arc, ArcBorrow, Mutex, SpinLock},
+    time::{
+        hrtimer::{
+            ArcHrTimerHandle, HrTimer, HrTimerCallback, HrTimerCallbackContext, HrTimerPointer,
+            HrTimerRestart, RelativeMode,
+        },
+        Delta, Monotonic,
+    },
     types::ForLt,
 };
 
@@ -417,11 +428,69 @@ fn probe(dev: &NewKmsDevice<'_, Self, Probing>) -> Result {
 
 // ---- CRTC -----------------------------------------------------------------
 
+/// A software vblank source: an hrtimer that fires once per frame and drives
+/// `drm_crtc_handle_vblank()`, so the atomic helpers pace page-flips against a real vblank
+/// (via `drm_crtc_arm_vblank_event()` in [`VinoCrtc::atomic_flush`]) instead of completing them
+/// immediately with a fake vblank. The timer free-runs once started; `enabled` gates delivery so
+/// DPMS off/on is a flag flip. Cancelled when the owning [`VinoCrtc`] is dropped at teardown.
+#[pin_data]
+pub(super) struct VblankTimer {
+    #[pin]
+    timer: HrTimer<Self>,
+    /// The `drm_crtc` to deliver vblanks to (set when vblank is first enabled).
+    crtc: AtomicPtr<bindings::drm_crtc>,
+    /// One scanout frame in nanoseconds (from the mode's `framedur_ns`).
+    interval_ns: AtomicI64,
+    /// Whether vblanks should currently be delivered (toggled by enable/disable_vblank).
+    enabled: AtomicBool,
+    /// Whether the free-running timer has been started yet.
+    started: AtomicBool,
+}
+
+impl VblankTimer {
+    fn new() -> impl PinInit<Self> {
+        pin_init!(VblankTimer {
+            timer <- HrTimer::new(),
+            crtc: AtomicPtr::new(core::ptr::null_mut()),
+            interval_ns: AtomicI64::new(16_666_666), // ~60 Hz until a mode sets it
+            enabled: AtomicBool::new(false),
+            started: AtomicBool::new(false),
+        })
+    }
+}
+
+impl HrTimerCallback for VblankTimer {
+    type Pointer<'a> = Arc<Self>;
+
+    fn run(this: ArcBorrow<'_, Self>, mut ctx: HrTimerCallbackContext<'_, Self>) -> HrTimerRestart {
+        let crtc = this.crtc.load(Ordering::Relaxed);
+        if !crtc.is_null() && this.enabled.load(Ordering::Relaxed) {
+            // SAFETY: `crtc` is the `drm_crtc` stored in `enable_vblank` while the device is live;
+            // the timer is cancelled (its handle dropped) before the crtc is freed at teardown.
+            unsafe { bindings::drm_crtc_handle_vblank(crtc) };
+        }
+        let interval = this.interval_ns.load(Ordering::Relaxed).max(1_000_000);
+        ctx.forward_now(Delta::from_nanos(interval));
+        HrTimerRestart::Restart
+    }
+}
+
+impl_has_hr_timer! {
+    impl HasHrTimer<Self> for VblankTimer {
+        mode: RelativeMode<Monotonic>, field: self.timer
+    }
+}
+
 #[pin_data]
 pub(super) struct VinoCrtc {
     /// Which display head (0-based) this CRTC drives. Used for diagnostics; the mode-set/DDC CP
     /// messages this CRTC sends are not yet head-differentiated on the wire (see the module doc).
     head: u8,
+    /// The software vblank source for this CRTC.
+    vblank: Arc<VblankTimer>,
+    /// Keeps the timer running; dropping it (at CRTC teardown) cancels the timer.
+    #[pin]
+    vblank_handle: SpinLock<Option<ArcHrTimerHandle<VblankTimer>>>,
 }
 
 #[derive(Clone, Default)]
@@ -436,20 +505,25 @@ impl crtc::DriverCrtc for VinoCrtc {
     type Args = u8;
     type Driver = VinoDrmDriver;
     type State = VinoCrtcState;
-    type VblankImpl = core::marker::PhantomData<Self>;
+    type VblankImpl = Self;
 
     fn new(
         _device: &drm::Device<Self::Driver, drm::Uninit>,
         head: &u8,
     ) -> impl PinInit<Self, Error> {
-        try_pin_init!(VinoCrtc { head: *head })
+        try_pin_init!(VinoCrtc {
+            head: *head,
+            vblank: Arc::pin_init(VblankTimer::new(), GFP_KERNEL)?,
+            vblank_handle <- new_spinlock!(None),
+        })
     }
 
-    /// The display is turning on (scanout begins). Pushes a live mode-set CP message for the
-    /// negotiated mode and brings the monitor out of DPMS standby -- both no-ops until CP
-    /// engages (the wall).
+    /// The display is turning on (scanout begins). Enables vblank pacing, pushes a live mode-set CP
+    /// message for the negotiated mode and brings the monitor out of DPMS standby -- the latter two
+    /// no-ops until CP engages (the wall).
     fn atomic_enable(commit: CrtcAtomicCommit<'_, Self>) {
         let crtc = commit.crtc();
+        crtc.vblank_on();
         let head = crtc.head;
         let data: &VinoDrmData = crtc.drm_dev();
         let new = commit.take_new_state();
@@ -475,12 +549,70 @@ fn atomic_enable(commit: CrtcAtomicCommit<'_, Self>) {
     /// no-op until CP engages.
     fn atomic_disable(commit: CrtcAtomicCommit<'_, Self>) {
         let crtc = commit.crtc();
+        crtc.vblank_off();
         let head = crtc.head;
         let data: &VinoDrmData = crtc.drm_dev();
         data.update_gamma(None);
         let _ = data.set_vcp(super::cp::VCP_POWER_MODE, super::cp::POWER_OFF);
         pr_info!("vino: KMS CRTC disable -- head {head} display OFF (scanout stopped)\n");
     }
+
+    /// Arm the page-flip completion event to be sent by the next vblank tick, so userspace is paced
+    /// to the refresh rate rather than signalled immediately.
+    fn atomic_flush(commit: CrtcAtomicCommit<'_, Self>) {
+        let crtc = commit.crtc();
+        let mut new = commit.take_new_state();
+        if let Some(pending) = new.get_pending_vblank_event() {
+            match crtc.vblank_get() {
+                Ok(vbl_ref) => pending.arm(vbl_ref),
+                // Vblank couldn't be enabled (e.g. mid-teardown): fall back to sending now.
+                Err(_) => pending.send(),
+            }
+        }
+    }
+}
+
+impl VblankSupport for VinoCrtc {
+    type Crtc = VinoCrtc;
+
+    fn enable_vblank(
+        crtc: &crtc::Crtc<Self::Crtc>,
+        vblank_guard: &VblankGuard<'_, Self::Crtc>,
+        _irq: &LocalInterruptDisabled,
+    ) -> Result {
+        let data: &VinoCrtc = crtc;
+        // Track the mode's real frame duration so the tick matches the negotiated refresh rate.
+        let fd = vblank_guard.frame_duration();
+        if fd > 0 {
+            data.vblank.interval_ns.store(fd as i64, Ordering::Relaxed);
+        }
+        data.vblank.crtc.store(crtc.as_raw(), Ordering::Relaxed);
+        data.vblank.enabled.store(true, Ordering::Relaxed);
+        // Start the free-running timer the first time vblank is enabled.
+        if !data.vblank.started.swap(true, Ordering::Relaxed) {
+            let interval = data.vblank.interval_ns.load(Ordering::Relaxed);
+            let handle = data.vblank.clone().start(Delta::from_nanos(interval));
+            *data.vblank_handle.lock() = Some(handle);
+        }
+        Ok(())
+    }
+
+    fn disable_vblank(
+        crtc: &crtc::Crtc<Self::Crtc>,
+        _vblank_guard: &VblankGuard<'_, Self::Crtc>,
+        _irq: &LocalInterruptDisabled,
+    ) {
+        let data: &VinoCrtc = crtc;
+        data.vblank.enabled.store(false, Ordering::Relaxed);
+    }
+
+    fn get_vblank_timestamp(
+        _crtc: &crtc::Crtc<Self::Crtc>,
+        _in_vblank_irq: bool,
+    ) -> Option<VblankTimestamp> {
+        // Let DRM estimate the timestamp from the mode timings.
+        None
+    }
 }
 
 // ---- Planes: primary (scanout) + cursor -------------------------------------
-- 
2.55.0

