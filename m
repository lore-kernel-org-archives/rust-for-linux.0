Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3530B2D0C7E
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 23:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782776522; cv=pass; b=TRLJDHjGrmm3B+GHPR8wrv+foc5Gk80DLU5CDL/KI4RIfaQQRUFYi/PK3d7OxvmUkDQDOn1rqJaH2tZ9/SwfFDmrQkjw07yw5Q4AjTPcgO1CXuxM8sCIqvBoLDgU0dqhGRvdQ0tngW1CYuUm0C4IknOO/MMuyf272OVGzQCqD/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782776522; c=relaxed/simple;
	bh=CdTrs2TrKynxLpVmlCs3DYrVnmitPT6NfBq/4OOYvlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W72Vfk+dw2P5jZAv7grCJ4JYsGL+rTRAWvLYcvFbulNhhYNtvTDh32eBTsJZx6vzlmiRtDVYYT2aoH+y/ERs64+GgTtoJQFaA9jKIpl0Jfz4B6ePZKQfvoJ7gEm6st3o/90C5DX/HUWQNFiFjbBN40VRBXuWY/Rut4P+r1eetq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=IupPrbN8; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="IupPrbN8"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ee6912d86dso17587216d6.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 16:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782776519; cv=none;
        d=google.com; s=arc-20260327;
        b=gonzmUoiNiUDH68PftREOFgMSc9jUARDL4MmswlobqZr68WAYOu8w0Br7bcI7W96NI
         GuGUKt/t855UOxkidcA5pkjXSHjHmesJmybx5CRvy8ELXriJu6oY+6d/j8FGsB/9lv10
         7wE4Q9Wq8kRxxWE2YBgCGYQCv6AZjF7jDEgdh4KWzxpMbBiLJME+StrlVmbQAwOe4eQU
         jiumf59gDW2+Uo88AMZswihiquuAlr4ih68w2CJlEBGEYZ50DDCmSFpSqvugik4ysNN7
         Mw/toXCdLUCe2v/fdomBmZYDp3jMBiZTIF8cHx5l4j/a2KpIvRvpyupa8Wlj+E1q6Nmb
         HLmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JjA1KIPnoh6sojWB+egdvLoP0t92bxd3lmSTFdjZjMQ=;
        fh=SGSzvif/SvHojCJS+GCubmXsGMhwV0U+qeU9FbAin6k=;
        b=aL3M3r0BekhvQfaIQQeynJQrswLrGBOP+p7DuucDWI+fCxtvqx3SWzb7EOfqCggIVu
         D5ydeexTPwlcEx9VHazzXkF1veNp2vRIdekysC5oP2y0Dlpz4ipd2AJOA/4Vlkaxl5vf
         HOJoh+JX8U2GPDuQtQCVh4ooQOdYsRVjSG7kf1p2gGQ9/QNGoOnBSvSXS51nTdzKqeHd
         I2lOj29qGVfioWIFs280WsfKOaVxHG5ge9u01MTgf6F5Zzofk1sUx+y/OdsmDsHZhfOe
         dqrfv4DDuCdvNgym/leydzK9YqxkfT/WqDDT0dhTRVCMD9Sade0ZTbQyRAVWy/Kx8wQ2
         Gzaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1782776519; x=1783381319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjA1KIPnoh6sojWB+egdvLoP0t92bxd3lmSTFdjZjMQ=;
        b=IupPrbN8qsnMA8MXuz/N48pLK9CQ7+Z+MnCpEnkPTj1dYemjEvNvv3B3YQ+JntjncD
         o9/6iTLE+dLXmqasHzCazWJH3kjIOmC2ivW1WNUJzt3sN+j/Lf38XeeGZeQD2ni1el5P
         TBYCw+N1ybjaAqt1QgyaH5o4rL1Ahd4E10bZ7pQIB4uW8mD2XwM+9aPMHsB8QIbDI3+4
         wa43hNRFNnKgIF8xEQ9MEV3vGleLI+LpGzmRXYeZ5Ynyjm/mF1VT1/fkGlDiwPJJAkF7
         pWMNuqhkekr+uwoZKHGLVC8EtDqLv6R+w4rQxexmp0bFnUGqLq2BYZHF8Z9fqz3lutWh
         n5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782776519; x=1783381319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjA1KIPnoh6sojWB+egdvLoP0t92bxd3lmSTFdjZjMQ=;
        b=sbZTCO/zJjGXbEqhtRmzSVY1hJcJvsq4EYz1SquUWhAxLRHfEFfdB6Qfl/4IGRPnFV
         youxyRQ0VHCw+0Fs7UBGYTZwkpK0yrTotCwYiZMDruIKVQzFLe9lhruJKXceSiiLob4A
         OU4ZOZr30laBGe2m+RyMWPpODSA3HmF3YertPJBWNxmoLxFYONpaMpqY2oUU3+GIzuWe
         uh2w8ViSgSbuDAW+yrsTIrI84gxvK0YPC7ygfgXFG3HbrSwbz3WSZevuTTO39hwSZcsm
         MFYCLe9RFOEXB6DiqCYPm3+eN+Xay7/Lxg84j0rNzkzwtMLCzPAlol9TdM2Qlbv6aj2q
         HWIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq79vlpXbLS1it8dttf3q9kHViHZJdZZEOfTTlXrXRQfgwQqRAEhFNKIJEkNVLsG5GTt/WBwcciV4WkBXEjWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyAc7Xr6PE9H7JyxB+yu5xxwGhTnS2uHvQp29ill22KKZMwh4k
	xO7uh8+7I81U7o6sLwasp08bYijLXUg+boKBdtk2fEEUzimLM6ETCnKhkl/zH5WU/aDTC/k+fXb
	YYUuAKIJDjknPCMrJwoPQORhnDJVuycD73kM7Co0iRA==
X-Gm-Gg: AfdE7ck0L7mu6U30qjnRUFOXmitzSUqfIhs0Idefqp3dbA6eQZsFRNEOoUy5nmkd/8x
	ov8qkXof5ynYuZxBpeJtKqz+p9i12OzKf6D4wWikSJ2pVGV839KsAK/rsoVBw+guEs/mpLMgubE
	z9eRxDjpoK2GPKSrVQsF2GzpRBZMvqm0bs0YDv9hTzwFYDUYg+7PI400x0tFhI3mC8a6qqgWt7n
	xjWSBaOn/PtFqBAlN45HGDl5e+o4bQrvQeFNco3Uyhh5aKOybFOGWDXDJpEZl5edBEbliJEOKFE
	NmuHySin/dk+jAizqXQNWl+pmt13jR0cnBEI9vc=
X-Received: by 2002:a05:6214:27e8:b0:8ca:164c:a85c with SMTP id
 6a1803df08f44-8f1bd21e190mr22945776d6.34.1782776519174; Mon, 29 Jun 2026
 16:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605022400.31489-1-kentertan12138@outlook.com> <DJ5NE8Q0PG6X.1Z63LDHA2Y95L@garyguo.net>
In-Reply-To: <DJ5NE8Q0PG6X.1Z63LDHA2Y95L@garyguo.net>
From: Priya Bala Govindasamy <pgovind2@uci.edu>
Date: Mon, 29 Jun 2026 16:41:46 -0700
X-Gm-Features: AVVi8Ce430p7MQ3TGXFwtK4qJtPPp_x0YfOzAChKRpMzXA7Slgqz4Jpe34tD4DI
Message-ID: <CAPPBnEZ+aNg+0ES+TmGo+JQMD1rH1ougz2PrAEtQLMy4+oLrOg@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: sync: avoid leaking the lock lifetime from Guard::lock_ref
To: Gary Guo <gary@garyguo.net>
Cc: Yuan Tan <yuan.tan1@email.ucr.edu>, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, peterz@infradead.org, zhiyunq@cs.ucr.edu, 
	ardalan@uci.edu, dzueck@uci.edu, Yuan Tan <ytan089@ucr.edu>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 1:22=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Fri Jun 5, 2026 at 3:24 AM BST, Yuan Tan wrote:
> > From: Yuan Tan <ytan089@ucr.edu>
> >
> > Guard::lock_ref() returns the Lock stored in a Guard. Returning that
> > reference with the guard's internal lifetime lets safe code keep an &Lo=
ck
> > obtained from a shared borrow of the Guard after that borrow ends.
> >
> > That is unsound for T that is Sync but not Send. Guard is Sync when T i=
s
> > Sync, so a shared reference to a Guard may be used from another thread.
> > However, Lock<T, B> is Sync only when T is Send, because a shared &Lock
> > lets that other thread acquire the lock and obtain mutable access to T.
> > Leaking an &Lock<T, B> from &Guard would therefore let safe code share =
a
> > Lock whose Sync requirements are not met.
> >
> > Tie the returned reference to the borrow of the Guard instead of the
> > guard's internal lifetime, so callers cannot keep the &Lock after the G=
uard
> > borrow ends. Also require Lock<T, B>: Sync before exposing the lock
> > reference at all, so Guard<T: Sync + !Send> remains Sync only for acces=
sing
> > the protected data through the guard, not for sharing the underlying Lo=
ck.
> > Make the guard fields private as well, so crate-local code cannot bypas=
s
> > the accessor and recover the longer internal lifetime directly.
> >
> > Fixes: 8f65291dae0e ("rust: sync: Add accessor for the lock behind a gi=
ven guard")
> > Cc: stable@vger.kernel.org
> > Reported-by: Priya Bala Govindasamy <pgovind2@uci.edu>
> > Reported-by: Dylan Zueck <dzueck@uci.edu>
>
> To me it looks like the bug report (and likely the patch too) is LLM gene=
rated.
> You need to disclose it per
> https://urldefense.com/v3/__https://docs.kernel.org/process/generated-con=
tent.html__;!!CzAuKJ42GuquVTTmVmPViYEvSg!LhVI2yFBN0J9SVEI9pqv-HR-bhBETrt9_U=
ujAnCfZ259hw7NA5eAEc3NVx7-sgUuB5YrwKpp7QhrF38$  and
> https://urldefense.com/v3/__https://docs.kernel.org/process/coding-assist=
ants.html__;!!CzAuKJ42GuquVTTmVmPViYEvSg!LhVI2yFBN0J9SVEI9pqv-HR-bhBETrt9_U=
ujAnCfZ259hw7NA5eAEc3NVx7-sgUuB5YrwKpp1cO3Rho$ .
>
The tool internally uses an LLM to detect bugs, which is why part of
the bug report is LLM-generated. We then perform manual analysis to
verify these reports. We apologize for the inconvenience. We will be
more careful about disclosing AI usage in the future.
>
> This is also not the correct fix. I am not sure how the lifetime change i=
s
> needed here at all.
We will send another version of this patch that should better target
the issue. Thanks for your feedback.
>
> Best,
> Gary
>
> > Signed-off-by: Yuan Tan <ytan089@ucr.edu>
> > ---
> >  rust/kernel/sync/lock.rs | 15 ++++++++++-----
> >  1 file changed, 10 insertions(+), 5 deletions(-)
> >
> > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > index 10b6b5e9b024..6c4ebe7c6072 100644
> > --- a/rust/kernel/sync/lock.rs
> > +++ b/rust/kernel/sync/lock.rs
> > @@ -199,12 +199,14 @@ pub fn try_lock(&self) -> Option<Guard<'_, T, B>>=
 {
> >  /// protected by the lock.
> >  #[must_use =3D "the lock unlocks immediately when the guard is unused"=
]
> >  pub struct Guard<'a, T: ?Sized, B: Backend> {
> > -    pub(crate) lock: &'a Lock<T, B>,
> > -    pub(crate) state: B::GuardState,
> > +    lock: &'a Lock<T, B>,
> > +    state: B::GuardState,
> >      _not_send: NotThreadSafe,
> >  }
> >
> > -// SAFETY: `Guard` is sync when the data protected by the lock is also=
 sync.
> > +// SAFETY: `Guard` is sync when the data protected by the lock is also=
 sync. The lock reference
> > +// returned by `lock_ref` cannot outlive the guard borrow, and `lock_r=
ef` is only available when
> > +// `Lock` itself is `Sync`.
> >  unsafe impl<T: Sync + ?Sized, B: Backend> Sync for Guard<'_, T, B> {}
> >
> >  impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
> > @@ -219,7 +221,7 @@ impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
> >      /// # use kernel::{new_spinlock, sync::lock::{Backend, Guard, Lock=
}};
> >      /// # use pin_init::stack_pin_init;
> >      ///
> > -    /// fn assert_held<T, B: Backend>(guard: &Guard<'_, T, B>, lock: &=
Lock<T, B>) {
> > +    /// fn assert_held<T: Send, B: Backend>(guard: &Guard<'_, T, B>, l=
ock: &Lock<T, B>) {
> >      ///     // Address-equal means the same lock.
> >      ///     assert!(core::ptr::eq(guard.lock_ref(), lock));
> >      /// }
> > @@ -234,7 +236,10 @@ impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
> >      /// // `g` originates from `l`.
> >      /// assert_held(&g, &l);
> >      /// ```
> > -    pub fn lock_ref(&self) -> &'a Lock<T, B> {
> > +    pub fn lock_ref(&self) -> &Lock<T, B>
> > +    where
> > +        Lock<T, B>: Sync,
> > +    {
> >          self.lock
> >      }
> >
>
>

Best regards,
Priya
