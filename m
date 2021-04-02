Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088D9C433B4
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Apr 2021 01:47:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1A1C60FF3
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Apr 2021 01:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233665AbhDBBrx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 1 Apr 2021 21:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbhDBBrx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 1 Apr 2021 21:47:53 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF8FCC0613E6
        for <rust-for-linux@vger.kernel.org>; Thu,  1 Apr 2021 18:47:52 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id v23so1871227ple.9
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Apr 2021 18:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fwFai6VpiLFuZqN7/8dKd6rWFF98S/P0WgvOzYrDYI8=;
        b=WRDtODiQaf6WMMARA5BlzOa/4NAjTSPDM6cyNRnOiFxTgsqa1NV6QnvNcfo/71VTfW
         G1ySvi1ZFfYKHl63BwbjlVWTwH9Qskw1NSwx3bXUxWqslt5Sf/r0pGuVwtzDGx9wiaKh
         963CIp374gfb+6o3u/3dHkh1AGM83f/9r1Bjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fwFai6VpiLFuZqN7/8dKd6rWFF98S/P0WgvOzYrDYI8=;
        b=PC8iWNbzGlwHyw2acihmWYnGdQmoNAIInc2rzNHHLzMTessPdrfXz1EdRFOhypRzpL
         pCZ0SJub+4tQNLdzYrSFyF9aikNraW32jn4vcWlVhbhdT2WS7UEbXE9uLoP4rJ0swX5+
         EyXph5qNZU828OT+jpVEmcfIbpKKC/Xof4rkyxDu+tuB4bgEHTjLN7ONyG2IZyg32WZi
         IFdEger6ICKRaK50ZWUv7Uc1RJ8DY3aqbU03QU59AB5arUDYq1FGjl9QkGl+JvPBiuK7
         JbORPLjmkvjUf+qW+n1L8VJx/6LFIio4Bh1/HbxCAkZKNZBfIIYRmbGplHJsm8GiWCG6
         N7cw==
X-Gm-Message-State: AOAM531T2CpdC8IgbvzkBkeci+lK447EbJ+wwDn98UgvM6KEAmKBMpOq
        jrCVkOyTzhvkjjt4nrwKrpS4xQ==
X-Google-Smtp-Source: ABdhPJwVwJyh0UDxtLHVPx3lPmf0crLxQt/TgAEvBpV3GZjn9b6mjH+eTNLQdsrCBSpF5HMV2cOQmg==
X-Received: by 2002:a17:90b:947:: with SMTP id dw7mr11715824pjb.178.1617328072549;
        Thu, 01 Apr 2021 18:47:52 -0700 (PDT)
Received: from nitro-5 ([103.44.55.83])
        by smtp.gmail.com with ESMTPSA id w17sm6649405pgg.41.2021.04.01.18.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 18:47:52 -0700 (PDT)
Date:   Fri, 2 Apr 2021 07:17:47 +0530
From:   Manas <manas18244@iiitd.ac.in>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: Missing RUST_EXAMPLE option in linux-next-20210331
Message-ID: <20210402014747.k2vpzqjsibffygxs@nitro-5>
References: <20210401061840.g2zzox7xy5qol7kq@nitro-5>
 <CANiq72kjwKuRCzeB54JPpCfBO7hfzZKAoAHBtbSBAzfvZY8d0A@mail.gmail.com>
 <20210402003503.exbxsfickscdvmci@nitro-5>
 <CANiq72=heqQyTvPKopfmh+S9wFGdBECETAFNfmLjza-3rAdQFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=heqQyTvPKopfmh+S9wFGdBECETAFNfmLjza-3rAdQFg@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Apr 02, 2021 at 03:19:30AM +0200, Miguel Ojeda wrote:
> If "Rust support" (CONFIG_RUST) was not there either, it is because
> `HAS_RUST` was off, or, as you found out, if `COMPILE_TEST` is
> enabled.
> 
> The reason we depend on `!COMPILE_TEST` at the moment is to prevent
> Rust support from being built in `allmodconfig` builds in linux-next
> as a precaution until we are given the go ahead, but this will change
> in the future.
> 
Understood.

Thanks a lot!
-- 
Manas
CSAM Undergraduate | 2022
IIIT-Delhi, India
