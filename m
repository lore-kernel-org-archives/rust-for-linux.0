Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B320C433F5
	for <rust-for-linux@archiver.kernel.org>; Sat,  7 May 2022 08:07:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239138AbiEGIKq (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 7 May 2022 04:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359014AbiEGIKo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 7 May 2022 04:10:44 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF8E2183C
        for <rust-for-linux@vger.kernel.org>; Sat,  7 May 2022 01:06:57 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id g184so5423284pgc.1
        for <rust-for-linux@vger.kernel.org>; Sat, 07 May 2022 01:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7mXcdOugvS2QGIiWec5ev758mbqvJnQpjgbeQ1iyVD8=;
        b=Q/KdO6FwaVDvPfl/RlvQ1lDhko5sCJTfQrMGOz5AHfJNL13H/F3AgLYVlJwF5Qm8OB
         5wwUyWHMkl7bUoP/9siCIrxQLf0dD4FU1CLM0kI0xcVjznEoAySXTbgTqR862tXg8B+z
         NEJfPbuxUJx1q/T+K2EomZqDZi9k+e3S+1Xc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7mXcdOugvS2QGIiWec5ev758mbqvJnQpjgbeQ1iyVD8=;
        b=z/RXSVbI0kMHuIAJrQe2x/tuUuZv+WJgQ+3Iy/eLUqdgC6Dlwe5fml0i8H28GVBPN3
         ylJ991XoI9LWSp+ezpUfp6gwyxx2r797IfWAgXASjcw3OI6iIgdZ0zu+QrT6sNSwiBxM
         h0rz0S9rfI4rRM5wmAgH65Q9tE3TwMJy5dOQYUy2JQqr+UC01+Xa4kV4YXuSNUMXCNcb
         oB7Zrcth9EUkXQjJLV+3T7nzQfJzQGw1OICpZhnrKarU9C4MpQeMuetznSgeshk/0IGs
         0eLYemoEjZ4LA37FBQ/auMLpj1QiasS2swcKBdChEDJpuaGS4sTxTdkUv+3Xo6rgH+aW
         aWzg==
X-Gm-Message-State: AOAM532LC7paI8HXnkN8KjMXFi4icAO9Dv6nN2XnwHcZTBZFHCyxoid7
        bbRhj1ZgiTpfM9cxf1P2wyKw7Q==
X-Google-Smtp-Source: ABdhPJxSruKTMm4cbJOoCYHD6srxtd6JM5F1DbeM/heJwHm2znVHf0vCTHdWos7r8EEnwZXdTtoNhg==
X-Received: by 2002:a05:6a00:1590:b0:50d:f473:c346 with SMTP id u16-20020a056a00159000b0050df473c346mr7436177pfk.27.1651910817067;
        Sat, 07 May 2022 01:06:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ng17-20020a17090b1a9100b001da160621d1sm4958072pjb.45.2022.05.07.01.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 01:06:56 -0700 (PDT)
Date:   Sat, 7 May 2022 01:06:56 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH v6 21/23] MAINTAINERS: Rust
Message-ID: <202205070106.36AD025A7C@keescook>
References: <20220507052451.12890-1-ojeda@kernel.org>
 <20220507052451.12890-22-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220507052451.12890-22-ojeda@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, May 07, 2022 at 07:24:19AM +0200, Miguel Ojeda wrote:
> Miguel, Alex and Wedson will be maintaining the Rust support.
> 
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>

This is easy to review. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
