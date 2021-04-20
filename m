Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E409C433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 20:26:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22AC1613D5
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 20:26:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbhDTU1R (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Apr 2021 16:27:17 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:59961 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233873AbhDTU1G (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Apr 2021 16:27:06 -0400
X-Originating-IP: 50.39.163.217
Received: from localhost (unknown [50.39.163.217])
        (Authenticated sender: josh@joshtriplett.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 769A420002;
        Tue, 20 Apr 2021 20:26:31 +0000 (UTC)
Date:   Tue, 20 Apr 2021 13:26:29 -0700
From:   Josh Triplett <josh@joshtriplett.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Geert Stappers <stappers@stappers.nl>
Subject: Re: Video conferencing platform choice
Message-ID: <YH849eYtoAZoicv5@localhost>
References: <CANiq72kRDzRQX2Lz0AMLe+iZsWV4PSRe8PL9JHGh07fCMB+0tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kRDzRQX2Lz0AMLe+iZsWV4PSRe8PL9JHGh07fCMB+0tw@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Apr 20, 2021 at 07:21:31PM +0200, Miguel Ojeda wrote:
> Hi all,
> 
> Geert Stappers has suggested to use v1d30 instead of Google Meet for
> the conferencing service (and he has kindly offered to foot the bill
> too -- at least the initial one).
> 
> I will ask in the upcoming meeting about this, but for those that
> cannot attend and/or may not want to join through the current service,
> please let me know before Saturday if you have a preference between
> those two (publicly or privately, but please Cc Geert).

No objections either way. Looks like v1d30 uses Big Blue Button, which I
like; it works quite well. I'm happy with anything that's web-based and
doesn't require a proprietary client.
