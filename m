Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794402137;
	b=CElNSO3eXDPsRipdqOb1wE+WwRmrXDdhqQ+1V7zLYZ2aESahw71+1bLbIdy0niI9Cg+W
	 PWpAJ54U76CuKosP75c21T1dSU5Of6AxCB0rrHji72c4k06tcxcC0jxSpWgqoZ1EpGImF
	 q+ifsDB/Apuc3AutMfKiEberbbkuLKRvKVTv9ZATfoQ8tKpclqgOdwaavvOh8rpzyS5RX
	 UyMw1PNreKcDKaYEZWV9+p10q0IOk6/RGJrmH+dBXf3roGIYTkUuVQryd/c1X3CdoGoIf
	 avoES/Vdd1AjfkrOdJ1L9Wl+xTZoWY34G72umuEriI51rG0CLQ8guh08CxPj/PfQcRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nX7qc9rNmcYIZ7uf5CPDonzii/Z2ibr+PLktCg4La0o=;
	b=49kX97ORr1NDs9dcf4d4IyWtIWbbeq7mGki52++PxRGSmws2uKzdc5UDVgjqa2YYTw/u
	 aUkNgtg2K0GPeoUz8V/sBYdXhLsq8wF37UhA7abzxJnpJqjXE1JkSj1nORcj79esXNAzz
	 nXqLUmV5sKEfuehKp54XYHjKJdR47kCrIYpMTIGTv58ZKxoc1q3b42VJ+KnXBpG+4zAhb
	 11Zwc+aUGoAI/0HPnCg1kwTClUBueJyaPguwiky54DLzkn0+VwC3H9Bs6utsfJXXhv4fr
	 7dn5VjS5KfW8sXJ8RHcE+hTRH8XhS3tGn7KPdoinxv3srweQwdzHaAAzZCo40pqadqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XU2lr0rW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E16D606A338
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 13:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E16D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XU2lr0rW
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-451a49abd8aso2992858fac.3
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 05:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794402136; cv=none;
        d=google.com; s=arc-20260327;
        b=kI1iIkFOMjL6Pr8YSQb4S3ffM6ckHkWzjtiEAxcxQ5HzJ5cT0xvNtjJSy+Wf4FvI5v
         KBnvCjYlvXgFY/6RAt4k8uPbwkCRedsIZAqxjPZkNTuK+yMAniW3o+D3QWOaYjVSKeti
         bbOgvF/CeYCIWcN+egmNT2zfmLKrEk0OlJJonf6DiGxfVHGk7EfvvIdhYRYLFM5i+PeC
         MVoQrZ9cAR2kzJlWt9hhxIs3954PoRzxUGQk0GMDBKuLDj1SrIk6txrd02HycgWjKSZB
         zRtr7em3Gx2pT4MvtKTlUEN57i6aBI77//bowRMZbmE6kScbq+Y5DeCtPEKBpjNLzuR5
         xV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nX7qc9rNmcYIZ7uf5CPDonzii/Z2ibr+PLktCg4La0o=;
        fh=+rip9djQKqmqcy9P5mHOvdPM3Rt5FnZhfePmQlllDJU=;
        b=VnszwYrRvpdvQbgtUxqcNgwfI2RietgRQfbyFMKgYes+UQWqk7Z95ciWY4WmcUorOq
         9whjUHWWMnlXwx/h3SdtYSA/wRzhtPNxlGhhKsvAbOrd0/p+5pa1uWJNPdyX7ni+4stP
         Jyy2ZlForkw30BdwNQ+mEH4c8O03GkKOEHheGddm1aEM0+S2s8r9gEqfWS9jk7xwpbtJ
         HLETxNmJ0/LUel/YcoinC7PUPvSiliNHPvJEAqigEyR6Sv7B8dOepw/0Su4yvo0GqdbX
         37+xWF5cBIKzPwGrZtWNL0kE77sfN6NKoSxDa2C9BYgsTetV4FSv7ozZiEBqTfh4Usza
         IJmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402136; x=1795006936; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nX7qc9rNmcYIZ7uf5CPDonzii/Z2ibr+PLktCg4La0o=;
        b=XU2lr0rWzFRjJIIJUzN04OUmRen1C1VcmIGzUXnaQVk6tg/62Lmfbbgx7t4GTgDNRE
         rb8rVDc5VFFcOor9LRkTxhNbJAVq6m18xv+Vfr1d1On6AY2mjaLNmQYu6CTwa1xYSt4L
         FdcQy6fo3o3MHaZjyAWtWH3UyQq5fQdTN1ZjSNCc+C7xds80ukr7KE4LZx1A6eb0H69x
         w0PJC9RgsAlctoChVykksVv6uZRisbfaKmLxMtJJDHEdBpwrHzKpBUkTtCH/Kye8LOOb
         FS/xLl4/LzHiiApjZTMiL9S7dJA0bEx9mAOmzipxWcVMd/cZcuXOvlupPj0I++EMCqHo
         cRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402136; x=1795006936;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nX7qc9rNmcYIZ7uf5CPDonzii/Z2ibr+PLktCg4La0o=;
        b=OB8sLnVEswtrNdcuv+lNY5CQEOi9CO5TdR6ZIERlCeqlR54qfeycodAidyaMvP+O44
         SA9HiD//8RSToJ4YdOb47Ry516D2gAP1bj0vj1Qx+lq1laFojlOS7wluio2NynTaikno
         uFGhHPD0EznAfTvO44FTuuP/wNU6oOg6avTPaAUiS4/kvvogKUS91FRcQGh8UTUEf2jZ
         UcjHpxjmnxUFewhjOkV8oHOooEB2/kWxW8cGYqCfMiMju1Z9F0hslw3bgtjKcQwfV2+Y
         3cLgaprJ4HNZZJAi2fQsqa9X5vfKe2ztjt5Al3Gy3k1eCIpIS6u+2+UWiBZ4aMjtywLn
         ZMPA==
X-Forwarded-Encrypted: i=1; AL+hErHHMK+hZNFkW+JZBdRxPtygN1aCEgFCLPkg3DKwt/HcpDaInuY3J6np8S+Boc0pFK6iZXQfivgIf42lIAwlrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+s6ThbWcOffq4XlveEo1ampYw/Z+POUfLiQ548iiQpTvp/31Jt
	88xieE5oIdd0WV0eSb6ujLlJdQAPKWFTg4XAkHlmyup2F7S1ZyyubqomupDySrwDL7Z0keM9j9s
	gH0agn7nAtDHHrUcGOoDoGoSEoM2IyU4=
X-Gm-Gg: AYBFou08Bdyw0i4qkKrpuaiptyUX55ArQC9qEZGeQneDRw+9WFu/h1Kc5hvzaReyBZB
	xFWzIrffCClnXCS0caoBPwAAmyOiCOxbOBulk3EeKsBkT5YNI7VFDDC+odmOQ34+TDTzavO6Qdp
	KyZj8OOU0wbFDav9gNYkfIZxS1jheXgutlgSDKmSxbbQY2sgrIDUWXMAzI1yuUeAg0JZCQHT04U
	uncqhfj7p6C9qZHCV6tiW63UHfxGOwxrzQrI259Vigmoc4zN1EwOHNcVJZkinXpIJqt9Ol0rVuc
	qey/ugKbrr5tBsZ/BSL4H0TSNDQAFYILlnztXCgDkb8AlP8pkIBFP7blDyMLvr+4gbwlGX1JSq1
	a8K2ZXUPKgM0iBEExEnAmIbAs3o4AZUM6alPBXPxifEH0vp4saMotyGcdhy9PgMw2ljQNya8T3W
	fP0l5NO7qRNn7W6QEYLnwqrPCDet1K+sqPv0AhmmocPKd/let9ympqtztt
X-Received: by 2002:a05:6870:ac8d:b0:4ad:8667:442f with SMTP id
 586e51a60fabf-4ae46b1d1aamr2290030fac.25.1794402136269; Wed, 11 Nov 2026
 05:02:16 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com> <20261110-exp-phy-rs-maybelocked-v1-1-3023cc9055e9@gmail.com>
In-Reply-To: <20261110-exp-phy-rs-maybelocked-v1-1-3023cc9055e9@gmail.com>
From: =?UTF-8?B?7ZWY7Iq57KKF?= <engineer.jjhama@gmail.com>
Date: Wed, 11 Nov 2026 22:02:04 +0900
X-Gm-Features: AclHuK-SC0uSru3uT5u5C9HU1bsCE1Mn6-6Bwp33kN4egHoHVGBL0SbyXWSBoQA
Message-ID: <CAGAB664Z1avii3rw6pSu4wT9eCmwYJ4R08ix2Z_YNm9KeEs-EQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] rust: net: phy: make Device generic over a
 lock context
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sashiko's review of this patch was sent off-list [1], so I am replying
here.

> Can calling genphy_soft_reset() on a Device<MaybeLocked> cause a data race
> on struct phy_device fields and bitfields when a Device<Locked> callback
> runs concurrently?

The race comes from the caller, not from this series. PHYLIB calls
soft_reset without `phydev->lock` on some paths, and on those paths
`genphy_soft_reset()` and `phy_init_hw()` itself touch these fields the same
way for every C driver. This series does not change what runs there; it
makes the Rust interface match that contract, so a soft_reset
implementation no longer gets a `&mut Device<Locked>` and cannot call the
methods that rely on the lock. Before it, the callback could do strictly
more on the same path.

> Should the methods in impl<Ctx: PhyContext> Device<Ctx>, Deref::deref(),
> AsRef::as_ref(), and the Register::read() and Register::write()
> implementations [...] have #[inline] annotations?

The moved methods did not have `#[inline]` before. This patch only moves them.
I can add it in v2 if that is preferred.

[1] https://sashiko.dev/#/patchset/20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com?part=1
