Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFEF30E82D
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776236158; cv=fail; b=bFK70zDxnoQei88gPqD3oYhhxI98Uj3japPqARt8tmXeI7tEW5MNrENBQeMhmJ71qHmhfRQ2GqhnJ2if/yA85vYNbVPL3QeAthx/DriPPffxBO2nDPNLFTw8qEdRZlUhj7xpiRwdRccYTmnhSvEYT3l3H3cBtYtzp3dsc2aXPHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776236158; c=relaxed/simple;
	bh=4JB4/keWNJcYGX6QzmHiB7WfOvlQSjTsT8CnvPI1VAU=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=SvoDwau0qIUAFBB2+NvfBO/Tsv6SlSwnG4jFFTh3gXxVp5adtGNfs8qGRQWWw+aL6h5Vs/cYeR9ARXJemUecy5MgNLqKxNrGdF/HZ5ecJioWKVuf7kVVrgJDVVJo2TD+tP1z2MYwkTIDhy8pkIT54BNRlQvQCcG0Qk8MM/HFZgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KoX4OkoH; arc=fail smtp.client-ip=52.101.48.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KoX4OkoH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWGv/+jlJkQsjSHTV6aRksj1aUK5qHt03ndSEVBtvOioJjjsSTayN4ltFF2jkcKB/Uje0EbGrOk/mKuVQLgj2Q1/02w6BcutuXkdsCCithRzWzKa2QW6zfrQw+EDUE+UOuZ1mOneZ0Y4pC7+tKdSClg3wiY6wr3GHC2i0E0eQX6APwhLmbAWYBREp/4dYWcKiozODCRo1oSufifP2E4om5SUmPEJ0Q/KxgWl5anG1EhqwvatzJ/sMfM7iTeQ4jjeTzTCAjIKXnxSIrF7QFfKY0rDDz7FlSdW7g8Ps9CaJq845ZKig+TTui5IDC+wgbzY6Ps9t7c0h3e0/YqkmzC8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHbBBgChUJvKhyCs34RhDf5L8znvvOWq93sIDvwz5ik=;
 b=y9UomyZ7784x0p1S0EvRJjQhGKNawd2lOEckmfvHqlBROSInzYojnRUN5NzXVa1UNvwdeVSwKvHRgLNV45cgqndQfRId1O8SlcHRGCeunxe9EpJQqFlsjPuHjRybUdvAYDoqPTMMO9Ofzo97yUEa4FaY0ezwo1C048Zalw4p8n9cwoPIz8j8EAQMcgdtBH9ERSijRyV1JEZgz15rWm9AL78FvR+39SviIcn4afigqbMDdHbQdK3SQuVsdMYjEQfxi+OP0Snt+7MmMNJfNTsOU6/cCUiJnf4frboFoG3T6n1NESfsIEhIm1W45kv9SuYthuEQI2hfszuJvGYQSiZL+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHbBBgChUJvKhyCs34RhDf5L8znvvOWq93sIDvwz5ik=;
 b=KoX4OkoHHZ43JV9sHJZVa5Kn/YP1uHBlOrbc6EChaUVGApGwMDzT3TVDFFuAL5oDoweVYryUhHQdEVgs1tOfWcN1dSo7Blifwm4Ws9sRoyHfbLlCpnAPPvjE4/S/oBFVGNTOWxCptRdhAsErrSNqQzV1flyd5t0bL4CC6IZZha9zlgl+MTuOAySLbuPzKGhD9vUupoBOJWsorFtJkFC0g7qgkPAhVg3PP/7KuwdeI6w+mWIVJL1CyXzW9v2N4605xqL0VCCorfgUCvvOGatmiCwb+FTJ7JlXlqrhfunrqlyPXoLVtdWGutcdHMVJvb31ZvohznFXn/JeWQsd4c0CzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6628.namprd12.prod.outlook.com (2603:10b6:208:3a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 06:55:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 06:55:49 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 15:55:46 +0900
Message-Id: <DHTJ5WLPKI7K.3T2F0MF80A792@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
Content-Transfer-Encoding: quoted-printable
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-5-ttabi@nvidia.com>
In-Reply-To: <20260414235047.439322-5-ttabi@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0208.jpnprd01.prod.outlook.com
 (2603:1096:604:24a::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe5cb44-9179-466d-688d-08de9abc06fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	R5MnxxS9ltpp8rQPl/tZVVGtHhT21FmBfuzpuMPOrl5bRaj3LgfZ/782XNXsGIZw4yq6q2E8ILR4eSiOywrDBhW9FY0TOyvm7ml8sMLubUWENDajO/Nn2Q2O4A/WzVVnn78+vcbbNomthtAIJ7AQE9UMAqTrG2dj0C1HDtixSz4zXA1OBeslVdwbLhkrE7Rm2QuulyILZDpVehEivwCcbCjKr1u/mfTwezOtA/zktVO5gKvTdQm1Di/DKuL2zqICvk08psQxJG/LBSHvTbFehSdaX+n99N6j/hyCmwWIHSr5VstceSqU0BEoIHBWYQOFX2z+eA0UTfLqp9axcqBMzqf041igSEaEqvretdNM6mikHkdig5PvrTn/BU1uHTwVnRdPA+1n+0n98xCYTkcQi4nBaNX25XSfdqyDOcPOqrHKkmUnmj+rN3mBlzTNubMCcZsp3pS2BREf9vjYvCB54SeEY5+mYyUjEqQUz1akMxrzBr+J26narq1bH54wGso7vzlxUE4/7aWKKJAGxProdV7DjXxubkBAllyK9dFV/VVO7PT1I+ELJMEkqUDbwjctIofconDDSAjbp/5by1iU6oYCuKKMvc8eBO6USwBcqKXXAXcpLdb4QJlLJjypl9t5s7blZBrSGMnsWr4VeXWtfU2s5yRMqrrc/zBasGgzxeq87OkcP/dlsH6eH0M4s7ileB+pibUoAa/gusJWHcjpCH+aX2oYFk4KoD/WKoRT3UU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk1KZktBVVhueVVVNy9ZM1o4dGFmaDFRYmdPRmIvNUVidTBwK2NPTGRhdjhj?=
 =?utf-8?B?K2d5QVhsNG42SDBYdVExTkNNbmJscWROYUFwZ3c0TFdNbEc4cEtqQytDTnJC?=
 =?utf-8?B?Z0diZ2lPa2owVnBuNm9DeWJJenk2MUF4NkpOa0Q2MzBxRjBpRmFCK0o5cDk3?=
 =?utf-8?B?TmxuZFVYcFp5U29PV3lndHlYTHBUMnZvbE9nUTB0ZTNjNEJwS1hEb0VBdlNE?=
 =?utf-8?B?NjJ5ODFXRmhXd0RZNTgrYU5pU3dwaGozczJLbENCeUo1VmRZOU43QmVYWUZS?=
 =?utf-8?B?TWQ0RitsSHpHZ3BOQ2RPQmhEZVZOQ3RycFpOU0xZZDJNdVRNT1MyZndvRC9s?=
 =?utf-8?B?aHRKNWRnMHJBZXNBblVmRjNUNXpkYjZTSUUzVEwwWEwzL0xmSlM2bnhCY2hE?=
 =?utf-8?B?SGVjM0I2WFJPY1JDQi9PZUFUUXFtZzFXTkxkUHo5OW5ad3dOZy9WdmNyR0RJ?=
 =?utf-8?B?d3pMV1lzWWQwdnVkbWI0clBlQytSK1VLN3gvalhXOStzNFgxVHR1NmhvYjZK?=
 =?utf-8?B?bE90WXBsNVdFTEFwdzVHK3cvM0N5VzVQRi9UZ3dlVGs5TWJoNkVpQ2VqT1Bn?=
 =?utf-8?B?QWxhQkpmaWtYOStzc0MvZytKYm9FMjd4emZXWklha3h3U2FKNDVGblBmTnQ3?=
 =?utf-8?B?dEdONVZxNzVOV3FNNjkrN3V6aGNyVVlDT3NlS3RlN2dLTXI2ZTREUy9IYlAw?=
 =?utf-8?B?NWFNVWlFcDdOaXVZYkgrSjJrVXZ6NmZKSnV5ZkIrU0VwMmpETS9pamlSZmx0?=
 =?utf-8?B?bWFudmYyWllCUUN3d1RqMXZLOHFZODNOdnYwbXlDRXIzc3h3TVlwaUpCRlZk?=
 =?utf-8?B?Z240L2NWUkY4clUyV2Y2b3hOTTJMTklsb29ueStMU0RNem50a0QyUmF4UmtM?=
 =?utf-8?B?d0xGNEc5QlkveUdqUVg2OG5QWitGNmhuN3huUXMxcy9lRWJrSTNxSS84NU5N?=
 =?utf-8?B?bTd1cUd3Y2RJSHFVeFhyTnhYTDVKU1Z0LzNJR2d2cmhZUG5XeXRFWm5xWUpQ?=
 =?utf-8?B?ejJLRG5jRFUvMGMvVWFMdnJIWUZ2UnpCZnlQRmNqWTYzc0RyRExjWkZCM3M4?=
 =?utf-8?B?UzlJWjVPYnplbDFaR1luL3pSaFNDaFM2SmVMM0dGaTBqZlYvN2ZLakMzcGtJ?=
 =?utf-8?B?Ym9VVTV3L212OFF6c0piSUQ3RDdQcnA0eW9kYURGa0hxME5sRzMza01vYlRB?=
 =?utf-8?B?MkVDR1lmQk4vNThSUjM3WHkyNG11REpwYWZGSWFBN2h0dUUyK0V5c1pCdlBj?=
 =?utf-8?B?MGtxaTBoSXpVWCtJZTRuR3crc3FUamVVN2s3WTBMa3lEclQvZ1FHTzgwalJN?=
 =?utf-8?B?UUFPRmMwYUxrZCtRbHlWOGY5c0FKTjIxNFhVZ3h3VTB6UGhDMVBuVU9zaUN1?=
 =?utf-8?B?bzA5OEdqSm9HdHFCeVBkY3RVSTZ5NzdrSSs3eDU4aU85K2pSczllam52TjBK?=
 =?utf-8?B?SnFucUFLU1U3bDJ1TldkMWVFeHNmaU5RQjNkYTlVN2Z5RFlRNmJUSEwzTUJC?=
 =?utf-8?B?V2hyUzlLZXcvQVJNbXJoOXM2UFJyam9FbjRQUFBOaU1wUGdyN2wrSEpPTUpk?=
 =?utf-8?B?ZXpJRkVpY1RGRS9ObjA5TGdGMGR6VjZDTHNBalBnQXhIRExHVlBROVB3aVEv?=
 =?utf-8?B?eHcyVVNCOUV3RzhJcW5XK2R3amVoTmtxckw4anZ3MGtaeEo5QlVHYTBmM3E3?=
 =?utf-8?B?eUFqcHBZMnN0a0hnaFdRWnJLNE0yTmhZNjFNWXRSQSt5ZFIzeHVmM0V2dTZy?=
 =?utf-8?B?NFhZY1RWZ1B6U2NWaUVHeVFCaUxEM0Z5VHV2V3VwQm05cUR1dHRuZVVQbk9F?=
 =?utf-8?B?QlFoY2RaUjVzVXJ5eG54Tmg2UmJ5em1wL3puaVRWSnpLV3ZiVlBtOUFUbHNn?=
 =?utf-8?B?NG9wZ3hjVTVKbDAxOXAvb3NpUVJHWlVVSy9mMnppcXd3dEpFZVoxVWYySnE4?=
 =?utf-8?B?RVJVUUltRXl0M0hlWnVESis5blZlMzB0TjBFTXJXNGQveWZHRkpaYkxUNzRZ?=
 =?utf-8?B?aS9hampnRjFUQUdXdGpGUUJzSjAyaVJ4VjVKN0Nqa21YeE04U1lBeHVxdWVD?=
 =?utf-8?B?TFVtMnRkWGxDUUJEdG5FTlV5c1Z6N2xDdGdwajFpNEUveTYwVnlHNisvRjM2?=
 =?utf-8?B?VEhqKytQU3JxNko4VTR5U3JuemZCdDNrN1FWNXFOdWN1eG1LMDZnMldpSVJL?=
 =?utf-8?B?dCtKSVg5bzRNU3BSZUdoOVJKcmloVFMvSklhTHJiditWRFFIT3JJSnVmZVFP?=
 =?utf-8?B?My9xSWEwWFZCRTh3VnJxemQyc0JtSjRDWUFFUnZaQXRKajJoa0QzOC9vWGJK?=
 =?utf-8?B?RGIxQmcwMjFzaUJXaVMxcXNHQmF5WURmQ1pBaFkxOHR1UUNSS0Y5cnNwQjlr?=
 =?utf-8?Q?2+LF+hnnRnVP5e3CzGo4mK4Cw+O0g2xI6xZRyqRJ9PDbR?=
X-MS-Exchange-AntiSpam-MessageData-1: H2KdxuDtOZLdIQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe5cb44-9179-466d-688d-08de9abc06fd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 06:55:49.6157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAyi4AEQ6P/SjjnqsvMyQNAXGMOftrrMUwqClusBWNgJaRKaVL10a5yw1+awsjfuf85Xkv1TQ5pNsXH9zONQXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6628

On Wed Apr 15, 2026 at 8:50 AM JST, Timur Tabi wrote:
> Introduce FbHal method frts_size() to return the size of the FRTS
> window.  GA100 is a special case in that there is no FRTS, and so
> the size must be set to 0.
>
> Note that we cannot use supports_display() to determine the FRTS
> size because there are other GPUs (e.g. GA102GL) that have display
> disabled (and so supports_display() returns False), but the FRTS
> window size still needs to be 1MB.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs           |  6 +++---
>  drivers/gpu/nova-core/fb/hal.rs       |  3 +++
>  drivers/gpu/nova-core/fb/hal/ga100.rs |  5 +++++
>  drivers/gpu/nova-core/fb/hal/ga102.rs |  4 ++++
>  drivers/gpu/nova-core/fb/hal/tu102.rs | 12 +++++++++++-
>  5 files changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index f357fb28b22c..a305a6dac758 100644
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

From your reply to the previous revision [1] I understood that this
should rather say that FRTS is empty. Should this comment be updated?

[1] https://lore.kernel.org/838f5d39768881b05fa83c20f2706faf2b043a43.camel@=
nvidia.com

> +    fn frts_size(&self) -> u64 {
> +        0
> +    }
>  }
> =20
>  const GA100: Ga100 =3D Ga100;
> diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-cor=
e/fb/hal/ga102.rs
> index 4b9f0f74d0e7..3bb66f64bef7 100644
> --- a/drivers/gpu/nova-core/fb/hal/ga102.rs
> +++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
> @@ -35,6 +35,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
>      fn vidmem_size(&self, bar: &Bar0) -> u64 {
>          vidmem_size_ga102(bar)
>      }
> +
> +    fn frts_size(&self) -> u64 {
> +        super::tu102::frts_size_tu102()
> +    }
>  }
> =20
>  const GA102: Ga102 =3D Ga102;
> diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-cor=
e/fb/hal/tu102.rs
> index 281bb796e198..3c85bf1b627b 100644
> --- a/drivers/gpu/nova-core/fb/hal/tu102.rs
> +++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
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
> @@ -38,6 +40,10 @@ pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
>          .usable_fb_size()
>  }
> =20
> +pub(super) const fn frts_size_tu102() -> u64 {
> +    usize_as_u64(SZ_1M)

Since we will apply this on top of -rc1, we can use John's `u64::SZ_1M`
instead. It is available in `master` so feel free to base your series on
that.
