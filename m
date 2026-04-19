Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022128.outbound.protection.outlook.com [52.101.96.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A381F254AFF
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 19:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776627392; cv=fail; b=FFbcbcKlr3bUgD7xGB4DJdkzhdq+UHWdP7OszI2O6T1DaYilIU02ShEa/G3yuHAJvdfxptyrcViuLgWg3vFx+HlRD3tEsl/NsIxhQ2MEbe6HAaeENmfz4PzkA2pLuKBdFPbGE1U6QUDr3IxuuT7EaKjPGt4a7INBcCmf50lInpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776627392; c=relaxed/simple;
	bh=0+4zmsOo2uBJkyyFarmLnaqb0iHeJzFMB38IosI6HMw=;
	h=Content-Type:Date:Message-Id:From:To:Subject:References:
	 In-Reply-To:MIME-Version; b=J4kwupWeOE2WjznxoVBzjEXYj8191/njNlt5Yha2SOszPWj1wnuymyyhJmOG4fWMxVrSl+jdcHSuCObEe5y8rls/rEKO6Y9Ijqeo32SoGKh+UJBVMp5NHfn3QB8RB4CqpTq4RxC9vIQPZVjC4YrzJTXeiA/lN3CSfy6U4/E/SEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mAlQ0455; arc=fail smtp.client-ip=52.101.96.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mAlQ0455"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynIw6OMjMZcZF/T56HbDa9OKiH9/eT9LM6Af8wHFu56ml0beJEzJiRYG44TPSivynwpd/56iTFPra9AMCFy6aIORFj11sm1XiR9xQfE2Dq8bnPQXkmDSuYGklFcSQbUkezG09kDExdDCYI5iLa/w/YGQG0pnOYUI/Eoth2HK33Oar7V9GSdUm9zQOwLMRX7fXzaJHFhbPyBOAvMRnBxUkro2NpSDNy7r35KOKwhqLwBO6PhQkKnGF5SaOpCaMnS5qNMkomunAxbOaTn/Q59/PuuqKf0QO4YYn4rlvCGbvnjUP7lmRopObWTLpm2Pp/WYO7Z+q4yH694z7z5HZvdmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HK0AQjTPGrnWvU5NQpsaCr3w3cwPAo6zjCentsFKH0s=;
 b=QiX7K4GEGQgjatAUU/5jiLia7rwK3yANACYHyIDOwkC+gRZZOKtSc0owoii1HbIFWsWNb8pSGRAAKY+vbm0eeLICHREOUO/FArB5NeTC9DWSAxCwQF7lzTsKCFXc4SBfI5m8C3bhUu63qddBAMlpIEIEXMBqafsiea+IBHS1BNE0ql0gxt34CDHVSiExl2hsPf6DwQNMO96+YxV0EH4CIfuEYYGoiKK4+tIIigSA8vw43CZZbaelcGF9rvqc2g+q6mivc1OLnNG0tZPfEw3+kGhsctUuWwHdGQ2eX7v63m4HfWzi2i2XM0RjqzPx1iM/e9bnu5U/mPUuc+Ho8TqWQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK0AQjTPGrnWvU5NQpsaCr3w3cwPAo6zjCentsFKH0s=;
 b=mAlQ0455y9C61sHGnAu5z2vjVx2itVKpEbPBIyg9dlkMRoHtSm6txacYGTv4u5A0S134T0ZnQ/aJfYGbQBZan/Zqf60njQrkPRi9G2ecZbtO/Z5+QW09at+SOsXt/kYpEf0SUSIxSCR9QyA3OOICrv60qZom7xtbY5eHCyGHXPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO2P265MB5301.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Sun, 19 Apr
 2026 19:36:29 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9818.032; Sun, 19 Apr 2026
 19:36:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Apr 2026 20:36:28 +0100
Message-Id: <DHXDUIY3FHI8.2N9S5L8WFXX4@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 2/6] gpu: nova-core: do not consider 0xBB77 as a
 valid PCI ROM header signature
X-Mailer: aerc 0.21.0
References: <20260417191359.1307434-1-ttabi@nvidia.com>
 <20260417191359.1307434-3-ttabi@nvidia.com>
In-Reply-To: <20260417191359.1307434-3-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P123CA0165.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::8) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO2P265MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2dfd90-aee5-47ae-de9d-08de9e4af3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3rKB6VvZW7m6cshxdxRY95XdKm6+7Mc58SQbj7h2MVjHIS5w7z2XyVmz5A20ikTeAOdkSynib4n9oUHzCEGXnntkziZDM5m1d9QhGFHAjmbIQS5HiTrSDFTa8nwCfV3xZRbsU1tWq4f71J6M38feiTRVXeoDwXr+U9ysBdNiEGR8c+gsQ8WXYZd7EwUSkZBO+gNeY+hvnPTYVoF6vEyhp/ydJzCINkhDRV9HTNHWI9YTghCEhvpf9meXWISkg6DffhBME2PnlV+83IbOlKvjiabpDyL0xOT8Iz7V9PJWiUAlO+GL38Bvbcj3Itq+efNf1AI0HmLf7OU3TTUg17CVk5qzo55cw1XygWFSwuRV9iFMsTEL3aja4pf3O1XaAqtUC7wxaDRsRn93MwKTwz8Ui8mSaWulGM5evLnIY3hhi5DsjdGxeQs2uoFjiNYSVKP6ZELS5VoOURLRRKStKF1u4Uy3lGrS24TC2eTaNBXaVcWRropaca2KVWG6LGy3MPAjU3UkOdTbfd05z2kPZTUoAK6ClXEYGBnF5VI0PPmsF7UiBXiDgzWiPlRJN2XAJfm6avP0EqG4E7B4vzKTSftF9gfIdtp5w8Dl0bxn/6/+FNvZNwxLR1FhxFu/NORgKRzE7HDdE+zC3U44j2wO9oshSiBQ7mzgY/DGFZnCswsAbPu4Ve8u9VrAI6FQsdeE9Yg7XR/gv00r0HYdO+ZK5K6KNpCCqHYi17zvmnYMMqFVO64=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3U2Ukc3OFNqT01yYklnMzExY1g3Z3pQcXF5SzQ4Z2R6VGVFWXg1WnpPc3Zx?=
 =?utf-8?B?ajAwaUt4VXNYYnlSeW1VUzZObXg3ZzVNWjU1cEJiTExMNHgrWWFidTNJVnJv?=
 =?utf-8?B?djlCK0ZCTDRLNk1Zc2ZVNE9nM2FtSEN1WkJrTy95b1E2THowK2UwbmVNVlVl?=
 =?utf-8?B?R2JpTmVCTVE1clpyOFFqK3pTU29vRmNWZFdmM0hKSE9hWCt1YVZHN0VSOXRZ?=
 =?utf-8?B?Mzl0SmE2Vk12L1dwZ09TVUJtQWdZN0xGREJiait3NERIdHQ0MElCR0c4dWpW?=
 =?utf-8?B?dTdlaDdJc0VrbWpVMG5kQ2RNRVVJKzFTYVFzK0VRTWMxbGp5QjJtRU5welhm?=
 =?utf-8?B?ZzUwSnhWaWNzM1pValRXUXYzeERhYjRhczVGakF0RnZpSVdHbFQzTmZoOVky?=
 =?utf-8?B?dnRWOC81eDNudm0xbW5wclN6L3I3REtjcWlZTXZNVHVpUGdOSklWclRQTEs1?=
 =?utf-8?B?bDhEYTBwaXVsa0xvY1BMMXRHQ0c0R1JQZVUwZUNsY0h4ZVB2ZCtuSzRiWlZi?=
 =?utf-8?B?N2dxWXZzbEhTbUgyRXdNQjlta3pKcCtEYzkvNW5VNEtxdHZFbjc3VXFXbit6?=
 =?utf-8?B?U0tZVEkrd3BDbG5kQXBMcFZJdzFWOE1kT1c2bEZjNEMyZU5nTVphNjNuM2wy?=
 =?utf-8?B?YVV3S0RFMG50SmdWZmVqSmtsM3N3SnJQUVVQUXFuRHIyZEFwNXFnMld6TjNG?=
 =?utf-8?B?ejRZUDI5a1ZOVGw4cmRuYXlxMURTVVB4L24xeTlFZlhRQVVFQ3ZjVkJyZUI3?=
 =?utf-8?B?Rk5SQTBHenlEQjR3QUZHclJWeXI4bzREQkdlV0kxWjZSeVYvUlRlSlRaN1RE?=
 =?utf-8?B?RkFiV2had2IzU1I0L01iS29BUlQ4V0crQzdxTStXMGl1VWp4THBxSUozTWIz?=
 =?utf-8?B?cWhsN04waklpS2kvaVZwakNWNFpTQUdXNTV0T2w1V01mNVA0NU9mVGp3MnZW?=
 =?utf-8?B?aGlUWm9lcjZNS2ZhV3p1a0UvcWRvYWJaTHRoKzdaRVJsUzVGV2ZiYk43Wmg0?=
 =?utf-8?B?bFlZUzlNWkZhWmxTOS90L05YL3BLQzNWb3ZnWUVEUmdiTXNFeEJGMng4b1pK?=
 =?utf-8?B?MTBPWGkzUnN2UnVqQmo2SCtjT0tsanJzaEtyZUpkWkVsdHZlcGxkUGJsTGpL?=
 =?utf-8?B?N2ZmOGRVc0dqMjRvaUpNbWl0d3NETmtDUXQ4aGl0eTZLRmpRSVdyN2IyeGJ3?=
 =?utf-8?B?ckVzOXVaeHlML0RuYVBOcnJKdWh5L2hmUjU1M3V0bHltemRuTFBWUzZzQVB2?=
 =?utf-8?B?VHNDTXVaNjg2NjhOQjk3aTdVV29WRWpEU1l0Z1BtMWlXVG5ZUnEyM3ZIMEFu?=
 =?utf-8?B?dHNNQ21VYzduT0hJdnIzcGlKbU80UUY1NDBXY3ptNnN3SlE0ZGtWT2N3TFp3?=
 =?utf-8?B?d0hXWW1MZlVBSEdkVFI1dWNzSjhOMUhZdCtrUXY2cGtTbDJ3d2JoTkt3S3RJ?=
 =?utf-8?B?V0F4TDJKQ1JWTksvdWw3amtzNXZxdWkwZFhKMGhINWd2Mmp5RldheVRuVjAw?=
 =?utf-8?B?d1FYTTc3YTdCQk9jRzFPTytlVU0zWkZtMGhHYys0UVI5aDkvQlJLVTVpYWUy?=
 =?utf-8?B?RmZxYmtBWnF1akxsM0pIelFkS3k3R05HQkNkMGN3eWVVbTdBSG9GRGZ6blNy?=
 =?utf-8?B?U0F3cE5Bc2YrOEs1elhnaGFBN1ZnckhOS21hRWFvWjVBd29RVnY1Q29qUFdo?=
 =?utf-8?B?ZnZzNjlWenV6ZGhTQ25FOGY5WGh2UmlaVnZ6aEpXQjNab2xuM0g3aTAxYlB0?=
 =?utf-8?B?STNXMXVZK1pXTUlhRDdhaUhvcVYxL1Z5cDVDc0FVYzk1L3dmQTllb2t4enFi?=
 =?utf-8?B?cFNSTmpYRTRPamN4L1E3ZklmOE5TVHRGNzk2TGoyWG1WV3RBSEYwNzA4N3Y1?=
 =?utf-8?B?bnhmTUNQOFdiamdNQmNDeldiVnRvZy9WNjY1Q2ZzZVZEUkN0a3lvMDQxSWk0?=
 =?utf-8?B?QjMyektiSzhQS1YzUjhRUnFVd1UzalVvS1pweHRtUW9qVFpuVFJiM0dHMStF?=
 =?utf-8?B?Y2h2ZWFyQUozVnFSTjFpZS91UzZzVzRPakgwMkRZbnd1MWtHSGlPQ0NJUGlT?=
 =?utf-8?B?V0Y3MDBhbTU5VDVzVmFOUzdydDhCZXB4R09JQmFMa0FBUitITWxGbURWemdN?=
 =?utf-8?B?MGx6OVJKWE1vNGFqWWpPVUxEU1FVYVJpZkNnb3JFOGJOSGMvRUNENUU2YSt4?=
 =?utf-8?B?K1ZTVFloM2JCZElYRDBmaWo1a1JvWi85WUhxclM2SVNGSlVwK3Bsdk1LNGUr?=
 =?utf-8?B?ZlZNcGZUQnhmUHpZeFBsSDdHYkx5YjVhMm9SSFhsTTRaK2RwN0ZIWC9hQmp2?=
 =?utf-8?B?NWNlWFlzZUFHczQyOEh6K0gxZnVQNmxCVk5OdjArUVo4eDdWeGxndz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2dfd90-aee5-47ae-de9d-08de9e4af3db
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 19:36:28.9869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cx0Th8x4o03jZAlEhr3AljT9pnEGgMXRtsjPmsRzM2nR1FMjqyNG/givZXO9943Yb4y9I0qBgnDvuSdk90Feyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5301

On Fri Apr 17, 2026 at 8:13 PM BST, Timur Tabi wrote:
> Nvidia GPUs have some PCI expansion ROM sections that have an Nvidia-
> specific signature instead of 0xAA55.  Signature 0xBB77 is actually an
> internal-only value that has been deprecated for over a decade.
> Nova-core will never encounter a GPU with that signature, so don't look
> for it.
>=20
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/vbios.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

