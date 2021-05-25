Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C33C2B9F8
	for <rust-for-linux@archiver.kernel.org>; Tue, 25 May 2021 18:52:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B2796113B
	for <rust-for-linux@archiver.kernel.org>; Tue, 25 May 2021 18:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbhEYSxt (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 25 May 2021 14:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbhEYSxt (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 25 May 2021 14:53:49 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2CFC061574
        for <rust-for-linux@vger.kernel.org>; Tue, 25 May 2021 11:52:19 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id g38so44436821ybi.12
        for <rust-for-linux@vger.kernel.org>; Tue, 25 May 2021 11:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KbMZgnKXTrmTOfE3geyD8/XMc+Lq9vx/ygWnpnUemIk=;
        b=q44toXrRKGimiBRrXY65IFVI1TYoYtpzf9E4X8siOgo8vwhBCvkeVRfJ/iBf2Odz4c
         AuRWrOJXWlDVv+u0PKPLuQGhQX58iYRvJQR2tl5S+AAaFyOaKt6+hEsodfTwG8OBLpMC
         8ebtYmmtUXSnpWQ48JEfAavEYWix+gtPty38m0W0x7XbMyZ/Kty1XHWV0H96Ha2ub0B1
         K6BcmerWSRwtPh7xMInqF/eEPBZ3tA7+yjsn9u3Cgx6qthBq3ztyABl+RLtNXX/0Vw/O
         MmySbfh1Dvkil1STQCEQVrD2TWRBv1hmxMSmS9fh7sxAz01oYeQEWamZHuYJyzPXQWp0
         D0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KbMZgnKXTrmTOfE3geyD8/XMc+Lq9vx/ygWnpnUemIk=;
        b=c/+gvi7YHPqPlOFcDby9PQDIml/mnkereBCbJrZRyedyUbspDLAmsNPBM7QNpLJkV2
         H7CIf15GfsxBLOzM7k3yoCb4q4MyZjYgVuwA+W2cya5xRBwar2yEtm5LrJvzCskyEGo6
         /VES5g6mpx6V4KqweodGrL2Lpof1sjlXZhjWI/zG8TjpVBZBpmSA0CWiBeY1bXKneY/V
         3AiD0HjPiHBUWdA2ZpmSXrNaSZ7k16buj2PlYWIvwtcj5mykmqA2RSgQdF0C7MjFQlq1
         BPSLKfo6/5iLF1pYCKaKLpAUIKo/lWaJgqPp61if6TfjRJJ0JMbFGci0mjxFhAXcmx/4
         /Qqw==
X-Gm-Message-State: AOAM533iHAx4b1RtelJhjnx0+C2tP6HyeaZ6daDmlOhaKvB3kFM+NloL
        fgvbjh/fuorh0b3tvudk8o7gI4glD8ZlLUPleVsn5frVUUE=
X-Google-Smtp-Source: ABdhPJyMHIC6tsNsDK/MJn51R850AIf02HriRNLJ+KoYDaqqjOFOzUnf+d7l2vDIHC4yieaF6L5OsatIbnYFFATUfa0=
X-Received: by 2002:a25:73cc:: with SMTP id o195mr17627064ybc.33.1621968738409;
 Tue, 25 May 2021 11:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <fde720d1-cade-e01b-8dc2-afdbfa52bb3b@thomasthanner.de>
In-Reply-To: <fde720d1-cade-e01b-8dc2-afdbfa52bb3b@thomasthanner.de>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 25 May 2021 20:52:07 +0200
Message-ID: <CANiq72k1=vjtfhato-bFga5p0W00cq1J_j24Y7=XBqN0wb6VUQ@mail.gmail.com>
Subject: Re: Error building sample modules
To:     Thomas Thanner <e580@thomasthanner.de>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Thomas,

On Tue, May 25, 2021 at 8:24 PM Thomas Thanner <e580@thomasthanner.de> wrote:
>
> Has somebody an idea, what I make wrong ?

A few general questions for reproducing your issue:
  - Which Git tree/commit are you compiling?
  - What is your kernel configuration?
  - What is your version of GCC, LLVM/Clang, rustc and bindgen?

Thank you!

Cheers,
Miguel
