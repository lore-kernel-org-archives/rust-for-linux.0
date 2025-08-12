Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73E72EAD15
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 11:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996984; cv=none; b=Soe/4FFd+Q5NT3avVGSnUGD/ZWVwxNPcujg/m4w19Vu2PCSF4AhteOzLRhKt7k/wCnClcNUTToz1KWuAgzYCSGtHBALwaQQEwLn6UeP3cnrW5s0nhYVEAIdmKod+zsATnWzXQgYDuRxb6hunDeFBO25lCgEoo5HkF+oWVHbF9D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996984; c=relaxed/simple;
	bh=dRZhMMbOhPKe2GJWD5fEJq1VAUz0OJMW6vAu952DSHw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pJUyqViMFP2OP45NtQZfpvLgFrSHYp1I94fuzx52Zef2dWIRDeQ2r+DXBMEOu31G0fpyTVj9Y5BO1O7V67wbBEEMR8F3mEh3tbZ593PilgF8f5dIk+KMBlisdrXcvKhlH/2uMAOnWWbHRUcYPCphjW8n4uRmRXcsM0Sn2PZyFqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=trevrosa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=trevrosa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-af9180a11bcso1010035066b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 04:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754996980; x=1755601780;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4cmy/s2VZg4LYWoUlK90R0+3I4q6tnI8g1RdZKLc0yY=;
        b=n6JjGO8Y3HgCb95fL3j8akQXoUOLAVsguN3rUphVz11H396hHd4S6bv3cUqInMP2xk
         nJrUui8CDspD6RCTPV5mITpkbLCOTuL9kh8LKvgToqQoCwZISyZ5k7wyjuvi0Q0LhXoY
         eN4z2Cr7ycBFzb9p+nqjhoXhZoN5Wm8NcOhg4QkDwehtxeEa5P65S8zEgzUKDO55WLWO
         c0nkJFxy1Ca9Zsz+Jxw3I0LqUQzyaUnFqcCZXBIGvenWgAXkfYG/tBcy38UebSShUItl
         iQdTrq/UwOWLP5zL7+iJAVXEdOE/ZEjklCp22ga1klBv3iw4xndS4zuBVXh1txK+Yjzb
         HK3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQut+ni0IwsSkXmH9CHGBQjnQwu1QPfJcxjxH6or9R1PB77RUD2OgmY4jGzTlBVGNu/2Iyx3nINaVLsYj5Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+KCG6wuJuzAG119/C+9GG5kPKkiQeZ5Tzl6m+pfd/MWL8pgSP
	8VRh5qtwptI6uNqQH9ufPZTNXctQ2+8Fc1sXhSLYeeQ/kNFFXxUWfUmWwxKI4J4dsBE=
X-Gm-Gg: ASbGncsFTiN73TrE2OjUxR5ublgQ8Iseq2dUomewvwt2d72ZZwjrF8B73CEzy9pTari
	NJaauo/+uuRc+pAvwbyL8oaMUwU6Ljo5LuHuDzJAvb4LPd+huzmmDq8NbParBsz4ZSWTuRvYdAh
	pl9fZvC4n09xZIUidgznTc6HtAwWnruaoNwR0Afj3kW1U+M2mR7ky0olKyS0lAG3mCGWYls/dy0
	EQ/u28gatM2ooJXIQdhPmMisjNEQ5Ah694Bf1HkL+7f4Ypvem0EKxcsp+yIgEzemsJoOguy37XP
	EA0XI553hBg11ea437kU6kbKsl7rB3Ijt1MH1QKzegCt52jyma+/jKvPbLg/oLKirM8Fm7xTNBV
	1M2ur392ugiCjDEun7M2UoWBjooaAXXv2B3IJYLgrP8MRxBAVIRmJoV3x
X-Google-Smtp-Source: AGHT+IEwqAnW3mzq2gaky9ZY3dCnkNTGkqUlv76xshBFzHBrNGhzk5EM+hw7estTnOZ3tM4aomzxuw==
X-Received: by 2002:a17:907:724e:b0:af9:41a4:25b3 with SMTP id a640c23a62f3a-afa1d96ec98mr269327766b.29.1754996979425;
        Tue, 12 Aug 2025 04:09:39 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af99604e648sm1189396966b.6.2025.08.12.04.09.38
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 04:09:38 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6156463fae9so10036966a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 04:09:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoblWefX1D2CrWacwJlQkEpXWsRKxoX6Lt8wkodGjlDF5FtYNIQwyl4wHHqy1h+t2IrJVtkTC5dD3igUW+ng==@vger.kernel.org
X-Received: by 2002:a17:907:e890:b0:af9:32db:2b50 with SMTP id
 a640c23a62f3a-afa1d6a4e21mr287378466b.10.1754996978255; Tue, 12 Aug 2025
 04:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: trev <trev@trevrosa.dev>
Date: Tue, 12 Aug 2025 19:09:11 +0800
X-Gmail-Original-Message-ID: <CACvsgUCBk5Dt2yBSy9_NA0z38-wP68vvBX7XDYgJGinTURT1kQ@mail.gmail.com>
X-Gm-Features: Ac12FXyEFCQLZpaPcjTv4p5-2b7rXO-pZrDbFpW4n9UvMnX6h4vXCRWx7WjFWh4
Message-ID: <CACvsgUCBk5Dt2yBSy9_NA0z38-wP68vvBX7XDYgJGinTURT1kQ@mail.gmail.com>
Subject: [PATCH] rust: aref: make `AlwaysRefCounted::inc_ref` an associated function
To: alex.gaynor@gmail.com, ojeda@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, dakr@kernel.org, arlied@gmail.com, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "aliceryhl@google.com" <aliceryhl@google.com>, vireshk@kernel.org, nm@ti.com, 
	sboyd@kernel.org, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, brauner@kernel.org
Cc: boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, jack@suse.cz
Content-Type: text/plain; charset="UTF-8"

`AlwaysRefCounted::inc_ref` is a function that shouldn't be called lightly.

To prevent accidentally calling it, `inc_ref` is now changed to be an
associated function.

Modifies all `AlwaysRefCounted` implementors to work with this change.

Suggested-by: Benno Lossin <lossin@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1177
Signed-off-by: Trevor Chan <trev@trevrosa.dev>
---
diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 4749fb6bffef..b205c9d4f057 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -246,9 +246,9 @@ extern "C" fn release(dev: *mut bindings::device) {

 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl crate::types::AlwaysRefCounted for Device {
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference guarantees
that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+        unsafe { bindings::get_device(obj.as_ref().as_raw()) };
     }

     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
index fefd394f064a..8124c72cd674 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -236,8 +236,8 @@ fn atomic_relaxed_op_unless(target: &AtomicU64,
op: impl Fn(u64) -> u64, pred: u
 // keeps the object alive in memory at least until a matching reference count
 // decrement is executed.
 unsafe impl<T: Operations> AlwaysRefCounted for Request<T> {
-    fn inc_ref(&self) {
-        let refcount = &self.wrapper_ref().refcount();
+    fn inc_ref(obj: &Self) {
+        let refcount = &obj.wrapper_ref().refcount();

         #[cfg_attr(not(CONFIG_DEBUG_MISC), allow(unused_variables))]
         let updated = atomic_relaxed_op_unless(refcount, |x| x + 1, 0);
diff --git a/rust/kernel/cred.rs b/rust/kernel/cred.rs
index 2599f01e8b28..6fb5d854c374 100644
--- a/rust/kernel/cred.rs
+++ b/rust/kernel/cred.rs
@@ -76,9 +76,9 @@ pub fn euid(&self) -> Kuid {
 // SAFETY: The type invariants guarantee that `Credential` is always
ref-counted.
 unsafe impl AlwaysRefCounted for Credential {
     #[inline]
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference means that the
refcount is nonzero.
-        unsafe { bindings::get_cred(self.0.get()) };
+        unsafe { bindings::get_cred(obj.0.get()) };
     }

     #[inline]
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index b8613289de8e..63b2d47df833 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -293,9 +293,9 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {

 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl crate::types::AlwaysRefCounted for Device {
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference guarantees
that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_raw()) };
+        unsafe { bindings::get_device(obj.as_raw()) };
     }

     unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 49ee12a906db..ccb83856745e 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -359,10 +359,10 @@ fn fmt(&self, f: &mut core::fmt::Formatter<'_>)
-> core::fmt::Result {

 // SAFETY: Instances of `FwNode` are always reference-counted.
 unsafe impl crate::types::AlwaysRefCounted for FwNode {
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference guarantees that the
         // refcount is non-zero.
-        unsafe { bindings::fwnode_handle_get(self.as_raw()) };
+        unsafe { bindings::fwnode_handle_get(obj.as_raw()) };
     }

     unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3bb7c83966cf..affbb58dad98 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -183,9 +183,9 @@ fn deref(&self) -> &Self::Target {
 // SAFETY: DRM device objects are always reference counted and the
get/put functions
 // satisfy the requirements.
 unsafe impl<T: drm::Driver> AlwaysRefCounted for Device<T> {
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference guarantees
that the refcount is non-zero.
-        unsafe { bindings::drm_dev_get(self.as_raw()) };
+        unsafe { bindings::drm_dev_get(obj.as_raw()) };
     }

     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index b71821cfb5ea..febb6cc83fd9 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -56,9 +56,9 @@ pub trait IntoGEMObject: Sized +
super::private::Sealed + AlwaysRefCounted {

 // SAFETY: All gem objects are refcounted.
 unsafe impl<T: IntoGEMObject> AlwaysRefCounted for T {
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference guarantees
that the refcount is non-zero.
-        unsafe { bindings::drm_gem_object_get(self.as_raw()) };
+        unsafe { bindings::drm_gem_object_get(obj.as_raw()) };
     }

     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 35fd5db35c46..831327e65c94 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -192,9 +192,9 @@ unsafe impl Sync for File {}
 // makes `ARef<File>` own a normal refcount.
 unsafe impl AlwaysRefCounted for File {
     #[inline]
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference means that the
refcount is nonzero.
-        unsafe { bindings::get_file(self.as_ptr()) };
+        unsafe { bindings::get_file(obj.as_ptr()) };
     }

     #[inline]
@@ -228,9 +228,9 @@ pub struct LocalFile {
 // makes `ARef<LocalFile>` own a normal refcount.
 unsafe impl AlwaysRefCounted for LocalFile {
     #[inline]
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference means that the
refcount is nonzero.
-        unsafe { bindings::get_file(self.as_ptr()) };
+        unsafe { bindings::get_file(obj.as_ptr()) };
     }

     #[inline]
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 43f525c0d16c..a030763c25fd 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -56,9 +56,9 @@ unsafe impl Sync for Mm {}
 // SAFETY: By the type invariants, this type is always refcounted.
 unsafe impl AlwaysRefCounted for Mm {
     #[inline]
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The pointer is valid since self is a reference.
-        unsafe { bindings::mmgrab(self.as_raw()) };
+        unsafe { bindings::mmgrab(obj.as_raw()) };
     }

     #[inline]
@@ -92,9 +92,9 @@ unsafe impl Sync for MmWithUser {}
 // SAFETY: By the type invariants, this type is always refcounted.
 unsafe impl AlwaysRefCounted for MmWithUser {
     #[inline]
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The pointer is valid since self is a reference.
-        unsafe { bindings::mmget(self.as_raw()) };
+        unsafe { bindings::mmget(obj.as_raw()) };
     }

     #[inline]
diff --git a/rust/kernel/mm/mmput_async.rs b/rust/kernel/mm/mmput_async.rs
index 9289e05f7a67..2d7117a76e33 100644
--- a/rust/kernel/mm/mmput_async.rs
+++ b/rust/kernel/mm/mmput_async.rs
@@ -36,9 +36,9 @@ unsafe impl Sync for MmWithUserAsync {}
 // SAFETY: By the type invariants, this type is always refcounted.
 unsafe impl AlwaysRefCounted for MmWithUserAsync {
     #[inline]
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The pointer is valid since self is a reference.
-        unsafe { bindings::mmget(self.as_raw()) };
+        unsafe { bindings::mmget(obj.as_raw()) };
     }

     #[inline]
diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 08126035d2c6..e0b8802f3c5f 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -1043,9 +1043,9 @@ unsafe impl Sync for OPP {}

 /// SAFETY: The type invariants guarantee that [`OPP`] is always refcounted.
 unsafe impl AlwaysRefCounted for OPP {
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference means that the
refcount is nonzero.
-        unsafe { bindings::dev_pm_opp_get(self.0.get()) };
+        unsafe { bindings::dev_pm_opp_get(obj.0.get()) };
     }

     unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 887ee611b553..579b2405d808 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -456,9 +456,9 @@ impl crate::dma::Device for Device<device::Core> {}

 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl crate::types::AlwaysRefCounted for Device {
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference guarantees
that the refcount is non-zero.
-        unsafe { bindings::pci_dev_get(self.as_raw()) };
+        unsafe { bindings::pci_dev_get(obj.as_raw()) };
     }

     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/pid_namespace.rs b/rust/kernel/pid_namespace.rs
index 0e93808e4639..d3302b86b864 100644
--- a/rust/kernel/pid_namespace.rs
+++ b/rust/kernel/pid_namespace.rs
@@ -46,9 +46,9 @@ pub unsafe fn from_ptr<'a>(ptr: *const
bindings::pid_namespace) -> &'a Self {
 // SAFETY: Instances of `PidNamespace` are always reference-counted.
 unsafe impl AlwaysRefCounted for PidNamespace {
     #[inline]
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference means that the
refcount is nonzero.
-        unsafe { bindings::get_pid_ns(self.as_ptr()) };
+        unsafe { bindings::get_pid_ns(obj.as_ptr()) };
     }

     #[inline]
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 8f028c76f9fa..04e650e6218f 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -293,9 +293,9 @@ impl crate::dma::Device for Device<device::Core> {}

 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl crate::types::AlwaysRefCounted for Device {
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference guarantees
that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+        unsafe { bindings::get_device(obj.as_ref().as_raw()) };
     }

     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index dbd77bb68617..484aad2dc647 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -24,7 +24,9 @@
 /// alive.)
 pub unsafe trait AlwaysRefCounted {
     /// Increments the reference count on the object.
-    fn inc_ref(&self);
+    ///
+    /// This function should not be called lightly.
+    fn inc_ref(obj: &Self);

     /// Decrements the reference count on the object.
     ///
@@ -103,7 +105,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// # // SAFETY: TODO.
     /// unsafe impl AlwaysRefCounted for Empty {
-    ///     fn inc_ref(&self) {}
+    ///     fn inc_ref(obj: &Self) {}
     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
     /// }
     ///
@@ -122,7 +124,7 @@ pub fn into_raw(me: Self) -> NonNull<T> {

 impl<T: AlwaysRefCounted> Clone for ARef<T> {
     fn clone(&self) -> Self {
-        self.inc_ref();
+        T::inc_ref(self);
         // SAFETY: We just incremented the refcount above.
         unsafe { Self::from_raw(self.ptr) }
     }
@@ -139,7 +141,7 @@ fn deref(&self) -> &Self::Target {

 impl<T: AlwaysRefCounted> From<&T> for ARef<T> {
     fn from(b: &T) -> Self {
-        b.inc_ref();
+        T::inc_ref(b);
         // SAFETY: We just incremented the refcount above.
         unsafe { Self::from_raw(NonNull::from(b)) }
     }
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 7d0935bc325c..b0577b00280c 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -349,9 +349,9 @@ pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
 // SAFETY: The type invariants guarantee that `Task` is always refcounted.
 unsafe impl crate::types::AlwaysRefCounted for Task {
     #[inline]
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference means that the
refcount is nonzero.
-        unsafe { bindings::get_task_struct(self.as_ptr()) };
+        unsafe { bindings::get_task_struct(obj.as_ptr()) };
     }

     #[inline]
