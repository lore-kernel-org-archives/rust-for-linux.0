Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A8E275AFD
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 23:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767567615; cv=none; b=Go3V7YXDoUGSdbNqNigCjUAJq+q/x+N4BIGnw8F6ExY2iuzOygaTlHah6u8upzDqt5kO248qSn2iM2IyCaj/z0bJSSAbVWkOUR/7fCK/KEI2jv/BwVff1KdABm+jPxc0sxka10XQMv2ZeujTr6I4fNuBBbOstvMjK/08BmgTngs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767567615; c=relaxed/simple;
	bh=bkCzYqeHTttXxL9nUrpeRHi96wL44EyjrMbtgZRBRuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPHfYldetoGxfCmRjDZj8EWsTlC5U0WsZ5ElPSJnUrNHgqj+EgCPmDOeNjmwS/+6/Hne+iSG5puU1CSyCKyvxqNfcW036Ok9dPJTlroNm//7NiLE0zyxyjcehLkSDhjYTyHhP5mBFIJkeFA3LkwLWEZuZRRo9Cxgva/vAbppfNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZuzRTPs; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZuzRTPs"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38107fadda2so101915351fa.1
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 15:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767567612; x=1768172412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GK/s5wWA1zpo54FOo4McyCtbicqgiFKeN0gzVRY0cVE=;
        b=eZuzRTPs5DyBPNbu1VGBJZ5LdzHhoV7o2r31aTUWt6okxs9NT6+0XKF3yhjbOF+Jlw
         XvzzzPwcYK/E7Zasxe61QTanClZnmp6jEGLZaenHh+CE0isgiXZb153tvqNa8CHKEWyj
         tDCKYQ3sDO5JNmhFRbnSeC8/hiWPi2oIoulC+KjhIbxpgafyldIIVtJwj+7etPF5g+9f
         pVI2UNASf3ZaHrG2vMlm3D3mySLjwn6kCfEcU7W/KbJZgUtPwoGIgeQjvnf/++4J//ya
         H6O8298olom92GtUw8CAQro9cnLe2z0bAusATBjbQERI58MxwJ2mLWyZrryIz1F+RgGD
         bdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567612; x=1768172412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GK/s5wWA1zpo54FOo4McyCtbicqgiFKeN0gzVRY0cVE=;
        b=L0Pj755H4Ztzhv+ie7ReEZRjisrakRC7Pp5IxVArvtfXLSXh7DTqNhLnKPOPd6pk/p
         cQT2eDmXoPYTloDQXJYlkHJORT+zEQFDWXe+51GWxhDHZ4wU7e7Z8J/k1FBtB+ezo20P
         kSI37NIwcSGluxBYosFPbzglq/E/43oy49mhPD4ICvCoW3nMcQSq/Dj1za9oPqE3Yy4K
         ZlTN6WpLZJPsqMmMx1wwiwoKJc9cosU2QCWBn4xA0On2sTx8cwjpBP4zfG6tdUXLgFHm
         WX4oMjjGkrQ0Hrqd+xMpkwH4f9qz6pSBM3z4+PPOnqp2VA5X6Cz81+dctjzowEoq2m1V
         DH0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAWDcQPsZkT7+YJebqprEY+X7VX0rndWa9KT2VkZvhJbDUHRXaP8oee/WPjbIF3+WQRhItmvjM8Jg4d5x+VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf+cXicbxal/MIUG4siPH5SCH+Di4J90CXQduhZ+WTZS2+ZTuk
	OngmiOD/obX6XSyTu4xJfNGKFEd7VBZHwmPmy+T5fTbI6EZ8ajrHrlb2fN5QAOJwCOsSrTpWMY5
	XDme3Eh4+JJzSxXS54wczfR0BeazR6xQ=
X-Gm-Gg: AY/fxX7huTjVm3ueUSD5k96ILZzFDUaXgOFUdXhOr+4NXQ3GaK+PZy13+G6JpSmlWA5
	URmqM5b4k6PVZr8FRRhBaks1xc78hKKDZ5BMddiJ9Q/yqAI6ui8qlqR/uoCs+sCFBrwkKDIBzvj
	ZTKbEtjIX7D3Yfw7OZUtkukuOrdSG3xJw66ZilWTx48Puatqq1LjIAZhOHhvLER6JeOqN31H8Wg
	KLu7BklQsaG/X99umYy+qFFciq9RuuL1D2lCnu3jvix+sG7UDGfMzmK3lrIPtz8R43MqaokVC5j
	0cbHrwBQa0JIZrG/2LL+8cdwWPmtn0mKDmRRPm732LV5WgmqVNc14Pk6vM/JpAoo0i1RbIaSgbc
	3QSDzzFvjLd93IMqxs8FQvLsoSzyFxPxZqC58wbgCmw==
X-Google-Smtp-Source: AGHT+IG8CmOVNWmlTJszyevIlf/OxC1VSGUfK/r4GMAq/+fACijUR3S9IvNuVYcbtjMAJn2tur5W0ssnC17CdQeZwl8=
X-Received: by 2002:a05:651c:41c8:b0:380:989:f5eb with SMTP id
 38308e7fff4ca-381215694fcmr132870771fa.5.1767567611769; Sun, 04 Jan 2026
 15:00:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211185805.2835633-1-gary@kernel.org> <20251211185805.2835633-8-gary@kernel.org>
In-Reply-To: <20251211185805.2835633-8-gary@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 4 Jan 2026 17:59:35 -0500
X-Gm-Features: AQt7F2qpVvdhnUt_sQ2OT9TXLAcKoTxcpUCbWBpjzU3wwNq9HPyWanCNhB3JY7w
Message-ID: <CAJ-ks9=525PETbRGuZn=rv=H9AC=Sjgn47DSGxrKLi=0HxBmfQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] rust: macros: convert `concat_idents!` to use `syn`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	rust-for-linux@vger.kernel.org, David Gow <davidgow@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 2:30=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> This eliminates the need for `expect_punct` helper.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

> ---
>  rust/macros/concat_idents.rs | 39 ++++++++++++++++++++++++------------
>  rust/macros/helpers.rs       | 14 +------------
>  rust/macros/lib.rs           |  4 ++--
>  3 files changed, 29 insertions(+), 28 deletions(-)
>
> diff --git a/rust/macros/concat_idents.rs b/rust/macros/concat_idents.rs
> index 12cb231c3d715..47b6add378d2c 100644
> --- a/rust/macros/concat_idents.rs
> +++ b/rust/macros/concat_idents.rs
> @@ -1,23 +1,36 @@
>  // SPDX-License-Identifier: GPL-2.0
>
> -use proc_macro2::{token_stream, Ident, TokenStream, TokenTree};
> +use proc_macro2::{
> +    Ident,
> +    TokenStream,
> +    TokenTree, //
> +};
> +use syn::{
> +    parse::{
> +        Parse,
> +        ParseStream, //
> +    },
> +    Result,
> +    Token, //
> +};
>
> -use crate::helpers::expect_punct;
> +pub(crate) struct Input {
> +    a: Ident,
> +    _comma: Token![,],
> +    b: Ident,
> +}
>
> -fn expect_ident(it: &mut token_stream::IntoIter) -> Ident {
> -    if let Some(TokenTree::Ident(ident)) =3D it.next() {
> -        ident
> -    } else {
> -        panic!("Expected Ident")
> +impl Parse for Input {
> +    fn parse(input: ParseStream<'_>) -> Result<Self> {
> +        Ok(Self {
> +            a: input.parse()?,
> +            _comma: input.parse()?,
> +            b: input.parse()?,
> +        })
>      }
>  }
>
> -pub(crate) fn concat_idents(ts: TokenStream) -> TokenStream {
> -    let mut it =3D ts.into_iter();
> -    let a =3D expect_ident(&mut it);
> -    assert_eq!(expect_punct(&mut it), ',');
> -    let b =3D expect_ident(&mut it);
> -    assert!(it.next().is_none(), "only two idents can be concatenated");
> +pub(crate) fn concat_idents(Input { a, b, .. }: Input) -> TokenStream {
>      let res =3D Ident::new(&format!("{a}{b}"), b.span());
>      TokenStream::from_iter([TokenTree::Ident(res)])
>  }
> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
> index 754c827cc21e1..adfa60d8f42d8 100644
> --- a/rust/macros/helpers.rs
> +++ b/rust/macros/helpers.rs
> @@ -1,10 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>
> -use proc_macro2::{
> -    token_stream,
> -    TokenStream,
> -    TokenTree, //
> -};
> +use proc_macro2::TokenStream;
>  use quote::ToTokens;
>  use syn::{
>      parse::{
> @@ -16,14 +12,6 @@
>      Result, //
>  };
>
> -pub(crate) fn expect_punct(it: &mut token_stream::IntoIter) -> char {
> -    if let TokenTree::Punct(punct) =3D it.next().expect("Reached end of =
token stream for Punct") {
> -        punct.as_char()
> -    } else {
> -        panic!("Expected Punct");
> -    }
> -}
> -
>  /// A string literal that is required to have ASCII value only.
>  pub(crate) struct AsciiLitStr(LitStr);
>
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index 870a42d41ac91..bb2dfd4a4dafc 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -283,8 +283,8 @@ pub fn fmt(input: TokenStream) -> TokenStream {
>  /// assert_eq!(BR_OK, binder_driver_return_protocol_BR_OK);
>  /// ```
>  #[proc_macro]
> -pub fn concat_idents(ts: TokenStream) -> TokenStream {
> -    concat_idents::concat_idents(ts.into()).into()
> +pub fn concat_idents(input: TokenStream) -> TokenStream {
> +    concat_idents::concat_idents(parse_macro_input!(input)).into()
>  }
>
>  /// Paste identifiers together.
> --
> 2.51.2
>
