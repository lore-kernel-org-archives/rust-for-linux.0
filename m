Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10246239E8D
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 22:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767567225; cv=none; b=GAlFtSqdPtxL/R5NcIfXW5S5ZDQS1tvsRvs6oJ71c9rPUY603InNymz/p4mnsi6qBqOVatf4ojLQJT0BX84BFoemiW7f+VnkXrzSwJp423GlBYBR3FgW63evdOGbqeCdi9euF1QvjtE4SdpvNrUyzEZmYC78DstoM/ww3/GNq78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767567225; c=relaxed/simple;
	bh=LJtpuATmFr2iC0Q3hxj3ntazYy45/BvkpRH7KeDupUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJ2KAZdId5/8oMXH9gBKiRb1fCDsMyjddBz8dsAA8wfTOSkxEhQmwDYi900IRgrCL4tdbQVyQ/vZ4FRU7jKksEjymXv5shlpTaKFIIjAAH1qwO38//Vo2eVQ2/WrXh6B5xpzcWmKkVpGKcbeA+fUz0xOm9NFgT6ePjFoZoOVlD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtIn22p8; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtIn22p8"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a3d86b773so108948861fa.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 14:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767567221; x=1768172021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgqcYhodI3XUPqxqxUdTopqAleIa6MGA9PxPio1R1ds=;
        b=jtIn22p8GETjBYbg1bq1+/r0USa3vTM1ucx0OCg7IZiEI5u3Xu5+cEOv7tRG6cZSvQ
         OZeWfGimhKvs1ppEcUxwFRi3gDtVRGpgtwUi8QwbMW5gSUaZ8BoSK358KlLayFJp3PhN
         w5ca8x2I3m+K1xC1TmysoQWv90bibBG+X+DoiAbcN52Hf297+7H4dUEvuoWeE6NerrUd
         ohGE7hpxmv8mE6Chc5mrUVW1kweLb27zzDKw0dDrCPawA3QXVokeKyBCZUOGYiKH3rKM
         /GPUMx4hvMk1THPfz/VWV5XjIS0fMxCivpH9HHyV/eXaqmAUrk+GRnT3rT7SDYR/djqx
         LTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567221; x=1768172021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KgqcYhodI3XUPqxqxUdTopqAleIa6MGA9PxPio1R1ds=;
        b=nsjN1iuvFfln7WF7kJ64lo4LBW8jnexOqKfmvtUfr/0rI5zOz3FmMjX9u624TYi9ct
         xJIA+9HBp3P5WcnLDXZO20tDvh/6Xfq2bh9J1y2Ymhf5bAC+gc/ZIEhkZn8TfctLNBW8
         ziGPTf/221m8xjtVdEJKcYOfajgRWZPEx+lcciUhtpOeGmBr1AExKOWhZ9/fBRVgdte3
         5ZMqmLkP4abafQf4jQiSkZ4S+TPPUtRwbbcomCvj8RQQvX7l15dRwvhsFkv5CTdAikM+
         OH7wCRF7kT51C4V++h6KBQpuH2dXi/fHS8Ij8BQvsKbH98nNbx7AuksFzjz88hxktrjj
         UBLA==
X-Forwarded-Encrypted: i=1; AJvYcCUO1VaK6jHLJOof7wrPeSltUtyHKpxf4bwC3w3s/K63m4b9FGISepbFCOSl34TxxpnhVDkEPDxBsQVSb9CA1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBRKAa9O4kzU9AgZ6/Llbnwey9q7uow/H62WO9811YZNMBONGP
	bm+rq2nzwsCBKZKG1tZmwQpHqJyYuWpF+C/6K2FdQijuOpPoGda6eEObzkXIvEBDWqD6gO1un99
	ulznoczJdJbQMCso9Ro6FQR89crIIX6E=
X-Gm-Gg: AY/fxX4t7d3PFZ+jyKzYOsCbOZG476AsqVHN51h4f04buZbVpW/QuBtowZcmbEmijKm
	jRvHhht+79JlgZEAWsu+FG1Ym/YwJl9K9bNJA/fw79yC6VrBRhTJtWo9sn2Ua2hJGMo2Je6MXsm
	H7J8S3KlQB4awVyl15Prbimvxrkmg/VzWCmijXJiJHk7yt2vWeW9ogkYjvsE2MB/1TXAdwdBBbm
	xyaZ6zj9vXA/ClTp9GrHm78fZ1OoWXBIU98nGMZ+3ku0GlJVGz0KStLMWzWwO0izRtO1mbOoUGB
	lwTHmCy7IFEq3o4TbFoWVsuLrqfuHnkRtK8puEB+uzmnAnRmeCXVnrel+EmeXhq66N/SQixc/1b
	GdRlDWl6ZgXld9IQooVNo06DXKEjXUyR+Ux5gkrU8Tg==
X-Google-Smtp-Source: AGHT+IGRh9JMF6UPwTyacnpUMNbELqbh6qtYyNvhqCM8LAJ+9rSgV+NxCzwlcGV1Ec3I1XGkcxgwa0Bzupv/11lG2q8=
X-Received: by 2002:a05:651c:19aa:b0:37b:aaf7:f007 with SMTP id
 38308e7fff4ca-381216931bamr126973251fa.31.1767567220757; Sun, 04 Jan 2026
 14:53:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211185805.2835633-1-gary@kernel.org> <20251211185805.2835633-5-gary@kernel.org>
In-Reply-To: <20251211185805.2835633-5-gary@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 4 Jan 2026 17:53:04 -0500
X-Gm-Features: AQt7F2osAN9lTzR58dzLV8gVibcYgBRIS9wKmepWH98XT_GkvpaFQ1ISM4h1owM
Message-ID: <CAJ-ks9=t2rrwgXDwVtqhZz+K02E-2jNprfu-Zy5bb14b0bNhSw@mail.gmail.com>
Subject: Re: [PATCH 04/11] rust: macros: use `syn` to parse `module!` macro
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Patrick Miller <paddymills@proton.me>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>, rust-for-linux@vger.kernel.org, 
	Igor Korotin <igor.korotin.linux@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 2:29=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> With `syn` being available in the kernel, use it to parse the complex
> custom `module!` macro to replace existing helpers. Only parsing is
> changed in this commit, the code generation is untouched.
>
> This has the benefit of better error message when the macro is used
> incorrectly, as it can point to a concrete span on what's going wrong.
>
> For example, if a field is specified twice, previously it reads:
>
>     error: proc macro panicked
>       --> samples/rust/rust_minimal.rs:7:1
>        |
>     7  | / module! {
>     8  | |     type: RustMinimal,
>     9  | |     name: "rust_minimal",
>     10 | |     author: "Rust for Linux Contributors",
>     11 | |     description: "Rust minimal sample",
>     12 | |     license: "GPL",
>     13 | |     license: "GPL",
>     14 | | }
>        | |_^
>        |
>        =3D help: message: Duplicated key "license". Keys can only be spec=
ified once.
>
> now it reads:
>
>     error: duplicated key "license". Keys can only be specified once.
>       --> samples/rust/rust_minimal.rs:13:5
>        |
>     13 |     license: "GPL",
>        |     ^^^^^^^
>
> Co-developed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/macros/helpers.rs |  84 ++++++----------
>  rust/macros/lib.rs     |   9 +-
>  rust/macros/module.rs  | 220 ++++++++++++++++++++++++++++++-----------
>  3 files changed, 202 insertions(+), 111 deletions(-)
>
> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
> index 853527b5d9567..f6bbdb02d9d7d 100644
> --- a/rust/macros/helpers.rs
> +++ b/rust/macros/helpers.rs
> @@ -1,42 +1,21 @@
>  // SPDX-License-Identifier: GPL-2.0
>
> -use proc_macro2::{token_stream, Group, Ident, TokenStream, TokenTree};
> -
> -pub(crate) fn try_ident(it: &mut token_stream::IntoIter) -> Option<Strin=
g> {
> -    if let Some(TokenTree::Ident(ident)) =3D it.next() {
> -        Some(ident.to_string())
> -    } else {
> -        None
> -    }
> -}
> -
> -pub(crate) fn try_literal(it: &mut token_stream::IntoIter) -> Option<Str=
ing> {
> -    if let Some(TokenTree::Literal(literal)) =3D it.next() {
> -        Some(literal.to_string())
> -    } else {
> -        None
> -    }
> -}
> -
> -pub(crate) fn try_string(it: &mut token_stream::IntoIter) -> Option<Stri=
ng> {
> -    try_literal(it).and_then(|string| {
> -        if string.starts_with('\"') && string.ends_with('\"') {
> -            let content =3D &string[1..string.len() - 1];
> -            if content.contains('\\') {
> -                panic!("Escape sequences in string literals not yet hand=
led");
> -            }
> -            Some(content.to_string())
> -        } else if string.starts_with("r\"") {
> -            panic!("Raw string literals are not yet handled");
> -        } else {
> -            None
> -        }
> -    })
> -}
> -
> -pub(crate) fn expect_ident(it: &mut token_stream::IntoIter) -> String {
> -    try_ident(it).expect("Expected Ident")
> -}
> +use proc_macro2::{
> +    token_stream,
> +    Ident,
> +    TokenStream,
> +    TokenTree, //
> +};
> +use quote::ToTokens;
> +use syn::{
> +    parse::{
> +        Parse,
> +        ParseStream, //
> +    },
> +    Error,
> +    LitStr,
> +    Result, //
> +};
>
>  pub(crate) fn expect_punct(it: &mut token_stream::IntoIter) -> char {
>      if let TokenTree::Punct(punct) =3D it.next().expect("Reached end of =
token stream for Punct") {
> @@ -46,27 +25,28 @@ pub(crate) fn expect_punct(it: &mut token_stream::Int=
oIter) -> char {
>      }
>  }
>
> -pub(crate) fn expect_string(it: &mut token_stream::IntoIter) -> String {
> -    try_string(it).expect("Expected string")
> -}
> +/// A string literal that is required to have ASCII value only.
> +pub(crate) struct AsciiLitStr(LitStr);
>
> -pub(crate) fn expect_string_ascii(it: &mut token_stream::IntoIter) -> St=
ring {
> -    let string =3D try_string(it).expect("Expected string");
> -    assert!(string.is_ascii(), "Expected ASCII string");
> -    string
> +impl Parse for AsciiLitStr {
> +    fn parse(input: ParseStream<'_>) -> Result<Self> {
> +        let s: LitStr =3D input.parse()?;
> +        if !s.value().is_ascii() {
> +            return Err(Error::new_spanned(s, "expected ASCII-only string=
 literal"));
> +        }
> +        Ok(Self(s))
> +    }
>  }
>
> -pub(crate) fn expect_group(it: &mut token_stream::IntoIter) -> Group {
> -    if let TokenTree::Group(group) =3D it.next().expect("Reached end of =
token stream for Group") {
> -        group
> -    } else {
> -        panic!("Expected Group");
> +impl ToTokens for AsciiLitStr {
> +    fn to_tokens(&self, ts: &mut TokenStream) {
> +        self.0.to_tokens(ts);
>      }
>  }
>
> -pub(crate) fn expect_end(it: &mut token_stream::IntoIter) {
> -    if it.next().is_some() {
> -        panic!("Expected end");
> +impl AsciiLitStr {
> +    pub(crate) fn value(&self) -> String {
> +        self.0.value()
>      }
>  }
>
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index 33935b38d11c0..4e440deaed853 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -10,6 +10,9 @@
>  // which was added in Rust 1.88.0. This is why `cfg_attr` is used here, =
i.e.
>  // to avoid depending on the full `proc_macro_span` on Rust >=3D 1.88.0.
>  #![cfg_attr(not(CONFIG_RUSTC_HAS_SPAN_FILE), feature(proc_macro_span))]
> +//
> +// Stable since Rust 1.81.0.
> +#![feature(lint_reasons)]
>
>  mod concat_idents;
>  mod export;
> @@ -100,8 +103,10 @@
>  ///   - `firmware`: array of ASCII string literals of the firmware files=
 of
>  ///     the kernel module.
>  #[proc_macro]
> -pub fn module(ts: TokenStream) -> TokenStream {
> -    module::module(ts.into()).into()
> +pub fn module(input: TokenStream) -> TokenStream {
> +    module::module(parse_macro_input!(input))
> +        .unwrap_or_else(|e| e.into_compile_error())
> +        .into()
>  }
>
>  /// Declares or implements a vtable trait.
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 6974fb04f58fa..e4d51878a5360 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -2,28 +2,27 @@
>
>  use std::fmt::Write;
>
> -use proc_macro2::{token_stream, Delimiter, Literal, TokenStream, TokenTr=
ee};
> +use proc_macro2::{
> +    Literal,
> +    TokenStream, //
> +};
> +use syn::{
> +    bracketed,
> +    parse::{
> +        Parse,
> +        ParseStream, //
> +    },
> +    punctuated::Punctuated,
> +    token::Bracket,
> +    Error,
> +    Ident,
> +    LitStr,
> +    Result,
> +    Token, //
> +};
>
>  use crate::helpers::*;
>
> -fn expect_string_array(it: &mut token_stream::IntoIter) -> Vec<String> {
> -    let group =3D expect_group(it);
> -    assert_eq!(group.delimiter(), Delimiter::Bracket);
> -    let mut values =3D Vec::new();
> -    let mut it =3D group.stream().into_iter();
> -
> -    while let Some(val) =3D try_string(&mut it) {
> -        assert!(val.is_ascii(), "Expected ASCII string");
> -        values.push(val);
> -        match it.next() {
> -            Some(TokenTree::Punct(punct)) =3D> assert_eq!(punct.as_char(=
), ','),
> -            None =3D> break,
> -            _ =3D> panic!("Expected ',' or end of array"),
> -        }
> -    }
> -    values
> -}
> -
>  struct ModInfoBuilder<'a> {
>      module: &'a str,
>      counter: usize,
> @@ -91,8 +90,107 @@ fn emit(&mut self, field: &str, content: &str) {
>      }
>  }
>
> +mod kw {
> +    syn::custom_keyword!(name);
> +    syn::custom_keyword!(authors);
> +    syn::custom_keyword!(description);
> +    syn::custom_keyword!(license);
> +    syn::custom_keyword!(alias);
> +    syn::custom_keyword!(firmware);
> +}
> +
> +#[allow(dead_code, reason =3D "some fields are only parsed into")]

Use #[expect(...)] so that the compiler can catch if this is no longer
dead code.

> +enum ModInfoField {
> +    Type(Token![type], Token![:], Ident),
> +    Name(kw::name, Token![:], AsciiLitStr),
> +    Authors(
> +        kw::authors,
> +        Token![:],
> +        Bracket,
> +        Punctuated<LitStr, Token![,]>,
> +    ),

Per the documentation on macros::module, authors must be ASCII.

> +    Description(kw::description, Token![:], LitStr),
> +    License(kw::license, Token![:], AsciiLitStr),
> +    Alias(
> +        kw::authors,

This should be kw::alias

> +        Token![:],
> +        Bracket,
> +        Punctuated<LitStr, Token![,]>,
> +    ),

Per the documentation on macros::module, alias must be ASCII.

> +    Firmware(
> +        kw::firmware,
> +        Token![:],
> +        Bracket,
> +        Punctuated<LitStr, Token![,]>,
> +    ),

Must be ASCII.

> +}
> +
> +impl ModInfoField {
> +    /// Obtain the key identifying the field.
> +    fn key(&self) -> Ident {
> +        match self {
> +            ModInfoField::Type(key, ..) =3D> Ident::new("type", key.span=
),
> +            ModInfoField::Name(key, ..) =3D> Ident::new("name", key.span=
),
> +            ModInfoField::Authors(key, ..) =3D> Ident::new("authors", ke=
y.span),
> +            ModInfoField::Description(key, ..) =3D> Ident::new("descript=
ion", key.span),
> +            ModInfoField::License(key, ..) =3D> Ident::new("license", ke=
y.span),
> +            ModInfoField::Alias(key, ..) =3D> Ident::new("alias", key.sp=
an),
> +            ModInfoField::Firmware(key, ..) =3D> Ident::new("firmware", =
key.span),
> +        }
> +    }
> +}
> +
> +impl Parse for ModInfoField {
> +    fn parse(input: ParseStream<'_>) -> Result<Self> {
> +        let key =3D input.lookahead1();
> +        if key.peek(Token![type]) {
> +            Ok(Self::Type(input.parse()?, input.parse()?, input.parse()?=
))
> +        } else if key.peek(kw::name) {
> +            Ok(Self::Name(input.parse()?, input.parse()?, input.parse()?=
))
> +        } else if key.peek(kw::authors) {
> +            let list;
> +            Ok(Self::Authors(
> +                input.parse()?,
> +                input.parse()?,
> +                bracketed!(list in input),
> +                Punctuated::parse_terminated(&list)?,
> +            ))
> +        } else if key.peek(kw::description) {
> +            Ok(Self::Description(
> +                input.parse()?,
> +                input.parse()?,
> +                input.parse()?,
> +            ))
> +        } else if key.peek(kw::license) {
> +            Ok(Self::License(
> +                input.parse()?,
> +                input.parse()?,
> +                input.parse()?,
> +            ))
> +        } else if key.peek(kw::alias) {
> +            let list;
> +            Ok(Self::Alias(
> +                input.parse()?,
> +                input.parse()?,
> +                bracketed!(list in input),
> +                Punctuated::parse_terminated(&list)?,
> +            ))
> +        } else if key.peek(kw::firmware) {
> +            let list;
> +            Ok(Self::Firmware(
> +                input.parse()?,
> +                input.parse()?,
> +                bracketed!(list in input),
> +                Punctuated::parse_terminated(&list)?,
> +            ))
> +        } else {
> +            Err(key.error())
> +        }
> +    }
> +}
> +
>  #[derive(Debug, Default)]
> -struct ModuleInfo {
> +pub(crate) struct ModuleInfo {
>      type_: String,
>      license: String,
>      name: String,
> @@ -102,9 +200,13 @@ struct ModuleInfo {
>      firmware: Option<Vec<String>>,
>  }
>
> -impl ModuleInfo {
> -    fn parse(it: &mut token_stream::IntoIter) -> Self {
> -        let mut info =3D ModuleInfo::default();
> +impl Parse for ModuleInfo {
> +    fn parse(input: ParseStream<'_>) -> Result<Self> {
> +        let mut info =3D Self::default();
> +
> +        let span =3D input.span();
> +        let fields =3D Punctuated::<ModInfoField, Token![,]>::parse_term=
inated(input)?;
> +        let mut errors =3D Vec::new();
>
>          const EXPECTED_KEYS: &[&str] =3D &[
>              "type",
> @@ -118,40 +220,38 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
>          const REQUIRED_KEYS: &[&str] =3D &["type", "name", "license"];
>          let mut seen_keys =3D Vec::new();
>
> -        loop {
> -            let key =3D match it.next() {
> -                Some(TokenTree::Ident(ident)) =3D> ident.to_string(),
> -                Some(_) =3D> panic!("Expected Ident or end"),
> -                None =3D> break,
> -            };
> +        for field in fields {
> +            let key =3D field.key();
>
>              if seen_keys.contains(&key) {
> -                panic!("Duplicated key \"{key}\". Keys can only be speci=
fied once.");
> +                errors.push(Error::new_spanned(
> +                    &key,
> +                    format!(r#"duplicated key "{key}". Keys can only be =
specified once."#),
> +                ));
> +                continue;
>              }
> +            seen_keys.push(key);
>
> -            assert_eq!(expect_punct(it), ':');
> -
> -            match key.as_str() {
> -                "type" =3D> info.type_ =3D expect_ident(it),
> -                "name" =3D> info.name =3D expect_string_ascii(it),
> -                "authors" =3D> info.authors =3D Some(expect_string_array=
(it)),
> -                "description" =3D> info.description =3D Some(expect_stri=
ng(it)),
> -                "license" =3D> info.license =3D expect_string_ascii(it),
> -                "alias" =3D> info.alias =3D Some(expect_string_array(it)=
),
> -                "firmware" =3D> info.firmware =3D Some(expect_string_arr=
ay(it)),
> -                _ =3D> panic!("Unknown key \"{key}\". Valid keys are: {E=
XPECTED_KEYS:?}."),
> +            match field {
> +                ModInfoField::Type(_, _, ty) =3D> info.type_ =3D ty.to_s=
tring(),
> +                ModInfoField::Name(_, _, name) =3D> info.name =3D name.v=
alue(),
> +                ModInfoField::Authors(_, _, _, list) =3D> {
> +                    info.authors =3D Some(list.into_iter().map(|x| x.val=
ue()).collect())
> +                }
> +                ModInfoField::Description(_, _, desc) =3D> info.descript=
ion =3D Some(desc.value()),
> +                ModInfoField::License(_, _, license) =3D> info.license =
=3D license.value(),
> +                ModInfoField::Alias(_, _, _, list) =3D> {
> +                    info.alias =3D Some(list.into_iter().map(|x| x.value=
()).collect())
> +                }
> +                ModInfoField::Firmware(_, _, _, list) =3D> {
> +                    info.firmware =3D Some(list.into_iter().map(|x| x.va=
lue()).collect())
> +                }
>              }
> -
> -            assert_eq!(expect_punct(it), ',');
> -
> -            seen_keys.push(key);
>          }
>
> -        expect_end(it);
> -
>          for key in REQUIRED_KEYS {
>              if !seen_keys.iter().any(|e| e =3D=3D key) {
> -                panic!("Missing required key \"{key}\".");
> +                errors.push(Error::new(span, format!(r#"missing required=
 key "{key}""#)));
>              }
>          }
>
> @@ -163,18 +263,24 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
>          }
>
>          if seen_keys !=3D ordered_keys {
> -            panic!("Keys are not ordered as expected. Order them like: {=
ordered_keys:?}.");
> +            errors.push(Error::new(
> +                span,
> +                format!(r#"keys are not ordered as expected. Order them =
like: {ordered_keys:?}."#),

Unnecessary raw string here.


> +            ));
> +        }
> +
> +        if let Some(err) =3D errors.into_iter().reduce(|mut e1, e2| {
> +            e1.combine(e2);
> +            e1
> +        }) {
> +            return Err(err);
>          }
>
> -        info
> +        Ok(info)
>      }
>  }
>
> -pub(crate) fn module(ts: TokenStream) -> TokenStream {
> -    let mut it =3D ts.into_iter();
> -
> -    let info =3D ModuleInfo::parse(&mut it);
> -
> +pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
>      // Rust does not allow hyphens in identifiers, use underscore instea=
d.
>      let ident =3D info.name.replace('-', "_");
>      let mut modinfo =3D ModInfoBuilder::new(ident.as_ref());
> @@ -203,7 +309,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream =
{
>          std::env::var("RUST_MODFILE").expect("Unable to fetch RUST_MODFI=
LE environmental variable");
>      modinfo.emit_only_builtin("file", &file);
>
> -    format!(
> +    Ok(format!(
>          "
>              /// The module name.
>              ///
> @@ -377,5 +483,5 @@ unsafe fn __exit() {{
>          initcall_section =3D ".initcall6.init"
>      )
>      .parse()
> -    .expect("Error parsing formatted string into token stream.")
> +    .expect("Error parsing formatted string into token stream."))
>  }
> --
> 2.51.2
>
