Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F47C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 09:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241618AbjFIJ3i (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 05:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241599AbjFIJ3W (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 05:29:22 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64062211C
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 02:23:45 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-bad0c4f6f50so2296067276.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 02:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686302624; x=1688894624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vqW5bumq/hRwLXRlpULW+ThTgFp9qFjgB2q/vtaKnU=;
        b=GTLCz2X4EPw9Ybrhbgp+wgZ5t3OpMyiUFF+Bdcvwrn6HLkQdFjpf6L/wEE556r8jAw
         XkMrPMJvDZLDaY8K4dhR7M65pLIJbWmAWLdvoi0zVwwbmTAe/Wt/bV6vERWFcDJSq3kO
         xe1IjufPTeWg0Ar/d2fuXsPI6a2OkU2foGSSL8CsF4nzMHpcK5QZFv5kDhTi0q25KrRj
         9W1pd2Iw0BGQogcIfTbFdNnU8sl1SacpvS5UvixpG4M4BXpN7c7+iYjIMMnRuguqB5wv
         /etOxUHofpr/5z0HkF31UE6XMGZBkOEvJ4XAjHAcPbRboIJPm8kC7i5xLKADRpVuQWPI
         c+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686302624; x=1688894624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vqW5bumq/hRwLXRlpULW+ThTgFp9qFjgB2q/vtaKnU=;
        b=M43ZURw4wMHrs5n7m+z8MXMaqDVRHH2HdjPCbYVeSsQW+qGP/BVh6710cyJ00u/QTI
         loq3FSwt2ZxV/xrGXKFuSPanKCJL6dzEUqtmTIf+BSXP3W5NsO55X51nTTnIZIJxZnKX
         XAJ1S+GOBfmOyx4qG79+VFQmquWAfhnYwbVKBWFjPfiJRaY3uJSMyyXtIXlgBVGccLfS
         eBFjORTOquGZKJariFWGYw0PfemRWiplaOzxGFwlfsL4Pw2YgY/m2Mj0x/5QYl3abhVU
         q/hsouHP3ccMQDKiFGaYbz89dnsTMPJTEtxsjCs5KifvUUt9Su35/J8niE2JPNfwp9Jw
         85FA==
X-Gm-Message-State: AC+VfDzYQG1AzjKIsmHLO7TVIrXnAgKsCkyDNiIx0R/mcSqPR9w99GvG
        pnjOWRw4nl6oxZ9fnVBnD6G5uOf6VfJtuGosA9SwMDTu
X-Google-Smtp-Source: ACHHUZ4QFUhhPs/LYnJkuuIxBBxB0uHGuujfRUUiqgfT0hYuwh932WJvD3o81g5rhwf+HeT+pxKd/bfzRTEy2xakpYk=
X-Received: by 2002:a25:6e05:0:b0:b94:bbf2:19a3 with SMTP id
 j5-20020a256e05000000b00b94bbf219a3mr1346208ybc.18.1686302624483; Fri, 09 Jun
 2023 02:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-3-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-3-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 11:23:33 +0200
Message-ID: <CANiq72=nNRr4AGw2skuxUUC71ks8NTMh5TuyyT6vn_wOCgQjcQ@mail.gmail.com>
Subject: Re: [PATCH 02/80] rust: add ability to register a file system
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 9:03=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> From: Wedson Almeida Filho <wedsonaf@google.com>
>
> Also add sample that uses the new public API. The registered file system
> cannot be mounted yet, but can be seen in /proc/filesystems.
>
> More functionality will be added in subsequent commits.
>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>

Note that you need to add your SoB too in cases where you forward a
patch, even if you are just handling the patch; see
https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-=
developer-s-certificate-of-origin.

Cheers,
Miguel
