Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF4534DCF9
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767804065; cv=none; b=CRKPJWl/os+KkLqXG0FVNbLyLlPOvjyPZblKnxgNaWiZN1VXQyFKePCwvleGPfA3Jx4CD6CowGec9ElGO0204kqgyBdVRIsHzAStGtDHsUgGfViZoDOAJg2e9WeDb9TTh6MQJlAmRBDNtf82j6FFCaifxEOiYBH5nSK5OK0JuPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767804065; c=relaxed/simple;
	bh=ENoTIjD/x23fGH0u6bMcEaWjG8qijc1wbw5GCWFq7hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVHlMOhDkv+i7cvmcTkdzapCnykjlBY8+InFJ5FF5RDGBWJWQPB681fOmyzo0H3iGHO7GgkitWOt6y3y4Iw66beY4OFIpplSbD2TCElOJqEoWKp+BMZh8j4o640xiT4lhiqHfi+CsQhqx0b3R7z8StKTddGXHzC0cFIY3gFOu68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlJ2mMGy; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlJ2mMGy"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37b99da107cso19735081fa.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 08:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767804054; x=1768408854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8fsPi0fe9I/9nL9CMiauOcK+tWnheCchaXOeua707Y=;
        b=LlJ2mMGyH960YZ9pZn0CQLxkg+VG/OtzMcEdN296wwzMotyCy/YciYbwLokzcsKbiz
         RtOhTwAYdSVujFx6K3Bzb/0C3J/W+i7gVHx2iipts8TVNzc8oMwXIpvOhZcmnJQGsprK
         3iBcJKFkHDjtwwPzbRIx9wMegyrZtTCxE/Inxp6SglFeUz2gjaxQ8dZUvCtyAoXYDKi5
         cuFW2yi5743TBjIZnrQ5DK6gMvPFN1rNdb5n1acWSszzxXmJmucjxo/iO8reNLp3JFP1
         AnN/71chjxBLpTi1LIhlWSBas3vjOX2q9KkrWzgTrg9fEu+PDHSR8+m4QJ2wOy0zN2SC
         LeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767804054; x=1768408854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m8fsPi0fe9I/9nL9CMiauOcK+tWnheCchaXOeua707Y=;
        b=q8KXe9OA8WpUlUXhxOtcucBLGozlcZzU1DWH9hKgXRCzOD105Q+iOxK/0TedNR8yav
         voVI8KtVqBXakvXpksR2fK3OFoMrPV8dx6BBHdhII1BuUm1R/+MWkjz4AWQU/0/SDGLO
         o/07DUDhH/6q6gP74K+/WcwB5cvJkfgSYZdE8+Zo81tFKQvjCNdy+DR+5ftTUBZ/k+IK
         u5SAMPNwlEMQRWtXDp4bhUWw7M35fnMXGq/HKKoHSOTo/1/aezLDGL66x3Dm4Mkaq9vP
         wOG9evONLpdSUhKSGfBUwn+Hamg6RiluRLBQLZzSCll7EsYA0ZvChCvs1CvgbqPg7f5I
         fbzw==
X-Forwarded-Encrypted: i=1; AJvYcCVuFDBlre1O1RE0bhfLs6ZY0QVsyUfUwk2dbsXp3Xo0N3e/a1ybGxytyNYus/9xiGAUEN1dILoHIozliHQmow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtp/TUaSY828j3gBbCQ1Wx4D+75mLr6IczY3Hg66pzOaHend5T
	CpqiMQc3F0XUqfjsED0m6qbfWMQg2UIfbqkdZSN0SjW7vGeOTS3iSX9LCdKQ6WsBhWxcKsj1GeR
	3k80XwtSrG1MI2hSeVdyX+mSMlnGPeE4=
X-Gm-Gg: AY/fxX6WQcLSMGiHaXMLwhlGxFp1dwtIffGJkbXpJabD/lQ/MLl6VcGFLidN3bu8xeO
	HNBuL5n7k+FPharnOh43xPWn5/9VT/OnnIjczFPMuR5yJqoZBhcEGHJccHq+kj45PhYNDcIfphh
	hayfVQeD67sMy7rRTVdobPfK0PoPzm7+OKlG2q2ebjzXDJeiGmrJs5YlV0h1AdJ4Rq5UFmil31L
	x4Wja8RTjiwrDV+nFRK8KTldXi7hw1wXRpcIANj27nlorQU/ri2KFttd2W1iqEbi9raEUG0D4GW
	ObEVqdOE1iHWAiK0McLKeFB7K4jHnI5dWc6mGps9jn40DTeuGv6FnjKp/b+C7MLjBcdSBMN/KwW
	7hJZ2uA==
X-Google-Smtp-Source: AGHT+IFO3HTbnMSbkrRWMjNjmy23bIcyTv04ZZlpl9CQZXrfoq5iBaAHCqTg1Tiu4kfd0NUiH7kO1HhF+gcpW0lYFD4=
X-Received: by 2002:a05:651c:1548:b0:336:df0e:f4ac with SMTP id
 38308e7fff4ca-382ff80b322mr8840211fa.25.1767804053340; Wed, 07 Jan 2026
 08:40:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107161729.3855851-1-gary@kernel.org> <20260107161729.3855851-2-gary@kernel.org>
In-Reply-To: <20260107161729.3855851-2-gary@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 7 Jan 2026 11:40:17 -0500
X-Gm-Features: AQt7F2pHVC2LJPZIJP1DjUvg01pgaIjaKF8tLUmeYdku5UXhTM2UhzSF_1POhuc
Message-ID: <CAJ-ks9m8nfQoDp3ymF7Yhvp076t+55bZzJ7wCQqXhu6sjGBUNg@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] rust: pin-init: internal: remove proc-macro[2]
 and quote workarounds
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, rust-for-linux@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 11:29=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>
> From: Benno Lossin <lossin@kernel.org>
>
> The kernel only had the `proc-macro` library available, whereas the
> user-space version also used `proc-macro2` and `quote`. Now both are
> available to the kernel, making it possible to remove the workarounds.
>
> Clippy complains about unnecessary `.to_string()` as `proc-macro2`
> provides additional `PartialEq` impl, so they are removed.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

> ---
>  rust/Makefile                             | 16 ++++++++++------
>  rust/pin-init/internal/src/helpers.rs     |  7 ++-----
>  rust/pin-init/internal/src/lib.rs         | 16 ----------------
>  rust/pin-init/internal/src/pin_data.rs    | 18 ++++++------------
>  rust/pin-init/internal/src/pinned_drop.rs | 10 ++++------
>  rust/pin-init/internal/src/zeroable.rs    |  6 ++----
>  scripts/generate_rust_analyzer.py         |  2 +-
>  7 files changed, 25 insertions(+), 50 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 5d357dce1704d..96f0ac53ec0e8 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -212,9 +212,10 @@ rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
>
>  rustdoc-pin_init_internal: private rustdoc_host =3D yes
>  rustdoc-pin_init_internal: private rustc_target_flags =3D --cfg kernel \
> -    --extern proc_macro --crate-type proc-macro
> +    --extern proc_macro --extern proc_macro2 --extern quote --extern syn=
 \
> +    --crate-type proc-macro
>  rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
> -    rustdoc-clean FORCE
> +    rustdoc-clean rustdoc-proc_macro2 rustdoc-quote rustdoc-syn FORCE
>         +$(call if_changed,rustdoc)
>
>  rustdoc-pin_init: private rustdoc_host =3D yes
> @@ -273,9 +274,10 @@ rusttestlib-macros: $(src)/macros/lib.rs \
>         +$(call if_changed,rustc_test_library)
>
>  rusttestlib-pin_init_internal: private rustc_target_flags =3D --cfg kern=
el \
> -    --extern proc_macro
> +    --extern proc_macro --extern proc_macro2 --extern quote --extern syn
>  rusttestlib-pin_init_internal: private rustc_test_library_proc =3D yes
> -rusttestlib-pin_init_internal: $(src)/pin-init/internal/src/lib.rs FORCE
> +rusttestlib-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
> +    rusttestlib-proc_macro2 rusttestlib-quote rusttestlib-syn FORCE
>         +$(call if_changed,rustc_test_library)
>
>  rusttestlib-pin_init: private rustc_target_flags =3D --extern pin_init_i=
nternal \
> @@ -547,8 +549,10 @@ $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj=
)/libproc_macro2.rlib \
>      $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
>         +$(call if_changed_dep,rustc_procmacro)
>
> -$(obj)/$(libpin_init_internal_name): private rustc_target_flags =3D --cf=
g kernel
> -$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs=
 FORCE
> +$(obj)/$(libpin_init_internal_name): private rustc_target_flags =3D --cf=
g kernel \
> +    --extern proc_macro2 --extern quote --extern syn
> +$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs=
 \
> +       $(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rli=
b FORCE
>         +$(call if_changed_dep,rustc_procmacro)
>
>  quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_=
QUIET)) L $@
> diff --git a/rust/pin-init/internal/src/helpers.rs b/rust/pin-init/intern=
al/src/helpers.rs
> index 236f989a50f2f..90f85eaa41231 100644
> --- a/rust/pin-init/internal/src/helpers.rs
> +++ b/rust/pin-init/internal/src/helpers.rs
> @@ -1,9 +1,6 @@
>  // SPDX-License-Identifier: Apache-2.0 OR MIT
>
> -#[cfg(not(kernel))]
> -use proc_macro2 as proc_macro;
> -
> -use proc_macro::{TokenStream, TokenTree};
> +use proc_macro2::{TokenStream, TokenTree};
>
>  /// Parsed generics.
>  ///
> @@ -101,7 +98,7 @@ pub(crate) fn parse_generics(input: TokenStream) -> (G=
enerics, Vec<TokenTree>) {
>                      1 =3D> {
>                          // Here depending on the token, it might be a ge=
neric variable name.
>                          match tt.clone() {
> -                            TokenTree::Ident(i) if at_start && i.to_stri=
ng() =3D=3D "const" =3D> {
> +                            TokenTree::Ident(i) if at_start && i =3D=3D =
"const" =3D> {
>                                  let Some(name) =3D toks.next() else {
>                                      // Parsing error.
>                                      break;
> diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/s=
rc/lib.rs
> index 297b0129a5bfd..4c4dc639ce823 100644
> --- a/rust/pin-init/internal/src/lib.rs
> +++ b/rust/pin-init/internal/src/lib.rs
> @@ -7,27 +7,11 @@
>  //! `pin-init` proc macros.
>
>  #![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
> -// Allow `.into()` to convert
> -// - `proc_macro2::TokenStream` into `proc_macro::TokenStream` in the us=
er-space version.
> -// - `proc_macro::TokenStream` into `proc_macro::TokenStream` in the ker=
nel version.
> -//   Clippy warns on this conversion, but it's required by the user-spac=
e version.
> -//
> -// Remove once we have `proc_macro2` in the kernel.
> -#![allow(clippy::useless_conversion)]
>  // Documentation is done in the pin-init crate instead.
>  #![allow(missing_docs)]
>
>  use proc_macro::TokenStream;
>
> -#[cfg(kernel)]
> -#[path =3D "../../../macros/quote.rs"]
> -#[macro_use]
> -#[cfg_attr(not(kernel), rustfmt::skip)]
> -mod quote;
> -#[cfg(not(kernel))]
> -#[macro_use]
> -extern crate quote;
> -
>  mod helpers;
>  mod pin_data;
>  mod pinned_drop;
> diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/inter=
nal/src/pin_data.rs
> index 87d4a7eb1d35e..86a53b37cc660 100644
> --- a/rust/pin-init/internal/src/pin_data.rs
> +++ b/rust/pin-init/internal/src/pin_data.rs
> @@ -1,10 +1,8 @@
>  // SPDX-License-Identifier: Apache-2.0 OR MIT
>
> -#[cfg(not(kernel))]
> -use proc_macro2 as proc_macro;
> -
>  use crate::helpers::{parse_generics, Generics};
> -use proc_macro::{Group, Punct, Spacing, TokenStream, TokenTree};
> +use proc_macro2::{Group, Punct, Spacing, TokenStream, TokenTree};
> +use quote::quote;
>
>  pub(crate) fn pin_data(args: TokenStream, input: TokenStream) -> TokenSt=
ream {
>      // This proc-macro only does some pre-parsing and then delegates the=
 actual parsing to
> @@ -28,7 +26,7 @@ pub(crate) fn pin_data(args: TokenStream, input: TokenS=
tream) -> TokenStream {
>      // The name of the struct with ty_generics.
>      let struct_name =3D rest
>          .iter()
> -        .skip_while(|tt| !matches!(tt, TokenTree::Ident(i) if i.to_strin=
g() =3D=3D "struct"))
> +        .skip_while(|tt| !matches!(tt, TokenTree::Ident(i) if i =3D=3D "=
struct"))
>          .nth(1)
>          .and_then(|tt| match tt {
>              TokenTree::Ident(_) =3D> {
> @@ -65,7 +63,7 @@ pub(crate) fn pin_data(args: TokenStream, input: TokenS=
tream) -> TokenStream {
>          .into_iter()
>          .flat_map(|tt| {
>              // We ignore top level `struct` tokens, since they would emi=
t a compile error.
> -            if matches!(&tt, TokenTree::Ident(i) if i.to_string() =3D=3D=
 "struct") {
> +            if matches!(&tt, TokenTree::Ident(i) if i =3D=3D "struct") {
>                  vec![tt]
>              } else {
>                  replace_self_and_deny_type_defs(&struct_name, tt, &mut e=
rrs)
> @@ -98,11 +96,7 @@ fn replace_self_and_deny_type_defs(
>  ) -> Vec<TokenTree> {
>      match tt {
>          TokenTree::Ident(ref i)
> -            if i.to_string() =3D=3D "enum"
> -                || i.to_string() =3D=3D "trait"
> -                || i.to_string() =3D=3D "struct"
> -                || i.to_string() =3D=3D "union"
> -                || i.to_string() =3D=3D "impl" =3D>
> +            if i =3D=3D "enum" || i =3D=3D "trait" || i =3D=3D "struct" =
|| i =3D=3D "union" || i =3D=3D "impl" =3D>
>          {
>              errs.extend(
>                  format!(
> @@ -119,7 +113,7 @@ fn replace_self_and_deny_type_defs(
>              );
>              vec![tt]
>          }
> -        TokenTree::Ident(i) if i.to_string() =3D=3D "Self" =3D> struct_n=
ame.clone(),
> +        TokenTree::Ident(i) if i =3D=3D "Self" =3D> struct_name.clone(),
>          TokenTree::Literal(_) | TokenTree::Punct(_) | TokenTree::Ident(_=
) =3D> vec![tt],
>          TokenTree::Group(g) =3D> vec![TokenTree::Group(Group::new(
>              g.delimiter(),
> diff --git a/rust/pin-init/internal/src/pinned_drop.rs b/rust/pin-init/in=
ternal/src/pinned_drop.rs
> index c4ca7a70b726a..cf8cd1c429849 100644
> --- a/rust/pin-init/internal/src/pinned_drop.rs
> +++ b/rust/pin-init/internal/src/pinned_drop.rs
> @@ -1,15 +1,13 @@
>  // SPDX-License-Identifier: Apache-2.0 OR MIT
>
> -#[cfg(not(kernel))]
> -use proc_macro2 as proc_macro;
> -
> -use proc_macro::{TokenStream, TokenTree};
> +use proc_macro2::{TokenStream, TokenTree};
> +use quote::quote;
>
>  pub(crate) fn pinned_drop(_args: TokenStream, input: TokenStream) -> Tok=
enStream {
>      let mut toks =3D input.into_iter().collect::<Vec<_>>();
>      assert!(!toks.is_empty());
>      // Ensure that we have an `impl` item.
> -    assert!(matches!(&toks[0], TokenTree::Ident(i) if i.to_string() =3D=
=3D "impl"));
> +    assert!(matches!(&toks[0], TokenTree::Ident(i) if i =3D=3D "impl"));
>      // Ensure that we are implementing `PinnedDrop`.
>      let mut nesting: usize =3D 0;
>      let mut pinned_drop_idx =3D None;
> @@ -27,7 +25,7 @@ pub(crate) fn pinned_drop(_args: TokenStream, input: To=
kenStream) -> TokenStream
>          if i >=3D 1 && nesting =3D=3D 0 {
>              // Found the end of the generics, this should be `PinnedDrop=
`.
>              assert!(
> -                matches!(tt, TokenTree::Ident(i) if i.to_string() =3D=3D=
 "PinnedDrop"),
> +                matches!(tt, TokenTree::Ident(i) if i =3D=3D "PinnedDrop=
"),
>                  "expected 'PinnedDrop', found: '{tt:?}'"
>              );
>              pinned_drop_idx =3D Some(i);
> diff --git a/rust/pin-init/internal/src/zeroable.rs b/rust/pin-init/inter=
nal/src/zeroable.rs
> index e0ed3998445cf..d8a5ef3883f4b 100644
> --- a/rust/pin-init/internal/src/zeroable.rs
> +++ b/rust/pin-init/internal/src/zeroable.rs
> @@ -1,10 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>
> -#[cfg(not(kernel))]
> -use proc_macro2 as proc_macro;
> -
>  use crate::helpers::{parse_generics, Generics};
> -use proc_macro::{TokenStream, TokenTree};
> +use proc_macro2::{TokenStream, TokenTree};
> +use quote::quote;
>
>  pub(crate) fn parse_zeroable_derive_input(
>      input: TokenStream,
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 147d0cc940681..d31d938886589 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -123,7 +123,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>      append_crate(
>          "pin_init_internal",
>          srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
> -        [],
> +        ["std", "proc_macro", "proc_macro2", "quote", "syn"],
>          cfg=3D["kernel"],
>          is_proc_macro=3DTrue,
>      )
>
> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> --
> 2.51.2
>
