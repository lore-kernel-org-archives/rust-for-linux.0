Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DDF156C40
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 21:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755723753; cv=none; b=QD/ckrsxAtITNpXQWT8tLcGhC43FtBTeIlKLdIX+Zuend7ZOtbj5QkZUS1psP9XlP5Kn6hbmeoGbdwxCR9vFMhAt/Ym/SCnkvFqyseXE2IGFhXHKhFb8mbREO2WVitJ050UkiA9cOjQj+N+M/6TWRpjQNZs+TsciGt3rXWVk5cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755723753; c=relaxed/simple;
	bh=jMuQsVSwt2ikhu63y+hTUD28l8D3i9gkr1u9AMByjow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c0aREHo6ZAJRnhB8TajqwJAwLMzuy86oc3j3U9dr020BMlWi/mtrAkeWDKC2RMrADu1z+4nqwk1me+4eN8/D8xVnu2TCNVydNwE36Otq2uCK5a8f2/sT5uMTj4pmRS1SXTELw+4ssNwTC2zweWe/Pi4f+v74wmBxhL2zSk3LSSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imP29lUs; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imP29lUs"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb61f6044so59928766b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 14:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755723749; x=1756328549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0OQvZFYoIfYtpiEu0N5YLATJ9p2BJjIGu7oPA0IgLrs=;
        b=imP29lUsb3EKjEMn2Uzcnc28kkeGGwDOMm5RX2H1Z8MC1Y0lVcPsM2Ck2QT8FoUrDY
         QThe/2q8wncE/JBygoqgmpXdaF1qXxjafUSXpmhq3cBMKxUu57DhWp1tYeFKDgqUDsHX
         tt5vEJ4th/hEPYHwargvqAEOYMnaAKMq6KPoHwPe+c5yhXuc6ObpZjHTLoDkhbrtG31N
         ahgcZ+ZWjTZwsBJJLAw4sqqKEEGWLgCNrrEdy01DuAzMylDaHCfFggzdorQobK55XexA
         K28OBPFYyTPU2ClzT5VfuZ+SxErg8awSbuEGyNNMXNIsMFsmiXP20btJmtSelny0Gap9
         T6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755723749; x=1756328549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OQvZFYoIfYtpiEu0N5YLATJ9p2BJjIGu7oPA0IgLrs=;
        b=KS+NLBeua8RSGAOc67naxyZntI1sWO+k+VT55I+kEriFqlUu9cKr8BALfe9iXhYgqx
         be1iMBk+mY1tX1LM2n/3CwYwffCWyxN6ObP4ahli3Ac+29+JvSsk+yG3VIYEmhLKVqYq
         iC2AMC6R3gtut2gQgFGvnmSViCcIkt4JHZER3iibOoaqn2mULlWd9XSKvUDTdLHrXbxq
         3Cw7WE+GW7l2FKDYdi7DtkpAUlWELxdB++ezuQou+jTbxr9JKr7ThWOZfOvPqJlmQucF
         tFSfR1DLzRlidILl0vUnt92vIom2qPRaNwOGOrypuq8x9NlRVPw6UgeByF/NMHu8D9QD
         5BCA==
X-Gm-Message-State: AOJu0YyQbG0W6hmxh5HEE2Hxa2faVjo8rDDR7zhUSvlqLo0wo184i1J3
	W7zFcKifloveeoPIXfYTjk3hez0dZfNLI1PjOBo2xKQhWrin6Z9dfCzTCbLieq0FcAE6LA==
X-Gm-Gg: ASbGncsPvXKIGkG613MkiTgbOfdbiq0A75bEfXvLN1fwhPdvcfL7+og4XiHQXMtPNLz
	KAxnbnkeKzJ6Y04bGiakE85TDzdJBTtl5nx0SVxLANl/aV3cHmlxmC8mn320n/+ZN0/TSKxKwwa
	+ONWmdt5Jk3GsA1BWvZIvXFZbdiBg+GN3iE9s7JU6brTFwR+BJPAOcRkrAEkRCyYwg5FF099bYo
	beTf9D7LdguHu+A69VjG8IUiTZnfwj5xMbMgZqUr0nnkwUSiIFirqNXDdCFd0iq96HzCkbjUWxB
	6LxeKji8sZL6fki5BUdSwLyHaWme/8D/e+8ISxqy5QaWjjQlbk2bbKVhwfkKDpfueDp+WYhpvfB
	2G+Zd5Q==
X-Google-Smtp-Source: AGHT+IGeDK7DPwajOhRDocKAhQgKIsN5sc0/AvQ2mQBZfCQPApSL7ApAwvtBXN427zzGrhA+MyrF9A==
X-Received: by 2002:a17:907:7e8a:b0:afd:d62f:aa4a with SMTP id a640c23a62f3a-afe0b0d7c02mr489766b.9.1755723749036;
        Wed, 20 Aug 2025 14:02:29 -0700 (PDT)
Received: from archlinux ([2a02:8071:6480:ee20::f86a])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afded2bc3e0sm254949766b.22.2025.08.20.14.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 14:02:28 -0700 (PDT)
From: Gent Binaku <binakugent@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Gent Binaku <binakugent@gmail.com>,
	Benno Lossin <benno.lossin@proton.me>
Subject: [PATCH] Rust associative function
Date: Wed, 20 Aug 2025 21:02:25 +0000
Message-ID: <20250820210225.124288-1-binakugent@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently `AlwaysRefCounted::inc_ref` is implemented as a method
taking `&self`. However, this function should not be called lightly.
To prevent accidental usage, convert it into an associated function
instead of a method.

This aligns with the intended API safety model and makes it clearer
that `inc_ref` is not part of the usual object manipulation methods.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1177
Signed-off-by: Gent Binaku <binakugent@gmail.com>
---
 rust/kernel/auxiliary.rs        | 4 ++--
 rust/kernel/block/mq/request.rs | 4 ++--
 rust/kernel/cred.rs             | 4 ++--
 rust/kernel/device.rs           | 4 ++--
 rust/kernel/device/property.rs  | 4 ++--
 rust/kernel/drm/device.rs       | 4 ++--
 rust/kernel/drm/gem/mod.rs      | 4 ++--
 rust/kernel/fs/file.rs          | 8 ++++----
 rust/kernel/mm.rs               | 8 ++++----
 rust/kernel/mm/mmput_async.rs   | 4 ++--
 rust/kernel/pci.rs              | 4 ++--
 rust/kernel/pid_namespace.rs    | 4 ++--
 rust/kernel/platform.rs         | 4 ++--
 rust/kernel/sync/aref.rs        | 6 +++---
 rust/kernel/task.rs             | 4 ++--
 15 files changed, 35 insertions(+), 35 deletions(-)

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
index fefd394f064a..25e395d4dfd6 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -236,8 +236,8 @@ fn atomic_relaxed_op_unless(target: &AtomicU64, op: impl Fn(u64) -> u64, pred: u
 // keeps the object alive in memory at least until a matching reference count
 // decrement is executed.
 unsafe impl<T: Operations> AlwaysRefCounted for Request<T> {
-    fn inc_ref(&self) {
-        let refcount = &self.wrapper_ref().refcount();
+    fn inc_ref(obj: &Self) {
+        let refcount = obj.wrapper_ref().refcount();
 
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
index dbd77bb68617..4e03c4fbc848 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -24,7 +24,7 @@
 /// alive.)
 pub unsafe trait AlwaysRefCounted {
     /// Increments the reference count on the object.
-    fn inc_ref(&self);
+    fn inc_ref(obj: &Self);
 
     /// Decrements the reference count on the object.
     ///
@@ -122,7 +122,7 @@ pub fn into_raw(me: Self) -> NonNull<T> {
 
 impl<T: AlwaysRefCounted> Clone for ARef<T> {
     fn clone(&self) -> Self {
-        self.inc_ref();
+        T::inc_ref(&**self);
         // SAFETY: We just incremented the refcount above.
         unsafe { Self::from_raw(self.ptr) }
     }
@@ -139,7 +139,7 @@ fn deref(&self) -> &Self::Target {
 
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
2.50.1

