Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31F8C433DB
	for <rust-for-linux@archiver.kernel.org>; Sun, 28 Mar 2021 20:21:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B24DA6194A
	for <rust-for-linux@archiver.kernel.org>; Sun, 28 Mar 2021 20:21:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbhC1UVS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 28 Mar 2021 16:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbhC1UUq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 28 Mar 2021 16:20:46 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5F3C061756
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Mar 2021 13:20:46 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id l15so11716597ybm.0
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Mar 2021 13:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=uKsOamM/E049iCTm6J17jdC6f/Ga09DxkNI6xdwoXxo=;
        b=A5eLhix0XMHYMk7l+6467txQBhLuo9QPhNfZRSAM0y8M+9FTJ9Ji4HcK2JLIVf7Vn2
         KP1LMPYq1D/zUEX/c7PKJ2Pjee346gMCMuyiZe/YtdJ+VZ6ZqYgc2fO9ROOC+UrJQ/ee
         aE4+1R6/mQXnSWccLfq9q8dpsvDeVG/nYfx/BACtVD4USsaPZRPSfQi8ED85IUyKV02Y
         EeR7FNFjoLVEL7+gm0Lg6Rk4Vi6Rfz4pGSnEbEEWo7Rjn7dlIDwFfF4eECQyo48GE3eq
         TbNUPZG/YwlDzM9TjQd4hFLfwMfSkTxEu/md2y4QsfF1wvYSEQoBUvmd3Jh40YYnIUwr
         usPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=uKsOamM/E049iCTm6J17jdC6f/Ga09DxkNI6xdwoXxo=;
        b=SEtdiIeHzAm1AcEgFL4wqYEVjhBeqKPhdUIxdewme3hgSyp4QxZuDuD3FFKBnKshlO
         QIoFhJFH0E774lSoPH157EuIw7SsyGH5tz7i9OvHc+LdC5g+9iKlU83B5YDQYL3fGXWT
         SBEj4j9P9uDnZjVQgWhmcD3Z/tX8Qf4HKhGPpWkAXvvmtSGau/IswTtqhMWQY2qfpFIZ
         U1K9H7Ge1sGWSTxJ7BtSKodjfXeR+BZDEt7IP6iGbLzL0ETpzDUi5GECoRGt+Tnf2NYK
         sMMwqXhEgqsAMeGzqXP9M81yZKd40PrQ4HuxnPLeEc/PoJnbuY4uyG+SNfqFEBlUDISX
         Rqjw==
X-Gm-Message-State: AOAM532ubOaEw9ov34NKaeqWuSOZ0hOzpzVsMdUXEeLTJaGDeaqX419d
        A/K5TA54qriXR8qYKJ72/SZzhIC0DVDzjSoDyMKelI63F6A=
X-Google-Smtp-Source: ABdhPJxN4aeC0bYLGYJPrjy+yVA0hX4Th5ru4WDC5/ZSGblEze3ileoDRXMj1uzz+/3sy9rlSezjW5zk1vMkMy/oINg=
X-Received: by 2002:a25:ae4e:: with SMTP id g14mr33228336ybe.26.1616962845533;
 Sun, 28 Mar 2021 13:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72nx1f9hPwFCLXekHDu-0=8X7srJuocryZoYEMsL9o4iPA@mail.gmail.com>
 <2EE61073-1BD9-46C7-984A-1C0861B33876@gmail.com> <CANiq72=LqB5q0D_A_AQcOHD+4aVjQaqWuoPt8=tX-+jSckmFEg@mail.gmail.com>
 <20210327114912.cfeqqvxpjn7wgghs@gpm.stappers.nl> <CANiq72mBd7_gWxvTd8e9q0SMROkPcXK8BBVuUJapC1tgg1ugOQ@mail.gmail.com>
In-Reply-To: <CANiq72mBd7_gWxvTd8e9q0SMROkPcXK8BBVuUJapC1tgg1ugOQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 28 Mar 2021 22:20:34 +0200
Message-ID: <CANiq72nd6eLtx4N9GbHR_sGOHJ1H=czPyza=Gctc=HU68aQ+qA@mail.gmail.com>
Subject: Re: [Rust for Linux] Call Sunday 2021-03-28 18:00 UTC
To:     Kaviraj Kanagaraj <kavirajkanagaraj@gmail.com>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

Thanks all for joining!

Kaviraj: my apologies -- when someone new joins we do a round of
introductions at the beginning of the meeting, but this time we did it
at the end (but you had already left). If you join next meeting, I
will make sure we do the introductions first! :-)

Updated schedule:

  - We are still targeting the 5th for the RFC. We can delay a week if
we feel it is needed.

  - We will be adding a few things to the RFC:
    + Some of the PRs in the queue.
    + ppc64le support.
    + Binder & a couple rust/kernel/ pieces for it.
      * This does not necessarily mean Binder will go in the merge
window -- it is more to show in the RFC how an actual working module
looks like.
    + Move/split of "Rust example".
    + Kernel docs to be uploaded.
    + Unstable feature list to be updated.

Other topics & news discussed:

  - Wedson joined as a maintainer!

  - RFC:
    + The patches' split (preparation, Rust support, Binder).
    + Attribution, git-blame, kernel process, etc.

  - `alloc`:
    + We will likely end up with our own equivalent in the kernel, but
this is medium-term. For the RFC and likely for the merge, we go with
`alloc`.
    + Ideally, this work could inform the Rust allocator WG!

  - Locking: enforcing correct order/patterns (or at least disallowing
known-incorrect ones) via the type system or extra annotations.

Cheers,
Miguel
