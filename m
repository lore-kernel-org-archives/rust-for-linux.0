Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DAF1C84BD
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 00:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765586103; cv=pass; b=ULLWm5lP19klWoSzk21KQLz1Xawor6yHXBiJ9phvoRlF4UfkfQ4L2Ud/mCkK10nrBJG0M84rPZl5LDAdaWhTWACNxKqZ2k86qIaSkIvtkOpavrbuyTgWxktfFkGSa6XrUcAdinOCyKAbMT89Qthja+hjt87Hj85H3WjohbB/f7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765586103; c=relaxed/simple;
	bh=4qURoOu3ZSUjxMxKxyI3gVHEeUlPqLNbawrJw369NsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onav3RNeU7b3eZfMUx3Yl9SZeOr22hwkaKKKrDR4zgZjV/mC0C9y2BWwLEPNJ2qsghU0Nfo3zYvdQrQbj3jXng8UCNOjevqXlmSik/d5lvmFIsBhhSCQpcWv1dJTn72I7C4ufgeD3VPT6Ojfx6o6c6PpliVL+6WMKHPfiboRL1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WFmCFRVk; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WFmCFRVk"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-644fbd758b3so28482a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 16:35:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765586099; cv=none;
        d=google.com; s=arc-20240605;
        b=YhLJO9X3pHXTwNpeNxv3bQdQ1Rk9Qov1WW+t/VBxhGuRC2M1bEcN00AqA0AaZ5XF6b
         J5qHYHRWXRyKM+gKiqzEyL+C4U0MluhD0WUUPGnO6HknWGG6tOiF5DkhbBqL7Rn3DlSg
         akD52N/6ZOxj14BSxlvHYxwOO5hrvmABUW9t04D1gGLzrSdfT+m43LquCINO+50pciIf
         x33TQxIITIcaKIpRYNdEoX4BTU6dVeu6ZSE6DFswhXBCocuytvcVdqho7NWdYqNjM24a
         jiMh+jqadqvE6zYkEZKTQPpWTtmWbuHW96pb6z7iN6PRicDTry0+fGZqDjxuZa2BvCYW
         o4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ilIKQdhgC/FRBApjB6qLWF2XOsUQl8yAFYQGBxYj828=;
        fh=aQL/1QhkabQbUS0h5KFlxTgM6v1tEbMLoaMvAnu6Jjw=;
        b=ZsWTY3x/1kFfJXLC4/dWWNSOqNXqiOCyRaMcU5QYt8yY+Lm7Gc2wWNA10CO0kS/B5n
         FmwdJod9TuF7VA/V1LjDeET7HJ0LNU7PtuOohA2M33kITFPwhx7SHzbCxmIgyHMJiR7p
         TTXNGdvH3NQA5Ud0VCQX0ea+U5z8Tzos2jAphxcLlckcCAR2XAoWP3iN6bQ2JOOzf0zh
         oJG5RedF47Ht+vYEcAW+p2OhCoSPqdGXMU/5ZbS6ysZipWH9B/pBw5iTavNvlWnZsVi7
         RIZKzb+1sJ7b4UXYlm/o/PYB6Rbt8m3E9Ueo96hlXJ2qz6S7NpwVYOrf2Vvvxe0wPf64
         IRCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765586099; x=1766190899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilIKQdhgC/FRBApjB6qLWF2XOsUQl8yAFYQGBxYj828=;
        b=WFmCFRVkELEo6aiaPr8lMnXS/hpVbuICnywJlbdyEGHd/kz127/xh1LXiQMaGSZ3Th
         0nDKaXYyIdZ8JBFFG4KKpRmrBuValFS43kWymSLgZTxvPZ8JjLi4CO9VoUiVoWmYtTPJ
         UymToCvDimdELqjTDZ436yLF+e9AyuNp0zJrBaP1sIMotNu8P72TTGuihruYQoS6fVb4
         dBuTrAIWfp3fWj5r2vhXi+w7+xuPI+9LFaLaYt16748epoEEjznnTyO+MkN8Xfw89Zpn
         cpPooIEEwU9dbMaGbdnNSvtXrGPj2sD0wZgLIXETKHjumegwbp1tIcn1meHXu0DTZnMv
         FF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765586099; x=1766190899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ilIKQdhgC/FRBApjB6qLWF2XOsUQl8yAFYQGBxYj828=;
        b=SDAH7EHuVhRdgnx82ImjJRVhR494n5Y03c+pCdotx4VQf0NCw9zRStlUYo7g8BtB79
         F9UNrqe3h8Vy+fT7/rRONUSvvtTouJx8soSE/xhHVzq4/soZpl6HGD2DnEPdLM2Qxu29
         Jy4/fV54gARh7JKCKEhQ/sHumZdlbwrtVCKpw494Uk7fkHehSt2PeVQmQ1IxHD7fnAPk
         WsIpr0wrx0oC1bvIL6GikxxotWYNK6FHdMJiBadgfTrc1uLz331u+ROF2oKpCz3HWFsc
         +SY5+l5wnysKlRd1ttxMzvit/nsGzkRDcjXfpFvRJelaWgGTAdVWgkMOgvaJpKY44hCj
         VAmQ==
X-Gm-Message-State: AOJu0YzZu5/0Vn+vZ3Zlxmw/P12NvSgKsCFo2a/vm3G07PmTa+zJLPoP
	e9oAPZzh8mX5+9WM8suLT7g3yJ1IdOnYs4mQ2Qtd7lDrAie2v5heqkhl1tWY2YY5CKujYpNja2d
	aQMP2jjvELSTYwnjKvWK7LCTsUp/WTnBJhVuUSMap
X-Gm-Gg: AY/fxX4zuBUhadvvApsL6d1WnuJrjo3ScQvZXX6kw/PFT5Wk6oKRghQyTWmyUVJfVfM
	hV1+UhaS1DwtXLDDqjtPArCHSbXtLg5AQi8e3vDA0WpbOBylnJZ2mekMihxlJevcL5t/klnt06J
	nTr9lpZACSTqtsRx8hUMpFitXKB6o0dt7TMdicvjIBmYO+hi3JMD8UQi2zC5XyF1dU5SIRmk/h9
	OKEPFccuWikNqwmnhuU2NwwE269adie+0hUT1af1TQBN4Nz2bn1A7fEDAGMgYpcU5rqGTXATLP+
	UUEkFDeerXHxRpm0bfdMb28i80oEc3hhlUhN
X-Google-Smtp-Source: AGHT+IHyRus5Wm4HS2y8WeO53XFyDGd4RNIU43z3vOpaHCwgCOKvgz1CXk1pu7YebJDluMluzPdIo053om0AKPGEJxE=
X-Received: by 2002:a05:6402:20cc:10b0:640:8f9c:af3a with SMTP id
 4fb4d7f45d1cf-649b05740b4mr17608a12.6.1765586099046; Fri, 12 Dec 2025
 16:34:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212-transmute-v1-0-9b28e06c6508@google.com> <20251212-transmute-v1-3-9b28e06c6508@google.com>
In-Reply-To: <20251212-transmute-v1-3-9b28e06c6508@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 12 Dec 2025 16:34:47 -0800
X-Gm-Features: AQt7F2qo0-uBs3USjHTjYZ8KyMAJDO3o00n4OZzZ9jk3-UxCLSV7jSQ4nqXgdxo
Message-ID: <CAGSQo02=B86jKhSZoLdADbuKro3vQaq1V6CZGwSa8hRMhvKHtg@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: Support deriving `AsBytes`/`FromBytes` on
 bindgen types
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 3:42=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> To support this, we need to move the `transmute` module into a separate
> crate to allow the `bindings` crate to depend on it. Most user code is
> still expected to address the module as `kernel::transmute`, which is a
> re-export. `traits::transmute` is now available for use in `bindings`.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  rust/Makefile                        | 19 +++++++++++++++----
>  rust/bindgen_parameters              |  8 ++++++++
>  rust/bindings/lib.rs                 |  1 +
>  rust/kernel/lib.rs                   |  3 ++-
>  rust/macros/lib.rs                   | 24 ++++++++++++++++++++++--
>  rust/macros/transmute.rs             | 12 +++++++-----
>  rust/traits/lib.rs                   |  6 ++++++
>  rust/{kernel =3D> traits}/transmute.rs |  0
>  rust/uapi/lib.rs                     |  1 +
>  9 files changed, 62 insertions(+), 12 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 5d357dce1704d15e43effc528be8f5a4d74d3d8d..bbede4b5b4faa5edeb1d33bdc=
e338a7b76915d07 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -660,26 +660,37 @@ $(obj)/ffi.o: private skip_gendwarfksyms =3D 1
>  $(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
>         +$(call if_changed_rule,rustc_library)
>
> -$(obj)/bindings.o: private rustc_target_flags =3D --extern ffi --extern =
pin_init
> +$(obj)/bindings.o: private rustc_target_flags =3D --extern ffi --extern =
pin_init \
> +       --extern traits --extern macros
>  $(obj)/bindings.o: $(src)/bindings/lib.rs \
>      $(obj)/ffi.o \
>      $(obj)/pin_init.o \
> +    $(obj)/traits.o \
> +    $(obj)/$(libmacros_name) \
>      $(obj)/bindings/bindings_generated.rs \
>      $(obj)/bindings/bindings_helpers_generated.rs FORCE
>         +$(call if_changed_rule,rustc_library)
>
> -$(obj)/uapi.o: private rustc_target_flags =3D --extern ffi --extern pin_=
init
> +$(obj)/traits.o: private skip_gendwarfksyms =3D 1
> +$(obj)/traits.o: $(src)/traits/lib.rs FORCE

I've noticed that with high parallelism on a clean build this build
rule will sometimes fail because `compiler_builtins.o` is not listed
as a dependency (I had kind of expected `rustc_library` to imply
that). I'll fix that in a v2, but figured I'd note that for anyone
trying it out in the meantime.

> +       +$(call if_changed_rule,rustc_library)
> +
> +
> +$(obj)/uapi.o: private rustc_target_flags =3D --extern ffi --extern pin_=
init \
> +       --extern traits --extern macros
>  $(obj)/uapi.o: private skip_gendwarfksyms =3D 1
>  $(obj)/uapi.o: $(src)/uapi/lib.rs \
>      $(obj)/ffi.o \
>      $(obj)/pin_init.o \
> +    $(obj)/traits.o \
> +    $(obj)/$(libmacros_name) \
>      $(obj)/uapi/uapi_generated.rs FORCE
>         +$(call if_changed_rule,rustc_library)
>
>  $(obj)/kernel.o: private rustc_target_flags =3D --extern ffi --extern pi=
n_init \
> -    --extern build_error --extern macros --extern bindings --extern uapi
> +    --extern build_error --extern macros --extern bindings --extern uapi=
 --extern traits
>  $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o $(obj)/pin_in=
it.o \
> -    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o FORCE
> +    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o $(obj)/trai=
ts.o FORCE
>         +$(call if_changed_rule,rustc_library)
>
>  ifdef CONFIG_JUMP_LABEL
> diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
> index fd2fd1c3cb9a51ea46fcd721907783b457aa1378..60910ba8731180516b4980b9e=
0dc5fb0c297da55 100644
> --- a/rust/bindgen_parameters
> +++ b/rust/bindgen_parameters
> @@ -64,3 +64,11 @@
>  # Structs should implement `Zeroable` when all of their fields do.
>  --with-derive-custom-struct .*=3DMaybeZeroable
>  --with-derive-custom-union .*=3DMaybeZeroable
> +
> +# Every C struct can try to derive FromBytes. If they have unmet require=
ments,
> +# the impl will just be a no-op due to the where clause.
> +--with-derive-custom-struct .*=3DFromBytesTrait
> +
> +# We can't auto-derive AsBytes, as we need a const-time check to see if =
there
> +# is padding involved. Add it explicitly when you expect no padding.
> +--with-derive-custom-struct cpumask=3DAsBytesTrait
> diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> index 0c57cf9b4004f176997c59ecc58a9a9ac76163d9..07932ab130c0a8e56e35d49ac=
e77ae1becc09ae6 100644
> --- a/rust/bindings/lib.rs
> +++ b/rust/bindings/lib.rs
> @@ -31,6 +31,7 @@
>  #[allow(clippy::undocumented_unsafe_blocks)]
>  #[cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_tr=
ansmutes))]
>  mod bindings_raw {
> +    use macros::{AsBytesTrait, FromBytesTrait};
>      use pin_init::{MaybeZeroable, Zeroable};
>
>      // Manual definition for blocklisted types.
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf12004286962985a068665443dc22c389a2..8c605f4905223077f5d824f27=
220c4c24e71d5f4 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -146,7 +146,6 @@
>  pub mod task;
>  pub mod time;
>  pub mod tracepoint;
> -pub mod transmute;
>  pub mod types;
>  pub mod uaccess;
>  #[cfg(CONFIG_USB =3D "y")]
> @@ -159,6 +158,8 @@
>  pub use macros;
>  pub use uapi;
>
> +pub use traits::*;
> +
>  /// Prefix to appear before log messages printed from within the `kernel=
` crate.
>  const __LOG_PREFIX: &[u8] =3D b"rust_kernel\0";
>
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index cec8bd3a742b3f6b3680c4286f73c8fa550a58a0..862de56339bbb18cd30a26044=
4dc19f24b13a0d0 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -503,7 +503,7 @@ pub fn kunit_tests(attr: TokenStream, ts: TokenStream=
) -> TokenStream {
>  #[proc_macro_derive(FromBytes)]
>  pub fn derive_from_bytes(tokens: TokenStream) -> TokenStream {
>      let input =3D parse_macro_input!(tokens as DeriveInput);
> -    transmute::from_bytes(input).into()
> +    transmute::from_bytes("kernel", input).into()
>  }
>
>  /// Implements `AsBytes` for a struct.
> @@ -533,5 +533,25 @@ pub fn derive_from_bytes(tokens: TokenStream) -> Tok=
enStream {
>  #[proc_macro_derive(AsBytes)]
>  pub fn derive_as_bytes(tokens: TokenStream) -> TokenStream {
>      let input =3D parse_macro_input!(tokens as DeriveInput);
> -    transmute::as_bytes(input).into()
> +    transmute::as_bytes("kernel", input).into()
> +}
> +
> +#[doc(hidden)]
> +#[proc_macro_derive(FromBytesTrait)]
> +/// This is equivalent to `FromBytes`, but uses the `trait` crate as the=
 trait definition site
> +/// instead of `kernel`. This is intended for use inside `bindings`. Eve=
ryone else can refer to the
> +/// trait through `kernel`.
> +pub fn derive_from_bytes_trait(tokens: TokenStream) -> TokenStream {
> +    let input =3D parse_macro_input!(tokens as DeriveInput);
> +    transmute::from_bytes("traits", input).into()
> +}
> +
> +#[doc(hidden)]
> +#[proc_macro_derive(AsBytesTrait)]
> +/// This is equivalent to `AsBytes`, but uses the `trait` crate as the t=
rait definition site
> +/// instead of `kernel`. This is intended for use inside `bindings`. Eve=
ryone else can refer to the
> +/// trait through `kernel`.
> +pub fn derive_as_bytes_trait(tokens: TokenStream) -> TokenStream {
> +    let input =3D parse_macro_input!(tokens as DeriveInput);
> +    transmute::as_bytes("traits", input).into()
>  }
> diff --git a/rust/macros/transmute.rs b/rust/macros/transmute.rs
> index 43cf36a1334f1fed23c0e777026392f987f78d8d..9bd6d279675fb1d58cdceff1f=
4dde0dcf33fbf99 100644
> --- a/rust/macros/transmute.rs
> +++ b/rust/macros/transmute.rs
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>
> -use proc_macro2::TokenStream;
> +use proc_macro2::{Span, TokenStream};
>  use syn::{parse_quote, DeriveInput, Fields, Ident, ItemConst, Path, Wher=
eClause};
>
>  fn all_fields_impl(fields: &Fields, trait_: &Path) -> WhereClause {
> @@ -19,7 +19,8 @@ fn struct_padding_check(fields: &Fields, name: &Ident) =
-> ItemConst {
>      }
>  }
>
> -pub(crate) fn as_bytes(input: DeriveInput) -> TokenStream {
> +pub(crate) fn as_bytes(crate_: &str, input: DeriveInput) -> TokenStream =
{
> +    let crate_ =3D Ident::new(crate_, Span::call_site());
>      if !input.generics.params.is_empty() {
>          return quote::quote! { compile_error!("#[derive(AsBytes)] does n=
ot support generics") };
>      }
> @@ -27,7 +28,7 @@ pub(crate) fn as_bytes(input: DeriveInput) -> TokenStre=
am {
>          return quote::quote! { compile_error!("#[derive(AsBytes)] only s=
upports structs") };
>      };
>      let name =3D input.ident;
> -    let trait_ =3D parse_quote! { ::kernel::transmute::AsBytes };
> +    let trait_ =3D parse_quote! { ::#crate_::transmute::AsBytes };
>      let where_clause =3D all_fields_impl(&ds.fields, &trait_);
>      let padding_check =3D struct_padding_check(&ds.fields, &name);
>      quote::quote! {
> @@ -37,13 +38,14 @@ unsafe impl #trait_ for #name #where_clause {}
>      }
>  }
>
> -pub(crate) fn from_bytes(input: DeriveInput) -> TokenStream {
> +pub(crate) fn from_bytes(crate_: &str, input: DeriveInput) -> TokenStrea=
m {
> +    let crate_ =3D Ident::new(crate_, Span::call_site());
>      let syn::Data::Struct(ref ds) =3D &input.data else {
>          return quote::quote! { compile_error!("#[derive(FromBytes)] only=
 supports structs") };
>      };
>      let (impl_generics, ty_generics, base_where_clause) =3D input.generi=
cs.split_for_impl();
>      let name =3D input.ident;
> -    let trait_ =3D parse_quote! { ::kernel::transmute::FromBytes };
> +    let trait_ =3D parse_quote! { ::#crate_::transmute::FromBytes };
>      let mut where_clause =3D all_fields_impl(&ds.fields, &trait_);
>      if let Some(base_clause) =3D base_where_clause {
>          where_clause
> diff --git a/rust/traits/lib.rs b/rust/traits/lib.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..33020a17333521b3bee71bd3d=
003a759ac97fedd
> --- /dev/null
> +++ b/rust/traits/lib.rs
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Support crate containing traits and other definitions that need to b=
e available without the
> +//! kernel crate. The usual case for this is code that needs to be avail=
able in the bindings crate.
> +#![no_std]
> +pub mod transmute;
> diff --git a/rust/kernel/transmute.rs b/rust/traits/transmute.rs
> similarity index 100%
> rename from rust/kernel/transmute.rs
> rename to rust/traits/transmute.rs
> diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
> index 1d5fd9efb93e9db97fec84fca2bae37b500c20c5..928b4b2eb035250399e3150f2=
0b638edbf04dac1 100644
> --- a/rust/uapi/lib.rs
> +++ b/rust/uapi/lib.rs
> @@ -34,6 +34,7 @@
>  type __kernel_ssize_t =3D isize;
>  type __kernel_ptrdiff_t =3D isize;
>
> +use macros::{AsBytesTrait, FromBytesTrait};
>  use pin_init::MaybeZeroable;
>
>  include!(concat!(env!("OBJTREE"), "/rust/uapi/uapi_generated.rs"));
>
> --
> 2.52.0.305.g3fc767764a-goog
>
