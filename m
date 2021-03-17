Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23021C433DB
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Mar 2021 13:41:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAA2964F5E
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Mar 2021 13:41:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhCQNl0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 Mar 2021 09:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhCQNk7 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 Mar 2021 09:40:59 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA9EC06174A
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Mar 2021 06:40:48 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id o83so1865728ybg.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Mar 2021 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5JBImR5YLTrK2Zy7/OD/1VtqfZrjsUlpsiTM5FFCW7A=;
        b=ixhSX0hxKLKp5db6rDxCFfLwsVD5gzy2emt9TMnsNZmXezJfNWXGiai6qwWx69W3rC
         /n+4+p0PDnjg+76slqsF/7yZecHN2yn1SWyZiuRPQGxX3p1xj3qWmLt2DxElWdIKyqjg
         FHM8IiE2uJcHaEcgd8HIDEjS4KwTuEfQV0SDfUfHTHnEwFdFDdbmiRisJWjvEBm89IpU
         4DLbOAQ5WR3KUlD/JmRfVsK0RXkKyzKuB44QSL8Mh1IQrjJAI9uV7ZhAPFRF4S0Td+DJ
         Ud3GttcRGkQ4TpurXJR3HyBERvdqkQ1raOj0LYgpXkmMxLhj6iyj20lel9eVANGnprMG
         No0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5JBImR5YLTrK2Zy7/OD/1VtqfZrjsUlpsiTM5FFCW7A=;
        b=WDOhjzrXj0mENQZ69pY8xxBM1JfXrXX/62z9rjR86q/L8Bruw7iM2ItT+PiM87bu+c
         fbJijflzS369Rw0t+hPGCPr7jzAHnjBxYHdu8/HzDK+/5BX7/ipujFI9OkdBkEIqb/we
         6e4ejw21ZdNiBjdUFuPKC+PaPF6cJISRWutaXbDuYpMvVkvZRz2bsww0RYrhIXZnwUrC
         pKwKmOSk0Jj4bvJ7dSSfmdTypNMmWvCgmbQuQTK8DrxS7nuTomuRAwvlVML8E6j9hXU4
         NBnWM9VYqy+rzIt0LVPZgSfSKqx5q6vrqdRmd8pOU6OyYJRRqGKjYB4UG0S8OXyKj80j
         j2Sw==
X-Gm-Message-State: AOAM5332An5nTZH3uZiT63tRhzKEzIfWDAVaVNDgZS++l+IMSbGmGU9c
        7n/oyL6P53U82sP1l6OMpeGne0QawjO0KZz6lNqPP4/uAnWrgA==
X-Google-Smtp-Source: ABdhPJzRVlrfTOe5+XIr8sXo+HsCrGn8CKkIQ11387TiqixMAhIJkA4nDeOP+6EfPg6Af9bzdW+ZqZE7qz7Xk1WXcAE=
X-Received: by 2002:a25:3b55:: with SMTP id i82mr1621711yba.422.1615988448020;
 Wed, 17 Mar 2021 06:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210315063044.ur3lvxv7emo2egu4@adolin> <CANiq72=ZUr5JcfnMYB_=Gnsi08q45PwOUo3-CPL84_d5G2EV1w@mail.gmail.com>
 <CACAkLuqMrRAE6d8dP_b9khtO3HY4mnEGP_Z+1HhzRYDMOaaN+Q@mail.gmail.com>
 <CANiq72=2FJQ7Ct_77MsaYe-3qThuRJ-gkLFvY-acq_GmhR9A4A@mail.gmail.com> <CACAkLuopZwyXSMX0TNK_AV=nSjSp7++mXJ7PNeg2_j1bNxrekQ@mail.gmail.com>
In-Reply-To: <CACAkLuopZwyXSMX0TNK_AV=nSjSp7++mXJ7PNeg2_j1bNxrekQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 17 Mar 2021 14:40:37 +0100
Message-ID: <CANiq72nNJgZJ2Be4NWk8MWpxhBbCA6Ry8o88KsgzkZwGCUxNvQ@mail.gmail.com>
Subject: Re: Build system can't detect rustc
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Mar 17, 2021 at 11:32 AM Sumera Priyadarsini
<sylphrenadin@gmail.com> wrote:
>
> Specifying  clang did work, thanks! I used "make nconfig" but I am
> guessing it would be the same as what 'defconfig' would have given.
> Here is a paste if you want to take a look:
> https://paste.ubuntu.com/p/dMb3bb34Qf/

Please note that `menuconfig` (and similar commands) should be run
with `CC=clang` as well, so that configuration is done properly for
Clang.

It would be great if you can confirm `make nconfig CC=clang` would
have worked for you (to start from scratch, including removing the
configuration, use `make mrproper`).

Thanks!

Cheers,
Miguel
