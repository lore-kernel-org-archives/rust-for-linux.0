Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A526F302CD8
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762338942; cv=none; b=pLltCTl3IWTEVjoACjYEVVdtY+58gPUt0zqOjxFqCH0nl+CJnnxwM7d2GYbay4zi70eG5+jhC+U4W3QEc0Y1aknTV9OBL6cNOH+LOdJkj7Mee7sqX2YNNAj/3NZbQb3jdH++PwywzKefARTxAXo9jHEZq7xNi1Ac/IjXg4R0OOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762338942; c=relaxed/simple;
	bh=zWAj4hFvDlRRGvkPhQIGQzX8CaGaPgyrLkLoh9tWm+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1Rk7eDtym06FsyuOqnvPkQeff1OhcRT+NBMdGj097msH25pa7zbjeZ3wY6aVlykRUfmwvKR3S6Sl++rqaBsCq4smZjpTWbImdHkev67MieMOAuEPHqhoBJxLA/IxZSJqEy9LjbKzAK5ocHlg/NPadpd4HpYfUYfpTDBFRZwSF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DHsq0cmP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DHsq0cmP"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so6349934b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 02:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762338940; x=1762943740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SejCQHn6FNdfkG92JQnDwhlszjYVGRDiwrkxK3DueRc=;
        b=DHsq0cmP4I3p//Q6mdMFLABDZYqaEv6yXs4uhgutvdNi2u8cwkJT3pMTbmJWUULr+r
         9hi14S210qONQKIDYKaT+2lIVIYs3OKQ2KQO3woV/cA2jT0dL3OcLyvGShTkdwaYoiC9
         IaoxGhxGgS+4GqwylxD9f2STr5AOwYwJDm/S68Awukuv9izBTYAOwIPjD1r1qlGy02YC
         T0XIGnYzQVjKPEDAB4y7BeG4Q8OqXUqFgSsL5ERyQrBF1Kpw2FEWlgy77tR90/+atT7X
         WFEgVMnFbB1lnA2t66FuQkuPT0Lb2Ox63pHZhDrIAFjlz6KnfT5OyKAjka/bb7og5vpC
         iMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762338940; x=1762943740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SejCQHn6FNdfkG92JQnDwhlszjYVGRDiwrkxK3DueRc=;
        b=sZQ29bQzr76hk5yHWUSsht/ZqTCSOEMXVs0UsUv4WNgFX/QRtVx5BRYyTSp23PAYjW
         RTdQtNNtjQ/gZnxvm64jB0+gW5TG7EbwgZJQraJj1LJ2BrhXFrRCOjBnmO7OW8yM/+fe
         8ey6GJ+UuuPyqZxaDHHpGMrPDA9ToHrZ1Jc5ICukf3ehKsQ1GvGdn0H2YtTDSEC5hORB
         uqGGutX/QV8XBJCDcUySypFWlG+m8LAuGFPVZO4RYm884ZX7IR1zt0ilUYFjcyzw2tbe
         yNqKu8miFl87rDtmxDOaletvBzSgASk0OzhGNb95ZCtxbCz2Am+wuvrp0sbRTTYBacDc
         KweA==
X-Forwarded-Encrypted: i=1; AJvYcCWzPpScG/QuIElF4KuK1ilgEUwCPgltM5V79XDKQJTZzrHwTuqCF4iJqXJeH+9MZStnC02iwP/y+qRwdavtXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0mcrYKW8qku4ImN3s54G1eMSI8AIMw1GzvkNHFPfSM8Mg21nz
	8DTclVKJ3SO1Q/mR8KU6mW5MXTCN/+egdAxaNlHZsbaKIMCmdrrGlv5zyfIFLGQSeJqpM8zW4wh
	pz9ipwoS0Sjty/pf6OI8FKkFTNcnhFUgxfJQC/dWT
X-Gm-Gg: ASbGncs7cpgtHGF+d8IQVPNwmISt6t1YufIu0WWBBcj0OzPeLjsD83Bs/da0U1hIrn/
	bhAeAQF10NASq6eDPxEtYorAjjwZrTjwnyayJC58rVjNTTbXS0sbrYZQXAN4ncHAfv+E9tboeJD
	KNNvsNSNLiPEgFVDSifskUxPKICvn0wyLHtN249dHtoLzPuIzBwq7J2zuszCfEF4apPxHpmOtkR
	3+NxQk3RXU3oSJUinu7dxcZxfTVdWWHelRjAWLntei70Mv9bb3567XBlv5DxXrKBAsis6PAsCWZ
	OpBVQwGgMxEgdLpNsUQPnRwjzw==
X-Google-Smtp-Source: AGHT+IEybGBw3GCplCQbLiV49SDSJO0NJhvnpunss08q7C6QXh++ygZFwWlJuPwdqztlIgMAdxYLF+5gZrLZTHucLSo=
X-Received: by 2002:a05:6a20:2594:b0:34f:7454:b977 with SMTP id
 adf61e73a8af0-34f8620ac80mr3504731637.48.1762338939722; Wed, 05 Nov 2025
 02:35:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
 <20251105054731.3194118-2-fujita.tomonori@gmail.com> <20251105122125.5b84fa83@nimda>
In-Reply-To: <20251105122125.5b84fa83@nimda>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Nov 2025 11:35:21 +0100
X-Gm-Features: AWmQ_blQGdCSKJYU9Zyd4RvbPS86C4O_Ar0tZHIfgX5KtewHYSGEYZG6uBh4sCc
Message-ID: <CAH5fLgjyz-V7=TWU0A+Deq5VUOZNvhQYrjrreB5+dQp4w33f5Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly once
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org, a.hindborg@kernel.org, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, jens.korinth.tuta.io@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 10:21=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> On Wed,  5 Nov 2025 14:47:30 +0900
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>
> > Add the Rust equivalent of the kernel's `DO_ONCE_LITE` macro. While it
> > would be possible to implement the feature entirely as a Rust macro,
> > the functionality that can be implemented as regular functions has
> > been extracted and implemented as the `OnceLite` struct for better
> > code maintainability.
> >
> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > ---
> >  rust/kernel/lib.rs       |  1 +
> >  rust/kernel/once_lite.rs | 71
> > ++++++++++++++++++++++++++++++++++++++++ 2 files changed, 72
> > insertions(+) create mode 100644 rust/kernel/once_lite.rs
> >
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index 3dd7bebe7888..19553eb8c188 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -110,6 +110,7 @@
> >  #[cfg(CONFIG_NET)]
> >  pub mod net;
> >  pub mod of;
> > +pub mod once_lite;
> >  #[cfg(CONFIG_PM_OPP)]
> >  pub mod opp;
> >  pub mod page;
> > diff --git a/rust/kernel/once_lite.rs b/rust/kernel/once_lite.rs
> > new file mode 100644
> > index 000000000000..44ad5dbdc67e
> > --- /dev/null
> > +++ b/rust/kernel/once_lite.rs
> > @@ -0,0 +1,71 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Support for calling a function exactly once.
> > +//!
> > +//! C header:
> > [`include/linux/once_lite.h`](srctree/include/linux/once_lite.h) +
>
> This seems like a pure Rust implementation. What exactly do we need
> from the "once_lite.h" in this module?

It's just a documentation link. I don't think it hurts for the Rust
impl to link to the equivalent C feature.

Alice
