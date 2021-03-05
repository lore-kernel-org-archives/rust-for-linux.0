Return-Path: <SRS0=mOKO=ID=vger.kernel.org=rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F6CC433DB
	for <rust-for-linux@archiver.kernel.org>; Fri,  5 Mar 2021 16:02:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF05664FE8
	for <rust-for-linux@archiver.kernel.org>; Fri,  5 Mar 2021 16:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbhCEQB1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 5 Mar 2021 11:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhCEQBH (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 5 Mar 2021 11:01:07 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45774C061574
        for <rust-for-linux@vger.kernel.org>; Fri,  5 Mar 2021 08:01:07 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id m11so3372736lji.10
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Mar 2021 08:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VrJd8S2MhJViG/hqnL2nmgObWIa0hWF9kb1eJdugHGc=;
        b=Gqj9onkxBl3VXkJgGgCo0Q4AzSKLt262u1EPtUPv5x4seBafnr7EB08GyTlw0T+BuM
         dh2Ykg/0WRnAx/rdZmBsov3EQai/a3FVyrWYmCf+kvWZKQmh4oakxgkPEaX4RYmJjyqf
         iaDfiqgNJOFMgiLwQIRdL3aUq+XY1114tUMVlHJksLttQc59L5fUEymp96K5NGd2RBu/
         AZtLGPfKWJnJcPWyULllToyf7LRDK4dJL4MlxRdtMusfGT+bNtP5RRknVJK0Qb/a9ofd
         bi31NB6KDYDjL0qZ1A+gPZTJGs0xZd5I9t/vdQM2Qn8KgngOwZ0mb22jyHAvu6omlb8L
         Fgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VrJd8S2MhJViG/hqnL2nmgObWIa0hWF9kb1eJdugHGc=;
        b=Rh+lvrgAsQhurWSwJzyMDVmu+IStVPdI9oUKZIxAK6fg9lBrc2VY484PUevR8uJrF8
         varTBMq5AR9VAyn7C1Pl0UEst9tfwHCuxu6S88nwhRBWQT/by4WKW/nSSeFTAL4w5UnX
         mKO+aYbMyEmA0YNqsExgHSOOKcU7haSBB1RrMWIjLrLv08CdZREdAl3FmhKLZpK8ulOT
         yBhIiW4hIEwTag62JCCpvJabtc6+jc7FeU21ujXe/7Z1t3IC2bc2qnym6aUk3Aj6cvfd
         N82tuGBPMBKe+5UT1KG2VS/rdztmET7J4dor88qd64HYmHMmYPUWpqnPJu9j2GpCBa/t
         fxLg==
X-Gm-Message-State: AOAM533g/A7qncafuUxFqaaBJPp7Tz571vqE3uEgZzYyL2MR+AXKEVKW
        YAlSYkIFp0hJLzbP8exUTHcb74fes1oIyubrmiHJeoHNQw==
X-Google-Smtp-Source: ABdhPJyDM3ZGO8qzE3Ys1PdaSpMyXBKjKX59jLJS7uLnYOKA/RkbG0Xyr00oDFL1j9WIGNMEnXeAK5OwlrIFQrmsuVo=
X-Received: by 2002:a2e:2f16:: with SMTP id v22mr5520977ljv.105.1614960065650;
 Fri, 05 Mar 2021 08:01:05 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72njjy7sJ=_mgjKNzaHcwRgoWkQmgSN2Fq6gdCYoeD1WZg@mail.gmail.com>
 <CAKwvOd=1a9er4qvYp1NaYWLPwTzNbo68Xc1+hQcv-qb-iuSjMQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=1a9er4qvYp1NaYWLPwTzNbo68Xc1+hQcv-qb-iuSjMQ@mail.gmail.com>
From:   Wedson Almeida Filho <wedsonaf@google.com>
Date:   Fri, 5 Mar 2021 16:00:54 +0000
Message-ID: <CAMKQLNKRMb1a6ydGxA4ZAYBUJKGMxJ6=PYOLn6HJ8ZH3GdJpZQ@mail.gmail.com>
Subject: Re: [Rust for Linux] Poll for call
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Either work for me as well.

On Thu, 4 Mar 2021 at 17:41, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> Either work for me! EOM
>
> On Wed, Mar 3, 2021 at 6:54 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Hi all,
> >
> > It has been about 2 months since the last call. We have a few bits to
> > discuss regarding upstreaming, so I think it is a good time to have
> > another informal call.
> >
> > Like last time, you are welcome to join even if you have been busy
> > lately but still want to follow development. So don't worry about
> > getting up to speed -- I'll give a quick briefing if needed.
> >
> > I propose next weekend Saturday 6th or Sunday 7th at 18:00 UTC like
> > last time (EU evening / US afternoon).
> >
> > Please let me know which day you prefer, if any, and feel free to
> > Cc/invite whoever you want!
> >
> > Cheers,
> > Miguel
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
