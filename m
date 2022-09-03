Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFF4C54EE9
	for <rust-for-linux@archiver.kernel.org>; Sat,  3 Sep 2022 17:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbiICREE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 3 Sep 2022 13:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbiICRED (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 3 Sep 2022 13:04:03 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836904DF24
        for <rust-for-linux@vger.kernel.org>; Sat,  3 Sep 2022 10:04:02 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id s11so2734795ilt.7
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Sep 2022 10:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=bI+f/qcSx/24vYomVd2RfCE/QKUj81+eYZELleNF+1k=;
        b=FriWGdu/MOJ9shERwBfEdy//G4PK34DrOQWgBqCNqpbhsQm3f3tcJbb4V44yh/2LZw
         99S5nrLmmQ4vZtXxQvaF0lUrvgRp5cQpH53B41vueEZdHiIRvsiPsR5BMrX2vn5iCvkc
         c5kEEnAheCFeC7MngmfDFlzZFEPflrruuf9DZ3C64cM6fOGinTUC2nSFsSN+1aqZ09C6
         zCYBPXu7gJtizwZmsSBLPSBKFVSoJDmVUNDve3C+aN4GMDhUxSATaOyLS0W7UlhGLJHm
         Q3eyXFdk+aH/gpnpQJdPBsrEIwE4bVhZTRjmDB27tuVmovx3faC+DIhi8kHTJc3AojSo
         5Gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=bI+f/qcSx/24vYomVd2RfCE/QKUj81+eYZELleNF+1k=;
        b=joVmG0nrBpK4BHP69jM/YaVvTwP5E19QjYqpcvg6Yq9tWt+CRG1EbVNkn0ljFMCTEe
         ISqjQ/4Jv/h/o3tdMxHqJLJun91Uh05QWpskKkeEA7dCardh3SSpcoHZmjJbZ37cfuHX
         65iu+qi0zrqCvaDbtRuefKdMINho7oU89dQBptbdx/LuSxygWDKWGRtcOzfiMJT63ivX
         AuLhhqQOWk9X0c7ZQJw//MJO35mTVpn6mX2ubksH/1vbbEnhJppB33b9qzgPf+fz0MgS
         XrS6hrTSARMXxnmPpzMtnzWICDCT72jeIQdZmAd5FEyyRjAgZC/a+b/uIIvwj9s/E5PC
         W/pg==
X-Gm-Message-State: ACgBeo1t3pljiNKZGATMmEiIaCLLl36B/PFilgNr//ntbzxYUCbdHyk7
        s8/PIRtwTqU7aAekTyMHMBJyGjxB79rYOfTZ+EblDdup16w=
X-Google-Smtp-Source: AA6agR4WYccW2V0+KDe5C0j61YzlK7LqY0dFyzwD87B1wI4E/PLbN2/ZxfK/JFqW1rCkde6iRbYGDc7nKeUbwt+8ZDI=
X-Received: by 2002:a05:6e02:17c6:b0:2dd:d9dc:6387 with SMTP id
 z6-20020a056e0217c600b002ddd9dc6387mr21031610ilu.321.1662224641877; Sat, 03
 Sep 2022 10:04:01 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 3 Sep 2022 19:03:50 +0200
Message-ID: <CANiq72k_kDMb5vbg+=mrT+i0c69SESEH2=dNc+WCFvq7DDkwOQ@mail.gmail.com>
Subject: Reminder: informal call in 1 hour
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call in 1 hour from now (18:00 UTC first
Saturday of each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
