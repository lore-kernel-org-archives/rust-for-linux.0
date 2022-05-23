Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5BDC433EF
	for <rust-for-linux@archiver.kernel.org>; Mon, 23 May 2022 18:53:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239586AbiEWSxG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 23 May 2022 14:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243318AbiEWSvq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 23 May 2022 14:51:46 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409017B9E0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 May 2022 11:37:29 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id g16so18252756lja.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 May 2022 11:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EF+HyK8Q8jGuUKnfQuJxpTAac/v3/lWJSDPnpLDl6Oo=;
        b=TCLbLPu4fY1PFTWqGZrYvI6Pr9Tf9y4nNjADncA9r7BdaknOYHzxkVKNaTHXlmeNGC
         W6kp2ErMbL7AOgGIzhk0VMgEbX0d6PXEt2wQvaDfWNcT2zEi2fO5bRfqWkx3r2IQcqGp
         g6XfeFgEKTbvx9b9F/8hvOvfmVxaJebt7qwUrSWrOl6LivjY/5+CEkfcegFxM2refumh
         S/z/yJ9ihpNe2Dy9uXTlvUKhLXwgWykV+uttif6YpUco0RELnkLYACOuS7ZQOy+5nM28
         Z6ErChTWtmlCRrvh6mFnCaY0rniF+9rEOxSZN9tddOcODiN47nTr1xmuvreCEbPD+XMr
         oSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EF+HyK8Q8jGuUKnfQuJxpTAac/v3/lWJSDPnpLDl6Oo=;
        b=NpCc7qsWQqdnNwDhze7sU2SOvPENAB86PkpzX+969EAqZAjoH+QczHWqJcz8QAt5Bt
         EqHla+j4wZrOjERMw2e5GR+U4BAfPlXW9so/2mxH3a/7BjSx+G5QWwFwfpykizTOWwMv
         lTdw9Vx1wh8bah6lulvUn+6oIjKWOR+b5eYNawZl7ullWuXecA1qCmEJCEfcPtGWcOdC
         LGsgG9Ko/BCDJD7xoZ27qYwIkcMAIgC8t+K02cobsUmQetpww53pHHKG+vGQXDVWNthj
         fIg8evSxESLaalnfATWnS6YpiKAM5Oe5qxonmusNZFvY2DypaAcK/d/2A2iupNEIh6PK
         9dqw==
X-Gm-Message-State: AOAM5326ASQ8uB12EOGV8/sWJrYlAEtrBslvhR2XPsmT4U43pvxjaC11
        NVQqEF/SkHmWT8anHpnK5RFA9/9sEQiAl8iTY4X1LQ==
X-Google-Smtp-Source: ABdhPJxYVniwTfnUp7XmacTlpjyteWqqznZ4V6ahXVd90eLHa2Bxx/nJfBnlIm3HDOaYJ6eC16xsJ3VlTw6xiy6liNw=
X-Received: by 2002:a2e:98d0:0:b0:253:e3a3:ec6c with SMTP id
 s16-20020a2e98d0000000b00253e3a3ec6cmr6861584ljj.493.1653331047863; Mon, 23
 May 2022 11:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org> <20220523020209.11810-7-ojeda@kernel.org>
In-Reply-To: <20220523020209.11810-7-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 23 May 2022 11:37:16 -0700
Message-ID: <CAKwvOd=mFhxjKRP_qt3Yu69dj_P6VUMSUSQm7fY6yS2bsO8Y2w@mail.gmail.com>
Subject: Re: [PATCH v7 06/25] rust: add `compiler_builtins` crate
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, May 22, 2022 at 7:03 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> Rust provides `compiler_builtins` as a port of LLVM's `compiler-rt`.
> Since we do not need the vast majority of them, we avoid the
> dependency by providing our own crate.
>
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Co-developed-by: Sven Van Asbroeck <thesven73@gmail.com>
> Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/compiler_builtins.rs | 57 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 rust/compiler_builtins.rs
>
> diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
> new file mode 100644
> index 000000000000..80ca4c0dcd24
> --- /dev/null
> +++ b/rust/compiler_builtins.rs
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Our own `compiler_builtins`.
> +//!
> +//! Rust provides [`compiler_builtins`] as a port of LLVM's [`compiler-rt`].
> +//! Since we do not need the vast majority of them, we avoid the dependency
> +//! by providing this file.
> +//!
> +//! At the moment, some builtins are required that should not be. For instance,
> +//! [`core`] has 128-bit integers functionality which we should not be compiling
> +//! in. We will work with upstream [`core`] to provide feature flags to disable
> +//! the parts we do not need. For the moment, we define them to [`panic!`] at

^ Any progress on this? Got any links to any feature requests or bug reports.

Also, I'm not sure my concern about explicit build failures for C code
was ever addressed?  We have a constant problem with `long long`
division on ARCH=arm32 and ARCH=i386 in C code.
https://lore.kernel.org/lkml/CAKwvOdk+A2PBdjSFVUhj4xyCGCKujtej1uPgywQgrKPiK2ksPw@mail.gmail.com/

> +//! runtime for simplicity to catch mistakes, instead of performing surgery
> +//! on `core.o`.
> +//!
> +//! In any case, all these symbols are weakened to ensure we do not override
> +//! those that may be provided by the rest of the kernel.
> +//!
> +//! [`compiler_builtins`]: https://github.com/rust-lang/compiler-builtins
> +//! [`compiler-rt`]: https://compiler-rt.llvm.org/
> +
> +#![feature(compiler_builtins)]
> +#![compiler_builtins]
> +#![no_builtins]
> +#![no_std]
> +
> +macro_rules! define_panicking_intrinsics(
> +    ($reason: tt, { $($ident: ident, )* }) => {
> +        $(
> +            #[doc(hidden)]
> +            #[no_mangle]
> +            pub extern "C" fn $ident() {
> +                panic!($reason);
> +            }
> +        )*
> +    }
> +);
> +
> +define_panicking_intrinsics!("`i128` should not be used", {
> +    __ashrti3,
> +    __muloti4,
> +    __multi3,
> +});
> +
> +define_panicking_intrinsics!("`u128` should not be used", {
> +    __ashlti3,
> +    __lshrti3,
> +    __udivmodti4,
> +    __udivti3,
> +    __umodti3,
> +});
> +
> +#[cfg(target_arch = "arm")]
> +define_panicking_intrinsics!("`u64` division/modulo should not be used", {
> +    __aeabi_uldivmod,
> +    __mulodi4,
> +});
> --
> 2.36.1
>


-- 
Thanks,
~Nick Desaulniers
