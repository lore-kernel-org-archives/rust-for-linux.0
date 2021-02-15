Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CA3C433DB
	for <rust-for-linux@archiver.kernel.org>; Mon, 15 Feb 2021 05:36:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B38864DBA
	for <rust-for-linux@archiver.kernel.org>; Mon, 15 Feb 2021 05:36:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhBOFg3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 15 Feb 2021 00:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhBOFg2 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 15 Feb 2021 00:36:28 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09558C061574
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Feb 2021 21:35:48 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id p193so6045163yba.4
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Feb 2021 21:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=VY+QD6ELZZ0dxNWGpJaj3HRX3Gfp7U1dNbzZEOZyKMs=;
        b=kLZ+6Xz8hmljmAOhtur6BJUGhY7hozUUIuBwieyFkB/3r//hBjvSPQ5Q8w/PcmS0Yv
         fkbASAhJvAO3HRy97d6JO0an0cMJp0LqP1QHhmR8S/DiHpLNAQoU0A9ExucJyJMPZJB6
         Z7IJh+J6md8DKltgtX6edHWUxSbXTCHfeyB9++SdrBocBFxq6ewV0pd/fbVboxLOxszi
         lF4CBVNt008i3nfpJZ7GPe/ffA9wtZZgAvYebAewHRsUa0PwwqvGupfv0Ek9BbObI2M0
         CjrIzNHdgxKQu48xhlhhykmCfEU10EwyktqdlmsXkMplk1TYaBPI65V0Z8r1zofoRFtV
         G6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=VY+QD6ELZZ0dxNWGpJaj3HRX3Gfp7U1dNbzZEOZyKMs=;
        b=U8WwF9V7ONCLxBWdCQEPcBlXvIdB7JNthIczlu6X0U3zDuADz7TWekoZrqd8PQQos4
         R9uSJfwaQAEnjF/acPu/f98MSwbgQaVdQBLBvH2+Vlvw+8TDo7hVz2j2xlCPW+uhK8AS
         c0xLAnW6lNeDYE0qjwJJqvAxoBBxIdznW5cTNkTG83Rn05xBXez/6+t/h0Fzro0fpIWX
         1TyWnJWfjpOhSR4bGnVfhC//Bi7jOeIwD35niC78VISAiOCwqlfVk4dcwcILs1tNHNRT
         VRVSXNIhCsDen4fcZaWiaFe9ZrTBHwtuAHAPzpBKI6nIJbpT9qG0JEQUWYDnc6XInEE0
         dLRg==
X-Gm-Message-State: AOAM530EJ1re58+pqsW8nQuTddd8x42IoJMWoANLw/r50UFDf8+VXeq6
        rycJlf+tdc446c/QnRyWSiIeyYN1dZn+M6WYdY7BEJYb1urc/A==
X-Google-Smtp-Source: ABdhPJwcDm0fhjiPYNBs0EQaGQ5AmfZdOVUApwn/45s9+z9gBIjbFfwzOVJlDV3S4d0dVbxI6o0HcQ0CRH2QROlKI0Y=
X-Received: by 2002:a25:31c2:: with SMTP id x185mr19987301ybx.93.1613367347159;
 Sun, 14 Feb 2021 21:35:47 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 15 Feb 2021 06:35:36 +0100
Message-ID: <CANiq72knSgMU30A2ALaJGY5FWumPKU18ThvfjR1t14_77kYLrQ@mail.gmail.com>
Subject: Upstreaming plan
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

I think we are in a reasonable position to start thinking about
upstreaming. While things are still experimental and will be for a
while; and while there are many bits to be solved (e.g. an example
driver and everything it may entail), the setup is closer to how
things will look like, which means maintainers can start giving
feedback. Plus things look fairly usable for other developers too.

Today v5.11 was released, and this is the approximate kernel release schedule:

  2021-04-18 v5.12 released
  2021-05-02 v5.13 end of merge window
  2021-06-13 v5.13 released
  2021-06-27 v5.14 end of merge window

I propose we target v5.13's merge window for the upstreaming. If we
don't make it (likely), that is fine, we can use it as a test drive to
solve whatever is left and be ready for v5.14.

To that end, the plan can be:

  - Up to around 2021-03-28 (6 weeks): finish whatever features we may
want to have in the initial PR; including cleanups and any example
module/driver, etc.

  - 2021-03-29 - 2021-04-04 (1 week): Then I will rebase and draft a
series for upstreaming. Here it is where we should do a full review of
the entire diff, just in case something got messed up in the different
syncs, plus allows us to spot any final touches.

  - 2021-04-05 - 2021-04-18 (2 weeks): Send the series as an RFC 2
weeks or so before v5.13 merge window to the LKML. This way we get
some general feedback and discussion, plus Linus et. al. can be aware
we might send it. Depending how things go here, we can decide whether
to go for v5.13 merge window or delay to v5.14 (then the same plan
would apply, shifted by 2 months).

Thoughts welcome! -- Specially if you have something baking that may
need more time than those initial ~6 weeks (e.g. you are busy etc.).

Cheers,
Miguel
