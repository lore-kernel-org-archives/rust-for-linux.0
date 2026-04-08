Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFC72E8B64;
	Wed,  8 Apr 2026 01:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775613166; cv=fail; b=V47EfvnWJqsPM9Z+rwuL2CTkJa3TRd8zcDXOqfbLW3ywBFFNXfIiIxJdzbBjRLaZq6N6bK1s4e9z+N4XfSo6rm+GuGDUsFCY39HpcXj9XRMbTBAPadTMEgEvd1DNt/mRPd5IYRfq2D4A9kDFefC9JLOMGyFZgL8nPphUDFexdwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775613166; c=relaxed/simple;
	bh=MEQN8/MRe9eqA5GaCRT7RkqdsHb5sA8YcuMqBAeDydo=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=QdlTsmJp2Qfd1PXCS85i82Zt4gZ2xSEWYTYODX/hdyTzmJpARppQPmzNjbNBf0k5/4QB/VpuVqw01mEgNQva+GcEKkOgGjE3zzy2vtqS+/XWxxfjicYQbyOYPqaJDTRtJawWyf608tZNB+Or4JYpWPOAaD2hG1hj/vRebxRvX1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rF8jfKoW; arc=fail smtp.client-ip=52.101.52.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rF8jfKoW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIXWQMQ8JDeNCXuYG+i1imsqYxy8wv9sAuLFq75Gfp1RRKAX/TdgP43fUV2cKs9fLFI6BU1Wh+cYcUXwQd6FT2u9J6Wf9bQjJ1+nUioeDJM0e6QWrqaDUszaD2cFBARAD+FdbGHJmK5uXYN4DfZN26GbA9ePDeIlX/m1PXaCtJz5jM2rcBvBmeijBoLqs2VedEKPoLOAK52leAMUeM2sAtoRK69CpVFNR2d4Ts9LvtlMpn5rPE2rQ5FTsUibs1E3n5HB7j4JQXV9vEn3zBHzFeZg7F9aUXGpZ+lA2MJPoBsBfPyGQi1EPAR80gDcdDTBqK/SjYJMA0g8lCjILKjn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l93NhNIy3Ux0lJqfSVVvVJ6PUz2+0yLBt138rBTXAis=;
 b=plRv8uw7DaTFNN3+kj2kvjbU/WbatpmxFTGiDdfOn7QJcz266B0EEzR/yiP1+x4O4x8hWd+UWy8vQ5O6DCBvMJfFxa8vygLna69bLLzZ2mbRyuKL86xkauEqNyK3vFSVG844CiKXBKvIFRq21MseEQg8646MTPzecgvDPW3H0yC5J5I38i22jdrbJt0g3oUNkai05/kF7qLormMGjisVIR8nqqOPQp/hqk5+5Bl1JW3Wjc1oYEmn/6PNqGMtGpQ83dE4u/Q97L4ToC6rDbyAk8XTBINMGaxsxUhVThA3f4EWtV9vwUBSf2rh+bBdejplOkXlmurF4BVBLft8scBtjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l93NhNIy3Ux0lJqfSVVvVJ6PUz2+0yLBt138rBTXAis=;
 b=rF8jfKoWHL755D6oeyK4Zf7DAVUUW66QOrhtcTJ1EkUlxVmJl3QodG/2xr/1KJ+NJ1yg1MwTSSgv9JvZnuE629Q8UVTYMgXm+RsfOYgG1ZJ6vudMzW/1IMqEQ/LAwkVSjKJ1v+x3YTrl5OqbzvLtMLWYIPVHptuTy3+bgkf3Wwji/5iUMxAe/uH1q3CiTYRKJ+OwiRI6ij/JfkIMdlKTpIDZUcNxMAoqfdNtaiFOEYo7jzd9Gp76tRs+7bs+dL7tTZ/XUINHuQw9gYm4yMm4p7TVke0BkSjbDzYnGPzQt46mvTJut+1ikt4hTerXekxkiVXqkHtDhSnZd0bHBydmsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB6676.namprd12.prod.outlook.com (2603:10b6:510:1c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 01:52:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 01:52:37 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 10:52:33 +0900
Message-Id: <DHNEBXMYZQH1.G10QHOA6EH5R@nvidia.com>
Subject: Re: [PATCH v9 19/31] gpu: nova-core: Hopper/Blackwell: add FSP
 secure boot completion waiting
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
Content-Transfer-Encoding: quoted-printable
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-20-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-20-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0016.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: b9deaa24-d996-4a17-114c-08de9511822f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2VZeapoB6IgfgFWFFjQ4gm2MaehT0kXDgLNyh0vyTLrENqHLfiPQdKFdI1kmeJ7KwznRLmr8tCrD2CqQVnNe/fc/+gptLe0hI+R7TzNnvBtpRDt5zV+BYT0bk2KFLtVpVjQj+tlKA0zPo1tuSAIOW81CuChIcL0VIE8FkWUuAIgMYjOf4JQdA/7fgmR6hFfBiA2K0IWTA1x8+SaA9Edtz7E5BQYUemiMlwnI85tZFJV7l20cBcIGwURjRITRR+b3xhIrk/QuM7qiALuSpYZcm4Ec7PwjzBUOg4+YOyj6u35rNsIKvtDjS0vdcevL7IHFP3vZwcHffcjn5Yl2egvlmWpZTwdsE5PqxAwGTZm7QGARAIa/wAgyub99sOTqqSQGRUhwnXygbomvWHP0+ywOKoe3GoVo9u1lPPtCwCR/Hu6irJl5nXfsRKPAA8RCiSBbHlhwkF6Hu3Fn3p9LOxsCKZIiZd00SoEss40hytfENeIj70pWtnMKVs1EnCkK5pBnIsCZiR9p+MYEuDXrp1i17jdr9xzcIUKTEStG1Wz8IFh8PdabJTaSDCatfNc7wGqQgq2d6QreaFJiKF11eZENcEiyPdWYkoX7glSSqScyGp06jTxbpeQAWa3yymclvZaBqgLnnI90mLktV97PEl8xEhYHkyjDCZ5UgQNDn5MMSaHIH+f+pnAk1Edj1vahkzGXqEg8/b8XVZIpkt6iDYMYTTlD2SIjQMUQfcr+i+EI1W0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnZqeEtpd0l4MitQZHhsYVNUMWhqZmU2VWtNQXVJS2t0d0h2TXJMNXRPY0dT?=
 =?utf-8?B?dVNHU3V3bnd5WnkzUUtzQkthNmh3cGJmSUpiT0c2YVF6OXh2V2pNZ21OczZB?=
 =?utf-8?B?RDV1azJHSktrOEpGSVZ3RGszUEFGZXBKU2ZMTjFqSnNndWxmVkFhUWU3OFlp?=
 =?utf-8?B?MU9iNUJNcS8xYXRuTklQY08yenA1NWFHYUI2TXYzd1dsZzZvYnJEdFkzUTFD?=
 =?utf-8?B?VkVFS2JVSllkd1MrY09nMjBwaE5zWlFJemIyUTZoV1pWME9Zb2p3WW5iODU1?=
 =?utf-8?B?Nzh5SlZLeHZsWTBleWowTHVXK2tTTkIwcm1kSXQ5WG9JdG1YUmMvNk5oT3BC?=
 =?utf-8?B?cGlKOGxYSEpGQmpzdzZHdHpUMzRRMFdSdm1mdU1rREF2NGJYaW13RFdrbnJ1?=
 =?utf-8?B?UFpIVVNMMzc0dldmR29VUXpZZE1JL3Z2MjV3cGNGVkFGbXM5TDNXNWp1aSs4?=
 =?utf-8?B?WkJ6MURuVEZtak56S0h5OHZSaDVrRUdOSVhJcm1yUUxMakFBWk81R25WVWQx?=
 =?utf-8?B?VDJQN0s0YXB3V1QyV3pCMWt5Q085cUpWQThOSFRCQk53eGExNTU1T3loSWlr?=
 =?utf-8?B?NUxPVnF0S3V5VmlvRzJOYWQ5b3hRQm9Pc1RMR1FybFpub0ZpaStweXY5TFR1?=
 =?utf-8?B?a0hSclpSRjYrL3I5Rm1TVTh2WWR4QWpnV2RrZ0VpQkdWRHFmZTVNNzk4dUlt?=
 =?utf-8?B?T08ySldNOU5jbGxVbjN3OUtEdVpQRjFZM0dJQVhrOGZ1ajJ6NUU3a0J3VUVW?=
 =?utf-8?B?RVlRaXUrenc3SXF3bC9UTEx6d1B2MHZUd2dsMkhyR0tuR2N4VisrWk1OUStF?=
 =?utf-8?B?OWd3cE14OEkyQUJjLzFGcGpueEtYWG1NTy9qTGJxWlFRMFMyN0gycDBKQkFX?=
 =?utf-8?B?ZDdkS1lkNUpnWmZKeCtDeCtBdVJMOGF5L0ZDeHhJSzRRKzkrMEliY3dpUnJ6?=
 =?utf-8?B?Qnh1dnBtWm1sNENRVlN3VHR4WE9HRnlNblpNb1hFdzRubzZCMHFWV2NJZStZ?=
 =?utf-8?B?a2gwVmJNQ0p1Rk9DM1NMd0FpWS9iTWh4UUpJQ3pDWTFNbS91RHE5dWgzaVhz?=
 =?utf-8?B?RkMwQVBpUWNydmV6aTlBYm1udG9MRW5QMjVsUnZRUjVFaTRzejdVNDFMeDEw?=
 =?utf-8?B?SVozZ2dqV29VMFJhVjdTVzJHRVprdC9PazVObWloRTl2UXdGVUlpL2RlTHRM?=
 =?utf-8?B?ekl6SmJYWHpGcklaemdnL09PUVcxUEZvUWJQTDlNSEU0Q0diSFpKWVZoMndm?=
 =?utf-8?B?VUIwV1VWdFNmdXFsLytZUmkzZW11TlE4WnE4QTN5Q0U1ejhDWVFIVmsxZzBS?=
 =?utf-8?B?QVM2V2JYVGcwZXhLbmxWcmdoYkFTZ0kwbnlMQ25sZ3MrR3lXaTJjL0xYVEtY?=
 =?utf-8?B?WlQ4cncyZ3dKZHdkaWw4akRIVjMxL3k1TGcrc2JCY0VTT1RYTXNwOTI1YnJC?=
 =?utf-8?B?L1NvL0Z1U25lVXdneldDbTIrWTNua2kzdmx3eWw3Z1EzNlhyWlliRDcrMnJQ?=
 =?utf-8?B?MTNiaUpQM0Nra0VJbXFUTUlpaFc4YkI2QUwvaVZLd25BTU04NVNxYUFFRU5u?=
 =?utf-8?B?MWhSUzk2eFRCNjFSaWxTSlYzenpGcnRMODJiYnRqbzhkcW5EdTdZcHMwQXN6?=
 =?utf-8?B?UzdXdDIxajM4WWoxdFF0dWhpT1p6TEdHMk5lMWRsNXVhL3l3bHk2YTVtSTls?=
 =?utf-8?B?RHhLNEFlRmZvR3VNeENObnl3dlpvQ1h0Zm5CRUx4NkRmQWpzRHd3aXczZjZo?=
 =?utf-8?B?NEs1MnhrRUtCeEt6N0g0TmE3VWx0ZVdxQmlpOW1iZUw4R0JzNlN2aHBSblpF?=
 =?utf-8?B?T3o1cW9zcmtUdWlWVVJnaDNzSE56RjVmazdTYnc3L09QWUVmd0YzZ0RsN0My?=
 =?utf-8?B?QThsUXhLWG9VOVdHY0dXZ3FjeFF6SDdXT1loYXFKNVozTXUvQ0g0NWpuRUNZ?=
 =?utf-8?B?QTFZa3VQOG1ueGhMd2JEZ1BjMDFyREVScElkSERJQUtQRmNXS3hiVGFuQ2pj?=
 =?utf-8?B?T2JWL1dtVGY3T3RpSGk3TVhWdEh0RVFIS2V1TlhLelJYclJBMkJ0bFlxcnFv?=
 =?utf-8?B?eS9mRllsaDBUV0hoOFZWaE41NFdJcng1eVUwTEJjTFQranl0aElmKzh3Vmgz?=
 =?utf-8?B?bW5Yd3hNQSs5Y2YwQWFVNHl0Mjd4RlpRRUZUVUhvdXJSczE0MlAyajNXdFpK?=
 =?utf-8?B?djQ1bW5zOEE5K004c0ZUK1Q3Z3BaVkwyMmtZZ1UvZW1lSmw4aW5IYTA4aExX?=
 =?utf-8?B?eVYzSWlOUFRyNE1xRG1CbW1KaDVUZ2Y1TnorNFNUTyszbkFzVVU4czd3TG1X?=
 =?utf-8?B?MGM4Nzh2UkNsQ1VZb2dsU0xTckE3ak5iR3M4SGRyUS9YRmhGK24zUjBjQkND?=
 =?utf-8?Q?RDCks9Zouxq/isHiEaVj/FuAVlTyWXvaMm9BQo8MWXVtN?=
X-MS-Exchange-AntiSpam-MessageData-1: CfaTJBEVOYeDqw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9deaa24-d996-4a17-114c-08de9511822f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 01:52:36.9379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxfSXzHIVc5h6GrGnl0ihTDMkn79x+kBZkYAP4nXgD0apGqvWqUnlOZQQBzspE2Rzv7XxQsiArnaQ8prgOaRMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6676

On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
> Add the FSP (Firmware System Processor) module for Hopper/Blackwell GPUs.
> These architectures use a simplified firmware boot sequence:
>
>     FMC --> FSP --> GSP, with no SEC2 involvement.
>
> This commit adds the ability to wait for FSP secure boot completion by
> polling the I2CS thermal scratch register until FSP signals success.

This does more than just the boot completion waiting (which is just the
`wait_secure_boot` method) - it looks like most of the content of
`fsp.rs` should be moved to different patches.

>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fsp.rs       | 148 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |   1 +
>  drivers/gpu/nova-core/regs.rs      |  29 ++++++
>  3 files changed, 178 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/fsp.rs
>
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> new file mode 100644
> index 000000000000..6d32e03d89f9
> --- /dev/null
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
> +//!
> +//! Hopper/Blackwell use a simplified firmware boot sequence: FMC --> FS=
P --> GSP.
> +//! Unlike Turing/Ampere/Ada, there is NO SEC2 (Security Engine 2) usage=
.
> +//! FSP handles secure boot directly using FMC firmware + Chain of Trust=
.
> +
> +use kernel::{
> +    device,
> +    io::poll::read_poll_timeout,
> +    prelude::*,
> +    time::Delta,
> +    transmute::{
> +        AsBytes,
> +        FromBytes, //
> +    },
> +};
> +
> +use crate::regs;
> +
> +/// FSP secure boot completion timeout in milliseconds.
> +///
> +/// GB20x requires a longer timeout than Hopper/GB10x.
> +const fn fsp_secure_boot_timeout_ms(arch: crate::gpu::Architecture) -> i=
64 {
> +    match arch {
> +        crate::gpu::Architecture::BlackwellGB20x =3D> 5000,
> +        _ =3D> 4000,
> +    }
> +}

Since this is a timeout, how about harmonizing to 5000 for everyone and
turning this into a constant? Waiting 1 more second in case of a boot
failure should be acceptable. :)

