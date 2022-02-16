Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F410C433EF
	for <rust-for-linux@archiver.kernel.org>; Wed, 16 Feb 2022 03:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245488AbiBPDqv (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 15 Feb 2022 22:46:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbiBPDqv (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 15 Feb 2022 22:46:51 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8E9E04
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Feb 2022 19:46:39 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id z17so987999plb.9
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Feb 2022 19:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zJZZ+JEvBwB9q8zo9G87rqVvPao4wt79zrPDR0URZQs=;
        b=HjdvhoRwHsPkQ16tNkW2IiyAHMTGDy1+3w54g0ZrhhyJbAjLMoax+rtJaX9WfcPm9K
         MA8m/kKSp7FZwuEAm7LLWpaHORtbYgS4sf8TLNayrH1lloGfrjZEbHQ3YYi4omS0e9iY
         U6N6zDEG3WMxdajDF3z449SYtHJ5mCkoAqMKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zJZZ+JEvBwB9q8zo9G87rqVvPao4wt79zrPDR0URZQs=;
        b=GPFftBhDk/zP3hwmi42mT+GZ67mCkYYZENRtVEJr47mGtgV1Atob7MvcAv5Xayr0EB
         +eGpWU8zyqzReAS1lFtiUt6PdwpxZCCsq7AmlBEhe2ltm2eA9/PG6015HbbP8DGF21ks
         3mT7dl/jLJCzdggJxhWUe5/5pDPERMH5UlAnrUaOFCPIgUoh3xvSlCzFauhG1qOvwDr2
         sQaSOe7sKbwW3loHcpvB85om/RldrNB6aBewHpfs01/rMBsJhMxZbonOCsc6/O8QElku
         uxi0DOfUilfq+qWCXNPrOOFjewh9/tUQJ8qFmycll/v+H32mYLsdws5k0/QBb/pP9Vt9
         8CxA==
X-Gm-Message-State: AOAM5332zn6TeQsUZY5oSWCpiZEwKTQ3Ut6ajxQWZwaex3vv1lOe23pG
        oHks6lJwmf+LDQW37o9EzSqyyA==
X-Google-Smtp-Source: ABdhPJzRWGqn9Ucp2/c4wH++iZR883Ywc2CjfsVHYVzh8jA8DkVyGoPe1vHRXkmEUyQeuk8yzeH7gQ==
X-Received: by 2002:a17:902:988c:b0:14f:2934:6838 with SMTP id s12-20020a170902988c00b0014f29346838mr955950plp.47.1644983199097;
        Tue, 15 Feb 2022 19:46:39 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:c926:4ee:add9:bf67])
        by smtp.gmail.com with ESMTPSA id b21sm19923235pji.22.2022.02.15.19.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 19:46:38 -0800 (PST)
Date:   Wed, 16 Feb 2022 12:46:33 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     pmladek@suse.com, senozhatsky@chromium.org, rostedt@goodmis.org,
        john.ogness@linutronix.de, keescook@chromium.org, anton@enomsg.org,
        ccross@android.com, tony.luck@intel.com, ojeda@kernel.org,
        alex.gaynor@gmail.com, wedsonaf@google.com,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] printk: make suppress_panic_printk static
Message-ID: <YgxzmSBZv5Q3pS9/@google.com>
References: <20220216031957.9761-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216031957.9761-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On (22/02/16 11:19), Jiapeng Chong wrote:
> This symbol is not used outside of printk.c, so marks it static.
> 
> Fix the following sparse warning:
> 
> kernel/printk/printk.c:100:19: warning: symbol 'suppress_panic_printk'
> was not declared. Should it be static?
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
