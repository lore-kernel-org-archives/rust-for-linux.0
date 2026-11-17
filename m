Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794915445;
	b=OH+bOst3zGKog29AFFQqAGUrN/LVs52JoEicv0lxnFjQHR+TvBIBy+2D4NHYVa3F1p5s
	 11coHUMwdWGY/8kJHeL9rCn2BdHT3NelnKldfwFNbMBxYwaxq61aMAa8jTZL37S1rhDVt
	 Gs3bGxYfv9DLeYOgDMv5SIDqbgGqvav8Ycatcg4v3usfyVK6g0OWP3KdOTojNubHIQ85f
	 wwCx2XPnO6PwcEP6RixWFBw0s5m7uN4kJODj3lbflULOyYvW8mOa0ITIacG+DIE3sh/Pr
	 3EDbLCuEYgjjrib9w0KFy4X+k+VsDzlK829PU4vk5CYBbhfqSczZAYYoYjJ6n7r4RaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915445;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=iXhVXfPtEs9icALvlNVn9AdJWGkLxW94GT9KM7ZHA3c=;
	b=atcdigJKBzMsWABdkWg0vBGdBjwXHQMrebDWu22wwl7FdarOSfHIMXhNTKBrL+r0Vz93
	 1A7L5AEbOa9WynSVuUQ+ZMpuNTZF3wZPLQ9ESDU2cbvyeX4FcKm5BrBWoPpZQAbnzr4pH
	 leWbXePwBTPIXsy0mKsNgwXfe0wkBqTs2vq13hqdrOGsyDIszxi9T64js5jUmDAr+56z+
	 /I7fLQjoMRXxjVji6aB0GmpIUXChq6jnitlEtPh7SqS6sWi1flfQhmW7PSqzRhJH62VoU
	 HaM4BfgETXjcFnke6XEF79ESwGg8L81AnEX6wE5mK36TNFTBtTPcMLBWllfrEUZg7gA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=FM46rZyY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.136
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022136.outbound.protection.outlook.com [52.101.96.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA56F606A329;
	Tue, 17 Nov 2026 11:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA56F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=FM46rZyY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQj78LItp07Dn343NGWEmfF5v6ZtPXhcBkgmIAfgD39Dk9Z8JJCkarvoW6Lnr/J+3f3fFB/JZlncbiXEPTvpPjXJ96g0/w9ZnMUYxGNEJoETHkNeYntA3REUKgpPsyN8fZZMh20UhQRYSn4U8NfpokNhqf4nHUCkCLT0zZ0viLfxx37O1Il0C+0rb54h3nuW0dS0gEeIr2oJlQB9J4Sg9FWj6pXoWRwZ9CtsIRDGstVw81r7ezVav/f3psanC3w3hKWBws9ZOStPbInnDkHc61Ey6AhkV/gPSjyCIZgTMqv28qHNB6aLjUmVlbgefPNxg/FIrrCgyf3RbqXhlnyJsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXhVXfPtEs9icALvlNVn9AdJWGkLxW94GT9KM7ZHA3c=;
 b=SDDGXqLljp4GuBnB1TFvrXgaJPgZ9sfKIivlqd9OwTRB2BiPbWTbicgfBDYMbusa1wgO1ZOE0mUYuMWs1aP9VvlsDFKYOyurdG3soQfm8qlEcMHvVdp22KHUNDq3tchN9XFr3b/U8bZ595C9+nGCMEnwJsbBROKhdhYPm8F0HUulEdIFTrJGx8SaL5W+h2cB0yrLNPZenYk3qfqYGomat1S1+iBFv7gQ6RbMYgYk+5SiwHSr+5J41nN1AFmao2cndTnivODBbwilIa47Zu9btya1gl2nJ31gZqQ23mHG+N0fTAcuzn58VvEOgm/YG5voBdVqxU/VizQJTUs8fK3PdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXhVXfPtEs9icALvlNVn9AdJWGkLxW94GT9KM7ZHA3c=;
 b=FM46rZyY1AHN5YcxJJrLgG/a1CAwG65Lv/3qYzvabyfpHEtEAVWo4SlbU0APwifYUWyrM/LvsVTz4FQZkHSctTKa2F6xmky+MzgfG1wBislziyhccl2IH4RiZWwB6pCGafK0Z60Fr045r0FjKaTo8w920EAdYEU00rMYv4EWEYg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LO8P265MB7871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:37:20 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:37:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 11:37:19 +0000
Message-Id: <DMXGF5NG8WYB.188PXG822AN59@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2] rust: i2c: Remove use of bindings::i2c_match_id
From: "Gary Guo" <gary@garyguo.net>
To: "Andrew Davis" <afd@ti.com>, "Igor Korotin" <igor.korotin@linux.dev>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Tamir
 Duberstein" <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20261111205204.481923-1-afd@ti.com>
 <20261111231053.529616-1-afd@ti.com>
In-Reply-To: <20261111231053.529616-1-afd@ti.com>
X-ClientProxiedBy: LO4P123CA0682.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::7) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LO8P265MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 60821948-d811-418a-41c9-08df449f2404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|10070799003|18002099003|22082099003|261009223027099003|921020|56012099006|10067099003|4143699003|261102123227099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	6p+7KYqR5I5YbTVggrPo+hlR1jEM9isLyErT23JevM0h552YlKQR3jCx2wrFjjUVS2DmHudlnGTMFzxiDEl9agNuLSG7bZy1/SmIqaH0DEMjJlH/z2XwFgdVtO1HBogRRstVAcBFBgqM4S5C5lfdS18KgkYOuFpcczdpeFrwHJSZDd5ltXBVmbLmolxKaO8YueuvNYiuewTjXCOSeJyWqVEUuMSvpEo0UFiETMZSFo3CIwXwTAJbi4gw8+wwp0jl9IXMpOEz67xUFZ76EOEakICJoOA6X9eHoxxAavnP/fGq+iZATRyWLU/YES83aek7YMaZd4a38BKJKt5/ZQg7iBc/of/sLujbN4oQd9F5dfX1BxKedyomwV61CJg5QbFWwdgG9XAJOWXF5hzDioLa5m/94n2ln7wZfFe3pehEuG6NbbMtwbbIwKZ19Ih8CqGgI2FTsNFjRpeB68h+X+UWf+iFalPB+kwlHnR9SWScuYt8vj7Cjs5Xq7DUxVwIOWCyh798ZyJ8xCBmMe2/0LO35R3etYWj5Cmz5iswdX8mTE9S+vPDHuVIlycI2qYToJwgpe3XmO9XTIjt6JDq5Tkiqbn3YOqd5hvKdV+su7myYpk99eyACo9uGxNzH5BCVcOSltsY/eRIKSP6+yqRvtwDRd1yrRY/Tqt5W4KEVVc9s7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(10070799003)(18002099003)(22082099003)(261009223027099003)(921020)(56012099006)(10067099003)(4143699003)(261102123227099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk1yMlh1Q3RrazMweklHbXB4ZklxZ2E0WnNVTzZhd2U5T2JHSStYS28vY2lJ?=
 =?utf-8?B?MWttc2NoT0tMTGZMN0gyakpmU2xpZlkyWTU3RWdqZFZGU0Frekt4VnduSVBU?=
 =?utf-8?B?Z3ZBZWRUZWZKTjM1NFhJS05NWS9VK3NZUmlFdENIUnNDcnFsbVpIZ2RNNU9v?=
 =?utf-8?B?QThnUGJwV2xrZ3MxdjVrNllHclZDV0k3a3ZyQVRzZ1pZUnBReE95M01XeU9Q?=
 =?utf-8?B?WmNxK1AyYmJONlcwRDNRUzdrU1RUbkJCSlM5cGhuNllVY3NkUmJFcTg0UDdz?=
 =?utf-8?B?ZUFLdGY1RjFxOTU5OGdrYXptekxJbGdueE1PTVJxc0EraEFOR3NQWjQ3d0VP?=
 =?utf-8?B?b2kyQVpZQmtheG5GcE5sZ0h1VWdtbklsdkxqQWhFZW5USGF1M09wUHN3cU5W?=
 =?utf-8?B?cTNNOEdCVklJRy9wK1o5M3ZlU2tpNG4xTzZPNlZRSzc1MjBtNlhKd0tlcWlw?=
 =?utf-8?B?Z0FLbmg2WjNMTGd2aURrTW1ueTNyMXYyQjBoUGwxYllPdGRVa1AwV0t1NWpr?=
 =?utf-8?B?Q3JqN1JtbVdCV0l0R1FGbmtjdmdSOUdXSVduVmVYQTlXdVJjclM3dHp2bkRt?=
 =?utf-8?B?MStMRlVnVWIvMmU4QmtxZDZyZVRCaFBNdUlBUWVDbi9nUVJWa3E4bG85Q01Q?=
 =?utf-8?B?d0ZUV1lwVHZFL2tGdTVMOGZpekRSNlZyMzM1di96NytucGg3NTcvK21UeFFx?=
 =?utf-8?B?eFdwVkkyQWVxeG1mZEd5VmNpcW9MOGJORmM2NkJCZDNqR2F1ZS95Q2JLSmpD?=
 =?utf-8?B?MFFSWThTRmE3UVlSN2R1WVYrMVlFd1NGRnJZSlZSUURsWHJFV2F1N1VvYjV0?=
 =?utf-8?B?U0VjRU1LNzRCUGJkaytMT0tYcmpYMzRpb203NkszdnJWUXVkR1IxRk11b21U?=
 =?utf-8?B?YzNBc2ZLdlR2ak1RN1lkczlBWWNYV3dxQnFabWpiRmp0NEk4ZDJFTnNiODNW?=
 =?utf-8?B?QkdUNkl5RU1QRS9oemlZeXRtT1RhSWs2NHc3ZkxmQWpiQVVUQ0lKamJuZEdV?=
 =?utf-8?B?QmtCSXpuQzE2Q3U1VDFrejdNTG45NFlhRGViTzlKKzFZK2wxS2FsUFdyL2pI?=
 =?utf-8?B?OUREM3hnQ1dqckRDc2xHUDlJdjYyVGxNZ2dDOEtFTkdvQ3NUNHBpZ3Q1L21p?=
 =?utf-8?B?V3grRGRUVm44VjVJOVVRL1h5cnZvaFZ0QUQzWk11Zm40c0dZa1NtYUdjYStN?=
 =?utf-8?B?dHhXYURvengxcTg2eWxENE43aGxsRkJ1eFF0ZngxTW85eTZQcE93TmV5RzFY?=
 =?utf-8?B?a2Z0UW9yTWJWckxQY2NxQ2RMN0xRWTVyQ1VnaXEvKytIYXVVZjFHUi9iY3lO?=
 =?utf-8?B?bjIyWmpMOWUyeXNhTHhqM1Z0QVg5Y2s2ZTNCbUNtek5wa1kraFBaK1JYdWlP?=
 =?utf-8?B?dmpxbE1ZRTdTUWlrTUl5T0JSUXF0WDFCTXNydXJuT3dONDhmRWV0UVNwKzA4?=
 =?utf-8?B?N0x2RXl0RWFkemhNVWhKSHNnR1ZKVVVkcCt5RkUwMkNPYjdwcGt6c05FSkp0?=
 =?utf-8?B?cUNVSkcxdkh0MElrU1owZU5oZktabTdTOVhGZVpZMjJJZzR6WTg3b1JaU1FG?=
 =?utf-8?B?SDFDcUZhWENmSlkwV093R0FIQ3k4ZlVFUjBWYk81RXBuanlnVXRteU9HeHZT?=
 =?utf-8?B?aEdUNnl0NE1JUjIydDVUTEw5KzFpSE5vZHluNmNqTTFKVlRUQ3dwb2JMZTRn?=
 =?utf-8?B?TjlncGU2VnRiYnl2SEU1RVR5endFZkhXMjR6UmphcFZwVlJWVjdYVUgrTjRT?=
 =?utf-8?B?UmQ4SUVtby9IclBiUmpGVWxVMHpNL3RNTXpqdEUrSzNXWHVFYjJWb0o2TWE3?=
 =?utf-8?B?QU9hQXBRT1o3d0ZWU2xoMU9zelovN3FET3g5QlRRayt3VS9ndUh4bDh4d2Vr?=
 =?utf-8?B?MEJEVkVrU3Z4WDl1Y25IcUtYblBBNkQvZ0MwbjZGSEVLbGNWSXdwR0Y4RFNx?=
 =?utf-8?B?bVpjNytBZWFPaHVBaEVrUGdTeWNtcGxHZEJLT0Q3T2dDNmsxanJkeGpzMW9a?=
 =?utf-8?B?ZTB2UHc4QzQyQ2hKbzluLzBjQVg0aDVRR0lHcG9iaDg4UjlDcFB6cWtvOTlr?=
 =?utf-8?B?ZUFod1krVUh6TGNWbGxoNXJPU0cxQnlQWHdkSlJScXNscDBiT0NNS0p4ZEEz?=
 =?utf-8?B?REx3dnVvWU9UeURpR1NsZzJQK2VPR0cxa2lBb2NLQTlxNjY3L0NJUVhGR2Y4?=
 =?utf-8?B?TlN6aHlFcllMSnpJc21zOFRjbE1DOE44Tk5HNU9jM0xiMHgvUjNpOXROQVhS?=
 =?utf-8?B?ZDJZZE5hU0VzZmhleWNaZzR0cHAxTjZHYW90MWhxaHVLdWQ2U3NERjZXVE0z?=
 =?utf-8?B?R1ZRSHBMdTVjSlAweGtRODlRQ29YakcvYkEyTVJKdlZNMi9BVjlxZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 60821948-d811-418a-41c9-08df449f2404
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:37:20.6162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZRkgeqF5qbQCVxNSkevhusY/nAjgHitCh+TcTpFokXp+7PasqGQgDml1lD+5PQUuA/5SMzZxgdZehLf+aef7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7871

On Wed Nov 11, 2026 at 11:10 PM GMT, Andrew Davis wrote:
> The C function i2c_match_id() is slated for removal, remove use of this
> from Rust I2C by switching to bindings::i2c_get_match_data().
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>
> Well Sashiko suggested I take the easy way and just re-use a different C
> function instead of trying to open-code the loop in Rust. The C function
> implements the same lookup as i2c_id_info did so we can drop that out and
> its i2c_id_table helper. Still would like some help on checking if this
> is actually correct though..

We historically use open-coded matching in Rust as integer indices are used
instead of pointers, but we have cleaned it up since
https://lore.kernel.org/driver-core/20260629-id_info-v2-0-56fccbe9c5ef@gary=
guo.net
So open-coded logic should be all removable now.

Reviewed-by: Gary Guo <gary@garyguo.net>

>
> Thanks,
> Andrew
>
>  rust/kernel/i2c.rs | 39 +++++++--------------------------------
>  1 file changed, 7 insertions(+), 32 deletions(-)

