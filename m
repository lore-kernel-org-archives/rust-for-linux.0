Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB6E1D4606;
	Sat, 29 Aug 2026 04:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787976335; cv=fail; b=hYL6wbbx17WUM1vHvWdwUv5AnO6KA40HB/RxmEdEy8HScryfcsyC/VMP5KzTS71FWpZrOshIs1q1ARezvRgfu0InVnhNtaOOPXsRIjOmszh+9Y5vBDDcE4Uoa6R7Y0x21RZnGvSNisY/Dk1nxARg4vV3fuxS78DcbBoN/3a6rDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787976335; c=relaxed/simple;
	bh=qt4EVc2E1AiFtAbNy3QkpZy+F8HAk++TuEa2RhGV8DE=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=G+vbY8UGV2SU/1PcichiikxB1ECjPE6T7kjsyayDUxJy3kVXEt6sKhtpd2m9gtqZAqkO5ReEiX2vIyj3KqhDErfZsJW0IWqtj6xtQGk5i5HvrE8SlhrvHi0xPQFeY7gnMj+kh/ghTIZfnXajdCd/jJg4MqGnq7Xcx0nDm3CReGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZqJdVztS; arc=fail smtp.client-ip=52.101.48.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZqJdVztS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKnF5LsvNyidCk4e2fRYTky14WnptEXZxaxI/4L6V9A67ldjrRfR9KTLnyfxzVebghYPhhntWlQ/d497wootTUgh04pyGN8hTaSORa2z6AYuTFIaSOjXTFeAiD1De2dLQYeRQHJEVJATSFGzWOJYsu2nVRBLRBWDYzt6LWenwC+4R+W3vn7pHPlFfkteXumMbw+mB0To9XplFZpQ3lwgkbNZv3+hJWvssd5roHmIyd07rbq+PuG2LoMmutiujRPFgdl00DhNBslRBN6ids37tue7z5G4gyH5DoC5od9+HzatanuzXGvAoB8ev6bXTN19+ss2rlIF7LqiBrYGXULMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zom4VVnpHuNeKZ4iuMP1i8XHyqiFKsys5F0awrSzhMo=;
 b=Xp6d3jQwRiMY7GtndRMNSXpd1NFles632lPArqdljpN5/yedIVXh62E64Oi+sEaIWAKk5tjP7nDO+c6uXjBwsaLsh0y6dOZ1DjCkHMPkmBlyBXOrEx9hZw9LB1oa/44KIQqigu6kSLQIkSI8LqxVi+UNnfwC8EN2mL2BeDeCnm6kZMdhxTQ+Exq5hNhG3z64twCDhWMXlREniXolCv/pt/GiLJwg1EVXyH3g4sFbj76PM6BI4uEaOy2MIh3bsgm4ZQ3FY3ZrbyMNalUv65CwIwvAor01j9Ty4dId8qd6wkxmPIeghMCcW41vuHGS2+I1PGA1jo9n8P+WUH6aQQ//mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zom4VVnpHuNeKZ4iuMP1i8XHyqiFKsys5F0awrSzhMo=;
 b=ZqJdVztSnVBGuzOglJOnI8CQ+fiik0QQEZ1Zs4S088kuR8l3pIaHoCCNGRvUbpyepHZ6vM1c+X2pwboD79TmmZ/J/YKwH2Y115Nbuy2VpkV6DR7H6QtsshJsnqWO7p4AOXqpq8m49q42arcOzGvJE2rzxXNplkeDPKUvGtcUgJp8+wNdbQe/t7dMWCg/XmcWPccn84dbsSgRF1n0laPfIYoGmpgkQELDmInqMYDB+C7N70z4UQZFo9Ai6DtGIIPDt9HYzSMrXG2nmCsWEJ02Fh2uJXV7jhKf/B/5+pldQzMZOo/CBMdiMxd8vAo3XH7wWLy1I3ztNgWYHrRpRd4T5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CYYPR12MB8704.namprd12.prod.outlook.com (2603:10b6:930:c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 04:05:31 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Sat, 29 Aug 2026
 04:05:31 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 29 Aug 2026 13:05:28 +0900
Message-Id: <DL14PLTK2FTE.12EZSVMOX01FA@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: num: add `cv!` macro to create values from
 constant expressions
Content-Transfer-Encoding: quoted-printable
References: <20260828-cv-v1-0-694a695ff17f@garyguo.net>
 <20260828-cv-v1-2-694a695ff17f@garyguo.net>
In-Reply-To: <20260828-cv-v1-2-694a695ff17f@garyguo.net>
X-ClientProxiedBy: TY4PR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::12) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CYYPR12MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c0a2e58-d0e2-4552-267b-08df0582c479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|10070799003|366016|22082099003|11063799006|18002099003|56012099006|4143699003|5023799004|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	DaREkUQM99Z746ToER/ZDpHoVDNVfYDMf9f1FtinRforiflfU3X+Kigmm0J3evqgwHK16OTbH2qd5zX8pYdk0ZCrOKDM4Dqzj4t49aV68v6p7YNx19nopJq3vZt2c8Xk2uQNukUNKnaBe4bpyKkG/ELWFPTrZBmPb5p7ymF9BbwkGJscr2nfECa9o/6DynxevYmZsGyNla8TSwcQsOjgt0KWdN9yZldre64SQOQfGdcS+YElOo00/TYRhCxeErAoBtKcyDaQFAO4OesOxEbIAZaJ0hTpdQ30BiSqisrkf62q8wycH9ZnOfeHDfYnskHHeNZodpJo6EB60obQ9ewmsGFgEDYiRO+bSARxmQWhwWkvegD4zxZmSzZXEvoB2P8BVJYytR96cQrKbokcKxu6gEVcnXmsAdsFvjIz82GWI21Oy2AvqlgUhJGoK8/BPUh/WI4Yk4DL3Q9Xwl0SC9UWh49FFCOboCa2DX1FrEook5gsrZDorR8N2GSSVwva3vj5Ale1re2wiKe44O4J17R/nYR72wp2NT2ZEesqfpGmEoHAWCafN/lugHcmK3P4H2RH+wgQ1Nxv8xUyEr31jY8hNHVQRSqIujp9jHJ53O7puFNtvLVfmw5PFbKjbggA+n539M8TXHv+ihs1Cs7eWmDPI5euu1xHDdsjJUPx8yM+BMM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(10070799003)(366016)(22082099003)(11063799006)(18002099003)(56012099006)(4143699003)(5023799004)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU9rTzRjNEpIdVhKNStYb1lucEIxVGNvYnB1NU5GTzNuMXJXWHlCWWJxUzhp?=
 =?utf-8?B?SnpTOXp0N0kySk9SSXFDeUpZK29tOEJBYkFMcGVFcjIzVndXVWFHRFVtc3lu?=
 =?utf-8?B?bzVxOXZpTXNGNkdibTBMOWJvWGFhUUJWSTVCNnJFWHFxRzVNcWY2YWY1U05E?=
 =?utf-8?B?QlpXYjhZS29JN0lzOG9CNTNtbkVZa0g5YmliKzlGTFZHVUlnQXJSWmVFZ3hV?=
 =?utf-8?B?R1Vuc3JHUFd1WnBMeFp2SXhDQ1NzU0E3ZmJpMGt4U0RoWTNWckpydEh5MXJR?=
 =?utf-8?B?VWFWWUI2QmRCcCtWdmhlVU5sWGdMeXp5SDNDQUpTSFVuUTFjejdPWFlaMyt5?=
 =?utf-8?B?TE9lRkd0cHNneVUvNHE5ZForaUlYbGh0SWdnNjdtS0tTZDhWRC9CNDB6ekZu?=
 =?utf-8?B?bWtwR0xCYk1VY2tMaVI0VXNhYWF3dmFac011L3dHeWZOcFV3UVpjVXlJZmVH?=
 =?utf-8?B?d1h1V2RFNHZRWExjZVU2dUtYZU5Zcy95S21uWTRzS2lQeFR3Um9BcUlWUTRx?=
 =?utf-8?B?c0ZHZzZOS1VhNG1oNE1WN1R5c0l0VVcrYlRHZFdJWVFadU9icUU2VVF3T0R0?=
 =?utf-8?B?dDh6Mm51K3JDVXU4Z29tQU1YUG9MdFdLQkF5TU5tOUhibHBMSmtBOTdPbjFP?=
 =?utf-8?B?L2MwNnFZVDhFeDBDSlhHekJQR3hqNU1QM1R3UEdVcGdRdldaenVkTFdIakI1?=
 =?utf-8?B?YUdmbXNOL0pkV0xhcjVuQnhpYzNvOG9aeUFIclZyM3BtYVhtZC9mV3I5dXhy?=
 =?utf-8?B?ZjlPZjlUMFdzNkx5TFA5K05RMFQvT0wzMGxlQjI2UHFyVkxHQlNzd2MyZ1kx?=
 =?utf-8?B?dTA1eEt2SXZrNjVEb3M0SVpsa21DUi9jb0pGeEdSRDI5YlQ4aCt1eUx6VkVF?=
 =?utf-8?B?UzhQV3Q0Sk9KZ3pUZEtBbWlLMUV6a1Y0R28rcjZ4RFArQTlxTm1XM0FVTnZp?=
 =?utf-8?B?Y2ZGNkRodTJZTVhyV1Z1a0xpaVdEWlJTVnBvUTFrQUxhU1k0UUIvS1dncy9X?=
 =?utf-8?B?Zzl1SnMyWUhLaW9ZU0JGckp1dWJmanVEb25CMi9nRFpJNGpVelpRaG9qSWxa?=
 =?utf-8?B?QlR6OVE3bWQya09oQ01TaUUrUEdVa1lPbFgxNTJ1M0VvWXJjbHNPNHdqTlBP?=
 =?utf-8?B?eUlUR0NYK1EyQkU0bHFFUm9tTndOamRVWGdQMFZNWDZST2VKQnFrNDRhNW1W?=
 =?utf-8?B?OC9iSjlQYWlwbS9yQWRYdGM5MnFTQ1NleWZNY2J3QXV4Q0E4eDhtbzNDMnhn?=
 =?utf-8?B?UUNtUlp6NlVIa2ZQUzk0WnFoU3ViZlpDNFlVWUxIbWw2K0JKaU9vVzUzYjdR?=
 =?utf-8?B?SURqZTVHdEpvNm53U1YvZldSdm0yRk9GZ0dtTndTb0ZVRGpsWjZrZU1PY01h?=
 =?utf-8?B?MWx6aDdCbEJ6L055S29yRi9qRWszMkR5U2ZxakhaN09md0NmMGhvZDRscmNo?=
 =?utf-8?B?ZFpQcVJnNHJzeGh1dE43WWFwVlRsNFY5U2RRMng4VGR5WWk2T0tpWXlBTDZT?=
 =?utf-8?B?ekFESkVjc0o4dkdLUk1pdUhLbVNibUdaa0owQUVFVHdMYmJrYzhoamYwbUhq?=
 =?utf-8?B?OWtnQk5wL3JIRVVxTVZ0VUwzVmxXa1JkVkdXVjloL0xmbStiV2d1Y2t0S2hj?=
 =?utf-8?B?c1oxeVEwSmhWUWcxS3N4Ti9HNEJVOTFLK1Y2dVFkSjhQalM4Y3VkMXNpT25O?=
 =?utf-8?B?WXZHOHp3cE1MUkFDWEVhZWZoMjQ0OWtPbjhibHBqU3h6WlNiMFd6NlU1YWly?=
 =?utf-8?B?ODBCbXJBYlRXUURmbUlnaUtFVlg5UmVmQ0s3MHZML3RqeHozM3piaW1adGlY?=
 =?utf-8?B?KzNzVm5iV2VoREI3emwwYlFPNnJSd0ZibkZzVzdxa2tJT2t0WFRDR0l0UGow?=
 =?utf-8?B?ekxzamdlUi9mMk5YNGplVHlYVFltNVVuOUJnYUVEUkhOdjZ0LzZ3K1AxSk5M?=
 =?utf-8?B?R0JacWZ1dk1yRk1UTWJYdkZLc1EzZUJCVlNETzNIaTJhUWF2RlZSdHdxWnF0?=
 =?utf-8?B?VEN2VEc1OVQyTndRUWtuNlJNQlJGZ1N0TFRTeUY2ZzE2ZWs5Y0Z4c2NZcE42?=
 =?utf-8?B?TTFsbU5PVGlWRG4yeTJSdEx2cXVKWk9UU3JVeEdISStFeHZYWVlBRmJEYnRS?=
 =?utf-8?B?YzhCWTlDY29CUXBWbDdtNVpEcktxTjRMWlE3WGVmVlFSWHNEWUQrRnBlMjIv?=
 =?utf-8?B?NW0rbEVJRHU5bWtZMVViZ3k4dGloOE14UXRrWWlNT0tqU0krRlVpT0QwTjEr?=
 =?utf-8?B?SEQ3dkZ3WXpUd05Ja2Fkb3lJQ3lxL0c4OWxKNnVEckJFeW9PcGwyN084QXMz?=
 =?utf-8?B?VWJrclZkTFVwUS85elR6b0YvdDI1d2tSbmV2MFJxb0lhVThTdVhScCtnUnRs?=
 =?utf-8?Q?zxZCXoZ19zUTmy8r1AW13M5iCA4qnxWWS03PuJQSUmrRN?=
X-MS-Exchange-AntiSpam-MessageData-1: AAFk1v9S1aAgpw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0a2e58-d0e2-4552-267b-08df0582c479
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 04:05:31.1433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y864IjYE+oKZyKSh10s8g919rrzOMvW0AYgRbKM8aCROkPgf1O1J8ZokFVOjv7BBss59olAgLaXGuKylkYxVVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8704

On Fri Aug 28, 2026 at 9:03 PM JST, Gary Guo wrote:
> Currently, constructing a `NonZero` or `Bounded` from a constant is
> verbose. The former would require `const { NonZero::new(...).unwrap() }`
> and the latter require turbofish. Similarly, the `num::casts` exposes
> methods that cast numbers using turbofish syntax, which is unergonomic an=
d
> unnecessarily causes the value to flow into the type system, which is ver=
y
> restrictive without `generic_const_exprs`.
>
> Implement a macro `cv!` (short for constant value) which converts a const
> integer to types that implements `FromConst` trait and validate them duri=
ng
> const evaluation.
>
> The usage is of form
>
>     cv!(<expression>)
>
> for inferred type and
>
>     cv!(<expression> =3D> <type>)
>
> for explicit type specification.
>
> As we do not have const trait implementation yet, dark magic is used. The
> dark magic is documented in the code, but in essence it defines inherent
> `__from_const` impls on types, which can be marked const, and rely on
> Rust's method resolution algorithm to pick the correct function. Multiple
> helpers are defined to aid type inference to work properly.
>
> As a result, this allows construction of primitive integers, `NonZero`,
> `Bounded`, `Alignment` using a single `cv!` macro. This macro does not ha=
ve
> `generic_const_exprs` restrictions (e.g. in a function with `const N: u32=
`
> generic parameter, you may use `cv!(N + 1)`), it supports full type
> inference and it has nice error messages in some common error scenario:
>
>     error[E0080]: evaluation panicked: constant is zero
>        --> example.rs:22:25
>         |
>      22 | const X: NonZero<u32> =3D cv!(0);
>         |                         ^^^^^^ evaluation of `X::{constant#0}` =
failed inside this call
>
>     error[E0277]: `kernel::page::Page` cannot be converted from constant
>        --> example.rs:22:17
>         |
>      22 | const X: Page =3D cv!(0);
>         |                 ^^^^^^ the trait `kernel::num::FromConst` is no=
t implemented for `kernel::page::Page`
>
> Of course, this trick is not full const trait impl. So the following code=
 cannot work properly:
>
>     fn generic<T: FromConst>() -> T {
>         cv!(0)
>     }
>
> That said, useful error message is still produced in this context.
>
>     error[E0080]: evaluation panicked: `cv!()` cannot be used with generi=
c types yet
>        --> example.rs:23:5
>         |
>      22 |     cv!(0)
>         |     ^^^^^^ evaluation of `generic::<u32>::{constant#0}` failed =
inside this call
>
> Co-developed-by: Eliot Courtney <ecourtney@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>

That's cool, and I like the inherent generality of it, but OTOH I am not
sure that invoking dark magic is warranted in a world where all current
in-tree users are covered by Eliot's version (with a few hacks, granted,
but these are not visible to callers - and this version also has quite a
few hacks of its own).

I think this is a case where I'd rather live with a small limitation for
a while until the language is capable of covering what we need natively.
Or at least, until the generalized version you mentioned in your reply
becomes kernel infrastructure and we can benefit from it here for free.

Since the public interface of both versions is identical, switching from
one mechanism to the other would be transparent anyway.

Eliot is driving the series so the call is his to make, but I think we
can make something available sooner (and we need it soon) if we start
with his solution.
