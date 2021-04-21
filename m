Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D57AC433ED
	for <rust-for-linux@archiver.kernel.org>; Wed, 21 Apr 2021 16:33:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A52761439
	for <rust-for-linux@archiver.kernel.org>; Wed, 21 Apr 2021 16:33:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241136AbhDUQdy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 21 Apr 2021 12:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239718AbhDUQdx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 21 Apr 2021 12:33:53 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDD5C06174A
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Apr 2021 09:33:20 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id v3so45550399ybi.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Apr 2021 09:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kvpfkdgYLamRWRr18f/s/H/y2dse+Qu1zR55l+2Htog=;
        b=iK4rdL3KaMAojKhK165fvrfaYRFPMdsqxfqflqB+FgFX2431oeWSXgHAYTooL4lVWy
         n6fh6/+jPI2yjzAyJjztVLGOTZPY/2ST97ZpzSKQDW1RnJ76kfvBKwYxkfa4N6eQAhqb
         Ywjdbn30bGLt1YPj47/NdaUq58nd1WhLfWtvRdC/O64XWsbGg7vnVAqm0CHxmwAzULX6
         m1UmTYdQEP+LsLUtRLmVy2BUCwQr/6qxAFOqMup7ylQo3hP6onpvyLupZSnPaeyn5QNE
         ZhxMEczYcrV9rhl3lLsSuGQ9G+alClvv79Ph+IVhiVA15gd154oedNeTmuwAWN9M56A7
         nSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kvpfkdgYLamRWRr18f/s/H/y2dse+Qu1zR55l+2Htog=;
        b=EHyOe2qKZKYRLoGqUC9Fc0r8a8pt/i4cJ509KzEI57nnNCQaBW8iH85nGx6/KfdoeD
         nyeyXdNSNf9EA/HxytA2W6PMKxC3yLnJdK764BTIH6yIY+RYeQFroaMhQ612unmrUUhH
         T+DnXx8ZMW+BkJh+7XGC5M8GUVHyt0zQmStgv0TJzjrCVif5/oyzSJQEwRYKqrfmwZ86
         /S0GhOkq+O8tx4Q1h7qEEHKwbgJ89ZPdRy7x5t4jPU4wPMKg3ZSRVcYmjtzD/1+6MT5M
         zYTA+bvtQ7xjALjsL2zFw4KjrW0NQNoRBsNpFZeuAzfvQc+/t2lleZZVVrO6lsvqiRZl
         2R/A==
X-Gm-Message-State: AOAM530a4fb03bCdPgunCOjPNnlACd6iI2QisVjNjfkQoWzPtonBbkH7
        7sCrhW/R4XCQmdG8oP+nL3MLoSGkp8WrAhH8qPs=
X-Google-Smtp-Source: ABdhPJwDvz52bqi/6EKrgbypLrsOOrocLIGCZkseUOP1aG2ZRkKTK6DqbYBhnfc86xk/Atm/3fnhxqrhWSQLQ82sf/s=
X-Received: by 2002:a25:7909:: with SMTP id u9mr31055979ybc.22.1619022799759;
 Wed, 21 Apr 2021 09:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210414033551.GA28117@bobwxc.top>
In-Reply-To: <20210414033551.GA28117@bobwxc.top>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 21 Apr 2021 18:33:09 +0200
Message-ID: <CANiq72keQ6pEDrKvQcFCa=j=TWs0XNHGf4PtnRNvzLanUe=1Rw@mail.gmail.com>
Subject: Re: [Rust-next PATCH] rust: doc: Replace a ref tag in doc-guide/kernel-doc.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Apr 14, 2021 at 5:36 AM Wu XiangCheng <bobwxc@email.cn> wrote:
>
> replace a ref tag to normal path tag in doc-guide/kernel-doc.rst
>
> Link: https://lore.kernel.org/linux-doc/87lf9lrgp3.fsf@meer.lwn.net/
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>

Queuing it, thanks!

Cheers,
Miguel
