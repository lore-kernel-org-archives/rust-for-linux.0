Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FF4EB64D9
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Jun 2023 19:46:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjF2Tqq (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Jun 2023 15:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjF2Tqp (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Jun 2023 15:46:45 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B511FE4
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jun 2023 12:46:43 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-992bc8b5c5cso84535166b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jun 2023 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688068002; x=1690660002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDx7AxVngOOrZ0U4dQp2Rt5g15Hr1TQohG2BpiJ/qbw=;
        b=bbPZjDLQiyKRVGzxYHewphWboINd+Dw6Or+fT2O8PrQmylsmt6E6lFEsJox3KS/tU9
         Pu00rzr2exNWWGAGLi52vc4gyxvNGrpXMdBDvkAZzj4fOdsFn8H2f8cb61Koj5A+jlHo
         4amm0Y//49dVYBsdgAP6x65zuwaXAw+qxWSNO4uG4qBPiXD5OVYOBI5ummjJ9y7M3hsX
         rQWfkoG9MWLOzKArKHblb13mKR7wkhgU71mMkDxcEbV8Oucr/vVv2D3g0PKT2GBpxmfw
         ycZ9ZdH47TnhE80hBFwm4LT/JhBLFZL+6SkRdncD4fQoxg17VdPI7qo8jYLEdYxxmqlD
         pplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688068002; x=1690660002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDx7AxVngOOrZ0U4dQp2Rt5g15Hr1TQohG2BpiJ/qbw=;
        b=hEx9QagRtVGA+N/pfzCJawOv29Ns+oowGgCEJvTTp+DtXLQmoVbZ5l/BwJaWccfw1G
         gbYe6/gm9ykd8Dd8O2a3O6o9dv/iaVg8XA9HMN55EFgGjzBI4TcWG3dbOqBfQRhwpAhZ
         X7sE3Bz1E8X9QrdtVZjQAnZK8Q0AVd1DByvYMEqQftzKMk9jZd5kGAw9A/fg9CYkl7OM
         jXyzOvPx9jZYrIk1We5RHt08DUXZyUhkDOQ5hYlMfhBJ8ysYjkrjMAIlEIHCMR1CDb4S
         3DDUEBBxjnXeaob9S8OrN5fL7rEvekr2Ml7iTpolmL0oo7fxVn8J+pCamV6gdocpvqOf
         KpEg==
X-Gm-Message-State: ABy/qLZBI7yhlO+R0f9+hledO31tcRgBEKMLoYc/zGVfsl5/W5CcXIcN
        u3GfPWhPzdadU2dokhdcI8T1y0xzoK0=
X-Google-Smtp-Source: ACHHUZ5fLWyhQGeC/3RJn6WgKNVDva/Zae5ciIGKyzzqKjsM+mYzynTcazRitLLyYP/haf0vvZY95w==
X-Received: by 2002:a17:906:b20c:b0:97e:32e:c1e with SMTP id p12-20020a170906b20c00b0097e032e0c1emr326132ejz.55.1688068001914;
        Thu, 29 Jun 2023 12:46:41 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id jo19-20020a170906f6d300b00992d70f8078sm151634ejb.106.2023.06.29.12.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 12:46:41 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailauth.nyi.internal (Postfix) with ESMTP id B3C9227C0054;
        Thu, 29 Jun 2023 15:46:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 29 Jun 2023 15:46:39 -0400
X-ME-Sender: <xms:nt-dZLD3IvLfUbJs8SfSFosnvS7FLEX8_ij2MIpzmnGmXJNCFKxT3A>
    <xme:nt-dZBiyocEZurYTtaL-zYxEJ3oI4yjCtbz2kDVH1_fkVWhVbzXgcs7hNeym6PboI
    hVJheWNTVfFOODAjQ>
X-ME-Received: <xmr:nt-dZGm8Wq3C2wN3OrgHPumj6i1KT8Fkcsie4JY6kGYBll_qBMp9fjCt2JM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeggddugedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeeghedvgedttdfhtefhueelgfetfffgvdfhjeduffeitdduhffgieegueej
    fedtveenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhgihhthhhusghushgvrhgtoh
    hnthgvnhhtrdgtohhmpdgrrghrtghhieeguhhnkhhnohifnhhnohhnvgdrrhhsnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomh
    gvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeeh
    heehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmh
    gv
X-ME-Proxy: <xmx:nt-dZNz6l1jvc9pPcbhX6ipJiDSqoqTvMSkLJgRSHjQe9ddgHeT9nw>
    <xmx:nt-dZAQ8K4sQociLIHmqNQIsw6hFWWoRJepT7q6z9Dqz3I50F0Sxbw>
    <xmx:nt-dZAbC6mW5c_KuhufZDpPbx4EUV1I1peDwDYEtifCIwVtR0Q26GQ>
    <xmx:n9-dZFTyuxIuOUqueY5Hr2Ewv6vODO7n4MFd4ZkU9LH-CT_F1jSKuw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jun 2023 15:46:38 -0400 (EDT)
Date:   Thu, 29 Jun 2023 12:46:13 -0700
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc:     catalin.marinas@arm.com, lina@asahilina.net,
        linux-arm-kernel@lists.infradead.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, steve.capper@arm.com,
        will@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: rust: Enable Rust support for AArch64
Message-ID: <ZJ3fhb8QYdXhGl1r@boqun-archlinux>
References: <ZINlqb3XHmz+dyLr@boqun-archlinux>
 <20230612152639.1446766-1-Jamie.Cunliffe@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612152639.1446766-1-Jamie.Cunliffe@arm.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Jun 12, 2023 at 04:26:39PM +0100, Jamie Cunliffe wrote:
> > I don't think you need "-fp-armv8" here, because "aarch64-unknown-none"
> > target doesn't have the target-feature "fp-arm64":
> > 
> > 	rustc +1.68.2 --print cfg --target aarch64-unknown-none | grep target_feature
> > 
> > 	target_feature="neon"
> > 
> > , and having the "-fp-armv8" gave me a warning at compile time:
> > 
> > 	  RUSTC L rust/core.o warning: unknown feature specified for `-Ctarget-feature`: `fp-armv8`
> > 	  |
> > 	  = note: it is still passed through to the codegen backend
> > 	  = help: consider filing a feature request
> 
> Rust removed the fp feature for arm64 and tied it with Neon. However
> this initially had a bug that meant it couldn't be disabled. This has
> now been fixed in https://github.com/rust-lang/rust/pull/107294 so
> once we can update rustc we can fix that warning by removing the
> `-fp-armv8`. Until we do that we still need the `-fp-armv8` otherwise
> we will get some floating point usage. This can be seen by doing an
> objdump of core.o if you build after removing the `-fp-armv8`.
> 

Thanks for the information (and the fix)! That's good to know. Looks
like the fix will be in 1.71, then agree, we should keep `-fp-armv8`
until we update to 1.71 or later.

Regards,
Boqun

> 
> You can also see that fp-armv8 is enabled in the aarch64-unknown-none target
> here: https://raw.githubusercontent.com/rust-lang/rust/master/compiler/rustc_target/src/spec/aarch64_unknown_none.rs
> 
> 
> Thanks,
> Jamie.
