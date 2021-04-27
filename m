Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8E9C433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 00:08:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13BB7613AA
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 00:08:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhD0AJk (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 20:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbhD0AJj (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 20:09:39 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5D6C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 17:08:56 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id h11so484388pfn.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 17:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jhEUU3PVBD/T+rhm8wNBrrNHRMkyuNF74Wry8UjN3/A=;
        b=uY8g8rmUT5h53YKBBtCCNrgeA5z4tDrnYOPb5wV5hpHTnDN+qiuEoJh9fdy+EPxQsB
         2xWDakA87aSbJHWRnxri+9QQzSDQgPEo0K6+jhu0SohCSAZJJMoZ0IEmrtBQVMnaTPil
         2wtJR9iD4aGNPRhIowDws78sex2Yd780QcfbfBg9ixBeBH56yjA5VsWZHjTPBNCGWvGB
         1gYKomZqvNVejUkNVjUG3bGH5dwwxu4+N9Kz6MXujk0Gkd0+Mu3n1cjGjfyU2LS/3HjN
         ukBxtX2RNH99ot/4FMHaWglM40VNwgXlJpcKyhhMUE5uRm8VjclJHcpjsDQCZG1TDXu1
         qKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jhEUU3PVBD/T+rhm8wNBrrNHRMkyuNF74Wry8UjN3/A=;
        b=r5qyLTUavSobxiAYR4ljXOUfZPfoQIhIxO/j3Sow2paEpzH89Fq7ax1i+crCYh1J6b
         wAL/tsoodB43IqlCLyoG9neUI0pvjBY+p5XCtbcCH8PPQcHex/kr9Piwp/8kwjDTM1v2
         IbIG5mj5Q7ieJHOwqb9G26mZzlJyh7PPCJo3YybKMbYq26TiPID1hri353gb6qP1KndO
         ebMF1LF/CQbkKOziiccENTdm9NFti2LaZ+/0YdQFFpBI8r3TFEMUgu1qi6GgBZIX/QcN
         67ETX/eKscIBosYx56wQtDK+uCVGRi4Y7dXVTLCMedqWSTTEDJuLEJKGvi9cUDk/jeVE
         ftzg==
X-Gm-Message-State: AOAM533qhE57gSkAojQtemUdLxZp3E6hi+kYdpYWUyvw6szWvFXQQvrd
        QZTokP2nirIeD+255T3GCOa44RctEF5/zDRpLzE=
X-Google-Smtp-Source: ABdhPJweW0yUhjCd07xHEL5PmPok+igm6n4REGtyWrhq8BRRxoCSh0n2dI7xOkCV5XjuVjvIKBqjZLyc28NKQDo2+ow=
X-Received: by 2002:a62:5f87:0:b029:263:d07d:e88e with SMTP id
 t129-20020a625f870000b0290263d07de88emr20385598pfb.39.1619482135588; Mon, 26
 Apr 2021 17:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <YIdUf1C5VtWn/D2G@localhost.localdomain>
In-Reply-To: <YIdUf1C5VtWn/D2G@localhost.localdomain>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Mon, 26 Apr 2021 20:08:43 -0400
Message-ID: <CAFRnB2XTJ_bSoMXz44McH8153rAW0+h--zN_+W-hw+gMsEL95Q@mail.gmail.com>
Subject: Re: Exposing semaphores
To:     Carlos <carloscarral13@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

It sounds like you already identified it, but yup, that'd be my major
piece of advice, follow the conventions and traits use in the other
sync/ locking types:
https://github.com/Rust-for-Linux/linux/tree/rust/rust/kernel/sync

Glad to hear you're already diving into scull!

Cheers,
Alex


On Mon, Apr 26, 2021 at 8:02 PM Carlos <carloscarral13@gmail.com> wrote:
>
> Hello to all,
>
> I recently began assessing what functionality from the kernel is missing
> for implementing a basic scull driver.
>
> Semaphores are the first missing primitive that caught my attention, and
> being such an important part of the kernel itself, I will make exposing
> this functionality my first priority instead.
>
> It should be pretty straightforward, following the stablished convention of
> leveraging the kernel API.
>
> Any comments before I dig in?
>
>
>


-- 
All that is necessary for evil to succeed is for good people to do nothing.
