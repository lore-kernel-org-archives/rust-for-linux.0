Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426232;
	b=pBLf9z6QyGIT99UW2yOnd0UIoWk4x7cSOlUTxbmYGhhlyPtMVySmdJ1sceUDDc8/ZJwT
	 EoIw1rj7Bc1BoYA2ojeEPFmM/o2M5A+tib8DWRu/jZCukVm1n8IIqbDWgMqAnsQdPL+oc
	 ZzK0yLxJAvI5KwLzwDHaKX9EAj24AO4sxKpg08yMFocMh0yYcF768C25Erd66TFwLF7eY
	 EhCHIGy+g19BtGGlzRHqmmSYufnEmmHwEnF/fCvu1HfR07+W477ZOUF8yELxRfS9p0voh
	 Ql4YkqN2d3bacQoI74h3d56/ztLUmSo9YFNT61HFjGSx4/Br8xGqYqlm9bajuxHRYYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426232;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=6Uj72/TkNOSKLa/NvnCJF39YYiorN2RudsmWa61UIzo=;
	b=tbSKSuRKqGheq+CLGVWSCP/MJ4RKL8BhAt/dOuZ2b7hSPSFIB0eC3/Ho7/+cGP9LEQl+
	 UAri22SS4eXq/8VrJgUIA7w47cLAjsz6pHEchf2ebaErccva+9aROyT/LXURg2rhdjlA9
	 LS1f+gnpQz1OWHEDWNx1q7jipwuL/J51Vb9touWZfwk5HPRX7pNmxA/y6sdxYgu+qWo3j
	 z1mEz/MgntRYJ2Fssh7QzKFk2AFd2L87RAvh3bymQLhxELyEej9bPjPoVLXVpowgTr9pM
	 Fla12V2MB01FAVGaCJzhfyiuEzIvTHs4DrLpPtwcgM+HkrsqKm4sGkn8lKHutRFssjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0TEn7bo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F350606A32A;
	Wed, 11 Nov 2026 19:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0TEn7bo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E45F1F00A05;
	Wed, 11 Nov 2026 19:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426232;
	bh=6Uj72/TkNOSKLa/NvnCJF39YYiorN2RudsmWa61UIzo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=P0TEn7boxctwTXgjGvCCkHxSFAxUViGYhYp2RLKQzv3rCLNSA9j279J2TO4qYMp5M
	 Are//SoG1FmYXNapiCZqdhWYiptsMIgQVO1lTTOcfRSG3Ngr8pS1xp3NKwMV63Sp1/
	 ILvCg4F1GN7zIr0CNUUa9nq3jTAzTPvsDojCOcb7xaEakPpVeVCQCpcQ+LCe7uhZfd
	 8na3XgjuKauR1u4s1VYEfS+qGSXxY3ponUyIJqkyh5kPRIcjudRYcSDfgzpPN510Of
	 QAq69VbvOi8R/nnWj9AFrjeutEq6c9wSpVK8LpB4uIJB0YuvnhWk67PDa8JgxwBWTP
	 XWHeMILzdw1Hg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: sashiko-reviews@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6r?=
 =?utf-8?Q?n?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon
 <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Mark Rutland
 <mark.rutland@arm.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>, Lyude Paul <lyude@redhat.com>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 2/4] rust: sync: atomic: add atomic_per_byte_memcpy
In-Reply-To: <sashiko-outbox-209187@kernel.org>
References: <20261110-page-volatile-io-v5-0-a91ef252c24b@kernel.org>
 <20261110-page-volatile-io-v5-2-a91ef252c24b@kernel.org>
 <zJFQbYV67YWG-NtiQ0DX5nJ_8ddkkCuW7PYYnJDTumjlWS9_CnUvPigc1ieKk9xUcTCPH85viXhev1LXc5mMXA==@protonmail.internalid>
 <sashiko-outbox-209187@kernel.org>
Date: Wed, 11 Nov 2026 20:43:39 +0100
Message-ID: <8733t7w3v8.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] rust: sync: atomic: missing #[inline] attribute on
>   atomic_per_byte_memcpy()
> - [Low] rust: sync: atomic: wrong core::ptr::copy() doc on
>   atomic_per_byte_memcpy()
> --
>
> commit cade864abc69fc627ff4e6283efdc3170c94fccf
> Author: Andreas Hindborg <a.hindborg@kernel.org>
>
> rust: sync: atomic: add atomic_per_byte_memcpy
>
> This commit adds atomic_per_byte_memcpy() in kernel::sync::atomic, wrapping
> the kernel's memcpy() to perform byte-wise atomic memory copies.
>
>> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> index 6d27898add42c..cbcb081d8674e 100644
>> --- a/rust/kernel/sync/atomic.rs
>> +++ b/rust/kernel/sync/atomic.rs
>> @@ -848,3 +848,38 @@ pub unsafe fn cmpxchg<T: AtomicType, Ordering: ordering::Ordering>(
>>      // per LKMM.
>>      unsafe { Atomic::from_ptr(ptr) }.cmpxchg(old, new, o)
>>  }
>> +
>> +/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
>> +///
>> +/// This is the concurrent-safe counterpart of `core::ptr::copy()` (the equivalent of standard
>> +/// C's `memcpy()`). Because of the atomicity at byte level, when racing with another concurrent
>
> [Severity: Low]
> Should this documentation (and the commit message) refer to
> core::ptr::copy_nonoverlapping() instead of core::ptr::copy()?
>
> core::ptr::copy() is the equivalent of C's memmove() and permits overlapping
> regions, whereas core::ptr::copy_nonoverlapping() corresponds to C's
> memcpy() and matches the safety requirement below that src and dst do not
> overlap.

Thanks, this is correct. I will fix this.

>> +/// atomic access (or when a normal read races with an atomic read), or with an external access
>> +/// (from DMA or userspace), the behavior of this function is defined: the memory is copied at
>> +/// (at least) byte granularity.
>> +///
>> +/// Implementation note: this is currently implemented by the kernel's `memcpy()`, which is
>> +/// implemented in a way such that byte-wise atomic memory load/store instructions are used.
>> +///
>> +/// # Safety
>> +///
>> +/// Callers must ensure that:
>> +///
>> +/// - `src` is valid for atomic reads for `len` bytes for the duration of the call.
>> +/// - `dst` is valid for atomic writes for `len` bytes for the duration of the call.
>> +/// - The memory regions `src .. src + len` and `dst .. dst + len` do not overlap.
>> +pub unsafe fn atomic_per_byte_memcpy(src: *const u8, dst: *mut u8, len: usize) {
>> +    // SAFETY: By the safety requirements of this function, the following operation will not:
>> +    //  - Trap.
>> +    //  - Invalidate any reference invariants.
>> +    //  - Race with any operation by the Rust AM, as `bindings::memcpy` is a byte-wise atomic
>> +    //    operation and all operations by the Rust AM to the involved memory areas use byte-wise
>> +    //    atomic semantics.
>> +    //  - Copy between overlapping regions, which `memcpy()` does not support.
>> +    unsafe {
>> +        bindings::memcpy(
>> +            dst.cast::<kernel::ffi::c_void>(),
>> +            src.cast::<kernel::ffi::c_void>(),
>> +            len,
>> +        )
>> +    };
>> +}
>
> [Severity: Low]
> Should atomic_per_byte_memcpy() be marked #[inline]?  It is a non-generic
> function in the kernel crate that forwards directly to bindings::memcpy(),
> so without #[inline] callers in other crates cannot inline the wrapper
> unless LTO is enabled.

I will add the inline attribute.

Best regards,
Andreas Hindborg


