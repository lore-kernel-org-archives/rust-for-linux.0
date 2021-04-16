Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFB0C433ED
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 12:25:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0788610FA
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 12:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbhDPMZ6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Apr 2021 08:25:58 -0400
Received: from gpm.stappers.nl ([82.161.218.215]:52735 "EHLO gpm.stappers.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234914AbhDPMZ6 (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Apr 2021 08:25:58 -0400
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 50272304176; Fri, 16 Apr 2021 14:25:31 +0200 (CEST)
Date:   Fri, 16 Apr 2021 14:25:31 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     Andrej Shadura <andrew.shadura@collabora.co.uk>
Cc:     rust-for-linux@vger.kernel.org
Subject: Porting drivers
Message-ID: <20210416122531.76z5e6mgkfxyqhgw@gpm.stappers.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Previous-Subject: Re: [PATCH 09/13] Samples: Rust examples
In-Reply-To: <dcaca535-2df3-3224-82c3-1a49a2208f30@collabora.co.uk>

On Fri, Apr 16, 2021 at 01:46:03PM +0200, Andrej Shadura wrote:
> Hi,
> 
> On 14/04/2021 21:42, Miguel Ojeda wrote:
> > On Wed, Apr 14, 2021 at 9:34 PM Linus Torvalds wrote:
> >>
> >> Honestly, I'd like to see a real example. This is fine for testing,
> >> but I'd like to see something a bit more real, and a bit less special
> >> than the Android "binder" WIP that comes a few patches later.
> >>
> >> Would there be some kind of real driver or something that people could
> >> use as a example of a real piece of code that actually does something
> >> meaningful?
> > 
> > Yeah, we are planning to write a couple of drivers that talk to actual
> > hardware. Not sure which ones we will do, but we will have them
> > written.
> 
> I’m curious what’s the procedure and approach in general to adding new
> APIs? I was thinking of trying to port my driver but it needs USB HID
> and either LEDs or hwrandom (depending on which part I start porting
> first), so obviously it’s not doable right now, but I’m thinking about
> maybe helping with at least some of those.


My help will be keeping quiet,  avoiding making distractions.
I'm still learning to do so.  :-/


Regards
Geert Stappers
Updated the Subject and broke the mail thread.     :-)
-- 
Silence is hard to parse
