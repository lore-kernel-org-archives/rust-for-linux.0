Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022077.outbound.protection.outlook.com [52.101.96.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74EA259CB6;
	Fri, 27 Feb 2026 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772202744; cv=fail; b=lNWgGaazxvlYGo+Jh4otZ6Q8wFaU9BU1gbG1vydrm6N7mDclfiDoI0Bn6h9j42OzGW9sbdS8joxaADFMMD4U5qgiWJoqfFCjUSnoiZOp3nPaa7svjPBlrdaBEpNRSC9GW0I44fLo+MW7qX4mcOJYVEKNHNOOLtwsDi7YePEkibU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772202744; c=relaxed/simple;
	bh=j9I3IM895EGkCJPBX9DbjsfEo6lnJ3dcEPeU+EoyctA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=gjIWauARo0hm3Hy8/LhV/KEssoaGojtl6pmOtoN8L4p4sXDcTvc19lD8dS4tVdendFk5wBeLCiDVOsMU1RbtFpGviLPvDnGliZytIBS/4pQLO0Z8mG2/MAndSyo+PaPSdN9o9OsegcqegB1fYJpHwMGbDeP/l8mF3tilvzHdVZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=AG8W24iH; arc=fail smtp.client-ip=52.101.96.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="AG8W24iH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSCPQprZQRomhYbfFEIb2xA8etCH9QsgO29LzyXj5OTpfDgBFi74/zt7//btcZZHH9uva7vPS66XV1gR2Ccy/RIMsHbcLwNuCtHoN9AoecBmAx2eT6ABfweV9WriCLr/eFaOtKbCw78zDyZykv4KgCbnmrcnCjm650dDmT9yGw2Hp+AZO8OZnGhcxoW5+MGrCnwfsncmta2iBguh1Hr/SSjnJaPTuIorNPDBN92BiX1Hd63XWl54MFFvl79bmNWfH/G1A/XgjtXLYPwzVqh6Y3JT66vkAbsB2gtqlUxI2OYxrGlfZS7h22Myv/LV19talTVcbekUtRJ5/xpGLaVSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnxcMAs9vjrY04tZKKPcd9F8zweQqGC3aQHeEHqe7CM=;
 b=Q3iKauFyp8VQ5vLOvZ7IO5853+xV0ZpfEalmm78Bh/dPz2TMBiPenQwY80s3mxfglKabdZl3b7wcCWLJzCyAQFgsfqETlQdozBAeF0QlkQ4Hm6XO/ODQVXQIYZ8PoYFDdapJt0YqoJaws1kpqSOW9ZB9OLq8JAv5//36aDSS5NtFyJF+4dxHjxYR5Ixg027xcztkcrjmv2l48Nr9LbDzrEKDhowmeEQhPoLqdMFVxDjhXoxlVKH4wuQlamuePY6H0pt+JrrYUaE3rnqnvw8MQxlyKBnO67Z7dyMS+R24Sgf4mL76OfsxLSQaoGzIZLSY9wF8y+yS72WjBjFj7zX9VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnxcMAs9vjrY04tZKKPcd9F8zweQqGC3aQHeEHqe7CM=;
 b=AG8W24iHebvna0JeB7IRviirkxXxFp9lpSQOPLL05WnYi7JFaiZ5eONNGJcNSL6qSe2clrd4jh9iddhTbylkfJjd/7pfYMBEttEh7b24KxhmkURsz77yukEEgcntznRXIAL5gUIHJNXYYv11D6KdDfZCgI4653KaUtIUCzzSZzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6778.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 14:32:19 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 14:32:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 14:32:13 +0000
Message-Id: <DGPTFSM1EK7V.1VEG57EE9DT6K@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "Akinobu Mita" <akinobu.mita@gmail.com>
Subject: Re: [PATCH] fault-inject: rust: add a Rust API for fault-injection
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260215-rust-fault-inject-v1-1-6ec459cb5ccb@kernel.org>
In-Reply-To: <20260215-rust-fault-inject-v1-1-6ec459cb5ccb@kernel.org>
X-ClientProxiedBy: LO2P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: a6701a7e-3c2a-4542-0a6c-08de760d0324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	4RWLAoYfYwRUWidJQsKf8GxWjLHiArgwFgv5YS4wyLG7M607dV+Yudr3v9yiELVC3+APmFBKjN6CsP+Ejk8kBrbMHcBo9S7kpuC2FAdwnqC3/nRST0Hq7ilKk0UweEYzYBYGwV65nqaoZ0RTL1t1nEIBlDQmn8V0pJ5goEL+HGFGeujlRp4fx5+c6a+0WsgbJMMD1dIEwb1xtDCPrBZTcq6AFU0hpduoX1/JajzT663PE3kafw6BKQyRpQGWyh5du3e0il1Jw3CLQLaZw1OpnGOmTS0afAymJbM5+QHXD6Ch+nNfCMdiJAzHacotLRz0ObHtIUpuxDjrVrHfXMCltKtMCs/RXzzfDnTFoE2O678S7uWFfwStT2Qnyr/Nwaw4p0biMzxdSN+sEm1ilJCDVNx9tGbfLpFIX9T8gRlA5LR1GUl0NyqTbH9Mr8o7wrtyCoW15884NNyjeAX3RlQMD0rqlV3KL6gfvpYaSrfaA47wx2p4RUS96+hslUP3U/cTl0NefFQy65JHEPHMWHnRYGJLMvQ3CBb91KYsXz/Py1TeF5Cn0cjZlHaog3xFNLvVho1QqIm6568QKlsyOSBxMVBOwAsZxJ5ZtWkp5pC5AuVx2S8KUUsRf1BPtDx4o7dT/z/PZo8VqBUvsXSs5PAQXy15grNofF2lRpPPPv65qlTNNawKqYnHnIbgvXUOEzwflCeTUnH3u5wMjssXhTNTalTu7mVCpTN2Fs+A2vhuZyE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlZEdlVWSVFMWTlPdDJMVkFPK2hEdnY4NG1Ic3FXU2VvSEdzalJJUGMza2FS?=
 =?utf-8?B?U2RxUUQrZjduK0ZMUDY2cnZaVSs3TGw5djZnYkg4UXF4T2tMc3A4RzJrUXRr?=
 =?utf-8?B?SFEzRkxhNVhkS3BORDd6NEVOU0FzN3Y0Q1FmMExQWU5YSnVadW1yczcvOW4y?=
 =?utf-8?B?N1hLOHVieHNIaGQwY3Fva1QrZHNJUmVKa1V2aGxzWCszMXgvdm05NFBwSUE1?=
 =?utf-8?B?NjJ0dHJXVkJJSnFxMEc2K1l6RnVITy9pUU13dFczMmUvSlV4dnlJTkZZc20x?=
 =?utf-8?B?RUlYcWp3bGluZzVZMTNzajVOdm52YUVwcUMzNnVnTjZheFR5clMzS0wyY2xD?=
 =?utf-8?B?NHA4djI2aG5EcWVwc3I2YUpMK0ExWldkWXNnV2trOXQ2VHlmaXUwTFdOZHIv?=
 =?utf-8?B?ZFZyb00vRDZjQTNMKzh2QitpWUJNQjhjL3gxdnJPbloxN2J0TUlhWVFPcHU2?=
 =?utf-8?B?RTVOK0tyeUtqRytKZjdnWFAvK0NsK3BBL1A5OEE3MTdlK1lqelpwQkN2ZUl6?=
 =?utf-8?B?TGRJMU0yWitsRG92RDF3dm8xajhPU3Q1L3VJZ3M1emdNelZvQVRLN3BMQzJ2?=
 =?utf-8?B?QXVjY0pGNWY0eFQ3SGVKb25HQ3ZvMmdnUHl1R0psZDc1S2JCd0c1R3FkL1li?=
 =?utf-8?B?OUJiUGJZZHU4c2M0bi9LN3orTWpPa3c1bFVUVTlHOWZKdjZFWFdjYkdHOFh4?=
 =?utf-8?B?bEhyRVJFZ2xqQ0xyNHhXVEJMVVdsYUJSNEJyd0V2VmVOc1lwMzdNNVFYTm5t?=
 =?utf-8?B?YW1FeWxQeVllYTVEK3FtOXVoUnNWL2NORGhCK3h1TkJyU2M4bjVUS252NnpY?=
 =?utf-8?B?L1RhN2NxTVVvOTE5SnVXWlhScTQwTy8xQTJJOFI3eDArWEFmazE2eTlhYlM5?=
 =?utf-8?B?UHV1K1pQS3I2eWtTeHVPN2dpVVR4QVNBWER2cnE5OGQwcDRVeVh1YWdMNm9p?=
 =?utf-8?B?VVV5MXF2SThXY3dBWE44TDROUkUxQ1RkenpyMy9yaGh5VUVOcndNU0RidjRL?=
 =?utf-8?B?MmJPcWFmSTRITnVHS2w3UXlsdHcyQi84M1o1bUFtTWtZZjJhUzNnVVovNmVT?=
 =?utf-8?B?dW56elEzZ1JLTHpmMWdVRUNHQk1ZK2s2dFlGc2UrYzNmbG91UCtrM0d4SGhB?=
 =?utf-8?B?V0VkUXFUM3hrQW1XSXN3bVAvMUY4SWg1ZkpIem9SUmNtUGFQWjZtN2pYSVg0?=
 =?utf-8?B?Qy96RzNzSmRwdmNTdmlwZFNQSGIwK1ZWSkV1YkoxTEg2Q0RaWVJ4dml5SHZl?=
 =?utf-8?B?OWdwNXZIMExoaWRaWEdBenZUVWJYK0xXSHVFc25vS01HcUhTS1BsNmV6V2E2?=
 =?utf-8?B?MUJnN3NVNjFSNklvNTdWaGFUa3lrWGxXMVBJOEFQZzZ1OG1kaVpjN1BtanFu?=
 =?utf-8?B?N1BmWnhLOEgyNm50VkxxYU5JMHYyY1ZQYThjcnRtcnJ4cy8ybExTZk90anRI?=
 =?utf-8?B?NlNlY3NZWHRBa1dIMEZSd2JDY1BJTXc2eFJCcWhOVHY4QWpZTlNDN3dBNHJw?=
 =?utf-8?B?OHVXS1VpdzJtdVNveHFPWnVLT3ROTzIwd1VFQlhnWWRZWEpnV0U3R0hpRnNU?=
 =?utf-8?B?WW9SQWc0R0djck5QeU9hRzhFeTVXQjZzNHRNMmRoRTd0d3BtY1VTWHJlUVpq?=
 =?utf-8?B?UUNlMC9uQjBOejJoNGx2QUxUaDBBZDREbVh2RXcxbURYeXlMZHg2bGg0THdZ?=
 =?utf-8?B?bk5kL0Q3dnpFejZYVWF5MnkvekUySXJlbDczUnczZGpMam1nSWNwNk43bzY5?=
 =?utf-8?B?S1B3dlpCRXRpVTdYc1V0RStpSllBTkdVTkNhdG1uZWpTUklydkViVjRWNnk2?=
 =?utf-8?B?ZXF2N0ZheDdVbGxDY08rOWFDQmxldFNUb044R3ZxM2ljNnNObHhGc1dmK0p6?=
 =?utf-8?B?cGNWOVUwUnNWU3JMRHNKTEkxek04UUJESXdnTXg1ZVNMcXBoOWRsUThIZTBx?=
 =?utf-8?B?bjBCWTYxdncwSnJUMDFZdHJoMEZyaTJ5T09hcFRuTFg4YkRsdWVWMjBtWDdO?=
 =?utf-8?B?cldPNXRSSkREK25LMGg2TWFIeVRKSTJCUEsvUUVTcVFLUGJlNEMvVzhWa3Fw?=
 =?utf-8?B?RzI4NGRTaHJ5SjcwcGMyQ1lVZmFKRmRaTk9UclBuUEczNDBmSVV6R1ZDNW1H?=
 =?utf-8?B?U1ZUQU5yRExDYWtGQjlwVFloelE1Z2k2Q2NuaVkyakpnVHdVMnI3OFJLYXBY?=
 =?utf-8?B?OFlUR2M3OEM3anY0RmZBVXp6UXZyY0l1cS9BelI4NXdYOG1JUXpLN2xOMG94?=
 =?utf-8?B?K3U2elJkQlhHeThobDBEQ0lJUjQ2c1RETmJEVHl0MFk0UmhyUDlUK0dxNHpw?=
 =?utf-8?B?YU04Sms0S0JPZXdjbWtEOXU3MUZnaTdqWVlSRHhjU3hLL0wzV2d1dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a6701a7e-3c2a-4542-0a6c-08de760d0324
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 14:32:19.3293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9hTa5hZB1uUsQmw7qv7lftptIKVBbtJJt5rV30JBJLzlsybpHheOsEJFHPB8JiEGG5Y9c9zTjrBB1/Y31qYLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6778

On Sun Feb 15, 2026 at 9:30 PM GMT, Andreas Hindborg wrote:
> Add a way for Rust code to create fault-injection control points. The
> control points can be attached to a configfs tree as default groups and
> controlled from user space. On the kernel side, provide a `should_fail`
> method to query if an operation should fail.
>
> Cc: Akinobu Mita <akinobu.mita@gmail.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> This patch is a dependency for the rust null block driver fault
> injection feature.
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/fault_injection.rs  | 88 +++++++++++++++++++++++++++++++++++=
++++++
>  rust/kernel/lib.rs              |  2 +
>  3 files changed, 91 insertions(+)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index a067038b4b422..87cbaf69d330e 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -54,6 +54,7 @@
>  #include <linux/errname.h>
>  #include <linux/ethtool.h>
>  #include <linux/fdtable.h>
> +#include <linux/fault-inject.h>
>  #include <linux/file.h>
>  #include <linux/firmware.h>
>  #include <linux/interrupt.h>
> diff --git a/rust/kernel/fault_injection.rs b/rust/kernel/fault_injection=
.rs
> new file mode 100644
> index 0000000000000..e9afa3ca6cf31
> --- /dev/null
> +++ b/rust/kernel/fault_injection.rs
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Fault injection capabilities infrastructure.
> +//!
> +//! This module provides a Rust API for the kernel fault injection frame=
work.
> +//! Fault injection allows simulation of failures in kernel code paths t=
o test
> +//! error handling.
> +//!
> +//! [`FaultConfig`] represents a fault injection control point that can =
be:
> +//!
> +//! - Attached to a configfs tree as a default group, allowing userspace=
 control
> +//!   of fault injection parameters.
> +//! - Queried via [`FaultConfig::should_fail`] to determine if an operat=
ion
> +//!   should be simulated as failing.
> +//!
> +//! Please see the [fault injection documentation] for details on config=
uring
> +//! and using fault injection from userspace.
> +//!
> +//! C header: [`include/linux/fault-inject.h`](srctree/include/linux/fau=
lt-inject.h)
> +//!
> +//! [fault injection documentation]: srctree/Documentation/fault-injecti=
on/fault-injection.rst
> +
> +use crate::{prelude::*, types::Opaque};
> +
> +/// A fault injection control point.
> +///
> +/// This type wraps a `struct fault_config` from the C fault injection
> +/// framework. It provides a way to create controllable fault injection =
points
> +/// that can be configured via configfs.
> +///
> +/// When attached to a configfs subsystem as a default group, userspace =
can
> +/// configure fault injection parameters through the configfs interface.=
 The
> +/// kernel code can then query [`FaultConfig::should_fail`] to determine
> +/// whether to simulate a failure.
> +///
> +/// # Invariants
> +///
> +/// - `self.inner` is always a valid `struct fault_config`.
> +#[pin_data]
> +pub struct FaultConfig {
> +    #[pin]
> +    inner: Opaque<bindings::fault_config>,
> +}
> +
> +impl FaultConfig {
> +    /// Create a new [`FaultConfig`].
> +    ///
> +    /// If attached to a configfs group, this [`FaultConfig`] will appea=
r as a directory named
> +    /// `name`.
> +    pub fn new(name: &CStr) -> impl PinInit<Self> + use<'_> {
> +        pin_init!(Self {
> +            // INVARIANT: `self.inner` is initialized in ffi_init.
> +            inner <- Opaque::zeroed().chain(|inner| {
> +                let ptr =3D inner.get();
> +                // SAFETY: `ptr` points to a zeroed allocation and the s=
econd argument is null
> +                // terminated string.
> +                unsafe { bindings::fault_config_init( ptr, name.as_ptr()=
.cast()) };
> +                Ok(())
> +            }),
> +        })
> +    }
> +}
> +
> +impl kernel::configfs::CDefaultGroup for FaultConfig {
> +    fn group_ptr(&self) -> *mut bindings::config_group {
> +        // SAFETY: By type invariant, `self.inner` is valid.
> +        unsafe { &raw mut (*self.inner.get()).group }
> +    }
> +}
> +
> +impl FaultConfig {
> +    /// Query for failure.
> +    ///
> +    /// Returns true if the operation should fail.

#[inline]

> +    pub fn should_fail(&self, size: isize) -> bool {

What is the meaning of a negative `size` here?

I did a quick grep on the C codebase and cannot find a case where negative
number is used here. It is either number of bytes for allocations, or `1` f=
or
when injecting based on number of operations performed.

I think it's also worth explaining about the meaning of size here a bit mor=
e in
the doc comments.

Best,
Gary

> +        // SAFETY: By type invariant, self is always valid.
> +        let attr =3D unsafe { &raw const (*self.inner.get()).attr };
> +
> +        // SAFETY: By type invariant, self is always valid.
> +        unsafe { bindings::should_fail(attr.cast_mut(), size) }
> +    }
> +}
> +
> +// SAFETY: FaultConfig can be used from any task.
> +unsafe impl Send for FaultConfig {}
> +
> +// SAFETY: FaultConfig applies internal synchronization.
> +unsafe impl Sync for FaultConfig {}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf1200428..1b8f1a216a268 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -92,6 +92,8 @@
>  #[cfg(CONFIG_DRM =3D "y")]
>  pub mod drm;
>  pub mod error;
> +#[cfg(all(CONFIG_FAULT_INJECTION, CONFIG_FAULT_INJECTION_CONFIGFS))]
> +pub mod fault_injection;
>  pub mod faux;
>  #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
>  pub mod firmware;
>
> ---
> base-commit: e9ec05addd1a067fc7cb218f20ecdc1b1b0898c0
> change-id: 20260215-rust-fault-inject-bc62f1083502
> prerequisite-change-id: 20260215-configfs-c-default-groups-bdb0a44633a6:v=
1
> prerequisite-patch-id: 5c82dc0deb0768531d2cdb24ac5e92857c9e76a7
>
> Best regards,

