Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0E638398D;
	Tue, 12 May 2026 10:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778582578; cv=none; b=LWEuAvLQlN+ZVt/iwtwDL8ybS99Ie4+OeG3RHfll3l22Ru/bmFMUwPOJurvRTAljK9Y177X0HLl5afzel3p2cIqlVBYfvLlvKyoOBWnuZZSsSbtD8kbFxs3I/+KO90ZDNc+8yYY2UVDF/pXvlWJ+dMvIG9qYWdKNvTa5jZP5kP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778582578; c=relaxed/simple;
	bh=6aNpE6+SHwGVcb+1KjVkfIS1WvLj7QcIp+7VU9UpX64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GEUAStQf7Z6eDwuHnOjsRd0KTyjCiG4dE6tGdvrRVGxifHyXqkCBXVV0EH360QsnzYCGe6lr9iR88O1UAfQkArmBoNITelF57h29ddeeN45fNZUXDeLO03j2Xyp+TwOnrNLDjfGNd50nVLmJVGQFJKkGDPwRY8b+LKsnGK3pQx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXZQMx9O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXZQMx9O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3CCC2BCB0;
	Tue, 12 May 2026 10:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778582577;
	bh=6aNpE6+SHwGVcb+1KjVkfIS1WvLj7QcIp+7VU9UpX64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YXZQMx9Ol4cI9kiKySaWTC4DT3ct0qroLHvAHR4ech2vuZUB5tkHTbCv+siw2O6FK
	 emF+juxAjATy0MRyyWfLEI4xzG3DQExrkWwCE/YmMDTPBBRIKCgg4CGwC4mHe1p5hN
	 k0HSe5u6rvyRFOtfxkxBEVMPh+YCv0hvu5oJ/ip4pK76CYgiqDuI8WX4T7zoACW4ip
	 f6322HkPc6hciVTPfxKNcDftCJnZonRHFtzxzxy6oPrHJSrQyKkfGZ0s4DMPeYkDNv
	 t6icxYXnuY+qsqxyzovmxZOLNPWHSLatfPZnLB1dFXrJ+geSe92lq/6pJwfE8niDgY
	 OGmoeZz6u7Lbw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
In-Reply-To: <8733zx55i1.fsf@t14s.mail-host-address-is-not-set>
References: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
 <4EYpvxiPLRBBb2fUI9n8ZrVkve50KAvXwj7oFqoYhtpIuY_U7eVtiwnjA-ZR8n7jCwoJL67EI1ex2_DmBs5UMg==@protonmail.internalid>
 <aZLZbN5C3wXgt3kL@google.com>
 <875x7xdjvr.fsf@t14s.mail-host-address-is-not-set>
 <aZL-09Wk-KrDrroy@google.com>
 <edX-2eKbEyxxHPE4iAz6_QOunvlvPdtIDaR0dbj7h40wJ4YAgtoTnyNVEN2MzXcGwBtnqfpkuodzBLt9pnkLpg==@protonmail.internalid>
 <aZMA_3CBEnV1Sg68@google.com>
 <87zf58ddad.fsf@t14s.mail-host-address-is-not-set>
 <875x4t58de.fsf@t14s.mail-host-address-is-not-set>
 <h4gurHGM6lZkGzx9NFgQVCkQT026Cxjmr64B_bb1BaIeXgPV4UpBrPVf_VFeOTC0UfWtMhnFVNeXeLRedqZiow==@protonmail.internalid>
 <agLqaELzbof3YHKh@google.com>
 <8733zx55i1.fsf@t14s.mail-host-address-is-not-set>
Date: Tue, 12 May 2026 12:42:47 +0200
Message-ID: <87y0ho52oo.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "Alice Ryhl" <aliceryhl@google.com> writes:
>
>> On Tue, May 12, 2026 at 10:39:57AM +0200, Andreas Hindborg wrote:
>>> Andreas Hindborg <a.hindborg@kernel.org> writes:
>>>
>>> > "Alice Ryhl" <aliceryhl@google.com> writes:
>>> >
>>> >> On Mon, Feb 16, 2026 at 11:26:11AM +0000, Alice Ryhl wrote:
>>> >>> On Mon, Feb 16, 2026 at 12:10:16PM +0100, Andreas Hindborg wrote:
>>> >>> > "Alice Ryhl" <aliceryhl@google.com> writes:
>>> >>> >
>>> >>> > > On Sun, Feb 15, 2026 at 09:27:17PM +0100, Andreas Hindborg wrote:
>>> >>> > >> Add methods to get a reference to the contained value or populate the
>>> >>> > >> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
>>> >>> > >> directly, while `as_ref_or_populate_with` accepts a fallible closure,
>>> >>> > >> allowing for lazy initialization that may fail. Both methods spin-wait
>>> >>> > >> if another thread is concurrently initializing the container.
>>> >>> > >>
>>> >>> > >> Also add `populate_with` which takes a fallible closure and serves as
>>> >>> > >> the implementation basis for the other populate methods.
>>> >>> > >>
>>> >>> > >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> >>> > >
>>> >>> > >> +    /// Get a reference to the contained object, or populate the [`SetOnce`]
>>> >>> > >> +    /// with the value returned by `callable` and return a reference to that
>>> >>> > >> +    /// object.
>>> >>> > >> +    pub fn as_ref_or_populate_with(&self, callable: impl FnOnce() -> Result<T>) -> Result<&T> {
>>> >>> > >> +        if !self.populate_with(callable)? {
>>> >>> > >> +            while self.init.load(Acquire) != 2 {
>>> >>> > >> +                core::hint::spin_loop();
>>> >>> > >> +            }
>>> >>> > >
>>> >>> > > We should not be implementing our own spinlocks.
>>> >>> >
>>> >>> > That is a great proverb. I'd be happy to receive a suggestion on an
>>> >>> > alternate approach for this particular context.
>>> >>>
>>> >>> You can add a spinlock to SetOnce. Like I mentioned previously [1],
>>> >>> support for waiting will require the addition of extra fields.
>>> >
>>> > Thanks, I'll be sure to take a look again.
>>>
>>> I took a look at this again. I think the structure will be less
>>> efficient if we use a spin lock.
>>>
>>> Initialization is now
>>>  - cmpxchg lock relaxed
>>>  - store pointer
>>>  - store lock release
>>>
>>> With a spin lock it will be
>>>  - lock acquire
>>>  - test pointer
>>>  - store pointer
>>>  - lock release
>>>
>>> All the other tests for initialization is now:
>>>  - load lock acquire
>>>  - load pointer
>>>
>>> They will become
>>>  - lock acquire
>>>  - load pointer
>>>  - test pointer
>>>  - lock release
>>>
>>>
>>> bit_spinlock does not make this any better. It just gives us 64 locks in
>>> a u64. It does not help us store state of the data structure
>>> (empty/populated).
>>>
>>> Do we want a less efficient data structure in order to gain benefits of
>>> lockdep and friends?
>>
>> I'm not just talking about lockdep. Your current implementation is wrong
>> in several other ways, for example:
>>
>> 1. Spinlocks must disable preemption.
>
> That is an easy fix.
>
>> 2. It doesn't fall back to a mutex under PREEMPT_RT.
>
> I don't know how to solve that, but I'm sure there is a way.
>
>>
>> And probably lots of other things. By using the kernel spinlock, you do
>> not have to worry about the long list of things spinlocks have to get
>> right.
>
> Nah, can't be that many things. But I get your point.

So, when messing around with this `SpinLock` business, I run into a
problem. `SetOnce::new` is `const` and has to be for the use in
`module_param` as well as for the use I have in `rnull` where I use
`SetOnce` in global scope:

  static SHARED_TAG_SET: SetOnce<Arc<TagSet<NullBlkDevice>>> = SetOnce::new();

I could use `global_lock` instead, but I'd rather not have the unsafe
initializer in my driver.

We could split `SetOnce` and `OnceLock` as you have previously
suggested, but that would still require some kind of unsafe to
initialize a global `OnceLock`.

Based on these observations, I think I should either drop this patch
entirely and use `global_lock!`, which I'd rather not, or we should find
a way to open code the spin lock in a way that is compatible with the
kernel in general.

We could yank the spinning functionality out of `SetOnce` into `Atomic`.
An `Atomic` with the ability to spin until a certain value is observed
could be a nice primitive. Or it could spin until a `Fn(T) -> bool` on
the observed value returns true.

Any alternatives?


Best regards,
Andreas Hindborg


