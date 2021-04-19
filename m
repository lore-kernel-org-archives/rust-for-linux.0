Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570E2C433ED
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 23:07:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DB486135F
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 23:07:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhDSXI0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Apr 2021 19:08:26 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:34929 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhDSXI0 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Apr 2021 19:08:26 -0400
X-Originating-IP: 50.39.163.217
Received: from localhost (unknown [50.39.163.217])
        (Authenticated sender: josh@joshtriplett.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E335E1C0002;
        Mon, 19 Apr 2021 23:07:52 +0000 (UTC)
Date:   Mon, 19 Apr 2021 16:07:49 -0700
From:   Josh Triplett <josh@joshtriplett.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Poll for call
Message-ID: <YH4NRfghnRB2z1E4@localhost>
References: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
 <YH3rUsLYFF0VefDR@localhost>
 <CAKwvOdmLkt8LUCikPGdh0PSSw3SHGRpSQ2tZS92HMcca6i4dqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmLkt8LUCikPGdh0PSSw3SHGRpSQ2tZS92HMcca6i4dqw@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 19, 2021 at 02:20:11PM -0700, Nick Desaulniers wrote:
> On Mon, Apr 19, 2021 at 1:43 PM Josh Triplett <josh@joshtriplett.org> wrote:
> >
> > Either day works for me, and I'd love to join.
> >
> > Linux Plumbers Conference and Kernel Summit are coming up. I'd like to
> > propose a "What Does the Kernel Need from Rust?" session, with my lang
> > and libs hats on.
> >
> > I'd also love to talk about the recent LKML thread, and the plans for a
> > custom alloc crate vs reusing the Rust alloc crate.
> 
> I have a microconf proposal for "Toolchains and Kernel MC" (similar to
> last year) that I'm waiting to hear back on.  It would be nice if you
> could hold that proposal for that MC, rather than the general
> "Refereed-track."

I'd actually like to propose it for Kernel Summit. I'd also be happy to
participate in an LPC session similar to last year.
