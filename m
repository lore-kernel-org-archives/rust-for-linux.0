Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A850DC433FE
	for <rust-for-linux@archiver.kernel.org>; Wed, 20 Oct 2021 13:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FEF561052
	for <rust-for-linux@archiver.kernel.org>; Wed, 20 Oct 2021 13:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhJTNmS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 20 Oct 2021 09:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhJTNmS (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 20 Oct 2021 09:42:18 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3CE0C06161C
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Oct 2021 06:40:03 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id x1so24626736iof.7
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Oct 2021 06:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CKayDfuMbEAvNTKtOKwXLp1bFRxVAuOjT3w7MkBxmMs=;
        b=jkcMiRgsjIJt/FI5mxPKjnrBKffq+IbgHge/y8FfAxn+LEuONyst3JtOMRriNm20OZ
         M/XRamwfzWyIXZs0KYHF1iMIoAOOsDTmHsIj/CidVy4RzWPXVptWMm3jT+pyy0RRgdwh
         4f11wF91GeeEG4Z+jpaSflGkdIziV+B0/p/DK88f7j8EzaPG+JRm/FSyiWkgcukygPrA
         qwytuuFx/3WjlC9b5KAZSlCIlb2GAuN/300lgk5ZqF2Nxz8NAEd3oqo1gry8GsP0ly+l
         uXrpshCjrnMXmr/fdbcoxuwMeJCdZgyuYBc6TW9k163YgfnkhmVGP5JEci6sCTqIdPk9
         jKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CKayDfuMbEAvNTKtOKwXLp1bFRxVAuOjT3w7MkBxmMs=;
        b=DgSyRJ+F2ZLYIqwYjJY1CCIG26Txe+fkzB5pjvYyK68mFdza5S93h8Y6TBmwohWemX
         i1V4ddy6m0jPKPkV4FP7XKfWZAUY1qKJAUNlmNWpIMgewBlttj7/NclrpQKdq0gipSNl
         quqJ8p59FU+ErTpN3JSxKuJRnh/ey57+oHi2z/Pd8dHagpjGVwIjRLv3HIBJZnHD4qET
         KOx+fGeLXxKGyTGHedO80Sxcs3o6hbcFwUnt2uVZwUYvtsdJ6tOeoEAujMtBcQvElUSr
         rppQCBC5r1dcKz91n1FhyqldTSsWBrPEY6X+7qguTYPKHG5+8iGwAM2QGTo1nhGDYLID
         CVxQ==
X-Gm-Message-State: AOAM531f1W+V8aja0pBHcEESoxMattWAVMjDIsVbJytC4F6LI4zGlRkc
        3krzzoj99tuja6fVDx40cG8pP6bgDHcq9zUN4x9ADmFTWHMjGg==
X-Google-Smtp-Source: ABdhPJy6NsQ04lrXXHJFv2n5O8l4DStYKI13RRSW3ZrJ8GA4Ppxo4bqDZbphMUekLpNDOGaH3vGk7A8rGSCeChECTdE=
X-Received: by 2002:a05:6602:2acb:: with SMTP id m11mr11946981iov.155.1634737203293;
 Wed, 20 Oct 2021 06:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_02E859B3B0CE645095546B216D89E3DB2406@qq.com>
In-Reply-To: <tencent_02E859B3B0CE645095546B216D89E3DB2406@qq.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 20 Oct 2021 13:39:51 +0000
Message-ID: <CANiq72mBPzfgtfZEyP+vsKgf2JRizA8q56yV0GROfAzS03+pAg@mail.gmail.com>
Subject: Re: About Rust for Linux question
To:     zkXu <1060447830@qq.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Zekun,

On Tue, Oct 19, 2021 at 10:09 AM zkXu <1060447830@qq.com> wrote:
>
> I am Zekun Xu from Capital Normal University, China, and currently engaged in the research of operating system security. I want to install Rust for Linux:)
>
> But I have some problems,I can't find option Rust samples (as shown in the following pictures).

Please use plain-text email (no HTML) for the mailing list.

As for your problem, have you successfully enabled CONFIG_RUST in General Setup?

Cheers,
Miguel
