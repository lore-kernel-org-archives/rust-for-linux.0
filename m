Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD2F30EF7A
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 22:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770417340; cv=none; b=WxvJ9EaeHxioUKC2srjTWiCSCHSLYaRMi7U9oVWyFFW3Xr5I8I4rzYyZNDhhDc5OFVDiLAnTIpZEGI2boR1oV9XRMXLxUyYxUM5/JlQiM8PbLeWDVD8d+hX7SubqeK6XwYOwKOc00dUqrMiCyEy4XG0ecBkgDO/SR0jEOC1/YTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770417340; c=relaxed/simple;
	bh=EWiLw56o2oAZvOESwic91wCfnm+084u+xkfD3e0P20M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=D9dRVRu+LOf5FpuqmFbp+lXxlLLTlDB04t4PDlvXef5UAhe0uv8ox8XN/Bv/gMRuDiB/yO1+eavYknerBx5nrc8K/8jh6h7lN1FEXtGRjUe73WDOFtdV03Lt/LCLHASqymx5D282tJLbNaaPoaVpl0kDRhHobMD1waYUUkjTh7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=STVjMFts; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="STVjMFts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770417339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gnS6QBaaX/P+IP6sZlPsB51TH+wxpemSFsKbutcNRhU=;
	b=STVjMFtsUFwZwK9MUIMbJ0X7g39uHgboRmG6Gaz2VQMQG8cb76LDVjFX86KgR0TlBVGG3H
	FF3yEnxmQrP78KQjfRhB6fo6u3jmf/QQwrwwTbtZ2Voi1pV/wOolWuu5T1BYdgqH0Nes5I
	2ZzCNQNmMllgM4IhMxBYg9SmOpgVM6Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-tOO4xw6nO3mXd-uRF53sIg-1; Fri,
 06 Feb 2026 17:35:34 -0500
X-MC-Unique: tOO4xw6nO3mXd-uRF53sIg-1
X-Mimecast-MFC-AGG-ID: tOO4xw6nO3mXd-uRF53sIg_1770417332
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 528131955F23;
	Fri,  6 Feb 2026 22:35:32 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.226])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AEC46192C7C3;
	Fri,  6 Feb 2026 22:35:30 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Benno Lossin <lossin@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Janne Grunau <j@jannau.net>
Subject: [PATCH v7 3/7] rust: gem: Introduce DriverObject::Args
Date: Fri,  6 Feb 2026 17:34:27 -0500
Message-ID: <20260206223431.693765-4-lyude@redhat.com>
In-Reply-To: <20260206223431.693765-1-lyude@redhat.com>
References: <20260206223431.693765-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: FqYL3sjZ7PzRNmWpd_qwvmflmULbxfLiZsNCOsPeiyo_1770417332
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This is an associated type that may be used in order to specify a data-type
to pass to gem objects when construction them, allowing for drivers to more
easily initialize their private-data for gem objects.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Janne Grunau <j@jananu.net>

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
index 82b3151e5ae3b..972d50d4342dd 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -62,8 +62,15 @@ pub trait DriverObject: Sync + Send + Sized {
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
@@ -242,11 +249,11 @@ impl<T: DriverObject> Object<T> {
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
2.53.0

