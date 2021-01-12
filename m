Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C6BC4361B
	for <rust-for-linux@archiver.kernel.org>; Tue, 12 Jan 2021 21:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22D3A23122
	for <rust-for-linux@archiver.kernel.org>; Tue, 12 Jan 2021 21:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437084AbhALVh1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 12 Jan 2021 16:37:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437123AbhALVNd (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 12 Jan 2021 16:13:33 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047D3C061575
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Jan 2021 13:12:52 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id m6so2176539pfk.1
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Jan 2021 13:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=5zVAwgESgjr5+7ACeB/eGdK1IOw26xofAvhOgfC3Xh8=;
        b=u6IjFx0Mox3M4+wXlTYeMPGxEL04qq/62IbmSZ9bXv+L3iEQwfXtX1QoJVT0WXJ/Qq
         1Pxb1Gf6HiJUA0TEGlnNoYzcZ9gSLkEzhwXwxrP61q+5XAvVAelHWCIf/3tx3qW5t1Pj
         jGGuLL5jMsX/Cs/P6ecslQwZ/nEpG1E9KMunn1eQeBf5+OYkGVUD2WGn2OuUO2cwYtFN
         YW84CaCrp7OluRp5uHmgki0lnhpS0avmY0qWoILRh5y5sgIEe4WtZv6BTqbIPBGCJ/L4
         AFGSRN0VZ2GOXHfBSKmw0llvgvlcZOAv/hsgTgRvm9XW8Tw6fRbvEq/jlIwxutPrMvto
         zM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=5zVAwgESgjr5+7ACeB/eGdK1IOw26xofAvhOgfC3Xh8=;
        b=HEUJaUWk1YmCrrDOpao9e+kLtUiK/VZnftKgj8du9ck4wznwqYPsIOMkXX4ttmXFpr
         bYQ8AwL1iCnstF+eqL2qJR1mz1DjwEtGkaIm6DP2FufPqVapx8fN71lMNCQhbQDPsrh6
         bpKj5QTzYYrx2vuZvk3/qhKlsEMqOCxWBE2bNdtknrto8xiztn5I4qZbg8JLGjVkq1uQ
         W7hZHzSHjrFrCbn6D4jCKZWpaG1efN8Qpff1IoN5uGhpBOXROViRqP9VDAMp1/diDZsa
         /XjAe090b0Im+5fModgebgFBC2aR7+5gqdnAcsflK8l+qEY0FzG/PU77aBKvudfOCPDT
         q6kA==
X-Gm-Message-State: AOAM5338XzlSz1e7aKMhZfFpRyaimZKq+Tr28EwCMj4/m7Rosm3EWJAR
        xJeEKlDBRj+M0LYktETnygq6JTtnUHoVhvHuQ+F77QfIEADXpQ==
X-Google-Smtp-Source: ABdhPJzkgCn7Fcyw3ZuG6LJ7ys1vorojHgHthT/G7tYw068tgYtdbMGXOmsJXSYcCDLrasAIKn0GiSsO4YCPTPsPpEI=
X-Received: by 2002:a62:78ca:0:b029:19d:ce86:fc22 with SMTP id
 t193-20020a6278ca0000b029019dce86fc22mr1113407pfc.39.1610485972307; Tue, 12
 Jan 2021 13:12:52 -0800 (PST)
MIME-Version: 1.0
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Tue, 12 Jan 2021 16:12:40 -0500
Message-ID: <CAFRnB2U0gpaoGxTM132bRKCTHyxCZz4fLqBZtsfmRq+6Nj28=Q@mail.gmail.com>
Subject: Upstream Milestone
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hey all,

I wanted to flag for folks that I've created a milestone for us to
track things issues and PRs that we think "absolutely must be
completed before this can be submitted to upstream":
https://github.com/Rust-for-Linux/linux/milestones?with_issues=no

Feel free to either add things to the milestone yourself, or leave a
comment suggesting they be added.

Cheers,
Alex

-- 
All that is necessary for evil to succeed is for good people to do nothing.
