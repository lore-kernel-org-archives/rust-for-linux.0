Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020113.outbound.protection.outlook.com [52.101.195.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662F0389E05
	for <rust-for-linux@vger.kernel.org>; Sat,  9 May 2026 12:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778328667; cv=fail; b=mtog9wf6/UG9KKrPIYIa38j1xLva7/8iNVLZZ2pm80cMJSrYwV8xy4gJzGuNZtNe003/cX3Xz528I0dMGxOlFSgHArbiK7KMMRk26GIWGNFvSjKW9gzYnwboU7NgpfmVzw/8DqpZ7XJ5AWZxX4MFCrUbRE3CFQKhC6d1nK/rz+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778328667; c=relaxed/simple;
	bh=qODkHFhoQL8KdpnADEIezEA7ovGL9xoXZ9HWBuyBbWY=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=Q0NOWi7/fxyHHlU409ybLTxk3FwF2QXCGDs53k5eIHXuE2QpYo/gRVSAa8SALRfpADamwtSQ3+TGMfJSxXCN+24084QeGdj7BMfdlDyXxiBGh4wv6yYIBIplQLX1b10sx0/gmvL2hBCg4WdtYfFOSTXyxvqw54/RF1AEObOTdF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=H8aZjGxt; arc=fail smtp.client-ip=52.101.195.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="H8aZjGxt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8/2qjSDh7ejyCVsE8ai8U2nXdjUgGhk9Xl1dZ/+NbAbTrwFYIMYT73uEPCC0wy9YLB0/N4KMBwKy780+qBGJ5d8brgmlmSLvW+bI4D7PZrULIFYZ7WYPLPw7NuRMQPrTK63fP9GuFbLiH86onc2kcJCBrYhn9dTKyr3x3AGLVso343F6pD7E1kc+7EyDQMhezwHUUxRUyYLBImuuBUWXqZYg3wOsVVghNwsYFsc0OyHaz+jfWAChifuHM79ukhoFtYajCbvGnEBSn6+v+wJEJFMrnzRoTk8ZSkKzZ6Csm9lI/nHwKQzgiTFMLQguOmhUNc5QGP/zE5+XS8+vZMglQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qODkHFhoQL8KdpnADEIezEA7ovGL9xoXZ9HWBuyBbWY=;
 b=jRWLeUrxFxdVAtjsA93rHSXRXDES7etfIgOf4fFN2JH2HG4jtqYjF8JetG0LjcvylgHGzM66F0RQq5rWHllSDM+hOpnMs6towHZnXubhvypqYN7WopL9Z+7IoT8f1rHovEEJ1WJBMhp7mXXrjBGuGfBTNTxNuIRnt5tbWfs7wXyVuZJyrJDXReKTFODNZVZcCOIVmLuvjVUN+S0UJXxFDpe+280zNf/eC/nlPZZb2jyzgVulm0Oq7JeG01O825xZA3edty7L9sJyvJZ7er4kXQw1WI2Fiml4YGnEc/skw1cXutb/ncWR1X/uE2tOf4VIgadwgp22kvW0VTuF4Yk39Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qODkHFhoQL8KdpnADEIezEA7ovGL9xoXZ9HWBuyBbWY=;
 b=H8aZjGxtlKzqyhhjZb/CK2IooI9R77HpHqTtaN3uYgfmRiyyFx0sCkX58RjSHQegUETmAVs3qwXOS9ywRPQ1tOj7yIjWb0OCM5LQb1Nd0T8Fqf5Eitw95Z2+wXLabp0cYc1esQAYpY+JJiaQrJHFEMrQ1c5MwF8apoM9PyKKOC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO0P265MB6696.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Sat, 9 May
 2026 12:10:58 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9891.020; Sat, 9 May 2026
 12:10:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 09 May 2026 13:10:57 +0100
Message-Id: <DIE4WB0VE43Z.2ALSYOD50N5X7@garyguo.net>
Subject: Re: [PATCH] rust: time: add debug assertions for out-of-range input
 in fsleep()
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Sang-Heon Jeon"
 <ekffu200098@gmail.com>, <boqun@kernel.org>, <fujita.tomonori@gmail.com>,
 <frederic@kernel.org>, <lyude@redhat.com>, <tglx@kernel.org>,
 <anna-maria@linutronix.de>, <jstultz@google.com>, <sboyd@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <qBPUAToMpl5CvVd22lUrJOgsVSuqVYKsjEHpbs1UK-VTO-vN8UFOa35fFMsYOHoBuUp9HcP65ljAxmLQMcGS9w==@protonmail.internalid> <20260508173827.1123011-1-ekffu200098@gmail.com> <87a4u96m4c.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87a4u96m4c.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P265CA0162.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::20) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO0P265MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e53fb15-7ddd-416e-d58c-08deadc40756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|7416014|1800799024|22082099003|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	1cZxZSunn+vhWC7BRRjN/YoBJbJ387hGRVltSI3nSGqMhz6x/8VlwXXKfbLDpdal12gy7r9uKJxLk/hEec4FdgsC5gAyyt7Phsp+1rFBXaKEc9AR2SLOJRz9+0uXb3zbbB8mxLQks2BSw97FAHHaR5aMJLxbxg9hcJMi8JJan5PSokFlxZHfLHFOAj8C2X5hyvQ5Br2lgLyKM5lCT22WlVtQ/D1laZ4PgrMybCH96uWqA8/egZbwhy0CCCzJpWEC34weuq51lgB+mFOl8flM903tCh95G5I9G2tfqaUwZakEuFAWvrwWvEFsj5EpjK3CPLFnOH+Rtr0JVP1UTnMrlJF58GXVjm767abVZViSfPwMncfz7jrLPkhPnfR3+51m3q9h2ETclJS7Qxgg28Vx6twEJ+9iddEtjVizEHiA+HiGmDjycbWEQIvkAAgIw5HpFxhEcxZ7tc5bKfcGh7RHRhc80iln9pPBtjFzNNEidTtUfZuEnSJp2uFctmQOI9j+ZATedrVLGcbyHxSsHCw9cUOwKg/ZmxewyeaDwCCFx/Ko3K0vjITLnffF4vBk5ESpZHPMq6A1f3RHxUcNXn8uRM5USE6jCmZlTBJQLyxlRbiTuVKV3wZeMgzWHd3JISgle8OGAEMTx+T4adj589j+wTZnJCbur/nXMi3yXIc1N6Exxr6VK1Qk9RP6jH5X3v5AXJtvkHTR98MpnQ26zhnP0qif05VriKuzjKbmzDYkaGKUakjFnHibVWgUc2ztIA5N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(22082099003)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3g2SWI3TG5qUWI5bWczYWRmTndRVUFaY1VaaTNySzhNVGZiSU95S21FRWEw?=
 =?utf-8?B?U3I5NDl2ZW13RHBCOFQ1aUxXbzBtRkRQNlNWT1REU2c3dElwWUVXY1BZeXBz?=
 =?utf-8?B?U1dORlByYk9EckxhMytkanRPQnA1MWYyeHhmdTlEL0JCUmpJSEpyamdkM1Zi?=
 =?utf-8?B?aDB6dFNFeUE1L050dEFhb3BKT25BZVliV20vdFNpUVdTRi9NeWttQzBWaXNt?=
 =?utf-8?B?ZkxPZk9yTWcreEg5YTlEeE9KNnZHYWtERlNXY3lSQm9PTVBoaHVBNlNlVjBT?=
 =?utf-8?B?SmRMVGNCZ2hVejkrVE8zT3h1Tll0RzdXQ1NmKzNCdjRMcWFReWRCSWlHeEJu?=
 =?utf-8?B?NGp6R0VKT0dkNmN1RDh0OHVxZ2orWG9DQWVqMUtSZmh0ckVHeGl5NW90OFNv?=
 =?utf-8?B?eFBrMkJnbHBrVXdycG9YQXlmeWoyR1cySGYvd1ZsVGtUNE53N2ZhN3lxcS9h?=
 =?utf-8?B?RW1NUGdNbXAxbmRTUThBa2RDUStYSWc5b2VOWlpRSVZEOVBmVlZKak5HUE1E?=
 =?utf-8?B?N2F2WnVGN1R5TnRaYjc3YkpxWGwwdzhMVlMxSTBjRXpncmhhYmxkYzgza3R3?=
 =?utf-8?B?OHp2NHlqdFVFSDRKUXRrK2J1M0FVK2tTclg3cVZrenYyallCY0lqaEkwUWpX?=
 =?utf-8?B?V2JqOXRsYk5ONlJ3OExTZm9mcFNNYVR4RlkyeXBFMjdoeEtsNGJNcEt4eVlH?=
 =?utf-8?B?NnRRUDRBTTBtajM2b0hZTENRd2ZVRnBjKzQ0WTdOS2hMNm4zVjdCSTlGYjI2?=
 =?utf-8?B?ZmlLY1d3TXBKUDcrbzdUNXFISHZoZ0UyRkg0L2VvcnVxUXlZL1pNQ0ttMUk4?=
 =?utf-8?B?VGZZYklraHdhK2ZuSis1bDgrZ1RjYnZ4dEcwMTY0SFZTbkhCMHBYUWR5cTU1?=
 =?utf-8?B?blgxQW1EckRGTDgrSXR2V1dVUG1RRFBadThveUU1S2ZGTFVneDlqSktmUWFa?=
 =?utf-8?B?UjBGTmVvK1ovWHZUSmdmVldCa1NFOVpaR0lnRVZLODM3Qzdpb2VWZDRwbytn?=
 =?utf-8?B?dU9RYkRVeVZtcFFSM1BYYTR3M09Kdzl0LzNBdHZkOEZxVzBsK3dTdWpZdUY5?=
 =?utf-8?B?L3UvUG9ZNXBBbE4waW5kQjZOaUZMMFJVU0IyRnhQNE41eHUyUDdGbDhibld6?=
 =?utf-8?B?V0Ivdy84S2tpNlhMZmprTEYxTFZzdGF2ZWVEUWpVUkQ2TnU4eGdnNkRveFpQ?=
 =?utf-8?B?SDBYU1FSZnR4dmtQNlR4Mm53NjNJMDQ1UUFHL29TOUwrNmFBbWxhcmpUcUFi?=
 =?utf-8?B?d2FKRk9ZM1JqNkZGM29DWjhqYjg4Lyt4Zk5PQXNJbGlyQW5ZRFVKN0J6Nk8y?=
 =?utf-8?B?ei9RWEpZTG42NnZ5WHoyL0p1dFhyOXg5TGplSUwzdjJxT2ZiTk45M1gxM3pB?=
 =?utf-8?B?NDY2YlkzWERWQjZENnRydVpnQk9WT1ZySXFheTk2YWRoYTIwT3N0NmhHT0Rz?=
 =?utf-8?B?RHRLK2s2L1VtcUwwdHRhVUNFdGFlSisxRU1lZ3lETUVrZzN6dGdaZkt1N2JX?=
 =?utf-8?B?b2JTYjVXbzF2eWdtL1hXenduT2M3KzdtMWV3eE9ZOGhRQXV0VDNSSFhRRGUz?=
 =?utf-8?B?YktITnNBSmJBd0Y3bjZlL1k2U1QrdDdwRmVqaGZhZjJwSVlRUHdOWkZ1YS85?=
 =?utf-8?B?MVpKQXNuTnk2eGRiTXNrMnhRODVKUWxGK3hxT2FtVjJmVVMzc0kyZ1JENDlk?=
 =?utf-8?B?OERQaUYwMlA3K3N5V281OHF1SXJqY3lveXprZ1B0ZWNIblRJMUFVV2FaV1Jl?=
 =?utf-8?B?c3kzMXU3bUZ6RXZwQXdUdTdZRU9YeVgrenQ3TWViYnRTS1I4MnhXVlR5b28v?=
 =?utf-8?B?b2M2TWNUWUg5WlZXZC85a3dMMmNHYUgrUFRwNnU2T0M1MGY5ZXNqbk9wNjNl?=
 =?utf-8?B?MzA3V3ZpMC9wMXNMT1lDdFdHQnFaVFhqeVc2WWZVV1Q4bEVCREJReFRhRFdt?=
 =?utf-8?B?bVYySFczRGppbjFaYU1kbFgvaU9qUVhUZ0V3S0lBNEpJamVlbklSVm92eUZI?=
 =?utf-8?B?MnlqdVFmV1h3b2RUZExSNjZyaHJ6VTliZ0Nrd2RIMDJQdU1QYlpFTXdNa2dk?=
 =?utf-8?B?clp2YVRNUWt1Wld0UWFuRW0rdy9pOVZTaVZVZjg4ZkwyOVY4cldRYkRES2FT?=
 =?utf-8?B?Ry9GOUc5eitFb0dLY1ZnN2l1QkxMRys1VGh4RjhFQnV4Y3U0RWZHU0dXNEh6?=
 =?utf-8?B?R0xjTGdoRHd4b3AxV3pCWUtqWTBubHlNa3RyMGs5Uy9aL1QwQk00S0RVcmc1?=
 =?utf-8?B?WmhJZ0FPYitmMk9zNzBvUjhaeThrWjY4NnJtWTlmU2Nwa24rOU5HakNGUGg1?=
 =?utf-8?B?eUZQOFdBb0NFOTNlbFFjUlF3bjF2OXE5WWkweFRjRHhMVGZhZ3dSUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e53fb15-7ddd-416e-d58c-08deadc40756
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 12:10:58.2967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MLNWrIZhTlzZQ2sBZ85Q5E8AMFyUtY1+Ek8lKHVpwnyG+kMw4cePB+o+0YRoTwyO2jMlBUlq5Xb6HJCJNG+Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6696

On Sat May 9, 2026 at 9:08 AM BST, Andreas Hindborg wrote:
> "Sang-Heon Jeon" <ekffu200098@gmail.com> writes:
>
>> fsleep() documents out-of-range input as a bug but does not check
>> it, unlike udelay(). Add `debug_assert!` calls to catch it in
>> debug builds.
>>
>> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
>> ---
>> Hello,
>>
>> I found this small inconsistency while reading the code. The same
>> check was applied to udelay() [1] but does not seem to have been
>> extended to fsleep(). Please let me know if I have misunderstood
>> anything.
>>
>> [1] https://lore.kernel.org/all/20251103112958.2961517-2-fujita.tomonori=
@gmail.com
>>
>> Best Regards,
>> Sang-Heon Jeon
>
> Looks good to me. Could you add the warn_once and remove the todo as
> well? And add the warn_once to udelay as well, so both functions have
> same shape.

If `warn_once` is added then the debug assert would be unnecessary.

Best,
Gary
