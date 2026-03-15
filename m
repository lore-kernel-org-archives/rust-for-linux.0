Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16436363C6E
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 14:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773584188; cv=pass; b=F0KK5HjQmVff7EGM+2jxKRHyBos5l5i7fFrBA+KlPl1S+MSYW8U45Ene6ULOe8YEad1UQrhSr4iR41d9jUnGOh4z8ctgBOkCTYK9gJr6ALdKsQMvIRy0B0fAXrPjhytegkvOcrtLi9gI/hcfhsQthYcArvNyFwXBXC3/D+X8cuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773584188; c=relaxed/simple;
	bh=mWA34iVYtsZxFlURk464PNlVB9E9ZW/NryYidkK2fvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVXVO1HtaxVNVYU9Iz0NVX1Wy/nItMQ56qFVzwoTwMbHdVApbnUPy4QEZZFNtYvM1qhXJR+HL7jNJF4gxI3R8XHSI+8BAHMhRTIGuIXOKnD5Py0pW2t2lE5zHfNfSntN6QrW32ualKoPCxdbo7L+FtyC+LOtozxIqLlnfTEPnX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0szMHk/; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0szMHk/"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0ba72d097so21956eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 07:16:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773584186; cv=none;
        d=google.com; s=arc-20240605;
        b=iKeemwvM5Jq/DE88YZOCBZiROBnELMxIRyYxB28bdYGuIaJXNosj6lX5vla5d/5u3/
         TLNzRCK/bIYoe9F69lMl5zcvuvRZ9CcMdp7asIJdwD30/n0KaFtzbtajW+wZvGUF0jzV
         i+Lm+cCn5ccZvuBm1fuuiDst6/oUMz/iRLSGGa1Uj7YP03DA0zG2ZuKxchdf6YOulaDK
         1o7SW6y3nR7V2mJRa7AfRbsZxh3htsgmtQG4d0sSKBuLb1jgYWPqq+/PxVbvuoDJKTom
         8Kz8SnK7nA7SfMU/8NQwkFWKHoOExEMsBj49y6eqcUv/sl9N0rAwZXYu2k/yPX2VpyOw
         Rm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=whZhDUq/FBiJBJ/cNSKAzeuvVF0J538ymXurk94T6YA=;
        fh=2mhbPEodBNh1r8GvPj555keqw6xM9dWsui/eNDSuZx8=;
        b=VKix91Ze81o8eYrjMmD/ieUY5oRA8kojAvgXcRJilN4cuDtocjHE69VrmhybT1pX27
         4Lr3LorCHx/bn98KEYn3/9xbQ2WbaUJ5s/X2Nj6ocTztsA+ksMlRWzxuGBvbzbFYRj4S
         ulcjAAhvUMgwQHZcCbVqY0HKNR2LNYsd1uNFfM8jmGNEzX4c6ZDPV1Bsj9TG2kkdL1Ti
         PNMT7frarMtN7HKB431849kgQE6CE788uQFD9f1BBgjK4sZNQhxXXLOo/P8VatyW2RNE
         k5amdTIz41NZu3MM1IgvFAK7OZxmawyCf18dT8kbMRC4cEML2wG2gFnqTS0LbWFk19S9
         cK+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773584186; x=1774188986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whZhDUq/FBiJBJ/cNSKAzeuvVF0J538ymXurk94T6YA=;
        b=Z0szMHk/sMl7ipw/RL8CAdT7U1qdtvOdWUK4+zFdG67ETskpQO+5gJI/XBuDzrbTvH
         o321yc8KR1m5rEoPUHDHemDJZztrfJDIFmL5xxi8v5Xc32iUNckZMJ2jAWZSlfyKWz2e
         7ujGw+iTDWRUfV6uAGaWCM7Z6KT6c66Qb7Q9R4CMzqWmyYvpcTKXCLhNUtwhReunmGRY
         ymm4poco5oGwz19UohmQ0jAQLw+dQpORPab882GAAoUN58coDiBEi4VDCTCW5ycAM4r9
         uAZcaHrguGkNmy8D6KorNRowZ11MGK+zc1vVwiJRw6dlTMOMyTB4Xa4AQr6RZi8pRnry
         WNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773584186; x=1774188986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=whZhDUq/FBiJBJ/cNSKAzeuvVF0J538ymXurk94T6YA=;
        b=X/HiF/3eeUtCIPqlWWvUIjYooZE32ODlAv0q/CbETGeBfZx1KxUtqpyPOD3LwwQSuq
         UukOIr9pUmVoj0y1DKUXyIcjq3HbLW+tnc6tk3bmGJl9sdfVRmwSK0tdtFLn/t+9a4Un
         XWwBXNxR1q4h25rl4XqKgdA3/iN0MYpHBHHhKAtJ9paBsJagvo88tDxDNuan2urdyRwm
         yOkA9NZl+Dr8fg6eJse2Ac5S9MCG3Xj2uO3Iwzn27pcomN8/OWhBcXemv+7IE/z1uGUN
         0Uf2NNx9FNbzT0pOwKAMAApGuoEehVqZHv7YR9GOLDu5DNJCJl0Z8EI+7M8u0gnP+4ta
         ESbw==
X-Forwarded-Encrypted: i=1; AJvYcCWY5UKQA190KhrAe3SYB/WYxZOlS3jTTpvp1IRJ3B+X6H3WEpsZfros5UYDyPR9hMdRn9aiVCDVO+CvBfTSew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws8qoFMb0yr2bhmoaXdH+X7FY0bm+s7EsC2fO0CrPU1qYqRbfT
	LdiHLVz8aHI24TZAcuznNblpII12zLyewYfq4embpkPGU7BZgTyZ6ZxvIoJWOseSbYAdzuOE5Ie
	PbxzWhXz37yfrw97/gDAb3tnjYiyr9ac=
X-Gm-Gg: ATEYQzx1BtMFyXt2o+bdAAy1ElW3EiM1PJh2LdoHvoe9iGWkhWOtn7CZmqEQ7pZAWKF
	kEhQrRXvDdeHiLGCp69DqTMfcTjO1P3bsIFMxiUSxwGPilZ5xjcEnRPPl3LNWzPcFRuO+XcyoE4
	HpLz/rxUX6awRTTL3me5v4xOjRYAsrvZ3Gao/hEMfDQFQzEvOEhriswFYgTeu9GvYokrm4aXu2F
	hTtpBjLTazCjcoeAIeWGWRjq4G2eS4nSvpApIf4pWqVx0HbjfDRlAaEPdf8cwc1gttAR7cXKm2l
	368RpRFLAHxPXuEmgMu1A+lG8DQS0Egaat8APNL+a7o7zQh4ZWV4jvSf+QgWocJ3dGQV4lrXxuu
	B3fPF6vSJ3e6k/rBD16CYeQI=
X-Received: by 2002:a05:7301:578a:b0:2be:6e6:e47a with SMTP id
 5a478bee46e88-2bea51431b5mr2291637eec.0.1773584186089; Sun, 15 Mar 2026
 07:16:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260315000627.29888-1-adriangarciacasado42@gmail.com>
In-Reply-To: <20260315000627.29888-1-adriangarciacasado42@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Mar 2026 15:16:13 +0100
X-Gm-Features: AaiRm50qzpKipYXjjJwePGqfR6wS08mpC7gsxl2IjnN0L_XQvoyoGJSHbvyYSNM
Message-ID: <CANiq72=-_QUidBwgkm1S-Edm6Ye-3Uq9xFDcS_oZgVBEW9eUxQ@mail.gmail.com>
Subject: Re: [PATCH] [PATCH 7.0-rc3] Consolidation of sdhci-imx and Rust
 PinInit optimization
To: =?UTF-8?Q?Adri=C3=A1n_Garc=C3=ADa_Casado?= <adriangarciacasado42@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, ulf.hansson@linaro.org, 
	linux-mmc@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 1:06=E2=80=AFAM Adri=C3=A1n Garc=C3=ADa Casado
<adriangarciacasado42@gmail.com> wrote:
>
>  drivers/block/rnull/rnull.rs                  |  101 +
>  drivers/mmc/core/quirks.h                     |  271 +
>  drivers/mmc/host/sdhci-esdhc-imx.c            | 2203 +++++++++
>  .../intel/iwlwifi/pcie/gen1_2/trans.c         | 4377 +++++++++++++++++
>  4 files changed, 6952 insertions(+)
>  create mode 100644 drivers/block/rnull/rnull.rs
>  create mode 100644 drivers/mmc/core/quirks.h
>  create mode 100644 drivers/mmc/host/sdhci-esdhc-imx.c
>  create mode 100644 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.=
c

This adds existing files. If you wanted to send a diff to those files,
then please send individual patches with the proper diff, Cc's, etc.

  https://docs.kernel.org/process/submitting-patches.html

Cheers,
Miguel
