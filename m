Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2EBC433F5
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Sep 2022 13:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234630AbiI2NOu (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Sep 2022 09:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbiI2NOs (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Sep 2022 09:14:48 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03327175B4
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Sep 2022 06:14:46 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id g1-20020a17090a708100b00203c1c66ae3so1295747pjk.2
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Sep 2022 06:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PHgJxIDejxma9NcSDOnceNv2ehfmWgBW7Hu67a70hEA=;
        b=jOwvdqXlLbrBXK8joByfVAnt1/jtSIOK1H5tPSFd/YeJrny2LFiEnRxWYDM3c6PHW5
         3G0c+5c7aR9dwRflmofvdebb19X37szBUVRYLIumEUIJDHJ1kAajFKHgHzoxDZqxcGoE
         xCLBYhnmp7tzo53qosQzlsuNm8dgRrEiX7e5CXzse/KLw1j9OOW7V02dSRlKJjlJI7rT
         8Xl/BidN/Tp5/gzvuSQe0F4qhWCXrf3WE+x7GOleH9hnZW7LuMIKrzk4XIDoNNKZ5yvs
         Sr5tufqpBGOJYEZBsQLJdEtGze/RwW25EcK4JiQO5PITFv+WZgU3+843i5Y0OZOEGlhk
         fmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PHgJxIDejxma9NcSDOnceNv2ehfmWgBW7Hu67a70hEA=;
        b=QTEvOUx8TqKoX7Xmd94xyO5Bg/MwH5PZKc32bNpIrvwV9M4u51P0T+32k54d4Xz/Uy
         AeQDk8pJqi702g0Q5I2S+Re06ONPW6rYOaw+SVPldCgpQDSt1hwitU0PLkpYD+vQTmmr
         79rXXrJHw+AKkxj/Qw0F9Aia0SxFUnCXWADBmiZ1cTIoxSqGwWQ14xdmkjkPjkr2gffQ
         Kklob9t+lYiMZfCLOkFiC+SWGy35o8f435Awl2IkWeGTuXZJm8ByKTrddhKY0uPN/H7v
         ZuQjML/12mYGW6jQ+SQQbkU07GVXJO3YEEObqvaJe4EcODbcJWizYXd7sSgSaCEA0qIe
         9xaQ==
X-Gm-Message-State: ACrzQf1d0dLbC4IJOVzzcBdVUyW5Ckiy7f0H8ei5bzA1gmbnPSSBKW9a
        n+DW3ydmVpOu7O1OZ+zcz3OzKoXpUb+QcRgtTJv3/SHLf6g=
X-Google-Smtp-Source: AMsMyM5HlOlsWI3veHzsHlTxSjjhF3kHBiaEEZPT4PV8VJGprV6wBEhZ6DxXJ3KYERuIPH6SLNJZdfqCMiiNxvktZpY=
X-Received: by 2002:a17:90b:1d8f:b0:203:bb53:62b5 with SMTP id
 pf15-20020a17090b1d8f00b00203bb5362b5mr3832343pjb.74.1664457286318; Thu, 29
 Sep 2022 06:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220929130435.4bjnk27ksl63f2pq@gpm.stappers.nl>
In-Reply-To: <20220929130435.4bjnk27ksl63f2pq@gpm.stappers.nl>
From:   Wedson Almeida Filho <wedsonaf@gmail.com>
Date:   Thu, 29 Sep 2022 14:14:35 +0100
Message-ID: <CANeycqpnOC2GjmbNqtm7k3ZKZ5JjQuPY6CXCi1QxJnrdVPZxFQ@mail.gmail.com>
Subject: Re: scripts/Kconfig.include:40: linker 'ld.lld' not found
To:     Geert Stappers <stappers@stappers.nl>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hey Geert,

On Thu, 29 Sept 2022 at 14:11, Geert Stappers <stappers@stappers.nl> wrote:
>
> Hello,
>
> How to deal
> with "scripts/Kconfig.include:40: linker 'ld.lld' not found"?

Installing the 'lld' package with apt should make the error go away.

Cheers,
-Wedson

>
> I encountered that message while
> following https://github.com/Rust-for-Linux/linux/blob/rust/Documentation/rust/quick-start.rst
>
> Text belong is from a "rustup install" on a Debian system.
>
> stappers@hislaptop:/usr/src/linux/torvalds
> $ make LLVM=1 rustavailable
> Rust is available!
> stappers@hislaptop:/usr/src/linux/torvalds
> $ rustup override set $(scripts/min-tool-version.sh rustc)
> info: using existing install for '1.62.0-x86_64-unknown-linux-gnu'
> info: override toolchain for '/usr/src/linux/torvalds' set to '1.62.0-x86_64-unknown-linux-gnu'
>
>   1.62.0-x86_64-unknown-linux-gnu unchanged - rustc 1.62.0 (a8314ef7d 2022-06-27)
>
> stappers@hislaptop:/usr/src/linux/torvalds
> $ cargo install --locked --version $(scripts/min-tool-version.sh bindgen) bindgen
>      Ignored package `bindgen v0.56.0` is already installed, use --force to override
> stappers@hislaptop:/usr/src/linux/torvalds
> $ make menuconfig LLVM=1
> scripts/Kconfig.include:40: linker 'ld.lld' not found
> make[1]: *** [scripts/kconfig/Makefile:48: menuconfig] Error 1
> make: *** [Makefile:693: menuconfig] Error 2
> stappers@hislaptop:/usr/src/linux/torvalds
> $ make LLVM=1
>   SYNC    include/config/auto.conf.cmd
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTLD  scripts/kconfig/conf
> scripts/Kconfig.include:40: linker 'ld.lld' not found
> make[2]: *** [scripts/kconfig/Makefile:77: syncconfig] Error 1
> make[1]: *** [Makefile:693: syncconfig] Error 2
> make: *** [Makefile:795: include/config/auto.conf.cmd] Error 2
> stappers@hislaptop:/usr/src/linux/torvalds
> $ LANG=C dpkg -l '*llvm*' | cut -b -100
> Desired=Unknown/Install/Remove/Purge/Hold
> | Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
> |/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
> ||/ Name                 Version       Architecture Description
> +++-====================-=============-============-================================================
> ii  libllvm11:amd64      1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies, run
> ii  libllvm13:amd64      1:13.0.1-4    amd64        Modular compiler and toolchain technologies, run
> ii  libllvm14:amd64      1:14.0.6-2    amd64        Modular compiler and toolchain technologies, run
> ii  llvm                 1:13.0-54     amd64        Low-Level Virtual Machine (LLVM)
> ii  llvm-11              1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies
> ii  llvm-11-dev          1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies, lib
> un  llvm-11-doc          <none>        <none>       (no description available)
> ii  llvm-11-linker-tools 1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies
> ii  llvm-11-runtime      1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies, IR
> ii  llvm-11-tools        1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies, too
> ii  llvm-13              1:13.0.1-4    amd64        Modular compiler and toolchain technologies
> ii  llvm-13-dev          1:13.0.1-4    amd64        Modular compiler and toolchain technologies, lib
> un  llvm-13-doc          <none>        <none>       (no description available)
> ii  llvm-13-linker-tools 1:13.0.1-4    amd64        Modular compiler and toolchain technologies - Pl
> ii  llvm-13-runtime      1:13.0.1-4    amd64        Modular compiler and toolchain technologies, IR
> ii  llvm-13-tools        1:13.0.1-4    amd64        Modular compiler and toolchain technologies, too
> ii  llvm-14              1:14.0.6-2    amd64        Modular compiler and toolchain technologies
> ii  llvm-14-dev          1:14.0.6-2    amd64        Modular compiler and toolchain technologies, lib
> un  llvm-14-doc          <none>        <none>       (no description available)
> ii  llvm-14-linker-tools 1:14.0.6-2    amd64        Modular compiler and toolchain technologies - Pl
> ii  llvm-14-runtime      1:14.0.6-2    amd64        Modular compiler and toolchain technologies, IR
> ii  llvm-14-tools        1:14.0.6-2    amd64        Modular compiler and toolchain technologies, too
> ii  llvm-runtime:amd64   1:13.0-54     amd64        Low-Level Virtual Machine (LLVM), bytecode inter
> stappers@hislaptop:/usr/src/linux/torvalds
> $
>
>
> Groeten
> Geert Stappers
> --
> Silence is hard to parse
