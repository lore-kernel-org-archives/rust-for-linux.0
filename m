Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D456A30DD3C
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 21:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325590; cv=none; b=OwTLgzkkPidyYmAU0o6HRwgbqaZ3gmZDI4smLwfW2D2lJgs1pgaYIN7VxDhGCrUDbLbwqinAEaTEDWXJPEUQxEmIglaAAM6eK0+1HaP+kNwsTLhjP0ex5xkbMnkCbObfBuc9fwW5x94GQoFEgH1YWOEkCF5XmUjQ5ULWYMW0fk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325590; c=relaxed/simple;
	bh=HlofWzQf4nysuWsznfCeKxoDLC/TTjA612tfov2GPTE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=F0OSt1j6CN/hHDnOsjgkFB/mqD7yERN+X7CinF9MgCHaL6gkkyX/pbz5w7DE4gv79hYCofOPnkycrXd9qdp4n5aT2RdwByqoa/FAFonbSWlN94F4OcPbSxPYl4BYuD0HE7pXIMg6hGHEn2SuvvjjQnbYJEltE1Yz+xznCMLgmkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqgb/ba9; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqgb/ba9"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c6c67bc8b9eso506157a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 13:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770325589; x=1770930389; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGeCzKcs6APgfKInQ8fPWEO6crHr4dVIgkyVJyOIJ+U=;
        b=aqgb/ba9h80TlMv9+a6DqN6CwtPgRQAWnnHkQIwyU5xbBefP9DXKGY7RX3F6t0w3fU
         4EDqNZ50xVOHHfNz4sqYMkxNCzcuN7htvVZMj87Sx51hwTFZDlx1rFCdhAmqTZEiuww3
         rqHyP0S+YtPY/qwbrB5EBOLTX4AVxwFYdq+UA1amcrdAa8UP3T0HxJ2/ngUuCyJdf8QF
         rDuy6xF1ScAfsstUH+k/w4ecM8LqdZDXnrHb5WiqHdmAM3YMzc3Tw31jibEeoCmR58Bq
         Y0KcdxaQjJPilCtbiJXlXBvpUFrZ0jKrsOW99bZxc6wuDXtq5gz8uYaoCOvYB8ftYJwH
         jykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325589; x=1770930389;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JGeCzKcs6APgfKInQ8fPWEO6crHr4dVIgkyVJyOIJ+U=;
        b=nPy/vqr3c9iRUSBPN0ErOXBy3q9W3BDkvAhLypqPnh9lr3I0CDzW1ElbyayqgI5Bmc
         yPesqt4x1I03ujAe7SaM1STbzpTFySC2Gld6eTDCOVJ93bs4A0M61jrU10apCENU2dA6
         e9jllKhoTJIjHpWsS80hBByn17vJRBzsOQ8uCEiYUKTQeLuA2kz45fShecAsscnBkJxE
         SjOUiSgFPopKjmZeloeyQRvpzCM2JVyO0qRSFBMzMT1TDCD6wyKUMtMFv/Br00pOxZpI
         Wco/ZJP9cNhFGmKDo17Rn+vJwhD7L1iIf+GWMy97qe3EZkTfTNBmO/oI4DUrkC1sjmCj
         JRBg==
X-Forwarded-Encrypted: i=1; AJvYcCVk1P+FNBRRCJkMQXNlJ1fCuwO0e1UUqXByyWA+ZRT6WyQAmBEYK42tI1qQ/7nF2+POm84Hf5RAyp2uRnZc0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsM9CN2mMT61+lLdVxT+S2FgQqQUO/atR0+YSYbuJj7KTf/06G
	HCF6W+qB0R5GQ0a3rmhLNC/UT3sOYDFfWy31m6Asww3BKlXuNn3nlZo3
X-Gm-Gg: AZuq6aJtGRNV0qQeUEBEAbdFYwWySplFuTsTiuXOqc69lZp0CVI7MsFGZl/NCfxIWWW
	Z9UgVGAKugKhes/EG3ES8tmzYMwBnfL9BSkkF3YROcfboPrXdiU5E3Hcwp7s451KtKaUQPVkbvH
	PsjGd5A6u8Lyq2r01tAvGb7GBVVLWels0ScVeEquzmaUO4KwRFze+Tv2YwUXMZId2ZBl7iFkhO4
	c4rzzkkLPC5Rx6s54LopJ1d/6TmIv3fSDskv9UNiPZ9RLcEXSl9hdIzHDXJA6TUEfSUlOUcCt+X
	vcl3Q8etXlVtW6pb9C+sqSHxgSYeAIYhsoI+FENMszM/F3FFNe6/+xyNUXF9B0VzlQ3a0C+Sv8k
	kVxmnDOWVKseXkpJEk0WPfVBZRDA/8EciJynu1OZt3C6zwmIMh+0o2KNnbNSKIj6N4KcRHlxf/u
	t3LQuB0A==
X-Received: by 2002:a17:902:e948:b0:2a7:b412:6cbf with SMTP id d9443c01a7336-2a951951558mr4424525ad.55.1770325589187;
        Thu, 05 Feb 2026 13:06:29 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a644a6sm4076285ad.8.2026.02.05.13.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 13:06:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 06:06:24 +0900
Message-Id: <DG7C1LYQ4SOQ.1HBJ8WH923JHW@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/4] rust: macros: add derive macro for `TryFrom`
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Charalampos Mitrodimas" <charmitro@posteo.net>, <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <20260129-try-from-into-macro-v5-2-dd011008118c@gmail.com>
 <87h5rxuw1n.fsf@posteo.net>
In-Reply-To: <87h5rxuw1n.fsf@posteo.net>

On Wed Feb 4, 2026 at 10:39 AM KST, Charalampos Mitrodimas wrote:
> Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org> writes:
[...]
>> +    fn impl_try_from(
>> +        enum_ident: &Ident,
>> +        variants: &[Ident],
>> +        repr_ty: &syn::Path,
>> +        input_ty: &ValidTy,
>> +    ) -> TokenStream {
>> +        let param =3D Ident::new("value", Span::call_site());
>> +
>> +        let overflow_assertion =3D emit_overflow_assert(enum_ident, var=
iants, repr_ty, input_ty);
>> +        let emit_cast =3D |variant| {
>> +            let variant =3D ::quote::quote! { #enum_ident::#variant };
>> +            match input_ty {
>> +                ValidTy::Bounded(inner) =3D> {
>> +                    let base_ty =3D inner.emit_qualified_base_ty();
>> +                    let expr =3D parse_quote! { #variant as #base_ty };
>> +                    inner.emit_new(&expr)
>> +                }
>> +                ValidTy::Primitive(ident) if ident =3D=3D "bool" =3D> {
>> +                    ::quote::quote! { ((#variant as #repr_ty) =3D=3D 1)=
 }
>> +                }
>> +                qualified @ ValidTy::Primitive(_) =3D> ::quote::quote! =
{ #variant as #qualified },
>> +            }
>> +        };
>> +
>> +        let clauses =3D variants.iter().map(|variant| {
>> +            let cast =3D emit_cast(variant);
>> +            ::quote::quote! {
>> +                if #param =3D=3D #cast {
>> +                    ::core::result::Result::Ok(#enum_ident::#variant)
>> +                } else
>> +            }
>> +        });
>> +
>> +        ::quote::quote! {
>> +            #[automatically_derived]
>> +            impl ::core::convert::TryFrom<#input_ty> for #enum_ident {
>> +                type Error =3D ::kernel::prelude::Error;
>> +                fn try_from(#param: #input_ty) -> Result<#enum_ident, S=
elf::Error> {
>> +                    #overflow_assertion
>> +
>> +                    #(#clauses)* {
>> +                        ::core::result::Result::Err(::kernel::prelude::=
EINVAL)
>
> What happens if we need a different error type here? For example, a
> quick look around in nova-core's "Chipset" enum, an unrecognized chipset
> ID warrants ENODEV rather than EINVAL, since it's about device
> identification.
>
> Not sure if it fits the design, just wondering if this flexibility would
> be useful, but would something like an optional
>
>     error =3D <ERROR>
>
> in the
>
>    #[try_from(...)]
>
> attribute make sense? e.g.
>
>    #[try_from(u32, error =3D ENODEV)]
>
> defaulting ofcourse to EINVAL if unspecified.

I believe this is indeed a desired change.

Back in September, an RFC [1] using the same API (i.e., without error
customization) was sent; I took a quick look at the time and felt
everything was OK, but in hindsight, the need for this flexibility is
clear.

Your proposed API looks good to me. Unless there are objections, I'll
move forward with this approach.

Thanks!

[1] https://lore.kernel.org/rust-for-linux/20250930-nova-tryfrom-v1-1-0cc1b=
b507047@nvidia.com/

Best regards,
Jesung
