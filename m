Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010041.outbound.protection.outlook.com [52.101.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9AB30FF36;
	Tue, 10 Mar 2026 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130999; cv=fail; b=TPRxgxa0K+GxGmXjilRT98+f1Y1hKsirJp0qF6/bfS2fQNEDPHt3hu1XKYfiSEe+e9IPMGgR+6bemBRRLKPfav2nVTwAXt2Q+qBHcSbr9dqXARWNhQsD0DYFlejdr+53vFNLnxF30L3Eqklw6qXDGXjmhZBSVlDcQD/1IDDN2UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130999; c=relaxed/simple;
	bh=L/76hMQMnzw5nJKU/6R3wrNsby2QzJTqZufFZxDioB4=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=hifsEwkmpUXI7nwBZqQ4bnOsCCFFBzmCOWmhLxK0BhvmUq/jcBjY/QsDiWVTpueuggyjrSqRieY4r2Ku1BvNHuPnySiqAxI2hnNid80FtojISCA6H+JOt70SNjQQw0lbfvVJTkhdhdzf9L90/nMyGGkFLLuuklIWfB1DPBRq2ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MatNj+kM; arc=fail smtp.client-ip=52.101.193.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MatNj+kM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+iUtSUtTsWW1SPZFl4U+dmQpfYIgz1liPtocZrsExIhSqLmhd4QLUhQ7mUDY52cPtkRTzIeYE6VUlCPdTW/FMs88saUzFFr33bEx/CgcTywYM2uwxcz98/u6lHdc4ety4mURYexaFFUPzXG2K7+eFkTqIVNMP6bvrG0YxLv2wJZl87p4wGK5XC51nkoFA3r7zxY+1MjMBqjtRcWwfAjnHVxUk65fcuE9IafFqmMDaeWBD0AuAlLsCgXNxU5gjoYNL7j+tk34SJ8sr8NP3YzoGxLRccbL0Nw/BkWY43/kab7ZO3ixEbsE7DpWNDz+ctATH0R2NFsecgPdS4I4Skb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDKOK04NtNGE3Z7ylvdBpntzLdd04xJ43+ThC72LyT8=;
 b=Nk+jgXWw2+SH7sNSJlDrPR7gGob+JJ3CxpUEJ9tIPlrjronQOcC+ET7thDZ/LEI6cygC2922TyA8TXpLQPKYMOehhKEG7+gPZRDBINcaKGrRH5fA3hRtWicuBhAe8XkT1kYqU9ZCwawAKMx2FABM+Z/UQox94p7XgVgLEBo4/p3JvKiGaO99sJHWp1Pu/IALo2shI+7tw9aQgOJAFIr+SHpchJcSBOa4Bm+Uqf9oD9L4OAq7MI8vPefMtUiixHuOrlJTyVmpJ2RdnE9MXLmqQXu8TYaPQJ6YXxwXG5gCSI6S5pNvxFjh2kzVmp4SZKZnQG5h5Uf4cSw81QR6RXIXEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDKOK04NtNGE3Z7ylvdBpntzLdd04xJ43+ThC72LyT8=;
 b=MatNj+kMwzk4QdPQenJohLOdXy6PHmsAqOpTIwUO2MGrxwEO5MkiaSJ9A+OmtbB8uMhnhRp9FWw/4l0qL+t0UlebXeE+wPUHe4rLr1iNgfKlD3AyrfUdU68v2ZrmlIzpUuEwUhmDY67E8KUZypZyHhoo/z+zDzXy9/E7u0tPz+SCppKkbNBx4nTt6vcX/S//lWJV3hLmc5X7DCXKWZ0v7UhwO2rf7RERIGodR8VHjCyBLl1lEb/NlBlTprNcd6RgmMK9GvqGVeeNCosw/8mioUEsSj+FX+Gdq922ttSbUxHOmSRyli8mHK+KEDLhC3nwScdoqQxd7qrNPdu+HHCnzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8373.namprd12.prod.outlook.com (2603:10b6:208:40d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 08:23:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 08:23:13 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 17:23:09 +0900
Message-Id: <DGYYH7GCIKJ6.2AICU9NFSKY92@nvidia.com>
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
Subject: Re: [PATCH v6 07/34] gpu: nova-core: move GPU init and DMA mask
 setup into Gpu::new()
Content-Transfer-Encoding: quoted-printable
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-8-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-8-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:405:370::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b90f40-eb79-4812-fcd8-08de7e7e45db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	T66isREd+63/pXokv68OSp8g4ZQM8rsHHj5tniBC6k+CJyRIKBBG0ZW4GA/G0eKf5qOP6tkHUSAdMbe0DGfII/W3WyIPzHhWF5d0RcaFCrm0jl2fK+GXCd1VQ4rOvD/RLo0voTW9QARLMuARcPvj9oULbm+MWAYNaZtacsb+zqmVREvrY8Wbs6gDss/No5oucCzgW4b/0pjW7ehUAMgXrWU6hhbZfN3YzY7drbbfBQiGM2+eaTTtC++kaU80/E0O0XcpvLq61bHUkMk/D1p2ONhAXixAUq+7YhEQfoW1iEuC5cRrwlL6SkX2Yg//pWOp76IhyMU/ODLafHPU/JlBoyxKgdUUXeY8Lz13Hc2h2f0j1FkuP/YuHBS5rVjXvJIG+J8BNPUjLpDH+y4FkIHoghM7+CLTLnS8QNFykp/htiKTRarv+WwEFlPk6ke9+k2mqJGpnF90gRDxALziJHd71ovMkajGgDaOU0JYkwsjrgRggVT9io50Krj3OUCEWh/2kPbdiVgHfsWar92AYnWIkgDi7pT4eBGMcC8kzv4HF6eRGEdKZKCdVlgheStIA56PtFSmyhijwqaYL3iluX0Ue/LVig1yCkFYIHSU5apmI/F+J7akf14Rj4wqyDx3FNmcmwwI+fs/jkNYzixZs34ESckn8ba+w5bPLVa/KulwMdlZo4Z6YdD3AGCpus6R5o63DoQQ+BONvlwOc6efLB3z01oCw/e68tlY7knr6BCuLeU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmUrWnZBNU9PRjNiKzYreEVjQlRvNFdyRjZnb3FHcTdSU25mZ3M1YmFPSmNK?=
 =?utf-8?B?a0h3Z1kxd0FLVlB3UzR3eUhoTi9BODJpWFZlWS9kejBBVmw0dlBGVzlEa1RW?=
 =?utf-8?B?eTEvcUVmN1dDaFRyaG90NysyR2o4RHdiWTVRRlo2dkdyMnZxSXU2NHM1aFVn?=
 =?utf-8?B?MlNIb1pmM2ZnYkdmc1pwbVRoZ1NJbUdnRDZmTzFuUWZPUm9ieHRMMHorV0Iv?=
 =?utf-8?B?dHVBRUlqN0l5Zktla0FmMEpJMGc5OWNsQTAwb0dQUS93Q01CMENncytZTVBR?=
 =?utf-8?B?Mms3cUNQYjROd1lUUUFFK01qTnVwZExHWDdHbzIrN3lNcWRidWlZUG9qTmtW?=
 =?utf-8?B?OUkyaWI0SjV4SmMyMW9SYi9sOXRCV2RZNmNiRWNVME44eHVqaWY2Ty9Ga0ww?=
 =?utf-8?B?M00wYTUxQll2V2o3VkJXM0NBRUZxc0RvcngvaUtyUXJPTmlvZDFGUmcva1hF?=
 =?utf-8?B?L1oydmpyU0ZJazJYRVJWSkR4NVpJcWJheldxZHhFUmE0RFhqUTJCYWdEd0Ir?=
 =?utf-8?B?bnZuSWJXMGNNajNwM1RHUHpqZ1pUOFZYMzhDVlI5cjhaRjN5WTlWdVhCV1Yv?=
 =?utf-8?B?TTFUNlpsbkRhYjBycmh0UVBGc1BtRWFWS3ZUR3hKakJQSHQyNTF6WkJIVU1X?=
 =?utf-8?B?ZUkycHR5Y3dFMkpPb0E2dzZ4RTRuWDdtWitrVGJNT3JQNFRWcnd0UytsRGJG?=
 =?utf-8?B?VCtrenJ1SjYrVit1ajdrV3Z6c0kvMVZCYUg1TXV3K2pEQ2NOeThIaFhQNzBC?=
 =?utf-8?B?VHpVemNIN1E1cDZhYmZ2THl0eVVZNm1GSjRKWDkzd3RzSmhvMHNldHRyTk5k?=
 =?utf-8?B?TEpDd1FXbk5lZ1UwbmcxNXVWNmM4aEIzWjNDZWpscXcxVE5xSitrNFVNTnVk?=
 =?utf-8?B?NkNNeU9hN2xBd2o2dWY1RC9vbWJNMXNqNitHWUczMmY3S09TTldKZGNWTEMy?=
 =?utf-8?B?QVYxL3Npd0txYk9DT3lsNmhFamp3bGdzVnZFaEtZODJ6ajZ2RmZzVDcwTnFL?=
 =?utf-8?B?V1Q5cE11TUJxS2o3NkFPL2g2ckNHWGVlbEdFQjNteTBFU295MWdGUWE1eXJQ?=
 =?utf-8?B?M05qQWhpdStCNUFiSzNpcmNDTG4rZnRxTVRDbG5ORVFWMjZFM3JlWnNFdUpp?=
 =?utf-8?B?amo1OG1LVXJzMXVhTWRnaGJsVml4SEhLQ0tZa3prZTFBRGJCMi9RNEhFUWhN?=
 =?utf-8?B?N1hydGRleGlXdms5Umt2eVN6cFpxWUpzUElDWlRaQTN0MUxiKzVrUk1iQUtS?=
 =?utf-8?B?MWNkSkVWWm1oTXhlbnBmdUhZODhSSm9pZ2hITnFwY3prWUk5Tm5aTUJPNHZ2?=
 =?utf-8?B?djZDdFU0OVpRcVlxV0R4ZGdHWGRBQlV1UWtGZ1FFVHFiZHdqcHJjV2JBMmJn?=
 =?utf-8?B?c2ZRckRHTHZBUEQxZXVwRWRQNC9UcXJhdmQvL3RhcHVzV2JSQnpoaXVzbVZi?=
 =?utf-8?B?RFJaRU5qRVBNUU5wVkFuc3BmZ1JtY2R1NDNGUW5YM1F0dkIyeG9jcHdzRjFC?=
 =?utf-8?B?MXNRUndtYmR1K2N0ZEpNN01nRXNmREJpM0kvY0k4b2hwdmgybDlHTGNzL3VX?=
 =?utf-8?B?UHJUMTRjaDJhaWxJeS81TzU3alFKQm1TN3gxRzJVOHVEZE44ZXRjSmdFZXAv?=
 =?utf-8?B?Q2c4TFBKb1JHNG1CR0tLMDZJWGFDN3phbHArMG9CQmNkRUVmOGsyQ0tvZ2xW?=
 =?utf-8?B?YTFPalhDV3lNOFdvQ0JoZ3p2ZndIT0QvbGxYMmVQb1FHaGxpVWlDN3pqZzV2?=
 =?utf-8?B?RFZscjAxVW1UaitKOC83ZzhEOGF6SE1TaEZLZUVSL2ZCM09adUJLSDVzRHg5?=
 =?utf-8?B?cnkwTmF3TW81RGpncnBSMGV0SjNOeXZYY3pXbGQyOGJZSkpsK0VmaUhNN2xD?=
 =?utf-8?B?djYrOHNHbVpNaEtITU9palN6ZEhFKyt1VjE4QjBKb1ZNcVVYQ21MbFRib2Z1?=
 =?utf-8?B?WTBSa3JlSUFqU0F5SmtiVEw1aUMrdUEyelJMUEFUUVBoUWxHLy9SZy96ZnVM?=
 =?utf-8?B?V3VzTjQ0VkhyNHNjT3ZjYTlOK0lqRG81UzBSSS92L1FwV1hFbC9nMG8wZUxs?=
 =?utf-8?B?b2g4K055eDkxdEUzNVlpYWFnQUpQUmNKUGpsYU5FV05pYVZQWVZ4c2E3c1cr?=
 =?utf-8?B?dUVmS3ZHakpKQXRrQ1FmL3dpZVNqcjI4cFlueWZWcFFpeGJkeUdLRXpVMjlI?=
 =?utf-8?B?UnNUU3dLRDZZUXB6NE9YbHZsMGxPMXRvTVA2OHFYYVpaV2RYMlB4YkNEb0J5?=
 =?utf-8?B?bzJhLzIvQjFUQ203S2NEcjE1RmNzRG5oK1cvSmRldHJUMHIyMzZwMUZSZGVG?=
 =?utf-8?B?QmVZYUNWTWhkd1hNajNIK0N3M3JPcXRJcWZYRERWVlVZSSs4d1MyVnkwbXdQ?=
 =?utf-8?Q?xKSPK0GJpwgMqRO1tq2eejvDHK3wd2Fs11lu9ciOw7JzC?=
X-MS-Exchange-AntiSpam-MessageData-1: 72Y9oEwXzNp2OA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b90f40-eb79-4812-fcd8-08de7e7e45db
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:23:13.8067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Co+BGjfZrtVy+PD5BGQWCJfuqeg//083t7vSGyO7nI/6DXEeya2aFI9XamAmv2OsujmnyIK1m5DIuKdfm13uKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8373

On Tue Mar 10, 2026 at 11:10 AM JST, John Hubbard wrote:
> Move Spec creation, the dev_info log, and DMA mask setup from the
> driver's probe() into Gpu::new(), so that all GPU-specific
> initialization lives in the Gpu constructor.
>
> This restructures Gpu::new() to use pin_init_scope wrapping
> try_pin_init!, which allows running fallible setup code (Spec::new,
> dma_set_mask_and_coherent) before the pin-initializer. The parameter
> type changes from pci::Device<device::Bound> to pci::Device<device::Core>
> because the DMA call requires the Core device state.
>
> Also makes Chipset::arch() const, adds Spec::chipset() accessor, and
> makes Spec::new() pub(crate) for use by later patches.
>
> No functional change: the same 47-bit DMA mask is applied.
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs | 15 --------
>  drivers/gpu/nova-core/gpu.rs    | 64 ++++++++++++++++++++++-----------
>  2 files changed, 43 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index 84b0e1703150..e07f7122b35c 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -4,8 +4,6 @@
>      auxiliary,
>      device::Core,
>      devres::Devres,
> -    dma::Device,
> -    dma::DmaMask,
>      pci,
>      pci::{
>          Class,
> @@ -38,14 +36,6 @@ pub(crate) struct NovaCore {
> =20
>  const BAR0_SIZE: usize =3D SZ_16M;
> =20
> -// For now we only support Ampere which can use up to 47-bit DMA address=
es.
> -//
> -// TODO: Add an abstraction for this to support newer GPUs which may sup=
port
> -// larger DMA addresses. Limiting these GPUs to smaller address widths w=
on't
> -// have any adverse affects, unless installed on systems which require l=
arger
> -// DMA addresses. These systems should be quite rare.
> -const GPU_DMA_BITS: u32 =3D 47;
> -
>  pub(crate) type Bar0 =3D pci::Bar<BAR0_SIZE>;
> =20
>  kernel::pci_device_table!(
> @@ -84,11 +74,6 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInf=
o) -> impl PinInit<Self, E
>              pdev.enable_device_mem()?;
>              pdev.set_master();
> =20
> -            // SAFETY: No concurrent DMA allocations or mappings can be =
made because
> -            // the device is still being probed and therefore isn't bein=
g used by
> -            // other threads of execution.
> -            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_D=
MA_BITS>())? };

I think the reason why this was in driver.rs is that the method we are
in (`probe`) is enough to justify the safety argument.

Whereas `Gpu::new` can technically be called at a different time, and
the safety requirement becomes more difficult to justify - we would
actually need to make `Gpu::new` unsafe and set its own `SAFETY` section
to cover the safety requirement of `dma_set_mask_and_coherent`.

So I think it is preferable to keep this part as-is.

> -
>              let bar =3D Arc::pin_init(
>                  pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0=
"),
>                  GFP_KERNEL,
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 3b4ccc3d18b9..a7f1957880ff 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -3,6 +3,10 @@
>  use kernel::{
>      device,
>      devres::Devres,
> +    dma::{
> +        Device,
> +        DmaMask, //
> +    },
>      fmt,
>      pci,
>      prelude::*,
> @@ -162,6 +166,10 @@ pub(crate) enum Architecture {
>      Blackwell =3D 0x1b,
>  }
> =20
> +// TODO: Set the DMA mask per-architecture. Hopper and Blackwell support=
 52-bit
> +// DMA addresses. For now, use 47-bit which is correct for Turing, Amper=
e, and Ada.
> +const GPU_DMA_BITS: u32 =3D 47;
> +
>  impl TryFrom<u8> for Architecture {
>      type Error =3D Error;
> =20
> @@ -211,7 +219,7 @@ pub(crate) struct Spec {
>  }
> =20
>  impl Spec {
> -    fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
> +    pub(crate) fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> =
{

The visibility of this methods doesn't need to be changed with the
current code - although it will per the next patch if we keep the DMA
mask setup in `driver.rs`. If we opt for that direction, let's merge
that part into the next patch.

