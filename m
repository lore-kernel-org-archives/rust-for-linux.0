Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A6CEB64DC
	for <rust-for-linux@archiver.kernel.org>; Tue, 11 Jul 2023 16:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjGKQMS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 11 Jul 2023 12:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233050AbjGKQML (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 11 Jul 2023 12:12:11 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E211FE7
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Jul 2023 09:11:58 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b8ad9eede0so44102185ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Jul 2023 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689091918; x=1691683918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gKlyg81WY1Ahyf8Z4TEgmZZoIPC/F0LheVwd7/XJwxg=;
        b=S9a3gHgP1uCjVZRBcpWoA1CLnj31G1NCAYspUTQ+H7udjIiIX0cy/WdxDAqk1tml3A
         ofwTLdI2VrgN1TAonv2cA/FSKRtmo0lrllh0eXaG0HqZRH1gd61D+FrdMIc337ulTwDf
         EKqDyh0l5QbJTqNQUegbtz33egnXVJNgEwvd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689091918; x=1691683918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKlyg81WY1Ahyf8Z4TEgmZZoIPC/F0LheVwd7/XJwxg=;
        b=Ngx/Mf6/6OEcyb76CaT2pQutZF/VaHfxEyJnwY2UvMxZ2R8GawefIvfwohhZCnoCHK
         nXUbpKAbTOtU/sL/lzNDJIxyxNDGlhqCfedmz2CWEopxe6GGseciBw3rKLz85k4z1rdV
         IQPh5UqBWOy7gq9XddS0k4vEivld8kqxKEYG8UneXr19ytILrkSCt9q0lMNBkEVl6VG/
         HbnA51ebp/tPVlEdG1R99O42sCFAnWMFiTxftBdqMkOLcqBmNI+btKrc4PpcitcHHc2B
         qFIEZP2ayLbQqHKun8EKtGlEiZFxvzeMAPxSXyq1FY3rZwWOX0YD5nY62eYhLMdZIEC9
         29JQ==
X-Gm-Message-State: ABy/qLYNvNinfAY3DnAXmVjQjXgqDWITGWjakgjZq9ugddABtKoTulyY
        kBY62ZtH59rizmrDoebFVaNv6Q==
X-Google-Smtp-Source: APBJJlEUrtENyInsVOCTeanHUkQu6UdS5LjzN+KXc76SyB1fRhX8h+uTrQ0omTebC3KsSHxKHBmohA==
X-Received: by 2002:a17:902:a509:b0:1b8:76ce:9d91 with SMTP id s9-20020a170902a50900b001b876ce9d91mr14470522plq.1.1689091917989;
        Tue, 11 Jul 2023 09:11:57 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a9-20020a170902ee8900b001b6674b6140sm2102562pld.290.2023.07.11.09.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 09:11:57 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:11:56 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrea Righi <andrea.righi@canonical.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: fix bindgen build error with UBSAN_BOUNDS_STRICT
Message-ID: <202307110911.D0E735849@keescook>
References: <20230711071914.133946-1-andrea.righi@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711071914.133946-1-andrea.righi@canonical.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Jul 11, 2023 at 09:19:14AM +0200, Andrea Righi wrote:
> With commit 2d47c6956ab3 ("ubsan: Tighten UBSAN_BOUNDS on GCC") if
> CONFIG_UBSAN is enabled and gcc supports -fsanitize=bounds-strict, we
> can trigger the following build error due to bindgen lacking support for
> this additional build option:
> 
>    BINDGEN rust/bindings/bindings_generated.rs
>  error: unsupported argument 'bounds-strict' to option '-fsanitize='
> 
> Fix by adding -fsanitize=bounds-strict to the list of skipped gcc flags
> for bindgen.
> 
> Fixes: 2d47c6956ab3 ("ubsan: Tighten UBSAN_BOUNDS on GCC")
> Signed-off-by: Andrea Righi <andrea.righi@canonical.com>

Thanks for catching this!

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
