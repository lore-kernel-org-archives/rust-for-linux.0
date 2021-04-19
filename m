Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379CCC433ED
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 18:15:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CAF86127C
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 18:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240776AbhDSSQK (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Apr 2021 14:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234035AbhDSSQI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Apr 2021 14:16:08 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01610C06174A
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 11:15:38 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u20so40451538lja.13
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 11:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7TPfSBY1IqJQ9EFS8nI20wBKw9rf6fqH36UmYrwgEyo=;
        b=Fy3+wcWpqKJ2UItMr9J404/jQIMIk0Z14aHdhmqk98rjZdWNWCqDl1pvXA3VmHuIoK
         M6cT0H/E8uzlDoyT5R8Uc2MGdF/joPOF29zYz3u5l/jumI+O6OzdDOGp8qfZMu8bUP/X
         r3IdE08WM40RxT1eNqm2hdQ69i6Mg2PVTh2w0zGbuyPa1+UWSNZcSAykewVleAeGbQOE
         Y4TSCkYm7DQHgf6ERoLCVwzPRYp2mhn0FwOPrNql7DolGBfj1Y6EqnGh6AsQK/5/bm26
         xppu+SoyTF7tlYjBBGUSv+R+Y7VtD+DQEI8UlrrV7Uk4cRV5KqaJnE4i3EQk4ghie3Zp
         VozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7TPfSBY1IqJQ9EFS8nI20wBKw9rf6fqH36UmYrwgEyo=;
        b=dA+MZVUyxKZtZMOt1YNuEAzU/ZGK2v6qxvwNCBkhvZmk0wa3/Lb6SHAzA+/iNVN0EK
         G7W32Z3AdWhUJDC24oi2OTLCo53b51vdzr73W8JScIN1CcK5D89AHDE+fk+9VQih0fsy
         jToeHx5nJ8ZAZk5FbI2Io3dNOHYV557whUD2JfAka+y1E0p77zghXDgHjSUh/k4z9VyE
         arf37fhEdIPrCpGq3ohaB6a9L44mj3UAIpDC2UAeMAIi6FgUMLAUuC/Qt08LLgubdl5Q
         rZSobxpfrYnwRsRa2VSQ3z4uFSvZkHmU8VDi6YAZKYZH+jcHjmnsC5C07PeF2NMQlNnq
         dybw==
X-Gm-Message-State: AOAM531HxUAxTKxBllPE9g9BBhYv8eu18Qt+t5M5QjxFDooBNAey3TYr
        PmiXVBTkj52J6g9bvkF/JnXUp/pzyqRitvbgPb7z8JhubBrf9A==
X-Google-Smtp-Source: ABdhPJylYpntHL9ikUm/tRoYAqih7H8JghwAAmF/HpTUDkb1BhFgtsjDy7aYYfd7UkmZehn/PCNuKShiGVylEEoNkzE=
X-Received: by 2002:a2e:9cc1:: with SMTP id g1mr10668758ljj.0.1618856136337;
 Mon, 19 Apr 2021 11:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
In-Reply-To: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 19 Apr 2021 11:15:23 -0700
Message-ID: <CAKwvOdmpnpmP-DZ3xysraLUztmym3EhGJYwc6dWuwpbzLgaSPg@mail.gmail.com>
Subject: Re: Poll for call
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 19, 2021 at 9:16 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi all,
>
> Now that some days have passed since the RFC, let's have one of our calls.
>
> I propose next weekend Saturday 24th or Sunday 25th at 18:00 UTC like
> as usual (EU evening / US afternoon). Please let me know which day you
> prefer, if any.
>
> As usual, anybody is welcome to join. The meetings take place on
> Google Meet. The invitation link will be sent later on to those
> interested.

SGTM; either work for me.

-- 
Thanks,
~Nick Desaulniers
