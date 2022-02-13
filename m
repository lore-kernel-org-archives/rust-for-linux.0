Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A83C433EF
	for <rust-for-linux@archiver.kernel.org>; Sun, 13 Feb 2022 09:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbiBMJlY (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 13 Feb 2022 04:41:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbiBMJlY (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 13 Feb 2022 04:41:24 -0500
X-Greylist: delayed 579 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 13 Feb 2022 01:41:17 PST
Received: from gpm.stappers.nl (gpm.stappers.nl [IPv6:2001:981:6c6a:1::49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6A52F5C37A
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Feb 2022 01:41:17 -0800 (PST)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 14DF13041A7; Sun, 13 Feb 2022 10:31:35 +0100 (CET)
Date:   Sun, 13 Feb 2022 10:31:35 +0100
From:   Geert Stappers <stappers@stappers.nl>
To:     rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 00/20] Rust support,  nn/nn
Message-ID: <20220213093135.7hvlvbsawcu2bjzg@gpm.stappers.nl>
References: <20220212130410.6901-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220212130410.6901-1-ojeda@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Feb 12, 2022 at 02:03:26PM +0100, Miguel Ojeda wrote:
> Rust support
> 
> This is the patch series (v4) to add support for Rust as a second
> language to the Linux kernel.
>   ...


Where is patch 20/20?


Long:

I'm missing patch 20/20.  With the v3 series I did mis patch 21/21.

In other projects I see,
patches 01/nn up to nn/nn and cover letter 00/nn.

At https://www.spinics.net/lists/linux-serial/ you find

  [PATCH v2 0/2] serial: 8250: Correct basic issues with the PCI blacklist, Maciej W. Rozycki
  ` [PATCH v2 2/2] serial: 8250: Report which option to enable for blacklisted PCI devices, Maciej W. Rozycki
  ` [PATCH v2 1/2] serial: 8250: Correct Kconfig help text for blacklisted PCI devices, Maciej W. Rozycki

  [PATCH v3 0/2] serial: 8250: Fixes for Oxford Semiconductor 950 UARTs, Maciej W. Rozycki
  ` [PATCH v3 1/2] serial: 8250: Fold EndRun device support into OxSemi Tornado code, Maciej W. Rozycki
  ` [PATCH v3 2/2] serial: 8250: Add proper clock handling for OxSemi PCIe devices, Maciej W. Rozycki

  [PATCH 0/2] serial: 8250: Correct basic issues with the PCI blacklist, Maciej W. Rozycki
  ` [PATCH 1/2] serial: 8250: Correct Kconfig help text for blacklisted PCI devices, Maciej W. Rozycki
  ` [PATCH 2/2] serial: 8250: Report which option to enable for blacklisted PCI devices, Maciej W. Rozycki

  [PATCH v8 0/6] serial: mvebu-uart: Support for higher baudrates, Marek Behún
  ` [PATCH v8 1/6] math64: New DIV_U64_ROUND_CLOSEST helper, Marek Behún
  ` [PATCH v8 2/6] dt-bindings: mvebu-uart: document DT bindings for marvell,armada-3700-uart-clock, Marek Behún
  ` [PATCH v8 3/6] serial: mvebu-uart: implement UART clock driver for configuring UART base clock, Marek Behún
  ` [PATCH v8 4/6] dt-bindings: mvebu-uart: update information about UART clock, Marek Behún
  ` [PATCH v8 5/6] arm64: dts: marvell: armada-37xx: add device node for UART clock and use it, Marek Behún
  ` [PATCH v8 6/6] serial: mvebu-uart: implement support for baudrates higher than 230400 Bd, Marek Behún


At https://lore.kernel.org/rust-for-linux/ you find

  [PATCH v4 00/20] Rust support
  ` [PATCH v4 01/20] kallsyms: support "big" kernel symbols
  ` [PATCH v4 02/20] kallsyms: increase maximum kernel symbol length to 512
  ` [PATCH v4 03/20] kallsyms: use the correct buffer size for symbols
  ` [PATCH v4 04/20] rust: add C helpers
  ` [PATCH v4 05/20] rust: add `compiler_builtins` crate
  ` [PATCH v4 07/20] rust: add `build_error` crate
  ` [PATCH v4 08/20] rust: add `macros` crate
  ` [PATCH v4 09/20] rust: add `kernel` crate's `sync` module
  ` [PATCH v4 11/20] rust: export generated symbols
  ` [PATCH v4 12/20] vsprintf: add new `%pA` format specifier
  ` [PATCH v4 13/20] scripts: add `generate_rust_analyzer.py`
  ` [PATCH v4 14/20] scripts: decode_stacktrace: demangle Rust symbols
  ` [PATCH v4 16/20] Kbuild: add Rust support
  ` [PATCH v4 17/20] samples: add Rust examples
  ` [PATCH v4 18/20] MAINTAINERS: Rust
  ` [PATCH v4 19/20] [RFC] drivers: gpio: PrimeCell PL061 in Rust
  

Hench my question:  Where is patch 20/20?



Groeten
Geert Stappers
-- 
Silence is hard to parse
