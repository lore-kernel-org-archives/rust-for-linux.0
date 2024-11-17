Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC87E823DD
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731868617; cv=none; b=m1KXBlkycv70HHamw4pKeltJIujn8MlsAoe5hClxfr9H/YQ61urrkBbU5+DY2SGeWyRDiJh4sQmk/Q2TmcMuIjU4hMwXcZPfXAsjTY+tC5N1sGq7bf0jF0idoEEYupMa6h11R02eQVkNnaBgDVskRV+ZKZGtvp81Qo7crggPu2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731868617; c=relaxed/simple;
	bh=3UokFgwhumeRP9kaO+uRDoghuZXfw2s87/UmNF8rWqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=he5I6PtxZQ/uq2xBTN1acx1Zf5Eth+UNKQKXpMpKkbbXVIwteTqgd/vwPaVOuaxPHOFrmUivFCls3O9dKJ453Ui/aT561uQfTNIU8e+uyhPlXJnywY/Ilt6vNqkiYC/5QqEmY1q/xwxgL+fx0sQ2owrdydYOYR6KTYQvsZTk2wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=bv3IFlyp; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="bv3IFlyp"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5ebc27fdc30so1560718eaf.2
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 10:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1731868615; x=1732473415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXwnPhUICWBfQTIcsT0NdWCMEKdZt802ELIZpglqTIY=;
        b=bv3IFlypzwyhz6tkkZo1BXbvT0EBC8BJB10NVMTQh4rviJOTgdTzbedRFzgk89fcel
         7usQbM4Nj4mYHAn7F9noWkl8LxQTq1U3MxPPcl177XwVZ4beZzdthiytMek8BAdz8m2B
         Ew7kRbNQKrzfm3RC/Aso1joQMijBpxq+cc3eSZZYY1yChrspg5fdu6H/At5xT6/fePQ1
         3l0JBAHpAXxIBWve0kvcVnPq4HiPhFmAPPVfcEsCFNle+tuubvChYl/xQrXmcJX0OFnb
         MUlZOy9+LnIHxhtYoTQq8S4o2scsxDb3F2TqLIHGOBpTYIO5Da82Lm853iCiXJwD5iJs
         FU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731868615; x=1732473415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXwnPhUICWBfQTIcsT0NdWCMEKdZt802ELIZpglqTIY=;
        b=CpWFU97RlvifCMKzbEiuR0xxL0D2reYdlUWYfEOaTP4cFuYo+9xvRZKlalEU7hezSi
         bkt6if4Ism93Vwxkdy3dzdWz6wX5aOBhB7Jc4rolib5/AhSvGcWLMzY/nO7Q0BNQDSqw
         h5SP4ljYVbrLQ3vOqH3/7ecBbbGEHztpLhUZbOnERahZtGnsh5tc0exaj7EB0qqPrXum
         AQfIxqUwx2XIt6WFjGB45rZRFOD5TRKrWRqA4U/H8x1hozdJKidLiX5vaIRL2fgkEGan
         kGc/gEibMN1T2wqJQYwxLqfLkIr835pr/mKNIZqkYbuyUBnu8NROuXBtkPcuS4qiyNk/
         7eUg==
X-Forwarded-Encrypted: i=1; AJvYcCXhX6wfHwnpG7WC3SpK6htgH2owTLFDzMfUp2UVBcQM7AFWjwSipC6DeeCdAOVZoj9UxJ2whJr0ibsZyvL0jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgPc2MOpEKi44SZMm+gDlldA6rfUpnh8YcJtKKHuzsO0+XDTlV
	fOJZnpAFcd0rxjoS2Fp392FWSobcxKRQXDTf5cUD38l5/UWcDmU3QKGFzmJgamiEM8Kxj0YK7oY
	+mK4oN9BLIzGYEGeQcOW0tEycYGWYnLennXqR5A==
X-Google-Smtp-Source: AGHT+IEq98nYwCt+XeVBDZYrl/Lsgx9WK+Udh3AbGdOoAEzXxLstEfDJ4XS6Y2r6f20Uz/2BnsiwY6wkFMxok7Ivr5c=
X-Received: by 2002:a05:6871:a903:b0:296:2c8c:727d with SMTP id
 586e51a60fabf-2962e1fc735mr6352039fac.32.1731868614783; Sun, 17 Nov 2024
 10:36:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116195221.373332-1-daniel@sedlak.dev> <20241116195221.373332-3-daniel@sedlak.dev>
 <CANiq72ndAQs4EyY22pAJdjD2x+eXsBJGYXFebuVj_zD77nqfYg@mail.gmail.com>
In-Reply-To: <CANiq72ndAQs4EyY22pAJdjD2x+eXsBJGYXFebuVj_zD77nqfYg@mail.gmail.com>
From: Daniel Sedlak <daniel@sedlak.dev>
Date: Sun, 17 Nov 2024 19:36:44 +0100
Message-ID: <CAMFZ4eQQELStY48SLsRzm3BkKOs6y8AOnQ1A27HjHAufeEiD9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kernel: rbtree: replace unwraps with functional
 programming paradigms
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 10:28=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Nov 16, 2024 at 8:52=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev>=
 wrote:
> >
> > -///     assert_eq!(tree.get(&10).unwrap(), &100);
> > -///     assert_eq!(tree.get(&20).unwrap(), &200);
> > -///     assert_eq!(tree.get(&30).unwrap(), &300);
> > +///     assert_eq!(tree.get(&10), Some(&100));
> > +///     assert_eq!(tree.get(&20), Some(&200));
> > +///     assert_eq!(tree.get(&30), Some(&300));
>
> This looks fine, in the sense that it is simpler (less characters),
> more explicit for the reader (on what `get()` returns) and avoids the
> `unwrap()`. Plus some examples of the standard library examples do it
> this way too.
>
> However, I am not sure we would necessarily want to do it in all cases
> inside `assert!`s. After all, `assert!`s are already panics themselves
> (in normal code, and diverging in doctests anyway), i.e. it is
> something one would normally not do anyway.
>
> When I suggested this, I was mainly thinking about other places that
> we may have `unwrap()`s in example code that could be easily
> misunderstood for "normal code", i.e. places that should probably use
> `?` or handle the error somehow, like the one in your other patch.
>
> So I am ambivalent about some of the other cases. On one hand, it
> makes some tests noisier. On the other hand, it may help to show how
> one could do things without `unwrap()`.
>
> Thoughts?

My reasoning for doing it this way is that people typically tend to copy & =
paste
code from the examples (citation needed). If we leave the unwraps there, I =
think
we can convey the wrong impression, that it is OK to use unwraps and this m=
ay
be opinionated, but I think=E2=84=A2 that examples should also tell that co=
de should not
use unwraps unless the programmer has a really good reason to use them.
Furthermore, unwrap & expect can be used on both Option and Result, and
since there are calls to tree.get(=E2=80=A6).unwrap() I wanted to disambigu=
ate
it a little.

But if you think that it is unnecessary, then I will only tackle the
previous scope
of this issue as you mentioned.

>
> > -/// *tree.get_mut(&30).unwrap() =3D 3000;
> > +/// if let Some(element) =3D tree.get_mut(&30) {
> > +///     *element =3D 3000;
> > +/// }
>
> This change looks wrong to me (not equivalent), because it is changing
> the semantics -- this one continues if it couldn't get it, rather than
> stopping.
>
> Shouldn't it be `.ok_or(E...)?` or similar (or `EBUG` if we had it,
> like Rasmus suggested) if we really wanted to avoid the `.unwrap()`?

You are right, it probably should, I will check that and try to incorporate=
 it.
>
> By the way, please double check with `CLIPPY=3D1` (it warns); and if
> there is a new version, please Cc also e.g. the author, in this case
> Matt (typically one would see what `scripts/get_maintainers.pl`
> returns).

I am not sure, whether I am using the clippy right, I am compiling with
`make LLVM=3D1 CLIPPY=3D1`, however, no clippy warnings are triggered.

```text
clippy-driver -V
clippy 0.1.82 (f6e511e 2024-10-15)
```

Also sorry for my question, but which new version of what do you mean? Clip=
py?

>
> Thanks!
>
> Cheers,
> Miguel

Thank you for your valuable insights!

Daniel
