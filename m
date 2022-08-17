Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5320C32772
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Aug 2022 20:12:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240665AbiHQUMn (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 Aug 2022 16:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240646AbiHQUMm (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 Aug 2022 16:12:42 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8029A6C2C
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug 2022 13:12:40 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id c24so12866804pgg.11
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug 2022 13:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=+WRGNlWofKlOiDjgaSTNb/H9kbNSywL6IxTX7zzIueA=;
        b=fMRhV1gD0LiWPslIdJd3Oay33CI1Qjzc9fxrxo1rMAcTxyGfF+9i+S4mdI5O7WkvEZ
         pi/Ze5jSG8mJRZ5c9znxeN8yUWNpDYVrR9pyvY6pVf4TLt8fffmT0CMXEqCcyLCBGZzT
         feSoTwBjHSuD+PY2QeZCOih3yziojt2d2o8bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=+WRGNlWofKlOiDjgaSTNb/H9kbNSywL6IxTX7zzIueA=;
        b=WcIw8NCgCm88k/Jn3XdTvmvk7pO/x1n3m1lq0jvoK+3AFgTl0cnfVz++Fx/AKwtpQY
         Wf67QUkCmPZhj3vWh3jtM2+noqVDctEAe+z2ZkE00A82oYURwST95EAljMSB2IZy0Svu
         8pVUl2HM+2lhvN0ZeH03n5+35g4kDKMjAmv31LDZDtbSZ/sIeRS1xOd/dBO6ElnQhj+q
         ZfhYodaDUngbOJF0sp9UX1vDMPeZkduzyS1Fw3CS65/oCrHl4I3y/X5Zf0lymbySh/pD
         kJFfKeziNWulXYvq12KavnVg7Hq/skVbI0rQ+I3d073/vzcqd1Gqj4UwIq/471Z4Z65P
         ux5w==
X-Gm-Message-State: ACgBeo1vjBlmV07Y2VMxWDRMWfmjKnovW9milYed9lLK/bocE1vTaE5t
        pFKMOuIR+WFLOcJyyWHxsmvTtw==
X-Google-Smtp-Source: AA6agR6zH+/TwyGgpZzTC8h5baBczzUM6S76Zm6Lt7mPjCgTSRD1ONJNatmSLrsIE45J9d/eErae6g==
X-Received: by 2002:a63:1841:0:b0:429:8268:1fc with SMTP id 1-20020a631841000000b00429826801fcmr10651647pgy.78.1660767160381;
        Wed, 17 Aug 2022 13:12:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h18-20020aa796d2000000b0052d4afc4302sm11215205pfq.175.2022.08.17.13.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:12:39 -0700 (PDT)
Date:   Wed, 17 Aug 2022 13:12:38 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, patches@lists.linux.dev,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH v9 16/27] scripts: checkpatch: enable
 language-independent checks for Rust
Message-ID: <202208171312.1CB3606F0C@keescook>
References: <20220805154231.31257-1-ojeda@kernel.org>
 <20220805154231.31257-17-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805154231.31257-17-ojeda@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Aug 05, 2022 at 05:42:01PM +0200, Miguel Ojeda wrote:
> Include Rust in the "source code files" category, so that
> the language-independent tests are checked for Rust too,
> and teach `checkpatch` about the comment style for Rust files.
> 
> This enables the malformed SPDX check, the misplaced SPDX license
> tag check, the long line checks, the lines without a newline check
> and the embedded filename check.
> 
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
