Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0EC182CD;
	Mon, 13 Jan 2025 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774153; cv=none; b=cm06HKGwoHNAgPIJU7KcbDRP/3X/snClDh/fzo0po3dheBXGdFvNdEJwYYbWGfdrjcTnsEBG2Qrn60dVBQcO/ADiwmBwJdRsvjT8vf5KgMCyf/ezLtXcauw6JJnCwc0Zunq7laUPpFXC4/ng4xx/ArI9X2v9Ce33WYV0RoPHEQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774153; c=relaxed/simple;
	bh=FR8nnHJQopVpCmN0ndbmN43l3Yw06MJvhY8jsbS9DiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxSJ45LWHxR1Y51dSbTIiYWsMC9ODH7JE9pB+3v0Qo0aWvgG4kb8k8OEZ4euub07TTQI5KVoCjj6Y4NRL+K5VdBviSXRTtRIzoO9ChQFbgfGPjO9WERz/DCYsxzEJlBAC9BZYFA51tI3E7TzhK/kdQzaZqa4P2YkLnJVnRrkA4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfwicVbw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfwicVbw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5EA5C4CED6;
	Mon, 13 Jan 2025 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736774152;
	bh=FR8nnHJQopVpCmN0ndbmN43l3Yw06MJvhY8jsbS9DiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SfwicVbwLFuEKs8APm40twHiby6uFhxZ+LG+lL0nu3dPvNv6E6UMC5AEbe+lX698s
	 Uyi43+Z2CEZ4jf0qxdrjfVrImQy4DxBa0osNqkNLP1hxAk/nmo0k1uSGUg2i2V9yy/
	 VY/7C3cVYWQWfMVTU32Emhdd7ILaGlOlcZvl/fBkjWxa8Wyz3Rc4Mv8eEReIPzsI8n
	 mYJl0m92TSpzV9zb78fCWAjT4DRa2ZRRYaWO1e3zT6MPLyId6cupjO4Pydd05u/QPW
	 nd88jtwtHvToOLXzYu3ACh25/SY8pS0YcwntfZyu9LFdRNXfZ3iU6RcpOZEqFhE4Bh
	 Xxp4Me57DeFoA==
Message-ID: <2225f6e2-bf49-4467-b44c-264729f54662@kernel.org>
Date: Mon, 13 Jan 2025 14:15:48 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] rust: change `ForeignOwnable` pointer to mut
Content-Language: en-US
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241120-borrow-mut-v6-0-80dbadd00951@gmail.com>
 <20241120-borrow-mut-v6-4-80dbadd00951@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20241120-borrow-mut-v6-4-80dbadd00951@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2024 12:46, Tamir Duberstein wrote:
> It is slightly more convenient to operate on mut pointers, and this also
> properly conveys the desired ownership semantics of the trait.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  rust/kernel/alloc/kbox.rs | 16 ++++++++--------
>  rust/kernel/miscdevice.rs |  2 +-
>  rust/kernel/sync/arc.rs   | 10 +++++-----
>  rust/kernel/types.rs      | 14 +++++++-------
>  4 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index 3f0b04609bd487e3f50247f9f1abd5394b749c7e..e00c14053efbfb08d053e0f0b11247fa25d9d516 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -355,17 +355,17 @@ impl<T: 'static, A> ForeignOwnable for Box<T, A>
>  {
>      type Borrowed<'a> = &'a T;
>  
> -    fn into_foreign(self) -> *const crate::ffi::c_void {
> +    fn into_foreign(self) -> *mut crate::ffi::c_void {
>          Box::into_raw(self).cast()
>      }
>  
> -    unsafe fn from_foreign(ptr: *const crate::ffi::c_void) -> Self {
> +    unsafe fn from_foreign(ptr: *mut crate::ffi::c_void) -> Self {
>          // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
>          // call to `Self::into_foreign`.
> -        unsafe { Box::from_raw(ptr.cast_mut().cast()) }
> +        unsafe { Box::from_raw(ptr.cast()) }
>      }
>  
> -    unsafe fn borrow<'a>(ptr: *const crate::ffi::c_void) -> &'a T {
> +    unsafe fn borrow<'a>(ptr: *mut crate::ffi::c_void) -> &'a T {
>          // SAFETY: The safety requirements of this method ensure that the object remains alive and
>          // immutable for the duration of 'a.
>          unsafe { &*ptr.cast() }
> @@ -378,18 +378,18 @@ impl<T: 'static, A> ForeignOwnable for Pin<Box<T, A>>
>  {
>      type Borrowed<'a> = Pin<&'a T>;
>  
> -    fn into_foreign(self) -> *const crate::ffi::c_void {
> +    fn into_foreign(self) -> *mut crate::ffi::c_void {
>          // SAFETY: We are still treating the box as pinned.
>          Box::into_raw(unsafe { Pin::into_inner_unchecked(self) }).cast()
>      }
>  
> -    unsafe fn from_foreign(ptr: *const crate::ffi::c_void) -> Self {
> +    unsafe fn from_foreign(ptr: *mut crate::ffi::c_void) -> Self {
>          // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
>          // call to `Self::into_foreign`.
> -        unsafe { Pin::new_unchecked(Box::from_raw(ptr.cast_mut().cast())) }
> +        unsafe { Pin::new_unchecked(Box::from_raw(ptr.cast())) }
>      }
>  
> -    unsafe fn borrow<'a>(ptr: *const crate::ffi::c_void) -> Pin<&'a T> {
> +    unsafe fn borrow<'a>(ptr: *mut crate::ffi::c_void) -> Pin<&'a T> {
>          // SAFETY: The safety requirements for this function ensure that the object is still alive,
>          // so it is safe to dereference the raw pointer.
>          // The safety requirements of `from_foreign` also ensure that the object remains alive for
> diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> index 7e2a79b3ae263659b7e0781c05cb130d10c8accb..e58807ad28dc644fa384e9c1fb41fd6e53abea7a 100644
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@ -193,7 +193,7 @@ impl<T: MiscDevice> VtableHelper<T> {
>      };
>  
>      // SAFETY: The open call of a file owns the private data.
> -    unsafe { (*file).private_data = ptr.into_foreign().cast_mut() };
> +    unsafe { (*file).private_data = ptr.into_foreign() };
>  
>      0
>  }
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index a11f267ce5d40b987f1f3c459271e5317ea0bae8..01d85da799d77127fc99a9b270b8a7b1ef435b6f 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -333,24 +333,24 @@ pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
>  impl<T: 'static> ForeignOwnable for Arc<T> {
>      type Borrowed<'a> = ArcBorrow<'a, T>;
>  
> -    fn into_foreign(self) -> *const crate::ffi::c_void {
> +    fn into_foreign(self) -> *mut crate::ffi::c_void {
>          ManuallyDrop::new(self).ptr.as_ptr().cast()
>      }
>  
> -    unsafe fn borrow<'a>(ptr: *const crate::ffi::c_void) -> ArcBorrow<'a, T> {
> +    unsafe fn borrow<'a>(ptr: *mut crate::ffi::c_void) -> ArcBorrow<'a, T> {
>          // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
>          // call to `Self::into_foreign`.
> -        let inner = unsafe { NonNull::new_unchecked(ptr.cast_mut().cast::<ArcInner<T>>()) };
> +        let inner = unsafe { NonNull::new_unchecked(ptr.cast::<ArcInner<T>>()) };
>  
>          // SAFETY: The safety requirements of `from_foreign` ensure that the object remains alive
>          // for the lifetime of the returned value.
>          unsafe { ArcBorrow::new(inner) }
>      }
>  
> -    unsafe fn from_foreign(ptr: *const crate::ffi::c_void) -> Self {
> +    unsafe fn from_foreign(ptr: *mut crate::ffi::c_void) -> Self {
>          // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
>          // call to `Self::into_foreign`.
> -        let inner = unsafe { NonNull::new_unchecked(ptr.cast_mut().cast::<ArcInner<T>>()) };
> +        let inner = unsafe { NonNull::new_unchecked(ptr.cast::<ArcInner<T>>()) };
>  
>          // SAFETY: By the safety requirement of this function, we know that `ptr` came from
>          // a previous call to `Arc::into_foreign`, which guarantees that `ptr` is valid and
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 318d2140470a90568100f86fd8c6d8084031f556..f9b398ee31fd5303f0224995f51d314a0c4ecbf2 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -29,7 +29,7 @@ pub trait ForeignOwnable: Sized {
>      /// For example, it might be invalid, dangling or pointing to uninitialized memory. Using it in
>      /// any way except for [`ForeignOwnable::from_foreign`], [`ForeignOwnable::borrow`],
>      /// [`ForeignOwnable::try_from_foreign`] can result in undefined behavior.
> -    fn into_foreign(self) -> *const crate::ffi::c_void;
> +    fn into_foreign(self) -> *mut crate::ffi::c_void;
>  
>      /// Borrows a foreign-owned object.
>      ///
> @@ -37,7 +37,7 @@ pub trait ForeignOwnable: Sized {
>      ///
>      /// `ptr` must have been returned by a previous call to [`ForeignOwnable::into_foreign`] for
>      /// which a previous matching [`ForeignOwnable::from_foreign`] hasn't been called yet.
> -    unsafe fn borrow<'a>(ptr: *const crate::ffi::c_void) -> Self::Borrowed<'a>;
> +    unsafe fn borrow<'a>(ptr: *mut crate::ffi::c_void) -> Self::Borrowed<'a>;
>  
>      /// Converts a foreign-owned object back to a Rust-owned one.
>      ///
> @@ -47,7 +47,7 @@ pub trait ForeignOwnable: Sized {
>      /// which a previous matching [`ForeignOwnable::from_foreign`] hasn't been called yet.
>      /// Additionally, all instances (if any) of values returned by [`ForeignOwnable::borrow`] for
>      /// this object must have been dropped.
> -    unsafe fn from_foreign(ptr: *const crate::ffi::c_void) -> Self;
> +    unsafe fn from_foreign(ptr: *mut crate::ffi::c_void) -> Self;
>  
>      /// Tries to convert a foreign-owned object back to a Rust-owned one.
>      ///
> @@ -58,7 +58,7 @@ pub trait ForeignOwnable: Sized {
>      ///
>      /// `ptr` must either be null or satisfy the safety requirements for
>      /// [`ForeignOwnable::from_foreign`].
> -    unsafe fn try_from_foreign(ptr: *const crate::ffi::c_void) -> Option<Self> {
> +    unsafe fn try_from_foreign(ptr: *mut crate::ffi::c_void) -> Option<Self> {
>          if ptr.is_null() {
>              None
>          } else {
> @@ -72,13 +72,13 @@ unsafe fn try_from_foreign(ptr: *const crate::ffi::c_void) -> Option<Self> {
>  impl ForeignOwnable for () {
>      type Borrowed<'a> = ();
>  
> -    fn into_foreign(self) -> *const crate::ffi::c_void {
> +    fn into_foreign(self) -> *mut crate::ffi::c_void {
>          core::ptr::NonNull::dangling().as_ptr()
>      }
>  
> -    unsafe fn borrow<'a>(_: *const crate::ffi::c_void) -> Self::Borrowed<'a> {}
> +    unsafe fn borrow<'a>(_: *mut crate::ffi::c_void) -> Self::Borrowed<'a> {}
>  
> -    unsafe fn from_foreign(_: *const crate::ffi::c_void) -> Self {}
> +    unsafe fn from_foreign(_: *mut crate::ffi::c_void) -> Self {}
>  }
>  
>  /// Runs a cleanup function/closure when dropped.
> 

