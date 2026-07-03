Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85556285CB9
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047699; cv=none; b=scmGsWmxXYDkyPIW9ujZtxxMK41OQZ9jL/DsM8pRPGUgVD4rXH3HEwWdREu2ynmXqQWTAI85ADYXjKMpahYhzW69LZEDFerx/Ygv3yLgUvxJ9s15JvW1w83mXWzHtSocyrgILYcf4bPKBFNsCYGpNOIBd+/S2gPQ43G7Vf08bGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047699; c=relaxed/simple;
	bh=IsVB1jfqN1ouCll22S4o9n/7FQwB21fqN/8F90cwzN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8Y4d/CCdveltFr83dVrDQfY1c48SgA8RZJ7C2CuIOotZ9lCkUA+uvm046kpAf062ucMvnQ3z9qRk+L6jh5GNWQGoCe+5B01Mbk5Vn44a927lB83f3Kbn040kqVFPi0AftEEcVeP5PLlWArFdee+onlQ86oeAugnsQIGMSfXy24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=y0e/3ZRd; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="y0e/3ZRd"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-474560436c3so104230f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047696; x=1783652496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zmepUPjDn3grp7kNjt5JCNExsSCDpx9IEqmKZjBkNg=;
        b=y0e/3ZRdVeAuU2Hf5JX7bfEoWw6jY+8cNU+1XOq9p129qYU9RWbwQnpQIQoQ7bgP9u
         VGbJjiXZyhofeicA3VP90LItiKwYtgciLtxhz3j7sejUwqFCXpXAjMNUpboh64txHdM0
         XGOzLGnVsvq418lHBeTURh6HK1PEXJgZdQkM7Jw6dxF809Kg1P2sQinhkf/T/pNwKvCV
         +aZJjyb0vWXFDjeSdCOsl6Zu3nSR3VGBjAYpPQguqKP8ph7HSUJPHb0BncFiczilJybV
         SACFZQU9gRlDugBLVgU1NOHtl1F3F2rwtiI/mpF0E9BS1l2LaPPnAlpccgygxeuF7v/F
         Yb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047696; x=1783652496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4zmepUPjDn3grp7kNjt5JCNExsSCDpx9IEqmKZjBkNg=;
        b=HhPvVc15d5SvxefX+w2I5FhFLcU4ODYiu3hEOoBCViqzeMyB3j8WVUpa/H73wna17b
         FX7sT78dU+p9s6CAgLCARuA4sM3tjULVQFY4clq0X34YUQ13FRE7uScvai3tBYHJ4S7i
         PUJXFusViqXaAtK0PktHIishb3k1cgq7vbXnc3IIqTsEDUBidB3ybbmrdhyGP8en6hw/
         PBO8Mug9UGRLo2LpoePHtMo692tU/rl+WaSt/Fb+QaKEtQDu/8pXUh4olIxctjmVsTD6
         +B8pt/2nQoVdbM8vj+YiR64Nh4FtPkAoFSv8ovh1Vxt872pD+GOCAygU8B6i9y9gVbq4
         p8lQ==
X-Gm-Message-State: AOJu0YxMOdpuUraackdK6KCQYSnfJ2mYk9LuIN+p+uCzxzDIAvNoBjGC
	hkmUe8DNtxyyfeu/4wDQJFBNz4tpjS8XqH79bKCDdGp3CftRS3MYyoL1r5JuthLlf69Pm4gFhR9
	wrlOMvLf0
X-Gm-Gg: AfdE7cmkJsSGw5+2ZuXWBfj8bp1YnEroKmarqLjwtNnfHp8nSukJNkVeWI0tb+kQ/V+
	ZtxMLkjej/2wONwF/qXZNPKcjwEUNA9PJ5+u0OFLscdbw9hYK7T8LpWOg6IvDpGJdihUhUQFGOv
	6vP8JQ+hvrt4FFBU+IgOURxnyYfO4bAuttj9RgtbpFZ4Du7RqfD81QW6KN5KmTawOfnlLh13qEr
	LHH1Obqkn+J71kgpdkssv2uokzcfgnCPMVIIiUDyopiOjaAPJ7i1cR7RgrY5CSGxdKrwVRIvy4l
	IMTdZ4+T25H0BHD2x//9mhJoJCn6i/G/r35NvOfjJbggrgtX2vUvkwaccWH2u6Nqi/uqGgyX05b
	sio90UWrPcHTSnVYKdiUOABJGrSxSOXbX0e7Uc11xcxd8+9ax/UMQy/D91hv3DepTfSgEpaSd5h
	JPjcfvXB7Sv5w8F3oFK0JQBDFAWlQ+ekTvYVPQ6t5vEQypKbX7gQhoNAWU
X-Received: by 2002:adf:e194:0:b0:476:135a:135c with SMTP id ffacd0b85a97d-477aeb5bd8dmr12495575f8f.2.1783047695816;
        Thu, 02 Jul 2026 20:01:35 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbacbsm14466500f8f.4.2026.07.02.20.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:01:34 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [RFC PATCH v2 02/18] rust: drm: kms: adapt the port to current drm-next
Date: Fri,  3 Jul 2026 04:00:49 +0100
Message-ID: <20260703030123.2814-3-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030123.2814-1-mike@fireburn.co.uk>
References: <20260617150232.2210-1-mike@fireburn.co.uk>
 <20260703030123.2814-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three mechanical fixups needed to build the forward-ported layer
against this tree, rather than the rvkms-slim/rust-stuck source
branches it came from:

- wire the KMS bindings/helpers/aref imports the port assumes into
  bindings_helper.h and rust/helpers/drm/{atomic,drm,vblank}.c, and fix
  the impl_aref_for_mode_object! macro path
- rename drm_atomic_state -> drm_atomic_commit, renamed upstream since
  rvkms-slim was last synced
- pin KmsDriver's associated types to Driver=Self and tidy the
  probe_kms stub so it type-checks against the current Driver trait

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-sonnet-5 [Claude-Code]
---
 rust/bindings/bindings_helper.h |  8 +++++++
 rust/helpers/drm/atomic.c       | 32 +++++++++++++++++++++++++
 rust/helpers/drm/drm.c          |  2 ++
 rust/helpers/drm/vblank.c       |  8 +++++++
 rust/kernel/drm/kms.rs          | 21 ++++++++---------
 rust/kernel/drm/kms/atomic.rs   | 41 +++++++++++++++++----------------
 rust/kernel/drm/kms/crtc.rs     | 16 ++++++-------
 rust/kernel/drm/kms/plane.rs    |  8 +++----
 8 files changed, 93 insertions(+), 43 deletions(-)
 create mode 100644 rust/helpers/drm/atomic.c
 create mode 100644 rust/helpers/drm/vblank.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a1ea23714bdd..e41d2716fb2e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -36,6 +36,14 @@
 #include <linux/gpu_buddy.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
diff --git a/rust/helpers/drm/atomic.c b/rust/helpers/drm/atomic.c
new file mode 100644
index 000000000000..ed5e49b73c81
--- /dev/null
+++ b/rust/helpers/drm/atomic.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_atomic.h>
+
+void rust_helper_drm_atomic_commit_get(struct drm_atomic_commit *state)
+{
+	drm_atomic_commit_get(state);
+}
+
+void rust_helper_drm_atomic_commit_put(struct drm_atomic_commit *state)
+{
+	drm_atomic_commit_put(state);
+}
+
+// Macros for generating one repetitive atomic state accessors (like drm_atomic_get_new_plane_state)
+#define STATE_FUNC(type, tense)                                                                     \
+	struct drm_ ## type ## _state *rust_helper_drm_atomic_get_ ## tense ## _ ## type ## _state( \
+		const struct drm_atomic_commit *state,                                               \
+		struct drm_ ## type *type                                                           \
+	) {                                                                                         \
+		return drm_atomic_get_## tense ## _ ## type ## _state(state, type);                 \
+	}
+#define STATE_FUNCS(type) \
+	STATE_FUNC(type, new); \
+	STATE_FUNC(type, old);
+
+STATE_FUNCS(plane);
+STATE_FUNCS(crtc);
+STATE_FUNCS(connector);
+
+#undef STATE_FUNCS
+#undef STATE_FUNC
diff --git a/rust/helpers/drm/drm.c b/rust/helpers/drm/drm.c
index b8700413a2b8..5d700d75c0c9 100644
--- a/rust/helpers/drm/drm.c
+++ b/rust/helpers/drm/drm.c
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include "atomic.c"
 #include "gem.c"
 #include "vma_manager.c"
+#include "vblank.c"
diff --git a/rust/helpers/drm/vblank.c b/rust/helpers/drm/vblank.c
new file mode 100644
index 000000000000..165db7ac5b4d
--- /dev/null
+++ b/rust/helpers/drm/vblank.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_vblank.h>
+
+struct drm_vblank_crtc *rust_helper_drm_crtc_vblank_crtc(struct drm_crtc *crtc)
+{
+	return drm_crtc_vblank_crtc(crtc);
+}
diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 11b09d2175db..a147276b3412 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -12,8 +12,7 @@
     },
     error::to_result,
     prelude::*,
-    sync::{Mutex, MutexGuard},
-    types::*,
+    sync::{aref::ARef, Mutex, MutexGuard},
 };
 use bindings;
 use core::{
@@ -69,10 +68,10 @@ pub trait KmsImpl {
         ///
         /// This function may only be called once.
         unsafe fn probe_kms(_drm: &Device<Self::Driver, Uninit>) -> Result<ModeConfigInfo> {
-            // TODO before submission: There is definitely a proper way of doing this, but I don't
-            // remember what it is.
-            unimplemented!()
-            //build_error!("This should never be reachable")
+            // This default is only reachable for the `PhantomData<T>` (non-KMS) implementor, whose
+            // KMS setup is never invoked. KMS drivers override it via the `KmsDriver` blanket impl
+            // below, so reaching this is a build-time bug.
+            build_error::build_error("probe_kms called on a device without KMS support")
         }
     }
 }
@@ -126,22 +125,22 @@ pub trait KmsDriver: Driver {
     /// The driver's [`DriverConnector`](connector::DriverConnector) implementation.
     ///
     /// TODO: This will be unneeded once we support multiple `DriverConnector` implementations.
-    type Connector: connector::DriverConnector;
+    type Connector: connector::DriverConnector<Driver = Self>;
 
     /// The driver's [`DriverPlane`](plane::DriverPlane) implementation.
     ///
     /// TODO: This will be unneeded once we support multiple `DriverPlane` implementations.
-    type Plane: plane::DriverPlane;
+    type Plane: plane::DriverPlane<Driver = Self>;
 
     /// The driver's [`DriverCrtc`](crtc::DriverCrtc) implementation.
     ///
     /// TODO: This will be unneeded once we support multiple `DriverCrtc` implementations.
-    type Crtc: crtc::DriverCrtc;
+    type Crtc: crtc::DriverCrtc<Driver = Self>;
 
     /// The driver's [`DriverEncoder`](encoder::DriverEncoder) implementation.
     ///
     /// TODO: This will be unneeded once we support multiple `DriverEncoder` implementations.
-    type Encoder: encoder::DriverEncoder;
+    type Encoder: encoder::DriverEncoder<Driver = Self>;
 
     /// Return a [`ModeConfigInfo`] structure for this [`device::Device`].
     fn mode_config_info(dev: &Device<Self, Uninit>) -> Result<ModeConfigInfo>
@@ -486,7 +485,7 @@ macro_rules! impl_aref_for_mode_object {
     (impl $( < $( $param:ident: $bound:ident ),+ > )? for $type:ty) => {
         // SAFETY: drm_mode_object_get()/put() ensure the type is ref-counted according to the
         // safety contract
-        unsafe impl $( < $( $param: $bound ),+ > )? kernel::types::AlwaysRefCounted for $type {
+        unsafe impl $( < $( $param: $bound ),+ > )? kernel::sync::aref::AlwaysRefCounted for $type {
             #[inline]
             fn inc_ref(&self) {
                 // SAFETY: We're guaranteed by the safety contract of `ModeObject` that
diff --git a/rust/kernel/drm/kms/atomic.rs b/rust/kernel/drm/kms/atomic.rs
index cc14bff47abd..18dc136940f3 100644
--- a/rust/kernel/drm/kms/atomic.rs
+++ b/rust/kernel/drm/kms/atomic.rs
@@ -1,31 +1,32 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 
-//! [`struct drm_atomic_state`] related bindings for rust.
+//! [`struct drm_atomic_commit`] related bindings for rust.
 //!
-//! [`struct drm_atomic_state`]: srctree/include/drm/drm_atomic.h
+//! [`struct drm_atomic_commit`]: srctree/include/drm/drm_atomic.h
 use super::{connector::*, crtc::*, plane::*, KmsDriver, ModeObject};
 use crate::{
     bindings,
     drm::device::Device,
     error::{from_err_ptr, to_result},
     prelude::*,
+    sync::aref::{ARef, AlwaysRefCounted},
     types::*,
 };
 use core::{cell::Cell, marker::*, mem::ManuallyDrop, ops::*, ptr::NonNull};
 
-/// The main wrapper around [`struct drm_atomic_state`].
+/// The main wrapper around [`struct drm_atomic_commit`].
 ///
 /// This type is usually embedded within another interface such as an [`AtomicStateMutator`].
 ///
 /// # Invariants
 ///
-/// - The data layout of this type is identical to [`struct drm_atomic_state`].
+/// - The data layout of this type is identical to [`struct drm_atomic_commit`].
 /// - `state` is initialized for as long as this type is exposed to users.
 ///
-/// [`struct drm_atomic_state`]: srctree/include/drm/drm_atomic.h
+/// [`struct drm_atomic_commit`]: srctree/include/drm/drm_atomic.h
 #[repr(transparent)]
 pub struct AtomicState<T: KmsDriver> {
-    pub(super) state: Opaque<bindings::drm_atomic_state>,
+    pub(super) state: Opaque<bindings::drm_atomic_commit>,
     _p: PhantomData<T>,
 }
 
@@ -34,18 +35,18 @@ impl<T: KmsDriver> AtomicState<T> {
     ///
     /// # Safety
     ///
-    /// `ptr` must point to a valid initialized instance of [`struct drm_atomic_state`].
+    /// `ptr` must point to a valid initialized instance of [`struct drm_atomic_commit`].
     ///
-    /// [`struct drm_atomic_state`]: srctree/include/drm/drm_atomic.h
+    /// [`struct drm_atomic_commit`]: srctree/include/drm/drm_atomic.h
     #[allow(dead_code)]
-    pub(super) unsafe fn from_raw<'a>(ptr: *const bindings::drm_atomic_state) -> &'a Self {
+    pub(super) unsafe fn from_raw<'a>(ptr: *const bindings::drm_atomic_commit) -> &'a Self {
         // SAFETY: Our data layout is identical
         // INVARIANT: Our safety contract upholds the guarantee that `state` is initialized for as
         // long as this type is exposed to users.
         unsafe { &*ptr.cast() }
     }
 
-    pub(crate) fn as_raw(&self) -> *mut bindings::drm_atomic_state {
+    pub(crate) fn as_raw(&self) -> *mut bindings::drm_atomic_commit {
         self.state.get()
     }
 
@@ -102,12 +103,12 @@ pub fn get_old_connector_state<C>(&self, connector: &C) -> Option<&C::State>
 unsafe impl<T: KmsDriver> AlwaysRefCounted for AtomicState<T> {
     fn inc_ref(&self) {
         // SAFETY: `state` is initialized for as long as this type is exposed to users
-        unsafe { bindings::drm_atomic_state_get(self.state.get()) }
+        unsafe { bindings::drm_atomic_commit_get(self.state.get()) }
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
         // SAFETY: `obj` contains a valid non-null pointer to an initialized `Self`.
-        unsafe { bindings::drm_atomic_state_put(obj.as_ptr().cast()) }
+        unsafe { bindings::drm_atomic_commit_put(obj.as_ptr().cast()) }
     }
 }
 
@@ -141,11 +142,11 @@ impl<T: KmsDriver> AtomicStateMutator<T> {
     ///
     /// # Safety
     ///
-    /// `ptr` must point to a valid `drm_atomic_state`
+    /// `ptr` must point to a valid `drm_atomic_commit`
     #[allow(dead_code)]
-    pub(super) unsafe fn new(ptr: NonNull<bindings::drm_atomic_state>) -> Self {
+    pub(super) unsafe fn new(ptr: NonNull<bindings::drm_atomic_commit>) -> Self {
         Self {
-            // SAFETY: The data layout of `AtomicState<T>` is identical to drm_atomic_state
+            // SAFETY: The data layout of `AtomicState<T>` is identical to drm_atomic_commit
             // We use `ManuallyDrop` because `AtomicStateMutator` is only ever provided to users in
             // the context of KMS callbacks. As such, skipping ref inc/dec for the atomic state is
             // convienent for our bindings.
@@ -156,7 +157,7 @@ pub(super) unsafe fn new(ptr: NonNull<bindings::drm_atomic_state>) -> Self {
         }
     }
 
-    pub(crate) fn as_raw(&self) -> *mut bindings::drm_atomic_state {
+    pub(crate) fn as_raw(&self) -> *mut bindings::drm_atomic_commit {
         self.state.as_raw()
     }
 
@@ -273,8 +274,8 @@ fn drop(&mut self) {
 impl<T: KmsDriver> AtomicStateComposer<T> {
     /// # Safety
     ///
-    /// The caller guarantees that `ptr` points to a valid instance of `drm_atomic_state`.
-    pub(crate) unsafe fn new(ptr: NonNull<bindings::drm_atomic_state>) -> Self {
+    /// The caller guarantees that `ptr` points to a valid instance of `drm_atomic_commit`.
+    pub(crate) unsafe fn new(ptr: NonNull<bindings::drm_atomic_commit>) -> Self {
         // SAFETY: see `AtomicStateMutator::from_raw()`
         Self(unsafe { AtomicStateMutator::new(ptr) })
     }
@@ -681,11 +682,11 @@ pub fn commit_hw_done<'b>(
 
 // The actual raw C callback for custom atomic commit tail implementations
 pub(crate) unsafe extern "C" fn commit_tail_callback<T: KmsDriver>(
-    state: *mut bindings::drm_atomic_state,
+    state: *mut bindings::drm_atomic_commit,
 ) {
     // SAFETY:
     // - We're guaranteed by DRM that `state` always points to a valid instance of
-    //   `bindings::drm_atomic_state`
+    //   `bindings::drm_atomic_commit`
     // - This conversion is safe via the type invariants
     let state = unsafe { AtomicState::from_raw(state.cast_const()) };
 
diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index b9d095854ba6..0f579dc4ec75 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -995,14 +995,14 @@ impl<'a, T: DriverCrtc> CrtcAtomicCommit<'a, T> {
 
 unsafe extern "C" fn atomic_check_callback<T: DriverCrtc>(
     crtc: *mut bindings::drm_crtc,
-    state: *mut bindings::drm_atomic_state,
+    state: *mut bindings::drm_atomic_commit,
 ) -> i32 {
     // SAFETY:
     // - We're guaranteed `crtc` is of type `Crtc<T>` via type invariants.
     // - We're guaranteed by DRM that `crtc` is pointing to a valid initialized state.
     let crtc = unsafe { Crtc::from_raw(crtc) };
 
-    // SAFETY: DRM guarantees `state` points to a valid `drm_atomic_state`
+    // SAFETY: DRM guarantees `state` points to a valid `drm_atomic_commit`
     // We use a ManuallyDrop here to avoid AtomicStateComposer dropping an owned reference we never
     // acquired.
     let state =
@@ -1023,14 +1023,14 @@ impl<'a, T: DriverCrtc> CrtcAtomicCommit<'a, T> {
 
 unsafe extern "C" fn atomic_begin_callback<T: DriverCrtc>(
     crtc: *mut bindings::drm_crtc,
-    state: *mut bindings::drm_atomic_state,
+    state: *mut bindings::drm_atomic_commit,
 ) {
     // SAFETY:
     // * We're guaranteed `crtc` is of type `Crtc<T>` via type invariants.
     // * We're guaranteed by DRM that `crtc` is pointing to a valid initialized state.
     let crtc = unsafe { Crtc::from_raw(crtc) };
 
-    // SAFETY: We're guaranteed by DRM that `state` points to a valid instance of `drm_atomic_state`
+    // SAFETY: We're guaranteed by DRM that `state` points to a valid instance of `drm_atomic_commit`
     let state = unsafe { AtomicStateMutator::new(NonNull::new_unchecked(state)) };
 
     // SAFETY:
@@ -1045,14 +1045,14 @@ impl<'a, T: DriverCrtc> CrtcAtomicCommit<'a, T> {
 
 unsafe extern "C" fn atomic_flush_callback<T: DriverCrtc>(
     crtc: *mut bindings::drm_crtc,
-    state: *mut bindings::drm_atomic_state,
+    state: *mut bindings::drm_atomic_commit,
 ) {
     // SAFETY:
     // - We're guaranteed `crtc` is of type `Crtc<T>` via type invariants.
     // - We're guaranteed by DRM that `crtc` is pointing to a valid initialized state.
     let crtc = unsafe { Crtc::from_raw(crtc) };
 
-    // SAFETY: We're guaranteed by DRM that `state` points to a valid instance of `drm_atomic_state`
+    // SAFETY: We're guaranteed by DRM that `state` points to a valid instance of `drm_atomic_commit`
     let state = unsafe { AtomicStateMutator::new(NonNull::new_unchecked(state)) };
 
     // SAFETY:
@@ -1067,7 +1067,7 @@ impl<'a, T: DriverCrtc> CrtcAtomicCommit<'a, T> {
 
 unsafe extern "C" fn atomic_enable_callback<T: DriverCrtc>(
     crtc: *mut bindings::drm_crtc,
-    state: *mut bindings::drm_atomic_state,
+    state: *mut bindings::drm_atomic_commit,
 ) {
     // SAFETY:
     // - We're guaranteed `crtc` is of type `Crtc<T>` via type invariants.
@@ -1089,7 +1089,7 @@ impl<'a, T: DriverCrtc> CrtcAtomicCommit<'a, T> {
 
 unsafe extern "C" fn atomic_disable_callback<T: DriverCrtc>(
     crtc: *mut bindings::drm_crtc,
-    state: *mut bindings::drm_atomic_state,
+    state: *mut bindings::drm_atomic_commit,
 ) {
     // SAFETY:
     // - We're guaranteed `crtc` points to a valid instance of `drm_crtc`
diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index 661d82273099..6f547adcfdc9 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -1048,14 +1048,14 @@ impl<'a, T: DriverPlane> PlaneAtomicCommit<'a, T> {
 
 unsafe extern "C" fn atomic_update_callback<T: DriverPlane>(
     plane: *mut bindings::drm_plane,
-    state: *mut bindings::drm_atomic_state,
+    state: *mut bindings::drm_atomic_commit,
 ) {
     // SAFETY:
     // - We're guaranteed `plane` is of type `Plane<T>` via type invariants.
     // - We're guaranteed by DRM that `plane` is pointing to a valid initialized state.
     let plane = unsafe { Plane::from_raw(plane) };
 
-    // SAFETY: DRM guarantees `state` points to a valid `drm_atomic_state`
+    // SAFETY: DRM guarantees `state` points to a valid `drm_atomic_commit`
     let state = unsafe { AtomicStateMutator::new(NonNull::new_unchecked(state)) };
 
     // SAFETY:
@@ -1070,14 +1070,14 @@ impl<'a, T: DriverPlane> PlaneAtomicCommit<'a, T> {
 
 unsafe extern "C" fn atomic_check_callback<T: DriverPlane>(
     plane: *mut bindings::drm_plane,
-    state: *mut bindings::drm_atomic_state,
+    state: *mut bindings::drm_atomic_commit,
 ) -> i32 {
     // SAFETY:
     // - We're guaranteed `plane` is of type `Plane<T>` via type invariants.
     // - We're guaranteed by DRM that `plane` is pointing to a valid initialized state.
     let plane = unsafe { Plane::from_raw(plane) };
 
-    // SAFETY: We're guaranteed by DRM that `state` points to a valid instance of `drm_atomic_state`
+    // SAFETY: We're guaranteed by DRM that `state` points to a valid instance of `drm_atomic_commit`
     // We use ManuallyDrop here since AtomicStateComposer would otherwise drop a owned reference to
     // the atomic state upon finishing this callback.
     let state = ManuallyDrop::new(unsafe {
-- 
2.55.0

