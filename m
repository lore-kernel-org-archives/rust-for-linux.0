Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0D7C433DB
	for <rust-for-linux@archiver.kernel.org>; Thu, 18 Mar 2021 11:01:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99B9B64F2A
	for <rust-for-linux@archiver.kernel.org>; Thu, 18 Mar 2021 11:01:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbhCRLA5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 18 Mar 2021 07:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbhCRLAo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 18 Mar 2021 07:00:44 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480FDC06174A
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Mar 2021 04:00:44 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id y133so2064871ybe.12
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Mar 2021 04:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=cKVfmw5FAlnMmmxbPGdTRjWc2igi3gL84HVCqSC3k6M=;
        b=UI5eleaV7alIg+Uy1sthOjyQAqjf1DzPY5M0th5DlcnAaiJcbybRZBjmr02CDU+zmB
         Gd4Kh0HK2EYFY1p6uzbprALdJUxmOWWpjTSIbigRl3BWLeko2lWVBdo4B2PFpEUI4BuA
         ytLyYNchXEvFEDq+Gao5008yVCeNdvlBWomqTSTBnZDx7ROnWVtd6CJOhUCLizL9f80j
         t+xR1WWSIXRwK3b/63d0xD3AT+I2dHVHVi0AAKo8+4Y1PZHWEbxaDTVHPUfNW20xuJyc
         oV/0JR+fQFt9L8hbvV+Fr1XnWmncV1So1b2ifzqcp92J0gewFU8iOb+ocl8ENF3OwQN9
         56sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=cKVfmw5FAlnMmmxbPGdTRjWc2igi3gL84HVCqSC3k6M=;
        b=dC4vSFsOi1HKJ9OjwnHsMUXOjMMWkZo9lwWgRu+zBUOjF8FBKnDRjjIOQuySV6RVmp
         baMKF455WXpnuAplmBQm3SHvyyvDna4d+BXc1af6smvXthTj1saKYPgklBRpIPmPMrMG
         4vTKp6BsU2TPQWG89s5igwGiJTOL3CaUFDmG4q9Vyc50jF8L55+XUmsFks4VNhSifyiX
         yAhc9NGIo5v5UL3buGd26eylajnfqcQAlO51ZH9ldQXSLdz0gjzfsTOlVU/UYqkg6xqh
         34oUlUhEM1q+xDq/zlYxy/Q3vjKffFBeWz5lj1DyX/LEBRq5/OJLFlk32niZuGGquHKA
         xCzg==
X-Gm-Message-State: AOAM5324qYtkYkEcOA87n5JAY255hdJ78ZzIYqs1pv3PDOUQdghcZW3o
        1M6Qz2h30aGqGBo/4R13GT5m1sbDK92e4L5LhfD1kwz8Cyk=
X-Google-Smtp-Source: ABdhPJxdpLMisnTQRNWF6vtYtd0r8ZXxJJvA0hzyd/COgZpkQ424CoRR2ep8lCp9iSEen/pyd9QkhnM36Ybj4YSFo3U=
X-Received: by 2002:a25:d6d5:: with SMTP id n204mr10956744ybg.22.1616065243661;
 Thu, 18 Mar 2021 04:00:43 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 18 Mar 2021 12:00:33 +0100
Message-ID: <CANiq72kaiyZjhQiH=b8O3d+SzjB6AE0zEpR4WS1_iFCFyjqT4Q@mail.gmail.com>
Subject: GitHub permissions
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

Since we are now in linux-next, I will be tightening the permissions
in GitHub to prevent mistakes as we discussed in the last meeting; so
I will convert everyone to a "Member" except Alex and myself. But
please feel free to ask if you need anything to be done if GitHub does
not allow you to.

Cheers,
Miguel
