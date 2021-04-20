Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F30C433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 20:28:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC26C613E1
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 20:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233953AbhDTU3G (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Apr 2021 16:29:06 -0400
Received: from gpm.stappers.nl ([82.161.218.215]:52776 "EHLO gpm.stappers.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233891AbhDTU3G (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Apr 2021 16:29:06 -0400
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id C7220304176; Tue, 20 Apr 2021 22:28:33 +0200 (CEST)
Date:   Tue, 20 Apr 2021 22:28:33 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     Alex Gaynor <alex.gaynor@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Geert Stappers <stappers@stappers.nl>
Subject: Re: Video conferencing platform choice
Message-ID: <20210420202833.t262pdo7vv3zvbqj@gpm.stappers.nl>
References: <CANiq72kRDzRQX2Lz0AMLe+iZsWV4PSRe8PL9JHGh07fCMB+0tw@mail.gmail.com>
 <CAFRnB2XSjvuOU4SxokN5R6171PhD83R6=pOiv=ksNe58TyMpmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFRnB2XSjvuOU4SxokN5R6171PhD83R6=pOiv=ksNe58TyMpmw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Apr 20, 2021 at 03:36:02PM -0400, Alex Gaynor wrote:
> I would prefer to continue using Meet.
> 
> From my perspective, we only have a limited number of innovation tokens (
> http://boringtechnology.club/). Trying to introduce Rust into the kernel is
> how we should spend our efforts; we have a working solution that we've used
> for a number of video calls, let's leave it as is and focus on the work.

Yes, focus on the work.


Groeten
Geert Stappers
-- 
Silence is hard to parse
