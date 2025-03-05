Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BBF20969A
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 23:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741216034; cv=none; b=tnFL9npR71BbC0oggl+x0L2/BzRHMey89n5kwyW7M31vHtWjePGnAu4apK/2cGFtuYIkEsKw2eZRYogtCpzI9iPPRb3Hp220fsv1eniMUNQbz3L4qIQdNW8WIEGbhsD2/BzptsS+YdDBubCrxxrrETxLc1O2ihH5+PTz6kKh3cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741216034; c=relaxed/simple;
	bh=ZPAxctqXfOkTpQvavFmDyUjGOvo76pw4LiyCBar3KTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDDCPFWJxn1UV66gBQW2xXmSJVClAtWqfU8YxAQ4E4ltZDTLHS9lB8uV2scheS/Bm6cE7r2e/x1aK8NNwV0sY78f6h0s9pm6EzyILLFxbxaUCmx+R3Ked4H/wPuqHltbPbuEWnuokPzs54cyHo296vmrZ/KKkO8oTpbpAjC/LPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EVXu3xUE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EVXu3xUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741216031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXbABbsFOrkboMzt8NBf4+h/5hP5zznTgfYSP2dMRX4=;
	b=EVXu3xUE+5euWir8X0FwO9lAtc2w8KnBN2s6DHU39GUPhrrg6tdN0woQUG4+E+beFM29Od
	2BADkrfDNWdUyP8TIRRWJ6K62RbpQIzWzCiPtu3weT0l5gY/aKPn0c9yLaE8Bwq3PMmgYl
	HjgnyJdBK0IHi/DY5sSXIT6umtJbMgA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-LeCARbz_Ndugqsb0rL7kxg-1; Wed,
 05 Mar 2025 18:06:52 -0500
X-MC-Unique: LeCARbz_Ndugqsb0rL7kxg-1
X-Mimecast-MFC-AGG-ID: LeCARbz_Ndugqsb0rL7kxg_1741216010
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5FD111955DBA;
	Wed,  5 Mar 2025 23:06:50 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4557D300019E;
	Wed,  5 Mar 2025 23:06:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	mcanal@igalia.com,
	Alice Ryhl <aliceryhl@google.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <sima@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 16/33] rust: drm/kms: Add OpaquePlane and OpaquePlaneState
Date: Wed,  5 Mar 2025 17:59:32 -0500
Message-ID: <20250305230406.567126-17-lyude@redhat.com>
In-Reply-To: <20250305230406.567126-1-lyude@redhat.com>
References: <20250305230406.567126-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Same thing as OpaqueCrtc and OpaqueCrtcState, but for plane states now.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

V3:
* Add safety comment to implementation of ModeObject
* Add safety comments to implementation of AsRawPlane
* Implement try_from_opaque() and from_opaque() using a macro
* Add missing upcasts
* Use addr_of_mut!() instead of &mut

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/plane.rs | 176 ++++++++++++++++++++++++++++++++++-
 1 file changed, 175 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/kms/plane.rs b/rust/kernel/drm/kms/plane.rs
index d1fabdf42df54..be69dc16c6cc7 100644
--- a/rust/kernel/drm/kms/plane.rs
+++ b/rust/kernel/drm/kms/plane.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/drm/drm_plane.h`](srctree/include/drm/drm_plane.h)
 
-use super::{KmsDriver, ModeObject, StaticModeObject, UnregisteredKmsDevice};
+use super::{KmsDriver, ModeObject, ModeObjectVtable, StaticModeObject, UnregisteredKmsDevice};
 use crate::{
     alloc::KBox,
     bindings,
@@ -169,6 +169,25 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+// SAFETY: `funcs` is initialized when the plane is allocated
+unsafe impl<T: DriverPlane> ModeObjectVtable for Plane<T> {
+    type Vtable = bindings::drm_plane_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        // SAFETY: `as_raw()` always returns a valid plane pointer
+        unsafe { *self.as_raw() }.funcs
+    }
+}
+
+impl<T: DriverPlane> Plane<T> {
+    super::impl_from_opaque_mode_obj! {
+        fn <'a, D>(&'a OpaquePlane<D>) -> &'a Self;
+        use
+            T as DriverPlane,
+            D as KmsDriver
+    }
+}
+
 /// A [`Plane`] that has not yet been registered with userspace.
 ///
 /// KMS registration is single-threaded, so this object is not thread-safe.
@@ -396,6 +415,84 @@ fn mask(&self) -> u32 {
 }
 impl<T: AsRawPlane> RawPlane for T {}
 
+/// A [`struct drm_plane`] without a known [`DriverPlane`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverPlane`] implementation
+/// for a [`struct drm_plane`] automatically. It is identical to [`Plane`], except that it does not
+/// provide access to the driver's private data.
+///
+/// It may be upcasted to a full [`Plane`] using [`Plane::from_opaque`] or
+/// [`Plane::try_from_opaque`].
+///
+/// # Invariants
+///
+/// - `plane` is initialized for as long as this object is made available to users.
+/// - The data layout of this structure is equivalent to [`struct drm_plane`].
+///
+/// [`struct drm_plane`]: srctree/include/drm/drm_plane.h
+#[repr(transparent)]
+pub struct OpaquePlane<T: KmsDriver> {
+    plane: Opaque<bindings::drm_plane>,
+    _p: PhantomData<T>,
+}
+
+impl<T: KmsDriver> Sealed for OpaquePlane<T> {}
+
+// SAFETY:
+// * Via our type variants our data layout is identical to `drm_plane`
+// * Since we don't expose `plane` to users before it has been initialized, this and our data
+//   layout ensure that `as_raw()` always returns a valid pointer to a `drm_plane`.
+unsafe impl<T: KmsDriver> AsRawPlane for OpaquePlane<T> {
+    fn as_raw(&self) -> *mut bindings::drm_plane {
+        self.plane.get()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_plane) -> &'a Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_plane`
+        unsafe { &*ptr.cast() }
+    }
+}
+
+// SAFETY: We only expose this object to users directly after KmsDriver::create_objects has been
+// called.
+unsafe impl<T: KmsDriver> ModesettablePlane for OpaquePlane<T> {
+    type State = OpaquePlaneState<T>;
+}
+
+// SAFETY: We don't expose OpaquePlane<T> to users before `base` is initialized in
+// Plane::<T>::new(), so `raw_mode_obj` always returns a valid pointer to a
+// bindings::drm_mode_object.
+unsafe impl<T: KmsDriver> ModeObject for OpaquePlane<T> {
+    type Driver = T;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: DRM planes exist for as long as the device does, so this pointer is always valid
+        unsafe { Device::borrow((*self.as_raw()).dev) }
+    }
+
+    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
+        // SAFETY: We don't expose DRM planes to users before `base` is initialized
+        unsafe { addr_of_mut!((*self.as_raw()).base) }
+    }
+}
+
+// SAFETY: Planes do not have a refcount
+unsafe impl<T: KmsDriver> StaticModeObject for OpaquePlane<T> {}
+
+// SAFETY: `funcs` is initialized when the plane is allocated
+unsafe impl<T: KmsDriver> ModeObjectVtable for OpaquePlane<T> {
+    type Vtable = bindings::drm_plane_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        // SAFETY: `as_raw()` always returns a valid pointer to a plane
+        unsafe { *self.as_raw() }.funcs
+    }
+}
+
+// SAFETY: Our plane interfaces are guaranteed to be thread-safe
+unsafe impl<T: KmsDriver> Send for OpaquePlane<T> {}
+unsafe impl<T: KmsDriver> Sync for OpaquePlane<T> {}
+
 /// A trait implemented by any type which can produce a reference to a [`struct drm_plane_state`].
 ///
 /// This is implemented internally by DRM.
@@ -572,6 +669,83 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
+// SAFETY: Shares the safety guarantee of Plane<T>'s vtable impl
+unsafe impl<T: DriverPlaneState> ModeObjectVtable for PlaneState<T> {
+    type Vtable = bindings::drm_plane_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        self.plane().vtable()
+    }
+}
+
+impl<T: DriverPlaneState> PlaneState<T> {
+    super::impl_from_opaque_mode_obj! {
+        fn <'a, D, P>(&'a OpaquePlaneState<D>) -> &'a Self
+        where
+            T: DriverPlaneState<Plane = P>;
+        use
+            P as DriverPlane,
+            D as KmsDriver
+    }
+}
+
+/// A [`struct drm_plane_state`] without a known [`DriverPlaneState`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverPlaneState`]
+/// implementation for a [`struct drm_plane_state`] automatically. It is identical to [`Plane`],
+/// except that it does not provide access to the driver's private data.
+///
+/// # Invariants
+///
+/// - The DRM C API and our interface guarantees that only the user has mutable access to `state`,
+///   up until [`drm_atomic_helper_commit_hw_done`] is called. Therefore, `plane` follows rust's
+///   data aliasing rules and does not need to be behind an [`Opaque`] type.
+/// - `state` is initialized for as long as this object is exposed to users.
+/// - The data layout of this structure is identical to [`struct drm_plane_state`].
+///
+/// [`struct drm_plane_state`]: srctree/include/drm/drm_plane.h
+/// [`drm_atomic_helper_commit_hw_done`]: srctree/include/drm/drm_atomic_helper.h
+#[repr(transparent)]
+pub struct OpaquePlaneState<T: KmsDriver> {
+    state: bindings::drm_plane_state,
+    _p: PhantomData<T>,
+}
+
+impl<T: KmsDriver> AsRawPlaneState for OpaquePlaneState<T> {
+    type Plane = OpaquePlane<T>;
+}
+
+impl<T: KmsDriver> private::AsRawPlaneState for OpaquePlaneState<T> {
+    fn as_raw(&self) -> &bindings::drm_plane_state {
+        &self.state
+    }
+
+    unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_plane_state {
+        &mut self.state
+    }
+}
+
+impl<T: KmsDriver> FromRawPlaneState for OpaquePlaneState<T> {
+    unsafe fn from_raw<'a>(ptr: *const bindings::drm_plane_state) -> &'a Self {
+        // SAFETY: Our data layout is identical to `ptr`
+        unsafe { &*ptr.cast() }
+    }
+
+    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_plane_state) -> &'a mut Self {
+        // SAFETY: Our data layout is identical to `ptr`
+        unsafe { &mut *ptr.cast() }
+    }
+}
+
+// SAFETY: Shares the safety guarantee of OpaquePlane<T>'s vtable impl
+unsafe impl<T: KmsDriver> ModeObjectVtable for OpaquePlaneState<T> {
+    type Vtable = bindings::drm_plane_funcs;
+
+    fn vtable(&self) -> *const Self::Vtable {
+        self.plane().vtable()
+    }
+}
+
 unsafe extern "C" fn plane_destroy_callback<T: DriverPlane>(plane: *mut bindings::drm_plane) {
     // SAFETY: DRM guarantees that `plane` points to a valid initialized `drm_plane`.
     unsafe { bindings::drm_plane_cleanup(plane) };
-- 
2.48.1

