Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3DD3612C7;
	Wed, 18 Mar 2026 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773856775; cv=fail; b=pb3FN1Pfnq8vxOMRM1Mo3lIOawCcnW1zarU8kFpBthna9ZG+dryIVnhiWNkjAxSNTl0qgnjGUkWx6ISo0E8MKHyc+YNuGxehjJUCfA9qGoEsMXyKHc7tdsRM/0DK0MIzKRx5ZeViPdV63nr0ENVL0CvCtbpOKILluk2W1rQ/woM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773856775; c=relaxed/simple;
	bh=pUcjBZFHaqI8+d0MEiOVBwQ48bPL+WUtWs9QwkYQ/IU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nB/CZvNj2LFnzCDeAnYxVoFSS8l5J4pqb2CHDeQ8qMejbzHJvLTsWU4li91+FfM6Mpf56tVnVIoIE+KIGXWuh153wkW0atWMFP7RizfUqWp1uYfmBI403Ll8rpoB9ZUkltlqsXr/VkynSKzPXsUr0yNd3NyucnJ7NuoyFt++4n4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ovPZwuWx; arc=fail smtp.client-ip=52.101.56.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ovPZwuWx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqEGzMneYUy6yjF/54gvbSFkHoekoBCsaDb6jLVPOKJzVkZnmCujmQEKODORltkYEb11yIV5faAE0Pk44q3pUV91FT8LGH8QpQq2TfSfiEBMUH9skyMm5ijzHU5j4aeCKISOPk6jNQFXM8bPa+8cPFWwZeuCMOQG1Ndp3Qv03w1eRbOyO+71+58qq9VfzrT836mkJEsKAVrW15s2OeLEzqCtfkD6x1a0o29WftzpbIXgS/Suk7iLKLODPl88vI9H7MscuGYcLpnFfZwrgmcqTHZDnKf2zwmSbsP6BTocIWqgMDtr5/l4UZWOIb8X/m33lw0b0+wlYZyQ1CqNaPadvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mLzSdqjr+920QxGFa0poY2fo4FksfKhHcxC1oMWbUc=;
 b=B8HuiI2jrYrybJ53XKOQrfqG3ZjolxRTKQw3zLcedOJKMq0M25XQgvnSYznTDNpVfRV9u1u+jAangAsrOvgebB2yrmTo6T9Wa/+RVtqxOMAv8pXLFnVadlTEBgZcK6jJtacKhRo2MT/iB+e6kmrLV8XmODVi/SiYVlH7ag7gFDh/l/euIPYM8kZsJtghteUrJVmJ5YRoTQ4nP/LH+ZhpR9eu53wRKrdGJR3hvRnrzfdY64xc2DGCM0aNvbA13s5wwRMltMj3LJo1heS8AH5sF10ZA+B4PAUmWsM3MqTO9lFU4Fj2PWInjNQYsn292RpkUpKqtwA+1G7EP9jnhfrA6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mLzSdqjr+920QxGFa0poY2fo4FksfKhHcxC1oMWbUc=;
 b=ovPZwuWx1B/aDhI28z3fMYuym9weMrjzA2f2dVZkq7wEx1pDC1sNbRWHXarv5xJrPiSZcgn+5ScjXAp8lJgF/EYTxkBHgQL+r9oiCsKzuhNIxfe/Cyc+9lgDRD59t5GsEnc8DTdysaOViuIksV9o/Mkig3bQkS9UvIk3FtFCHW4cd2yrnOSRpiSdps5lvW8xKHYgFdTPXVpIQYH4qe9q9vuZ33WTPrurG/ij0WfWIoNpTeyjMhZqh5QUhtu0y20ewUUA5RcGc0HFxohYKN2IgKh91iAy1430kGamVb8sfU+ODq2a3fgPCb+wKS72MWFt4tmwBDyY+Yy4UdOPilN13Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6325.namprd12.prod.outlook.com (2603:10b6:8:a4::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Wed, 18 Mar 2026 17:59:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.007; Wed, 18 Mar 2026
 17:59:26 +0000
Message-ID: <b3365c7b-ed72-4282-a4cd-16ad4558b7f0@nvidia.com>
Date: Wed, 18 Mar 2026 10:59:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 27/31] gpu: nova-core: Hopper/Blackwell: larger WPR2
 (GSP) heap
To: kernel test robot <lkp@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma
 <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260317225355.549853-28-jhubbard@nvidia.com>
 <202603181742.8HLcTchk-lkp@intel.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <202603181742.8HLcTchk-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0150.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: d4988a39-d09b-4c45-d0aa-08de851817bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	4qu+Aj2tAY8V7ZcRrSWHCMYTBRNYZtYnzvqN3CnYVPF7gKHzdp1KSe/ayUkcCRa0yEh9x9mcAXl08fTbplK+Pgba+/Ke+QcMruXMn2magX5TQJobl/oCqzQ+ooww3WyJIZ3lcjmx8zPSZjGwVQ8KMrvLZuUDr6EwOU9fQZDsOy8FxajlkLOpB016W/MnWp3SxpUw2eBAl4m0scsodqIb0XxxzBVEl9PJt3Tv3Y5+Emak/Yb8zJwP4Ts9Dp0qqGGvE6Kt5Gmx/NPUQi6Pf8h1mbrvNSmIrbg9i4a6eKlbVwiwuZa01lafYZb5UmRDI7wNNi4S9RdEevHICWIHii+IvutKYpK038SuQKvpm5A54hKKvOuAv+Jz7w6JIIOnjUTiDGInOVAhc4GLBApzSfihEGb5uN1ver38ssRM/tcArcR7pxT5s6UMi+x2ptbxtaq6mk0rkUX9yN1Lvjn2KT/OdZ91X+dnMLyQblJccSsxGQBC6wHNc7JuVbnhJ/APUvRnvOyVT7doAtcDbry7CjGOSVscRSg9JiXENl4ZRIMEHzwJOrkp7BA2KPgrjAP/lmDYaED2mcVIDsPpWPJKZzEjATnzYmGxRU+HvIrWYMWyFtBTHbNPNap7D0hPdAiJDPgsPijKwTcaOX3QyjhN5oFn7LDyeE7YOV5M7yqAbYZ0V3+N9Ub72Cxy2E+UmUdp9xolF0sXNt+OP6jrIwvy6M5LGHzdB85qjyUhfdyw3iZjJqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wjc4b1FNdXpEQ3BIVkJ5Z0RMdityS0pyRjNnTFhNbVN1RlVqbjMzbTBzRmQr?=
 =?utf-8?B?TlhJb2RCMHFMd01ob25LU2laNDN6WDlXNHdhNUJzVnNSa1NEamt3Q21QVXJn?=
 =?utf-8?B?YXM1TGFsMzdySFlCazhsekhKbVJRWkpCLzNXKzhvOU1ET0t2czZQc3Jid2Ni?=
 =?utf-8?B?c0dQYnVLYTN0Zlk5ZjdnY09rWkZmVWhubTNhTlpMZm82K0lpY0ZPNSsxeDl2?=
 =?utf-8?B?aTdkaTNXc3Z3dkY2ZGRQd2toOFdHYjBOUTV3a0dRWkpzcnJmd05BQzlKUk1Z?=
 =?utf-8?B?VGVFV1I2N0JHUDZ1UFFaREZrNlRwbTRpWTFiamE2VXZMUUtLb2R6LzRPUFhR?=
 =?utf-8?B?amp1WkY4ZDhJWmRMeExYMVc4OTRDNVNjbm1WdkNBL2FvVDdMNnB4ZXVBM1Zs?=
 =?utf-8?B?MC9nKzN5eUE5THhyanlWaUgyM1FmN3dvZ2M5MzJUNDNDYUh5ZWlKZVFEem93?=
 =?utf-8?B?QVFTOTc3a245NWlvRElzb3hrQVdiSVArbE1Tc05maG9kK2RlaVdwdVlkYVZx?=
 =?utf-8?B?YjVRR3lqMmkvQTR5aUtzMjNUMGZCR2k5YnpTL3dYSXBnY1U5dlJrcnJkV0w4?=
 =?utf-8?B?WWZtZUFvaForQUlOb1ovSEZBSy9MeUxXRlFJQnZFcjdEVWV0THc0OFRkeW1U?=
 =?utf-8?B?S2djL2NDUHJ1eWhZMXlxYW50M3FWSHBQa2NHWUoxWTRJZm81Wm9LOTVvMDZE?=
 =?utf-8?B?aWY2UW0zTWFzYktrNFRkQ2NtLy81aWFhK1ZjZ1pBQ2VKNlNUa2tJQjR3NzVz?=
 =?utf-8?B?dGhyY2ZTQmxRYTZ1ME1yNDFTOHNTN3ZpTW9XbkdzNkp6Z000NEVYZ2tuVnhr?=
 =?utf-8?B?S0Q4RmdHdHNKZ0lSeEI0b0N0dE1sNWVUM1piRmhhUlE3bEVPc3B3emxuNlpQ?=
 =?utf-8?B?Rjh5aHV5NHU1Q3BzeEovaW45SVZ4dzJrMGwzOGRuaDJjMEVkYVNFTTA1Z1Uw?=
 =?utf-8?B?UWNHdy9wamptNjJoY3Njd2JBbnpnNkZBZWdRcXM4UmR2dzJIbUg2NzhCV1Fl?=
 =?utf-8?B?K0F2b2pMS0liVnlTUlU3V1pVS2Y4STRjWG1jUW5BWjJWYkVDb0huTnVJa3RJ?=
 =?utf-8?B?VTh4bUo2Sm9yUFBGMW4wV1RNOEJaRWFLRi9SbDJxWHNqZXg0cEloVzQvR3ov?=
 =?utf-8?B?ZTc0Q0xrZUxxekJQbElrUHh6MVNObCtMNk9WR0ZDYkJSc0d2R1g2a2Eyempa?=
 =?utf-8?B?UldZMVIwWXBBdmlmY2g4ZkU4cGZubXdTakF6NkFaeWxkSmh1eHoxYkF5eUJ0?=
 =?utf-8?B?ZkRkakI0SjlzOHNnb1JPd2JWdXc3T2tOb0EyQ2FBeFFoUmhCbHZvdHZpWGti?=
 =?utf-8?B?WktCVlFxUFZGcWp3Ky9zOGFOT1h6QnE5L2NkU0ZJV3o2OW5WQWF2dkUxUmY2?=
 =?utf-8?B?YUp1TzF3Nnd4Q3lKYUVlT1lyeHNYcStoN1FzNk93THBreEsraVVWMXJpN2lC?=
 =?utf-8?B?L3FESU5DcFpTQXVrVjdEamc5WndZcldjQVZuQ3AyLzF6dUNxZ2NXWEtWMEV2?=
 =?utf-8?B?VHl1UXFnbXZkbjkzMlFrQ04yS3JLcG9kUzdwUkJSWHczbHFhbW1ZQ3EzNHg0?=
 =?utf-8?B?allFRFBrbXVZcys1T1hFVUh2UXZNNk1MYU5vSWVMSDUwQ1pybSttNzdxUHpX?=
 =?utf-8?B?aTZpdFE1eElhUWZEa0o2cHg0QUdWMDhRVUFseGp2QTVHT3N6S3pzT01YR0wy?=
 =?utf-8?B?WDhnL1pCdVpreVR4MkFLaHlqZE5vME9XTVZrSDk3TEZWMU9lYlNQQ2sraXdU?=
 =?utf-8?B?bC9VeUVYQU1SNnRBUDVBZEZvQzBPKzY1RmZYWGJ6UVFVVW1HMW9pdTlVTHRL?=
 =?utf-8?B?cldzWjZLc3k3a0gvWmRTek1hU2RDbFMyTm5USzRhVnM5Q3RmQjRmWUlndjlL?=
 =?utf-8?B?Q0FSZUYvY1RCLy9DcjI1NEZHV0hlNVlHUVY3dE8zcHZYL2x0NXdEQTVBRlVz?=
 =?utf-8?B?M1hjSithcUVTSjlBMlNIOHF3UytEbHJSK1VLQlV1QWhBcXVveDN1UGszK2tJ?=
 =?utf-8?B?elpnUzJqSUpDd0Nxb2RvMDdTUkwzSHBLRHkrRlpRb2JGMk1sbUprbGhVQlUx?=
 =?utf-8?B?NFRHWitTd3hISjdyWG8wOUZEYkEzb0pnNUVmNlV4WG1DeXF5ZXJyQ0ZqN1hL?=
 =?utf-8?B?MzRpWFpoVDZxSWpwSXV3bFlJVjJRa1hRTXB6TjJKcEZyRW9xSFk2MnFqK1Ew?=
 =?utf-8?B?VU9OT0ZGRkhZaExZam5uak1oUjFVM2pOSlpmcGducVMrZmxKZ1dETS81Tmtj?=
 =?utf-8?B?RlpCd1VpZERpMmdTNGw0NzJFRlIxWHBCOU50K1F2UTFwako1TU1aczk5cGtl?=
 =?utf-8?B?ditTeDhRbnhOY2RpeGkrRWttTVdKS0E0UGNVbWl5MTJ0dDRhVTNPQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4988a39-d09b-4c45-d0aa-08de851817bc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:59:25.9105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMYRy30s4IjxwfvBKd4g7CSB8PsaES5rjVd0abn/GJ4YtyfkFu91ZN9ASb4IFz2CTg2GlIEs/4JiefYYmrmwbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6325

On 3/18/26 9:12 AM, kernel test robot wrote:
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603181742.8HLcTchk-lkp@intel.com/

OK, some rustfmtcheck failures. This has revealed a major gap in my
build flow: although I have rustfmt(1) set up to run upon saving
files in my code editor, not all of my scripts run it.

The code saving approach worked so well that I completely forgot
about "make rustfmt" and "make rustfmtcheck". So now those are
part of all scripts and testing here.

Both issues (this one in gsp/fw.rs, and the one in gsp/boot.rs
reported against patch 31/31) are fixed in v8.

Sorry about the failures.

thanks,
-- 
John Hubbard

> 
> All errors (new ones prefixed by >>):
> 
>    PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>    INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>    /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
>    make: Entering directory '/kbuild/src/consumer'
>    make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>>> Diff in drivers/gpu/nova-core/gsp/fw.rs:139:
>         fn base_rm_size(chipset: Chipset) -> u64 {
>             use crate::gpu::Architecture;
>             match chipset.arch() {
>    -            Architecture::Hopper | Architecture::Blackwell => {
>    -                GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
>    -            }
>    +            Architecture::Hopper | Architecture::Blackwell => GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100,
>                 _ => u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
>             }
>         }
>>> Diff in drivers/gpu/nova-core/gsp/fw.rs:139:
>         fn base_rm_size(chipset: Chipset) -> u64 {
>             use crate::gpu::Architecture;
>             match chipset.arch() {
>    -            Architecture::Hopper | Architecture::Blackwell => {
>    -                GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
>    -            }
>    +            Architecture::Hopper | Architecture::Blackwell => GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100,
>                 _ => u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
>             }
>         }
>>> Diff in drivers/gpu/nova-core/gsp/fw.rs:139:
>         fn base_rm_size(chipset: Chipset) -> u64 {
>             use crate::gpu::Architecture;
>             match chipset.arch() {
>    -            Architecture::Hopper | Architecture::Blackwell => {
>    -                GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
>    -            }
>    +            Architecture::Hopper | Architecture::Blackwell => GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100,
>                 _ => u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
>             }
>         }
>    make[2]: *** [Makefile:1916: rustfmt] Error 123
>    make[2]: Target 'rustfmtcheck' not remade because of errors.
>    make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>    make[1]: *** [Makefile:248: __sub-make] Error 2
>    make[1]: Target 'rustfmtcheck' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2
>    make: Target 'rustfmtcheck' not remade because of errors.
>    make: Leaving directory '/kbuild/src/consumer'
> 


