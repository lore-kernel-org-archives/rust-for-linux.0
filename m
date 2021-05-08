Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71CFC433B4
	for <rust-for-linux@archiver.kernel.org>; Sat,  8 May 2021 20:59:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A521761104
	for <rust-for-linux@archiver.kernel.org>; Sat,  8 May 2021 20:59:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhEHVA4 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 8 May 2021 17:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhEHVAz (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 8 May 2021 17:00:55 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7362C061574
        for <rust-for-linux@vger.kernel.org>; Sat,  8 May 2021 13:59:53 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id h202so16473932ybg.11
        for <rust-for-linux@vger.kernel.org>; Sat, 08 May 2021 13:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MwEYbNXOoQhO2X6GRK8P0f+lIh8IiRmTwFInZ5ZUKQg=;
        b=LufDSqHT8SFNfpgZC/bVJvyGxG2j19N59tLEmM8VM9TUc5349NLAQOV1HOBvwh4DPe
         M6p7odx5PkenxQ9hulS2pEcLjpD6qEiWLnCCAFoGFQiK0ybPyMTKIseQxVuSegGxhCiS
         VQ/GuBXvwq+RUpjZfX4gI7FmeZkp+L9BdaqC9JVwZKx8d5/+wHmmA+2SjJ1rePxckvLb
         8t1IfOY2IN3A4/CsfVoXhYz8s4EiuA72CJKn+A72fDKsXr2LnFNesDZaFtSE48/Xrm7r
         GJ08KxB70+R712+KfPRX2AGyj4HtmBEl5iZ8NRKcVOgglz5865TRi5AmPYWwUWxYC+8o
         LRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MwEYbNXOoQhO2X6GRK8P0f+lIh8IiRmTwFInZ5ZUKQg=;
        b=RLHik826BNNB0Vvv0K9MZh6+X+E9VlMvN5VIbqxLm3AkDbE5AHhT7mXEHglXSDzpyU
         Hkfc0lcD1lQsBX/vtK0FKbF8jg17e9PTFLY3dM40MLerp/KCzSgISL0DFOfc589YEerH
         IzLPjaS1E2gniX1jgKZJu+fvYF08W1801VW77zocWeY4A77DYu9L5lBH+XqC+3ooSJZq
         hTlIwJzqJcnJ2erk/HFTz1Srkz+iw5bQxXCvntObuLa7ip5rP1M889dLVSZ+Ad39JTaL
         EU+i7ivPjTub18kerjzTn8EpdSogzWg7tL1fLjJjzuXKma8R/8vWrJZINEATzDUbouQ9
         lRdA==
X-Gm-Message-State: AOAM531skpq3yFM/d7MKLT0PlzbyeGP0Z8rE8y/KSCDAPNoM+rYn+62g
        iACioqunwO2ur000rG0G0uHYhfuAwu4XVoDzks1sF2h8EEzMQg==
X-Google-Smtp-Source: ABdhPJw80BUuG5yexaesCAisfIt3gG/6NXdDNjgEeJ/G/q4arNev0llnwJSTdB4TV0he5f30sMmKAcxJnUC1IAQ1kgo=
X-Received: by 2002:a25:880f:: with SMTP id c15mr21469077ybl.247.1620507593098;
 Sat, 08 May 2021 13:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210508202258.m7uk6cfxzyghzu7f@FVFF77RQQ05N>
In-Reply-To: <20210508202258.m7uk6cfxzyghzu7f@FVFF77RQQ05N>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 8 May 2021 22:59:42 +0200
Message-ID: <CANiq72=bDip0qoeN2tcwYWJOSPT_cvfUevaOmrOhdsFHTTX+1w@mail.gmail.com>
Subject: Re: Meeting minutes (Sat 8 May 2021)
To:     Robin Randhawa <robin.randhawa@arm.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Robin,

Thanks a lot for doing this!

A couple notes inline.

On Sat, May 8, 2021 at 10:24 PM Robin Randhawa <robin.randhawa@arm.com> wrote:
>
> * As discussed previously, there shall now be 2 meetings moving forwards. One
>    every alternate Saturday and another one during the working week.

The 18:00 UTC will be monthly, first Saturday of each month -- I just
sent the recurring invitation to all folks that came to previous ones.

If folks from eastern timezones are interested, we can have another
one at e.g. 10:00 UTC on the third Saturday of each month. Please let
us know you are interested!

(We decided monthly for the informal one because we will now have the
technical ones too, plus possibly the alternate informal one, so we
didn't want to put people through a lot of meetings :)

> * Generally speaking, PRs should be the way to go for any code that needs
>    discussing.

In general, having the "code in front of us" helps for those kinds of
discussions.

So opening an issue (for bugs, missing things, etc.) or a PR (if it is
an actual proposed change) helps with that and allows for code to be
referenced etc. Also, feel free to send an email to the mailing list
if it a more general topic, even if it is code-related.

In the technical meetings we can also share the screen etc. as needed.

> * When using qemu note that most distros as of now do not have a sufficiently
>    new one. Eg Working with RISC-V will need qemu v6.

The pre-built ones we use in the CI are here in case it helps someone:

    https://github.com/Rust-for-Linux/ci-bin

Cheers,
Miguel
