Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D53D566E;
	Tue, 24 Mar 2026 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774361198; cv=fail; b=Uy9chklpV+LhE1LlmodcRy0YM1E3pf35Y1Gq5evNDVVENurs05FXaudGqfgvgHBmpWQoVLGg7XLTsG40EOq7STp2a25ek+MUZsZRdehVY8m5zCRRV9dv56/uXcAokyMlycGQ45mdrmBi0vAnBStNGQGVG0A4bMcs0rPyBVqZBkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774361198; c=relaxed/simple;
	bh=HppwSwRJZRZKFQwWP729PJSBztpTMR8+x5GVc2lKb7o=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Fz+7kuCsjtUukgscqox+OESuHnzYcIVf7DFowY2WJJ6FhSXNEd8r/O2o/VEhKs8Yrg9uXhBI3SUwF1phACdzgJNoMRTCCXOSq3h5rrKQ1rv4y87FTnloSMn2JTKQfZIc5a0z8CgimoA/QP5p9ujTiBahag4cE70GmcgQl3o1tbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NG1AtVLD; arc=fail smtp.client-ip=52.101.46.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NG1AtVLD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2LFUoLpzw7yiZ/mCSSK22AR4Pe0TXZ7UrRaAguH4445oGSuk+yeQqyn1znJ8YkglKjJqY2hJ3sTB7KrsfhNLuhy1W+q9vljI2dSHPjOpj1wLQubwtgxx+1gYO5g5IeAb/m6fqBDZ8Emf8PBOWmw0BUBG0dIfaGMBAbyLvW2xNzo63CzzoJBhbsOhrCLUrD8WkQ3EhkGYE0wCnYgzUusvShrco2kYb13yOmzRlvbYTPNODzLJGTXG+o4iajsVdF3tT+uYheoXLdLeZEum0eYqJy3GdWE4USwLpSwGAPM5LAJBgEjz6dQQqubTdiJD4Vr5aJ7XB1NkD/kFEhNFVcZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W11zUWD7pWOCKBcRK/HlZLJ/nZIRcgTuTOkqFmuC4Cs=;
 b=E0oXvcXLN2B7iFj2XYxpOeWawAa53qmmwwxFd6rl8jIv1Itzr7WAMvTc9Ivt+O21Bt8qArYMI7MZIFQXu3aH9uOaH7Ggfr84e6BaMsfn7b/cpmEf2GS9LzSAw44j/XD4p0KcePxuz1xUPX2BHVkrZ8GLJakFhriixbpvuGUP2bJ7cdiN2fv2xAxGhTdK3t03I5KmnZsTVQ/BhCfOGT/lZbP/tHi6Up492cY0g/agRbC7Zn6+Gm5kmFvzYgAtqpr9H7FOz/qIk/nnHNyXOKWhArT3L+FwrpB7W0LmRQLIbPTFYGQx4ZO2FRRxVTzD8Z31RbKiB1MUq4MHh39odJDshg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W11zUWD7pWOCKBcRK/HlZLJ/nZIRcgTuTOkqFmuC4Cs=;
 b=NG1AtVLDpIC5A+oNlLgquVuKP1/3sdk3hkQC9SUNUtGJRavWQ6y6Af9Ym0gDshS+kMm5upsTFeuEfcYbTqRMckoWvA5IdfVgPGTHMZM5Yym2zeH2e5iw4ZnN5lj1e3l/Ij//qeYpr5NUByW0W2+c2ZXvGXjXn2jBivNFr8pK0I1IVRvXOAKarj5n/fFCiz4VI7DT8IaE8hVtPXG0BaAiSNmwQ0astj9cr/+w89YpCpcNdjIHRha6Xju+nPwUnSyw55LNqXt0Lv0hQRRnfUqXBaNQr7a5uvlpG07tR5rERo2NYr9H5aa8LBbcZaZKundDKX5kfP4ps5zxfniTFPVrlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPFD525C5379.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 24 Mar
 2026 14:06:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 14:06:30 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 23:06:26 +0900
Message-Id: <DHB2JO4NJHOA.3ICD02I3Z3JZT@nvidia.com>
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
Subject: Re: [PATCH v2 3/3] gpu: nova-core: use DeviceSize trait for u64
 size constants
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260312031507.216709-1-jhubbard@nvidia.com>
 <20260312031507.216709-4-jhubbard@nvidia.com>
In-Reply-To: <20260312031507.216709-4-jhubbard@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0276.jpnprd01.prod.outlook.com
 (2603:1096:604:259::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPFD525C5379:EE_
X-MS-Office365-Filtering-Correlation-Id: 94df22d2-6742-46f2-b85a-08de89ae8c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6QWf3fbXoKMQOfivXTb9Ia57YZ/bm/7jNDkVorl+NvffU2XXm5LEIeBMEl8nUgBroeODZpPU2bgiew3oS46NGcPiVlntR7wVqHC0vj0KngTE4wTCTZwOe4UxTi0Itgc7EyKQc1al4YUFvW4NTI03eLK2o6STHVQKaj/0PAJ3OiWrz2iW9rfXNtztGFG47ERSNv1cAWno26YocpXil6VKAnEhyEtkrrgV9lbT5EwVKTs+iUWnGqNO+Mq17IeUgVZYjaVayKuem2fuDhhbseSpE2nwWvtCJsCXsc156V3xlTzZZKI6bE9bKm3bpRD0KfKJzYpA2aWmhtx75O95KioJZlWOpw82ChjexG7FQrz5HQ9LpqrO4iHRooQqsEhqZ95XnhNjteKWlpPmVQBF3rsUQHtLasTD5hzUcrD/VRxxUdLTfmT2i2lVxD3kAbtqpw1oPbRovHWLN6vDhbZ5xsselw/MH/JdrmBK7gvnrpFLhgUhNJYM72fH0DvBj7SAHA+A1+VzMpQsRkSs6qjIHDqzYpVNxyTMmjJWv59N/LyLFUZ6qNGIJe0f4J15nWDWwSYTpHnKWa8gJ5vw0KHlzvh9p7n+Gyn1VlGKds6yTjEgHNAL9wXQBLfeCA4pL/RTQ03LMBV4NeNpYdXxqDuXjQiZqXA7jiCx23HoFxVYXsC9tbmmOmg2/ZpFZhITV7AVXqRrFjTLbrdsbnIZ8JeKabZWviGeQHPUNcCUrnY+VTtyInE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2VNc0xoZ2gwTVpQYzJsdFFFYkZZV0l2UWJXSzN6NzU1YldXWkluT2FTTUs3?=
 =?utf-8?B?aWNVcy90SGFNODJlRTFhMmlVaGZWRnEvYmRBbmppcWpnOERjV3J5YUp0azhJ?=
 =?utf-8?B?OTg5Y0kxUVd3QUlyQTJheXJaNjA1ZEt6NzVrWmZDc2drYUdoWUs3ZzhNVTJn?=
 =?utf-8?B?bEFMNGpOVEhMWS9nN2Fxd0J6SEpRVXl0TmQxT20xY1RualJMZGRxcUdvdlNs?=
 =?utf-8?B?V0krSG5PTldpTWEwTXYrMTVVZUtLWVBTUnB6UHpJWGdTeW9tbkRZbHdCVWIw?=
 =?utf-8?B?N0xxU0tCZ1JJVFdJbHkwYTVqZ0xoWjhYclBlZmUvQjM2NHQ4bXZQc0lOTjZR?=
 =?utf-8?B?MDRnTW1jUXA4OHo1bFVKN0pLNVZsYU5lY2YyOHJQaVFvK2tlOFdqcmVvZnUv?=
 =?utf-8?B?NUhrM29aV3BOeGYvd0FPanpuOHpwWTlYMUYrNkdJVXZ1dTVMdzBHR0lvOUFo?=
 =?utf-8?B?aE8vTUliZlVXbHloWHJ6T3RKWmJEVk14VXFrQStjRW96OXVmdUYyeVBibmVv?=
 =?utf-8?B?QW1BL3RFeUwyNU9VdmhoMy82L2dtMlI1SmhENHltWkVPNFh2bVJ4dzM0a05W?=
 =?utf-8?B?eEh6bjJ3KzBPVnRyeFFxVUN3aStrWUg4emF2OVJhNkhwVlZoRWlYOEdyU056?=
 =?utf-8?B?dXhIOGJkMy95cHVMdDZiMjFRaWxsR25IOXBaODQrcE5meWp0VUQ3Znh0bWNE?=
 =?utf-8?B?VFNIaGdabWQ2b091a01kRGhQZGUybWZNdmU1K1d5V1N5QnlFQjhuZW5uRXFC?=
 =?utf-8?B?cWY4Ny9qTzhQK0pHYVZRY293NGRhZ3RJTEVNU1JsMkJVSlJTUEc0dExJMVRs?=
 =?utf-8?B?blF0eVZmd1JNRHZxSUtuQTBrN1FMOUh1UmhVKzIwWjM3c3U0L2tSSTFyZDRW?=
 =?utf-8?B?WE5JVEZPZXdhblFydjd4Q0xQejhidlFnbG0xNWdBZml1Sm5mUG0rdHFJT0ov?=
 =?utf-8?B?RFpQQ3ZzcU9kYStJeDZBb2Fodlo1b0h6YjBEcmNQZWV0NzFIT3VZeTIvVTBS?=
 =?utf-8?B?WUNGUFYzZE1UcGI4dEhnVnQ2YkIwVVJQTjFqT0lJa1JVL1dFL2grMW9kMDlI?=
 =?utf-8?B?NnFGRFVpKzVlRloyUTJaNjgyR2hvdHRNbmFRNWhIUWZCaWptalMrNkVoYW9n?=
 =?utf-8?B?R01nZ2s3S05xWnVwMHRmMmRoN1QwSlQzcFRRQjV2ZUZKVGptQ29BVDNuL2JO?=
 =?utf-8?B?eVdoKzNmREtpamZjU0FNOVd5TkEyT09DalZDeWhTeGtiY2JGeGE3M0FyM1Q2?=
 =?utf-8?B?MHZTdjVxa0V0MzFXRTZVSHUzZkZGZUpGRjVEZ3ozLzJjakFzYVpUUzZlYVp2?=
 =?utf-8?B?RFZ3WFE0MjlWRGw4cEFjeWZPV3pLQ083UmJkZmcvRVBBbWNiclpMQlZZVUtj?=
 =?utf-8?B?YUc4dytHNGxESEV1bTYwM2gyR1BPWjlVWVpGenV6NlZLYlNGNERiMmR5Yk5I?=
 =?utf-8?B?MHVFUVdCSnJ5R3cyT1RtVmY5Y1lYSGdsK2xVeTgvSkxacWk0bUJ2MVVpRnBh?=
 =?utf-8?B?T3lsN3hzRXJWVXdRT0o0YWFsbG9VeEF4TTUzM1U5WkRhWUFUWXZUT2xOb3R3?=
 =?utf-8?B?SGhBbmh1SHVsNkdzSVFRb3dzZ2NCRFVSMzBEY29neE9vbVZ2cS9KYkRhZWRN?=
 =?utf-8?B?cXpJdC8xUEVtK1V2aTJtQUEzQjQwRkhFajcrK3A4NGJkZEpMWjNZM2JlNUxX?=
 =?utf-8?B?NEdYZnc1TE41U0lKa1kvbU1HWGRJMWUyNFhuejZOSmxjaCszOFo1cmJOWVUy?=
 =?utf-8?B?VjliL3E4eTNpSjQzRVNYSGxlK2k1R3J0QzhqQW1vUHl2RkJ3T2RiM1Y5R0xV?=
 =?utf-8?B?dTYxajNNSVNSblowbkJQeFdaYlJGKzBvOEpVNGpEZ2pkUTQxeHFMQWRqOWQr?=
 =?utf-8?B?MkpJakE3Z0tHR1ZmUlprOCtTeHVoZEdjMWZFVTRCaXZ6blRMK082T2Z6bng4?=
 =?utf-8?B?NGhVaXk5U3YrMXFYOTRXNzc4YXA2S096bm00Z3lrLzRWcm1LU01qajJiVjY2?=
 =?utf-8?B?OE5UYno1S0ZjTEhBems1M0JKT3F5NnBYK2cvTXpreFBzMnplcjJvb0lYWG5v?=
 =?utf-8?B?WTZqZG53aEpiYmVOdTMxd1ExNGRDVU9KNnpVUlljbnByOUJiSzVxeVpneVA5?=
 =?utf-8?B?NVRWazBOZ3doZ1RSNHkzamp6alpjMjdzV091UnBsU0lCWTJZdjZ1NG9rVlZ4?=
 =?utf-8?B?bW9hTUZBc29FQngzSXpTcUgwdmlnMGlYUnd5MHN5NHNiOEVlbTFpR1dTOFAw?=
 =?utf-8?B?TFpaZCtTdko4ajl4M2I4NVZrbzF2RVB1eUtaazc4TXVsait2REJycm80N0Jx?=
 =?utf-8?B?eEpHa09HNXMwVFVucHRCMjhtNWdHNHhHYVFycVEwZHBqS3p6ZmtKUUlGVVhI?=
 =?utf-8?Q?QuMDHsq+0kMqRPD0dSwvDpJVwAFRHfbToqiosIaEQbiAr?=
X-MS-Exchange-AntiSpam-MessageData-1: 4R2+5kskB8AFQQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94df22d2-6742-46f2-b85a-08de89ae8c27
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:06:30.4324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ykizAjPweQkbFHmgdL1KHr9HJZ867Drq3tK6c2AWzBshvTYUkfpNN7miivCYs36L8t5zAFyPQzqDoJ6AqMUTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD525C5379

On Thu Mar 12, 2026 at 12:15 PM JST, John Hubbard wrote:
<snip>
> @@ -211,15 +208,15 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp=
_fw: &GspFirmware) -> Result<
>          };
> =20
>          let frts =3D {
> -            const FRTS_DOWN_ALIGN: Alignment =3D Alignment::new::<SZ_128=
K>();
> -            const FRTS_SIZE: u64 =3D usize_as_u64(SZ_1M);
> +            const FRTS_DOWN_ALIGN: Alignment =3D Alignment::from_u64(u64=
::SZ_128K);

Replacing the call to `new` by `from_u64` seems to be unnecessary -
`Alignment` works with `usize`, which `SZ_128K` already is. By using
`from_u64` we convert `SZ_128K` into a `u64` in the `define_sizes`
macro, only to convert it back into a `usize`.

All the uses of `from_u64` follow this pattern, so I'd say we can just
drop patch 2.

> +            const FRTS_SIZE: u64 =3D u64::SZ_1M;

This, on the other hand, is really useful and much better than using
`usize_as_u64`. Actually I'm wondering whether we should not have
`DeviceSize` implemented for `usize` as well to provide better scope and
consistency (in which case it should just be renamed `Size`?) and sunset
the original definitions.
