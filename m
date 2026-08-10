Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010025.outbound.protection.outlook.com [52.101.85.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C3F137750;
	Mon, 10 Aug 2026 03:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786331193; cv=fail; b=g0sUJzXg2APltpzab8p/MPiUMNy1UY1DKTyGnoCJvwwjeMAZMDIna2QMExWuHJYcEtSO8kLCFhIIDnwCsVlSEQbcBpCMX05Y8w5FpwjTF9KqkpObMRWX80ePJire2R84V7QPpY7VXFYVXX66NaoMyh8WSQOIN11RhYkLXN4LAY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786331193; c=relaxed/simple;
	bh=XAFInXgW7aLhKhp27o1U/x49DmNpHGC3xMBNk6aFRms=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=IwXJOQ84RtcTGuJji4WrOy7bKVMrTfeBg93YkSLyd+f4clwlL3BlnGK7ab+s20ocMHXIGCKFI7S6qPY66BMGUljq5B5vVvsWPkuMyu6d+KiHkuFC5V6N05HmctQu7VFL0uCAiA12bfQb7DMYifKRJ+zTUy2R3iRuefJ6wDozkrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PPKA9kEe; arc=fail smtp.client-ip=52.101.85.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PPKA9kEe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZVFmU+bIrecOgRx0RQunU8A40V1CwBliZ2CnXwV57wz/gagmpLfLzON/gd5WbLyh4V0ZuxMhdlrdAnzSxIRk2D7tBWHVcRKOGiYkEv7If3FAjHJs/KXQTOPe8Llj2Z8VodEMRSsIeXPSCTrev0+0xNlX+hpI+nmCxH5lSAH/r/F8Tro65NB0TeXWMPL7GbpopbXILmOMoAxBDul5vnfluZ96VQccMibLjYkEANZRMCBpNTxq5qsVfA6jvTsyWZ//lXFMZXsejdTNnLXGmGDcaNWVZbcTBz4EsHbrfVbNVEkii/t2BkjDyzpeRgdf/qzS2Wut8QdgEfqnXk5LuAuKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99nv7XVhiXJ8YdTrUaxl0VM8TZW63LydmRUnBJxElXU=;
 b=q6MSZtSeLuRoqq/s2stGluAE5ZWjyT4JVYNt4nAtreNkgZostBjGyIQwGOflBZFY+VPjfjT/tsAMfWDfRxOscJ/8A+KzGNBO9S9hAioWc/vcyln5re5XKjXtuWe6YNtVWMFU8VTVa26jQ8eedK/c0nqVfVXa0DEXnj9jsboKNS22WUOw0yetJDyd8NWbf3FWFV30zbiE9cOYReEHCoUs4x6nm6nbBk21zEJOYqGkdWrVQoM8pYw1v8tp/SnX09+fAmOtILxnrcWpGZpHN31ESV2dIC5SDjyjSxYyMkV4xlxSfBRbGQNjlb8PfpyX8VCko6Y0AhDvcPqRaSI5lhBMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99nv7XVhiXJ8YdTrUaxl0VM8TZW63LydmRUnBJxElXU=;
 b=PPKA9kEe18mIKnLnOpjf9GeoGZZg8W2GvUSY394XzjDLBc63bisAkUGWYKpxq3X5YQN251i0snt2omvWZdxxzjCBpKrBb8bOh9Pmtsy/rpjmH/VYTcD7Ura7YEnGT+kWcQ/8O4AikxRCAx0FxkGc2oIfBkAGiLKTB+Iey9z52gRZkn5n7jZdVwCRu9dFCpQL6u+ccOGcZRudUs5qcb5S6E8H5p2Zo2CC02UoMjaDOeUfhjROE97HexRhSl/9ghIv12b+JTchrgIEYI+2UxPxKFT9q5J6HEZnpwim2ZvoOjyZS5JEnK6ksQua55qHrbfIPPi5nHfWMlKH/M4kee1Nbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB8082.namprd12.prod.outlook.com (2603:10b6:8:e6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 03:06:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 03:06:24 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Aug 2026 12:06:20 +0900
Message-Id: <DKKXJZKWXK3C.2VYGL7X8UAXBJ@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dakr@kernel.org>, <jgg@nvidia.com>, <dave.jiang@intel.com>,
 <saeedm@nvidia.com>, <jic23@kernel.org>, <gary@garyguo.net>,
 <joelagnelf@nvidia.com>, <aliceryhl@google.com>, <kwilczynski@kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
 <jhubbard@nvidia.com>, <zhiwang@kernel.org>, <daniel.almeida@collabora.com>
Subject: Re: [PATCH v7 1/1] rust: introduce abstractions for fwctl
Content-Transfer-Encoding: quoted-printable
References: <20260708155951.699564-1-zhiw@nvidia.com>
 <20260708155951.699564-2-zhiw@nvidia.com>
In-Reply-To: <20260708155951.699564-2-zhiw@nvidia.com>
X-ClientProxiedBy: TYCP286CA0118.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: e8bab7ac-c798-47bf-5d09-08def68c5c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|23010399003|18002099003|22082099003|56012099006|10067099003|3023799007|11063799006|5023799004|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	nPx16Ktc6VojYbnh7JYUAk9sE3PlCkDMtQike09rh8Fk/Zmlng4iN2GYNdO3xS3FcnvAMYdJ3VuZaBgBA6whaCVWG8MphhVgkMNCY9gNyv7PxqoecYy8o4Fx3YrWvjjE4yCw2LvYZj5PqK3Jyyo1sv/BdWVMhwKSTiwbRG+QZMyyvkxURftyCUmmZj/bF8Mv7s42RyIXiVlnw+kEfN6WUmnFjsW1cCLEJIMOA7eSzLhqwgPZftuH75P3/gO38GV5GazQrRzcvU5mADpuJuEMduW0fnRhWA1vspsf/ldY6U5hRDg2q2z6+oy+25GCjUeuaZ680oZr8meCp2pd1nWRBdjdCxdnXuvfQAY0b4mKsM0O2J6aNgXwaBlqUDinKGEkBQb+jUHr1N8Wowlqr/qNsyXSUT2CkUS7xc3VEE5Fi4/RkRo+ijSC8X5lBDyRtbqrEpZMyuBQXwbUwsJKpxcV1eCWUlR+988W2+tLACd8DS0hMm/OKpd9EVOJzhLIg1NC68KMHsWp7lzs7x67lZW1hzE5t3/7FeIL2dMaPJ2VUKGsON65YBBvcJ2sx+uhBu+N6OuwtJ/lQ7CyBKNxjyw0RmLZDCJPZLGZq1ZRG+Dck1odTb49mz5npjKAtZIXNQe9y5Zjqqp1LsYZpIHImfA/MGJ3W+w3IR95WKa9/aJhiic=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003)(3023799007)(11063799006)(5023799004)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVliam5sL3NMOUJwUE9BUDNwdlF0eU9CU2pTclpzT0xxNXo4bUcvUW91eDNC?=
 =?utf-8?B?MGwvUjBkQmkrKzhqT1E2MitaaVBTK3ByODJ4aTA4RDZnZHZKeDNMOHZSNWFq?=
 =?utf-8?B?TEN0d05remZhYzVacXdNZ3JwVWMvaWxXbzlaNGQzVjIwYVJVZ052MzBMUFVZ?=
 =?utf-8?B?RVlxQ3NEVFFsTW0veTJGNmxoamZpUS9QSGh2OHpzWFBRMmZtVkJCeTFJaWlQ?=
 =?utf-8?B?a2VzWjE1R2hDSGFDSzMwNnpLbmZoZ3RHbUxLdmFjaTcvVnlKdjU5bnY5ZWtq?=
 =?utf-8?B?Snc0dFpqSWt5NmNQN2xNZFVFeWwwZStWUUR6S2lYR3J5c0lybEd2ZUlNeDls?=
 =?utf-8?B?Q2tuVjl3Y2NkKzB0ajk4ay96aUhEcFduekhpeDdUQWwxaGIyTi83a3ZXUUYv?=
 =?utf-8?B?NTlkc0tGZVIwNUhwaDUwcWxudGM5MGFpa1ZKNlV3c0x2RzA4bFFFTjJXUGlz?=
 =?utf-8?B?dGRpWjRTeExzaVhUdUJQVnk4QjY5RERxZFg4ZlgzMHZGNDI3Mm1xbWZ3WmlJ?=
 =?utf-8?B?dWlsdXNvTFQwcWdxaHNydXdnbURyalhRaGNnNnNvTU83QVNXYVVhdm1COEVj?=
 =?utf-8?B?UkU0TTNGUEl1QTFNOVVpMzEvUEg4eXcySmtKTUVRdFZXdWUvNVZZWHVDYUtJ?=
 =?utf-8?B?MVYybjhIL3A1V042bDBkVnpadlpITFB1UlUxWTdlcitVSjU2QXd0K1lKOGtC?=
 =?utf-8?B?eVkwTm51S1YzYzlUSVFPU24zN1g4SE45RzdBRUNialUySnExYlVqTU1tbHNJ?=
 =?utf-8?B?QTV1YjFyNmVadjNtVVZUUFFsdG5wRlA0bzY5NDlsaHY2NkErWW5EanAyajRX?=
 =?utf-8?B?KzVDUUU0NUo2bjdidmFXU0N1VTBmOHM4Qm1GVlg3YWt6WFpWTFE4eDhNQjJN?=
 =?utf-8?B?Q29xd0ZIU2lUam1xSWFRTHNDMENNbFF2bXQwVFRXc1N4MzNiU3FRaEdWdGh5?=
 =?utf-8?B?S0hSYWV2OEk3ZFluYXRrcTFwek9hZ2tFTXB2QjFwSnluY3huNG9KSkhuZXU3?=
 =?utf-8?B?Z2NzeEFjbUZVVXMvRzBWekNGTDMxOGlNTDFiRXFjUFR1Z0Exa0c0a1BXb09p?=
 =?utf-8?B?bXFBYXgzK1d0cks5aGlwdjJRYWNMbWcxUW5lclVrc1FQejhRUzQ5RUg0enU0?=
 =?utf-8?B?WDRsdUs4TWNiMTEzYTJlWXdUNEJwa2pRZUJpYTh0M2gyMlhzME1OU01jN1NM?=
 =?utf-8?B?ZUlpSkxtbU9nSnl6UEJDZlQ1UFh2VDRyZm1MdkJmcGpmc0FTc3JGdTVVRkxM?=
 =?utf-8?B?aCtwMzdIQk84aE5tR0xRSjcwRVA3QmFZdFh3djlYdVJNUW84UnltTnZWbzZ0?=
 =?utf-8?B?cVhNd2wzRVhqZGQ5YmRTYmQrODFuWkNkQTRleGI0dnRDQm1WemtyQi80Myt4?=
 =?utf-8?B?QTl6R3FLTWtqY2hXN09QUDIrNDV6dGpNQnNyZGs2TGlhWFpsdWdReGxEMGlk?=
 =?utf-8?B?TldVMGcwcThmd1BDUENRSkJEOWNaMkcvNzFKSG5WNUs5LzRHbGU0Y0EyeEFL?=
 =?utf-8?B?MlNvSEt6KzM0a05WcmJHQzI2ZENXQ0cvQk5jcnBrcUE3MkcxdUhpZzduSDRi?=
 =?utf-8?B?dnhpaldzZFNZWStwNHM5L0RXWGNCOXlYQnJyOUJtblVPTGpLd2xnUDNXdHRB?=
 =?utf-8?B?Y0wxcWoxZWNyU0VPcFZHM25JR3JKaTdTQVpXV1o4b3RuSHlZSnRqQVJKOHBy?=
 =?utf-8?B?Y0dSWHgvS0ZEOFRXMkVnR05YWldKSDVLdExLMlNrRDRnbzNpdEU2S1NJamts?=
 =?utf-8?B?M3ZrcFFPMFdvU2xnL09VbFQ2YnkwS2NqNytiMDVJWTNRUEF0bExXalloQmVi?=
 =?utf-8?B?SjN0MUdVQ1QrZ09lWWpQN2prSGMxdWhyZTBBZFlKUitINENsV25xN1gxOVQ0?=
 =?utf-8?B?Z09GM0gxUmY3dXg1djAxbGVWNVVKbGtpalYzUFA1TFBJdWY0bnYybmc5Y0d3?=
 =?utf-8?B?SE1Rc3Ara3pYUC9JN3VnMDQzZXVmd2o5ekVoVmdKcUxTbW5GRDJ1cXVEbHBn?=
 =?utf-8?B?dlU2bTE3dUU3cGlCT1lweE0xcFA4OUlqT2ZjZDF6K09rVWdNVm51VEZndXhi?=
 =?utf-8?B?OTl4YTQxeW55NkphbGxScVdjZGhCajhoMTVyQzlrclpvYUFHVVVVMlpLZmR3?=
 =?utf-8?B?c3JqQThzKzdKTTk2VUxKdWdwM2RKQWY4aFNVL1AreC9RWnVDVXdnZmpvU2Zo?=
 =?utf-8?B?NzZrRU5EYU94bnZDWnZzUVA1a0l3MlpmUEdvaUh6aUlOdUVTblQ2R1RtdDRJ?=
 =?utf-8?B?Q2JGTFVOSFFScjRINFdDaDdmMzE0bzR5TmRMNmtFclAzZUZCbTVMRmMvMHly?=
 =?utf-8?B?Um90Rk1kem5BVUhIR20rcjJkcG9CSUtaTzlCck51WkJXT0FYZitRc1BFSGc2?=
 =?utf-8?Q?T0lIVOGbuVED7bEinKR3/hTmNUu95hpmHuFFemCW2oMib?=
X-MS-Exchange-AntiSpam-MessageData-1: eNqkPkpF1MSxIw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bab7ac-c798-47bf-5d09-08def68c5c65
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 03:06:24.2955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PK79szhoJgp8Y0sqN0/6vG6rtvzGZbRe8gr6OiBOt6ouKc6kMn0ywZQRAK0bPj5k1RbmfSDJ/W/SOpB0DedRPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8082

On Thu Jul 9, 2026 at 12:59 AM JST, Zhi Wang wrote:
> Introduce safe Rust wrappers around struct fwctl_device and
> struct fwctl_uctx. This lets Rust drivers register fwctl devices and
> implement firmware RPC callbacks through a typed trait interface.
>
> The abstraction keeps lifetime and reference-count handling inside the
> wrapper, exposes pinned per-FD user contexts to drivers, and validates th=
e
> layout assumptions required by the C fwctl allocation model. Allocation
> sizes are padded so the kmalloc-backed C allocations also satisfy Rust
> alignment requirements.
>
> Registration owns driver private data with a lifetime tied to the bound
> parent device and verifies the parent identity before registration.
> Callbacks access that data through a higher-ranked closure, preventing it=
s
> erased lifetime from escaping, while Device remains only the refcounted
> fwctl object. This avoids requiring Rust drop glue from the fwctl_device
> release path after unregister or module teardown.
>
> RPC callbacks receive typed scope information, a mutable request/response
> buffer, and the userspace output-buffer size. Response pointer conversion=
,
> length validation, and raw output-length handling remain inside the
> abstraction.
>
> Add the Rust sources to the FWCTL MAINTAINERS entry.

I'd say this is in very good shape. A few consistency comments below,
but I think this is seriously converging.

>
> Co-developed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Link: https://lore.kernel.org/r/DJJW7X4ESDSM.QCVYK2FC7ZR3@kernel.org
> Link: https://lore.kernel.org/r/20260629150156.3169384-2-zhiw@nvidia.com

Why this link to v6?

<...>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 998e31052e66..b7d9512da9a6 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -62,10 +62,11 @@
>  #include "drm.c"
>  #include "drm_gpuvm.c"
>  #include "err.c"
> -#include "irq.c"
>  #include "fs.c"
> +#include "fwctl.c"
>  #include "gpu.c"
>  #include "io.c"
> +#include "irq.c"
>  #include "jump_label.c"
>  #include "kunit.c"
>  #include "list.c"
> diff --git a/rust/kernel/fwctl.rs b/rust/kernel/fwctl.rs
> new file mode 100644
> index 000000000000..410f87b57b07
> --- /dev/null
> +++ b/rust/kernel/fwctl.rs
> @@ -0,0 +1,578 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +//! Abstractions for the fwctl subsystem.
> +//!
> +//! C header: `include/linux/fwctl.h`
> +
> +use crate::{
> +    bindings,
> +    container_of,
> +    device,
> +    prelude::*,
> +    sync::aref::{
> +        ARef,
> +        AlwaysRefCounted, //
> +    },
> +    types::Opaque, //
> +};
> +use core::{
> +    alloc::Layout,
> +    cell::UnsafeCell,
> +    marker::PhantomData,
> +    ptr::NonNull,
> +    slice, //
> +};
> +
> +/// Returns a kmalloc-compatible allocation size for `T`.
> +const fn kmalloc_aligned_size<T>() -> usize {
> +    Layout::new::<T>().pad_to_align().size()
> +}
> +
> +/// Represents a fwctl device type.
> +///
> +/// Corresponds to the C `enum fwctl_device_type`. All non-error UAPI va=
lues are represented so
> +/// Rust drivers can select a device type without passing an untyped int=
eger, while
> +/// `FWCTL_DEVICE_TYPE_ERROR` remains unrepresentable.
> +#[repr(u32)]
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum DeviceType {
> +    /// Mellanox ConnectX (mlx5) device.
> +    Mlx5 =3D bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_MLX5,
> +    /// CXL (Compute Express Link) device.
> +    Cxl =3D bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_CXL,
> +    /// AMD/Pensando PDS device.
> +    Pds =3D bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_PDS,
> +    /// Broadcom NetXtreme (bnxt) device.
> +    Bnxt =3D bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_BNXT,
> +}
> +
> +impl From<DeviceType> for u32 {
> +    fn from(device_type: DeviceType) -> Self {
> +        device_type as u32
> +    }
> +}
> +
> +/// Scope of access for an RPC request.
> +///
> +/// Corresponds to the C `enum fwctl_rpc_scope`.
> +#[repr(u32)]
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum RpcScope {
> +    /// Read/write access to device configuration.
> +    Configuration =3D bindings::fwctl_rpc_scope_FWCTL_RPC_CONFIGURATION,
> +    /// Read-only access to debug information.
> +    DebugReadOnly =3D bindings::fwctl_rpc_scope_FWCTL_RPC_DEBUG_READ_ONL=
Y,
> +    /// Write access to lockdown-compatible debug information.
> +    DebugWrite =3D bindings::fwctl_rpc_scope_FWCTL_RPC_DEBUG_WRITE,
> +    /// Full read/write access to all debug information (requires `CAP_S=
YS_RAWIO`).
> +    DebugWriteFull =3D bindings::fwctl_rpc_scope_FWCTL_RPC_DEBUG_WRITE_F=
ULL,
> +}

Do we need a `From<RpcScope> for u32`, just as we have one for
`DeviceType`? Either that or we remove `From<DeviceType> for u32` which
is dead code for now AFAICT.

> +
> +impl TryFrom<u32> for RpcScope {
> +    type Error =3D Error;
> +
> +    #[inline]
> +    fn try_from(value: u32) -> Result<Self, Error> {
> +        match value {
> +            v if v =3D=3D Self::Configuration as u32 =3D> Ok(Self::Confi=
guration),
> +            v if v =3D=3D Self::DebugReadOnly as u32 =3D> Ok(Self::Debug=
ReadOnly),
> +            v if v =3D=3D Self::DebugWrite as u32 =3D> Ok(Self::DebugWri=
te),
> +            v if v =3D=3D Self::DebugWriteFull as u32 =3D> Ok(Self::Debu=
gWriteFull),
> +            _ =3D> Err(EINVAL),
> +        }
> +    }
> +}
> +
> +/// Response from a [`Operations::fw_rpc`] call.
> +pub enum FwRpcResponse {
> +    /// Reuse the input buffer as the output, with the given output leng=
th.
> +    InPlace(usize),

Maybe also mention that `EINVAL` is returned by the `fw_rpc` callback if
the length is larger than that of the input buffer.

> +    /// Return a newly allocated buffer as the output.
> +    NewBuffer(KVec<u8>),

Looking at the C code, I see that `fwctl_cmd_rpc` allocates the input
buffer using `kvzalloc` and frees the returned buffer using `kvfree`.
Consequently, shouldn't this be a `KVVec`?

> +}
> +
> +/// Trait implemented by each Rust driver that integrates with the fwctl=
 subsystem.
> +///
> +/// The implementing type **is** the per-FD user context: one instance i=
s
> +/// created for each `open()` call and dropped when the FD is closed.
> +///
> +/// Each implementation corresponds to a specific device type and provid=
es the
> +/// vtable used by the core `fwctl` layer to manage per-FD user contexts=
 and
> +/// handle RPC requests.
> +pub trait Operations: Sized + Send + Sync + 'static {
> +    /// Data owned by the [`Registration`] and accessible during callbac=
ks.
> +    ///
> +    /// The lifetime `'a` is tied to the [`Registration`] scope (which l=
ives within the parent bus
> +    /// device binding scope). Drivers use it to store references to res=
ources bound to this scope,
> +    /// such as PCI BARs or typed bus device references.
> +    type RegistrationData<'a>: Send + Sync + 'a
> +    where
> +        Self: 'a;
> +
> +    /// fwctl device type identifier.
> +    const DEVICE_TYPE: DeviceType;
> +
> +    /// Called when a new user context is opened.
> +    ///
> +    /// Returns a [`PinInit`] initializer for `Self`. The instance is dr=
opped
> +    /// automatically when the FD is closed (after [`close`](Self::close=
)).
> +    fn open<'a>(
> +        device: &Device<Self>,
> +        reg_data: &Self::RegistrationData<'a>,
> +    ) -> impl PinInit<Self, Error>;
> +
> +    /// Called when the user context is closed.
> +    ///
> +    /// The driver may perform additional cleanup here that requires acc=
ess
> +    /// to the owning [`Device`]. `Self` is dropped automatically after =
this
> +    /// returns.
> +    fn close<'a>(
> +        _this: Pin<&mut Self>,
> +        _device: &Device<Self>,
> +        _reg_data: &Self::RegistrationData<'a>,
> +    ) {
> +    }
> +
> +    /// Return device information to userspace.
> +    ///
> +    /// The default implementation returns no device-specific data.
> +    fn info<'a>(
> +        _this: Pin<&Self>,
> +        _device: &Device<Self>,
> +        _reg_data: &Self::RegistrationData<'a>,
> +    ) -> Result<KVec<u8>, Error> {
> +        Ok(KVec::new())
> +    }
> +
> +    /// Handle a userspace RPC request.
> +    ///
> +    /// `max_output_len` is the size of the userspace output buffer. A d=
river may return a larger
> +    /// response to report the required size; the fwctl core copies only=
 the bytes that fit and
> +    /// reports the full response length to userspace.
> +    fn fw_rpc<'a>(
> +        this: Pin<&Self>,
> +        device: &Device<Self>,
> +        reg_data: &Self::RegistrationData<'a>,
> +        scope: RpcScope,
> +        rpc_buf: &mut [u8],
> +        max_output_len: usize,
> +    ) -> Result<FwRpcResponse, Error>;
> +}
> +
> +/// A fwctl device.
> +///
> +/// `#[repr(C)]` with the `fwctl_device` at offset 0, matching the C `fw=
ctl_alloc_device()` layout
> +/// convention. Contains a pointer to the [`Registration`]'s data, set a=
t registration time and
> +/// cleared on unregistration.
> +///
> +/// # Invariants
> +///
> +/// - `dev` is embedded at offset 0 and is initialised by fwctl.
> +/// - The fwctl refcount owns the allocation lifetime.
> +/// - `registration_data` is either `NonNull::dangling()` (before regist=
ration / after

nit: missing doclink to `NonNull::dangling`.

> +///   unregistration) or points to valid data owned by the [`Registratio=
n`].
> +#[repr(C)]
> +pub struct Device<T: Operations> {
> +    dev: Opaque<bindings::fwctl_device>,
> +    registration_data: UnsafeCell<NonNull<T::RegistrationData<'static>>>=
,
> +}
> +
> +impl<T: Operations> Device<T> {
> +    /// Allocate a new fwctl device.
> +    ///
> +    /// Returns an [`ARef`] that can be passed to [`Registration::new()`=
]
> +    /// to make the device visible to userspace.
> +    pub fn new(parent: &device::Device<device::Bound>) -> Result<ARef<Se=
lf>> {
> +        const_assert!(
> +            core::mem::offset_of!(Self, dev) =3D=3D 0,
> +            "struct fwctl_device must be at offset 0"
> +        );
> +
> +        let size =3D kmalloc_aligned_size::<Self>();
> +        let ops =3D core::ptr::from_ref::<bindings::fwctl_ops>(&VTable::=
<T>::VTABLE).cast_mut();
> +
> +        // SAFETY: `ops` is static, `parent` is bound, and `size` is pad=
ded so the allocation made
> +        // by `_fwctl_alloc_device` satisfies the size and alignment req=
uired by `Device<T>`.
> +        let raw =3D unsafe { bindings::_fwctl_alloc_device(parent.as_raw=
(), ops, size) };
> +        let this =3D NonNull::new(raw.cast::<Self>()).ok_or(ENOMEM)?;
> +
> +        // INVARIANT: Set `registration_data` to dangling (no registrati=
on yet).
> +        // SAFETY: `this` points to the allocation just returned by fwct=
l.
> +        unsafe {
> +            (&raw mut (*this.as_ptr()).registration_data)
> +                .write(UnsafeCell::new(NonNull::dangling()));
> +        };
> +
> +        // SAFETY: `this` owns the initial reference.
> +        Ok(unsafe { ARef::from_raw(this) })
> +    }
> +
> +    #[inline]
> +    fn as_raw(&self) -> *mut bindings::fwctl_device {

Missing one-line doc.

> +        self.dev.get()
> +    }
> +
> +    /// # Safety

Missing one-line doc before safety block.

> +    ///
> +    /// `ptr` must point to a valid `fwctl_device` embedded in a [`Devic=
e<T>`].
> +    #[inline]
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::fwctl_device) -> &'a Self=
 {
> +        // SAFETY: The caller upholds the offset-0 `Device<T>` invariant=
.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Invokes `f` with the registration data.
> +    ///
> +    /// The higher-ranked callback prevents the erased registration life=
time from escaping and
> +    /// permits registration data that is invariant over its lifetime pa=
rameter.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that the device is registered and that th=
is is called from a fwctl
> +    /// callback protected by `registration_lock`.
> +    #[inline]
> +    unsafe fn with_registration_data<R>(
> +        &self,
> +        f: impl for<'a> FnOnce(&Device<T>, &'a T::RegistrationData<'a>) =
-> R,
> +    ) -> R {
> +        // SAFETY: Caller guarantees the device is registered, so the po=
inter is valid.
> +        // Lifetimes do not affect layout. The higher-ranked callback pr=
events the shortened
> +        // lifetime from escaping or being selected by the caller.
> +        let reg_data =3D unsafe {
> +            (*self.registration_data.get())
> +                .cast::<T::RegistrationData<'_>>()
> +                .as_ref()
> +        };
> +
> +        f(self, reg_data)
> +    }
> +}
> +
> +impl<T: Operations> AsRef<device::Device> for Device<T> {
> +    #[inline]
> +    fn as_ref(&self) -> &device::Device {
> +        // SAFETY: `self` contains a live fwctl_device.
> +        let dev =3D unsafe { &raw mut (*self.as_raw()).dev };
> +        // SAFETY: The embedded device is initialised by fwctl.
> +        unsafe { device::Device::from_raw(dev) }
> +    }
> +}
> +
> +// SAFETY: `fwctl_get` increments the refcount of a valid fwctl_device.
> +// `fwctl_put` decrements it and frees the device when it reaches zero.
> +unsafe impl<T: Operations> AlwaysRefCounted for Device<T> {
> +    #[inline]
> +    fn inc_ref(&self) {
> +        // SAFETY: `self` holds a live reference.
> +        unsafe { bindings::fwctl_get(self.as_raw()) };
> +    }
> +
> +    #[inline]
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The caller owns a live reference.
> +        unsafe { bindings::fwctl_put(obj.cast().as_ptr()) };
> +    }
> +}
> +
> +// SAFETY: `Device<T>` is refcounted by the fwctl core and may be releas=
ed from any thread.
> +unsafe impl<T: Operations> Send for Device<T> {}
> +
> +// SAFETY: Shared access to the embedded `fwctl_device` is protected by =
the fwctl core. The
> +// `registration_data` field is only mutated before registration and aft=
er unregistration (both
> +// single-threaded with respect to callbacks).
> +unsafe impl<T: Operations> Sync for Device<T> {}
> +
> +/// A registered fwctl device.
> +///
> +/// Owns the [`RegistrationData`](Operations::RegistrationData) made ava=
ilable to driver callbacks.
> +/// The parent device lifetime ensures that [`fwctl_unregister`] runs be=
fore the parent driver
> +/// unbinds.
> +///
> +/// On drop the device is unregistered (all user contexts are closed and=
 `ops` is set to `NULL`)
> +/// and the registration data is dropped.
> +///
> +/// [`fwctl_unregister`]: srctree/drivers/fwctl/main.c
> +pub struct Registration<'a, T: Operations> {
> +    dev: ARef<Device<T>>,
> +    _reg_data: Pin<KBox<T::RegistrationData<'a>>>,
> +}
> +
> +impl<'a, T: Operations> Registration<'a, T> {
> +    /// Register a previously allocated fwctl device with the given regi=
stration data.
> +    ///
> +    /// The `reg_data` is owned by the registration and accessible durin=
g callbacks.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must not `mem::forget()` the returned [`Registration`] o=
r otherwise prevent its
> +    /// [`Drop`] implementation from running, since `fwctl_unregister` m=
ust be called before the
> +    /// parent device is unbound.
> +    ///
> +    /// `dev` must be an unregistered [`Device`] that is not associated =
with any live
> +    /// [`Registration`], and no other thread may attempt to register th=
e same device concurrently.
> +    pub unsafe fn new(
> +        parent: &'a device::Device<device::Bound>,
> +        dev: &Device<T>,
> +        reg_data: impl PinInit<T::RegistrationData<'a>, Error>,
> +    ) -> Result<Self> {
> +        let actual_parent =3D dev.as_ref().parent().ok_or(EINVAL)?;
> +        let parent_device: &device::Device =3D parent;
> +        if !core::ptr::eq(actual_parent, parent_device) {
> +            return Err(EINVAL);
> +        }
> +
> +        let reg_data: Pin<KBox<T::RegistrationData<'a>>> =3D KBox::pin_i=
nit(reg_data, GFP_KERNEL)?;
> +
> +        // Store the registration data pointer in the device before regi=
stration, so that it is
> +        // visible once callbacks can be invoked. The `'static` type is =
only an erased storage
> +        // handle; callbacks access the pointer through a higher-ranked =
closure.
> +        let ptr: NonNull<T::RegistrationData<'static>> =3D
> +            NonNull::from(Pin::get_ref(reg_data.as_ref())).cast();
> +
> +        // SAFETY: No concurrent access; the device is not yet registere=
d.
> +        unsafe { *dev.registration_data.get() =3D ptr };
> +
> +        // SAFETY: `dev` is a valid fwctl_device backed by an ARef.
> +        let ret =3D unsafe { bindings::fwctl_register(dev.as_raw()) };
> +        if ret !=3D 0 {
> +            // SAFETY: No concurrent readers; registration failed.
> +            unsafe { *dev.registration_data.get() =3D NonNull::dangling(=
) };
> +            return Err(Error::from_errno(ret));
> +        }
> +
> +        Ok(Self {
> +            dev: dev.into(),
> +            _reg_data: reg_data,
> +        })
> +    }
> +}
> +
> +impl<T: Operations> Drop for Registration<'_, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: The Registration lifetime guarantees that the parent =
device is still bound.
> +        // `fwctl_unregister` takes the write lock, closes all user cont=
exts, and sets ops=3DNULL.
> +        // After it returns, no callbacks can be running or will run.
> +        unsafe { bindings::fwctl_unregister(self.dev.as_raw()) };
> +
> +        // SAFETY: `fwctl_unregister` guarantees no concurrent readers.
> +        unsafe { *self.dev.registration_data.get() =3D NonNull::dangling=
() };
> +
> +        // `self._reg_data` is dropped here, after callbacks have stoppe=
d.
> +    }
> +}
> +
> +/// Internal per-FD user context wrapping `struct fwctl_uctx` and `T`.
> +///
> +/// Not exposed to drivers; they work with `&T` / `Pin<&mut T>` directly=
.
> +#[repr(C)]
> +#[pin_data]
> +struct UserCtx<T: Operations> {
> +    #[pin]
> +    fwctl_uctx: Opaque<bindings::fwctl_uctx>,
> +    #[pin]
> +    uctx: T,
> +}
> +
> +impl<T: Operations> UserCtx<T> {
> +    /// # Safety

Missing one-line doc before safety block.

> +    ///
> +    /// `ptr` must point to a `fwctl_uctx` embedded in a live `UserCtx<T=
>`.
> +    #[inline]
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::fwctl_uctx) -> &'a Self {

`UserCtx` is technically pinned; this is actually assumed by
`Operations::open` which returns a `PinInit`. So how about encoding this
invariant in the code by making this method return a `Pin<&'a Self>`?
This would make this method carry more invariants that callers don't
need to enforce anymore.

> +        // SAFETY: The caller upholds the `UserCtx<T>` embedding invaria=
nt.
> +        unsafe { &*container_of!(Opaque::cast_from(ptr), Self, fwctl_uct=
x) }
> +    }
> +
> +    /// # Safety

Missing one-line doc before safety block.

> +    ///
> +    /// `ptr` must point to a `fwctl_uctx` embedded in a live `UserCtx<T=
>`.
> +    /// The caller must ensure exclusive access to the `UserCtx<T>`.
> +    #[inline]
> +    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::fwctl_uctx) -> &'a mu=
t Self {

Same remark as `from_raw`, we could return a `Pin<&'a mut Self>` here.

> +        // SAFETY: The caller upholds the embedding and exclusivity inva=
riants.
> +        unsafe { &mut *container_of!(Opaque::cast_from(ptr), Self, fwctl=
_uctx).cast_mut() }
> +    }
> +
> +    /// Returns a reference to the fwctl [`Device`] that owns this conte=
xt.
> +    #[inline]
> +    fn device(&self) -> &Device<T> {
> +        // SAFETY: fwctl initialises this pointer before any driver call=
back.
> +        let raw_fwctl =3D unsafe { (*self.fwctl_uctx.get()).fwctl };
> +        // SAFETY: Rust fwctl devices use the offset-0 `Device<T>` layou=
t.
> +        unsafe { Device::from_raw(raw_fwctl) }
> +    }

With `from_raw_*` returning `Pin`s, you can now have this accessor that
removes some unsafe calls in the callbacks below:

    /// Returns a reference to the `T` embedded in this user context.
    #[inline]
    fn uctx(self: Pin<&Self>) -> Pin<&T> {
        assert_pinned!(UserCtx<T>, uctx, T, inline);

        // SAFETY: `uctx` is structurally pinned.
        unsafe { self.map_unchecked(|c| &c.uctx) }
    }

> +}
> +
> +/// Static vtable mapping Rust trait methods to C callbacks.
> +struct VTable<T: Operations>(PhantomData<T>);
> +
> +impl<T: Operations> VTable<T> {
> +    /// The fwctl operations vtable for this driver type.
> +    const VTABLE: bindings::fwctl_ops =3D bindings::fwctl_ops {
> +        device_type: T::DEVICE_TYPE as u32,

Maybe add a `CAST:` comment for discoverability.

> +        uctx_size: kmalloc_aligned_size::<UserCtx<T>>(),
> +        open_uctx: Some(Self::open_uctx_callback),
> +        close_uctx: Some(Self::close_uctx_callback),
> +        info: Some(Self::info_callback),
> +        fw_rpc: Some(Self::fw_rpc_callback),
> +    };
> +
> +    /// # Safety

Missing one-line doc before safety block (and the other callbacks as
well).

> +    ///
> +    /// `uctx` must be a valid `fwctl_uctx` embedded in a `UserCtx<T>` w=
ith
> +    /// sufficient allocated space for the uctx field.
> +    unsafe extern "C" fn open_uctx_callback(uctx: *mut bindings::fwctl_u=
ctx) -> ffi::c_int {
> +        const_assert!(
> +            core::mem::offset_of!(UserCtx<T>, fwctl_uctx) =3D=3D 0,
> +            "struct fwctl_uctx must be at offset 0"
> +        );
> +
> +        // SAFETY: fwctl sets this pointer before calling `open_uctx`.
> +        let raw_fwctl =3D unsafe { (*uctx).fwctl };
> +        // SAFETY: Rust fwctl devices use the offset-0 `Device<T>` layou=
t.
> +        let device =3D unsafe { Device::<T>::from_raw(raw_fwctl) };
> +
> +        let uctx_offset =3D core::mem::offset_of!(UserCtx<T>, uctx);
> +        // SAFETY: `uctx_size` reserves space for the full `UserCtx<T>`.
> +        let uctx_ptr: *mut T =3D unsafe { uctx.byte_add(uctx_offset).cas=
t() };
> +
> +        // SAFETY: `open_uctx` is called under `registration_lock` read,=
 so the device is
> +        // registered. `uctx_ptr` addresses the uninitialised pinned con=
text reserved by
> +        // `uctx_size`.
> +        unsafe {
> +            device.with_registration_data(|device, reg_data| {
> +                match T::open(device, reg_data).__pinned_init(uctx_ptr) =
{
> +                    Ok(()) =3D> 0,
> +                    Err(e) =3D> e.to_errno(),
> +                }
> +            })
> +        }
> +    }
> +
> +    /// # Safety
> +    ///
> +    /// `uctx` must point to a fully initialised `UserCtx<T>`.
> +    unsafe extern "C" fn close_uctx_callback(uctx: *mut bindings::fwctl_=
uctx) {
> +        // SAFETY: fwctl keeps the owning device live for this callback.
> +        let device =3D unsafe { Device::<T>::from_raw((*uctx).fwctl) };
> +
> +        // SAFETY: close is called for an opened Rust user context.
> +        let ctx =3D unsafe { UserCtx::<T>::from_raw_mut(uctx) };

If you use the suggested `from_raw_mut` then this needs to become `let mut =
ctx`...

> +
> +        // SAFETY: `close_uctx` is called under `registration_lock` writ=
e (from
> +        // `fwctl_unregister`) or read (from `fwctl_fops_release`), so t=
he device is registered.
> +        // fwctl never moves an opened user context.
> +        unsafe {
> +            device.with_registration_data(|device, reg_data| {
> +                T::close(Pin::new_unchecked(&mut ctx.uctx), device, reg_=
data);

... so you can obtain `uctx` by doing `ctx.as_mut().project().uctx` and
remove the call to the unsafe `Pin::new_unchecked`. The `fwctl never
moves an opened user context` SAFETY comment can also be moved to
`from_raw` and `from_raw_mut`.

> +            });
> +        }
> +
> +        // SAFETY: close is the last callback before fwctl frees the all=
ocation.
> +        unsafe { core::ptr::drop_in_place(&mut ctx.uctx) };

This then becomes
`core::ptr::drop_in_place(ctx.project().uctx.get_unchecked_mut())`.

> +    }
> +
> +    /// # Safety
> +    ///
> +    /// `uctx` must point to a fully initialised `UserCtx<T>`.
> +    /// `length` must be a valid pointer.

Let's use a bullet list when there are several safety requirements, or
they will appear on the same line in the generated doc.

> +    unsafe extern "C" fn info_callback(
> +        uctx: *mut bindings::fwctl_uctx,
> +        length: *mut usize,
> +    ) -> *mut ffi::c_void {
> +        // SAFETY: info is called for an opened Rust user context.
> +        let ctx =3D unsafe { UserCtx::<T>::from_raw(uctx) };
> +        let device =3D ctx.device();
> +
> +        // SAFETY: `info` is called under `registration_lock` read, so t=
he device is registered.
> +        // fwctl never moves an opened user context.
> +        let result =3D unsafe {
> +            device.with_registration_data(|device, reg_data| {
> +                T::info(Pin::new_unchecked(&ctx.uctx), device, reg_data)

With the new `from_raw` this can become:

    device.with_registration_data(|device, reg_data| T::info(ctx.uctx(), de=
vice, reg_data))

which removes the stealthy unsafe call to `Pin::new_unchecked`, and the
need for the `never moves an opened user context` comment.

(the same applies to `fw_rpc_callback`).

> +            })
> +        };
> +
> +        match result {
> +            Ok(kvec) if kvec.is_empty() =3D> {
> +                // SAFETY: `length` is a valid out-parameter.
> +                unsafe { *length =3D 0 };
> +                // Return NULL for empty data; kfree(NULL) is safe.
> +                core::ptr::null_mut()
> +            }
> +            Ok(kvec) =3D> {
> +                let (ptr, len, _cap) =3D kvec.into_raw_parts();
> +                // SAFETY: `length` is a valid out-parameter.
> +                unsafe { *length =3D len };
> +                ptr.cast::<ffi::c_void>()
> +            }
> +            Err(e) =3D> Error::to_ptr(e),
> +        }
> +    }
> +
> +    /// # Safety
> +    ///
> +    /// `uctx` must point to a fully initialised `UserCtx<T>`.
> +    /// `rpc_in` must be valid, initialised, and exclusively accessible =
for `in_len` bytes.
> +    /// `out_len` must be valid for reading and writing an initialised `=
usize`.

Same here, let's use a bullet list.

> +    unsafe extern "C" fn fw_rpc_callback(
> +        uctx: *mut bindings::fwctl_uctx,
> +        scope: u32,
> +        rpc_in: *mut ffi::c_void,
> +        in_len: usize,
> +        out_len: *mut usize,
> +    ) -> *mut ffi::c_void {
> +        let scope =3D match RpcScope::try_from(scope) {
> +            Ok(s) =3D> s,
> +            Err(e) =3D> return Error::to_ptr(e),
> +        };
> +
> +        // SAFETY: `out_len` points to the userspace output buffer lengt=
h supplied by fwctl.

nit: the safety paragraph of `fw_rpc_callback` doesn't mention anything
about userspace, and this is irrelevant here, so maybe remove that bit.

> +        let max_output_len =3D unsafe { *out_len };
> +
> +        // SAFETY: RPC is called for an opened Rust user context.
> +        let ctx =3D unsafe { UserCtx::<T>::from_raw(uctx) };
> +        let device =3D ctx.device();
> +
> +        // SAFETY: fwctl passes an exclusively owned buffer that is vali=
d and initialised for
> +        // `in_len` bytes. It remains live for the duration of this call=
back.
> +        let rpc_buf: &mut [u8] =3D unsafe { slice::from_raw_parts_mut(rp=
c_in.cast::<u8>(), in_len) };

nit: you don't need to mention the type here (but fine if you prefer to
keep it for readability).
