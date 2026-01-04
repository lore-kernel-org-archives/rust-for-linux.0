Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04D6241686
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 23:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767570171; cv=none; b=HpgubkHyVN6vzFiADOi4AkwWEpZ4f2/7Z+HlDXxeovcMYW9AMn7OocFQaiP6ozeBVUmXqqLt6iSSWgN+aWcZWGJjGA6svkI25r0B7ZNIKQYgRcrLEqVmR8kf1gjpiAAYybF5TDi0PHR+8a+tXxhDYyNYmt0h5WVPxmnj6UDyuqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767570171; c=relaxed/simple;
	bh=xryceS35t1I7YRc9Hp/XXAxNmXFZeJCEqNPcrRIVxpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c0Y1jRXBQBSOSfY7NctUHqifRiX68kX8i5VJk9EDKifNrunwTASwI2KeYCYZHpht/EDQ5uSKp2xnhShVq607wQceQuKFjDV4ll49Z5KXJzAHgTNejvHAcd4VRIfnpE2UT4kczHOhr1+Il8K6TQEHSBLuE4s0m81eN5PnnOtYC/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghuB1P6I; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghuB1P6I"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a3a4d3d53so127131441fa.3
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 15:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767570168; x=1768174968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sdQNrhmbNwkY5ksAaY6hXIb12nRBHlsqIN2zUrIr+g=;
        b=ghuB1P6IIGhKf3D65D0Nm4guwigcHtFkAxsQOGBizx9UO0A9XINwc7FGomAjNVMBH4
         3v8DKYd+Rge1Dyz8/PQ4VTYmOCqEqD+cTxxLNsvctzka+vi5WJZehO1gpTqQAZ2rQ7+Q
         ZJ6/SSxUD9XaigB59KlRRZInVWeFgcpv5vk/GsTL4VxoVW6M+lw4NDFuP6H5Ba2ZRzT5
         jMSknUYav+QJZ10yKeUeO0nF58rG3u4rFl6tq1CiKjLI5hSWdo8Xxdif8Q/nnWkW79Fn
         QS/QWMZXixFf9T1yfOibBOFKgZLZkdWb6NKgc35b/ER1cGu9ubnTZHPfpzW/NMOsRH27
         Vyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767570168; x=1768174968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2sdQNrhmbNwkY5ksAaY6hXIb12nRBHlsqIN2zUrIr+g=;
        b=omc2O4sy77dzfkEDayABBcswhpMs51Rc4wCNYYAgn20R6LvQcY3mOZDkHiiZjnQCs/
         n5fPmlNoxboNK/yomCdlKtVtqncJRfMRaTqWIt5IrW5QnS10RiTEMF3CgXopymaZFPRp
         vbGSlDkAifmL8C9i8xANaYmgF2C7EyC5UntrO/f8VZqdmf3aKTGp5/N5cZu8AcH7kVp+
         Yx77aOFDXiTzaIyw/H5Ac0fkflNjwURtxbwvrH36io47o3EtzoaJdztnu18kmD9PVXPN
         r3UdjREwusaR9o5FFRYc0KjHoYP5dstFlVyy7Fe/521I3HDr0TBUVOGWKhknXpYmhQbQ
         QMpg==
X-Forwarded-Encrypted: i=1; AJvYcCVTCzs76uT/rz7SWRpZZGAkYpmyJ/4a4Os2aRWCNfIzQ4EUPF99QfoAoRchvrLHKupRvQ9hC2xuYz11wvrR7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPA0oSoAxD/DjoUZFpmxHb6CnXV+ta5OODHVHJV7MhRpPiiM40
	zXqGPU8ZHFnnKtUKQt6YK2keh7R1RptdMzWNpJ67vqqyQ5di7Kg9KN73y4mUsWdWduqueukB6sO
	Xl3j2lqII5xkpcRZoFln4UkEYATBYu/s=
X-Gm-Gg: AY/fxX6lV9Yu4XZT5wy4dh76/Ofb1lQUuR85zVvt9ZB9KicbUoQF4qF6C4TRsOW+hLA
	p96E9IRLsmyWGfE76YYkXU+TfLWlwq8nPjEPt9A419ZQYki0lmYDANZGrcanInULrhUiL3btAkK
	VpzTHPiklPfW5YbMWIaC1+tpqDTA3MqhUsn/6a+R2mlzjjSefVTNNQOHFbMUPBqcClSMRP2qQ2q
	cGqzoCaSGiLa0ROXdkgsht7N0YPhFZcPNysivISUMvQCE2kK72cPCrwwkoNIzUQUq+uKcSXsHgi
	UKI+3sFN8VHRDRiThSmcPhWCq2kDW69CNEY93fH1jrMGheUDRyzhic0fSJpmvt7dhprDjmHSDIN
	OljqMgeKCIJ7IvwZ7uomRn8Uy4eMXlrRTaD0kZf49cw==
X-Google-Smtp-Source: AGHT+IF41hQvVQLG/1/QxyFqRYchi/UKA6np88OlCdKKZF8Vj7yc4hio8D45Q0TdWOR1K20COAbYSonYzr1QcXWYhVY=
X-Received: by 2002:a05:651c:4199:b0:378:e3f9:2d26 with SMTP id
 38308e7fff4ca-38121674ef2mr135058451fa.39.1767570167951; Sun, 04 Jan 2026
 15:42:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211185805.2835633-1-gary@kernel.org> <20251211185805.2835633-10-gary@kernel.org>
In-Reply-To: <20251211185805.2835633-10-gary@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 4 Jan 2026 18:42:11 -0500
X-Gm-Features: AQt7F2pVZWNnfw_rC1EzI1LxWgzrnfl6EznSJ6JcafF3U3dbqIA25d8GW_UZrWk
Message-ID: <CAJ-ks9kt08wGfTNMfgijeBEGizqQy6UA+wOY+Vt3w=ZqfVXVzQ@mail.gmail.com>
Subject: Re: [PATCH 09/11] rust: macros: allow arbitrary types to be used in
 `module!` macro
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 2:30=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Previously this only accepts an identifier, but now with `syn` it is
> easy to make it accepts any type.
>
> With this change, the span of types are preserved -- as a benefit, Rust
> analyzer will be able to use the "navigate to definition" feature on
> type name inside `module!` macro invocation.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/macros/module.rs | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 4a02aadef25a7..d6298d04c86f4 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -4,7 +4,6 @@
>
>  use proc_macro2::{
>      Literal,
> -    Span,
>      TokenStream, //
>  };
>  use quote::{
> @@ -23,7 +22,8 @@
>      Ident,
>      LitStr,
>      Result,
> -    Token, //
> +    Token,
> +    Type, //
>  };
>
>  use crate::helpers::*;
> @@ -105,7 +105,7 @@ mod kw {
>
>  #[allow(dead_code, reason =3D "some fields are only parsed into")]
>  enum ModInfoField {
> -    Type(Token![type], Token![:], Ident),
> +    Type(Token![type], Token![:], Type),
>      Name(kw::name, Token![:], AsciiLitStr),
>      Authors(
>          kw::authors,
> @@ -193,9 +193,9 @@ fn parse(input: ParseStream<'_>) -> Result<Self> {
>      }
>  }
>
> -#[derive(Debug, Default)]
> +#[derive(Default)]
>  pub(crate) struct ModuleInfo {
> -    type_: String,
> +    type_: Option<Type>,
>      license: String,
>      name: String,
>      authors: Option<Vec<String>>,
> @@ -237,7 +237,7 @@ fn parse(input: ParseStream<'_>) -> Result<Self> {
>              seen_keys.push(key);
>
>              match field {
> -                ModInfoField::Type(_, _, ty) =3D> info.type_ =3D ty.to_s=
tring(),
> +                ModInfoField::Type(_, _, ty) =3D> info.type_ =3D Some(ty=
),
>                  ModInfoField::Name(_, _, name) =3D> info.name =3D name.v=
alue(),
>                  ModInfoField::Authors(_, _, _, list) =3D> {
>                      info.authors =3D Some(list.into_iter().map(|x| x.val=
ue()).collect())
> @@ -286,16 +286,17 @@ fn parse(input: ParseStream<'_>) -> Result<Self> {
>
>  pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
>      let ModuleInfo {
> -        type_,
> +        type_: Some(type_),
>          license,
>          name,
>          authors,
>          description,
>          alias,
>          firmware,
> -    } =3D info;
> -
> -    let type_ =3D Ident::new(&type_, Span::mixed_site());
> +    } =3D info
> +    else {
> +        unreachable!();
> +    };

I'm not a huge fan of this. As far as I can tell it arises from the
use of Default+mutation. It would be better, I think, to make type_
non-optional instead (and avoid using Default to construct a
partially-initialized ModuleInfo).

>
>      // Rust does not allow hyphens in identifiers, use underscore instea=
d.
>      let ident =3D name.replace('-', "_");
> @@ -376,7 +377,6 @@ impl ::kernel::ModuleMetadata for #type_ {
>          // Double nested modules, since then nobody can access the publi=
c items inside.
>          mod __module_init {
>              mod __module_init {
> -                use super::super::#type_;
>                  use pin_init::PinInit;
>
>                  /// The "Rust loadable module" mark.
> @@ -388,7 +388,7 @@ mod __module_init {
>                  #[used(compiler)]
>                  static __IS_RUST_MODULE: () =3D ();
>
> -                static mut __MOD: ::core::mem::MaybeUninit<#type_> =3D
> +                static mut __MOD: ::core::mem::MaybeUninit<super::super:=
:LocalModule> =3D
>                      ::core::mem::MaybeUninit::uninit();
>
>                  // Loadable modules need to export the `{init,cleanup}_m=
odule` identifiers.
> @@ -475,8 +475,9 @@ pub extern "C" fn #ident_exit() {
>                  ///
>                  /// This function must only be called once.
>                  unsafe fn __init() -> ::kernel::ffi::c_int {
> -                    let initer =3D
> -                        <#type_ as ::kernel::InPlaceModule>::init(&super=
::super::THIS_MODULE);
> +                    let initer =3D <super::super::LocalModule as ::kerne=
l::InPlaceModule>::init(
> +                        &super::super::THIS_MODULE
> +                    );
>                      // SAFETY: No data race, since `__MOD` can only be a=
ccessed by this module
>                      // and there only `__init` and `__exit` access it. T=
hese functions are only
>                      // called once and `__exit` cannot be called before =
or during `__init`.
> --
> 2.51.2
>
