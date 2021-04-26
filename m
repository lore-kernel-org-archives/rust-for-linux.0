Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD72C433B4
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 20:58:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97D00613D9
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 20:58:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234959AbhDZU7H (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 16:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235008AbhDZU6y (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 16:58:54 -0400
Received: from gpm.stappers.nl (gpm.stappers.nl [IPv6:2001:981:6c6a:1::49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 39A4CC061756
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 13:58:11 -0700 (PDT)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 77895304176; Mon, 26 Apr 2021 22:58:10 +0200 (CEST)
Date:   Mon, 26 Apr 2021 22:58:10 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     Sven Van Asbroeck <thesven73@gmail.com>,
        rust-for-linux@vger.kernel.org
Subject: Re: [RFC] Short Circuit simplest Rust driver that touches real
 hardware?
Message-ID: <20210426205810.sahdkjyeueg3miug@gpm.stappers.nl>
References: <CAGngYiUHmkGTP7encnQOHv9CU6H4+RTN96oJb9B7DY4cuGPwAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGngYiUHmkGTP7encnQOHv9CU6H4+RTN96oJb9B7DY4cuGPwAQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 26, 2021 at 03:47:59PM -0400, Sven Van Asbroeck wrote:
>         ...
> 2. implement the simplest `IoMemBlock` in Rust. Since we have a live
> `struct device *`, the `IoMemBlock` constructor can simply call
> `devm_platform_get_and_ioremap_resource(our struct device *)` in C,
> which will automatically use the right method to retrieve the `void
> __iomem *`: devicetree, platform data, etc, we don't have to care.
> 3. use the `IoMemBlock` above to implement a trivial iomem-only driver
> as a module. A few possible candidates:
> * h/w random number generator in Raspberry Pi Zero: `brcm,bcm2835-rng`
> * SoC thermal sensor in Raspberry Pi Zero: `brcm,bcm2835-thermal`
> 4. we don't have `hwrng` or `thermal_hwmon` devices in Rust yet, but
> we could perhaps expose this as a `misc_device`, which is something we
> already have. A single temp or randnum readout might do the trick.
> 
> The Raspberry Pi Zero can be purchased for $10. There is [QEMU
> support](https://qemu.readthedocs.io/en/latest/system/arm/raspi.html)
> for the peripherals above.
> 
> Feedback and ideas welcome !

Hope that hardware manufactures see this opportunity.  Because I fear that
this cool project might get botched due lack of knowledge on hardware.


Implementing kernel module for 8250 UART in Rust is something that
wouldn't get botched due lack of hardware knowledge.



Regarding
Geert Stappers
-- 
Silence is hard to parse
