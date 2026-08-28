Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022142.outbound.protection.outlook.com [52.101.96.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0594D3CF209;
	Fri, 28 Aug 2026 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918665; cv=fail; b=urx23vuK8PZUjDsNddB9MsdILrU2Q/UmUx7C6CWN1P9RX9sfrgxMqdYlaZN+ogKNTDfcYj4zYG0mmBZ1b/97VHFclue/cc2qn0jUmrwF4f+22wECbz1GgmxQuGaiMLA3EojW2uXE/OF6rrwgO43pqcowIUBBM72fP+tW9GMd95Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918665; c=relaxed/simple;
	bh=0Mxs3b1LSOm7SkcojPuJ4JDu0c0Q/yb2SqaQW4YUmB0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=WDg4uCveKefN1AwlI2fgZHxgbqLd3dYN3oDFRwzm5i0EpudT1j7qroIMd1Bm6YqmnoSOfki+NQDyOsV3CQqHvHluOd0bYMivBxa4qpY+oedVyTwI6CwOwiXzlcq4j9a7tf0Udf0+GL3wokPoLbX5YldWhAgy1u7CdK8LTzcAViQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=McHVl2P1; arc=fail smtp.client-ip=52.101.96.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="McHVl2P1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K98HpAG6JnjVEb4xte+BnfwBqS72b/u0pZgcLTp70qn6g0cSl7tG3HCjsvubdDK0cbli7E37IM/uu3vKe6/bAC7d+vwsPPdKmyuNADqPQkVmJ+op+Pkc/+N0TotBO6q4w5tMvKT4N4k3eib6Jg/ch1Md63LMzMPjAxJxWkq8/Nps03q6bWsmvpe1Vy1jrY1rFvjUsBhJiMSm8gs4K1sesdVJmGUmo367YfjlT2IYqzHwNRXW7DGRE/hyhAzMD2mRrONUozKxCu8Hzke8l+rc/VhDuSXh5tcMzb+ZlDvWLCi7HR4Gy4rojw5M/YD4wkaGGY6D4ax3CptymqX+8trG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdQ+iYfaEYM9yiu2OzO9sZlu7Q4gvrbasoHgAC8Z3JI=;
 b=pGbGvwtXFFGHwp/1JvNvFdxf4WFELqPuDDyLJg00+MwheCFNOu/SzGRzdokHkxBg5g83kzGIJpLZ/V+5a/Csnx5qXZW0jN/X9lSBlFTEMRxUftIVPma+jXgFhGXmOJT3KMt4RNEGacxLNSFfaZ5ZVW0nB63CyCfm95EhxJj50BTYGRuahL2Dl2jEHOkk0cM067C9tfRas14xIzrVFpdGMS0rhwgZxrSPfrusWA0KWRanKU91gey9Kz6+P+CcCu0JX+QZ2L+b3roJG1SjGrVpH9LfouDn31S2i6j7iRvdkO5u66VkqqjPrWK+/9xueLj3sko3MhMHc0f6O3Uuo1Y8vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdQ+iYfaEYM9yiu2OzO9sZlu7Q4gvrbasoHgAC8Z3JI=;
 b=McHVl2P1M3cPV1emsPz2jjb4gvdFJUf+nTnJtyXdqH+TeQqpe3yfq2Xh4y47xZalhHnqVlImL5Hx4u9j/fbaYAMSIDaSKW1IZMLxx1m5qYas7ge6XOcWZjBoI2QIyS5m93rzxbOURfuW0FW8+UR/d3UEcKSb6aWENEgk93tKlW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by CWLP265MB1762.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:5d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 12:04:08 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 12:04:08 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/2] rust: num: add cv! macro to create values from
 constant expressions (alt)
Date: Fri, 28 Aug 2026 13:03:54 +0100
Message-Id: <20260828-cv-v1-0-694a695ff17f@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACp5kWoC/yWMQQ6CMBBFr0JmbWOphBCvYlxMh0HGaDWdQpoQ7
 m4ry/fz3t9AOQorXJsNIq+i8gkF2lMDNGN4sJGxMDjreju4wdBqkHC6dNaObU9QxG/kSfL/5HY
 /WBf/ZEq1rIZHZeMjBprr9JKwZBM4p/MbNXGEff8BAW36J4oAAAA=
X-Change-ID: 20260828-cv-acaf3400d16c
To: Alexandre Courbot <acourbot@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787918647; l=1068;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=0Mxs3b1LSOm7SkcojPuJ4JDu0c0Q/yb2SqaQW4YUmB0=;
 b=YMYTXgZUCXIJKN2f+rWdLVOLWQcmgvJ4HYjsy/B8dir1Y+chviH94KGnYYwjmm3DwTepha15N
 sGLe5xRZIurD9bhJO6mqbUVOToSVjJQzKjyDOGBQQcqqyZpZ4ky5GZQ
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO3P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::7) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|CWLP265MB1762:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c65d3f-9abc-4271-e2f1-08df04fc76a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10070799003|10067099003|56012099006|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	DGaY47oUjWxvBlaVaTVkW5Mc5g3WvFa8yhfQGdBpxo3ywuRyY0fA5HeIsI9g9ICfrRxb9336swCaIGFu3E8PxhWWBHPm1H32VePaCVNi00VfkROZVfScSbW8CvBSZsgyMNmjbIWz2W7Ze0h3RC1VLQIBrZphWFAOy5YfxakT5OrRIdVvT6NMtRVDPAxbNKMgHC9J00uCkGOfHmHQPMimfPZzJdoQdQWsUuMB8jfJ81hzzCj4bsE5D5yEFIHDAPM5sYovv8UarCWXZmQX0D/JxX3gDwTh/SiaglfgKpZEhv8O/Yo8BuyPiE/eWexjw++lDZN9Y0yiN3B6WMmwgOZqC3qcKfGknrDceRn3EnERAYNFurEL5ZpLGUOkj9W43SapzkNTayV6PZiu4B7V13FZRKfK9sfJI/CB+twKpjyO+xv6Tb2mqA69Xr7HkXkrc3F7pM67hMiqywm68A+c2BebfvGRtVvfomPfNYhv2/LQ//geC4BNAbDVa9keAhRCtQra1ayQR0QdPjFiejWMzKm4IhshJ7NaATA8Q0fN/arkoAeDUU/fpTL+gecONK3NYx3iLxBA7cBAkYUc/X+8bXU8Se6h9FAzcSTKf/nQkQYNBSABuk6LcgVz4rfdqvN1WICEGnBBEg5KcHF6dtI+cmLxOsgYZ7TuL6V4X4V7LDxvzn4f6Go8nywhXhmb0F+qAtRoHCtaj5h0EVWpKlYcHmoHeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10070799003)(10067099003)(56012099006)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVhIOWxJSHZJSTZCdk9yeHhUWWlxeTRKcU9yd1VsUjFyQnFSNTVzUjdhcXBq?=
 =?utf-8?B?dkZuZHZPMVRwNEtwanRqVGtQdk9vMkpnT29zY1NBQWpzN3VnbjhFRDBzR2xQ?=
 =?utf-8?B?Ylp3cDdtaU5WYnFvRXhnNFdhcU9Oczl1U3BVbVVsQnp6L1V5WFV6WFZPVXd2?=
 =?utf-8?B?VDgzZG1ZZm1rbTFuTzl3LzB6RDA2bm8wMUdpeklnR1dKamJRWk8yZDhNTUt2?=
 =?utf-8?B?VHB0U0pvbEgwT0lHcjg5NUx1QjlkaVpQKzBVMEY4blY0dG90RGJzZjdTWmxr?=
 =?utf-8?B?RTV6UTJQY1JUSEVicExZeUFTOW8wajg1NFZRVzZxWjdVOU5YWDhTM2MyZHpJ?=
 =?utf-8?B?ZzFoc3Z6MCtPU1ZtbHFKMC9RaWExM3I5RWpOV3pPRVlSMWFqclluU3NURk5o?=
 =?utf-8?B?OHZ6aUUxd0dxbWhyZlZER25CVVJOMWxzRlhBb2l6Q1h1M1BlMWNrNmNsb25N?=
 =?utf-8?B?T2ZRU1RMZm5JaGVZQVpUbURBbFpqUzRxWlpuMWNsVmtVclM2eHBoOURYK2xy?=
 =?utf-8?B?dDdaV3l6L2hVZEJjRnUzWTZzUDBDejhqYmwrR2E0SnQvZUNZQWRtZ0M1MVFF?=
 =?utf-8?B?SXFUWlpEVmZzQUdqeWhiWFJ6d3hyamE2UkZWaDJkOG9iWmZHOUdPRXZIWnk3?=
 =?utf-8?B?MDlTMk8wUUdIRkpFQmdTd2tjaC9DSUlPWnNXMUJmMURHRjJEYVJFdnlBSFJa?=
 =?utf-8?B?elhndFpaWWN1QUt1OTNvMm1xSXNMa1o5aEFHeFo1RlJ6U2FIeHdnTFpPaUVJ?=
 =?utf-8?B?UFRKWG42VzlsSzZiUUo0RklFdG5rejhnbmpnN0VPQnVBZVkyR3l6MEV3c1RY?=
 =?utf-8?B?NDFMMXhFYmllN25COEVUa3BJNEIwTkMzTE1qMVdzY3ozYU9YaDd6RTRHVEFI?=
 =?utf-8?B?eWxFS3NGVWVWajRBVnFMcXpCVWplbzdMODJ2QTc1WmJEVTZTeTBiZnBSZE9G?=
 =?utf-8?B?N01acnc1UDJQTUQ2OUYyRlVxSThXc2RIQmpub1ovS3N2ZlR6emh4Si9qN2kv?=
 =?utf-8?B?WWZXdTVuMDE2bUNWMlZXQXBYQm9WMFd5Y2djcURIVzdoTTNkUEk3a2h0Ulpt?=
 =?utf-8?B?MElJQWtOd0F2MFJHZkRNSGQrNFlsY2dyRkZOalRnbDErV0xGeEtvSGYxZWZL?=
 =?utf-8?B?YTNwZkQxT2pXSDdqSzhtYkVaUTluMEkyeHFMcTJDYzQxcEozcHR4NG9kR2VJ?=
 =?utf-8?B?eWJPeFdsZVd1SGw5ZjNiTGZSNmRJOWVvUjdNSitMOVFka0h0V0xDL0VwQkYx?=
 =?utf-8?B?SnBHNjdmcGhtNTE3U1VmRlg5eFN3ZlgzL290dzJpVWtQY0JqWXEydW1GMDlH?=
 =?utf-8?B?WE9udU5BU2ZkdHowY3BpdWhHTWxvT3ZPWFdUMmJGa0htanA2dVppd3RWczNv?=
 =?utf-8?B?dEtHUFY4NW5WMlNXaVFORkl1T05vcFV6RHB6RVlSSHdiRnRBeWJwTHhEN3pU?=
 =?utf-8?B?SUdjdGc1TmhPMS92WENxTnB2TzBwS2VsbVFCVy9nM0M4YThwT3BuSFpENGFn?=
 =?utf-8?B?ejRTSmZ4R1NkUW5lVDhpREJYd0pPaXRIeG5kNnE1SjlGdlVYdDlKcElZN3pw?=
 =?utf-8?B?Q0dFZ2NkK2R2emFuOHJMcGJzZDlSS29DOHIrczdXUEE2WHFRNkxZUjFHYjQ2?=
 =?utf-8?B?Z096SXNIeXQyOWpUd2hMMWJJSTJSeVRielhiSUhsZGx5UDlNRVdtRzdKdjkz?=
 =?utf-8?B?QUorMEZaQTRWcGV0ZXozblVnbWZUN2lXUVRBeElXczFKa2g4Wmc1M0pSeXZq?=
 =?utf-8?B?ckx5b1FiczVlanpxRGxsd2V0ZmRPWCtvTll3cUQvZ1JmVlphZVA3RG5VcjVv?=
 =?utf-8?B?VmEvRHhUa0RqR2RRbzdHQ3V2Z0VKeUJoUVQvSUF3cUFsY0FBNWlGcUxqeWh2?=
 =?utf-8?B?YkJqYTZwbUdRYm9pTk9YWFc4WEYxei9YOXp2MHpuZGl6TnpMWnovb1NQaVBJ?=
 =?utf-8?B?WW5UcW1PWXNudGgzcEZsVS9UTjB6MG93dlVoaStIaEZPMWNIT0lyNUNnWG54?=
 =?utf-8?B?amlJR1pJRUNTNEozUXJ5MGxTcXFCUW9OTFVNMTJOazZPZElYVFVjcGgvOTRT?=
 =?utf-8?B?M3dncHoxYjRWMnFKa25RYXRLSnVtOVpwOEt1WmhNNU1VSllJTjBzeXdrL2hs?=
 =?utf-8?B?MGFFMWpMbnhKcWQybCtnT0drYUFDYzJSb0gwWk5NYUNwSm9hQ0RIaEpvSm9s?=
 =?utf-8?B?cFJCL0RUOU5xdEhXUUdPZTNOOEpBRVNwN1V2SUNYN2dtZW81RmdhSVpwak9T?=
 =?utf-8?B?VU1ZejdOemRkTEhPR2Jkd2pXQVdNdTNEMkpUcmJlRVp6eGpKRGVCRS9zdGZp?=
 =?utf-8?B?SXdtN09UOXY2bnhTcmh0VUJQUllpN0RrVHMzOFdVM21LZnozSU9LQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c65d3f-9abc-4271-e2f1-08df04fc76a0
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 12:04:07.9834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjjbIlqpl3awUjbRXdrBa8oz8EXqtB7fjy3j8zf3eg9uo3Ke5ewZBFHSdHk8S4BOLz5uaRdQSdAyqbyRR9c9nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1762

This is an alternative to
https://lore.kernel.org/rust-for-linux/20260828-cv-v1-0-48a180dfc4c8@nvidia.com/
and
https://lore.kernel.org/rust-for-linux/20260827-chid-v8-3-bc74c77d0214@nvidia.com
without const generic expressions limitation.

Please see the detailed description in patch 2.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (2):
      rust: build_assert: add utility to require const eval
      rust: num: add `cv!` macro to create values from constant expressions

 rust/build_error.rs         |   7 ++
 rust/kernel/build_assert.rs |   9 +-
 rust/kernel/device_id.rs    |   4 +
 rust/kernel/num.rs          | 209 +++++++++++++++++++++++++++++++++++++++++++-
 rust/kernel/num/bounded.rs  |  21 +++++
 rust/kernel/ptr.rs          |  21 ++++-
 rust/macros/const_eval.rs   |  24 +++++
 rust/macros/lib.rs          |  21 +++++
 8 files changed, 313 insertions(+), 3 deletions(-)
---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260828-cv-acaf3400d16c

Best regards,
--  
Gary Guo <gary@garyguo.net>

