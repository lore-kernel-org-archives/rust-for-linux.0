Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75356C433ED
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 07:33:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49755613EC
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 07:33:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbhEIHer (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 9 May 2021 03:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhEIHeq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 9 May 2021 03:34:46 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C4FC061573
        for <rust-for-linux@vger.kernel.org>; Sun,  9 May 2021 00:33:43 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id x5so13336017wrv.13
        for <rust-for-linux@vger.kernel.org>; Sun, 09 May 2021 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=2R0QC9+5TGsD7BI+saLvIc/jXDAuP0hlceTA7gr4HlY=;
        b=Ma/efQEDIAD0sGKMAdeWg/MMucEuHPj6IjizzuqiCs7KYqsmI+9KUgaN4MAMpCQprb
         Xy9BwlfCuL/y44XXTeNfdlEDAVJuBokl9QAOr889fcYEv4x7wPsQD/NjNHANT0scv17h
         s7lA7K+gHD0oEGKVIF/IKNykF55dxZ3gsUVsj1wCR5ZWCVugRkgS2Ik5oazd7si0W1eK
         ysQjtiamheWq4J4X/XHBWmQSR5nXwFqe1+x3p2ZMPgwwp/oau7YGRxTzPmgcez/GZfUx
         KErf183oW/iWgRthPPZ0A6khvoMoA4zrEvQBzBnCldV9PY4AR//NUNhwnI2paSDUshXR
         3tEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=2R0QC9+5TGsD7BI+saLvIc/jXDAuP0hlceTA7gr4HlY=;
        b=Vg/ZCqxjHT7DMSCT1IyHvqzJmVBa1upf3xNWwWgKsOugsNsK9+N/I0es3AVjrc+bHC
         ieu58iFwU25NvsTRjioiBuCHgtuMcK/WR4Ya4JPz9qYvicj2tzllxLwF2R3jNOuUqy0W
         YlnLdHL+Ws7XhitKmupHFIOX10LPu6WzsOfkZEWdIy7KoO7c1E2VKPkn8Ja8yU7GWcw6
         H29DZu/yOaX1apIdAB2NJk7fFuKlJVyexHc+hAhFd0eNU90OP/3CVkEjBY2RgkEttf3+
         PP8SvUAwwNbftS7nSN3UA7xS9b44Gqldh1XRJjfIclh0+NWpzRhAfaV93x1JXxIxFuJu
         IShw==
X-Gm-Message-State: AOAM531IwTMjbGx0FwvNCS0sli0NWhvwVlkCmen+ASwmXr2lc/U9NIbG
        IwJQ8xZmr877LBDQTLyiGrl0SFcNLOy2OA==
X-Google-Smtp-Source: ABdhPJz4EhPFJMHY/FQfuA+1kw7DrdC4GkeujItKz0yRVS9/gDV8JlDNYCF6jdK7q1BgVFHTi+PwuQ==
X-Received: by 2002:a5d:5989:: with SMTP id n9mr23324109wri.60.1620545621414;
        Sun, 09 May 2021 00:33:41 -0700 (PDT)
Received: from agape.jhs ([5.171.72.248])
        by smtp.gmail.com with ESMTPSA id i12sm17281184wry.57.2021.05.09.00.33.40
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 00:33:41 -0700 (PDT)
Date:   Sun, 9 May 2021 09:33:38 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     rust-for-linux@vger.kernel.org
Subject: workflow
Message-ID: <20210509073338.GA1428@agape.jhs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Good morning all,

I need some clarifications about the workflow.

As a newcomer in kernel development and open source development
in general I got a little used to with the forkflow in Greg's staging
subsystem.

The tool I'm used to work with is, at the moment, command line git
against Greg's tree.

I tried to apply the same approach on rust-for-linux tree but I noticed
some differences, first of all the use of GitHub.

One misterious to me side effect is that the command `git show` on HEAD
pointing to a PR doesn't show diffs.

After these two enlightening informal meetings I realized that, for this
particular project, I must (and I'm happy to do it) align with you all
using GitHub. Is there a particular join procedure you recommend?

thank you,

fabio
