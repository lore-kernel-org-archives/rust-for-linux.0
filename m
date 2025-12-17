Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A0019D8A8;
	Wed, 17 Dec 2025 19:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765999618; cv=pass; b=QNRG952BkBm7+3PspZNubXbRXRCsVc+LPjCUyTmuNsPCguVpHu4pU+5qHdDWrv3byU+mUIeveOFFgRwXq/ghv1WH/hOXapDpzGchT/m7Vj+m9Dg/yC3cGy6Yrnw1GUFbSHJai8GscKcNyO3saUeFdxncT2+7OzbMNUKe8jCj28o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765999618; c=relaxed/simple;
	bh=IJ7NpCCjLeZTnG3pgZXYjUsFULHIW6jGbnGWeA6nB/0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gRtdMIhaw2SCvDqaSm+J/VfQgef7UK0kiiWYPHds8JEyJ1x2Y/KUzp7kzfWvyNllEMAF3z+gTtc2rDoUcnvj2g2He2zYWvn0jbRo5USPR5e9em+Ixyr7r7/kaJQXB0i8cqbFAYcthm4AuEx/Pq6RXQ6QGm0BY8T0zHG2dqplKBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ZIouPI/j; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ZIouPI/j"
ARC-Seal: i=1; a=rsa-sha256; t=1765999603; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E0rjYkcCbwsk3jXC5EImz7U7KqHAjNrDvVugkshkva4EohwFgPLitRtoqp970kwz/iyQbKE69msQAINj2jM8bqC0tUisdlLxgaM7OH0MQLaBMkeSYUSvoUfY7u5xhzPBp+pmkJaPfTTERiQkJRMdsLd/RinoSRqtZ9nc+qPja8o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765999603; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Tfh96DcRzHsZ5Pb5XEuR4wMkKaocgCNIptBVvD7wvXc=; 
	b=WOoeDG1k2kbP+Ft2UuWvjemCuHbSuuhLkeEQE8d4P5XAeopKf/3i56HKv5Lt1OoqXW3RtovtvqN8ZzsViUz39C3ac7Q+tmUIcMefxih8x0ZbvktZ//DFnJA1x4UIOjHYEthG8iyk5qopRxwlj5TAlNdKIRnqPRUdIodvK7g0Re8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765999603;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=Tfh96DcRzHsZ5Pb5XEuR4wMkKaocgCNIptBVvD7wvXc=;
	b=ZIouPI/jLsAOtqrTUQJl7Z63MhIkx4zN/EBvtXq2s5MTgSTGWp1kZ1fR5txXtGx9
	WxXZplMMCWqW/+emnGNEmW6XURS15Qwoh5PMS6J1zlMUVCfCptOnz350VIinrt8sP/V
	d1+uhThpXnRo/vRuSze0NNEhbn8nS/Oz6XMpJ+9Y=
Received: by mx.zohomail.com with SMTPS id 1765999601797899.1441603166105;
	Wed, 17 Dec 2025 11:26:41 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 3/3] rust: Support deriving `AsBytes`/`FromBytes` on
 bindgen types
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251216-transmute-v2-3-b23e5277ad02@google.com>
Date: Wed, 17 Dec 2025 16:26:26 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A92BEB09-6F45-4886-8723-99A27D3F6518@collabora.com>
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
 <20251216-transmute-v2-3-b23e5277ad02@google.com>
To: Matthew Maurer <mmaurer@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Matthew,

> On 15 Dec 2025, at 21:44, Matthew Maurer <mmaurer@google.com> wrote:
>=20
> To support this, we need to move the `transmute` module into a =
separate
> crate to allow the `bindings` crate to depend on it. Most user code is
> still expected to address the module as `kernel::transmute`, which is =
a
> re-export. `ffi::transmute` is now available for use in `bindings`.

Thanks, that=E2=80=99s really useful for Tyr.

>=20
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
> rust/Makefile                     | 14 +++++++++-----
> rust/bindgen_parameters           |  8 ++++++++
> rust/bindings/lib.rs              |  4 ++++
> rust/{ffi.rs =3D> ffi/lib.rs}       |  5 +++++
> rust/{kernel =3D> ffi}/transmute.rs |  0
> rust/kernel/lib.rs                |  2 +-
> rust/macros/lib.rs                | 24 ++++++++++++++++++++++--
> rust/macros/transmute.rs          | 12 +++++++-----
> rust/uapi/lib.rs                  |  4 ++++
> scripts/generate_rust_analyzer.py |  2 +-
> 10 files changed, 61 insertions(+), 14 deletions(-)
>=20
> diff --git a/rust/Makefile b/rust/Makefile
> index =
5d357dce1704d15e43effc528be8f5a4d74d3d8d..178aa3036c4acba1c4c266196912da2d=
60fe0d5f 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -207,7 +207,7 @@ rustdoc-compiler_builtins: =
$(src)/compiler_builtins.rs rustdoc-core FORCE
> +$(call if_changed,rustdoc)
>=20
> rustdoc-ffi: private is-kernel-object :=3D y
> -rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
> +rustdoc-ffi: $(src)/ffi/lib.rs rustdoc-core FORCE
> +$(call if_changed,rustdoc)
>=20
> rustdoc-pin_init_internal: private rustdoc_host =3D yes
> @@ -249,7 +249,7 @@ quiet_cmd_rustc_test_library =3D =
$(RUSTC_OR_CLIPPY_QUIET) TL $<
> rusttestlib-build_error: $(src)/build_error.rs FORCE
> +$(call if_changed,rustc_test_library)
>=20
> -rusttestlib-ffi: $(src)/ffi.rs FORCE
> +rusttestlib-ffi: $(src)/ffi/lib.rs FORCE
> +$(call if_changed,rustc_test_library)
>=20
> rusttestlib-proc_macro2: private rustc_target_flags =3D =
$(proc_macro2-flags)
> @@ -657,22 +657,26 @@ $(obj)/build_error.o: $(src)/build_error.rs =
$(obj)/compiler_builtins.o FORCE
> +$(call if_changed_rule,rustc_library)
>=20
> $(obj)/ffi.o: private skip_gendwarfksyms =3D 1
> -$(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
> +$(obj)/ffi.o: $(src)/ffi/lib.rs $(obj)/compiler_builtins.o FORCE
> +$(call if_changed_rule,rustc_library)
>=20
> -$(obj)/bindings.o: private rustc_target_flags =3D --extern ffi =
--extern pin_init
> +$(obj)/bindings.o: private rustc_target_flags =3D --extern ffi =
--extern pin_init \
> + --extern macros
> $(obj)/bindings.o: $(src)/bindings/lib.rs \
>     $(obj)/ffi.o \
>     $(obj)/pin_init.o \
> +    $(obj)/$(libmacros_name) \
>     $(obj)/bindings/bindings_generated.rs \
>     $(obj)/bindings/bindings_helpers_generated.rs FORCE
> +$(call if_changed_rule,rustc_library)
>=20
> -$(obj)/uapi.o: private rustc_target_flags =3D --extern ffi --extern =
pin_init
> +$(obj)/uapi.o: private rustc_target_flags =3D --extern ffi --extern =
pin_init \
> + --extern macros
> $(obj)/uapi.o: private skip_gendwarfksyms =3D 1
> $(obj)/uapi.o: $(src)/uapi/lib.rs \
>     $(obj)/ffi.o \
>     $(obj)/pin_init.o \
> +    $(obj)/$(libmacros_name) \
>     $(obj)/uapi/uapi_generated.rs FORCE
> +$(call if_changed_rule,rustc_library)

+1 on splitting the above into a separate commit

>=20
> diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
> index =
fd2fd1c3cb9a51ea46fcd721907783b457aa1378..d56343ca03979e345f8adb7eb8fd7f2b=
9d4be6ee 100644
> --- a/rust/bindgen_parameters
> +++ b/rust/bindgen_parameters
> @@ -64,3 +64,11 @@
> # Structs should implement `Zeroable` when all of their fields do.
> --with-derive-custom-struct .*=3DMaybeZeroable
> --with-derive-custom-union .*=3DMaybeZeroable
> +
> +# Every C struct can try to derive FromBytes. If they have unmet =
requirements,
> +# the impl will just be a no-op due to the where clause.
> +--with-derive-custom-struct .*=3DFromBytesFfi
> +
> +# We can't auto-derive AsBytes, as we need a const-time check to see =
if there
> +# is padding involved. Add it explicitly when you expect no padding.
> +--with-derive-custom-struct cpumask=3DAsBytesFfi
> diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> index =
0c57cf9b4004f176997c59ecc58a9a9ac76163d9..c29312fca1b01b707bb11b05d446d444=
80a4b81f 100644
> --- a/rust/bindings/lib.rs
> +++ b/rust/bindings/lib.rs
> @@ -31,6 +31,10 @@
> #[allow(clippy::undocumented_unsafe_blocks)]
> #[cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, =
allow(unnecessary_transmutes))]
> mod bindings_raw {
> +    use macros::{
> +        AsBytesFfi,
> +        FromBytesFfi, //
> +    };
>     use pin_init::{MaybeZeroable, Zeroable};
>=20
>     // Manual definition for blocklisted types.
> diff --git a/rust/ffi.rs b/rust/ffi/lib.rs
> similarity index 87%
> rename from rust/ffi.rs
> rename to rust/ffi/lib.rs
> index =
f961e9728f590fd2c52d4c03a1f715d654051d04..14052362f091a609bc505fe6eca77fe9=
98fe2321 100644
> --- a/rust/ffi.rs
> +++ b/rust/ffi/lib.rs
> @@ -10,6 +10,11 @@
>=20
> #![no_std]
>=20
> +#[doc(hidden)]
> +// This lives here to make it accessible to `bindings`, similar to =
the other `ffi` types.
> +// User code should access it through `kernel::transmute`.
> +pub mod transmute;
> +
> macro_rules! alias {
>     ($($name:ident =3D $ty:ty;)*) =3D> {$(
>         #[allow(non_camel_case_types, missing_docs)]
> diff --git a/rust/kernel/transmute.rs b/rust/ffi/transmute.rs
> similarity index 100%
> rename from rust/kernel/transmute.rs
> rename to rust/ffi/transmute.rs
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index =
f812cf12004286962985a068665443dc22c389a2..4aa54dd83319ef16bd4baa1964114f1e=
6549942b 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -63,6 +63,7 @@
> extern crate self as kernel;
>=20
> pub use ffi;
> +pub use ffi::transmute;
>=20
> pub mod acpi;
> pub mod alloc;
> @@ -146,7 +147,6 @@
> pub mod task;
> pub mod time;
> pub mod tracepoint;
> -pub mod transmute;
> pub mod types;
> pub mod uaccess;
> #[cfg(CONFIG_USB =3D "y")]
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index =
d66397942529f67697f74a908e257cacc4201d84..bde94c2a8ddf708872bcd56a4713784b=
5ccdf04e 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -506,7 +506,7 @@ pub fn kunit_tests(attr: TokenStream, ts: =
TokenStream) -> TokenStream {
> #[proc_macro_derive(FromBytes)]
> pub fn derive_from_bytes(tokens: TokenStream) -> TokenStream {
>     let input =3D parse_macro_input!(tokens as DeriveInput);
> -    transmute::from_bytes(input).into()
> +    transmute::from_bytes("kernel", input).into()
> }
>=20
> /// Implements `AsBytes` for a struct.
> @@ -536,5 +536,25 @@ pub fn derive_from_bytes(tokens: TokenStream) -> =
TokenStream {
> #[proc_macro_derive(AsBytes)]
> pub fn derive_as_bytes(tokens: TokenStream) -> TokenStream {
>     let input =3D parse_macro_input!(tokens as DeriveInput);
> -    transmute::as_bytes(input).into()
> +    transmute::as_bytes("kernel", input).into()
> +}
> +
> +#[doc(hidden)]
> +#[proc_macro_derive(FromBytesFfi)]

Let=E2=80=99s perhaps capitalize this as FromBytesFFI?

> +/// This is equivalent to `FromBytes`, but uses the `ffi` crate as =
the trait definition site
> +/// instead of `kernel`. This is intended for use inside `bindings`. =
Everyone else can refer to the
> +/// trait through `kernel`.
> +pub fn derive_from_bytes_trait(tokens: TokenStream) -> TokenStream {
> +    let input =3D parse_macro_input!(tokens as DeriveInput);
> +    transmute::from_bytes("ffi", input).into()
> +}
> +
> +#[doc(hidden)]
> +#[proc_macro_derive(AsBytesFfi)]

Same here?

> +/// This is equivalent to `AsBytes`, but uses the `ffi` crate as the =
trait definition site
> +/// instead of `kernel`. This is intended for use inside `bindings`. =
Everyone else can refer to the
> +/// trait through `kernel`.
> +pub fn derive_as_bytes_trait(tokens: TokenStream) -> TokenStream {
> +    let input =3D parse_macro_input!(tokens as DeriveInput);
> +    transmute::as_bytes("ffi", input).into()
> }
> diff --git a/rust/macros/transmute.rs b/rust/macros/transmute.rs
> index =
43cf36a1334f1fed23c0e777026392f987f78d8d..9bd6d279675fb1d58cdceff1f4dde0dc=
f33fbf99 100644
> --- a/rust/macros/transmute.rs
> +++ b/rust/macros/transmute.rs
> @@ -1,6 +1,6 @@
> // SPDX-License-Identifier: GPL-2.0
>=20
> -use proc_macro2::TokenStream;
> +use proc_macro2::{Span, TokenStream};
> use syn::{parse_quote, DeriveInput, Fields, Ident, ItemConst, Path, =
WhereClause};
>=20
> fn all_fields_impl(fields: &Fields, trait_: &Path) -> WhereClause {
> @@ -19,7 +19,8 @@ fn struct_padding_check(fields: &Fields, name: =
&Ident) -> ItemConst {
>     }
> }
>=20
> -pub(crate) fn as_bytes(input: DeriveInput) -> TokenStream {
> +pub(crate) fn as_bytes(crate_: &str, input: DeriveInput) -> =
TokenStream {
> +    let crate_ =3D Ident::new(crate_, Span::call_site());
>     if !input.generics.params.is_empty() {
>         return quote::quote! { compile_error!("#[derive(AsBytes)] does =
not support generics") };
>     }
> @@ -27,7 +28,7 @@ pub(crate) fn as_bytes(input: DeriveInput) -> =
TokenStream {
>         return quote::quote! { compile_error!("#[derive(AsBytes)] only =
supports structs") };
>     };
>     let name =3D input.ident;
> -    let trait_ =3D parse_quote! { ::kernel::transmute::AsBytes };
> +    let trait_ =3D parse_quote! { ::#crate_::transmute::AsBytes };
>     let where_clause =3D all_fields_impl(&ds.fields, &trait_);
>     let padding_check =3D struct_padding_check(&ds.fields, &name);
>     quote::quote! {
> @@ -37,13 +38,14 @@ unsafe impl #trait_ for #name #where_clause {}
>     }
> }
>=20
> -pub(crate) fn from_bytes(input: DeriveInput) -> TokenStream {
> +pub(crate) fn from_bytes(crate_: &str, input: DeriveInput) -> =
TokenStream {
> +    let crate_ =3D Ident::new(crate_, Span::call_site());
>     let syn::Data::Struct(ref ds) =3D &input.data else {
>         return quote::quote! { compile_error!("#[derive(FromBytes)] =
only supports structs") };
>     };
>     let (impl_generics, ty_generics, base_where_clause) =3D =
input.generics.split_for_impl();
>     let name =3D input.ident;
> -    let trait_ =3D parse_quote! { ::kernel::transmute::FromBytes };
> +    let trait_ =3D parse_quote! { ::#crate_::transmute::FromBytes };
>     let mut where_clause =3D all_fields_impl(&ds.fields, &trait_);
>     if let Some(base_clause) =3D base_where_clause {
>         where_clause
> diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
> index =
1d5fd9efb93e9db97fec84fca2bae37b500c20c5..2033b7125558d7ccfae67b94777f5ce5=
9593a528 100644
> --- a/rust/uapi/lib.rs
> +++ b/rust/uapi/lib.rs
> @@ -34,6 +34,10 @@
> type __kernel_ssize_t =3D isize;
> type __kernel_ptrdiff_t =3D isize;
>=20
> +use macros::{
> +    AsBytesFfi,
> +    FromBytesFfi, //

Why is this =E2=80=9C//" here? Is this related to the import style =
change that took place recently?

> +};
> use pin_init::MaybeZeroable;
>=20
> include!(concat!(env!("OBJTREE"), "/rust/uapi/uapi_generated.rs"));
> diff --git a/scripts/generate_rust_analyzer.py =
b/scripts/generate_rust_analyzer.py
> index =
147d0cc940681426771db865bc2462e7029a6d7d..843d081eacaca8edeeac5978bd8107a4=
98008186 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -137,7 +137,7 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, core_edit
>=20
>     append_crate(
>         "ffi",
> -        srctree / "rust" / "ffi.rs",
> +        srctree / "rust" / "ffi" / "lib.rs",
>         ["core", "compiler_builtins"],
>     )
>=20
>=20
> --=20
> 2.52.0.305.g3fc767764a-goog
>=20
>=20

^ IMHO, this should also be in separate commit.

Looks good to me overall.

=E2=80=94 Daniel

