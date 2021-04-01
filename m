Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4431DC46475
	for <rust-for-linux@archiver.kernel.org>; Thu,  1 Apr 2021 17:45:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAA1761393
	for <rust-for-linux@archiver.kernel.org>; Thu,  1 Apr 2021 17:45:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234544AbhDARpj (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbhDARhi (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 1 Apr 2021 13:37:38 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A47C00F7D5
        for <rust-for-linux@vger.kernel.org>; Thu,  1 Apr 2021 08:07:17 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id j2so2112327ybj.8
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Apr 2021 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ruK19XrIj7h40md62TO+GornB5hoAeda7BOu6Nbq8ds=;
        b=jKVgLghRqYR1q6UHL2j2KTb/XprQws8NVBkCrpohXBjDBaiNUkQHlkMkvtbnaI95Ct
         Gtg0L0UstyU0FL0p8xWB2nwepDFSuKV4RORa8/7cqzfcMXGWsbNXl9Tf6TkDTK7vW5G4
         fTfDx2R28PuAy5AtktThE3PmrhGvKsJAxyxELEWKHdMwjqha2Z9wPoKmRxrG8PmY2/1O
         pEsZoDIQieSSiW1egA+p1Hm41Lew1dqnk9T2+E1vdFE6TXXTm0cyz2y6U8RxKXJDBckl
         oVDBzDGF/vy3M3up9RAkAB4y0cunGJbeJdxd9Yw1gPA/94Cg9ew2t6UfSl1wJtN8ssdw
         LG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ruK19XrIj7h40md62TO+GornB5hoAeda7BOu6Nbq8ds=;
        b=KROmkRXEPKQ75W6mk2w3GHluDuuDAs+DmVnUmEODMqtzosmJ5mPIkuxbxL1ciqFb7D
         G7bPvZaedIXPZIfctFzDnHbdB8DLZol6SCNLzupsoMgwCcevNv08MK9fD/vVqhahGnp4
         9VvPsLJNErNXThMeTVcuhHL3oIZk7ZuIiAnSbLVtHyzDWDc37Rojr82qMQyt2EZKPl+H
         SXD+Y1mL26S+B57GEp790QtkL81cOEvJ630mFTG/bb5Blzt+tIzJedKKMhT0D4d8dLxo
         l4SNJHNXYbZOwdEnHl+IJrYeD5x+y2FaBAlKGhhr1ViCga1SvNBBodUo5gZugbvom0hd
         VuIA==
X-Gm-Message-State: AOAM533SQv8fkvS+vkiSMfsVlNo1XDVsfEi9ATUQgUAsGONGvQ5WeVXm
        JNvl9Kn7C3n5LaDUgA1PcpoYElc0k/gp81p6zjs=
X-Google-Smtp-Source: ABdhPJxAauVAVcSvs8DbveXjXHYg7cOWR6IeSIPA/N9cweNlc9BoYNiOFi5CU9kv9WbovuXYB6R31Oru0+wvibfUMU4=
X-Received: by 2002:a25:ae4e:: with SMTP id g14mr13704682ybe.26.1617289637202;
 Thu, 01 Apr 2021 08:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210401061840.g2zzox7xy5qol7kq@nitro-5>
In-Reply-To: <20210401061840.g2zzox7xy5qol7kq@nitro-5>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 1 Apr 2021 17:07:06 +0200
Message-ID: <CANiq72kjwKuRCzeB54JPpCfBO7hfzZKAoAHBtbSBAzfvZY8d0A@mail.gmail.com>
Subject: Re: Missing RUST_EXAMPLE option in linux-next-20210331
To:     Manas <manas18244@iiitd.ac.in>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Manas,

On Thu, Apr 1, 2021 at 8:19 AM Manas <manas18244@iiitd.ac.in> wrote:
>
> I am working on a device driver in rust in linux-next as an academic
> project. I used the following command to create .config:
>
> $ make LLVM=1 menuconfig
>
> But, sometimes the RUST_EXAMPLE option is not visible in menuconfig
> (under /Device Drivers/Character devices/). It seemingly happens at
> random that this option disappears, despite having a working rust
> nightly environment (and other dependencies).
>
> My rust nightly version is 2021-02-20-x86_64-unknown-linux-gnu, with
> rustc 1.52.0-nightly.
>
> Can someone point me to why is this happening?

Rust support in the kernel (`RUST`) defaults to off at the moment, so
if created a new configuration from scratch, it is likely that it
ended up disabled, which in turn makes everything that depends on Rust
disappear, including `RUST_EXAMPLE`.

Please check in `General setup` --> `Rust support` if it is enabled.

HTH,

Cheers,
Miguel
