Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C8CC433ED
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 09:31:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 149C260C40
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 09:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbhEIJcy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 9 May 2021 05:32:54 -0400
Received: from gpm.stappers.nl ([82.161.218.215]:52943 "EHLO gpm.stappers.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229555AbhEIJcy (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 9 May 2021 05:32:54 -0400
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 672E0304176; Sun,  9 May 2021 11:31:50 +0200 (CEST)
Date:   Sun, 9 May 2021 11:31:50 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     rust-for-linux@vger.kernel.org
Subject: Re: workflow
Message-ID: <20210509093150.jtaizeq5dyyot3qx@gpm.stappers.nl>
References: <20210509073338.GA1428@agape.jhs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210509073338.GA1428@agape.jhs>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, May 09, 2021 at 09:33:38AM +0200, Fabio Aiuto wrote:
> Good morning all,

Hail all time zones,

 
> I need some clarifications about the workflow.
> 
> As a newcomer in kernel development and open source development
> in general I got a little used to with the forkflow in Greg's staging
> subsystem.
> 
> The tool I'm used to work with is, at the moment, command line git
> against Greg's tree.
> 
> I tried to apply the same approach on rust-for-linux tree but I noticed
> some differences, first of all the use of GitHub.
> 
> One misterious to me side effect is that the command `git show` on HEAD
> pointing to a PR doesn't show diffs.
> 
> After these two enlightening informal meetings I realized that, for this
> particular project, I must (and I'm happy to do it) align with you all
> using GitHub. Is there a particular join procedure you recommend?

I think original poster
is not aware of "Rust for Linux" already in the next branch.


 
> thank you,

My appology for this way too short message.

 
> fabio


Groeten
Geert Stappers
-- 
Silence is hard to parse
