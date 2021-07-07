Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62567C07E9B
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Jul 2021 10:19:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 448086008E
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Jul 2021 10:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbhGGKWE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 7 Jul 2021 06:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbhGGKWE (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 7 Jul 2021 06:22:04 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E105C061574
        for <rust-for-linux@vger.kernel.org>; Wed,  7 Jul 2021 03:19:23 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v5so2442148wrt.3
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jul 2021 03:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5/41QsdtJR+pnNTqK6DmTCH5qChei4s6l1r+fcxa5os=;
        b=m6Prb02gepak06rbGn1SOrXDszjWMsxxbLOuQ1T6C+rzgmxTzsqqEQkeZE4kusgddO
         SGCxMk0aV+EwydOfmYm3fU7Po9TzMU8N7feUairqdef9ja/9b4wUZE5XyuLGHqSVDFbE
         5uQpdqFIsY0AeIOTObvhB6t5ezeyTOwPs3igLCx0dKLf8Fh63Y4JrldkXKCea+Di2Bdq
         RC8h9B/KV9jhodxWABOSR+1NGb0bp7rbEsoj9xW9Bvrrqt7WPodxMa+shw1yrTAqmqfU
         k01SEnk5bdBE3FBTBDpc0tZwzjD4ZoM0bJ9IS40mZ77XZZZPI79GAnodT1lDIfFpLmSd
         sHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5/41QsdtJR+pnNTqK6DmTCH5qChei4s6l1r+fcxa5os=;
        b=loUCiFrhhn/kjIBHNHay/3kS8iR/XUFEXrJaX62RQjOIxdTZhO+jxt4NNpcN/V8kmT
         58u/j/iy3eMg8tQDW1yEKX9ZyZjswIVEPhanNzOuBkjtHLXH5Jx98HmZcy9ljfU1UlBZ
         /Cl8powCJGEbXOgLbeVjeMLSU9AzFesbaJgbyvJ2DasNYUYYM7hkumYcXSYjrbxBN+fG
         fjvd8WdG2vW+gGEjWV0arg4lmCqFR8VuKC/b5mQyHysfVjvBoNCdzR84aBQtK50BYojY
         lEnagNj2vSmCcN3TwVyT3fLM4pf65YSvn6K+QsFIeq/HodfuiqMpALHbN7oo8G2hovMw
         /oAQ==
X-Gm-Message-State: AOAM5302F8uPK8OpMzqctO9nqof9ast+9+RWzV5sp6vXF3b/5ONCfPlx
        w3Exc30PLuiysHmov12StC+Hrw==
X-Google-Smtp-Source: ABdhPJxi44xOdVggHQ7xvzV/UDlXK4xISLN+bIyKXNcKKYKwMkN8sY23lSG5BmRl84eNr3fQUnEecA==
X-Received: by 2002:a5d:680b:: with SMTP id w11mr14879170wru.426.1625653161522;
        Wed, 07 Jul 2021 03:19:21 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:15:13:396a:6bf2:9c33:26ce])
        by smtp.gmail.com with ESMTPSA id c125sm2543281wme.36.2021.07.07.03.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 03:19:20 -0700 (PDT)
Date:   Wed, 7 Jul 2021 12:19:14 +0200
From:   Marco Elver <elver@google.com>
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>,
        Yuki Okushi <jtitor@2k36.org>,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH 05/17] rust: add C helpers
Message-ID: <YOV/oj0rjHhzluH2@elver.google.com>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <20210704202756.29107-6-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704202756.29107-6-ojeda@kernel.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Jul 04, 2021 at 10:27PM +0200, ojeda@kernel.org wrote:
> From: Miguel Ojeda <ojeda@kernel.org>
> 
> This source file contains forwarders to C macros and inlined
> functions.

What is the story with Rust and LTO? Intuitively, I would expect Rust
code to only perform optimally if the kernel is built with LTO
(currently only supported via Clang).

Because if calls to every one of these helpers are real calls, I would
expect performance to be pretty poor. There's probably a reason these
are macros or inlinable functions.

I would almost go so far and suggest that CONFIG_RUST be modified as
follows:

--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2028,6 +2028,7 @@ config RUST
 	depends on HAS_RUST
 	depends on !COMPILE_TEST
 	depends on !MODVERSIONS
+	depends on LTO || EXPERT
 	default n
 	help
 	  Enables Rust support in the kernel.

[ I'm sure there are configs that don't yet work with LTO, but could be
  useful to enable for debugging or testing purposes, and therefore would
  make it conditional on CONFIG_EXPERT as well. ]

[...]
> +unsigned long rust_helper_copy_from_user(void *to, const void __user *from, unsigned long n)
> +{
> +	return copy_from_user(to, from, n);
> +}
> +
[...]

From some local tests, it looks like simply attaching
__attribute__((always_inline)) will do what one would expect when
compiling with Clang LTO (I checked -flto=thin).

If you confirm this also works across C and Rust TUs when enabling LTO,
I would then suggested adding __attribute__((always_inline)) to all
these helpers.

Thanks,
-- Marco
