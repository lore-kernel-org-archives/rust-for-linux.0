Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021093.outbound.protection.outlook.com [52.101.100.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9B936A365;
	Fri, 10 Jul 2026 16:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702315; cv=fail; b=bgs0z7S2VcX37fxGO3zWH4BSLTGp6J1/8vauUIVgvaKHuzVXORBelODc8B0XAYwdxEaf7+9b+kQAPgT47NrpUiaXW1Mk7gmoB+8JEmecdy3Ii2oSCUtGenuB7YrHclwvybAdlGZ9qNB/ye7UH1n0TNQ76jCWvRWcsU6V1WcwgdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702315; c=relaxed/simple;
	bh=3FdnNKzGHU0DidaWO0OveU95fQB80p/iA2ch7m1N+2g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=tHT4kcK5mS899Yw9mH7cc6pEi3jIBy+wJKBjvgyvpKF5ZiUJGnt4sFtZSO4ydaU9B1b+gad5FdVYiyD11WoO4BqickmLW4a1itVhVlfkFqr6ajbH9Tku+Gr6KaDHmhSiz1TdetkOPu4TO3+bUaVb3qLwJcCqIAXC8m4D8zW5OhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GjPVDA2x; arc=fail smtp.client-ip=52.101.100.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GjPVDA2x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfORZG9cTPW+Mde3241BUchvzKnRJHdM4LO3CpZqhDWzTgDBuESbX/Bfet2AfLqpCrvQGQtw+EIF8P9lpn0xnd7MOHKdNxQWdERHNmAIba22rVCPk3UHxNBFZvNEQz8khLKJnWqxSqGLAwjPSwr1K2yDO6nE0GX23KZEw3PyAiyRbx8VLUHXLRnf1uoa58aWTL2FBdlBfFJhZkULDSXC7JjCKzTyO9H5c+q04q68UCcco7jDiJ4IaOoy8vtcG3qgT1Wz24KxE1GknV+4AtJn/CTZvBHeeD6CLw7O+xZGCTgaUv3+OqR7ZSOE4b8TOOPgEm/ypOJK0S4vXoDy+krAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/H2wFGTXdTAfsqiBANbBfoJn3zwyOr81wzaFsJNA+k=;
 b=F9oHyPMVpXnTgUp3F4YKFbY6Ph9isTjAv8+aKIq7ihiU7roVZE97YqS+KL8mIwZHk21IVvLPcMl92GgiZqmLwS8yRac/IchPupWaAhKLBJThCGFQbaYS3De8rAIS7/x6Lu8xu3M9CeRzEBkZFg9zgyhFxQs4//ghVCVAGPGDSHMS+gPknBxrZoMi8EoambIoor/85CAn0585WDa4OiAJCF6SBgUT43PONd1VlY3hSV5lCfcBqKaDMEs7jkuKqBXLIe05HoIkCPgENZYc8p55g0zMdKxjo1R4IwStH4H8UuUYCdG9qnFxJxd3YGPbNr+f+AY3qZFf3DoBR7bLJCJcCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/H2wFGTXdTAfsqiBANbBfoJn3zwyOr81wzaFsJNA+k=;
 b=GjPVDA2xBsgyOcAzEHdln90D8frs/5Ibq9SCJG59JDhRshVTS5dfA+NYep6BduGxv2sXyA/re9CjNIL3p/Mbq8Uy0fnNkAWACnY3AV9hhWwEMFhckDAYLCZgelmBPrLXB0Zld1rJGy9rNDl9vUWyVYFlY1RN0bnD0N/lDSL/pQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7733.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 16:51:50 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 16:51:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 17:51:49 +0100
Message-Id: <DJV1P4UT5VNI.28KAUPWFW6W7F@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] rust_binder: Add dynamic debug logging mask
From: "Gary Guo" <gary@garyguo.net>
To: <jahnavimn@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Christian Brauner"
 <brauner@kernel.org>, "Carlos Llamas" <cmllamas@google.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.21.0
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <20260710-rust_binder_debug_mask-v2-1-2846410e3ae6@google.com>
In-Reply-To: <20260710-rust_binder_debug_mask-v2-1-2846410e3ae6@google.com>
X-ClientProxiedBy: LO4P123CA0654.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 15cf86cb-66c1-4894-a84d-08dedea38999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|10070799003|7416014|376014|22082099003|18002099003|56012099006|6133799003|4143699003|921020|3023799007;
X-Microsoft-Antispam-Message-Info:
	IZpUxoNhjF8urKcVcModemKY3hLm+5sdtP3wQBE6+TEZjqNYhsd59ONREMbXslrzvs9wXcslalIltX1nBC8Hsr+nk3Bz1bcbSqbFpA77swmIKgFhEgoUwSjUvBPlBAXCiPnEfV9OU9KY+PG0Rqs94jxNSxyOa312sD4eS/3a6QkwjdME1gcLbg0DLrOiGUDYMSI1iUOQYYFIm2a41BXuzWcyAFbbZTbXedFIxFoYzsB9B1YKTI3fMsnntkvjo5orjmTy0Ha4BovTXmzDjUL1Z48rJ/dkn2rvcIc9E1mXXNK6vXW6/5s/kOLTqLtzB2o5Z4CbSBxxgyUpkAr+AdCO3gk1RAZOblDzqQwZzyVeP26slaau/hl3vYNiUlnoZFikaAsB3ZQs99Qm8LofVEOXFOj/tcR/Xp6wtzDB/mmAsfgvgE7yGmz2MsjNXYwQZPX1m7oDHc5pr6AoYp9OoYVEM7w7DlKDPW0ReIFmEoFG/dvj2+BBUXsN4D0HDxDRoSDKkO2wk32IbchXqkBNHq78Xe5DHHLNMjR53a+a/UpsLONEzKDBUYHnflpDiXzwFINDiExwtu3f1y5e/LhWZxIaIPcJGHNKnMNG+AfcDYuykEzIvv1PmHcRPlZ9mbqTzUFmjRNPCw/xtcv1v/ndpYRfmptIH+SRp5zDF3fSIu6mtpKaEAnBDhTk7OSOgh67Auk4+68AiCSo1KIlDJX8haDyow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(10070799003)(7416014)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(4143699003)(921020)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFh2K2huSkVMd2JrNzZDbFV6VkpnY0t4VWYxNlBTUkpycmRUZHA4cDdnbEJI?=
 =?utf-8?B?dVFGZ2dZbnRjbFlkYzFVV1lxYkNjODZrMnVhSXRwc09vaERhd2VVd3hpM3NY?=
 =?utf-8?B?TE0xcGVMNHlpQWdOTkNLbHUweElUMHlOd0wyZmRuK3RyY1BYN0FhaCtBUzVv?=
 =?utf-8?B?a25hUFhvRlBxRVVaa1VMVDZmUVIrcCszTzcvdzhGbWtLdk40QW1pV3pjbndG?=
 =?utf-8?B?YmZiRm1HalJVTytnV2V4bTQxTXBPaGZyVmF0Z0FwQ0xSVy9GQlpPWFNINjli?=
 =?utf-8?B?UEZuZTdMVUYxU0sxZ3JNODhNa3FYa3RIWk81VURPclhMWHdMcUZEU3FicnNk?=
 =?utf-8?B?UjdacWQ5bDVwVWlNbWYyczE3SU9qSDZVV3BvSTQzc3RPaXltcHd6TFQ4V0xE?=
 =?utf-8?B?dDFsdXUvczNIcEgra2xIdWZLQlZ5cmdXWU5mTGFXT1ppZU84Tzlqclk4bWw0?=
 =?utf-8?B?eXJqRlh5U1hJUWw3emYrQnBOK2FpckJybGRyNXRnQytrekxIa3Bjcnh5NFFP?=
 =?utf-8?B?TUc0QTN2clRhczlncmZZektFWFF6MlV1YUFha3VxMWRsbEdkUDQ0MU9RWkgv?=
 =?utf-8?B?SkN5ODFWT25RMmpOQTJjd3lPaXN4ZE1CZ0JiSTFPWEZZeUhLWHNZRjZYb3lm?=
 =?utf-8?B?SVVkZ0lWQ1Z3WGZDRE9wdndrZHUyRCs5SGVVeTRqZ2xKZGtWN3VXYzJUeFY4?=
 =?utf-8?B?MWRJKy9QOFJ4SnBlbWFLeXYzYi9seTNNR1d2WDlRU2xtajlaWXhNQ3QvaHp3?=
 =?utf-8?B?TnBPOUx0eDBpRlRWZGpITld0U3o2bHVEVGZka1Z2YlpraFZnK3oyc2I2ZjJl?=
 =?utf-8?B?ZVhVTGRBa1JrRFl4LytPRjJMd0lUaGtWSjRYMnRuZnh0U1ZNVk83ZmNPVzZH?=
 =?utf-8?B?RmVRY2lONzVxalhBeXB2ZWJNMDhRWjZiS3ZXZUFrREpOa0c0VklQc3VsaUNm?=
 =?utf-8?B?RVQzbmZhSW9MRzBRMzlHRkdxZFRRZDFDelV0S3BPb3hBVVNFbm5odkNMY3RN?=
 =?utf-8?B?M2JuaG5VdGR2d3djZ2c4MHlROW9MS0lUU01BdGRlN282Z0doTlhZaHdScitE?=
 =?utf-8?B?dm1OL3pBWkEvczVNdVRidERUOGRaYkZHOXdCeENqLzM5SVIzR2FFeWI5aHZo?=
 =?utf-8?B?K1FXdWo4ZDJVL0MrT1ZpTzduK21XYTArOG1hNmFSM2NWZXVNbGxJTEh6YnJD?=
 =?utf-8?B?U2xPdHhqYzZxZXlJWElrRUo5STFWMGlVNmUxeDZLa1puUUpSS3ZQSUkycHRJ?=
 =?utf-8?B?elZvZ0RvVVVQQ1pzUGhtMXMvNEF3ampuOWtCejFFY3RXU0FkeXI5Ulo0cXdM?=
 =?utf-8?B?ZjBOTjVqZU5JQWdqSXE4NlFJQnppVG9hOW9tZWVqV0c0ZURkSkF1OVRBKzV3?=
 =?utf-8?B?bDVPTzhqMkx5UUk5TU9NcFNRQWRpclN2aXQ2Z1dlemQwQ0VTUGxVOTM3enhH?=
 =?utf-8?B?eHR2NGhMUGhvTWJML052QUo1b2xnMXp0L0t2eW9jRFUxSjRJV2VXNHNrSG1m?=
 =?utf-8?B?ZTFqeHlGTnBZUmFkRDVFQ0ticFdiSTE1SDhYaE9YcitoSGJXTmlDWFB3bkRP?=
 =?utf-8?B?Z3JodTEwa1Yrb1d2YTBQbDU5dnRGTHFycENPVzBndUF4Q01tMkdiZVpVbGdu?=
 =?utf-8?B?b3pOY3J0ZUdjVHBvdTByVCsxQlNuZEV2LzIzZHBlcHlFWEVaUnQrUEFXaXlE?=
 =?utf-8?B?eEthRHlvWTBDN3pObVNybTZsSEVkbldkcDJPcUlpTnR0MGxZQTFPcEU4eEU5?=
 =?utf-8?B?NjdRT0dKdlBmVUJLRW5ibjFveUI2bHJ2YlhWUjMrMHl6NStwUlBtN0JVc3Yz?=
 =?utf-8?B?WDJtWHlUdUNsOSs1NSs1UlR4VmdlMmJ0enU5YVJEdUhJQmtINmpxbnF3RWZo?=
 =?utf-8?B?TmR4NmR6K1ZFVERucWJEN09KdlJKRExMWnBUTWpSQ1JwYTl6UUgrbTRQOGQ3?=
 =?utf-8?B?V1U5a2VTczFKelZNRmxHby9ya3UxbkEzMEhCbXpoQkw3d1dXS2hZUkF0VnNQ?=
 =?utf-8?B?SHo0Um1zSXhvWkhTZDZkdGs5dk9Zb0NNM2NHU0R2Z2x4cmordUg4a2RLY1pC?=
 =?utf-8?B?dlNxK0ZLQVRwVUFRTi92L3hwdms5QWNyR1FMczF6d21td0c2ZjdEaWhvbXVw?=
 =?utf-8?B?V3JZODVuNzlEYmREckVGNmM0NmVkL2xFekJKSm81OUtvWVVBL1V3OVpoYkhH?=
 =?utf-8?B?ZDR1ZUJUY2RtZFdxL00rNjdsV0d1YUIwYkJNdGErbFBHK2JjUkFWYnBpd3B0?=
 =?utf-8?B?c3RlSnFJbUczb0F2RktMbmdZangydjk2aEpEVlRyYVlaK0g1dGNaMzFiaEpn?=
 =?utf-8?B?TjJzbk5MZGhwNVZJQURUbGpPc1plY3lFMHhlRXNvYWxOSm91RUpMdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 15cf86cb-66c1-4894-a84d-08dedea38999
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:51:50.3633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVNpzSXUkHkEXvX+dEIItRNAhRIDjtJezy/4mrDPr3fr+PS1UTX8fk6VgINwP/rq5c4Hl0XLBmyjLXGcPVkHRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7733

On Fri Jul 10, 2026 at 3:32 PM BST, Jahnavi MN via B4 Relay wrote:
> From: Jahnavi MN <jahnavimn@google.com>
>
> Implement a dynamic debug logging mask (`debug_mask`) for the
> `rust_binder` module to allow dynamic runtime configuration of log
> levels. This enables parity with the legacy C driver's debug mask.
>
> Since the Rust `module!` macro in the current kernel build does not yet
> support declaring module parameters directly in Rust, we define the
> `debug_mask` variable in a C companion file to expose it to the kernel
> runtime and import it using FFI with volatile reads.
>
> To verify the setup, instrument process lifecycle events (open, flush,
> and release) in `process.rs` under the new `BINDER_DEBUG_OPEN_CLOSE`
> logging mask. These entry-point events are chosen for initial validation
> because they represent the start of the Binder lifecycle and occur
> at low frequency, allowing simple runtime verification of the dynamic
> toggle without log noise.
>
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> ---
>  drivers/android/binder/debug.rs            | 80 ++++++++++++++++++++++++=
++++++
>  drivers/android/binder/process.rs          |  7 ++-
>  drivers/android/binder/rust_binder_main.rs |  2 +
>  drivers/android/binder/rust_binderfs.c     |  3 ++
>  rust/kernel/task.rs                        |  7 +++
>  5 files changed, 98 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/android/binder/debug.rs b/drivers/android/binder/deb=
ug.rs
> new file mode 100644
> index 000000000000..da48bce3df54
> --- /dev/null
> +++ b/drivers/android/binder/debug.rs
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2026 Google LLC.
> +
> +//! Binder debugging helpers.
> +
> +#![allow(dead_code)]
> +
> +kernel::impl_flags!(
> +    /// Represents multiple debug mask flags.
> +    #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
> +    pub struct DebugMasks(u32);
> +
> +    /// Represents a single debug mask category.
> +    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +    pub enum DebugMask {
> +        UserError =3D 1 << 0,
> +        FailedTransaction =3D 1 << 1,
> +        DeadTransaction =3D 1 << 2,
> +        OpenClose =3D 1 << 3,
> +        DeadBinder =3D 1 << 4,
> +        DeathNotification =3D 1 << 5,
> +        ReadWrite =3D 1 << 6,
> +        UserRefs =3D 1 << 7,
> +        Threads =3D 1 << 8,
> +        Transaction =3D 1 << 9,
> +        TransactionComplete =3D 1 << 10,
> +        FreeBuffer =3D 1 << 11,
> +        InternalRefs =3D 1 << 12,
> +        PriorityCap =3D 1 << 13,
> +        Spinlocks =3D 1 << 14,
> +    }
> +);
> +
> +extern "C" {
> +    // Declared as static mut because the value is mutated dynamically b=
y C sysfs.
> +    static mut rust_binder_debug_mask: u32;
> +}

This should be `Atomic<u32>` so the read_volatile below is avoided.

> +
> +/// Checks if the given debug logging category is enabled in the mask.
> +pub(crate) fn debug_mask_enabled(mask: DebugMask) -> bool {
> +    // SAFETY: `rust_binder_debug_mask` is defined in C and can be mutat=
ed at any time.
> +    // We read it via volatile to ensure we fetch the current value from=
 memory.
> +    let current_mask =3D unsafe { core::ptr::read_volatile(&raw const ru=
st_binder_debug_mask) };
> +    (current_mask & (mask as u32)) !=3D 0
> +}
> +
> +/// Prints a debug log if the specified mask category is enabled.
> +#[macro_export]
> +macro_rules! binder_debug {
> +    // 1. Internal helper rule to do the raw print.

This 1, 2, 3 numbering is very strange.

> +    (raw, $($arg:tt)*) =3D> {
> +        kernel::pr_info!($($arg)*);
> +    };

Why is this needed instead of just calling `pr_info!`?

Best,
Gary

> +
> +    // 2. Rule to explicitly specify a PID (used in kworkers).
> +    (pid=3D$pid:expr, $mask:ident, $($arg:tt)*) =3D> {
> +        if $crate::debug::debug_mask_enabled($crate::debug::DebugMask::$=
mask) {
> +            $crate::binder_debug!(
> +                raw,
> +                "{}: {}\n",
> +                $pid,
> +                kernel::prelude::fmt!($($arg)*)
> +            );
> +        }
> +    };
> +
> +    // 3. Default rule (automatically prepends "PID:TID" of the current =
calling thread).
> +    ($mask:ident, $($arg:tt)*) =3D> {
> +        if $crate::debug::debug_mask_enabled($crate::debug::DebugMask::$=
mask) {
> +            let thread =3D kernel::current!();
> +            $crate::binder_debug!(
> +                raw,
> +                "{}:{} {}\n",
> +                thread.tgid(),
> +                thread.pid(),
> +                kernel::prelude::fmt!($($arg)*)
> +            );
> +        }
> +    };
> +}

