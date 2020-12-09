Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD8DC4361B
	for <rust-for-linux@archiver.kernel.org>; Wed,  9 Dec 2020 23:21:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07175238EB
	for <rust-for-linux@archiver.kernel.org>; Wed,  9 Dec 2020 23:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731544AbgLIXUz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 9 Dec 2020 18:20:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbgLIXUz (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 9 Dec 2020 18:20:55 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12139C0613CF
        for <rust-for-linux@vger.kernel.org>; Wed,  9 Dec 2020 15:20:15 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id k78so2926571ybf.12
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Dec 2020 15:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JEhZZcY3F0lvg1d41YYGUPw2lwJDihBtH6DdBPtd/hI=;
        b=SNhoGjhpo0EEaIBdiuweGP9N8x6kjr+dF782nhkVCZc5QeqNkibrvVNEgRjnRQ7g0q
         qPhFSjuoC7eGs/0RyBKxvsarxydiJCC3UBGBMjUWQfqh2ghctru3RFWY+BshfEmAoOhn
         EmsrMoYTWbvlKzuj7ZXHbSzQP6MAPRttNLCgHNykfYCpf0ubTirUpsFxE8UGFSJcH0UH
         +qlksZbKXTLbkDIxlV1jeM8fsZPKv3Zgl3RxFJ42771gWsidXZ3vsxKZOAX2Y5qoy93z
         4uDhJJBsZlS8hBySHXuNih7taz08pxMMiLqCb9YLtguuFkNrdkVFKHNsdAiMY01q7OHM
         gGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JEhZZcY3F0lvg1d41YYGUPw2lwJDihBtH6DdBPtd/hI=;
        b=Jr+7e7lx6gbxRTVrsOwaFYkJhYrvu3g6N9hCwzWiSY8shjDKPk8ZlkMreBdfLHU/QO
         sK+/h7JUEFnLi/dWyqeruzwFhgJbgFg1373wawaXLhZClekVwyV+q4c6HKaKND3dAOHI
         tgmz4zy6aFI4rQpQ0ewa+jCMNO2jF0eBQMxI1Jlb9KiLED1c/20+xBFJad+Ncsa+7RD2
         Lb0pFVwxTOKaO90ylyFwCnlWLSgyEhChO8XDSAP4QEVimdoXtaprVtSDvhLtMBxMBF8Q
         NPrYOIjn9Q5Bf/AEKL/zbGv5py9Mr8dAArk5ZsgEGmZodn4Q1Z0J/KD8o+oVK7VCO0s/
         qBTQ==
X-Gm-Message-State: AOAM532QyJ1DLIVg3SR+9OWzqmItj+rgDlYgaDT7MKfdWZ7vqVf7dOWM
        PmVuqN0qWwMFB84mvQQpYzbeBHwUVDOqH2hjzkU=
X-Google-Smtp-Source: ABdhPJzB1eTPPjSoZvkDARXnbwxoRY5nFQ8GpsBzD9vKGNA+Z4z92jq75pb0L6fwux1ZLe5FiFRtU4XkkP9/B2SVbqM=
X-Received: by 2002:a25:2e0d:: with SMTP id u13mr6951049ybu.247.1607556014419;
 Wed, 09 Dec 2020 15:20:14 -0800 (PST)
MIME-Version: 1.0
References: <aa2ff401-d552-fd46-b2c3-2058af8226c3@kloenk.de>
 <CANiq72kKthjwUvBpHHPbhFsE555DriFVTtm2ziFTjwnPH_aA=A@mail.gmail.com>
 <cc71bee3-32e7-f3a5-8afa-a373438e5b36@kloenk.de> <d417fec0-c5c6-edda-796e-a861f5518eed@kloenk.de>
 <CANiq72negqN+2eOjieYW1Zas1ays3t3W-+wZisXjF9q=kob3yw@mail.gmail.com> <6c621482-94c7-b34b-6d46-5036df3fc1ff@kloenk.de>
In-Reply-To: <6c621482-94c7-b34b-6d46-5036df3fc1ff@kloenk.de>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 10 Dec 2020 00:20:03 +0100
Message-ID: <CANiq72mfzkVVV+zV-GRWo+kTh=b3VayPz-9Bk+Yn35YuusDEQA@mail.gmail.com>
Subject: Re: module as seperate crate
To:     Finn Behrens <me@kloenk.de>
Cc:     rust-for-linux@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Nov 29, 2020 at 7:30 PM Finn Behrens <me@kloenk.de> wrote:
>
> I create a static mut Mutex<&str> (or similar) to contain the pr_fmt
> string. I cannot init the mutex in a const fn, and so I cannot create an
> static mut value which already contains a mutex. So I have to call an
> init_printk functions which creates this mutex. That's all what I'm doing.
>
> Will try to get something working the following days, and then send a
> patch. Mayebe easier to decide then.

This email is just to give Wedson an email thread to reply to. :-)

Cheers,
Miguel
