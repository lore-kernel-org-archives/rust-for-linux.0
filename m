Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F605C433EF
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 14:22:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BFFD610A2
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 14:22:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241622AbhJGOYs (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Oct 2021 10:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242066AbhJGOYr (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Oct 2021 10:24:47 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C869C061746
        for <rust-for-linux@vger.kernel.org>; Thu,  7 Oct 2021 07:22:54 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id j11-20020a4a92cb000000b002902ae8cb10so1940493ooh.7
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Oct 2021 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=68r40UeTS22EPeHnKpLst2NJmGcOMP8BmVA3Kz2GylI=;
        b=iReQzGwYtiiMWzfvW/qiYG2qXuiqkcVGOCrD5dich275iwbfn2Dt5J9fU2xFB2BCUc
         JnP0MEFEOHZsh5A6DrDnI39vYZz18aBHWoFc35QNBDV1B8MOIff90KXC7TaClk813vos
         SmLwwXvEyad9b5hIerl2CrjEsN4YMDjcB5QL1UU0kEQ6gHdAlCMAmvUXzKfL8jJ4FIU6
         wutCrB0FygnDIV7bQB8YhtP9OUJ97nCUJgKUxkd0cuoBQXSKe7J0px5wZ0wca4PxFOFG
         XJUAEs9lBcelZO7D70OUh/BgEZfPljzkipNwmYyM4vkVsSMDipka4c5/RkVfdIW2lamk
         hDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=68r40UeTS22EPeHnKpLst2NJmGcOMP8BmVA3Kz2GylI=;
        b=1goTnllPwSECgN6eOx2S6CXiqju9j1Q/an/pMOZODTaJbgnqTD5g/pehjDpW3iiyyA
         erpFy3IGJMPFVkse8Hs740BMB/VwfJ5nNbj5M9R/r9cXG/YAkJVPqKkDXz/lCAMBKOF7
         PTDFSZrmceWtZl7DGXSs4pyWLd35zcBfW7C79Hp+tM31/9rBeCaCj7CakBx8IlvzcNO/
         HlxZblJmWgqLZ85AwGkf6Rlzi5NZloP5OfN3DRFUu8mQfnTEqnihXoGaMWhKHl47W48F
         ZdxNQGhTS+hBZvzojfXN61UMcGtWRxMpZWMuTWI5MAKvQHaZoKyWhw4D9G2lkRukfziI
         EYHw==
X-Gm-Message-State: AOAM531pk8YLs8AltIgiCQdXPmHPVbBPu0ppPv+B2nNu7SrrdsA1Bc1f
        1t9aSwFUBOs1LVLnRonE06CcFWR+jI9ZFsOdPAMg5A==
X-Google-Smtp-Source: ABdhPJz12k7F2e1wgMdKlkEzv1BMJ8mkpHmjy8pQoQxXPwnA3GKU39BE+36xb2Uc1G4bbmBUBvWPhqzcHORX5478Zgc=
X-Received: by 2002:a4a:dfdb:: with SMTP id p27mr3556642ood.70.1633616573163;
 Thu, 07 Oct 2021 07:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
 <YV8A5iQczHApZlD6@boqun-archlinux>
In-Reply-To: <YV8A5iQczHApZlD6@boqun-archlinux>
From:   Marco Elver <elver@google.com>
Date:   Thu, 7 Oct 2021 16:22:41 +0200
Message-ID: <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, 7 Oct 2021 at 16:16, Boqun Feng <boqun.feng@gmail.com> wrote:
[...]
> > Also of importance will be the __tsan_atomic*() instrumentation, which
> > KCSAN already provides: my guess is that whatever subset of the LKMM
> > Rust initially provides (looking at the current version it certainly
> > is the case), the backend will lower them to LLVM atomic intrinsics
> > [1], which ThreadSanitizer instrumentation turns into __tsan_atomic*()
> > calls.
> > [1] https://llvm.org/docs/Atomics.html
> >
>
> Besides atomics, the counterpart of READ_ONCE() and WRITE_ONCE() should
> also be looked into, IOW the core::ptr::{read,write}_volatile()
> (although I don't think their semantics is completely defined since the
> memory model of Rust is incomplete). There could easily be cases where
> Rust-side do writes with lock critical sections while C-side do reads
> out of the lock critical sections, so Rust-side need to play the
> volatile game.
>
> I'm not sure whether rustc will generate special instrumentation for
> {read,write}_volatile(), if not, we need to provide something similar to
> KCSAN does for READ_ONCE() and WRITE_ONCE().

For volatile (i.e. *ONCE()) KCSAN no longer does anything special.
This was one of the major compiler changes (-mllvm
-tsan-distinguish-volatile=1, and similarly for GCC) to get KCSAN
merged in the end.

So if rustc lowers core::ptr::{read,write}_volatile() to volatile in
LLVM IR (which I assume it does), then everything works as intended,
and no extra explicit instrumentation is required.

Thanks,
-- Marco
