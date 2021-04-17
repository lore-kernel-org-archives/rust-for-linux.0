Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F941C43461
	for <rust-for-linux@archiver.kernel.org>; Sat, 17 Apr 2021 13:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A1B0611EF
	for <rust-for-linux@archiver.kernel.org>; Sat, 17 Apr 2021 13:29:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236220AbhDQN3x (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 17 Apr 2021 09:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236058AbhDQN3t (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 17 Apr 2021 09:29:49 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BD9C061574
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Apr 2021 06:29:21 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id u20so11144467wmj.0
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Apr 2021 06:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ISBdoGIET+ZYznAio2FskDixMUDkKh8PC4/Pd4Loq2k=;
        b=d/Pja+DmXSa+DmZhRpIEt3/37I45Rs75tBubp/JfNW0JByklVj/oO1Mnpl+LGw4Miw
         s8mlIsXzOhdvN08Cwvzaknh9HE7sNEJwbpiFeunxRCkJ/1FRnctFHC8f+rWH2oM3eYFK
         MTXxU5dZXVeXwZYbTn0xfbnSLi5NFB3UxiiRg0juj/B+SUlMgWl0ZwombT8SJriD+iQc
         RDzmYTa2a0GkMdzoPk5pWWcCPGK7RMzCc1JYoUPe05/+cVNl+EpRizRV7UZfHMH+ylgW
         TyOQHeJrz/vlVZ93tboITgeFuJCSXE/A40E0JF7U+x1cZJJW5kc0u6Y73ZruuCx1HBmO
         OihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ISBdoGIET+ZYznAio2FskDixMUDkKh8PC4/Pd4Loq2k=;
        b=t7/HYHmewP2/WmBR/XuLZQ4jfJ5vcnva7RpmXV2kn7L/PYS7MOpfufODsIDiYlfk7E
         YzF7Mb2X3PsGv1Fc3zm4r9Gy5/mYlsiTIskzWp3IX/s1S/D0w6B34viXZgIBvm4Y8WFO
         APBql1QGuOAh+AwEo6q4xdmITk4HbCCCb5gdI8GOxBtcXZYDo4XDhgbqbm8mhmLm/9X2
         KTrtBA/2to2dk376J1yERZLzYvtJgsUe5c6ciuB2hFhwX1tXOJK9IbP2CBemdrQb2MDZ
         pii+taZR+GoVUC3ZtBgK3NQAEUcjFuD/e1DO4Gp8l8MXcRMlyhUMvKRJJkQQ/Zc6uUwg
         maAg==
X-Gm-Message-State: AOAM532Un9pVxQ/a8+vZ2ltg9tEY6wHEyLtxGklv/wGxuzW3xe9ykABb
        G8pmeyEun5N+b4wVJZgiAkSflZNmllQSWIg=
X-Google-Smtp-Source: ABdhPJxHkMpcgFrhLR2HMnbWKLQatCZYeC3c/Fjg2tVXB+3E0vMDLf0rtIbABL9RYc1DU5ZHylo/cw==
X-Received: by 2002:a05:600c:4fc8:: with SMTP id o8mr12727799wmq.87.1618666160177;
        Sat, 17 Apr 2021 06:29:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:3c1c:8462:b77e:21a4])
        by smtp.gmail.com with ESMTPSA id l8sm12570438wme.18.2021.04.17.06.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 06:29:19 -0700 (PDT)
Date:   Sat, 17 Apr 2021 14:29:15 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHriqwf5XR0xWCi1@google.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <20210416150307.GJ2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416150307.GJ2531743@casper.infradead.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Apr 16, 2021 at 04:03:07PM +0100, Matthew Wilcox wrote:
> Well, we could do that in C too.
> 
> struct unlocked_inode {
> 	spinlock_t i_lock;
> };
> 
> struct locked_inode {
> 	spinlock_t i_lock;
> 	unsigned short i_bytes;
> 	blkcnt_t i_blocks;
> };
> 
> struct locked_inode *lock_inode(struct unlocked_inode *inode)
> {
> 	spin_lock(&inode->i_lock);
> 	return (struct locked_inode *)inode;
> }

Indeed you can do this kind of thing in C, but as I said before (apologies if
I'm too repetitive on this) Rust forces you to do it the right way, whereas the
lack of enforcement in C leaves room for mistakes.

If you do add extensions to C to add some of these restrictions (and I encourage
you to pursue such extensions as we all benefit from better C), it is likely not
sufficient to reach the level of compile-time guarantee that Rust offers because
you need a whole slew of restrictions/enforcements.

I also note that academics have a formalisation of [a subset of] Rust that show
the soundness of these guarantees and the requirements on unsafe to compose
safely. So we're not talking about guesswork, there are formal machine-checked
proofs published about this (see for example
https://people.mpi-sws.org/~dreyer/papers/safe-sysprog-rust/paper.pdf).
