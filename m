Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6C730C373
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Oct 2025 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761903131; cv=none; b=klm97b5COCw9rZ48HAa1GPCRBpMKuA+49fyKvCwGRVY1af0bY1kF5kcZ63YSauA2cMq+MbhVo6H+MsUi7Ek9/tpMxGijo5fCdDDQbFEpQubntEVUZFQqb9m9sX8BQ9WIt4nChQtHqlrBurPUm3eRG0vbxG3j8OUevYPSlnNaSsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761903131; c=relaxed/simple;
	bh=7MDgQC6YQkMTHiSUf+NQuriTH8gMZgALQRyrpDWav8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/uRccHLtYM2w+YIzMorKYtZwj2hr4drFgQuOyvJoGiv1hS1fMrzLTG8efbMGWk9jfPyZPypQN+m/fUjFuerUpOqv3F08QjDkGcgGD9VAk2H8Fp2L7r0x8s6QAl0JjoC74WZpz7R/RUUMpI+l1KXNBimJtPZaXfxuCXg9WeicUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T2MG73XF; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T2MG73XF"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-426fc536b5dso1268573f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Oct 2025 02:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761903128; x=1762507928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RslSawTiA9rDsaIKkA07wlfuV1PduegSYOZOF8JH0M=;
        b=T2MG73XF7tZlRE6vbMwJwez32eYdjf116yd3GfPT6egphKxRNBYryiEpfD1kCNPqFF
         Msa390wt30ih+ryRaF1PljZtgiUjbGyAUrUOtDGozKlt0SPE94dUak19QE8r1XjJ9tJP
         1Hjdqv1lOs8mKZvdRVi9OASAQxOqwl6y1QysZvGaaCI3bBC2ckgB0ELhUuspOqtqfpxa
         CEq/6VLRRNb/CmZdSfgXCICE6XOYCLg6cq8FEyxdHZ+uV90Y0oY6LuGSF24+rfg1Pxub
         Zjup68M/AS31DqlSzq5k6rB6ViPBVljAEeE4ZBl3kSoX1OzTmlR0W7GIBYS6KOdJeZhp
         NUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761903128; x=1762507928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RslSawTiA9rDsaIKkA07wlfuV1PduegSYOZOF8JH0M=;
        b=Kg1Ho2v2AfzHZJHY97tSrXHpgiiULlrNugg3Te/aaK6BEmdMV3dy1/en+b9ae561kP
         31eOiACS6/EjJapfcIRtXk2BxpjumamlQiJEx2FMuY1H8EvA+zSBNtrAGuxnCdbNDZ+1
         HcALIB3xCSgTkJG8ZkXQMVhkmXyHkJh0fzCf5zA/01RlY8Ct+g/OH3S9Sib4EDTyQ/C2
         jwcmNM7cmBCtv0LplLKXcO1G8WpAqGDl8EexWEu4K5DsQVEsKKoED3z24uyXDMF67QyZ
         k0Uymu40luJhxFK20lkk9E3bv52KkDXOTYPyYCgThzdVnL8U2wu1p+l6JjKZ9UI4Q8yA
         ozRA==
X-Forwarded-Encrypted: i=1; AJvYcCU+x4votSNGQj2unOBAlULXWvAFGMRTraiWFyeUYxFJzLfZ4j/Z0s1XBB3F5WWoQOmfu1nUZHhAhRWMa3d1sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZi1+b+O/Zp0gL/F2C2ziqwglM3gSSfFfklei5bG3tYZdnmQXi
	6Yyq03UcTj4H20vl1jut4yp2jAou6kajWWRO4XILmkeOUdijuP6ehV/ooY8mkeyRQ/viwoRD7fl
	2waw5ENF0MYoMztCRjMnmJUSTrtWDXhWIjLJmfzYr
X-Gm-Gg: ASbGncuIuEw4KSZHRFXxdlyn388n04ggTRiij8QOgDcozvssLd4mYYeEmu1eTCC4mxE
	8jF3Tdx9Om9Mm9oKOEuIrQXDOsQKL58VHDY0EpOO+AgD9kqmidJLcHsJcrRUuERhCr9/mWPfUnt
	dIV0SlgQTKyC4eyr2Rty0U3yXw8DfZGc2LRsxa4PrXnqnBFBuzZdQwy8Q6ywJLl39TNUxZptHcM
	NAjNxSAoLFpaFz1FEWdW6PxKVHGTWtUj4gsW+xqj0tMBmO4NprHpzjJAX0yReKhcVgw/VyTyec2
	duOgrtETuMns4rH37Sz7fdmpYw==
X-Google-Smtp-Source: AGHT+IE/UV/vTi/s32thL/cWYnnHUFWhAvh43fmoicl3MzgGOK99WIqVH97ELR7KohgrB+VH6IMCgIUkETXg3sn45lk=
X-Received: by 2002:a05:6000:4381:b0:427:45f:ee21 with SMTP id
 ffacd0b85a97d-429bd683f4bmr2420461f8f.27.1761903127736; Fri, 31 Oct 2025
 02:32:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029183538.226257-1-lyude@redhat.com> <c1ff48ea-53ca-40ea-9541-85abd1a528d0@redhat.com>
 <e0112480a6786c64fa65888b5ce8befbba72a230.camel@redhat.com>
In-Reply-To: <e0112480a6786c64fa65888b5ce8befbba72a230.camel@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 31 Oct 2025 10:31:55 +0100
X-Gm-Features: AWmQ_bkMgg2TYXHac5akbNYgRQ_r8IVs7J3FhWkFVFR2TItTmPGYFFkV8h0Phw0
Message-ID: <CAH5fLgiWceOs-VtDnFkx5EBxCbAnJ3cLkRwp9adQC7x9oJCDFQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: lock: Export Guard::do_unlocked()
To: Lyude Paul <lyude@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Benno Lossin <lossin@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 6:41=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> On Thu, 2025-10-30 at 11:43 +0100, Paolo Bonzini wrote:
> > On 10/29/25 19:35, Lyude Paul wrote:
> > > +    /// // Since we hold work.lock, which work will also try to acqu=
ire in WorkItem::run. Dropping
> > > +    /// // the lock temporarily while we wait for completion works a=
round this.
> > > +    /// g.do_unlocked(|| work.done.wait_for_completion());
> > > +    ///
> > > +    /// assert_eq!(*g, 42);
> > > +    /// ```
> > > +    pub fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
> > >           // SAFETY: The caller owns the lock, so it is safe to unloc=
k it.
> > >           unsafe { B::unlock(self.lock.state.get(), &self.state) };
> >
> > Getting self as &mut is incorrect.  That's because owning a lock guard
> > implicitly tells you that no other thread can observe the intermediate
> > states of the object.  (The same is even more obviously true for a
> > RefCell's mutable borrow, i.e. core::cell::RefMut)
> >
> > Let's say you have a lock-protected data structure with an invariant
> > that is preserved at the end of every critical section.  Let's say also
> > that you have a function
> >
> >      fn do_something() {
> >          let g =3D self.inner.lock();
> >          g.mess_up_the_invariant();          // (1)
> >          self.do_something_else(&mut g);     // uses do_unlocked()
> >          g.fix_the_invariant();              // (2)
> >      }
> >
> > Because the function holds a guard between the calls (1) and (2), it
> > expects that other thread cannot observe the temporary state.  The fact
> > that do_unlocked() takes a &mut doesn't help, because the common case
> > for RAII objects is that they're passed around mutably.
> >
> > Instead, do_unlocked should take the guard and return another one:
> >
> >      fn do_something() {
> >          let mut g =3D self.inner.lock();
> >          g.mess_up_the_invariant();          // (1)
> >          g =3D self.do_something_else(g);      // uses do_unlocked()
> >          g.fix_the_invariant();              // (2)
> >      }
> >
> > This version of the interface makes it clear that (1) and (2) are in a
> > separate critical section.  Unfortunately it makes the signature uglier
> > for do_unlocked() itself:
> >
> >      #[must_use]
> >      pub fn do_unlocked<U>(self, cb: impl FnOnce() -> U) -> (Self, U)
>
> Hm, it seems then that we should probably fix this before exporting it th=
en!
> Thank you for pointing this out, I'll fix it in the next respin.

I do agree that this behavior has a lot of potential to surprise
users, but I don't think it's incorrect per se. It was done
intentionally for Condvar, and it's not unsound. Just surprising.

Of course, that doesn't mean we can't change it. Condvar could be
updated to use ownership in that way, and doing say may be a good
idea.

Alice
