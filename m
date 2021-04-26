Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52252C433B4
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 17:01:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F06961076
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 17:01:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234257AbhDZRB7 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 13:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234657AbhDZRB6 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 13:01:58 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA59C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 10:01:16 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id z5so3965196qts.3
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 10:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Pt7dnh63QHHoFFmb7OK6mjhhSZ/vQd7n1xkwgjL0ESc=;
        b=eq2fEcQIbBRWGI7scOlzsr38NyGFYyFZXIB62ur5mmW1S1Q9QEka1GxYMt/Q5/+ben
         /lZ6wrrT0GX4+zD8Yx3WR1agOzEFrGA6OwqM7Dp/tHfGZpte1+zJI44I139pkjlEajLP
         xv2jSqY6xizP1vXIEuv1IYnZdOwN0Ygm6xCPvhjE4QPuT7vAieXy6ojjtgZ7sNd9GpVC
         3PohW5AqvF+7gcsD/IepBJry/btPuNhSvd17g29pRbdiL0/5QI0eIijmSFCFN3PRtPPU
         0rR10OrrlHl+/qdBPwj8APR+ZKAGkC8S0H2M/dCMeSYzy0Gwe6HcFKZHHuPSrDwQXSxv
         lMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Pt7dnh63QHHoFFmb7OK6mjhhSZ/vQd7n1xkwgjL0ESc=;
        b=N3Uj9HlJz5FXPjcqPyX1LFo9Vf1KdRSE9f+/peEBomBDNg9Icq26vczTpxO+8h3Fu9
         gS8pw79M+1sJ10BL5UQGlZQ9MXu6MEZRaH1Iyq/juSHiZyiVN2C3rpbBVHIkCl9jv1P+
         kGjtQ0HuGADkj99nVqrd96afy+64/5FiVTt7lbRy9caRuQpLEYkGKEdCpxMD1MqMx31S
         1Zxa12Zj5HTt8DqUCtPELrrgA5oLMpA+egWFmTC5nmEQNZBcTm7pFpl78JVljna1Ta6/
         6GKlxkPwao9k9DyH32U/e31KIPPFx0XSwZ5MFL83GMbbMc36Dnf/RjxJY1FEG3Rx3vHZ
         HlVg==
X-Gm-Message-State: AOAM533NSRxxXzprO1t8trrjI6KeIhlj04C3RCT9Rar35Q5G/e6X4VHD
        WbmVFVE2HQILvWW1nfe837m+68p4RfsKsbeDvbIZUYsmHBkY1w==
X-Google-Smtp-Source: ABdhPJzMrU54crJ7LrbnR1y67UvEDYD9/7fsGQKLmFJeXaVtqTUdkeCLnt2tx8fBtsGm3886PQyJ5L3qCsIghQ0UwOI=
X-Received: by 2002:ac8:5bc4:: with SMTP id b4mr18135720qtb.322.1619456475596;
 Mon, 26 Apr 2021 10:01:15 -0700 (PDT)
MIME-Version: 1.0
From:   Hanqing Zhao <ouckarlzhao@gmail.com>
Date:   Mon, 26 Apr 2021 13:01:04 -0400
Message-ID: <CAKmvQ+U7LbwLRyY6FC70Y9-1Sdp8KdYRXryUvk9oTHvJSh29nQ@mail.gmail.com>
Subject: [Question] import third-party crates in kernel modules
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi, Rust-for-Linux community,

Is it possible to import third-party crates in the kernel modules?
(e.g., crates on crates.io)

Previously, in the linux-kernel-module-rust project,
we can add dependencies in the cargo.toml.
(https://github.com/fishinabarrel/linux-kernel-module-rust/blob/master/hello-world/Cargo.toml)

However, I noticed that all of the cargo's infrastructures have been
removed in the new rust-linux project.

Any suggestions to import crates while writing kernel modules?  TIA.

Best,
Hanqing Zhao
Georgia Tech
