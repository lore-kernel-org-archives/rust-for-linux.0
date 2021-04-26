Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905BBC433ED
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 21:12:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5929D61178
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 21:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234275AbhDZVMs (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 17:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235493AbhDZVMs (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 17:12:48 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383D3C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 14:12:06 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id l2so4980559wrm.9
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 14:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DlLcSe8k/+eXew+2V7WDP2R4gAAPR6LgkwZCii+o01Y=;
        b=LprwCWP6xO8w8fjLhriZL5ncY477FLxf8n1KfwdRXcfmQQ79520mTf/EgYuV8i07xF
         tw/UGZSpy65Sp0fmaTZdga4+yODGp6casqXteToTMMvbH54lDfHyVx/a6PDfBYxcgX+d
         vD1/W6gFUyQVGozBytt/Y+oSS8GPYmA3S1PLfjg2AiKUa9dDTKtPbCyuwWmobVo+zhy1
         93/tJMjV3VzNUyWOBesDK3QzwoTM+Vk/sJOUZeTDqoXzdTecKWzFQ5VadUzp+Yzt80KB
         cAhjbE3RvZgVvhSqsLOGMwvFgkyl8dUjKjwqx7njaKmakOcqg/QXrgNuIqG6JDIa4Z6+
         7ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DlLcSe8k/+eXew+2V7WDP2R4gAAPR6LgkwZCii+o01Y=;
        b=Kql29OW4mWx2r1r/uvx4G3JdgTIgkIpDF8N08DFW8GmLVICmpaSR5OMIM1DgJWBbBH
         AKsmiJceImjnXMS5Z1HRCNg+kTuOQVj1lyZFxIZwnWPAWo6LTQEpOfh9YAvWbcLaxG3h
         mhkFgmBPOokLUs7qOFhBEBnACbfjf6llMexHOOLn8iGXLNmmjgMxW13HwUiPj8c2uW16
         RbRzyyF2g657Q4FwGCPu20v5WNqW5bkrLlZ99hfyYxrGhi1gbK1dmD2zkFY0Buf9e8CL
         P8mZViu2+CdVpDw3wp+2UQz+nmJ8WbqRDvL9udcNZmC83HzKbR/5nA/qTMTjcwJn/Z+y
         M77Q==
X-Gm-Message-State: AOAM532cOX7bqComrajZgAYXN8D1fkqqFvmdzruNc95XxqphCBtCFovZ
        D/BxDMF4gO7mtjOLKvwIAUUNSEPDrNk0468+K2Yon6twY4HxdLdW
X-Google-Smtp-Source: ABdhPJzU7Jtt58P5RPn0DJh6EkDymVDHNLLWEotuVW47M+3mi7JYmrphDRORybIPOszsJTBa0XKDefkTNBemjVnebIs=
X-Received: by 2002:a5d:550f:: with SMTP id b15mr25931406wrv.251.1619471524903;
 Mon, 26 Apr 2021 14:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAGngYiUHmkGTP7encnQOHv9CU6H4+RTN96oJb9B7DY4cuGPwAQ@mail.gmail.com>
 <20210426205810.sahdkjyeueg3miug@gpm.stappers.nl>
In-Reply-To: <20210426205810.sahdkjyeueg3miug@gpm.stappers.nl>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 26 Apr 2021 17:11:54 -0400
Message-ID: <CAGngYiU2xze8Fo47Hbmu5CDh5VL-K4ddL-ez7+jOUTBJHydChw@mail.gmail.com>
Subject: Re: [RFC] Short Circuit simplest Rust driver that touches real hardware?
To:     Geert Stappers <stappers@stappers.nl>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Geert,

On Mon, Apr 26, 2021 at 4:58 PM Geert Stappers <stappers@stappers.nl> wrote:
>
> Hope that hardware manufactures see this opportunity.  Because I fear that
> this cool project might get botched due lack of knowledge on hardware.
>

Thanks for your input. Would you be able to elaborate why we lack
knowledge on these Raspberry Pi peripherals? Take the rng. When
reading its driver here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/char/hw_random/bcm2835-rng.c?h=v5.12#n62

it appears to be the case that the h/w is setup by writing a value to
two registers (RNG_STATUS, RNG_CTRL). Random data can then be read by
monitoring RNG_STATUS followed by a read from RNG_DATA.

Should be as simple as they come, no? What am I missing?

>
> Implementing kernel module for 8250 UART in Rust is something that
> wouldn't get botched due lack of hardware knowledge.

That's true, but also much more complex. Doesn't it depend on clocks
and interrupts? That's infrastructure we don't yet have in Rust.
