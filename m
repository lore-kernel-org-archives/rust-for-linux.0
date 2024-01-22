Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9DC4C6F
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 05:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705901287; cv=fail; b=oEHCj/DI9xZFea7qs977dP5L7HBs30F6MeChpg9Y4hEgzkkytO9LkQrC3v0AIqXniw/dKj9Qi7gHK7++AzURw9w1v2jrRTli0l++TtbVDzrus+aW+t++x/Wj7fsg2q+Rtbt75st7o1qPCCnBS5H+DKH9h3O28gsAvu/D805q0bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705901287; c=relaxed/simple;
	bh=Ja4J9E8AqzNCvl3O9+a2/Ccxq6y+5OBvHHoXuW8yq/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T5o8g7j4OldoszFmmB0RR2wOFwLSO7C/AQIxF/psqTdImiu+EoulxRwG0qiPBItuoO+i94wwbB+XE/O74x2jacB43yLdQlkRc3/3Ylq/dF1DAwCMVkCWVA/1EfZP3RM1XLM6bq0IijESS2ztgJYtbPsrAyMm3vTgd2SeZ54ijL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=VmkH9whN; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="VmkH9whN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyEd9kMOsC2JzE6r4KQ+c5FG9K3XPDVMFwhHxPgXsul3DTjDWLJ+8GF3eGwxDagoFJpbb3I5vh1yfLzGf4ObJ8Bw6gh0eFh4hF1HkTYXvV9YbHe2s4cNhcdOuv2t1w3LpLqw9prcrso0w42sW8r/OZy6AlKOKQRCDZJVTvDy7K0Ssj++tuc1kgUusSqJr3+aVj2ohwWyw0ICPgEMCsBa5hGQj46O0qHIr2tFHBMXQjurxVLVq9poZcah/+kRiBNojI0ZJfTJ4HZrE0xR2sJV9T2WTYf0FWszuqLSWoM+4exPXyi6q2Yh/LwUnIk6qtbNYaXoRAadhxeGOAw4xkXNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0LfsVi6L2Q+mVFrQvSYRr++BvW+fY9cOi2yhFqeZ/g=;
 b=KAzRxqsN6nw6BeRYhbCH1qOUEvld3OpXbkdCWJvQ1zc5kcfJ7rvOhf54kKJWqTynCHSR8fjTqVWKwI6sMiFbRSCXiGxDAwfBpQ5sG0R46el7poK2+tuy/sw5Ly6ggL743fXYUt89417aFCOKZVzSvrAxOvxLX7MmBxHlHBakrF3JCjbDJeUg0JSERVoutHnUfZ2xBISpPmvO0zdgnTZ8D2JLPedp3fsT8hAytol2b3qJYYsvvBIiwOtWmwfSaZQ9FPbl3enXSSYjkU7YeB9AytBQJ304qWSUOHGHj+9qG3BXbURTplAbPWHnnZ0k8GsHa/2eWQAIc27Mf2y5Jtzk/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.203) smtp.rcpttodomain=arm.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0LfsVi6L2Q+mVFrQvSYRr++BvW+fY9cOi2yhFqeZ/g=;
 b=VmkH9whNs+JBZ4buJdjuSfRz1aGuE7VLr2tKt1IG3wjCgkBFUHQDwXbehpuKnHDXe/7vjU2thKCYCFDwVPRli8RvYr/Tx7mc807yjFj1ivK9X7lnl1FbHyMGkXxuLPHr0evO4P2/JRZ/vmQeCa9DlD60thqp6qU/mLLSjXvzQFtAYJX6aFjFNE9bbIkD54A0bSI9bhrYHAtrRC3RYCKYB4drpm/n6t4VI+ivbbZ3WDZYgGCafq7Tgq3zXhjOWbvORaGsVNgqtCDms11YHeBT8gkbwH/f0Eb24ekAhaxLb5HOUwJajAphb8MC1E35Le0RREROT05pxWWXolT8yS68Ow==
Received: from DUZPR01CA0247.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::17) by AS8PR10MB6149.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:573::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 05:28:00 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::94) by DUZPR01CA0247.outlook.office365.com
 (2603:10a6:10:4b5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32 via Frontend
 Transport; Mon, 22 Jan 2024 05:28:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.203)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.203 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.203; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.203) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 05:28:00 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 22 Jan
 2024 06:27:59 +0100
Received: from [10.34.222.178] (10.139.217.196) by FE-EXCAS2000.de.bosch.com
 (10.139.217.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 22 Jan
 2024 06:27:59 +0100
Message-ID: <e040821f-dc52-4317-8244-6b0b29250bdc@de.bosch.com>
Date: Mon, 22 Jan 2024 06:27:50 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <rust-for-linux@vger.kernel.org>
CC: Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	<steve.capper@arm.com>, Asahi Lina <lina@asahilina.net>,
	<boqun.feng@gmail.com>, <andrew@lunn.ch>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
Content-Language: en-US
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
In-Reply-To: <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039230:EE_|AS8PR10MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: cb7feffe-5596-403e-4692-08dc1b0ae5f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z9tfHSK+wYeUnN7J5E5jXFpl6RZaIU3RHmr+Av7y6iboeGEOEYyeq5kFx0U4RIyDKgYcbM/RU3wiKLHOr0iCBYq6bidUsxlZB8Jmo5k1frzGM+wvVvmD7m3A4CgTu0R2lwlvQZtpQdrMitoRbAbpc0KoGX9575/1vZaBhcGA/L+aNqwKdmcaJN2g7PZJwkspfeB+vU4cMZpagvs+s0bKbfXpgCkt15nSCj3HMgOs51VZzNLPG3yRhvEbHTSwWYrH4erKd4YrIzLXf0Mf8ZfCyP1zuRZaRvjIpkW0CejfwMxhKMOhN2pKdarmlaRA7uAf06GSO+RYi3EyeFcEFri3AuuI4q9xASoPMx8BgqmuO9kOwOSVBshDrAjrSOWLjwWIIbz/UziTj9Lh6nPUu4Rx2lbGrEx7ywF7u3PxfEG4G+Pudm+JG2aT6kq/UeBZYgcOsPZMrO2+op166BSXF4zW3952PIBGwn7nJ+2pFK0546VK3KQAwIQsttCs3K5+O6XU4/IumFQY5nUSUoKjx1sexIMRytEui0WclnZtD+vZyLiUu9aUXGpiSYZz4DFHp61ImBrLLJdnpTubgglx6vvz0frPM5bZD1hEu5SoETKU12vuoDFQLLwlV6DJU9ulMflcaqgy1FbRxKaqtYvHZiNGjubro91UYLexUsMtUTzjh/gfAWiglL7PDKj3LiMAqwDOl1RypDpC3Z5xGwGv1i+Hbj0pzIsCxchKXnkboWfLaKL/r09eRJIdJJ4wT9cuq5MIoeKPWy4/Vby2k0G1tYtOBLhkWQN5HL8kFobkuLYmYdAK3xqymP+hhNDKye744lYSAJYF2n+xVUktAdWktQllysF/h2wN2RVx4TEcck3LKas=
X-Forefront-Antispam-Report:
	CIP:139.15.153.203;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(1800799012)(64100799003)(451199024)(82310400011)(186009)(36840700001)(46966006)(40470700004)(83380400001)(47076005)(82740400003)(2616005)(26005)(16526019)(336012)(426003)(36860700001)(53546011)(4326008)(8676002)(8936002)(5660300002)(2906002)(41300700001)(7416002)(478600001)(6666004)(54906003)(16576012)(70206006)(70586007)(316002)(110136005)(356005)(81166007)(31696002)(82960400001)(86362001)(31686004)(40480700001)(40460700003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 05:28:00.0288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7feffe-5596-403e-4692-08dc1b0ae5f4
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.203];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6149

On 20.10.2023 17:50, Jamie Cunliffe wrote:
> This commit provides the build flags for Rust for AArch64. The core Rust
> support already in the kernel does the rest. This enables the PAC ret
> and BTI options in the Rust build flags to match the options that are
> used when building C.
> 
> The Rust samples have been tested with this commit.
> 
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> Acked-by: Will Deacon <will@kernel.org>


I'm using it since some weeks cross compiling from x86. Boots executing 
the sample code and the KUnit doctests. So:

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

Would be nice if we could get this merged :)

Dirk


> ---
>   Documentation/rust/arch-support.rst | 1 +
>   arch/arm64/Kconfig                  | 1 +
>   arch/arm64/Makefile                 | 4 ++++
>   rust/Makefile                       | 1 +
>   scripts/generate_rust_target.rs     | 4 +++-
>   5 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index b91e9ef4d0c2..6bcb3b97c5b6 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -15,6 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
>   ============  ================  ==============================================
>   Architecture  Level of support  Constraints
>   ============  ================  ==============================================
> +``arm64``     Maintained        Little Endian only.
>   ``um``        Maintained        ``x86_64`` only.
>   ``x86``       Maintained        ``x86_64`` only.
>   ============  ================  ==============================================
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 78f20e632712..d72618433521 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -227,6 +227,7 @@ config ARM64
>   	select HAVE_FUNCTION_ARG_ACCESS_API
>   	select MMU_GATHER_RCU_TABLE_FREE
>   	select HAVE_RSEQ
> +	select HAVE_RUST if CPU_LITTLE_ENDIAN
>   	select HAVE_STACKPROTECTOR
>   	select HAVE_SYSCALL_TRACEPOINTS
>   	select HAVE_KPROBES
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 2d49aea0ff67..52d75c9483a9 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -41,6 +41,8 @@ KBUILD_CFLAGS	+= -mgeneral-regs-only	\
>   KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
>   KBUILD_AFLAGS	+= $(compat_vdso)
>   
> +KBUILD_RUSTFLAGS += --target=aarch64-unknown-none -Ctarget-feature="-neon"
> +
>   KBUILD_CFLAGS	+= $(call cc-option,-mabi=lp64)
>   KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
>   
> @@ -65,7 +67,9 @@ endif
>   
>   ifeq ($(CONFIG_ARM64_BTI_KERNEL),y)
>     KBUILD_CFLAGS += -mbranch-protection=pac-ret+bti
> +  KBUILD_RUSTFLAGS += -Zbranch-protection=bti,pac-ret
>   else ifeq ($(CONFIG_ARM64_PTR_AUTH_KERNEL),y)
> +  KBUILD_RUSTFLAGS += -Zbranch-protection=pac-ret
>     ifeq ($(CONFIG_CC_HAS_BRANCH_PROT_PAC_RET),y)
>       KBUILD_CFLAGS += -mbranch-protection=pac-ret
>     else
> diff --git a/rust/Makefile b/rust/Makefile
> index 8d75a6ffe951..8ced65c9b905 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -294,6 +294,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>   
>   # Derived from `scripts/Makefile.clang`.
>   BINDGEN_TARGET_x86	:= x86_64-linux-gnu
> +BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
>   BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
>   
>   # All warnings are inhibited since GCC builds are very experimental,
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> index 3c6cbe2b278d..ec5ef35dbe52 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -148,7 +148,9 @@ fn main() {
>       let mut ts = TargetSpec::new();
>   
>       // `llvm-target`s are taken from `scripts/Makefile.clang`.
> -    if cfg.has("X86_64") {
> +    if cfg.has("ARM64") {
> +        panic!("arm64 uses the builtin rustc aarch64-unknown-none target");
> +    } else if cfg.has("X86_64") {
>           ts.push("arch", "x86_64");
>           ts.push(
>               "data-layout",

