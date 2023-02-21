Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47DAC6379F
	for <rust-for-linux@archiver.kernel.org>; Tue, 21 Feb 2023 07:27:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbjBUH1I (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 21 Feb 2023 02:27:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbjBUH1H (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 21 Feb 2023 02:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E8225B92
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Feb 2023 23:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676964355;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JPIAZdGy9OlnE1O1SS60YxZ8brGuCruddGUDSBr1OzI=;
        b=e19qE7WSvCJtEL5DUaWkSP/00xJNexk/P4BoCyFoOt6I0FpDZqWewp8nTjbi5uE3SsSpmA
        Dpq6UIQS/YQoiF28coyiMqugLM6i/2rgnp0THfwCkktJx3GIJ3V0v2Yifcuv8aayV8+jdd
        gxJ+u04hdF6xuiysuZ22RooSzTrOTC0=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-q28OGitWPYSMTO5viK-b2A-1; Tue, 21 Feb 2023 02:25:52 -0500
X-MC-Unique: q28OGitWPYSMTO5viK-b2A-1
Received: by mail-vs1-f69.google.com with SMTP id i20-20020a67e2d4000000b0041223f6d16eso406127vsm.15
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Feb 2023 23:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPIAZdGy9OlnE1O1SS60YxZ8brGuCruddGUDSBr1OzI=;
        b=H0Hqz6hxBRtHn5alRk5QWGUBM/4IhZ1+IafwT17bmFzrl21sv3ELqhaTW4vDxZK72L
         phkd5ymDbEGhvcGnwZ2YZjKYa3cWf+eiY9cc371uQ1ZUMjjQO+2JXiJpLE7rK/v01HFi
         EVgkLn5IF0aIR+aEyuSiIwlq0HW0gwfxDofN4B915OIHcJJnqvIK4QHKeYeb01sy1L0D
         97MBr14ITpSqcisRQCaTNlkCjr6tMFK+4a12JF0mGawka35Wl11SX2ofBXsidExsGHPT
         BmumAZMYOstNzaAiI0NAMdVaDeizyFaeKIoPIh1rbiD1pRX2lDzq8Mt+PTAHwWyD4cjc
         yrDA==
X-Gm-Message-State: AO0yUKUtTVJdoLBGhTJemixJqbtaoWCFMgRSLCQSOxVWfIo/UlTD3RrB
        zrJFAFfzRpBQqQyr0IS/A9Zxo943Ooq0molXUQnhZuTI/4dFdKIJhK0kvBFti8Gx9iFJTSJoI7J
        DKRKoNQSRjfvPdm8DVj3F6mMD+qAMNuhNat2XdH54MVM=
X-Received: by 2002:a05:6102:f0a:b0:411:bd2e:11ac with SMTP id v10-20020a0561020f0a00b00411bd2e11acmr748821vss.75.1676964351942;
        Mon, 20 Feb 2023 23:25:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+QzMJrGZDcal2v3DamPgxlNnPNto6IxZHAfuHD9KBnKa+B4kexA0i1IiOd075Fe4xK51ciiQNNhbdDUty1Qpc=
X-Received: by 2002:a05:6102:f0a:b0:411:bd2e:11ac with SMTP id
 v10-20020a0561020f0a00b00411bd2e11acmr748816vss.75.1676964351730; Mon, 20 Feb
 2023 23:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20230221-gpu-up-time-v1-1-bf8fe74b7f55@asahilina.net>
In-Reply-To: <20230221-gpu-up-time-v1-1-bf8fe74b7f55@asahilina.net>
From:   Eric Curtin <ecurtin@redhat.com>
Date:   Tue, 21 Feb 2023 07:25:35 +0000
Message-ID: <CAOgh=Fw634rgNCzx+mMEQayhGKgUiBYsqpF7rFOz+q4DS1_kag@mail.gmail.com>
Subject: Re: [PATCH] rust: time: New module for timekeeping functions
To:     Asahi Lina <lina@asahilina.net>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        John Stultz <jstultz@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        rust-for-linux@vger.kernel.org, asahi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, 21 Feb 2023 at 07:16, Asahi Lina <lina@asahilina.net> wrote:
>
> This module is intended to contain functions related to kernel
> timekeeping and time. Initially, this just wraps ktime_get() and
> ktime_get_boottime() and returns them as core::time::Duration instances.
> This is useful for drivers that need to implement simple retry loops and
> timeouts.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Nice and simple C interface to create Rust abstractions for.

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

>  rust/bindings/bindings_helper.h |  4 +++-
>  rust/kernel/lib.rs              |  1 +
>  rust/kernel/time.rs             | 25 +++++++++++++++++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 75d85bd6c592..587f3d1c0c9f 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -6,8 +6,10 @@
>   * Sorted alphabetically.
>   */
>
> -#include <linux/slab.h>
> +#include <linux/ktime.h>
>  #include <linux/refcount.h>
> +#include <linux/slab.h>
> +#include <linux/timekeeping.h>
>
>  /* `bindgen` gets confused at certain things. */
>  const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 223564f9f0cc..371b1b17570e 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -37,6 +37,7 @@ mod static_assert;
>  pub mod std_vendor;
>  pub mod str;
>  pub mod sync;
> +pub mod time;
>  pub mod types;
>
>  #[doc(hidden)]
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> new file mode 100644
> index 000000000000..02844db47d34
> --- /dev/null
> +++ b/rust/kernel/time.rs
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Timekeeping functions.
> +//!
> +//! C header: [`include/linux/ktime.h`](../../../../include/linux/ktime.h)
> +//! C header: [`include/linux/timekeeping.h`](../../../../include/linux/timekeeping.h)
> +
> +use crate::bindings;
> +use core::time::Duration;
> +
> +/// Returns the kernel time elapsed since boot, excluding time spent sleeping, as a [`Duration`].
> +pub fn ktime_get() -> Duration {
> +    // SAFETY: Function has no side effects and no inputs.
> +    Duration::from_nanos(unsafe { bindings::ktime_get() }.try_into().unwrap())
> +}
> +
> +/// Returns the kernel time elapsed since boot, including time spent sleeping, as a [`Duration`].
> +pub fn ktime_get_boottime() -> Duration {
> +    Duration::from_nanos(
> +        // SAFETY: Function has no side effects and no variable inputs.
> +        unsafe { bindings::ktime_get_with_offset(bindings::tk_offsets_TK_OFFS_BOOT) }
> +            .try_into()
> +            .unwrap(),
> +    )
> +}
>
> ---
> base-commit: 89f5349e0673322857bd432fa23113af56673739
> change-id: 20230221-gpu-up-time-ea9412204c3b
>
> Thank you,
> ~~ Lina
>
>

