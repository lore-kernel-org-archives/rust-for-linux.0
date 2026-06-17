Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021074.outbound.protection.outlook.com [52.101.95.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698DF2E7362;
	Wed, 17 Jun 2026 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781705287; cv=fail; b=c6rQyeWrO72Qo7GjSCTl+gEuoPcKy3Ro8TVVz54ps75Oye4KO+RwtRKsb9R2/B/lwh47937sYvtwbZiwfbo1Q6+cQ3OfwtEBSjESsVvykDdcnWZos1TjQb4xoiKbwL9GLSi82vijKKofVOYCC06JAn/d4AN9M0NxgNJU83rc4eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781705287; c=relaxed/simple;
	bh=T0dHMXZPh1ZlNZOQlyRiAkysWB0uIJ5DWO0m3H1eTwg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=rs3TBlxkYCW3FsaNqSFs0N5ScSnb1M5/DG3pXhkML4UQ1++j0NYujjhI7bsSvFl2shQMDEWddn8jxoGmQy5tD8CBLz4l6KYTlxAwq5j4vv/946SGsCKSewwftRysVvv4Amc99UCgzAY4JgTUCXITnu+nMv45vuWtWxAJV6BW95g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fDRvbmQF; arc=fail smtp.client-ip=52.101.95.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fDRvbmQF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lplxjEQT42dl6MwS7YA5vQ18AufqK2BW2nUSx1WkzEtrDOQU2F1LDKLc4E7RStwN8/WbILJ5Z1A9fD62KK7E4q1Y72aw91kIfXNgErwqfui2bUyYjGR7Xs67EDCBF/b7WvlPBdWiW7EHrsdl+uGx6Zi2ppjW1QtrJZkgf19OXa3OWYFWivOgVp3R2cPuGVtg1c6S72YMHGLS0X5aZ2//xxwg2K/RP9vdFM6g1ahQG86TVX1SF8+w/JbmJVUdjI3zPGfLUNBra9/Vpipm+EX5NY4uoOaBaKc5E03Ve0xJ/MqtfzcX4jOHrCJSMGGGhZC6oW+05k/DpoZMaPYLfQGP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wxe7Y0YWVXh+l19hXvFZLs4Tm/6rJevkR2R5t0zR1Q=;
 b=JX6FaKY8J7kICGZSe3yMgJa36wXp945M6aev7U0l73+dZNkLdGiGr+0+y0fiiPZrkuj1PMudVx5+6vHiFr+PbUJDWf+ctYuXpgTFaKBmUEJxoCR1pR8wc5CH5lU4zWz4v2pkuife+ZwdJktJOViHrisJ0nopBybzVgpiO6JYfkie2cQjWO4oYqgr9z0Bb0v7Ge8nt14pJcPbAGVQBTC1Xh76OiDmT/+O2L05mtSnzdTRoJBmimfVtDcTjO/RVKhWplf74BKdClOf6q3mGwU8LyJTXpL3jX2NCs3U8s4AGly0GRUnnzJQ7CLVFTd34gb7ATKG7cKMAU5pg4A0SOgY4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wxe7Y0YWVXh+l19hXvFZLs4Tm/6rJevkR2R5t0zR1Q=;
 b=fDRvbmQFuJIl6d2BFSf+HNaJ4LoYYkdmnxrufcMM33kfTWei0Ten98yo6NcRNcFF3WsO0VJnkn3hR76ZaUs+sBYpaY2yYUL5CzBuv7WZLiSaGGrpB3HHv60cfksHit9oXVVZuQJblgZcbmcObbGwqGkm384c4MQwfK+0Pvj8J9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO8P265MB7967.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 14:08:02 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 14:08:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 15:08:02 +0100
Message-Id: <DJBDT6ZPRC1R.25AODA9T7HC5B@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <tj@kernel.org>, <jiangshanlai@gmail.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <dakr@kernel.org>
Subject: Re: [PATCH v1] rust: workqueue: add ScopedQueue for lifetime bound
 items
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
X-Mailer: aerc 0.21.0
References: <20260615115626.871457-1-work@onurozkan.dev>
 <CAH5fLggQDAQ02YLibAO=NpQF8xxj_0GCEz5+cVZh8LmYo+xXvw@mail.gmail.com>
In-Reply-To: <CAH5fLggQDAQ02YLibAO=NpQF8xxj_0GCEz5+cVZh8LmYo+xXvw@mail.gmail.com>
X-ClientProxiedBy: LO6P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO8P265MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 5483d033-9562-436b-25eb-08decc79d83f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|376014|7416014|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	jrvh+q/8Mndx+Pj3yuMjCBGntjvk3GbE2tyhaQON0SWA0KBoeI/F3NYwUv/w0kmmML/mvwy0wDj65QyNFZcTzi1pw+v4eqMjhDhvK9veNjhwfeVx1fqbSZcmDdM6t4rjaWwGvMKrpsq0zXS2RSWLG4ckqugFrNLIAmnKc3j5oQRKolHGpFwMBzdu5rJf2ZRJz0o+ov3nF0uksAMlzyvXBAXb2pYgrRbDNsp/l4H/6Qzqjr7up0G4cd63QAOzAT7uJ4G+mgVtUTupo043FxfSGmCoQ+9ZeY1EwrgYt+2WiI/URKbRPJOjayUPj3qnb56u8Iguc80dB5tBzkj0tsfvZ/WyW6vojS0LIFj5OGQ7V4Gl6MdqwWg5cXU+mF7+VdZJPRK27nA4pqkVxZa8AFvt2tGlfIh3wiN10rB2PJdQK0M4c1rpuOwD1G0g6o/SKj8tQ7LB+ocmCWG5y3oiLfhaMd533yNuRZt1RyLQv/dCX3J4AtsrzPMYqYqi+/nF21nStqyYHIdtQeYoCfPWAA3w7IdsTGZDiMh4fnUeUS62M2SU8yeBdC7XAen0oRhnUYHUXEYCYnV31Yth4VZSGkCs566oQH909s2FOA5C9Jc161f83K+f96XkScy2IsqrQcKaKzkwBFTDhCyreiJcFBXnERmWFF12GyAkIZdx1F+FGXEBjxaUP0tKDrrexhft8Asx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3FUdXV1U2RhVXNGb2JWK241UEtoZ0U5Y2VMWnluUVBZbXF3VzN2Y1l3WElR?=
 =?utf-8?B?dHZGd2NCQm5QeE8yK3lNdmw0YWoyNjR3RlZVNWo0ZnNQaEJhc2FFc25jRlhv?=
 =?utf-8?B?NmM4SC92RG5TV0Z4REZNUW5TVHJvR25CdGdueHNvemJVdks4YzB5b0ZhOVhU?=
 =?utf-8?B?ODJsa2Qyd2YvekhXb3ByU1lSMU5aR0E2QmZiMjJZREhOR2RJZnEvNVlZY2J0?=
 =?utf-8?B?U21nc0pWcHl4alJhRENjT1hHN3k4VEpQelJmVURYeVhXOTd0aVFCWDR4MWpT?=
 =?utf-8?B?c3l0ZytwcnlzcnQ3aDN2ZEw2WlZ5NVNaWGtBQ1d0ZXVHSk9QdzJDYmRkR1FV?=
 =?utf-8?B?eHh0SzRlOEY5OXB6QTZaYmZFUzBLdWdsSXJMNG5pUEZxeW9sVGdHL0hXUEo3?=
 =?utf-8?B?SXBxR0J2Q1hnUVROSlZHWXFHY3RqRVRRUG5salJYK3ppeU5jUkIyTTFUQnpN?=
 =?utf-8?B?dlZGQXRpSDU0ak4zaWxCZ2c4NkNzT0FiTlVlU2ZVREtoM2taWEI1b0lCVmpG?=
 =?utf-8?B?UUNrbGF0ZGI5TEZKQmJ1ZFVSeU9jRU05SGljRnpBTWdrUlBJaFRHT1ROVnlP?=
 =?utf-8?B?RHhUakFIQjNCYzJiTHkrNEwwTnhZbXA0WlIyUCtid1F0MEd4QTFMdVZJeEdD?=
 =?utf-8?B?RnpuaGw4OGNxSjMxYW91MzMrSzNNZ2RXcnRLdUxuL2VjTXZoMG1QVEJOY290?=
 =?utf-8?B?bnVwSm5KVEtIVGcvdm4xR250Skh3UTM5ZFdrc3JybXlLYWJUKzNkTllsVmho?=
 =?utf-8?B?WXVibHlmL1RzZW00UGRiSzc5YzB1elZySXJiN3AvcHJpUTBVUkRPRythOWVa?=
 =?utf-8?B?NlNNMHZDNDFZY3FGVjFvalNWbUJEMWZQL2ZWbWtNb1lMdjdPUmphUE5RKzRM?=
 =?utf-8?B?U21ZUm9WQWMvWm50YjdxVFpvZ2JyTUlUUlBnd0FyQ1Jmd3U5QUVtblliaGVW?=
 =?utf-8?B?SW5GWW8rVTcxYm1JMkZMQWlGZW9PcHZDa3BUWmdRL1VKaUE4dUF0ZTRMcTEw?=
 =?utf-8?B?aDAxZms0WHlwRytJenpUSmRFQWRiVTFpYUNGemc1dzE4WEVCZmo2VjU2Mlkv?=
 =?utf-8?B?Q2ZYdFhNTW1BaVpYQ1dWN3NVbFp0MVE2Z3hKMmpIUDVKdUVhVFFRYmk2dDdJ?=
 =?utf-8?B?cUFkYW4wTC9Qd3paVWNpMzIrLzZxdW85OG1DcTdBS2JqYnU3M0pkZHA0Uncw?=
 =?utf-8?B?V3F5ZHV5S29jTldmSmx2RDZTM084clR2T3IvRjRmMzBJTFhtUjhuWk1wWXh6?=
 =?utf-8?B?c3dhSGl6RCtlOU5QTmU4YVFDbjRkM0JwRXBCcmdRTWdvZGtxeTZacFdZajBC?=
 =?utf-8?B?M05aeVJXMjMvYjQxZnFrRzliVG1LVVRFV0o3NG9JQmxQRGFFM243L3AvaVQw?=
 =?utf-8?B?K3ZubGlPT2FOYWRveTdCMmtsdzRHNldVSDAvdktxdXNUUjNqSGdJOStQbEtI?=
 =?utf-8?B?bmFuUjl5UTB4RVo3bXUwT3g2NlB6ZmsyekRTL1VjK2xLN09uTHhmako3WnF1?=
 =?utf-8?B?dXV6Vk92VTJmRjBhV2UrWWJUQWxBZWUzN0J3NGdhOUw3RzdGVUpCTm96c0VL?=
 =?utf-8?B?LzZGWlBBQ2NjV2IwbFZFVUtweFFMWDM0dVY2b3FjZWZVV2huNW9mcmpHUS93?=
 =?utf-8?B?ZHBtMFBIMVFsYWg5UHh6b0VBaGNvWVpreUo2d0cxS0MxMytPTW8wVFF1bHpj?=
 =?utf-8?B?K21KTEc5UnU5eEJlaFZvVGRpQkJEVThTc3RER1B1Qzk3aklMZmJRQlBJQkdw?=
 =?utf-8?B?Skp3TVhBYlcwZzBneXp1dDNVampTWVFIMVRDbFg1TjZHWG9KK3AzUlVaQlRx?=
 =?utf-8?B?YmszTTErYzdmWWJyVStPQVdJSlRFeWhmMGdaVzU1SmdGVUxJOEFCb3AwdUdi?=
 =?utf-8?B?Mlk5K0pSTU9ncU5pS0xnUkhiMVdRNGtRVjh6RWZ1dkU3OWZOQ1NaWUtUTVhw?=
 =?utf-8?B?T25Ebm8ycUo1QVNLb1A0Qnd0WEluYk1Rcm5uY0hTMmhScUFvTCsxSWxwd3JU?=
 =?utf-8?B?YVRrUW1NS3NZbStrVUpnTDlvSkt3WHZPNXRUYlU0QVFUam5LZ1hwcVRjc0xF?=
 =?utf-8?B?WnlyZnRrd0c4bTJMVnFrczc4TTF6aGRlRm5MczA3L1ZqRVJqQUJrekQrTzNJ?=
 =?utf-8?B?SEhOT21SRDRMSGJmeWNkTGs0eGYvcHpndlBic2h0N2hOdW1Ub1hrV0I5eTN4?=
 =?utf-8?B?U0JsSGtuYWNFUTZmUE43Szl0MTI3ZXlpZ1E2bmZjQTBQR01PNTV6RnhaVUxl?=
 =?utf-8?B?TWJmZVJveHJ4Umozc1d1bGMxd1RndXAwVkFZT1Bkc2FmdGhTRmVvTVJLMDRs?=
 =?utf-8?B?KzExb2I2Qy9lV0NGQ1BjTldnVFBuSjVDdjdwcWhuYXBmZ3V3QzNKQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5483d033-9562-436b-25eb-08decc79d83f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 14:08:02.5107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYlzo+TkR6feBN2j0+761cJhf5+aYziYM6XtwR8sbPQH2cKGucxDBoMHrrGEEwopgb5Eul3+U9ctk4BTl5k0Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7967

On Mon Jun 15, 2026 at 4:18 PM BST, Alice Ryhl wrote:
>> +/// An owned workqueue that can enqueue work items borrowing from `'sco=
pe`.
>> +///
>> +/// A `ScopedQueue` must not outlive data borrowed by its work items.
>> +pub struct ScopedQueue<'scope> {
>> +    inner: OwnedQueue,
>> +    _scope: PhantomData<&'scope mut &'scope ()>,
>
> I think this can be contra-variant:
>
> _scope: PhantomData<fn(&'scope ())>,

The function signature is contravariant, but the captured data is covariant=
, so
they combine to invariance.

Best,
Gary
