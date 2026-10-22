Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792684112;
	b=W/C4fWRMdvkhKr4BEjtDfrFQ0l1tUrvVyg/eb37p2ayhygxOPKyaXWhkcilsZN+reOfk
	 B0Eou2xMPwZvNzSWGLLLyv3SdtyT9++bEVC3cpeChce6+bt1MGbVK4Bq8yNxOtlbf8shj
	 NPlMjpVjySOmIbO3epzGnGJUEE52tycDnyB7qCnrZQC1NR76egNZUSngHolYzzp5p/wK+
	 7CJuXQAgDds7AZiEBcKncCK6XF5hv2PQVyxQNMDUWc9o09prUxPyXPb80WY+MGbg2r4zG
	 ouJaoC3RS8fe2Lv1A+Zzi4CR7BEiQ2UYN6nhdnjUvwNlJbBdBhARJCY6TWUX8M9ixSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8bJTRxbj/+xtKs5WrYdu78XioBjVWGyc6iaDHF9orK0=;
	b=Vg87b2jrlJJyjh6oBVQARSpaZXMmJdZGw4g34VCkPnL1q/3f1C8QqJCh9mJOrgApgKT3
	 n6orF6/Ckpv21mRnq8ykvukOUgYPWvwQGGkKyq/DYpe3BYNwMuQu2ZIFyX2WaE9mS7DuB
	 CazIulJZLFH0ZN/pRGbV0Mt7yTZzENUHCZHU6laJ0CCN5tKBmjowe+NwJpPmgFKtRkqzG
	 EZhOdIrb9it1LtXADKqT6+voENIA/qHhU5dmTYbQpGjjGU3olRcoX2hzYhvgSK+ZdJvYS
	 /dGkD0o1y7f7WLXmjq57WOOMkt0SN9VXS4H2PurgFsn2hv7Jm9gNaXiBmqbhWi3S70w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JNewx6r4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B4E606A31A
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 15:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B4E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JNewx6r4
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35ca5244753so235251eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 08:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792684111; cv=none;
        d=google.com; s=arc-20260327;
        b=Vc9ytMaY3J4WmEXDi5PRwO0BAKoYCIwdFiqs/eW9OAPxKtc3jv/uaF3QGqvkx00t7j
         n2r/iT3v+EgXUJmKPvXbAERhS9yeuKPro//fP4dLFroOBOXS2PZXtXxJOl3e/051GT4+
         6/w4UsF4pfqebxMWx5MfmlcrcwbYmASSN353YPx3z9oHSfbifmVvEwl3LtK/auk6a3v0
         L9icAPL3VfQwBs9DN1jtVurq2BvtGcQ4j5lu+g83F2oX79JoHr1EW5CiMa1A8ojpQE2Y
         mVFB8bCxzABlOMa3QNPiMepGabklY16FWOKbFxFgq9BChaszBjRJlYbrOZcoi87tVce2
         AxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8bJTRxbj/+xtKs5WrYdu78XioBjVWGyc6iaDHF9orK0=;
        fh=eaJ59oCcwkBxlNxaVSwtVfsybbql7cdv33CBMMuZlwQ=;
        b=ZF1+ZJvndf3+ur5hMHJV4sRoRplG3/tYaRsA9KdXHgw31yZnY/YZVVnyrKoCotsGUH
         YGfrKsVNoAji9h7T5sKg+MoEHZjkEVJ1zXxfE/T0htyg05MF2B6taGBtRFvPQzDzSP93
         I5ZUxA4b9TX950CXrZMAmyRJ8ggoT7iiIMkcm/RzX48G5eomL+qKfbqMzdOOol8rOOG3
         jq3u7+mX6AJOvbUvoBlYPmeo9BEpEGVcXjzQ1vWQXr2eIirArk/zY1H7Z7fBTTlSXrUO
         IXTn91fJ1Js/BxPnUU/eoRUB9CrbqN/sSB17eyWzDr+f+LG7+HME2VBMgvLsk7+31wd5
         WbtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792684111; x=1793288911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8bJTRxbj/+xtKs5WrYdu78XioBjVWGyc6iaDHF9orK0=;
        b=JNewx6r4EQHNAuLs6G852fJhVAhlQip9NRxYhUWunI5sHjt2T+nrFIiChDS1/vR/QP
         sZ6dXxtEdKSKtt8wRsyHiqFDFxNKGLvjHlohrcj4yyh1hQHCRXvwxl89siHQ719WiQfO
         Iz3pvh+2ECWk61Wb4btYWUAdugPPimMXs8Ntnpxdw6vFaGGr/2l+Ea0U+fh/HbVgqWGe
         4JtXHxgniYDmhkOrQcSxJjlvFi1hBR8Q29YxfprFQV4vjfa45nHhfxxJQvX54/xLdcQm
         DOywIVpU3LOVxfwDEEY7idCMmUBbfEuynXLEpxp7XgTJ9WmWuPJQUiOOTvg6lPvVRqtH
         8tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684111; x=1793288911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bJTRxbj/+xtKs5WrYdu78XioBjVWGyc6iaDHF9orK0=;
        b=2pJxAT+xBCf6CKL9ztY8winbmUcTBwCRLoerUzjuJy7ycoIRpgWX3QhdeM5KxfehGf
         0Mu713g1DhROshxn9UrEh8TtCTrok1xYFProFFB0SrAYF3F55Ca9EdRpTsaSOO+4QTyT
         nHO8hAwhhlWXUKRivaOxOKPXWi38eo6RDKECQCx+f/JhUXKeq75ZgY0SZcGbb/iFzO6H
         Mfj8Z7nwP//3OvM6DgtKsUZ4uXhqWwY6yQK/fCBRUp4AgLNyy3uuYMF/efMuV+wCDYvN
         t8aOxHVNfjPN2Zen5G+KLQ4px3JEy3rZsoBxAp+eqH0n/ILz1GRR+O8inZElaswMxW+Q
         j5mg==
X-Forwarded-Encrypted: i=1; AKwUvBxI9EjQHgsURD2ClO3rI4tYJ3s5rZnw6FiiIKHcOeK4AcAY8sYjOHFWpnJWrQSPRyz/E4a7jV3h0ibaJI8NUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvpdxqetPKIsCHC5ZLOEKEQZLWcwaQ2S4+mf6jUQG019ImX0Py
	sAD7sJoS5NwbeI11M6wV7+90YDwLmI+5NbzYx+onf4MaUnag2+xnkX0vaezz2HM9+tRlyRQy8nl
	XdPCpGH9tElOgvEiuDvXA9Aicap5BHlH3DL8N
X-Gm-Gg: AYBFou1EfwSaeWKzwPbakM4TAa16HlFTX+3G1//PYccPYWeXEgfO0zaK9wi8Im93UY8
	lMo8oZMa7AmCKspW9R9WqfcVXrLPHRjCrWaVnb6qUJ/bEyrQDgEZqVCCzGDeTmCtE2zdw6OtQoc
	KJZM9hsPCTHZkRarllkHSMsCAM9dggQQ1NUEOMbMN+JZci1J6fEr2uu3/JB0AuhFKIvTZlHDYTX
	/rtcXJLH9TGl9DCvGk7nsh45zaGDfEM1hXzpQWGi4KmVB7TqHWi+DJ1J28oS6S5IUBMXRjmmevI
	pmpubtPV1frTKUIY4GdgBl4Vgbz28O1D3yT7D/ix0XuHIQeUmGRPmy2KB5DFbVRsY6eEN9qZ5YH
	osgQG3KgsP3DhhcL7pP1g5D4RpZWOsr2ItWjk578G6l4akKoJZQZ/kIp0wmR2hlNfa+GT1RXfMM
	ZcYs6dAUxK7Si+clceQilKQghgp0XBccSu9T+CCp0bKCK6Yv0QYISi/jZSfsEAFs8/neZeN7ybM
	upvz9XeJi1XhojzVW9ODM9q7w1wFzPcswSPHF82bcyQ4nqPtjK00Zc7mA==
X-Received: by 2002:a05:7300:e9d3:10b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-3674ba26154mr13178380eec.1.1792684110767; Thu, 22 Oct 2026
 08:48:30 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018163459.80579-1-ojeda@kernel.org>
In-Reply-To: <20261018163459.80579-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Oct 2026 17:48:16 +0200
X-Gm-Features: AclHuK9JREIBEYuiD1RQ91TL9RmX3pQK5wN_Po_GP3ZAut4w-NocityfU9dUQvQ
Message-ID: <CANiq72mGByRrOG5338Z2ntgrA=e+5-BpAO6j4cOVt4Xd1vasGw@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for v7.4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 6:35=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
>   - The DRM one in `rust/kernel/mem.rs` should clean `rustfmt` with:
>
>         use crate::prelude::*;
>
>         // TODO: `Alignment` should be moved here as well, Rust moved it =
upstream in 1.96.
>         pub use crate::ptr::Alignment;

This is needed after the driver-core pull (the commits were shared
with DRM) -- replying here in case it is easier for you (Linus) to
notice:

  https://lore.kernel.org/rust-for-linux/20261022153844.30689-1-ojeda@kerne=
l.org/

Cheers,
Miguel
