Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B641E3DE5
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 23:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767570323; cv=none; b=j+sLP5L9WA8ZAaGYHtReuoZ6kIcogJRPMoBMLBjkILZuD/yuDtqb+IFobTuIMuHDNJbquVupOoBckiA/7iTu0zoZPsnFf9hE841Xg5Cj+pOuD67gHifm1hiC1dWnTF+ZUbNO4hj2Q7Eh9HyxX2L8t0K2cWCksy6FxFaWNhb7008=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767570323; c=relaxed/simple;
	bh=vGzaLBgVf3OSeVkLYaRSlHZnFWm9UW20DvLJ+U7QWfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+2tLJk25Hoqn01Ba5awzahXAkwpttftcXty/tBJyY2jU87YPCg2F1Al/sXRClqrImoK50gCaXnqFgEogmN6f04pujiu9TsxsqthI3rCiiZgxd58Ai0h/HePqTkSW4a/zzHsoy0NyrZXR2hbcdUZbcNzDL9YONPwSrt+fDPi0eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/Zfdu7V; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/Zfdu7V"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37ce27af365so116387531fa.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 15:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767570319; x=1768175119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bSJrzxPC9JOLMjg/ZGdl5gZv2B26I3FP/SLgn7rBlw=;
        b=N/Zfdu7VoRVq1mkwpwx14bF2O7xHj2G6Nv3JAb4s2b1zQ6rAtGxNnwou13AAv9ABuY
         gbz5QMz0z9mFg0wlGgMkDunkwC9rPK/CsClG/K/s21FZfkC8kYznasu9bejjtmSYUGQU
         RlHuCo9WOCp7+bL6ZtsqDF4ojHL8hPLZYL0/An/U3OaBb9wdgf9s0MYMMSAa557DvaXN
         eYaqGXs/D1xKaHZmvrD++RIRSIbqZ1AeerzpkKTkyN4iH+XLPGlPXyqnMpPqmmLoqGpG
         yvVLkivY4bQn0Fg6zwkQqwauOnp3BAmpzqWFeLML9tlfF2VOX/YtpZWT8YkqyKgH3kXa
         nWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767570319; x=1768175119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0bSJrzxPC9JOLMjg/ZGdl5gZv2B26I3FP/SLgn7rBlw=;
        b=wKazy7qd7SlRSGLPKWpKgXPY7sDDHn6B4hfcdQIlgsK/xKA7SbWNrPYtBoaSj2sku+
         I1w2r17Iw1cOolIqhnuJ5S1hiIV8FXrX0FkZJxgtulj75iyGvNIdTJp46naviSUGMwSs
         OMsAcGeworQpEKL1c1/tVwfldFTZKZLHGA5h3C9uWl/i8YI3yHXN4Ykywr38XJ5Q+K59
         ahkSsXbZB6R2fHdiW4fMCPfGngZ0RpeuNi5R6UWqGiojPR66k3gMqVebR1b1M2pARkIf
         jOFpVH68GToI7HkL97IUgl82tsto+u3VNfsOl3suN8ytVxebkTfHCAZtSZQrt2AOC7Ye
         YEcw==
X-Forwarded-Encrypted: i=1; AJvYcCX9/BJAyY557DvpxOpbP0ldzuRZFPc5iO7CCO0unj1gOYRfLkrB6HYywy61pHmTb2QkrO7Wjyok48fxhYOt7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNY9UbBsmeINDcByilEBLHL/5qMuXq8cbGb1AhS1Y1tW5Biyrl
	B2AMwELk9L4g71RdOKAR1RuOVgWjXyUGeotWHrZ5FZxiMSc7mHjHw9gwFCvLOWNhSRLtWuqHMQY
	5KneHdz7Wxg1cBx7NgehYMfDNzJKMN0w=
X-Gm-Gg: AY/fxX4vG+EeYyW233StZSzRb93RJKTkgFXCPOqcjYJAIAvzS+5ckWeMAacNYYmB/ld
	ve2DjZyNidZQcuhq4DcdMUvhZmZEgSBOkl/K7nDkOseJ3rvXRi8LD/OCOuP9mANn+k2ixv5QeBM
	QsLxH5FYcHDQgfDTT35HE+oI3XcZTdB/OhgxMYbjn1/RiRxMLdfa/bHO88LULkJydDxHQEkiE9J
	NpOAr75wh+fHsEZI/83Rt20P4x8/h4dBK6iv+1FiGCEHFUa9TZ6GflkocJWm23HRLhyi9m8wd2D
	Dz28r7wxW5g7jtkHnQzdcJqd6P/6dFoaoUWNH/WRi/VixdnNYsHuyVVplZXidaPOcp6vhek3a4J
	Nzew0xgVWEiZLB81IDCOe3xYyYbEP5P36ZJJRISOEhg==
X-Google-Smtp-Source: AGHT+IFCA/d6MMrU7fHQC/wwVCzyD9I/3zg5rxnYkPn1GTig1VUC3TSw96egYn5y2+uyynqy36EWHL4LDCG5hfJuWmE=
X-Received: by 2002:a2e:be9a:0:b0:37f:d89c:2e20 with SMTP id
 38308e7fff4ca-38121605cf3mr133392291fa.12.1767570319045; Sun, 04 Jan 2026
 15:45:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211185805.2835633-1-gary@kernel.org> <20251211185805.2835633-4-gary@kernel.org>
In-Reply-To: <20251211185805.2835633-4-gary@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 4 Jan 2026 18:44:43 -0500
X-Gm-Features: AQt7F2pNPW_7YR5QyL6L3PbgB_EEQNb-rWLQrc0uE-eEUP-zZ1lYC94sHllaSAs
Message-ID: <CAJ-ks9mQXP1mAYOseoUo0jbKD0FrhKOSW7ifgOUKzfrTM4WYeA@mail.gmail.com>
Subject: Re: [PATCH 03/11] rust: macros: convert `#[vtable]` macro to use `syn`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 2:29=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
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

Logic looks correct, but the duplication between handle_trait and
handle_impl is unfortunate. I golfed on this a bit, see if you like
it: https://github.com/tamird/linux/commit/8354c5a48769f5e1e52963d19ca57c31=
e5926b08.


> ---
>  rust/macros/lib.rs    |   9 ++-
>  rust/macros/vtable.rs | 155 +++++++++++++++++++++---------------------
>  2 files changed, 85 insertions(+), 79 deletions(-)
>
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index 8e0f49ac783b2..33935b38d11c0 100644
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
> @@ -173,8 +175,11 @@ pub fn module(ts: TokenStream) -> TokenStream {
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
> index f209216785745..51a7990fd51f3 100644
> --- a/rust/macros/vtable.rs
> +++ b/rust/macros/vtable.rs
> @@ -1,97 +1,98 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  use std::collections::HashSet;
> -use std::fmt::Write;
>
> -use proc_macro2::{Delimiter, Group, TokenStream, TokenTree};
> +use proc_macro2::{Ident, TokenStream};
> +use quote::ToTokens;
> +use syn::{parse_quote, Error, ImplItem, Item, ItemImpl, ItemTrait, Resul=
t, TraitItem};
>
> -pub(crate) fn vtable(_attr: TokenStream, ts: TokenStream) -> TokenStream=
 {
> -    let mut tokens: Vec<_> =3D ts.into_iter().collect();
> -
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
> -
> -    // Retrieve the main body. The main body should be the last token tr=
ee.
> -    let body =3D match tokens.pop() {
> -        Some(TokenTree::Group(group)) if group.delimiter() =3D=3D Delimi=
ter::Brace =3D> group,
> -        _ =3D> panic!("cannot locate main body of trait or impl block"),
> -    };
> -
> -    let mut body_it =3D body.stream().into_iter();
> +fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
>      let mut functions =3D Vec::new();
>      let mut consts =3D HashSet::new();
> -    while let Some(token) =3D body_it.next() {
> -        match token {
> -            TokenTree::Ident(ident) if ident.to_string() =3D=3D "fn" =3D=
> {
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
> +            TraitItem::Fn(fn_item) =3D> {
> +                functions.push(fn_item.sig.ident.clone());
>              }
> -            TokenTree::Ident(ident) if ident.to_string() =3D=3D "const" =
=3D> {
> -                let const_name =3D match body_it.next() {
> -                    Some(TokenTree::Ident(ident)) =3D> ident.to_string()=
,
> -                    // Possibly we've encountered an inline const block =
instead.
> -                    _ =3D> continue,
> -                };
> -                consts.insert(const_name);
> +            TraitItem::Const(const_item) =3D> {
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
> +         /// A marker to prevent implementors from forgetting to use [`#=
[vtable]`](vtable)
> +         /// attribute when implementing this trait.
> +         const USE_VTABLE_ATTR: ();
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
> +    for name in functions {
> +        let gen_const_name =3D Ident::new(
> +            &format!("HAS_{}", name.to_string().to_uppercase()),
> +            name.span(),
> +        );
> +        // Skip if it's declared already -- this allows user override.
> +        if consts.contains(&gen_const_name) {
> +            continue;
>          }
> -    } else {
> -        const_items =3D "const USE_VTABLE_ATTR: () =3D ();".to_owned();
> +        // We don't know on the implementation-site whether a method is =
required or provided
> +        // so we have to generate a const for all methods.
> +        let comment =3D format!("Indicates if the `{name}` method is ove=
rridden by the implementor.");
> +        item.items.push(parse_quote! {
> +            #[doc =3D #comment]
> +            const #gen_const_name: bool =3D false;
> +        });
> +        consts.insert(gen_const_name);
> +    }
>
> -        for f in functions {
> -            let gen_const_name =3D format!("HAS_{}", f.to_uppercase());
> -            if consts.contains(&gen_const_name) {
> -                continue;
> +    Ok(item)
> +}
> +
> +fn handle_impl(mut item: ItemImpl) -> Result<ItemImpl> {
> +    let mut functions =3D Vec::new();
> +    let mut consts =3D HashSet::new();
> +    for item in &item.items {
> +        match item {
> +            ImplItem::Fn(fn_item) =3D> {
> +                functions.push(fn_item.sig.ident.clone());
>              }
> -            write!(const_items, "const {gen_const_name}: bool =3D true;"=
).unwrap();
> +            ImplItem::Const(const_item) =3D> {
> +                consts.insert(const_item.ident.clone());
> +            }
> +            _ =3D> {}
> +        }
> +    }
> +
> +    item.items.push(parse_quote! {
> +         const USE_VTABLE_ATTR: () =3D ();
> +    });
> +
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
