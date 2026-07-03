Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE7D2DEA95
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047764; cv=none; b=u/mySEbzjMVwihSxz9Xv8tV21F4YQTxFlHkyNVsHtzAGkraZbC4p+dp6s7sN9neYKDVj9Ge58GG0mXtlCAmToVX+GsxWUXuxgSVPqA6aRUFpeWSJzyEErHlTIA/i+IQCdGbdKR7xiYvhRYnVi1DLo0G05xEoVffy3PpzWFGoUjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047764; c=relaxed/simple;
	bh=VMqPxqeGOydU/qJQWNRBztvGJDvBHVXkFrMMrHXqGLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBk5gkoJOlROoz+Cun28k9S4vtbtxpe+AYFuwmfysmG5weWqc3PT6Fj7ZGl7VlnyIKLIRf52XiDC1CPnUw5KczCx4C6EuNli20JbwgjTxnw4mPFJzALVggHTyyEocTdnetVNouDin5Qey6X9cweCSNrF7Y0hgM7Syy2p0AGVCBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=f7bzhvZs; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="f7bzhvZs"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b691cb44so309405e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047760; x=1783652560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hOUI+KILuYygU2zh00vlXvoF5bhAeY5D7VwFYgNi3s=;
        b=f7bzhvZsFgY5Pr+xpX2050dVhiVlIBpD0QzSaIMSFsVR235f9mMO1E2fJQH6wkKaC/
         /UH2RqDCymxPBn4k3BidbTxafjZCMjUEAkDaXg5S2UChLqoOirJjwHO5urzup+3vMCFe
         likqn0P9E9b1YXiQcuuE4P9SuSVTK9ioPs4ICU7RyK2bq2xZ/k7eEsAc/PSL7ZuZ6pXf
         MsfmaWG1kS3yOiKvw5p8yR2odixZa4nh1zLgFr4ssXob2ickZ2HJ4pA8Qq76NWFQPm83
         9Mhi06SXpOe3rnJhx5mGgy0Sr82/QMaVJsVpJz2PmOZaExV5BI6aKbCzc8dgRWwAFYEs
         oypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047760; x=1783652560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7hOUI+KILuYygU2zh00vlXvoF5bhAeY5D7VwFYgNi3s=;
        b=KOMegSl4OD1YnuBjsQ3h/9S11MyD9aKl+P9X1K/Et49sQnLk5YrqlmxdBUxjSUaJc7
         mQQgAKk+GYayVDUhRbJwCTeHUqdY97mTuknhhz5vZS8T3hVpvnpgZIAs2vdM2SMPU0+g
         0Q2JLCPn/9zoM8s1x1WjWCRCIIBF4vIlWIBSz1f2V6rcumY8hZky8FnR+oPpwpc2JCju
         ZWSRoVUPAKcmq+DeoIaoJBdoo8/M5+a8uhgDjzNJ+fBdoj2oomIm7fprw4J7xR2LZRN/
         avFk+QS8uxoyO7YT+nYFaxrF66wQushjPPL6J6c/Lsd2iZVNZTEegkJK2ah4Z1baYT8X
         v4Ig==
X-Gm-Message-State: AOJu0Yx0rKh38kjT9QJ/giPldqHr+GbGIpDgpjI5efyVjNHsYcgfCFBq
	cyG63QoRWRjS4k3UNV8lsFN/cVkBRA7gsxp9DJNM761Rquybu1ktVAjfaWf72n4AoZhvQzbi2u5
	t6mzPvk9f
X-Gm-Gg: AfdE7clBIQFUJcxwAXKns2FIQS/AjeI6dTszuacxwP7C2vIzIBfCrNTJ5f4UQta36jd
	3uocOhMUGvTfv6DPVnJwo+ayGDwgbzlzyBNfbfXwfz8TvKJ4SsFSW+PBie1IVe7aY6bkBwW5hgW
	KCp+lLE9ch/BAfLVSNO/9g/qJ+l1unklxU1qfgfnHmY17ir3beOCPjWcF+vruPFmKgVydCjF+P1
	7pgOp+u4+PrIhK341d2J3X/IQ4AsULxy3cU9fqP6cf2YHWMA8MbtFnGe+dizcEmhuskGx+b8Pl1
	cXqCXL/oXehpGLcQwmzdc1DvxxHKQtQGO+B7jnLBdHSKFCxA1VJZi4UZVQ3qaEUmmwo3m1eaUNA
	P5ZSRrV9Nk2UsAR6mYteJfj3mswrry4gGCq9zSBI1nvIAOIJqP9sy1LEGlTfmY4yS09azG+Rswe
	opGrdlbYJtSTItYSI0kSeg6wwTR2Eu8nATMg7SG7ZEL/Ck5gCYiGdplFdf
X-Received: by 2002:a05:600c:1c1b:b0:492:3c7e:57aa with SMTP id 5b1f17b1804b1-493c2ac8669mr149455525e9.0.1783047760487;
        Thu, 02 Jul 2026 20:02:40 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4a343csm141233875e9.0.2026.07.02.20.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:02:38 -0700 (PDT)
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
Subject: [RFC PATCH v2 07/10] drm/vino: wire the hardware cursor plane
Date: Fri,  3 Jul 2026 04:02:12 +0100
Message-ID: <20260703030217.2886-8-mike@fireburn.co.uk>
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

The pre-safe-KMS vino had a hardware cursor (a DRM_PLANE_TYPE_CURSOR plane whose
updates were tunnelled to the dock as the cp::cursor_{create,image,move} CP
messages); the v2 safe-KMS refactor dropped it because the safe KMS layer didn't
expose plane position/hotspot accessors. Those exist now, so re-wire it.

VinoPlane gains an `is_cursor` role (the safe KMS layer allows one plane type per
driver, so one type serves both the primary and cursor planes). probe() creates a
Type::Cursor plane (ARGB8888, max_cursor 64x64) alongside the primary and attaches
it to the CRTC. The cursor plane's atomic_update forwards to the dock over CP:
cursor_move (position, from the new plane crtc_x()/crtc_y()) on every update, and
cursor_create + cursor_image (the w*h*4 BGRA bitmap, read from the framebuffer via
the new Framebuffer::width()/pitch()/vmap()) only when the bitmap changes. Like
scanout it is gated behind CP engagement, so it is inert until the dock's
content-protection channel comes up.

The cp::cursor_* builders and their KUnit tests are unchanged.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 drivers/gpu/drm/vino/drm_sink.rs | 98 +++++++++++++++++++++++++++++---
 1 file changed, 89 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vino/drm_sink.rs b/drivers/gpu/drm/vino/drm_sink.rs
index 450c7c84a067..fde52336fcd1 100644
--- a/drivers/gpu/drm/vino/drm_sink.rs
+++ b/drivers/gpu/drm/vino/drm_sink.rs
@@ -18,9 +18,10 @@
 //!   wired here). `VinoPlane`/`VinoCrtc` hold their state inline rather than behind a
 //!   pointer-identity lookup table, so adding a head is a second `probe()` call away,
 //!   not a redesign.
-//! - A cursor plane, CRTC gamma LUT, and plane rotation property -- `kernel::drm::kms`
-//!   doesn't yet expose `drm_plane_create_rotation_property` or a second (cursor)
-//!   plane argument shape beyond what `UnregisteredCrtc::new` already threads through.
+//! - CRTC gamma LUT and plane rotation property -- `kernel::drm::kms` doesn't yet expose
+//!   `drm_gamma_lut`/`drm_plane_create_rotation_property`. (The cursor plane *is* wired now:
+//!   `VinoPlane` serves both the primary and a `Type::Cursor` plane, and `atomic_update` forwards
+//!   the cursor bitmap/position to the dock via `cp::cursor_{create,image,move}`.)
 //! - DDC/CI brightness/contrast as connector properties, and the `.detect`/`mode_valid`
 //!   connector hooks (report disconnected until a real EDID arrives; reject
 //!   over-budget modes) -- `DriverConnector` only exposes `get_modes` right now.
@@ -57,6 +58,11 @@
 /// Primary-plane format list (opaque 32bpp scanout).
 static PRIMARY_FORMATS: [u32; 1] = [DRM_FORMAT_XRGB8888];
 
+/// `DRM_FORMAT_ARGB8888` (`fourcc_code('A','R','2','4')`); the dock's cursor bitmap carries alpha.
+const DRM_FORMAT_ARGB8888: u32 = 0x3432_5241;
+/// Cursor-plane format list.
+static CURSOR_FORMATS: [u32; 1] = [DRM_FORMAT_ARGB8888];
+
 /// Per-mode pixel-clock ceiling (kHz) -- about 4K@60 (CEA 594 MHz). With only one head wired
 /// there is no combined-heads budget to enforce (see the module doc); a real ceiling still
 /// needs the connector `mode_valid` hook this port doesn't expose yet, so this constant is
@@ -275,7 +281,7 @@ fn mode_config_info(_dev: &drm::Device<Self, drm::Uninit>) -> Result<ModeConfigI
         Ok(ModeConfigInfo {
             min_resolution: (0, 0),
             max_resolution: (4096, 4096),
-            max_cursor: (0, 0),
+            max_cursor: (64, 64),
             preferred_depth: 32,
             preferred_fourcc: Some(DRM_FORMAT_XRGB8888),
         })
@@ -294,12 +300,21 @@ fn probe(dev: &NewKmsDevice<'_, Self, Probing>) -> Result {
             None,
             plane::Type::Primary,
             None,
-            (),
+            false,
+        )?;
+        let cursor = plane::UnregisteredPlane::<VinoPlane>::new(
+            dev,
+            1,
+            &CURSOR_FORMATS,
+            None,
+            plane::Type::Cursor,
+            None,
+            true,
         )?;
         let crtc_obj = crtc::UnregisteredCrtc::<VinoCrtc>::new(
             dev,
             primary,
-            None::<&plane::UnregisteredPlane<VinoPlane>>,
+            Some(&cursor),
             None,
             (),
         )?;
@@ -381,12 +396,20 @@ fn atomic_disable(commit: CrtcAtomicCommit<'_, Self>) {
     }
 }
 
-// ---- Primary plane / scanout -----------------------------------------------
+// ---- Planes: primary (scanout) + cursor -------------------------------------
+//
+// The safe KMS layer allows one `DriverPlane` type per driver, so `VinoPlane` serves both the
+// primary and cursor planes, told apart by `is_cursor` (from the plane's `Args`).
 
 #[pin_data]
 pub(super) struct VinoPlane {
     #[pin]
     scanout: Mutex<ScanoutState>,
+    /// Whether this is the cursor plane (vs. the primary scanout plane).
+    is_cursor: bool,
+    /// The framebuffer last uploaded to the dock as the cursor bitmap (raw address, `0` = none),
+    /// so a bare cursor move only re-sends the position, not the whole image. Cursor plane only.
+    cursor_last: core::sync::atomic::AtomicUsize,
 }
 
 #[derive(Clone, Default)]
@@ -398,11 +421,11 @@ impl plane::DriverPlaneState for VinoPlaneState {
 
 #[vtable]
 impl plane::DriverPlane for VinoPlane {
-    type Args = ();
+    type Args = bool;
     type Driver = VinoDrmDriver;
     type State = VinoPlaneState;
 
-    fn new(_device: &drm::Device<Self::Driver, drm::Uninit>, _args: ()) -> impl PinInit<Self, Error> {
+    fn new(_device: &drm::Device<Self::Driver, drm::Uninit>, is_cursor: bool) -> impl PinInit<Self, Error> {
         try_pin_init!(VinoPlane {
             scanout <- new_mutex!(ScanoutState {
                 enc: None,
@@ -411,6 +434,8 @@ fn new(_device: &drm::Device<Self::Driver, drm::Uninit>, _args: ()) -> impl PinI
                 dims: (0, 0),
                 hint: 0,
             }),
+            is_cursor,
+            cursor_last: core::sync::atomic::AtomicUsize::new(0),
         })
     }
 
@@ -429,6 +454,36 @@ fn atomic_update(commit: PlaneAtomicCommit<'_, Self>) {
         let plane = commit.plane();
         let data: &VinoDrmData = plane.drm_dev();
         let new = commit.take_new_state();
+
+        // Cursor plane: forward the cursor bitmap/position to the dock over CP (id=0x1b create,
+        // 0x401c image, 0x1a move -- see `cp::cursor_*`). A no-op until CP engages, like scanout.
+        if plane.is_cursor {
+            use core::sync::atomic::Ordering::Relaxed;
+            const HEAD: u8 = 0;
+            match new.framebuffer::<VinoDrmDriver>() {
+                Some(fb) => {
+                    let w = fb.width() as u16;
+                    let h = fb.height() as u16;
+                    // Re-upload the bitmap only when the framebuffer changes; always update the
+                    // position (a bare cursor move must not re-send the whole image).
+                    let key = fb as *const _ as usize;
+                    if plane.cursor_last.swap(key, Relaxed) != key {
+                        let _ = data.send_cp(0x1b, 0, |ctr| super::cp::cursor_create(ctr, HEAD, w, h));
+                        if let Ok(bgra) = read_cursor_bgra(fb, w as usize, h as usize) {
+                            let _ = data
+                                .send_cp(0x401c, 0, |ctr| super::cp::cursor_image(ctr, HEAD, w, h, &bgra));
+                        }
+                    }
+                    let x = new.crtc_x().max(0) as u16;
+                    let y = new.crtc_y().max(0) as u16;
+                    let _ = data.send_cp(0x1a, 0, |ctr| super::cp::cursor_move(ctr, HEAD, x, y));
+                }
+                // Cursor disabled: forget the last bitmap so it re-uploads if it comes back.
+                None => plane.cursor_last.store(0, Relaxed),
+            }
+            return;
+        }
+
         let Some(fb) = new.framebuffer::<VinoDrmDriver>() else { return };
         // The plane's destination geometry mirrors the negotiated mode (the compositor sizes the
         // primary plane 1:1 with the virtual output), so this drives the dynamic scanout
@@ -480,6 +535,31 @@ fn prime_video_eps(dev: &super::usb::Interface<kernel::device::Bound>) {
     }
 }
 
+/// Map the cursor framebuffer and convert it to the `w*h*4` BGRA bitmap the dock expects
+/// (`cp::cursor_image`). The source is XRGB/ARGB8888; each pixel is written out as B, G, R, A.
+fn read_cursor_bgra(
+    fb: &kms::framebuffer::Framebuffer<VinoDrmDriver>,
+    w: usize,
+    h: usize,
+) -> Result<KVec<u8>> {
+    let vmap = fb.vmap()?;
+    let src = vmap.as_ptr();
+    let pitch = fb.pitch(0) as usize;
+    let mut out = KVec::with_capacity(w * h * 4, GFP_KERNEL)?;
+    for dy in 0..h {
+        for dx in 0..w {
+            // SAFETY: `dy*pitch + dx*4 + 3` is within the mapped cursor framebuffer (`pitch*h`
+            // bytes); `dx < w <= pitch/4`, `dy < h`.
+            let px = unsafe { (src.add(dy * pitch + dx * 4) as *const u32).read_unaligned() };
+            out.push((px & 0xff) as u8, GFP_KERNEL)?; // B
+            out.push(((px >> 8) & 0xff) as u8, GFP_KERNEL)?; // G
+            out.push(((px >> 16) & 0xff) as u8, GFP_KERNEL)?; // R
+            out.push(((px >> 24) & 0xff) as u8, GFP_KERNEL)?; // A
+        }
+    }
+    Ok(out)
+}
+
 /// vmap `fb`, encode it, and push one EP08 frame. Split out so `?` can be used.
 fn scanout_one(
     data: &VinoDrmData,
-- 
2.55.0

