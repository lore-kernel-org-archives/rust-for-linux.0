Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD71C433ED
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 17:37:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2EB0610A2
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 17:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhEIRi3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 9 May 2021 13:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhEIRi3 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 9 May 2021 13:38:29 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE159C061573
        for <rust-for-linux@vger.kernel.org>; Sun,  9 May 2021 10:37:25 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id a4so14206853wrr.2
        for <rust-for-linux@vger.kernel.org>; Sun, 09 May 2021 10:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WaHwuHWb3AxxLXYAX7yk5RgLdBEnioZvQi6tFDs1Sqo=;
        b=M0zUA4DN1Sj0wZEwfDNjb9MtFaVkYI+S9i//n8P7OYC/+cPzo4oZM7Khzq/hgaikYZ
         PIbfteUXseXvFYdmrk9xggWXNJAy2w4r2SezYoQf9E2GFlx0fFPcGn9rapIIyGE8dbBP
         Fj81W0J0j/MOYtZi1Tuis6g3caG2BSOpB9uhD+SjioYYhhl9PHx7jPQ21+imQ8jyU/4e
         ZalPI0B4eQyPqyMIgAw895pI0Z3HgZac7FEtk8y8xVR900bpni5FgIzo7Oz2a/KM6cE2
         ioTdNXiXbojhhsRcxbSIjcm3woUvqznI/8rblfD/CaZUa9IXb/wMRVdiLpbF7jNSWvme
         yvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WaHwuHWb3AxxLXYAX7yk5RgLdBEnioZvQi6tFDs1Sqo=;
        b=gCk+oN2M3PoEuu7vYE5R4nFgbJQ3vnMH70U2vrMRdSWrOBeAz7KvFjxVghv+zEuw+Y
         E7owC+bJQnQtUcLW2zYpwFS+bajJUyRZpen+Snovt+Q2i0fqjkBRuY96WP98dw0vuoxp
         2GqxIJtB4uUCbCx+1cSXrEYkdCvRwzYXf//w8TiE0QLD7GPOi+Xg79eei+MUjn/TxBz1
         jFM7pWbq3P2CCWjUG4Vffjj2o4sS0GtA5Z/nE6unK/OwW6aPk7GqjHwS+Ee+U/P3PjGQ
         5LrYkv1CxxPot94FJuWk0tK5Ew/g5W9GM8JJHk7lNd/OxbkkJek6jc016Hby3/JfQe1V
         RDRQ==
X-Gm-Message-State: AOAM5300wge5wicTk3r2274sV3KpWRnm1U/Wun+aezVtFNIsARMegcvB
        nb+99957rzU8p0swMvvWF94=
X-Google-Smtp-Source: ABdhPJz5qwhZXpZb/+RcwIhpufX/5joPk8US+9D1lZofCVSLU1JPfgW15aBlmR/x7M6FVfVkdR+qwA==
X-Received: by 2002:a5d:58e1:: with SMTP id f1mr25158476wrd.375.1620581844401;
        Sun, 09 May 2021 10:37:24 -0700 (PDT)
Received: from agape.jhs ([5.171.80.94])
        by smtp.gmail.com with ESMTPSA id c15sm18377628wrr.3.2021.05.09.10.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 10:37:24 -0700 (PDT)
Date:   Sun, 9 May 2021 19:37:21 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: workflow
Message-ID: <20210509173720.GA1422@agape.jhs>
References: <20210509073338.GA1428@agape.jhs>
 <CANiq72noFoTnKtnoW_UUpXHUTcpw5iJcc8ZeU77m4ef1L8KoYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72noFoTnKtnoW_UUpXHUTcpw5iJcc8ZeU77m4ef1L8KoYg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, May 09, 2021 at 02:13:13PM +0200, Miguel Ojeda wrote:
> Hi Fabio,
> 
> On Sun, May 9, 2021 at 9:34 AM Fabio Aiuto <fabioaiuto83@gmail.com> wrote:
> >
> > One misterious to me side effect is that the command `git show` on HEAD
> > pointing to a PR doesn't show diffs.
> 
> That is because they are merge commits (i.e. a commit with more than
> one parent). `git show` may show a "combined diff" in such a case. For
> instance, it does right now with the current commit `rust` is pointing
> to, i.e. commit 99bec9d3476d ("Merge pull request #227 from
> Kloenk/ra").
> 
> See e.g. https://stackoverflow.com/questions/40986518/git-show-of-a-merge-commit
> for a detailed explanation.
> 
> But you are 100% right! The tree does not look like other ones in the
> kernel. If you take a look into the other branch (the one I manually
> prepare, `rust-next`), it looks like you would expect (and does not
> contain GitHub files etc.).
> 
> In order to fix this (plus a few other benefits), we will have a
> better workflow soon (as soon as I get some time to prepare it, say a
> few weeks).
> 
> > After these two enlightening informal meetings I realized that, for this
> > particular project, I must (and I'm happy to do it) align with you all
> 
> It is not a hard requirement -- you can send patches to this mailing
> list and I will gladly take them!
> 
> The technical benefits of using GitHub for us are the issue tracker
> and the CI, mainly.
> 
> > using GitHub. Is there a particular join procedure you recommend?
> 
> Using GitHub if you already know Git and the kernel workflow is very easy:
> 
>   - `git push` your changes to your "forked repo" in GitHub.
> 
>   - Create a pull request in the web interface.
> 
> That should be pretty much it.
> 
> Cheers,
> Miguel

thank you so much Miguel, that's all I wanted to know :)

fabio
