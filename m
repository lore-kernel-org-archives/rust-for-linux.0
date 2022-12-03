Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B680C47088
	for <rust-for-linux@archiver.kernel.org>; Sat,  3 Dec 2022 17:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiLCRxE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 3 Dec 2022 12:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiLCRxD (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 3 Dec 2022 12:53:03 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66538175AC
        for <rust-for-linux@vger.kernel.org>; Sat,  3 Dec 2022 09:53:02 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id n184so9457628yba.6
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Dec 2022 09:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jsWyxw8Bb8vyQNfNCsnLvRib7t9OzsQ+ISI82lpJft4=;
        b=JPSWBB/d+ALsSrhDTjk/S6t9huUeuxxzTeK309FO9ujL+aNCFSwN9G8EqpTS6Q/nL7
         Dmr5KoJOkVHU8uZc7+vaQsJrhDy2ut33KXYFclK2K2jtsxz7sEE9WHIvtLme/McMCOOT
         n/OfCjQWsUbTsYWmW6kbQhqhBYBbMU5MwIkXxGFk63L+XLbXpJDNbnVIhZqzsoKf+ADu
         jSTWBDvFNRUQXtidlBpCJ8/cWdDyj+W/tDXDxyuPMF2rDk24U6pXIPb6TBdRnRy1dZPC
         DXwC91B+QEKgdSuRMDuYJEAl5Tix99KnxXrevn8lUwq0XNVg6gAp5XMmlUHAP22PjJZo
         mRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jsWyxw8Bb8vyQNfNCsnLvRib7t9OzsQ+ISI82lpJft4=;
        b=0NMDE4NyZ0qvVBV1nn3KcH8k4bz9jKtuuUStofsvh/osPy0mdGoOAQTk0GtDyfqoeH
         dgm9rexLg6ni/8idiEDtymwz0FaBhmxu5AbXhZ023TWgK8d399GzChYYNitRk/at1b3H
         9/BMAF0LjajhPdOO028m9IX4mV0nnAqrNk6B1bIMzaYZ6S0exnyH1iLrKg1u/3cuXITb
         8w/+DMtkVDzI47Ntv5qdQ+CgsA1IvVh1GurwsMmNgWjl0vaJnncANsC5UAnZ+6kTj7+h
         n/Fl+6nadofNTEzkQMFkR9No2n4F88dQBILMk2eE9gEt1WHyQr8fjLazP7lAINW/ZG2A
         9gUQ==
X-Gm-Message-State: ANoB5pkNjHS4UHXgTmbjzddOKxHPT4EpGwhhedDWRO6LCinYtZ1Deg3A
        Wp7EbwThR0z4h9ldQbcx1f2ykSmHHjTG5k3NF+L/DF+nVReNJg==
X-Google-Smtp-Source: AA0mqf7pWzRfHLdeMWmbqlgME+OpSQOqws+N3INjB7f6uW0U18y72cwRQ7kox5pBbkToXxpWv6+IkNYoFESq/hr+tfs=
X-Received: by 2002:a25:44c5:0:b0:6cb:16d0:1ae1 with SMTP id
 r188-20020a2544c5000000b006cb16d01ae1mr52436453yba.581.1670089981556; Sat, 03
 Dec 2022 09:53:01 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 3 Dec 2022 18:52:50 +0100
Message-ID: <CANiq72kTYk6=PduJyoAT0ViYSwPt07hqNMAs=irviQ1QeW48hQ@mail.gmail.com>
Subject: Reminder: informal call in 10 minutes
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call in 10 minutes from now (18:00 UTC first
Saturday of each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
