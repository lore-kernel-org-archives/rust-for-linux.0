Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD01C433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 01:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC082613AE
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 01:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233361AbhD0Bn6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 21:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232295AbhD0Bn6 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 21:43:58 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC037C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 18:43:15 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id s22so20149626pgk.6
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 18:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=zRQeOJX3HV7K6JYwcjW0OEpjeH+y7LJ9bRNMfOYypJw=;
        b=TtxNuv9Tgn/cmM5dtF4QNQy+5Y00NS/UGsDGSksuyKq0Vzj5+VhT3RsAPsNjSnpFTX
         IOk4pdTTexMHoMd/mupZLGudAvsxWeAHD3/FupYGA+C4/zpdcrz9HeN7HK7JsIfHcILo
         6RYFpyXvLJ6N4pYMia59UiRIPTppRDnBdob0Tv53Rx66GjKJXHqgyJRY1DLt3Kf/qK23
         Za4apdgn9zujSSY377MqRWBnhdrb+Uq9hvbHz+4UXaZdfNSo781BfuIIlJCIPOTLOl60
         2TBGIqtceaV96DFjiWFc4v2jpvL7jM42BQUxIIWblY3AuDsvrSN1d6zsVqr0tMzRDRUK
         G54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=zRQeOJX3HV7K6JYwcjW0OEpjeH+y7LJ9bRNMfOYypJw=;
        b=DMxsXwOT3QzTBbfoAQmETD5aNwU1Jk3kq0vuDU7Yl7dOCVRrLL29fpYzjE6m2LXIKK
         xHvNQX4/lmOTWdQRLMebnmsNny9LQJ1bz6RTEIG5EeOz59flBO1ENDuqd/u1lBLgUwFF
         REZ9Xx8JqRAirrsUZVwUxjP7yRjnorVco/uLREFkkim+ID7YhD6wU6UtLnNOuHqFclXF
         +HrF7cnrawaRBh9BlKGHLFlAw9MjdpzFvRVvPj9nWmj4ozWEw32ZLsB/7BPNrUF1K4Kh
         vaaIS6t/h2qNhFwKcC5NpUSGNgf+y0R36ZMNdajpOkdMPLBwoLDvVASKCaRuCpEIsczM
         7fqg==
X-Gm-Message-State: AOAM5300qF92z1nclysVpPXiA9kcFAPjz5k/Fbo60K2JkN+os2KK+MU+
        WPYcmODc9DhSbsyHQHFU3wOxipdVumjkDoynieoCXdkh+1GN7A==
X-Google-Smtp-Source: ABdhPJyj3M+8jLVfDOH+a8ZL5jkfwwaLkqKc5a5DL7J2LxDTiKsn2LtK1ZC3BtXuZTpgerv6wLdAPmZcrNVmAFZGCOQ=
X-Received: by 2002:a63:7b4d:: with SMTP id k13mr7546304pgn.104.1619487795404;
 Mon, 26 Apr 2021 18:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <YIdUf1C5VtWn/D2G@localhost.localdomain> <YIdXB88mPZ6alJix@google.com>
In-Reply-To: <YIdXB88mPZ6alJix@google.com>
From:   Samantha Miller <samantha.a.miller123@gmail.com>
Date:   Mon, 26 Apr 2021 18:43:04 -0700
Message-ID: <CAOBwtAde5s8dwxAYBimv+Pd+4gBLnqAKtY_1wea6yNgmDZXfeA@mail.gmail.com>
Subject: Re: Exposing semaphores
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I don't think this sent last time, but sorry for the spam if it did

For my research project writing a safe Rust file system in the kernel,
I implemented RwLock as a wrapper around the kernel semaphore.
I'm not sure if it'll be exactly what you want, but feel free to use it as a
reference or more. The RwLock is here:
https://gitlab.cs.washington.edu/sm237/bento/-/blob/master/bento/rust/src/std/sync/rwlock.rs.

You can do a similar thing for a spinlock wrapper around the kernel
spinlock, I believe.
