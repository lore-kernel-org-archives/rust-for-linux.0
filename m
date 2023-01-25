Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13C9C27C76
	for <rust-for-linux@archiver.kernel.org>; Wed, 25 Jan 2023 19:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235264AbjAYTvF (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 25 Jan 2023 14:51:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235085AbjAYTvE (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 25 Jan 2023 14:51:04 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C8045236
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 11:51:00 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id nd31so34267ejc.8
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 11:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFA5p07Ex5yre1lvfG3pKJUKvLLL4slXTG41uk2+exM=;
        b=QN1RNF1pp4APWIeKqa17d7Kp93GMOiA9O7Ztb9vOj0HtQ4PMQYIUGz8QsO+cjuCEBt
         ZfKgdzyKEBRAA7H4um1c0wexXcgJLbJcW0iup/04Y3VPgklDk39LWIj19PjeQfbNe+BY
         FLKa9GixHDcSvCX9Vo8JFuS201Iehrnqq7sVHmoU5PQq3dOlEVV2useTbULI8prOHuTW
         8Bo8FmMz09n+Nv35heafdXUkEBPe/nzdEpc6a38Jv86Lo5LhuFvRu4GLsbZ2ehRuuSeS
         6prJ+0VWb9Yx0GUPGLH50g+6MKeoKfPMyKONdz+KWo3Uj5YBX9udfGsplWGq2SSngu5C
         rh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OFA5p07Ex5yre1lvfG3pKJUKvLLL4slXTG41uk2+exM=;
        b=chmJCHtrsYBc3DEZV3loXgMXmZtfhha+6DY9HFCczS2cJ6xTJs9V9/u0twK22xg9J4
         JjSUCbbWZ/BUMoJ404e2wHX9geI/5SCwQ+DdAWgj9T2Vn1U0rrLf86p3VcFrEfL+FPht
         wHR41vGdbx353cTwMWMm1f/eTtivLccOXu7SNxzdSs+9llvN62QY8DgVb7Hxgyy4H3U1
         Kq63RkUNKh0zNxr7gNl6EJ/WLhKVxqoEBdmJivlyumbVH0LPV6Fy1Xsv/iA20NVd9AG6
         5pv3U1fZdBw8upqRcbUJMRmQQT631TUNBdTf0zIdZ0slKNXsstCm0ewbgf6PQchD/J2E
         x4FQ==
X-Gm-Message-State: AFqh2kpaOOM9eG1w6zkC6DZgAQxv5GoClImGuLwEjdrceLI0CDtcToBT
        VlwMAZxdezp6mx9n4rFvCqM=
X-Google-Smtp-Source: AMrXdXvcEucHRWVu5YcGyPUyhBc0iFG7YJvMecK4wGTm/GizFIPTI8H9AET3RsgSlKvoGa/4ZdVWnQ==
X-Received: by 2002:a17:906:5914:b0:860:ef29:a4e1 with SMTP id h20-20020a170906591400b00860ef29a4e1mr32883809ejq.55.1674676259326;
        Wed, 25 Jan 2023 11:50:59 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:484e:dc99:ec59:4292])
        by smtp.gmail.com with ESMTPSA id bg3-20020a170906a04300b00855d6ed60desm2781408ejb.192.2023.01.25.11.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 11:50:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 25 Jan 2023 20:50:57 +0100
Message-Id: <CQ1J6RZOLZHV.5PUWXCVCP2LG@vincent>
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

Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
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

