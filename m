Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E5DC433ED
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 22:54:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDD9161155
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 22:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234458AbhDZWzC (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 18:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbhDZWzB (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 18:55:01 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1597C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 15:54:17 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id s9so8625586ybe.5
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 15:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YrvYSuwSIlJDfoVMgM+sPc+6707x1HmC0XmG2eMz4N8=;
        b=A5Mqm8jt9lNhPm+7tyltzvUaZBtYj3zZjjE/ubC0uAgwFR8tcgPygdEoDjO9S7JTch
         3BOMQwUrkvw6DyXB9Tw4cZL9YWd6OydYJ43bT/Rj6icOcr44aaa8B9qWli9IGcTft8HA
         wCzFwDvVVNf9iRWShfw8X/ZaFMMhxeZ4l3bIciB1KARdsWtTSJJFzkdMP/2C411taoFZ
         ggihPPJD/k1pGgO9ch28hgbFuDwf8825/8eSwIkoCcYNigMgK1e9QtaNo0L0Hagq1URL
         3qjqdOPv9sThyFRE1Jqk3pkgt/f7zG+tTldLhYE9KxrpoTbTwA3KVu0YE8n6Qjv4/FKv
         twww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YrvYSuwSIlJDfoVMgM+sPc+6707x1HmC0XmG2eMz4N8=;
        b=omilz62pGDIdzZGU4TsS1lnNGJiEKwEX+FbrHpB5txbtDsHiRNSFStA454Vvnnu5G3
         h7ZsxpcTmtvudm4P0pCeaWbxVt23RaP9nQhdv32Snhw99lUkRillGnxBa7XD7G6OYerE
         7x1mXK/uv8pdGVtr6aUGxLC7+v/8w3H1t75dPpJnoSQzqioseHYu0P4kyNRLyxRVGcQQ
         a0rUk4c/a4Qp2WnuKStJk7CgLXnKsjMJrGxLwyZBR/iAFJ/SxlSbfHcyax2EsC83vzXk
         /evLl9TuNP0KXGER6RJYT7yPq1uXFElRRc0bGcfj06cTKxDFacsNS3B445r6T94vdWqe
         Q6eQ==
X-Gm-Message-State: AOAM533KnuezQYeVt0CZVf05yUe3jZYtQVPLtpD8AQn1KC70ZHoPI04u
        w81SYa2DWPMvNcqekLz4GYgIG6LEsSsAOgm3imU=
X-Google-Smtp-Source: ABdhPJyCjzkjdn+eDXEg3yuM5w2IVQ8xIvQ4Y5+6CBcVpTIs219KsisAg3VdjwTyfD3Nh5a7w3m3rVF0tUtvqK1QsNw=
X-Received: by 2002:a25:bfc9:: with SMTP id q9mr27006982ybm.33.1619477657176;
 Mon, 26 Apr 2021 15:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAMU0-c+QrurnfVZofHHtQFKPQ_QTpAeoB67LnXnuEBGjrPQByQ@mail.gmail.com>
In-Reply-To: <CAMU0-c+QrurnfVZofHHtQFKPQ_QTpAeoB67LnXnuEBGjrPQByQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 27 Apr 2021 00:54:06 +0200
Message-ID: <CANiq72k8SQhOJYJL52tEWysuq2SJag8tN_2R14PHKu_pcoq5xA@mail.gmail.com>
Subject: Re: Regarding SCULL driver
To:     Carlos Carral <carloscarral13@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Fabio Aiuto <fabioaiuto83@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Apr 25, 2021 at 5:48 PM Carlos Carral <carloscarral13@gmail.com> wrote:
>
> Hello, I've been silently  following the RFC and mailing list for a
> while now. I'm a newbie kernel hacker and as it happens, I recently
> read the Linux Device Drivers book so I have the scull knowledge very
> fresh on my mind. Could I try taking on this PR?

Of course! Scull has come up a few times as a possible example,
including in the last meeting three days ago. It would be nice to have
a Rust version of it! :)

Cheers,
Miguel
