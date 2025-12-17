Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A7A34F25E;
	Wed, 17 Dec 2025 17:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765992992; cv=pass; b=m7BT7nv2gWTTUaH4YJjNPfUKWxa3kyfAm5fpCBKks2Y9HNV0TZUAzR8YwviXaDD7XY03S58nEMkPIDLVRV+z4oPXWtMQAsPszaAml/JB09Du4sWCCxCqfy6plj14QyyNpGv1sUzfmaxEPlUtNYxOTCRR4bwESsqnCpTg3QN3pJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765992992; c=relaxed/simple;
	bh=l9muEBGIPdeTQhdgm0H/lxTI1Fu35V7ld2tj2iyoU0E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PblouzBoAXT6W9LrQxg4o/YoimnzCw0MC3QiAzvPmCqcVPz14IvvntApf6f/ADteuFdZocnZEKIcK3rwRfKxSYcTIQZKYOu4xnp+TrpWZvbNIKf18GkqPazEGKGh4rQdS5P3cyEN19jVV6RnsUiSTD3Jf8hPso+x65KKAT16fOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=dO3LmPaf; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="dO3LmPaf"
ARC-Seal: i=1; a=rsa-sha256; t=1765992977; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RNSkE79Tkq6W3rjxorKt308dOxkOpR/k6+WQ7VF1gpl7SITuzpLwyuDqJWv7g9F/thkwFqrICoRaUAVRRBumCW3k1hCewB01FDyFXGG0B2DXM3moBh0pz0w2N9hx6DSH2FKYI1NZpwzMQZ2ivYLR5K96nvpy+7i8z97rPkP26Xg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765992977; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eQcHx1Q84G4jIHROmbOSgVnG2UFIoaLORWzRCtEQE64=; 
	b=MRKbIR/01wR2HepWLt07rFRu+73S41/7a6GxsddQUXQ8CZ+P5PZJWKRuw2/YMIsFP3pupnFErQZgJkMls9VeQwGKE2k1yBiKFrh5EIOiVnfCPbc1iv7NzNKyzVbvZSmt10wcDTZEbJQLDll4Oq49tVNNrrsdwFNgWO3CX05R+Ho=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765992977;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=eQcHx1Q84G4jIHROmbOSgVnG2UFIoaLORWzRCtEQE64=;
	b=dO3LmPafumyfOEjpVSEN6kUs+kGc2KxwbGD4xN68zSE6TiOVho7exmLz2mPCDLtv
	4UCNYfKPfjKSxPoBIm25+ZkWxSdflI6bPb86S6SovuT66C/3wYjsbHD4acWNHW0xt70
	tw7dw6dcYMLicnVivRDaK/3AQFsvRnWOwFfpm6RE=
Received: by mx.zohomail.com with SMTPS id 1765992975543447.55134281630956;
	Wed, 17 Dec 2025 09:36:15 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 2/3] rust: Add support for deriving `AsBytes` and
 `FromBytes`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251216-transmute-v2-2-b23e5277ad02@google.com>
Date: Wed, 17 Dec 2025 14:35:59 -0300
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
Message-Id: <E3281FEE-EE5E-4594-9B0E-E9350BA2136D@collabora.com>
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
 <20251216-transmute-v2-2-b23e5277ad02@google.com>
To: Matthew Maurer <mmaurer@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Matthew,

> On 15 Dec 2025, at 21:44, Matthew Maurer <mmaurer@google.com> wrote:
>=20
> This provides a derive macro for `AsBytes` and `FromBytes` for structs
> only. For both, it checks the respective trait on every underlying
> field. For `AsBytes`, it emits a const-time padding check that will =
fail
> the compilation if derived on a type with padding.
>=20
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
> rust/macros/lib.rs       | 63 =
++++++++++++++++++++++++++++++++++++++++++++++++
> rust/macros/transmute.rs | 58 =
++++++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 121 insertions(+)
>=20
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index =
b38002151871a33f6b4efea70be2deb6ddad38e2..d66397942529f67697f74a908e257cac=
c4201d84 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -20,9 +20,14 @@
> mod kunit;
> mod module;
> mod paste;
> +mod transmute;
> mod vtable;
>=20
> use proc_macro::TokenStream;
> +use syn::{
> +    parse_macro_input,
> +    DeriveInput, //
> +};
>=20
> /// Declares a kernel module.
> ///
> @@ -475,3 +480,61 @@ pub fn paste(input: TokenStream) -> TokenStream {
> pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream =
{
>     kunit::kunit_tests(attr, ts)
> }
> +
> +/// Implements `FromBytes` for a struct.
> +///
> +/// It will fail compilation if the struct you are deriving on cannot =
be determined to implement
> +/// `FromBytes` safely. It may still fail for some types which would =
be safe to implement
> +/// `FromBytes` for, in which case you will need to write the =
implementation and justification
> +/// yourself.
> +///
> +/// Main reasons your type may be rejected:
> +/// * Not a `struct`
> +/// * One of the fields is not `FromBytes`
> +///
> +/// # Examples
> +///
> +/// ```
> +/// #[derive(FromBytes)]
> +/// #[repr(C)]
> +/// struct Foo {
> +///   x: u32,
> +///   y: u16,
> +///   z: u16,
> +/// }
> +/// ```
> +#[proc_macro_derive(FromBytes)]
> +pub fn derive_from_bytes(tokens: TokenStream) -> TokenStream {
> +    let input =3D parse_macro_input!(tokens as DeriveInput);
> +    transmute::from_bytes(input).into()
> +}
> +
> +/// Implements `AsBytes` for a struct.
> +///
> +/// It will fail compilation if the struct you are deriving on cannot =
be determined to implement
> +/// `AsBytes` safely. It may still fail for some structures which =
would be safe to implement
> +/// `AsBytes`, in which case you will need to write the =
implementation and justification
> +/// yourself.
> +///
> +/// Main reasons your type may be rejected:
> +/// * Not a `struct`
> +/// * One of the fields is not `AsBytes`
> +/// * Your struct has generic parameters
> +/// * There is padding somewhere in your struct

Why is padding relevant here but not in FromBytes?

> +///
> +/// # Examples
> +///
> +/// ```
> +/// #[derive(AsBytes)]
> +/// #[repr(C)]
> +/// struct Foo {
> +///   x: u32,
> +///   y: u16,
> +///   z: u16,
> +/// }
> +/// ```
> +#[proc_macro_derive(AsBytes)]
> +pub fn derive_as_bytes(tokens: TokenStream) -> TokenStream {
> +    let input =3D parse_macro_input!(tokens as DeriveInput);
> +    transmute::as_bytes(input).into()
> +}
> diff --git a/rust/macros/transmute.rs b/rust/macros/transmute.rs
> new file mode 100644
> index =
0000000000000000000000000000000000000000..43cf36a1334f1fed23c0e777026392f9=
87f78d8d
> --- /dev/null
> +++ b/rust/macros/transmute.rs
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use proc_macro2::TokenStream;
> +use syn::{parse_quote, DeriveInput, Fields, Ident, ItemConst, Path, =
WhereClause};
> +
> +fn all_fields_impl(fields: &Fields, trait_: &Path) -> WhereClause {
> +    let tys =3D fields.iter().map(|field| &field.ty);
> +    parse_quote! {
> +        where #(for<'a> #tys: #trait_),*

Why do we need this hrtb here?

> +    }
> +}
> +
> +fn struct_padding_check(fields: &Fields, name: &Ident) -> ItemConst {
> +    let tys =3D fields.iter().map(|field| &field.ty);
> +    parse_quote! {
> +        const _: () =3D {
> +            assert!(#(core::mem::size_of::<#tys>())+* =3D=3D =
core::mem::size_of::<#name>());
> +        };
> +    }
> +}
> +
> +pub(crate) fn as_bytes(input: DeriveInput) -> TokenStream {
> +    if !input.generics.params.is_empty() {
> +        return quote::quote! { compile_error!("#[derive(AsBytes)] =
does not support generics") };
> +    }
> +    let syn::Data::Struct(ref ds) =3D &input.data else {
> +        return quote::quote! { compile_error!("#[derive(AsBytes)] =
only supports structs") };
> +    };
> +    let name =3D input.ident;
> +    let trait_ =3D parse_quote! { ::kernel::transmute::AsBytes };
> +    let where_clause =3D all_fields_impl(&ds.fields, &trait_);
> +    let padding_check =3D struct_padding_check(&ds.fields, &name);
> +    quote::quote! {
> +        #padding_check
> +        // SAFETY: #name has no padding and all of its fields =
implement `AsBytes`
> +        unsafe impl #trait_ for #name #where_clause {}
> +    }

In general I=E2=80=99d add blanks.

> +}
> +
> +pub(crate) fn from_bytes(input: DeriveInput) -> TokenStream {
> +    let syn::Data::Struct(ref ds) =3D &input.data else {
> +        return quote::quote! { compile_error!("#[derive(FromBytes)] =
only supports structs") };
> +    };
> +    let (impl_generics, ty_generics, base_where_clause) =3D =
input.generics.split_for_impl();
> +    let name =3D input.ident;
> +    let trait_ =3D parse_quote! { ::kernel::transmute::FromBytes };
> +    let mut where_clause =3D all_fields_impl(&ds.fields, &trait_);
> +    if let Some(base_clause) =3D base_where_clause {
> +        where_clause
> +            .predicates
> +            .extend(base_clause.predicates.clone())
> +    };
> +    quote::quote! {
> +        // SAFETY: All fields of #name implement `FromBytes` and it =
is a struct, so there is no
> +        // implicit discriminator.
> +        unsafe impl #impl_generics #trait_ for #name #ty_generics =
#where_clause {}
> +    }
> +}
>=20
> --=20
> 2.52.0.305.g3fc767764a-goog
>=20
>=20

Overall looks good. Please chime in on the two questions above.

=E2=80=94 Daniel

