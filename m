Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68335C433FE
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Sep 2022 13:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234828AbiI2NQd (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Sep 2022 09:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234574AbiI2NQc (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Sep 2022 09:16:32 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55EA1181FE
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Sep 2022 06:16:28 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id p5so1486378ljc.13
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Sep 2022 06:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=MIMO2EoFdLbL5U6x7NSBMW/wOqpfK6/Cuc9F2tOvhQY=;
        b=XwpeR85rulaWHqBGeI49rQ/7JcWCyT2FmU3vt972dejHIlmVSPR3zow8HaBKc3W2p/
         8tEMdHawyURlkOE8E+7triXZ+PCOxHkhEc6o3yybPerFwU/zd5SsRAXTiWtt74YmMASx
         CLQOlwrNy9HUMJlz802Qxz9+OfFjfsJSgdNbd0lTwkRlJIRlsm+htRlbSkIZHks+zJ1w
         N4WeFRfpusBIMP0VvB/mtUQjXQzGaX07rYrsE5I3o3JYrT1NOCG3yuD0nLeI5Nmr9nBK
         bMw+tXbgW6cUch221sdBuA+L91YAeVeaoUiEiFHOvwzGdPGRMWvK7kW4a2yfaozLMza2
         p2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=MIMO2EoFdLbL5U6x7NSBMW/wOqpfK6/Cuc9F2tOvhQY=;
        b=LuYBtqU8GLx4N1PVV7N9Up/GGEKE7My4Pmdmi8aUZ0brEVCJpAYO5byHx2lkeuNsp+
         lHVW05ij6K2JUWpuLc2spLyonuYYsRogvuT7tB3kiROdk/z2WdNoS1moAqW0alVXQqqA
         o8kgDOmzcI+2M1DkDnCYyvx+sBIaAkCwpjDSLktRf20tVXD/qxAA6y8ES9blfVpr5+pI
         5fGoGb1DknYGvUUbEYFL99BZY0WBrVwNLHRO2h22rU1Sri/q33xcMOfUdP11JsR7+u/E
         qc+BxDBxz83OBqZQmYAonbuTca/XsrWWshiAM6hZY1WR2myioD6WW28/ZVKj1Ol2j9x8
         j9cw==
X-Gm-Message-State: ACrzQf2a3D1zHsBhdGYVrSlRmfiBLo2t7aTuIj3g2pgmCNIvGJyY5nxu
        4ZdA2OpcSpVu5iWQ7WFOS4Cn05LijD6hCF7grgk/I6B53sAnJQynSDQ=
X-Google-Smtp-Source: AMsMyM75RH4BOStXWHVQkW7PPEb1eEVL6uU4Sb13nrLDIr6APfVFLsXI2joZuL9KL3InyHPd8JM9H3QhUW2y9xcwtrQ=
X-Received: by 2002:a2e:5344:0:b0:26c:417b:aa78 with SMTP id
 t4-20020a2e5344000000b0026c417baa78mr1185029ljd.298.1664457387018; Thu, 29
 Sep 2022 06:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220929130435.4bjnk27ksl63f2pq@gpm.stappers.nl> <CALkjhPrJqdeCj0sm0O-qa8oFDkAiBZqJkJETL2vU6TnaMUTwMA@mail.gmail.com>
In-Reply-To: <CALkjhPrJqdeCj0sm0O-qa8oFDkAiBZqJkJETL2vU6TnaMUTwMA@mail.gmail.com>
From:   Mohammed Billoo <mab@mab-labs.com>
Date:   Thu, 29 Sep 2022 09:16:16 -0400
Message-ID: <CALkjhPqrTYyyeg7LaQAYSk0sZhJo2kQOiw5wrNrKYz0zpLrkgw@mail.gmail.com>
Subject: Re: scripts/Kconfig.include:40: linker 'ld.lld' not found
To:     Geert Stappers <stappers@stappers.nl>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Geert,

I remember experiencing this issue. I don't remember what I needed to
do to work around it. Instead, I created a Docker container for Rust
kernel development that has been working well for me so far. You can
find it here: https://github.com/mabembedded/dockerfiles/blob/main/Dockerfile.rust.

Best,
Mohammed

> On Thu, Sep 29, 2022 at 9:04 AM Geert Stappers <stappers@stappers.nl> wrote:
>>
>> Hello,
>>
>> How to deal
>> with "scripts/Kconfig.include:40: linker 'ld.lld' not found"?
>>
>> I encountered that message while
>> following https://github.com/Rust-for-Linux/linux/blob/rust/Documentation/rust/quick-start.rst
>>
>> Text belong is from a "rustup install" on a Debian system.
>>
>> stappers@hislaptop:/usr/src/linux/torvalds
>> $ make LLVM=1 rustavailable
>> Rust is available!
>> stappers@hislaptop:/usr/src/linux/torvalds
>> $ rustup override set $(scripts/min-tool-version.sh rustc)
>> info: using existing install for '1.62.0-x86_64-unknown-linux-gnu'
>> info: override toolchain for '/usr/src/linux/torvalds' set to '1.62.0-x86_64-unknown-linux-gnu'
>>
>>   1.62.0-x86_64-unknown-linux-gnu unchanged - rustc 1.62.0 (a8314ef7d 2022-06-27)
>>
>> stappers@hislaptop:/usr/src/linux/torvalds
>> $ cargo install --locked --version $(scripts/min-tool-version.sh bindgen) bindgen
>>      Ignored package `bindgen v0.56.0` is already installed, use --force to override
>> stappers@hislaptop:/usr/src/linux/torvalds
>> $ make menuconfig LLVM=1
>> scripts/Kconfig.include:40: linker 'ld.lld' not found
>> make[1]: *** [scripts/kconfig/Makefile:48: menuconfig] Error 1
>> make: *** [Makefile:693: menuconfig] Error 2
>> stappers@hislaptop:/usr/src/linux/torvalds
>> $ make LLVM=1
>>   SYNC    include/config/auto.conf.cmd
>>   HOSTCC  scripts/kconfig/conf.o
>>   HOSTLD  scripts/kconfig/conf
>> scripts/Kconfig.include:40: linker 'ld.lld' not found
>> make[2]: *** [scripts/kconfig/Makefile:77: syncconfig] Error 1
>> make[1]: *** [Makefile:693: syncconfig] Error 2
>> make: *** [Makefile:795: include/config/auto.conf.cmd] Error 2
>> stappers@hislaptop:/usr/src/linux/torvalds
>> $ LANG=C dpkg -l '*llvm*' | cut -b -100
>> Desired=Unknown/Install/Remove/Purge/Hold
>> | Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
>> |/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
>> ||/ Name                 Version       Architecture Description
>> +++-====================-=============-============-================================================
>> ii  libllvm11:amd64      1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies, run
>> ii  libllvm13:amd64      1:13.0.1-4    amd64        Modular compiler and toolchain technologies, run
>> ii  libllvm14:amd64      1:14.0.6-2    amd64        Modular compiler and toolchain technologies, run
>> ii  llvm                 1:13.0-54     amd64        Low-Level Virtual Machine (LLVM)
>> ii  llvm-11              1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies
>> ii  llvm-11-dev          1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies, lib
>> un  llvm-11-doc          <none>        <none>       (no description available)
>> ii  llvm-11-linker-tools 1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies
>> ii  llvm-11-runtime      1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies, IR
>> ii  llvm-11-tools        1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies, too
>> ii  llvm-13              1:13.0.1-4    amd64        Modular compiler and toolchain technologies
>> ii  llvm-13-dev          1:13.0.1-4    amd64        Modular compiler and toolchain technologies, lib
>> un  llvm-13-doc          <none>        <none>       (no description available)
>> ii  llvm-13-linker-tools 1:13.0.1-4    amd64        Modular compiler and toolchain technologies - Pl
>> ii  llvm-13-runtime      1:13.0.1-4    amd64        Modular compiler and toolchain technologies, IR
>> ii  llvm-13-tools        1:13.0.1-4    amd64        Modular compiler and toolchain technologies, too
>> ii  llvm-14              1:14.0.6-2    amd64        Modular compiler and toolchain technologies
>> ii  llvm-14-dev          1:14.0.6-2    amd64        Modular compiler and toolchain technologies, lib
>> un  llvm-14-doc          <none>        <none>       (no description available)
>> ii  llvm-14-linker-tools 1:14.0.6-2    amd64        Modular compiler and toolchain technologies - Pl
>> ii  llvm-14-runtime      1:14.0.6-2    amd64        Modular compiler and toolchain technologies, IR
>> ii  llvm-14-tools        1:14.0.6-2    amd64        Modular compiler and toolchain technologies, too
>> ii  llvm-runtime:amd64   1:13.0-54     amd64        Low-Level Virtual Machine (LLVM), bytecode inter
>> stappers@hislaptop:/usr/src/linux/torvalds
>> $
>>
>>
>> Groeten
>> Geert Stappers
>> --
>> Silence is hard to parse
