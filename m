Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020141.outbound.protection.outlook.com [52.101.196.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091451B4F1F;
	Wed,  1 Jul 2026 16:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922846; cv=fail; b=GDgf4MFkzOG6lhHKEvWNDR4Q53mjUeYt2SDmQje2GZQVgxEUf2JtwHLaUV9idnRBMgJ6pgxDwivBLc2cVyHlbwJV0cPpcprOU3ib7mrJmmqYsthtFlAVCN4uV8hvhmX0eVrD7DA+vhu5l4iZYS4TwSkbL6VLJ48Z8UMjJkPxFT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922846; c=relaxed/simple;
	bh=0yqMAFFKVZqK7svHjZ+m4LndStrwrU6Baba9/pJxilA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=MscrXOuCbJUcMqrLXto3ChuSDMsl+AEI5jAnA5y8+/g3EbaREUsDZzXjjHcTC9/JD0ryMCNIDcosZgEOHXK3jPsmtMN6esDftLsJ2FPvDSBJmZVVZtRjo9x0n2Y/TdsbCo4nD+ghu7cLf81eBuGZ34YF5ORkJaqZTFNgYJFFOt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=oCm9wLN5; arc=fail smtp.client-ip=52.101.196.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="oCm9wLN5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLdBOsZazXXY0XF/693bGvpRFORG3YUgGzbu4guyBzdzBlymLRlVKPjhwk193XZtk3OVTENAH0ji/N/wxdThKzh1SPsZhGQOyt/Y2CtKtv/L9qKm86QZdlxMrdQPmqSuJVz2sIiyBX7Fp2DZ8i4TsSSKu8cED0Ls8jBKG352tuMNvDpNNQ7vpGYbPtGcuXRrBKD8/SPAXPJvAejJrmHarE91O+Sf1X7zTeoyRYvVC5hPy5V4j1Bz/d9hzSRFYW5lizsPQgQSvGJwfKtGnarZnkz5tNva/FRL8TJPkebGXE4zfucvVIpN1/x5RZxwpWSTwCQCZ/anTt1IHP7FVLDBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVP2LwJQ9+6gWmFte2rKdKWwvVoqe/GyNR4cSfvmvmo=;
 b=U2Et6kLpOCM9ptslbSTPlFRtcjksEKaH+JHV1WLAlEUzhtmVk9+KF6E0h0Y7Qhj4roavxswpEtIr5vUL5BOryifnjQJfaRUz3XdzeIs+nJ4u856NRMB+nUhzDd/igFCwj/7c/HFeKXP3kU501d/s4Zm5VVLK8JuxwCrnO8uGJfmNrcwBdUkEdrh4K2GbJ8hgTwyYdQAxvuxSiFuXBNym3Isc/natAcWHkcTJrv2hJYgbbZLGPr/S/+yAgxJSDcWc2bFrbGUhXOhdLl+9hbRc/vLuYzzDT7WPxjQdR7x3X3H8c11l+gLZYDgLipfcGJPFsdJmygQBpYH6KppppvQp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVP2LwJQ9+6gWmFte2rKdKWwvVoqe/GyNR4cSfvmvmo=;
 b=oCm9wLN5g6vQxiGhjO6rmkYXx3CfTLOUsLeR+TGj6O8e4inVIDOyRMxj4498ruPNiO18qOavn+Y3wEUl65WhBssfmclbCVYyr+nCwgI8of+kyps/mmbk0WR/0jrDaFm3yWB7YRS58JdBOyOZkBhrOUSv4L2pdksGPDR3fSYkmy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB7236.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:32c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 16:20:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 16:20:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2026 17:20:39 +0100
Message-Id: <DJNDEDDBYJXW.1KX1X9QINHSQS@garyguo.net>
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Lyude Paul"
 <lyude@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Trevor Gross" <tmgross@umich.edu>, "Waiman Long"
 <longman@redhat.com>, "Will Deacon" <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/5] rust: add pr_*_ratelimit! macros for printing
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Carlos Llamas" <cmllamas@google.com>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com>
In-Reply-To: <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com>
X-ClientProxiedBy: LO4P123CA0242.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc06ef9-298f-4d68-f33f-08ded78cb152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|23010399003|7416014|1800799024|6133799003|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	wqSBtu8OlQ1ea3Ew12c1jd1ZEYfINZjY2i46rQYtIJDB2doJpq8qH9PUgsNAgVLDRRIAL0IhCnPCcXfxpJT9XTQ/2tWL5fH3CQdZ/2bTQcTuKzHhJ1wptenfaDvkPauLeIDXwNjzjocGUpodRSsyn7VjSUYM3bHyaSVzBL98G4jhQueYDe+emRhJNg+OKBePhInNYGC2EKa2PyWn8KeeedOYqq3jevjRN/x1t1+hdZnLd5l+6rgLybi/QXjnThifEV6F18lwEWJ+4a+Gc+d5dypWf/LgVnWwv5SGKXBMTOtTfjJcKj6zoRooeEXHgpCemsT/BuK+ladV3T9rnblTseRgeZ3NnOESqNqm22Tyq7RO4LNMXXikQmMF9CxBzIJzclfpBUttwBCw3C8vdCEF3LcdpEfXhMHkbG0phNFbpeGLNIG9lRKtwE/lJLywR4RSeTk3li2Yp76RvNTDDoYtsx+ViBuljdtk9o0KlH0Azmlp47v3V0ZM3Z8RfBnqqtCFlGdbEPf7iGjTFq1h6LGrxp2xUvulQz/tJO/mN8hBn9byIKF4aF5oiCMIBnITuErjYkkbi9UEz5R+bmp9ztwOAnCsIpKhKd9xuXuVnQAvkkhylhN1rw4yUB9vHk75Ih51BFC7OJjrb+HCGYWmcJ5YBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(23010399003)(7416014)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZS9TQWllbXhNbURzTFFOaDhyd3FCWmlYVjJoMlFwQVpQV2FidHdyZEM3MkUx?=
 =?utf-8?B?NjVmbk0rZitjR3ZKUUxBeHU4c0cxbXJoVG44NVowek5nek1jVG5ZTXd4dFVj?=
 =?utf-8?B?czVTZ0RkRnEraFhiV2NuQW5QeThLZVhwcVlLRjl5VTdDOEJ5TnZIR3FnNnBR?=
 =?utf-8?B?OFNIenMzVE0yZkFpbTlid2F5dGdBYURkZHY0ck5Ta0UvSjJTUkM0Yno3NXVG?=
 =?utf-8?B?VnNESTdKOHRSYkZHUDA2T1RNcldoTy9lZlZEeHp5K0dMWVdDNERjUE42T1dO?=
 =?utf-8?B?L2NPeDFDZStZbDd6VFZjSFNIeUhQa2taWGpvc0swVDRKN0MxeHpNRGhEZDE3?=
 =?utf-8?B?WnFZeUh4NzlQNkF6MmhZU21udGQ4YjZuVEpRL09pUEcwK3R6dnZITVlTczBs?=
 =?utf-8?B?c3hKeG9RMW9nZEVQWXMvY214L2U5MUdGWjBXM09oSXh2YldSckhFa0thUk81?=
 =?utf-8?B?SUJOYktCMXY2Y3IzNkFUQ094ZTRySE5mNzAybjRPV2lTVUxRUk9NY2YxbkVQ?=
 =?utf-8?B?K2NDQ1dZVGkyQWhhTlZmSU1ZN04wUWM3VmEyaEtJelRVTUJkazYxYk1TMDNQ?=
 =?utf-8?B?eHFTTkZoWWN0Z09QdVEvblg3QXh1by9DZkh5U2dyeUNIeVVJR2JWZFFCTlkw?=
 =?utf-8?B?clFCanhmdWNDVEZockxJVlR1UGI2TUFwSHVUajI1OXkvM1RzTFFQSklkNkRo?=
 =?utf-8?B?UGQxZHNXOFk1b01lczBhRW5jUGpWL0lVU1NxOGtrY25lTFFaUXRjQ1p5NWJQ?=
 =?utf-8?B?TVlBR1FxNUZNbW1RaFNUVkhXOXVHZnptaExTb2ZUdytReVJXcnJQSzRZZ0lR?=
 =?utf-8?B?cFZGbDFvZjFkSnp3NGs4WlpIMDB1d2xQS2dQL0paZHlNSmU0cS9uVThSdFYv?=
 =?utf-8?B?ZVBrM256Y1REdGQ0ZHBmR2htbFFnUmRrQWo5Q25SanMrNWZhSUhwcmJEdXR3?=
 =?utf-8?B?Tnk5TWw2SzM0SlZKNHdLd3lQckpQT1VqMjUwdVpjc2dnOG5oSHg0bkV5THVw?=
 =?utf-8?B?TlRKdDgxemdVd1ZOcVdXcG41ZDhOT2ZrMlFRSWRMZHh0cldMcTh0RFlJb1BJ?=
 =?utf-8?B?MlRUUnU4QzJHb2JlTzBVbWQ2Q2NQUWttbWhWKzFxamlNTkFFc1k2QTVPbGVT?=
 =?utf-8?B?aEhrK1R4SkRmTUh6b2NKek1VcGc5bU92dmU1dTdxYjZudXdKTEt0MXR0Tkxm?=
 =?utf-8?B?cTdnNFlKUEVOSmdzbmlzNEQ0R2pHSS9PTjUyWEJseUhOMGxHdmJrTUZPR2FS?=
 =?utf-8?B?a28yQXJTWEtSbFl6SkZkRStRNlZDeit3L2JmTVp1dGNadGp1YTRERWdxemZw?=
 =?utf-8?B?NlNmTUFEZzZoYWZ0aStYNlBoRGVSNFdoamQ3dTBmYmpjT21MYmJ3ZmpNQXR5?=
 =?utf-8?B?MTB0a0RHSVpEaWI2N3pZTkNCdW9ibDJLbDdpS2t2bGtZWThTR0l0bE92S21S?=
 =?utf-8?B?dzNiZ3BjZm1lN05JVjU5QTk0N2l6Q1kwK0Y2MkYvM2hJK0w2RmlIZjdXSUpp?=
 =?utf-8?B?N01uV2dpbFVzRnR4b1ZXM21vd0ZNRnNUN0c0eUxzaEhvU3NXdFlreEgwSEFw?=
 =?utf-8?B?RStQVXJkWFUvOWRtRTRkT3RRVWptVHVGSHVuMDNmVnlCUUV1UnJBNGlVUU5u?=
 =?utf-8?B?YnpmNHNTQUd2NDJmWUZWbGtoZHJ4SGZPMGZiZVBJUjdUaytPbUFpUjZjUlBm?=
 =?utf-8?B?TUhBT3VZMlR5c05JK1M4U2RQYndQdkRNV29reDhtVWMwTW0xV0hOU2J4clBz?=
 =?utf-8?B?NVBkZHphcXkrOTMzYW9xVHlSbkU1QU1oRWlSS0hzVlhkNmR1L25wbkNLUG9B?=
 =?utf-8?B?WmlKSFluQjRRUnhSM3NuU1I2Q3k0Sk02Zmk3cjUzb3NwSmtQa3k0QnZqaUtm?=
 =?utf-8?B?RmY0ZERReEUyTHZ1OWV6RGhWVDB6aTFJRm1maWlyVndDMEFVMGowMVNtSS81?=
 =?utf-8?B?eEEzRlNhcVNCWmIzd3JJZkJ6c3F1RnNKQitBbEpmV3JaOXkrRFQ4SHNYSkln?=
 =?utf-8?B?aSs4YmZoS3F2bGxLTjBsVUpqOThxcVhjYlIvSzN0YndnQW1Ec1poR3pyRFN4?=
 =?utf-8?B?eERIUllqaS9hSStKcmNtZndGQWhHTWFPTy9WY1FaUS9CMHMzK0M0VUhscnVW?=
 =?utf-8?B?aUNyRGpKUG5BZ0I2MmNEWHJuaWJUL1Vkd3ZVcDlCV2lBU2hVV3RYdFpGVERJ?=
 =?utf-8?B?TFhCWHNFaDN2Tlpab3RmaVNocGZzYmU0NTJ6ZGt1RDJ2QUkrUEd2bjBNcFN5?=
 =?utf-8?B?a3grNmpQYlVRN1E1emRab1ZJU2h2OXc0TmhUQnVCdHkrcHgzeHRjUUNMZ1lI?=
 =?utf-8?B?NzVQZDNPblZFUHVQeFpLenlVY3E1anNGUkNoMXYycHNRRy9RS1BGQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc06ef9-298f-4d68-f33f-08ded78cb152
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:20:40.5187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DT5bZs1teXcB922zRESzHTrDozXQL0ah5OuBYNRajsrGleJ+DicJggE4IvkJpbx/86qnTqiddAFLsp4Yt5/1EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB7236

On Tue Jun 23, 2026 at 4:38 PM BST, Alice Ryhl wrote:
> Printing can be very expensive if it occurs often, so printing that can
> be triggered by userspace should be rate limited. For this purpose, add
> a Rust wrapper around `struct ratelimit_state` and use it in the new
> macros.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/helpers/helpers.c   |   1 +
>  rust/helpers/ratelimit.c |  14 ++++
>  rust/kernel/lib.rs       |   1 +
>  rust/kernel/prelude.rs   |   8 ++
>  rust/kernel/ratelimit.rs | 202 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 226 insertions(+)
>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index d17eaec76450..2184b11c927f 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -80,6 +80,7 @@
>  #include "processor.c"
>  #include "property.c"
>  #include "pwm.c"
> +#include "ratelimit.c"
>  #include "rbtree.c"
>  #include "rcu.c"
>  #include "refcount.c"
> diff --git a/rust/helpers/ratelimit.c b/rust/helpers/ratelimit.c
> new file mode 100644
> index 000000000000..e5052f568b81
> --- /dev/null
> +++ b/rust/helpers/ratelimit.c
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/ratelimit.h>
> +
> +__rust_helper void rust_helper_ratelimit_state_init(struct ratelimit_sta=
te *rs,
> +						    int interval, int burst)
> +{
> +	ratelimit_state_init(rs, interval, burst);
> +}
> +
> +__rust_helper void rust_helper_ratelimit_state_exit(struct ratelimit_sta=
te *rs)
> +{
> +	ratelimit_state_exit(rs);
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index b72b2fbe046d..ba65ab4f0b8c 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -111,6 +111,7 @@
>  pub mod ptr;
>  #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
>  pub mod pwm;
> +pub mod ratelimit;
>  pub mod rbtree;
>  pub mod regulator;
>  pub mod revocable;
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index 44edf72a4a24..5a66028dd973 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -89,13 +89,21 @@
>      },
>      init::InPlaceInit,
>      pr_alert,
> +    pr_alert_ratelimited,
>      pr_crit,
> +    pr_crit_ratelimited,
>      pr_debug,
> +    pr_debug_ratelimited,
>      pr_emerg,
> +    pr_emerg_ratelimited,
>      pr_err,
> +    pr_err_ratelimited,
>      pr_info,
> +    pr_info_ratelimited,
>      pr_notice,
> +    pr_notice_ratelimited,
>      pr_warn,
> +    pr_warn_ratelimited,
>      static_assert,
>      str::CStrExt as _,
>      try_init,
> diff --git a/rust/kernel/ratelimit.rs b/rust/kernel/ratelimit.rs
> new file mode 100644
> index 000000000000..da0a49412023
> --- /dev/null
> +++ b/rust/kernel/ratelimit.rs
> @@ -0,0 +1,202 @@
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
> +            let init: $crate::bindings::ratelimit_state =3D $crate::bind=
ings::ratelimit_state {
> +                lock: $crate::sync::lock::spinlock::raw_spin_lock_unlock=
ed($crate::c_str!(
> +                    ::core::stringify!($name)
> +                )),
> +                interval: $interval,
> +                burst: $burst,
> +                // SAFETY: This type can be zeroed.
> +                ..unsafe { ::core::mem::zeroed() }
> +            };
> +            // SAFETY: This is a repr(transparent) wrapper, and the inva=
riants are satisfied.
> +            unsafe { ::core::mem::transmute(init) }

Hmm, I don't see anything that prohibit this from being a const fn? What ha=
ve  I
missed?

It looks like this type is move-initializable.

Best,
Gary

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

