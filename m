Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794409312;
	b=Vzzbw6NBNa+LzN5n79UzPPpaoY3xJZirJ4mgqI0mmjJ4f9Aj9fXYtZFzFQXpnTvE3F0p
	 +KcNqoaJMx9MkCrrGBRJZKIxALBD0QRL/3U4heTqRSXQfO9ntyudDH+XBCxRgbUltLA89
	 GLj7Hg6X/xoxxieBgty6FmY+Vv2cY2ipxP16ZwKOoBI2iOsrmR+CGAjDHny21FdqqWCzC
	 ++XVWZOscfCT9UOyMq22aKGyntbGvMn1ANg4pa26WZQzs6AG+1U+BBL36oiZsYF+4wAUD
	 UbdTvmkeBwT/rYfvgrmG3HewOOReEOmAg0Wox8LaZ9oUHqtlcPJ5tk8z6S2KDK/nTCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LuH/FchAPzPfL0iN+E/sfDlagGItJpnZueLbNz7+kkE=;
	b=vUKfXQdjyccqqkFS6F88diITdSaWpGYLH2HIOrD+mNisHPCeY2TblM39yrRBg/A/LdnG
	 l6qQ5YwkMr/1G2BEefZBinki+QxhGetmOg5+7G9fes6shimxuUNAhY9DF0eFGrGzhkvs7
	 3hmNysrgI47t5rthvBU7Ffa9gpSRm4cYCDYY9/dB++EtJzq4dhqIp7xr4M219FA0JqM0P
	 XzQ0LU+icBGvCyGZ4UngC4fahXrOVB0lZsmG5ae3ldzb7DygbP50pN2eoKqVmrY5xc2CV
	 bolQdgYemkBEsU52IAd5dWKlCQqIIeAFbOpXrgva31lKLVFxS6+7gbnyFUnqnKG8fng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JW2l2QPg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1F6606A321
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 15:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C1F6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JW2l2QPg
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso9201a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 07:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794409310; cv=none;
        d=google.com; s=arc-20260327;
        b=I99GHSn7GRHVI/SjiSB0RMdS+3githWK8QWUnF3t8KCbKwlZ+FWzhXWsB3+RxSmTzM
         ldG0P778W+q82DBEJLLZq0SqFFd1RbFkV8U3Mn3It0DFcTsJ9QkRzNsCChiahDIyN/Lt
         6oUeA7W6Rmmkjkp+V5fCNtQ/6NwvUWE35S1kbrOo/d1gzJ7y9TN0VSB3hzTCu2rP2CNI
         opwhbRWTFiThCC5SgxiKzuV7ZPw+xxlzydeY2/17V/UhoayhsgsBv0PZ4zVAcYEFpF0p
         9S33m1wMVe3usmx0CN5etsnPOFx5YxKRgBKzai1tij7Ay0+myRXM7D7Cc0zeVGTO4m5C
         lJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LuH/FchAPzPfL0iN+E/sfDlagGItJpnZueLbNz7+kkE=;
        fh=sTCW1KZuxLOAN6wToAlnrk/ulfMW+tAt1EYZqegLblQ=;
        b=eJWMoIvU5M3OC5GVDiuqmiPF4Fg2vrBBI71l2LloIfoSUZNHC6nceasyauWuPjTCID
         BCi0jAKB4+t5k/VNRkzdhP5jKkGkeLzy2FKJ85rAOv+czoJMza9eFPVcb1/vjH/g34y6
         5f0PCEmGpZRDJP2ZyrGob5/TYL7U0ZTz4VAcEP6udAtgLyE1UaakraBS/rY7aCiAgIMB
         jOCfSKZoFeg8JLIXhk0FOlgWvlIFj+k5YesjCOQ7lXhz/JeH9x1YW+bATwm/eQhAkDVz
         81R8aUAUxs+ej5znvum5U5tJVFTvKuAHxHR/uDTTyMABTohkjZ1M10yV6F9PUFfIwz3y
         cMCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794409310; x=1795014110; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuH/FchAPzPfL0iN+E/sfDlagGItJpnZueLbNz7+kkE=;
        b=JW2l2QPgEKsDzGNiWMx+apYofish0b0DwrClK/hBnStbtouCu5GGOKazzLlkaPWKXj
         O3nF2U/06VEFSCKucvY1jlo3naqCryWRocrEGa4zY+2zgBvqiVwnCMayO0olxMMOX4Qk
         jNyHektRMTArR89PIpBI9TKiUSrP9FF6e9ZL6v5l7PzpPbpE5Skyf26pakUybsgkiPB5
         YyiN7jQEkdfAknNxADgSmbW0tx75pix7nHbM/j29CFXhA58utrzYQt9TNn2uVbJoGMVa
         3eylzRkwEQEp9P3RYCHoHpVFFk/YZdXGSNj/R+mU2QSDa3QEf2GI6WMmOC8+Y1Dqx8Jn
         +WdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409310; x=1795014110;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LuH/FchAPzPfL0iN+E/sfDlagGItJpnZueLbNz7+kkE=;
        b=gixP3/MqRUT4Burr5o/2QiNa5bWnxLqWiKTNnth7Z1OPNGKhFY5dwzySyAY1bWJTsf
         ojQcEqgBsUGQgfoLSR1VXSbD2r2sb3IlCUnsAaKEEeVoH+SZAYWwFv1YIQX05w2BvOSm
         t+eK0hMnPcAbBEMCCDCxanYOFu2ZzgGkX6dTP0Gxx8GJ98HalNlqvIJvqvewS7SWGxqP
         1lZ/A+QCQhxcksY+o3TcY5UcgR2xhs6qjbA/XAHjouxHG+TiWQxR2h8zeZW/VbVz2sUT
         ptyRi/h+Bk23vRFxMid293m6k/83OtSFGSygj/itdQY4uezsMd3+6CRnZp/5z70ZJfLZ
         PlJA==
X-Forwarded-Encrypted: i=1; AL+hErGtsR+JepndQ9MH8qIYA1uBEvZIQbh2rqt0rcNMTxX/HyguX8e2VnLS5ybotKmiMS35QmevnF9Nm1RXcg709w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/qrU/Ay2G2qHqQJb1ord5F2ukUwJwvkq1G1OQtJ1JL8R9VUmEu
	1IX9n+6VuW6KFJa1YHuXEwL4mBVht6IRkDJKcVPJ099k7nrYkCDN/6Y+uhTopsFeMu01pTP+q7l
	21D/9uLHNIaU1tG3IFJcfc90pVxuBdbnQgxvopz+w
X-Gm-Gg: AYBFou18vgLK5X5fktPHhzlayykKLTcoOarV11ESyv/Nn//JHaIsW+v5ZM5BxVUwsGq
	PgtuxpCiQ6xvvRcCWdn1BhVZo1LqGYM+JbODx6oD88/UzRxjszkY6sQmgwoAjEK3CPYEsgcc32K
	dJqTgbhEZGGGR7rayTYnV0/UazpejrAIBXN8xskW2edssTkUiaT2wYl5qRg08Lb7eY5voEAM4vX
	f0BYZhlrLhaM9Nj1kqQKMGZm9KhOiihkf7DskXyBPK9Fnr+qTKVsWg4vyJdjmK8PIQjebvUJ+2B
	Nh/tbPRVWTPejar1iH1GU/VvejTdeyjy/qsbJYDvqH0gMjP2jUKqFBzNvEEU4+fsNFwWpG/FFbK
	4SNAijpizEd91nXbXfuoE/8CroSZOHu5Sygyg+A==
X-Received: by 2002:a05:6402:46d6:b0:6b5:70a4:c77c with SMTP id
 4fb4d7f45d1cf-6b77da26eb9mr68980a12.11.1794409309341; Wed, 11 Nov 2026
 07:01:49 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAGvU0Hm04LXTywU0eL6KN4=SoOAC+LU3BKqENnLR-WV-sHsuNA@mail.gmail.com>
 <20261103165833.418845-1-gprocida@google.com> <DMQS0SH6975Y.23Z4V64W0HWN5@garyguo.net>
In-Reply-To: <DMQS0SH6975Y.23Z4V64W0HWN5@garyguo.net>
From: Giuliano Procida <gprocida@google.com>
Date: Wed, 11 Nov 2026 15:01:07 +0000
X-Gm-Features: AclHuK_zSrM-gyIFWZ7VxtFpClMKugomAWhetmW2iYZri8o7Wvx2yOx0wVwL_M4
Message-ID: <CAGvU0Hn00iMkAEMLBZmaJ+ub+Q2aJTtvJXgdqWfbjDyFUus2mQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] clean up EXPORT_SYMBOL_RUST_GPL
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 15:14, Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Nov 3, 2026 at 4:58 PM GMT, Giuliano Procida wrote:
> > Move EXPORT_SYMBOL_RUST_GPL definitions into linux/export.h and
> > prevent the emission of bogus type information for Rust symbols.
> >
> > Addressing review comments, the first commit now ensures the moves do
> > not trigger warnings from scripts/misc-check about missing symbol
> > exports by extending regexes to match EXPORT_SYMBOL_RUST_GPL as well.
> >
> > Giuliano Procida (2):
> >   rust: move EXPORT_SYMBOL_RUST_GPL to include/linux/export.h
> >   rust: exports: emit ___EXPORT_SYMBOL without C declarations
> >
> >  drivers/gpu/Makefile                      |  4 ++--
> >  drivers/gpu/nova-core/nova_core_exports.c |  5 ++---
> >  include/linux/export.h                    | 14 ++++++++++++++
> >  rust/exports.c                            | 12 +-----------
> >  scripts/misc-check                        |  4 ++--
> >  5 files changed, 21 insertions(+), 18 deletions(-)
>
> How about just getting rid of EXPORT_SYMBOL_RUST_GPL completely? The only reason
> that it exists is because EXPORT_SYMBOL_GPL in C expects the symbol to exist.

At some point there may a desire to limit which Rust symbols get exported
on a granular level like for C. But that's out of scope here.

> We can simply change change rust/exports.c to rust/exports.S and get rid of
> EXPORT_SYMBOL_RUST_GPL completely (plus saving a C compiler invoocation):
>
> Something like this:
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 0165626decbe..75de47028b60 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -571,7 +571,7 @@ rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__(p
>
>  quiet_cmd_exports = EXPORTS $@
>        cmd_exports = \
> -       $(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n") > $@
> +       $(call rust_exports,$<,"EXPORT_SYMBOL_GPL(%s);\n") > $@
>
>  $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
>         $(call if_changed,exports)
> diff --git a/rust/exports.c b/rust/exports.S
> similarity index 86%
> rename from rust/exports.c
> rename to rust/exports.S
> index 1b52460b0f4e..efe6bff0f983 100644
> --- a/rust/exports.c
> +++ b/rust/exports.S
> @@ -13,8 +13,6 @@
>
>  #include <linux/export.h>
>
> -#define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
> -
>  #include "exports_core_generated.h"
>  #include "exports_bindings_generated.h"
>  #include "exports_kernel_generated.h"
> @@ -25,5 +23,5 @@
>
>  // For modules using `rust/build_error.rs`.
>  #ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
> -EXPORT_SYMBOL_RUST_GPL(rust_build_error);
> +EXPORT_SYMBOL_GPL(rust_build_error);
>  #endif
>

This doesn't cover drivers/gpu/nova-core/nova_core_exports.c though.
