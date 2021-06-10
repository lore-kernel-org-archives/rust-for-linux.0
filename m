Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAC3C48BDF
	for <rust-for-linux@archiver.kernel.org>; Thu, 10 Jun 2021 19:20:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0943613FF
	for <rust-for-linux@archiver.kernel.org>; Thu, 10 Jun 2021 19:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhFJTWs (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 10 Jun 2021 15:22:48 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:33405 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhFJTWs (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 10 Jun 2021 15:22:48 -0400
Received: (Authenticated sender: josh@joshtriplett.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 8C54B1BF20A;
        Thu, 10 Jun 2021 19:20:49 +0000 (UTC)
Date:   Thu, 10 Jun 2021 12:20:47 -0700
From:   Josh Triplett <josh@joshtriplett.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Technical call on `alloc`
Message-ID: <YMJmD6PGJlKC9DWH@localhost>
References: <CANiq72nkghBWopTK1CErYGcU3PriQGaGrXxMwgCc+MhvS+HfVw@mail.gmail.com>
 <CANiq72=f7bvzc291u24_x+M_=wGaJMXYFEKOLXON35icuJoKSQ@mail.gmail.com>
 <CANiq72kZPOgK7NRkmfpbaks365s-9VcYN4N0Trwb0c+2xBzYdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kZPOgK7NRkmfpbaks365s-9VcYN4N0Trwb0c+2xBzYdA@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Jun 10, 2021 at 05:22:56PM +0200, Miguel Ojeda wrote:
> On Thu, Jun 10, 2021 at 5:20 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > The two best options seem to be both 15:00 UTC, so I have picked the
> > Monday one to have Alex with us. Fox, Josh, Douglas: sorry!
> 
> Sorry, I meant 13:00 UTC (15:00 CET).

Despite the early time, I'll try to join. :)
