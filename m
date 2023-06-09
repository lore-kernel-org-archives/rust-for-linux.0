Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA0AC7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 12:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbjFIMjX (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 08:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbjFIMjW (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 08:39:22 -0400
X-Greylist: delayed 361 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Jun 2023 05:39:21 PDT
Received: from a27-22.smtp-out.us-west-2.amazonses.com (a27-22.smtp-out.us-west-2.amazonses.com [54.240.27.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B501A2
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 05:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686313985;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=xDK/HoT1e/uU/pZlJgQ84QCMGQmejlDGq//DxvX6zJI=;
        b=RqLmQ4Mh1PImnRPOGCw1qTakHXe+DWsnSjjU/Bd97zf0L7YwPgIYX2Gk7ORtnnnj
        ybBQrUm91kZSL0z1XyNYj8uj14ouGSODieZVeazBsqWcCUjgkqGrCwOfm2Qy+0dG8p7
        zTZ+ujDPopZ9dvg326CRFy7eITrBc7942e6FL5RtvNKaoOrqYwWwk5OMTm7WTsOuIFP
        tigT8y/NT8QcyQRgxiU5n2x1RUkznTjfow183SxBmoYHDvFaUlf207rRDxZpy7dG/fi
        AMF305wrcunVYQ1F60cWv6tPJ0gBAMZw42XY0SH1dI0ECkG6zn7XLfGFdnnbQQWGO4X
        VfDMtOusAQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686313985;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=xDK/HoT1e/uU/pZlJgQ84QCMGQmejlDGq//DxvX6zJI=;
        b=abGIFv3FUXcHX/leIPAPNDz9iSsTAsl3hYQNYejbJ6KBxAp/MmwKocEH7gKhM7bs
        uqfe4EykXf7N7ThSGwEdoc832JqCmwVtBjZ+jrQIbu+ciVPP+kUVDWqnU2TIcLChkTU
        MMyHxMEgt6whtyhrSqB/Oj3q5MmUsm2t5G+qMZzU=
Date:   Fri, 9 Jun 2023 12:33:04 +0000
Message-ID: <01010188a025632b-16a4fb69-5601-4f46-a170-52b5f2921ed2-000000@us-west-2.amazonses.com>
To:     aliceryhl@google.com
Cc:     andrew@lunn.ch, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org, tomo@exabit.dev,
        fujita.tomonori@gmail.com
Subject: Re: [PATCH 5/5] samples: rust: add dummy network driver sample
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <20230608082225.1367048-1-aliceryhl@google.com>
References: <5a1eb0a9-6242-4856-b33a-6afa9a7934b8@lunn.ch>
        <20230608082225.1367048-1-aliceryhl@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.09-54.240.27.22
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Thu,  8 Jun 2023 08:22:25 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

>> start_xmit() and get_stats64() can be called in parallel. So
>> statistics needs some sort of synchronisation, particularly on 32 bit
>> systems with 64 bit counters. start_xmit() is on the hot path and used
>> very often, 10 million times a second, but get_stats64() is a cold
>> path, probably less than once per second. So the network stack tries
>> to push as much of the cost to get_stats64(). Atomic operations are
>> very expensive, and got more and more expensive as the number of CPUs
>> go up. So in general, you won't see atomics used in networking hot
>> path.
>> 
>> What we don't want is this code copied into a real driver. I see three
>> paths forward:
>> 
>> 1) Remove statistics for the moment.
>> 2) Add a big comment that Atomics are inefficient and need replacing
>> 3) Wrap u64_stats_update_begin(), u64_stats_update_end() etc.
>> 
>>    Andrew
> 
> I'm guessing that the `dev` pointers to the device will point to the
> same device if they are called in parallel? In that case, the type will
> need to be changed to `&Device`. We can only use `&mut T` references
> when we are the only one accessing the value for the duration of the
> function call.

Ah, yes. ndo_start_xmit() could run on the same device in parallel, I
think.

> Anyway, how do other parts of the network stack usually synchronize the
> access to this data? If there can only be one call to `start_xmit` at
> the time, then you could rewrite the code to this without introducing a
> race:

I guess that a typical way is using sorta per-CPU data. For example,
let's assume that NIC supports multiple TX queues. The driver
allocates data structure for stats per TX queue. Only one CPU can
access to a queue at one time (runs ndo_start_xmit() to send data via
a queue).


> fn start_xmit(_dev: &mut Device, data: &Stats, mut skb: SkBuff) -> TxCode {
>     let cur_packets = data.packets.load(Ordering::Relaxed);
>     data.packets.store(cur_packets + 1, Ordering::Relaxed);
>     skb.tx_timestamp();
>     TxCode::Ok
> }
> 
> My understanding is that (unlike `fetch_add`) relaxed loads/stores just
> compile down to non-atomic mov instructions on most architectures. (But
> I could be wrong.)
> 
> Of course, this assumes that `start_xmit` can only race with
> `get_stats64` and not with itself. Otherwise you will lose updates.

Hmm, the official doc [1] says on the Relaxed ordering:

"No ordering constraints, only atomic operations."

so I expect that fetch_add() always gives an atomic operation. I
assume that the ordering argument is about the ordering between this
atomic operation and other operations on different variables.

I tried to compile fetch_add() with Ordering::Relaxed and looks ok,
got `lock inc` operation on x86_64 and ldadd on aarch64.

[1] https://doc.rust-lang.org/std/sync/atomic/enum.Ordering.html#variant.Relaxed

Thanks!
