Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22405C46467
	for <rust-for-linux@archiver.kernel.org>; Sat,  7 Jan 2023 17:16:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbjAGRQ5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 7 Jan 2023 12:16:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbjAGRQ4 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 7 Jan 2023 12:16:56 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA4645675
        for <rust-for-linux@vger.kernel.org>; Sat,  7 Jan 2023 09:16:55 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id c124so4903649ybb.13
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Jan 2023 09:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=azjZkOHl4crr6vLJW69UHxDdBxBskpGZmrjdIUzYTpM=;
        b=oogy1BgklsRXPVno5+rg3bqnYD0TqVYjZ3/D8mQGkIxAzJnoMmwYK9GG2WpWJiITnE
         E/w7FsWJNi1Qk6++AoQdVthNuX3ivIu4QFXjzNyc52i+L7U58zusyMa2w+Xcv+XObYN1
         fEGHowYo5XKuRnN/xEBIiTmiq7pi1CFh8p8lIHo0osjho5lGBj+EVCPhSdEYcyjIJPnv
         a708sXvc7ss7xVrE5TVuDahI4QehU4gRsf+kkZqtuzkXmWxZ+CoX7/Bp2kLWSISV/wzS
         vi4WrCgjr6X0XpEXSYSlPtyXyrvApNvWGH0OyfQjzXg4bpKjOTJ3dmLyBKZnBMiSx4xS
         4v9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=azjZkOHl4crr6vLJW69UHxDdBxBskpGZmrjdIUzYTpM=;
        b=kA98BfHiIRKHTKl9083UqFekdKw4j00IkYXBJ6Xmb2p1IyMQDaLE3gpXCDWLh1THYr
         EHBAMdV9X6I4/pkZ6feJXCwwYVVndw7PuNSf3cR/6rJU7At9JGyCZQXkTSUIojzaayKk
         jrBy+r/h1A2mVU2SR3RLOxzZKX/YTMsMTXUEIdhGi0NZNwzCXq2zdIAea5R9hiPKwqhR
         5mVfTRFw+KYmsqmYo46sD7XRNWqM/FxGnw22dXMb3mtyTFl++IGmPDltMNEA/dv8+NdU
         8ldLzCmIqElXFjKZtTrVg5S2/591xYutPdkMLQXfJ7nYRaKo+YrYiRW2+8c0KAVVhBoK
         vgtQ==
X-Gm-Message-State: AFqh2koipm0Q048UqoOshZ2jqWQleSdgQUajcYT4+w6yUJrR+tI15k34
        /4RMXe7ht/M+tBRFRx+nCLEgVZQyG663EyZamw6T4jpVCcgiiqC84pc=
X-Google-Smtp-Source: AMrXdXsOUo9z4ugasIMehcPjMQDU0m7pRmLXu0l/gnKViFXa5T6LgAbSvnhWZJnl3LPxLU5w9o+58I0Drtl4AXmfaBk=
X-Received: by 2002:a25:1004:0:b0:712:faac:e6b2 with SMTP id
 4-20020a251004000000b00712faace6b2mr6305809ybq.632.1673111814465; Sat, 07 Jan
 2023 09:16:54 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 7 Jan 2023 18:16:43 +0100
Message-ID: <CANiq72nCXuZH9ykio_=qRV83iCc46ftuVgiBk6jc+W-6CzV5_Q@mail.gmail.com>
Subject: Reminder: informal call in 45 minutes
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call in 45 minutes from now (18:00 UTC first
Saturday of each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
