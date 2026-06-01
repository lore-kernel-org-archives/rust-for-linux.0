Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012026.outbound.protection.outlook.com [40.107.200.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9436C382F3A;
	Mon,  1 Jun 2026 07:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780299242; cv=fail; b=kXVKTJaIMMV5TXoq9/RoB+QOC0pAYb7RaNx6iWXRv8CJwq6L/SVD4OoSUdSylPIKne7z0S2x8ZEdYLeWgew/KkjWVDKo1myLLU5TIpxcP+1pqIyIpoPBN/JUdhlPwnYdRjeChOqRTbA/1jVU9xpEhnNZdHkIEKjZKOMiywRW5w8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780299242; c=relaxed/simple;
	bh=Y1UOUxMoGbzTWNnCECysVTgMwaJ83tLdRmQGeVNsQzA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=qYFWGpMAY1VRyOe4yTXGzouUWYfOBbOXBq7nqeDDiCHcFKrf2XXGEd4lIa+6Mmw5ScOvflkQGKKTJIaEz1ueOLX32r2YxmavJJtNDl0+5a4ju0YuNdjiA/4bQubj7otRG1C8LrlEXtnBSXUqE4UfxjVq2+SiNKJcd3wue0wvCVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pFmubINP; arc=fail smtp.client-ip=40.107.200.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pFmubINP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2WwOVtox0sV71DYtzHOHNlxTQw4hMqs8aBbD71skvnTPtouShJqIy+17kXVUrfLjV6wL7BFwZqB6YkatM1h9cnUZL3UXQ/n44Zw2NsHHavOe8R1Em1hA22Mcc3/IeQp2J4qvJST/44uCVFKcMYx+whRhuJZ9uV/typmhV9QjZvEQz4JWbOXPYMXcymQ5nkeWIrv4Dx9WrLb4kJPce2zCiLiG40654QFfx2vqlsrG7+qin0ByK1jPJ6+p6srHaYvc6TmJo20P84yE3wVhicUhiCV+JuD6VDzUlAB78VC+A3iKp1fhDSqFw4DBGdWboFtJOx0PF5yf7kaBy2m9DhqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTfj52mwfQ5LjTR954xhf7Z+ThG79b1E4ABp3yDQyaw=;
 b=BxM9o6kuB6oXYGH7JdGl4RBEoN3CCB8dfE+pnT4WAjNxY8Kf4Zhon+oCXaPyrRFhVXr+j3jP4HThUdNUUvgAfl3EP63J5Di83WbnDvPkDYadlLmiDxVWb92/fO+xICMVSJAsDhvLXWvUBt1KyrZhvEEZknSnxYDUYt08bmGwJL4crgI2SRlXKrX4iTAKZtI6Ox3UuUWFVe2C5NABurEJi1IBz05E+8eu3IrkRJID15yGdRAaHkwstFFvvmYoCOy5SPRhvwDslodW/pVjAbUohqEpZaI2/NTm3DqqyMUGJQKVA+Apd+g26volCC4UT94N47MsrRxojGUB9tSiSiA0Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTfj52mwfQ5LjTR954xhf7Z+ThG79b1E4ABp3yDQyaw=;
 b=pFmubINP0cvarh7i1zJNOrFyHQMxvDnCU3J3IeEmLYjM1jKdfvwr7z4kUvOck9VfM+82rkhyozZq0Fn+E7QeEo1R++2Zq4kajPJBThR2tlX7MrBtw+FJQan+bqeLBCpl+HWUoVVNHQrxEz/uFAY6qo4/rh0LAglxyL6mmr3KtFAd297a2qV6eJWeChXZ1QPGPMrQM28cqf1ZxE3vWXClrWvxU7JlSq6uLmpQM7955xznyJ2bd/N59S6XasscDNz+jYz3qfyNbuApfCTBwR1HxwBCxvrw2PV4B//UwD1u9J/wV10/SIRjpyFZXKrqzw5CWfxLEQBNbJWVYC4sVyTXRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB7995.namprd12.prod.outlook.com (2603:10b6:8:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 1 Jun 2026
 07:33:55 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 07:33:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 16:33:50 +0900
Message-Id: <DIXJEO0ILZVH.2BOQ4HKC3396B@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
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
Subject: Re: [PATCH v11 06/22] gpu: nova-core: Blackwell: use correct sysmem
 flush registers
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-7-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-7-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0078.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 85979da8-7341-4bbc-4cf2-08debfb0227c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	HFFchRQsbeqGlehasqOfuRIZMxHGB0QOMSU879qiqgn8hEnacO2uJYdi++Wwwy9oKb9yymqiikjtzb0mv9xNeLFj1DoEObGletLbICH1IUuvbO6Q0VwCiXkKomPMMLjgw9CVdqvzPiyzlIGPckoz0sTVQy9Bc17m7MHPysEnoWnRPCPOHtnoKCFVEVWnWVoJl/m6WcQPYsC9IardmRr8/iN2Ceu+48k20WqreJ95iR50EaGalWClJa3XsEGc45acl0zAUB+rnjVgzNnj1evwXvY3+54mon0kf0rNnZBre9pu9TqQF1p5zO24i7y6H7nzL67ogun1E4At7FwIRTN3CwtcKkXIUdFsDEJjcEOxHluUi9XK6/NfP0rHdTj5ZoRlHU8TeagDKii+PJ/SMkDzYMGbxCS3wghylD24fsE7eUcTy8jGPL9P9TtN78VA+fJuGSmHkKNzJ9vSq/oPFhBKpmuWqeT3M3i11m7IT2Y+ijia2aPZ9Mry0CdCwYQ5bAK3s2q62ptIAHS+njFjmPeuMvxiC1mu9DdaJmT2akaE8ySaavXEVPHRchhrCE+W5ggbZFY8LuySvrywCNga/XqzykG0TZeGoo/7dBW/tnXDD197+Z+0jhzJLSrUsq5gVeyBcISmKH6i/P8u+oIUkvV7N9WrRIJJE1ra/N+TYgv1nBdqbskbn2m+mlWSQnV0fxa/ta/ONEXvRJVn4e3IQc+6Yw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWZqbmxESVJycGlPTE1XZTBWZW4vNmtoOWNIU2pQcjdXaWdJY3RsRGRLSXpH?=
 =?utf-8?B?Wk1RekRwS2tmazdydHdldWlUNFVuR3VxaTBWRVV4RW1vcnk0NExnS1cvN1Ix?=
 =?utf-8?B?ejF1WUx0UnZ5VlFYdW1GN3RTWjFFWGZjZ3dEdzg3dzZEQjRFenZuN0VhUEFt?=
 =?utf-8?B?T2doSmtJVDI2VU42b2I1bkdnMWRJK3Z5ek1pMEVlM2lBdWxFcnM3NFV3RkV0?=
 =?utf-8?B?d1dTd3o3MGxEc25YZGpITmp2bVBadEcvWm9pN1RpZVRVdFloNG5lcE1KWnlW?=
 =?utf-8?B?VFM4SERVaGJXTGRSbmNxUnlqaDZDRWM3a1R3UGtkMWl4YVVVZTlwRnRQMTJ1?=
 =?utf-8?B?bENjSzVLMHNnUVFIU1lKcVpQUzdqMkxBSTdjaFd6YVdyVFVIanRaOEs4Rk50?=
 =?utf-8?B?NE9OUkI0SWZTbys2ZGNaNzh5bDhrK1VTRHJVYTV6QnJDZkpOYk9wRHZoK01m?=
 =?utf-8?B?OHlVdUZWVW5HTWxRRnBUZzFJdTNKR2ZTME9aaTVFS01XakFBOEYzeTRBTWtH?=
 =?utf-8?B?NDNzNnNMTjVhNmJ0eVBhdWpkME1HWWtkVWxKTFJhcmRjY2p1YVNtcEQwakdO?=
 =?utf-8?B?OG9NWnhkaHdKUlcraWxBaDR5Z0txcWVPWit6blNkdkZUcmpCLzlzdFAvNW4x?=
 =?utf-8?B?ZjIzQzdQRit2ZC9Rc0dRZWFIaU9ZUUJHOEU2cnQ3MlNLWUhLSFc3MTJpNmIr?=
 =?utf-8?B?ZG5YVTBIZmZYNE52cW8yZUtrbmNDRkcvZmlOQUtSbWJHMjZFbU0rRXBUZ1pK?=
 =?utf-8?B?Nno4bG1DaFNQQ1hpNTROaGF1OEZma1dBK1J4bmRnK0NzSGxMbTVhQzhpWjA0?=
 =?utf-8?B?Unc1SXNQZmNtNmhFWGREUWkyZWRFekdlUkU5RW1Idm9MRzJIcytsWUFSby9D?=
 =?utf-8?B?UWwrQ1gwZFg1cThqSFNNTWJyVkhUUzdWWmFoem01MkV6MmxWbHIrc3lYY1p0?=
 =?utf-8?B?YnM0WTdqQU5PWDhMU0ZPS0R2WTBYYnAzTWN0OERwN2k0WHdpM05lQzlnYVR1?=
 =?utf-8?B?cjRqdHo0NktHTytnZ21JTS9GTW9zQWNFT01HcVhvVWozS3B1ODlQZTk0dlBM?=
 =?utf-8?B?ZVNLL040Zm1GUVdSeXdyZkZSRWRCeVJZUjBMMEJVU0VLVzRUTkN6Qi9qVUhH?=
 =?utf-8?B?aXlRdHZIaWNnb2ljZkMwMXgvQnNvcUF1dExKME45bWhCMmhZSTNLUEVoanht?=
 =?utf-8?B?Y2EvY0NUREFMK0Jpd3BRN1NCMzBRb0Rhd0VEL0FLNzdmb01VVUdxMjIycjFW?=
 =?utf-8?B?QVorZTg0WjJ2VExkcTQvMlRXbUFwZGl0ZjNSNmpJcjd4RW4vZTFSV203cUtD?=
 =?utf-8?B?b3c4b1JlVzJoeHJYRlpTVzZPK25yZzRTcHBTSzlucWZVaTJ1TWVGS1NIS3lV?=
 =?utf-8?B?M0l3L2ZwanlXMmpzalVpUkRiWG1pYlpybzdkS2YxNlg2NWdYajZpNFZ3ZDBM?=
 =?utf-8?B?Wm85N1I3TVhueTF0MTN2NStWaDgvcmVFRnZsRlFhOGxTTGUrSTUyTTVZZXpD?=
 =?utf-8?B?bGk4MnN3L1MwVGQxZDZvTEU0cktzSzk2OWw3cVYrK2ZHMDlDd29EYVRGWDA3?=
 =?utf-8?B?YUV5MmZaQnBDSnM3RDVxUmIrMm5waURUOEVRWVR4MUptVnhSeW16QjRlQVU1?=
 =?utf-8?B?bEttaXZ6L0czdG5zUnppNVE2Q0xUZkliNWc0K3lhQ1hzc1EzMjNlMHlJZHZu?=
 =?utf-8?B?dE9RN1pRK1ZPZGpOWWdlc25ZOFc2b1pPSGNGb3crdldIL1hTd09WL2ZlSkEz?=
 =?utf-8?B?M0thQXp1bUhvUTRRL2JCbGRuc3lwbGc0aFBIZjRDdGhtL0R0MDlnNnNDbkMz?=
 =?utf-8?B?MlltclZ0TUVRNGFxYkY0SmcrZHE0SnBrWDdwZGlOblp6R0lNSkxuQXZtM0Nw?=
 =?utf-8?B?NDJETVNUYURjaVFOcE5WQ3prVnhsMGIzbHQvYkhTN01oQTgwdTk1SG9GdWFz?=
 =?utf-8?B?d0FSMGFqNDc3emJ6UEtldDRHZlp3djMvbUlVL2UyMVRpZ09mT2ZnY2xzU3hz?=
 =?utf-8?B?YVpZNGNoK0Q1NDJzM05jZktsdGxLZVB5c29ESDVES0ZDb24zWWtORHphVjl2?=
 =?utf-8?B?eDRTeWdkenhFUU1hM1lhYlFQa2JPQmVKUzF6QThvTzJCZ3EvK1dWY2JrakRE?=
 =?utf-8?B?cXhpVnBjWE1kYWEwUXBzbk9EL2lDYTE1REozRm5DbU93dGhEa2tocWhyT3lC?=
 =?utf-8?B?S1lld2ZIZmJRVmxlVGxsSGV4b2NhdzdSenJDakNqU3RRNmI3SDNaZDdmM1NZ?=
 =?utf-8?B?d04zQlltREhFU0RKWkJ4Q2NvZ0JSenNmOXdMbUR0VVlBRi8ram9lOVhkYnFK?=
 =?utf-8?B?b2sxZExVTVBQVitlL0ZXUWhIZ3RZQ0YvdDlYdEVtV2Qyc3RZbVF1U3g5MnhL?=
 =?utf-8?Q?hRUnmv+dgj0U14A386i0xW1mGPSRYfbOKJJiasFQgRY1a?=
X-MS-Exchange-AntiSpam-MessageData-1: UUf2Kyr0e4dxMQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85979da8-7341-4bbc-4cf2-08debfb0227c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 07:33:54.7939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqmr1FcunbK47Md1ZrI6e0e7KqIMLOAc+BsGunL6Wrn10u+Rqb9mjXzuavR1Ps0Z3+vhJ20yvTPMIqRPtl3mKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7995

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> Blackwell GPUs moved the sysmem flush page registers away from the
> Ampere/Ada location. GB10x routes the flush through a pair of HSHUB0
> register sets (primary and egress) that must both be programmed to
> the same address. GB20x routes it through FBHUB0.
>
> Implement these paths in the GB10x and GB20x framebuffer HALs.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb/hal/gb100.rs | 46 +++++++++++++++++++++++++--
>  drivers/gpu/nova-core/fb/hal/gb202.rs | 40 +++++++++++++++++++++--
>  drivers/gpu/nova-core/regs.rs         | 37 +++++++++++++++++++++
>  3 files changed, 117 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-cor=
e/fb/hal/gb100.rs
> index 8d63350abf8a..70f4c11b1e77 100644
> --- a/drivers/gpu/nova-core/fb/hal/gb100.rs
> +++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
> @@ -4,6 +4,8 @@
>  //! Blackwell GB10x framebuffer HAL.
> =20
>  use kernel::{
> +    io::Io,
> +    num::Bounded,
>      prelude::*,
>      ptr::{
>          const_align_up,
> @@ -15,11 +17,45 @@
>  use crate::{
>      driver::Bar0,
>      fb::hal::FbHal,
> -    num::usize_into_u32, //
> +    num::usize_into_u32,
> +    regs, //
>  };
> =20
>  struct Gb100;
> =20
> +fn read_sysmem_flush_page_gb100(bar: &Bar0) -> u64 {
> +    let lo =3D u64::from(
> +        bar.read(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO)
> +            .adr(),
> +    );
> +    let hi =3D u64::from(
> +        bar.read(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI)
> +            .adr(),
> +    );
> +
> +    lo | (hi << 32)
> +}
> +
> +/// Write the sysmem flush page address through the GB10x HSHUB0 registe=
rs.
> +///
> +/// Both the primary and EG (egress) register pairs must be programmed t=
o the same address,
> +/// as required by hardware.
> +fn write_sysmem_flush_page_gb100(bar: &Bar0, addr: Bounded<u64, 52>) {
> +    // CAST: lower 32 bits. Hardware ignores bits 7:0.
> +    let addr_lo =3D *addr as u32;
> +    let addr_hi =3D addr.shr::<32, 20>().cast::<u32>();
> +
> +    // Write HI first. The hardware will trigger the flush on the LO wri=
te.
> +
> +    // Primary HSHUB pair.
> +    bar.write_reg(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed(=
).with_adr(addr_hi));
> +    bar.write_reg(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed(=
).with_adr(addr_lo));
> +
> +    // EG (egress) pair -- must match the primary pair.
> +    bar.write_reg(regs::NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI::zero=
ed().with_adr(addr_hi));
> +    bar.write_reg(regs::NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO::zero=
ed().with_adr(addr_lo));
> +}
> +
>  pub(super) const fn pmu_reserved_size_gb100() -> u32 {
>      usize_into_u32::<{ const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment:=
:new::<SZ_128K>()).unwrap() }>(
>      )
> @@ -27,11 +63,15 @@ pub(super) const fn pmu_reserved_size_gb100() -> u32 =
{
> =20
>  impl FbHal for Gb100 {
>      fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
> -        super::ga100::read_sysmem_flush_page_ga100(bar)
> +        read_sysmem_flush_page_gb100(bar)
>      }
> =20
>      fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
> -        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
> +        let addr: Bounded<u64, 52> =3D Bounded::<u64, 64>::from(addr)
> +            .try_shrink::<52>()
> +            .ok_or(EINVAL)?;

Maybe more simply written:
`let addr =3D Bounded::<u64, 52>::try_new(addr).ok_or(EINVAL)?;`

> +
> +        write_sysmem_flush_page_gb100(bar, addr);
> =20
>          Ok(())
>      }
> diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-cor=
e/fb/hal/gb202.rs
> index 542c1d7429e9..5a6b815eec3d 100644
> --- a/drivers/gpu/nova-core/fb/hal/gb202.rs
> +++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
> @@ -4,24 +4,58 @@
>  //! Blackwell GB20x framebuffer HAL.
> =20
>  use kernel::{
> +    io::Io,
> +    num::Bounded,
>      prelude::*,
>      sizes::SizeConstants, //
>  };
> =20
>  use crate::{
>      driver::Bar0,
> -    fb::hal::FbHal, //
> +    fb::hal::FbHal,
> +    regs, //
>  };
> =20
>  struct Gb202;
> =20
> +fn read_sysmem_flush_page_gb202(bar: &Bar0) -> u64 {
> +    let lo =3D u64::from(
> +        bar.read(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO)
> +            .adr(),
> +    );
> +    let hi =3D u64::from(
> +        bar.read(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI)
> +            .adr(),
> +    );
> +
> +    lo | (hi << 32)
> +}
> +
> +/// Write the sysmem flush page address through the GB20x FBHUB0 registe=
rs.
> +fn write_sysmem_flush_page_gb202(bar: &Bar0, addr: Bounded<u64, 52>) {
> +    // Write HI first. The hardware will trigger the flush on the LO wri=
te.
> +    bar.write_reg(
> +        regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::zeroed()
> +            .with_adr(addr.shr::<32, 20>().cast::<u32>()),
> +    );
> +    bar.write_reg(
> +        regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed()
> +            // CAST: lower 32 bits. Hardware ignores bits 7:0.
> +            .with_adr(*addr as u32),
> +    );
> +}
> +
>  impl FbHal for Gb202 {
>      fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
> -        super::ga100::read_sysmem_flush_page_ga100(bar)
> +        read_sysmem_flush_page_gb202(bar)
>      }
> =20
>      fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
> -        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
> +        let addr: Bounded<u64, 52> =3D Bounded::<u64, 64>::from(addr)
> +            .try_shrink::<52>()
> +            .ok_or(EINVAL)?;

Same here.

> +
> +        write_sysmem_flush_page_gb202(bar, addr);
> =20
>          Ok(())
>      }
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 356fbf364ea5..65be6ec71ed4 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & =
AFFILIATES. All rights reserved.
> =20
>  use kernel::{
>      io::{
> @@ -145,6 +146,42 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) ->=
 kernel::fmt::Result {
>          /// Bits 12..40 of the higher (exclusive) bound of the WPR2 regi=
on.
>          31:4    hi_val;
>      }
> +
> +    // Blackwell GB10x sysmem flush registers (HSHUB0).
> +    //
> +    // GB10x GPUs use two pairs of HSHUB registers for sysmembar: a prim=
ary pair and an EG
> +    // (egress) pair. Both must be programmed to the same address. Hardw=
are ignores bits 7:0
> +    // of each LO register. HSHUB0 base is 0x00891000.
> +
> +    pub(crate) NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x00891e50=
 {
> +        31:0    adr =3D> u32;
> +    }
> +
> +    pub(crate) NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00891e54=
 {
> +        19:0    adr;
> +    }
> +
> +    pub(crate) NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x00891=
6c0 {
> +        31:0    adr =3D> u32;
> +    }
> +
> +    pub(crate) NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00891=
6c4 {
> +        19:0    adr;
> +    }
> +
> +    // Blackwell GB20x sysmem flush registers (FBHUB0).
> +    //
> +    // Unlike the older NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers which en=
code the address with an
> +    // 8-bit right-shift, these registers take the raw address split int=
o lower/upper 32-bit halves.
> +    // The hardware ignores bits 7:0 of the LO register.
> +
> +    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x008a1d58=
 {
> +        31:0    adr =3D> u32;
> +    }
> +
> +    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x008a1d5c=
 {
> +        19:0    adr;
> +    }
>  }

May be nice to move these to the place (HAL) they are used if they
aren't used anywhere else (and reduce visibility). I am also curious
about where 0x00891000 comes from.

