Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5911FE44A
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 17:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632613; cv=none; b=aQlxeL8i/B38H/q1chriamuydITviKaI5E4yWrICXCr6Uy78nyXr0UyrJexVRkKAeP1HMw4ZGjSTmLRYXqbjWVdKLJailEano2+hx3FahxXxPtwfe3CFz0xH+2Cg7ItF2z3JeHVU4Z/CtRS/+TrfqeTmPzqNJIP5eFaI6ljEN9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632613; c=relaxed/simple;
	bh=N14dZVc9vTLW0oh1eKAbE1UDroXlvYied7zrMk/D+UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHReFr5ZFGKQSWvfYzUNf4d4imsr+CNnpBkS6M9W91nBFDFlGruD6BlJQZu8Jx/yHDG7Vv1zvc9hosXSVss4c3q30Ttme8PCLbZjczvj2wEXZC01nOXniT2iYJizZPMqmdRODjOL0M5yBVxauMZwDkfbUC3wlsIrX34niy+w0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAjryMcf; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAjryMcf"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79045634f45so2214467b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 09:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767632608; x=1768237408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rVdUSzzxHV8dZysVvdcW5SugnSBaNdFEMUgp6qzC8gU=;
        b=OAjryMcfOaoPOdTTIjcBidpPNScC681+Y/D6ehtb7EGbqOfJ0lRNcHXln4KtE+gZXi
         Hq0tK43fVTIHrevWf8JFs1g8hzVjVzNO1jDO6MQydhOs8uOl+oTCbdzaYAPS09Jq9vRU
         hh1KKYGI/MF3lTLSusyFthQhbPuGHa5t077JC+EQ/j8lVwcIbGatiAykPvTD8731nHJ7
         gLrSzww+hqv166I2ilnwWYj1b1mwWnPvNLW+mIAs1dKxRYqmtkjfJMRyFA3OaZO+HTfL
         USG2TS8/DWvhKfR16UuwZY9t8B4pu/8pWvFM7SjL9LCeuHqTB8mk6A1ekFUD8JjxuifC
         PSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767632608; x=1768237408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVdUSzzxHV8dZysVvdcW5SugnSBaNdFEMUgp6qzC8gU=;
        b=lZ+LgPr2e63kfy9CJjbNwVXofyiHxWSIN7nGtASFirODRdSUZoH+5vss7IMs3F9qjg
         pcdGqzwv1I++zIWXqGhhaZ/r3zBUfiAQy6ma4jnZ378F51S5XQ0XXYpiUqYBFrFEFZqg
         P3qN3NxNEH+qhIIcOxMA9xDu2aBjN3FW9zcGPBdbM6q7OWoY5f1GCzbXDQVratxDUh+d
         3vxe6ia6y5TB8q0UVJ7EG4za1LyF2wfWqscHmvmW1vb846TppqupWgEhWR1CjV2f1w90
         adDA4+a90PYXhTJgn0NcgsBj7QyFaPQd7q1VJeH53hEweGPAmw1UygZiGKcapjVjh3gs
         z99A==
X-Forwarded-Encrypted: i=1; AJvYcCUDJnhKZ0vBK0YFkbyums+sXwQmDe9QYBrnf/xT9V64fPJ3+gE00AuQfapxyEvYdbLRcdUaRQSkCwAqsqBJOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHLKU+9NmiBlWifQXQ588LCQsAdiJ3ehxLHyerzKnK388bYDAR
	HBS8Je3x/kKSbIuadusJNNDeSelF/tNq2LTuwXst0xtnB0qKhy3F2f9R
X-Gm-Gg: AY/fxX4qrQT3z2U+dXnZCbfMqmJyZJXbC3eu9kqV8ZMoPNEn88GXW7iYJha7Ui76sRB
	d1kmz59gruyyl353kAmgtvUKmJclrKqUfDC0xt3KtM3FSmTXXS26PDobKrO12kENpi5pki57a1T
	8TzMDDYnRAcW8x6zb3HlLHY6YHy1x7FAHzJVGsoqmiH95pBE2tGBVFn2G5lUg/gxEIz468ttrEF
	nUjYfS1WfA8lyCysn7SZa9Ab8/IpV8QCrtWmjHwlOtEOp17FYts34i2xJLHyeZs303Gq9dKX0mf
	YT965CgO6xN0j1d0tEsNcjGambWVywnVDIlLba1Ef72xHyzaRgBEbEww2CFUTZIoWq0nemXvB0z
	iOhh4YZhaXIMp37qyqpTSCjND5OeXLuQH5smiuYxAHhJFsC4AZJGo4bu+sjcVRi1aPxSWxl2p+t
	NpJczFMS0=
X-Google-Smtp-Source: AGHT+IFwZusyd0qviV3+UDmgZyv+kp9rf3jSujTbP0tJ/F8xB6jJMvw66Eng5dzCVjwg6hrobpRNAw==
X-Received: by 2002:a05:690c:3746:b0:787:f793:b573 with SMTP id 00721157ae682-790a8a87dc8mr2403767b3.29.1767632608366;
        Mon, 05 Jan 2026 09:03:28 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:830c:9f83:df41:3e7d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790a88ed5e6sm765547b3.55.2026.01.05.09.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 09:03:28 -0800 (PST)
Date: Mon, 5 Jan 2026 12:03:27 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Burak Emir <bqe@google.com>, Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] rust: bitops: fix missing _find_* functions on 32-bit
 ARM
Message-ID: <aVvu3zF2rYKR3XC0@yury>
References: <20260105-bitops-find-helper-v2-1-ae70b4fc9ecc@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-bitops-find-helper-v2-1-ae70b4fc9ecc@google.com>

On Mon, Jan 05, 2026 at 10:44:06AM +0000, Alice Ryhl wrote:
> atus: O
> Content-Length: 4697
> Lines: 121
> 
> On 32-bit ARM, you may encounter linker errors such as this one:
> 
> 	ld.lld: error: undefined symbol: _find_next_zero_bit
> 	>>> referenced by rust_binder_main.43196037ba7bcee1-cgu.0
> 	>>>               drivers/android/binder/rust_binder_main.o:(<rust_binder_main::process::Process>::insert_or_update_handle) in archive vmlinux.a
> 	>>> referenced by rust_binder_main.43196037ba7bcee1-cgu.0
> 	>>>               drivers/android/binder/rust_binder_main.o:(<rust_binder_main::process::Process>::insert_or_update_handle) in archive vmlinux.a
> 
> This error occurs because even though the functions are declared by
> include/linux/find.h, the definition is #ifdef'd out on 32-bit ARM. This
> is because arch/arm/include/asm/bitops.h contains:
> 
> 	#define find_first_zero_bit(p,sz)	_find_first_zero_bit_le(p,sz)
> 	#define find_next_zero_bit(p,sz,off)	_find_next_zero_bit_le(p,sz,off)
> 	#define find_first_bit(p,sz)		_find_first_bit_le(p,sz)
> 	#define find_next_bit(p,sz,off)		_find_next_bit_le(p,sz,off)
> 
> And the underscore-prefixed function is conditional on #ifndef of the
> non-underscore-prefixed name, but the declaration in find.h is *not*
> conditional on that #ifndef.
> 
> To fix the linker error, we ensure that the symbols in question exist
> when compiling Rust code. We do this by definining them in rust/helpers/
> whenever the normal definition is #ifndef'd out.
> 
> Note that these helpers are somewhat unusual in that they do not have
> the rust_helper_ prefix that most helpers have. Adding the rust_helper_
> prefix does not compile, as 'bindings::_find_next_zero_bit()' will
> result in a call to a symbol called _find_next_zero_bit as defined by
> include/linux/find.h rather than a symbol with the rust_helper_ prefix.
> This is because when a symbol is present in both include/ and
> rust/helpers/, the one from include/ wins under the assumption that the
> current configuration is one where that helper is unnecessary. This
> heuristic fails for _find_next_zero_bit() because the header file always
> declares it even if the symbol does not exist.
> 
> The functions still use the __rust_helper annotation. This lets the
> wrapper function be inlined into Rust code even if full kernel LTO is
> not used once the patch series for that feature lands.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6cf93a9ed39e ("rust: add bindings for bitops.h")
> Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/x/topic/x/near/561677301
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Which means, you're running active testing, which in turn means that
Rust is in a good shape indeed. Thanks to you and Andreas for the work.

Before I merge it, can you also test m68k build? Arm and m68k are the
only arches implementing custom API there.

Thanks,
Yury

> ---
> Changes in v2:
> - Remove rust_helper_ prefix from helpers.
> - Improve commit message.
> - The set of functions for which a helper is added is changed so that it
>   matches arch/arm/include/asm/bitops.h
> - Link to v1: https://lore.kernel.org/r/20251203-bitops-find-helper-v1-1-5193deb57766@google.com
> ---
>  rust/helpers/bitops.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/rust/helpers/bitops.c b/rust/helpers/bitops.c
> index 5d0861d29d3f0d705a014ae4601685828405f33b..e79ef9e6d98f969e2a0a2a6f62d9fcec3ef0fd72 100644
> --- a/rust/helpers/bitops.c
> +++ b/rust/helpers/bitops.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  #include <linux/bitops.h>
> +#include <linux/find.h>
>  
>  void rust_helper___set_bit(unsigned long nr, unsigned long *addr)
>  {
> @@ -21,3 +22,44 @@ void rust_helper_clear_bit(unsigned long nr, volatile unsigned long *addr)
>  {
>  	clear_bit(nr, addr);
>  }
> +
> +/*
> + * The rust_helper_ prefix is intentionally omitted below so that the
> + * declarations in include/linux/find.h are compatible with these helpers.
> + *
> + * Note that the below #ifdefs mean that the helper is only created if C does
> + * not provide a definition.
> + */
> +#ifdef find_first_zero_bit
> +__rust_helper
> +unsigned long _find_first_zero_bit(const unsigned long *p, unsigned long size)
> +{
> +	return find_first_zero_bit(p, size);
> +}
> +#endif /* find_first_zero_bit */
> +
> +#ifdef find_next_zero_bit
> +__rust_helper
> +unsigned long _find_next_zero_bit(const unsigned long *addr,
> +				  unsigned long size, unsigned long offset)
> +{
> +	return find_next_zero_bit(addr, size, offset);
> +}
> +#endif /* find_next_zero_bit */
> +
> +#ifdef find_first_bit
> +__rust_helper
> +unsigned long _find_first_bit(const unsigned long *addr, unsigned long size)
> +{
> +	return find_first_bit(addr, size);
> +}
> +#endif /* find_first_bit */
> +
> +#ifdef find_next_bit
> +__rust_helper
> +unsigned long _find_next_bit(const unsigned long *addr, unsigned long size,
> +			     unsigned long offset)
> +{
> +	return find_next_bit(addr, size, offset);
> +}
> +#endif /* find_next_bit */
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251203-bitops-find-helper-25ed1bbae700
> 
> Best regard
