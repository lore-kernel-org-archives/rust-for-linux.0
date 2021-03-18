Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64253C433DB
	for <rust-for-linux@archiver.kernel.org>; Thu, 18 Mar 2021 12:33:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24DEF64E33
	for <rust-for-linux@archiver.kernel.org>; Thu, 18 Mar 2021 12:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhCRMd1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 18 Mar 2021 08:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbhCRMdS (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 18 Mar 2021 08:33:18 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140F0C06174A
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Mar 2021 05:33:18 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so2667056pjb.4
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Mar 2021 05:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0FSi/DdkiRzIFhL0iZabMyB/y1vCkjAQelvA/agLQIU=;
        b=LyuVAc1RTk26p5YNh8XN+/Gs31mEE1O0WqtIfppm0xV6Bz6Gf/aV0zO2g0q6TX4Iey
         EtqV+GsoMmPesaMH+O44q9SbtcTT/1YtLUbNN7jbULO/X/bCHsl82gbZRHCkb5WK3+OW
         ND0/T4vRppR/539VYEayfUkgQ/RrmWzJxjOgT4AKq8kFbRXg5cpsKb5iF1rSqT5k45fP
         why/1K58eY9pB9RY/DrnA9V/xHZVtiYmqo8lEJh7HG19h1qeshfhzeTBR+RUeRQoqPfX
         w2ea0zBH/r1kIhNTWjrhndPNYzYcL5dGuL8f6nA7ge5tKgUhsDzsMNzIcLrkkMImCJrT
         5sUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0FSi/DdkiRzIFhL0iZabMyB/y1vCkjAQelvA/agLQIU=;
        b=HasYoRByWifEXZBDwcV8MqEYLLJwaSMdP3el40tEu3A+IAnSitEGiXkAGJUobxHK+e
         24DHJqADghQON70cpCMRjNB5NnPVYlWSgpQq4U9cY3GGfQP0x9FRHgqv57qKJd4uvmJ0
         Wp0qq3lQ7cSYvXkGlKEkmFBFYq8y3HwGUHP8GP8BsQXrGnwabiTHCCGdmtYYfsa52tMz
         AxHxVQ0Do5MloU6ZVbTjIOKFVJp6GXmReNrnGf9HGkneOfTBZYyeN8yIXuZ8Oq+HuAHG
         VXfg27xgSrPndkhYogdFwLf0SXKSi1zdxtN3umGa14VWlDWzHBVCaBpjWO+D/lJ2wlzL
         lPKA==
X-Gm-Message-State: AOAM531YAJYQwn560487UuWnfsIDyZ23BIoYoIxnlZtBPzc3jb4ITIQ7
        fSiNu77VYZMvVRNBvHsHDs0/KTK8Qh2j935CMLM=
X-Google-Smtp-Source: ABdhPJy4xRS4kaowgBHN+kEGPrYMGKYzwu9gjpgY1Acf8pvOrZ5EppaQ0ASUbkcnb1YsCdnHMqQgJeUspkga+ACmAZ4=
X-Received: by 2002:a17:903:22c1:b029:e6:8800:37c7 with SMTP id
 y1-20020a17090322c1b02900e6880037c7mr9189549plg.61.1616070797704; Thu, 18 Mar
 2021 05:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72nbNxpps+p4wYp03ncrbGH9FFoTfHQZwg_vGdPO41eGmQ@mail.gmail.com>
In-Reply-To: <CANiq72nbNxpps+p4wYp03ncrbGH9FFoTfHQZwg_vGdPO41eGmQ@mail.gmail.com>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Thu, 18 Mar 2021 08:33:05 -0400
Message-ID: <CAFRnB2XsCHJDNVL_eBF-wDpA4g1z-L9RNALt2KyQEHdfuzpQpQ@mail.gmail.com>
Subject: Re: We are now in linux-next!
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Congratulations everyone, this is an exciting milestone!

Alex

On Thu, Mar 18, 2021 at 7:00 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi all,
>
> Thanks to Stephen Rothwell, we are now in linux-next!
>
> This does not mean we will make it into mainline, of course, but it is
> a nice step to make things as smooth as possible.
>
> Stephen has kindly agreed to give me a bit of leeway the first few
> days until the RFC to rebase things as needed, which is very much
> appreciated.
>
> Cheers,
> Miguel



-- 
All that is necessary for evil to succeed is for good people to do nothing.
