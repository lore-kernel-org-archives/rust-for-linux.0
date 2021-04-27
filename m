Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEECC43460
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 06:49:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2966761078
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 06:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbhD0Gu3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 02:50:29 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:33593 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230062AbhD0Gu3 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 02:50:29 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 1865E5C0197;
        Tue, 27 Apr 2021 02:49:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 27 Apr 2021 02:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=KuOxxRd82dTowgf4NHmzc/C8IiI
        JCWgZCK9jiBqjzWA=; b=ev6Sen1OkzL649RrnrvXNvOrMASMJwEsmWZDhhdqmNG
        uGtYH7ojG0Mkge9k1CZbJTbj106Z2wQyQs0e1ZV7766rVcb+NTJVVpJD20a7Bvwm
        t6Xi4qLxB4+wBVdF/qF67lRM1+DJI0/2GXqHPiTuONQZ5XDX/u/kjq1L16V8LlI9
        GEcNpV/QCSGyD7Fx5GYZYnCGX/lV9ESo2Symz3UgGU1oaida/r6DXXF/2w7SX07d
        u9fdu93I0ZNqzsGHtBzmJe455H9XKsaDy0xaquP/9tBr8oU6yi5p5dge6GPX4elR
        f0sRHdFJuRDK3pYTikIp7AxCDLLJXXoPhbvutU4//3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KuOxxR
        d82dTowgf4NHmzc/C8IiIJCWgZCK9jiBqjzWA=; b=G7ZgYLDKdj5dVTireGidwe
        pI9Cq09RUXWmpyuXeaA2VdEUc+//GJKch1DCVdWtc1L8c9TvRVstb/0DTHcbQL4j
        qWbECaPgioS3q5nPX3gxrGhLTul8BZstv5ieghuT+CBNZqKKIx+pkpHJjDmJXxiU
        OqDsZhwNw0hSQLeMv0NQIqWwUkPNU4vby1WOjf3941n+V7M9BwHUKv9mjqLgVqsz
        X3kPUsXSsxKHjWNcLSQVbzU2PzrQ4q84CilYrMSlMzfNcHKMwwP6IGZQMH4XnNXO
        zTiLFG/W2hndc4txUSrKIAy2rWrPCKQpmpD7lO9J7bTJEByCrGdTto60pRsv7UWQ
        ==
X-ME-Sender: <xms:CbSHYH66FPw1IiZWAhyqk_T3BpPs8qyWutzq1kvtogLg4Vrr1M7txg>
    <xme:CbSHYM63fmyIkmx483jAB-KrFBcYIuJoXHmgh4pdVaimevPSqKHHXe3Rl2TtqN9lq
    wZDCpXJtkoggQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduledgudegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepuddtle
    evffefgedufedufeevvedtgedutdffudfggeeltefghfejiedujeevtdeinecuffhomhgr
    ihhnpehrvggrughthhgvughotghsrdhiohenucfkphepkeefrdekiedrjeegrdeigeenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvghes
    khhrohgrhhdrtghomh
X-ME-Proxy: <xmx:CbSHYOeuXxgnI3d9GcCE1qUr4_-cw6iWSaxzm3VZoTC5t937ZEKKNQ>
    <xmx:CbSHYIJuuCuVkydlMZcAf5191URipmVvoTsr5DhUskjjNnYwVG2lbg>
    <xmx:CbSHYLKd6yhScCnqc357b_tYiLYHeABk93DGhjV2p1fa4FlurfMPZA>
    <xmx:CrSHYD0aDfXhxvAnFG6S4ACMVeW7z5raQhzSnnS95kpNHPpDyvDncQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Tue, 27 Apr 2021 02:49:45 -0400 (EDT)
Date:   Tue, 27 Apr 2021 08:49:40 +0200
From:   Greg KH <greg@kroah.com>
To:     Geert Stappers <stappers@stappers.nl>
Cc:     Sven Van Asbroeck <thesven73@gmail.com>,
        rust-for-linux@vger.kernel.org
Subject: Re: [RFC] Short Circuit simplest Rust driver that touches real
 hardware?
Message-ID: <YIe0BM9zsPVPkrO9@kroah.com>
References: <CAGngYiUHmkGTP7encnQOHv9CU6H4+RTN96oJb9B7DY4cuGPwAQ@mail.gmail.com>
 <20210426205810.sahdkjyeueg3miug@gpm.stappers.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210426205810.sahdkjyeueg3miug@gpm.stappers.nl>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 26, 2021 at 10:58:10PM +0200, Geert Stappers wrote:
> On Mon, Apr 26, 2021 at 03:47:59PM -0400, Sven Van Asbroeck wrote:
> >         ...
> > 2. implement the simplest `IoMemBlock` in Rust. Since we have a live
> > `struct device *`, the `IoMemBlock` constructor can simply call
> > `devm_platform_get_and_ioremap_resource(our struct device *)` in C,
> > which will automatically use the right method to retrieve the `void
> > __iomem *`: devicetree, platform data, etc, we don't have to care.
> > 3. use the `IoMemBlock` above to implement a trivial iomem-only driver
> > as a module. A few possible candidates:
> > * h/w random number generator in Raspberry Pi Zero: `brcm,bcm2835-rng`
> > * SoC thermal sensor in Raspberry Pi Zero: `brcm,bcm2835-thermal`
> > 4. we don't have `hwrng` or `thermal_hwmon` devices in Rust yet, but
> > we could perhaps expose this as a `misc_device`, which is something we
> > already have. A single temp or randnum readout might do the trick.
> > 
> > The Raspberry Pi Zero can be purchased for $10. There is [QEMU
> > support](https://qemu.readthedocs.io/en/latest/system/arm/raspi.html)
> > for the peripherals above.
> > 
> > Feedback and ideas welcome !
> 
> Hope that hardware manufactures see this opportunity.  Because I fear that
> this cool project might get botched due lack of knowledge on hardware.
> 
> 
> Implementing kernel module for 8250 UART in Rust is something that
> wouldn't get botched due lack of hardware knowledge.

Uarts are anything but simple, sorry, look at how "big" the kernel
driver is in C for the 8250 support.

And yes, I recommend doing a "simple" driver that touches the hardware,
there's no reason not to duplicate one of the existing C drivers, in
fact, it makes more sense so that people can help understand the
comparison between the ways the two languages will work.

thanks,

greg k-h
