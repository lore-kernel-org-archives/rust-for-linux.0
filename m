Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553CA4A35
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 17:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765994255; cv=pass; b=Xhe2Pi/JHhKk65snGVIfQaF3DdeNp82zorhaa75JX0HCf66WFuR0Y7hfAwmV/A/V/HOmRGsxxe/cmejxmqdo8HTBInsmjUNxfB7of3xi04WMgj5ALCXz8m3oQvE9wq0VlBQKsJyvyS9ZpDVfx21njxaPGcJyLpzOqgGk7qlgxHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765994255; c=relaxed/simple;
	bh=7iO/YQORAVbqIeqZff3lGiE9kq4FBp+krxRlHPCTxy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDeJqv9M1S9RW8jvJD1U/dFpG2sQvUChFmUZ34xLsP4WnVzvS8+I6G3Sqrs9riS9lJ/9r4f9KRV1KD5PnXQXZFpzVbX4Ys4BilxZNFmlKw62WmRJik0LtuaDrMDR4esSgLhG7Dj4o4ojIhUSTyAekdVMhYnEx+A1n1IgdnNAddc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zdpe3FjE; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zdpe3FjE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-644fbd758b3so386a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 09:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765994252; cv=none;
        d=google.com; s=arc-20240605;
        b=bNq0LTZMt0aI7r7UsAsd77t90s6EOHKvy4yq+t+asAq87Y8ZHBnaTzmT90SE6P3qpc
         HP8X8r0W3dqn+7PPP/nxJ2aeRsEoJt+pOZ5W1AoGWvXon6t59gBQd5w6gfsCB/bKnRNw
         l43eUePleXhTMqsAKTkoGipnXg3O5JJwJozKlu3Kiay+iV6DGF1CD6imDEYvVICLPhs1
         UmBd3kwhBw+Pv9J+yigmbcG9LdPGzApSUC6I3vpCHbBp94lbXsydutAHAwa9DaUEBqZx
         QeXwt7PRWnfMtNScdX0dyyYKwCKbAAhgIc7cqLIWssVjGky4uyPBWI7eF/ENvZWZn7zH
         brpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bACc9z4fBhInHCW/d22cS3HbXEGwsoCGD6yWshQZ970=;
        fh=s04xKGdVoDlpJJJP2msyC/gzboIuR9I3TCty5MAen3Y=;
        b=JLCd+Y7w9oFZUIL5GoIXC4eXKwrxspYHyGpr6Kf6Kxm6JBnrDKpQjNYFsQmXx4DRBW
         HzpYVA93o2CZcQdSbsX76x4yniBdWCA4QCCJb0m/5fpWrcsGz7qpbCVgq3doZH48Ftu3
         WIUERS0Umy140DboHvHx1Mg+n4RbjEphAPpZJpXyMdTP1hP1TCkLfFV2ZFE/OEuvlaa1
         JVBsdIOOJO0kw6Mbl2cnreQFgam5FRMyOwODoSIbiPKFDriFX2oaxU5Zb5yAK3ftPH/q
         qU5pTRJ1jrBqT8UqswyYUCw9O7EMlHY/JdYDk+nmnuhDdxjc5zeH1+RIqIX9Q0XR/cz+
         oczA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765994252; x=1766599052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bACc9z4fBhInHCW/d22cS3HbXEGwsoCGD6yWshQZ970=;
        b=zdpe3FjEIovwqdVjbtn55TWs09loehKTvjL8h/C1TFwAkGzHqbVMKU9gj7EhG8xE69
         h9cJDYLRHdxAd4WJ8MVuIHyCEch9IMpvSfaffOywLgtMNjXq8xSEPE10fDXHvgkTXXBs
         0jfQVtCUvZTMWIJt5Kl/7d1mv1Wigb6JVmMOks+t7H0zFtEKE7iF/pOMu24zQmM0OBR5
         yndFk7W43bRdohcCf4jSDiqyLVTZnVFcnln7SBxTkwX2Z5S8WDMjb2WlW5xPGjO+WK0M
         U8/Ds5orwBUHyJGoFyndUazWvbbY7HaJoZb+3Yy2DNmsyQyEkHcRzXVv4P2y50S0iSy1
         osRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765994252; x=1766599052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bACc9z4fBhInHCW/d22cS3HbXEGwsoCGD6yWshQZ970=;
        b=xFFmrm72yyAIaZCGZJ8zcZqGzLkuHSMDdUk0dTMB8bN/7vgXOHiUq5Dunr4YW8RQp4
         4EeEQecY/BsEZjnFmPWili0pqOmvYb10dk9oDCOhxr6QLHyTFdDHhbmtYMkXaK+7MHEX
         Rbcr1XxiZuECDYcjjDgocrXvoAdYPrdPHIZVMFKq+eXsd6k4meJqruZpDyVVlm2EMszi
         cABEv/SVoJCh5uXoetp4fa8BQz/a7GzIGQ8RHdzA8IX/C3cz+4ZtWAAuHQk+JhUc0Kpk
         65t5vHZCuP0J2ZQsAnZRZjpWZrOU4sEW4UtY5H1XUHsfxxMeZzaJ1O9J2lT6Ns0oOxGg
         w9Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWOkvmisx7yRRUGrit1NPzgbLL9E2nCQPOKy/M951HZPcbyMJK9uNeByh7K0ksFRmZSUn65I/xaVWq4tqTqwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHTFkuTbv0ErEUoBrGoGu/td5aBaebh4wRl2HM3Zlzbf5QDyFB
	UFzNaWbu5ptM4C6mCOQ9JvaS7Na5ZiQuK8XEU4mUrb1Um3B3/QeXqcuc5AqrckNJt6TUBu3jSRx
	WxhFiVUzIlr6sBjUZL6NSqk+ExwkymI1HcAXQXCDO
X-Gm-Gg: AY/fxX5dvIYuxcYG9ZbptHUDp6xbzUeKed4IKU0f8NwA0p7KT8pGFCSgCic820n8jcW
	+SUybfai5rcamoUDKeFWUcezAnpRnFHL6DFRZoxrKVCkNpCdX+h/Kku8CKRN5hQKeud5mYJ52lI
	aYMuC03pySJIQCLNSqykFkboVXJjZkONxRVzQlKm/OI1RlSGFgG67ebOWxtma388Oi5z5uO0cmS
	mOU/Mwgr6mN2OVnrcdZehXkP4z7dZdLsIFGPy/n53ryDrtOPXZAeFO+Jw4XUf7aJ2/wn1jZp8qj
	mr6mmRGCtC574NMcz9CSHbIJVw==
X-Google-Smtp-Source: AGHT+IGkQJL7o0D68D0k8Iu4688TMLuz2bYKsHTW0n2lvh2DZ1DaDX9xwH681mRCuaeNEyHZMniDapGdQwAEnjcjT34=
X-Received: by 2002:aa7:c35a:0:b0:645:21c1:97e1 with SMTP id
 4fb4d7f45d1cf-64b4010a85amr56224a12.18.1765994251272; Wed, 17 Dec 2025
 09:57:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
 <20251216-transmute-v2-2-b23e5277ad02@google.com> <E3281FEE-EE5E-4594-9B0E-E9350BA2136D@collabora.com>
In-Reply-To: <E3281FEE-EE5E-4594-9B0E-E9350BA2136D@collabora.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 17 Dec 2025 09:57:19 -0800
X-Gm-Features: AQt7F2o1bcoW8tXvD0tPYwQIhIleglk_xtke4SUDhlheJsIMhbyDzF0FkZWnG-k
Message-ID: <CAGSQo02RH+-vK28O9HYkJHK5ymv0Pw=b0MhkJg5hkLdbLGJmmA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: Add support for deriving `AsBytes` and `FromBytes`
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 9:36=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Matthew,
>
> > On 15 Dec 2025, at 21:44, Matthew Maurer <mmaurer@google.com> wrote:
> >
> > This provides a derive macro for `AsBytes` and `FromBytes` for structs
> > only. For both, it checks the respective trait on every underlying
> > field. For `AsBytes`, it emits a const-time padding check that will fai=
l
> > the compilation if derived on a type with padding.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> > rust/macros/lib.rs       | 63 +++++++++++++++++++++++++++++++++++++++++=
+++++++
> > rust/macros/transmute.rs | 58 +++++++++++++++++++++++++++++++++++++++++=
+++
> > 2 files changed, 121 insertions(+)
> >
> > diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> > index b38002151871a33f6b4efea70be2deb6ddad38e2..d66397942529f67697f74a9=
08e257cacc4201d84 100644
> > --- a/rust/macros/lib.rs
> > +++ b/rust/macros/lib.rs
> > @@ -20,9 +20,14 @@
> > mod kunit;
> > mod module;
> > mod paste;
> > +mod transmute;
> > mod vtable;
> >
> > use proc_macro::TokenStream;
> > +use syn::{
> > +    parse_macro_input,
> > +    DeriveInput, //
> > +};
> >
> > /// Declares a kernel module.
> > ///
> > @@ -475,3 +480,61 @@ pub fn paste(input: TokenStream) -> TokenStream {
> > pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
> >     kunit::kunit_tests(attr, ts)
> > }
> > +
> > +/// Implements `FromBytes` for a struct.
> > +///
> > +/// It will fail compilation if the struct you are deriving on cannot =
be determined to implement
> > +/// `FromBytes` safely. It may still fail for some types which would b=
e safe to implement
> > +/// `FromBytes` for, in which case you will need to write the implemen=
tation and justification
> > +/// yourself.
> > +///
> > +/// Main reasons your type may be rejected:
> > +/// * Not a `struct`
> > +/// * One of the fields is not `FromBytes`
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// #[derive(FromBytes)]
> > +/// #[repr(C)]
> > +/// struct Foo {
> > +///   x: u32,
> > +///   y: u16,
> > +///   z: u16,
> > +/// }
> > +/// ```
> > +#[proc_macro_derive(FromBytes)]
> > +pub fn derive_from_bytes(tokens: TokenStream) -> TokenStream {
> > +    let input =3D parse_macro_input!(tokens as DeriveInput);
> > +    transmute::from_bytes(input).into()
> > +}
> > +
> > +/// Implements `AsBytes` for a struct.
> > +///
> > +/// It will fail compilation if the struct you are deriving on cannot =
be determined to implement
> > +/// `AsBytes` safely. It may still fail for some structures which woul=
d be safe to implement
> > +/// `AsBytes`, in which case you will need to write the implementation=
 and justification
> > +/// yourself.
> > +///
> > +/// Main reasons your type may be rejected:
> > +/// * Not a `struct`
> > +/// * One of the fields is not `AsBytes`
> > +/// * Your struct has generic parameters
> > +/// * There is padding somewhere in your struct
>
> Why is padding relevant here but not in FromBytes?

Padding bytes can be initialized to any value, but it is UB to observe
their contents because they may be implicitly uninitialized[1]. This
also matches the approach of `zerocopy`[2], which is the standard for
these sorts of transmutations outside the kernel - any byte can go
into the padding, but you cannot *read* any byte out of the padding.

[1]: https://doc.rust-lang.org/reference/behavior-considered-undefined.html=
#r-undefined.validity.undef
[2]: https://docs.rs/zerocopy/latest/zerocopy/trait.FromBytes.html#warning-=
padding-bytes

>
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// #[derive(AsBytes)]
> > +/// #[repr(C)]
> > +/// struct Foo {
> > +///   x: u32,
> > +///   y: u16,
> > +///   z: u16,
> > +/// }
> > +/// ```
> > +#[proc_macro_derive(AsBytes)]
> > +pub fn derive_as_bytes(tokens: TokenStream) -> TokenStream {
> > +    let input =3D parse_macro_input!(tokens as DeriveInput);
> > +    transmute::as_bytes(input).into()
> > +}
> > diff --git a/rust/macros/transmute.rs b/rust/macros/transmute.rs
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..43cf36a1334f1fed23c0e77=
7026392f987f78d8d
> > --- /dev/null
> > +++ b/rust/macros/transmute.rs
> > @@ -0,0 +1,58 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +use proc_macro2::TokenStream;
> > +use syn::{parse_quote, DeriveInput, Fields, Ident, ItemConst, Path, Wh=
ereClause};
> > +
> > +fn all_fields_impl(fields: &Fields, trait_: &Path) -> WhereClause {
> > +    let tys =3D fields.iter().map(|field| &field.ty);
> > +    parse_quote! {
> > +        where #(for<'a> #tys: #trait_),*
>
> Why do we need this hrtb here?

It's a workaround to avoid needing `#![feature(trivial_bounds)]`.
Without it, generated code for, say, `where *const T: FromBytes` will
immediately cause a compilation error. With it, it will simply cause
the trait's requirements to be unfulfilled.

>
> > +    }
> > +}
> > +
> > +fn struct_padding_check(fields: &Fields, name: &Ident) -> ItemConst {
> > +    let tys =3D fields.iter().map(|field| &field.ty);
> > +    parse_quote! {
> > +        const _: () =3D {
> > +            assert!(#(core::mem::size_of::<#tys>())+* =3D=3D core::mem=
::size_of::<#name>());
> > +        };
> > +    }
> > +}
> > +
> > +pub(crate) fn as_bytes(input: DeriveInput) -> TokenStream {
> > +    if !input.generics.params.is_empty() {
> > +        return quote::quote! { compile_error!("#[derive(AsBytes)] does=
 not support generics") };
> > +    }
> > +    let syn::Data::Struct(ref ds) =3D &input.data else {
> > +        return quote::quote! { compile_error!("#[derive(AsBytes)] only=
 supports structs") };
> > +    };
> > +    let name =3D input.ident;
> > +    let trait_ =3D parse_quote! { ::kernel::transmute::AsBytes };
> > +    let where_clause =3D all_fields_impl(&ds.fields, &trait_);
> > +    let padding_check =3D struct_padding_check(&ds.fields, &name);
> > +    quote::quote! {
> > +        #padding_check
> > +        // SAFETY: #name has no padding and all of its fields implemen=
t `AsBytes`
> > +        unsafe impl #trait_ for #name #where_clause {}
> > +    }
>
> In general I=E2=80=99d add blanks.

I'm not sure what you're suggesting here.

>
> > +}
> > +
> > +pub(crate) fn from_bytes(input: DeriveInput) -> TokenStream {
> > +    let syn::Data::Struct(ref ds) =3D &input.data else {
> > +        return quote::quote! { compile_error!("#[derive(FromBytes)] on=
ly supports structs") };
> > +    };
> > +    let (impl_generics, ty_generics, base_where_clause) =3D input.gene=
rics.split_for_impl();
> > +    let name =3D input.ident;
> > +    let trait_ =3D parse_quote! { ::kernel::transmute::FromBytes };
> > +    let mut where_clause =3D all_fields_impl(&ds.fields, &trait_);
> > +    if let Some(base_clause) =3D base_where_clause {
> > +        where_clause
> > +            .predicates
> > +            .extend(base_clause.predicates.clone())
> > +    };
> > +    quote::quote! {
> > +        // SAFETY: All fields of #name implement `FromBytes` and it is=
 a struct, so there is no
> > +        // implicit discriminator.
> > +        unsafe impl #impl_generics #trait_ for #name #ty_generics #whe=
re_clause {}
> > +    }
> > +}
> >
> > --
> > 2.52.0.305.g3fc767764a-goog
> >
> >
>
> Overall looks good. Please chime in on the two questions above.
>
> =E2=80=94 Daniel
>
