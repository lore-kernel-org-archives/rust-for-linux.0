Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C923FC7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 13:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjFINxv (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 09:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjFINxu (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 09:53:50 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD932113
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=jB61PTzyHXWsHxtFshS+Aw/WIXW02dcuILqJJ07LCHY=; b=oLvdymX0NaEMzbXUlvdlJiNk1v
        csNs8M0indUJVa7d93R5lqWOy1Ji1J9w6x37UdX9C06kzppVYB+jEseoG97BNVjys8sCLqbq84SJU
        IUm1vArWEcSVwkY6HwSxm4psOFCj3Ze/gmRGIxV4t5jharwa10oPL7NgSvgbvf8k9iPY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q7cYh-00FLd0-QW; Fri, 09 Jun 2023 15:53:43 +0200
Date:   Fri, 9 Jun 2023 15:53:43 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     aliceryhl@google.com, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 5/5] samples: rust: add dummy network driver sample
Message-ID: <a1e6359f-5e4d-4d01-b0e5-cb1dcaf0bd2f@lunn.ch>
References: <5a1eb0a9-6242-4856-b33a-6afa9a7934b8@lunn.ch>
 <20230608082225.1367048-1-aliceryhl@google.com>
 <01010188a025632b-16a4fb69-5601-4f46-a170-52b5f2921ed2-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01010188a025632b-16a4fb69-5601-4f46-a170-52b5f2921ed2-000000@us-west-2.amazonses.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> >> What we don't want is this code copied into a real driver. I see three
> >> paths forward:
> >> 
> >> 1) Remove statistics for the moment.
> >> 2) Add a big comment that Atomics are inefficient and need replacing
> >> 3) Wrap u64_stats_update_begin(), u64_stats_update_end() etc.
> >> 
> >>    Andrew
> > 
> > I'm guessing that the `dev` pointers to the device will point to the
> > same device if they are called in parallel? In that case, the type will
> > need to be changed to `&Device`. We can only use `&mut T` references
> > when we are the only one accessing the value for the duration of the
> > function call.
> 
> Ah, yes. ndo_start_xmit() could run on the same device in parallel, I
> think.
> 
> > Anyway, how do other parts of the network stack usually synchronize the
> > access to this data? If there can only be one call to `start_xmit` at
> > the time, then you could rewrite the code to this without introducing a
> > race:

In general, you should assume that all packet handling functions can
run in parallel. This is typical with devices with multiple
queues. Each queue has its own interrupt, and generally that interrupt
is tied to a CPU. The hardware will use hashing algorithms to spread
packets over queues, and hence over CPUs.

> I guess that a typical way is using sorta per-CPU data.

Not sorta, but actual per-CPU data. 

> For example,
> let's assume that NIC supports multiple TX queues. The driver
> allocates data structure for stats per TX queue. Only one CPU can
> access to a queue at one time (runs ndo_start_xmit() to send data via
> a queue).
 
There can be two different sorts of statistics in play here. One is
per queue statistics, and the other is global. The per queue
statistics should be safe because only one CPU should service a queue
at once.

For the global statistics, each CPU has a per-CPU set of counters. The
get_stats call then need to iterate over all these per-CPU statistics
and add them together. 

You also need a different implementation between 32 bit CPUs and 64
bit CPUs. A 64 bit counter on a 32 bit CPU has tearing problems. When
the lower 32 bits overflows and wraps to 0 and the upper 32bits get
incremented by 1. There is a point in that process where the lower
word can be 0, but the upper word has not incremented yet. Or
possible, the other way around, the upper word has incremented, but
the lower is not wrapped. This does not happen with 64 bit machines.
So the implementation takes care to ensure you either see the old
value, or the new value. And it does this as cheaply as possible,
pushing the cost to the reader.

> > fn start_xmit(_dev: &mut Device, data: &Stats, mut skb: SkBuff) -> TxCode {
> >     let cur_packets = data.packets.load(Ordering::Relaxed);
> >     data.packets.store(cur_packets + 1, Ordering::Relaxed);
> >     skb.tx_timestamp();
> >     TxCode::Ok
> > }
> > 
> > My understanding is that (unlike `fetch_add`) relaxed loads/stores just
> > compile down to non-atomic mov instructions on most architectures. (But
> > I could be wrong.)
> > 
> > Of course, this assumes that `start_xmit` can only race with
> > `get_stats64` and not with itself. Otherwise you will lose updates.
> 
> Hmm, the official doc [1] says on the Relaxed ordering:
> 
> "No ordering constraints, only atomic operations."
> 
> so I expect that fetch_add() always gives an atomic operation. I
> assume that the ordering argument is about the ordering between this
> atomic operation and other operations on different variables.
> 
> I tried to compile fetch_add() with Ordering::Relaxed and looks ok,
> got `lock inc` operation on x86_64 and ldadd on aarch64.

So be very careful with atomics, they are very expensive, and you
don't want to use them unless you really must.

Incriminating statistics is done in a transaction. You have clear
start and end markers:

An example for a real driver. Here is increment:

        u64_stats_update_begin(&stats->syncp);
        stats->es.ps.rx_packets += ps->rx_packets;
        stats->es.ps.rx_bytes += ps->rx_bytes;
        stats->es.ps.xdp_redirect += ps->xdp_redirect;
        stats->es.ps.xdp_pass += ps->xdp_pass;
        stats->es.ps.xdp_drop += ps->xdp_drop;
        u64_stats_update_end(&stats->syncp);

Because of the _begin/_end, we don't need to worry about 32/64 bit
issues. The reader either sees all the old values, or all the new
values. And none of the counters are atomic.

The reader is:

       for_each_possible_cpu(cpu) {
                struct mvneta_pcpu_stats *cpu_stats;
                u64 rx_packets;
                u64 rx_bytes;
                u64 rx_dropped;
                u64 rx_errors;
                u64 tx_packets;
                u64 tx_bytes;

                cpu_stats = per_cpu_ptr(pp->stats, cpu);
                do {
                        start = u64_stats_fetch_begin(&cpu_stats->syncp);
                        rx_packets = cpu_stats->es.ps.rx_packets;
                        rx_bytes   = cpu_stats->es.ps.rx_bytes;
                        rx_dropped = cpu_stats->rx_dropped;
                        rx_errors  = cpu_stats->rx_errors;
                        tx_packets = cpu_stats->es.ps.tx_packets;
                        tx_bytes   = cpu_stats->es.ps.tx_bytes;
                } while (u64_stats_fetch_retry(&cpu_stats->syncp, start));

                stats->rx_packets += rx_packets;
                stats->rx_bytes   += rx_bytes;
                stats->rx_dropped += rx_dropped;
                stats->rx_errors  += rx_errors;
                stats->tx_packets += tx_packets;
                stats->tx_bytes   += tx_bytes;
        }

The expensive magic is in the do while loop. If the syncp has a
different value between the beginning and the end, it means the values
have been changed in parallel. So it does it again, until it has
consistent values.

You need to look at how syncp actually works. It is probably not an
atomic. All you need it a guarantee that other CPUs see syncp change
before a counter changes.

There is a lot of highly optimised code here. Either you need to
really understand it if you want to implement it in rust, or you just
wrap the high level interface.

If you look around at papers talking about high performance
networking, you often see that you have around 200 instructions to
handle a packet. You need to avoid any sort of contention with other
CPUs, you don't want cache lines bouncing between CPUs, you don't want
to be signalling between CPUs which atomics will do, take any locks
you really don't need. Everything should be local to the CPU.

	Andrew
