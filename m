Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACEFC7EE25
	for <rust-for-linux@archiver.kernel.org>; Thu,  8 Jun 2023 08:22:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235215AbjFHIWl (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 8 Jun 2023 04:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235374AbjFHIWf (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 8 Jun 2023 04:22:35 -0400
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01402D65
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 01:22:28 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-51566dc6066so356148a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jun 2023 01:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686212547; x=1688804547;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wqX/nqwqRfsaD5/khroo0tK+1nn7uwTZUA9XgjVzcyo=;
        b=uLiLxE+5fTWyUPQFNZcRmxglICBoksyb4ZUHGGvpwtF5ozgj3KR3yhSjh/JFedkqdD
         fLLJHFxI6Sh8EfKfUNV2UIqhrEmNoTkzgVNXJvwBqO7mPC6aP5CtsQ5m6U3cuMspkjsd
         iLlZ2m/EMKCPdX1btsz+5NsFLFm/mtyDLX+/3uOTH3wcKwwpx3C19c/UMEk2pMEuL3mV
         2qx8x0hvDHPZPMhwVdng024myNxDEbiYselz+9rDLYh7HsDhpRG23jnWXKSZI8B0b+II
         0DAOv+hmFi8QO/RECJWj16DSW9ASe56mLx6PXwjeNJydrqvOv1EinF581LYddo/gsqxf
         QZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686212547; x=1688804547;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wqX/nqwqRfsaD5/khroo0tK+1nn7uwTZUA9XgjVzcyo=;
        b=Pj6wuxuUdym3cxRRio61c3Ls85Ym3YtewVYFY4qGWYRahTIxb6PA8tUEBfmWamFJ/a
         WsOckmzC5Oc+7qgjr0L54KLL3FWGlmNh4r4j7d5w7TSOVf1/oSPkEzT4ax8HOdCz7u7i
         lRZQUk//bqUEwHvt/HfiRq3CGyj2f3kKz7c3NEt+/xmgm41XFHAp6aAgSu9AjDFvht66
         Oiez+Wp9BvBdFQX9xkN8fJNZAjs96GslflttZ2vNjVByk2uHoRr5PsmQWCWvqzuZn3XT
         d87lruSn/yLS/0z61XLOS8C3F1fHUk0GcoabsDInTjnf3Jycq4E9SBqhscS5RfohHCtQ
         +Ubw==
X-Gm-Message-State: AC+VfDw4gbzrlS7UiK9zqPkz8BUMldCjX3RtWCY1ep6rcBoX+YqaBFsy
        GuG471ifu0UrgAyIdF1/O3PHS+JPlwZT15g=
X-Google-Smtp-Source: ACHHUZ7oRTuvjspLJn6yU+68+PXvmmpyrockqUZZfroWF5dp4+hQn2cQOnIhIADtjaxtX3vyfNmxnx2/PAzPfpM=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:d78b:0:b0:50b:c88a:f7cd with SMTP id
 w11-20020a50d78b000000b0050bc88af7cdmr2981095edi.4.1686212547456; Thu, 08 Jun
 2023 01:22:27 -0700 (PDT)
Date:   Thu,  8 Jun 2023 08:22:25 +0000
In-Reply-To: <5a1eb0a9-6242-4856-b33a-6afa9a7934b8@lunn.ch>
Mime-Version: 1.0
References: <5a1eb0a9-6242-4856-b33a-6afa9a7934b8@lunn.ch>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230608082225.1367048-1-aliceryhl@google.com>
Subject: Re: [PATCH 5/5] samples: rust: add dummy network driver sample
From:   Alice Ryhl <aliceryhl@google.com>
To:     andrew@lunn.ch
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
        tomo@exabit.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

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
> 
>    Andrew

I'm guessing that the `dev` pointers to the device will point to the
same device if they are called in parallel? In that case, the type will
need to be changed to `&Device`. We can only use `&mut T` references
when we are the only one accessing the value for the duration of the
function call.

Anyway, how do other parts of the network stack usually synchronize the
access to this data? If there can only be one call to `start_xmit` at
the time, then you could rewrite the code to this without introducing a
race:

fn start_xmit(_dev: &mut Device, data: &Stats, mut skb: SkBuff) -> TxCode {
    let cur_packets = data.packets.load(Ordering::Relaxed);
    data.packets.store(cur_packets + 1, Ordering::Relaxed);
    skb.tx_timestamp();
    TxCode::Ok
}

My understanding is that (unlike `fetch_add`) relaxed loads/stores just
compile down to non-atomic mov instructions on most architectures. (But
I could be wrong.)

Of course, this assumes that `start_xmit` can only race with
`get_stats64` and not with itself. Otherwise you will lose updates.

Alice
