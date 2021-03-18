Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46313C433DB
	for <rust-for-linux@archiver.kernel.org>; Thu, 18 Mar 2021 20:59:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08CB761582
	for <rust-for-linux@archiver.kernel.org>; Thu, 18 Mar 2021 20:59:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhCRU6t (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 18 Mar 2021 16:58:49 -0400
Received: from gpm.stappers.nl ([82.161.218.215]:52419 "EHLO gpm.stappers.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230139AbhCRU6f (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 18 Mar 2021 16:58:35 -0400
X-Greylist: delayed 5515 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Mar 2021 16:58:35 EDT
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 1D4D2304176; Thu, 18 Mar 2021 21:58:33 +0100 (CET)
Date:   Thu, 18 Mar 2021 21:58:33 +0100
From:   Geert Stappers <stappers@stappers.nl>
To:     rust-for-linux@vger.kernel.org
Subject: Re: [Rust for Linux] Poll for call
Message-ID: <20210318205833.vshwyokm3ahogjrw@gpm.stappers.nl>
References: <CANiq72nCOKy_rUmxpqt=s4PX3veentT-jz38c7Yti0tr2X3FSg@mail.gmail.com>
 <CAFRnB2WSVcPyH4Wvp9SWP8O=L8ZjEKhXf0=oXPj9h2XHT1yh7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFRnB2WSVcPyH4Wvp9SWP8O=L8ZjEKhXf0=oXPj9h2XHT1yh7Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


On Tue, Mar 16, 2021 at 12:57:53PM -0400, Alex Gaynor wrote:
> On Tue, Mar 16, 2021 at 12:40 PM Miguel Ojeda wrote:
> >
> > Hi all,
> >
> > As discussed in the previous meeting, let's have one meeting focused
> > on having a re-review of the code for the RFC.

Not sure what kind of a meeting, but my intention is to attent
and just listen.  Hear what real programmers talk about.


> > We have a fair amount of new code coming in and I am preparing a few
> > things too, but it should still be fine by the original schedule [1],
> > so I propose Saturday 27th or Sunday 28th at 18:00 UTC like last time
> > (EU evening / US afternoon).
> >
> > If all goes well, we should be able to send the RFC soon after -rc5.
> 
> I will hopefully be able to make that -- the 27th is unusually busy
> for a pandemic day for me :-)


Both 2021-03-27 [2]  and 2021-03-28 are fine for me.


Regards
Geert Stappers

[1] https://lore.kernel.org/rust-for-linux/CANiq72knSgMU30A2ALaJGY5FWumPKU18ThvfjR1t14_77kYLrQ@mail.gmail.com/
[2] https://xkcd.com/1179/  Oops 2013-02-27  was in Februari eight years ago
-- 
Silence is hard to parse
