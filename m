Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C772749C9
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 22:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767567405; cv=none; b=cvoQQdBqd47oq8bSYtqxHNUsbMu8xf8wMny2yfV+THmc7gyvYNQmAzv5vcu6DJUQi9dBXutBQVWy7gDNlTgVa7HDTD/BkiCkAwQpB1vGyG8nsrEbgiZeq99bx6twmYkWG/v6ctQNxyIFbQytO55+Bl1E2hGtFRK2IiM3grwiai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767567405; c=relaxed/simple;
	bh=1X5tsSDyY7tnZp4214YsJIAY5eXiEB1Wj9Q1/lxLMjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ea0U/C7h3/7Lm7R/YW/MmUajySd9rCP/+VJJygPyiHbywhktQX60fPw1NBj1WmUYUAj0JY7t292d/1ig2jU99qFa8WeNBfEBfLM2M7navBJL+uzWILptQ+7EOXzNEJMyL/44feb6eQbUxIRl30GsqEixd2jy/neDUsiNmz5ST1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNgHR8/t; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNgHR8/t"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5943b62c47dso12743098e87.1
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 14:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767567401; x=1768172201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaIUB0TAZcVvtAzueYPlmTD4Ia9cdz6RJBHpeS/Qllc=;
        b=gNgHR8/tQZB180fKujSr87E4Qk44qhybWCjlxQVpoBn+c5h2V/avbB3R0PhtTtR0ce
         thwhmVhqB03b02LlQR3h3Tn73xwiXRU++RgqZQ+T+riVMOUXZNFZ/F1vrEWpkRjYD2fW
         GqJSr0wW+y2WG7W0dCMSy3eiUS83mIEvQ2L3fGOZztgVSM4It9wQho0o3cgNgrYJygTI
         1ZsOvqfdf4yG1RLfnc/RZqk9Z3zRwDLsGuEAHsVgwgzeTpTmK91geENHBuo/ZvbEhIbe
         7XyGeCatUKEtsZ6B6K9Hwp4bKMfhyNu56ynUqDkKi/bajL0lEk+5yluoEZ9a0DmjRwkm
         WsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567401; x=1768172201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OaIUB0TAZcVvtAzueYPlmTD4Ia9cdz6RJBHpeS/Qllc=;
        b=Ob2hsYClI12xZNOiPxMw1xG4XU5QAaioGnBBKmMJ5mZHRK7LR9UL0UwR58amghMEzV
         yy2JqLKPZecc4j0s+KUqsjEO85YApdYnSlB1XhoBNn3NKXuJcHBz1KtqjZEGdw8DLQan
         3yeYbRNjIzTdFz2YKYmMjSFbnaK3ZMHRSGWqrCD8aLbfYKnp91A46B73dLsPAb5qxmhW
         w7Q8gvN25+8YPo5QRxKIndmV4Q3wEDW+P0BDy0BnmEVEx9B7zmIxw0VlIDvXoqzwSilm
         ZRaB1AGlft5bpC/XAxsqY4GudGG/dIB1/dKl/lGs4YD3F5iuiFxBPSLiNvukjW4lziVn
         YhCA==
X-Forwarded-Encrypted: i=1; AJvYcCVutIF7rhoBvBt/J+9KkZnNkZ/da88tPQIhgTXAB4Mzx/FflNKv80JYu8rMs2A9YXQmd5UKUWoNjAmr4Cgtcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQgyAvMnmtfGhNE1qe177fO+4JsMjOy6ou9JSMvRdQqNbsAAqO
	J/FSSvRRpW+ePejs5XZ04xaOVxLYw5Xg6jkjxBxAUa/LHnR6UhOx3X06b2bm80b+w/tBSrcg4s8
	XEWJRHD6WdynQ7de1nGkAf9xlycmCF8w=
X-Gm-Gg: AY/fxX6LvGrHIVvPGYKhwLRKQlQLeXlP34bzRtOrSNk9dZytcUpqBotn9Hzin4Q67Ys
	CGseWVaf6Ma0cBSfSzhqNSTX+zFaQl8Lpn8BRFiwOCzxOWJtw2VqxOxJdd8gvc8bmQaeubJRL+L
	mpaQ+vwUd5ihtBQWU6PFjn3a8DEiFvNNXxozZMYgZVJ98Ap++vJicZS0hrvZpBdqW5mwsE+OQN7
	0ZunBjhCjb1ZHNs7aqXKRgkTaEnjmOIlllasotPM4sTXM8qPJBnSIqcjuVnfpzRXnk19ch2RtKS
	24RWrONKObnr+ef/8HX/GAV7WARiKjJBuZiBT4PY47pAAMmJkrHfOub8eaZFOvcdC9P/3HrBqGP
	XdPuJwgcwToM1mdDxL6MW9ZjTrMyQ2SuoXCxwpsNdkA==
X-Google-Smtp-Source: AGHT+IFsRfVNfFPU6BsEwgYG2TC0Z7W8P4dF43kDfioT2WVTSIqwpOZbOrP/37BVu8mbC1tbRG8uYPS9tzEK5vE55jk=
X-Received: by 2002:a05:6512:32c5:b0:598:fac0:3452 with SMTP id
 2adb3069b0e04-59a17d17078mr16441326e87.23.1767567401098; Sun, 04 Jan 2026
 14:56:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211185805.2835633-1-gary@kernel.org> <20251211185805.2835633-7-gary@kernel.org>
In-Reply-To: <20251211185805.2835633-7-gary@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 4 Jan 2026 17:56:05 -0500
X-Gm-Features: AQt7F2pGDsP1MNeL3jyULjFumiruxyeFApZQLwrMLswWixn7Qm3FJXnF4HOGWWA
Message-ID: <CAJ-ks9k-ksFmW-nrxH7XaQDut8YO0RepFyeQPEhgrKNAqEHsGA@mail.gmail.com>
Subject: Re: [PATCH 06/11] rust: macros: convert `#[export]` to use `syn`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Fiona Behrens <me@kloenk.dev>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, rust-for-linux@vger.kernel.org, 
	David Gow <davidgow@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 2:29=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> This eliminates the custom `function_name` helper.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

> ---
>  rust/macros/export.rs  | 24 +++++++++---------------
>  rust/macros/helpers.rs | 18 ------------------
>  rust/macros/lib.rs     |  5 +++--
>  3 files changed, 12 insertions(+), 35 deletions(-)
>
> diff --git a/rust/macros/export.rs b/rust/macros/export.rs
> index 92d9b30971929..6d53521f62fc7 100644
> --- a/rust/macros/export.rs
> +++ b/rust/macros/export.rs
> @@ -3,19 +3,14 @@
>  use proc_macro2::TokenStream;
>  use quote::quote;
>
> -use crate::helpers::function_name;
> -
>  /// Please see [`crate::export`] for documentation.
> -pub(crate) fn export(_attr: TokenStream, ts: TokenStream) -> TokenStream=
 {
> -    let Some(name) =3D function_name(ts.clone()) else {
> -        return "::core::compile_error!(\"The #[export] attribute must be=
 used on a function.\");"
> -            .parse::<TokenStream>()
> -            .unwrap();
> -    };
> +pub(crate) fn export(f: syn::ItemFn) -> TokenStream {
> +    let name =3D &f.sig.ident;
>
> -    // This verifies that the function has the same signature as the dec=
laration generated by
> -    // bindgen. It makes use of the fact that all branches of an if/else=
 must have the same type.
> -    let signature_check =3D quote!(
> +    quote! {
> +        // This verifies that the function has the same signature as the=
 declaration generated by
> +        // bindgen. It makes use of the fact that all branches of an if/=
else must have the same
> +        // type.
>          const _: () =3D {
>              if true {
>                  ::kernel::bindings::#name
> @@ -23,9 +18,8 @@ pub(crate) fn export(_attr: TokenStream, ts: TokenStrea=
m) -> TokenStream {
>                  #name
>              };
>          };
> -    );
> -
> -    let no_mangle =3D quote!(#[no_mangle]);
>
> -    TokenStream::from_iter([signature_check, no_mangle, ts])
> +        #[no_mangle]
> +        #f
> +    }
>  }
> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
> index f6bbdb02d9d7d..754c827cc21e1 100644
> --- a/rust/macros/helpers.rs
> +++ b/rust/macros/helpers.rs
> @@ -2,7 +2,6 @@
>
>  use proc_macro2::{
>      token_stream,
> -    Ident,
>      TokenStream,
>      TokenTree, //
>  };
> @@ -50,23 +49,6 @@ pub(crate) fn value(&self) -> String {
>      }
>  }
>
> -/// Given a function declaration, finds the name of the function.
> -pub(crate) fn function_name(input: TokenStream) -> Option<Ident> {
> -    let mut input =3D input.into_iter();
> -    while let Some(token) =3D input.next() {
> -        match token {
> -            TokenTree::Ident(i) if i.to_string() =3D=3D "fn" =3D> {
> -                if let Some(TokenTree::Ident(i)) =3D input.next() {
> -                    return Some(i);
> -                }
> -                return None;
> -            }
> -            _ =3D> continue,
> -        }
> -    }
> -    None
> -}
> -
>  pub(crate) fn file() -> String {
>      #[cfg(not(CONFIG_RUSTC_HAS_SPAN_FILE))]
>      {
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index 4e440deaed853..870a42d41ac91 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -206,8 +206,9 @@ pub fn vtable(attr: TokenStream, input: TokenStream) =
-> TokenStream {
>  /// This macro is *not* the same as the C macros `EXPORT_SYMBOL_*`. All =
Rust symbols are currently
>  /// automatically exported with `EXPORT_SYMBOL_GPL`.
>  #[proc_macro_attribute]
> -pub fn export(attr: TokenStream, ts: TokenStream) -> TokenStream {
> -    export::export(attr.into(), ts.into()).into()
> +pub fn export(attr: TokenStream, input: TokenStream) -> TokenStream {
> +    parse_macro_input!(attr as syn::parse::Nothing);
> +    export::export(parse_macro_input!(input)).into()
>  }
>
>  /// Like [`core::format_args!`], but automatically wraps arguments in [`=
kernel::fmt::Adapter`].
> --
> 2.51.2
>
