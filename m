Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E0E1A9FB4
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Sep 2025 05:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758691495; cv=none; b=DfzZVh9oXYK072HTF/3x6ouYDVlQkbSGTxewp7c41Lquje4qmZ/EPmlN9F3EtUjOhi3NyBbxI9DzYn+zd0mKDQDCvCwrxNcjKeD3i6GnpiyUB1/JQ0+CL+JoaBXIjIxyT4khTOayblrYeZ1Wbyg4XPB+qG9YpjmAy/Ruzi/9PSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758691495; c=relaxed/simple;
	bh=+1OeBJTgGMnp3gWdRHKzC6Llo0iwHAUU72nuvjxtxTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VSt+FrAXWUZl5Zi10WJSURpioWi+/zz/cGi/YBA12EJtwiI3auN3muS+4AQtY/H0LPv8+SpAfVLDbvNklP9H+C87PCuyrKkcQwC9kHMoYlrDv+edfkwUAbOkkHpeumNcCCX/FJULZULoLkZ6tqWQRPpt7yPr97qmTJUOPkrddiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=trevrosa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=trevrosa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-271d1305ad7so45410525ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 22:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758691493; x=1759296293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dj3R/1pqAud8u2xnVViX8zsHp3IVUOh+6lVJtzcl5w0=;
        b=jYLLZBRvZuWRQbYmJH4H8YL2ZSWu6sfoRfgAov2i2Xy2CXHW/dWIujtiivGN/NIMSO
         nkOdZsV3CD9BuaLGwsuuAbz3r2FZbL8822XzNPBZ4rZpIJpgy5U1IlPr7rYIuu1DR4gf
         AX/3HgYPqAJnJAXeBVAggGnBUlASjGPzm+Aiz6IBhILodu7+yaLGpmBu0OfOE1NrizOU
         MB85QGIDQRgNYQReM/XoX5U2RugLdHxi2Otl+yZeBCcGSc3MEDP+90sAHf2ISvXqYtBX
         W/jKnRdhqvA7I4meNa7j99D7t1tDxmL8BRfPm+6OeGnu59TCRoHxvzw3IqfGzAfFenHV
         6IOg==
X-Forwarded-Encrypted: i=1; AJvYcCX5VW2gcbO4mWsd2kySVFHreJC6RXHQ0QfdTuTIHP7F6aF3uBZttbU3JjHdDMhe+QszEL469m44xpX+IJSt1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs2UOjNTRHC/0jLC1B/36ZZXgiSDG3ccLv7v8z7D/fhE0+yTVI
	ika+a9DVt/P+JaPL/mbaPqAzJxdbxVn759mPx1UAuv7O2pwm92VkStGd0m+pABTSrmo=
X-Gm-Gg: ASbGncu9rGh9ITqa44zgVwva3B1DUAjnxrgQswM364/t6n0OP5ygdyWO6NtmBUJsC72
	Vf9p/7KuRx7OEz/FYeG6c4BrDOcFK36Jpa7iAfunOF9t1F7L67QQzglHn7hwxwZEemfif88wtxT
	a2A3fWlIpKG/3ggu22HslvEzGDK0ojE4ryyKfbxKNDPYeEqABv4G9sMs0A/BbO83XucxktPai4r
	IXjNqoOvwWSYhlcLVdG++OAi0di799fOnFLXTgAqzo+RkVgFiWsXCuiQAhBgDWUKLiNRwkvvGST
	abstRZt4MopFjH5oEaWEwWpjF50r4Z6D1rrJ9vMI2FgxMHPRIEiDzHyXBBH+aBSl3mLmdviGW5B
	nZLKsDwuNBuhOpqVVEFItF4/06dMQ3+pQc7m2w4l3dHy1hcJBIQIhiNIl
X-Google-Smtp-Source: AGHT+IFBd7H/u9wWBjq+tjia85ldlGjREeTbyVrXvVkXTV3ZE9aUCBHJNV1Rcoju5MdwIPNqsE4weQ==
X-Received: by 2002:a17:903:3545:b0:272:f9c3:31fa with SMTP id d9443c01a7336-27cc28bbfb5mr55372725ad.9.1758691492409;
        Tue, 23 Sep 2025 22:24:52 -0700 (PDT)
Received: from trevor.localdomain (1-36-33-221.ptr.netvigator.com. [1.36.33.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053230sm175269525ad.30.2025.09.23.22.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 22:24:50 -0700 (PDT)
From: Trevor Chan <trev@trevrosa.dev>
To: alex.gaynor@gmail.com,
	ojeda@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	aliceryhl@google.com,
	vireshk@kernel.org,
	nm@ti.com,
	sboyd@kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	jack@suse.cz
Subject: [PATCH v3] rust: aref: make `AlwaysRefCounted::inc_ref` an associated function
Date: Wed, 24 Sep 2025 13:24:42 +0800
Message-ID: <20250924052442.9259-1-trev@trevrosa.dev>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`AlwaysRefCounted::inc_ref` is a function that shouldn't be called lightly.

To prevent accidentally calling it, `inc_ref` is now changed to be an
associated function.

Modifies all `AlwaysRefCounted` implementors to work with this change.

Suggested-by: Benno Lossin <lossin@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1177
Signed-off-by: Trevor Chan <trev@trevrosa.dev>
---
Changes in v2:
 - Don't word wrap the patch
Changes in v3:
 - Make argument name of `Empty::inc_ref` consistent with `Empty::dec_ref` 
---
 rust/kernel/auxiliary.rs        |  4 ++--
 rust/kernel/block/mq/request.rs |  4 ++--
 rust/kernel/cred.rs             |  4 ++--
 rust/kernel/device.rs           |  4 ++--
 rust/kernel/device/property.rs  |  4 ++--
 rust/kernel/drm/device.rs       |  4 ++--
 rust/kernel/drm/gem/mod.rs      |  4 ++--
 rust/kernel/fs/file.rs          |  8 ++++----
 rust/kernel/mm.rs               |  8 ++++----
 rust/kernel/mm/mmput_async.rs   |  4 ++--
 rust/kernel/opp.rs              |  4 ++--
 rust/kernel/pci.rs              |  4 ++--
 rust/kernel/pid_namespace.rs    |  4 ++--
 rust/kernel/platform.rs         |  4 ++--
 rust/kernel/sync/aref.rs        | 10 ++++++----
 rust/kernel/task.rs             |  4 ++--
 16 files changed, 40 insertions(+), 38 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 4749fb6bffef..b205c9d4f057 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -246,9 +246,9 @@ extern "C" fn release(dev: *mut bindings::device) {
 
 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl crate::types::AlwaysRefCounted for Device {
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+        unsafe { bindings::get_device(obj.as_ref().as_raw()) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
index fefd394f064a..8124c72cd674 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -236,8 +236,8 @@ fn atomic_relaxed_op_unless(target: &AtomicU64, op: impl Fn(u64) -> u64, pred: u
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
 // SAFETY: The type invariants guarantee that `Credential` is always ref-counted.
 unsafe impl AlwaysRefCounted for Credential {
     #[inline]
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference means that the refcount is nonzero.
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
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_raw()) };
+        unsafe { bindings::get_device(obj.as_raw()) };
     }
 
     unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 49ee12a906db..ccb83856745e 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -359,10 +359,10 @@ fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
 
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
 // SAFETY: DRM device objects are always reference counted and the get/put functions
 // satisfy the requirements.
 unsafe impl<T: drm::Driver> AlwaysRefCounted for Device<T> {
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::drm_dev_get(self.as_raw()) };
+        unsafe { bindings::drm_dev_get(obj.as_raw()) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index b71821cfb5ea..febb6cc83fd9 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -56,9 +56,9 @@ pub trait IntoGEMObject: Sized + super::private::Sealed + AlwaysRefCounted {
 
 // SAFETY: All gem objects are refcounted.
 unsafe impl<T: IntoGEMObject> AlwaysRefCounted for T {
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
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
         // SAFETY: The existence of a shared reference means that the refcount is nonzero.
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
         // SAFETY: The existence of a shared reference means that the refcount is nonzero.
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
         // SAFETY: The existence of a shared reference means that the refcount is nonzero.
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
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::pci_dev_get(self.as_raw()) };
+        unsafe { bindings::pci_dev_get(obj.as_raw()) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/pid_namespace.rs b/rust/kernel/pid_namespace.rs
index 0e93808e4639..d3302b86b864 100644
--- a/rust/kernel/pid_namespace.rs
+++ b/rust/kernel/pid_namespace.rs
@@ -46,9 +46,9 @@ pub unsafe fn from_ptr<'a>(ptr: *const bindings::pid_namespace) -> &'a Self {
 // SAFETY: Instances of `PidNamespace` are always reference-counted.
 unsafe impl AlwaysRefCounted for PidNamespace {
     #[inline]
-    fn inc_ref(&self) {
+    fn inc_ref(obj: &Self) {
         // SAFETY: The existence of a shared reference means that the refcount is nonzero.
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
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+        unsafe { bindings::get_device(obj.as_ref().as_raw()) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index dbd77bb68617..3a3d5052786c 100644
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
+    ///     fn inc_ref(_obj: &Self) {}
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
         // SAFETY: The existence of a shared reference means that the refcount is nonzero.
-        unsafe { bindings::get_task_struct(self.as_ptr()) };
+        unsafe { bindings::get_task_struct(obj.as_ptr()) };
     }
 
     #[inline]
-- 
2.39.5

