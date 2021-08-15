Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B92C4338F
	for <rust-for-linux@archiver.kernel.org>; Sun, 15 Aug 2021 09:01:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C17961042
	for <rust-for-linux@archiver.kernel.org>; Sun, 15 Aug 2021 09:01:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbhHOJCU (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 15 Aug 2021 05:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbhHOJCT (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 15 Aug 2021 05:02:19 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535E1C061764
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Aug 2021 02:01:50 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id q16so16739196ioj.0
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Aug 2021 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=FT8EzlqZdh0OHn2cGHwRgm1HuwQ6ZRg977zADVp2IXo=;
        b=G+3wwjFHkiZ4L2JHNqGg9bBoa3QYAIGEMPHNYK0LizWSyHZsIoiqBWRZYbu9CR4bse
         P9bqsBA/jNmQybJOhb1TCMUUhYQPFzc1GctdYSE1PHB0egZ1E2206D+L3GDkq+BujrQ1
         guNE1ZnA/AePthAGQlz07Hw7ck4OFoDujbRlLWHcQE66thDr4nRFjTmfb12+Rz1vpakU
         n3vy5S3MASzx33gAiJpp1TF2sszg72FGVHWUQM830ymknhzfJtTMVFLbKP7L0h7TINYd
         4t95xk1dfvdpJ218cImz6sy8mEZdQco6moFkWhQOaGIXcGiy8Ldo8yyjEjByjqskDeir
         dqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=FT8EzlqZdh0OHn2cGHwRgm1HuwQ6ZRg977zADVp2IXo=;
        b=KaMcCYxPnu0mui/xHnpFArJOwtp6FqCEH/Lv53vz9mRoQdjvrcdYvQEPipThTxC3xV
         IGoZ44XFwOGH7B/CDmdWkOu6keFwaHTyp+E32bDJkMkjbQ5Zjfedn0M0nRkH3vnXoZk7
         6ogLr2XIYvfRYLwS4oJDCxAugGwQGNJW8fbz9UBtBliH9lThOjRCCs30ZEb6xNdA00FC
         RAcbMYG2Zi5gf8IjFNUOitfrxat7FDXNiapqFJnViQchkFUSC2OIOs85jb35psL6h9YD
         f2y+i/SM5ja7orGrwTUWcu0ef+w5HQ/yj3G3zGLcRJB56xhp1pHgJtOV3BJ3u/gxUw+v
         2wig==
X-Gm-Message-State: AOAM531rq7F1E4+/WOK+K6OnTNvGxAaATGmldagnne2CZeHQ3GOEPqwu
        guBSBy9RuT8j0DdRkSFFDLdH8NWpNDh59gPuPvw0eoT7Qco=
X-Google-Smtp-Source: ABdhPJww/mqYlaGsWn2ygzTG7S+uNW5iVjaVsVvGeRVpjx19BafGddAHRHINiUsKs7oWKyqjEwae6/jvVCEGKi4Z9H8=
X-Received: by 2002:a05:6638:3804:: with SMTP id i4mr10110941jav.82.1629018109721;
 Sun, 15 Aug 2021 02:01:49 -0700 (PDT)
MIME-Version: 1.0
From:   Gioh Kim <gurugio@gmail.com>
Date:   Sun, 15 Aug 2021 11:01:39 +0200
Message-ID: <CANc8B5N6gYW3+zdG2qo9+ma4s5=xTxUVRk8s=A7-17KhnY+hzw@mail.gmail.com>
Subject: How to setup Rust code tagging in Linux kernel
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

I've just built and booted the kernel of the Github "Rust for Linux" project.
I've used emacs and gtags or Visual Studio Code to read kernel code.
But they didn't work to read the Rust code in the kernel.
I failed to find the solution with google and git log rust/.

Is there anything to make tagging for rust code in the kernel?
Maybe it would be better to make tagging for both C and Rust code.

-- 

Best regards,
Gioh Kim
