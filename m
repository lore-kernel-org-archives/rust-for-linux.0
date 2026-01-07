Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C2F34FF53
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767804561; cv=none; b=mAz7tR09c1I7qxAUqYfknbJUp+iVXyFsr+j04hywLtAXkRBqT8yMoWIzKHX5xlidZADv7XkrjCRpw4KscgSWY+qKn+Ve978pCGRGXaf2clittfsbVwBH50mHNgaAeBhE2GlVoW7u7PR+lnB9Z8WZaGN9QjxF2TjEz2guLkJE5+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767804561; c=relaxed/simple;
	bh=nzMZLd7DYe3QhnOHvdnkNGc+Y6dYcMw2cEitohNwd0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTcSNXlmHN4NGWm4330SLOHDjFxj4A9qBxe4F0D8uekon2PkkRdh3KYZBOOBgCiBxaqiBQumK1dqyJGyKdSybBIuRl11j6QCzOEjiyhuINKAWku9TQaVbfyvneVThkAKEgdoNA09efOYPcnEsXBkNRjI9QZv8xW8oV5Z7YuAobc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlRsE4n4; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlRsE4n4"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37b9d8122fdso18110621fa.3
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 08:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767804546; x=1768409346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlnRgJDcWdfDa3MBgMxnCLKRP9RXgf/tHvo3szvi1wo=;
        b=TlRsE4n4Jww1aIJet/iMMDfh+EUkfTUvHhGcwcWJMfjMBDP5X8TrcE4x158DOEOfY1
         n2uQuadZ76RHtiqCBF4H2+zDHi1KHO/5slI9HIGHrZqxsQbe6YSjODgUn87mezgaHS+k
         rqJ8K4XeQbiE+9wt7zEhCnCnqoUyChkOo7BUamuQS1JqkzgZkxh7hl63R3u9qtBJSSXy
         mFFxwsSf6NnQw+kvqlvS2i0lXFyw13/5+uEZI7ChoKn26TVIJm1obzAi8sL1ZObiHMl+
         DQK70GWx50SY2q/0+JFIrf7nw3N6/g8+hAdiCsoBeWvC+/g0apfnYS7ppiCtjTkToYWO
         j6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767804546; x=1768409346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vlnRgJDcWdfDa3MBgMxnCLKRP9RXgf/tHvo3szvi1wo=;
        b=Fs9qKp9VaWZBErrJwDiSMT7HK1GwbaIFr5Sy5k8B07+FdTjApv+wo1U7h0+7EkyuBz
         AtC4D2lU0NXCjpxarWWGyu3TC9AK8hT2zhi8EpXrXGSIutjUw4JICjPiQHIBJQGy0fCg
         QhN+TmynmbsJpVZqXuWsPpEp4FF13lnhbUCLv522fCCF6mMIt2wComzsnXKdXrkHPU5q
         fAjEPU8e2zf0x/IsTdSOuITPYIRNCbynEPN3dHFDJ9nk1Ujd6QM04uNAmhRwnljlH2K5
         ObenaO90KfhAHA8E7Cq+L84KCm6gjKh2yBvZHfcMkoqWw1JwH0fniGXzFujnI7QngW/n
         T6JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfTyAwgZKcYhZT7gIq2EiFWfUVbkse+I8zanJhNYAQqqnxHE8UYs8geHkN0GIfHhAsTyXl/VqYXPx/EmlczQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ2gTs+j0zGkMD3cKGxLKra2X/Rd0mNaKVpPn7cmQButbfRZwZ
	DDETr8EuHnAuaMxn4xWD1hQHMYmBERht9z4yFKk+YkYNFoVG7IjiZGcngGsqVI33dZaUhneCCoA
	v+0Bpz/+BLkuhM5z9deouj6mIVOdaszY=
X-Gm-Gg: AY/fxX6mN/NsWVbaJjRYQKQT+14uVq9yVlMt3FL05oYKN9Dr16+NYY5H+Uvtst/Pvz7
	e480E6brRF88/zKVcl2gFG8wIdqkNY6A05cvtBHTzr0ixCpmaDd1Qpain2G4FalrS5Osknc0zcy
	yQhPhe4u12DHxLl7ovTaKyK1BEA5iR1rFJisCxDAgGyCSxxnDB4QNG1EvaRXChq8zxNefhgAubv
	Qt++XYXsmNQQakP0p643uxSLzNhe29FW99LN9sVJwjCPmW2W5Tyrh0JCh/b0SW8eeEF9ZqPWBTB
	2NHN9R7+AOPeKN/K3xoOjQYnuykhxOi6ivuYmCPYkDJKrqyDeyhc12Fb3v2XsGid9bMqm24qVAc
	58M/KFg==
X-Google-Smtp-Source: AGHT+IGIkl1boqiuQgeOAS1ADOM/E0y5nNjRRCJ8rxLbAvYy6HTQkDJfRAc5XtV+PIdG7gyzNIhQlEC9TuBX6FpbqR0=
X-Received: by 2002:a05:651c:552:b0:37b:9a67:bb66 with SMTP id
 38308e7fff4ca-382ff80bbaemr9151761fa.38.1767804545489; Wed, 07 Jan 2026
 08:49:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107161729.3855851-1-gary@kernel.org> <20260107161729.3855851-4-gary@kernel.org>
In-Reply-To: <20260107161729.3855851-4-gary@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 7 Jan 2026 11:48:28 -0500
X-Gm-Features: AQt7F2pBER6MdxX7RuoQIS7Ib92c_VrmiOIHCj_g3S-epyapkjxLn784jRVZh50
Message-ID: <CAJ-ks9nbPTQojM-QcHPKv+NdUHwaRbBRVqzJ3CwgQTJTuD=bRQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] rust: macros: convert `#[vtable]` macro to use `syn`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 11:30=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> `#[vtable]` is converted to use syn. This is more robust than the
> previous heuristic-based searching of defined methods and functions.
>
> When doing so, the trait and impl are split into two code paths as the
> types are distinct when parsed by `syn`.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

> ---
>  rust/macros/lib.rs    |   9 ++-
>  rust/macros/vtable.rs | 163 ++++++++++++++++++++++--------------------
>  2 files changed, 93 insertions(+), 79 deletions(-)
>
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index 945982c21f703..9955c04dbaae3 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -22,6 +22,8 @@
>
>  use proc_macro::TokenStream;
>
> +use syn::parse_macro_input;
> +
>  /// Declares a kernel module.
>  ///
>  /// The `type` argument should be a type which implements the [`Module`]
> @@ -204,8 +206,11 @@ pub fn module(ts: TokenStream) -> TokenStream {
>  ///
>  /// [`kernel::error::VTABLE_DEFAULT_ERROR`]: ../kernel/error/constant.VT=
ABLE_DEFAULT_ERROR.html
>  #[proc_macro_attribute]
> -pub fn vtable(attr: TokenStream, ts: TokenStream) -> TokenStream {
> -    vtable::vtable(attr.into(), ts.into()).into()
> +pub fn vtable(attr: TokenStream, input: TokenStream) -> TokenStream {
> +    parse_macro_input!(attr as syn::parse::Nothing);
> +    vtable::vtable(parse_macro_input!(input))
> +        .unwrap_or_else(|e| e.into_compile_error())
> +        .into()
>  }
>
>  /// Export a function so that C code can call it via a header file.
> diff --git a/rust/macros/vtable.rs b/rust/macros/vtable.rs
> index a67d1cc81a2d3..a39bedb703973 100644
> --- a/rust/macros/vtable.rs
> +++ b/rust/macros/vtable.rs
> @@ -1,97 +1,106 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  use std::collections::HashSet;
> -use std::fmt::Write;
>
> -use proc_macro2::{Delimiter, Group, TokenStream, TokenTree};
> +use proc_macro2::{
> +    Ident,
> +    TokenStream, //
> +};
> +use quote::ToTokens;
> +use syn::{
> +    parse_quote,
> +    Error,
> +    ImplItem,
> +    Item,
> +    ItemImpl,
> +    ItemTrait,
> +    Result,
> +    TraitItem, //
> +};
>
> -pub(crate) fn vtable(_attr: TokenStream, ts: TokenStream) -> TokenStream=
 {
> -    let mut tokens: Vec<_> =3D ts.into_iter().collect();
> +fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
> +    let mut functions =3D Vec::new();

Would be easier to propagate `#[cfg]`(as in your FIXME below) if you
collect the generated constants into this vector instead -- then you
can do all the code generation in the `for item in &item.items` loop
where you have all the attributes.

> +    for item in &item.items {
> +        if let TraitItem::Fn(fn_item) =3D item {
> +            functions.push(fn_item.sig.ident.clone());
> +        }
> +    }
> +
> +    item.items.push(parse_quote! {
> +         /// A marker to prevent implementors from forgetting to use [`#=
[vtable]`](vtable)
> +         /// attribute when implementing this trait.
> +         const USE_VTABLE_ATTR: ();
> +    });
>
> -    // Scan for the `trait` or `impl` keyword.
> -    let is_trait =3D tokens
> -        .iter()
> -        .find_map(|token| match token {
> -            TokenTree::Ident(ident) =3D> match ident.to_string().as_str(=
) {
> -                "trait" =3D> Some(true),
> -                "impl" =3D> Some(false),
> -                _ =3D> None,
> -            },
> -            _ =3D> None,
> -        })
> -        .expect("#[vtable] attribute should only be applied to trait or =
impl block");
> +    let mut consts =3D HashSet::new();
> +    for name in functions {
> +        let gen_const_name =3D Ident::new(
> +            &format!("HAS_{}", name.to_string().to_uppercase()),
> +            name.span(),
> +        );
> +        // Skip if it's declared already -- this can happen if `#[cfg]` =
is used to selectively
> +        // define functions.
> +        // FIXME: `#[cfg]` should be copied and propagated to the genera=
ted consts.
> +        if consts.contains(&gen_const_name) {
> +            continue;
> +        }
> +        // We don't know on the implementation-site whether a method is =
required or provided
> +        // so we have to generate a const for all methods.
> +        let comment =3D format!("Indicates if the `{name}` method is ove=
rridden by the implementor.");

We're already quasi-quoting below, does putting the comment there work?

> +        item.items.push(parse_quote! {
> +            #[doc =3D #comment]
> +            const #gen_const_name: bool =3D false;
> +        });
> +        consts.insert(gen_const_name);
> +    }
>
> -    // Retrieve the main body. The main body should be the last token tr=
ee.
> -    let body =3D match tokens.pop() {
> -        Some(TokenTree::Group(group)) if group.delimiter() =3D=3D Delimi=
ter::Brace =3D> group,
> -        _ =3D> panic!("cannot locate main body of trait or impl block"),
> -    };
> +    Ok(item)
> +}
>
> -    let mut body_it =3D body.stream().into_iter();
> +fn handle_impl(mut item: ItemImpl) -> Result<ItemImpl> {
>      let mut functions =3D Vec::new();
>      let mut consts =3D HashSet::new();
> -    while let Some(token) =3D body_it.next() {
> -        match token {
> -            TokenTree::Ident(ident) if ident =3D=3D "fn" =3D> {
> -                let fn_name =3D match body_it.next() {
> -                    Some(TokenTree::Ident(ident)) =3D> ident.to_string()=
,
> -                    // Possibly we've encountered a fn pointer type inst=
ead.
> -                    _ =3D> continue,
> -                };
> -                functions.push(fn_name);
> +    for item in &item.items {
> +        match item {
> +            ImplItem::Fn(fn_item) =3D> {
> +                functions.push(fn_item.sig.ident.clone());
>              }
> -            TokenTree::Ident(ident) if ident =3D=3D "const" =3D> {
> -                let const_name =3D match body_it.next() {
> -                    Some(TokenTree::Ident(ident)) =3D> ident.to_string()=
,
> -                    // Possibly we've encountered an inline const block =
instead.
> -                    _ =3D> continue,
> -                };
> -                consts.insert(const_name);
> +            ImplItem::Const(const_item) =3D> {
> +                consts.insert(const_item.ident.clone());
>              }
> -            _ =3D> (),
> +            _ =3D> {}
>          }
>      }
>
> -    let mut const_items;
> -    if is_trait {
> -        const_items =3D "
> -                /// A marker to prevent implementors from forgetting to =
use [`#[vtable]`](vtable)
> -                /// attribute when implementing this trait.
> -                const USE_VTABLE_ATTR: ();
> -        "
> -        .to_owned();
> +    item.items.push(parse_quote! {
> +         const USE_VTABLE_ATTR: () =3D ();
> +    });
>
> -        for f in functions {
> -            let gen_const_name =3D format!("HAS_{}", f.to_uppercase());
> -            // Skip if it's declared already -- this allows user overrid=
e.
> -            if consts.contains(&gen_const_name) {
> -                continue;
> -            }
> -            // We don't know on the implementation-site whether a method=
 is required or provided
> -            // so we have to generate a const for all methods.
> -            write!(
> -                const_items,
> -                "/// Indicates if the `{f}` method is overridden by the =
implementor.
> -                const {gen_const_name}: bool =3D false;",
> -            )
> -            .unwrap();
> -            consts.insert(gen_const_name);
> -        }
> -    } else {
> -        const_items =3D "const USE_VTABLE_ATTR: () =3D ();".to_owned();
> -
> -        for f in functions {
> -            let gen_const_name =3D format!("HAS_{}", f.to_uppercase());
> -            if consts.contains(&gen_const_name) {
> -                continue;
> -            }
> -            write!(const_items, "const {gen_const_name}: bool =3D true;"=
).unwrap();
> +    for name in functions {
> +        let gen_const_name =3D Ident::new(
> +            &format!("HAS_{}", name.to_string().to_uppercase()),
> +            name.span(),
> +        );
> +        // Skip if it's declared already -- this allows user override.
> +        if consts.contains(&gen_const_name) {
> +            continue;
>          }
> +        item.items.push(parse_quote! {
> +            const #gen_const_name: bool =3D true;
> +        });
> +        consts.insert(gen_const_name);
>      }
>
> -    let new_body =3D vec![const_items.parse().unwrap(), body.stream()]
> -        .into_iter()
> -        .collect();
> -    tokens.push(TokenTree::Group(Group::new(Delimiter::Brace, new_body))=
);
> -    tokens.into_iter().collect()
> +    Ok(item)
> +}
> +
> +pub(crate) fn vtable(input: Item) -> Result<TokenStream> {
> +    match input {
> +        Item::Trait(item) =3D> Ok(handle_trait(item)?.into_token_stream(=
)),
> +        Item::Impl(item) =3D> Ok(handle_impl(item)?.into_token_stream())=
,
> +        _ =3D> Err(Error::new_spanned(
> +            input,
> +            "`#[vtable]` attribute should only be applied to trait or im=
pl block",
> +        ))?,
> +    }
>  }
> --
> 2.51.2
>
