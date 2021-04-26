Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A47C433ED
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 19:10:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 486AA60E08
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 19:10:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235552AbhDZTLg (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 15:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbhDZTLf (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 15:11:35 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3846AC061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 12:10:52 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id b14so2225694qvf.9
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 12:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h8j6w13E/e3VNjN7xc7uj3URFzeBuUZv4204/WwPZ6k=;
        b=eAdRfRlwU2RVvI3oz3R3GOwBF2B6TEteklQhpTQc0oBwj82WEzDY+2gIg9a/KUwSdc
         plhqxPuGyKsp+UiY818VTPZn3TrwMqhh3yNckMEUMc/mMRGGmFE1hM/wNpuhQ+JGRCTT
         IBDMSciJyYWW9jtjNE3eUk6lX2HpnK4vDFldn/zmTQVg4wjold2vhU8oqY0+cs5R9jp7
         vyKZCymjFe2knsq8QUApfiJ5TAWLnAXXwC1zTpTuy3ZoGv8Kt5rZMd6/I9gloPSu5fpx
         OoyXGYWSCyI7Y1CKJm7GRKLb6kEHQbMuYe/RoHMeLmp0cs/hvcgXF5unyW1hcX4I1jQA
         HvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h8j6w13E/e3VNjN7xc7uj3URFzeBuUZv4204/WwPZ6k=;
        b=nLsRShm4IA+VhzoS4l/ogu9xqD7eLA5jB3AhH3oWHahVV+Wpfo96jeFgl/I9s+t9Wx
         Drhlkxt6CJUR6hc0fp4/+XX0GFRpjKJlUum07lPti+bA7zwdocHhNUuHBNI/KAIZ7uQG
         696vkx4Wf6k7VuHWeJakFJSnzIPW5Cke0Zi+By6zjduyVCQQybwvSD8mo7Fi7XVdUEdE
         aiz0qkhp6DSeEB1IZTtrGwtGUHyKDQNmBCXWQJbEiwoVO3G5Kc1T1hqKPaP//oLwhA3l
         VdLaCZ9ySrUUl0IP7n+889ib79GxdRbNCimle15yL2gm2HxY7BudE3125Mgkv9JwalSW
         NEdA==
X-Gm-Message-State: AOAM530p+TdsAeE0UNOR9riMz1J4DFcVNFe3YPrTyWomsA+pPed1UmFp
        LP1SHhxim5DpXAhoPb+sulxwMB3dR7+lW979gvM=
X-Google-Smtp-Source: ABdhPJzcdPi5K34d4BFebxtaS7hhtSF62jqdV5LNAqai6nE+9cYF8ZABIWtHykkuC5HMljIb5qy7QXtR2kywibEARRM=
X-Received: by 2002:a0c:fd41:: with SMTP id j1mr19524585qvs.29.1619464251416;
 Mon, 26 Apr 2021 12:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmvQ+U7LbwLRyY6FC70Y9-1Sdp8KdYRXryUvk9oTHvJSh29nQ@mail.gmail.com>
 <CANiq72knPX3GHHPPrZ=ErgX=1DttMXjOShcA1ZF4TENzNRaWzg@mail.gmail.com>
In-Reply-To: <CANiq72knPX3GHHPPrZ=ErgX=1DttMXjOShcA1ZF4TENzNRaWzg@mail.gmail.com>
From:   Hanqing Zhao <ouckarlzhao@gmail.com>
Date:   Mon, 26 Apr 2021 15:10:40 -0400
Message-ID: <CAKmvQ+UGiKVchv3DpR-QhyWqQ6-kx9HETNUcZqAv+An0ZgQwCg@mail.gmail.com>
Subject: Re: [Question] import third-party crates in kernel modules
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Miguel,

I am actually writing a new alloc crate for linux kernel.

I aim to implement it as a cross-platform crate, which can be
used both in kernel and userland.

In general,
I currently have
- a faster lazy_static crate: static_init (https://crates.io/crates/static_init)
- crates for writing cfg easier: cfg_if (https://crates.io/crates/cfg_if)
- rand for random number generation (https://crates.io/crates/rand)
- syn for my heuristic marcos

Because my crate supports userspace as well,
it has some userland dependencies like
libc, winapi, criterion, and bencher (for benchmarking),
even if they won't be compiled for supporting kernel
allocation.

Of course, I can somehow remove those dependencies by replicating
them in my crate though.

Furthermore, I currently have dynamically generated codes in build.rs,
according to cpu numbers, cpu features, etc.

I think it would be better if we can import 3rd-party crates while
developing and testing our own kernel modules,
i.e., we do not need to guarantee that the kernel module having
3rd-party dependencies can become an in-tree module,
but we can compile a .ko that has a 3rd-part dependency
during offline development and testing.

Best,
Hanqing Zhao
Georgia Tech

On Mon, Apr 26, 2021 at 2:32 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Hanqing,
>
> On Mon, Apr 26, 2021 at 7:01 PM Hanqing Zhao <ouckarlzhao@gmail.com> wrote:
> >
> > Is it possible to import third-party crates in the kernel modules?
> > (e.g., crates on crates.io)
> >
> > Any suggestions to import crates while writing kernel modules?  TIA.
>
> Which crates do you need? We may end up importing some things into the
> kernel (such as `alloc` and `syn`), but we do not plan to depend on
> crates.io (offline or otherwise).
>
> Cheers,
> Miguel
