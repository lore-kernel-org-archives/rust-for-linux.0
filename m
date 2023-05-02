Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E646C77B73
	for <rust-for-linux@archiver.kernel.org>; Tue,  2 May 2023 13:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233800AbjEBNzB (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 2 May 2023 09:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233664AbjEBNzA (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 2 May 2023 09:55:00 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF301A6
        for <rust-for-linux@vger.kernel.org>; Tue,  2 May 2023 06:54:57 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: lina@asahilina.net)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 497514214F;
        Tue,  2 May 2023 13:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
        s=default; t=1683034882;
        bh=qWh55zfvCU7gQ/+dF7ioBk7Jhw8kt+ak42osuVziVwM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=eQ5v8BWWfGJnPvEJYuQvNS+9/XOEHPj4Sgm8HfB0SN4AIV5y0BzghjwoK34WeZQyp
         sgt4go71XaxaeLoYts3RPFmBItQyvwt1f8YbcypDVLRZ91nT42cdkgT7BSpkBTKuLf
         FmU031lLzKMJPTh8QM5+kyVJvQb//8SyOgCWUZoHYomp7HQ21AdF2xEt10Trgde1gS
         UBCide2C8zBIs543LxzXTRdPxqMOwHiCDpwWK6QowMj1C1TYcn85JK+dD1uHF+n0t5
         8T2G3ich/y93d2caUP74kqNYxhTiqdaG5xQ9RYgCz8BWovRaR2lQC91PbMepHxHTdM
         mERUNRXESZ3kw==
Message-ID: <ededb7f2-05ef-412e-cb6e-87acc936bb29@asahilina.net>
Date:   Tue, 2 May 2023 22:41:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] arm64: rust: Enable Rust support for AArch64
To:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
 <20230125163739.3798252-2-Jamie.Cunliffe@arm.com>
Content-Language: en-US
From:   Asahi Lina <lina@asahilina.net>
In-Reply-To: <20230125163739.3798252-2-Jamie.Cunliffe@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi!

On 26/01/2023 01.37, Jamie Cunliffe wrote:
> From: Miguel Ojeda <ojeda@kernel.org>
> 
> This commit provides the build flags for Rust for AArch64. The core Rust
> support already in the kernel does the rest.
> 
> The Rust samples have been tested with this commit.
> 
> [jcunliffe: Arm specific parts taken from Miguel's upstream tree]
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Co-developed-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> ---
>   Documentation/rust/arch-support.rst |  1 +
>   arch/arm64/Kconfig                  |  1 +
>   scripts/generate_rust_target.rs     | 13 ++++++++++++-
>   3 files changed, 14 insertions(+), 1 deletion(-)
> 

I'm curious, do you have a timeline for submitting the next revision of 
this patch? We're trying to aim to upstream the drm/asahi driver for 6.6 
or so, but that would depend on CONFIG_ARM64, so it would be lovely if 
we could get this in for 6.5 (and it looks like there shouldn't be too 
many issues left) ^^

~~ Lina

