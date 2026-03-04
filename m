Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE571F131A;
	Wed,  4 Mar 2026 03:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772596087; cv=fail; b=W4IvrewDH4j9Aq7gCo03+7aNpFfSFqx/znbRMCpYxMPlgl7d1zEvjd7yvSduqyktZ5F5LMdyBfhi3anQhsLzPOTrqTlWn2Xndpfe0dUpzskA4FetAnjTFIbN+llsvF7Ehw6EfGgMh48tEyduJ4R1PQkIoj+bL2mOXP//qwFQuS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772596087; c=relaxed/simple;
	bh=FuFwj1PFIh6SRddS9Yhp1wXpI4+BnehqnZ/ccpa6Bc4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PZa81C6gz2vRAfulcH3cV2v3BhTYLIKHmKIDspcLwhuqkmvEL0jzBkr37u52EMvur1PYykmhKFwAFNs6/FKmWU2ILzGHfyFaK80oweefVwZ3715EQva0dYt6iZKHF2C63c4tBulJhmN8LD+wbagOU2sUBBxESNBDXAP//xXElr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nWuUHTcZ; arc=fail smtp.client-ip=52.101.46.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nWuUHTcZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBjM3MWb6A+/0wx7zfAz9oyC1jJCOUuX5qqp9nEcZArwNX0jE4ihsmzNpV4gj5BDpSQ2YwGP6E33LDiQENDFWe+JmtyPqWfvKGG8GXOjsxl7hYUoDdFX07aficoOZiTe2QyoDc7xd6AbAVgfWLezvUnFSG9CKlXJ6x7U9hb5UIxbi/lr2A+Trk7PLvTK3wh8AJM/nLtm9Zre198w2YC8AAK9wWXyaIQSjQ4qPObrrvnuyjR5tT+YhJk2MkRhH4g684bPrtraNBF/rRrvE70Aa71Igfy7uweHBe6u23qb/kRoW2dAprKU/21LUHuIFTITHDx5wTQEVwsCBVWRQu4E9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JVYY5rBWrJdmvFjoA0kKo1AP+VgtV3AcZaPa2AKU+U=;
 b=Me7Y3QvGkNuMlLjB90h/jMSAjL2V2DEu5wOYgmqZTtU/Ui0bppP8oFRjQV4FtT+oZaMBy1dKbcqvV3Fk26pdNknGjyKvsINlZ2huYz55kq/aouDzwS1wboikTL3YfFXEbnmWhD4HiblROOpkO84CH5VPuOycmgISgp+L8CqZwE1sMSVFfM3K78UHkqNyyxWcnynLEYjcngYnUXMDMYEECiBerY/afMKg8p+WXJp8sZ0M5nrNk5O8TkYsLW6sThMlkeeAyX2EKMOtGtnmfz2M9o5Q8CVxjqZnuaQQQKlqvIH9RwGcCPrOLX91YCgw19pz/wtRZjwFFxk57r7XUd1zig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JVYY5rBWrJdmvFjoA0kKo1AP+VgtV3AcZaPa2AKU+U=;
 b=nWuUHTcZwihJl4XYJ7qmojq+U+v65iA/Rhgqew7emD84Ij1AXzwnTF4vKXgNRBmgOpRjIK9Biq2QuZMLzNUTN5vyAyKYKFeQekZFCbAJmX6Twd+zsKUiWOVKvSi7/TSOfn5WSGFxsrRDbY9cD0v7doyojVQIuk7EaTInQOfhFk1vv/ZxmUFW5GKJecLJIHjRsw1gzKp6eQS7gJtXWbqmAKWtQbCUMEgCO8xzZnJoOi9/pZb/OMY382Fjc/bQ0hjDnaVOOox6E9VcI9zunJJiFPzCNYyjBQeFnNCpferNOdKLzf0ywFhO5x1JbxtxeZha1NpCuEJA+78UyFtPfxgvMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW6PR12MB8833.namprd12.prod.outlook.com (2603:10b6:303:23f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Wed, 4 Mar
 2026 03:48:00 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 03:48:00 +0000
Message-ID: <282c94d3-f32c-4851-969f-61fc968de6a7@nvidia.com>
Date: Tue, 3 Mar 2026 19:47:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
 <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:a03:54::44) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW6PR12MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: a60f9423-380a-4ca0-497d-08de79a0d4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	NHKPA5myIpxlH6KxInyMXcJG7qCh27hrtLglZWXXgWNmuQ7g5QynNh+JaKqMehlZH4LnDiVjc08QtydtKDXuZMA5bvde7IKKQkkhkTagcE1ct/V7PfSuFpkUkUY1Xbivnw77zofZsQEbqBzLE0d0J0ix97mFZJDmepFt/Q8sg63satLYnx9XMtkbEPs45raZbjYOdtlJOEpEGHh48uBwgl4dYUyQosLCTPZl5qrUJWnn5/6Ra0bKQWo2ti80OC4CyG4g/EJozY/MlyAfjvPLMLIvmUlvZS+CX8HsCrlOXdEsm0RAF6rQAOvTCPfmlmnEPBBHbS+m+DAuRJPehkJYqWTQ94MMUgiN/xf2A/jNqAgcYrHjsSg3pcGOh4hd9GjWAWmNp/D+XcUMypc00wz6ff0WqYe6VfF4owDI+JywiyAoPYoFBn1IKR5q2/ioFvsdqPjW0Q9qgodjpwGVJIcqdsQ7Zz45z8Gvs2d8naaGvYn3/YC+B1Vy1bQZ/rAhkc1ADi15O96i3Zheb7uM8K1cSmPg9FSlCGu9TzYUBi0xDWqVV2wKmNenyUcmBuUn24hJEzP4duWuaw4G16kbY+PzK7XL0zibbu87BInVgC2Rr/frqRv0Yc2f9NqXKXSjlewYiBoTh5KTTZd4MC32mORXVEzodTdZvkdWhTR8gDSrzhVvk6u3loXta9fUiD9d2CgDAg58aYvXnnxMqtxv2DLG2zYRg/eSDONtVgb+4tMHkAQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkhPMDhPektjS3A3SXNiZk12VTV2V0lhSkNMcGJCeE11MC95T0lJUzBpcUJx?=
 =?utf-8?B?WGxMK1VOOU14L080Q1JmNlFLMjZGKzJTZUVwL1dFSnNqNVJSZHduOEhiOGx0?=
 =?utf-8?B?cFp1WTJHU2hiMUpIS2NHM3JmMUt0YzlGYVFWSkJnYTNOWkdkMzl1bVJuQWI5?=
 =?utf-8?B?Ny95UzcxR2NIU3dzTWRQRkY0NVViUFdFM3dIOWxHWFY4Wjl5NU15aTE2SkFS?=
 =?utf-8?B?ZktraFJZYWJlY2ltQUNha1RaUWVKeXNPOVlKTjgxUnhwWWdPVVlzSDYrWVRh?=
 =?utf-8?B?SjBvRkFUaUhhelZDcVRLNzdXNVBQYlcyeEkvMzdMVFVVTm1JSGRnUlR1TVF2?=
 =?utf-8?B?RzhGbEQ4bENCNTBMaXg2TG1CYWRBeUVvZm5tSXQ4NlBqbFp0R1J0RGxJTTBv?=
 =?utf-8?B?VjdrOGZBVXA1SUNDREFJNWFRODVXZXFrT2RmYXJxVk16Vzl5LzEvSjlRUmxP?=
 =?utf-8?B?anBsR0pEcGFWQlZpU2huV1JBZU1Jek9NalFzcDNJWXc0dDJ1LzdEQ2pvU2R1?=
 =?utf-8?B?RC9qdFhjUFpZRjJLbHlTREV6ajcyd1hvTmRPSDNqUGkrVVFlUGpBTmQybVZU?=
 =?utf-8?B?K29nMWdsK3NPNWd6a2IrNUx4VFJpZmdNdEkvMWZuWUdCQ1UvRkFjYzh2ZVFX?=
 =?utf-8?B?RlBYZWZjSEtTVlJuMVNQS3pDVDJaSVI3alBBNUR1K0RnS0F0UW44ODFhNEZt?=
 =?utf-8?B?TzVJa250ZnR1Yi8xd0QrcW9aYWZYeXJscCt2TXl6c3JYNWlRUGZ5RlFjRHdw?=
 =?utf-8?B?QkxraUIrZkIvcENzeWE1bnExU3h3QnNpVzdmSFpjTXpyekpXcWRzUy9xcjZN?=
 =?utf-8?B?ZlE2OEZsMTJUbEN5N25BZTFXQThxV3M4bUd3Y0dYSkMvNXhVRlh4VHJTSjdm?=
 =?utf-8?B?UmV2bGJoR2ZINzY4dzhlMWxhNDQ2SGJKRCtEbHU0eEttQmNiallBN3pKbVdR?=
 =?utf-8?B?Zkd4azJBSkQ3eXVaS0NvS2ZhZWJES3dKT2tVbzNaRm5LQVljbGgxSGVaSTZi?=
 =?utf-8?B?SE5DczIzRXprbWVQeFExZWhlakoxTGtaTWdqSjFkQkVieUdhMWJ0MmFkZXFp?=
 =?utf-8?B?SlNjelZTWTI5cXkzTC9NUmlYcllkNDdsOXVRbE50YlZSNDdOQVNwdzkrNEdV?=
 =?utf-8?B?NWpmQXBJQm9qTllnWC9UeXp2UzZ0TXdMSzZjVWdPV05oKzRkRVQvWTRYK0Zx?=
 =?utf-8?B?dzdXVDE0VTUzc1ljUEFlbVhyWWdqWWIzeTJCWjBXZVJJRlVwbXMrQ055djR1?=
 =?utf-8?B?Qnc2RnovMURYd2RXZ2xCbUVid2F1WlRkN3pSd05qTDBzcDltNTBCZmxLL2lC?=
 =?utf-8?B?VUs0eStYaVFkMktLMmExbmMwaWwzcGlESTFVTzAzYkVGSUJFM2luSVMweUlu?=
 =?utf-8?B?d2hLQlVKYWo1SldkMWtPYXA3Y0Q0ak9LV3lXamJSbWRuWXpsdWtEYzJuUlBO?=
 =?utf-8?B?MlhFUmUreHZYUFFnWEFUTDBGVWxkTmRHUmp2bDdza01HTU1FVVh1OTZSaGp4?=
 =?utf-8?B?Z3dicmxWWlgyei82UjZYWmJ6enBaTWRVR1ZNek5KWUlzQjFaUFdZOVMvWEp2?=
 =?utf-8?B?ZzZ0TkNUdWlJSmVhVEp2S1MrM1hRZHR5WU56ZTdMQUZyYzZmVkVwL0lFdUdu?=
 =?utf-8?B?eTlva0tubFByK0p6Y0VSdFp3aEFpd0RUUi9Scm1YZisyTGw5dVp3ajNwcUxB?=
 =?utf-8?B?TkVqUnJkZm9LTEZWRStKSGlQaCsyVVQvS2QwL2trcjEzWkNpOTRaa21mZUUr?=
 =?utf-8?B?MHFLZjBYRmIrSjJMQ2txdDBuNEI4RFlWa0NUZjA5N2RGQU9BUWxlZThMbjRF?=
 =?utf-8?B?K3BqVDZEVWRqaVFCUnZNVllSZEx1dXIrRW8wTklrekFiZWVIenN3V3MwdmUz?=
 =?utf-8?B?MGtCaWdiRjlQK1VMRVl6aTVZQ0JxVE5xOUc0dVR5OUJNT3lHcmphbjdCNWl5?=
 =?utf-8?B?VkFKVE5Mcy9TbjZ1elloVjl2anh2WVUzM1RXcjl6SmFSYk1SYkh1WGJzNlEy?=
 =?utf-8?B?bW1QR1NPN1lJdzNZR3pCNHAycTYrb1p3RDRMRm1TTG83M1JXV3ZBNWFneEQ5?=
 =?utf-8?B?QkllKzJsNmJVNTV3Ymw2MlF4d1FjVmdnRnJTY0ptcVo5YndWYWtIajVyYnhv?=
 =?utf-8?B?SDlsN0RiRWVKSDduaGN6NW9Sa2Nla3Qwd05CMTZDcG10VEtCVU93QWtLc1lG?=
 =?utf-8?B?SjFIY2hsd1hCT2dvWDl1Zm0vaEtHcDJ4NkJSMm5HRXdRbFpnbEl3SW82K3Bl?=
 =?utf-8?B?cFpKUW82dmR0ZHpFN2FuQTNnSkhKbXAwRXl3RjRXMk9Fa2h3NkJGQzY2ZVZM?=
 =?utf-8?B?aCtFKzNIN05Hb1FjR0twRnpVa1QwN0thVm8zZFZtRUJoaXQwbmVoZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a60f9423-380a-4ca0-497d-08de79a0d4c2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 03:48:00.6258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMg5Rk3+woWCYg198/o3WyK6ZITnfaUrj6C0HgsBbqtNjXUKdmABRTx3Srf7Z8PCTaQzxMT3XT1VVYURTSHSVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8833

On 2/23/26 6:20 AM, Danilo Krummrich wrote:
> On Mon Feb 23, 2026 at 3:16 PM CET, Gary Guo wrote:
>> On 2026-02-23 11:07, Danilo Krummrich wrote:
>>> On Sun Feb 22, 2026 at 8:04 PM CET, John Hubbard wrote:
>>>> On 2/21/26 11:46 PM, Gary Guo wrote:
>>>>> On 2026-02-21 02:09, John Hubbard wrote:
>>>>>> Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
>>>>>> equivalent of Alignable::align_up(). This uses inline_const to validate
>>>>>> the alignment at compile time with a clear error message.
>>>>>>
>>>> ...
>>>>
>>>>>> +#[inline(always)]
>>>>>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
>>>>>> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of two") };
>>>>>> +    match value.checked_add(ALIGN - 1) {
>>>>>> +        Some(v) => v & !(ALIGN - 1),
>>>>>> +        None => panic!("const_align_up: overflow"),
>>>>>
>>>>> This is wrong. Either this function is always used in const context, in which case
>>>>> you take `ALIGN` as normal function parameter and use `build_assert` and `build_error`,
>>>>> or this function can be called from runtime and you shouldn't have a panic call here.
>>>
>>> I think the most common case is that ALIGN is const, but value is not.
>>>
>>> What about keeping the function as is (with the panic() replaced with a Result)
>>> and also add
>>>
>>> 	#[inline(always)]
>>> 	pub const fn const_expect<T: Copy>(opt: Result<T>, &'static str) -> T {
>>> 	    match opt {
>>> 	        Ok(v) => v,
>>> 	        Err(_) => panic!(""),
>>> 	    }
>>> 	}
>>>
>>
>> We already have `Alignable::align_up` for non-const cases, so this would only be used
>> in const context and I don't see the need of having explicit const_expect?
> 
> Fair enough -- unfortunate we can't call this from const context.

OK, so after the dust settled on this discussion, I *think* we ended up
at this, which I have staged for an upcoming v6. Did I understand you both
correctly?

commit 1360a440272976df697140361537c5b697d602e0
Author: John Hubbard <jhubbard@nvidia.com>
Date:   Thu Feb 19 14:44:02 2026 -0800

    rust: ptr: add const_align_up()
    
    Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
    equivalent of Alignable::align_up(). This uses inline_const to validate
    the alignment at compile time with a clear error message.
    
    Overflow causes a panic, which becomes a compile-time error in const
    context. For runtime alignment with fallible overflow handling, callers
    should use Alignable::align_up() instead.
    
    Suggested-by: Danilo Krummrich <dakr@kernel.org>
    Suggested-by: Miguel Ojeda <ojeda@kernel.org>
    Signed-off-by: John Hubbard <jhubbard@nvidia.com>

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 5b6a382637fe..b8b0cb1e0b6b 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -225,3 +225,31 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
 }
 
 impl_alignable_uint!(u8, u16, u32, u64, usize);
+
+/// Aligns `value` up to `ALIGN` at compile time.
+///
+/// This is the const-compatible equivalent of [`Alignable::align_up`].
+/// `ALIGN` must be a power of two (enforced at compile time).
+///
+/// Panics on overflow, which becomes a compile-time error in const context.
+/// For runtime alignment with fallible overflow handling, use
+/// [`Alignable::align_up`] instead.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::ptr::const_align_up;
+/// use kernel::sizes::SZ_4K;
+///
+/// assert_eq!(const_align_up::<16>(0x4f), 0x50);
+/// assert_eq!(const_align_up::<16>(0x40), 0x40);
+/// assert_eq!(const_align_up::<SZ_4K>(1), SZ_4K);
+/// ```
+#[inline(always)]
+pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
+    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of two") };
+    match value.checked_add(ALIGN - 1) {
+        Some(v) => v & !(ALIGN - 1),
+        None => panic!("const_align_up: overflow"),
+    }
+}
<blueforge> linux-github (nova-core-blackwell-v6)$ 


thanks,
-- 
John Hubbard

