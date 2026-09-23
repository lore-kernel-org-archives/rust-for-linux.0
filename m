Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022090.outbound.protection.outlook.com [52.101.101.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A773E47ECE5
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 10:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158976; cv=fail; b=KS/rFGDL+Ibno5jzTCDFPbi3ZK9z0aZNPODbMR6ecb6hWLz5dW3lDvJwD1npwvXN/d3sLIPQ1J40M5OYZe7rShVMEZXbWmPIQWHiozhETb9isTey3c6o1WCrBaKErPKS8zKV/ax8nvg8mQSzbE2gDByhAtUNslkT1nRjRXFQAdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158976; c=relaxed/simple;
	bh=Hvz95L6Nt/xNrGQnHYOp/9CfC/A4RWu9a+oTKJA79gQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jx6zHZKZqJOLc1WIIh6k6ttFYZElm6Bxubi+nlNHpndVOiSZgI8zwGhytM8V9dGRWn/alWIsZE6OPwzurDtSXLSm0I1vuFT2fN9wws4x9n4SeyR+47CGpOYw2w+JlnaWGCVPqgHr9FxRX6TMHSRNTbazFHTMIoo4RYF4iYbEatU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=J62Uzy0r; arc=fail smtp.client-ip=52.101.101.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="J62Uzy0r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBzZgzYPgl10KEsD++nxcVBxmG0rxd9aiQ2QXIEDHQpGNyusB/cVUyxyL2+/Ntdvw/ht8cR5IVwZAY3FdxzyZMPQWxqOc/igPjkxXFxFJ59qk9Wcf0kwgBhAU3CD3HJxFSQxBodNuTpNhPitHetWszbJ+XEWxIafHNTuGEQbzfRQpVQoegnYZKqJBQp1rIafxyZcJl6DFXguugxWehb3mgeEjlUF/mfkVPCz+n4JB1npNzk85M6KQuWzK7J1DDuzcz3vUJ3FVEZX/j36WDbOSRyCQeZHK9lk9R++/RmzQF2J0Wclcelm/c2ia6B6R55beinGER9T/I2cfi1byAt5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcGfFJYs98llroAp2vxqS1scUV0oW+QN5/1pUlxHyY8=;
 b=ALxFeMdEnEKp79sHDjTPcG2QUL396KZbBcb40EmxTJY9oBuZyl+/NvK8HBdhMQULFTlSG5W9+8bylqWOtKDyRLVCE49U4kXl0sCzRim2pK5PTqBv08L4RZ4kpnDFmDCmWv7ZczXltwbmbna5//jqgxg83ylIs8Z1T240aRidXfdpPil3ZuOVsjzNYhAXc8+onOWjOOvrUHzugzbeml2oSaPCF1HsX/aEjLggy/1BBoEtdHNw4oS8Sy1xc9N0U8aHiDDU0lTEKxEZ4WRGwX7apXc9cwi/btUu/k4up8jxDs+OML9DONFh6nrXEQOv5Kn+paxXSg/mMn0V1V1vCT4NdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcGfFJYs98llroAp2vxqS1scUV0oW+QN5/1pUlxHyY8=;
 b=J62Uzy0r/xvFuvlJAiVKjMhx3dvqAd0MrsPXopFWjDrfUHz6qUVVPVNf3GRdXGOOwC1spCt8h88O4eHt47u1E0n14cUVf0/oJj9dA2AdQdrn0+UEErMyCyy99jMwk+hmHCoXkVZToobd8io0M5fIzgU/tdRC8A2ieK0/M4lIUdw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6217.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 10:22:48 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:22:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 11:22:47 +0100
Message-Id: <DLMME4OBH3P8.3Q6UK95T2WGI@garyguo.net>
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <anna-maria@linutronix.de>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <gary@garyguo.net>, <jstultz@google.com>, <lossin@kernel.org>,
 <lyude@redhat.com>, <sboyd@kernel.org>, <tamird@kernel.org>,
 <tglx@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3 2/2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <a.hindborg@kernel.org>,
 <ojeda@kernel.org>
X-Mailer: aerc 0.22.0
References: <20260908230445.2430296-1-tomo@flapping.org>
 <20260908230445.2430296-3-tomo@flapping.org>
In-Reply-To: <20260908230445.2430296-3-tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0535.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::20) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: a87538db-dcfc-4220-c6ab-08df195c9dca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|23010399003|366016|1800799024|4143699003|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	D/EvywsY/3iiu0o1c5X1Z4tTgpRsoRn4q5n9ZSy/p68PWKSta8syqCA2ZrQ8oDHmEVkBKvmOO0GrTd7JOX8FwTNsL9BNkWh8ey8KEAi/LyaA6f6iYRApRaFFU1nLLPNUgTcJGY0VBGWVwJzli/n9sNi/4znk4zvUkE//USruI8ficCfe2UY+J4v1VFEygJ/VjVwp9Qg9ZjI6Bkd/G2riyPorpeyUz3NYmCeg13B4+oHMMU83XTibb34znRPYSo4dJcq6xB8f63V45rFmAnxH618gbSikmBQGkn0lTKTvEPSIcCtIWRhxQnSGMYUcbJNoib8SsGeVdv+WMLCHBuDODzOIEsTDRhWMA7D1V+wu2kjPjmUqZURVRIJvHUgMOBwVatqZDSIBFJuhwYHrS0bOEve9yVLouJiglmZoAN+grzhkKU6F+yNKDkuBLgcizf6/R8HQWh0NGJPhQEHLdlGPzCNHSJo/bCZF9677nYPJ5zb7MYeWli5n8AdO9ek2G5iA92lXUrLmFZ/8Vim3wF6Bjk+Qp/hmpvN1eiURKa1NOb1RLIEaCFgtqkm0ZscNdBed1Vxd+BHGSXvXBFkoVOK3h9DuM9WTn0Dpo8HaJOdw+tr+gwva013MoTpxhJoSzbt0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkJUd1BQNlFEKzhseEtUYVlLNGZoT00vOUVHRzJ5dFp5TmpmbmpMMTdqTHBx?=
 =?utf-8?B?bUZRREFEM0lGdlJYUDZVSDAzeDJaN2JRYlZnYytzUE5HdnEyNHJQWnNkSThh?=
 =?utf-8?B?am9vc3M2bUdBRFQrMUpoeDNCVFA1cFEyZ3RsZ1hYZDVYQXhMVm41U1kyK2dW?=
 =?utf-8?B?OUFQdFN6OFEzYXdtRUVkSnNIMkM4NW1qc1NESlV4NWNrdUlEMjlmK01vSS9i?=
 =?utf-8?B?OCt3OURzMEp6R1Z3STFKUDhuZEUwdlhPb2RpNE9SU1VCZlFadFN1eEJOZHZ0?=
 =?utf-8?B?enFoaTBaUXdQL2RTVDlOR05hZE9BNHZtVVdkMmp4TVFDYjdkL2o5b2hMVi9o?=
 =?utf-8?B?NEQwbnNkOUxDc3lTUXV4aUZSV0QvOWxDZVZSaWtyOWtLdk1tMktkckpLak1i?=
 =?utf-8?B?SGVEdG1SL25Udmw2ZmxkeVNyWWIvblpscWZKUkRteFZaNHN4T1k0UllqaFdw?=
 =?utf-8?B?QTN3MU9nV3cyTEJJUTJzSU8vTXkyQTZxY2UyQWZVNDgzWVZRVU9WekNBZFR0?=
 =?utf-8?B?RUI3aVdjdEkyVFREM1NudDB6aE5lVnQzZ0M3MlRsK21CM1VyZEEzbHVYSWFO?=
 =?utf-8?B?U1BKWTF0ZTZRalRKaHJ4ZlJnc3RBUzVQcE1tbUR0WEMreGlSQkZITlFKa3E1?=
 =?utf-8?B?Sm1NOTJpeXMzdFNCMzJBMXFDbTdjZWI1bGp1a0R3NzE4Q3NhN0VyZEZ0RThl?=
 =?utf-8?B?OVYrUUx6bWZDVVpCcUhkdEhHSGNVQmJYWm0yOVZ0MzZQUWUvek9oeDJwSTg4?=
 =?utf-8?B?b09sdXd5VFRqVTVvelZxSzBMYS80N2pNcVpHc3NrdGlUd2wramQzakdERFRh?=
 =?utf-8?B?blhLcm9BcGprc09MVzFsVEJzSnExZVltOWRLbTZvRnRuSGNybmZoU212bStE?=
 =?utf-8?B?WEN5Um4rNmYvdEpHbHhKdkUzamFxNmVCL2cvWUNZTWNDejNLdHVKU0ZFbCs5?=
 =?utf-8?B?c3hTci85dEV5bG5BaS9OYlF6bVdvQ3lEZXBWcHhVNTFjNzFOdTFFZ1hVSCtk?=
 =?utf-8?B?R24wWGt2bndHUnZoVDltSittS1pySkFkMFZLeTlyNFAySWpCNXJJSXhGNjM0?=
 =?utf-8?B?UVhFWGxST1RRRjliN2VZRE44d3BqS3NMVDJkbzlwWTZQZ3cwbWVveVo1N2tC?=
 =?utf-8?B?L0dORFpveEdSSURhQ2VZaTdkZXBJZ0NtYUxVYkFYSjVYTG9UTkdRYm5IZGhl?=
 =?utf-8?B?ZUhmOWIvKzVNaGRsWi94a3NORVRoNC9VYVlWWW1rMk01b2RYNFlpeVh6VFJJ?=
 =?utf-8?B?a0JOK0J4MnZnN2k1MzNsR3FITDhmc1hqMnpHZVJrbkFKM3M4d1B6dWNsQ0ZF?=
 =?utf-8?B?QjNiOGVlS25ZMzRhNE8xMW9YUE1odHNLUi9EcitSbG05OVBkR1VKbWVTUGk5?=
 =?utf-8?B?bXExTTFqQ2RaOEVoN05RRnNONUtRK2lzZ0YzS1BtQ0xxZjI1MFVOU3pTbHpD?=
 =?utf-8?B?eXZNOFhWVmZEdEcwREVNMFQrK2VjdzdvbXdRL2VDR201WFlpSWtFTm5aUW4z?=
 =?utf-8?B?YXgvRkg4Y0RIOE1yY3g5T0wzZUdWRmhHblZiSDBpbDJpWHVRWUwrVVVUQXl2?=
 =?utf-8?B?V1VnR3hSekNEbFZndUdPOFVUQVhLNFp4M0lQcEFEeGc4eDNkaHhwdWVzMGNR?=
 =?utf-8?B?RjhsT1NsTU5tbU14Q2FBMDZCMmhjMmcycmdwNGwveFg2bmE4RktnVXRweEN5?=
 =?utf-8?B?VGZncHo0UkxQdDU5cXNGaHlyTjYwZ1pjZ0Q4SFppRmNFWm5KbHZEOC9SdW00?=
 =?utf-8?B?OUlZeWh5THgzQjhSaVcveU1QeGRsTFQ1dklIcWp0ZnI3cXJaYUYzbHc5RXNG?=
 =?utf-8?B?Z3NESWU1a25tVEFLTjBiQTJvdThZMmp5Sk95Tkg3REhxUExCMnJNR3lQWkx6?=
 =?utf-8?B?cEl1emh2dkdIcjBMRHZLc3JNSlZ3ekZlNENJWTdlM2dLYmtwTlUxTEJPM0lE?=
 =?utf-8?B?SlNDOFlhUGhCSkIxMTNUN05UZFNFYW5sYWtZaHNIOVJJWE5BSUc5Z3MxbDlz?=
 =?utf-8?B?OTN2OXVQR3YwMGkreTBaUitaTTVkVUc0LysyL3N6QkZOR0ZIaXNvY1JaRWFt?=
 =?utf-8?B?MVBRSnczdUFobkhLTDl0Q0l4V3M3RjU3OW9xUFlsZ1FOQm9vTkdRYloxRE9n?=
 =?utf-8?B?WkNkazhkT21wc0lGZTFEOGR1NUtONjczbkxoaG82WExuTzNTVjFkQ0d5MGlN?=
 =?utf-8?B?eHpoOG9ZWC9aei9uZ2FsMm91Z1ZoZEgzREdNMkJDOFVGaE5TYTBIcVJmQzJ5?=
 =?utf-8?B?Z3FVQ215SWZ0ZHVHeThuOTUxWmViZHY2aHM0bUZpWVA4OVpwT25ERnV5Y1JB?=
 =?utf-8?B?SFJxN3FsekFpYm9YcTl0STRhVkdmZTRrVHpuaGZlSWlZVlF3OTJnZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a87538db-dcfc-4220-c6ab-08df195c9dca
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:22:48.5984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zB2H9mXvKNzafLpN991bbI+06eY5isTsfTxuCohro4udLmvp5VbOB2od1s7EAjdZxs8XpTp+R/wNuJPmMvY3ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6217

On Wed Sep 9, 2026 at 12:04 AM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> The boundaries of __msecs_to_jiffies() and nsecs_to_jiffies64() depend
> on which HZ branch is compiled. With CONFIG_HZ_300
> nsecs_to_jiffies64() overflows after 64.99 years, which is less than
> the 292 years a Delta can hold. With HZ=3D1000 a jiffy is a millisecond,
> so __msecs_to_jiffies() returns its argument unchanged and never caps
> it at MAX_JIFFY_OFFSET.
>
> Compute the conversion in Rust with mul_u64_add_u64_div_u64() instead. It
> returns (a * b + c) / d, computing a * b internally in 128 bits, so
> ceil(nanos * HZ / NSEC_PER_SEC) needs no input clamp and rounds once. The
> bound then follows from the arithmetic: with HZ <=3D NSEC_PER_SEC, which =
a
> static_assert() checks, the result is at most the nanosecond count.
>
> Unless the result saturates, the value is rounded up, so the timeout is
> never shorter than the requested span. It saturates at zero jiffies for a
> negative span, i.e. an immediate timeout, and at MAX_JIFFY_OFFSET, the
> upper bound the kernel uses for a jiffies span. Since MAX_JIFFY_OFFSET is
> derived from long, only 32 bit can reach it, and a saturated timeout ther=
e
> is finite, so it can be shorter than the requested span.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

With a nit below.

> ---
>  rust/helpers/helpers.c   |   1 +
>  rust/helpers/math.c      |   8 +++
>  rust/kernel/Kconfig.test |  10 ++++
>  rust/kernel/time.rs      | 105 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 124 insertions(+)
>  create mode 100644 rust/helpers/math.c
>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 440fb7638e3c..08374b163774 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -73,6 +73,7 @@
>  #include "kunit.c"
>  #include "list.c"
>  #include "maple_tree.c"
> +#include "math.c"
>  #include "mm.c"
>  #include "mutex.c"
>  #include "net/genetlink.c"
> diff --git a/rust/helpers/math.c b/rust/helpers/math.c
> new file mode 100644
> index 000000000000..e2ee29bcce0f
> --- /dev/null
> +++ b/rust/helpers/math.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/math64.h>
> +
> +__rust_helper u64 rust_helper_mul_u64_add_u64_div_u64(u64 a, u64 b, u64 =
c, u64 d)
> +{
> +	return mul_u64_add_u64_div_u64(a, b, c, d);
> +}
> diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
> index e6a5c7a795f0..0087749995d2 100644
> --- a/rust/kernel/Kconfig.test
> +++ b/rust/kernel/Kconfig.test
> @@ -83,4 +83,14 @@ config RUST_BITFIELD_KUNIT_TEST
> =20
>  	  If unsure, say N.
> =20
> +config RUST_TIME_KUNIT_TEST
> +	bool "KUnit tests for the Rust time API" if !KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables KUnit tests for the Rust time API.
> +	  These are only for development and testing, not for regular
> +	  kernel use cases.
> +
> +	  If unsure, say N.
> +
>  endif
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 6c0a5e8090d0..9e66c39f823c 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -39,6 +39,10 @@
>  /// The number of nanoseconds per second.
>  pub const NSEC_PER_SEC: i64 =3D bindings::NSEC_PER_SEC as i64;
> =20
> +/// The C side `MAX_JIFFY_OFFSET`, i.e. `((LONG_MAX >> 1) - 1)`. It is t=
he upper
> +/// bound the kernel uses for a jiffies span, not a wait-forever value.
> +const MAX_JIFFY_OFFSET: isize =3D (isize::MAX >> 1) - 1;
> +
>  /// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
>  pub type Jiffies =3D crate::ffi::c_ulong;
> =20
> @@ -554,6 +558,62 @@ pub fn as_millis_ceil(self) -> i64 {
>          }
>      }
> =20
> +    /// Convert this span to a [`Delta<Jiffy>`] suitable for use as a ti=
meout.
> +    ///
> +    /// Unless the result saturates, the value is rounded up to the next=
 whole
> +    /// jiffy, so the resulting timeout is never shorter than `self`.
> +    ///
> +    /// A negative span saturates at zero jiffies, i.e. an immediate tim=
eout.
> +    ///
> +    /// A span that does not fit saturates at the kernel's [`MAX_JIFFY_O=
FFSET`],
> +    /// the upper bound for a jiffies span. That is a finite timeout, so=
 a
> +    /// saturated result can be shorter than the requested span. It is d=
erived
> +    /// from `long`, so only 32 bit can reach it, at about 12 days with =
`HZ=3D1000`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::time::Delta;
> +    ///
> +    /// // A negative span is an immediate timeout.
> +    /// assert_eq!(Delta::from_millis(-1).to_jiffies_timeout().as_jiffie=
s(), 0);
> +    ///
> +    /// // A span shorter than a jiffy still waits, i.e. the timeout is =
never
> +    /// // shorter than the span.
> +    /// assert!(Delta::from_nanos(1).to_jiffies_timeout().as_jiffies() >=
=3D 1);
> +    /// ```
> +    ///
> +    /// [`MAX_JIFFY_OFFSET`]: srctree/include/linux/jiffies.h
> +    #[inline]
> +    pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
> +        const HZ: u64 =3D bindings::HZ as u64;
> +
> +        // The quotient `(nsecs * HZ + NSEC_PER_SEC - 1) / NSEC_PER_SEC`=
 has to fit in
> +        // `u64`; `nsecs * HZ` does not. With `HZ <=3D NSEC_PER_SEC` the=
 numerator is at
> +        // most `(nsecs + 1) * NSEC_PER_SEC - 1`, so the quotient is at =
most `nsecs`.
> +        crate::static_assert!(HZ <=3D NSEC_PER_SEC as u64);

I'm pretty sure we'll never want to a tick per ns, but hey maybe that'll no=
t be
true for a future 5000000 GHz processor :)

> +
> +        // CAST: `max()` makes the value non-negative, so the cast keeps=
 it.
> +        let nsecs =3D self.as_nanos().max(0) as u64;

Please use fn syntax and have `core::cmp::max(self.as_nanos(), 0)` or
`u64::max(..)`. Due to the method syntax hinting some action is taking plac=
e,
many people find it confusing, because you can easily understand `.max` it =
as
"clamp to a max of" while it actually means "clamp to a min of".

See https://internals.rust-lang.org/t/am-i-the-only-one-confused-by-a-min-b=
-and-a-max-b/13252

I'm somewhat surprised that Clippy doesn't have a restriction lint for this=
,
though.

Best,
Gary

> +
> +        // SAFETY: `mul_u64_add_u64_div_u64()` must not be called with a=
 zero divisor,
> +        // and its result must fit in `u64`. `NSEC_PER_SEC` is a non-zer=
o constant, and
> +        // the assertion above bounds the quotient by `nsecs`.
> +        let jiffies =3D unsafe {
> +            bindings::mul_u64_add_u64_div_u64(
> +                nsecs,
> +                HZ,
> +                (NSEC_PER_SEC - 1) as u64,
> +                NSEC_PER_SEC as u64,
> +            )
> +        };
> +
> +        // CAST: `jiffies` is clamped to `MAX_JIFFY_OFFSET`, which is `<=
=3D isize::MAX`.
> +        let jiffies =3D jiffies.min(MAX_JIFFY_OFFSET as u64) as isize;
> +
> +        Delta::<Jiffy>::from_jiffies(jiffies)
> +    }
> +
>      /// Return `self % dividend` where `dividend` is in nanoseconds.
>      ///
>      /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit =
platforms, so this is

