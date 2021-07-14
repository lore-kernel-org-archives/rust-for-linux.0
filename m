Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136A0C47E48
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Jul 2021 20:22:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E98FA613C9
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Jul 2021 20:22:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhGNUZJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 14 Jul 2021 16:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbhGNUZI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 14 Jul 2021 16:25:08 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682BEC061760
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jul 2021 13:22:16 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u13so5728288lfs.11
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jul 2021 13:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AWy+35KmmWPF9vsv4/yauNLhBLPVkzMejTzAkHJGLBM=;
        b=V37VAVm5NvLVGqND/F0vTJg46VZeConitLxxTHCs1N4UC3kwCcitLTAuULgE9P0yJ7
         JxRC/pqtzVf+u3u/c8M13eOZYvvD8y4ch9aoNPL3PEyFGZfOI7/lAvcnPkfI3gFhUBhB
         KHaX4h+Jp8OCMJ7rNg+VURB4Q4FkA9BEozZbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AWy+35KmmWPF9vsv4/yauNLhBLPVkzMejTzAkHJGLBM=;
        b=AZffE9VoDdtnu1RGRbvcaFH5sEwaP0uo+D0I/t4q3dY87MDQWCdjBcG0/6d8CqO86n
         Ldj7iivdqjD2HPXxayHo7kqTYCzZvFfQ1zktANpaB7ovINzARTCkS+46buN4ShRdOXzw
         h48wF/H2xJjLCgl7nYK+2CFws2MzfZzA0YD7C1VYhfuWANWW56V4dR3TEtLj5HRTAi8+
         TabsDCQOJebWZ1CCalPnl6XylAZVoxBx/zcZvDTjoa+usI8X1dh62y/5jmkltSYFuPAe
         R1nXqPIRSpnw5OH8AjXLG6sfoIJynsvBTgrDDN3CPpaQmd7DXAQAki6oYZ07MlyAg5Ex
         gTAw==
X-Gm-Message-State: AOAM533Gm3IJ0JCy3l1Ile+pGiWVE4p+PAIhaIwvMO6vmEg844Z2R9pD
        FIsFpYJ7VlyCJUJGjNKKgq3dZZqTOoL3D8gu
X-Google-Smtp-Source: ABdhPJzRNMxDuLNg0Kes3F79w1EiI6hbBVVsF1kRWBJuvkxmD4PJXp6aMAmUwNRI1lKNTDjYTBTrqg==
X-Received: by 2002:a19:8c0f:: with SMTP id o15mr33736lfd.509.1626294134672;
        Wed, 14 Jul 2021 13:22:14 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id x19sm239389lfd.275.2021.07.14.13.22.13
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 13:22:13 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id a6so5312940ljq.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jul 2021 13:22:13 -0700 (PDT)
X-Received: by 2002:a2e:81c4:: with SMTP id s4mr10564675ljg.251.1626294133222;
 Wed, 14 Jul 2021 13:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-3-ojeda@kernel.org>
 <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
 <CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com> <87mtqo1wv6.fsf@disp2133>
In-Reply-To: <87mtqo1wv6.fsf@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Jul 2021 13:21:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=whdi_biEOrzrYn7OC+wq+ckoaa5dFAATdM=n9P7Dp0YOA@mail.gmail.com>
Message-ID: <CAHk-=whdi_biEOrzrYn7OC+wq+ckoaa5dFAATdM=n9P7Dp0YOA@mail.gmail.com>
Subject: Re: [PATCH 02/17] kallsyms: increase maximum kernel symbol length to 512
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jul 14, 2021 at 1:09 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Are you thinking the hashed kernel symbols need to have their types
> included in the hash?

I think the hash should be the whole mangled name. So yes, for Rust
symbols they'd have the the type information.

>  Or is this just a hash to make the names a managable size?

No, if that was the only point of it, the "just use two bytes for
length" would be simpler.

But I don't think we want to do run-time de-mangling of names in the
kernel when doing stack traces, which implies that the kallsym
information in the kernel should be the de-mangled names.

That makes the names nice and readable, and also makes this "maximum
symbol length" thing a non-issue.

BUT.

It also means that you can't use those names for linking purposes, so
you'd then need to have a "full version" for that. But as Willy
pointed out elsewhere, you might as well just use a constant-sized
hash for that, rather than have both a manged and a de-mangled name.

                   Linus
