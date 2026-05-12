Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82C6397688
	for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575988; cv=none; b=dTIVw4u3TfIIoBUPol9g/h/PPGI4DTELNcSa/Nr8uQotjPIJ3h5tVg5m/lA/AnXt0xTS/qGrHg4X+DUwgPnkSCSfkpNWiLqrhlKYLYeUodsdYKBzpJxjwBcpc65f1ZeERx8cEaYx8l1MINppwjXycEVThjuG6SEZQSJbPK2ppdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575988; c=relaxed/simple;
	bh=Y8co4DzKpKVsidwxlUKxWRFteBvS7TnetH5loa/biaQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PXCcgslh11AlVVtqcVCuqTxiyiSi5RUJCDcc2890G19SEPcEsy/M3oX2JUwjBS1/xQRcgHsh55DB1wCORjFdioFpyn1DwGRAoA3kmJf6vSLyEsJq0jpJbFIoWrnTtXkPzXF8A7pDO1w0cpmwfnkdhCKnqKxz99vvcBKNleUp2No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rY2L2hge; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rY2L2hge"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48d144d3428so30421235e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 01:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778575977; x=1779180777; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KgwY2f6esu7sSOrkTISRP1TQfyv6AQSdJGEvW85B+O8=;
        b=rY2L2hgexCsQuuq/qROkGTFzo/n3tMMHsZcWGeGkthg56NCfUN7J55o+g3+PcyJxSq
         wqhbovbmgnF2ASY8byHEifcYTk19Z7fx2PG/PU258cbW/vpXLmGZMO4guCO3i4rQGa3M
         TTW2kTmZ0/Bhhx90vO9bZikJhFKNQfAqdFDmkxDY3TJ7pULd2/a594mBHxXlH+D3zXu8
         2jAUprAwlxKTvmN53bshFwkL2eXE++dnFxg5SskGz0zumeozd0rj1Jf2TxxcMDMdEukB
         e7zLV4/KbLswFUAkRzlkRH08Wjwfz3BWN5lfDkjKsAG2AilSpvhsGKmoeM4f4PXoB/T/
         bFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778575977; x=1779180777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgwY2f6esu7sSOrkTISRP1TQfyv6AQSdJGEvW85B+O8=;
        b=J6v+OwiypvXgRl9nNPyxT88KaQR54shs6QLSzf912khadF6kQfLbBim8KmS5/NuO2x
         /mWC13ZdrDdwHaFiYvgAnRLTf1Wi9DZFx9WWjEdh2aEu0qpWOLbzSUM/B1qboDlfeSJw
         AfsywnsAitqkojkp25uic4iCQWfg9osv0Qmlbqls5cJLYyD8SDYfWm7s/pLSXyI+WDFx
         3PZ7LQnBiNp4uGoMpXvhbI0xULzmRIYWnRF5ZpkuDDgz9YY99AC8HnrHN9jSt9I8aqDg
         IAAkba4ldHNffOGSXUaAz7tmHOPwYWD5TeYcrq8ki3MB+GItyl4sJA7VM65u7ORXQXL1
         W4Gg==
X-Forwarded-Encrypted: i=1; AFNElJ9KGZ2LLUeX9+jbnL5JtVOOD9lkZuzT4cDMQgKWRWhc6RvaT8W7nkr8OyUSypkJuLyL2QklX8WokEYvZtNPQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynl1Gyjj7NHG/DcLrHVsIpEDHjY1YFqmH4/1vKVLQ2Utp5xhsf
	iB85ojwRAdlDky7TTmPmswpNxvOfC0xX8lHpupO6+5JKuttNfpp2NDg42BV9iTLY2j98rnZn70p
	z5m59euP5FMSWlOgPwQ==
X-Received: from wmbdn18.prod.google.com ([2002:a05:600c:6552:b0:489:1f67:5a81])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6299:b0:489:1f97:6b1d with SMTP id 5b1f17b1804b1-48e706edd0dmr213129865e9.28.1778575977248;
 Tue, 12 May 2026 01:52:57 -0700 (PDT)
Date: Tue, 12 May 2026 08:52:56 +0000
In-Reply-To: <875x4t58de.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
 <4EYpvxiPLRBBb2fUI9n8ZrVkve50KAvXwj7oFqoYhtpIuY_U7eVtiwnjA-ZR8n7jCwoJL67EI1ex2_DmBs5UMg==@protonmail.internalid>
 <aZLZbN5C3wXgt3kL@google.com> <875x7xdjvr.fsf@t14s.mail-host-address-is-not-set>
 <aZL-09Wk-KrDrroy@google.com> <edX-2eKbEyxxHPE4iAz6_QOunvlvPdtIDaR0dbj7h40wJ4YAgtoTnyNVEN2MzXcGwBtnqfpkuodzBLt9pnkLpg==@protonmail.internalid>
 <aZMA_3CBEnV1Sg68@google.com> <87zf58ddad.fsf@t14s.mail-host-address-is-not-set>
 <875x4t58de.fsf@t14s.mail-host-address-is-not-set>
Message-ID: <agLqaELzbof3YHKh@google.com>
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 12, 2026 at 10:39:57AM +0200, Andreas Hindborg wrote:
> Andreas Hindborg <a.hindborg@kernel.org> writes:
> 
> > "Alice Ryhl" <aliceryhl@google.com> writes:
> >
> >> On Mon, Feb 16, 2026 at 11:26:11AM +0000, Alice Ryhl wrote:
> >>> On Mon, Feb 16, 2026 at 12:10:16PM +0100, Andreas Hindborg wrote:
> >>> > "Alice Ryhl" <aliceryhl@google.com> writes:
> >>> >
> >>> > > On Sun, Feb 15, 2026 at 09:27:17PM +0100, Andreas Hindborg wrote:
> >>> > >> Add methods to get a reference to the contained value or populate the
> >>> > >> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
> >>> > >> directly, while `as_ref_or_populate_with` accepts a fallible closure,
> >>> > >> allowing for lazy initialization that may fail. Both methods spin-wait
> >>> > >> if another thread is concurrently initializing the container.
> >>> > >>
> >>> > >> Also add `populate_with` which takes a fallible closure and serves as
> >>> > >> the implementation basis for the other populate methods.
> >>> > >>
> >>> > >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >>> > >
> >>> > >> +    /// Get a reference to the contained object, or populate the [`SetOnce`]
> >>> > >> +    /// with the value returned by `callable` and return a reference to that
> >>> > >> +    /// object.
> >>> > >> +    pub fn as_ref_or_populate_with(&self, callable: impl FnOnce() -> Result<T>) -> Result<&T> {
> >>> > >> +        if !self.populate_with(callable)? {
> >>> > >> +            while self.init.load(Acquire) != 2 {
> >>> > >> +                core::hint::spin_loop();
> >>> > >> +            }
> >>> > >
> >>> > > We should not be implementing our own spinlocks.
> >>> >
> >>> > That is a great proverb. I'd be happy to receive a suggestion on an
> >>> > alternate approach for this particular context.
> >>>
> >>> You can add a spinlock to SetOnce. Like I mentioned previously [1],
> >>> support for waiting will require the addition of extra fields.
> >
> > Thanks, I'll be sure to take a look again.
> 
> I took a look at this again. I think the structure will be less
> efficient if we use a spin lock.
> 
> Initialization is now
>  - cmpxchg lock relaxed
>  - store pointer
>  - store lock release
> 
> With a spin lock it will be
>  - lock acquire
>  - test pointer
>  - store pointer
>  - lock release
> 
> All the other tests for initialization is now:
>  - load lock acquire
>  - load pointer
> 
> They will become
>  - lock acquire
>  - load pointer
>  - test pointer
>  - lock release
> 
> 
> bit_spinlock does not make this any better. It just gives us 64 locks in
> a u64. It does not help us store state of the data structure
> (empty/populated).
> 
> Do we want a less efficient data structure in order to gain benefits of
> lockdep and friends?

I'm not just talking about lockdep. Your current implementation is wrong
in several other ways, for example:

1. Spinlocks must disable preemption.
2. It doesn't fall back to a mutex under PREEMPT_RT.

And probably lots of other things. By using the kernel spinlock, you do
not have to worry about the long list of things spinlocks have to get
right.

> >> By the way, back then I suggested renaming it from OnceLock to SetOnce
> >> because you did not support waiting for the value to be populated, and
> >> you said you didn't need that. If you add that feature, then we should
> >> rename it back to OnceLock, or create a new type OnceLock for users who
> >> need that additional feature.
> >
> > That is fair. This is a different use case than the original one though.
> > I think we should keep this as one type for code reuse, but I am fine
> > with renaming to something that describe the usage better.
> 
> Please note that even though it could be added, we do not have a `wait`
> method now. What we have are blocking initializers.

You may have open-coded `wait` inside of `as_ref_or_populate_with`, but
you still have the functionality.

Alice

> I personally have no opinion on the name. Is everyone in favor of
> renaming to OnceLock?
> 
> 
> Best regards,
> Andreas Hindborg
> 
> 
