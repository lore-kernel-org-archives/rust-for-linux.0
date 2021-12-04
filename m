Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1488EC433EF
	for <rust-for-linux@archiver.kernel.org>; Sat,  4 Dec 2021 16:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355170AbhLDQP6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 4 Dec 2021 11:15:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355163AbhLDQP4 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 4 Dec 2021 11:15:56 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C654C061751
        for <rust-for-linux@vger.kernel.org>; Sat,  4 Dec 2021 08:12:31 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id x10so7679050ioj.9
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Dec 2021 08:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=9WwXnUpA9rc0rRncRr387FW7kpI5/0/VVUURmT3Icmo=;
        b=AOwsDxfbO2KynSTc+tNrMW4y3mA9J8SP0TKR8KuAE7LhvCTz8hR/nYHA9/7WpPcxX7
         Mt20xCTS3arRCHMddqvznciaM7qH+hQSZND5h0i251bseRI++jW3H4XOq/NRg4e2TaEP
         al68TBGGjvo7llJqCIOJEEX1vdLPY6uN/RyoQJ0uGczm1z0cxKHbutQif835ynj/yLWW
         1pTKe5wd5VzyXFIoPPlPKDUvQYplxW+0t5oFBYR3cU8YFKZ/Lth0pPCs01VVLD7+9yEs
         IkXXjNJCVc2FaX4dixZuIII1E9RV6eenfxTgYD4eFSkBNMKzqsSlfNPcz+o123Z4pXHW
         3i8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=9WwXnUpA9rc0rRncRr387FW7kpI5/0/VVUURmT3Icmo=;
        b=rvRUXJY88tD4HIUR7XP0Q34SVa2jr4uckAncVC3O1dTrtFTrUJ4pVPNAbB9m2ocgNr
         o8e4y6OpUoVWx0BQbhDVvWk87YnOAyMbfJ12jMNXYGImAkTXzM4iwtUsFGfnwVcIBX9C
         FkMynbth+5mW/eWtEFSwlz9mCCmVZAZBw4W3T49Gx5/M/axE2Kr2XCUh9uAu9ST0LSc9
         w/Ja0bF+MidNZnKGrp4oGFnaKwW/PD/U4wukNmP9zslnDoW7IrFGbmNev7Qx7GF3O9Nz
         J/E+bpinYRrHoB2G7PStzaOcdVbP7NsLddbeR58JX7blj5foJ9A+gjn0aZMkIuLqWyo7
         PjaA==
X-Gm-Message-State: AOAM530ERBLTd5HZPpQFhoo2UBsMIjcni0xv44NlT4cwtrkT6v/BEEaX
        rjQSrykoiuP3j6aDAxh+Sh+kkvrx+zZhlugiMD/acv0VtAhx0A==
X-Google-Smtp-Source: ABdhPJyAUG4NkraneBO1hYF17jWUlYWANYM+lzarhtGx4Y1nXm7PGw1qbjsGsulpGvH0fh5qFPXHjpViWMnrT/jbR48=
X-Received: by 2002:a02:cb8f:: with SMTP id u15mr33278050jap.131.1638634350695;
 Sat, 04 Dec 2021 08:12:30 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 4 Dec 2021 17:12:19 +0100
Message-ID: <CANiq72krfhQ5BC-qxRRht6v7SsaFXjg4ofQhZwQUnt+XOSA+FQ@mail.gmail.com>
Subject: Reminder: informal call in 2 hours
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call in 2 hours (18:00 UTC first Saturday of
each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
