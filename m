Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9CFC433B4
	for <rust-for-linux@archiver.kernel.org>; Wed, 12 May 2021 21:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCF79610CA
	for <rust-for-linux@archiver.kernel.org>; Wed, 12 May 2021 21:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240056AbhELVN1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 12 May 2021 17:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378064AbhELTKO (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 12 May 2021 15:10:14 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AAC5C061574
        for <rust-for-linux@vger.kernel.org>; Wed, 12 May 2021 12:09:05 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id r8so32044016ybb.9
        for <rust-for-linux@vger.kernel.org>; Wed, 12 May 2021 12:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=DSsYcPmCgLMQc9bVMgUt2JDZbdvNeKKIaaQd/GmlrWY=;
        b=u2RPWzIkC/C+jnGZX/Sn5+k+V3issJfFQV/iTToD6mK69aDdsxkAJk2oOUBEuBQqML
         K5l8tVNNXVkY9Trjlrg/wBzUv2HLaBIZMjeFjmPLYXm9jy0PONa7MlM0gty00oKY53nH
         zCxLHzKLGdmfBkDnOfdS598plpyxisksQYOkC1e/Qk26t1OC8wyLhy8y/1hmflaFOGQR
         UHNsnT8KN9Lx7nPCaxaoXdyRAl/NHkjwz8144emm8nCBq/5DEnkZQKDm6jInqexhiYkp
         L8vipgzg5oon2hlQQoT8NDmkspd5YwhLeNm6VOWn4eqGnINFsC5d9/lTnGgsjO3nFNhx
         fuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=DSsYcPmCgLMQc9bVMgUt2JDZbdvNeKKIaaQd/GmlrWY=;
        b=OlE6zbg9EtO5ItyEZw4JE47Yek5Q7HBulk4x2xUIfhGv0/aIAzz/hvA69SoigdfXiq
         AC9sYZ2XlYO7TWYA/jISoJHZnHTTfF/kXPt0Mn/UYkAT/pOCDI21RajAlj+ziLgisQRe
         kD4AfLdeKyyykKsk1lIUlVT3K+27qpzaws2u2XrqyOhSXFszOiLkY0VeUNBLTTD4feUy
         wj/MahqEnuCPCHFbqLlAMw1nd9pTEmjZNNCK+DaLA6UeyyqUIR7QhwJaBks65V48Bq+Z
         cQqqCU2wdMC6bYTMcflHmaZH7SFKESIGGP0ebLi57v15HBUlBNDj53SDx2XATgbPEc4M
         l4mA==
X-Gm-Message-State: AOAM531KREWqAHHtdu9iSOoIYeIeSYb0Vee5aGBuTmn9HQ/Xj1Gfr9TV
        uxtKi+IQqC5JmFfRiXnKcBNWfmSGLg78QFAD5TYnv61FUMnSdg==
X-Google-Smtp-Source: ABdhPJykO4j+0tX9zGA8+eZa/wlB4Qx/xBYZsYnZLhBQrYq5IoTcBuALCYYaKylVBiCx4Rt6/5KatPV23tTpE8oF7hQ=
X-Received: by 2002:a25:2642:: with SMTP id m63mr13246111ybm.93.1620846544783;
 Wed, 12 May 2021 12:09:04 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 12 May 2021 21:08:54 +0200
Message-ID: <CANiq72=xVaMQkgCA9rspjV8bhWDGqAn4x78B0_4U1WBJYj1PiA@mail.gmail.com>
Subject: Zulip created
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

I have created the following Zulip as requested:

    https://rust-for-linux.zulipchat.com

Invitations will be approved manually.

Feel free to use it for chatting with others, but please note that the
mailing list is still the main communication channel and the only way
of reaching everyone.

Cheers,
Miguel
