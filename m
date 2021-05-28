Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65D1C47087
	for <rust-for-linux@archiver.kernel.org>; Fri, 28 May 2021 05:48:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5DF56113E
	for <rust-for-linux@archiver.kernel.org>; Fri, 28 May 2021 05:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234265AbhE1Fts (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 28 May 2021 01:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234038AbhE1Ftr (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 28 May 2021 01:49:47 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2810DC061574
        for <rust-for-linux@vger.kernel.org>; Thu, 27 May 2021 22:48:12 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id v8so3097841qkv.1
        for <rust-for-linux@vger.kernel.org>; Thu, 27 May 2021 22:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=/hJGXpDm0n9mnn5VnGXz5MvOjhc/+oki+WtRAu5s8ng=;
        b=kLXz2gPLMqI+CXXfeoMCPI+SO2Bk3SR3UFmR7mmQjuRIgKJ1U78uL3AL9A65YhRGN/
         TY4p/8PTNCEaCYm1m5uLBCRbnwSYAv3x2jYG/TEAIUmE3imO3WueryFIo9LCDUFCz3UP
         S8Nyjv16iJCXyLBsIdHs3gdNhETYqR87+2FmSIXHABrSVzLGG1+hXQf+U26VC7cg5hwB
         wkrX5QAmyz2kpeOmXcGYeyKE1fKcAjsIQdXlR591CqnWYYYr27RtnzlP5Jmj+F60vjQB
         3kGmzwbepc+FZJ6vOyogso6IcavCAZSCbO1XlB7raLFfJleQ7CgyqZ2+C9awMUtBcFgC
         Qt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/hJGXpDm0n9mnn5VnGXz5MvOjhc/+oki+WtRAu5s8ng=;
        b=Y2wuSnFM6aShMqfxfocpWstKxevAP2y6ZhgSgiebsXhHsxDxHvrS7ul0opl7zDp7fe
         9RmOp5HwQRwLRXfxGiePxaPo3LMvj9yf5lHqsu/e/PPdc3RODRnMSBc0s/xJqv78xG/9
         DDtv/6bucY81h1O1WjZ4IUTYgT/y2HU1abtSPGlRopGICxXS0d0LTmlFbrFzP/v+r20r
         16DIwt/OQjUjEBe4BzuSudrRa73mtaZM7cx8MceFUPp7g9gfe5JhX1nB4LeZhY48t1JE
         Sf6WJT/cyIFLCkbywZd5a4s1QOHfEO/r4bCtMf1+UaJCsNlvELDwilrFQR856+Gm8dV2
         wUHw==
X-Gm-Message-State: AOAM531XLC0e1J3JGNkwG7tlmozE8QN/EvkWlgp5rwRNMIHvigLOPdtL
        aczZ3mRBDm8VoSHWleNQSw/TTDJJTDOzNwN29o2rnfrW9KvLDw==
X-Google-Smtp-Source: ABdhPJxrCT3IDLtxUhELVrSRJd6rVjt/Z3kCY0tfFJJ1XPb2DhcAWAtI823cUrAppIYAWd4ZzEmMnrUTsEGp7skWXPc=
X-Received: by 2002:a05:620a:22f3:: with SMTP id p19mr2228666qki.281.1622180891113;
 Thu, 27 May 2021 22:48:11 -0700 (PDT)
MIME-Version: 1.0
From:   Douglas Su <d0u9.su@gmail.com>
Date:   Fri, 28 May 2021 13:48:00 +0800
Message-ID: <CABDqbH2Zhhwh=XL7p4sxVKxFjnK4xxO_xT5oac9ZyoHe3xkU8A@mail.gmail.com>
Subject: How rust subsystem handles long symbols of rust function
To:     "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I am recently playing around with the Rust subsystem in Kernel, and
notice that the symbols generated from Rust relevant functions are
longer than normal C counterparts.

If I am not wrong, Kernel imposes symbol length restriction on
functions and variables. So, what efforts have been made to make
Rust's symbols compatible with Kernel's rule?

Sincerely
Douglas
