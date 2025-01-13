Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79AF182CD;
	Mon, 13 Jan 2025 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774115; cv=none; b=fzGBn4mS5FZ9fB30VpzAs4a6ak0tlIBoLE23OfDCDF86NIdiTGPSsh0DT1VcGE4gC/97pT2ZxALxQpFPPnFSpZhWkAUhdcmn55MNTpHV7vtOHWyylMKOyj/ItBTMj95KKgfO4ia7G1xjSCN/6tUPH0azazPT3wW8Sr6jO295AsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774115; c=relaxed/simple;
	bh=roiakz5DKNys8TlqWjOY6EyIpFpJVvh+eOS/5EaV2Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIDSNNDfx3AXH6XfO8Ik7Y5QOmomFOiUbYgeRdvS7qclPusX4aKvfu8vXRNQIQHOw6FtnnxdLzarEX/ME08SIL5eou1HrkfMmR+11xKz3r/ChHpg3PbGMBrK72cOt6MqwCezlrUQx5zU0GNF5b7q5gthB0h0jcmFcuVHf0uwzUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etpmvtv+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etpmvtv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A89C4CEE9;
	Mon, 13 Jan 2025 13:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736774115;
	bh=roiakz5DKNys8TlqWjOY6EyIpFpJVvh+eOS/5EaV2Dc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=etpmvtv+yrJhYd+idvpOzwsUXMJKQJPFKWh8aHxJ9uG4ASYlvsJvXttY+wMJxJk2X
	 SXo9pRW4bDeYwXDFSw20Dhosfl0YTj3F+vfJUWxpHsrd0RcNdm5981LeL9ofjn26GZ
	 4R5aIufBksOxg9wU9M2kiCJMILghvoDiIg74FTjdT78n6ZcOf6RLEUM8vzyjXGiBSr
	 Li4viZYhuKg7FJWI4vKZSvZuMw0sSzrWA+3R2EIIPNifrlqMrJ0ViNkf9Pm+cubzxS
	 qFaXvx/Qwt/6aGuXSAhWZitbBrBFEuB/sYCEFGA614Ckf4ZWNFFqsQ5wkv6h4Aj4yB
	 bh99qVqMyGxCw==
Message-ID: <ef980926-7bce-4e4a-9fbb-0851b2cc0bec@kernel.org>
Date: Mon, 13 Jan 2025 14:15:10 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] rust: types: avoid `as` casts
Content-Language: en-US
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241120-borrow-mut-v6-0-80dbadd00951@gmail.com>
 <20241120-borrow-mut-v6-2-80dbadd00951@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20241120-borrow-mut-v6-2-80dbadd00951@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2024 12:46, Tamir Duberstein wrote:
> Replace `as` casts with `cast{,_mut}` calls which are a bit safer.
> 
> In one instance, remove an unnecessary `as` cast without replacement.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  rust/kernel/alloc/kbox.rs | 8 ++++----
>  rust/kernel/sync/arc.rs   | 9 +++++----
>  rust/kernel/types.rs      | 2 +-
>  3 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index 9ce414361c2c6dd8eea09b11041f6c307cbc7864..3f0b04609bd487e3f50247f9f1abd5394b749c7e 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -356,13 +356,13 @@ impl<T: 'static, A> ForeignOwnable for Box<T, A>
>      type Borrowed<'a> = &'a T;
>  
>      fn into_foreign(self) -> *const crate::ffi::c_void {
> -        Box::into_raw(self) as _
> +        Box::into_raw(self).cast()
>      }
>  
>      unsafe fn from_foreign(ptr: *const crate::ffi::c_void) -> Self {
>          // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
>          // call to `Self::into_foreign`.
> -        unsafe { Box::from_raw(ptr as _) }
> +        unsafe { Box::from_raw(ptr.cast_mut().cast()) }
>      }
>  
>      unsafe fn borrow<'a>(ptr: *const crate::ffi::c_void) -> &'a T {
> @@ -380,13 +380,13 @@ impl<T: 'static, A> ForeignOwnable for Pin<Box<T, A>>
>  
>      fn into_foreign(self) -> *const crate::ffi::c_void {
>          // SAFETY: We are still treating the box as pinned.
> -        Box::into_raw(unsafe { Pin::into_inner_unchecked(self) }) as _
> +        Box::into_raw(unsafe { Pin::into_inner_unchecked(self) }).cast()
>      }
>  
>      unsafe fn from_foreign(ptr: *const crate::ffi::c_void) -> Self {
>          // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
>          // call to `Self::into_foreign`.
> -        unsafe { Pin::new_unchecked(Box::from_raw(ptr as _)) }
> +        unsafe { Pin::new_unchecked(Box::from_raw(ptr.cast_mut().cast())) }
>      }
>  
>      unsafe fn borrow<'a>(ptr: *const crate::ffi::c_void) -> Pin<&'a T> {
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index b4e492dd712137c7c39e3de3d39c0c833944828c..50645660a9c33cb121ee1b2469003b325000d840 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -201,10 +201,11 @@ pub fn new(contents: T, flags: Flags) -> Result<Self, AllocError> {
>          };
>  
>          let inner = KBox::new(value, flags)?;
> +        let inner = KBox::leak(inner).into();
>  
>          // SAFETY: We just created `inner` with a reference count of 1, which is owned by the new
>          // `Arc` object.
> -        Ok(unsafe { Self::from_inner(KBox::leak(inner).into()) })
> +        Ok(unsafe { Self::from_inner(inner) })
>      }
>  }
>  
> @@ -333,13 +334,13 @@ impl<T: 'static> ForeignOwnable for Arc<T> {
>      type Borrowed<'a> = ArcBorrow<'a, T>;
>  
>      fn into_foreign(self) -> *const crate::ffi::c_void {
> -        ManuallyDrop::new(self).ptr.as_ptr() as _
> +        ManuallyDrop::new(self).ptr.as_ptr().cast()
>      }
>  
>      unsafe fn borrow<'a>(ptr: *const crate::ffi::c_void) -> ArcBorrow<'a, T> {
>          // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
>          // call to `Self::into_foreign`.
> -        let inner = unsafe { NonNull::new_unchecked(ptr as *mut ArcInner<T>) };
> +        let inner = unsafe { NonNull::new_unchecked(ptr.cast_mut().cast::<ArcInner<T>>()) };
>  
>          // SAFETY: The safety requirements of `from_foreign` ensure that the object remains alive
>          // for the lifetime of the returned value.
> @@ -349,7 +350,7 @@ unsafe fn borrow<'a>(ptr: *const crate::ffi::c_void) -> ArcBorrow<'a, T> {
>      unsafe fn from_foreign(ptr: *const crate::ffi::c_void) -> Self {
>          // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
>          // call to `Self::into_foreign`.
> -        let inner = unsafe { NonNull::new_unchecked(ptr as *mut ArcInner<T>) };
> +        let inner = unsafe { NonNull::new_unchecked(ptr.cast_mut().cast::<ArcInner<T>>()) };
>  
>          // SAFETY: By the safety requirement of this function, we know that `ptr` came from
>          // a previous call to `Arc::into_foreign`, which guarantees that `ptr` is valid and
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index ec6457bb3084ae327c38ba4ba79b1601aef38244..318d2140470a90568100f86fd8c6d8084031f556 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -434,7 +434,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>      /// }
>      ///
>      /// let mut data = Empty {};
> -    /// let ptr = NonNull::<Empty>::new(&mut data as *mut _).unwrap();
> +    /// let ptr = NonNull::<Empty>::new(&mut data).unwrap();
>      /// # // SAFETY: TODO.
>      /// let data_ref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
>      /// let raw_ptr: NonNull<Empty> = ARef::into_raw(data_ref);
> 

