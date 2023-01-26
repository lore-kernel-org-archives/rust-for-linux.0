Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044C2C05027
	for <rust-for-linux@archiver.kernel.org>; Thu, 26 Jan 2023 16:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbjAZQiH (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 26 Jan 2023 11:38:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbjAZQiC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 26 Jan 2023 11:38:02 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9CB4483
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Jan 2023 08:38:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F22EAB81EB4
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Jan 2023 16:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECF3C4339C;
        Thu, 26 Jan 2023 16:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674751078;
        bh=YqJQPd6i+gA5E2jZwlvWvEvyUYqWpVbVfimCUEJBLMA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qOoCtEScxidUmhC1+tzaExoii3UN3nWJNV3aPzHGU/YaZyfIVd3o6XGFZi1InXRvX
         ZK6L960rHyONjKWliHj0QfYlIKy4KlOZZrj0G84O1FOhf875jeI2kEMQ5TXxa937YD
         DVtNrjQouRjYaX9XvuOssbWQ3ogaDeCIrrCrI8W0BWhDafLXT8xsomwfy48BqokVgR
         hDpbAFDrxtwQmjZjtgJAtBjA/+MAgJCAgKrKf7DsF3vFO/Mq4QYJmb6e1tbSUQ7LZu
         mJ0wAq4rY2alqAgJCcLIfn9ukYa89IHEhjtcnk6CBgzb7fMdrWwSCSpPVQloZ/roId
         zBZgTheNaPMbQ==
Date:   Thu, 26 Jan 2023 16:37:54 +0000
From:   Will Deacon <will@kernel.org>
To:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>, steve.capper@arm.com
Subject: Re: [PATCH 3/3] arm64: rust: Disable neon and fp target features.
Message-ID: <20230126163752.GE29438@willie-the-truck>
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
 <20230125163739.3798252-4-Jamie.Cunliffe@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125163739.3798252-4-Jamie.Cunliffe@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jan 25, 2023 at 04:37:39PM +0000, Jamie Cunliffe wrote:
> Disable the neon and fp target features to avoid fp & simd
> registers. The use of fp-armv8 will cause a warning from rustc about
> an unknown feature that is specified. The target feature is still
> passed through to LLVM, this behaviour is documented as part of the
> warning. This will be fixed in a future version of the rustc
> toolchain.
> 
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> ---
>  arch/arm64/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index b53ab6aa2dfe..33ae20fc3f56 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -41,6 +41,8 @@ KBUILD_CFLAGS	+= -mgeneral-regs-only	\
>  KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
>  KBUILD_AFLAGS	+= $(compat_vdso)
>  
> +KBUILD_RUSTFLAGS += -C target-feature="-neon,-fp-armv8"

Why do we advertise these features as present in
scripts/generate_rust_target.rs?

Will
