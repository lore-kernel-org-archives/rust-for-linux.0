Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB06E3D16F8
	for <rust-for-linux@vger.kernel.org>; Fri,  1 May 2026 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777651000; cv=pass; b=Wh3U02yap5Lk1B7by9uO2iP6WfocJZfPnIfBHPZUzDIr30nd1/B3EnoiRRZ1w5R9Wd2rQvxGJrsdm8ZtLomacLy9zOgDdnya21WXRHoFKE/61N+Zdu6fsFQAGI5ct8qkiaHHMN2V1ii0O8jyyPVANIArK4k0/+aBzBiuE6m+R3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777651000; c=relaxed/simple;
	bh=rLeo1DZ2uy8lnjKFZqaIf3DVB3fBPXOskHiDnXgyH3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0laH+OlVmPUX8B1RdxJ7r+DHhPJszaV682nhRGJ6n3V58FAtQWyGNQn0BNcii6tERQ8at3bVaSaZlh1VdUVonaRV5WneFJrzcgRLhiVGlgtoVqw3fonMh8IMws0U3gnGYcM/dF0dVvwaoHiLIV3FF7l/jd8/Him7XmdHSRC4qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVcTON9n; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVcTON9n"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ed12db6cadso235498eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 01 May 2026 08:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777650999; cv=none;
        d=google.com; s=arc-20240605;
        b=aTyb0FjVwcqgM6XFFoQ/wCDFFOSaW4dDniMykYeSxDn7cRXXNyuG6W+x54UmGak9mR
         qUQho1ym5pf+493zO+s03+r9q9cQMqbjtvEinRncziT2BuxvAQagkONP6WBLzRSu9gpv
         2PBaiDf8cwY8EniI5amxJRvbyD3mQZVAVWj0HptVhWeJHo/0/RwpeNwEI8Rp4jWToJ9k
         qcFaldSNcgJWMZGDWjo4Rm9PfJhbyzs+PgbGOqvBfh0XyKyOnovuw5VMIjxs4qXinvWm
         IgP8RjYVyBxhzPeNxvbRrP/bSeVl50UkRj4dPoM4ebBEJdhuRLdolxqBq4GSqRTV11Ul
         akzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rLeo1DZ2uy8lnjKFZqaIf3DVB3fBPXOskHiDnXgyH3Q=;
        fh=AUW6FpiZjiWDqPdTEZA2EbpfItdZypD1VYn/XE35QgA=;
        b=OvCt+oyz581Skntnw4qLzyCMlNCpAGIBid4lSdfkpz7Gb8Um2E7n5SmU13vd6UBj1V
         uBIqCUh5VRTR5SZl0WEvkLspYgWKIYPmxqCBG5QqdJJYrUmDEYzpLdm715THQ07rR/0V
         ZpIRDx7ZBWfbaTjji2wqslpH89GU4AVf2cc77NmdJX4lrzQdREL+SOY5UShJLg0I62XW
         +c7BBrIyX7gMyNRt2E2gfxCnnqINjLfi1avIeIWnmMbzNFvu1jJFfQKyFSw5FIl2UQRw
         IBywoMGxXUH+jEGbK+eMex7erxSwrlgIVhrFNk18oscnLPCHhsSuYpSJO9XXJ911Uwvz
         X9uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777650999; x=1778255799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLeo1DZ2uy8lnjKFZqaIf3DVB3fBPXOskHiDnXgyH3Q=;
        b=sVcTON9nbMqJQwrHaCVyi8xxbZs5VLvfkk6fwLCTtT25xNfhPPKt3NLadwX7oRVXaU
         WG/aaT6Pp5UOh2W5QbudmN1j/4mB86Qhz1rxhzeJp40xzTumHsRCJmaG8DohGEzYodXM
         coLSe8lylpOPm93sRfqU/69enKifhS676yT9hkDmFX+9sBKGLWbdfnftXjuNWfSE3J3Z
         6ZhW2ayLEKazeS3ecE03yAg6cB640dA2X3fdsEtFOvaiAtVpj7Hh2/1LiUe1Dqs4WrTa
         9cBkkYY+HxXV8cD69gPk8WEGEeJDXpczljQdFKksrk7usWsi2HLtx+7hvQRmY+FdYfDc
         GvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650999; x=1778255799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rLeo1DZ2uy8lnjKFZqaIf3DVB3fBPXOskHiDnXgyH3Q=;
        b=mTlPyO04JQjZD2r4U0SMv3eqwObsQKabIKzUJ0HpimR27IShHawSl6r5Vf+3xocjYF
         OYWV6oGeWL20yHlNAfrRnWg9yp18ZsD67XmFb5uK1omENQcXpN2V+vEh7BjXmyYJy2kV
         LXBkvM0YJ7tIsZc/EMdPwzOvx0KN2RWzp14GuTf6BKRjF4GOSkxXgS1dJWNtSx3PcLm1
         bCdi44EKWaRa3ZMiLIiXmG/6+IzDfRTiwuNxXT/SPAX7XIRTaWnEl3iAMyMAZyUOBMMa
         2Xy3U4Lc7jZlnCtVG1dit2p7Y9WlvOsI1a76EPzvv3gePHO1uldfhrXbOAXj+S9Gvujz
         qKxw==
X-Forwarded-Encrypted: i=1; AFNElJ/QVZrEU53gbCVxMhMucPpBpHOOwT/giKvzp1toPLOCFEIR9v3ZZT+9BrL/lBKtMMPuBplbHNg85YIQ9Ej04A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfqnWr37DNNwm32bi6Pdc1lH4WcvZ6C21JgRl4w8aah0Rp4RgI
	r2pwsQZnMk5EtFowYFHbImSGZs4T/LBRgFRL0CLjW/EflF+3WSjT0DaX2oAVG7SYEO1CEU+DSrn
	HxwyHpxacBxx5DSbPf25LmVxozDxFPMo=
X-Gm-Gg: AeBDieu82AvPWbFaf/PxX/1k71NEeigFT90Fl5QghjMxBrAiiQz+e29Guf02NcLu0vP
	P0DwSm6mFbj37bgz5oyetkmMbfT99VvtmV99LG1Wga2GW5HEzbqC3p+zdHGTVbmqxPWHG7xZaSV
	eG7+nKql5v2eX0Bk8+fewuIyMF0pe8xH3OTiqGDDxBpz753HXOLUbzvwvCidEz1Ew2xCGDDnsaO
	EwTeltjrceQfa6LOYNHzuInTRoBMUiS4Ap1N5Xdt91JxJ6DZrWi5FxIOhnLfhHdjoYISfUbdo+N
	kq2HXAfakn5JPjklrCS8cHkKBHedpv1aMWuR9UJnT6zLCsK1eTqxUyxmqth7gETTY1J4sAW5ffs
	PGIJndzjX1VcsMiFFijYzjxfeR5ZW6R5TNA==
X-Received: by 2002:a05:7300:e8a8:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2ed3d8c1fb3mr1606082eec.3.1777650998802; Fri, 01 May 2026
 08:56:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-pin-init-fix-v3-0-496a699674dd@garyguo.net>
 <CANiq72kyqd93wd4cNxRZmWyO7HnGKo31i57ouh5gV5n9jEdu+g@mail.gmail.com> <DI6WWCFCV9X1.3RUBYO7H8KBW5@garyguo.net>
In-Reply-To: <DI6WWCFCV9X1.3RUBYO7H8KBW5@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 1 May 2026 17:56:26 +0200
X-Gm-Features: AVHnY4Ld8Y_0tqKfw6BckxbSdY1GsKL5l3wTmXckGs45RStH2zPW-f5icnnbVFg
Message-ID: <CANiq72kbFoYqMP47=sb0QRpEz70osvHD0TzMVopbzQ_nXdYp3g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: pin-init: fix incorrect accessor reference lifetime
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 1, 2026 at 2:26=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> For this specific one it would be okay even if you fixed up the typos, as=
 I
> haven't merged the PR yet (I hold up merging just in case you modify the
> commit).

There is no linux-next tree until Monday, so up to you!

Cheers,
Miguel
