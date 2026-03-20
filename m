Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E63638E5C1
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 23:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774049834; cv=none; b=Dd8MH6IqIedKQTVh/IyKVM1TmfyXxwyh2Q5E1Ghu/G1BITZyDYdp3cAz95dGmbaiM8iUfbddmu47jgzJINZQqetuipnhjqUD21bcpJZ+1gzQImcNWOaEY6VBcQWcXC34dcbkTq+Yw26t3fBonxAgSgpzuQIa6pcD+/egCpjUyzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774049834; c=relaxed/simple;
	bh=jMl8Xxr2nmNohC+5tBcpcjRj8bRkisB3AHxNwYGtSp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=NEVMzx3oBKhx5PcvEwRLvz+npEbeXUhbjhuE8zx3EA37RHD5+JfBnRByNPT3OoVTgob9tlyo9Of7xYxOYBDqbPz4Dcgo+OPZ3ju9rVCMjJ+yLEvQE/jyGsXrTepaloaD1kqqYsGPTF+t9+rhD5U6SOuOG9WcjUnaMFL+jWd70Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NPUvKgJi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NPUvKgJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774049831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sxiOvgN5DZSPamM+FiFpphp0MrOzJ23HjWyPejweAYg=;
	b=NPUvKgJiRwgdfyabLisi1oO67wAextARzgCI2I7zlnEp9MMWGjPbHzGnNm3Rjkdr2ajarW
	t8+5+dcsCkkaD7HWTxnBwS8j/4EobWpFmsNn8k9K8WEo8xp1f4wmdLXb65mxuZ5RVBYHVT
	ot7BfEbvpWN5O4xo3hi/N/7bjFOtcs0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-106-YI8hEWmMNjeTCdhfZeRguw-1; Fri,
 20 Mar 2026 19:37:08 -0400
X-MC-Unique: YI8hEWmMNjeTCdhfZeRguw-1
X-Mimecast-MFC-AGG-ID: YI8hEWmMNjeTCdhfZeRguw_1774049826
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B8492195608C;
	Fri, 20 Mar 2026 23:37:05 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4AC1A180075C;
	Fri, 20 Mar 2026 23:37:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	"Gary Guo" <gary@garyguo.net>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Shankari Anand" <shankari.ak0208@gmail.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"David Airlie" <airlied@gmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Asahi Lina" <lina+kernel@asahilina.net>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v6 1/5] rust/drm: Fix potential drop of uninitialized driver data
Date: Fri, 20 Mar 2026 19:34:26 -0400
Message-ID: <20260320233645.950190-2-lyude@redhat.com>
In-Reply-To: <20260320233645.950190-1-lyude@redhat.com>
References: <20260320233645.950190-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 0cCsoip7yxGXo2rRN8yLbrNwdnBSNT2XS91LSbTRY3I_1774049826
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

It was pointed out during patch review that if we fail to initialize the
driver's private data in drm::device::Device::new(), we end up calling
drm_dev_put(). This would call down to release(), which calls
core::ptr::drop_in_place() on the device, which would result in releasing
currently uninitialized private driver data.

So, fix this by just keeping track of when the private driver data is
initialized or not and sticking it in a MaybeUninit.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
Cc: <stable@vger.kernel.org> # v6.16+
---
 rust/kernel/drm/device.rs | 53 +++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 629ef0bd1188e..38ae8de0af5d6 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -22,12 +22,14 @@
 };
 use core::{
     alloc::Layout,
-    mem,
-    ops::Deref,
-    ptr::{
+    cell::UnsafeCell,
+    mem::{
         self,
-        NonNull, //
+        MaybeUninit, //
     },
+    ops::Deref,
+    ptr::NonNull,
+    sync::atomic::*,
 };
 
 #[cfg(CONFIG_DRM_LEGACY)]
@@ -71,7 +73,14 @@ macro_rules! drm_legacy_fields {
 #[repr(C)]
 pub struct Device<T: drm::Driver> {
     dev: Opaque<bindings::drm_device>,
-    data: T::Data,
+
+    /// Keeps track of whether we've initialized the device data yet.
+    pub(super) data_is_init: AtomicBool,
+
+    /// The Driver's private data.
+    ///
+    /// This must only be written to from [`Device::new`].
+    pub(super) data: UnsafeCell<MaybeUninit<T::Data>>,
 }
 
 impl<T: drm::Driver> Device<T> {
@@ -128,8 +137,13 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
         .cast();
         let raw_drm = NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOMEM)?;
 
+        // Extract *mut MaybeUninit<T::Data> from UnsafeCell<MaybeUninit<T::Data>>
         // SAFETY: `raw_drm` is a valid pointer to `Self`.
-        let raw_data = unsafe { ptr::addr_of_mut!((*raw_drm.as_ptr()).data) };
+        let raw_data = unsafe { (*(raw_drm.as_ptr())).data.get() };
+
+        // Extract *mut T::Data from *mut MaybeUninit<T::Data>
+        // SAFETY: `raw_data` is derived from `raw_drm` which is a valid pointer to `Self`.
+        let raw_data = unsafe { (*raw_data).as_mut_ptr() };
 
         // SAFETY:
         // - `raw_data` is a valid pointer to uninitialized memory.
@@ -144,6 +158,14 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
             unsafe { bindings::drm_dev_put(drm_dev) };
         })?;
 
+        // SAFETY: We just initialized raw_drm above using __drm_dev_alloc(), ensuring it is safe to
+        // dereference
+        unsafe {
+            (*raw_drm.as_ptr())
+                .data_is_init
+                .store(true, Ordering::Relaxed)
+        };
+
         // SAFETY: The reference count is one, and now we take ownership of that reference as a
         // `drm::Device`.
         Ok(unsafe { ARef::from_raw(raw_drm) })
@@ -195,6 +217,22 @@ extern "C" fn release(ptr: *mut bindings::drm_device) {
         // SAFETY: `ptr` is a valid pointer to a `struct drm_device` and embedded in `Self`.
         let this = unsafe { Self::from_drm_device(ptr) };
 
+        // SAFETY:
+        // - Since we are in release(), we are guaranteed that no one else has access to `this`.
+        // - We confirmed above that `this` is a valid pointer to an initialized `Self`.
+        let is_init = unsafe { &*this }.data_is_init.load(Ordering::Relaxed);
+        if is_init {
+            // SAFETY:
+            // - We confirmed we have unique access to this above.
+            // - We confirmed that `data` is initialized above.
+            let data_ptr = unsafe { &mut (*this).data };
+
+            // SAFETY:
+            // - We checked that the data is initialized above.
+            // - We do not use `data` any point after calling this function.
+            unsafe { data_ptr.get_mut().assume_init_drop() };
+        }
+
         // SAFETY:
         // - When `release` runs it is guaranteed that there is no further access to `this`.
         // - `this` is valid for dropping.
@@ -206,7 +244,8 @@ impl<T: drm::Driver> Deref for Device<T> {
     type Target = T::Data;
 
     fn deref(&self) -> &Self::Target {
-        &self.data
+        // SAFETY: `data` is only written to once in `Device::new()`, so this read will never race.
+        unsafe { (&*self.data.get()).assume_init_ref() }
     }
 }
 
-- 
2.53.0

