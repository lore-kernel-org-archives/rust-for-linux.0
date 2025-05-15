Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C93E288CAC
	for <rust-for-linux@vger.kernel.org>; Thu, 15 May 2025 21:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747345497; cv=none; b=H+Drtf09LhdUk7oO5fXXqJFqY5RDrCqDh3fN/vsVSOGOnngKM75ml5QS9gkmOGp/bJQPjlY3m6X5jmovxWYU1mJ2/ruuuboYVngLm0YvlR3WQjE0qBG9dhBeM7n1oqbJrkKTy6vs3DwsdsVVnzluwmH1lyRiiAOrVDcVN4YIBlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747345497; c=relaxed/simple;
	bh=YGEox37MzxRqdGjNWoB/VQ0JfOrPPsOtnay+RamBT/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y/I6TbwwrE40zy6BVw92g4jjwPCrdbJKIzIzTIJVHEfhpSHSWG1q6xQr0/31uRCCkhI9l7p6WfVuXqkT0UgQeAhA3cMbYINgw8NZym/GYG/S990NgMVS4jVxPr9TXCl7+73z13izLDwbKHJ3KUxkaKryJgxXJ2VGpRCigRg6JcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IdyHmFai; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IdyHmFai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747345495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k6BH9jkFOlt7pbvFaL/w3vpn2zVw+6gfpYjS0/aLmXA=;
	b=IdyHmFaiv2RxEn8Ygsmd1kfcrfmN3rZ3bQEmP47mbMGff2F/CJlTJ5FwyrSQGnN/mBeBRL
	nxuFiMt6ejUUxm17BJdm6C1EK0OFz5b0iDv2Wym5GwADmEqbTlee3+ZnZRX0ByReFnN8Qu
	4U01ronl0ujxqwcFO7GOaUv5Jk9maNQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-Sv1U90pSMy-ODy-ngUOSiw-1; Thu,
 15 May 2025 17:44:51 -0400
X-MC-Unique: Sv1U90pSMy-ODy-ngUOSiw-1
X-Mimecast-MFC-AGG-ID: Sv1U90pSMy-ODy-ngUOSiw_1747345489
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E7B4A180035F;
	Thu, 15 May 2025 21:44:48 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.82.40])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D65D61956094;
	Thu, 15 May 2025 21:44:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Asahi Lina <lina@asahilina.net>
Subject: [PATCH 2/2] rust: drm: gem: Add ObjectFile type alias
Date: Thu, 15 May 2025 17:42:38 -0400
Message-ID: <20250515214425.671423-3-lyude@redhat.com>
In-Reply-To: <20250515214425.671423-1-lyude@redhat.com>
References: <20250515214425.671423-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Just to reduce the clutter with the File<…> types in gem.rs.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index ffd45419d563a..b1f2bd4aa8cf8 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -14,6 +14,13 @@
 };
 use core::{mem, ops::Deref, ptr::NonNull};
 
+/// A type alias for retrieving a [`Driver`]s [`DriverFile`] implementation from its
+/// [`DriverObject`] implementation.
+///
+/// [`Driver`]: drm::Driver
+/// [`DriverFile`]: drm::file::DriverFile
+pub type ObjectFile<T> = drm::File<<<T as DriverObject>::Driver as drm::Driver>::File>;
+
 /// GEM object functions, which must be implemented by drivers.
 pub trait DriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
@@ -23,18 +30,12 @@ pub trait DriverObject: Sync + Send + Sized {
     fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
 
     /// Open a new handle to an existing object, associated with a File.
-    fn open(
-        _obj: &Object<Self>,
-        _file: &drm::File<<Self::Driver as drm::Driver>::File>,
-    ) -> Result {
+    fn open(_obj: &Object<Self>, _file: &ObjectFile<Self>) -> Result {
         Ok(())
     }
 
     /// Close a handle to an existing object, associated with a File.
-    fn close(
-        _obj: &Object<Self>,
-        _file: &drm::File<<Self::Driver as drm::Driver>::File>,
-    ) {
+    fn close(_obj: &Object<Self>, _file: &ObjectFile<Self>) {
     }
 }
 
@@ -79,9 +80,8 @@ extern "C" fn open_callback<T: DriverObject>(
     raw_file: *mut bindings::drm_file,
 ) -> core::ffi::c_int {
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
-    let file = unsafe {
-        drm::File::<<T::Driver as drm::Driver>::File>::as_ref(raw_file)
-    };
+    let file = unsafe { ObjectFile::<T>::as_ref(raw_file) };
+
     // SAFETY: `open_callback` is specified in the AllocOps structure for `Object<T>`, ensuring that
     // `raw_obj` is indeed contained within a `Object<T>`.
     let obj = unsafe { Object::<T>::as_ref(raw_obj) };
@@ -97,7 +97,7 @@ extern "C" fn close_callback<T: DriverObject>(
     raw_file: *mut bindings::drm_file,
 ) {
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
-    let file = unsafe { drm::File::<<T::Driver as drm::Driver>::File>::as_ref(raw_file) };
+    let file = unsafe { ObjectFile::<T>::as_ref(raw_file) };
 
     // SAFETY: `close_callback` is specified in the AllocOps structure for `Object<T>`, ensuring
     // that `raw_obj` is indeed contained within a `Object<T>`.
@@ -128,10 +128,7 @@ fn size(&self) -> usize {
 
     /// Creates a new handle for the object associated with a given `File`
     /// (or returns an existing one).
-    fn create_handle(
-        &self,
-        file: &drm::File<<Self::Driver as drm::Driver>::File>,
-    ) -> Result<u32>
+    fn create_handle(&self, file: &ObjectFile<Self>) -> Result<u32>
     where
         Self: DriverObject
     {
@@ -144,10 +141,7 @@ fn create_handle(
     }
 
     /// Looks up an object by its handle for a given `File`.
-    fn lookup_handle(
-        file: &drm::File<<Self::Driver as drm::Driver>::File>,
-        handle: u32,
-    ) -> Result<ARef<Self>>
+    fn lookup_handle(file: &ObjectFile<Self>, handle: u32) -> Result<ARef<Self>>
     where
         Self: DriverObject
     {
-- 
2.49.0

