Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011018.outbound.protection.outlook.com [52.101.57.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7151347BC9;
	Mon,  9 Mar 2026 18:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079290; cv=fail; b=EDjkUb8oTkzX5UaR/tamJNZCuLSxPR2skX9FXmdto5fnWg57gIjDS/dG0hHK9RdXL4vPMnSX5RnEq9eXPrTgm4mqSnRAYKJS+wl6PusiNtcX00KCm0rdgzx3w3snUgW/NEd2WC/2018fJ/goqvmrRJDgTGWrhYnUX4qV0XZdqBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079290; c=relaxed/simple;
	bh=dfSVavd6biJOBGgE9qnXqgRU4iBTErlU/zWDrVJ7QxQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NMR9xbDRGdcuZR6ElLRwv2vl3/RsHBoHnxk2Nc3Xl77raCcpx2hKd/dJdw/svT5N65VISYNEqV1kxYmdHYqtFkoiHwB4HB7VYvjynRybb4RFYevgyhPjKFGueqMVF7yiK7zMRWfgIzJsNUD/rs4CMl4BXKCdHeMIz7EUzUYpgvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Dbh9Z1iR; arc=fail smtp.client-ip=52.101.57.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dbh9Z1iR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ux/7Mp06I6/2Hs5G1/xxofo0ErGUtSVFlQcQE381hUR9NccovDWX8DE5ZfH5TdDJxWjos/fa9i1rXSdLsE7NqrNtDIWBWHmXhmfGCxXG/gFvVgGKn8mxT/8X9KwvOrfYWGnNr5gPb9DQu5AQPa7kXjQA5FGfBGPDyHD/dQVln9EI6KJ90nKqzsTwmHq01V4qXMFzhi9j187WCeA3yvuPACG2GAqgPKILC33RAABAzThAixpRAVLxKwdMaRzKmA3TPEEASApf1riBIjvKtgPkecuskhF6ULS/lVXSN13KGd9l2HdCAFP0G6HfHlKloYzrhrCbpdJrEM4KnkCXwyAbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbPHk41kFR5XCZUvCuOeiFhxR8RCUINZpn6NJAN+yos=;
 b=lqGTs/djclw+uoC7cvq5hAgaGrWr7w7xdTn9fuesms+dDaVYppwwGsIF9YL/hgGJ05G80XOJCz9CLFwnYnN3rZnUJTHBuBszgfmvHTXy1uhSdGE0XppWMTkh0B4XtTRDxV4EUUqzEtAKc/C2rzDS0eLgIvvFETxbeYzgzyxLEiMBNB0qoSxCkf1UNIOCNRwAC2Ryil1LHWahh0y9j8rx/PyEEeiHLBU6HN6EIhW39hoiohysv5joXVPXxOEBHb7AyUNC1lNG+2K2ZPZoemE4vR9zpRkRB4j/IenHbwWyz9YDIRsVtOZ1HlcElV9C2JlkU7mOD5qoFY47o0q2rG3TeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbPHk41kFR5XCZUvCuOeiFhxR8RCUINZpn6NJAN+yos=;
 b=Dbh9Z1iR/ZImblcG2ofMaa7SvXomOju2zaf1b1ImzpjiEODdKJ4Cfqss235nHx9E1V1buOz5jEE1EYKKrijrzxtdHxaw5VC7474/XTpQ2JxfgzvSDCVdWDPSYCOlAo2nD8VFhCYWMBrxeyLwH2NJXDGDryegdW7nowW5Z4qk/PeISesPeWf4f5KSHe1IgQImVCoWxhucfRhp9bgEblnqI5AD+cux3CnSMamqL5Sl9EipqSI/T6c8yaBMMsB6Y0vF/9/LsR1jm3IKlslbDgG1SpjFAo4FQC66BhonWJ4x/pNDVFVwJsbuOERYHnHdzugXagXM3Zb1z4RNeptsEQBkHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB7856.namprd12.prod.outlook.com (2603:10b6:806:340::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 18:01:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 18:01:24 +0000
Message-ID: <fd45410a-43cc-4d8a-a750-6f3211dd2797@nvidia.com>
Date: Mon, 9 Mar 2026 11:01:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH FOR REFERENCE v8 10/10] gpu: nova-core: use the kernel
 `register!` macro
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>,
 Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-10-424f80dd43bc@nvidia.com>
 <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
 <d85a3776-4a73-457d-8722-82d8dfc58591@nvidia.com>
 <4f7baebe-e993-40b5-9cb2-3d4699da1299@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <4f7baebe-e993-40b5-9cb2-3d4699da1299@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0039.namprd02.prod.outlook.com
 (2603:10b6:a03:54::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: a81cff42-2478-4ea3-52d5-08de7e05e0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	ZstAivOPZUG/qZ+aNk0+pums1hg2kcYzly6PQA88U9KNZNbY745g0myU9OZ8fr2LRatHSWqaWMNiwLZHD+wbtjWFM0PsD7zv3SM3OGBfbNVKfCpeHiy7Ki6WuPncAwiQhQ+qtTq3uLeyQ634xku+ae/bWxUy4yhPiVhOYcu+CT+aniFpzsZxirfbXV7hsRhm7+rih2stH/nojo+PuD2ldvkEEbSI3D2x/ujOr53M6jvYoG8G1SuS3jhlUBAD5teRtaIzwH1NioTRCX9c7UBkJe35ay0mXhqUiGi5c3w+0LxD73XHbk5xGTR2ttdOekrxaXSZhGz79dWu5OM3yFDs+uipOE2CdooHwEOGsopYLUcqSEpCytBLOlN4XJzS40QPOOKBXUKghe3YByq+EqqqK1QMgkaco4Fg0DcAJS2y3Xb/8G6sMVWSHNdwWBkc/LICyxqNQ1nLu0YQ1dSMjUGlfuq87+f34kmxmVOS1gix+7R8qPWjH0ZwUQwmTkoVee/ELEvPFaZJLDMDqzRaDKE3aoRLTAJmCmp9f8E0iUyxySTAm/Sr0AqYeIIqek2x9t5z7/ylkoIVeE2co85z9PAu1/vn7Vk5PbhdlAcjBAuo2ydnunyEyvamDWBhfEZw7jYBTKZpRpgKJHd2co/u1CEECOP6/8rGdzPfpDvEYyu8lsXpnvSqW+2EZINZ+MqDOzS0rmHsSlj+zh4EsRVE2U+u5HXVN6v8Njf+pe4J07meLex2pqAQW2lcRcX7e+96CnpB19z89+pC1bBq0pITjkDu2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME54cmZMdXU4RFlCRC96Wm42cS95SlQ0bm1JWGpueTlYR09tTEx5Vm5mVzFn?=
 =?utf-8?B?ZGNWazA1cEViWmp1VFVsajF5dVlDUjA4VGFKc3JHODJqeFdQd0dNZUZXTnhJ?=
 =?utf-8?B?Y2YrOU5hN0lvTUZTOU00blgyQTRIZDlNQnJsSitZb2VWb1hpTXRDeFlVQXBn?=
 =?utf-8?B?R3haYjlreFk2RnJvTisrM3ZoVnVkMnRQUTJkbFFDaHNBL1FLaVBKSlpZa0Ex?=
 =?utf-8?B?LzRpOWMyVG1HVUp6WElpbnpqVjdjV2R4N1RzREZCd2hvZ0REMTlCL2ZXLzlI?=
 =?utf-8?B?T2MvTHJBNWErSm92SzBVSXByOUpJTUwxQTNrS0c4QXNBMzJibW5aL0N1MzEw?=
 =?utf-8?B?NzVzVGRBWFJvNjE1UjlGNURYcGVFNVd5cmZyL0ZLSFA0RW1xMi9VNGNhL0dB?=
 =?utf-8?B?SUJGZkhxWnBpb1pkbk10bGJ6akRkUkkrSUtFb3UwZHNGTDRYNHRqMzRCcm41?=
 =?utf-8?B?UjQ2c1JybE5iRVpnMHZyNDhSREIvTCtiM1lwT0dnVXYyV1BEL0d3ZEFxcmNN?=
 =?utf-8?B?c01HYXlzU29IMFdpTGQ5dUM0SUxsS0JRUFNqRjlCeWxRM08yTERndnE2Tncw?=
 =?utf-8?B?TTF3RVNKV0ZUc253T1RyWW1aWHRmckpuMjZBbUpIZHNCTWVLUlZkQk9UREhU?=
 =?utf-8?B?T09LcWZxbnpDOTlxcE5TREcrVTJMbjk5SW0rTVU1QlFtaVNjUTNUZ1JkTktC?=
 =?utf-8?B?UG1TNEhZaVhFaWMxYk52V3lUV25hSEgvVVE2NmNwU1dqRmtYZGJrcmxnbENU?=
 =?utf-8?B?TVVBSFExUmpJdURlTjRGekZPekZlSHRVMTErODRWckZJWHlVaktqUGpBdkw3?=
 =?utf-8?B?V0pUT2hWYVlBa2Y4VVJKTHcvQVc4RnJpdWR1QlloR3ROaWh2VXVnUEQ5T3Bk?=
 =?utf-8?B?MzZ6WlhKTVowRjN1bkhRZW5aOHZRSTFKcTFqNWZvTWxLeHZFZzE1MFVoOTRk?=
 =?utf-8?B?c0RBZVB5eHBwM2tuR204amkzWjlkTVVBU0VUS1hLY3JLZy8rU2NhdGR1eHJ4?=
 =?utf-8?B?bVdxVGt2MFdlRTFkZnUxKzkzdEJnYVRteWNYMzNqS0dTVFhMQlVBSDc5Y3dL?=
 =?utf-8?B?MGU4aTZmYkJKYU1EQ0JZdGlFSjk0MVI2bFdNc2w0ZHJEbHBNRUZ6cDdIQnJZ?=
 =?utf-8?B?S0x2aGRlNjVSaEtpSVdyTXlxK2EyeEhOWXBJNzhTTnRxdUJBeTFzYWdtY2la?=
 =?utf-8?B?M2FHUjlid0RSa0djVVNMaE5sbmp3aU9FeXhxbDBtSmZ0YUx3M1hMbUdERDVl?=
 =?utf-8?B?YXNlaWUzSkVWZFZBSzFVbXJwejNNQXZzcW9aa2k2V1VEWlI2MzhyWmV4WEZx?=
 =?utf-8?B?L0ZFVGpENGhUTmFhYVJWNTBMMnBMTGttcjEvd2loV1lFK2lqYlVDWFkvZ0dK?=
 =?utf-8?B?WkhoeGxIY3JlMitNR3ZxT2NIcDV3UlBKZFlJWGJYN284UkRlWEVLdENpbHgv?=
 =?utf-8?B?dkRsVDZOdGpUUEYxaFdMQmptS2dkRHUvU016QUx3M2VWYmNMaWVQbTE1K05Z?=
 =?utf-8?B?S3pmVy9QM0Z3SGNrSzlNakpsU3JDNnAyNTlEVm1abGwyZmR6VTlOTklicDdM?=
 =?utf-8?B?WjJuYXZVUUN2anc5UGVVZ0Y3U3JIdzZJMm5iWG85K1BBalNHZkdaVFVZRzJQ?=
 =?utf-8?B?OHprTnMvdkowT1NXN01OZkNPS3VwMzFNVnlrdGp0YlBsV1hUS1lvT0wyVU9k?=
 =?utf-8?B?ZWJFUGtWaEswMkZMeG5QNGU3WG84SVBCNUE0Z0ljRDVpK1IrK0dnWFJ1SUZF?=
 =?utf-8?B?aXM5K3hSSHBleVptaThyekwyNisxRUdENHExTmtkZ0hrQ29BRm5JcS9MRTJi?=
 =?utf-8?B?dVIwcjVORVlWWWowVTlHNmp6Y3paSmpwbitobTJRdi92b1RpMXRFUnFPR3Ew?=
 =?utf-8?B?Wk1hczlvQ2NsM2R1Sk5JQ0FZNzNvdVhSZzBRQnJ6U2NWS3dMcGVTRWhoUVJO?=
 =?utf-8?B?UlVaOGx1K1FhRTl1d0Q1Mm9JQmFEbytUc0M5dnN0MjE4MnhNd2VZbkduc29i?=
 =?utf-8?B?S0xxdklBWllmMHJCQXJkZjU5SGRWZU9zOEw0WTBGYXhka1R3dEpYci9PMUQw?=
 =?utf-8?B?L3kzR05ZRTBRUHZIaUZJYk5xckdpZlU2YllOOGE3R3hzZGZoQ3ZkRnpIZnND?=
 =?utf-8?B?RGNKZS94OFZtc3lzWTV4eGVidWlpOWhBbzRicWJIUGRPOGdRL3JyTWR6VnZi?=
 =?utf-8?B?SDZWWDYxNncrb0NRTllRZCt4V09tY3UyWUNkYkZDQ3BRbE1nU0s4YWkvN05o?=
 =?utf-8?B?TnhtTENROU5qY1U5VlBDVUJNcW1SSlJkaEFLMVlWZHhOME1xNmZrTUltUGFG?=
 =?utf-8?B?b1FqeE9ETHZKK0xvTnB1cktwRWl5OFE2b2FqNlQ5ai8wNnE1SmdBQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81cff42-2478-4ea3-52d5-08de7e05e0ad
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:01:24.4674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrYPX1oMKCF57zOKq/ycNsI8NA/kn4SACeQp2zCTYhllcd4Pd/K27cwhTsGqkatHVU3IlBis7bihI1kOtI1Cvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7856

On 3/9/26 10:51 AM, Joel Fernandes wrote:
> On 3/9/2026 1:34 PM, John Hubbard wrote:
>> On 3/9/26 8:43 AM, Joel Fernandes wrote:
>>> On 3/9/2026 11:14 AM, Alexandre Courbot wrote:
...
>>> TBH, this is quite a readability hit, the previous was much more readable IMHO.
>>
>> Yes, I think so too, except that "WithBase::of::<E>" makes a lot more
>> sense on-screen, than "&E::ID". The latter just looks quite random,
>> so this part is an improvement.
>>
>> Let's break down the remaining troublesome part a bit:
>>
>>     regs::NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(mbox1)
>>
>> * "regs::" can be omitted with a "use" statement, right?
>>
>> * ::zeroed() maybe should be the default behavior here, and then
>>   it could also be omitted?
> 
> The issue with omitting it is it still needs a constructor? so if not zeroed()
> it would still need ::default() I think.
> 
>>
>> * .with_value(mbox1) I'm sure this is necessary, but the construction
>>   is unfortunately much less clear than .write(value)! Thoughts?
> 
> yeah, also perhaps the whole thing should have a macro! to de-sugar. The
> patterns seem somewhat repetitive.

Yes, and actually, I don't immediately see why we have to specify both
a base value and a register name, because registers have a fixed base
address.

What about this instead (*very* approximately):

   // set up or construct NV_PFALCON_FALCON_MAILBOX1:

   let reg = NV_PFALCON_FALCON_MAILBOX1::zeroed(&bar);

   reg.write(NV_PFALCON_FALCON_MAILBOX1, new_mbox1_val);



thanks,
-- 
John Hubbard

