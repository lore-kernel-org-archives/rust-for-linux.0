Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010005.outbound.protection.outlook.com [52.101.193.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB1E3B4E8B;
	Mon, 31 Aug 2026 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160825; cv=fail; b=kCavbwbTU2nPRh12z7+uNCAaPVFLs7ZuOij2AjjGaGwjPc7srE5b+DAkmKhuG+4uVBrOYJQzIjTR4jklv0La8EsJxhUkLGPklhksl8LhRffriepQbuwwP+EldoNREGhHk/mPZ4Zq/rR7Xb+a+QCAb3AuI3lKyhRTgX94o4has1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160825; c=relaxed/simple;
	bh=+j7DXtW5s0U6x6sHmmL/fMMKrP5exvXgl8fvmXvFfUk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=a9mFaatDFf2auccxDnfmLqjWx5yJN4ESNhGMYLtCbJHbw3+snTRqARBmEhe9n9EkQIMY9cSEvzNeHPniCiwYtE7qP32y8sWIo9Sdz0CwAqRd75QigaUFQkx0hjUHPjPQx98yEbQNfgYVen2ND6RN7zJf+eXamEerp2yXJI56l4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M80CzBc3; arc=fail smtp.client-ip=52.101.193.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M80CzBc3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPUFSkhmo/73pu5P6lShcgLN5cad5QCVxFDo/pVLJfucCTtFVh2+3Gp6JpYbLX8sd4mst3W75lzPuCzKBNWRq2xLPRDrHgHP1J8xjX2Z7yFTSjdimKc1UWGB9zGOhjCQdtmxr+krtGkZ4qRC2XmYX0YEgIfShJxKbQHK35oN0ur2mOSAIKClF1BpTkyFjzKy/vm4/RYcN5jJ+px1nRPhSciswmalTmtWastpRptsiOVywI7vuQcpDhvUtMgCsKrnWKhf9cq1krS4oCAW3iAqXSdnkQ+QW4xHNwPbQNh4yZQywCZMBXkKpZM2IVXNgyveibmrUvt7llXkIJ9qNERMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTqc4aFOXbquPIUihoTIvXwNxWOe9RQ5K9XWkkk9U8w=;
 b=YJYyQ5+jgXOQg4IpPmZpUBYn2r3o7U3uyNaDo5NG+xDxC6SYDfklEuvkoT3+GBuUCNsLM6O74dng1ux25XKskB2Wt4R8RYeqPA/Mxn05yeYnXP91+InRUFYfdojU8NB3QKLUerQAJXonZZAUR1wH1XDa7EOz6uxkMiRfueQ84sIjKfBZDRyEmCZxT4bglN8E6Z/GcTF6HPYNVCDyoW8spuHGD5EfclpVOez+JMgLmo4nnRL8unVq5n1b4qSqZnAD4mStSK/6l8QJW5Yn5YPGlyxauqi6edVcrtTqc0egi0HYasXsdzgW8Q3FBxz8/Ay3eIaq2QFSiFDlsD/GrGbKaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTqc4aFOXbquPIUihoTIvXwNxWOe9RQ5K9XWkkk9U8w=;
 b=M80CzBc3lAwpzi2qpYuQ8oEEzkTeSmcnbrdIox/jAj4iUWWvRcA44VJb6ozOo8SCAnJK2GyhVZfqllZwIrKtsuiaEPBudHfqWjy+Uo1PdnYUdmaD6cTH7jytr762nMVg3/xsEf1IZS/toMl95JYIVCmRpw+1ZL5cE13s87Tqukrifvm+d14ODLwVcZ+CgrnvjBAcxoQR7i9z9A1YKOyp94U/yB9+jS7ctYtM6Oe9tqA7svjjazDfvcd+1/O9/+6T1PNaLWNZ98tGskCbtI4bb2Z/y028bBaFfCOPC+iwPZmQ+DWLTRwi2moYT/ed+uCUeTC/jHpKr5CoRXnxcXoFiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 IA1PR12MB7616.namprd12.prod.outlook.com (2603:10b6:208:427::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 07:20:20 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 07:20:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 16:20:13 +0900
Message-Id: <DL2Y3TBTXYA0.25GP7MGS9UN31@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: num: add `cv!` macro to create values from
 constant expressions
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Yury
 Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828-cv-v1-0-694a695ff17f@garyguo.net>
 <20260828-cv-v1-2-694a695ff17f@garyguo.net>
In-Reply-To: <20260828-cv-v1-2-694a695ff17f@garyguo.net>
X-ClientProxiedBy: PAYP264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11e::19) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|IA1PR12MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 25da4d49-5621-47f8-4d4a-08df07305029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|23010399003|3023799007|10067099003|4143699003|56012099006|5023799004|11063799006|921020|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CG1BMKtNoPrRBd+/k48uTVP7sAopX/cjSgAzzZvk+wUxp9pXcXQpNH5aHbkoWxDlmJ7jZm7x/OGpXBPsay4cJ5x48cteoisUsu5i5a52Vk6tlKwYY4fSH8Uzbav/WksW86J38fQXWxV4Sp2bhwIHfeyLHY/PgFpXi30bPBlI2+brxPzdoE1bF2Wua/F6GeGETpIvoC3ZJFUgOBuR/NeFPJxV5eRsuTpqo9IhJCYmGwTk4h42/lRk9wJn496ruglgWQfn9ZeI7oL8k0dUFu+cUJzxCaad2wsGZWDw5MfN0BalZFmF8Ta49jaL49biH2aqyTB0ktZDp6JHBvQSjH7qOl7pMSqAy8Y4ZM1hdYUvaZcJJSkibcnlChstwgssB4yZ72VcEYhR0MBbofz7pDiCoN5eBhGboY0q13Qlu/hx9lrEtSxwaAlgTzwIqtmGHlCnYM6v+ePwmC3KMuNdyGX/8BAgJxLmuqfVVp7DHmT1h6SUfkRR+j0xuam3LMWSz70kOfdve+YqoiWE9REf/cMvnw1LnWnfbp0Xx6ppXUWo7MXrycOIeEPNcFb/9LLn+w+p7wIKLJNDKET+AK2636FUSWom4NXZNToeKyu0UL7oRUWGbO5iFp0w8Ch93QGRDcLqxJM8+7rX3AtwtvxmD807umlJu0yKC+JATTwcDNJ60GGEB0QnOJAwNmvPgTRsEba2OJMWeGKAQpC+GpTEG0yeaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(23010399003)(3023799007)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(921020)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L282d2ZmUytlYXBNRnNUMk5Rbk9qcW9IbS9zK2xLbEVZbThlckRLYldRUmN4?=
 =?utf-8?B?WnByZWQ4SzExRnpYQUVXMXN4ZXE4c0pWZ2wxQTd1eVl5cVd4SG9HS1I5UEo0?=
 =?utf-8?B?MUozVHI0ZmJ3dVNsTkY0YldPQXZreG43T3dmVHNuMFQzWHNldVNRalZ2N1BD?=
 =?utf-8?B?aUp1OHd5ajJVRTBibW5HK00vZUZ2Q2JFMDlhT1RzNEoxd1lRU2ozZ1doYm1i?=
 =?utf-8?B?ZTdYM3laR2lXOVNobGJDL21mZHpIMSs5bWZSUnNuQmRGMG5lYnNDWWhnRk1p?=
 =?utf-8?B?VjVhQklicWErS3RrTGlnMUgzOTF3ckRIcHV6aTNwbXdJUzY4ZUR1VlpLTkdj?=
 =?utf-8?B?c3VWOXBDcTBQSHVjTkUwbERQUFVBeG5MSDdsMmZvc0xVMnBnN2RNWDN5QlFB?=
 =?utf-8?B?eUhobDQzTlFZWjZVQ0NtNTBreTZNd0l6RFlab1FUNTE2ZlBlRUNKbkRXTDc2?=
 =?utf-8?B?ZGY5OTJ1VVBQcGh6MHFTeXFWU0FXN1lzazhPR2REc0tsaWd4dGxFVmtzT1pJ?=
 =?utf-8?B?UVo1UGhNNGIvQVJTTG0rU0wra0ljbWJGaWVxSy93Snp4RE1ndFF2VWhXY3Bv?=
 =?utf-8?B?bGQxMlRIQld3aW5xM0swa2NuR3FxeGlFQnhkS1M0MUNPNXdnZ1NsN2d0V2g1?=
 =?utf-8?B?QkozL1B3b1NyeU1CNkdqVFBTdUV4M2ZrWWttMHJ6VUNHSStWMlZ1Nncrcmp2?=
 =?utf-8?B?TEFsbWVzTXM4dFdtc2l0UHk3cFg3cTA1c1BFb0w4cVpmcWRObmJGVVFuc1Nl?=
 =?utf-8?B?Y1d6RklEOVk1MWdUaWF6cDlCVTFueW9pNmdYQldHWUNOS2Y1ZVFjcnpSOXJq?=
 =?utf-8?B?MnBVbXdqMlVmNU5hQkhlTTYyT01PR0JlalVGVVY0aVZxNy9FeFA4eWFHWE5s?=
 =?utf-8?B?MkwzZHZOcWFKRDViQnovNzU5aW1XbTRYU01ETldWVTIrN0tkVmFPNWhDVUxy?=
 =?utf-8?B?eFJNazJLQnAzV2JjOUF0Ty9zOER5S2V0cGpwclpXRmVuMnB5a0FMRlhBUmc1?=
 =?utf-8?B?YVBwejJZSCtJYTVJVkxYcm1KbHdLRTFWQ2tQTjAzaTd0OGthSmZwdWxkVnRt?=
 =?utf-8?B?Q3R3SmVIbGFmWDFVMjcvNHhJeHk0SmxqRzF1aTVrVEk4REFzaDhpMGdDVllC?=
 =?utf-8?B?K1J0UnhZVER5aEE0RUZxUzF4ZXRpRnBnTTY5OUNsT2VCZDZXTUZleTVWOW1E?=
 =?utf-8?B?NVYyZkcvR3ZQQUx2RHp4d0VsTXRScHhkMjZsSU40NTZ1YTNlQm5UUGlsVUl6?=
 =?utf-8?B?Z2tUQlJrU21qMVp0cXVIWDNEUjBuNUxGVm1lRUYxanBYNmtVeSt3bCtEV0hE?=
 =?utf-8?B?dWtLdnJtYUh3TDB6NUFkSm1TUVFEUzF3ZVZZZmhuWWtOd2c3cjMrSkNibUJz?=
 =?utf-8?B?cTVkd0RpbFF0OUxleVNsWUlwYjNCR2lMMGdMWUJhVzFCVllXZGQ1MitOd3R6?=
 =?utf-8?B?cGtjY3JuODlIR3hOU1lPWExXc01SaE1YUjRQaDV4azJ5bjA1d3p2TFNlbjdP?=
 =?utf-8?B?VjdUYVZTNHZWWlAvdE9TYWxkZS81QXFXdVQxNTRZaDA5M08vYmw2L0hKMmti?=
 =?utf-8?B?K2RBd0xSVXBWbVNHWmo5aFVyWDBCTjc3ejBnWFp4N2U3OFlUMG00eUtkZFpQ?=
 =?utf-8?B?dDdzQkRkRTY0cTBhQ0V3YTRRdDhYaGhSVTVJMVhBRTE1N3VEVE5qNnNWcGVV?=
 =?utf-8?B?K3Z1TDBsNExjT0xiUGN6aGk5SmhHWWxpNjhSSU1HdXlmdnJzZFFZcitpNWY3?=
 =?utf-8?B?TE0wOG1UM3Q4NXRpb3R0UEF5RkVGZXE0WUpSKzc3aTkzay80RWdYSmU3S1p2?=
 =?utf-8?B?Smp6NjRocXoxYnRwSWdyNHhPaldUQy9zcHV3bTZ6TE1OeGlEUHhsajhnU0E0?=
 =?utf-8?B?b0IrbGF3V0FPcWEwaDc2bWNwR3lnNWFGblpYNzR4WXpnNnR3UlBPU20zNTA5?=
 =?utf-8?B?WWViaFNLTFN5VHpENXJWN1R1R3VrYUxMRncwOFdPdmhkNDViSWZLQy8vajR1?=
 =?utf-8?B?NmVmRzV6UXdUQURNVWcxaTJPOU9JWkpPSzNMU3JmQ3JhT3hSM2xMT2VvUTZw?=
 =?utf-8?B?OEVuY3ZNbmJFRmdvbFhSRS8xaTJKVEcrTFdnNEpnUWdtNW9RL3R4dW1rTWpl?=
 =?utf-8?B?VGx5RnQ4MVU5cjR5MXJRRU9ySURkcUZLbENsd3ZlbGVkUnhxQ2o2eGp2a1R1?=
 =?utf-8?B?M3dtQndyZWwxbytrWmhFUWdTT3dMeHJIQzgyZ3crRWlvK0tBM0F3blhTZURz?=
 =?utf-8?B?elVCMzNrVHFYMnRhbkhZb3dqb1N1T1RoTHMrOEN0Y0ZtSHJ1LzNjQUVUR3N4?=
 =?utf-8?B?enp4K29COExpR0lsc3J1cVB2YUpBeTVqSHBjVEk2WVJ5SW5abnVlcjlEVVlI?=
 =?utf-8?Q?icuUh+vVRi678WBpyL4A8LnHZBH1gI5EfKTgWT3nfPZnA?=
X-MS-Exchange-AntiSpam-MessageData-1: 2+GxHwrXg4YbZg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25da4d49-5621-47f8-4d4a-08df07305029
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 07:20:19.9279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKEg6pXZCJoLDHKeHKqW4lZQXJmMQdL/YdPuZkYFtNY0zEb0GzAc95XZfuYdytpbTqpTGKuhr9qRlqsVtVqjEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7616

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
> ---
> I used part of
> https://lore.kernel.org/rust-for-linux/20260827-chid-v8-3-bc74c77d0214@nv=
idia.com
> so I added Co-developed-by tags of Eliot. Eliot, please let me know if th=
is
> is okay.
> ---

Yes, co-developed-by/signed-off-by lgtm, no worries.

I had also considered using auto deref method resolution to solve this,
but I think it's a little overcomplicated, so I just posted the
associated const version instead. AFAICT this gives us the ability to
use const generic expressions on non-primitive types and type aliases of
primitive types, over associated const cv!. Currently there are no
(prospective) users for that ability.

I think also that this version is not a strict superset of the
functionality of the associated const based cv!. For example, associated
const cv! has better errors in some cases and can do things like this,
in the T: Trait case you noted (plus some edge cases around i128/u128
handling):

```fn zero<T: FromConst<0>>() -> T { cv!(0) }```

For the above reasons, plus what Alex mentioned, I prefer the simpler
associated const version for now, particularly since we could
transparently switch them later.

FWIW the version I was considering works a bit differently and uses a
functional list of types like (T, (List)) to define a method resolution
chain. It avoids needing the SFINAE like type probe machinery (I checked
and this approach works on your version too, which simplifies it). It
looks like this (adds Bounded::try_new_const), although I think the type
list idea is worse than yours with the wrapping type:

```
macro_rules! chain_of {
    () =3D> { () };
    ($h:ty $(, $r:ty)*) =3D> { ($h, chain_of!($($r),*)) };
}

pub type Chain =3D chain_of!(u8, u16, u32, u64, usize, i8, i16, i32, i64, i=
size);

pub struct Probe<T, L>(PhantomData<(T, L)>);

impl<T, L> Clone for Probe<T, L> {
    fn clone(&self) -> Self {
        *self
    }
}
impl<T, L> Copy for Probe<T, L> {}

impl<T, H, R> Deref for Probe<T, (H, R)> {
    type Target =3D Probe<T, R>;
    fn deref(&self) -> &Self::Target {
        build_error!("for candidate lookup only");
    }
}

impl<T> Deref for Probe<T, ()> {
    type Target =3D T;
    fn deref(&self) -> &T {
        build_error!("for candidate lookup only");
    }
}

#[diagnostic::on_unimplemented(message =3D "`{Self}` cannot be converted fr=
om a constant")]
pub trait FromConstProbe: Sized {}

pub const fn pin<T, L>(_: &Probe<T, L>, v: T) -> T {
    v
}

pub const fn probe_for<T: FromConstProbe>() -> Probe<T, Chain> {
    Probe(PhantomData)
}

impl<T> Probe<T, ()> {
    pub const fn __fc(self: &Probe<T, Chain>, _v: i128) -> T {
        panic!("`cvp!` cannot be used with generic types yet");
    }
}

macro_rules! impl_prims {
    () =3D> {};
    ($ty:ty $(, $rest:ty)*) =3D> {
        impl FromConstProbe for $ty {}

        impl Probe<$ty, chain_of!($ty $(, $rest)*)> {
            pub const fn __fc(self: Probe<$ty, Chain>, v: i128) -> $ty {
                assert!(
                    v >=3D <$ty>::MIN as i128 && v <=3D <$ty>::MAX as i128,
                    concat!("constant cannot be represented by `", stringif=
y!($ty), "`"),
                );

                v as $ty
            }
        }

        impl FromConstProbe for NonZero<$ty> {}

        impl Probe<NonZero<$ty>, chain_of!($ty $(, $rest)*)> {
            pub const fn __fc(self: Probe<NonZero<$ty>, Chain>, v: i128) ->=
 NonZero<$ty> {
                assert!(
                    v >=3D <$ty>::MIN as i128 && v <=3D <$ty>::MAX as i128,
                    concat!("constant cannot be represented by `", stringif=
y!($ty), "`"),
                );

                match NonZero::new(v as $ty) {
                    Some(x) =3D> x,
                    None =3D> panic!("constant is zero"),
                }
            }
        }

        impl<const N: u32> FromConstProbe for Bounded<$ty, N> {}

        impl<const N: u32> Probe<Bounded<$ty, N>, chain_of!($ty $(, $rest)*=
)> {
            pub const fn __fc(self: Probe<Bounded<$ty, N>, Chain>, v: i128)=
 -> Bounded<$ty, N> {
                assert!(
                    v >=3D <$ty>::MIN as i128 && v <=3D <$ty>::MAX as i128,
                    concat!("constant cannot be represented by `", stringif=
y!($ty), "`"),
                );

                match Bounded::<$ty, N>::try_new_const(v as $ty) {
                    Some(b) =3D> b,
                    None =3D> panic!("constant cannot be represented within=
 the given bits"),
                }
            }
        }

        impl_prims!($($rest),*);
    };
}
impl_prims!(u8, u16, u32, u64, usize, i8, i16, i32, i64, isize);

impl FromConstProbe for Alignment {}

impl Alignment {
    pub const fn __fc(self: Probe<Alignment, Chain>, v: i128) -> Alignment =
{
        assert!(
            v > 0 && v <=3D usize::MAX as i128,
            "constant cannot be represented as an `Alignment`",
        );

        match Alignment::new_checked(v as usize) {
            Some(a) =3D> a,
            None =3D> panic!("constant is not a power of two"),
        }
    }
}

#[macro_export]
#[doc(hidden)]
macro_rules! cvp {
    (@widen $v:expr) =3D> {{
        #[allow(
            unused_comparisons,
            unused_assignments,
            clippy::as_underscore,
            clippy::unnecessary_cast
        )]
        {
            let v =3D $v;
            let r =3D v as i128;
            let mut back =3D v;
            back =3D r as _;

            ::core::assert!(
                back =3D=3D v && (v < 0) =3D=3D (r < 0),
                "value cannot be losslessly widened to `i128`"
            );

            r
        }
    }};
    ($v:expr =3D> $ty:ty) =3D> {
        const { $crate::num::cvp::probe_for::<$ty>().__fc($crate::cvp!(@wid=
en $v)) }
    };
    ($v:expr) =3D> {
        const {
            let probe =3D $crate::num::cvp::probe_for();
            $crate::num::cvp::pin(&probe, probe.__fc($crate::cvp!(@widen $v=
)))
        }
    };
}
```
