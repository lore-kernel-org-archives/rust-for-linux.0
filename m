Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022076.outbound.protection.outlook.com [52.101.101.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BFE32C93B
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 12:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766491569; cv=fail; b=WMjrQfq6wrzqcHvjgYtFZ34TE3h15R1Iwg6iNqegObAUdzPpaBL6UfERqSdJ3w+D7b38B4VdYujSWpB3oY5Se1xN9pVP0R33e0V21oTyz6idgyOnDicLIj/Ux9nP77rcasnjPpwvB7i5c8BdS0yoBvZhMyhnOKPw7atQt1SY5uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766491569; c=relaxed/simple;
	bh=DYomPwgffKtbd6OQLi1NxY2kxaVraD7z3imyNG57+k0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PF+C/7FLfmpIzmYr2FmMCNMwz3PQtYJ1Z9S2Opbe5Qg4D1Uov8jr96zOcCHBOzIJ8IGxvoU1MvhVwu5W82eTMlOr1Txw2hkfzkxbSx0bJACNBL7gaDJ3lDlgfeRjqzfWAGU6vl9hC9M+fPML+0Uob7OumWH3wvqAcNzu6njWrPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zrzh6rOP; arc=fail smtp.client-ip=52.101.101.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zrzh6rOP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=je24S3uc16K59Tb9nAJRbDLWJ1i8cYOxVQM2+ryPveKj4qgjZGN/OevowL95wSErQAGP7Z4jnUwVQO9Ka93ZtznURl3rcukwloix+ympa9N/9ETsVsWvGaGTfijsVpE+Ye9+hg0q4jSMu4l57FcqOwi8Rgdgjy25bQ4a0ukMnPhvyGaoWvgNGkobs0BjSG0omwL6sbQ1a/xNsyIEkLnfcvNoM6QTGK4m7RPBAmjSh7KAMetB+UtvgAffVYOpIVbyi24uswl1bp1Roj28ipnZNwgWeYVfeB+o5BpPfQXcUU9DIp/AIEeyr4uVRPbsTWpZGbiFCVhHlT6hVwMFZCAwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5RAT0nt+z6QVZuV195WRbiTL07eyUluLS6LFaFCbtc=;
 b=F0g+w8Ee8KrCXY/H2KSQIviw0LC1K81f9AhKlMZ5USTyGC3HcHx1IEGYfrb4NaKWQ3Wmx2ZVlDU5hM0ZJSkHDXc9wbh7OI7KDhPweHkNfZCPUyQpjjzxTmUysMkgLQ5uy+YVuhPqT7Ee+Xnvx+KdRVgf6IouYyeItQDKf5UETsWM5j+kfatwPpElKVOE1VBzgOIu4U5CO2PHqt1QK0b07ob8E8uSJyk73eSp/FtvVh3OpYCwSq8Hb767PmabOKFUyd+JLP1LiM7IIW4UwBo9YJOmjErbnrEdzWzNKA3HuepjsJD7MQWTaZb/48KUm6K5hjicES6I/DFAE6rsiZhr+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5RAT0nt+z6QVZuV195WRbiTL07eyUluLS6LFaFCbtc=;
 b=zrzh6rOPuKkEtFEiRD+ZxALkU0eXUTxy08rSX2thY9y8ytq7WcwMLwf2wzi88vLnHKqZLpeUwcmbYJR22KAyoIrbb5rQhU8HsTj1yu4z4XAo8Q+UQDrxUPf7diNgmsXKm0p/vykOXQt4j4uTadipTptfG3ubprHa8Ep6t89qkYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO7P265MB8469.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:463::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 12:06:01 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a825:7b26:a82f:d041]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a825:7b26:a82f:d041%6]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 12:06:01 +0000
Date: Tue, 23 Dec 2025 12:06:00 +0000
From: Gary Guo <gary@garyguo.net>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, boqun.feng@gmail.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v3 2/2] rust: Add pr_*_once macros
Message-ID: <20251223120600.6541cc8f.gary@garyguo.net>
In-Reply-To: <20251117002452.4068692-3-fujita.tomonori@gmail.com>
References: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
	<20251117002452.4068692-3-fujita.tomonori@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0274.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::6) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO7P265MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: 543bb396-2c37-4a17-908e-08de421ba3f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4+BaVw46cAZh/750XSMumfCt5olkHtszsvqo6Tt/YRTP8sXEOV8O6nnT89/O?=
 =?us-ascii?Q?iIEk9i39ugQE9KwNtn7cnBBEwB23cf1nAfqWoh8q70DKNHJNALsNIcw5/EjM?=
 =?us-ascii?Q?1x2rdfYPoSHvDkbrFqCq3cKAOWSE7aQHYDmp8ScXuYg7e8ykW4h6QsZHRjd4?=
 =?us-ascii?Q?rKx5XRl32A4TcHsf0hVtMglrPobzM9PPR8MDJIXjZfYbsMvnlz/5L0Q/vZZf?=
 =?us-ascii?Q?W5t/OLKsIZ8COqrXZLDHy1zBQXdjW9vhcTvdTWsqPOV5QN91GRxahSTCHbD0?=
 =?us-ascii?Q?wMeYpoM8Wqj3grLx2scHXubAj4y7QiUMYQX4C9C+qmfmF3MQdcQSl4PrGsQF?=
 =?us-ascii?Q?nCmRinAX65khJq5gWQOgAB13mXIlOCY0LdKYzBHETIzKuEv9HWncswOkxplT?=
 =?us-ascii?Q?JD1w5vWH2fI9D+yrwSmP6MlGKOC7+gA95KKJ0X6lTdIl2Z5JUiEnDigE0G2/?=
 =?us-ascii?Q?3f1oHnUZw8hwLbvGY/s6ktlmYJr1aHZjBQokEnBahD+PGaWmhPLudqUHw2rM?=
 =?us-ascii?Q?Pww0CtKa6E8mTJp9/EMmBop4h7CqjUIJN+FUZS3b6q77YHdWplUOF0rkY6gc?=
 =?us-ascii?Q?4Ij1KAQwTQLltJLqC3aKE7hQSrqz4eCkCwRNpEjCwZkcN4WAdk8087wYwS+7?=
 =?us-ascii?Q?4n8KYVjMT8RbFKqJZH3m1KqflB9fnxce9yzL5ZUTJ6ow6/cITxQ5Q8UNQnGk?=
 =?us-ascii?Q?kJUyCgAjPY/PXhjpIV6GMbDrJSsgN9LukZsU/snp3fos6HGndRD067uv17HN?=
 =?us-ascii?Q?f0JtQMu8bANUPTcSPjfJk+LjQWFCF3eyc5H8Z8LcMtohs+iMqXdNa6G/8/su?=
 =?us-ascii?Q?vX1gkCu00xTunAOJhe6YVPwnY5ta9YG3GepfDHSRk/BH5xYl0f3jAQKKKT3G?=
 =?us-ascii?Q?hZR9u9iL+UJMQlyEYTGnhECNqkb9M5uUBIIQGLMi8QWVgw4L1tNgVFTg/x3r?=
 =?us-ascii?Q?NgAvHQEvAlgQ5bR3/Q7C7ULTI7y1Ly1/xoZNzbrq9sWvpoQHIaTJb9VvJ4gv?=
 =?us-ascii?Q?//RHekPeBXkW7XJudCXflj00dHHy2b94ayqhUKdRryLjc5JYB7OLTr/YJtFq?=
 =?us-ascii?Q?nkS/RHj7eRMArq3SXGBRpHmJIC+gE4oQ5lwwcD5QxapY69Och6XawSQzaEOu?=
 =?us-ascii?Q?TnJ/GdVmjAymBdGDAmQ7zHhA3BlOwpnAWzCuAqnOjWBPHsP08qih2hj1d97m?=
 =?us-ascii?Q?tdSOvM7BkakQjXGSv92mbQTtKMb9Wao+cTC02tY61eudNBMY+X1N8XwJ+FPQ?=
 =?us-ascii?Q?NeewBbahKc/ikmsoN1AQZlkwVK0SJ92dKGD8PDjJ3fyd/D59VpVphV3Du+Qn?=
 =?us-ascii?Q?r52tlADrrGJ6Q+Rh5lCyB3xFS/kmmXgko+lufrzgGy7DtQzOKigKiFG5HkVh?=
 =?us-ascii?Q?+YYvVVpKwffxWw2nM6AQxF6yPU/WVYkCCbbpGq/zLhNgoRxKKZCSZb6cgB+X?=
 =?us-ascii?Q?Tw4eE/vURgO79MR3zEup0UBfXREZMKwE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?op7CjhpEh0mSOjfO0nf4FOjZnOvuDzDFwrEq5+b8y12uCTv1H/tfrnqV5Rah?=
 =?us-ascii?Q?PviRiYoxB/EfOY4i0PWE2TNUJs3idBgSQLpRAO05kJ1qws0imTy99OwFfMDe?=
 =?us-ascii?Q?qPtQw27GhtX2kQlY/ineDBlDGhtaWWegQbrgmHvY4c0BdFfmiilLSLODkFGB?=
 =?us-ascii?Q?Th3kk22cH0AGu1vJzkxKwAOZCY//8qmjCU4ZxmG1voh0V6u9ppe3mc+M/zmq?=
 =?us-ascii?Q?UgyGnEXLExpEdeLqLsRSjJw3qu90XhFGAYdjIlOjVBPRZhiFLUsYprtFc2QL?=
 =?us-ascii?Q?/OqSQL/pBrR1xRnl9KNM2BNhV/4OwoQgN/IL1IGLGIBC3UHZJsNqh2WS1Wv4?=
 =?us-ascii?Q?WZzBKBaYQg4XWotnW/oIBuO1gv+ZV1od+VoPdCEopTk86toYgiRvUfXsRMEM?=
 =?us-ascii?Q?vwpdCVngqIytRnrRhpfpFNDXarI+VO3sd24jwYw74uzf6zlMoQ8q2wEpxwMi?=
 =?us-ascii?Q?WL/F56ItS7VNohIKA2hxi6UZ5q8pfmxxtR+0x8nhgFM3G4pRpKwYe99vSMgs?=
 =?us-ascii?Q?l0pZ1OYKoabNhuyKeaKJe7bhuSjTOZjukg4GBEItK9gAxed+Pq3C9olHVudP?=
 =?us-ascii?Q?mHHxzSPB7pFAa4CZS1o7LFENtfgn/eEe+z5HP+/hIAYJImqQKcw6dkbq69fZ?=
 =?us-ascii?Q?PSDVeTLv4ICb8N26UPlP4EW7jQn/1wQ+2V6iwL1XUnJFLyXBOWpDsCXD2NHQ?=
 =?us-ascii?Q?Pwdr6GC91/0dtKUmX2HL6kiZBBFNbzr0+kMlAIBPRw8OMuiiwSi3+oDDNj3Y?=
 =?us-ascii?Q?0JxR0r+LSpDEMyUhq2tM7eA0+xO0ySdaPYu7y4rJ46lvpWpnVCRF2THQ3ZFN?=
 =?us-ascii?Q?vjg2vSUMNrNhm8cAy0CnQ93Awg6NJr2rZMNUu+4Bgm/s2sJPQct7GON3Iha/?=
 =?us-ascii?Q?hFh94SCj6H4cJtiMPTNL56bW3NNS1ckylie+kGTR4vlSwAdbqYdT09B/9qCe?=
 =?us-ascii?Q?pwW4QUqJ7QDtmVOslXqp7uEs+amQHXF7HAUcaCzDCGJh96KH4xDuVGb9T/AY?=
 =?us-ascii?Q?TIpadQ6jemmnk6PMIZhob8sIycEGpRZHYFQkenZnHX/pu4gLT4v6LnBWWDoK?=
 =?us-ascii?Q?OwY4YDp9aPA0VsdHTw84/CXXC9r3wyi/r0ETuBBXBdUDf4AqGK+5ccq5cff4?=
 =?us-ascii?Q?8DoqyLCQOZwaKF9UzW5ooyTVbmweatXX+VBWb0d3Z+lto/dh79Z3iMrB54ys?=
 =?us-ascii?Q?GZXSfqorGpuTPM3YMxGIMJodHMpwzSRPZA2flh7Fs7tjgN8QptbxkZEbFbsD?=
 =?us-ascii?Q?bA/tNnP00kUxK8nuvmDOxG3IMdWGLe1pfkD/MzrTxSDokAjwobkj45+FbjTP?=
 =?us-ascii?Q?o4Jy/nieCEosb1SAjs/YoGebyPQKKV5SLbGtDH571JLe2Ap7JX+bzyRbhpu2?=
 =?us-ascii?Q?ax8pZEB/tu6Fz08dXvDl05cp3Ob0SN92bESFLCb90JSIA0IhtsUwY9A35vR6?=
 =?us-ascii?Q?SIQpCsdCY455YzM38VPUqlDfaHXo6oFZL/aUtjbFM4cFJBM//tZwLFZU5f8I?=
 =?us-ascii?Q?NBdNdOiwHKYLPzdsScSfGe9GKFyFcJLSRQfIY4ASse0VWi1kOrVsdSDsp69k?=
 =?us-ascii?Q?aQcMzK1vwD1DU4TjC5SibkawNl8eyizVyzJiFsBJ1GAU8ZR5kRd4DjrVzcHE?=
 =?us-ascii?Q?1A1jiehd6uWXx+8JXoqABjBHP0oAbLmdDUYWjG55NS8Ev/0NeQ9qjAY1hPfK?=
 =?us-ascii?Q?6LqSguXzAJE2q+1BLmp/iMqzBersQiP3zk3oZyjcjbwPZkSeX/emkx5M2dR9?=
 =?us-ascii?Q?1qTEbDuzNQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 543bb396-2c37-4a17-908e-08de421ba3f8
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 12:06:01.6517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSbWXurjsI2Lvs2m0c9s/OOjJMojM9Cg+a+MVtRDnGNsj+pr8v0LHQ5QB2CczYki1+fdTvDC5Ew54Eoteqy0xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8469

On Mon, 17 Nov 2025 09:24:52 +0900
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
> macros, which print a message only once.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

A meta topic about this one.

I think we're adding too many macros with this. In C we had to do this
way because expressive power of mascros are more limited, but I wonder
if we should just add different flavours with macros.

For example, instead of

	pr_warn_once!("foo");

we could do

	pr_warn!(once, "foo");

If we are adding extra tunables, we could do something similar too.
Given all print macros start with a format string, doing this won't create
any ambiguity.

An added benefit is that now you only need to implement the functionality
once in `print_macro!` and all other macros gain the feature, too.

Best,
Gary

> ---
>  rust/kernel/print.rs | 70 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index af32054be5a2..6fd84389a858 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -506,3 +506,73 @@ macro_rules! do_once_lite {
>          ONCE.call_once(|| { $($e)* });
>      }};
>  }
> +
> +/// Prints an emergency-level message (level 0) only once.
> +///
> +/// Equivalent to the kernel's `pr_emerg_once` macro.
> +#[macro_export]
> +macro_rules! pr_emerg_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite! { $crate::pr_emerg!($($arg)*) }
> +    )
> +);
> +
> +/// Prints an alert-level message (level 1) only once.
> +///
> +/// Equivalent to the kernel's `pr_alert_once` macro.
> +#[macro_export]
> +macro_rules! pr_alert_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite! { $crate::pr_alert!($($arg)*) }
> +    )
> +);
> +
> +/// Prints a critical-level message (level 2) only once.
> +///
> +/// Equivalent to the kernel's `pr_crit_once` macro.
> +#[macro_export]
> +macro_rules! pr_crit_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite! { $crate::pr_crit!($($arg)*) }
> +    )
> +);
> +
> +/// Prints an error-level message (level 3) only once.
> +///
> +/// Equivalent to the kernel's `pr_err_once` macro.
> +#[macro_export]
> +macro_rules! pr_err_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite! { $crate::pr_err!($($arg)*) }
> +    )
> +);
> +
> +/// Prints a warning-level message (level 4) only once.
> +///
> +/// Equivalent to the kernel's `pr_warn_once` macro.
> +#[macro_export]
> +macro_rules! pr_warn_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite! { $crate::pr_warn!($($arg)*) }
> +    )
> +);
> +
> +/// Prints a notice-level message (level 5) only once.
> +///
> +/// Equivalent to the kernel's `pr_notice_once` macro.
> +#[macro_export]
> +macro_rules! pr_notice_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite! { $crate::pr_notice!($($arg)*) }
> +    )
> +);
> +
> +/// Prints an info-level message (level 6) only once.
> +///
> +/// Equivalent to the kernel's `pr_info_once` macro.
> +#[macro_export]
> +macro_rules! pr_info_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite! { $crate::pr_info!($($arg)*) }
> +    )
> +);

