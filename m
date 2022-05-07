Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B28C433F5
	for <rust-for-linux@archiver.kernel.org>; Sat,  7 May 2022 09:23:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383979AbiEGJ06 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 7 May 2022 05:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383982AbiEGJ0z (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 7 May 2022 05:26:55 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7EB4EF72
        for <rust-for-linux@vger.kernel.org>; Sat,  7 May 2022 02:23:09 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id w5-20020a17090aaf8500b001d74c754128so12892893pjq.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 May 2022 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ocCDoyGiSy1GdWrHu5CjFRRUzgHkg0CZyH7/vS7PmVg=;
        b=PlI3z0yq2ISTxCAfw67M32w7ZLLVYK6FDfA1HHYzyBFcnRmEtCexMsELLaKsqrARGJ
         BbfNzbcN8Z3tAtL9lDmq7L21CmgLskN47R0GQEW2MlqoHKww78KcdOkwzrngw8d7YJPe
         K6AzBN3lSusWlmnqoTCq/K/l9L93IGgTF2hJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ocCDoyGiSy1GdWrHu5CjFRRUzgHkg0CZyH7/vS7PmVg=;
        b=FX4aHjTH3ef8L3kDEJiqhUSEDq5cj82sXvc24LU8+EUUOpHqrePAhrrBiwyHjCZsVd
         /IFC8FxxG3ZwlB1RrB2sj2UFwmEUU7DvkgoRCjKJw/wKQb+jwZBkhHBEhQppvS5IV5hD
         +qoHL4pbqIglRE4y8y+mg0lzxxs4CeirxbbdmdDZXRuO5IlAerKtrKwG8+gbaG16C6dw
         AN6qWtEy1g0Tb/CiQm8/+n36qgr7JrY1Y5m+GoE2LSlGvUusNEHY3zP0WcrSnV9XAhKw
         eu19kpsoHhPNPW8+VK+2rtjQ5ZI+zZwZkdskkLPjgJDIOdPJwv3WHb+22HFPlhQDtNOW
         WSIA==
X-Gm-Message-State: AOAM531P7RCexqOi9z8bXXvheEzFQw5M2haUlgvL14qfJ282Di7gFla9
        SCyqUKRJvBYBdm6aGntiZGZXpw==
X-Google-Smtp-Source: ABdhPJyLHkvHes6TtzlOPrA5G3JwBYupi+1Lwa2I0beUXgtwuv2eqvmXIpSdBbj6R+57Q0uXuwlYNw==
X-Received: by 2002:a17:902:b948:b0:153:9994:b587 with SMTP id h8-20020a170902b94800b001539994b587mr7807093pls.68.1651915388553;
        Sat, 07 May 2022 02:23:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b0050dc76281c6sm4769532pfo.160.2022.05.07.02.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 02:23:08 -0700 (PDT)
Date:   Sat, 7 May 2022 02:23:07 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH v6 07/23] rust: import upstream `alloc` crate
Message-ID: <202205070214.AC7C566@keescook>
References: <20220507052451.12890-1-ojeda@kernel.org>
 <20220507052451.12890-8-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220507052451.12890-8-ojeda@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, May 07, 2022 at 07:24:05AM +0200, Miguel Ojeda wrote:
> This is a subset of the Rust standard library `alloc` crate,
> version 1.60.0, from:
> 
>     https://github.com/rust-lang/rust/tree/1.60.0/library/alloc/src
> 
> The files are copied as-is, with no modifications whatsoever
> (not even adding the SPDX identifiers).

$ cd ~/src/rust
$ git checkout 1.60.0 -b krust
$ git submodule update --init --recursive

$ cd ~/src/linux
$ b4 shazam -P _ 20220507052451.12890-8-ojeda@kernel.org
$ cd rust/alloc
$ find . -type f -name '*.rs' | xargs sha256sum | \
	(cd ~/src/rust/library/alloc/src && \
	 sha256sum -c -)
./raw_vec.rs: OK
./str.rs: OK
./boxed.rs: OK
./alloc.rs: OK
./fmt.rs: OK
./slice.rs: OK
./borrow.rs: OK
./vec/into_iter.rs: OK
./vec/spec_extend.rs: OK
./vec/drain_filter.rs: OK
./vec/mod.rs: OK
./vec/set_len_on_drop.rs: OK
./vec/is_zero.rs: OK
./vec/drain.rs: OK
./vec/partial_eq.rs: OK
./lib.rs: OK
./macros.rs: OK
./collections/mod.rs: OK
./string.rs: OK

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
