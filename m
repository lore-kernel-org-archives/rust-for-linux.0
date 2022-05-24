Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F776C433F5
	for <rust-for-linux@archiver.kernel.org>; Tue, 24 May 2022 12:08:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbiEXMIT (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 24 May 2022 08:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbiEXMIS (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 24 May 2022 08:08:18 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5575166FBD
        for <rust-for-linux@vger.kernel.org>; Tue, 24 May 2022 05:08:17 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id q203so18158552iod.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 May 2022 05:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YAEgrQg48uiPecjl8Hd+62ayLQejBKZxXTmGP35N9cU=;
        b=RfaASqXvh68uv+G8eEyWk8mnYI5jJH1IZx8eLqhOcPtkr5T6x0kYAFXytuNGtiyRW8
         lzVy/9xKBvImO3aCcWZTQkELMeiLFYRtqPy89TE+LW09LGsueyl6AVdxmSz/4EOQ4GX4
         +AFGfxT5GuKmoqCXTakYhllT3vmr0XEN6wWBjT/nnCsBa1cvwGn2MUBEAVTXcnpYpT3Q
         KnEMPhMARiisOB1w2CVA9Rrn4iwmp/vRrzRM7P4ONFwSAIJsD6xJfXOZkOEhOqepdiPX
         o4h2wwQV3sjVk7994ia4azv6OfA8z4OFxgRZuJc0pWxdkF8sqPc0vPc88BomBKMRzDsm
         ddhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YAEgrQg48uiPecjl8Hd+62ayLQejBKZxXTmGP35N9cU=;
        b=Fi0CsYylbgTih7S4Q0mxhTtaOnHuH6yIDy3IrRAmPMBIMZbqIQqlwWnhJB8k1Xe+EA
         7plkkqPohF6Iwhm1Rzrhk3JpTDf6vEa+qpRmKfp5N4xmZusi+w5egwMK80UQX+cR1Dnc
         jwtoUFMTTvWm9SjNgC3dxp8M3jpbr2z/RU8tcpSI1uCQCt3vnIpJBVo6/CjlqdV3yNY5
         5ghcyd2d9zMNqRPedsXleybdQa90X+XpM8tm+sz9bc2vgasvWWmhnH+fjxdENv3xhNGx
         quGVUBMhWB4/GTqkpAVg9nE+vy8kabVsQlFQ38FSRWHJB6kSkeY0VeXoaQNXplrsACe1
         PpXg==
X-Gm-Message-State: AOAM531iXZdLB7WXO8Ip4x87/E3/+4eU93l+hMrdD+2YXstQ/vHeTqLX
        7TJyXPCiuSsBMA7IVlIMJ8pEwvdbMsgBVyrGJSs=
X-Google-Smtp-Source: ABdhPJxiofgQ1ob/tWcro7qrXdhZi45pRcwacJc25SKoYYmBouZ6yl94KwWo2rlAO8VEwMKLr97qPsPhBIWUIPfqsBM=
X-Received: by 2002:a6b:b4c6:0:b0:661:3378:adc8 with SMTP id
 d189-20020a6bb4c6000000b006613378adc8mr6052725iof.64.1653394096738; Tue, 24
 May 2022 05:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdm5JT4wbdQQYuW+RT07rCi6whGBM2iUAyg8A1CmLXG6Nw@mail.gmail.com>
In-Reply-To: <CAKwvOdm5JT4wbdQQYuW+RT07rCi6whGBM2iUAyg8A1CmLXG6Nw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 24 May 2022 14:08:05 +0200
Message-ID: <CANiq72=dLnCpCLOKJ6+x+D0AV=tFNyy4hUEjd6KCOCw+eWbPkA@mail.gmail.com>
Subject: Re: help installing the correct version of bindgen
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, May 23, 2022 at 10:28 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> $ make LLVM=1 -j72 rustavailable
> make: *** [Makefile:1802: rustavailable] Error 1

I think we could have a message about `bindgen` being broken here if
calling it completely fails.

> So it looks like bindgen is using clang-sys-1.0.3?
> And it's finding my source code checkout of clang from the llvm-project.
>
> Looking at https://github.com/rust-lang/rust-bindgen/tree/11ae35089e4748b7e2a6f50f6bef7709af72e724
> specifically
> https://github.com/rust-lang/rust-bindgen/blob/11ae35089e4748b7e2a6f50f6bef7709af72e724/Cargo.toml#L52
> it just says "use version 1". But the latest version of clang-sys is
> 1.3.2 according to https://crates.io/crates/clang-sys.
>
> What gives?

`cargo install --locked` respects the Cargo.lock file, which indeed says 1.0.3:

    https://github.com/rust-lang/rust-bindgen/blob/v0.56.0/Cargo.lock#L83

When you installed the latest bindgen as you mention in the issue,
then you should see 1.2.0 (if you used `--locked`):

    https://github.com/rust-lang/rust-bindgen/blob/v0.59.2/Cargo.lock#L80

Hopefully this clarifies things a bit...

> And it's finding my source code checkout of clang from the llvm-project.

Have you tried tweaking the paths with
https://github.com/KyleMayes/clang-sys#environment-variables?

For instance, try to point it to the real executable with
CLANG_PATH=/android0/llvm-project/llvm/build/bin/clang etc.

Cheers,
Miguel
