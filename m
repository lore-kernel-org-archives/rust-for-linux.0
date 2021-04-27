Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE96C433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 08:17:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1909D61289
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 08:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbhD0IST (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 04:18:19 -0400
Received: from gpm.stappers.nl ([82.161.218.215]:52828 "EHLO gpm.stappers.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229487AbhD0ISS (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 04:18:18 -0400
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 487DF304176; Tue, 27 Apr 2021 10:17:34 +0200 (CEST)
Date:   Tue, 27 Apr 2021 10:17:33 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     Sven Van Asbroeck <thesven73@gmail.com>,
        rust-for-linux@vger.kernel.org
Subject: Re: [RFC] Short Circuit simplest Rust driver that touches real
 hardware?
Message-ID: <20210427081733.on2dti3im2fhmj6i@gpm.stappers.nl>
References: <CAGngYiUHmkGTP7encnQOHv9CU6H4+RTN96oJb9B7DY4cuGPwAQ@mail.gmail.com>
 <20210426205810.sahdkjyeueg3miug@gpm.stappers.nl>
 <CAGngYiU2xze8Fo47Hbmu5CDh5VL-K4ddL-ez7+jOUTBJHydChw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGngYiU2xze8Fo47Hbmu5CDh5VL-K4ddL-ez7+jOUTBJHydChw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Hi Sven,
Hi Rust for Linux people,

 
On Mon, Apr 26, 2021 at 05:11:54PM -0400, Sven Van Asbroeck wrote:
> On Mon, Apr 26, 2021 at 4:58 PM Geert Stappers wrote:
> > On Mon, Apr 26, 2021, Sven Van Asbroeck wrote:
> > }
> > }   ... one specific piece of hardware ...
> > }
> >
> > Hope that hardware manufactures see this opportunity.  Because I fear that
> > this cool project might get botched due lack of knowledge on hardware.
> >
> 
> Thanks for your input. Would you be able to elaborate why we lack
> knowledge on these Raspberry Pi peripherals?

Hearsay "Broadcom doesn't provide hardware documentation".


> Take the rng. When reading its driver here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/char/hw_random/bcm2835-rng.c?h=v5.12#n62
> 

Header of the file

  // SPDX-License-Identifier: GPL-2.0
  /*
   * Copyright (c) 2010-2012 Broadcom. All rights reserved.
   * Copyright (c) 2013 Lubomir Rintel
   */


not the same as a datasheet or other hardware information.

Lets call it "the best we have"    :-/


> it appears to be the case that the h/w is setup by writing a value to
> two registers (RNG_STATUS, RNG_CTRL). Random data can then be read by
> monitoring RNG_STATUS followed by a read from RNG_DATA.
> 
> Should be as simple as they come, no? What am I missing?
 
I can't tell how much those questions are rhetorical. So my guidance is

    People who say it cannot be done
    should not interrupt those who are doing it.


> > Implementing kernel module for 8250 UART in Rust is something that
> > wouldn't get botched due lack of hardware knowledge.
> 
> That's true, but also much more complex. Doesn't it depend on clocks
> and interrupts? That's infrastructure we don't yet have in Rust.

Which make this project such an interesting project.

 
Groeten
Geert Stappers
-- 
Silence is hard to parse
