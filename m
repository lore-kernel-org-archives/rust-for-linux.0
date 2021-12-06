Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54366C433EF
	for <rust-for-linux@archiver.kernel.org>; Mon,  6 Dec 2021 19:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348730AbhLFTzw (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 6 Dec 2021 14:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348327AbhLFTzv (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 6 Dec 2021 14:55:51 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409F8C061746
        for <rust-for-linux@vger.kernel.org>; Mon,  6 Dec 2021 11:52:22 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bi37so28088654lfb.5
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Dec 2021 11:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qCi545GbK80p7g1dOndZmxZ1t+GhgtzglTvcr5pYytw=;
        b=BeOKbti2cLjxynXRhm3uVU/EUMQvrRDofJNFCXD70PoFjKCjIkViJzExWINqSM41cT
         M3tsA3XXX728I+CF7b3WuTC0hZCo4DzYk8wCuxW+yfH1IbsWDO6KfXuxH856xk/DZp20
         M/2ExrQz6BX6H1dHggEaZL0QsDljVu9i6MJ7TyyNCkY1DmLrISnlMjca/mU3gdYAx8JE
         szTRQLeSZHqYxNJnAXaAufrUUJaMbKSAGtqmRgl/MhABVM+32IMpOkIoPswXlcRGDxTJ
         /Y3Qj26Hg4ihT90ZPGsVrFNHbEEs9VKWfvpu4BBLkMgCmwB5zY+fyhgq1R/3NqABjo2C
         bE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qCi545GbK80p7g1dOndZmxZ1t+GhgtzglTvcr5pYytw=;
        b=ept4DH18DNjWNYjZPPqF9tV/+xcSfbr/I8YpavEWGJSUGHP22i/gRQ0n6ZT8b5XPbO
         /+2M1W46cyc93wy6aIrelLfqJNRL8x1M3v9MRbCkKa4Ywg0t+s0SfIsxPvxchaisNwP9
         ZI2WGzlp2IOS5f7Agjt+Z3ZX6oqUamQVrRf8DYAvkxJ+IYbziXW2666CnhKcPZ/HJiCZ
         WdXSbuWEYvH8+HSHv7Zk2DBWPo6bgW5COe9xPxFDJubGHJOf1dhaCNNbNLwhyr+nUAat
         jeP1r7Be1I4rRDuJ6Lo3tKknRufQdROxdH3JeZBUm3RjQx07d03vNBeDMSeL90ZWwj8c
         WnBQ==
X-Gm-Message-State: AOAM5336OnXG1dwWuzEWVgqVGTWUEoIDs/NxhDtOlNlhtcukmCq6yvY0
        075EPWkc3cal8ntvoKFhqc/1VUmWYYHKbdYs/U4CjA==
X-Google-Smtp-Source: ABdhPJzxQx0rWjWRUrzzOUFgjYLY+vk8jRMLZ9DjSV/X+VNkcdE4K2MaupeR9XFTfer1Qnc8G4Woge338nytB1DpSxE=
X-Received: by 2002:a05:6512:1506:: with SMTP id bq6mr37711959lfb.444.1638820340271;
 Mon, 06 Dec 2021 11:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20211206140313.5653-1-ojeda@kernel.org> <20211206140313.5653-12-ojeda@kernel.org>
 <Ya4mAqoOa8zIeZGZ@kroah.com> <CANiq72kCmLgrv++mFygR6dt0xOhfv04o9j6jYLQ1N+zLNvqohQ@mail.gmail.com>
 <Ya40Bcv+eFkqc9jv@kroah.com>
In-Reply-To: <Ya40Bcv+eFkqc9jv@kroah.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 6 Dec 2021 11:52:09 -0800
Message-ID: <CAKwvOdkLF_DPP1FF60720q3zxZG2qaSNTthxJPxLb4Bj=AFE=Q@mail.gmail.com>
Subject: Re: [PATCH 11/19] vsprintf: add new `%pA` format specifier
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Gary Guo <gary@garyguo.net>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Dec 6, 2021 at 8:14 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Dec 06, 2021 at 04:56:32PM +0100, Miguel Ojeda wrote:
> > On Mon, Dec 6, 2021 at 4:46 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > That should be in a .h file somewhere.  Remember, don't put #ifdef in .c
> > > files please.

Why not put #ifdef in .c files?

> > Will do, thanks for reviewing!
> >
> > > Same here, this should not be needed if you put it in a .h file
> > > correctly.

I guess IS_ENABLED could be used in the .c code, but I don't see how
they could move the dispatch to rust_fmt_argument to a header without
moving the definition of pointer() to a header, which they probably
_cant_ do because it's noinline_for_stack.

> >
> > This one is mimicking the `CONFIG_BLOCK` one (`case 'g'` a bit above)
> > -- but we can change it, of course.
>
> That should be changed as well :)

Isn't the point to minimize code that's unused for certain configurations?

-- 
Thanks,
~Nick Desaulniers
