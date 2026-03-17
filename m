Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA10E393DF5;
	Tue, 17 Mar 2026 08:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735669; cv=fail; b=Wi3y5jAUT6YajJkKCBGoRk53rqVXkJ8xtZHjcfN2zw2FVscJEjAFVnypmGaROIlLiLVo/AOcLHNAGkjNL9Y9dhGDZpE+DtwjnUtKab9UQREZ1jLHoAKKhqLKq1R8y1IbRzEnOMpIzUfWbDa9tl8ZOEwnAwEg6mDJQvYybTEH0TY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735669; c=relaxed/simple;
	bh=c5V7xSY/zFgoT0tq1FykeIBBmH4ufKBNAn7tQfZaeY4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qFTjTYI/p7GE2sDY07qrNYB0IV3n0IvPzvWh5NjZvWUOLdYNghspxLncBiQmfHabZLEOTrI9CipiNhzto/JaUkEFvROTywbVh9QvAxiAJBQ4C/qwM76vHBVxachHK7nCjKPGpXPhY78oyi18x7+4AcqKD4snK8ypUFK4wERDSjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XeWcjchG; arc=fail smtp.client-ip=52.101.62.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XeWcjchG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/ztOhHAU93dMVojTqP7dtfbpniU/zffr7RTY7JcNtPNqR/QuUS5XWKIAD//0WoA+3k7jApiET95gcCb2OCidNxgtNQ6ufebYaTBlqQVxK3tCj22NM54OwQp6oAwMXchBSRtSNA/57AXsjRIX+TA+8zXJ718mAkZBt5bYzbtQod4YAUnhTtXPZfVB4UT3z3on5O06pDsrHx6pG82j8sxTPcDk4Ov2NfbJhx3gV4h9/qIxEBe9lQebfFtb7dNfpSU+m+jyw8g2QZaJI29H6PoQFSdV6MQxobPLJl395mqIVBj0ZgifZeQ7TI43m5pSvT5v9IYmcwokYAxBf98b7ZlRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WqBn6jT/Ec+09B7krCZPcqGqIsZljH2bGZmYi3pBrg=;
 b=WOHezFLUYoZ4rzeVSWTREJ7cw+KfWTMLleiZ8+jjWoI6cs9KF/PuVNbbt08mkRbWMGW4lli24MGgXUGxf9xZmNIO687xpQHHXW+BtOar2HfxaRcdF8xR8S6zftxrVmSv/YxF6DMD562M3YMyPTp8Iyhjl0ktTpPAilE6IsgRLtGFUAHT1H3b30hcf3RCYYAa3CwKIaClPZXT6T2WYf49xQQPbW/pbrTH/OmMl3SzAqANpbfOgas9ttWBfxkBVLf36iT0d5De64PRaVvEyoacWvaUISUBQqr5OYN4fqRl7wNiVHWMp5SMZm9UcQ0Dv7wRUHpZqOtBgXkahafrVoLShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WqBn6jT/Ec+09B7krCZPcqGqIsZljH2bGZmYi3pBrg=;
 b=XeWcjchGwKSDjKYtGnSCZO9H3PAacDPMC4v9c7zYcTAp6bCzL0px1Ap8tQf0YiMOygUrw7vShhSfT1i+p9vjxUaqT0rncmIz4sHuN13JWjVsb3E1eN5T6OMRh6YYzU5WBpAPLx/DSG/WJmEeothJSRCGPCHUqtH5g24koSMWaoxMz75Hwp2JH7oST4KrVbAOIA3ezGnJ4cBHA+hsJ9xF8jsqi8chkxTd3IM1rAnPLXdZ5zNcsX0YAuOjsASyZRIQo/sKT6bR48IPWDaOC+E0Iz2j4XG6jd3ypSNuh9M7FIbDnW514UctAlLfwhrcGoQOTzp0eD1isUbRwBCkfma/5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8502.namprd12.prod.outlook.com (2603:10b6:8:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 08:21:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.016; Tue, 17 Mar 2026
 08:20:54 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 17:20:50 +0900
Message-Id: <DH4WT8UFJNN7.1K6B6AP1T0A6@nvidia.com>
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
Subject: Re: [PATCH v6 28/34] gpu: nova-core: Hopper/Blackwell: add FSP
 Chain of Trust boot
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-29-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-29-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0145.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa4ea98-a0f6-48ae-959d-08de83fe1b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yMi21TPzku0GSomPoSP/+bgVQ0M4aR/1MZGPIlw0ZF9YYZsrXTELA0luBhLpJ+EwguCZBJuuzGtGY31/3str1tZY6PcRvKiibnh6RqrMONMGuNJwyKWMMYYqw1x3Czcv11mL+MbmF776MZOga/T6hUFetS7Ss9LnC9q2Bofjd06g/k3xtM7T+2fAaZBkG0vo1tp+UKUwo3YC5APCFuw4m+8wlenEr2HKdXqkRr0LmiiePRvUGe3+IlxZ/GIwDfjk6KRZ1zseGjA0s6LfpyzpxR3SUwEu8nkrDeac3NBRMf6X6flYHrrezm1AZB1MhtH8EnM1MAGoKjjfLy02F0HggXB4bqIiJ9/d+8xrWXSf52IO4a86yUJWtuXkRXgBRUN7P3BYG66sDuHcxZgpATRaxoxS1VPbZrmcc46wZWINXhaPWhlArv78PJQ88elggSEqaAMpaPA6j+I7vscjv/nNNQki0gukxew0KcvWhqTTXjctuSAufOcc5+LdAAuVEOdUagZLzxu2afaYUEtltYmLDr9h8e1vFc3YwiqDHenhAPHfPVhP6RY//df44E+mRzPICCYKtKZ6YAI1IjKm2JaGByogEh31qPiu+oPctW5+yrMDaEbA71BA6uZxsym2LZVgO+ZzSfG/y7LDGQa4oltWoP+ZJiLz/mwuY71LmQ+X+P9kkjxwOKFGB6IX+o/HFnkhg60BD4OMM6jXJgKaasDF6lco++eTxTfaJpTIIC5zm3s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzRTRVJSVWNUWDZBblZXeUpEbGd4aGMzNnluOGxpanZMK0kwSG42QlZRMVRr?=
 =?utf-8?B?S1FNYXNTa0cxNVlsOEpWektENlVhclJNdVVhK29rTG1Tc2l3S09TanFic29N?=
 =?utf-8?B?azlIeFlxM2x6MEhjZkRieGJhMEdPaVVHNU5FdStvSlNvTTJ6ZmZUUVpGQVcx?=
 =?utf-8?B?aEtlRG56R1ZxRXdObk5pMWFuQkZ6UTIreDIrVDc3V0YzN0FtY0dCajNmNnE0?=
 =?utf-8?B?b3hPS09TYmswOXJISmk3Z3JjOWhnWVhDU2trbWdvSnBkeEhoVHVzREdFdkxQ?=
 =?utf-8?B?dHJQR2FpTzZkbXNFWlJUM2l6K3lhYUl5UW9YUFdtNVVDNVorZzc1SGJPb0FD?=
 =?utf-8?B?Z3MxYWpvSS9ndDFMRVl5SVhLWjBwUC9qdU01c2FtY1dnSXlKVnc0cTdwT1lF?=
 =?utf-8?B?NmE5MllYSlBISk9zbDcrRGNtczlsYkxSNCtHVHBTOEkvM1FMK2lEdG5sZWpi?=
 =?utf-8?B?V0N0UGxTNkR0anhJTUZ1bm05V2g0TEFGVEp5UXE3dndJZ3ZqcEdzNXpNNHIr?=
 =?utf-8?B?eEp1SkRGTnIrdXdlOUdTTWhMcGM1WmhxS3YreEJzNUhpVlFNYndNc096YTNV?=
 =?utf-8?B?amRmYjFvTGZFN3FIeXZyRWpjSmRSR2pRajFuNFdObzd3MDRhbG0vanBDemNQ?=
 =?utf-8?B?aHBVQ2FwOUZJSWN5bVJLaU1wcmRDQ0NCM0lrMzRVeDVkdnJGdWhGMXMzU1pK?=
 =?utf-8?B?L1BWV0Zic29YckZjZmFBWE1nQThIMUNCa1lWYWNldy9HczlhR240K1NDWGVJ?=
 =?utf-8?B?NVRHTEY2WER2a2FLTXJ5SXhYWGkreWU1Mk5RejdOQTlSdnBmYzdlcVJmNTQw?=
 =?utf-8?B?Z0NnRDY2K2pKUUk3dWFTYm9uN2NMK011Nk83UERaeFdrdzd4OFR4L0xrOFpq?=
 =?utf-8?B?MU9VZkhleFZOLzVBZ0RDRVdGKy95UEwwZERPamxucE03Lzl5cUhvc1hTL29B?=
 =?utf-8?B?Y0lKMk9wUnZHaWhzZnJXUWp0M2I5dEtOUWxSQkovS3hIVW5MUVhxdVE5Qmhs?=
 =?utf-8?B?b2pEeUtjN2xndm5vTkowRW05OEJqd0dkeHNyMHV6WWI1dzV6b1I5ZjFLNUxM?=
 =?utf-8?B?bU1NYkZYdVhpOVlZaTZiZERDeWo0dGVJQ3JLZklMRjdobmpwZVQvSE0wbmVh?=
 =?utf-8?B?c2UweVJmMk1NNFZrN1dRQkxCb1F6WjM1Z0xsZW02T2paTVBTWkY2TEczY1ZO?=
 =?utf-8?B?bUtLeUFuSzY5d3pMVWFKbmI5TUQ1bEQyL3ZUdkZTd1htdnJITkdpQTVqeHpG?=
 =?utf-8?B?ZWRKZjRHRU5vaXdSUDBkSEN4dzVxMTVxNGM0TmZJZVBZeEFieEV5UUFKcisx?=
 =?utf-8?B?cVluWnNRaDlvTWVDZzhTM0tCQTBYKzlYYmNENThjVkg4SkU3d2N2Q0ZlUVd6?=
 =?utf-8?B?bGFJOTN2ZThmcTRwTGFvMHZhTTN1a2JSNHh2SHg4akJaUXM1U3hJTnhEeGxL?=
 =?utf-8?B?OXoxYWZMZVUydUVlbkt2aXNnSUlFZGNWRkVZL2VHaUNVNU9FWTdrc1AxRkJR?=
 =?utf-8?B?eUNmTkRIdVEwcHdJTkdUci8vNVo4L3FZUGtZOGdWekNZZWVaVE53bFFFTDdx?=
 =?utf-8?B?TmxXV3dRWml1VTN4SGhvMVU1NWV3OUZUMzJMYlo4UXlZNWxBUWp0U3Y2RWNX?=
 =?utf-8?B?ODVXZEVOS2N5LzMvRjBLVWQwVEhUUzh2Y2FnbHNwRERndHd3M3M3anEvZy9v?=
 =?utf-8?B?NEFGZDA5QldteDlmZUE3Sm9KMjlrR2s4NVhCUDRpb08zOTJHUGxMS0M2eXhU?=
 =?utf-8?B?OG1pL3cvbDRFSm1USWVHaENQd3RyK3VGT0REUlJVak9BczFQV0E0L3ZwSjcz?=
 =?utf-8?B?UWs2RmVEcURwVFFieStnZWNXenU3c2pHNWlvMnhFV1hOWlo2dmRPZ2JuNmg4?=
 =?utf-8?B?YUFDRG5COG9UU3ZqYkVQYTVZcGVEbUtram9mdnIwQ3M2ampuWnRmcXBkaTk0?=
 =?utf-8?B?N1dWSXo5Ui92M0ptK1UwY0ZRLzhsN3Y2L3o3QVNVSXVDUTlQdEI1Nm96QUg4?=
 =?utf-8?B?ZjhFdGRMSG5jR2hxVjgwS09aYlhEV0NhREQyYStCMVBpanFESytxWi9HTGhy?=
 =?utf-8?B?eW5RUng3aWxZY0Y0c0syWTl2dkpGR01xRkJ1RFlvdzJGSmkrN3o3Z2I5U2x4?=
 =?utf-8?B?YnZ1cGt5eFp4NXQ2bURya1huV091RU53UTF3N3BCL3k3cHN2UXBwNEZ0RWg0?=
 =?utf-8?B?VG94VHhrSEcyTHFEaE5MditTQ3pTOGx3ZXhHRjQ0OFo1Wms3a0NSQU45S0dY?=
 =?utf-8?B?d2JROEFUdDhXSWFGUWFhRHNuMmhhYXdpQ1Q2cUNocXFsekVieDJOdzg3QUtm?=
 =?utf-8?B?a0xiRGJCaDB5ZmhkaWpERmlyTFpLNGhxWDVKVG5ZMTMxNWllczZXeVRTTnd6?=
 =?utf-8?Q?A104JJ9JdnMa2SbpkJ6xr7PpfMBa6clRIqaWToVnMgnz2?=
X-MS-Exchange-AntiSpam-MessageData-1: TzjP9Zbx2p086g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa4ea98-a0f6-48ae-959d-08de83fe1b90
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 08:20:54.2950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lo6+HoY2hJPH0lZPSluUreCq4w/njjFqOgaB3TLNtuF0R9RvdmRdOjNfobmo4lDfvpA6jpcdJv6pR9RMhr2DHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8502

On Tue Mar 10, 2026 at 11:11 AM JST, John Hubbard wrote:
> Add boot_fmc() which builds and sends the Chain of Trust message to FSP,
> and FmcBootArgs which bundles the DMA-coherent boot parameters that FSP
> reads at boot time. The FspFirmware struct fields become pub(crate) and
> fmc_full changes from DmaObject to KVec<u8> for CPU-side signature
> extraction.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/fsp.rs |  14 ++-
>  drivers/gpu/nova-core/fsp.rs          | 134 +++++++++++++++++++++++++-
>  drivers/gpu/nova-core/gpu.rs          |   1 -
>  drivers/gpu/nova-core/mctp.rs         |   2 -
>  4 files changed, 141 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-cor=
e/firmware/fsp.rs
> index cea9532ba5ff..bb35f363b998 100644
> --- a/drivers/gpu/nova-core/firmware/fsp.rs
> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
> @@ -13,16 +13,16 @@
>      gpu::Chipset, //
>  };
> =20
> -#[expect(unused)]
> +#[expect(dead_code)]
>  pub(crate) struct FspFirmware {
>      /// FMC firmware image data (only the "image" ELF section).
> -    fmc_image: DmaObject,
> +    pub(crate) fmc_image: DmaObject,
>      /// Full FMC ELF data (for signature extraction).
> -    fmc_full: DmaObject,
> +    pub(crate) fmc_full: KVec<u8>,

This looks like `fmc_full` should have been a `KVec` since the beginning
- unless I missed something there was no point in keeping it as a
`DmaObject` for a while.

>  }
> =20
>  impl FspFirmware {
> -    #[expect(unused)]
> +    #[expect(dead_code)]
>      pub(crate) fn new(
>          dev: &device::Device<device::Bound>,
>          chipset: Chipset,
> @@ -36,9 +36,13 @@ pub(crate) fn new(
>              EINVAL
>          })?;
> =20
> +        // Copy the full ELF into a kernel vector for CPU-side signature=
 extraction
> +        let mut fmc_full =3D KVec::with_capacity(fw.data().len(), GFP_KE=
RNEL)?;
> +        fmc_full.extend_from_slice(fw.data(), GFP_KERNEL)?;
> +
>          Ok(Self {
>              fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
> -            fmc_full: DmaObject::from_data(dev, fw.data())?,
> +            fmc_full,
>          })
>      }
>  }
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index 8926dd814a83..c66ad0a102a6 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -8,8 +8,14 @@
> =20
>  use kernel::{
>      device,
> +    dma::CoherentAllocation,
>      io::poll::read_poll_timeout,
>      prelude::*,
> +    ptr::{
> +        Alignable,
> +        Alignment, //
> +    },
> +    sizes::{SZ_1M, SZ_2M},

Nit: import format. (can't wait for the rustfmt support for that one).

>      time::Delta,
>      transmute::{
>          AsBytes,
> @@ -38,7 +44,6 @@ pub(crate) const fn new(version: u16) -> Self {
>      }
> =20
>      /// Return the raw protocol version number for the wire format.
> -    #[expect(dead_code)]
>      pub(crate) const fn raw(self) -> u16 {
>          self.0
>      }
> @@ -221,6 +226,73 @@ impl MessageToFsp for FspMessage {
>      const NVDM_TYPE: u32 =3D NvdmType::Cot as u32;
>  }
> =20
> +/// Bundled arguments for FMC boot via FSP Chain of Trust.
> +pub(crate) struct FmcBootArgs<'a> {
> +    chipset: crate::gpu::Chipset,
> +    fmc_image_fw: &'a crate::dma::DmaObject,
> +    fmc_boot_params: kernel::dma::CoherentAllocation<GspFmcBootParams>,
> +    resume: bool,
> +    signatures: &'a FmcSignatures,
> +}
> +
> +impl<'a> FmcBootArgs<'a> {
> +    /// Build FMC boot arguments, allocating the DMA-coherent boot param=
eter
> +    /// structure that FSP will read.
> +    #[expect(dead_code)]
> +    #[allow(clippy::too_many_arguments)]
> +    pub(crate) fn new(
> +        dev: &device::Device<device::Bound>,
> +        chipset: crate::gpu::Chipset,
> +        fmc_image_fw: &'a crate::dma::DmaObject,
> +        wpr_meta_addr: u64,
> +        wpr_meta_size: u32,
> +        libos_addr: u64,
> +        resume: bool,
> +        signatures: &'a FmcSignatures,
> +    ) -> Result<Self> {
> +        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 =3D 1;
> +        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 =3D 2;

I see these in OpenRM's
src/nvidia/arch/nvalloc/common/inc/gsp/gspifpub.h - can we add them to
the bindings?

> +
> +        let fmc_boot_params =3D CoherentAllocation::<GspFmcBootParams>::=
alloc_coherent(
> +            dev,
> +            1,
> +            GFP_KERNEL | __GFP_ZERO,
> +        )?;
> +
> +        kernel::dma_write!(
> +            fmc_boot_params[0].boot_gsp_rm_params.target =3D GSP_DMA_TAR=
GET_COHERENT_SYSTEM
> +        )?;

Note: on the latest drm-rust-next, this needs to be updated to=20

        kernel::dma_write!(
            fmc_boot_params,
            [0]?.boot_gsp_rm_params.target,
            GSP_DMA_TARGET_COHERENT_SYSTEM
        );

(same the those below)

> +        kernel::dma_write!(
> +            fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_offset =3D=
 wpr_meta_addr
> +        )?;
> +        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_=
desc_size =3D wpr_meta_size)?;
> +
> +        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_si=
ze to be zero;
> +        // it obtains WPR info from other sources.
> +        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.b_is_gs=
p_rm_boot =3D 1)?;

... or better, if we factor these writes into a single one:

        kernel::dma_write!(
            fmc_boot_params,
            [0]?.boot_gsp_rm_params,
            GspAcrBootGspRmParams {
                target: GSP_DMA_TARGET_COHERENT_SYSTEM,
                gsp_rm_desc_offset: wpr_meta_addr,
                gsp_rm_desc_size: wpr_meta_size,
                ..Default::default()
            }
        );

> +
> +        kernel::dma_write!(
> +            fmc_boot_params[0].gsp_rm_params.target =3D GSP_DMA_TARGET_N=
ONCOHERENT_SYSTEM
> +        )?;
> +        kernel::dma_write!(fmc_boot_params[0].gsp_rm_params.boot_args_of=
fset =3D libos_addr)?;

Here as well:

        kernel::dma_write!(
            fmc_boot_params,
            [0]?.gsp_rm_params,
            GspRmParams {
                target: GSP_DMA_TARGET_NONCOHERENT_SYSTEM,
                boot_args_offset: libos_addr,
            }
        );

> +
> +        Ok(Self {
> +            chipset,
> +            fmc_image_fw,
> +            fmc_boot_params,
> +            resume,
> +            signatures,
> +        })
> +    }
> +
> +    /// DMA address of the FMC boot parameters, needed after boot for lo=
ckdown
> +    /// release polling.
> +    #[expect(dead_code)]
> +    pub(crate) fn boot_params_dma_handle(&self) -> u64 {
> +        self.fmc_boot_params.dma_handle()
> +    }
> +}
> +
>  /// FSP interface for Hopper/Blackwell GPUs.
>  pub(crate) struct Fsp;
> =20
> @@ -315,8 +387,66 @@ pub(crate) fn extract_fmc_signatures(
>          Ok(signatures)
>      }
> =20
> -    /// Send message to FSP and wait for response.
> +    /// Boot GSP FMC via FSP Chain of Trust.
> +    ///
> +    /// Builds the COT message from the pre-configured [`FmcBootArgs`], =
sends it
> +    /// to FSP, and waits for the response.
>      #[expect(dead_code)]
> +    pub(crate) fn boot_fmc(
> +        dev: &device::Device<device::Bound>,
> +        bar: &crate::driver::Bar0,
> +        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
> +        args: &FmcBootArgs<'_>,
> +    ) -> Result {
> +        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipse=
t);
> +
> +        let fmc_addr =3D args.fmc_image_fw.dma_handle();
> +        let fmc_boot_params_addr =3D args.fmc_boot_params.dma_handle();
> +
> +        // frts_offset is relative to FB end: FRTS_location =3D FB_END -=
 frts_offset
> +        let frts_offset =3D if !args.resume {
> +            let mut frts_reserved_size =3D crate::fb::calc_non_wpr_heap_=
size(args.chipset);
> +
> +            frts_reserved_size +=3D u64::from(crate::fb::PMU_RESERVED_SI=
ZE);

Let's use a checked operation here.
