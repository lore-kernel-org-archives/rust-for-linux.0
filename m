Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5773C7618E
	for <rust-for-linux@archiver.kernel.org>; Wed, 26 Apr 2023 10:13:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240398AbjDZKNB (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 26 Apr 2023 06:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239361AbjDZKM7 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 26 Apr 2023 06:12:59 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220A8A3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Apr 2023 03:12:57 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4ecb7fe8fb8so7199e87.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Apr 2023 03:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682503975; x=1685095975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snYOiKqgoVnB5ohuUHnbns4RINmjT1R7uP5BkhOFNUM=;
        b=y6X1iR7tK83MSYkNINDwsddtrA4mJaLb7s4bpZ+TZskQWeySmpRKDgS7TeDViJxVpW
         xhG4xYNiitFZvcsIxT1GF8jCGwLnJdE4JNYgO3/4YLSs8W+1eA7V4yzhoCRvwveOT62H
         gsRxclLFHgSYmgg+u0EdPatJEE6SQVPPWSt41yH9znDO6yswt/rkPoi8MqBG8AvD//lR
         nrSc1Ak620ATHAa4DT8IdyEe7eO+1crv12VySTO3b5a8VZRu9fd+5kF2VD5A9/gfdlRM
         eaGoW+A4LZ2TIVWrOR4WAi4aoqyBMKhsyIfckflN6Th2CHYtjf1eDdddlY9IoMnQzuIm
         mHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682503975; x=1685095975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snYOiKqgoVnB5ohuUHnbns4RINmjT1R7uP5BkhOFNUM=;
        b=ltd1jRnKwHrJbUPCYStml8dzSPmtdohfkNuebvfSVX7yAkXug6zLURwtqwDEXGSbZ1
         tH50caLe2h/upuOn/gWWO6uhPZLOuslPZ8lnhXJW6lwtjlvfToiW+dw2h0SupVOdkwsa
         9WS+xxMqPG9hZoKHZG4P6JRhdLcWZFc6s4p2LJUryDzRR6Bs6wZrx9fAa1OdY5yRcvEw
         4qf4+ncE4yYleQjujG0DSOfXN4qI246R9lhgL1T0jdND2o069EHlQuYFdyRYO4WvXH0a
         8vyctratnxOvgP1yAyk/TQg05B/UDYjUI2FYOaOs5qFxLBgYuVlfSfr8GaZm/MxCU+YF
         YvNg==
X-Gm-Message-State: AC+VfDx+pjgrTgj4Nn0zdkFd47X4kcMU91GKkRfPTlmSVw/6Snwc3h/8
        lhgW3zMNtHjNh61wl8V3OmDWRNkmSezQqQ099g/DzA==
X-Google-Smtp-Source: ACHHUZ5iHaw85sJIT2gsRxufAtrkLZdcbqBLY/FYJ30FnnxWPifbM7NglNYAP+L+lxTt47/gvPjnvN6e++u2crAt6i4=
X-Received: by 2002:a05:6512:ea8:b0:4ed:b0bd:a96c with SMTP id
 bi40-20020a0565120ea800b004edb0bda96cmr175258lfb.6.1682503975217; Wed, 26 Apr
 2023 03:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000079eebe05fa2ea9ad@google.com> <CANiq72mor1BkxpAT=v0EsQJN-7fvMjo9K5ooVk1x7ZbBDEyn8g@mail.gmail.com>
 <CACT4Y+aMdct_tjSYsBvvtGoDji6feOiANogRbp3N41qkzU+5CQ@mail.gmail.com> <CANiq72nm2dU2o_x_GQ5SdsXaK6yZiDXG2hXEYMykViEAZvuMqQ@mail.gmail.com>
In-Reply-To: <CANiq72nm2dU2o_x_GQ5SdsXaK6yZiDXG2hXEYMykViEAZvuMqQ@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 26 Apr 2023 12:12:42 +0200
Message-ID: <CACT4Y+YyYnwg4a1zjTnBU=t0x5Brt1rGuzz-5pXf2Fz3cKf4FQ@mail.gmail.com>
Subject: Re: [syzbot] upstream boot error: BUG: unable to handle kernel NULL
 pointer dereference in __dabt_svc
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     syzkaller@googlegroups.com, alex.gaynor@gmail.com,
        andriy.shevchenko@linux.intel.com, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, bpf@vger.kernel.org, gary@garyguo.net,
        linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk,
        ojeda@kernel.org, pmladek@suse.com, rostedt@goodmis.org,
        rust-for-linux@vger.kernel.org, senozhatsky@chromium.org,
        syzkaller-bugs@googlegroups.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, 26 Apr 2023 at 12:09, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Dmitry,
>
> On Wed, Apr 26, 2023 at 8:34=E2=80=AFAM Dmitry Vyukov <dvyukov@google.com=
> wrote:
> >
> > The crash is in lib/vsprintf.c and:
> >
> > $ scripts/get_maintainer.pl -f lib/vsprintf.c
> > ...
> > rust-for-linux@vger.kernel.org (open list:RUST)
> > ...
>
> Ah, yes, thanks!
>
> For the moment it is fine, since there are not many reports nor
> keyword instances, but perhaps in the future we could consider

In which of the dozens of kernel testing systems? ;)
And also in heads of thousands of kernel developers and users?
All of them use get_maintainer.pl.


> filtering out `RUST` on the bot side if `CONFIG_RUST=3Dn` and the match
> was based on `K:` (via diff with `--no-keywords`?).
>
> Cheers,
> Miguel
