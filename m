Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271F0C433F5
	for <rust-for-linux@archiver.kernel.org>; Sat,  7 May 2022 08:19:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359777AbiEGIW5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 7 May 2022 04:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348205AbiEGIW4 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 7 May 2022 04:22:56 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0892E57996
        for <rust-for-linux@vger.kernel.org>; Sat,  7 May 2022 01:19:10 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id s14so9518275plk.8
        for <rust-for-linux@vger.kernel.org>; Sat, 07 May 2022 01:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9+q9aUf4v+U7iVHZBR1QE50pR302JL/thuuN0VcLXWs=;
        b=RNO1Ht2exGBR01XTSFTebLKZDZjXwgSWHHGd+LPeYF3RRovohaT6tYTmTfrGLZ5C99
         E3jwG2za/RKzvPtASaPyjeW1AD8Sun0v388cYcY2FIQ9O2C9kVJ3G6rKz6KU+IVtK4tG
         zQjx02yOwIr7J2ZdDC3x+zTq1DvJTgk1ZFMS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9+q9aUf4v+U7iVHZBR1QE50pR302JL/thuuN0VcLXWs=;
        b=VVFTpVaMG3/0lAxso1tDT9CHO7pXKxXA7aI9Nd0GJ7Z5EGOq+k4b0Nmb8oV5Vk4B4X
         dx9BarIhRUSaHOXsACbYa5a/KIzMzZUb3UHAJoMe218Ms2MhDl1mJe1Vqa8UQND746GC
         GypfTz4VYHjxQrt2RhfJ9zmJW9qHFiHLKBLXis2mz4vRfzPXYkvabBZjhSJ9REGWFQmO
         Di9/01F892RTLN0S7RhNJqBU4O+bU+1IsU5DLAi5sg7kMcA1TqNsOdxabF4tJCfg8iyj
         GKMcbjPkh6aXsxnH7mPn3ZZspFVVVQqPiKhxYgrPZfQyiYsvJZ7qi1ji8hLdACPZUOhB
         D/YQ==
X-Gm-Message-State: AOAM533LuWaadI5soCA7P/ojIc7xHTvvlRVecr3/mmh9215JOpwvGSQL
        uFkZu1IEMyz8d0TveFIsECj9/Q==
X-Google-Smtp-Source: ABdhPJwiBWrbI1UHs+bairbeRXhaalkvL3Kkwi8ViT3UUNE0Z/HiVP92KgqhQmep5bSePoh1c8CZ0w==
X-Received: by 2002:a17:903:32c9:b0:15e:a1b8:c1ef with SMTP id i9-20020a17090332c900b0015ea1b8c1efmr7660751plr.173.1651911549598;
        Sat, 07 May 2022 01:19:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b0015e8d4eb1f2sm3153758plp.60.2022.05.07.01.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 01:19:09 -0700 (PDT)
Date:   Sat, 7 May 2022 01:19:08 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v6 14/23] vsprintf: add new `%pA` format specifier
Message-ID: <202205070117.28F31079@keescook>
References: <20220507052451.12890-1-ojeda@kernel.org>
 <20220507052451.12890-15-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220507052451.12890-15-ojeda@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, May 07, 2022 at 07:24:12AM +0200, Miguel Ojeda wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> This patch adds a format specifier `%pA` to `vsprintf` which formats
> a pointer as `core::fmt::Arguments`. Doing so allows us to directly
> format to the internal buffer of `printf`, so we do not have to use
> a temporary buffer on the stack to pre-assemble the message on
> the Rust side.
> 
> This specifier is intended only to be used from Rust and not for C, so
> `checkpatch.pl` is intentionally unchanged to catch any misuse.

Maybe add a test to yell if pA is seen in a .c file (like the runtime
check in this patch).

But that can be separate from this patch.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
