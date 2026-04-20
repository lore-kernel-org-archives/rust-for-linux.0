Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011030.outbound.protection.outlook.com [52.101.52.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E913537E5;
	Mon, 20 Apr 2026 14:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693751; cv=fail; b=HsTChKX9/lgP1DNqdOnvavAMvBSzQCFaoc7sCYc9OvuVs6ntkWqj5oidnMeNCk1TdVEhDAJMNDkrYlEOXDUbKOiatj8pZOvhYc/VtY8rhYrZAGfTO8u6Q6Dhr9f1q8xzA2bk81XePa2MxcGNOiUBnMt/o6V2Tfpr3nDSf32ILIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693751; c=relaxed/simple;
	bh=xUlewBgAy9LsUjIbCLOzPNdPFgcJB/OYP0oSJEsaG80=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=RLcxKGO2XQsFl0tLiCQZIsG67+BBkQa5OdIqYasAsj+bmxrHNUkXQ/TQuffu+aqju7hWeR29nWw/GqIA7+XdykBSUtVPWIl0bY/EeJOJcO2lxFU88fEUNxy7wunF+KQ5vIY2ysLZ2KlE7u3VW5rkloew59XWihzvFu92x0hDisc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WZdMlbYU; arc=fail smtp.client-ip=52.101.52.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WZdMlbYU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxFhcRnzhdtmK15p7WOnhUDoE6cUoP8VE2lg7c/7MffCKo8RD85xti6JPqaDx1dEqeEIQpCGTa2LUzIqnO2jfHge9n/RlM6eyDS9jOFo6ZmsGJypYG4VDmPWuYFsLnVgs8rVzjqAsFaAQe7XPrhtoCDNzFMdhdiK6TyCvnZelFvMltPOHWCaBzl242WjGYV9lDcV5p5+VdGsoGPPqPiCDXE3gLQYqca3Yh10plwU/bGQu4SY86rfQq13H564PTunoQ8yM2yJix+lbSJtvCLrCynUbumG5/JS4tjvXi7rVnGTMoj1TQnOKmIUZExYWbxb9Z+mEOihKTIx04Kwjdt8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXRijdQRyLOkvJRHH2E+MhtDVuZW6f9AJ+sY2kvRNRE=;
 b=iSdAw+OeW+fbUcIPWKp7/Br6bPhNSxoJe1zg4G8fiL7sMYQLBwPSbBgaVGuvEcyCMtpllMLOgau8b2YsHJH3CdSotet3wjZV857vU4XoOV5cwy0cxq9gnTZ5B1F8LmXkzEOvxkEG2XyKvMGwr2OeGzQXH6qbsT1F4CFoprp7PgIQy2zeIz1/T8zzTxC1Et9Y2YDdXv19CCxOeORNNFIE1d+d3X2aEZG7yToxwmtx0MMuuj2lzdZo4/2MUofw6inTygE8oWyxF9oyiFB2L/XoqoBZS62vKLA/2ICR8ASO4orYQBxJKs++ibOKhYuO3QK/DmrzI9ngWnTe9f3dnP10nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXRijdQRyLOkvJRHH2E+MhtDVuZW6f9AJ+sY2kvRNRE=;
 b=WZdMlbYUTlRrOa9pryGZK+cWCyfK5nLeySOBPE5vm92k6B9PkDAVTNkb25CtWdKZkdrnpPuGlRpE0nQjY4LRT693PZCAwWOQoZ3h7ToiQfcQzRWWkI5EBkIwLDh51QXmsQIqkPQY5+bw9yABTCb/nSrYm/IsfisMCqjudo+6tANh5llHJj1To9Hdc9XyhgJ3i2n1qfs+b/HOX246RXdUlkPic3m6Ddj9DFz8Je47fAvo7IK01lQHzboJxjL7u6wTKbeUS37HINvGc5AGyISEwLiVm2FYLuoBo0f94L4zfpdgMyuMcfG7+/W/9LTb1yXDL88Ax9M2awuJBfUsTHPJQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB5629.namprd12.prod.outlook.com (2603:10b6:510:141::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 14:02:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 14:02:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 23:02:11 +0900
Message-Id: <DHY1D4IOXGRF.UQMCOXYG78CZ@nvidia.com>
Subject: Re: [PATCH v10 26/28] gpu: nova-core: Blackwell: use correct sysmem
 flush registers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
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
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-27-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-27-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:405:379::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB5629:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f73142-b704-45de-8118-08de9ee56d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TXCpbjACZ7enw9kroNcgXL49w4AW3Z9w7cnPHtzs/NovvYTjx8ZIRv9erILkLIr/Sz1pz/QgsNbGbRduYNh5V0egNoCVEfnt06dzUVDhUHrzmrZE/wdcE4xmVLWMA/O4/gmOi5bk9mFD9+qnO7JjzRe/8cjJ1Dj1cCK0fV0ux7JK1GQcpOKvjxiyDQsLNLIMSbUpaUPRUVQjc77inaLy0ZBX87traIGWt8Cf4vi86QHKzDWRA+J45ByPGgEiJKdRY9XFlULscpdidGi4pU/QmFyt53OhhKjqeyBq93nRmddH4gDP+4BHiGrrTR6gYCD6Z3lymdnWU4pvEHmf7/nLlU3qcq1M8jcTrexy20Kk8wrSpBAzdYSidxlAJSORcwRli88BKd+dK2sSSbGSd+2AfGgY3UAZYPf8WDe61UtGQsXHevqUxsjcgx+2qeg2GpjYzd2gzrA/ioGWVSxx/a0DeMC+QNEHjwHEbV07Nu8RXhMDW3XxXWFo42coRiASw++Jlq7ex3a+7ztrqc0YFAVXXDDkten5msG4x/0XBnQTZ5KrP33oYl/KC5oMICK7T/6aLhfyPY5Zb//zUuAUgaEng5cROi48Qnj8m7fcP53UDsIKnF0LlQ0Qps+ojnq9VoiY6AtDsL9GX27dO2u9krI6KC/siUGKrZ5ckXX8XzIe/6aUnCmTlT9sudWgaw4YJztFcJIZutqfaQhfebyppXgsFCbHPvEaO6EYXyOKbCt58Kw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vlpyd1dURE85UlRORFpQcWZlSTNCUHQweWV1dWUzT05oSXZra2Z4Vm80aXRD?=
 =?utf-8?B?cXpJS3l0cExnM3BUT2xtN3VkaWNjK21URnArK2MxR3hMR2ovc2Uvc0lraUlZ?=
 =?utf-8?B?SVBpS0xHdUpJUGZ3bjdna3hkOHRkWk5YT1RPVTBMR1J2RVRyQkdsdDE4M092?=
 =?utf-8?B?WjY2cFplcFBTVGNQVWJrMnlyWi90b2c0UWdLdjRMd3Rjc3FkOXRCeWNTVldv?=
 =?utf-8?B?RWErT2k0NGFFcmZHUHRuQ1FZZHFkK1Uyd1NRak9NRktnNnRyTWN1dkQxS2Zh?=
 =?utf-8?B?SkR4UlRSdHEyWkVySVJZOVdaUmdFQ2JZYnQ5cGZOUkxORHNKZ1BXbnlHeWVz?=
 =?utf-8?B?Z1hlaHZrZnVOamhkLzM3ajZXWCtiL0JiSXVZMHdVekJtRyt4R0JUdGFuZ29K?=
 =?utf-8?B?Q2dpT3ZreXlQL3hkZmQ0T0tyVjRKdjh5a2tOY2tRYVRQVGxBZ2RzYWYzTXNR?=
 =?utf-8?B?ZW5oa2ZZRmxrR3dBem9iL29najJJM1lLVXFXQTM0d2hOU0VLLzliSHZFRS9P?=
 =?utf-8?B?aUhpLzdEZHYvWm9Lbi91dXh0Y3pNQkhmUDhQWDdNNSt3QkM4aStSZkVuYlFx?=
 =?utf-8?B?dVZmdjFYbWp4UkNKQmZ0clJVK3lZWXRidUhSUGFBdFBUWWVWZDN0NWpKWEZj?=
 =?utf-8?B?WHcvN3JjT1l3NUc4TG0xbmcwQzBBRHQzMm9qWUJRNXFHRnBuSkwwZkhkS1Jr?=
 =?utf-8?B?cFhEL1Z3MGJId2FQNVJOa01ydVN6RTNma3ZiWlhNTnlyTXBRbmxDNkc2Q2JM?=
 =?utf-8?B?YjJhWlh2Ty90UDNjNHpVVVB0VWZrdlkxaSthSmg0QkJXdE8ySFliVE9ORTlD?=
 =?utf-8?B?L0ZxeDN3ckdOZHo4T29Cb3lRejdwTzZPWjhUMlAyOU1zaTRSUzlDTEQzMzAv?=
 =?utf-8?B?cEhYMkJyZTFmeUl3Q1B4Zm1SZVkvWkUxTkkxaEh6UHF4N2x1SVlic1psNXQ4?=
 =?utf-8?B?QlN4TU9kOWE1czNVelE2QTA5S3JaWlBkS1drbFlRNzNPaXhsTGY2SVNoWStu?=
 =?utf-8?B?Qy9yaEJUTUQzdXprS2FIcjVzTmtSbUcxSlkyMUEzSGQ1eUF4aUpBc3pLTEpW?=
 =?utf-8?B?a0F2Rlg3d05ZaEJ5M0hweE9yWmloVTgvU0UrNEt4OERrWEUwcmhNcW9JOURT?=
 =?utf-8?B?Ynk4dmtWVzlvT21JaDhGem51c3d5ZTNYUTJZa2pGS29oVVRuTDd2TTRnWXN2?=
 =?utf-8?B?NGhHOUI3RThqc1h0dk1jM2FlL2J2THVNVndjYkdsbnBTMEprRUdFRW1CWnJJ?=
 =?utf-8?B?SmhhNjVsTHh4SCtXbnBnUW85eUs3eTVoNlBuRGR2MUZrWlg2WTdrb0tOalll?=
 =?utf-8?B?MS9SazQzL1NHMTI2Mk8rL1g0Q01ySWF2TG95MjZ3bStTSFBGMDU3R1UvV3lx?=
 =?utf-8?B?VEJoQi9BWW5QczRPUmNoUnQySUFOZ0RISFpJcitjazVpYTNidEIzV3lNcG00?=
 =?utf-8?B?c3hnZTZaeUdRNXVxNFQ4Z2NuNlJZRnltNkI1bCs3bmx4TzZBeTVBbjVPWXhT?=
 =?utf-8?B?a2tKM0FQanM4Z01tcGlvU29Ncnl0Wk04RWFMOEIzQWp1ZlBVS2NsUFI3MWF2?=
 =?utf-8?B?NjROV2loWGVmc3Y0WExCNDlyYStjNENqS0RFN3R6T0FEcUZZbUhGZ2NGdnN2?=
 =?utf-8?B?YTBOYy9XY0lnZ3F1bkhhSVZDMVJOZVlSV2thWS93cnhyK01tNEwxcWZWanJs?=
 =?utf-8?B?NzcwU1hieU1reWl1Q3BoZTV6b3gwMTZlZUg0VGN3NWJEZGdOazJYclAwQ1dT?=
 =?utf-8?B?QWZtY0F0MGhiaFQya1lLN0M2L1ZWVE1DTVdEWCtDakRLQ21MS3VSVEpNUU4r?=
 =?utf-8?B?MkwrNDJQWUt1V3Y0cjRGREorM05MY1d4T1FMMjFadUNlMmV2VHpKMkxuLzdl?=
 =?utf-8?B?WEx1ODJrWFhOUWI4c0Y4UEN5T1FQaW5ma3NVT3EzMVF0Z2d5dDNOK09rU3pS?=
 =?utf-8?B?QVROdFUrUEVHdnpFb09vSCtZRU1nNGo0UElUeVRaOHgrVU1JWGZMTzQwalZ4?=
 =?utf-8?B?cFg2LzJnSzd6cm1ualRyaTEvTWFUbGtyeXlhckIwV1Y3cmVJWE4xVTl2QlBH?=
 =?utf-8?B?NFpYRDlydGRNenNTSEpueEFhOGFXbUpGU1BpNUgwbTJsU0VpM0tyTUxURVla?=
 =?utf-8?B?eCs0TGJLeTBpYi9TWHZnMkgyeUFtano3bGVkazZVM28xQlRwak15K0JEd2cw?=
 =?utf-8?B?NTA5bXIrWEtJK1RmdHU1Q3EvY0UyVFRqZ3ZjbFBxSmdlRnE4MmJWcXlSY3VI?=
 =?utf-8?B?SmNLbWU0ZW1PeUIrZU5zS094K3RmVFJqRGpyWlhkRU5QdHhJTCttaGdNRW9P?=
 =?utf-8?B?L3ZBQVBlc3VWaUhidlYycGJ3SDI4Y0wwYW5qc0o4ZWdFRVNDWFhzUE1ldUNP?=
 =?utf-8?Q?rPpPfxVi1RVLjUpizmOcZKIskx1HUaYrgNDvtBrFnelPh?=
X-MS-Exchange-AntiSpam-MessageData-1: OZxR0slwMVbeJw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f73142-b704-45de-8118-08de9ee56d77
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 14:02:15.6493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbnNfcU7+wZCVOJeNb6avYXnZhh6g/7o1UrSPVbr6B4N4DTcUtHfFBLMqTzcLvHQvI6NMT8LQXuwlUUQICDzow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5629

On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
> Blackwell GPUs moved the sysmem flush page registers away from the
> legacy NV_PFB_NISO_FLUSH_SYSMEM_ADDR used by Ampere/Ada.
>
> GB10x uses HSHUB0 registers, with both a primary and EG (egress) pair
> that must be programmed to the same address. GB20x uses FBHUB0
> registers.
>
> Add separate GB100 and GB202 fb HALs, and split the Blackwell HAL
> dispatch so that each uses its respective registers.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

This is another one that can be moved to the beginning of the series.
That way we have a nice progression of addressing the hardware
differences -> fork the boot path -> build and use FMC messaging.

> ---
>  drivers/gpu/nova-core/fb/hal.rs       |  8 ++-
>  drivers/gpu/nova-core/fb/hal/gb100.rs | 54 ++++++++++++++++---
>  drivers/gpu/nova-core/fb/hal/gb202.rs | 77 +++++++++++++++++++++++++++
>  drivers/gpu/nova-core/regs.rs         | 36 +++++++++++++
>  4 files changed, 168 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
>
> diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/h=
al.rs
> index 478f80d640c1..65edf07c3222 100644
> --- a/drivers/gpu/nova-core/fb/hal.rs
> +++ b/drivers/gpu/nova-core/fb/hal.rs
> @@ -13,9 +13,14 @@
>  mod ga100;
>  mod ga102;
>  mod gb100;
> +mod gb202;
>  mod gh100;
>  mod tu102;
> =20
> +/// Non-WPR heap size for Blackwell (2 MiB + 128 KiB).
> +/// See Open RM: kgspCalculateFbLayout_GB100.
> +const BLACKWELL_NON_WPR_HEAP_SIZE: u32 =3D 0x220000;

What this const? If we want to share a value between different HALs the
way of doing is putting it into a `pub(super)` method of the lowest
HAL module and making higher ones call into it.

> +
>  pub(crate) trait FbHal {
>      /// Returns the address of the currently-registered sysmem flush pag=
e.
>      fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64;
> @@ -46,6 +51,7 @@ pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn =
FbHal {
>          Architecture::Ampere if chipset =3D=3D Chipset::GA100 =3D> ga100=
::GA100_HAL,
>          Architecture::Ampere | Architecture::Ada =3D> ga102::GA102_HAL,
>          Architecture::Hopper =3D> gh100::GH100_HAL,
> -        Architecture::BlackwellGB10x | Architecture::BlackwellGB20x =3D>=
 gb100::GB100_HAL,
> +        Architecture::BlackwellGB10x =3D> gb100::GB100_HAL,
> +        Architecture::BlackwellGB20x =3D> gb202::GB202_HAL,
>      }
>  }
> diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-cor=
e/fb/hal/gb100.rs
> index bead99a6ca76..c6e2a505e6ae 100644
> --- a/drivers/gpu/nova-core/fb/hal/gb100.rs
> +++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
> @@ -1,21 +1,64 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> -use kernel::prelude::*;
> +//! Blackwell GB10x framebuffer HAL.

Let's add the module-level doccomments in the commit that introduced the
module in the first place.

> +//!
> +//! GB10x GPUs use HSHUB0 registers for the sysmem flush page. Both the =
primary and EG (egress)
> +//! register pairs must be programmed to the same address, as required b=
y hardware.

This should be a method doccomment rather than a module one imho.

<snip>
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index c3ccae0c235f..77b11c7de3f8 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -145,6 +145,42 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) ->=
 kernel::fmt::Result {
>          /// Bits 12..40 of the higher (exclusive) bound of the WPR2 regi=
on.
>          31:4    hi_val;
>      }
> +
> +    // Blackwell GB10x sysmem flush registers (HSHUB0).
> +    //
> +    // GB10x GPUs use two pairs of HSHUB registers for sysmembar: a prim=
ary pair and an EG
> +    // (egress) pair. Both must be programmed to the same address. Hardw=
are ignores bits 7:0
> +    // of each LO register. HSHUB0 base is 0x00891000.
> +
> +    pub(crate) NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x00891e50=
 {
> +        31:0    adr =3D> u32;
> +    }
> +
> +    pub(crate) NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00891e54=
 {
> +        19:0    adr;
> +    }
> +
> +    pub(crate) NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x00891=
6c0 {
> +        31:0    adr =3D> u32;
> +    }
> +
> +    pub(crate) NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00891=
6c4 {
> +        19:0    adr;
> +    }

I had trouble finding these registers in OpenRM because they are not
defined under the same name, given that they are relative registers and
there are multiple HSHUBs (a detail that will likely become significant
in the future).

So we should get this right from the get-go and use relative registers,
and a (for now) unique `Hshub0` base. That will also make it easier to
match the registers against OpenRM when needed.

... but then, when I looked for the `0x00891000` base in OpenRM, I also
couldn't find it. All I found was this in
`_kmemsysInitHshub0Aperture_GB100`:

    #define NV_PFB_HSHUB0      0x00870fff:0x00870000

... which is different from the base in the comment above, for a reason
I ignore.

And it looks like even that value isn't absolutely correct, because
looking further in OpenRM is seems like it is getting the bases for the
HSHUBs using `NV_PTOP_DEVICE_INFO2` - runtime, per SKU values! We might
need to update registers to support this, and I think it is fine to go
with a workaround and a hardcoded value in a first time, but we should:

- Make sure we understand all the implications of this (I only looked
  superficially),
- Add a big TODO item detailing what needs to be done if this cannot be
  addressed in this series.

> +
> +    // Blackwell GB20x sysmem flush registers (FBHUB0).
> +    //
> +    // Unlike the older NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers which en=
code the address with an
> +    // 8-bit right-shift, these registers take the raw address split int=
o lower/upper 32-bit halves.
> +    // The hardware ignores bits 7:0 of the LO register.
> +
> +    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x008a1d58=
 {
> +        31:0    adr =3D> u32;
> +    }
> +
> +    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x008a1d5c=
 {
> +        19:0    adr;
> +    }

Interestingly these registers are defined globally in OpenRM (and under
the same name), so these seem to be much less concerning than `HSHUB0`.
Still I suspect we will want to make them relative to future-proof the
code, if we can figure out what the base is.
