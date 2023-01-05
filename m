Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65ECC3DA7A
	for <rust-for-linux@archiver.kernel.org>; Thu,  5 Jan 2023 23:02:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232155AbjAEXBq (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 5 Jan 2023 18:01:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236200AbjAEXBg (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 5 Jan 2023 18:01:36 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC0967197
        for <rust-for-linux@vger.kernel.org>; Thu,  5 Jan 2023 15:01:35 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-482363a1232so315667b3.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Jan 2023 15:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9RJu2rE7KtB/Vhd2MsHHdaXdqVame+01M3uBY4jJPjo=;
        b=gC7hewJY7dCbdZswYEm+nuBhFJ6bTgx8h487SdLZ4HRelF0vdpthpp+Q4/GP7YocRY
         0eKCh/VRyBCrsWBU9J+0tTUfISQg/Dsu+hieka4XYFg9DGk2AvdALl5inYDa5tyQrcpN
         shzpgImkUHB875dovaWfELz2sNDkY7LnA9nvJvYczPJRpJlo2jro659e6D9mWeyR+MQJ
         DuYBv6E/G/WUgEtpV/+ihof/jxWtx0ML2jQKNgmaHrcDFhf7g1gBY5qNrVsJQBTEApvB
         7wIhPEs5n9bhUYQHhfqQ5K5gHlaxN53gVdUg5LREmZZ7eigydmuH73sMyhzKC/tIFqAa
         /Zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RJu2rE7KtB/Vhd2MsHHdaXdqVame+01M3uBY4jJPjo=;
        b=oBT5CzlWfQK3qSs/O8LQBYCsMvPhHZEhRSF7az+d6EhM0NIs6SIL8R4BcPdakJemM+
         tGtjHHbH6xDz7DMJTgYfyergpLSxDWZCmALwXs/iGXex4lwbHFtLzTfY41ezaPBciKXM
         8bqTN7F+RcnMHx+6F9+94dAIx5IjBA9DZz3m/8oGLpH+xzKDQslP3R5bCvSo5gxe/5ks
         M5AM3K/R+a7yhp2ZDXzZLn/W/Ziesbi8aFNC4Gb8SI4IIfFQQVDrNiKMcL9oTWviSUX9
         FWnYZLjXHxeDr25MTvgjUAuMeo5iRMaMZbPtIykRGsTHOl3Xwq0Jn1JzdwXYuX4AXhKx
         69/A==
X-Gm-Message-State: AFqh2kpwmXvOOf6p0dqKeTGzSeTXGLz67q98ZI+4cVgIOUEkZdHQJhqv
        bNzSZq2pLH5Oc/yuQ+GbirIQjrunU0FdH8ZV/aKZLKdM5MzrBJdP
X-Google-Smtp-Source: AMrXdXu3Srm2wr49QvqpgfRscxk6LN4A1xvf22C5gMbOjv3kWOjGMDhfnj6l4JDI4qOuDajdBqaafGeEWm5CoaFbSv4=
X-Received: by 2002:a0d:ea54:0:b0:483:813:c70f with SMTP id
 t81-20020a0dea54000000b004830813c70fmr4374467ywe.266.1672959694238; Thu, 05
 Jan 2023 15:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20230104160405.5530-1-apantykhin@gmail.com> <CANiq72=mgZCC7ECEO=bqLQ2rJKQjqS7Sg7CW51_mpX4VcG7o6A@mail.gmail.com>
 <CAPi66w-2aV8CQs6xGSR4xZn4+39HdUqvwTZEidYKqUR-11thDA@mail.gmail.com>
In-Reply-To: <CAPi66w-2aV8CQs6xGSR4xZn4+39HdUqvwTZEidYKqUR-11thDA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 6 Jan 2023 00:01:23 +0100
Message-ID: <CANiq72nUdX2vziY036OfNEzGi3W+q9D+yyBpm81-0sNjNg-gqw@mail.gmail.com>
Subject: Re: [PATCH] scripts: avoid redundant re-reading makefiles.
To:     Alexander Pantyukhin <apantykhin@gmail.com>
Cc:     ojeda@kernel.org, rust-for-linux@vger.kernel.org,
        akpm@linux-foundation.org, Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Jan 5, 2023 at 8:51 PM Alexander Pantyukhin
<apantykhin@gmail.com> wrote:
>
> I checked files now. It seems only one place in /samples  has 2 files
> with 1 makefile in the parent folder. So it looks like the patch is
> untimely for now.

Yeah, though you could do a benchmark with more files to account for
the future :)

> I see, thanks. Still have a question about using "with". Is it reasonable?

It is definitely reasonable and you cannot go wrong with `with`. I am
not sure if matters much in this case (short-lived script, read-only,
not a huge amount of files...), and with CPython the objects are
destroyed immediately anyway I believe.

Cheers,
Miguel
