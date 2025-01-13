Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF14623497C;
	Mon, 13 Jan 2025 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774309; cv=none; b=drNS1cufUs5Cp6PKiU+oeBuUAXiYzRvcVHr4GUnJZ6+61fNn4hZejKTszP7z8urdC1ddYRe7Y50FM5Oa+kXDJng39BrQQz/ceZjmPD5n5LDgFQN7DsYqOqV/bTsqIb6LFpyFTdyW/9deKydYCQesJmAiY8u6NU7u575i15ZlggQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774309; c=relaxed/simple;
	bh=RXw9Pk6NKxr9xm9Sg7BO8ezgw24Hu63BsrxtJEj5HRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1PIx8+6Negy64m1dwjfqmYMlKYR2gnohK7XDcVMc6uP+pO5FMhgPmBm8Q9NNe7OE1xh0G5t/Z+mZecIQU/MN7eb5N4t4b6DBduY3X4QeaJQ4V1bkDockeGA6sga0htG4aPihyCCQAO1JLFGoiwwNVtnhbBMjqvoFfcOb7wLUtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4UbcaLp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4UbcaLp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9248BC4CED6;
	Mon, 13 Jan 2025 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736774307;
	bh=RXw9Pk6NKxr9xm9Sg7BO8ezgw24Hu63BsrxtJEj5HRo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z4UbcaLp6ZJ9FcvnOSRyTAKDPLyYWB2bBRDtnL5kzqOouCVTBHHAG551aNHOROZxE
	 S3onV9jqgRLgrrxWxAwntHvXGtxigh5qRzQE0FUAcSbfO6ArNj5U7xJcPu0NnBpXkT
	 PLxfHBqZYDFMPy9jMEeIRNKlXd14G3DDFao6vxrF5odx6XyyGyo2+Buu9fP9vbL0VY
	 ESvQw4SMg0N1CouPnHYnDra6cxNHZegcx1tW4XxJC4iw2FcEZWc8xgY+Dp7GqvDzOg
	 bDmO1cIIOiZNLKzLHxwmM2Um1qysr76XwUHTr5gJzefQFwCR+goCC77K4mKr6XbhkB
	 pa4yCOw3/A7TA==
Message-ID: <fc667065-6951-436c-9329-77e94a64f614@kernel.org>
Date: Mon, 13 Jan 2025 14:18:23 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] rust: add improved version of
 `ForeignOwnable::borrow_mut`
Content-Language: en-US
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>
References: <20241120-borrow-mut-v6-0-80dbadd00951@gmail.com>
 <20241120-borrow-mut-v6-6-80dbadd00951@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20241120-borrow-mut-v6-6-80dbadd00951@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2024 12:46, Tamir Duberstein wrote:
> From: Alice Ryhl <aliceryhl@google.com>
> 
> Previously, the `ForeignOwnable` trait had a method called `borrow_mut`
> that was intended to provide mutable access to the inner value. However,
> the method accidentally made it possible to change the address of the
> object being modified, which usually isn't what we want. (And when we
> want that, it can be done by calling `from_foreign` and `into_foreign`,
> like how the old `borrow_mut` was implemented.)
> 
> In this patch, we introduce an alternate definition of `borrow_mut` that
> solves the previous problem. Conceptually, given a pointer type `P` that
> implements `ForeignOwnable`, the `borrow_mut` method gives you the same
> kind of access as an `&mut P` would, except that it does not let you
> change the pointer `P` itself.
> 
> This is analogous to how the existing `borrow` method provides the same
> kind of access to the inner value as an `&P`.
> 
> Note that for types like `Arc`, having an `&mut Arc<T>` only gives you
> immutable access to the inner `T`. This is because mutable references
> assume exclusive access, but there might be other handles to the same
> reference counted value, so the access isn't exclusive. The `Arc` type
> implements this by making `borrow_mut` return the same type as `borrow`.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

The new functions in kbox.rs should probably use crate::ffi instead of
core::ffi arguments. Besides that,

Acked-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  rust/kernel/alloc/kbox.rs | 21 ++++++++++++++
>  rust/kernel/sync/arc.rs   |  7 +++++
>  rust/kernel/types.rs      | 71 ++++++++++++++++++++++++++++++++++++++---------
>  3 files changed, 86 insertions(+), 13 deletions(-)
> 
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index e00c14053efbfb08d053e0f0b11247fa25d9d516..4ffc4e1b22b2b7c2ea8e8ed5b7f7a8534625249f 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -354,6 +354,7 @@ impl<T: 'static, A> ForeignOwnable for Box<T, A>
>      A: Allocator,
>  {
>      type Borrowed<'a> = &'a T;
> +    type BorrowedMut<'a> = &'a mut T;
>  
>      fn into_foreign(self) -> *mut crate::ffi::c_void {
>          Box::into_raw(self).cast()
> @@ -370,6 +371,13 @@ unsafe fn borrow<'a>(ptr: *mut crate::ffi::c_void) -> &'a T {
>          // immutable for the duration of 'a.
>          unsafe { &*ptr.cast() }
>      }
> +
> +    unsafe fn borrow_mut<'a>(ptr: *mut core::ffi::c_void) -> &'a mut T {
> +        let ptr = ptr.cast();
> +        // SAFETY: The safety requirements of this method ensure that the pointer is valid and that
> +        // nothing else will access the value for the duration of 'a.
> +        unsafe { &mut *ptr }
> +    }
>  }
>  
>  impl<T: 'static, A> ForeignOwnable for Pin<Box<T, A>>
> @@ -377,6 +385,7 @@ impl<T: 'static, A> ForeignOwnable for Pin<Box<T, A>>
>      A: Allocator,
>  {
>      type Borrowed<'a> = Pin<&'a T>;
> +    type BorrowedMut<'a> = Pin<&'a mut T>;
>  
>      fn into_foreign(self) -> *mut crate::ffi::c_void {
>          // SAFETY: We are still treating the box as pinned.
> @@ -399,6 +408,18 @@ unsafe fn borrow<'a>(ptr: *mut crate::ffi::c_void) -> Pin<&'a T> {
>          // SAFETY: This pointer originates from a `Pin<Box<T>>`.
>          unsafe { Pin::new_unchecked(r) }
>      }
> +
> +    unsafe fn borrow_mut<'a>(ptr: *mut core::ffi::c_void) -> Pin<&'a mut T> {
> +        let ptr = ptr.cast();
> +        // SAFETY: The safety requirements for this function ensure that the object is still alive,
> +        // so it is safe to dereference the raw pointer.
> +        // The safety requirements of `from_foreign` also ensure that the object remains alive for
> +        // the lifetime of the returned value.
> +        let r = unsafe { &mut *ptr };
> +
> +        // SAFETY: This pointer originates from a `Pin<Box<T>>`.
> +        unsafe { Pin::new_unchecked(r) }
> +    }
>  }
>  
>  impl<T, A> Deref for Box<T, A>
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 1d26c309d21db53f1fc769562c2afb4e881c3b5b..eb5cd8b360a3507a527978aaf96dbc3a80d4ae2c 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -332,6 +332,7 @@ pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
>  
>  impl<T: 'static> ForeignOwnable for Arc<T> {
>      type Borrowed<'a> = ArcBorrow<'a, T>;
> +    type BorrowedMut<'a> = Self::Borrowed<'a>;
>  
>      fn into_foreign(self) -> *mut crate::ffi::c_void {
>          ManuallyDrop::new(self).ptr.as_ptr().cast()
> @@ -357,6 +358,12 @@ unsafe fn borrow<'a>(ptr: *mut crate::ffi::c_void) -> ArcBorrow<'a, T> {
>          // for the lifetime of the returned value.
>          unsafe { ArcBorrow::new(inner) }
>      }
> +
> +    unsafe fn borrow_mut<'a>(ptr: *mut core::ffi::c_void) -> ArcBorrow<'a, T> {
> +        // SAFETY: The safety requirements for `borrow_mut` are a superset of the safety
> +        // requirements for `borrow`.
> +        unsafe { Self::borrow(ptr) }
> +    }
>  }
>  
>  impl<T: ?Sized> Deref for Arc<T> {
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index af316e291908123407f08c665c91113a666fc593..0dfaf45a755c7ce702027918e5fd3e97c407fda4 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -19,26 +19,33 @@
>  /// This trait is meant to be used in cases when Rust objects are stored in C objects and
>  /// eventually "freed" back to Rust.
>  pub trait ForeignOwnable: Sized {
> -    /// Type of values borrowed between calls to [`ForeignOwnable::into_foreign`] and
> -    /// [`ForeignOwnable::from_foreign`].
> +    /// Type used to immutably borrow a value that is currently foreign-owned.
>      type Borrowed<'a>;
>  
> +    /// Type used to mutably borrow a value that is currently foreign-owned.
> +    type BorrowedMut<'a>;
> +
>      /// Converts a Rust-owned object to a foreign-owned one.
>      ///
>      /// The foreign representation is a pointer to void. There are no guarantees for this pointer.
>      /// For example, it might be invalid, dangling or pointing to uninitialized memory. Using it in
> -    /// any way except for [`ForeignOwnable::from_foreign`], [`ForeignOwnable::borrow`],
> -    /// [`ForeignOwnable::try_from_foreign`] can result in undefined behavior.
> +    /// any way except for [`from_foreign`], [`try_from_foreign`], [`borrow`], or [`borrow_mut`] can
> +    /// result in undefined behavior.
> +    ///
> +    /// [`from_foreign`]: Self::from_foreign
> +    /// [`try_from_foreign`]: Self::try_from_foreign
> +    /// [`borrow`]: Self::borrow
> +    /// [`borrow_mut`]: Self::borrow_mut
>      fn into_foreign(self) -> *mut crate::ffi::c_void;
>  
>      /// Converts a foreign-owned object back to a Rust-owned one.
>      ///
>      /// # Safety
>      ///
> -    /// `ptr` must have been returned by a previous call to [`ForeignOwnable::into_foreign`] for
> -    /// which a previous matching [`ForeignOwnable::from_foreign`] hasn't been called yet.
> -    /// Additionally, all instances (if any) of values returned by [`ForeignOwnable::borrow`] for
> -    /// this object must have been dropped.
> +    /// The provided pointer must have been returned by a previous call to [`into_foreign`], and it
> +    /// must not be passed to `from_foreign` more than once.
> +    ///
> +    /// [`into_foreign`]: Self::into_foreign
>      unsafe fn from_foreign(ptr: *mut crate::ffi::c_void) -> Self;
>  
>      /// Tries to convert a foreign-owned object back to a Rust-owned one.
> @@ -48,8 +55,9 @@ pub trait ForeignOwnable: Sized {
>      ///
>      /// # Safety
>      ///
> -    /// `ptr` must either be null or satisfy the safety requirements for
> -    /// [`ForeignOwnable::from_foreign`].
> +    /// `ptr` must either be null or satisfy the safety requirements for [`from_foreign`].
> +    ///
> +    /// [`from_foreign`]: Self::from_foreign
>      unsafe fn try_from_foreign(ptr: *mut crate::ffi::c_void) -> Option<Self> {
>          if ptr.is_null() {
>              None
> @@ -60,17 +68,53 @@ unsafe fn try_from_foreign(ptr: *mut crate::ffi::c_void) -> Option<Self> {
>          }
>      }
>  
> -    /// Borrows a foreign-owned object.
> +    /// Borrows a foreign-owned object immutably.
> +    ///
> +    /// This method provides a way to access a foreign-owned value from Rust immutably. It provides
> +    /// you with exactly the same abilities as an `&Self` when the value is Rust-owned.
>      ///
>      /// # Safety
>      ///
> -    /// `ptr` must have been returned by a previous call to [`ForeignOwnable::into_foreign`] for
> -    /// which a previous matching [`ForeignOwnable::from_foreign`] hasn't been called yet.
> +    /// The provided pointer must have been returned by a previous call to [`into_foreign`], and if
> +    /// the pointer is ever passed to [`from_foreign`], then that call must happen after the end of
> +    /// the lifetime 'a.
> +    ///
> +    /// [`into_foreign`]: Self::into_foreign
> +    /// [`from_foreign`]: Self::from_foreign
>      unsafe fn borrow<'a>(ptr: *mut crate::ffi::c_void) -> Self::Borrowed<'a>;
> +
> +    /// Borrows a foreign-owned object mutably.
> +    ///
> +    /// This method provides a way to access a foreign-owned value from Rust mutably. It provides
> +    /// you with exactly the same abilities as an `&mut Self` when the value is Rust-owned, except
> +    /// that the address of the object must not be changed.
> +    ///
> +    /// Note that for types like [`Arc`], an `&mut Arc<T>` only gives you immutable access to the
> +    /// inner value, so this method also only provides immutable access in that case.
> +    ///
> +    /// In the case of `Box<T>`, this method gives you the ability to modify the inner `T`, but it
> +    /// does not let you change the box itself. That is, you cannot change which allocation the box
> +    /// points at.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The provided pointer must have been returned by a previous call to [`into_foreign`], and if
> +    /// the pointer is ever passed to [`from_foreign`], then that call must happen after the end of
> +    /// the lifetime 'a.
> +    ///
> +    /// The lifetime 'a must not overlap with the lifetime of any other call to [`borrow`] or
> +    /// `borrow_mut` on the same object.
> +    ///
> +    /// [`into_foreign`]: Self::into_foreign
> +    /// [`from_foreign`]: Self::from_foreign
> +    /// [`borrow`]: Self::borrow
> +    /// [`Arc`]: crate::sync::Arc
> +    unsafe fn borrow_mut<'a>(ptr: *mut crate::ffi::c_void) -> Self::BorrowedMut<'a>;
>  }
>  
>  impl ForeignOwnable for () {
>      type Borrowed<'a> = ();
> +    type BorrowedMut<'a> = ();
>  
>      fn into_foreign(self) -> *mut crate::ffi::c_void {
>          core::ptr::NonNull::dangling().as_ptr()
> @@ -79,6 +123,7 @@ fn into_foreign(self) -> *mut crate::ffi::c_void {
>      unsafe fn from_foreign(_: *mut crate::ffi::c_void) -> Self {}
>  
>      unsafe fn borrow<'a>(_: *mut crate::ffi::c_void) -> Self::Borrowed<'a> {}
> +    unsafe fn borrow_mut<'a>(_: *mut crate::ffi::c_void) -> Self::BorrowedMut<'a> {}
>  }
>  
>  /// Runs a cleanup function/closure when dropped.
> 

