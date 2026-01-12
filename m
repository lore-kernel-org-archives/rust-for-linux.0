Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1374D37F736
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768240176; cv=none; b=LSS2OE9O1/MvZ4IIhmnMJcEYRAMdrXZEeeyf+ebfKIbJoBVR4OH4Gbq+JYLy8z3kHFan5jLes/Mdxfxwq2mq6WCsrAsy3TCWa3ErHD+5tngKCdqK9IU2stnko1m8HFkmUGfhZVrkF4kG+QAHp5BbrTHEsben9LUgkXfHmAuYuVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768240176; c=relaxed/simple;
	bh=4N0fTphxZvNVhxgVD7xm+TyuSoLZwFCWXvSKwcfaEUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oztzbMoWCzJGzIl0y50pQub2tqwhaB6PLTdTQL6R5kVC59k4ky1zm+z1YVleQUjsKpIunuyfnzyVZMaw8oOfcKc4S+3ZV3GPTJ/D7pzr8VBGYBndsvZZmhx3Pajj0coP0PBvSA6eTlMrILLg0qxSnFZpxiGAHIKEY7hAwU6Lf1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRG7+zAU; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRG7+zAU"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so10597886a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 09:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768240170; x=1768844970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRyCpmaD8c+uRn6QaRE7ofPeerU2ZS73IXVf0Oe+0K4=;
        b=mRG7+zAU6X8567fTOgk9VC1u7cohW/xpfL7VypGbdBdY5M+MazAYPMYO8hZrtlCptb
         NtjEGq3C7zzvxgxlfzweTQUSoNP0BFmcP0yIwW1aAAxF3PhkNqperlblSZLFxqHMPnNj
         xgvFWkEypBZdOW7WxSMxNXXCGHvZTqANbWKHdTFxQYzFP4r9SVPEeqndmrfI5eT8nMtY
         nNt4bpJPURvYbTQ9LSxoHwyhENzIapK4p4bR96s+MVR4w79SN9hJDTK7cVFSy1jgTFpo
         ZZj28L0aEgblgyAtpRCUQr/1oMmJ0Ac3zISjysKcZ0/0hP2seSiOvGLlg5ek/KWCTHtu
         iX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768240170; x=1768844970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mRyCpmaD8c+uRn6QaRE7ofPeerU2ZS73IXVf0Oe+0K4=;
        b=btDGf36EkCVQl5jjXHrGTIRWX0JuaB2QYuza4bsashXMz294A/o95qEW9OlOnW2tJ7
         VEa0TUlFke1DO6Musi0JrOsV6Odz+/eyQxj4x/Y5OtuYQNZSF5zaSYF36NBjYcT3Ww/L
         0mR4RqvA/xyejStLJqzld+3wVXw6HBVCDWmUfsjlLIL1x7TCArjSOXWwsYZA7iks/+4F
         +VkbIfLnMvnx8GygtLYA3C5my0YsWgjvi77x1vKS9/oLEpZuPKQNlzp4h2zTDjE60GuK
         49uQm13mKD/qLMNVSLiYmXgMrjy7wSl4AGOnUcBrAWF2Ppaal5mVBk/e6mxccHVTbX6/
         w23w==
X-Forwarded-Encrypted: i=1; AJvYcCVQLvHTDAbLAzs1Zb6chac4JClhXiXEsp0MlfiGdeqtf9QM66NKQPHK0hPzd2CjKMHZ5eZkwG66IejGTSlstw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQmUfE1ILeHv/EoxlspCcmjFvYiFYCMHkpurbMmEn5J3VG55wB
	BuMxzjJKLuAXUgi55/TJXNJQwqchAlOuLJgnhyqdz133rowdP0lZ3fhIxc+Vo8nBHJy2jHxfZpA
	VKYgNuW54HXS9j8TYb8CSa8iwd+X5Ai4=
X-Gm-Gg: AY/fxX6baqa9ZiTm5FaQh1cHAcy0h1C6Kv7jFQmbUsT/6wLBHGYW9fXl6RLQL0ZRM7Z
	NovSpwcH4H/gOjfGNENGIpPbHXC73rRkCcFZQmOaR7fLFHO88Q+OwuYr9lYC/hC11Z924AWYjRI
	WG3j3J02gdYubhTwru5YBJz8MgN889mm23PdGbX9SiQxYLejS4YYJXtHPXadYMP0iqNwWyRCVAO
	TanYqLi6Bv2H/gV09wr0e8yDROSnM2C0sgwMuZYm7vWja1tV7v236K5cL/BJYHyhCrmiFTTvWfN
	vdnNQs5MrL/fmfpAx9XsDcoVzgsgdrSdxqRTYPIzVJkaMbpp5sY+9LuE4jvoZmo1wIP0OEdNHen
	5nhj1G2pMTBGn6jPN
X-Google-Smtp-Source: AGHT+IHyAvEW0avUOzQ+I+tkjKtEvUMf55jeZLDWb80n/C29xtlqIsyeRD4gDe6TlIcIbbd8eyYGjrNPrxHIChOcWFU=
X-Received: by 2002:a05:6402:2683:b0:64b:62f7:c897 with SMTP id
 4fb4d7f45d1cf-65097de7c13mr16606115a12.5.1768240170275; Mon, 12 Jan 2026
 09:49:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112170919.1888584-1-gary@kernel.org> <20260112170919.1888584-13-gary@kernel.org>
In-Reply-To: <20260112170919.1888584-13-gary@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 12 Jan 2026 12:48:52 -0500
X-Gm-Features: AZwV_QjqtFCioGwcHPArhgx7HEYmzkjy--qFnqgelFHywA8Z338AVDRRRcj9ndg
Message-ID: <CAJ-ks9=UwOz=-NR0MJ3pjKZNGjb7+3R-shFqYKQF206s5Tp6ew@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] rust: macros: support `#[cfg]` properly in
 `#[vtable]` macro.
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 12:12=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Currently, we generate `HAS_` constants as long as the definition exists =
in
> the source, regardless if it is cfg-ed out or not.
>
> Currently, uses of `#[cfg]` present in both trait and impl, so it is not =
a
> problem; however if only the impl side uses `#[cfg]` then `HAS_` constant=
s
> will incorrectly be true while it shouldnt't.
>
> With `syn` support, we can now implement `#[cfg]` handling properly by
> propagating the `#[cfg]` attributes to the constants.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/macros/helpers.rs |  9 +++++++++
>  rust/macros/vtable.rs  | 13 ++++---------
>  2 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
> index adfa60d8f42d8..c17287da801dd 100644
> --- a/rust/macros/helpers.rs
> +++ b/rust/macros/helpers.rs
> @@ -7,6 +7,7 @@
>          Parse,
>          ParseStream, //
>      },
> +    Attribute,
>      Error,
>      LitStr,
>      Result, //
> @@ -53,3 +54,11 @@ pub(crate) fn file() -> String {
>          proc_macro::Span::call_site().file()
>      }
>  }
> +
> +/// Obtain all `#[cfg]` attributes.
> +pub(crate) fn gather_cfg_attrs(attr: &[Attribute]) -> Vec<Attribute> {
> +    attr.iter()
> +        .filter(|a| a.path().is_ident("cfg"))
> +        .cloned()
> +        .collect()
> +}

I believe there's no need to collect this into a vector, `quote`
supports iterators.

https://docs.rs/quote/latest/quote/macro.quote.html#interpolation

> diff --git a/rust/macros/vtable.rs b/rust/macros/vtable.rs
> index 72ae0a1816a04..c6510b0c4ea1d 100644
> --- a/rust/macros/vtable.rs
> +++ b/rust/macros/vtable.rs
> @@ -23,7 +23,6 @@
>
>  fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
>      let mut gen_items =3D Vec::new();
> -    let mut gen_consts =3D HashSet::new();
>
>      gen_items.push(parse_quote! {
>           /// A marker to prevent implementors from forgetting to use [`#=
[vtable]`](vtable)
> @@ -38,22 +37,17 @@ fn handle_trait(mut item: ItemTrait) -> Result<ItemTr=
ait> {
>                  &format!("HAS_{}", name.to_string().to_uppercase()),
>                  name.span(),
>              );
> -            // Skip if it's declared already -- this can happen if `#[cf=
g]` is used to selectively
> -            // define functions.
> -            // FIXME: `#[cfg]` should be copied and propagated to the ge=
nerated consts.
> -            if gen_consts.contains(&gen_const_name) {
> -                continue;
> -            }
>
>              // We don't know on the implementation-site whether a method=
 is required or provided
>              // so we have to generate a const for all methods.
> +            let cfg_attrs =3D crate::helpers::gather_cfg_attrs(&fn_item.=
attrs);
>              let comment =3D
>                  format!("Indicates if the `{name}` method is overridden =
by the implementor.");
>              gen_items.push(parse_quote! {
> +                #(#cfg_attrs)*
>                  #[doc =3D #comment]
>                  const #gen_const_name: bool =3D false;
>              });
> -            gen_consts.insert(gen_const_name);
>          }
>      }
>
> @@ -87,10 +81,11 @@ fn handle_impl(mut item: ItemImpl) -> Result<ItemImpl=
> {
>              if defined_consts.contains(&gen_const_name) {
>                  continue;
>              }
> +            let cfg_attrs =3D crate::helpers::gather_cfg_attrs(&fn_item.=
attrs);
>              gen_items.push(parse_quote! {
> +                #(#cfg_attrs)*
>                  const #gen_const_name: bool =3D true;
>              });
> -            defined_consts.insert(gen_const_name);
>          }
>      }
>
> --
> 2.51.2
>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
