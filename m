Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95E7C27C76
	for <rust-for-linux@archiver.kernel.org>; Wed, 25 Jan 2023 18:01:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234965AbjAYSBb (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 25 Jan 2023 13:01:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjAYSBa (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 25 Jan 2023 13:01:30 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0DFEB46
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 10:01:29 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id d132so2517061ybb.5
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 10:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i/GBjJGEsH0b87MlDcOSzik6lqI+l5cB4CgBHYuIQwo=;
        b=D47csUbwfUVnYrrKhJIH2EtZMqf0NYe5gtlvmSqU2RFLokMK3ztf1AY4t1Z+ogvd6q
         SZckag6T6DRmEsiVBQr9iQDTijprCV0CCnMTvOe/ZWYo3i3zzDavqY+0HEn4Gay9H8vs
         5qDwCNorvlO3MqD2SQmDCUPYMJnMXLTIXIuaXWJALt2e87FdmUS+xbZg9NvvjCC4boOn
         J2tQI8DSbzx6AAMrFke2nnW9qwNo04/nTTy5OM/1D3DRBA13lKcJHSL2Omwvw01LYTxd
         iQU8VfeuNiqzU0vTIKRYmpfbI69jaF9x8F52O0yrsSyH0nIWEPuUWGLSATZ3AtgTIu5J
         OyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/GBjJGEsH0b87MlDcOSzik6lqI+l5cB4CgBHYuIQwo=;
        b=guF4rb22AH5K+pOvRKo0M3+4kPBy/ZJRhwint0VfDWI4doxqK7uyjOUOkScbJfUkNu
         HM03nHJdD6NPXUpvkXfiJkYKkf2HY2gVr6qzPmKPxGhcch1QAg+bF/0Ohy5/TpmQoSs3
         hJLMfXUZdBjiwpZgyMINhcUF9IUp+UPWbbS6cHMruJ9rN4m0cDlnQAb8mje6OuyTxdgy
         W5gDH7jlMhRJ+QIoyI2AlAZGW9Mbnewm7VjU/XtTRnyPx8sLew7js4OE3XRWCJDg5f5v
         49L5H99JzmAbqNELA+BeS+u3emdpOU5l3axelaMNx0bS88D7LVTzIlWcMLFxEH6Ki6Je
         8kNA==
X-Gm-Message-State: AFqh2koNeaJRMAqa8rcNb4iTz8TKoZVvYsIxFzwZkGrEac34YbKk04u9
        S3O/an3kQZgXsCcOwMnmJbDF8bKz7VA0Ax+zrxl9fy+RRBvN1gFG
X-Google-Smtp-Source: AMrXdXsJnuAlkS5FTFBECV6+LqisZHGSdHlDRuEr/c3B8JFZ1Ad8TdJXPFZcfyXUrpgAZoX3kAROoJntAgPko/ccXmc=
X-Received: by 2002:a25:b7cf:0:b0:712:faac:e6b2 with SMTP id
 u15-20020a25b7cf000000b00712faace6b2mr3760392ybj.632.1674669688510; Wed, 25
 Jan 2023 10:01:28 -0800 (PST)
MIME-Version: 1.0
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
In-Reply-To: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 25 Jan 2023 19:01:17 +0100
Message-ID: <CANiq72n1KGLY_Ee-+H1wofLYiEpfsgM=nDz79qc-irN-4qrj+g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Rust enablement for AArch64
To:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Jamie,

On Wed, Jan 25, 2023 at 5:37 PM Jamie Cunliffe <Jamie.Cunliffe@arm.com> wrote:
>
> The first patch is from Miguel's tree to enable Rust support for
> AArch64. This has been tested with the Rust samples, and the generated
> code has also been manually inspected.

Thanks a lot for this -- it is great to hear the prototype arm64
support we had at least made some basic sense :)

I imagine eventually we will need more changes on the target like BE
vs. LE, shadow call stack, extensions, etc., right?

> The second patch enables the PAC ret and BTI options in the Rust build
> flags to match the options that are used when building C.
>
> The third patch disables the neon and fp target features to avoid fp &
> simd registers. The use of fp-armv8 will cause a warning from rustc
> about an unknown feature that is specified. The target feature is
> still passed through to LLVM, this behaviour is documented as part of
> the warning. This will be fixed in a future version of the rustc
> toolchain. This pull request should address it,
> https://github.com/rust-lang/rust/pull/107294

Great, thanks a lot. I have linked this one at
https://github.com/Rust-for-Linux/linux/issues/355 (if you have
others, please let me know, it would be ideal to track them there)

On upstreaming: it would be great if ARM64 maintainers can take a look
(and please feel free to take it through your tree as well!).

Cheers,
Miguel
