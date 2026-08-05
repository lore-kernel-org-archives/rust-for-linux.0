Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243183CF1FD
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 17:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785950687; cv=pass; b=NFTHRjxWA00Q3BL1nTsvEqOko9ee6sV6CEge3JhZubtHBKnmNdyWKaq2dcgt0eImuc4Ts/W3O1yKBK7xcjwSDBAO7vdYcYDD11oinT2Hk5UWlpTqE4KQO4hVVPblG8a7AmSX+mA3yFA/3z3v1DCz9gqRd5MHabUUzOU1y2FW+Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785950687; c=relaxed/simple;
	bh=lqsoXm6msVcY9U+iIeiwYgdVs6Tx/P7U6/+PspA3yMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RPXbPVEhSNOcsPeipi/o2vHxxXpf470Jr4pDOxYnBkafUXidNf4l8diQ85FPdbDIzzK0y80EAUi/hr6K97c383Ldo3Zq0969H/64lqNjqbRkRNiInPCBHnA5ddsk1b0I1bNvZPHzd+QVkiRb1lJasfK7Yeagj0VRkcqNq7kwm5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JkY8VfBU; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JkY8VfBU"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cacf197759so19391385ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 10:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785950685; cv=none;
        d=google.com; s=arc-20260327;
        b=rKomhqNOXp/qI56Lb3P9Hxr0o1qyTSh1jzH0hDQBbqFRKJ/tsDJap3asX5+YKhdRyQ
         ymdM2G6JCULyxJkDhcFmovQci/2owTom8nBUSfVcRAzENU3Qpn8OYR481I2v1OJSAq04
         iekh8qHvqY2NWICpMnLLDbyM33zafWaWWXCjOy5FF9yOdd4BTK0MH9xV/IsdjsuPk68i
         iWzemLr5/stUjc5mkzBAbvVmIT3fm1G8B3gkvPbpU+2xq71UFaf2eZhxtiEIWGHRYplO
         rslSGCp2TMjvSjfJIpQZyUAnGgPlD4IfW0rjl8t+BWj3PzpvVAUuj3FIh2v0OeyZ52Nf
         l/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hhSYt4d9matGJuiLLAOV82UjY/nIME2EtOpvh8wRLTg=;
        fh=yInqe1w3FUA8Fx4WVek+pagQIVr7y0iMqJduAiXbS04=;
        b=Z7NYA7Wxz3JLVOCNWe0ji7Zc86XI4jlJNzda63IQQuYC72E163FjgRkqH6x2/fVMEP
         MJMPHUyRo/bSGNe0mBQ5vrhkCrBz8xwr8Knquqg2C23iVBSmli9DJUCDP9TsGVgc+7cZ
         7CEfSspgbNDJNF5INT2/+LLzW1NlcqKsKHVu9ZxkHaPwI/g2GFLA7+0890+ON60ZfwNe
         bsZ583SlPy/CAzulLEJgy55ZoChPZfU7ow31Nt7NbMlqNjkasY0fvbNa0D2Zzt7HROzh
         EzKMeYCAhkR6oYY4NlAC1NGicuopNYyyG00diLuffCdzZk9uTNAPr51pH5oSWJws/fDU
         UqLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1785950685; x=1786555485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hhSYt4d9matGJuiLLAOV82UjY/nIME2EtOpvh8wRLTg=;
        b=JkY8VfBUk1kB+aHrcnZ/zyJYMbOgb+woFfma9U/a80ijWK/f0dtwcNN+6Fj/6Pt3sh
         1pohZzw9l1NZFLLSUX6RLacfVN3n0TpNbuZ29TxWwZn54u2ewdOQNCOXTlmTwQj9X2au
         Km7cVlAv/5TBJ107Hsh0RZSOoI7zcg38H62LkgMcUKRkd0tWwVtPZEk3q1B1ZdWjL5jk
         1+uZzX8Cdiy1RYVncaR9ypFUtcfaBO5xXbopVRbpVVDuB9AegGwUAp19QojpwY6ksAhC
         C4o/q7kB0H8pS4mk2X4MRJbhXkneiLMwXli79Ch+fq+hh+QXOpj1OCHdnIfZghtX1yB8
         vhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785950685; x=1786555485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhSYt4d9matGJuiLLAOV82UjY/nIME2EtOpvh8wRLTg=;
        b=eJSWoADJ8m8aCL+4Lvb3TGhsvY9xQ0rD531wnxG3iYKHRwP89tCd/Y+j1SkAYQmOB4
         1W1dIDp40+F1q7tu9aAZT7xQnSVOTmMZt8M7l2HDiNJPAdLSWlPT2qO4sPaTa5VZ64yp
         swJf/JXhQP7XoabrI9mkgM6K42SNrLmJ9flalHPhqHWa98J+EtV9WxN2URAi91dnd/M3
         Zd+WpjIKVz4tbNehpvO3TQNe+8Py0EEwk8Spt9Ep/zvtapwmkXTPI29l2jpjAMIdv5ut
         adu59a1dld8W1JYoFlqz9RhmXT11xQemRbd0CaWJ0x9yWzw7nTHY/XvmAcMmCks5Db/m
         T0dQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXOA6f0MEzkxUtMa/pYCIfl9Yglejl/jNrzufdmGK1rMvH1znMWal7pvxXN0jleBysEOyGCUBd7AN5zxAsSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8UEJowdE38jm/Qx7sLGjsfwEy8/wv9a9qm15bv76R52T1tP94
	AvZmtJbpbErVkDyVYwoMreizAcMOJ1i33ofryHAmx+RxANC8YB/8ljglGXsLDuO5LTggz7zcX/i
	pF+laMkLIHt1LG5HYM+2ZnxV8De5NPjvj8GaxwhkG
X-Gm-Gg: AR+sD107yTo07Od0HlgnU1TRYwQVmPKrZtymi5xSFbB37KLZYc5vZRyQo7P2LZCdzoi
	x1wSYOlnC8dtfZ39QDrngisZt/Rmgv5cxzw7LV/NpS0pwOq6AOsJD1GkQYqqWtHxDBBAX+4n2/L
	iF3jTR3As6XJwhMbfKJk/ZosRh3Bog6gzhlqPzu0WIEDa/xAcpjjO5qTKRfdwouIQfE8+DvKBhr
	cEvMcT6b2Xr6+EALMvfE1AT2RdTx9zEv+q/QWap7zuvD+kUB5RvmSCYSLjbi7NT4DN5tBEDWAfK
	ErqxkYK/gyTt4QPD2mNPb8bPfLthBMpryr2mlOt7Xx4/
X-Received: by 2002:a17:902:d58e:b0:2c7:1200:bd7e with SMTP id
 d9443c01a7336-2d0ca9838ebmr108122505ad.18.1785950685533; Wed, 05 Aug 2026
 10:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-rust-reverse-randstruct-dep-v3-1-7b8b2c761d6e@kernel.org>
In-Reply-To: <20260805-rust-reverse-randstruct-dep-v3-1-7b8b2c761d6e@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 5 Aug 2026 13:24:32 -0400
X-Gm-Features: AUfX_mylEjzCXDD3QT1Cy9_QSKHwq2vNWKIY4ZjNvWR0wcVwfxD1mF4zdKJhIk4
Message-ID: <CAHC9VhT6s5G_toXHBsZZ6=pNNfk+v__Wwt1mGE_7C+0WqjP6VQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v3] hardening: Default randstruct off with rust for
 better allmodconfig support
To: Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 1:02=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Currently randstruct does not support rust so we have Kconfig dependencie=
s
> which prevent rust being enabled when randstruct is. Unfortunately this
> prevents rust being enabled in allmodconfig, our standard coverage build.
> randstruct gets turned on by default, then the dependency on !RANDSTRUCT
> causes rust to get disabled.
>
> Work around this by disabling randstruct by default if we have a usable
> rust toolchain and rust support for the architecture, circular
> dependencies prevent us directly depending on !RUST. This means we might
> end up with a configuration that disables both rust and randstruct but
> hopefully it's more likely go give the expected result.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Changes in v3:
> - Rebase onto v7.2-rc1.
> - Link to v2: https://patch.msgid.link/20260605-rust-reverse-randstruct-d=
ep-v2-1-93d38023b6f9@kernel.org
>
> Changes in v2:
> - Add a HAVE_RUST in there too.
> - Link to v1: https://patch.msgid.link/20260605-rust-reverse-randstruct-d=
ep-v1-1-45ce9ee8d0d1@kernel.org
> ---
>  security/Kconfig.hardening | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

FYI, I believe Kees has been away from email for a bit, but my
understanding is that will be changing soon.

> diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
> index 6923036e1a2f..81c81ad983ad 100644
> --- a/security/Kconfig.hardening
> +++ b/security/Kconfig.hardening
> @@ -278,7 +278,7 @@ config CC_HAS_RANDSTRUCT
>
>  choice
>         prompt "Randomize layout of sensitive kernel structures"
> -       default RANDSTRUCT_FULL if COMPILE_TEST && (GCC_PLUGINS || CC_HAS=
_RANDSTRUCT)
> +       default RANDSTRUCT_FULL if !(RUST_IS_AVAILABLE && HAVE_RUST) && C=
OMPILE_TEST && (GCC_PLUGINS || CC_HAS_RANDSTRUCT)
>         default RANDSTRUCT_NONE
>         help
>           If you enable this, the layouts of structures that are entirely
>
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260605-rust-reverse-randstruct-dep-5a504c861128

--=20
paul-moore.com
