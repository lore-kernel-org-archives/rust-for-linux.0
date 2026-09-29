Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021114.outbound.protection.outlook.com [52.101.100.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1B5513550
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 11:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790680681; cv=fail; b=CyOlXP2Olki3YaeXNqCj93oxUM54ydGV2W8aeNne3KzCkv+Oa8nZRFIuCWh/rgNSq5C4WavlU5RlGnPhSEiAWPOqo/0Pex9SfAo7J9u//6HRB595c+6dpRfQX5cTIdNZxi7fS9pwWK50N+rstyenTOHrxXAfNW2BHTh+HJ/HmS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790680681; c=relaxed/simple;
	bh=TBSW/I9lKLyhyWIowpjRXWg8irppyvgPoR/Sup1F1sk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=i613k8RXXS4tQ8srSxN1oBh1xxHd67gAM9jkNjtbfQkGskXjVxxub0kMc6P/uEpQB8gCOKgGapQWA0awf/xiwCCmEWZq+nCl/3bv/gcqekX/67Rr6BEei5z+n2tlujkr7jGL2NpxK8NtfdvM3fnrXd2hwyQRLjlwcK6ffKQRdVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UVUSglJ0; arc=fail smtp.client-ip=52.101.100.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UVUSglJ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMBz9Lr0oSW9sA3o1qdNb7SfAUMKgALvvLDzBWt6PkdKhMJleqPRNnEusjisKIHjs8p+eQB0AC4seJ6oYf+a4tnsmH8MdI1eeXvQkGmWnv4EX0vLzyOBYmcqFsHoI8eH8rVOzw4b596qDW0BxlXe/hehTIa6vE1gUibORAm/SygqVjMe4LisbRJR18e2xL5AYoZpcHbJzevnF/y4PHt3dRhH6Jp2kgr7n6BuLpBplbpSGIkULluaXovBTwNUj587UDAfaPiJQqIYjx0CoTZqYqYmqX/+CoriwCvietgAHHKKszqC4vEMgMggPnHsxuBHijJO143JXLx1iz79N11dxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibM3GthIA2jgx2uZ/fVzSC/EKYdkKPuQx8+AeoTjnhQ=;
 b=b1If3aoyYA4ExJLnEGjMZ9Wd2CMC/9KV4d3xnkoypiEa5AoBfCOuOxGtGyXBvZHNRk3OnQYZus5IjlOvygcfMfCmD9ODfsLYchLdhjbSSQ4qSCxrYZVJ9QClexnS22Us0cl7076lFJk2Ec3AzGtlMgc/mYw25MTgG0fr3aVUlFEB6y7sIIgU60vF/+E/dsZpak6VReuAT54Bhb3RogYt09Le9Ox0TgG01LRVa9/ULkiAvxrEZxUpzV/k3fKggS6QHLe0ss/uCVqrTpQJ9HD5pClaFzQsibNTxR4qAd5xvCPtkNsLlm96qNOlMTc0vQSi2M7u2NXOPiVeyNMuVemBHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibM3GthIA2jgx2uZ/fVzSC/EKYdkKPuQx8+AeoTjnhQ=;
 b=UVUSglJ09pJRTbFxbABG0cZeYcXVumiTMd587RwEid8Rr4nquMqLzTyiN53C6+WCkmUTKsBjasTwdjwyDFxXoenMOueY3g6kXLBGq+X6qnB0xgWhwCyZLUDU9GoZk4W0DDrOEsjNNuofVNcDHHoZhkujQeMAZqbogAC3ahxdMZY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB6727.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Tue, 29 Sep
 2026 11:17:49 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 11:17:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 12:17:48 +0100
Message-Id: <DLRRBILPITPS.25SC9GL1ORLPW@garyguo.net>
Cc: <a.hindborg@kernel.org>, <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <boqun@kernel.org>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <gary@garyguo.net>, <lossin@kernel.org>,
 <tamird@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] pwm: th1520: Fix 32-bit build with COMPILE_TEST
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <ojeda@kernel.org>,
 <fustini@kernel.org>, <guoren@kernel.org>, <wefu@redhat.com>
X-Mailer: aerc 0.22.0
References: <20260929095612.1072417-1-tomo@flapping.org>
In-Reply-To: <20260929095612.1072417-1-tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0673.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::8) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e69f01-e445-4fff-400a-08df1e1b4b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|23010399003|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GaFMdwD13rZMNpC9yLGxLpg0/lgnQWD4ofuzGbXtqEbbjd8y+X4JCfAFy5Ts8KYqx7g1DCVU0HJ+kFBEgfjI44DaRu/vrh+/2bQE5ylx0fjYQWm/uBxV8j6Zmi29m2eWnQfX2w05+iuIWT0sB846Od83n6m/+w+XXsd74nc8dFSZf0ThW4DEtP8zNVtClL1OEi+2nXiiAXs7ANzRMImUW9tQndEqBUOjLDqkHtL4hKjwrfPX6t+SH+fFnHFurmmzCC5obF+6hFd+Fav/p1XQ+kgIpU7waUSEDfFVyA8NUiOgmVbyz5608STTOAVmJUqGfoS7Ysj9CDTmMwmqzh6pVKamAqs3aw9PXThLUihu/ekw9CtvVJ30nZlwsyO6U2rZqJ4a938qUvvdXe3Udo34bErl/tmsF1V8NjDXnZD+PL+LjT+I0sRIdXCSszhUWp392gHC6hOcYo4pulpJeFVi9eKNL7IH3DH27x16KllQMIRxr5vTJ6Qy2tZ0urGhrGvi5X19SaV20pUXam3iC/YBwdU47nV/0VarVqJNMBlYOrJizRC4fu0KSVAFfsBYms+lqZ6Tc5trhEr28INIMEbopPzzxuMw5lyoy0ULfqJdivGT4VUndKyi+/u/dsi1eCwWGe9wfL4ChI60KNpUCEaDJI4W9HSX7Wm90wfpttTam+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(23010399003)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3NvdVZDRmtvRSswSDhlZUk0b0k0ZG5xaCtlcFFVMTBzSDVKeUNQdVZsUCtx?=
 =?utf-8?B?VXJkdllIWjJSY0RnSklTelJ3REszMEYremRMcDdSaTNFTXJDMnZ6bW1aOGwz?=
 =?utf-8?B?UjJsN09YdkNscjU1a1I0MzRLMzB0dEhMNG4waDRIYTluSlNRSmROUmI1VGU3?=
 =?utf-8?B?TURPMU9SVjhNZGwvWGppNVlSdE5zOXVXR1Y5MDBjbG5hNGJNNy9mUHdqNitr?=
 =?utf-8?B?eFdVQTY4UTdSZldGSkFjSWcyb3hFRlJDbVliQUpEbFRYajVVWlEvWVNROGdR?=
 =?utf-8?B?Vll6QzVkTjJNR05rMkpiS3dnNXpmUDhJYkhWb1ZvUHVVZjNlNFQ1YkYrd3lp?=
 =?utf-8?B?WUJybUhQM3EyTk92MGRNVWlWMVJ2SENERitGdGdKMlZqT1NtSnYwbXVmVzlR?=
 =?utf-8?B?dEtGTklES1prWmhWY1NsQU56Mjk1K2VPa1cwb01KRmIvS3BuWHp3MzQ4YVBB?=
 =?utf-8?B?aUFTU09Ua1R0VG5jNUZxMzYwWUxqUkJpd1ZjRUU2U29lOFRPbzFCOStWOWZJ?=
 =?utf-8?B?MGpMdkdzdXpLTWtxbGc3VldYMTJ1eGVsUFRMclowQ1gxMUU0am5Nd1BzYzNK?=
 =?utf-8?B?ZjJ1SGVFMlFLL1RuVFFUb0xaU1ZPR1huc3NkeGNTTktLazhuNG5mV0gzVzRK?=
 =?utf-8?B?U3llWlRrRE1leFIyZWVZdlRETWJUWkc1ZzgwYklsMlY1V0Z2cktoV25nNEZK?=
 =?utf-8?B?UG1BcGE1MXFpQVhOVERLamxwNjNtSCtvQy9LOTRSUGpHY1RFWGRrNWlEMmFh?=
 =?utf-8?B?enB4YXFPT056aXdSdSs3UHl6RGwzNWtuV29tb2FtVUJzZlh4OTlFNEJIbXBK?=
 =?utf-8?B?TWMweE9vazlIY2Vnd0E4VjVPOElwejJqTWVkWTJFY3NsL3ZaU0JKZFdOaiti?=
 =?utf-8?B?Mk4rb0pJeFpraWIxQURNbTgrcUwyTUcrRjRkNUJ6UW4xdnN1UmVDcDQwWG8y?=
 =?utf-8?B?ZE1kdXI4OU9reDlEQlNkRG9CSTZGb1BwUkRDR0RaVTNRTHhNYy81aGlXWi9J?=
 =?utf-8?B?cGU0dUVkTVZGYWNNbzY2QitHbjZFK0l2TEh5eEZEUFVicmdNUnM3SVpmUVZp?=
 =?utf-8?B?OTlDMnF4T0h1eGY5RTJtTFh4YjNyeGZEVUx4ZWlZMlhmK2s4Q3Q0endEV01F?=
 =?utf-8?B?UDFjNEZiektHamozQzIzN3ZvTm9SK01wNnlWbmwzUEtJM1lQQzFKWmxoRVFs?=
 =?utf-8?B?Wk1Cb3VLOCtwR0o5WHlFdWR0eG5aWm1UZEo4SGNkaEpKVk5iN3ZyQU9YMXla?=
 =?utf-8?B?bTlSQ1lKazNoby9MZGlMT3BzbThZWWtPRkhCR3RBZmxrdERJNGVua3J0WjVX?=
 =?utf-8?B?QlN1M2l5eDBhV3A0N3NTZldrSFgvL1hKWlZSVlpPL2hDY3UvSUd4S1o2VWFo?=
 =?utf-8?B?bU9OYmV1ZGFjZzlRRDN4OGVBck1wdEEyWXl5OUJMbDZ1VGdrUWYwV1FBVldj?=
 =?utf-8?B?TnhRT2JCNmtiSEFlSHZ4YTNjeGNzblZraGZ0OERtM2FtUUQ0SHVzbmNKTUZh?=
 =?utf-8?B?ZE82UjJrcnpaOHZrMGZsSC9RWkU3K2tmcjQ0WG1DZDllbU43ZWxwblllVWF3?=
 =?utf-8?B?NUVVVCtBK2w4cUUxRVc3ekJiZlVQRkUxSHJKRmRHVG5HSzRLVWJvblZsbVpv?=
 =?utf-8?B?aitobnRhcGg5enJLeHY0WW9yK28xa2pTL2ZoK3pJQWRocjhpY29acGdXUHFI?=
 =?utf-8?B?TnRsL0J1NnpuRUp0bTh1Mi95bXhTcVhnWWpvOUFuaWR1TDkwYWo5Q3Eva3E3?=
 =?utf-8?B?THprZDNHNkZ0ZVJ0VnVvWXppbklzYnUvYnB6WG1LaGk5a2NFc0pMMG1ReXFw?=
 =?utf-8?B?ZEM5U284eE5ja2ZtUEF6NEpkWFpFbjNRWnV1Y1RRUktTWEQ2d0JzYzRKcnNw?=
 =?utf-8?B?aFF0TVVCWE9DOWs5UmY1a29kQ08vVGN2bHVSR1RGY2JidG9Hd0o4UmVXT0xj?=
 =?utf-8?B?T1pmc2Zva3RJREgrQUtvOU9ZR2NOU0I1YVl3Z1dXQ1pYbzhOdnN1UVl2MFhS?=
 =?utf-8?B?SkRsbU1sUjlWN3owQlFQU0hJTlNjWGZzeWdsSTUxNllZbW0vdzdIcTB1VkNR?=
 =?utf-8?B?VWM5Z1V4c3VZdzJWQm9rRWNudkh3Rm5IeGhORHBtRy9PNlFqZzJzZ1pWUGxn?=
 =?utf-8?B?Y0xtVFhYZEs2bStxeElCaExKTXFOL3NjakxTVXpIZ0hoRUNIbTJkQU9PZGlF?=
 =?utf-8?B?VmlMcVN3a2dBeVk1dzdQY3dmeWZ0L1NMWFVBQlE5VFVud0lLcjMxOHE1YlQ3?=
 =?utf-8?B?eHFncHFFZngrV1ZnVzkzQThXaVVLdlM0Zk01Sy9DeEtabVRxN21oOE02VXk1?=
 =?utf-8?B?SWlDNUxaWXhXdzlNR2EraDljclhUcVltVk1qT3lxdDA3SDk3R1NjQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e69f01-e445-4fff-400a-08df1e1b4b93
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 11:17:49.1619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MceS/Yn6CqDtZ91n87kpa90QbiyjRfEFbSDMNQTubJxGl5RbVFUQ9soL0ZADsQrVEXBx/jICHWnimr8LCvba7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6727

On Tue Sep 29, 2026 at 10:56 AM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>=20
> Fix the following build error on 32-bit ARM with COMPILE_TEST:
>=20
>   ERROR: modpost: drivers/pwm/pwm_th1520.ko: symbol '__aeabi_uldivmod' un=
defined!
>=20
> The driver divides u64 values when it converts between nanoseconds and
> clock cycles. On 32-bit ARM, these divisions are compiled to calls to
> __aeabi_uldivmod, which the kernel does not provide.
>=20
> he TH1520 is a 64-bit RISC-V SoC, so the driver is only used on
> 64-bit kernels. There is no point in compile testing it on 32-bit.
> Limit COMPILE_TEST to 64BIT instead of changing the arithmetic to use
> the div64 helpers.
>=20
> Fixes: 3c180003dffb ("pwm: th1520: Fix missing Kconfig dependencies")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/pwm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

