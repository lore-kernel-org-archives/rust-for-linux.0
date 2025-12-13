Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazolkn19013080.outbound.protection.outlook.com [52.103.74.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A49E1EF36C;
	Sat, 13 Dec 2025 06:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.74.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765607834; cv=fail; b=Dw5fNvzto2z4WeobdJ06lldaMbrVPYAQJOCJReQjUbqbAjph5aweyecB67jQd3Bsu6125gty7GBd+RJQCWKIGbYWIhdtkXYFUmJupC/sYlHjv7KmJDJ5uVTPvAV8iJjKnaYxPbByVztmBw6uAtL2b5Rx3uvea0XWcY+9i+cUj9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765607834; c=relaxed/simple;
	bh=gv8JacO2rAgn9Nqb8UW7hS2cqbfz8ezVZZrgtFXBDF4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D7yDOLZFhyfPZd+/6nGZto2mtNK1Ka7uugJ8rlhEXk60T4c5xpSk4+EAZa8XNONTYwgwYs+6f7GuwDdXKxO7bSlI0A+icrhRtb/bQ0WHmMymnorpxNpRbMbgD/8KrNI9t1a+L83GhReSLMk3+WQjt5SOfiyIx1J7RgoAVoOWN+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=K3+Il8Yj; arc=fail smtp.client-ip=52.103.74.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="K3+Il8Yj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIDtlH5KO1VwRHj9M6Q//7Y6s/tJyKV/meINym2+yAfuByWZfZZieu1XMJybd/qu3mCbzkqEuO0VNosIBWnJZas9koMYlwf/yad8y6t7uLTgFdKQYOdc/6p+vdO8us/bwlFDctbGZrlGo+IiJmA/aAyIQYriHOefa7JIRXL2rx3NT8NVa3U4HIqDbPMQHH41o2cbZ0CT7r8H0YcDpjQp5Y6HUyiIOmqnWtUmfObkaFz1Tx0bP6IRQfNQHfHHzcg5vzjL0htJFOs+qIkVuRPQKrEvp+ZKFw6n08G/7HJS+m8utzJ+qwgCxJ5l0Tw65Unr7pixeEMOiza1MgRY6U8rSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNrR7vCIqDxtSx7qDtl4T+wX3ZuqNDxJJVEJl+t9GzM=;
 b=RgWN2dSOMgXRvCYhSQ3/Qz8xHx1cCZO5BuxRykZOJGnLXfQ9tspvV/9kK5RyJ7wbTUIuDOMYpS+iquBmacZg5+T5W0l1gYIjuPh8jR6cgvU7ABb4Ou0t62XQ61I8SANouEwV3TWzxOS40cmHvQbpDHphCF2BUCoVevj8BNL8I529VUR4ULywYNRmVDEtDWWczhlikDx03s/MpLPO2tl8AohOP8SdahGiaWjEDxNiv9g9aQVXxAd+INXWVvBzB+g3DChAV6q/a4LVS68vkllsp+/TdayCcXwapsfScUQjRimrh4FxJ1023/gZdA+aEeaFGJ9pSIOZCvAFFLUdn9nOng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNrR7vCIqDxtSx7qDtl4T+wX3ZuqNDxJJVEJl+t9GzM=;
 b=K3+Il8YjLYrxOEfBvfhZnFYuP2oKbCAgrcG3jSRL6JD8/cu7jIv4r3OMauUeiwilMEByX76aB8vW9wQT59+ytFpaB6cheAio/J2NG9txzzPAx4Nnv9MRYql338ti3fhPAwmsY5toituRrEue4F9YlaxYdLwJ1rJ3+q5UAjBD4u49Dvk/CcO89vzyPOTjutSk40nYSvmC2YaqtVYyNfWvotkw6GLXFvb1El9YHk9NqNoypqI1yIWbr0Ijp4vivAlCqnhkbef+ICtuFEhbr5A8u/fZIKIldIFwFgTg+Vc9/Rmq45FC0gmT9PHxIUkyabKjnHQIJ5o7bVOIM2ZqM0GkZQ==
Received: from JH0PR01MB5514.apcprd01.prod.exchangelabs.com
 (2603:1096:990:1b::5) by SEZPR01MB5461.apcprd01.prod.exchangelabs.com
 (2603:1096:101:10e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Sat, 13 Dec
 2025 06:37:06 +0000
Received: from JH0PR01MB5514.apcprd01.prod.exchangelabs.com
 ([fe80::9db9:d597:8118:abf2]) by JH0PR01MB5514.apcprd01.prod.exchangelabs.com
 ([fe80::9db9:d597:8118:abf2%3]) with mapi id 15.20.9412.011; Sat, 13 Dec 2025
 06:37:06 +0000
Date: Sat, 13 Dec 2025 14:36:54 +0800
From: Weikang Guo <guoweikang.kernel@outlook.com>
To: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, "
 =?UTF-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: Add support for feeding entropy to randomness
 pool
Message-ID:
 <JH0PR01MB551469C82704BD748841CC52ECAFA@JH0PR01MB5514.apcprd01.prod.exchangelabs.com>
In-Reply-To: <20251212-add-entropy-v1-1-e70ad1bc9c65@google.com>
References: <20251212-add-entropy-v1-1-e70ad1bc9c65@google.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TPYP295CA0010.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::19) To JH0PR01MB5514.apcprd01.prod.exchangelabs.com
 (2603:1096:990:1b::5)
X-Microsoft-Original-Message-ID: <20251213143654.4f4e7e8b@laoyekang-imini-Pro>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR01MB5514:EE_|SEZPR01MB5461:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c21801-36a8-4099-d5fb-08de3a120842
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|9112599006|461199028|6090799003|5072599009|51005399006|8060799015|19110799012|15080799012|23021999003|12121999013|440099028|3412199025|40105399003|3420499032|3430499032|13041999003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3YPxQ6P7yfW5rAL6J6cD59kgAbQ3nLqheREBkqazmOi1I9lcp31nTgXMfWB9?=
 =?us-ascii?Q?20SUi8Y02yKSkmNGBxsBVfZel2cT5fh3BI/EZ56qdYF57OW5gHiDWaFzKjGE?=
 =?us-ascii?Q?HcDVXAO7zG+QE5wG3z0FUsoXL8U3iQvUb+5EQq1zMdyb4BaGO3FEA3U3ihLR?=
 =?us-ascii?Q?CuCMrHiQTAiqJYKjFuWiUfF4BYcT/98bYbkUh9I5axSlqDrp8HeAeS5v1EIL?=
 =?us-ascii?Q?uiD/V4sOGQWvz1einpzHva6LtHzLDEUgX8qoPeavW6mHZvUBTxC0D0sUPsRb?=
 =?us-ascii?Q?m3XUr3ZUb0iAcnZSAE/vLJ/ESKfAHhow5I8NQ95b63OufH88CRMSkstvurnw?=
 =?us-ascii?Q?jg1eYZiQupGJBOcTqcJSHGaHkO7qc4NMbfibajbYzsrJTg4V/JAeDVU1FLs5?=
 =?us-ascii?Q?gVP8Fk5M7e0AtR+8I5/wDkXTWTbuKeDOUZ5ScwfTNrqPCVmo6y/iZ8Vea00s?=
 =?us-ascii?Q?4zinwXjUS4hrgLfsI82qLv6IE2xWIr3OeK8EtvnPatnGwAh9SyL5R8pu7xWc?=
 =?us-ascii?Q?xIto5G4TBfDix42EKGBX4YDclpMip/PavDEZkLzbcgdmDPibup3xi9eJRQbE?=
 =?us-ascii?Q?4QzRXJr8PM6hR1W2L3Qo424y4sBK0hFGZIvd7CNCJAfXmrREFaXb47D20Top?=
 =?us-ascii?Q?zy7YuGV3VtmUWiP/qVpU/wKxPW3y5N7aECeNwGPSPh1JolbCDJLA+0ktPFjN?=
 =?us-ascii?Q?RcmtTqsWd2rnM1nX78F2CqlRrwkg960QFUctbA29RFnLOSqytItXAEZY76Wi?=
 =?us-ascii?Q?W2WeiglrWQgFw9YxFu0HyuoAvChwRjUfe77+TFAB+mLIh5G38HBoK+IFMjZb?=
 =?us-ascii?Q?K0lV9pDax00W6ZvqYhPeVff6tmr/Wmv/DFs88E+7E132nICLbAPUz2hyc3DM?=
 =?us-ascii?Q?T+ps3OiOEHgSm+IqO0uZPKVbC+os0oVb7KS60ySFH1AQXVKWfYM6UbXS2j0S?=
 =?us-ascii?Q?/HRMUj50iEVbGsTGZ/vkkazFJhCLiD5D85FJWeWCjfmTrhuzoZ/4ht92LVdQ?=
 =?us-ascii?Q?mHju6T4PdMo7+1GcQ10vWnr/UdtUhR0Zo96377i6i6Yx1BDQEVMGIWfBxWoS?=
 =?us-ascii?Q?Q+SQmWWNUUCQasy0N3ZG+OamJFXrw/old0giVC1/KkbXJKLHSQpyjDkczbni?=
 =?us-ascii?Q?IHFe61DyHx+bIDu3Y4Uw/s1hmzJbKljJY0HEc9cln0Ah2c9CqV/0AL3Uasmz?=
 =?us-ascii?Q?BpFQWvg3VPJjBNyXYVyEQ3NBc8j/e/uEWeLeO3/pYDj6a//vlVox3KoQN9W1?=
 =?us-ascii?Q?/Pop5Ajjh1z0FDC5+2DCuIwQe4f0nwt036HaFiTSAFjVG6xhzSWMK5GQEt/b?=
 =?us-ascii?Q?6LI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ss1Gokxh+rV1ZJclDArOZTOV7E6AIHlvwjhgltqm+0qsjVHZt6Ep9q2djYYk?=
 =?us-ascii?Q?fPFnC3I24z5weZBWQZxd6mSKe4+OZeHgi1xyVK4FfphYwcLSfnQeQ7wvqG22?=
 =?us-ascii?Q?ITRyyTmvF/5VGnwI0iN+W3Unz2quzUbmDazWII5pmrJ2HAJGw2h7x+xzZu0r?=
 =?us-ascii?Q?HPFIcOu5k4gsG5k0T+wgF09yJnRWnLukZfLeUoA6Sl9WYa83tQ63NkAn6bCp?=
 =?us-ascii?Q?x6HFAO5b+pzg4h6j6Ek4jwGFISpdUMO8kIFEG9b0+SPcPvKg4spDfqWozctu?=
 =?us-ascii?Q?TV0+f2mGORqLT8SH5W0rCU/5rfUfvREkVXCdQoKg2seTr4mw0K4J6OG5MEiM?=
 =?us-ascii?Q?/Mwk3vu8y0X1cakEiYQ8suScGwbhrBGa7cYER8HVMSvZXCRTpwOfqIwSeUUE?=
 =?us-ascii?Q?4jYUPvu8SQKqQxcef7CDBM5d6RJQ542chkuCU98mujtoCtv4derz6ZobkmKP?=
 =?us-ascii?Q?zlgWr6vd734Tv/yWjZKaOIjiQ/jWYF3yNeSLKR5+IVXCa2IMhSJPSMRW1Yb2?=
 =?us-ascii?Q?ZqUwBaQfucp3NV2nSeX+9+hSH2TtdpV/5cs75LrxUUSFSVhmEKJnXRtQ0K6g?=
 =?us-ascii?Q?jbKLiR8SPgE1B051vclpTQ71S8pMoIKSH/Fn316Hm6CJQy2sAKQd8jCVuOU8?=
 =?us-ascii?Q?rzFee/dACI1YW2k5viENfIrggeLHk19vr4h8mFpQu1IQjxCtnP8qiCwqOcjf?=
 =?us-ascii?Q?oRV/RWzLJTR+I6pCHZsA0Egz3RE9okhLHORPd7zzEb8DqDcP76q9ecGnkevc?=
 =?us-ascii?Q?XVyoxeI4oIUQ5YpflFJx1te6/kRzaalkMKwSaJQm/P+bqYdb666O93bYG2UU?=
 =?us-ascii?Q?3g+yuUgeOfYR4bFK8TlOn5q0cejZE03roIA49p9NttZl2wQDDtIXoDTCSnfV?=
 =?us-ascii?Q?xTGWk1t3JontzPMMVG79Nbcm7nt7RWZAXq0Ed7KCi/TRImF1qbPM6lS3Xvu7?=
 =?us-ascii?Q?c9dVpjX0LrFTDzENu8KB3qPA1POQ/2l85oAz7XRlYN0BThcyq4eFOu4IqVnG?=
 =?us-ascii?Q?sD9SqwSy9+hQyflhfap38YBWuESjAHpbmYVkLxgA4OeYS3PADNs0rgh7JIpl?=
 =?us-ascii?Q?CGPBbVv+zhwM5wgLjbyDwlrj6jtFAaymr06QQl/klGpTsZ3wn+COfAGwNdve?=
 =?us-ascii?Q?t9EhD+0HprC7M60nj5oXhRIjjJj5sE22Cr/X6gsyYU0cQxyHwepzgetNNSQ+?=
 =?us-ascii?Q?ChRhITkaFMfCnjsXcrL7xJQhtJim0wiIWlpHLBv5/17t6A9F40uUeXiLX3yC?=
 =?us-ascii?Q?Iinzr73+nk17brE/q1zb?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c21801-36a8-4099-d5fb-08de3a120842
X-MS-Exchange-CrossTenant-AuthSource: JH0PR01MB5514.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2025 06:37:06.3984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB5461

On Fri, 12 Dec 2025 23:19:07 +0000
Matthew Maurer <mmaurer@google.com> wrote:

Hi, Matthew.

I think exposing add_device_randomness() in rust/kernel makes sense,
especially for Rust device drivers that already have access to
hardware-specific noise sources.

> Adds just enough support to allow device drivers to feed entropy to
> the central pool.
>=20
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  rust/kernel/lib.rs  |  1 +
>  rust/kernel/rand.rs | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index
> f812cf12004286962985a068665443dc22c389a2..f93886ef4eec9c4356799f4b55916bc=
12c10c621
> 100644 --- a/rust/kernel/lib.rs +++ b/rust/kernel/lib.rs
> @@ -128,6 +128,7 @@
>  pub mod print;
>  pub mod processor;
>  pub mod ptr;
> +pub mod rand;
>  #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
>  pub mod pwm;
>  pub mod rbtree;
> diff --git a/rust/kernel/rand.rs b/rust/kernel/rand.rs
> new file mode 100644
> index
> 0000000000000000000000000000000000000000..b3fb30f40a8950ac7b47d48129eb890=
24a1cbd26
> --- /dev/null +++ b/rust/kernel/rand.rs
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Randomness.
> +//!
> +//! C header:
> [`include/linux/random.h`](../../../../include/linux/random.h) +
> +use crate::bindings;
> +use crate::ffi::c_void;
> +
> +/// Adds the given buffer to the entropy pool.
I wonder if it would be useful to document more explicitly that this
function does not credit entropy, matching the C-side semantics, to
avoid semantic misuse by drivers.
> +pub fn add_device_randomness(buf: &[u8]) {
> +    // SAFETY: We just need the pointer to be valid for the length,
> which a slice provides.
From a Rust safety-contract perspective, this wrapper looks fine to be
safe, since the pointer is not retained and the data is only read
synchronously.(may be you )
> +    unsafe {
> bindings::add_device_randomness(buf.as_ptr().cast::<c_void>(),
> buf.len()) }; +}
>=20
> ---
> base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
> change-id: 20251029-add-entropy-f57e12ebe110
>=20
> Best regards,

