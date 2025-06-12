Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C9F2D1F61
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 19:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749756611; cv=none; b=fwAyPBtrMNyVvBM2/RzfWQpxmzC16pyVfEJyGFZrpf0ch5m8iS75HTH1JESU5re4kzQuLhvPdPysDNxsDrPCUbYd2TSOyhg+yTZiOFn9mNoU83GSlYoSqhq6S5h0JJ+Rtmh6Zp4fOh7uHl2c3EO+5uMdvOF/qYCHcttBNWcOXiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749756611; c=relaxed/simple;
	bh=CcqpGh9z/Ce+MNF5QoPH82IVpEGXPfDNl6fTwAvAo8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWuIo7zbXzAHfoZsSHxPeT42lJuKcKnV2jHOBy/NsYcIs5FeGQ4hskGHs0GtALuDEkUSvW5Ib8vEDoQfGHZB706LKUwPU+WopTqiuSIcA9y1DiaDtn+nAh6Yyw08qGao5aFtdQr6LIscT+fSBJdvgC04nIzsLBeMi0DyWsQDYAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dc7mnbZh; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dc7mnbZh"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2d4e91512b4so768393fac.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 12:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749756609; x=1750361409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKGZf29zeJuTyr5Er/hAccheguB+TsnTj7N2LnaeJXc=;
        b=Dc7mnbZhB0y8AsINbXkeX0aZ/+laLYoQe5dPsHePUJp9RaYtNKduvzRJBg/nLmD1jW
         V+5lf8ahh1T6NUEfs+JkGhggReb8ZC5+A5vj4j6wmpUv5uGnHlBlaw3vIj0rhwwKHTVe
         14nYeJwVfZyGa4ltV4A4BRJaelvs5msobzmdSHPt97+X4xjUzoObIUnISK1I558apz9r
         T8eUXTYoqwwpcXHjUlkXoNwLh7ksUe0dejKKP3m8ELMHpXnMdVt+asLyRdNxb/R74QDY
         jsd9iRe29m/wtfVsD0Wyp88aRUtvNzgup6E5mldWlWRXqTHMAkoUJzCfN9XYMoWPLRBg
         BmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749756609; x=1750361409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKGZf29zeJuTyr5Er/hAccheguB+TsnTj7N2LnaeJXc=;
        b=dcZizKaC1lmYhipSTligY+dP0diMXnKYztwkPQJE6RE8wG3QdDiOe4EB3HkZ0EziDo
         gNQhaK1fNsfzMK1g9lefI3PvLrJ+/SocXQJcr7G2Dq0sKvsNnVhAHMSuv1EyMKVox1Bp
         pTpbV06NPa/iLUsf78DVRuzMvKyO10YgVpcx69IJUMLlImp5J7lQ4QHDhQk7BRnZ9CyQ
         q2kdu1MMhSQimlQXBIUx9YbTaCpOhpuCptE8DJySInll7VPOkZcPZL7GBh1ln9t163nn
         GyqoiPj079lLZWSTJeBbL5yp+sGdhJ1eK6h0sgKIJJu7ET588g5D4Tld6gib+V0toXOI
         vbzw==
X-Forwarded-Encrypted: i=1; AJvYcCVN/sUS5a4pN64N36AOnNloumbYAD7UrhRICIIY7JuOVdhSFvCVEXblgUddcnClsWR8kvirbErJlFsKynv8yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg+Mho3e1NzmIBHSxxyx+kGS4IxbztCoYeCaWknaXbvejldlHD
	69dUq56gKMpEsyNnrZSx8mIyyIDztsw8PWbn6Yd1VncProKSueK7g72fHb7X7+DOS3x9XTKvjC4
	Ee5En3fmlOJOvvsdyGkkfZwnqbmWJu/4=
X-Gm-Gg: ASbGncscyUU6fKrg6UlWV3ViTf4Jfh1wq8pEw8NYfTCBX8RnCeJf5fiVTrvZccA6uNY
	eppi+Yr9yuE5Q64YmGJKtzIiit9JrXhl1ZMbFRKDEVv7N3Rr7zGSVW28sAIVflArj0+EWa5/JF2
	cr4dncJSzHkft5qDAFVBm2GUgOaKVT/F9S7LtEkJufFzJnEDAWLIyIHrHkvDnTYbIYyw==
X-Google-Smtp-Source: AGHT+IFmsq9sEI1DwWDfzQEZyfKZ6sKyH+yEuzi6AEoCYzQdb4LIZMRoqB1ychnI0//y4/XN6kS72Ohg4umywUsq2f0=
X-Received: by 2002:a05:6870:459d:b0:29e:27b6:bea5 with SMTP id
 586e51a60fabf-2ead510a294mr204968fac.25.1749756608683; Thu, 12 Jun 2025
 12:30:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-4-marcelomoreira1905@gmail.com> <DAKFP38LXT84.QN50NZ2QB4WU@kernel.org>
In-Reply-To: <DAKFP38LXT84.QN50NZ2QB4WU@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Thu, 12 Jun 2025 16:29:57 -0300
X-Gm-Features: AX0GCFuv3CuGZGgFXqgtoeVvFBARV_ILL3PpMLlKpk0s2y3xseDEjs6AETefSSY
Message-ID: <CAPZ3m_ie+0+mcdKdVsZgbzLBZyf=9YvmyNUSCX7ehMhaJF_Baw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] rust: revocable: split revoke_internal into revoke
 and revoke_nosync
To: Benno Lossin <lossin@kernel.org>
Cc: dakr@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 12 de jun. de 2025 =C3=A0s 06:07, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Tue Jun 3, 2025 at 1:26 AM CEST, Marcelo Moreira wrote:
> > This commit refactors the revocation mechanism by removing the generic
> > `revoke_internal` function. Its logic is now directly integrated into
> > two distinct public functions: `revoke()` and `revoke_nosync()`.
> >
> > `revoke_nosync()` is an `unsafe` function that requires the caller to
> > guarantee no concurrent users, thus avoiding an RCU grace period.
> > `revoke()` is a safe function that internally waits for the RCU grace
> > period to ensure all concurrent accesses have completed before dropping
> > the wrapped object.
> >
> > This change improves API clarity and simplifies associated `SAFETY`
> > comments by making the synchronization behavior explicit in the functio=
n
> > signatures.
> >
> > Suggested-by: Benno Lossin <lossin@kernel.org>
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
>
> One comment below, with that fixed:
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
>
> > ---
> >  rust/kernel/revocable.rs | 38 +++++++++++++++-----------------------
> >  1 file changed, 15 insertions(+), 23 deletions(-)
> >
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 43cc9bdc94f4..daf22e3a7d20 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -126,22 +126,6 @@ pub fn try_access_with_guard<'a>(&'a self, _guard:=
 &'a rcu::Guard) -> Option<&'a
> >          }
> >      }
> >
> > -    /// # Safety
> > -    ///
> > -    /// Callers must ensure that there are no more concurrent users of=
 the revocable object.
> > -    unsafe fn revoke_internal<const SYNC: bool>(&self) {
> > -        if self.is_available.swap(false, Ordering::Relaxed) {
> > -            if SYNC {
> > -                // SAFETY: Just an FFI call, there are no further requ=
irements.
> > -                unsafe { bindings::synchronize_rcu() };
> > -            }
> > -
> > -            // SAFETY: We know `self.data` is valid because only one C=
PU can succeed the
> > -            // `compare_exchange` above that takes `is_available` from=
 `true` to `false`.
> > -            unsafe { drop_in_place(self.data.get()) };
> > -        }
> > -    }
> > -
> >      /// Revokes access to and drops the wrapped object.
> >      ///
> >      /// Access to the object is revoked immediately to new callers of =
[`Revocable::try_access`],
> > @@ -151,10 +135,12 @@ unsafe fn revoke_internal<const SYNC: bool>(&self=
) {
> >      ///
> >      /// Callers must ensure that there are no more concurrent users of=
 the revocable object.
> >      pub unsafe fn revoke_nosync(&self) {
> > -        // SAFETY: By the safety requirement of this function, the cal=
ler ensures that nobody is
> > -        // accessing the data anymore and hence we don't have to wait =
for the grace period to
> > -        // finish.
> > -        unsafe { self.revoke_internal::<false>() }
> > +        if self.is_available.swap(false, Ordering::Relaxed) {
> > +            // SAFETY: `Self::data` is valid for writes because of `Se=
lf`'s type invariants,
> > +            // as `Self::is_available` is false due to the atomic swap=
, and by the safety
>
> Please also use `self.data`/`self.is_available` here (& below) instead
> of `Self::`.

ok, Thanks! :D

Cheers,
Marcelo Moreira
