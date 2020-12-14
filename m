Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F83EC4361B
	for <rust-for-linux@archiver.kernel.org>; Mon, 14 Dec 2020 02:03:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6190207A0
	for <rust-for-linux@archiver.kernel.org>; Mon, 14 Dec 2020 02:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437856AbgLNCDn (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 13 Dec 2020 21:03:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731358AbgLNCDn (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 13 Dec 2020 21:03:43 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1C3C0613CF
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Dec 2020 18:03:02 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id m25so26204324lfc.11
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Dec 2020 18:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OVR6PV82lTWskK031p13/wuUNabzMYSl+Dvulqhf+8U=;
        b=PSpvPQ3PmRmG9cq/+VLb51X/NcMvBMnGamrIpp5sZcwW/Q5B7dqpMIC/aBKRltqKy2
         n+3NAn5Jiy4+s9mxYVoo1Vhemze4T2tdiLaX6W4JfUU7HkB5aZfMvaT19iBpWQWbUynH
         Xn2gdPUACbON9lx2wIlsGsGn9huDe87M3D+2LkJtv/bIg37yo2ZYkPGNZopSZAGhewAD
         ksubpBfsWxMPzEErU/QXyusgDqG6Oqvi7gLRBtT4lmpz+tjT9b8uwQH9TV+JRC5SF8lV
         rAkovAjcYvYOhtkoz/fM+ZE1zdzOaUah1pJZH09pPPhXpNEqs3/B0IoNBtTPo/FU0HjN
         D4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OVR6PV82lTWskK031p13/wuUNabzMYSl+Dvulqhf+8U=;
        b=LlFuyOlTCER+oort3o3xyhLGarkiAf5tLdnFr6fo4AM78UImmdYaB3vbVgZZHt6AkS
         Em3ZOfy0qyGnr2jH2ncB6Sl+WbNNpnfmRjd87ZMzld2tJFUChYsSC7dF+eTpp4VrkiIJ
         yMZltZzCVjCZzk9b1pwX6KXJgvjd60M92aEnj6cakZjOtWkSpniQG8JGjMkTc5gbesHp
         LZBiRg8tF7eZHKr+xTghy7eC+8VkInBD3RLlzFG4UFHYcZLAY5QaZaZmuM1h3MaaYtwP
         1f5cNHi+0yUs4v4JI2ulwXTRz35JL8TslYSwHYg5Y3PVzbVqugcD8CEdGawyRGislZoF
         2jTQ==
X-Gm-Message-State: AOAM530QuhSElJkhj5VO/5kcGkNFeLKE2wR72Rmm7yYasrgMv92qynEa
        9aS+GT7hNIF5GXyDbQE2HdlpYxKrMRgYopTaeg978d54x+rv27k=
X-Google-Smtp-Source: ABdhPJz5yhI1akIdMjHoJConZm+YYU97h4UIQWMaw8TzEoosH2xzwMdzJnEbx/BVk4pmvCbrnqhj0FaKZAp89qGCZeE=
X-Received: by 2002:a2e:8118:: with SMTP id d24mr9401418ljg.105.1607911380955;
 Sun, 13 Dec 2020 18:03:00 -0800 (PST)
MIME-Version: 1.0
References: <CAMKQLNLp+XfVcQf_+8OHJO=faTkwfdiFYR2s72LoAryHxFBJFA@mail.gmail.com>
 <CANiq72maQNCGT=ff9BrsqY81mXjzeYpKxDy9rZL36cmgfCZt-w@mail.gmail.com>
 <CAMKQLN++0y2fVHNJhthemZ4BhQCAqXyFygj-jACZQnqfFBmkbg@mail.gmail.com>
 <CANiq72m17CZswGE5-kKgA07W3Owq3-dtdbPTYvtxmMHzfqPGig@mail.gmail.com>
 <CAMKQLNKEP8PHptz=Zw392XV-Q+-DsvhkpCvnbhFaBfTAM-oqEw@mail.gmail.com> <CANiq72nqTv=py=rXaJM7=YfC0EZozqqjZpp3HYCjw7EfhhRreQ@mail.gmail.com>
In-Reply-To: <CANiq72nqTv=py=rXaJM7=YfC0EZozqqjZpp3HYCjw7EfhhRreQ@mail.gmail.com>
From:   Wedson Almeida Filho <wedsonaf@google.com>
Date:   Mon, 14 Dec 2020 02:02:50 +0000
Message-ID: <CAMKQLNJBdaT_UrJCEAB3OP8usOz+F2QgEyFdtoFWP2-f3OTeQw@mail.gmail.com>
Subject: Re: File operations
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, 13 Dec 2020 at 03:33, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:

> For instance, could the user define a type with only the methods they
> need and then construct the `file_operations` struct (perhaps
> abstracted the builder pattern)? The codegen/performance should be OK,
> since all the values would be known. The downside is that you need to
> actually repeat your functions in the builder, but the positive side
> is that the code is way more straightforward, no macros, etc.

Hmm, I hadn't thought of using the builder pattern. I need to think
about it some more.

But one potential issue that comes immediately to mind is that with a
builder pattern, the value is created at run time. In our case, this
is undesirable because this table contains function pointers: if we
leave them in writable memory, they will become easy targets when
attackers have write-vulnerabilities that they want to elevate to
arbitrary execution; leaving the vtable in rdata (i.e., in read-only
pages) is much preferable. This means that we need const functions,
but we cannot have them in traits.

If we are ok with repeating function names, I have a solution with a
much simpler macro. Of course, it is simple enough that clients can
just ignore it and define the const themselves if they want to avoid
macros at all costs. What do you think of
https://github.com/Rust-for-Linux/linux/commit/13b2f2c47e62ad5bf824f7e15e14090c90a4ba9e
?

Cheers,
-Wedson
