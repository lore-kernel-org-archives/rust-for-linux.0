Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5DDC433FE
	for <rust-for-linux@archiver.kernel.org>; Sun, 13 Dec 2020 03:34:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64649230FF
	for <rust-for-linux@archiver.kernel.org>; Sun, 13 Dec 2020 03:34:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391081AbgLMDeL (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 12 Dec 2020 22:34:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbgLMDeL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 12 Dec 2020 22:34:11 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DA5C0613CF
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Dec 2020 19:33:30 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id u203so12133151ybb.2
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Dec 2020 19:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iNvUteJveKbtNv3Hh6WDIn2Uugq03M8oG7xW9wmbMbU=;
        b=Lnw348jGfvuFO9vLvPslIWGucqcNCsQTLrBKq8c9L4T51954VERAOp4zHWztE3nj+R
         eT2K30RHFRGH9rEfUomkmSSWMDoPITlQ7QmLhMLgGkeNFL3i4R6PV5cTe7RPAAnr9nAj
         TL6xH7+0pVFEFp1cvia2PBYuBhWC5OoTcS+PxRN5QRTMRtZrz+jfjIdyjvbuiukc8AhF
         C0Z7LiPj8rzPu1aUcFUq2bna5psTPspHe6TDScrTtskjylPU4+xByWwrNxet5IaYJvmd
         78fLxy2onMLRUDJXjuLMwM7HeSd1bwshjffUykZWE6sjAHkU/OU5Z9aCO7DscrFGMm7z
         g9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iNvUteJveKbtNv3Hh6WDIn2Uugq03M8oG7xW9wmbMbU=;
        b=pdR6dDz1Q0KEV3Vwxe8lqA+WQUNIeyRt4tX/Jc3XTeZ0HPW3h0Ixl9ioOxc09g69Db
         dXt5KdoHUws9Q40soLLGqapgY9TeesnVwWvuJcrh0yMzV/qgiO6SFvhDBxWF3A7SUhL1
         VaA8BXVFCm3JQmCwSOFJF4W9HWDbb1+eGEWZMDCfOla4xckC666XMcjvRLboxi/aVdjR
         +xBJ4bNqbQ5ep0DHaysZM+TOhXB8CPkmccQxZA61znYh+F906WECE/vyJZqr8GBuTrpR
         pgsrVkqmu36Px2ozSxtrnuzukwSHErmngo2gIcdl27kQE1f5KCSBg2ZRuQSsqcpNA5gy
         LdGQ==
X-Gm-Message-State: AOAM532NN6J/O1UHrEzM+7hzPRCuW8T2kKJ2/qqwvGRPDnvVVBZ0kENU
        o0NEKmFBtEjaSrMp4zKh9cKfXRqcEP8KA4o+COvsJzh407I=
X-Google-Smtp-Source: ABdhPJzxVobRgOQGP5U0a7PpmLRnNmOKm737mXpVCsR+USe1HL0Dp1gZKVUDoBks0zYHrVc3ui84E4LGQD2BG5CzWHc=
X-Received: by 2002:a25:ef0c:: with SMTP id g12mr8029751ybd.26.1607830410254;
 Sat, 12 Dec 2020 19:33:30 -0800 (PST)
MIME-Version: 1.0
References: <CAMKQLNLp+XfVcQf_+8OHJO=faTkwfdiFYR2s72LoAryHxFBJFA@mail.gmail.com>
 <CANiq72maQNCGT=ff9BrsqY81mXjzeYpKxDy9rZL36cmgfCZt-w@mail.gmail.com>
 <CAMKQLN++0y2fVHNJhthemZ4BhQCAqXyFygj-jACZQnqfFBmkbg@mail.gmail.com>
 <CANiq72m17CZswGE5-kKgA07W3Owq3-dtdbPTYvtxmMHzfqPGig@mail.gmail.com> <CAMKQLNKEP8PHptz=Zw392XV-Q+-DsvhkpCvnbhFaBfTAM-oqEw@mail.gmail.com>
In-Reply-To: <CAMKQLNKEP8PHptz=Zw392XV-Q+-DsvhkpCvnbhFaBfTAM-oqEw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 13 Dec 2020 04:33:19 +0100
Message-ID: <CANiq72nqTv=py=rXaJM7=YfC0EZozqqjZpp3HYCjw7EfhhRreQ@mail.gmail.com>
Subject: Re: File operations
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Dec 13, 2020 at 3:12 AM Wedson Almeida Filho
<wedsonaf@google.com> wrote:
>
> With this solution, `struct file_operations` is filled with pointers
> even for the functions that are not implemented by the client. The
> problem with this is that for some of the functions, the kernel
> behaviour changes depending on whether the function is null or
> non-null, so ideally we should only have non-null pointers in `struct
> file_operations` when clients actually implement them.

That is the part that sounds to me like we could go with a builder pattern.

> So I was in search of a way to determine, ideally at compile-time, if
> a function implementation was provided by the type or if it was the
> default one (provided by the trait itself). I couldn't find a way. So
> I thought about the macro to extract this information for us: it gets
> a list of functions that *are* implemented, then generates the
> implementation of another trait that is used to generate the correct
> `struct file_operations` at compile time.
>
> For example, the client would write something like:

Yeah, I was trying to understand if there could be a way around
generating that code to begin with, i.e. modifying how
`file_operations.rs` works.

For instance, could the user define a type with only the methods they
need and then construct the `file_operations` struct (perhaps
abstracted the builder pattern)? The codegen/performance should be OK,
since all the values would be known. The downside is that you need to
actually repeat your functions in the builder, but the positive side
is that the code is way more straightforward, no macros, etc.

> Then our vtable-generating code would use FileOperationsBools to
> determine what should be null and non-null. (Similarly to how it uses
> FileOperations with Some(_) to make the same determination today.)
>
> If the client forgets to add [#build_fileops] to their implementation,
> it will fail to compile because they won't implement
> FileOperationBools.

Sounds good to me!

> Apart from the non-trivial macro, it seems like a good solution to me.
> Do you know of a simpler way to figure out whether a function
> implementation is actually provided for a given type or if it's using
> the default one?

I don't think there is any either, but I'm not an expert.

> This also works. However, I think what I propose above seems less
> magical because it has the "impl FileOperations for XX", so the client
> knows that they're implementing a trait now, and with this knowledge
> they can find the definition of the trait and figure out which
> functions they are allowed to implement.

You're totally right, making users see the `impl` is better.

Cheers,
Miguel
