Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B7B37187B;
	Tue, 10 Mar 2026 10:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140003; cv=fail; b=Ug/TnQZGTsQ4CzECB1U6kSR340Q5Ma5gxFHQq8tfQIBi2A7JWZtSiace5PzJoVtBa4EvgqO+Jc1z24Wjp5h8Vz7nMYd/HG4hOC4RDc1tW81B+IBawaAHM1HvISfYw8yT1OJg+uf5Oke35OaKZsvGOettzTIVqLPmlY2zPMuGwVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140003; c=relaxed/simple;
	bh=JSGcXdlgY8/snhrX/zFaZvjs+KJsrV58oqhXirlKXrk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NP6QmCzdSjtIET7UZUPdgv04TlgFKknOdkcHyywPNPrUYiYvGvdM4NVK+1WMH6ak0IcEA3pCIDYIQ+A5Bl34kJf7ipIuADGLJTTPosMlfxBhzDrwBaWYTjpXO1vYSbLCCXri3tQuKuVYfxuXp2bnTngzdCEG7KSSfkKFvbwv3Ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JZUISFYR; arc=fail smtp.client-ip=52.101.46.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JZUISFYR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlRV3CVZTkcdKhF+mcBEywhMT9qTlDGzmUOtRU8ZCGKqiVXdgkjHmvl1Uapoc5EhAW6d/OoAA+txgIxS/1xGsxBjF6E1Itq9jiaUt3gb3nC0QyyW5dKe+uOg1CDKK2q+CLu9p2Up4rxKlD9rKpW7S2JeNF9bhTNBMa+AQNDH4fDtjTalTKGqFqtS8710COHuUQOV8QRrDFXQHpPOPz1s82lDh2cJIpMpAqI6K8b5kycMWZVFrYVu0Cahixi4vMyJFieJK7N/+SRwyGqBOb/byEInL1cv/SASrqUzWwjWhOc7DppPSsVqfn/XOHgPp3G4/HdUie2yZqD55e+okguZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ahPV+zAeqMCPdQewwMRWwb7zJQncMa95mEAUOelASs=;
 b=B5aad6UsnPLEQFuba8DQe/nn2Exi4IM6tBFscM8mrzWyjCzz32htO2zL7wDvDlS42uIVHQR3xjRdZT4BoG+7hOceTEN8pyl3GX+9+ZImV5onx31k0eoptycYUtAA1iB2xmcctpPNyfYW8BHV6PO38IWx9ICD/j67whpM+dlmFXprOz+sSCsd4sCAN+coB3+vGFmJcQ1Z6bBDCwgHojs6d+VH0mjUUvEGf98ElQuS2Y6KAShiBTgQJf3CYaJX8h5MmZo6AM5aNv4wqLXQeUZUjDmqOUUExXDhsF7HB/asMcruwzU8PaP/LFOuIXEqH5votUxHk7Th8r8iCMovYgns6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ahPV+zAeqMCPdQewwMRWwb7zJQncMa95mEAUOelASs=;
 b=JZUISFYRmM9zmUCt/6noPGO18gd5bdvNLadXUkByCUIiYAquKH0s1B1Q2t8XBl+pNLnigYCdioHEzOC5x3SGbLlysBLlweQyDShqv3RRrINv6mL9SK5AlzU4Lz8mqLtRRBsKftCpL7Kv1Z1h42c6E58lL81Bf1HmzeeIOP5y91jQWtcFyLt5V+mWl2AOuAwLdtcRTUwDKJmaksQUmPpbO9dj5sUd8Elossv2blK9JuarR4OhnVdxRQvWD//zDK5CswmLp9ctEqiTuJPYVnv2g9VsWEnFMT5SvmK3kzyBNTwftbUJCNWUeAE7BEGUwL2k33X3t7od1wAmQIbg5+pyyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB999080.namprd12.prod.outlook.com (2603:10b6:8:2fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 10:53:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 10:53:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 19:53:07 +0900
Message-Id: <DGZ1O12CV5MU.LDPUXQK3VJXY@nvidia.com>
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
Subject: Re: [PATCH v6 21/34] gpu: nova-core: add MCTP/NVDM protocol types
 for firmware communication
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-22-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-22-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0198.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB999080:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8e3819-2349-47da-1bc5-08de7e9338b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	Iakp1GRqswd/xgy45rVT4pWkU6aChYE/u47WCPytDkgpg+2lJw9DetY3thoAkdpOrZEQu4NhZ7U02T1ecPRWy60EMzxhjmxe/to3n3VL1KVM7iR/ZZ4JYaDDECaWwgu+Xncsv2UbqKSxmZOOratRlhilkxAHca0kIXQ/nI0CA81hUEjHN0XGMaM/N0D6dAs5hTtnv/+Dn+jWdTSeyOXNSIORo6LBEijr0gzuuAjOobmD5pj+MtNT+H3fwtU+XYvd9B9GVTvqZgjLr0Xt50TOMKRNuGswIRhp8x+bqBXwF1EoxY399Ov6L3wuHUAzhECxpgT0MhfrGPC0w0pUjbAsgT1XusJ3oOMTYF68XIXiIW5E/Y9xhyOXr7ezoTMJdlt5E937U3wC8JUHRDSHwc8h2kp0z+BJLqeGtVyaJnA+Kf21LWKqnt7R2ujX9o4NLg31rSaSSqCYFFSbtwnXF3qVsdmtsApzFrYWS5zV9Tw5W5p65j++8s8jVFLMyh0xLC25tc/2kpkrr1ksenTfKcrmxNg6I7kx6SO/hK0L0cRSAJm/3CsPaYgunU/wudEhJQEOOCUVq8HPrXlgDZRyLbiakJAVLHp7HtA4Xguc57Gncz3wy9AhrCdDhzVUy+mb9keLONHr0lByxL1bBcPPpGhFzkWDIK2GgPVLNy2xQqg4bUkDVSkRU9udDv+7ngFBZ8Jdn3+PjF5z2ODLzdniqrRmCuI/JDoNl0jUyGYpmgxdn0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUs3dlBrUkN4OVRhai9FQUt0ZG5JbTJEYStUZk9NcmhHWE5EdmxuaVRWYjhp?=
 =?utf-8?B?eWRoL2pjbHlUVTlQK2tIbnNIWHViUUFIMC9xTGcydGZKVXo5VTczREtWbFQx?=
 =?utf-8?B?a0dVLzdJVG00NDRmLy9JL2RIV1pLSEFFYUx5ckxrOHJ2ZXZ4azVpK2FwTjBN?=
 =?utf-8?B?YkU1bERMcmFITm1vQzRndjIrQ2thQmYydVN0YXA1WDExMEI5amdqeUVkeVRH?=
 =?utf-8?B?TXZiMmIvaGtjeVhicVZONkMzaWtLbzlrY1F0S0ZTQnptcEpFRlg2dVVtazhB?=
 =?utf-8?B?S25KZHZwZExCYmhBM2dSTlVHWDdUSUcvaVRDdHYxMWwzMld4Rnlzb280YThR?=
 =?utf-8?B?NE5SZGY2L1N5VVRXbkpFeXJxVk5rUXZLbW1jdmFvTWNvWVd3Q2JxWTBsSlRr?=
 =?utf-8?B?VE9oM3hkd2tkQWYxbEFKd0U3djdwYkl1WGF2MEpwMlhCVUtKTk5wdXhHYlBm?=
 =?utf-8?B?UllwNzkwUnZaWU4wbmdHNDJYZkVlaGF1SWh5MnZodm8xT3ZzM0xEK2R2S1VV?=
 =?utf-8?B?eGJFV2loTlZscG1QNVJBTFAyeERucjU3b0phMFNEekQvV3RmRFE5eU9Sc0dT?=
 =?utf-8?B?MzVUN25PWllvVVFTRGNIanNRK3owV2NNWWtGSTZZN1E0SGJkYkhaNzFFVjZ2?=
 =?utf-8?B?czF4T01MMlRVWGxTbmRaOFNSM2tqeHc4dlFTUGdzbWlOU2ZOT3JOTWdidWZ4?=
 =?utf-8?B?ZlVEVU96VUQzemlBdC9Ka3J5SlBzS3hGVDNkM0NTTnZLQmp5d2VRakkrUG9G?=
 =?utf-8?B?cTB6MTE1M0pPNDE3MVB3RmhkRUpEdHF0b09NRmhheDBmQUl4bUR2VStSYjY1?=
 =?utf-8?B?aEVsSWlqZ29KQUUyQTlBeXM3ZCsvaXlHWFZIdzk2NUs3SnVTQ3p1alBHaDEv?=
 =?utf-8?B?aG5vZExibEhvRkRTSEtpQkJkZ2YrYUxnbEdjSGZGZUtmZ3BiZDBKRGJDQnJr?=
 =?utf-8?B?emM2ZndITndua2V2YnY4K1lEaFZkM0pPZk8vQmo4OW14dUxyMnNyYWY0NGZs?=
 =?utf-8?B?a0JiVGNJWFlyZmVZZXhwWitJb01EamU5TU42M3VSRWJZRWkwK3VBMDhMZ3Bn?=
 =?utf-8?B?dzdScGt0Zk84QzRyVmkrV0lBVFdFTjNkM2VPelN0bUIwMXltWTJtMHB2R2Rp?=
 =?utf-8?B?MktNSTNJQzlGR052Y0wxTWtQdjdmMnZiVGhtYlBSWFY2RGZyTytNTzJSelpx?=
 =?utf-8?B?RjRJbVhIRnFzYThpSUZvcTd1S3lZVndGam1qWXRPaUNKYlQzRElrSXF1QWln?=
 =?utf-8?B?VWtHc1UyUnJtMlBSYUtqMUpIK3RSenh6clZNRzlseE9Rb3BpdjQ3eFJveXVW?=
 =?utf-8?B?ZEg4c3R2WTB4eDloZXpvVGNHZVhVRm50SGtiUm9uZStaZlQrV0tTck0yZWR0?=
 =?utf-8?B?ZVZQdDAzTUVXQjdoWWtYblYvTWFDR3J5b29aUExDMXoraldzQklzajFTdnlE?=
 =?utf-8?B?WnFrZVhvakRHczFwZ2dVRkIyT1RSVVFpdThBK1ViZm9HUHBxcENZWDFJVlZv?=
 =?utf-8?B?MGlpZWJZeTZ5bXBXOWkvNmZTQjlPK1R4Z2ZmSkNMbXNrbSt4UkR2aFZhUll2?=
 =?utf-8?B?SHFaMmZtdXBnaE9jVnAxUzg3UC9pR3BZOERKYys2a2o2ejhKcVFYaERlTFdN?=
 =?utf-8?B?WDF2WUc3TzNHVjdUcU1xNHRzc3lsSVVDVWpEcGN5RFlhakd2cnJBVmhXZG0y?=
 =?utf-8?B?RmtYbjBMV0orQzJNQlVXT1lhUERTc2dZbGpweC90dU9JREY3ZStGRlM0V1Ey?=
 =?utf-8?B?Ums5MnpFL09EMkdQY0NmaUlXN2lueVA5QktCcjV0V2xRK0dHUUg2VUdTV3hz?=
 =?utf-8?B?YjV6ZFpTaE9rL04rNWJRWFlzSzVwa0wxTHd1NUd4Ykluc1Vod3dNK21PYUxp?=
 =?utf-8?B?TjZsTWNCSlNuVzY1OW1FODFwWHFkTzQ0SWpFS0hGMG1wbUlpSUNsdXNHUkUr?=
 =?utf-8?B?Slhncjl3V3lUMjJSbjI4ME5ZTDlHYWR0Q0NHaS93SllwOG5rWXhvb2NuTk1H?=
 =?utf-8?B?aytWNzZMbEdpNEQxSm9jT3JZeTg2TkZKZmJZbWdMRHFJWkRRVWpHWVlWazV5?=
 =?utf-8?B?WkxsTTRuRnhkUXg0MkxLUlQ2Qkd6ak9aUTJPK0g1d3Jrem9vbzR3UWJTRkdw?=
 =?utf-8?B?b1FWK3dPM05pUG9vUlI1SVpTZUdlb3prNWVhVUhYM2NJK2hobk5WNjUxK3JN?=
 =?utf-8?B?RURJckh6ZTJWZE05SmM0TGx5bnBrOTNjY0Nkd0o5bDhidGVIY2lzaS9VQmRZ?=
 =?utf-8?B?c1VXNHFXc2pkMTk4Vms5MU1TVWFIMS8wOHdZWm9yYUcwVVB1MVNRUStVa3k0?=
 =?utf-8?B?Y21XbllRVHI5OVFtNkZFVjZjazQ4SVBDQkpYQkpMcm12TDlEZXNBdHRkTjZL?=
 =?utf-8?Q?dU/PGWss6+o26pRA/0YAZet/5tISYYgfGt6PiA3iAO4Gi?=
X-MS-Exchange-AntiSpam-MessageData-1: XdXXew3G/jXpQA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8e3819-2349-47da-1bc5-08de7e9338b9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 10:53:11.2051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qg0OshHcHROis6u3kF/MiLIlLfuWpn8E+RfGR+Z/r77jkJJPq4LNF6SaK8S8EKG0bCn4zToiCJ0o9ffc0uFf1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999080

On Tue Mar 10, 2026 at 11:11 AM JST, John Hubbard wrote:
> Add the MCTP (Management Component Transport Protocol) and NVDM (NVIDIA
> Device Management) wire-format types used for communication between the
> kernel driver and GPU firmware processors.
>
> This includes typed MCTP transport headers, NVDM message headers, and
> NVDM message type identifiers. Both the FSP boot path and the upcoming
> GSP RPC message queue share this protocol layer.
>
> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/mctp.rs      | 107 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |   1 +
>  2 files changed, 108 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/mctp.rs
>
> diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.r=
s
> new file mode 100644
> index 000000000000..0dafc31b230c
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mctp.rs
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! MCTP/NVDM protocol types for NVIDIA GPU firmware communication.
> +//!
> +//! MCTP (Management Component Transport Protocol) carries NVDM (NVIDIA
> +//! Device Management) messages between the kernel driver and GPU firmwa=
re
> +//! processors such as FSP and GSP.
> +
> +#![expect(dead_code)]
> +
> +/// NVDM message type identifiers carried over MCTP.
> +#[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +#[repr(u32)]
> +pub(crate) enum NvdmType {
> +    /// Chain of Trust boot message.
> +    Cot =3D 0x14,
> +    /// FSP command response.
> +    FspResponse =3D 0x15,
> +}
> +
> +/// MCTP transport header for NVIDIA firmware messages.
> +///
> +/// Bit layout: `[31] SOM | [30] EOM | [29:28] SEQ | [23:16] SEID`.
> +#[derive(Debug, Clone, Copy)]
> +pub(crate) struct MctpHeader(u32);
> +
> +impl MctpHeader {
> +    const SOM_SHIFT: u32 =3D 31;
> +    const EOM_SHIFT: u32 =3D 30;
> +
> +    /// Build a single-packet MCTP header (SOM=3D1, EOM=3D1, SEQ=3D0, SE=
ID=3D0).
> +    pub(crate) const fn single_packet() -> Self {
> +        Self((1 << Self::SOM_SHIFT) | (1 << Self::EOM_SHIFT))
> +    }
> +
> +    /// Return the raw packed u32.
> +    pub(crate) const fn raw(self) -> u32 {
> +        self.0
> +    }
> +
> +    /// Check if this is a complete single-packet message (SOM=3D1 and E=
OM=3D1).
> +    pub(crate) const fn is_single_packet(self) -> bool {
> +        let som =3D (self.0 >> Self::SOM_SHIFT) & 1;
> +        let eom =3D (self.0 >> Self::EOM_SHIFT) & 1;
> +        som =3D=3D 1 && eom =3D=3D 1
> +    }
> +}
> +
> +impl From<u32> for MctpHeader {
> +    fn from(raw: u32) -> Self {
> +        Self(raw)
> +    }
> +}
> +
> +/// MCTP message type for PCI vendor-defined messages.
> +const MSG_TYPE_VENDOR_PCI: u32 =3D 0x7e;
> +
> +/// NVIDIA PCI vendor ID.
> +const VENDOR_ID_NV: u32 =3D 0x10de;
> +
> +/// NVIDIA Vendor-Defined Message (NVDM) header over MCTP.
> +///
> +/// Bit layout: `[6:0] msg_type | [23:8] vendor_id | [31:24] nvdm_type`.
> +#[derive(Debug, Clone, Copy)]
> +pub(crate) struct NvdmHeader(u32);
> +
> +impl NvdmHeader {
> +    const MSG_TYPE_MASK: u32 =3D 0x7f;
> +    const VENDOR_ID_SHIFT: u32 =3D 8;
> +    const VENDOR_ID_MASK: u32 =3D 0xffff;
> +    const TYPE_SHIFT: u32 =3D 24;
> +    const TYPE_MASK: u32 =3D 0xff;
> +
> +    /// Build an NVDM header for the given message type.
> +    pub(crate) const fn new(nvdm_type: NvdmType) -> Self {
> +        Self(
> +            MSG_TYPE_VENDOR_PCI
> +                | (VENDOR_ID_NV << Self::VENDOR_ID_SHIFT)
> +                | ((nvdm_type as u32) << Self::TYPE_SHIFT),
> +        )
> +    }
> +
> +    /// Return the raw packed u32.
> +    pub(crate) const fn raw(self) -> u32 {
> +        self.0
> +    }
> +
> +    /// Extract the NVDM type field as a raw value.
> +    pub(crate) const fn nvdm_type_raw(self) -> u32 {
> +        (self.0 >> Self::TYPE_SHIFT) & Self::TYPE_MASK
> +    }
> +
> +    /// Validate this header against the expected NVIDIA NVDM format and=
 type.
> +    pub(crate) const fn validate(self, expected_type: NvdmType) -> bool =
{
> +        let msg_type =3D self.0 & Self::MSG_TYPE_MASK;
> +        let vendor_id =3D (self.0 >> Self::VENDOR_ID_SHIFT) & Self::VEND=
OR_ID_MASK;
> +        msg_type =3D=3D MSG_TYPE_VENDOR_PCI
> +            && vendor_id =3D=3D VENDOR_ID_NV
> +            && self.nvdm_type_raw() =3D=3D expected_type as u32
> +    }
> +}
> +
> +impl From<u32> for NvdmHeader {
> +    fn from(raw: u32) -> Self {
> +        Self(raw)
> +    }
> +}

I think you will want to use the bitfield macro in nova-core/bitfield.rs
to define `MctpHeader` and `NvdmHeader` as that's precisely what it is
designed to handle. It works like the register macro, without the I/O
part.
