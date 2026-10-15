Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3842D40F724;
	Thu, 15 Oct 2026 19:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092626; cv=fail; b=tXOWq2rc83/yf54gc5WUwLZtOcmmrojIzt8TzAOpn3egOd0qqs55lWP+sc2cwCwnroL6HOXFmH3n5+Q8rrTxhE/qeGqxDJPlYadKRQ8yrHxdtn0/S2Tj0bB8B6EFoec0F9HiresN7fQMeJi7vN+6MGINdYbMaD1kFKJndyjTGhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092626; c=relaxed/simple;
	bh=Ch1Ktz4OzVgYjJAJPFd/4Ae+ohfYsWQvpD/gHIMv4bY=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d5/rNg9Im7wxu1h5X7Nlsg+yl4NLpKmK7iintxNUqToUzRGOmqjoPb1nYMg8TwWUrMTxAto189/wpC37W4D7gCA0n5lcOTcWWcqc4AITl/H30fyZAWq59wpftxCN6u1pt7t3AtcteV4KsmVdnF4QFbQYjzTHIoKjCPILD5r2JZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QRjMXksl; arc=fail smtp.client-ip=52.101.85.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QRjMXksl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaC7+FP0uC44conteezoPqd6P2/SJlMDkfvf5KSB5jWF0cvbpnmiOCfKE63l1nCuMrB/GpySR6mZcOfvuJNEXb/K7Jtd8snjbAVeDPMYVlqGKD2YVgmSCzuH9RnLp6WaCUBFlZ1Z3H3fFHZmVl8jqjKcEcU+EE9+oqRvgSbKOQ0Wx+Ok0TdVqdwxezTmvbCwQY566bZdWR9w2TxUHZ+uLD2WHEhBu4Sk8DJJMSZVOgrq9KNcvvB4RFCusdL4puBWDbaDQVFygxkmt7Tm9Obe/ZsG3pLqoaXb8Lxp412v8eesfTt5Lmm8ZiGTPcd7XXtZ0llIu5wVoTlA+VH/D+dh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWVpViqzGUlOjZcWCWJrqRMVWHmc0JW63Hkf+IZmuic=;
 b=YMh5j2hXPJQLrh4O5FTiFBXys2tMm1OkOUKhmRX7Vlr6lyU24Ifr8o4nvzHRHdzH/rS9Cl9SheyOcf+pwHLSbU0bjskNEGezwVBy89vATV+0THyb3GiudA6bLznUQemZwqM8Ei9Zx5m9+XVsH0pcffF4cvBCjSn8yDUulnOqkHZlwDZl2eXHg1xTr1N3K0i4OghJYzu7/FMzYbhBro+O03KTaDI4+HCiN+4QKpHfg6adXaocZkQL7i8H51Ug0aMj5476awHFdxqO7NKjwmyUDM2FzWf9TRl3KsneQOvRPqVU7oq2nMCn0v3lahLcjKBadk7Sq5vLQazPiT1FEn3Yhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWVpViqzGUlOjZcWCWJrqRMVWHmc0JW63Hkf+IZmuic=;
 b=QRjMXksllmorrQC+Ccz+MHPHCl67jNai5D+b+BU5aRZYHwTX2YnaY1jn5fS3DaSV2NPSLjARFdui0H07LwNV022L6cyq+ZnnoibC+/cNxbLzYwbSXUjCTd4JD2O1tf7rTqIucLn3hDvLhqraJS/crUxIfPZKumfsQHX69Hf8LzW2ZXNeDweUW2uaYjhI45rV3DCBTrfS4nQJ86Kfcm6XetcNXaDIzuq83UQk89i4HSrtU8AU0ZhJKwqiRrnyoTuZkkvrJ2/sACB/vSQLWDz8gOtLh08VeH5bEWrrKmW7kqZSltehgDas4LPneKuaT+njrGmgzqwFHK3exBUUyCPLhw==
Received: from CH0PR04CA0044.namprd04.prod.outlook.com (2603:10b6:610:77::19)
 by BN3PR12MB9569.namprd12.prod.outlook.com (2603:10b6:408:2ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 19:30:14 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::7b) by CH0PR04CA0044.outlook.office365.com
 (2603:10b6:610:77::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 15
 Oct 2026 19:30:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 19:30:11 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 15 Oct
 2026 12:29:39 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 15 Oct
 2026 12:29:38 -0700
Received: from inno-x280 (10.127.8.11) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Thu, 15 Oct 2026 12:29:29 -0700
Date: Thu, 15 Oct 2026 21:29:25 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <andrewjballance@gmail.com>, <daniel.almeida@collabora.com>,
	<dakr@kernel.org>, <aliceryhl@google.com>, <ojeda@kernel.org>,
	<boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
	<aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<kjaju@nvidia.com>, <alkumar@nvidia.com>, <acourbot@nvidia.com>,
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: Re: [PATCH v3 0/5] Rust dynamic debug support for pr_debug! and
 dev_dbg!
Message-ID: <20261015212859.2057d59c@inno-x280>
In-Reply-To: <20261001145940.1077801-1-zhiw@nvidia.com>
References: <20261001145940.1077801-1-zhiw@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|BN3PR12MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4bd894-2221-4fc5-56f4-08df2af2bb23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|36860700016|82310400026|10067099003|56012099006|11063799006|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	vDiSVIhwQZtMs/SDEgNi5n0IuLDO7WqrKWfJ6/G7VjOAAS54/6iDxsedWGZ1xcBqpHSWvjx6svMfh6phY4htvpdPPYK2AMyHyQFFxuUWx4Xo7xMQUmQGY+C8iqxOr9WH11wW84Oz9KN4nU4CPFR3ystD9l6kntz2eu555zeU4iWcdbZimEoxzHs5aDxE8q/XvtlZd7f7OptcH9wY4zwnaC28qfk8/kmRVmIVw+Pbs1WEc7SK2HAy2h3a4qg4Im6/GkMIdpd7P8pDMfo7+cdpylA34MOcG4DYA+PM9M2NPd4yKZgidPLT+foCRoLS98uFID1f4BdJwltyCtUG8LGNjqAu7XxqIWl9rut51bdR6D74vnle6VB71Yibv/Jp2MroNXj1cfv2rxtNRs57ymzanqu+UMvz2XBNi9HqgpK8bbvYcsLJ+8lN0fpZU7vbBdC445/t5bcJS3hocn7se9sQRpMgH6lsDgizo4F7CIsigrGFcXmDOsmw0vTmU2ejb2S/GbNXQBmtMXn3p7Uz3y3yJuHtLisfn2OQaRUH3EMlxFArNdV7Bfuwu3/abgkBRRTI3bZ2jZTlyLae8QW+9nC0O2aofvnPvkRZYYSRUx6J6PfG4ilSBeD3Xrqy+wfJE4S4IHAIa4T8KkJnXc/Om7zzn1If49lU1bqoIW5Yfgg0jw/MSNkhCAJLfWmIFVvtr9nSGLjc09i8rbCF06vcyEHNoQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(36860700016)(82310400026)(10067099003)(56012099006)(11063799006)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qTWJlRp0jImTHccHvjBIVq49j7x3uOYVojlyxblJ7Ox+wcGEZYpfJs6xKJ7bOso7fpi0Tct0lkBhGvLo+aEGBRgd1iTRlh3eQTM8G2M9EgVDKd2FubSfoVBhm9iRG/B0iV+5y24xsAELtnbtKEQxs0xm8HxRGD2vT+D+6zNUAJt5o3RSfgflWJeuoF3tt480qhbSH7kPw3QTRx8earGQ8lmkN2clSyzlkIGm2NjQhq+FKn6Q23ErZmdGgtwETa+LRc/G78MaDtHbAtXFwUmPhuFZxvVp5ZYLNvz/Jx9V6IMgVu1vAxYCjhKWRXYL9BY2Vn+JSqzfpxnmt962xH7icrc3MbcjyUFApld4OWNnpVL2tElDRDHOtapweoMLw1twA9s+N6JFtn+WngVphZe/fBvVSADlAXq9Cbp3lOGBZ3JxatlAWlFbKrDgITSBBh96
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 19:30:11.8210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4bd894-2221-4fc5-56f4-08df2af2bb23
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9569

On Thu, 1 Oct 2026 17:59:35 +0300
Zhi Wang <zhiw@nvidia.com> wrote:

Gentle Ping. :)

> Add runtime dynamic debug control to Rust pr_debug! and dev_dbg!,
> using the existing C control file, boot/module parameters, prefixes
> and jump labels. Callsite flags and static keys always start
> disabled. Users enable messages with dyndbg queries; Rust debug
> assertions do not affect whether a debug message is printed.
> 
> This continues Andrew Ballance's RFC v2:
> https://lore.kernel.org/rust-for-linux/20250620210533.400889-1-andrewjballance@gmail.com/
> 
> This revision retains RFC v2's nested-field static-branch macros and
> static mut descriptors addressed through raw pointers.
> 
> Changes since RFC v2:
> 
> - Make debug logging independent of Rust's debug_assertions setting.
>   Both pr_debug! and dev_dbg! start disabled and are enabled through
>   dyndbg; without dynamic debug support, both remain disabled.
> - Keep caller expressions outside unsafe blocks and avoid implicit
> Rust references when reading descriptor flags without jump labels.
> - Correct big-endian bitfield layout and keep module descriptors
> writable with #[used(compiler)]. This fixes the kernel write fault
> when static_key_enable_cpuslocked() tries to write the static key.
> - Use Kbuild module names and actual format strings for filtering,
> preserve the crate log prefix, and support +d stack output.
> - Complete DYNAMIC_DEBUG_CORE-only support with per-crate opt-in.
> - Port to driver-core-testing and preserve Nova's firmware validation
> when debug logging is disabled.
> 
> Limitations:
> 
> - Function metadata deliberately remains <unknown>;
> 
> Andrew Ballance (3):
>   rust: jump label: add support for nested arguments
>   rust: print: add dynamic debug support to pr_debug!
>   rust: device: add dynamic debug support to dev_dbg!
> 
> Zhi Wang (2):
>   gpu: nova-core: validate firmware versions before debug logging
>   dynamic_debug: expose printing declarations with the core enabled
> 
>  .../admin-guide/dynamic-debug-howto.rst       |  41 ++++
>  MAINTAINERS                                   |   2 +
>  drivers/gpu/nova-core/firmware/booter.rs      |   8 +-
>  drivers/gpu/nova-core/firmware/fsp.rs         |   3 +-
>  .../nova-core/firmware/fwsec/bootloader.rs    |   7 +-
>  drivers/gpu/nova-core/firmware/gsp.rs         |   3 +-
>  drivers/gpu/nova-core/firmware/riscv.rs       |   7 +-
>  include/linux/dynamic_debug.h                 |  16 +-
>  rust/Makefile                                 |   3 +
>  rust/bindings/bindings_helper.h               |   1 +
>  rust/helpers/dynamic_debug.c                  |  33 +++
>  rust/helpers/helpers.c                        |   1 +
>  rust/kernel/device.rs                         |  42 +++-
>  rust/kernel/jump_label.rs                     |  17 +-
>  rust/kernel/print.rs                          |  53 ++++-
>  rust/kernel/print/dynamic_debug.rs            | 192
> ++++++++++++++++++ scripts/Makefile.build                        |
> 1 + scripts/generate_rust_analyzer.py             |   1 +
>  18 files changed, 386 insertions(+), 45 deletions(-)
>  create mode 100644 rust/helpers/dynamic_debug.c
>  create mode 100644 rust/kernel/print/dynamic_debug.rs
> 
> 
> base-commit: f1850e443b0e4f2429ddf42a8d5033ea54ae8a90

