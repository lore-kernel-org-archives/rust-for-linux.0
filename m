Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013039.outbound.protection.outlook.com [40.107.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A272C3260;
	Wed, 18 Mar 2026 20:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773865550; cv=fail; b=A+pPx0nU6f54AoWkZfRvtvejK0Mvb9jKAX7BVn5bp4KQLJP4i1vgWgOn4hYCqvv9D6QI+yqPiWzdjrmsL8cFU1nZgPnFPMqp0q65+mXrxzUd6dJz0B+jnO7N0vCCViIw1rK2Go7QZmzpb3B6RGSTM/Um7ZHIwq30iToL//Vv7Ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773865550; c=relaxed/simple;
	bh=a0d+YgOiA+jNAHY08PZssYiZO0SK5K/aULZLhDSvteE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oSdRLoSQmzylLF8YbDqsl8k4s822lRMO1nOwMf4lGlqG75DbKILK/neevu7JUapucZ0eP/znUDppKafViFvDze8sPwcgy3+RvDWM4ldppk7jY0VEy4OzVJg0yXtwGtnpfUiSyHbMD/x8MrsWyMoGapcvIqpe/L5Ri/Rx/q21tvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TEEQdU/R; arc=fail smtp.client-ip=40.107.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TEEQdU/R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lE5f+8/jYwMpx7qCCV61RzGjP+tn1cm5ug4bwokAb+Yz3+Eky/ZDzVOSp//6mpHvQzJ2MBd7iwxipEkHq5C0PkJ4z2zyBIdRaoVuDCknNvA7N1wZWWLsWQGFbDqwno2/YFFrdqojkiNP2GQVE/zhhaqpZ6ZZWhfdDS+I5mkKeoJ0Vd+kkkK1e1m2JvwTpAqdKnvI4EQxnNsG1bFmauGHMKLwKH5ojJt2d16VOKxR+tzFjqw2ZCxotO2wOqzTBhSQsyf7rdEJwmRyK0RS1rXLmPTzCKeyUyXUfcZGVUP4jAUMr62PGx4kxVRA0ekV2JGr1DD2Ox/LPL3VYDV83TzeJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ukOPbVmg+600h17oSuYY3wgog9116BuNUuRDU2QtCI=;
 b=O+fzamEl8bqvk0+JRDZV68SqFp2K+azXwP6lL8MbGdEMzTX6Py3cWRgwZmno6ET4lMlUDUVbBZ3pTIsZe0puoMuoTF9DlJ57qC5e48DVoHjsxusETv3O0iH6NRbV/fA0lUk6Zexx6tusIPXv7tm4JC/3UNqZXGgvhIFfrOiRo9R3vQouC7ZRZrQEF2q0V1UEQhkHqgDbTnUHQCWt3j9Kw9SRBPNwY+YriUjS7H4Wp0/TEPs3X55lDWQqgvHu1p+76sRM/1XV0a8IDmAL6/FFAii28colEqD+IVCXvAeYPxro6E0tsvw8KF6h/lsc+ZvP1xXj2HDHkTfPUsSTlf/tSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ukOPbVmg+600h17oSuYY3wgog9116BuNUuRDU2QtCI=;
 b=TEEQdU/RMkKKS7ynn1a23haRx4W+NtZikB2OY5SZskPMJejqRTJCu11yjBNzpLqZ+JEJlBWJ/TiSszV9S3HaJnMij3C42dfmIfs1Tboy8EguF5KKYD9TvEDqnRAmetMaxObWTwYNEuXAm1oaC+5E4D0CQ/6x6qSbnPpYzEae1JOXdXmytn5GSZ8UYpfnQQgPhUq2Cjqb7VsixjYDMuOaR6VD6pjaMyuE/GfXZy/Gfn1Qp42iyhra8e6l1GjkoG86X+LqOsE1wMfpQLgmPEFZ+YZzKDTfyd1m+/3HBOFM32NXIlHHeXNUCKbWAQXUO9nGjKGENtWLrj78gTrxg2OFxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 20:25:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.007; Wed, 18 Mar 2026
 20:25:42 +0000
Message-ID: <9555076b-31f0-4b75-82af-9f9221ee36b0@nvidia.com>
Date: Wed, 18 Mar 2026 13:25:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/31] gpu: nova-core: firmware: Hopper/Blackwell
 support
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0043.namprd17.prod.outlook.com
 (2603:10b6:a03:167::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7e57b8-45fa-4c44-26b0-08de852c869f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zyp5htqe0Mf0t7etOxrqjzZ7T/JoGKO92LpVPHxTKb5+AlmWvItKtLW40chHjb/VsER/sreTnCktJKfDCc1ZhZjyOJjZ5g22M5zmEDruzKo5R+VwphwM5EX6frWnVCHkjD5yB+HRZhuds8hbV3PD/a99n/pBfRHI2K8xW8lP7/SFjd0IhqBCPeRC4F9Lxcxf701GNj1EVODr5W9iV4QQo42OHVUStKf6R1Eta9comUJyDUGWfiXnARqQgxOKq7Fm0oz0iTuUqXYHXRLHF/+ZrxGThOGNF53qFX7hU31Y+Uzbn1rYgB+JS3sawe5IDanvSs+pIVya+1ZQDKGScKtkA4mbqypGsFsKBvGS6xQjFts0jPOLQVI4eNs1+ZwMVOQRmB9Gd0ZxNhdE7f6aOR8zbfo7bkbGPvRwPVCc8fSuiP/83QXDEb7m47vMA+LTUPpUTq9IqyHrCGliCjp/08x4HwEFPuSzTFcfdV5ONeLL4OF0LgYbmxxOzgSXEi+VmTv3NsQ6hNCeM50Z0sXUTGI0Xdyf3eifbOEj2FW1QNSOp4AZAUa9+UvhLLtnZUbYnRIREF0ypgVNDfq4fYUVCmm+1dALNXO2w47XnIGj1sWgQNd2t7qoN46esebk/bGLowNoNbn8CvpSVGWxHFNIHleuBT32pG3vfvHXXfd+HIAKtUqIDUqK7wa49Jji87EOcaHC07lMdKmde2zVj4eG5uWat5btLnonOCqlLb/eELxg8bBq7abMnJtbLYPIlQPfT77I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkZEeXhZRVZyQmlYbjNwano1YkU2cWRYdGNRa21VSS8rM0I1Tk1JeC83eVUw?=
 =?utf-8?B?cTA5RytTVGJmWE5MeTdqeWN2RWpUaTBGdWNRME5GQ043V2VaU3p4bVB5bDBL?=
 =?utf-8?B?aFRtbit4eEplOUdpMjlRSWluUGNZY3ExQ0UrZFErbzkwclFLNXdMSm1oazMv?=
 =?utf-8?B?RlpUb2xEV1FhQVJtajdiSTdnaUovb1Nka2FtNnZ5RjM4Y1lwZXB1OVJaQWps?=
 =?utf-8?B?Y1ErY0p2Z1VvUHhib2xsdjZuR0duSEJlaFAybm82VDdoVkV6azNwMlB1d3dK?=
 =?utf-8?B?bjRJQVRMSXhKc2t2T0k2b2Ftd3A4b0htY2wweVJ5VWtWVnJHc1g1dnlZWGpl?=
 =?utf-8?B?ak9tcDJ5UU9neGlWSEFoL0lRY3BybkJTbDFjTytidDRER1lpZzJJU3hyM1Bz?=
 =?utf-8?B?YUs3NFZPMXJNb0Jjbmd4U0t5aEUwbTFCK1FvS1NnUlB0N1VEL2c5elZSc25n?=
 =?utf-8?B?ajg3U0Nkd0p3UkoxV0d3QTJxNStFY2tiUC9PUTVQcVcyVlc4clRySHZpODVu?=
 =?utf-8?B?ODlFTm52ckxJTEpMeEhUaWw0RitBOGs4MG1Hb0M4Q0NKVGtzYU05bGZvZGJD?=
 =?utf-8?B?UzFUZnBRbXZ3bFBzYzltTVB3dUpxVDQwME5LSml0TXF1L0NnWFVnM21WSkdF?=
 =?utf-8?B?aEFZeGVaak5peVFUb0svMm1kWFowa09wVnk3b3hVR0o4clMxSUpWN3FqMEd3?=
 =?utf-8?B?TzFQdlJmK0p4UVY4Yk9MeUVmMWdtc2grTmt4TU0wSUI1MjFESEhBcllHRXJ4?=
 =?utf-8?B?dXRNL0lyaHExOHpza2tPcEJsaE9KWTZZRUJxZHlDYkQvaE5LUGg5NlY4OTRR?=
 =?utf-8?B?MDM3Sis4eWJXd0hZQ2ZYUXJqcEF3Z21RbDg5bkxsUkEyVytwb3FWTGVLSjJC?=
 =?utf-8?B?WmFKTm5ESVNjeHVzbkNyb09oUXRld2dsUHkraWNZcktRSFEyNVUxLzNFSUh0?=
 =?utf-8?B?THRSTCt0ZHc5dU15SUM4UHFlZ3BiNE1NZ3dMVnAwY3VFYnRadWwwa3FwVmQy?=
 =?utf-8?B?NXZBYnVvd29GL2E3Y1c3UU5RSERnbGpZL0NQTjFObXB2YVVvRjJaSXR1VmhW?=
 =?utf-8?B?VFFqWkR4UEhIUUYrSGNieHkvb1locXRpeTMwNFRzWnVjZFdYTmJOaU9HUkFQ?=
 =?utf-8?B?dlFxZWtoQ1ZWdVhrSWE2UHlOaG8yeno4YU5JUlgxejJqOGRlLzVvdkVkN1o1?=
 =?utf-8?B?bnlLTGhZTjREK2c4SkJNYks0Zjd3VWM2cWxLT3VPMTFybjFkRk00SlkyOWlD?=
 =?utf-8?B?a1JVMmJvNkg3MkVBZmcwYTlrc05Lc2I1dEhId1VWbVlPdTY5RG9BVWh1dW1k?=
 =?utf-8?B?bnhEQWpESEhLQm5oeWk5c1JyR0FUUjQxU1Q2VGpudDVqWWYyck1lODJHcmI4?=
 =?utf-8?B?TFBWZkVaU0VrSXNPYzNsVGd1RE0zS0pURmRwVytiU3JFMDBQRFdZakhFSFJz?=
 =?utf-8?B?cVJIdEE3ZXF0dTA2UHdWUjJ4RkN6bzFHQWpqZ1gzYm5Ob3M5c1V6VGI1NHJD?=
 =?utf-8?B?S1BHcVc2MUQxRGREYXREZTBmaEozeCtNY2VnUEdwSGl6eGpOY3NUaDZQWHA3?=
 =?utf-8?B?b3lHVG1jVkxrbTFabGlDSnBzUUJwaEoyREZqWjg4c3lDb3ZLVFZvTStJTU92?=
 =?utf-8?B?STQzSkNNT1F1SmtBeFNzalJzZW0ybHppVTRjUW01NnF5QTQ4U0YrM001TDBC?=
 =?utf-8?B?K2toQ3Y5ZGhMZm5uZzYwQmNXYjdzSzkrODc0WktndEczZlZaN3h4UWlOK01U?=
 =?utf-8?B?c21Qbmo1ajdSUm9kaHFjU0RGY2Z6cFFxaGRneHFTWis4WVJmMWVkVG9YNmZK?=
 =?utf-8?B?K0RjTXFwVzV6eUloQXM4VWViTXdKa2VVTkwxaWVKcmFrMVFoeFBxaThYOUQ3?=
 =?utf-8?B?M0pLYXN5L3J4bkI2QXVNVHRRWlF6K2xkT0hxKytYOUFUWEh2N3BncHVHazBt?=
 =?utf-8?B?cEVkZDJwUm04cVlaaUIvQUtYRkwrNlpxaklhODlkbXlocElJZTBMWVVScEZE?=
 =?utf-8?B?am9MZ1I2MHRQS0p1cU5oQ0dDeW1wWmhFc0IvY0JEU2tMeEt4a09wRjJ6M1Np?=
 =?utf-8?B?RUR1eDc5cWxwaVp3Y0Y5MXlDajV0dmw4dnZSQVNDdmpYbnhJRHpLN2hZUGRJ?=
 =?utf-8?B?QzdHYlhzQ1FHVFhrYW16ZHR4eTZja2FMNStNUk9VSE1mNmhnaW90V1Y0cnhH?=
 =?utf-8?B?SzBobDQ0T3RyWGN5MHdUSm9rSnc2L05paHpNdEtoR245OFJYeWZjQ0QrOTFW?=
 =?utf-8?B?ajhpelRzcm00TTZPenFuU0VUU2xISTdNN011c08rQlplMysvNUpieVloZVJK?=
 =?utf-8?B?TjdjRElQNmQycnRtNDlJeEI2SnNjOVNTMUFhZDR3ZVN4M3pZT2JxUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7e57b8-45fa-4c44-26b0-08de852c869f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 20:25:42.1110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9A0fizw5NRZX3WLrNyyIx1Kz/qgZoiqRzZY/KRxVN/bWxMg82FT/HXsF3H/rLok+kwIPZ+6md6UsFNLD0eLUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273

On 3/17/26 3:53 PM, John Hubbard wrote:
> This is based on today's drm-rust-next, which has Alex's register!()
> macro series. A git branch is here:
> 
>     https://github.com/johnhubbard/linux/tree/nova-core-blackwell-v7

Hi Alex, Danilo,

I've fixed up patches 27 and 31 with the "make rustfmt" changes that
the kernel bot reported, and that's standing by here:

    https://github.com/johnhubbard/linux/commits/nova-core-blackwell-v8/

I'm hoping that otherwise, we're about ready to merge, on top of
Alex's register!() changes patchset [1], it sounds like.

Let me know if or when I should post anything, such as v8.

[1] https://lore.kernel.org/20260318-b4-nova-register-v1-0-22a358aa4c63@nvidia.com

thanks,
-- 
John Hubbard

> 
> It's been re-tested on Turing, Ampere and Blackwell:
> 
>     NovaCore 0000:e1:00.0: GPU name: NVIDIA GeForce GTX 1650
>     NovaCore 0000:e1:00.0: GPU name: NVIDIA RTX A4000
>     NovaCore 0000:01:00.0: GPU name: NVIDIA RTX PRO 6000 Blackwell Max-Q
>     Workstation Edition
> 
> Changes in v7:
> * Rebased onto Alexandre Courbot's rust register!() series in
>   drm-rust-next, including the related generic I/O accessor and
>   IoCapable changes.
> 
> * Rebased onto drm-rust-next (v7.0-rc4 based).
> 
> * Dropped the v6 patches that are already in drm-rust-next: the
>   aux-device fix, the pdev helper macro patch, and the one-item-per-line
>   use cleanup.
> 
> * Reworked the GPU init pieces per review. DMA mask setup now stays in
>   driver probe, with the mask width selected by GPU architecture, and
>   the GFW boot policy now lives in a dedicated GPU HAL.
> 
> * Reworked firmware image parsing per review around a single ElfFormat
>   trait with associated header types. Also added support for both ELF32
>   and ELF64 images, with automatic format detection.
> 
> * Reworked the MCTP/NVDM protocol code to use bitfield! and typed
>   accessors, removing the open-coded bit handling.
> 
> * Reworked the FSP messaging part of the series so that the message
>   structures are introduced in the first patches that use them, instead
>   of as a standalone dead-code-only patch. Also changed fmc_full to use
>   KVec<u8> from the start.
> 
> * Split the WPR heap overflow handling out into a separate prep patch.
>   That patch makes management_overhead() and wpr_heap_size() fallible,
>   uses checked arithmetic, and leaves the larger WPR2 heap patch with
>   only the Hopper and Blackwell sizing changes.
> 
> * Added a code comment documenting the Hopper and Blackwell PCI config
>   mirror base change.
> 
> Changes in v6:
> 
> * Rebased onto drm-rust-next (v7.0-rc1 based).
> 
> * Dropped the first two patches from v5 (aux device fix and pdev
>   macros), which have since been merged independently.
> 
> * const_align_up(): reworked per review from Gary Guo, Miguel Ojeda,
>   and Danilo Krummrich: now returns Option<usize> instead of panicking,
>   takes an Alignment argument instead of a const generic, and no longer
>   needs the inline_const feature addition in scripts/Makefile.build.
> 
> * The rust/sizes and SZ_*_U64 patches from v5 are no longer included.
>   I plan to post those as a separate series that depends on this one.
> 
> Changes in v5:
> 
> * Rebased onto linux.git master.
> 
> * Split MCTP protocol into its own module and file.
> 
> * Many Rust-based improvements: more use of types, especially. Also
>   used Result and Option more.
> 
> * Lots of cleanup of comments and print output and error handling.
> 
> * Added const_align_up() to rust/ and used it in nova-core. This
>   required enabling a Rust feature: inline_const, as recommended by
>   Miguel Ojeda.
> 
> * Refactoring various things, such as Gpu::new() to own Spec creation,
>   and several more such things.
> 
> * Fixed three Delta::ZERO busy-polls (patches 21, 24, 31) to use
>   non-zero sleep intervals (after just realizing that it was a bad
>   choice to have zero in there).
> 
> * Reduced GH100/GB100 HAL duplication. Made FSP_PKEY_SIZE/FSP_SIG_SIZE
>   consistent across patches. Replaced fragile architecture checks with
>   chipset.arch(). Renamed LIBOS_BLACKWELL.
> 
> * Narrowed the scope of some of the #![expect(dead_code)] cases,
>   although that really only matters within the series, not once it is
>   fully applied.
> 
> John Hubbard (31):
>   gpu: nova-core: Hopper/Blackwell: basic GPU identification
>   gpu: nova-core: factor .fwsignature* selection into a new
>     find_gsp_sigs_section()
>   gpu: nova-core: use GPU Architecture to simplify HAL selections
>   gpu: nova-core: move GPU init into Gpu::new()
>   gpu: nova-core: set DMA mask width based on GPU architecture
>   gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
>   gpu: nova-core: move firmware image parsing code to firmware.rs
>   gpu: nova-core: factor out an elf_str() function
>   gpu: nova-core: don't assume 64-bit firmware images
>   gpu: nova-core: add support for 32-bit firmware images
>   gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
>   gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support
>     of FSP
>   gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
>   gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
>   gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
>   rust: ptr: add const_align_up()
>   gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
>   gpu: nova-core: add MCTP/NVDM protocol types for firmware
>     communication
>   gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
>     waiting
>   gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
>   gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
>   gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
>   gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
>   gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
>   gpu: nova-core: Blackwell: use correct sysmem flush registers
>   gpu: nova-core: make WPR heap sizing fallible
>   gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
>   gpu: nova-core: refactor SEC2 booter loading into
>     BooterFirmware::run()
>   gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
>   gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
>   gpu: nova-core: Hopper/Blackwell: integrate FSP boot path into boot()
> 
>  drivers/gpu/nova-core/driver.rs          |  28 +-
>  drivers/gpu/nova-core/falcon.rs          |   1 +
>  drivers/gpu/nova-core/falcon/fsp.rs      | 220 ++++++++++
>  drivers/gpu/nova-core/falcon/hal.rs      |  20 +-
>  drivers/gpu/nova-core/fb.rs              |  26 +-
>  drivers/gpu/nova-core/fb/hal.rs          |  38 +-
>  drivers/gpu/nova-core/fb/hal/ga102.rs    |   2 +-
>  drivers/gpu/nova-core/fb/hal/gb100.rs    |  75 ++++
>  drivers/gpu/nova-core/fb/hal/gb202.rs    |  62 +++
>  drivers/gpu/nova-core/fb/hal/gh100.rs    |  38 ++
>  drivers/gpu/nova-core/firmware.rs        | 204 +++++++++
>  drivers/gpu/nova-core/firmware/booter.rs |  35 +-
>  drivers/gpu/nova-core/firmware/fsp.rs    |  47 ++
>  drivers/gpu/nova-core/firmware/gsp.rs    | 128 ++----
>  drivers/gpu/nova-core/fsp.rs             | 527 +++++++++++++++++++++++
>  drivers/gpu/nova-core/gpu.rs             |  86 +++-
>  drivers/gpu/nova-core/gpu/hal.rs         |  54 +++
>  drivers/gpu/nova-core/gsp/boot.rs        | 298 ++++++++++---
>  drivers/gpu/nova-core/gsp/commands.rs    |   8 +-
>  drivers/gpu/nova-core/gsp/fw.rs          |  83 +++-
>  drivers/gpu/nova-core/gsp/fw/commands.rs |  20 +-
>  drivers/gpu/nova-core/mctp.rs            | 119 +++++
>  drivers/gpu/nova-core/nova_core.rs       |   2 +
>  drivers/gpu/nova-core/regs.rs            |  96 +++++
>  rust/kernel/ptr.rs                       |  24 ++
>  25 files changed, 2001 insertions(+), 240 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
>  create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
>  create mode 100644 drivers/gpu/nova-core/fsp.rs
>  create mode 100644 drivers/gpu/nova-core/gpu/hal.rs
>  create mode 100644 drivers/gpu/nova-core/mctp.rs
> 
> 
> base-commit: d19ab42867ae7c68be84ed957d95712b7934773f


