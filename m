Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EF0C54EAA
	for <rust-for-linux@archiver.kernel.org>; Fri, 27 Jan 2023 14:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbjA0OJJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 27 Jan 2023 09:09:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjA0OJI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 27 Jan 2023 09:09:08 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2103.outbound.protection.outlook.com [40.107.20.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741881CAE3
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Jan 2023 06:09:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdXIBOft6JRZydHGIjaws0RM5wXcMmwS8w+UVtqXg1UxvvizmXFzf5h97s0sDKpKjlhaBruAvWQ4l9RltVEQpbneFd+3dvZXBJHDdTp4qmoREpn6+1luYdGqIYfDX/xwFAN8Bdjs4F18sMv80C+iqAjBBfxaar/Z8xDUr4WKhoUVEZUJoWy7ueP+u2x/BdIM+HHi0M7vV7cN1KURLZIF2jq4FKk10nxLq328oK8faQ5E1wXgZS9xKXum3527DBk0ELAagKjaVEa4a/wheX9OreEEZNPf4xVzN3e1jocARz/v5OMyKEjAm7WBr5rR3P94gjFWYb/JWiAnjc2F5rb6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8yyV44Hyc35ubiihg9qEQ8nPAwdbSWIevRnOfcTSPQ=;
 b=iLPSFqqbzCFvRXsjYFXZHLknaIT3OOYy9WCVPKOJ00wMNjSphSdKSruN9WJtHqUVcBlpZDoCWRHmVHoF+YzZ22Uc40F2h1JngP8yqGtxUTgdVSAej/U8oPJMg0/EXCOqkTsUu/4Lyl0xH0NYAM0maQPCH08vVOQ+Hn55cmJeZFMfdOmSZYr6Q8Q1A6+yJlghrT6ZvkZSHlz7Rr0Da/c42PxS0+ZCdxgt73lrfVUNMwEM06KRGHIjcWtGkmqY7wpd4wKVnej9yhU3d8QwRBH/CtJTTtILqXEQjKuFzSzGPJPZVLWCwxQ2VJE0ANMGZUfhZ15NA1E5uLMl81DuyiPnfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8yyV44Hyc35ubiihg9qEQ8nPAwdbSWIevRnOfcTSPQ=;
 b=zYsNtwZSaGUYu2Ps8oCANx3ehNW53ToYPfxy9QHA3dVmMZLrcWHiN0oUgla72RuAaptlXdYhlqrtpywljbIgQWmggkj0IWLvCjoLW6dgoKO8rPjYekdTXU/nj13dDvp2HDI55t6QJfmQpEbVGnnv5s9COPHhjIreRurU4WTzaAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LNXP265MB2524.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 14:09:05 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b96e:93ad:4043:6145]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b96e:93ad:4043:6145%9]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 14:09:05 +0000
Date:   Fri, 27 Jan 2023 14:09:04 +0000
From:   Gary Guo <gary@garyguo.net>
To:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com
Subject: Re: [PATCH 1/3] arm64: rust: Enable Rust support for AArch64
Message-ID: <20230127140904.187953b8.gary@garyguo.net>
In-Reply-To: <20230125163739.3798252-2-Jamie.Cunliffe@arm.com>
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com>
        <20230125163739.3798252-2-Jamie.Cunliffe@arm.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0028.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::19) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LNXP265MB2524:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3aa482-f931-485c-7364-08db00700cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e3ym9VQ8Yka3oMUeluBPi/Xaz6HcuHZu8E4PiToyKxE4WO6fS5pWAYP1cf2SLfj4ktnVGxTMWZG0re+VLOIPcAEGTGD3A4Mm+BDeeCcEK7UMUYEnSn5BezMHZCHwKHDwwNXxBKrgIFqjSZZ3/lrh7MCUfCDdP5eGylAYu/8bg/7JJY4BD954xUz990rmJrzCwRPm/S2daa0qOYfh+ZpRPEouwlIzoD7Wm7YpZXLtxZ9h0YlNbiEBiIyyUVk5UYVp4p7Z1WhKm4eDV0vHupVIpxAEqZtqGhSmtl2qyy/vZ+NyFhVPgxZx1kVxkzIJDy//a3Hf9lhArCg9XSGeA9eESCF+PBONQ5mHnT92hkoMQ+qWTyd7pErLomvD1+AvohaRly44uSu8febZvFVqYVh06SJLuUiZHBW7EDPoYF9Igf3ThFdtDlg+jb4POqxer9MifNJ6ISDWDFgv7nARx850NKwfQScaAA4u08J01SAqYiAy/u3qu+x2mSDBzHp04IlmAa82cioDRwrVVypk+eG613bubLQvdq+cnYsCGTpkzP4pLWDEQS8Zb7TGPMh+ho0amlxg9g1r5v+4OMTdLRDH0iST3p46+a5DZF/mYp2hDPz1LJ2QXWV+gk0e2lNsC9iXk98kPv6CjLwdiJWWTCqfAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(136003)(39830400003)(346002)(366004)(451199018)(41300700001)(66476007)(66556008)(83380400001)(86362001)(316002)(38100700002)(2616005)(36756003)(54906003)(8676002)(1076003)(4326008)(66946007)(6506007)(6916009)(6512007)(26005)(6486002)(478600001)(186003)(2906002)(8936002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xzcx16c+ZTCN30lc23xyXQL9zPTwYdQEgkyHa6NnN/htzuQE+PO1zhv+0Gq6?=
 =?us-ascii?Q?K9PLa24unZHCrf9rrwykdruhMLz7ijQa4gu3SBlyaEAgtHovPPFcz0LZzwWI?=
 =?us-ascii?Q?nvx9uHDMnIH6Sx02b8VFCfi9qJ3vLh+8DWMTSq7YBaXqPUmw9PB9VumBdnGV?=
 =?us-ascii?Q?RQobbh5FH2X7+imo+97S/7ZhCpOsSYhqHVNwcZVKI+r11eREcqnE6a25jsHO?=
 =?us-ascii?Q?ZFgjiOPkWppfKJ4F+vtUBCkVqEJAfDTx6dR7hXb6HS5/qo3X8yVRKoM0XQMR?=
 =?us-ascii?Q?nD3zLouAgM9di3iVo2tgrE1gwU8yQ9vRwFkUzVJaT3tCRaCq/6USt8qYTYO4?=
 =?us-ascii?Q?g+NiBsk8shabokEco6IHXSsRSTDoOdGGcYxAIB8QE+qhRigAqE58FeS9Dd/9?=
 =?us-ascii?Q?TjhOgfx7QO44mqxtz+0G63sI2z+GIg6Ca9WYrspaYbPgCA/H3Ft2tJRJFGlp?=
 =?us-ascii?Q?TdHUZmMFg8WbNqa5xhrYD6PPh/j81leaWzrbn2QIXVrrwaCtIQw8GljY2hrz?=
 =?us-ascii?Q?GZn2L7ZKGrpCAaeLIy7SAuii30P2OIx9PxjnM6A9of8uaklc736VNfF05Pb2?=
 =?us-ascii?Q?B+mJ48lVGWaYOKY/MgzwQan81fMsc+2b+T41oKzcNVpHj+Wt2zmTm8q8j1WG?=
 =?us-ascii?Q?7lnXb167i/AZdjgL9SA2/EHpZk2AODBghWDHdexniIyRvOUfYdg79RJtW//O?=
 =?us-ascii?Q?3wL6OJbHto7Xn7Sxymvk680LtGZAu7GM6KDDc/KPu125qL9LRL1EkvSKCW3X?=
 =?us-ascii?Q?dkoZaPyBO+on0OX5EjfrW9m/MLz/Q8+k0lN/vxFzNJWXDPhcxvSND3Z2coHK?=
 =?us-ascii?Q?09TjZU/3qs1Bsuu5Vk6IKf8gg7ToOqYf/lg1c3Puv2sz6YZMAySz0G2imkKb?=
 =?us-ascii?Q?B6VvAcKYpvsgyn1ynOBn4zuIFOMzHXYH9Y5VdpLCesL8Br4vbN4mPY9A2RGs?=
 =?us-ascii?Q?JGisZadH3j3Su1xORNTjcl/H19FW9nU6uMZfH/+G/PoY2dr0Z7TIfV5KkyYl?=
 =?us-ascii?Q?s1xArK57YWa4fc3tu0t5k7hdi0lf9LXp9kxTL2w3SRwXGlFiH7LXdWw6tVNU?=
 =?us-ascii?Q?4nsOScQTHeKQekXi2GwpFgwfq0aoZlm0+czuur05JMuwAbCjIqbcWnIzqi+U?=
 =?us-ascii?Q?1QTpaaQ5PMpjjMVAQZGQsYOq8QgARQ4b3snhy1AXI3ZjttKdzDjBsISNetHw?=
 =?us-ascii?Q?teLqUqf0i8lhcOrh3nv7Ej0zxd0vSNtUqtGPoUYNVCZW9GxaOS+XayDlnGGK?=
 =?us-ascii?Q?YOCzYyHDaxKtpp3TzHhEQ+gUkdUuexv3ywfk/P5gKYFT8EadnkGV3Q09hr2U?=
 =?us-ascii?Q?wWHZg3AGhJToKX1+13vg3NHFOSep62Pxu+Kf9bFUJMtE6zEbhSux0SjyQPrc?=
 =?us-ascii?Q?xHjoLNh23NFbuRmDTDVDIIkpWV+rLaAKRx/rj2hGL0uzeg6uQgcfh6cs2ZKc?=
 =?us-ascii?Q?YL2xwyoC9xkRhQJ+4FyVJGuHYTNOTTbYxSlQCSaojQvBMI+E76qZTDYyGVM3?=
 =?us-ascii?Q?QlQW7pyeL5cepV742JjsNiwbbz0GqYt05xo5pqspeZvLSPyugb7cZ9j7VOgI?=
 =?us-ascii?Q?kaylg2XsLNO2eE5gTlJCgHybh7NlScUr24kJ2e3d?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3aa482-f931-485c-7364-08db00700cb2
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 14:09:05.3509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BH1kN5jna19IKNmQfoMk0xO9ATm5VONCrzH6UIa/CCMvVbSALJOiY67gC9ifpVeJgXObySGwvtv0mvb8l0ngNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2524
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, 25 Jan 2023 16:37:37 +0000
Jamie Cunliffe <Jamie.Cunliffe@arm.com> wrote:

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

Reviewed-by: Gary Guo <gary@garyguo.net>

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
> +    } else if cfg.has("X86_64") {
>          ts.push("arch", "x86_64");
>          ts.push(
>              "data-layout",

