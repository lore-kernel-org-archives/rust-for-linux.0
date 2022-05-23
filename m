Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30175C433EF
	for <rust-for-linux@archiver.kernel.org>; Mon, 23 May 2022 20:28:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbiEWU2f (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 23 May 2022 16:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiEWU2f (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 23 May 2022 16:28:35 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BA0F2F
        for <rust-for-linux@vger.kernel.org>; Mon, 23 May 2022 13:28:33 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id h8so18558534ljb.6
        for <rust-for-linux@vger.kernel.org>; Mon, 23 May 2022 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=/VEWPcqqEkSHc6PyYOafG+lrnyvP0Bb7ACOYHc+zmT8=;
        b=nBjkH9GeglhciEIG2sRV8mcOxSqMRkn7OaoBj4aJKaPpe48QnJE4ftj1SHLQ2XLJO+
         H3PkyywTQbLVNuDvb1Xnq+u35oLg6bpTuo+6X8fdr4E/VqqcWNcPUxK0o1xigtVvbwHj
         H/mebXFvUUF3P4PPmkw/SNpplMRyV3wL7AuIcmrkyCuS/i41kdDjEDqo9buYKbHe6stK
         bd3J06GkH6L8A/dFc++6H+BHN6hIaVy1y4xW33vTzYLsyx3DbwPyymvILmg+sZLLUz55
         y1jY+kVAiuFCZXvzoFm5mlf4q2HeQv+GOH8I4eqJCTxwlY/yDdMVFQfuTL16UsLysP7x
         xJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/VEWPcqqEkSHc6PyYOafG+lrnyvP0Bb7ACOYHc+zmT8=;
        b=2+0W7UXAcmZcM+oZwjnmXz59l240kkbytR45szLH7nmJEjKXYQWTuR6rSWSm+BPWWe
         HRT/Du3eLQOyfIO6/9wp7L16p8h4Xc2D+nyBDnNmdbic85xgNh2fwuEfyEsdeD7at0lj
         IGCTipj4NcqlbQLmJ9JN2mSsayQSczs4ZHRAfgSreuRbfFZDlvx9HriS9rT0AbwIBbFd
         2TBehMwACqAQi+HmFAJt5q2JSSQSfQI4bwEpJ7rDla04dZ3XixqOZDBALeWnqeEBfDoH
         R9cMZlVX+bGnQ9g8j++Gj/7XFeCgvXpfOs4XAZ85/rMrCAJrP6+Ws8wgkCf+oaSjRY4f
         8c2A==
X-Gm-Message-State: AOAM532GbrZESqxHaTPAB1bBgTAihiJE7iZORD61W0C0WnzY2GH4MZ4/
        iBzOsv7izOpecXAX129h0ZEGgjpU5fYhxQFZphM/8FuRQS4aaw==
X-Google-Smtp-Source: ABdhPJzvoRBxTbJ7RvN8ZQonJUiyJ/IO8pv91HbcDsVQkJUdigq2IRdKHs6PxPyinjIKnmy6nUjxGaCgXrUbLS/6HF0=
X-Received: by 2002:a2e:98c3:0:b0:253:e0e1:20 with SMTP id s3-20020a2e98c3000000b00253e0e10020mr8613275ljj.26.1653337711358;
 Mon, 23 May 2022 13:28:31 -0700 (PDT)
MIME-Version: 1.0
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 23 May 2022 13:28:19 -0700
Message-ID: <CAKwvOdm5JT4wbdQQYuW+RT07rCi6whGBM2iUAyg8A1CmLXG6Nw@mail.gmail.com>
Subject: help installing the correct version of bindgen
To:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Re: https://github.com/KyleMayes/clang-sys/issues/138

via the documentation patch
https://lore.kernel.org/lkml/20220523020209.11810-21-ojeda@kernel.org/

So after a defconfig, I see in my .config:
CONFIG_HAVE_RUST=y
but not
RUST_IS_AVAILABLE=y

$ make LLVM=1 -j72 rustavailable
make: *** [Makefile:1802: rustavailable] Error 1

$ cargo install --locked --version $(scripts/min-tool-version.sh
bindgen) bindgen
...
     Ignored package `bindgen v0.56.0` is already installed, use
--force to override

$ RUST_BACKTRACE=1 bindgen scripts/rust-is-available-bindgen-libclang.h
thread 'main' panicked at 'called `Result::unwrap()` on an `Err`
value: "could not run executable `/android0/llvm-project/clang`:
Permission denied (os error 13)"',
/usr/local/google/home/ndesaulniers/.cargo/registry/src/github.com-1ecc6299db9ec823/clang-sys-1.0.3/src/support.rs:165:58
stack backtrace:
   0: rust_begin_unwind
             at
/rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/std/src/panicking.rs:584:5
   1: core::panicking::panic_fmt
             at
/rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/panicking.rs:143:14
   2: core::result::unwrap_failed
             at
/rustc/7737e0b5c4103216d6fd8cf941b7ab9bdbaace7c/library/core/src/result.rs:1749:5
   3: clang_sys::support::run_clang
   4: clang_sys::support::parse_version
   5: clang_sys::support::Clang::find
   6: bindgen::Builder::generate
   7: bindgen::main
note: Some details are omitted, run with `RUST_BACKTRACE=full` for a
verbose backtrace.

So it looks like bindgen is using clang-sys-1.0.3?
And it's finding my source code checkout of clang from the llvm-project.

Looking at https://github.com/rust-lang/rust-bindgen/tree/11ae35089e4748b7e2a6f50f6bef7709af72e724
specifically
https://github.com/rust-lang/rust-bindgen/blob/11ae35089e4748b7e2a6f50f6bef7709af72e724/Cargo.toml#L52
it just says "use version 1". But the latest version of clang-sys is
1.3.2 according to https://crates.io/crates/clang-sys.

What gives?
-- 
Thanks,
~Nick Desaulniers
