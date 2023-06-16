Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045CAEB64D8
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 12:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245178AbjFPMS0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Jun 2023 08:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245707AbjFPMSZ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Jun 2023 08:18:25 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10B1A30EA;
        Fri, 16 Jun 2023 05:18:24 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1a2cc92f12aso219169fac.0;
        Fri, 16 Jun 2023 05:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686917903; x=1689509903;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0gZJoDrJidLXO2Qb8l8eH5TrmQul00F+sW1DnvksXw=;
        b=dJHzVAsBBQg7Xz1f29BJyAiqZgl7yEhU7k6aWFKRfGzmnY5GspL8XFU2aMGsupteoB
         btoPzN2OC8RlUO3zYUc3I/Ic6LTI0gO5ssDiA7ZUR3EMiMAVOcePe3ZLfSvNjUK1Tj11
         UrAxLjCpc3JuwBBj+bVKmMbQjqr9Yj0qT0lJ/6E58U+Y5t/1xjXqGOr8ddNN6ZvLooJb
         85+4MfSSmnKaBnywQAMaY7R+IBr44SKH+4/35iMyXA0E6Ldoegm8FNnn8heqeEJ3nS6f
         IyFx3h/Gj5moiRKus8Y/SrEDW9erkEOtPEGjtBfDFHS7OHHP0iWiv0O0/oQWYFuHP3Z0
         4raQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686917903; x=1689509903;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O0gZJoDrJidLXO2Qb8l8eH5TrmQul00F+sW1DnvksXw=;
        b=aCtWIAoqRs5P8+Ee/2iBkHRm7YV3JOPbq5jc2/Ku9VMg1Qo4HYLQb+a7cKCAh9tedB
         Q6Uqcv6tjV+k25mmy6ZA0fjT1s3FoBbQaUFFyqe57ipD4kTGBWRqqxFFVfkRR86K1Axr
         NZESl1Dr//9/0PmOo1I/QfCwVfnA+nxzcwf4M2h7GRT+9ETOezsVDC8wune4sJgN8A6x
         qpkcMR8GLmm7lEhgnY4za5pZdiaw8w0H+jvQjaU0tgt7Oz36eL6ouMyHRUurUj2znz/F
         C+ASWLH/XgxtFfQhdZFEqtJ7EDuJv/qz8mVrasDCOwJhVHnaUvV/InpY6orUZdg9K+nh
         GxKw==
X-Gm-Message-State: AC+VfDwhhPMEAu5Io/6lz5bGHQjr0VW761q/uFLjd/+iCybeUAf4bx1W
        JAh+ptP0XaKI+YrFiFN25ZI=
X-Google-Smtp-Source: ACHHUZ4H/lkY7gtIgRey0z8hby4FWP1G855PDxQLHjGpI/L4fpqjaiEx8whUEq0BofM2R9F/bt/BnA==
X-Received: by 2002:a05:6870:1cb:b0:187:afcb:87ec with SMTP id n11-20020a05687001cb00b00187afcb87ecmr2341401oad.4.1686917903087;
        Fri, 16 Jun 2023 05:18:23 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id n6-20020a17090a394600b0024df2b712a7sm1337469pjf.52.2023.06.16.05.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 05:18:22 -0700 (PDT)
Date:   Fri, 16 Jun 2023 21:18:21 +0900 (JST)
Message-Id: <20230616.211821.1815408081024606989.ubuntu@gmail.com>
To:     kuba@kernel.org
Cc:     miguel.ojeda.sandonis@gmail.com, fujita.tomonori@gmail.com,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, andrew@lunn.ch
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20230615191931.4e4751ac@kernel.org>
References: <20230614230128.199724bd@kernel.org>
        <CANiq72nLV-BiXerGhhs+c6yeKk478vO_mKxMa=Za83=HbqQk-w@mail.gmail.com>
        <20230615191931.4e4751ac@kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Thu, 15 Jun 2023 19:19:31 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> TBH I was hoping that the code will be more like reading "modern C++"
> for a C developer. I can't understand much of what's going on.
> 
> Taking an example of what I have randomly on the screen as I'm writing
> this email:
> 
> +    /// Updates TX stats.
> +    pub fn set_tx_stats(&mut self, packets: u64, bytes: u64, errors: u64, dropped: u64) {
> +        // SAFETY: We have exclusive access to the `rtnl_link_stats64`, so writing to it is okay.
> +        unsafe {
> +            let inner = Opaque::get(&self.0);
> +            (*inner).tx_packets = packets;
> +            (*inner).tx_bytes = bytes;
> +            (*inner).tx_errors = errors;
> +            (*inner).tx_dropped = dropped;
> +        }
> +    }
> 
> What is this supposed to be doing? Who needs to _set_ unrelated
> statistics from a function call? Yet no reviewer is complaining
> which either means I don't understand, or people aren't really 
> paying attention :(

Sorry, this function was used in the dummy driver to implement
net_device_ops->ndo_get_stats64:

https://lore.kernel.org/rust-for-linux/01010188a025632b-16a4fb69-5601-4f46-a170-52b5f2921ed2-000000@us-west-2.amazonses.com/T/#m518550baea9c76224524e44ab3ee5a0ecd01b1b9

The old version uses atomic types in xmit path to save tx stats for
ndo_get_stats64. But Andrew said that using atomic types in xmit path
isn't a good idea in even sample driver so I removed that code.


>> But, indeed, it is best if a `F:` entry is added wherever you think it
>> is best. Some subsystems may just add it to their entry (e.g. KUnit
>> wants to do that). Others may decide to split the Rust part into
>> another entry, so that maintainers may be a subset (or a different set
>> -- sometimes this could be done, for instance, if a new maintainer
>> shows up that wants to take care of the Rust abstractions).
> 
> I think F: would work for us.
> 
> Are there success stories in any subsystem for getting a driver for
> real HW supported? I think the best way to focus the effort would be 
> to set a target on a relatively simple device.

As far as I know, no subsystem has accepted Rust bindings yet.

Replacing the existing C driver for real HW with Rust new one doesn't
make sense, right? So a necessary condition of getting Rust bindings
for a subsystem accepted is that a HW verndor implements both a driver
and bindings for their new HW?

thanks,
