Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAF81F0991
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 11:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204166; cv=none; b=rGxBmFTwUHdeYogDRMVWzEAVfUy3CKFOXGcTjK2tCEF19vNfeDaOjx0ELOZPNpnz9OzDzw14HDLTpXfjq8DfxkiBlegqdOKdKRBLEUsgzxPJVO55tcwyTHI+mHpnRUzxKwVMLjiTWa8EFwX/NzYXiqKn8uhtG/DxyJWH+3XmTck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204166; c=relaxed/simple;
	bh=GNZpCzGDWuDUH14EPmJKeguyyF3cSxK15eb+d2NOo2U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RfxhXWb5r5HC9sJwSDUMMf6TlMGyWpIuCAVQxIrtmPtUxf5IT1AByvxWEcoSZhzNoVbT1UmV4miQSTqc008qyZcoaanjaXCsIWftD9niXhblxQnTV+jVj+5ovpK8ibRgpYIblomCPf+gmae8k7JiBq5TZ8kh+2eZ77XSK8iAZWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOqQMkFr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOqQMkFr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488d2079582so108918015e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 04:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204164; x=1777808964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IywXIO5DH2wY+7oMRMtv2QIoyGhfedV6T5nXUSTMOdE=;
        b=AOqQMkFrRakPlARD+XQWgD5caG5+d5dMRdtQVb9Hj2V/Bn/759aqsGOXtpb/PCo8T8
         hfLVIfKNXawkznbn9xaGSoeIqbaFJv4UnZLs6KTVzXqdEN1WgQFLE7fa1ej5gA2Lbs+z
         zYFD0hbOqX1geyJ74i6JuQEJW869FwC9LSQj+iQguJjRVtAWZSpum6c6BvApuOMO59e+
         0w6y7AvyP3jJf8lbO5Q04ajEpZ549As09LeBno2fGPte3BboqVZogxr/jIoIWxC7uYTa
         HUJda4zlOfisn9ozQ5jfCwBbt8tOvuE5zGwRUjvCTcYlmg26Tqgwsrp7DHa4xUk6Xwjm
         dttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204164; x=1777808964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IywXIO5DH2wY+7oMRMtv2QIoyGhfedV6T5nXUSTMOdE=;
        b=QW2rPXg62Phqvyh+9wcarOF8jC43w6zFpwrEpVgjhLm+/K32xJZh1cIhvwkCg449bF
         e6Pgq/8OxTu3panrgxftfqRdaK79AIBY8wCXZfCHrC5WSvMAzR3xG3GMtbJOxgJ0pmLa
         Q2S+5BADR/dtKqF80tZe/xvWjyaXiJ6xeZWawJVS+hnt3M8SIuTG0Dj4RrZcZGVJfDVp
         sldGowBN6iwiMQgCV0Pf8oRuMMIFa29lT/LZXN1DqYrJd7RjtRa1/xpalXnxXEzlgVb9
         6n5sm0oQnG0dbr+t6QjHKJgfhQpuuVBfaJPxPwmQqZfDXXEcA+XZzggoV9ymPMVCjMZs
         Rl2A==
X-Forwarded-Encrypted: i=1; AFNElJ/9fRoNY4Enli2EOcmOWPfDmyQAKH1lEBA0SQ6VkMDZxJ7Obbg5u0ZthZpiunRppI9ZURKcfL97C2vQTdBrVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEVEkBxfWB5whsjMmRFL8DXl/LrfqXkJYidVP3ZzDqk/ky5pIO
	O3tOQvCe8aNQSDggiYhsAEaXeGMrRCdLpsDbxbzomHHhlQdFXlNRaeuw
X-Gm-Gg: AeBDievVAn9q/NdJZ8vC+vqNrFXUYPY7fmQ9FyiEho/BaqVB29xwzzMWtoRgzveu+v7
	lNpdM0hEPjKyUyYm1nwrn29NfB4wpgm9oHgJ6WxTk8X8tHojI7c40pAO7kMF8vrmuyhlXG83Eyo
	Z/qRBMBK3Gx4OgyIBjr00Ts4KwFU3hw61GNL+DOSNmFQo/l6ahXNJK0Wov3qEG1WR8kk/r7PQJW
	cxuz4gkbrXTOUfg5WUJhaKag/d9uUSV8RQQzUCtAiSCnGYs9r8E7V0dLRaVGDrqxLGe4/C+7z4S
	GC1sRgJMiKfABA46gFTSL8LJ55nO7cfvXrmhvcRPJZe5KnJ31HmasnZP24SWS6ikYVESFKu70LN
	A8KDSEOXuHgVJBp2+/UX49xLc8XqQlSI4ct9mq8t32FKx3i203aGu8mDHl1LelDJmt6uC1c/sKc
	K/OWuv11wRnXv/VQtbZ4iS6UWY97tby0LnGNHHLnUrOPsiLsqfeVrUNaEGEpfvJIThdw4D6NGwh
	cQ=
X-Received: by 2002:a05:600c:64c7:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-488fb73aa3bmr565343015e9.3.1777204163630;
        Sun, 26 Apr 2026 04:49:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb754842sm222683295e9.8.2026.04.26.04.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:49:23 -0700 (PDT)
Date: Sun, 26 Apr 2026 12:49:21 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
 ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 daniel.almeida@collabora.com, fujita.tomonori@gmail.com,
 viresh.kumar@linaro.org, prafulrai522@gmail.com,
 gregkh@linuxfoundation.org, arnd@arndb.de, tamird@kernel.org,
 lyude@redhat.com, airlied@gmail.com, j@jannau.net,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, Link Mauve
 <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V14 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <20260426124921.28eb433f@pumpkin>
In-Reply-To: <20260426085725.2090827-6-mkchauras@gmail.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
	<20260426085725.2090827-6-mkchauras@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 26 Apr 2026 14:27:23 +0530
"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:

> From: Link Mauve <linkmauve@linkmauve.fr>
>=20
> The core crate currently depends on these two functions for i64/u64/
> i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t use t=
hat in
> the kernel so let=E2=80=99s panic if they are ever called.
>=20
> This doesn=E2=80=99t yet fix drm_panic_qr.rs, which also uses __udivdi3 w=
hen
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy, but at least makes the rest of the kernel
> build on PPC32.

This needs resolving properly.

>=20
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> ---
>  rust/Makefile             | 4 ++++
>  rust/compiler_builtins.rs | 6 ++++++
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/rust/Makefile b/rust/Makefile
> index f6369d121c50..9aa18cff2fae 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -615,6 +615,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(=
CONFIG_64BIT))),)
>  		__ashrti3 \
>  		__ashlti3 __lshrti3
>  endif
> +ifdef CONFIG_PPC32
> +	redirect-intrinsics +=3D \
> +		__udivdi3 __umoddi3
> +endif
> =20
>  ifdef CONFIG_MODVERSIONS
>  cmd_gendwarfksyms =3D $(if $(skip_gendwarfksyms),, \
> diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
> index dd16c1dc899c..fc6b54636dd5 100644
> --- a/rust/compiler_builtins.rs
> +++ b/rust/compiler_builtins.rs
> @@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
>      __aeabi_uldivmod,
>  });
> =20
> +#[cfg(target_arch =3D "powerpc")]
> +define_panicking_intrinsics!("`u64` division/modulo should not be used",=
 {
> +    __udivdi3,
> +    __umoddi3,
> +});
> +
>  // NOTE: if you are adding a new intrinsic here, you should also add it =
to
>  // `redirect-intrinsics` in `rust/Makefile`.

