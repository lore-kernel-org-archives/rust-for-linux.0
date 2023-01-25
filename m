Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FF3C54E94
	for <rust-for-linux@archiver.kernel.org>; Wed, 25 Jan 2023 19:57:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234999AbjAYT5U (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 25 Jan 2023 14:57:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234493AbjAYT5T (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 25 Jan 2023 14:57:19 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878595CE5A
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 11:56:58 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id vw16so50619888ejc.12
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 11:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/n7FMw2izoFAF0zF8gcPKkWqw/ikmCn+hkqZ0Ews2g=;
        b=cFg56iOHRqis/dwdI6BH8bz5bPYmpDKNdDzacZZ5PuB77sm7QXW0+JHkv3jzqbNwS2
         iXKrExGT5QCEAtDpLaI76L8j13kOA+pkT8HHZo/DPqnDwZGjrUK8XBvC/puOw4osrBjt
         UMvJuvVzXSngPybZm/MokPsp/usH3DatLQ6TiIQsUufSP0WC72RFzQwcF67CWLoKl7ZK
         LXZMuCJWRNyJgyBYmLXm0R453RoE/zgDHq+SvCOuqMVFe4ofw8RaLAnBok0cn75HQEsw
         PvaBr5FPQOsY37o7J121I7GvPtQ1Lze85XjYeYBH5BJPV+xC4SsgM4XBUJXkkjTiFdBF
         FEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R/n7FMw2izoFAF0zF8gcPKkWqw/ikmCn+hkqZ0Ews2g=;
        b=t0y+fuJabMnY4RfHbQvLZqqbXSoZzEmPkO2EEtpLYB57CC1ZOxDl/A0sMUUZLm8/Si
         aQ/0bYA38VDu6ePM81O8EITmj6Ptz97EGKy/0qsP800FWM1DMemhXgF0VDKcYhtbleeM
         VaYoLyJUH4quiZuItLct1596MV8swoD/xVL70gpCt+dXqeZf85Ryi0uaYiEIMHavdE31
         hJ5VnpDKmjljuU393SC/mqx1PlhLX/5Id3HojDNIn21iFiq+zgRZNDB+NYvrWRR6gls7
         a/L4Np0aLTJl6FR9G1l59sERkovK6WPlLGtUygnOjlm32Ov11ly44oS6p9ldxnftloWN
         FLzQ==
X-Gm-Message-State: AFqh2kpseHkrHRCYT4C/YY1S9v4RyrWJFUGCSN5lw8fPMTnF+oeAqDUY
        OnrhX2L8bm+lUoajlIfJWwNdDR9R7SsGIU/c
X-Google-Smtp-Source: AMrXdXvq5RRP7rjWclvuNBkqegNVTBtmzcGUGgLTUU8M1j9FDHfr3xpd87/u8Wq3+ObGUAbZMAc+KQ==
X-Received: by 2002:a17:907:a506:b0:873:901:4f23 with SMTP id vr6-20020a170907a50600b0087309014f23mr39013543ejc.24.1674676618170;
        Wed, 25 Jan 2023 11:56:58 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:484e:dc99:ec59:4292])
        by smtp.gmail.com with ESMTPSA id ka11-20020a170907990b00b007aea1dc1840sm2759233ejc.111.2023.01.25.11.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 11:56:57 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 25 Jan 2023 20:56:56 +0100
Message-Id: <CQ1JBCUR6UDV.QSH5349UBR1G@vincent>
Subject: Re: [PATCH 1/3] arm64: rust: Enable Rust support for AArch64
From:   "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To:     "Jamie Cunliffe" <Jamie.Cunliffe@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <rust-for-linux@vger.kernel.org>
Cc:     "Miguel Ojeda" <ojeda@kernel.org>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>, <steve.capper@arm.com>
X-Mailer: aerc 0.8.2
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
 <20230125163739.3798252-2-Jamie.Cunliffe@arm.com>
In-Reply-To: <20230125163739.3798252-2-Jamie.Cunliffe@arm.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed Jan 25, 2023 at 5:37 PM CET, Jamie Cunliffe wrote:
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

Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>

P.S: wrong answer template in the prev mail :)
> ---
>  Documentation/rust/arch-support.rst |  1 +
>  arch/arm64/Kconfig                  |  1 +
>  scripts/generate_rust_target.rs     | 13 ++++++++++++-
>  3 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arc=
h-support.rst
> index 6982b63775da..3776059a385a 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -15,5 +15,6 @@ support corresponds to ``S`` values in the ``MAINTAINER=
S`` file.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  Architecture  Level of support  Constraints
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +``arm64``     Maintained        None.
>  ``x86``       Maintained        ``x86_64`` only.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 03934808b2ed..fc3800e82802 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -209,6 +209,7 @@ config ARM64
>  	select HAVE_FUNCTION_ARG_ACCESS_API
>  	select MMU_GATHER_RCU_TABLE_FREE
>  	select HAVE_RSEQ
> +	select HAVE_RUST
>  	select HAVE_STACKPROTECTOR
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_KPROBES
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_targ=
et.rs
> index 3c6cbe2b278d..fe0e4ba54492 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -148,7 +148,18 @@ fn main() {
>      let mut ts =3D TargetSpec::new();
> =20
>      // `llvm-target`s are taken from `scripts/Makefile.clang`.
> -    if cfg.has("X86_64") {
> +    if cfg.has("ARM64") {
> +        ts.push("arch", "aarch64");
> +        ts.push(
> +            "data-layout",
> +            "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128",
> +        );
> +        ts.push("disable-redzone", true);
> +        ts.push("features", "+strict-align,+neon,+fp-armv8");
> +        ts.push("llvm-target", "aarch64-linux-gnu");
> +        ts.push("max-atomic-width", 128);
> +        ts.push("target-pointer-width", "64");
> +    } else if cfg.has("X86_64") {
>          ts.push("arch", "x86_64");
>          ts.push(
>              "data-layout",
> --=20
> 2.30.2

