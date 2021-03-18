Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68BBC433E0
	for <rust-for-linux@archiver.kernel.org>; Thu, 18 Mar 2021 19:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E93B64F10
	for <rust-for-linux@archiver.kernel.org>; Thu, 18 Mar 2021 19:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbhCRT0q (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 18 Mar 2021 15:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbhCRT0m (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 18 Mar 2021 15:26:42 -0400
Received: from gpm.stappers.nl (gpm.stappers.nl [IPv6:2001:981:6c6a:1::49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 53E7CC06174A
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Mar 2021 12:26:42 -0700 (PDT)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 10C8A304176; Thu, 18 Mar 2021 20:26:38 +0100 (CET)
Date:   Thu, 18 Mar 2021 20:26:38 +0100
From:   Geert Stappers <stappers@stappers.nl>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: We are now in linux-next!
Message-ID: <20210318192638.o7w4zgsqycpfkbpo@gpm.stappers.nl>
References: <CANiq72nbNxpps+p4wYp03ncrbGH9FFoTfHQZwg_vGdPO41eGmQ@mail.gmail.com>
 <CAFRnB2XsCHJDNVL_eBF-wDpA4g1z-L9RNALt2KyQEHdfuzpQpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFRnB2XsCHJDNVL_eBF-wDpA4g1z-L9RNALt2KyQEHdfuzpQpQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Mar 18, 2021 at 08:33:05AM -0400, Alex Gaynor wrote:
> On Thu, Mar 18, 2021 at 7:00 AM Miguel Ojeda wrote:
> >
> > Hi all,
> >
> > Thanks to Stephen Rothwell, we are now in linux-next!

The commit message
in https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/rust?id=c77c8025525c36c9d2b9d82e4539403701276a1d
says there are more heroes.  ;-)



> > This does not mean we will make it into mainline, of course, but it is
> > a nice step to make things as smooth as possible.
> >
> > Stephen has kindly agreed to give me a bit of leeway the first few
> > days until the RFC to rebase things as needed, which is very much
> > appreciated.
> 
> Congratulations everyone, this is an exciting milestone!


Yes and as far as I understand it, has the near future
more exciting milestone on Rust for Linux.



> 
> Alex
> 
> -- 
> All that is necessary for evil to succeed is for good people to do nothing.


Groeten
Geert Stappers
-- 
Silence is hard to parse
