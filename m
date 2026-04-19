Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020134.outbound.protection.outlook.com [52.101.196.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39065254AFF
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 19:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776627397; cv=fail; b=MkuUqwlNdi93rvaYeyKa98LmEHFL0dIhtktKX1B5Em2Lmi1qgYWN/wSw+tIs4p2LehWcAG1BijH5uNLquaC1prWnIy9QP+e5MVYtdzET3HM0RnMSaLoL+AwtbTIAj8vEuOD6Ols/jUasv24VEADfT7pTKZdFIfBipCRadeeIewk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776627397; c=relaxed/simple;
	bh=b66TYLk8JDef5FQYimLQWR8mrda5FqyzKVaSYEnFWUM=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PAq/RGF2aUtuoYDdH/HKj9Xiin/zAYNzrMc7onhvMuSr+BdUNaKZoLb+s+WeeANtsq+9ihSsd6zg3pnf223nk44A/lGfiJSTDhX7+oyHLe4qPFJ40C56zOVWSxqdM6RHfS+vOEVDx+fsWZh9uLO0r9lQ+iW5+Q6k6G4cZNIiTSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=N0wVFD1w; arc=fail smtp.client-ip=52.101.196.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="N0wVFD1w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnDdYlkmROkcOrRy1QKAVA9rIs8bhW4+TlEqgXNlk0ApzI+G2vFjouMd50IobXeLY5SiZI67Uj7hqpaFudqPK/yNSm8CjkUiM7qI1bAkxhiHjjTGrX68XJKrWQy2GBdVRnXhBw7U3U+C3Z1wcUrQvIHFlWeIHkkKGchpgx7FYIhJU+v17KBIoYSN6phg/srT+0PfAGyk0/2wiso77fB9Yl9aaPf78cC18XxiZkPK4Qd8Fq2UmqXdsI7NM5zSqoUguAh5c+4s9LceTdFGqvup8YHRYXOIYxBQc8nbszjtPDgI7iTRHPc6zJpbGaYf0EOWFKfipmXYYQYH9ReLp68Hhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmukB7s+wBi0lU8lHK8+PtC+isOrmRzkWpHUNjzbomQ=;
 b=DR4P0xVNHbyiByk2tdv+vS1jZQ63j8ZQM/Lpbfu/mgpqlRuvTvx83ttzB8LqAEbNnEmadSnlj+hkAkKlTpFwBPsCxK6lLPa5HnVDSTGN8NF1EChGyd7+GiDyGLu9vmupVJm+Q/p2PjwFSlMhc65SE5NfMNmuJdGF/wv48HeLpGWRsOK+Ho+Fn++IOzhd9Aj+jEX2m/lAibh9PiulgnIuMZqQ5iGNFPKL8voIRCgrdHNHJL09MxmALP2AZRF0bg7IN/1+CUweuXIh3tAVsARXbLPHTJuLZDztRxoZ6msq3KxxLMxCjI2yUzLFXJ96uN+Xf+RHum7oEdt9cOAr+fiX2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmukB7s+wBi0lU8lHK8+PtC+isOrmRzkWpHUNjzbomQ=;
 b=N0wVFD1wMIRCSAYLUFAvMmmy+FsNb8GIbYJnxnagKiPsBNz4ZB60bub2y4t8rd2V08SSNcVAmb7WJ91dUSBhI600NCyJstpODQlo0qSgzDwAG+oTbC9jNySdDGg4dBqgoKNldZnXTtRDg6op+kO+V0CgG877PkoS7g4nUluhYG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO2P265MB5301.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Sun, 19 Apr
 2026 19:36:34 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9818.032; Sun, 19 Apr 2026
 19:36:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Apr 2026 20:36:33 +0100
Message-Id: <DHXDUL8BV61P.2CZD5YOADRSC@garyguo.net>
Subject: Re: [PATCH v5 3/6] gpu: nova-core: only boot FRTS if its region is
 allocated
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260417191359.1307434-1-ttabi@nvidia.com>
 <20260417191359.1307434-4-ttabi@nvidia.com>
In-Reply-To: <20260417191359.1307434-4-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P302CA0040.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::15) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO2P265MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: da0e0cd3-1e24-4042-1173-08de9e4af6e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zXzdm8mD2vLQfxgiQ7WDSrWYTYXf38DNPh7sY/iCiHKNrFTeuk1WlTOGcaMRSc2U1fGbihrZ7WyZIjaTSGUdO3IVMYHgXcX49Z0ByALeRDLuGNehxcEE9S0CMrVn2ITZyUdFt3ze1E7x1J5AT1pD+jmqCzNn/StAbgEnzHdARCvCXUSMRNTyvfcmHv4YwVtHjFS2gndYxiOORG42lfEU+gZrxiMdFiCLikRlPBqppS6V8pSTBMaMGOGVDAAu55zKRpXH6wa079RlpATOD/V5TaV5DxUWsUuJAplPbZMP+Es4b9Rjf9cDgiAm9rRV0HkRY3RF2woCNMsK/btra/Wi8M50LFaavB0ojhz4ZqNd8m5UdIk81lLAkxtKXGlimwvQw9LKDnyff34cHu3X05/h/0Eq9uHJCCE6cqJeZFayxNzGIL36dDBXjvw210+/K8Q312PxLu0mwRmDA4DnS7Pv6G/3yUou+fXJ+ruVkhf1ivzrOXGKTgNti37Tq/HfUo5fUMW4Mno9Ra1dFRofGLXxPecwuIl+7eZSGUrlwcpRn0y3Vp/u2Aan2lqTWUAT+YGuAlD+XpmIyD80YaRAb6Q8Z+80++PwjEEmYlz2/KQOiWucwcp4oVRiZhPSiKuSyc0Pxw7KxGUhv0NX6lhaimCXxMB5GNMneqa6MhBw8QCY0+Yx/F9MR4M4iP6seetSEmK0GIZkngh3ycDPGpRisDKsWf3px6KLM1kl3knKXLnLBTg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVlrN3AvdmRybkVFd1d0dll0clRDZG9XeUN5eTgwQ1pXU3hHYkM1b09KQnFx?=
 =?utf-8?B?azFIYnlQQThTSzFpSTFoK3hUSjFucm14SHNId3B5Wmt3UjFKcWw1czlEUVlu?=
 =?utf-8?B?YklsSG84ZFlBdXR6YXVLYkQrMHA2MDdZNkhPbmVNcW9GV3BLTThHQ2U1TnpM?=
 =?utf-8?B?aUk4dDRwb2x6VENrY3JmRVhHTCsxNDNJUEdZWjhRcFhMQlRrNzYyWVhaOUo1?=
 =?utf-8?B?azl5U29JWlJiT0tST0wvSUwwbll0bVdKYk53dkhnekxsTjIwQUxsV0VhR3Fm?=
 =?utf-8?B?ZUlqaldIcGhVRTZwR3h2NVR2aG9aNW4wTC9SeXlvUy9kdVorS1p1cjhFZ0dN?=
 =?utf-8?B?QUR2c2RqUXJXYWxSQkRYTWJjRXovaFdsSU01eWYrTU55d3RkbnVCNG9IdzhF?=
 =?utf-8?B?VThzdm5RNitqLzRJeWUvK2xHOXNEYm1JbTdUMHVBSmVuRlJ0VWpMZnptNW05?=
 =?utf-8?B?aGJ3aE1nb25hQ0NLZ00zT2F0K2hTMkRpVys0KytkSlU1S3RVaU1zYXV0bU5B?=
 =?utf-8?B?YnZUelF0VVRBeTdNVmJjZ1FQcXNVZ2N4dzcxcVdKZDliRzEwb2tyR3kzZkVn?=
 =?utf-8?B?c0hicW85MGhiNEJ3cWVoTmtGQ0RmL2owRWNWRitNWTZ1dUNQaHB2eitLNWdt?=
 =?utf-8?B?RlVSOVlCcFNYYUl4L2lOaUVia2NxVFc3a1MvL1NMMUtMRzFMZUREV04rVFBR?=
 =?utf-8?B?ZW4yS2pLR0tUVUZDL3JQbytyeVdoWVpKYXQvTmlJY0tLVkY2NjQ1clNmdnRu?=
 =?utf-8?B?Z1I0eFlPYzBnUWQ0SG4rRjMzcjNIYkJteExaS1o0NzAvQXhLMkF5eUdqbDNY?=
 =?utf-8?B?c0Yza2ZLcHZRNUE5RlI3aERiRHNjME9ZclU5d0hyTmN2S2R2TEZyRy9pY1V6?=
 =?utf-8?B?bGxCVitpaG8rY1JKWlpNcmJWSnFyZ3doNHpBNjdlNzJQczVtdXlWTzBUclRm?=
 =?utf-8?B?bExLYlF0am45aWliVDhXbkFTczQ3UHpraHhQUmY4WkRKend0R3o2YjZXL2JR?=
 =?utf-8?B?WEM4TU0xQ082REg5YWY4NkRQVmErSDdSa0U2SmlKeUpIek1LWFpmdk1SUjJG?=
 =?utf-8?B?d1Y0S2Z6OWxKNE12OHQ2MitvdzQ1MUJXdFZOWlpsa1VYdHdNQ3FaYUhUaUtU?=
 =?utf-8?B?emRPUWpVeFIreTQzdFFETnJIMGMxWG50VUduTGxvUC9nZ3R6eTN3QWc4UHly?=
 =?utf-8?B?cHRCdlJoN1NQTmZrZEdBVWdVMDc1OGY3VmFaeGd6OGhFWWxSZVJsell5MEt1?=
 =?utf-8?B?TFdtMnBtS0dRSFRyaFhSWGdKcm5ZdDY4dVBpeEtaVkFGNnpsN1REbWJma3pS?=
 =?utf-8?B?b0lMUkZnU2hYU2M1cTI0QnZ0UXdSS2RoS1BtdUVnRVZLWi9aeFlrRDR4Kzdi?=
 =?utf-8?B?SVlZNGZOMnBQYjR2U2Q2TDNiYVJvWmw5RU10WFNEeXVpblloSUR2VXlMcWUz?=
 =?utf-8?B?RndSa0hCSTFRdHdWblJvRzNqTCtnRER6MVc1NmJ5ZmJWMEpKNjJvRjZZOUcv?=
 =?utf-8?B?OTVNZ3Nwci9jZHgyc1JwYlN6YlM4N0M2TEJ3YWZwTHBKNDJlMmdXeDJZVG1Q?=
 =?utf-8?B?TnplQ3FGblRVb1dRMFZvNDh4aStBcE56NEdKTEtoYUhoRmp3WjFiN3JkV3JM?=
 =?utf-8?B?UVJQdjB2eTVRM0tuYStYMXk5ZE5TenlzYlBZVVRFZitSTmk5YnJDWDN2Skg5?=
 =?utf-8?B?Z25yWE96RVFrTVJrQTg3aUFmZTVvNjkveUxMK3U3TmF4c2N3TmpPanQzMmFT?=
 =?utf-8?B?VndXTmtlNUNVUjRrcy9FZCswQVk5NkRSM0dwNkJQZkFodU9PYXRwVGV2OE9I?=
 =?utf-8?B?d2lCS2QrbVZxVlBMQkVqTTlETWVVMjllRDNybkdadEpza0Zjd2I3SGZ5cjNU?=
 =?utf-8?B?eHhEOXBZbS9EanNYK3ZRMlUrSlNyclJXc3V1ZFkxWWY0b2JjMU41eXJVc2FW?=
 =?utf-8?B?RDFvOWdxSVVTMlp1aWJKaEpXZVlYaHN0aGlqcCtDKzBOL2tVd0E4WHNKQnR2?=
 =?utf-8?B?RGQ5eEFVVXM3RTJ2V2graVBweWRiTWRoNTUrcU1mZDlaWUpFRDJUM2ZMMG5S?=
 =?utf-8?B?aHZBTDU5ZHdTOWUzUXo2WC8zZVQzT3hMMkFuUjR5RStmVmxHekp2VnVpNmRT?=
 =?utf-8?B?Zm1pcjRLbm1tNDc0aDZUbUFEK3NwUURGZHJOQktqL2N3bXd6K0xONHluTElq?=
 =?utf-8?B?Sm4rZGt0YTBpMS8yZ2lVNE44bHEyb2xrOW13TllvSVFpZ3U5aVo2dHY5Yjg5?=
 =?utf-8?B?dGJGMlJ0c0sxNWI4aTdYSVd6SGg5M2tOWThKOUlEa3lNb2k0T3hSVWx2ZGpB?=
 =?utf-8?B?Vlc0N2ZHcjNtZHdwWXBaMitzQVVPNEhEbk9lc2gxczFoWG5JdzNtZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: da0e0cd3-1e24-4042-1173-08de9e4af6e1
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 19:36:34.0468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWoLPkIfRrpz37C3WAm7Yur3cEGb012cylTghrVn/kNYOo3ATRNrmmTLgqxyW0pcSe/x9YyehHjxh93CUBqOyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5301

On Fri Apr 17, 2026 at 8:13 PM BST, Timur Tabi wrote:
> On some Nvidia GPUs (i.e. GA100), the FRTS region is not allocated
> (its size is set to 0).  In such cases, FWSEC-FRTS should not be run.
>=20
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/gsp/boot.rs | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

