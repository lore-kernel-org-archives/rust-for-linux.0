Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346B8C49EA5
	for <rust-for-linux@archiver.kernel.org>; Thu, 24 Jun 2021 20:31:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18305613C0
	for <rust-for-linux@archiver.kernel.org>; Thu, 24 Jun 2021 20:31:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhFXUdh (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 24 Jun 2021 16:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhFXUdg (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 24 Jun 2021 16:33:36 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E72C061574
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Jun 2021 13:31:16 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id f13so9465629ljp.10
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Jun 2021 13:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=kyyGA0wi3WCbF7KN3TP9RTaGphsoWXLOow7IY5woA+E=;
        b=IJJskW/HBwfgVI9NC6CZUpTRZwzbs7cBzlwVm9gRHwfHgNgEy7p0DB4Mp1QsehBst1
         VMjLSlv8sD6eocuKW/Y41ixYRo31Xeuld9Y+m2DO4mfSLWPkHymOranGDnZF1kx9HAv0
         Qm/CdTPgGpEgT2Je5z+xbhjAMILeqWogjpgopRa61xhuaeJ2IDKpesMOBoaCYzcB8yjY
         m1fDHJA+wAq3RHWfFcLLjEOv12PZA16RvgSwl2FelLV11DE/HUMiXq5P9AUMZltnFY3/
         DLe7uFub8ODA2QvmhGbCOLE9JtLoyeeUP/SW3g/3Xv2zy9tk67iy4JVyXZMfHQsZayMf
         /7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=kyyGA0wi3WCbF7KN3TP9RTaGphsoWXLOow7IY5woA+E=;
        b=d8DoMiTDFQ/chMWwPjjIDhJQXT/YHKF8DsEu1vz7Fi/mSqL6ATBdzKrpDVgJ30EzSc
         mtYK9jqbwm+5JK16CE5fg/BkQaVeZ03nTRgFgSkvHjvmxu5iWmfdSkehYtpL3hS6wxHa
         y7zC+VWKlU+vg9tyoRZ/mKbG2CTsmRNs6tBw51XKgWgldX5JhXNh71T4Q0Af5xAzujFS
         HeruEO+H7miym/SyU6Qa2sH/pTjGemSg7mmJC6pWx3SEEgbfgsPM0SLfAinJXbrOInFv
         xJ0nmN2ptBZrserNcwE0MN6Bso4pfkJ0jHKOafpub+Y3d0iuW471fN/kennklB3xWV/w
         fejg==
X-Gm-Message-State: AOAM533IUx5FjC1VG2+SxJTXl0+0Z4LMd6fS0z3kyf/HntuprAmtqk63
        Q7XtCjG3vQNdg+1kM6/AHcUzTW8JFyME3Ildd1ZLG6RN8OGx6g==
X-Google-Smtp-Source: ABdhPJyHlFR8u75t3Dpo7y/07VuktZuVRJ52eh6uXuIBezxRavJ4Xj4GpxXFBLPF883xz/xHGRf/76kBZh+foWegYBs=
X-Received: by 2002:a05:651c:604:: with SMTP id k4mr5365631lje.244.1624566674836;
 Thu, 24 Jun 2021 13:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdkkXwRfqzBrrbgrgx0zTOWBaFz=tbPupOGkEFHw-4taqw@mail.gmail.com>
In-Reply-To: <CAKwvOdkkXwRfqzBrrbgrgx0zTOWBaFz=tbPupOGkEFHw-4taqw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 24 Jun 2021 13:31:04 -0700
Message-ID: <CAKwvOdn1U+_Fw8ZkKjDzMR2ySADdKTd2Gz=wSxRgWP_Nzujd9g@mail.gmail.com>
Subject: Re: Linux Plumbers Conf 2021
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Our MC has been formally accepted:
https://www.linuxplumbersconf.org/blog/2021/index.php/2021/06/21/toolchains-and-kernel-microconference-accepted-into-2021-linux-plumbers-conference/

Would you mind please submitting a formal talk proposal at:
https://www.linuxplumbersconf.org/event/11/abstracts/

In the bottom right, click "Submit new proposal" then make sure to
select "Toolchains and Kernel" under the Track dropdown.

The Content field will be what's shown to attendees.  We'd like to
close our CFP by August 14th, 2021.

On Tue, May 4, 2021 at 10:34 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> This year the Linux Plumbers Conference (https://linuxplumbersconf.org) will
> be fully virtual, and will happen from September 20-24th 2021.
>
> As part of the event, we are organizing a `Toolchains and Kernel
> Micro-conference' devoted to discuss specific topics involving kernel and
> toolchain.  It will cover both the GNU Toolchain and LLVM.
>
> As in previous years, the emphasis will be in discussing specific topics that
> require collaboration/interaction between the kernel and the toolchain chaps.
> Examples of topics are wrapping of syscalls, specific features in the
> compiler/linker/etc that are used by the kernel, desired optimizations,
> features to alleviate security concerns on the kernel side, and the like.
>
> In order to get the Micro-Conference accepted we need to provide a list of
> both topics and prospective attendants, so that's why I am reaching out to you
> asking for:
>
> 1) Topics your project may want to discuss with the kernel hackers, during the
>    event.
>
> 2) Whether you are willing to contribute and/or participate in the
>    micro-conference.
>
> Please let me know @ ndesaulniers@google.com.
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
