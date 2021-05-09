Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E039EC433ED
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 12:13:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5AE8613E8
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 12:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhEIMO2 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 9 May 2021 08:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhEIMO1 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 9 May 2021 08:14:27 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3014C061573
        for <rust-for-linux@vger.kernel.org>; Sun,  9 May 2021 05:13:24 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id y2so17947199ybq.13
        for <rust-for-linux@vger.kernel.org>; Sun, 09 May 2021 05:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WjQkFEMRuWx3AiOEO99fZ/akWMM52P/ruCv99ieb/Zw=;
        b=TAZ5BD1W2Ah+qfhYVsUDrO93XsgCa0uEJJqEe66zClLJqoc6PWPm8bfhXivf2jRxPP
         MW7EXgudMbezHra4XO8uDx6v/BjOmS/PK1NjdrVFWEQ8HfkN+DdnH7HObdQbVcfZMM1o
         drRDPyEJXL3ak65S81dIu9fPJhry+utUstyYI9qKUWzcEoP6TpfRyUyug8xIuasdjH1Z
         KBItozXXo2HhCVBfJ6IZS7wupvchvDwTpkcPldf4/6bFn1NLyTaKVLikIom54JcT6vtV
         d6QP7l+IxdvOxQSrw3LzzYJ6dBNcPc8dx/H6HuKcxWt++FKuz5234ZmHm8j3MZQYbG1t
         xQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WjQkFEMRuWx3AiOEO99fZ/akWMM52P/ruCv99ieb/Zw=;
        b=TsPqlq6OcuKlTI4a+U+4NmmHxnQ0buHfQ/biIIk/kSIc15RQtT4C+loLMrI2U00AUA
         mriDnoYGQmUeSZ+QII3MVTk5LRnSeNrJro4TUECsj1jP8QSF15iWRbcM9nI4fyPtbrK4
         Z25x1Wk53WvyBhKDxPyl5RMimVpTr8KWbg7E5hiaSzOgiIzxTed2tG34xdKmmCt67Ro1
         cZHHxKyTtmhICHljoskgiczMlvLZqL7qG8pvYL+jy2s+JMRVzmG7ROmUccWxZToIMBHd
         16/rVl6l3JggEbiCQz3IjQA0kpZ4Le8vOiYVBIuBhsOTVNF9dufB8kL7nZm4gpaDy0Xz
         Xp9Q==
X-Gm-Message-State: AOAM5307LqWRm1ekc9L2G0CtcpmjS4xWu6XpmqE2kkkFVjNj+Ax93MyG
        rxwq/vrNB/6uRU685k9LLi0pHszeuiAZiYjdno1b27Z9AgK1LA==
X-Google-Smtp-Source: ABdhPJzKBGXRtN1GJj/dfdf2avg28QkEnuoLfQ+CIpMdv8bTHksbNltFvNuc+P7U71MI575w79SdLVs4G0WOf41EOOc=
X-Received: by 2002:a25:ca85:: with SMTP id a127mr25109273ybg.33.1620562404015;
 Sun, 09 May 2021 05:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210509073338.GA1428@agape.jhs>
In-Reply-To: <20210509073338.GA1428@agape.jhs>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 9 May 2021 14:13:13 +0200
Message-ID: <CANiq72noFoTnKtnoW_UUpXHUTcpw5iJcc8ZeU77m4ef1L8KoYg@mail.gmail.com>
Subject: Re: workflow
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Fabio,

On Sun, May 9, 2021 at 9:34 AM Fabio Aiuto <fabioaiuto83@gmail.com> wrote:
>
> One misterious to me side effect is that the command `git show` on HEAD
> pointing to a PR doesn't show diffs.

That is because they are merge commits (i.e. a commit with more than
one parent). `git show` may show a "combined diff" in such a case. For
instance, it does right now with the current commit `rust` is pointing
to, i.e. commit 99bec9d3476d ("Merge pull request #227 from
Kloenk/ra").

See e.g. https://stackoverflow.com/questions/40986518/git-show-of-a-merge-commit
for a detailed explanation.

But you are 100% right! The tree does not look like other ones in the
kernel. If you take a look into the other branch (the one I manually
prepare, `rust-next`), it looks like you would expect (and does not
contain GitHub files etc.).

In order to fix this (plus a few other benefits), we will have a
better workflow soon (as soon as I get some time to prepare it, say a
few weeks).

> After these two enlightening informal meetings I realized that, for this
> particular project, I must (and I'm happy to do it) align with you all

It is not a hard requirement -- you can send patches to this mailing
list and I will gladly take them!

The technical benefits of using GitHub for us are the issue tracker
and the CI, mainly.

> using GitHub. Is there a particular join procedure you recommend?

Using GitHub if you already know Git and the kernel workflow is very easy:

  - `git push` your changes to your "forked repo" in GitHub.

  - Create a pull request in the web interface.

That should be pretty much it.

Cheers,
Miguel
