Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC306C433EF
	for <rust-for-linux@archiver.kernel.org>; Sat,  7 May 2022 09:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388648AbiEGJcu (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 7 May 2022 05:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245217AbiEGJct (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 7 May 2022 05:32:49 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8432F5548A
        for <rust-for-linux@vger.kernel.org>; Sat,  7 May 2022 02:29:03 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id c125so10445502iof.9
        for <rust-for-linux@vger.kernel.org>; Sat, 07 May 2022 02:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V3hXeKMyVH3yb3LswjLXCdhfJLMURLChbUOKKHij+6E=;
        b=G260v4fRUjzm92DGs+COeqEqlFt1WEBU6bL5mKk/SCVViocj7uBk9MX1m+8WiaWkrI
         aS5sp3AjHQ8aOq5Gvn76KorM/I5UPoLe3Z4VPVN5rNZlOLxTN0yoJ3uH84pcLo17pUn4
         Gbqxgvj5wBpJDVgNjoiKXPnt1tTVBCXvTBnxG+d/hv1UCVXMz0f1T0+Mvpgbwl8IKoLK
         OVRDj8xtNTQoJAlXUqEvoix8qecu97ttNcob1wqmoeT/L4w1I1Qucds64Aw/Ypj+iue2
         IAvTbk2BU9+fI9qbnYyw+JEsFh0FbHVc49nn+Ez06euvFqeP9IGs/pD0D4r61HaydPVW
         I1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V3hXeKMyVH3yb3LswjLXCdhfJLMURLChbUOKKHij+6E=;
        b=1n9MHt5+hHLujVV5qTICbQJBynTg8u4LHrzM8wMwlsXyaG/t0J4ZLCds2A/tyPbGaj
         9aFxrQYfAAl+4UGLRk6O8VWtSiz6dSywTELNeBYgirA3cL6drFyvjKuxF4RqCo8t3PCe
         r7VDBN8x8YaGhPagMN4mdFcsWjMYDimJ+prPmGnf83cgooUmDVbG7HCYJ3G6S6QW9p3E
         D1wVZ7F2YXNP2BcQK+tFfZjft9qnXf9Rf+FlVThCVzkhLLPVRW/uFP71iRRHUe1AXUyX
         hHLwdnQJ9HOCjAp+E9FuMEWyV9BsTsEm9WgBubhK6B0x8CfpFNQ1f6M7GZ4U08eh/n6h
         AchA==
X-Gm-Message-State: AOAM533AhstmnjEB17kyAWZCAWSXvOVzo8vLZC/qtKvlv7YSkohdXQED
        5d9yoEioGQc74dmIUHwXSqUb5YWR6eUTh2ain9s=
X-Google-Smtp-Source: ABdhPJyTbxqv3QmIU/3Fu+PYF6ddS6HDuEJE8G3/A1HoZDpr/lLWtCt4bQqum9lqO2ZC9Sn1A4X04mAGRN+MmRwLHXM=
X-Received: by 2002:a05:6638:d56:b0:32b:62e4:39be with SMTP id
 d22-20020a0566380d5600b0032b62e439bemr3222123jak.308.1651915742957; Sat, 07
 May 2022 02:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <CANDiwaOJYoK9rHk9ZmtEi+38pJ59Je4VPn9dUq_vRr+=V2BEMg@mail.gmail.com>
In-Reply-To: <CANDiwaOJYoK9rHk9ZmtEi+38pJ59Je4VPn9dUq_vRr+=V2BEMg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 7 May 2022 11:28:51 +0200
Message-ID: <CANiq72k3Tyz6J4Tk7LzL6WO14fgoKt1KKZfp1_pzuti8qi3ccQ@mail.gmail.com>
Subject: Re: Request for invitation to join Zulip
To:     Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Harshit,

On Sat, May 7, 2022 at 8:09 AM Harshit Mogalapalli
<harshit.m.mogalapalli@gmail.com> wrote:
>
> I am interested in learning about rust for linux and contributing, could you please let me join Zulip?

Of course, invitation sent -- welcome!

Cheers,
Miguel
