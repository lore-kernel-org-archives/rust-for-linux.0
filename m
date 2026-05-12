Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022108.outbound.protection.outlook.com [52.101.101.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD693AA9E0;
	Tue, 12 May 2026 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778595085; cv=fail; b=IuOIHBmugQ6SROvMWOPrQ+3Ox0q/5mRBgALQ+N2aDkMYXfaFvdxHzrdQASgJU2dnhA0/2ohR1Wa7p9wA9VhurzpuWiFKeScBjoZ9DNgSTYt35X47Fg813qXj0trX8ksmlIhNZQ04EUuc0pHOtKWJjbhmgTJng/4SeVFfRaIvAHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778595085; c=relaxed/simple;
	bh=U8Krl5We5R4dIksdvfBR+Nl+cenjeECRz32/JxxNn68=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=IjmEI7gJZZmLgrBSDmn3ss5u9iUZcgGx1uNnVS/lo1rI3XaCbQRDelLFjH54OexEgD0RKA+T50WaYCAHe1b0rWdxNBNzbWmh5O+RlzrOVF/TytNzRPoAlwGBrX4NP+jgw5WWAOaUx2V6ksBUCuoVQ2/GlvbDyZZfDFAuuV3ASbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ODaCO7pt; arc=fail smtp.client-ip=52.101.101.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ODaCO7pt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2fU2nX5yWl2m2kSnqUbkYqXNDJDw3JyTqhb26w8/0nfL0ENMhO/KnSySKBm0TUFSIWa0xsQvj62UWxMPAjse8xSSiz+LxX+PELnyJhNAftwFkKXgwjzGT97gUXQ1HcJQC6EpNqzan0c4Mni7VkB6XaU8TQJ7hy4gE7tHjHIJ53l2Wxelr1tUSuYUNIuPEt12A7ex2SopbG6prG0I92wD6HZ0EoqtsMGQ1L61nmY0Hu517kgYHKKfOsQhKI1A9RSLtcTBMADw6Td8wbdndBlGONURsnxnq10UWDkTCuy7Vw4VeRnODZgiqwXtJHoeR0nn69JhbMQAQlYEBwL6w4jIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b43Nes0soYgKHHMDbWd1U16aDUHEIO4V9n4eUYNyxjQ=;
 b=KwvZ0rmRMWhdpG5se/wRFwLaL+0WgXEHAcv3/1lKZp4F1TitFACWftEnbQ2YxEoyA92a2TPQJ1L6o4AHUk37gjr+GwABcnteszH+uaDrgD7yc01YFS8k+FcVuMwLbMbRjb3Oh/Cjc/badUBcCfcwozUKy9wCfoWKCRe5IWiSlUDEBEfYVsAdBJ0x4PBxr26WHMLIWzXAaR/R4zl2ippelWQyKjs9g/DQdm6JKuT+mTDyqYs35PJ77NU+HFC0LFsusuTMmoNZ0lAM3pBj5vXeMDUD3si9s1wPy7AuBgbrCjMx2DS8t4Fsa2g02NXqqbuHRnSkMui01TCvwoxDiUr1Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b43Nes0soYgKHHMDbWd1U16aDUHEIO4V9n4eUYNyxjQ=;
 b=ODaCO7ptk40X2pjajiLTbnr0g1Yl1pU3EWu2gUHmQWcd+JAUVIpqdga/GaHjR4kZxpFRd2jnkB0UXAyUoF9O/JFXgFOjOwoil+lTc5vNjfoekRN/+Vs4qKDGEAY0FXy3RtCS/UauDvTKjQzIj6XipD5X/AYJYO8Bp0x2/sI5ito=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB2219.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 14:11:20 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 14:11:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 15:11:19 +0100
Message-Id: <DIGRC3P3FDOB.YA7DAMG3A8UR@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, <ljs@kernel.org>,
 <vbabka@kernel.org>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: alloc: cleanup doctest imports to "kernel
 vertical" style
X-Mailer: aerc 0.21.0
References: <20260511214154.3569305-1-dakr@kernel.org>
 <20260511214154.3569305-2-dakr@kernel.org>
In-Reply-To: <20260511214154.3569305-2-dakr@kernel.org>
X-ClientProxiedBy: LO2P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB2219:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d82a10-c483-467b-cecf-08deb030572f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|18002099003|22082099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	JzjSdEiOO8v0MYeaHqTwnhLXz3+qs1u6FEUjD4xPHUDLnkKyGA9ZXuEJ7zpzN/sTKfKIs/phRBceI5bP2DFQhVPYaVr+YZ8RnzyJKbvTH8k5LZKo4btAkMnBZTsgsItitCM+shXLLKkk53xyZq385dDFwi5rXDr5voOu6UNJViXvdcZ+MES+VmnX1x1GJ62FZyitd8JcmW0PwZqKAac/ryLC9xXaoHUkqqVrKIX+VdXnhkT49umOvuReAeN2Zm6E7/by1ziEDpqpmAsv2vU17aXtNkvxvikzcS4g/jusb3YwV1DyAISQQRYKaFID8WkO6ozCIMUGeLJn4IvPl3+CtbI7EyKjXr58rAseyebFxE5v2brRu/QieVpOZWdwUZZDvEEu7dM9v+jfcAWgoGMVkNy00sr7wu7MKx03U7uqnHBfFHetTyMuNH+N4smy2rTW5YIIrtoCOEzdkewZwVJsFj4GhS3dZdjT44wq80RlHeOxoai9q3xJZiZvhBK6J8NRxOa/ohsBf6PvrQoW0Zm5w3MrFJgilftSb638fgEXRveGpdmdodaFA0BlCw4tM563Ha3Yy6SrsbQDTmq53T7JNXOJ/aKSGKwJ6IytqrGg98mJYFOSJAPINEb+oJDMsPLFwvcOyLOZptcsImb+U/xA9p9y8qJEP8gBmBKxIsClTDc7xsEJBI+EeaMjS1BCF/fjxh6frFd85/KwabiJfcpTW6415G+1Fi2O83hTIoKYWR9jawO7JhnAF+Jvo23d3Uen
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(921020)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUZvVzlVN28zQ1VPYTNtYnoyblRrdDNLM3V1TjlPRDF5V2pGU1c5NnArdGw2?=
 =?utf-8?B?eUZhdW9WMTE0WkNSSFZ1YTNWRVdiU0grVGowV1JGaFFkeUEycTYyUmE4aUcx?=
 =?utf-8?B?b3c5bW1iNzJ6b1VqWlU3dXZkUUVYSnE3YnpkS1lJM3BIcGhjN2pSTHZrY202?=
 =?utf-8?B?N3lrOGNoTWdMTmgyKzRPd0dtSk1mM1hlUmMwdnZQaHZDdkZBeWRqbkltdzRZ?=
 =?utf-8?B?L3FFN09aZTNQWEt4TGNlNE1JZ2VicnM2alBvYnp3UDlkdDAyak9uNE5ENHd5?=
 =?utf-8?B?cHo4UHNaelVaczdJdXFVV0t6N1dXRE4wa0hSSEV3cmlYNStaZkNjc1dDWVBR?=
 =?utf-8?B?SW5vc3lPOVNSdXAzb0h5RFZMUWx6WkM0b0FrSDhWMlNURjY3MU84bHR4YUhk?=
 =?utf-8?B?a08xYUlFUUZSOHRKNkhpSHB5dmRpaTF5THgxVmV1Wi83Wm9EY2JIVHc3V0ht?=
 =?utf-8?B?NXN0YW5YQVBmZ2RxUmlmWEFITXZwQkg2QWJKb2lDUjAvNG1DMk5RR3ZjU2hQ?=
 =?utf-8?B?SXVBd1I0K2FGTWFxRXBWYWl6NmRSWWNKNUdQc2VSM2lGM09oZittOWdIMlVG?=
 =?utf-8?B?NTFuQ2pKQVV0UEVpeDV3WHROV2dFMnJ3dktJb0N0L2hUUjVVWjZpVTZKay8r?=
 =?utf-8?B?dW82QVdOcnQwamZpU0VBUjVWdlo2VUJMekFNK3I3a2FHSXd5TndiWVA5cnNT?=
 =?utf-8?B?RzRnSXFrY1pqc0QzWXVEeWZJSjF5VEtqSU4zaTBvazdQTWhPSCtPRnByY0pk?=
 =?utf-8?B?Rk8wa3dRWmpJM1RJZElYY0R6aWRmdzlYYUhoVm9CSUZ3RElsUDhIbm9UNzNm?=
 =?utf-8?B?QkVFay9kdWQrZ2tRUlJvTThSUHl3UzZ0eGVkeEN0T1prYklBL3B3VWt3TzRj?=
 =?utf-8?B?cE1KNUlsSXJFcnlBbTNwb1dkL1VZek5DdS90ZEo4a3JYcVlRVzEzcEU2Q0Fa?=
 =?utf-8?B?dnhzTG5KMFpVRlpJNGhCY2NubW5wNENxM2tGWXUvbnFzWXdtVGljdzBGd0Zk?=
 =?utf-8?B?SGUyb1h5Mm15bW1tWHcxYkMreC9paVY0bWh5dmx1M0YwenVFNERnWCsxSDMr?=
 =?utf-8?B?K0tmYjJIR1cvUWJMcmV0RW1LNkY1QW9ady9oL3BNNk5pNm9GNkN4MnR3OE1p?=
 =?utf-8?B?N0tBZ1VRcEU4VlZ3ZEh3bDZsS1F1aW16UklaOHY5YXJRR25rQ01TSTBTOEhF?=
 =?utf-8?B?THNZZnJNZnFzQ0YwWnhYc0krWW5XMVBGZWRNamR0M2JkMFkzUDAxWXg1ci9G?=
 =?utf-8?B?QWpWNkNXeUowNDE1UXRkd3lYWURXNUlJNkY2bksxaG42NVZrV3dMRHlVTHIz?=
 =?utf-8?B?bUxsQUx0K2VMMTNkdkxCZnZEMmpWbGVEeElSZ1NVQ3ZlV1lLTkl1b3RDU1gv?=
 =?utf-8?B?dXc1cWdMT0MwVjBiNmJJVDhRVHZYYzFrM3VxbHVGL2VHakNld1hyYkNzZFo3?=
 =?utf-8?B?endiY0ppT1NtMEYyclhSNURaRkwxRXhXcFRmcW94NDRPd1FPeGxGRFdlb0lE?=
 =?utf-8?B?Y1VnSUdSeWF4NG5GOXQreXdTNWF1QU9hbXNocHI0NEFaNXQ3dXRGVTIzNGNX?=
 =?utf-8?B?eEdkQ1dlUGcyVCtWam4xOWJaVXBweE8zeTJ0ejZTeG41SFU4N2hoWm1Ycit6?=
 =?utf-8?B?Nk9EeWo1WTNHeUg2Y2NmZmdXVjFlTTNKV05COWE5OVJya0hEZmdqMGl6L2to?=
 =?utf-8?B?Q3FEQW5BL3lHVEFHOVpMV1kwa3hZTmpVa1dvdHJLNWhma2FTb01jWlhaOFpV?=
 =?utf-8?B?OGNXZGtyS0lCbVk3ZUNrNUM3L2lXbENWeGVFYXJnSzg5K1NrNTFybmtZS04w?=
 =?utf-8?B?c0ZQUHFlNnltYkVUQWNxcUE2VlNpMXprTHVWLzRkd3oyMENvcVNxS08ybU9p?=
 =?utf-8?B?SDFqbmFmY3IzWnowS2NhMTBmU0J1K3lXOWMxenRTVy9Ja08xNjdvdVV3b0xy?=
 =?utf-8?B?S3loOHZxNys2TjdxeWN2ZGIxdCttbStEaDczV3BzQ0xGWHlNMzgzQWo5VXRU?=
 =?utf-8?B?K1h6ZGcrZnBMSTk4ZjFVVnk2b0ducmhHeVJqRXdBVzlxYVVyVzcwTTZ4WG5z?=
 =?utf-8?B?WnJqUDVOSktqL3IrUFNtRmFFYlhmb2ZQQncyWnNpMHpmUFp0MFBmN0RNcFNX?=
 =?utf-8?B?cE02d0xNa0J0OFZ5MnNYTDE1aml2elNEd3FQekFHTjcrV0Z6Wmg3QlBqT0Ry?=
 =?utf-8?B?aDltb0l6VXlhWHduNGwyWWp5UjVYQWxvekFDVGVVWTRFMUxreWw2T3lDSVk4?=
 =?utf-8?B?aEFUY3grWm4vVUttcGszMWhpMTRMR0FSYVBEVHNiaGhaRGUrK0pIWTdJVm5a?=
 =?utf-8?B?OUg5MzFlNzdYa21lVHZsNzFEZko1QmFnNDkzUnI0aUd1c21JNEk3Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d82a10-c483-467b-cecf-08deb030572f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:11:20.1592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zk708CXgK1CYFFRyf6Zs6D0DuC3ErjmQtGXPW0EYlAwqHczjN08Cqzg6QKCDH9xjCbPuUx7+z62Ana19doLeQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2219

On Mon May 11, 2026 at 10:41 PM BST, Danilo Krummrich wrote:
> Change all imports in the alloc module's doctests to use the "kernel
> vertical" import style [1].
>
> While at it, drop imports that are automatically included in doctests.
>
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports [1]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/alloc/allocator.rs |  7 +++++--
>  rust/kernel/alloc/kbox.rs      | 17 +++++++++++------
>  rust/kernel/alloc/kvec.rs      | 10 +++++++---
>  rust/kernel/alloc/layout.rs    |  5 ++++-
>  4 files changed, 27 insertions(+), 12 deletions(-)
>
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator=
.rs
> index af20332d59f7..562e41925ada 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -174,8 +174,11 @@ impl Vmalloc {
>      /// # Examples
>      ///
>      /// ```
> -    /// # use core::ptr::{NonNull, from_mut};
> -    /// # use kernel::{page, prelude::*};
> +    /// # use core::ptr::{
> +    /// #     from_mut,
> +    /// #     NonNull, //
> +    /// # };

I thought the consensus was that hidden lines don't need to use vertical im=
port
style. They're not prone to merge conflict, and it can be unnecessarily spa=
rse
especially if there're a lot of imports. Did I misremember it?

Best,
Gary
