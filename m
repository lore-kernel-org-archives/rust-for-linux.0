Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795177929;
	b=SZ0kg3E5Jr8rgsQVNDUeQtIm4BIFR3G/VhtYNMrdeeP3wLGU1DZwglbtrcAioKtvmT87
	 ZAJ6jXXewJ/YXY0lOlK/s1f2eC/5WYV8jPNSq9L9XlBXg9xveFxo3wDTknVN8CIUvteCj
	 O7FpVOp4dWc48OzGCwmUzkzMLcaIZMRUXDC2/bssU9lF0VqHMFcVr3GsEziROgZAA2YRJ
	 VbbtfVpyW6ayWNYD7RQjShzb9UrHAH/e1QX0GxNRRlJzzifSeb1poZA+UtvGrDQx5Cj9a
	 1x9KHI0XsQZoVm0tzz1Vb+qRBD/qr/MUHLuHY7wXFNeeTely8220Gaxkfp05w86aajA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IhiE/LJFQy9yi5YvfPy9sO4qIb7WIlTpzeu36y0dLyM=;
	b=D0miUyw9LyJOM8ZSJ+JzMe65laC0ron/Dk/xr/jopEgFC3isYCVk4vh+fgnAXLgv/SSG
	 HEgrKou7rSHXlVVLA2dSMY0aCnkOm1mvXUw68hFlVGxjuhp9sbpk77uz9tF0bUu/mpXrd
	 G4Yik6+dqRuVq3aoNgTvWMLPnYOGdK0jBZv73u/VO5GwLuKCkxticnwPrrStCLXMT6NP6
	 wcsWXxkzsZuMsizjuThIEHh7qxS6svBvBPRC3HP5eSAuKAdTH0/ZlH1qFA0kZ6UmgbpOJ
	 QmEZzFjZt/OOsnyW7dFMkHjVx0hQ7mRItlm1Z6un2foxWFI0dEs1UiMzESq+qjd3nqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QDmwuMBh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C22606A334
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 12:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C22606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QDmwuMBh
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab1e5a01a1so645141fa.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 04:32:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795177927; cv=none;
        d=google.com; s=arc-20260327;
        b=TWY5uhGRKyzQiYeCSGReOKCqKpAPRJ0sroiBLHJ9r73BTAYh+JO7vDjK0iai/vniFf
         xMjnnbK2h5o1ux6FvEcdLI/cYUSbamhtxNYNytJ4ckdGmq+UWbcw3/imcOhpJ+GyHH7r
         gdhnx+0u/hGD/z9E6CdCS14eRZONeDD56xyl4yAj0NVTWdS1VkWAKaPssM3Mmy7qU3ah
         Zl8mZquzoVj5yuSBOFoq1USrM0CwN9LK3G+q/pqdmo4inUL4iyDjRP0j0BFk/eDeRm53
         sF5kiLtPAe4OQFAkM6i6NytPbEfwA/liJHy6Dzlfwf5T/075mVKGNvciX96zpXWbj6kA
         /z4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IhiE/LJFQy9yi5YvfPy9sO4qIb7WIlTpzeu36y0dLyM=;
        fh=siLNP+Ey5SaH9rB47FCzpVyDyDna8SvEcoQ/EN9R5C4=;
        b=Dkoha4eMkcWXu9gtks1nykNTYJkzhZh1bjwrsNFb1abLJ+/VHpCfiBPo6dfCa9M9qY
         IlhiqTJyINw/GsVso9qulwh0Pi623Q0fp0yPFSVwLCxNMsz6lC4dOaqSywIqCE/TEMYL
         ScaJZ5FHrgYkH0nxfgmhCCMOZaH+13uZMpbS4hQXqakx451EBNpo1TwL9oMdbA0lu+Ol
         ndxnU0qigGm+l7iryUJZsVbV8c48c/0NBx1BOnj9CAmas5xLT51QKTEGHj+kcNjiOpWe
         iBvU/7h5NRI7pixYJ9+Sfzl113P+/DZqSLmjXdNUbRne89T8bqFL2X4ZP4ic/3sf9K6M
         qDtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795177927; x=1795782727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IhiE/LJFQy9yi5YvfPy9sO4qIb7WIlTpzeu36y0dLyM=;
        b=QDmwuMBhSpTqnt8KZvPmDtpegZio09coWGXg5ZEFJ0HQ2BZKSYNl29jzbBxRtoour8
         WjzeD/x0LXOjsGErS/402inLq2+slzulYjk4LJKocMxKvgNz3EhH6NthHh686TY1kHsk
         kYq6H9szHwIVKBE8HaoHmF7dJWayeZ51W8MKNEG+mid6f3petDzIAw1aqnkMTjwCqo2Z
         4P76Z7zUmv5qzbhsa6t8Vc7TyqVVHS/C6G+t7V6nR8PjeWFf4ByO1/OH2KnXSCWfYMzk
         gY8tX+IhAv/GYC7ZTJNJoIp63FCAVaptkfuPj7bHSniq4kogSZymU3auX9w+Hk9Y2ROZ
         oUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795177927; x=1795782727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhiE/LJFQy9yi5YvfPy9sO4qIb7WIlTpzeu36y0dLyM=;
        b=clkd+WgiYUXq6NYSkeWUjfvD24BWCuNgeJBWdCmbi22+K32vrWfN7ZF+4TvUpDBK0E
         wB0fa4RiwmXJLroMNP+o/OwdS2yiEhsex4H+r8TgfFwan+czX3JKiybaw6M4eAX9r1tz
         Z0voMWkA+1qAYPB1ESucBsAOlOX8L02XpPjGo2srrm3VdzTc362uQiV1e4xtELeNnLdv
         ucB2L1DeqyxwrjZttNFhi/nP3kLR+GyBCAa1uyxyoO3YPXcmWSjpJ5qKm8ib3XMGNIBR
         h3c8GaL5nU/DoxJ5lgJ1GQJbnjjqijcNqy6Q/BXM/BFBzvE0IY2TZ/aKJvWhYgkqYGE+
         +J7w==
X-Forwarded-Encrypted: i=1; AL+hErHQ5vs5UhbETPKPcQhVocMUQ2BvCVSCS/Qsv5FzTeuHWaOvDvOZ/7IETWm6JDoU17X6bjGNjpGhai8UCOUpOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9BSCSCj4EVGIasSUnniGLRJc0vXS+BZsK/aq0gszGYe9UTTmnr
	FynGX4Vvwjvid/0G22sU3PlVekYBUAbCpDU51oxi0PI+wQBnoyX1ar0uzxyIUVxsYdIjk6Ar8OI
	Q+YWne2gYWKxpigrZSIHqnSu2qiSoaBQ=
X-Gm-Gg: AZFdTZdamoAMrakSPq9FasW3Jbe20y9wgwzOneOZW2NL18W7u4/dFrjPJYWy2e8f2FQ
	r/B3KwBasvi5kGwuMVtspCmnNLaIDk4pmqRE0rPnaHBNJFn2MycS4tWcSF2aXxLQhl4/cWlbRrr
	fWDEsrObvQQ7+ikfOuONhf8q1Yb48xb40Wz2iGqHmww+6nd2FeYFO0TvuDN9jXv/OflKKYfNJq0
	uvoaewk7mbteD+XM1PklWfxHnNAEiKVbkoZKNO1TUPKBHJq+PmOtGgmwlnXMzqpQlDYmJilcOP8
	TnX8Xbb/CSikbIl2oj5aa/0UT9EEh9jSsfQnxUZ/1nN9LfgL2DYmXVSEPlGSuUPNQrC/NYTCQ1N
	ayk2+lfFQYgLODrQmwVoMWhLrccvEWpVS/x9e/9qy7q3ImH3++bKhldTrFXZNDKT3Zn5pr+BCRI
	zgkGdgtJ1gzumqIEHKo1cBZ3jAJYbiQx8J0xrzfylj0bPiu7d0JpBatAq/b8Xf58SadJ26h/S3G
	j1b8iuWunozATwIqsBJjMoYiQisADJ13nhDKQ/rKb872dy4FBezz1s4tnZ0jxKIZWYX9arXWkLh
	PSwiRGFHIziIR/S2/Q==
X-Received: by 2002:a05:6512:6313:b0:5c1:ac32:9904 with SMTP id
 2adb3069b0e04-5c1bc80e619mr987431e87.3.1795177926726; Fri, 20 Nov 2026
 04:32:06 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-fix-schedstats-bindgen-layout-v1-1-0599dd230ffd@gmail.com>
In-Reply-To: <20261119-fix-schedstats-bindgen-layout-v1-1-0599dd230ffd@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 13:31:55 +0100
X-Gm-Features: Aa3M54rcMiGp8tEKzqSGwq9pN9j_ip44fxmLfK1-urL5STB7swv0NRy8cxr5owE
Message-ID: <CANiq72kcDMqswODJ0OqcqecDG+8mVn7Q43v48=ED5d6tsFOWQQ@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: Preserve sched_statistics alignment
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 8:33=E2=80=AFPM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> With CONFIG_SCHEDSTATS disabled, struct sched_statistics is empty but
> still cache-line aligned. Bindgen emits the empty definition without
> that alignment.

Link: https://github.com/rust-lang/rust-bindgen/issues/3549

Most importantly, this is about a bug that happens to be exposed in
bindgen 0.73.2 only, as far as I can see -- could you please confirm?

> In the reported arm64 build, Rust
> Binder reads the wrong pointer via CurrentTask::mm() and rejects mmap()
> with -EINVAL.

Cc'ing the Binder folks.

> Fixes: 313c4281bc9d ("rust: add basic `Task`")

Given this is a `bindgen` bug, this tag should instead be:

Cc: stable@vger.kernel.org # 6.12.x (Rust is pinned in older LTSs)

> Jules Mercier reported the layout mismatch on arm64.

Reported-by: Jules Mercier

(I asked Jules about an email in the issue)

> +# Bindgen drops the alignment of empty structs. Keep the cache-line alig=
nment
> +# of sched_statistics when CONFIG_SCHEDSTATS is disabled.
> +--opaque-type sched_statistics

This seems OK as a temporary workaround, but I would probably write
something like:

    # Bindgen drops the alignment of empty structs and bindgen 0.73.2
does not add
    # explicit padding before over-aligned fields either, thus the
fields that follow
    # get misplaced: https://github.com/rust-lang/rust-bindgen/issues/3549
    # By making these structs opaque, we recover their alignment.

(In addition, it would still be nice to have a debug Kconfig symbol to
enable the layout tests as discussed in the issue, but that is an
independent patch, of course -- I am thinking of gating it under a new
`BINDGEN_VERSION`, plus particular architectures where we can confirm
it is clean, and maybe `!COMPILE_TEST` in the beginning too...).

Thanks!

Cheers,
Miguel
