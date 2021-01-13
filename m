Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556F2C433E0
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Jan 2021 05:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0847822B37
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Jan 2021 05:21:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbhAMFVA (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 13 Jan 2021 00:21:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbhAMFVA (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 13 Jan 2021 00:21:00 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B82A4C061575
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Jan 2021 21:20:19 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id b64so1031447ybg.7
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Jan 2021 21:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vqAxmRE5GmXd1JJYxNINS3IJxmOIcbs1I4kMflW4BfA=;
        b=ua9MNe2c0vJl+p9TOJYB/4tTGtuaDreWsa/UG2Xudy+La9krve4keIi1+YAW0jacc1
         4m3vJ42vg2SpjQB8/ggZ8z1xEbtXwfqUrKXOCsUxxTFU7E9wFHpoLc669GQqELkXSimO
         jiDk6yToZqp5ltAcBqJJZ6K+Ly9Q5ghHww4jwZ66lOZHD4FsoeC4k1Vwrcva6paGMqEy
         c5t2+IXcQhaG31Ndk3NhVoe5tBXjnWA7PK1bS9EETorO3CtwgWxsWRPO/G5fnccI1YnY
         9dIA/2gzF0Fn4iGkvPlzOLsaFUT26i6To1k+G/qGFnDj/p/RHtVerr9eB2vSCoqBMjgw
         r4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vqAxmRE5GmXd1JJYxNINS3IJxmOIcbs1I4kMflW4BfA=;
        b=J+G61qbB3KxyknH7MI95tStWdnfuO7v9h8S5ZZuPGTcZHxw/IqTj2tdl4ekXG0RzcX
         PXHBnYeKopXsdy1n+SNI4N8mEhRVr2KvUvVWZzXrVONyiavmQ9jQVjmXNhrClJKh5q2B
         wNoVsc3a9jKKXT3o4DnKvgP/sNK8xEyRhqU1vqMobOnxBqbypyVZYimSrjyGKJCWayym
         IqS6jUeIeuIbH2+OU/GcIzZswvW5B8vjNaK3G/n3x/oEpRzKxfs3VSOo/SAmuVoC1gr2
         pSwh12Jo6jBeGMDRXYgboC+jNQgnakCII3P5P403lBcHRRSjxk2ovixBitdjRO00dxW4
         E/oQ==
X-Gm-Message-State: AOAM5313Ux3EpM71Ulz+p8slp0mmr/6uDdAF6hD17nJLzK95CUN82vUh
        /2ChOEZqAWCXIoq467dfgXdUC+X/0xwxVdK5vnw=
X-Google-Smtp-Source: ABdhPJwC3D3RvpK3DHxf/RP6qs0Wcvw9doVxRGeiXtFoCyfe9ZXQucgg8rC32rc+6THZFOA3Fi/Gd1epYg6JY0W4Iic=
X-Received: by 2002:a25:50a:: with SMTP id 10mr878010ybf.115.1610515219113;
 Tue, 12 Jan 2021 21:20:19 -0800 (PST)
MIME-Version: 1.0
References: <CAFRnB2U0gpaoGxTM132bRKCTHyxCZz4fLqBZtsfmRq+6Nj28=Q@mail.gmail.com>
In-Reply-To: <CAFRnB2U0gpaoGxTM132bRKCTHyxCZz4fLqBZtsfmRq+6Nj28=Q@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 13 Jan 2021 06:20:08 +0100
Message-ID: <CANiq72=Xh9vSf-pRFOZ73qqhZ9ushKfM1ei-0TqYxNfLyHJmow@mail.gmail.com>
Subject: Re: Upstream Milestone
To:     Alex Gaynor <alex.gaynor@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jan 13, 2021 at 3:42 AM Alex Gaynor <alex.gaynor@gmail.com> wrote:
>
> I wanted to flag for folks that I've created a milestone for us to
> track things issues and PRs that we think "absolutely must be
> completed before this can be submitted to upstream":
> https://github.com/Rust-for-Linux/linux/milestones?with_issues=no

Initially I did setup a couple milestones and played around with them,
as well as with "Projects", but then after playing with things around,
I found labels easier to manage and more powerful than milestones
(colors, several "categories", several "states" per category, complex
filtering, etc.).

So, for instance, for the "priority" category, we have "required" and
"optional", but one can add more states if needed (e.g. "TBD", "very
low", etc.). To get the equivalent of a "milestone view", one can
filter on Label.

I am fine with going back to milestones if there is an advantage, but
I didn't find it... I am curious what they are good for (perhaps to
get that warm feeling of reading "we are at 90% completion!" ;-),
which is basically an arbitrary number given how they work...).

Cheers,
Miguel
