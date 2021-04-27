Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799A4C433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 11:00:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B6AD613C2
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 11:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235268AbhD0LBV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 07:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhD0LBU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 07:01:20 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51FBC061574
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 04:00:37 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id n84so4377475wma.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TeGrdzTwi36UaCFZFXYwnuCGuc4Rq8zO4ynxvSPjcXk=;
        b=kZ7b72bLLBzD9zJP9gM8KVWyqlE/IyUMxHVZMW4J67PTPePZ8yYoWvWcGodG0M590f
         Pj297VhIWnuLE6fYEdNx1htFa1fxY1pQgyZ9MOJQjfEpJ0U9fKaQ9Plm41BdHWExltyt
         aQyiBvuo+sTxpj05u1a89IRaYkvNY3P35K+AYp0HnEi1v8Q6ozxBsUmfp7RVFfD5oTQX
         VuSdfWP2RjVdL/mU7YN0BXrXcDXTMYGHil8wouz4me/UaCiSv7ExBu7AedfxUInTwLlc
         anQboWfbTqW+QfMTm44bYMhdt01YbQbA8UCYCm057UGFAj95O84Damwq/EIeubKID6iQ
         mWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TeGrdzTwi36UaCFZFXYwnuCGuc4Rq8zO4ynxvSPjcXk=;
        b=YweqsxpjLNtsugPdJSNL5j0v1q6g9zZKOMU5yLrGL/OqDhwKW9Hv7ll2/DbtXjFVGK
         t4wd0NH6HCSPkfhyTFRWjgXuWa9ZbDLJ/JqBlffISUDGIaqLo6JzRaSofWL2DKxGMRb2
         r4GettMdJiEl0j/dsB+5ZNbo83XhRtQ2cPGKghRuO3VDckOii+ml3osFPbkjx359F92F
         Znu7vt7allYiT7R8WiexZgSAAEw1xR0hq+KbNKg4M4QHzn2c1lq2HLKcwRmpwhXAsBt9
         ZIvKcY+ui5gjSJxN9iiKaUfpwZ0pAFqBGIIInu1Db6gRcOam1ebLuTaKGZIBKrQrAnBP
         rr+g==
X-Gm-Message-State: AOAM531Ku+YN/o6A2+hiNVr2OEvaS/DE5T+b9bfqIfc3t5iNgQZqr69/
        EbJ4DhxXlOzLtIHpjVAxiW3qjuOlTFd7meyX5b0=
X-Google-Smtp-Source: ABdhPJzC4M2aAWn6dEMCI4CsyzDJFyLt6UWKWe9ngWgCqH2WeBTChcQYRKzTCWCi/Gz4ZgrfToTWOKN0iBBmrOLFojI=
X-Received: by 2002:a7b:c003:: with SMTP id c3mr24199846wmb.59.1619521236335;
 Tue, 27 Apr 2021 04:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <YIdUf1C5VtWn/D2G@localhost.localdomain> <YIdXB88mPZ6alJix@google.com>
In-Reply-To: <YIdXB88mPZ6alJix@google.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Tue, 27 Apr 2021 07:00:25 -0400
Message-ID: <CAGngYiV+jXgyTN4mN1QsHqXiC1oLv_hEF3iT706JEKBJOcu-mg@mail.gmail.com>
Subject: Re: Exposing semaphores
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Carlos <carloscarral13@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 26, 2021 at 8:13 PM Wedson Almeida Filho
<wedsonaf@google.com> wrote:
>
> If the semaphores are used only for mutual exclusion, then you may want to just
> use a mutex or spinlock that are already there. But that's only if you're
> primarily interested in getting a rust scull to work first.

(My apologies for not reading Wedson's message before hitting Reply)
