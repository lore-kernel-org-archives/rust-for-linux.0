Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32D2C04A95
	for <rust-for-linux@archiver.kernel.org>; Wed, 28 Sep 2022 16:35:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233179AbiI1QfV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 28 Sep 2022 12:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbiI1QfV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 28 Sep 2022 12:35:21 -0400
Received: from hop.stappers.nl (hop.stappers.nl [IPv6:2a02:2308:0:14e::686f:7030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 731AB5C37C
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Sep 2022 09:35:17 -0700 (PDT)
Received: from gpm.stappers.nl (gpm.stappers.nl [82.168.249.201])
        by hop.stappers.nl (Postfix) with ESMTP id 84C1B200D5;
        Wed, 28 Sep 2022 16:35:15 +0000 (UTC)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 31627304049; Wed, 28 Sep 2022 18:35:15 +0200 (CEST)
Date:   Wed, 28 Sep 2022 18:35:14 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        FUJITA Tomonori <tomo@exabit.dev>,
        rust-for-linux@vger.kernel.org
Subject: Re: Rust e1000 driver (Intel Ethernet adapter)
Message-ID: <20220928163514.442xdz4eziuoz2fl@gpm.stappers.nl>
References: <20220919.103820.680182888079022491.fujita@lima-default>
 <CAFRnB2U9EBdRLy0YCdQjCvgHra4T9bB+hrW==5iGWNhS-U7MUQ@mail.gmail.com>
 <20220928143120.iavijwru6r3qnhiy@gpm.stappers.nl>
 <CANiq72nAUKmcBWYqJ0WRHzJbad9L2RrOMP9DY9EYqDD8qSx0RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nAUKmcBWYqJ0WRHzJbad9L2RrOMP9DY9EYqDD8qSx0RQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Sep 28, 2022 at 05:24:23PM +0200, Miguel Ojeda wrote:
> On Wed, Sep 28, 2022 at 4:49 PM Geert Stappers wrote:
> >
> > Where to look for such merge request?
> 
> Tomonori has been sending nice PRs for a while -- you can look them up
> using the author filter in GitHub, for instance.

At https://github.com/Rust-for-Linux/linux/pulls/fujita
are two open Merge Requests  (no closed MRs).
 

My original question has been answered, thanks.


Summary of text below:
| } } Should I jump in the swimming pool?
| } Yes, the water temperature is fine
| It looks very cold to me


> >   * git clone a modified version of a modified version of Linux kernel
> >   * git clone the  rust-e1000 at the right place
> 
> I would expect the branch to contain whatever is needed, thus you
> should only need to clone/fetch/checkout a single branch, i.e. without
> having to do merges.
 
README.md at https://github.com/fujita/rust-e1000 hints,
hints me, "this part should be inserted in another source tree".


> >   * build "rust for linux"
> >   * start qemu with correct parameters
> >   * find out that existing e1000 driver is NOT in the way
> 
> Those are pretty standard steps, though I guess you could prepare a
> container or VM image with everything ready if you need it for demo
> purposes.

Time will tell which smart[*] questions will be asked.

 
Groeten
Geert Stappers

[*] http://www.catb.org/~esr/faqs/smart-questions.html
-- 
Silence is hard to parse
