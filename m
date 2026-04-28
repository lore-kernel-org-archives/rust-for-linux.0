Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E62541C301
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 13:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383390; cv=pass; b=oJzpx3mqq0dlyCpJYnskqZMWMyeE0qTi41i3W/J7a+GFyiBoLA/s62wi5AJtjp3CzG8urJZHUcWifPCy3c+U/g/0d/w1D1sGBp8yRFMu+QZOlMJ3OEI3tbv3Hu/Z7L6UESYvZR0WRUDkrkkvefsCVaI+YTnKMbghRWDmncT1qfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383390; c=relaxed/simple;
	bh=5JDjcO7jXdDV2LGvBU7oO92komPu0QAWkx1er+Sjsi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwxPTf+KF7D80iIuQ5AguG7ETjPHK3ycUrGECoDR4yNXefpcu8nOAdeLvvXiiSAQUYQedLX0vRGVwoBvRC5Qtmw19uRG2dOy9qGkg2zlGXSlUyI8x5dbLmhMGiMGAKO9ZouoTiq7Z+ZUshcJvGsDc8/RjAwhW3gtLgtoYrUmMZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/juXQGm; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/juXQGm"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-479d85152c9so3279982b6e.2
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 06:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777383388; cv=none;
        d=google.com; s=arc-20240605;
        b=d/RmsXJI0zV0yB4m4NyN6TSLvgGhEgoea/7Q37imypOq2fXlugBMs2jthPKYZQivi3
         iUlwGACZNCqkq6fWbmcRzehtNiH5BEFiPTjVvDYxSNW3/24DiEnl8v8MziBsWC1M6Gn2
         qVge8XvDNxmiDj4CNxFFOIGCT55wBz9ZT1Siz5imW+xJ2/rMBkLDljzFOvzDu4cFNIxG
         X+31XO06DAukMCj/kNJ3eOsusrsC4+r1M7e6MVoX0l3zb9RlCrvOxkuGi1ITVp/wKrT5
         xQ2iYL4PEr6Knopzomw4imDsG+arOSMSdOk3r1GmwUX7C8E1UROaL/xzdYIOUPq8uQVV
         z3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=znP2jxcfM5dljArjUWddam5xiqaZanxsdxNP/hcjrwc=;
        fh=aV+l5aCF+TJOzyal11KTr8SS4zeqatHKf0iMRTLk/Dg=;
        b=Uo09KQQZV+fIQ1KBu2JlaPnDZPG43eCmXyUmRxw4qHsoebZI2cajPApSsBAXUtf3ro
         7icXWlP97w25g7j+xLY7Jx4iHc7JzGJHJJS5oU9M/8pI/fLu4WsU6dY1ztLyFHdi0V5I
         TMqv6HlFlIrvsY2cbxtSPqJVvi/2VQ3w61/VHnVLtAUhcOVy2kYen7AvgJHjxiSLCOGz
         yG/8NzBdomOGHtEKjiijxkow3cOncvZ9jhH2/0Ld1y+Sd8HqYMACs/38Q/5m2jRjA1nV
         R+FpOj76QzBtlpLuGcWCUhndZp1e6+RKSmFq5JcfuQa4pUUdR4IfkxZmBl49swFKS4Sw
         NjUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777383388; x=1777988188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znP2jxcfM5dljArjUWddam5xiqaZanxsdxNP/hcjrwc=;
        b=A/juXQGmQQ75v63GsRu8TYqEfYpPMZseWpkJJm92fkGspw5dlxu4gvmh8Cji5FL5Tq
         6LbVeaMS0bCIJvjcIq4S9CNWFR18Q31mYY0NN+O8Aadi8rROLCtcrMl4rSnVMX4QHdWf
         sYv3MXV7+cIVt4FaVjUUxphWyMvN0j/s7PNwlk6hFRWuHhqwEuexClOOKyb31cNmlKbj
         VBTygzhoEaeEYE55yeGFS3Ac3nBsGGfdafq+TCS83lPJOaMi6O47SSYtpDyV7Jjwv0JU
         vCwwCZ2sYnGcxhv1rl8GRb3E9glgAFKb/Bsq/2I4eRGc9II87LWaKO11k8Ffi+Dg3V2i
         RBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383388; x=1777988188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=znP2jxcfM5dljArjUWddam5xiqaZanxsdxNP/hcjrwc=;
        b=sVDWISZy2Sl8GLBkroF86xoKUqz9fsK97blMxiCTkXvrbnaU2hYTiejCCTYFzXbqV0
         NsNUeoGJVefLrj+YcMWbvRn2FcEmKGHMasmR6TwEneLKiNyQ2y+K47HzTuMrRs+QugaZ
         1nCv7ksPPuOwezx6prCZK0FBPvQVNKOF4DJ/HktjJk6nJ1H18Qr8e91edIhEPEu3tk1M
         /FgT5FWT3jWcZi5TtrT6CJW0lG4KFChltWq2laXEWRQ/6IsvjO3nltQ2cawPx28FXgzA
         fpTw3Kgd9HNk82OFaRLBtYQNDmRpATfy3qkM9ZNMVfxESvEisQltxYE/9ZhTy1TFpZGC
         2lYA==
X-Forwarded-Encrypted: i=1; AFNElJ/P/7YO6/McSxd7sB9pC3P9jaRgj8uBQ3eDE7SBUlSMsJq7r0nfAyDRLwLyRaFOAaQ3NP9+rzQVi9kS0L3msA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7XrURfrMGvbCO8hCAXqhnLqoQqHekuz9m27/60pqJ+YJhKkb1
	QLPDEivKK/hDmvG95Y/vDlkQfy294lz5JLtytwWJXz+JYrX/9VdU1SZclaEMp6P/PqStVGgM/Mb
	v8rWG4OJHNzsqgyHQEiF5bYbN4lWc10I=
X-Gm-Gg: AeBDies/FQyI/7zcK/zaqjCZvTRZzYQXfln9vuB3MsuCE/lpoGKFp2SF6U38OW07LK5
	rDSrzFvRw3Wkjb8u+1FNtrvJwhd1PWEL1CUy4F1r42Z4MZ/WU9FMuVeZHBeStTQ7AUVtxDl4kKQ
	lMmVh99n6Si1PeDUASvt1Tuu+gYahpvP1G+qZRP7qSeHu03/wqh6FeR78SRoQOshzIgz/bXtHgo
	qf4fn1juX68hroM1wKKPKisFfhVoXrEwps02BnH9SP/9O8MKyaANANQ7KyHw4Zr8B2im0zLMQ2c
	urFOcXeAnRNkX1xQoQ==
X-Received: by 2002:a05:6820:992:b0:694:a1d1:f369 with SMTP id
 006d021491bc7-6965cb72698mr1479992eaf.38.1777383388167; Tue, 28 Apr 2026
 06:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-rust-analyzer-import-typing-as-t-v1-1-5bb33ad12396@kernel.org>
 <ae907fWOUEoIl18K@luna> <CAJ-ks9mUHw57S0b3Zg4WWa9yDYaD-DtRpj4PwD_X30+A4iQWOQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9mUHw57S0b3Zg4WWa9yDYaD-DtRpj4PwD_X30+A4iQWOQ@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Tue, 28 Apr 2026 13:36:16 +0000
X-Gm-Features: AVHnY4IKo_tFSz0AlSJNBD0E_HGKxB9dm_vL-EYfbvxRkJ743QVP-eT_OBpt1m8
Message-ID: <CA+tqQ4LvnGAsHDXc5yXfC5E2AwP9TP7h3UOYoL3YCF=9vY8_gA@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: reduce import noise
To: Tamir Duberstein <tamird@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 2:52=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Thanks for taking a look. I'm not aware of regular kernel practice in
> this area. This patch is motivated by the discussion in
> https://lore.kernel.org/all/CAJ-ks9=3Dp3i5xbnDojJ7QopmUanec0ZPZ_x3_zD0Csy=
ad5L7FEA@mail.gmail.com/
> where symbols used from `typing` may become conditional, which would
> complicate declaring all the imports at the top.

I'm not aware of the kernel practice either, but if `t.Something` is
unusual in typical Python projects, I think this elaboration deserves to
be mentioned in the commit message.

Other than that, given that declaring all imports at the top is not
mandatory, I wonder if we could just conditionally import `ParamSpec` as
follows:

```
from typing import Any, Callable, TypeVar

T =3D TypeVar('T')
if sys.version_info < (3, 10):
    def wrapper(func: Callable[..., T]) -> Callable[..., T]:
        def wrapper(*args: Any, **kwargs: Any) -> T:
            return func(*args, **kwargs)
        return wrapper
else:
    from typing import ParamSpec

    P =3D ParamSpec('P')
    def wrapper(func: Callable[P, T]) -> Callable[P, T]:
        def wrapper(*args: P.args, **kwargs: P.kwargs) -> T:
            return func(*args, **kwargs)
        return wrapper
```

In this case, we don't need the `t.` prefix.

Best regards,
Jesung
