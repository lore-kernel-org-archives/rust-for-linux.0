Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFDCC433B4
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 16:21:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 922B2611AE
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 16:21:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235138AbhDPQVu (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Apr 2021 12:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235045AbhDPQVq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Apr 2021 12:21:46 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 253B4C06175F
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 09:21:18 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j5so26284934wrn.4
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 09:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AkiQ5TcFawdlPUYcBb4wZotL+ipQ+/8FiigKI2/wRiI=;
        b=P8jOhoYcZlcJvYtCeRSjHuS/495j4eH3EWhLIMwvEx+zOGYPnvLHJT/vwcwkl+u2tJ
         Ir1ICkDixEkUsfFGdWERoeb7yxBTLQK8+yqXlfy06l/df/3AhbnbqXyhJN3KsOLUEF2b
         quXXbdbcViwXYeq3V8q7ABsRgMQqX81V2YMssHmhaF6k7DRfFd1RZ++Si+qo1ipqddKu
         +f9tnPkeypefIQYlCLctGRiNfEn89A1R6NJeGYMcMDJP0yYI9KWc6DP8vAIiwIMKoJ37
         ftgCNtWQnnbiDZmvTQa2VBcNaWok8CrUp+JToW2jqHM9dv5SjJL+EaXpJ29dKvfXDX9H
         l3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AkiQ5TcFawdlPUYcBb4wZotL+ipQ+/8FiigKI2/wRiI=;
        b=MysWrXeCZDgZot5gTSxChzIdWTPLjMgmbUa5cguYJFZBONFk4tZV+cFn1fOrLC3r+w
         6pkIXF7Xr44CMMc51YVAJW+I5JbvIZsPDIFzuylX05sJc9e/Re77ewQln35sgB2ThzUW
         S6EhzU8avWYC2+l1ZnOMnY1LqxkIvNgMs+gunBgRKovcMndkoD0A3C6h+wqqOCk67CT/
         53AvpXv84CSCn5ek4Sls9XEhd7XMOY3p6/Q2a/ww1Lx4PFL2JbFWyM9VBpCMhAMR7PjE
         zOWqWsGFtdIDbFJyIbvJDf7yZvDGwfWBok6ChotfQzfQgZvzNUXSqpDjCJPqnCZDueT3
         iCPw==
X-Gm-Message-State: AOAM531RRgqTgzj923V5XJGf24ORHhyO908U8+vso3WVwT9po8c9wSh9
        GhUEBmAnXc3a9EQhLX2ZBCik
X-Google-Smtp-Source: ABdhPJw1BqkMZ7as3eCu7+6HY27WFD+I0Cd3zqMNm7CH7+puAegKrzIt39ou1OFGgq7zDIwRhKixmQ==
X-Received: by 2002:a05:6000:18ae:: with SMTP id b14mr9993777wri.211.1618590076604;
        Fri, 16 Apr 2021 09:21:16 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:51db:fb7a:d252:e3c1])
        by smtp.gmail.com with ESMTPSA id v2sm12180947wrr.26.2021.04.16.09.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 09:21:16 -0700 (PDT)
Date:   Fri, 16 Apr 2021 17:21:12 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHm5eHNFOlKlOo9g@google.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHm0DYB08ZI2kuZm@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHm0DYB08ZI2kuZm@mit.edu>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Apr 16, 2021 at 11:58:05AM -0400, Theodore Ts'o wrote:
> Another fairly common use case is a lockless, racy test of a
> particular field, as an optimization before we take the lock before we
> test it for realsies.  In this particular case, we can't allocate
> memory while holding a spinlock, so we check to see without taking the
> spinlock to see whether we should allocate memory (which is expensive,
> and unnecessasry most of the time):

I'd have to think more about whether we can build generic safe abstraction for
this pattern. But even if we can't, we always have the unsafe escape hatch: we
can grant unsafe unlocked access to the data; in such cases, the onus is on the
caller to convince themselves that what they're doing is safe, i.e., the
compiler won't offer compile-time guarantees.

However, and I think this is also an advantage of Rust, such unsafe accesses
*must* be explicitly tagged as such (and this is enforced at compile-time), so
you'd do something like:

// SAFETY: The below is safe because...
if !unsafe{ journal.access_unlocked().j_running_transaction } {
}

And the idea is that unsafe blocks like the one above will require additional
scrutiny from reviewers. So this also makes the lives of maintainers/reviewers
easier as they'd know that these sections need more attention.

> The other thing that I'll note is that diferent elements in thet
> journal structure are protected by different spinlocks; we don't have
> a global lock protecting the entire structure, which is critical for
> scalability on systems with a large number of CPU's with a lot of
> threads all wanting to perform file system operations.

Yes, this is fine, the way to do it in Rust would be to break your struct up
into something like (we have something like this in Binder):

struct X {
    [...]
}

struct Y {
    [...]
}

struct Z {
    x: SpinLock<X>,
    y: SpinLock<Y>,
    a: u32,
    [...]
}
  
> So having a guard structure which can't be bypassed on the entire
> structure would result in a pretty massive performance penalty for the
> ext4 file system.  I know that initially the use of Rust in the kernel
> is targetted for less performance critical modules, such as device
> drivers, but I thought I would mention some of the advantages of more
> advanced locking techniques.

Thanks for this. Yes, while the initial target is drivers, we do want to provide
a general framework that could potentially be used anywhere.

Please let us know if you find other patterns that seem problematic.

Cheers,
-Wedson
