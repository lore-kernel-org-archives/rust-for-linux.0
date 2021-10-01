Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C33C433EF
	for <rust-for-linux@archiver.kernel.org>; Fri,  1 Oct 2021 18:30:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3E1761A6F
	for <rust-for-linux@archiver.kernel.org>; Fri,  1 Oct 2021 18:30:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355928AbhJAScW (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 1 Oct 2021 14:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355900AbhJAScV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 1 Oct 2021 14:32:21 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58374C061775
        for <rust-for-linux@vger.kernel.org>; Fri,  1 Oct 2021 11:30:37 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id q6so11523273ilm.3
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Oct 2021 11:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=sAOMZh3Hj9zMG5BoGRnAUbkkTSArkSVDCSJpPZl6NYI=;
        b=bJYC9iWa14WIuzhsrsprioBQxsDlCNyBCi1a1beb1rVbnJo/pnmWjRZXb7T0ehbzy8
         KcIkRukQP3pCfJMc+YOJnbuzi2sZkAyBqRkZL0g0Yt5/ZQHBVd73/kaqGWmrSetuFebV
         M2YVTwFGtQwLvkQnDU+GLeoSI4RMlaJLFCeDpS7ti0z334bUAlVhA60oILVY6v95VWoJ
         wklOj/rMxmqq2yweWh3lfa5ynJhxCJWvAqcdGd/1mdC9a1VyOBdObEOy7md/D4UKwTGX
         x7x/d/9zkuak6hu6MIHvVbN6rEMnjnYSSoZmTRJH8+1dJf1F+0hBv+88TZuFcfjCCT8h
         FMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=sAOMZh3Hj9zMG5BoGRnAUbkkTSArkSVDCSJpPZl6NYI=;
        b=t/bX7a1VJY24qYedvszfiDDg4QWAEOXTSUkUxO8DVZz2iSe6WCIJ/V1bc4VdqetP2q
         G68gKRqVRgUmByoqX8MENgm4OyNmLCGhydD3Vip8T+mEZU0+5k1HvFa/n2DpuBPz4zaC
         WCuglUpEL8wUNaeEVLoEMXEWSyRljOVUYF5q2ggH0vnyeRAmLeAp6lrMu9/2MN8x9e4d
         d8ONsklHtPQ5Qtk+r4grIl2wpdLM91PwcxMr37TvqUT2sjxrsj/UKY32ifMdR5MtprHY
         zvDxOFBQuX9Hhs7sRh6y5mW8xHWXO/2Ht2IxPXP8dHw7orEppES/slen+42YdrcDdkmF
         RrWQ==
X-Gm-Message-State: AOAM5302eBbAi9m7Ao87QyyAbA47b8GXDMk6CaEgd9SJZmHuvUjhpMFv
        xTW5gxKvaR0lBDnY76hOfW2ZNDVVlYbeyIZ9XZHDK/mvtirajbrvwUT6Pg==
X-Google-Smtp-Source: ABdhPJz7pDb4w+KPCOCVPpL0+OJrqNiAGF3vtKU2Il/P8oa/H0Eci6GKNWUeWCnLjPPAwRHMQwi3JGAHWYLwL+rCvao=
X-Received: by 2002:a05:6e02:1d86:: with SMTP id h6mr10206879ila.5.1633113036762;
 Fri, 01 Oct 2021 11:30:36 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 1 Oct 2021 20:30:26 +0200
Message-ID: <CANiq72kNcRHnmip+=B7xxZ956-qoQ6Z8=ETK86xer=MoUoWA+g@mail.gmail.com>
Subject: Reminder: informal call tomorrow 18:00 UTC
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call tomorrow 18:00 UTC (first Saturday of
each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
