Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D842130AACC
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774689; cv=none; b=h2slEn+9DmJgehZacDBln/fV3BBVmwH2kfbv2qQrR9l0E6ETENLus1vn/Xet7aB95pQw3jPPNJVnzkfCwmPPcMGhHDypAwxN3BXULWI2SMt5TfdJbA4X20ukQ1UsjBvwOWVs3v8dWxno54hFU7BWuxRlQ7Qe0EHREHvAZ4uyLFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774689; c=relaxed/simple;
	bh=uxSBBgdJ6G0wqOTbxb4Aw2gp4edL/LWe0qLGHZZW64A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rZC8/um3RMDiO9IBW31cAb4CUkFjJdnIIT+V4Sr+pGjBr3gOPGbqWtltM2fPcuO2um5rQTQkdxc8fdZjBJhDS8w8sxisT7vmWA9IUw0xVMV+a67m59N8poj0XJAmRcv+LsBOs2iXI4P/q1Zn1oWP6Xpk1NH2Yj3dos1gBtCyv3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h/JNlBh9; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h/JNlBh9"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-640b06fa998so3220931a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 03:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762774685; x=1763379485; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMnqzGHQkZQbLlqJI77L5ey44wwkU20ch9eam4NwE+Y=;
        b=h/JNlBh9rSkXgIn7bi2tnlzD0j7SwzJMVwyBijlXQGsyemIGGNCQbwdeOyQd0HrJq2
         Suf9ctGtGA5tSU8HlkdfjDfQdaQ8FtzIKcjsFvPAsGToHyCcrx4hL+Y/RNlV14QB6NIJ
         QmyXuKH8EGNhPOrrnsf1rToK0Gb2zjCv9X89ni2D2CkpADPYDnUkyKaeMRrUIORtoDOe
         7MywCeAsoEfFAA5QWCo8YYJy1HDYqnoHS1VzKjOPytaxDhSt9sJQt/DxDEc1KNwMIOmK
         nGXUlgadghefvUyMl9jP/XwYspnqnEp+TxDl+Q5THEd41/1d2KjSctdd1SV0TQ6B8o3J
         6nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774685; x=1763379485;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMnqzGHQkZQbLlqJI77L5ey44wwkU20ch9eam4NwE+Y=;
        b=kYjprIziat/khcyvJYry864lN5B9Vk2OOS9qqMls1SkqRzTwBtl0NwtywjpdVgK8JB
         SuU8nPs9hGMI1YZcbPW+KpZeEUuYff8p/YLOMOHTyNtGkhoStgGlz8BljJ2cQzWf7ijP
         CqVzsbU6PAfNUToaClEx7Ys0S8zu7QLC9ta3mwp/+jXLErjzj6eHdjdkRYPthU3zqGlv
         JZZiedllmM7WtCYYvl1k4PI4v5NN7Uhy2rGBYtLWWJ61PaxhdbvOQeCv/5jixO85gSSw
         zk6LFwokwQ14ezhXK2++a+3nGLKGEoftjifqO8JoRoOexT97X3jbUVo6BPauCW23agsR
         zi4A==
X-Forwarded-Encrypted: i=1; AJvYcCXbYTY61eHfeViTMHqQOZWaOvEBabeQgKFj60qSvQt3aQEmTG9Cx/NySl8+XMmsQrA/W2sRCLnIuI2QD6fupg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSobNNDwLUEObN4IzDHxslWIlQhNH5Q9Lads32dED560ynoTfY
	r5aBVeoZQW79P8xnOCT2/ORXyrSJjkcvHJbP3Dez21XJTmR67ccd7f8DSnieNEPIeskeXVEG3y6
	3h2KyQSiQdVSXeZRQgA==
X-Google-Smtp-Source: AGHT+IGSOTdSHkqL0poJ5tqc7TrtRGaLiDYCsGpAd4/lDD5jX1KPXKGf/AHVmm5qz5MunTDbIDoNGHc6Ka1J5BQ=
X-Received: from edbek21.prod.google.com ([2002:a05:6402:3715:b0:640:cfc4:f37f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:354b:b0:640:9b11:5d65 with SMTP id 4fb4d7f45d1cf-6415e822920mr5942384a12.24.1762774685141;
 Mon, 10 Nov 2025 03:38:05 -0800 (PST)
Date: Mon, 10 Nov 2025 11:38:04 +0000
In-Reply-To: <20251110095025.1475896-10-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-10-ojeda@kernel.org>
Message-ID: <aRHOnGyLx-bEVqcY@google.com>
Subject: Re: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 10, 2025 at 10:50:14AM +0100, Miguel Ojeda wrote:
> With all the new files in place and ready from the new crate, enable
> the support for it in the build system.
> 
> `proc_macro_byte_character` and `proc_macro_c_str_literals` were
> stabilized in Rust 1.79.0 [1] and were implemented earlier than our
> minimum Rust version (1.78) [2][3]. Thus just enable them instead of using
> the `cfg` that `proc-macro2` uses to emulate them in older compilers.
> 
> Link: https://github.com/rust-lang/rust/pull/123431 [1]
> Link: https://github.com/rust-lang/rust/pull/112711 [2]
> Link: https://github.com/rust-lang/rust/pull/119651 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Makefile                          |  3 +++
>  rust/Makefile                     | 32 +++++++++++++++++++++++++++++--
>  scripts/generate_rust_analyzer.py |  7 +++++++
>  3 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index fb4389aa5d5f..6ff887523eee 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1830,6 +1830,9 @@ PHONY += rustfmt rustfmtcheck
>  
>  rustfmt:
>  	$(Q)find $(srctree) $(RCS_FIND_IGNORE) \
> +		\( \
> +			-path $(srctree)/rust/proc-macro2 \
> +		\) -prune -o \
>  		-type f -a -name '*.rs' -a ! -name '*generated*' -print \
>  		| xargs $(RUSTFMT) $(rustfmt_flags)
>  
> diff --git a/rust/Makefile b/rust/Makefile
> index 9eea6563ef35..a614a23023cb 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -27,6 +27,8 @@ endif
>  
>  obj-$(CONFIG_RUST) += exports.o
>  
> +always-$(CONFIG_RUST) += libproc_macro2.rlib
> +
>  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
>  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
>  
> @@ -76,6 +78,17 @@ core-flags := \
>      --edition=$(core-edition) \
>      $(call cfgs-to-flags,$(core-cfgs))
>  
> +proc_macro2-cfgs := \
> +    feature="proc-macro" \
> +    wrap_proc_macro \
> +    $(if $(call rustc-min-version,108800),proc_macro_span_file proc_macro_span_location)
> +
> +# Stable since Rust 1.79.0: `feature(proc_macro_byte_character,proc_macro_c_str_literals)`.
> +proc_macro2-flags := \
> +    --cap-lints=allow \
> +    -Zcrate-attr='feature(proc_macro_byte_character,proc_macro_c_str_literals)' \
> +    $(call cfgs-to-flags,$(proc_macro2-cfgs))
> +

I don't understand this. We enable the features even on 1.79, but we
only pass the proc_macro_span_file, proc_macro_span_location cfgs on
1.88 and above?

We add the appropriate feature(_) invocations on older compilers, so
should we not support those things on those compilers?

Alice
