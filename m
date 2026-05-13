Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CE3374E5A
	for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 07:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658464; cv=none; b=qOpVWjmEP/0I3Q68ZpxCF4by41qbM3OFn/MJGvKwLkS3wy9TIh82+GxH0L1sNWd3UkTLfMjauvOruSfQ43vQURlxiZB/9kwImpoVnrRpFy9CjUepm8njCVrsE+LdGnOF4NvBOy7BZ4f2NJ8H5J1UWz/8QOqXxNKs9z/gzQUGxaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658464; c=relaxed/simple;
	bh=//Xe9kgExrT5cq19NdsjwVeZXjzX2n4u9z7FKWkdJ80=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AhrmDmt/1xX+QMkyFXqc1HGdWG2420AMwbxudREtSBS9Nq3y34LkXtHovBY3Atghc4ludjiEQjggeiwQwQD74WnGSHwfr/TVpjV3cet7xsUoV0YKbCvNdemDlzsfu0ruqjEoHQwVDzczEIKoCBFIx+HkyRJJw4Ln8TxN0idczNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fmn4WdL0; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fmn4WdL0"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43d789cebcfso5250215f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 00:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778658461; x=1779263261; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O4bxz24UyahmaQAEO3v5MM8gb6uCYN9e45G9qLPFIis=;
        b=fmn4WdL00iAH7p1vTcpiXgmwZ6NnIEZmlsfO+tr1kzkcopD5av1dQUqekVGqksPMFQ
         L6IeovmB2taytsDIiB3G52Aw/rHxP9GYA+YvVHDV/0Iz0MCGetNUt151e+9lb6XzFBUw
         w7T53cs16N9FStSiuoia+muP1N4NDKjbXNHk10o2jhf38QQAsh/aaM2MXQJgUlpHIYAi
         B/PFLOrmQ4EUJf2hg0hAEv9bbmzMy+p/QdGRdvXNnDdmt9q85yHkY8jqDBfAfAlBF4/k
         +7XigL4/nTrL5jDWRUqy4rX6XbbrJ8lK9dRYCfFiOZRpOCvO7yTxBRPY9orAwLRfOQmi
         Ze1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778658461; x=1779263261;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O4bxz24UyahmaQAEO3v5MM8gb6uCYN9e45G9qLPFIis=;
        b=fbI+OCN9OwwoWOecibu/Cw7dd1llQ2ewlrSHPqqKBThFx8pWLZs+q/CieQ2M8aJ7JR
         5pRPQ6W/CHQtSsq9YtBmcmazLeHHV4B7fDMQS69XN/MUjYTo6aVVg5BHlXoYIILwA8Xl
         Wamd40D6ROT9R9/CGKrBEbaebZzjH/Da/NvhqEa+rXL733cudfGxA6OmhGjlAHCrmxw8
         w36NxY4UHh/fsuF8eeHnUSbIodhvubNCuOXpeCxLBor9Lg+pxqN+2TmGKYS6fdlfXF+i
         4+/Ze6zEIu9yUN4Sn9YPP4V1RbkwGhmruFU6uydPkHpihbyAqMNrgSzd41bW9pETnU8a
         yt5g==
X-Forwarded-Encrypted: i=1; AFNElJ8Vpyn+mH1tjAvOCxXe+g4GzhvmNrtAPMDYBF9gW5N+0SIbR6I6QUxIULduKl+2UMUl5ZwsM04lPbopb/n++Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YznTWDm3/pKA0eYaXSpN9KDcbihXPruf/oqPZtl0aVhOwEA/pGA
	mLgozBew3ZyD1lQQ8chLHVJarVztjC3vibOEoNlPM8j/66knPTLG22ywhei+Fio1Jb8YQhsLhZh
	/PDdFBrtiuJY+weWjYg==
X-Received: from wmf5.prod.google.com ([2002:a05:600c:2285:b0:489:699:b86e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:474a:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-48fc995fae0mr31690905e9.13.1778658460860;
 Wed, 13 May 2026 00:47:40 -0700 (PDT)
Date: Wed, 13 May 2026 07:47:40 +0000
In-Reply-To: <87y0ho52oo.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <875x7xdjvr.fsf@t14s.mail-host-address-is-not-set>
 <aZL-09Wk-KrDrroy@google.com> <edX-2eKbEyxxHPE4iAz6_QOunvlvPdtIDaR0dbj7h40wJ4YAgtoTnyNVEN2MzXcGwBtnqfpkuodzBLt9pnkLpg==@protonmail.internalid>
 <aZMA_3CBEnV1Sg68@google.com> <87zf58ddad.fsf@t14s.mail-host-address-is-not-set>
 <875x4t58de.fsf@t14s.mail-host-address-is-not-set> <h4gurHGM6lZkGzx9NFgQVCkQT026Cxjmr64B_bb1BaIeXgPV4UpBrPVf_VFeOTC0UfWtMhnFVNeXeLRedqZiow==@protonmail.internalid>
 <agLqaELzbof3YHKh@google.com> <8733zx55i1.fsf@t14s.mail-host-address-is-not-set>
 <87y0ho52oo.fsf@t14s.mail-host-address-is-not-set>
Message-ID: <agQsnMD9C8XyuwKX@google.com>
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 12, 2026 at 12:42:47PM +0200, Andreas Hindborg wrote:
> Andreas Hindborg <a.hindborg@kernel.org> writes:
> 
> > "Alice Ryhl" <aliceryhl@google.com> writes:
> >
> >> On Tue, May 12, 2026 at 10:39:57AM +0200, Andreas Hindborg wrote:
> >>> Andreas Hindborg <a.hindborg@kernel.org> writes:
> >>>
> >>> > "Alice Ryhl" <aliceryhl@google.com> writes:
> >>> >
> >>> >> On Mon, Feb 16, 2026 at 11:26:11AM +0000, Alice Ryhl wrote:
> >>> >>> On Mon, Feb 16, 2026 at 12:10:16PM +0100, Andreas Hindborg wrote:
> >>> >>> > "Alice Ryhl" <aliceryhl@google.com> writes:
> >>> >>> >
> >>> >>> > > On Sun, Feb 15, 2026 at 09:27:17PM +0100, Andreas Hindborg wrote:
> >>> >>> > >> Add methods to get a reference to the contained value or populate the
> >>> >>> > >> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
> >>> >>> > >> directly, while `as_ref_or_populate_with` accepts a fallible closure,
> >>> >>> > >> allowing for lazy initialization that may fail. Both methods spin-wait
> >>> >>> > >> if another thread is concurrently initializing the container.
> >>> >>> > >>
> >>> >>> > >> Also add `populate_with` which takes a fallible closure and serves as
> >>> >>> > >> the implementation basis for the other populate methods.
> >>> >>> > >>
> >>> >>> > >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >>> >>> > >
> >>> >>> > >> +    /// Get a reference to the contained object, or populate the [`SetOnce`]
> >>> >>> > >> +    /// with the value returned by `callable` and return a reference to that
> >>> >>> > >> +    /// object.
> >>> >>> > >> +    pub fn as_ref_or_populate_with(&self, callable: impl FnOnce() -> Result<T>) -> Result<&T> {
> >>> >>> > >> +        if !self.populate_with(callable)? {
> >>> >>> > >> +            while self.init.load(Acquire) != 2 {
> >>> >>> > >> +                core::hint::spin_loop();
> >>> >>> > >> +            }
> >>> >>> > >
> >>> >>> > > We should not be implementing our own spinlocks.
> >>> >>> >
> >>> >>> > That is a great proverb. I'd be happy to receive a suggestion on an
> >>> >>> > alternate approach for this particular context.
> >>> >>>
> >>> >>> You can add a spinlock to SetOnce. Like I mentioned previously [1],
> >>> >>> support for waiting will require the addition of extra fields.
> >>> >
> >>> > Thanks, I'll be sure to take a look again.
> >>>
> >>> I took a look at this again. I think the structure will be less
> >>> efficient if we use a spin lock.
> >>>
> >>> Initialization is now
> >>>  - cmpxchg lock relaxed
> >>>  - store pointer
> >>>  - store lock release
> >>>
> >>> With a spin lock it will be
> >>>  - lock acquire
> >>>  - test pointer
> >>>  - store pointer
> >>>  - lock release
> >>>
> >>> All the other tests for initialization is now:
> >>>  - load lock acquire
> >>>  - load pointer
> >>>
> >>> They will become
> >>>  - lock acquire
> >>>  - load pointer
> >>>  - test pointer
> >>>  - lock release
> >>>
> >>>
> >>> bit_spinlock does not make this any better. It just gives us 64 locks in
> >>> a u64. It does not help us store state of the data structure
> >>> (empty/populated).
> >>>
> >>> Do we want a less efficient data structure in order to gain benefits of
> >>> lockdep and friends?
> >>
> >> I'm not just talking about lockdep. Your current implementation is wrong
> >> in several other ways, for example:
> >>
> >> 1. Spinlocks must disable preemption.
> >
> > That is an easy fix.
> >
> >> 2. It doesn't fall back to a mutex under PREEMPT_RT.
> >
> > I don't know how to solve that, but I'm sure there is a way.
> >
> >>
> >> And probably lots of other things. By using the kernel spinlock, you do
> >> not have to worry about the long list of things spinlocks have to get
> >> right.
> >
> > Nah, can't be that many things. But I get your point.

And what about the quirks added to spinlocks in the future?

I'm not willing to put my name on a manual spinlock implementation.

> So, when messing around with this `SpinLock` business, I run into a
> problem. `SetOnce::new` is `const` and has to be for the use in
> `module_param` as well as for the use I have in `rnull` where I use
> `SetOnce` in global scope:
> 
>   static SHARED_TAG_SET: SetOnce<Arc<TagSet<NullBlkDevice>>> = SetOnce::new();
> 
> I could use `global_lock` instead, but I'd rather not have the unsafe
> initializer in my driver.
> 
> We could split `SetOnce` and `OnceLock` as you have previously
> suggested, but that would still require some kind of unsafe to
> initialize a global `OnceLock`.
> 
> Based on these observations, I think I should either drop this patch
> entirely and use `global_lock!`, which I'd rather not, or we should find
> a way to open code the spin lock in a way that is compatible with the
> kernel in general.

So it's true that putting synchronization primitives in global variables
is a real problem we don't have amazing solutions to right now. There
are various ways we can work around it. I came up with one workaround,
which is a single unsafe block to ensure that the global is initialized
in `init()`. You've come up with another workaround, which is a manual
spinlock.

My opinion is that the manual spinlock is far more problematic than the
unsafe block.

And I also think that as a principle we should avoid coming up with
several different work-arounds for the same problem.

> We could yank the spinning functionality out of `SetOnce` into `Atomic`.
> An `Atomic` with the ability to spin until a certain value is observed
> could be a nice primitive. Or it could spin until a `Fn(T) -> bool` on
> the observed value returns true.
> 
> Any alternatives?

Why do you need waiting for SHARED_TAG_SET to begin with? If you make
sure to initialize it as the very first thing in your module init, then
all other uses can just `unwrap()` the `SetOnce` because you know the
value is already there.

Alice
