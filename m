Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013028.outbound.protection.outlook.com [40.93.196.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4331231AF1F;
	Thu,  2 Apr 2026 14:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141992; cv=fail; b=fXkwadknr2PFghvy27zSvtF+NzYeOW1iqKihD7WAW0XhoIvbCCl7N+F/s6cnd9NriQWsAGAxom7Puw7JJ8H9/beErgr0DiAvrtLUmypcF0L57GDdaxrI/AaSIEb/GXw2iqSqJ+a66Rm5Ix3PpBRIJXd2H/s4k2Th3ywDtc79fkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141992; c=relaxed/simple;
	bh=yJxM81VzY1G0Te6NvWIv8Rk8c8npd0n03Q/NBnYOHvU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TbfhpMPIBRgT9k0JL1wsNqSGTVl0xdH9bmNZEdIrZ65VGcYXYqqb4qP+njk2fgGQIh9Usf1sbgjhLkAnLOQFj58ZQ3aNkdd95VnUvgtSi1vpznNLj6IQbbFI3AIWbuU8lQEqojxAWBYjsKhYhEsMf5VfniNfwljbo2m9FHQvtpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h3XMc7gz; arc=fail smtp.client-ip=40.93.196.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h3XMc7gz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9/cmNcguzsrfumAemXYr8ZqU1Q2h/lF2ecn4es2NHlXspUs0nyB5iJC0Bj0Ju7MW8uxI/R6Q5kOC3i9cwoFWIqr2DSM7XAmR18MJ6WTbSHlP0aOVY0FbGY+yzURFCO/gwWkjL/8jMvd9dFTxZ7cHbq6w0D/5uKhWlu5rYbfgwX0m29lbqvLxO0qHxIidRTeDJtnaNQE9zEeiN3Jurmi0blZp+9GJWmwWwp3gkt4ZhK8WO+Cbg1tZnlgHPrtbBnlkasK3aQ/mHm4lguBMFrLazdXXP5/BvgWL2gppvBsN+uocMSq3vje8liWk+ZDjQzn4130piJmCNuxYbWFPJsCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jC9dN0rPt0STgXyz392oJuhyhzel3LIieiPr01/gYmc=;
 b=h31sn2zLlcd+MYpbl8AwYWA9d1jkmwL1EiIAEgrFtU8mmyJvTlXTqTIQRhjSJJ7G9DOgmvc1wkFUAds4K0e9K7m7U7/UIRl9p5gvieQROEiuV/gKikEZcMJjlI7z4y8u1RiiY/AuwHzLLvfs9mASCETlTuVlQhltd6ovAG10k5Nnm+45VkR381qbWunK016nd5laK9gqW38XGRF7DPsZHoEbR82+3ErK3HUcnatdacFA4dQU2IrpxHNhj+Rn6H56TvmjfPjojP+KoztMRiqiPAz06O3Lw6Ow2lv7s/9Fyk4U8XcEar3G2jilXe6BrT85nH8ND/6FZjAKqdpZ2tU49w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jC9dN0rPt0STgXyz392oJuhyhzel3LIieiPr01/gYmc=;
 b=h3XMc7gzymZzwtxsZjdjtldCoWO9t189CVbChpcGXvHGHNqGmJyschLCko6Zws03qgEQieE4XNJV9O+IJcmSH339fFUgWiITRLqRi5XrUXAD0TlCym5RbyXlodi/CSFL2Q/8eVUA4T3l5yq9f0U8OPOonEm35lQ/cTfbplnv0vr1ld53UWmg+iJL/vIV1UGI5yHA2Jm2Dlgv+mECg75AkF+S+UMcBVgf6nbzeTum71wEHOMl2bhk74lGntDmQymWZ/f3GA8+oBhfy4wKE//Sp918Dgn4HZcZ+mgxR9ga+UWqjC+g9/Tzz8yZLXZYnR/Sd4QS29vIILRrM7PM6utRGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM4PR12MB6493.namprd12.prod.outlook.com (2603:10b6:8:b6::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Thu, 2 Apr 2026 14:59:45 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 14:59:45 +0000
Message-ID: <aadd85a7-efc5-4d4e-893f-533049de54d6@nvidia.com>
Date: Thu, 2 Apr 2026 10:59:40 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] gpu: nova-core: use SizeConstants trait for u64
 size constants
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma
 <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260401222743.148710-1-jhubbard@nvidia.com>
 <20260401222743.148710-3-jhubbard@nvidia.com>
 <b1c23169-9368-4ec5-98f9-f73fe8128305@nvidia.com>
 <DHIR7Y4FLM2H.ENO8SJ92Q24J@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DHIR7Y4FLM2H.ENO8SJ92Q24J@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:208:32f::20) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc23cac-6de2-451f-b15f-08de90c87a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OUsUxA/Yfpc/JHQBUZK2o9VrtakfL6x0AHU5JCcG5oz2wwj3Eq7Ci3B1TI7Jed4Ct8sQfh90IWnWaH1nRKzSf1YvKmX5/+UIJmUrcbQ3WldzgGgj3pYly7ESQeO61B2JSDQYpt1blH+H50dBchJ1z3VZEI7eqYrIE7CSBEAY8azPVeLNwya6KwULhytP6YRcvalfKl3cN/8zJj5oCoqnLj+bS2Z+Mjix3+ke/SyG2CbeTdysDNsVV2KB541QwX60eK9gREVLo4/1JWZ8n4oA+yp5ik22jra6WNE5+ksaDG6XaKe2boygh3FoZp83sgw6XraHiOKPs2N3xViyX4V2ZFQg//CzKW900tvK5vds2obzvqGHjUzLfmIl8oQQDVozdQ8ds3qzjaXMDDM8fZwnCOfl7FyHjepp/1LXLHFpDGBPauyppnsYAv6vJ37E6zwBIJjzjP4O/ybEDRQaigaQp/UUDi7i4ecWcgwPzEQmB+xza/r35B9ZRO8ic2LWBGwlJ1f0FkJlMJV82MZ/O8GrWVNkgjVJDSHE+6ieBY0v8wfDN2YzwIB514DqmBDp/DFlJWKajS4yUWNNzbf6h3PErJ3WL187yZy9nfduqzi7UZbBQWQ7lgpYMjgLbtCkMHLeIk7rLHnbW4IzV0rTlgVKVnodUUk/GEXi+eOFaUi+TYGhlk7+aZ/Bv5wNKxA+6D4zBtZFtGidpqTz98Oo19RPOp0mXSbH5bYRYFWNaUIxySI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0dHalREQ1ZVaHFpZ3cvTFQ5L0duSjlOMzBaRGlHMlI2ZHErdk5MSVd0akg5?=
 =?utf-8?B?c1VjN2VCMzNHazZlTncvTmlacnVybHd3L0FLaXZaeWV1UXNtd3RCNEJCSWEx?=
 =?utf-8?B?RjFzYVo0cW1VSlBzYnIzK042Yk01dE9jNnM4NW54UFpramRJTEp3WS9vTjZv?=
 =?utf-8?B?Tm1zYXBhbGZUUEJjdWJjUDJVRlhwUG4rVjd4dEFWQ0d0dU8zUFE0THNIRWo1?=
 =?utf-8?B?Q0tkMW02V2drYUpMRHB3SU16OHVnQ0tPTFowa3BFK0JUbEZZN081RGFRN2ty?=
 =?utf-8?B?dllQVEVrUVkyUWRLbit5SllVeGdYY1p0NzJpY1F2R0VuWXBqbTh2UzVCN3BF?=
 =?utf-8?B?cFhkZm1YTGJ6MkI2OGxZdUFUSXh0WmZUK3RGNnRPUmEvMFJWeHVqYng0RG43?=
 =?utf-8?B?dG1sellsem5UZWR1OUx2eTdqRDhTSll2WFFrUUV5TWpNakczTmJpcm4yZVQ3?=
 =?utf-8?B?c2tWL0p3TmlOWTJoeHVZR3ZPQmx5RDJmYVFQU2Nia1o0QkNyeTRtWUhQRFBT?=
 =?utf-8?B?eU9UOG1ISmlpYkF1SjdqeFlGbDExYUJ2bElCUVhvYm1qakl6cW9tYWtiSjZs?=
 =?utf-8?B?MXNvQ1ptTEJVUnkrMDZ0TUNSR0JXMDhXd0sxRFg0eGw4U0didm1pZjFGMTU1?=
 =?utf-8?B?cS9ra0lDMytIKzRDSmc2LzZHV3BVYzN0TmZ1NVM0WE5xNXZzTXlZMWFyTG9L?=
 =?utf-8?B?d1F3U2xSajVJdjNTVDkyWXhjekxNWk5JNUJ5VDU1aEJPSDVZQnIzb2NJSFBq?=
 =?utf-8?B?dEt3MkJPN2NOWUZiVmJSSHdCOVlFampNbjlZUWl0dEJYSEdERStkejZrbisz?=
 =?utf-8?B?RzV0Ti9hRUtBSzQ3eTFySkVEdnNxVkZqMTJwbm0vMVN6V2pqd2lYdWk5aTVY?=
 =?utf-8?B?eTZ1Zk8rZGpKSGQ0WlUxcjJNQ0JqSktLY05ycWo2eHMwWWdGSU1QN1ZHdTJW?=
 =?utf-8?B?QklEcVdJMjRmcGZQZ3BUcUY4ZlBlTEd5c01ZOTV0NytpK2dsRm9wKzN3S2V2?=
 =?utf-8?B?RW0rd2FJOWRvSHExWldmOWRaUGloWE5Jc1VqYWxxaTgrUDI1UWdlWUdYMFpV?=
 =?utf-8?B?K0ZYWkZZOUhZWjkzSVpGRUs3MUdVS04yVTYwczFtaG0rWDZJeWl3V0lldHl2?=
 =?utf-8?B?YnNreVdORmZnN0xESEN0QUNWTVNHbVp6Rk96cDRjRTg3OGtnclA5TlRadS8x?=
 =?utf-8?B?UWlnNjRDSXR0VURiNzNOcXBxSjR3ZHdOWDV3NFFURWV0TEVLTG4xRVBpY2Vq?=
 =?utf-8?B?d3lNWHdlT0lURVJHdzl6MlJMaEFWSlhtMDZlMXVuYlB4RXpSSG1zckUxZjJ4?=
 =?utf-8?B?Smo5dUxRT0M1aW5wNHY3ZVdDMDJ4enBJOUE3VTQxOE4zS1l2S09Qd1VFWTVO?=
 =?utf-8?B?dkdwbWthcnRqc0QyTzdIOWVTSVpnclhMZ08zWUI5NHgwRUpSMmwwS21ya2tP?=
 =?utf-8?B?ekdHWi9LYVo3SS93b2o1b29qWXl2c1c3Und3cU0rdm84SU42bnN3TjhoR1pp?=
 =?utf-8?B?WFkzdElvU3ptcDJ2RmcwTEl6QU5JN2RtajJ1Qm1WZUExdDBmd21aTXM2K2w5?=
 =?utf-8?B?cng1TER3Wk1FUjdibGNiSjAwdlhYM1NYQU1VNjc0eWZFcm9YcFVnU1M3bUU5?=
 =?utf-8?B?bHB5T2NnZzh6VkI4VTh0K3RmYWJZS3I2V1JsVDdXNlZhRHJTSC9icUMvL2VC?=
 =?utf-8?B?NGRrVHNqZmFUNytvNmpYcnFLekpKclBmY3ZScDFubjRuUkR4Y2UxbzgyMGlC?=
 =?utf-8?B?RTdnWHE2OFgxd1pkVjVJVC9yNzdIZ2s4R3I5SWJ6SHYxSWFOcFZXcmhEenJU?=
 =?utf-8?B?NWJpSGRKS3ZDN3ZKeDd6ckhSd2syZSs4K3VoNDhaZFh6NFRvcGtOYnBkcE1w?=
 =?utf-8?B?ZDczaTcyUmIxMlZIOExSVVNESlRpZVY3Z0VkdzVUc3NraUhWOHFHL2NNbitU?=
 =?utf-8?B?L0tpbGFxdUxXdm9CRUR4blc0ZXVkZlpnTFB5QTZ2VVptNXY2RkpPbENUZmph?=
 =?utf-8?B?UHZRYlIxd1RENEN5TmlqU1djRW9kVE9MTzBxT00rWUZ6bS9NRk80c09FN0Fz?=
 =?utf-8?B?ekJ3T2xRMVRZR3A0UXh5V3dxekVqcTY0SXRPWWE2THEvMW1lT2h5eUdicjdV?=
 =?utf-8?B?T3Byb0U4R0g4UWp4eVFkTUhoc3F1QVZsQ1Ezd0dxK1BjcmR5djFMN0kxa24z?=
 =?utf-8?B?VWxwaDNlK0I2MWM0Q1FVUDFDbzJKTktQdDl1eW51clNsRWF3QXNlb255R0JE?=
 =?utf-8?B?cGJkWWxCRTV2SWc5Z1daVFFCOTh5RmFWSXZTSVFqaFV0RVFWL1Ftd0ZJOWpU?=
 =?utf-8?B?YUtxNm5QT3Vtc2pIWFpScC9UWTh4TkV5ZUlXd3hiWWN0NzZYa04wdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc23cac-6de2-451f-b15f-08de90c87a54
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 14:59:45.4948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqYR3yqENoJYr6D7/8ubf3rV5Qsp4Zy8sapMob8RuIWmmZZn3118ki04kzO8WYKUkCIoWW+k2LhTv7Hf8xqrIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493



On 4/2/2026 10:55 AM, Alexandre Courbot wrote:
> On Thu Apr 2, 2026 at 11:33 PM JST, Joel Fernandes wrote:
>>
>>
>> On 4/1/2026 6:27 PM, John Hubbard wrote:
>>> Replace manual usize-to-u64 conversions of SZ_* constants with the
>>> SizeConstants trait's associated constants on u64. With the
>>> SizeConstants trait in scope, u64::SZ_1M replaces usize_as_u64(SZ_1M)
>>> and similar.
>>>
>>> This removes several now-unused imports: usize_as_u64, FromSafeCast,
>>> and individual SZ_* type-level constants.
>>>
>>> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>
>> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
>>
>> I am very happy to see this series since I have these issues with mm
>> patches quite a bit, which this series will resolve. Should I update the
>> nova mm series to use these, or wait for it to be merged? The issue with
>> updating the nova mm series is, then I'll have to either:
>>
>>  a) carry the series as a dependency.
>>  b) wait for it to merge into drm-rust-next and rebase
>>
>> I could do a) and add a [REFERENCE] prefix to the patches, similar to how I
>> did for some drm buddy bindings patches. Thoughts?
> 
> There is no need to carry the series into yours, just add a link to the
> cover letter to your dependencies and folks can pick them up.
> 
> b4 also provides a dependency management mechanism, and will even fetch
> them automatically if the people applying your series also use it.

Oooh, b4 can actually track dependencies not in any tree as well? I have to
check that out.

> 
> I don't know which tree is going to pick this series, so whether we can
> use it this cycle or not will depend on that. But if it lands in
> `drm-rust-next`, then it's just a few weeks until you can drop the
> dependency link from your cover letter anyway.

Sounds good, thanks,

--
Joel Fernandes

