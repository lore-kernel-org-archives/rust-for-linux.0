Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06CF15E5CF
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 19:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724183865; cv=none; b=ZxjUP//SqRtQg5CHj88gy5d8RqxqQC2drYx9yoIR7kcPyg6J24qfUzH62XIxpJZwPX9+f6i5FUrMAt32mfnG4NqLux58c3n18L6R3vQ9uhk/qiMxTS1gJDKG/EQFnZoTliz6AMgqVXl/mYMwCHTlFtPU5ixXfqpsL+40Tm/RvFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724183865; c=relaxed/simple;
	bh=gYtGpgv6WrPH8c3CiYf0hVAGgsEyBUaSZhsVYkRtZOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=daZ4hqgU3egDU8gxvVFHe4ya3vWTdnPzvI9O2vxA3TjU/zA1H4EOjURzVbZQ4B9w3jMa1JCrgKtqQHc/2ZXjIQ1ORcpDvAzfMXrWEAjkJDDxZKIs5XkXbRNhUjGamQy3mrHF2QiNHASUepuOtris3naAsqlpA+/Hwj1BGIOSO/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXO5LuAl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXO5LuAl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso50133435e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 12:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724183862; x=1724788662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I04d+UCyEJKSGzYujs6lGhbuTD9A1sKvAATpdsPOPRs=;
        b=LXO5LuAlzSp3CO8QvrU701CrPymkl1aKjyEGrsvb9Xll6ajaeqKYRd8oEO8KDZ+RRX
         TAEs6FZjuU0c6iyhOr9CTKd/h4oBuPIHqn+G7cfbRDY+THJsnduq0tZVHUC1XXZkiNLV
         /mKnlxasA8AY+Hx8+Mz5Hl2Mz6q/4Ec3DcDux9gAx5wNR3QCAGRxUpMw/NlT2btFfAju
         VGJUrM6Jv0rdxO6TFv6OiyzCxZhjEYukDmpUZo0YtAKYMC2LCV+xVPqjX6xrAW/pvyKQ
         MdUze2zGoV5IDJ/cLYlb7olEt45OtvXZFOMc6Q/uNSu6OGcMYppV7C2d9L+CGPBNOvJw
         mq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724183862; x=1724788662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I04d+UCyEJKSGzYujs6lGhbuTD9A1sKvAATpdsPOPRs=;
        b=hEep3HbptegEB3/NE0BBhdRErz+AgZ6FsttFEmjzOV6UpTNaowS9AaL+rNoj09eIpm
         I04hQTIvPjvC7lSp+U8H3VorghRuWxND4Qla7yzaI4dmV6DzM93Rk4HU93eLaB6skjiO
         nZ2uyvhY7j6grKrxEvFQmRocXGeFrKeEZnhg8qHF9wfTz30uCqdTULVQsWkoz0jnCNkw
         IG8ySFULiuIQDn5p8lDZJbN5vzJIg6QLpItAj48jWT6KVFR1odYUie1n+OU50lVBevz0
         lYqsfceIh7Vu6FbIj/GnOEcNO3P6+fgqEX3m+FDPXc3zX6UUkv0NIl0uj+rAcMenDtfY
         jt3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXr6XLA7RbenJaG9C9Q5DJpFopnM5bUQU+sP98yh7Oxr45lLWAgRQk3byyMlbPcWBkiPrEsxX7LV3z5WWh0fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1XMhNElr4NCBd50UxsJgUrARWmGOemMclsZY0hclOs+cdcIZr
	RGigC6Sr02hDk9J5RxVCnjSovS7WvH91W1CpJzbKFW608GFvjgyIL7uAuWM3UBffR2ss5Wt5DuJ
	r6pVX4k7691uVaFqbppOaiT7J+Fs=
X-Google-Smtp-Source: AGHT+IElLP3U6GC5jiblsqfmTGvnchVDzLv7QwlAycsREo1k3dgNT3ZyETsIYu2PzzvOhij5top8TkrmV+tZLhPVzvY=
X-Received: by 2002:a05:600c:3b83:b0:426:5ee3:728b with SMTP id
 5b1f17b1804b1-42abd2300d2mr2526935e9.13.1724183861809; Tue, 20 Aug 2024
 12:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com>
In-Reply-To: <20240820194910.187826-1-mmaurer@google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 20 Aug 2024 21:57:31 +0200
Message-ID: <CA+fCnZcowB4=AQO=mEDNgKb8ES5unewQdHkPMLXYwvcxaDMthg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Rust KASAN Support
To: Matthew Maurer <mmaurer@google.com>
Cc: ojeda@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, dvyukov@google.com, 
	aliceryhl@google.com, samitolvanen@google.com, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, glider@google.com, ryabinin.a.a@gmail.com, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 9:49=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Right now, if we turn on KASAN, Rust code will cause violations because
> it's not enabled properly.
>
> This series:
> 1. Adds flag probe macros for Rust - now that we're setting a minimum rus=
tc
>    version instead of an exact one, these could be useful in general. We =
need
>    them in this patch because we don't set a restriction on which LLVM ru=
stc
>    is using, which is what KASAN actually cares about.
> 2. Makes `rustc` enable the relevant KASAN sanitizer flags when C does.
> 3. Adds a smoke test to the `kasan_test` KUnit suite to check basic
>    integration.
>
> This patch series requires the target.json array support patch [1] as
> the x86_64 target.json file currently produced does not mark itself as KA=
SAN
> capable, and is rebased on top of the KASAN Makefile rewrite [2].
>
> Differences from v3 [3]:
> * Probing macro comments made more accurate
> * Probing macros now set --out-dir to avoid potential read-only fs
>   issues
> * Reordered KHWASAN explicit disablement patch to come before KASAN
>   enablement
> * Comment/ordering cleanup in KASAN makefile
> * Ensured KASAN tests work with and without CONFIG_RUST enabled
>
> [1] https://lore.kernel.org/lkml/20240730-target-json-arrays-v1-1-2b376fd=
0ecf4@google.com/
> [2] https://lore.kernel.org/all/20240813224027.84503-1-andrey.konovalov@l=
inux.dev
> [3] https://lore.kernel.org/all/20240819213534.4080408-1-mmaurer@google.c=
om/
>
> Matthew Maurer (4):
>   kbuild: rust: Define probing macros for rustc
>   rust: kasan: Rust does not support KHWASAN
>   kbuild: rust: Enable KASAN support
>   kasan: rust: Add KASAN smoke test via UAF
>
>  init/Kconfig                              |  1 +
>  mm/kasan/Makefile                         |  7 ++-
>  mm/kasan/kasan.h                          |  6 +++
>  mm/kasan/{kasan_test.c =3D> kasan_test_c.c} | 12 +++++
>  mm/kasan/kasan_test_rust.rs               | 19 ++++++++
>  scripts/Kconfig.include                   |  8 ++++
>  scripts/Makefile.compiler                 | 15 ++++++
>  scripts/Makefile.kasan                    | 57 ++++++++++++++++-------
>  scripts/Makefile.lib                      |  3 ++
>  scripts/generate_rust_target.rs           |  1 +
>  10 files changed, 112 insertions(+), 17 deletions(-)
>  rename mm/kasan/{kasan_test.c =3D> kasan_test_c.c} (99%)
>  create mode 100644 mm/kasan/kasan_test_rust.rs
>
> --
> 2.46.0.184.g6999bdac58-goog
>

Left a couple of nit comments - feel free to ignore if you don't end
up sending v5.

Otherwise, for patches 2-4:

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
