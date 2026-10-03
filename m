Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020091.outbound.protection.outlook.com [52.101.196.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728FC1A3160
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791034289; cv=fail; b=hwNpGSmkXMrm0hJfa6oeegON5CEMQdKMcXPbBySl9SvY0hMCBclFKjOXmKNsAzs8tuHZkgFb+i6aiYjCzPy7YDrsEgFqCqqAyOZwdr/C97N4rV96lcM76XlU6etgqBZ6kkRcuEBUbTOHVUfsWBAgybQn3QuybfQvDlXbA7aEGCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791034289; c=relaxed/simple;
	bh=eOlqsejbRSTHOX6SGnBewST76jiNTXlm8QBkSElD1dA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=mAiqvDsKCeOQ5B1cFhpXrAJB7INObF4DabOVWauBnjVYWySui4ohItmWZmUJ/8XnKH/gvJoilRcIj5ape5U/hHM+84l2mliKAl8NaQlFJirnwAr6cpEx09Z7/VI15RHPwZpUHM6Mr30/R5TWhOB5Fy0hSE+Sua8+oZEDeVPppxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=K6f28ZHj; arc=fail smtp.client-ip=52.101.196.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="K6f28ZHj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5cjoshC0MEE+3u7WyY0hVgqBjqEvXX7Rjc5PaiHLJio3sowXGjqTl7l/i7WAd0Qgoo4Rb685Tl9H4xxzQG83GppvMH2B+JIMmfIVfkszfpqDIvaCVA1TATZLNsNpSXAY46EGPf6WJAh/7yYp8iyi/qZc9QAQznlB0RYjuaGb5Rl9KyGeiZnjMzbJlnrd6D/WPI3baIDm1Qc798hz2UV72uHnXFCCVTDeeUONdztZbGwCwvraKBRJZwVQoESYAFbnIRMvtVS+n53W1OQH5GvEz+/AONV/XvqCIq+uJ6UVRtDaM1SB95aaSKBrnV+nEYgpaujUhr1H6YURt0p0x9bpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfoBS/r9TFBZVY9RV/3J8Tu+/YFTfASNI03ukrdSC0E=;
 b=BgpM22EzT150fVdgGqxRRbBUb9MmaQlO367FzsRblw3/N+x2nKEew5cqjijJbzDkWGWpQe14DGANp9PaWw07EG3gYEBI7DWHPC/0m4FmJX2pEFjCaPnCwakbpOvWJOiAVInkCSxKxavsnVY4cmYYR2a2PifF2I05Hu0QE8xaRHBxDckjima2C+f0rYnHCAkZhJcwK11gP7h8knj657FeXvkqp0uhHLcCU/l040lHL7KeI9SlcN3DUYUm8VRxv3qvJkV0kP8bn5FEJ5aHTnSpRwHBtfs6HRJMS+7WqGcFP8CG7PWAx8Ew/PrZWylWRoKHFHpDeDc9SuvdQRCo7jtVGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfoBS/r9TFBZVY9RV/3J8Tu+/YFTfASNI03ukrdSC0E=;
 b=K6f28ZHjj9QNz6p06cL/KY7r6ItTO54q8VPEnouO+vDdjcpWY+ovsNdqYTNj0FjmTNdrX1YJB16iahmJ3KB9ApVD2eLqMEzrNWVTgRDRA/qdIY/VzGUvMjASxBhmeIoz6gNtAaJY2NoSvApPym78XijFek6sK9bYLFTAgmnslvE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB5845.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 13:31:23 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 13:31:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 14:31:22 +0100
Message-Id: <DLV8NYP3W5IC.WI8BE5QRCN6R@garyguo.net>
Cc: <a.hindborg@kernel.org>, <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <boqun@kernel.org>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <gary@garyguo.net>, <lossin@kernel.org>,
 <tamird@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2] rust: compiler_builtins: Fix silent trap in
 prohibited intrinsics
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <ojeda@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261003124828.119912-1-tomo@flapping.org>
In-Reply-To: <20261003124828.119912-1-tomo@flapping.org>
X-ClientProxiedBy: LO6P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::19) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: 92bc1d56-b976-4aac-f65a-08df21529dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016|23010399003|6133799003|22082099003|18002099003|10067099003|13003099007|3023799007|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	jcFqIifkW3DRxnbNZbNLxFMqwUJA4P5sl2ch9Yjady3U10PgWrSRQi6bHq0aacPQYrdzaHWa3cKCuZUyh0eDVEz4dzMGhyx+h/x0K26i5yHK3XsxG+tYbZmeUvk0CeT025WO/8sRZODsDgC0qwiifm0v66BLAogoZ+3OvZhwL0WAr6MhKejgZQWpYlCVCVRQT3rx/s2ua2JCHnsCtdS81RXD8Vqnf3zSEtksgOR9QsY8WTtLpUsAT2oD4nYIOch+hbHFl+9qVglFuhxhENQTlfxoaB3Ibci23RxXtHlfOVYS13LGRYn5wr5N2AUBXL6gBl0QR4IVqhnOChWuvsr42I/vVuMZv2QKWS/TTFLeIJDbN9m0uu6zB+Y4GDp6rU6NbQu+5K+wJJZbENfCrX2x1zsb9BuO3bN7lg5Femib77pRpC9z8/Yorf7HTUF5cLbnPBW9RG+hEPiQVEAOx17fvHyN02H16ipMZ2f1e1G8sMf22uibYNqPgjzcrM+JBvV7ptO+SQVyYsELMCz6FPYzxmlxeYWtv3yiIxQU95rgavvOjY5gQp+fKQKjvs3NGgluOwbmCpEwmngeusCKrbu32ncGrKJayAMMQMejkSFDE/4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(13003099007)(3023799007)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVhmWkYwRUU5RGc4VHdRcGNRemNjWTdqSVpFM3dKbjVNQVFucWx3d29CRzV6?=
 =?utf-8?B?REUvNHBUUjd6TDVPKzJEeTNMSWhnYmlCNU95NjU3VWh5R0lSMU14bmpYcFo5?=
 =?utf-8?B?OFV1NzhoVlR1RThkK3dTQUF5dy9CbjZVZXZoMGg2ZVkwWnFnVTMxQzZkM1JS?=
 =?utf-8?B?R0pMVjQ0TTdKTFNZVmpGU2x0MmZjL3FTcUU5ODZqeG1WZ2Q5SHJoMDBQQ3hv?=
 =?utf-8?B?MzJpK3EvSkdFbFdmQTJ5UEFuN094SE40VVVtNTAwdjVxUHpCM3oyVmtlMVlO?=
 =?utf-8?B?ZjNud1lINkNxSEpMTTVNVFFGTzdCVFk4YS9WR2hXTWtNYUZ4aWQxZFJwVmN2?=
 =?utf-8?B?MkZBZUlpUm9uQXRkZDFwMjd6cFVvazRnU1FRK0YrMXMxSjlkb3kzMkhCUW5T?=
 =?utf-8?B?bkZTT1pYM2RQM2h6Uk55ejJ3dnlta3QvaFI0bU1hZjRiaTlSek1nL0tMSXpr?=
 =?utf-8?B?Vjd0bThTL2N0bFNYZ3RRV25XQnR2Yy83SXgyUHMzQWdqREs5MDkwTHB4T3Fk?=
 =?utf-8?B?U2kzcFJocU1ETlNDOHJqVVR0SDZDL3FZclkvNXhBNzFrZmpRTXI4VzV0djJa?=
 =?utf-8?B?K2FEK2NwRVNlaEc4WTZXUE5CYkpQVVRQK3paRjEyTEdmZ3FkRnlvWWZKZ0Qy?=
 =?utf-8?B?Ynk3RWVhS0VJdWRjQXpZZENaODJBRUlBOGJmNFd6VWFjamlCUGJhSnpQTmRa?=
 =?utf-8?B?T0I2Y2t0UnhmWDNTOUZkQmlpVUtHcCtPU3I0dmJXU2pUZ2UwWU1kZHllbW96?=
 =?utf-8?B?NTVSUkRVUGUzZnVNQ2pwbnd1MXd3b3pjcHdtM00xeW52aGVqZVZTaVliREVk?=
 =?utf-8?B?WFJMTjhSd0VTc2lpUmVrMHV6WVFLVElqdUF4K0lKeUtCTnF0YUc2MkQrT3NQ?=
 =?utf-8?B?dW1ybjNyQmUzTmREQ2Y1bEx2NG02bWdrUG1iVDJrd0Zwemg5bnAxcjNTTCs0?=
 =?utf-8?B?SXNoamlDZzRIS2MwQjYyZUFDT3NUbE5OVVB5bWRmN3ZvdXZUOXpWUzJJWFFD?=
 =?utf-8?B?NVhYT3NxNVhpL3lBaEZqemV3WHZmZWRqS0dwdEUrbk82MUVXZFEzMzFsTFkz?=
 =?utf-8?B?TXNKbzBpaVhzZjRjazllTm4zOWwwaVpvcjM5NlhoSks4dTZNREUxZnF4R2ZP?=
 =?utf-8?B?bmR4TkxmeUgySzhPWC8wMmNLem0zd2hzU1RadFEyZGxuYnpaQUJhZTcxdytY?=
 =?utf-8?B?a0FMWlVGRk05dU55eUFzVVlSaVBFSHJVRGV1Vzd2S1hYTllsc1hNVFN0b1FD?=
 =?utf-8?B?MmlrVmZXU1pnQU1DV3BIWlhoOTVac0NVQ2FQZThIVVlWREJNanJmQ1FkSTUr?=
 =?utf-8?B?ZGxMRW14czYxS3ZrT2tZSW5FRFVWZytqMExQeU5ucEFHaE81cE93YVNxMmI1?=
 =?utf-8?B?SjJhREVJVWlkYmZuRStoTWpYMnBFM25kdUpkWTR2TTJ1R2h1OHpRY09wUGZC?=
 =?utf-8?B?c3pRZnYydGFkanpzaUdvbnVxUDRZcldBWGV2UklvaDNZcFU2RDRVZkowK1My?=
 =?utf-8?B?Mnh1eWt0aHdvcll2eVhOMVFLRjFPd2E5aS8xY214MlhFc25kWHJ0M2lCWVEz?=
 =?utf-8?B?M3hpalNmOFAyM09LR2p6QzZlL29VNndDdTN6ZHJmcUlQT21hM3BUckFOa1NX?=
 =?utf-8?B?QmpldmxKd3JKN2RReG45WjRDYS9GRU1xTFkrQ2VRZ1lCSkxzbE5mbE1BaUVR?=
 =?utf-8?B?MzErSjhiU0tzOHVUZVVtWkU4R1paQXdpaWNVcTV3WXRYM0swUTJmUHNpNksz?=
 =?utf-8?B?c24wTHFGTzJ1ZXBaUDRud0Y4bFIvaXExWm5zYnhVM2F2TVgzOG03Y3NGQ3lr?=
 =?utf-8?B?a245bjNkSlZLTWFiNFhqd0Uxc2E4ZkZUSWVLK2VCc0w4TG1KUmpyeVV1bWpy?=
 =?utf-8?B?aGJwSUVpOU0xdHg3ZUFYaTZweDZ3Vnp2RHdQczU1WXM3UlBNd25MWmF0M01B?=
 =?utf-8?B?OEkza1NZbUlOQTN2ZC9McXFkeWJWbEdiTytGcXorVzNNK0hxMVJLVmpwTmVw?=
 =?utf-8?B?MlE3Vmh1TGpRYjZVUElUQWJibS9JRTJUVFV5ODhTM3ppUUVISUtZMVlhZDY5?=
 =?utf-8?B?YUMyMmlXckFvdXpYWkR0QmxJeEFYeHo5K3orckJTRXhJOUg3ZjJ4WUVrbTVr?=
 =?utf-8?B?SnpVT0d5Z3NvTE4yanNiaUZka2Y3eWk3dWJIbjRKdmxTT2dUelJxcjFqUURs?=
 =?utf-8?B?dmR1Q2Z2ZnNIZWV0YmdFVmU3TnFBdDlzeE1CeEFGZ09YT3NYeXpBNS80UGdk?=
 =?utf-8?B?TE5Kb0t6cEtLY1gvTG94RGpMZGRMSWpjWVhaUnYyeXc1dGFrc2Z4VzFtRWNm?=
 =?utf-8?B?cVR6d2ZtWXpYbnVPVUdlcHgybHdncklBT2cyM2ExekZoSUJOd1FiQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 92bc1d56-b976-4aac-f65a-08df21529dfa
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 13:31:23.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ud1IFg20RHauq8Cy4xfqbdruKcLg+6t4m0ZCQ5oOpGl0k/Ae6db8D8odROatAQ0F7LeYMpFCfBc6yQXviOPeEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5845

On Sat Oct 3, 2026 at 1:48 PM BST, FUJITA Tomonori wrote:
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
> Move the stubs to the kernel crate, where panic!() works as usual. Add
> the name of each stub to the panic message, so the stubs are no longer
> merged:
>
>   rust_kernel: panicked at rust/kernel/intrinsics.rs:56:1:
>   __udivti3 called: `u128` should not be used
>   kernel BUG at rust/helpers/bug.c:7!
>
> compiler_builtins.rs is now empty, but the crate is still needed because
> rustc requires a `#![compiler_builtins]` crate.
>
> Link: https://github.com/rust-lang/rust/pull/122580 [1]
> Assisted-by: LLM
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
> v2:
> - Move the stubs to the kernel crate and use panic!() there, as Gary
>   suggested.
> - v1: https://lore.kernel.org/rust-for-linux/20261002014739.2566289-1-tom=
o@flapping.org/
> ---
>  rust/compiler_builtins.rs                     | 93 +------------------
>  .../intrinsics.rs}                            | 26 ++----
>  rust/kernel/lib.rs                            |  2 +
>  3 files changed, 12 insertions(+), 109 deletions(-)
>  copy rust/{compiler_builtins.rs =3D> kernel/intrinsics.rs} (74%)
>
> diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
> index fc6b54636dd5..87c19c22b107 100644
> --- a/rust/compiler_builtins.rs
> +++ b/rust/compiler_builtins.rs
> @@ -6,15 +6,9 @@
>  //! Since we do not need the vast majority of them, we avoid the depende=
ncy
>  //! by providing this file.

The above paragraph needs some rewording too.

>  //!
> -//! At the moment, some builtins are required that should not be. For in=
stance,
> -//! [`core`] has 128-bit integers functionality which we should not be c=
ompiling
> -//! in. We will work with upstream [`core`] to provide feature flags to =
disable
> -//! the parts we do not need. For the moment, we define them to [`panic!=
`] at
> -//! runtime for simplicity to catch mistakes, instead of performing surg=
ery
> -//! on `core.o`.
> -//!
> -//! In any case, all these symbols are weakened to ensure we do not over=
ride
> -//! those that may be provided by the rest of the kernel.
> +//! This crate is empty, but `rustc` still needs a `#![compiler_builtins=
]`
> +//! crate for every crate it builds. The stubs for the builtins that sho=
uld
> +//! not be used are in the `kernel` crate (`rust/kernel/intrinsics.rs`).
>  //!
>  //! [`compiler_builtins`]: https://github.com/rust-lang/compiler-builtin=
s
>  //! [`compiler-rt`]: https://compiler-rt.llvm.org/
> @@ -24,84 +18,3 @@
>  #![compiler_builtins]
>  #![no_builtins]
>  #![no_std]
> -
> -macro_rules! define_panicking_intrinsics(
> -    ($reason: tt, { $($ident: ident, )* }) =3D> {
> -        $(
> -            #[doc(hidden)]
> -            #[export_name =3D concat!("__rust", stringify!($ident))]
> -            pub extern "C" fn $ident() {
> -                panic!($reason);
> -            }
> -        )*
> -    }
> -);
> -
> -define_panicking_intrinsics!("`f32` should not be used", {
> -    __addsf3,
> -    __eqsf2,
> -    __extendsfdf2,
> -    __gesf2,
> -    __lesf2,
> -    __ltsf2,
> -    __mulsf3,
> -    __nesf2,
> -    __truncdfsf2,
> -    __unordsf2,
> -});
> -
> -define_panicking_intrinsics!("`f64` should not be used", {
> -    __adddf3,
> -    __eqdf2,
> -    __ledf2,
> -    __ltdf2,
> -    __muldf3,
> -    __unorddf2,
> -});
> -
> -define_panicking_intrinsics!("`i128` should not be used", {
> -    __ashrti3,
> -    __muloti4,
> -    __multi3,
> -});
> -
> -define_panicking_intrinsics!("`u128` should not be used", {
> -    __ashlti3,
> -    __lshrti3,
> -    __udivmodti4,
> -    __udivti3,
> -    __umodti3,
> -});
> -
> -#[cfg(target_arch =3D "arm")]
> -define_panicking_intrinsics!("`f32` should not be used", {
> -    __aeabi_fadd,
> -    __aeabi_fmul,
> -    __aeabi_fcmpeq,
> -    __aeabi_fcmple,
> -    __aeabi_fcmplt,
> -    __aeabi_fcmpun,
> -});
> -
> -#[cfg(target_arch =3D "arm")]
> -define_panicking_intrinsics!("`f64` should not be used", {
> -    __aeabi_dadd,
> -    __aeabi_dmul,
> -    __aeabi_dcmple,
> -    __aeabi_dcmplt,
> -    __aeabi_dcmpun,
> -});
> -
> -#[cfg(target_arch =3D "arm")]
> -define_panicking_intrinsics!("`u64` division/modulo should not be used",=
 {
> -    __aeabi_uldivmod,
> -});
> -
> -#[cfg(target_arch =3D "powerpc")]
> -define_panicking_intrinsics!("`u64` division/modulo should not be used",=
 {
> -    __udivdi3,
> -    __umoddi3,
> -});
> -
> -// NOTE: if you are adding a new intrinsic here, you should also add it =
to
> -// `redirect-intrinsics` in `rust/Makefile`.
> diff --git a/rust/compiler_builtins.rs b/rust/kernel/intrinsics.rs
> similarity index 74%
> copy from rust/compiler_builtins.rs
> copy to rust/kernel/intrinsics.rs
> index fc6b54636dd5..2df9841ea781 100644
> --- a/rust/compiler_builtins.rs
> +++ b/rust/kernel/intrinsics.rs
> @@ -1,10 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> -//! Our own `compiler_builtins`.
> -//!
> -//! Rust provides [`compiler_builtins`] as a port of LLVM's [`compiler-r=
t`].
> -//! Since we do not need the vast majority of them, we avoid the depende=
ncy
> -//! by providing this file.
> +//! Stubs for builtins that should not be used.
>  //!
>  //! At the moment, some builtins are required that should not be. For in=
stance,
>  //! [`core`] has 128-bit integers functionality which we should not be c=
ompiling
> @@ -13,25 +9,17 @@
>  //! runtime for simplicity to catch mistakes, instead of performing surg=
ery
>  //! on `core.o`.
>  //!
> -//! In any case, all these symbols are weakened to ensure we do not over=
ride
> -//! those that may be provided by the rest of the kernel.
> -//!
> -//! [`compiler_builtins`]: https://github.com/rust-lang/compiler-builtin=
s
> -//! [`compiler-rt`]: https://compiler-rt.llvm.org/
> -
> -#![allow(internal_features)]
> -#![feature(compiler_builtins)]
> -#![compiler_builtins]
> -#![no_builtins]
> -#![no_std]
> +//! The stubs are here and not in `compiler_builtins`, because code in a
> +//! `#![compiler_builtins]` crate cannot link to functions in other crat=
es.
> +//! There, `rustc` turns a call to [`panic!`] into a trap that prints no
> +//! message.
> =20
>  macro_rules! define_panicking_intrinsics(
>      ($reason: tt, { $($ident: ident, )* }) =3D> {
>          $(
> -            #[doc(hidden)]
>              #[export_name =3D concat!("__rust", stringify!($ident))]
> -            pub extern "C" fn $ident() {
> -                panic!($reason);
> +            extern "C" fn $ident() {
> +                panic!(concat!(stringify!($ident), " called: ", $reason)=
);
>              }
>          )*
>      }
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 7225abc64084..b19d07f0c6f7 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -88,6 +88,8 @@
>  pub mod init;
>  pub mod interop;
>  pub mod interrupt;
> +#[cfg(not(testlib))]
> +mod intrinsics;

We might want to explicit that this for redirected intrinsics from
libcore?

Best,
Gary

>  pub mod io;
>  pub mod ioctl;
>  pub mod iommu;
>
> base-commit: 2dee3d3adcadcc57d62ba6608cd02f50b0c10264


