Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022122.outbound.protection.outlook.com [52.101.96.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A7732E126;
	Mon,  2 Mar 2026 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772481764; cv=fail; b=btiivJxg5tm3AJj/Ld3snfdpqFxOh8+bq6oI0RzoAcHsPprsy0GUlBpgigWaQwnh6WzOFZWkujjHYQS2NZPcJEKCZxP4/g8L3CrBzesHPRYpsEZavAdAUiX2ana2TKsPgbN5t2lbBekmQs6gkf8vAaFKA+9v6niZBxtZrNDXNLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772481764; c=relaxed/simple;
	bh=iKDaWA2QJMFlgdju+v3afvBGglqBCZU5XrBkvGHh0os=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=XirwUVbOHrZV7Qe8OIZ5eSuS2Etdf6uNL+hZQIGgjtcqgHPsTC5fKBkAhNYS3i2FsxkX9vK6UsdKt/MtR+YgEuOzdP+Qh3GitmEQapdkXeSAdPWUh4SJ5fpSgWGMCWxl8XHnhwwNRxgG5ZXcGv5gI0uktq+69NPttNeSRVjiSy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FVbAsR0Y; arc=fail smtp.client-ip=52.101.96.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FVbAsR0Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+cS6Grp/81kZ9AWcT34+t2OVf3j2zEigHnY/mjBpJxX6sSFtmfGdbL15o1yEkBxjaX/RUP5BUzVeiuC+d2SyHDFTkTBiojHSdavwNkAJN2mgh8QfWUmZ+1Uw/L/cLKRhgSUYgcPkN3VC1ovmfEXNVOE5kXeaipogawLaqteuXN8KI66jyE4ZOeLt83KhI7JH4PayVy60mw/2Lw5RX8NpKVlCSTv7FG7uHbIRUMMI0oZaQOZDyP1uEfuBk5aX+p0foz4zwyiA02s06U54sT9aZYtDwF7UhRiNjvUkVGqZrQSiDsmxrDKGIkNXf0436EVUfBNtBdzV+t0Z06uLN/oow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7c1b+rxeN/pUuCZmFxFQ7i8Tx8iYf84+ikilFW+U/Is=;
 b=AdIm/6Lf30HJXI90uriAwOPiSbCxvuYV7tyzPJ/UWREFkxNoYFBye4c2WQ5GnpyD2PooApzU8WdMuuU8uErpQ378Pa7i+fXMN4pWqHEeiWStrMZnZ46B4KsaYSeHJt/vzl++61S19TTVuUzipHyMwUfslHEV/mUNHlc4TU62LMGv0slbyNskmos3424BWqeZPbpHz/Z5uhnkHSOumim695zyjF22a32mfOfFNEvMH9Ll5/K3FB3RzEz2ot8MBDRcDZI4Oz3gTD/1VmszxdBVbGhg70UxcArI/eCEWLew7Vfrzbr7aMpUFnK4KuYIkyp5TdORB20vw75iDh9H/7FWrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7c1b+rxeN/pUuCZmFxFQ7i8Tx8iYf84+ikilFW+U/Is=;
 b=FVbAsR0Yv1XiirThovqeF4QBSU8i5Vu9atiaIr9UZWDj+GOfwx12p4VjbMz/9JXH4Y/WGKqpUfV2XdjqT9NtkDSB6GewDxk/c9DD4TaTFf3jnvlD9l/DEK1ogUBWXDG3JD2dg7G3gH8JShi43Wm5K2bIpdzfH+FySFUdk4hNsQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3577.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 20:02:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:02:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 20:02:39 +0000
Message-Id: <DGSKCF2L92ZT.3CU501FSU1RAU@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust_binder: replace is_aligned helper with
 is_multiple_of
From: "Gary Guo" <gary@garyguo.net>
To: <christopher.erleigh@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Christian Brauner"
 <brauner@kernel.org>, "Carlos Llamas" <cmllamas@google.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302-rust-binder-is-multiple-of-v1-1-121149fbad30@gmail.com>
In-Reply-To: <20260302-rust-binder-is-multiple-of-v1-1-121149fbad30@gmail.com>
X-ClientProxiedBy: LO4P123CA0193.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3577:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c5dfc8f-a300-49a1-389f-08de7896a84f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	6QdmCvOsyZ+VdLjhQFU0nWtwkVnOdrMK5BI27Q+cNjwSKL6hBa6zC7ZR//Bm8e0pJViDuDPwBJr5w4sM236wfGhNaUselPewaOzh4tlsfbEVzp+d9WqfOQH1Msu/Q+sH/R9XwVNzkPc+33/fA3SUd1bBEK8ArmjpFKuGezFwR88VAGw11KuBUnmBbPVyDeWuF5ilCcVXVbxnU2PN3qru8GXo7do1iy7MmBO8vwzzNcVC7aGROGgvrUT9GNikHnCxXXzN2WjuY5ofDe3mbUZ9YPEk61SLbxtEz6GRHbNewSAf8aWCu2JotBZG8lVMQHI96ldndAkZ8vIfXEo44pchhHSQ5B3LOWiiCxt0fzc48araeRspY8bWFYHgGbDsgyXOEp7jcMuBW3mGWFGcM1tB06c4oilMO/sgSFhMCCK2nOXApmFg2LjEsFVbjyTTu7TPLa02Ck1XTDjRvAUICF0ZHUOyKsPThK6FaNwrvef/Zk68nS2QhSk5+O13UKvzdwAAUCvck91j1u6c2c3mjAer+T7ANJJHg9w7Wlkgntx267zZX6qk4QHJPL+4suT3iAts3d+cDobVVcvjhQd5GeGbD7VBY2hQSE3gZehujvZvmUdTLSesbLtdeOxQOsZoK0k8VOht8W2Kti/Bhup9r6glrA+YZ6MZEgwVbeRfnae4dwJs5v/okN/f1512aXNKvirnsxbwShNR2jM1iNXlK4HuxMNtYtSV1X6zE1LhB3DF4/w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020)(13003099007)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmM1MUduZDJ1elJyMmVhYnl4VUgrL2xBZE9ZSURCMkRvcW0wOEVWckp1Umoy?=
 =?utf-8?B?YUUyNUZINDhxN3pheG4xWUE3TXYzN0JuZXBYeCtwUW83eWVTN2hvUlN1Vk9x?=
 =?utf-8?B?cTdMQXZqM1VFYXZzbWJJSURET3RHaGtCQTlOUGRNSDhSMDZZR1hrK1RhR0R2?=
 =?utf-8?B?NUFNeW1JdzUwRk14QnJkMGhSRC92SjlKa1pNWE9yZXl4ZWFUVm5rcU5NbUEy?=
 =?utf-8?B?dGd5dTNWckpVUnhtQXkwYmZmTFhXY3Zwcy9jVXVobHd0ME42NkpwNUVkc2pa?=
 =?utf-8?B?YU5wOXFTNVdZeU1iT3I5czgzK1p3Uk9DS0RjZFpBT0pIYU0zcFkzcTQvOU9u?=
 =?utf-8?B?ZjFtNm9uRHRpN0ltK010Z3hKbVFvY01BSkhocjI3d1RidlJWS0xlWVhVcjNF?=
 =?utf-8?B?bTVHQTlUVm1rMHd1cXE4Skw0SmFydkJBL0s2YXA2dnhwS2Q4TytUL1FsZm1C?=
 =?utf-8?B?ZmdHdXFpcXgxSklIMXdUU3dRNnRNUERPQTIwY3U5MHBCbzI2RlZqcDc5MUF0?=
 =?utf-8?B?Y1dleXc4RlJCVHZwVTV2YU1vTzVYVEpzQWc5QWlSRU1UeEFlTFhnN3U3dUVF?=
 =?utf-8?B?VmM4aEduL3dQSmZ6ZEtFTEJoZkphWWQ2MzBVRzRoMEhTZWNUSVk4VUVGZlJz?=
 =?utf-8?B?TVp4VktNeUM2SWNkYjROeHJUcnNaeUY0UjMrWXFIbm15Z2w1WHhzUTNLTkY5?=
 =?utf-8?B?SmRRcGVQYkZOSVRwWXNqMFdUeGtQUVhjUUVvZWE4amlFYjNkRWJHVFVTdDZp?=
 =?utf-8?B?bXpndGZGMUgrazc2VmhKQjNHSmtMZW1xRFg2dElKMXhoamJSTjJINERPbFRE?=
 =?utf-8?B?blZSYTNlTHlNMHM4MkwzWGxORHNNMCtnQ3R5cW9VWHdYbEFqS2JmNTB2WWo4?=
 =?utf-8?B?QVh6VHl5dDI0MkhyWVd1UnAyaERVelhXRTFRNG5WcEFmc3QxV2JFYVZUSU5x?=
 =?utf-8?B?S2c4L1NrT0IvL0I5UVV5a1pGNGlCMVd4TG9JS2p2RGZsdllzUExlTkN4RkIz?=
 =?utf-8?B?NTVibHFJdDBPODQ3cXdCRW9UTmFkUzVndXg0Vks0NzlEK21JM3RXMFpTWFpR?=
 =?utf-8?B?V25QcmY0ejZZK1FBUU1LTDI1bDVZQXpMcEtXTisyWTUzUi81ckZhVGFoaEJ5?=
 =?utf-8?B?ckhzWkx0NU5qTi9CNFNSVlN6VzB4M2w1QUNmRDhBRjRGVFNDUllVTlVLOEFF?=
 =?utf-8?B?YW1vcjU2M3RadjduUFRJSkg3U29ENzA4bmJxcnMvRWNBTmNmOUtDRTl1VjZw?=
 =?utf-8?B?b1F6czI4L0dJY0RWTkVrVUd4a0tLVjFTSUY1Q2g0SnRzTXR5Qys1SnIvU1Ju?=
 =?utf-8?B?T1kvaTFuL3FiM1V3ZENUdURPVFhVWUR6MHd3TzExUmpmeDAzamRXMjVNcDJX?=
 =?utf-8?B?bFdkODFvaGovRVVIbHlMWWhzQmhJaG9WUi90aHpUMGZCSXF1UmdDWWdhL3Za?=
 =?utf-8?B?VzkxQUQvQkpRdkRFWk0zL1hsM1pkQlFUOVJOV2ZCRDFETkpDTlRtMWF6RHB4?=
 =?utf-8?B?SFE3WFczWmhiY2wvb1pJMGc4b1krRTlDbXpOb1I4emdGQ214Y1ovWnpzUWxM?=
 =?utf-8?B?RVp4MzdlcFZJQnRpcEx5WkJQdkh5M1JCMnhZQ1k0VXV1TUVFSlBZMWNOc1Ji?=
 =?utf-8?B?MHhNZGxDVnJXRTZ2N1RybWF6MXpvdlY3aVBpUVVMTnR2R291YldJSSt1Z09V?=
 =?utf-8?B?RkRESE0wQXNUYzlQOGY3bkJNYVhGZFovdEJROVJRWTJyTjdMcmtwRWQxUksx?=
 =?utf-8?B?UThRSEc4a2tlazk1R1FLQ0JuNXk5VG96RURGMmFVT2FkTzBYQUlJRUxJT0t1?=
 =?utf-8?B?Z2hhblJxNE4zWXZIL2xBOWhqYmJnVGtRUk9Lazc1ZUJ1bldwUytySUdTdlBK?=
 =?utf-8?B?SGZKeHFPM3MrRVpiOEk1dmVJeXAwRkV2WkEwdGMwVC95cFRtakJ1Ym41L1B2?=
 =?utf-8?B?TStBY1QrV2JtejhsWjc1bytDRkxEMjJZa2Z0NVJ3T0JzK21aTExIOEM5NklG?=
 =?utf-8?B?cjZObERBM0pST0pkUll6N3V1VmwxT3VhQWI1QXFJOHRvYUlxV1gvcStvVHdw?=
 =?utf-8?B?YmFhV2lmMm9oc3pnanovNWV1VmJjeEJFWnpCcDB5QU5hMFV6K1NSQ3M1TTBK?=
 =?utf-8?B?TUVwTkxIVnd2Wjh2MHV2aElrQTE4NFgybHFFOVFMWnQ3dnNFUmszQVB4TTRk?=
 =?utf-8?B?VWUvTEFWWVdHOHB1SWkxTFVnY3Fvc0I0MkQzVXJ1RW5ZZkJqK0NGN2RpNnVu?=
 =?utf-8?B?Q0I5a0JnU0l5TXMvcGp0Y21EUE85NnY5dDRpZFcyenBBekJoOFdjMVhDc2RX?=
 =?utf-8?B?dVJyMmlRM0VVNGQyTHZrRUtjRGg0WWIyenBQRk50cHlGU21MZ3kzUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5dfc8f-a300-49a1-389f-08de7896a84f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:02:39.8560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLwlNoD5IFDd9Y1DShReS5W7406tVlbDpG3Qr8jpuDOt3zT9g5se4c6wUR0baNYYLAcxb0zNaB0QPmMHh8gM1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3577

On Mon Mar 2, 2026 at 7:35 PM GMT, KaiserGranatapfel via B4 Relay wrote:
> From: KaiserGranatapfel <christopher.erleigh@gmail.com>
>
> Remove the local `is_aligned` helper from the binder thread module and
> replace all call sites with `usize::is_multiple_of`, which is the
> idiomatic Rust API for checking divisibility.
>
> Since `is_multiple_of` was only stabilized in Rust 1.87.0 and the
> kernel MSRV is currently 1.78.0, introduce a `UsizeExt` extension
> trait in `rust/kernel/usize_ext.rs` as a polyfill. The trait is
> conditionally compiled behind `CONFIG_RUSTC_HAS_USIZE_IS_MULTIPLE_OF`
> (set when rustc >=3D 1.87.0) and re-exported via the kernel prelude,
> following the same pattern used for `AsFlattened` / `slice_flatten`.
>
> The `offset % type_size =3D=3D 0` expression in `rust/kernel/io.rs` is
> intentionally left unchanged as it lives inside a `const fn` where
> trait method calls are not permitted.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1220
> Signed-off-by: Christopher Erleigh (KaiserGranatapfel) <christopher.erlei=
gh@gmail.com>
> ---
> The recently landed patch "rust_binder: add additional alignment checks"
> introduced a local `is_aligned` helper as a workaround for
> `usize::is_multiple_of` not being available prior to Rust 1.87.0.
>
> This patch replaces that helper with a `UsizeExt` extension trait that
> provides `is_multiple_of` as a polyfill, following the same pattern used
> for `AsFlattened` / `slice_flatten`. The trait is gated behind
> `CONFIG_RUSTC_HAS_USIZE_IS_MULTIPLE_OF` and will become a no-op once
> the kernel MSRV reaches 1.87.0.

We should start using the feature unstably as soon as 1.82. Whether a featu=
re is
stable in a specific version doesn't matter for the kernel, we can use it a=
s
long as it's available unstably and is stable in latest Rust version.=20

AsFlattened is special as it's renamed during stabilization, so we don't ha=
ve a
version that can have the feature enabled.

>
> Note: the From: header uses my GitHub username "KaiserGranatapfel", as

GitHub associates commits with user handles via email address. You should j=
ust
use your name in the S-o-b and commits (From header).

Best,
Gary

> this is tied to my Git and GitHub identity. My real name is Christopher
> Erleigh, as reflected in the Signed-off-by trailer.
> ---
>  drivers/android/binder/thread.rs | 14 +++++---------
>  init/Kconfig                     |  3 +++
>  rust/kernel/lib.rs               |  1 +A
>  rust/kernel/prelude.rs           |  3 +++
>  rust/kernel/usize_ext.rs         | 30 ++++++++++++++++++++++++++++++
>  5 files changed, 42 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/th=
read.rs
> index 0b62d24b2..25d499d05 100644
> --- a/drivers/android/binder/thread.rs
> +++ b/drivers/android/binder/thread.rs
> @@ -36,10 +36,6 @@
> =20
>  use core::mem::size_of;
> =20
> -fn is_aligned(value: usize, to: usize) -> bool {
> -    value % to =3D=3D 0
> -}
> -
>  /// Stores the layout of the scatter-gather entries. This is used during=
 the `translate_objects`
>  /// call and is discarded when it returns.
>  struct ScatterGatherState {
> @@ -796,7 +792,7 @@ fn translate_object(
>                  let num_fds =3D usize::try_from(obj.num_fds).map_err(|_|=
 EINVAL)?;
>                  let fds_len =3D num_fds.checked_mul(size_of::<u32>()).ok=
_or(EINVAL)?;
> =20
> -                if !is_aligned(parent_offset, size_of::<u32>()) {
> +                if !parent_offset.is_multiple_of(size_of::<u32>()) {
>                      return Err(EINVAL.into());
>                  }
> =20
> @@ -814,7 +810,7 @@ fn translate_object(
>                      }
>                  };
> =20
> -                if !is_aligned(parent_entry.sender_uaddr, size_of::<u32>=
()) {
> +                if !parent_entry.sender_uaddr.is_multiple_of(size_of::<u=
32>()) {
>                      return Err(EINVAL.into());
>                  }
> =20
> @@ -975,10 +971,10 @@ pub(crate) fn copy_transaction_data(
>              None =3D> 0,
>          };
> =20
> -        if !is_aligned(offsets_size, size_of::<u64>()) {
> +        if !offsets_size.is_multiple_of(size_of::<u64>()) {
>              return Err(EINVAL.into());
>          }
> -        if !is_aligned(buffers_size, size_of::<u64>()) {
> +        if !buffers_size.is_multiple_of(size_of::<u64>()) {
>              return Err(EINVAL.into());
>          }
> =20
> @@ -1047,7 +1043,7 @@ pub(crate) fn copy_transaction_data(
>                      .try_into()
>                      .map_err(|_| EINVAL)?;
> =20
> -                if offset < end_of_previous_object || !is_aligned(offset=
, size_of::<u32>()) {
> +                if offset < end_of_previous_object || !offset.is_multipl=
e_of(size_of::<u32>()) {
>                      pr_warn!("Got transaction with invalid offset.");
>                      return Err(EINVAL.into());
>                  }
> diff --git a/init/Kconfig b/init/Kconfig
> index b55deae92..bd7493480 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -166,6 +166,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
>  config RUSTC_HAS_SLICE_AS_FLATTENED
>  	def_bool RUSTC_VERSION >=3D 108000
> =20
> +config RUSTC_HAS_USIZE_IS_MULTIPLE_OF
> +	def_bool RUSTC_VERSION >=3D 108700
> +
>  config RUSTC_HAS_COERCE_POINTEE
>  	def_bool RUSTC_VERSION >=3D 108400
> =20
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3da92f18f..59216912a 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -157,6 +157,7 @@
>  pub mod uaccess;
>  #[cfg(CONFIG_USB =3D "y")]
>  pub mod usb;
> +pub mod usize_ext;
>  pub mod workqueue;
>  pub mod xarray;
> =20
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index 2877e3f7b..7e778a666 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -53,3 +53,6 @@
> =20
>  #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
>  pub use super::slice::AsFlattened;
> +
> +#[cfg(not(CONFIG_RUSTC_HAS_USIZE_IS_MULTIPLE_OF))]
> +pub use super::usize_ext::UsizeExt as _;
> diff --git a/rust/kernel/usize_ext.rs b/rust/kernel/usize_ext.rs
> new file mode 100644
> index 000000000..690265bc0
> --- /dev/null
> +++ b/rust/kernel/usize_ext.rs
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Additional (and temporary) `usize` helpers.
> +
> +/// Extension trait providing a portable version of [`usize::is_multiple=
_of`].
> +///
> +/// `usize::is_multiple_of` was stabilized in Rust 1.87.0. This extensio=
n trait
> +/// provides the same functionality for kernels built with older toolcha=
ins.
> +///
> +/// This trait can be removed once the MSRV passes 1.87.
> +///
> +/// [`usize::is_multiple_of`]: https://doc.rust-lang.org/std/primitive.u=
size.html#method.is_multiple_of
> +#[cfg(not(CONFIG_RUSTC_HAS_USIZE_IS_MULTIPLE_OF))]
> +pub trait UsizeExt {
> +    /// Returns `true` if `self` is a multiple of `rhs`.
> +    ///
> +    /// This is a portable layer on top of [`usize::is_multiple_of`]; se=
e its documentation for
> +    /// details.
> +    ///
> +    /// [`usize::is_multiple_of`]: https://doc.rust-lang.org/std/primiti=
ve.usize.html#method.is_multiple_of
> +    fn is_multiple_of(self, rhs: usize) -> bool;
> +}
> +
> +#[cfg(not(CONFIG_RUSTC_HAS_USIZE_IS_MULTIPLE_OF))]
> +impl UsizeExt for usize {
> +    #[inline]
> +    fn is_multiple_of(self, rhs: usize) -> bool {
> +        self % rhs =3D=3D 0
> +    }
> +}
>
> ---
> base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
> change-id: 20260302-rust-binder-is-multiple-of-2d757cf0a70f
>
> Best regards,

