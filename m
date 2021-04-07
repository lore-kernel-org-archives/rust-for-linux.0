Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22603C433ED
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Apr 2021 21:51:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E91206108B
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Apr 2021 21:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhDGVvR (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 7 Apr 2021 17:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhDGVvR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 7 Apr 2021 17:51:17 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5157C061760
        for <rust-for-linux@vger.kernel.org>; Wed,  7 Apr 2021 14:51:05 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id l9so409935ybm.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Apr 2021 14:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vTevl9lwQ71pDAIXJa66WcV6EbBfX2bliWo1D+iJ3GE=;
        b=WrswyQCUAcsFA08tBY4RdDX4Vm768s+W0U6H2oH20tG0ZVhmUJf1Zl5ngzJ0fCSqbf
         c9uXS3zqnw0V47yX9sY9vHRrIdaJcvb2r0+KiUJAVwOzwtmX4oCdi7QMs8e3Aix6SDLC
         EhxqsBagUt/mjNcwc8Mqo0IGwpQqrsBXgbuft774QUGWgvz+poB8smVti26rPBCeqwTn
         5YbYMms9oKGjb6OzLOLzAL7S5Y+//6ekR5rb+MMvqsTPcs+/dYcx6EKwCzC8umSXQeie
         RHiwSZ+pXN/E2vrTVnauajzP71qVDkbb6fcGwnp9BeHkEr179di/oWDo4QjOwWNnWE77
         B33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vTevl9lwQ71pDAIXJa66WcV6EbBfX2bliWo1D+iJ3GE=;
        b=JVVKvEU1dFTcA7XVH7+9SzPSsDCXqZiG2Jq/JocMfo7NbmYCAtp4gqMQWgzDa92h5V
         +JWTEV6vK4z2eai3Yq8lLaICcH7WtS3t6GbR6noMSNY1EC+MFfoYeInEAyNTGBGSRkA9
         VPnSXFkKNGh7dha98lPNa26pGLT1K5eVRAMX2CQDuGBfn1kkQiWqW2ax63bSfdGBtZKa
         kuzYjrNjqbvaZwcuVg5j3iQaMfGk509aYWILzmDZ7z7xNf72SlIttDwz1eigjmvUuJKe
         CNBb2heC9zazLfxdsa9F1mNfuc4IIK2YYuk444I6KDvPcU5XFhnFn3zX/7AayYHqjV3k
         9RvA==
X-Gm-Message-State: AOAM532NfitSImsfwKocOd77lJCjTkF1GeBBIq1vPUnzbKlznNDhP5rS
        c/8KpJ2RRDMhhZqIcXiiJGTHghvA7kknTle5e71HrX6fxKQkzQ==
X-Google-Smtp-Source: ABdhPJzFlh/CPQL1+Ae+mwmQmyoPSmg/pl3DqkMF+/7wR+KJvl1s41bdFYxv+Bc0kFjbqvAmDHbEL+OtHlhZvlmVF7E=
X-Received: by 2002:a25:d07:: with SMTP id 7mr7323221ybn.135.1617832265307;
 Wed, 07 Apr 2021 14:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <1802230489.25122.1617805363569@ichabod.co-bxl>
In-Reply-To: <1802230489.25122.1617805363569@ichabod.co-bxl>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 7 Apr 2021 23:50:54 +0200
Message-ID: <CANiq72nWvusyKf_N2N8i+de5HA-UZYfFPUrp9taRFbXya5h18w@mail.gmail.com>
Subject: Re: leaky info and kernel modules
To:     se iro <seiro22@mailfence.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Se Iro,

On Wed, Apr 7, 2021 at 11:03 PM se iro <seiro22@mailfence.com> wrote:
>
> saw post on reddit and github issues where rust compiler adds username an=
d systems paths/info to **release** mode compile bins. also its pkg mgr car=
go does the same with registry paths. otherwise its extra strings bloating =
output that not needed and strip command doesnt work. also not working is c=
ompiler opts described
>
> does this impact chat of rust in linux since rust team seems to be ignori=
ng the issue?

Yeah, Rust is adding few strings with paths (at least ~4 KiB from a
quick test in my case); while a non-Rust kernel, in-tree build without
`DEBUG_KERNEL` does not seem to contain any absolute paths (although
please note that kernels typically contain your username/host anyway
unless you tweak `KBUILD_BUILD_*` etc.).

So while I don't think it is that critical at the moment, any bloat
that can be reduced (e.g. those paths could be relative) is always a
good idea. It is also good for improving reproducibility of builds
etc.

I will create a quick issue about this.

Thanks!

Cheers,
Miguel
