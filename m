Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022101.outbound.protection.outlook.com [52.101.96.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEFC21FF2A;
	Mon, 12 Oct 2026 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805264; cv=fail; b=kfTAn8X8CKboMOXw2tt9EiwR/vdavq04CcHGkhc5+lvSFmpADLqtrazh09AORTy85FS0dWwQwN0gXWZoOrA/2tRybYdnXACFFVM2sVVj53hBwPwaVKbiDNgj/HO1qDZixvqO88cs02zeRzAeDp8tW9z2jumVR3IXaM2gmG6jbQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805264; c=relaxed/simple;
	bh=k+Bf3CcnoqtWLETaljg+g4UOPR7DCs1ElOpRQnS49xs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=D+N1CDHBCJSS+zgpGAoahY+C3GrqEcURbfuVStzbiuG4mazMQv3GXC7Wy7vZ0nWDNqSfsnSDwQb1kKmRzEYAWoWwIfkq/taRmfOIw3XYP6uzvUQLYsMkw9oCI5a0hDj0+JKLc2LT3bhcIfGi+5jH89MLbIzXS1aa2EqCI7Jxx7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zzh4Fdxl; arc=fail smtp.client-ip=52.101.96.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zzh4Fdxl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQTamvazLVcOiGdKsDgJ2TnoqlXGVgn+veA25ZfVUzghBL8ku123AkET6TgHCqSCsWGmaUDGDfS9BHwPHa9/S/9VevOoFaEj363H+AtYJDZn9UMk7p6Swu9inkEYRkv1KWDZp/G9rrPdg97VEws1OVtPrvtucxAMR3GRxP/Rcg2Qgfkda4EgwK6aNPSI/1uL89lS7YUVJT6USBqv5hDTxSnHokqzF6ykWEqXqipdjPBvfjVL04VsU3ZDHOQ8OImaiTsarfmPAu1w2pJuMyfomBqcxigRd04aH2Kyny5eSPKmNWSFdWlO2pTVDE7Vwx7qvFCJFEcqpm5Ddy1gxPXc9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T552/l06M7jOFfBFNzO6rJmhRtqr++8AjzJY/Q8HV+g=;
 b=YFA/RMbTaEdYRT60qLLs1k8/0Hs+AjJYqQhLrbWgqcsPkJWSQv4JXQMpRnFPysrXAwz1kQMipuxnoP8KNH9DvjghkUN/nFElkWnQqGR0yENg7C2keKhQSUgOl3wXIeZaRlZV4tE1Vkfv5JbYlvB/yijCr4t6lqmbdwaxNYWgank41NFQQtgjn2lB53RNOfDxBVQdQn+DebSVzFo34qz1lM4qZgqrQYgnGX9O16MpcVu93f9zd1zEytRBLb+jKUhT1TrbA/yt/yU7LGg8n6uTMDYoroTd8ZqNOsevtPnVqxOVyXe72iCALYGgVJ2o8xmNblF9oXBydSo8fej9EaeFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T552/l06M7jOFfBFNzO6rJmhRtqr++8AjzJY/Q8HV+g=;
 b=zzh4FdxlmC+qEnldkSeH2wphNfQlXxVBVtoAFfi3J+ajwStS3bFtAhkW7PGeXd+IA5oLXkJ6GUsjWaBaHR9SZkea3O19s8/9PuQILLcfeqZi0Nxo9yGX3jv+Opx5hYVV5K0Kp654m0dsCP6GyC4Zxn3i0rQfnsM3ZB7quoNSvcg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by LO4P265MB3519.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.22; Mon, 12 Oct
 2026 11:40:58 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 11:40:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 12:40:57 +0100
Message-Id: <DM2TYBTREPLQ.XJ06PWPOXG4H@garyguo.net>
Cc: <lossin@kernel.org>, <lyude@redhat.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
 <will@kernel.org>, <longman@redhat.com>, <felipe_life@live.com>,
 <daniel@sedlak.dev>, <daniel.almeida@collabora.com>,
 <thomas.hellstrom@linux.intel.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 4/6] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
From: "Gary Guo" <gary@garyguo.net>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <cover.1791799751.git.work@onurozkan.dev>
 <36bddd73ca29658a7d01c5a3f3a19ab13477235a.1791799752.git.work@onurozkan.dev>
In-Reply-To: <36bddd73ca29658a7d01c5a3f3a19ab13477235a.1791799752.git.work@onurozkan.dev>
X-ClientProxiedBy: LO4P265CA0035.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::11) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|LO4P265MB3519:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe245fe-1c67-4364-ac2d-08df2855aef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|10070799003|366016|23010399003|56012099006|4143699003|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	hZRSp1ZPOdWMX79e+eCwKheclOcUMINXJvTXZKWsahkIOgil21M2pufflUJfAjHn/kLaEyauJ2yLrcBqkZm5svZbEhzlnwUqepBlNB9z7YoIbfzwtzdmHWoeX2GJtAgdDD/q8Ut1MqqsMWRgI37gIG1DD661tG91Y+n0M3TUQIuazTMFLr9Hvu7UTEn2uo7s0wJDYxNEF7/dUZ92NfEO0yh9Sv+0bvlq3hkg1qZBmiL7gfSANEnrIlcdXcBkCvFwu0/rf78/PYnqPD88tzqw1In7bu6IOZLnjiy5HSZviC04D2JuvwITIHHymWJMtyhOInCRRXe9Mzq+7mAtn9gmo5MK5kz5c49ll6i7X7snKx3/dwg1gjoaMaxOQVuTA73/gnoq1angmrW+1dd9WYRkO4KPGeYB7d655I+So9Rj3o033DqZJ0NKxPfTO7hXhYBOWB4qCrNrFNmhk7NwxTDZJYEf//s0zLZ7wf6WQuicsVaNIKmhuLFMgeRNayDRYtGi8bt3cehg6RkA+p1MssJosGSqIE/YpOKrRUrbgZiIpewBld0JvvGlIqkHFh7yUe9pZxEX+A+qwD2rcPLjA4l5FnZn96ay5FUooKujx4ZUnhNRvGf2vh3uJZpyAqZxKNyOQteViHG88CccAvoYJgS5ILEUOxGIuwSnlRfPV6G8M/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(10070799003)(366016)(23010399003)(56012099006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjBGbExNWGFSNU1YK3NGS3pQdk8rVXovWWozRUg2UWdWaUdpcnlGbndpSmpV?=
 =?utf-8?B?RlV2K0RRVGNMU2R5ZS9iTUF5NHN2cGlwK1NXK0VrQVdpN1ZWSDVzc0c3cWs1?=
 =?utf-8?B?alBJOXhjQkF4U24zUmk5V09BRlB5b3pSZlI2bmhEMU0xc0pvckFBdHFKN2Ur?=
 =?utf-8?B?dEVWOTdOUjhiQThhMkw2aWxGRVkzVHAwSkppWGJZb3dYWFZmUEsyZlZjTkFU?=
 =?utf-8?B?bENuUG5nbDNFYmgvcHJPWENXZTE4MzczMVM3bW95RjBwT2ZNUE0xSThjRlFi?=
 =?utf-8?B?Zi9nREUvMExHY0hTQ1pFYjV5ODBlUnNLUlFZdnV3b24yaGE2N3NlSmx3NVI4?=
 =?utf-8?B?L0Zrd3c4NHBXZlZaSm9TTW5vaU5xU2Y3QUJ4c25jNU1CWnZpbDN6SnVLSzRh?=
 =?utf-8?B?YnQzT1R5U2ZJNFU4UXRiWkhnQnBKUy9pN0VIam5UNWxURlFsRWFCV2owb2Yx?=
 =?utf-8?B?eHJTSzZZOUpVdFpsRE1UQWZJTVE2VFErRkZpUHQvUDNIV0tZSWVIYjZtd1lm?=
 =?utf-8?B?emtxR2RzZnlkTEhsSktBa0R6ZEM5WFN0aW56ZTR4ZVZYTWJEMXBxbWtJMy8z?=
 =?utf-8?B?c3hSWVBlai9wRFVZTituMGdEcWM0S1ppSlcydWhzMkRmbnM2Q2xpdms0SHgw?=
 =?utf-8?B?S0VoWHg1ZjBqRHBhZXFFM3R1M2dqSlBPYmJRQU53aEVZaHVscGhMMFppZ1J0?=
 =?utf-8?B?bmlZSkpPYkdJUzUxdEJMeHpIcWo1dDZnRkRCMXdGMmZhWE5LTndKU2trU08x?=
 =?utf-8?B?Rk50clBGSzlrQ0N3Z1NPSXMwS0VMdUdRbVFSbThRTUZpam5LQkZUV05XeFNE?=
 =?utf-8?B?QUNiQW5PQUFXKzFxek5RT2pTK1RSM3N3S1FQd282UHU2Vmt4NnJUbGFSaC9q?=
 =?utf-8?B?Y1pwTmU0Wmc0NDRtdmY5cDh4V1dDQndUcXhWMnBCNkQ5aGJGVmRwVENpUmYr?=
 =?utf-8?B?TkRYd1ZYY3FwVERiQmczZ0l0a0N5bytacmk1a2VvbStCZUtZVmlXNHVIaTBr?=
 =?utf-8?B?V1p5TmRjR2pIaVMwRzZiQU1KOXhPd2F0c2s1WjZ1NWtWcGhuMHIrbURjU0Ji?=
 =?utf-8?B?d0tLWmVpaExGSFR5dWpmQkhhOUdXblZkK0tyWDQ2NzN6VXd1QXhzUEp4emk4?=
 =?utf-8?B?MnZVSEN0RDRwRTYvaWtEL21kVHF4L0hmek5UVlRveVVGejQxZ0hHKzFodjht?=
 =?utf-8?B?cE9QVjJ3RHRLNy82TnkwQUZVVlcwQi9nbEd2Z1JWUG1BaENzNm1ieDUvU2FH?=
 =?utf-8?B?bnB6TStHRnp6MWZaZks5djFvQ0haRHprT2YxVFdDeGw4V3ZXWXZpSGlpWWtZ?=
 =?utf-8?B?SWhPdmM1S2tOQ3ZiZDdpVmIwUmh5TXovTEJEYnhGYUk4aW9ielBUdXZWVTVB?=
 =?utf-8?B?UkpVdkpDM2lzeEFrWStyQWY1dkF2T2F4SXNkVDdRL3BLY2FtOXpxdXNvRm5C?=
 =?utf-8?B?eHNVdCtibHREdDFINVJmaXFpNHIwNlFBOWNYTDY0MWh5TEw3bmgrTC9ZaWxS?=
 =?utf-8?B?S2JSNDZIZ1lxUGlia3gwZTg4VXBXYzB3MCtHN1NWNkNXUXlPaDJweHZjK0Ey?=
 =?utf-8?B?d1NORFNEZ1Z2c250Q3JEQ0JrVWRwckFjbi94cW84dlJ6MmkvazBZZXhzb3Ni?=
 =?utf-8?B?WEpndGt3L1BKMHYyT24vcXRBTTA0NkNPZDFNMk1TRHd6RzhPd3JIa3psME9T?=
 =?utf-8?B?akdMNlN4QzBiZERZUThYeGlXY01JWVZsUUNNakdLQ09RZWdjZUovMlNXZ0xV?=
 =?utf-8?B?eUNPWm9USGNqUDdSaDBzKy9TUFFwK1ZtZE43NlpzNVc0VkZXM282NWxGbkU1?=
 =?utf-8?B?cC91L1hvN0V6N2NOeDdvT0FzVWx6VFBCQTIxRXVrbWh3cDIzeUgzcG11MEor?=
 =?utf-8?B?bjJhVkZEVnUydExRY3NYTXpiRm9IalJTOElsVjRwYXFaK3RKd1RhMmNqRWh5?=
 =?utf-8?B?SzJOUUEraGRlMVJjSStCTlFMZ09EeWpOU3oyc1NjVmdTTkc4ak5oVTdCekk5?=
 =?utf-8?B?TENMdGo5UmZScHVjYml2NGpuZFJFbTA5TjVGL1BZRHh0QXY5NGE4WUJRdW54?=
 =?utf-8?B?K3MybERmd25XaVM5SXlVK2FFREFHTVUyRjU4UkR2V29PZ3VUa1FIV0F5dXdQ?=
 =?utf-8?B?dlk5aWRVaVVLQ0Q5TGE4VWtwNURRNWN4aEVZc2lTVm9SbllZeWNycStaN3hm?=
 =?utf-8?B?VUZGSHBvRmI1U0JWb3VieTNpYytRRDgraEg3RWRQNUlveG5Ud1FqanFxdTk3?=
 =?utf-8?B?TnU1UGdzOVhQcHhtYzl3VVMwUi9QeXdBNnBnc2xoM3JiYy9MVDE3VHBwQ0ZN?=
 =?utf-8?B?TVpneklkdzRhNUhkSVhpTnB0aGNzbFFhZk1iOEVvcEpkZ0d1SHUwdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe245fe-1c67-4364-ac2d-08df2855aef9
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:40:58.4335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: liExb5xWs3sPOUHpw9r57tIvBowS9zvfxFr3QEvg1XOmUbae+HiSwBn+znuuGgGjW+bsPE60IOv0P2HZSupiXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB3519

On Mon Oct 12, 2026 at 11:26 AM BST, Onur =C3=96zkan wrote:
> Covers the low-level locking API (lock, try_lock and
> interruptible variants) and integration with kernel bindings.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/sync/lock/ww_mutex.rs             | 434 ++++++++++++++++++
>  rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 149 ++++++
>  2 files changed, 583 insertions(+)
>  create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
>
> diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww=
_mutex.rs
> index 727c51cc73af8..2423f89a7e762 100644
> --- a/rust/kernel/sync/lock/ww_mutex.rs
> +++ b/rust/kernel/sync/lock/ww_mutex.rs
> @@ -1,7 +1,441 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
>  //! Rust abstractions for the kernel's wound-wait locking primitives.
> +//!
> +//! It is designed to avoid deadlocks when locking multiple [`Mutex`]es
> +//! that belong to the same [`Class`]. Each lock acquisition uses an
> +//! [`AcquireCtx`] to track ordering and ensure forward progress.
> +//!
> +//! See srctree/Documentation/locking/ww-mutex-design.rst for more detai=
ls.
> =20
> +use crate::{
> +    bindings,
> +    container_of,
> +    error::to_result,
> +    prelude::*,
> +    types::{
> +        NotThreadSafe,
> +        Opaque, //
> +    }, //
> +};
> +use core::{
> +    cell::UnsafeCell,
> +    marker::PhantomData, //
> +};
> +
> +pub use acquire_ctx::AcquireCtx;
>  pub use class::Class;
> =20
> +mod acquire_ctx;
>  mod class;
> +
> +/// A wound-wait (ww) mutex that is powered with deadlock avoidance
> +/// when acquiring multiple locks of the same [`Class`].
> +///
> +/// Each mutex belongs to a [`Class`], which the wound-wait algorithm
> +/// uses to figure out the order of acquisition and prevent deadlocks.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::{
> +///     define_ww_class,
> +///     sync::{
> +///         lock::ww_mutex::{
> +///             AcquireCtx,
> +///             Class,
> +///             Mutex, //
> +///         },
> +///         Arc,
> +///     },
> +/// };
> +/// use pin_init::stack_pin_init;
> +///
> +/// define_ww_class!(SOME_WW_CLASS);
> +///
> +/// let mutex =3D Arc::pin_init(Mutex::new(42, &SOME_WW_CLASS), GFP_KERN=
EL)?;
> +/// let ctx =3D KBox::pin_init(AcquireCtx::new(&SOME_WW_CLASS), GFP_KERN=
EL)?;
> +///
> +/// // SAFETY: The guard is dropped before `ctx`.
> +/// let guard =3D unsafe { ctx.lock(&mutex) }?;
> +/// assert_eq!(*guard, 42);
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +#[repr(C)]
> +pub struct Mutex<'a, T: ?Sized> {
> +    _p: PhantomData<&'a Class>,

Do you expect any users that have non-static class?

So far all in-kernel user of ww mutex has a static class.

> +    #[pin]
> +    inner: Opaque<bindings::ww_mutex>,
> +    data: UnsafeCell<T>,
> +}
> +
> +impl<'class, T> Mutex<'class, T> {
> +    /// Initializes [`Mutex`] with the given `data` and [`Class`].
> +    pub fn new(data: T, class: &'class Class) -> impl PinInit<Self> {
> +        let class_ptr =3D class.inner.get();
> +        pin_init!(Mutex {
> +            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_mutex| {
> +                // SAFETY: `class` is valid for the lifetime `'class` ca=
ptured by `Self`.
> +                unsafe { bindings::ww_mutex_init(slot, class_ptr) }
> +            }),
> +            data: UnsafeCell::new(data),
> +            _p: PhantomData
> +        })
> +    }
> +}
> +
> +impl<'class, T: ?Sized> Mutex<'class, T> {
> +    /// Checks if this [`Mutex`] is currently locked.
> +    ///
> +    /// The returned value is racy as another thread can acquire
> +    /// or release the lock immediately after this call returns.
> +    #[inline]
> +    pub fn is_locked(&self) -> bool {
> +        // SAFETY: It's safe to call `ww_mutex_is_locked` on
> +        // a valid mutex.
> +        unsafe { bindings::ww_mutex_is_locked(self.inner.get()) }
> +    }
> +
> +    /// Locks this [`Mutex`] without [`AcquireCtx`].
> +    pub fn lock(&self) -> Result<MutexGuard<'_, T>> {
> +        lock_common(self, None, LockKind::Regular)
> +    }
> +
> +    /// Similar to [`Self::lock`], but can be interrupted by signals.
> +    pub fn lock_interruptible(&self) -> Result<MutexGuard<'_, T>> {
> +        lock_common(self, None, LockKind::Interruptible)
> +    }
> +
> +    /// Tries to lock this [`Mutex`] with no [`AcquireCtx`] and without =
blocking.
> +    ///
> +    /// Unlike [`Self::lock`], no deadlock handling is performed.
> +    pub fn try_lock(&self) -> Result<MutexGuard<'_, T>> {

`try_lock` failure should return `Option` instead.

> +        lock_common(self, None, LockKind::Try)
> +    }
> +}
> +
> +impl<'class> Mutex<'class, ()> {
> +    /// Creates a [`Mutex`] from a raw pointer.
> +    ///
> +    /// This function is intended for interoperability with C code.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that:
> +    ///
> +    /// - `ptr` is a valid pointer to a `ww_mutex`.
> +    /// - `ptr` must remain valid for the lifetime `'a`.
> +    /// - ww_class associated with this mutex must be valid for
> +    ///   the lifetime `'class`.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_mutex) -> &'a Self=
 {
> +        // SAFETY: By the safety contract, the caller guarantees that `p=
tr`
> +        // points to a valid `ww_mutex` which is the `inner` field of `M=
utex`,
> +        // that it remains valid for the lifetime `'a` and the associate=
d
> +        // ww_class outlives `'class`.
> +        //
> +        // Because [`Mutex`] is `#[repr(C)]`, the `inner` field sits at =
a
> +        // stable offset that `container_of!` can safely rely on.
> +        unsafe { &*container_of!(Opaque::cast_from(ptr), Self, inner) }
> +    }
> +}
> +
> +// SAFETY: `Mutex` can be sent to another thread if the protected
> +// data `T` can be.
> +unsafe impl<T: ?Sized + Send> Send for Mutex<'_, T> {}
> +
> +// SAFETY: `Mutex` serialises access to the protected data, so it is
> +// `Sync` as long as the data is `Send`.
> +unsafe impl<T: ?Sized + Send> Sync for Mutex<'_, T> {}
> +
> +/// A guard that provides exclusive access to the data protected
> +/// by a [`Mutex`].
> +///
> +/// # Invariants
> +///
> +/// The guard holds an exclusive lock on the associated [`Mutex`]. The l=
ock is held
> +/// for the entire lifetime of this guard and is automatically released =
when the
> +/// guard is dropped.
> +#[must_use =3D "the lock unlocks immediately when the guard is unused"]
> +pub struct MutexGuard<'a, T: ?Sized> {
> +    mutex: &'a Mutex<'a, T>,
> +    _not_send: NotThreadSafe,
> +}
> +
> +impl<'a, T: ?Sized> MutexGuard<'a, T> {
> +    /// Creates a new guard for the given [`Mutex`].
> +    fn new(mutex: &'a Mutex<'a, T>) -> Self {
> +        assert!(mutex.is_locked());
> +
> +        // INVARIANT: `lock_common` and `from_raw` ensure that the curre=
nt task holds the mutex
> +        // and transfer sole responsibility for unlocking it to this gua=
rd.
> +        Self {
> +            mutex,
> +            _not_send: NotThreadSafe,
> +        }
> +    }
> +}
> +
> +impl<'a> MutexGuard<'a, ()> {
> +    /// Creates a [`MutexGuard`] from a raw pointer.
> +    ///
> +    /// If the given pointer refers to a mutex that is not locked,
> +    /// returns [`EINVAL`].
> +    ///
> +    /// This function is intended for interoperability with C code.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that:
> +    ///
> +    /// - `ptr` is a valid pointer to a `ww_mutex`.
> +    /// - `ptr` must remain valid for the lifetime `'b`.
> +    /// - The `ww_class` associated with the `ww_mutex` must be valid fo=
r the lifetime `'b`.
> +    /// - The current task holds the mutex.
> +    /// - The caller transfers responsibility for unlocking the mutex to=
 the returned guard
> +    ///   and must not unlock it separately (including through another g=
uard).
> +    /// - Any associated acquire context remains valid until the mutex i=
s unlocked,
> +    ///   even if the returned guard is forgotten. The context must not =
be finalized or
> +    ///   reinitialized before then.
> +    pub unsafe fn from_raw<'b>(ptr: *mut bindings::ww_mutex) -> Result<M=
utexGuard<'b, ()>> {
> +        // SAFETY: By this function's safety contract, the caller guaran=
tees that `ptr` points to a
> +        // valid `ww_mutex` which is the `inner` field of a `Mutex`. The=
 caller also guarantees
> +        // that both `ptr` and the associated `ww_class` are valid for t=
he lifetime `'b`.
> +        let mutex =3D unsafe { Mutex::from_raw(ptr) };
> +
> +        if !mutex.is_locked() {
> +            return Err(EINVAL);
> +        }

Why is this checked despite being an unsafe function. Do you expect users t=
o
call this without knowing the lock is already locked? I think that's unlike=
ly.
Perhaps make this a debug_assert instead?

> +
> +        Ok(MutexGuard::new(mutex))
> +    }
> +}
> +
> +impl<T: ?Sized> core::ops::Deref for MutexGuard<'_, T> {
> +    type Target =3D T;
> +

`#[inline]` for this and others.

> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: self.mutex is locked, so we have exclusive access.
> +        unsafe { &*self.mutex.data.get() }
> +    }
> +}
> +
> +impl<T: ?Sized + Unpin> core::ops::DerefMut for MutexGuard<'_, T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: self.mutex is locked, so we have exclusive access.
> +        unsafe { &mut *self.mutex.data.get() }
> +    }
> +}
> +
> +impl<T: ?Sized> Drop for MutexGuard<'_, T> {
> +    #[inline]
> +    fn drop(&mut self) {
> +        // SAFETY: self.mutex is locked and are about to release it.
> +        unsafe { bindings::ww_mutex_unlock(self.mutex.inner.get()) };
> +    }
> +}
> +
> +// SAFETY: `MutexGuard` can be shared between threads if the data can.
> +unsafe impl<T: ?Sized + Sync> Sync for MutexGuard<'_, T> {}
> +
> +/// Locking kinds used by [`lock_common`] to unify the internal
> +/// locking logic.
> +///
> +/// It's best not to expose this type (and [`lock_common`]) to the
> +/// kernel, as it allows internal API changes without worrying
> +/// about breaking external compatibility.
> +#[derive(Copy, Clone, Debug)]
> +enum LockKind {
> +    /// Blocks until lock is acquired.
> +    Regular,
> +    /// Blocks but can be interrupted by signals.
> +    Interruptible,
> +    /// Does not block, returns immediately if busy.
> +    Try,
> +}
> +
> +/// Internal helper that unifies the different locking kinds.
> +///
> +/// Returns [`EINVAL`] if the [`Mutex`] has a different [`Class`].
> +fn lock_common<'a, T: ?Sized>(
> +    mutex: &'a Mutex<'a, T>,
> +    ctx: Option<&AcquireCtx<'_>>,
> +    kind: LockKind,
> +) -> Result<MutexGuard<'a, T>> {

I think we should have 3 helpers, to avoid having to branch on `kind` which=
 is
compile-tiome known information.

The only part between the 3 kinds that is shared is the ctx_ptr computation=
. I
think it should be extracted to its own helper, and be used for 3 types of
locking.

> +    let mutex_ptr =3D mutex.inner.get();
> +
> +    let ctx_ptr =3D match ctx {
> +        Some(acquire_ctx) =3D> {
> +            let ctx_ptr =3D acquire_ctx.inner.get();
> +
> +            // SAFETY: `ctx_ptr` is a valid pointer for the entire
> +            // lifetime of `ctx`.
> +            let ctx_class =3D unsafe { (*ctx_ptr).ww_class };
> +
> +            // SAFETY: `mutex_ptr` is a valid pointer for the entire
> +            // lifetime of `mutex`.
> +            let mutex_class =3D unsafe { (*mutex_ptr).ww_class };
> +
> +            // `ctx` and `mutex` must use the same class.
> +            if ctx_class !=3D mutex_class {
> +                return Err(EINVAL);
> +            }

This is supposed to be a error condition?

> +
> +            ctx_ptr
> +        }
> +        None =3D> core::ptr::null_mut(),
> +    };
> +
> +    match kind {
> +        LockKind::Regular =3D> {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `Som=
e`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both cas=
es are safe.
> +            let ret =3D unsafe { bindings::ww_mutex_lock(mutex_ptr, ctx_=
ptr) };
> +
> +            to_result(ret)?;
> +        }
> +        LockKind::Interruptible =3D> {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `Som=
e`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both cas=
es are safe.
> +            let ret =3D unsafe { bindings::ww_mutex_lock_interruptible(m=
utex_ptr, ctx_ptr) };
> +
> +            to_result(ret)?;
> +        }
> +        LockKind::Try =3D> {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `Som=
e`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both cas=
es are safe.
> +            let ret =3D unsafe { bindings::ww_mutex_trylock(mutex_ptr, c=
tx_ptr) };
> +
> +            if ret =3D=3D 0 {
> +                return Err(EBUSY);
> +            } else {
> +                to_result(ret)?;
> +            }
> +        }
> +    };
> +
> +    Ok(MutexGuard::new(mutex))
> +}
>
> [snip]
>
> diff --git a/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs b/rust/kernel/=
sync/lock/ww_mutex/acquire_ctx.rs
> new file mode 100644
> index 0000000000000..18f4654e7df26
> --- /dev/null
> +++ b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Provides [`AcquireCtx`] for managing multiple wound/wait
> +//! mutexes from the same [`Class`].
> +
> +use super::{
> +    lock_common,
> +    Class,
> +    LockKind,
> +    Mutex,
> +    MutexGuard, //
> +};
> +use crate::{
> +    bindings,
> +    prelude::*,
> +    types::Opaque, //
> +};
> +use core::marker::PhantomData;
> +
> +/// Groups multiple [`Mutex`]es for deadlock avoidance when acquired
> +/// with the same [`Class`].
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::{
> +///     define_ww_class,
> +///     sync::{
> +///         lock::ww_mutex::{
> +///             AcquireCtx,
> +///             Class,
> +///             Mutex, //
> +///         },
> +///         Arc,
> +///     },
> +/// };
> +/// use pin_init::stack_pin_init;
> +///
> +/// define_ww_class!(SOME_WW_CLASS);
> +///
> +/// // Create mutexes.
> +/// let mutex1 =3D Arc::pin_init(Mutex::new(1, &SOME_WW_CLASS), GFP_KERN=
EL)?;
> +/// let mutex2 =3D Arc::pin_init(Mutex::new(2, &SOME_WW_CLASS), GFP_KERN=
EL)?;
> +///
> +/// // Create acquire context for deadlock avoidance.
> +/// let ctx =3D KBox::pin_init(AcquireCtx::new(&SOME_WW_CLASS), GFP_KERN=
EL)?;
> +///
> +/// // SAFETY: The guard is dropped before `ctx`.
> +/// let guard1 =3D unsafe { ctx.lock(&mutex1) }?;
> +/// // SAFETY: The guard is dropped before `ctx`.
> +/// let guard2 =3D unsafe { ctx.lock(&mutex2) }?;
> +///
> +/// // Mark acquisition phase as complete.
> +/// ctx.done();
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data(PinnedDrop)]
> +#[repr(transparent)]
> +pub struct AcquireCtx<'a> {
> +    #[pin]
> +    pub(super) inner: Opaque<bindings::ww_acquire_ctx>,
> +    _p: PhantomData<&'a Class>,
> +}
> +
> +impl<'class> AcquireCtx<'class> {
> +    /// Initializes a new [`AcquireCtx`] with the given [`Class`].
> +    pub fn new(class: &'class Class) -> impl PinInit<Self> {
> +        let class_ptr =3D class.inner.get();
> +        pin_init!(AcquireCtx {
> +            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_acquire_c=
tx| {
> +                // SAFETY: `class` is valid for the lifetime `'class` ca=
ptured
> +                // by `AcquireCtx`.
> +                unsafe { bindings::ww_acquire_init(slot, class_ptr) }
> +            }),
> +            _p: PhantomData
> +        })
> +    }

I wonder if a better API would be

    class.new_context()

vs.

    AcquireCtx::new(&class)

?

> +
> +    /// Creates a [`AcquireCtx`] from a raw pointer.
> +    ///
> +    /// This function is intended for interoperability with C code.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` is a valid pointer to the `inn=
er` field
> +    /// of [`AcquireCtx`] and that it remains valid for the lifetime `'a=
`.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_acquire_ctx) -> &'=
a Self {
> +        // SAFETY: By the safety contract, `ptr` is valid to construct `=
AcquireCtx`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Marks the end of the acquire phase.
> +    ///
> +    /// Calling this function is optional. It is just useful to document
> +    /// the code and clearly designated the acquire phase from actually
> +    /// using the locked data structures.
> +    ///
> +    /// After calling this function, no more mutexes can be acquired wit=
h
> +    /// this context.
> +    #[inline]
> +    pub fn done(&self) {
> +        // SAFETY: `self.inner` contains a valid, initialized acquire co=
ntext.
> +        unsafe { bindings::ww_acquire_done(self.inner.get()) };
> +    }
> +
> +    /// Locks the given [`Mutex`] on this [`AcquireCtx`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// On success, the caller must keep this context valid until the mu=
tex is unlocked,
> +    /// even if the returned guard is forgotten. The context must not be=
 finalized or
> +    /// reinitialized while the mutex remains locked.
> +    pub unsafe fn lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> Resu=
lt<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::Regular)
> +    }
> +
> +    /// Similar to [`Self::lock`], but can be interrupted by signals.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The same requirements as [`Self::lock`] apply.
> +    pub unsafe fn lock_interruptible<'a, T>(
> +        &'a self,
> +        mutex: &'a Mutex<'a, T>,
> +    ) -> Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::Interruptible)
> +    }
> +
> +    /// Tries to lock the [`Mutex`] on this [`AcquireCtx`] without block=
ing.
> +    ///
> +    /// Unlike [`Self::lock`], no deadlock handling is performed.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The same requirements as [`Self::lock`] apply.
> +    pub unsafe fn try_lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> =
Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::Try)
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for AcquireCtx<'_> {
> +    fn drop(self: Pin<&mut Self>) {

I wonder if we can just do

    let acquired =3D unsafe { (*self.inner.get()).acquired };
    assert!(!acquired);

to get rid of the `unsafe`. Somewhat similar to what we do with srcu. Of co=
urse,
ultimately we want to use `!Leak` for this and can remove the check.

Thoughts?

Best,
Gary

> +        // SAFETY: The locking methods require callers to release all ac=
quired locks
> +        // before this context is dropped.
> +        unsafe { bindings::ww_acquire_fini(self.inner.get()) };
> +    }
> +}


