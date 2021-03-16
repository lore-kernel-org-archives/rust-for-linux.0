Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1455C43381
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 17:33:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E06065126
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 17:33:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhCPRct (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 16 Mar 2021 13:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235575AbhCPRcJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 16 Mar 2021 13:32:09 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68567C06174A
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 10:32:03 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id l8so37621257ybe.12
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 10:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PwOENnD802TECOumGjavfDTi2nDHgOO6a54jWUoKnvw=;
        b=REo35h4p1CB8qk49m3uB5hc69ctUIJEpm0erFWjPsk5zZjnC+vd7wgGg6quNTGgJpC
         avePof0w7k9JYhLzPtyD9DsgtJkSCSJuDpsS14pgwlkY6+Rs7nEbDUdyQfwd4F+VObys
         XaDVa+i9LskCIEB4SFjE2hkNENNMQtUrFmloxUnT3abqTfF5N8Kr4FEK/O0Mh50j5XOl
         4YpmznDSWME89c0XGOZ0T4K1fgYexNg57K2vqywSaVjAOOJwvtH+WO/jEbsT2j3bX1Sm
         6Kwq5YuNr/253b2ECZ6gJk3DtxbeE27/gGCwF6tZ6i40ssrOs7ty/6rYWH1AORhes50O
         afVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PwOENnD802TECOumGjavfDTi2nDHgOO6a54jWUoKnvw=;
        b=FRMroQ0E4zUZD4aPzxnnKs+MXjKnoLZfuU+3sbMBgWpHAZaii9K0DqF+Y4CVfh5g7G
         CBpw0kqRBv25kG11jZQEkfZq49oF2Rb9OOvUAv+89OlR9yMsRd/Ow6xvnOi5EvLx8zjw
         XIw/G45OG5t/dYa8JE+sGyFrhdglm0CUf6wgGUIv/1BnfNIaDbdAjcQXTmZNFYrUzlxR
         cYqOogBYGddmWlWGPna9J8YkUPe0r7d/Y4u7Jaci/K9Fc7MbORzDAQv9zcdG2o0bGhJs
         yeVd9wsuB7ITaYUQIoSB6rwjMxzOLUWBnWukk8SvTuWM9e6iRr8JBJZB2WFp09Vgm2x5
         5Shg==
X-Gm-Message-State: AOAM533wV5Vpknro66Ppe3wvglf9tnrU/P5NiJthSJM/EKdRZaCGdGmN
        2x3/0oW/wZcyyOsyUJt1+zEEuyzsqHR/gLwwmKHV79/UcX4=
X-Google-Smtp-Source: ABdhPJw1Pr8QA+ID6RgCqdKsctG8QUBGyvUOLKkq7MoUCXPjHLrKJcd8YBPLJrW//PDAUYag7PwXCtGf7L2DFKWVn4g=
X-Received: by 2002:a5b:449:: with SMTP id s9mr5398527ybp.115.1615915922789;
 Tue, 16 Mar 2021 10:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210315063044.ur3lvxv7emo2egu4@adolin> <CANiq72=ZUr5JcfnMYB_=Gnsi08q45PwOUo3-CPL84_d5G2EV1w@mail.gmail.com>
 <CACAkLuqMrRAE6d8dP_b9khtO3HY4mnEGP_Z+1HhzRYDMOaaN+Q@mail.gmail.com>
 <CANiq72=2FJQ7Ct_77MsaYe-3qThuRJ-gkLFvY-acq_GmhR9A4A@mail.gmail.com> <39D26FFA-1635-483F-A43F-3BCF942D0AF8@gmail.com>
In-Reply-To: <39D26FFA-1635-483F-A43F-3BCF942D0AF8@gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 16 Mar 2021 18:31:51 +0100
Message-ID: <CANiq72md387Ce6nwaEDtqtZVSfQcHZYDg9F0f5+tiRnRhikzDw@mail.gmail.com>
Subject: Re: Build system can't detect rustc
To:     Kaviraj Kanagaraj <kavirajkanagaraj@gmail.com>
Cc:     Sumera Priyadarsini <sylphrenadin@gmail.com>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Mar 16, 2021 at 6:00 PM Kaviraj Kanagaraj
<kavirajkanagaraj@gmail.com> wrote:
>
> The thing that worked for me is to  cp .github/workflows/kernel-x86_64-release.config .config and build again.
>
> Although it would be nice to find out what is causing this when we generate config from make menuconfig (even after following the Quickstart guide)

Yes, soon we will need to sort out any issues from
{def,allyes,allmod}configs, start running them in the CI, plus run
some randconfigs etc. as usual.

For the moment, please run the included configs if you run into trouble. :-)

Cheers,
Miguel
