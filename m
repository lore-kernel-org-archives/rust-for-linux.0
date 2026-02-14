Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022131.outbound.protection.outlook.com [52.101.96.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4021E86E
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Feb 2026 05:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771047261; cv=fail; b=Pn8GsrO5ouIHQajIjdl3c4ImKSvALP7zXHJTrLwSAjZktmEhRqAZMxJWqmfUyVxd5Y0oweDGVSYENLVdJp8tAgHBd+TO303Rcg5QHI0nDiBuevjtxKB+yRReyIIVKouqn1snZXVEvoNJQVb/83eHIVJLPJDXIbJAc63XdWm99Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771047261; c=relaxed/simple;
	bh=FlvfWJEHsK8Cg68ALmJVWLG4lOuKpUG9D5BALeQC+J4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XYR8yl5OJBRIj0KLg7uPSI9QvsWpNSVR2chmBAuANY9aXGRHMkegbPQT8OJu1VbOo3Oc36g3zg8zMd5LSsHMBnP/ZxuIXDVZUgTayu/+ZmTW+1RTDE5vrFU+IL/vUt6QIaz9/D3/qzOTSoVBuVCg4Qc16OHv9TI7tNFr85/wc+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DOcxxW9M; arc=fail smtp.client-ip=52.101.96.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DOcxxW9M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlZR4CMEBd2e6NtlG4RpLMpw+Oq8bOyUbRrvukfEoVFJOoO82oMy1UywilNyjnpyZJq4rHOTYiucwrI9nlbSE8DNIsTUOvDFznjgJVaZT+OmfVfMkyWfPSdSkWRP8l9xSWSMgciJkebQZ/JnnXb0sSeiB07jXjwbaMIFYr8BdTOC1vDN+de/N0Z6PQ5kJB5+EMIfKS3F/GhiHzGPbphCPu3ULXzy0aMBawQF+OFrbmK0aiu6tBjpu+M7k1p0Ky+r7pw+g1o/iuihDf2kN/FnhY4CxlMWeEP6EJNNUGSMRix0Sa57nb4DKbASHewYGFz1aCDbbp8YahErC6N5nPUX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkLwrqYZMdl/tW6h6rKTXGIrJJuRGCaQ5CJ7Kk+K8cE=;
 b=Gi4NFBcghSc5dgp5xwLePmkbk2lTfvdKXrw4rxJXpxgT6Zqsr5QaQx3FEwX6uEXB0enje7rQwbGDqAAS6AHBpUS982MmCQn3/LJB81ro6Y2dtFvubthvA822dQQIvr0360vBuO35PzHWkfsgLPA/HGHYyvmtSIffJI2aVwBSTh+3mmtJ4TXSK4h6yrKdtunwKSOlCMSK+sxzzyvcdbWBcIK70g9AerjrU5VNh+wbvbHTFWZ9qjnl9kKky3VH99KOK1OhlOJ2+XwwencJrgw6NnB2c40+t0uIlvw2klRCM9D8Fh4jaNMDulq+ihxkPZkM+83qBtmmvMLBS4Gk3DEVtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkLwrqYZMdl/tW6h6rKTXGIrJJuRGCaQ5CJ7Kk+K8cE=;
 b=DOcxxW9MjcvAs2bfHzZpJScnMMmmpz0Onq5erfJlYkvshhkLek0VcTyua7afDS1FLeVCNUa86Hk43bwqXsJtyOJS+iDtdofpSVMoIWrDQ4ddCiLR+ZP31sL1bIJ5RUQOBdAejCKEy72JOO4UJ0IK1B/0QeVoiHRZOGvzHZM00iY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2405.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:84::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sat, 14 Feb
 2026 05:34:16 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 05:34:15 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 0/4] rust: add pointer projection infrastructure and convert DMA
Date: Sat, 14 Feb 2026 13:33:37 +0800
Message-ID: <20260214053344.1994776-1-gary@garyguo.net>
X-Mailer: git-send-email 2.51.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2405:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bd4877-4266-45e9-b094-08de6b8ab11f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+84+tqkcEeznSokNANTKMS5ZmRSIXMOprs5H2Twnq77nGdeg2sKzFS+yBgx3?=
 =?us-ascii?Q?hPi3wZXulS6o/kCCCBveKOs/+fsm83YV7OWBE8Tg8Rcra/czWOFcoKwqpkXD?=
 =?us-ascii?Q?PgAlZESLaPWH2XcD0cnhr+PLQZQS3AduzetnD1e4Uwetqk42MWxRxZKAPUZq?=
 =?us-ascii?Q?NZZU6ejGl/PIOhX38VkmN2KgsrsE5gcKFEcU7+JEo/Nne6BySrRLtX6KQvIF?=
 =?us-ascii?Q?7v1VCbSwVvL3fVdJ+wuBhzqbGwKDrPZ22TcthWwh1e32WB/EkJ9rk0xesp2R?=
 =?us-ascii?Q?GTr3txI8Eo6EXltG6d1/Ho552Rr1PLEn1pjiXxjRpCszb2T8LkNlEdcaNwqR?=
 =?us-ascii?Q?7GFOMArq3azZnUahEpWOE1FvVW0Qxu3Lqp2Hb5hjNM02CewczfiDd3zHDlhQ?=
 =?us-ascii?Q?7VemxHpmgkAXsh61/xPHEjwQcH8HJ/Y8WuMwDiK9hLJlDB4Lao8TIjD4qZK8?=
 =?us-ascii?Q?NnHyocTSEFHuubUvSqtcFljB3E2QcxRK79ViPE+UMt8DydywyH/y8aL+JApe?=
 =?us-ascii?Q?3MYfcCtHoS95xvxutLy465U1VmBhchdtPvoGHGYdhSik2nmHY1pAlzTlRlb+?=
 =?us-ascii?Q?jNEHsYWB7+yxAWUHBoX1Fd/6f/W2f47n6se1NWYpklh8Ho88sQYjpdV0ymNG?=
 =?us-ascii?Q?ImkuBiu55gXZxrj3aTcfJpUXdXaFkwiWYRaLRjdFB92GT68gwtu33lg+Bder?=
 =?us-ascii?Q?cDQU860Jteqv35v6BflX4ZAn5zlaB/OjP+NdzHZeBJ2YWAUVhF41pvnyFt4g?=
 =?us-ascii?Q?46yOf7CI50r9dFWjpyrHddBv4dQ2hAXxKHzmYdxXAeLBrwFYGMlWQ9uEfp64?=
 =?us-ascii?Q?nMqM9XY+Ubt2cc4l+dLgnlcj7+YDt7vRwd6SisfcaSM9uHJafUdmixmrHi6k?=
 =?us-ascii?Q?IQq7bcMMudarbwCDWEuKcihmBDDcdwinTFPZ4ogdUOcUtXfaz6ytQD+RUzFX?=
 =?us-ascii?Q?KouND29WPIC8sgVZq2xxSIwWHsvkUr8O55Tkpdt3s7xkps8+9h++EhnH2z8o?=
 =?us-ascii?Q?nCAmCnzDY4gPGMftNgVyY4Y9adI+q9ciwi36qB4ai6imgrbIgRHGzhZaBFBw?=
 =?us-ascii?Q?b0r0Na4uEpVaPVhyRz/gvZEk5pNhLICygdUre329tUpgS+bRsM5Uq+79vImz?=
 =?us-ascii?Q?b71AAB+2V8aA7FdvZNNS+6gR/zoyzou0rRecP18Z1u0iSo6DkxUGz3UU5hcE?=
 =?us-ascii?Q?VZ4F4kV4excVMUPI4mfYRm0roqqCROvqHUxWWJnWS+1y7mzr2tAsmOYzLflU?=
 =?us-ascii?Q?cGW9UN2VqeogB1v76NttUTQl7sC5zv3WJyZOtycgWXGLTTMaav6z3wLlGHsi?=
 =?us-ascii?Q?s9iE4pMFl+gMPmpA+0TVEjt2EBHLlxoFhKVoKRj09lhIPv3ZRfoJcv/9NAs/?=
 =?us-ascii?Q?Nxvwdn7+opzgoQmF29ABwpV/g2ftF1bSsJ7aUlQ8Eb62d6Bl1Bl7wxWQA4R4?=
 =?us-ascii?Q?2sOZ77v3ibj4OaaN88ChdcbBqjDkMwALZvP2GHPsGN36QC6c0+FqcLFv6s6k?=
 =?us-ascii?Q?9V30XsJ6qiWmPag=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0m2m1qBp+wH10kaP/3RwTacMrvIOijclYbOjj0dNLZQc4tzzKg2npu7wvdiW?=
 =?us-ascii?Q?VjGkYy2JvZtCeJCcPYUHkJkq1R2xrWBFD8+/HBJwGN5bq298FgZcdlzzyoor?=
 =?us-ascii?Q?kTCwm0pfuaXSqyaMDeBJ9+nAwWr4RwSDewF4m4v+3tjiIWKFo7YsS7SJYXQ7?=
 =?us-ascii?Q?nYgEe/4RKMKSYdRWWODvPLHHcaYIVHeyZyhkMppBacMrMnSft5+6EUWszUIp?=
 =?us-ascii?Q?ZeFT3lo549xnXb4aaSs6L1yPUTCbt/3NcSVmGYz/Uclcn1uCEw6FPZiG+9sE?=
 =?us-ascii?Q?qKizMUWH1WaXbeT1SJZkzTXG/a1c8GcoKqW+yszlryd/3+aW1qJ7pvp4EC6a?=
 =?us-ascii?Q?V7QqfNAgF+EFNOYgtQXK8Nxhtqto9n/k0lKTBfa2+k+jm5nOKH8emu8JtIkB?=
 =?us-ascii?Q?KvqqdEKoGa18diP7xTXEr8LSITkbLYqAjoO7aebgJ8K3fCCuVEhf0b3nxhu4?=
 =?us-ascii?Q?TyxmFn5bDPzhu8ij0M6+sZF1p4JRoDY681pLIMQTHpLR6jiIrIDxew3/MqcK?=
 =?us-ascii?Q?XIqooy10FA38dL7xxptp/RH+5Vwho+OniZP4uDUc8OJtDunYlJhOfoSQk6An?=
 =?us-ascii?Q?dWMB9W5Ux7ZarPoJdeeKc6RzbvwJYJndnbKfTWqdhQqQ25ey3/acnEO3ctdA?=
 =?us-ascii?Q?hPaIaXX2OETCBsHilTPzllqOFs5fgzGrpA6ebANHqK2qSE3JrzTR4/Cd5ZYm?=
 =?us-ascii?Q?1bupzQeIjb07jW/TZT6XLPayUkvL5XswzxtwPOU/LKsoFUqWvqNPzeAlth0I?=
 =?us-ascii?Q?QLF/g26LnkRNaS6ftZhezTUzJ9dXGBnOj+NJJm18mS72t8e3U7zb3Gi3BCTI?=
 =?us-ascii?Q?BMVINH4hVVRzPzRvTZk/Hqh14/T3jGKdWP0/XQp1KMHkomJLSlvevM8Qd45w?=
 =?us-ascii?Q?99v8d0Bx7Ip1vIUBs0wGb/iLIfcURblFvOVIw3gKG2DT80nB+Dli0maWCxfP?=
 =?us-ascii?Q?GJ+1xR/U7V5qMYWSoD+or2kjvmyrbsTjMMj4K7IU04J6K5wpZTWAytBeGzsY?=
 =?us-ascii?Q?Qwyc4UEoRy5TDCj/npI9cZzuXizMBc6+iUxZL91m27XeAHeVXYk7DgyJYYRc?=
 =?us-ascii?Q?TQMzaju0mu/Bq1+PT+eBpzbh/uHODdeCuaVFwLPF3XxLe9mgQs3W5a6S5a6f?=
 =?us-ascii?Q?shUALI//b4LygZhLUOgi0toT63C/ljCLQI9V+uobyRL95bb7HzNyqp6iU0nu?=
 =?us-ascii?Q?Nkz8ZxmgfVMRmwMcLoxY9LQ5DpZrsRawPwRqc6cC1zC+IkPqP7WPKQ7srW3r?=
 =?us-ascii?Q?BbNzepA4CpimEnp3q8CK+7ZBcOzughuHAcfV2AN1tkCZeRuc4s3n9BZ0ShJh?=
 =?us-ascii?Q?/oUzqjvGZsGO1Up8brbysZI5pWdRdSOxWC8XKjN60LiQrDDmvuHQiF3iM9un?=
 =?us-ascii?Q?8m3knhmuL5tNyvsayDf6Wilf/9nL3G7qrzN60jPuvAOq3M5b426HDlYPfLxb?=
 =?us-ascii?Q?WhSFYrTbNBJkHCLqErVHcV5q1JTUFDa4Qgju/vWR8qm8xBVN2wUuTiFzB6KA?=
 =?us-ascii?Q?kNT1ciU5ISRBOTwwM4hGOtdHSztgilJhcFX6UwB2aDSbGLWprm488T8123H7?=
 =?us-ascii?Q?O50zu9rfswfo3T/hg493qs2c51V6Q/o0J6oGtWpv7KSrG8UNtUi2z1Sm70ZL?=
 =?us-ascii?Q?P7g3ypSptpoF9CS4GVlbCFnAeBOPGRfGIMmiiJANxVXcvyNNjITejWKnst98?=
 =?us-ascii?Q?wZAl/KbhoCsWMcpl2P0tyrTwqP2z7sriPY3i5Jkv0mGXeVOzLUJrzbcmVlaC?=
 =?us-ascii?Q?nHJCT2wTRr0VzNPu8WG2Pe7hp/+U96RNCVkca/iwkknGCIIBsJdH?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bd4877-4266-45e9-b094-08de6b8ab11f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 05:34:15.7111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQ2GKIi7IgRRXtyQJ714p/Rw4k2cS083c3eyGiRKyzcI2LVktCrKkq1g820y9AhwgBSIWUFWHYbcv9pKDplAZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2405

This adds a general pointer projection infrastructure which is intended to
serve as the basis for generic I/O projections. The idea is that we will
have a unified way of reading/writing MMIO or DMA allocation, creating
typed subviews into them, and able to read/write subfields safely.

This is the first step towards that direction, where an infra for
projecting arbitrary pointers are added. This takes care to not assume
pointers are part of a valid allocation, so it can be used to project I/O
pointers, too. `dma_read!` and `dma_write!` is converted to use this infra,
as they currently have soundness issues [1] and users have already
encountered limitation of it [2].

To aid the logistics, patch 2 retains a compatibility layer where the
existing syntax and behaviour is still supported. Patch 3 converts Nova
which is currently the only in-tree user of the API, and patch 4 removes
this compatibility layer.

I have more patches in works which will further simplify Nova side, however
the overall dma_{read,write} syntax would remain the same.

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Soundness.20of.20.60dma_read!.28.29.60/with/573645610 [1]
Link: https://lore.kernel.org/rust-for-linux/DGE9DBH7X8CO.2EES6EX8UA5ZF@kernel.org/T/#mc17b9c0309ac10346b3d6c6bd8461488e7c73161 [2]

Gary Guo (4):
  rust: add projection infrastructure
  rust: dma: generalize `dma_{read,write}` macro
  gpu: nova-core: convert to use new `dma_write!` syntax
  rust: dma: remove old dma_{read,write} macro compatibility syntax

 drivers/gpu/nova-core/gsp.rs      |  14 +-
 drivers/gpu/nova-core/gsp/boot.rs |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs |  10 +-
 rust/kernel/dma.rs                |  97 +++++------
 rust/kernel/lib.rs                |   5 +
 rust/kernel/projection.rs         | 269 ++++++++++++++++++++++++++++++
 samples/rust/rust_dma.rs          |  18 +-
 scripts/Makefile.build            |   4 +-
 8 files changed, 350 insertions(+), 69 deletions(-)
 create mode 100644 rust/kernel/projection.rs


base-commit: 9152bc8cebcb14dc16b03ec81f2377ee8ce12268
-- 
2.51.2

