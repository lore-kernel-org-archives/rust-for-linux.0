Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021103.outbound.protection.outlook.com [52.101.95.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120CA414409;
	Mon, 12 Oct 2026 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802993; cv=fail; b=JJ1C4oLYMe270arZj74VhMuw7UlN4lBKTwoJu/Ervb3YatVz+moi3EB3uPKotO5H0He1ekoge8Wzfz0gYiyMyvdH143VJjlQoE138ob5L3vfotWKw4BN1PJ+Q4+lKvTnLY7cWa/zTLaWTs/n6i78S9Bk+MuKdKLvm3DCiBc6a4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802993; c=relaxed/simple;
	bh=QYUTALqnyrzaU8cAUkPHit4363XkfwG8myQ/ItA4DrE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WeeVjbL7zymrNE3yQi5rn5a76XFUi/r0ROi5r85DXARWTZ+U04V5DvKtzwYjGKK5kI4Eq7yhHOFUfFwhyIPqWHcQIQcHyrgjYnd57RWL9TJMHLk0tvZBmhWhDJ2PlzHGACxVlG+VaZpIsF78pa0J6VQkajes5SXo7UEp6984s6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gf/k7zdT; arc=fail smtp.client-ip=52.101.95.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gf/k7zdT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnnDLV4Qg2Y82F7K+jmTzj1RkwhJ4Omr1IRkw7MDLv+zgxqHwtYvDbkyiprK0eLd1NQ+gDw3Wlx2h5mpabJizi+mCeQbpPCSCGlxMBsyoRYhhThTRm+y2/2dRDlXIY83X2CQfnKfArrIWKVY4UbE2wfJFEsct9m191bBipYGsCg6rmC8sF+lhNtQ+87LiTyP0BLK70XsSTeNvSqDIwwoPEDW8xBxqqbnwzfEOu37YdewptYFwompzptPfHcsjfuPlGB+YXdUXM+siAtAew1B8xWi9aMMYAvhWVIcRangZ3RYPQ90Rm2KK8m2+k+rh1LMS3kf5tH03NR64O2/XDwijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgAadHLVMIzNt8x4A5wNZc+lcXmAjlRwcuvOKEgeTFM=;
 b=eFDL38FSkqBtrNF5cOGgL3KTUN6dPR6dpZt+3VBg3JvlPvBceIScT20edSqz+yd0iANXLY5fOr8kKA131K3dxev9DNw7Mgm7ifxfJGP5l/BZlsUxnLY35uLzOvaRDsFUbnKuDh06yN+AnmL0sU0kh7nE0uQRkZtFgQeiS7+4ZIg8P9gB8koNXdJUI4Ueens/zleOpKwZywtniXWatrWVVqzMAcLNYORjOGzrx3fYVC/xyv8mfuJ7mocZEZB4QqbAbxf9O/DGeehg9ZRQitDB82ZzZHjhz25WEfJ0tj6aY80X317g57DurXThkSt6GWNRNns9mG8+CkebGhDBd6aF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgAadHLVMIzNt8x4A5wNZc+lcXmAjlRwcuvOKEgeTFM=;
 b=gf/k7zdTRVP39IF737VV8ZL1H3BrnAIYNV8yEZ6BLe1ZB2MFxM2pBwaIu0bDhynep299j6UIAbXn2RJjgGrEpxmGTjq1GDAH+Bydy4HFrVrN4quNVTjZJeYx7d6cVCXQyMuWkcFtmer4jOdvkLrgPX39008s3fKJKoHtz7oFdaM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by LOBP265MB8493.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:46c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 11:03:06 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 11:03:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 12:03:04 +0100
Message-Id: <DM2T5BE41CL9.2EH0NAWUKDC4L@garyguo.net>
Cc: <lossin@kernel.org>, <lyude@redhat.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
 <will@kernel.org>, <longman@redhat.com>, <felipe_life@live.com>,
 <daniel@sedlak.dev>, <daniel.almeida@collabora.com>,
 <thomas.hellstrom@linux.intel.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 3/6] rust: implement Class for ww_class support
From: "Gary Guo" <gary@garyguo.net>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <cover.1791799751.git.work@onurozkan.dev>
 <ba8ea8e2e2b5027e446261d323e88d2d8696d0a6.1791799752.git.work@onurozkan.dev>
In-Reply-To: <ba8ea8e2e2b5027e446261d323e88d2d8696d0a6.1791799752.git.work@onurozkan.dev>
X-ClientProxiedBy: LO4P123CA0417.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::8) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|LOBP265MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 8580ad29-5c91-4fa8-4da9-08df285063e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|10070799003|4143699003|5023799004|56012099006|18002099003|22082099003|6133799003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	WYvCoDW+Dlpna4kyUpZVmyq/kwLL606FRycjG8HT2+bYsiQpGHidAmfJUmmOBhgEyWqqZH4wbj2TB62KqwsmUmA20fxLh9lsAIupLfJW1objtW5mX795Qukua7yofe0IbeApOrn5/5td+0AW3iImCcBIGYpeYh93kuf/brU3CnrWUXzwk9VkSvrI2u7wlVT8kqJkycRZl1MkvzrmSKLSr5ovqGAlXI/g2xj5GI1wG/QdMBjHW7WnNo+iVgVqEOXZMB6/rPU3fXJC8MWcIPuYdYcRQDbE1vlG7CNejCp65qnMXku1yd4WopOzFP0b1qxd2tXF8X8W5MOAkdtoOQc3ZBTcaUldf8gDM8YbCFsVa1BrDGEe3yrh16+edVqPm+WpsgCtFY4ofoCr7McSKin98Zc2RkkGcEiR9rJsBRMuBCJFIiR31NPi/H4/eeDUNgieqO84hcQN3RLy/cNI/AFXzG9ooyDTcKInnN81Nh50GLJ1rJ1KWZOsDp/D+AOhy06axmA3gfEEN2OEhn8csjoecAaXyxAWeB3g3UwxdPDvGtRjFXD1U/jIkZlFcgE8iUiVkz15vqMX52dVqH9fWorhO68vpdIssT1s/V17wwcd+LKbHrsXYxoyO+fQRkv2D6oJSyXoEI1YkWgdeVxpirovIAh+RTBczYlKq96omclKi+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(10070799003)(4143699003)(5023799004)(56012099006)(18002099003)(22082099003)(6133799003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkZKbUsrY0ZpYnFORHNWelZHOU9qeTQrSytqM1lQaFBidExISDFOWGRlQ1Z5?=
 =?utf-8?B?M1hIMXBEYk9EdEd6UHRvOEUrZnNLNHNzeFdLWnowU05jUlJ2cUViVTRhMWNX?=
 =?utf-8?B?T0tuRjJOVm5SMmp3N2I1blBKQ25pYW94eFRydU1pa2NZK3EzOHJZTlVhYmpj?=
 =?utf-8?B?aXdmVGxnSjh4cDBtbHpMc3Q5QU13YlIxK0o0NGdYRklJSkJaNVQ1dGo1MUNt?=
 =?utf-8?B?NEhmVkdSMkR2U0s2UTJRSVFMWGI1dk5XdUU0bHZvK2tORnlkWThmU1ZDVThs?=
 =?utf-8?B?OTA4ZVZ5ZUJ2UGxLZ29NaGIwUFUzazdyNjFrZFRmNmdtSkNKMnBwNU5rNXI2?=
 =?utf-8?B?ZW9KcTN2d3h4eUxyd1RwRnEwSWRlSmYwYkp4ZTd1YUtBWVZVS1Bzdm83RnJD?=
 =?utf-8?B?RXJ6YVJRbjVTb2grVzVENXJCUlAreHdlOWFhMThIdGxtYXVxYUJLSCtOT3Bi?=
 =?utf-8?B?RnBYSlU2d2QyWEx2KzQ3TytMcE9WREkycjZWcWpLdUx6SjZ1bU5WeDU2RWpT?=
 =?utf-8?B?Y0ZkMUxXeHBIeDJ6Zm85UEZoUmN6Y0tLTmRkSG9FaHIwZTFCeFE1VnI2WlU0?=
 =?utf-8?B?M2JyRU9MZzl1NmV4aGNYL0Z0NStoSlIvRWZkZllIMW1oQks0WVVmZkJlL29L?=
 =?utf-8?B?b1E5cEJKK3hUaXhlTnFiQ0psRFRhWEk5WXZQcmVyTGRENGd0MkhhekZmN0Mv?=
 =?utf-8?B?bkR1WEdsK0JNSXpObFhDQ0x6OVczL0RrTHFDTlVkenZYK3g2akFLRVZTZVZh?=
 =?utf-8?B?clNTa2d4aUNTR01DNWJ3ZksvNEdRQlJLRVh5bDJoU0hlb0wvWXBrZjVMbFd6?=
 =?utf-8?B?SkN3YXpTWUVmNjFKc2VxM2NGR3FCeGxuU1dmb29TVi9kd0dQRCtVWllOUVpu?=
 =?utf-8?B?ZVJacVMwcFZnVEtoVlNZNkJMYUFSb1JsOTJGWnFlcHJuZmpQeDVjb1E3NWJq?=
 =?utf-8?B?TVVzaWhLSzkyMUNSbjhCOXpiQ3cyNERlZXBzYmF0S2tkVGtjMUloV0V5cS9X?=
 =?utf-8?B?Rzd5VGZ2blhhRTlIL2tWL0ZiMFNRZDdXWER1V3dZUDJVbWlQOUk3YmZxaEYz?=
 =?utf-8?B?MTdqTjM3TWpGMkRHTG95cmFVcUlVVHRFQVNCc2p0eFQ2SjBzc1hlL3ZZSnFF?=
 =?utf-8?B?UldoMklCOFF4MElyQUE1aFh1MWpONWltdEY5Mjh6YzVNbTloQ2dJR3NaV3B1?=
 =?utf-8?B?aGNBNEEvRm9oNVdPMllweDNQb0Z3QkRFOGhsU2E3MHE4NGtPOVRncFdOVk5D?=
 =?utf-8?B?eDA5WEZyTlN0WUpwTEZGRk0wSGVwMlE5UTR4YkFxclg0WFdla2V2QzN6R1FH?=
 =?utf-8?B?RmZwcFJtcGY2cS9KVkVEQnNuNTNVM0dScDFVT0ZPdDQ3bWl1VVlmNGF6QWNV?=
 =?utf-8?B?RXpvRTVHNEtYd1lOODZFZU5YckFVS2wwQ0RNY3VGeXltS0dqeTk1QitPZEFo?=
 =?utf-8?B?UHpZR0Nyc1dveDlSOFBjRzNja0ZxRXJoM0NDNUYyODljVmtzOHVpVlk2WFVN?=
 =?utf-8?B?Ry9VbDN1SHNTcEsvaXMyN25Rb0YydVk1Uk5UY05zN1FNZVY0QThyV0ZiOFFG?=
 =?utf-8?B?cTI1Q3RMQ084eWtRMThlOEFCRExsbjQ0cHdhWGVDc0x3YTI0V3YyTVFUaWxt?=
 =?utf-8?B?dXVscjBqSGhuMzZ2WHVPVVZ0UXNQWGEzWVdsdFhuTzJ6NTFQL0treWlJY3pr?=
 =?utf-8?B?Qi90KzhTcStyclFiOUQvQzFDZkl5Mlh3RURvRGkyVHdoYlJFV0xIMndxSWZ6?=
 =?utf-8?B?SEl0NVV2ajBIOTBYb2hsczYyT09xVExMdU9TOW9iUnNudFNkQm5uVmp3a2hK?=
 =?utf-8?B?R0ZhZ1FGTmFMd2k4ZTYzd2xpcFVhemVnKzVtM0NhRS9rVkdsN1paa3RqUm81?=
 =?utf-8?B?OUxyMkplZjh0WnRackpZTVp5OFBMeGRiZ1JkQ011bnVjd2dtbWo3VVp4ODFW?=
 =?utf-8?B?dnZOS2oxdG5UWW1BMEFwQ1BLZ3NqOVk1SGc5WEdHSDZZTkpXektjSmd1bHlE?=
 =?utf-8?B?bWpCMndZWU1zdklrTm1VdjZMb08xUFU5a2ZSbUJCNllTVkdiZERVNWY3Sjly?=
 =?utf-8?B?UjAwVUVEWDdVcitSVEtPMnNsQU9GbWQycHpBL1N6TE5NVzUyMlpLTk9XUnZB?=
 =?utf-8?B?OWpIM3puZzIwSmpaMGNGK3YvdG5xVGsrSHJWc1FERTRjbDRFcW9YVStRb0Yr?=
 =?utf-8?B?YStueDdLUkdyMyszZHR5eFFwdmJxS2dWSzBXNVFOUitiWGl4VFJKbndOdXNu?=
 =?utf-8?B?cnZzVmtJeWFGZmVVWTB2OTBYTWpRRXFoMU9mdjk2WDZsVW9BV3k2WFdUY2dq?=
 =?utf-8?B?YWZ6UEdCNURXSmlvWGpOd2lKZXJKUE16bDFydWRtdEFFZlpLdjVRQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8580ad29-5c91-4fa8-4da9-08df285063e4
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:03:05.0148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD+1vodQO8CtdE/4d4nlscYDTvF3d5YZ47WRc3FfvwBSijXkK4LO7FDKhKippWZWWyNHGGZSxJzGs8S7thS/XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8493

On Mon Oct 12, 2026 at 11:26 AM BST, Onur =C3=96zkan wrote:
> Adds the Class type, the first step in supporting ww_mutex in Rust.
> Class represents ww_class, used for deadlock avoidance for supporting
> both wait-die and wound-wait semantics.
>
> Also adds the define_ww_class and define_wd_class macros for safely
> declaring static instances.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Gary Guo <gary@garyguo.net>

With some nits below.

> ---
>  rust/kernel/sync/lock.rs                |   1 +
>  rust/kernel/sync/lock/ww_mutex.rs       |   7 ++
>  rust/kernel/sync/lock/ww_mutex/class.rs | 151 ++++++++++++++++++++++++
>  3 files changed, 159 insertions(+)
>  create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
>  create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs
>
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 10b6b5e9b024f..f509250822c55 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -15,6 +15,7 @@
> =20
>  pub mod mutex;
>  pub mod spinlock;
> +pub mod ww_mutex;
> =20
>  pub(super) mod global;
>  pub use global::{GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLocke=
dBy};
> diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww=
_mutex.rs
> new file mode 100644
> index 0000000000000..727c51cc73af8
> --- /dev/null
> +++ b/rust/kernel/sync/lock/ww_mutex.rs
> @@ -0,0 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust abstractions for the kernel's wound-wait locking primitives.
> +
> +pub use class::Class;
> +
> +mod class;
> diff --git a/rust/kernel/sync/lock/ww_mutex/class.rs b/rust/kernel/sync/l=
ock/ww_mutex/class.rs
> new file mode 100644
> index 0000000000000..58a4467552700
> --- /dev/null
> +++ b/rust/kernel/sync/lock/ww_mutex/class.rs
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Provides [`Class`] to group wound/wait mutexes to be acquired togeth=
er
> +//! and specifies which deadlock avoidance algorithm to use (e.g., wound=
-wait
> +//! or wait-die).
> +//!
> +//! The [`define_ww_class!`] and [`define_wd_class!`] macros provide saf=
e
> +//! ways to create classes.
> +
> +use crate::{
> +    bindings,
> +    prelude::*,
> +    types::Opaque, //
> +};
> +
> +/// Defines a static wound-wait [`Class`].
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::define_ww_class;
> +///
> +/// define_ww_class!(SOME_WW_CLASS);
> +/// ```
> +#[macro_export]
> +macro_rules! define_ww_class {
> +    ($name:ident) =3D> {
> +        static $name: $crate::sync::lock::ww_mutex::Class =3D
> +            // SAFETY: This is `static`, so address is fixed and won't m=
ove.
> +            unsafe {
> +                $crate::sync::lock::ww_mutex::Class::new_unpinned(
> +                    $crate::c_str!(::core::concat!(::core::stringify!($n=
ame), "_acquire")),
> +                    $crate::c_str!(::core::concat!(::core::stringify!($n=
ame), "_mutex")),
> +                    false,
> +                )
> +            };
> +    };
> +}
> +
> +/// Defines a static wait-die [`Class`].
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::define_wd_class;
> +///
> +/// define_wd_class!(SOME_WD_CLASS);
> +/// ```
> +#[macro_export]
> +macro_rules! define_wd_class {
> +    ($name:ident) =3D> {
> +        static $name: $crate::sync::lock::ww_mutex::Class =3D
> +            // SAFETY: This is `static`, so address is fixed and won't m=
ove.
> +            unsafe {
> +                $crate::sync::lock::ww_mutex::Class::new_unpinned(
> +                    $crate::c_str!(::core::concat!(::core::stringify!($n=
ame), "_acquire")),
> +                    $crate::c_str!(::core::concat!(::core::stringify!($n=
ame), "_mutex")),
> +                    true,
> +                )
> +            };
> +    };
> +}
> +
> +/// Used to group mutexes together for deadlock avoidance.
> +///
> +/// All mutexes that might be acquired together should use the same clas=
s.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::{
> +///     define_wd_class,
> +///     define_ww_class, //
> +/// };
> +///
> +/// define_ww_class!(SOME_WW_CLASS);
> +/// define_wd_class!(SOME_WD_CLASS);
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +#[repr(transparent)]
> +pub struct Class {
> +    #[pin]
> +    pub(super) inner: Opaque<bindings::ww_class>,
> +}
> +
> +impl Class {
> +    /// Creates an unpinned [`Class`].
> +    ///
> +    /// You should prefer using [`define_ww_class!`] and [`define_wd_cla=
ss!`]
> +    /// macros. This function is `pub` only so that those macros can use=
 it.
> +    /// The alternative would be to expose the private fields of [`Class=
`]
> +    /// which is less desirable.

Replace the paragraph with `#[doc(hidden)]`?

> +    ///
> +    /// # Safety
> +    ///
> +    /// Caller must guarantee that the returned value must be pinned bef=
ore
> +    /// its first use.
> +    pub const unsafe fn new_unpinned(
> +        acquire_name: &'static CStr,
> +        mutex_name: &'static CStr,
> +        is_wait_die: bool,
> +    ) -> Self {
> +        Class {
> +            inner: Opaque::new(bindings::ww_class {
> +                stamp: bindings::atomic_long_t { counter: 0 },
> +                acquire_name: crate::str::as_char_ptr_in_const_context(a=
cquire_name),
> +                mutex_name: crate::str::as_char_ptr_in_const_context(mut=
ex_name),
> +                is_wait_die: is_wait_die as u32,
> +                // TODO: Replace with `bindings::lock_class_key::default=
()` once
> +                // stabilized for `const`.
> +                //
> +                // SAFETY: This is always zero-initialized when defined =
with
> +                // `DEFINE_WD_CLASS` globally on C side.
> +                //
> +                // For reference, see __WW_CLASS_INITIALIZER() in
> +                // "include/linux/ww_mutex.h".
> +                acquire_key: unsafe { core::mem::zeroed() },
> +                // TODO: Replace with `bindings::lock_class_key::default=
()` once
> +                // stabilized for `const`.
> +                //
> +                // SAFETY: This is always zero-initialized when defined =
with
> +                // `DEFINE_WD_CLASS` globally on C side.
> +                //
> +                // For reference, see __WW_CLASS_INITIALIZER() in
> +                // "include/linux/ww_mutex.h".
> +                mutex_key: unsafe { core::mem::zeroed() },

Does `..pin_init::zeroed()` work in this case?

Best,
Gary

> +            }),
> +        }
> +    }
> +
> +    /// Creates a [`Class`] from a raw pointer.
> +    ///
> +    /// This function is intended for interoperability with C code.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` points to the `inner` field of
> +    /// [`Class`] and that it remains valid for the lifetime `'a`.
> +    #[inline]
> +    pub const unsafe fn from_raw<'a>(ptr: *mut bindings::ww_class) -> &'=
a Self {
> +        // SAFETY: By the safety contract, `ptr` is valid to construct `=
Class`.
> +        unsafe { &*ptr.cast() }
> +    }
> +}
> +
> +// SAFETY: [`Class`] is immutable except for its atomic stamp. It's fine=
 to share it across threads.
> +unsafe impl Sync for Class {}
> +// SAFETY: Doesn't hold anything thread-specific. It's safe to send to o=
ther threads.
> +unsafe impl Send for Class {}


