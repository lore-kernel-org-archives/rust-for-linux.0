Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5BAC25B08
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Aug 2022 20:09:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238819AbiHQUJT (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 Aug 2022 16:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241466AbiHQUIt (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 Aug 2022 16:08:49 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C19C5D105
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug 2022 13:08:42 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id t11-20020a17090a510b00b001fac77e9d1fso132588pjh.5
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug 2022 13:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=Brs/W4+fSTjZc3XGeUQqrjHBcxapIUBaWsMZSunKKfc=;
        b=YPNhOtLwlDb4HPD9RTZwy4oTOEH6iqB1SNfZ97TmEKQIH5TTutZ/SSFNGRDCBbP5Of
         Bh6ZHZ/KjIPj4nnturarCUbcM5TZ/vLn3xh/zw+KAx+Z3q8pIrH+Ursc7X87Eb0jJkpL
         98eh82JWIMNnm7/j4obeXbcQ3GNu9oC/WfZaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Brs/W4+fSTjZc3XGeUQqrjHBcxapIUBaWsMZSunKKfc=;
        b=goz6DZ+HIgO3Z9Xvwct7G1aAp6xQI1u6uR6Z86T2L/xa2t3WyQJiPWq+HiLfYHRaFi
         H7iEr3XTnQh8h5JZBRBVZ3hjT0AapwS2dWMluCDF2izaPpgbSOBw35p0ESKeisgD2geq
         60CYEReZE/wJNrY9+ICffP7KCj1vhD4ZxOLRNT29h+RZHQbQuSErBIBM+ITqR0y+iTb7
         kGAR0zBmgBk6Iv/B8ZWCD72Rh/bwKDDPdJv2YZUSxfKJIK8VgEW0bjKJvr4kMwzmPuI1
         j0aZHhhQ51z7eSPNy5mqHDrh185ZRqkrwCsI7ejN15PGYCuwUu5VFIRm1gqIs/r8G6Xg
         TtEA==
X-Gm-Message-State: ACgBeo24gWidizDNK9wBOE02vnzNe1/IGqVnTjjMpHKTcXRW8rHg5M9o
        dtcogYzHZ1pk7k3STb7e+D6/rw==
X-Google-Smtp-Source: AA6agR5SxPib9LetocQRNIM3FEcdqnApbWc6q3KkvlCH2okTt3qzIUM/nSw2U1GR+l5CPPgg4k9fMQ==
X-Received: by 2002:a17:902:f70a:b0:170:c5e7:874c with SMTP id h10-20020a170902f70a00b00170c5e7874cmr27577177plo.109.1660766921931;
        Wed, 17 Aug 2022 13:08:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b7-20020a17090a12c700b001fa9f86f20csm1943898pjg.49.2022.08.17.13.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:08:41 -0700 (PDT)
Date:   Wed, 17 Aug 2022 13:08:40 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, patches@lists.linux.dev,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>, Boqun Feng <boqun.feng@gmail.com>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>
Subject: Re: [PATCH v9 09/27] rust: add `compiler_builtins` crate
Message-ID: <202208171308.B9F3832496@keescook>
References: <20220805154231.31257-1-ojeda@kernel.org>
 <20220805154231.31257-10-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805154231.31257-10-ojeda@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Aug 05, 2022 at 05:41:54PM +0200, Miguel Ojeda wrote:
> Rust provides `compiler_builtins` as a port of LLVM's `compiler-rt`.
> Since we do not need the vast majority of them, we avoid the
> dependency by providing our own crate.
> 
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
