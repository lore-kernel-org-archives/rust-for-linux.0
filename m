Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4126E1F30BB
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 23:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753314591; cv=none; b=Faxw+HTv5GQUvk33Qhb3k6Q8Yw5ariPH+2YMCYf1rYD47bwGPqC528lNVxavxIWHdrfoaWQaOC8SgvDG3FMWkqaETx5aW+aPIBxKdCE2p2W2lIJ1CpspP3CZ4AeZkjAarPAqBnkopGy++3kWDqvsv7vvx+oE3kBHl9sx0N8L+lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753314591; c=relaxed/simple;
	bh=gJ6QvWTtPoEZV0vQSM863Xzk5kvnPKuhiZgVvnMDq1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9KwRv8YJIORKeXB/M8Owgg5j7yBRn+J3s5WFYFGVzLGFLaADk8GbSllSF4mOBUSFF6jXa99Fy4QkmSU/um0Yeo9qD80yELIU/EOkbr4EZswLEbGEk562vWBBViOSunyDdrAM65/OetfdiSjGlkH5JBUKJTl2J+/cDQ+1grn5+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rid9cTtq; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rid9cTtq"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-73e810dc03bso85125a34.3
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 16:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753314589; x=1753919389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJkBuJA1bEWnF4NjmDtK8UbAiVwDs7c1RyvKhyo4rz8=;
        b=Rid9cTtqTXM9NoM/GYiKcrSE+8mLM7hMtwfZdlfSIqzU1UcI3FKYSAScCR78ujtVWR
         oRUbxclmiMFohgLHk8IrJFy2lwyI2O+cGCWbaz4F/hA33Iq7qG2kgr0OKO7QZCgmi9Xd
         XsVcVmX6SQh/1ZP27EqA4ZQxg+uulPTAb1EipNnUmiBBPrTLgs27x4zyTVJ8kSYzTvID
         yC/BKAaIV14DnAzkP+r5qQuec47yalfdTbBM2qVBUr/LD8Ta1dXfv5K1DqplooogQVn5
         MKBzzrUR4Gp8lV4RMplgXA1lnkFsfq7pa17AWwrUEWwxgSXvmVYKiHDV5MIE+6PvZ8rm
         k5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753314589; x=1753919389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJkBuJA1bEWnF4NjmDtK8UbAiVwDs7c1RyvKhyo4rz8=;
        b=U21IMMgQmSFHY17W8ihrewD+HIiceHjvZbR2Tkavxqr7D4EV/QXwrv3fr2wMm6gt5O
         sqgmYavO/vTTlQY2b6momg+gscJHJHRs6UNGJ6bsTAR6vhmfoY/f6syR06u5gkjmPYbl
         z/ryQYG6/OluhQVRRyRvbG5/XmOz9Uk8wNCrZAY7dn9pwRLet1OQQrFZfFyzzmfBAhQm
         PGU2EjkzJFyn0L/ZUKUZvAeMZ1GG3E2P6u+ZuAov4F1fiTMb3a9uC0i4wezkxNVLR9Zr
         H7Jyf6l4eUMAfJg0jcI8ujKIgGT/fI4TKWAzcthZz/AZvvKwLZguowbxxTykowXVevB3
         uDgg==
X-Forwarded-Encrypted: i=1; AJvYcCXdsMMMSLV4n/mbk9BRCQb/MfdaJnu3GF1dx8r305CYDSzkKq2WRUV3bCnzzSSI83ngxFG3z+iRqyhnerxsbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqlXjDuV9YXhpvBh2KJcAq1t4BE5n7jgIFZjMq76tfaqjuYQ57
	ZqHrERvQMaZfnQ3p0BgLQXz0jPZIWpwxnjOQQKe/eTrxLbv/RYEKMo5GQsgEbwKDHv+TVOK6cdG
	zRdtbUAYRAauzANOJbcsNn+ACVAPtlSo=
X-Gm-Gg: ASbGnctD1A5VU0x7yWGbOdZTVyr/TwnAbH5N33ocn3Yui0an+yAoZJ6Dj03H/QJht/J
	YKhqh4DY2CV8HJqSBwSpS5F64IKpoCfIw5DQlTzwkiX4AYd436He30280E+fVAVpClzNHc9xO5I
	aTcn8cKiZ/nAY6U6jOiY1f4RTrFJIpPQ63cyeHw9vseBCLNSioBjRoP+rLu0c6/Mcl0i5vdjJzU
	MPtfJlrJbu+uFnsuIuRO+m4dceFiQ==
X-Google-Smtp-Source: AGHT+IG1fHaqjmzQCwCOyic+2p1F9L7gvaAJ9aM3YWnNrlhglFg136vVfD+MdGNvIxheteX4QamjQT3STKGLvzTQnRs=
X-Received: by 2002:a05:6808:199f:b0:41d:981d:b7e9 with SMTP id
 5614622812f47-426cd7cb117mr4160498b6e.38.1753314589176; Wed, 23 Jul 2025
 16:49:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
 <20250721010258.70567-4-marcelomoreira1905@gmail.com> <DBHSSQS2IALW.2OEWVKX6PY9LZ@kernel.org>
 <CAPZ3m_h4rvV8gfBi0ZQN=569FhB1+DsF2A6XkkLuWAFUEuKPDQ@mail.gmail.com>
 <DBIIZ28TA8SD.XY1W0S6G280F@kernel.org> <CAPZ3m_jepxCD-dr+gyun_=hb-fHX_yxTunsd4JX98nt4XmnEQA@mail.gmail.com>
 <DBJI2YV59B29.2CZPPGB7G9TRF@kernel.org>
In-Reply-To: <DBJI2YV59B29.2CZPPGB7G9TRF@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Wed, 23 Jul 2025 20:49:38 -0300
X-Gm-Features: Ac12FXwBG65B-Zjd_l--VOq3xaXV1wbZqM0PrU9_d4ybkcaSNeRBBW2TLGiFQ9A
Message-ID: <CAPZ3m_i8j90tkjYaEZp+trd7GHSu1eaQLO+rqpn6HhV35JQH-w@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] rust: revocable: Document RevocableGuard
 invariants/safety and refine Deref safety
To: Benno Lossin <lossin@kernel.org>
Cc: aliceryhl@google.com, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 23 de jul. de 2025 =C3=A0s 11:22, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Tue Jul 22, 2025 at 11:23 PM CEST, Marcelo Moreira wrote:
> > Em ter., 22 de jul. de 2025 =C3=A0s 07:51, Benno Lossin <lossin@kernel.=
org> escreveu:
> >> On Tue Jul 22, 2025 at 1:01 AM CEST, Marcelo Moreira wrote:
> >> > Em seg., 21 de jul. de 2025 =C3=A0s 11:21, Benno Lossin <lossin@kern=
el.org> escreveu:
> >> >> On Mon Jul 21, 2025 at 3:01 AM CEST, Marcelo Moreira wrote:
> >> >> > Refinements include:
> >> >> > - `RevocableGuard`'s invariants are updated to precisely state th=
at
> >> >> >   `data_ref` is valid as long as the RCU read-side lock is held.
> >> >> > - The `RevocableGuard::new` constructor is made `unsafe`, explici=
tly
> >> >> >   requiring callers to guarantee the validity of the raw pointer =
and
> >> >> >   RCU read-side lock lifetime.
> >> >> > - A new `SAFETY` comment is added to `Revocable::try_access` to
> >> >> >   justify the `unsafe` call to `RevocableGuard::new`, detailing h=
ow
> >> >> >   `Self`'s type invariants and the active RCU read-side lock ensu=
re data
> >> >> >   validity for reads.
> >> >> > - The `Deref` implementation's `SAFETY` comment for `RevocableGua=
rd`
> >> >> >   is refined.
> >> >> >
> >> >> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> >> >> > ---
> >> >> >  rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
> >> >> >  1 file changed, 18 insertions(+), 7 deletions(-)
> >> >> >
> >> >> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> >> >> > index 6d8e9237dbdf..0048de23ab44 100644
> >> >> > --- a/rust/kernel/revocable.rs
> >> >> > +++ b/rust/kernel/revocable.rs
> >> >> > @@ -106,9 +106,12 @@ pub fn new(data: impl PinInit<T>) -> impl Pi=
nInit<Self> {
> >> >> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >> >> >          let guard =3D rcu::read_lock();
> >> >> >          if self.is_available.load(Ordering::Relaxed) {
> >> >> > -            // Since `self.is_available` is true, data is initia=
lised and has to remain valid
> >> >> > -            // because the RCU read side lock prevents it from b=
eing dropped.
> >> >> > -            Some(RevocableGuard::new(self.data.get(), guard))
> >> >> > +            // SAFETY:
> >> >> > +            // - `self.data` is valid for reads because of `Self=
`'s type invariants:
> >> >> > +            //   `self.is_available` is true.
> >> >> > +            // - The RCU read-side lock is active via `guard`, p=
reventing `self.data`
> >> >> > +            //   from being dropped and ensuring its validity fo=
r the guard's lifetime.
> >> >>
> >> >> This shouldn't be needed.
> >> >
> >> > hmm, about what exactly?
> >> >
> >> > Are you suggesting to:
> >> > 1. Simplify the content of the `SAFETY`, is it too verbose?
> >>
> >> It's not too verbose. The requirement of holding the RCU read-side loc=
k
> >> is not a *safety requirement*. It's already guaranteed by the existenc=
e
> >> of the `rcu::Guard` instance, so we don't need to concern ourselves wi=
th
> >> it in the safety requirements.
> >>
> >> Essentially you're just stating a tautology in the safety comment like
> >> saying "2 + 2 =3D 4".
> >
> > Thanks for showing me that Benno.
> > So we can keep it like this:
> > // SAFETY: `self.data` is valid for reads because of `Self`'s type inva=
riants:
> > // `self.is_available` is true.
> >
> > Sounds good?
>
> Ah sorry, I didn't take a good look at the non-RCU justification. I
> liked the phrasing in the non-safety comment:
>
>     // Since `self.is_available` is true, data is initialised and has to =
remain valid
>     // because the RCU read side lock prevents it from being dropped.
>
> So how about we combine that with your current version:
>
>     // SAFETY: `self.data` is valid for reads for as long as the RCU read=
-side lock is held because of
>     // `Self`'s type invariants: `self.is_available` is true and the RCU =
read-side lock is held by
>     // `guard`.

good! but how about we simplify it:
// SAFETY: `self.data` is valid for reads because of `Self`'s type invarian=
ts:
// `self.is_available` is true and the RCU read-side lock is held by `guard=
`.

--
Cheers,
Marcelo Moreira
