Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222DC1A38C5
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 23:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727739561; cv=none; b=XJDOKTb+boADUx0zLH0yUypDMwyhGVwYZ1Hr7cH4fyADCLk5EysXRi5b4egVkUKpj9Mmbq2vXg4TR92SQHd4MAYEHcCzqxztXITtCqsu122DE1DkuyX8Bp75qGmeMm9RjFOv/M0JwyCTrFjl0pJgi158yhz4H6y0asXGrnbJG9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727739561; c=relaxed/simple;
	bh=pXRKPH27oL3fN6sCROrkZY024F0uvNyQlYCXbl83dIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JO8k2SPqrz/dHksMgFxogw/XNSwLuJeBwrwbXLDbPySxqiTxl6THIUuMUfUtzmlfTExfv91YK3CZvj/U+f/PapPpcEA1kXojCwRE1WOY2JryVDVsDaY+TSD4YbgCLLWqDkj9lQXMdpC7pXbJH49lBoDAxZhJUBoL8jd/kVTfgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QNSInKTd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QNSInKTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727739557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNcosQLumm6LvLMU8qHzc4TOTdZH/IRXYAw7EHjI1/s=;
	b=QNSInKTdPN8tuecboe1Vn31S9+1eBVRvQocCiCeYlhSV1nVq4H82rd8LgiGqfa19uYsPQ/
	+8ZsBFWjn0ZzR5tGZ1t8d5DbJCofZ0g0ZQxji+NMUrW9E8RZIrvhQNsQxsgti6khFzH3Yy
	lZfYsbWjnwZbnYdhEWmJnW+TrblMDJQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653--VkizbrXMPaIfd66sLcc4w-1; Mon,
 30 Sep 2024 19:39:12 -0400
X-MC-Unique: -VkizbrXMPaIfd66sLcc4w-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A33B019560B7;
	Mon, 30 Sep 2024 23:39:09 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DBBEE3003DEC;
	Mon, 30 Sep 2024 23:39:05 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>,
	Danilo Krummrich <dakr@kernel.org>,
	mcanal@igalia.com,
	airlied@redhat.com,
	zhiw@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org (open list)
Subject: [WIP RFC v2 14/35] WIP: rust: drm/kms: Add OpaqueCrtc and OpaqueCrtcState
Date: Mon, 30 Sep 2024 19:09:57 -0400
Message-ID: <20240930233257.1189730-15-lyude@redhat.com>
In-Reply-To: <20240930233257.1189730-1-lyude@redhat.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

This is the same thing as OpaqueConnector and OpaqueConnectorState, but for
CRTCs now.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

TODO:
* Add upcast functions

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/crtc.rs | 131 ++++++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/rust/kernel/drm/kms/crtc.rs b/rust/kernel/drm/kms/crtc.rs
index d84db49948380..1a3c9c448afcc 100644
--- a/rust/kernel/drm/kms/crtc.rs
+++ b/rust/kernel/drm/kms/crtc.rs
@@ -234,6 +234,41 @@ pub fn new<'a, 'b: 'a, P, C>(
         // SAFETY: We don't move anything
         Ok(unsafe { &*Box::into_raw(Pin::into_inner_unchecked(this)) })
     }
+
+    /// Attempt to convert an [`OpaqueCrtc`] into a fully qualified [`Crtc`].
+    ///
+    /// This checks if the given [`OpaqueCrtc`] uses the same [`DriverCrtc`] implementation, and
+    /// returns the [`OpaqueCrtc`] as a [`Crtc`] object if so.
+    pub fn try_from_opaque<'a, D>(opaque: &'a OpaqueCrtc<D>) -> Option<&'a Self>
+    where
+        D: KmsDriver,
+        T: DriverCrtc<Driver = D>
+    {
+        // SAFETY: The vtables for a `Crtc` are initialized throughout the lifetime of the object
+        let funcs = unsafe { (*opaque.crtc.get()).funcs };
+
+        // SAFETY: We only perform this transmutation if the opaque CRTC shares our vtable pointers,
+        // so the underlying `Crtc` must share our data layout.
+        ptr::eq(funcs, &T::OPS.funcs).then(|| unsafe { mem::transmute(opaque) })
+    }
+
+    /// Convert a [`OpaqueCrtc`] into its fully qualified [`Crtc`].
+    ///
+    /// This is an infallible version of [`Self::try_from_opaque`]. This function is mainly useful
+    /// for drivers where only a single [`DriverCrtc`] implementation exists.
+    ///
+    /// # Panics
+    ///
+    /// This function will panic if the underlying CRTC in the provided [`OpaqueCrtc`] does not
+    /// belong to the same [`DriverCrtc`] implementation.
+    pub fn from_opaque<'a, D>(opaque: &'a OpaqueCrtc<D>) -> &'a Self
+    where
+        D: KmsDriver,
+        T: DriverCrtc<Driver = D>
+    {
+        Self::try_from_opaque(opaque)
+            .expect("Passed OpaqueCrtc does not share this DriverCrtc implementation")
+    }
 }
 
 /// A trait implemented by any type that acts as a [`struct drm_crtc`] interface.
@@ -267,6 +302,66 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::drm_crtc) -> &'a Self {
     }
 }
 
+/// A [`struct drm_crtc`] without a known [`DriverCrtc`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverCrtc`] implementation
+/// for a [`struct drm_crtc`] automatically. It is identical to [`Crtc`], except that it does not
+/// provide access to the driver's private data.
+///
+/// It may be upcasted to a full [`Crtc`] using [`Crtc::from_opaque`] or
+/// [`Crtc::try_from_opaque`].
+///
+/// # Invariants
+///
+/// - `crtc` is initialized for as long as this object is made available to users.
+/// - The data layout of this structure is equivalent to [`struct drm_crtc`].
+///
+/// [`struct drm_crtc`]: srctree/include/drm/drm_crtc.h
+#[repr(transparent)]
+pub struct OpaqueCrtc<T: KmsDriver> {
+    crtc: Opaque<bindings::drm_crtc>,
+    _p: PhantomData<T>
+}
+
+impl<T: KmsDriver> Sealed for OpaqueCrtc<T> {}
+
+impl<T: KmsDriver> AsRawCrtc for OpaqueCrtc<T> {
+    type State = OpaqueCrtcState<T>;
+
+    fn as_raw(&self) -> *mut bindings::drm_crtc {
+        self.crtc.get()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_crtc) -> &'a Self {
+        // SAFETY: Our data layout starts with `bindings::drm_crtc`
+        unsafe { &*ptr.cast() }
+    }
+}
+
+impl<T: KmsDriver> ModeObject for OpaqueCrtc<T> {
+    type Driver = T;
+
+    fn drm_dev(&self) -> &Device<Self::Driver> {
+        // SAFETY: The parent device for a DRM connector will never outlive the connector, and this
+        // pointer is invariant through the lifetime of the connector
+        unsafe { Device::borrow((*self.as_raw()).dev) }
+    }
+
+    fn raw_mode_obj(&self) -> *mut bindings::drm_mode_object {
+        // SAFETY: We don't expose DRM connectors to users before `base` is initialized
+        unsafe { addr_of_mut!((*self.as_raw()).base) }
+    }
+}
+
+// SAFETY: CRTCs are non-refcounted modesetting objects
+unsafe impl<T: KmsDriver> StaticModeObject for OpaqueCrtc<T> {}
+
+// SAFETY: Our CRTC interface is guaranteed to be thread-safe
+unsafe impl<T: KmsDriver> Send for OpaqueCrtc<T> {}
+
+// SAFETY: Our CRTC interface is guaranteed to be thread-safe
+unsafe impl<T: KmsDriver> Sync for OpaqueCrtc<T> {}
+
 unsafe impl Zeroable for bindings::drm_crtc_state { }
 
 impl<T: DriverCrtcState> Sealed for CrtcState<T> {}
@@ -400,6 +495,42 @@ unsafe fn from_raw<'a>(ptr: *const bindings::drm_crtc_state) -> &'a Self {
     }
 }
 
+/// A [`struct drm_crtc_state`] without a known [`DriverCrtcState`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverCrtcState`]
+/// implementation for a [`struct drm_crtc_state`] automatically. It is identical to [`Crtc`],
+/// except that it does not provide access to the driver's private data.
+///
+/// TODO: Add upcast functions
+///
+/// # Invariants
+///
+/// - `state` is initialized for as long as this object is exposed to users.
+/// - The data layout of this type is identical to [`struct drm_crtc_state`].
+///
+/// [`struct drm_crtc_state`]: srctree/include/drm/drm_crtc.h
+#[repr(transparent)]
+pub struct OpaqueCrtcState<T: KmsDriver> {
+    state: Opaque<bindings::drm_crtc_state>,
+    _p: PhantomData<T>
+}
+
+impl<T: KmsDriver> AsRawCrtcState for OpaqueCrtcState<T> {
+    type Crtc = OpaqueCrtc<T>;
+}
+
+impl<T: KmsDriver> private::AsRawCrtcState for OpaqueCrtcState<T> {
+    fn as_raw(&self) -> *mut bindings::drm_crtc_state {
+        self.state.get()
+    }
+}
+
+impl<T: KmsDriver> FromRawCrtcState for OpaqueCrtcState<T> {
+    unsafe fn from_raw<'a>(ptr: *const bindings::drm_crtc_state) -> &'a Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_crtc_state`
+        unsafe { &*(ptr.cast()) }
+    }
+}
 unsafe extern "C" fn crtc_destroy_callback<T: DriverCrtc>(
     crtc: *mut bindings::drm_crtc
 ) {
-- 
2.46.1

