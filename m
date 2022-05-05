Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE63C433F5
	for <rust-for-linux@archiver.kernel.org>; Thu,  5 May 2022 23:48:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380948AbiEEXwO (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 5 May 2022 19:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241309AbiEEXwN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 5 May 2022 19:52:13 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54C8606FE
        for <rust-for-linux@vger.kernel.org>; Thu,  5 May 2022 16:48:31 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d25so4885814pfo.10
        for <rust-for-linux@vger.kernel.org>; Thu, 05 May 2022 16:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LrHk44z4rhr+J8P+Rl2yRgTdAt0a5Ds6zMRJmsPQsTg=;
        b=lQJ3Otq3nhLCj2W3ISX1HqEVDcuEnYnmPTO2Pgahhtp8IXa34EJPxmIYEqq3XrYBy2
         YWir2n7uRXVITSB/iPQkhoCc8FBMwguoEEmXqXJH+I4z01cOaXd3ou1YYRykm5ixBmnj
         h6CfFExsGoX5saQ2m8W196HLuEvfUG7vH9ykc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LrHk44z4rhr+J8P+Rl2yRgTdAt0a5Ds6zMRJmsPQsTg=;
        b=dzkx90T1xv6e5STvEGwHzwXw6/DXQopM/Da+yNr4KYQCareyCynmWGJ2rKWYjyUKFw
         kFQ0T2cPm0rdSeEwQUemYLQjVz3rHLb+FEPu+V4JL7h/B7iwvymmrxZOIX1JeVO02b7K
         d8vsAVNBCYjnN8plqBpCnH55yrKNF3i1mJOanykJHBE0fKgKLyEQ1MjCNQTHR+INgn7S
         OQ8oFBEgK9KiyimslptGHW2YRhE8Wz2cRrTaOR+UAAbRBnqdXwajAM7G1+KtRqAFIVJr
         bwSsreutpg4yBR6qg/ii5OfZOeRh3aGuCUlSJiTIsxhIFuCLnpb1BolmRG7Dq5BIH/u+
         CwOw==
X-Gm-Message-State: AOAM531TD75+/mREGP0Dz2FsF2d+L22Y8xh2aQNZQdEvkEUg3hSo69/X
        FnT2WCFMDWwtfBzXiUwkm2G8IBVcZivM1g==
X-Google-Smtp-Source: ABdhPJwZzdK0aRzo196BP9xtL6rZgazn73Kt6i9jFhMZ+TkZuwzvzHY0agoDbi6KbW7R7hmyS02nWQ==
X-Received: by 2002:a62:d415:0:b0:50d:baaf:4156 with SMTP id a21-20020a62d415000000b0050dbaaf4156mr804485pfh.28.1651794511222;
        Thu, 05 May 2022 16:48:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a6-20020a636606000000b003c60b1f0dbasm1903053pgc.35.2022.05.05.16.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:48:30 -0700 (PDT)
Date:   Thu, 5 May 2022 16:48:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Helge Deller <deller@gmx.de>,
        Stephen Boyd <swboyd@chromium.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Changbin Du <changbin.du@intel.com>,
        Nathan Chancellor <nathan@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
        linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Gary Guo <gary@garyguo.net>, Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH v1 3/3] kallsyms: increase maximum kernel symbol length
 to 512
Message-ID: <202205051647.184C8B2@keescook>
References: <20220505191704.22812-1-ojeda@kernel.org>
 <20220505191704.22812-4-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505191704.22812-4-ojeda@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, May 05, 2022 at 09:16:45PM +0200, Miguel Ojeda wrote:
> Rust symbols can become quite long due to namespacing introduced
> by modules, types, traits, generics, etc. For instance,
> the following code:
> 
>     pub mod my_module {
>         pub struct MyType;
>         pub struct MyGenericType<T>(T);
> 
>         pub trait MyTrait {
>             fn my_method() -> u32;
>         }
> 
>         impl MyTrait for MyGenericType<MyType> {
>             fn my_method() -> u32 {
>                 42
>             }
>         }
>     }
> 
> generates a symbol of length 96 when using the upcoming v0 mangling scheme:
> 
>     _RNvXNtCshGpAVYOtgW1_7example9my_moduleINtB2_13MyGenericTypeNtB2_6MyTypeENtB2_7MyTrait9my_method
> 
> At the moment, Rust symbols may reach up to 300 in length.
> Setting 512 as the maximum seems like a reasonable choice to
> keep some headroom.
> 
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

I look forward to aiming my demangler at /proc/kallsyms. ;)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
