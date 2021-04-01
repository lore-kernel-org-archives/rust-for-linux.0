Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B7AC001B9
	for <rust-for-linux@archiver.kernel.org>; Thu,  1 Apr 2021 17:45:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6070D61285
	for <rust-for-linux@archiver.kernel.org>; Thu,  1 Apr 2021 17:45:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234446AbhDARpk (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234488AbhDARmS (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 1 Apr 2021 13:42:18 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C27D3C0613AF
        for <rust-for-linux@vger.kernel.org>; Thu,  1 Apr 2021 04:59:12 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id y32so1340885pga.11
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Apr 2021 04:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J2PRMQc8k4zw+jFR7ODKVmtgygAbe6jWzIlRO076t7A=;
        b=LFn7CldkwS7GsSPIIKULnbK2neRdVvrosgYkLt4hunC2WKkvwsUdvKEktSh2P1sLJ9
         bEA68ahgFfusz/cIdqEps2tiubyfoJMHCa9yINt+htCHcO9Gm3b2LN7I0BOBZtTOL/cV
         nSbagB1STOQ2iG1ZzA2jYRaWFpGnGKAhhaskI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J2PRMQc8k4zw+jFR7ODKVmtgygAbe6jWzIlRO076t7A=;
        b=KE02nZw1HT0MnnrQj9wb53HegQm1HcnzFBipdDnuWL6mycCFQqvmW231VYPE58Wh2M
         AJM7mN5rxE0yPjbOMCrHWmSrkP3wbtNRHuKrvAicPSnP08RuxdMxuxQ2y0/HiZI4dt0w
         jeyfA/PnmVCnFpt9s2P6QzTNAITa5MwLk/ODJ8ucvJ+/7XSMD/ZHDbDwI8jaDsnhMMK7
         r9ZxQOXSzzw9ns6lejhWdC5X0Kr2NEfdd3s4TgQOnrUFoNdwzHcttiazgB9AC/p9jh9I
         gxobI2/xJcCaKmNOMYolwHC3xUrAGTFPQu0/TgQMrzo1BDA+eV79qIJaO2zoKwYEhTsG
         CjVQ==
X-Gm-Message-State: AOAM5329y3BnlnRfgIPoyc9IXDhIRPIlAU1p019ZonTfXOd5qfb8fJkn
        u9T/x7L4pmbYgaNbCdszRU9bsnslHhnT3g==
X-Google-Smtp-Source: ABdhPJxhCSianbl2PDNzQ1dV83BKlLEprblKgWV1BvwIinoAcN/b3vzf5KTC57bfp2gEjiPP1MOl6Q==
X-Received: by 2002:a63:f70f:: with SMTP id x15mr6996520pgh.109.1617278352363;
        Thu, 01 Apr 2021 04:59:12 -0700 (PDT)
Received: from nitro-5 ([103.44.55.83])
        by smtp.gmail.com with ESMTPSA id q19sm5382635pff.91.2021.04.01.04.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 04:59:11 -0700 (PDT)
Date:   Thu, 1 Apr 2021 17:29:05 +0530
From:   Manas <manas18244@iiitd.ac.in>
To:     Geert Stappers <stappers@stappers.nl>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: Missing RUST_EXAMPLE option in linux-next-20210331
Message-ID: <20210401115905.7ttbyfv4m5haskwr@nitro-5>
References: <20210401061840.g2zzox7xy5qol7kq@nitro-5>
 <20210401113110.jihwi65ayan2ngi4@gpm.stappers.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401113110.jihwi65ayan2ngi4@gpm.stappers.nl>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Apr 01, 2021 at 01:31:10PM +0200, Geert Stappers wrote:
> On Thu, Apr 01, 2021 at 11:48:40AM +0530, Manas wrote:
> > I am working on a device driver in rust in linux-next as an academic
> > project. I used the following command to create .config:
> > 
> > $ make LLVM=1 menuconfig
> > 
> > But, sometimes the RUST_EXAMPLE option is not visible in menuconfig
> > (under /Device Drivers/Character devices/). It seemingly happens at
> > random that this option disappears, despite having a working rust 
> > nightly environment (and other dependencies).
> > 
> > My rust nightly version is 2021-02-20-x86_64-unknown-linux-gnu, with 
> > rustc 1.52.0-nightly.
> > 
> > Can someone point me to why is this happening?
> 
> Time will answer that question.
> 
> 
> Thing I would like to known if this "randomness" happens
> in the very same git branch. Does it? [Yes/No]
> 
I am not sure. I haven't checked with other branches.

-- 
Manas
CSAM Undergraduate | 2022
IIIT-Delhi, India
