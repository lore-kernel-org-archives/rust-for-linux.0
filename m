Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D8BC433F5
	for <rust-for-linux@archiver.kernel.org>; Tue, 24 May 2022 22:28:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236463AbiEXW2q (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 24 May 2022 18:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242226AbiEXW2e (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 24 May 2022 18:28:34 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C1A8A04B
        for <rust-for-linux@vger.kernel.org>; Tue, 24 May 2022 15:28:31 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id t25so33166049lfg.7
        for <rust-for-linux@vger.kernel.org>; Tue, 24 May 2022 15:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ou3gVfp1JnsGJEqH3xVqxabfWJhdyuBvkyNWkoDGBs=;
        b=H1+rJvAjsnqWnGt2eNlx+8nLmT33MVD0OximeDESyLfNeib5/XEHcqY9jFP7JBrMh1
         1A7BPDff1ZQ89rmmtC5/IfffGT/dQSIQdMej1T6cZHd213yZJbNMOVkJO8pjdn5TKMkX
         IoatB3up5d+ucby+0vB+XNCoj1otghATFgnF6Uf0ZxWSN+TeH4jZaozw+OBlkn0cZiMI
         LZP8E7ztOr6UCE+l3DoVYiFuySD0ETLd8aAHTemi+ykKBrA5pDl+pfi/aCNfQ7Cm8FNG
         +c+uejBLwYRE9H8XrZNi+IaeUbz6R0JFtVsbhDUa4pZ5akxET8PjNqYN/zjY9b2V0jNQ
         SPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ou3gVfp1JnsGJEqH3xVqxabfWJhdyuBvkyNWkoDGBs=;
        b=jcAmuK7I3eI109es7G/m6uh+iSP8R/+vhBSPrM0RPmK26124auuiA4BXf8wXyWVHVM
         eoK1ECheNOfTCtVglBSfZ/BhzP4gD0aZN/CPr6YfWRavRnPvuLkSOJn6+mWP5u3E/a5Z
         TQEQr8jBQdbDMn1aCZc+iCebzZyG3nbjuNn2oHaqcgtH52Z4tJa5nfk7lcjAdDh0KPev
         /3gwMIpiH2cgmu3EKaeT4CWA3p7l+R03puAfmDwT8ucwlAgEeRC5cBEGWJE+IxRxkFWN
         y1NdQwRwwplz7z21gX9thWfHsD9e2FKXEPobs8O9yESQAhec/qkkzOpUu17wLoM8dUNN
         rk5Q==
X-Gm-Message-State: AOAM530Aa3riJCO1+8QmmFUpNnxtDSZKyDwXMdRkdu/d4gOZ+M1v2v+R
        9wh9QqAdSWjvXuk/hhbESSe3Ws74VcuOIIhPu9dWxrMEvrT7wA==
X-Google-Smtp-Source: ABdhPJyTxJVma7x5P0tXPYLJbhf6WXgzfi45Wq2et/XnMT5Lb877IWhSQdDdNVCvEMpFRY5+5n/Mh0q/fia+zbtqI8M=
X-Received: by 2002:a05:6512:c1e:b0:478:78d9:d529 with SMTP id
 z30-20020a0565120c1e00b0047878d9d529mr7115803lfu.626.1653431309291; Tue, 24
 May 2022 15:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdm5JT4wbdQQYuW+RT07rCi6whGBM2iUAyg8A1CmLXG6Nw@mail.gmail.com>
 <CANiq72=dLnCpCLOKJ6+x+D0AV=tFNyy4hUEjd6KCOCw+eWbPkA@mail.gmail.com>
In-Reply-To: <CANiq72=dLnCpCLOKJ6+x+D0AV=tFNyy4hUEjd6KCOCw+eWbPkA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 May 2022 15:28:17 -0700
Message-ID: <CAKwvOdkm+CQ3rd6YF_iJOegjZPUuwPfGVp7DxB6JozsKZa5npQ@mail.gmail.com>
Subject: Re: help installing the correct version of bindgen
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, May 24, 2022 at 5:08 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, May 23, 2022 at 10:28 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > $ make LLVM=1 -j72 rustavailable
> > make: *** [Makefile:1802: rustavailable] Error 1
>
> I think we could have a message about `bindgen` being broken here if
> calling it completely fails.

There is a little bit of error handling; for my issue most of the
error message gets swallowed as shown above.  With the below diff:

```
diff --git a/Makefile b/Makefile
index e1ca0ef1ac26..386fa6c9e462 100644
--- a/Makefile
+++ b/Makefile
@@ -1800,7 +1800,7 @@ $(DOC_TARGETS):
 # "Is Rust available?" target
 PHONY += rustavailable
 rustavailable:
-       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust-is-available.sh -v
&& echo >&2 "Rust is available!"
+       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust-is-available.sh -v
&& echo >&2 "Rust is available!" || echo -e >&2 "Rust is not
available, try manually running\n'BINDGEN=bindgen RUSTC=rustc
scripts/rust-is-available.sh'" && exit 1

 # Documentation target
 #
diff --git a/scripts/rust-is-available.sh b/scripts/rust-is-available.sh
index 6bd395167d0f..9b54886d10f9 100755
--- a/scripts/rust-is-available.sh
+++ b/scripts/rust-is-available.sh
@@ -99,6 +99,9 @@ if [ "$1" = -v ] && [
"$rust_bindings_generator_cversion" -gt "$rust_bindings_ge
        echo >&2 "***"
 fi

+# Check that bindgen works.
+LC_ALL=C "$BINDGEN" $(dirname
$0)/rust-is-available-bindgen-libclang.h >/dev/null
+
 # Check that the `libclang` used by the Rust bindings generator is suitable.
 bindgen_libclang_version=$( \
        LC_ALL=C "$BINDGEN" $(dirname
$0)/rust-is-available-bindgen-libclang.h 2>&1 >/dev/null \
```

I instead get a clearer picture of what's going wrong:
```
$ make LLVM=1 -j72 rustavailable
thread 'main' panicked at 'called `Result::unwrap()` on an `Err`
value: "could not run executable `/android0/llvm-project/clang`:
Permission denied (os error 13)"',
/usr/local/google/home/ndesaulniers/.cargo/registry/src/github.com-1ecc6299db9ec823/clang-sys-1.0.3/src/support.rs:165:58
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
Rust is not available, try manually running
'BINDGEN=bindgen RUSTC=rustc scripts/rust-is-available.sh'
make: *** [Makefile:1803: rustavailable] Error 1
```
compare that with the initial output I pasted.

>
> > So it looks like bindgen is using clang-sys-1.0.3?
> > And it's finding my source code checkout of clang from the llvm-project.
> >
> > Looking at https://github.com/rust-lang/rust-bindgen/tree/11ae35089e4748b7e2a6f50f6bef7709af72e724
> > specifically
> > https://github.com/rust-lang/rust-bindgen/blob/11ae35089e4748b7e2a6f50f6bef7709af72e724/Cargo.toml#L52
> > it just says "use version 1". But the latest version of clang-sys is
> > 1.3.2 according to https://crates.io/crates/clang-sys.
> >
> > What gives?
>
> `cargo install --locked` respects the Cargo.lock file, which indeed says 1.0.3:
>
>     https://github.com/rust-lang/rust-bindgen/blob/v0.56.0/Cargo.lock#L83

Ah, the lock file has the specific version. Ok

>
> When you installed the latest bindgen as you mention in the issue,
> then you should see 1.2.0 (if you used `--locked`):
>
>     https://github.com/rust-lang/rust-bindgen/blob/v0.59.2/Cargo.lock#L80

If I apply:
```
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index f1e8358ec19a..64ba8f20de22 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -34,7 +34,7 @@ rustc)
        echo 1.60.0
        ;;
 bindgen)
-       echo 0.56.0
+       echo 0.59.2
        ;;
 *)
        echo "$1: unknown tool" >&2
```
then do
$ cargo install --locked --version $(scripts/min-tool-version.sh
bindgen) bindgen
...
    Replaced package `bindgen v0.56.0` with `bindgen v0.59.2`
(executable `bindgen`)

$ make LLVM=1 -j72 rustavailable
thread 'main' panicked at 'called `Result::unwrap()` on an `Err`
value: "could not run executable `/android0/llvm-project/clang`:
Permission denied (os error 13)"',
/usr/local/google/home/ndesaulniers/.cargo/registry/src/github.com-1ecc6299db9ec823/clang-sys-1.2.0/src/support.rs:202:58
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
Rust is not available, try manually running
'BINDGEN=bindgen RUSTC=rustc scripts/rust-is-available.sh'
make: *** [Makefile:1803: rustavailable] Error 1

So it looks like the error is not fixed in 1.2.0 release of clang-sys.
Left more comments in
https://github.com/KyleMayes/clang-sys/issues/138.

>
> Hopefully this clarifies things a bit...
>
> > And it's finding my source code checkout of clang from the llvm-project.
>
> Have you tried tweaking the paths with
> https://github.com/KyleMayes/clang-sys#environment-variables?
>
> For instance, try to point it to the real executable with
> CLANG_PATH=/android0/llvm-project/llvm/build/bin/clang etc.

I'd like to find out why dependencies are borked first, before
resorting to env vars.

$ CLANG_PATH=$(which clang) make LLVM=1 -j72 rustavailable
./scripts/rust-is-available-bindgen-libclang.h:2:9: warning: clang
version 15.0.0 (git@github.com:llvm/llvm-project.git
28c9ba577295221a3206defc58cb940833d87205) [-W#pragma-messages], err:
false
Rust is available!

does seem to work though.

$ CLANG_PATH=$(which clang) make LLVM=1 -j72 -s
./scripts/rust-is-available-bindgen-libclang.h:2:9: warning: clang
version 15.0.0 (git@github.com:llvm/llvm-project.git
28c9ba577295221a3206defc58cb940833d87205) [-W#pragma-messages], err:
false
error[E0063]: missing field `uring_cmd` in initializer of
`bindings_raw::file_operations`
   --> rust/kernel/file.rs:468:47
    |
468 |     const VTABLE: bindings::file_operations = bindings::file_operations {
    |
^^^^^^^^^^^^^^^^^^^^^^^^^ missing `uring_cmd`

error: aborting due to previous error

For more information about this error, try `rustc --explain E0063`.
make[1]: *** [rust/Makefile:396: rust/kernel.o] Error 1
make: *** [Makefile:1291: prepare] Error 2

better than nothing. :) (I just reapplied your series on top of
a6b450573b912316ad36262bfc70e7c3870c56d1)
-- 
Thanks,
~Nick Desaulniers
