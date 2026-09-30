Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021115.outbound.protection.outlook.com [52.101.100.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91723519DFD;
	Wed, 30 Sep 2026 18:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791272; cv=fail; b=TS75/GnWjRDQV/vw/FFpEfJjnArpV1vfFCp3UM/JAbGUZUFJI8xdv/HAoSxmo+fYNTgEmYZEhclwGteJlpg377ff7jNHL+FgYXscvCBGCYDGjRhhJbtPuxD032B4TM8lOxk82kcse0jnQ1lPZ7MsvjfDP81mIqN1vvsxfSgtYYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791272; c=relaxed/simple;
	bh=q0Z/qUtS4KXfaR8tICW7TwRgOOh+Qc7ke4YpwYYfQMc=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=o6KOrubqQa32dni9QM6zTgsZ7/rZ5BY32f1BfVzinTc6g3E3BoLTWSb0rB4PW3PejRDvYny3TcjHmXZVHuwGiFIEjn2x/LH/HGtjSJlMWFRv85j6bUGQq822VOA6xUDkE4zDZ64RmpXp8H3S7XNlP2dr12wNAsUzk6CgIwOQ9Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Cjrr6mHt; arc=fail smtp.client-ip=52.101.100.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Cjrr6mHt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjVsZ9uhro7i6D6gkCfHBr/g/Gdew8AhcETE+/qHsjDjaDgCANpv04hpbutgaJ5cTdBmM9qRufXPk4PXcu6DdhgBt7UbspGIx/lztqFt4CrvvMPMZAbpPPagLdCSLRC3wuadxAxO77+aAU2dsO6AQP8t2rdxlD9oylSOVFUT8YIgk0qZZC0pmM/LocGfcYI2vX2jnVTBq1G2VC5Ct90TM8+BX48a9ZsRbOqYrsj3aAnncQcof9btskdJFXQQPFJjykU/JXJFNFJtTLsoG5OREZ2jgFIN7DrYi5HVE1vbidfywhqtUirij0zqxho7tvDTMA1CxEOglZ6TnnYEsSr7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7txI4gpMndAKtNahJTjo0UrmyZYp1pye+hxJ+mR83f0=;
 b=W1f65fCfuudLTtvganpgqqfySV8fSnACVgIyZ3zClsKk+Qw4jGaHhZMR4FYOamc7evBDs6oOGn9LzLeCz7bBX0UqTBssDOJLzhtO63t5fWgrdxcLtdqiUaB+Cy6fIisP2l43Ea4A97kXlZj2pgsLP0Ls7EoLwC2lRmR0U3iXl0V1nNZ6Yna2pvfgK6FY7fB1QyjiAz6ql98V1+rCQyXEDXfvzK+k66SrHpvJg39ZZkvY4sEf+I6bWNOHyeUyTYF4xFMe19qvSmtmTARuTKwqSX+tMCukUTAqWxesZXXGwKGPGkFE9dtasyUPM1ACoxdNdX5c31OiBc74rqPAxtuGEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7txI4gpMndAKtNahJTjo0UrmyZYp1pye+hxJ+mR83f0=;
 b=Cjrr6mHt9PaWSVP4EBvA2FH99fNN/nprFgkG8gNLFYHA8HwXutV5XYucg1hUjz97vxD8IjDAQEqpE7XBtBFCesmyK0awfsOwTUw6pUrUQCymZXk8UPERg6UekCLdk4iEJER+yiXzZLDkRr6TK7WQfWvfg3ydWpfuf0pl77coQ7s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB6344.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 18:01:06 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 18:01:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 19:01:05 +0100
Message-Id: <DLSUIU2NE5CT.ICPNRMGFATCB@garyguo.net>
Subject: Re: [PATCH] rust: proc-macro2: enable `proc_macro_span` feature
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260921115708.4009754-1-gary@kernel.org>
In-Reply-To: <20260921115708.4009754-1-gary@kernel.org>
X-ClientProxiedBy: LO6P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 9acf402d-5a6e-4ad3-2704-08df1f1ccc5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|23010399003|1800799024|10067099003|921020|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	D4nn2kCGLN8ywmFjdY2zGhDsDnqC/f2fEnlsVpRwS6Og5Rjqu1LL+BNN0cZXScMpIT+RCojGvJgArzqmmGn8UVQafwnlhognOaMTNfVKoKioIWAkVQEZyDCKktn4e4rx8cNcCnqJSyXwW5HM/S7Nj50rnryXxy/so2/SLE3TrVTO4MaOeV6VDW7IKMyOl+XfUpRDCYJzVUMlQG1xh6wzO/suKZXNvXgamMCYk2g44BRgqXfHNdbKYDQEKmb856MSClwgMz4UfEAQMhvRMPMQZB3MOX+AI/rpGFgX9deUTF/FvLnq2Y3HPKPSA5mEHTo1MpUua0lKCJYVfIVSt5d7fVYzf2MCV32rJdBkzW14CJ2crIjRH6XEhIR9mpTICjknlaqdxsTjlGBvmI0cHvPI8DBCE8jh6khJ7QpK1V2GRY9rqGf9QGwqwHXHrfWVa4iZ2ewFlqjVxkHjHjzvHpxHKTmQ3TwHtM2LUag2Y4eJ3KbWIeKJPDyVkIO5rfqlZbWnLNC87ltk+adqARKgbGeWWQT5VXj4Je/opiapxo7/SzWgwUvkG09zqcz4JoP2hCKljIWSSwUWKDWKqBlg5W4KakVhRB6a+7Py0b4M8QOi78QqU1G4NYueUsupP/Q1M0439KyXSbAfbtjd7Xr/gjfWjvZE5k64EdrArD4YC6ouJseevsBGLLOynbzSligUgZjepoaK2tZDTJmMZYs3fxDGAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(23010399003)(1800799024)(10067099003)(921020)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3lqNWpFeDROY1piVFdIT0JkQnZxT05NdTU5MWQ5OE9VWlByTzJYLzlBZVZY?=
 =?utf-8?B?NEJCYm1Oby9hZ283ZXNnR3FwOTIzM29GaW83eTk4YmZ1elFBS015bkJCMmcz?=
 =?utf-8?B?TE1aT0N2V3luOThzcDh2YzdhTVA3NVFrUkVtMnJ6N2JUbmw3V21DTEpEbldw?=
 =?utf-8?B?TUd4SFVFdnBHbHE0V0d5a2Z0V0FIM3JDR0hZWjY2cG1GVVUwVW03Q0ZXQUth?=
 =?utf-8?B?akttaFRPN2ZlSVhCdHMydGY3SHJrVHVSUDNaY1VacmZvei9SNDJJUmlwdkVl?=
 =?utf-8?B?UGJpZ0pRMFBaUGM0WG1JdmlHdjVLOXJkR3RsQnd0clptTm5WWGRUME9IcVhX?=
 =?utf-8?B?Ritoa1hLdDdWcDdiRU9RdVJqYWFZZDhrY0pqQlJoS3JTNHVQelRSeWgxUml0?=
 =?utf-8?B?WEErdTNGZmdGcGZEeUNhbFpRMTV1dm1ObHRxdlZxSGx5ckNGcUNTOUZkSjJq?=
 =?utf-8?B?d1pqR0Y5QW1Dck5VcVpoeVlxYVhNRWIyUDd2OFpScUlib1ZLczZnTVJ5b3JT?=
 =?utf-8?B?MzlDOGJaU1ZKVHhtZ0ExbzlDNnIvKzBMcndvNFp4dlVQbzY4V2UzMFI5K0tq?=
 =?utf-8?B?V3RNUGJvb2RPcTVXci9tekM1VXV1SGRtOWZIaTg1RjhOaWxrNXh5aTVhVzg3?=
 =?utf-8?B?SjZzRWdTV243OStUYUxqbWt2RDhUU2pzWVZJRjlRbVNlQXRWM0ZQRGNyTWlS?=
 =?utf-8?B?dzJBM1dPeGg5U0tUZ2dtVnYxbGUzUStZT1d0OUxCUDRtb1U5dUljeG41a1cy?=
 =?utf-8?B?eitLRVVrYnNmeGRUbHE5UDk2V0tYSE10NFVMUVdNRlhPZ3lWSnJPbWJaUWdv?=
 =?utf-8?B?NTllQ1FaTzUxQ2VyOG5TdktzRzlEMVNEWnViQVh6YWtLTklnaUNDODMrbG8r?=
 =?utf-8?B?Uy9TejlyN1M4M044NUhGams3ejU0eFVLTEQ3NFROMzVuZk4yZ3NldGV0ZHhl?=
 =?utf-8?B?R0pSbjZkaCtic3NmWFlMTHY1b1FnTnlCWTBlQVllblppSDFCZWpJaFdKK3Rk?=
 =?utf-8?B?RUxNU3pRNjZnaVg4RkNOQkVqTS9ydHdIeW9vR3FZOFc1NXdzdmJFbFVSd0dp?=
 =?utf-8?B?Zzd2blhGMFZma0ovNitObXgyZGhXZFdCekhLNllVUDloYUNlVDltZVZDUis3?=
 =?utf-8?B?YVpNM3k0V1ZwWHlhNVFqZFhaYVNYUjJBUjVpZUhrMmp2SDF6UWlNVkIwQ0xT?=
 =?utf-8?B?bit3eU55dzVDNmczQndqN3FCdEIwYmtKMWNOd3Z1am5VSVhNeEg0ZjRUamp2?=
 =?utf-8?B?L1YxRUMrRi90SHNPTi9BODk4cXFSR0NPaTAyWTdYRUtBSnJGTWU3MCtWQXRr?=
 =?utf-8?B?WXNmTFJ0YWw4VmtYdXN5Ym9kNVpqVlJYTm54ZWFhdXJHVkowd0hnbGtDcW1W?=
 =?utf-8?B?ZWs1NnBGeWs1emFjY0t6NHkxQUh3SVY4bWNPUmRrVFZROElRWGsrZm1WbFpL?=
 =?utf-8?B?YWUwM2RDWXJWMGNnVXVsTjVGRFQrV2FIUmZocXpBV2Z5eFJkK1krWHJ3djQr?=
 =?utf-8?B?ZHZJTGwwOGhFK04wRXV1OUZ5UUV6SHNiRDBkNEJnTFpmRThXa1FoVmp4Vlp5?=
 =?utf-8?B?OWRmbjdha0tzL0pGMUZRZXk5YWZ5dnUrQ2lGZVNyellCYmc4ZlNyelFZM3FJ?=
 =?utf-8?B?aGVrK2pQV0dmRnA4SkY0S1RpNkRMWFRvZkdEd2NiM1JlSy9FS2RLZlduQ214?=
 =?utf-8?B?UVpHRzIvSzZPUDZ6YnNuS3pCUXI5WUxmUzdxMk8zVDVFdjA4L05RZzZwZmM5?=
 =?utf-8?B?aU5rWmRUSkhHRHhpNEFGR1lFZ08rby84K28vbzhCcnZUVXZlalE3RVR1M2dk?=
 =?utf-8?B?WDlTUUNKWk9nam8xcVhNcllhYXhKMVVadzAxaFgwOU91N1pINmZwdk5qa0c1?=
 =?utf-8?B?STFFLzBGZUM1YXdRMUhDYnVhR3NEV2FIbTVlNDA0akVhMVRJTnZGbmhFWU1V?=
 =?utf-8?B?aXBGcEkvWTk0VnFmOXJnbE40MnVZUENWcHZDcWQxNEJFS1J4Zkc3ZTlyRm9F?=
 =?utf-8?B?WlZFOEFEdjl1N215eU5odWNBb0tMMThpRURPSCtvdmF5ZFNiaWNFMXd6OUd3?=
 =?utf-8?B?S3lNdUN4dXNBR0xTdk9UbGZYQnpINC9VcW1ySVNIQ2MrYU54RVc1djgyS21T?=
 =?utf-8?B?RDdkcmtYQjBzTWk3UElvd3VoWitYTGh5anRaQ3FuMVdaOHpPbDdtajJhZTNO?=
 =?utf-8?B?L0FaN2g3TENZU2o3L0Q4c2xSdjJXMHNmak1QSlBpc0VGZFpja0JQWEZnMVlY?=
 =?utf-8?B?a3gwWGdxc2V5d1hxU0pUaDYvaUZiM3VSMXBOSDI4V1pERWRwbUNDS1ZaenNZ?=
 =?utf-8?B?UWpnWlhtdVVvZG9QcS9reTBNOHA2S3N2RmtIQ2sxZ0lvQ01FZ1ErUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acf402d-5a6e-4ad3-2704-08df1f1ccc5e
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 18:01:05.9008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJ8WNVdrf+nrKzAVDgLy/Nh+BPLBmoqFD4pIkyySZy8Fio/+w2ip7xzCuHO0asgF1ZhRZ4ZmraH9LWOknYcNWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6344

On Mon Sep 21, 2026 at 12:57 PM BST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> The `Span::join` function is very important in generating useful
> diagnostics. When invoking `syn::Spanned::span`, it attempts to return a
> overall span that covers the whole expression. If the `join` function is
> unavailable, however, only the span of the first token is generated.
>
> This causes worse diagnostics quality for all macros, notably pin-init,
> when compared to the pin-init's own diagnostics test suite with the featu=
re
> enabled.
>
> For example, this diagnostic refers to only a fragment of path and not th=
e
> full one:
>
>     error: The field index `1` of type `PhantomPinned` only has an effect=
 if it has the `#[pin]` attribute
>      --> tests/ui/compile-fail/pin_data/tuple_struct_missing_pin_phantom.=
rs:6:20
>       |
>     6 | struct Tuple<T>(T, core::marker::PhantomPinned);
>       |                    ^^^^
>
> The special "<-" syntax gets parsed as two tokens, so they are only
> partially marked in diagnostics:
>
>     error: `<-` is not supported in tuple constructor syntax; name the fi=
elds by index instead, e.g. `Type { 0 <- initializer, 1: value }`
>      --> tests/ui/compile-fail/init/no_tuple_paren_arrow.rs:7:29
>       |
>     7 |     let _ =3D pin_init!(Tuple(<- 1, 2));
>       |                             ^
>
> In the upcoming pin-init self-reference series, there are also custom
> diagnostics that wish to use the span of the full type instead of its fir=
st
> token.
>
> Thus, enable the `proc_macro_span` feature. This does make use of the
> unstable `Span::join` function, but this is for producing diagnostics onl=
y,
> so we do not have a hard reliance on the feature. A very small tweak of
> proc-macro2 vendored code is needed to make the code compile for 1.85.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to pin-init-next. Thanks all!

Best,
Gary

> ---
> Miguel, please let me know if you're okay with the proc-macro2
> modification.
>
> I'd like to take this via pin-init-next if possible.
> ---
>  rust/Makefile                             | 1 +
>  rust/proc-macro2/README.md                | 3 ++-
>  rust/proc-macro2/probe/proc_macro_span.rs | 8 --------
>  3 files changed, 3 insertions(+), 9 deletions(-)

