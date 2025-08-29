Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2969D2D4801
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Aug 2025 22:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756507478; cv=none; b=sS2iWvYpGSHzCnJfuRM1ycATsoAJO3CWM21w1tTiohwk3/bDYGwtp5Sjre7baOoAue6XfYIRKWB5svCt1Zw49URznH3HzPj0EgL8Ch+nxaanAlXqrV7BwLsFfZanailNHOoWpUEFRVCT0g5jlH1m0coLOtU2gjM1TxEZd7L2b7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756507478; c=relaxed/simple;
	bh=kzqGDyWPM45AEnQWZknAN3s48rr9rv65Xi6dreboiSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ErhOm1zdXK3BnpPKDxFLlCKlV+wH3BP7Jhh6+YC0bPmrefMy6RkaZeA2l0hWee8sE7gML9Ib+1vjphiktzmK8eWyWAbW1tVC01Q0Lrrmt3p9Fv9GTIn+UU+l0p5bpsrM3HTQp6rzwaZ6ja2E5js2RBeUkcjJoQDjYCRz480y9LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jPALiSAq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jPALiSAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756507475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+gdTOKk1/eH4mNU8bIQIDKd1Df4IdxKppBOHckOsbo8=;
	b=jPALiSAqKLGT9obtJrJyItZO4oAceohYf0h8pmwU+5/spabj0ENEtz1TWyWcLHqx2gxf4+
	oQdxXfjUeZLXG1Q/Vizz8qgB5KFdFhezQgD46KH8/tt2I0sYmsL2oU/RVQeWWaaVHy52Cl
	oGooIOG2qd3uYwa+joDm/uirt/QA0ws=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-161-ZGNqGcuWNoi4PuuZYo_gnw-1; Fri,
 29 Aug 2025 18:41:46 -0400
X-MC-Unique: ZGNqGcuWNoi4PuuZYo_gnw-1
X-Mimecast-MFC-AGG-ID: ZGNqGcuWNoi4PuuZYo_gnw_1756507304
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B77E519560A6;
	Fri, 29 Aug 2025 22:41:43 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.78])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1D2DC1800280;
	Fri, 29 Aug 2025 22:41:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
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
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Asahi Lina <lina+kernel@asahilina.net>
Subject: [PATCH v3 02/14] rust: drm: gem: Add DriverFile type alias
Date: Fri, 29 Aug 2025 18:35:17 -0400
Message-ID: <20250829224116.477990-3-lyude@redhat.com>
In-Reply-To: <20250829224116.477990-1-lyude@redhat.com>
References: <20250829224116.477990-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Just to reduce the clutter with the File<…> types in gem.rs.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Rename ObjectFile to DriverFile

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 31c5799d995c5..80940ed11368d 100644
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
+pub type DriverFile<T> = drm::File<<<T as DriverObject>::Driver as drm::Driver>::File>;
+
 /// GEM object functions, which must be implemented by drivers.
 pub trait DriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
@@ -23,19 +30,12 @@ pub trait DriverObject: Sync + Send + Sized {
     fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
 
     /// Open a new handle to an existing object, associated with a File.
-    fn open(
-        _obj: &<Self::Driver as drm::Driver>::Object,
-        _file: &drm::File<<Self::Driver as drm::Driver>::File>,
-    ) -> Result {
+    fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) -> Result {
         Ok(())
     }
 
     /// Close a handle to an existing object, associated with a File.
-    fn close(
-        _obj: &<Self::Driver as drm::Driver>::Object,
-        _file: &drm::File<<Self::Driver as drm::Driver>::File>,
-    ) {
-    }
+    fn close(_obj: &<Self::Driver as drm::Driver>::Object, _file: &DriverFile<Self>) {}
 }
 
 /// Trait that represents a GEM object subtype
@@ -79,7 +79,8 @@ extern "C" fn open_callback<T: DriverObject>(
     raw_file: *mut bindings::drm_file,
 ) -> core::ffi::c_int {
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
-    let file = unsafe { drm::File::<<T::Driver as drm::Driver>::File>::from_raw(raw_file) };
+    let file = unsafe { DriverFile::<T>::from_raw(raw_file) };
+
     // SAFETY: `open_callback` is specified in the AllocOps structure for `DriverObject<T>`,
     // ensuring that `raw_obj` is contained within a `DriverObject<T>`
     let obj = unsafe { <<T::Driver as drm::Driver>::Object as IntoGEMObject>::from_raw(raw_obj) };
@@ -95,7 +96,7 @@ extern "C" fn close_callback<T: DriverObject>(
     raw_file: *mut bindings::drm_file,
 ) {
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
-    let file = unsafe { drm::File::<<T::Driver as drm::Driver>::File>::from_raw(raw_file) };
+    let file = unsafe { DriverFile::<T>::from_raw(raw_file) };
 
     // SAFETY: `close_callback` is specified in the AllocOps structure for `Object<T>`, ensuring
     // that `raw_obj` is indeed contained within a `Object<T>`.
-- 
2.50.0

