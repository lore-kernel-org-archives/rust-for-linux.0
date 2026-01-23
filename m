Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49536824BD
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181044; cv=none; b=LRimT0pTvAnS790QDD3zMQtgc+wmzIU1W0Pg95SklMhea/aEdfL0pwP7BUYeUcYpqge4xnCxQEkn+PNcYyMvimPppbD+qn/BnqulvbKk6h+LVZ1vo2aWYfy5JKbBLEj6e2REHYoCivN7G+pvb5Nv6yOch3cdB+rLdV7hhC2GDxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181044; c=relaxed/simple;
	bh=4OsFK1CRG1Qo1SbM61rKFAj76v7HybmAv+dlBTL0NZ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eW55TXXVwAOeAkyRfgnVYgFrZlfdhIcJTTvp+MxMjb1DD5wHrLKfPvpuSpcPgq2U7xvVF+B6xmEssj/n4ylT3dZKfcUf+GT/hCdui5yaPLEroq1Ma94fAicfmxtdxqmCDQWaXK+q/6OuoQYcpzgd+0AfPktKmKFK/DkwyezCGvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UnYUIlCn; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UnYUIlCn"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b8838f4c392so266555466b.3
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 07:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769181015; x=1769785815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQ4w+Xy6ndskoNLeBRHiNM+vemoopb+vyDpfNKZnh6E=;
        b=UnYUIlCnFx4fhubRzhbV7gmbUCUKOodaxNxiPZrFzHs3ou3xyby6Ttmi9S2JwzjbLu
         G2Ntm+DK+mFT+cqqfBfGUauEeOYMHtcm3c+ei6wh2kqShlrFwyMQXVlRWeGqpDSVxqLH
         /e35qqYFZgu6QdkXB4Ucli7HUvy5MqRwiL3IuwqxWsRUULbWEsIaPuBWm6V2Lw9ipAoG
         weWB9dk6oo+s9sHyof9TIDM3GL/MuZ94C+KXezX8h3BtZMayzTEfy7tcgtnidhemWHoL
         xq7v/keutje50SJzgp3xya1xEPI5KOgj+vwALoqsxyk+HF6amD7gQQsNNVHZpYF4gGxW
         A6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769181015; x=1769785815;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oQ4w+Xy6ndskoNLeBRHiNM+vemoopb+vyDpfNKZnh6E=;
        b=pR2TxGipC2OYyZgx7s5599pAfxBs5TH+DzDDdGheOYHNMFopoajhhHw6czoBgnziTP
         hRRUg82RXBL4JJHdvNNjc0ZSHLPVvncbAJ9IT8y7drNTwq4U3kq9IJyY3emCHQmNkmIu
         dS3CzdhOGBq9aZHG1Yw+swj1LtaZlhfIxLPHXL0TruNrVwB8UlIVWFOZaTvWQKlx4SZN
         GsMUstfUf+9gN81NlOVy46ceMMZ9zWITOu62SiDSgT3dPIYWBw7qC9EhDajfv3zGhFZN
         F+QHx28aDWneZeucIAPC3KuEASJDhDhTgsQ7YV2V2FeoEZpeuQye/VSVsRnZJAgP64ZO
         82EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrqG3VD6aeqtERdgLrbAdO2Sz2LVJcreD747JHQOJYzNRmQ01Kl8sUKaMgl6nAprwl1ZMcTGkmn/RiSSj90A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/CVqZSyW3n2Prp9a3hfHhBXopo7I4uHpycH8HShk8TmLyrM8a
	F9IHI0f0Z+UYHSgaZTwwGtEWFOO81rmP4eKOP1ME8rXCpW6iXLjGezqGDb9+qFNz2f6GIOll6gg
	kWChB9x1htPQARI90Cg==
X-Received: from ejeb5.prod.google.com ([2002:a17:906:1945:b0:b73:737b:c33c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:4787:b0:b87:fc5:40bd with SMTP id a640c23a62f3a-b885af085eamr251570566b.65.1769181015666;
 Fri, 23 Jan 2026 07:10:15 -0800 (PST)
Date: Fri, 23 Jan 2026 15:10:14 +0000
In-Reply-To: <CANiq72m9Nq-Wonw57Nwk480CTCmoaDk-_rTLX-dFrqh_N+eyfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
 <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk> <DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org>
 <CANiq72m9Nq-Wonw57Nwk480CTCmoaDk-_rTLX-dFrqh_N+eyfg@mail.gmail.com>
Message-ID: <aXOPVkAQGr0lEfml@google.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Mark Brown <broonie@kernel.org>, Deborah Brouwer <deborah.brouwer@collabora.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 04:01:42PM +0100, Miguel Ojeda wrote:
> On Thu, Jan 22, 2026 at 8:46=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
> >
> > If I run 1.85.0, I *instead* see the following ones from clippy:
> >
> >   CLIPPY [M] drivers/gpu/drm/tyr/tyr.o
> > warning: operator precedence can trip the unwary
> >   --> drivers/gpu/drm/tyr/gpu.rs:51:13
> >    |
> > 51 |             shader_present | u64::from(regs::GPU_SHADER_PRESENT_HI=
.read(dev, iomem)?) << 32;
> >    |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider parenthesizing your expression: `s=
hader_present | (u64::from(regs::GPU_SHADER_PRESENT_HI.read(dev, iomem)?) <=
< 32)`
> >    |
> >    =3D help: for further information visit https://rust-lang.github.io/=
rust-clippy/master/index.html#precedence
> >    =3D note: `-W clippy::precedence` implied by `-W clippy::all`
> >    =3D help: to override `-W clippy::all` add `#[allow(clippy::preceden=
ce)]`
>=20
> I took a look at this --  Rust 1.85.0 extended the `precedence` lint
> to catch these, and then because it was too much, they split part of
> it into a new one called `precedence_bits` which is not enabled by
> default, which landed in Rust 1.86.0 (and is not in Rust 1.85.1,
> sadly).
>=20
>     https://github.com/rust-lang/rust-clippy/pull/13743
>     https://github.com/rust-lang/rust-clippy/issues/14097
>     https://github.com/rust-lang/rust-clippy/pull/14115
>=20
> I see others in the kernel have written similar expressions with
> parenthesis, e.g. for Rust in `ioctl.rs`, and I see a ton of those in
> C files too.
>=20
> Personally, I don't mind seeing the parenthesis, but I know others may
> feel like it is obvious.
>=20
> Now, seeing quite a bunch of parenthesis for this in C files, from
> kernel devs and crypto stuff and all over drivers and so on and so
> forth, means others definitely do not find it obvious or prefer to be
> explicit for extra clarity.
>=20
> So we can just clean this one up and later enable `precedence_bits`
> for newer versions. Or if we decided it is too much, then I guess I
> could allow `precedence` on Rust 1.85.0 only.
>=20
> Cc'ing others in case they want to give their opinion.

Having a lint that happens on just one random version is inconvenient,
so I think we should take at least one of these two actions:

1. Disable clippy::precedence on 1.85.0 only.
2. Enable the clippy::precedence_bits lint.

But I am ok with enabling clippy::precedence_bits.

Alice
