Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913BCC433ED
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 21:55:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CE0C6128E
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 21:55:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhEIV4V (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 9 May 2021 17:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhEIV4U (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 9 May 2021 17:56:20 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36A0C061573
        for <rust-for-linux@vger.kernel.org>; Sun,  9 May 2021 14:55:16 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id i128so8058291wma.5
        for <rust-for-linux@vger.kernel.org>; Sun, 09 May 2021 14:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=duYnzYiKOFLMd0MAgH0QvdifB+ouMcA8vokFBq+jVE4=;
        b=bVdhidBHuoxMQHtd9d8Ncx75dnv9kdQ6d7skhl/93DdPCT/mkUDP31csUka0TX03k9
         /AAe/gMnMT/0hfUTqEcmWRT5x3CElpPcZ601Ka6PJJRMb2W3QDS2HSmmrnWDiz54pn3R
         n0XH1ZE4hAlmFMNO1AyM1pEZvc6IYE5a9ufM48OqCbtjeTC+NNHEk0Mnn42DsV3Fwc+8
         s+OhuGQ2/KViBNkC3jk/VAzB3mCcDmBJXZDqlh9cVVbPy90U85Pv7hBbT/vqqjtk31oL
         hqGE5g0n8RJfb1tDzLWEHufPPYsWiwTjIOOTrB/rDU/q8rd5DskxXyaml/umkGgAzXvF
         cmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=duYnzYiKOFLMd0MAgH0QvdifB+ouMcA8vokFBq+jVE4=;
        b=Ro0rxUrQL4NFB1bzfwEWmgJAZ2oRXW+j+IixnBTpms9gRD+bg/kE3LkzT39mPAFcsG
         Qw6PJp7m/NSA0JgtIYLr/rckXyBWhsYMxeG+ueVbKiw3idYipM8+1puNXCM2x6zqCAl7
         PglmqO+6tjOe51Qf0xhJjCMtKe9FoS795tuFm0VmgQySq6jO+rfbReMyofWo9xCHjecE
         f//eSuyaFmRyHS3UIJwDKszVGB4E2wPRkGFa44Ryp48xeB5ib7OkxVFjcxMFhJN/0hZe
         +vjbmxSVEuFBMFikeC+ANedXpIlmd1YPA/3WS5/U9IPaie9Jo/DpMZv6bMOwYolynfAY
         NR4g==
X-Gm-Message-State: AOAM533xoGW6BhGzub68KbODYeM0cdGJzgVpaOxVcazGt0JyMWnqGuoK
        5XZ5Jv+xfkSQaRyb8B+F1L//YsUpurmsg6HxnEYGcbgb7Fc=
X-Google-Smtp-Source: ABdhPJwPZ4j1cbrhMNn7d9t+gBWdWakZ2BgsZq10Kb1qg82OC4XeWfFYVgB2EiG/qo2VtmjGNZiProkJKfqu3WT8csc=
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr5060109wmh.186.1620597315541;
 Sun, 09 May 2021 14:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAN6UTazQwN=oZutVvRio1ZoXBMDm4DXNnqEnZJ_f4fD7vFqFPA@mail.gmail.com>
 <36a390c236b2f02ee2ac16208a4fc94f@droid.cafe>
In-Reply-To: <36a390c236b2f02ee2ac16208a4fc94f@droid.cafe>
From:   Leandro Coutinho <lescoutinhovr@gmail.com>
Date:   Sun, 9 May 2021 18:55:04 -0300
Message-ID: <CAN6UTaz2yPgpQymsti2Yf=H3O8eYkbEkcbaG57s2_VKxMdsQSA@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Greg Morenz <greg@droid.cafe>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Much better!

Thank you Greg!

On Sun, May 9, 2021 at 6:49 PM Greg Morenz <greg@droid.cafe> wrote:
>
> > Rust `for` works fine, until the step is not a simple unsigned int, eg:
> > for (int i = n / 2; i > 0; i /= 2)
> >
> > In Rust you do: (please let me know if there is a better way):
> > let mut i = n / 2;
> > while i > 0 {
> >     // some logic ...
> >     i /= 2;
> > }
>
> For this specific example, you could do
>
> let mut i = n;
> while { i /= 2; i > 0 } {
>     // some logic ...
> }
>
> This works because { i /= 2; i > 0 } is a single "block" expression that first
> divides i by two, and then "returns" (at the block level) i > 0. Note I have to
> not pre-divide n by two when initializing i.
>
> In general rust doesn't have an equivalent construct to C style for loops though.
