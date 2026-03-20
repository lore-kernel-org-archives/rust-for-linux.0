Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3964358395
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773997450; cv=pass; b=ZmZjg8JDxQ6999jZxXuWBI8H5KZdkladGAUEUhaAFhIjGG6C9YHA1tRGKCcPq61QHA1Ulk3z8j9YDfaUlfVMGGyrUHdvGA5fa4AMPQc2p3ZEVsyENLScfwSiJErxWpIZZn8+VhDl2bUywZVDK1lVpXKwhhtKmTVyPbLKe8SwE5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773997450; c=relaxed/simple;
	bh=OBrT2HOCvF81bN2aQgOzo1dzFN0RCJl+eNPvK8lpvO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2+flS+KbOQWOExgZoZ2LEkj0CRERGwhk94xrlC+VYA/ybhgWmgnpQb/QG60P0AqPBAr9UsNaCeTTOCTDRQCXkuYcoibJzBEdZODK3EpvmFEUNs7Weio1wQdgHEvkj5FHC5Df0jbN/BBMU9DKa52QaxdVjMoVqDRRkwvalBt9ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L/pbsDqD; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L/pbsDqD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so11962785e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 02:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773997447; cv=none;
        d=google.com; s=arc-20240605;
        b=Bxff7uCuHcX2elKL+yKMyi4wplYD6W8QgFSQIEbNEMP9EooB0BBvzAwaXHrSzrjWN+
         Sn6I285ZwiJqAsyMU7fnZgmd+x+hOxm/wqj4Db7A//7q9DMGk45VvW/la49oaccvH/zz
         1DVYXSogZYVjRnY/SHkp3pcyNV/ue+C5IztbOtKORtB8ELmlCqS9otbLeU3MiFQUvZhI
         etS06OENuXdzaussS7mWP51mHAP5y4V+N/9Ed5JwLcZqw/c2ac3k76JXrCRfqqqyoJBC
         52dH4XSwzIhq0xn/IYW0cfgxJNc/Qj91lBk+SP59TsVYjkYCWwwGt3lEpO4DypwUQb0T
         8B7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3eqQLpELHcejv3OL/fx6oYsUlRe+LaVZ6B/rR3DI5u4=;
        fh=c4eg9aPo4NtcTxXzCYcHGNxzL6NL3EbzBgBH0aBCGcs=;
        b=bYlSN1BuIF0e1mPN64DOnIR1ZLrMQcjBRl0sF+uSneosaOyQdh3uTiSn1A0c1XfdmS
         uONXRFWz9YmbSBj9f3nUinNU1/Xg26tfspEmKd4f6whX8xXpPKXlUAVSGk8cGeCM8o3y
         qnhkndzMGu0M8BsVY6K3JgodG2IFLfqeX4TUcdK/P6U6+9lvdpBn34pv6cqrep/8DBII
         n38K+UaaylIbSo7ZQX73BHv+fcdzWP10p9LfMCZEFfXmNWskY/4vD5D2mHMLjxeHa56i
         9GXw0SU7E0uYP/xkDv8sgIYYSNh3eo3L2FnuIqgpt1/3uqarQBqFvMpOBox36B6Eu9WZ
         +w1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773997447; x=1774602247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eqQLpELHcejv3OL/fx6oYsUlRe+LaVZ6B/rR3DI5u4=;
        b=L/pbsDqDOkVax5LPtNNRvM4OFjbDTom4qMneWVK/gwUFSp6Q5dCyYCkWMJ/aowO9Xl
         lc0Vd5YrL+6w6t3V8fW3V6Xo4lFWADNkM791N1tnAqG0POAfQnIxY9GjH3DSOkMK9VdQ
         FTlRprmBUlltOAnmDPPEzGHwvMb6k+7D6f3LpI7TDx010LjWveM5V+0WIRTDYK0agZ/F
         DFjiwLWIGcTTgaodtnBmZtJNAqjTKiwbou9f7iqweYmWJ2veRBebE3q3zxhzkIc1QnqQ
         xD6F1L+qOoAPKi9Xymn4kti8g+dhj5JMFEL8YnwUFj5MjWvj/cIemgv3A3RSEM/U18mW
         qyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773997447; x=1774602247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3eqQLpELHcejv3OL/fx6oYsUlRe+LaVZ6B/rR3DI5u4=;
        b=OaRoxzZCrHskTDUCNZRoZ4V2zWYHEGl/umptl126LM1KMMRDbkNGgmKZvhl2po3QO3
         //3vfSloMT1fYfl6R30ZpBQ2SJkuh5cIapln3RGM9R1v9lCIqzPqgFMlyWne8EvpzWIi
         pQ2+5meZcLg0VRbO8CrIZQD/9SOpZRdEUOgApyEJyLmNhw1xGO/K5NHlRFHJzrTKmY+r
         LATptPyVyeBtQRu8JEoNUyWmclAm7j2s6eHd8EBIJQpb6+hJOIg9mXwRZFb3ET0ydVr6
         JBAf79dVWcMfWa6mR1t4qCzjtuhvwZImvKHqwhe/k6VKg1Sf8ZgZQxDefZw2RIBu1bzN
         +rMg==
X-Forwarded-Encrypted: i=1; AJvYcCVZtei+P3/c1rwmA9OyLruuXHMeRHQNTpfAq9DM4SnJFINsTCpyGNo+w2TZyjIth27lcJHM8ioYUP3Vk6KTVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygLFM+8nLK/W+HuzSyMdH51gemWgBFe/ehAXZYlpKbtmv8mIFD
	FyBI1JjAKrtcKmu3bUsKmy67PmcS12JO6jZ4YTbHm6Hy7CXqPCPGvIaaYJW8qwmziGlU388TU40
	Po+8W/NOsTRVoK6fefvvckafm6B4e81a18W3WMteU
X-Gm-Gg: ATEYQzxgLWtb73RS8kRf71yYe2Fwv3uaMB8BnSVZLY4NpSxiPDQH3PKjkY3wBQgg0tw
	/RYCU6CtXGMKxkoLVR8iMkriILZ7XunPb4jwexj1rEkvC3YFOWc5xiEVbbvN9bLINpSmZvXcXXL
	oy36Ftg0wrEJfIFlzrICs2hPTDuZBGyki2FawgduTdgJq3fI5XjmIkY2NTieef0GyrYYGVGkjQY
	6Rjm7vAQrQ62hnS3UKbtcMLEB/zl5PaYD1qptOsdObbarxcJb9bnaqA6Ex+SQPcuzi+ev2+8Bpj
	civ8/XIiwoHv8yAOuUqIlnN2iFuzUxxLXsyCYFBKB5grIn5ddX6pRyfIGhE9zHO0wj+OI6Pf
X-Received: by 2002:a05:600c:ad1:b0:483:6fe3:bb49 with SMTP id
 5b1f17b1804b1-486f8a9eda0mr78757975e9.0.1773997446313; Fri, 20 Mar 2026
 02:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317225355.549853-1-jhubbard@nvidia.com> <20260317225355.549853-17-jhubbard@nvidia.com>
 <125cb5fd-55fe-4c54-bdda-0478f5a8aabd@app.fastmail.com> <CAH5fLgieAZz4YAp4-Y1240mVt2V_Pu3TJ8YZyMkP1ZG_neafwA@mail.gmail.com>
 <d766522d-ef82-4300-919c-fed89f2f04fb@app.fastmail.com>
In-Reply-To: <d766522d-ef82-4300-919c-fed89f2f04fb@app.fastmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Mar 2026 10:03:54 +0100
X-Gm-Features: AaiRm53ZZKWaeypItpmCa_ybdTpZajaUu_CFLBTv4FAiTjQIn3kgI7rk656zIn4
Message-ID: <CAH5fLggFsjciKKxv7_k6tXqL=_8JrgAVWq-+xVH1PkGOew44KA@mail.gmail.com>
Subject: Re: [PATCH v7 16/31] rust: ptr: add const_align_up()
To: David Rheinsberg <david@readahead.eu>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 9:58=E2=80=AFAM David Rheinsberg <david@readahead.e=
u> wrote:
>
> Hi
>
> On Fri, Mar 20, 2026, at 9:44 AM, Alice Ryhl wrote:
> > On Fri, Mar 20, 2026 at 9:38=E2=80=AFAM David Rheinsberg <david@readahe=
ad.eu> wrote:
> >>
> >> Hi
> >>
> >> On Tue, Mar 17, 2026, at 11:53 PM, John Hubbard wrote:
> >> > Add const_align_up() to kernel::ptr as the const-compatible equivale=
nt
> >> > of Alignable::align_up().
> >> >
> >> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> >> > Suggested-by: Gary Guo <gary@garyguo.net>
> >> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> >> > Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> >> > ---
> >> >  rust/kernel/ptr.rs | 24 ++++++++++++++++++++++++
> >> >  1 file changed, 24 insertions(+)
> >> >
> >> > diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> >> > index bdc2d79ff669..7e99f129543b 100644
> >> > --- a/rust/kernel/ptr.rs
> >> > +++ b/rust/kernel/ptr.rs
> >> > @@ -253,3 +253,27 @@ fn size(p: *const Self) -> usize {
> >> >          p.len() * size_of::<T>()
> >> >      }
> >> >  }
> >> > +
> >> > +/// Aligns `value` up to `align`.
> >> > +///
> >> > +/// This is the const-compatible equivalent of [`Alignable::align_u=
p`].
> >> > +///
> >> > +/// Returns [`None`] on overflow.
> >> > +///
> >> > +/// # Examples
> >> > +///
> >> > +/// ```
> >> > +/// use kernel::ptr::{const_align_up, Alignment};
> >> > +/// use kernel::sizes::SZ_4K;
> >> > +///
> >> > +/// assert_eq!(const_align_up(0x4f, Alignment::new::<16>()), Some(0=
x50));
> >> > +/// assert_eq!(const_align_up(0x40, Alignment::new::<16>()), Some(0=
x40));
> >> > +/// assert_eq!(const_align_up(1, Alignment::new::<SZ_4K>()), Some(S=
Z_4K));
> >> > +/// ```
> >> > +#[inline(always)]
> >> > +pub const fn const_align_up(value: usize, align: Alignment) -> Opti=
on<usize> {
> >> > +    match value.checked_add(align.as_usize() - 1) {
> >> > +        Some(v) =3D> Some(v & align.mask()),
> >> > +        None =3D> None,
> >> > +    }
> >>
> >> This would return `None` if the value is already aligned, but the addi=
tion overflows `usize`, right? For instance, this would incorrectly return =
`None`: `const_align_up(usize::MAX - 1, 2.into())`
> >
> > No, in that case it computes `usize::MAX-1 + (2-1)` which is just
> > usize::MAX and does not overflow. After applying the mask, it returns
> > `usize::MAX-1` as the return value.
>
> My bad! If alignment is below `usize::MAX / 2` then this always works. On=
ce alignment gets bigger, the function fails, though. The following asserti=
on does not hold:
>
> assert_eq!(const_align_up(usize::MAX - 1, (usize::MAX - 1).into()), Some(=
usize::MAX - 1));
>
> Doesn't matter too much, I guess, but with `checked_next_multiple_of()` t=
his assertion holds.

The Alignment type can only hold values that are a power of two.

> >> FYI, `core` provides `usize::checked_next_multiple_of()` ((const-)stab=
le since 1.73). So an alternative would be:
> >>
> >> pub const fn const_align_up(value: usize, align: Alignment) -> Option<=
usize> {
> >>     value.checked_next_multiple_of(align.as_usize())
> >> }
> >
> > That would return value+align when value is already aligned, which is w=
rong.
>
> You sure? (emphasis mine:)
>
> "Calculates the smallest value greater than or **EQUAL TO** self that is =
a multiple of rhs."
>
> assert_eq!(16_u64.next_multiple_of(8), 16);

Okay, well, weird naming then.

Alice
