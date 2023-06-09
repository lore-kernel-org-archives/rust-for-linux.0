Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82C3C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 18:35:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjFISfo (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 14:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbjFISfn (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 14:35:43 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2729A1730
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 11:35:41 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-628f267aa5aso14464736d6.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 11:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686335740; x=1688927740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMqDuHi9kmJ3Qek78LMK5/MKxnLaKZ049yl4ayvgcPc=;
        b=YTk3Fflc2RXkfNKmwbTgbaL/CQdXkcCH6o4nSZGt6G9RYt4axYw1lKpU88svEwCcu8
         8mEIrmT8WwxjS6bxoQwmLP0N7+R76cjUzCB7BKiYCzcfpYn2plO3YRZlMSLxte/x3ZH6
         Xrh3ecsgtMDYn2Ssx7Ho59yXXd3mLs9hyVEAvsY9YNwEI6BMzKcV9Nt2GCE34ImKUv+v
         TfukKIOdNRdMNMdVEo9/2a8FPUmxf+0M1DmUjrGnpeNDydGlJj7M18UcXAmfEzKZez84
         sLCddVsbqr0pvWo3HYA/E79/M9fDsZkuet23AGumeINe0Fd5HZurd1M9eM6OQWDJkEWH
         LtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686335740; x=1688927740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMqDuHi9kmJ3Qek78LMK5/MKxnLaKZ049yl4ayvgcPc=;
        b=G+cTscGIHXCFXnDNNhfcbwoANwa89UWJJRRuThYp8hQ5gc71Q0CHy2bgh0l0XDrjJg
         as7saKErutsgDCamTI9O7MTQptv/qtBX8paPwme9sMar8LiLOI5ZRYu+rrM6rZah+qz9
         dkbaLFCSNG6M9Cl4S9fOjj0jdflfC88hJF41XTsJqkV6FTgMYAynUiEPjvyN041RBklS
         7NIzzNla5PXHPWyMGGNbWtuLHoUhqGH+iWjnsWBDpptxJ1yrjnaPeOzSsVh/Qusak+nk
         VKjByz7cilAs45BVSyhLzjS25JDJDuWndQA4+1RQ9u9l4Lk2QwgeWkCnchsQicH8ePCD
         pQZQ==
X-Gm-Message-State: AC+VfDxcVKJg9pSZBU+K35A7hrtxM9of7z5JJ1lyFMKlIZ7a7E/7zD53
        qhjHqGPVNm6of+UGkgQYvHA=
X-Google-Smtp-Source: ACHHUZ6v99kOekoOm2uFiBT5KfZuHXhGL5KxxDc/hkzIPbuEvDQclTmhMOJq/BpbQIJSbKVfgUgx1A==
X-Received: by 2002:a05:6214:268e:b0:621:78a:dd84 with SMTP id gm14-20020a056214268e00b00621078add84mr2859042qvb.47.1686335740190;
        Fri, 09 Jun 2023 11:35:40 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id e15-20020a0caa4f000000b0061b721f27b3sm1316712qvb.123.2023.06.09.11.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 11:35:39 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailauth.nyi.internal (Postfix) with ESMTP id 3461227C0054;
        Fri,  9 Jun 2023 14:35:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 09 Jun 2023 14:35:39 -0400
X-ME-Sender: <xms:-nCDZHmzyc-0uQeUGKbp1gmUekjgyjNeIXs2c1Wr-T6zNWimuyd4CA>
    <xme:-nCDZK08olmm7FuLZj38jr00ux8WzoRHmLMr1UlzdFmuExBbcgOx_LxQrSAb4JgQ6
    mu5yOGsjI3n2_aNYQ>
X-ME-Received: <xmr:-nCDZNqbc9mRam8qbfXedeGN5MEPmr-rUBF_Qt8zFQ95DSDRjb_966q4ukA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtkedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
    udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:-3CDZPmjGnJBeBA_wjSitdl7k1DHmwANnIk4vJis0s9wUNojGOnYrg>
    <xmx:-3CDZF1LeditzW20gHVyxuCoPVPwmM4xENG2O2YQkGmjrXILfyHAMA>
    <xmx:-3CDZOtA_cXgPvQ-1TDZIf1V0krT3Q5P6MLndI5K5PQxuZYCS7PrFg>
    <xmx:-3CDZClMeFdM3d7bPwlV1NahjQxWpJT6Hg-wLwFPb0t3uS98GQlv3w>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jun 2023 14:35:38 -0400 (EDT)
Date:   Fri, 9 Jun 2023 11:34:05 -0700
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v2 0/3] Rust enablement for AArch64
Message-ID: <ZINwnUWOlZ5W3Kam@boqun-archlinux>
References: <20230606145606.1153715-1-Jamie.Cunliffe@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606145606.1153715-1-Jamie.Cunliffe@arm.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Jun 06, 2023 at 03:56:03PM +0100, Jamie Cunliffe wrote:
> Enable Rust support for the AArch64 architecture.
> 

With the following diff on the whole series:

	diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
	index 4a2c807d65db..4562a8173e90 100644
	--- a/arch/arm64/Makefile
	+++ b/arch/arm64/Makefile
	@@ -41,7 +41,7 @@ KBUILD_CFLAGS += -mgeneral-regs-only  \
	 KBUILD_CFLAGS  += $(call cc-disable-warning, psabi)
	 KBUILD_AFLAGS  += $(compat_vdso)

	-KBUILD_RUSTFLAGS += --target aarch64-unknown-none -C target-feature="-neon,-fp-armv8"
	+KBUILD_RUSTFLAGS += --target aarch64-unknown-none -C target-feature="-neon"

	 KBUILD_CFLAGS  += $(call cc-option,-mabi=lp64)
	 KBUILD_AFLAGS  += $(call cc-option,-mabi=lp64)

I've built with RUST=y and boot it in one ARM64 Hyper-V VM. Also I tried
load/unload rust_minimal and rust_print modules, they all worked.

Tested-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun
	

> The first patch enables the basic building of Rust for AArch64. Since
> v1 this has been rewritten to avoid the use of a target.json file for
> AArch64 and use the upstream rustc target definition. x86-64 still
> uses the target.json approach though.
> 
> The second patch enables the PAC ret and BTI options in the Rust build
> flags to match the options that are used when building C.
> 
> The third patch disables Rust support when building for big
> endian. Currently there is no `aarch64_be-unknown-none` target which
> would allow this. Support for this can come at a later time either by
> using the target.json approach, or upstreaming a new target definition
> to rustc (preferred). We also might be able to use the
> `aarch64_be-unknown-linux-gnu` target, however, this can be done at a
> later time.  It's worth noting that in Makefile.clang, it's
> recommended for arch/{arch}/Makefile to set the endianness based on
> arguments rather than the target triple. It's currently not possible
> to do this with rustc, a different target triple has to be used.
> 
> 
> Jamie Cunliffe (3):
>   arm64: rust: Enable Rust support for AArch64
>   arm64: rust: Enable PAC support for Rust.
>   arm64: Restrict Rust support to little endian only.
> 
>  Documentation/rust/arch-support.rst | 1 +
>  Makefile                            | 1 -
>  arch/arm64/Kconfig                  | 1 +
>  arch/arm64/Makefile                 | 4 ++++
>  arch/x86/Makefile                   | 1 +
>  rust/Makefile                       | 6 +++++-
>  scripts/Makefile                    | 5 +++--
>  scripts/generate_rust_target.rs     | 4 +++-
>  8 files changed, 18 insertions(+), 5 deletions(-)
> 
> -- 
> 2.30.2
> 
> 
