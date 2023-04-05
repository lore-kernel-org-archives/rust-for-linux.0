Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1FAC76188
	for <rust-for-linux@archiver.kernel.org>; Wed,  5 Apr 2023 20:46:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbjDEUqq (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 5 Apr 2023 16:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232683AbjDEUqo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 5 Apr 2023 16:46:44 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67CF91BF
        for <rust-for-linux@vger.kernel.org>; Wed,  5 Apr 2023 13:46:41 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id t10so144092649edd.12
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Apr 2023 13:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112; t=1680727600;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=PjVK3OcYLqF4e28UZO8WCt8ffeDwGmSl2Tba2xHUZTQ=;
        b=S+FdGx5OVDOWQ5NuClG6fFfByhM2/uoL0xdBSpNlIboO6AGKXYv1pvtR2kEIBF2v4w
         Uly2Hz01alFFO2T+djikpxMRSJnCd9IXU44uuX25AUrkgzYGL7zbRApowvRQzu8J5KNh
         kEzfSQHpHEZ5WJg25yd/d7auULoMB6ftWjkuWB9XgetRuRFLN1ej6aHCLAHSth0Uaf8p
         0ZmUWWUrsSMBHh8tTWLEIIZVC7S2W90Xpm4ad96OE9Td91v7frJfEV9QnzNXVBaBnc8G
         WY7ARbfUIYTwTJngzPviMkVSdp+c0w/j314svGS7lC3JIvE0PhsfyU37Qa33UvDD1d+g
         +7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727600;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjVK3OcYLqF4e28UZO8WCt8ffeDwGmSl2Tba2xHUZTQ=;
        b=zKzElovLIqy+fFmOUageoOgbD5nJZrx/xFD9btUNzK8i4uBQ08lnLAdCoWEOOLtc3g
         3ZN4mWsa8OnS29nM1ZL88RpiAvj900A/i1oPl9treZllUjYORc2ujzVOTqFS6slCJHBW
         Eu+NdxCAsEtpMddhHP/4D1gc32vFw0ihtAXjA/yuFF1KkxmJad7H1Tv0OOnJi1pRXfe/
         McZc8OqQqXCz7nR4oKnZ5BcM28YEkMtrLPYF0+qlxqinjmcUs39E/8NclniVwl0dJwh8
         XffM018dIsvgBlj0caiVLyV1jUt0NepMnV9Vn8SdGdUM0P/w7/MeA9lIcvpRu5jeYSd7
         EtIA==
X-Gm-Message-State: AAQBX9foYvX3ZY1ft5jvKQBtzOJYWXhy0EdaXOe6VHwb1YcDDVVcjeL9
        O4v2JV/vfZKZESux5+pYUdnx0Q==
X-Google-Smtp-Source: AKy350aGDXTiJvSHX/YUEcY6IQZp4Bdeq9EFS0GjiPQShb4Gy7iz8du0uRkNAB08ACzio3QUcIPdCA==
X-Received: by 2002:a17:906:16c8:b0:933:3a22:8513 with SMTP id t8-20020a17090616c800b009333a228513mr4053369ejd.53.1680727599845;
        Wed, 05 Apr 2023 13:46:39 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id xb7-20020a170907070700b00948c2f245a9sm3928942ejb.110.2023.04.05.13.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:46:39 -0700 (PDT)
References: <20230405193445.745024-1-y86-dev@protonmail.com>
 <20230405193445.745024-2-y86-dev@protonmail.com>
User-agent: mu4e 1.10.1; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Benno Lossin <y86-dev@protonmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Alice Ryhl <alice@ryhl.io>, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Alice Ryhl <aliceryhl@google.com>,
        Andreas Hindborg <a.hindborg@samsung.com>
Subject: Re: [PATCH v6 01/15] rust: enable the `pin_macro` feature
Date:   Wed, 05 Apr 2023 22:45:57 +0200
In-reply-to: <20230405193445.745024-2-y86-dev@protonmail.com>
Message-ID: <87fs9et5u8.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Benno Lossin <y86-dev@protonmail.com> writes:

> This feature enables the use of the `pin!` macro for the `stack_pin_init!`
> macro. This feature is already stabilized in Rust version 1.68.
>
> Signed-off-by: Benno Lossin <y86-dev@protonmail.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Acked-by: Boqun Feng <boqun.feng@gmail.com>
> Cc: Andreas Hindborg <a.hindborg@samsung.com>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

>  rust/kernel/lib.rs     | 1 +
>  scripts/Makefile.build | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 223564f9f0cc..4317b6d5f50b 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -17,6 +17,7 @@
>  #![feature(core_ffi_c)]
>  #![feature(dispatch_from_dyn)]
>  #![feature(generic_associated_types)]
> +#![feature(pin_macro)]
>  #![feature(receiver_trait)]
>  #![feature(unsize)]
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 76323201232a..ba4102b9d94d 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -277,7 +277,7 @@ $(obj)/%.lst: $(src)/%.c FORCE
>  # Compile Rust sources (.rs)
>  # ---------------------------------------------------------------------------
>
> -rust_allowed_features := core_ffi_c
> +rust_allowed_features := core_ffi_c,pin_macro
>
>  rust_common_cmd = \
>  	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \

