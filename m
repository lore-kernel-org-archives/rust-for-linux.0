Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F260C433B4
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 20:41:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 325DD613B0
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 20:41:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234474AbhDZUl7 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 16:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233971AbhDZUl6 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 16:41:58 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A416CC061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 13:41:16 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id g1so986048qtq.6
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 13:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u4P5lNHE6uj5a0GIYMuxNlaSo3n64vLDbAm0SJE+BX8=;
        b=GcTpoaFAKD2OtFxJMkNfTCZ0gyYM9Wy7vgWBNENlsd4bhdZRmF/VQs4eo7GrCcUFFG
         fONeqKj6zOgYPEbvaql+TIeC0BbYH7Eq1afgeSdwO0ASL18sWDlo4Xfv31IBRZu1hjR6
         X0iRAbI6h2wAuJ9oWkKZkS7x3mUhwnCRjNkC+BydtwzRfd55WyE8x1HDdGyXRu09Uy/3
         GsQUaCLexz69AzhhotaF8sHHXG6RNZu2lMHYHqxHV1EM0KRsBUhXFoA7bi0a5Hu87GuC
         6bZn2DMu5ddrphnztkYvJCGkeir2HgwT7kLyeAIYe5b9HxdrjniOSyLwre/bYtZzrka7
         3Zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u4P5lNHE6uj5a0GIYMuxNlaSo3n64vLDbAm0SJE+BX8=;
        b=EnToRy9m+Vcy/6MxBsbKhdjsr5VImJHCNjkOKLjNBCtaonr/r98EyhBLOiG9HZrSiC
         BqECfCSvUAQpkNPy3vpB76Ga4g1wbTHrxpY29aJwCai/EGlXGy5rRvzKlnZYmWLUI1R/
         Q4qI3bvqjw6zUY69Rs8bvdW+LunXxg1SZprk2bS2Z477BIZo6D2FY62+iT9SRcsLlURH
         xSDSG/8L8j9fT2cbuCsAQsf5ewD/tzFH1pnYue+pbQOvsqXDyYJSPD3q0sgLdr/vCGvQ
         2t9vMcnAT0EummMdmDfaN6HoMnxUm+9i91vwUJIXht1MuZHFYoRxpjFwAeKtpEZpV7Ed
         maOw==
X-Gm-Message-State: AOAM532P/xjEL+1TZ7VWL0SiMToKHCFnEhDQPg+eN/NleMLNMfUyeARb
        brlEnafz/9ftIO4FkGJap5VCIcnSFMFwtHv4t8A=
X-Google-Smtp-Source: ABdhPJymf9ho9u3SfcWvy8lPuzjAa+GcYgHY/sHgVRa1xHtUZzDOUz6B244g0QKHYp2DLv7IUC3BSXzfkSboxZdnlkI=
X-Received: by 2002:ac8:5bc4:: with SMTP id b4mr19095467qtb.322.1619469675741;
 Mon, 26 Apr 2021 13:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmvQ+U7LbwLRyY6FC70Y9-1Sdp8KdYRXryUvk9oTHvJSh29nQ@mail.gmail.com>
 <CANiq72knPX3GHHPPrZ=ErgX=1DttMXjOShcA1ZF4TENzNRaWzg@mail.gmail.com>
 <CAKmvQ+UGiKVchv3DpR-QhyWqQ6-kx9HETNUcZqAv+An0ZgQwCg@mail.gmail.com> <CANiq72=oSMO1yGKFdOfVSZbLcsTVeJCXmbD_RdpnOqqKw4p55A@mail.gmail.com>
In-Reply-To: <CANiq72=oSMO1yGKFdOfVSZbLcsTVeJCXmbD_RdpnOqqKw4p55A@mail.gmail.com>
From:   Hanqing Zhao <ouckarlzhao@gmail.com>
Date:   Mon, 26 Apr 2021 16:41:04 -0400
Message-ID: <CAKmvQ+WH_PVy-XS+Rpa+_8Z9AjNDVwkTQFMZZtAZc7G9-7tJoA@mail.gmail.com>
Subject: Re: [Question] import third-party crates in kernel modules
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Sounds good.

I'll manually replicate them tentatively.

After I finish the linux kernel integration, I'll show my
demonstration to the rust-linux community.

Best,
Hanqing Zhao
Georgia Tech

On Mon, Apr 26, 2021 at 4:20 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Apr 26, 2021 at 9:10 PM Hanqing Zhao <ouckarlzhao@gmail.com> wrote:
> >
> > I am actually writing a new alloc crate for linux kernel.
>
> Please note that we are still evaluating how to approach this. The
> best way to get involved with high-level design is to join the
> meetings.
>
> > I think it would be better if we can import 3rd-party crates while
> > developing and testing our own kernel modules,
> > i.e., we do not need to guarantee that the kernel module having
> > 3rd-party dependencies can become an in-tree module,
> > but we can compile a .ko that has a 3rd-part dependency
> > during offline development and testing.
>
> We need whatever infrastructure is required to be available for
> in-tree modules too (and we need to focus on those first). A lot of
> things are missing, indeed, but we will get there!
>
> Meanwhile, perhaps you can manually import them as a workaround -- I
> understand that missing functionality can be a bit painful.
>
> Cheers,
> Miguel
