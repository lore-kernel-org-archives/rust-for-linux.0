Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD26C54E94
	for <rust-for-linux@archiver.kernel.org>; Thu, 26 Jan 2023 16:36:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231506AbjAZQgP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 26 Jan 2023 11:36:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbjAZQgM (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 26 Jan 2023 11:36:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819926D355
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Jan 2023 08:36:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D0F65B81E89
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Jan 2023 16:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36778C4339B;
        Thu, 26 Jan 2023 16:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674750958;
        bh=P9M1WsT0odFE4/D/lBcegMOzB3u3R3wwB2sqVG6VU2k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q3aIuP8h6z52pvcjG+2ycFtg6/aRR9hIQcg/5oPa43ql/5AAQg7qyl0oKqNtjUE7h
         3fIS9WM0/vcJ2r1pCSmrE0zkbM508zeUdcDkZRC5a2OPkNtx517iUvg7qAvwyHpL5V
         /tiXmZmbbNW1l2HrvXeeO+EE3uJAbcD6RuhXsjVIzXQOQTLj/+WC/JeEPUfj0xKp3a
         EpIhDXtJs5edvb/jTQwgiKpVA9CHZKkeJhJQd4SgbAfwub4MrPmopV4NqMdpbBhTll
         +UreoPe4q4+CG4UE06GLVTH9Xjvu02ntvfaRypIC2XPjC5YHhmhKo9I5Mgfywjajp+
         1WJheJ4IWDOHg==
Date:   Thu, 26 Jan 2023 16:35:53 +0000
From:   Will Deacon <will@kernel.org>
To:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>, steve.capper@arm.com
Subject: Re: [PATCH 1/3] arm64: rust: Enable Rust support for AArch64
Message-ID: <20230126163552.GD29438@willie-the-truck>
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
 <20230125163739.3798252-2-Jamie.Cunliffe@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125163739.3798252-2-Jamie.Cunliffe@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jan 25, 2023 at 04:37:37PM +0000, Jamie Cunliffe wrote:
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
>  Documentation/rust/arch-support.rst |  1 +
>  arch/arm64/Kconfig                  |  1 +
>  scripts/generate_rust_target.rs     | 13 ++++++++++++-
>  3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index 6982b63775da..3776059a385a 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -15,5 +15,6 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
>  ============  ================  ==============================================
>  Architecture  Level of support  Constraints
>  ============  ================  ==============================================
> +``arm64``     Maintained        None.
>  ``x86``       Maintained        ``x86_64`` only.
>  ============  ================  ==============================================
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
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> index 3c6cbe2b278d..fe0e4ba54492 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -148,7 +148,18 @@ fn main() {
>      let mut ts = TargetSpec::new();
>  
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

Why do we need to specify this stuff here? LLVM already knows about AArch64
and can compute the data-layout string in computeDataLayout(). Can we have
the tools figure this out for us instead, please?

Will
