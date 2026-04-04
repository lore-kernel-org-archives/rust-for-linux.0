Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE052E091E
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 02:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775271009; cv=pass; b=Pj+ydJ+5XtkzDMWSEieI7E5XBkIBPATy2paELrvRdJxqfi0Q6I2bp3J0XB6sbNbbsG48ZObCahsMm1jxMmxmAzRSumssM41q7GA5H+BDW72ewiD1A3Ov/+1Rd2d1fuE/66oyMOZRb58XDlay+xKjZVuDQu6ifukVbjalU9PR02w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775271009; c=relaxed/simple;
	bh=eYntcnlRx5hfjc4Y4zJH1UO/0d76BmM9gICjjAjJgbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aM7e76O9j6MSUCsu84J1DjAK0j04I7o3E2PV7NaPW04xV3C3PeixZzAmsLhdIFeP3bOt+mllNSmEVI939oX2+No+j2wSYi18m5wrsSraZtBRD8jPEzYb+1caoNoYQq2ErR5a4fm/PSWbLo/uu/BtYZQAK5Pk+jb86FjkhbCNpeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdsTfFiR; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdsTfFiR"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c16286c496so92420eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 19:50:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775271007; cv=none;
        d=google.com; s=arc-20240605;
        b=KusLJ/JHabk9tfS6ybrM3k64v/f7KMGoM8+O+HIjr0VDJ6c/PjP/eU7PDMkkkMapI2
         rJgGGT9Yx4pQ63v8RIVS0GlmblK/V9tI2oa/yymVbOImztJ2tS7cvg2So9dV9Pt949I0
         XzzirdBK2IKxE2DemXQ0Z12O/A72vMDznt6RTVP6+JtC79ikkV0Qzy1SWij7WnjnBrxf
         ADtuBD1HXsKvucy0NHmUkt5Xf89grf1ZZjxHxkrRkxIFrDNBdukUqZtmmOaKbn8Ix0Ww
         bznhZvrumfKqgFTQ/t92OwhL1YfUWuAjPZwydbkk1y4EnpU4dZm35SPez1adkl4NJups
         lZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gvxwn/qCJ2mqxedj7C78P4U21URMj3glrFtg8Gv6oHc=;
        fh=5ht68m825HoWnbRS4y20sYcAFg6mUZHakmXUjGRik6Y=;
        b=B6DUDR2jiCN7cc4e06F90iGr25vM5W/oMqbBUz6fFheuFZpEhS7NmmQjAofPoBNnkO
         PTn6CSfE+4K3fCPiKMVJ8KYrGC4DjTWK60SID1M/JdihICtAQsJdr62kIQgK9m/o/DOy
         OSaUJkJPB7lVbW8VTytoYCSGR0FLnvTVTAYab3RUHZS2WcDPW+OHSLHI49F7f2VcLWGT
         qjo3ErA0w63CtglfPJcAnU+Vvn8+r+g5ns2QhnN1EpFG0KqUa5wpki25Mgzue5dHvSG3
         UHpYza4z/kYzRsVKKxyYcPNGp/gvOp9zR0URS7+Nc3gnYsAFuwGxt1XC2w4bTVH4wCXb
         NpVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775271007; x=1775875807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gvxwn/qCJ2mqxedj7C78P4U21URMj3glrFtg8Gv6oHc=;
        b=bdsTfFiRXvGh56EqVILR3sUp5r46ivcYfsglhmL1CKpRImxJis8NJP1EMLOawQQXci
         11BA0+TpqgdBamp+HG+F2gML4LttOPwtcdLsimUdmx1AVm6BY43+/TqZsgNCkDVZaz2v
         UrUfnNUNkq55VZHeE/aYjEV4fkzTV+ziocIaagbaGBDH5VpYE05ToEUi0eP5D7R2nTNb
         w6WGahaS6B2lVbEwM6jGjEO3nJYgKn3RiAgY7gzD2y20ghEnJxGE4AORzT5cPe09BVkm
         YAFWixDIkl3Tnu3muIVJM6fV2fSby5xw1xYEXXi7/EM5FrGTPRba9pITS/nhJ0MVPv9W
         m74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775271007; x=1775875807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gvxwn/qCJ2mqxedj7C78P4U21URMj3glrFtg8Gv6oHc=;
        b=DqUvX4BbDV2TmY4V11iuAxI1FLwNaEsFLneghfmUUlhyPJsoFYFlFxIITI8YFfco4d
         UITBL2WyzRwiBV4OIG1BwUxUTepm82lDfaRwEVtVg6g56DcG4AVTaw/ThSMv21DeC5vF
         JcG6OQUqt9rt4+rtg+HIgoR2PYqwe/IH9LQ6Vl93vTCnT64Rv3qe09qlANBRDOUDID0Z
         3R16agXHV1UZUELfcQoh3HD9xAzsQmo9AP7kCKYE+MX8VxnbUMynP5FFYGxvkrAEPc6/
         AagT9WCHAFHu2VlOwRbmut4cbGlwhx+cE8qsvc6cFfEANcTPs7qLleQqvwuWZ7pm0+or
         Tb6w==
X-Forwarded-Encrypted: i=1; AJvYcCUekYq+gKnVqY4EtW2zik4Ri/bSI9jVOjxeG5iFA93ERFqsUNFnRPQDVxeuYksLzbeYvZAlpO0J5Ao9NAynjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylT3SvlF5UtrSzTGbhmJh0bQvHs4Vk+N7Ok9f33IKfQQsMQ4uS
	X22PTKYZEIAduVgyD2YoP5Bw1c9YoE8U7L9J8FcaYVelK2hPBVKrU8cRnkJT2BqLw/5XpPc2T7Y
	bA4pUOdeeLZGqPHkCu1eUz6mvrovb+CQ=
X-Gm-Gg: AeBDieuGUawalk+598STWpr5O3isH8xJaajcEWqgBnbwNxQw2kb+5v+hVayH6YDu6li
	XxA6fGS91C1SGPT2aLNxt8UKD3VWfFwO4xRWJn6RF81k9/Gc78ISnqiNXbyZmWa3nU6bHgyqxPZ
	ngiG23LNfc2S2OTEs4fi6/XaUeP5jUQ38t9YLYbjdODP5cP6T3MAi1UYwH/CMvRtwjn9Y5VrSBf
	lEUhTgzFf9jNhtwjTZniIMiI8fKoUBPh5flGjdv3arRWHEaZulYAlg5LhFt1fgGXoTE8N2GXOD9
	X3dolpxl2+Jdnl2Ol2NHXxvBsVemf4QR2z6p5+T3Teodsu1f+fFKuqy+OgHJdEncsWwlx3ULDIG
	rdoqPGYOdKvsknsESy9P0wDOUQ+Nwfz6Pbw==
X-Received: by 2002:a05:7301:129a:b0:2c6:2bac:8af with SMTP id
 5a478bee46e88-2cbfc958fbdmr1011716eec.6.1775271007467; Fri, 03 Apr 2026
 19:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208224659.18406-1-ojeda@kernel.org> <20260208224659.18406-2-ojeda@kernel.org>
In-Reply-To: <20260208224659.18406-2-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 04:49:54 +0200
X-Gm-Features: AQROBzANfoxqc1ciF88R4kKDsLGR8YgQSOovJsG4Xr98Qee8u9CeDGOyb_PEcz4
Message-ID: <CANiq72n=Vd0BTjbYfi0HUasivNt1sjZNr+HsD0FvppwG=ae3Kg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: prelude: use the "kernel vertical" imports style
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 8, 2026 at 11:47=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Format the Rust prelude to use the "kernel vertical" imports style [1].
>
> No functional changes intended.
>
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied (this one only) to `rust-next` -- thanks!

    [ Rebased. - Miguel ]

Cheers,
Miguel
