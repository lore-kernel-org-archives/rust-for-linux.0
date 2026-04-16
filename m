Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020087.outbound.protection.outlook.com [52.101.196.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD5F1C84D7;
	Thu, 16 Apr 2026 04:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776314166; cv=fail; b=W3KjwFGVadA/xp6tWSHAxcb7DAREZT/VcQ2qS75Qh5Jr3r7Or119zkkBvuctl1dEVyLiDmQEvMPFSr0N87fmRWdnYj+z/0EBgn3lLFZkYXA29uibrP2W9E0aIInJSD/u+j92lC1Xsk+n0CYn1tnizdf7aHMTbEup3Ddyvi+1gyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776314166; c=relaxed/simple;
	bh=vE4a8ir5Oh3EtyFPe3kwdxZrwX9np5CJLRs19zI+S08=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Ft8HSDQlVnT3urQFnVTwcL7OmhkYFYpQdSRTKG6rAEgEdYw8X2mpzQFnCAqcIYVE5SG+J0yxTdnQqLVr60tsNXiRNb6UMuDjvVnhcYshP2+8FWgUmGoIkiS/tH2F0eDKysr/6yRztj/OkHHjZMrHM4O5C+wRw7nOIf8mTttn8W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UgiEjBof; arc=fail smtp.client-ip=52.101.196.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UgiEjBof"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuiMhqcM2q/L1HpXnYy8FSSNuVfp6v7MN3XbYn436GUq4kBE4fdgBqRtTQ4usHbYiz8B9vGpE92s8MvKh4qFNfqFj9eyZ0Ww+11dNfcmuSTZC8Wd7sPQpNLzguBxSZ1Z61C9Sv/6e3BszfBn/HbtxOCWwD/pc1rkwhie8GVuDTZpAjH6XyczuA3j8MzmRfaT/MVEfHu77AbHrHlgqvhHH7pe6rcTxkLqy6MZeASNvOd2YtPRtf9klHVjhOTekeaQw45mlEBuKUSzlHon3lCWgKQTxDaImOtNA0hofp6wt5jgGHfDNpYzNxKUz1sYBcZQ9XeVSwfs2p4EoC9GsLxOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dri9R0xL7WwDHQC3nfVwXAAZ10hOdX2fF5+tp7McNNg=;
 b=WyxVSMV6+0U/j1psWOHf1hNsI5TCD+4LqjTtxVemxl/5Nc7TgbOklpXkey6GA0ZEzco/XRQT/TKtXbD7h8WU8Blf5uPsWXqPZ78pBb6/ZV9nX9ycgvFP2bLzSK0hLSkAam080zkWIlEN1hMmNz5kMS1KQ2/ZWNC3POVUUUcYhOybdKsLt9/H0M4DlWPDB2LAf2Dok9Ddrxt7H95nZB6erjHEp4EUhV4K8uLa7y0lNwGg23ZU/7Qzw2h4wiQ/KoDPpExMTrz70h0zsPg28CxYQDNMLh/jK+nWhNET5Sk2DA1pxlGIaCzpFMUz284y8GecK3FNo8b9DqN2iVU7oZTncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dri9R0xL7WwDHQC3nfVwXAAZ10hOdX2fF5+tp7McNNg=;
 b=UgiEjBofgW2K364VWYn5p6AURo8iUqLtsZQk1RRoOj6fl4EpYfaiq9IGKdCs685jnNQzNhLJopRjFSIkUBl2qzRh1yrUGpbuktEDianc5n+0844tnJ/yavK9e3QiJzZXTUKgXB7arcsRb3++GWac6qrz/nXCGRzHR2XvSGNyJdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6476.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 04:36:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 04:36:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 05:36:00 +0100
Message-Id: <DHUATFZ67N5O.1ZBS5JWYME7KZ@garyguo.net>
Cc: "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Will Deacon" <will@kernel.org>, "Ingo Molnar" <mingo@kernel.org>, "Waiman
 Long" <longman@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Mark Rutland" <mark.rutland@arm.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add RUST [SYNC] entry
From: "Gary Guo" <gary@garyguo.net>
To: "Boqun Feng" <boqun@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>
X-Mailer: aerc 0.21.0
References: <20260415232830.8128-1-boqun@kernel.org>
In-Reply-To: <20260415232830.8128-1-boqun@kernel.org>
X-ClientProxiedBy: LO4P265CA0281.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: bcad3276-7703-48c6-67ea-08de9b71a97f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	SoY2ClbaZg7yf/WwPJw9i2AyyDIpAAQZ2sz7/xwXWKNUnGU2fJZ6TeW5msSPXlvpWD2lyF4OyLprijILSc8zlE1DFfxXM262YhjIjG54X6DnQm+Fjn+guDCsqz8MXX8iq7Y6qqOGU3PREjkbJvyRmdkTEaMtgsQbkE/5LP+PkfFgvkn517Qxcg+ATx1mnNAa+bRFrjK1nW/qnpbsc8L4LNeibVTz42sHEJXnWUJxQ/qo/jdrUC0VbvhLbiWxKQ2er+UjiNIHU358SmAlcxx6ScqmWCcjPpWNRHdUdR3d96gYoGXQW1E0rtqUvRg5Gwr45OK1j24naZ+GlGCoY9+5QSDc2Zc6p7Xlj7SSVZ2hxpA9w7FAexY16pF6ftO7r2F28nzigVKBG9wAN+xnysv5Sb/PMD1PPbNpT9dCA+I6lTq0G0EyOVMNmdXvnqzUMO3z9qwoVojGbMZRIUF4OucshRH90ka9jjKDe/hNwyMJhbFOoDTuLyLTxpSeaPoNRgkKw5+nEM/8yMl6gLqeyU27YR4ae8YcmiTa929rOkLhrI9xZ3HgQEdvyp+D25CYdsdqzfYJknkLyx6VAtTvuYurU5KdTEdJ5HT/0K9WaBCUkzs6iaHXOFnMjQvHi0iev3/wa+YR9164/NYYcT0MhaJUNj6i0NR5SYw/wMjm5qZ0Z1d8S00ebmFxAFl3ndlJbAcUfUOnGxQ3Oz65EC9Jc0COiQScFhXIN6i6L2c8J7yFIeI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDRmNk12dlBJbmVMNm9XTVp1TVoyNFNmNGl3cFdKQ2kyYVY5RHRlaElyOEoy?=
 =?utf-8?B?T09SVWVEVHRpeHRSdzU0NFZYVkxvOEpVSGZqcnJDbkpWaEhUdDZ6cCtoYlpZ?=
 =?utf-8?B?RnduanZVbjZwcDZGTHZVdnloUkUxaHBiaXYwM2JmcnVEUkdsTG04MXJ3U2w3?=
 =?utf-8?B?cHpuS3h5T3RDSU96OW1NVHBxK1RXY2RmeTZBQ09qaVZkVlYrVllSSDJyYzcr?=
 =?utf-8?B?ekNVOVBkNHNGTjdVYmUvR3ZQUEk4d3FDTDNvTUphY242VURaTjV1dWV6eURJ?=
 =?utf-8?B?b1M1Y3BYMEx6TzhhZVJWY0JLbGdnMW9pVjE0ZmpqbW1ZMUdkT2tLUWw5V0hY?=
 =?utf-8?B?S3B5QWJuWTU4a1laaVcwbUFIYUt2VmNLdHErRzBRUzBaUzF1dGs2Nno3MzJL?=
 =?utf-8?B?dm1kRms0VlpyeUpOTE9qVms3VWdEL0U2TWN2bXlRYjhOUmdLRlFEcEM5V05w?=
 =?utf-8?B?bTNTR29haTNMTmVUbXliK2prQWJXQkF4UDR3VHdxQU1JY052cHNPUXJwLzdz?=
 =?utf-8?B?YWNDK2RlbnpNOUVjcGY0SVRxS0FjbVpqK0VKSHJQU3pGV0M4SmlUcVlRblNH?=
 =?utf-8?B?UHNmUVN6S09BVFpkQVdlN203aUJKWjc3cVJVLzUrKzlnUE92bk9mU2lOZFc1?=
 =?utf-8?B?dW8wSHl5WkhtYkFNNVRsQk1ZbHNiUmlEU2U2NTJsNHhieTY4U2pCYkxvaTZR?=
 =?utf-8?B?eC90VFBsZDhxL04yOG8zZEVCYXoyNTdGTHkzZkxrOFJUc2c1Q0xsOWY2TlBI?=
 =?utf-8?B?d3h4Wi9TM1BTamNjZlZNbnpkLy9DOXk5R2dDd2VzRkRSUW56WXVBWG50bllH?=
 =?utf-8?B?TlIvTlhKK0EvSW9rK2oxaXcycXViK1NNVUpRMDdVZlF1TFd1ZFdPa3hYeVMv?=
 =?utf-8?B?YndibE8vNlkvZDE1Nk1FVjB3azV3SWphL0NRZTdZRXJTU3V6UDVPT21QZzR2?=
 =?utf-8?B?Qlg2ZjJYeTBCbVdCQkx6SFlxTW9oeFVxb1l0SDBSa0JJSjliSHgzMDJJOHYy?=
 =?utf-8?B?Ni9sUmNFUURqVG1vTTBYNDR0d0hxQ2xOTkRWTGI0QlUwczRKTTc5NlNBNU4w?=
 =?utf-8?B?U0hUNm4vVjhacWxYY1drR1EvNkZHSjBzTkwrUHIzd1BPSFBBcFNyN21sRzNU?=
 =?utf-8?B?dk9EMjRzRFpvVDJFcEpMVWpJUHBMSUMwUG5XcWZDaS9Bc0MzWkNSdXJGQVIr?=
 =?utf-8?B?SEsxVGdTWGJ4cktzaGZMUmlHN0p0cmg0VUpsek9HRjRvREQyazF1YndGdTdE?=
 =?utf-8?B?UHFDV2hyWWgzUUtYOFIrQ3E1ZzlnUHFXRXZuV29rZ0h6bjd0cjJIN3ZteUVR?=
 =?utf-8?B?a2g2c0FrSUh3VUN1NVRYV1lwQXFhSWIyVkZFK0o1WGsyeGhpV2YvT2FlWFBq?=
 =?utf-8?B?ckphd0FoS0cveDVXeE5Hd01IdnMyQVJnRjJYSHMyREhZTmYwMUpsamlvd0hP?=
 =?utf-8?B?c1NmeWVpRXc0elBPZ0VvWkcwODgycGI5aExRVTVpaG1oeG84UXJ5Q0NaQ0Ix?=
 =?utf-8?B?RXBIdldJSUlXWUIvVkZxNnBobk9NVEVkVW82LzVZc3huRGtZR0VNVU04Mktz?=
 =?utf-8?B?UDhkcXh3K2poTzN2ZWV1bW9zZW9DQjRjejZvMStZMit3LzJnYjhiQU9NYkNn?=
 =?utf-8?B?WDdhS0VKaUJXZXlZcUdVNDByL1Rjc0doT2FRYWV3R1BBaXdVR0Z5dWFFeUt0?=
 =?utf-8?B?MGxFQ09NZDJGUER4UHplLy9JbjdqQTZXQ0xoNTUwUURRNXZtY2dmdUtHTU9K?=
 =?utf-8?B?UnFlYVdmcm8zdjVGcXFXREppZ2VWeFdmNWlRcy9XbHZYU0hiNXJacGNKQXRG?=
 =?utf-8?B?a0ZXUm11OW9hdUFsSm9FZnFDbkJXclBpR01reWkrczZyOGpHb0pwMzRtSHQ0?=
 =?utf-8?B?TWR0N21KVzBERUFQdXhvVlZVMHNCa1ZCN0VwN2pRWENwbTdWNEVGMEYyYUUx?=
 =?utf-8?B?R2hnd0prRVMxckR3MzRLYzhaK2RGeDBkUm1zNU1rQnJPVDM0L3FhR2s4Smsr?=
 =?utf-8?B?YjI4UVdmT1VXcTRLSnhyaWU4WUdxUFJXWEk3T0xQVzhtbUprUUtHUlc1MlNX?=
 =?utf-8?B?dC9EeitPNEJPZFJGa1pmbHE4V2hLUkdIVUVSV2R6aU9SUWVkdGUzcTZET1o2?=
 =?utf-8?B?MjBDbkl2UTIyckhyR2RwenFlaG1lSW4zRW9GdUpEZHBSWncrK0JwMlYrdHlO?=
 =?utf-8?B?TGo0T3pjRGR4MG0yTDZHeHBENTBiWi8rb2FYYWNPUVpFbnVxZE9IRWlkZmpC?=
 =?utf-8?B?UG9FZk9xWnM1ZXJiU1VFY09KWE9JOFF5Z2xmdk1tcWZTVmk3Z0FxSmFXZmdS?=
 =?utf-8?B?MklPL2NoQTVneG1jUENuSSszZWhUbGNhbSsva24xSXlQN2N4dDZEUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bcad3276-7703-48c6-67ea-08de9b71a97f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 04:36:01.1698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C55ngyQK1+xpSCufcslMw9ptWopfNBXoCT91BBJbZk1GGhzjoG26PbIJ1r9s7P+AVF5hyYEQkrhgtUCVlCrm6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6476

On Thu Apr 16, 2026 at 12:28 AM BST, Boqun Feng wrote:
> We have two pull requests on Rust synchronization primitives with 10+
> patches in a row for recent cycles, so it makes sense to start the
> effort of handling this area as a group.
>=20
> Luckily for me, Gary Guo and Alice Ryhl agreed to help as
> co-maintainers, and we also have a talented group of reviewers:
>=20
> Lyude Paul started the SpinLockIrq work [1] and did an amazing job at
> improving the design and implementation.
>=20
> Daniel Almeida resolved the Lock<T: !Unpin> issue [2] and he did a fair
> amount of reviews in areas related to synchronization primitives
> already.
>=20
> Onur =C3=96zkan started the ww_mutex work [3] and did an amazing job at
> consolidating various design requirements and decisions.
>=20
> Of course, this only reflects my own knowledge, and I believe they did
> way more outside what I'm aware of ;-)
>=20
> Note that having this MAINTAINERS entry is meant to bring more people
> to help on the synchronization primitives in Rust, which means for patch
> submissions and design discussion, please still involve the
> corresponding maintainers (e.g. LOCKING and ATOMIC),
> scripts/get_maintainers.pl should have this covered.
>=20
> Link: https://lore.kernel.org/rust-for-linux/20260302232154.861916-1-lyud=
e@redhat.com/ [1]
> Link: https://lore.kernel.org/all/20250828-lock-t-when-t-is-pinned-v2-0-b=
067c4b93fd6@collabora.com/ [2]
> Link: https://lore.kernel.org/rust-for-linux/20260103073554.34855-1-work@=
onurozkan.dev/ [3]
> Signed-off-by: Boqun Feng <boqun@kernel.org>

Acked-by: Gary Guo <gary@garyguo.net>

> ---
>  MAINTAINERS | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

