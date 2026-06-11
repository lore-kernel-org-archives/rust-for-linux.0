Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8A5367284
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 05:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154597; cv=pass; b=n+NnkpW6rmZ2TbFKsXdigqJCI/r2qe3kHyUCkAGugUlGJ4HZ1Dk33OhWWT1hfCavAtVGmIxgebvvns2KjG/JJxPTqe7tiobJ0j5d0s/1g86XJ2hgOT6FIFW8aLRqMuB944OWWucE0Wlys7STRUUxtvRSdmeYQ5aHp+pF7KM9s+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154597; c=relaxed/simple;
	bh=8CQLlPE10gtfc+80LGNUmW64kb5+lwCt/hJuXkDKz8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zt36tYqgyQXYWMZcoAstv58t0JRinmOIIRJwlT4p7cWe2Xp4PQis7k+p4Ot+5UM5LzXOTz/l/00pStQefn6QQXf0IGM98B7RiQs4qVHi2fdrmiNylysNL9D0QJijip8mwQq5OlqDu4MTHIP1r14MCIyPMoL80nGh3HwY2kReu7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtQLiKW4; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtQLiKW4"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304e86ecebfso498266eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 22:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781154589; cv=none;
        d=google.com; s=arc-20240605;
        b=gm2MQjj8KtzDkCEIoWFnlRp/KR2U05ossmvJc7wvumEo3YhRDiZyUkfTWn1rxnRHbX
         1tAsYtgWTIof7pho+D2nuCLsqcaGDVVgTcOMRWFoHrzKM6i6TvJNq2twSB6tIcfitGVn
         pRZEEFMg+7LCGcBGs3hxD+l5MRBXFvbcktnPjELtYtous78IYa8PA+GWZk64yLh5sTBL
         eadflY0tzdzDLO6WDudn1/8ylHLqRrFQ3eMnwTTbLB3IdAYFJjEusl3sEzmMlsqvUmcw
         abpRh26IJyCi/9Gv7xpuNB520aweLL+qN4hiD43C8lbSZvVD0HV4zo/WRl2gq852zRiL
         SBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lyFerlgaYrMaDYJQQ4DjXG7o7AcnUs9BuBitZg+XRxc=;
        fh=FLCpkLPfxWHO9bybSzteNz6MCKx9S+kHDlSshBiUg8c=;
        b=aAJ2kbw9qKQJFmm7VWIGceAQsNh+n6xoM6rV6K+IVk820p2v04VLioP8hxASoHrMam
         AmKZwug2ogd/Uj6jyq66ga72vDqacHWzR4r7DASsRkte8ON8fmi3H+plyqIvnByikIDS
         6oWpB8Z8YP0vmpWr+YG9WHh/ovDFoWqAYljhZf/UkXa5SRBE+l9LB5ysyewuHHxth9R4
         XkOtBulEDk57TKom5UJF4remDS3PsjZfkq3ehu+AaPNDVpgTBk5LInvjaFxyn0Qu0wOb
         NEcVm35y8sRFVZpr4zPI9NyfV2jGZaOgw5Pa/1mVJFdjbGUBs+n/GAvwrQOkL24FHdrx
         HHHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781154589; x=1781759389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyFerlgaYrMaDYJQQ4DjXG7o7AcnUs9BuBitZg+XRxc=;
        b=UtQLiKW4tTBKMw+OQuNmmkVJJzoLOkse3Iw4sdyF7e2CbCnHCnoMBK1wta58381gLO
         98GBR/RnkHuzdRQvH72+jx1jDedWTXYJvP+hhBfoWywh6VB7LMaZArWiIN1ZcUkoJy+b
         89uV0nzni/DjLhNe0Ar71Gtr8k5AYfSRF23+eb5ZxdVGLzdpe5zB7kWB5VlWUm0lGj1e
         pRC61BcZDDHH/fwtULK8B9Mqra13T0+jVxz75E0iKPK/USdq1tj8FO08Esr/D3bKaGOn
         nKCsVsNxJsuYuOWjmGUX3cEewTpAyXkKGt1fk3/0kjz7MyTtfh+sUfGFNUSJjaGKlcuG
         enbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154589; x=1781759389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lyFerlgaYrMaDYJQQ4DjXG7o7AcnUs9BuBitZg+XRxc=;
        b=fqB7MD4ccaWVZO6Rlig8mHAiHQydZi4bN4/Van52j53DcjKnS7MOF8hDz2zpow9ZK3
         e4nE9IYh28oERsbKXW8+AffidwEMAlel0Xvm3qCZuCox/WlQg/TZWnGS9+n75vhBGwNk
         OmWDcLKg7HKJeZ3Fc59H/Zoqpsl5isD901ZRKrsOpOSB+OOrS4AAa942MgriiHkynLPz
         W/wDwoyNcmncgPy9yOeLwAbMgMZdy98sIF/2OteisYvT5LJUxXSELeYBavdMn6SSpHRd
         NMYTcMCkJ21VwidY9tQmw6Ms5YPq8CuOl0Oi+y90knad/gM8fhWXvW7WIazfKWkQ6QgS
         Z6TQ==
X-Forwarded-Encrypted: i=1; AFNElJ+z4oUn8rtDpVBWs088q9R8TXx25ai4UbgvgXTS19sAffLyc7yaJUKwnB7EL4ZRTQzggUMIDD3hen804NRhGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLWDHOeX32b/XGCNNDIRzfJcgVSXULcAMgyhHk2jqeawWvwIFF
	EDjM4ZEll/VH0Jx4dOcGMnoQZnL2vJkTjQ4cIoZBEZAVis58Q0VqlQggBkuWhkQMv0n6gixu4oe
	7Ec5mHLWLVo6dHVN2vMBFUeJOUErLyYo=
X-Gm-Gg: Acq92OHbl0dNi2LxV5KroBJU6R5wytrcZs0dxeZ6t5lMfL41HIR9zQUFZmZgfA9kVMR
	vC/++vfu6k56QAsT9CsnBORvLijuSQUERaHlnNcXeh7EHsWvuUSBV5nitw8Ck+dD4lBv2Zw3Cgl
	dKvCYoSAka2xMei1MflIkFA8BzX/+TY/asCLiukMFXnL/HjYrWaETF0g5Sw4e1akEYRGzEge8jx
	q9Hm2ev9xRZtNvt5xukrqm6Wa7P3cH3n/jUP9bsSvC0fniVUbAwoAD9ABMu55rMTuf1wrEOREso
	Xjab5asPCFS6aVTfRiLMjMLQ5C7pIEHlfQC6jLs3d1uK8nPmyeU4lxOSRg6MKLLmyEG1OKJ0ZXC
	BLcusOMjpkjKisu/BKF8gO6BxkCKxhXqVv8fQYEmFaDSz
X-Received: by 2002:a05:7300:aca2:b0:304:d700:1e90 with SMTP id
 5a478bee46e88-30804a5f5e2mr536231eec.3.1781154589390; Wed, 10 Jun 2026
 22:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-io_projection-v3-0-c5cde13a5ec4@garyguo.net> <20260608-io_projection-v3-19-c5cde13a5ec4@garyguo.net>
In-Reply-To: <20260608-io_projection-v3-19-c5cde13a5ec4@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 11 Jun 2026 07:09:36 +0200
X-Gm-Features: AVVi8Cf920yVhFg_hQqFb2LNc7XWN7dI5ldNW7tmfqMVwtmKAogJd1U0zilXmbw
Message-ID: <CANiq72nLZPG_Cnf+R5B4CoxzbLpOWy39A+hiVtetDD7zT6MgRQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/19] rust: io: implement `Io` for `Either`
To: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 9:59=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> +/// General purpose sum type with two cases.
> +#[derive(Clone, Copy)]
> +pub enum Either<L, R> {
> +    /// A value of type `L`.
> +    Left(L),
> +    /// A value of type `R`.
> +    Right(R),
> +}

[ A summary of what I mentioned in the call yesterday so that others
can see it too. ]

We had `Either` in the past and we ended up removing it in commit
28753212e0f9 ("rust: types: remove `Either<L, R>`"):

    This enum is not used. Additionally, using it would result in poor
    ergonomics, because in order to do any operation on a value it has to b=
e
    matched first. Our version of `Either` also doesn't provide any helper
    methods making it even more difficult to use.

    The alternative of creating a custom enum for the concrete use-case als=
o
    is much better for ergonomics. As one can provide functions on the type
    directly and users don't need to match the value manually.

We also wanted to try to get developers to provide more concrete
enums/names for their use cases, instead of using `Either` whenever
they may have two symmetrical values.

Anyway, if we want to re-introduce it, we should likely add what we
had when we removed it (possibly just reverting the commit), which
included examples etc.; and probably add in its docs some guidance on
when (and when not) to use it.

Cc Benno.

Cheers,
Miguel
