Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9E5C433EF
	for <rust-for-linux@archiver.kernel.org>; Sat,  5 Mar 2022 16:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiCERAG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 5 Mar 2022 12:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiCERAG (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 5 Mar 2022 12:00:06 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B7841FA9
        for <rust-for-linux@vger.kernel.org>; Sat,  5 Mar 2022 08:59:16 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id i14so8744294ilv.4
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Mar 2022 08:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=j4+r/P2ldHbYCk2cQdAtxwF0cCtTh1uBjxEKcfmypBA=;
        b=LOg47MBWKkce2gh7QiEQ67yFVWe9K+92oz05WfU7LQzblj9uVErC6aZERgs66bgZ0P
         0WpRMhEiUV6IlCvZHoKiyDwBtpLpuJo0DpS0RWATL3MXBXdVU6/wsKMq9SyudnP4wgIX
         gLZXOc+exDHxGRhtZte0I4sGueLZ/LvGfvam3W3/Jr3h+Qd+LSlOEHpRhHAyQPDaqfsZ
         GRTxBhItWSTMpaLqDmbbwhWlC0mP/HLajNAlP0lCC0bWq+HFZEozi1sAo4ZEp3ZNBE/n
         CIUnQ8eb9MxcFqcdd21TH4Le9/oJtt/ig25cW/I6NMfLc2kg48RA2SpOfwOMAd/ze1Rj
         BYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=j4+r/P2ldHbYCk2cQdAtxwF0cCtTh1uBjxEKcfmypBA=;
        b=a3s2iyCZUnx0MwhyWExP28ulZ7UCt5N40N3tioSRvI2kpW+tjgFakAfyE4qOTKW/az
         9XTREnMx3eTcxEHQHYotNgCYOHtP+BWSItKpYGp3V+nHibHDrrOd8KnFG2cwB+g9RhaC
         vDfK4TMWhpjm71qwKvtWS0/KdBbVsr/i8cL0DTLaR4YodO5Ek3LUq6w7I9THeGAhMZR7
         D8Xow7/QJ2OwnAWJnszrB3XsvSuHSJU33BOU+sy5ipcgfNAphr2+SmBU0AgaD03XEL3J
         u7O/R8jrAI+odwkPw3qPanj7Qp1ewGBBSY+kVPAPIA5xyuNr82qdgfBqaJjEZzGCT8Se
         Ut3w==
X-Gm-Message-State: AOAM533+Io8hZZeG+FY22Qxi3BQonbL4+Tg9+fSkzFEhRY8aXVKUbHH3
        +JwgJwOVNIi3Ewk40KvE6UseAbb1NkPFflZJiqLydd57
X-Google-Smtp-Source: ABdhPJw0uLP+jzizZIuX6QrUgPTEX4KoWPydlUtia3KeIUIA2YlpPOPRNSisflteT3dtZdl92kqc9gyWq1CrQLiumCc=
X-Received: by 2002:a05:6e02:198b:b0:2c2:c454:ea7 with SMTP id
 g11-20020a056e02198b00b002c2c4540ea7mr3826409ilf.151.1646499555732; Sat, 05
 Mar 2022 08:59:15 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 5 Mar 2022 17:59:04 +0100
Message-ID: <CANiq72k=q=G5Z3TEORcxHXEbzX_uxdwWcP2a=TOnrZXJwZyo4g@mail.gmail.com>
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

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
