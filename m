Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB31C27C76
	for <rust-for-linux@archiver.kernel.org>; Wed, 25 Jan 2023 19:56:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235876AbjAYT4T (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 25 Jan 2023 14:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbjAYT4S (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 25 Jan 2023 14:56:18 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034E45AA47
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 11:55:52 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id mg12so50633035ejc.5
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 11:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZ3GlkNEqSZl0hlg3V2peKuiP/Di3y8A8rusYKjXVvc=;
        b=n/m6HQ3kRWEm8D8NM4GkiRwsv2yOxwyx1bVa9zgyv925cLKlJo6qJz2VYYL9YyP9yF
         sXcCxkH+fB7uDZhW7/tI+d4WmiabReJ1cE3RsYv7+59Y4rqnuumg8vgRxKFnDGUtoPdX
         8xrCA+ePO4BiBOdR92EfJuhQUVX0YaJrZ2hseh1nFnQadfgEz6lpI7RE66dnGnn0yHLk
         94dTo5Ub2CuEBK/1+3vbuLZlCUTyv2cziTiBT3wMfdXc1wmwL/WBYrs2m39wWYjkfZEB
         Ck9qA5qg0caOYynWPg+YlhoyNzGmPi5TMgucZEhE4ytic4qUvKqg18J/dsZSxcVHhFc1
         G87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zZ3GlkNEqSZl0hlg3V2peKuiP/Di3y8A8rusYKjXVvc=;
        b=awjdRifSnQUQ65sYLjfspVVxqEeVI0pNjgS68TE8pcHym+1gM29K6k/tHx6c8ehlWy
         6ca2GOITGW9D/xZpJ9d1yAFMEodY3mMY2FLgmISK4KpdIfnmLrNLr+Vy8eoPoELuxZSq
         My1IYkqkt9sntS13Z2f0WQsT5nwfrnBKEp29luPUL2McpxlwmOoZqbZZorn8xrARwXoZ
         eTM5rber7EVcP7hZziamAA2KBr6CYIFqh5tmW036bQB/RmeRnpj5sANezSwcw+pb1LmZ
         pmlPscFW/vDpMHqj8sBGPA/WKZbLCtFXO0Mk/2/TGwAlt5Qmm3NyWDMw1Ue31ZR0PnKO
         /Qhg==
X-Gm-Message-State: AFqh2kqqfs7htiMjQoo/aslXl7rw7XHe2cNiXVt+z+6oJ18z9fJFd2Du
        1Ng/58KLVRWnk1EsbInqz7Q=
X-Google-Smtp-Source: AMrXdXts4dFTYTG+xZJt0rd6g1ioRCjRRGdbxY5CZjP8bHzeBE7uyQ6EY5TbokopOFcy1G3Jep6VhA==
X-Received: by 2002:a17:906:1e42:b0:7c1:458b:a946 with SMTP id i2-20020a1709061e4200b007c1458ba946mr31267762ejj.0.1674676498628;
        Wed, 25 Jan 2023 11:54:58 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:484e:dc99:ec59:4292])
        by smtp.gmail.com with ESMTPSA id w15-20020a170906384f00b008490dcae01asm2747142ejc.214.2023.01.25.11.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 11:54:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 25 Jan 2023 20:54:56 +0100
Message-Id: <CQ1J9TWLBW1M.1D77ETNZWGN1J@vincent>
Cc:     "Miguel Ojeda" <ojeda@kernel.org>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>, <steve.capper@arm.com>
Subject: Re: [PATCH 2/3] arm64: rust: Enable PAC support for Rust.
From:   "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To:     "Jamie Cunliffe" <Jamie.Cunliffe@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.8.2
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
 <20230125163739.3798252-3-Jamie.Cunliffe@arm.com>
In-Reply-To: <20230125163739.3798252-3-Jamie.Cunliffe@arm.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed Jan 25, 2023 at 5:37 PM CET, Jamie Cunliffe wrote:
> Enable the PAC ret and BTI options in the Rust build flags to match
> the options that are used when building C.
>
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>

Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>

> ---
>  arch/arm64/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index d62bd221828f..b53ab6aa2dfe 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -85,8 +85,10 @@ PACRET-$(CONFIG_UNWIND_PATCH_PAC_INTO_SCS) :=3D pac-re=
t
> =20
>  ifeq ($(CONFIG_ARM64_BTI_KERNEL),y)
>  branch-prot-flags-$(CONFIG_CC_HAS_BRANCH_PROT_PAC_RET_BTI) :=3D -mbranch=
-protection=3D$(PACRET-y)+bti
> +KBUILD_RUSTFLAGS +=3D -Z branch-protection=3Dbti,pac-ret,leaf
>  else
>  branch-prot-flags-$(CONFIG_CC_HAS_BRANCH_PROT_PAC_RET) :=3D -mbranch-pro=
tection=3D$(PACRET-y)
> +KBUILD_RUSTFLAGS +=3D -Z branch-protection=3Dpac-ret,leaf
>  endif
>  # -march=3Darmv8.3-a enables the non-nops instructions for PAC, to avoid=
 the
>  # compiler to generate them and consequently to break the single image c=
ontract
> --=20
> 2.30.2

