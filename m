Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDCBC433F5
	for <rust-for-linux@archiver.kernel.org>; Thu,  5 May 2022 23:47:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356839AbiEEXvS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 5 May 2022 19:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbiEEXvR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 5 May 2022 19:51:17 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B3E6006F
        for <rust-for-linux@vger.kernel.org>; Thu,  5 May 2022 16:47:37 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id bo5so4888575pfb.4
        for <rust-for-linux@vger.kernel.org>; Thu, 05 May 2022 16:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WUeD15hPWbE9yoLCSewnQRLeJEfOMbMnHsMRj2V00MI=;
        b=ON7D9twBBGASskVsH0epWyeWeUqtfI88ck8O2HvE/k9j7Qb7o5myuFABitL3ivhnIT
         EoZN9A1DoynAHqRGxK5iGEa+7s677dgUgnLNRpZF5iUJNhtYWiCY4ny0yfTYb1r8v2RC
         NCEPlv2z8Oa5dnRQTMIypfwSzHsTnXsjPOUY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WUeD15hPWbE9yoLCSewnQRLeJEfOMbMnHsMRj2V00MI=;
        b=oAZwwev1eFMT3W0T1MEpPQxdi8/PisyuxerPDTHWj9onyQLjGUGBY6h4tBHOyUoYvd
         i1EieJ4rt8+yFgFMOBV6C+gAiTKG1sIt0um07avPfH1N40nc4nKyeRbku+FX8+1qPmYn
         WkaS2Y81zHr4gaKsAxY/QU/4Rpf0yArBlnZf47oPBY2XAU0YBSxHB21nxj7vp/eFv4SP
         g4FxhJLvoLyRcQYkEI+0Y+AqzpzlSGE/BiMYMRAb4ikZJO/dNHUIAD2I+CeBfhdO+9oI
         CN4EJ5YOsfJbM1k7UVDscmpJvrDu4VzZLf4mhdSnG+UiAA/3MuvE+nV1AbELjpS9jmfu
         g6IA==
X-Gm-Message-State: AOAM5305LnxHNuwj3zWmBcJt+XLbNVq0TsWd23ZbwA3s68dH1d0nyFZ1
        +8ycs8Qdk5xXxTSbSsOs8wcfPtf5TLpVsQ==
X-Google-Smtp-Source: ABdhPJxyJ0ZpbkWIDIluufCjLB0tfv4b+F5mOal0GQQ/EJ3ziZkOuCJ8ouhAePZE/2nYXlvy8g/kww==
X-Received: by 2002:a05:6a00:1805:b0:50d:ee59:b579 with SMTP id y5-20020a056a00180500b0050dee59b579mr777129pfa.70.1651794456576;
        Thu, 05 May 2022 16:47:36 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i27-20020a63131b000000b003c1b2bea056sm1864488pgl.84.2022.05.05.16.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:47:36 -0700 (PDT)
Date:   Thu, 5 May 2022 16:47:35 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, Song Liu <song@kernel.org>,
        Bixuan Cui <cuibixuan@huawei.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        David Vernet <void@manifault.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Changbin Du <changbin.du@intel.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Gary Guo <gary@garyguo.net>, Boqun Feng <boqun.feng@gmail.com>,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v1 2/3] kallsyms: support "big" kernel symbols
Message-ID: <202205051647.B5839507@keescook>
References: <20220505191704.22812-1-ojeda@kernel.org>
 <20220505191704.22812-3-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505191704.22812-3-ojeda@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, May 05, 2022 at 09:16:44PM +0200, Miguel Ojeda wrote:
> Rust symbols can become quite long due to namespacing introduced
> by modules, types, traits, generics, etc.
> 
> Increasing to 255 is not enough in some cases, and therefore
> we need to introduce longer lengths to the symbol table.
> 
> In order to avoid increasing all lengths to 2 bytes (since most
> of them are small, including many Rust ones), we use ULEB128 to
> keep smaller symbols in 1 byte, with the rest in 2 bytes.
> 
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Co-developed-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Looks good to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
