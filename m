Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFEDC07E95
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Jul 2021 19:27:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 135D161CBD
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Jul 2021 19:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbhGGT3l (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 7 Jul 2021 15:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhGGT3l (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 7 Jul 2021 15:29:41 -0400
X-Greylist: delayed 497 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 07 Jul 2021 12:27:00 PDT
Received: from gpm.stappers.nl (gpm.stappers.nl [IPv6:2001:981:6c6a:1::49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 46C03C061574
        for <rust-for-linux@vger.kernel.org>; Wed,  7 Jul 2021 12:27:00 -0700 (PDT)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 269223041A7; Wed,  7 Jul 2021 21:18:37 +0200 (CEST)
Date:   Wed, 7 Jul 2021 21:18:36 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: real driver
Message-ID: <20210707191836.nhqciiclpy4ghmj5@gpm.stappers.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

In-Reply-To: <YOXB7FRqldZik2Xn@kroah.com>
Previous-Subject: Re: [PATCH 00/17] Rust support

On Wed, Jul 07, 2021 at 05:02:04PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 07, 2021 at 03:07:50PM +0100, Wedson Almeida Filho wrote:
> > > Last I looked at this thing, it was not
> > > feature-complete compared to the in-kernel binder code, has that been
> > > resolved and the needed filesystem changes added?
> > 
> > It is not feature-complete in comparison to the C one just yet, it is missing a
> > few things but not for any fundamental reason -- we were mostly focusing on the
> > kernel crate and tests.
> 
> I love it how you call "binderfs is missing" a "few things" :)
> 
> > Miguel's point is that it does implement the vast majority of binder features
> > and is non-trivial, so it could be used as evidence that useful kernel drivers
> > can be built with Rust; not just "transpiled" from C, but written with the Rust
> > safety guarantees.
> 
> As Christoph said, and I and others have said before, binder is in no
> way shape or form anything that resembles any sort of "driver" at all.
> It is a crazy IPC mechanism that is tacked onto the side of the kernel.
> Not to say that it doesn't have its usages, but the interactions between
> binder and the rest of the kernel are very small and specific.
> Something that almost no one else will ever write again.
> 
> Please work on a real driver to help prove, or disprove, that this all
> is going to be able to work properly.  There are huge unanswered
> questions that need to be resolved that you will run into when you do
> such a thing.

Suggesting virtual null modem drivers.

At userland side are character devices visible.
These /dev/tntX  come in pairs  /dev/tnt0 + /dev/tnt1,
/dev/tnt2 + /dev/tnt3, /dev/tnt4 + /dev/tnt5, etcetera.
They behave like serial ports.
The driver inbetween a /dev/tntX-pair mimicks  UARTs.

Yeah, still no true hardware driver.

Things this driver will bring:
* Providing  character devices
* Interrupts upon recieving / transmitting characters.
* Having transmit / recieve buffers
* Timer knowlege  for emulating baud rate  ( speed in bits per second )


Earlier implementations exist on the Internet. I have salvaged two:
* https://gitlab.com/stappersg/tty0tty
* https://gitlab.com/stappersg/nullmodem

 
May this idea bring this project further.


Regards
Geert Stappers

P.S.
I want the share with you the fun  /  the pun I see in "Subject: real driver"

       driver:  that what pushes forward


:-)
-- 
Silence is hard to parse
