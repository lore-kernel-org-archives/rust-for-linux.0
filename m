Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B68AC433ED
	for <rust-for-linux@archiver.kernel.org>; Fri, 23 Apr 2021 13:57:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A882613B6
	for <rust-for-linux@archiver.kernel.org>; Fri, 23 Apr 2021 13:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhDWN6T (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 23 Apr 2021 09:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhDWN6S (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 23 Apr 2021 09:58:18 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC03EC061574
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Apr 2021 06:57:41 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id p10-20020a1c544a0000b02901387e17700fso1293104wmi.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Apr 2021 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ljFVOVRxlkGPdO75+EbWZdI+UMyFalI1EYzXqR9SfEI=;
        b=MkMWeCWqCR/9r9En0omFtDyGYYLwgVoxqy+r3N2hm8N9w5Rw6lz/bdKVLgNlLjyJ7J
         4Wj0ky6C8Vr9t8V+l4tP+jd3TlCX0eFX6HIIuoomlFAaSmNYC9t3lQRq5Tr7ptxCN9P7
         hcu65tN8ZmRsf1qMyTvlToXzXo2pw8BC1MgYYFoFUg4magb8OHuoEoIasnyo6TuS/gJE
         u79iUhz5M/SisBkg7KHgN8/dpmwTtz2sY8idvDkXenFhHkg5zLNn620vd1sKnwuTx/0+
         SIKJQFBTcp6LrP75lm5t0qtmIJZJCYFs4blHS003QpRx12mK7dybTmGCrmZmwOXn+cMV
         GfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ljFVOVRxlkGPdO75+EbWZdI+UMyFalI1EYzXqR9SfEI=;
        b=XzeQmkZfAC1bmJHYhiJK20LmwfaSmbSAEvsSOUgUvjcI7KQoKFj0p/ScMsclKIYaoj
         /O41KGMYDcSVoc0riC+HaaymbwtKsaWXlb44QErlsTpsR+lhmw4VO5nCl/Rif9yWzVeA
         AszySJwSbEMKfhC/NoqwFCFgdHt6Tlv+PWyyDzxcaw5D1wFLBSNeZFL7O0YKgIQyiav9
         6LAXEKWAC24BQRocsz46gGFKXPXJ2UwHdyUPnBjsCFdKUEVqNE/63XLuwKDhHEv30yPq
         7HbKFsoX/nM5rKkuyyQ/LhFEliWoLAP7DbS75R2NP/6FDIVplz7TjUt+iR/YfTHi8w2I
         zkVA==
X-Gm-Message-State: AOAM530BWWbEum7s1jUUOHQ9PyFwGfeebyMUdFuwZopdw/Wuhvvmb0R3
        me6If6HpuYfXVY4Yc2OhaRITv6dqBQC7GJMhp3M=
X-Google-Smtp-Source: ABdhPJyNNvknJgWZyNkP5/HgRGn8iFSaHeKdaRicGC/YAuvVVwCfCgXcb5lBL1kcmzYsWpyv/qAen71sjd2R8Ljq1YA=
X-Received: by 2002:a05:600c:48a6:: with SMTP id j38mr4392068wmp.99.1619186260584;
 Fri, 23 Apr 2021 06:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <b84772b0-e009-3b68-4e74-525ad8531f95@gmail.com>
In-Reply-To: <b84772b0-e009-3b68-4e74-525ad8531f95@gmail.com>
From:   Ivan Koveshnikov <ikoveshnik@gmail.com>
Date:   Fri, 23 Apr 2021 18:57:29 +0500
Message-ID: <CAHQrGVOy1wvLsv-OdtOZxF7urF0NCRA5sf+OFuJNix=SymwmQQ@mail.gmail.com>
Subject: Re:
To:     Kajetan Puchalski <mrkajetanp@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Kajetan,

You need to send an `subscribe rust-for-linux` to
<majordomo@vger.kernel.org> email, not to the mail list.
http://vger.kernel.org/vger-lists.html page contains links that can
prepare an email message with correct format and address.

Best regards,
Ivan Koveshnikov


On Fri, 23 Apr 2021 at 02:53, Kajetan Puchalski <mrkajetanp@gmail.com> wrote:
>
> subscribe
