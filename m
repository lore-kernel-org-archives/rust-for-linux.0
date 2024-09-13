Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021124.outbound.protection.outlook.com [52.101.100.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237071E505
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726234189; cv=fail; b=jP1KDTy6UfJq15cVsy0eTR4WF2f/wvF+pI1UcfV80uQ9OS3hdAKdEeSjE3L+ax24zqgqQg+Z0dELsA6XwRw2y3Y+KejSx90nnPUnQmNOC4S4mqfKH3yBOgfp4daLTaUpy4Not+JtwnvgR0C7LtvTBmo8MJvtNTKxRyCOLz7imxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726234189; c=relaxed/simple;
	bh=f71Y1F6W33FivLQ2loGTX7B241jR78mPERSWrDNuwBk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HKv6Irws6KeK/avApgqmTlYbE28lALwTX2DHBn0Isvat+uWE/rpwYjVwgKCD3dlf8N//rfxQOnNxOv2YBmyIK8MY8+TBhUzquVTul1Tj0oc4rjmOnyZ/dJJaGVPc+8Hy5jGTdWsSgaCPp/nCBZv5DGttVEJ+E6VLIfWc1Mhxtwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=k+J3MYbD; arc=fail smtp.client-ip=52.101.100.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="k+J3MYbD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCVFGNpizsMHNEB8PPId2fs+7UvNYUf3zarNyC5Z+zkm4rH271OXHv10lKbuBN3IR570+H7De205SKPnaXNsCo3Rg4vOi6V9tZni9DoQIvj7FnXbv0zsZ/HF7vIIak8HYWTrouJsbYorhu2WIaqw1XM4BBbd+fa+qvFWDmC+6x5v7P9+VHojErrJgjLd1Yfr8gB/JBY/1MpRHfbpD0Pg+soCtzOzU8VoScNYHSGSE+Bpd8auVbxi8fSCQk/uQCfJUtn2XH1YRrF2E6pgLb78xLDzg0/7W+w5iQfw3x2Ez7FD7hPePqKF0ZLdCnf/gn0rcwk0ViBmDFINmNfAoB+dmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRipmZFCFWCEDYTFUWfTnWol4gTUNyIs2rnBqWoFIcs=;
 b=RpXNPR/Jnn7IDObo8MRUGvyFRcMnoD0qaai8qT7r4T7Nf41k8SpbKHucOTrsspgYygr2dHAJpCwx3UbWwn+oBVvq8pD5tlxjU5R+WTvUhiboat4mlBApZnFsYFX9BHZRwD5k6319p5XAN+5FJYA+6/meMli1XAYeZkhWxDlEJICK6Dfcxvs/vZb9bZ/bE0dPU9xsyKBPp1f+/ubgD4NscTDOkTM+LNCSWtuXiHxe5dxw31dEP3LRcPvfEF8bFoTqcQOmLWH4LEMq0elGlRzSzwu88dmx6WxAAhEoLM9JX8knpOeZBpKE5LQ71QhZoJ+mwqC7Oxup4sw4RXTq7s5wiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRipmZFCFWCEDYTFUWfTnWol4gTUNyIs2rnBqWoFIcs=;
 b=k+J3MYbDw93u/rIv0CqdABlyPQqfrBeviXqlF1f1A6ZIwaYhybw6PZkTJGOJV5AQilONYcl8NMaFY6aFQJWt82QkNjFUUk2OROmbs3/JnHs5O12pkdly91O1xAZ8X30GNwkQ8LePLLh900LZzPPGqDJSziQUel1W5FSDisGGazY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB2098.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:60::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.20; Fri, 13 Sep
 2024 13:29:44 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 13:29:44 +0000
Date: Fri, 13 Sep 2024 14:29:41 +0100
From: Gary Guo <gary@garyguo.net>
To: Filipe Xavier <felipe_life@live.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, boqun.feng@gmail.com,
 alex.gaynor@gmail.com, benno.lossin@proton.me,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: error: make conversion functions public
Message-ID: <20240913142941.65fd5abd@eugeo>
In-Reply-To: <DM4PR14MB7276E6948E67B3B23D8EA847E9652@DM4PR14MB7276.namprd14.prod.outlook.com>
References: <DM4PR14MB7276E6948E67B3B23D8EA847E9652@DM4PR14MB7276.namprd14.prod.outlook.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::6) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB2098:EE_
X-MS-Office365-Filtering-Correlation-Id: 17feecdc-36d4-4c07-4eec-08dcd3f82102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ygvUK7bUZRqdsYuLn2LzAn4pR8YJghMRPF6PhLG3SCdONAfgJybHCPXoj+1a?=
 =?us-ascii?Q?C/T3MiRY0kWIBbvaa/fM8GG7DJ6D30J5WvA0zJKFpzr8afNGreWkRXJOEE5h?=
 =?us-ascii?Q?ZK/a8T0v+dO1YYnHLxPtQ/nvRGCHakw26n3iU5ISrY1A8Rp4xc0w9x9tZtBA?=
 =?us-ascii?Q?s8WHYsQNwr39UiFZpee/G7ETPcz5QQ65cspsEeFTDM7OmT37D88a4miREsRl?=
 =?us-ascii?Q?ndIwvg6H4slsmL2Iu/y+icjLFQfJUpAA58G0F9AbhHLCkQJg9b3XHTXyKhGi?=
 =?us-ascii?Q?yQC3zHCG07H86/SwPFfJ90oCAyICmb0yqYAhBtpCh+YETe2AhFQ6gkc8Pspa?=
 =?us-ascii?Q?mJY1Jigw1f3s64FSazjJTiFFxOqpGH5Y+K1v56NU1i8xdVignBWrl4bMFZHt?=
 =?us-ascii?Q?pVCD7hjZi/94527mEyJm+dDK8eCO9VVDO3llWUbxXcQIwKxaPxEGE2YfYXJe?=
 =?us-ascii?Q?/t6RS2OPtpvyObHlgYEZf1a7goIKqOgO+kUDBTKdXIXgw7vOCTY2N7bQFlb9?=
 =?us-ascii?Q?i7fix2XrHb/XGNFpH/fmZcDKAs2c9Cea6NcvN+r+K0FbONQsWQ4/xt+/hlPk?=
 =?us-ascii?Q?kDstwcPMVrD6vTZj/fH1uuIiUmbuE/pvUPb9or7XVu3pCfHHJmzI8exCKsmH?=
 =?us-ascii?Q?Z6RBjwv/VI8bIqU3yKhLDbMSPrmHnsC8VqsVtVzvzR/hxwoiEcp9p+pJZIKE?=
 =?us-ascii?Q?jhxJfRiqgKV71a1x5hiF6VgvzroRwoxzQHWmby5bIXzoiSVyngtQwSdKkdil?=
 =?us-ascii?Q?5AkkDzj1KYUD0hReeP+J8MbhgEsYPdnCgvyqrO3VNPC8zGZdfE6c/JQtM/py?=
 =?us-ascii?Q?BtxkuFtHesw8dWJIwg+S0N8aMck5QVMmumhZvNe8jZsVuYU0pUvoSoTdLoWR?=
 =?us-ascii?Q?4QyjziDepDRxNLqkqtckspJrMm+K1U+9t/2l1dSZrJRtwC6UUEIWPG5T/mod?=
 =?us-ascii?Q?ITRCbwKKoYeei6CJq0BRDQ6vg6GiohqFbaRGHVcs5/KD7V68tgfNfFgv0QTX?=
 =?us-ascii?Q?ZZTRR1IvmleAw1YsgayaqK7jXPnbFikEXtTZr1xN6614pzq4/mgSuljjV9qj?=
 =?us-ascii?Q?8tLCWm4RIon5VxeWLPbQMS8M90kPLF5qp/FHzRV9SIo2kVMupMjnXJbr2vQk?=
 =?us-ascii?Q?3KtaNttf3RR8m0AU+lufBoDwUM8gkI6BeDcX0xzps4KMCY2KGUawI0MWdiZb?=
 =?us-ascii?Q?EoBhTL0url+tjARNThPFiAyjQWDGcop0LqiwW17BTURQKpvSGeicnyML+OCK?=
 =?us-ascii?Q?iYl3Ssx4g/ou1nPDBJIQnJiXLiZURaBP9yuZSlJZ/M9uzz/j+Oaz40G03xIE?=
 =?us-ascii?Q?7sCFIFvKUWvietYD3iTBbwAji9WGkeLYCUaMZ6UGcPoYpw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R48j5ZrVjsnNIBAS6VmSGrM9aN2rZeyH9Xg+gmKaUVudxPwmgEInespyCPET?=
 =?us-ascii?Q?HYmXZFZAJVV4SUsPJ0kgE0MVqotPWbrnoSoASJMmWc0ECc+a/TuvlHIlDw8x?=
 =?us-ascii?Q?ZRX8RkVAwzMh6wU7ZRpxMaDLk6d0661cqlZ0lrI2KwX4+a0V7/xKqtSmiMsU?=
 =?us-ascii?Q?/08l2swn6XxBVf0zeEzLaPWo4vAiF92xjndPTIBTQLdG0FJVi6bpVUg3RMGV?=
 =?us-ascii?Q?9v79mTmAJ9V/uFNSlkz6nLMOpGRZeiJBTCrzPCmz6k6xnyLmMa/iywccib6P?=
 =?us-ascii?Q?uJDPE710NvKhuj2F7zBlDWuSMmFd6xr8S1csZf4bamAsRzK3eYWaTmGYB7T1?=
 =?us-ascii?Q?k8Vwh/5pnodx6J6ZwlCR4uup7W1KM3bgWBF6DLqziFnwr6Feq0Iz6reUxe7z?=
 =?us-ascii?Q?jkC5OoHafECPfQPGXSdPzuebe4WH88iGjO11Hb1tHajYh3ibu5JVUmaGG5Lk?=
 =?us-ascii?Q?liUl1tFcp/SGddEtfdk+xh0fToaicR/kSridyn7+BM1e42BpqKK7ROa4CU0r?=
 =?us-ascii?Q?lvPaazxB3Tf0Sixb6F0HUElFXB3Dh85Al/tSPIZbFKaYE5luHpTVjcThHM8r?=
 =?us-ascii?Q?xIj36mM6hq8uFsUU5o00KIlTg/LUM3G8jJ+4LMjiJQqfJxyfs1MO53OQ2hkD?=
 =?us-ascii?Q?uVKElzblEygY1vxz8yfrhRPT7zV9IwAUjzwnpE8nfXKl0yCevZZ8jrhoGqcK?=
 =?us-ascii?Q?u1dc6lTdOXYpBOW7tHyM3lPAhM1p+Hm0/85fL0h3KRLZCtRjRf6UMAQ1fgIB?=
 =?us-ascii?Q?K8suHVUNVPrTEY1l77l7ax6FucZ+siKQqmsxkWEJFRcfh4qYEqOv9h9eg1ak?=
 =?us-ascii?Q?VFBi5blQMRcFK28xpsmSpKnbXxJgQbfNBZWPCzFKDwyq/foWh+gxSwwUgLyT?=
 =?us-ascii?Q?kHbE7aHcJxYzUcaawjjFC9CEcAV4L16QwB52Rshwg7A+kci4xSdp24OGKDsE?=
 =?us-ascii?Q?vltPya0ze9sL8fhp0ZOP7LBdurpUBSyFy5zmUhkiugoBwxZh0SrjNlqoGll9?=
 =?us-ascii?Q?osDAVTQmV/U8sGgp15zgK8uCGlqe/+vlmIvFqorppbbj19IAQcqJ+3/qfI4s?=
 =?us-ascii?Q?7ehMVOQ9PKKfaIVbBXWgL7PhU8yNHkT+Y99BeDfedLVKKcG4OxIobHLVHcEB?=
 =?us-ascii?Q?PNBKlV2rh8Q9KNWKlxADSVpjQGd1SqxE+DQPBorQ8qwSM6rhqq0KajaoOpiI?=
 =?us-ascii?Q?8CRRSAJHHVNgUeP25RKpElclaIX94c7uKJZeDHP3Og2r4GiG1V+YDyZ+W8Qy?=
 =?us-ascii?Q?CSehVGmaAKeAiF7vIAjqTmavCaCdXadK3eqF72AVkJnbvbJgy+Qi0acMIN4M?=
 =?us-ascii?Q?u0fJYnvJ4MKF9e3NxXekjofZzxysgax63sRHqdvWGT6D1Ie4GXyOZ/sibyMJ?=
 =?us-ascii?Q?4uMZRPUlseuyBTfQavD04CGX+0LCzzF1LeWlOcJE7Cd4WLgFJlf/z+6cek9/?=
 =?us-ascii?Q?ELeFkIdn2TwSH90fH/RHuYleYeJj48GlXV4qbXxqtrk111y1GZ+jBta/j8QK?=
 =?us-ascii?Q?cZ7k58RoSf2+ByaMpi65W1t0isl1dwJmevxfnwKUzwcStCDocuCYmQ3q1ASU?=
 =?us-ascii?Q?nqASA35Ej5RbGWOwOsuUSyIplDwiEUuQsFkj5a57?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 17feecdc-36d4-4c07-4eec-08dcd3f82102
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 13:29:44.1089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmmOzmMpc0gV2rrQv/WYj9qKRoGffqJjXqUxpbnQlF4cQGNo/vSY9NGaIk4HaIIjAYO2n+PjSRDNADN3HvYzEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2098

On Fri, 13 Sep 2024 07:19:56 -0300
Filipe Xavier <felipe_life@live.com> wrote:

> Change visibility to public of functions in error.rs:
> from_err_ptr, from_errno, from_result and to_ptr. 
> Additionally, remove dead_code annotations.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1105
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Filipe Xavier <felipe_life@live.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> 
> ---
>  rust/kernel/error.rs | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
