Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022091.outbound.protection.outlook.com [52.101.101.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE1540DFBB
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 19:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776628031; cv=fail; b=oKfsECFaolOhL8r/9snDw6+GmbysLVVOPezt/0rPTaQhf1KCMY/s4oCydNfHfo8PlCKoJwtMF7dLp2ckvbSM0tztkaI0nrdUAN33Ci+tj8i++yBPplIPQn7JaudN1OEySudRa3/owD4CQPpc9geNpWiQxeiWtLiMj5AiBJVm3x4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776628031; c=relaxed/simple;
	bh=UDbFtUZpKFwjBnFGHBDPK47/L8uLh8nZzwHEjQl9bvc=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=IYfkHxH72uRE71vq13Onl2jd8HUxgEE0vfalQMcVUUTr7VSgi1Wr77c4k+/pBu5mZ1xJJlo+mMgB/y8d0s10oEYVKP0/ghkxWlvBGXZe3JD++842EfyH1pS57PDGLnZpODP5eUCcPUBDUvHC0IdfFJp5aoB6ndp/F0vvaio2jU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LSENQ/26; arc=fail smtp.client-ip=52.101.101.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LSENQ/26"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAdwRYVcercmLdHWxJvVQ2T3CEOrpENgb305RwmxouoHp0zBHOhLzJLkuOJ0IAMMHg/HWa1NuMTrzSmerfmSzI6SPIofSrKCIWoONFrYFd7K8v6nGxMYeJfq+RZF9yPSHc0GoB5DMZMwNb4vdnivIEJsyyG0HyTPpoFMTdSiLyzdMj0POmYWgVpiOkwD8ZaYsZGXMfLylZJ4DcJecdFTFWAFhJgJzFQiHS8CBHCSP3aIAhHIYqGaRPhAcyOnhij8extvpU4/+sFEDiotXNYdH1E2tclAe07pnXptsSj4Gj1eYs9KhDomCZOBDHkwj9lqhx3fkYTwOevJhXVU3+jJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNIdoHoSmUo9ZTeR6sMfZyZtHczcWic/plQiD++Q6LA=;
 b=cN2jmsCKI21mB2gk8umyubk7uejdWonrywgP10eo9SdgyQI+R4S4Rksb7eO58YV7L6QoU0tk6k4sKYPR4mRr+ezXKc8B19cn5c5qVfXPKk0iKapydD3qFUk3SD1bsRhIQpEKQKkGKmI1h2K0rtB/CAvh9LtEqefGppeygqlZxPV7makO2p122Aa00FTMW1Qe5KCSoQhe66AmeWqcWGGuq57PJNnipvqSdfkTjRMfRiVwqwM+4rdnXvzRL2buBabICCChNlgC/qcMEHzQlrShitneMLu18cN0dpOv56cKGPudwlUWQ7Ycr08X+9SZVoMTNU13McUmNtC9+OLm8vPFBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNIdoHoSmUo9ZTeR6sMfZyZtHczcWic/plQiD++Q6LA=;
 b=LSENQ/26ajodUEZnd46ejE2TyhaHX/XqnuB3hcrRnJkWTEN2fVELdJMyMu8K/HeH/Hql70dWUHdjdBitBzk/CIQlEM14FHYd1VoCkS6H2x2S5kZ5lWY0xU/tBQ+FcUIPv7uDyAnmiXhekInVFhn4goKdKFUhKZ3exYagqF+ydhs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CWLP265MB7309.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Sun, 19 Apr
 2026 19:47:03 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9818.032; Sun, 19 Apr 2026
 19:47:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Apr 2026 20:47:02 +0100
Message-Id: <DHXE2MBVLV2S.3AUM31VR2XC0D@garyguo.net>
Subject: Re: [PATCH v5 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260417191359.1307434-1-ttabi@nvidia.com>
 <20260417191359.1307434-5-ttabi@nvidia.com>
In-Reply-To: <20260417191359.1307434-5-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P123CA0523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::7) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CWLP265MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: f331e171-de1a-447a-bac9-08de9e4c6df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SS609/yuQYm8GpfCvlhN35bOLd+9+VqCAXbjh6D7i4nVPX4isWlffPI3H54UQAPRhKkHYFyDFqrEJCLd6Mx5hHQLhxHs9pMj3cJAYZYGDY4ZhJDWeT3FjUNL/GQDBHLIaS7e5HFr70D9gUrVECJQuDVBfuVoS6JsiXjvtBcJuqlcEaDXU1opsH2WztQypIMeeWrby6jbBmDJt8dZPkUaIu2Rl6xN+x2DhFlyh6r3m7fNyzbGE1+fwsF92jFSjKEC0HVK4qwGe298w8TyKXiNynuuVMnFde+FUQsCg7LLYxzH0zEXFnq4Xs7fAlro6ELt5nddFNs4wTPfSgNMgMc/S9PaPk0xpglENRn1yaaGHWYmLB4+M4Omh3aIjrWlvkusQQy6SBh82oqF4/cuEQ9N5+JUDlwPkJluYCP/3wwwifzcI9dFSekyrsYto97aZ5PupV/4HUtA/g7PAp0p6UK39AviSeSTfO9cKZ1SlnYt97H18mY6zaO9gYtsKfPb7+zwTJgztPoHROgd9zqewadoXg+2pVGoxwa+e+d3sIJqTWzn0FyWhKJrQg0fQEeTFSpytlUmPvIXcI/xOko96lAT2XNsXemB04W8je5NVN7zDaPaswNEKej6RHUAeWji6CcPBZvC1Ada6VLlfiCZ6pWhJ9QsKNjislAPFyPAARGuzy/Gn9UWjpxYPZK8vSE5QU7JwIWFw3+OyB546/K9htfBX+qK9lwux22zC/bWUBUjwmQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGJaKzFyREY5dGRTTDlwbUJJWjlVUFlCN2ZCbC9ldzJVNFkyL205YnkzSjI3?=
 =?utf-8?B?NmxJWUdTT25yeGlXRTl3SHc0eG5Oa0h2WFRpTDd3L2R6TlE5aDZ1S2llcEk0?=
 =?utf-8?B?YVloMTdkeXp5Z2JyRDlCa0wxNi9zbGVkZHRmRUVmWHRWTjAvVG13YTdlNHlh?=
 =?utf-8?B?ZWtRWnBvNEdMVUpLbGJxaElPR0Y1UWFwd1FjTDdFWEtGRHJXbDNsN0RlSHl0?=
 =?utf-8?B?UzI4OWdiM2RDRkw1SjhvaG5mellJT3hKVWlPcUhSQmNPWFZFU0x4L3FLdUNP?=
 =?utf-8?B?a2ZtUUlia0JKRHF6UnZKV0hPZmtjeDVVc1RmeUpUN2c0dEFFY0pBZy9SZUVN?=
 =?utf-8?B?ODc5OEYwajk5OGJRemJZeFQ4cXpWNTdiMVgrdUJNL2pQWG9DVW5CNThxVUxH?=
 =?utf-8?B?MXNrd0hsWnduUEpxRVZTaFhGMnFtWm4rVzV6YkRRcHd5V1RQN3hsWG1Sb2dD?=
 =?utf-8?B?dU16aUVaQmpVNU1DMXZJTkdCS2lPbG11NVE1QStLWFJjVEorVE1YTEZRZFkv?=
 =?utf-8?B?dDJWMWQwRW1PenkzMWxSSEg2UTdjZUp0dlFlK2ZtbEkrRUlrZEpjYnJSSWVB?=
 =?utf-8?B?L1FVV2VySS9YN1dxMmdMQXpxU1g1U0grT01yWmNxa25HYWlDOVErbk5uQnFl?=
 =?utf-8?B?dlZrN0J0ZG5BZGZKa0dzWUhZbkY3RXQrVWZ4ZTVIQS9uaDBHUDdUUFNhYnl1?=
 =?utf-8?B?L2V4MWlDdkovNFNPelg2U3d6TzlwWDZXREV5MEpBeTRmSm9zeENoMjNiS1lj?=
 =?utf-8?B?a0w5QTByYXNnQ2Q5ajBOV040UVh4THZVSVRwbmFuQmJNMVZJSHFGemRwalZz?=
 =?utf-8?B?UDhBbnJjcVpWclIxMUU0eEhMaHZJY20rRms3eG15S3pzcTdwTzlCVTFCWFo5?=
 =?utf-8?B?WTMrckg3d1ZaSzNzK1VSM04wUCswTkNFaWNZaU15blpxWHlNSHh6blVyQTl2?=
 =?utf-8?B?RlMvdFViTlJOdk8xeWRGZFlNdW9mWjZJU2ZYQlpKZWUyZ3NMdjF3MWNqUDcw?=
 =?utf-8?B?UFQrOGprWE9mNGpzUFVDQW9ZcTAxd3JqdUg3c2l2OTA0VCtXb1dWRzc4Sis3?=
 =?utf-8?B?cWJBbHNPNS9NZW9kSktkK1Izc3pyOCtyNHM1VUpBQzAxSE5uL3FsTmdHQXZT?=
 =?utf-8?B?aDNXVCtXMWVYZnlybCtpeTl3c1NBRXF4TzI0b1hGZmcxeWU0MTFjdWpKWTR1?=
 =?utf-8?B?N1YremlkYkxZSkpwRmJRQk5Id1RMYnNpQzBVWDhja3BpdDhmOVpMUzhKMzZn?=
 =?utf-8?B?ajRta1NPa3hwMTR2SFJrM3BsS2VYdm1mOXdjSDNjVjlERWNhWWZEU0xlZjlh?=
 =?utf-8?B?bWJhSGpVckJaeVdoYlVPdkQ5WU1HNnhYL2FQYnZWODZJaEpnZnFDSlE5Q20y?=
 =?utf-8?B?aUdnajU5ZldtQ2xOOGFGcWk0MmVtdDlGMHF6bmRXOUorczcyRk5mLzBBOTMw?=
 =?utf-8?B?WUVyK1FKRDlidDI4a3RqWmlqN25VQmFNR2cveHBiaFZRSDBlMFlDUDBrSmR5?=
 =?utf-8?B?Y0FqR0NFay9CUEFlQUwwNE1Ra1EzQ0lVQkpyNWxWNnpUcXpMczlpZjFLUHpq?=
 =?utf-8?B?N202dGU5MlRnYldJR1RaaUFGV2xzcFhvWDZibmJCbjc3NWZNMFBFZVExQlkx?=
 =?utf-8?B?UzhoQ3BIWkVKc1JUTkpQSEFoN1dYRFo1a0U1ZEU2M1BLREM3VjZIMzY0dHNH?=
 =?utf-8?B?b1pMVlVQbjZtd1A3UXdyWCtORkFDbG0xWWlaQkdnWVhnYzJmYVY5RXNRZ3ZT?=
 =?utf-8?B?Wms4bFB6UnV0MWVVdkpLWXFzZVoyNiszQ0QrMVNsZVFHY2lvNWlXZXZIS0JS?=
 =?utf-8?B?ZDJxUldNWnpTK2FYZll4d052YUJzdWpnZ1ZhYWk4TlU4RXdFRWZQR1RXZVBC?=
 =?utf-8?B?WUUvcnUxcGhMVFF5Q0ZBendBTUVmbzl1S3VRVHQ4a1RTK3BSMEs5TmF5S0Rw?=
 =?utf-8?B?VlYyYjZESlFrNHhEN0dFV2NSRzVQeWpscDUvbkh5RDl6MnE5TFMyQTZJT3Y2?=
 =?utf-8?B?UzNDeW5pNGQ4YWFBTnN1MnJNMG1HbkxBYzM0dHVaa0RqQ3ZOZk9VOW5OaFFi?=
 =?utf-8?B?cm40ejdZQVJTd2JxYWRNL0ZmdTVLaXZINExJc1dNNjY4M2o3WEw1TzZhaDkw?=
 =?utf-8?B?bXdjS0lVVFkvbUUwOUFnV055bkdSVUdRQWFNOWMvNC9qWnI3aFk4aHhmUWl1?=
 =?utf-8?B?Y1BDN0l4NC9nS2hpZ2pjN0huSklEcElTeFk3V2JXS1JTTlpma1hKM2J6VjNy?=
 =?utf-8?B?c0ZiL0RudStYOUM3SzRyeW1Vb2JtTTZMTEZlUkhidDJwNDVSdklOS3FKb2ZT?=
 =?utf-8?B?SGdLejhhMDJ2UzYwMTJQRGdIK3ZsN3EyTUFueHRrL29iR0xKWkRWdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f331e171-de1a-447a-bac9-08de9e4c6df6
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 19:47:03.3508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DES5raq/7l8c68Wx4rPsKBWaLzYJCMWIekS55y8I2qktKhgGpa0lT0RBmyOqSUmcmNkzvqovkusAAypRDdr40w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7309

On Fri Apr 17, 2026 at 8:13 PM BST, Timur Tabi wrote:
> Introduce FbHal method frts_size() to return the size of the FRTS
> window.  GA100 is a special case in that there is no FRTS, and so
> the size must be set to 0.
>
> Note that we cannot use supports_display() to determine the FRTS
> size because there are other GPUs (e.g. GA102GL) that have display
> disabled (and so supports_display() returns False), but the FRTS
> window size still needs to be 1MB.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs           |  6 +++---
>  drivers/gpu/nova-core/fb/hal.rs       |  3 +++
>  drivers/gpu/nova-core/fb/hal/ga100.rs |  6 ++++++
>  drivers/gpu/nova-core/fb/hal/ga102.rs |  4 ++++
>  drivers/gpu/nova-core/fb/hal/tu102.rs | 11 ++++++++++-
>  5 files changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index f357fb28b22c..a305a6dac758 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -216,10 +216,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp=
_fw: &GspFirmware) -> Result<
> =20
>          let frts =3D {
>              const FRTS_DOWN_ALIGN: Alignment =3D Alignment::new::<SZ_128=
K>();
> -            const FRTS_SIZE: u64 =3D usize_as_u64(SZ_1M);
> -            let frts_base =3D vga_workspace.start.align_down(FRTS_DOWN_A=
LIGN) - FRTS_SIZE;
> +            let frts_size: u64 =3D hal.frts_size();
> +            let frts_base =3D vga_workspace.start.align_down(FRTS_DOWN_A=
LIGN) - frts_size;
> =20
> -            FbRange(frts_base..frts_base + FRTS_SIZE)
> +            FbRange(frts_base..frts_base + frts_size)
>          };
> =20
>          let boot =3D {
> diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/h=
al.rs
> index aba0abd8ee00..1c01a6cbed65 100644
> --- a/drivers/gpu/nova-core/fb/hal.rs
> +++ b/drivers/gpu/nova-core/fb/hal.rs
> @@ -25,6 +25,9 @@ pub(crate) trait FbHal {
> =20
>      /// Returns the VRAM size, in bytes.
>      fn vidmem_size(&self, bar: &Bar0) -> u64;
> +
> +    /// Returns the FRTS size, in bytes.
> +    fn frts_size(&self) -> u64;
>  }
> =20
>  /// Returns the HAL corresponding to `chipset`.
> diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-cor=
e/fb/hal/ga100.rs
> index 1c03783cddef..2f5871d915c3 100644
> --- a/drivers/gpu/nova-core/fb/hal/ga100.rs
> +++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
> @@ -66,6 +66,12 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>          super::tu102::vidmem_size_gp102(bar)
>      }
> +
> +    // GA100 is a special case where its FRTS region exists, but is empt=
y.  We
> +    // return a size of 0 because we still need to record where the regi=
on starts.
> +    fn frts_size(&self) -> u64 {
> +        0
> +    }
>  }
> =20
>  const GA100: Ga100 =3D Ga100;
> diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-cor=
e/fb/hal/ga102.rs
> index 4b9f0f74d0e7..3bb66f64bef7 100644
> --- a/drivers/gpu/nova-core/fb/hal/ga102.rs
> +++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
> @@ -35,6 +35,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>          vidmem_size_ga102(bar)
>      }
> +
> +    fn frts_size(&self) -> u64 {
> +        super::tu102::frts_size_tu102()

I checked the patch history and it looks like this changes from v1 to v2. I=
f the
argument that "both have the same size" then I think this just makes thing =
more
confusing then the purpose of deduplicating.

All the methods above are either delegating to GA100 code or custom, and no=
w
this delegates to TU102 without any explanation.

So this should either be

    // FRTS on GA102 behaves identically to that of Turing series.
    super::tu102::frts_size_tu102()
   =20
Or, it should just be simply

    u64::SZ_1M

Best,
Gary

> +    }
>  }
> =20
>  const GA102: Ga102 =3D Ga102;
> diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-cor=
e/fb/hal/tu102.rs
> index 281bb796e198..22c174bf1472 100644
> --- a/drivers/gpu/nova-core/fb/hal/tu102.rs
> +++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
> @@ -2,7 +2,8 @@
> =20
>  use kernel::{
>      io::Io,
> -    prelude::*, //
> +    prelude::*,
> +    sizes::*, //
>  };
> =20
>  use crate::{
> @@ -38,6 +39,10 @@ pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
>          .usable_fb_size()
>  }
> =20
> +pub(super) const fn frts_size_tu102() -> u64 {
> +    u64::SZ_1M
> +}
> +
>  struct Tu102;
> =20
>  impl FbHal for Tu102 {
> @@ -56,6 +61,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>          vidmem_size_gp102(bar)
>      }
> +
> +    fn frts_size(&self) -> u64 {
> +        frts_size_tu102()
> +    }
>  }
> =20
>  const TU102: Tu102 =3D Tu102;

