Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D4DC433ED
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 21:49:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4412613C9
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 21:49:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbhEIVum convert rfc822-to-8bit (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 9 May 2021 17:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhEIVum (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 9 May 2021 17:50:42 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD178C061573
        for <rust-for-linux@vger.kernel.org>; Sun,  9 May 2021 14:49:38 -0700 (PDT)
MIME-Version: 1.0
Date:   Sun, 09 May 2021 21:49:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   "Greg Morenz" <greg@droid.cafe>
Message-ID: <36a390c236b2f02ee2ac16208a4fc94f@droid.cafe>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     "Leandro Coutinho" <lescoutinhovr@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
In-Reply-To: <CAN6UTazQwN=oZutVvRio1ZoXBMDm4DXNnqEnZJ_f4fD7vFqFPA@mail.gmail.com>
References: <CAN6UTazQwN=oZutVvRio1ZoXBMDm4DXNnqEnZJ_f4fD7vFqFPA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: greg@droid.cafe
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Rust `for` works fine, until the step is not a simple unsigned int, eg:
> for (int i = n / 2; i > 0; i /= 2)
> 
> In Rust you do: (please let me know if there is a better way):
> let mut i = n / 2;
> while i > 0 {
>     // some logic ...
>     i /= 2;
> }

For this specific example, you could do

let mut i = n;
while { i /= 2; i > 0 } {
    // some logic ...
}

This works because { i /= 2; i > 0 } is a single "block" expression that first
divides i by two, and then "returns" (at the block level) i > 0. Note I have to
not pre-divide n by two when initializing i.

In general rust doesn't have an equivalent construct to C style for loops though.
