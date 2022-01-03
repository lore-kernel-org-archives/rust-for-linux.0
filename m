Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09228C433F5
	for <rust-for-linux@archiver.kernel.org>; Mon,  3 Jan 2022 11:21:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232941AbiACLVt (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 3 Jan 2022 06:21:49 -0500
Received: from mail-wr1-f52.google.com ([209.85.221.52]:34501 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbiACLVs (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 3 Jan 2022 06:21:48 -0500
Received: by mail-wr1-f52.google.com with SMTP id s1so69359983wrg.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Jan 2022 03:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jMlVSbHo18fMbNaJfTbz2oivsex8Tz0IhSghHLpReNA=;
        b=3Q/Oj8yT64kvNr6Z6FHZgjhysKaWnnmT0b1ySX63w3FciVIZIgPqJD1S0Gmgcicy5U
         MbDLQRiRwe1aUUQauAYIRtG83OF0LWNr6zjB8zTugjxzF57urOvk9aLpIHVc+EQ+cUTl
         B0v+IbUzIm6VoKLHj8YABZZcOrqMxMbsZVyhC/3ojG+GvGgH1xVI1F1gruL1SasmBd4h
         wjrC0qwz6H8OevkOwXtVe8TGjuLAbUptUttHCDkB6B28vTz1tEhnu5rXhWVNpxIyreVd
         LV7IT0ACaN7Lg7OGl42s9hgtOZlxmvqq/7xWrO23FSK1sfOKgpLYWAgGkWSm2GrRs9mj
         nNsw==
X-Gm-Message-State: AOAM533r48ZJT64ncdIV+K1LWfmQqtRkNwyomb9XvhQcYY0sXx/lDZan
        LPOUmEVfGbOeNb0PWfF34Lneki7N9iA=
X-Google-Smtp-Source: ABdhPJw3+wEuVs8w62vkxgDN2Ep0ZA12VPKds3ckNPENNjBPsT9MSNlFFHDwqcE99LmMSatNyQKC9A==
X-Received: by 2002:a5d:6483:: with SMTP id o3mr40373686wri.101.1641208907929;
        Mon, 03 Jan 2022 03:21:47 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id m5sm31321042wml.14.2022.01.03.03.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 03:21:47 -0800 (PST)
Date:   Mon, 3 Jan 2022 11:21:46 +0000
From:   Wei Liu <wei.liu@kernel.org>
To:     =?utf-8?B?5p2O5byY5a6H?= <lihongyu1999@bupt.edu.cn>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Wei Liu <wei.liu@kernel.org>
Subject: Re: Which linux  kernel version should I choose?
Message-ID: <20220103112146.pt32tktmjdlb7p3o@liuwe-devbox-debian-v2>
References: <tencent_78F7527A2172D4676B48757B@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_78F7527A2172D4676B48757B@qq.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Hongyu,

On Mon, Jan 03, 2022 at 06:19:10PM +0800, 李弘宇 wrote:
> Hi, I am interested in the rust for Linux project and want to learn
> about it. But I have encountered some problems with the Linux kernel
> version. 
> 
> I want to apply the patchset v2 given in the mail list. I found that
> the patchset v1 can be applied to Linux kernel v5.13. However, I do
> not find the correct Linux kernel version for the rust patchset v2.
> Where can I find this information?
> 
> Meanwhile, I wonder whether I can generate a patchset by myself so
> that I can apply it to a specific kernel version I want. I tried to
> google this but did not find anything related.
> 

You can perhaps start by following the instructions on Github.

See https://github.com/Rust-for-Linux/linux/blob/rust/README.md.

Thanks,
Wei.

> I want to join the Zulip group. My email address is
> lihongyu@bupt.edu.cn.
> 
> Thanks.
