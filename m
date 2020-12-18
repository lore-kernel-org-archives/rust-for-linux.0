Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E72C4361B
	for <rust-for-linux@archiver.kernel.org>; Fri, 18 Dec 2020 03:59:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A88B723A7B
	for <rust-for-linux@archiver.kernel.org>; Fri, 18 Dec 2020 03:59:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgLRD7i (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 17 Dec 2020 22:59:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgLRD7i (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 17 Dec 2020 22:59:38 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08715C0617A7
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Dec 2020 19:58:58 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id w135so723131ybg.13
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Dec 2020 19:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GHIfmpCEtDsHNECgxzQr3bl/7RVrCReSuUyHQ+hHHv8=;
        b=uflFTudWVhKgQDE6tnqH310o1zCqzcKsRrQvcht1uDKeS1F3nx6IqIB1xRvG7orYZf
         wID2IHvqb4BCX02VvAQxJ4+9w1wbxwyTPsEBROhvukT/bJBUPUlUpk5dO82TTHkv+QNv
         f0aawj/WbnO7WV1qoTTj+ZnHRJmuGqVTOTrFRheL393iTXfaW/q79LsURDXO92rw88cP
         FOMAuEeYDsksuNK2taZU9tXToGMvAnt7ytN2MYF0dSKT2rzD16BpzQ4nhEpnFUisDhso
         R8HTYA7Z5c9UZWzvqUI1u/iArLcvduI/Qw5MVN6qGcQgdrZYEoCTVBX/zGMh++T1Irjt
         S+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GHIfmpCEtDsHNECgxzQr3bl/7RVrCReSuUyHQ+hHHv8=;
        b=Rk5QUVYqRJoYaedyXmlc3DR/OMm4kE6oRZLk55+rl/BXXQW6TivmDhgiCqRTKCnaNW
         Z7lCaV0wip4IylUR3DyJhWIcU7ekSBuIwz5HBdaspeegBAImnr7X/yYyuVZDgEs8hhcq
         dWbFZ3HaVLzLH0HUC0zpcobyfg98SWin7GjD07N65bgsRQS7aDE460jvivYDYPvXWXcQ
         Z2SwyjLMNx2k+xhW36SCBgpciSUCmdDVM6KyYEpYKZ4aSHl938nEE7q1e2iVBt0Z1l2+
         enMnR+zGQcSjqUF3aph5khgrqL3rkMePHQ/g2curJa1novILyHdcPFLLVZ/hiveyLVJH
         mt7Q==
X-Gm-Message-State: AOAM532xvojpaGbNdaQGdYzbrJFBPWNxtZfEje4o6UN9Hv+2y1A2lP17
        xLVA4kBcYUdtB11r+dVOzK9nrcmxmOhTGvxH+wc=
X-Google-Smtp-Source: ABdhPJwrHTD/lFiJLgehJjSc72WavVom7UyWGHwLYx1xpjH5C8IuoR1PEQcmDUvPYtwPXVl206xLDSToVQgNs1amIA0=
X-Received: by 2002:a25:50a:: with SMTP id 10mr3522996ybf.115.1608263937271;
 Thu, 17 Dec 2020 19:58:57 -0800 (PST)
MIME-Version: 1.0
References: <CAMKQLNLp+XfVcQf_+8OHJO=faTkwfdiFYR2s72LoAryHxFBJFA@mail.gmail.com>
 <CANiq72maQNCGT=ff9BrsqY81mXjzeYpKxDy9rZL36cmgfCZt-w@mail.gmail.com>
 <CAMKQLN++0y2fVHNJhthemZ4BhQCAqXyFygj-jACZQnqfFBmkbg@mail.gmail.com>
 <CANiq72m17CZswGE5-kKgA07W3Owq3-dtdbPTYvtxmMHzfqPGig@mail.gmail.com>
 <CAMKQLNKEP8PHptz=Zw392XV-Q+-DsvhkpCvnbhFaBfTAM-oqEw@mail.gmail.com>
 <CANiq72nqTv=py=rXaJM7=YfC0EZozqqjZpp3HYCjw7EfhhRreQ@mail.gmail.com> <CAMKQLNJBdaT_UrJCEAB3OP8usOz+F2QgEyFdtoFWP2-f3OTeQw@mail.gmail.com>
In-Reply-To: <CAMKQLNJBdaT_UrJCEAB3OP8usOz+F2QgEyFdtoFWP2-f3OTeQw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 18 Dec 2020 04:58:46 +0100
Message-ID: <CANiq72kHf8m2BGcj+znWnoLzfy_1kP3BQuRAmGTZXnW3tdtnhA@mail.gmail.com>
Subject: Re: File operations
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Dec 14, 2020 at 3:03 AM Wedson Almeida Filho
<wedsonaf@google.com> wrote:
>
> But one potential issue that comes immediately to mind is that with a
> builder pattern, the value is created at run time. In our case, this
> is undesirable because this table contains function pointers: if we
> leave them in writable memory, they will become easy targets when
> attackers have write-vulnerabilities that they want to elevate to
> arbitrary execution; leaving the vtable in rdata (i.e., in read-only
> pages) is much preferable. This means that we need const functions,
> but we cannot have them in traits.

That's true, I was assuming the optimizer would realize it is a
compile-time value anyway, so that we could do it that way even
without using `const` etc.

> If we are ok with repeating function names, I have a solution with a
> much simpler macro. Of course, it is simple enough that clients can
> just ignore it and define the const themselves if they want to avoid
> macros at all costs. What do you think of
> https://github.com/Rust-for-Linux/linux/commit/13b2f2c47e62ad5bf824f7e15e14090c90a4ba9e
> ?

That looks quite good to me! It seems easy to use, and the
implementation is also easier to understand.

Cheers,
Miguel
