Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDD72773EC
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 10:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766832333; cv=none; b=Pzrge4wAcJ1jhS6jupF3n9zFXo7w6olL0NPmmxFxN+Vvg8DPftJlgVZOPvgMg0XN/6eKef8L1vb1J4xKELpxD0EJuKiUwi9npSELyDnoqo+tVhzsEwrH7baVtw+VAo4x/qHH0Q7c0BzLs5wLJEKnNm55osa3VKCUZLx3v+UbcCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766832333; c=relaxed/simple;
	bh=jdNkUVTf3bxeUrJwRT3zCmT2/h6Yhvbv4mMVcNZNsdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkjN/HQGmT/47ioq8sDCB61vY8+Jc8jLugrtYsnYETpgHK/tVP0XufoWzqBv0cwV0RBhJVfhneinBiyTySEMSjL4C6NtRuYMxElit7z16IiuT0oBWBkndjzzRooZsqB+mXt24+/vmHiAhiheA8uO0FAYGezaeFI7GMDbS9K+yxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=db3HUOs2; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="db3HUOs2"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-3e89d226c3aso5707455fac.2
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 02:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766832330; x=1767437130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXmM0vaUF8T6HaGp2Qwj82J1GyNYQ80rIhTIDGlmJl4=;
        b=db3HUOs2AuYkc3IpfWbcfD3ypTYhi4votiHEUBx97ZUIHQA+MmYn+3us8RL7HETBCQ
         nX+G6Asxt+QT/Yi9Olw6fKwuoppVpTGgsLn6Gs8HB5lhcqDG5ZfSqRxpBND7aSFiyfTb
         xA3RgxY8KBt9FYFc62S2988HhAgm3jlcvPyV0HRzSySv1B0rSzagY0D7oanjXwein2YT
         X16uMtdkqgtyP6tQIVcY592aeTsWXDgoBnCLe1yHCv067RVQRPZ6Jw+7dcTKci9Cowd0
         aMAFdlSlQ4ViX18QfSJviHBHdVMX6wmE1cdgaWQhCnmP6vIGSGoZMtH+aNAmcSGVrN0X
         JwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766832330; x=1767437130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXmM0vaUF8T6HaGp2Qwj82J1GyNYQ80rIhTIDGlmJl4=;
        b=Nalr+6Zgj2IotNhN/5WoCeJJGeKY3cV3U5qdzrZ6/zcfqVkp97S5xN84XjXdjFFiv7
         zurVBY+qp5rIws+O9Y/vReR6+8UhO+aCNuc+qnaQNdR2qfoXN5puLXsRoogH0j2NKIch
         +SoPMLu7R1wI3HXNmgzNxj8PIenfmQu01Ca5PkTOcg76vpcZNuXpNunDVTU93CTiMWk6
         xGXiivsRSuk1xWgo3gR15c2DbPKC0SNUHTh2ZFHDIRwdZE2lj6zuxW++330RnxIoNanO
         Vq6mNSjMMFJ9hwyhVfvXmKUYxjDLCjjky06d2/ZkUlH7cSFey7Z8bzP1aArlLwNeZbGi
         g7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCV7c0EjFGnO8zfEBk2JLEkQfwQoibJQ5IE8cGBm18jI0kfgHjSJStFEIsd5ZUZX3+Qh2XNO/p0Zb8vi/uxnug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrbn0evdcybNmjuEkBSFCqHvS2K+2cBdImxXKtYiGO7nkQv4Bs
	wyGAqnD4I1PH0LvObcmgW/yTtqEBVcROXrIuMsEaUmDBaVf/8IvUGQKIQYTqAX4bBVeNUbupCRH
	oygMW/1dg83fAdb5mPZCZnFj400/Kc8A=
X-Gm-Gg: AY/fxX7PpUVrbXvbckNV/pUwabs/yavk8RgpCorF1TlZ9LjCxuE2mxfx0xi5eKQwL4i
	54YYi7SJCuPmwTP9nqpQ0bRT6XPG3ZOq+EK6SFWfysuUf6U93z1rWsUOHjvT+5GVEJg+OZ+q7CV
	9fWiO2ed/+YDGDbOHYFF72gfMM5T6ipKg3azzTOG7YIe6xyoYQyDuzLtaeCxKKU9EtLTT596oXU
	G6muB9+VbyUVg9IBDCJg/2e1QRMplrNITQ2M2Fkl3sfOI8lK93dNo4QSztufKlpH57jxH0=
X-Google-Smtp-Source: AGHT+IHChSL48doaNjZ0IZjwusM1nBU7UXoN7stEd64wAQCK3Vrc6Lw3VlzZDY3oTWSbl7cdWJww6R14sPpKlxri3V0=
X-Received: by 2002:a4a:e394:0:b0:659:9a49:8e98 with SMTP id
 006d021491bc7-65d0ea65dfdmr8520254eaf.28.1766832329837; Sat, 27 Dec 2025
 02:45:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
 <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org> <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
 <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
In-Reply-To: <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Sat, 27 Dec 2025 19:45:18 +0900
X-Gm-Features: AQt7F2qaaiupY9oCYaomnJflhKP2JFwAzZ_5Jn4mEAVTvrUa-MhmkN79dmSRVqo
Message-ID: <CA+tqQ4Kyy1re209kjBvtJU037MEcv+jQzEt=E9CMS4d2iuFR5g@mail.gmail.com>
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

On Sat, Dec 27, 2025 at 1:57=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
> On Fri Dec 26, 2025 at 10:36 AM CET, Jesung Yang wrote:
> > On Fri, Dec 26, 2025 at 2:40=E2=80=AFAM Benno Lossin <lossin@kernel.org=
> wrote:
> >> On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:
> >> > +fn parse_attrs(target: DeriveTarget, attrs: &[Attribute]) -> syn::R=
esult<(Vec<ValidTy>, Ident)> {
> >> > +    let helper =3D target.get_helper_name();
> >> > +
> >> > +    let mut repr_ty =3D None;
> >> > +    let mut helper_tys =3D Vec::new();
> >> > +    for attr in attrs {
> >> > +        if attr.path().is_ident("repr") {
> >> > +            attr.parse_nested_meta(|meta| {
> >> > +                let ident =3D meta.path.get_ident();
> >> > +                if ident.is_some_and(is_valid_primitive) {
> >> > +                    repr_ty =3D ident.cloned();
> >> > +                }
> >>
> >> While this works for now, writing `repr(C, {integer})` might become
> >> meaningful in the future, see [1]. We should just accept it now as wel=
l.
> >>
> >> [1]: https://github.com/rust-lang/rust/issues/68585
> >
> > I think it's worth noting. I'll add a small comment for this.
>
> My suggestion was to just accept `repr(C, {integer})` and make it result
> in the same as `repr({integer})`.

Ah I misread that. Thanks for the clarification.

> >> > +                // Delegate `repr` attribute validation to rustc.
> >> > +                Ok(())
> >> > +            })?;
> >> > +        } else if attr.path().is_ident(helper) && helper_tys.is_emp=
ty() {
> >> > +            let args =3D attr.parse_args_with(Punctuated::<ValidTy,=
 Token![,]>::parse_terminated)?;
> >> > +            helper_tys.extend(args);
> >> > +        }
> >> > +    }
> >> > +
> >> > +    // Note on field-less `repr(C)` enums (quote from [1]):
> >> > +    //
> >> > +    //   In C, enums with discriminants that do not all fit into an=
 `int` or all fit into an
> >> > +    //   `unsigned int` are a portability hazard: such enums are on=
ly permitted since C23, and not
> >> > +    //   supported e.g. by MSVC.
> >> > +    //
> >> > +    //   Furthermore, Rust interprets the discriminant values of `r=
epr(C)` enums as expressions of
> >> > +    //   type `isize`. This makes it impossible to implement the C2=
3 behavior of enums where the
> >> > +    //   enum discriminants have no predefined type and instead the=
 enum uses a type large enough
> >> > +    //   to hold all discriminants.
> >> > +    //
> >> > +    //   Therefore, `repr(C)` enums in Rust require that either all=
 discriminants to fit into a C
> >> > +    //   `int` or they all fit into an `unsigned int`.
> >> > +    //
> >> > +    // As such, `isize` is a reasonable representation for `repr(C)=
` enums, as it covers the range
> >> > +    //  of both `int` and `unsigned int`.
> >> > +    //
> >> > +    // For more information, see:
> >> > +    // - https://github.com/rust-lang/rust/issues/124403
> >> > +    // - https://github.com/rust-lang/rust/pull/147017
> >> > +    // - https://github.com/rust-lang/rust/blob/2ca7bcd03b87b52f705=
5a59b817443b0ac4a530d/compiler/rustc_lint_defs/src/builtin.rs#L5251-L5263 [=
1]
> >> > +
> >> > +    // Extract the representation passed by `#[repr(...)]` if prese=
nt. If nothing is
> >> > +    // specified, the default is `Rust` representation, which uses =
`isize` for its
> >> > +    // discriminant type.
> >> > +    // See: https://doc.rust-lang.org/reference/items/enumerations.=
html#r-items.enum.discriminant.repr-rust
> >>
> >> I think we should error when no `#[repr({integer})]` attribute is
> >> specified.
> >
> > Not a blocker but just out of curiosity: are you concerned that the
> > default size might change in the future, leading to silent side
> > effects?
>
> `isize` already changes size when you switch between 64 and 32 bit
> architectures. I think the author of an enum they want to convert into
> integers should think about which size the enum should be.
>
> They already can choose `repr(isize)` if that is correct in that case.
> As a default, I would have choosen `i32` (but that conflicts with Rust's
> default, so we can't do it).

Makes sense, that seems better.

> >> > +    fn impl_into(
> >> > +        enum_ident: &Ident,
> >> > +        variants: &[Ident],
> >> > +        repr_ty: &syn::Path,
> >> > +        input_ty: &ValidTy,
> >> > +    ) -> TokenStream {
> >> > +        let param =3D Ident::new("value", Span::call_site());
> >> > +
> >> > +        let overflow_assertion =3D emit_overflow_assert(enum_ident,=
 variants, repr_ty, input_ty);
> >> > +        let cast =3D match input_ty {
> >> > +            ValidTy::Bounded(inner) =3D> {
> >> > +                let base_ty =3D inner.emit_qualified_base_ty();
> >> > +                let expr =3D parse_quote! { #param as #base_ty };
> >> > +                // Since the discriminant of `#param`, an enum vari=
ant, is determined
> >> > +                // at compile-time, we can rely on `Bounded::from_e=
xpr()`. It requires
> >> > +                // the provided expression to be verifiable at comp=
ile-time to avoid
> >> > +                // triggering a build error.
> >> > +                inner.emit_from_expr(&expr)
> >> > +            }
> >> > +            ValidTy::Primitive(ident) if ident =3D=3D "bool" =3D> {
> >> > +                ::quote::quote! { (#param as #repr_ty) =3D=3D 1 }
> >> > +            }
> >> > +            qualified @ ValidTy::Primitive(_) =3D> ::quote::quote! =
{ #param as #qualified },
> >> > +        };
> >> > +
> >> > +        ::quote::quote! {
> >> > +            #[automatically_derived]
> >> > +            impl ::core::convert::From<#enum_ident> for #input_ty {
> >> > +                fn from(#param: #enum_ident) -> #input_ty {
> >> > +                    #overflow_assertion
> >> > +
> >> > +                    #cast
> >> > +                }
> >> > +            }
> >> > +        }
> >> > +    }
> >> > +
> >> > +    fn emit_overflow_assert(
> >> > +        enum_ident: &Ident,
> >> > +        variants: &[Ident],
> >> > +        repr_ty: &syn::Path,
> >> > +        input_ty: &ValidTy,
> >> > +    ) -> TokenStream {
> >>
> >> I feel like we should track this via traits rather than using a const
> >> assert. That approach will require & generate much less code.
> >
> > Sorry, but could you elaborate? A small example of what you have in
> > mind would help a lot.
>
> Oh yeah sorry, I had something different in mind compared to what I'll
> describe now, but it achieves the same thing without introducing new
> traits:
>
> We have two options:
> 1) We use `<input_ty as TryFrom<repr_ty>>::try_from` instead of writing
>    the `fits` function ourself.
> 2) We require `input_ty: From<repr_ty>`.
>
> The first option would still check every variant and should behave the
> same as your current code.
>
> Option 2 allows us to avoid the const altogether, but requires us to
> choose the smallest integer as the representation (and if we want to be
> able to use both `i8` and `u8`, we can't). I missed this before, so
> using option 1 might be the only way to allow conversions of this kind.

AFAIK, `<input_ty as TryFrom<repr_ty>>::try_from` cannot be called in
const contexts without `#![feature(const_trait_impl, const_convert)]`.
I assume we want to keep this validation at compile-time? If so, we
might need to stick with the custom `fits` check for now. Please let me
know if I misunderstood you.

Best regards,
Jesung
