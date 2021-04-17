Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D88C433ED
	for <rust-for-linux@archiver.kernel.org>; Sat, 17 Apr 2021 14:12:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E66861207
	for <rust-for-linux@archiver.kernel.org>; Sat, 17 Apr 2021 14:12:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236299AbhDQOM6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 17 Apr 2021 10:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbhDQOM5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 17 Apr 2021 10:12:57 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A8CC061574
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Apr 2021 07:12:31 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id y2so31286560ybq.13
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Apr 2021 07:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8HyKZoARXnp7d6s49xGhgRYc/s1133N/eh04b4I1yt0=;
        b=jDW4MOnfj0wrUaHwssXeBKNa17N8sAC9jV76xTXJ9vH12TxzYtT/rJCep0zwOjWWfw
         rRjc15qBJM9QINPwtdkmMwfO02Xt08DYftDGYKeQd5+Jz4aUM0cWBMNS3gbb9fHwgHSV
         dv1oxYIYsdvhcj5/38ZhKvUeyM4M0P9qHW46827+s8tym9be0FMCsmC4cBt8/oCFh9H0
         62W/fK/c7fRV4lRoCLVb7htj1Df0qWDUwavnpCVB1GiMsam7/a7VJ/de2KwziJZXolP9
         3TUt9p5TwLy7v99vvp0zM7bClwnsQACL7gAc1EswgiB/3GuaqGVDDsXLhdY3M0VoSeqf
         WYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8HyKZoARXnp7d6s49xGhgRYc/s1133N/eh04b4I1yt0=;
        b=eGoNU+UaZdpwCmwp5BbLaUaJ1D82mWU5qNch6xHC7o+e2VKYr0rfNy7fRLF4DL8f4S
         OFuf1n/LLLoEtqnyb7OP3TpCusnzIpdm6nlLxH6lq3ZGpRP/9zWV7gie8zld9MM6dqCj
         Lllj4Rr1CdJoMOOTKsQKuBwkZIfAFAYqUCKKe9ldCUtCxLcqymeH0CxpiANU95FXxTk0
         vzRonxbotgf8UbEUtF0AbHDfAdFiR/3yDD44sHv/MOC7iGlJlxgIOYDul/GlgqApM+46
         xuiXowDK0+IZMTJEMYn+5IIEXEkJwIwydo/boCSRGjzBU47qGEZnnaA47wthpKvclBQd
         Sb0g==
X-Gm-Message-State: AOAM530S7AJF6FGUXGbnZlo5rfdoO4/BNU1CsO9je4P2FHWxNzG1xnwo
        2wuMbQrANZ9Jx3Myorrwf/LYUstTSRUIXoKjaVN5DHJqDSc=
X-Google-Smtp-Source: ABdhPJzHd578pSIioxMn8adS9ucHGD+TUZ5pfZvswmp7NoZ4QLU3EbcQY8UE2/PYAxYI3NOQq6rwV3KzcDtknw6qokE=
X-Received: by 2002:a25:818f:: with SMTP id p15mr5012641ybk.135.1618668750922;
 Sat, 17 Apr 2021 07:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <GHpJ9vz8MmuBmcVraVhQYFZ0kw9aucc2_pq14xkCgm72o-h438lbjHh3dGde9CAdOtQe7rC6ZSKJ6nQBvl9U34b5wmDhGze7UEVy_0u7Guo=@protonmail.com>
In-Reply-To: <GHpJ9vz8MmuBmcVraVhQYFZ0kw9aucc2_pq14xkCgm72o-h438lbjHh3dGde9CAdOtQe7rC6ZSKJ6nQBvl9U34b5wmDhGze7UEVy_0u7Guo=@protonmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 17 Apr 2021 16:12:20 +0200
Message-ID: <CANiq72kRWVBX+giOtYHwVsALzbhf8rTWVQUnxaw560m0ozfRWA@mail.gmail.com>
Subject: Re: Mailing list request
To:     John Gillott <johngillott@protonmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi John,

On Sat, Apr 17, 2021 at 9:00 AM John Gillott <johngillott@protonmail.com> wrote:
>
> Empty Message

If you were trying to subscribe to the list, please see:

    http://vger.kernel.org/majordomo-info.html
    http://vger.kernel.org/vger-lists.html

Cheers,
Miguel
