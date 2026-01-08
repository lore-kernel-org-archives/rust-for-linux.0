Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796EF44EE41;
	Thu,  8 Jan 2026 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880353; cv=none; b=eAmbLZGqVC5FeQhLL1s0f872Eur9PnN+sMN5bK8a+sL+rcbqM9qk8mSeoQYvSFzPSBKMeneaesDiMtQ1ae+A1v9fsk34ur+DGgbie2coQjxVD6Y3YqFdPLfcn7QLP5MZh27AsQaWbZjcefz3o8he6mkxsMsUQ9Tv6bMtkaGXFJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880353; c=relaxed/simple;
	bh=QwuxWyYwIvM1p8Y2qJaJPDiBKkhZtJoiSkd2kTuj4Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3dp3D4L/vbnL/0Yz4zgdF5e9ha+3OHawhs8mzz0jvvoTQQgnOERrvLc8fWtaBdZo+nMTJE6iX5jKm58W1xgJwVaXsWFgGmgCr0XBkE5qCmZmAFLTB30yYNAKmwnpy12oRAlI/ycfhguJttNG+lxJWu3HRux4eO0P4TRmraAMes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwywAcwK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwywAcwK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0FAC16AAE;
	Thu,  8 Jan 2026 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767880352;
	bh=QwuxWyYwIvM1p8Y2qJaJPDiBKkhZtJoiSkd2kTuj4Lg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WwywAcwKBLLQb/09GG4tF06cwz5OLBWzNFELytRdAuhNTDBBh9NWfWC5lKgGLJXQo
	 A+wCXTqzE06V627v8/ZjxC9I1IrVzUhAEx9HXrEkNcY3d1klZ/5XAhKLTOAD2PA6in
	 yKMCegUXPB2mBhvza+vHDFnyxi6u+zbUvTHNdI5WvR7lmmYyTZWhnDf29ehJw1r0If
	 oq7GvEX3iErXlrlnDdv7KLcqSJypLEA0+kS6vML/Q9I7GgQBJQ/T7U9Yp6AiG2lh99
	 DM/S+l+UBfY6epakEuhbERu4Nclb3GXuPb6N4O0VV2ptNNqF1YYVgh6RlhoWbJAfo8
	 hDmjorcTdgaGg==
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
Subject: [PATCH 01/12] rust: pin-init: remove `try_` versions of the initializer macros
Date: Thu,  8 Jan 2026 14:50:39 +0100
Message-ID: <20260108135127.3153925-2-lossin@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260108135127.3153925-1-lossin@kernel.org>
References: <20260108135127.3153925-1-lossin@kernel.org>
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
Signed-off-by: Benno Lossin <lossin@kernel.org>
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
2.51.2

