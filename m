Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.126
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795706405;
	b=3yH7nk3PlHG/DRKyM7y/iSOWCQz3huVsJQ030vbdhP7s+KxWiW3pH/W3HAnV/Z6Uxixj
	 OCsY+nhLsYE8g590ScrCFx4yVTArkjj6p9Y1L1BFKsfkZ9Waidc2M6nYhCQnhO1pb7QA0
	 IZYDUokjPVZmhhVjs6Dx230YI7ShUuid472lONfPVhbsopspthUOotQ4ZewAHRyCuwHB2
	 rhnRHsIzDvGWiHnycmUy2imt0ZpLHWSGpVHiDlJCfNjJXe+qSmJRSNXtQAc4jV4/0QL9P
	 eIeXQulUXC4FgxwB98y7ijR3pkFRt2p1JXx774v51tWr2817FWAUnv/yknv8uBpLfBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706405;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Q2pGPQd1H8sRfiylTHehU9y4/kuXQOD2xg3xiFZ3iFk=;
	b=C4IbGg364Rsoa7623zVjTAL9dfNMm+wBnHHXk31JW08ps2Ogw1U7PHxlrdBVoORPB629
	 hdhhJhV7Hl5jUj1Qn21xn3OdXoxQ8t5AhSY5rd4dlVkNMgZJna3wL1UrVysRXSyEXaYO3
	 XU1xCkzVAAjJptSPIF2X9TB1RQmP0pYT4hSRgDB+P3oV6QDXznlKIQAmhfE8mtRQMf92j
	 vPNiBRTUKB3P9Ji++++0OYi1JQBPhKyPu/Cxc/xYI1o6/bU+GJNNAB1WSPeU9MXMq/Uuo
	 KDhgDM54/7ODIOWPeONgUMgGpgxPWPgBi/rCcwpCqoZ9OUfGkn+fZ5S4K9TPWSvDaHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=utuiRmuj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.126
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021126.outbound.protection.outlook.com [52.101.95.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA60606A321
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 15:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA60606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=utuiRmuj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sm+myoIaTu43mg+jvr9KQoSx36lwM5Wc6/Mvqq2i8WnzJYRPrh65SfOptZvas93hxWVEWIB0Ag7b/GYMyBHGf4QGGXDiH/QIkqk+q6BipCefIUysRId635pgJI+t1T7Q2f7rvdbLjpurj1/P/8cgFEvXO2EuXOdNrg1w2NcyoJhzMgcvb4DBgoX+pvVhWabNwsqwiAKL7DiVx2jK7W03U2dpzF3NH+XLsIEzT+ddbqGnzWXKcbO87zD+EPes94gG7KDy3GM6Sbfyl3I43VYT6ufLFfIcMoj6A+60RsJ2LtBKPrE3eKRjVVbKD/xQxGYXSo+RHa6nXT+4XVGEsZ2QMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2pGPQd1H8sRfiylTHehU9y4/kuXQOD2xg3xiFZ3iFk=;
 b=ZFjG836ck2A2K5ENXNuGYsiM0TF1yfr1gBZQ48gqn4Qz/0yqcvUt2OvCMtBlZdq6CKBkAXa1DH2c4xD6jvLCEicefENol3yAwR0DxP3ZZwZafzuMtZz5yfDUozm03djjqhBs9WVUqpY4FHCf19LpE3U513bBVfVoibC0GjPrEfjwJbwd5UnbMedksi6vUfYzhtnkhBhzGwQsFs2Izm/PsvCJd9Y4Vwie+4A5uUtSwTjd6PPqa8WM1RoLx7EdjqTNbTc8jUSZs6dGWqqTej1SuzSrKBzPp/dD+qAzPaEGTUjFyQSGgk96Tg3CwvjqisPbzdQ7TdcIA/4EU2tJizgJXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2pGPQd1H8sRfiylTHehU9y4/kuXQOD2xg3xiFZ3iFk=;
 b=utuiRmujxiM/7xDoHMov2Yi+aihXIqqgidTGLHxChgs2q+ppR/mT+XQwAKNv64YPojFufN4nYjR/Zq3xZ9ogx+pTcEPbD/3wY2bqMjfJ9xQjvTaK+4fIviIV+iKOtC7jfXu9uWQ5RAkT+EbS1dUGltjHItavbAYcwqvQSj0cxj0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LO0P265MB9145.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:19:59 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:19:59 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 26 Nov 2026 15:19:57 +0000
Subject: [PATCH] rust: macros: drop underscores from `#[optional]` methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-dev-optional-v1-1-9e8d3a807d9b@garyguo.net>
X-B4-Tracking: v=1; b=H4sIABxOCGsC/yWMQQrCMBBFr1Jm7WAaMIJXEReT6WhHalqStARK7
 26iy/d5/+2QJKokuHU7RNk06Rwq9KcOeKTwEtShMlhjXd9bh4NsOC+5ajThxZBnexXjmKFelih
 PLb/c/fHntPq3cG6NZnhKgj5S4LFNk4a1YJCSzx9KWSIcxxcRx26RlAAAAA==
X-Change-ID: 20261126-dev-optional-50abc27e06cc
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795706399; l=3418;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=SjHou+frrJgGG+tt4KEwGOBk/7cWsoO3tAvBlTsctRI=;
 b=BuFEMzF2D9YAyDOW4Q5u3b5GfbiCCk09qP2Gjybtc6SGIax9CQwlv6uzsd5/mtNAR11L1Kc6X
 D8qkBiweC2tCtX1aguOzt/Cc9kPbIqQoh4QulOVedXJwHr/D6eVrn6Q
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0158.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::19) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LO0P265MB9145:EE_
X-MS-Office365-Filtering-Correlation-Id: df6f67eb-e3c9-4740-9d37-08df4bd0bc4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|23010399003|921020|261021121427099003|10067099003|56012099006|261026140227099003|261102123227099003|261028144727099003|261026121527099003|261022105027099003|261021123027099003|261009223027099003|18002099003|3023799007|4133799003;
X-Microsoft-Antispam-Message-Info:
	R3YykexMv+xTzi0H9cyDU7BvWZNbIo7OhDB7FiOq2WrfIQQF0yiYIHQgdYD18ePsT/qlFOQBkMQS6x84kZVfUQW1NGH3YR8x1kHVWxqmo0BSWlpe4E1kk8TkaXfI0ZEFcqrNgiwd/2GW27lStJeiuuySixZ2mkaHxlkwOzJ1Wn+OrEwcTL6h1zDj27jyUYEZQsQfMANEjl4jBD6dNQr83p4KXoCzYR6sql85Z6aRJCO/vtSS7e410saQehWjks4aCFWbnAOoSEakIaZ5mBepAz9WHXraBdX7EkQYCkGtRu/xi4oWXVZ90EkgkBcGfLAC9rbiqjaVurH26gZbuoEWuXEXo5s4AVVBXKhsvS88Jb6cURFMoAkft9gI7sRgSmdJpBMF6aRa7/UHUk1RgANElaPkHk9/TEpNSiGz4heHppE4aP1ohcRJB4AH66CkLa8L18DZUFytYuHQMYMcRGpdCHOCo2j6Her26T5ZOlakOR4mTJ6qG+kGq6SF5yDA+JPdDvPQV0Xg23/VFZUHFWrNJW+dnA23eja5hZjaSRQpOoP8ERrLtSi++SAokAg1HX+EpCOuNS5cVVeSxNwlp6pKYEsxZdu/7erMHHMEpnrVbblMYaoIymiWoJi3PvyDxV2lTE35FjXKl/uPYDLeLFjGS4xYScJhUwqQmH5KyeviK1c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(23010399003)(921020)(261021121427099003)(10067099003)(56012099006)(261026140227099003)(261102123227099003)(261028144727099003)(261026121527099003)(261022105027099003)(261021123027099003)(261009223027099003)(18002099003)(3023799007)(4133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkVRWkFkSWp2SUZNWEZLbkxISkEyancvWlBSZzNWQXlmZmZMbkMzaFRyRWxT?=
 =?utf-8?B?VTV6RTBpM21BSGM1MklmUlErVFl0Y3gya1I4YXdqNTcrdlBlektEeWtQL1JV?=
 =?utf-8?B?d2xkUHJVTTJ3MWdPWFZrdTVEVlRCSURZaXhmbkNpVk1aeWlvMEc0VzNpdU9P?=
 =?utf-8?B?ejJQUHFOTk5ja3EwQzhoU3d2QkNsaitjNytIaDRoMStvS2gyMCt3eXV3NWF6?=
 =?utf-8?B?Nk1rN2EyU1VKVEk4dzdBcjYwZGY0Nkpib2s0bzlLRk9kYlJTUUR4UkNHcmR2?=
 =?utf-8?B?d3dSSkE3RE5IeU15a2FtR29oQWdjS2kxakFOS2NXOVVxMVF1OXJnN2VPVHdh?=
 =?utf-8?B?bmxLdzBoMUlhVkNleGJrbzUyT0xqa3VEYTh1RnUveUFMTlVpZ1k2WDBJQi9O?=
 =?utf-8?B?dmJhNlBXUkwzelIxamQ4cG9BM1B6ek9pQmMzSnN4dVJXWlYwY0trYXE5MHA1?=
 =?utf-8?B?SUIxUU9pbzBYL3pEelZwazB6eUlZUyswbDFjVkFIUkVVbkdCc213RGVSWXRF?=
 =?utf-8?B?V0E2ZDNVTDM2ZnQ5Z3NXc3ZPcWhSb245ejk5WjRndmdxaG1DN25pL3gyTHlq?=
 =?utf-8?B?NWZBNFE0Y1J2MU43RUVkVjUyUUdnNFFGREhoYWZ2T0F3cEczR2I2dUlQU3JT?=
 =?utf-8?B?QnZ0eUgzekpCcXRaMjdnNXMyRWxMczlvalhzdmp0TlNnRWpkRGJ4a0Zmblpv?=
 =?utf-8?B?RWN3Vm5VaDc5QmMvNldiM28vZkp0bHRwaXE1aGNpc1VXbEVBTnpNRVV5UU1G?=
 =?utf-8?B?ZUxLaTcwWVdOMU15YVE5WkRERVNQdU43cHdPZ2ltcEhGWFZLOFdiYWNmbjBR?=
 =?utf-8?B?bG1SMEJ6Q2VwSzNIUTNCdzNiMGoxYjJ3VEdTbVBtVXdFVFRjc3dnWHU2YnJE?=
 =?utf-8?B?N2tXMHdmZWlyTUU4UElaRGwxcWN2SFlNS3NWWFlHYVEwNUZXZTVzUU42MUNF?=
 =?utf-8?B?MlljUFFwT0NRY1dJTDFYVW9VUEgzR0xIS2JOcG81R3VLUWk2SkRsOTFXZHJz?=
 =?utf-8?B?Uzdtb0dMa2VObnJzbkRGZ3pVM2R4TVczYnNiU1liU3lFSnl1RWd3QXhqV3Bs?=
 =?utf-8?B?SGdmSnBKVTg1eWpvMzQxUFhBb0FmWUFKZzZPYWt5STM1SzdhT283YmtZSEpF?=
 =?utf-8?B?RUx2bWlwOVFhb3BhM1NKT0FyRWdLWVE3ZjJseW9pSFV1UGg3MnVLNVB5NEFF?=
 =?utf-8?B?WTJYMFFtMmJUdk1lT013a05TbzUxakJza000S3Y0bHVwOEZkbW1yVmR6bEVU?=
 =?utf-8?B?c29zVngvWkszdmVPRzN2Vm1mZWRacE5oVnlnc25pazN5QlE2ZVFWVUlkSmh6?=
 =?utf-8?B?Z0FhaW5sU1JSZDFYZTdDOTlTbFhUZllXeW9CUGlDUkIzVUMyVlZPTjVDd3hG?=
 =?utf-8?B?YXNwYUd1N0x1Tlhvd2hacHFaUDRlSy9QV1U1NmtXYVgvZ0dXbWF0bUFHdkFi?=
 =?utf-8?B?ckxqMjJMa0N0VHUwTTJ5eHVQVUVSd0NqeDVWbkE5QU1yY0paOEljd1BkeDRR?=
 =?utf-8?B?Z0VjaWx4K0xmb3E5SWpQVGdiTW4rTFNYS0tBdFk4Vnh3RXZtMlN2Z0Rsclgz?=
 =?utf-8?B?bEtiZHJRdkF4ekxPeTNCV3ovWjdlK0h1UTlObVNiRWpuY2REc0lyMlFZZGk3?=
 =?utf-8?B?RGlva1VqSExKM0g4bUw5NFZJRng2RU1hdU83Zk02ME5BM1B4SGZubi9naGsw?=
 =?utf-8?B?TEdDU2NRNjlOUHFKL0tmSWpzNGtTR1BSZkF5UExXTU1aSkhKUFkxZUZWUEFx?=
 =?utf-8?B?K2FDTkloZElKOW1kNGFFa09sUXJKOFF5QXRPMGg1SEpvVFMzc3EwWFNtaEh4?=
 =?utf-8?B?VFhac21CbUVWeDQ1aExNOWcyK2w0SDhkWWwrN21TYmd4YUJiREZ2QXg1TXJh?=
 =?utf-8?B?Rm1tL1I4SHVvQ3UraXhET0ZjMG9yaUZCeTdhaTlkd0VJLzBoSFZNdTg4YzFH?=
 =?utf-8?B?WXhjdlBlZDNkUXl0Q3dIc1dUSEFWaW1Zck0yVGVIZWM1cGJTMTJCeVI2SGph?=
 =?utf-8?B?Y2JMUVRlajl6NE5GUVZXQW9md29ZNjlOSi9SVkFiS1RseUwxOXJDVDBacVlw?=
 =?utf-8?B?MzVPMzlnMDZrMkR2d3JDWHloSnFzTFphMlNnYlZ5aXRaOXdTUkpJcmdrNXpo?=
 =?utf-8?B?ZmhWTGFubFc5NGtuMGZPYkFyTUduMkNJUEFRNlFHY0NVQWdFNDJoOTNlYXhN?=
 =?utf-8?B?Rk1OblIrNzFEaXVWR25BaUtPTEZFWjJxeGM1MHNGaEtXZ0praVpKVkx5VW1R?=
 =?utf-8?B?RGcvTklVc2FiUWVFa0JPaWM3Sk9hNi9QYXY0VzNSNnozVWlHaFhsb2VmSUxE?=
 =?utf-8?B?dnYvV0FFWVF3SEdqNTVVY2NBbGZTMEVlU3ROK3VQMEdwSEdiNC9LQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: df6f67eb-e3c9-4740-9d37-08df4bd0bc4f
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:19:59.5787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EeSpNY3ED4+L/ZA69O8m7OqmJ4zmzxhjw1FaKi+M2BGX5KIEMkMt5/y7kjSWbCeV5+G9eh4iAvGpz2fIL58poQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB9145

In the `vtable` macro, `#[optional]` methods do not have a body, so they
should not require underscore-prefixing the function parameters just like
mandatory trait methods. Add `#[allow(unused_variables)]` to make
underscore unnecessary and drop the prefix from existing users.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/CANiq72neqitKHftQ9UVJaKLkcUdX8uAWLtoE08-G784mqX+H9w@mail.gmail.com/
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/miscdevice.rs | 24 ++++++++++--------------
 rust/macros/vtable.rs     |  2 ++
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 900676ea6bbc..8e9ecb3b72c2 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -179,18 +179,18 @@ fn release(device: Self::File, _file: &File) {
     /// `vma`.
     #[optional]
     fn mmap(
-        _device: <Self::File as ForeignOwnable>::Borrowed<'_>,
-        _file: &File,
-        _vma: &VmaNew,
+        device: <Self::File as ForeignOwnable>::Borrowed<'_>,
+        file: &File,
+        vma: &VmaNew,
     ) -> Result;
 
     /// Read from this miscdevice.
     #[optional]
-    fn read_iter(_kiocb: Kiocb<'_, Self::File>, _iov: &mut IovIterDest<'_>) -> Result<usize>;
+    fn read_iter(kiocb: Kiocb<'_, Self::File>, iov: &mut IovIterDest<'_>) -> Result<usize>;
 
     /// Write to this miscdevice.
     #[optional]
-    fn write_iter(_kiocb: Kiocb<'_, Self::File>, _iov: &mut IovIterSource<'_>) -> Result<usize>;
+    fn write_iter(kiocb: Kiocb<'_, Self::File>, iov: &mut IovIterSource<'_>) -> Result<usize>;
 
     /// Handler for ioctls.
     ///
@@ -199,10 +199,10 @@ fn mmap(
     /// [`kernel::ioctl`]: mod@crate::ioctl
     #[optional]
     fn ioctl(
-        _device: <Self::File as ForeignOwnable>::Borrowed<'_>,
-        _file: &File,
-        _cmd: u32,
-        _arg: usize,
+        device: <Self::File as ForeignOwnable>::Borrowed<'_>,
+        file: &File,
+        cmd: u32,
+        arg: usize,
     ) -> Result<isize>;
 
     /// Handler for ioctls.
@@ -223,11 +223,7 @@ fn compat_ioctl(
 
     /// Show info for this fd.
     #[optional]
-    fn show_fdinfo(
-        _device: <Self::File as ForeignOwnable>::Borrowed<'_>,
-        _m: &SeqFile,
-        _file: &File,
-    );
+    fn show_fdinfo(device: <Self::File as ForeignOwnable>::Borrowed<'_>, m: &SeqFile, file: &File);
 }
 
 /// A vtable for the file operations of a Rust miscdevice.
diff --git a/rust/macros/vtable.rs b/rust/macros/vtable.rs
index 981ad2e49647..aa41cb2f3ba9 100644
--- a/rust/macros/vtable.rs
+++ b/rust/macros/vtable.rs
@@ -79,6 +79,8 @@ fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
                 }));
                 // Ensure that the function is never code generated unless used.
                 fn_item.attrs.push(parse_quote!(#[inline]));
+                // Injected default implementation does not use function parameters.
+                fn_item.attrs.push(parse_quote!(#[allow(unused_variables)]));
             }
 
             // We don't know on the implementation-site whether a method is required or provided

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261126-dev-optional-50abc27e06cc

Best regards,
--  
Gary Guo <gary@garyguo.net>

