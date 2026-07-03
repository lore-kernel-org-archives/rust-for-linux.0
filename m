Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8F73164D8
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047767; cv=none; b=K/s+VNqjwesZObJ1b+hYL52Wpuzq1B2UTIQhbD1Kv8EOBVUc5W2CjSaWU8AYkOz8BLHwhedxy8mmZDruyq3nVdGn3YuhQYuxbB3lharld/2+RpSX+5Iy6pj59Onfi/jTvNRfx74aA84CkeOgut0yiPBxv1ctDVJrBuaiSkbbpts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047767; c=relaxed/simple;
	bh=R54LIa/e0GfvoMOr4vFlvO/PeWJTlpef3eYto7GOEQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQd0R0SAsdTzJfcO0nGTD2OO28G3bi7+LJYgD/4OZArGTVlE+70/yrx8cIKrl4D+atSmruAypwDc+0L7JLDcAMU4f+NqzbJcvFm1nVjKKJ7Tn4qVplYEhVtg/C68PIkAetYFDwvod6S5lLEnLV1chquh4ReeJ+TEn9+LXDcOip8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=oZeY6et2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="oZeY6et2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso346855e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047763; x=1783652563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzrBSMt8dPWQqcMwBWX8Sd4HpNMx13VLUe+e8u3EBx8=;
        b=oZeY6et2wC4etdwgLa2LlFFTfi+rOAHsZFQSf7xu8SLwh9atIV2F4VdgdTD1A/F/cj
         uZIkkZ+YyJQOvix5ZU2d0TW4FA12o7mjrrSrOMyccltKZY2kS5ks7LrH4D5iQlAp6Ifd
         Do9/rsD+NP4GEcOQt59Dc/XRPH5l4e8oDLEQCTk0jzXNSXTGooNuPZEMi9V0WcL1RwU+
         T+qyFzlhoD0pe1tRWxG5DM2IXoXUBk0Uw1aZSLFORd3PYoRlS/WVod8BVZ5sNJOLr2Nb
         Zcpb9FerU6DN55uaRliTWmTIVOFAIHwybNjW8yhLLYtFGL9F6N4TlrFafac56o1jiZnY
         0P3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047763; x=1783652563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BzrBSMt8dPWQqcMwBWX8Sd4HpNMx13VLUe+e8u3EBx8=;
        b=sfl/wpAkpYRev/K4XWtTbYGoIBQq3yrZrrp/Jxx/eeviTF4cxBb+0S2Vr1eLT5XW1p
         DN+SRgERjHh7nODyolVSXUqKXp/Mx2SH9SGqB2HoAskgftsU97UebjNf/tDMOAyoBX34
         ej0v+Lk8a6WCrNzLGhSppI5iQToTdMdDAc8+C+eqlzN3W7787dAz9iynu4lZzumvxJ45
         +e2oqJXUeCK2OyEMyRTxBNqGuV544l53CL4kQrV/jRmWvGyB+LUn45s/GEcfODc1CMen
         CgbmitYE/P/onN61MvufdWqj0G8tTfZOQJ4zqJsvHjiBRuh39WH8Jpl3iL2x8tPQB7AW
         XkjA==
X-Gm-Message-State: AOJu0YxemI7s33k7E2FiMtsv4Flicos1nDm/60fBoj6MbM70axIZQR9s
	E+Ob73ZRQcNeeUGqQjAvFglUBYihhzU31qqcLjuMX1wA0sog1RBN4SQYTx4UX6P8p+Mt73BD5u2
	TQgCg1oGy
X-Gm-Gg: AfdE7ckR7YFpXhUuXbx7VkHpllxZD4B9STBubjX3BgLfL+c0DFYGpWi/Fq75U6DlKYJ
	GEEW9rw2iQTmg2QkELj6MjYYtZpPu1onFs/FvUCTkEoOtqfbYEL+5y1u+TiMNM7eaZThDusI4P3
	3L8qsruAIT1+8k9SdbkbgMIx39jVVrzUfKumyDBUKxWjwzy4ilDml1etSVTwX3NQp1K2h6iGc+h
	+zlHenBD0O8xx36IZjdJbn4gAacBqrkCN0ovrI+0QdKaPsem2rYjWN1Wl8zGMD1gtVA3vAfHo7x
	CZ0+yNK+stMeFTdykTlP8z8WgbgdyzcWOQbMecKqKGDXD75Wvi2/6gwfCSpmy9/L+Z0m/aPFkUm
	j5e+PT3id4LCuVvryLpWo9kf1CTF1LosPtJq2iOu2+161WmXRKNYOP8PKbbRL12S/5mS1FK7Dpj
	aRgmIkP8bwVvL95gEvEynsFKWH2x+ugmFpqt7TQRjl/tE1G2GQascxhQk6
X-Received: by 2002:a05:600c:8590:b0:493:b55f:bca2 with SMTP id 5b1f17b1804b1-493c2ba4341mr103482155e9.34.1783047763098;
        Thu, 02 Jul 2026 20:02:43 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4a343csm141233875e9.0.2026.07.02.20.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:02:42 -0700 (PDT)
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
Subject: [RFC PATCH v2 08/10] drm/vino: wire CRTC gamma, plane rotation and DDC/CI monitor controls
Date: Fri,  3 Jul 2026 04:02:13 +0100
Message-ID: <20260703030217.2886-9-mike@fireburn.co.uk>
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

Consume the new gamma/rotation/i2c bindings to finish the KMS feature
set the pre-safe-KMS vino driver had:

  - Gamma: enable a 256-entry GAMMA_LUT on the CRTC; cache the ramp from
    the CRTC atomic hooks (set on enable, cleared on disable) and apply
    it in the scanout RGB conversion so a compositor's colour calibration
    reaches the panel.

  - Rotation: create a rotation property on the primary/cursor plane
    (0/180 plus the X/Y reflections the software scanout can do without a
    resample) and honour the plane state's rotation when reading source
    pixels.

  - DDC/CI: register a virtual i2c adapter on the connector whose
    master_xfer tunnels DDC/CI Set-VCP writes (brightness/contrast/DPMS
    power) to the downstream monitor over the dock's monitor-I2C bridge
    (cp::ddc_forward), matching the macOS/Windows agents' per-display
    controls.

All of this stays inert until the dock engages its content-protection
channel (see docs/BLOCKER.md), like the rest of the scanout path.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 drivers/gpu/drm/vino/cp.rs       |  22 ++--
 drivers/gpu/drm/vino/drm_sink.rs | 171 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/vino/vino.rs     |  23 ++++-
 3 files changed, 181 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/vino/cp.rs b/drivers/gpu/drm/vino/cp.rs
index 4d55b96999b0..b84b25ff6e5c 100644
--- a/drivers/gpu/drm/vino/cp.rs
+++ b/drivers/gpu/drm/vino/cp.rs
@@ -151,14 +151,24 @@ pub(super) fn set_mode(counter: u16, t: &Timing) -> Result<KVec<u8>> {
 /// the CP wall), so re-check against a capture once CP engages. The DDC/CI bytes themselves
 /// ([`ddc_ci_set_vcp`]) are standard and verified.
 pub(super) fn ddc_set_vcp(counter: u16, vcp: u8, value: u16) -> Result<KVec<u8>> {
-    let payload = ddc_ci_set_vcp(vcp, value);
-    let mut b = KVec::with_capacity(32, GFP_KERNEL)?;
+    ddc_forward(counter, DDCCI_I2C_ADDR, &ddc_ci_set_vcp(vcp, value))
+}
+
+/// The DDC/CI I2C slave address on the monitor bus.
+pub(super) const DDCCI_I2C_ADDR: u8 = 0x37;
+
+/// CP message tunnelling a raw DDC/CI transaction (`payload`, the bytes a host writes after the
+/// I2C write-address) to the downstream monitor's I2C slave `addr`. Same `id=0x15 sub=0x22`
+/// framing as [`ddc_set_vcp`], with the slave + payload length at off20 and the payload at off22.
+/// This is what the vino I2C adapter forwards for a userspace DDC/CI write (e.g. `ddcutil`).
+pub(super) fn ddc_forward(counter: u16, addr: u8, payload: &[u8]) -> Result<KVec<u8>> {
+    let mut b = KVec::with_capacity(32 + payload.len(), GFP_KERNEL)?;
     header(&mut b, 0x15, 0x22, counter)?;
     pad_to(&mut b, 20)?;
-    // off20: monitor DDC/CI I2C slave (0x37) + DDC/CI payload length.
-    b.extend_from_slice(&[0x37, payload.len() as u8], GFP_KERNEL)?;
-    // off22: the DDC/CI Set-VCP bytes (same off22 convention as the EDID payload).
-    b.extend_from_slice(&payload, GFP_KERNEL)?;
+    // off20: monitor DDC/CI I2C slave + DDC/CI payload length.
+    b.extend_from_slice(&[addr, payload.len() as u8], GFP_KERNEL)?;
+    // off22: the DDC/CI bytes (same off22 convention as the EDID payload).
+    b.extend_from_slice(payload, GFP_KERNEL)?;
     pad_to(&mut b, 32)?;
     Ok(b)
 }
diff --git a/drivers/gpu/drm/vino/drm_sink.rs b/drivers/gpu/drm/vino/drm_sink.rs
index fde52336fcd1..898cfae8fd4f 100644
--- a/drivers/gpu/drm/vino/drm_sink.rs
+++ b/drivers/gpu/drm/vino/drm_sink.rs
@@ -12,19 +12,20 @@
 //! mode object (`VinoCrtc`/`VinoPlane`/`VinoConnector`/`VinoEncoder`) implements the
 //! matching `Driver*` trait rather than hand-assembling a C vtable.
 //!
-//! Not yet ported from the pre-safe-KMS driver (tracked as follow-up, not fabricated
-//! here since the extension points don't exist yet in `kernel::drm::kms`):
-//! - A second display head (the dock's DL3 protocol supports up to 4; only one is
-//!   wired here). `VinoPlane`/`VinoCrtc` hold their state inline rather than behind a
-//!   pointer-identity lookup table, so adding a head is a second `probe()` call away,
-//!   not a redesign.
-//! - CRTC gamma LUT and plane rotation property -- `kernel::drm::kms` doesn't yet expose
-//!   `drm_gamma_lut`/`drm_plane_create_rotation_property`. (The cursor plane *is* wired now:
-//!   `VinoPlane` serves both the primary and a `Type::Cursor` plane, and `atomic_update` forwards
-//!   the cursor bitmap/position to the dock via `cp::cursor_{create,image,move}`.)
-//! - DDC/CI brightness/contrast as connector properties, and the `.detect`/`mode_valid`
-//!   connector hooks (report disconnected until a real EDID arrives; reject
-//!   over-budget modes) -- `DriverConnector` only exposes `get_modes` right now.
+//! Wired onto the safe KMS layer: primary plane (EP08 scanout), a `Type::Cursor` plane (bitmap +
+//! position forwarded via `cp::cursor_{create,image,move}`), a 256-entry CRTC `GAMMA_LUT` (applied
+//! in the scanout), a primary-plane rotation property (0/180 + reflect, applied per source pixel
+//! via `rot_src`), and a DDC/CI virtual I2C adapter ([`VinoI2c`], tunnelling monitor-control writes
+//! to the dock over CP -- brightness/contrast/etc. via `ddcutil`), alongside the DPMS-power VCP the
+//! CRTC hooks already send.
+//!
+//! Not yet ported (needs `kernel::drm::kms` extension points that don't exist yet; not fabricated):
+//! - A second display head (the DL3 protocol supports up to 4; one is wired here).
+//!   `VinoPlane`/`VinoCrtc` hold their state inline, so a head is a second `probe()` call away.
+//! - 90/270 rotation (swaps width/height, unlike the dimension-preserving rotations above).
+//! - DDC/CI *reads* (Get-VCP) -- need the dock's CP reply path; and brightness/contrast as
+//!   *connector properties* (the I2C adapter above is the interface for now).
+//! - The `.detect`/`mode_valid` connector hooks -- `DriverConnector` only exposes `get_modes`.
 //! - Damage-clip bounded conversion (always converts the full frame).
 //!
 //! None of this is reachable on real hardware yet regardless: the dock never engages
@@ -41,6 +42,7 @@
         plane::{self, PlaneAtomicCommit, RawPlaneState as _},
         KmsDriver, ModeConfigGuard, ModeConfigInfo, ModeObject as _, NewKmsDevice, Probing,
     },
+    i2c,
     error::code::EINVAL,
     prelude::*,
     sync::{aref::ARef, new_mutex, Mutex},
@@ -125,6 +127,12 @@ pub(super) struct VinoDrmData {
     /// can reach its cached-EDID slot without needing DRM's mode-object list. Written once,
     /// during single-threaded probe, before the device is registered; read-only thereafter.
     connector: core::sync::atomic::AtomicPtr<VinoConnector>,
+    /// The CRTC's gamma ramp cached from the atomic hook as three 256-entry 8-bit LUTs
+    /// (`[r; 256] ++ [g; 256] ++ [b; 256]`), or `None` for identity. Cached here (not read from
+    /// the CRTC state) because scanout runs in the plane path; it is `Copy`, so the scanout
+    /// snapshots it under the lock and applies it without holding the lock in the pixel loop.
+    #[pin]
+    gamma: Mutex<Option<[u8; 768]>>,
 }
 
 impl VinoDrmData {
@@ -133,9 +141,32 @@ pub(super) fn new(intf: ARef<super::usb::Interface>) -> impl PinInit<Self, Error
             intf,
             cp_link <- new_mutex!(Option::<CpLink>::None),
             connector: core::sync::atomic::AtomicPtr::new(core::ptr::null_mut()),
+            gamma <- new_mutex!(None),
         })
     }
 
+    /// Cache the CRTC's gamma LUT (from `RawCrtcState::gamma_lut`) for the scanout to apply, or
+    /// clear it (identity) with `None`. Each `drm_color_lut` channel is reduced to 8 bits.
+    pub(super) fn update_gamma(&self, lut: Option<&[bindings::drm_color_lut]>) {
+        let cached = lut.map(|entries| {
+            let mut t = [0u8; 768];
+            for i in 0..256 {
+                // Identity past the end of a short LUT.
+                let e = entries.get(i);
+                t[i] = e.map_or(i as u8, |c| (c.red >> 8) as u8);
+                t[256 + i] = e.map_or(i as u8, |c| (c.green >> 8) as u8);
+                t[512 + i] = e.map_or(i as u8, |c| (c.blue >> 8) as u8);
+            }
+            t
+        });
+        *self.gamma.lock() = cached;
+    }
+
+    /// Snapshot the cached gamma LUT for a scanout pass (`Copy`, so no lock is held afterwards).
+    pub(super) fn gamma_snapshot(&self) -> Option<[u8; 768]> {
+        *self.gamma.lock()
+    }
+
     /// Publish the engaged CP session so the KMS callbacks can send runtime CP messages.
     /// Called once by the bring-up work item after the dock acks (`acks > 0`). `wire_seq`/
     /// `counter` are the next free values past the bring-up CP setup.
@@ -302,6 +333,16 @@ fn probe(dev: &NewKmsDevice<'_, Self, Probing>) -> Result {
             None,
             false,
         )?;
+        // Advertise the rotations vino's re-encode handles 1:1 (dimension-preserving): the
+        // scanout applies them per source pixel via `rot_src`. 90/270 (which swap width/height)
+        // are intentionally omitted.
+        primary.create_rotation_property(
+            bindings::DRM_MODE_ROTATE_0,
+            bindings::DRM_MODE_ROTATE_0
+                | bindings::DRM_MODE_ROTATE_180
+                | bindings::DRM_MODE_REFLECT_X
+                | bindings::DRM_MODE_REFLECT_Y,
+        )?;
         let cursor = plane::UnregisteredPlane::<VinoPlane>::new(
             dev,
             1,
@@ -318,6 +359,8 @@ fn probe(dev: &NewKmsDevice<'_, Self, Probing>) -> Result {
             None,
             (),
         )?;
+        // Advertise a 256-entry GAMMA_LUT; the scanout applies it (cached via the CRTC hooks).
+        crtc_obj.enable_gamma(256);
         let enc = encoder::UnregisteredEncoder::<VinoEncoder>::new(
             dev,
             encoder::Type::Virtual,
@@ -372,6 +415,8 @@ fn new(_device: &drm::Device<Self::Driver, drm::Uninit>, _args: &()) -> impl Pin
     fn atomic_enable(commit: CrtcAtomicCommit<'_, Self>) {
         let data: &VinoDrmData = commit.crtc().drm_dev();
         let new = commit.take_new_state();
+        // Cache the gamma ramp for the scanout to apply.
+        data.update_gamma(new.gamma_lut());
         let timing = super::cp::timing_from_drm_mode(new.mode());
         pr_info!(
             "vino: KMS CRTC enable -- display ON, mode {}x{}@{} (scanout begins)\n",
@@ -391,6 +436,7 @@ fn atomic_enable(commit: CrtcAtomicCommit<'_, Self>) {
     /// no-op until CP engages.
     fn atomic_disable(commit: CrtcAtomicCommit<'_, Self>) {
         let data: &VinoDrmData = commit.crtc().drm_dev();
+        data.update_gamma(None);
         let _ = data.set_vcp(super::cp::VCP_POWER_MODE, super::cp::POWER_OFF);
         pr_info!("vino: KMS CRTC disable -- display OFF (scanout stopped)\n");
     }
@@ -489,6 +535,8 @@ fn atomic_update(commit: PlaneAtomicCommit<'_, Self>) {
         // primary plane 1:1 with the virtual output), so this drives the dynamic scanout
         // resolution.
         let (w, h) = (new.crtc_w() as usize, new.crtc_h() as usize);
+        // Plane rotation/reflection (identity unless the compositor set the rotation property).
+        let rotation = new.rotation();
 
         use core::sync::atomic::Ordering::Relaxed;
         // Throttle: while scanout is failing (dock NAKing because CP isn't engaged), skip the
@@ -499,7 +547,7 @@ fn atomic_update(commit: PlaneAtomicCommit<'_, Self>) {
             super::SCANOUT_SKIP.store(skip - 1, Relaxed);
             return;
         }
-        match scanout_one(data, plane, fb, w, h) {
+        match scanout_one(data, plane, fb, rotation, w, h) {
             Ok(()) => {
                 let n = super::SCANOUT_FAILS.swap(0, Relaxed);
                 super::SCANOUT_SKIP.store(0, Relaxed);
@@ -565,6 +613,7 @@ fn scanout_one(
     data: &VinoDrmData,
     plane: &plane::Plane<VinoPlane>,
     fb: &kms::framebuffer::Framebuffer<VinoDrmDriver>,
+    rotation: u32,
     w: usize,
     h: usize,
 ) -> Result {
@@ -577,7 +626,7 @@ fn scanout_one(
     // The real source stride: GEM dumb buffers pad the pitch (alignment), so it is not necessarily
     // `w * 4` -- read it from the framebuffer rather than assuming.
     let pitch = fb.pitch(0) as usize;
-    encode_and_send(data, plane, vmap.as_ptr(), pitch, w, h)
+    encode_and_send(data, plane, vmap.as_ptr(), pitch, rotation, w, h)
 }
 
 /// Encode the mapped frame with the byte-exact Vino WHT **colour** codec and bulk-write the
@@ -591,15 +640,24 @@ fn encode_and_send_wht(
     plane: &plane::Plane<VinoPlane>,
     vaddr: *const u8,
     pitch: usize,
+    rotation: u32,
     w: usize,
     h: usize,
 ) -> Result {
     let seq0 = plane.scanout.lock().seq;
+    let gamma = data.gamma_snapshot();
     let (frames, next_seq) = super::video::wht::colour_frame_ep08(w, h, seq0, |dx, dy| {
-        // SAFETY: `dy*pitch + dx*4 + 3` is within the mapped source framebuffer (`pitch*h` bytes);
-        // the caller (colour_frame_ep08) only invokes this for `dx < w <= pitch/4`, `dy < h`.
-        let px = unsafe { (vaddr.add(dy * pitch + dx * 4) as *const u32).read_unaligned() };
-        (((px >> 16) & 0xff) as u8, ((px >> 8) & 0xff) as u8, (px & 0xff) as u8)
+        // Map the output pixel back to its source pixel under the plane rotation/reflection.
+        let (sx, sy) = rot_src(rotation, dx, dy, w, h);
+        // SAFETY: `sy*pitch + sx*4 + 3` is within the mapped source framebuffer (`pitch*h` bytes);
+        // `rot_src` returns `sx < w <= pitch/4`, `sy < h`.
+        let px = unsafe { (vaddr.add(sy * pitch + sx * 4) as *const u32).read_unaligned() };
+        apply_gamma(
+            &gamma,
+            ((px >> 16) & 0xff) as u8,
+            ((px >> 8) & 0xff) as u8,
+            (px & 0xff) as u8,
+        )
     })?;
     plane.scanout.lock().seq = next_seq;
 
@@ -620,6 +678,7 @@ fn encode_and_send(
     plane: &plane::Plane<VinoPlane>,
     vaddr: *const u8,
     pitch: usize,
+    rotation: u32,
     w: usize,
     h: usize,
 ) -> Result {
@@ -631,8 +690,9 @@ fn encode_and_send(
         && w % super::video::wht::STRIP_W == 0
         && h % super::video::wht::STRIP_H == 0
     {
-        return encode_and_send_wht(data, plane, vaddr, pitch, w, h);
+        return encode_and_send_wht(data, plane, vaddr, pitch, rotation, w, h);
     }
+    let gamma = data.gamma_snapshot();
     let frame = {
         let mut st = plane.scanout.lock();
         // On the first frame `cur` is freshly zeroed, so the whole buffer must be filled.
@@ -650,10 +710,18 @@ fn encode_and_send(
         let ScanoutState { enc, cur, seq, hint, dims: _ } = &mut *st;
         for dy in 0..h {
             for dx in 0..w {
-                // SAFETY: `dy*pitch + dx*4 + 3` is within the mapped source framebuffer
-                // (`pitch*h` bytes); `dx < w <= pitch/4`, `dy < h`.
-                let px = unsafe { (vaddr.add(dy * pitch + dx * 4) as *const u32).read_unaligned() };
-                let (r, g, b) = ((px >> 16) & 0xff, (px >> 8) & 0xff, px & 0xff);
+                // Map the output pixel back to its source pixel under the plane rotation.
+                let (sx, sy) = rot_src(rotation, dx, dy, w, h);
+                // SAFETY: `sy*pitch + sx*4 + 3` is within the mapped source framebuffer
+                // (`pitch*h` bytes); `rot_src` returns `sx < w <= pitch/4`, `sy < h`.
+                let px = unsafe { (vaddr.add(sy * pitch + sx * 4) as *const u32).read_unaligned() };
+                let (r, g, b) = apply_gamma(
+                    &gamma,
+                    ((px >> 16) & 0xff) as u8,
+                    ((px >> 8) & 0xff) as u8,
+                    (px & 0xff) as u8,
+                );
+                let (r, g, b) = (r as u32, g as u32, b as u32);
                 cur[dy * w + dx] = (((r >> 3) << 11) | ((g >> 2) << 5) | (b >> 3)) as u16;
             }
         }
@@ -748,13 +816,62 @@ fn get_modes<'a>(
     }
 }
 
+// ---- DDC/CI I2C adapter -----------------------------------------------------
+
+/// vino's DDC/CI virtual I2C bus: a userspace monitor-control tool (`ddcutil`, the desktop
+/// brightness slider via the I2C DDC path) writes a DDC/CI transaction to the monitor's I2C slave
+/// on this adapter, and vino tunnels it to the downstream monitor over the dock's CP channel
+/// (`cp::ddc_forward`, `id=0x15 sub=0x22`) -- the same monitor-I2C bridge vino's DPMS-power VCP
+/// uses. Writes only for now (Get-VCP reads need the CP reply path); a no-op until CP engages.
+pub(super) struct VinoI2c;
+
+impl i2c::BusController for VinoI2c {
+    type Context = ARef<VinoDrmDevice>;
+
+    fn master_xfer(dev: &ARef<VinoDrmDevice>, msgs: &mut [i2c::Msg]) -> Result<usize> {
+        let data: &VinoDrmData = dev;
+        let mut transferred = 0usize;
+        for msg in msgs.iter() {
+            if msg.addr() != super::cp::DDCCI_I2C_ADDR as u16 {
+                continue;
+            }
+            if msg.is_read() {
+                // DDC/CI reads (Get-VCP) require decoding the dock's CP reply -- not wired yet.
+                continue;
+            }
+            if data
+                .send_cp(0x15, 0, |ctr| {
+                    super::cp::ddc_forward(ctr, super::cp::DDCCI_I2C_ADDR, msg.buf())
+                })
+                .is_ok()
+            {
+                transferred += 1;
+            }
+        }
+        Ok(transferred)
+    }
+
+    fn functionality(_dev: &ARef<VinoDrmDevice>) -> u32 {
+        i2c::FUNC_I2C
+    }
+}
+
+/// Apply the cached gamma ramp (three 256-entry 8-bit LUTs) to an `(r, g, b)` pixel, or return it
+/// unchanged when no gamma is programmed.
+#[inline]
+fn apply_gamma(gamma: &Option<[u8; 768]>, r: u8, g: u8, b: u8) -> (u8, u8, u8) {
+    match gamma {
+        Some(t) => (t[r as usize], t[256 + g as usize], t[512 + b as usize]),
+        None => (r, g, b),
+    }
+}
+
 /// Map an output pixel `(dx, dy)` back to its source-framebuffer pixel `(sx, sy)` under a DRM
 /// plane `rotation` bitmask (`DRM_MODE_ROTATE_*` | `DRM_MODE_REFLECT_*`, the values the
 /// standard `drm_plane_create_rotation_property` exposes). `sw`/`sh` are the SOURCE
 /// (framebuffer) dimensions. Rotation is clockwise; reflection is applied in source space
-/// after rotation. Pure and total (saturating), so it is unit-tested directly ahead of the
-/// rotation property itself being wired up (see the module doc).
-#[allow(dead_code)]
+/// after rotation. Pure and total (saturating), so it is unit-tested directly. Applied per source
+/// pixel in [`encode_and_send`]/[`encode_and_send_wht`] for the plane's rotation property.
 pub(super) fn rot_src(rotation: u32, dx: usize, dy: usize, sw: usize, sh: usize) -> (usize, usize) {
     let xmax = sw.saturating_sub(1);
     let ymax = sh.saturating_sub(1);
diff --git a/drivers/gpu/drm/vino/vino.rs b/drivers/gpu/drm/vino/vino.rs
index eb4378a747c3..fd8d351dd1d9 100644
--- a/drivers/gpu/drm/vino/vino.rs
+++ b/drivers/gpu/drm/vino/vino.rs
@@ -275,6 +275,9 @@ struct VinoDriver {
     /// interface is unbound (otherwise `Interface::as_bound` in `BringUp::run` would
     /// touch an unbound interface). `None` on the idle sibling interface.
     bringup: Option<Arc<BringUp>>,
+    /// The DDC/CI virtual I2C adapter (control interface only), dropped -> `i2c_del_adapter` on
+    /// disconnect. Tunnels userspace DDC/CI writes to the monitor over the dock CP channel.
+    _i2c: Option<Pin<KBox<kernel::i2c::BusAdapter<drm_sink::VinoI2c>>>>,
 }
 
 /// Deferred bring-up work item: the bring-up sequence run on the system workqueue instead
@@ -1995,7 +1998,7 @@ fn probe<'bound>(
                 return Err(ENODEV);
             }
             dev_info!(cdev, "vino: bound D6000 interface {ifnum} (idle -- control is iface 0)\n");
-            return Ok(Self { _intf: intf.into(), _ddev: None, bringup: None });
+            return Ok(Self { _intf: intf.into(), _ddev: None, bringup: None, _i2c: None });
         }
         dev_info!(cdev, "vino: bound DisplayLink D6000 -- plaintext session bring-up\n");
 
@@ -2057,7 +2060,23 @@ fn probe<'bound>(
             }
         };
 
-        Ok(Self { _intf: intf_ref, _ddev: ddev, bringup })
+        // Register the DDC/CI virtual I2C adapter (control interface only), parented to this USB
+        // device, tunnelling userspace DDC/CI writes to the monitor over CP. Non-fatal.
+        let i2c = ddev.as_ref().and_then(|d| {
+            match kernel::i2c::BusAdapter::<drm_sink::VinoI2c>::new(
+                c"DisplayLink DDC/CI",
+                cdev,
+                d.clone(),
+            ) {
+                Ok(a) => Some(a),
+                Err(e) => {
+                    dev_info!(cdev, "vino: DDC/CI I2C adapter registration failed ({e:?})\n");
+                    None
+                }
+            }
+        });
+
+        Ok(Self { _intf: intf_ref, _ddev: ddev, bringup, _i2c: i2c })
     }
 
     fn disconnect<'bound>(intf: &'bound usb::Interface<Core<'_>>, data: Pin<&Self>) {
-- 
2.55.0

