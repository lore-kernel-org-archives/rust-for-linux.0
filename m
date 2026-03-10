Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010012.outbound.protection.outlook.com [52.101.46.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF5436EA8D;
	Tue, 10 Mar 2026 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138506; cv=fail; b=shmekRBieFfTqI3bzS2Qfg2ZGDBu0N7q68vVodk2KRwtg/DrWDLcNkIuFifmxE3rEnPcgjF9JUqlsqqKmyFH5KosWcpx4t8WtVPZSGvMTIGQ9nYSP76CbukXna5x116FtD3jwRLOeLzX5eRm6xLLpoUT/26NMzSMD9owXFU2NZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138506; c=relaxed/simple;
	bh=kbRUGcLwzbpjvReJYDvSYfi5JrB3kraa/ZrZOtt2vfQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=DiHzC20NecCSK/XF7XyjY5ZTfnGYwZv4wYn3qvJxXuk1sXxRTP8+f12cEuMVPe0SdXI6yrZT1zbyE/7spANVa6UmDIgMDqV9/Xk44nV0YhUyV6oBr4AjYHsRny9TcZ7vbXhig8xuiaOcM7OWz2OF196LNyGsYEbgkLkklelFF3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=osID/tHZ; arc=fail smtp.client-ip=52.101.46.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="osID/tHZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDtxup4GEco48pViRvHIBdzGM3OLb98XfeYIQX2yVHz2V7vGdOPJ/tx/ES95B1g1/m+Fmvr7ZZBU1eC/PKkYzoHocj8nHnakxgAFCrZ8JtD7/UbRHo9HD0IXihh2dKdPXiwu9mmAS9d+9BeBCqjgCtsNG5/De+FhkrocwThyJ/KnKC7sd2XAWniRyUAZd9FkKCmvwGbDlgiqJy3Y+v7MmgBDD8IaHtSrLqG4GzR944wAjUAOU+VBbzLrwQJfksmdkQEjrn/6AwKeHrpTaZA34/3IBO+zF/rJuKBgyacoCWbS7X+A0TRPD8/qSFvYR77kv9mHzggWPo/hfuagAcBqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxP8PnCBvbxOjTVV8qpSk1PBPiHlry92IY1e5F9JAqY=;
 b=lBJjMtDdVeoDRAqp9GuHICUKTqhqWpkDiXPKIc7JeUse02OYcRldfBrv+TCpQUkkmkSN0oAMOPU75J0F1y87HMNS0xxcGT8i/nWnJg1A24JXMyk4rMqihxpCn7z9XHMI8vab8sQwjl19okTwQtD/7ny6zZF47NNc6aCuosfWQ2AW+rbIcb3INBfDAL6tQmeL/rJxuZxTDzzIzpfnA52yW2esE/goLtIrSZxk3W/sONx/9Gv6QK22rV9V03X9QBsYTtt26/EDAQA1VQlZaSEtwLghdgewv6raThZ4hasuUfqxhlo2NjRvTUVofAm9uDvcFuqI+olayiotYXzgUBNDUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxP8PnCBvbxOjTVV8qpSk1PBPiHlry92IY1e5F9JAqY=;
 b=osID/tHZGEGGcIUAQz9V8RqlqmUwyhtwnjEMSYw5NtAFNumyljZ+A1XukzY7gf728Gx/nijKbZB226hnHpzjjmMOAX+ecFdCACdBGDCDLV0Op0HZM69HmGULUuL4oA7NvgUEoieveS3cZXv2MXGdTvSkEGL0ur5Nu5R8wU5msW3URltKGJyjoXc12wF/A4xx4IberrlEEECqm+aZOgr7RmD6dQy4qgxl3i2J0Ihb6fRLLTX1ECKO8ea590y31+30ljbH/19/4mtM00pOeuLOdkqcuRcmDDRc04tDL1dKLKo8ePAyHQkYciGdS/tIBgBTCNTepBt0Vw3dJbyCr+TWhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7958.namprd12.prod.outlook.com (2603:10b6:510:285::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 10:28:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 10:28:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 19:28:17 +0900
Message-Id: <DGZ150DHI878.2YXL15FY7W0GG@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 10/34] gpu: nova-core: move firmware image parsing
 code to firmware.rs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-11-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-11-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 495de414-583d-42fb-0243-08de7e8fc047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	PPVLwjmf3nsDzFsUc2jQDS1uWl4Pryk3wHI1b7bJ5XJFf0Iislw6z9irVMNghl964HjX/Zo1A+PYzkFWK5n5KYk9mymU5xPEEzFaSkRBjo3r9Y4UzW+pZQBrL+pjNPdWS2eqRzCp4Ulyeb3k1trG4I+XdE+GgY/L4B+JU+t63X2s4gcEBg6bD0zHXrhFSuqsO8mrfQci+3rYrYohbrprS+3ZVVs2Yv3wj+pC99FxQNjWMRpiJIQ46Vp4nQUi6fvVWnctvl51EJdYWg7V4jJCkLGtOXSoiJuX9RcgXIPYpzqVHTXUM0TSsqgHLOifjSyGnylc5bWPCvJcjK3mqzN+slEYnbYqBIgNbeG1FgMx7HjhUBWbazK1whvBLVULrEd4BPUVdmaOw0BkmtCAB/9Jaj9JgiPsDxL2GU19fndSSpo6nw9f2p19QyzYxRtSlqWSZIL72+pl5F0fCamPwOuNdhVqXiniqfzmiUTmUg2ZtffrQEXDZ2ef79XtKymxXEcNFqCnmOwJ38ysFloNoRea1bp3Ysn+oVgxpzIJIiF7qaDpXWAqq/dbhy2GjZEEMYR+w+TlFJ4bJSxNofuwFc568wrrVMKHRrvShRuG07sMfFDjsLJn7A2t2Hrv+RbcVUkkUFgt7jPvbLAgZutsBSbGBTc/C/0ymYo9ROms31fKmDdbqHu8MHgBQnAfP/bROAC3Ay0QY8O2IY8qG1nHgcFWljlm6yGLK012rmHnQNrPx74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3VIbHpaOEpWZ0tlOW11WTVxOXVTNmtZK1NQZnI5dWlHcnhqQ0tLRVcwaHdC?=
 =?utf-8?B?VjdjTitGRldNUW5HdW9zR0Z5Z0MwQ1J2TWhYRkd1SFpSUTBhSEJ1NWxMbTlo?=
 =?utf-8?B?eE9vWHNVSUdjMXB2ZWJERSsrMGNxOHdyNGQzSmhnYzVsSWNMQkMrcUU2L2xO?=
 =?utf-8?B?L1hXV3lrWUg2WmNEYTdHbW5ybmJMNXhLdks0cnZhbm1ZWDE1d2hlRmdYKzRZ?=
 =?utf-8?B?R0N3a2hzUWZkTmV4KzQyWFUxVkdpZnRxNEpNbkZiakF0ckFLOHh0NlpjU21i?=
 =?utf-8?B?UFVBNXdycEl4YU1xek5PcU4vdkNrd2lkMzZKUUpxNG5QS04xQnpPamxsVHpv?=
 =?utf-8?B?RFJlSS9SbTR6WGZCczRvcDVCbkxRWEVlQ0JJNnUrYTlqUi91dXgwdmFjTDBm?=
 =?utf-8?B?Qjh5cERMOWtxdGVXOUkxTHA1TkJsMWlXVkE2eVJGVUU5aVoxK1JhRTJBRmdq?=
 =?utf-8?B?NUZLMVNzeGd0QnJ3cHNOWE9VN0h6OXIxWnpEYVUzQVRZOVNscU1nc1VzdVFC?=
 =?utf-8?B?TFhwRXU5dHgweVRHbTBzZ0p2WVBPV0dsaTc1K2U4b3dUUlpvK2FXeThtclA3?=
 =?utf-8?B?L0pjYjJVcVc3dS9nSStuZUJhTkhOSERrRDJsc0dvWUc1TWlxK1JEZ2Z4cnl4?=
 =?utf-8?B?Z2hGR3Z4T3drd0hJeEtvN1dSeWt5Ymh6d1VGaHFKbitXeTRIZlNtM1NzSjVM?=
 =?utf-8?B?elY1dHQyNnFFVy9YRGhmbEk0ekkxMFMrMkdRSnRrQ1NNU2c5NmpBaGZBZmht?=
 =?utf-8?B?bVlxMWVvTkF2Y0Jlclc5RE5MaDRnMFU0T1cwaHJYM21hVW1rVXJhYW50RTMv?=
 =?utf-8?B?b3BmVDI0dDlLNjFmVG1jY3RUV1FLTzBmRWFpc09ONGZOYlB6ZkxHR05QL2tJ?=
 =?utf-8?B?NVJIV0hOSzdxaUlYd24zUS9GM25kVHVIS0c2S2ZFd0s5ZC9DUHZldEJqZFZ0?=
 =?utf-8?B?NjBiVDdNaExyUWlVd3g5TGU2U29XaWNqTk54OHVaWGpHVjJ2ak1PbHkvY3N1?=
 =?utf-8?B?ai9IYXI0TlVaTThLSmUrUkFBeE1XM1hENlcxRlQvYXBFRkllZ0YwQkpKbDRs?=
 =?utf-8?B?RWx4UVVvTFR5YmV3djZYL2tFVkZvRW1XOUwrb2NYQTBmT0RNWUVUVC9KUDk4?=
 =?utf-8?B?MmdWZXp6R0hYUkZpMjg1QTQyWmdEb0lPRnd3TkhVK2Z3KzlITFRJL0hDYUZN?=
 =?utf-8?B?RWNndkFPVXNkWjVKWTJUaTl3dTVrM29NbTNhOUR3RzJtMWJzTnBpTGxXdDhB?=
 =?utf-8?B?VEVIdlNvQlhrS2QxY1VHWTZEeFNSTzNnL2IzYjYwQ1BiNnNoSXY1MFJlY3Bz?=
 =?utf-8?B?ZTZwV1JSSjNWRzJuaVFLYzFoYkMxZURvNHpHRGsrWi8zVEg0bHdjRTVqcDVP?=
 =?utf-8?B?OEVUdmxFK05ZYXRHMUtISmFNakJnNDBDU2ttdjdjU05oTDMwaVU5SDUyRUk3?=
 =?utf-8?B?VDIwd3FNVTNpS1l1UGdFSEd2aElQV2VZREw4UnlJdmtpZmU3ZGFkRUlCWkZ1?=
 =?utf-8?B?QytPN2Q1MXZrTmVaeW4zREpRSy9aek9pRDhNSWVMZmgveSsvdkg5ei9zOFla?=
 =?utf-8?B?aDYyK05aamIyRE5UUk9sQlRRTkxDMEhLbFlPa2d0NG9GZ25haDMvUmtsUHdO?=
 =?utf-8?B?NzV3RDVUWS9GRnlQRGJ4RStlWURYTHkyL1NqeUxWWHZxRmlaZlNQZnB2a3hJ?=
 =?utf-8?B?NjRudURidUhYcE95akJJYzRjblc2NlBMS3EzTGVBQnJUQ2FhL1Z6WGw2VFNm?=
 =?utf-8?B?VCtrM0lDZ3lkYU4xKy9lVzkydklMK2hXeTZsdFBaVjNUMlRSR0pJaUhMaEZl?=
 =?utf-8?B?SmVyN3d5bEFSaXM3VnBMWnhYdm91M1JjaysvUmZmd0thUFVWWHZ6V1k1K3hG?=
 =?utf-8?B?cnYzM2toczBYQXRsYWxsN2ZwTlBoOWVJMENSbUdHWjVPNytTeFJsL2FQanV4?=
 =?utf-8?B?Wlh2Mk9SVit4TGx6YTRVWXp2RE93cERQdGRGYXdFOExtVS9jaFhPNjNhRW1R?=
 =?utf-8?B?QUdldmZUNzVxL05ndUlnWGRmWElJMFdzNzlIMS91QTJCMkE4T24vUlJhamJK?=
 =?utf-8?B?N204VWt1OFlXTnRzeDZScjl2WFU4SWtGU2F4bkJ5SmlIUWh1MzljMHVBT3Ry?=
 =?utf-8?B?aEc0OUtGNldiMXE0T0xITlkrdmNqRlBqQVdwRVVZc1d2VG5TRkxUZmV4ckpE?=
 =?utf-8?B?KzJTUHpMOFZrMnduV0psY1FpRmQydGl2NEpsdG1DL1FmTTRNSnd2bjNDbGwz?=
 =?utf-8?B?QVZjRXFlUllITDdlQUFPclM0MGVaQnlXWnI5QVhRV3V3V3liL1ZsTHFHRGVB?=
 =?utf-8?B?Y3lkemZnR1FRaG83dVpncTN5eUxvRCt4U1dmY1NqQ2lmclBvb2JUeHFodHk3?=
 =?utf-8?Q?bfO4p95B/gAOuGROqw1qUL1+UgyBPHSVpg5XarCGLXqlV?=
X-MS-Exchange-AntiSpam-MessageData-1: mDww+W3oJDimkw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495de414-583d-42fb-0243-08de7e8fc047
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 10:28:20.5851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmbPifmH4prbGzHpjcJGcG9Ng6Y1lMIkshm1LA34QfT0jCUn3udbqTv9/1LE0MGHqS5dfOx8BIcGESYpUByPgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7958

On Tue Mar 10, 2026 at 11:11 AM JST, John Hubbard wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 468f4b43574a..f247deb06633 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> +use core::mem::size_of_val;

This new import is not needed.

