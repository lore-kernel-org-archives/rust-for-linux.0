Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00E1C32772
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Aug 2022 20:27:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiHQU1l (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 Aug 2022 16:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241618AbiHQU1k (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 Aug 2022 16:27:40 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD60A9272
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug 2022 13:27:39 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id m2so12946262pls.4
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug 2022 13:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=e8AurnYaw5w6q42X379tvVxdUwxeEA/mYjtAY47a6po=;
        b=aLY/bwswAmyWGmv+4JEwglL+yZmZSkY5uTI10+jNpMXObxnDHYBy1/NFE6oNgiy8gm
         8M7QxAggsLjoXwN0tKrViIKk34FBRU2jjAG7OmyyvJlon3HbSz6RYHrCeWoKD7s7v+ey
         WBXTu2wjGczVnm7NC9ChqKPe87n8jYbCFqs3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=e8AurnYaw5w6q42X379tvVxdUwxeEA/mYjtAY47a6po=;
        b=pwNU3CAFSD6ZjzYrs3EngzNlIJO6z39UK+EtumMKQ86/0YXHPvS6xAngva8+cy7AfK
         rsb0E27ZOVAEMe3ZQDn1X+2xm9rH953sKbgAhXd3h//iFxS1PwMuN2DOP1Ti6xoa/u6c
         VOpfmsiIfXxfWIPmh0KXVpkp6dHlOjCLS0D6/h5X3Rlj8nk99wnHncWrchZi+XuM4+Cg
         J8GN61fXh5L4wYSrrHJec52M8bGXRpFexL/RzqjonP89/IUMkyVVqtQUvfVa1XK6UEPy
         kLKFgccNUmvKpvR79W7KkQbqGC26z3VTMh/LC8UJDAxbX1pITCvw9tZl8JJ0esnbNJX2
         VM2g==
X-Gm-Message-State: ACgBeo1CDsU9d4g4ynvAe/HB0JMAsjsDBli4Zlwr4r7cTxlhlmO29uab
        YG4SNkDICpgB4ZiLrk2Ogl2UMg==
X-Google-Smtp-Source: AA6agR5S9YLS9hTLBjiPpJ4Ms8k04xxDQPAV7b2x3cjD+0b+HLPqSTmwLa6D1Y6x82x152TjEZlwVw==
X-Received: by 2002:a17:902:cccb:b0:172:60b7:4590 with SMTP id z11-20020a170902cccb00b0017260b74590mr20507691ple.152.1660768058582;
        Wed, 17 Aug 2022 13:27:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a8-20020a1709027e4800b0016efa52d428sm320362pln.218.2022.08.17.13.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:27:37 -0700 (PDT)
Date:   Wed, 17 Aug 2022 13:27:36 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, patches@lists.linux.dev,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        David Gow <davidgow@google.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 25/27] x86: enable initial Rust support
Message-ID: <202208171327.EFF61F0E@keescook>
References: <20220805154231.31257-1-ojeda@kernel.org>
 <20220805154231.31257-26-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805154231.31257-26-ojeda@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Aug 05, 2022 at 05:42:10PM +0200, Miguel Ojeda wrote:
> Note that only x86_64 is covered and not all features nor mitigations
> are handled, but it is enough as a starting point and showcases
> the basics needed to add Rust support for a new architecture.
> 
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
