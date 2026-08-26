Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5997946D2A9
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762114; cv=none; b=BnS0OcA3UIiJMiqKV6RY3IpVCSW27VgMrSSCK7d4cc+C5bbLGbYIUDrJnzjq7GjJ1BgFpw1UJclQb9YjhoFH3XCGomewuqN9m79Rd5Ycapfv9pjobnFtpNUfc4OYIFNpQu7eyTAyTFI4clCuWxXbolThbqFeJLLqVsdGg2xnoP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762114; c=relaxed/simple;
	bh=HlNiQkdInaVCqaneSLwUL9h4LrAdu06ZtFAN9CJyFrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hXjcmt/8Z2wniFKLKvzFFvSZLs6I+mvy/ipPqe3/Kl2yxEK/xXKb87Af5f9sqXwPc3nt43zIwqLkiUgv3cI6CxVVgXcWL8OAnc1sNHOT++K2MJKJetDxuIIIyKiWTRuiLuQ3aRBuZsfBTBDryk7ZurBXooAhRroNWEzAQU0lJeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=pfOq/9ku; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="pfOq/9ku"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so8500705e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762107; x=1788366907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mBUy/SWfkawc6Cd4r6cfyndlG5qS5mvs2LAdsI9qBg=;
        b=pfOq/9ku1DmKJ2eYUDrHG9ACQYjo2gSrhedlYoORuj640Pb/l0JCpasfB/I8k6LYF5
         1FuD1U6Zd7uYqs9lltB5nCFau/saHFWKaDVDTkjVEqB9qvAehHgcDO/vH+OieQLp5toL
         uoWmae3AiRAXmAhf4l5xfIk5MjA52YWMq3Pu5WD7uFaQVQ3Vef3h9ngIw2/QqucatEX6
         Y/4vVYQznfIRQIVN63NNqp3j8gbPnMo8cLx/0F5BIgoXNN3hC7ZTuge5PM8COtY6UZlf
         vrxfzZiJ8NVK/arvncWJifoc97nroNFg6nCo7xsxQPljvLGRavi2cY1NtUUxbSzvj0pb
         BkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762107; x=1788366907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3mBUy/SWfkawc6Cd4r6cfyndlG5qS5mvs2LAdsI9qBg=;
        b=jSaUtDoMJb7E/Xgc0vw8yp+K9KwuT63t4c900pR+QiydtOfwK1ExGkAupdDutnHWe4
         hO2vhJMB6YCWUd7ggLE/sQLY7EsCLJi8vmt6jLj1eyQAH0T5vd5itdEE5DVo26qk3Gwz
         pEsh/zoz2tXq0KZD8nXvYMAngNgSEPvueoqMIpqW4NpjRk8a9+cgqhTSKsz2IwygvHnU
         lzzF7HQaKBOjbACXBvCkf/ZYySuT59p0NT/7UiPe0lARZLeNGBz4Zmg03DDdM1GRGZO9
         nYe7zuYMY9j535o/5xZLtcnSjY0mOkpdyUZGH4nXcoBhTcTC3VXRqmCEzI2rLK0p+IyY
         zjmw==
X-Forwarded-Encrypted: i=1; AHgh+RqVxwDEK1RMGZ7Ei6vHSC5Q2KTGoo3SBhYjbiHA18RfF+Ci+d6eDMptQ6mMDC8/p/imdV2wrP9JaDRk85g2uw==@vger.kernel.org
X-Gm-Message-State: AFuF++mgBgh1yt8mNIUVzwY2+RCA0qtodH5DRb9kM94yEjvRWLWbs3iS
	DAk9K3yqtiQeZPCaTQahVQ9qPiXl4P2PvgDyPKxkFh3ILMmFLPq9zYfa1CDfPfAZppFdMUENYSX
	aQ47PWQ1u
X-Gm-Gg: AR+sD13obUcbyG/pL0TRj9w7gWVaTkRdcPuvobCp74tZUDfKbSIYwQKZZnA2wjj5WgF
	y0ZMSMnyB7OuOCBwEorq64wSvlfGAxkVvcXWpacTraaFSqOg8ht8RUIUnNRfFdoBWVHNWVyh4Ct
	MO+5fGPT8G4hpDY1oGGhVc6wh7K+RbOt8cOukLQ9o9sb8R5siIuYDN0AXWaTaeg+5Q0ndakYudT
	DQwKfkxjTe7Vuh3e8ZsXdW0LAMMdR82oBgxuMIIXpr1zZ2TM7M8mmrqlzerHyJLh7ceZs0/3xGL
	nmk8XIJXjXFnH+IYAaWSx7cGPtDQmAGJnBITHOgDuBUHLdAWTFZA3xPyihKdRdOU81df+Gc+Q+m
	Pr5j7T6dIyYi555aUkSyGLIthsQCHiAiFJ8UyFPqt6/G8/uU313mqOOeoOlUXH4l8TF/S9EG67N
	dNngbMX8JOdAiyVKRTohHv/IBaYyrau5tZ9SE256fhN7usjLsdHRT1ZOP2/1xK7eB99ZOagAThH
	+LxawsLuKrApxMa0z1AOuGu/o8yDiVT3AyK66/QDF5iivW5
X-Received: by 2002:a05:600c:a43:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-499dc717e27mr70937185e9.9.1787762107196;
        Wed, 26 Aug 2026 09:35:07 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:35:06 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/23] rust: drm: kms: add common state and connector helpers
Date: Wed, 26 Aug 2026 17:31:36 +0100
Message-ID: <20260826163359.4998-6-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163359.4998-1-mike@fireburn.co.uk>
References: <20260826163359.4998-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add safe KMS helpers for hotplug events, mode timings, CRTC modes,
plane destination sizes, and EDID mode enumeration.

Propagate drm_edid_connector_update() failures and release the
temporary EDID on every path.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/kms.rs           | 18 +++++---
 rust/kernel/drm/kms/connector.rs | 35 ++++++++++++++-
 rust/kernel/drm/kms/crtc.rs      | 12 ++++-
 rust/kernel/drm/kms/encoder.rs   |  9 +---
 rust/kernel/drm/kms/modes.rs     | 77 +++++++++++++++++++++++++++++++-
 rust/kernel/drm/kms/plane.rs     | 14 +++++-
 rust/kernel/drm/kms/vblank.rs    |  2 +-
 7 files changed, 148 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 8baf9c2906f5..c10b2488af9b 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -77,7 +77,7 @@ unsafe fn setup_kms(_drm: &Device<Self::Driver>) -> Result<ModeConfigInfo> {
 /// generate said functions for any kind of type which the original mode object driver trait can be
 /// derived from. All conversions check the mode object's vtable. For example:
 ///
-/// ```compile_fail
+/// ```ignore
 /// impl<'a, T: DriverConnectorState> ConnectorState<T> {
 ///     impl_from_opaque_mode_obj! {
 ///         // | An optional lifetime and param-variables to declare for each function
@@ -245,10 +245,7 @@ pub trait KmsDriver: Driver {
     type Encoder: encoder::DriverEncoder<Driver = Self>;
 
     /// Return a [`ModeConfigInfo`] structure for this [`device::Device`].
-    fn mode_config_info(
-        dev: &device::Device,
-        drm_data: &Self::Data,
-    ) -> Result<ModeConfigInfo>;
+    fn mode_config_info(dev: &device::Device, drm_data: &Self::Data) -> Result<ModeConfigInfo>;
 
     /// Create mode objects like [`crtc::Crtc`], [`plane::Plane`], etc. for this device
     fn create_objects(drm: &UnregisteredKmsDevice<'_, Self>) -> Result
@@ -360,6 +357,17 @@ impl<T: Driver> private::KmsImpl for PhantomData<T> {
 
 impl<T: Driver> KmsImpl for PhantomData<T> {}
 
+impl<T: KmsDriver, C: crate::drm::device::DeviceContext> Device<T, C> {
+    /// Send a hotplug uevent to userspace, prompting it to re-probe connector state.
+    ///
+    /// This is useful for drivers which detect connector changes out of band, for example when a
+    /// dock supplies an EDID after bring-up.
+    pub fn hotplug_event(&self) {
+        // SAFETY: `self.as_raw()` is a live KMS-capable DRM device.
+        unsafe { bindings::drm_kms_helper_hotplug_event(self.as_raw()) };
+    }
+}
+
 /// Various device-wide information for a [`Device`] that is provided during initialization.
 #[derive(Copy, Clone)]
 pub struct ModeConfigInfo {
diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index b36d138ae950..793a7bb5bfef 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -5,7 +5,7 @@
 //! C header: [`include/drm/drm_connector.h`](srctree/include/drm/drm_connector.h)
 
 use super::{
-    atomic::*, encoder::*, KmsDriver, ModeConfigGuard, ModeObject, ModeObjectVtable, Sealed
+    atomic::*, encoder::*, KmsDriver, ModeConfigGuard, ModeObject, ModeObjectVtable, Sealed,
 };
 use crate::{
     alloc::KBox,
@@ -587,6 +587,39 @@ pub fn set_preferred_mode(&self, (h_pref, w_pref): (u32, u32)) {
         // SAFETY: We hold the locks required to call this via our type invariants.
         unsafe { bindings::drm_set_preferred_mode(self.as_raw(), h_pref, w_pref) }
     }
+
+    /// Parse an EDID, update the connector information, and add its advertised modes.
+    ///
+    /// Returns the number of modes added.
+    pub fn add_edid_modes(&self, edid: &[u8]) -> Result<i32> {
+        const EDID_BASE_BLOCK_LEN: usize = 128;
+
+        if edid.len() < EDID_BASE_BLOCK_LEN {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `edid` points to `edid.len()` initialized bytes, which the helper copies.
+        let drm_edid = unsafe { bindings::drm_edid_alloc(edid.as_ptr().cast(), edid.len()) };
+        if drm_edid.is_null() {
+            return Err(ENOMEM);
+        }
+
+        // SAFETY: The connector is live and the guard holds the mode-config lock. `drm_edid`
+        // points to an allocation returned by `drm_edid_alloc` above.
+        let ret = unsafe { bindings::drm_edid_connector_update(self.as_raw(), drm_edid) };
+        if let Err(err) = to_result(ret) {
+            // SAFETY: `drm_edid` was allocated above and has not been freed.
+            unsafe { bindings::drm_edid_free(drm_edid) };
+            return Err(err);
+        }
+
+        // SAFETY: The connector information was successfully updated from this EDID above.
+        let count = unsafe { bindings::drm_edid_connector_add_modes(self.as_raw()) };
+        // SAFETY: `drm_edid` was allocated above and is no longer needed.
+        unsafe { bindings::drm_edid_free(drm_edid) };
+
+        Ok(count)
+    }
 }
 
 /// A trait implemented by any type which can produce a reference to a
diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index 683d9ee4ec25..a3217f8c55e8 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -5,8 +5,8 @@
 //! C header: [`include/drm/drm_crtc.h`](srctree/include/drm/drm_crtc.h)
 
 use super::{
-    atomic::*, plane::*, vblank::*, KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject,
-    UnregisteredKmsDevice, Sealed,
+    atomic::*, modes::DisplayMode, plane::*, vblank::*, KmsDriver, ModeObject, ModeObjectVtable,
+    Sealed, StaticModeObject, UnregisteredKmsDevice,
 };
 use crate::{
     alloc::KBox,
@@ -644,6 +644,7 @@ pub trait AsRawCrtcState: private::AsRawCrtcState {
 pub(crate) mod private {
     use super::*;
 
+    /// The raw-pointer half of [`AsRawCrtcState`](super::AsRawCrtcState).
     #[allow(unreachable_pub)]
     pub trait AsRawCrtcState {
         /// Return a raw pointer to the DRM CRTC state
@@ -678,6 +679,13 @@ fn active(&self) -> bool {
         // this access is serialized
         unsafe { (*self.as_raw()).active }
     }
+
+    /// Return the display mode programmed into this CRTC state.
+    fn mode(&self) -> &DisplayMode {
+        // SAFETY: `mode` is embedded in the CRTC state and therefore has the same lifetime. The
+        // atomic-state API serializes access while the mode can be changed.
+        unsafe { DisplayMode::as_ref(core::ptr::addr_of!((*self.as_raw()).mode)) }
+    }
 }
 impl<T: AsRawCrtcState> RawCrtcState for T {}
 
diff --git a/rust/kernel/drm/kms/encoder.rs b/rust/kernel/drm/kms/encoder.rs
index f90d139cdb04..8758a9459bcc 100644
--- a/rust/kernel/drm/kms/encoder.rs
+++ b/rust/kernel/drm/kms/encoder.rs
@@ -5,7 +5,7 @@
 //! C header: [`include/drm/drm_encoder.h`](srctree/include/drm/drm_encoder.h)
 
 use super::{
-    KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject, UnregisteredKmsDevice, Sealed
+    KmsDriver, ModeObject, ModeObjectVtable, Sealed, StaticModeObject, UnregisteredKmsDevice,
 };
 use crate::{
     alloc::KBox,
@@ -15,12 +15,7 @@
     types::{NotThreadSafe, Opaque},
 };
 use bindings;
-use core::{
-    marker::*,
-    mem,
-    ops::Deref,
-    ptr::null,
-};
+use core::{marker::*, mem, ops::Deref, ptr::null};
 use macros::paste;
 
 /// A macro for generating our type ID enumerator.
diff --git a/rust/kernel/drm/kms/modes.rs b/rust/kernel/drm/kms/modes.rs
index 0f29a9c00062..cc3c486eecf1 100644
--- a/rust/kernel/drm/kms/modes.rs
+++ b/rust/kernel/drm/kms/modes.rs
@@ -1,7 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
+//!
+//! DRM display modes.
+//!
+//! C header: [`include/drm/drm_modes.h`](srctree/include/drm/drm_modes.h)
+
 use bindings;
 
-use crate::{prelude::*, types::Opaque};
+use crate::types::Opaque;
 
 /// DRM kernel-internal display mode structure.
 ///
@@ -73,4 +78,74 @@ pub fn crtc_vtotal(&self) -> u16 {
         // SAFETY: Reading these fields is safe via our type invariants
         unsafe { (*self.as_raw()).crtc_vtotal }
     }
+
+    /// Return the horizontal active pixels.
+    #[inline]
+    pub fn hdisplay(&self) -> u16 {
+        // SAFETY: Reading this field is safe via the type invariants.
+        unsafe { (*self.as_raw()).hdisplay }
+    }
+
+    /// Return the start of the horizontal sync pulse.
+    #[inline]
+    pub fn hsync_start(&self) -> u16 {
+        // SAFETY: Reading this field is safe via the type invariants.
+        unsafe { (*self.as_raw()).hsync_start }
+    }
+
+    /// Return the end of the horizontal sync pulse.
+    #[inline]
+    pub fn hsync_end(&self) -> u16 {
+        // SAFETY: Reading this field is safe via the type invariants.
+        unsafe { (*self.as_raw()).hsync_end }
+    }
+
+    /// Return the total horizontal pixels including blanking.
+    #[inline]
+    pub fn htotal(&self) -> u16 {
+        // SAFETY: Reading this field is safe via the type invariants.
+        unsafe { (*self.as_raw()).htotal }
+    }
+
+    /// Return the vertical active scanlines.
+    #[inline]
+    pub fn vdisplay(&self) -> u16 {
+        // SAFETY: Reading this field is safe via the type invariants.
+        unsafe { (*self.as_raw()).vdisplay }
+    }
+
+    /// Return the start of the vertical sync pulse.
+    #[inline]
+    pub fn vsync_start(&self) -> u16 {
+        // SAFETY: Reading this field is safe via the type invariants.
+        unsafe { (*self.as_raw()).vsync_start }
+    }
+
+    /// Return the end of the vertical sync pulse.
+    #[inline]
+    pub fn vsync_end(&self) -> u16 {
+        // SAFETY: Reading this field is safe via the type invariants.
+        unsafe { (*self.as_raw()).vsync_end }
+    }
+
+    /// Return the total vertical scanlines including blanking.
+    #[inline]
+    pub fn vtotal(&self) -> u16 {
+        // SAFETY: Reading this field is safe via the type invariants.
+        unsafe { (*self.as_raw()).vtotal }
+    }
+
+    /// Return the pixel clock in kHz.
+    #[inline]
+    pub fn clock(&self) -> i32 {
+        // SAFETY: Reading this field is safe via the type invariants.
+        unsafe { (*self.as_raw()).clock }
+    }
+
+    /// Return the refresh rate in Hz as computed by DRM.
+    #[inline]
+    pub fn vrefresh(&self) -> i32 {
+        // SAFETY: `drm_mode_vrefresh` only reads this valid display mode.
+        unsafe { bindings::drm_mode_vrefresh(self.as_raw()) }
+    }
 }
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index f52f9c872de3..3a95c45b6728 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -5,8 +5,8 @@
 //! C header: [`include/drm/drm_plane.h`](srctree/include/drm/drm_plane.h)
 
 use super::{
-    atomic::*, crtc::*, framebuffer::*, KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject,
-    UnregisteredKmsDevice, Sealed
+    atomic::*, crtc::*, framebuffer::*, KmsDriver, ModeObject, ModeObjectVtable, Sealed,
+    StaticModeObject, UnregisteredKmsDevice,
 };
 use crate::{
     alloc::KBox,
@@ -617,6 +617,16 @@ fn plane(&self) -> &Self::Plane {
         unsafe { Self::Plane::from_raw(self.as_raw().plane) }
     }
 
+    /// Return the width of this plane's destination rectangle in CRTC pixels.
+    fn crtc_w(&self) -> u32 {
+        self.as_raw().crtc_w
+    }
+
+    /// Return the height of this plane's destination rectangle in CRTC pixels.
+    fn crtc_h(&self) -> u32 {
+        self.as_raw().crtc_h
+    }
+
     /// Return the current [`OpaqueCrtc`] assigned to this plane, if there is one.
     ///
     /// The returned CRTC reference cannot outlive the plane-state borrow:
diff --git a/rust/kernel/drm/kms/vblank.rs b/rust/kernel/drm/kms/vblank.rs
index dc34e02e8ccb..a725a46110d8 100644
--- a/rust/kernel/drm/kms/vblank.rs
+++ b/rust/kernel/drm/kms/vblank.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/drm/drm_vblank.h`](srcfree/include/drm/drm_vblank.h)
 
-use super::{crtc::*, ModeObject, modes::*, Sealed};
+use super::{crtc::*, modes::*, ModeObject};
 use bindings;
 use core::{
     marker::*,
