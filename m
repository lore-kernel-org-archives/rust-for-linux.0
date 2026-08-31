Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021074.outbound.protection.outlook.com [52.101.95.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7CE31F9A8;
	Mon, 31 Aug 2026 13:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181746; cv=fail; b=mcyRG4QfMtizYhMSvXEQ2FNN/ROlDiE8w3hpTK05H9ZPCvvPXPU18KwFLqpeNzBP1cHgo+WlA5Bzaj0icwS7Z/kIIwuhrFMMVwU1v5ecswZxJhuMTagwrq4W+9KPBeY4CfyChfYr+Ygrdmz2ggDcuhELZT5WKxmwsv/dvTQ8Uy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181746; c=relaxed/simple;
	bh=JZHY7wWBFb6f5qp87Gc51Phw7OKTxzAvQ03MxcLhEbU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qZO39/l19gYy3q36lO3EAjjIFjH9AIBwgpRxUEjUHPp9MhvM9Ip1M0qRRSgSAyScc10Zor/Pwmr0cGLsbabGNBA0zCD4HIdO3b/Oc+ghEEiyEkBzPKXqnPwl9A6CucLicDjpZHWvEneSlFTNaGMDLRce1LFnu7bGQL366xSNNyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=eQvXr7eY; arc=fail smtp.client-ip=52.101.95.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="eQvXr7eY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKvRpSgZkLTkQ7jJJorlMEU0yJn9eSF8d4HDMVgiYLZl68URC4+TRxbWCDldnwQQYszxIEMDbb29NVgo9uWEOSW0r5SgZiXOQx/hs8g96LtvYGzaOkMcubBI/yA0drrCB6ITQk9U9g8n+rGhnREKXs9MR9Ucqx2dYqLWhsljhmLpDpgz11YN3uNWS3gwHkTXg1zLoZUSNtIEmABw4BqaaUi4SEBvuOnr2wdgKNR4j9uy5/+qNAv02oCp0lLpEr/ZNS5ZWqyDcNSuSSvZK5VsMYWzZzoEly/iqxk2tfqt0Ju9918EnHaERlqJM7KgsjSMZPMBbKOr2bGkNe1BrEJuxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7zKRfO9FRcyC3laWo5HJ5ZEwYakbRMKRPd1Vf5AKJs=;
 b=bG/O0fxAk1swpFKExTu7d8vQBoAV2qqNSDccnEzlqvbT28HbrF3yst/TM2A4kTl2RecvWDz+nYS56g23xMd/EOQystHgbJod7bKBAh2LHgZdYtLai1QD0+Tv50ZChIulT0i+8Bb6GxD/7haehgrVK9F0dWHB962Z5loufrewWQyf5HKkKhrPt9GRIYzdE3JhsJqgnbjsv6ITo6AP5HZdPA7O07+ecdkr+TCkvbgN822QEySFggwI6i+6/cQ4qvSkqFYbhDZOEFn3kjInZGDKGx1Opxak43ZNXOhAomdOwP8JpfcwGTLgnzKx+XQCf8irIWK6V3+AaYFAFwUSHnBg5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7zKRfO9FRcyC3laWo5HJ5ZEwYakbRMKRPd1Vf5AKJs=;
 b=eQvXr7eYcjkagNPjxVC2+SW8Ltabp4bRya2saE7px3N1DhMXat+1g0DNBv0iXr59sdGHDQ8vzoKp6IPj4M/xSWfKg9iiuMib70IgzDx+lI/9VdlhtXRUNHj2qCrLr6K78m9czBJNdbhbjKJ2QhAtj+KHMk0rTcrRKrmJ3KVco5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB1793.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:49::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 13:09:01 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 13:09:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 14:09:00 +0100
Message-Id: <DL35IUVMYHSV.2V6I635PLQC9K@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: num: add `cv!` macro to create values from
 constant expressions
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20260828-cv-v1-0-694a695ff17f@garyguo.net>
 <20260828-cv-v1-2-694a695ff17f@garyguo.net>
 <DL2Y3TBTXYA0.25GP7MGS9UN31@nvidia.com>
In-Reply-To: <DL2Y3TBTXYA0.25GP7MGS9UN31@nvidia.com>
X-ClientProxiedBy: LO4P123CA0563.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::11) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB1793:EE_
X-MS-Office365-Filtering-Correlation-Id: f48cd6ff-6134-44f5-776a-08df07610651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|376014|10067099003|3023799007|5023799004|6133799003|4143699003|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	Zb8ymQQk9U3rwqi97XUa+59l4/FDHSNYkye32i74X5d+IyRdFnWMvXV+idkC/Cx7Gbdv/3UV5VZ3vMlDTcJVukT+v+wk3zqP3LBgV6pzMxFKYSjIy2UUgNMZ2q+2+GBpqFbPkG3E/B+9PO86e5zi4w8rhPoK+eBdy1dmyjxWazseZWj1lbhVegX3fPbH9mYyDI7uy4vXihd2GbUPc0U1NQyj/vGQH/XVSo5+ZjP9GrqBhMohSrdD/oYT9JH6HSq6DcsEBfwbb16fckNNGSIp7pPWZ81TGqjpy5fiaPLQr2OneD8pIf0hq3Hl3d80MoxorJCyEk6RPuRK/obdNJmoBFTYPQ4mfv20S9sGmxHsVCUY1vqBJni8KwqIM2h3frxapC+T2swZUbTz9Z2LXG0Tvp3RRJZUfWNQz4Z3YUhVdKTYG/NnS3Z7/2nqmBVrcqy6xpxEIO6kA8dzCpnPTw3JYD1/dzu/bdSP0ho7kqWXjxwxJt5jYdE++8KfGObpXPvx0gmorYijxzgFJkyODGZ5G5c8rAbpOHrUZGxH/H55skcVa4a/ZTqloCFa6k9/Dhz6BlUVOGekQx+sbJ8J1yrROQgM6m/Jng4t3siVTntMYqon0CZBdoJjX58OoT7AAYfDH8o76ERg7fZac8Pvppi5AaxoplyM2SF3Q3ePpF/ny2TW5SgRZEXCQiz6kRQnBL//MGJwVLhrHThtxpa4LKDB3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(376014)(10067099003)(3023799007)(5023799004)(6133799003)(4143699003)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZStjcFhSTXJpNHJVWEN4cmV3S0tmKy8zWHp3QnBuaDhSVnFGMDdQdGdEQUNk?=
 =?utf-8?B?cUtSdTRsWVFJdGNNVU1zVE45Y1hQOXl0NTBLUE9RNHZ3V0VpV1FlZEtDTm1o?=
 =?utf-8?B?ZVUwTDd6eDZYNENWWU9wbE9CVjR0cDR5RmkwYi9nYUhaOVpVajJzTENtdTlM?=
 =?utf-8?B?Y3haeEYvcExqdklTK08zVHVzUkpzN1FiT1NSUFhhTktCTXVNOTFiQXRUTlZG?=
 =?utf-8?B?TC9TN3VJS0UzVUFlaFU2KzVlbEt1Wi95YzA1V3JOc3ZrUkRrdnpEcW0zMkZr?=
 =?utf-8?B?Y2FHTEJJU0tmT0l5TWdpcVdyNTc1L0xWdnA5bjl6OHdJTDVWMjZzT1MxQkJ0?=
 =?utf-8?B?WldpZWRxaVorbHg5WFdTRGhvdUtvTURUcGpFcFBObks2VWtwL3l1OU1od3RQ?=
 =?utf-8?B?RkJzdW9MQWRpTHA4UFRMRW84NXRHQ2IzVVBCNHZ0UUdyM0FHaDYvRkJUVDhZ?=
 =?utf-8?B?Zm52enBkMENaWjVCL3FCaWRoYXpkQzljeHR2dW1iSlczVWt0NHN2Z1BZQzRt?=
 =?utf-8?B?d1BMN0ZDekJUSGdyUDF5cU0rditSL2w0dVQ0VDBBVHNKU2hxdnZyT0tUZHFq?=
 =?utf-8?B?TDkwQjgxRmNvamp5d0FyWnFJUzhRSE5ESFk5WnFWSmFIRWNSUDZYRkg4Qmln?=
 =?utf-8?B?L1lyUm1yUE03L2UvS0Exd0QxdmZVZjYrdk1wR3k2U042K3VJZklUYSszUGI5?=
 =?utf-8?B?TFJWcC8wNWtIVW14TnlKMzBYa09TNWpEVDJMblV3RnR2Mk5ReS8rVjllSHVE?=
 =?utf-8?B?K0ZvbkVCQStnU2xrelZ4a2tJUmpPTjd5Q2RNRXBrM05jM2JYR2FhRGhNa1gv?=
 =?utf-8?B?dW43ZW5nMk5NNWlpTjVYaUhKbmtTTWN3VDdmU0xTNWFqb1dFRUFDakdacndU?=
 =?utf-8?B?YmRkdmIxZ3hQbnorTzlLcXM3ZFNsTHpVTWE1Z3QyTit5S0EwMHFwZDR2SW1M?=
 =?utf-8?B?NW9kVnlvVGVmenMxYUNvUFRVY0hqSEFsaHFpbUZmOFB5VytOUTRmUVNBR2Nx?=
 =?utf-8?B?Smw5bGN1ZWwyNEJsRUl6cHJpeWxyZnN0eDQ2azEvZWp0cnJMcUNOL3cvKzRj?=
 =?utf-8?B?RXVnelM4VkZtazB6ZzRjdmh2Wmo1QmNQc0RLdCtsQ2Q2elR0WEpBUkNqcTZ2?=
 =?utf-8?B?TGl2am9FenFWODMwMXhNZlNsY3RhYVhvODRKQzlzekVIckE5bENOdXR3T0FS?=
 =?utf-8?B?YVNOa2VDWkI4SWxnMlFSVFRGOVJvTDFrSnFxVVQrMDVuTFA5MUdmTFcvWWZz?=
 =?utf-8?B?akF5bjJKRGZlVkF4K0d6ZDBQNjNveE00OXh1RGthb3pnZktGY0VkTnAreXdB?=
 =?utf-8?B?MjVVOHFYUXpLM0RvbWM0THgwRlM1bXN6TERyeFc4MEw1REVwbU9DTWJHWEEw?=
 =?utf-8?B?VXhtWG9kZzF2TGtSWStwazl1MGVUVW12ZGt4RlVaT25pUmQyOEpvaHF6Q3Yz?=
 =?utf-8?B?ZEJXM1RWSzZabVVYbFhwcHdOM21JS3BLMTNtQzFRUDNSK3d0ckMrdkNObFdx?=
 =?utf-8?B?Q3NTdnJPdGpMVHFrMkJTUTlrNW5LVm96b2M3cDBQNkVsY2JESnhKWEw2czA2?=
 =?utf-8?B?Y3F0di91ckNyUU5pd09taExMVjdoaXJYY0Vab1czd1phYjZqaTRUS3ZHRzQ3?=
 =?utf-8?B?b1RzSEEzMlp1NHRON0JleEF3Vm9FVHZYTGllZi9aZEs2WXBGL2VjWG9icUli?=
 =?utf-8?B?M3B4cTZTN1dUWWsyem5sbGRma3JYU294dE43MkpEOElSK25KYW9rZE5WL3ZL?=
 =?utf-8?B?Z2hIQ21XMzYyeGk1T1FaaEEzQ3hVZ08vRkppSmNuOGJ4UDVNOUdXRGRuTTlE?=
 =?utf-8?B?cE1tc2RadTFwKytURDVsT1UzRU0yUEF5UFJlT2pNVFBQQzUwZUZoR1Y0aERj?=
 =?utf-8?B?UmFpZ1gxTjIvMk5ZNzMrcXRsYmx1WkdEU2dLRkdVV25JdTNRY0gzV3lRVzlO?=
 =?utf-8?B?NWJiY3BQMk1lbXo2SmlyZ3dRNzByQ3N3QlNhZ2FHYk5ZZWJwTXVpOFcrbGZr?=
 =?utf-8?B?aFdGLzFHQ09uZ2Fld1ozOHFyNllMd2hZcTVUa3pHeldBVG1uYUFPVnRUbE1p?=
 =?utf-8?B?MDFlL0FUQ1pnS3IxdlN0clNXM1NXbmJUR2t4S2t6MUVqblhGNlZLZ3dQUjJL?=
 =?utf-8?B?cmEzQk5NTFAvekZWWFRKS1FISkc1cXhpUnY4RTlSTGF2U0pnNnpWcUVNY2h3?=
 =?utf-8?B?OXZ6UVRnYmNJS1JzcE9TdU5iK3FDZjh2QktnOUZzRUh3ajlLSnZ3bXZ3TGlT?=
 =?utf-8?B?czB0UzNJdjQ2S3NvV1dqbDVySEV0YW5wVjZkbmk4UUJaMlJTc1U4aDJGY0Yv?=
 =?utf-8?B?TVlnT2VBOUlqU0JrS3loMzNaQmxCMUtsa2hQbjE4cjlhTEhqV1JMdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f48cd6ff-6134-44f5-776a-08df07610651
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 13:09:01.0056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WK+5f4YXcCCQT4ay7RT103Wcc0Yxr0A4jUcZ7ThtXEDL4QzWlUMKfMqZYQLEc7iauSRy/g1/fOk2Ob41vKDgYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1793

On Mon Aug 31, 2026 at 8:20 AM BST, Eliot Courtney wrote:
> On Fri Aug 28, 2026 at 9:03 PM JST, Gary Guo wrote:
>> Currently, constructing a `NonZero` or `Bounded` from a constant is
>> verbose. The former would require `const { NonZero::new(...).unwrap() }`
>> and the latter require turbofish. Similarly, the `num::casts` exposes
>> methods that cast numbers using turbofish syntax, which is unergonomic a=
nd
>> unnecessarily causes the value to flow into the type system, which is ve=
ry
>> restrictive without `generic_const_exprs`.
>>
>> Implement a macro `cv!` (short for constant value) which converts a cons=
t
>> integer to types that implements `FromConst` trait and validate them dur=
ing
>> const evaluation.
>>
>> The usage is of form
>>
>>     cv!(<expression>)
>>
>> for inferred type and
>>
>>     cv!(<expression> =3D> <type>)
>>
>> for explicit type specification.
>>
>> As we do not have const trait implementation yet, dark magic is used. Th=
e
>> dark magic is documented in the code, but in essence it defines inherent
>> `__from_const` impls on types, which can be marked const, and rely on
>> Rust's method resolution algorithm to pick the correct function. Multipl=
e
>> helpers are defined to aid type inference to work properly.
>>
>> As a result, this allows construction of primitive integers, `NonZero`,
>> `Bounded`, `Alignment` using a single `cv!` macro. This macro does not h=
ave
>> `generic_const_exprs` restrictions (e.g. in a function with `const N: u3=
2`
>> generic parameter, you may use `cv!(N + 1)`), it supports full type
>> inference and it has nice error messages in some common error scenario:
>>
>>     error[E0080]: evaluation panicked: constant is zero
>>        --> example.rs:22:25
>>         |
>>      22 | const X: NonZero<u32> =3D cv!(0);
>>         |                         ^^^^^^ evaluation of `X::{constant#0}`=
 failed inside this call
>>
>>     error[E0277]: `kernel::page::Page` cannot be converted from constant
>>        --> example.rs:22:17
>>         |
>>      22 | const X: Page =3D cv!(0);
>>         |                 ^^^^^^ the trait `kernel::num::FromConst` is n=
ot implemented for `kernel::page::Page`
>>
>> Of course, this trick is not full const trait impl. So the following cod=
e cannot work properly:
>>
>>     fn generic<T: FromConst>() -> T {
>>         cv!(0)
>>     }
>>
>> That said, useful error message is still produced in this context.
>>
>>     error[E0080]: evaluation panicked: `cv!()` cannot be used with gener=
ic types yet
>>        --> example.rs:23:5
>>         |
>>      22 |     cv!(0)
>>         |     ^^^^^^ evaluation of `generic::<u32>::{constant#0}` failed=
 inside this call
>>
>> Co-developed-by: Eliot Courtney <ecourtney@nvidia.com>
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> ---
>> I used part of
>> https://lore.kernel.org/rust-for-linux/20260827-chid-v8-3-bc74c77d0214@n=
vidia.com
>> so I added Co-developed-by tags of Eliot. Eliot, please let me know if t=
his
>> is okay.
>> ---
>
> Yes, co-developed-by/signed-off-by lgtm, no worries.
>
> I had also considered using auto deref method resolution to solve this,
> but I think it's a little overcomplicated, so I just posted the
> associated const version instead. AFAICT this gives us the ability to
> use const generic expressions on non-primitive types and type aliases of
> primitive types, over associated const cv!. Currently there are no
> (prospective) users for that ability.
>
> I think also that this version is not a strict superset of the
> functionality of the associated const based cv!. For example, associated
> const cv! has better errors in some cases and can do things like this,
> in the T: Trait case you noted (plus some edge cases around i128/u128
> handling):
>
> ```fn zero<T: FromConst<0>>() -> T { cv!(0) }```

True, although I think we should also not encourage users doing this for no=
w, as
we don't want to make this signature of `FromConst` being the long term ver=
sion
and it'd be good if we can swap the impl at any time.

I do wonder if we should have the `FromConst` trait being aspirational cons=
t
trait so it has the signature (and documentation) that looks like what is i=
n
this series, and perhaps have the `FromConst<const N: i128>` being a hidden=
,
differently named trait, e.g. `FromConstImpl`. Might need some work to ensu=
re
diagnostics will stay good, though.

>
> For the above reasons, plus what Alex mentioned, I prefer the simpler
> associated const version for now, particularly since we could
> transparently switch them later.

Yes, I think it's better to have assoc const version for now, unless we got=
 a
user that actually need the extended capability of using it with const gene=
ric
expression, then we can make the switch. The good thing is that we know how=
 to
achieve it nicely now.

That said, there are a few tweaks in this version that improve diagnostics =
(e.g.
having explicit panic messages in places, diagnostics attributes) which mig=
ht
worth incorporating into your next version.=20

Best,
Gary
