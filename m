Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C031C433EF
	for <rust-for-linux@archiver.kernel.org>; Mon,  3 Jan 2022 11:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbiACLXA (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 3 Jan 2022 06:23:00 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:36458 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbiACLXA (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 3 Jan 2022 06:23:00 -0500
Received: by mail-wr1-f42.google.com with SMTP id r17so69238631wrc.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Jan 2022 03:22:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QfTWHDgAJCvAn0AfsZWtMo8YaVsRL8EZK1oXOlEbg18=;
        b=1q2RfVcDN3FEhiMPDHWmNMaOdSyBQG63/OgrtK1HGlVevUZ1HQHrxUVXMxIHKBMfHO
         9P+EzHQ3EPQ0B6yenub856a2dPr+2odL/wrAYlgd1yuvnikw68F6CMQWFjN7eAV4zO73
         cgFPLer5ZAxlpD1KkrzzdMO1BFZxBLaG73jie31OuJqXcNtLHgeu1US3ldek7ikbepwi
         fMcHY3AQoVW6ykyCrpcU9AuVCWJzb8xBr/LwbqnX4O3EVEDILo46TuKqAW6SnvSGbMc6
         5TRclyxZ9lJM1g/rUpsOHuG+X6qmsih3ajL4S6Swm6igActmJeoDB2I42P5Upv4+65Nq
         JJ7g==
X-Gm-Message-State: AOAM532BT2PqPFFBJNrGKikIhyjtDfor6sVVmSNKvb5NxqY3mWBAkToo
        BtzkBrnBkZybJ5XDvp20Fkj+KZY5Jcs=
X-Google-Smtp-Source: ABdhPJyZdR/RcnVuBOskpbuIj1GBQCxclG/j3wFq80oq9P8rqkg80pqOYN6wH/yuh13+PlKdGYGbVQ==
X-Received: by 2002:adf:fd83:: with SMTP id d3mr36936331wrr.600.1641208979024;
        Mon, 03 Jan 2022 03:22:59 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id f6sm35769753wri.115.2022.01.03.03.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 03:22:58 -0800 (PST)
Date:   Mon, 3 Jan 2022 11:22:57 +0000
From:   Wei Liu <wei.liu@kernel.org>
To:     =?utf-8?B?5p2O5byY5a6H?= <lihongyu1999@bupt.edu.cn>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Wei Liu <wei.liu@kernel.org>
Subject: Re: Which linux  kernel version should I choose?
Message-ID: <20220103112257.mvz25qghrnsapicw@liuwe-devbox-debian-v2>
References: <tencent_78F7527A2172D4676B48757B@qq.com>
 <20220103112146.pt32tktmjdlb7p3o@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220103112146.pt32tktmjdlb7p3o@liuwe-devbox-debian-v2>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Jan 03, 2022 at 11:21:46AM +0000, Wei Liu wrote:
> Hi Hongyu,
> 
> On Mon, Jan 03, 2022 at 06:19:10PM +0800, 李弘宇 wrote:
> > Hi, I am interested in the rust for Linux project and want to learn
> > about it. But I have encountered some problems with the Linux kernel
> > version. 
> > 
> > I want to apply the patchset v2 given in the mail list. I found that
> > the patchset v1 can be applied to Linux kernel v5.13. However, I do
> > not find the correct Linux kernel version for the rust patchset v2.
> > Where can I find this information?
> > 
> > Meanwhile, I wonder whether I can generate a patchset by myself so
> > that I can apply it to a specific kernel version I want. I tried to
> > google this but did not find anything related.
> > 
> 
> You can perhaps start by following the instructions on Github.
> 
> See https://github.com/Rust-for-Linux/linux/blob/rust/README.md.
> 
> Thanks,
> Wei.
> 
> > I want to join the Zulip group. My email address is
> > lihongyu@bupt.edu.cn.

BTW your email here should be lihongyu1999@bupt.edu.cn, right? That's
the address in the From: field of your email.

Thanks,
Wei.

> > 
> > Thanks.
