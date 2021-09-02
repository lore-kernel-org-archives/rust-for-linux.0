Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CA6C432BE
	for <rust-for-linux@archiver.kernel.org>; Thu,  2 Sep 2021 05:51:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E8F1610C8
	for <rust-for-linux@archiver.kernel.org>; Thu,  2 Sep 2021 05:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbhIBFv6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 2 Sep 2021 01:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233259AbhIBFvy (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 2 Sep 2021 01:51:54 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115F0C061575
        for <rust-for-linux@vger.kernel.org>; Wed,  1 Sep 2021 22:50:56 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id q3so1015209iot.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Sep 2021 22:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HITq5PQ7ATpfzm4SIIxqKTm6Dzt1bA28FtqVWFMt7Rs=;
        b=nsm8t7S4UcV38xeeROEe3obAT48sJ/aCbtXg5DzBjd/MfmuB6/EVC6ZC5eTK7buy/c
         4LQEdG8C7S81Q0GHjvwSiWp98owOX1Tp1/1BD7C0Cd7ahMjszrivXqPUL/RnbwOPIEO5
         rWLmGNNl95uRwNq6ZbEsMbHySZ7CJXp4zOmcV1LX67KHt48GQremcy9UIKkWwzZuZAry
         NtWp3bGuW5SHRyxctGXE9i/FzW4K0wAMTslMK/P0Caf2+UX3YMPiR5C2i80wuRwZonB2
         AFqV1UM1vUzgahL1DbP0fbsgofNgRZhvVkECWA2Dy5Sr0Q7jf5NRfAYGTkDB4ehXJBke
         JVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HITq5PQ7ATpfzm4SIIxqKTm6Dzt1bA28FtqVWFMt7Rs=;
        b=ra1zeK492givt+22ReakWql0jD/+IRGN/hCI3HfKKrp9EfFJXmDXpnIawDQIEIXKik
         tQo0sM7ipUXpNmfekhqJ//jj/Zb20R1LxGBRqNcZonZACgXqm0d8Pzz9k9UqtQse6dqJ
         J2kvsa0zMRTae1xsloq833R64XHn+LdfqvlYDR7N2FAFPLjdhGxXJGoQP/ZIUh8eZEJT
         YU0q1Lh+5lqaYWILjuO3JukeqHYA37tC4yUTelP8STC62tyjaoke5hFT5lQg0nXHyqaC
         IGmVfSvpLslB27dVSXoiJu/SloBZpzVam5kcUIjEp56yYn1RapXcvpC9eAs56iUUNRgZ
         O47g==
X-Gm-Message-State: AOAM533OxgRyBaU6DzdPcwZGFt4oRU9lvZI9m2DHRXY363n/2I97hY74
        ZOv9azX7e3rGhH76tsnXguEwqRk+pPI/3aJMwRPw2pQA64MraA==
X-Google-Smtp-Source: ABdhPJykchqQN1gKE6h5zCxZesrki9rTCHhHmXJXstpMS/yYQM24SLHeY54RkV39gbkmElm+XTxEVUACYieOtgIbc1g=
X-Received: by 2002:a6b:8e87:: with SMTP id q129mr1417259iod.176.1630561855515;
 Wed, 01 Sep 2021 22:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210901230715.civmnrpmt3c2u72v@kashmir.localdomain>
In-Reply-To: <20210901230715.civmnrpmt3c2u72v@kashmir.localdomain>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 2 Sep 2021 07:50:44 +0200
Message-ID: <CANiq72nGvGL1qhr-BpEZ=kY_oW5ZDe_nUvuh8tWPKLNq-oVJQA@mail.gmail.com>
Subject: Re: How are rustc -Z flags enabled during build?
To:     Daniel Xu <dxu@dxuuu.xyz>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Daniel,

On Thu, Sep 2, 2021 at 1:11 AM Daniel Xu <dxu@dxuuu.xyz> wrote:
>
> When I try to run it outside of kbuild, I get:
>
>     error: the option `Z` is only accepted on the nightly compiler
>
> How does kbuild use the -Z features on a stable rustc?

As Gary points out, it is an environment variable being set in the
top-level `Makefile` nearby the other flags. I considered adding it to
the command-line instead so that copy-pasting the lines is easier,
even if it means being a bit more verbose.

In any case, note that it is an escape hatch intended to be internal
to the compiler (which explains the error message not mentioning it)
and thus should be avoided unless a project has very special
constraints.

Our goal is to drop its usage as soon as it is feasible, but it will
take a while. It is also why we only maintain support for a given
`rustc` version for the moment.

Cheers,
Miguel
