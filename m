Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B58C25B08
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Aug 2022 20:19:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241820AbiHQUTc (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 Aug 2022 16:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241813AbiHQUTb (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 Aug 2022 16:19:31 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831E565560
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug 2022 13:19:29 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id a8so13446888pjg.5
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug 2022 13:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=+9Z/XZXm8bWOMYUazydkN2TVLsN2UeYG6ew3OjVi5qI=;
        b=HpHr/iQWB8WX4st3J64DaE0zM5ARTp02+45sJ5vZkelInM1TFQd24iBXDcg2aI6nJP
         FYbx1aNZdvP+HDvfVwboRXgM3PEgO7zeXFhGMwijY9NPzha4Y8KbJzlh7urNTDLZPwqM
         arxCmXCejqu5cxWkFnYtIAhUlMYrjzHqOQ24c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=+9Z/XZXm8bWOMYUazydkN2TVLsN2UeYG6ew3OjVi5qI=;
        b=lfbbx1x/pPollOLMLqlwrNxChvSQ40PwQf4UjOATLnb9KOjyMwXxbZ29R6LJZdhKGd
         G8HLwvLH1/4VMKuZp9QEazMAi7N+j+7E3CJUgJji9za2fgomkaj065EY/5chxqjdB0xP
         9HgKBQxCXqa2pMMLI5XPPTAe1Ftr9yWo4IT1P3y+8uk5U9sp6iGrtH/YWS8TAkbau9s2
         Ogm8PX5o1RtsQs2YHvEn3KhunGQyg1KyzcpP+E8+KlEibP8YEdZK1rVcBtJ8TX/YU0pM
         QFDMeizIFp2QYtKyD8p+fJvMb2XlH77ub0K/SjNQuV5+dackY0oLIdGch+BFezkOzh0n
         UkGw==
X-Gm-Message-State: ACgBeo3rhAvHSO+tf/llsIKTB4h1ATmb/S24K4/geuOwxNjggvphr8kP
        6irCC0Sv3D6sC6Jai116LpsyfA==
X-Google-Smtp-Source: AA6agR7QY3W0ZMOeQxTs1Yg2FjXLJvBUDKldZveBa2NF4s7r4sgSa2kskTzcL5qA6NGNdrvGjfHJrg==
X-Received: by 2002:a17:902:8f8a:b0:16f:975e:7c6e with SMTP id z10-20020a1709028f8a00b0016f975e7c6emr28503738plo.136.1660767569016;
        Wed, 17 Aug 2022 13:19:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q200-20020a632ad1000000b0041c30def5e8sm9819384pgq.33.2022.08.17.13.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:19:28 -0700 (PDT)
Date:   Wed, 17 Aug 2022 13:19:27 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, patches@lists.linux.dev,
        Jarkko Sakkinen <jarkko@kernel.org>, Daniel Xu <dxu@dxuuu.xyz>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>
Subject: Re: [PATCH v9 21/27] scripts: add `is_rust_module.sh`
Message-ID: <202208171319.AE20401@keescook>
References: <20220805154231.31257-1-ojeda@kernel.org>
 <20220805154231.31257-22-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805154231.31257-22-ojeda@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Aug 05, 2022 at 05:42:06PM +0200, Miguel Ojeda wrote:
> From: Daniel Xu <dxu@dxuuu.xyz>
> 
> This script is used to detect whether a kernel module is written
> in Rust.
> 
> It will later be used to disable BTF generation on Rust modules as
> BTF does not yet support Rust.
> 
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
