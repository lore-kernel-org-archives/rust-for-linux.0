Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F36EC433ED
	for <rust-for-linux@archiver.kernel.org>; Tue,  4 May 2021 17:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15B39613D1
	for <rust-for-linux@archiver.kernel.org>; Tue,  4 May 2021 17:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhEDRfr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 4 May 2021 13:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbhEDRfp (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 4 May 2021 13:35:45 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC8B6C061574
        for <rust-for-linux@vger.kernel.org>; Tue,  4 May 2021 10:34:49 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t11so12969383lfl.11
        for <rust-for-linux@vger.kernel.org>; Tue, 04 May 2021 10:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=mx4C5PIJ9LCot1QAuUjobPG8jumBXrSTaYtJi4rsH8o=;
        b=qyNKCOtQfpd8iimZt5mNJ2//T/vQRp+aIvVjoVxZp4aB/P32s33KBwbHMNGiXrQEhy
         KcFnvG94p7hkEWVSjlaSfTZ/r+E1sYui0+jd4rjwXOJm8lpgsVsVqdmckm1EOif9Yrsc
         euz4zaFgBD/TUZViibmrltwHjIaMt0AxHTwNJDrxEIWPMN7YpTQi1SL+DJMHfKbAsPmv
         9Ry5A++U+4ifpJvijYuaBtlipkxqm+7LBN+k0HOmJACLGrkc07YUx4p2hGa3UQd+ycXC
         uD/7seuDKY9uIoKjvSeG2ztjaq+6F5P3FsqtXHIamCCPz2ZO8FpkiurbwfvjZzo93Amh
         F18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=mx4C5PIJ9LCot1QAuUjobPG8jumBXrSTaYtJi4rsH8o=;
        b=TXf8vVGfUiub2mTQC/CEsiQNqk+ZjPVXXJFd936cOtHZQioyc9GSisIrNn4JKa0dap
         d3UPXlZIjvqLAadbSD+3sKL6sZRaM2K7pOB/FRr8/8p0Vz8ebnAZ/MWfjONgSirma8R/
         CZ44EMn6sefbbJwbymnLqj6JaUNbYBSr8hyUhEtUzyZqY48rNa8EWLltw5fE36XrGwAR
         4au7dKRjGDMyNaCsE7P+VuFh0ZPNgcZ63Q9UmpHwyCANXv7chq7ILKsekCXGCAwSkKOM
         AUaY06C+/XtkyeAJ46Lnb/cPzSyypmzGljRByvQnvuWmYIYAytD1EGMmktjyC5XizSmc
         Ytag==
X-Gm-Message-State: AOAM5318+fBByMTsW0EP407jgg4qeKjfSED7xS/X0jBk0dUDkMvMsKLs
        dmT3gSWUzQJkQkSNXIQ3nOQBfxVWr/bi36+rWZ85Wv0GL6nD7Q==
X-Google-Smtp-Source: ABdhPJz8x7CFhxX8dXpxLdNnWRzQck1pqYKk7WlqLTp29qMaKhT6+BNh+mR9FhFvPKyeKciZTfsU1Av/5Oretf/Wm7c=
X-Received: by 2002:a05:6512:94d:: with SMTP id u13mr16662525lft.368.1620149687896;
 Tue, 04 May 2021 10:34:47 -0700 (PDT)
MIME-Version: 1.0
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 4 May 2021 10:34:36 -0700
Message-ID: <CAKwvOdkkXwRfqzBrrbgrgx0zTOWBaFz=tbPupOGkEFHw-4taqw@mail.gmail.com>
Subject: Linux Plumbers Conf 2021
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This year the Linux Plumbers Conference (https://linuxplumbersconf.org) will
be fully virtual, and will happen from September 20-24th 2021.

As part of the event, we are organizing a `Toolchains and Kernel
Micro-conference' devoted to discuss specific topics involving kernel and
toolchain.  It will cover both the GNU Toolchain and LLVM.

As in previous years, the emphasis will be in discussing specific topics that
require collaboration/interaction between the kernel and the toolchain chaps.
Examples of topics are wrapping of syscalls, specific features in the
compiler/linker/etc that are used by the kernel, desired optimizations,
features to alleviate security concerns on the kernel side, and the like.

In order to get the Micro-Conference accepted we need to provide a list of
both topics and prospective attendants, so that's why I am reaching out to you
asking for:

1) Topics your project may want to discuss with the kernel hackers, during the
   event.

2) Whether you are willing to contribute and/or participate in the
   micro-conference.

Please let me know @ ndesaulniers@google.com.

-- 
Thanks,
~Nick Desaulniers
