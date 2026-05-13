Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A724636F919;
	Wed, 13 May 2026 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778664549; cv=none; b=ixKXOp/gijVTY9qJZa6d6+eeP+Mv1aWDpzfSxEkv6Z8m62LjT9/T3i7syCWbc9K2H2tqUydDeTH/MWEzzVtmhP0+oAc3ZsmZ0QTyAOTIyFsqcqV2IpGRoEhAFD0XQjHdvOd5qdb+MB5o27+xS+sh54jgd2XjrBPjwdnU/ThYvX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778664549; c=relaxed/simple;
	bh=g1C9HOeAHKMSrUQ33ByL7spRKxCDsVPwPRNjRrnM2WA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X5ACm+vxO+a/Ie8g5hBzeJRhV+nK8eeLMANKwUlCzzga400v6EODZRTvTNvf55mxBPXLEHsy3dTgxF+eb+Qy0gKjnH87F3M+bX6c8U3ZFcu5ke/uYpq4bviwaS9/oAx2GjoQBjbvsHbj0f1p+JULIuh1v2Y7HeyxxiYLFl/pwbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvA3DcQX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvA3DcQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFABFC2BCB7;
	Wed, 13 May 2026 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778664549;
	bh=g1C9HOeAHKMSrUQ33ByL7spRKxCDsVPwPRNjRrnM2WA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lvA3DcQXxFU08kbZfl0LfKIC0ftdEG9Q4SHsqGS5kTFbjcT+mA7uImTypTfxq9hpA
	 XPRmW0JEjFpmgYI3jKnFj5XEp//gMMkNjjkQXMAmTRVYvjj6rtL/hwmVvhoRmANruH
	 sHPVDyJVwhQWMFJ/RCTSvUHpxFePxckOsQvKoeQ/FaD1bColK57VXAgx3G51PfUpzr
	 XfULZKQ1dXsfC4lNMi4+L5wI0JaXAd7bRtnzxoezEaCzpxUoyeFb+xGuB/6qBmF9HY
	 QA6p1D3OUnsYz3295eO5prJk9OmVMRDCI1JJm61SUpOwbhS8Xl/nGOipjp/xSOCNNE
	 H6zAp1Y0Msjkg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
In-Reply-To: <agQsnMD9C8XyuwKX@google.com>
References: <875x7xdjvr.fsf@t14s.mail-host-address-is-not-set>
 <aZL-09Wk-KrDrroy@google.com>
 <edX-2eKbEyxxHPE4iAz6_QOunvlvPdtIDaR0dbj7h40wJ4YAgtoTnyNVEN2MzXcGwBtnqfpkuodzBLt9pnkLpg==@protonmail.internalid>
 <aZMA_3CBEnV1Sg68@google.com>
 <87zf58ddad.fsf@t14s.mail-host-address-is-not-set>
 <875x4t58de.fsf@t14s.mail-host-address-is-not-set>
 <h4gurHGM6lZkGzx9NFgQVCkQT026Cxjmr64B_bb1BaIeXgPV4UpBrPVf_VFeOTC0UfWtMhnFVNeXeLRedqZiow==@protonmail.internalid>
 <agLqaELzbof3YHKh@google.com>
 <8733zx55i1.fsf@t14s.mail-host-address-is-not-set>
 <87y0ho52oo.fsf@t14s.mail-host-address-is-not-set>
 <PDmjv36F69EbeOwIhi_vGuatYaOdq_m4JCmRxCFmOofXel4e2hDlhz6ZDRL1u8WUhMrGnBL6WLzScziowJBITQ==@protonmail.internalid>
 <agQsnMD9C8XyuwKX@google.com>
Date: Wed, 13 May 2026 11:29:01 +0200
Message-ID: <87v7cr4q02.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Tue, May 12, 2026 at 12:42:47PM +0200, Andreas Hindborg wrote:
>> Andreas Hindborg <a.hindborg@kernel.org> writes:
>>
>> > "Alice Ryhl" <aliceryhl@google.com> writes:
>> >
>> >> On Tue, May 12, 2026 at 10:39:57AM +0200, Andreas Hindborg wrote:
>> >>> Andreas Hindborg <a.hindborg@kernel.org> writes:
>> >>>
>> >>> > "Alice Ryhl" <aliceryhl@google.com> writes:
>> >>> >
>> >>> >> On Mon, Feb 16, 2026 at 11:26:11AM +0000, Alice Ryhl wrote:
>> >>> >>> On Mon, Feb 16, 2026 at 12:10:16PM +0100, Andreas Hindborg wrote:
>> >>> >>> > "Alice Ryhl" <aliceryhl@google.com> writes:
>> >>> >>> >
>> >>> >>> > > On Sun, Feb 15, 2026 at 09:27:17PM +0100, Andreas Hindborg wrote:
>> >>> >>> > >> Add methods to get a reference to the contained value or populate the
>> >>> >>> > >> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
>> >>> >>> > >> directly, while `as_ref_or_populate_with` accepts a fallible closure,
>> >>> >>> > >> allowing for lazy initialization that may fail. Both methods spin-wait
>> >>> >>> > >> if another thread is concurrently initializing the container.
>> >>> >>> > >>
>> >>> >>> > >> Also add `populate_with` which takes a fallible closure and serves as
>> >>> >>> > >> the implementation basis for the other populate methods.
>> >>> >>> > >>
>> >>> >>> > >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >>> >>> > >
>> >>> >>> > >> +    /// Get a reference to the contained object, or populate the [`SetOnce`]
>> >>> >>> > >> +    /// with the value returned by `callable` and return a reference to that
>> >>> >>> > >> +    /// object.
>> >>> >>> > >> +    pub fn as_ref_or_populate_with(&self, callable: impl FnOnce() -> Result<T>) -> Result<&T> {
>> >>> >>> > >> +        if !self.populate_with(callable)? {
>> >>> >>> > >> +            while self.init.load(Acquire) != 2 {
>> >>> >>> > >> +                core::hint::spin_loop();
>> >>> >>> > >> +            }
>> >>> >>> > >
>> >>> >>> > > We should not be implementing our own spinlocks.
>> >>> >>> >
>> >>> >>> > That is a great proverb. I'd be happy to receive a suggestion on an
>> >>> >>> > alternate approach for this particular context.
>> >>> >>>
>> >>> >>> You can add a spinlock to SetOnce. Like I mentioned previously [1],
>> >>> >>> support for waiting will require the addition of extra fields.
>> >>> >
>> >>> > Thanks, I'll be sure to take a look again.
>> >>>
>> >>> I took a look at this again. I think the structure will be less
>> >>> efficient if we use a spin lock.
>> >>>
>> >>> Initialization is now
>> >>>  - cmpxchg lock relaxed
>> >>>  - store pointer
>> >>>  - store lock release
>> >>>
>> >>> With a spin lock it will be
>> >>>  - lock acquire
>> >>>  - test pointer
>> >>>  - store pointer
>> >>>  - lock release
>> >>>
>> >>> All the other tests for initialization is now:
>> >>>  - load lock acquire
>> >>>  - load pointer
>> >>>
>> >>> They will become
>> >>>  - lock acquire
>> >>>  - load pointer
>> >>>  - test pointer
>> >>>  - lock release
>> >>>
>> >>>
>> >>> bit_spinlock does not make this any better. It just gives us 64 locks in
>> >>> a u64. It does not help us store state of the data structure
>> >>> (empty/populated).
>> >>>
>> >>> Do we want a less efficient data structure in order to gain benefits of
>> >>> lockdep and friends?
>> >>
>> >> I'm not just talking about lockdep. Your current implementation is wrong
>> >> in several other ways, for example:
>> >>
>> >> 1. Spinlocks must disable preemption.
>> >
>> > That is an easy fix.
>> >
>> >> 2. It doesn't fall back to a mutex under PREEMPT_RT.
>> >
>> > I don't know how to solve that, but I'm sure there is a way.
>> >
>> >>
>> >> And probably lots of other things. By using the kernel spinlock, you do
>> >> not have to worry about the long list of things spinlocks have to get
>> >> right.
>> >
>> > Nah, can't be that many things. But I get your point.
>
> And what about the quirks added to spinlocks in the future?
>
> I'm not willing to put my name on a manual spinlock implementation.
>
>> So, when messing around with this `SpinLock` business, I run into a
>> problem. `SetOnce::new` is `const` and has to be for the use in
>> `module_param` as well as for the use I have in `rnull` where I use
>> `SetOnce` in global scope:
>>
>>   static SHARED_TAG_SET: SetOnce<Arc<TagSet<NullBlkDevice>>> = SetOnce::new();
>>
>> I could use `global_lock` instead, but I'd rather not have the unsafe
>> initializer in my driver.
>>
>> We could split `SetOnce` and `OnceLock` as you have previously
>> suggested, but that would still require some kind of unsafe to
>> initialize a global `OnceLock`.
>>
>> Based on these observations, I think I should either drop this patch
>> entirely and use `global_lock!`, which I'd rather not, or we should find
>> a way to open code the spin lock in a way that is compatible with the
>> kernel in general.
>
> So it's true that putting synchronization primitives in global variables
> is a real problem we don't have amazing solutions to right now. There
> are various ways we can work around it. I came up with one workaround,
> which is a single unsafe block to ensure that the global is initialized
> in `init()`. You've come up with another workaround, which is a manual
> spinlock.
>
> My opinion is that the manual spinlock is far more problematic than the
> unsafe block.
>
> And I also think that as a principle we should avoid coming up with
> several different work-arounds for the same problem.
>
>> We could yank the spinning functionality out of `SetOnce` into `Atomic`.
>> An `Atomic` with the ability to spin until a certain value is observed
>> could be a nice primitive. Or it could spin until a `Fn(T) -> bool` on
>> the observed value returns true.
>>
>> Any alternatives?
>
> Why do you need waiting for SHARED_TAG_SET to begin with? If you make
> sure to initialize it as the very first thing in your module init, then
> all other uses can just `unwrap()` the `SetOnce` because you know the
> value is already there.

I guess I could just always initialize it. I'll do that for now and then
drop this patch.

My thought was that I did not want to initialize it at all, if it is not
going to be used. I think that is how the corresponding C code is
designed in the C null block driver.

I don't _need_ to build the Rust driver the same as the C one in this
particular case, but now it is annoying me slightly that we don't have a
safe way to implement similar logic.

I guess one option I could go for if I really want to lazy init with
safe code is to move the global out of global scope and into the module
struct. Then it can be initialized with a spin lock in it and I can have
something like `OnceLock`.

Best regards,
Andreas Hindborg


