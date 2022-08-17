Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01234C25B08
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Aug 2022 20:12:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238316AbiHQUMD (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 Aug 2022 16:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238004AbiHQUMC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 Aug 2022 16:12:02 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CC6A61DF
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug 2022 13:12:01 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id pm17so13428366pjb.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug 2022 13:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=HfC3dMpEngb7r9gnYszZZUkGHTRJbCSwAF6hsjZawl8=;
        b=VgN2NI+Ezj1YnwZA75qkUzO3odm7nQ/YsFK2soo32JnPYdtR6gEuOdUGqLBg8c5ktf
         fCo70wM3ALHe+y+fUNIROShP5H6+3xzGZPkl98pJmQZYK+HzHeTl7B8BF44BfwOOv+ir
         h+sT7VUYnSBUCMIx81qQvnB+TETrbRV0froDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=HfC3dMpEngb7r9gnYszZZUkGHTRJbCSwAF6hsjZawl8=;
        b=vuFFIPdKFP8ULYmohxDRql7ykwFg/41AMpbLXwaK4U6zjH9HlGfVmur/eHoV3wfOzQ
         l5sslQ5bay5+V/XLaV3mrR/h6wGkzJ39xGrCMQagWWsoyDrkM2eEnyCYFKt1NewMjtqP
         SBqaq0kREKLZZL3hbBxuQC0wMrR633l6xnCln4mw4RREdc7JNaXct7pnr7Q3g3VDhC5d
         M3z1oAL6BtYB726fD9O1LrKDBEg8M8lYMCpuXNobNqeX0Uv7Iay3NL9nPatjpNw08tIb
         vof0Dl6h+7SSR7eBeDAPHw5usbgcr74EEzO+P2Wb/o33sdWWq/xNZ5CxFPTr0w42iVB8
         JlMQ==
X-Gm-Message-State: ACgBeo1LnJA0eUwl1WjLc6gP2Y2ynrrSNzHYYv4fG2sUekFNP4MY/AsV
        RYsvoy3FTC3L4AAhkKa7M2anLg==
X-Google-Smtp-Source: AA6agR5O8XGj1uDOVttCpuLlRr7eJO5srWmKa+1LSIBXqFLAGYz3aii6rcP0HxPmAHhk8CX5FB3voQ==
X-Received: by 2002:a17:903:1246:b0:171:5033:85c with SMTP id u6-20020a170903124600b001715033085cmr27932780plh.146.1660767120719;
        Wed, 17 Aug 2022 13:12:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j15-20020a170903024f00b0015e8d4eb1d7sm346970plh.33.2022.08.17.13.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:11:59 -0700 (PDT)
Date:   Wed, 17 Aug 2022 13:11:58 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, patches@lists.linux.dev,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v9 13/27] rust: export generated symbols
Message-ID: <202208171311.73A2CAAA6@keescook>
References: <20220805154231.31257-1-ojeda@kernel.org>
 <20220805154231.31257-14-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805154231.31257-14-ojeda@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Aug 05, 2022 at 05:41:58PM +0200, Miguel Ojeda wrote:
> All symbols are reexported reusing the `EXPORT_SYMBOL_GPL` macro
> from C. The lists of symbols are generated on the fly.
> 
> There are three main sets of symbols to distinguish:
> 
>   - The ones from the `core` and `alloc` crates (from the Rust
>     standard library). The code is licensed as Apache/MIT.
> 
>   - The ones from our abstractions in the `kernel` crate.
> 
>   - The helpers (already exported since they are not generated).
> 
> We export everything as GPL. This ensures we do not mistakenly
> expose GPL kernel symbols/features as non-GPL, even indirectly.
> 
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
