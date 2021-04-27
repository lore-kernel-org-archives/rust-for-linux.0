Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9C5C43460
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 00:02:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0B3F613A9
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 00:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234084AbhD0ACx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 20:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233919AbhD0ACx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 20:02:53 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87F5C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 17:02:09 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id u21-20020a0568301195b02902a2119f7613so6896874otq.10
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 17:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:subject:message-id:mime-version:content-disposition;
        bh=ZzpZBMRVuJ0yLDImeKgSHFXAwQtOONlAinSmpRP6daA=;
        b=u76LYUGKjGRJw+phisFmyqMJ1Aly/RsxvAwnJPwhPm+K6DozIzlJT6VY0RM/xZlfWy
         UBuBwijDfCmXFqi9wr8RkzTAxjsT/8jmM1y37SdS1Xkg4517vZsxRrs/qE53P16CI9/c
         XifDEe6VrZEevhSQFPnH/rbqQy5ze2L0CZCjES5YEiDsAPMGd2GRhjgupipWu3Ah/eWW
         W0oArQQsX9l6I1BkrqVKKGs2jkIT4N7tY4+2GjJGlA2SzwhCs+Tm5SOcD5kHdxSRWRlc
         wctbHpkaSMUn+drbl2y7obkRhmFplUwF2oqjrS1A3lcGZG7FpQzCULDy4eO6LA4EXUuZ
         oWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition;
        bh=ZzpZBMRVuJ0yLDImeKgSHFXAwQtOONlAinSmpRP6daA=;
        b=oLkZKF7jmlzFNrlx6SZUVQ2lW1lVyBAM09TQSuVgTRBNrXiF0mi4aLiNJMX4VdPCvn
         l6xPd7l3kG9YB+e8bSRqMnqTG3/fG71HwBWSTo5vnloIkR5wLwFhKCd8bsGEDGCDM693
         qz7k8fe7v5RXd3wdNbgcY2G4HwV9nQ6U97SAdskr8fp3vpCQH8j6B5ifY2AaXgDZY7dt
         +G+CKucCgwaZ/2VYf+T1t4mQNUAHwCDZFJfv/Zg8xM7GndjLIsP+pjo0g0hCKk+8w4ms
         pS/6NrTOdAcEEnt1e9zMov16e+DhnKellwIv4q1EZ+4T7QiizA+PQnV6e1SWj0pcI/Ts
         SmAw==
X-Gm-Message-State: AOAM533PnvHN9TiBvEVvlMMDXaxWgkpuSajBf9BwxQz0+kd8ZyhEPv/T
        VkByY1R+bMXuCFmnFp9Qv4PF8BXRfYo=
X-Google-Smtp-Source: ABdhPJweJ8TnDeOaX+50zHXAc76ASls6yHp/kOiDZd5kCcnzZnUAhCfkaC7YPWlY1KMTwVkGJP5RTw==
X-Received: by 2002:a05:6830:195:: with SMTP id q21mr6620688ota.64.1619481729017;
        Mon, 26 Apr 2021 17:02:09 -0700 (PDT)
Received: from localhost.localdomain ([2806:2f0:9001:d702:99f1:2846:f766:9c99])
        by smtp.gmail.com with ESMTPSA id y6sm3980068otk.42.2021.04.26.17.02.08
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 17:02:08 -0700 (PDT)
From:   Carlos <carloscarral13@gmail.com>
X-Google-Original-From: Carlos <carlos-II@localhost.localdomain>
Date:   Mon, 26 Apr 2021 19:02:07 -0500
To:     rust-for-linux@vger.kernel.org
Subject: Exposing semaphores
Message-ID: <YIdUf1C5VtWn/D2G@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello to all,

I recently began assessing what functionality from the kernel is missing
for implementing a basic scull driver.

Semaphores are the first missing primitive that caught my attention, and
being such an important part of the kernel itself, I will make exposing
this functionality my first priority instead.

It should be pretty straightforward, following the stablished convention of
leveraging the kernel API.

Any comments before I dig in?



