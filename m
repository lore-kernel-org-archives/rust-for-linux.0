Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278EEC433F5
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Sep 2022 13:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235477AbiI2NEq (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Sep 2022 09:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235578AbiI2NEn (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Sep 2022 09:04:43 -0400
Received: from hop.stappers.nl (hop.stappers.nl [IPv6:2a02:2308:0:14e::686f:7030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD4DD52
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Sep 2022 06:04:38 -0700 (PDT)
Received: from gpm.stappers.nl (gpm.stappers.nl [IPv6:2a02:a46d:659e:1::696e:626f])
        by hop.stappers.nl (Postfix) with ESMTP id 1F56D2000F
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Sep 2022 13:04:36 +0000 (UTC)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id B8F2E304049; Thu, 29 Sep 2022 15:04:35 +0200 (CEST)
Date:   Thu, 29 Sep 2022 15:04:35 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     rust-for-linux@vger.kernel.org
Subject: scripts/Kconfig.include:40: linker 'ld.lld' not found
Message-ID: <20220929130435.4bjnk27ksl63f2pq@gpm.stappers.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello,

How to deal
with "scripts/Kconfig.include:40: linker 'ld.lld' not found"?

I encountered that message while
following https://github.com/Rust-for-Linux/linux/blob/rust/Documentation/rust/quick-start.rst

Text belong is from a "rustup install" on a Debian system.

stappers@hislaptop:/usr/src/linux/torvalds
$ make LLVM=1 rustavailable
Rust is available!
stappers@hislaptop:/usr/src/linux/torvalds
$ rustup override set $(scripts/min-tool-version.sh rustc)
info: using existing install for '1.62.0-x86_64-unknown-linux-gnu'
info: override toolchain for '/usr/src/linux/torvalds' set to '1.62.0-x86_64-unknown-linux-gnu'

  1.62.0-x86_64-unknown-linux-gnu unchanged - rustc 1.62.0 (a8314ef7d 2022-06-27)

stappers@hislaptop:/usr/src/linux/torvalds
$ cargo install --locked --version $(scripts/min-tool-version.sh bindgen) bindgen
     Ignored package `bindgen v0.56.0` is already installed, use --force to override
stappers@hislaptop:/usr/src/linux/torvalds
$ make menuconfig LLVM=1
scripts/Kconfig.include:40: linker 'ld.lld' not found
make[1]: *** [scripts/kconfig/Makefile:48: menuconfig] Error 1
make: *** [Makefile:693: menuconfig] Error 2
stappers@hislaptop:/usr/src/linux/torvalds
$ make LLVM=1
  SYNC    include/config/auto.conf.cmd
  HOSTCC  scripts/kconfig/conf.o
  HOSTLD  scripts/kconfig/conf
scripts/Kconfig.include:40: linker 'ld.lld' not found
make[2]: *** [scripts/kconfig/Makefile:77: syncconfig] Error 1
make[1]: *** [Makefile:693: syncconfig] Error 2
make: *** [Makefile:795: include/config/auto.conf.cmd] Error 2
stappers@hislaptop:/usr/src/linux/torvalds
$ LANG=C dpkg -l '*llvm*' | cut -b -100
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                 Version       Architecture Description
+++-====================-=============-============-================================================
ii  libllvm11:amd64      1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies, run
ii  libllvm13:amd64      1:13.0.1-4    amd64        Modular compiler and toolchain technologies, run
ii  libllvm14:amd64      1:14.0.6-2    amd64        Modular compiler and toolchain technologies, run
ii  llvm                 1:13.0-54     amd64        Low-Level Virtual Machine (LLVM)
ii  llvm-11              1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies
ii  llvm-11-dev          1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies, lib
un  llvm-11-doc          <none>        <none>       (no description available)
ii  llvm-11-linker-tools 1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies
ii  llvm-11-runtime      1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies, IR 
ii  llvm-11-tools        1:11.1.0-6+b2 amd64        Modular compiler and toolchain technologies, too
ii  llvm-13              1:13.0.1-4    amd64        Modular compiler and toolchain technologies
ii  llvm-13-dev          1:13.0.1-4    amd64        Modular compiler and toolchain technologies, lib
un  llvm-13-doc          <none>        <none>       (no description available)
ii  llvm-13-linker-tools 1:13.0.1-4    amd64        Modular compiler and toolchain technologies - Pl
ii  llvm-13-runtime      1:13.0.1-4    amd64        Modular compiler and toolchain technologies, IR 
ii  llvm-13-tools        1:13.0.1-4    amd64        Modular compiler and toolchain technologies, too
ii  llvm-14              1:14.0.6-2    amd64        Modular compiler and toolchain technologies
ii  llvm-14-dev          1:14.0.6-2    amd64        Modular compiler and toolchain technologies, lib
un  llvm-14-doc          <none>        <none>       (no description available)
ii  llvm-14-linker-tools 1:14.0.6-2    amd64        Modular compiler and toolchain technologies - Pl
ii  llvm-14-runtime      1:14.0.6-2    amd64        Modular compiler and toolchain technologies, IR 
ii  llvm-14-tools        1:14.0.6-2    amd64        Modular compiler and toolchain technologies, too
ii  llvm-runtime:amd64   1:13.0-54     amd64        Low-Level Virtual Machine (LLVM), bytecode inter
stappers@hislaptop:/usr/src/linux/torvalds
$ 


Groeten
Geert Stappers
-- 
Silence is hard to parse
