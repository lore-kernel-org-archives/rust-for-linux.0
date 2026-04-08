Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010067.outbound.protection.outlook.com [40.93.198.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DC318871F;
	Wed,  8 Apr 2026 03:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775617263; cv=fail; b=lcH0QZ2N5+R+v9lQnowkEzCBPhe7FQ+p92XLiTfC+NNxguxmeKCggkADGZtpfP2Pm3R8W9Cf2NefTkr5EN/32AoilKC+a5Kw32UIEd6pxwYKJ1hgXn898dLmbIgWSN+F7WqrmLEWxSskycGAl8//1d0wgkphY+1nXkAUTG+2Wt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775617263; c=relaxed/simple;
	bh=xoHhfm5c+TRwhUH3QgWr8XG+SOBGVM5oWjnXMF4A6jE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=E0TMu6YtNf7RvSzd68MJ6KjhlHZDd/tKeD0AL0aKAzhJSgsNqhQfrLuMgKPiGKlM2/JfpxhDZILX8V+oAVorA+1PRqc9DZkaJL4n94JA5pvvXLHNPeAP8SxC6z7DYFoTfofMkVw4HTKfRjqVKM8GLG0usBKkY58HaqncdG86s5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Lgs4tlSU; arc=fail smtp.client-ip=40.93.198.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lgs4tlSU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWQhGXXWQD37o4HBmTdZ6U4oxh6H5SHZPpgLK1FFgPx8bOof1rU1TMRB5pnbLLU14kwlCmsJl30kR3lzwUbovQ9m3UnjVVeGYYTVT280h5gMbiu+WK2IX5EZZteS1koEMo2b6MjOkgsOg+NrH96IFZ9Lvvq6S/VX6jW/WPHfGmPrQPFmq0cHvAjVKetfGYE8t4lNjaIWeAXaHmlH8kWa8LS+nVHKCtoa+hmUeu+cdrFgLRZbu9jhNyD+WF315u1CIgbTx1U9Vj0FgpvoxlATQ3qL8RMimbm10TjJ72dGmZxgiezYLIi9Wb1nQbFqqBA1EgqzBEgB5p32U83gMw1VFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHRo7dT6UKXOjx5X3+0QUByCVf6mdbY6blSBjHZLlyU=;
 b=k844x3NdYiU7MtAuFPpenI9wC4Zu8VIM5179sFsujN3cUYZ8k8Ekph8Tt0upqnf4s7lcfERkuuOy3x3fzYt95MoFVtOjLax8HFDdVxWjP4G2zCwr6S7hv/5hK/xbbZESMvKL0fdC3hKRgPPzgU62BFw5mZWHH/Y7wpOs4kk2YtuRJdgVSZn6ERWfhhTPwmyMF+MmyphcpnQSKiEc7PyAkucrXQenTOCJBzKxyI/NUhreQH3Q4INQ6z4OuGsqBtDl+3EvTnO//FrJXeYReckvZYtw6j0KLWZYZa0wiKOOxRxWr4ZddoptEo6aL/BqC9dJc3kBb29u+/s59IVm+LAFDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHRo7dT6UKXOjx5X3+0QUByCVf6mdbY6blSBjHZLlyU=;
 b=Lgs4tlSUhjQcgU1HirjHVsXMRGmWwSXFtxf6tBR8Ibtf4AjkWpEezUwGy3jxFVpDNpX/oB/AhLgDhZ8Jux9sZc+/Xa2kvunTDqbiOszvAkFWu5KYv56AWGlDR7X0YHJV7h/YBidwljM5TDp9HDDzdIbfJOzH6u+6ROfoRwmZ3H5EPuEwvbO5TAR7gS1PPVlQQTI+SZjr4YuQsh/mygDAdpnf4EH9ibzaeNLh7tH6y0dApv7tIrpl/5wHRapVkkLn/t7ivQP02JWTYV14sUuG7lpTsWjO7uUDeyFeuIAhKXThQW7s0Dh7BAu4DzTDf+oNwEWV0fzWzpEJW9J4LdUMRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5743.namprd12.prod.outlook.com (2603:10b6:8:72::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 03:00:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 03:00:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 12:00:53 +0900
Message-Id: <DHNFS927S2DS.16B3V5I5ABI9I@nvidia.com>
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
Subject: Re: [PATCH v9 24/31] gpu: nova-core: Hopper/Blackwell: add FSP
 Chain of Trust boot
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-25-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-25-jhubbard@nvidia.com>
X-ClientProxiedBy: OS7P301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:26e::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5743:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6be473-a3dc-4ecc-ea67-08de951b0e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HT1xCHfQeMj7MK5rxjUZdQ4qIfV0cmL6c17caQmuJWGMFc8879vUmK63g5rDFc4CW/LHuNdx7mdHXcIZulXNezVvUN9q7IA9sqqa5QvOqUzfgiBktgNZ4pGkF3qvhG/tthbTgvbEeEy266P57Sd/NNoevSCHq6lJHrePLUQ5+/rB8xm3z9KElyZVxZYTkACHSmMjrYiXE7TGJzN6wl7k+KGqT7VBDmSK68yjkZdbHy/67ASc7a7WkSNHs49m1eJAmxHy7yqu31Dssj5PHF0lXWGzG9XLkhSqe/xPK4raTUa2ITC1dYPuKFosL7+jGSrJNN9nY0bWa9vpDqZwOxz6UzYjyObWNoggsdvY1VOBxq0mgKHvFP8EEn/tnXl8CP1W84amMIIp1Ox2rbYZ/g+QaAxxnEZB+o88rGMg8pO0qXk+Jl4AI4tBdR78drcnm1zwgoLyFs/rnv0W5M4KWCqoON3LJ8RJmAzgLlrUpKH8RUq+wUhV2kPhg5XdsA9K7+gW+OBo9C8p2z5zNiipN55bL6qyzqkLh8LOclKyXxvWKb+rwu6w2/V+PWOJghqz8vlZukRe/EHkNZXpeg/8f60gZvHynCLK7NXSZBfYxbFMktZFxQL4aR88+hTPy6MhVpVJA7M9entAgG/dEvRFXJnHhlI5RFmZqeYFHEBlUXxQdgZsQQYs6Jcsc7yqHLmCIHgQnBBVRjFYV+eWqOU3Jt2h5E3ArAo0xFv3KifKfVod3Q0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3JkQ1EwTXJVK2FYMDYvc3o2bkduNE1rdjVpbnZiWmlZcXlhazdSWlNKSnZL?=
 =?utf-8?B?UWJFaUVOZzdXQmFuV0laSmxGUmQwRVVvR2dtdWd5VUNNcnRram9QazNXdE9K?=
 =?utf-8?B?RnpYTXBYZ1lvSlRmVlcwVDF2M3FQWU9aNU8zZ2p3d0FidW9WRDZLNHltTVht?=
 =?utf-8?B?akJ3Nkl3cmVJWVk3bGM0cmVPc0UxektPWmZsY0E5bmhxYlIwSnEwN2w3S3V3?=
 =?utf-8?B?ME9vdFgwRG9DVUlKU3RrV1FvWnllYzUyREgxaHpka3dnY0ZRUUhxVE9OUEht?=
 =?utf-8?B?ZGRlTDk5dTZ3cTFGcWU4YVAyN2JFNTNibTFlVnU4eTlnMncvMndNUUovdTQ3?=
 =?utf-8?B?M3hrdXlOT0JlVXRjYlcxdXRFOU9icWF0d2x5UGIzMVhJa1JZNHN5aEhjcnJF?=
 =?utf-8?B?aUIyOXBOU0k1dlUrK29HZjRnc0xZbVZzamc3K0I0Wjd4eWlKdExvcHpqWDg0?=
 =?utf-8?B?M1V5aDJ6SmMxRzRvOExqY25jR3JZYlovN29LdVFmVmZUT2JYclgzaUxEZkcz?=
 =?utf-8?B?eTNNLzR0TEZTVHd4bTM1dkFDakg5akRQcktZdllySkxCVlBwYmZYWEU1Tzlj?=
 =?utf-8?B?UCtKclIxc2JCdmZnYkhuNms0MG44a0NoV3Zxd005bnRNa3hZTWh4QTdrcTRE?=
 =?utf-8?B?Lzk3QjB5UVZqTDZTdUJoYjlsRmc1RDVFcFR2TWpLdGNBVmh4aEVmWlYrZ1hJ?=
 =?utf-8?B?QlZrWWR0Z1cvbkZHNjM1RGRhT3ZBRFZiUjBTRVZtZWxqQ2FzR3hQRXYrd2xM?=
 =?utf-8?B?aS84cng5enluaS9qaXg3MjVrQUV3QmlNZ3haNjFFWU01WUorVVdUQ3hvVE5J?=
 =?utf-8?B?S090Y2JHV29qR0lVKzRvRnJXa1A3UWlLK2ZEQVA5ZEpPSXRKNzFoeVZ1dWlB?=
 =?utf-8?B?T28zRE11VTg1aDNQK2w3dXl1Yll3Mjlqd2NPdFBYcWVDWUI0L0NTVjZieGhN?=
 =?utf-8?B?Tmt3eS9UNjJVQ29McUgxb3Y1YTlvaFpXUnpGQTRYR2M5QzJodW50RmJreHNB?=
 =?utf-8?B?WlFRZVhLeHdmYThHTitpQXhnZHJOQzRlOHRqQmhPRHI1Q3o0cDlTVUdCaWRS?=
 =?utf-8?B?ckZlTG4ydXcwUFlaQVFoZzhWR0lWZHMwOWh6Sy9jQVBSbjJJL0o1QmVZeDFi?=
 =?utf-8?B?WnJHR2x1T2FLL2NyemY3TTBRMkROWXNtSnQwd3VWTDBpcnM2NnJ1QTdXNmVh?=
 =?utf-8?B?OG5oUkk3TnBEa3hQWmNCaDIwc1JkRUJ3ak9WbGVVZG1EYUlYTXBEbWFmQnFj?=
 =?utf-8?B?TzF4Sk9qbkd4SERRa0J2czRIaEJxai8zNCsvWUlYK3NneDFYaFRPQUttdmxU?=
 =?utf-8?B?bU1tZkxvaVZBaVQ3Z0JkbHIwNGpjRnk3a1ZTYjViWGdPeWhQTmFaT3hZMjVU?=
 =?utf-8?B?bDg5ckJPd1RnK3VTMUtoQVpUUGxpeHFGazcrS1FTVkdTODYyVFQ1a0VLdFJr?=
 =?utf-8?B?eEJnZWJiUDlWL1JEMUtPSlgvQXk4ODhIamg1SU0rYlRPUkkwZFZhWVExQnh2?=
 =?utf-8?B?VnJIblFsbHBGUjNlalJPWWpqTThXbVBhcHVkWHJZU3M3K3cxS3VkQ2o0OTFV?=
 =?utf-8?B?T2lXM2liVkVpZjB6bXZIaUVKM28yRFdGVGlwdDB6QStzaUI5MDdNN1NEOUs4?=
 =?utf-8?B?aWlHQXlFS3hhL0V2bEw4SVRsWXIwYUpKZUdkSXR5d1pEK25pQTVKQkUrYXA0?=
 =?utf-8?B?ZGhtTlAzQTJYMC8wYkpOcHZhYUtLZVFRK25LWS9naTlBMTd0cEEyaW1QMkpl?=
 =?utf-8?B?b3owTDJGT3dYLzM0OGJoQWFiblR5M2VQR2NGOHRmRERGYWFzeW93OStmb1V1?=
 =?utf-8?B?bE9aVUlVbm92amNtRmZiOXozSEdIbDBLOFowTVBuZ3ZJclA3RXVMclZ3dkNx?=
 =?utf-8?B?Ukk2VFhDSXZPTUNrNkY5eGRPUGtHUVNDVFFKcUxsK0FZM1BVNkZjMS83S2po?=
 =?utf-8?B?WXU4d1l1Ym4rdDBSQk5VdnJ1VVpaNWVoR2FRZW5hQjE4dkluNjl6ZzNSTysy?=
 =?utf-8?B?eVRsVzZwUTY1ZVlsclJvNnVNUHV3bXlxL2k3TSs4VERwRk8xZUNDTkxFTzVY?=
 =?utf-8?B?bDNhbU8yaE9MQzZvM0dxczlCcE5EQW1QMWN6WCtEbndJY1E2bFY2N0lwOUNu?=
 =?utf-8?B?dkJrR1VuVWx3SlQ1MFJ2RnpHVVpQR0pOWGhCbmhLYmxaeDJZRlRnNlRJamYw?=
 =?utf-8?B?bTZaSnd1V0lxOHpFSjN6bkttK3YwTW5DaWR3cWxkR29DSW9DWUxDS0p1K09K?=
 =?utf-8?B?RlZ6VWFGUUVJYktLRW1ZWkVsdEV2eVkrcVB2blBBSG1GdUNFVGdXU1AweFFa?=
 =?utf-8?B?dVp4aTl6NzRzOHhLaVpzL3FZWkVBNjZTYjBJVWc0MWtIbnF1T242R0hPZGtt?=
 =?utf-8?Q?xKoHcKyQaI3JT4+pC//WQ00oJMxTFK1rx4dc3A8Hec4S/?=
X-MS-Exchange-AntiSpam-MessageData-1: 1sT9Qsv3FZDPeA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6be473-a3dc-4ecc-ea67-08de951b0e07
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:00:56.7282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWUosRxf4WQ1NNkpRcE7Dq14K8fSTIq2O5DSlTLQekla7sEHtGIr3b0erAVyqG+9xrMVwYnkiFf8HoyYywN3kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5743

On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
> Add boot_fmc() which builds and sends the Chain of Trust message to FSP,
> and FmcBootArgs which bundles the DMA-coherent boot parameters that FSP
> reads at boot time. The FspFirmware struct fields become pub(crate) and
> fmc_full changes from DmaObject to KVec<u8> for CPU-side signature
> extraction.

The temporary `KVec` field has been removed, so this commit message
needs updating too.

>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Was I involved in the development of this? The code must have evolved
beyond recognition, you can probably remove this. :)

<snip>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index ab378c0297c7..780a4d1169e2 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -138,7 +138,6 @@ pub(crate) const fn needs_fwsec_bootloader(self) -> b=
ool {
>      ///
>      /// Hopper (GH100) uses version 1, Blackwell uses version 2.
>      /// Returns `None` for architectures that do not use FSP.
> -    #[expect(dead_code)]
>      pub(crate) const fn fsp_cot_version(&self) -> Option<FspCotVersion> =
{
>          match self.arch() {
>              Architecture::Hopper =3D> Some(FspCotVersion::new(1)),
> diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.r=
s
> index 9e052d916e79..c23e8ec69636 100644
> --- a/drivers/gpu/nova-core/mctp.rs
> +++ b/drivers/gpu/nova-core/mctp.rs
> @@ -6,8 +6,6 @@
>  //! Device Management) messages between the kernel driver and GPU firmwa=
re
>  //! processors such as FSP and GSP.
> =20
> -#![expect(dead_code)]
> -
>  /// NVDM message type identifiers carried over MCTP.
>  #[derive(Debug, Clone, Copy, PartialEq, Eq)]
>  #[repr(u8)]
> @@ -101,11 +99,6 @@ pub(crate) fn nvdm_type(self) -> core::result::Result=
<NvdmType, u8> {
>          NvdmType::try_from(self.raw_nvdm_type())
>      }
> =20
> -    /// Extract the NVDM type field as a raw value.
> -    pub(crate) fn nvdm_type_raw(self) -> u32 {
> -        u32::from(self.raw_nvdm_type())
> -    }

This method was introduced a few patches before, and I don't think it is
ever used - you can probably drop it since the beginning.

