Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020074.outbound.protection.outlook.com [52.101.195.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4007A34AB1D;
	Mon, 20 Apr 2026 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702052; cv=fail; b=Pm+7ZCF1Wh9MNdNocse+nDeXbSOIJddCr20r4lGE96P3F3JS3UG3YjWEIlBr3B1UThNHxnR87RDfwewtjGA4bS7DiexAkcLIeMoSn6wTLTToLgJiQUbxQH1pppnE/TOMx/omggZPLTUpVQ7dxkKB2+0CLe3Ro22pImwK86p7qU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702052; c=relaxed/simple;
	bh=KN4ef+60P4fNhwPSCPRSBUELVUpaUxwruR8lmRxYXQg=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=ExdzOxbeOaijrqzxvukTBUdgP1ZWV6A1bdzq1hGWkBES6oagac7G0qW9usRK7W+ZyUhrpj91AMW73ly4LQbSgkkn17DRz2PLM4CuFZS79s45a2sNLJO2TfJ3SqnPlA3nkoq2UOkgYQAWMrWFoB4jl9jbngJHn5PFpq2Zwj/Uc8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LTURAdQG; arc=fail smtp.client-ip=52.101.195.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LTURAdQG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLWta+qdNgHAJ2Z1Z8PhiCPuFpE2f20xRN3dEdzIYz3X3ilZLxq+15leK+3Pxg6FhLjefcmH7grHzu0CSZLo/HCwgC6lLOhx8mQ2neAvoLwR/3LVLDBsbq4oJT5F5svrRUPLH0YMdebfzEAu3/Mgd/shRKgfyykJ6fmcRD8etoSUi5/CTTmLl4E0/FeP/u4dQmdUU/hvJG7+4ezjs7i38PJRp0aKU2fDuE9xP2+tXhjLjrxk8u5bZEesEfeaU70zbYUd/3oQytuX9CmSGvsAqFxWrYaPjTo/qlkpNfmGqxBI4AFwTdcoOWi+kpbzFgyY1pbDRFP8nyfO1nmfI4MOag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDwnKCqU0JI3QDnWrh94C4Ieh3X4Xp7t17nxaGywAWk=;
 b=ph1j8/l5hUEC44GJdXS8OSGEYOS4kN1dUHJsrWpThfOUNG1jUhsED9nuhXCc57r8y8anXu5JzfzfB4YKZeDiafaqdSWPpzwGhXuAEyz3ZvxRU4E2J8GDICXqKpyPAzxJjf++XQFjnTfefgsbhq8RhJd2nn2MfWYCZ3IuhvUHP0lclkArZ5elFw4LBmqEIvNsku9GnYnwUs9E5llV4ekaKF2btfKuENskBU+MT2bD8KDpxGRD1ncAGiOuNDpoCfEgr65MQ70rLaKwT3KaLhXnbyl5f8XM9Zf4lWaLUoHOkasAQ0NzgtFCN5WMdOZK6U1X5oisZwJky1eEV8LAmbdL0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDwnKCqU0JI3QDnWrh94C4Ieh3X4Xp7t17nxaGywAWk=;
 b=LTURAdQGhP36VtsqnnOKNvKYLPBwumwiLwwBxbPREwsGYiNSn56FHnBSbwKdRiSbE44RJQCPhhDCvBpP5+SQR8AAhFXRgb9wSKfLLEB1rHi06m1o7s1SfJNK7EO+L9dMYafWKAoESJA+Uvao5oDu8I02ETjLPGfpyktrx+ylv4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2135.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:75::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 16:20:46 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 16:20:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 17:20:46 +0100
Message-Id: <DHY4B882MJP2.2QV19J5R78QRD@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 08/28] gpu: nova-core: Blackwell: calculate reserved
 FB heap size
X-Mailer: aerc 0.21.0
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-9-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-9-jhubbard@nvidia.com>
X-ClientProxiedBy: LO0P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2135:EE_
X-MS-Office365-Filtering-Correlation-Id: 17012a5b-4391-45ed-fd09-08de9ef8c760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	B2m29mBAXQGQomEhaqhVv3Gl2h45HVW0p8iUm0MeryH/9aelBqzNOZeaeE/b1NhjqM6ZjNyz690ZuH6hs7mSrPlKPMw/BMIqJ7kDDMPSRRERLEC9YC25vzsY4HvwyaYuabLQRnYzSMhsyQtyl7fHE73nfLlgJ9rHdEREED+fX/ysrgURzIVmm/89HNQ4D2Py0f6agHwhfvuRNr7HZm8fpjSWQ+6IsXZwJQ70e5ZwBrQ1e3yBBpk6TXjEylSl2gI3Yz9hzNmPGHkKkPR1bZoK7qb7ozj1U9w65BZEZPQYopWdFnhpOaSCBF+No8O5uepJ3BTS3jnk2UKeOgEiyOqXBbrrAv2zK79T+j4LJWJcPUmFDTQTEfYQNt7YB+V373gzQlyfkZdnX4WgIxZXzLv/8qhrKBd85mOYRPwOCNcHsr0qBeRD1lXtzJz/DwvctZcewzn4HnQZez+JlRm1BUlEeK5WC8UeQwptaG5ZIaxlknEuLW1tNbiUxFWTiSbqmWFzpTLxRyukq6DoKLZ4a4yfowjGZ/6kUpxTOfYf9yQ6xE8X7lTgqCnRG9N9GZTpCaf42N/jPheNgX0lJaHfLpS67z+7CzUVzKpixx3Fkyfhd8LDwx6cuYy9EBMmQpce6Ce/YwdJd/Z7IFoE350uMMPzA2fTNsVFdiFu/VYj5BKIDE/ofb8p3OkzOiWTGZ9HXN/PmJrEy4PX8tejl9In4Sa7wE57slDMqm6KNEOCCBHYTY0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm5ISzBWUGNoL0ZCWjJRMFErM2xSUEVaeU12K3NnaVM3SFppWjdjYjczY0xT?=
 =?utf-8?B?blpnTmwvTUd5SlBlMnRyN1RUK21nRzJ0L1NRYy93b1A3RzBiSWNCL1VFSFQ1?=
 =?utf-8?B?VUExdjdOMjU2aHVtTXNuVUZmd2JBdkNCaEJVR0s3NERLOHhjb0tnTHlhT29y?=
 =?utf-8?B?VjVKWGRNUEpYQTlUTjdrdlo4dW15MUt2K25VTmRHcnNvNURpQ3haeVI2eGV4?=
 =?utf-8?B?SWM3cDdBMjc0R0pCcmZpZUtxdStKK3E0bVVmeXVlSWpBKzRpZ0p6bDM4enNw?=
 =?utf-8?B?RTB4b2oyU2FEVnJmUFRzdHBXSjZOelVHU21OOHNXVmVDQTlLS3laSHdmWTBw?=
 =?utf-8?B?Nmd3aGExeDNHbjM0T09XMlMzQzYyaHhHWWxyQWcyKzNCUlVMMDRtVGg0SktN?=
 =?utf-8?B?NDBOdzFNbjBWcmVDNmZiMXVsV0RNWTJNVDh5UjdJL3YzR20vWGtSY0JicXVR?=
 =?utf-8?B?MmJKUlllaldTWEFYNWpjZVhpeGlaZ1IwZEJJWmdBM3lpeFFkRkJkK0ltWEht?=
 =?utf-8?B?TXc1cTRRc0JuY1N6bExjeE9HVElpQnlOOHFGY1FQSkRDZUU5NVEzdXl1RzJn?=
 =?utf-8?B?V2xqVGptZk8zOTJtT1RaaXFGUU5uSlJiWFlnMzMzSmN4WW5WTTRRcUZjd29r?=
 =?utf-8?B?ZnVSM0tZblJpOVJJZkFSQWJCUGtPcnMzU0Rmb3d1Um9LbHVobDUvRS9Qampl?=
 =?utf-8?B?NDl3ODNXd1c4SVkwTHJKSTc2eEJwUGpMdFhUbU1xOFBheGRaeDBITTUwZ3I5?=
 =?utf-8?B?K3Jub3Fob2pITHM0aWRYQUpnR2lucXBWZzNhSG5sMFlENEJlcGtST0FYdW9J?=
 =?utf-8?B?NkthTTBkcUtRNm95Z2d0NXFQeFZxN1BQZTNXWVlnVHpTNEJ1ejB4dTN2OUl1?=
 =?utf-8?B?d2xDQU5Ec0Z4aGVxOFRUckpicDZTRWtPb1FZbncxZHQ4K3VZak5zZk5GZStL?=
 =?utf-8?B?KzIyZ1FacHk3N2ZtaVlOUGQ0MFc2SmRmcm1ZYXd2V1IrNW1CbUlLQUhPbFhm?=
 =?utf-8?B?WlRNNWVvaXZtd2RBVTVTaGFmMlRZQ21FZCtYSHVseXNDN0lHdzFOcURtM25V?=
 =?utf-8?B?bFNZQkRnWERKZkJmMjUyNUdMeFErVmZSUmcyUVBMOXgrS0dCejh0dDJQL216?=
 =?utf-8?B?Z010M2tJTjVoa0ZVRnZtaHIwQ2ppZ1d6RFlrQVhteHd1TjVvNGNJWGNJcytO?=
 =?utf-8?B?cVlLNkhnMlZvck5Wb09vVjUxWHhtdzVQdGtlWWZNUWZBMUEzWWE1T0p0Lzd6?=
 =?utf-8?B?OEEvSTdNNmpNV3B3L0NURzg4N3VuSzNEOTlFOTRFYTdnakE4ZHZaN1JQUTJU?=
 =?utf-8?B?WEZrRjZ4RDZiUVR4NEtXdGRkYURjMTgyS0JHZ2FaakVJTzlBZmg1aXgyRmwv?=
 =?utf-8?B?N1J5SGNDTlUxRGJWbkNxaXdLT0RsRnlaVVV1bHVCd0Z0Ly9LT0NaeU42akhS?=
 =?utf-8?B?ek04MGtYWkZRTDB3K2Nqek50MHc4eUExYVpyT010N1NXaXJpZkhpYU41a0lY?=
 =?utf-8?B?UWUrTE8rZDhZVUlQOEN4eHVzT2J2eTF0ZXMzdCtvVWUrYWRSYXk5NU12b3N5?=
 =?utf-8?B?T1UxcWJ5WlZ2eXowWnVnVG9ZWFFBdFdFOXg2NUcyTGU5VGZ1L2ovTVhOK29U?=
 =?utf-8?B?WGJkei96aWRuTUVaYUpBQjZmdmR0d0hRbzIxdElyUlA0K3Z4NVdvengyWXQz?=
 =?utf-8?B?SWdTQnBWVmZNVDVwMGlpc1VvdHdtcjFLZ09CNFMrNVZ1WlM3WTJaVDg4RHpK?=
 =?utf-8?B?L2dXWTBJVGVKYUNGQVhPY1QzRStmTEkyUDg4K2E4NkNieDBrUlBSbkU5VVEv?=
 =?utf-8?B?dXhzQmJ1aG1od3o2dG5na1ZJaWNMb0wrd1FXRE5CWFV3YW9nWndZQzhVT0JH?=
 =?utf-8?B?dWZGaTRVL1lKa09mL2pzUXpSeVlXMkw0UzFxYlFiOXdrUWg4ZkxVcEZsWVZE?=
 =?utf-8?B?WTQ1TWF5QzYybFVqU2JoZXdhYlhuaVMrMXFmR3FXczMzUkRVRGpLSjhUcHRM?=
 =?utf-8?B?eWpaaGt6Si9Sb0RDK2p1dWFIRWh3a1plZ21lL1EzYUg1am5jR3dUSzdzbTE5?=
 =?utf-8?B?WUNWT2REcEo3SGFUNGVRSU5PWXpLaGZxcDVOcmw4bWJRYitWL3F3eGtYVzlW?=
 =?utf-8?B?UkdmVFhjQW9rdDBUTWRXS1dtRkZSTlk2aXR6VjVxYXRaTUhYLzQ5U2MwSDhJ?=
 =?utf-8?B?S1dpQzI2Q0ZkMHlXZ1BLMmllVGU0ZVUydFIyNjNNdnBjODc0eTY4RFExZHJG?=
 =?utf-8?B?TGxpT1NnSDFMREhFZURXbUxiemtyNWgzK0VSOS9maVZyTHRYUzNhclkwczlp?=
 =?utf-8?B?QjhjVGhJMXVwT3lTVmV5aVlxUUhZaWxUVVZmZVBVbm5Id0o0akc0QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 17012a5b-4391-45ed-fd09-08de9ef8c760
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 16:20:46.8140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92t+/NRva+366NCM7rU6+9heJ3FTtjQ9VCKd9JMWN3wCYnP/WrtbY/Vmic3MNGquP4qwHFw+T+I+e3JU/jpbTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2135

On Sat Apr 11, 2026 at 3:49 AM BST, John Hubbard wrote:
> Various "reserved" areas of FB (frame buffer: vidmem) have to be
> calculated, because the GSP booting process needs this information.
>
> PMU_RESERVED_SIZE is computed at compile time using const_align_up() and
> applied only for Blackwell dGPU architectures. All other architectures
> leave it at zero, matching Open RM behavior.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs     | 38 ++++++++++++++++++++++++++++++---
>  drivers/gpu/nova-core/gsp/fw.rs |  1 +
>  2 files changed, 36 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 35899e9b2560..c2005e4b4177 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -12,6 +12,7 @@
>      io::Io,
>      prelude::*,
>      ptr::{
> +        const_align_up,
>          Alignable,
>          Alignment, //
>      },
> @@ -22,10 +23,16 @@
>  use crate::{
>      driver::Bar0,
>      firmware::gsp::GspFirmware,
> -    gpu::Chipset,
> +    gpu::{
> +        Architecture,
> +        Chipset, //
> +    },
>      gsp,
> -    num::FromSafeCast,
> -    regs, //
> +    num::{
> +        usize_into_u32,
> +        FromSafeCast, //
> +    },
> +    regs,
>  };
> =20
>  mod hal;
> @@ -168,6 +175,8 @@ pub(crate) struct FbLayout {
>      pub(crate) wpr2: FbRange,
>      pub(crate) heap: FbRange,
>      pub(crate) vf_partition_count: u8,
> +    /// PMU reserved memory size, in bytes.
> +    pub(crate) pmu_reserved_size: u32,
>  }
> =20
>  impl FbLayout {
> @@ -268,6 +277,29 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_=
fw: &GspFirmware) -> Result<
>              wpr2,
>              heap,
>              vf_partition_count: 0,
> +            pmu_reserved_size: match chipset.arch() {
> +                Architecture::BlackwellGB10x | Architecture::BlackwellGB=
20x =3D> PMU_RESERVED_SIZE,
> +                _ =3D> 0,
> +            },
>          })
>      }
>  }
> +
> +/// Returns the PMU reserved memory size for `chipset`.
> +#[expect(dead_code)]
> +pub(crate) fn calc_pmu_reserved_size(chipset: Chipset) -> u32 {
> +    match chipset.arch() {
> +        Architecture::BlackwellGB10x | Architecture::BlackwellGB20x =3D>=
 PMU_RESERVED_SIZE,
> +        _ =3D> 0,
> +    }
> +}
> +
> +/// PMU reserved size, aligned to 128KB.
> +pub(crate) const PMU_RESERVED_SIZE: u32 =3D usize_into_u32::<
> +    {
> +        match const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ=
_128K>()) {
> +            Some(v) =3D> v,
> +            None =3D> panic!("PMU_RESERVED_SIZE: alignment overflow"),
> +        }
> +    },
> +>();

You may use `.unwrap()` now as MSRV has been bumped to 1.85.

(Technically, you could have used it earlier by adding it to list of allowe=
d
features, too)

Best,
Gary

> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 3245793bbe42..5d36604ea1a3 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -247,6 +247,7 @@ pub(crate) fn new<'a>(
>              fbSize: fb_layout.fb.end - fb_layout.fb.start,
>              vgaWorkspaceOffset: fb_layout.vga_workspace.start,
>              vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vg=
a_workspace.start,
> +            pmuReservedSize: fb_layout.pmu_reserved_size,
>              ..Zeroable::init_zeroed()
>          });
> =20

