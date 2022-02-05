Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF20C433EF
	for <rust-for-linux@archiver.kernel.org>; Sat,  5 Feb 2022 16:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352826AbiBEQ7I (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 5 Feb 2022 11:59:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239376AbiBEQ7I (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 5 Feb 2022 11:59:08 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE337C061348
        for <rust-for-linux@vger.kernel.org>; Sat,  5 Feb 2022 08:59:05 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id m185so3078995iof.10
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Feb 2022 08:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=KhNM6sceC9j8ZawPhTs6kmERFvVfgNgFi7F8cP838qU=;
        b=TO6fHQ6FgZJLlo+yR3au1G5jdMNZ/SEXBxBAgcPxN9fS4njQHO0YoaSJ0r00vD4T9L
         hkKZvo1nvwgGFg+xY0obDgA+sTz4ZMxg1VZEtCP4Ii0b7MPwmhSmNFdIq2r3rojDrgVm
         F8eCkESQy8ltzZ45hJ/UDAoC7roqNl/x0ZV/5CrUo+TzoV8FUceCMuOMsQ50o5Bfn5n2
         4kS61ggbCyjZ7Fs6tjqHWdbHRVAkv8wcKcg6L7clvo+MScR9Osc5joz7laNfxLjUSL/Q
         22hVeV5JvR6N7RD8tsXPvDHTrBJQgn5O1yPGsQqoYb1DizJekhKWfdEiSAwI/+xgNdyC
         guGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=KhNM6sceC9j8ZawPhTs6kmERFvVfgNgFi7F8cP838qU=;
        b=uad3Ncx+FEI7ERUvlhZqu1HAM/LRcOYz1DD79HLFQl2YpxERBUOLqX40hPcyb8mIUl
         QXgLN7lfmr6kwEskdSoIXl+fLEWCm3bsWujRNapQ+YxvKjXOCpqiGYhL2DWrEeQ1Zu0x
         sxkGsyr18tVyg4FEF8dUY42zIC5eGtSk3NskZhHgYN/bWrJ8apW7xLTHktu9k1KngMX+
         FQDVNCtXBXQ616i2odLKrDvzh91bzS4hmbHKrDRIdSNxH/fr1v+OFs4gFxx1kpFUrUli
         9OZ56B5LnmdES/+cRZr3WlARKex9UEMe5PUdXVqXYPuC+4/AT6S0I6D+jlvYcyf4lXjU
         H7TA==
X-Gm-Message-State: AOAM530tZluO2cFOpYU6qT5xrXvpsSgZYpxiF8+1GxgGc7VsDZrGCzA8
        zcz3w+qTReiAbLe7llPNaD5gZeUtUZ+7txqMjyopsqMnVHs=
X-Google-Smtp-Source: ABdhPJw3PYpzIhDlnqDA7wPYefXsPdYbPuEPFBprStOJVrB6jBEt05mhaKzfndunx8s/5wJs2pU4VitTVuGwJ3Tzjys=
X-Received: by 2002:a02:aa09:: with SMTP id r9mr2184493jam.199.1644080344624;
 Sat, 05 Feb 2022 08:59:04 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 5 Feb 2022 17:58:53 +0100
Message-ID: <CANiq72mDf1tcLHRpW6XSL+ijeZzthxtVaE=_gew8nocxWZ1UQQ@mail.gmail.com>
Subject: Reminder: informal call in 1 hour
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call in 1 hour (18:00 UTC first Saturday of
each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

Cheers,
Miguel
