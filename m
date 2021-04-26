Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF25C433B4
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 23:16:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6825161151
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 23:16:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbhDZXRC (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 19:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232235AbhDZXRB (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 19:17:01 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848AEC061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 16:16:19 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id p126so13376492yba.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 16:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q9az9LMPd3t21tsc/NBpZhMnfyNNELo/AlVYQtox7aY=;
        b=h68sUmC92T9Sxe9tRJwOTJCJcjNoMKgkcMdDrhBovARnjWgN6rTCPTcJop+Pho6lPO
         puzqGDTOtvuxcVu71rtFzUMwoN7PqcMLJaIJEXNJ4Rqz7xoff8JwoainN4SCZsPB8JaW
         WYBLv3g/Wwj+wl92FJziVgvrHz3vZ0xEsjavJ03fZekRpxJ/6TgjkXJfVlSmz2j99hCz
         CIDYi3kbtvCQeuSerwXyjUsg6da1uHIHZdWVGN3KbXtyK/XsqB9mQK7B5ybKrbRMU4Xj
         MqQmE8Pe69HRiMQg6D/c3alspMmD9i4hU9PEmqlwQVgmy4U4MfQTp5D1d4ZIMGznqQfZ
         Ar6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q9az9LMPd3t21tsc/NBpZhMnfyNNELo/AlVYQtox7aY=;
        b=cFYsy4xYSXgjPEpHq3qO9UmPTY8sm+IIy7yDgEKdk+e4mhQU/z1gf3/xPC1VgSHK6d
         SDKQX5iogSLFR7PlZvZdhh+newAMsbc0zhf9N+QW6R6gSIDHXigw0DlI8ywDiqc44+I1
         JdxFB+66MKDMivD3u44/9Lgv7SAC2IjO/hl9bKUy9dh7jtsgc6EvxYrIjVmoYQOPeYda
         F8rzKSE4IC/HuXGgBXqpZEzJKgZTRKZcwH4mD7i+3/II8JA7vf4dZs1Wuj8vUMb1yWkT
         9KF2VKEwnnK/oMtdnqFRRaUexepNMzqkKiK/yMQ5gahf9jgyZdcTVfoAc24bj7G4A84o
         zVIQ==
X-Gm-Message-State: AOAM530C4SWAA9yJpHls4if5g88rjcCNpQ27+vQ17qbkXYeSYshwkQNA
        Y1GYLaPXNQ8x+Hvug0h3bJvZL2ichS3/2skUK60xHPt6ucvyzg==
X-Google-Smtp-Source: ABdhPJwSkj/xoFVl/6XxBE2gpaopXuckn2wakIsonXp6hRMmi/4n75JFHz9pLquYaGXydYNwswFB7fBRRiJQ8jm2l7M=
X-Received: by 2002:a25:bc8b:: with SMTP id e11mr29042490ybk.115.1619478978671;
 Mon, 26 Apr 2021 16:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmvQ+U7LbwLRyY6FC70Y9-1Sdp8KdYRXryUvk9oTHvJSh29nQ@mail.gmail.com>
 <CANiq72knPX3GHHPPrZ=ErgX=1DttMXjOShcA1ZF4TENzNRaWzg@mail.gmail.com>
 <CAKmvQ+UGiKVchv3DpR-QhyWqQ6-kx9HETNUcZqAv+An0ZgQwCg@mail.gmail.com>
 <CANiq72=oSMO1yGKFdOfVSZbLcsTVeJCXmbD_RdpnOqqKw4p55A@mail.gmail.com> <CAKmvQ+WH_PVy-XS+Rpa+_8Z9AjNDVwkTQFMZZtAZc7G9-7tJoA@mail.gmail.com>
In-Reply-To: <CAKmvQ+WH_PVy-XS+Rpa+_8Z9AjNDVwkTQFMZZtAZc7G9-7tJoA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 27 Apr 2021 01:16:07 +0200
Message-ID: <CANiq72nSypSSbSwhyaSmfHuT7aLHeEP9UKwj0x7yjFZBwqxTgg@mail.gmail.com>
Subject: Re: [Question] import third-party crates in kernel modules
To:     Hanqing Zhao <ouckarlzhao@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 26, 2021 at 10:41 PM Hanqing Zhao <ouckarlzhao@gmail.com> wrote:
>
> After I finish the linux kernel integration, I'll show my
> demonstration to the rust-linux community.

I mentioned the meetings because we have been discussing this topic
for a long while and is usually better to talk about particular
approaches before putting a lot of work just in case we go for another
strategy.

Cheers,
Miguel
