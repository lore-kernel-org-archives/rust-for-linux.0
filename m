Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8FFC7EE2E
	for <rust-for-linux@archiver.kernel.org>; Mon, 12 Jun 2023 10:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234095AbjFLKnG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 12 Jun 2023 06:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234143AbjFLKmt (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 12 Jun 2023 06:42:49 -0400
Received: from a27-50.smtp-out.us-west-2.amazonses.com (a27-50.smtp-out.us-west-2.amazonses.com [54.240.27.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC3435745
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 03:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686552665;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=iWZ/1/n/8O1Kv3wU6MXOvU93Utmy+k9+dEDHJGZ4s/g=;
        b=JG12EXiUq2D25TX+MjhbpU9SEP665DQSOEf2nhuHBJtikmFY4elSeVrlFpZB8Oxw
        teQtcDSf7i2qdSR+AoVIeAXRDZHlCWPcxFwjq8PIBUReXU5s5SMtiYB2ksuy725V55q
        M+UhMK6hShPvEAqwdBL4qm16znXeHk6U8JU1LXhNirQ/EAiU7x3uZaTeHWHR9duqAL4
        O4nHnj+M/wTGHz+MkXFMDUlE6SXIsg/bUpgtQSjlNTvEEOjtZJwgDSoyfF53NW3/jx6
        OlAji6BclW2tVJz3ha7QZGkAOVDZcUf59utLHDcBiOXcLpM8AoaOOfWUHrA4Mob0/sV
        q5Z8zgwtfQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686552665;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=iWZ/1/n/8O1Kv3wU6MXOvU93Utmy+k9+dEDHJGZ4s/g=;
        b=SSCNYSdOn2MxDkBmU+fHypuhSXzTgpK8TnwLDxnXvAGBs+RK1s8zXTUo4Y6PGKLR
        htkjY3cjmaN/8nup/Q+y/rMmLOGKi3UWXjS3WcNCDch4c6LbNyufQOTV6NvLXWIT1+d
        adrV7muQYuCQmz9sUPm3/FB3DnZhdwaIIJhj9Aog=
Date:   Mon, 12 Jun 2023 06:51:05 +0000
Message-ID: <01010188ae5f5c50-ca8a1613-d807-4ea9-8ec7-956dfa44e945-000000@us-west-2.amazonses.com>
To:     andrew@lunn.ch
Cc:     tomo@exabit.dev, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 2/5] rust: add support for ethernet operations
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <60618e7d-10ed-489d-a6cf-52005a2f918d@lunn.ch>
References: <20230610071848.3722492-1-tomo@exabit.dev>
        <01010188a42d53e0-2d47cf6b-9c3a-4e94-9322-0935d0e5dcd4-000000@us-west-2.amazonses.com>
        <60618e7d-10ed-489d-a6cf-52005a2f918d@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.12-54.240.27.50
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Sat, 10 Jun 2023 18:48:00 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

>> +/// Corresponds to the kernel's `struct ethtool_ts_info`.
>> +pub struct EthtoolTsInfo(*mut bindings::ethtool_ts_info);
>> +
>> +/// Sets up the info for software timestamping.
>> +///
>> +/// This can be [`Device`] method, but there are non ethernet devices.
>> +pub fn ethtool_op_get_ts_info(dev: &mut Device, info: &mut EthtoolTsInfo) -> Result {
> 
> Just an FYI: Despite it being called ethtool, it is not limited to
> ethernet devices. e.g. CAN devices make use of ethtool.

I see, I'll remove the comment in the next version.

thanks,
