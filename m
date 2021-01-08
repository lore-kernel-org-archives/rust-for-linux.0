Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42116C433DB
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Jan 2021 08:26:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B6D42343B
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Jan 2021 08:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbhAHI04 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 8 Jan 2021 03:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbhAHI04 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 8 Jan 2021 03:26:56 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AFAC0612F4
        for <rust-for-linux@vger.kernel.org>; Fri,  8 Jan 2021 00:26:16 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id f6so8638219ybq.13
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Jan 2021 00:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YjrxT7ceDcY0RtFbu0cscAjXEOIzyPBsnqCBwxJUbLg=;
        b=Xfaq8sS+YuQB8DFFECZ0oGcR9rT+u2vYtXMwSKw+agreGOfyeVuqg4Ux/2nzFSH7fN
         WmPbv4olP7gUxxFHv53WQgxmrbi6d17sl5EHYluM0zjl0SG0ynatFKEO8KeuNZ6rDnhT
         NEh8bYiZrb1v2tqnUz1w/ZMoFcF6n96Dp1sQiBifU0eL5I4TToSvP+k4K8mlBVKiZww7
         m5SZOqmSm73WBuh4qMjJoqNxqOqaF+eCuDPWpKqPxtezFhbE7d9wnX+7j9qU+fEIgMlS
         oIlfIQc3ZIObhWw5ftgQNClDTBGjZHNzv4au5n0Z2Qqdk5rLgR0bFWjfVGcdfrGj+1Mq
         iFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YjrxT7ceDcY0RtFbu0cscAjXEOIzyPBsnqCBwxJUbLg=;
        b=kiKsEwrlt8+PgUg0zn3VY5H/lwWZ/+d3sP/6pYrlFREZQC9hj2rxyF7WogBKPvWO9H
         XbhCdxhLF6OGiunFgllLy/NLR226u4NY5n6jDCROD6IjJznpm7TuXQvH528u0tfKJLLF
         KNLSgdBiXgDugKLUQN0X68w6cYnqQgtNYgavOlXfy7kvILG0KkPAbb8uN7cYXVI5iBrM
         1a0ZPiW9YLANieL4YMY0Q88TliIQ6OB284qz1IMPgING4AGMAN2jAcv78EQpQQx5NoZH
         3YHuYPSOoGs+BWkMx+vmWz5HmTpjJey7fihJS6aCP7RsdQnVFfjJ7Ne4kDUDvsQ5rqrO
         f+lA==
X-Gm-Message-State: AOAM533ejqJbJdbU5funfpZz2NCIs4MhSAw2Qs6U+8dgP07f+LAa/gIp
        /XVCmbDAqrZrqx6Tag98bGCEcPQ+fqCLOg+If2+8qL36
X-Google-Smtp-Source: ABdhPJxy0b44pu10pDD0k5kzixWo3GZazIX2Lc+rtajjW4kJY7IfoaotRrgZEw8Sa3F/qTRixRHhKSUpvfTxzwoaM/o=
X-Received: by 2002:a25:284:: with SMTP id 126mr4098800ybc.22.1610094375716;
 Fri, 08 Jan 2021 00:26:15 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72=-He3iQRpKrCwApPUCjbF+zAiM95mR5JJ0tvs1hA0fnQ@mail.gmail.com>
 <CANiq72mRp6goyxUCrCGZ=VHJ1Xi74v0ey1sFt=7fzLELsHkpQw@mail.gmail.com>
 <CAFRnB2XcsPD3jiYmajC-2n_6g02+MgzbLSSZwV42rCJidfTZdA@mail.gmail.com>
 <69c0082d-3505-4d65-889e-452a4ce3cea1@www.fastmail.com> <79e121e9-a651-4dca-af50-1f82bee8aed5@www.fastmail.com>
In-Reply-To: <79e121e9-a651-4dca-af50-1f82bee8aed5@www.fastmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 8 Jan 2021 09:26:04 +0100
Message-ID: <CANiq72mb4G=Hb9j8BxxFFXwW2YvU72KbPYDw3SvV1Wn080gEjA@mail.gmail.com>
Subject: Re: [Rust for Linux] Happy new year & Poll for call
To:     list@johnericson.me
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jan 8, 2021 at 2:25 AM John Ericson <list@johnericson.me> wrote:
>
> I'm sure you all actively working on this project will have more to say than me, but in the interest of keeping track of loose ends I made in the first place, I
>
>  - Posted https://internals.rust-lang.org/t/dogfooding-z-build-std-in-rustbuild/13775 about how -Z build-std could get more polish
>  - poked https://github.com/rust-lang/rust/pull/77916
>
> Hope some of that is of interest,

Of course it is!

On the topic of -Z build-std, I have been working on [1] which
integrates the building of core, alloc, etc. in Kbuild instead of
using build-std.

In the end, it turned out to be easier than I expected, which was a
pleasure. While the particular build steps may not always remain the
same (perhaps due to change of editions, splits into smaller crates,
etc.), I think it is a good idea, nevertheless, to keep the building
of these few critical crates as simple as reasonably possible for
projects that don't use Cargo -- even if build-std stabilizes, starts
getting used by rustbuild itself, etc.

[1] https://github.com/Rust-for-Linux/linux/pull/52

Cheers,
Miguel
