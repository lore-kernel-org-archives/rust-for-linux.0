Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9E8C433DB
	for <rust-for-linux@archiver.kernel.org>; Mon, 15 Mar 2021 07:35:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BB5F64DAF
	for <rust-for-linux@archiver.kernel.org>; Mon, 15 Mar 2021 07:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhCOHej (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 15 Mar 2021 03:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbhCOHeH (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 15 Mar 2021 03:34:07 -0400
X-Greylist: delayed 394 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 15 Mar 2021 00:34:07 PDT
Received: from gpm.stappers.nl (gpm.stappers.nl [IPv6:2001:981:6c6a:1::49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A078C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Mar 2021 00:34:07 -0700 (PDT)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 6D66E304176; Mon, 15 Mar 2021 08:27:29 +0100 (CET)
Date:   Mon, 15 Mar 2021 08:27:29 +0100
From:   Geert Stappers <stappers@stappers.nl>
To:     rust-for-linux@vger.kernel.org
Subject: Re: Build system can't detect rustc
Message-ID: <20210315072729.irq3yciok4qyqe2l@gpm.stappers.nl>
References: <20210315063044.ur3lvxv7emo2egu4@adolin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315063044.ur3lvxv7emo2egu4@adolin>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Mar 15, 2021 at 12:00:44PM +0530, Sumera Priyadarsini wrote:
> Hi all,
> 
> I was trying to build the rust-for-linux as per the instructions here
> (https://github.com/Rust-for-Linux/linux/blob/rust/Documentation/rust/quick-start.rst)
> but CONFIG_RUST doesn't show up in General setup menu when I try to 
> setup the config file with `make nconfig`. Since it says the build
> system is supposed to be able to locate rustc, I am guessing make is
> unable to find rustc. 
> 
> Could you point me to where make is trying to find rust
> or how I can try fixing this?
> Is there anything else I might have missed out on?

State which Linux kernel source tree you are using.

The reply that is expect is a git clone URL and git branch name.


> I have the latest rust nightly installed.

Tell more about where it is installed.

The reply that is expect is a Linux distro name plus version.



Regards
Geert Stappers
First posting on this mailinglist.
Completely fine with other replies as expected.
Did not a "reply to all", did a "reply to list".
-- 
Silence is hard to parse
