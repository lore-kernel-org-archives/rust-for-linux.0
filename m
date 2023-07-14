Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A85EB64DA
	for <rust-for-linux@archiver.kernel.org>; Fri, 14 Jul 2023 10:05:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235100AbjGNKFx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 14 Jul 2023 06:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235811AbjGNKFw (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 14 Jul 2023 06:05:52 -0400
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61AE3A88
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 03:05:28 -0700 (PDT)
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-51e0d7c6293so1036517a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 03:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689329127; x=1691921127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5MF44XQzouX2FbGdHpxAthvfg7u3iO2oNPh/cM8NKE=;
        b=apJ81VA8GA3jTnw53j82PIZMpXO2K7A7oa/aWR/pG0xVkTrMRoSr2WO7woWzhaKgks
         Qiu5Ef2OtOLcCCthMBik8jre5JgKbOQ296jPDHO+0XBtbeQZ3GCV++0K6RdSFg4RJLtx
         HI5xt3Zx+SZVy5n98a+5XUHMB8tMTj6+uvbS9OppSt9LaXPRTaCyk7dj/0vpRi483Q/w
         mMeuWWvg9oj5KISbLCA6AXRIem3Ndp1x+G4RQ0XIlDX39FHUS6Q4CERdEKP9pZtXSvxP
         St538WJiTpZgiaPMGVu8ypTZGB9xPR5JNHSI92L2DHBK2iYWCB6Zt6EOsYaik2bKgOu7
         3ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689329127; x=1691921127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5MF44XQzouX2FbGdHpxAthvfg7u3iO2oNPh/cM8NKE=;
        b=Xu6RgaGxFl7WepUsejZEjYE/WkvBM02r0J8oldjmJtM5/g8iRpC6DPO3cyUZdKNxK2
         NEhSKqbcMkFJGfH4j0TiQH4gb19i6xxe5az5MmBEDnyBILEVmMhHLpZ68XVhyQjtGgrA
         GQ+YiS+zJ2CF43GvQvP3rrjcR3ISvaSDGMJh/pvqaIzREUsA5pO3kSh8NkmWy6++CIOP
         KfkOQaSj5MmjjXiHvEGC8xQs4ALlTy5ESMbZaeGQrs1C8bo74sFAqVR9U8MDhXkigwEZ
         eOjbR9HpPo8DvSi2h/jGRv5kaAXlmnLF42gZsyVQeN7kcoo9jiGEo4N91KDMw6L2ZGcN
         8dwg==
X-Gm-Message-State: ABy/qLaOyqU4xUsIf+kG9eWzclQ41eqvCdzhz4USrKGqDFOoCh1saxOJ
        aO0VizvncV/rCyzvaZ0QxqLnBw0Qgbt7E9U=
X-Google-Smtp-Source: APBJJlHwVKX/eQQLU8nLjAGvJpMaB1Jw8Jm+qhCHiVH05w5ZGIxlbFTKtQ7Ig8Do+3M/gB90uk1NNJRpAEM9C74=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:9f07:0:b0:510:dd95:da5d with SMTP id
 b7-20020a509f07000000b00510dd95da5dmr19412edf.4.1689329127461; Fri, 14 Jul
 2023 03:05:27 -0700 (PDT)
Date:   Fri, 14 Jul 2023 10:05:25 +0000
In-Reply-To: <20230714-rust-time-v2-1-f5aed84218c4@asahilina.net>
Mime-Version: 1.0
References: <20230714-rust-time-v2-1-f5aed84218c4@asahilina.net>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230714100525.2192448-1-aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: time: New module for timekeeping functions
From:   Alice Ryhl <aliceryhl@google.com>
To:     lina@asahilina.net
Cc:     alex.gaynor@gmail.com, asahi@lists.linux.dev,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
        gbs@canishe.com, heghedus.razvan@protonmail.com,
        jistone@redhat.com, jstultz@google.com,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, sboyd@kernel.org,
        tglx@linutronix.de, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Asahi Lina <lina@asahilina.net> writes:
> +/// Marker trait for clock sources that represent a calendar (wall clock)
> +/// relative to the UNIX epoch.
> +pub trait WallTime {}

What's the purpose of this trait? Perhaps it should have a method to get
the UNIX epoch as an Instant?

> +    /// Returns the time elapsed since an earlier Instant<t>, or
> +    /// None if the argument is a later Instant.
> +    pub fn since(&self, earlier: Instant<T>) -> Option<Duration> {
> +        if earlier.nanoseconds > self.nanoseconds {
> +            None
> +        } else {
> +            // Casting to u64 and subtracting is guaranteed to give the right
> +            // result for all inputs, as long as the condition we checked above
> +            // holds.
> +            Some(Duration::from_nanos(
> +                self.nanoseconds as u64 - earlier.nanoseconds as u64,
> +            ))

It looks like you intend to use wrapping semantics for this subtraction
so that self=1,earlier=-1 results in a difference of two.

In that case, you should explicitly use `.wrapping_sub` instead to
convey your intent.

I guess you could also use `abs_diff`, which takes two i64s and returns
an u64.

> +/// Contains the various clock source types available to the kernel.
> +pub mod clock {
> +    use super::*;
> +
> +    /// A clock representing the default kernel time source.
> +    ///
> +    /// This is `CLOCK_MONOTONIC` (though it is not the only
> +    /// monotonic clock) and also the default clock used by
> +    /// `ktime_get()` in the C API.
> +    ///
> +    /// This is like `BootTime`, but does not include time
> +    /// spent sleeping.
> +
> +    pub struct KernelTime;
> +
> +    impl Clock for KernelTime {}
> +    impl Monotonic for KernelTime {}
> +    impl Now for KernelTime {
> +        fn now() -> Instant<Self> {
> +            Instant::<Self>::new(unsafe { bindings::ktime_get() })
> +        }
> +    }

We usually add a SAFETY comment even if it is trivial.

// SAFETY: Just an FFI call without any safety requirements.

Alice

