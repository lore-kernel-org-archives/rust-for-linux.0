Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0BD2BDC3C
	for <rust-for-linux@vger.kernel.org>; Wed, 21 May 2025 20:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747860481; cv=none; b=SzqTP0ntIvAGLxwukb1CWEtNBqybT5T3EwGmks6kOqpZGcPS9RZGyEqNOZg/x8L5I4tMdyU4KGOzg7YxT7i5mBzTMkmtHWJbkjHYReb1+sL1/C524K0crZzoBcN2PSaVWkGTzI+lTSA7otLaDfFff8yq9LM04BVFVz4eNaTGvlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747860481; c=relaxed/simple;
	bh=DuvypMr/sE/KpBVknOlgRGkISCm1LawO64dkNdpNx3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BggEXgs+EJJxFbJ+VW4NYl+xxW+hC+zMfszEAoE9zKqHlEP6EvV4YvRs0cNArxr5UnyuWnSfvrXUC4A0jA9v65XUZ/YCDr5QJMjfrVvDyVejs43jjTUjkQI71K80bObnD+wjv83s3TyvytSK4mKNvLLBSJXNqQymJxFS4FOSo90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DBs4xjsM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DBs4xjsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747860478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RgwTalUkkAEy4l2DBxsf/Vl1dLrGg/xqBOQv/M/fvO0=;
	b=DBs4xjsMOyGXgiy3EL6geTjN+Ox+ncHXSc6M7cyFmAGF+wsKM7fwhH4FKk6jyy0KAv8seI
	rhg7Id+oIHZaaSZHqsP+pjOqJ/0Qu/g7kZylaBumbmcLL4eKk/lw0ICblrFRE68BoCwuY7
	9uRHkMdW9C4ywgFoduC7bQ1nFrtQLCI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-FkNUIldNNVeR8qfxLEVciQ-1; Wed,
 21 May 2025 16:47:56 -0400
X-MC-Unique: FkNUIldNNVeR8qfxLEVciQ-1
X-Mimecast-MFC-AGG-ID: FkNUIldNNVeR8qfxLEVciQ_1747860469
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C2E3195608E;
	Wed, 21 May 2025 20:47:49 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.100])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 82E8B19560B7;
	Wed, 21 May 2025 20:47:44 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Asahi Lina <lina@asahilina.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GPUS [RUST])
Subject: [PATCH v2 05/12] rust: gem: Introduce BaseDriverObject::Args
Date: Wed, 21 May 2025 16:29:12 -0400
Message-ID: <20250521204654.1610607-6-lyude@redhat.com>
In-Reply-To: <20250521204654.1610607-1-lyude@redhat.com>
References: <20250521204654.1610607-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

This is an associated type that may be used in order to specify a data-type
to pass to gem objects when construction them, allowing for drivers to more
easily initialize their private-data for gem objects.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nova/gem.rs |  5 +++--
 rust/kernel/drm/gem/mod.rs  | 17 ++++++++++++++---
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index a3024922f0d90..f2f23320110dd 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -19,8 +19,9 @@ pub(crate) struct NovaObject {}
 impl gem::BaseDriverObject for NovaObject {
     type Driver = NovaDriver;
     type Object = gem::Object<Self>;
+    type Args = ();
 
-    fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
+    fn new(_dev: &NovaDevice, _size: usize, _args: Self::Args) -> impl PinInit<Self, Error> {
         try_pin_init!(NovaObject {})
     }
 }
@@ -34,7 +35,7 @@ pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self
             return Err(EINVAL);
         }
 
-        gem::Object::new(dev, aligned_size)
+        gem::Object::new(dev, aligned_size, ())
     }
 
     /// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 1165417b22df6..f0029e6989ed6 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -29,8 +29,15 @@ pub trait BaseDriverObject: Sync + Send + Sized {
     /// The GEM object type that will be passed to various callbacks.
     type Object: AllocImpl;
 
+    /// The data type to use for passing arguments to [`BaseDriverObject::new`].
+    type Args;
+
     /// Create a new driver data object for a GEM object of a given size.
-    fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
+    fn new(
+        dev: &drm::Device<Self::Driver>,
+        size: usize,
+        args: Self::Args,
+    ) -> impl PinInit<Self, Error>;
 
     /// Open a new handle to an existing object, associated with a File.
     fn open(_obj: &Self::Object, _file: &DriverFile<Self>) -> Result {
@@ -232,11 +239,15 @@ impl<T: BaseDriverObject> Object<T> {
     };
 
     /// Create a new GEM object.
-    pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
+    pub fn new(
+        dev: &drm::Device<T::Driver>,
+        size: usize,
+        args: T::Args,
+    ) -> Result<ARef<Self>> {
         let obj: Pin<KBox<Self>> = KBox::pin_init(
             try_pin_init!(Self {
                 obj: Opaque::new(bindings::drm_gem_object::default()),
-                data <- T::new(dev, size),
+                data <- T::new(dev, size, args),
                 // INVARIANT: The drm subsystem guarantees that the `struct drm_device` will live
                 // as long as the GEM object lives.
                 dev: dev.into(),
-- 
2.49.0

