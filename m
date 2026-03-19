Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021121.outbound.protection.outlook.com [52.101.95.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0A63C5DBD;
	Thu, 19 Mar 2026 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918276; cv=fail; b=qhiYimMpKS9RDrwN3kcs/cg1aJcES0VDVVr1hFjoMWCPhCFpOuWerEahiN1kE3p5SZqSuuQEVbw26aTflXFRyK5sMF/rAOBLb8Dknn92yDyccFQ7c5r+78ICVlczgQYQPaFHAgJ6f85D4BV6UpnQUdSqT1HVrIUTF1sIkTmxhhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918276; c=relaxed/simple;
	bh=l1A3pD9IxkPHzX6x7mLsI9ELfWtrzZWlzDDbpp/UFD0=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=UhZobiHpx36iXXlAfATMdUsXGTacNtX8viwd3ZkeZJVWNwVCG3xM3J+WDb2n3gNvwvtpXy0kkA2hYxUMYeXcALonUNAeBTnhRHXJ0BLUA1KA79CxL5JPTegcGmQ20TMBkiBpMwE3pqaaeiPe9Sxmf+MHxjftMqRX3bH5nQNB5a0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=bv9TArGH; arc=fail smtp.client-ip=52.101.95.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="bv9TArGH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYnI+zEZti4YeNib/X5q0SEMJLLP/wco8oKnTwO7bOu98rt01qSd1S41we328SsIGzjocmGAZ7DT7fWclZnBOIOMRAmATWEgJe5yqwSYddrg/cAc2m3NLsJW+KV54d06dS7ZTwk5Xz8xMoJhHP+QAQZs9OwEO8CTdknguzhtjUNZQlwiutizdBp3zDPGDl0TdwdI3K88umovvZZl0tNKAYA2bS9KeA31Cqs5Z/OYzetnGLvsmZFGBCicKqqCSvP5cu4x+rMbrRlXsL4fk5MexBV0b8UOxxtjD4NdzsX+8LOPknGR3WzE3FhUs3JbDz93DOr9eA2Pqo5hdf9MxxtOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdcjRjwWaLr52QzGMYJdNDOhza7ud4CzJghxi5gRri0=;
 b=JXOQY3GLJJDttfKm47gYN2FapU7B6bSz9GUaOY0p9FIEWnFy1Bjb3XD9ztn5lg6ugGNrvh/iaE/c1kRaqlm9T98xJJVf7VJIlsuG6Wm6scT9MshITJzrIP01opRZ0tmHCqckQy989d/aQ52YJYYJOAQIf9e89e3PsQ688+mWvRfDo6LlB2yGUjK0KcC/j4DURnDoctO6kdSXMrPH+a6hdYTzu6utofJGmAcPRMBAkkEH8oJU9ZNR8XFHKAsL+gsext7MmJO/WbCtXkUPKx8RGb3WQy/t8fFgVnM/MH8gFa7pYDBoquG8MajywFNGQNS3R4I/vUjHM+Z1INMf/XU8WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdcjRjwWaLr52QzGMYJdNDOhza7ud4CzJghxi5gRri0=;
 b=bv9TArGH0gocK1I66fuoD7wJWNKVvQqVXa7L+wynTB7I3JmORHr0y/e/NP/kdCPEdYyj2mlu3iyHGkjoI6ekfuMV6B5m4z01ClDjqtBZK0uRZ/h4iXqZs7qYBaO+na4hL1FGeoak+RDMj+J1UX1rc/Dcy+pKp2NG2Q3/daf8NnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7402.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:427::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 11:04:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 11:04:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 11:04:28 +0000
Message-Id: <DH6PJM6X9R2C.29F8J9JWL2S9C@garyguo.net>
Subject: Re: [PATCH 2/5] rust: pin-init: properly document let binding
 workaround
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Antonio Hickey" <contact@antoniohickey.com>, "Janne Grunau"
 <j@jannau.net>, "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Oleksandr
 Babak" <alexanderbabak@proton.me>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260319093542.3756606-1-lossin@kernel.org>
 <20260319093542.3756606-3-lossin@kernel.org>
In-Reply-To: <20260319093542.3756606-3-lossin@kernel.org>
X-ClientProxiedBy: LO2P265CA0481.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: dc103e81-aef4-484a-b05e-08de85a74a70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|7416014|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	2NjH8JYjN9pY30R7Bb49IEg1f6rA4Z7SH5oABQJel8RJ3HiODaX7ckpZ/jzFCW5Tz1gqBSm8j0z2NkGKREfc9ZVigK1TYHJy3yF4gOfCXsRk3dYRv4Ia2K3HW7zn0Nj460xPxYRwPCR5reYpsb4o3gZ3cqBZzup8f417MgxZ9o+c999VRSXflw3c5ULDFB1rkrfve7fTlVpIe7vxaI0/CoL35pIQGt/BNQwUpqYoi15sBlNYKlwgNLx4576BATpUjNDmuPgOFxLmZWah3MC6xbE26afMFDdyMu5TJu0bweJhhZG/Hner6/4lwKiz0yIH/wAxu9bQgjUNHu2D4uCaLkFnEzPEJ45wehnT3do2eRAEaTmLwAKUdX4wp/i/vDk93fyq8L9H6lODMX5UHeefBOnKuPi9ZF7ze3csgBf5ky40P0zxpQHbxFOP+FjfQF9K7TRnwauupItXJpJchsVx5RTMarX6t1JfjxtgslsXXtCmm1aSa6lC35qGhJV/m4YML/y/GJ9LBMjjpyv149112SreunEqKBILs/5AzxkVNRlXLkEpp3XA/GNIenTrMwLh/UvbmJQ8qsIyBuqsg1LIrkm+v/X7JnpTwBDI4ia5aL7R/C+0Y5X6goFNr2GFAipkhnZeQkW9zeEnXLUcBg+hBODNiZG5JLBGUXgol8TCjDSiiPlIF1e2aUgR1KaOuE+BdR748SV4g9GKt8Ph3RKKCEvJ1g2NOYsWYAdSZH48D4Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7416014)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3pnUVVQQkVxWjdsWGhjZzVYV0hLUWVpaElzME5ucEN2V0tNenlqNE1ZMk9Z?=
 =?utf-8?B?bWJIWU1CalJKNEZXd3B4RWlvbVg2YWRSZkhIN1BLRTZzd0dEb3g0N3hjaUM2?=
 =?utf-8?B?cC9KeDI5Qms5QnlVWWhZUS92SHllQzJBZ0o2dWcyTlVLUlZQRTRmR1VGZEds?=
 =?utf-8?B?NWI4d0g2TW1GVktyR1NQZkZxU2MvUDZra2JLMHo5WHRpR0owcWtiZ0RtR3lH?=
 =?utf-8?B?cU9mTnpHWWNUYWxLRHFMSVRmckJvQlE0SXR5NkFWSFYyanpqOHN3UDZXdjdq?=
 =?utf-8?B?QmhRTFhZQmJpdWIxSmZ5RFkzOFp1WFk4N3RaWkMvOXBWVWhyN2FMT1NvWGQz?=
 =?utf-8?B?dXAxS1VteXBkSnhHcXBDYko0anVqWTVqWWVlMnpoUGwvdS83aERscXJKV01k?=
 =?utf-8?B?bjhNaktpMitlcUIzdEtNQ1ViNW1uc3lvVDdpd0o0anJNVURRL3NVRklJNEUr?=
 =?utf-8?B?VkVKNXFZbmxwdm1YcGtnSGwrdTZta3lQTFpETGJuVjlpU3dGUmtyQU5IcVZZ?=
 =?utf-8?B?cjVUWFhiMEtzaTl6TjBOUTBmcFJNWldGbVU1Q2IvaTZrdk9rRXdzajl2VWND?=
 =?utf-8?B?VmcvbUxtMWtSeHhBRUx2cFhENlZ2NUFFQzhHcnY3cXR6NEFFRHdTLzZQSk0v?=
 =?utf-8?B?am5kcnZRS04ybnpOakVDemgxaFpuM1JsZHZZdTlINEduU0cvMEJXeTA1b3Vl?=
 =?utf-8?B?NnlNZVQxdVpTTThNaVV2amdqWDl1YzV3aXEyOXdxWnhnU2oyeDF1eWxPOVMr?=
 =?utf-8?B?ME9iS2wranc3TnJZQmsvSjJjK3BIZUF4bzNMWjVSR1NBclBqZEFkeVNKN25J?=
 =?utf-8?B?QW9RK2lZbDVBYkxNUmh5Z1M4SG9MQVVJdGdMdGpDZTVpVjdYRlJna2tVVHBp?=
 =?utf-8?B?aUYyaEtTU1pvRHlJUnZ2SnRYSzRTVHJDQ2IwaFhNTmdnZzZqNXVrL3ZiSngz?=
 =?utf-8?B?SzEvRVdhekF6T25hVmJESGRmOWxpNlhiWHZGc3ZucXE4T09xdkI2LzA1Rm5Q?=
 =?utf-8?B?SE5ZWVdIZnpydWpEM3V6NTJGNlhZQm1kaHJKU2dzbGVsakpzVS9za1dMVWVK?=
 =?utf-8?B?TFNhVkFNUkwveWFEY2xjcklGZk9uQldKN2NMNFFQc1p2SFR0TzB3ZkYwV0px?=
 =?utf-8?B?V2ZyRE5VeEw0YmNzTjlBbmF1Ri9QTVZoU1dFWU5FcFV2SE5hN012dTE5c0JS?=
 =?utf-8?B?bWZBMnExZmZIOG1CUmttTS9YQWQ2VEtvck9KdVBKTWRhV3FIY1M5RGcwTG1T?=
 =?utf-8?B?eTVqTlliZm53OW9wdmNEUksrL1pic1BLa2VYSkJvckg0YVZBQU9QSTRLWEJG?=
 =?utf-8?B?R1dxUUk1czUxV2x1TjA5TGJ1UjFrSkI2WjdsR01VY284L2ozMUlwRWx3eVlu?=
 =?utf-8?B?R3Jsdm1RZnJmT0JiR0FibWRZNGFHQTB5TDVidStjMGt4QkorcmlIVFFQUVVX?=
 =?utf-8?B?b2liN0pTUEdWanE3WW1PQURtcy92OHZjU3lBZTNPVXhWS0NLQ2RraFd4cWR3?=
 =?utf-8?B?YnpxVmlOL1BzbVltVHJoSytrV3lzWGs5WHlySWFyUXRlcnFpZENkTEtqV0FX?=
 =?utf-8?B?c214c3BtNS83d2p3ZTIwaG56OEY3VlhWaStjcVErZGdPamlOY2haWDlCYlFJ?=
 =?utf-8?B?Uk54Zkl5aTBuOWFmcnhScDlBOEFaNi9xSHVzdGo5aU8vSG82cVRZUXoyT2lB?=
 =?utf-8?B?UElZMTNmVS85YnFJa2tOTzNFajVjOWlZUWtMUkJHUDA3MVlQU1dxSjhiVjNF?=
 =?utf-8?B?cUc4aUdPN29EcExSV0pvQ3VKK055VDI0dnFJZ3pQcDZwalprTDJ2YU5iWjZD?=
 =?utf-8?B?emJhcjhRQ1didHZRU3Y1eFk3RkttMi9sZ1JLamwrRnYyN0lUQzZLZGpIaUtu?=
 =?utf-8?B?eEFkeDgwY05remU4YXo0b0hITURDYjFkSEdJZ1haVHg5NEltWlFHSkF0d0xy?=
 =?utf-8?B?UmlTYXJpSTUrRG1yNmVRYUd6ZFhCUEN2ZkxSRTlKdHRtTXkvbHlhNWRoSm1v?=
 =?utf-8?B?ZDRCTkhCYnJhMUVDOEduaEd2Z2pmN2NtaUZEL25QQjR1U0NRdGhiWTZoWE4x?=
 =?utf-8?B?R0JoakIwTHNjR20vMHp3SnRpbDNsL1ZvNnBCb2VVdU9sbTQzc2N5TTcxNmRS?=
 =?utf-8?B?c1dJeGJsRzdCSlBIRDRaZDFrRnMrNmtobGpwMmtlMW9aUzE1RkdmV3F1MFN2?=
 =?utf-8?B?bW9NQUZkZ2JhZzltWExwMVNPaVdUMitSa3d4T1RDU1lxRS9vUjl0emp6bG1O?=
 =?utf-8?B?TDRUTjFkSWtGZU9nS0F4V1I2SXNKSHpDalc0RzAzYmlxQWFaU3Vza010UGh3?=
 =?utf-8?B?L1luN0hMVDlLYkdoU2dJaWN3UFFZMjNyZkpRY3dhZnNlVWRQUDREUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dc103e81-aef4-484a-b05e-08de85a74a70
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 11:04:28.9173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaO1isZW9hXnxfAWkKceNbThzev7p/GwK0oJh/pw0rYECGgz8Rgq4hVe0j33ujwI/VltfdJkjcZBHPFUfQKQyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7402

On Thu Mar 19, 2026 at 9:35 AM GMT, Benno Lossin wrote:
> The three let bindings (in the bodies of `cast_init`, `cast_pin_init`
> and the `init!` macro) are used to avoid the following compiler error in
> Rust 1.78.0, 1.79.0, 1.80.0, 1.80.1, and 1.81.0 (just showing the one
> for `cast_init`, the others are similar):
>=20
>     error[E0391]: cycle detected when computing type of opaque `cast_init=
::{opaque#0}`
>         --> src/lib.rs:1160:66
>          |
>     1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) =
-> impl Init<U, E> {
>          |                                                               =
   ^^^^^^^^^^^^^^^
>          |
>     note: ...which requires borrow-checking `cast_init`...
>         --> src/lib.rs:1160:1
>          |
>     1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) =
-> impl Init<U, E> {
>          | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^
>     note: ...which requires const checking `cast_init`...
>         --> src/lib.rs:1160:1
>          |
>     1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) =
-> impl Init<U, E> {
>          | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^
>          =3D note: ...which requires computing whether `cast_init::{opaqu=
e#0}` is freeze...
>          =3D note: ...which requires evaluating trait selection obligatio=
n `cast_init::{opaque#0}: core::marker::Freeze`...
>          =3D note: ...which again requires computing type of opaque `cast=
_init::{opaque#0}`, completing the cycle
>     note: cycle used when computing type of `cast_init::{opaque#0}`
>         --> src/lib.rs:1160:66
>          |
>     1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) =
-> impl Init<U, E> {
>          |                                                               =
   ^^^^^^^^^^^^^^^
>          =3D note: see https://rustc-dev-guide.rust-lang.org/overview.htm=
l#queries and https://rustc-dev-guide.rust-lang.org/query.html for more inf=
ormation
>=20
> Once we raise the nightly-MSRV above 1.81, we can remove this
> workaround.
>=20
> Link: https://github.com/Rust-for-Linux/pin-init/commit/bb3e96f3e9a4f5fca=
80a22af883c7e5aa90f0893
> [ Moved this commit after the previous one to avoid a build failure due
>   to unstable features. Changed the cfg to use `USE_RUSTC_FEAUTURES`.
>   - Benno ]
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

Perhaps we should import review approvals on GitHub as R-bs.

Best,
Gary

> ---
>  rust/pin-init/examples/big_struct_in_place.rs |  2 ++
>  rust/pin-init/internal/src/init.rs            |  6 ++++++
>  rust/pin-init/src/lib.rs                      | 18 ++++++++++++------
>  3 files changed, 20 insertions(+), 6 deletions(-)

