Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79062194C92
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Sep 2024 23:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727739553; cv=none; b=CrBfpR5CK99sU7nMSo2RxCKuNkPN/13SkXTmrU0dZDjnUKQ/T9NPftDP8i+CdVSvZH95UhCcKE1s+CUl7U68Qlf+w+DdDywFc8w8c5YmDxS19VN/nL0QS+X3pdOHDSOr59tD1+sogHoJXvPCmGvE5SWdQ0wKmhjxTkMzf+2uzzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727739553; c=relaxed/simple;
	bh=zGIXGcE7n/V6LNixwgC35gzBEHhpwAd07WAagwLA8fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Smjj5cJJTyt1r3ullmpBIGWZUtxtcnc4ibw7g0DvWEWyeTCNDcaay/m/9JzlRnPm/w1CF1T0403Ja0s7NYJ2HMt1aW/FAFVliTX0Udwmfi5J0QesVuqZlKU3h/OIYBHHsSNGXNB/JBuH6mnsDkTz/8SJEI8C8E28WM95Wv67Kas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LhYscvsL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LhYscvsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727739550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j6rI5OuJT5Uhwr5YsNsmFqxJRozJhSEgscnGrLzTJHQ=;
	b=LhYscvsL1CFVkowFyFEZLrCp/0GAANcaiEcVirYPFBMkbuWefwzbujr0b/orIUjsWKdpZb
	QPVPRa4EoUFEqoq4bfvGEsGWl7BF8DDiXSt+EXE7PC1ggXgy9WJYq8yeJp3aLRDX8JwXrz
	OG3oHyUzyh/aPi7JOzqdGxBFc5ExgoU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-T22mXw6dOM2PCD_MgYanjg-1; Mon,
 30 Sep 2024 19:39:05 -0400
X-MC-Unique: T22mXw6dOM2PCD_MgYanjg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E91D6196A122;
	Mon, 30 Sep 2024 23:39:02 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 25EDD3003DEC;
	Mon, 30 Sep 2024 23:38:58 +0000 (UTC)
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
Subject: [WIP RFC v2 13/35] WIP: rust: drm/kms: Add OpaqueConnector and OpaqueConnectorState
Date: Mon, 30 Sep 2024 19:09:56 -0400
Message-ID: <20240930233257.1189730-14-lyude@redhat.com>
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

Since we allow drivers to have multiple implementations of DriverConnector
and DriverConnectorState (in C, the equivalent of this is having multiple
structs which embed drm_connector) - there are some situations we will run
into where it's not possible for us to know the corresponding
DriverConnector or DriverConnectorState for a given connector. The most
obvious one is iterating through all connectors on a KMS device.

So, take advantage of the various connector traits we added to introduce
OpaqueConnector<> and OpaqueConnectorState<> which both can be used as a
DRM connector and connector state respectively without needing to know the
corresponding traits.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---

TODO:
* Add upcast functions for these types

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms/connector.rs | 108 +++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index ec842ebc111ae..98ac7fb781d4e 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -359,6 +359,64 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a Self {
     T::get_modes(connector.guard(&guard), &guard)
 }
 
+/// A [`struct drm_connector`] without a known [`DriverConnector`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverConnector`]
+/// implementation for a [`struct drm_connector`] automatically. It is identical to [`Connector`],
+/// except that it does not provide access to the driver's private data.
+///
+/// TODO: Add upcast methods for this
+///
+/// # Invariants
+///
+/// - `connector` is initialized for as long as this object is exposed to users.
+/// - The data layout of this type is equivalent to [`struct drm_connector`].
+///
+/// [`struct drm_connector`]: srctree/include/drm/drm_connector.h
+#[repr(transparent)]
+pub struct OpaqueConnector<T: KmsDriver> {
+    connector: Opaque<bindings::drm_connector>,
+    _p: PhantomData<T>
+}
+
+impl<T: KmsDriver> Sealed for OpaqueConnector<T> {}
+
+impl<T: KmsDriver> AsRawConnector for OpaqueConnector<T> {
+    type Driver = T;
+    type State = OpaqueConnectorState<T>;
+
+    fn as_raw(&self) -> *mut bindings::drm_connector {
+        self.connector.get()
+    }
+
+    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_connector`
+        unsafe { &*ptr.cast() }
+    }
+}
+
+impl<T: KmsDriver> ModeObject for OpaqueConnector<T> {
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
+        unsafe { &mut (*self.as_raw()).base }
+    }
+}
+
+// SAFETY: Connectors are reference counted mode objects
+unsafe impl<T: KmsDriver> RcModeObject for OpaqueConnector<T> {}
+
+// SAFETY: Our connector interfaces are guaranteed to be thread-safe
+unsafe impl<T: KmsDriver> Send for OpaqueConnector<T> {}
+unsafe impl<T: KmsDriver> Sync for OpaqueConnector<T> {}
+
 /// A privileged [`Connector`] obtained while holding a [`ModeConfigGuard`].
 ///
 /// This provides access to various methods for [`Connector`] that must happen under lock, such as
@@ -537,6 +595,56 @@ unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) -> &'a mut S
     }
 }
 
+/// A [`struct drm_connector_state`] without a known [`DriverConnectorState`] implementation.
+///
+/// This is mainly for situations where our bindings can't infer the [`DriverConnectorState`]
+/// implementation for a [`struct drm_connector_state`] automatically. It is identical to
+/// [`Connector`], except that it does not provide access to the driver's private data.
+///
+/// TODO: Add upcast functions
+///
+/// # Invariants
+///
+/// - `state` is initialized for as long as this object is exposed to users.
+/// - The data layout of this type is identical to [`struct drm_connector_state`].
+/// - The DRM C API and our interface guarantees that only the user has mutable access to `state`,
+///   up until [`drm_atomic_helper_commit_hw_done`] is called. Therefore, `connector` follows rust's
+///   data aliasing rules and does not need to be behind an [`Opaque`] type.
+///
+/// [`struct drm_connector_state`]: srctree/include/drm/drm_connector.h
+/// [`drm_atomic_helper_commit_hw_done`]: srctree/include/drm/drm_atomic_helper.h
+#[repr(transparent)]
+pub struct OpaqueConnectorState<T: KmsDriver> {
+    state: bindings::drm_connector_state,
+    _p: PhantomData<T>
+}
+
+impl<T: KmsDriver> AsRawConnectorState for OpaqueConnectorState<T> {
+    type Connector = OpaqueConnector<T>;
+}
+
+impl<T: KmsDriver> private::AsRawConnectorState for OpaqueConnectorState<T> {
+    fn as_raw(&self) -> &bindings::drm_connector_state {
+        &self.state
+    }
+
+    unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_connector_state {
+        &mut self.state
+    }
+}
+
+impl<T: KmsDriver> FromRawConnectorState for OpaqueConnectorState<T> {
+    unsafe fn from_raw<'a>(ptr: *const bindings::drm_connector_state) -> &'a Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_connector_state`
+        unsafe { &*ptr.cast() }
+    }
+
+    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) -> &'a mut Self {
+        // SAFETY: Our data layout is identical to `bindings::drm_connector_state`
+        unsafe { &mut *ptr.cast() }
+    }
+}
+
 unsafe extern "C" fn atomic_duplicate_state_callback<T: DriverConnectorState>(
     connector: *mut bindings::drm_connector
 ) -> *mut bindings::drm_connector_state
-- 
2.46.1

