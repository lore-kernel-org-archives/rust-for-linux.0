Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D123E320
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749756178; cv=none; b=OjhHi8CcynNZ4/8lgb2K43zB3GgrqcZHrUZswpBjUhG7fysSGp22l2FIiwZnJog1DufC2b58Dg1OWKkCnw/me1iLHKGUB49jiSi2gjMHP7AmDeZYR3UI1G8G8O7CUjTWm55NHD1XDDs8KVd4I6IAh8bNfmQV7poOMuwsm2cxUfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749756178; c=relaxed/simple;
	bh=n+Yw3Mdq9XrJB0xtDS1RduOftH/giQ76nPPdgGJ14OI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcJejjwEl0Ldg5PnxWPpReKm0mKHvXFa+TrRHk+PwV85qQxav260KPvTrgAskExokFMjQhk/2wWuAjTuxWum6nudC8Bd0SA9CQTV4OgzWMJkYASmloTAj+il7tg1liH01Xc84B/SJEBY8bh9hZMjaKuqEqbSIPvhm3tEIBVQcRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDC6/0qw; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDC6/0qw"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-407a5b577f8so372559b6e.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 12:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749756176; x=1750360976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nC++g9v4EmLHnilNICBRuJnxGRlHqhCvyDrR5A5MKVU=;
        b=SDC6/0qwejtyoKm5ix903WNnUZOWLcR4DUXNIo1wA+KlEPuhL7yUrmkBPkaD7skru/
         Foh9SZ7zNoO/q8EBJjtnGA1S5PM5k9FNgjvkARs+tMcDi0Voqc2sSvpSMFbdljNfGXKl
         swgFC6aHLAcmt/DaEpdgVwFJe6p45nO+KTtcBxpxDYMe0nQN3D5AxBCy3Udmozfmkpum
         8VzplvGp+N1Wm1b1BxdEHkXK9XSErzJ6IB3JQouvAagGmYfFll2FI2aS7fA7nK5UmNZe
         8KWnaD7TCeONneIsm8Xl/Z8CPNIxGVvfUdiCQ5mZOayyQ0mYDj26Jkuh7MGn+FGgZ7Ld
         GthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749756176; x=1750360976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nC++g9v4EmLHnilNICBRuJnxGRlHqhCvyDrR5A5MKVU=;
        b=reubO+3YL8jgrUzmuLL+YDKgBx20k3WdGK6I/kGNlIIDihxYLdtiSKzhNmzSkqdefI
         rJxsyqOpDJcmE/dADJ2xdeKfLzpNvTa9LIlfuPWbyxiiEVBPesX/SUfrMK0FYTToQqtD
         +eqcc4t9I6bMvAjcrJbzPzkWSkUpWbHU7D8awkhL8VRVjjtRL70C0eFwe1W/srm2bS8k
         DJzWiMZdaxnU+g9yPHBBpqmMKCOTNE9/7tShA5AsyW9KXOUHit7sCTXMA61GKTBxpXOZ
         gCcmuesZvOo51vM8idsMs4q0JpycxUanK3B5RI6TFxOB6UVCabp/UzcVfNHtoEZ4ezye
         Stjg==
X-Forwarded-Encrypted: i=1; AJvYcCUBtP4G7TC/xDTkDeeKtgjULPDtREsc8u5rLPEHLlTj1Jr70jl5p02Zl0XwfG92gEy5vgujljUw/lHHG4NHeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQS94wP4n8ZCafGDXENQaK1YyQjDDwdqPPVHf7FNfX2qOHkpbh
	xaRqwDxFlf5Ma0UdopfNmWlufgyDQnRQIVagy4swDKrn7ulkG1NmZHwRZGZneLZVTepXjdUwnxn
	yY6CNW36uPAdPZNLcxPkDTyu+Zoxudx0=
X-Gm-Gg: ASbGncsXX3ab1KNhufL1YLgonJDm13iV5t4bTXTD1Ro6VWywq2iPiZxfW9je6ZMK6Wv
	a8aPDQaGfMeWChOT7LAjAhh9IBjpOKVisxL7NhkHUDpVGwMWp578WAGotWMJE4WvdvdUVHrfUsY
	xdPvD02HHOj5sJk9+x7/wklpHc7aIjAbp07HVju2PMzqj+81uRv4EvrGc=
X-Google-Smtp-Source: AGHT+IFbTWjVrpjIYx07OvUtNCsIrGROXN4nHpRJec6tJa5NEAmV26b26XANJFeg1aLV/bGbroY6kmsRHchtj6FToQE=
X-Received: by 2002:a05:6808:220b:b0:3f6:a476:f7d3 with SMTP id
 5614622812f47-40a71e25e46mr458801b6e.9.1749756176182; Thu, 12 Jun 2025
 12:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com> <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
In-Reply-To: <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Thu, 12 Jun 2025 16:22:44 -0300
X-Gm-Features: AX0GCFs-KHNkn6iQmM-_ZG4Sw0v0a9nw3i0Cb9_z09davBQquehFrRyEgrkN7gU
Message-ID: <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
To: Benno Lossin <lossin@kernel.org>
Cc: dakr@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 12 de jun. de 2025 =C3=A0s 06:02, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Tue Jun 3, 2025 at 1:26 AM CEST, Marcelo Moreira wrote:
> > This commit clarifies the write invariant of the `Revocable` type and
> > updates associated `SAFETY` comments. The write invariant now precisely
> > states that `data` is valid for writes after `is_available` transitions
> > from true to false, provided no thread holding an RCU read-side lock
> > (acquired before the change) still has access to `data`.
> >
> > The `SAFETY` comment in `try_access_with_guard` is updated to reflect
> > this invariant, and the `PinnedDrop` `drop` implementation's `SAFETY`
> > comment is refined to clearly state the guarantees provided by the `&mu=
t Self`
> > context regarding exclusive access and `data`'s validity for dropping.
> >
> > Reported-by: Benno Lossin <lossin@kernel.org>
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1160
> > Suggested-by: Benno Lossin <lossin@kernel.org>
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
>
> I would have done this change after the other two, since then you can
> change all the safety comments here, but if Danilo is fine with doing it
> this way, then you can leave it this way.
>

ok, I'll wait for Danilo's answer :)

> The changes are almost perfect now, just some small formatting changes
> below. With those fixed, you may add:
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>

ok :)

>
> > ---
> >  rust/kernel/revocable.rs | 20 +++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 1e5a9d25c21b..d14f9052f1ac 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -61,6 +61,15 @@
> >  /// v.revoke();
> >  /// assert_eq!(add_two(&v), None);
> >  /// ```
> > +///
> > +/// # Invariants
> > +///
> > +/// - `data` is valid for reads in two cases:
> > +///   - while `is_available` is true, or
> > +///   - while the RCU read-side lock is taken and it was acquired whil=
e `is_available` was `true`.
> > +/// - `data` is valid for writes when `is_available` was atomically ch=
anged from `true` to `false`
> > +///   and no thread that has access to `data` is holding an RCU read-s=
ide lock that was acquired prior to
> > +///   the change in `is_available`.
> >  #[pin_data(PinnedDrop)]
> >  pub struct Revocable<T> {
> >      is_available: AtomicBool,
> > @@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuard<'=
_, T>> {
> >      /// object.
> >      pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard)=
 -> Option<&'a T> {
> >          if self.is_available.load(Ordering::Relaxed) {
> > -            // SAFETY: Since `self.is_available` is true, data is init=
ialised and has to remain
> > -            // valid because the RCU read side lock prevents it from b=
eing dropped.
> > +            // SAFETY: `Self::data` is valid for reads because of `Sel=
f`'s type invariants,
>
> s/Self::data/self.data/

ok

>
> > +            // as `Self::is_available` is true and `_guard` holds the =
RCU read-side lock
>
> s/Self::is_available/self.is_available/

ok

>
> Missing `.` at the end.

ok, and sorry for this hehe . . .

>
> >              Some(unsafe { &*self.data.get() })
> >          } else {
> >              None
> > @@ -176,9 +185,10 @@ fn drop(self: Pin<&mut Self>) {
> >          // SAFETY: We are not moving out of `p`, only dropping in plac=
e
> >          let p =3D unsafe { self.get_unchecked_mut() };
> >          if *p.is_available.get_mut() {
> > -            // SAFETY: We know `self.data` is valid because no other C=
PU has changed
> > -            // `is_available` to `false` yet, and no other CPU can do =
it anymore because this CPU
> > -            // holds the only reference (mutable) to `self` now.
> > +            // SAFETY: `Self::data` is valid for writes because of `Se=
lf`'s type invariants,
>
> s/Self::data/self.data/
>
> > +            // and because this `PinnedDrop` context (having `&mut Sel=
f`) guarantees exclusive access,
> > +            // ensuring no other thread can concurrently access or rev=
oke `data`.
> > +            // This ensures `data` is valid for `drop_in_place`.
>
> This last sentence is not needed. Instead, we should mention that since
> this is a `drop` function, we're only called once, so it's fine to call
> drop (since that also is only allowed to be called once).
>

ok, I thought of something like:

// SAFETY: `self.data` is valid for writes because of `Self`'s type invaria=
nts.
// The `&mut Self` context guarantees exclusive access and a single
call to `drop`,
// making `self.data` valid for `drop_in_place`.


Thanks Benno! (^_^)b

Cheers,
Marcelo Moreira
