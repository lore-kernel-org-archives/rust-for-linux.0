Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012047.outbound.protection.outlook.com [40.107.209.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D7B149C6F;
	Fri,  6 Mar 2026 01:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772761381; cv=fail; b=vD3mle34goH2Vu7VqNHETWY6Q0rBzYapMXvSUHcPcSXj0S8eGGBxEdJpyBQxnrOSpy8ts/3JTF7gw/4kpczGuSMpOew7/S1v/NZViRho7J2eks6ybwnoxzc2KSrGa6pLAKxUXwulIMCPP/E987iyM3XREeQhcqKO0FrpVm7Se8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772761381; c=relaxed/simple;
	bh=pL4hMUQpbfYV2jRirUNJZFhy9fK0aA4wbNLBq4yu4AQ=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=LjTCXfUX+q15OR7oZHmD3cdXaukV5NNVdrY6qgXuk0A59Y/j6GOsmFvpAG7gTtE4WNAnh7IOugnfamNOXaGuKE5oBs3cQYeOUbtoPACB2ZUhAG9M6wSxlym4heunYNMkIkDWUoNXR07uT5ezZW2EkGaryLfOeWezlin0uu3+WAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rac0SCUC; arc=fail smtp.client-ip=40.107.209.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rac0SCUC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llVozsM159yloOJ32npxpfQKS4uRzaJCiDIsJA0Byq7THz9hrxZiumpJc/3kAVKjOXPoO2ipbAH5AiL6yoaquIAwdEfONpKjF5uzVAeb6418oIzv6nm30xSUZ/2e40CGB4tDKDL1mwpj5lEW5/Abvk3RI3DYvtdTpsc1Y4NmwgdlU5KghaZK+Fbev3+uy6K6aBS+RWt/D5xEpO630B6c8eNTt4uZJQSQfjKzoksHs8tuL/x8t/+hnN8boaUMWLLO3pl0/qNVHSn3Rfbr/CimEj2mL9M49eOalK3de7/iXXgEPegV5LLW7EkxcoJoKIJmkezwnorHDTbE8pZwaWpkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFd09ET4A+DcN+Yztv60YLLTNhqk8TaItcHImIu6Q/k=;
 b=w0Mr4s7mPtfvQOyT2d9zNv7iZbwoMgxQqCGrHSSDwc2fGPY77J28zjXXhTiy4Tm/3plWszuHxrnB9QgGaDIC+MZaDT743yLv9ZawXnV/k+Ik8TtcrwYmln40eJJELXzi5Mq9/vAuTcbCWLx7bARAPJmTWZpMyrpdVpkU/D6pzes2SFmvnjMVIBFwYNJv9AFSjNUjyt8c5EKMDUh/toC1Sq7ZWTkxylxOLR2Co5s4AzsC4xURo0zmODXNJHuZ0CfxnasagWMCGz/VxvkKjs1xjciUjBJOmZ5UX1zLt0q87mxgB9GSrFho5z671a/rfhEHuZN6UB8A/aIVYeexOjC9cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFd09ET4A+DcN+Yztv60YLLTNhqk8TaItcHImIu6Q/k=;
 b=Rac0SCUCz4bIZDbsQjGM4K9EakLviVw70w8AWlkYSQFd5hOE8DljCX/InJS4o4pOHi92kgxZ7J6WCqpHAi+fNg/rIuZxsaaxw84dUUuc69/JJiB7S9U5j+NVOsx7tKsYcGVGcuVjgS1+lJRQU4bUF63ueQlOcB8/7yQwno2vhSOLAtlX81plbygY2FKvXF2XQIrNB7Ptykmp4jUucoXv1LrRr880EPC1ck6aMzU5oB3t02We0aj+Zkg90tT+7jxhnBfofDPqOx2BvvG05YzDU20fVybgVaQXOoADVdRyJMEoPelX13w+EX96cQIYIKcVP8y7jhwvRkQaATrfHtWbtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DM4PR12MB7648.namprd12.prod.outlook.com (2603:10b6:8:104::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 01:42:55 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 01:42:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 10:42:51 +0900
Message-Id: <DGVBGJDA4MA7.310TVZ954YCRP@nvidia.com>
Subject: Re: [PATCH v10 02/10] gpu: nova-core: falcon: add constant for
 memory block alignment
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-2-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-2-dde5ee437c60@nvidia.com>
X-ClientProxiedBy: TYWP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DM4PR12MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: 59dd65b2-f3df-47ea-a3c8-08de7b21b043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	dx1WC8U+e5pEVPAwDYyRVq8BuNguA8SZCN9DhG6+o4YIsTziFQhP+cNJA9AONJswSOG1ve8w8MSmF+5H+RmFp6nIWRYweQzJCmtKdizDkjmuPh5r1w7EfA+hkumH8aQabyNdsj88TKRiVjvAEzMJwQaTteC7FenYcohVsHNsVa0MEpAfagXbVeSDF1FO9UR5WaJDVFsZ+9yeZ2lhVBORhsQgqw+puIY8/yQruTaa3fgVanyOAGnVI9AsATwGnaB2FPOzAK5sX/Ccp0jef76V9WiWq3wbE+p50o82hnKznQDYStEiqepVyA02mDOAWuugW9LS18I/pGfRw5DDz985QN6Q/FKU6l76jY7n6nKlzNouzPZ9HJpGqV5AMmDpDU8sRPmVmjLaHddjYUv3bQU8swqiBnOAsNTiYhcb3jEpE/IUOnpytno7k/PcZTJoKd6oYYvswXkOfElM4DOS63DALDtod5hULfxXi+rxNxstUXDnPfylYFlS660LfcwuyRJ0Q2KFWopDwpCpRdvCjohxbTYlA1yab3QXpZ/A+RDG0b77GuU+pYu+GBxlkDKjhAHWkK72KS7BF7OgYLtWYLskmA46ij0lTH6OrwD/u66ShTnebuL335m7x0Ak0TqOrKdjqwIa0OhVThLW3qErF8wYC2b4+9vcEBtU1V8MFGougV6G4Fe3FjefYTTzV19lvK+OUuj6lPcnCPbPZKkcHt1VP/LPZfE3KpbjYNYYC3DAYBE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1FjTUZpTWN3Q0gwTENEWTdtMFZaYUxJNUlCZlZHamViTm54OGVPQVRpZExV?=
 =?utf-8?B?ZHphUGI0NHdiL2VyR2NxcGNMZHlXYU83ZXVsSFdhRnhvY0hHUXFoVm5wUFpY?=
 =?utf-8?B?eHZXT0RZOWdOeW5lQll5QjRDS2FIL3FKSHVDV240TktWZlQ3aklualF1azV3?=
 =?utf-8?B?dUcxN3VRY2E2WXdvYXhpWksrVitWOXgrenRncjNmR2xLYmFKRnNyWUhZWEpj?=
 =?utf-8?B?cFlKT096cDJEMGVUaTNDMFhBc05MdVhzSm96OFEzbUpkclJSRDBpZW1RcldX?=
 =?utf-8?B?L1M1UGFBRFozeC9FZmJTdktYK3lGUWZnY3M4N2lEUVVtSGl3TWhSZTZXSWJC?=
 =?utf-8?B?ZGdocENCWVVzQUZEVDl1R1o0ZkdzbHU0UzRuWVU2VWxFaUlOMThuUzVIK3Ry?=
 =?utf-8?B?TDBCeThadGVFZEErbVd5Q1o4K0F3ZGNXQm1WRkxaclh3Zkc2NjM3VW1qMW9N?=
 =?utf-8?B?REtVa2J2TElyQnZXa2ZTUno5dWRDaFU2NC9vRHk5TjljMlVkcDd0bGdWQ3BH?=
 =?utf-8?B?NXBQS0xCQTloQ0Z4L3krNTR5WDIyQjRoTkpDWWdLU2ZXVmIyR1g2SmxyRTRs?=
 =?utf-8?B?cDVpTjJsVG56dnhScWhhN0lNS2lmVE9mNVhMekxxMnBNYk9qMzlvMk1UOG5x?=
 =?utf-8?B?c1Y5YytnYnZnL09hYUlRcTkzc052NGdzNG5TV20wYkJFRWlRNlhubTlwMDVY?=
 =?utf-8?B?T0ZSWFFreEtKS2I3NHhoTG9YSW5acjFQUzNmeXU2TVV4dGpaK2p0cE9RNW82?=
 =?utf-8?B?Zk5mQ2hzWTFIV05MRHE3MGFoZTA5bVJDcVlpczBYaUt3Vit5MVBwYmp4ZmYr?=
 =?utf-8?B?MG1SN0VIQ0JRSS9HZHRFa1JFNytweFk2QkcySGxkSEpaRnBDTTdkb0ExQlVt?=
 =?utf-8?B?QUNOdkZNT2pLNkZxSy9UUzZrbU1VYVdvS0V5WVhqbVRMbE5sQWVYV3VnZURy?=
 =?utf-8?B?VExLdTdrTmtnQU9wcGR2RXBBa0FjTTkvdFh1QzRGaE41MGZaYlpEb1RYQU9T?=
 =?utf-8?B?V2JlUUJuMHRmM3p0aHo2WmcrMnNKTmdnMk5iSkwvdFlBYWEvV214Ym9JUlFz?=
 =?utf-8?B?UUVQSjUrRDIra1ZFSitjbEhWYzNZSHNSelhIYWI4UlJjYjlWWWR5QzZOdW90?=
 =?utf-8?B?QTB0Ukx2SWsyNVo3SVluWjByMXB1VnZyWHkvMy9XNS9tSXNuSlRlQVRuRWNY?=
 =?utf-8?B?SFFjYWp1MGFwUmY5MUtwMFo4b2NrRWk2Nm1jT2F3SC9iYjllVWhKeGhpZzJN?=
 =?utf-8?B?ekFHZFlwUVdrVnRDWkJXLy9vOVFYdVJKeEJ3cVErSTlpa1NOODdYcmRPTEV3?=
 =?utf-8?B?cWxmQmRabVQwTERHZjEwcVFqTlJDakhzOTFsY3ZIS0xRVndOQmlJYmZjTEdP?=
 =?utf-8?B?YUxpWjRtNW1XTGh0NUt0OFRMa0hoVG8zTGVQbjJ0dGR5eUlibFNTU0x1WEpN?=
 =?utf-8?B?eTV4TGFpZ3AvUFJIREpsMTB5bHc3bGNJSkFMcnE5ZmtUUGtRQVJSNkRjVWdT?=
 =?utf-8?B?WVY0R3R4bURSaGoxd0c3RlVwaTNhNzl1NTdQcHIxYWRnbzFBUHhDZ21DM0c2?=
 =?utf-8?B?NndQc2NxblZRNjNqQ0N4SVNLdE80WEk3eWk1aXlLa0d3OE9qcWl4SHZpaXM0?=
 =?utf-8?B?TU1KVXRZVHF3dVV0T1dzUzFlWVNkVVB5OGFRZlBRZFgwNU1lMTBadTR2TzI5?=
 =?utf-8?B?c3RPRUV1U2M1UWo3REI3QldEMUM1WWMxZk1DcXlvYmdNQTNPaEUyY0ZFNlBQ?=
 =?utf-8?B?NHhCcU1LQ2x0Z0xOYnZtK3hnMm9mcjlwYUZFcmNQTXlyVnkzcXlxTGM4UkFB?=
 =?utf-8?B?OTl6RWxmSGVSall3a0NnR2NoMVBNZHM2cWxOQjBmT0ZLQ2QvMHNaRG1wRVVu?=
 =?utf-8?B?QmNlR1NzYUtzZExxYU1pOGRQOTN4TXJEdjJLS1N1eEliWHpKWVVWRXVSVlcw?=
 =?utf-8?B?bmJWM1h0N3Y3MzhNK1Z1NllmelZINVc2OVI4WVkyMmpuVHR3SzU5SHJxSmlq?=
 =?utf-8?B?SS96Y0JacXpEdmkrN2Y3UmNjWEwzcTRGQ0h1eDVLODU1eVg3cERHb2lISmhI?=
 =?utf-8?B?WTFvMmNmaitLVEN5dlhZNkZYcnlmMmFDd0EyaGRYQjZLOEVFUnBFWWZSWDgr?=
 =?utf-8?B?UE1oQUxlLzh0cnN2a0x3RXllWm12cUxXdGt3dGx0RitMdS85OVRQN1BJckpw?=
 =?utf-8?B?ODd3cFlYZm5yLzlhWGFGb1hLTFpXbTFleGFTQ0NqZGlvS1g0VmZsUDdocjMz?=
 =?utf-8?B?MGQ5WTBWYlVkV1NaejV6RVhrL0YyMjJLb21palRCSmUyL3FaZ0tYcmo3VzFY?=
 =?utf-8?B?QlRzNytzOW1EakJCc2N3cDNkYnU1VThSR1dlUmlJN1JjMStzenJzQ1hVT092?=
 =?utf-8?Q?dLj7bXbe4P5O9guhMzP6hh6diDpbCG7pug0PalC8AdUoE?=
X-MS-Exchange-AntiSpam-MessageData-1: ciR/MDmcZ53CjA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59dd65b2-f3df-47ea-a3c8-08de7b21b043
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 01:42:55.5864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LU9AxoWTHNpNtuQt7zPLbJIUJ1hdD2qd34Szkat94naG3VZF3Pb+/djNpvzvzMEyo3Cca86Asb0jNkvBCrfBNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7648

On Sun Mar 1, 2026 at 11:03 PM JST, Alexandre Courbot wrote:
> Falcon memory blocks are 256 bytes in size. This is a hard constant on
> all models.
>
> This value was hardcoded, so turn it into a documented constant. It will
> also become useful with the PIO loading code.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 8d444cf9d55c..31217cd3a795 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -25,6 +25,7 @@
>      falcon::hal::LoadMethod,
>      gpu::Chipset,
>      num::{
> +        self,
>          FromSafeCast,
>          IntoSafeCast, //
>      },
> @@ -36,6 +37,9 @@
>  mod hal;
>  pub(crate) mod sec2;
> =20
> +/// Alignment (in bytes) of falcon memory blocks.
> +pub(crate) const MEM_BLOCK_ALIGNMENT: usize =3D 256;
> +
>  // TODO[FPRI]: Replace with `ToPrimitive`.
>  macro_rules! impl_from_enum_to_u8 {
>      ($enum_type:ty) =3D> {
> @@ -423,7 +427,7 @@ fn dma_wr(
>          target_mem: FalconMem,
>          load_offsets: FalconLoadTarget,
>      ) -> Result {
> -        const DMA_LEN: u32 =3D 256;
> +        const DMA_LEN: u32 =3D num::usize_into_u32::<{ MEM_BLOCK_ALIGNME=
NT }>();
> =20
>          // For IMEM, we want to use the start offset as a virtual addres=
s tag for each page, since
>          // code addresses in the firmware (and the boot vector) are virt=
ual.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
