Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC0D1C860A;
	Mon, 23 Mar 2026 13:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270985; cv=fail; b=jTdk7k2HYxhUufEjUGyRbqXMxJU7Eyqwi5jg8mVRqGddA4rpWjGeU68BblNKuo/3PLwoQkuuJoLPL1gYcBlCSrqtnY6gvfN1LEfNMLiOqsBdSkEtD66Pgud+lY1KODQBoQJtlayjFshe4mjZTzrnILdAgwZf6jmiRShE/c3/GNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270985; c=relaxed/simple;
	bh=gO1PmlSY2HI8gdPM+QJths/Lvw/vnF3hMjgnMhahoXk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=XE8vpRqEsvA7jmJx4zb1Uv0Pfkd1Nrm2D1XjRlQeTvBVmDcVi1oGFeCDRyKgJ9TJphv5MIdHkazsVA8tLAQDjj8nuGy/vtUM+4mpUG6xk3dlqIJ8IbImNocAiOXbxRF/Z/KUwDf3XmAuKL1L4RGRJBa7mTmYgizPCxdCLUa85l8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dvXuH3/m; arc=fail smtp.client-ip=52.101.48.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dvXuH3/m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnmxTiHsXvz+HUrvutB9ap2EZAxz2CutAwjVF8Ljtq5OtPyr37rwTL2C5QCbchgIKT7Vy6HIteYoRA12xAS7WHru6wyAP8m6bHgpy4RqX/pLIdBxxBNiVM2K8jHaOPbjWLtOYBOByTpeeVPhj7ACsON/jcY6xcJxp/Q5uKzBkfhHg8egdf7nh8LiyA4nbSOy19YMI2AUfs2ADiwevleskLzeRLAy+9/67esbd2OHOiDEZl4LhHb/qGJDkjuvEbsDLAe37ONZDB8rWZOZ3dqZ6i+PRRq7/GhFme59KwpBVn9yto9u0Bhf2W5C8+9LPFui92UMlb4hZnk1q94o2lAsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjkiTGXqn8lgkRRp4PvRMMSkBGe2IT+IS+fDgiImSTE=;
 b=fv6gVuZE7Gzpu0TJuVlAdSiGSDqQIKIbCkJ4IofT6XieOkrIJ0a8+Xld6N2D35r7QXJvAWENenLUO6/6CupdJWYaivF4AA0C7EIbHRBTHxv8fBCQDb3n/CY5V3uh3XYJbvvmeL471cjczejFhCqYCnX3MCu4ct/l2hZmlHYjI+uwNdddxvv+Rs1GwVyq24JpbqfrYhM4FjmaJjjHQUfjcER7CRntnDlGdEEl+wPrIkMU+qFifoRt8m79w77xWTKFkYLEqTF+CxLUAzCTQ+7QZ8SoZKiKW23JxrG1FsTEzT+Oj9ppYia0lwJHqtL9VPfrOVFLLRpvYB65eDGgY2OVyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjkiTGXqn8lgkRRp4PvRMMSkBGe2IT+IS+fDgiImSTE=;
 b=dvXuH3/mEbHrkFvBqXLOn700Y7iqS+nWFGUQsq5RKk4jL4vUGjrMRDqt6XLbNEU5tnO8Lpji66yYweGn0YgjI2zy94HPbREjNqt9voKzxELhDqJSfbrNyk+kWXeU0Y7MzkZ6BGQMzhw8Tapfe64iXUEo+7ZU1849vUeWLz2OhsWgJgUzani1babyOOPsh2sa0B69Ws3wVQ2jvYmzOkfvjud4XjEv++7CSrQ/umeKAOmxVjG5M6W5GPKR7evQyw/RJsd5cYc7AUKuLpQqDxJLKYrmgNp5u7r7E5e9ESIoIHEFF5OJhI99065gSHtNgVY2k7ol22D7t26YZpfaIJ4vvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8850.namprd12.prod.outlook.com (2603:10b6:610:167::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 13:02:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 13:02:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 22:02:47 +0900
Message-Id: <DHA6KDURL8OU.LW9IJ5G6SWFN@nvidia.com>
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
Subject: Re: [PATCH v7 05/31] gpu: nova-core: set DMA mask width based on
 GPU architecture
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-6-jhubbard@nvidia.com>
In-Reply-To: <20260317225355.549853-6-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:405:379::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8850:EE_
X-MS-Office365-Filtering-Correlation-Id: 085e2116-7465-4d25-75e5-08de88dc7d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	J5YLJmYLp3fd/2+e58PkTg74yikeuiJQFrA4a4iGuegmJNOdTZSCtOkOzg6XxnD5bHKj+zkjxqBoxu3ZjgLc/Fn7RBlPJ+Z/ylarPXE33YMvibfTF3De51ok12gvAG9JghxcH98G3p+joXUmgOZSSQlRp9Z1YOZQY3KYLdLV6Lim5KwgUC92o/tAovU0KlHnlIHb1hHe/e1NTJgjaVg65Gx6uecE/4L9HWKHnTga3rF2bk85+IpKeyq27tuC5cCbsNzRQNHM9vpcgbwzGNYDf9JwV8k18xtkl0DoAcTPSwWeXcRQ11U2ENbPqTEmAQoNVkhbvxzd8Pfl9xaeUtKDicnZR02ld8WmuyrquV7GCq7OXSackkAm9KLZbsTrs1dnNL0Eus/sIWzWcIu4iDJ/OaN8cvOjPY4YHdeH//z21IV9W0n/9x5hOZGsBnLFSCao4JGMwDysJHfHU0JAyQuaswtbQZbW+5ISJRgqJ5xMKjt/VBJW+SPsEDe+UP5z1avOBSjHIQusmIqHEgcBeGpimpWYLQR9JEapq0wj9+GNoIYEx8T+CSuuaXXQXMVZTQwX3qhFSf7eQIfM3iSIZhSiYrOPx1f4m9GWyTvRYjnqz5OYhE4iA3IILyT4z/oi1sbBfXEUSLHsY7OdAUcBydwM8xOtR6oseUu0VXp18By9nEJAYqvnDmhHHQufs6Tp/Fm6G1KaLl1+KBOpnK0LPfi/kI1mKrrtn6Gm5+AeAHh+7uo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHVRRVdtR1ljVm96RHRodm9OVG1TQXUvNkhxWld4S2xPU094eU1lbkJXSnhz?=
 =?utf-8?B?SEZwc0huQVBUZ2dmbVgxQm5ObmF2eklVOWNrdUlQSCt2USt0UDFyR2l1UlZz?=
 =?utf-8?B?UCtlSzNUTHJLWFZTc0V5T29xWGlyK3BjVUw4cFRsTDAzSVlTMUlGdnJSb3pE?=
 =?utf-8?B?a0x1Um9NMXlyeTFTZTRiMFZFSUlDcmJ4QjZ6b0E4blVYd3NCWGFhZUlVWXdx?=
 =?utf-8?B?QkhBeUxieUF0K29TV3FhY3kyMmVOeTNYQWMvSmV3NVErYnhCNURva0tEN2t0?=
 =?utf-8?B?T3Vqb29PNTg0YVRaRHZHYitnc0hHcXB4MUdUTUNZZGpUblZkTjdoTWNJenRw?=
 =?utf-8?B?Q1AvNEF3STVaOFduQ1VLSDIzQkFUWVBNazFqU1hHbHpLNE9qbGlocEkzU3Zw?=
 =?utf-8?B?akRpWkdOQmY1ZzFuUlo1T2FrNVFpelN5VU5aM1JzWVo1N3ZldEFVRWEwNk0y?=
 =?utf-8?B?ZDRUalF5TGdqTVVyQjNUdFZJN3NjVlRNaEJFbDhPNGpOdmkzc2VqVUMyeFp1?=
 =?utf-8?B?THVGTjNoSUZYdkpySi9rbjJlY0hLOEVkcXdrVitIMVJkdzBBWGoxOHlybXpJ?=
 =?utf-8?B?ZnRHU0N5WVN1Nkl0QWVFdjF4K2ZTRys0UU1LRDh3TW44emYvK2NrK01Ca2tF?=
 =?utf-8?B?WWt5bUREME5jTHVDUUdHbkFqdDJCOEJxQ1ZMZFcwS1E1YVRPZEd6S1FXSW96?=
 =?utf-8?B?UkdNeE9BTEU1VU1SYVpwbzk5ZzY5cU4wYzU5Rkdab2JkZlZBcEwxeHk0Q0xZ?=
 =?utf-8?B?RHBtaFRyR0NseVcrSjRmWGRsSnlwelUvNC92ZVNaTUVyMnVqNU12NWdmYkM5?=
 =?utf-8?B?M01YZisraml2bGNMQ1JvT256My94RStqRWtsd1Z4NXFPM0NaaHJQR3c4NzRG?=
 =?utf-8?B?K1Y4Sm0rL2xxVEk5MXVTWUZhR3BxeG55MS9LaEJuOU5JM3hDWTJOT204TmVw?=
 =?utf-8?B?S0VOdUJmS1lMVDEvV1lncmFhZEkxaWYvRUNBMHZvMXZtZXJ2cEdvZTRFK0cz?=
 =?utf-8?B?cHk5elU1cWZod3dra3VxMnBid0dZMnlldzhiMkZGS0JrOGo3K21ZSlVDSHlB?=
 =?utf-8?B?ZUZlSGs0VVBaR3lpcEZrdDlGeVVxTnlDdWN5dFlaNFE5Q0xKa3RpRDkvcTJW?=
 =?utf-8?B?OHRDNXVyd2dkS1ZDOTlqL3VWUmk2VFhMNm4yUUlmQ01oalpjT2Q2U3lUandO?=
 =?utf-8?B?Z1ljckgxVCtjRWhCU2gxSFBodTNzSWoxZC9BMFltRGlwMDlQQTRhSmV3VzBQ?=
 =?utf-8?B?NmM2SjJzOUJSK3NQQlpKanpiRXFaa1BDdk5IcmFTUUhJdWdJWFJTWnUwOHQ2?=
 =?utf-8?B?QmFuM0RUOVFIQ21SMHFaUzZzc0JTRVpzOGFrMExoWkpsc3BLcGpXdzBydnBY?=
 =?utf-8?B?aEpSK2Qrb3lWcWNmU3MzRyt3dDIzcERIR3BiTW1kTldIWnBuYzNZdzVNRWNx?=
 =?utf-8?B?TGJ1bGVLYkRycmlKTHFYWnliRG5DOFRhRVptaUMzTUdORTRwTXNyNHBiSzY4?=
 =?utf-8?B?OUp5UUlVWFJlci9SeXRhaXZ5cTF2bms0NXAxVVBQVkp1Y0hUaWpIUitSVnBH?=
 =?utf-8?B?SlEwVkYvdkw5TVEvL3pmTHB3VlhEYTZGdU9ySys5QXpzSGtpL215LzJibmFx?=
 =?utf-8?B?UVNUOHVsS05RYXdzNHVKcFVYbERVdzd2cldvQXk5QkkraHdBN3dhYmlnZ21G?=
 =?utf-8?B?L1Fya3RKS1VoU1FJbGUzRnNTWWhtVDlmc0Fnc2NHRytUMjR5NFZxSytWMzNK?=
 =?utf-8?B?eWxwSHFnaW5qS0pQL0RiUlpjNmdpNXBMUm93eFNxeGhVSUVZa09hYmt2YnQ4?=
 =?utf-8?B?dXhRbHBhQ3hkc1Y1aXJkRjlEZnR1dzZZSTczbVpMU21DUEFFLyt5K2owM0Nl?=
 =?utf-8?B?bUduemM2Q0xSSGczOHVyR3VjckdKZTBrWUdORU53K21GeDloK2NWRlJDYnVM?=
 =?utf-8?B?MmtzRzh2NUNUYlNrQ2NxOE9yREdlRVJZOGQvWFpzQktXOUxHREdqRi9ucWtG?=
 =?utf-8?B?THBPODduUTdGK3FDU2x5WlQ5TlVmaGxKa0ZZbHo0MCtQbWF2R21Nd0JYak52?=
 =?utf-8?B?OU9XbTU1VmtIdDl5MVVORzc4ZXNsanYyRzdYQ2FQR21pTDB4Yzl2VmFMMGpZ?=
 =?utf-8?B?eEdXTzI1Y3JyWEpzNGRrQ0gxM056OFN0OGEvNFlPN3cvVEw4T0llLzFha1Nu?=
 =?utf-8?B?YjloSGRJNjNBUnlUVnE2SkE2Q0tjU1lHOGFpd3RHbGtQYzJNSzUzdGpsSDZw?=
 =?utf-8?B?Mjg4WWhWMzdwcGZ4RkhUS3BIVlZlYWNodTRJTXY5SisrbVRGeXpEdGVaZUpV?=
 =?utf-8?B?K1ZLeG9vNHh4ekcyT2VWTnlJRW0weVZoQjYrdTJFVTdsdVB3NWpMOUxya3Z0?=
 =?utf-8?Q?4LJ+Bd6ZpOUchwLKw/ImqrosnK1fKpxjqU+7euBRyu0ix?=
X-MS-Exchange-AntiSpam-MessageData-1: +pPwciN+5S5WIQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 085e2116-7465-4d25-75e5-08de88dc7d16
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 13:02:50.8288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0+J3sxMwp775yVOW/+z0l0vX/iI8mBvJ4cKAevfkIHApigWeTvrJV9SFs9GDzsVCBZzbOnbuRCvGHXd86v8cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8850

On Wed Mar 18, 2026 at 7:53 AM JST, John Hubbard wrote:
> Replace the hardcoded 47-bit DMA mask with per-architecture values.
> Hopper and Blackwell support 52-bit DMA addresses, while Turing,
> Ampere, and Ada use 47-bit.
>
> Add Architecture::dma_mask() as a const method with an exhaustive
> match, so new architectures get a compile-time reminder to specify
> their DMA mask width. Move Spec creation into probe() so the
> architecture is known before setting the DMA mask, and pass the Spec
> into Gpu::new().
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Gary Guo <gary@garyguo.net>

Why the Ccs? Some patches in the series seem to have random people Cc'd
to them.

> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs | 28 +++++++--------
>  drivers/gpu/nova-core/gpu.rs    | 60 +++++++++++++++++++--------------
>  2 files changed, 47 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index 84b0e1703150..41227d29934e 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -5,7 +5,6 @@
>      device::Core,
>      devres::Devres,
>      dma::Device,
> -    dma::DmaMask,
>      pci,
>      pci::{
>          Class,
> @@ -23,7 +22,10 @@
>      },
>  };
> =20
> -use crate::gpu::Gpu;
> +use crate::gpu::{
> +    Gpu,
> +    Spec, //
> +};
> =20
>  /// Counter for generating unique auxiliary device IDs.
>  static AUXILIARY_ID_COUNTER: Atomic<u32> =3D Atomic::new(0);
> @@ -38,14 +40,6 @@ pub(crate) struct NovaCore {
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
> @@ -84,18 +78,20 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdIn=
fo) -> impl PinInit<Self, E
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
> -
>              let bar =3D Arc::pin_init(
>                  pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0=
"),
>                  GFP_KERNEL,
>              )?;
> +            let spec =3D Spec::new(pdev.as_ref(), bar.access(pdev.as_ref=
())?)?;
> +            dev_info!(pdev, "NVIDIA ({})\n", spec);
> +
> +            // SAFETY: No concurrent DMA allocations or mappings can be =
made because
> +            // the device is still being probed and therefore isn't bein=
g used by
> +            // other threads of execution.
> +            unsafe { pdev.dma_set_mask_and_coherent(spec.chipset().arch(=
).dma_mask())? };
> =20
>              Ok(try_pin_init!(Self {
> -                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_re=
f())?),
> +                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_re=
f())?, spec),
>                  _reg <- auxiliary::Registration::new(
>                      pdev.as_ref(),
>                      c"nova-drm",
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 8f317d213908..9e140463603b 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -3,6 +3,7 @@
>  use kernel::{
>      device,
>      devres::Devres,
> +    dma::DmaMask,
>      fmt,
>      pci,
>      prelude::*,
> @@ -162,6 +163,19 @@ pub(crate) enum Architecture {
>      Blackwell =3D 0x1b,
>  }
> =20
> +impl Architecture {
> +    /// Returns the DMA mask supported by this architecture.
> +    ///
> +    /// Hopper and Blackwell support 52-bit DMA addresses, while earlier
> +    /// architectures (Turing, Ampere, Ada) support 47-bit.

This last sentence is unneeded, we describe what methods provide in
doccomments, not how they do it or what the result will be.

> +    pub(crate) const fn dma_mask(&self) -> DmaMask {
> +        match self {
> +            Self::Turing | Self::Ampere | Self::Ada =3D> DmaMask::new::<=
47>(),
> +            Self::Hopper | Self::Blackwell =3D> DmaMask::new::<52>(),
> +        }
> +    }
> +}

I see you introduce a `Gpu` HAL in the next patch. I think this should
also be part of the HAL - there is no benefit in having this method
const since the architecture is probed at runtime anyway.

> +
>  impl TryFrom<u8> for Architecture {
>      type Error =3D Error;
> =20
> @@ -211,7 +225,7 @@ pub(crate) struct Spec {
>  }
> =20
>  impl Spec {
> -    fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
> +    pub(crate) fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> =
{
>          // Some brief notes about boot0 and boot42, in chronological ord=
er:
>          //
>          // NV04 through NV50:
> @@ -292,38 +306,34 @@ pub(crate) fn new<'a>(
>          pdev: &'a pci::Device<device::Bound>,
>          devres_bar: Arc<Devres<Bar0>>,
>          bar: &'a Bar0,
> +        spec: Spec,
>      ) -> impl PinInit<Self, Error> + 'a {
> -        pin_init::pin_init_scope(move || {
> -            let spec =3D Spec::new(pdev.as_ref(), bar)?;
> -            dev_info!(pdev, "NVIDIA ({})\n", spec);
> -
> -            let chipset =3D spec.chipset();
> +        let chipset =3D spec.chipset();
> =20
> -            Ok(try_pin_init!(Self {
> -                // We must wait for GFW_BOOT completion before doing any=
 significant setup
> -                // on the GPU.
> -                _: {
> -                    gfw::wait_gfw_boot_completion(bar)
> -                        .inspect_err(|_| dev_err!(pdev, "GFW boot did no=
t complete\n"))?;
> -                },
> +        try_pin_init!(Self {

What, and now we undo what we just did in patch 4? 0_o; What was that
all for?

I did a `git diff` between this step in the series and the state two
steps above, and it seems to confirm my intuition on patch 4: you just
need a few more `Copy` implementations. They can be added in this patch,
and patch 4 dropped altogether.
