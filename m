Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25467C77B60
	for <rust-for-linux@archiver.kernel.org>; Wed, 26 Apr 2023 10:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240515AbjDZKnd (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 26 Apr 2023 06:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240399AbjDZKn1 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 26 Apr 2023 06:43:27 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C5149F0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Apr 2023 03:43:23 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4edc63e066fso7180e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Apr 2023 03:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682505801; x=1685097801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1l22hRUUq/IeT+lj7j9mcQyEj+B5z+NRQ6K59AKwb4M=;
        b=dQ4cunzURjxkU0Leg7LAnW10B6iCwcl0niLLMCTpkjxaqk9CfBvAZ1HgYEeuNEf5Df
         zZ184SgUKghynTw2tZX+ypOybCxdyCKNL7DMU9IjJu/PdtY2ux8Z/c/xxwn9U7NV4+x8
         dbDsyMs04VHMB/zNnOJP4wUr69uff9Qqm/M2aWU00bT2qFUwxtFouULN9tFgPzMneHyv
         lVGDvP5erVVVmurehevtjGrXnOk0JRJsNeS0ZcaQFAOhgyLAM7167hxcZoAYKmlGkLH6
         KJ9Wkxb5NWiCh8R/jpMyPupA7BUJu+0Opr7z9XpWThO1NjmwZjfbmqdUc5nQgVBLootZ
         T22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682505801; x=1685097801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1l22hRUUq/IeT+lj7j9mcQyEj+B5z+NRQ6K59AKwb4M=;
        b=Eq7LdaR0sLqh+q56KKRvkUU4ppuDTn2M0hXpSy7Muc38BFiI7hFZI6ypGj3LMrJrRA
         6z8xp8N1Z77qVQXjHfBh7W1C/8pXNi06lFCPC0fzJld4Mms+oyMHFXo6T/fzVbKta+zW
         XNP7+UVKyXjq6CuMlWThGiU8N39Lsx1jjH67iEF8oBNODBSJioDz+8kgYpUZIv+OFxcd
         UZxuL1DTCeYTfkj3fudTBRk/AB4vaDhxJCzEvstCt9ZnvVXmxLQic9dy/4MtaNqxSaXG
         i7PaDQJczQfy5NZkB6jEiX5P+SRBDM2v21Xhm4xHrM6fWPBlzwE9QZv4HqRSo69N1jWg
         2FMw==
X-Gm-Message-State: AC+VfDwHebQB8hZsf7uRCu+ygtT+YV2Nqm2q1Mc/Z/ImGkuTIFl9jwbR
        8k55fvuglqC6Bg5EpulMA9i1z8lWkM1WLEiMz+gjXg==
X-Google-Smtp-Source: ACHHUZ4B5f1M+sCvV1r/JKCKg4wqK2GIXRKY8DLF7nDMlL59wkEK2UGwq1KEigLY8M1WXsEVAUtJ+zjYP4xY+/V/nWc=
X-Received: by 2002:a05:6512:b08:b0:4e8:3fc8:4f80 with SMTP id
 w8-20020a0565120b0800b004e83fc84f80mr177986lfu.4.1682505801347; Wed, 26 Apr
 2023 03:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000079eebe05fa2ea9ad@google.com> <CANiq72mor1BkxpAT=v0EsQJN-7fvMjo9K5ooVk1x7ZbBDEyn8g@mail.gmail.com>
 <CACT4Y+aMdct_tjSYsBvvtGoDji6feOiANogRbp3N41qkzU+5CQ@mail.gmail.com>
 <CANiq72nm2dU2o_x_GQ5SdsXaK6yZiDXG2hXEYMykViEAZvuMqQ@mail.gmail.com>
 <CACT4Y+YyYnwg4a1zjTnBU=t0x5Brt1rGuzz-5pXf2Fz3cKf4FQ@mail.gmail.com> <CANiq72=vMydenfkxQx4X7kYvHD0cHzNK19xxxqow3WcLStsdRA@mail.gmail.com>
In-Reply-To: <CANiq72=vMydenfkxQx4X7kYvHD0cHzNK19xxxqow3WcLStsdRA@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 26 Apr 2023 12:43:08 +0200
Message-ID: <CACT4Y+ZrwXB1W31Rr7rUUOoW15YbKfnC0khY9KnNk8FTf5uQnA@mail.gmail.com>
Subject: Re: [syzbot] upstream boot error: BUG: unable to handle kernel NULL
 pointer dereference in __dabt_svc
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     syzkaller@googlegroups.com, alex.gaynor@gmail.com,
        andriy.shevchenko@linux.intel.com, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, bpf@vger.kernel.org, gary@garyguo.net,
        linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk,
        ojeda@kernel.org, pmladek@suse.com, rostedt@goodmis.org,
        rust-for-linux@vger.kernel.org, senozhatsky@chromium.org,
        syzkaller-bugs@googlegroups.com, wedsonaf@gmail.com,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, 26 Apr 2023 at 12:30, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> > In which of the dozens of kernel testing systems? ;)
> > And also in heads of thousands of kernel developers and users?
> > All of them use get_maintainer.pl.
>
> I am aware, but `get_maintainer.pl` is fine as it is -- we still want
> to know about things that touch things that mention Rust in general,
> so that we can possibly be helpful to others, especially early on.
>
> However, if a bot is testing the kernel with Rust actually disabled at
> runtime, what I am saying is that the chance that it has something to
> do with Rust is quite low, especially if matched via `K:` rather than
> `F:`. Thus my request.
>
> Now, it could be nice to have some logic like that in
> `get_maintainer.pl` encoded for all bots to filter things out based on
> the kernel config and the type of match; but otherwise, yes, the bots
> would need to add the logic.
>
> Cc'ing Joe in case this is already possible in `get_maintainer.pl` or
> whether there could be a better approach.

I understand your intentions and they make sense.
But adding this logic to syzbot won't help thousands of users of
get_maintainer.pl and dozens of other testing systems. There also will
be a bit of get_maintainer.pl inside of syzbot code, so now all kernel
developers will need to be aware of it and also submit changes to
syzbot when they want to change maintainers logic.

I think this also equally applies to all other users of K:.
And a number of them had similar complaints re how K; works.

I am thinking if K: should actually apply just to patches and be
ignored for source files?
If there are files that belong to "rust" (or "bpf" or any other user
of K:), then I think these should be just listed explicitly in the
subsystem (that should be a limited set of files that can be
enumerated with wildcards).
It's also reasonable to apply K: to patches.
But if a random source file happened to mention "rust" somewhere once,
I am not sure you want to be CCed on all issues in that file.
Does it sound reasonable?
