Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6BF1C9DE9
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568703; cv=none; b=dL6lJZH3Siz3rfkEvExg97x63eg2xCTHwGH68aatxtN1sO0vPb2gRypofeEadygBs5KK6EOq8LpAI5/VAzcLtPphZBOywVzaZKKqrEAebhJ1ltJpUEaOv7ZiQPOth4C7PlrE0HsVyuUZ8NuOGMvM6IWFLLTYSWQkya8slEDWJ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568703; c=relaxed/simple;
	bh=AO4evWtYc5vkoEupF0sX/FiVxN2xJ3m5UkrfF9YeDio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pggSqxy9wB6GhwpkrquSHye4XaThQAvYqSs9V8ip2qXA/A3eyPvX8wQis9vuIP1WGZIyqXqpGhAkqO2Pj3hUK9/uClUzAE4iIFIMI1WToZHXavkgL0gL3VlJj2R3A5eGInG9ksazDxWw4rzrOGNTPtJVg/FLduPQoaQRQjoqbps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EFmkCOIA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EFmkCOIA"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37ccebd7f0dso586966f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728568700; x=1729173500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pjStY+T2GIcJPDPOuqwTVy+1tGlWush7jCg2DdpNaE=;
        b=EFmkCOIAx/Ijl2kYeahsq/oIwBLJF4AhBKHO0MyM4nXJy98beCylxP4Bvi2iask96Q
         geBjrJe8toTz/jmJL1tAjg4avjAQROKWeAmWoCj/53Y+w1N2GR0ndu8b8Fkxoc20mHug
         vabxOsLHG3SeND6LDTppNsYRDwh57fh8W0v97/a/j37GIEiXBg4LIDpocrtgekh3nZwp
         e0lvwdJJ6YwUw0Ppcr5bKsGeQySMJ9ToxHR/RNgsqLo+qQXerOosNnOI2tmxuH0JdCu3
         DEE2RNYg2FcV9xLab16+dXni1ps6IXnorxYSmMyTI3VIlsrWmjwseYVA74tOFEDGPil2
         RCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728568700; x=1729173500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pjStY+T2GIcJPDPOuqwTVy+1tGlWush7jCg2DdpNaE=;
        b=Wf5seztHu7S1bkoWabft0/m4gfbya59YfavgB9hZmia0+9jn4bcIJ3Kou18Amo2JbL
         /bHPsZpEa255+7BXOw8Kr3WpJyB2P9+kf8G1O/z2Dlg+SpBWEN5gdDrFP8B9mz2Zr1hx
         33e6aU0pE1wT66QyoZMn3D542O6SL3DrkwtpEDCy4BEfBHOfFO8d3+U0N/9tUGejH5L4
         TRU3Du8x8uv8PoVHREakuQ6rT5R/eI7Fj5N63rsY1+PJGHZycMabMLnUYhWQb54nIN6L
         W+FA/fQqTEAZq24pfk3C9itpdAp/uVuOx6Wj0DZ32M9iuCMwNGEP0lCr1gsIKqJ3u+bc
         i1Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW82ZeXOWHVcFSU+/JMj0e+JUKsTyhV4mYJ+vf5pjnGLPn4jiB0ppWVPHktQPCRJ/jMPE7XO2nR2160+MtCDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx26cwydnbJ74H996LB5v2AQ9FgGrcPcTf5wq9yIj4dKrE5Tj7h
	VHN1L/w6bwQIClvYvM65V6lv18sXMkMGyfsHjpVQ66ArIRqqMbirDm/9Nq5qMmRxnacyx8QMOcZ
	a3H8DWy7mnCN7U5dV8nnUabHQ0t4lhiBWDO/9
X-Google-Smtp-Source: AGHT+IFWpwAmKmvG/Ff2Ajqul4AodwdBUoP4pTOHuSxB2d2PHoQyQE/W59Z7JWA/1KNkRgbg6wNTn2QKiyE+HgfMZgI=
X-Received: by 2002:a5d:4806:0:b0:37c:d1b6:a261 with SMTP id
 ffacd0b85a97d-37d3aae6ea3mr4103963f8f.59.1728568700337; Thu, 10 Oct 2024
 06:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930-static-mutex-v4-1-c59555413127@google.com>
 <1f688070-66bd-450b-ba5d-b929de64ecf0@proton.me> <CAH5fLghsozD0qeTygBM0-WDgXRwtGcsc6B3bT1794QMx3=vSTg@mail.gmail.com>
 <Zwfcwg23tfrKIyrq@boqun-archlinux>
In-Reply-To: <Zwfcwg23tfrKIyrq@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Oct 2024 15:58:07 +0200
Message-ID: <CAH5fLgjhTWjmYqxcTRRv6FTpv7Vg9nnVCGGWbSKPqOSjJ5XyQA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: add global lock support
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 3:55=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Thu, Oct 10, 2024 at 12:53:00PM +0200, Alice Ryhl wrote:
> [...]
> > > > +#[macro_export]
> > > > +macro_rules! global_lock {
> > > > +    {
> > > > +        $(#[$meta:meta])* $pub:vis static $name:ident: $kind:ident=
<$valuety:ty> =3D unsafe { uninit };
> > > > +        value: $value:expr;
> > >
> > > I would find it more natural to use `=3D` instead of `:` here, since =
then
> > > it would read as a normal statement with the semicolon at the end.
> > > Another alternative would be to use `,` instead of `;`, but that does=
n't
> > > work nicely with the static keyword above (although you could make th=
e
> > > user write it in another {}, but that also isn't ideal...).
> > >
> > > Using `=3D` instead of `:` makes my editor put the correct amount of
> > > indentation there, `:` adds a lot of extra spaces.
> >
> > That seems sensible.
> >
>
> While we are at it, how about we make the syntax:
>
>         global_lock!{
>             static MY_LOCK: Mutex<u32> =3D unsafe { 0 };
>         }
>
> or
>
>         global_lock!{
>             static MY_LOCK: Mutex<u32> =3D unsafe { uninit { 0 } };
>         }
>
> ?
>
> i.e. instead of a "value" field, we put it in the "initialization
> expression". To me, this make it more clear that "value" is the
> initialized value protected by the lock. Thoughts?

`uninit { 0 }` looks pretty terrible IMO. Can we come up with something bet=
ter?

> Besides, instead of a "guard" type name, could you make a
> generic guard type over the "locked_by" type? E.g.
>
>         struct GlobalGuard<L: GlobalLockedBy>(Guard<...>, PhantomData<*mu=
t L>);
>
> I feel like this could make the relationship between the guard type and
> the locked_by type more obvious. But maybe there's something I'm
> missing?

Sorry, I don't understand this. Why is the LockedBy type relevant to the gu=
ard?

Alice
