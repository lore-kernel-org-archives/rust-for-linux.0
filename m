Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED68C61DA4
	for <rust-for-linux@archiver.kernel.org>; Sat,  4 Feb 2023 17:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjBDRs7 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 4 Feb 2023 12:48:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232334AbjBDRs5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 4 Feb 2023 12:48:57 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793C92684E
        for <rust-for-linux@vger.kernel.org>; Sat,  4 Feb 2023 09:48:48 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-4b718cab0e4so108085177b3.9
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Feb 2023 09:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jsWyxw8Bb8vyQNfNCsnLvRib7t9OzsQ+ISI82lpJft4=;
        b=pMGKVT0FJmN8pBGd+sJ55YZhWDq7J5q2r9fQfYBC/2gJCYYMJEFAPPogKQ652IQ2iU
         hIvzQNcYW2/dmmUAQ43U4W2BRORowlqrmb2ioDkjFzNbMCoAo/dQ37K4I637Y9xK9A86
         wU1bg5Qo7REptLG08pgMZ2z96dtZe95zPokdnBkYKYeySoDvtQ9UCUxiN43xAWvVaqdC
         tgEbYLF7vGRWRQnArbpWql8lyyvS7L2pXuTzOUSjbwpZjP0Bgpk3/me0AW67yDuISvZK
         mb4ymw6Ozp10TZVq5uFqndrfj+3/uhrzr0nRZO8THD2h2L2M8927vQOCe5nkKLA/m8Q9
         xfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jsWyxw8Bb8vyQNfNCsnLvRib7t9OzsQ+ISI82lpJft4=;
        b=3WBdjyJqQBMmCVP5mhUL+gIAzdAtDj6GgmUink4JJLthA++p+STaUUejDYNT0y2lwe
         nxFnP74/EpF8sbAn1vEFPpMZYfP/hdAfkVXhhM8YowTebkZmoQTCRvbghWmqyVfntC4l
         JDpal/NUqQpGALaBcOwUoQLSVzKVIYXtZtJPujXPNvAG/VYAmL/EHDewaFyu/zDh4/q+
         qxvOXJ8JxhFZi/juwlS0AYjZhzH84IYhJGz1Ck5sTBVwsR76mLo++MCNpZHl94Hneg46
         92slCsTzad+tQBiXcgLWJuFK0Z51/nUbqWojFt9QwjsYOu8F7oZGI07Z1p/e7LK3y7NW
         Aozw==
X-Gm-Message-State: AO0yUKW9IOkcA6whdnQRmkitYnCMnORRKawmjPkr2Y8+54DH4qs/0Jcq
        4DFWF4zMlqraxsk4cq+5BXKnhplp7cNeKxRSfzyisepJSCke5A==
X-Google-Smtp-Source: AK7set/zUZI9OJdOJ3cwIxTbzXqL/UoaylZBuOU2LFRRG6hBAYek4rmrH0ff82mGSXn36QtanroHGOqFOT+4WgJIllQ=
X-Received: by 2002:a0d:c003:0:b0:501:abfc:b927 with SMTP id
 b3-20020a0dc003000000b00501abfcb927mr1426024ywd.129.1675532927563; Sat, 04
 Feb 2023 09:48:47 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 4 Feb 2023 18:48:36 +0100
Message-ID: <CANiq72k2gbip3nQTFAJkwU=MB3n+2SAB9n-DYRcuyD3jj2T_hA@mail.gmail.com>
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
