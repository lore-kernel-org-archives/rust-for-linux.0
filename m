Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BAC2DB781
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767885063; cv=none; b=qB8l+t2GDTTBxRpNEBgucbgq2ctk6dpA24SaD/W0hFWw9XLVDW7kWrK7Q3hICF7f1ENNkuF+hMXAvN9HY8EhIiu/GWw6vRphjUUys46b9GeSUgpgke6hyPK9j3P28AS0svqDZaBWLfd1u2tsUe3k5ch9klJb/ZyDaDzocyK6noY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767885063; c=relaxed/simple;
	bh=XqxsxRMhR0XxyPzQwRQbixcTNh2KM6o98F4WqQCK1+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCGhqy0punn+JxkcfJtyqv0zq+Bwkk6xemo4SuyfSPFaMV82unVKprGlDtf+MXEns9LRMpe0Xyr3ANBfivLLvI4gQhFUhwA+bUxVfJSnH9G8nDZgoff7MzpyFK72I25edY58+Y/LR42TFi2mL0LoyS4IPLQLY+UaaSN/jikYV8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KH47y/ZG; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KH47y/ZG"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-382f087e6c9so14553251fa.0
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767885060; x=1768489860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqcWiJbImDzgNca7o3j5sP0z9TyzNxbDydl/krMoTrM=;
        b=KH47y/ZGOi3eys9g3HIasRZFpwMttfoCP071J7VhYy2ybavUeT0pETxqd6jynh7H7t
         MC29evZIsUvc9sBy2qHOg1ttwxz9Pq1KTyjsQQmeT0AS43u8f5erbiI+RFWbYXO5WQOp
         VN/85XD6lFqyQ7E83yAPHHVUZq/aapklwCN86sWI9Lt/m7rp7xYfUCpKOnLXDM3IGDhB
         sHn0I3mP+3hTdzzuzJCz/N0tswo9LCsYjgR51W2D0aG1RHGba6c82SU4hv+9jAnUVPR7
         qmHJ2yfXxSnv1XBVDQ1C5t0qZsSd77aBnHFUE6yu2ndJgwLqoeXCJkLMEd5Y3GNvWv0e
         TXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767885060; x=1768489860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WqcWiJbImDzgNca7o3j5sP0z9TyzNxbDydl/krMoTrM=;
        b=pDpu2JF7HbmIlnnaWN6+87wh5CuQY7UyDAOp9HvxCUjATb5hk6RGAyshBdzSBIKQKS
         xfKkxigiOwc+zfXamkJ6rxxw7hhPVZs2ZbuQKaCAGgNpjjx1gD1nZQkn3KWFInn6LvH6
         ZdOY0Lq/BLibp/F1h1y/4j6YXWxFHA+NP8ExslYXDJkU01QTny24BRt7MSdjvaXxU+pj
         FJDBYOUfWepBFGjeFweQ4Qba9HjrpRgUQHF15wwbAWUG/6Xgv28au/mVPAX9G+wNhcpM
         Y+Pc10QZeItWCJCHOZHlp/EaqXYIqbbPTyP9pWko3ZN5UZ1ROcgp87uqe+hpyrXHc1AU
         B5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUimnz/mEHr+sdu8dL2TDtOB6wwvN8/XrKrhtPzupW0+ioKR1pqT3h7FjLH71HBmdizVIa9/0l13YFq/c+1jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/kahnEw/Ncwv5Vqb98SfpW6q3J+KdLEDRNYARZBiJKhOrrBqz
	Jp63S3QXzWPyMupklY4N/HjD4PuWrMI2yXR89I04kMJfp5LbM9Ew/U+pfABXaGPRcYgN+RDnvgH
	lvhr8bT1HX/lCYS5ODV6MPfKh+hLsqZA=
X-Gm-Gg: AY/fxX6dT+FSpCG3pk1G/3ceBWOvJRPZ7iSHEd73Tc/lNWqN7p+SL7wdeOlzS1pLWlo
	ab7fylQXmmb5N90Anr2tgDN4BmVt71sBgABQlI1nsl9bD4bPMOhfYwvs7EuahgPDbqlakN/839J
	c5WEHqTUJvqTMsgV/6lymxC5LrAINPnrvkz0c3gy0el7iZVKyzLvtG1qnsEvY5xj2a+3PLnsjEc
	p+UHMVX5ig3CPGEcHrjaoKb5FsfLu9gRIpRB0UUhQvX4lGeqRWnWvrn6H/OfiFvNZmXCh38Z63A
	mLxPDDT7TFow05RX/aJYXRQoThUuZV7S8yirRI7rP1nZ5vg+POoscszf7NujifGZhf+2y+4NjvD
	w8yVnsg==
X-Google-Smtp-Source: AGHT+IEJVy9TtnqMRt/ZDw7RE8bOHuFRrAC78A1LbngH4+nTSuCrWRqho7FYxG/wpatCSdkTvuyR80unRCWRKC4ft2U=
X-Received: by 2002:a05:651c:2104:b0:383:1565:628f with SMTP id
 38308e7fff4ca-38315656874mr5254081fa.16.1767885059926; Thu, 08 Jan 2026
 07:10:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107161729.3855851-1-gary@kernel.org> <20260107161729.3855851-4-gary@kernel.org>
 <CAJ-ks9nbPTQojM-QcHPKv+NdUHwaRbBRVqzJ3CwgQTJTuD=bRQ@mail.gmail.com> <20260108124137.22c32313.gary@garyguo.net>
In-Reply-To: <20260108124137.22c32313.gary@garyguo.net>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 8 Jan 2026 10:10:23 -0500
X-Gm-Features: AQt7F2ok02EU4dNNpsKENHmmhtY4NEieXFoVU9xZYTKyzGaJlzYm7NdEOnboXlo
Message-ID: <CAJ-ks9=N+1YU6jBn6KcGWXHhggimuWRKDb9rM=0TwtST6s8dUA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] rust: macros: convert `#[vtable]` macro to use `syn`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 7:41=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Wed, 7 Jan 2026 11:48:28 -0500
> Tamir Duberstein <tamird@gmail.com> wrote:
>
> > On Wed, Jan 7, 2026 at 11:30=E2=80=AFAM Gary Guo <gary@kernel.org> wrot=
e:
> > >
> > > From: Gary Guo <gary@garyguo.net>
> > >
> > > `#[vtable]` is converted to use syn. This is more robust than the
> > > previous heuristic-based searching of defined methods and functions.
> > >
> > > When doing so, the trait and impl are split into two code paths as th=
e
> > > types are distinct when parsed by `syn`.
> > >
> > > Signed-off-by: Gary Guo <gary@garyguo.net>
> >
> > Reviewed-by: Tamir Duberstein <tamird@gmail.com>
> >
> > > ---
> > >  rust/macros/lib.rs    |   9 ++-
> > >  rust/macros/vtable.rs | 163 ++++++++++++++++++++++------------------=
--
> > >  2 files changed, 93 insertions(+), 79 deletions(-)
> > >
> > > diff --git a/rust/macros/vtable.rs b/rust/macros/vtable.rs
> > > index a67d1cc81a2d3..a39bedb703973 100644
> > > --- a/rust/macros/vtable.rs
> > > +++ b/rust/macros/vtable.rs
> > > @@ -1,97 +1,106 @@
> > >  // SPDX-License-Identifier: GPL-2.0
> > >
> > >  use std::collections::HashSet;
> > > -use std::fmt::Write;
> > >
> > > -use proc_macro2::{Delimiter, Group, TokenStream, TokenTree};
> > > +use proc_macro2::{
> > > +    Ident,
> > > +    TokenStream, //
> > > +};
> > > +use quote::ToTokens;
> > > +use syn::{
> > > +    parse_quote,
> > > +    Error,
> > > +    ImplItem,
> > > +    Item,
> > > +    ItemImpl,
> > > +    ItemTrait,
> > > +    Result,
> > > +    TraitItem, //
> > > +};
> > >
> > > -pub(crate) fn vtable(_attr: TokenStream, ts: TokenStream) -> TokenSt=
ream {
> > > -    let mut tokens: Vec<_> =3D ts.into_iter().collect();
> > > +fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
> > > +    let mut functions =3D Vec::new();
> >
> > Would be easier to propagate `#[cfg]`(as in your FIXME below) if you
> > collect the generated constants into this vector instead -- then you
> > can do all the code generation in the `for item in &item.items` loop
> > where you have all the attributes.
>
> This is a very good suggestion. I tried it out and the code is much
> cleaner. After making the change the `#[cfg]` change is just a few lines
> too -- I'll include the cfg change in a new commit in the next version.

Great.

> >
> > > +    for item in &item.items {
> > > +        if let TraitItem::Fn(fn_item) =3D item {
> > > +            functions.push(fn_item.sig.ident.clone());
> > > +        }
> > > +    }
> > > +
> > > +    item.items.push(parse_quote! {
> > > +         /// A marker to prevent implementors from forgetting to use=
 [`#[vtable]`](vtable)
> > > +         /// attribute when implementing this trait.
> > > +         const USE_VTABLE_ATTR: ();
> > > +    });
> > >
> > > -    // Scan for the `trait` or `impl` keyword.
> > > -    let is_trait =3D tokens
> > > -        .iter()
> > > -        .find_map(|token| match token {
> > > -            TokenTree::Ident(ident) =3D> match ident.to_string().as_=
str() {
> > > -                "trait" =3D> Some(true),
> > > -                "impl" =3D> Some(false),
> > > -                _ =3D> None,
> > > -            },
> > > -            _ =3D> None,
> > > -        })
> > > -        .expect("#[vtable] attribute should only be applied to trait=
 or impl block");
> > > +    let mut consts =3D HashSet::new();
> > > +    for name in functions {
> > > +        let gen_const_name =3D Ident::new(
> > > +            &format!("HAS_{}", name.to_string().to_uppercase()),
> > > +            name.span(),
> > > +        );
> > > +        // Skip if it's declared already -- this can happen if `#[cf=
g]` is used to selectively
> > > +        // define functions.
> > > +        // FIXME: `#[cfg]` should be copied and propagated to the ge=
nerated consts.
> > > +        if consts.contains(&gen_const_name) {
> > > +            continue;
> > > +        }
> > > +        // We don't know on the implementation-site whether a method=
 is required or provided
> > > +        // so we have to generate a const for all methods.
> > > +        let comment =3D format!("Indicates if the `{name}` method is=
 overridden by the implementor.");
> >
> > We're already quasi-quoting below, does putting the comment there work?
>
> The comment has `{name}` interpolation and you cannot just use `quote!`
> for it.
>
> You could do
>
>         #[doc =3D concat!("...", stringify!(...), "...")]
>
> But I think it's cleaner to just use `format!`.

Ack, though I think it would be:

#[doc =3D concat!("Indicates if the `", #name, "` method is overridden
by the implementor.")]

i.e. no need for `stringify`.

>
> >
> > > +        item.items.push(parse_quote! {
> > > +            #[doc =3D #comment]
> > > +            const #gen_const_name: bool =3D false;
> > > +        });
> > > +        consts.insert(gen_const_name);
> > > +    }
