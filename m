Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020138.outbound.protection.outlook.com [52.101.196.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F33306741;
	Fri,  3 Jul 2026 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783095820; cv=fail; b=SkjFmk43hBkBvDxv8UEKNBQSuvfcM98jiJOoQAukog4+UtMe6Bulf9igP5urmw2dUfiTP3Q1vFNKpfyTTCZiOC9aL7FgYpeA0aZtqPAxaGk11mlncAJS0ev+r4Ip31Z4LNrYHVRNHjc4DqwMpgyFEr9F21GC4rCkZwBiHjNEZXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783095820; c=relaxed/simple;
	bh=9+Tylt9ef8udj7Iit+R3zy1LCKD+RI4ayd1qqjkL8Xo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=bVjclOhBGw+ckhRoxadh0skWsiQqNaSFA/SezQsJ2i/v0Z01jGQGa3hwzFXt/saJIDE7Iv8XayHowmsR7liaS6UNuLoIT3gdtXGfhJBqnlxPBcwd6CxVHr77ChpwuRG/H2T+S9HXxSl9QcNEVf1CdqCrzMztFJ83BQi54sC+rbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=f6WcB5G3; arc=fail smtp.client-ip=52.101.196.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="f6WcB5G3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzo3Je3jyd5K3pQtGRi/EkUUJHAV9lCwaL38STJ/0kkggPQSRlXlacWtH/mlWP7WeL6g7j++YtC/7jHB8OEhK2Vev8RiPozrxwcjc5Z8SU6thsX/+9k0+CWlSHCedfOJQwB1/VKGHJPsUyfb/GrNhzM5MiVCPiM15hHhSY2XOlkS9nSNnbx96sUQYeoJZszvdkPKum1pI7v35C7erV2k6ULY7YvRWqhvhcJvSf1bmDnAUhFeE0wwKf3FPOAt+EbH5f35KaC/5SNYOmQag7EaBA6wMG66JtBFPjnoZ1gDF5JjERxu8LE7H5B85U/TliDJpG5rgftLnNkvqv4EZYoY1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9IT2h7YO6FDzHct0BbrNKdZCColCez8Q+3k9YF6asw=;
 b=AFBAE5MMtdYALq7YO2X0kZOZiOJg4KbixBrTreLfX0uCy4asfEk2T/KcTBrzhWzY3tNJqkn5HDp9h33VP74sPuBSMj0IudcPo+rqpOnhfsVonXOxgHo8ybH+RN0Bq1MBbYR2h3Tq4zhtHRetHfrnVMQd1H0yuuF1Ue8oDWR9ubAfAep/tx0+tvD5zCEV6ViZUlwNKollzMEfDz329hr/NzJxJY37G/xz4P2BRpNLNjboHAaOEBnOlA4T8t/F58OkCWsNs7oVaR+ERKwL0QDuxQo/ydVQsgpS1hqprmeT/qBZVLiOhtVaaM7LQsBy5Ok8agK7LkdQS3xLCF0FPENGYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9IT2h7YO6FDzHct0BbrNKdZCColCez8Q+3k9YF6asw=;
 b=f6WcB5G3oJgijEeDslTWKjpBRsmNh4GrLD497aB4GxmzSrKjfhP6BdEgRTRdYBMfoHMAd2yNCYrgXBngNLqcojegTdLTHtWjAVBpp6/fHxk8GGgj1jYX78kl6l7iHXtjvMNL7z7bpvgGss1f7b9zkEs8nXJ1pwhsiANJWHfm26M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8688.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 16:23:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 16:23:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 17:23:31 +0100
Message-Id: <DJP2PNJVLPC7.1RXQS9RMFFYM9@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/7] rust_binder: Add dynamic debug logging mask
From: "Gary Guo" <gary@garyguo.net>
To: <jahnavimn@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Christian Brauner"
 <brauner@kernel.org>, "Carlos Llamas" <cmllamas@google.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.21.0
References: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com>
 <20260703-rust_binder_debug_mask-v1-1-9bdf12b5325c@google.com>
In-Reply-To: <20260703-rust_binder_debug_mask-v1-1-9bdf12b5325c@google.com>
X-ClientProxiedBy: LO4P302CA0025.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 691806d7-2d08-40e2-614f-08ded91f6ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|7416014|376014|1800799024|366016|18002099003|56012099006|3023799007|4143699003|6133799003|921020|22082099003;
X-Microsoft-Antispam-Message-Info:
	LRirc6Tw/IPR06Mawe1HOyNa2WKXDCSkO1eDoHuzhAh2t6VKikh9tU9C3GnsXEeHPRADqQg08O/f3121DE2WsUQEfsi6kes9VszWs2Dvf2I82eDAhUhYeFHTHTx9mhSb8nLGfkmjPTxJmmUHGi6H0EwVb9lju/eOI2+2YTTuIQ3UOiPviGCCbwensNg9yGqBS7pJQ8znQV9DM55USJc0WZGCrrerhUVrcEhTUVcIcHOtJvpULfEfMi7NnSHXFqk6zA/PC/dvxH42pkBPZNRJ2cQt/39PSun3myYFL7lLU//Owb5uB9yajs4J9O69AzR7KjP/jsHFd1NuE26v/L+ERKt7CmbYTbU6uFgoSmyBvvTAl/ZqMtbNtvXJBtbHcAH5u3WDVr+pdWTpn/XLjcFAlI1TirNy4ovfEPOvufPXA7R4RhIaxhF263X6HRk10gziMrntBy4Z/r+62EJYH0aqvw3SJQXNeXiMpNHdmYykQKEGWYMFFsfO0PH4rsIQWb1VGRwRhG4KVwwxIzlyKnYkqpLl51g4U5hkagycf7Q7OZZHKKNAVvnBdYMDyAhFwiqNIlJ2b50VtjP/9XJiH3p14m6T6WR4A0RBY9Dxgg3Kd6vVudwWyKQR7waz7H4w3B/qedr5OL3mVxoUWtnQhaYA+8aN6nCNzFhqfR1KMzhwy66Rg36RvXAgZsHDeprTmuKyB+HiWD9ecIeXhb3LkYrdxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(7416014)(376014)(1800799024)(366016)(18002099003)(56012099006)(3023799007)(4143699003)(6133799003)(921020)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWFLY1BSSnVNSm8zSzlZdmtyNm1VSmhLRzM1SFdGZUoyTEgzbXFFdlVlZzhS?=
 =?utf-8?B?VE41a1RwanV3L2NBaWtYenVwa1NaY0RERVdlWXQ0TXltSTZPSDNsZDdjUXJX?=
 =?utf-8?B?dVJORmlOVDBRMFRkTmFsQVNDRUVOUUlSSnY0YXZEVDFlNmUrc2YrNnY0Lzly?=
 =?utf-8?B?cjdmenFqM3RDcHZDTkd0V3o4TjJ2dnZqckZXRGVNUlRVMFIvVTlnK3IwemdC?=
 =?utf-8?B?cGVtejJ0S1N6a3BjemhqNlVCYWl4VG9RWnhtRXRVbVR0Q2NpQjkrVjQrZEl6?=
 =?utf-8?B?VjRFcG05cUlkZThZWFd5OHl0YVNtZHIvc244MjRHVVFSL0E3WFB0aGdidlZp?=
 =?utf-8?B?NWRTZ3MrZ3huQTFOMkQ2VlZuMnZ6TU1BdUdod252YTB5eStYY3d2bitheUJI?=
 =?utf-8?B?WnQ5cmF1ZGpnMWEzZEg4NWJob1F5RWI1V1hRRi9qWHdrVC9aaWFEUnhSS1Bh?=
 =?utf-8?B?bHFsQU1MMWpPbkRsc0twMmdaMndwYzFrUllvUENZYkw2cDF6Q0NRSTJWQm1I?=
 =?utf-8?B?YitULzdiUHg4SlpOYUdhaTRxYTVrdWhKSDI2dW9PaGlXbGRvYWpIS0pHZ2VK?=
 =?utf-8?B?dXp1cWV6VUhvRktvdHpEOTJWaEtMVEdSS0FIMzBFaXdTTmNtSElFMWlKYU9j?=
 =?utf-8?B?SzFRQzFpTTU4UzNnZ3lEMENnUVpCSW1yZjBNa1k4V09GemtvV1JtNUk1ZCtL?=
 =?utf-8?B?dTlpZjFBNmFqNFhRNWFLRVV3RzE5ZG9QYWNYeUR0S0xNQ2lEYnVjeWxpRXhr?=
 =?utf-8?B?OE9IbHp0Nnp1NDg1ZWNrbnR1b0ZnNkVnTzYvTjZoUkdYVUFzcDJ4YjJ0QlZI?=
 =?utf-8?B?cU9EKzhEclNUWTY1emhvSEFkNE1QVEg3Mm9JRVR6QWhWQ25WYUpmUUNXbFQr?=
 =?utf-8?B?T1NIVmVhZE4wenJtZ1phRWJLdXM3V3Bvc2Q4K0Vram1sdTFYRXZIdzdNbHJY?=
 =?utf-8?B?Q1MxeGdad1c1NlQzZkZyNDdvSDBjYWdVcytuNEVJc0V6N2hydjluL1J0Q3Fn?=
 =?utf-8?B?NWlHSnlOREl0STFJSHdGZjVONElUUzhmTjloNVpUOUs2VE9pUHRSZ3BRRXRn?=
 =?utf-8?B?clBSZmwxcjBnbzNFbmQxRDE5OXRLSWxKb24rNnhBa1hqZW9mdHZLazN4YTUw?=
 =?utf-8?B?T1hnR2ZLVXUyaDNPMEkvTUFBRUtud0dzMTZEb1pHc0w4OVV2dXZUenA5UWho?=
 =?utf-8?B?bURyNHQ5cEg4dUV3VkIzOFNJMEtsUjVYdEx1aEZSZlJGYlJ5M0tOYkRiNkhB?=
 =?utf-8?B?ZU5mRytyTXhleEVsZHRHK0VodTRtS1ZFd1l5UU1IUzdwZW9wWmhyejJBY3NL?=
 =?utf-8?B?bUlLZDRrOXUraWNma3JnRTdDSVFMckJteHd0VDROVEl3eFJzR2tWcVlGclB6?=
 =?utf-8?B?SGNIZkRpSktXbnkyTjZXcXNsZXY3R2NSNW5KT2QvcGRYcjJKaXZzNUJUTjFI?=
 =?utf-8?B?Rmw2WVBxTWo2WUVoTVg5QzE3SUo1S053NXAweWRrOHNKNk1sSjRSV0d5d2pN?=
 =?utf-8?B?WFhkWjFtMDNSVVA4S3hBdHhRZTYwYVVSem1UYmJCdUFUMVNiRWdRc3dpamc1?=
 =?utf-8?B?Y1RKU1pYOUNXR1J0VW9FeGV0VW55YXZDUCtVMjVGVFJnbVlqMTlNbXM3b0N0?=
 =?utf-8?B?RHQ1OWRkOEpLTDlabHdGa2ZYY1dwenptd1JYNEhKU1dFNXJKZ2NjU1JGOVNj?=
 =?utf-8?B?aWpITWdoZ0lOdUhSbnN6ckp5UkViWWp5QzNEbW9BS3hiNlZtM3ZPeitTMmlR?=
 =?utf-8?B?NHRzVlBwQ0xUV0FCd3hYMEgzK2RnNmVIcnhiQjV6SjlQMmhkQ2tmZHdYb0pl?=
 =?utf-8?B?ZFNBV1M1U0hYNkh1R0UraDFpQ2cxM3N2SEJKTXlOallTNFAxa0JzSC9WN0dq?=
 =?utf-8?B?aEdTWDZldFlxZHNaYk9JZ3BYTE9yaTZmSUFhaFlkdjdqNnQ5dTB3ZHArSlFZ?=
 =?utf-8?B?ckppVW5WQjNMRzdRZURxYVU5bGY3eFp2am4xTENvK0NmZWtHMk1JK1p0aENy?=
 =?utf-8?B?MlVEcWlSei9wZGduK1p2MTl1Q21SZWhQbmlBajEvRUJYZE5Mbk95UlZjcGFY?=
 =?utf-8?B?b0FpR2plWVQ0bEE5NUZLejNXU2xuOTF0Qm4ycDVmQjBJbmg5NE4wWUhTbUhm?=
 =?utf-8?B?M0daaEhpOUt1di9yaGFJTUNxbDFZTFJGL3I0VW9qV3RTRkpkSUJiQi9TLzJo?=
 =?utf-8?B?dVR0OS93TmpwM2ZGVjQ1aUN6VFhWQ2crVGJkK1pCcU9EVXBYbU9ncStJSklj?=
 =?utf-8?B?aTZONTg3cHJ5U1JONFRlZXgrVE55cHZNcUZIMWRkWmZhNHVjRTA3b2pIRHE4?=
 =?utf-8?B?eVY4T01YQ0R5VjNiSWJZT2x6cTBOZG9lNnFBc0tWN1NqdzVVdVdtUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 691806d7-2d08-40e2-614f-08ded91f6ca0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 16:23:32.4410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Io2YUB8a9OPpeGJ6nzs2aDFP79XPkdOpIzaFhr7vX3/rp35E9/q3fRhdEFjgFVvAXwFHyuBqvXp4gniZfABF9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8688

On Fri Jul 3, 2026 at 4:29 PM BST, Jahnavi MN via B4 Relay wrote:
> From: Jahnavi MN <jahnavimn@google.com>
>
> Implement a dynamic debug logging mask (`debug_mask`) for the
> `rust_binder` module to allow dynamic runtime configuration of log
> levels. This enables parity with the legacy C driver's debug mask.
>
> Since the Rust `module!` macro in the current kernel build does not yet
> support declaring module parameters directly in Rust, we define the
> `debug_mask` variable in a C companion file to expose it to the kernel
> runtime and import it using FFI with volatile reads.
>
> To verify the setup, instrument process lifecycle events (open, flush,
> and release) in `process.rs` under the new `BINDER_DEBUG_OPEN_CLOSE`
> logging mask. These entry-point events are chosen for initial validation
> because they represent the start of the Binder lifecycle and occur
> at low frequency, allowing simple runtime verification of the dynamic
> toggle without log noise.
>
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> ---
>  drivers/android/binder/debug.rs            | 49 ++++++++++++++++++++++++=
++++++
>  drivers/android/binder/process.rs          | 15 +++++++--
>  drivers/android/binder/rust_binder_main.rs |  2 ++
>  drivers/android/binder/rust_binderfs.c     |  3 ++
>  drivers/android/binder/thread.rs           |  1 +
>  drivers/android/binder/transaction.rs      |  5 +--
>  6 files changed, 71 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/android/binder/debug.rs b/drivers/android/binder/deb=
ug.rs
> new file mode 100644
> index 000000000000..5e4daa823377
> --- /dev/null
> +++ b/drivers/android/binder/debug.rs
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2026 Google LLC.
> +
> +//! Binder debugging helpers.
> +
> +#![allow(dead_code)]
> +
> +pub(crate) const BINDER_DEBUG_USER_ERROR: u32 =3D 1 << 0;
> +pub(crate) const BINDER_DEBUG_FAILED_TRANSACTION: u32 =3D 1 << 1;
> +pub(crate) const BINDER_DEBUG_DEAD_TRANSACTION: u32 =3D 1 << 2;
> +pub(crate) const BINDER_DEBUG_OPEN_CLOSE: u32 =3D 1 << 3;
> +pub(crate) const BINDER_DEBUG_DEAD_BINDER: u32 =3D 1 << 4;
> +pub(crate) const BINDER_DEBUG_DEATH_NOTIFICATION: u32 =3D 1 << 5;
> +pub(crate) const BINDER_DEBUG_READ_WRITE: u32 =3D 1 << 6;
> +pub(crate) const BINDER_DEBUG_USER_REFS: u32 =3D 1 << 7;
> +pub(crate) const BINDER_DEBUG_THREADS: u32 =3D 1 << 8;
> +pub(crate) const BINDER_DEBUG_TRANSACTION: u32 =3D 1 << 9;
> +pub(crate) const BINDER_DEBUG_TRANSACTION_COMPLETE: u32 =3D 1 << 10;
> +pub(crate) const BINDER_DEBUG_FREE_BUFFER: u32 =3D 1 << 11;
> +pub(crate) const BINDER_DEBUG_INTERNAL_REFS: u32 =3D 1 << 12;
> +pub(crate) const BINDER_DEBUG_PRIORITY_CAP: u32 =3D 1 << 13;
> +pub(crate) const BINDER_DEBUG_SPINLOCKS: u32 =3D 1 << 14;

This should be defined as bitflags:
https://rust.docs.kernel.org/next/kernel/macro.impl_flags.html

> +
> +extern "C" {
> +    static rust_binder_debug_mask: u32;

It's UB for this to be mutated. This should either be `static mut` or
`Atomic<u32>`.

> +}
> +
> +/// Checks if the given debug logging category is enabled in the mask.
> +pub(crate) fn debug_mask_enabled(mask: u32) -> bool {
> +    let ptr =3D &raw const rust_binder_debug_mask;
> +    // SAFETY: `rust_binder_debug_mask` is defined in the companion C co=
de linked in the module.
> +    let current_mask =3D unsafe { core::ptr::read_volatile(ptr) };
> +    (current_mask & mask) !=3D 0
> +}
> +
> +/// Prints a debug log if the specified mask category is enabled.
> +#[macro_export]
> +macro_rules! binder_debug {
> +    ($mask:expr, $fmt:literal $(, $($arg:tt)*)?) =3D> {
> +        if $crate::debug::debug_mask_enabled($mask) {

The mask should probably just be an identifier and then the macro builds th=
e
full mask, so crate::debug::... is not needed.

Best,
Gary

> +            kernel::pr_info!(
> +                "{}: {}\n",
> +                kernel::current!().pid(),
> +                format_args!($fmt $(, $($arg)*)?)
> +            );
> +        }
> +    };
> +}

