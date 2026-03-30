Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8B12DE709;
	Mon, 30 Mar 2026 14:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881161; cv=fail; b=pO/gvQOS/bG+AYE+KpyBZ3yl7IDjbcymZK8zCCxgDgIxTI3zVLpxiuUYtqhzmbYwshms5xU/ofZxcVyyECmbL6wxx8D+GsAI/7Cc294D5vVsOt+c/CU2eIqAkb7/8KWzlgQv7ZzK2XDbnFK5H8GHu0TiU1u+ua4vps9f2m1uA/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881161; c=relaxed/simple;
	bh=PqrBr/93axUWEMVJiVyKCodocXSKonv/UkI1Tgf1J9k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=P+wgtKtCIiHf+4d/+9CYVm5buzDIgECj1KxFyjN5RXFAKhI9+zDyvDZXX4WGkC/rqo5UZxYqdtHYtPKPTLJAmveluDdB7gVhK44uz/3sZMCSqucPekOAmfi4X4jtUZW62b7tmRQRa+LQIc4B/wzbrHhqFGJXbXXaTyGWNIaSU1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E2vSMIyo; arc=fail smtp.client-ip=52.101.43.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E2vSMIyo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwI6f1SAosm5ig4dpfqZFiYCZHvx1AqK/bx/6HJliPwEFMNXM4glzdfitjhJRpcTpdEb5tcFcIG+9RrLIPZKJLIwCO8IBt9G6KQNhfN5XwK3e5bCHpKzCpEOVosiDrFIosow9RKrxb/Vti6I7+WiMHUgd2U3yYdUZt+L3iAUqNzgL/VOZGBmfSxJtqUhnKKojuaofWYVmTUl7p6kTOuQRhuOdIu81lsCMQ/XtVIXQpL2Wn85xEGRrnD4tifdo01PuYvQ6xPb5kHtO2conHSkgwiDwyzxLJ04DKtvOG/KmE207bcNZNFvQLKN0tWU7W3+m5XbwKDw4944zFT01ZKP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ao9WJzVt08NW0lPbJrnINZ6g+vJRDbI2xA+B8quIt6E=;
 b=o23CeKDZaVU+xV4GKfspGgxDcWynOIB7DIeSBkFYOQ60ZNZMCPKUIrqnQN6EKABF+NShw1WEmHCPL3Nfe5WkBUEWymJ6F/BRWLynvpYLngm/OybmqQ4daptStSeI66nZhBc/wslOFQZn63IluyEEyLzxrwfYiRLpehxrRKd2bYJ4KilY8cn1er+ByJjotFE5XtZhDr1J9GIe1NskZXA61HAAf1SbIOYaD5K63GLgvlGpw4eRHXFbOjEpRORF2w5xTUMAGx2nltAvKxsKJpL2yhydrjNFZfXXH2ix6/O9ly70+U2ANayPbRFyCyDfW/Ykg2yHEPxIyJShaMgwkOh6HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao9WJzVt08NW0lPbJrnINZ6g+vJRDbI2xA+B8quIt6E=;
 b=E2vSMIyo80BavLUiFWrGeQ7MiiCXJBEFOAzIbAClCk2UX6Q205eA0vi5B4cNAOPqFvFvMWwimAIIa7nOhB4nN0qxKSv6ttKMm6ZtvD32MLAEZjLgagygGaDuPU6lqrReCxeTM8+B41QXFK//UWsJ8OzylXti26UJzDvK9qEDRrY+/K8RGlqNoLk4IhhFrAMj3HxM/OlGJnwl9xJV6Qe48Gj2Ivq6bxbOEwzgsmFuh/OrjBlxsxzcmF7FKoUnBViyjRTC0Rh6pUbIlrjIkVXSrV2cjmn0lIwiqmsxViflIZp1YSaKRBk/dqjCZ28Ny61HspHVpFN7Ssgvr9qrl6iFOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB7613.namprd12.prod.outlook.com (2603:10b6:208:42a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 14:32:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 14:32:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 23:32:29 +0900
Message-Id: <DHG6UVT0SZKW.16MQG69Y94IG4@nvidia.com>
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
Subject: Re: [PATCH v9 05/31] gpu: nova-core: set DMA mask width based on
 GPU architecture
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-6-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-6-jhubbard@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::22) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a55b58-c2a8-40c9-cea5-08de8e692e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	v7rfW/y7rrtyGwec6hoDRFrNPpZywL343jgTK9E5TVl83xyqoSX89SUS+bX48chHV5iMzbIfgtWb08Jzh+vhxNU17UIZ+dkhrv6Cwp1Lna/TSfkOQLFOmL9+Mhlcp4D71HKH2pCgj4xI6deo+ZuNsM3CqZyXAdWDywc9ddvUM7pl3ckCNO5Bl15gNeiGdUW7TImJvi7MO/o12sY3+F3+EYWPU7CDqS0ZrZnfu/+bdUTci9h+oM08PAtR2snMoWvYx/4HfKsQYJFeHLJ1n3gjkSH20kzCdBJn/uAeF+H9g6Dn3wRWG0s04JxEHgjwK46WDKvK74ZTN+YYw0HwogOzWRH3FaAgDszQ3C98i3WJGj7lTA88HmwRB47mqV0Ad9+nnZqoOMWgemxLeIOriORUwpLNXVtiiV1Tog6K9lmqwdAHxM3RUSIWWs7SWO+2NfnU1kTlQq7Smj8sICQt0IX2niWFiO4mdka42hTw71b8WqViES8cKZRqesHweETF0GI5e363gUmmoxZNngZEf5fjWzWSCnKFofTRzFBydGs6qBVx3f1+eTFvCi8HkWZxkD+ONfVtAeOM4/nH1Jr1dBrMKMbtPjpga1IDl4ljjsOUnNVp3OxAmiPBi8nodlRE7UHlu4HZ22SSJrpzabobQUtulney9ur76LU36Z4xM4W4p+2Fg/3euJhvWko03H8E5TjC9kMbBDG1yev5lvKKbPEz3luMIMc6MEGmo//NOyv3Yqo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VC9nQ2tUdUo5Slp2Qm1LcitwTDFTUERoWVdBOVNUcVVtVzJPRktXWmdaSlRv?=
 =?utf-8?B?aTVsWWdMcUNIdEozd2huTy83c0R4T3ZRbm9mMnk1dUlZV1JmYkZIdFhkdlhF?=
 =?utf-8?B?Qkg0WEg5STlFQldwTmY2WGFoNnJyUUw5K1hoTlJwMmxvREd3RDRPYmZ6Z3Np?=
 =?utf-8?B?RWhldnpqZmdOR3NkVEFMNEQzaGpvMWJGMkJmZTZhbFp3MmZJOVlyTlZEZi9H?=
 =?utf-8?B?VDNuYUJCZkp4LzQzQzdaTkV3T3NPT2JWeUxyUjhSOEg5b2wzazMvazFRYmsr?=
 =?utf-8?B?YjRZUVZGc2owZE5FUmU1YUpwemovVjhKckJGNTdoempzM01EbkREdjEwdmxS?=
 =?utf-8?B?NGh2YUJ1THVnM2JUand3TFdPaGhlV1A0Z2FhZVJqYk5veGJOL3NORUtmalBG?=
 =?utf-8?B?SmlzVndUdzlIRndrTjdueHM4eHFaRWNnM09rbytTbWkwQ1duYnlieUVJeDNN?=
 =?utf-8?B?d0thQThxajVNK1NwODdnNEl3NXU1aGtKNTRGU1JVZmE3eFJCU2dBaFVQcFAx?=
 =?utf-8?B?WDV6ODJMY29YdFNFTG9VTFkzTUhRZ0RVMW5BcnVnVGtqK2hWT0JTVlJzVlBl?=
 =?utf-8?B?ZkdydlNpUFJqM3dKSjVzV1FzRDEzbjVuUTZBa0pnejVwdnlrK1kvd2RJTFhq?=
 =?utf-8?B?Mk8rN2t2UkZwRS9rZkoySzVDNkx0QlZpbllIaHVtMXJ6RDlWSzR1K3RMN1lK?=
 =?utf-8?B?STFaTm4rM3krcEtSY0FFVTgwRlN2STdmU2p4R0F5Rkg3SVZDR1pPbUdoSm8y?=
 =?utf-8?B?OFU0ZnZSaVY2bm95OUlXYXc0bkp6NXhNWDZRUFFha3lKcWpOTi9jQ1IyTFZO?=
 =?utf-8?B?TmQvZzdOajlmWjNvdi9laVhSRTd6bWowcXJ4bU1makFTbEQyZmYwSHlFNE5j?=
 =?utf-8?B?eGYyUnZqWmg5TTdBTXRvQU1UQ2lLMytKekZ3VFF1WDlHcXBUQ2h4bVlYcFU5?=
 =?utf-8?B?SUg1U0JOZVV5aEVYWjVCcDN5NTBPcS9VdlJDTW5BbVlwTkJycTFnc01iYnAr?=
 =?utf-8?B?TFNJUllnVWQ0Y0tIRXN6V2VGRDViV0R5RkhiVkIwN1dBT2ZnN0plTFlIMm1R?=
 =?utf-8?B?Q2xMVXZQK1pmd3A4d3RlYU1RekQySk5MQVRoeWFmVDNnNytPYmw3ZXFhbDJP?=
 =?utf-8?B?dnRvQXE3NjJibnpPMXMrdFVQN2QzUS94dmNjNTVRZVpyTkUyRDlMR0o5a05K?=
 =?utf-8?B?TUVzZkY3S21teE1USzZZK21OUTAwR2RLTGdoZnFhUC9iay9QcDFGdGVrc0l1?=
 =?utf-8?B?WkM5VXMyejN5ZC9hNlFTakdvb0FkWDBNcU9kOXAxNzFKZi8yaHVoS3E2YzJD?=
 =?utf-8?B?V2xRcWg3UHVYME93R1N3SVh2T3ZySW9ldmlGWDR2MnF4QWZCbUFGWHdIQStZ?=
 =?utf-8?B?MlBzSU1DeHFMaGlmODBvaGFPSE5pdldOL3Z4TzluOER3QTAzZDduYllDdksx?=
 =?utf-8?B?VllHVEExdmg1NmY0dUlZaWZmbkc2bVdDZTdtVzF0NDJwc2wxOVJkdEN0MzRm?=
 =?utf-8?B?bDhRb004M2dXaEk5WGduWmlZTFdyRkVBQlhwTnZkMGZXM3c2eks0NVBHK2Uz?=
 =?utf-8?B?RUtETFFhUUR3eERJQ043dXl2WUdtVWxZSmN0bFVBTGlET3BaalYzaEtOdk5O?=
 =?utf-8?B?SHpyNkZxUVlTeU96YmdibDZDRThHZ2h2N0RibFBUbm5mK2RKcFlidTFhemk0?=
 =?utf-8?B?MlJGWEY3YzhZMFMwZHhpcWo5WFNvVXRaSmtHdkpaUkRiTmJpKzZqUG9Pd2Fh?=
 =?utf-8?B?c1A4cUFTcDgzYkRhVWc1WFBqTm40UDBxQ1ZLMUwwS2kxL3dqZVVuWDdmWmh1?=
 =?utf-8?B?bEhUd01xMGJTZFY0VGJyRWREdnVJZXZlMDQzWTR4bXNzZUhtc3pFdkpIamRs?=
 =?utf-8?B?RzJpTGR2ZVVHNnFHK3FuMGhVby9FbUgyWk9Ib3J6ejdoRnl3Wm1vZU45YTM4?=
 =?utf-8?B?aXhTci9RRnJjMTZyQ25yUW40WDN2RGRiSk9pSU9CNUlkTkZ2V09ORnRaTW8z?=
 =?utf-8?B?Z0lOazl1VXQ0eVBjTnR2dm9yNklNVktJKzdnL0l1V0RNME8yUVZpZG9RMkVy?=
 =?utf-8?B?Q0pVQ2ZkUUVuMkMvR1NpVU9uUWZHZTYxOXNnQmRTRUxXclRhYW9STG9vZTUx?=
 =?utf-8?B?ZU9pK0NkUXlyV1N3K1Bxb0NyK0xCTm1KTng3bm9NbCtuNE1tQVpndzJkKy9P?=
 =?utf-8?B?TWo5NWZ4QkZiWU1pa2oyL2RTbVo3eHpYaDdVOHY3by9xbUFGVTZjWmFIMWhr?=
 =?utf-8?B?UTBvcklzNnB1NTBmNmVlTjNaMWtRb0d6YzZScGEyQVpDb284RDlIK05kWTVn?=
 =?utf-8?B?WmFreGdiQjk0WjU3Y01XRWlkSHo3WGd1U25MYnY1YVp0WlVIMW1LMjBTTXNx?=
 =?utf-8?Q?xFuSVko7AE2DXbmc7/qvwKvocNQeEImkzHfpKAh7uCSfR?=
X-MS-Exchange-AntiSpam-MessageData-1: jeTOlgW28g/rsw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a55b58-c2a8-40c9-cea5-08de8e692e16
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:32:33.0863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSHLD+YHr1z8BjypBu0TKtWRm4sgEvxJIHtNrFWyEM96+CySH+PTa4DXFTAyzl0A3pF/zY8qv8dH2CyzaxHHqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7613

On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
> Replace the hardcoded 47-bit DMA mask with per-architecture values.
> Add Architecture::dma_mask() with an exhaustive match, so new
> architectures get a compile-time reminder to specify their width.
>
> Set the DMA mask in Gpu::new(). Gpu owns all DMA allocations for
> the device, so no concurrent allocations can exist while the
> constructor is still running.
>
> Move Spec creation into probe() so the dev_info is printed early,
> and pass Spec into Gpu::new().
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs | 24 ++++++--------------
>  drivers/gpu/nova-core/gpu.rs    | 39 +++++++++++++++++++++++----------
>  2 files changed, 35 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index 84b0e1703150..bb82e63af044 100644
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
> @@ -23,7 +21,10 @@
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
> @@ -38,14 +39,6 @@ pub(crate) struct NovaCore {
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
> @@ -84,18 +77,15 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdIn=
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

Now that we have moved to DMA mask into `Gpu::new`, what is the point of
creating `spec` here? Its sole purpose is to be passed to `Gpu::new`,
and that doesn't change by the end of the series.

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
> index 685ae4c81268..f70bfbda1614 100644
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
> @@ -160,6 +164,16 @@ pub(crate) enum Architecture {
>      BlackwellGB20x =3D 0x1b,
>  }
> =20
> +impl Architecture {
> +    /// Returns the DMA mask supported by this architecture.
> +    pub(crate) const fn dma_mask(&self) -> DmaMask {
> +        match self {
> +            Self::Turing | Self::Ampere | Self::Ada =3D> DmaMask::new::<=
47>(),
> +            Self::Hopper | Self::BlackwellGB10x | Self::BlackwellGB20x =
=3D> DmaMask::new::<52>(),
> +        }
> +    }
> +}
> +
>  impl TryFrom<u8> for Architecture {
>      type Error =3D Error;
> =20
> @@ -212,7 +226,7 @@ pub(crate) struct Spec {
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
> @@ -244,7 +258,6 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Sp=
ec> {
>      }
> =20
>      /// Returns this GPU's chipset.
> -    #[expect(dead_code)]
>      pub(crate) fn chipset(self) -> Chipset {
>          self.chipset
>      }
> @@ -292,36 +305,40 @@ pub(crate) struct Gpu {
> =20
>  impl Gpu {
>      pub(crate) fn new<'a>(
> -        pdev: &'a pci::Device<device::Bound>,
> +        pdev: &'a pci::Device<device::Core>,
>          devres_bar: Arc<Devres<Bar0>>,
>          bar: &'a Bar0,
> +        spec: Spec,
>      ) -> impl PinInit<Self, Error> + 'a {
> -        try_pin_init!(Self {
> -            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
> -                dev_info!(pdev,"NVIDIA ({})\n", spec);
> -            })?,
> +        let dma_mask =3D spec.chipset().arch().dma_mask();
> =20
> +        try_pin_init!(Self {
>              // We must wait for GFW_BOOT completion before doing any sig=
nificant setup on the GPU.
>              _: {
> +                // SAFETY: `Gpu` owns all DMA allocations for this devic=
e, and we are
> +                // still constructing it, so no concurrent DMA allocatio=
ns can exist.
> +                unsafe { pdev.dma_set_mask_and_coherent(dma_mask)? };
> +
>                  gfw::wait_gfw_boot_completion(bar)
>                      .inspect_err(|_| dev_err!(pdev, "GFW boot did not co=
mplete\n"))?;
>              },
> =20
> -            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec=
.chipset)?,
> +            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec=
.chipset())?,
> =20
>              gsp_falcon: Falcon::new(
>                  pdev.as_ref(),
> -                spec.chipset,
> +                spec.chipset(),
>              )
>              .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
> =20
> -            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
> +            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset())?,

Ok, so you've removed the local variable as per my v8 feedback - now you
can also access `chipset` (the member, not the method - which should not
be needed anyway as `spec` doesn't need to be created in `driver.rs`)
directly, and remove some noise from the diff.

