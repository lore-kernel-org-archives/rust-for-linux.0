Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D831033121B;
	Wed, 14 Jan 2026 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414793; cv=none; b=BUQW6GnAtuJQkDgkQLmnKVqzvSXKdLwmiD8NO4NKnC9tAHWnvdLd9bG8wr/noRrnYm/WFQYS6idWY+c2tJKgdhy2j+rTm8H8qOQAv8i3zkcFPdo7a2ChKw/urY2DAnDefChZMMvWaQq0/PDXCmTkduALxGO5Lr55xcKIGZ9vkSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414793; c=relaxed/simple;
	bh=6rZCBWp1RvPi1tZj1f2FCMZDDwMubeSmoCTwdMT13zU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K43PIn4BhNcq4lFPlGmxvgU/0bvENnXgyVc0uyOlhq58ar8mC84ZaQFKlVblMwmO28vOSc70+h9nZEUbmXF+gtUwuLcOOmOFyp1SK+sIXW0XZtuQ+i9V9DVEDNiGpquVheeTy0mfriCnVkNNase65wZb3gRP2ttQ1LOV34gmIeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3Qh7T9N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3Qh7T9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882F2C4CEF7;
	Wed, 14 Jan 2026 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768414792;
	bh=6rZCBWp1RvPi1tZj1f2FCMZDDwMubeSmoCTwdMT13zU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o3Qh7T9NRTfGNFiOoi+jeMyvebjSg50vAHMTtvcE959PUJWZPFR+vRnQBSbeXdt/e
	 tQRrtoHdxT2BDYqaXBV/z7AA0m6XcxbbvGWBsZU9oz38nKaxX2ME/3as2Ohbwx/yhU
	 NSmp6OL2ZLXCfGWW5FhC45rll/ATagrV0kWE50smT/DGEWQ4yQN2hMNYP+7jEwZbCq
	 ZMiCZP0zUKvXDM8UhFNlRcfPp8Ofi59tW9RjK+9zvYep3d19/Y+ysjIBAxzadb1fL8
	 N/1Pov8MSFTKph+ddZqyd6+FMygq+pHCOo3Y7LNEew33uUcb0gMfUdQHOnuirsGPod
	 oMVQ0oM/af8Ug==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/15] rust: pin-init: remove `try_` versions of the initializer macros
Date: Wed, 14 Jan 2026 19:18:36 +0100
Message-ID: <20260114181934.1782470-2-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114181934.1782470-1-lossin@kernel.org>
References: <20260114181934.1782470-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `try_[pin_]init!` versions of the initializer macros are
superfluous. Instead of forcing the user to always write an error in
`try_[pin_]init!` and not allowing one in `[pin_]init!`, combine them
into `[pin_]init!` that defaults the error to
`core::convert::Infallible`, but also allows to specify a custom one.

Projects using pin-init still can provide their own defaulting
initializers using the `try_` prefix by using the `#[default_error]`
attribute added in a future patch.

[ Adjust the definition of the kernel's version of the `try_`
  initializer macros - Benno]

Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v3: none
Changes in v2: none
---
 rust/kernel/init.rs                     |   8 +-
 rust/pin-init/README.md                 |   2 +-
 rust/pin-init/examples/linked_list.rs   |  19 ++--
 rust/pin-init/examples/pthread_mutex.rs |  10 +-
 rust/pin-init/src/lib.rs                | 118 ++++--------------------
 5 files changed, 35 insertions(+), 122 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 899b9a962762..917f7ef001fd 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -222,14 +222,14 @@ macro_rules! try_init {
     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
         $($fields:tt)*
     }) => {
-        ::pin_init::try_init!($(&$this in)? $t $(::<$($generics),*>)? {
+        ::pin_init::init!($(&$this in)? $t $(::<$($generics),*>)? {
             $($fields)*
         }? $crate::error::Error)
     };
     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
         $($fields:tt)*
     }? $err:ty) => {
-        ::pin_init::try_init!($(&$this in)? $t $(::<$($generics),*>)? {
+        ::pin_init::init!($(&$this in)? $t $(::<$($generics),*>)? {
             $($fields)*
         }? $err)
     };
@@ -282,14 +282,14 @@ macro_rules! try_pin_init {
     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
         $($fields:tt)*
     }) => {
-        ::pin_init::try_pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
+        ::pin_init::pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
             $($fields)*
         }? $crate::error::Error)
     };
     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
         $($fields:tt)*
     }? $err:ty) => {
-        ::pin_init::try_pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
+        ::pin_init::pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
             $($fields)*
         }? $err)
     };
diff --git a/rust/pin-init/README.md b/rust/pin-init/README.md
index 74bbb4e0a2f7..6cee6ab1eb57 100644
--- a/rust/pin-init/README.md
+++ b/rust/pin-init/README.md
@@ -135,7 +135,7 @@ struct DriverData {
 
 impl DriverData {
     fn new() -> impl PinInit<Self, Error> {
-        try_pin_init!(Self {
+        pin_init!(Self {
             status <- CMutex::new(0),
             buffer: Box::init(pin_init::init_zeroed())?,
         }? Error)
diff --git a/rust/pin-init/examples/linked_list.rs b/rust/pin-init/examples/linked_list.rs
index f9e117c7dfe0..8445a5890cb7 100644
--- a/rust/pin-init/examples/linked_list.rs
+++ b/rust/pin-init/examples/linked_list.rs
@@ -6,7 +6,6 @@
 
 use core::{
     cell::Cell,
-    convert::Infallible,
     marker::PhantomPinned,
     pin::Pin,
     ptr::{self, NonNull},
@@ -31,31 +30,31 @@ pub struct ListHead {
 
 impl ListHead {
     #[inline]
-    pub fn new() -> impl PinInit<Self, Infallible> {
-        try_pin_init!(&this in Self {
+    pub fn new() -> impl PinInit<Self> {
+        pin_init!(&this in Self {
             next: unsafe { Link::new_unchecked(this) },
             prev: unsafe { Link::new_unchecked(this) },
             pin: PhantomPinned,
-        }? Infallible)
+        })
     }
 
     #[inline]
     #[allow(dead_code)]
-    pub fn insert_next(list: &ListHead) -> impl PinInit<Self, Infallible> + '_ {
-        try_pin_init!(&this in Self {
+    pub fn insert_next(list: &ListHead) -> impl PinInit<Self> + '_ {
+        pin_init!(&this in Self {
             prev: list.next.prev().replace(unsafe { Link::new_unchecked(this)}),
             next: list.next.replace(unsafe { Link::new_unchecked(this)}),
             pin: PhantomPinned,
-        }? Infallible)
+        })
     }
 
     #[inline]
-    pub fn insert_prev(list: &ListHead) -> impl PinInit<Self, Infallible> + '_ {
-        try_pin_init!(&this in Self {
+    pub fn insert_prev(list: &ListHead) -> impl PinInit<Self> + '_ {
+        pin_init!(&this in Self {
             next: list.prev.next().replace(unsafe { Link::new_unchecked(this)}),
             prev: list.prev.replace(unsafe { Link::new_unchecked(this)}),
             pin: PhantomPinned,
-        }? Infallible)
+        })
     }
 
     #[inline]
diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/examples/pthread_mutex.rs
index 49b004c8c137..4e082ec7d5de 100644
--- a/rust/pin-init/examples/pthread_mutex.rs
+++ b/rust/pin-init/examples/pthread_mutex.rs
@@ -98,11 +98,11 @@ fn init_raw() -> impl PinInit<UnsafeCell<libc::pthread_mutex_t>, Error> {
                 // SAFETY: mutex has been initialized
                 unsafe { pin_init_from_closure(init) }
             }
-            try_pin_init!(Self {
-            data: UnsafeCell::new(data),
-            raw <- init_raw(),
-            pin: PhantomPinned,
-        }? Error)
+            pin_init!(Self {
+                data: UnsafeCell::new(data),
+                raw <- init_raw(),
+                pin: PhantomPinned,
+            }? Error)
         }
 
         #[allow(dead_code)]
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 8dc9dd5ac6fd..8673008f45d2 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -146,7 +146,7 @@
 //!
 //! impl DriverData {
 //!     fn new() -> impl PinInit<Self, Error> {
-//!         try_pin_init!(Self {
+//!         pin_init!(Self {
 //!             status <- CMutex::new(0),
 //!             buffer: Box::init(pin_init::init_zeroed())?,
 //!         }? Error)
@@ -528,7 +528,7 @@ macro_rules! stack_pin_init {
 ///     x: u32,
 /// }
 ///
-/// stack_try_pin_init!(let foo: Foo = try_pin_init!(Foo {
+/// stack_try_pin_init!(let foo: Foo = pin_init!(Foo {
 ///     a <- CMutex::new(42),
 ///     b: Box::try_new(Bar {
 ///         x: 64,
@@ -555,7 +555,7 @@ macro_rules! stack_pin_init {
 ///     x: u32,
 /// }
 ///
-/// stack_try_pin_init!(let foo: Foo =? try_pin_init!(Foo {
+/// stack_try_pin_init!(let foo: Foo =? pin_init!(Foo {
 ///     a <- CMutex::new(42),
 ///     b: Box::try_new(Bar {
 ///         x: 64,
@@ -584,10 +584,10 @@ macro_rules! stack_try_pin_init {
     };
 }
 
-/// Construct an in-place, pinned initializer for `struct`s.
+/// Construct an in-place, fallible pinned initializer for `struct`s.
 ///
-/// This macro defaults the error to [`Infallible`]. If you need a different error, then use
-/// [`try_pin_init!`].
+/// The error type defaults to [`Infallible`]; if you need a different one, write `? Error` at the
+/// end, after the struct initializer.
 ///
 /// The syntax is almost identical to that of a normal `struct` initializer:
 ///
@@ -783,54 +783,10 @@ macro_rules! pin_init {
     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
         $($fields:tt)*
     }) => {
-        $crate::try_pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
+        $crate::pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
             $($fields)*
         }? ::core::convert::Infallible)
     };
-}
-
-/// Construct an in-place, fallible pinned initializer for `struct`s.
-///
-/// If the initialization can complete without error (or [`Infallible`]), then use [`pin_init!`].
-///
-/// You can use the `?` operator or use `return Err(err)` inside the initializer to stop
-/// initialization and return the error.
-///
-/// IMPORTANT: if you have `unsafe` code inside of the initializer you have to ensure that when
-/// initialization fails, the memory can be safely deallocated without any further modifications.
-///
-/// The syntax is identical to [`pin_init!`] with the following exception: you must append `? $type`
-/// after the `struct` initializer to specify the error type you want to use.
-///
-/// # Examples
-///
-/// ```rust
-/// # #![feature(allocator_api)]
-/// # #[path = "../examples/error.rs"] mod error; use error::Error;
-/// use pin_init::{pin_data, try_pin_init, PinInit, InPlaceInit, init_zeroed};
-///
-/// #[pin_data]
-/// struct BigBuf {
-///     big: Box<[u8; 1024 * 1024 * 1024]>,
-///     small: [u8; 1024 * 1024],
-///     ptr: *mut u8,
-/// }
-///
-/// impl BigBuf {
-///     fn new() -> impl PinInit<Self, Error> {
-///         try_pin_init!(Self {
-///             big: Box::init(init_zeroed())?,
-///             small: [0; 1024 * 1024],
-///             ptr: core::ptr::null_mut(),
-///         }? Error)
-///     }
-/// }
-/// # let _ = Box::pin_init(BigBuf::new());
-/// ```
-// For a detailed example of how this macro works, see the module documentation of the hidden
-// module `macros` inside of `macros.rs`.
-#[macro_export]
-macro_rules! try_pin_init {
     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
         $($fields:tt)*
     }? $err:ty) => {
@@ -847,10 +803,10 @@ macro_rules! try_pin_init {
     }
 }
 
-/// Construct an in-place initializer for `struct`s.
+/// Construct an in-place, fallible initializer for `struct`s.
 ///
-/// This macro defaults the error to [`Infallible`]. If you need a different error, then use
-/// [`try_init!`].
+/// This macro defaults the error to [`Infallible`]; if you need a different one, write `? Error`
+/// at the end, after the struct initializer.
 ///
 /// The syntax is identical to [`pin_init!`] and its safety caveats also apply:
 /// - `unsafe` code must guarantee either full initialization or return an error and allow
@@ -890,52 +846,10 @@ macro_rules! init {
     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
         $($fields:tt)*
     }) => {
-        $crate::try_init!($(&$this in)? $t $(::<$($generics),*>)? {
+        $crate::init!($(&$this in)? $t $(::<$($generics),*>)? {
             $($fields)*
         }? ::core::convert::Infallible)
-    }
-}
-
-/// Construct an in-place fallible initializer for `struct`s.
-///
-/// If the initialization can complete without error (or [`Infallible`]), then use
-/// [`init!`].
-///
-/// The syntax is identical to [`try_pin_init!`]. You need to specify a custom error
-/// via `? $type` after the `struct` initializer.
-/// The safety caveats from [`try_pin_init!`] also apply:
-/// - `unsafe` code must guarantee either full initialization or return an error and allow
-///   deallocation of the memory.
-/// - the fields are initialized in the order given in the initializer.
-/// - no references to fields are allowed to be created inside of the initializer.
-///
-/// # Examples
-///
-/// ```rust
-/// # #![feature(allocator_api)]
-/// # use core::alloc::AllocError;
-/// # use pin_init::InPlaceInit;
-/// use pin_init::{try_init, Init, init_zeroed};
-///
-/// struct BigBuf {
-///     big: Box<[u8; 1024 * 1024 * 1024]>,
-///     small: [u8; 1024 * 1024],
-/// }
-///
-/// impl BigBuf {
-///     fn new() -> impl Init<Self, AllocError> {
-///         try_init!(Self {
-///             big: Box::init(init_zeroed())?,
-///             small: [0; 1024 * 1024],
-///         }? AllocError)
-///     }
-/// }
-/// # let _ = Box::init(BigBuf::new());
-/// ```
-// For a detailed example of how this macro works, see the module documentation of the hidden
-// module `macros` inside of `macros.rs`.
-#[macro_export]
-macro_rules! try_init {
+    };
     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
         $($fields:tt)*
     }? $err:ty) => {
@@ -1410,14 +1324,14 @@ pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
 /// fn init_foo() -> impl PinInit<Foo, Error> {
 ///     pin_init_scope(|| {
 ///         let bar = lookup_bar()?;
-///         Ok(try_pin_init!(Foo { a: bar.a.into(), b: bar.b }? Error))
+///         Ok(pin_init!(Foo { a: bar.a.into(), b: bar.b }? Error))
 ///     })
 /// }
 /// ```
 ///
 /// This initializer will first execute `lookup_bar()`, match on it, if it returned an error, the
 /// initializer itself will fail with that error. If it returned `Ok`, then it will run the
-/// initializer returned by the [`try_pin_init!`] invocation.
+/// initializer returned by the [`pin_init!`] invocation.
 pub fn pin_init_scope<T, E, F, I>(make_init: F) -> impl PinInit<T, E>
 where
     F: FnOnce() -> Result<I, E>,
@@ -1453,14 +1367,14 @@ pub fn pin_init_scope<T, E, F, I>(make_init: F) -> impl PinInit<T, E>
 /// fn init_foo() -> impl Init<Foo, Error> {
 ///     init_scope(|| {
 ///         let bar = lookup_bar()?;
-///         Ok(try_init!(Foo { a: bar.a.into(), b: bar.b }? Error))
+///         Ok(init!(Foo { a: bar.a.into(), b: bar.b }? Error))
 ///     })
 /// }
 /// ```
 ///
 /// This initializer will first execute `lookup_bar()`, match on it, if it returned an error, the
 /// initializer itself will fail with that error. If it returned `Ok`, then it will run the
-/// initializer returned by the [`try_init!`] invocation.
+/// initializer returned by the [`init!`] invocation.
 pub fn init_scope<T, E, F, I>(make_init: F) -> impl Init<T, E>
 where
     F: FnOnce() -> Result<I, E>,
-- 
2.52.0

