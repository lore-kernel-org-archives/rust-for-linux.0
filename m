Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A001AC27C76
	for <rust-for-linux@archiver.kernel.org>; Wed, 25 Jan 2023 19:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235528AbjAYT4z (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 25 Jan 2023 14:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbjAYT4y (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 25 Jan 2023 14:56:54 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF06F7D89
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 11:56:24 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id vw16so50612178ejc.12
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 11:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOl9PjUfPHf2zE8mHzj4/btM+NtpuXAGnr0FmOz57aM=;
        b=qtR7LXkirl6wKBCPEVNammusJ1qhrw6PE/SMr7n2DjetQbgFH4ZD5X/YB8tWUjJY6W
         gSkY9UVlDNkoqLVXenvwxW+5FWvqXy6oJh9b4jY8vNf6rYNyr1pcSGMBPe3gz8ggq9mn
         GLnkXwp189tN3i3gCCIxPMVo+8Mgll+wxuRLb6M9nABoRJADWKIFDnIWFt4Wh6OdMP7E
         nZZVZAReNWb5shGFdWNqJ2N+vlaxvaWx8gsy/eiC2OYZdCeS1VKi6yUmFu6J1sBp0wJa
         ZOZZSlFJj2YT5F7X3O1FeIGuAiq/ubu8XOXc+65M4RYNhgiy8ASu67QwSjQFsz+IVQPb
         lx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UOl9PjUfPHf2zE8mHzj4/btM+NtpuXAGnr0FmOz57aM=;
        b=QsMZ5GXAZGCBDmQn9pMI5pJF//3TlshZo56h4clixMPOJJSD1mn7QvuG5ar7Hs3h94
         4s5SW01E1dhYgCOnYI88vonzmaaOc1QIuTOIR0oTA/CkXMkF4EMeaMMAzUiLGVVnCZqb
         0KpxSj5cZaMVf1Z53tLw8QIPWSiSu+XdgfnO9E2xAruWEFug5R5vHrX3H+Z5ZHfxh5Zn
         05ESB3LHdBW0puYWYFuvDxc2HBCNcwo/0BUyZW7a8I3ibeyAm0BVRCcUkqHbcuGTtXVm
         C2a+XSqyus7IgzcwKusOQeC5cNsmTcxW/wxcGE4le0IynGhtA0QCuz/DF0Q2zSnsCDzT
         nqVw==
X-Gm-Message-State: AFqh2krgPYSiXnR8t2+pa3SdH8KbG9OEHbpmQXxWHaD3/xboc+ZIj2sp
        oUKAdW5PQk3wJRFKvWm0ZO2QNho82sy51KrY
X-Google-Smtp-Source: AMrXdXuQTsi8pGKM8DrgwVFAaBNyjOfQn8TQSclyvogC3V7lDj0iyGtKFn8QSaFX4fpE7h1Go20EGQ==
X-Received: by 2002:a17:906:d8a8:b0:84b:b481:6188 with SMTP id qc8-20020a170906d8a800b0084bb4816188mr31605315ejb.64.1674676544429;
        Wed, 25 Jan 2023 11:55:44 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:484e:dc99:ec59:4292])
        by smtp.gmail.com with ESMTPSA id h12-20020a17090634cc00b008717a377125sm2769533ejb.85.2023.01.25.11.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 11:55:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 25 Jan 2023 20:55:42 +0100
Message-Id: <CQ1JAF0JNEKI.1LAPS4TXTVODQ@vincent>
Cc:     "Miguel Ojeda" <ojeda@kernel.org>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>, <steve.capper@arm.com>
Subject: Re: [PATCH 3/3] arm64: rust: Disable neon and fp target features.
From:   "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To:     "Jamie Cunliffe" <Jamie.Cunliffe@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.8.2
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
 <20230125163739.3798252-4-Jamie.Cunliffe@arm.com>
In-Reply-To: <20230125163739.3798252-4-Jamie.Cunliffe@arm.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed Jan 25, 2023 at 5:37 PM CET, Jamie Cunliffe wrote:
> Disable the neon and fp target features to avoid fp & simd
> registers. The use of fp-armv8 will cause a warning from rustc about
> an unknown feature that is specified. The target feature is still
> passed through to LLVM, this behaviour is documented as part of the
> warning. This will be fixed in a future version of the rustc
> toolchain.
>
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>

Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> ---
>  arch/arm64/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index b53ab6aa2dfe..33ae20fc3f56 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -41,6 +41,8 @@ KBUILD_CFLAGS	+=3D -mgeneral-regs-only	\
>  KBUILD_CFLAGS	+=3D $(call cc-disable-warning, psabi)
>  KBUILD_AFLAGS	+=3D $(compat_vdso)
> =20
> +KBUILD_RUSTFLAGS +=3D -C target-feature=3D"-neon,-fp-armv8"
> +
>  KBUILD_CFLAGS	+=3D $(call cc-option,-mabi=3Dlp64)
>  KBUILD_AFLAGS	+=3D $(call cc-option,-mabi=3Dlp64)
> =20
> --=20
> 2.30.2

