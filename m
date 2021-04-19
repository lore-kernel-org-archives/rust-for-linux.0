Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D708DC433B4
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 16:15:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEB3261354
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 16:15:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233826AbhDSQPj (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Apr 2021 12:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232354AbhDSQPj (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Apr 2021 12:15:39 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20AFC061761
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 09:15:07 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id p3so18753114ybk.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 09:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=2+zAlxBcvaEEt86QNVsn37Kxc8/dzHz+pdnzm+bQ4GQ=;
        b=ukh8poYg3fPSc3ObKss6WOFJrGQuGxhvnXqnenlvzNlKhNCyBRG+WosltTESTVyN0q
         25aE63hoY6mTkeFltPXg6h4y6TDMOJisgBVpwoUiPJlZIQTesz3obI0wBaTpcJBYqMT5
         Bh8YIjRWv85KL0mmnaCs0CIQonjDoyTU3NIgDo2KXlh45e7Y88d+Yk355zto4E6qLPVd
         3Aaxg8RY/6103HIg3hkVXE5Z2GG6sU8JkFIVRvsrHgqGmR9QkepMoCVj2rDHg8HS/waw
         /cAuOWc23RC/6NM29G2we1uu1OfdsDCroAQ4I0A+kqkgA91QXhm9XgIztgiILBAexygq
         9SNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=2+zAlxBcvaEEt86QNVsn37Kxc8/dzHz+pdnzm+bQ4GQ=;
        b=R6JcP9jby6ucUZr2Q4xCG51VBCVrij4syVWvH+Ad4NNbq56FIaeApgNMzlf39ZXEo9
         TJ7XgFXueJ3IVggMQyzR6jEYvjElt3L0ZRBS+x3lEHF1KHDUHlaL3OlZFaHuqNTovj4O
         GCENzvk+hoRSuYaVclY7gbSbaXKeF0Or0htFomjSc1dCyIb4k+D2Mlbgm0gLesFkH0QF
         TZ/6vD+0rg9OlW6yYodRwONX0is7ZHgfD1V/rsHjP+/J56N8lebAJoA40bLFdvsk4l7B
         sW0wYxc4+bMylAiGY6dId7zxkc60FGWSkFJqrV2WOPkSbmo1OYKju63J8g3s9OxeMlC4
         RMgQ==
X-Gm-Message-State: AOAM533jtjWLL0+jF0ubrOePqV9C/mZoonnEoHWoXga9R2gOEhPVfYm3
        mNZxQT6OrHkoMw72zJ4paaBB2DDmRvxC9j0PFBpB2e3Nmqo=
X-Google-Smtp-Source: ABdhPJz1kFb9j8m/xPm3BX+kioLJ05UR3nio43BFvkwB8g4NcyZcmYnlDFJjJQZI4fPWmwKh1XEPpHXd+SkSX5KwVCc=
X-Received: by 2002:a25:818f:: with SMTP id p15mr16326492ybk.135.1618848907230;
 Mon, 19 Apr 2021 09:15:07 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 19 Apr 2021 18:14:56 +0200
Message-ID: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
Subject: Poll for call
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

Now that some days have passed since the RFC, let's have one of our calls.

I propose next weekend Saturday 24th or Sunday 25th at 18:00 UTC like
as usual (EU evening / US afternoon). Please let me know which day you
prefer, if any.

As usual, anybody is welcome to join. The meetings take place on
Google Meet. The invitation link will be sent later on to those
interested.

Cheers,
Miguel
