Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C05D566A
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 23:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753138893; cv=none; b=WJt1DZspXlcda4u4uRTpmVi3ZJJkabDVYTAKaaizGZ74wm19VfOdzPGurdSI0lchHLoTkA27RI/bgJWTdF6VmmVZbm4oAxi6ZDZ3mYBnzdLBP7COEmlbRuE7hfHvIAKKy7EbyhRgbU6NNUcJ2jHAAQt1Flx0hKQIzocaskSPAEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753138893; c=relaxed/simple;
	bh=oSDk1m8uBMc0vfQ1c6DOmzGyXrUpcAabRQnRAew9ym4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGgxXDhxA7Bs5UbyOxdGCRbXLmu5JPKW/+yk8zd0VaB/glO7RKF+VDFkRVWu9xeoOOojoNrrDWdl8O3GAHZGGFCRacN9ul/ed+0oeHyIjUuFqCK8rdvX43KlJmeL7qXbT8k00iV5qe290uJFlZySOde937dVQYGNqMmkB1W9C0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fs6CHUhW; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fs6CHUhW"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-41b7d124016so2341438b6e.1
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 16:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753138890; x=1753743690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKEhto9raNL4YZsb1wsL16sv2nRjzkFcDwUj+fpIMmk=;
        b=Fs6CHUhW/H0ex7VXAvbxD/U2Rx3uiLL1axKekxxu28KYeWPNdglKxI9t+M9PABBdZ5
         sdawqR3bSm2P1HAD5GZ58Bk1S2njrD/z48c/A8Z4npldRJW/14JLHq8ZL+kmwY/NbvOh
         6ZRQFrfZrtjjVq00hSSerEXrKQ0Vg29EixzUYEu5UbyJ7YgPzo5vclc9GKO/OtuS+t0A
         dL5FJ9kfBmhh5Lxhm3PaRiAzNudnacyD7yTMQETidAXSXPIoJqTfS7LUJX7/6ShsK7QK
         fz+aCvi6HcZzd7Spvreb7i/4Zs+DxKtdJRwDq8Xucf/WpFUkeF7ZQ0NE3v/aHrFi93Zc
         QaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753138890; x=1753743690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKEhto9raNL4YZsb1wsL16sv2nRjzkFcDwUj+fpIMmk=;
        b=gwsHm+GHtX9QMBuAuSa9oZZj9vt8/+BWQtj0O/cUQQS3VMONCQbq3qWt6fQemfSuA7
         hyB5zANdVLg6mg1L3fPh9vXAVcSZFHcHDPX5F7Q6wpPLlvcUnXoZjJe12KOikJlWD5pM
         7KtwQByLrqNEJCbMdjBKsr/7W8sxw7zry+EdkLBrHONX2g0JGEcat7Cio5N9MhtttDpi
         Uo5B+n1OFLxtBEsOSEVxZO88i7RZRtq3EeFNl79OAAVKi48HPPW9Tv6K7aBiqRQ7BvkP
         gqMk93AnqzZ3eBMlXVZC/g2mx3E+QDpSkMoA3U04rvILesyiF+a8TU59ZGWoimSLmQSq
         CwgA==
X-Forwarded-Encrypted: i=1; AJvYcCX48Vr6sG/Vna46viWterr8TXQFgBFeWxb/prr5juEs+MB5iMtQTHZvjadLspTkYIGNwXZaOo2Xkd6Zhxul8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyacIzadl4eY80bQBaJcJERhwrLomB25cdvFEjyasRQbagkwQcd
	AYyiJXTlhyp0SK9+pcBeCt3ucQ74iz8pu5Joywt/SNLPrcIennuBexA3wYtLje4WFvHXHdDJ57z
	LnAgdQOL8Iz292n5Qa8UB5jSrfAZnBSk=
X-Gm-Gg: ASbGncuDs86UZVBx1YnTCNEe+D3Rx55kcmUQANG9sAOt1pwDD6pcs4xbB+MNt0TDpBP
	cqKT+6E4OgBL4/aMheQOi1PFF4Lo1THzeecNeHnBO5Ys5OEYMyZi8Nd+fXcwIdFisFXgKhDA5B/
	Wi9KztOcXMgefd//LjtFOpL3iE25J14xJ/CgDp41ko6ZrVsbXeu0atANYAws5woQf3R0LtcVzDD
	N9ESaFyuL8kdneK2Jg=
X-Google-Smtp-Source: AGHT+IHEg/1nRFO7h5VeJ6NMKIyca/En9otpaW7j+5Z7nS9c7ZhKDcK96TDj17Jc6whIMqwuClziuR+Sa2ttAGlAnhc=
X-Received: by 2002:a05:6808:23ca:b0:409:f8e:726f with SMTP id
 5614622812f47-41e468a7a39mr12475498b6e.25.1753138890364; Mon, 21 Jul 2025
 16:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
 <20250721010258.70567-4-marcelomoreira1905@gmail.com> <DBHSSQS2IALW.2OEWVKX6PY9LZ@kernel.org>
In-Reply-To: <DBHSSQS2IALW.2OEWVKX6PY9LZ@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 21 Jul 2025 20:01:18 -0300
X-Gm-Features: Ac12FXzSAGc46XYmDiNTuW7c68kRxL3WL0wImhqKCCd7IO0sECbrPI3Sv-dSCQI
Message-ID: <CAPZ3m_h4rvV8gfBi0ZQN=569FhB1+DsF2A6XkkLuWAFUEuKPDQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] rust: revocable: Document RevocableGuard
 invariants/safety and refine Deref safety
To: Benno Lossin <lossin@kernel.org>
Cc: aliceryhl@google.com, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 21 de jul. de 2025 =C3=A0s 11:21, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Mon Jul 21, 2025 at 3:01 AM CEST, Marcelo Moreira wrote:
> > Refinements include:
> > - `RevocableGuard`'s invariants are updated to precisely state that
> >   `data_ref` is valid as long as the RCU read-side lock is held.
> > - The `RevocableGuard::new` constructor is made `unsafe`, explicitly
> >   requiring callers to guarantee the validity of the raw pointer and
> >   RCU read-side lock lifetime.
> > - A new `SAFETY` comment is added to `Revocable::try_access` to
> >   justify the `unsafe` call to `RevocableGuard::new`, detailing how
> >   `Self`'s type invariants and the active RCU read-side lock ensure dat=
a
> >   validity for reads.
> > - The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
> >   is refined.
> >
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> > ---
> >  rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
> >  1 file changed, 18 insertions(+), 7 deletions(-)
> >
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 6d8e9237dbdf..0048de23ab44 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -106,9 +106,12 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<=
Self> {
> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >          let guard =3D rcu::read_lock();
> >          if self.is_available.load(Ordering::Relaxed) {
> > -            // Since `self.is_available` is true, data is initialised =
and has to remain valid
> > -            // because the RCU read side lock prevents it from being d=
ropped.
> > -            Some(RevocableGuard::new(self.data.get(), guard))
> > +            // SAFETY:
> > +            // - `self.data` is valid for reads because of `Self`'s ty=
pe invariants:
> > +            //   `self.is_available` is true.
> > +            // - The RCU read-side lock is active via `guard`, prevent=
ing `self.data`
> > +            //   from being dropped and ensuring its validity for the =
guard's lifetime.
>
> This shouldn't be needed.

hmm, about what exactly?

Are you suggesting to:
1. Simplify the content of the `SAFETY`, is it too verbose?
2. Or are you suggesting that the use of bullet points within the
`SAFETY` is not preferred here?


> > +            Some(unsafe { RevocableGuard::new(self.data.get(), guard) =
})
> >          } else {
> >              None
> >          }
> > @@ -233,7 +236,7 @@ fn drop(self: Pin<&mut Self>) {
> >  ///
> >  /// # Invariants
> >  ///
> > -/// The RCU read-side lock is held while the guard is alive.
> > +/// - `data_ref` is a valid pointer for as long as the RCU read-side l=
ock is held.
> >  pub struct RevocableGuard<'a, T> {
> >      // This can't use the `&'a T` type because references that appear =
in function arguments must
> >      // not become dangling during the execution of the function, which=
 can happen if the
> > @@ -245,7 +248,15 @@ pub struct RevocableGuard<'a, T> {
> >  }
> >
> >  impl<T> RevocableGuard<'_, T> {
> > -    fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
> > +    /// Creates a new `RevocableGuard`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that `data_ref` is a valid pointer to a `T=
` object,
> > +    /// and that it remains valid for as long as the returned `Revocab=
leGuard` is alive.
> > +    /// The RCU read-side lock must be held for the duration of the gu=
ard's lifetime,
> > +    /// as indicated by `rcu_guard`.
>
> This last part shouldn't be needed, as the `rcu::Guard` already
> guarantees it.

Ok, I can remove just that part and keep the rest.

--=20
Cheers,
Marcelo Moreira
