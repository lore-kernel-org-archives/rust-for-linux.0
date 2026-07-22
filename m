Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021084.outbound.protection.outlook.com [52.101.95.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C72143CE44;
	Wed, 22 Jul 2026 18:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784744164; cv=fail; b=dQPcVvh4ptaXWw9E+hwAXYBrxLJJDB3WSk9tkROP6GiOX4O8UERNLeDx0Cp7G/zJu8a659wDoXUwUuMQecmDUcig7/Lu08835J+h16bOyNjrMkoeIKjdk8FXq1hPeRK7TIPsN0jw6hPP5VVvvIFnvSlMCKu7V/nq4/i3ZFATDUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784744164; c=relaxed/simple;
	bh=+8+5P20IG37PTOA9/KEXhDea4YvGHEc9LI8eQgK9yuA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=Tad4QFMxMpe3hOsnUcL6z23da/WnfTWmiOkSajPMA1ljDU+3bngUgTm9HBbjvPWVM+9ZYRoQkTk6/soBbsfmgPJu4EFnjPv+juQGzwHRp6XOomJZNZ0gL2Dk7N60dL7ilQA3P0QFYgzz35o3lt1MYT5FG2GsbKzRuc6zjos+SpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NQFAoRcg; arc=fail smtp.client-ip=52.101.95.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NQFAoRcg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BzhoGYuNaG1ljEmCjL7KWGr5y6yUzRjRKrSlcMh4kns9srsS5HEFhADjML5RHSo0mGFTo0jMap1vogsuiV3IbEtofSqsxpCFQ9oP4J63D3uEOuh9WlP+74SrDkbxtn/6jAgFquC2AWLs9fE1soY2ny3mGROp08UEkuSbd5rnD+dOMtYb9RoxU63oTtymw2bSbOBZXHn2b9ww5cCFLoAD1+CwSOcdY6amB9H8+OBh4JhSDGgR2xhGU4IdOw8m7cJ1rBLz3KqdZtXNq6TW8HjPV7istpcWKn9Kr6hQGjiGNL2RRsylgh9Cm3YyDT8fM/aArXlaMtNLNJCxH7jjmUgeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHal5Vft6alMB3EtusY21hh6epHBr3CvHIyL9QTY2+U=;
 b=SMfwB8newxWl3TKa7YIpD5W1SXF8yaoFn4HaKGiFG+DrtHD57ZPxlwJXghepY/vr/QKgqIfx3yiPeQOAj2p66E/z7Efn9d7r2pjA40rrb9DmKJ+Po60fM8Qv8niqbTM87j5kOLqwdP6UVoATSJbi0AFhqI0KN8pCJ2/24xdgHbXdE1XXsZXOe3/A5RgVVPJ1V+6k9HZhnoEdnf+7YO4w6pihd7bag5Yo52Nu0D5WUpsayvSycJ7zFsoQyOpWSz2TCzKLo/TJxW8DSi16xyXCgTXjN7uC0XGtt8Zw36smmT9YNdubezldDZqAUTx4gJxv1UXy0hyV41kGHfmlsKIeJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHal5Vft6alMB3EtusY21hh6epHBr3CvHIyL9QTY2+U=;
 b=NQFAoRcgiPwSVf8xMOY6NfZfR3s0JaGU44luTtnLqkb+CpDawkHspR7YetxGLxv2IDIT3U2a0jqWnHrx5NsLqktTR+05KJeUmmWw6bjBUqaqIGouDiQqPytBvMwt2XR56/7TN0wd5emIv/Y7EQHY9ctX+104QSXNw9nYIOh2wT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3184.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:157::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 18:15:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 18:15:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 19:15:55 +0100
Message-Id: <DK5B0218LGR4.1SU1DLMQYKAQG@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Carlos Llamas" <cmllamas@google.com>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Lyude Paul"
 <lyude@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Trevor Gross" <tmgross@umich.edu>, "Waiman Long"
 <longman@redhat.com>, "Will Deacon" <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Alvin
 Sun" <alvin.sun@linux.dev>
Subject: Re: [PATCH v3 3/5] rust: add pr_*_ratelimit! macros for printing
X-Mailer: aerc 0.21.0
References: <20260722-pr-ratelimited-v3-0-57faa37fdfbd@google.com>
 <20260722-pr-ratelimited-v3-3-57faa37fdfbd@google.com>
In-Reply-To: <20260722-pr-ratelimited-v3-3-57faa37fdfbd@google.com>
X-ClientProxiedBy: LO4P123CA0185.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3184:EE_
X-MS-Office365-Filtering-Correlation-Id: 90dce326-0290-4792-99b3-08dee81d45d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|23010399003|366016|6133799003|22082099003|18002099003|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	mFqfIOHMJFldv1jkaWuYLHO1arg/Pnh4VluUGf2z7Wty250Xu8GifuWQFmGAWTLGVWsD3z2nu29RFI9rlTR3MblwwVQLXvzylgMW22bKcxvi21ecbYAzWgpOkJx8DbKYsp3807N37/u8h6dyetTTYgPvdZt0ynoO9YQ2Us6ja75yDb7m5nZ6ck/5B/UDjAZEq3Ccp8ULWW9YgzvSa4gavZ6NphhE24kuHDZJUYMbEmj+oIZArBomtgut8x2EbpxQIotNq8iACfng+lOtfG5lj3/5T08ESSC3o607FxJCppT50+HQxQRaLIEBwPuVf1krlsvR+nbNA6T7Xp5Dw/9bMmLLUBjFHxy5vPGxaVbbF00DuTitR3A7/RY252CPKcNfyy9iRt3Fsv8PGFpw9ZgxnkXu4xc6WNo9vWtmhZL/6wH0Xwm0iUni2zsLWlPwO4yIccAJRCjVW/bNBTfYOz7ukapVCtmewTFM3mYUJhtH46wcsEC4MnEwAIrHW8/mDn9/uEtryXigF032OJ+3r5IKLTi2XjFCPcD+Au8lMNA4odpjINcSL9D1mqhdQwSg8uP9pkVV9Ujz69gWBguu1jUfghMQldAw02z1PRb+CZxnb1KRClGroJdJ20hiFFqmAZTRMsK2UMSEwa8MFtv2wpy2Mrz8K31vFQo+5LaJcxMfOXk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHZtTk1PS3NpMEZ2aHVXNGphRjhZcDBpbGh5VzdPM1FwZXlZNzliZ2NZOWU0?=
 =?utf-8?B?RTVTbG8vSWIyK3dKM2JsQUkzbUxQTG9nVXJuaGVnZk9uaHdJRGkvaHNUMDlj?=
 =?utf-8?B?OGk4MmI4WWhtUjFsYjJhQW9FWVNLYjVYY2dCU0FWWmtham84YzN1V090ZEZV?=
 =?utf-8?B?Wmord1FVWlRtOVMzcmJaV0RtSDViQmdnKzFYbUVVLzErL2Z0SmE2OWowTzMw?=
 =?utf-8?B?T3I5R09PN1hlMGZZTVRNUVpXbE1mbWtpQUQ5Yk54OEx4bTRZek1JS0ZvZUlu?=
 =?utf-8?B?L3Uzc056ZG9ZVEdwR3JHYW41ZFNBR3lROFFYRTU2TkxlOVRTdG5DQlJUT3ZR?=
 =?utf-8?B?QlpvTkhEd01kYzZlSWFOUXpnN0NQNlNWUTN5dSs3MlA4OEdNQXpGengyMVRn?=
 =?utf-8?B?YTI1YU1zUmdqWkc1K0tyMjBZbWJMQmpLdytuQzhwblZsK2c4cElDYXgvNjM2?=
 =?utf-8?B?a2pIWVUxT3FyZitTQWxCWklBaVlsQXdkQUJxOFE1TERLMkZ3WDVqTjl0cDNO?=
 =?utf-8?B?VlVWd2JvVEp1dURicEdsZHRUamsraTVFbHdOMEVsREtiSTl5QjZpaWFCbjAr?=
 =?utf-8?B?U0puRmRDUkdCSVI3enhDSlRCM0xNVHpXV1hDL01RZ2x4bXFoelRVUUJuL0Z5?=
 =?utf-8?B?QVZHbmM4TlRldHlWYkNGcTBQLzNraVl1cDFvMVJ1ZGkrY3VIQVJ5ekludmMz?=
 =?utf-8?B?MUFUbU9EQVFoWDRiTzF0VkszN25xb25uY01GSkdIcXJFSnhHZVpKV0xhNzA3?=
 =?utf-8?B?aEV1VVpTYnZGWXpIK2F4QTU1ZUVVYUFocW15L2NXUDBMM3RzR0RvdXZYekpD?=
 =?utf-8?B?S3RFenJNeHhHZjJmUzF3TlZkeE5qNWEvakJFZmNNbUt0MmNlRHkvMUZoajhn?=
 =?utf-8?B?akpIazVCTXVhN0xNSEhlYldMQ2RBM3NUZVhUR0ZCUWc1OHBIZ1d1cjVvUXlT?=
 =?utf-8?B?WlJNOFpZaVNYcUcxcmIrTDFWdEJVSFpOeU00N1BqZDhBVmN5bEtEZ3pDQVR1?=
 =?utf-8?B?NnB4Uml3VUxzVnRTQ2FxQVBTSGRKSHFNanlNYTR1L1hWeDQ4bE1xVGE2MVZM?=
 =?utf-8?B?SjUvMEk4SkNJcmhhWDNoNnNXcGlEajZ0Q2pQTkNrTjRkZFI3aGh4YjRkQUxu?=
 =?utf-8?B?VTZaNWxpbjFIWkJJRTJGaU41dzNPWEZvYXVOSzkvb1hTNlhhU1dOVXBOYWtD?=
 =?utf-8?B?MWh1cUZrQ2RQczlnOEkyNmxnOTRWMlpib3RmUmh2TVFCZmEvTFVVTGV5UXg2?=
 =?utf-8?B?bXR4R0Q3K2RyVTFFYkhDSUhMS25WL0hNbFJpcmNyVlBQZmt5ODhtTnhqLytq?=
 =?utf-8?B?aHMrRlpQYS8rcEQyWXl0Z1NHTm5OSDFsVnVZRnFqQ0s1TFRwaklCZ2ZuWUdF?=
 =?utf-8?B?RTRnMm50aGhJbGFqTllNN04yZ0s5VFprZVVyUEVhdUIxb3JURzc4N3g4Z2RP?=
 =?utf-8?B?N1k0VWRvMjVvd0RReVc2SHFJMkRwbGk1OXlYaXRqZ2NnTjdWaEsySnlZM0ty?=
 =?utf-8?B?Q0tGQ0YwazZLcmEvRmsxMjBBbDlwNXhRTldHN0dqcHlERllOQTZ1cHprYUYy?=
 =?utf-8?B?SXUyWkZBcDdsdGFldENiOWJzQ2Rwd0NaZDA3aGM4aDVHL2RXQVZyUE9sNzVN?=
 =?utf-8?B?WVhucURjdW83OXFDREVWRTR6TUdLT241TE1KZVVFTUZaeWkzTU5DRXlGV3R4?=
 =?utf-8?B?K0E0Rnhic1JYY2RpdE4vRGgwaG1XWlpESGdnSHBnUXo4MmtRckVWM21Gck1S?=
 =?utf-8?B?OVJzMlhxZDI2VDAwMUhUTkI1Y1B6NDk4Mld4WCtvRUJFdVZ5c0N5ald3bGIr?=
 =?utf-8?B?UDVsZVpmQnQ4MUtxbktxM1RFZDFUbUtTYUt0OXNXbVczanJPb1Rsd2VYVzhk?=
 =?utf-8?B?ckdrWmMyK2FDSTl1VnU4MmVPNDg4WnpsS0xjMGRsSVZkckpabWUzT1Rkb2R6?=
 =?utf-8?B?encrVXlZRFpGMUxZWWZicjhpZFZvbVNhelI0YlFwTmc5Skd2Ymg5QW91Um5R?=
 =?utf-8?B?enRWVlNDczhvb1dxekZWNnVMak5ZY2RaUm43ODJVRHFoQ1lwUC9OM1pHQWxu?=
 =?utf-8?B?L2ErTlBEM0ZGMktTb0F6TVFtYTBTTmZmdEljK1RSVDc1ZmUydExGOHY0RUJ6?=
 =?utf-8?B?OW5vanFyVCtRLzBXY2wyMkFyd0xYRjJOWjBMbnJ3T1FjUy9oQk9PblFrTENu?=
 =?utf-8?B?dTZRb0pRL3FnRzAwMnlmcWRlbUMzaTU1NHU2T3NiVFJHc3ZHek1abWNvQ2JW?=
 =?utf-8?B?RnFPdlBUdTAwMzQ1c3hhRnI0cG8yRmpHc3h6QXExVnFISzVuOTY3VVR1RzNB?=
 =?utf-8?B?aFpLMS9oa3pma3hiOHJOZmQ5cWZXQ1YwYXB1RERFRUh4dWRVaXJlQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 90dce326-0290-4792-99b3-08dee81d45d1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 18:15:55.7075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjxn3V9kP8vvpjk8tHP7NIHWcsNnlSi0Lz0h0/oSZ6QG41vfXKm3/gWQiA1JuP9F7D8lC36hwsFDUqb7uL7bDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3184

On Wed Jul 22, 2026 at 11:12 AM BST, Alice Ryhl wrote:
> Printing can be very expensive if it occurs often, so printing that can
> be triggered by userspace should be rate limited. For this purpose, add
> a Rust wrapper around `struct ratelimit_state` and use it in the new
> macros.
>
> Tested-by: Alvin Sun <alvin.sun@linux.dev>
> Reviewed-by: Carlos Llamas <cmllamas@google.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/122
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/helpers/helpers.c            |   1 +
>  rust/helpers/ratelimit.c          |  14 +++
>  rust/kernel/lib.rs                |   1 +
>  rust/kernel/prelude.rs            |   8 ++
>  rust/kernel/ratelimit.rs          | 215 ++++++++++++++++++++++++++++++++=
++++++
>  rust/kernel/sync/lock/spinlock.rs |   1 -
>  6 files changed, 239 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/ratelimit.rs b/rust/kernel/ratelimit.rs
> new file mode 100644
> index 000000000000..426992e452a2
> --- /dev/null
> +++ b/rust/kernel/ratelimit.rs
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rate limiting support.
> +//!
> +//! C header: [`include/linux/ratelimit.h`](srctree/include/linux/rateli=
mit.h)
> +
> +use crate::{
> +    bindings,
> +    prelude::*,
> +    types::Opaque, //
> +};
> +
> +/// Defines a `static` containing a [`Ratelimit`].
> +#[macro_export]
> +macro_rules! ratelimit_state_init {
> +    ($name:ident, $interval:expr, $burst:expr $(,)?) =3D> {
> +        static $name: $crate::ratelimit::Ratelimit =3D {
> +            let name =3D $crate::c_str!(::core::stringify!($name));
> +            let interval =3D $interval;
> +            let burst =3D $burst;
> +            // SAFETY: This will be stored in static memory.
> +            unsafe { $crate::ratelimit::Ratelimit::new_static(name, inte=
rval, burst) }
> +        };
> +    };
> +}
> +pub use ratelimit_state_init;
> +
> +/// Rate limiter state.
> +///
> +/// # Invariants
> +///
> +/// The `inner` field contains an initialized `struct ratelimit_state`.
> +#[pin_data(PinnedDrop)]
> +#[repr(transparent)]
> +pub struct Ratelimit {
> +    #[pin]
> +    inner: Opaque<bindings::ratelimit_state>,
> +}
> +
> +// SAFETY: `Ratelimit` is safe to be sent to any task.
> +unsafe impl Send for Ratelimit {}
> +
> +// SAFETY: `Ratelimit` is safe to be accessed concurrently as it is prot=
ected by an internal
> +// spinlock.
> +unsafe impl Sync for Ratelimit {}
> +
> +impl Ratelimit {
> +    /// Constructs a [`Ratelimit`] with the specified configuration.
> +    ///
> +    /// If `interval` is zero, then no rate limit is applied.
> +    #[inline]
> +    pub fn new(interval: i32, burst: i32) -> impl PinInit<Self> {
> +        // INVARIANT: This creates a `Ratelimit` containing an initializ=
ed `struct ratelimit_state`
> +        pin_init!(Self {
> +            inner <- Opaque::ffi_init(|slot: *mut bindings::ratelimit_st=
ate| {
> +                // SAFETY: `slot` is a valid pointer to an uninitialized=
 `struct ratelimit_state`.
> +                // The memory is pinned so it remains valid until `ratel=
imit_state_exit` is called.
> +                unsafe { bindings::ratelimit_state_init(slot, interval, =
burst) };
> +            }),
> +        })
> +    }
> +
> +    /// Constructs a [`Ratelimit`] with the default configuration.
> +    #[inline]
> +    pub fn new_default() -> impl PinInit<Self> {
> +        Ratelimit::new(Ratelimit::DEFAULT_INTERVAL, Ratelimit::DEFAULT_B=
URST)
> +    }
> +
> +    /// Constructs a [`Ratelimit`] with the specified configuration.
> +    ///
> +    /// The name will be used for the lockdep name of the internal spinl=
ock. See [`Self::new`] for
> +    /// the meaning of `interval` and `burst`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The resulting value must be stored in static memory.

This one is const-only so shouldn't be code-generated.

    #[inline]

Best,
Gary

> +    pub const unsafe fn new_static(name: &'static CStr, interval: i32, b=
urst: i32) -> Self {
> +        Self {
> +            inner: Opaque::new(bindings::ratelimit_state {
> +                lock: kernel::sync::lock::spinlock::raw_spin_lock_unlock=
ed(name),
> +                interval,
> +                burst,
> +                ..pin_init::zeroed()
> +            }),
> +        }
> +    }

