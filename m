Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83262F7F06
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709192; cv=none; b=a0j2KmMuKmpWwKyHQ43d4XaKRf4DfSRnR1L4cQm1L+/K7BueLAR69St0xMHsutrAt+2tIScUBh+OvKOkJWtXsx1SEodX+Uukljj29Hl54YFfzv+y1cWOUufuXiN3w9YmkbS4MMy+xnjGW7pbfNmmLXx+7mcTlMdPed4bU91ySeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709192; c=relaxed/simple;
	bh=g8rR1tAx+wpdLl/RssAUxa539KDkU0H8uHNNfPr/rwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NB2m9UnIFTkEKrWjYDd5rARj+66a0B8ylaiXWU0AAEJ2J/d8cE96mzYUPthOfTqV5w3yjXmEKdz0CEM+Q5PcXq2C827Lmk6uIkeHPpva/d8onpd1K/dZ1UMxqiLJ2NkTkzoZBmP1dEnt4VotUvEHnGLMW1SZFsHcEfC/cL9nbFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=BOj6/Sp7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="BOj6/Sp7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4908b92904fso73157135e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781709186; x=1782313986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLYEsvco7uMveyuSmAbd8CEHAljzHdNr5d0PJPqq0Nc=;
        b=BOj6/Sp7qDnXgtdN4lwvIwPpGE0Vi2uU8MONJ/oL/+QevBjnuyruLfjxZ8tC9/sBG4
         7B1mSUVWOJyjEIlRz4+kgW5y3J7gcx2aZ/TGU7l1GgvVKoe/shGxIC0qBRlPs0FhKIeI
         EgyQ5lfErTeWScoIgeWa0Z0nEmGPKwyRT5bxZYnklFl9RuFVGJJhvO5en/SV5rCoMrRF
         wVo2jL1U/15QwrZWyLFcLn5TviX8/A7FB7ntzdt/+3DSzvEbeimDLIaQu2NxmsJvOgSm
         V81h6qd6oVRnDZ8Ke2WRE96gkXESZHzX9vI/FBSDCJRTHMAlwdDd7d7D4WWIySbj2w5L
         Hleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781709186; x=1782313986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RLYEsvco7uMveyuSmAbd8CEHAljzHdNr5d0PJPqq0Nc=;
        b=eMAp3cFR/TdL4kNP85ptl7HX5qAsAECHV066bvtnESROiToGcVRPTtaB8LmjbYaAxQ
         k8Pz7jFpiTPVbV7VqAsBCFpv6IxbYF98o/xkiRL4iRYoacJYbricxQabSj3Vq5R7mw3c
         EVvVNqg7C3XQWrJ4Dwk0+xU6eTRcGf0j0V/Z4UzQ7qQBqSk1bMOZL4fkIpyWefdP6oqZ
         THSoGdN8ek/iSSYuMZ0j1cyN1PjrDLDiXKFvBOmtS7O28qTv/BWPT15+2Eu4P+qMyARR
         DFq0bcdOIeG1gXPXcSccHnBjBQtKQNnGByX5kkG9jvjdBU9pcC4YiotMBS+HZ8QR5a2i
         c1mQ==
X-Forwarded-Encrypted: i=1; AFNElJ8l0hMYh0Sjv6eo8KwXi7u2cy/cqSGKjmwuPquHGxcohohkAl5vWYt5arcIT1Loc1XYZSWXDt17CTBeJNZ6/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0EasNSO2aVcFzjPj+qs1BalSLPk085RjRBcXFVpehbBUQ535I
	t+orx8Z9fWWEAdFvLNI2xwcJURa5g/LKGouLukJxl0l2Tdlx/pzbgx8vqegAh3r9MQ==
X-Gm-Gg: Acq92OHNcC8GwpVk3zi23QR3GWRaaiCjuWMxFPZ2wWDEy1pefOuX6JngFm3iQM+ECX5
	S9XI2QakGw6PIclFYCFON+Vx1HWa8tASeJYyO+5OhWuBzsOLB/6NYhF2i68KaJ2oqgHBrrjSPMk
	1qGCy8jU1FBvnV69iOeMmm2xMGU8l/W7jlXhlVmtIsi4ftwnOJHnXInj7U1uu+MsX/OntanDlw/
	Pf5Kr2fkCvJAgL4VARXH02YPM+U+3H1Jt4oLYp5F/DPtj6ScHwQc90fv6Hzc8bwwKp4gYqdipvI
	PwRDU0xMU6fQpE8rerM9D+kEDY1aTjjJJz+XcHY2tCg3DMwA6hFkc6UkwiQi2o4N9vA3c3XdyUM
	jpDz/SgOr/Ik9KPh7qdby87RcFTAKh25DfT2+Ssd2eSGjHnoaPeJSQYfH2SFyzUBwBqixIsRxCB
	eIpfD6wctCMP2gMW9i9F4/l0mXlp+UwkDcG90fvAJH1vkVyFx09T97aZ0s
X-Received: by 2002:a05:600c:4755:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-4923413c296mr57010095e9.33.1781709185988;
        Wed, 17 Jun 2026 08:13:05 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a9a399sm151019305e9.14.2026.06.17.08.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:13:05 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	rust-for-linux@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 6/7] drm/vino: add DDC/CI brightness/contrast, DPMS power and DFU info
Date: Wed, 17 Jun 2026 16:12:43 +0100
Message-ID: <20260617151249.2937-7-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617151249.2937-1-mike@fireburn.co.uk>
References: <20260617151249.2937-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add monitor controls that ride the same control plane:

 - DDC/CI Set-VCP builders (cp): brightness (VCP 0x10), contrast (0x12)
   and power mode (0xD6), tunnelled to the downstream monitor's I2C slave
   0x37 over the dock's monitor-I2C bridge;
 - DRM connector range properties (drm_sink): a 0..=100 brightness and
   contrast property per connector, whose atomic_set_property callback
   pushes a DDC/CI Set-VCP write to the monitor;
 - DPMS power (drm_sink): the CRTC enable/disable hooks emit VCP 0xD6
   on/off so a blanked output drops the monitor to standby instead of
   freezing the last frame.

All are no-ops until the CP cipher engages (the open blocker), so they
are inert on current hardware but correct by construction (the DDC/CI
payloads are unit-tested against the VESA MCCS worked examples).

Also query the dock's DFU device info at bring-up (firmware version,
customer/board id) -- device-level vendor reads independent of the CP
channel, useful for diagnostics and confirming the dock firmware
revision.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 drivers/gpu/drm/vino/cp.rs       |  51 +++++++++++
 drivers/gpu/drm/vino/drm_sink.rs | 141 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/vino/vino.rs     |  18 ++++
 3 files changed, 206 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vino/cp.rs b/drivers/gpu/drm/vino/cp.rs
index 2668931d8500..be2bdcf5557c 100644
--- a/drivers/gpu/drm/vino/cp.rs
+++ b/drivers/gpu/drm/vino/cp.rs
@@ -112,6 +112,57 @@ pub(super) fn set_mode(counter: u16, t: &Timing) -> Result<KVec<u8>> {
     Ok(b)
 }
 
+/// Standard VESA MCCS (Monitor Control Command Set 2.2) VCP feature codes, driven over
+/// DDC/CI. The macOS DisplayLink agent exposes these as per-display brightness/contrast
+/// ("Popover did show -- starting DDC/CI communication", `setBrightness`/`setContrast`); the
+/// dock bridges the DDC/CI transaction to the downstream monitor's I2C slave 0x37 -- the same
+/// monitor-I2C path the EDID read ([`get_edid_req`]) uses for the 0x50 EDID slave.
+pub(super) const VCP_BRIGHTNESS: u8 = 0x10;
+pub(super) const VCP_CONTRAST: u8 = 0x12;
+/// VCP 0xD6 "Power mode": value 0x01 = on, 0x04 = off (DPMS-off / hard standby). Lets DPMS
+/// blank the panel backlight instead of freezing the last frame (see [`crtc_atomic_disable`]).
+pub(super) const VCP_POWER_MODE: u8 = 0xd6;
+pub(super) const POWER_ON: u16 = 0x01;
+pub(super) const POWER_OFF: u16 = 0x04;
+
+/// Build a DDC/CI "Set VCP Feature" request: the 7 bytes a DDC/CI host writes to the
+/// monitor's I2C slave 0x37, after the 0x6e (= 0x37<<1) write address (VESA DDC/CI 1.1
+/// sec 4.4). Layout: source 0x51, length `0x80 | 4`, opcode 0x03 (Set VCP), VCP code,
+/// value-hi, value-lo, then an XOR checksum seeded with the destination address 0x6e. Pure
+/// and fully standard, so it is unit-tested byte-exact against the spec
+/// ([`super::tests::ddc_ci_set_vcp_checksum`]).
+pub(super) fn ddc_ci_set_vcp(vcp: u8, value: u16) -> [u8; 7] {
+    let body = [0x51u8, 0x84, 0x03, vcp, (value >> 8) as u8, value as u8];
+    let mut chk = 0x6eu8; // checksum seed = destination slave-write address (0x37 << 1)
+    for &x in &body {
+        chk ^= x;
+    }
+    [body[0], body[1], body[2], body[3], body[4], body[5], chk]
+}
+
+/// CP message that tunnels a DDC/CI Set-VCP write to the downstream monitor -- the brightness,
+/// contrast and DPMS-power controls the macOS/Windows agents drive over "DDC/CI communication".
+/// The dock's monitor-I2C bridge is the same one the EDID read uses, so this is modelled as the
+/// WRITE companion to the `0x15/0x21` EDID read: `id=0x15 sub=0x22`, carrying the I2C slave
+/// (0x37) + payload length at off20 and the 7-byte DDC/CI Set-VCP payload at off22.
+///
+/// The `id`/`sub` and payload offset are **inferred** from the EDID-read pairing -- the write
+/// transaction was never captured (it only fires once a monitor is actively driven, i.e. past
+/// the CP wall), so re-check against a capture once CP engages. The DDC/CI bytes themselves
+/// ([`ddc_ci_set_vcp`]) are standard and verified.
+pub(super) fn ddc_set_vcp(counter: u16, vcp: u8, value: u16) -> Result<KVec<u8>> {
+    let payload = ddc_ci_set_vcp(vcp, value);
+    let mut b = KVec::with_capacity(32, GFP_KERNEL)?;
+    header(&mut b, 0x15, 0x22, counter)?;
+    pad_to(&mut b, 20)?;
+    // off20: monitor DDC/CI I2C slave (0x37) + DDC/CI payload length.
+    b.extend_from_slice(&[0x37, payload.len() as u8], GFP_KERNEL)?;
+    // off22: the DDC/CI Set-VCP bytes (same off22 convention as the EDID payload).
+    b.extend_from_slice(&payload, GFP_KERNEL)?;
+    pad_to(&mut b, 32)?;
+    Ok(b)
+}
+
 /// EDID base-block sanity check: length, the `00 FF..FF 00` magic, and the 1-byte
 /// checksum (all 128 base bytes sum to 0 mod 256). A corrupt blob must never drive a
 /// mode-set, so [`timing_from_edid`] rejects anything that fails this.
diff --git a/drivers/gpu/drm/vino/drm_sink.rs b/drivers/gpu/drm/vino/drm_sink.rs
index afbf883fba36..bcc871958a8a 100644
--- a/drivers/gpu/drm/vino/drm_sink.rs
+++ b/drivers/gpu/drm/vino/drm_sink.rs
@@ -129,6 +129,11 @@ pub(super) struct Head {
     /// One-shot: this head's cursor `create` (sprite dimensions) was sent before its first
     /// image upload (per head -- the global one would skip head 1's create).
     cursor_primed: core::sync::atomic::AtomicBool,
+    /// Last DDC/CI brightness/contrast (0..=100) set on this head's monitor via the connector
+    /// properties; replayed on DPMS-on. Stored here (not in connector state) because DDC/CI is
+    /// a side-band action on the physical monitor, not part of the atomic scanout pipeline.
+    brightness: core::sync::atomic::AtomicU32,
+    contrast: core::sync::atomic::AtomicU32,
     #[pin]
     scanout: Mutex<ScanoutState>,
     /// This head's downstream-monitor EDID (`None` until the CP channel delivers it). Only
@@ -167,6 +172,8 @@ fn z<T>() -> impl PinInit<Opaque<T>, Error> {
         try_pin_init!(Self {
             index,
             cursor_primed: core::sync::atomic::AtomicBool::new(false),
+            brightness: core::sync::atomic::AtomicU32::new(100),
+            contrast: core::sync::atomic::AtomicU32::new(100),
             scanout <- new_mutex!(ScanoutState {
                 enc: None,
                 cur: VVec::new(),
@@ -239,6 +246,12 @@ pub(super) struct VinoDrmData {
     encoder_funcs: Opaque<bindings::drm_encoder_funcs>,
     #[pin]
     mode_cfg_funcs: Opaque<bindings::drm_mode_config_funcs>,
+    /// The custom 0..=100 connector range properties for DDC/CI brightness/contrast, created
+    /// and attached in [`kms_init`]. Stored so the connector `atomic_set_property` /
+    /// `atomic_get_property` callbacks can identify them by pointer. Written once during
+    /// single-threaded probe, read-only thereafter (`AtomicPtr` for `Sync` without `unsafe`).
+    brightness_prop: core::sync::atomic::AtomicPtr<bindings::drm_property>,
+    contrast_prop: core::sync::atomic::AtomicPtr<bindings::drm_property>,
 }
 
 // SAFETY: the embedded C KMS objects are written only during single-threaded
@@ -278,6 +291,8 @@ fn z<T>() -> impl PinInit<Opaque<T>, Error> {
             cursor_helper <- z(),
             encoder_funcs <- z(),
             mode_cfg_funcs <- z(),
+            brightness_prop: core::sync::atomic::AtomicPtr::new(ptr::null_mut()),
+            contrast_prop: core::sync::atomic::AtomicPtr::new(ptr::null_mut()),
         })
     }
 
@@ -365,6 +380,14 @@ pub(super) fn send_cp(
         link.counter = link.counter.wrapping_add(1);
         Ok(())
     }
+
+    /// Push a DDC/CI Set-VCP write to a head's downstream monitor (brightness, contrast or
+    /// DPMS power). Wraps [`super::cp::ddc_set_vcp`] (`id=0x15`); a no-op until the cipher is
+    /// engaged. Used by the brightness/contrast connector properties and by DPMS in the CRTC
+    /// enable/disable callbacks.
+    pub(super) fn set_vcp(&self, head_index: u8, vcp: u8, value: u16) -> Result {
+        self.send_cp(head_index, 0x15, 0, |ctr| super::cp::ddc_set_vcp(ctr, vcp, value))
+    }
 }
 
 /// GEM object inner data. Empty: the shmem-backed `drm::gem::shmem::Object` (which
@@ -637,6 +660,11 @@ fn install_edid(connector: *mut bindings::drm_connector, blob: &[u8]) -> i32 {
     if let Err(e) = data.send_cp(head.index, 0x48, 16, |ctr| super::cp::set_mode(ctr, &timing)) {
         pr_warn!("vino: head{} runtime mode-set send failed ({e:?})\n", head.index);
     }
+    // Bring the monitor out of DPMS standby (DDC/CI VCP 0xD6 = on). Inferred wire (see
+    // `cp::ddc_set_vcp`); a no-op until CP engages, and re-applies the user's brightness.
+    let _ = data.set_vcp(head.index, super::cp::VCP_POWER_MODE, super::cp::POWER_ON);
+    let b = head.brightness.load(core::sync::atomic::Ordering::Relaxed);
+    let _ = data.set_vcp(head.index, super::cp::VCP_BRIGHTNESS, b as u16);
 }
 
 /// CRTC `.atomic_disable`: the display is turning off.
@@ -646,10 +674,12 @@ fn install_edid(connector: *mut bindings::drm_connector, blob: &[u8]) -> i32 {
 /// re-enable (DPMS-on) re-inits the encoder and sends a **full keyframe** rather than diffing
 /// against a shadow the dock may have dropped while blanked, and re-uploads the cursor sprite.
 ///
-/// The dock holds the last frame when video stops (it has its own scanout buffer), so the
-/// monitor freezes the last image rather than going black; a true backlight-standby would need
-/// a dock power command that is not decoded (DLM's `Standby`/`Suspend`/`TempPowerOff` are
-/// internal, vtable-dispatched events with no wire frame -- the same dead-end as gamma).
+/// The dock holds the last frame when video stops (it has its own scanout buffer), so video
+/// alone freezes the last image rather than going black. To actually blank the panel we send a
+/// DDC/CI power-off (VCP 0xD6 = off) to the monitor over the same monitor-I2C bridge the EDID
+/// read uses -- the standard MCCS power control the macOS/Windows agents drive (DLM's
+/// `Standby`/`Suspend`/`TempPowerOff` are the host-internal names for it). Inferred wire (see
+/// [`super::cp::ddc_set_vcp`]); a no-op until CP engages.
 unsafe extern "C" fn crtc_atomic_disable(
     crtc: *mut bindings::drm_crtc,
     _state: *mut bindings::drm_atomic_commit,
@@ -671,6 +701,10 @@ fn install_edid(connector: *mut bindings::drm_connector, blob: &[u8]) -> i32 {
     }
     head.cursor_primed
         .store(false, core::sync::atomic::Ordering::SeqCst);
+    // DPMS-off: blank the monitor backlight via DDC/CI (VCP 0xD6 = off) rather than leaving
+    // the last frame frozen on the panel. Inferred wire (see `cp::ddc_set_vcp`); no-op until
+    // CP engages.
+    let _ = data.set_vcp(head.index, super::cp::VCP_POWER_MODE, super::cp::POWER_OFF);
     pr_info!("vino: KMS CRTC disable -- head{} display OFF (scanout stopped)\n", head.index);
 }
 
@@ -1182,6 +1216,9 @@ pub(super) fn kms_init<C: drm::DeviceContext>(
             Some(bindings::drm_atomic_helper_connector_duplicate_state);
         (*cf).atomic_destroy_state =
             Some(bindings::drm_atomic_helper_connector_destroy_state);
+        // Custom DDC/CI brightness/contrast properties (see `connector_atomic_set_property`).
+        (*cf).atomic_set_property = Some(connector_atomic_set_property);
+        (*cf).atomic_get_property = Some(connector_atomic_get_property);
         (*data.conn_helper.get()).get_modes = Some(get_modes);
         // Prune any single mode above the per-head pixel-clock ceiling (~4K@60).
         (*data.conn_helper.get()).mode_valid = Some(mode_valid);
@@ -1216,6 +1253,26 @@ pub(super) fn kms_init<C: drm::DeviceContext>(
         (*data.encoder_funcs.get()).destroy = Some(bindings::drm_encoder_cleanup);
 
         // Build each head's objects (connector + primary/cursor planes + CRTC + encoder).
+        // DDC/CI brightness/contrast: one 0..=100 range property each, created on the device
+        // and attached to every connector in `build_head`. Non-fatal: a NULL property just
+        // means the knob is absent (kept in the AtomicPtr as NULL, ignored by the callbacks).
+        let bp = bindings::drm_property_create_range(
+            raw,
+            0,
+            c"brightness".as_ptr().cast(),
+            0,
+            100,
+        );
+        data.brightness_prop.store(bp, core::sync::atomic::Ordering::Relaxed);
+        let cp = bindings::drm_property_create_range(
+            raw,
+            0,
+            c"contrast".as_ptr().cast(),
+            0,
+            100,
+        );
+        data.contrast_prop.store(cp, core::sync::atomic::Ordering::Relaxed);
+
         for head in data.heads() {
             build_head(raw, data, head)?;
         }
@@ -1322,10 +1379,86 @@ unsafe fn build_head(raw: *mut bindings::drm_device, data: &VinoDrmData, head: &
         if rc != 0 {
             pr_warn!("vino: head{} rotation property unavailable ({rc})\n", head.index);
         }
+
+        // Attach the shared DDC/CI brightness/contrast properties to this connector, each at
+        // its default of 100 (= no attenuation). The callbacks store the value per head and
+        // fire the DDC/CI write (see `connector_atomic_set_property`).
+        let bp = data.brightness_prop.load(core::sync::atomic::Ordering::Relaxed);
+        if !bp.is_null() {
+            bindings::drm_object_attach_property(&mut (*conn).base, bp, 100);
+        }
+        let cp = data.contrast_prop.load(core::sync::atomic::Ordering::Relaxed);
+        if !cp.is_null() {
+            bindings::drm_object_attach_property(&mut (*conn).base, cp, 100);
+        }
     }
     Ok(())
 }
 
+/// Connector `.atomic_set_property`: handle the custom DDC/CI brightness/contrast properties
+/// (the standard properties are handled by the DRM core, which never calls us for them). On a
+/// value change we store it on the head and immediately push a DDC/CI Set-VCP write to the
+/// monitor -- DDC/CI is a side-band action on the physical panel, not part of the atomic
+/// scanout state, so it is applied here rather than threaded through connector state. Returns
+/// `-EINVAL` for any other property so the core reports it as unknown.
+unsafe extern "C" fn connector_atomic_set_property(
+    connector: *mut bindings::drm_connector,
+    _state: *mut bindings::drm_connector_state,
+    property: *mut bindings::drm_property,
+    val: u64,
+) -> i32 {
+    // SAFETY: `connector` is a valid connector embedded in our DRM device-private.
+    let dev = unsafe { (*connector).dev };
+    // SAFETY: `dev` is our live, registered drm_device.
+    let data: &VinoDrmData = unsafe { VinoDrmDevice::from_raw(dev) };
+    let Some(head) = data.head_by_connector(connector) else {
+        return EINVAL.to_errno();
+    };
+    let bp = data.brightness_prop.load(core::sync::atomic::Ordering::Relaxed);
+    let cp = data.contrast_prop.load(core::sync::atomic::Ordering::Relaxed);
+    let v = val.min(100) as u32;
+    let (slot, vcp) = if property == bp && !bp.is_null() {
+        (&head.brightness, super::cp::VCP_BRIGHTNESS)
+    } else if property == cp && !cp.is_null() {
+        (&head.contrast, super::cp::VCP_CONTRAST)
+    } else {
+        return EINVAL.to_errno();
+    };
+    if slot.swap(v, core::sync::atomic::Ordering::Relaxed) != v {
+        let _ = data.set_vcp(head.index, vcp, v as u16);
+    }
+    0
+}
+
+/// Connector `.atomic_get_property`: read back the stored DDC/CI brightness/contrast (the
+/// values round-trip through the head atomics set by [`connector_atomic_set_property`]).
+unsafe extern "C" fn connector_atomic_get_property(
+    connector: *mut bindings::drm_connector,
+    _state: *const bindings::drm_connector_state,
+    property: *mut bindings::drm_property,
+    val: *mut u64,
+) -> i32 {
+    // SAFETY: `connector` is a valid connector embedded in our DRM device-private.
+    let dev = unsafe { (*connector).dev };
+    // SAFETY: `dev` is our live, registered drm_device.
+    let data: &VinoDrmData = unsafe { VinoDrmDevice::from_raw(dev) };
+    let Some(head) = data.head_by_connector(connector) else {
+        return EINVAL.to_errno();
+    };
+    let bp = data.brightness_prop.load(core::sync::atomic::Ordering::Relaxed);
+    let cp = data.contrast_prop.load(core::sync::atomic::Ordering::Relaxed);
+    let slot = if property == bp && !bp.is_null() {
+        &head.brightness
+    } else if property == cp && !cp.is_null() {
+        &head.contrast
+    } else {
+        return EINVAL.to_errno();
+    };
+    // SAFETY: the DRM core passes a valid `*mut u64` output pointer.
+    unsafe { *val = slot.load(core::sync::atomic::Ordering::Relaxed) as u64 };
+    0
+}
+
 /// Thin wrapper so the `unsafe` block above reads cleanly.
 unsafe fn drm_mode_config_reset(raw: *mut bindings::drm_device) {
     // SAFETY: `raw` is a valid drm_device with mode_config initialised.
diff --git a/drivers/gpu/drm/vino/vino.rs b/drivers/gpu/drm/vino/vino.rs
index 1091dcc992c7..ee63ce7e4625 100644
--- a/drivers/gpu/drm/vino/vino.rs
+++ b/drivers/gpu/drm/vino/vino.rs
@@ -385,6 +385,24 @@ fn bring_up(dev: &usb::Device) -> Result {
             Ok(()) => pr_info!("vino: step device-open 0xfc(iface1) OK = {:02x?}\n", probe3),
             Err(e) => pr_info!("vino: step device-open 0xfc(iface1) non-fatal ({e:?})\n"),
         }
+        // DFU firmware-version query, matching DLM / the macOS+Windows drivers'
+        // DfuGetVmmDeviceFirmwareVersion: vendor IN bmRequestType=0xc1 bRequest=0xfd wIndex=1,
+        // a 6-byte version blob (the reference driver's request-size table: 0xfb=4 customer/board,
+        // 0xfc=3 device-type, 0xfd=6 firmware-version, 0xfe=16 descriptor). This is a device-level
+        // DFU read, independent of the CP channel, so it works regardless of CP engagement -- handy
+        // for diagnostics and confirming the dock firmware revision.
+        let mut fw_ver = [0u8; 6];
+        match dev.control_recv(0xfd, VENDOR_IN_IFACE, 0, 1, &mut fw_ver, timeout()) {
+            Ok(()) => pr_info!("vino: dock DFU firmware version = {:02x?}\n", fw_ver),
+            Err(e) => pr_info!("vino: device-open 0xfd(firmware-version) non-fatal ({e:?})\n"),
+        }
+        // DFU customer/board id (DfuGetVmmDeviceCustomerAndBoardId): bRequest=0xfb, 4-byte blob.
+        let mut cust_board = [0u8; 4];
+        match dev.control_recv(0xfb, VENDOR_IN_IFACE, 0, 1, &mut cust_board, timeout()) {
+            Ok(()) => pr_info!("vino: dock DFU customer/board id = {:02x?}\n", cust_board),
+            Err(e) => pr_info!("vino: device-open 0xfb(customer/board) non-fatal ({e:?})\n"),
+        }
+
         // EXPERIMENT (2026-06-16): replay DLM's repeated STRING-descriptor reads at device-open.
         // Timing analysis of the paired cold capture (captures/paired-coldbus-20260615-220311)
         // shows DLM, beyond the distinct descriptor SET vino already issues, re-reads STRING idx0
-- 
2.54.0

