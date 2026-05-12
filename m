Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012001.outbound.protection.outlook.com [52.101.43.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E90A344D9D;
	Tue, 12 May 2026 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593574; cv=fail; b=EB2YJcveDV6AoF/iO8U1C47FTEfWsDupI0M4IA5u2XjJLRREuQNAY2ZwVPNV/Y1J0oW82907spQfCsA/xgko1C0WW+H5A/oetwvHWjZ33jqBIa/4ToVOQO8BdZSiSiVQzwcEU9awL3K9Qv9wPxdFSIt0FTwl42fG+Y1RGfHB1rI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593574; c=relaxed/simple;
	bh=X+YVTj6LQzxsR9GLqQG0oBLOj2i1Yba00J/OBjtcAcs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=CrZeT7nbEw+OtzNu/6QOeiprBrYpfCo+KDY8T3m0xY4uT01c4LyXu/AdbJtqg7I7EUqpDb+0mDUUKIXOzCJop8+wgSfumJqFgR7OcuuGCNx5wuMSXGjo6wdcatc7vLX6VbHNlFCuhic//nt2gWPT46ZIL9d5KMdxtiYkiaJ8gsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UTS/YyqF; arc=fail smtp.client-ip=52.101.43.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UTS/YyqF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOi5lx0MZ2ojvXprMv5MdaldkIJGn3cd1koohCTDTbxdevDlXyYwf1M8ZPnLEWcTHhSmIlSZoeGrFyfGfy4wQBPAKqNmiw89YWQYLL9GNxtcP08MZNTpQJJJ2Pbqd3i5/0+M0bL4EcokPn7glmaIhaBsbxbO50vfFRHJoyNmSGbb9BwHtH7cj+XISgq2yfMcSTGlgqJUZnXSJZy7Gdo6z7P7oFkaL1t8K2F47ebiMDIxFbkGwS56vnPBUEFpn+UIc5Q2nH0Ew27nYnEfTyj+HF53PDcaBRfw7DXxuioZdzkXObAqu+LUt5TV2kUk+m+Aa2Gi3QJC9VOh/Z929mJxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4coSnIP0keNaVkNO2JiFzhNfuNJgo+4xKsrFMTwTHg=;
 b=SBhp1k/RgsxGJyg75/eVqqERhJHEgXQzMetkLGaAPgHCSx4Ak/kwbFn3jyqJj6fD1lZDZ9gUbdlOm2dyl+Wrgnw6GfkQcZAZkGhzc3MbK1mj4Acrfe9sQLjFnZSUQGpT12rCUm8FFKgkAY30r/N/IxsSQGiHQyRBeQKZG0ES/VV1yVYPyRL1jVC1A0cG8cTyQvwY2euMaWGeUm9lbAc/1EErDpUp0O4N5E8JPJ+qnPYnEp4lFFRQjXbUHpd0BG3sxr0V+pGaY9aWBUi4j7ksDO7PjzLaPXy2plwqh8wh1eFHJ+0KwDGDG3+su93vZYJtl+QUMLpCA97sgakPSsTFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4coSnIP0keNaVkNO2JiFzhNfuNJgo+4xKsrFMTwTHg=;
 b=UTS/YyqFXiKgZUcAsWZvlm6E4ftB0RuBSzGTS2fPOtiC2HB4tjWuy+ga1eq4DnwgtxjkShmlP615dJEpxfSJmO1Fv0pop4Zl4FNl0GsSkkzLsbsx8OlN4Jlp0WTl6SJmUJDspW2b6vMDD6u2YBaYDFpo1mdLuNiGSCQZF7lMaCWNa6H6x4Gi0UEWrlt89VVNgLabZUbJ4GtcN5BuhaEOLiyCkm4m0yUtGQLrpVGsGy1BQ9lfMTAkzZ52ePUB/nStaDXs0rRWO+HPBT6Kkd8z0xElG8ZALtML78+cQJVAcQ4KECxPEAh5L5XoiT2uIAOgkSnTnj1GPTqSok8odJVppQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA5PPFB29794CA1.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8dd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 12 May
 2026 13:46:08 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 13:46:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 22:46:00 +0900
Message-Id: <DIGQSPXOI9ST.3R3JHV2N5UNML@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] rust: alloc: cleanup imports and use "kernel
 vertical" style
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <ljs@kernel.org>,
 <vbabka@kernel.org>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260511214154.3569305-1-dakr@kernel.org>
In-Reply-To: <20260511214154.3569305-1-dakr@kernel.org>
X-ClientProxiedBy: TY4PR01CA0068.jpnprd01.prod.outlook.com
 (2603:1096:405:370::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA5PPFB29794CA1:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea05874-c987-47fd-d6c1-08deb02ccfc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|7416014|921020|11063799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fN3/Qn9i3ljemzmykg/RVePbe5oEKGchbylingY9Bv36rKTcOD+eirmMsZHty069ukn0Ly1Pchd3bfA5OYhrBR2C0IesMNaeChgQgnpfyeWRPzk3/w48FsxoY2O+CpEIwKEb1PyjIXbrpJdOoywNaAsBjWUUfX6bSqCmgJ64ld62a1AJKR0nyAoUdaaUhBKNAi0k5/3XBNoz9Y3uucpjiI+LC5ashWL6HqIOp2qhwNSKVl4iy7w2PjwxTFXju+WceKQ6qxoB1X1TWRQ/+7ZkQugD9wWzYvDiNgQHz8xKaPWCe7KTNZ/nAzpKjpFQbMqzPVRuND7POQRGLzRWnHa9yP/iPUE4WJKPRYD47wlr/XR2mlinyTXJOGYPNoeIY00fKmhcSGJZeK/PDpFyqisJzeYjWuMUL5++N9vTrh/Y7hzpmInw1P989iHydJNFtfMMaVZfvpaC4OLZEfmGisg+tnFVkz9uMuIL4cZqzFc+GOKqFppjYiTfC7VOEZrhal8kvqgYt9BsmWh9/Rnj6CmKxKkgTPuTj/TiCa2kPlLiGpqCFc5aSYMyj/4W81R2Wzd6Y0om6M0pndl2N45q4eVCeqtSDpTR2W4IbmMRsLEheweTntYDcPW7FoZnbf9ozdrc3JmiAXYpfVkJ30E3w/CponlHD0BJiT7Kjr7jUjDlQJYkh8VXmygh9b21y0X+krYodUyq9hnO/zk3rL41g8WFCgv4JOmqCL7SvOxvs19qwzWsYjUP0hp33/2G3rUqx4Zo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7416014)(921020)(11063799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L21qU2NCdXJhakMrN1g5RHBpSUN0Y2xjdHA5M0VyWjYycHljRFY2aTZTM0w0?=
 =?utf-8?B?M1Z3cS9DRXBtLzZyYkFyWTN5RW5EcWdNNUpzU0ZyV0kwOVJqYk9XKzdlaExC?=
 =?utf-8?B?OEVsNzJIUjk3bU9KT3dud2FKWlNaeWVvRUpISkRuL29ZRERFV3o4MGtMWktF?=
 =?utf-8?B?MzZrU3FzbHM0aDgwUE1OdlN2TUd2TDQ5dXY4emR2MEpTOVhDWkRteUNJYWtR?=
 =?utf-8?B?aW9EQXdzY1FPdzc2VkVMQnRQaUxMenZOK1BQVUhBYTVqeEUxNDNMajVlKzI3?=
 =?utf-8?B?VmF4VlByM0xJRHJHOVdvTXlkTnhuVTFPajgwOVRyTFBMM1ZPTnkzVnR5N3VF?=
 =?utf-8?B?RVRJNEV2MWVEODVTWVZGVUVTRE5iZk5jMHRwc1o2Tit0VWxTcWl5TDE5bEJy?=
 =?utf-8?B?UWt6VXh0Tkdnb3h0YjNGUTBXOTY1R0dWVlk1NjJySWswMzB5V3JzcXdXbFhI?=
 =?utf-8?B?cTdDdXp5VHlZdDhHMXVWSnlkRytzK2pvMTNXZGdwVWhDOFdXckprbVk4dnBE?=
 =?utf-8?B?QkQyWnh2cGlLZkVBRFp4NjVpdzlmY004SXVFcWZTYzJCS2ZsR29ROFdBb0Mw?=
 =?utf-8?B?WjlORFllOTgxNVdiaVh1dUUrNFVUUmdkb25GL1hCMzNuRHZMNTlhSWh2amcz?=
 =?utf-8?B?TTlNNElNLzlLOTJKQm42ZEozdWwrQnBBNEQxZXJUU3B2Wno5WmtiSkNoN21j?=
 =?utf-8?B?akIyV0RRQjhpVU84dDVsYkpyOS94bk1KWUJUQVRFQW14eXgya1cxSXVZdjlv?=
 =?utf-8?B?MzJrYVpQWTdtR2szNTNXOVRTUys3ZFZtbzdYRWkralhsTXN1WmNNb1FCeElv?=
 =?utf-8?B?WEZ4TklSWkRUaGZGQnd4YTlMUTlialA5aFYwbGh0ZS9RTElTZy9nUUZQQlFv?=
 =?utf-8?B?NzV0OEMvMmkyelo5N2h3amtNVnA0dWRWQjVBMWJXZlYyaTF5TmlkM09iWXFr?=
 =?utf-8?B?R0h6ZjNTa3p3UTZiMmF6UmY4UEZWUFc1T0lSVzZ6QUlSVXpBejdpTVpnUFBP?=
 =?utf-8?B?eXZtRDlaL3pHYjRCSGhOZERtODI2aVJISU9jdGFSbWRQNGtrdExMVTMvMW1k?=
 =?utf-8?B?MDhDODVaV0VXMzM1ajVRNnVucitxbUsxMlhEVWk2TlRUV1pyM25HOUR5bmZi?=
 =?utf-8?B?WDNUbUVWaVBaRTZENTZBWFRidWZrWWNyd0N6b1BiMmFJNWoxMjI1N0pGTGRP?=
 =?utf-8?B?clpZL0krOVRPaUVvRGZVSHJpVXFHODdpczc3b3ZoaFJ2aEpzRWNycnYxYmJF?=
 =?utf-8?B?cDlJRVAzcW9rR093S1E1SjBWd0tNSEs2bzVpSHExV3NCcHd6dkIyMmNublBU?=
 =?utf-8?B?ZW1CdEZmZ0tKblZtV3dmVlBDL0lRWlJyR3QyTlgwcTlyUlIxTnlDOWZKcE5a?=
 =?utf-8?B?NXBJR3BMS3NyeGd2ZVdnZHhMcGJGMFNnVlFyQlR4eUFXTW5xQ3Z3VDBtdkFv?=
 =?utf-8?B?MFg4Njdyd2NmckFVT3ZKSitzdzk1Vmh4c3drdEhwTUl1aXVPbUduOExhb2lm?=
 =?utf-8?B?dENFOUI3bnFoMUR0T1g3eUYxdkNQbGZuQ2dlWklocHkyb1lmK0gySkxLTnZq?=
 =?utf-8?B?RWVmc043UG9xMzNEUEdIaEZaQ2E5bHBvRWUwR2hid3JhUGtuL2tHZi82Miti?=
 =?utf-8?B?cjZDc0VOczRTMGlNbWZrTllYbHdZK213NmpDVDhkU09rcFQ3eTRFdEg0aVd1?=
 =?utf-8?B?WjdEQ05Ca1A1NEduR2w1a01xMTF6M0hEQiswTmtBdFRRb2hVUTA3eExXNXlI?=
 =?utf-8?B?VEd4M0tyUTJmVUh6YUFFcnFWL0dHVVBVMzd0bXd1VFFkRUQwYlJnTFFEMzJM?=
 =?utf-8?B?TFpJTWlheEZIUnhHeG5xcTQxeHYyY28rd3dBcXRWWTlraDVNN1Z6WkNFYkpZ?=
 =?utf-8?B?bE0zd3N3a2RwNkthQW1iN2hVOEpUV1dhMW5JQngxdEJxNitYNERPNDc3OWgz?=
 =?utf-8?B?djc3VDhRb2RNWnE4N0hNSWVONnY0UHF3U1d6a0ZGREFGWk15U28rd21CTWRi?=
 =?utf-8?B?YjRyenNZaGdIckxiMWNhSGUrdHlVOU9pL3o2c1Q1M1RuRHRRaFcwUFJyOGRI?=
 =?utf-8?B?MHQ0OFJKU1llN1g5K1ZKSmliMFFoVXh5KzVoZi9XTmVxa3pHeGY0L3d6S2FM?=
 =?utf-8?B?UkVoUU9IT1NUVGJIS05SMi9uVE5aRTZFNlZXb1ppbS9UbmM2N3VSTTRHL2w5?=
 =?utf-8?B?Y2tBRGVja3BKcUk0aytrQ2w4YkFKY1pRb2JCbmo1MnlQcDNKUmsycndiaVNr?=
 =?utf-8?B?RlhGa3E2RE5aZVl0YUlRUWFBQWtTSmhsYXd4VFNTUllPa1Yza1MybzNqSTBr?=
 =?utf-8?B?Y2ZzL083MXBPSzVXWkJVNDcxZ3VueUNRVXhxV2RJdFROeEs0MGMwRHNqc0RV?=
 =?utf-8?Q?DsnhYMkbLBBKsXQjg3B7r9bFEjcx59kZlQeEwsrDBT3zI?=
X-MS-Exchange-AntiSpam-MessageData-1: BlyfzO0Bz2rcBg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea05874-c987-47fd-d6c1-08deb02ccfc3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 13:46:04.7072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPCqePwY/q6YcTATiT0Gu1CrW0D8IwMrBuk4LTe5VzpOCqU+vbUozX2S/Z80RjdSshe3BInpiuzVXOJ0O+Xf9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB29794CA1

On Tue May 12, 2026 at 6:41 AM JST, Danilo Krummrich wrote:
> Change all imports in the alloc module to use the "kernel vertical"
> import style [1].
>
> While at it, drop unnecessary imports covered by prelude::*.
>
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports [1]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

There are some non-vertical style imports in rust/kernel/alloc.rs,
should those be changed too?

> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -3,24 +3,46 @@
>  //! Implementation of [`Box`].
> =20
>  #[allow(unused_imports)] // Used in doc comments.
> -use super::allocator::{KVmalloc, Kmalloc, Vmalloc, VmallocPageIter};
> -use super::{AllocError, Allocator, Flags, NumaNode};
> -use core::alloc::Layout;
> -use core::borrow::{Borrow, BorrowMut};
> -use core::marker::PhantomData;
> -use core::mem::ManuallyDrop;
> -use core::mem::MaybeUninit;
> -use core::ops::{Deref, DerefMut};
> -use core::pin::Pin;
> -use core::ptr::NonNull;
> -use core::result::Result;
> -
> -use crate::ffi::c_void;
> -use crate::fmt;
> -use crate::init::InPlaceInit;
> -use crate::page::AsPageIter;
> -use crate::types::ForeignOwnable;
> -use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};
> +use super::{
> +    allocator::{
> +        KVmalloc,
> +        Kmalloc,
> +        Vmalloc,
> +        VmallocPageIter, //
> +    },
> +    AllocError,
> +    Allocator,
> +    Flags,
> +    NumaNode, //
> +};

This changes the scope of `allow(unused_imports)`. Is this intentional?

Both nits so:

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

