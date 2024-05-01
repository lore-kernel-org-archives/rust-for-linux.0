Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D3E86AE9
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714578006; cv=none; b=SZtq2Bm3ixpNlunqnvGxDU2sj/lRx97LBX4uTDtMDMD5obKpqqkkCcU9CySZRuSRxa20bgb91WnIGm0lBfzNqPhLnYfVb/sbT4IKbttGN8Ckr7EKSIrHICvyeuIVHyG4s5H2goO9g1IlZS0hs66JyRZeJc8ZiPa18/Za6+qJs+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714578006; c=relaxed/simple;
	bh=yUKztyAxPkB9EZwR9kGQ1ZaU2FDZ3ezvMRFZjtPOldw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OKFiMvvxhIrX0BSpd+xbhqerRMUC20aN9WeMi+a6oAil1dwI0v0l6xaGi92Qkf7scIDK/D9/btKon6eWFjIMiyaCD/LzGBHN3eabdU5FRP7y56z96OekwqcrAfHHPTYKCbFDPlFD8tVwlA1DqzwKZC/uJGr38NjP3UtYD4OUa04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=XxcybxYs; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="XxcybxYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1714578002; x=1714837202;
	bh=j2Dzj5glhPPJ7xtm1wjM7s5/Ek3/RgW9rVtY+0BWIRs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XxcybxYsL/wCyXjgNlhBzX7B08xn/YzGP6wDFIUKvZcPhrFTO3b6amyRDYxuVF42h
	 QLzG5tWg5O8iF08PkwAEaYtUTG3xx8hvhq9X2yGCqY+/kvvbILHRKg6c6IwTjRRQKv
	 pxfyg3E8qjj4g3wbkdpcmq9qjBtNFVdVgDvbNFUoSyumODbscx53PeYhL2QoPsGOvD
	 UMMUTkoc0cDq15LuoPupFrv/DuQdGO9wJEGKSC1juJSpqGFqlnYE2CVI7GFZPZL8PU
	 n7TzJTae9nI0xXFL5FXmN52U+Q4J6aJHxCcaK8Rw3qu5rJsa5hc01Ag/W7tFUcHq6I
	 kSxkLug1GlnoQ==
Date: Wed, 01 May 2024 15:39:56 +0000
To: Danilo Krummrich <dakr@redhat.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, ajanulgu@redhat.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH WIP 3/8] rust: alloc: implement AllocatorWithFlags trait
Message-ID: <87aabc79-6034-42a2-8987-4c8b0d4e17ee@proton.me>
In-Reply-To: <ZjI6k4YUsdUA_LaF@pollux>
References: <20240429201202.3490-1-dakr@redhat.com> <20240429201202.3490-4-dakr@redhat.com> <b098c9ee-a9b5-4bef-8703-ef56e6b1dcb7@proton.me> <ZjI6k4YUsdUA_LaF@pollux>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: a441e29d449908efaec173f83d2d0f80dc5b092e
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01.05.24 14:50, Danilo Krummrich wrote:
> On Wed, May 01, 2024 at 08:32:01AM +0000, Benno Lossin wrote:
>> On 29.04.24 22:11, Danilo Krummrich wrote:
>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>> ---
>>>   rust/kernel/alloc.rs | 21 +++++++++++++++++++++
>>>   1 file changed, 21 insertions(+)
>>>
>>> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
>>> index 9bc1b48b5641..ec45ba8f77ce 100644
>>> --- a/rust/kernel/alloc.rs
>>> +++ b/rust/kernel/alloc.rs
>>> @@ -8,6 +8,14 @@
>>>   pub mod box_ext;
>>>   pub mod vec_ext;
>>>
>>> +use core::{
>>> +    alloc::{Allocator, AllocError, Layout},
>>> +    ptr,
>>> +    ptr::NonNull,
>>> +};
>>> +
>>> +use flags::*;
>>> +
>>>   /// Flags to be used when allocating memory.
>>>   ///
>>>   /// They can be combined with the operators `|`, `&`, and `!`.
>>> @@ -68,3 +76,16 @@ pub mod flags {
>>>       /// small allocations.
>>>       pub const GFP_NOWAIT: Flags =3D Flags(bindings::GFP_NOWAIT);
>>>   }
>>> +
>>> +pub unsafe trait AllocatorWithFlags: Allocator {
>>> +    unsafe fn alloc_flags(&self, layout: Layout, flags: Flags) -> Resu=
lt<NonNull<[u8]>, AllocError>;
>>> +    unsafe fn realloc_flags(&self, ptr: *mut u8, old_size: usize, layo=
ut: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>;
>>
>> Please use `rustfmt`, there exists a make target that does it for you.
>=20
> Sure, gonna fix.
>=20
> Out of curiosity, given that we have this make target, the expectation ob=
viously
> seems to be that all Rust code in the kernel must be formatted with this.=
 I
> think that's indeed desirable. Two questions regarding this:
>=20
> How do we scale (as in ensure) this once Rust code becomes more common in
> subsystems?

There also is the make target `rustfmtcheck` which can be used to check
if the code has been formatted correctly (ie it will error on wrongly
formatted code).
IIRC there were some plans to add such a check to CI, but I don't know
the status of that.

> Is it possible for rustfmt to change rules unexpectedly? If so, how would=
 we
> deal with that?

AFAIK, `rustfmt` has a stable format [1] and if we really find
something that breaks our code, we can also add our own defaults to the
`.rustfmt.toml`.

[1]: https://rust-lang.github.io/rfcs/2437-rustfmt-stability.html

>> Also why are these functions `unsafe`? You haven't specified a `Safety`
>> section, which means nobody knows what the requirements are.
>=20
> I think I did this because they did inherit the safety requirements from
> krealloc() (as you also point out in another patch).
>=20
> I think they shouldn't be unsafe, just as the corresponding Allocator one=
s
> aren't.
>=20
> Gonna change that.

Sounds good.

>>> +
>>> +    fn default_allocate(&self, layout: Layout) -> Result<NonNull<[u8]>=
, AllocError> {
>>> +        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, GFP_KE=
RNEL) }
>>> +    }
>>
>> Why do we want to have these functions? I think that it would make sense
>> to forbid all other ways of allocating memory. So only allow allocation
>> where the flags are explicitly passed.
>=20
> I agree that we should forbid allocating memory with implicit default pag=
e
> flags.
>=20
> I added them, since I think we'll always need some implementation of the
> Allocator trait. And this just was the obvious generic implementation.
>=20
> If we agree to forbid allocating without page flags, we can just always r=
eturn
> an error?

There are multiple options that we could do here:
1. Return an error.
2. Print a warning at runtime and allocate regardless. Additionally use
    `klint` to lint against usage of that function.
3. Use `build_error!`.

I think that 1 could be very unexpected and hard to debug. 2 is better,
but at the moment `klint` is not required to run, so we would have to
change that. 3 is my preferred option, but I am not 100% confident that
it will work.

So maybe give option 3 a try and if that doesn't work, we can try to
come up with a different solution.

--=20
Cheers,
Benno

