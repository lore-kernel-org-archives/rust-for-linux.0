Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5FBC433ED
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 05:02:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41A23611AB
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 05:02:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238384AbhDPFDD (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Apr 2021 01:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhDPFDC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Apr 2021 01:03:02 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9CFC061574
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Apr 2021 22:02:38 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id j5so24424086wrn.4
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Apr 2021 22:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z6eB0W81XFyjhtb4Bf1cascTOP66PwUzd+KSO3OAPso=;
        b=M7znf+z5L8F5150UJ2PJNv3YCHDwVq7jrjCcGJYFxwCpYas++PnjVt5F4054GK9SfQ
         fkz1Sp/CH/gPE14oLF/T78EnUgwN5XZyX9BDb9Cza+bBl/+L2bab8CJe0cEtHrmxqTCg
         VtXa8A73sPd80VV8KcuCgrBdYn9QtWeEBT/WTQujgbv89ovYpgOuKMBU1HzJqQJad1Wj
         mCbz8SmgSBwbyGg7rvzzm573yqC91FHiXdtnH09BMI9jC5KlOFwQigPM+/ndtDxpgGIW
         +OB5k8dOYakXyomIRX2jB7DvKeZ0EM1gHdtDLWAmm8jmfbGocB+grc40hy6kWtJeSw6Y
         1tZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z6eB0W81XFyjhtb4Bf1cascTOP66PwUzd+KSO3OAPso=;
        b=p/2Y4Ug8iIa/3rFL09fbkcrcTbbjXDaI0gDaN8ftPQng6JkoFENdYpVdCkUOG2v2L6
         OCH7KQP6yhngy83dWUKwDCqtm60IEpmvV0ROp2Z+QNyObeUpvdWmwRhWerJMAgpw0V3L
         7Q7UWwHxiNEJyw8LBZ3HKPL0xwJJz7TZnNIEy5KHoWKVjcCkrWQKn2Z57RJHIqvSsCZm
         f9AZAZxCDFu4IGwz//gMs15KKkJXlkWfIDhIU4m3+THz5CM0r7v8KDKc4EO0fYnEcAmL
         hUHXzPEKRQWIFjVLhz62rwh97HwPpMbYxEFHg4TSDxzaBvf/2G2Pjco1EoMEfA5OqpBF
         rtNA==
X-Gm-Message-State: AOAM532P8SDANvUr5FQ3CSefP9ReabJxKjxex8Yj2fGbvp+d1S7XOu+/
        wYCJiESW7OSLmeCi3gYNt2UGQsNWXkguanY=
X-Google-Smtp-Source: ABdhPJyyOqMuoHOuA3UGgm5JCyuMO8waqJKElBjb3ciZTuPo/c2lm3jN+lhMx/bZsCjum3sE3cGHXg==
X-Received: by 2002:adf:e4c3:: with SMTP id v3mr6891723wrm.15.1618549357251;
        Thu, 15 Apr 2021 22:02:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:9d22:ab98:31ab:7a9d])
        by smtp.gmail.com with ESMTPSA id n9sm6470561wmo.27.2021.04.15.22.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 22:02:36 -0700 (PDT)
Date:   Fri, 16 Apr 2021 06:02:33 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHkaaTQ2KQML2iqt@google.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHkRvhIeO2794f7v@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHkRvhIeO2794f7v@zeniv-ca.linux.org.uk>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Apr 16, 2021 at 04:25:34AM +0000, Al Viro wrote:

> > Are you stating [what you perceive as] a fact or just venting? If the former,
> > would you mind enlightening us with some evidence?
> 
> How about "not everyone uses a browser as a part of their workflow"?

The documentation is available in markdown alongside the code. You don't need a
browser to see it. I, for one, use neovim and a rust LSP, so I can see the
documentation by pressing shift+k.

> I realize that it might sound ridiculous for folks who spent a while
> around Mozilla, but it's really true and kernel community actually
> has quite a few of such freaks.

I haven't spent any time around Mozilla myself (not that there's anything wrong
with it), so I can't really comment on this.

> And as one of those freaks I can tell
> you where exactly I would like you to go and what I would like you to do
> with implicit suggestions to start a browser when I need to read some
> in-tree documentation.

I could be mistaken but you seem angry. Perhaps it wouldn't be a bad idea to
read your own code of conduct, I don't think you need a browser for that either.
