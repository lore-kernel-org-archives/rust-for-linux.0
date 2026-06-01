Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012019.outbound.protection.outlook.com [40.107.209.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CCC3E1712;
	Mon,  1 Jun 2026 18:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780336998; cv=fail; b=Iv+5UvFnZuzauZn5NlPA+lzioHW8gZYq6V/GDsgoZ5lJaYgAcg9hWQcvBnzaKNsU70q+aFcfegiO+M5RgVnBrRHg0ssfHa6ITG51GSo/pDqTZLElSzhSGb9IPsR9orrfScX1Pg60FbwmhOkDZas9IB97G+66Xpn6uagjWhdUuF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780336998; c=relaxed/simple;
	bh=IWWp961MrLGte38r1eTCVmxGwo8GZW/qY28EeHID9xE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BjhShfotHT1eTi2qi6T305j75Yu9RyO/MjAyz8Z3L3gBT4tsvQyKDRrWDgGAoUzJ0OxM2rz3o9a+vYSH3SoBXCPEbR78DBklyf4yHw99pLaL7f4401DyI2R2pr34agBnTvldL2a3kLj63dTjNAXXllHoWclQRdXhL920j9x7VoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c6SQiXNZ; arc=fail smtp.client-ip=40.107.209.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c6SQiXNZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOn/ShtMfMZtaFnLrK87GtilmWBZFGq1hHs0JhlqyVwwkdS40YvmeQcZ01v6oquynRI8Llh21DvvhR1eRBy1kYuHY3ysQ1eiO6Dy26KwPX/gzxfKg3Z3iTfGSoQYukuXDUE8/bbgbk8ax/deOzRArmcYVxle9e6qA/dHfOmwxtbP0KYKUHrJPZUniRfZNSUvPsqxfmNjWKhXHm3SxLm0/EmZj7WVw0hCC84l9frwrvbF32rVomeDfSVEt7xJ52uWrfh4IMHnF9AUryY1XGlA6C/9ZWYui5AEI1IF7z/wP732qb9RVxrZaMM7ezXLzOzEaMZfyl9Cv9G53og46b2Hzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ex7Hg8YKg16Yv/U9DvQAxNEHE1Wnuuegf6/v0ywzdzI=;
 b=yXJkUjj+RY3nYIMUlHU2LhwpyAykM34NDVwk/6KHqmOn1qxKnfSyrJe7VKPiTnJFt+dGNY9XouiN5eWE9cQpQosDhefurvkg3QVMM8NcDTSyF7o7kilcZb5IXMdGQ0dVpnMLPsHJNbDdJma/4IQZKbuWo0Hw8n+QmN3ZirHoIU6Ww9W1OQyTlref41g6sGfE1q/bEWQCNBPYabRvw6AeZXjJeXEFh8AyanYSb893gjWd/IFrfAmMKmgMmxJIt7P5lxIL1W7E7cFmr+oVhmr0xQgDDIY9j+JM/TwdfFKjBSSIhhVYpEnBNXfkNL75DdgXpqaXpsETUrF5pBItGp1ssg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ex7Hg8YKg16Yv/U9DvQAxNEHE1Wnuuegf6/v0ywzdzI=;
 b=c6SQiXNZp5lUQmiEz53AuowwGdDisn1G6Y5CAVCXDW5shZ5DYKmTHPVc5FFku87NUhnmaKdDVu2mOUxlLfVIMDdz1bfOsbS+z5BJfg82w0HRVny8v3jl95pAKwr+HqPqqWwdMxqBh5x1mPb9QiiBzRYRwOiciSOy+xIfv1xVaO/R00hYHJ8PM63ta7xYPPMFextbJx8hAiY9WB67dJ2eTeW9q06S3wIvhg3QnjuUNuvP+XwuqndAetvjb9P7pNcLhp19gsWZPc384OuGUTAvB9jApkCmhObljZXYymov21yEDG0F0hmrLYSpRFCWzprNO7rHjnfirsKguW6mATx8Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.16; Mon, 1 Jun 2026 18:03:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:03:10 +0000
Message-ID: <3a1fafe9-ab81-4f31-9753-fef4cf5c34fb@nvidia.com>
Date: Mon, 1 Jun 2026 11:03:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/22] gpu: nova-core: Hopper/Blackwell: larger
 non-WPR heap
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-5-jhubbard@nvidia.com>
 <DIXCTSNATNLQ.1WWQREXDVMH4I@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DIXCTSNATNLQ.1WWQREXDVMH4I@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4184:EE_
X-MS-Office365-Filtering-Correlation-Id: 902bee6a-d66e-467c-0b83-08dec0080a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|11063799006|3023799007|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3BUoeCHnTihRJtKEbRhijlk6VngdrSTXDR598fDICw7uEZvxWkj1BE2tilDEY/x2e+ceq3uOmDPDDChrFb0gH5/1MEBJMrRVGWqTA7RkVg6K0hUgkq8NcCNyHECFCX8y6hSMsoxteSIu2neeRcEOsM1L2/4SRKvlJtojL4jKcHHH0807klBf+eIipD7mxNMefCeASbiO9qomHVMfisAQ2Tz5/kE1zUb5FIEjt7rxzP+sYQznLGF3WUp+qSnm0Mr5MAJ0SJ12EAmTBjfc9ox6DKZmKER0DFafqK/MBIOlas4FjQ5ZKFBPGKiqr0VCu/mMe/xJkDefac5u5+rjTXUSPXYHEhZYK4ZtvIXWx4dEtZAYRk6UD9tkzjWflTiV4NUOekoGZwLPvAmUkFm0ctPeYNePIgZ/VMacgnmGKcGEif5ZKWWoypOe1SkFYmUf3Gn2lKQLxA1QA4PJCeD7rfuNVTVxLiS2lDocVutAptwP4yXksy65+lylYu+12UaEz5MH4nJmOT2wQxwBiLqQGKKljTOtuyNO/RxRzWWcXvbviIOu8WZ3Jh1bxQSHAE7ipLSVKRy7sa7kZyLOQn5EhRVUEJIJgLpzj8VSWzAI1FDtNY58MGFZpq3ADckCbx/rnuArMXN8Svtb52xzUEsJbrqlhoiE4PbIGAEo4P902P60zNVRsnagDf37Gl996UCEBVEg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(11063799006)(3023799007)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHJ2U1NWQnYwUEhwTkZ4ZHFVVGw4UWxyRDZPdE9uK0xvYWhHV1BBaTBsQ3gz?=
 =?utf-8?B?eXIzVDZPeVI0T1p0VnZySWN2bkZ2K0pkall0U1dybndrQkNXaTRGYy93NU1p?=
 =?utf-8?B?L3lYRU9xOUVvZWkrbUxxbXpraXZxVDBQaVlxekZpWnUxczMvNmNPaHhqT1lG?=
 =?utf-8?B?SGdKRkxHWE83bnZPOU1tWS85RmhtWkduTjlwOXZUaldzZG41UjJkeDJQUmo3?=
 =?utf-8?B?L1laMzdycGdITXJDK0dFaXZzQUlJeDBJajFJOS85U3g5TitMQ08zQWh0VXI3?=
 =?utf-8?B?bFd1N3VLZGU0N0N1eVpEU2poTEt3bFF6dUZqcGN4c0I1cnNWMm9GSllmQWJP?=
 =?utf-8?B?TFF6aVZ2ZkNubExINm9wbmRCRFFrYTB5eTVoL01jSDlLckF6VC9wWm9zd0tt?=
 =?utf-8?B?WDhFbVhpcnl1Ym9tai9RMlg4WmwweWtUcWJGSTR4Z3p3cEI1SHNJbXROVjF0?=
 =?utf-8?B?MW1XUUlJZW94ZkYwNFd1YlI3WTU4SDgzdWRyRGQ4THYxcXNPQThaeGFWMFlm?=
 =?utf-8?B?S2JvYlNDTVJET1AxRVh6bS9tU2s0VjVYNTBRNDRTUTFzaDM3ZTAvTHVKMkg0?=
 =?utf-8?B?M1Z4MXRyMHo1dDNjd2tITzcxV2l6OHVSUWpqci9NODYvZWovSll6OUQ2eFFD?=
 =?utf-8?B?d1FDVC9OdEJLVU1ncElIamswOU5zRFhwSVVXRUV5T2JsS0hMVGg3eUNkQlNK?=
 =?utf-8?B?NlJyeFJhdGd0MHd3YytjRmhKMVg3ZFNTVkJTKzIvSlJId3Y0Z1BYRGlRQnQ0?=
 =?utf-8?B?S0xySUVJYllTdE9KUm1GZ1gvaVJjYVNCaUtMWXVJN1NXZXEyT2pMd0VBQ244?=
 =?utf-8?B?TjdhOVlZOENXRnpEWE41SlRJemRYdzFlRi8rNWI3V3ArdkxjUUFaVlVOSzA2?=
 =?utf-8?B?dHBhOTVhT1ptbHVNbVFQNTJQRklwMkZrZGQzTFk4WUNaV1Vwcjd4enRUUWYv?=
 =?utf-8?B?YlZZRnhkUitGZlErK1Y1M0xjTVNZbnVsckdzNDYwSWlnY1VWd2FveVBJSGJw?=
 =?utf-8?B?dGZmOGwvaXFaMnhJYlYzWmZ1NWRtSFNrTHprUVEzZHZ2V3F2a1V0azg5Q0RB?=
 =?utf-8?B?ckF1MWx1ckFwbWsra2pEMEk2Y2ZWL0pTQWl0aERsWFVjYUVKVVVIVkxaTEtj?=
 =?utf-8?B?bDgzU2k5UGhQaExnWGUwbFJhUzV2NnM5RjdNczRnREdDQk1SYmdqTHRFY2VP?=
 =?utf-8?B?cGc4TytFWHJjMmR2VWZKTTdGWW8xWVlXSlpmVTVLWCtzSlV1SHdDVTF5ZkRD?=
 =?utf-8?B?eGZIbzRjMGxCZUNia0xwMzV3eU8wSWVMWmVGT0EvVUp3emJ5N29GTmdrRkM2?=
 =?utf-8?B?T2s4RHZyakhrbXJhd29BSjVFMU0zUVI5MnpvQndDMVdBK1pOSjhXb0hPbWhk?=
 =?utf-8?B?M0RUek5JRGpPT1IxUHQ0OEhuMllvVnBjUUpCS0dBcytaSE1zdnlwaFJvZ2M3?=
 =?utf-8?B?NERxaG5sN1JiV0kxZlVmK3BsZE0vY1dSNE1OdlBvSlpLSzloN25Ya09nZW11?=
 =?utf-8?B?TDZyL1dnUWs4Ui9mU0p3QmoxRGJvNGZkSHNVeldJbzdHMjM1WHRoQ1RYTWdp?=
 =?utf-8?B?aSsxTVNiTDlzOEtlbnY1V0lncEg4cDFLOFZ0dERJcGRsd282QWh3ZmpWTTBR?=
 =?utf-8?B?YU5uamNhUmFtUDlGNFg4RzYxUkwwL1Zkc1N5SUhrM01kMFNGTzdiUm5jZ2g2?=
 =?utf-8?B?ZU0rVnpGQWtLTUZlYmY3R3lXbmZDdEpoWGdUVjUvRUtyeDVXU3dreHIzaklr?=
 =?utf-8?B?ajljNFdLbVlReTlDb2IxMnZadFc5ZnNsb0txdjNZNjVZVEZQdGE2ZDdWYWdU?=
 =?utf-8?B?cVREOGs1dVFienFKcHR1eEllTmNwUUZpYnIwYVlJRVVYSVMyQzYwaGY2NFRQ?=
 =?utf-8?B?SlRhNmpEdkRJTER0aVVSMzZ6OUgwZHhuREZGZHpkd3o3aFRTMExnWWxiK1k0?=
 =?utf-8?B?TkYrUG0yN3pxRVVMQzZSQ01oWk9lR3hpV1ZFL1psOFFYL1VjQXJtNkd2d2Mr?=
 =?utf-8?B?WmYya1NQZVVsb2xrdXBqY3VubDNkR1liL2p2RWJTTDhOQ0xEVkNuR2lQK3VX?=
 =?utf-8?B?YVNhUVNzS05mMDdyMDQ4ZkRPWGMrbW9MaTV5eHpEM3lvVVo3RUF5ZWMwSWdP?=
 =?utf-8?B?TTYvWWRyS1NZL2NhT3RMUERuY3RVSmM5aTBKOWZyS001SVVuQWRwVWE0VU50?=
 =?utf-8?B?bVhzS0FxVVk3ZXp3MjR2WXVSWXZNQUFnT1lBV1c4V1ZsUTE5bDlWSDdjczBV?=
 =?utf-8?B?U1cyQ1pKcTRVNDF5dFhIMlkwZVVBc3Ryc1ZWWW1VZUExTHB6MkFVWEt3T0VM?=
 =?utf-8?B?TXQydXhOZUhJcjZzbVVlSmZ6eHNOSnE3SFV0SnR4WWllYVFWNy8zdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902bee6a-d66e-467c-0b83-08dec0080a91
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:03:10.4885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhhDHj9OI+/ZPvnJ0y9WI+Mgs5gjEr3u7lakgnVU3OjgeGWSKIVa+dznEJxQzKjflCncNZ0vza33tB0mL9+c6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184

On 5/31/26 7:24 PM, Alexandre Courbot wrote:
> On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
...>> @@ -37,6 +41,13 @@ pub(crate) trait FbHal {
>>  
>>      /// Returns the FRTS size, in bytes.
>>      fn frts_size(&self) -> u64;
>> +
>> +    /// Returns the non-WPR heap size for this chipset, in bytes.
>> +    ///
>> +    /// Older architectures use 1 MiB. Hopper and Blackwell override this.
>> +    fn non_wpr_heap_size(&self) -> u32 {
>> +        u32::SZ_1M
>> +    }
> 
> I'm not sure that there is a "default" value here - this carries the
> risk that future implementations will forget to implement this method
> and get the same value as Turing/Ampere. Could you instead use a
> `non_wpr_heap_size_tu102` method that is called by ga100/ga102 as well?

OK, will do that.


thanks,
-- 
John Hubbard

