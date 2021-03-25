Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE367C433E1
	for <rust-for-linux@archiver.kernel.org>; Thu, 25 Mar 2021 08:17:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8564D61A1D
	for <rust-for-linux@archiver.kernel.org>; Thu, 25 Mar 2021 08:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCYIRP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 25 Mar 2021 04:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbhCYIQp (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 25 Mar 2021 04:16:45 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12653C06174A
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Mar 2021 01:16:45 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id x189so1409537ybg.5
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Mar 2021 01:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J5jcgx+sh6s0shL6nRaD/voqe2jSRkf/xRUikFSaQm4=;
        b=Ak6bXCXGfPSibQE9RAsYdnTBcA/iXbpVc9eNdov7A+eZOdFrUSdx1gyf9X+9/jMKLd
         Yqdbgn1pc8ZpJtu2Q6MInaGBrRI5wNk8gK+9MpRMw5ZroEXYCfTjt/vJUu4udi0siR3K
         P0zq2EGb3nN9Q4btivkxCz428Uy4NiBvStHpZougWreXi1muSb2fVMPXNlyGeXalJORg
         6RSdwPm2RBs6v8ez6rLezLxFZGIw6ME8NQWQw/yCP4+QZjray7mTSv1TPDDhuA6w4/DM
         ENjI0bW+QC5KfB0+dPmHulu01vD/zr4F4fjlC1ORZtoLQ7L+1Nig25HnBBaRqtssY6Mh
         zQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J5jcgx+sh6s0shL6nRaD/voqe2jSRkf/xRUikFSaQm4=;
        b=FdCttShhZcLsLSZ8G/hivFIXjXw8dUhZtzMI6hIQvJWJgFp3wxLkLKqrw4RlJt72cx
         xjo5ALSSXTrLQRX0Xsh/x0AlSafHtWLakYN2HWwFj0vBZGaA0B1EY+sQkK+y6DgBzHxo
         asyPTFSPHpimIBE8nk8vnIWV6WvWSxeTVeZKXcay9ZniQ8FEbeTV/cdtgC7Y7kZy8DgV
         x3IRSVVO6xrnl7OBG3KQh0T1D7XjOszy07JIJWdrgBq/214GwDiag7WsA1CgbhYEoMne
         tA3HDGciRnwSDm3zCxmOjhxOB2Jr6N9sBeiZJ1ZnpU8rR+hFlpelyNlkr2WCPBitKyAV
         nQGg==
X-Gm-Message-State: AOAM533A9AUoN6aa/R7Ciug4X6+W5HJLQxHG2mTsla4JEIBQGYf771O7
        zHYgc799OwHTf401dBAA0GSmId6GH92PxDsNyECQWmgd1Es=
X-Google-Smtp-Source: ABdhPJx25Z3Lwb9gnBRPj6VpIq+T3Hay6DPTQAN9Q2q+z0I12dYvgi9p/Isj4T8P7DDk96Es/0iWAtZetQZLbfwuwH8=
X-Received: by 2002:a25:7909:: with SMTP id u9mr10488571ybc.22.1616660204417;
 Thu, 25 Mar 2021 01:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72nCOKy_rUmxpqt=s4PX3veentT-jz38c7Yti0tr2X3FSg@mail.gmail.com>
 <CANiq72mJMCgZxKyRDyQnkKi5U=6ejZq5yFRx-UyLC3yy7mYR2Q@mail.gmail.com> <20210324211237.zsdycx3ikq2siweh@gpm.stappers.nl>
In-Reply-To: <20210324211237.zsdycx3ikq2siweh@gpm.stappers.nl>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 25 Mar 2021 09:16:33 +0100
Message-ID: <CANiq72nx1f9hPwFCLXekHDu-0=8X7srJuocryZoYEMsL9o4iPA@mail.gmail.com>
Subject: Re: [Rust for Linux] Call Sunday 2021-03-28 18:00 UTC
To:     Geert Stappers <stappers@stappers.nl>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Mar 24, 2021 at 10:12 PM Geert Stappers <stappers@stappers.nl> wrote:
>
> Okay.
>
> Where?

We use Google Meet -- I will share the link privately.

Cheers,
Miguel
