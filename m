Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4405F2BE04D
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 20:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752696725; cv=none; b=dZbX/vVtNWS9ba3l9M/cgd397j17ev9Q2oY+jhbgtfbxk9ESzAUxDEDH6BXEdTvsn5xWSnO6cXkqAh3rSV2tBPkAXDQEoOnRsOjDmBkNjlCA/fuIZP4X0xelwcnjEaraPW6RNmiohxkbWpNL5Fr/lpbkOmmFMkT1UT+BlqEYE/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752696725; c=relaxed/simple;
	bh=YlvdcJp3JJip5BkmEMaC0OZOtG+DOOiozRI/czCgQ0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TvKZ0/a8F1BgOd2WYyfwxgTqJC3BNpqpZRh4p2IjP5c1j1wM4RSQ3+XV+i9wE6mLlTCrP8E2mi0Kg+JAj58vomaRrNR002ZM4TpV0JPaVlYBcMrDowhtJrCljWIR6I6lRXCeJw0iW7m0ZXn6MCmQIS9lnP4rEMk/hB8QtPqGZn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9v5IcjW; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9v5IcjW"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-60d666804ebso676580eaf.1
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 13:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752696723; x=1753301523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fOuszaQr9CL9eUMJdejd3ksjD49N9Pv+PwPZ2WVlkU=;
        b=G9v5IcjWYc4jKuO+gtxkfibhCnv6a9+LW6/3o9GnncMbhTbz61X/1U0wLQF5xC4RT/
         cpgEHi8wdRMz5SAe5zh9utM2oNBkRGMD4w/cfljiBVokONRBBWOH86PQOJpbF+vXEC5+
         //vR3Yul52TN8Ch0Uvpb4xybej8ScUNASJ6JjkNQoOMMbSF+Wia4OHJVFzS1lMigIgDm
         BGsm8t3dFg4cx6HTTejEm0ByuCBe+dwuxHJxlXx/tYB4ghFKYUvyfCSUAVKnDPiWLc1Y
         bNnPsplecRmTpDbVa+jYmk/LfoSKT8t0pEC1MgCBMcdVo8vSliJWN93OY7rsPJly6TUq
         waog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696723; x=1753301523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fOuszaQr9CL9eUMJdejd3ksjD49N9Pv+PwPZ2WVlkU=;
        b=KD8Gp54HuOPanMDolmrXZ+IPpClrrNXEZ0K9yacZQ5Sg24VRB6X0Z//64NkbMd+gXZ
         S082HO81Cxrgtlc9mQGsLaaVGJARr/NHGXqm+N8Zyk/WRK7e7ik5y+cmqGQ3jEqPDZq8
         gkTHEWPNfQE/qHKEwlyVq31jyV4JUvazIyYtw6vmYA3tZWSZggiV5zNnlmA+Z/OfncKP
         41uAiBUnPie1eCigg0KjPpXAftZm63hr9v3uS4a39GnKLTVqacCYb6gvZV/vhOjHDGBQ
         tVy3Hu75VxX1qCIsJ5iAHTnNXS6WE7BrtCbhyfMRoF5gNVWgbw1QVYuIcLc8ta7vf5Fw
         06iA==
X-Forwarded-Encrypted: i=1; AJvYcCUaMrIzZ4nTiXW+l7ogX9ez9corrsS+ycUWBBx4ehZGB5Z3UuedA9vqHQKo4BIoluPQvgJNIuUOimLOraH3mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQlBFf0DJ1LDbPe6tMg3yv9i8xvKseax76/W56s6FkWwtOSqTi
	lUI2AyOLsdYZwUiT91HtVMhiiYr9BKtiNWWNUyUon69nHi3mRy8l27twink29AVKjT8YmwE6nFp
	1dCqHeYWDHFmp6cmrXawWkrbvTgHv7Nc=
X-Gm-Gg: ASbGnctLrUvrxSTGdB7bNehELmHi0rwD6LhfQo7hbNeTaPTF0bFuBH9kvQNB7pLQfq2
	M39/GjzbanwslvKRIkt/RBGVj/koZjquyVCXLJzUHpgX2pFel2676LBkIw3Eps+A/MSH4ug5C2v
	SOUY0yiovjLwpRB7pPv+46B7IZy74/VNwTfHWx6JTlBtUbnb3hznA3SMmn6KXEzPCqW3UW5GHvz
	Pfq3jrR0w3tU8tsR5E=
X-Google-Smtp-Source: AGHT+IEQSHCRDUqox4A+3jgkR2kJo21sUHMgOxfS1zQtZ5MJOe0bPnRbW+HkB8TRuyaCmEV4t/fDzNnmzYfdLIoZTys=
X-Received: by 2002:a4a:ee17:0:b0:613:bd07:54cc with SMTP id
 006d021491bc7-615acb4ab78mr666388eaf.0.1752696723268; Wed, 16 Jul 2025
 13:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
 <20250708003428.76783-4-marcelomoreira1905@gmail.com> <DB6RKSNTHUZ8.DW0EBFDU6L1I@kernel.org>
 <CAPZ3m_h37mCRO7oZX3qLnc+iFNwUu_wgYqEu_r0g-gtOB0661w@mail.gmail.com>
 <DB9XM595UG4V.3N51HST2TFVW@kernel.org> <CAPZ3m_grA_T_ixfHs7Z44nf5je4ftBcqCx=vcyvJOsJb+LaMFg@mail.gmail.com>
 <DBACAJ6K5FAH.3IHMMM6NHITEJ@kernel.org>
In-Reply-To: <DBACAJ6K5FAH.3IHMMM6NHITEJ@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Wed, 16 Jul 2025 17:11:52 -0300
X-Gm-Features: Ac12FXx6I_pvMjNlSUhQyRDG4BoZKqYwKlQFV3CMFCUpL4UwVshlKdP4q2iWoDw
Message-ID: <CAPZ3m_hmb9xpvy2tN_C36rEobMG1aJ5UQg6Y4hkM-Uy3AugjSg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] rust: revocable: Document RevocableGuard
 invariants and refine Deref safety
To: Benno Lossin <lossin@kernel.org>
Cc: aliceryhl@google.com, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 12 de jul. de 2025 =C3=A0s 16:56, Benno Lossin <lossin@kernel=
.org> escreveu:
>
> On Sat Jul 12, 2025 at 8:49 PM CEST, Marcelo Moreira wrote:
> > Em s=C3=A1b., 12 de jul. de 2025 =C3=A0s 05:26, Benno Lossin <lossin@ke=
rnel.org> escreveu:
> >>
> >> On Sat Jul 12, 2025 at 1:06 AM CEST, Marcelo Moreira wrote:
> >> > Em ter., 8 de jul. de 2025 =C3=A0s 12:04, Benno Lossin <lossin@kerne=
l.org> escreveu:
> >> >> On Tue Jul 8, 2025 at 2:33 AM CEST, Marcelo Moreira wrote:
> >> >> > Improves the `RevocableGuard` documentation by explicitly stating=
 that
> >> >> > its `data_ref` member is a valid pointer as an invariant. Additio=
nally,
> >> >> > the `Deref` implementation's `SAFETY` comment is refined to justi=
fy
> >> >> > the `unsafe` dereference based on this new invariant and the
> >> >> > `_rcu_guard` ensuring data accessibility.
> >> >> >
> >> >> > These changes address feedback regarding the clarity and complete=
ness
> >> >> > of `RevocableGuard`'s safety guarantees.
> >> >> >
> >> >> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> >> >> > ---
> >> >> >  rust/kernel/revocable.rs | 7 ++++---
> >> >> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >> >> >
> >> >> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> >> >> > index 6d8e9237dbdf..64fe44b4f5a3 100644
> >> >> > --- a/rust/kernel/revocable.rs
> >> >> > +++ b/rust/kernel/revocable.rs
> >> >> > @@ -233,7 +233,8 @@ fn drop(self: Pin<&mut Self>) {
> >> >> >  ///
> >> >> >  /// # Invariants
> >> >> >  ///
> >> >> > -/// The RCU read-side lock is held while the guard is alive.
> >> >> > +/// - `data_ref` is a valid pointer to a `T` object for the enti=
re lifetime of this guard.
> >> >>
> >> >> This should be:
> >> >>
> >> >>     /// - `data_ref` is a valid pointer for as long as the RCU read=
-side lock is held.
> >> >>
> >> >> > +/// - The RCU read-side lock is held while the guard is alive.
> >> >>
> >> >> And this invariant is unnecessary.
> >> >>
> >> >> >  pub struct RevocableGuard<'a, T> {
> >> >> >      // This can't use the `&'a T` type because references that a=
ppear in function arguments must
> >> >> >      // not become dangling during the execution of the function,=
 which can happen if the
> >> >> > @@ -258,8 +259,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
> >> >> >      type Target =3D T;
> >> >> >
> >> >> >      fn deref(&self) -> &Self::Target {
> >> >> > -        // SAFETY: By the type invariants, we hold the rcu read-=
side lock, so the object is
> >> >> > -        // guaranteed to remain valid.
> >> >> > +        // SAFETY: `self.data_ref` is valid for writes because o=
f `Self`'s type invariants,
> >> >> > +        // and `_rcu_guard` ensures the data's accessibility for=
 the lifetime of this guard.
> >> >>
> >> >> This also needs to be adjusted.
> >> >>
> >> >> Also this patch should fix any invariant comments needed to constru=
ct
> >> >> `RevocableGuard`.
> >> >
> >> > Regarding this point, "...fix any invariant comments needed to
> >> > construct `RevocableGuard`."
> >> >
> >> > I looked at the function that constructs `RevocableGuard`
> >> > (try_access->RevocableGuard::new) and I think it's correct.
> >> >
> >> > In `try_access`, the comment justifies the validity of self.data.get=
()
> >> > by mentioning that `self.is_available` is true and that the RCU read
> >> > lock prevents data from being dropped. This aligns well with what we
> >> > already have in try_access_with_guard, for example (from patch 1/3).
> >>
> >> The comment seems wrong to me, it isn't even an `INVARIANT` comment. I=
t
> >> also talks about RCU in the wrong way and doesn't mention the type
> >> invariants of `Self`...
> >>
> >> > Since there are no other code snippets that construct
> >> > `RevocableGuard`, I thought I'd submit the patch with just the
> >> > adjustments I made previously.
> >>
> >> There also is the `new` function of `RevocableGuard` that doesn't use =
an
> >> invariant comment. It also isn't unsafe despite taking a raw pointer..=
.
> >> So either we make it unsafe, add the correct safety requirements which
> >> should just be the type invariants of the guard or we remove it, since
> >> we only use it once.
> >
> > Even if it's only called once, I think it's better to make `new`
> > unsafe because it can be used in the future, and keeping it unsafe
> > gives us the advantage of maintainability.
>
> Eh I'm not so sure that there is the need to construct it in more places
> than one. And if we ever need it, we could add it back in. But we can go
> either way. Maybe Danilo has a preference?
>
> > Understood, Benno. I'll change `new` to be unsafe, change
> > `RevocableGuard::new` to an unsafe block, and adjust the `SAFEFY`
> > comment.
> > ok?
>
> Sounds good, you also need to add an invariant comment inside of
> `RevocableGuard::new`.

Ok, Thanks Benno! :)

--=20
Cheers,
Marcelo Moreira
