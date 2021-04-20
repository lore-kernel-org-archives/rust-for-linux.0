Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12769C433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 01:28:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D290D613B0
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 01:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhDTB2g (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Apr 2021 21:28:36 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:56467 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhDTB2f (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Apr 2021 21:28:35 -0400
X-Originating-IP: 50.39.163.217
Received: from localhost (unknown [50.39.163.217])
        (Authenticated sender: josh@joshtriplett.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 75E6F1BF204;
        Tue, 20 Apr 2021 01:28:01 +0000 (UTC)
Date:   Mon, 19 Apr 2021 18:27:58 -0700
From:   Josh Triplett <josh@joshtriplett.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Poll for call
Message-ID: <YH4uHreNvKoBUJmg@localhost>
References: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
 <YH3rUsLYFF0VefDR@localhost>
 <CAKwvOdmLkt8LUCikPGdh0PSSw3SHGRpSQ2tZS92HMcca6i4dqw@mail.gmail.com>
 <YH4NRfghnRB2z1E4@localhost>
 <CAKwvOdmwhn4_Uba-WpGKJd3aL_1Re2Z7xJ3rT-qCzuFpKxx_ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmwhn4_Uba-WpGKJd3aL_1Re2Z7xJ3rT-qCzuFpKxx_ZQ@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 19, 2021 at 04:11:42PM -0700, Nick Desaulniers wrote:
> On Mon, Apr 19, 2021 at 4:07 PM Josh Triplett <josh@joshtriplett.org> wrote:
> >
> > On Mon, Apr 19, 2021 at 02:20:11PM -0700, Nick Desaulniers wrote:
> > > On Mon, Apr 19, 2021 at 1:43 PM Josh Triplett <josh@joshtriplett.org> wrote:
> > > >
> > > > Either day works for me, and I'd love to join.
> > > >
> > > > Linux Plumbers Conference and Kernel Summit are coming up. I'd like to
> > > > propose a "What Does the Kernel Need from Rust?" session, with my lang
> > > > and libs hats on.
> > > >
> > > > I'd also love to talk about the recent LKML thread, and the plans for a
> > > > custom alloc crate vs reusing the Rust alloc crate.
> > >
> > > I have a microconf proposal for "Toolchains and Kernel MC" (similar to
> > > last year) that I'm waiting to hear back on.  It would be nice if you
> > > could hold that proposal for that MC, rather than the general
> > > "Refereed-track."
> >
> > I'd actually like to propose it for Kernel Summit. I'd also be happy to
> > participate in an LPC session similar to last year.
> 
> Ok, I will recall the "Toolchains and Kernel MC" proposal then; my
> main interest was to have a venue for discussion about Rust+Linux; if
> there's another venue more appropriate let's use that so that conf
> organizers aren't confused by multiple proposals.

No, no, I think it absolutely makes sense to have Rust presentations in
a "Toolchains and Kernel" microconference of LPC as well; sorry for the
ambiguity. I think it would make sense to have the Toolchains and Kernel
microconference to discuss Rust in the kernel, as well as other
clang/LLVM topics. I was thinking of proposing something different, a
"what would we like from Rust" session. I had thought to propose that
for Kernel Summit, but I'd love to coordinate and make sure there isn't
any actual or perceived ambiguity for conference organizers, and if
there might be, I'd much rather make sure the focus is on the
microconference. Let's talk about it on the call this weekend.
