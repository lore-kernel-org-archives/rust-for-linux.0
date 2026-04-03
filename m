Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010005.outbound.protection.outlook.com [52.101.85.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CFB372EC1;
	Fri,  3 Apr 2026 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204478; cv=fail; b=jS/d4TRE4Hn7RBAz1mGqb2v08/5FG+pVyWBTq13YIWrCDrSCZUjX0v6Y0+DEEbt9Q0FJGqkaSs2sGBykSzes7fj6m4plpZIsKvZJ2LkHj5OpozO616M+u7Og2kRKnGdX9tw9xqIn5df8i6TBoI781upUUVDbaOMfThADZBsVESU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204478; c=relaxed/simple;
	bh=58kEtPP051SEO4R9QnYYFD0jH+KLm8CwWWrnDxM5ZXE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=eU1JyUgjvxXG5QoxiPb1k0nvPn8EsZktZvYQ2cliyI6gD3xZ5BfvUkEtNYaNrBqe1lE8D6GlH6q78dbnt7nfVfRweMgzIdO+TqZUU1DFO9zN/Wj2oB8f910zUWmHJMoIx1gWxTfHCtwPSo8RXAS6KCUEcOx5zP8LHnpb5W1Li1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V52/hGYJ; arc=fail smtp.client-ip=52.101.85.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V52/hGYJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+4Jb4tSoGm6MWmOX5joPumLsh0m0xYfB4UMeWap9w7ir1OPgvmrORYEljXaU4WoeO3ryC8i+HpgGF8/NJaZzSqqJ1nUoIXpjIZOavRC8MIDBn8kamKzqPP2OiuOVAPVdJU8WR4A03QFJu0latFHxGNriYMaIx0yK3n4M03yUKHC/bS3khN9qw7cc3JrHF1QWpbcnkerNdj6ulECrWjOK3S578O9y3M21XKS639+ouWIyB1d5eSBR6OlcZFGckQK1EirL4GEUmDBcABn2U+sxtWssxmNe654BQ2uQdyzR7SHNeBuuY52cCB1NPEWBU5B03LbcFdiyVgAe8dRlrZthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58kEtPP051SEO4R9QnYYFD0jH+KLm8CwWWrnDxM5ZXE=;
 b=xt3YRj1tf+vB1lA6iWPezFD6cew8GsemmbbMH+zRKN88z0FXTvyRWjMd1634gWQLx35rzmX8o1teaB8Xr1FNs3naS1AtzNJOLwyh1M0BI9VkCfR2FtCqLjVB1jl27ChLYJ6fFCgvTpLU9CAOuLFuewQ2visE3RNU0Wk9skwJWU3tVSoVh/tjLVWXi+4iSIngg2EesLpmtBB0QFLwraNX73z4Kqetxl5Ig28rkhSlAOsPBEMrue0kuPx/5CW2zYElfW0DAwQE6CfjpGx/R/DKt/QeG6FU69tsPaY3EDPtdqAnZsrLErQtFuwuMNF8lpFuszQF8Oa9hjVnH9nqJGMoZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58kEtPP051SEO4R9QnYYFD0jH+KLm8CwWWrnDxM5ZXE=;
 b=V52/hGYJSo6NTa402cTml1cIKu6PkbtZX1MyYF16uWcU46qrZwQZT+t9FabVOlSLTUsHaaeMsuQK/6VqRFGYbMUmYGNylNraBMTIG4dCj8vShvTyqcvkAv+QoiubElgWcGRK3n10S+uIbZFTKTdiXxWeGNxhQm5QO7okVASUXJj6Qo4l4vJCwHmsj3g4N+h7ZKK/P/8tgu39Zeb/swdGFcnhV/2+0lwuWvLgiBftGXaS/xBokStscMPGSTq/o49F9qsgfeShLLSsDioC3aHsncar6VVHlNNHIHkn07Qci3GmLMsjCk6EBWZnWfzoCU6QG5WwlAdxrJibvMsuwVsnGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4182.namprd12.prod.outlook.com (2603:10b6:610:ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 08:21:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 08:21:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 17:21:07 +0900
Message-Id: <DHJDGQ1WAOP7.1BHAVWX0OSZXF@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, <'@google.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: sizes: add DeviceSize trait for device
 address space constants
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260331224319.107082-1-jhubbard@nvidia.com>
 <20260331224319.107082-2-jhubbard@nvidia.com> <aczpifqz5CoOFB3N@google.com>
 <c42c7074-5f17-4f61-878d-414762461826@nvidia.com>
 <DHI4SCEVOQXG.1LN5Z1S7XYYLM@kernel.org>
 <DHIACQY3YL4M.3F7LSF1BZBUY6@nvidia.com>
 <f2ba20ab-7c56-4e57-ae71-06b35a696a44@nvidia.com>
In-Reply-To: <f2ba20ab-7c56-4e57-ae71-06b35a696a44@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:604:251::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4182:EE_
X-MS-Office365-Filtering-Correlation-Id: a15bc95f-eeae-4347-3d69-08de9159f6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	eO8GyU47q89IzVjTVDOtVzZuLOcYqUT7L+zsiFsSew2p7j60cAFWbEsG+iAntA6cBVFXkOjlZtqozjeThjnlXsFYFBYpUdeZdJD+XF/wcplzaXvuWtW9hxjE524Pa5WPZt4xiHCzxfDnunVT9m7hUDDUseQfelMlr6A2Hvqlyt+VS8PU5LdXrpNUFrCZcw2XZY67cU5Tqj4C136FMRiw/CG9TknR3MbGqm7mGr8N4FVnomNYV14IT0m3+coPs5EDorTmPjkwmILe/1lW3ADBRUJdnYtiF3sKIgNDNZSdV9SQQJ3JxUksmdvwkDB3qZdlgMZs2G9sr3TR+yxdRj6EWe5aqUQfaBXedjrpdk1vWLA1gjDsRCDv+pYQBykQ5xCDmtMLPXdCUwMk6zuBS+aZACrpUEOrtTd7cx8oZKmW3Fzy6h+UejL8EeSqS3J0qaMusdb1bSE48FNU4f2QEm12+fHqoG5ntFgeHIh0FezWWgXyNOHagBJ6BK5WTeZBldPjUp6ZbpbCRXiGllZhjSpFhLOmslIZdR1JX6L6vdFX2LsP7iEBpjKRsjI6rNmDFTxHjAjkLLrWOWwMCX63L8hxxynHEMv43k/al19sVtc8Hz264gZVsxiLrIEEvi9hgjazGv7JB/PiuPs7d+/d9oVUAwB1BqiSuixjXtB3PYUKkubt88P2fU1eUrE67HG4ZYhZ7Y67EXL14S8MngcV5Gu4KME5WCuVLIhczCdtnU4WGM0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjRaNVBjNGJtZktGcFFnM1pkVUxValJHK3B2TTFXNXIzcEtqaDcxeUx0eEY2?=
 =?utf-8?B?MDl5d0t1ZGdXQ0ZxU1VqMWFjSS83eHhuZEc5Y0F3LzdoU3o3QWJzRzByV3h1?=
 =?utf-8?B?bVlOdVVwRk1xdmx5bXEzd1p0YW56LzRTVzZYUzA5bmY5TGhOT1dBUW9QY2Yw?=
 =?utf-8?B?cFgvNjdrdjFobnhQQ2VqSFA4YjE1Z2p6YTlsY21Tc1MwRkY5bGdlY2FMWVZu?=
 =?utf-8?B?dmU0NHJnSUNHdnZGSlh1NzFDckdkZm1SWmorUHVPakZNMEJoc0syQWhINlRP?=
 =?utf-8?B?RnBZWmQvZ1NuOEgxbHg0RnJuUWpoQ3hjRFdualBJSUdGK0FIcURRVVlaa0VF?=
 =?utf-8?B?aHN1a2VNb3RXaE9iMEN3TFRBRVR0dzJ1Y3JVcld1QjQwN2ZBbkIxM25va0Qy?=
 =?utf-8?B?TTd3VmgydmZ4WmE2eFl1MVVFLzdmNWhKNFMwR0ZPWjF3Y2FkbFdVZVpZTDJE?=
 =?utf-8?B?NHJNWHZZNjcrcThzQjhFSTA4eGtSTU5YVFVZRk1MVDV5WklJemlKK3pYM1U2?=
 =?utf-8?B?NDdiTmgyMklLVk9XTlFiYzZtVjJFbVlwU3ZBZllEN0dKamxlSWx6c2UzK0dK?=
 =?utf-8?B?RVdUalIwLzNqakNBZVV2cWdtUDZMOFFhNWdCaldTZXpQVlZwcEhOamN4MzNU?=
 =?utf-8?B?OWR3V0lWeVd3c2FOeTJjRWJmVFdwOWR0NndzOTZvencyU05mbGs4MGpUb0Ro?=
 =?utf-8?B?b1FsVFpBNzl6YmI2UGxtWmdHbVh1WUVQaCtwK1EyVVRxVUEvdVFYckU5bHh5?=
 =?utf-8?B?VEx4bzlQT3JVaUZpeFZPY3pMSVg1Z0VJcXp0M3RkaEdqalhRbHlSRENQblIr?=
 =?utf-8?B?bDlHcU1Yb2ZiMHM1OXpSUGhSczZqNDlrbWRjaTczNnZKNzVIWkgxUDVxZFZE?=
 =?utf-8?B?QnRlN2NmdUljVGlkL1lKdzBTdnUrMXFEeFk5ZUlXM0w1ajJzQ05OWGdpNnRt?=
 =?utf-8?B?WnRtSUZCWW9MSkJaWXFjeWlybHVBSDByVDNycHZmR1czdHhndUZYcHEvZE9v?=
 =?utf-8?B?akhmWFgwZU5DczBXVUJGL2hWZ2ZYNlEzeWNUalQ1enFPbG9lVE13SEFRTUFn?=
 =?utf-8?B?dVRvR2lZU253YUNBakMyNzhQMEFlT1RqUmJ2MnJpZStoVDlubE9TOGRyczZN?=
 =?utf-8?B?Z05kWkRMakFqY21zZWNOWU4vWk5RaExnSFYzY0srMlJOalNPZjdNajhrWk9h?=
 =?utf-8?B?V1JZNkIzb2ZEU0VLbjB1RnZURjFmV3NtVk9JZDl4bzNsSkRNeTFUWHhiUlZP?=
 =?utf-8?B?djJWdHo4VHFuV3FzMTJuc3oxdGFiVkthV2dYTkl2Y0dkblkyZWRiRnFiVDB0?=
 =?utf-8?B?OTAwUzEwKzMzMUd0bkl6cVhyMGhOOUpYSjFLMTcrTFQvSWVVQktmVnRJSWIx?=
 =?utf-8?B?VWdXTW1iZGZZNjIySTZpdjluOFE3S2ZBN1o2bEpJUFFmZjB4MTJMa3JrVjMr?=
 =?utf-8?B?QjQ4NDVTQjJNdGRKd0dRMEh1MzYxRjY3ZndPQmhrR0c4RlhGTU1OTTFYR1Vz?=
 =?utf-8?B?SHJUcG9vanNZVzhqcEwvYWFJdnBoM1VnMDdEUy9EampHeEhCNXNONjVMNjdi?=
 =?utf-8?B?RGZoODE0V3Y2L2JpaWpwWnJFZkNDRGlZbVFwdW1oR3hWdzQ3SFhaQk9RcGJl?=
 =?utf-8?B?eGNVays0RmkyaVRSVndydmYyQkI4STZheHhyZDVyd2RnWkwvb0xPbmVTZXZk?=
 =?utf-8?B?Z2FFajcrR2s3Y1hLUnNYeEdzaVFNR2lmT2N5Rm9HMFBIYVJYWFlwS3d2d0ZT?=
 =?utf-8?B?eGt3bmNUU1dZbi9nY1RlK3FJVE5iZFk4d1c4Q0VZeWsrQzN0d1hoNTNPbkxm?=
 =?utf-8?B?ejdmVHZWblduMWpDRmtLTXA3UU05bVE5VjEreko3WTdMMCt4aGgzbkw2TmZo?=
 =?utf-8?B?ZkdmeUpkYi9lMmFHUFJVMFBjSDVmTUN0YnBJSEJ1U3pqNm51eDVPYmdla0pt?=
 =?utf-8?B?dHhWUlpKdUFSakdSb2RHRE5MYzRBWVpoZ1BmTW1UMkpVck50TWhTUm1mNlhP?=
 =?utf-8?B?blJuYUUvWGRRcXYwamViS2hmOFZIbVpoNFhwTGJIWE80dDRMWlc3TUZXOGJk?=
 =?utf-8?B?VDN5aFdoZmxhcmdxQWR5MEpMMXVIQ2QrR0NkcmxJSnFJazlDWXVwNHZqSmY2?=
 =?utf-8?B?ZHlSY2FsaExsdW8rSHlXVWN0L3c4cnVDVlphbzNnc1k4WjVaZVR2WmUxcmE2?=
 =?utf-8?B?YXpSTDJxeURpbEgrRTBGQi96Y3hoa2FkWFJZYThLMmRhVTFNOEo5N3lRWnk0?=
 =?utf-8?B?UTNrWmMwcEduRVpiSHAwdXYrR01GZGpFK09sa3E0VVlQZENWaUJKNnpHTWNj?=
 =?utf-8?B?aXhycVp2dTBkRTJGV3VYU0ltaVVWdUV3UUlwNkgxcjVlWUxPbGNFc2tYaXM3?=
 =?utf-8?Q?y3uHmGgk7rXgh06yjxgJVQtU/WDuXjSW0yLNd6JbfnFzP?=
X-MS-Exchange-AntiSpam-MessageData-1: FG82EPzNxdz2mg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a15bc95f-eeae-4347-3d69-08de9159f6be
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 08:21:11.2855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gncKetyXyGVYr8PhPOpwV0DgSlAArWPOC0VPpcm1lYGB50pcj6aRq0TplVzaiJe/VhcaXgOuAKTpO33kmZeLnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4182

On Fri Apr 3, 2026 at 10:36 AM JST, John Hubbard wrote:
> On 4/1/26 6:42 PM, Alexandre Courbot wrote:
>> On Thu Apr 2, 2026 at 6:20 AM JST, Danilo Krummrich wrote:
>>> On Wed Apr 1, 2026 at 10:22 PM CEST, John Hubbard wrote:
>>>> On 4/1/26 2:46 AM, Alice Ryhl wrote:
> ...
>>> The reason is that when I proposed this I was thinking of it as a marke=
r trait
>>> for "complex" types around u32, u64, etc. that we can use in DRM APIs (=
or any
>>> other device centric API) though generics.
>>>
>>> For instance, instead of GpuVm<T>::vm_start() -> u64, it could be
>>> GpuVm<T, V: DeviceSize>::vm_start() -> V.
>>=20
>> With the proposed naming this becomes `GpuVm<T, V: SizeConstants>`. Why
>> not just name it `Size`? Sure it's a very common word, but we have the
>> module to scope the name properly.
>
> I was waiting to see if anyone else weighed in.
>
> SizeConstants accurately describes what this trait provides. Size is
> too general. Again, I think it's best to name things for what they
> are or what they provide. And then, if they look odd in some use case,
> that's a hint to consider if that use case is precisely the best way
> to compose what you want to do.
>
> Anyway, I'm pretty sold on SizeConstants, so I'm hoping to stay with
> that, are you OK with it?

Yes, as mentioned on my v4 review. I agree `SizeConstants` describes
what this trait provides currently - but was also thinking that this
trait might grow into depending on some arithmetic operations to allow
generic code to be written for anything that is a size in the general
sense.

That being said, we can also write said generic code by depending on the
required ops explicitly, so limiting the trait to providing constants
doesn't really limit us.
