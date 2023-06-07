Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EABC77B7A
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Jun 2023 05:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjFGF00 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 7 Jun 2023 01:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbjFGF00 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 7 Jun 2023 01:26:26 -0400
X-Greylist: delayed 332 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 06 Jun 2023 22:26:25 PDT
Received: from a27-42.smtp-out.us-west-2.amazonses.com (a27-42.smtp-out.us-west-2.amazonses.com [54.240.27.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AAD4198B
        for <rust-for-linux@vger.kernel.org>; Tue,  6 Jun 2023 22:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686115252;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=CsxbqDJkTURWjROIVRyud5EYhxRxP5AEqLA3f03DPiY=;
        b=QaR7NM/yGVJcvovyRr5E4ns4LOwVS1+mVMGXIlCaJzTspMbhMmWR84gLQuN2+eL7
        IptuqEirgrsQSvOodvUmeFTq4+dr8zBnhJLTtSvA71ZE72zI6PfaW4FPuPPeqJdC909
        Pmve5Senkj4rF7cgoemROpSS8Awh8hSBkWOuPEwB5pMzYD5jPyVYYevZJVScCHoyI8B
        Akvu17DATMSFNROZGn4lDwWijna1wC4JxoTYBZOMsKdJ5nJA2gCVEAMeHgv1J+F17eu
        rmkvewzG7th6mbwDf9EAiAlesVh7UvPcYiKuFIyKSGOEQTKff85dWl37uRE3DCBRQY3
        bPOaUy0aZg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686115252;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=CsxbqDJkTURWjROIVRyud5EYhxRxP5AEqLA3f03DPiY=;
        b=QO8R81wfeiLVwvBWzebxw4T4+T1AfWv9uwknqNTw7XXNFLB7so36rBBaxkpo7Jl6
        TX/ptfl+M0WEtTwngCbqWPzwz8z0G2hbLG3SwAVlWkJraF/gNv7AZNQalZHAQOXZ0L0
        SMrZ/jemY2C2wOg5DhN7cSmCcZB2SMMxs4wVsHlM=
Date:   Wed, 7 Jun 2023 05:20:52 +0000
Message-ID: <01010188944cf9dc-8e984766-ef9c-4744-aa8e-a859895e073a-000000@us-west-2.amazonses.com>
To:     andrew@lunn.ch
Cc:     tomo@exabit.dev, rust-for-linux@vger.kernel.org,
        fujita.tomonori@gmail.com, fujita.tomonori@gmail.com
Subject: Re: [PATCH 5/5] samples: rust: add dummy network driver sample
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <5a1eb0a9-6242-4856-b33a-6afa9a7934b8@lunn.ch>
References: <20230604021736.3392963-1-tomo@exabit.dev>
        <0101018884325c60-be28742a-0be9-4cad-b098-0d0a20d8a5b0-000000@us-west-2.amazonses.com>
        <5a1eb0a9-6242-4856-b33a-6afa9a7934b8@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.07-54.240.27.42
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Tue, 6 Jun 2023 18:34:57 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

>> +    fn start_xmit(_dev: &mut Device, data: &Stats, mut skb: SkBuff) -> TxCode {
>> +        data.packets.fetch_add(1, Ordering::Relaxed);
>> +        skb.tx_timestamp();
>> +        TxCode::Ok
>> +    }
>> +
>> +    fn get_stats64(_dev: &mut Device, data: &Stats, stats: &mut RtnlLinkStats64) {
>> +        stats.set_tx_stats(data.packets.load(Ordering::Relaxed), 0, 0, 0);
>> +    }
>> +}
>> +
>> +#[allow(dead_code)]
>> +struct Stats {
>> +    packets: AtomicU64,
>> +    bytes: AtomicU64,
>> +}
> 
> start_xmit() and get_stats64() can be called in parallel. So
> statistics needs some sort of synchronisation, particularly on 32 bit
> systems with 64 bit counters. start_xmit() is on the hot path and used
> very often, 10 million times a second, but get_stats64() is a cold
> path, probably less than once per second. So the network stack tries
> to push as much of the cost to get_stats64(). Atomic operations are
> very expensive, and got more and more expensive as the number of CPUs
> go up. So in general, you won't see atomics used in networking hot
> path.
> 
> What we don't want is this code copied into a real driver. I see three
> paths forward:
> 
> 1) Remove statistics for the moment.
> 2) Add a big comment that Atomics are inefficient and need replacing
> 3) Wrap u64_stats_update_begin(), u64_stats_update_end() etc.

I'll go with the second becuase

- it would be nice to show a way to access to the private data of a
driver in this example.

- to keep this patchset simple, I prefer to avoid adding more
  appropriate such as per_cpu, etc.

Thanks!
