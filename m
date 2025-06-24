Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DDC2D1926
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 12:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767347; cv=none; b=lJwWWoLRLt+twcn0jeY4nqi22TJDpTOAfNB6GU+IPUOcOY2BbvNvDhrcoo/iaVwPcqcQkt/uN4NFnB2UFafCqdclDrpNyhx+KWQoHpMJFvk4yzIdxwcbneJGb8i7LtRDpKbqNtOVay3XKVr0zEF5nRd/Ojga+eNmnb101MEBo4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767347; c=relaxed/simple;
	bh=NRepsZpu5+Yf5TQ1kTE/0hFpwzxb35mUBOyr/OXyPDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izXkTjRTQW01mCg1lsUtgLWNIxPtO00b6I8v9ZIGfwcxNNTKamXR41Kk0hMdOmsylfqoR9Zh3sXj+2mYOPeMYW53MJjKKQOVZgM0khB3NLLATTKHYvY3qNXv5P5GelEfA+14IuQ/+hXQ7QghsFrimHUPwD6kkSRm7wdMSYA2Amc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wlFkp2s8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wlFkp2s8"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a588da60dfso3163281f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 05:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750767344; x=1751372144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgIQYI6cjVDVnnSrpu3BxZ3Yf7K/B5NVQRkTTMG6gb8=;
        b=wlFkp2s8Dif1kaF3mZUXhOxHU2utMqP6OisRKuqWd5Kc/hoDTbeYVFhbzgEyubN2V0
         xs3zkUgFaktP3b4s4Sa0laDuM9QNSN3RykHJLu9bfLPtK2LUdJ6E3hpsT3mfAzRfu/YE
         dUwDK+xEXENqMrSFwJef7dcTm6JRiZF9lkqY5QopQse/C44D4/mMaDaBINL33Z4ZIhrJ
         cISoL/atudU/XBrc1lBmQh/bij4lUGeoxMSs242uEzEzt4BCDrlRxsRd0lFLAW4eaTWb
         ivAHQNio0LEL/rSi5DIuyBO3Ev1xd4ETxWflKGKUz/ghVlbOAgwC4xfJczZuFLoxSz/d
         t00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767344; x=1751372144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgIQYI6cjVDVnnSrpu3BxZ3Yf7K/B5NVQRkTTMG6gb8=;
        b=YzM/Xr94lc+5ansbFcJ/aK2OVsLX/jI6ORjFiXWIZJrmOynGPFiqlzEJxRYmehpUg9
         3leVeh5bsxZTG9OdiUR+JcOQP3s31mRScBq+Le5D+Kojlx1J3ZrM5FL0fVpOViPI/a17
         aT9yN34kkte30YKb1p8DAU18IdmowLGST5kvvvpuIohHZgfp6lAlGirHAn4LG6mdvdyK
         2So1Urg2v4gsDDPOw/7A9xxvLOlUjhl7uoBqsPD2FAvDXqCp4Ng+pzg1n/2pX3zSi8Zi
         wWxkfu5HVaml7wH8MRGTPoi3rXm779CO0dfzHGmBVyQ45ZnsVcNOG7dLKwfNw4vwoEnw
         5uGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWXjdErTzkopOM6CNz+AY2jeC/rIB0zPBUryydDwHgf7vSYOaqXfMOdqhAOj3ToDKKK+cdSP/HaTSiuvhUXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxStQrm10QzWUIwRgusSi2v/NcBKI/aJU+0gWN9Ti3HDZpVMHpM
	zYbwXEljuhTV37qmxp+7Bjr1pYqQEXzATjhrfT/RJJWTJGh/7JeY/U1nX/1mAj4fQAW68GpnrSo
	XmiG0KNrDcwOXgc2mA7LnUGjGH96mcBkEQA/ww/6j
X-Gm-Gg: ASbGncvdtv5DiLvXD7YHEWR55XNg4136bU8ODM1LtjpuuGDUKaD91gWK5myn3ejp0YP
	L0JDm99/E3yY7UBYm93ElIkdgjaotchY4eHMfibeSwK/NqLjFR2Z73/j0hcO6o8/2qqGcRtX8ao
	CiNl70fSw5ggi3+lzFUJCwtnsYQYOd8gDz1lRjsK5LkiOaeSHpymy1xAsaoAU4GBo4JrimG83t
X-Google-Smtp-Source: AGHT+IEBJbwFowoZZTD/1y0aHQeGzln/iSEJbdEQX4Q0YwPXUEFQyxTs/Zyn7A4yU7Z9p7xT6DWMb6EljFgZU32Y1LE=
X-Received: by 2002:a05:6000:178f:b0:3a3:7987:945f with SMTP id
 ffacd0b85a97d-3a6d12eb327mr13259630f8f.57.1750767343931; Tue, 24 Jun 2025
 05:15:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72kSfHTPeRQjhHKhdw8zuozvNy50CJjTuEbUnW_3j9x8tw@mail.gmail.com>
 <CAH5fLgggDKUwmU3oCTMS1dQGzA5Whp2fnXoLmbGmNF1W89Ar_A@mail.gmail.com>
 <CANiq72mBfTr0cdj_4Cpdk62h2k+Y5K3NSs54_1-9jiszMZ6AuA@mail.gmail.com> <20250619.160844.1477802332578239775.fujita.tomonori@gmail.com>
In-Reply-To: <20250619.160844.1477802332578239775.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Jun 2025 13:15:32 +0100
X-Gm-Features: Ac12FXws5btU2oFkkv4uKO_j5CDSLeTEtnWC3N63vZCngd_EBMYAq0yhHAs7Zv0
Message-ID: <CAH5fLgjJRbjPnN58RuaBtNrY1A-tif3ohETLxdbaE4b46Hjbqg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@kernel.org, 
	alex.gaynor@gmail.com, ojeda@kernel.org, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 8:08=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Wed, 18 Jun 2025 17:47:27 +0200
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>
> > On Wed, Jun 18, 2025 at 3:17=E2=80=AFPM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> >>
> >> There are also methods such as Duration::as_millis(). Yes, those take
> >> &self but &self is equivalent to self for Copy types, so there is no
> >> difference. And even if we did treat them differently,
> >> Duration::as_millis() is actually borrowed->owned as the return type
> >> is not a reference, so ...
> >
> > In most cases it may not matter, but even if taking either was exactly
> > the same, the point of the discussion(s) was what is more idiomatic,
> > i.e. how to spell those signatures.
> >
> > I understand you are saying that `Duration::as_millis()` is already a
> > stable example from the standard library of something that is not
> > borrowed -> borrowed, and thus the guidelines should be understood as
> > implying it is fine either way. It is still confusing, as shown by
> > these repeated discussions, and on the parameter's side of things,
> > they still seem to prefer `&self`, including in the equivalent methods
> > of this patch.
> >
> > Personally, I would use `self`, and clarify the guidelines.
>
> So would the function be defined like this?
>
> fn as_nanos(self) -> i64;
>
> If that's the case, then we've come full circle back to the original
> problem; Clippy warns against using as_* names for trait methods that
> take self as follows:
>
> warning: methods called `as_*` usually take `self` by reference or `self`=
 by mutable reference
>    --> /home/fujita/git/linux-rust/rust/kernel/time/hrtimer.rs:430:17
>     |
> 430 |     fn as_nanos(self) -> i64;
>     |                 ^^^^
>     |
>     =3D help: consider choosing a less ambiguous name
>     =3D help: for further information visit https://rust-lang.github.io/r=
ust-clippy/master/index.html#wrong_self_convention
>     =3D note: `-W clippy::wrong-self-convention` implied by `-W clippy::a=
ll`
>     =3D help: to override `-W clippy::all` add `#[allow(clippy::wrong_sel=
f_convention)]`
>
> https://lore.kernel.org/rust-for-linux/20250610132823.3457263-2-fujita.to=
monori@gmail.com/

Are we missing a derive(Copy) for this type? Clippy does not emit that
lint if the type is Copy:
https://github.com/rust-lang/rust-clippy/issues/273

Alice
