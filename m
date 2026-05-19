Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E953DAC13;
	Tue, 19 May 2026 08:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178701; cv=none; b=bHzkxpsFhOGdsMZCjJQk9ctEcPV81t34wEFsEHwMjMlINC9HnSR7/3LgRqFQC4O1OenvXBc4voQwkp+81wS7aUfa4kOiS/d+p806gkJQYS9U1x76xxDjfzBOKTQZHfG2uCu/jopVL/gs9gCla683aJIO3gyqdynTgyyWANryRNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178701; c=relaxed/simple;
	bh=F1jFzTpGl2VWMm8UO82J0/H5zO+mJMvs9MpCCWaqPwk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uEVmeSKkUHkfZILEnC0nOnMtCnn+LIcdGdjluNUKBJybZZ+Mq6aXvtXmcbaA0AfDziv5LY2b0hioOZwjgxu8LKz7D0GZOCWANhH+7XbzMP1CnitMTTiSwVXtXFtQ2KwZlfFA2kpa007dpfa2ugVrxzKRY7E5Bi6nFQM25j+I4AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jn2CFS0C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jn2CFS0C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79062C2BCC6;
	Tue, 19 May 2026 08:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178701;
	bh=F1jFzTpGl2VWMm8UO82J0/H5zO+mJMvs9MpCCWaqPwk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jn2CFS0C9PcNtNEKBDtGA7sLXMGbmyIM5GWolQfGUYXzlA3UYoabl/4bm8SCMHFcc
	 wouXgQS+F2cXv0mal8OcTR6TZL1jSc2rIiBy90SJEAVeU3YSdmDThcABLXpV5L+alF
	 uhRD8dEn7HMXQR24pkDp0Jx+PUzfmgdny4X+ucjt9qfL8TiDvarDbJFEJ3A+4jNbCg
	 3cAJPOSvAX7aSf3ZBwEEdGg+X8CDprkVhqk4tgyCEvoMsdR8S8SOLM6p8Yd0NdZGdx
	 XMFAVN1xapNglsPoZuY/B2NXF71w6iZKh/ZIW4cQfyv3dLrgiVhnyN3JRVGqTR+7Xc
	 K7UkJee3blBPg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Gary Guo <gary@garyguo.net>, Alexandre
 Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment
 of values
In-Reply-To: <DILXW5AK9O8E.3TESJB45UPTZM@garyguo.net>
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
 <DG0AIMJXPP65.1PTB9I0KQS4LI@nvidia.com>
 <DG0AU8J5K0SA.2SJVFWGAI98RZ@garyguo.net>
 <87bjec96nh.fsf@t14s.mail-host-address-is-not-set>
 <DILXW5AK9O8E.3TESJB45UPTZM@garyguo.net>
Date: Tue, 19 May 2026 10:18:11 +0200
Message-ID: <878q9f95j0.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Mon May 18, 2026 at 2:41 PM BST, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>> On Wed Jan 28, 2026 at 2:25 PM GMT, Alexandre Courbot wrote:
>>>> On Wed Jan 28, 2026 at 11:05 PM JST, Andreas Hindborg wrote:
>>>>> `CacheAligned` allows to easily align values to a 64 byte boundary.
>>>>>
>>>>> An example use case is the kernel `struct spinlock`. This struct is 4 bytes
>>>>> on x86 when lockdep is not enabled. The structure is not padded to fit a
>>>>> cache line. The effect of this for `SpinLock` is that the lock variable and
>>>>> the value protected by the lock might share a cache line, depending on the
>>>>> alignment requirements of the protected value. Wrapping the value in
>>>>> `CacheAligned` to get a `SpinLock<CacheAligned<T>>` solves this problem.
>>>>>
>>>>> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
>>>>> ---
>>>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>>> ---
>>>>>  rust/kernel/cache_aligned.rs | 59 ++++++++++++++++++++++++++++++++++++++++++++
>>>>>  rust/kernel/lib.rs           |  2 ++
>>>>>  2 files changed, 61 insertions(+)
>>>>>
>>>>> diff --git a/rust/kernel/cache_aligned.rs b/rust/kernel/cache_aligned.rs
>>>>> new file mode 100644
>>>>> index 0000000000000..9c33b8613c077
>>>>> --- /dev/null
>>>>> +++ b/rust/kernel/cache_aligned.rs
>>>>> @@ -0,0 +1,59 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +
>>>>> +use kernel::try_pin_init;
>>>>> +use pin_init::{
>>>>> +    pin_data,
>>>>> +    pin_init,
>>>>> +    PinInit, //
>>>>> +};
>>>>> +
>>>>> +/// Wrapper type that alings content to a 64 byte cache line.
>>>>
>>>> nit: s/alings/aligns
>>>>
>>>>> +#[repr(align(64))]
>>>>
>>>> While 64 bytes is the most common cache line size, AFAIK this is not
>>>> a universal value? Can we expose and use `L1_CACHE_BYTES` here?
>>>
>>> Unfortunately `repr(align())` does not accept expression or macro invocations.
>>> It's still possible with code-generation, but it'll be more tricky.
>>>
>>> On all archs that we do support today, I think the value is always 64. However
>>> it'd worth putting a FIXME or TODO (or assertion, maybe?) in case new archs gets
>>> addded where this isn't true.
>>
>> I was looking into how to implement this properly. Apparently, we don't
>> have a config item that specifies the L1 cache line size for all
>> architectures. Each architectures defines the cache line size as C
>> define in a header. For x86 we have
>>
>>   #define L1_CACHE_SHIFT	(CONFIG_X86_L1_CACHE_SHIFT)
>>
>> and for arm64
>>
>>   #define L1_CACHE_SHIFT		(6)
>>
>> and so on.
>>
>> One thing we could do is run the C preprocessor on a small snippet to
>> expand the `L1_CACHE_SHIFT` symbol at some point before invoking
>> `rustc`. Then we can pass the value to `rustc` via environment variable
>> when building the `macros` crate. This is similar to how we pass
>> `RUST_MODFILE` to `rustc`, sans the cpp invocation.
>>
>> Otherwise we have to convince all architectures that support Rust to
>> emit a config that we can rely on, like `CONFIG_L1_CACHE_SHIFT`.
>>
>> The latter options is probably the better one, what do you all think?
>>
>> Best regards,
>> Andreas Hindborg
>
> You can implement this with generics alone using associative types.
>
> mod sealed {
>     pub trait Sealed {
>         type Repr;
>     }
> }
>
> trait Alignment: sealed::Sealed {}
>
> #[repr(transparent)]
> struct Align<const N: usize>([<Self as sealed::Sealed>::Repr; 0])
> where
>     Self: Alignment;
>
> impl<const N: usize> Align<N>
> where
>     Self: Alignment,
> {
>     #[inline]
>     pub fn new() -> Self {
>         Align([])
>     }
> }
>
> macro_rules! impl_align {
>     () => {};
>     ($a:literal $($rest:literal)*) => {
>         const _: () = {
>             #[repr(align($a))]
>             struct Repr;
>
>             impl sealed::Sealed for Align<$a> {
>                 type Repr = Repr;
>             }
>             
>             impl Alignment for Align<$a> {}
>         };
>         
>         impl_align!($($rest)*);
>     }
> }
>
> impl_align!(32 64 128 256);

Right, that is great for avoiding code duplication in case we want to
have `Align<16>`, `Align<32>`, etc.

My discussion was about having just `CacheAligned` and having the
alignment of that type automatically be the `1 << L1_CACHE_SHIFT`.


Best regards,
Andreas Hindborg


