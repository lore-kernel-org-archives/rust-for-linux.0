Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05503C4338F
	for <rust-for-linux@archiver.kernel.org>; Wed, 18 Aug 2021 09:38:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E02AD60FBF
	for <rust-for-linux@archiver.kernel.org>; Wed, 18 Aug 2021 09:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232190AbhHRJiC (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 18 Aug 2021 05:38:02 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:40875 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234542AbhHRJhQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 18 Aug 2021 05:37:16 -0400
Received: by mail-wr1-f49.google.com with SMTP id k29so2459063wrd.7
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Aug 2021 02:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OmsaQZfVZCKgmnIyuoQvF1KBqWMMp1bv5AcuowfEncg=;
        b=UGEU73rDwgk88uPCE/fx19+81KQhXw75x8gUfqOEKFHgrsy5vQtBkRN2UIyj8/OCSW
         cZfXOl/COSKGlXMWt26wPcL3+9WVt0W8S+A0ZZG/w/QnujKlJ1lFTk7nAI7VdxybgYzn
         Nw18LDdRutYoRZ0lZFG4CwKfmuS3fI0ErylBMKIUqvWBM7C4Fl7Fz4hFTgvXqvG5EMSe
         sHngzjAJ+CFYaL+Ffhd4R1Y4mftTfBXzxNPN5Jo8JQ7PH7X/jDxVSXx2569B39H04MMC
         k8rTMCEZ2d8LGhbtT5uZwL26LbpD8ScZF9X6IyZYyoHdcTvu67lWsLF3Ds7eaAk+uZcr
         bTwg==
X-Gm-Message-State: AOAM533k1x6AWJo4ci+2cQ2DzAM6r+AmrVL6oaSgcgUPaeO1OFtkSY6K
        1681yxBxW8j/dxSObFld+jA=
X-Google-Smtp-Source: ABdhPJykeF1ItZ7rO/aBliqkC5cE+9DzOiPuRxtkqVBH6ksNZaPlkifx+hWuxGvrAaCV7lq1FLHo2w==
X-Received: by 2002:a5d:47af:: with SMTP id 15mr9344131wrb.35.1629279401463;
        Wed, 18 Aug 2021 02:36:41 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id o207sm2459512wme.16.2021.08.18.02.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 02:36:40 -0700 (PDT)
Date:   Wed, 18 Aug 2021 09:36:39 +0000
From:   Wei Liu <wei.liu@kernel.org>
To:     Antonio Martorana <amartora@codeaurora.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        rust-for-linux@vger.kernel.org, Trilok Soni <tsoni@codeaurora.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Wei Liu <wei.liu@kernel.org>
Subject: Re: [RFC] soc: qcom: socinfo.rs: Add Rust Socinfo Driver
 implementation
Message-ID: <20210818093639.lyse46v5wern2jem@liuwe-devbox-debian-v2>
References: <1629163412-157074-1-git-send-email-amartora@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629163412-157074-1-git-send-email-amartora@codeaurora.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Aug 16, 2021 at 06:23:32PM -0700, Antonio Martorana wrote:
[...]
> new file mode 100644
> index 0000000..8af697a
> --- /dev/null
> +++ b/drivers/soc/qcom/socinfo_rust.rs
> @@ -0,0 +1,464 @@
> +//! Qualcomm support for socinfo.c
> +
> +#![no_std]
> +#![feature(allocator_api,global_asm)]

Not really related to this patch, but I wish there was a more ergonomic
way to specify these crate level features. I think these two lines are
c&p in a lot of places.

[...]
> +/*
> + * SoC version type with major number in the upper 16 bits and minor
> + * number in the lower 16 bits.
> + */
> +const fn socinfo_major(ver: u32) -> u32{
> +    let major: u32 = (ver >> 16) & 0xFFFF;
> +    return major;

This can be simplified as

    const fn socinfo_major(ver: u32) -> u32 {
        (ver >> 16) & 0xFFFF
    }

> +}
> +
> +const fn socinfo_minor(ver: u32) -> u32{
> +    let minor: u32 = ver & 0xFFFF;
> +    return minor;
> +}
> +
> +const fn socinfo_version(maj: u32, min: u32) -> u32{
> +    let version: u32 = ((maj & 0xFFFF) << 16) | (min & 0xFFFF);
> +    return version;
> +}

Same for these two functions. They can be simplified as well.

I have one further question: why aren't these helpers implemented as
methods of SocInfo? Like:

    impl SocInfo {
        fn major(&self) -> u32 {
	    (self.ver >> 16) & 0xFFFF
	}
    }

Thanks,
Wei.
