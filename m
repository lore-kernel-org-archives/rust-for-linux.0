Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4ABFC433DB
	for <rust-for-linux@archiver.kernel.org>; Thu,  4 Mar 2021 17:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 688F564F4C
	for <rust-for-linux@archiver.kernel.org>; Thu,  4 Mar 2021 17:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbhCDRmp (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 4 Mar 2021 12:42:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbhCDRmS (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 4 Mar 2021 12:42:18 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524A3C061574
        for <rust-for-linux@vger.kernel.org>; Thu,  4 Mar 2021 09:41:37 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id p15so25465867ljc.13
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Mar 2021 09:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IJXbVty39UBuqeLjCbwL5FzXkfWTn50NqJS1lT8S6DM=;
        b=PzoWUhqMOB+G2PPPTcWqHAd6EzaA1fSw+m41Pif1SLVly57yFuWvtku+rhE89AV9t/
         gB+QRPzSTmkoScGG+3DqCMCtnWd32KzNJ8Y4JUmS1JQCAhyYuV05oQfj8W2Tp48IoqmV
         0m1SIm4RlseEbtDrcy9PNizhFrN+5fZYiGUeHKRE7kR6P9OBU00LJrx2uZwJgf+KqxjN
         G9I0+nMIQW9WSClpI8D3GMRVilz1N9/rIAy74aoD2tolBgqORJEoJ/qqWysUcvSIxdTn
         540YWohkR6Qngu9AGOZz2Xo/0lA8Ix6Xe9I7asD/IuOAzqN0Igw8RpG1kVfAguAfnG5o
         Ig6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IJXbVty39UBuqeLjCbwL5FzXkfWTn50NqJS1lT8S6DM=;
        b=Po89x0z9puOAQ32BzaeCfmY0XXMeHewKbS/tLXcEDJKYwGV0Ok9Y+BWGeF05hCY9VH
         Uz4NOTfjp4HubYTZg+OdA0Uv65GDxcqqQpKQDNMh8wPmKg8bTFgZEukTcWAl0PNygPIq
         2xTN/+6Xrp2yOeJBSvwDAdCj99cC2dWl6gE4YmB9M6OWLqvTRoqiNg98Euh6pAK06BUj
         IKrXUggppnvwtvwQ9MYCiHKSA77cMCjp1EkEOPwtYqVKv9MsbreR//4FCo/5eiRFPVtf
         Q9r1Rz3js/mJmnQcrYr/B0mQXCET/9jPm3PXmFBlriSePvqMyYjPFgaAJbQ6spq7UOfv
         DvGQ==
X-Gm-Message-State: AOAM530PNsVp2Thc5tBINuDzFobwQo3OsJk1aOnBV8k24LiP0jF3skIO
        aJY/tke+EF2d1yVlYmfaVXR2kBK32F6plFnucqutI4KAbsw=
X-Google-Smtp-Source: ABdhPJxUCpJlZ6rZCck250pe6qJ0kqAaZVKPBDQlfGuBLDJ2oAmCaADinuF6DfKYWtlqs3CFBvW8A89CH4JAAl9GpNI=
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr2787705ljp.495.1614879695661;
 Thu, 04 Mar 2021 09:41:35 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72njjy7sJ=_mgjKNzaHcwRgoWkQmgSN2Fq6gdCYoeD1WZg@mail.gmail.com>
In-Reply-To: <CANiq72njjy7sJ=_mgjKNzaHcwRgoWkQmgSN2Fq6gdCYoeD1WZg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 4 Mar 2021 09:41:24 -0800
Message-ID: <CAKwvOd=1a9er4qvYp1NaYWLPwTzNbo68Xc1+hQcv-qb-iuSjMQ@mail.gmail.com>
Subject: Re: [Rust for Linux] Poll for call
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Either work for me! EOM

On Wed, Mar 3, 2021 at 6:54 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi all,
>
> It has been about 2 months since the last call. We have a few bits to
> discuss regarding upstreaming, so I think it is a good time to have
> another informal call.
>
> Like last time, you are welcome to join even if you have been busy
> lately but still want to follow development. So don't worry about
> getting up to speed -- I'll give a quick briefing if needed.
>
> I propose next weekend Saturday 6th or Sunday 7th at 18:00 UTC like
> last time (EU evening / US afternoon).
>
> Please let me know which day you prefer, if any, and feel free to
> Cc/invite whoever you want!
>
> Cheers,
> Miguel



-- 
Thanks,
~Nick Desaulniers
