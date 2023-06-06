Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F68DC77B73
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jun 2023 16:35:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbjFFQfO (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 6 Jun 2023 12:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238302AbjFFQfB (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 6 Jun 2023 12:35:01 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00BDF10C2
        for <rust-for-linux@vger.kernel.org>; Tue,  6 Jun 2023 09:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=rpmXzlgFvWM3CG0oLK6czvhDRA2vKsvP4zqgASi2ezA=; b=Rv+sV9jhJySsom5Dc2MTj89HKI
        UHp7ddU0h14QE+JcS8UICqY4Q+0/Z5W3dWcubcs2eSbkO0UG+6+5S2sxPAxrNZax85O04xMs4cT6A
        KP/aZTwTcilIAp9q8BBBOn9xCjChMoyCM0PZeFBF6cI9NhuL+tUUze0j3c5GAKmrjJ/4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q6Ze5-00F3Hb-RJ; Tue, 06 Jun 2023 18:34:57 +0200
Date:   Tue, 6 Jun 2023 18:34:57 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 5/5] samples: rust: add dummy network driver sample
Message-ID: <5a1eb0a9-6242-4856-b33a-6afa9a7934b8@lunn.ch>
References: <20230604021736.3392963-1-tomo@exabit.dev>
 <0101018884325c60-be28742a-0be9-4cad-b098-0d0a20d8a5b0-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101018884325c60-be28742a-0be9-4cad-b098-0d0a20d8a5b0-000000@us-west-2.amazonses.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> +    fn start_xmit(_dev: &mut Device, data: &Stats, mut skb: SkBuff) -> TxCode {
> +        data.packets.fetch_add(1, Ordering::Relaxed);
> +        skb.tx_timestamp();
> +        TxCode::Ok
> +    }
> +
> +    fn get_stats64(_dev: &mut Device, data: &Stats, stats: &mut RtnlLinkStats64) {
> +        stats.set_tx_stats(data.packets.load(Ordering::Relaxed), 0, 0, 0);
> +    }
> +}
> +
> +#[allow(dead_code)]
> +struct Stats {
> +    packets: AtomicU64,
> +    bytes: AtomicU64,
> +}

start_xmit() and get_stats64() can be called in parallel. So
statistics needs some sort of synchronisation, particularly on 32 bit
systems with 64 bit counters. start_xmit() is on the hot path and used
very often, 10 million times a second, but get_stats64() is a cold
path, probably less than once per second. So the network stack tries
to push as much of the cost to get_stats64(). Atomic operations are
very expensive, and got more and more expensive as the number of CPUs
go up. So in general, you won't see atomics used in networking hot
path.

What we don't want is this code copied into a real driver. I see three
paths forward:

1) Remove statistics for the moment.
2) Add a big comment that Atomics are inefficient and need replacing
3) Wrap u64_stats_update_begin(), u64_stats_update_end() etc.

   Andrew
