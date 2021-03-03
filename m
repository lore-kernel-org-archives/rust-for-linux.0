Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3223BC433DB
	for <rust-for-linux@archiver.kernel.org>; Thu,  4 Mar 2021 00:24:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0942D64EC0
	for <rust-for-linux@archiver.kernel.org>; Thu,  4 Mar 2021 00:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352793AbhCDAY0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:24:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241132AbhCCK1H (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 3 Mar 2021 05:27:07 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53834C06178A
        for <rust-for-linux@vger.kernel.org>; Wed,  3 Mar 2021 02:26:26 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id d9so23992735ybq.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Mar 2021 02:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=QYxl2f5I8U0HzF0YkvS76kzSSTOqbLhSH6Lau7H69Eo=;
        b=khiD8lUosrS/nIG10wqPNhlgFU173e/iR8XtuK8GAu8M2D3UafX5FKDJ4PucAXRf2n
         ppqWVwCggCMf1XTMwwERp0u+YoSXBM96uvuw1T8JFL7ySKwDpo1mTxyWFZ5OyurK0UB5
         EtL+/G8c+mT/6UAHr+ZWjWRHxlYU72/+W2akJPD0z1FLyLENKJPOZ44pGAjNuBAUzWyE
         cvDio9kZ9oV5Otgw/teqqYeYJI1QYUYZyGbpmXISRP1wx0p8Of0No4WHTVlZAuPxXYgQ
         +LjuE9mOuoNsJbNC7IFXP0uXCs3EaQUDjQjXk2gvRglpJDnmr+t/TbmUeXnhMVjCOQGh
         NdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=QYxl2f5I8U0HzF0YkvS76kzSSTOqbLhSH6Lau7H69Eo=;
        b=pbS7yZ5slov1vheYJChooo3Tpv1L5Hu5tdnPXQ6vIe4rLBVyf6krRi6qe2lpHa37Pd
         SaTRDguFxlZLAq0Qie/68T3MPQn0S1/80HarYaujVgqEXAsn2rB24+MBv6es0rIa3Uo+
         yyDjIgUpjetTQFa5hk9Wco5HZT+t/raNu2J8e/zz5zsj5oRCmg4czrTAnLZDGRACX8mP
         17e7RQXxMsbQPuM25Fjt/nSB4ekFSEXSKrDJM+3fVxsbTr8Gns6hsshevvzGxlZCqSiR
         c0+i9rcOcspCQVYcaZJ6uvjUB5YUJ8C+jC6gDgPz9JjHqjNfBSd32/GNgzTeQG9Zs6YB
         5lZw==
X-Gm-Message-State: AOAM530s6KiQZGiBfnyXjyuqYjxtgg694nO8VyLYRi/UKbzr5lneo8gc
        Rh4nLv8OZ+7ddM4lNGHF4xcGXAg050Xd6eelqWAncO5SSyU=
X-Google-Smtp-Source: ABdhPJxp3jB1MpR5LpUDBjsKLPHgWqKP2dbncQsXU8ySJoAJb0po4f+tlykEYDAIpiPTSoKQ5MVPsAkbk6Q3B19upRI=
X-Received: by 2002:a25:6e02:: with SMTP id j2mr36618071ybc.247.1614767185732;
 Wed, 03 Mar 2021 02:26:25 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 3 Mar 2021 11:26:15 +0100
Message-ID: <CANiq72njjy7sJ=_mgjKNzaHcwRgoWkQmgSN2Fq6gdCYoeD1WZg@mail.gmail.com>
Subject: [Rust for Linux] Poll for call
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

It has been about 2 months since the last call. We have a few bits to
discuss regarding upstreaming, so I think it is a good time to have
another informal call.

Like last time, you are welcome to join even if you have been busy
lately but still want to follow development. So don't worry about
getting up to speed -- I'll give a quick briefing if needed.

I propose next weekend Saturday 6th or Sunday 7th at 18:00 UTC like
last time (EU evening / US afternoon).

Please let me know which day you prefer, if any, and feel free to
Cc/invite whoever you want!

Cheers,
Miguel
