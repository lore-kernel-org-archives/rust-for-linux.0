Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013054.outbound.protection.outlook.com [40.93.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D4FCA6F
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 01:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776128694; cv=fail; b=gcMtWD8LFDTVrlqlG3BkrSg8MbU8yNDV0H0hIGGxF+oB81BlxCvkimkPDT3ZXJdqp21PywWBcTeO5Kv2WOG3iLt/opE1aWkWieJd4H3R2O0/a2iQT7WiXkRC8kt0A+EDsfoxXr1JYT9HTXbPCfJw5yrJqQ8prEc080QwQncnkjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776128694; c=relaxed/simple;
	bh=cdh0kErCnaBLQxCns9stXJ+66GYv5MfDmgAQn3OrFHk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qMLOGQDOErpuUNvWh4ftYb3a5YN1hhzX9Pete6bkKFb2sUPUE/k/nFIEsURehrw9cnfw/yhjC45G4Mxs94OIEwgmff9wZbaahPGSwmFbWA8fIlJs7SI8aswZIlQqVnJ++cuomMkPUvo5mQJjO/yJIGvQ9wL6IX2xVFPYzC4ytDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hKWO1eLT; arc=fail smtp.client-ip=40.93.201.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hKWO1eLT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0Zge3XyZiVa3JbuVl2ASplvDl/6UjMOalQpbq664KXV3fuBo+8WU9snMQB4U2Z6e4CQVa8P5+zgYm1lcl96t+vmi5MedT54vzVAY6cYxYdak/GaPAy8+0dckNUp5M+dcJQ832mAS7fW0+ey6X0IDp7X4h+KObZj5opCAcEGgh8bfDkG0fhxPYlHKnKEFwPiufdePlUc7d2/1WiB1zREKd/nz3ZHYwqMmLaSBdq0CAOXh8Fp8fW9rFTt/4vB8sUXAxBSJKQ/aHj8prZmMqEBKVkV43QnrtSBxS3yuPc3Ee2nLfmwrcqMWR9+50+uW1ugc7wwD+6aKfXUbq64VAw7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldVhVEii1BUCmhN5kTKOp1DZHMWDbNtT2v8RfABC4A0=;
 b=lJnsCqUQuV60EyjOjqLDfP7wkSRRoCF6E9eTBTqd2/YSH5fKYjnR4VtdopoggkBJyyFf1r2GZgzwhfEhMKmfrRrg9UbzssX3mSBCa9b45moGSqSU56atElWu/SX/hmYm8UJsKJ0QJ/3xifUrusYVTUKOSBWsJNimeEdSlM03jseeFmykSOC1b6qkU6ei76qK41aPQjjmtrJz9L+rTf+e9v0+vAkUa/BHc9MomFb3xqJiLL0O1r0j2qQgtby83KYyovEsYS4aw5KbeLKObJP4I+1EGwwzjJM4xYEhMsRKbFGZWBXQib6M6ZFi6PZX0E+jEv5mfjH20f/HjYl6f8pUpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldVhVEii1BUCmhN5kTKOp1DZHMWDbNtT2v8RfABC4A0=;
 b=hKWO1eLTk5uhUj5O/hRXFjZaIEeM0X3ILxmw/Ir5A1BpYdH3DGYSIgluCbJTKN9fNmG6UsY0VBcwRx8rIr0mxOypCYbQZSu/kxy0RxcQ8d3R72Qt7+iB2yfmOkCMhoCb2rZeF1yKwOzIxzhXfPp0Hx8VUtdKIhUAFbTLIfycOTwDJdKDbahV6/kvzhfyJGJaDbdX9f69Zer2Xk75XR8WvcjN4IQujWohUJR+Wun2N9nBZttUkSMEhFcgYyz6A1lCfYmItuQ5LfMRhFgMpM+DWwFwBxHJChkWYWKSwiL/NjJq4jN9JOqhU+PbnDFMo86cUjDx4rIvkJl2WUZ5MR8FoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.19; Tue, 14 Apr
 2026 01:04:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 01:04:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 10:04:42 +0900
Message-Id: <DHSH2KPBYD22.3AWUHG3TCVAVY@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260410203722.1586938-1-ttabi@nvidia.com>
 <20260410203722.1586938-5-ttabi@nvidia.com>
In-Reply-To: <20260410203722.1586938-5-ttabi@nvidia.com>
X-ClientProxiedBy: TY4P301CA0123.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4361:EE_
X-MS-Office365-Filtering-Correlation-Id: 220b7f4b-d964-480d-ec5d-08de99c1d18c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BeKfvh/z0OvWGeOiy042A7bJ0tWegXsgSpljXOewKP7LHRepO5VD3ZE1N3wcFYhFWrXAzfy3w/BI84w9K48ebju/k5nQRXTV4SfLS9vrUX9fiBSh7aEhEmhc+LLemJylqPA7fxFSE08E0DQeCbX30nZjavYBOcwJJAYqq7F2RwjasXpJnmfVsqbAjSy3/o+2GGeZk3N+TgTY8TjIExpTxkXBwWyNLjpTDzoVwO9s8aBs00RFRWoqDUjVirQcRd6Y3qa5uRs1Yz3dAF68giVVZhQgREzKeZkqGXItP4dTccpnObgtrlTQUBY7pj8GHYnzxAOL/ffgNgTHgz/AYImGTcRR5BpdD11bMi5Nb8Fqf+SCRbesuj3Dmjw4VuW87OjczeykIKIbfa3hytNQ6GRnI+eh1f6XYqKKKjLbDnFFP5Kr+xYRz3z0jyh7Z6azIQF1weqbgOAnw6Zdh7a/qUiCNlTPIPWwFr6CI4vEhoC2RJWzAmTuXr+fC4i6iGZebrdneLsorbqIBu1ajL6OOLbNU+i6kSbAAZCBya48tqs81JOr+vLmbhXHS5NsItQGMiR+6YwN7voy1EPn5K85lDQGo48PG7L56hk6mowXS7M2ERcPApKKDyLcR+8C2fXVujrE4z2GCNGLEnx2hj07wZJM52nOUt55xr+xB/n+Ytf8N0iqvNdJlvkVp0VvW9yCdb7V7WztKb1ouITWKXgpJZW6h+dQnpBMURA9KO6qWe20JDg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0phZnRSZXpZc0xDbllVVUtqMkNxZ2RtVzV4NkJJR3E5dTlQRVV2QTVMdDYr?=
 =?utf-8?B?alV1ODVqeExOemZHYkJkYlhseVBNWnhPczhZL3NBY2hDbmV4a0ZpekFFVTlP?=
 =?utf-8?B?VmRzNUZMcGVZdFZvYWtSa1ZYNExNak40cXVMdGNNVHhoZVFiMERGVCtjTFNy?=
 =?utf-8?B?Nm55azZtUlE3SHZPVHJNL2hzNWZaczFQOVV0ODIzRG9TbUY2dVVUaVBWRHJi?=
 =?utf-8?B?ZU5EUjJ5STFiZElNMjVzRFc2WTd4RVcvV2RFcTJKQTJzTi90K0FvU3h2VHo5?=
 =?utf-8?B?WGZ6RWdGckZwclM3MWI1SVpyUTIvNjB5dEtqZDlnTlFGOW5tUFFKd056RDRi?=
 =?utf-8?B?aVl5cy9IK1J3MEdzVlA4bHdEQk9KcDFHcXlVK3RUcVFhV3V5YUdJMmFkcDJG?=
 =?utf-8?B?WnV1VkQwdEdGOGpuZk9TazNwdlEyYU02WTdhRXh3SUdPaXlHdWJKVENTTFA1?=
 =?utf-8?B?RDZNY2s5RndnRGxaTjQvVDBjemJleE1ZV2pXaDRhOStobTVvMDEwYVZreWR2?=
 =?utf-8?B?V3pkMUhpQWlpWGZvTjRjUEtZMnFCWndWZzFsSU5aRVBqYmF6SjdtZmpNYmg5?=
 =?utf-8?B?blI0aXk1YVowYU8zM3FTM2wyNFY5bElLRXUwM1REdWFrejl3dEpPd0xZL1NP?=
 =?utf-8?B?Mjd6cjVpeE1qeTFCb3I1VUhJM1hWdVkwbG9xcGRST2lxNEV6Y2xYOG9OS0xk?=
 =?utf-8?B?WmFkTU9jWWdWYU1UV3JHeXZUOTdzWnNSOUtxZ1d1N3BueEEwVDJZMkNjeDdC?=
 =?utf-8?B?dytOZVdTN0ZrQzc0M29FSWVvSml3aUdkSTdwNjBCTXRjVStCcGp1Y1J5WTF3?=
 =?utf-8?B?d2tUSTdsemFPUnd6K0kvY2NjallnaFlnaWFycnNqdXBsMVdyblFoSWcyN0t5?=
 =?utf-8?B?MWRLU3ZRZGRtTTJ2c3lWYUU4SDBYOXFHamhOQTNpZDg4STlwS3R5a095OEtz?=
 =?utf-8?B?clJXcTNRZEZpc3dueTY0R1RLbnZSRVlJK0ZvYkRkbXFjTUJWdTk1aHZuV0xH?=
 =?utf-8?B?RzdRb0l2RmN0R2YxK1hEb0dXUUhwQ2JySGRKTEhJM0FjYWJYdkFYS0FsTmRh?=
 =?utf-8?B?eW53aW5FcEtBY0VGeTIrbzNnQ056akRMcnBFVllNWmFFeE5QRTMydnB3TmhM?=
 =?utf-8?B?a1JZY2pnM2hVZVBscjB1c3JtblhndnN2cHZWczhpNkcyWXdFWXNmL1ZHdTJ5?=
 =?utf-8?B?L2lNQTZ1OTlQUU1KQjUvVlE0d1hjb3Vjc3lVNGZNZ2ZVMis5S0lzaVJhMlZM?=
 =?utf-8?B?M3dMK1dFVHhXRzZsNFJlTStuUEFlNWUvTnoyU0NSalEwR3RHaldVbytBdlVL?=
 =?utf-8?B?ZituWnN0NVJuNjl1eVZNYlhWVUJxMUtMWnJqaFo5bVN4dVNna3FQZFhoQ0p2?=
 =?utf-8?B?Wkd2MjZDUFRBM0ErOEtJVWlPVHMrM3htVDFtSFUySTJtaWJPSWdMWXljaUpu?=
 =?utf-8?B?dUpVN3o3TUlPbm12QnMzSzJSaUdpazM4UUF2Y2U5Szd1Vkd2WEdjSU50MmJq?=
 =?utf-8?B?QzIxQkxxbWVjK1krV21wZmVvV1BOU0Z3MUJmaVFrS1g2QmpkR0Q5eXcvODli?=
 =?utf-8?B?eVRESlBLSnlrSWtPb09xLzFRT0FsdUFrZ1lXVWl6RzJHeGo1SkwxY25kbitD?=
 =?utf-8?B?OHZOVkNVSEJxR0tPbUlMNFM5WEE3YnIxR3RNWVlhcWY2dnd2TWl6cW9zNmZu?=
 =?utf-8?B?dzNYU3c3Y0RsMkovTlBoeDlGcEpCZStLNlFieHNnTVNBQmpwSW16K1N3VFVY?=
 =?utf-8?B?Ty9vaDU0Z2xxWWkwU08vVGt4Zk1JcVJpUmZ1VzlHMFpRRks1Zm9JN3JSS3c3?=
 =?utf-8?B?VXlGRW9JMGFIQmh0RWtMRkpjUElEaTJ6MnRFcnlzZFJBQzB5aDQ1Tjk5N1Zr?=
 =?utf-8?B?NFFEcFpyUXRHK2JEd0VHV2VvUVlHa2NKcWJtNkRuOFF4aklQOGJyYk1meUli?=
 =?utf-8?B?Z1dCQ3NQa3NGdEtWT1dpSjZJVS9ZNE1zS01yNHdUYUJ2UWVMaVlXZzY5bDJR?=
 =?utf-8?B?bkxwbjZQbHBQYVR2N2VxaUpLVysyLzJYQWF5UEJmV1FXdkkzelpjeXEzU3Yw?=
 =?utf-8?B?QlFDdWtZeXA3OW11b1ZQaWlKRTJvUndZeTVlclFrU1d0ZVEwSW4xMld5V2Rs?=
 =?utf-8?B?VXI0RjRISkFJK1UvQmVOTEdoY0VBNzI1M2FQaTV1V1d4dTdZWGRkV01Ic3hz?=
 =?utf-8?B?TTdBVW5XcnFXU0FMbDFlOHQ5MUNUakk2dWZIODFLOHR0L1E3UldoTkZyUVZF?=
 =?utf-8?B?UHJUOTZ5QU5nTDlkaUNiayttNndMMEYyZDZCUTllL1UvS1ZSVk50eE5NblFx?=
 =?utf-8?B?UjJCdnNwWGVNRE5MN3VWcmI5T3dtcE9nUGtNckljUko1ZVFUVzdWY0l4dmI0?=
 =?utf-8?Q?rAXcr/QC73RSoubACSKmxzLLw1mDDEl3X1EdqNzgs/ufa?=
X-MS-Exchange-AntiSpam-MessageData-1: kNSeIPXu1iFrFw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220b7f4b-d964-480d-ec5d-08de99c1d18c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 01:04:46.7677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxRQwoKJ3w+E2CPhIutkBQ/LbG41rH00OekrBjlQp/Zr2LNQ5CQMXdkHr39UfBhBie+6ZLfO1aMIOOo2ttSULA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361

On Sat Apr 11, 2026 at 5:37 AM JST, Timur Tabi wrote:
> Introduce FbHal method frts_size() to return the size of the FRTS
> window.  GA100 is a special case in that there is no FRTS, and so
> the size must be set to 0.
>
> Note that we cannot use supports_display() to determine the FRTS
> size because there are other GPUs (e.g. GA102GL) that have display
> disabled (and so supports_display() returns False), but the FRTS
> window size still needs to be 1MB.

Order-wise this should probably come before patch 3 - I was a bit
confused about the fact that we are checking the size of the frts region
since it is defined as a constant until this patch.

>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs           | 6 +++---
>  drivers/gpu/nova-core/fb/hal.rs       | 3 +++
>  drivers/gpu/nova-core/fb/hal/ga100.rs | 5 +++++
>  drivers/gpu/nova-core/fb/hal/ga102.rs | 8 +++++++-
>  drivers/gpu/nova-core/fb/hal/tu102.rs | 8 +++++++-
>  5 files changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index bdd5eed760e1..abffc21427a1 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -216,10 +216,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp=
_fw: &GspFirmware) -> Result<
> =20
>          let frts =3D {
>              const FRTS_DOWN_ALIGN: Alignment =3D Alignment::new::<SZ_128=
K>();
> -            const FRTS_SIZE: u64 =3D usize_as_u64(SZ_1M);
> -            let frts_base =3D vga_workspace.start.align_down(FRTS_DOWN_A=
LIGN) - FRTS_SIZE;
> +            let frts_size: u64 =3D hal.frts_size();
> +            let frts_base =3D vga_workspace.start.align_down(FRTS_DOWN_A=
LIGN) - frts_size;
> =20
> -            FbRange(frts_base..frts_base + FRTS_SIZE)
> +            FbRange(frts_base..frts_base + frts_size)
>          };
> =20
>          let boot =3D {
> diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/h=
al.rs
> index aba0abd8ee00..1c01a6cbed65 100644
> --- a/drivers/gpu/nova-core/fb/hal.rs
> +++ b/drivers/gpu/nova-core/fb/hal.rs
> @@ -25,6 +25,9 @@ pub(crate) trait FbHal {
> =20
>      /// Returns the VRAM size, in bytes.
>      fn vidmem_size(&self, bar: &Bar0) -> u64;
> +
> +    /// Returns the FRTS size, in bytes.
> +    fn frts_size(&self) -> u64;
>  }
> =20
>  /// Returns the HAL corresponding to `chipset`.
> diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-cor=
e/fb/hal/ga100.rs
> index 1c03783cddef..0e7d91fbd130 100644
> --- a/drivers/gpu/nova-core/fb/hal/ga100.rs
> +++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
> @@ -66,6 +66,11 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>          super::tu102::vidmem_size_gp102(bar)
>      }
> +
> +    // GA100 is a special case where it has no FRTS.
> +    fn frts_size(&self) -> u64 {
> +        0
> +    }
>  }
> =20
>  const GA100: Ga100 =3D Ga100;
> diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-cor=
e/fb/hal/ga102.rs
> index 4b9f0f74d0e7..167d38e34370 100644
> --- a/drivers/gpu/nova-core/fb/hal/ga102.rs
> +++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
> @@ -2,12 +2,14 @@
> =20
>  use kernel::{
>      io::Io,
> -    prelude::*, //
> +    prelude::*,
> +    sizes::*, //
>  };
> =20
>  use crate::{
>      driver::Bar0,
>      fb::hal::FbHal,
> +    num::*,
>      regs, //
>  };
> =20
> @@ -35,6 +37,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>          vidmem_size_ga102(bar)
>      }
> +
> +    fn frts_size(&self) -> u64 {
> +        usize_as_u64(SZ_1M)
> +    }

This implementation is identical to the one in `tu102.rs`. As a pattern,
when different HALs use different implementations, we define it into a
function that both HALs can call instead of repeating the code (see for
instance how `read_sysmem_flush_page` is handled between ga100 and
ga102).

