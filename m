Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEEEC433ED
	for <rust-for-linux@archiver.kernel.org>; Sun, 25 Apr 2021 15:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63EC761350
	for <rust-for-linux@archiver.kernel.org>; Sun, 25 Apr 2021 15:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbhDYPtN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 25 Apr 2021 11:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbhDYPtN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 25 Apr 2021 11:49:13 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F5DC061574
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Apr 2021 08:48:33 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id g4-20020a9d6b040000b029029debbbb3ecso16789959otp.7
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Apr 2021 08:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=U2i4y7AyCjgPYfiBM6irFdcBoLKY2UtwZGOSSSIaz3E=;
        b=SVCtUWIF0DzmVpinvZn7XjqeOo+rQ00XvQWfHbdbCctHuQ06pECb5aLlZKoIb5Ncps
         1zob2K5S/Gy4fnWrCio5yNzYO9oSpCUyUYHVCk/i4Sk4SJ9bU5JVt1trGqf9ZeJV+vtt
         8Bd2kStnFTa0UgcIqvJOoSj4sv+IJzXa6HqKF/734jbkE6iike5K4YH6rAU5yd3xrQKQ
         /k3Syl53iIBVm3BOQGqsTHXm2hmjeL8OhkMUq8Yy4tENOy4gOw+S226JkV0LRYLHTtCh
         RvRdBK1suRDbPTA9Wi2uSoBJjR7/NfeGd2R60KfxQCzCpy+vuS0W/D6UzzscIHCuETEB
         BvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=U2i4y7AyCjgPYfiBM6irFdcBoLKY2UtwZGOSSSIaz3E=;
        b=DeEpPeSX/SSmDUabMj2r/zkRuOoikvYPIvKbBPLzoZvLuBTdygAtmytJ0kMC5/pZHh
         iwe3H/wTArninMCnUbcJukuPLGpN1Hn5lmGUdXr30PCILJ1ZI/mqPYLlzj5k1RouDAzS
         aA9wJgv4OM/nGIRjKagnRGNc/iC32+hKLT5Sh5GlGolvg39SzAshb+OzuhzFKE1X9Rr3
         +6Z0yrhdh1ekF6qPOk9U+9t/yWxaZEzsnJN/OHfmTAfvkOWnBj3qqbkQ/XH+C29W2fw3
         HfiA1RT/+9MlGpFVy0g+7RuYQ2OstFwdshEb6DiZ8+hOCMWvy+UVWl48gZOFB7pGjxV8
         r7Iw==
X-Gm-Message-State: AOAM530IVqQCVrq0/On8FGe9teVqbmFLfrhXD330xuD2Gxt1IvK++lto
        CIHKKbZMrI5ztk2xleHm/R12mmjxiEamZxjkgsqg1rwdbR4=
X-Google-Smtp-Source: ABdhPJzbDhoXcaGed6uemxo5FYgunjiHKvdUV4XKG2ki5Kdcs9BcC/jJRIpAXmmpWEvPcCRdtnAB9yU6ldDEpPDSYBU=
X-Received: by 2002:a9d:628f:: with SMTP id x15mr11305910otk.186.1619365712640;
 Sun, 25 Apr 2021 08:48:32 -0700 (PDT)
MIME-Version: 1.0
From:   Carlos Carral <carloscarral13@gmail.com>
Date:   Sun, 25 Apr 2021 10:48:22 -0500
Message-ID: <CAMU0-c+QrurnfVZofHHtQFKPQ_QTpAeoB67LnXnuEBGjrPQByQ@mail.gmail.com>
Subject: Regarding SCULL driver
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello, I've been silently  following the RFC and mailing list for a
while now. I'm a newbie kernel hacker and as it happens, I recently
read the Linux Device Drivers book so I have the scull knowledge very
fresh on my mind. Could I try taking on this PR?
