Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013060.outbound.protection.outlook.com [40.93.196.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BAA3B8934;
	Wed, 11 Mar 2026 08:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216086; cv=fail; b=TnAzZ62e+RW1TVPcd+GIkpeKs5D2nYLawHdkeJG2QAa+Lhthhzfek+2J5ZHaEY3IVYuD2Q7XEEDK1wr8ROmY+ngP1J5RE4HOpjxTqKUd+y1RUBxoVuxsqE0VdZVdJmseJpxg8K14zV8HqdZajhF9FVKq4jh7Skkc/zf9GU5b3JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216086; c=relaxed/simple;
	bh=KgbWhKjOuyRsRNJl0hBBGar22DEahsVkEKo0/4XvjWw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ed7TJyViNiSEjo3fwevpRkE04aBXCFEdJBpKgxPvN9G9+v3dDHtgNc7VpA+NsjJ682s7Cczvjf6QGn7RbRmtsLdX1fZ+wVo+s8NDH9a5cR1t7DLCpRILSe8Yj6EOHkAQbFoxOQdTsrEjL7w1+m/I8L6JaRB+LHAdNuLXh0ICNLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OTHeyg/3; arc=fail smtp.client-ip=40.93.196.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OTHeyg/3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyJEhWNNdKFpCaJxmOO50Og1DhjOcHmlyTtEOR+hpO6qhhy/LLpNP0Kgj2IdScfEEKEENwtgeQa5iQ/yJNeLN+LjSGszlMqxql4GtdTpTK2CDSOKSnFMR0hjs5Gj1L8eE49fuQ7hOZ07xiuBAT1uU8mxJek3osd6mN2/TOa2/W+91fQE/g0e49+no2y+xY5lX5rx4MN/aWaYwYLZepgo0FKTAmVwBVm2YPd+lbDhd8BofWHaRbko41ViS8uoGUDN6ZDioSKrSwzu9wOK81noN8r5QzuSo46qHKNWIsDBFgEi+Lxr2hI2J5QW5WwZm4RsuDmJEDqC4oTHTsyI6vT/rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSJKjDLb9vkh3i6LDCgoDoDf8JjejxBOIKKqbK1ec+I=;
 b=dT8l8ocNBHDiSIqyi1MkN/cIDSNe38eNt9izjuKCuIl3vcqPHh9j1u2YUaBM7VhiP8GMaxAECe+DiUSnRMlmDUHitHBmdOYYPgQHu2xyiYQ/OyuzzsW3vtCGyU3SU1coAV41FSm+BCWY1RNPBjtBimBcHFrXSaUY1WxELk8uvG5yN9lhXFcMY/KYWsshYLlw+K6gLtQBlUqzz9H/074x0lwlJDrEv3HtPsO/h6pxjs2brGIhYClAEmkQrtEtmzXdLXoj6mhCUnomtJsbPYzkULqPEnM+hcSvOB/Kx7NQx1jA/S5yUacF172taBSgzhDZA5dIm+NnHVaI88jKz74Kwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSJKjDLb9vkh3i6LDCgoDoDf8JjejxBOIKKqbK1ec+I=;
 b=OTHeyg/3IAMFSrligUKQAm/aP+qhlN2SZNZF5zP0z0K9DjGT3+mMC9K566P39JKnv54dIxdJ0l6tAJYTdH1n8XnBrGP6r8GI2sh5Th1ng7rcfeoXxlJTNNV2+0TkZmI1U828dJSsjNQYXQgoVLT5+hm1O7Lm+uKClgq/nbE1tuOBSNGQZg0JPkXdA2rJu/MX1NajA+bBK2FXQkimThZPpfdg3K/8ku+GseHVzefxTY3QLf8qz6MKd4UVbctf6AdARq9ISoZrI+f22MYjROIIgFKGDw2J66TK4yPqtR4EpgMYJkaj+xAnO8GKDu8zAHRiPOlXWP+4Cc4m90dFh7Latw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7371.namprd12.prod.outlook.com (2603:10b6:806:29a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Wed, 11 Mar
 2026 08:01:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Wed, 11 Mar 2026
 08:01:18 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 17:01:12 +0900
Message-Id: <DGZSMY2HLWFF.UYKDAN55CP50@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] rust: sizes: add u64 variants of SZ_* constants
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Content-Transfer-Encoding: quoted-printable
References: <20260310023145.120037-1-jhubbard@nvidia.com>
 <20260310023145.120037-2-jhubbard@nvidia.com>
 <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
In-Reply-To: <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: af29067b-666a-4f62-b0b0-08de7f44601b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/KUi20om9cDk87Ec9YNWS7oF9oBDn2hjRbrpLxdAGfOTVkQIeX5TnitjKinQND05C32mHa2HZHZK8VLvQHltd6ANj9G7KN8+oNJXO+6VnlZRt9je0WLlhQWzsbFRCpe22TQ5S6bjA0MbsVECdg5D4LFolLAI96G32Ck4v/dLpYiMKlQRJnaDMNEPFY86WsX7qudbJBBytpH66kI+2G7wHP0utSruCrTaPPHNdbFhFHWxjsBstjNlbmCoSm/mb0K+6PkafZ4adL9RaJD+s+BMOhKspiTYOq9DkPR5U4TjPQ4K+CNTFO/qbyXfDjgoMgJOERJ1W3Uc8xGE4nfeAg1/zwP08JYI+vtAGMqqMGLtdJLl7pfEUE84ukARz7fjwiGVAiJuZgOgIchFwUR27YCjWmYXE0pOofn3Eqbt4Gf6GUjjOdojVpmCSGYAjxtN1U7aNsSgX/7NWKXUWcCcFBCRrJAhwrMhb3hvvnnhPyuy4zDUPVqVP0vqa32IIHGY+I+x5TQyyC/bAxCVI0qhK9Mm3TzHhwaTqjKqcnWyBUpS6X9dhkj1xLkUGidhFQABxHYErzMD6QOnoQBBsRqmaQP0UpmAlh09CWjdPA7Evqjw6Rq4NsVoHjLu3SHvMauKwoy8/B14kAewjVr77XGXTuoarDX/eyWDW1mVJRGJwkw986vQCWYAh8zrOl+upV1kvaeqVg2+Yi46fUFRFSnAlY/JI6h5HKkEX4ShfrH/o9yHhGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0ZrSWY0YmxYR3NWTEJESkhGRVVpbVZQeDRXemFreUtkVFdVQjg2UE9kUENE?=
 =?utf-8?B?TXdkTERYU3JWWlJaTzllMTUzb3Y1bTByREZEY0wzVy9ra1BPN3VENW5pSWZZ?=
 =?utf-8?B?R0o0cE5xb3RNT0tZR3orZXhVL1BLSlJTa05sbzhXWExBV2VISWw0Sks3Wjd3?=
 =?utf-8?B?TzBoYm9SS3QwSEdJYmNxSzNyR0l6alVNZWZZYnFaMjdFQURySzdQdkR4VER0?=
 =?utf-8?B?ZDZvMHg1Zk5mZ2lhUURkU2pwRUZFNkF6UnFmL0RpRVRMMUxpNlgwd1pKc0xr?=
 =?utf-8?B?bUl0eGhxRi9ub01EM2RTaU5zNDEvNEVKKzhad2lwZ1k5TmZjYXZVNXl3MThQ?=
 =?utf-8?B?czd0QmhaemZPZ0czUDBYNyszODNzc2tkTWZZVjlHRDJLSGFWV056WEZlczN5?=
 =?utf-8?B?bGtja3dydUU3NTJHS2FMM29xYUJKNUFWUDFneGJOVjROMm9IUVZTc2RyTVBa?=
 =?utf-8?B?YVIvVWZndDNmY1E5dzNkNU5rblJpekxDR1F4Ny9hL1lCVWJRL091bFQvV2NV?=
 =?utf-8?B?c2RXVXBIekVmSHRscW5XZVI1ZUkzT2ZhS2w3VWl2SGZydEdGQTdTQUxQK1VM?=
 =?utf-8?B?c2g4cUJtWlpBd0kyeTVWNnRVZUtheGlUb0I3WkpyVzdiVUJGYnBOL0QwbmlE?=
 =?utf-8?B?dEZDUUtjeThQWTNGUlRWNDYyeElZT3VRSHFjM0NhNEdNY3JIc0s2aHorMjBW?=
 =?utf-8?B?UzQ5d2ZHYmJWYkc4cm1uMythWTVVeXhsamdYY2x5VVVUS3FUcFp1NUt1bmx3?=
 =?utf-8?B?dGVEUld3R2xGYk9CS29MMW81Tk5CTVZ5L1JCLytuaWpQSWJaU2ZLRzhWbUw1?=
 =?utf-8?B?Z1Y0R295VnZtVUxnWVIvZTZYRFRIWTZlWXNkQUIzSjhQVHorTnFtdTZqRnQv?=
 =?utf-8?B?QURJVW1sdnlWbGVqYkJXaGZTdnN6Zkt4Z3g5VWpNZlU5OVNNeWVPWHNEN25V?=
 =?utf-8?B?UmhiNVcrWTlxK3BsQVhCNk1wSXVKVDBBOUVFb2ErWWRzbExBeDFRQjk4dW56?=
 =?utf-8?B?ZWdRQmhpbmtucGlZdmV3MG1CQ0tzeGJjbHBPMUhOaXlxa0M3bWYxaGI5NkZW?=
 =?utf-8?B?a3N6UWRJUjNHdHhtS0tyRWdRTGo3elZUSUtIQnlHdmpNZ0F2aVVCckVyaGcy?=
 =?utf-8?B?VVVGRk1YK2tzUTNqcW9Lam5RUzExT1JzS0g2NWJlai9yWEhSODJaRW1tNzdn?=
 =?utf-8?B?NUNmNExFdDZMbmNvY1U5S3VROUtOSnFsbHcyemRkVDA1MVM4VHk5NjZBamJv?=
 =?utf-8?B?VXp1VVlGMkdnMXMrTkN2ekQ0OWFBRlhvVmlaRy8vL1RwZHBTbHQrb2Vrbkhh?=
 =?utf-8?B?T0dEQjZISlZuQzU1QVFVVEJLZmVGaGwxVU11RVBmbDM3K0phdUFmZ0g1a0t2?=
 =?utf-8?B?OVpDZzZTM3JkQUVDS3k0Q0ovZlQzaGtaY29TRDM3R2ZjS3BPQ3llVU1uZjZR?=
 =?utf-8?B?eCtsUGRFaExqTEE4Qk5XekREejg1K29ITFJabkRyVTlPdzBzVU1LcXJLeXQr?=
 =?utf-8?B?ZHoycHJiN1hnUjZRMDB1OXUzQTM3eGlSbiswQkR2elU5bjBYNUo2K3NMQzJR?=
 =?utf-8?B?Ti9CYUNoN2o2QmJXOENqNEVHZjRvaU8zVnYxS1Vyay9ic3VXcmljbGYxa1E3?=
 =?utf-8?B?RWZ5YkMvdERWeUFTYkIwQlhOTVNiZGdDZWNncFB0T1NhZUZJbzRkdm9LaC94?=
 =?utf-8?B?UDZnZWlrZ09XVS9qbHZDcVN2Tkd6MXJYRDdiR1JJTHNQc05uRzBLckpCQkM4?=
 =?utf-8?B?SE5pdk00THJjUnBFOVVNOHZVREFENm11U2NaenVHZ3h1ZXBwUmY1dUY4ZGJM?=
 =?utf-8?B?WnV0QlRqSGxNTDlJMk0wVkVFYk9HeDNEWXV5QnR5T3p0YkdMMW8rS0ZwT1M1?=
 =?utf-8?B?N3FVUDZuWmVyQTNlZjFpVjFwRUJpMms0aVk1cjQxcTZBVDQwcGVSa1ZlN2p1?=
 =?utf-8?B?U2NRdEt4eGlJSUxLRnltT2dkZTFWVWpSODdYcWtBc2FGNldtK292V1ZSWkM4?=
 =?utf-8?B?V3QweS9ma3h1VS9rbE9CckJRVEFydmhZVjFvKytJZXY0ZVU0U2NydEVzUGpi?=
 =?utf-8?B?cGR3QkpOa1JQZ3NCR1hvUHFrdnF3M2hBUjNMNnRDL2xRbGRTQTl5ZkczdGpB?=
 =?utf-8?B?Um9pbGlHK0dnUFB5MU04Z3FEZm5sQ093aUV6OXNjY20vL0FsM1NRYk5Mcmsx?=
 =?utf-8?B?ZmU1UFpBTEthMUxabUJOVlgxaDVLT281YWI4TCtQbFFKbWQ4dDlCQ0xZd0Nz?=
 =?utf-8?B?SjJpWEZISzczV2tkZU04Q3VBcEF5YmxJdnUwOWNCNGV2Qm5OaHI4SEl1ekNl?=
 =?utf-8?B?WHZWRTVjekZEMDBWNGNyb1FoZWUvNis0L3V3RHBxcGVEMUsrOUtjWDBxVmU4?=
 =?utf-8?Q?oeraAJm8GcXO2TT8ToN62zuSbvOVwKewyHyvvToi2m1nA?=
X-MS-Exchange-AntiSpam-MessageData-1: 5NrTuCXILmBn5g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af29067b-666a-4f62-b0b0-08de7f44601b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:01:18.2725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mILc4030LSaY1acnfhr6x45xWzIZ71pGvpt1+TgcfAXmA9mKekukcA5UQzBcBE96ZkfWFG9vWH7dFSTz7wfaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7371

On Tue Mar 10, 2026 at 10:51 PM JST, Miguel Ojeda wrote:
> On Tue, Mar 10, 2026 at 3:31=E2=80=AFAM John Hubbard <jhubbard@nvidia.com=
> wrote:
>>
>> +// CAST: every SZ_* value below fits in u64, so `as u64` is always loss=
less.
>
> Nit:
>
>     // CAST: Every `SZ_*` value below fits in `u64`, so `as u64` is
> always lossless.
>
> One alternative could be something like `sizes::u64::SZ_1M`, but if
> you expect to mix `usize` and `u64` often then it may not be great.

How about an extension trait for integer types with all the `SZ_*`
defined as constants?

That would allow easy implementation for more integer types, like
`Bounded`. Because "64 bit" address spaces are often actually less than
that, and we might want to work with `Bounded` for them.
