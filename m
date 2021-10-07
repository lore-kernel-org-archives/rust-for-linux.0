Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CA3C433F5
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 13:01:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1518E61139
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 13:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240924AbhJGNDS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Oct 2021 09:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240907AbhJGNDN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Oct 2021 09:03:13 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8921C061746
        for <rust-for-linux@vger.kernel.org>; Thu,  7 Oct 2021 06:01:19 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so7391738otx.3
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Oct 2021 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=E8AZM2qnbjrMYx8fqpEYqISaPhSicQU67TSBNbHEWho=;
        b=DEhqmx3gkUI3FqZvEAJXN7kmYMTVLZ0dTBCmO6FAJ1AlvIwyEQQTK5+rJWfuDhjAI4
         U6TeTJF4UOZ6X7/dZ0C2R3CXk/wT+duJmLBn+TGKeFWiiyCAD6Br+Z4V1V0dWxVxC8Iu
         55nzRDP3ZOlqjl72XFjHakbVwBJOWnS733ZSIfaDCHwmTZsxN5yZpxgxavcPth6gIRT0
         qm50n2EOg5sdQhcHeirS4UV229q+FENtb+yS+144qWooakYoUEBcr33h6D5RCJ1nbUsO
         3815h18I7/swB+YD8UkDnYAK3Jc2KtrbZU/j73m90ngQcFiblVrBTNUTFH2LpvM/Wgkt
         LAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=E8AZM2qnbjrMYx8fqpEYqISaPhSicQU67TSBNbHEWho=;
        b=dhOfixSsjk4yG40lkcbp6FYytvABN41DNomTJKPIuSOd7f7YwoD4NzsXS9mM95r7Z9
         oH0S9vhj9G8CGJIseQj1rc4NkPf81BVPaM3buQ619X8tvoTSojNgsa7yS3ynSDIv2JcV
         Vn71GPBE/UXeiiFsVqGiU02M07bUv+X837FaDYWGQSRyGpesAgswdWdGm3nTnfEQPWLj
         57s/jK+qvsjpEUrq1Lzejq99zNdD/j9JC/V/g12Pv+xMSKUPjw1qOCKYtrjuM5w+8yxf
         3DBxRY/qwMZQxLs3ORvyC3/v4zQYAHnlvCpd5dr4yBJm+3FHzXgziVhB98BtrHk++9R/
         aN9g==
X-Gm-Message-State: AOAM532qYRRxfEHAh+m+RyARIlVeeXEB5Gc3FL1JT87Pk/kkv1dkJ6GG
        pnzlCR4sI/b2SnjIuanOYAZEXnJpKfXX7+uElqtRqEhVqmnWtg==
X-Google-Smtp-Source: ABdhPJzZ4D76pqW8PHL9L1O9eS8a9NUghf6HlynQFtGD6+whqwUteAkazsmT4zPKRZGOuj+H5FpINYiBePTtOsmidkI=
X-Received: by 2002:a9d:6f04:: with SMTP id n4mr3442262otq.157.1633611679102;
 Thu, 07 Oct 2021 06:01:19 -0700 (PDT)
MIME-Version: 1.0
From:   Marco Elver <elver@google.com>
Date:   Thu, 7 Oct 2021 15:01:07 +0200
Message-ID: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
Subject: Can the Kernel Concurrency Sanitizer Own Rust Code?
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     kasan-dev <kasan-dev@googlegroups.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Paul,

Thanks for writing up https://paulmck.livejournal.com/64970.html --
these were also my thoughts. Similarly for KASAN.

Sanitizer integration will also, over time, provide quantitative data
on the rate of bugs in C code, unsafe-Rust, and of course safe-Rust
code as well as any number of interactions between them once the
fuzzers are let loose on Rust code.

Re integrating KCSAN with Rust, this should be doable since rustc does
support ThreadSanitizer instrumentation:
https://rustc-dev-guide.rust-lang.org/sanitizers.html

Just need to pass all the rest of the -mllvm options to rustc as well,
and ensure it's not attempting to link against compiler-rt. I haven't
tried, so wouldn't know how it currently behaves.

Also of importance will be the __tsan_atomic*() instrumentation, which
KCSAN already provides: my guess is that whatever subset of the LKMM
Rust initially provides (looking at the current version it certainly
is the case), the backend will lower them to LLVM atomic intrinsics
[1], which ThreadSanitizer instrumentation turns into __tsan_atomic*()
calls.
[1] https://llvm.org/docs/Atomics.html

Thanks,
-- Marco
