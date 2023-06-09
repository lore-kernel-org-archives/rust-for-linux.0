Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E48C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 12:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240865AbjFIMpE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 08:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240760AbjFIMo5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 08:44:57 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Jun 2023 05:44:56 PDT
Received: from a27-42.smtp-out.us-west-2.amazonses.com (a27-42.smtp-out.us-west-2.amazonses.com [54.240.27.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29595270F
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 05:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686314395;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=LATgAXKqNE5T5+A1vixAEriobc5+5JwrUrwlwFHERZ8=;
        b=bLkYEboWThriqqkDg911aQoJ4lxuwdirYiUQ8mBP/y0mw8RXVdZqm+YfP/uFCKkd
        BRAj3+PbKVJPfhDLF546C4zC8keILbDiNRuilSytD4MULuTQwtntoF4QEH6yTZFTRz4
        Ugv79itNjZ4efZNpnusijSHMqb9qb6NDOQA2ccUW7ejUthhieVkeioFyRg/Lq+ZXy3e
        SrPsjVvk7NAocqF9mTNkiccJ6F3J4Fnp88gfRjFipn+0LuqQDqTZqFYvJmgrEnileXG
        WwegnCWVJQHvb8BXV3K6rBw5kMR7qel2hhCfdDkpANwBA4fMT9aihgDWP4CooAaqIbB
        9QWglR2/Og==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686314395;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=LATgAXKqNE5T5+A1vixAEriobc5+5JwrUrwlwFHERZ8=;
        b=YRWn1T4IZFMsqn36uQNkMqH6sBY0I7D95+J6+c1wEvFwm/YFr38s3eubl+jUg89j
        D1dXGVeHqVozLCDHIfIC/e5ApxH+Fsv1Lqts/PQa1Slv8Loah3FZP3rlFr1fbRI8zuZ
        zl8J33kETBNNEkufUHa39UqkfAJi+/bBHmvfWo9k=
Date:   Fri, 9 Jun 2023 12:39:54 +0000
Message-ID: <01010188a02ba4fb-a989d545-74b7-4e70-9d42-930043dbc9f0-000000@us-west-2.amazonses.com>
To:     aliceryhl@google.com
Cc:     tomo@exabit.dev, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 1/5] rust: core abstractions for network device drivers
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <20230608073807.1353371-1-aliceryhl@google.com>
References: <010101888bc66fbb-3147ad0d-0c98-4f20-a277-949955e3b035-000000@us-west-2.amazonses.com>
        <20230608073807.1353371-1-aliceryhl@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.09-54.240.27.42
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Thu,  8 Jun 2023 07:38:07 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

>>>> +    const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
>>>> +        ndo_init: if <T>::HAS_INIT {
>>>> +            Some(Self::init_callback)
>>>> +        } else {
>>>> +            None
>>>> +        },
>>>> +        ndo_uninit: if <T>::HAS_UNINIT {
>>>> +            Some(Self::uninit_callback)
>>>> +        } else {
>>>> +            None
>>>> +        },
>>>> +        ndo_open: if <T>::HAS_OPEN {
>>>> +            Some(Self::open_callback)
>>>> +        } else {
>>>> +            None
>>>> +        },
>>>> +        ndo_stop: if <T>::HAS_STOP {
>>>> +            Some(Self::stop_callback)
>>>> +        } else {
>>>> +            None
>>>> +        },
>>>> +        ndo_start_xmit: if <T>::HAS_START_XMIT {
>>>> +            Some(Self::start_xmit_callback)
>>>> +        } else {
>>>> +            None
>>>> +        },
>>>> +        ndo_features_check: None,
>>>> +        ndo_select_queue: None,
>>>> +        ndo_change_rx_flags: None,
>>>> +        ndo_set_rx_mode: None,
>>>> +        ndo_set_mac_address: None,
>>> 
>>> Bindgen is set up to generate `Default` implementations for these types,
>>> so you can do this to omit the remaining fields:
>> 
>> It can work with const?
> 
> Ah, no, good point.
> 
> However, you could use `unsafe { mem::zeroed() }` instead.

I can't figure out a way to make mem::zeroed() with const but looks
like the following similar way works.

const DEVICE_OPS: bindings::net_device_ops = {
    let mut ops = unsafe {
        core::mem::MaybeUninit::<bindings::net_device_ops>::zeroed().assume_init() };

    if <T>::HAS_UNINIT {
        ops.ndo_init = Some(Self::init_callback);
    }
    ops
};

thanks,
