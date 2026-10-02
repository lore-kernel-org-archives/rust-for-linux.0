Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021106.outbound.protection.outlook.com [52.101.100.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E2447ECF0
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935592; cv=fail; b=CQSUeYJPW2Yz1ZQbcwX0CSwgs0ZjgoF5j65sBwaNszb6D7GOQxpZPjXdL8jDLyGWNnlF/Xgc8AyziP3SsNOHY+TdmIaCiT7RhfoPnhq48wMr2ljtgOTb3fOyy/yDkx2PPu/2+hlMe5vHlXjBGDs1jJ+NX4wcnKDS0G9bJcYGGHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935592; c=relaxed/simple;
	bh=DTJPU4IngieKzQv+21jwx7ehM5e2bhKjbVAr5srh4Yg=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=JkTOnCuvzIVl2NxjXxWsMbh+U9YjframhVgFurjgRtQK/wIx2U/IQ0eDtjwSld5NYD8XH2KTO756ivbdz5l15ERqvV54LFHg9xn2u8LK/D3WKnnJ2MqJvI7ZKm8XQ5AdSZgTeqE70RJAr6JfYGZVlIEL7pdKhNF3sv6H2ywjZQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZAkjRmA4; arc=fail smtp.client-ip=52.101.100.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZAkjRmA4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qw/zMsDq+Qgt6Nb1vQo6OuYTE7z4MkcrdcRR/DMPhuLyr64BdoI8J/Ynt0s+A9wnJdpvU7TdcuMA0LvEuIQK4AFPY6tJoKi0kEykpZ79wOHhLzzbejiV4mhkcBRMHkTbmohFS5JVHL56FBZJYTk4Dbi8RngEa2c8HJwBwXg7xb1e/7EYSN0kI/Q4ViNgAWbK72TUV8DUYDR8SIQKcfmElTm+kX0D6/OGcLgmmGt8cpN1ZjHOaEywhD53wypyMVukK44lDcD/ZFTi14a6cAgxiwIAu60ZVgC9gC5xFxDMfkNHwT81XbKQwlhUVcIq3WK2EkEP0B/ID26T3qq/9Uo33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iNw+z/vgBtxdir7Oprh4ieQk//uUs5KgwddNv6zFME=;
 b=WtOaVAgkyityU7iuPYI/fGUkgkchOPHGrxYMm2M6pHEtBXLCgGQB4IQdbtAj91/VjjZRxQuUWWPcM4IWWMPyKU2gpR1xEzluFsO+9PRe8Und543I9Skt8Obk1UR1wwuH9b9EiIH1/aWFa+THYFptm5gnPn2I2SbDYbtk89gWM4utD/ki8++M7ulAuXJ7fg21K8fNVOldszbajWBKluC8QQo1By2NqAxGgOfustyH1GQTkfQqLeDGdErDvSc65xbqwf+xUbCM6ydwjWN1MFCDtBrs9ORyrqka7uCwqr+dqs16AM94Lcfz8ptTU6dyAL60gkiD/XzwM51V9S6xGjyS2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iNw+z/vgBtxdir7Oprh4ieQk//uUs5KgwddNv6zFME=;
 b=ZAkjRmA4+yEOntjVZTjfW4TZUfD1/pox1pcV6NjiA4VC0ppL6VpSiXHSjvRIoi9yKV0SbPswEalWRfnNPl/diTuXWsSnEhAKSjlmUQUPR6J1wwWsyp/xIa5mRoCOmz5DVoHlNS2YSwKtlsD3kSpRBh+LzYnywt1eUr1Uv+wSD44=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB3174.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 10:06:25 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 10:06:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:06:25 +0100
Message-Id: <DLU9OHS5VLBN.27ZL2Z15IGB78@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <ojeda@kernel.org>
Cc: <a.hindborg@kernel.org>, <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <boqun@kernel.org>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <gary@garyguo.net>, <lossin@kernel.org>,
 <tamird@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: compiler_builtins: Fix silent trap in
 prohibited intrinsics
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20261002014739.2566289-1-tomo@flapping.org>
In-Reply-To: <20261002014739.2566289-1-tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0208.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::15) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB3174:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4c9c37-d5fd-4c17-b5bc-08df206cd1b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|366016|7416014|376014|10067099003|56012099006|5023799004|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CVcRzmfZhVYU/ST52KIVn6/Dy4aaspRo1EeT43rvAbli93OVyDFuVZSrUYp30/WCwP77sIcDbsebXg3JROO/SRAzN6OnFNSP2NYpghjMN+W+FdFF7vkczxrsT9YwbU8Zsy2d3Wt3G64KkGrjniCZ4XCc7YD3Mf7i7O+tcExm72TFM+YGsLFeHMgxiESbP2yCZjiaV17yGXqxv7DkMhmV0LIAtyCNmxdNDZEAjzld8pUv/mzMwSh2JK+9OJVFn3BwWtxQWzS8eCDqeO/FqEDANb31vR5/8fsHJyunK/UNT5yYWWO6oPtLP160O4+x2yCOq4szDdYTxj2fvzAXQnfQ1UKjGvfH+bBopDQjUl56qZD5fdNiwrc8AyJt+CZ1hnL1x8wMUYPxb6hku6jsGJnEYtuOrYrtuLjEFS7hs0DGniV7dWlEgJ6Cp2j3vXNuLwT3et6eQ/Wrisgtodi3QJQmuvbXAqwkPK2ojUpaWYaA1T7Phi+GQHbNeGqXumimrWGBj9qBmGFC/7iEg2bujAFN7Pg58vYIa1IVLqkZrREnnMbkXH0QgnaR5O6b4nJy4bCIKCvU5KNgcXcF96EAIQVwm1fVxxF4GJXUVneqcaozlcrCNdjwATB/oVyN4MX3PNkKHaftNjY5mD1R74aVLKcEFEOPMVW1OHkrvbS+oEZO74k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(366016)(7416014)(376014)(10067099003)(56012099006)(5023799004)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak9VWU1TY1lYU2ZaVGRYZlFacGhUL09xRDdNVXQwcE9SUm1id2FGOGhmcnYz?=
 =?utf-8?B?YU51djdHSGg4bXI3ZDdKaGU1SVdKZ05KTmtNQXBwc2ZTN0djVnIyMjFlZXpL?=
 =?utf-8?B?R1JRT1ZDdnVvTkNqbXNxS2FBYzZaQ0x6aTExSkk2SGdWaTUwSnZKM1NPOUox?=
 =?utf-8?B?QTd2S0NkYitaMnN1YXYxajVaNllheXN6UzdsVVpxcHA2cWVJLzQzcTExbmEx?=
 =?utf-8?B?WHNzbjlxZ0YrUWF2emd2WDZURjJmV3o4eGNHWUdIa3krQUw0bTlWd3BKK3pv?=
 =?utf-8?B?RXVJZ1ZlR20rcHRkaHgxNnlaZnUvWnF4cFNhL3RPSnJPTnpFdUk3clJWbUQy?=
 =?utf-8?B?MVRFQVVQazliNWVOVFZ4SUhOUXF3WHRBOHVXUUVtTFUyS0pjTzZxaUp3NHdQ?=
 =?utf-8?B?L2J4dWhFdU9Ia3M2QXJWYXZuS2FnR2NtNHExWFgraWhiMVkzYnVLb2dyU2pN?=
 =?utf-8?B?MCtRa0FqY3dTWTNsaFA2QWJmRUt2c1A4MG55SHJ6cG4rWlFLZTVMOCs5MVl4?=
 =?utf-8?B?VWRzeWVVMHhJNldtTHcwZTc4Uk1QSkVqR3MvUW9peExJTDNrSGRxUVVSV054?=
 =?utf-8?B?UXJpbFZWSmVmSzZoNzVydDIwSVlXb3hJc0Z3ejI1ZFNkQVE4ei9ocXZ2SHkv?=
 =?utf-8?B?OTVNR0t6dmxiTnF0QXk2bmFWaXdoRHkxVllBcG9vZjJOZzJCT3VKbnBvMUpl?=
 =?utf-8?B?Tm5vRi9BM01zU0pYWFJoS015em93Q2xSdnhiakJRNGR1R3pwMHFGM2k2MHJC?=
 =?utf-8?B?UUFTZEgrcFo1RWxZQVhwSy9MalhSeG9VdEJPSDJsZnUyTjdCb2YwNkFpUGpm?=
 =?utf-8?B?alNyT0NaSHpjcFBqN1pWdGdxQXRGL01TNXVzZVF1NHNsY1lpMUlKRDlOSlEx?=
 =?utf-8?B?Qmg5Z0NxOS9NcEg5bXJWNUFrOWlQeXdSWUJ0SmxvQmFZbjJZS2NsNmM2MGdH?=
 =?utf-8?B?Y2hLL0RYTHZ5c0MwZ002OUV4OTI1aG5teU9TeHN4ZjNXS3ZMWGRUNVpFNU1r?=
 =?utf-8?B?aDFsZGlPTE54RFcwWnd3MG1hanlzci9CMUlnbm5Hem9pUjJXVkY1cVJyMnQ5?=
 =?utf-8?B?K05DWXZWbDYxR05FZzM5cWs3SmxlSnk0NmdjL0dxbGgzZ0NmWkdwUkFVSUFZ?=
 =?utf-8?B?YU8zdm1ER1FLdmMyMHpMRVZjR0NJYjFGSHp4eWlYc1FyZE5XdTh0WHFDWGFT?=
 =?utf-8?B?VWNiQUgzVVVONzVKeW1sYXg2bFdMVmdNL3pJV1dzWTB5eTIzWXlBcDVueWxw?=
 =?utf-8?B?L0RCaXNKSDJHRUQ0c1ZxYkV6c1hnc1ZwallLWDN5QVI0VGI4d2lyY0VRTEVS?=
 =?utf-8?B?MGNCSmFydmFVNTk3ZTFIMkZKUHZsVEVhblNEQ2JUc1VPaEpLTFNZc0RIbkpm?=
 =?utf-8?B?cy82a0RQK0QwYVVSTVJteVlMWDFEdnBWeVEzdm81a3k0eXcyQ3dwVGF1b01Q?=
 =?utf-8?B?VDl6dXdqcUV5NmVQaUdhQnJSOEUvakNkV2Z0QTZBN2Zsd29kZEVjL0g0RTdv?=
 =?utf-8?B?TGMzNWtzbHJkc2dINDFNczZoNE8wMyt4dDVxNllaOTVYZTJzYytYb3V1RDJ2?=
 =?utf-8?B?VlVPd2xtYmJHSVd3ODVYMjNTT3padVJOVVJXTTBMUkZYelJiZGlqeWVPZ1U5?=
 =?utf-8?B?KzJhSlNJc1IrUlN2emZ5OGRwVi9JbWkrbUtvZWswRnpma0FKUGtzSStrZlhu?=
 =?utf-8?B?SjJ3WVFhRXIrTUsxQjM4OEF6bWdaM1NJb2poYTlqdlVtaThjWHNIUjlJbkRG?=
 =?utf-8?B?M3gyUnBkaHFWazNRMVc1SlVtYVlaVHFtK0R5bERueVlGTUptNGVQWlJYTGpW?=
 =?utf-8?B?UHNPc2kyOXVxYjE0eEF3OEpDUWhiVGhCVnZxaTJQanFJbktzbWprL0dCaDhP?=
 =?utf-8?B?Nm1YSVlKWmxYL3hrNVFYd2dSVk9uWCtJaTRrNTF0eFNkRlRvc2s0ZXVWT2hM?=
 =?utf-8?B?cCtwWlBGV2EzeGZHSDVFc0RSMk9PVWFJQWdyUDJVRXErSFFnWEc0SWYzR09u?=
 =?utf-8?B?VXBKMGRFaUlOa1JmaUIxRnBGaHhSbnJ6NGVGQTRZWEU1QU9reU1YWWRya2FL?=
 =?utf-8?B?QVJjd0JJNEZCU3lSK1VYTlZWWTNreUg4MExQNy80ZzRIOGtBZW1MME5ROXFh?=
 =?utf-8?B?b0FMOExlVmk4R2hpZXJQS3MvdjFmV3VuWlFLam9pWlI1akRISEIxcVczclpH?=
 =?utf-8?B?eGRrRkZPUmRxaWZjUWdHMndud2xiSGVlOHh6R3NtUWdGdURyRXFTMlZKblkx?=
 =?utf-8?B?ZlBiNE9sYUtzTWxtMnc0T1p6c2x1RzFzZmxvdTF0NjJRVC81K1BqUEJVTW9m?=
 =?utf-8?B?aVNKVWRFRTV5N2tVclJ3VGdJN2h6RnpRVDNYRDN5NjhZcG4xRUNEQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4c9c37-d5fd-4c17-b5bc-08df206cd1b1
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:06:25.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxazyGB2P6pyaa4dSYIvo8RVRBet0vA5VVAdp4z4mYZG459UWwB1B92deDDIjq/vz16aa6oV6YLcjVDZy3o+EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3174

On Fri Oct 2, 2026 at 2:47 AM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> When core calls one of the stubs for builtins that should not be used,
> the stub runs a trap instruction that prints no message, and the Oops
> shows a wrong name. For example, when __rust__udivti3() is called on
> x86_64, the Oops shows:
>
>   Oops: invalid opcode: 0000 [#1] SMP
>   RIP: 0010:__rust__adddf3+0x0/0x10
>
> The stubs call panic!(), but since Rust 1.79, rustc does not allow code
> in a `#![compiler_builtins]` crate to link to functions in other crates,
> and it silently turns such calls that do not return into a trap [1]. In
> addition, all the stubs have the same code, so LLVM merges them into one
> function.
>
> Replace panic!() with _printk() and BUG(), as the panic handler in the
> kernel crate does. These are C functions, and rustc allows calls to
> them. Each stub passes its own name to _printk(), so the stubs are no
> longer merged:
>
>   __udivti3 called: `u128` should not be used
>   kernel BUG at rust/helpers/bug.c:7!
>
> Link: https://github.com/rust-lang/rust/pull/122580 [1]
> Assisted-by: LLM
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
> Another option to fix this is moving the stubs to a normal crate (not
> `#![compiler_builtins]`), so that panic!() works as usual.

I think we should do this.

Best,
Gary

> ---
>  rust/compiler_builtins.rs | 39 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 36 insertions(+), 3 deletions(-)
>
> diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
> index fc6b54636dd5..9416ca4c23f5 100644
> --- a/rust/compiler_builtins.rs
> +++ b/rust/compiler_builtins.rs
> @@ -9,8 +9,8 @@
>  //! At the moment, some builtins are required that should not be. For in=
stance,
>  //! [`core`] has 128-bit integers functionality which we should not be c=
ompiling
>  //! in. We will work with upstream [`core`] to provide feature flags to =
disable
> -//! the parts we do not need. For the moment, we define them to [`panic!=
`] at
> -//! runtime for simplicity to catch mistakes, instead of performing surg=
ery
> +//! the parts we do not need. For the moment, we define them to print an=
 error
> +//! and call `BUG()` at runtime to catch mistakes, instead of performing=
 surgery
>  //! on `core.o`.
>  //!
>  //! In any case, all these symbols are weakened to ensure we do not over=
ride
> @@ -25,13 +25,46 @@
>  #![no_builtins]
>  #![no_std]
> =20
> +unsafe extern "C" {
> +    #[cfg(CONFIG_PRINTK)]
> +    fn _printk(fmt: *const u8, ...) -> core::ffi::c_int;
> +    fn rust_helper_BUG() -> !;
> +}
> +
> +// In a `#![compiler_builtins]` crate, code cannot link to functions in =
other
> +// crates. `rustc` rejects such calls, except that it silently turns the=
 ones
> +// that do not return (e.g. `panic!`) into a trap.
> +#[cold]
> +#[inline(never)]
> +#[cfg_attr(not(CONFIG_PRINTK), allow(unused_variables))]
> +fn intrinsic_called(name: &str, reason: &str) -> ! {
> +    #[cfg(CONFIG_PRINTK)]
> +    // SAFETY: The format string is NUL-terminated. Each `%.*s` takes a
> +    // `c_int` length and a pointer. `name.as_ptr()` is valid for reads =
of
> +    // `name.len()` bytes, and so is `reason.as_ptr()` for `reason.len()=
`
> +    // bytes.
> +    unsafe {
> +        _printk(
> +            // "\x010" is `KERN_EMERG`.
> +            c"\x010%.*s called: %.*s\n".to_bytes_with_nul().as_ptr(),
> +            name.len() as core::ffi::c_int,
> +            name.as_ptr(),
> +            reason.len() as core::ffi::c_int,
> +            reason.as_ptr(),
> +        )
> +    };
> +
> +    // SAFETY: FFI call.
> +    unsafe { rust_helper_BUG() }
> +}
> +
>  macro_rules! define_panicking_intrinsics(
>      ($reason: tt, { $($ident: ident, )* }) =3D> {
>          $(
>              #[doc(hidden)]
>              #[export_name =3D concat!("__rust", stringify!($ident))]
>              pub extern "C" fn $ident() {
> -                panic!($reason);
> +                intrinsic_called(stringify!($ident), $reason)
>              }
>          )*
>      }
>
> base-commit: c82c75ae11fae66cf070562f9b5241a4663f30cb


