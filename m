Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CF8C433F5
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 16:30:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A19C261074
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 16:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241221AbhJGQcN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Oct 2021 12:32:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:42974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233621AbhJGQcN (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Oct 2021 12:32:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 869E961245;
        Thu,  7 Oct 2021 16:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633624219;
        bh=WNiIzHnr1nqrE/XXFJj65CJIbWICgqXK2xJdK8wOrno=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=VhAvPSdN7w9pt9NW9budOsmmvSYo7tpQidqyHq2smuSLpNW1iqnBWEdreEsc60Xs4
         bzKz9hA3PbBaJyb/oPe+3dZWswFJ4qXK4UMbPb/LhTPArhFzi/DX8WT67bH/yAqLqC
         LUAHLrWBwZn1YXVcXd45DRTdXRI9xytaGpjeMZUbo+gV5R5YDNVKL9ts9Wzukzyb1D
         0+4CWb2WMm9yYosoJRskNVKTNqQx4f03amh1WNugsvy9c/Acx56cgKtXqIhxkHzbVV
         d+Dpq6aGDBl4Alh1XQEgV0G7YlgcnrjK3gfK5Qj1DdECOqCh9UgjgXj3k/1p0netoY
         BFUNoiE00xH5Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 4E5C35C0802; Thu,  7 Oct 2021 09:30:19 -0700 (PDT)
Date:   Thu, 7 Oct 2021 09:30:19 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Marco Elver <elver@google.com>
Cc:     kasan-dev <kasan-dev@googlegroups.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        rust-for-linux@vger.kernel.org
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211007163019.GI880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Oct 07, 2021 at 03:01:07PM +0200, Marco Elver wrote:
> Hi Paul,
> 
> Thanks for writing up https://paulmck.livejournal.com/64970.html --
> these were also my thoughts. Similarly for KASAN.
> 
> Sanitizer integration will also, over time, provide quantitative data
> on the rate of bugs in C code, unsafe-Rust, and of course safe-Rust
> code as well as any number of interactions between them once the
> fuzzers are let loose on Rust code.
> 
> Re integrating KCSAN with Rust, this should be doable since rustc does
> support ThreadSanitizer instrumentation:
> https://rustc-dev-guide.rust-lang.org/sanitizers.html
> 
> Just need to pass all the rest of the -mllvm options to rustc as well,
> and ensure it's not attempting to link against compiler-rt. I haven't
> tried, so wouldn't know how it currently behaves.
> 
> Also of importance will be the __tsan_atomic*() instrumentation, which
> KCSAN already provides: my guess is that whatever subset of the LKMM
> Rust initially provides (looking at the current version it certainly
> is the case), the backend will lower them to LLVM atomic intrinsics
> [1], which ThreadSanitizer instrumentation turns into __tsan_atomic*()
> calls.
> [1] https://llvm.org/docs/Atomics.html

May I add this information to the article with attribution?

							Thanx, Paul
