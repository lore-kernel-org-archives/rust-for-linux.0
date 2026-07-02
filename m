Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020103.outbound.protection.outlook.com [52.101.195.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FFC353A84;
	Thu,  2 Jul 2026 14:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003713; cv=fail; b=jK6deTjQWQO/7rjiMNs9vWAPV6aUfJVzqOf2s+LV05N8WZqF1CDOuxURvuyGtMhQfPQ+XUjCxqVJA069Di6nmmzg4Mj7ZWnuZ/7dikcW9ddk012dSon92nuUs/qZRl4yRhCaYkHQyqz0oMBpCgMpzksJ03gY9lVRjf0CKdgSgyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003713; c=relaxed/simple;
	bh=jNHQxpV7bVDJCm4fyyD4kEIGyAOzGhwDay5fTPeR4CI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=etb5GZiRRm2exwK2e+4IEtGR/bP6wLh4liqpzpNQ4Vffoj2mvgjBbqBTVudFNIbGPalAReQ+1V7YrM9VS770bsHKMhOeFTJFKNPNkyjiAp2m7EyLeMb1GTyIawtoaF55lkjoiLJDm5xGOP37QUzg6gHgzAtHyFCuKajNHntLSmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=wJMIPuUk; arc=fail smtp.client-ip=52.101.195.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="wJMIPuUk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIZet+D5Z88oZL0IZcjfe9QTZtUpnED03OF0+o8qr4qz1+He902cjrui/dwIG+Bq71/7Xi6dI6OWsnjDG1u72oVXm1C/NdJbsBTJ6nRYSFr09cbzbFvkUObfdT1BefZQJUuKJzws5UYvTsoxswjRQfcrAGi6mwLQK57uZjrEFscHj638F1QR3kkiNq3KIKSCFpOUyX6LfX84GFRG8Ww0ar/WjjdjlNcSwZAurAnT1kH1nGnry9W82nxgofi7PNLW6dmRNR9kpEMp1kMQvfZR5w9+HHMUxFIXPfvbBhG/AeCW1ypVn4pQ83C7JTiTqjjIvuvjndNtm7nb6XnJElPJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPn9BMG22JKcDAUBLo/hqPqbk3iGQHOV8r86vg0GUxs=;
 b=pPIMtGkybF/f+Z91czBA/7NNChRumeo9Ov/NjET4QEa11U5vzEQTTdJDhlzEcKMhGHtsVY+bZcGO+0A08jxoj6elEq+1Y4arOSsKDHtZodnPD+dCOU0ba292/BadwvDB+AzU8kQvvXhoxBDk6NBTJ6Y58zsjgvNK/5wQhFA5UDFzYUwiKFdhaspW4KxoAt3eTEQhbbY63OFTFdrfXo3LQ0poDMcN/WrWif+Vgo/shdVP62IZ3P8CcAGkZRRtsvCCEQuhpDV26erRCbj3OXO2H0Msz4ygHvUQwZpU2/aaev1Itp6I1i8TfeL0OHKbIir3WAbn/xlCWsjW4OMcxEOG0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPn9BMG22JKcDAUBLo/hqPqbk3iGQHOV8r86vg0GUxs=;
 b=wJMIPuUk8JK88ZihCnOBvFHENUC7GNj6MGN8qN2BwXl2mfe4wa9BelSHJA819IbYsNiP2JA4tCyJX8f7nzZJ39ZYKN/fQEaa6BWcR3UACvI7zVoSzPkBqzRIkzu2OhbeWGpV9QMp/HZTNswA8nzJuIgmVRlbEUXvHgDfv1vxON8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB9085.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:278::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 14:48:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0159.018; Thu, 2 Jul 2026
 14:48:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 15:48:26 +0100
Message-Id: <DJO62B41MNR8.M2V5BRSQ32CG@garyguo.net>
Cc: "Daniel Cote" <danielstonecote@gmail.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] rust: kernel: create `overflow_assert!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "Antonio Hickey" <contact@antoniohickey.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.21.0
References: <20260702021811.758731-1-contact@antoniohickey.com>
 <20260702021811.758731-2-contact@antoniohickey.com>
In-Reply-To: <20260702021811.758731-2-contact@antoniohickey.com>
X-ClientProxiedBy: LO6P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB9085:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ed2946-a4cb-43b0-f4ef-08ded848f9d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|10070799003|23010399003|366016|921020|5023799004|22082099003|18002099003|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	BnBbClCJUP8WBC58EPEQlPx3p1RUri/EopksyHEP0Z8FLeXWaYIqHZ7RvE/0W1LhUDFSa/rv/9bDI2ZHDQYqd2C3bytO68wuew897F8aNkJncC/AGQAkRmi+IAkKsBVsQ74EUM8pW8m76kb9Cdxn0Pv7tulwbKV7bpTg3nluPzOWqBZxCZoY3uhM6V3fr0XIYcEixoZEliVuYsJqHbACRpugNIG6LaWu6RayBGs3HlGaLFoxebH5wdl32FUI+1c9rHGpUNdHEMXrSuS8EbZ+Wx5vUlbZaNxQG9BQthq61BuvWpZjaUdK6P7CgOfz8mMF8jDUqxBV/HeJTmmnX9+S41mEtOfKroe07vmAIWbzxQwrG1xmegPdW+3tUsZzoFBMSaclkZTKVswqc+SIIEqpZFMdoW5gZm9FgfpF4ikAD3xTb+lQjb7gdX97XN7QKAgpjpstllsK9TzhfkrZAFW1n/t0BWrPpYG/7k+LV/zakk7K8o42R5tUyAhJXAsp3j0pyRJZW3x0txaxvVlPOWvkZ6tGAvb9gULOKe/k6ugLk+cWP0Kplhcm5vTh8acpCfzJGhRDjV25CQoxdE4TWxsnV+2NXThOTa1GLHcU0LWLdP12fmoCB+HlmeIQgcanKi0++WrDDz+TsaFdHgT6nkSPYriHY+v8sPhOeq5msL572bUSZXHNskMpOZXxwzU+vV3MSWlvM71gLD6AFy+fOk38KQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(10070799003)(23010399003)(366016)(921020)(5023799004)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk13R1VIMDQ3RlV1a0VGMWhxb2Y2UVRISEtRbjcyY3VvWFJxT2ZaaVJYZ0VE?=
 =?utf-8?B?QlVSeER1eVZJdkNNV09zYVlZS1drZUZkTHNoMTVVMmJWRElUNzlYb1cxa1hI?=
 =?utf-8?B?dnVrQUJFOGdtaVVqcTM3RGNTaGRWQ3BhV1NsQTRVdWdHd0RXcUlrYXZIRERt?=
 =?utf-8?B?Z2dpMUExbkEvTzZwWWhPV1lMMFFmMmIyM0F3Q2VFVzZBQkNUUFFrWXUxRTZj?=
 =?utf-8?B?SHdnNUp4TXZPRmNpQkdveWR3dmJTTkFLVWVwK3JIejNMZ2lIbWpxUlhJVmdB?=
 =?utf-8?B?dzVhaEtXSVlVN0JXMDRBWWpvdjg2OW5WTnZyc25oWGRUanM5SkV1dk0yTEtW?=
 =?utf-8?B?RlBxenhDdlNFaGE2c0RoYVQwemIwMmtxNFB5S2hwZjBPNEJPVFdzMXh1UzdE?=
 =?utf-8?B?aituRU9adStJNVdhM00wOEFoVWkrOVl3WWh5SmlQZG5CRjBXODA2b2VENFFP?=
 =?utf-8?B?UWJBQXRuNWlUVTVFT2JnZWhmbGdSZTc5bVlxcENRYXJvRTZ0emZGUTAwK0M0?=
 =?utf-8?B?N2RISFF4eUhXMHU4S3gwYWhXRTBDSStyNUVoZGRBUDNUN3drWnhrL0l0TDd6?=
 =?utf-8?B?V09FZFRxMGRtdTNGWHgzL1BuTGttMlFiSTRZdGp5UDRZTXRJd1VEbVA0RW9L?=
 =?utf-8?B?aEJ5NGd0RWJSeStTZ1VLOE43QlRFbk1na2pid21Nd3hZM09pdmo0TDBHdDlG?=
 =?utf-8?B?RVVMcDdVcjN6cVJYR2NiUWJ1Z1hKYk5GU2pzU2RZUDF4cmlPNVJ5Z2tvNmZB?=
 =?utf-8?B?c25QZ1BjcWl2WUJYT1ZMemFqbC9CNVVXQnZkM3RFd21RbWVmbTdGSUgwck9C?=
 =?utf-8?B?MThmaU4yRUdXRTZiYWtsVVNnN2ZRRENUYi9Kd08xWUxnMEdhczE1c09KZ1V4?=
 =?utf-8?B?VlFqRzlhK1FIdFNMaWIyRzNZcUU3aEVUL0ZqdlVOQUEwL0FUZkJFRzhLYm1v?=
 =?utf-8?B?dEM3bnZRdklkejV5N0VWWS9idnlqd1J5cnpTWlVUMURIeEVOUVcrVmx5SG02?=
 =?utf-8?B?aG5ncGFvTGt4YVFCeFpIQWFYWTZqb0JKNjdrTEhSNVFMVkZvb1ExYzgyK2dy?=
 =?utf-8?B?WVNmSFc4V3E2NFA1Q0d1MWZiZXZTbi9rZXJqdEgyUVdoRkhKUUFEUDFOQVZO?=
 =?utf-8?B?NWJwQ3JGR3dhOHIxWm8vZlJtRXlnK2NCbkQxOERaeEJ3a3NSU0xOdnhXclZr?=
 =?utf-8?B?d21xTWZJaXJpQ1VLUlYyLzR0d0plaWNFaGRzMjZxMWhqOEExM25WVTJwRXJT?=
 =?utf-8?B?eGpiTWtOSEtjQVQzQlBGMVpnZFZacFNyd080SENRZ0dLMUJBTXZSc01yamo1?=
 =?utf-8?B?VTdhblVBUGxMUktzQTE1LzhWd01BNkdGT2NBTHBBN3BIcG5kaE1wdjdhM1Fr?=
 =?utf-8?B?eVZIVHNqbW5yYm5EdzVQWXdPZzBVam1DYkhROStQa05hWEVwYWthNEJ1cnUx?=
 =?utf-8?B?V0gveDBOa0xFdTh0dEozV2l6RjBUSXRZcG15bFJ6NkJNcTZuWVFUWldkaCtp?=
 =?utf-8?B?TitKK3hSSk9zb2VIc09USlNoY3RVdHRHM0xwNGVHT2lDN3R5ZlBLcmFmaGtX?=
 =?utf-8?B?aHZKc01Uak4zcWlHd3VTWE5jUEJCenFmeUZmcHkrb2l1Q0JSSTlqZmVGSXV1?=
 =?utf-8?B?Y3BLN1o5cGp2amYzZ1h5eDRDNWxhQ1d2M2NhMU9sbWs0VEtkV0FMNUVkZU1y?=
 =?utf-8?B?UDFkRDFTdU5jbmQ1QWpma1l1NVVFa0hlcjZ2WWNCRzFESTg4RnY0RVlyQWZD?=
 =?utf-8?B?MGN1U0RqVWlDTVVRR09GWDAyZFhzNDJFUm9hcjdTZmxyMTRmYkFqMjNCRzhZ?=
 =?utf-8?B?aTBOS0hGa0dUVVphdExKRE1nL2pBSnFMUlkrWXBnMVFWa1VJUkN2RjFkd1dY?=
 =?utf-8?B?UHEvZWJDTkVBZkh2WC80N1p6ZXpqZUxmNTg5OTN5TjV1UFR6SHRvcU1nYm1m?=
 =?utf-8?B?VTlqOEN1UXJDb1dLR2RUeU4xdDNjemhiWlJwSk5JZlQ5K2lZT0c3V0pjVjk4?=
 =?utf-8?B?WnRWRzZTT2JWME81djZtYUV0WkNzNzFBNld3Q0xvMjJFQkhYUWI1SjM5dTNw?=
 =?utf-8?B?RFhSTUN1TDN0V3pCWlNGcWxwUjgyV0RmTlRYaE0wUHRtSG9RWU9WSnh3cnlJ?=
 =?utf-8?B?V21uNzA3VnR6cmRjczZQNjYyWXdsRzl6TGxUM1BtaVhqdHErVm53eFl4YUc3?=
 =?utf-8?B?SWJ4R3krQWdnV045NVI0elliZ3YzV3ozN0MrYnNIYzd3VHFsUTZaektyS1NT?=
 =?utf-8?B?YW5FQUEyUVRWRE1QSXVEZWFYT1VUY09KVURJMjFHMVhRcmxtN04zWEpyTmJ6?=
 =?utf-8?B?TjVldkpPa3UwNGtVZlFYeUpOQ1RSUkNKZGk2NjhudVBMMGxONjBKUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ed2946-a4cb-43b0-f4ef-08ded848f9d8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 14:48:27.6480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zIL9w9+wvnu1774RDZl8VNxjZ2lYGDDLaHG851UN7fkEh4QZBSdqSG9RocRm7Zt/FvBPUug31NHNTzJtR8mOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB9085

On Thu Jul 2, 2026 at 3:18 AM BST, Antonio Hickey wrote:
> This commit creates a macro for overflow assertions, the use of this
> macro will avoid local `#ifdef`s by encapsulating the conditional
> behavior (like `#[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]`) to the macro.
>
> In addition this macro allows us to document the intent of the assertion
> more clearly.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1159
> Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> ---
>  rust/kernel/lib.rs             |  1 +
>  rust/kernel/overflow_assert.rs | 43 ++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 rust/kernel/overflow_assert.rs
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 9512af7156df..3a562b517952 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -101,6 +101,7 @@
>  pub mod of;
>  #[cfg(CONFIG_PM_OPP)]
>  pub mod opp;
> +pub mod overflow_assert;
>  pub mod page;
>  #[cfg(CONFIG_PCI)]
>  pub mod pci;
> diff --git a/rust/kernel/overflow_assert.rs b/rust/kernel/overflow_assert=
.rs

This probably should share a module with other runtime assertion related ma=
cros
instead of on its own.

> new file mode 100644
> index 000000000000..e3e822edda73
> --- /dev/null
> +++ b/rust/kernel/overflow_assert.rs
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Overflow assertion.
> +
> +/// Asserts that a boolean expression is `true` at runtime if
> +/// `CONFIG_RUST_OVERFLOW_CHECKS` is enabled.
> +///
> +/// This will invoke the [`panic!`] macro if the provided
> +/// expression cannot be evaluated to `true` at runtime.
> +///
> +/// This assertion is intended only for extra validation within
> +/// builds and environments where panics are acceptable. **Do not
> +/// rely on `overflow_assert!` for checks that must *always* execute**
> +/// (e.g. to prevent undefined behavior, perform access checks, etc).
> +///
> +/// # Examples
> +///
> +/// Basic boolean condition:
> +///
> +/// ```
> +/// let a: u32 =3D 10;
> +/// let b: u32 =3D 5;
> +/// overflow_assert!(a >=3D b);

The name "overflow_assert" feels a bit weird to me, somehow it hints to me =
that
this is asserting that something overflows, rather than just a flavour of
assert.

Not sure what's a better name, though.

Best,
Gary

> +/// ```
> +///
> +/// A guard before doing a size computation that could overflow:
> +///
> +/// ```
> +/// fn reserve_for_concat(curr: usize, to_add: usize, cap: usize) {
> +///     // If enabled, these will catch overflow errors early:
> +///     overflow_assert!(curr <=3D cap, "curr=3D{} > cap=3D{}", curr, ca=
p);
> +///     overflow_assert!(to_add <=3D cap - curr, "would exceed cap: {}+{=
} > {}", curr, to_add, cap);
> +///     // ... then proceed to grow/append
> +/// }
> +/// ```
> +#[macro_export]
> +macro_rules! overflow_assert {
> +    ($($arg:tt)*) =3D> {
> +        if cfg!(CONFIG_RUST_OVERFLOW_CHECKS) {
> +            ::core::assert!($($arg)*);
> +        }
> +    };
> +}


