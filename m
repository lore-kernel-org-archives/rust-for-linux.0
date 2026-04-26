Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CF5208D0;
	Sun, 26 Apr 2026 04:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777176347; cv=fail; b=K+aesHkiT6iw5lylitIOBS2+M0wMdJfHEqcBu/E3ZsOJrWixVPj9b1hytiqUQwGnnQZzT1UwjKS+wqDwOGBlow1T3hOPGc+Cs3KoWXmJv9OSMpp8R1G56sFBbNkIc7MDMugEtejrTY9rq8e5Mywexr5HIwyi3ZP1ZDK+TaJS8ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777176347; c=relaxed/simple;
	bh=/v3aBWpEPpa6QEdUFyHKvboM7wgzjJjvGISkCDdsQbQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BoqsGv3If/TkhFHfrN90epKPsPsGwvXMPkYLVn/U1z/1nxBDlOxgvttS2SdzizZzzXgQaDx9gFr0hiqKDpg/I6RhZVGxGRklBXid9F7bW2HIxCrbGjI/D+rjijC7IbPuIaAyWqpNspkxR6VET+4zLBuHdf371DgB/w3dI1KIs20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uNa2S6BV; arc=fail smtp.client-ip=52.101.43.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uNa2S6BV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6jnHWItNlY7uu6PhwFEvQ/L3CBiuh5JIyQ0CjYZ+Khea1vu52Jd3ISrGHY40Upbq8W+7pjPnGhnWPOSszqPWj555OBd8PTs2d6dui3gS68llfG7Dafn++xBtVx0OsoidgxoVYeN2+sNHxE65qMCWzsqvUKS7wNAbPlw3N/gGYFgcyllOUeN4+YiO5E8p0ltx+Za3ffVLZW9ElfclreC47f0/cMgkLBkS7kuCKVxJe0x+/V8wyfqfMK1Rk4n5imeN9LPwwroeAQoLG/bivesrNDff+yf9DiDVm7lsQWLTzTKcBJNyAyZ13JYoP8rExA/OSZL2HWWTwAZ0WWp5tR4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/v3aBWpEPpa6QEdUFyHKvboM7wgzjJjvGISkCDdsQbQ=;
 b=FcFajqFfVwVfR0HoGYODYkqm4dTNDcT2dU3H5vWE4bO43LnjapDjz90DzLNTMeV4GxoSZeEXgbBrVgd55qxEcZwKhm4J+z0bGPlaZ6b3aIiCoRo5+grOmdEI7CE1DOcvVwfN/lFXn+Gg/fueuim1Gc5cz3pRlxe/wp6UoT/EAKtyIf0yNNIneyUoEsZbCKa5v2+T1w53yMjHQB8Xq1yrob8Odcp2s6jLwN18lpeji1QEh0QZogoqyzjOiqAHrDh+U7rq7u6coEs6sqKk6K+oVHIms7WIE9L2+FQL1O4W58fgvuYYW4nD85bp4bnCwclmZ8jwal/YsvBwxUOU5QHDFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/v3aBWpEPpa6QEdUFyHKvboM7wgzjJjvGISkCDdsQbQ=;
 b=uNa2S6BVQtDzG6X4VDRoLaopF5Xcn5loyUhJa1jZQjfqdtcry1NjW51nBToUMP0s2txz/NZ/xVNSA/oWoQ0LKdwUm+5xuyZKA0BOB0o+0z9QXtNSWmrRpfAhG+fK2xnz70GwBcUZ7X2f+S1P6w6at6NlvlwJ2ii9gBfBFtioC4PE0xJHmI7TGYwMrcOC9TeNrH4BJd5E4bZ1QzcahKNSoZ94bcu7tAXFnOzkxPk/mIGDkgCFDZOqvGdivzjg8TLkbx83FbraFGNv9fqZ45VsUZWmEnTdlp/+90Dk5beJzxUnl8P+1Tq5EBJIvjkfQtPkzvqHU02P5PY40Qr4lEwVKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6002.namprd12.prod.outlook.com (2603:10b6:208:37e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.13; Sun, 26 Apr
 2026 04:05:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.012; Sun, 26 Apr 2026
 04:05:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Apr 2026 13:05:36 +0900
Message-Id: <DI2SFMAZZBUI.3W0BML3IG81Y8@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Vlastimil Babka" <vbabka@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: add doc test for `Vec::from_elem`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Hsiu Che Yu" <yu.whisper.personal@gmail.com>
References: <20260426-doctest-alloc-kvec-from_elem-v1-1-e364341a759b@gmail.com>
In-Reply-To: <20260426-doctest-alloc-kvec-from_elem-v1-1-e364341a759b@gmail.com>
X-ClientProxiedBy: TYCP286CA0309.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f697065-52a7-4ca6-43a9-08dea34914ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+Tyq/+zTwCX/vCtSCQ478c77Sao4e5BbQ+hpV66eIHBlwVeRkFEl4cV1Iv49NwtHyDzT8X6P/R26AGAvQf6zbw0v62F0rak+gF+iQNgjY9w4wGi1QbzfG6hhVwwFlFRxHXRz1A7PTFjQp2DmsJ3FHS/JmHIn8Xcv7F2+IDnq+KC3BD5zXvR1z67yTUExXZEcJhdfbsrOcJdeJMpXeQRUgjKzhpXIpr0sS4iHeh/l5hilSbPxE5LoLB6rJFO/TfE9r2yG74B3iqUqqG04cN5zAjPJ7v94fCuustpfX2hZjRKoteNEIATbsftyzZqPnh+en+NDFDGaOdHqxvYAC+LpFZHBGlmAhSIU4OWZy8aXCFkfrDIwgmfjbObCRwyFuHDC0W5o5WGNO624KU5xAJ9Fyw0/7Jr6QEQ+kZA1JoQUsAmZtY3YDWOFDTNRO4u54x4udgRorEQzS+oi7HFK4Qt3GnzkmOu5Pq0Dtp1l/CN6K6isd+oLpqwuyGaM+SKLhQEZQQh8YDYUZjigKZEI3PZHbNe8ATWRaNto/nXHvRAGtAionQ81BarN5XAt1rztze8YEeyLWmmP7EYo399pmZJ+inH/eoK+BmyHLsNOC1Iw9IWfWCFkBKdmYwFF3/1WdPxF9BaLi2HhdWSFdp7IvoZRJ6KHxbBtSzL1LjlVnTGf+l0n6mZSbzC3VLJXec0yzeRhOOHmEobvth7LLRwWWjvVE/jMOsOioXM/rDB0ta7DTaY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2JuYjd6L1Rnck9KR2Z3MCt0em1wc0Z1YjJsSXJCeWpyeWtQUDk4YkRPVG5S?=
 =?utf-8?B?a3IvVE1WSkpWbHFYQklWTnBDOHRYMW5zMUovYjNUZUQzakNabXkyWUdWbzFM?=
 =?utf-8?B?TlNSMmdRVkZRbWRyS3JTcEpIYzV2aFJNakJqK3pmOUtyV1hubW9VYTVsaWJh?=
 =?utf-8?B?dmg0R0grUXV3VEV5SW80SGdlb0MyTGhqSDhydk1ldGFLd2J6dFQ0K2pWbGV2?=
 =?utf-8?B?ZXpqOXdhUTl1ZXJhUHQyYXdvZS9vMk5WelhtcG5HaXFkNTlHVmpIREpLS3pR?=
 =?utf-8?B?M2dNa09RQ2hVdWlibjVudndVRFJRODkwK3UyVlVyQVlLTFNxWncvQ09jOUlu?=
 =?utf-8?B?TUd2UGZOeGhnN1NETTEwa1FmVEx6R1dPRGo3S21wcEx5YkxXNktHWkRTZlNN?=
 =?utf-8?B?OXlGeTBDaFY3L0hib0t3Nng5ajJ3Z1JwZnI4V1pZLytWUFVMZnlhZ0oxYkww?=
 =?utf-8?B?WlAydHY5YTFRaEFjcXd6OGVKOWx1UnQ2aVp1TXNqMUZQd0ZVZkd1LzZBK3Zw?=
 =?utf-8?B?RUV0NEhnZ2xXYlVRVitqSytGUkhkLy9uM2FoaGYwUzdYQUc2bFZXM2VtQXVT?=
 =?utf-8?B?SDE4Z0UwVzZqUVZKaFlYK3pxVWdrY2o5VFVLWTBWNWFlQW96d2hCTTVCcXhY?=
 =?utf-8?B?UURtcjdGaE90eUkycUhPOTlDZEZVV0VEeVphYmlqLytEL0xQTXhiY1huM3h3?=
 =?utf-8?B?b2dna2xjL29JNldubGFtMExZUmZrQXJNdk8rSStlWmxJZkhsdmZTZHhrVU5y?=
 =?utf-8?B?cHU0a0dwUXBRYnZLaU91bkdSc0FwV2g2R3dyNkFxWXQwaHNDVHVuUDR5NjJL?=
 =?utf-8?B?Z2pFTVU1WHByM2h1b21kMlZsN2NnaU41UnltTkpBMzRFbk0ybEM0L29GZEcv?=
 =?utf-8?B?ckRTa3Z2aCtLQW1QeDFlNXc5RlRpbjl6a0RnbFJSdllseXl2RllzZVZOUE9O?=
 =?utf-8?B?NUNuS3FJSGlidWRPQ2UrZWJvT01EemVEL1AwaHh4bUt0MGZDK0wva3lVbStp?=
 =?utf-8?B?WVdlM015THJ5YUtoS2FDemhmU2lhMGlDczVDY1lIcjdRUklkZE1KZmN5SDB3?=
 =?utf-8?B?RXZkQkNQWWhGWXlZY3NmOWJReGFtVGg2MlI2SzhEZkdBUmVOY1QwWFJKZjk3?=
 =?utf-8?B?NUthOWRRSkhhM2MxUUFERTJyTCtvNTdXWU04bEhmaVhneFpOYzZKZ0hHWFJh?=
 =?utf-8?B?N0pVZkFJT0NIQnQ1SHh3dWxBYk5WNU56QThrZXhCU09tcG0xcE4wRkRwOElT?=
 =?utf-8?B?NEppbU5KTnlZemRrZ3V2YTZFUnh3Um0xcUpYOTNyNVI3d3ZiUmNyMmh3cEVz?=
 =?utf-8?B?TTZ0YTRpVDJTMWUxMERwTmhFZCtaV3FPdnRhcmV0azMySWFiN0orU0E1MXZT?=
 =?utf-8?B?VVZGMy96eXM3eFRFelkrendzZGtoRzFZZ1Z1MmEvdC9uc3hEVWpvS2VzWU9j?=
 =?utf-8?B?bnB2dysxYzlqRHAxeEVJMnFCYmVibUxqQnRxT1g3WE1tbThIc3JJVVVwV1BW?=
 =?utf-8?B?dkZmcXJwUkJRM1VCR0ovLzYyRTZ6U3FTTkFsUTY4Y2hvVFNtM0M5Q1FwbTVV?=
 =?utf-8?B?RmNzdVpXRDVoTmd5cnI0d0ROanBwYlhYZ1pRZnZuY3FsSTc1ajRNdldTVk1U?=
 =?utf-8?B?UUdnVHU1dE1haWRtS3hBTU1pRVZJbVBmeGtneTlrenA0VllObTdzY1BqVzZv?=
 =?utf-8?B?RDFWa3k5YUlqd1l0WWp4TjJtcUZTRlIwRE10QU9vK3hGa2RCUUFRbk96SUZJ?=
 =?utf-8?B?ZXZVNmUrYVZhRndQWXZ6VlJMVWpwaTNkTDlyRXEzOGxvLzNEN2xDekpTZ2Ns?=
 =?utf-8?B?Y2xaaFNmN3gxTWVRWGxuOVI2V2Q5RFMrN1h3aEdPSTg0MFBlaXRiRUtHbmY1?=
 =?utf-8?B?QTAvY2x0T0hZbFNWbCtDZlZGSFV2Ui9vRXFERTI2bnpycE9Ib0JJZmhsZGNE?=
 =?utf-8?B?bmd6RVJDRWlsK3N4SGlwdFJNcFdXTi9ZYmZlbmpzQkJ1K084ajlkbjVOOWk5?=
 =?utf-8?B?UVJ5WEsyYnE4OTJJbFpWZFpucnYwVmRaeXFsR3NzL0pwMG4yN1ovUndpNUZZ?=
 =?utf-8?B?eEZ0bzJ2M0FNVW5SWDlBRjZTSi82MFBYYjhZQXVSSWxMVmpEMUIxUnFLaGRY?=
 =?utf-8?B?bUV1R3AyWmh4UTdaOTRJaVJicHYrZDBUOFlmMFpaNkl1MGJaVHpSaUdGVVcw?=
 =?utf-8?B?MGhBa0w2OEpTS2YzYTgxQ1hZT04wTTJ0NHJ0ZXRobS90K1o4Nkp4UWYxbysx?=
 =?utf-8?B?dUlZcFBhVStMRjFsaDQvb252VnhSZkVFNDNIWXZ1L25aY2pVcEViK1VFZmtl?=
 =?utf-8?B?b1ZxMkxQWk9CTW82ODhyM3l1Y3p5SWhyTU4vZGYyNFAySmxFckR4aGhmeUEv?=
 =?utf-8?Q?bfWT4aWogjq8ymweyBJqdphmwST2irwQWDlizfjG6/3NR?=
X-MS-Exchange-AntiSpam-MessageData-1: eNLw+BqbM78xfg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f697065-52a7-4ca6-43a9-08dea34914ea
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2026 04:05:41.4349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zx8JmWobcAR5MuYZDC/1/FNaDri9tGR/RgZl/hfSRHLYNDY8pXThAUfAUBpL/DpiMHYExHFpRHZ0j85zQHW3bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6002

On Sun Apr 26, 2026 at 12:46 PM JST, Hsiu Che Yu wrote:
> Add a doc test for `Vec::from_elem` demonstrating basic usage and the
> zero-length case.
>
> Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>

Received just as I had finished testing your other series. :) So while
I'm at it:

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: Alexandre Courbot <acourbot@nvidia.com>

