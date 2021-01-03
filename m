Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02945C433E0
	for <rust-for-linux@archiver.kernel.org>; Sun,  3 Jan 2021 08:19:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEDF52080D
	for <rust-for-linux@archiver.kernel.org>; Sun,  3 Jan 2021 08:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbhACIT0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 3 Jan 2021 03:19:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbhACITY (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 3 Jan 2021 03:19:24 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580D0C0613C1
        for <rust-for-linux@vger.kernel.org>; Sun,  3 Jan 2021 00:18:44 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id y4so23157937ybn.3
        for <rust-for-linux@vger.kernel.org>; Sun, 03 Jan 2021 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=uSIRicuuW0fb/+WwML4h0C+tBjBFOlIdnwhghTvfhnw=;
        b=Po4ANK4zFPb2Gt20UZzL4hlXSUhr9fsEDMK5inyeY3aWsSrnejvBR9MQzuXH0h2cHo
         Z2Hk5k4Z/wpECAkJ6qg3TliN7dIppdqRINcbMni2DJ+lrHE7dzZg3xiRDNThlVP4/cqd
         x+F57MQcifRpEIl4vQG6B9CObsh3bInHA58Nref6pCAdPZceZvS8tBVUYhcHyk41beB5
         kAmT2xBJILYMCKjYgBTXorgoysVddCF4PVwKzCcCZTQ6hKRDo+ChdvwBbhSjbXyYtHM2
         +fcmuY79TaFYhId9BGgPPAhD/lNYipl+htXSF9qerqCi9c33jjsxns6ucuIXbgAc0dbt
         idOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=uSIRicuuW0fb/+WwML4h0C+tBjBFOlIdnwhghTvfhnw=;
        b=uB1GgHIc0fXHf6k/WC+zWT29GZ3r+Rjhaa6jX/50L0VNo2RyKlZa05f5m4xj2B0Apk
         zXsavxqycwiBJ8HbPc4jhn7wkuD0kY+M4CdnJXUMJmD9/QEZhcWdY5WI4YNk7/+MhpHW
         KVTC+yEQoFy4mgoMejXVWcIpXsfPsoLtQ8C8bApA/ht2VtZbr6tAPw2Lf9S7SbatQUmk
         7Plae6XMwXrNJpG1x9EnawsK1AUVkpW+gL6C92XXkWY9ai2HkohqZtfJoKeUlPCy/0Ny
         dhgsp3Q6boI5QZ+kd94VwLSodFlUUAwD7FfgAfYPy6P/SCOtVhruKZxn96YJ7vicoO39
         adIQ==
X-Gm-Message-State: AOAM532PXq1F9oT1cI7C9RY8ZfBYlgcgwBnAI7DbW+xXGPkQycqurLnR
        VFnYxDg1Mmt5KRiMva9P1b/QMubGK0urwOH6kZpt7OmyIl0=
X-Google-Smtp-Source: ABdhPJxydWLdpJ19MBpOf13HPG+FQCliPLu5oXu14drgVZaE65zSI8gak09oWPgg4YzVvwUmGZtOcZDc42HrePnlHI8=
X-Received: by 2002:a25:538a:: with SMTP id h132mr92105675ybb.247.1609661923643;
 Sun, 03 Jan 2021 00:18:43 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 3 Jan 2021 09:18:33 +0100
Message-ID: <CANiq72=-He3iQRpKrCwApPUCjbF+zAiM95mR5JJ0tvs1hA0fnQ@mail.gmail.com>
Subject: [Rust for Linux] Happy new year & Poll for call
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

Happy new year! It has been about 3 months since the last call. We
have got a new contributor and we have advanced a few things once
again, so I think it is a good time to have another informal call to
meet Wedson and discuss a few things that have come up.

Like last time, you are welcome to join even if you have been busy
lately but still want to follow development. So don't worry about
getting up to speed -- I'll give a quick briefing if needed.

I propose next weekend Saturday 9th or Sunday 10th, at some point
between 16:00-21:00 UTC (EU evening / US afternoon).

Please let me know what times may work for you, if any, and feel free
to Cc/invite whoever you want!

Cheers,
Miguel

PS: I am sending this one first to the ML to see who hasn't subscribed yet ;-)
