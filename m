Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0C83B100A
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403749; cv=pass; b=SCKBsCfY/KEF5KzI98ND9rrHD4Zx5T1pl3j5pwuKkl/ixNcxYBk8kfeRAf9glcXZkuXzuPIq+MtYaJoSyOS2XZxuAdQR5l2IX8dAE2Su/qfrGYkPEdywheheA27SYppPeI6C5qvVMDoWDYBPZYaU+B5Eh1ZMlQgARP+4UVVD9vM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403749; c=relaxed/simple;
	bh=9IBPKGa+ko/+Qn4PB4WhLtb/NvAeWTe0OpULvmkM2Uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBIDyFhQyTbhEuuQl+whR2nBzA/H6RVWAomrMn7a5ExD/oh94aNbUrV0zGEAivQq66d2Ru4UHKu7pZAWEShN8o96+kmWqWXKkgUjXpn/XU5Em+2UStSMD+X0WHKjlQmIV6X10i7EFmMuC7wmh93G8aAYoJQGUkKp4QxkTWU9PTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=caZqcL42; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="caZqcL42"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aea1f4dc7fso995574e87.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 09:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782403746; cv=none;
        d=google.com; s=arc-20260327;
        b=CIo5BCVVIO8nT7sTYebAXQzdqaYG9LftDa67QATqwXIAKCcOKNTPD+nGmDioLhivmP
         AvECFh4B9pkX5jBfzYgnvWyICs78MphqsBnvs32Mbd0o7fQQWcA+xTcSzrmlp0hSp23U
         jV7WsCRQm2DMzcJFn6PDyMYsXp+QivrqBfG6oQ/sHtsKFqL7VdSlLP4vozR9dYEg7Bds
         5aAsMiQxXUmov1c4+avn65mNuMjjAGaLHbJ41WDSJiyB6gb1i5sw35zMhPtczrhgVUNw
         fKwGa8fpFq3czrruQHv3wB0OuEfXdE1AMjLgX9kb/NECP3I5gHKUuO4AfaqO80TvSPfo
         NiwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9IBPKGa+ko/+Qn4PB4WhLtb/NvAeWTe0OpULvmkM2Uw=;
        fh=OaSlM+Ms3Y/26F1+xkDOg23XJSgqpRGqVZhhYECUDfQ=;
        b=BtzypYSwXnpFSHLyVIsp1BzYIdyE2U6J/y9WM2Ljh+X+kR8kd21b95Yv/GbTXISfmL
         XW8Nb8fXLf2DElOwo9awiT/TEUMyXV3s76ArpR03DF3l04MdrYjoQu4Tyq0Q/wukG1dC
         ys4nFNnXC4fHTieJeuTy//ydTRmxUvksfi1Wag9OLlfnFHK4LXdbeueUgvMIg7U+e+02
         ywsVwfj9//Bai7V5vM7NkbhplT4FDwAZn4SYrkqGxCG78QDHo180NTzXdTPBPzqB/Fs0
         QwKXSRVLNrapMAzrGgU4qgOhYw4sriNKviK6CQaHANoQdkgbom5PHFyETRi8n0YgDPLf
         S7CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782403746; x=1783008546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IBPKGa+ko/+Qn4PB4WhLtb/NvAeWTe0OpULvmkM2Uw=;
        b=caZqcL428S8LFtoR66t2qBau0c9z28Jjts7u71m9AEit8qyT4y9o9V0sO/CDdCl0AI
         aQZ1jknx0fKBM+x/fxVqd7iZBxfWpDggESkBPS1zBfvQGuuYCzZKQo21Mq1gx/2vevm3
         LTVMAKeIlBy/59nBvapzijClnGxI5V2Ru+TE+87ggfNBIGq4MlPSpWaFshcGSoK8/cQE
         ESchb3d8CfKe7BjZ30xIjChNZbND5YS9YHd80vwY/FaixPkV4lqAq+TgDWO762dTvbea
         F/00djQxNd+HENz2Qxv2JWixah05V+l+PKbAvJIhz58WIcU3v0JuqjhJ7wcYGTnvPtw0
         sO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403746; x=1783008546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9IBPKGa+ko/+Qn4PB4WhLtb/NvAeWTe0OpULvmkM2Uw=;
        b=duLjgf9j0Xu8A1b3nif1HXjQZNhihr84BK185yS2/85xhO0ZFUShYTOTWZVjBwtZBN
         XjJ6T8DpvlWHlMK3Ay7HvByR3XR9UZGO5uMUGDe89WPkK+IA4y1w5euuZNqujiiEHODX
         ZVSW1DtE50oP9ZzuapdXq4HVRzb+7clkf9D6jdd5KJI4CbEF9o5ffikedCUv9ei5LYwi
         m1yPPDsAN9OqhNOf5M9yIRuMXMCamd/QIteMduO/UYaDbxVRmHeyeMjPJ06wmsDMByhn
         d6bgobJvvYsrZR0NHJ1aiQKsY4gMVHVyUDMji12f4Y8BusGSbqIDK9Jqb5bFhTwg7tTX
         maGg==
X-Forwarded-Encrypted: i=1; AHgh+RqVHDBuMuy0faO9iAZ8jHQRxHOt8mcwR6NKeqUjOgPZLZ3X20lVymuN9oaaW2XnhiqkRYRcsSufuKNgifWQDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsorv6iUzlUnLnNsGYAmQBKy+79ujopZCYVRhzIFXxEmjI/1s0
	4RU5I9MxUDT/t4kHQR58L5Kj98pbZxtqZUb9c1syqq72YPvjiVZeYTjYennhv5VBDkGtYBPImXX
	G32R8yQ/zxTtZ/3BuGeIr1I61/VekUc4nm6u7FcDAsZy0KFb4gr/SKWeM
X-Gm-Gg: AfdE7cmFUqAza5BBMc8WLlE2gDqsuNbqgy3/NwJ0u1hY56TT+BBYsrNTb1y8hMU1LSw
	cRauZY8ajanS4hcpGEtsOYMhYoCPH60+PedQXq0OFVzM+lJPNhAnlRTKzivijXb1WqtqoGfIZ2W
	ZBIK6lqNoZ9EC2O/f22uJD5ZQk8nLSTba0WQaxHFpKkOkW1WA71cSxiSGibpqqYdlY/fdHbhVhc
	WwOvjuI22UJkFTbZcK3RamopwGXTHlHYQRRgsEs6KKjFXBU7kJqqVp+vEXGSKYr7+dkN0aNuV6G
	oBuVlo2f/xeN94GJ0ZicaHWZg9yPWQDY/WQCGQ==
X-Received: by 2002:a05:600c:a00f:b0:490:b26c:64ad with SMTP id
 5b1f17b1804b1-492663e185dmr44582795e9.5.1782403735036; Thu, 25 Jun 2026
 09:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610141359.1033755-1-gary@kernel.org>
In-Reply-To: <20260610141359.1033755-1-gary@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 25 Jun 2026 18:08:43 +0200
X-Gm-Features: AVVi8CfZFCVmJzGvs9T38hUX91xJ32YYE_IUbnGa809OzGjdboCozyjSOBh_LyU
Message-ID: <CAH5fLghw1B=3dFg252iqgHWv58Q+De6fZCMCUAC7KcWq=WSeFQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: remove imports available from prelude
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 4:14=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> No functional changes intended.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to drm-rust-next. Thanks!
