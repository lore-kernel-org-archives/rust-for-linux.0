Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D31436EA9A;
	Wed, 28 Jan 2026 18:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624858; cv=none; b=j2s1aF+D43RJohxGDMUYBc7g6nHcxtFD135gzLvcQ+qFta3iJcospt1Wx98MQe/l6o+OVmWcrw+vxI1GqOq7mBc/mRDhS93FkDqj8OXPOqa9Dxa8L1eNz9gLG8LPpZd72o33fOU5pHtt981ET15jgiXiyV/aUaMHPgaSpKInM7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624858; c=relaxed/simple;
	bh=endKlwhKNzvGTSXEW4b02lH4j360m/ub7LeNoK2n+iQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EcTJpVdEvBUhYrC2yR+fVaycU6UJ5pVjk0O4uuhtxM5KXXmyZdpTy5tHXYVcvMHkGkmC5Y1+yYS7NzQumAnisjzkgrgOk5uJE702rAzPcr5TmY52B7wGDmH3U4ZWxCOYNXJFN0t1L6D2uGNuUOSuoUnMzP0BG7p2LgzB36dYK14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv7kzNW3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bv7kzNW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633B7C4CEF7;
	Wed, 28 Jan 2026 18:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769624857;
	bh=endKlwhKNzvGTSXEW4b02lH4j360m/ub7LeNoK2n+iQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bv7kzNW3s8YUoS0V/5g1Em/ZjHkqTXz5drF/QcFwSQKmUVxN8INNNakTMcTYJiH4W
	 CCc0ajWmze1E/wfCFkqHm0WHM0CFfY9lsQvXcmyYOeEodSAI8eRWXG+NaRrf1f0ofL
	 HDxMYxEFeGtNC21vhE7SlTjyEVwgQrZjgVrQW21weCaK68IWG6FEewq1Y3YqOxTxXm
	 j4Rjyzl7BE9RCVe/c8tvjwQL6AgxQBlRHvHb6/k73O0DCLqd52Vsb1gahVbFvst2hc
	 IzV84nTUNZ/Dra2Cp9q6I1mFgBXcjfSHtlelny1JYQriI5CTyh4NMkMpvxpy7cyvjV
	 F1HuIJ+5Fqw5A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment
 of values
In-Reply-To: <DG0ANMHJMJ40.3J7GZJ5H6WRMA@garyguo.net>
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
 <oe9aTMWn11i_pX1_ZNBj_hdTkYx4kUxssGtNI31LhOJ1PkXpTDGB3zNuSiYKcjkBh3WLWb8kQ-SrFme4O4H-KQ==@protonmail.internalid>
 <DG0ANMHJMJ40.3J7GZJ5H6WRMA@garyguo.net>
Date: Wed, 28 Jan 2026 19:27:27 +0100
Message-ID: <87cy2tsicw.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Wed Jan 28, 2026 at 2:05 PM GMT, Andreas Hindborg wrote:
>> `CacheAligned` allows to easily align values to a 64 byte boundary.
>>
>> An example use case is the kernel `struct spinlock`. This struct is 4 bytes
>> on x86 when lockdep is not enabled. The structure is not padded to fit a
>> cache line. The effect of this for `SpinLock` is that the lock variable and
>> the value protected by the lock might share a cache line, depending on the
>> alignment requirements of the protected value. Wrapping the value in
>> `CacheAligned` to get a `SpinLock<CacheAligned<T>>` solves this problem.
>
> Do you mean `CacheAligned<SpinLock<T>>`?
>
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
>> ---
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Double SOB

`b4` did this! It only has the @samsung SOB in my tree.

>
>> ---
>>  rust/kernel/cache_aligned.rs | 59 ++++++++++++++++++++++++++++++++++++++++++++
>>  rust/kernel/lib.rs           |  2 ++
>>  2 files changed, 61 insertions(+)
>>
>> diff --git a/rust/kernel/cache_aligned.rs b/rust/kernel/cache_aligned.rs
>> new file mode 100644
>> index 0000000000000..9c33b8613c077
>> --- /dev/null
>> +++ b/rust/kernel/cache_aligned.rs
>> @@ -0,0 +1,59 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +use kernel::try_pin_init;
>> +use pin_init::{
>> +    pin_data,
>> +    pin_init,
>> +    PinInit, //
>> +};
>> +
>> +/// Wrapper type that alings content to a 64 byte cache line.
>> +#[repr(align(64))]
>> +#[pin_data]
>> +pub struct CacheAligned<T: ?Sized> {
>> +    #[pin]
>> +    value: T,
>> +}
>> +
>> +impl<T> CacheAligned<T> {
>> +    /// Creates an initializer for `CacheAligned<T>` form an initalizer for `T`
>> +    pub fn new(t: impl PinInit<T>) -> impl PinInit<CacheAligned<T>> {
>> +        pin_init!( CacheAligned {
>> +            value <- t
>> +        })
>> +    }
>> +
>> +    /// Creates a fallible initializer for `CacheAligned<T>` form a fallible
>> +    /// initalizer for `T`
>> +    pub fn try_new(
>> +        t: impl PinInit<T, crate::error::Error>,
>> +    ) -> impl PinInit<CacheAligned<T>, crate::error::Error> {
>> +        try_pin_init!( CacheAligned {
>> +            value <- t
>> +        }? crate::error::Error )
>> +    }
>
> You don't need two methods. You can have a single `new` method that's generic
> over error type.

Ok, cool.

>
>> +
>> +    /// Get a pointer to the contained value without creating a reference.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `ptr` must be dereferenceable.
>> +    pub const unsafe fn raw_get(ptr: *mut Self) -> *mut T {
>> +        // SAFETY: by function safety requirements `ptr` is valid for read
>> +        unsafe { &raw mut ((*ptr).value) }
>> +    }
>
> Have you had a case where you need this? Most wrapper types shouldn't need this.

I did, but I do not currently. I'll drop it.

>
>> +}
>> +
>> +impl<T: ?Sized> core::ops::Deref for CacheAligned<T> {
>> +    type Target = T;
>> +
>> +    fn deref(&self) -> &T {
>> +        &self.value
>> +    }
>> +}
>> +
>> +impl<T: ?Sized> core::ops::DerefMut for CacheAligned<T> {
>> +    fn deref_mut(&mut self) -> &mut T {
>> +        &mut self.value
>> +    }
>> +}
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index f812cf1200428..af6d48b078428 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -75,6 +75,7 @@
>>  pub mod bug;
>>  #[doc(hidden)]
>>  pub mod build_assert;
>> +mod cache_aligned;
>>  pub mod clk;
>>  #[cfg(CONFIG_CONFIGFS_FS)]
>>  pub mod configfs;
>> @@ -156,6 +157,7 @@
>>
>>  #[doc(hidden)]
>>  pub use bindings;
>> +pub use cache_aligned::CacheAligned;
>
> Let's not expose this from top-level of kernel crate.

Right. As I told Miguel, I would put this in the prelude.

>
> I have been thinking about a good namespace for these auxillary types. For my
> own project I would chuck them to `crate::utils`, but that won't be a very
> descriptive name.
>
> I wonder for this and other types that tweak the memory layout, we could have a
> `kernel::layout` which contains utilities for precisely controlling the layout?

How about `kernel::mem` since it is memory related?


Best regards,
Andreas Hindborg


