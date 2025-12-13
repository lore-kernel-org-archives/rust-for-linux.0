Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD919463
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 07:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765609569; cv=none; b=C3TCscVuuh6DxzqkN6LqU0cH43MGPKdbgfoKkry1WH6/Vf60irn68336f8ov4kxJSV+N6EDwPS4RYl1lc3polt98guAiTdnJWACajRS78tRXVGMT7imk3FUrrL5lB0x2r5jRhI/9CWBJp1lUp9X8Wr7zuWZiKwdmCNDjGV8PTSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765609569; c=relaxed/simple;
	bh=sE/EyXXimWQedlIS9kSYL8xotY+s2Jg5Ps+K1WvYiAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXSL0nwuVcoKU0jtg3NL7mbKSkJBFa4RQ4iGB41zAKRm59uWhreT8J7OTRO2INtrwUYQ0EGR74W0/lua4QtoPcZPm7fYGco/ba9PhfiGqGWGTYbqxTcMrHfcHbeL3+YADhuvPVDcNlmKrH6rtJykX15vytHSQOyKN1DlKHZC9kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJAxMw6U; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJAxMw6U"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so10944425e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 23:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765609565; x=1766214365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlggRzqJp4Lvfcs8towPJe8czeydtpdFLnsmM6SNOmw=;
        b=lJAxMw6USVqY+IjMYnoG+zzGP/wbTkyfihNFdhJJDVuQ2IktWT3lDdIB3otp8c2WGX
         wEjXD9gCGlSO1ZoKyZ+bpdrwZJD0JChXI+WP88tJ+zt2cfszyfzjovPlKyVdzCFFX6T4
         fSJGX2wm3ohRo82KyA7Q/hWUNlVxeg2/jvT5hrgdcPXCe0bgGNdMrQREesJ7GXWfh7Q3
         W8cXPX7nYJpEc4E0H0WCAcFUcmGiP5szNVcvfW/N16zxlv1OhMiV0yeRKt65nY8m+a/m
         zoaF296AqASVxAESmMEnA21XsE2HfkNX9OKSJHoOvkZUlk46/knm/RrAkGgQDXNXbX/l
         UN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765609565; x=1766214365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlggRzqJp4Lvfcs8towPJe8czeydtpdFLnsmM6SNOmw=;
        b=gZmKZZF4CYC8BZQSvC+G3Y8b1dWItDHcXujv+8Z2vs2u1Y5SkK8w5GJJSd3jkCbBWe
         4f9jRtKKLnc/FFS7sKFpaUzRu8hYhNrGcVuI/qP+m+tChMz4KkiStaZw6K4AfAYrKb8V
         FArODJZVr2JOMrofxmDV8dXFBMfggxEu8zNUMwHFLkwSfQ88eQV0NHa3n8ijJquZ/lGC
         iq28CLgQmlM0lTO7y7L2Rjp5uyDiucUIIyXQiOJ40KZl/v00Lx429Zn4peOKMzXF8XW1
         vhSP1RpINbZwtWuAbnlmaDuaLEf4yFR05rttFTsYSeBRMCMxNfLk6SOaVvOgkT8qyWo6
         r+hA==
X-Forwarded-Encrypted: i=1; AJvYcCWpCl3s+p+7UeAbWd+tIlD1tBFUl5r7YoYB2UZ+3baEAPlSjDey9bLuYjNLVZP0BNO8/1j77nFQb4Ce5CigmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy70RcxYwkMUdhPIYxTGEY4jgr5Ns3k4x+xWgwIbjDrQCQzfAYI
	haka61qmX5a+79C/Au6Y/7UpWL27l+xXwJNQzWU2CH7HQKWDxvtjqG8U
X-Gm-Gg: AY/fxX7Tt4r//bnz+mcO2cGWFvYLLc60Bi15qJycZYsDFaKwzi9cyCB0FRaLjI59qr3
	nA1U4TJYGjcVFAvfOxCJbpVDpMjAdCnLGtCu5zfL+o8Ak8c7dAJbsAB6ND8+QzR1LO0ZxNDTwrV
	HZGDowbmTCDFGMR82gys/YjxTiaKynqBmjJXmniA5Z2/GCItmzgh1jFUHYD5LUsi07N63+trneG
	8I+mLBZH20SkRHnjjGN78mybecaTSzeT2O9R/Dm4W6s6xRVW6WhlWswysAldVBdM/EHKvrs1qiO
	Md80GN5B7tcALK5bD2lhebye1nka2ObQGNTGDS5IZ2YzSTQuc7ckIJz32sNmpMy1tvTwM+Zit08
	+mA+lP4XyTgT8K+BSe/dkMLH9OLSxYZhShTMWe3E2ORF91Lnl4hqI/lNK/cfb5oo7a5BtnI9hGD
	uOx6BtZIA/wcjCAhuGFbJ1EIMxRBOrjsw8gtIcLiWHsRKvjHzKNiyCd52tbEhqNYJjWublxO23J
	VE5lv5vX7Nkr3JjM+u/XKuz1jHfhgp7HyiZeKY8ikR0nA==
X-Google-Smtp-Source: AGHT+IGudL1cl5s1SKkweCc09Z0Zj+UmvZhwk9yOyEqnOsuqKxzAGFrRKdViXGhXL+k4+dk0lFVX7A==
X-Received: by 2002:a05:600c:190c:b0:479:33be:b23e with SMTP id 5b1f17b1804b1-47a8f907d4cmr50452015e9.17.1765609565386;
        Fri, 12 Dec 2025 23:06:05 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:c706:d28b:5de4:d353? (p200300dfbf2de300c706d28b5de4d353.dip0.t-ipconnect.de. [2003:df:bf2d:e300:c706:d28b:5de4:d353])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a66614sm15996305f8f.5.2025.12.12.23.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 23:06:04 -0800 (PST)
Message-ID: <0ed88191-a40e-406f-bd75-4992fdbe2fdd@gmail.com>
Date: Sat, 13 Dec 2025 08:06:03 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: Add SoC Driver Sample
To: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20251212-soc-bindings-v1-0-db51044ce805@google.com>
 <20251212-soc-bindings-v1-2-db51044ce805@google.com>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251212-soc-bindings-v1-2-db51044ce805@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.12.25 00:14, Matthew Maurer wrote:
> Shows registration of a SoC device upon receipt of a probe.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  MAINTAINERS              |  1 +
>  samples/rust/Kconfig     | 11 +++++++
>  samples/rust/Makefile    |  1 +
>  samples/rust/rust_soc.rs | 74 ++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 87 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4ff01fb0f1bda27002094113c0bf9d074d28fdb6..bb2e710277cc84dd6042d4d46076e665d9f68752 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7705,6 +7705,7 @@ F:	samples/rust/rust_debugfs.rs
>  F:	samples/rust/rust_debugfs_scoped.rs
>  F:	samples/rust/rust_driver_platform.rs
>  F:	samples/rust/rust_driver_faux.rs
> +F:	samples/rust/rust_soc.rs
>  
>  DRIVERS FOR OMAP ADAPTIVE VOLTAGE SCALING (AVS)
>  M:	Nishanth Menon <nm@ti.com>
> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> index 3efa51bfc8efccd91d9ee079ccd078ed1a6e8aa7..c49ab910634596aea4a1a73dac87585e084f420a 100644
> --- a/samples/rust/Kconfig
> +++ b/samples/rust/Kconfig
> @@ -161,6 +161,17 @@ config SAMPLE_RUST_DRIVER_AUXILIARY
>  
>  	  If unsure, say N.
>  
> +config SAMPLE_RUST_SOC
> +	tristate "SoC Driver"
> +	select SOC_BUS
> +	help
> +	  This option builds the Rust SoC driver sample.
> +
> +	  To compile this as a module, choose M here:
> +	  the module will be called rust_soc.
> +
> +	  If unsure, say N.
> +
>  config SAMPLE_RUST_HOSTPROGS
>  	bool "Host programs"
>  	help
> diff --git a/samples/rust/Makefile b/samples/rust/Makefile
> index f65885d1d62bf406b0db13121ef3e5b09829cfbc..6c0aaa58ccccfd12ef019f68ca784f6d977bc668 100644
> --- a/samples/rust/Makefile
> +++ b/samples/rust/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
>  obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
> +obj-$(CONFIG_SAMPLE_RUST_SOC)			+= rust_soc.o
>  
>  rust_print-y := rust_print_main.o rust_print_events.o
>  
> diff --git a/samples/rust/rust_soc.rs b/samples/rust/rust_soc.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..ca0294819f100fa7b713c6b41c5b8a9b3906b863
> --- /dev/null
> +++ b/samples/rust/rust_soc.rs
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust SoC Platform driver sample.
> +
> +use kernel::{
> +    acpi, c_str, device::Core, of, platform, prelude::*, soc, str::CString, sync::aref::ARef,
> +};

Should this be formatted according to

https://docs.kernel.org/rust/coding-guidelines.html#imports

as well?

Thanks

Dirk
