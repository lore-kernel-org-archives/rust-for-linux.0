Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07041C433DB
	for <rust-for-linux@archiver.kernel.org>; Sat, 20 Mar 2021 17:26:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBC6E6192E
	for <rust-for-linux@archiver.kernel.org>; Sat, 20 Mar 2021 17:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhCTRZW (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 20 Mar 2021 13:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhCTRY5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 20 Mar 2021 13:24:57 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4EDC061574
        for <rust-for-linux@vger.kernel.org>; Sat, 20 Mar 2021 10:24:57 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id h196so1771261ybg.1
        for <rust-for-linux@vger.kernel.org>; Sat, 20 Mar 2021 10:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EVf4G/0Yr7cH8u+77/gjiHCZPGZeLkHu1NZcsF58acY=;
        b=Xe72tvzyMZqja9QkUACRepF6ea5XwB8ZeFeBsMDykW+OrkORCnV3OqlSrCPTqU9Qcw
         LSsEotL3zsSG+fD5zLWf4zfMayKuXmtSEK9e7OvV1pPRf1cvdvRzSqBaP6eZNMy6/jzq
         10t9nyv/APse7uX7fzEuXyWmjyLyUXmpjcpvIlbJy4BHwCfaHTuAeTrDv2/Ios07Bnmd
         IG3gRfeniyPh99dZ2BtRMfYZhVIxCbn6egdZeM7KH5wUkRictKmL+YSaqmkubxALtv+K
         qpl2muu6cB8zwNsHhh24fD7wdG4mLMFe3k+tN8d1H+pI71EIsAbbe+Ia3LWvjtEvK5s8
         Prqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EVf4G/0Yr7cH8u+77/gjiHCZPGZeLkHu1NZcsF58acY=;
        b=bdZpz1jLvFngHqzqR3JV/AL8LjtRxsR/6iX6qLyeZl4shpOvUWfVfWzPT27H/cydzJ
         1iwcwrPjQdGY6H/7QUQd8DGXZ9R2wEfYNrr0lvdcTx84ehzoPsjkeuyZKsxq5FPnEVAQ
         mG0WBxZuhE/I/Ttp/vpj0SwCuonwYB/QZWcvPKNxblLOq5FaQZzqEbSfd4w/icBaKBkX
         FnvtAIYPgfNHAMPn2NOmrCyvA0MWahogJegj3TzJ8Dpez503pyd5xGe9mJ20+a/Sn5Ud
         w4DfnHQeT8e+V4260AiAfF7yKlwxnbtl4WpX5zC1ApKyXGB0jWPqUIha744aY8yIcbJk
         bcHQ==
X-Gm-Message-State: AOAM532HSGmyBDJZzyPUU7krO+zVRMV4q1ar56QfO/6FCL3gL3xbQOcX
        jsJhduQZIWCNdeFfZTFq/LSsoJtyHonNvSKncTkhZHrbfzI=
X-Google-Smtp-Source: ABdhPJxicpepYv2WPvaNayTLoDfypxwdPIY4o77TbCZog33dUTlPGcVZNTs6k10RCBYX45kOMMU5luN1keCV0hX92R0=
X-Received: by 2002:a25:d6d5:: with SMTP id n204mr13613960ybg.22.1616261096498;
 Sat, 20 Mar 2021 10:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <87zgyy160b.fsf@santosiv.in.ibm.com>
In-Reply-To: <87zgyy160b.fsf@santosiv.in.ibm.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 20 Mar 2021 18:24:45 +0100
Message-ID: <CANiq72koz3X=fstSLcAu_MkCDsznK+i0xqSnZjxh8LpRC_OBMg@mail.gmail.com>
Subject: Re: Could not insert module: Exec format error
To:     Santosh Sivaraj <santosh@fossix.org>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Santosh,

On Sat, Mar 20, 2021 at 12:25 PM Santosh Sivaraj <santosh@fossix.org> wrote:
>
> I am building the kernel on a x86 host and running it on a x86 qemu VM.

Is that by chance 32-bit x86?

Cheers,
Miguel
