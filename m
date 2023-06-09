Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E95C83003
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 13:15:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241141AbjFINPG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 09:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241128AbjFINPF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 09:15:05 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A26C132
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 06:15:04 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-bbad78c36d6so2324727276.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686316503; x=1688908503;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r/XZ6SC2BfwM1Yl5yWo3TP60rpG2To/FFxUz60d/enM=;
        b=v2B2JCU60YU5jdpuYXWNKaYC8T1/AJ+Dx6iVUh33Ky7qKj2+X9AQp9F+dPEEY3F9bj
         N52pdfzb1ayxQWdQGeupWCgNlnRxU2ms2K5idF9v3ZCU5lQ5fowyKMT1SUWKx5UhW2XB
         24mFv44qpwwSzUCYGZ6LZPl5zY5j/IU4izrntufUZr10RQy3+Stk1LWUAE8xzOWc2boy
         STyesmoPpOoN0+zLl6UHfO/XULFRZYAzd9x9G+L1Z5NOlzVd0/FMhGauU8z+8nBgi3hi
         EIU9awx0VUIQQ0t68nWjPd3R8FD2vpOqsS2mR6hpK1/RivhZdJ0EMPegtrQFySQP/Tyi
         pDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686316503; x=1688908503;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/XZ6SC2BfwM1Yl5yWo3TP60rpG2To/FFxUz60d/enM=;
        b=cGFTnqfAc8hlapBSjtwhAVGwL68LfzsSVwIY36oqU7ugw2Vux2zDerlYzkG73QoL6T
         zwgxNu6R0w5KtX8s988JIg3UHE3QwWXY5+7N7HivLqN8DyeRRJEzgnnaMAE7lXam1V53
         G6i64ZPYXaZzey7txuWCaaGpfoVRAOoKdgFue17dq+7TIJh2iKANSZN/7fFbjg5aztbm
         CfsM64qOQF4kGkJZVKelhyyce3oGbfR2lJyTaiCE3saIKPcChi/qqXogJurEso0p019x
         /SO7C0CsXXePJTH9GdOTzTOAe06nN8gcZfRkUKLe9gpPFbCXFmCoY+r2TUpIXud5Qj1l
         U5WQ==
X-Gm-Message-State: AC+VfDy5Hr1V+xS/ECVeaW6bUZJ20lZGRYu8U8DhsJjJwHcOhiZUvhot
        8W+0L4L9aiXaVYng9GZVIW8jf2ERqoSRXaY=
X-Google-Smtp-Source: ACHHUZ57dtXYPY0QY0nIS78c5VZsBuHMMmgAId1O6LPBqj+tK+B17YCRV3xZMCaXMIsGn4RPWUfckLqW6acZtIw=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:fb05:0:b0:bc1:dfa5:83a8 with SMTP id
 j5-20020a25fb05000000b00bc1dfa583a8mr307882ybe.10.1686316503324; Fri, 09 Jun
 2023 06:15:03 -0700 (PDT)
Date:   Fri,  9 Jun 2023 13:15:00 +0000
In-Reply-To: <20230604124735.1378859-1-aliceryhl@google.com>
Mime-Version: 1.0
References: <20230604124735.1378859-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230609131500.1646742-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/5] rust: core abstractions for network device drivers
From:   Alice Ryhl <aliceryhl@google.com>
To:     aliceryhl@google.com
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
        tomo@exabit.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

FUJITA Tomonori writes:
> On Thu,  8 Jun 2023 07:38:07 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
>>>>> +    const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
>>>>> +        ndo_init: if <T>::HAS_INIT {
>>>>> +            Some(Self::init_callback)
>>>>> +        } else {
>>>>> +            None
>>>>> +        },
>>>>> +        ndo_uninit: if <T>::HAS_UNINIT {
>>>>> +            Some(Self::uninit_callback)
>>>>> +        } else {
>>>>> +            None
>>>>> +        },
>>>>> +        ndo_open: if <T>::HAS_OPEN {
>>>>> +            Some(Self::open_callback)
>>>>> +        } else {
>>>>> +            None
>>>>> +        },
>>>>> +        ndo_stop: if <T>::HAS_STOP {
>>>>> +            Some(Self::stop_callback)
>>>>> +        } else {
>>>>> +            None
>>>>> +        },
>>>>> +        ndo_start_xmit: if <T>::HAS_START_XMIT {
>>>>> +            Some(Self::start_xmit_callback)
>>>>> +        } else {
>>>>> +            None
>>>>> +        },
>>>>> +        ndo_features_check: None,
>>>>> +        ndo_select_queue: None,
>>>>> +        ndo_change_rx_flags: None,
>>>>> +        ndo_set_rx_mode: None,
>>>>> +        ndo_set_mac_address: None,
>>>> 
>>>> Bindgen is set up to generate `Default` implementations for these types,
>>>> so you can do this to omit the remaining fields:
>>> 
>>> It can work with const?
>> 
>> Ah, no, good point.
>> 
>> However, you could use `unsafe { mem::zeroed() }` instead.
> 
> I can't figure out a way to make mem::zeroed() with const but looks
> like the following similar way works.
> 
> const DEVICE_OPS: bindings::net_device_ops = {
>     let mut ops = unsafe {
>         core::mem::MaybeUninit::<bindings::net_device_ops>::zeroed().assume_init() };
> 
>     if <T>::HAS_UNINIT {
>         ops.ndo_init = Some(Self::init_callback);
>     }
>     ops
> };
> 
> thanks,

You can also write:

```
const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
    ndo_init: if <T>::HAS_INIT {
        Some(Self::init_callback)
    } else {
        None
    },
    ndo_uninit: if <T>::HAS_UNINIT {
        Some(Self::uninit_callback)
    } else {
        None
    },
    ndo_open: if <T>::HAS_OPEN {
        Some(Self::open_callback)
    } else {
        None
    },
    ndo_stop: if <T>::HAS_STOP {
        Some(Self::stop_callback)
    } else {
        None
    },
    ndo_start_xmit: if <T>::HAS_START_XMIT {
        Some(Self::start_xmit_callback)
    } else {
        None
    },
    ..unsafe { core::mem::MaybeUninit::<bindings::net_device_ops>::zeroed().assume_init() }
};
```

Alice

