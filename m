Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37263C433DB
	for <rust-for-linux@archiver.kernel.org>; Mon, 15 Mar 2021 06:31:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED38F64E38
	for <rust-for-linux@archiver.kernel.org>; Mon, 15 Mar 2021 06:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhCOGat (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 15 Mar 2021 02:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbhCOGat (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 15 Mar 2021 02:30:49 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279E5C061574
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Mar 2021 23:30:49 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so13787819pjh.1
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Mar 2021 23:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Y0kVoXA+7NNB3lsCJWR/BOHfSpFpxfIk4pplqMhzOkg=;
        b=ggwauP47IV4QWzBVeCdxkuwfhni7mg9/AzN8/AxTiAGG+sURbIFbTui4LdPGDV0R5A
         4LBkfZ3btXGoWSAUYM7Ep35Em7BlviTA8ACbY68lpptm3u++bAwPlnaN17NfxQPs9IMs
         VwXMuW5G/Gx6bfwn1Rv498vDtu5AnyTM/vk/x3q/E/NBfs65xT+tpLmjX/qC7wToctvF
         rOya/uSzFxhiT/1Ft3B5BjhILIxEZNPBzAi52566adoFc7RTcThHfIV8uhCBWC/9LDCF
         5kynvsm1T+l2hsAZ6Ss1tsKwLLRRmt4mi5F5J0g/OkdJz7znMuS9ISy444B9QhE7jwNf
         /DXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Y0kVoXA+7NNB3lsCJWR/BOHfSpFpxfIk4pplqMhzOkg=;
        b=AxZG5pg6nIG6L6Do4ck+dNDrs2ZQ3zi+1VcnHrRWXErLl4O+XOMg23NJR3hFWbR9YJ
         /Arw6HixLalyOZRXYQgTleSfD6n1ke9yKSaB3Drd7lvXmW+izHZTlZj+SylxSFgxPuVP
         Ddkv+TNN1SqdalDmwp5zaaJlEXPCYuEQ72BqiVpHX8gh6emLeZOZUndXlPdDDEzALXyR
         emuz4PY5wJqHjMmboppoNZi+VDIOFeGcntvuWCGbHOS9qxPgoDx471Kqgv/toJrQEoMS
         Nl+g6nFvM/ih5aO5v2dU/f2Ahp9Pyl5aup/49WTPiJTys8M0vIADFqtoZowc90XZvnTt
         DLFQ==
X-Gm-Message-State: AOAM530kyBGL3XZwJkjj5OHVXYD1kxwUR8ieQP7GyUdymGY9GdRKRuCh
        qTGqHR9/UippDk5yNmhGJIZnvt+RJtlPjQ==
X-Google-Smtp-Source: ABdhPJwadnJHzEY916BIQbCb/6uZ4RDNFzRJTgrbChOh64+OMXedG6uTRGoQwiZ2+P8tyhqNZCDuMw==
X-Received: by 2002:a17:90a:c981:: with SMTP id w1mr11491855pjt.176.1615789848330;
        Sun, 14 Mar 2021 23:30:48 -0700 (PDT)
Received: from adolin ([49.207.199.89])
        by smtp.gmail.com with ESMTPSA id p11sm8569600pjo.48.2021.03.14.23.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 23:30:48 -0700 (PDT)
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
X-Google-Original-From: Sumera Priyadarsini <sumera@adolin>
Date:   Mon, 15 Mar 2021 12:00:44 +0530
To:     rust-for-linux@vger.kernel.org
Cc:     miguel.ojeda.sandonis@gmail.com
Subject: Build system can't detect rustc
Message-ID: <20210315063044.ur3lvxv7emo2egu4@adolin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

I was trying to build the rust-for-linux as per the instructions here
(https://github.com/Rust-for-Linux/linux/blob/rust/Documentation/rust/quick-start.rst)
but CONFIG_RUST doesn't show up in General setup menu when I try to 
setup the config file with `make nconfig`. Since it says the build
system is supposed to be able to locate rustc, I am guessing make is
unable to find rustc. 

Could you point me to where make is trying to find rust or how I can try
fixing this? Is there anything else I might have missed out on?
I have the latest rust nightly installed.

Cheers,
Sumera

