Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146272D063A
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 22:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764713460; cv=none; b=h3+2s3b7vVpX1tTHmzriq2mdbyGu4NUf5wqwfMK0dQdojrVB0SS5tr6Yqkm4EquEsSO8mk50DSxzmTl60n0jejK1ArGwPTeBQim/5tcmLnLj5RTASU1035zt73e75c/L9XtkDi1x2bQY31tjaXLrUOpuhTaqEVFLSq+LHkqR9IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764713460; c=relaxed/simple;
	bh=oQWmv0/03u1pB5enFt3kjQ6069YTJDfkF+ByQjo1CPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RF5w/9P8NUwJQY/ZBfabCVNvC7UH5GVxjaW+0UkVOaRhoHTTc5dUAJAEnaZqHzKyLoSqtIny4jylMH9saH6/AdXTanwZIYVr+TH7xPy2pibJGDZQXLXrpG4fnXMfXWpwam2LBmOKnMdJ93rWLJvbtgNMNN3la90cLJPXutUcGqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kk7TKLzk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kk7TKLzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764713458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3ewLJGTouE1PDxadgs2OlNf/fVuBjcP1EBInz5FRjg=;
	b=Kk7TKLzkXgbhFayp4Ub4hoh9uXIg3lEduw9FhgwUwjNkWfkA/dQRTFIZyUMW+cEpbNKaBC
	tWcscSedEiU4kE7AqaPTy7imeay9shXIccCfwFNb3CbYQXBbJPONDaJHihSEDcxnxX9T7+
	ODZ3uwsHLkMjBTAcOyjJ0LK1qC6avaE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-158-WdB0spFGP7uJIW3oUr7-Iw-1; Tue,
 02 Dec 2025 17:10:52 -0500
X-MC-Unique: WdB0spFGP7uJIW3oUr7-Iw-1
X-Mimecast-MFC-AGG-ID: WdB0spFGP7uJIW3oUr7-Iw_1764713449
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 659D2180028A;
	Tue,  2 Dec 2025 22:10:48 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.80.109])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8DF0919560A7;
	Tue,  2 Dec 2025 22:10:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GPUS [RUST])
Subject: [PATCH v6 4/8] rust: gem: Introduce DriverObject::Args
Date: Tue,  2 Dec 2025 17:03:30 -0500
Message-ID: <20251202220924.520644-5-lyude@redhat.com>
In-Reply-To: <20251202220924.520644-1-lyude@redhat.com>
References: <20251202220924.520644-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

This is an associated type that may be used in order to specify a data-type
to pass to gem objects when construction them, allowing for drivers to more
easily initialize their private-data for gem objects.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

---
V3:
* s/BaseDriverObject/DriverObject/
V4:
* Fix leftover reference to BaseObjectDriver in rustdoc for
  DriverObject::Args
V6:
* Fix build errors in Tyr

 drivers/gpu/drm/nova/gem.rs |  5 +++--
 drivers/gpu/drm/tyr/gem.rs  |  3 ++-
 rust/kernel/drm/gem/mod.rs  | 13 ++++++++++---
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index 2760ba4f3450b..173077eeb2def 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -18,8 +18,9 @@ pub(crate) struct NovaObject {}
 
 impl gem::DriverObject for NovaObject {
     type Driver = NovaDriver;
+    type Args = ();
 
-    fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
+    fn new(_dev: &NovaDevice, _size: usize, _args: Self::Args) -> impl PinInit<Self, Error> {
         try_pin_init!(NovaObject {})
     }
 }
@@ -33,7 +34,7 @@ pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self
             return Err(EINVAL);
         }
 
-        gem::Object::new(dev, aligned_size)
+        gem::Object::new(dev, aligned_size, ())
     }
 
     /// Look up a GEM object handle for a `File` and return an `ObjectRef` for it.
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 1273bf89dbd5d..bb5e7871efa94 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -11,8 +11,9 @@ pub(crate) struct TyrObject {}
 
 impl gem::DriverObject for TyrObject {
     type Driver = TyrDriver;
+    type Args = ();
 
-    fn new(_dev: &TyrDevice, _size: usize) -> impl PinInit<Self, Error> {
+    fn new(_dev: &TyrDevice, _size: usize, _args: ()) -> impl PinInit<Self, Error> {
         try_pin_init!(TyrObject {})
     }
 }
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index ec3c1b1775196..4bcaee2d4b308 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -64,8 +64,15 @@ pub trait DriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
     type Driver: drm::Driver;
 
+    /// The data type to use for passing arguments to [`DriverObject::new`].
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
     fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) -> Result {
@@ -244,11 +251,11 @@ impl<T: DriverObject> Object<T> {
     };
 
     /// Create a new GEM object.
-    pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
+    pub fn new(dev: &drm::Device<T::Driver>, size: usize, args: T::Args) -> Result<ARef<Self>> {
         let obj: Pin<KBox<Self>> = KBox::pin_init(
             try_pin_init!(Self {
                 obj: Opaque::new(bindings::drm_gem_object::default()),
-                data <- T::new(dev, size),
+                data <- T::new(dev, size, args),
             }),
             GFP_KERNEL,
         )?;
-- 
2.52.0

