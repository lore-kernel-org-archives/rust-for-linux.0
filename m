Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C9E394490
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151080; cv=pass; b=RjLdVLjqXC5g/IUZkZsAPYJ9RUQ9OUbR/uMlK2eRRctGZzMMqn0O8/pZSulmdgPeeb1Zgqv+/oDhMdWRxR/7RIJ7BBWQi6wvypkd22FwcZR7qzQizJO0o7+TFd6yfj8Z2zcQW5JL+cDvHt+Oz27I0R84e+zVFPlkvAzFbXPrZBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151080; c=relaxed/simple;
	bh=EdibQdRi79AEUk8N9XrOaQNDDtETqxgqjr2V4CzPR1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LR9ELOZ6JkJUDUDTIj0G80somS8AeiCNFb1cAx0wjrlo58hozrcssm0YTmCzseMC20+XxNz1yQkne04XeEYWAjLmMmnEFVv/fkXhz+zdEzrodWW+ZKl9tj7BuJrowDECfK8U4chwCXV63qr9CRs0c1UozsRyNKpsHhPZE54qyFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ItdHb0Xc; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ItdHb0Xc"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so397961f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 01:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790151076; cv=none;
        d=google.com; s=arc-20260327;
        b=sd+LtEe5fzLkD4X93k1lktUbcCKBVWz0fI4ZTvUF9qNqugyHLUICl0YpDI4wTPlRvi
         pqxo1NvD1KkbQd+PwBVUEt9GNNOtKn2FP8HKK2CGwY+tFwy9QHb+4YtAyknmXgsmWski
         mPn2Md1ZI9HliVq5C/JnfYoyVsmUixWIndZFkmedv75mNyVSclgZA6+3XONNeni/8U2l
         NJKOmb4B+P8lDSvwz4lZ4sq+Wm4TJQMAqSKrxaPBzhHF6QccpX8F277BnP6kLWiG235M
         ZrUXjgPXK5BEQHPuSm6GCdznABYdLoV6VwW+OMA+r2hvxr+WVmPV8+e7PEI6FX9VZBnm
         jOjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EdibQdRi79AEUk8N9XrOaQNDDtETqxgqjr2V4CzPR1g=;
        fh=q57Hb5duABeAmF6NBFJl/ViScRfo+BGqci8G4xP182I=;
        b=VvbGwpXpxxk1tLqQJS7de2oQTzfqlmHk1KsokifwB++OMgAdJxLrWvHgrEnvX31PUt
         UwtN/Y6TTp06yzIkemT6rkoV+zM07TCSHeglOrBaAO6ORTelMhwescbOOzwe+q5krGY4
         d6leSl4eRX7O7pOPYzsUhrbv64pTGwuRE7COozf7p0uec8YbXeXf6HimxHBq9jhFqP5L
         5teHLwatg55QhJbZ+ItPowArt1gLFNVxS8Hk6a/W6H3A8QMrCLuhS9C43xztp3swAReS
         13e7Dcy6eEiorCIConqGWdGrqBbphuqR4OskBFi+4X2xvD36fHrEdPBy3iUXv0i2nIoy
         KzBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790151076; x=1790755876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EdibQdRi79AEUk8N9XrOaQNDDtETqxgqjr2V4CzPR1g=;
        b=ItdHb0XcqO2Qr1plJfJWO3NGEIeakKM6rK5oysThcQjtWkHUicpyGSiOXOcIc2lhPT
         KgNGD5gfwDnPeRgSM+Omm4oDEJssatIdeRCXfkAD7zYxy6oqVyc9w43LNeEi7EpOyrsN
         2fYjTwmJFwlYpT4lRpQ2+2xn2BMlERft0qwaCGgJ4k/0luEzBiIY9s+/W+6n2mx6bnGP
         LRC3I8I2Rl3K5ewC4S7FX6/+aSIPlRZVD4+h2jemByaSE3vTP+0yrdDPt1PM6ZzqmJC8
         VwZcSX3t8W9dOJTsymApDUjHfVws4jxu7wGUbYI7DdhxJZkkMdoZWf9loAfVMqOjARSf
         uSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151076; x=1790755876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdibQdRi79AEUk8N9XrOaQNDDtETqxgqjr2V4CzPR1g=;
        b=JttOmAs8pHdHfaVL6Gt5guhYtLfo7XaB0wTv1RK0Zhu22iwJIoKBfyUpmhthHNacA5
         qRg7ZF+yADIzC+SXVeeZ+KeaAsdcyNZNmMO7LMxPdhqmuSX3Fi1HSkvBV7uTr+044m1j
         DPIdV2+kMHKUCk6HgNxMFirm32JV+uCh26pFukxqyzDoN9wFtB1i4oo303LPDIWOdTBx
         c6Q6h+6cfXXE8r3X0fnqLK1EInYNHg4WQtce3mfdEq4yd4l7HrUbYD8zRvwKhyNH1EwL
         6JZSJ/KPDCsQ8re0SxI4igUTBg0Uk3TMp1v83aSLxRb58TkqcbqpGav6oNlfCCx8z8e4
         jnhw==
X-Forwarded-Encrypted: i=1; AKwUvBxsJWdeXLUtHBLFgNz0+twQM+i7VPeaPtNRIK9PHFKwnuEaisJo9imrWXsTwEOHCZQ1JahsTqyq0u+awBMpgw==@vger.kernel.org
X-Gm-Message-State: AFuF++nHzIclKU+D1nYS6ffBhW6z3L/4B5Lf+gKLehAs5DmG4Nx6JoCG
	q+OmP3ULTt1FroIjIfEwLj/xfRT0cqB3xP9euiaGeeu4TfTyHU8jvW/JRXJ6R9LEDx6pSNWxjx4
	NNumD0SBgW99XIHCrRiyJApJig5AXdYrrKDQLKjv/
X-Gm-Gg: AYBFou3MV5/503/EEe/1XGeaSOac0kcVqml/uuf5NmlEHMpjcRzbMH9mIR+uN3jrQqX
	F/Wvpjaa3QrOF5XRvdvhu/oVUDStp1uOq2ZLTsrLAgVqFEfF3IBT0y3RRx8qIHAK3MHYgMWAJx9
	LzW9HZ2o+c6JCrfhAQKMvNt05nzI7YGk+/auRKp9mHC02V6BsS0SLHiywBRk6hHVTZ31vV4yXeN
	FrXiQJ9KPXghZ3qzUsy56Yuf36Jr6slWvlnrIQLOTSo7854lA8Y+4gVcfCRdRtvYj5J208Yr8e+
	mMxrNfFJLSUjI5U4Zf2kUaDHUTMTIJmiEdW9Cla4Jy27ZinUvCB1SYczISwgokuizoTZrKoBnm7
	gqjooUoRj23dVOlIxY4KT
X-Received: by 2002:a05:6000:2681:b0:486:f767:8be0 with SMTP id
 ffacd0b85a97d-48867086ab7mr2788619f8f.12.1790151075171; Wed, 23 Sep 2026
 01:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-b4-doorbell-v1-1-f3ca2f501600@collabora.com>
In-Reply-To: <20260910-b4-doorbell-v1-1-f3ca2f501600@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Sep 2026 10:11:03 +0200
X-Gm-Features: AclHuK-cN3Y_6juBtWNq28GEXbcnGNxIQ1BXWgEb1aIXGrQ22BX1Va4FD9IYMnQ
Message-ID: <CAH5fLgi6iQcTNOyZdpdB=d-AzniTPg5Z7uCgW2y3DQBQ8XxUxA@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: reduce size of doorbell array
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	gary@garyguo.net, boris.brezillon@collabora.com, laura.nao@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 1:02=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Currently the number of doorbells is set to 64 which is an architectural
> maximum for the Mali GPU major v10 supported by Tyr. Since each doorbell
> needs a 64 KiB page, the doorbell array alone would need 4 MiB of registe=
r
> memory. Since the doorbell array starts at offset 0x80000, its exclusive
> end would be 0x480000, but the rk3588 device that Tyr is compatible with
> only provides a 2 MiB iomem region in total.
>
> Reduce the number of doorbells so that they fit into the rk3588 iomem
> region. This is consistent with Panthor=E2=80=99s doorbell id assignment.
> Doorbell 0 is the global doorbell. Panthor assigns the remaining doorbell=
s
> to the active command stream group (CSG) slots. The number of slots is
> capped at 16 (MAX_CSG_PRIO + 1). Therefore Panthor uses a maximum of 17
> doorbells. The 17 doorbell pages span 0x110000 bytes. Since the doorbell
> array starts at offset 0x80000 its exclusive end is 0x190000 and so fits
> within the 2 MiB register region.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Merged into drm-rust-next. Thanks!
