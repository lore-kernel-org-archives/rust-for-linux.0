Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021083.outbound.protection.outlook.com [52.101.95.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723B649BD9C;
	Fri, 25 Sep 2026 11:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790336614; cv=fail; b=l/3RARBR3u0uEag2Qab2V4uxrJP2pbgteAvNFNBVrKMBt0eI0ZHbWODElM6qVVeNHKLPdEUrSR5HS8oe5SDG9ccT9KHI60gjj56dDD1dTfz44Nza9PCJlJpi3uy64zTN4bHjGaB/Dz+IV3IB6Xe3SQNmiwuYQL502WRvuEEbhP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790336614; c=relaxed/simple;
	bh=YqmFdOOf0KlwXQXgehp3yqd33+UQEk6z/4iD5MpnTPM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Acg6DnmdkQCa7se2JIMrb8SSgyryvO4DfFkE+HZkN/TsxySXKD/BoEPsAAvoB1k+NjpglBE1uFLA3yjf5V+HaQYdsNIVf9n3TEcT4BSEFVC1XQgb+/adXsPZ2c9CW5oogDTVwtWpwiuz+TSE8sGmRN8k+YLkcRjYgsfF8aYVsT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LitsHKpd; arc=fail smtp.client-ip=52.101.95.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LitsHKpd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHCtoHRcZAzt2U8qpqSCYgJpd6zvjmDE+PSwq44mkQTEy8olNgR55dY0IdT4RaJ362G/4vp63r0UDb5rDhCLCeq0zBywvspvfMoEa6OBuV7VJKByLL0xzdFBOP6d1fmacboahSclcVg9yMjYDSdoF7oBe+MO9mIhvEy7vA913WNNk3XR9cMGmm4g86+nESiDS2falQX0m8HBgxWOLz+DWf659YNXDNx0m+fPyqHzEd/B401jTcZMGlrl6brJui2WTKcPoinNBvfo2vzhZNHCcSisvTa42ykzZh8HwMunnqDWxo/1K+wmXfNzwCWDQ/4INsXS53oo4RxGAa+SQAPqGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0lBIISy9xA7/UuIlFOZrkZAfsPwzCBQL3z1yp03bz4=;
 b=tbhkxcIeErJFaQ8uaevZGWoWjHYLQLvelkN964tLoDvYbGpSH05pwT8cakqBQhWvqj+BwfOP88Pl5SPpnK3y8xObjdj5JGgmXZEMZajezH/cC8zorPPQ/b1NSZneXh55HUJUz/w1TN5rcOeDz4zTe9a8NH3f0pkpf+yhXPY2gam7bbS1OJ/VrWtmHfsysYr4U57OsfYd8vQK9h8c0Xi1dIpj/iK5JnYrzXtk5vVWYgX3OS2D0Iq3WxkWvn9ULfs1G1GDfgWhCbPJZKSNqOrmrqGjs6MWLaCbX3Tmc/QLBf/VbglqNGdoqLDQ5f8qumDQf9O7jruwY+HlLCYyG7+VQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0lBIISy9xA7/UuIlFOZrkZAfsPwzCBQL3z1yp03bz4=;
 b=LitsHKpduAqtwoCDyFwQa0bAzgXa+TBTKsnicG4n77x9iFxltsNOOIhCnx1ExueVXlgG6ms30KdyoQhnt+c61zu0RelkmJeZi5QZxm6A6xemfsmPHl41LLoWPxiQTD1pJcrEZCkLMRuILDMH65F2uVLCxBr0tRimPhQBYfRcZnk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB9417.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:29c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 11:43:28 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:43:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 12:43:27 +0100
Message-Id: <DLODCZ4H8YOQ.1TVPHD847WAUX@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: pin-init: internal: pin_data: use HRTB to work
 around `trivial_bounds` for `Unpin`
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20260922211320.1390159-1-gary@kernel.org>
In-Reply-To: <20260922211320.1390159-1-gary@kernel.org>
X-ClientProxiedBy: LO6P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::13) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB9417:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ddf8698-73b7-4591-7347-08df1afa3745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|23010399003|18002099003|10067099003|56012099006|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	SOyCBlgRhbuc4xtot1U/bOSZqpP+Yc0pL7R9vkDCU2BkvO/3IRG7X6S/uEieS3YsFRSR0Y1y97sQWEhejy7nBYkU2qhIUpRaQ5lNDN2F+9zr2mWJJMHL+vb9VAZk47xK+rHH/fS/3w1xo5kjWqDz7PRn/nei+xsXT2RSWIINu44lz+ejUVVWnJM4chfdfB6L1jbQfTs2MIgGodVw6AS8DYkS35L/c6LL8KI8GzQdKXNCK/WhV/Axg8ODlZ5/u5KdfiixJWb/Vl6a07P4LKMRRhomm+KxOa/K2vpWiJK/uZOtmx+MrWsBrPyYRG7mkhgoRNoRUgRkjOJ5sQ2P48C3pKayJMkHx0AohDdSnCavJBoaFcvYIzwDDLosaB5VOinWW9N0yllJsBBE4JZti91LnZz0WIhm17jY7bD2C7GvtyZ9r8zBYjZT4tokSq7kPCCVt/L9hZ3oakjlUmBbrRcsOK16zHGzMd9tOVIAMijs1hJ6suoqT02D4BnR9tUjWwvrjbuEwnciXeu6RAZB7mOxeIU0SHZPbYIJYKSYEMfijfvVw/xTTn1V3gUJLM6QiMcgXKpKk9pKbdaVV4MW9uzvqMWw3hmGbV7m/EYEBqb8Fz5Pvm8Av14UV9ObQex+pq5e6pLr3wiFjbRkQCWu+Zk4nL1RlKntsexrzpyMNQ2ZZnmWQ38JJTb0lqyhd8OtqNmmv078fhu9T0Eq2uCR2F9nmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(23010399003)(18002099003)(10067099003)(56012099006)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnBPNVRCMHduUE15di9sMjlxckVneVN6VnhvOWxueXZCUTNKanZXOUF0Rzd0?=
 =?utf-8?B?eTdsbE55NE1Od0dXZ0VVOWRra2FvRGNhZ05HYkxiOG5zME93NkdsTXlPWVBs?=
 =?utf-8?B?Tzk4dmdnSkVxR21zcHN6bUgrWWM5WUFUbEpCbndIZ3MwT3dCbHJCSmVRa2lL?=
 =?utf-8?B?VTAwc09UTStqRXdhZ1NaYjJIVjFaUzFGVGdxMThVQnFCdmVvU3lhZ3VpWERT?=
 =?utf-8?B?Z0VIR21OY1ZUSmx5N3A3NzB4dDNVWnhLejNoc2tkbkdRRHRoQ3JQSEttT3FQ?=
 =?utf-8?B?UDhXSG1yT2owVVpVUjl0ZCt2RDUxaXZmQzlkeUk0ZHVUZHN0OTlSY09vSTVh?=
 =?utf-8?B?UlNKNm1GcUM5NFUzMnNGNUJKOUF2RU5COWlQQUVnRVlVdWtTZlRxRWl5ZGxk?=
 =?utf-8?B?WUtaQkNBOW5ZMFp0SU93VTJFemRpRVdCVXdHak9xYjNmZWhyR2xEcTZVcC9X?=
 =?utf-8?B?MXlHcXFPbUlMbHJNYkgxRm15c1RmVjlKV0IrYStMNkFkelBqNTdNaWlaQU0r?=
 =?utf-8?B?aUlDOGZOZldLaFI3Y0FpdDdhWGZLN25QZlUrbExSN1BpRGJaQ2tDbm04aDdI?=
 =?utf-8?B?dm83RXZnUnp4dHdqMHpoL2l0bXFrdmFOSGVnRFYxRWZ0MzdGbzRCMWppelIv?=
 =?utf-8?B?Uk1GY0R3Wk1Lc2FvNmNZMFFldGpWbkRsVS83N0JxSCtpQ0R1UVF0ZUJ5VGJw?=
 =?utf-8?B?R0psdnFvZ21ndHFnL1g3QmhMNnJ6VHZWTzZRZGhRaU9mdmd6ekR4ak1JVzM3?=
 =?utf-8?B?M3RwZmgvTll5U0wyeGZKMm96YWZEaWhPcjd1M3lpeHdvQkp0eklHSXVzVnY5?=
 =?utf-8?B?N2lkR3VETVRwSXhTZ0UwUkJmU2d2Ung1a3JwdEJ1cTVpeFBVNWY0QlkwKzcr?=
 =?utf-8?B?cHlTZzFOLzFtR09FanJQajZLaHZHNmhtbzNUQ3BDSnp5Y1dna2tBWFhLd3do?=
 =?utf-8?B?dFZ6dE9CQWtNeVgvQ1pJV1ZTMis0WUZiZ3l3Mk9LcTFJTnhBOXBOazNFeHRt?=
 =?utf-8?B?Mi9CNHhFUmFTOFZONXJGOE0wenlIMjR1Q1FyYlFiLzEyMVpRLzl5M04wakJL?=
 =?utf-8?B?cGgrYW5YWUkveFVCZzh6bWtrVlNNUmYwU0EzWjRpS1I5Tk9yNElQc21HRkNU?=
 =?utf-8?B?Q2J5a3dYNDFhekdWLzNaWXQ4WGJjVnJrbFVvZTRYYzlpeVg0Y0NYdlBJTldj?=
 =?utf-8?B?ZWZ2dkRvdk4zMXVaQVdTSEpFY1VMeU93K1R5RkNKdWcxSWVpKzBRcXkvMnRD?=
 =?utf-8?B?MGtXOGd6bStqVzcrRkhaS2hFdEgwZlY1UmdJblltU1hVa2ZKdmhZMGtoQVYy?=
 =?utf-8?B?dVcwU2txRHV4UWVKQlJhcFh0NzBLUXlZUGw2TVFQUlZHTFhWakt5VVc4bnRn?=
 =?utf-8?B?Y1JTanZpRmlNMnQxZTlnVisza1hMRWlQWmtsTFNyZmk1RkRtWHdKZUV6Q09P?=
 =?utf-8?B?UTVpQ003ME5tdWoxNzBvN3V4RjU5OWhHb1l5OXFNVGdZOTMwa1VHbGxUMFJP?=
 =?utf-8?B?NmMzMDRsNThhcGFtTFZtTE1ueDE5TU9EalY1Tjc0bnVNOXUzSmVqYjg5aDA3?=
 =?utf-8?B?dWJlaHJtTlU4cFBZVit4TUJXWFpyeGtxcVYrRmlHWmFXa21WYlNBWjhpZVhm?=
 =?utf-8?B?aysxL3dpYjd2TjRsZzZ4enkveXUyN3p4UjN2L0xGT1lSQm44NGhGQ3JJeWt5?=
 =?utf-8?B?M0lMWWVFS0NVZjFGamlRSXpsMEZkSTdjQ0lLT3ZPaGRIZEpodEJhOFpwNU5Z?=
 =?utf-8?B?MWZtUmRWQ2NaOVo2K1ZScEdielJPK3F1TGFNYTZYK1E2YUFuQ0NXSjAwNWpj?=
 =?utf-8?B?SG1URzRZcUM0RGFuNm80Tzk4emdmeEFYajFRRCtscTl5WFJjcHQ1NTE3L0lY?=
 =?utf-8?B?dU80TU5PQjlFRzZOb0JwczhFRTZ6Rkh0UmNyd2FJWEJKSjRtNkw5aUE1OC9x?=
 =?utf-8?B?ZVBkc3VIN3NvbC9hOW1hRWZZVGE4WTFmMHN1RDhtY3RKMmFYUUVxd05Ba3dy?=
 =?utf-8?B?S1huNTd4ZVM3V1JsOWJzQUVTRS9laERuTjR4RkIxVUwrb2c4a2hsbWRsbE1D?=
 =?utf-8?B?Ym9Id0FhaFVRUS9DWjJqK0MrUVBTWjZXTEg3emtHdU11b2ZEait3ZjFlczB3?=
 =?utf-8?B?eUFuU2p5RFpFekZFS0pJdzlPQzRVbzZMV1dkQlhpQmxoenVkS3F1N1ExWFBt?=
 =?utf-8?B?VEhuZDFxeWNjeGdwZERWZXdpSW1kUElRZVZvaTRMVVNYSSsvSGxqN3RvazBa?=
 =?utf-8?B?MHR2bGg1WWl1N3ljZjdLclduQjA3aVRINGNnajBDSnprRUJpZ3Z6emk5c1ZY?=
 =?utf-8?B?TnF1RmFUQ1JRNm5Wa0dNNUZVMWpYVjRoVlgxbkhYTERTdENiVjNNQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddf8698-73b7-4591-7347-08df1afa3745
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:43:28.2585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47b/FMVpUa+WpZS+A8zB8MXwKMD7V/uOyUPZQSNHzlOIjFloYld0L40eWBHKhNVxHMMTPDLIwDdrq3pOXEosqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB9417

On Tue Sep 22, 2026 at 10:13 PM BST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> `#[pin_data]` generates a `Unpin` implementation for the user, which
> requires reasoning using field types. This is rejected by rustc as "trivi=
al
> bounds", which can only be specified using the
> `#![feature(trivial_bounds)]`.
>
> Currently we use an extra lifetime in `__Unpin` to work around this; use
> HRTB to introduce a dummy lifetime can achieve the same, which the
> `Zeroable` implementation already uses.
>
> Unify the `Unpin` impl to also use the same HRTB trick that `Zeroable`
> uses. This produces slightly better error message and slightly shorter
> expansion.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to pin-init-next.

Best,
Gary

> ---
>  rust/pin-init/internal/src/pin_data.rs | 35 +++++++++-----------------
>  rust/pin-init/src/__internal.rs        | 16 ------------
>  2 files changed, 12 insertions(+), 39 deletions(-)
