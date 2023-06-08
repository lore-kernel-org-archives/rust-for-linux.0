Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDA4C7EE23
	for <rust-for-linux@archiver.kernel.org>; Thu,  8 Jun 2023 07:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234318AbjFHHiN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 8 Jun 2023 03:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjFHHiM (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 8 Jun 2023 03:38:12 -0400
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F2A1BDF
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 00:38:11 -0700 (PDT)
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-514a4c3ff90so314472a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jun 2023 00:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686209890; x=1688801890;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=btrJ55mcbY6hCwb7DAW9F270tiqEy0iPW0YaOtI8apo=;
        b=ynrJzqC6mQUBpCimjOUcVRaBNojkzo7zqXsn08ahI2483uGHjpvMpMPsbnB03IDSnN
         IgtoIDRLmstwiGGnUdpTUjIMbiDlyrW1NNwNbff8qfXkNxXtoBhRAN5pyJJsL9UGKyCc
         gVoGaKoeLJImFV/5e+wE/iD/NXzUvQzdbkBJfvGhAyypUFi3PzZuPzpjD0+YKAMbcivU
         6VLzCy2krPyhmWSTYc85pZQXaMGx7F+X27haD/K0EnH9p0nRu/DJYAVQJDCQQXdlx/ak
         n4qdYBUDrHbpK9eMbUyIdZJrblsnuk8HOTjoE/GoasXHelFX3FfiGgebbEH3y5/TNGri
         vU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686209890; x=1688801890;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btrJ55mcbY6hCwb7DAW9F270tiqEy0iPW0YaOtI8apo=;
        b=imtfb6+9XH2ajTuDyESN8iPe4vUl3YxS47VmrVSVqMd37k4wZONJJBvIGNTDXID8dH
         RB7nwqAN5WutpLtVqC+NPNY7Wa9HnSXV/9fF3Wdthi1T6YCmBZGW5kCCeAAnRS1Q+WwQ
         bI2fJH4bglJK9rkrPOVX6zZrkrbuCR5EaR7kB5iqb92oFyC52pUllggBVDVoKpF5eZFJ
         EvVLtyEDl3aCJS4B6xF4M0mPdvR3lyVZS8VNGbo67IT4HRIPP1U1m1aWmqSOR7VbRAXJ
         G2TW3ZtnQZiOOJgazA2l0RgVbCRxEyVi3jJcwVN+rAhdNGE07XzeZKej2IbEz/fY/Nk5
         uFfw==
X-Gm-Message-State: AC+VfDxZ31g2lR43gn5+XzMJVJTiZRABRVkD0hDyd0xvfptLiwI8Qqm/
        BMurUu6gprZhgc9r+aFnvr+qX5RnmYNyCMw=
X-Google-Smtp-Source: ACHHUZ5+P1U81rGYwyn4ynPjf5HbYJI3Tw5LdRHu4ExXNblqpOyRVN8AAUUgyrGK1i4U+xzrVdy75i91o++rFi0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:d74a:0:b0:515:1e5a:6bcd with SMTP id
 i10-20020a50d74a000000b005151e5a6bcdmr2961728edj.2.1686209890144; Thu, 08 Jun
 2023 00:38:10 -0700 (PDT)
Date:   Thu,  8 Jun 2023 07:38:07 +0000
In-Reply-To: <010101888bc66fbb-3147ad0d-0c98-4f20-a277-949955e3b035-000000@us-west-2.amazonses.com>
Mime-Version: 1.0
References: <010101888bc66fbb-3147ad0d-0c98-4f20-a277-949955e3b035-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230608073807.1353371-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/5] rust: core abstractions for network device drivers
From:   Alice Ryhl <aliceryhl@google.com>
To:     tomo@exabit.dev
Cc:     aliceryhl@google.com, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Thanks a lot for reviewing!
> 
> On Sun,  4 Jun 2023 12:47:35 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>> FUJITA Tomonori writes:
>>> +/// Corresponds to the kernel's `struct net_device`.
>>> +///
>>> +/// # Safety
>>> +///
>>> +/// The kernel uses a `net_device` object with various functions like `struct net_device_ops`.
>>> +/// This object is passed to Rust callbacks while these functions are running.
>>> +/// The C API guarantees that `net_device` isn't released while this function is running.
>>> +pub struct Device(*mut bindings::net_device);
>> 
>> You don't implement `Send` or `Sync` for this type. But maybe that's
>> intentional since you don't know what kind of private data it stores?
> 
> I totally forgot. The type of private data is required to be Send and Sync
> so it's ok to implement Send and Sync for Device, right?

Yes, it's probably fine.

>>> +    const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
>>> +        ndo_init: if <T>::HAS_INIT {
>>> +            Some(Self::init_callback)
>>> +        } else {
>>> +            None
>>> +        },
>>> +        ndo_uninit: if <T>::HAS_UNINIT {
>>> +            Some(Self::uninit_callback)
>>> +        } else {
>>> +            None
>>> +        },
>>> +        ndo_open: if <T>::HAS_OPEN {
>>> +            Some(Self::open_callback)
>>> +        } else {
>>> +            None
>>> +        },
>>> +        ndo_stop: if <T>::HAS_STOP {
>>> +            Some(Self::stop_callback)
>>> +        } else {
>>> +            None
>>> +        },
>>> +        ndo_start_xmit: if <T>::HAS_START_XMIT {
>>> +            Some(Self::start_xmit_callback)
>>> +        } else {
>>> +            None
>>> +        },
>>> +        ndo_features_check: None,
>>> +        ndo_select_queue: None,
>>> +        ndo_change_rx_flags: None,
>>> +        ndo_set_rx_mode: None,
>>> +        ndo_set_mac_address: None,
>> 
>> Bindgen is set up to generate `Default` implementations for these types,
>> so you can do this to omit the remaining fields:
> 
> It can work with const?

Ah, no, good point.

However, you could use `unsafe { mem::zeroed() }` instead.

