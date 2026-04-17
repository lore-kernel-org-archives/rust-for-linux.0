Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A377345CD8;
	Fri, 17 Apr 2026 07:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776410849; cv=fail; b=UJOXCKs2kvuEXnwSgF9KJWPlmw2dLi0d5L6eqcMqMzFNTEw8SEY4hjDivzTyQHBFqInw4N7ae2Nxzt8gutw3+bYZS+Bqzy083KbCQYzLksD+FMs6xe3+Zu8d3fTO3qFFKBQmF8+81SLWFx/nGqhl+pnKkI5Inj35mDB9Mei38CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776410849; c=relaxed/simple;
	bh=vPCv69vXoS2P3h1t/tsTned0bFtOJ45Z8Ldt4GcUj1s=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ptO4a0LmwkVfj1pQxV3I9V7cTPda0E8hDhtOWBJ/DXh4N0AMKPag8xHC1kbbpgOcGaa1FLOSGiNl7NnvBdjDk9vpKjint5Jt3yedFEbYENu+wA+CVsrvesM3Ay1Fa8RtKlTkAtuSHVvN3TUmXRKQRlx5R7UFaADJ1cg/B+GA56g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bzI8r7LT; arc=fail smtp.client-ip=52.101.46.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bzI8r7LT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEuXOKlkccQPZMKvw3DCQB4gJD9h9NtrnL2u57GtJHrC2eZ2Xnyjt/Ns49WLYZOBYa4DTWrq6Fm9vB0rldXgJnrxxApFrwH3QkYOdYMq5R9IcyOwqhOnkk/z81GymZMKFWA1Dbar1TRax53Nt8M7CTD6lQ+F6UDyKgtufRL0dbS2L1Ur1qnHb42T/Udy+PTYkWhYR+j3QoEyu6oNt+ReUQoZuM039wR92OYiCnw4maBjeSNS157a68VKaU8M6WL3NFxywHr3vkrzfJkEbY+Pu6TQRTALFFIOy4E8Imr9L8sVfjevMAbFwcOkYr7TV1a1zWVwdfH1GGqGD9LmeCBdFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxDG1B+c6yHIywZArPI4A1c+T0qUOJOC8QySLKPnWUM=;
 b=xOdADk6dAz815yLI+YgWTxa7eru5lcBkx4pAK44fccsiKumeCHqnxm6nun+F43gRs23sS9/i/bAve8qwQ95K1OKH/9z8hLWEPj1eBAExDyMoYiH7nrA1DSioDR0YvIEHbTLYRKNJtgkWetc/NypZIi8GQPMBDwxqCeWAKcM+fsTszew4yw6TctkoCiJxYPx9uWc5fDpq36wGbOHwKe9YpiVtG6dvbj52lV3KoQJbzCX6swkF0XdLvHeBZ5ah/3mFuz8zQnv8zUZqSd7cb4betbcb89n3290t2nkzDlOMUrYOPLLq5A6xzdDIyzX1Pj3eONTDerpTjEbakjypRpMUDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxDG1B+c6yHIywZArPI4A1c+T0qUOJOC8QySLKPnWUM=;
 b=bzI8r7LT6Kle8yrIC+kxl8vpl4msa0Ntpz7OZxW8gfqSvNlIakUC2235vWPvs2rpWr+jg3ZL2JZlLW8Yd6ujOSfTNopIRdP+syJz+DGt4ht8amlf4zhWcvM9S0OgK9d2YmRc0w25AKsxce+q36v/Ejz6OkvSO5ZJgBamwGRuS05FfPPBovIFn0dQBj82ai1OyWMgcibJHNH53+Zu4XPma/ngdxori5WgIA0nXrujAQRGOhjqW8VjpWZmNnuit6uo29MUBCkpNa1zmqON0Ggue8LGo9prFd+IaxVJ9hAeZ36JpfJGJlMdSu8m1LkZEM2712pNlwCFfo1O5R+iCuJ0cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8944.namprd12.prod.outlook.com (2603:10b6:a03:53e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 07:27:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 07:27:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 16:27:19 +0900
Message-Id: <DHV935P8FJU1.XZRWWSGFFE8U@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "Shashank Sharma"
 <shashanks@nvidia.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>, "Zhi Wang" <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "gary@garyguo.net"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>
Subject: Re: [PATCH v10 03/28] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-4-jhubbard@nvidia.com>
 <2a4c06e1616ec84e29166d881ec3240a1fd441d6.camel@nvidia.com>
 <cb2bf998-55cf-466b-a6ba-1851278bbf43@nvidia.com>
 <8e47b4697c213ce11dbdae8a1a3fcb591c69b34b.camel@nvidia.com>
 <8fb6c933-0cad-40b7-be0f-5aea648f56f7@nvidia.com>
In-Reply-To: <8fb6c933-0cad-40b7-be0f-5aea648f56f7@nvidia.com>
X-ClientProxiedBy: TYCP286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8944:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c9e8b5-3041-4915-f8eb-08de9c52c49d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cdHSauZ87Jyp345GPH13K2pi9VMZhwycQpL2kbI4At0ULZfHcOt+gleG6k0o4+1LTc164RhwRS2q7U2hSufG83Mz1UJ6LXjqX1gC+ZvKsbZywitiqMlNqK7fOHrbHYSci9JwIwk5IiksJ3tBaQoYfgMIkRpHfQInApY/ZTU6DB0ZtLyMpCNLIAMv8LCsnyrZySMmB6oFH9TK3LzYvzxVVsYqVQpQDiQ1rDl6j9Dnf2VPrYH8h17q/30lsR5oBTn95JS5t16plHfKTypru50wkCuhBrgFNygU/PgeinNpm9hO1N+9Cz5ZJyhZrZCjhVlk9V2MfxsqresrTioD4F3NzLjGaeuqu/oHKF8QSxmxbCw1EYwJK3+FnyE/9FQAveY/TsuUmTd0FI5gNI2kc7p79j25QmLvW5iN7IBulTowpvxGK0pECyGTircJHLGgMYvCGNLheA+lFKI6Ls3PjSoMyCsUd0uxPUOTBS/N7a3rVIRl5zYEI6ApIGDH4UFlB8SqYvPMVj6xgAgZorfQdHCTflBxgs2/RU9TAAMOAETcq9VFPs33Ye0emOARsioSO+j5x+eQBlPC7LOg8F/Hk4ke+kV9fcO3dzf8pimjUnSUsliRUN2xpQGd32rs07xpjfzwf/nts+Ng6EW+wrd4/OKFZQ4qHpRwKlexyaCwS1Vrow4s/v/bUPadfyw86SsdAsoQAoDhowlpnpDlnKipOxNcrjeZF+/lcwstQ1XE3JZ4NME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTBCNFVhc0wwcVh2UGpOQysyWUVWbnRyMXFaeE1ManlLSGdkaEJseWEySDQr?=
 =?utf-8?B?QzQzRnY5bjdqaXZmLzM3NXBmYVppNVZQT0twNUFKS3V1WVlNOCtPdmxrcmJO?=
 =?utf-8?B?YkFjUGg0Vk9UMnlDYWxPTkQ1MVJWVlI0S3hsWTU1Y2pMcFp2Z0lKeHZTbTA1?=
 =?utf-8?B?L3lvMlgrUTVOU1NuR1kweXpDUlBFaEg1cVFCY2Urb2I2UmpEeUJSMnUzMkpK?=
 =?utf-8?B?T3lydTkxSFVsU1hlY0FsblhJWEdlYWRjOUFtNjZsYTUrS0U4Y3ZRUE9WNTE4?=
 =?utf-8?B?QzdJOGZTSVFONUUzcjBGekY2NWZEREZVUXppMWNQaW4wQnRrdmRXNUlIdkdx?=
 =?utf-8?B?OTczM21CUnp0NWpKNWYrdjhFWkF3ZFpZd3Y1QmNsbzJsUWZONy9KVk5QU0pr?=
 =?utf-8?B?b3FpeEZkMXRSdnJjZEFKVkc5TmV1dlZsY2QvSVN6V2d6d2NwMTZJNEVydEZ5?=
 =?utf-8?B?Vjl0b2RtUkt2VTJMUDhWOWdIRGJxbVVjdExmQnY0dncyMHo2cTdjOFNtVXJ1?=
 =?utf-8?B?dDlJOFcvZm9SVWd4Lyt1LzU2VGRTQ1FDMkplaDQvUE9QcmNqdi9Xa1Y5RHlo?=
 =?utf-8?B?VzAzYklJbXN1cVNhbDlPUCtMNTlJdjMvdGphelEzeSs3dS9DdDZ6N2VtU2hn?=
 =?utf-8?B?TmljVGhWL0FWNVZsNzFncmR5VFN2dnBYYnVDcTQrOVJZYTZkeUdTMWI0K241?=
 =?utf-8?B?anVtdjc2VW85YVJwTnp4V001NUxOUnBsVllwL2o4d1BnMEpvemxsMXArb2ll?=
 =?utf-8?B?WlpwakJKWjQ3Mk5OQnNpSEQvdDM1NFltN3QzR2JDRWwrK1JjOEJPVnRZUjZD?=
 =?utf-8?B?K1ZDNlN4MHlacjFWdkJuN3pjSTFlbEVyNGFEUytUSVhUNngxbGgybEhoV21G?=
 =?utf-8?B?WXl1SUZWZWZyTm1vVXJKLzhQRVQ2R1JvZTZEczh2SUdzVS9ndUUvYkpXYnBs?=
 =?utf-8?B?eHBUNjQvc2Evb1d4U3Jxb0l1SzRHSmZQbzRXVVROVTZzZmE0WlJpaEEwL1Zq?=
 =?utf-8?B?b3NFZ1hZcnlkcnZRVk9nN0NXQXM2Uy9XdFdzV0hFNlRpZ2wwSEZXNGlLQnpN?=
 =?utf-8?B?bCtiTUE0VzFnUU5vbkpNUlNPckRodXEyZHhEWnJmcG5GeFFaeWI4aXZrMHZq?=
 =?utf-8?B?dms3UDhTS05XdHdBZ3hPRU5vTHlDV2lwS1oydVJHcGlRYWJkMlVlSGtZWTcy?=
 =?utf-8?B?aklFdlNURVhMaU03UGtIcTU1UnRsSU1ub1REeXhqR3ZnVDdFYitFc3ZDcmF0?=
 =?utf-8?B?aWRBc3dCTGZRWHd2bFpwcDgwQ0ovT1VsOVVNMXJWdmRPcHcvdnM2SzZsRFZM?=
 =?utf-8?B?bnRxbkhhSjJjMkxsMWt3MXd0ekZ0WFlFOGVVdFR4S2syM1dRN1I5c1lkdXN6?=
 =?utf-8?B?Zjk5Z2hqVmp2NVVuMGRFK202dDY2Z3Q3UTd5ZFhJdEJIL2Z0c1MyVE1NcE95?=
 =?utf-8?B?WDRoV1JXVG1WY01mbkw4c2lJNVpjMWlqN1UvR3MxS3dBQi9QSjRGN3VpUVF0?=
 =?utf-8?B?RnpGRUVtK2FLdndtbE4wb0FtZVlCbGp0V2RnZng4Z1lLUGhTblNHUWFNV3lL?=
 =?utf-8?B?VU80Rm1Wa3R0TmpkR3U1bjNMY2YyVVVTQ0t0NVB4bVdtV3drYy9sYVZwVlhl?=
 =?utf-8?B?Y3BCc1VWdDFUNUJzeVhkeHJqSUZvVXhBdG4xVXI3Mkw2TXRSdFk3S0tETzVl?=
 =?utf-8?B?VldhK2FRV29VQUpudnJvTkRZTm4yK1hZa253K29wZXhJNU5WT281WGxhSysy?=
 =?utf-8?B?UUVBczV6OFpDTTlpbGJuM2lhM0FXNjhsa0RtRS9FekFXWFl0aTNKZENPYXN5?=
 =?utf-8?B?Z21pVmcvQUUxWEpzQW0ydlZVRm9HNTU5ZDlZWFcxK2RKL3EvU3NjYURTeTVV?=
 =?utf-8?B?b29CN0hsdmFRS0l1TnhkWmh1cnhETWhOY2g1ay9IS2daY0xYTFpuSWNUVHQw?=
 =?utf-8?B?NFZjdmxoUXdDRW1lYTF4NzN5VDNObDQyUnBJTlkxVjNrVExiUk5Lc3pHSkZM?=
 =?utf-8?B?NmpYbkVlTXNLdkVReWtlVWpXczJzMDlRSTJPdjZudzgwUzFoL1NkU3lqYjVX?=
 =?utf-8?B?L0lpQmVWTXVsZWFZOTBQS1VTUzVrUmx2c0J6enUrWWIwL1NndU5PcHJFRmJu?=
 =?utf-8?B?dkc0bTlUcHZEM2trS0VMay9aWkZTeHUxMDZ0UlQ1cXRTZHJVZlRqZThYUUNp?=
 =?utf-8?B?SW9wZ3B2ZkFhQUMvK3E4S3FFbW4wZzcrWnB2K3JxRTFNdnhML25KTlQvR3E5?=
 =?utf-8?B?REFMTEIrTEE2a01OaFQ2SEpGckV2RC9WQWtHRm91dUJ4anFocnU0QnNLQWNH?=
 =?utf-8?B?SnFpRUVoOFJqOEk1eGRvT1BhRXhFUm1saWRvMVFOVmpiSUZPd3U3b0Zoa3U2?=
 =?utf-8?Q?R709rXP+JCaapFG/ejAs5NVIlkvs7iUwCxAOpdwz7aMPF?=
X-MS-Exchange-AntiSpam-MessageData-1: baBx+lar7FZllQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c9e8b5-3041-4915-f8eb-08de9c52c49d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 07:27:23.8554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEYplKvXlKghCeXnIX1c+Jpw03EQbU0vpDceS9PjAi4Sc20mBTetvlUR5HmlOkIAZok5qgJb893CqkU794YQdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8944

On Tue Apr 14, 2026 at 6:29 AM JST, John Hubbard wrote:
> On 4/13/26 2:21 PM, Timur Tabi wrote:
>> On Mon, 2026-04-13 at 14:08 -0700, John Hubbard wrote:
>>>> Can you add something to the patch description that explains why Black=
well, unlike all of the
>>>> olther architectures, is represented by two Architecture enums?
>>>
>>> How's this:
>>>
>>> Blackwell uses two Architecture variants because the hardware itself
>>> exposes two distinct architecture IDs in NV_PMC_BOOT_0: 0x1A for
>
> This is really what drove it, for me, though: the hardware itself
> saw fit to identify these two variants as architectures. It's
> encoded into the very fabric of space-time itself! haha :)
>
>>> GB10x (GB100, GB102) and 0x1B for GB20x (GB202, GB203, GB205, GB206,
>>> GB207). Open RM maps these into separate chip families with distinct
>>> HAL routing and different firmware signature sections.
>>=20
>> We don't need two arch's for Ampere to handle different firmware signatu=
re sections.  Looking
>> through your patches, the vast majority do this:
>>=20
>> 	Architecture::BlackwellGB10x | Architecture::BlackwellGB20x
>>=20
>> Looking through your patches, it seems overkill to separate these two.  =
The one or two instances
>> where it makes a difference, an if-statement will suffice.

I have to agree here, if we didn't split then the architecture IDs
`0x1a` and `0x1b` would need to both map to Blackwell, which makes them
impossible to represent correctly using an enum.

And granted, there are lots of

  `Architecture::BlackwellGB10x | Architecture::BlackwellGB20x`

in the code, but that catches the attention only because the variants
share the same prefix. If `BlackwellGB20x` was named something
completely different, it would go unnoticed (just like we often include
`Ada` in the same match arms as `Blackwell`).

So while it does look a bit strange to have 2 Blackwells, it does
reflect the hardware architecture correctly and doing things differently
would result in more complexity/incorrectness. For instance until v8
there was only a single Blackwell architecture with the ID `0x1b`,
leaving `0x1a` completely unmanaged.
