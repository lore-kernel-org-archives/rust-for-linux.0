Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95484A23
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761664366; cv=none; b=DjJGkNQvUm94SvWJf5n2M0gvcaNFZOZrCBkjLF+Bq3yZ1Wk8PURIzg4HIsn5Jzzu5ukYhHYwjLNTvKvK03W+RHAWVdu8M7Si2ieGgAJQg00q078J+ijWjo80uOkaxbM1OEywD5eax+KHFF1dQ/9+Rx7i0LNwD1A5kvy0PhGud9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761664366; c=relaxed/simple;
	bh=5snQUvhRWkb9C2jeab2EsORSQy/NoakHLRvzEAR046k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqGQ0ewurNZMUXY0fKmGJ+jiMKzfO88EcXfNYODJ+LOL96e+WZzX3TXasfFmySS4vg6o0zDVIrywYVezrSWbNPP4JW/izKXaFyAPML1aZVAMY+gZCJiOZzxi8IMuTbTHZ96Uq0v0NANyurTMObJOzufebNFKPWtU3eZuFHMWN1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKcxyVFt; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKcxyVFt"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6cf214a3ceso600225a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761664364; x=1762269164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5snQUvhRWkb9C2jeab2EsORSQy/NoakHLRvzEAR046k=;
        b=PKcxyVFtt+oUhsjAFL8E3uUOhoMFld2/GnJFxztnedI5XSkMRzGreFOVs7bdVDUWh8
         eTYLiHMqrAYr2oXBxox3CPmBylH5u4EEfFCuDOwQ9zc3iIAxDVvrpMhcZxQ+52/MHg6K
         1rZdHgtix6I2I8aJ3UkRo9jBhClJZ6KQ+sAOFAysprqyKD3AC44vgYgmXl9FbzhPJeA5
         CE33ZxJpf6gjn3yEyRbKjXl7dFwGIcH2fBXiQsiqdxbUTsxIMbwx5dLeRHkCFMhc6XJ2
         y/etP7kEkZoW8cAQTSvzx94836cNQIEc2eurfTajg1DX1OJMHXqujQu4mxSYF8IxN/M/
         uvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761664364; x=1762269164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5snQUvhRWkb9C2jeab2EsORSQy/NoakHLRvzEAR046k=;
        b=r1/fdCS1V3jr3R+L3QJhSUbU9CERf6KMH0w+SU3dc9hzhx0a37dmmX6TjKKjYt9MPm
         P8XJt3QenPGvcigZZByx76V1gmNKgEMs7/mGKHE/5/LR6wbZl/qv1ufMmlXAbs0QVJ9F
         qHpj89p8pe1qBJQzKzZ55SwM0ym6sD6XonYTKaJL5e3zrp6a0QdRvrGSzOXkmEhWYARe
         m3MCdGiU5eGKqtvRO6urF2T0sKvQ9QPFq5HyPum1avzhiIzzIavZP9XadQel5r9fDcU6
         nGG73LZ1hvifKhrXTcrP/JVQ+aCd72dbIA5RqIQ8v46w9WOtjz4raCPjyqMyXcQGoGDo
         aYjg==
X-Forwarded-Encrypted: i=1; AJvYcCUpwItwDJcSCdiF8mZugsxQQJ4giTQU1ATKVFiR8dSC49r4Jvt4Yv9je+3KQWp2OgCTU5SE6eB2X9acBvrqYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1PoivGXSnq1xQQXW4YnE8g4bbu1Bg4p+5pEz4Ns/5ISXNeEmv
	eXdEV7sHty/ODAdrjxqpKz7wsLtjjShTBTR+QY7z7pc0dPteTBbSIF86FZHB7t4YIKTADmN9pn/
	93+ivhomeVmK6u5tr1/Xrwj8THV6xRu4=
X-Gm-Gg: ASbGncuuYojiYjA09atsx9BjxgFx5O4UO7eiXdoAcQXJOJ9GiigxtccZSit127VENlN
	ZIZ5xvMsPpMHdVLwFapDbOstzRxzr7WQTYANCAHjiYHyY9wj68t2rEUsjV31iX991xpGFouNdYj
	jt1emvX7h9H/g4eawSHAjTjON41gt2ievkOPBg/yDRLttId1g3TwlC8VI0MWaGYBaBzMP7EHWxb
	eP4oCvmA4xgCbLrMFwjTLaJQ70jgkUWlBhKFBxTJGe8CbI+6F/n42L5/x2RVCyFWenAoUJeCHxD
	+668xcU5sdhe62ufb4sYB6LGA8EM3VoFJbl83RLDqOUp6pHDF0+8G3EhuTuKIRn1Fg7Q4NRrBzj
	PMpc=
X-Google-Smtp-Source: AGHT+IFYPGiAfq6Bkpv4VIZbnQ2eB25p+ZAfZMrF5Pziev/2opSXlTlA+Qb2DBeslIA+t2R0h3bM5akBnOcG/++7Z0U=
X-Received: by 2002:a17:903:8cb:b0:27e:da7d:32d2 with SMTP id
 d9443c01a7336-294cb500277mr27314415ad.7.1761664364153; Tue, 28 Oct 2025
 08:12:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-5-60c78726462d@nvidia.com> <CANiq72mgoW_TyWf9Nv=5t3Qij_dsDjicNpGsa=F1t+sg23vxSA@mail.gmail.com>
 <de796658-ed1d-41f1-b153-f3d1089656ba@nvidia.com> <DDU1AQDW78QI.1CBHEW03926H0@nvidia.com>
In-Reply-To: <DDU1AQDW78QI.1CBHEW03926H0@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Oct 2025 16:12:32 +0100
X-Gm-Features: AWmQ_bma5_85Uxd8PIaUq6SaqwUjakaAH7XUFCSDVLctaYXwoFO8A3BqGERgpOk
Message-ID: <CANiq72nbYiwFO6Vqc+yoW1-qT_uMN-CftgOpPe8Mqn56b1Fq9g@mail.gmail.com>
Subject: Re: [PATCH 5/7] gpu: nova-core: add extra conversion functions and traits
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 3:44=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> intent with the latter was to say "I would normally have done an `as`,
> but instead here is a method that attests that this operations is indeed
> lossless and safe".

Yeah, so you want that, when we see `_as`, we are reminded that this
is the equivalent but lossless of that, which sounds OK. Though I
wouldn't say "I would normally have done ...", but rather turn it
around and say "Since we want to avoid `as`, here is a method ...".

Now, I suggested a change because typically I would expect names to
mention what they are about/do, rather than how they are implemented.
The implementation in this case also doesn't say much, i.e. a type
cast expression can be used for many things, and worse, the operator
may or may not be lossless, so it isn't a big hint.

But, yeah, I understand that you want to evoke the relationship above.

I also suggested it because when I wrote the message I was thinking
about the `cfg`s message, i.e. most of these depend on the
architecture, and thus having an `arch` or similar does evoke a
"careful, my code may not be portable anymore".

On the other hand, it is true that the `u32_as_usize` case will most
likely always be available, in practice, unlike the others. So an
`arch` for that one isn't great (but I guess it could still matter for
someone wanting to reuse the code in a different project/domain).

In any case, personally I don't mind it too much either way --
whatever looks best for most.

Cheers,
Miguel
