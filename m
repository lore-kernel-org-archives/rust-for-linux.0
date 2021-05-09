Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEC6C433ED
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 10:42:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B775C60C40
	for <rust-for-linux@archiver.kernel.org>; Sun,  9 May 2021 10:42:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhEIKnV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 9 May 2021 06:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhEIKnV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 9 May 2021 06:43:21 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E4AC061573
        for <rust-for-linux@vger.kernel.org>; Sun,  9 May 2021 03:42:17 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id l14so13617095wrx.5
        for <rust-for-linux@vger.kernel.org>; Sun, 09 May 2021 03:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ADXHLD9YWHOtEcyX0JGVzWymLrDzBKfZY4bfgcx28IY=;
        b=D4Hp9rDUghS2as4XttRhI1ZYmnoayIdUtKSVEikA7p84WBuCAde5NiOFV6oqjqPF/S
         CNytP3mnn6tq5qGiaStcarRC3fW0lOJ2cmKuLiKrv8PZhb6VC7BTDQ4ZXcSuJYevMt+N
         37xRtbmKmPCvaPJhnZfAs4hy/D6V5biKkXqRGFKdD1KWR3E0dipfsC/bmoJHbiQM1paX
         yxdzZaYw/xN0VspMFrf33GpLTn6M5GM5UeH0ffYNNMASLg+9UtHQ5UACzTtUdi6l84Th
         VOk/lnyQDWsGjkZlDh7AhQRHmVV0Gvg6pugKpZcGgZiXBN5lbZw1/szXNkYVwdGwaSXC
         ofRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ADXHLD9YWHOtEcyX0JGVzWymLrDzBKfZY4bfgcx28IY=;
        b=it6tV2n9R5FeDdrvOXc8/03z7w4VSAfd9amqZt44sDY62XnmtQ4bk7Dlx+ahu6Oju8
         PS/4PXQSWZJudaAMqVkTAyGrmA+I9+59AzSAFTZiUi3tEvmyAbUKty8iekmkihjekD8h
         rGAmPwtQK5YsY2xeyGx/LXZmjgnAlGW39og44D7i/EYqfKKFnXJThO1ETgRNqqfT/rL/
         QdJsvXQbqQKUENfWHVkAc+CWYkEq3Ij2zWsAto6xAN2eWs2W+R0C74DgP01nIRi+QoLu
         0EUYzf5f4VAOor3h1YVPtnmYt0DHQOhymg2S3V9piHhMhRp1EYeVrVeMy7mObHwOza4Y
         yqVQ==
X-Gm-Message-State: AOAM533CkObvbpSikr/4Ubo6LCNjiyMSMPdruV3mTtGISfTr99tO/GMI
        PycnaQKZJ1lp3BFsDsLzKyrjL9+0bT3JfQ==
X-Google-Smtp-Source: ABdhPJyG9yFydvVWgDXQfiVKpywO3xRWpFjdA00p476bDRZOI3QKXGJviKxpyWHR5OfqBz/CtAZOTQ==
X-Received: by 2002:a5d:5989:: with SMTP id n9mr24201221wri.60.1620556936251;
        Sun, 09 May 2021 03:42:16 -0700 (PDT)
Received: from agape.jhs ([5.171.80.238])
        by smtp.gmail.com with ESMTPSA id j13sm21400189wrd.81.2021.05.09.03.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 03:42:16 -0700 (PDT)
Date:   Sun, 9 May 2021 12:42:13 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Geert Stappers <stappers@stappers.nl>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: workflow
Message-ID: <20210509104212.GA1405@agape.jhs>
References: <20210509073338.GA1428@agape.jhs>
 <20210509093150.jtaizeq5dyyot3qx@gpm.stappers.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210509093150.jtaizeq5dyyot3qx@gpm.stappers.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, May 09, 2021 at 11:31:50AM +0200, Geert Stappers wrote:
> On Sun, May 09, 2021 at 09:33:38AM +0200, Fabio Aiuto wrote:
> > Good morning all,
> 
> Hail all time zones,
> 
>  
> > I need some clarifications about the workflow.
> > 
> > As a newcomer in kernel development and open source development
> > in general I got a little used to with the forkflow in Greg's staging
> > subsystem.
> > 
> > The tool I'm used to work with is, at the moment, command line git
> > against Greg's tree.
> > 
> > I tried to apply the same approach on rust-for-linux tree but I noticed
> > some differences, first of all the use of GitHub.
> > 
> > One misterious to me side effect is that the command `git show` on HEAD
> > pointing to a PR doesn't show diffs.
> > 
> > After these two enlightening informal meetings I realized that, for this
> > particular project, I must (and I'm happy to do it) align with you all
> > using GitHub. Is there a particular join procedure you recommend?
> 
> I think original poster
> is not aware of "Rust for Linux" already in the next branch.

ok I will search on Google what does it means, for sure it's more
friendly even if it requires an account

> 
> 
>  
> > thank you,
> 
> My appology for this way too short message.
> 
>  
> > fabio
> 
> 
> Groeten
> Geert Stappers
> -- 
> Silence is hard to parse

thank you,

fabio
