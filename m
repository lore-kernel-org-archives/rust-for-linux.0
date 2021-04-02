Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046CAC433B4
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Apr 2021 00:35:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC943601FC
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Apr 2021 00:35:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233637AbhDBAfO (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 1 Apr 2021 20:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbhDBAfO (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 1 Apr 2021 20:35:14 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8432CC0613E6
        for <rust-for-linux@vger.kernel.org>; Thu,  1 Apr 2021 17:35:11 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id q10so2640556pgj.2
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Apr 2021 17:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n0sC7yCTTp0Ww5iTYjobTm4iNRYJrU7x5JUaXU9L4rs=;
        b=ikZjty9LYUZE4Zv5OhDMP3H0z+VT0Im6k6Vxo5XpUWb32SY2fXhGJrj39PReR3e40E
         C8v8e9m4EnQvQCHges2l8zHXJq3xvFUYyFy7j0XBFazuYB8UkeSuJqxCTHU8QavePveI
         5rizZS9ESIBRAiZ1JQV0Jey69GW7sJ7ujUl2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n0sC7yCTTp0Ww5iTYjobTm4iNRYJrU7x5JUaXU9L4rs=;
        b=s7NDZbpXpy79QW87RiTrRxqUOT7PkF9EGTX32kko+nyVCrGRCoUqIgjYpCOd1Frs0M
         WBDvVabObO0vNi0vOGUHGLaAMgInDyUSxTLTZMtJjyxKoN16wq4IRDP1UghEyqakqiAM
         7fU4/GH79xanmD7FMzVHQkX3uF6VsnUsu3JU/3qpgVutuBBtUOgmYttjXGVE/dKRqZKI
         lnHiwRZuIXjIEZOkc9eCA5X57xk/ZnvFY4exnOdCsENiXOu37R+0SyB6HJH+RZ905gAd
         v6c65JfqDBbLC9Yg5Fx2Az3bibgTcquypMi9hr5kyE930QivPOv/X+vvBdOAHhSWS2x8
         zQoQ==
X-Gm-Message-State: AOAM5335k2720T9AAEsGym+W5RKfrW+u1rYO3m0RifPCnfBF3fWJqdrT
        m0eqliK4zMLBEdsIefHoK2S9mHSGdeC5erLS
X-Google-Smtp-Source: ABdhPJwPcE9KoYV/x6LEy0r7cYG9kGfuV1ennm6y8UsQ5GYWa580+48rPGyUM33FpqfznuKl9zCQqg==
X-Received: by 2002:aa7:96f0:0:b029:1f3:97a4:19d2 with SMTP id i16-20020aa796f00000b02901f397a419d2mr9677200pfq.73.1617323711085;
        Thu, 01 Apr 2021 17:35:11 -0700 (PDT)
Received: from nitro-5 ([103.44.55.83])
        by smtp.gmail.com with ESMTPSA id mu6sm6041650pjb.35.2021.04.01.17.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 17:35:10 -0700 (PDT)
Date:   Fri, 2 Apr 2021 06:05:03 +0530
From:   Manas <manas18244@iiitd.ac.in>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: Missing RUST_EXAMPLE option in linux-next-20210331
Message-ID: <20210402003503.exbxsfickscdvmci@nitro-5>
References: <20210401061840.g2zzox7xy5qol7kq@nitro-5>
 <CANiq72kjwKuRCzeB54JPpCfBO7hfzZKAoAHBtbSBAzfvZY8d0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kjwKuRCzeB54JPpCfBO7hfzZKAoAHBtbSBAzfvZY8d0A@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Apr 01, 2021 at 05:07:06PM +0200, Miguel Ojeda wrote:
> Hi Manas,
> 
> On Thu, Apr 1, 2021 at 8:19 AM Manas <manas18244@iiitd.ac.in> wrote:
> >
> > I am working on a device driver in rust in linux-next as an academic
> > project. I used the following command to create .config:
> >
> > $ make LLVM=1 menuconfig
> >
> > But, sometimes the RUST_EXAMPLE option is not visible in menuconfig
> > (under /Device Drivers/Character devices/). It seemingly happens at
> > random that this option disappears, despite having a working rust
> > nightly environment (and other dependencies).
> >
> > My rust nightly version is 2021-02-20-x86_64-unknown-linux-gnu, with
> > rustc 1.52.0-nightly.
> >
> > Can someone point me to why is this happening?
> 
> Rust support in the kernel (`RUST`) defaults to off at the moment, so
> if created a new configuration from scratch, it is likely that it
> ended up disabled, which in turn makes everything that depends on Rust
> disappear, including `RUST_EXAMPLE`.
> 
> Please check in `General setup` --> `Rust support` if it is enabled.
It was also not present.

Nevertheless, I tweaked around a little bit and found that when I enabled
CONFIG_COMPILE_TEST, then it removed CONFIG_RUST and RUST_EXAMPLE,
(while HAS_RUST=y).

But CONFIG_COMPILE_TEST's documentation mentions to enable it to build
everything. This confused me at that moment.

-- 
Manas
CSAM Undergraduate | 2022
IIIT-Delhi, India
