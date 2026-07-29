Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020127.outbound.protection.outlook.com [52.101.196.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBF53B38B1;
	Wed, 29 Jul 2026 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320363; cv=fail; b=GyoYAM3UVsJxeY361e8ZHcUuqu+tAQVuhGErMeRotUEw0I8TQ3hJme8VsgJq36B++CEFZ2btiifc6L6tGFTgH7vY71LiPF0OH76aDj0MrMe8GGJ1mb/OEULnvz95CMBkPflJASHaMK37eWKDFdbYNojE7ZlLsl6EkP0K3dDGTBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320363; c=relaxed/simple;
	bh=EPhafJpl7N63zrEAOhmWydGE7gSSCED/Hxtxx4mUtS4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BB1gCAbjtJwhi6IIlu++8AIpoW1YPLJWXX82RxxFB0y0pwauc/pJE5Lkb2JOsFp3WhH3I0JZ/AnD3vBoSoqwe5sY7JQzNp/SVMNRcDs1XVTCE9nukRGOZ+GKi0bvjQaJfzDz9uxmh9gmDwebDIBaZ19DGv/K7xdKeGRU9FgWyik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=XEH+XjXN; arc=fail smtp.client-ip=52.101.196.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="XEH+XjXN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUqiCa9VN0zJYTYD1lhrczYokdoEv8tcvr0bYWyKcHycaS/4wuQx3pP4JoXZK986zCInorHYpTSNkr2T+qVHKJZTxSgic0UTVwubLHJ1iIAe55j+l0IsYwosFI/KD5KXp/4CCjjVqfdbih6+xF9hZxIeutJUu6OpkiuWcjIHwJWNfeWrs7fmtg9kpvwvEP8tE7KUmjHVMf+mWHZkp/rr+bwpV/GxVdUHxvKA68XL/66nsTHqyAoaAW75PkXpGpL7ewNrMQ3Gqtccb6ASthxMENJl8t+ZplupkrSfYiZAwJN2GJPIYMNVosyl2KriPSKG7cpIGPs03PL1pXjZzja2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57rpPOn9uJ1KXXc0ncv7UwC71MT0sUpca/ZPBQPsJu0=;
 b=u/j20isdZjn30NwvPd1rSqVAWiPgDLCsTnPzQ0Nl/sjfXeTJl7XTTeAO7GlCN7HsWLq362ep6PEVpOvw1T66kBy8I5v0TfBji2oBBUWYsxpCQhkWYIuZ9GR2h0MkHYH2LYdXzVHcA8u+2m2urwYx2lLEM9DXRC4TtWs79O2telXs8Zh+tR2F2JfdZ7ddJrTvIscPOHtvvRy1WVeLV/AUvEvssn60IHzQmdIZQr3/VuzJG3BBlck1jItByuttU6MvIkF4zNDWVa1u9I91LrIy3encU1RFAIg8rG7ptT8MPXDt3wgbgBtaKktoxY8pxocKojEUxWtJo2el6epQxXkiJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57rpPOn9uJ1KXXc0ncv7UwC71MT0sUpca/ZPBQPsJu0=;
 b=XEH+XjXN9qJjmqks+gzNq6d5KiTPJWT16mpeH+/D8WFOOK3NmdsFla+Y5S4uWpIzN0FQYMH/krZorK1FdIrFD+ZbEfG2NVmfeQHrtq+qbvgIOYXpKkZXaKXMmfu8nSmb95vcKzyO+zpnIQAD8wbknrBy1P/tMBLcD48B+usMH/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2413.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:118::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 10:19:17 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 10:19:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 11:19:16 +0100
Message-Id: <DKAZ8X2BO1AE.1NB7FZQ4W90B1@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: rbtree: document peek_next() on the immutable
 cursor
From: "Gary Guo" <gary@garyguo.net>
To: "Juan Patricio Marchetto" <juanpatriciomarchetto@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260729023420.1323906-1-juanpatriciomarchetto@gmail.com>
In-Reply-To: <20260729023420.1323906-1-juanpatriciomarchetto@gmail.com>
X-ClientProxiedBy: LO4P265CA0204.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2413:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd6894b-6d52-48f4-fb27-08deed5ad867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	etfeTWAm9OBsgyau0I3erfpDDPt2eN2bw0xkfXMEXN/C8L4wv2HnWqjNFiM/Pe30jKgRl1o2CqZ26BptidB+MEHVA57Ve7nMh4w870soQvOnsA48ElyobBeao+RAEWp0DwJMLFcFyjj4lHuwR3Qo0k1Wu0A/mMuC8lhZJ9/DmM8OSMDGQDNMenMQ/D+hoz45bultWS93ots+9D+/a8SYJ4L5giZJGlybDzMXOvkkJOgbYEJQm6bMsnmG7pRZZauuToqMg7YsQbPd3AUH+QXSUj4dmniC/Ug/T2OHJelm1am/xZhkW3P7IE2G55HCqjHw8V0mxxpm891fKBubJ/KWZbqAwErJWsdPjvbWyoB62JfLlQ3i5tA0+5AqMyCaaSLvmnghlAty8Z7QOgYu4yEdT7o4DqtGq6mHqP46Dem5JPQnZ5kv79bW1I7kj/KugygtcZtSLVr8Hk8vbEHsYlbbSX62ImVnVqv7W4nbVvu2V6EqIk/ia1a2YYD3akfrmwH/lMVveidd7V6emiEhWFbFqhF0JH/x89nSs+HM1gjkGeysFNbjs88bE/LQbtAA0qX1m1Ex8QRrfOPAQon8S0r0PoHe84ajieiSAu8lesTyv//kI71BtlPTtZY8lHk+iQuGRUBM8NUGEwrsxRjABAJ1zsrksCCtIzQoqmgoHtpHpc4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVBka3daMTIwRTBvMWxsZ1EyZlBpK05GejdMWHIvUGkvUytaK3d6TTFPcEsr?=
 =?utf-8?B?TGZ1S2l2NEc2VHoyZThKSStFWlhpaDBabXpNUC94b0t0Q2NDTmY3c254TXlG?=
 =?utf-8?B?em5vSnhTRWtPVkthMTA4cjdPdlp0QWlYM0RCUWd5Z0hYMVZLdDNWRFhxSThI?=
 =?utf-8?B?cUVaVkxwbmdSbFRBM2ZyeXJGam9Ta3J0UHdyWDNpMXFIbGxDenZNc01iRGxC?=
 =?utf-8?B?cmsza0Vqb0tXT3A0a1l1ZDVrcDNzcW85YmpsdXZ3RnN4cVRGK2NtbWp3VUN4?=
 =?utf-8?B?MVVVd00zZ0Y0Ync1R1VLK3hDdy9KU0I4U09mNmFkZ0h0V0xzSlR5ckFtdlhh?=
 =?utf-8?B?emJFY3NXNVNGd2pONG9ON010eFkzTS9tQzR6UDBmaktpRGsySjJHays3NW0v?=
 =?utf-8?B?YTdzMXJYaWhsRVRqcGZ0Q1RYdWw2dk1paW81dDY3Wlp3YnpYeUFaeEJrVTNx?=
 =?utf-8?B?aFd2LzYyZG5iMXhZSVZocVEzMjRFV3prOTNPMFdSNW1vVVhKdGpmVU5EU3V4?=
 =?utf-8?B?TEJ1bGd4QmwxMjhCeFY5ZlpFMXBMNlJ0YWJXWXhIUmdOV2kyR3B0TVI3TTVC?=
 =?utf-8?B?c2J3UHU3UndCWDBLSlhnL054RzFza016bzNaN01PRXpuek5pUWtpdGJva1JN?=
 =?utf-8?B?R2RWRWt4bll0Z2tlMlFnYXRGSjRuTWFaVEk0YzR5cnFwYjhHM3Zra1l4dUt0?=
 =?utf-8?B?UXJudUprNU5XaEFUUEU2Uy9Cc0NpdXk4QjI2eVUyZi9oc0pQRHdkWjYxcVhE?=
 =?utf-8?B?MHpselNJSjJjR2lqS2Z4WURsaVkxTVNOQUVLZm5ncXdCdyt6Vmx5UG82aTVO?=
 =?utf-8?B?bGtzTlpHU2J0UGtYN2lzZ2RVZWdhenZrcFhTUktlNGJTTGwzaGREMEtYWWRH?=
 =?utf-8?B?V2VpejhHdEtxSkJ6dmxRVzZlUWpOeld1eUdQaVQzS2VHUG9kaXhpWVUwbHZi?=
 =?utf-8?B?SmFmOVZaQ3dPblQzb1JLUCt4amoyTmZHWnJBY3BMcmlTTW52bFB2U0sxZERS?=
 =?utf-8?B?Tlo0ZGlRUG1yZ3dnMFkrODR3WWw1WURrMzZsR1BqRE9PRmR4K2lhbkY2ZTdG?=
 =?utf-8?B?Nlc4RDBRd2NkNXhaNkxjMWsxWmVDaG9vSmZWajg3bUZoN0gwYS9manRUeEph?=
 =?utf-8?B?TiswRDZ2ZjcwNzR0bGhuZ2VMS1RUUnQrWHVMS0IxR0s4MjNDOTlHR0k4bGlY?=
 =?utf-8?B?RFlVbEFlVFBETWxEbHZxcG1UaUNnSEZEbFB5RkU2ekYvQTJYSmU4bFk2dWNl?=
 =?utf-8?B?T3Y2R1Qzd2JWY1FObzlnNXN3alRnWDI0QVZWM2FsWXJCTDIrZUlFYkplM3lP?=
 =?utf-8?B?dzFVZ3JOVXp4clR0SVZFZ2Zzcy9OTFpLVk1Yc1ZyNnZKQ1pSS29PSGhBc004?=
 =?utf-8?B?SHoxa25UclYrMWFVaEEyK290ajFUeWlMQUdJVEF2RUJmM2xpS1hJb3VaZ3c1?=
 =?utf-8?B?dUVGeWl3TTJXVGN4Qk5aMnRJN2lUTi93N0o1SHpienhLYTlCRmZPUEdtRjUz?=
 =?utf-8?B?LzJkT0NRYlJXWGQxdVhzc2xTdlRza3FCUkRQbk1nd3crVVY2K0t5c3g0eTZI?=
 =?utf-8?B?ZWFGaENtSWE1dVhNTFNoanIxOHNXcmtYWFN0c0dvYUM0R0FRYTZjY2VpNVZP?=
 =?utf-8?B?Y08wUHMrMzBGODhZdWorYmw4VGpVQ2FmYWVyaU9CNC80SmxSaEdsRDMwVzVt?=
 =?utf-8?B?OVZrVlhxWlFUODNGYmd2SGpERCszOSt2aEx2ejIzYWE3SDBoTHBmcVcvZERa?=
 =?utf-8?B?RzJNaGRJMmI3SkhudGJMYnE0dUlGNXB5MSt6YUpuSi8vbG12am5DdHJMOVV3?=
 =?utf-8?B?d3J3STZQdDBGWlNTNXJSdnA5RVdJZjFObFpqaDRYOFZIZFozMDZmOVc5ejM1?=
 =?utf-8?B?TGxuZkhoUSszeU9BamlSMkRZSno3YzhnUmpZS0VCeHhmdFhpWWFDSjE2T1ZK?=
 =?utf-8?B?QkVvZ0RtRXZPUEpRc1NPb2NXVVp4Y1p2QWhTQmxhZG1DZDNFQnZOU3hXc3lx?=
 =?utf-8?B?ck9GT0V6Y2JRcmhTRUlhUlI4QUpoWG1wQmRIdFArT01sY3FsTUhxZktnVHht?=
 =?utf-8?B?WlVpd2EyaERHa1oyWHZxZUxlVzdPcXVkNVpzVVVyakU0VldmUkF6bDVaTWxh?=
 =?utf-8?B?ZitvUk5KYkdrZ0tGSDBIdXlvK0NDckcwNncxbElWMzMxLy9qZVJBUUxMcGpI?=
 =?utf-8?B?UkZDUWljT3REZXI0dXJJMmJLazlsSmprcjROMFVQbkoxc0h4VUxmTHE5b0po?=
 =?utf-8?B?bGVGV1kzZjdicjhUdnpKWDEzMmxPbTlPancxdm5SaWIvd0VZWnJrUlU5OXd4?=
 =?utf-8?B?ci9aVnRHcURMVFdTMlFkaWdmbU5wQTdFb3pvVWxNOWRXUnlDRW8rZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd6894b-6d52-48f4-fb27-08deed5ad867
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 10:19:16.7651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqDK7FaP7JtnfsWsNizV31NQIo2DzpVEntkAp5jqtfVtyWGqEp6pt2uWdJJYB5Snn4Se8f1bGcXXxYNKpkTftQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2413

On Wed Jul 29, 2026 at 3:34 AM BST, Juan Patricio Marchetto wrote:
> The immutable Cursor has a single example, covering cursor_front() and
> current(). Its peek_next() has none: the only worked example of peeking
> belongs to CursorMut.
>
> That leaves the most common reason to hold an immutable cursor
> undocumented. cursor_lower_bound() stops on an exact match, so a caller
> looking for the first key strictly greater than the one it supplied has
> to peek past it. When the key was absent the cursor already holds the
> answer, and peeking there returns its successor instead, skipping an
> element.
>
> Document both branches, and the case where the looked-up key is the
> largest in the tree and has no successor.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Juan Patricio Marchetto <juanpatriciomarchetto@gmail.com>
> ---
>
> Notes:
>     v2: v1 documented only the exact-match branch, so the idiom as writte=
n
>     skipped an element whenever the looked-up key was absent. The example=
 now
>     covers both branches and uses a four-element tree so the skipped elem=
ent
>     is visible. Reported by the Sashiko review of v1.
>    =20
>     Verified with rust_doctests_kernel under ARCH=3Dum: 321/321.
>    =20
>     v1:
>     https://lore.kernel.org/r/20260729014344.1244809-1-juanpatriciomarche=
tto@gmail.com
>
>  rust/kernel/rbtree.rs | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
> index 6fbd579d4a4..ea8df886df8 100644
> --- a/rust/kernel/rbtree.rs
> +++ b/rust/kernel/rbtree.rs
> @@ -811,6 +811,42 @@ pub struct CursorMut<'a, K, V> {
>  ///
>  /// # Ok::<(), Error>(())
>  /// ```
> +///
> +/// [`Cursor::peek_next`] completes a lookup for the first key strictly =
greater than a
> +/// given one. [`RBTree::cursor_lower_bound`] stops on an exact match, s=
o the peek is
> +/// needed only when the key was present: when it was absent the cursor =
already holds
> +/// the answer, and peeking there skips an element instead.

I am failing to see why this should be a type documentation.

Best,
Gary

> +///
> +/// ```
> +/// use kernel::{alloc::flags, rbtree::RBTree};
> +///
> +/// // Create a new tree.
> +/// let mut tree =3D RBTree::new();
> +///
> +/// // Insert four elements.
> +/// tree.try_create_and_insert(10, 100, flags::GFP_KERNEL)?;
> +/// tree.try_create_and_insert(20, 200, flags::GFP_KERNEL)?;
> +/// tree.try_create_and_insert(30, 300, flags::GFP_KERNEL)?;
> +/// tree.try_create_and_insert(40, 400, flags::GFP_KERNEL)?;
> +///
> +/// // 20 is present, so the cursor stops on the key the caller already =
has and the
> +/// // successor is one peek away.
> +/// let cursor =3D tree.cursor_lower_bound(&20).unwrap();
> +/// assert_eq!(cursor.current(), (&20, &200));
> +/// assert_eq!(cursor.peek_next().unwrap(), (&30, &300));
> +///
> +/// // 25 is absent, so the cursor already sits on the answer. Peeking f=
rom here
> +/// // returns 40 and skips 30.
> +/// let cursor =3D tree.cursor_lower_bound(&25).unwrap();
> +/// assert_eq!(cursor.current(), (&30, &300));
> +/// assert_eq!(cursor.peek_next().unwrap(), (&40, &400));
> +///
> +/// // The largest key has no successor.
> +/// let cursor =3D tree.cursor_lower_bound(&40).unwrap();
> +/// assert!(cursor.peek_next().is_none());
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
>  pub struct Cursor<'a, K, V> {
>      _tree: PhantomData<&'a RBTree<K, V>>,
>      current: NonNull<bindings::rb_node>,


