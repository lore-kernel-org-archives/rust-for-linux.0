Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021097.outbound.protection.outlook.com [52.101.95.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC57449ECB;
	Fri, 28 Aug 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918672; cv=fail; b=Gv5jFUwh+q/M5MdMfUC16CbGPSZ+TURFSJBA08s+Nt9+lFa/ud1UDygiSXekPbL2q0IbJE4TUp6IHjbsnfsL8m/1J3jV+oOcKv+KkIP4KSnDzVGQDXrP0qlGH+pLPQ64ra+W9ydaFAQlzbsbP0wHDud+wqvYhoYYtfdUvL+1PxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918672; c=relaxed/simple;
	bh=haFgbbiVkVAN5ZdwZzEKpdKfoFI4xMUErXsVsG6HWl4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QzR+y/B/knWH3znRZQKd+2S/Cr/y11SbcGQg7A2WjLRU6P2A3Biyzuzqs8npd40Qx4oZ4Yu2DzfcmruIo1OSRGO7u1+VxGs1UResV8rvT20/f55g1CuQmiByc3h9Ck+dozSayN62+B24ng+oNeGacjSs8XJEimo1CitwlQJhqpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=r90ceIym; arc=fail smtp.client-ip=52.101.95.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="r90ceIym"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FN6jmmeANAxSjUAX721BiCJOn5+RVZyNcCBnE9KeW5WuQY3pn5XYEONN4KdLtcFnhGgS2A3ZZia0CP+BJRKULZLM8YvsJHJwUTce2FaJKE3pRPo7khCn3BZ/p7eOvr9pnoFubTt0jqkH4Lx0qOK79LizjZBgl15PLwAo6hH+Bym9zU0OKRrRhE6ToxWFPE/f+dwK0IKK6IaGTgNhPj4+Q4OOvKPl/ZFdsOIxQitok/HpB9an3qZsW9Ic1Vy/dcMXWycjEA6Wiz0kNuLM53RFWsg8LxsqclODqt354H/bWbo7SKtHdHGfLkOk9Oqc2W1qbLN40NZgMU+ktkWWzWQXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D/iviTkbVGOIJGNFzeNyJIcxZnyN02xIVyXQXvJOeo=;
 b=biK5d6fnqsCMYauUniep3ps5e7uqp5zaNXMwvMMRGVExFy+tcRVWURjrF7Hhyrph7yZfPs2yMA0Gg0lJvpLyxMYI7tAK6twrZ9dMjgCn3ar/KOU2Ohi31VMzMja/E1GG7o97Fma5vZLXvKEI5/UDcIVJP7L3e4ouOoRSFH89bmxyJkiMJgDKbRHpiV7J1rDxsLVolYxgIpqbDhGvwliM9DPYrMO121mNrBvnFeHVUY8EZeC+W+c9DyI0/g0ogBZrGsvIvfDmXqcH2irXiTd7PElHjQU6vODhC3QLBS7hGyuZ7yI0Xw9VCwdBfC6wMkvONI5RRRhujZmMTq47POK7fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2D/iviTkbVGOIJGNFzeNyJIcxZnyN02xIVyXQXvJOeo=;
 b=r90ceIymVW2TESwcMIwN1a4i+0fAUV9zIhyl6Dusmr3z06vcsv0LAtGJHVdl4FFDPMq1HMivm8VdQ8RpW8THQuyrQnNJpZSrjP5K4yGwZ95l1EtUeupHHJ6gStVFrWWj6qw+HrTOHdhUs3BcKWpJ+qHt6Gz2QK60oNhvaBoaLd4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by CW1P265MB9332.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:28d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Fri, 28 Aug
 2026 12:04:09 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 12:04:09 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 28 Aug 2026 13:03:56 +0100
Subject: [PATCH 2/2] rust: num: add `cv!` macro to create values from
 constant expressions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-cv-v1-2-694a695ff17f@garyguo.net>
References: <20260828-cv-v1-0-694a695ff17f@garyguo.net>
In-Reply-To: <20260828-cv-v1-0-694a695ff17f@garyguo.net>
To: Alexandre Courbot <acourbot@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787918647; l=13085;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=haFgbbiVkVAN5ZdwZzEKpdKfoFI4xMUErXsVsG6HWl4=;
 b=orktrAD2+4H1lBswkBOSW2rF3vK3C+WbwkTv5ReXJMPEuH90FXH+rusLFmwIfuCUyTKndJyMo
 IIRTVdyFFXqBPqy8S6C8lX4KQxQrOb0RVfb4Mh3JvOOmyxkAaqqfkF/
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO3P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::7) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|CW1P265MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c37b1f-3a5a-4e39-e3a0-08df04fc7745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|10070799003|921020|6133799003|10067099003|5023799004|22082099003|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	P1q9J9S6Th8lUs9PMydY9ecpbIVe+ufwRLVREoYB+CbpWDtzg8DuossXYsFBzuVBdJRyBdjDBpQfLYHYtqJJmfoPVBnSxk41nwyTxHvOAHMyIfTWybcWYZfE0axEHQAr5rFB/jvuTBWVHkX0yjNl+uDCxAj8cgG8KukwBAuIDbNOgabhVINHlZvTAnTp2Isj+/ROdNeBWFB4V0wUIBz/TCH9upaYLlxyBFpUrBu7ZYjYy71MOryQJTZdprsBEmy9UIfEUUGMVWnI0HrsAFStjajQx/nTfQMfz7zjWEezvHxQDhVu/HUw+drzKrLgqchmXN40ivH9bkj2LELqwL+w1pNyes4E912ZAL32cSjCFLvTThLcEX1C5PVtNUzx86hLUOlt6yhaiPbMqQa4+f6l/xWkpXP3ho8SiYZGpAoqLlBG/vVjwdaW62spm6JLLI17eEj5T7lebTsW9bp3t+xJ5tvE+GLrXm2W+xMtT8L4ZcLxEJLtaDlrpy9lUpGbJb+yVViYs7+nhGmFSq3LHC/S9gl0qSaYBsuAxOcVmROXgSiN3tZxknvJR0oF9MsGOd/1IRhMQo9MYWgj9S/UEOFNVDOIGf1wCKdOkYDo29BWqPQKCygsV2i06H6fxN4z7wk2ze2G9VM8wX3s+iRS+3Y/Hqt67e4Sf432ABPcX273nrRntNAjReI+tPiLXIbPbLNpK20WI6r1Pk7CIy4MS8DhFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(10070799003)(921020)(6133799003)(10067099003)(5023799004)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlVzWXZ6ZUs1ZU1pQk12TkhSUzJkSnJ0N3BLa0xiSmQ0bDdId2RXeVUrWVA1?=
 =?utf-8?B?eUppWS9PenRFVUFSUCtkYzB0S0ZCanhGb1dXRjJLK2VpeW8rYnJycjlUL0ly?=
 =?utf-8?B?b1dQaWl2amNnc0JFc1ZQVTVFOWtBRUE5RlNwVUJRajNyaVdrR0lhNDlTbk4z?=
 =?utf-8?B?NnM2ZDFaUUhmZThJOWo0YitPd2ZzNFdrazlIYWgzeFBmTXNTa2FqM0gvdi8x?=
 =?utf-8?B?Y0JsZUlxZ2JvSXFVOWNZeWl2WUxTUzhRd2ZNanVkdGNmMSt2TVY1Uk9kSjNM?=
 =?utf-8?B?cXBWSkhMbmZtQ20veVdoanUyaDRVRnBZVG0zZElsOXN1SjRNdlRkaUpiL0Zo?=
 =?utf-8?B?NkdLS05hb1o4MEJMbHg5aXkzZW9sNHBONlN6a05JdjB0SDV5QXRnS2tOVHlG?=
 =?utf-8?B?RHQ1ZVNaNWljaDBZYWxDV28wbkhtUDBnTlZZdiszZURvR1drMFk5N3NNSjRI?=
 =?utf-8?B?c2NUR1NkUVhuRzdDZFlSYXgzTUxzZjhkemxadTlNd0dpSEJ0R2dpeGdmR1NT?=
 =?utf-8?B?RHYvMUowRkovMVY1RWhPOTBHRzhkUXZ1eU5ZOURDQ0EzTkFxZkJNd3gxRFBN?=
 =?utf-8?B?SCtaQnlYTUN0dFhBaTZpWjZYRXF0SEQ0YmFkTWJaRGlBYlRLL3JHN1FIMGRJ?=
 =?utf-8?B?S2dmdTFjZXluMGN2T09XeDRKTmVVUmVjSjA1eTk4UmRhaG1POW5GcFhPTjVF?=
 =?utf-8?B?Y1Nwclo3NDc5SUVGbDZJNTBpcGR2Q0poampQUDg4bXVValphR0x4YzBVNmUv?=
 =?utf-8?B?Y3ljblhGUkJ4VXdVRTVUQ0ltU3RsUTdaNnNxZTdGS1owMUF2TXZlZWxuaU5i?=
 =?utf-8?B?YWFXUlR6cVZ1U1ZGc3lKMjBEMU4ybnMzazIwTWNLSTZVTGxJcUZ6eXNxUkJl?=
 =?utf-8?B?UllQTzdYOFp0N3ZwNmtld3F1WHlQZUI5a3BnWEV5SWI3dTdQYnlCamp0amRR?=
 =?utf-8?B?eVkrQWludjVSbkVFbEJiNXY2L29vUDFPQVI2UzhKTUEvSmdtalVzVmgrL3hH?=
 =?utf-8?B?L0NyREV5MFUrTDBENE0xMWwzYzdxMzg4NHVhTEJ6TDZRMFF5MTNXVVZGVi9j?=
 =?utf-8?B?VTk4QjhNa0xqOTdDVWNEeDBEeU5hT0JCc3RnWFUrb3pzVldPTGV5Z1B3NUpP?=
 =?utf-8?B?N0YxNE9OdDVsUW12UzhPL1F1U1JBclNsNWZ6WVJhOWJyeWhISUFNSDJ1REJp?=
 =?utf-8?B?U0hBTW9KMXdxVWp5VzNVWE8yL0V5TzF4dUFJbU16TFhIZ1ZlQkpSOSsrdTBo?=
 =?utf-8?B?Zk0xa01VNk1FK3N4cDdaUUtLUXpsV2s4bzhiOEpmOXpzTXlDVVorQTQ3a1RF?=
 =?utf-8?B?bUh5NUVrSWRld2ZQS2gwM3ZyRmMvMmMweXdNYnlybitCZng2bzBORGpNMU5N?=
 =?utf-8?B?NENXaU1LSm1WYmhUMXczeUs3SThPYXJuNkgySWRTWEdMSW5nUTJ4aXBmWUxD?=
 =?utf-8?B?VXRtb3BHR0ZaclVFTTFhWHNaYkVRVmNnUkpsRGtFM1R2UmUyb2xlZmx6ckw3?=
 =?utf-8?B?R0ZrY0tkQU94QW9WT0ptWllyVlRjNTN6c2RJQzZHYjlEL1BOL01tMjI2U0Rw?=
 =?utf-8?B?bWJoclpLeHJiOVZSdzdrbXA5d0pMQjU0ckgvdDBRM21EUlFsWUpoK2xSTW1K?=
 =?utf-8?B?ZkpHN0MxMHJtYVlGRUVtUVJmVVJCNFFLU21SQm1wam11L3g2dFFPZmZrY1hN?=
 =?utf-8?B?N1NZOFBJR1FFU0k3VU1ONTVXeXhxeWdyREVqTXRTMGJ5T2d3TkZLNEwvNmpZ?=
 =?utf-8?B?eldnY05NcXgvelZ4OGtFdU1HQWV3b1JmR240TDBleTZlL1VKak1wVmZidXNQ?=
 =?utf-8?B?TDFFTUU2Vmc1Q0swYjRyUTZKSllrMEtSOXorMm5tbGtmbkx0alNCQ1J4Znh2?=
 =?utf-8?B?Y3BwbHMyMHFRM1V5VnhwVlg4ckd4YmtrVUg0dndPRE9MMGVlS1F4bmdMZmRZ?=
 =?utf-8?B?UFJWclZsa1hmVjVML0ZmTTlDZEhFUFJ3YnZ4aXI4cU1UQmpLMkh5ajlBdFJM?=
 =?utf-8?B?K2JrZVF3UXFpSHZ5U0JTb3BoaW4rNHVEbkIxbXNCSHZDYlVyZ0lpQi91KzNt?=
 =?utf-8?B?MjlsbDVRY2VEenp2K1BnVGk3cDQ1SzdhUDF0U0FkYmZoWDNQd3plK3IvYXdT?=
 =?utf-8?B?b1ZwNjN1MEM3WFB0S3BuZ1l4dUlsYkJNTGE5d2ZLTUlhc290a2ZqK0x0T1Bw?=
 =?utf-8?B?L25tVExnS256UDBqbjNZZ2JVRjU3ejBoNEM3YXoxRGZoeVpacjZaSlR4WUVM?=
 =?utf-8?B?S2FVaWp1VW1TdE0raGdzNG5ZU3VYaDBocm5XMkxUSFRtV1RBTU54b0VNc1hR?=
 =?utf-8?B?cFlyNHlTNkpKeFNzaDZHejFHYnNZQ3VBaS9OZVUwclNTUDg5WlpQUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c37b1f-3a5a-4e39-e3a0-08df04fc7745
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 12:04:09.0406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GWCJzVNYmR50mcpD4E0b1AgTacaDPrKGtXXFzq0xgFqtlY6dyiFx3T9fJnhdNfSeoGli1xIO4/QDGv+2X+Epg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB9332

Currently, constructing a `NonZero` or `Bounded` from a constant is
verbose. The former would require `const { NonZero::new(...).unwrap() }`
and the latter require turbofish. Similarly, the `num::casts` exposes
methods that cast numbers using turbofish syntax, which is unergonomic and
unnecessarily causes the value to flow into the type system, which is very
restrictive without `generic_const_exprs`.

Implement a macro `cv!` (short for constant value) which converts a const
integer to types that implements `FromConst` trait and validate them during
const evaluation.

The usage is of form

    cv!(<expression>)

for inferred type and

    cv!(<expression> => <type>)

for explicit type specification.

As we do not have const trait implementation yet, dark magic is used. The
dark magic is documented in the code, but in essence it defines inherent
`__from_const` impls on types, which can be marked const, and rely on
Rust's method resolution algorithm to pick the correct function. Multiple
helpers are defined to aid type inference to work properly.

As a result, this allows construction of primitive integers, `NonZero`,
`Bounded`, `Alignment` using a single `cv!` macro. This macro does not have
`generic_const_exprs` restrictions (e.g. in a function with `const N: u32`
generic parameter, you may use `cv!(N + 1)`), it supports full type
inference and it has nice error messages in some common error scenario:

    error[E0080]: evaluation panicked: constant is zero
       --> example.rs:22:25
        |
     22 | const X: NonZero<u32> = cv!(0);
        |                         ^^^^^^ evaluation of `X::{constant#0}` failed inside this call

    error[E0277]: `kernel::page::Page` cannot be converted from constant
       --> example.rs:22:17
        |
     22 | const X: Page = cv!(0);
        |                 ^^^^^^ the trait `kernel::num::FromConst` is not implemented for `kernel::page::Page`

Of course, this trick is not full const trait impl. So the following code cannot work properly:

    fn generic<T: FromConst>() -> T {
        cv!(0)
    }

That said, useful error message is still produced in this context.

    error[E0080]: evaluation panicked: `cv!()` cannot be used with generic types yet
       --> example.rs:23:5
        |
     22 |     cv!(0)
        |     ^^^^^^ evaluation of `generic::<u32>::{constant#0}` failed inside this call

Co-developed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
I used part of
https://lore.kernel.org/rust-for-linux/20260827-chid-v8-3-bc74c77d0214@nvidia.com
so I added Co-developed-by tags of Eliot. Eliot, please let me know if this
is okay.
---
 rust/kernel/num.rs         | 209 ++++++++++++++++++++++++++++++++++++++++++++-
 rust/kernel/num/bounded.rs |  21 +++++
 rust/kernel/ptr.rs         |  21 ++++-
 3 files changed, 249 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
index dbe848e30efe..a38a86c3fc9f 100644
--- a/rust/kernel/num.rs
+++ b/rust/kernel/num.rs
@@ -2,7 +2,16 @@
 
 //! Additional numerical features for the kernel.
 
-use core::ops;
+use core::{
+    marker::PhantomData,
+    num::NonZero,
+    ops, //
+};
+
+use crate::{
+    build_assert::const_eval,
+    prelude::*, //
+};
 
 pub mod bounded;
 pub mod casts;
@@ -79,3 +88,201 @@ impl Integer for $type {
     i128: Signed,
     isize: Signed
 );
+
+/// Types that can be created from an integer constant expression validated during const evaluation.
+#[diagnostic::on_unimplemented(message = "`{Self}` cannot be converted from constant")]
+pub trait FromConst: Sized {
+    /// Create `Self` from constant `v`, fails the build if `v` is not valid for `Self`.
+    ///
+    /// This function must only be called during const evaluation.
+    ///
+    /// # Note
+    ///
+    /// This function is for documentation purpose only, showing what the trait would look like when
+    /// const trait implementation is available. Use [`cv!`] macro instead of calling this function.
+    #[cfg(doc)]
+    fn from_const(v: i128) -> Self {
+        build_error!("For documentation purpose only");
+    }
+}
+
+// Helper for type inference in the `cv!` macro.
+#[doc(hidden)]
+pub struct FromConstInferHelper<T>(PhantomData<T>);
+
+impl<T> FromConstInferHelper<T> {
+    #[expect(clippy::new_without_default)]
+    #[const_eval]
+    pub const fn new() -> Self
+    where
+        // This is on function and not on the impl block so the function always exist. Otherwise we
+        // can "function exists but trait was not satisfied" error instead of "trait not
+        // implemented" error.
+        T: FromConst,
+    {
+        Self(PhantomData)
+    }
+
+    // A helper to help type inference to let type inference know that the return type of
+    // `__from_const` is exactly `T`.
+    #[const_eval]
+    pub const fn infer(self) -> T {
+        panic!("For type inference only");
+    }
+
+    // Convert to the `FromConstMethod`, so `__from_const` can be called.
+    //
+    // We have to split helpers because once a type implements `Deref`, the type must be known when
+    // calling method on it because Rust needs to walk the deref chain. Thus, `infer` is on the
+    // `FromConstInferHelper` which does not implement `Deref`, while `__from_const` is on
+    // `FromConstMethod` which we can use deref to dispatch.
+    #[const_eval]
+    pub const fn method(self) -> FromConstMethod<T> {
+        FromConstMethod(PhantomData)
+    }
+}
+
+// Helper type that we define `__from_const` inherent method on, so they can be marked as const.
+#[doc(hidden)]
+pub struct FromConstMethod<T>(PhantomData<T>);
+
+impl<T> FromConstMethod<T> {
+    // A fallback method that is selected if no `__from_const` can be found on concrete types. This
+    // is needed to avoid "__from_const" doesn't exist error, and have a proper "trait not
+    // implemented" error instead.
+    //
+    // This is selected after concrete `__from_const` because it takes `&self` as receiver, and not
+    // `self`; auto-ref has lower priority in method resolution, so methods that take
+    // `FromConstMethod<T>` is selected first.
+    //
+    // This method may also be selected without accompanying "trait not implemented" error if the
+    // type implementing `FromConst` is generic (e.g. `cv!(foo => T)`) in a function with `T:
+    // FromConst` bound; so it also produce a proper error message for that scenario.
+    #[const_eval]
+    pub const fn __from_const(&self, _: i128) -> T {
+        panic!("`cv!()` cannot be used with generic types yet");
+    }
+}
+
+// Enable the use of `FromConstMethod<T>` as receiver type on `FromConstMethodWrap<T>`.
+impl<T> ops::Deref for FromConstMethod<T> {
+    type Target = FromConstMethodWrap<T>;
+
+    #[inline(always)]
+    fn deref(&self) -> &Self::Target {
+        build_error!("For receiver only");
+    }
+}
+
+// Helper type that we define inherent method on for foreign types.
+#[doc(hidden)]
+pub struct FromConstMethodWrap<T>(PhantomData<T>);
+
+// Enable the use of `FromConstMethod<T>` as receiver type on `T`.
+impl<T> ops::Deref for FromConstMethodWrap<T> {
+    type Target = T;
+
+    #[inline(always)]
+    fn deref(&self) -> &Self::Target {
+        build_error!("For receiver only");
+    }
+}
+
+macro_rules! impl_from_const_primitive {
+    ($($ty:ty)*) => {$(
+        impl FromConst for $ty {}
+
+        impl FromConstMethodWrap<$ty> {
+            #[const_eval]
+            pub const fn __from_const(self: FromConstMethod<$ty>, v: i128) -> $ty {
+                assert!(
+                     v >= <$ty>::MIN as i128 && v <= <$ty>::MAX as i128,
+                     concat!("constant cannot be represented by `", stringify!($ty), "`"),
+                );
+
+                v as $ty
+            }
+        }
+
+        impl FromConst for NonZero<$ty> {}
+
+        impl FromConstMethodWrap<NonZero<$ty>> {
+            #[const_eval]
+            pub const fn __from_const(
+                self: FromConstMethod<NonZero<$ty>>, v: i128
+            ) -> NonZero<$ty> {
+                assert!(
+                     v >= <$ty>::MIN as i128 && v <= <$ty>::MAX as i128,
+                     concat!("constant cannot be represented by `", stringify!($ty), "`"),
+                );
+
+                match NonZero::new(v as $ty) {
+                    Some(v) => v,
+                    None => panic!("constant is zero"),
+                }
+            }
+        }
+    )*};
+}
+
+impl_from_const_primitive!(
+    u8 u16 u32 u64 usize
+    i8 i16 i32 i64 isize
+);
+
+/// Creates a value from an integer constant expression, with validity checked at build time.
+///
+/// This works for any type that implements [`FromConst`]. If a target type is not specified, it is
+/// inferred from the context.
+///
+/// # Examples
+///
+/// ```
+/// use core::num::NonZero;
+/// use kernel::num::Bounded;
+/// use kernel::num::cv;
+/// use kernel::ptr::Alignment;
+///
+/// let v: NonZero<usize> = cv!(8);
+/// assert_eq!(v.get(), 8);
+///
+/// // Any integer constant expression works, not only literals.
+/// let m: NonZero<usize> = cv!(usize::MAX);
+/// assert_eq!(m.get(), usize::MAX);
+///
+/// let b: Bounded<u32, 4> = cv!(15);
+/// assert_eq!(b.get(), 15);
+///
+/// let a: Alignment = cv!(4096);
+/// assert_eq!(a.as_usize(), 4096);
+///
+/// // Explicit type specification.
+/// assert_eq!(cv!(1 => NonZero<u8>).get(), 1);
+/// ```
+#[macro_export]
+#[doc(hidden)]
+macro_rules! cv {
+    ($v:expr $(=> $ty:ty)?) => { const {
+        #[allow(unused_comparisons, unused_assignments, clippy::as_underscore)]
+        {
+            let v = $v;
+            let r = v as i128;
+            // Pin `back` to `v`'s type so `as _` casts back to the source type.
+            let mut back = v;
+            back = r as _;
+            ::core::assert!(
+                back == v && (v < 0) == (r < 0),
+                "value cannot be losslessly widened to `i128`"
+            );
+
+            let helper = $crate::num::FromConstInferHelper$(::<$ty>)?::new();
+            if false {
+                helper.infer()
+            } else {
+                helper.method().__from_const(r)
+            }
+        }
+    }};
+}
+#[doc(inline)]
+pub use cv;
diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index d192610a687d..2da4c5f8e799 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -13,6 +13,7 @@
 };
 
 use kernel::{
+    build_assert::const_eval,
     num::Integer,
     prelude::*, //
 };
@@ -261,7 +262,27 @@ pub const fn new<const VALUE: $type>() -> Self {
                 // `N` bits.
                 unsafe { Self::__new(VALUE) }
             }
+
+            #[doc(hidden)]
+            #[const_eval]
+            pub const fn __from_const(self: super::FromConstMethod<Self>, v: i128) -> Self {
+                assert!(
+                    v >= <$type>::MIN as i128 && v <= <$type>::MAX as i128,
+                    concat!("constant cannot be represented by `", stringify!($type), "`"),
+                );
+
+                assert!(
+                    fits_within!(v as $type, $type, N),
+                    "constant cannot be represented within given bits",
+                );
+
+                // SAFETY: the asserts above confirmed that `V` can be represented within `N`
+                // bits.
+                unsafe { Self::__new(v as $type) }
+            }
         }
+
+        impl<const N: u32> super::FromConst for Bounded<$type, N> {}
         )*
     };
 }
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 82acb531b17b..fec7ae71fe15 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -11,7 +11,10 @@
 };
 use core::num::NonZero;
 
-use crate::const_assert;
+use crate::{
+    build_assert::const_eval, //
+    prelude::*,
+};
 
 /// Type representing an alignment, which is always a power of two.
 ///
@@ -164,8 +167,24 @@ pub const fn mask(self) -> usize {
         // non-zero.
         !(self.as_usize() - 1)
     }
+
+    #[doc(hidden)]
+    #[const_eval]
+    pub const fn __from_const(self: crate::num::FromConstMethod<Self>, v: i128) -> Self {
+        assert!(
+            v >= 0 && v <= usize::MAX as i128,
+            "constant cannot be represented by `usize`"
+        );
+
+        match Alignment::new_checked(v as usize) {
+            Some(v) => v,
+            None => panic!("constant is not power of 2"),
+        }
+    }
 }
 
+impl crate::num::FromConst for Alignment {}
+
 /// Trait for items that can be aligned against an [`Alignment`].
 pub trait Alignable: Sized {
     /// Aligns `self` down to `alignment`.

-- 
2.54.0

