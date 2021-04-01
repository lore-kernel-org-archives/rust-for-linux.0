Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6846BC433ED
	for <rust-for-linux@archiver.kernel.org>; Thu,  1 Apr 2021 06:19:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2627D61057
	for <rust-for-linux@archiver.kernel.org>; Thu,  1 Apr 2021 06:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbhDAGTM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 1 Apr 2021 02:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233149AbhDAGSq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 1 Apr 2021 02:18:46 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F208FC0613E6
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Mar 2021 23:18:45 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id x126so659782pfc.13
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Mar 2021 23:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=+NywTbvO6+S9O/caE9z+sCIDOmtKFhXmo1SEce92wz8=;
        b=WgupzHUli5KXLNMLCBBsBcgmuylh8kJoRtOYlz1oWy6tQ/hkWEn3Mw31NgZ2GhR3e9
         Qhlyjc6GIZpCXEVhpd4oyBEVO7qgY7l26lM0l3QxRwX2SUXO9S2fOgDOt1K1DrHtqXTZ
         cE8G67UY7vMf3kvdcy5ZA1Qtad4hGOuaAdWIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=+NywTbvO6+S9O/caE9z+sCIDOmtKFhXmo1SEce92wz8=;
        b=cdCp1G2TacXwPJeDkBQoLzsdOtGYEyfy0zPctPOnDLXAoC3RT9rMZaJXtULJ776FRG
         Eg/XBTnxz2aGQu1DUaY28Ndk+H11HAwoWrcxz5YwfD3fg2P1y2oKvpsj4PBq6DaYZftr
         EDTNEO81Rw5zAH6xK1Vx5QKxxvAnjOp/iNv6jE7QODsX8mUhYwGH+kduYgPW1K/7DrUp
         +nvfYAJMpS9vc1wHt3BsIDIR2NUF6bEJPRYW50ZOmAQK0qeCgZJc+6IXvnQpTiEjaSpO
         6wWeZGPRBecWPqsDTICO8ATX0xuAUHHNrb5j5ynW1aQwpxzMwCp9Zuc5Ze5S5uzYwHpR
         Vy8g==
X-Gm-Message-State: AOAM532uYMY4kOFERvSrz/77eoZyb8wcBai/trlQOm1Rr/hCaimqU7K6
        WmnyN2huvDDLTg9hnSEeUVOPfKTampirDA==
X-Google-Smtp-Source: ABdhPJxYiYe/LkRxZgWveRtOCMJNuEjycIkCT2JETPeyljP/h3ttKELn5ckyDx/qN7+p6eQ9xXcOhQ==
X-Received: by 2002:a65:6648:: with SMTP id z8mr6301062pgv.268.1617257925262;
        Wed, 31 Mar 2021 23:18:45 -0700 (PDT)
Received: from nitro-5 ([103.44.55.83])
        by smtp.gmail.com with ESMTPSA id w84sm4213683pfc.142.2021.03.31.23.18.44
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 23:18:44 -0700 (PDT)
Date:   Thu, 1 Apr 2021 11:48:40 +0530
From:   Manas <manas18244@iiitd.ac.in>
To:     rust-for-linux@vger.kernel.org
Subject: Re: Missing RUST_EXAMPLE option in linux-next-20210331
Message-ID: <20210401061840.g2zzox7xy5qol7kq@nitro-5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I am working on a device driver in rust in linux-next as an academic
project. I used the following command to create .config:

$ make LLVM=1 menuconfig

But, sometimes the RUST_EXAMPLE option is not visible in menuconfig
(under /Device Drivers/Character devices/). It seemingly happens at
random that this option disappears, despite having a working rust 
nightly environment (and other dependencies).

My rust nightly version is 2021-02-20-x86_64-unknown-linux-gnu, with 
rustc 1.52.0-nightly.

Can someone point me to why is this happening?

Thank you
-- 
Manas
CSAM Undergraduate | 2022
IIIT-Delhi, India
