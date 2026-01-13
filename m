Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D0B38FF0B
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 13:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768311601; cv=none; b=WH+QAuf/7mAWaO376zMU41umySJpeI4Jn8iLkmFxC24tmQ+CpfI865ezH3p4Hyle+fldpw/YmT26mup13M/1clbdufiLH7advCJYovZTuDJ1E99KW58+dqPs5h1A6oQaMs76ih/BySv70Ucxm/52XXeBwOpvGD4Y4aaKcE4KomU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768311601; c=relaxed/simple;
	bh=sJaKdifgAFGA82cjY8q5w5U0qqo10CY35sODPovhRiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+xAOgl2O2QCks3RPijcvMsqixNfCfWcu/CGTtb/4oPWqrnlTzG4KCvv7GxFLJf0HXWyZQr+lf8z8nK3jU9Qiv/twM0/tVqgWLeJdB4zBlCGJT5FlXxMLZRnQc6DXxRYT7SWunbcaosOpRGiOoFAqCB4/Yp5Qndfdf5Cvldisks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qq2/IQJ2; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qq2/IQJ2"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b79451206so4770030e87.1
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 05:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768311597; x=1768916397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEXLbjYv9CTIEY/d0SVQ5SUx4yPb9Y/N7Jo9UoYuEQc=;
        b=Qq2/IQJ2NhIg4dlVMzzqOpzvY42+iKKpD6HP65ZnTJLTrBjUe3wCjfk982l1YcVLC3
         QWEJThyYELG315ZlfvPDMIUe9ljd8ekknMqa9SY11L2aps3gleQUQy2oEADGWiW4a14o
         TwUboZy0xV8iVjAY5SFuUFXwoaGFdhHPsWSgQZOg9zjV0h6AJkENnH23IzwdTkKvLzal
         lNVNlcOTHBMLC3yQPxyweIIZZuEG51xV5KLiljhGrVkWVkfEP7KZCx5cwWsjn4XoxFiJ
         lcvKaPbY9qaZID3ajgOjUS7haoskqoqXQb7TXAUozXVzjMkugXY9fb54gefng9VypRSc
         fEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768311597; x=1768916397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DEXLbjYv9CTIEY/d0SVQ5SUx4yPb9Y/N7Jo9UoYuEQc=;
        b=UBagayeAxmMRnHfPishC407VodxqJ2U1vSsT77Mm+O2QKrk5mCV8fzDBRutUBP16vZ
         Gzs/hd08pc9nS1hRKRpiVChEHrfqzevSVnKif9VT8ODMeXT5WAgOOGbuIKDpBG3nJ19x
         88RbFnnbNiTGDydhQrGaXpU3Lm+3h2LKZRmZzWekFUDxGLhOUiI9/Iav+EyfbnyRCD0w
         qjjMg/Ys2IT2Rb5eXuf88VXvUr9tWDdBs5/+8/dyPRT17GgffIDK0ToFpFaLkW/zHLyE
         rfWnG1XFUX+1hYI7xck2qDh72Gsu0a3zb20nIFeDtZVc/3/7EAEDx8QRXUAD4whyhiHd
         pYFA==
X-Forwarded-Encrypted: i=1; AJvYcCWJaLmkANmT+dIEqmOtT9vMCF401JfvmByzmbk7MsbXHzVw+SrmuWpiGyV9NvkZLvVSJCS6Anc5R0Jk99PSLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSKf5ZSycE6/gUp4u6rRxnobAdDGL0EPUdoa/DOlJC17VStctc
	lCJdcRnmxG56CrvPh1zezDQnw1iXAhQEIqFoQ4M0kRj60UtuGl/eXRWXL+dHmrfbDE2c8hg8o7T
	UDzRFNTXB0x01E7OFTAmyvSTkZEQXPtg=
X-Gm-Gg: AY/fxX55/vdf8w3oDdsFjYIZ5Z6NtQjR820Cyx+wceo6nFhEb0kvlJX8pKlrzhv75N4
	2IUjPT08Ig+XNEaybZAJvPj4WD7Z/Lg5+giSUxZ4bYF0H+kRRPBOWKGzGLFpIx/n1N5vAwZTP4f
	PShs/S/hHKj5lNLZBbmuStmG1XZrWv91IossSgFZNhWErsu4E7X7mNspV2AvJCEUUU/ymitv54N
	svhqbKneoyD3VhJjdL9sZFby/sbcyXrD6Q/bExblBHY0hPtZUZIQt7IOUBOu8XLRy1NQpftJrHj
	dfk36DU4yO2jDUPUuC/T7oF/5993qqCVx/VAVlohg6pIwBeTikre/8HwBO+ySg8S6gRmjuwOXtO
	/w2O21Qkx
X-Google-Smtp-Source: AGHT+IFcd6Za+HkbWaa9ee/udnfx6ORPUSpiHfBNooi2Sfrr5Z3OtPY2lntMOA29DsAE+rWjIzfD5QWnD/u/4Lrf104=
X-Received: by 2002:a05:651c:552:b0:37b:b4b0:a4be with SMTP id
 38308e7fff4ca-382ff70887fmr55557081fa.24.1768311596617; Tue, 13 Jan 2026
 05:39:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ-ks9=UwOz=-NR0MJ3pjKZNGjb7+3R-shFqYKQF206s5Tp6ew@mail.gmail.com>
 <20260113131138.2155899-1-gary@kernel.org>
In-Reply-To: <20260113131138.2155899-1-gary@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 13 Jan 2026 08:39:20 -0500
X-Gm-Features: AZwV_QjgpOS7_2EePOM9JtYSiUHx_xITLvaM-mYL4iyJt0l0mvDFWWBT97AnnZU
Message-ID: <CAJ-ks9m4bCoQbrHeO14wXdFyMhkWf=SRzqkxY=gk9tpB594cCQ@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: support `#[cfg]` properly in `#[vtable]` macro.
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 8:11=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Currently, we generate `HAS_` constants as long as the definition exists =
in
> the source, regardless if it is cfg-ed out or not.
>
> Currently, uses of `#[cfg]` present in both trait and impl, so it is not =
a
> problem; however if only the impl side uses `#[cfg]` then `HAS_` constant=
s
> will incorrectly be true while it shouldnt't.
>
> With `syn` support, we can now implement `#[cfg]` handling properly by
> propagating the `#[cfg]` attributes to the constants.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/macros/helpers.rs |  6 ++++++
>  rust/macros/vtable.rs  | 13 ++++---------
>  2 files changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
> index adfa60d8f42d8..11117b4c95d25 100644
> --- a/rust/macros/helpers.rs
> +++ b/rust/macros/helpers.rs
> @@ -7,6 +7,7 @@
>          Parse,
>          ParseStream, //
>      },
> +    Attribute,
>      Error,
>      LitStr,
>      Result, //
> @@ -53,3 +54,8 @@ pub(crate) fn file() -> String {
>          proc_macro::Span::call_site().file()
>      }
>  }
> +
> +/// Obtain all `#[cfg]` attributes.
> +pub(crate) fn gather_cfg_attrs(attr: &[Attribute]) -> impl Iterator<Item=
 =3D Attribute> + '_ {
> +    attr.iter().filter(|a| a.path().is_ident("cfg")).cloned()
> +}

There's also no need to clone; `ToTokens::to_tokens` takes `&self`.

https://docs.rs/quote/latest/quote/trait.ToTokens.html#tymethod.to_tokens

> diff --git a/rust/macros/vtable.rs b/rust/macros/vtable.rs
> index 72ae0a1816a04..c6510b0c4ea1d 100644
> --- a/rust/macros/vtable.rs
> +++ b/rust/macros/vtable.rs
> @@ -23,7 +23,6 @@
>
>  fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
>      let mut gen_items =3D Vec::new();
> -    let mut gen_consts =3D HashSet::new();
>
>      gen_items.push(parse_quote! {
>           /// A marker to prevent implementors from forgetting to use [`#=
[vtable]`](vtable)
> @@ -38,22 +37,17 @@ fn handle_trait(mut item: ItemTrait) -> Result<ItemTr=
ait> {
>                  &format!("HAS_{}", name.to_string().to_uppercase()),
>                  name.span(),
>              );
> -            // Skip if it's declared already -- this can happen if `#[cf=
g]` is used to selectively
> -            // define functions.
> -            // FIXME: `#[cfg]` should be copied and propagated to the ge=
nerated consts.
> -            if gen_consts.contains(&gen_const_name) {
> -                continue;
> -            }
>
>              // We don't know on the implementation-site whether a method=
 is required or provided
>              // so we have to generate a const for all methods.
> +            let cfg_attrs =3D crate::helpers::gather_cfg_attrs(&fn_item.=
attrs);
>              let comment =3D
>                  format!("Indicates if the `{name}` method is overridden =
by the implementor.");
>              gen_items.push(parse_quote! {
> +                #(#cfg_attrs)*
>                  #[doc =3D #comment]
>                  const #gen_const_name: bool =3D false;
>              });
> -            gen_consts.insert(gen_const_name);
>          }
>      }
>
> @@ -87,10 +81,11 @@ fn handle_impl(mut item: ItemImpl) -> Result<ItemImpl=
> {
>              if defined_consts.contains(&gen_const_name) {
>                  continue;
>              }
> +            let cfg_attrs =3D crate::helpers::gather_cfg_attrs(&fn_item.=
attrs);
>              gen_items.push(parse_quote! {
> +                #(#cfg_attrs)*
>                  const #gen_const_name: bool =3D true;
>              });
> -            defined_consts.insert(gen_const_name);
>          }
>      }
>
>
> base-commit: 761e1fbc67b122bfe3d58518a9ea9ee668962c92
> --
> 2.51.2
>
