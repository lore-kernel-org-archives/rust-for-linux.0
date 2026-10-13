Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020129.outbound.protection.outlook.com [52.101.195.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDC83EA967;
	Tue, 13 Oct 2026 13:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899939; cv=fail; b=VbGR9O3h8iJl84XkgJcyZMHD9VfJ3QrTgqJ0FxIJv+7QBmZrMG+1cj6QCmSdGE0fhrV3EvXDfNJigQ09UGpQtAQJJ3epPqQfKeWkE+bCDT7tqAyqf8k6NDb3o3S7CiimM6uXK603GxUwMvoDNkEACWnee5yaIPGeVKI7G0AkIG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899939; c=relaxed/simple;
	bh=5Jjg8xzS8KVQTrJsRQKN+MENe36YbGC1LGMoK7fDiVU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=nofjYLX3UTN7IcbdmXjD2ExPMUyKDbcDoel+Owj/1MWDgxBba7S6au4W3yhxZfz8DxerCkEmRqFulZRquuWA+GsC8rhienUZYC2g0x1SuOwaPVDyb8SJ2dKirHXGmrp9njXwsD6MbToEJj1n4YcdaSn8U0qq7k4Ko6u7ZJjs5p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=wc4KLK0u; arc=fail smtp.client-ip=52.101.195.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="wc4KLK0u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWsmP1rJKcrSrHXFgrjTqhiTgjVK0sa1AAH18JXg1f1/LrQEMGqsIomQ3K4R9bfCMeFlYaMQUBhB7pR4YsZw6ryWwXyKIqel06/Fy8BgzPirBcOBK2txVXnT2Q8fVdAKu7KLdOgw1BjenvIRfvJHht0pAXxwo5YsuNGH6po/TU5Y9UgrF9VVWVuElrbTbo/SR5+72IQwlxo8ziryyD4ry6e+aU6mlbSSz4g1gCORvBkdfwg/+5gDmZdpwtnDt1CC4xm1eiwcxNPeG/dNjsLdXvH5c0AoimApCWMSjNW9/NAwikBpT94vfABdVOvbhTvl/papkrembnLLah6zLCntQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHVJVsvpTbkDdwy9wsjCngryyqEoRlajXhkou513Uag=;
 b=G+6GSeq4GcS+uCue4lMDZFyUmq74h/5Xfzi6kLTX+PCYSC+ST6q8WkeqB38d1KuSVzwvzSQZt7ldgY+7f/2+keknA2XivyVWl+YiCTfCHKGYGWjngE2or1MKYkhjzu+r/0P1qdQdiY7Ala18tRjg75o8UUAA9WcjU9oZBW0axKQaTja4L8SUnESCCVqsbYPosq3vEwOUxVQTd+m0wQxP9o27YODB2fLdVLZdi6eANTTwtXMz8Lt5e2YT6PI9l9SVEIvUEcYXcSs39EeH1YIBXgkme7MOBt83yrQ3zfhXuQvHjmgJjJ4fbAKXRbjDSdnmClcKFCcJkEML5bvRk7jMDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHVJVsvpTbkDdwy9wsjCngryyqEoRlajXhkou513Uag=;
 b=wc4KLK0upKJTY9+pTCWIYrZOIbJTZnD9t3MIYHc+aFBVnj9JhMLtxue/RFKR7KK773wtRm85K3dS1yfc6wsEvZFxsB/F0IOTVcjIWU0NpP89sS06temlu04vWPGPXe8r27yQx6wWQywpaA6pSlaTbiieQea5IFT/OjguW46KBP4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOBP265MB9012.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:482::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 13:58:52 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 13:58:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 14:58:51 +0100
Message-Id: <DM3RIG8CD89K.1HR52QEO55IU8@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>, "Alex
 Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang
 Mu" <dzm91@hust.edu.cn>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Carlos Llamas" <cmllamas@google.com>, "Marco Crivellari"
 <marco.crivellari@suse.com>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: workqueue: replace deprecated system_wq with
 system_{percpu,dfl}_wq
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Tejun Heo" <tj@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261013-rust-workqueue-system-fix-v1-1-e9ec616e402b@google.com>
In-Reply-To: <20261013-rust-workqueue-system-fix-v1-1-e9ec616e402b@google.com>
X-ClientProxiedBy: LO4P123CA0186.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::11) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOBP265MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: 554b655e-7b63-4525-2e9e-08df29321ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|22082099003|56012099006|18002099003|6133799003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	J0iK0rHhhueSq+gK1/ZRfwDrt0Twk7KPdeuvABayhay10gsU8AWZlmqlkFCsH2KfdiGWxhM0EYsUhc99zHQgJrgt/xJp+SuLBUzLdggLElxloCyYluFd8vBq/0FbVqMtdrNPCO9Bj8bKzMLMM6WGs5hKu5tio7/WErRoPyJ3fzqPQSE+BRfOoU52DssMSBReLuWoyWBzYNvd+kSjhe+ao7Sjp3n4gLR+igaEajnmy6g4GP0EUBKOULADh6awnE/st9y1X5pNLOlghjYdjitwKD3qIp7XgUUxJ7sY6wyEzGrVSc4dRwdYF4wnOMvav4CKimOd+CthbHkGGz13A35UAjWZ1+QQp1EuFsRyE3Lq8OpNWMtB5VtEgwshq9xclSqfCUWFb1vl7y2CT2xTNX8sWzEGXpnLEsmdYmlAqTZv7sKoV9R94WVCmeNxl69A3Mm+H4evZ2vBzviDGAMG2OXAf/3l8UoJGsKYUfOVcvmTHEuwUunpzlTZ5KayPCcCLrYvVk7rBx/MJBHaZzKtagV+w4yDeNamTyNXwpGdfsb/G6wx5Ox7Yr6I4ydO8BncXrLVABhrVlzXYp7Ksvkq5CsS+pGkUeG1QG1XCXDW4rEMsxBEYzy1zcu93Mvf8hRTVM5U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(22082099003)(56012099006)(18002099003)(6133799003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tlk4anAvUXNrYmxVZm5aQnhhbk9HU25xRXRVcjZuNlhlb3NOazJBNnB5T2ZW?=
 =?utf-8?B?OC90cGVtdjhtUExYcXJVUnZacUtLZXdLcnA5RHlXdUJwY25HckxDVkVTUFBE?=
 =?utf-8?B?NGs3MzBDOFRZb1ZIWEVTVUhPcHlKSGxJNTAxS2tlTk5ydlNPNGxQekl2bnNY?=
 =?utf-8?B?bmE0L2Y3V29KMzBRb3p4c3ErTDRLU08rbWNweTRSUjRlYVEzVzdiMHFLd2d5?=
 =?utf-8?B?Y0gwb2dkRUNMUUhVZG1pWjRob01PaXFieWh6NE9hQlRhNHhHc2p5cFRHT2pL?=
 =?utf-8?B?QmhBRG11NXozd1J5K0x0LzVVME1LRWM1RUhyNnF5aG4xWHl2bGFLWS84eThl?=
 =?utf-8?B?dmJyZkp4WnJkZzZTd25zNEwxY2pJaGIralpoSy9FRmd4TFVDc2ptMkJzMDlD?=
 =?utf-8?B?eFY3TjJUMDdLekIzUENVdVp6bmViVDRyTWNZNCt4QktBN1hTRGtmNndFbW9i?=
 =?utf-8?B?c3dkV3J6SHZDNmxYUnh3RVAzUFZWSEJSNmV2bkF1dm9pS0p1d1ZETkp6bnJt?=
 =?utf-8?B?ay9qMnRZQ1ZYY29ZblRoL0o1SUVSOTJLaXRacktRNy9TVERSRWRENWJzTUl4?=
 =?utf-8?B?V0RlM2VIOURGdi9RUmcwQmtWSXQyMk5LNDk5TzA4bXo5M0xoVmZQOHQ2T0VB?=
 =?utf-8?B?Ui8vUkdWTHp1clBFNkc4VGg5THhPbXMybWRJaWdTaVVRamE4c01ycTA2L0Zo?=
 =?utf-8?B?cVE0SUxlRWplMHY4dm9pYWpLSGhmbXNSSWEvQUpBbUZlcW1VRzVKcjFVQVkz?=
 =?utf-8?B?S0xidzhvb1VTTHJLcHpCaGdCeWR4QVlqZmY0TFJna0NncEpxRFZ6VXFTSmh0?=
 =?utf-8?B?SWVpeUZrWnNIWUR1TFEyL1ZSWDVLSVl2OS9NNXlIVTdLWXBpdnN4eVp1VGY4?=
 =?utf-8?B?ZnRlaldoZHhCcnF1V1lXSmhqYk5JajhXalZMb0s5QUF6TXcxek5EdCszQTla?=
 =?utf-8?B?MHI0V3o1QXo0K3ZQTzQ0RU5HWEdtZnBGMVY4b2hQOWlVc3Nqd2VkVDhCc0w4?=
 =?utf-8?B?WEFsUnZkNFJiWHFBNmhvUU83VHo5UzZoRmVwZVg3enJpYTdxbTBKZlFqTUJC?=
 =?utf-8?B?Skxid05hV1E0NzJzTHhYQXFvOHdDemZwZTVqejJMUTMrbkZFMW9nZ3UxVTRz?=
 =?utf-8?B?dkFNL0JHellIOTUxcmxETlN6K2NUVVE0VG1ETHQrN2IrNXF6VGpJZ2MvYmdv?=
 =?utf-8?B?Qk81TGlGZGxleFU3ZjZyeVo3MHVXdHJBa3dwYVVQQ0UxVmdtUERTbmdZK1l3?=
 =?utf-8?B?bEJLSTZSRHEvQlVRZ0JlYStBeW5odk9CNWY0TDZaekFiZEcwdEg0K1RBR2I0?=
 =?utf-8?B?SFU2NGF4dGRpMXZqKzRLQytwdlBaLzByd2hVVjQrRFVBTlJyd2dOcUw1dCtx?=
 =?utf-8?B?ZklIYnFPVzRyNUViU2R0eG1mNGZDcFoxRGdjZ0tNZTRZdHpvR0FLQmFKOFhW?=
 =?utf-8?B?dzkyL3lNbnU3TU5DWXR3ZllkRkVTRWZVb0VaNC82UkVoUXVsVGtPcG9WMGJY?=
 =?utf-8?B?S2dKU1UvYkk0dFB6YjFQYVBiVWZVM0hsZW9ZNWc4d0w5NFl1UmpNdUVnLzJX?=
 =?utf-8?B?SW5GYmRySXJ3YzlqaXNBNCttZUFrUytkSVIzblkyMVNpeW1SZkdMTXRlQjR6?=
 =?utf-8?B?b2xYTjBiRTZQTU9LekpacStwSXJWK2pYU25uVnhRSFl0VkxVZysyYStPZW9E?=
 =?utf-8?B?Q1Q3VmRMN0xvRnJuQURMU0MxRnp2WG00ZG1IdVhkVDVxTUQrQlJWUTQxRGMv?=
 =?utf-8?B?cWMrS0FtS2FCSDBoNWRNUkdxK2R5QWI3Z0lBZEVzWUl1ZEE5bnhaWlpRckM5?=
 =?utf-8?B?eXhBVmk5K1o0OFJUSmlGR0JQRWxVc0pSU2RkOURJaWV5NlpkOWw5SGg2SWZQ?=
 =?utf-8?B?cnBMdGZld3dESGxiNExkWkk3clhFOExDS2lSdnBWRC9zRTVieVFvZll5bkpY?=
 =?utf-8?B?U3dCdnoyRWNTa0JKQ2hsbFNxLzNwclVieERVams4MVZua1B0cm5NQVFHeito?=
 =?utf-8?B?ZmNFbXBBWGdoUHpBTDBGK0lKR3VDa1hzMEZtekRrZTVnd0pmNXhXengvM0dE?=
 =?utf-8?B?L3NFQjczb2RVeFZPYndNdlltWWZqbzFjL0dmNUdsSFBrQmRxTDZUU09rSWZt?=
 =?utf-8?B?OWM3MmZsUjNoLzdjcyt5dmVCN0ZzMElBeHdDQTZNcjB1UzFYZ0pxbEhXSVRH?=
 =?utf-8?B?UnNyc2xNWkljaDJCaTlPd0VZc284SmltNDMxT0Z1QVFwbWYrS1F5Vm4xaHZF?=
 =?utf-8?B?N3EvZDQ4UFdrTEFvL1piNFMweG5PcTRCcGNiYmJoQ3d3UmFSNGVRSitKSW9h?=
 =?utf-8?B?bUF4ajBEWGt0TDQvUWtHUmpSUEVITUwrdmhOZy94SCtEbm5FRDZTUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 554b655e-7b63-4525-2e9e-08df29321ccf
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 13:58:51.9071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWP0huBzGaWE/yr4sOX8FVOYaZ4EDZuDNYaxh8UKdHPMtYLlnzeX8MZJCmhHEJxYsmWEdiI5oyTRKUPBXADpkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB9012

On Tue Oct 13, 2026 at 2:51 PM BST, Alice Ryhl wrote:
> From: Danilo Krummrich <dakr@kernel.org>
>
> system_wq is deprecated and triggers a runtime warning:
>
> 	[    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7_ enque=
ued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Replace system() with system_percpu() and system_dfl(), to match the
> previous behavior of the deprecated system() and convert doc examples
> and tests to system_dfl().

system_unbound() is also deprecated (replaced by system_dfl(). It appears t=
o
have no users, so we should remove it in the same patch.

Best,
Gary

>
> Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unb=
ound}_wq is used")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> This patch was previously sent as part of other workqueue series [1][2].
> However it's a fix that is independent of those series, so it's sent on
> its own here.
>
> [1] https://lore.kernel.org/all/20260726223613.1242940-3-dakr@kernel.org
> [2] https://lore.kernel.org/all/20260807165252.3849875-2-dakr@kernel.org
>
> Changes since [2]:
>   - Rebase on v7.3-rc7 and also convert the new SpinLockIrq KUnit test,
>     which calls workqueue::system() and otherwise fails to build.
>   - Add Fixes: tag for the commit that made system_wq warn.
>   - Collect Reviewed-by from Daniel.
> ---
>  Documentation/rust/testing.rst                    |  2 +-
>  Documentation/translations/zh_CN/rust/testing.rst |  2 +-
>  drivers/android/binder/process.rs                 |  4 +--
>  rust/kernel/sync/completion.rs                    |  2 +-
>  rust/kernel/sync/lock/spinlock.rs                 |  2 +-
>  rust/kernel/workqueue.rs                          | 42 +++++++++++++++--=
------
>  6 files changed, 33 insertions(+), 21 deletions(-)

