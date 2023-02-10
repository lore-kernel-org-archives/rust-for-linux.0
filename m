Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACB9C05027
	for <rust-for-linux@archiver.kernel.org>; Fri, 10 Feb 2023 21:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233734AbjBJVhw (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 10 Feb 2023 16:37:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbjBJVhv (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 10 Feb 2023 16:37:51 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749AB60D44
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Feb 2023 13:37:50 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 87A063F193
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Feb 2023 21:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1676065067;
        bh=eC2XZoUBnGDmxKSPMrW/XXx7BIGT4mv6vf3OxAuOY0I=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=QrFzEzJEjwGHPGp/sdSsT3hLX86gjysktCvs1/TvQJvNVJnEzXYhXTG7K9bUXKP73
         wpeCQF0MjRhP3XODhkhPeLJJ5GtxAU67U2PJXPhq44kzktlQcNbC8RQXuoU9+4q0ry
         +e94CR2uHKJdvLqMO1zCicjsZTLgzxREo6mkecym1P7nqlEATO9cwJDCgdALNeGz1m
         S1iPs8FbxfAus00rPr5Qf31zHfLBPBzMFPXt2GIXH7Y/hfuANHSEwJ1sRpMs3uThF3
         L7vER17iZwEef1dAKC+VvEYMnzbx96MRxnK1BM6J5eDtAhZap7oUnIGePU/LlTHn5h
         53H6MvsfUUDvA==
Received: by mail-ed1-f71.google.com with SMTP id z19-20020a05640235d300b004aaca83cd87so4339132edc.20
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Feb 2023 13:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC2XZoUBnGDmxKSPMrW/XXx7BIGT4mv6vf3OxAuOY0I=;
        b=WpJwuLgOmgfSIfdxcHLyF7gU/AcHWA9RknPfS0XDtbOu5KIxdp6z2nRSDguPFchlMF
         /ZHV3QNBLREHJxIObg4epWA/1dSe7SggUkB4yaZRW0+zOZ1PcfJ8CYb+F5RprPzQE33Z
         rQnsG3W4fQbSBjXruF7Rv/DaTsK7dgc/dLVlJ9YE7dPHuTiHaFtlQJiDjnk2gFylcO0I
         45W1YxIGgMIH+Ru3f7+n57tkpZLsswiZoaouz5cDkWLU3dINILNTL9bsh4MNTFnyMINZ
         BATNYktsOZ/i0Ukc9A8vtw3Pghh0iPO1MZPXVBc+xuI8J+gGfRwJaxnNEVT2UltHXriR
         3JOg==
X-Gm-Message-State: AO0yUKW9ybTdCgH4Ne5ZZf7XGtmM73zXTbn/K+lQqZZ78MSky9LAe+qV
        Ws63E2XR3IIOeUbDyJkSNwhVUOFgekoJSrBoOCO40gKaa9PsKgdonCJPpHocWesMNfLE+t41auI
        UEq3gESgPLT0PhNyucaZp4IU4TJjzZtmXsXXU5Zd8SZUb
X-Received: by 2002:a17:906:d54f:b0:8aa:875d:9d9a with SMTP id cr15-20020a170906d54f00b008aa875d9d9amr19218544ejc.50.1676065067214;
        Fri, 10 Feb 2023 13:37:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9tQPWSKYHZI8inu8XKqYP5n9wE+26d1aWDJPmcuaYvCIZs5H3m4k+oT+RGH2S9Xw5DEwqt5w==
X-Received: by 2002:a17:906:d54f:b0:8aa:875d:9d9a with SMTP id cr15-20020a170906d54f00b008aa875d9d9amr19218529ejc.50.1676065067021;
        Fri, 10 Feb 2023 13:37:47 -0800 (PST)
Received: from localhost (host-87-7-128-191.retail.telecomitalia.it. [87.7.128.191])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906449600b0084d35ffbc20sm2906112ejo.68.2023.02.10.13.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 13:37:46 -0800 (PST)
Date:   Fri, 10 Feb 2023 22:37:45 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        bjorn3_gh@protonmail.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: allow to use INIT_STACK_ALL_ZERO
Message-ID: <Y+a5KQjQopSXwVPJ@righiandr-XPS-13-7390>
References: <20230210172203.101331-1-andrea.righi@canonical.com>
 <Y+aBT8AD9RXde24X@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+aBT8AD9RXde24X@dev-arch.thelio-3990X>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Feb 10, 2023 at 10:39:27AM -0700, Nathan Chancellor wrote:
> On Fri, Feb 10, 2023 at 06:22:03PM +0100, Andrea Righi wrote:
> > With CONFIG_INIT_STACK_ALL_ZERO enabled, bindgen is passing
> > -ftrivial-auto-var-init=zero to clang, that triggers the following:
> > 
> >   error: '-ftrivial-auto-var-init=zero' hasn't been enabled; enable it at your own peril for benchmarking purpose only with '-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang'
> > 
> > This flag should be dropped in clang-17, but at the moment it seems more
> > reasonable to add it to the bindgen CFLAGS to prevent the error above.
> > 
> > In this way we can enable CONFIG_INIT_STACK_ALL_ZERO with CONFIG_RUST
> > without triggering any build error.
> > 
> > Link: https://reviews.llvm.org/D125142
> > Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
> 
> If this went via the kbuild tree, would we be able to use
> $(CC_AUTO_VAR_INIT_ZERO_ENABLER)?
> 
> https://git.kernel.org/masahiroy/linux-kbuild/c/4e3feaad6ff8a7a57e3bf3308a93c93e3a2e17a6
> 
> Although, I suppose this could be a problem if the version of clang
> being used to build the kernel does not support this flag while the
> version of libclang in bindgen requires it?

I didn't have much success with CC_AUTO_VAR_INIT_ZERO_ENABLER, but maybe
a better way is to check if the version of libclang used by bindgen is
less than 17, considering that is extra clang option is supposed to be
dropped in clang-17:

https://github.com/llvm/llvm-project/issues/44842

I'll send a v2, unless we find a better way to support this auto var
zero-init feature.

-Andrea
