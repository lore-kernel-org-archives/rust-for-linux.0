Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4ADC4338F
	for <rust-for-linux@archiver.kernel.org>; Mon,  9 Aug 2021 11:10:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAE9C60EBB
	for <rust-for-linux@archiver.kernel.org>; Mon,  9 Aug 2021 11:10:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbhHILK0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 9 Aug 2021 07:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233516AbhHILKZ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 9 Aug 2021 07:10:25 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADFCC0613D3
        for <rust-for-linux@vger.kernel.org>; Mon,  9 Aug 2021 04:10:05 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id j18so10940601ile.8
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Aug 2021 04:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ednzzfe5Fo2U4Lb5qlDMVay2E/MFJfaUUO8Cfult75c=;
        b=RrcwxMG08MBi6dHyirACdo8fKRYijfTSD0q7Vns/HmXsNUQ9JLUYR/trLeqR2R1ef7
         8rHJl2UXWO5pSQl2w8VRXA81nUpl7QmfaSppWK/6hhju/ewGLa2PMLnuFBf+eQ4r/zxO
         UJeDDdXAix5sa7AYPp6WdAjwM5+BdjOHdfmA7u42fVgUpJyomXTN064SaIqvT69/zlXi
         hMrwG5tYDMDdYVbiqioYr6Ql1iibpTUMpLUp4TvHHjubLNNU8QbJUQPogk3+yJUcFyz7
         xwhYkKSNK908xLK3dpzI7OsYCZprUkB2e1S7p82JcFOb+FyeZWy+f0D2XqphvO49qUsz
         h26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ednzzfe5Fo2U4Lb5qlDMVay2E/MFJfaUUO8Cfult75c=;
        b=XUsP4H36xkKaQ/Y2oDiCIhnL8Yc/GQXl8sY1HuzdUmGwTzbFo3QfcMObnARzQ1WEzL
         azCX9O+MJTypZpwAOMxCaFCfJWiNJfAnAhG/edZuvC7JTstZpwQJm3I/KkpQA2PIw1hu
         wYGNQjwndWG9nWrHXrKCgnzI9sBJY4Oxe5qtSqN0KVt7sebcTPvZs4QJMggV+2siP4Md
         uy7wUwHEUokCPeDwAO62YoovE3EwxN/1RRE8xjIG/Ogtx76ZJFWt8a3PdU3Q8BdShVWb
         cDOFJev6YMwOlbLTMHHhuSdx9XEgbpSS6fqL48o3AlSkRlkDoVj7ZuPnfVAFTJveKiPQ
         Rn4g==
X-Gm-Message-State: AOAM531CAmSs3MGiIGTm5fq3ElUS/pj4h2uThyBrjYtD2PbqU0psIDrf
        oHGB/prYiph7/SAkEUVqwVU2/wQOUauNTky/RuOmg2Ew
X-Google-Smtp-Source: ABdhPJyuIJ6RubmNuUz2liFXnCwj1TI29gxzYEBRVw1d3lfd9njeZjGIJ2VDhDTJdj4wjr8lKcGFSpZVF3MVMTJneaI=
X-Received: by 2002:a92:d407:: with SMTP id q7mr357496ilm.203.1628507405026;
 Mon, 09 Aug 2021 04:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <YQ2XZ9/kPkRTyEgi@linaro.org>
In-Reply-To: <YQ2XZ9/kPkRTyEgi@linaro.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 9 Aug 2021 13:09:54 +0200
Message-ID: <CANiq72kFbq4ySOMNyHbkrg6qdM_60ZKhBs-OTBuz_ZUmp9Pu-g@mail.gmail.com>
Subject: Re: error: unknown argument: '-fno-ipa-sra', err: true
To:     Antonio Terceiro <antonio.terceiro@linaro.org>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Antonio,

On Sat, Aug 7, 2021 at 2:10 AM Antonio Terceiro
<antonio.terceiro@linaro.org> wrote:
>
> There I'm using LLVM/libclang from Debian 11 (so LLVM 11). Is this
> supposed to be fixed by a newer LLVM (assuming that flag got implemented
> since then), or should I send a patch to rust/Makefile to filter that
> specific flag out as well?

Please feel free to send the patch!

Cheers,
Miguel
