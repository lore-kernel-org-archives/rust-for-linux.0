Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEEEC433ED
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Apr 2021 01:19:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 287B46105A
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Apr 2021 01:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233974AbhDBBTl (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 1 Apr 2021 21:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233901AbhDBBTl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 1 Apr 2021 21:19:41 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9AEC0613E6
        for <rust-for-linux@vger.kernel.org>; Thu,  1 Apr 2021 18:19:41 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id z1so3678055ybf.6
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Apr 2021 18:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8TWJ98eO2Hsa2tGHhlXcTxPPTUKCuQAGPhja1JkvPwA=;
        b=HyaXr8O7NaZqVWdwtp6Fnw7MXfMGoDPMExYfsL3Q6MLkNQnG4hMifH5iuesEX7lvl4
         339ssmMRduqkeo/f3uQGU0P+SEwrXCXRogj4cbyA0uAMWHEK0X3roFTXoBI7307TvUfN
         h18vdttpBLdoFWf6ouj/oX5+++1qzuhycex1WR48ZZ92p9IZG0FbY9BtPMPPVkIyLEFX
         gMscFq4U7s+LZxuCg8ESKHLeChFIrXL7QxVdK9BvaIfu5i5g7voDxn2SByg57aiTBuBl
         LGAQN5ki9Cq9jxGPaAohkYZUqNWYBYMKzV2JhCN2MBwp301bM3T+j4Su2hyib856YgGe
         0Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8TWJ98eO2Hsa2tGHhlXcTxPPTUKCuQAGPhja1JkvPwA=;
        b=PKIoc1nxp9pOUE32Oh47rB2mcnGdqQ+wkmWU7J2+ALAnfhy0eIxYMkfV9vZNqDUbAf
         eU9c/PbLeLZ4EO25ZZTqpqMP0/zT3hsLLVJLHEtMNj4+JOQp73EuRANfqh3VWlfYLp2A
         0t4MGKhwCPz6UdPzc8P+7I4kxhbfkDOeeFe4wiBXK2bWqqHusrnQ1S3tV1BvCYILwrlQ
         5kTyI//E/WN7kgqXmtGX3xICqjqSjBNSe8mfUEIpqNs6RP61PeuzuqdfiQCGxBfpOcbI
         PMw4sRMPoHu/Tn4fCA5GuIdiLfSj3cTCbALU3vTqJKxKaX+ga2TAgm91SYbNB2og/MMP
         a6Iw==
X-Gm-Message-State: AOAM5311REwt9ebkSIGastDkUSWoEzZmrq7dbXQRqBK9dBqWDi90F+F9
        SqiSaaklklOsCoebcpltqzysh9CQK0e3iJ1/MksUBv3iiMgGOQ==
X-Google-Smtp-Source: ABdhPJxSK9zS8HSdn7beY9Hqj3cNGXa+/iqXvrkHnBsMSxNzzxrEmVnjzgxxjlNxDNSHvViKuFjrIx2rwJ1h/pqs+jQ=
X-Received: by 2002:a25:ae4e:: with SMTP id g14mr17229978ybe.26.1617326380867;
 Thu, 01 Apr 2021 18:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210401061840.g2zzox7xy5qol7kq@nitro-5> <CANiq72kjwKuRCzeB54JPpCfBO7hfzZKAoAHBtbSBAzfvZY8d0A@mail.gmail.com>
 <20210402003503.exbxsfickscdvmci@nitro-5>
In-Reply-To: <20210402003503.exbxsfickscdvmci@nitro-5>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 2 Apr 2021 03:19:30 +0200
Message-ID: <CANiq72=heqQyTvPKopfmh+S9wFGdBECETAFNfmLjza-3rAdQFg@mail.gmail.com>
Subject: Re: Missing RUST_EXAMPLE option in linux-next-20210331
To:     Manas <manas18244@iiitd.ac.in>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Apr 2, 2021 at 2:35 AM Manas <manas18244@iiitd.ac.in> wrote:
>
> It was also not present.
>
> Nevertheless, I tweaked around a little bit and found that when I enabled
> CONFIG_COMPILE_TEST, then it removed CONFIG_RUST and RUST_EXAMPLE,
> (while HAS_RUST=y).
>
> But CONFIG_COMPILE_TEST's documentation mentions to enable it to build
> everything. This confused me at that moment.

If "Rust support" (CONFIG_RUST) was not there either, it is because
`HAS_RUST` was off, or, as you found out, if `COMPILE_TEST` is
enabled.

The reason we depend on `!COMPILE_TEST` at the moment is to prevent
Rust support from being built in `allmodconfig` builds in linux-next
as a precaution until we are given the go ahead, but this will change
in the future.

Cheers,
Miguel
