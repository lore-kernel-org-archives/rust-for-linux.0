Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF57DC433F5
	for <rust-for-linux@archiver.kernel.org>; Tue, 26 Oct 2021 02:47:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3CB460238
	for <rust-for-linux@archiver.kernel.org>; Tue, 26 Oct 2021 02:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233511AbhJZCt4 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 25 Oct 2021 22:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbhJZCt4 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 25 Oct 2021 22:49:56 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEEF5C061745
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Oct 2021 19:47:32 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id e2so590292ljg.13
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Oct 2021 19:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student.cerritos.edu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HDxue/MV4rWlBg6W2ITKAQBIO2ICshZwBWAWpkiywnE=;
        b=ZjPgde7O7GIU4HZFt3udeqE8G82pmz+t1i2tzctDPSwJjx1n2B05e8NhR+ryHUU07v
         ew5BEKqTOB0BVu6P7yg/AhNJ4zemuftBm+ccND0EmVYw3q7tJau4NtIp7ubkK85Mih/B
         B9M0O6eKqKtKQMnJZT/AGB8ya/wqhJvIipDUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HDxue/MV4rWlBg6W2ITKAQBIO2ICshZwBWAWpkiywnE=;
        b=TPUeIKA47/5yw7NYpYlWDSkFl/bjLvl8bv7HHkdAWmv/OFWR+uZPtHeMpiln4KUW64
         nsMXc7rTwN04udFJFcb9dQRQgIlVIM7cHWCwF96kr4zahdybDR3I9wIY/IOrtANspC2s
         kUb0cV/mUS+EpsSxkoLGrsPA5uyIssPUsKvvEDrfki1E1gdlpr8azWu1xEry892Y2nqS
         mP2gFvn4YtBs+ad1Dn+g8jdOauFQmSs+p3AAtpklkymimwG6+D4pRXmrgBEfg4+xeKeB
         sARXaLwBgD+Wge8aXhqoGJZWnJg2asso5FYnhMxPXhP4YktxGAlH6Sabooj1YnpHixmg
         P1TA==
X-Gm-Message-State: AOAM532V4kCkwgutXhEZtrzEYv6xxcMHgDFtWOI8+Y+ZvzhFifMrCy7Q
        +h87saIJOJ1WShITuraduwVi0kH+odlbKGz70ER+swBghr4=
X-Google-Smtp-Source: ABdhPJyoqlxbkSpBD9PViIwa0HiN4vmnRVrch9n1CVV579kyOlVw2UxjLrS1rlQ6EqNsQfY3xCAWiUCxlcFavCGLNbI=
X-Received: by 2002:a05:651c:1108:: with SMTP id d8mr23108114ljo.220.1635216450662;
 Mon, 25 Oct 2021 19:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAPOgqxF0KV=ULD9dx-6-Z+0-Z7kitkTGcGoqYNuP7uWHaNNZRA@mail.gmail.com>
 <CANiq72=pLwnECAYL+PpTL0NrCn8DLT7mGNOneVbEjO8V9BfGXw@mail.gmail.com>
In-Reply-To: <CANiq72=pLwnECAYL+PpTL0NrCn8DLT7mGNOneVbEjO8V9BfGXw@mail.gmail.com>
From:   Amy Parker <apark0006@student.cerritos.edu>
Date:   Mon, 25 Oct 2021 19:47:19 -0700
Message-ID: <CAPOgqxGTVffYyiZq8Gsh8rF=vwvwAZfLngvD0XJQ+CW6epf0rg@mail.gmail.com>
Subject: Re: Current driver status
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Oct 25, 2021 at 5:24 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Amy,
>
> On Mon, Oct 25, 2021 at 1:49 AM Amy Parker
> <apark0006@student.cerritos.edu> wrote:
> >
> > Are there any reference drivers or other running components written in
> > Rust for the kernel in branch rust or rust-next? If not, is there an
> > outlined process for building one?
>
> You may want to take a look at `samples/rust/`. We are also carrying
> `drivers/android/*.rs` in tree for the moment. There are also other
> resources out of tree, e.g. in PRs, LWN, etc.

Alright, thanks!

> Cheers,
> Miguel
