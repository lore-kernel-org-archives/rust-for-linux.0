Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DD3C07E95
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Jul 2021 10:51:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96CDC61A25
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Jul 2021 10:51:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbhGGKyB (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 7 Jul 2021 06:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbhGGKyA (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 7 Jul 2021 06:54:00 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48797C061760
        for <rust-for-linux@vger.kernel.org>; Wed,  7 Jul 2021 03:51:20 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id t6so2507347wrm.9
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jul 2021 03:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/aoTDXlXnALJMl9Wxd7xok1/Pwgg+4ujvLSoM7V+DME=;
        b=Mf4Rc4fSaIhy7Eb7pDQ7YGLzqNkfmoralCbm7Zj2Azo8hiYiZE6FuOpz79xUx991ss
         tFhmgWuP5R4VCalxaY8czCxgSE6mosNbW+b4fPjNUCY7jY7ILgAtzAJgQS11IXC3ndlz
         3mDUbW1IRvu3GVUIVPk077DLMLOX/x+udOCmRi00Eq9lTB88tNC6q6Wk/q+qRw4oCwQW
         MCm50XprqalFbKMZQTNlm9yDy+wDjHUn4SLPFZTHsdBD3vIvAWKUvM2Sep06DVYowuLK
         xyqfBPN3EAhwegTVObXFr2Z/51eaeSjMJRKFzyUCxaD0sxgxIHBMD+YFQPKeE5lgnrZk
         0LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/aoTDXlXnALJMl9Wxd7xok1/Pwgg+4ujvLSoM7V+DME=;
        b=F3W37oB81J0o8dccEKhyb/1LvSuomVn1hLI9wq8HD+jELzN7SuKuYqm981r9SVDg22
         RgRkjm/eVSTJj6fuFUWwDsdQE/rkIXFSHx6HoIVBm50bSrARvzxLvaHa5Hw/NoTmoWlM
         LRqSjpSq/qDUaWIPE5TE1BD/yJQgqwbreuUVGrROpNjJ3/uISXLzlIszXALVJeLTdSUV
         sFLxqkFIXr9bdh1ie18O3qHCNVWiQfe9hEt9p8dLSK/PC5fdV/p26NRxZW3UgB2276GT
         KTHR11mr8ZYxXJ8SE10BXl/SCY0Ie2uat+5oi19fztMbsm0oYwtfZW/nKVQGLiCWCSiP
         ZqjQ==
X-Gm-Message-State: AOAM530uFW36ZzFqVbgCuztbcW/3pPNxGFVxNCZdXrfxEY9kmylJaWtZ
        fERtD4w64NiH4c3xOGheVB0Cog==
X-Google-Smtp-Source: ABdhPJw+vX2jEX6fI6DaJdUd0kdnpZdFibOW5bG0fWz9BRXFsHJ7OuCBi0RFXanBw4KcvNhXi9jVrw==
X-Received: by 2002:a5d:6dd1:: with SMTP id d17mr27175199wrz.344.1625655078685;
        Wed, 07 Jul 2021 03:51:18 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:15:13:396a:6bf2:9c33:26ce])
        by smtp.gmail.com with ESMTPSA id s17sm19500078wrt.58.2021.07.07.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 03:51:17 -0700 (PDT)
Date:   Wed, 7 Jul 2021 12:51:12 +0200
From:   Marco Elver <elver@google.com>
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/17] Rust support
Message-ID: <YOWHIHcs5/sYr/Vr@elver.google.com>
References: <20210704202756.29107-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704202756.29107-1-ojeda@kernel.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Jul 04, 2021 at 10:27PM +0200, ojeda@kernel.org wrote:
[...]
>   rust: add `alloc` crate
[...]

I think this patch never made it to the mailing list. b4 also doesn't
find it:

	ERROR: missing [7/17]
