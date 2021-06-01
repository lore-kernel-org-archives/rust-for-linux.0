Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C9AC47080
	for <rust-for-linux@archiver.kernel.org>; Tue,  1 Jun 2021 09:56:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DC82613AB
	for <rust-for-linux@archiver.kernel.org>; Tue,  1 Jun 2021 09:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbhFAJ6A (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 1 Jun 2021 05:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbhFAJ57 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 1 Jun 2021 05:57:59 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB7CC061574
        for <rust-for-linux@vger.kernel.org>; Tue,  1 Jun 2021 02:56:18 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id a7so6788713qvf.11
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Jun 2021 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=5/vWp7+DFe6vp1xcSHfZRv/Aftv9qjAM0ybUbItVSF0=;
        b=ajoRh+JBrhj6S+Kg1SaFWp0gDJjdp9GE3Rzo32LgGsGbURJL8fUPE833a/ezvgZp7d
         v49Zr3a0Y+UFDu3DMumSoQRVGQPbll7A9qiMWKSqh/t2+48ZW9iMifjuv+iaFUHeSAuM
         I+UFMBx99KDJYMtSd+wHcpeLwow80WpXFo0vLi2Ls+k7mGL3sK+4XN32V3Jw2Ym7xgrQ
         zRzU0LRak6ng+4ZVnmoY/IsPk6ZxxHOMXc/r/Yj3wm+HAgzecW5LMW+uWb8XCV6k6I2p
         S4i7ZmQuJrLLQUpCV85m0R75oUI/o8YJriCTBZI4j4WO6AePYOmHpqTXSwH13Ng5KkK6
         e2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=5/vWp7+DFe6vp1xcSHfZRv/Aftv9qjAM0ybUbItVSF0=;
        b=f+dxCgbR2RNO8j9r1aCNsMrv7htXgnHPIVWD+6mUgl5mG5OkWGDubnQxcBuzJZqDSa
         AqR3MpAlAkOCiQ96PrrBlrQ9Ye0BLyrGRe/OVPJydPpbUWTLFqRaeJGPvoDQPQXhuZnH
         Jqe9AcJ9MzQdfLzadnnU5MB0PWrXSWvTcNO2ckdTYJ6NxNRP6ZPqwSljtMkCRxbem9ht
         KxkRxcFBGisWW98xKiCaXSyWpWe+EvBSNJbR4OAZVOWrTHyIW/jKe543/cMwag4aoB9T
         DfsIfjhqeEd4gxZK4OThKasty90DS05SvFi8IA4SSmBum0PJ3L+dLkqUciZiMTdjavNs
         2UKQ==
X-Gm-Message-State: AOAM533NwNLqT/LcW69Jyzbj80gmWvoCDNh4xGWYEI7sKwBBP8CzftkH
        jr0/psoluEv0qv/hjjwPf6dsWr5SxrfvkIoSk04eakOdaPpqKQ==
X-Google-Smtp-Source: ABdhPJxKGqHnf4h+5QuCj7jfvsI4/VJbNJ1dZqF2oxKEVeaGHfUBWOKFCLrqbc8jBteFWqv+oNrDoC7btpUGsYk6i7o=
X-Received: by 2002:a05:6214:2125:: with SMTP id r5mr21774226qvc.28.1622541377471;
 Tue, 01 Jun 2021 02:56:17 -0700 (PDT)
MIME-Version: 1.0
From:   Douglas Su <d0u9.su@gmail.com>
Date:   Tue, 1 Jun 2021 17:56:06 +0800
Message-ID: <CABDqbH3s6Xr-5xhxAYyTt44w16A-Sq8sK7wgvxJuyDgg8+bWXg@mail.gmail.com>
Subject: Contribute documentation
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi, fellows. I am composing a series of documentation about Rust in
the Kernel. Currently, they are published in my github repo:
https://github.com/d0u9/Linux-Device-Driver-Rust/tree/master/Docs.

I wonder if this documentation is valuable and if so, how could I
contribute these to the Kernel's source?

Currently, these documentations are drafts that mean typos and grammar
errors (English is not my first language, sorry for that.) may exist.

Thanks
