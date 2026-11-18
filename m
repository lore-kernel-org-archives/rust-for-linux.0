Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795027737;
	b=nQ/RD8mAHP4/8RyABwQ80BnOPMTVbYjUOoNtkcVUXVDlKuaw5DwFdZO96+ZQPTT7KQAj
	 UuxwYT0a1N3pwdlbMgUDaK84JpFFvKpRGarTE9wpKvWYAKF2N/8VorgtBYBOxJfE/0lTh
	 c6/UIwCsv9EiNNYylf4ySpwnZ7Pl/j/msQD+3QhXhY63XwDQ91k4ost3xveBYNSeggEfL
	 EWx4AgAEtoBw0vTBxTq06ZzyQ5WQciiT3sLnsESoQT6Q1GZGjF6ajR3Mf47bALO4fAf7C
	 EHsG4pREhSWMmtJ5/WBpROzJ6CDBVz3MLLga2YwpUw+S/OON3w/7YIT+3rM2s3rvJ9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
	b=02vuIAa+v47yUHQXs36wH8yDD2+ZLgx5J02TwAzec5WtYEaFQKhSWE6lacbE5hLj1keZ
	 aV37v2ROZN6o4Px4RoyVC3JaBuFdpwz/Ci4W1h5jGMYy0rWjfCD5Q78JWJ2VilPEwzMGd
	 yVwG/1lb3o1SiEBsVUQ3Q1sMBf/k88TKgPzwWZ4jcOEbt57Euoglbay+/h9JtxF8MPUKx
	 3I2XtOK35UzXMNfoZZD/Hu++yfVfZdZoLXcCIpXiP1Dyj/LkgYDFkhxDEcwppgvxFFcDL
	 YMGLwsR4nO0h/vr84qVMVO83cS1c2NZ0tFmTPjKJXjruzjavD+zJJpFHmRCF7JXvPuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SaVd11am;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C245606A32C
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 18:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C245606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SaVd11am
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49412eb1474so866103f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 10:48:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795027735; cv=none;
        d=google.com; s=arc-20260327;
        b=bSYoGMMuQs6eZHrT/MsZNA4gSjaYBpt9hO0bLhpJ8bnIfvYmcYIBEAe37SQLqRnjaQ
         61PLlNeBlD1iM7DOoEt1ktCVVkQh6dIaTOKyAkvF9U1KDicdAuDvvRv8syIRUZBpdJkI
         Q80RksF52Um2ixc34tK8UwPvDcYO2JVDwBiSoK4/Ac0JOJSCrXsJB30qxbYVzq1m5DFA
         y/ksMjOnng/G17JsSbnruECOqroQRWs2yektPHumcLFtxZ+6osuk07oFEPiDxWlcNUcL
         H3yNVQiSADAByivcM47VjwYFd5LjUu9Vgkl8nMLEMLWG4DH4jZrr0FYndSNKJjJQ3E4D
         RPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
        fh=JiTdtNQ8nhZJ7ns8lheLAseISokTMe0OSnZqEXUloRs=;
        b=BEJwIeW+tP92J6mEqbbfq9TjShjR2s/QonsCzm5gd8efqV9Q7DfWBzzazKBzbMwWpG
         /C9lq3tG9+xE+2xrEXcffc7Xa4UT7/SwwIAxxsruU1A4GM/6vGWzpOsV3akGY3b1m0TZ
         bPmmuKsQemj0h2so7Vl0xIGopIcfyr/Z37mnQ8+ueWExp2s+illX7Gk8SWKuHlA8o8wz
         eLVxBEzKwuOXGVg4Ip8LICIE5PLWzBbGrSZWqpPViDDi5MHc0wiCu7/PDRReoLklE684
         wgqtzdUWkmH94Tr2Pre5QBNDd4gn5asvTmovSffJ0x8kwkxS1/lO9wwfINtW5fHZotn0
         pBwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795027735; x=1795632535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
        b=SaVd11amMVaZjfemF+IdOLWVydW/v6XL9frGvxx7ZZp1u9OrILJarL+fMcOGS6mqbn
         4XimgGUBm/a3LFYWlv8NYnjom6o+ODA/WyR9X2xnj66H2kqVJmMsLfGdxahANKjAJHf9
         Q/QFhpIbAzEpAT96XnIOLyaKEmEI9Epx7m3YwFzfcCLse8tXhiHbaGE+ZKABhULiU+nu
         poO3h0MjuGBJNbPsJU5sRMaRaFXdz+PirVzKqMfDizt0/KZr1EJfII/mQuNKyXqm0g7L
         CtU9N82CiGKDKZDWmQY6sIpf0FzltFzZL8MF5O/B2XN1KEdDCkY1QRB6PuKvy7B0897k
         d6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027735; x=1795632535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7wW/hkB6qND2hL7cUVTjlLecjmTYZgHHtjTcQBDC20=;
        b=R3mkA64Kt/GcaxZOmxoJZa7hVRnnW8S4mZ+WaQQGFo9Rhj36A9jRe6gqPlh5XD4BGz
         Trl9LrEDLNKm1I5GIDNLabtogsnB9NTbnkXfKCVtojh2Yy24hzchRIXZilPC/ibSLv6l
         D+YzqCN/0Fc7hzXHRV7PaDiEY9loRf7ZD0/xpO3c1yc5YdyH8lBg0Vp38EQjXYInTXpA
         0kEz6RXt2NzHaqXSJoOFYsIkhZgynXBwq/T2iV2zIHB9TIktrpKwXyQOcjc4i7A93i+1
         UBbFgdDHaXGBZWMSEutHISKT560uEVz5ue/BiGB6IE4wrqlO6d5bDENYbmG9sGCdmpij
         gSWw==
X-Forwarded-Encrypted: i=1; AL+hErE7/DGIG47mGpJ/dqkntsqVHOhUwTTf/cf+fsjLujc4tqfR2x0wzR1BhREQJno+0O6GmI//SUvdGVSzgXGepQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+d+vYC1XUqLPZpvMq+70Vy3kz75YxeMO8QfkrMw2t39KsIQtSX
	S9OTIQ6/51lY1bdQ6hfB3hsMsAvNf61/YLlZEv3VfBAGcfwi/dtMwE92Ma6eh79y+E5e0pqFPXj
	hxj3gvURNltKW6mpWFEzJ/hGkZLCdGWLm2UXuoaMa
X-Gm-Gg: AZFdTZf7AxItuWZy9iHDbHmvg/U15xh43o5uPEHGm6a+R4nr1wqh35yQtZZVnuX0kbI
	8RVfKyqBncBA13y+rKPgwMPf8Q1yqHUJSEFb1eATkyzK/ipKrpj1i2+MdA7rmUpkUw4HL9qRoQv
	ykbP0EdqUAEoOGJ+PlM8LfZlsEh535DuHSX/JU2bApWps08Wngs2387jIPjTyRG0RrllbVqRpya
	TN0kEv27jGhg/28AzoIBLqR4bCLJYdXcMZcq2YWj5eLNqvZpDgKJYm4gtMftMczrqBaqHIO//6K
	znipG4PvyqNHcEZOGXsfnPI0SP7InPyfvR4Z5crGWwv3RSb3Ld7WYOyCkSnxBoaNKyRulvbPFiD
	4HRoHu5gxKoscsbZRCINJYST3IydRhk8W4k760SN73b87rwSIXePqPgL6TQzqHeuSHbqQzE4kZv
	d00Y81GUxas585BbMq7v4uedBC7Ewkx1y6htaEp425RyTG+qXglGeHb1u2fop8lT+R/+2DZ4JBW
	SS/c0hparfx+NnS5wmDWp7DSQzPuIM+Ffucpg==
X-Received: by 2002:a05:6000:41c9:b0:4a3:777a:a964 with SMTP id
 ffacd0b85a97d-4a62d6d4875mr7842462f8f.0.1795027734320; Wed, 18 Nov 2026
 10:48:54 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
In-Reply-To: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 Nov 2026 10:48:43 -0800
X-Gm-Features: Aa3M54qO-h-RtjaPnh7QVBF5Y0JJtJj8eYAtLacwVWO8_kUzOdD5vosJqDSsgHo
Message-ID: <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Function merging causes various different issues:
>
> * For CONFIG_CFI there's an LLVM bug causing functions with different
>   CFI hashes to get merged. This can lead to crashes at runtime.

Do you have a link to a bug filed against llvm?

> * For gendwarfksyms it causes functions with different CRCs to get
>   merged. This leads to broken MODVERSIONS information if the function
>   changes in the future so that it can no longer be merged.
> * Wrong backtraces when a crash occurs in a merged function.
> * Possibly also issues with pahole/BTF as the merged function's debug
>   info is lost.
>
> These issues are new to Rust because in clang, function merging is off
> by default, so these things have never come up before. Because of this,

I've never heard of function merging (in clang). I've heard of
-Wl,--icf=3D{none,safe,all), a linker flag.  Is rustc setting that by
default, implicitly?
https://github.com/ClangBuiltLinux/linux/issues/1598

> turn this option off for all configurations.
>
> Link: https://lore.kernel.org/all/avy_9SPRaPSKD8b4@google.com/
> Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for =
CONFIG_MODVERSIONS")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 5aac6f1b011e..17b7ac3afbc4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -622,6 +622,7 @@ KBUILD_RUSTFLAGS :=3D $(rust_common_flags) \
>                     -Csymbol-mangling-version=3Dv0 \
>                     -Crelocation-model=3Dstatic \
>                     -Zfunction-sections=3Dn \
> +                   -Zmerge-functions=3Ddisabled \
>                     -Wclippy::float_arithmetic
>  KBUILD_RUSTFLAGS_OPTION_CHKS :=3D
>
> @@ -1136,8 +1137,7 @@ endif
>  ifdef CONFIG_RUST
>         # Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST s=
elects
>         # CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
> -       # Disable function merging as LLVM incorrectly merges functions w=
ith different KCFI types.
> -       RUSTC_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-normali=
ze-integers -Zmerge-functions=3Ddisabled
> +       RUSTC_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-normali=
ze-integers
>         KBUILD_RUSTFLAGS +=3D $(RUSTC_FLAGS_CFI)
>         export RUSTC_FLAGS_CFI
>  endif
>
> ---
> base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
> change-id: 20261117-rust-merge-functions-9ccbc0516df5
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>


--=20
Thanks,
~Nick Desaulniers
