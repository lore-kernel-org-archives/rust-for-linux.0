Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9FA399352;
	Mon,  3 Aug 2026 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762885; cv=none; b=g8Omg27IvxZDgiTllTQ1byiMXyVdgYL1zL8Q3gFUJkZvZt4cW3FrQCeQpONGLIHf98hJR3cjOJ17VGttDxCWs4+a65H2b0xbP31kqyLR5utb6ipJkqLJDo4WNXVM42Aq/04tonjHrmMUUmMsQZ0e7hjiU2yHL9DNjPPgIqdA+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762885; c=relaxed/simple;
	bh=w+UiGIXQoTX3+c5vRVaZ6rNDChmYJmKgfUq6H1DZv64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nt90xr/oyaxPN+1oWX1b9wm4BPWijIsl2vywjbduo/mIyWmuKT7gwTj8gmT35FL7LG1z5ibGuKz0Sxg1+OVgnGDSU0BcV1OaPKRWhvf/Sa9WABs2doC1+ZF1GiO6bBxBtihIpROINUfiCx2u2Km97BIBdmOA4ikDL5CoUFRTbgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKa5+jEZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKa5+jEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397C61F000E9;
	Mon,  3 Aug 2026 13:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785762876;
	bh=b00Hv1SwJEv+jeOSrrMmBeLV5dKUbiarlnq1jKy9Fik=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=FKa5+jEZfyD113L9Vbh2qAfzefWoB2cJavrdHzd3NKfLoZh7dh2Q9oLYs/TrxCkKm
	 QGtosIfbJ6mw5H0sHgbybu1Rjo02IYB4UwQw9UgeW4Zqob1u1z2fAidhoQ5nWi7AkF
	 7mkrJLASSby2k8MFPYG4bOqKsY+d3ZckICk6RbaA5mSCd5bVQR68iwsoH3dfrR03Kn
	 ZilZx+Jpcx4yRPVFBS34goiM9A4DUf5+wFgQQvJxLvfqEB7YtXfAs9gd9/1SJ0cM5C
	 huF+dJ550TruH8binpHw9FdQykn8TZ+5ODm5Zp73nem5jO+5+PJZGcuB4oEzF0dug+
	 jPOdUg1bWbRPw==
From: Gary Guo <gary@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: pin-init: add `#[inline]` to small functions
Date: Mon,  3 Aug 2026 14:14:19 +0100
Message-ID: <20260803131421.3560736-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Currently `pin-init` crate is missing many inline annotations. They are all
generic so still get inlined in normal builds, but are not inlined in
`-C opt-level=s` build. Mark these functions as `#[inline]` so they are
considered for inlining regardless.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
I've found this by inspecting pin-init related symbols when testing
pin-init-next. I think it's good to include this for 7.3, so I am
putting this into pin-init-next right away so it's in linux-next ASAP.

Reviews or feedbacks are still welcome until I send out pull request.
---
 rust/pin-init/internal/src/pin_data.rs |  2 ++
 rust/pin-init/src/__internal.rs        |  5 +++++
 rust/pin-init/src/alloc.rs             |  4 ++++
 rust/pin-init/src/lib.rs               | 17 +++++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 3c9d9c7364e2..ff194d27565e 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -468,6 +468,7 @@ fn generate_the_pin_data(
         impl #impl_generics ::core::clone::Clone for __ThePinData #ty_generics
             #whr
         {
+            #[inline]
             fn clone(&self) -> Self { *self }
         }
 
@@ -499,6 +500,7 @@ unsafe impl #impl_generics ::pin_init::__internal::HasPinData for #struct_name #
         {
             type PinData = __ThePinData #ty_generics;
 
+            #[inline]
             unsafe fn __pin_data() -> Self::PinData {
                 __ThePinData { __phantom: ::pin_init::__internal::PhantomInvariant::new() }
             }
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index ae9a0e68cd75..8e9fd18b993f 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -105,6 +105,7 @@ pub unsafe trait HasInitData {
 pub struct AllData<T: ?Sized>(PhantomInvariant<T>);
 
 impl<T: ?Sized> Clone for AllData<T> {
+    #[inline]
     fn clone(&self) -> Self {
         *self
     }
@@ -127,6 +128,7 @@ pub fn __make_closure<F, E>(self, f: F) -> F
 unsafe impl<T: ?Sized> HasInitData for T {
     type InitData = AllData<T>;
 
+    #[inline]
     unsafe fn __init_data() -> Self::InitData {
         AllData(PhantomInvariant::new())
     }
@@ -385,12 +387,14 @@ pub struct AlwaysFail<T: ?Sized> {
 
 impl<T: ?Sized> AlwaysFail<T> {
     /// Creates a new initializer that always fails.
+    #[inline]
     pub fn new() -> Self {
         Self { _t: PhantomData }
     }
 }
 
 impl<T: ?Sized> Default for AlwaysFail<T> {
+    #[inline]
     fn default() -> Self {
         Self::new()
     }
@@ -398,6 +402,7 @@ fn default() -> Self {
 
 // SAFETY: `__init` always fails, which is always okay.
 unsafe impl<T: ?Sized> PinInit<T, ()> for AlwaysFail<T> {
+    #[inline]
     unsafe fn __init(self, _slot: *mut T) -> Result<(), ()> {
         Err(())
     }
diff --git a/rust/pin-init/src/alloc.rs b/rust/pin-init/src/alloc.rs
index 641f4c7ce890..471652e8663a 100644
--- a/rust/pin-init/src/alloc.rs
+++ b/rust/pin-init/src/alloc.rs
@@ -35,6 +35,7 @@ fn try_pin_init<E>(init: impl PinInit<T, E>) -> Result<Pin<Self>, E>
     /// type.
     ///
     /// If `T: !Unpin` it will not be able to move afterwards.
+    #[inline]
     fn pin_init(init: impl PinInit<T>) -> Result<Pin<Self>, AllocError> {
         // SAFETY: We delegate to `init` and only change the error type.
         let init = unsafe {
@@ -52,6 +53,7 @@ fn try_init<E>(init: impl Init<T, E>) -> Result<Self, E>
         E: From<AllocError>;
 
     /// Use the given initializer to in-place initialize a `T`.
+    #[inline]
     fn init(init: impl Init<T>) -> Result<Self, AllocError> {
         // SAFETY: We delegate to `init` and only change the error type.
         let init = unsafe {
@@ -136,6 +138,7 @@ fn try_init<E>(init: impl Init<T, E>) -> Result<Self, E>
 impl<T> InPlaceWrite<T> for Box<MaybeUninit<T>> {
     type Initialized = Box<T>;
 
+    #[inline]
     fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::Initialized, E> {
         let slot = self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
@@ -145,6 +148,7 @@ fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::Initialized, E
         Ok(unsafe { self.assume_init() })
     }
 
+    #[inline]
     fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<Pin<Self::Initialized>, E> {
         let slot = self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 16f60dcb8330..49c18e73330c 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -955,6 +955,7 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
     ///     Ok(())
     /// });
     /// ```
+    #[inline]
     fn pin_chain<F>(self, f: F) -> ChainPinInit<Self, F, T, E>
     where
         F: FnOnce(Pin<&mut T>) -> Result<(), E>,
@@ -1003,6 +1004,7 @@ unsafe impl<T: ?Sized, E, I, F> PinInit<T, E> for ChainPinInit<I, F, T, E>
     I: PinInit<T, E>,
     F: FnOnce(Pin<&mut T>) -> Result<(), E>,
 {
+    #[inline]
     unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
         // SAFETY: All requirements fulfilled since this function is `__init`.
         let slot = unsafe { __internal::Slot::<__internal::Pinned, _>::new(slot) };
@@ -1068,6 +1070,7 @@ pub unsafe trait Init<T: ?Sized, E = Infallible>: PinInit<T, E> {
     ///     Ok(())
     /// });
     /// ```
+    #[inline]
     fn chain<F>(self, f: F) -> ChainInit<Self, F, T, E>
     where
         F: FnOnce(&mut T) -> Result<(), E>,
@@ -1095,6 +1098,7 @@ unsafe impl<T: ?Sized, E, I, F> PinInit<T, E> for ChainInit<I, F, T, E>
     I: Init<T, E>,
     F: FnOnce(&mut T) -> Result<(), E>,
 {
+    #[inline]
     unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
         // SAFETY: All requirements fulfilled since this function is `__init`.
         let slot = unsafe { __internal::Slot::<__internal::Unpinned, _>::new(slot) };
@@ -1175,6 +1179,7 @@ unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
 ///
 /// - `*mut U` must be castable to `*mut T` and any value of type `T` written through such a
 ///   pointer must result in a valid `U`.
+#[inline]
 pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> impl PinInit<U, E> {
     // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
     // requirements.
@@ -1187,6 +1192,7 @@ unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
 ///
 /// - `*mut U` must be castable to `*mut T` and any value of type `T` written through such a
 ///   pointer must result in a valid `U`.
+#[inline]
 pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) -> impl Init<U, E> {
     // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
     // requirements.
@@ -1283,6 +1289,7 @@ fn drop(&mut self) {
 /// let array: Box<[usize; 1_000]> = Box::init(init_array_from_fn(|i| i)).unwrap();
 /// assert_eq!(array.len(), 1_000);
 /// ```
+#[inline]
 pub fn init_array_from_fn<I, const N: usize, T, E>(
     make_init: impl FnMut(usize) -> I,
 ) -> impl Init<[T; N], E>
@@ -1307,6 +1314,7 @@ pub fn init_array_from_fn<I, const N: usize, T, E>(
 ///     Arc::pin_init(pin_init_array_from_fn(|i| CMutex::new(i))).unwrap();
 /// assert_eq!(array.len(), 1_000);
 /// ```
+#[inline]
 pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
     make_init: impl FnMut(usize) -> I,
 ) -> impl PinInit<[T; N], E>
@@ -1342,6 +1350,7 @@ pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
 /// This initializer will first execute `lookup_bar()`, match on it, if it returned an error, the
 /// initializer itself will fail with that error. If it returned `Ok`, then it will run the
 /// initializer returned by the [`pin_init!`] invocation.
+#[inline]
 pub fn pin_init_scope<T, E, F, I>(make_init: F) -> impl PinInit<T, E>
 where
     F: FnOnce() -> Result<I, E>,
@@ -1385,6 +1394,7 @@ pub fn pin_init_scope<T, E, F, I>(make_init: F) -> impl PinInit<T, E>
 /// This initializer will first execute `lookup_bar()`, match on it, if it returned an error, the
 /// initializer itself will fail with that error. If it returned `Ok`, then it will run the
 /// initializer returned by the [`init!`] invocation.
+#[inline]
 pub fn init_scope<T, E, F, I>(make_init: F) -> impl Init<T, E>
 where
     F: FnOnce() -> Result<I, E>,
@@ -1409,6 +1419,7 @@ unsafe impl<T> Init<T> for T {}
 // SAFETY: the `__init` function always returns `Ok(())` and initializes every field of
 // `slot`. Additionally, all pinning invariants of `T` are upheld.
 unsafe impl<T> PinInit<T> for T {
+    #[inline]
     unsafe fn __init(self, slot: *mut T) -> Result<(), Infallible> {
         // SAFETY: `slot` is valid for writes by the safety requirements of this function.
         unsafe { slot.write(self) };
@@ -1423,6 +1434,7 @@ unsafe impl<T, E> Init<T, E> for Result<T, E> {}
 // - `Ok(())`, `slot` was initialized and all pinned invariants of `T` are upheld.
 // - `Err(err)`, slot was not written to.
 unsafe impl<T, E> PinInit<T, E> for Result<T, E> {
+    #[inline]
     unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
         // SAFETY: `slot` is valid for writes by the safety requirements of this function.
         unsafe { slot.write(self?) };
@@ -1449,6 +1461,7 @@ pub trait InPlaceWrite<T> {
 impl<T> InPlaceWrite<T> for &'static mut MaybeUninit<T> {
     type Initialized = &'static mut T;
 
+    #[inline]
     fn write_init<E>(self, init: impl Init<T, E>) -> Result<Self::Initialized, E> {
         let slot = self.as_mut_ptr();
 
@@ -1459,6 +1472,7 @@ fn write_init<E>(self, init: impl Init<T, E>) -> Result<Self::Initialized, E> {
         unsafe { Ok(self.assume_init_mut()) }
     }
 
+    #[inline]
     fn write_pin_init<E>(self, init: impl PinInit<T, E>) -> Result<Pin<Self::Initialized>, E> {
         let slot = self.as_mut_ptr();
 
@@ -1764,6 +1778,7 @@ pub trait Wrapper<T> {
 }
 
 impl<T> Wrapper<T> for UnsafeCell<T> {
+    #[inline]
     fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
         // SAFETY: `UnsafeCell<T>` has a compatible layout to `T`.
         unsafe { cast_pin_init(value_init) }
@@ -1771,6 +1786,7 @@ fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
 }
 
 impl<T> Wrapper<T> for MaybeUninit<T> {
+    #[inline]
     fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
         // SAFETY: `MaybeUninit<T>` has a compatible layout to `T`.
         unsafe { cast_pin_init(value_init) }
@@ -1779,6 +1795,7 @@ fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
 
 #[cfg(all(feature = "unsafe-pinned", CONFIG_RUSTC_HAS_UNSAFE_PINNED))]
 impl<T> Wrapper<T> for core::pin::UnsafePinned<T> {
+    #[inline]
     fn pin_init<E>(init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
         // SAFETY: `UnsafePinned<T>` has a compatible layout to `T`.
         unsafe { cast_pin_init(init) }

base-commit: cc973e15689e210b3de3fb7fb7909607d3545fab
-- 
2.54.0

