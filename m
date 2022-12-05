Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A743C47088
	for <rust-for-linux@archiver.kernel.org>; Mon,  5 Dec 2022 21:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiLEViX (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 5 Dec 2022 16:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbiLEViW (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 5 Dec 2022 16:38:22 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 906CC22BDB
        for <rust-for-linux@vger.kernel.org>; Mon,  5 Dec 2022 13:38:20 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id v3so11651841pgh.4
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Dec 2022 13:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dhBeZR7RvoRLzLlWGrPqQE9uqmwbYO47ix64EgD6alM=;
        b=W767WaS+Mz+NhV4++nESbXhRXw3iaSoRbvQmxa5XCIpZfOfyduQpDN260Z3RIUTXM2
         OnU4Ze10bWc1dMYjArsRKU73cpoltCBcybggKtaQ8rs4hlrZTtoyoUBnQDxsnfeQK5LP
         N9D7d1eQ6R0q9LSVD7U6TSVW7qoMz33Hv1oE7wTo1mGDoI09E4ya94tSCd920rC6Aiz3
         e2hrCuV/UL2mC83OYstbIORNjNXm13dD4dPD3IUVBcEE1ua5MfvtK22Jj8jJzpwZxqxQ
         opcqPSsji9E2N2jnbE2BT27R8CiXhIuUCV5rK5mRAWtePMK9z74pCrUE6nEv1p2fwkDq
         DGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhBeZR7RvoRLzLlWGrPqQE9uqmwbYO47ix64EgD6alM=;
        b=EDLXG1tGgcUx3xHqI4DlIqD96UZzp9B30q+xzU+XyD1ty2JBdTv38Gr6XJkr7bFwQD
         8LEdxO52ZI2RSYk3Wo7qvIhJa1UBjsiA5CNkdrnFOoidAhe1Mm9dY+OE97Yxx9CZgiSn
         vHv5fupQIOvTY+ektep7mr2hKVhFmnKmGT89DLhs7Zd8Q1uYxI4YidDH6qCcnWQrKuhZ
         dgQgbRiK+5wtjxktVAO7GAtQDNtE0PRjlMzA1SFgWiOBYFJR5I2LSkdh9QB1K9wuesLx
         kLx5sdHxi4jM7mqmbVe553KJHeiVxOjDOLEfW5wcGkvLzzNKcZbbXKMFjPNa6xHAPRDA
         yIlA==
X-Gm-Message-State: ANoB5pksTZD7LkMXkRB/8AJD+zznhSzuPnWI1mQ9Xwg6N04wdRf3SDmV
        6vv0y/wVUjw7ksY2bNlm9jrNm6bxPS3W8PTUG/uPig==
X-Google-Smtp-Source: AA0mqf6CSBKb94IPoCcm+xSjSyDk8HQzlLqtgeC73p37O19VDJlSuSPRkEs2jKz100PvmAvVzrEoal+pXKpfuI+EVOM=
X-Received: by 2002:a63:224c:0:b0:46b:8e9:747 with SMTP id t12-20020a63224c000000b0046b08e90747mr57229802pgm.365.1670276299754;
 Mon, 05 Dec 2022 13:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20221204231650.2604587-1-gary@garyguo.net>
In-Reply-To: <20221204231650.2604587-1-gary@garyguo.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 5 Dec 2022 13:38:08 -0800
Message-ID: <CAKwvOdkDhxaURyV81Z6RNd4ekV8sGAckr7XDnU7rk_sWR23-8A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: make compiler-builtin stubs non-global
To:     Gary Guo <gary@garyguo.net>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Dec 4, 2022 at 3:17 PM Gary Guo <gary@garyguo.net> wrote:
>
> Currently we define a number of stubs for compiler-builtin intrinsics
> that compiled libcore generates. The defined stubs are weak so they will
> not conflict with genuine implementation of these intrinsics, but their
> effect is global and will cause non-libcore code that accidently
> generate these intrinsics calls compile and bug on runtime.
>
> Instead of defining a stub that can affect all code, this patch uses
> objcopy's `--redefine-sym` flag to redirect these calls (from libcore
> only) to a prefixed version (e.g. redirect `__multi3` to `__rust_multi3`),
> so we can define panciking stubs that are only visible to libcore.
>
> This patch was previous discussed on GitHub.
> Link: https://github.com/Rust-for-Linux/linux/pull/779
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Thank you for addressing my feedback!

Link: https://lore.kernel.org/lkml/CAKwvOdkc0Qhwu=gfe1+H23TnAa6jnO6A3ZCO687dH6mSrATmDA@mail.gmail.com/
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> diff --git a/rust/Makefile b/rust/Makefile
> index ff70c4c916f8..aed6f7eca36f 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -359,8 +359,22 @@ rust-analyzer:
>         $(Q)$(srctree)/scripts/generate_rust_analyzer.py $(srctree) $(objtree) \
>                 $(RUST_LIB_SRC) > $(objtree)/rust-project.json
>
> +redirect-intrinsics = \
> +       __eqsf2 __gesf2 __lesf2 __nesf2 __unordsf2 \
> +       __unorddf2 \
> +       __muloti4 __multi3 \
> +       __udivmodti4 __udivti3 __umodti3
> +
> +ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
> +       # These intrinsics are defined for ARM64 and RISCV64
> +       redirect-intrinsics += \
> +               __ashrti3 \
> +               __ashlti3 __lshrti3
> +endif
> +
>  $(obj)/core.o: private skip_clippy = 1
>  $(obj)/core.o: private skip_flags = -Dunreachable_pub
> +$(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
>  $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
>  $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs $(obj)/target.json FORCE
>         $(call if_changed_dep,rustc_library)
> diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
> index f8f39a3e6855..5f833dcca131 100644
> --- a/rust/compiler_builtins.rs
> +++ b/rust/compiler_builtins.rs
> @@ -28,7 +28,7 @@ macro_rules! define_panicking_intrinsics(
>      ($reason: tt, { $($ident: ident, )* }) => {
>          $(
>              #[doc(hidden)]
> -            #[no_mangle]
> +            #[export_name = concat!("__rust", stringify!($ident))]
>              pub extern "C" fn $ident() {
>                  panic!($reason);
>              }
> @@ -61,3 +61,6 @@ define_panicking_intrinsics!("`u128` should not be used", {
>      __udivti3,
>      __umodti3,
>  });
> +
> +// NOTE: if you are adding a new intrinsic is added here, you should also add it to
> +// `redirect-intrinsics` in `rust/Makefile`.
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
