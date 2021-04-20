Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79745C433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 00:24:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 302F261354
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 00:24:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhDTAZT (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Apr 2021 20:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbhDTAZT (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Apr 2021 20:25:19 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52AD5C06174A
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 17:24:48 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a25so28184151ljm.11
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 17:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FOsh3q0zxk4YO7I+1lA0GntuHcG2gh7NQXhaPukL/Mk=;
        b=CoROqzssO42bQLqB6Rp8HopASoqkxTL5Lm2RfjSKld7xisl+V2Gbk3AO6vM4JzkdRI
         7/bT4Hc0FhO+oUpZBbI3ETrfoixdNF0YZ2Ot1snmGj41r+v7P4MnbmNNIvDyP4HkXQi4
         0ezICMAFt//RtS6SAEmMmnHQoRQXDWCi/r0cTvi63f80u8AKKqL38tod6F11ZAUc5Yhh
         JVvJJkPdu2MX38h5FOqWPpU9SsWgW505gntYganD/ZpNPwZ1DLlGIpTQR2T09x5tK1qN
         4mHRdzqo+xqGoNrjTwFPYvQ1oAtGPK3kY4952Y24iMMU10cQcZGbEv1upHPEYYoyxz3k
         T5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FOsh3q0zxk4YO7I+1lA0GntuHcG2gh7NQXhaPukL/Mk=;
        b=pXl61tbKkjreohlfEVPIvK96Oso/KXgbpN7HFg2VgTgREAyBLfU7WjYgO060xqux6l
         06zIUfIbYxHjkY+Hz/1yhRg2RDwE3PeQNrd34NSPhVN1WdKeya97QunHyCDeC1z2P4Cg
         mWPXOhqRnyxTSGHvyDpIlynuOXtU7kmUlwy0Af+ms/PAt+QXo4Hyvot9qqI8dXiaAVoN
         bdsiW90+dqBYK/ycK0esgv+t/8Vn4hMt8WpOWw298R9FdSD+BVLh7PAGZ7kAM1KSkt08
         dXJqaLn74lCTKJb/WGurVzZdFto0I2hprm8jR23xl2axOBakLh3NZit4AHR1TnMOwryy
         QcAw==
X-Gm-Message-State: AOAM530rbgn7yjZuVD+7BCbsqvkr6LaNbrYG6fkmd+KgQEwaY30/CVb3
        9qxazlx70hXdM68EEptIIenlspcKHFGR67ZULkGanw==
X-Google-Smtp-Source: ABdhPJz5Js93YB2ex6G5WNbE1/JafHIcRDNChV3k45O5qMc5EmJ6/0INhkRfhrXeFh9c/TVfqqalk/EfusqMT2bjFbw=
X-Received: by 2002:a2e:9cc1:: with SMTP id g1mr11473192ljj.0.1618878286604;
 Mon, 19 Apr 2021 17:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com> <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com> <20210416161444.GA10484@1wt.eu>
 <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com> <20210416173717.GA10846@1wt.eu>
In-Reply-To: <20210416173717.GA10846@1wt.eu>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 19 Apr 2021 17:24:33 -0700
Message-ID: <CAKwvOd=RadTs7Skv6KUBo4qZQtdi0kugTzxvZM+5X_2gstjyaQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Willy Tarreau <w@1wt.eu>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Apr 16, 2021 at 10:39 AM Willy Tarreau <w@1wt.eu> wrote:
>
> resources usage, I'm really not convinced at all it's suited for
> low-level development. I understand the interest of the experiment
> to help the language evolve into that direction, but I fear that
> the kernel will soon be as bloated and insecure as a browser, and
> that's really not to please me.

Dunno, I don't think the introduction of Rust made Firefox _more_ insecure.
https://wiki.mozilla.org/Oxidation#Within_Firefox

I pray no executives ever see Dmitry Vyukov's 2019 Linux Plumbers Conf
talk "Reflections on kernel quality, development process and testing."
https://www.youtube.com/watch?v=3DiAfrrNdl2f4
or his 2018 Linux Security Summit talk "Syzbot and the Tale of
Thousand Kernel Bugs" https://www.youtube.com/watch?v=3DqrBVXxZDVQY
(and they're just fuzzing the syscall interface and USB devices.
Imagine once folks can more easily craft malformed bluetooth and wifi
packets.)

I'd imagine the first term that comes to mind for them might be
"liability."  They are quite sensitive to these vulnerabilities with
silly names, logos, and websites.  There are many of us that believe
an incremental approach of introducing a memory safe language to our
existing infrastructure at the very least to attempt to improve the
quality of drivers for those that choose to use such tools is a better
approach.

I think a lot of the current discussion picking nits in syntax, format
of docs, ease of installation, or theoretical memory models for which
no language (not even the one the kernel is implemented in) provides
all rightly should still be added to a revised RFC under "Why not
[Rust]?" but perhaps are severely overlooking the benefits.  A
tradeoff for sure though.

Really, a key point is that a lot of common mistakes in C are compile
time errors in Rust. I know no "true" kernel dev would make such
mistakes in C, but is there nothing we can do to help our peers
writing drivers?  The point is to transfer cost from runtime to
compile time to avoid costs at runtime; like all of the memory safety
bugs which are costing our industry.

Curiously recurring statistics:
https://www.zdnet.com/article/microsoft-70-percent-of-all-security-bugs-are=
-memory-safety-issues/
"Microsoft security engineer Matt Miller said that over the last 12
years, around 70 percent of all Microsoft patches were fixes for
memory safety bugs."

https://www.chromium.org/Home/chromium-security/memory-safety
"The Chromium project finds that around 70% of our serious security
bugs are memory safety problems."

https://security.googleblog.com/2021/01/data-driven-security-hardening-in.h=
tml
(59% of Critical and High severity vulnerabilities fixed in Android
Security Bulletins in 2019 are classified as "Memory," FWIW)

https://hacks.mozilla.org/2019/02/rewriting-a-browser-component-in-rust/
"If we=E2=80=99d had a time machine and could have written this component i=
n
Rust from the start, 51 (73.9%) of these bugs would not have been
possible."
--
Thanks,
~Nick Desaulniers
