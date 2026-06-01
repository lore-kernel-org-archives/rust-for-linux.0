Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013071.outbound.protection.outlook.com [40.93.196.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6804E2C9D;
	Mon,  1 Jun 2026 02:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780280681; cv=fail; b=tQiCKOQVZsfrLUhGW/zRmgebXjywrZjuxwITAr8bN32UphBOamA0xq7nv+sUa42fpz4wRDhlP00Uuc3YIWHLfd2sIde3Td/9cE7gK0sgtT0gtA3mezL1y/hovQccyqvJ/MlK32GDAwe3duSZZBurHv+J9RoGzrX2xmEHlX9SLzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780280681; c=relaxed/simple;
	bh=xsbWqej/fmopXNBSagShPck4Bp7ZSGM09MC8IkWLNlU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=XmMkXVvq+IVk4TMo2w6hZqd7nnNay0XU4ErUUxhWmu17SCMKqkixEziO8AIKaxa5TLHogK0NAQwWPwNvfwmxe92rhdqJQ0erqXvzcEQ4PV0pTvKPfK+tTQCZkWRYzhVL51HtI7pNOatjJ4Lb7gR2b0QQZqRcVmmcLZO4BTo2m7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kGrZ89rB; arc=fail smtp.client-ip=40.93.196.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kGrZ89rB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUB6GM4egrD4XM6zsa+5eLGRqDCgIwRdRjawOIAM1r9TzdSt30l6PaAAYGolQmsN3JoOyw1ikdxXoHj/u7AY41GQxe9r46X8N4QRhrAyxxPE8mGocRcNVJseNh9HVkTfw8Rbu/Z2XOnXEWVBIP115Bm0/LN65IbTv3fdfepL9TInFTHsax4BvRnCLg5ZvR2oU3pqQ67jUELf4J+NWXpbWbN/962hBpgThAfI9tfDAnhoEriVIEsV/duSTSDYDvfrVXfIDHSCgi52pONdIaVXW/HbOwjDnbZGrTZN+MkIQlfN/1v5quaRu28V+XM5djmQrHHdz7qwCgIDNh1ScMqM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE2TyQ09jztTu4l0kmtkNgex38bqrd7GK7xRTU859p0=;
 b=eL2Y76hAgANk+9Id4rb7Seb4Z3EnQIWGzu8am18Ki+bTzZvOkUmbvZipeWUDqDtZKjyFYF4hHXMGOEVCsUaa5y8JPvfriobENlEr3Hnrqh7YtdHOtbWAKTcX9AKVYFXUMuHB0AMZ8/9dLW2fgk+hA3L5gXRSoakMgwtUBMLtkGyIdARmFVktkGsFA+jtaikJauKal+tNevgpBkSUnUYUwuKZGC4Umbg5S9a7T1zoswnZ43jQD76U7JOeV0hjAofnUAEFCHAXlFrbSvJfKHVd0cn2rSiNt8AVrlU9bd/jivgLpGTVuOuFNbY2THyWjah+b42ZLlv1mlYPaqWVeqYmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE2TyQ09jztTu4l0kmtkNgex38bqrd7GK7xRTU859p0=;
 b=kGrZ89rB1frIMNwaSFvxs83rJkMd5AgBiVFq5dvZYWoev6GtDP0n+d0D7d0sAQ57x0OyKQYzMsvbUTjNhzvCYTbXTXnOxf/fC9MOZNb4a3tz0CKmAZ5I5cbpxgc/90c6XoZf5+NLQIrcL3PZk9UX0tf0Rextqa5Kr1E5Z+w3NkoPzp9ndO5E4HNMotKgCMPD8b4bl/5Nsd9yPUPTvzmPyQDrCXVJCqoe3E3t1wTQxGZf3Zx3UZZ76FKDEFAdIwg2WJfeUexYpXsqbU5zSPIwFbySya9C69raA1eS3UhWOa/ZfxtOpBhfxXCmWHfsAlBvWv9QfNsHJvyAke1BIE5xCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PPFDDA81179A.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Mon, 1 Jun 2026
 02:24:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 02:24:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 11:24:28 +0900
Message-Id: <DIXCTSNATNLQ.1WWQREXDVMH4I@nvidia.com>
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
Subject: Re: [PATCH v11 04/22] gpu: nova-core: Hopper/Blackwell: larger
 non-WPR heap
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-5-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-5-jhubbard@nvidia.com>
X-ClientProxiedBy: OS3PR01CA0087.jpnprd01.prod.outlook.com
 (2603:1096:604:da::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PPFDDA81179A:EE_
X-MS-Office365-Filtering-Correlation-Id: 822d3799-ea85-46e2-416b-08debf84ea5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|56012099006|4143699003|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vc09wvVyE1xARTUMr+izCfm/e9KYrHJclUclnD0ROUhQhDLhlQfvMoo+1+9zis/TJAda5mP7vcYfsRPXwSmMRnFFyNQUhyCKj4IAnYngcQTm8Cf0Hs8hi4a167BVCgix4YlhfXVuiavCH2adnIC28jFvXhiyqQCMpo15YRL6phxZZg6YF6jvDLJbz9puqeT4Hd+vjMgUQXmsjMLTXDL7CTBBP++6WBJMTZ/nHBFiwDbBIHx+QakJuLpK+UIHTBnN5RdTQzVCtmCiggMp+Nxtr2hW+Hi6H+gpFNXceggY2JVtNIMgSaA5l5qte6KtfUYIQyWTdqtOhZX33sDPBqOvVkutMmZFHFYOQKD0DmhgosN9tHl+9WWKMXYVHUhGggv/rxG0nUaYwlm0LsEhFMJPjbb1niNHqJaTZOipFfWd8FtV2kKf9d0SDzHZ6WaYZvkrikEPxt6b0RdxIzZxv0bo6inmtwgB8zRcUOyMLthQZHrTFoF0nbKp0WHkBYOcHzeI+4jbTycqH9TUQKT++AEYWTxN50DegGJaG637iALVzjrKBTicBhnxTOcQSH56HNaGSMf8kSfhkXRBApwuPZjGKFPmzGQQ4LhMwvlrba8DPUfqP9WZgXEYOrec5e5YYtzK2WsM+14xikVEVG63LlJKcsogJp+TBpI5l2UYTf3BzdEF0vC5q7DFGLUbSd6vN22S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(56012099006)(4143699003)(3023799007)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkxHdzBaUVMzOC90UXIrZm9pSXMwQkhxaGV3Sm52UVBkTmJzTCtKeTd5RUEw?=
 =?utf-8?B?Tk1iUGhKZ2lMZS85THNRbjdXMHNkSFhxVWR6ZTVqbU1Rc2lqKzJGNWhmVWtX?=
 =?utf-8?B?cXl3SHEyYldVMXlyTEM0bDUzUzdPSm0zSzhiVjR0SWttbFFJWEw2ZitPNldi?=
 =?utf-8?B?eXlRcksrM3hueFpjd29TeVZxRjluU0VaaUF1dmJrK1F5ZEgvQXg0VTFNVjRR?=
 =?utf-8?B?Qml5TGFtdldLSzFwWDBkdlpGd2xsNk1VTGsrMGdqQkFVT2ZINFhQTTk3ZWpi?=
 =?utf-8?B?ZFVIVVo4VlgxbVlJTVdYaGppc2lzbEc3ODZwV3hEdkxjL3E1WXlxajFTWTMw?=
 =?utf-8?B?K0hFMW1XeUxzS3BpQzZscUtCNzZ1OWtNTnVQc0xFUTZtSENTcjFuQTlyN0pE?=
 =?utf-8?B?OFZWK0luN1J0S0xoVVNBNjlPdkZTbWtKdVVsSDNmdnY3amErWDZncU5ZdW5N?=
 =?utf-8?B?azRIcWdCbURnSHQwVWs0bytLbjlFRk93b1pFRk5ZMXlNaGlPby9mbHlXRVhz?=
 =?utf-8?B?NkFNdW1zSGU3TTZHdjM5eTVaSGdoRTMzVFM0RVp5OWJXQ1dnaUpLVk9QWlor?=
 =?utf-8?B?RXNqazM2UzQyNjdsL2Y3M3gzbTRabUxpUjFoYjZPNGFDWHFORnZtNG9DVFJE?=
 =?utf-8?B?aURZUUJlaDFEVjEvbWZ6c2M2Z1hsVkpuZUNGamphSGs5VStVcmY1Yk55K0tl?=
 =?utf-8?B?Uy9PV1JGQTFucmVYeUEyOWR4alRYMEdnNnZ3UkJoSHlvUXJXTXQ5MXVyLzYw?=
 =?utf-8?B?cnlBZkVuY3BOaE01Zm9BQjlUZit4dnl2K1FnSDc4aXRPamRJYmVwT0prVU5m?=
 =?utf-8?B?MnlPWDM1eHpzU0RoTzMwc2dScm04TGM1NzRoN3Arb0FtdXE3SnZZaXZnU0Fk?=
 =?utf-8?B?c1E1azBjb0QwbitaeFRKZnhCdjd4UTFMaVVnS0JQRWNzL1pibzhDbGhFWm5k?=
 =?utf-8?B?M3Y0WkdvMkZyVXJEc2dReGdKc1ZwQ21ZZUVJMVNTeW1kdzlVKzVIYXVmRXhh?=
 =?utf-8?B?SndSbXozR1ZkZnd5QnNtRWh6d2lHQk11SDBlNkxqTnNmV2x4bkp4anI3bVhl?=
 =?utf-8?B?d0kxVnZ6THVWN0NJbVEzRlJJbEM2RlBiWUg0bG5PN0hvblJVWWh0VkJKdG5J?=
 =?utf-8?B?cEd1NmM2RSszYWZjcnNlSmNZSjBvQzdsM2RrWWxIU2lpNy9KZFd6ME5TV1Ni?=
 =?utf-8?B?S0t6SkhIeHBTQ3RHTGs0N04wdTcwMHFQRGc0cXZ3UmYrN2hJVXN5NVFud2N5?=
 =?utf-8?B?TStMZmxXSmw1YmMxV2RiL3Q1MUR2eSs4N2pNMEFjb3E0YUVHMlQ5MEZJblM3?=
 =?utf-8?B?ZmtnZVN6aW9LaG1nYVV5MTQ3MDM2bXF4aXhjdDBueTJIWUZoVkl2bjQ4OUxi?=
 =?utf-8?B?ejhvbHcrY0lISVNEZ0xvUkRWdlFERitjR2dldU91dTNaSkh2RTU1K3JnLzhM?=
 =?utf-8?B?VElLV0VJczRiMnN2RFpaVk5HcEV1NVJsWldhb1NtR1JVOGxQLzN3NVVOZUx2?=
 =?utf-8?B?SWc4UmZ1UGFUT2I1RzNZWFN0T1d5U2VCUHQrbHpMR1k3aTg5TlNaVmhRS0xP?=
 =?utf-8?B?RXh0RkU0dnVGa1BEUXZQa3hSdERlMHprNGgrYXBla1ArRkU2bVUra0puQUlE?=
 =?utf-8?B?QjcyY1Y5TEN4T1pPR0d6WEcrQzJoc0tyU0VSdDF6VVh1aUFtSGJsazZiNmg5?=
 =?utf-8?B?MlA3RkRTTERhcC9mbWtYWFB1cDVLZzB5aS9IMzlQV0dCMUtZcndLUjA1MXo4?=
 =?utf-8?B?eWVDbTJuNTVBdWE4ZTBidk81WmxJMFBXMy9ST0RjWVhRUVBEM0Y0OTBPdVJL?=
 =?utf-8?B?bkg4UmtENGZuTzkxVmVia2pSRGExZEtpYUtpTHA0bmU1UjZGeTdIWStkbEZX?=
 =?utf-8?B?bmVjSXZDYjc3OEZ4RThFMm02L2JwdFQ4SFNEdjV5RGFrTmhmT28rRkpPcFMw?=
 =?utf-8?B?Nk5vVkZ3U1YwREF0cFRwdURjeUFOem5GdWwwNlQxWTdnOWpsQmtRbzVqY0hq?=
 =?utf-8?B?aWhHeVhKRjkrUlBPRFdYYmUxZkM2aXRDeXAxd2FwYzcrb2pDRVNKMnEwZDFs?=
 =?utf-8?B?eWNTQ1U5VDBCdTZyL0dSZU82WXpWSWJldTVGMWM0V3E1NGRDSjJTNFBOaW5l?=
 =?utf-8?B?NTlGem9XQ1Z6MEIxSk5jT0ZVNFVleDZZZ0Z1WWJzaFNlT041L0ppSGFtRHk4?=
 =?utf-8?B?WmsrQTkxT20zTTQvLy9HMFRuZ1BPVXpLYlM0QlpucFVPeXJiZHM1a20xSHdO?=
 =?utf-8?B?L3o5TlJCSzZFbnVsaDJ3azc5VUZpVXhLN0tMNmFUSFc2RnB2bk93TU80aTFJ?=
 =?utf-8?B?WkswZDRRcU5mSGpnU1RzSHdNd1RpajZ4azdkTEh5WXZHUkxkTk80d2pCNldn?=
 =?utf-8?Q?Tbk6wxVbggPsmEEFNbpeQdq9KXfO40OMJpOazzyVj5zlG?=
X-MS-Exchange-AntiSpam-MessageData-1: xVUKKKahlEZ0ag==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822d3799-ea85-46e2-416b-08debf84ea5d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 02:24:32.3623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKqAVzE2mcvlD7eVxauFMnFCJXXNSGk4xhWsnzUCLXt6cW5ZSObkPu9T0IEbtXL/kHVqVLAvzwA71Txkz8gzRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFDDA81179A

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> Hopper and Blackwell need a larger non-WPR heap than the 1 MiB that
> earlier architectures use. Hopper and Blackwell GB10x need 2 MiB, while
> Blackwell GB20x needs 2 MiB + 128 KiB. Because GB10x and GB20x diverge
> here, give each Blackwell family its own framebuffer HAL and select the
> non-WPR heap size per chipset family.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs           |  5 ++-
>  drivers/gpu/nova-core/fb/hal.rs       | 16 +++++++--
>  drivers/gpu/nova-core/fb/hal/gb100.rs |  9 +++--
>  drivers/gpu/nova-core/fb/hal/gb202.rs | 52 +++++++++++++++++++++++++++
>  drivers/gpu/nova-core/fb/hal/gh100.rs | 10 +++++-
>  5 files changed, 84 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index d7a4dc944131..0aaee718c2c3 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -252,9 +252,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_f=
w: &GspFirmware) -> Result<
>          };
> =20
>          let heap =3D {
> -            const HEAP_SIZE: u64 =3D u64::SZ_1M;
> -
> -            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
> +            let heap_size =3D u64::from(hal.non_wpr_heap_size());
> +            FbRange(wpr2.start - heap_size..wpr2.start)
>          };
> =20
>          Ok(Self {
> diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/h=
al.rs
> index e6ac55bba9b9..acb934f9aa9f 100644
> --- a/drivers/gpu/nova-core/fb/hal.rs
> +++ b/drivers/gpu/nova-core/fb/hal.rs
> @@ -1,7 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & =
AFFILIATES. All rights reserved.
> =20
> -use kernel::prelude::*;
> +use kernel::{
> +    prelude::*,
> +    sizes::SizeConstants, //
> +};
> =20
>  use crate::{
>      driver::Bar0,
> @@ -14,6 +17,7 @@
>  mod ga100;
>  mod ga102;
>  mod gb100;
> +mod gb202;
>  mod gh100;
>  mod tu102;
> =20
> @@ -37,6 +41,13 @@ pub(crate) trait FbHal {
> =20
>      /// Returns the FRTS size, in bytes.
>      fn frts_size(&self) -> u64;
> +
> +    /// Returns the non-WPR heap size for this chipset, in bytes.
> +    ///
> +    /// Older architectures use 1 MiB. Hopper and Blackwell override thi=
s.
> +    fn non_wpr_heap_size(&self) -> u32 {
> +        u32::SZ_1M
> +    }

I'm not sure that there is a "default" value here - this carries the
risk that future implementations will forget to implement this method
and get the same value as Turing/Ampere. Could you instead use a
`non_wpr_heap_size_tu102` method that is called by ga100/ga102 as well?
