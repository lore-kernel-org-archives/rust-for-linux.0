Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02214135417
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Sep 2024 22:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726699916; cv=none; b=kyWNaTQ0jzXeB+p8f5hhL4QWHssN65P73864ce5rAv8unJbETEO43booLONCs/reTOMItDFZTRqmoasiNHb8MEo2HVAsgTmgFjoBT2AogGs4D4Ou03tHnsTlBsPsni9mQ/FcUR9nCnu3Qx9ORyh8edZiqoWkkomedTM1Es4Frtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726699916; c=relaxed/simple;
	bh=zWGlwRMHFAYBAyzP2tAciuec17YWlVDaToyCYopRAvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7AvGDcb14YeLdJu7POr2fk8rxZVM3mykRDVWRExWxjzS9EE5S6WS7sHjRXw4d0awnJzvT1a/iW/iKCVHlUw+VmC+AOqxMt5fnbGrjIrmUsotV+czO8HfE1CuTZtYk0r1Bm7cWc47ZY8puZaRW1PDxmW28BVFTVeZcwnfQx3AKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZy1Mgi+; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZy1Mgi+"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6c359c1a2fdso1235936d6.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Sep 2024 15:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726699913; x=1727304713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqgJR2lCVjR2rS1NAf8tvPGSSFXkIs/fwCknGF2+gmI=;
        b=kZy1Mgi+zU3SROPCqwnuCj/3r/9jHHAdyttCh0R6ZPFsogNY/U0NinC6CKtImMoz9f
         6Z22+LyH3Y3n8NuZXjBEesRKLeyay8A15x4maWaKq52cH6bxOdmJwLOg17rlY3HhBmOx
         XK99aZ/Jax/oJiR37t/Ouuuh0T/TXllTAciggQzGsUn+va8hJa8Zr8ON30ijmx4qXtru
         zpw4DI16MqA80vW1U9cvpon4AtDKzYYj5bP8tfFJT8mZJuGf4FSSYE7nUvpdqRCW1fWw
         aMCRdM0+vTE2qXXrKx1U3O40Xgy1SDEeRn9t3nyct1sdZPB2IMMcZlBAsq7n0Fk8FDPy
         VzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726699913; x=1727304713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqgJR2lCVjR2rS1NAf8tvPGSSFXkIs/fwCknGF2+gmI=;
        b=S9kfy+SSohsOMqYBMkNQph8Ulb/Z0UKdoFSuLX+c98nuFeeSK+LDHzd9YnRJbQRwwS
         G4nWbEQo+WTKgK1ZvxwnJhwPI6xVj/RXNNiWit/kileoXtwVeSoeVKqQj7aTUqrYqQf2
         fnZiE0iHhlDouWdqKI18qGVGETjvd9tm7xuY17wfBWlEQ+VFS5mtxor5lPaQ2S5v5Ete
         M8sIsX9Wrvi0lyXKq8zC45iVbGnOIpktHSVVPbYqU1n54fQb1zR/Wx/oqUJTWYK91DDS
         TR0vm1/BgGYPINnG/H6ykyto7t0cA4WhWquKmAbg97Gh8M5UirKRVitXT3+ZAXPCI1Sm
         X5GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnZIcusy+VJJyCuRm2GtK85AzqmXWzCUwswSkOUs42kGmrrp6wlXpT7ca/bU7oaRPNlZ9UsNFm8dnrzwTzlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzco613apOVE2SsuMpze7SCBkiuy54Ka0fEab9smiTEcWVpkIKD
	Ne4SFudat8p2YAMBss6QaTfEE3HmqMLZsWo1Z6jSAmhcT020qDl4
X-Google-Smtp-Source: AGHT+IEyM1zOypxWOO8yKuMaxC6y1VSXl0sCmavoLweaz16bo5mC2b1NP97KGINhET0GfQ5fbGg6WQ==
X-Received: by 2002:a05:6214:3116:b0:6c5:541b:eb62 with SMTP id 6a1803df08f44-6c57def340cmr306367146d6.1.1726699912746;
        Wed, 18 Sep 2024 15:51:52 -0700 (PDT)
Received: from localhost.localdomain ([146.70.202.153])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c75e46f58esm1675736d6.56.2024.09.18.15.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 15:51:52 -0700 (PDT)
From: Aliet Exposito Garcia <aliet.exposito@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Aliet Exposito Garcia <aliet.exposito@gmail.com>
Subject: [PATCH 2/2] rust: Move `ARef<T>` and `AlwaysRefCounted` to new `sync::aref` module
Date: Wed, 18 Sep 2024 18:51:15 -0400
Message-ID: <20240918225115.2309224-3-aliet.exposito@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240918225115.2309224-1-aliet.exposito@gmail.com>
References: <20240918225115.2309224-1-aliet.exposito@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch refactors the `ARef` type and `AlwaysRefCounted` trait from
`types.rs` into a new `sync/aref.rs` module.
The type and trait definitions remain unchanged.
 - Adds `rust/kernel/sync/aref.rs` with the definitions of `ARef` and
    `AlwaysRefCounted`
 - Removes the same type and trait definitions from `rust/kernel/types.rs`
 - Updates relevant files to import `ARef` and `AlwaysRefCounted` from
    `sync/aref.rs`

Suggested-by: Benno Lossin <benno.lossin@proton.me>

Link: https://github.com/Rust-for-Linux/linux/issues/1117
Signed-off-by: Aliet Exposito Garcia <aliet.exposito@gmail.com>
---
 drivers/block/rnull.rs             |   3 +-
 rust/kernel/block/mq.rs            |   6 +-
 rust/kernel/block/mq/operations.rs |   2 +-
 rust/kernel/block/mq/request.rs    |   3 +-
 rust/kernel/device.rs              |   8 +-
 rust/kernel/sync.rs                |   1 +
 rust/kernel/sync/aref.rs           | 152 +++++++++++++++++++++++++++++
 rust/kernel/task.rs                |   4 +-
 rust/kernel/types.rs               | 152 +----------------------------
 9 files changed, 167 insertions(+), 164 deletions(-)
 create mode 100644 rust/kernel/sync/aref.rs

diff --git a/drivers/block/rnull.rs b/drivers/block/rnull.rs
index b0227cf9d..fd157d390 100644
--- a/drivers/block/rnull.rs
+++ b/drivers/block/rnull.rs
@@ -20,8 +20,7 @@
     error::Result,
     new_mutex, pr_info,
     prelude::*,
-    sync::{Arc, Mutex},
-    types::ARef,
+    sync::{aref::ARef, Arc, Mutex},
 };
 
 module! {
diff --git a/rust/kernel/block/mq.rs b/rust/kernel/block/mq.rs
index fb0f393c1..f9e32eecd 100644
--- a/rust/kernel/block/mq.rs
+++ b/rust/kernel/block/mq.rs
@@ -20,7 +20,7 @@
 //! The kernel will interface with the block device driver by calling the method
 //! implementations of the `Operations` trait.
 //!
-//! IO requests are passed to the driver as [`kernel::types::ARef<Request>`]
+//! IO requests are passed to the driver as [`kernel::sync::aref::ARef<Request>`]
 //! instances. The `Request` type is a wrapper around the C `struct request`.
 //! The driver must mark end of processing by calling one of the
 //! `Request::end`, methods. Failure to do so can lead to deadlock or timeout
@@ -61,8 +61,8 @@
 //!     block::mq::*,
 //!     new_mutex,
 //!     prelude::*,
-//!     sync::{Arc, Mutex},
-//!     types::{ARef, ForeignOwnable},
+//!     sync::{Arc, Mutex, aref::{ARef, AlwaysRefCounted}},
+//!     types::ForeignOwnable,
 //! };
 //!
 //! struct MyBlkDevice;
diff --git a/rust/kernel/block/mq/operations.rs b/rust/kernel/block/mq/operations.rs
index 9ba7fdfeb..31f0f043f 100644
--- a/rust/kernel/block/mq/operations.rs
+++ b/rust/kernel/block/mq/operations.rs
@@ -9,7 +9,7 @@
     block::mq::request::RequestDataWrapper,
     block::mq::Request,
     error::{from_result, Result},
-    types::ARef,
+    sync::aref::ARef,
 };
 use core::{marker::PhantomData, sync::atomic::AtomicU64, sync::atomic::Ordering};
 
diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
index a0e22827f..1e57cfef6 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -8,7 +8,8 @@
     bindings,
     block::mq::Operations,
     error::Result,
-    types::{ARef, AlwaysRefCounted, Opaque},
+    sync::aref::{ARef, AlwaysRefCounted},
+    types::Opaque,
 };
 use core::{
     marker::PhantomData,
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 851018eef..21fb733fe 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -4,10 +4,8 @@
 //!
 //! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
 
-use crate::{
-    bindings,
-    types::{ARef, Opaque},
-};
+use crate::{bindings, sync::aref::ARef, types::Opaque};
+
 use core::ptr;
 
 /// A reference-counted device.
@@ -85,7 +83,7 @@ pub unsafe fn as_ref<'a>(ptr: *mut bindings::device) -> &'a Self {
 }
 
 // SAFETY: Instances of `Device` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for Device {
+unsafe impl crate::sync::aref::AlwaysRefCounted for Device {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
         unsafe { bindings::get_device(self.as_raw()) };
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 0ab20975a..0d0c44f10 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -8,6 +8,7 @@
 use crate::types::Opaque;
 
 mod arc;
+pub mod aref;
 mod condvar;
 pub mod lock;
 mod locked_by;
diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
new file mode 100644
index 000000000..cfea94cac
--- /dev/null
+++ b/rust/kernel/sync/aref.rs
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Types and utilities for managing always-reference-counted objects.
+
+use core::{marker::PhantomData, mem::ManuallyDrop, ops::Deref, ptr::NonNull};
+
+/// Types that are _always_ reference counted.
+///
+/// It allows such types to define their own custom ref increment and decrement functions.
+/// Additionally, it allows users to convert from a shared reference `&T` to an owned reference
+/// [`ARef<T>`].
+///
+/// This is usually implemented by wrappers to existing structures on the C side of the code. For
+/// Rust code, the recommendation is to use [`Arc`](crate::sync::Arc) to create reference-counted
+/// instances of a type.
+///
+/// # Safety
+///
+/// Implementers must ensure that increments to the reference count keep the object alive in memory
+/// at least until matching decrements are performed.
+///
+/// Implementers must also ensure that all instances are reference-counted. (Otherwise they
+/// won't be able to honour the requirement that [`AlwaysRefCounted::inc_ref`] keep the object
+/// alive.)
+pub unsafe trait AlwaysRefCounted {
+    /// Increments the reference count on the object.
+    fn inc_ref(&self);
+
+    /// Decrements the reference count on the object.
+    ///
+    /// Frees the object when the count reaches zero.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that there was a previous matching increment to the reference count,
+    /// and that the object is no longer used after its reference count is decremented (as it may
+    /// result in the object being freed), unless the caller owns another increment on the refcount
+    /// (e.g., it calls [`AlwaysRefCounted::inc_ref`] twice, then calls
+    /// [`AlwaysRefCounted::dec_ref`] once).
+    unsafe fn dec_ref(obj: NonNull<Self>);
+}
+
+/// An owned reference to an always-reference-counted object.
+///
+/// The object's reference count is automatically decremented when an instance of [`ARef`] is
+/// dropped. It is also automatically incremented when a new instance is created via
+/// [`ARef::clone`].
+///
+/// # Invariants
+///
+/// The pointer stored in `ptr` is non-null and valid for the lifetime of the [`ARef`] instance. In
+/// particular, the [`ARef`] instance owns an increment on the underlying object's reference count.
+pub struct ARef<T: AlwaysRefCounted> {
+    ptr: NonNull<T>,
+    _p: PhantomData<T>,
+}
+
+// SAFETY: It is safe to send `ARef<T>` to another thread when the underlying `T` is `Sync` because
+// it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally, it needs
+// `T` to be `Send` because any thread that has an `ARef<T>` may ultimately access `T` using a
+// mutable reference, for example, when the reference count reaches zero and `T` is dropped.
+unsafe impl<T: AlwaysRefCounted + Sync + Send> Send for ARef<T> {}
+
+// SAFETY: It is safe to send `&ARef<T>` to another thread when the underlying `T` is `Sync`
+// because it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally,
+// it needs `T` to be `Send` because any thread that has a `&ARef<T>` may clone it and get an
+// `ARef<T>` on that thread, so the thread may ultimately access `T` using a mutable reference, for
+// example, when the reference count reaches zero and `T` is dropped.
+unsafe impl<T: AlwaysRefCounted + Sync + Send> Sync for ARef<T> {}
+
+impl<T: AlwaysRefCounted> ARef<T> {
+    /// Creates a new instance of [`ARef`].
+    ///
+    /// It takes over an increment of the reference count on the underlying object.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that the reference count was incremented at least once, and that they
+    /// are properly relinquishing one increment. That is, if there is only one increment, callers
+    /// must not use the underlying object anymore -- it is only safe to do so via the newly
+    /// created [`ARef`].
+    pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
+        // INVARIANT: The safety requirements guarantee that the new instance now owns the
+        // increment on the refcount.
+        Self {
+            ptr,
+            _p: PhantomData,
+        }
+    }
+
+    /// Consumes the `ARef`, returning a raw pointer.
+    ///
+    /// This function does not change the refcount. After calling this function, the caller is
+    /// responsible for the refcount previously managed by the `ARef`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use core::ptr::NonNull;
+    /// use kernel::sync::aref::{ARef, AlwaysRefCounted};
+    ///
+    /// struct Empty {}
+    ///
+    /// unsafe impl AlwaysRefCounted for Empty {
+    ///     fn inc_ref(&self) {}
+    ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
+    /// }
+    ///
+    /// let mut data = Empty {};
+    /// let ptr = NonNull::<Empty>::new(&mut data as *mut _).unwrap();
+    /// let data_ref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
+    /// let raw_ptr: NonNull<Empty> = ARef::into_raw(data_ref);
+    ///
+    /// assert_eq!(ptr, raw_ptr);
+    /// ```
+    pub fn into_raw(me: Self) -> NonNull<T> {
+        ManuallyDrop::new(me).ptr
+    }
+}
+
+impl<T: AlwaysRefCounted> Clone for ARef<T> {
+    fn clone(&self) -> Self {
+        self.inc_ref();
+        // SAFETY: We just incremented the refcount above.
+        unsafe { Self::from_raw(self.ptr) }
+    }
+}
+
+impl<T: AlwaysRefCounted> Deref for ARef<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: The type invariants guarantee that the object is valid.
+        unsafe { self.ptr.as_ref() }
+    }
+}
+
+impl<T: AlwaysRefCounted> From<&T> for ARef<T> {
+    fn from(b: &T) -> Self {
+        b.inc_ref();
+        // SAFETY: We just incremented the refcount above.
+        unsafe { Self::from_raw(NonNull::from(b)) }
+    }
+}
+
+impl<T: AlwaysRefCounted> Drop for ARef<T> {
+    fn drop(&mut self) {
+        // SAFETY: The type invariants guarantee that the `ARef` owns the reference we're about to
+        // decrement.
+        unsafe { T::dec_ref(self.ptr) };
+    }
+}
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 55dff7e08..0b358acea 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -61,7 +61,7 @@ macro_rules! current {
 /// incremented when creating `State` and decremented when it is dropped:
 ///
 /// ```
-/// use kernel::{task::Task, types::ARef};
+/// use kernel::{task::Task, sync::aref::ARef};
 ///
 /// struct State {
 ///     creator: ARef<Task>,
@@ -164,7 +164,7 @@ pub fn wake_up(&self) {
 }
 
 // SAFETY: The type invariants guarantee that `Task` is always refcounted.
-unsafe impl crate::types::AlwaysRefCounted for Task {
+unsafe impl crate::sync::aref::AlwaysRefCounted for Task {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refcount is nonzero.
         unsafe { bindings::get_task_struct(self.0.get()) };
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index d086f8503..b9b27746c 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -6,11 +6,10 @@
 use alloc::boxed::Box;
 use core::{
     cell::UnsafeCell,
-    marker::{PhantomData, PhantomPinned},
-    mem::{ManuallyDrop, MaybeUninit},
+    marker::PhantomPinned,
+    mem::MaybeUninit,
     ops::{Deref, DerefMut},
     pin::Pin,
-    ptr::NonNull,
 };
 
 /// Used to transfer ownership to and from foreign (non-Rust) languages.
@@ -313,153 +312,6 @@ pub const fn raw_get(this: *const Self) -> *mut T {
     }
 }
 
-/// Types that are _always_ reference counted.
-///
-/// It allows such types to define their own custom ref increment and decrement functions.
-/// Additionally, it allows users to convert from a shared reference `&T` to an owned reference
-/// [`ARef<T>`].
-///
-/// This is usually implemented by wrappers to existing structures on the C side of the code. For
-/// Rust code, the recommendation is to use [`Arc`](crate::sync::Arc) to create reference-counted
-/// instances of a type.
-///
-/// # Safety
-///
-/// Implementers must ensure that increments to the reference count keep the object alive in memory
-/// at least until matching decrements are performed.
-///
-/// Implementers must also ensure that all instances are reference-counted. (Otherwise they
-/// won't be able to honour the requirement that [`AlwaysRefCounted::inc_ref`] keep the object
-/// alive.)
-pub unsafe trait AlwaysRefCounted {
-    /// Increments the reference count on the object.
-    fn inc_ref(&self);
-
-    /// Decrements the reference count on the object.
-    ///
-    /// Frees the object when the count reaches zero.
-    ///
-    /// # Safety
-    ///
-    /// Callers must ensure that there was a previous matching increment to the reference count,
-    /// and that the object is no longer used after its reference count is decremented (as it may
-    /// result in the object being freed), unless the caller owns another increment on the refcount
-    /// (e.g., it calls [`AlwaysRefCounted::inc_ref`] twice, then calls
-    /// [`AlwaysRefCounted::dec_ref`] once).
-    unsafe fn dec_ref(obj: NonNull<Self>);
-}
-
-/// An owned reference to an always-reference-counted object.
-///
-/// The object's reference count is automatically decremented when an instance of [`ARef`] is
-/// dropped. It is also automatically incremented when a new instance is created via
-/// [`ARef::clone`].
-///
-/// # Invariants
-///
-/// The pointer stored in `ptr` is non-null and valid for the lifetime of the [`ARef`] instance. In
-/// particular, the [`ARef`] instance owns an increment on the underlying object's reference count.
-pub struct ARef<T: AlwaysRefCounted> {
-    ptr: NonNull<T>,
-    _p: PhantomData<T>,
-}
-
-// SAFETY: It is safe to send `ARef<T>` to another thread when the underlying `T` is `Sync` because
-// it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally, it needs
-// `T` to be `Send` because any thread that has an `ARef<T>` may ultimately access `T` using a
-// mutable reference, for example, when the reference count reaches zero and `T` is dropped.
-unsafe impl<T: AlwaysRefCounted + Sync + Send> Send for ARef<T> {}
-
-// SAFETY: It is safe to send `&ARef<T>` to another thread when the underlying `T` is `Sync`
-// because it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally,
-// it needs `T` to be `Send` because any thread that has a `&ARef<T>` may clone it and get an
-// `ARef<T>` on that thread, so the thread may ultimately access `T` using a mutable reference, for
-// example, when the reference count reaches zero and `T` is dropped.
-unsafe impl<T: AlwaysRefCounted + Sync + Send> Sync for ARef<T> {}
-
-impl<T: AlwaysRefCounted> ARef<T> {
-    /// Creates a new instance of [`ARef`].
-    ///
-    /// It takes over an increment of the reference count on the underlying object.
-    ///
-    /// # Safety
-    ///
-    /// Callers must ensure that the reference count was incremented at least once, and that they
-    /// are properly relinquishing one increment. That is, if there is only one increment, callers
-    /// must not use the underlying object anymore -- it is only safe to do so via the newly
-    /// created [`ARef`].
-    pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
-        // INVARIANT: The safety requirements guarantee that the new instance now owns the
-        // increment on the refcount.
-        Self {
-            ptr,
-            _p: PhantomData,
-        }
-    }
-
-    /// Consumes the `ARef`, returning a raw pointer.
-    ///
-    /// This function does not change the refcount. After calling this function, the caller is
-    /// responsible for the refcount previously managed by the `ARef`.
-    ///
-    /// # Examples
-    ///
-    /// ```
-    /// use core::ptr::NonNull;
-    /// use kernel::types::{ARef, AlwaysRefCounted};
-    ///
-    /// struct Empty {}
-    ///
-    /// unsafe impl AlwaysRefCounted for Empty {
-    ///     fn inc_ref(&self) {}
-    ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
-    /// }
-    ///
-    /// let mut data = Empty {};
-    /// let ptr = NonNull::<Empty>::new(&mut data as *mut _).unwrap();
-    /// let data_ref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
-    /// let raw_ptr: NonNull<Empty> = ARef::into_raw(data_ref);
-    ///
-    /// assert_eq!(ptr, raw_ptr);
-    /// ```
-    pub fn into_raw(me: Self) -> NonNull<T> {
-        ManuallyDrop::new(me).ptr
-    }
-}
-
-impl<T: AlwaysRefCounted> Clone for ARef<T> {
-    fn clone(&self) -> Self {
-        self.inc_ref();
-        // SAFETY: We just incremented the refcount above.
-        unsafe { Self::from_raw(self.ptr) }
-    }
-}
-
-impl<T: AlwaysRefCounted> Deref for ARef<T> {
-    type Target = T;
-
-    fn deref(&self) -> &Self::Target {
-        // SAFETY: The type invariants guarantee that the object is valid.
-        unsafe { self.ptr.as_ref() }
-    }
-}
-
-impl<T: AlwaysRefCounted> From<&T> for ARef<T> {
-    fn from(b: &T) -> Self {
-        b.inc_ref();
-        // SAFETY: We just incremented the refcount above.
-        unsafe { Self::from_raw(NonNull::from(b)) }
-    }
-}
-
-impl<T: AlwaysRefCounted> Drop for ARef<T> {
-    fn drop(&mut self) {
-        // SAFETY: The type invariants guarantee that the `ARef` owns the reference we're about to
-        // decrement.
-        unsafe { T::dec_ref(self.ptr) };
-    }
-}
-
 /// A sum type that always holds either a value of type `L` or `R`.
 pub enum Either<L, R> {
     /// Constructs an instance of [`Either`] containing a value of type `L`.
-- 
2.46.0

