Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C3B23909C;
	Sat,  4 Apr 2026 05:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775281525; cv=fail; b=MQOyB9dR3N7UHhrdeNNs1FMDv+4tJEDAsRoy/Bn4uV96CEQ6BJdSEQI9DHqqauY0QxoSAikzBRkhW3tURhY47vkISnBL+1NCdAmijiTAGHE6YQL9GTy8hZFII4sgdyU8SFz4BOavJI+LHAcCFI1Byiqaj1gIQ/ARAX8OjjjCvB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775281525; c=relaxed/simple;
	bh=IukijKtWrmr4WL5tgrv2eqADjYUlwuenFT+Om/AXjQU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pdT6oLAfsZcLkQPlIUVx3IDqXj8C4+0bIzjQqanKwEjLxZFoPmVIkUW/bHoX2FN/EN32xglCwBOKmy7cpCBYc36CS4NzZj0fSk9jCr5+VnOefggLFqJyTUC7uamV7+hluDKS+DO5WAAo/TK70cXlmIhNshy7s/qfHnKM6AsrL4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h8seuHH7; arc=fail smtp.client-ip=52.101.52.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h8seuHH7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfqSNWUK8xMTcXlOpikINmx5MxPW3pUgMSTRKi54z9ed73aiSlX3L2CD0SYQpeRzFY6ciKpbFwgBaIwn5lL9Oo3T86Ja4Moct7FnenS9xiyQPKgwks4ZIA2OO5qOssCbKu95ve4ApHzX/f2Jlk6ysCRn45gZUpbnbPcqKn7YtyxvPqCnMkTXfWUEaBCxZQfhT52QuucG/50W3svrYuPe+fPvX7nguziYNtifJ2xXY3dZv1ALwCoq113Se+GXW2OFGhwVFxjFa4r3DEzIC2t1X/Wfi1ErkcOzkQmxThP+6ebtTETkchGhQ9ARfTkn/oftxoFLhO5bfeFUdC392boMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4qSb0oKdENVfE1nMlEF+oPSpTYU0ug7g/uBOrwK8S8=;
 b=udUi3PN/pb3zHg82d/rGgsBxChhh5LrylH30ax/ym1Z5J4BqznX9hFsVMabj9U3JTNG5qjBW/AHZrUrNFywxarpqPjf+INOaS/ZI6cNaeLEgSBZrQK/zXf7YGjKdCEe/CSvyW5YAm00hN3k+Ik+/C/312xgtx6wc2KtFI8cF2/jY/l2MS9Em5cRXbIjH0WELKsINtW208oOSuckZhqBw4dO98Pv5NwfxBSor90oXw2qXQPwLGvk4PD+dw93m4hecKo7XCCEDiO0Tjo9Ja7seT+1nTBm/ykiF6Vu8fKL8LQohj0N6meNSDRWpDY9RnwbgoyDNHz89kCh/RKeZRzqsbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4qSb0oKdENVfE1nMlEF+oPSpTYU0ug7g/uBOrwK8S8=;
 b=h8seuHH7S1zUOk6KEdc5R+WzEGZFiX0RJVgoj2AkzKQ2wj9lluRFt3sz/xs56hNPT2Fz2FOddLUycCicPcvPxrM1LvMUwA+3kdbqNvVOJxBRrGnu4jQjHMs96LCJipDafgSAhpS7TRE47yQllrdDHV165cQ1zXCLtFt9MhkpkmWLsHBN3J9nWl3wf09Rs5RRc3uWsHgeYzrdlbcwrPu4PP9yhQs/8P3iahF9G2kqkiDHvu1ZWq1Ja4AWwt1KdH1LzFodoSLwKkQor5twqIxyG8DKhAWMKuk85xr+UP43dFWeR7mqClKuGyX85+fKC5vElrLUW9dbSFk+tCUd553Awg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4081.namprd12.prod.outlook.com (2603:10b6:a03:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Sat, 4 Apr
 2026 05:45:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Sat, 4 Apr 2026
 05:45:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 14:45:14 +0900
Message-Id: <DHK4RWSLBFFK.2UL1M00W89TNL@nvidia.com>
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
Subject: Re: [PATCH] gpu: nova-core: fix three clippy::precedence warnings
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260404025821.386514-1-jhubbard@nvidia.com>
In-Reply-To: <20260404025821.386514-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0068.jpnprd01.prod.outlook.com
 (2603:1096:405:2::32) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4081:EE_
X-MS-Office365-Filtering-Correlation-Id: 1497d05c-54ee-4d35-2f97-08de920d5a2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	hkcA7/OEcefEgNKvGxy6bM0QU21Qbq0OhYP3VB19O63YWpoaybFYZanHjvDViA4sXcLMS9b4iJq2799gk6iM+Wdr2trAtStIDHH8653Sm9/jpAVPkdbFPpfv4WNscHmyVA7xMIYjK8+x2OM/9LNCkRXogMwuPdFSDfsjJQqREvlYm1EYQw7KNZaashQ20ugzCtETNEJ9r6TSmbI5cDe/Qv89e8o1y99GJUt8c74aL3Cbhv7FqafWNnuP/kfxsCuD+cvpbbQSrFzl5j+SY4QIyHWewG9lCYLGnFmpK+xz5TJFc2r5kw5e3M2GSNfM9EL+fUYpp3Z2c5TyyC4HdX67TWAiRNZCV9gC/rLsa3+wT0bl+RgUnhtdTC+bE/UZpqc4kgEfCbPc5aLA+kSlKoeWgwZdXjKzbpyW4GmoQ2ZHqRu+NWCicecek8ln6Gpf89yc8eLkVgRAIxpv531nDU5O22eN38XICOGiuRKRUGIxYoyTnDouF5Ha7Y43Pb7/b4XJhei1ZutNLMdzsjWdWHE/csy/2bmirJscgP+0jEBUq8MJp/W6DjidngqcW7RRqJGp5cf655xXgCH+kGPR67y7GSWi3gQnvm8NWeaLVdv+fyGiF/efp6irYIaSm6UD69b0AvA1+c9jcpPUBTIxCSNhTZwIxr2Hk54CBhoM1VYvWydOX3atKk+RYhenlrpZydWr1A3WRiyVDp0aTOg4N9sWEWnrvWq3yo49QM0Or5QVrbI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE9rM0lyckVPSDRJM2dMNHllVnFXSlZOK2FCMEdpSlF1Ly9Oa0N2bTBCVUZM?=
 =?utf-8?B?WGxvSXRHR2p6ZE0rQ3ByTlhPWGgwTDQzRFFDUEhObnhEVzlDZXVtRFAzYmdZ?=
 =?utf-8?B?Y3p5b2JxRVVFT016K2ZEeTUwVk8xa0Rsak5ad2xDckVxN2dSV05keGFIa2tN?=
 =?utf-8?B?ZGU1eG5nQk5ad0t2ckZ3QW1ENFpBbmp0Mlg3clB5cXoyQk50L0hxTXJFWTBk?=
 =?utf-8?B?di8xUkp1cE5zSVNPSDlPWDhnSEFwMHBFUzFxRkpDT25UNW5qRnFycTlmOFZx?=
 =?utf-8?B?eDdPaFk1U3pSVWcwSmYwMlZnZkFpUXJBRkl1Z3VZV2szc3YrTExlWitScE1j?=
 =?utf-8?B?cTBlelZ0Ykd1aXVSdE5LWmlHcGN0alZ1K0kxOHR4MTlNVStwSitKRS81YnUr?=
 =?utf-8?B?Z2diaXQvalkzSG9idmN3VTBTNEJSdzFteWRLNGFsUG53SEtoT2tsNkF6ZkdM?=
 =?utf-8?B?K2dJbVhMd2FTRXRGWXdaZFkrVXNmRzB6Q3VFUUgwT2E4dnorNlcxeVVVTGcv?=
 =?utf-8?B?akJyWlBTOFhIYUhiZTZwdDVKSlhYQWN5MitLTG9CUFdMUTh6NUZqdVF3L3dt?=
 =?utf-8?B?VkRwNGdweUE0cSs2TG51Tlh0Tk81NEhmWG8wc3E1bGZVdVNJZThvcnUxd2hs?=
 =?utf-8?B?aU9KUFdCR2xvT1NSc1lhSHp3M1hsRTJKSHo4SzdyaTZvR3I1dFcranVVRFlm?=
 =?utf-8?B?MnorVDlRSlhNa1ZpbEZTdVBSU3hHVW83K0xDdzUxZnFFOHYrMVdsY05OV2Fk?=
 =?utf-8?B?akgxclczTDZDSkMycmJ1ZVdHbjRYd040bE5hSFcyUHRYRU1GZ1J5WHBDb0dQ?=
 =?utf-8?B?UnB4R3piOElzMGRzNG83ZnovTVJIZXRDZ05hNVROMXZ3bXpIL0NkV0Z3TEYw?=
 =?utf-8?B?RW1jU1czVFk1cFhvY1lsR21vNk5Xc3dwdzNEYzBLazlManBLeHZ5L2xlOWRu?=
 =?utf-8?B?SmV5anhHN0Z4RzJtMGF6NXR0TjU5enRLc3ZVd0pFQS82YmpqTjkrb2M4eDFi?=
 =?utf-8?B?T3ZhblE0Q2pzamdoTWFWTkdPRUt3dkFwK1psVVA2d0x6cUpwR0E2Nm1tMU1Q?=
 =?utf-8?B?VDlEVEhLcGtUQ0c0Y2E4RVFKbmQ1bjBFeUdFSmlPdHpBRmpBblBJemhzdDhW?=
 =?utf-8?B?Y01GbUIwWk5OeklsbUt6UFVnVkFkQm1wd0k3NG96U1RXU2x5YjFJdmRxaGV3?=
 =?utf-8?B?bVV4dVZYREJHWWtrTjJ5T2h6WEtjcVNjeVdEZlh3NE1uR2ZpVDc1Q21xV21Q?=
 =?utf-8?B?VTdFMTNrSWRLVXg2c1hyb0JZVEpua2E3MHFTYmpMWXViRy9lckJvVUF2NUZH?=
 =?utf-8?B?WGNld2dKYVJOcWxkSE9mc1BOOG0rTjVITCt5am9RZXh0cnVwbEEyTkM3TTE5?=
 =?utf-8?B?YTNPaCtiOUNXSlRkRVZiR0JwM0lURXh5bXAvTHljRS9xWXM5elVZZkJENWNV?=
 =?utf-8?B?eDF2Q3o4SXVQYXU2U2g5cm9ZaDJTckQxN2ZOc1JUQ1lYVkF1MjFzanBGdnhL?=
 =?utf-8?B?bkhoT1VLYUY3NGRMWWpkSGJlZmZLblEwbDgyaWJNTFBZUmVvK3lmblpaZzZw?=
 =?utf-8?B?NmxFd0gvZXlXUFVpZDdxQmxLRSttY3pnNU9nUDdoaG1PUmtwSzVyRkVqQ0h3?=
 =?utf-8?B?ZFVMQ3o4b0QxZ21vNkhGTzRWLytGWHJkY3pVN0tXSlNvR2tucE16VldEbXlB?=
 =?utf-8?B?QXlBbWhqRzBEK1NweUo2VTRoSFQyempIUktaVTFKOWVIWWlWNDVYc2dOaHlZ?=
 =?utf-8?B?TCt6WWw0aUIrWkJkSEZhSXBaakFWL3gxSHV0K3hjcWx6SW5tS24zS0wrTmt4?=
 =?utf-8?B?aEZhcmt1dDhwd2RGWS9TK3RsNmlhYWdhMGJkaGF1d25pQ0t0VXVySzRWVWZM?=
 =?utf-8?B?SlRvZG5iMnJkdUVWUlVPSmFnck4xcmtGZjdMR01KeDgzQzh0c1VpOXJWM2Ny?=
 =?utf-8?B?aFJsanJSdXgzaitQQkVvQWlrTlE4UHJITjl5RUJwV2pGRWFDVnJBWGdWL0Fr?=
 =?utf-8?B?L2pEOE9vSHJqeVZWSHd4K3NOK0MrQktFemNXM3k2V2k0YnJxVm9HbXZUcGJX?=
 =?utf-8?B?V3NOQXFyYnFGTE81QkNjRFgyazlXVkQ3ZDFOSnRpSTF6bytSekRqV0YraUU0?=
 =?utf-8?B?cHNzY2plTW16by9IQUI1TUREeHNicGlSQWNoWHVjNjJpNkNZN3I1cDFSWTdq?=
 =?utf-8?B?Sm5EV2lkNFJwOXJMUmx0ZFZHT2RBZW5yYjkrU2JXVFY1aHRSZUs1TFJtampU?=
 =?utf-8?B?enV2M2prSEs5RlBDTGg1VXRWUW9KdU1FOC9qQTVOcjlFb29DMTdsZlNiZ1dh?=
 =?utf-8?B?bkNMM3ZVK3pzRmNWa2lHM0lGTjRTcmhVWDNpK292dGx2RkpwS09jbEYrRWFp?=
 =?utf-8?Q?sI0ZCx4fEhmxQYdb8IWXpkVJG1TYAJnwOpHtYhmK15ko7?=
X-MS-Exchange-AntiSpam-MessageData-1: d4Rs0JxwaIw8lA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1497d05c-54ee-4d35-2f97-08de920d5a2d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 05:45:18.0379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iy7ZYxN0fz3gkZqtKa6fFILFStlCcUNZx2339pjbHkHzKctF9pMTp9ZjqdNoEAlU30WG/xJYmCOoiogVhZ3+Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4081

On Sat Apr 4, 2026 at 11:58 AM JST, John Hubbard wrote:
> Clippy warns when shifts and bitwise-OR are mixed without parentheses,
> because the relative precedence of << and | is easy to misread. This was
> causing 3 warnings in drm-rust-next.

These don't manifest for me (rustc 1.94.1), can you share more about the
build context?

>
> For read_sysmem_flush_page_ga100(), add explicit parentheses.
>
> For the PCI ROM header parsing, replace the manual byte-shifting with
> u32::from_le_bytes(), which both fixes the warning and is clearer about
> the intended byte order.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb/hal/ga100.rs | 7 ++++---
>  drivers/gpu/nova-core/vbios.rs        | 7 +------
>  2 files changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-cor=
e/fb/hal/ga100.rs
> index 1c03783cddef..b5d0f04198f0 100644
> --- a/drivers/gpu/nova-core/fb/hal/ga100.rs
> +++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
> @@ -17,9 +17,10 @@
>  struct Ga100;
> =20
>  pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
> -    u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR).adr_39_08())=
 << FLUSH_SYSMEM_ADDR_SHIFT
> -        | u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI).adr=
_63_40())
> -            << FLUSH_SYSMEM_ADDR_SHIFT_HI
> +    (u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR).adr_39_08()=
)
> +        << FLUSH_SYSMEM_ADDR_SHIFT)
> +        | (u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI).ad=
r_63_40())
> +            << FLUSH_SYSMEM_ADDR_SHIFT_HI)
>  }
> =20
>  pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index 3e3fa5b72524..ebda28e596c5 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -507,12 +507,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<=
Self> {
> =20
>          if data.len() >=3D 30 {
>              // Read size_of_block at offset 0x1A.
> -            size_of_block =3D Some(
> -                u32::from(data[29]) << 24
> -                    | u32::from(data[28]) << 16
> -                    | u32::from(data[27]) << 8
> -                    | u32::from(data[26]),
> -            );
> +            size_of_block =3D Some(u32::from_le_bytes([data[26], data[27=
], data[28], data[29]]));

This chunk looks like it should be its own patch as it is valuable
regardless of the clippy warnings.
