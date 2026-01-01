Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020109.outbound.protection.outlook.com [52.101.195.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160CF134CF
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 04:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767242101; cv=fail; b=tp73BlGUjgirZdzqDLJruBDBfjZ9NfvmliIJY0PPPx3/NkMSTQ1uo6AVAAg5LoY/RW8xsbgdq8zE9LsccFEZTTnzLADHTPqAJK0Mbg4jS1ZtHS5z9V7QRGrxSoMsxmbD0XtJwHqVgxfWV5CDWKgWvgAZsxS92oyiqYmV67C7Ptg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767242101; c=relaxed/simple;
	bh=6N27BfS6/mmbSYZvwm39X/lLdHjENwRselzE+iDhpZU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=czgcavjTKMXRtgWQkvFQ2NY901Skq9e3aPMzQ+qseXVxJXJu0QL4y8Id60TQ4fr3Dr9s+odqfG/P5befSRKe94NT2TK1li0YsKeyIloQlSue15AJ5gan2bHsqA9hiMtednTjdpSPPqn/M1terP3c+S4bQSbT83HdCRgK4o0jL0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=SMZ9b2M9; arc=fail smtp.client-ip=52.101.195.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="SMZ9b2M9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2+qXOhx3O3uTSGW9b1vwKXdcvDDa1w7Nd8+6Zuf2L+3TmeVLbyWVswFjPT90564h7F853xeTSarpGqbMvfazBbM76gJV/ioLLj1QlcHm4FFdmZktvPFwNGVJoyiAVSIav/OxkPtx0Xho5C6CikSZ8+LV4NS+2nDTbEDY78AWjWJ7RsGhPhrv98VLpszoscJeIYGJFxJ/WOgxbpNDSkYcl93aXxPIwcQRJzgT2yfwpbIyYdiM+D1S6ibMecXvuvoVmOw8RhiLq+sepJa9kFEdMPeR/3U9xhn3fOL2Wwup08vRBWjDoH/QyIiB5aLWtC8WeBlWY+kgL9coZPONd2/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpmLW9LXGqRIb36JEIGe4YNu3y7JA72DGAlq5wG0vJk=;
 b=Q01BGQ80UR9lZTJpl0HEA+VHo+aFW7Ui7QAUmQUbxW74SwTBcfpg1pGrqxhyu+cpTZjvSc8iSZuLTWvGh8eASIRj4Kq4zaRF+144YxkJSMhrNgSUmk/YVbXNlfaLwLpesAyAulgfTtvFG/yeB46v4SxVPNyhqbsE8ofNHXKsf1PV+6q24ssrBS7Tess1aMqSzEnRegwiiFAc54+axz3uldHRAzpCN09cBOyg5N0SWek7tr3tN0x1GaYqIzdieK7pZTMBd51DosGpomxAyOeiyudGfIGOI35D0ahv47vt3Xvd3ozSn6XOHlDTzHB9rFcVndsHh2J4POoSzvoo8cE1OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpmLW9LXGqRIb36JEIGe4YNu3y7JA72DGAlq5wG0vJk=;
 b=SMZ9b2M9A701u/IdRRkb+eyqPA+BSfI0+1GHyNW/oJh5/v23f1j+YzWywZLU4ZKpRATqxwD3M4GfwLBXyigTIKl4+dorRNZO7wE+srsYpjG8g2OtMkBWbQhxxUCOIUH/uzWsNGdHTUHCQOn8y1p9js/KDDHvB6iiA+nE9gHvAjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2295.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:76::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 04:34:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 04:34:56 +0000
Date: Thu, 1 Jan 2026 04:34:54 +0000
From: Gary Guo <gary@garyguo.net>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, aliceryhl@google.com, arve@android.com,
 brauner@kernel.org, cmllamas@google.com, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com, a.hindborg@kernel.org,
 bjorn3_gh@protonmail.com, dakr@kernel.org, lossin@kernel.org,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1 1/3] rust: revocable: Switch to kernel::sync atomic
 primitives
Message-ID: <20260101043454.69dee1c8.gary@garyguo.net>
In-Reply-To: <20251231.183502.304307662571984456.fujita.tomonori@gmail.com>
References: <20251230093718.1852322-1-fujita.tomonori@gmail.com>
	<20251230093718.1852322-2-fujita.tomonori@gmail.com>
	<aVRgTQWhqjKB6xpK@tardis-2.local>
	<20251231.183502.304307662571984456.fujita.tomonori@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0274.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2295:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ec31ab-6de3-4852-99bb-08de48ef1d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A+KjAHgq4eOZmaM6ow45ILAfKGp31iDfimKiiT3kg9Mkc9W3wgThUsxn1pZo?=
 =?us-ascii?Q?EnH5VIUqDnbM/3L4AjeJIOhVagwEg54NQXQooKGZzthQTW2yhNAnej3anzz+?=
 =?us-ascii?Q?w8+Dt3fh4XGpG0mJBwgzzxyVaLZtz0SOyq85/d/g32qbUtUz7swbZVQgeygZ?=
 =?us-ascii?Q?swTykhj0aGL04aL59OAqUMm0P6pxv1otvrLnQrcfQtNUFuvxb76bxeDGlkwu?=
 =?us-ascii?Q?hnR8uhn2iK55WMBD99LOXaWXSDebM+E/vBdTm7XuioIox9gE841YTV0GudDp?=
 =?us-ascii?Q?UVZIMffbvapAIBjbR1YWeLaR/i4hR0PesaLeK9/snLeKZ3W2wLWDdGMlNdpm?=
 =?us-ascii?Q?8ZJvoupjHMGI9sTrK6whbXjtpl+fRYEdWe+jgvatHKC0CxAB8KkFkDAGiRMo?=
 =?us-ascii?Q?mEmzkG8811H8FSxISjRRbhIkwLteOmHmORncpNKDjvdT899QyBF9mjMtS5Nv?=
 =?us-ascii?Q?r7RuDCw0Tihdupo7bFV3cxxN75myaXX27ES53MtqWMRxgYosSo85xAHpKcZq?=
 =?us-ascii?Q?1FSgKVY6rgFOyUnm54cBFuVPuriLhUuXl7WqXmQhe/ERyxeqpDt2SDqYzkdR?=
 =?us-ascii?Q?pCvgtp23mOQLzeQMpBoRRkPxo7yFxhG9pkJ9ZvmygIJfjW2AwRMq62+oYRge?=
 =?us-ascii?Q?80Rdj67voLNGyQNF7OkjlXK71q+brRr8e/4YLcV7PWG178NSiYUx0FFFztSZ?=
 =?us-ascii?Q?D0XAt7jVHxMq82pDofF2YjpcivlYU1JXCYu9cfbqmUht17NtWqIdqcGj9/aE?=
 =?us-ascii?Q?kpTzFoSdPRRYvAKa3+YovBD3K2gvOql/htocGUBD5OEHzDAjEKrlj6Trg9mQ?=
 =?us-ascii?Q?bRqSvyq2ZmUHSwTSiqQrMMvSa2VVkqWQnwdKYr2x0K3EnwxN39qmOp8D8PHM?=
 =?us-ascii?Q?MlDtvZ/608uPA7/JrUz1Sx2N1h+pQF+4IYIB/xTI2faWjOU6Nq9unNdA8Doi?=
 =?us-ascii?Q?lutLHqc5eGejfriRBPUkCEvPW3/YET10f4C+RIx/zlWQpu538JVY7ZMBgVk1?=
 =?us-ascii?Q?O13wAM+allFvw/psLIn76NJWwdImgol6s6MV1SNPX2TmUzbLjLx04KTh5Cfn?=
 =?us-ascii?Q?k/UhTqiHKZ0XotOQ+GPAmvB3SctLaNoUARR+VqExm/ask6UkDbz33JI4brrU?=
 =?us-ascii?Q?/8ZbyqVW+LOJO7As9pNdOWeyoeSg8zSdxVeYN9yxoWQjOMSNgkJT7uETe0iR?=
 =?us-ascii?Q?DKQ/UkN9ksHZJhD8Su1yRYMiB/doOJILKQZV25IH78b6xzzybjnoh43tk53p?=
 =?us-ascii?Q?0zjBgBfTQbLDy/L967nsKOv+TWHkD8kDXZ6n2RhlKUprx1ZCEzFEuaUrW6oJ?=
 =?us-ascii?Q?NtJSzIw/6+gvzwBJsCUhyoX8HypIA6FC/lvzhJYMFP1TnImwasTlQz7Kf/Sv?=
 =?us-ascii?Q?OYzxuQoWjQfW2PtpbLnV0RVkx0//BhU7XN89ytnd7Ib+xO7VmiOAGfeCHW4M?=
 =?us-ascii?Q?Fyy3R+PmfyQu1JiZn2zKGyo73hONQQyr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kGkH2ZE68/eG+mthoV6PBgeJMCb/rMcdMuCXkvwA1ynO8zaMYK7A5mfEKalV?=
 =?us-ascii?Q?xnomltXck0TpwCuW/u5hOKA8XOe2Pzh9jCb1u4ER6+D41CMA+LAwFH02PfYm?=
 =?us-ascii?Q?M/d5YfYxAizQjVqsewIpwZ1rCVjv9yerjdXQ3JoHz6Mw+oPc8Euq1bmSyXU4?=
 =?us-ascii?Q?pbruto+IbPF5IAlexTeWDxgmayt5+x1sKrmx/2ae3PvenxLSPRsH4qrNyEOb?=
 =?us-ascii?Q?+MryFiq4MbwMq4NwoIMkhhsLeEXtwkbZ4LX4yJYZHYu1m8cVKZmIIiOjBb/N?=
 =?us-ascii?Q?ypBqjt68fL2fQD9jnu23BT2M0EKpnd8PuoOiAgeQ3uGQfnECiReCo4nSIwSJ?=
 =?us-ascii?Q?e4c2MO5WsTLqA8lOHyKTVs1+Np0KKabuhzQrxbfdNOcLZeNLoy+HfdAyYAbr?=
 =?us-ascii?Q?M88gSP+/RZR0FWvJn5A5qh7hTSYdgpxgS5zghVO8tbyTKea+cN7COFUq+nsr?=
 =?us-ascii?Q?fN5JyejA+eo/4JQz2GnAHSzBm2AJFXpvzZsB9AINPhq7Kuy1tJTo4mIsqSnu?=
 =?us-ascii?Q?ypo1yzqVED1tS+4oY3qq6h8M682kW0tvkvoo+AnZWsANogzV7HFS3zhY8Zad?=
 =?us-ascii?Q?Q8gbiXhrxWECOAr0UgQ4wja1W8jiXwH9xysTAcySOBJH8h/pBZadzCrV8PAs?=
 =?us-ascii?Q?cSnHPAx5l56hH5FQjD/XRFidzF14KPQb9r0ZFKBZBzEcobFQdH1eW25XjjjJ?=
 =?us-ascii?Q?v6a8FEvVfgGIiV3LkPPJfax0BP3J7Pe7Ytml+7IsE9v0Q+Ct2cqJMzXbsKl9?=
 =?us-ascii?Q?QXm8tr4xz/+2wFX6IWu9TIR6Ncb5O8kJ5J3V5jn4jha9D+cQqncTjIwoFcE3?=
 =?us-ascii?Q?VeOveErTrgiVWmzlUL6dEMlanJ2tzbszi86MxQ0DybA+Mc/HenOcQ2ogj7Aj?=
 =?us-ascii?Q?61/OeXQ6+TxNuyMxPtQ7YyE1NM6xO61K8/KrDlpxZCu2/5vjy7h27oabqP9d?=
 =?us-ascii?Q?bj95BqXxZAf5lkpM8/wuVo7KBqBZicN/nwTFPcAIK0MOqVFulOVCISaXUAVU?=
 =?us-ascii?Q?G+cwxu2yG8mg1hEz/ZzjtYBetaHQV160eJFmXLmbBBrpvZOeOOE64viU7fai?=
 =?us-ascii?Q?G75O3c2YED5GV9JqvcAbkaGcY5i7UtDlZQ5YuyvCevgLFxZPGpYKgaR/eBYg?=
 =?us-ascii?Q?5QLSwO+RT5okeOIV0hEc8Yy+6N5xInIEC32PzsvmzpUA23WjSkret3AUTPZB?=
 =?us-ascii?Q?vAr7wdGUs4WvG2QU6oJ8VSoEl4IklQxUnRPZvx/2/+sn+rxQASAh7kti5riG?=
 =?us-ascii?Q?3zrPsXRlMOMvsr4ASUB2l2/CA5xmWcrfctGHyscAuPi3Jy4k1TwGq4gG1KN0?=
 =?us-ascii?Q?9Gx7XnFeIgrIxHhaNV5DGDgWXlIjzsUwPo5bEGWT47h2Fm4vif2zfKwLK5el?=
 =?us-ascii?Q?ovfz4oPy4YAkd0C19ehQha7HwrmbvmKwpdiBp0+YQfevtaSowdGdGpBDI6mT?=
 =?us-ascii?Q?YKZcSZhCJastHWOaTZYYgj2JR/XgxOSxnXi8fhrjdNaMtnK+C5OrDySRlQq4?=
 =?us-ascii?Q?pgB2mWRoCQ15B7wEyDlVxzXvSm8KYXuiHyBzhPYFMlnlmpXUtZkl6GbNicX5?=
 =?us-ascii?Q?3IV7hRDVjVNC8O/BLYpIB6H2qEk2ex8AtSN4gQkDKH1dWoV7nf0Jn0LKRLD0?=
 =?us-ascii?Q?L8mFyaaze/H86SQxbXWWgLnL5hwMwxPWbn2+R1oRN2G16TjfG0Y3E5WeDOUZ?=
 =?us-ascii?Q?/Bf4GkB94ozDFqxGmKzSYy2o2gO16LIPx88GOgQBK2ou+HV+O9mXMrTgKB0p?=
 =?us-ascii?Q?r17KASxgow=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ec31ab-6de3-4852-99bb-08de48ef1d70
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 04:34:56.2356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tetkxJAFAWloZC6En1Xjo+kBF7bX80zmtGgxaBoGQkXgqvug1qUb3EA5Jv1mxcPg7ldRTrcVHlhKJNatzjE5yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2295

On Wed, 31 Dec 2025 18:35:02 +0900 (JST)
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> On Wed, 31 Dec 2025 07:29:17 +0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> >>  /// An object that can become inaccessible at runtime.
> >> @@ -65,7 +73,7 @@
> >>  /// ```
> >>  #[pin_data(PinnedDrop)]
> >>  pub struct Revocable<T> {
> >> -    is_available: AtomicBool,
> >> +    is_available: Atomic<bool>,
> >>      #[pin]
> >>      data: Opaque<T>,  
> > 
> > I actually think we should use Atomic<i32> instead of Atomic<bool> here,
> > because in most of the cases `T` is a aligned to at least 4-bytes (e.g.
> > Devres uses a Revocable<IoMem>) And in that case, using Atomic<bool>
> > doesn't save extra memory but makes the xchg() operation slower on
> > architectures that don't support byte-wise RmW instructions (e.g.
> > riscv).  
> 
> I agree. Recent RISC-V support byte-wise swap instructions so this may
> not appliy to them. Among the architectures currently supporting Rust,
> perhaps only loongarch could have this issue.

The narrower atomic instructions are extensions and not part of the base
ISA. RISC-V arch use alternative mechanisms for this, but using the
mechanism has an overhead, let alone the hardwares that do not have the
extensions.

Best,
Gary
