Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F865C32771
	for <rust-for-linux@archiver.kernel.org>; Wed, 28 Sep 2022 14:31:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234178AbiI1Ob1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 28 Sep 2022 10:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234042AbiI1ObZ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 28 Sep 2022 10:31:25 -0400
Received: from hop.stappers.nl (hop.stappers.nl [IPv6:2a02:2308:0:14e::686f:7030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038F06F25C
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Sep 2022 07:31:23 -0700 (PDT)
Received: from gpm.stappers.nl (gpm.stappers.nl [IPv6:2a02:a46d:659e:1::696e:626f])
        by hop.stappers.nl (Postfix) with ESMTP id B99B7200D5;
        Wed, 28 Sep 2022 14:31:21 +0000 (UTC)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 6BCDC304049; Wed, 28 Sep 2022 16:31:21 +0200 (CEST)
Date:   Wed, 28 Sep 2022 16:31:21 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     Alex Gaynor <alex.gaynor@gmail.com>,
        FUJITA Tomonori <tomo@exabit.dev>,
        rust-for-linux@vger.kernel.org
Subject: Re: Rust e1000 driver (Intel Ethernet adapter)
Message-ID: <20220928143120.iavijwru6r3qnhiy@gpm.stappers.nl>
References: <20220919.103820.680182888079022491.fujita@lima-default>
 <CAFRnB2U9EBdRLy0YCdQjCvgHra4T9bB+hrW==5iGWNhS-U7MUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFRnB2U9EBdRLy0YCdQjCvgHra4T9bB+hrW==5iGWNhS-U7MUQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Sep 18, 2022 at 09:59:02PM -0400, Alex Gaynor wrote:
> On Sun, Sep 18, 2022 at 9:57 PM FUJITA Tomonori <tomo@exabit.dev> wrote:
> >
> > Hi,
> >
> > I've implemented Rust e1000 driver (Intel Ethernet adapter):
> >
> > https://github.com/fujita/rust-e1000
> >
> > There are many places to use the C bindings directly for now. I try to
> > clean up and push abstractions for NIC drivers (DMA, PCI, network,
> > etc).
> >
> > I can ping on QEMU. Needs a bit more work for real hardware.
> >
> > Thanks,
> 
> That's great to see. Thanks for your work on this and looking forward
> to seeing the pull requests!
> 

Where to look for such merge request?



Long version of my question:

I can't tell how many hurdles there will be
nor how large (time consuming) the hurdles will be
for:

  * git clone a modified version of a modified version of Linux kernel
  * git clone the  rust-e1000 at the right place
  * build "rust for linux"
  * start qemu with correct parameters
  * find out that existing e1000 driver is NOT in the way
  * see it working myself


Myself and probably others nearby the swimming pool
not knowning how nice the swimming water is.


Groeten
Geert Stappers
-- 
Silence is hard to parse
