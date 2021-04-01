Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D83C433B4
	for <rust-for-linux@archiver.kernel.org>; Thu,  1 Apr 2021 18:45:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 566CC6100A
	for <rust-for-linux@archiver.kernel.org>; Thu,  1 Apr 2021 18:45:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237287AbhDASpr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:45:47 -0400
Received: from gpm.stappers.nl ([82.161.218.215]:52578 "EHLO gpm.stappers.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236647AbhDASjA (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 1 Apr 2021 14:39:00 -0400
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 33E13304176; Thu,  1 Apr 2021 20:38:32 +0200 (CEST)
Date:   Thu, 1 Apr 2021 20:38:31 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     Manas <manas18244@iiitd.ac.in>, rust-for-linux@vger.kernel.org
Subject: Re: Missing RUST_EXAMPLE option in linux-next-20210331
Message-ID: <20210401183831.r5zk3xt2bxdh47zg@gpm.stappers.nl>
References: <20210401061840.g2zzox7xy5qol7kq@nitro-5>
 <20210401113110.jihwi65ayan2ngi4@gpm.stappers.nl>
 <20210401115905.7ttbyfv4m5haskwr@nitro-5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401115905.7ttbyfv4m5haskwr@nitro-5>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Apr 01, 2021 at 05:29:05PM +0530, Manas wrote:
> On Thu, Apr 01, 2021 at 01:31:10PM +0200, Geert Stappers wrote:
> > On Thu, Apr 01, 2021 at 11:48:40AM +0530, Manas wrote:
> > > I am working on a device driver in rust in linux-next as an academic
> > > project. I used the following command to create .config:
> > > 
> > > $ make LLVM=1 menuconfig
> > > 
> > > But, sometimes the RUST_EXAMPLE option is not visible in menuconfig
> > > (under /Device Drivers/Character devices/). It seemingly happens at
> > > random that this option disappears, despite having a working rust 
> > > nightly environment (and other dependencies).
> > > 
> > > My rust nightly version is 2021-02-20-x86_64-unknown-linux-gnu, with 
> > > rustc 1.52.0-nightly.
> > > 
> > > Can someone point me to why is this happening?
> > 
> > Time will answer that question.

https://lore.kernel.org/rust-for-linux/CANiq72kjwKuRCzeB54JPpCfBO7hfzZKAoAHBtbSBAzfvZY8d0A@mail.gmail.com/T/#mcd107c4fc625cadd6d812ae3d2d191c498f5943b
and hopefully will the archive known how good that answer was.
(in other words: Do a reply to all on the Miguel Ojeda posting.)

> > Thing I would like to known if this "randomness" happens
> > in the very same git branch. Does it? [Yes/No]
> > 
> I am not sure. I haven't checked with other branches.

No need to check that, consider it done.  The
} } Does it happen in the same git branch?
is being answered with something like
} Yes, all work was done in same git branch,
} there was no switching between branches.

OK


Groeten
Geert Stappers
-- 
Silence is hard to parse
