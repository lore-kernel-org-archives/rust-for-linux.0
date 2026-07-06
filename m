Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30503EC2EB
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354108; cv=pass; b=r6ldBtotJGvqj8lh69lYVtWyGZj9+ab7md6sDxLlvgUHu79Jg9tyAaAJHML2zycrrGuJfaIfQakGVemqqyF2eM86xO/gYOgLBPQuzpUaso8u6Fy/Znvl0gj0W+CYYt7prAXXD+Iarq+ZVI9mYPC30vWtTuUDMJubvEXvN4CcFOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354108; c=relaxed/simple;
	bh=/pcx26yWnumVx7kvmlQ1tjZLX4dp/hJE1UQTW/08s3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1j2jLlHlZEVbo4qcOlcbyF+dVuupTsBCVrs2Ds6vplZbAxl0917/ItZ0kY5V8kKELVA0sllS0zZ/hY53/iPqIhPtg6Qu/KYJpOW7hQPEBIO7Ou0HY2R9KQydNhb3uZfod3bGZbn0lWxQBZe0seV3OlGLuDMOhjke/vtXufcFw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKYVNxOv; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKYVNxOv"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-384c94c9423so127747a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 09:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783354106; cv=none;
        d=google.com; s=arc-20260327;
        b=QeRGp6ReG/Ds5pKuLDpzPpFlsESl5tTIoL4624bTPXn4ZjrCu7SfuF2UN2dpNHPKsv
         mDHwZUyr36W7BpZy1PlaXrLFKA2FYHWvrz6SJv1tnw+EQQ2K1cgwyCybSYmQe51r61dC
         dwUFFY6/24BsCZyB9k5SqlkYWx1EzQIAUxsp2TAT8VAW9jd7k69+IONLF27dO+aPIcIP
         wqmR6yTDq5Fp+yec9KPAVBim8kpKK8m+HtEHjCmo4Su6ouZS/ZymIRzqj6Uv9IGrnhNp
         acgJfuLcSRBL/M0HwENkCpjuCIjHi3xnsL9tSRnFDcrt5/Cs5xC+mX1ESNNFRt/Pg6Re
         hdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AoVUa+xESZdLy2HdVHs5BYMFE3jPA/o/dkMFEG3S7gE=;
        fh=LBCusmIJyZwK49/CFWgzrMaPSuEsbrhyFfBhs8s1fIs=;
        b=Oizfmh0IM+KMd1AZQyimDPbHhbIDeYhJNkBi1yudRBe0x7Rhnse8WcR4x+fK5nruPv
         ieeY7zS+so9HabaaAAHynYFRzLxpMyNfLpXPnXFFBWzLmg7ycPArQY4hkEF4YZTXLpq9
         xW+UsnUkQfih4MqeWSVdPer2C0qiRqBd95LuA3K+OFxn4z6/V78xEyBQ57tk1IHusa4f
         3L9SSr7az/s5WEuq7lluMyylwcZ4G6umHE/pUhSoIYeUKZ0AIqtA8WpvR9nP0RTwKZTQ
         5ErCr78y82Yiz1KQQjlVjiaf/ppjLV3wyKhpzEi7D4D3LNVxs0VGSRQ5avcxGjIvyfMh
         WgRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783354106; x=1783958906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AoVUa+xESZdLy2HdVHs5BYMFE3jPA/o/dkMFEG3S7gE=;
        b=pKYVNxOvc6quWOgMSwTscwMPsrz4xsQPSkK936SenxfKWROmEiJBacNZGNBiSg+NoH
         AUwK/T7n0/HPI/3DVVIUfl92biUNT+GrTowCmVPDUaT9Ax2aiW3sEsOO5voQImNSUcsE
         ZTobhKAhDhIy6ibKxPMiQPnxS9yWozCbdUO3l0Hp4muNbs8xiY73scCac8tGD+Mzwl1S
         aN7Jp7xxHl+IZEMtu3OwnSmZoqfeHiG2pNf3daAaAeUJHO/ehDqKjjiJbDQP6KpZNtLH
         VrkM9UO74p+E8KvV7QntukMbw7GBmc+WtlapnWgvTqoRg8Qxk9di2+wT36p/z9r00tlE
         M4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354106; x=1783958906;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AoVUa+xESZdLy2HdVHs5BYMFE3jPA/o/dkMFEG3S7gE=;
        b=Oa+8AdfYv9EvTDyA6XqGgFSugXpN1HRpeqabpY/gVG0S2dMUAdS676Rk+PvjIHxAgX
         TnuGdkyJ1340relr4kk04BsWrskMT892sSbgzK3q2vmugYh6iyhc7zGJhv3OO57sIXNg
         coiRdE5m1132m+0E8/qMSmkhP0EI4xXZPVZRuBxcVFOESTR4g5mLrAm2CXTddRlHcJlU
         nRmehsv2W6GRzeqz4pVrIZb5YYQAS7+Tz7ex4CkCrwtd1XLVLQ8/1Yky+P1t1oQaAGLU
         0gwpObch4EPPuX0pEw60duBTLeNB76f0Tfg6rgtOxyDsEWBEV2sVwNj7UFl2mZ+CaAaG
         gbGw==
X-Forwarded-Encrypted: i=1; AHgh+Rqah9StVF8B6HBj7EDGtzXnR1L7b9VNHpyLXj8m/GiA1Zh4Zgy2mK2I5YXk3rRqpUveYKL73+vuO958ftFoBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyMXFgVkQ/7dCCqayL7ohVDcGPufMfkxt/V+p3UgR3i6peFJpE
	n6d9zXiZq9QXI9DWftQcNk2H6VZD3VoPjU27nBntYeoF3WoXirrn87C+U4PvSLGGZZHevvY14yV
	vEnurmWibsA/DSHhrBf/VsOyMWy52c9A=
X-Gm-Gg: AfdE7cmB0YudVhHObv46iEbTqe4A/hQY/NEIq6eWXxjb5dYw+1uSeAiQB6nsJFDwFRN
	VYhi7zEFOed3Z9UhKWRcUoIc1sZ4/9sEeuZiIFjPVPBU9YdW8fEZqSlHM6UQWjK/Q3c5aZNoTi8
	2kk0+YALREvS2rzqHXVcvHbwRdK5elXtu6bkrraiNn3hLlAJdgTikgyz9RspKyrO4+iY4tRjXcN
	VX5gHr+Ng4vJsUuRX+/rtLpzDU8ZShzB1xb1rRnG3owCVz09YOUhmsGbYcDObDyG19GqP/qY5Ex
	s0XEGdH30PuOdIKYfLyW3pgI71j1Nf+WsmwR+nWVV+Td3lFfsEeAvH5LZJdNp79q71lk5GhOJWM
	Rb+hhMNOcfCqXsnUohngNa6w=
X-Received: by 2002:a17:90a:e703:b0:37f:fc3a:382d with SMTP id
 98e67ed59e1d1-3829f4f05f3mr6252856a91.6.1783354106006; Mon, 06 Jul 2026
 09:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705-net-vert-imp-v1-0-95a35ddff411@gurudas.dev>
 <20260705-net-vert-imp-v1-2-95a35ddff411@gurudas.dev> <d2c1e11e-e616-4b2f-aa17-5eb96f045833@lunn.ch>
 <DJRKZD8LBXXH.MCISM5ZLNVMP@garyguo.net> <c1d24c8b-1c1d-4784-88a6-3cbb519d0406@lunn.ch>
In-Reply-To: <c1d24c8b-1c1d-4784-88a6-3cbb519d0406@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Jul 2026 18:08:12 +0200
X-Gm-Features: AVVi8CdBSCoos-8Xf_1FW4B4T0T9EY3XoD_ftwX1kAKbHtdENbzPvjUg2ExMSZo
Message-ID: <CANiq72kHVkG3MbyUH82WwmhPXQrSe6ZJaqMrdOV-05Kg60NfgA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: phy: qt2025: Use vertical import style
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Guru Das Srinagesh <linux@gurudas.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 5:51=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> How often does the style edition change? Is there a 2026? How much
> changes in each one?

Every 3 years or so. For 2024, not much changes -- you can easily try
yourself passing the `--style-edition` flag. From a quick look, it is
almost all just the import sorting:

  https://doc.rust-lang.org/style-guide/editions.html

> features. Style patches are mostly a waste of reviewer/maintainer
> time, because some actually break stuff, so need to be reviewed just

Yes, we don't particularly like those either, but this is not like
those: it is not a manual process, and very, very unlikely to
functionally break anything (and trivially reviewed, from my
inspection above).

Just to clarify further: if we decided to do this, which is not a
given, this would be a treewide change done at once (because
formatting is enforced treewide), and nothing you would need to
review.

Cheers,
Miguel
