Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022092.outbound.protection.outlook.com [52.101.101.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7CE2D948A
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352639; cv=fail; b=IpbbWyAn6LWk5KpuIXlzfx1ajBHbFaNkXJF9oMlQjVj4UzddgYIlr1uB7ADA4kiLva+319etiHkGo43WgwwfVTNH5VKBSUIJRCdCa5TqJ3IzfdUZvFPAIISo9AJIpoMjheCcHjN1tmik7oMKzEEP6nIreWhuXy+gQgDyD2lLn7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352639; c=relaxed/simple;
	bh=7dZp2Tx7CcXbk+Pd0aKrwVd43UfCOEmg+1tQdh8hJ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SOfdEOTQTzGho9UNxrSBu/joukNaz2PLrOGoom/tPmYWofS6aq/YS9wWbQGuIo+ulFz77I2dgeUDHCT0O31qV71NGb+VYmwyjJqGZFD/X9TP4gYlZypB9Foulg5MtK+81E1qMuQtbKx3NMl41eIQCS5XIm8RFdIUl7SRQBo+W7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=BdhpbR+8; arc=fail smtp.client-ip=52.101.101.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="BdhpbR+8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEGoSWjMW3/hEXcsg+vZiAWvUfFHQQfLhZQ0kk7UhAZZ/8CfSZb2OavNWAdUMWR9MwKyn33Li9IzmARNeI6oq2xdmG0rSeoEoJSYWE6zMsiUjTib9p7wum8n+M8qegl5sc2EmrYyNLnC4B44H3K6qhydXurb+R8DZFsCBOsbEYNE3cDZiGPjLm+wF8su9A8v0HSZoF5Sxh94gcknTLXvNbMVnsI7NVGlG3wIuyL8euy/0NoP9lgv5t6r28d1OPxNpg5ZoOUJMgs4lcbe165c008eYkDAJCPWm74sg0omKRXG23q8JFya+ExwpCnUlQzISxj5S0jA8Zbo9vOOQBRnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTrsQwYjZptkbxCNQeO3Qov1rDnWpWlaLHNAGKwGsB4=;
 b=asVbdCF6VBTrJu0e7Z49zVJRuNsaDtI5ieLepjKtLzHBmznigW6sO8r9tsF3kK1CtWREdEUgrp58OS0v5n2DCdhnop0BdknFsFReFpb3XtHIPzMQDZ7rXpZvfy86gv8ZwaH7gFiAi2mvxGpdkxmPQLzsZg+VH77ndXSQSH9Por7YeS0W4fMm7d5XGSvtxd9EJQbqrTBAwr+2zqLzxF2neNm1Lmizr1aexoJsdmt0ift8qYN6Nh2rIIIhPAVKIMO0QFwlWqQ5ljqVNW3y0NDiBdw6lZfrzdVXyqhfoDus+cCsSwp8p3aIojZnAB1d6xPJiQdb0BoQNBy1oglm3cb5rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTrsQwYjZptkbxCNQeO3Qov1rDnWpWlaLHNAGKwGsB4=;
 b=BdhpbR+8UJOrUOm+g9aIhXo+zkNiezoN2D8T1ZMHl5ODzC2OdqhqArkMXTw2mMexkWAi/vG2sM6M5GFs+2datoqpuczocRNWWigfA9iEf+ro7nO1SXMUQhTCrkF+yk9wXMqO3RtzhM76OpOzlfGebb0PU/DPVnZzttmdVY0vav8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6062.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 11:17:14 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 11:17:14 +0000
Date: Fri, 2 Jan 2026 11:17:11 +0000
From: Gary Guo <gary@garyguo.net>
To: Ke Sun <sunke@kylinos.cn>
Cc: Dirk Behme <dirk.behme@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, Danilo
 Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, John Ogness <john.ogness@linutronix.de>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Tamir Duberstein
 <tamird@gmail.com>, Ke Sun <sk.alvin.x@gmail.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v8 3/4] rust: fmt: Default raw pointer formatting to
 HashedPtr
Message-ID: <20260102111711.0b2f864e.gary@garyguo.net>
In-Reply-To: <20260101081605.1300953-4-sunke@kylinos.cn>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
	<20260101081605.1300953-4-sunke@kylinos.cn>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 026f9747-ca6e-4778-3fbd-08de49f07b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iJEsWoFarzvsq5BGi1Rl/aGXr89j/ONKjQjz2YPwSJLU/P0irrsoIM1XdMSB?=
 =?us-ascii?Q?3G/NVH/1EHjDL8jaBTPZbBYZq4K7I8InUgQJivDaAbpk7pj7Mgwva/4fNGcP?=
 =?us-ascii?Q?mi8CkSpDvmdKM3eh+gNAMUlaa+AQOtet8lOmEUMHsq1fJHTLvNTpw2OJdxIy?=
 =?us-ascii?Q?zuwf9rRxtP4IoOGuq8X0QSYkAkDPbmbuNMIjYyyF+S4B2oeCflt68el2hjeX?=
 =?us-ascii?Q?EofFvaP5euClPJ743ZIwDmBYUmb1Us07UR5tSwH1XaxGwQs6jZ/PpqIDa5zS?=
 =?us-ascii?Q?anWbpDA3XTzi3TZxvcycE05zrV6Ofb9TPa5ZrAVRtWfbPm/rZa64YelbmltD?=
 =?us-ascii?Q?o+c1GE4M3XWju3OA/6PIoC/h3qvlcAWrhpbz8McSIHa6ed0BcQXUOqqjbnef?=
 =?us-ascii?Q?xTBzvrCdnfpkT5w/Lg+VvSoN3ar/n6CGEuziY7ggVx69Bvxp+XQDs/vHTiFv?=
 =?us-ascii?Q?1lMfuzeEsJCkARsIWTgbRbR6NKatzhxEsFGruZ3Ne6ymrdSn17eZUE12mmNc?=
 =?us-ascii?Q?mdg9Jh13I3lSudbkklQncbSOQYjaiLHJ1qOpY/wSOLgBt3ym/sbpdXbNVni7?=
 =?us-ascii?Q?zH6Nhx8cQnzJzW4XLangI0ORJvNwvHZpxMx9owruPH4TFztdqdK9p/T7iTqX?=
 =?us-ascii?Q?gR/8rY8Cx+R7G7AmFb04t/+0olk8jJQET2DfVXc2bV8Gf1DMfrZzdhvkhEf5?=
 =?us-ascii?Q?yH0gLKl0+K0aD/9dCF5AZVHpgTDnQmvAVOHI8Uz48+SfdUMX0Kgazxletx5T?=
 =?us-ascii?Q?Ro8bkeMm6mAsI9CDI7c68tKMQ+OisMOV7vXr3nkZ8/ION5P6jC2XKDs+Yo1R?=
 =?us-ascii?Q?Js6XhYgrHqaYGd0NTJ5CMyySPp5g3uNMkGVHxZrprne/bIhNegAAdBTaWa5z?=
 =?us-ascii?Q?PdoyrB+2LsDfFMdpCkaWCbMOLx/WFLyJ3nijJvZyrC3RAy0sIUnpyPO2Z7R+?=
 =?us-ascii?Q?oLOs/ujqE6Ljz9fADnvW1dzXaqcfXwOAH1Sr+eA0ycH3RIguOlYJDdiHL5zD?=
 =?us-ascii?Q?4vPcNgObNkDjbEWkWcHu3r8LQZTERwaQvFBoLkZLPdh8iErPRKfjh9w4jvvs?=
 =?us-ascii?Q?30IKzE7PVbdhaaC1xrZy8s7NOkwC2WKAbQRBfq0/3jGj6uaQ8dpNHsWG1cwA?=
 =?us-ascii?Q?mIfJhuJnqS/x6zsYP85G4P+MsIyDU0+mq8tXl0aQsvjGQ4W5ppLy6ozFuOA3?=
 =?us-ascii?Q?JUmDmd+TZvSJ+JdRXNq+smwsKxr7q831YkdGlEMxcFVpzLcdTrKeCJ4rFjFl?=
 =?us-ascii?Q?lH0UfboTNY0dikg7CETIsX25/i4tihupkrs/zhtSkUk9U8I5XMe7kRQWMeAd?=
 =?us-ascii?Q?nFJDDkCcIhwxFsTrtjyfVzm4HFguP4D3FBqUoB3kyq+t2jGOPhm+lEWpX19v?=
 =?us-ascii?Q?sPecJyBhNWQFvG6Dw98a0HGfH4JC2Qh2NXPJ5fbGiQWGnnNYwyLAHgQTCX81?=
 =?us-ascii?Q?sYawNfbfl7STs7WB05bVQEUgCpzEetiV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m011GrJkhRqNqiHb9Wq0Cny4DMxRvnQpMZzkJphoD4kjJfIl3rqEumJyxj8G?=
 =?us-ascii?Q?Og0L+g6xp/dE9kFyur1xEY77MMUR5Rq4BQUBO2uf+fM6/HUpbHnzzWg8PmGj?=
 =?us-ascii?Q?oL8uyD9C9QOg/8CaVwcontUu9xYcXjbKgpvl/PZehR0MlnCraNeG/1ZsWd55?=
 =?us-ascii?Q?nEc93IO3bvd2Wb1wb7Z8sv1QqZL/KqYWctp71Zb+kbljZdNDRiP57I/w2M4N?=
 =?us-ascii?Q?7SplDLb2w+zTwEupqzrYFop8O/1JIJKrAA2fTRDDGAldx1/HvnO7w9H1euOV?=
 =?us-ascii?Q?3L1rWLH9oACJ7uERa/XcjNf8a48Yl4/NSPMnoRmcz17Quu+/lc577qD/xwYx?=
 =?us-ascii?Q?Lf1zIBt+HjdOdoq23lJX+6HwwjfFpaha+DPN635domp9FLbIGM6AazC8NYjn?=
 =?us-ascii?Q?hP99VfcV8dlZ9Re24ub9Mt9PWFijYi929mHm3UZQQiCmL/bxQExRX7rUX1Tj?=
 =?us-ascii?Q?kRIPNC+FkoRMZ10iGW/JIbWnCU8hxuRFVE3bFK/TOkVjmQOgXXy2D8r0FKMD?=
 =?us-ascii?Q?lpGcNp1C9HPWavJUjBL6Dx2n4cvcJDA2ZL49La4DrvmTFP6yjRgZIpd7tvR6?=
 =?us-ascii?Q?2Yzgfr5Huo3CnRQjj16TXVzcgiVECBOH47iqBOkNg1Ehv7ZkqTl93iNWUWWb?=
 =?us-ascii?Q?uK4lUCj5WeqhUlGHzx7tKSInyy4HTIwfIdMqexsMfWfbiD7bQNcDBsFc3w47?=
 =?us-ascii?Q?aHd6dit/jylmN5i2/iE3pZlcqn8iHgzJ6tU/KcVr+wTUGJbYEQaHoNR1ycm/?=
 =?us-ascii?Q?NEpRBNqtmp/xlgvqGPoiNxkTijBk5TEyqZnzyG0vivg4OnBy3P2DhGkN1od9?=
 =?us-ascii?Q?iZwBvrUXFdRyeM5+pBQ9LeTSNeDg1gsnzYSEorTTLjqcKy4BEOIfhIJPVwGs?=
 =?us-ascii?Q?S409QRzKcwn+NUjKCmDA+CmVUAZHDt1UIBwrZbvTTIfN3Q2gHVevnWKqqM3t?=
 =?us-ascii?Q?4J31oWR9tamAgTguBhh/gmltgfNn+tGsB00pBGYwG9Kd/zfdg3aoqkzKZKBO?=
 =?us-ascii?Q?S093zSYdx/BJAoKwNuTLn76HRTOx3RlpU+5hFVbS/6Aa8rsTzZN0wBwCraF3?=
 =?us-ascii?Q?TAHyJ2hRFKqKuYypvvKU3kcC17FAk/T7fMZKPiPEabFkoSN1i14JdF7xeX55?=
 =?us-ascii?Q?/kDBl6UwbVq72vZUYBzJkRovqmgRM4e+NxU5L7dWyhvnBVPPUcMbKceX0qt1?=
 =?us-ascii?Q?1S/mWHBxB2ZrqYvXm81iwwInG+GgHqvPityDlOB5RNpQYNMc7qoo5Cr0Ey8P?=
 =?us-ascii?Q?578846TosT6FMmTc5DECOlCCdQAT++p0hCzSsOsR03OGo2YwuwZPCfbwgEcX?=
 =?us-ascii?Q?wz4WzmnswmoMty3NofkgwVv/4KOFg2x3chK5TOr6gHXIlFu5gOc/z1xS52FT?=
 =?us-ascii?Q?K9Z5TfjtmpfMyNt3d6b7DAN1lnuYUHiqwpdNtl8iB8hEpCUemgdJlC3PGLs/?=
 =?us-ascii?Q?HiDgUVB98n6RKIL9PkzUy2Ur61mLFh6ks2tpfdqIqpAu2DD5MULrmunss4g9?=
 =?us-ascii?Q?QosffilN574Ru5whRujhtv7+ZclCyNECH5KPjKaUO2ksTtPiucaUtQCYZpCx?=
 =?us-ascii?Q?wPDOB+TYLzz+kc8fXQHpVq5OnFnLvqk/Pb2NknIijBZLPvo8X+DOuDfUE426?=
 =?us-ascii?Q?ME90XpMnRzYu1t2t4zpOFznKBSaKJ45uTv0kdVBBA9jGK3NtTJlHopCUl08F?=
 =?us-ascii?Q?xBC129cF6J1R/s0/duHyykGAo/TZ3Amo2JbBE7NFQTRQ75xlRALAxXkuUxcI?=
 =?us-ascii?Q?mqARHIh53g=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 026f9747-ca6e-4778-3fbd-08de49f07b80
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 11:17:14.7143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5ncxAScDvzvodTUO2GpNS0yoGZdeFciEaQSdQM7/tdmVSnczoco77462EtfewovTvb3kFuAc00dffbhh4hD7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6062

On Thu, 1 Jan 2026 16:16:03 +0800
Ke Sun <sunke@kylinos.cn> wrote:

> Make raw pointers (*const T, *mut T) automatically use HashedPtr when
> formatted with {:p}, providing safe default behavior for kernel pointers.
> 
> This allows users to format raw pointers directly:
>     pr_info!("{:p}\n", ptr);  // Automatically hashed
> 
> While still allowing explicit use of wrapper types when needed:
>     pr_info!("{:p}\n", RawPtr(ptr));
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/kernel/fmt.rs | 64 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
> index 84d634201d90a..8be185d522c01 100644
> --- a/rust/kernel/fmt.rs
> +++ b/rust/kernel/fmt.rs
> @@ -6,6 +6,11 @@
>  
>  pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
>  
> +use crate::ptr::{
> +    HashedPtr,
> +    RawPtr, //
> +};
> +
>  /// Internal adapter used to route allow implementations of formatting traits for foreign types.
>  ///
>  /// It is inserted automatically by the [`fmt!`] macro and is not meant to be used directly.
> @@ -28,7 +33,64 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>  }
>  
>  use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
> -impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
> +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
> +
> +// Special handling for Pointer: default to HashedPtr for raw pointers.
> +// This overrides the default Pointer implementation for raw pointers to use hashing,
> +// which is the safe default behavior for kernel pointers.
> +impl<T> Pointer for Adapter<*const T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(ptr) = self;
> +        Pointer::fmt(&HashedPtr(*ptr), f)
> +    }
> +}
> +
> +impl<T> Pointer for Adapter<*mut T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(ptr) = self;
> +        Pointer::fmt(&HashedPtr(*ptr), f)
> +    }
> +}
> +
> +// Handle references to raw pointers (needed when pointers are passed by reference in macros).
> +impl<T> Pointer for Adapter<&*const T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(ptr) = self;
> +        Pointer::fmt(&HashedPtr(**ptr), f)
> +    }
> +}
> +
> +impl<T> Pointer for Adapter<&*mut T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        let Self(ptr) = self;
> +        Pointer::fmt(&HashedPtr(**ptr), f)
> +    }
> +}
> +
> +// For wrapper types that implement Pointer (like HashedPtr, RawPtr),
> +// forward to their implementation. This allows explicit wrapper types to use their
> +// own formatting logic instead of being converted to HashedPtr.
> +macro_rules! impl_pointer_adapter_forward {
> +    ($($ty:ident),* $(,)?) => {
> +        $(
> +            impl<T> Pointer for Adapter<$ty<T>> {
> +                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +                    let Self(t) = self;
> +                    Pointer::fmt(t, f)
> +                }
> +            }
> +
> +            impl<T> Pointer for Adapter<&$ty<T>> {
> +                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +                    let Self(t) = self;
> +                    Pointer::fmt(*t, f)
> +                }
> +            }
> +        )*
> +    };
> +}
> +
> +impl_pointer_adapter_forward!(HashedPtr, RawPtr);

This implementation means that nobody can implement the `Pointer` trait
outside the kernel crate.

Should we do something similar to `Display` trait and have a kernel copy
so people can still have their custom `Pointer` implementation?

Best,
Gary

>  
>  /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
>  ///

