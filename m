Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012020.outbound.protection.outlook.com [52.101.66.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1590C3AA19A;
	Wed, 21 Jan 2026 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768987014; cv=fail; b=mzCfF16ctJCboVQARBSXQA4GSaY1Am90/Ta6XzEVAf5A8jkSLu0SEufNQlNshSy3zK2WT3xbM2tMFJvjdiIZH4yRlx8KAPIGeUINnZWVZ/RNsyXltnGuJZLY7aktEfq9of7YoGOeZR5pu2SZqeQwh1gsct0WBiM3dgcP9HmCNxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768987014; c=relaxed/simple;
	bh=J5W+AJlKClc2ol4o8skZHrsoDbGifXOel9V92ypwOcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U0IbI13P5CY7FvNutAiNVB0LLCxF1ped6Xm48QzrU6TSbadSYYZ1qoR73Vc9lipTyBctteAytRTKoM0vPR77kFvOZmCZhncdRI+yZzmTf99TujAONuMEY0b2+FFO741E3gJRvfIQ3kyK5SNu+0RSGB6mDBn4laUvS9nEAh3zx+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=ryNa+yfD; arc=fail smtp.client-ip=52.101.66.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="ryNa+yfD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yklS9jasLUAUtBING5psWH/IAw3O9ht25jTJFXLBdH5ZyKkDOZB66j3tPqO0p7bOGg7gHlYPEe50tv488NfhekYtc4xoh/ziRg9YTYIt4a3P31fXRy9cxNocwIJKaBRvyf4sDsMtztKfFHfrtwHPfIVUBStw2wPWEO6oRRbQIzyIDRXkuqJhAXcNLsy8ZCPd6bS2z0+2WwCj4Z5WjcRjB0pFMew0Uokh1bPwEgsvzmkhnAhP2c38Ow6AnNVXesIRsKjPjr8G1AHsmNzggjEPXoaRCYGSS7BQ793hwT6EwR/9uCCwCtEc3+HNGINxB6Hsi/bRqo2BLftNbWBzbmf0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+siysN4gLwYeNBZuvCZAHCLi+ZKa4TTVCbC8rDXaR68=;
 b=yzXX58b6W5CDOc99cZ1SDr3IuqSjYlWBRlnwhXc+UarFFDBM3yeyGt03ZltRQaoQtQc5XI+BS+M7xGiQ0qEP1HLzm7n4NYy0ysPs3fXMFmJg9pMooNZxGXkp0tspGGD0EZ0gbFj2lI8XT8KDDegpXivSegOS8i4XQoKZpEqB0ttMLTHlFBbxxFu49NXaaq/rpbBOGFPfx9yE7hC1O16LA79mPORTq2/JRCMLtHji25YmKZ3vdxAP5c3TkjG+/+d0pJ+rntlOjP1/hCX/W9x4tNJQJ9GBhX18lSjV0zHdURFoLpAdMKJ3RAN5idU3Rxa7qibmKMrrtHrpYAJHq+sQ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=nvidia.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+siysN4gLwYeNBZuvCZAHCLi+ZKa4TTVCbC8rDXaR68=;
 b=ryNa+yfDN0Iz0Nekd/aktsmG8FQV1/MAw/KMxMnqkidYI4lJJznKdjMj/YQmabEF5cpWSddAeuwv5BbKKSu2yaYswsWtI79msuW59+kCkmuVV3VX93Hg8SceKtwxjEzuVdyny7pzuDb4zD9Ex8cDmRp6Ppa2sP/JFYmImg471xzpF8budM796roNJLx9oReOwRdc1tzEfDNF0BRK+4vs/JVZeSlVwxgZrdN3ie8BZ36zgreLbhOUpbBXcBCS4UTE/IYsrvfpNYNl0kZbGNqCB9v30MeL1EuzujImD2kQtNgNgEk+DUuRJAaqqzAGhbIn9rRCKLToHTXYoAH+0Y+r9Q==
Received: from DU7P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::14)
 by VI0PR10MB8716.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:213::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:16:48 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::26) by DU7P251CA0001.outlook.office365.com
 (2603:10a6:10:551::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 09:16:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 09:16:47 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 21 Jan
 2026 10:16:33 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 21 Jan
 2026 10:16:32 +0100
Message-ID: <46e19de8-d901-4f57-a898-3717c554e067@de.bosch.com>
Date: Wed, 21 Jan 2026 10:16:25 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 0/5] rust: add `register!` macro
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
	<dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Daniel Almeida
	<daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
	<tmgross@umich.edu>
CC: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, Steven Price <steven.price@arm.com>,
	<rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|VI0PR10MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: c3226efb-5007-4723-b6fd-08de58cdcdf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3pDb21aUjZnN1h3UE93dUl4Rk5zQjFNVHFnUHJlQlM5VHV0RE0vS012UW9j?=
 =?utf-8?B?TjNseDA1ZlJ2alBPaTNQeUdXbWhxWm9xUnAwc0JhUGFTaXRBMFF3dXJvRE11?=
 =?utf-8?B?N0JCUGVZYkt6YWRLYnhoZDB6RjVxUWNMdnRsdjYyZEJ0VllOMHloT3hPTnNo?=
 =?utf-8?B?TXBlZkdFbjlyRzkyaVcyeG1HdWlDZWl1NWFSV1ljYjRYZ1dYNWI5WW53QlFV?=
 =?utf-8?B?U3ZrcTNxbVJJeUdLQlRIRlV3YVFGeW96KzBqT2Y2bCtyNDV0YU9HMGJKcTdn?=
 =?utf-8?B?UlV6WldxWFRrb01TMWZHTzlYZCt1MGJVbUZ3Um9oUmpuS0tRYTBOaXF6TThk?=
 =?utf-8?B?eVgwbmJrOWF5aVFVNmF0RUpGUjFlZWFjcmFpVjBSeEtCZUtpUGlnR3NZOXpT?=
 =?utf-8?B?TGxla1FjNE9wMlRvb1RnMFZjeURBTE5YMWNINFR0RXRIbVBlNFR4YWJ2d0tT?=
 =?utf-8?B?Z3VTOExtaUtNNmVic3FjdVZEZkJzQzgzODA5TDNjMGtOWnM4bHdpTkFhc0ZY?=
 =?utf-8?B?SThjYjFNUzBCd3Boci9BRTB2bUFMM24rWnNwalZiSHZkZEVhVGFGRE9Lb1Nl?=
 =?utf-8?B?OFJkOWhadkJyRDVUU29kcTZJOS9kYmcvSmIwbXl6MWlHK25xdVdUcEdWSUk5?=
 =?utf-8?B?dVFoT1dnSVk0SXo0QlFvcFlBdk16dXc2NnVROUZtekJoRCtHVGRUTmI3MHhv?=
 =?utf-8?B?RFVEd0tKeC9HVE9NQncvR3AzbFMxaUpFd0NDZ1hzVzViaStKMEIzb296dnBx?=
 =?utf-8?B?ZXFINjRhR2FVVFY2bGNHMFhhNFpvMXZvY0R5L01iMy9qVEw2VHYxTFBERzdj?=
 =?utf-8?B?Y1l4UE0zNjU5cEJEUTVvSDJEekxLL2x5UHNLY2licVplNTBST2JvSzN5a1ZQ?=
 =?utf-8?B?S0pERm4weDFib0w2am9jaHhtR1NlSjFXN2V6TzV1Q1VNSjc4cFc4VzFuSTEz?=
 =?utf-8?B?YlYrZm4yNzZva1VXQTdZRUlFTmFUMUc2eU0vcjNYaEl0VUE5MlAyUDFYdUNT?=
 =?utf-8?B?R0h3eVJFOVlVUWMyL2Y5YUZVMCttMDgyUmh4K2tSK2Uzc1NvWjdtd3EwUHJ5?=
 =?utf-8?B?S0lxd2txUE1wcDFFZEVhQXdxMlRKOVhsT1dqT3pJT2IzcldhOWF4M1l3KzNG?=
 =?utf-8?B?OTNqSHlhV1EvcjYvbVhYRS9vRzRTSkxhazErRDlrS2VhMkVSUkt6QUdEaUxy?=
 =?utf-8?B?MXIzTlZEdGdKcmZvUENUai82aTYxY3A2ekJjKy8rZmxDQ08zZmIvK2NZRnQ1?=
 =?utf-8?B?c3pkWlN3YTZmeTgrZy8vQkprMUpqdkREVDlhOTNRWmY4aitaYTNJMGVDNkFt?=
 =?utf-8?B?Tngxb1l0NTlCdU1CbGFOL21wNlB1RW84Tit3ckJLWmtCLzR0Vy9hWUFhZ25s?=
 =?utf-8?B?cElBWWVaSUVpVDZtQ0dod3A3LzByMFRtdk9acjA5aHNwTWJSZHpYWC9BU0to?=
 =?utf-8?B?dHlITmNHZmdqRDB6RGlVY0hqN3JXOURzWHJNM29oVWZ2c2plOTNxNlZjdjFm?=
 =?utf-8?B?WEU0by92NjN6OUoyLzBDVEpvdS95VUh6WmVUSEtKK3Y3aGp3SlZzSzhWbzBK?=
 =?utf-8?B?bG42M3J5L3VZVjJPZlVaaXFUUHEvcExRWVBGMUNmaXJDWDFYenFMcTVqb3cz?=
 =?utf-8?B?VTlOekhMaEg2WkRNOG4zUG5GS3cwTGNaUEhiVmVESTB1YVVFTU5YWk1zTXJW?=
 =?utf-8?B?cnloaGxIZkxtZ1FkaHluUENId3p6andtbDlyWUF6Y255WTV6dGhwNUZxVmNq?=
 =?utf-8?B?UWVWaDlldUY4bUppdXo2Tk1WQXRMbjlCVnJIbU0yemhuTStuWWdGSkdvTGJj?=
 =?utf-8?B?d3RuZEFrREJ2NXRBM0VnYm1CbXNRQzI5WkFJbk9QMi8yYWdhZ3dTZjB6T0lP?=
 =?utf-8?B?YWthOVBFMEFYZWRzZEJQZEx0QmZ0UktTZmJPZ1VpL1hrekFJaDFQMVZpWURy?=
 =?utf-8?B?d2pjUi9FVURoMVNSZEJsalhXM3djZ0xMaEt5Skg2KzluOU8yd2RqdkZ2NzVI?=
 =?utf-8?B?eWo0dGxLenNkRWUwYzEwR0xxSnZBLzlVV0xqekN0TEpwSGVrL2RBSFJiUnZ0?=
 =?utf-8?B?cUpQbm5nNWkvRDUrS2JzNWRHTDJEaW1GdDNPVHE2SGJxbWZmSXdYd0pJSGNV?=
 =?utf-8?B?Z2ZzUlVhZG5lSHd0UkJQWnBRMjhkTi8vNEMzaDhORkpudXF4TzZ0ZjRFL1NG?=
 =?utf-8?B?NkhzWnNsUlJFQVBzZEpaNkJEQzJ4blBNSWI4MWJ3ODJLNklhdEwzYzZqTDU2?=
 =?utf-8?Q?gAQKixx143w/ugVmniw4CpuzWmEFampTnx88+ez9LQ=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 09:16:47.8885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3226efb-5007-4723-b6fd-08de58cdcdf2
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8716

On 21/01/2026 08:23, Alexandre Courbot wrote:
> Add an improved version of nova-core's `register!` macro to the `kernel`
> crate for all drivers to use.
> 
> This is not a direct move from `nova-core`, but rather a new
> introduction to facilitate code review and introduce features that are
> missing in the nova-core versions. Differences notably include:
> 
> - Use of `Bounded` to prevent any data truncation when manipulating
>    bitfields,
> - Extended documentation,
> - Doccomments now build and run,
> - Supports visibility and different storage sizes.
> 
> The `bitfield!` macro of nova-core has for the moment been wrapped into
> `register!`, as a set of private rules, to allow `register!` to be
> merged first while `bitfield!` undergoes review during the next cycle.
> Thus, some of the code from v1 (including `bitfield!`'s doccomments and
> Kunit tests) are kept for later.
> 
> The first patch enables the `generic_arg_infer` feature, which is
> required for generic type inference and used in subsequent patches. This
> feature is stable since rustc 1.89.
> 
> The second patch adds `shr` and `shl` methods to `Bounded`. These were
> suggested by Alice during LPC as a way to avoid the use of the
> controversial `Bounded::from_expr` in both the bitfield macro and the
> Nova code. Third patch adds another convenience method to obtain a
> `bool` from single-bit `Bounded`s.
> 
> Patch 4 adds the `register!` macro. Since it falls under
> `rust/kernel/io` it is covered by the corresponding MAINTAINERS entry so
> I refrained from adding one just for this file, especially since the
> bitfield-related parts will eventually move and what remains is very
> tightly related to I/O.
> 
> The last patch illustrates how this macro is used by converting
> nova-core to use it, and removing the local implementation. This patch
> is to be merged one cycle after the other patches.
> 
> Previous work to extract the macros was done in the partially-merged
> [1]. The current series can be considered a reboot with more features
> and the `bitfield!` macro being postponed.
> 
> This patchset is based on `driver-core-next`.
> 
> Note that it also need `rust-fixes` to avoid an `unused_unsafe` warning.
> 
> [1] https://lore.kernel.org/all/20251003154748.1687160-1-joelagnelf@nvidia.com/
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

I gave this v2 a try on top of my 6.19.0-rc3 and it compiles now using 
rustc 1.81.0. I adapted my aarch64 timer TMU test using register!() and 
it works as expected. With this:

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

Many thanks!

Dirk
