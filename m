Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8836EC04A95
	for <rust-for-linux@archiver.kernel.org>; Wed, 28 Sep 2022 16:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233448AbiI1QrM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 28 Sep 2022 12:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232792AbiI1QrL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 28 Sep 2022 12:47:11 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD29F3C8DA
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Sep 2022 09:47:10 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id 64so2044912iov.13
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Sep 2022 09:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=DltQ5eatOm+FChxaVvTL/MxWRzNdi3qpUIf6fB8Edb4=;
        b=Vkvm2Ss5m7pNaP+7AA886OEwlo4fs59V2Fxh4f43DIyrvPPSgxs93u6rv9/i9e5vHE
         wVifTshVWNDaJeyyG7UNjrdY6c+APamn0VbKwJgT36602N1HEbr7IvkwkGzniMpbVDL8
         C0vhBa7yg5jH3Pj3EoSUgCDewdnvNnj7ltOI/hW5SJLNhxrBbqoqPi0R+baNIW36c50W
         BFGx2PHOoPtRlQiMWFhe6pWBi74TR4NvXtyJN2LFCOxoeUB5pEq4FI8yKKMl9Q7TsNUg
         p2bQrYmbSCh+t8RZWUs6zGnmqJSqVgVwclIy0nYI3BH1Lk40ZCWBOWWXblqsb54djwYy
         Lzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=DltQ5eatOm+FChxaVvTL/MxWRzNdi3qpUIf6fB8Edb4=;
        b=ykI5YqlrVkOevfuCiVeDUOjuHJOULLT3wqP5mnAWg/KtIEhWQO2Kk+/JKQApu0UwI+
         dsd6VL/8R7gMSfdt1w/S77RgX42R/shbTrfLxdE61mIizo/JmAoY5MnXBanGz1FksbJB
         vMdOotObZmIBnLJP2PBJn8lCKjY3tcSdSjo1C0158J6iTq/n3umz0fwpvB+mPH3bee7u
         WkHORxocNjS6gbZo76uLTIT2MS4NjippJMiTBYdVFQhFyMP9mAHYN+ElvQJWSPjfKcEE
         sN0etCx7pWWQv5VgJtE6blzBIr3JSXRl0rVnsm6AtvKbrP2467UxqGyFP1h3fUhed445
         P+tg==
X-Gm-Message-State: ACrzQf1/uMtxD/egz/00RGKK4ELFquMLvp/55hv6BD+2vNsQecoVyAKP
        ZE6TQzVFaGA+PwyEfY5xcAwFKUnsGwpAfu3vhPek816MxodnwQ==
X-Google-Smtp-Source: AMsMyM7QUtIeoYxG4PDjeAa1QhKI9Z6+Mc13WW7cjSFvMzyHMcjFbhYKXFQy7ud/6MOHo9oWmmEysLrJYjWPFzu1kRY=
X-Received: by 2002:a05:6602:2a45:b0:6a4:43dc:40ef with SMTP id
 k5-20020a0566022a4500b006a443dc40efmr10887228iov.64.1664383630298; Wed, 28
 Sep 2022 09:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220919.103820.680182888079022491.fujita@lima-default>
 <CAFRnB2U9EBdRLy0YCdQjCvgHra4T9bB+hrW==5iGWNhS-U7MUQ@mail.gmail.com>
 <20220928143120.iavijwru6r3qnhiy@gpm.stappers.nl> <CANiq72nAUKmcBWYqJ0WRHzJbad9L2RrOMP9DY9EYqDD8qSx0RQ@mail.gmail.com>
 <20220928163514.442xdz4eziuoz2fl@gpm.stappers.nl>
In-Reply-To: <20220928163514.442xdz4eziuoz2fl@gpm.stappers.nl>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 28 Sep 2022 18:46:59 +0200
Message-ID: <CANiq72kShUNkypRF9sH-EPeE7qV+dKkstNE8YVvVn_U-fKM2_A@mail.gmail.com>
Subject: Re: Rust e1000 driver (Intel Ethernet adapter)
To:     Geert Stappers <stappers@stappers.nl>
Cc:     Alex Gaynor <alex.gaynor@gmail.com>,
        FUJITA Tomonori <tomo@exabit.dev>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Sep 28, 2022 at 6:35 PM Geert Stappers <stappers@stappers.nl> wrote:
>
> My original question has been answered, thanks.

My pleasure!

> README.md at https://github.com/fujita/rust-e1000 hints,
> hints me, "this part should be inserted in another source tree".

I don't see the quote you mention, but from a quick look it seems he
decided to develop the driver side as an out-of-tree module, with the
abstractions in the Linux one.

While that requires to clone both repos, you don't need to move files
between them: compiling the out-of-tree module after the main repo
should work.

Tomonori can probably clarify more...

Cheers,
Miguel
