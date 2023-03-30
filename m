Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153E7C6FD1D
	for <rust-for-linux@archiver.kernel.org>; Thu, 30 Mar 2023 12:03:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbjC3MDI (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 30 Mar 2023 08:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjC3MDH (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 30 Mar 2023 08:03:07 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B7B2D57
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Mar 2023 05:03:06 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so12961689wmq.2
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Mar 2023 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112; t=1680177784;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=aDhiTImEy8g6luxO+RzLJfBSTXKM3IhPiycrVlIdxhI=;
        b=f+PugFily1kZ+Fvc1V52KTsyl/9YhHJAmNobFbz60ZeToSkwFYRXhsR5hevIQvsOBw
         iAoEJPQLTkkjAArcl0wmdXFWVXq6ea23bWTks2k3S85wPiKRphWT9J1iLIljSJBjyBdV
         Mw5R00uP7gIQ5+B99dgkSUKwLx3n3sq6M67DhRvWj7tfv1f9xQSGwdDQAM+9girnCzNL
         2xd1ZHIMpgkJHEizNy1XG/RpzYz3rPh5RTReDA1tLmy/nk3FEOEvuC7P/+uZcQKS+iix
         46ftS8llwdWlj0OEFSagJb15jC0/6ayycoqGKDF1sLeASyEd5iZi4pk5D72aAhv7LEDv
         1BnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680177784;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDhiTImEy8g6luxO+RzLJfBSTXKM3IhPiycrVlIdxhI=;
        b=JmGy8XJpY+Qm7uefXCF0hyvZ9Y+Y35Klbo1+ZoQ654q/gs7QXiLgaXsBQ+P76ETABA
         E7nH2Xb5IzywQEioZSadQhHqcwu6IMDpqdjB6pOFoIZbVlcsysULp4f5w+W46GlgqU+Z
         N6bYoj00/vrtEgI21WxAlwHkTwOj1jmECvpiIHKiMaD3NcKU/1F+GYi7ilNKfrwyac+R
         xgEhl+K8kFNLfxkgPio/kUw4XBPEIKvR9eTF/n4aJjVK06PdtYV/he/3a/aIvxyjAloY
         TPDp9duIXvznDc9Huti1qUKfz/chLkvIDiJddzDC18Fzuybc6X9nnErTij127lUfRY1B
         hv/A==
X-Gm-Message-State: AO0yUKX3WF4Vrqx1N2pQlxdh7He9U9npHsCJU2Kq3gSvrGGtWLrjTFZi
        GbzxF3z8OGW97ttc9TTia1XINg==
X-Google-Smtp-Source: AK7set97KAJhfM8PBq4MPaXeNclKkaCf8DiLP2D62aeASwc61kH8n6I0i86fuHqdrnK+cHoD77xg7g==
X-Received: by 2002:a1c:7206:0:b0:3ed:2352:eebd with SMTP id n6-20020a1c7206000000b003ed2352eebdmr18179525wmc.11.1680177784507;
        Thu, 30 Mar 2023 05:03:04 -0700 (PDT)
Received: from localhost ([165.225.194.221])
        by smtp.gmail.com with ESMTPSA id a13-20020a05600c224d00b003edef091b17sm5670855wmm.37.2023.03.30.05.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 05:03:04 -0700 (PDT)
References: <20230329223239.138757-1-y86-dev@protonmail.com>
 <20230329223239.138757-2-y86-dev@protonmail.com>
 <877cuy5ur2.fsf@metaspace.dk>
User-agent: mu4e 1.9.18; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Andreas Hindborg <nmi@metaspace.dk>
Cc:     y86-dev@protonmail.com, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj?= =?utf-8?Q?=C3=B6rn?= Roy Baron 
        <bjorn3_gh@protonmail.com>, Alice Ryhl <alice@ryhl.io>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev
Subject: Re: [PATCH v3 01/13] rust: macros: add `quote!` macro
Date:   Thu, 30 Mar 2023 14:01:21 +0200
In-reply-to: <877cuy5ur2.fsf@metaspace.dk>
Message-ID: <87355m5tvs.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Andreas Hindborg <nmi@metaspace.dk> writes:

> y86-dev@protonmail.com writes:
>
>> From: Gary Guo <gary@garyguo.net>
>>
>> Add the `quote!` macro for creating `TokenStream`s directly via the
>> given Rust tokens. It also supports repetitions using iterators.
>>
>> It will be used by the pin-init API proc-macros to generate code.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Benno Lossin <y86-dev@protonmail.com>
>> ---
>>  rust/macros/lib.rs   |   2 +
>>  rust/macros/quote.rs | 145 +++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 147 insertions(+)
>>  create mode 100644 rust/macros/quote.rs
>>
>> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
>> index c1d385e345b9..82b520f024dd 100644
>> --- a/rust/macros/lib.rs
>> +++ b/rust/macros/lib.rs
>> @@ -2,6 +2,8 @@
>>
>>  //! Crate for all kernel procedural macros.
>>
>> +#[macro_use]
>> +mod quote;
>>  mod concat_idents;
>>  mod helpers;
>>  mod module;
>> diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
>> new file mode 100644
>> index 000000000000..7efb009c25a9
>> --- /dev/null
>> +++ b/rust/macros/quote.rs
>> @@ -0,0 +1,145 @@
>> +// SPDX-License-Identifier: Apache-2.0 OR MIT
>> +
>> +use proc_macro::{TokenStream, TokenTree};
>> +
>> +pub(crate) trait ToTokens {
>> +    fn to_tokens(&self, tokens: &mut TokenStream);
>> +}
>> +
>> +impl<T: ToTokens> ToTokens for Option<T> {
>> +    fn to_tokens(&self, tokens: &mut TokenStream) {
>> +        if let Some(v) = self {
>> +            v.to_tokens(tokens);
>> +        }
>> +    }
>> +}
>> +
>> +impl ToTokens for proc_macro::Group {
>> +    fn to_tokens(&self, tokens: &mut TokenStream) {
>> +        tokens.extend([TokenTree::from(self.clone())]);
>> +    }
>> +}
>> +
>> +impl ToTokens for TokenTree {
>> +    fn to_tokens(&self, tokens: &mut TokenStream) {
>> +        tokens.extend([self.clone()]);
>> +    }
>> +}
>> +
>> +impl ToTokens for TokenStream {
>> +    fn to_tokens(&self, tokens: &mut TokenStream) {
>> +        tokens.extend(self.clone());
>> +    }
>> +}
>> +
>> +/// Converts tokens into [`proc_macro::TokenStream`] and performs variable interpolations with
>> +/// the given span.
>> +///
>> +/// This is a similar to the
>> +/// [`quote_spanned!`](https://docs.rs/quote/latest/quote/macro.quote_spanned.html) macro from the
>> +/// `quote` crate but provides only just enough functionality needed by the current `macros` crate.
>> +#[allow(unused_macros)]
>> +macro_rules! quote_spanned {
>> +    ($span:expr => $($tt:tt)*) => {
>> +    #[allow(clippy::vec_init_then_push)]
>> +    {
>> +        let mut tokens = Vec::new();
>> +        let span = $span;
>> +        quote_spanned!(@proc tokens span $($tt)*);
>> +        proc_macro::TokenStream::from_iter(tokens)
>
> Should this be `::alloc::vec::Vec` and
> `::proc_macro::TokenStream::from_iter` ?
>
> Best regards,
> Andreas
>
>> +    }};
>> +    (@proc $v:ident $span:ident) => {};
>> +    (@proc $v:ident $span:ident #$id:ident $($tt:tt)*) => {
>> +        let mut ts = proc_macro::TokenStream::new();
>> +        crate::quote::ToTokens::to_tokens(&$id, &mut ts);
>> +        $v.extend(ts.into_iter());
>> +        quote_spanned!(@proc $v $span $($tt)*);
>> +    };
>> +    (@proc $v:ident $span:ident #(#$id:ident)* $($tt:tt)*) => {
>> +        for token in $id {
>> +            let mut ts = proc_macro::TokenStream::new();
>> +            crate::quote::ToTokens::to_tokens(&token, &mut ts);
>> +            $v.extend(ts.into_iter());

Also, could this be without `into_iter()`: `$v.extend(ts)`?

BR Andreas

>> +        }
>> +        quote_spanned!(@proc $v $span $($tt)*);
>> +    };
>> +    (@proc $v:ident $span:ident ( $($inner:tt)* ) $($tt:tt)*) => {
>> +        let mut tokens = Vec::new();
>> +        quote_spanned!(@proc tokens $span $($inner)*);
>> +        $v.push(proc_macro::TokenTree::Group(proc_macro::Group::new(
>> +            proc_macro::Delimiter::Parenthesis,
>> +            proc_macro::TokenStream::from_iter(tokens)
>> +        )));
>> +        quote_spanned!(@proc $v $span $($tt)*);
>> +    };
>> +    (@proc $v:ident $span:ident [ $($inner:tt)* ] $($tt:tt)*) => {
>> +        let mut tokens = Vec::new();
>> +        quote_spanned!(@proc tokens $span $($inner)*);
>> +        $v.push(proc_macro::TokenTree::Group(proc_macro::Group::new(
>> +            proc_macro::Delimiter::Bracket,
>> +            proc_macro::TokenStream::from_iter(tokens)
>> +        )));
>> +        quote_spanned!(@proc $v $span $($tt)*);
>> +    };
>> +    (@proc $v:ident $span:ident { $($inner:tt)* } $($tt:tt)*) => {
>> +        let mut tokens = Vec::new();
>> +        quote_spanned!(@proc tokens $span $($inner)*);
>> +        $v.push(proc_macro::TokenTree::Group(proc_macro::Group::new(
>> +            proc_macro::Delimiter::Brace,
>> +            proc_macro::TokenStream::from_iter(tokens)
>> +        )));
>> +        quote_spanned!(@proc $v $span $($tt)*);
>> +    };
>> +    (@proc $v:ident $span:ident :: $($tt:tt)*) => {
>> +        $v.push(
>> +            proc_macro::TokenTree::Punct(proc_macro::Punct::new(':', proc_macro::Spacing::Joint))
>> +        );
>> +        $v.push(
>> +            proc_macro::TokenTree::Punct(proc_macro::Punct::new(':', proc_macro::Spacing::Alone))
>> +        );
>> +        quote_spanned!(@proc $v $span $($tt)*);
>> +    };
>> +    (@proc $v:ident $span:ident : $($tt:tt)*) => {
>> +        $v.push(
>> +            proc_macro::TokenTree::Punct(proc_macro::Punct::new(':', proc_macro::Spacing::Alone))
>> +        );
>> +        quote_spanned!(@proc $v $span $($tt)*);
>> +    };
>> +    (@proc $v:ident $span:ident , $($tt:tt)*) => {
>> +        $v.push(
>> +            proc_macro::TokenTree::Punct(proc_macro::Punct::new(',', proc_macro::Spacing::Alone))
>> +        );
>> +        quote_spanned!(@proc $v $span $($tt)*);
>> +    };
>> +    (@proc $v:ident $span:ident @ $($tt:tt)*) => {
>> +        $v.push(
>> +            proc_macro::TokenTree::Punct(proc_macro::Punct::new('@', proc_macro::Spacing::Alone))
>> +        );
>> +        quote_spanned!(@proc $v $span $($tt)*);
>> +    };
>> +    (@proc $v:ident $span:ident ! $($tt:tt)*) => {
>> +        $v.push(
>> +            proc_macro::TokenTree::Punct(proc_macro::Punct::new('!', proc_macro::Spacing::Alone))
>> +        );
>> +        quote_spanned!(@proc $v $span $($tt)*);
>> +    };
>> +    (@proc $v:ident $span:ident $id:ident $($tt:tt)*) => {
>> +        $v.push(proc_macro::TokenTree::Ident(proc_macro::Ident::new(stringify!($id), $span)));
>> +        quote_spanned!(@proc $v $span $($tt)*);
>> +    };
>> +}
>> +
>> +/// Converts tokens into [`proc_macro::TokenStream`] and performs variable interpolations with
>> +/// mixed site span ([`Span::mixed_site()`]).
>> +///
>> +/// This is a similar to the [`quote!`](https://docs.rs/quote/latest/quote/macro.quote.html) macro
>> +/// from the `quote` crate but provides only just enough functionality needed by the current
>> +/// `macros` crate.
>> +///
>> +/// [`Span::mixed_site()`]: https://doc.rust-lang.org/proc_macro/struct.Span.html#method.mixed_site
>> +#[allow(unused_macros)]
>> +macro_rules! quote {
>> +    ($($tt:tt)*) => {
>> +        quote_spanned!(proc_macro::Span::mixed_site() => $($tt)*)
>> +    }
>> +}

