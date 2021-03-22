Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8280C433C1
	for <rust-for-linux@archiver.kernel.org>; Mon, 22 Mar 2021 02:32:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5876C60C40
	for <rust-for-linux@archiver.kernel.org>; Mon, 22 Mar 2021 02:32:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbhCVCb3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 21 Mar 2021 22:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhCVCbL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 21 Mar 2021 22:31:11 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABF0C061574
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Mar 2021 19:31:10 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id ay2so5753846plb.3
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Mar 2021 19:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fossix-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=TEk9OY1xD6GoTuX48a6irgKiS8ug8vtc5HFevP/cTf8=;
        b=13Y4nTAZu6zitv6kC6D2sazllsw8XxA3QVmvSPlU2HT9CtI/3dtHVttZOqQTN74RKL
         rK9GR2Gee0dWPTqWB6XaHiH1hn36LdBRVyy7olHa4dZnx1MYnOa0YudLXb48/qPy1WrH
         iomQEsnGk9U+F5pMAQCcLvCBgopaqDik5nvGjYDB+6PbafWtengPOM59ZOaR2hFdxe1u
         b7snxMOjE+4dBZ5SZJ/67FlnziQLBTjflSRl45gLSiU63sUD7c7ipjJFqYuuf7MxaIHI
         NiGlVb13zKtKOg/XHg004KfhDfWKZ47Q1PmgOH26PXbUXZO4diHlLI06nTiPzjAa2ylQ
         mMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=TEk9OY1xD6GoTuX48a6irgKiS8ug8vtc5HFevP/cTf8=;
        b=TBPd0dbszU3NGf0gAMZVXrnCH8sXqE9uSbytLxetVMOAIZzHS7kOHTXvlTLcflq48P
         IK3muntzDHLC89CDN9w8nm5N5PQjYquvsIdX17arsLp3fPlKCeadykbC0XfanA3riEdK
         Sypa6Xa4FYFxbbGfbb0uA6/WpdfFFRTd4YRSSA3eHNB3wSS9QVKvTd01euOkwJb+QUAr
         5rZuR/TIs6i10ZwneFYeiNAYds7h6U178D6HNEG0hNEPC8VuYahPOveRKF3/7Sb0EOxv
         tsQdk6kIXb7WOnrR8pbeG8FlOFQjSxaxvu6v7OMtz9Ky+3S43MJ7eG8v1Gckk6RWAUYv
         9k5Q==
X-Gm-Message-State: AOAM533bt+izw+viqCatruw8VQOWEq1+6H0iip18PQOcuqiwcnQhY3Yd
        yb4EIYyK41bGkHkz/3QcRWU4FQ==
X-Google-Smtp-Source: ABdhPJzi3fTao9FHsXrOI+DfWgGtd472UYzob1+uCP3geq1HCLXQU8bosdstqPbTUl3CQhpzQcxisw==
X-Received: by 2002:a17:90a:ce92:: with SMTP id g18mr10992688pju.52.1616380269937;
        Sun, 21 Mar 2021 19:31:09 -0700 (PDT)
Received: from localhost ([103.21.79.4])
        by smtp.gmail.com with ESMTPSA id c2sm11995358pfb.121.2021.03.21.19.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 19:31:09 -0700 (PDT)
From:   Santosh Sivaraj <santosh@fossix.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: Could not insert module: Exec format error
In-Reply-To: <CANiq72koz3X=fstSLcAu_MkCDsznK+i0xqSnZjxh8LpRC_OBMg@mail.gmail.com>
References: <87zgyy160b.fsf@santosiv.in.ibm.com>
 <CANiq72koz3X=fstSLcAu_MkCDsznK+i0xqSnZjxh8LpRC_OBMg@mail.gmail.com>
Date:   Mon, 22 Mar 2021 08:01:07 +0530
Message-ID: <87v99j2a38.fsf@santosiv.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Hi Miguel,

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> Hi Santosh,
>
> On Sat, Mar 20, 2021 at 12:25 PM Santosh Sivaraj <santosh@fossix.org> wrote:
>>
>> I am building the kernel on a x86 host and running it on a x86 qemu VM.
>
> Is that by chance 32-bit x86?

No, it is a 64-bit x86 guest. I also saw this in the dmesg:

[   43.409639] module: rust_example_3: Unknown rela relocation: 9

Googling took me to https://github.com/rust-lang/rust/issues/57390, and tried to
pass `-Z plt=y` in quiet_cmd_rustc_procmacro, but still the same issue.

Thanks,
Santosh

>
> Cheers,
> Miguel
