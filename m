Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C0FC49EA3
	for <rust-for-linux@archiver.kernel.org>; Wed,  9 Jun 2021 09:43:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2164D61073
	for <rust-for-linux@archiver.kernel.org>; Wed,  9 Jun 2021 09:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238267AbhFIJpa (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 9 Jun 2021 05:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238259AbhFIJp2 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 9 Jun 2021 05:45:28 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECC1C061574
        for <rust-for-linux@vger.kernel.org>; Wed,  9 Jun 2021 02:43:34 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id n133so34623358ybf.6
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Jun 2021 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=7D3njIu2dMwFq1xpdiAWFI+IMskEahe34xRBFTf5jLE=;
        b=qQ+/8toi5lQTs7m8Zi6zgPfRhGmGoDhXcTT/dmum1hkYVTx6QUdm8fjkDbsGDmTBWd
         KvkgbPDyDVVgNWNeIR4sq68N0dEBuIOLqaVTRlHu8yvAMrYqAinJZbGdtSAqz52TkqFX
         bul5qvIkLp3wT22o7aAWXDeRQhNyGqXVftroKO7092izRK27oEBa3ScJFm2oipjW6GAS
         DAaUqw1o/zHDdxguet7SokYKtfseTRCLtEu7Yb2Dt5OcYRHuiNM5YE2HO8GzpwjDoU/f
         Mnj4PtMLTHOTr+WZS261JbdukSmxqcS11AFINYVrrtWwTZnJkFRf01YeoURw3Jbymprc
         1f5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=7D3njIu2dMwFq1xpdiAWFI+IMskEahe34xRBFTf5jLE=;
        b=fJmVNgDR2UfiWgtNTfevEoRAxyJDN8YQs4eW1iSg1M0qTWBcIMZThvKtW8Pk69pm3M
         UB1x7KFDdwXRqq77O9RbLqK6rVk8Wp/BnTVd/JvwB6EP13HcPXnpCeyvKZCE3ucGY6KO
         YCDgs8vahQwi2ndW22gQis50fD7jeRxXYjjkFBfFN8CC6zf0ks3IZ6YBfnB9YYVNsK72
         n4vYqxTeX6ss5pZM0uCqgtYkHS1GK5+uAo2W+I4DajRdwkWaANqdPc2NAGNDmDj0SBQL
         wXpdnWMGXgvKaqmlO2Nf9ZyFnr00ypbJSGqJVknnGSKO2JeKdDAvqVJsvxQL2+4UXUuV
         TTag==
X-Gm-Message-State: AOAM532rRvwI6vALh6R8Ce0rBoLLTlO1y3aEQxz2uumXW4fkcOUVM8GN
        4tJySryv0mqSTw0X73RedQvxJBLDWh0CaEf57xoRByuequgvig==
X-Google-Smtp-Source: ABdhPJzlpCdEg3gRvQfruLmjGbQwtDOZn23vTWglObVUcgS11JC7ojRBTyVY+zqY1Gs3S7EwVQSJzmUhZ9sqsExpNOI=
X-Received: by 2002:a25:cac6:: with SMTP id a189mr36400245ybg.33.1623231813581;
 Wed, 09 Jun 2021 02:43:33 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 9 Jun 2021 11:43:22 +0200
Message-ID: <CANiq72nkghBWopTK1CErYGcU3PriQGaGrXxMwgCc+MhvS+HfVw@mail.gmail.com>
Subject: Technical call on `alloc`
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have a technical call on `alloc` on Friday or Monday.

Please pick your best times:

    https://doodle.com/poll/8xv9ss85bfu7zh9d

Cheers,
Miguel
