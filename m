Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59930C433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 10:05:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B6C0611ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 10:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235225AbhD0KG3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 06:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbhD0KG3 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 06:06:29 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31CDBC061574
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 03:05:46 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id t94so15408648ybi.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 03:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=2NFs/0s3YZJ7mNhJG90gQ2k0bE4RY4zksyyK8ML11MQ=;
        b=KO7Y+BZxiobGSN6EUx+yudWGLGarc91nuaFtsEPJfOhyuteveHEGacpm8soHe2SFpb
         Buv+rTAnzYHE9FUDgSw0Hk0aopFa27FLWG3K0mAQKqqylcMJRtksnjBjs9y7Xt91z4A9
         seI1F13993AJ1CaLK4kSkynSg6mFgEOQT5R8BTTsFptRR4bImk8L+t6Z98Y5sD72skl9
         pMneY+i9kh2Drz0xhoStXMQ8VZlQ8pBFomt2hWdC4sOxZgYWEh/KASktDcrN+G8BpFzF
         PDuCBrWznIZa+wcTdpl4SYQ2WuqGtms07ajifmL9J2bsM3PJ84yrHqYo6mkL1MYmOgZl
         xb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=2NFs/0s3YZJ7mNhJG90gQ2k0bE4RY4zksyyK8ML11MQ=;
        b=CHRvsU/HGh7Qj2dG+FWMAiQE3o3rixo4IPGbb8vpavsGALYyQnY/n3QDhiaElcddv2
         bYJq1/XidU2vp+A9W1yg6/xWkm6f1C5ozcivnMrK9X8KYAV1x+MbqqPcJRZPoWJTmG/q
         8w5zv+cXykTX+otvXmwR/KGeIDkJwsD777N2i0Slm4+LesSxRBYPliVMh4t31L5oKdGo
         8NDn6I/ofVQ99r3ppxr5eZ+miFH4PkgEoeB2sauSaHhGUrPLrYdpyHolQm0fCpvlsYqv
         HnUASVS6mLog3mhkGkLiuyaQ/duAZmC49Ad2FEOMr4dL02nlcdCpdo/nn+GUU2IoA/ON
         B9Tg==
X-Gm-Message-State: AOAM532Zs6RK367x8oh4Q7dmsaFUxO3IvzeJXNZ6TNbC89i4DnKYns/C
        oxyHQtAbTru9N/+d9mBB+PcvRaJ51AXdDB9PFtvLpRah3jtdOgvu
X-Google-Smtp-Source: ABdhPJwr8mOSsVoObpBTtB/yhb834gYBYPK9yOGZ4pfV+h+RBA56lzn0+5usqgC+/hxNEbTtG3rAufWj7cU5zGX74iI=
X-Received: by 2002:a25:bc8b:: with SMTP id e11mr32153762ybk.115.1619517945617;
 Tue, 27 Apr 2021 03:05:45 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 27 Apr 2021 12:05:34 +0200
Message-ID: <CANiq72mhL_i0RpdEoyBcfBm2HS21o5_KY74PGFH81EVFbXN=Gw@mail.gmail.com>
Subject: Future calls
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

Given how many people joined last time, that we ran way over the
allocated time (which was impolite on my side to those that needed to
leave), and that some people are now working on this as a day job; we
think from now on it is best to split the meetings in two kinds:

  - Monthly informal ones on a Saturday, similar to the last one. The
idea is to share news, welcome new contributors, discuss ideas and
issues, etc.

  - Focused technical meetings, held as needed, on weekdays. These
will have an agenda/topic/context announced in advance, and we will
strictly control the time so that people can schedule them on their
job day.

Please let us know if this split does not work for you.

Cheers,
Miguel
