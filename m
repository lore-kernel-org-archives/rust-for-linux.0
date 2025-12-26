Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDE819CD1D
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 09:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766741810; cv=none; b=gnA8FhEm/IAYHahrycK0NSGWEs8uOEsC/0BTfcqwNKp+IOYI5rSe0Rqhl6D27MYQUbqybkrQpxv3YJ7FwZc5cVkgcAo1y85shKn6K4ijJ1oQ88fAN8B2APAUMbxvlbvCvyr84+cMpXOLjG7TA7HfyvEWRSFX9kM2eV6qwcyUMEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766741810; c=relaxed/simple;
	bh=GaVprzEMi448VYL8IRXpENEWKsALO7ni4VfVMA43I+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPKEbVrURXza8YUwoafu5z6dTMs00LYRt4y89MQUQi+8dM7AOPRIsHJXxDE2mDbjhO2oqCR+gT/nxQKnAhDJWn+Xx1bL6ft4wdOuH+x7mdEqwAE3y6sla5JDAGqckkx4U7CkUyBkEwQLAAOrZRx1N3vtUcAdhzJuNmgRLaXcNa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRzhsYsW; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRzhsYsW"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7c7aee74dceso2689680a34.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 01:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766741807; x=1767346607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Pk1eJzCdkbbDZj0ONSX88wHKyDc4JzANiZiM2GXgkk=;
        b=mRzhsYsWUK7eXQd41BLqEZeJGIaOgHfjOTJHF2lxKd0TIaPw8CCLStcDMSSFItJnUS
         5Cc7LmjL7H8nmvl/3BB5y1PINNlfdt9UxvK7yokryfNJf6otcmVuIfX0wRao94oINSza
         oIUUPBgSyZaOBbGIGdbJJJLTXda1tgQvfl/DeDvXw2TtEyQtdQUxWwLBYjciHsefXDCO
         e5R59YFhsqb0B4HctASDS4TlWyVM0whO1fGJBXkRYZ8z9r0ghERUVfPw5RB4dS/3VksN
         upsmgS2Iw2iUM86SFxVko6IcincP2FPDNpvJErxFc/f5EoThlejZxqM4J1QEwfoDXbaD
         WsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766741807; x=1767346607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Pk1eJzCdkbbDZj0ONSX88wHKyDc4JzANiZiM2GXgkk=;
        b=VHfygkM8kaQQTw0oXTvwU42JwnpLMbkCa3sugwUZX1jaGBaKd/WdLMWrouXkYWW9wK
         m+R86ReTZrQXuyAD2v6D/EIDyYjGe9Z0ZqVqkqYr/sFakkALkg9WE1HDpGYW66OZD4dF
         BaoWqz0bsvvfmvSjFiwPMOZtlg1uvqfL2DNrstELrZKtUDQZbaB3C/YtJ9EzArSYtkAx
         cMbUpaxuBN03hfOWcihjLOganN3NP/2h9mdlBh2MBbA976EPzVTkEuCtofPqxMLYIS/i
         Nfe28auDDl349wl20e5wHYevlfN+OCLkIDkfI0F9WcZRj+CMQzFfdbM5IeUiZ6lTPkYC
         QuEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2NFZiXt+k9B7SwqSYyn+pIrRi1vLWbfLOOLEbfVra/iENw8HCicjx03eYYiz5NYFuczNZMMBRGXWo2w+0Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4FdiVtzOUQed1SKCiJ/1Q5u8e/1jQwnaV1w/n6fVZOTyt3+3f
	rTkKK9PaObHozM4lUvAl7N5ioSD1oibWX7qIxj6JkjhmaPgcYM5p7dSCrokhgBGKO2KRVyRAwRF
	gNcqqK2XYx7tcP4Alua1lx4+Anwg6c0E=
X-Gm-Gg: AY/fxX5g0LD//kScybfATvlmAiORMf+4+sOeIrY5jLNYHEjJrZ3t8OPDKPlXysgIMsn
	ZUCdKePSAwVWj6+Pjzsl6240NZ7kcelPGcHyIbseX7eOqrL0buGMU/AL8kjS+ziRT/lfUNz5n+J
	mjWfE78/3pb7zPxNJ5iXhUKHzh39el5NxptcuhpQtl+gxfReY18JRe1RB9YRAdpv121sifAgfSv
	vZn60+m/RnYzqRKTHsV+F0hwu2vZXtU2RhkKycFuicncSF4r3PJxr21GnR6tX7fVH2N0Bo=
X-Google-Smtp-Source: AGHT+IH2gNskOXb5dVay/QpRauPuWoXSRqotVIU+5Kyey+IJNAU1cEpq972QDqSmxzLs9b4c5vw2v21AXhGd4122OLE=
X-Received: by 2002:a05:6820:6fd7:b0:659:9a49:8e66 with SMTP id
 006d021491bc7-65d0eaceb57mr8946603eaf.54.1766741807352; Fri, 26 Dec 2025
 01:36:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com> <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
In-Reply-To: <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Fri, 26 Dec 2025 18:36:36 +0900
X-Gm-Features: AQt7F2p9F76HqKssyFwBtXAjVkVZFTETiE1m4YBuVjTOM6By817Qmz10z11dT9I
Message-ID: <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] rust: macros: add derive macro for `Into`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2025 at 2:40=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:
> > +fn derive(target: DeriveTarget, input: DeriveInput) -> syn::Result<Tok=
enStream> {
> > +    let mut errors: Option<syn::Error> =3D None;
> > +    let mut combine_error =3D |err| match errors.as_mut() {
> > +        Some(errors) =3D> errors.combine(err),
> > +        None =3D> errors =3D Some(err),
> > +    };
> > +
> > +    let (helper_tys, repr_ty) =3D parse_attrs(target, &input.attrs)?;
> > +    for ty in &helper_tys {
> > +        if let Err(err) =3D ty.validate() {
> > +            combine_error(err);
> > +        }
> > +    }
> > +
> > +    let data_enum =3D match input.data {
> > +        Data::Enum(data) =3D> data,
> > +        Data::Struct(data) =3D> {
> > +            let msg =3D format!(
> > +                "expected `enum`, found `struct`; \
> > +                 `#[derive({})]` can only be applied to a unit-only en=
um",
> > +                target.get_trait_name()
> > +            );
> > +            return Err(syn::Error::new(data.struct_token.span(), msg))=
;
> > +        }
> > +        Data::Union(data) =3D> {
> > +            let msg =3D format!(
> > +                "expected `enum`, found `union`; \
> > +                 `#[derive({})]` can only be applied to a unit-only en=
um",
> > +                target.get_trait_name()
> > +            );
> > +            return Err(syn::Error::new(data.union_token.span(), msg));
> > +        }
> > +    };
> > +
> > +    for variant in &data_enum.variants {
> > +        match &variant.fields {
> > +            Fields::Named(fields) =3D> {
> > +                let msg =3D format!(
> > +                    "expected unit-like variant, found struct-like var=
iant; \
> > +                    `#[derive({})]` can only be applied to a unit-only=
 enum",
> > +                    target.get_trait_name()
> > +                );
> > +                combine_error(syn::Error::new_spanned(fields, msg));
> > +            }
> > +            Fields::Unnamed(fields) =3D> {
> > +                let msg =3D format!(
> > +                    "expected unit-like variant, found tuple-like vari=
ant; \
> > +                    `#[derive({})]` can only be applied to a unit-only=
 enum",
> > +                    target.get_trait_name()
> > +                );
> > +                combine_error(syn::Error::new_spanned(fields, msg));
> > +            }
> > +            _ =3D> (),
>
> We should be exhaustive here to exclude any future additions (ie break
> the build if a new `Fields::...` variant is added).

You're right, I missed that.

> > +        }
> > +    }
> > +
> > +    if let Some(errors) =3D errors {
> > +        return Err(errors);
> > +    }
> > +
> > +    let variants: Vec<_> =3D data_enum
> > +        .variants
> > +        .into_iter()
> > +        .map(|variant| variant.ident)
> > +        .collect();
> > +
> > +    Ok(derive_for_enum(
> > +        target,
> > +        &input.ident,
> > +        &variants,
> > +        &helper_tys,
> > +        &repr_ty,
> > +    ))
> > +}
> > +
> > +#[derive(Clone, Copy, Debug)]
> > +enum DeriveTarget {
> > +    Into,
> > +}
> > +
> > +impl DeriveTarget {
> > +    fn get_trait_name(&self) -> &'static str {
> > +        match self {
> > +            Self::Into =3D> "Into",
> > +        }
> > +    }
> > +
> > +    fn get_helper_name(&self) -> &'static str {
> > +        match self {
> > +            Self::Into =3D> "into",
> > +        }
> > +    }
> > +}
> > +
> > +fn parse_attrs(target: DeriveTarget, attrs: &[Attribute]) -> syn::Resu=
lt<(Vec<ValidTy>, Ident)> {
> > +    let helper =3D target.get_helper_name();
> > +
> > +    let mut repr_ty =3D None;
> > +    let mut helper_tys =3D Vec::new();
> > +    for attr in attrs {
> > +        if attr.path().is_ident("repr") {
> > +            attr.parse_nested_meta(|meta| {
> > +                let ident =3D meta.path.get_ident();
> > +                if ident.is_some_and(is_valid_primitive) {
> > +                    repr_ty =3D ident.cloned();
> > +                }
>
> While this works for now, writing `repr(C, {integer})` might become
> meaningful in the future, see [1]. We should just accept it now as well.
>
> [1]: https://github.com/rust-lang/rust/issues/68585

I think it's worth noting. I'll add a small comment for this.

> > +                // Delegate `repr` attribute validation to rustc.
> > +                Ok(())
> > +            })?;
> > +        } else if attr.path().is_ident(helper) && helper_tys.is_empty(=
) {
> > +            let args =3D attr.parse_args_with(Punctuated::<ValidTy, To=
ken![,]>::parse_terminated)?;
> > +            helper_tys.extend(args);
> > +        }
> > +    }
> > +
> > +    // Note on field-less `repr(C)` enums (quote from [1]):
> > +    //
> > +    //   In C, enums with discriminants that do not all fit into an `i=
nt` or all fit into an
> > +    //   `unsigned int` are a portability hazard: such enums are only =
permitted since C23, and not
> > +    //   supported e.g. by MSVC.
> > +    //
> > +    //   Furthermore, Rust interprets the discriminant values of `repr=
(C)` enums as expressions of
> > +    //   type `isize`. This makes it impossible to implement the C23 b=
ehavior of enums where the
> > +    //   enum discriminants have no predefined type and instead the en=
um uses a type large enough
> > +    //   to hold all discriminants.
> > +    //
> > +    //   Therefore, `repr(C)` enums in Rust require that either all di=
scriminants to fit into a C
> > +    //   `int` or they all fit into an `unsigned int`.
> > +    //
> > +    // As such, `isize` is a reasonable representation for `repr(C)` e=
nums, as it covers the range
> > +    //  of both `int` and `unsigned int`.
> > +    //
> > +    // For more information, see:
> > +    // - https://github.com/rust-lang/rust/issues/124403
> > +    // - https://github.com/rust-lang/rust/pull/147017
> > +    // - https://github.com/rust-lang/rust/blob/2ca7bcd03b87b52f7055a5=
9b817443b0ac4a530d/compiler/rustc_lint_defs/src/builtin.rs#L5251-L5263 [1]
> > +
> > +    // Extract the representation passed by `#[repr(...)]` if present.=
 If nothing is
> > +    // specified, the default is `Rust` representation, which uses `is=
ize` for its
> > +    // discriminant type.
> > +    // See: https://doc.rust-lang.org/reference/items/enumerations.htm=
l#r-items.enum.discriminant.repr-rust
>
> I think we should error when no `#[repr({integer})]` attribute is
> specified.

Not a blocker but just out of curiosity: are you concerned that the
default size might change in the future, leading to silent side
effects?

> > +    let repr_ty =3D repr_ty.unwrap_or_else(|| Ident::new("isize", Span=
::call_site()));
> > +    Ok((helper_tys, repr_ty))
> > +}
> > +
> > +fn derive_for_enum(
> > +    target: DeriveTarget,
> > +    enum_ident: &Ident,
> > +    variants: &[Ident],
> > +    helper_tys: &[ValidTy],
> > +    repr_ty: &Ident,
> > +) -> TokenStream {
> > +    let impl_fn =3D match target {
> > +        DeriveTarget::Into =3D> impl_into,
> > +    };
> > +
> > +    let qualified_repr_ty: syn::Path =3D parse_quote! { ::core::primit=
ive::#repr_ty };
> > +
> > +    return if helper_tys.is_empty() {
> > +        let ty =3D ValidTy::Primitive(repr_ty.clone());
> > +        let impls =3D
> > +            std::iter::once(ty).map(|ty| impl_fn(enum_ident, variants,=
 &qualified_repr_ty, &ty));
> > +        ::quote::quote! { #(#impls)* }
> > +    } else {
> > +        let impls =3D helper_tys
> > +            .iter()
> > +            .map(|ty| impl_fn(enum_ident, variants, &qualified_repr_ty=
, ty));
> > +        ::quote::quote! { #(#impls)* }
> > +    };
>
> Let's just do this when we still have the `helper_tys` vector:
>
>     helper_tys.push(ValidTy::Primitive(repr_ty));

The current implementation completely ignores what's in `#[repr(...)]`
when the `#[into(...)]` or `#[try_from(...)]` helper attributes are
specified. But users might expect, as you did, the macros to generate
impls not only for types specified in the helper attributes but also
for the one in `repr`. I think I should deduplicate `helper_tys` after
the push, but anyway, I'll change this in v5.

> > +
> > +    fn impl_into(
> > +        enum_ident: &Ident,
> > +        variants: &[Ident],
> > +        repr_ty: &syn::Path,
> > +        input_ty: &ValidTy,
> > +    ) -> TokenStream {
> > +        let param =3D Ident::new("value", Span::call_site());
> > +
> > +        let overflow_assertion =3D emit_overflow_assert(enum_ident, va=
riants, repr_ty, input_ty);
> > +        let cast =3D match input_ty {
> > +            ValidTy::Bounded(inner) =3D> {
> > +                let base_ty =3D inner.emit_qualified_base_ty();
> > +                let expr =3D parse_quote! { #param as #base_ty };
> > +                // Since the discriminant of `#param`, an enum variant=
, is determined
> > +                // at compile-time, we can rely on `Bounded::from_expr=
()`. It requires
> > +                // the provided expression to be verifiable at compile=
-time to avoid
> > +                // triggering a build error.
> > +                inner.emit_from_expr(&expr)
> > +            }
> > +            ValidTy::Primitive(ident) if ident =3D=3D "bool" =3D> {
> > +                ::quote::quote! { (#param as #repr_ty) =3D=3D 1 }
> > +            }
> > +            qualified @ ValidTy::Primitive(_) =3D> ::quote::quote! { #=
param as #qualified },
> > +        };
> > +
> > +        ::quote::quote! {
> > +            #[automatically_derived]
> > +            impl ::core::convert::From<#enum_ident> for #input_ty {
> > +                fn from(#param: #enum_ident) -> #input_ty {
> > +                    #overflow_assertion
> > +
> > +                    #cast
> > +                }
> > +            }
> > +        }
> > +    }
> > +
> > +    fn emit_overflow_assert(
> > +        enum_ident: &Ident,
> > +        variants: &[Ident],
> > +        repr_ty: &syn::Path,
> > +        input_ty: &ValidTy,
> > +    ) -> TokenStream {
>
> I feel like we should track this via traits rather than using a const
> assert. That approach will require & generate much less code.

Sorry, but could you elaborate? A small example of what you have in
mind would help a lot.

> > +        let qualified_i128: syn::Path =3D parse_quote! { ::core::primi=
tive::i128 };
> > +        let qualified_u128: syn::Path =3D parse_quote! { ::core::primi=
tive::u128 };
> > +
> > +        let input_min =3D input_ty.emit_min();
> > +        let input_max =3D input_ty.emit_max();
> > +
> > +        let variant_fits =3D variants.iter().map(|variant| {
> > +            let msg =3D format!(
> > +                "enum discriminant overflow: \
> > +                `{enum_ident}::{variant}` does not fit in `{input_ty}`=
",
> > +            );
> > +            ::quote::quote! {
> > +                ::core::assert!(fits(#enum_ident::#variant as #repr_ty=
), #msg);
> > +            }
> > +        });
> > +
> > +        ::quote::quote! {
> > +            const _: () =3D {
> > +                const fn fits(d: #repr_ty) -> ::core::primitive::bool =
{
> > +                    // For every integer type, its minimum value alway=
s fits in `i128`.
> > +                    let dst_min =3D #input_min;
> > +                    // For every integer type, its maximum value alway=
s fits in `u128`.
> > +                    let dst_max =3D #input_max;
> > +
> > +                    #[allow(unused_comparisons)]
> > +                    let is_src_signed =3D #repr_ty::MIN < 0;
> > +                    #[allow(unused_comparisons)]
> > +                    let is_dst_signed =3D dst_min < 0;
> > +
> > +                    if is_src_signed && is_dst_signed {
> > +                        // Casting from a signed value to `i128` does =
not overflow since
> > +                        // `i128` is the largest signed primitive inte=
ger type.
> > +                        (d as #qualified_i128) >=3D (dst_min as #quali=
fied_i128)
> > +                            && (d as #qualified_i128) <=3D (dst_max as=
 #qualified_i128)
> > +                    } else if is_src_signed && !is_dst_signed {
> > +                        // Casting from a signed value greater than 0 =
to `u128` does not
> > +                        // overflow since `u128::MAX` is greater than =
`i128::MAX`.
> > +                        d >=3D 0 && (d as #qualified_u128) <=3D (dst_m=
ax as #qualified_u128)
> > +                    } else {
> > +                        // Casting from an unsigned value to `u128` do=
es not overflow since
> > +                        // `u128` is the largest unsigned primitive in=
teger type.
> > +                        (d as #qualified_u128) <=3D (dst_max as #quali=
fied_u128)
> > +                    }
> > +                }
> > +
> > +                #(#variant_fits)*
> > +            };
> > +        }
> > +    }
> > +}
>
> > +
> > +impl fmt::Display for ValidTy {
> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > +        match self {
> > +            Self::Bounded(inner) =3D> inner.fmt(f),
> > +            Self::Primitive(ident) =3D> ident.fmt(f),
> > +        }
> > +    }
> > +}
> > +
> > +struct Bounded {
> > +    name: Ident,
> > +    open_angle: Token![<],
> > +    base_ty: Ident,
>
> We should allow a type here from syntax and then emit an error when it
> isn't a primitive.

Assuming you're talking about `syn::Type`, that seems better. I think I
should do the same thing for `ValidTy::Primitive`.

> > +    comma: Token![,],
> > +    bits: LitInt,
> > +    close_angle: Token![>],
> > +}
>
> > diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> > index b38002151871a33f6b4efea70be2deb6ddad38e2..02528d7212b75d28788f0c3=
3479edb272fa12e27 100644
> > --- a/rust/macros/lib.rs
> > +++ b/rust/macros/lib.rs
> > @@ -14,6 +14,7 @@
> >  #[macro_use]
> >  mod quote;
> >  mod concat_idents;
> > +mod convert;
> >  mod export;
> >  mod fmt;
> >  mod helpers;
> > @@ -23,6 +24,10 @@
> >  mod vtable;
> >
> >  use proc_macro::TokenStream;
> > +use syn::{
> > +    parse_macro_input,
> > +    DeriveInput, //
> > +};
> >
> >  /// Declares a kernel module.
> >  ///
> > @@ -475,3 +480,155 @@ pub fn paste(input: TokenStream) -> TokenStream {
> >  pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream =
{
> >      kunit::kunit_tests(attr, ts)
> >  }
> > +
> > +/// A derive macro for providing an implementation of the [`Into`] tra=
it.
> > +///
> > +/// This macro automatically derives the [`Into`] trait for a given en=
um by generating
> > +/// the relevant [`From`] implementation. Currently, it only supports =
[unit-only enum]s.
> > +///
> > +/// [unit-only enum]: https://doc.rust-lang.org/reference/items/enumer=
ations.html#r-items.enum.unit-only
> > +///
> > +/// # Notes
> > +///
> > +/// - Unlike its name suggests, the macro actually generates [`From`] =
implementations
> > +///   which automatically provide corresponding [`Into`] implementatio=
ns.
> > +///
> > +/// - The macro uses the `into` custom attribute or `repr` attribute t=
o generate [`From`]
> > +///   implementations. `into` always takes precedence over `repr`.
>
> What do you mean by "precedence" here? You always generate it for all
> helper_tys and the repr?

To quote my reply above:

    The current implementation completely ignores what's in
    `#[repr(...)]` when the `#[into(...)]` or `#[try_from(...)]` helper
    attributes are specified.

That's why I used the term "precedence." But as I said, I'll change the
logic to generate impls for both.

Thanks a lot for the time and effort you put into reviewing it!

Best regards,
Jesung
