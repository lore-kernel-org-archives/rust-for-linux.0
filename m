Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A1C1118E
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Apr 2024 06:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713250733; cv=none; b=EeSHLi/dvKa822JzCTmYKtfiYfEV92+1CGorLwroGC58ho2z8h+iqBHLYlWi/LdKddxhPvs+u0RXB1UmLe/TQy4ttf4nIXfxA5JQNrx1eabPDEuMx8GnKl8+4s/SmgwgQW+yqH+bkTXPB/7zhbkD/m3idSC+m1C8a78CKAywVJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713250733; c=relaxed/simple;
	bh=NBjs8grZwXaIcR6/LawdWIa5WJtS66VB/KOhrlHNB4E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M18idDhc5Goe7HLoG6GxnTg+ZCfIUkvbcJge7/FBOnPtsWOA2S8oiK6MMsz+pg2Cf8UZuzRx8mPqCEoLPW2vnBYTdBI9zuy4cDR5NuKg5MmGZm3T2H3POdT7bZjebFPrKPM3bLNsLoU7vPB1AH5pRjka4ZKz61tL7QzrPfyXVvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=BL5y1MbA; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="BL5y1MbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1713250724; x=1713509924;
	bh=1tsbvR7Mtdi4p5PcUPkcPg2hEiKtva5OvOJQGQYO5kk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BL5y1MbAdjYj6P+ZqzdtKfJIRk6nCj5f1IWZ3FGLHrurcez+Vg8/HA1z+3LtUf8c4
	 PFhLObzdPrdu34hGp0A5t2Xr02ubo67+EmWpqISxn1kvDy4ct7lb7hWS5EhDl/WDVZ
	 ES2uBbTVq8iS9obMSXZ/rs9VT0Q/yGheD+VKFHbf3olggGmlWzcVFU12Ljf4r15NaP
	 xmnkvTxD7kROdqL8ROOvBTSdE1F1ESNZSbN8HpxmWIR8LX1zhmt5y23RICjRB6xK7S
	 ilcGWHIc1sKRojyGhfy8qbdpVP0nv5qQmSTDjDxhf37n0drqCOkn+fih5O4rSFLkDI
	 OdJSAMQZp/SqQ==
Date: Tue, 16 Apr 2024 06:58:38 +0000
To: Trevor Gross <tmgross@umich.edu>, FUJITA Tomonori <fujita.tomonori@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH net-next v1 4/4] net: phy: add Applied Micro QT2025 PHY driver
Message-ID: <89f6cd1e-2e3c-4fc1-b9a5-2932480f8e60@proton.me>
In-Reply-To: <CALNs47v+35RX4+ibHrcZgrJEJ52RqWRQUBa=_Aky_6gk1ika4w@mail.gmail.com>
References: <20240415104701.4772-1-fujita.tomonori@gmail.com> <20240415104701.4772-5-fujita.tomonori@gmail.com> <CALNs47v+35RX4+ibHrcZgrJEJ52RqWRQUBa=_Aky_6gk1ika4w@mail.gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 16.04.24 06:34, Trevor Gross wrote:
> On Mon, Apr 15, 2024 at 6:47=E2=80=AFAM FUJITA Tomonori
> <fujita.tomonori@gmail.com> wrote:
>> +struct PhyQT2025;
>> +
>> +#[vtable]
>> +impl Driver for PhyQT2025 {
>> +    const NAME: &'static CStr =3D c_str!("QT2025 10Gpbs SFP+");
>=20
> Since 1.77 we have C string literals, `c"QT2025 10Gpbs SFP+"` (woohoo)

We have our own `CStr` in the `kernel::str::CStr`, so we cannot replace
the `c_str!` macro by the literal directly. Instead we also need to
remove our own `CStr`. We already have an issue for that:
https://github.com/Rust-for-Linux/linux/issues/1075

--=20
Cheers,
Benno

