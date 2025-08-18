Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2070.outbound.protection.outlook.com [40.107.95.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED06326D76
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 12:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519299; cv=fail; b=DT8mF6hl36C18QgkX9EBi/VYK04PC0YB8JCaYbzRpnzpfTHkzyzeR4KxsJYKGxZ2YhcecWPbDhInDcrs5+xVm9a3BmehaKNTIpmQZ3g7Z+h7GgZOcxbdC2ziB1t4b5VUf5Itq1HRhn7EaW5g3N3QJ6qq7hVvhECTB+JJ3c1YLL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519299; c=relaxed/simple;
	bh=stwbUy7jhMM2mI5tl2BxNL4M5PX+V2KVkZ/P6/YogBs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Mb4kVBI1PJh4Yh4VI0usjDfNtBxQkKTNSEF3k7JsP3wgVleLyJA0wNhKHAaakQ5bm1eA3Wt3KO3n8D9bWWo5EZAZW85AsASIm2FOlIEXmk0OzPTVldNe+jxQOqLMruEQxzTU41rerTDgcbWULQGEkaPXyNKKWMfmjdYS4y1uCS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jzuO1L7b; arc=fail smtp.client-ip=40.107.95.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jzuO1L7b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxowBg77Upo53rYI3zygGMgzg5TC+3n6kPwbyzn9iriAhjLh0D6PxFrqURyYB2AIdbgiXwVqyiUaJO1h7WAT3SbWLvCMcNwkPOl0Yy0pX0DpW0fPtkw4Q0h3vD+XlmROubPL+kBFu3RRKkA1QTxwWVPdCQGj8xoOc+cn2eAyTAZfNKv0jWAMQuUTQxYFYYsLWP8X48Hpn7QFOy0hQ4H0n3g6qmjtGUqsj0EgxiRsThYtgSUQUcFMUVeRqKstraZx+Wby+tDtyqrKIv6zcbKQNm3A0OxuhWQPXg4bun7UYzRILQ+OpSH6y2GRDu3ZaV5XGVFYMc5RgFbZ38w2kXeRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/oFEr2kIjxHSjL3TAkk/JeE7Pt4uFbf4CrY5R5V7Lw=;
 b=g8KEdN6Thn9q62C0FDA9izD/VvbwVlIcQuBmZmU/ziUmoEloTz4YqWJltI3ibwnEj3r8YQ8b5H/BA81qUCw0wEM2jpZ6YmVNgoXkr5Wjq0SH/VtpLlDs64mvcWszQl1na8Tg9ZRmX13UrexBJNDJKadHZwRNaOiTq1/01Bg1nrxCFFvSOWgRd0p3vnkJNhpyXJBgItdr2GHUOdCDPk2v40c2sI51Vmg0MJziSP0sOZPtY7VeGNKj78xOG5dXxsGqjiSYT/Sop9av8t1Ku/EmGumpv+bZxt3JUkRdPTZqkjjAU426d9d5mOWmI36SIY9T5Xb36QtoqFQSsRQTkmefdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/oFEr2kIjxHSjL3TAkk/JeE7Pt4uFbf4CrY5R5V7Lw=;
 b=jzuO1L7bqlv1f5gVTK6akdcxxexEGxlvc9kBdUFppaHk4H6pyyCXFt4xnglvvxTEA87dqlW1JNlnm6UN3xFQJchOPIMrAt+1esd2HCw1SKs+sINyIsOm6ZcLJ2uXC3+Z6NcQ4AK0zWdCeedq/thqQzYwgc/OSjq+NtBRrqnZrxZ23qqh/6qDQcIJKvhhkl9j1mTpa9UlwkRvvXSr/pzPJCb90GguNOn70AXOd1SqOEfC5jagU9HDKgIMF+xOy8jtYsxaYMDeXLMnUcTdymHOtCwi/ZZsbaROyNpH/wLuTblJeEI6Bup7cYvXTmlA/w2EmlHc4fRHHPDs06UdypqR7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7788.namprd12.prod.outlook.com (2603:10b6:806:345::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 12:14:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 12:14:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 21:14:49 +0900
Message-Id: <DC5JNG29SP9H.173LYQAFGZRWK@nvidia.com>
Cc: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 4/7] rust: page: define trait AsPageIter
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-5-dakr@kernel.org>
 <DC5JGQHBJ37U.3MFJ8XDQ3TVCN@nvidia.com>
 <4f97ce63-9e96-43ab-b3e1-20960bc2027e@kernel.org>
In-Reply-To: <4f97ce63-9e96-43ab-b3e1-20960bc2027e@kernel.org>
X-ClientProxiedBy: TYCPR01CA0146.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: fafd299f-6573-46b0-35e5-08ddde50d5cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUdzZDZBOTF3V0lBUmQxc1JIOER1STVMdjMrVHIvUGdES1p4VTNPODFWcDlC?=
 =?utf-8?B?Q01WRVNFLzFLSHVxVUNaN3kraGdyaEpVTTJGQVJZRVhzQXU1M3R1VTNqbzZm?=
 =?utf-8?B?VDZLb0s1aVBIYysyaU1CVkx6Wi9kVGZHNlhDeWFYU1BuUEVrQjlHajNPR1BE?=
 =?utf-8?B?WFBmUFBDbUFqTjRYYU1XQVFzZkEvY3pGanZFbXBidmJmTE9McVlpOFdGN1ZX?=
 =?utf-8?B?bElwRXQ2WXAzdDRpN0UxSGRzM3E2V2NOQTRHbVNweGV1VWcwR0puMzQzU3NF?=
 =?utf-8?B?YjgxUVM5Rys1TUw3cEdudkp2T0RFUlU5S0JuRXkzaFkvYUhuYk5keE0vSU9v?=
 =?utf-8?B?UFg3b2ZleWcxZDg4cUIwMkZsM2pUUGlOTjZqb0QwV2h6akxzYlFNMWp2dVdY?=
 =?utf-8?B?THhaTjVSeTU2bi9TMXBKS3FYZFBKeGpYbVF3TE52YUFESFFPSXQ2ZTU5QlpG?=
 =?utf-8?B?ZXZPUVNBWXM0R2ZPalVqVGxsU0JTbFhlcldxUEk1TUNLcDdocUZPYzI2WW1y?=
 =?utf-8?B?WVI2aFpDeVE5YUdkZk8rSW5mS3FTTE95RFZhZVBEQnlVeTRpRDBMUXFvOUJj?=
 =?utf-8?B?MUpCQjExSzd0cjV4eEVnVm5WZnBoYmxwYzY0Z3ZGVVZPTXQ3SStPRXR4T3Iw?=
 =?utf-8?B?YlJMTjdTeXpoKzNBZVBLcnRHMU1Kd2toemp4bjc1R1llQVA3NU42aWhUSlpD?=
 =?utf-8?B?a2NTblc1K0VacXk4eDVYK295c0YzYU9JZ0VMcFE0cEpjbHN2M21HSEpjOEZx?=
 =?utf-8?B?eUFtd2RWSXlDcEw0V2I1VkJ2alBCTGJoMHUxZ1phdXlYS2c3dER1UnZXYzFn?=
 =?utf-8?B?TGpvM1JabG9vVUhkN1B4dmFDNlg0V3Ricmx6Zm1sQk5vdnhrYUlGZzJTaEs4?=
 =?utf-8?B?eDE1Ung3KytnaEJDRElCbStocFBMcUxTRGxRSnNCd0Nla3ZKa3pwU1NBczJp?=
 =?utf-8?B?UTMrQzRqbkpzYWxZRTZ1UkErWnhoN1MvVms1QzFXcmNJZzdUSkZrVjhIYXR6?=
 =?utf-8?B?L1NISGN6dDNoVnR3ellaV0NuNWV0eFhRNzZLYmVYMnRPUk54Rm54RmZ3Rlp1?=
 =?utf-8?B?ZWg5R3llc2g3RTRkTkp2azh1b1JQMmVzbGQ2YUg5OHdBUSs0a1JjcEhObHl0?=
 =?utf-8?B?bjUrRkttWkdpMjFmaFFYNGgzSWNFNUlvbzVhUEFDRFRaenh2VWQxUGRYU1pL?=
 =?utf-8?B?QXE2d2U0a1AxZTZyZk5ySE04cWRCNXFkMlBvQUhqY2xXdnNrMy9SenVaN2Zy?=
 =?utf-8?B?aC9ZekJBMTZrdHZ2dTdVMTlQcmpYWnhCRUptb1I1V2tudS81Y01KcEM2ZWRJ?=
 =?utf-8?B?dysybHFPT29rQnJqWkJTMzBPSmYrRG84RVZPTWR6UTIyM0N1M0prWTFGTGNp?=
 =?utf-8?B?WEJKVTlhMzR2Q3lRLzA1dXZKSnd5MlFHZ3ptbFhGUDNVZXRaa1ducmhsOHor?=
 =?utf-8?B?cy9pVnBYcXQ5UHFmU2szYUV3TWFxM1ZERGtvTmJ5WHpQTkQxajI5UHBqK1dy?=
 =?utf-8?B?ZXlUbE5Gcmk4TFMxR0dxLzhXSlpxT0FGaWk1UUJWai9mYlMvTGJ3ZFFyMXBp?=
 =?utf-8?B?c3NQWno2SUo5SlltR05FVVRTOXY2K0dDS0xkSEw3U0NteUxORDg1bDlJMmov?=
 =?utf-8?B?T1N6NW1TdWgzek83VmErY28yS1F1SHJRcVNnUHpzQlcwdXd0cEdralo1dldJ?=
 =?utf-8?B?cjNkMmRmR2RCTUNuUGsrcnhMRnhWRHQ0R2U5TXE4RkplSUQvZzU4N2NuUkt1?=
 =?utf-8?B?dUNiTzg0V2ZzRmlrWFkrV2VORm0zL2FKSTVDd2lGa3hVeW5FUVZWREVqUmNE?=
 =?utf-8?B?U2ZJSHlaWHFNNFZMWUg4VFdFVnM4QUZ1M0pSSmZiWmVlRFZQOFRhckZrbE1s?=
 =?utf-8?B?VDVGWWxEQnA5aXpVZWZyVm9rbUtEamxRWmlCZW1ra3JKZUdxczgrVUUyODdX?=
 =?utf-8?Q?RxBIGnpQzOI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHp4Tjk2aG5wcGtxb2NndFF0aHFTQnh4dWMvcStVVE9GU3BDU2Jud3Mrb2RP?=
 =?utf-8?B?WndmczhrTWZaWHAwQjh5Yk1VUGpkOC9Icm1XYy9VWG9ZNUsra2RKd0x6Vi9I?=
 =?utf-8?B?YkdYcjZoc2VZcFdQWHFyOFQzMzdlTGZWRmcvVGNpRTFKeHhkZUJiUzhMeDU1?=
 =?utf-8?B?VGlmZEtXNVlPSEtGRDJka3dXdG5CS3pqS1pDSDZwcTFlTjk3dEd5ZzczNlJy?=
 =?utf-8?B?cWJEekJpSTB0dVZCZW9Oc3lEU0tuT2JzN0pPQ3RxZnJEYjhDOUF2V0ZRemlS?=
 =?utf-8?B?TFVHTnlIMSs3QXhIUGI5Ulp5Yk5mdytvUHFjN1lIN0NPTHlCUDlzYi9JRi9H?=
 =?utf-8?B?M2gwTnU2VFlVem45Yzdwd1hZMkNPUnY5K2xXVGlEY2xGbzVOb2x2clFyZzNW?=
 =?utf-8?B?ajFCVWNoU2Q1aWppUTY3SkxacG9MdHRVMkFXWDVJNWsvNU01RzQ5bkNOb283?=
 =?utf-8?B?aDkxUy9QcTFUM0phRGRCTTlPK2VmNUx5TDRMNzlRSUUybDg3a1lITDdSUTg1?=
 =?utf-8?B?RjdzNEhyZjhHbXJ4OXRobjBCcDF2bzEwSSt6QVJEWG02N3VTa3g4Z0tYSjFD?=
 =?utf-8?B?UDJLdlBXTEtTMmV3N2taU3JqTkRqZzdNZGtDZWMvOVpGaHZZM3R2MElJeWVq?=
 =?utf-8?B?OUlyYXd0cHorVUhIWUxyRUErMlFoRFhXUmNSNUtVbkFvM1BHZjJ2K1V4aUVH?=
 =?utf-8?B?UE5uOXFoc1hmRHdhWFlvcFhGZytWN3krMk5WSXcyeU5Icy9TUkpsK1EzN0JT?=
 =?utf-8?B?aExNRDZ4ZlNGMnpHekVPMnZJM051Z1FQMDR5ZGRMbWZ3WE1mdmc5c3Uxc0s3?=
 =?utf-8?B?WkNyamZMdE5jejl0SkhIQUFQRTdZRnREUk9oNTJmbkR0SDNwWWc1Z1Q2YlR5?=
 =?utf-8?B?U3VQOHIvUUJ5K1ZRZHdyVW0va1dTVTZEVkkyK1ZLeHEydDlNdjQ3Wng3dEdm?=
 =?utf-8?B?Z2ZzT0hOelNaYTdxMVd0RENacUZKd1ZkY21IaXJJTFRxbkpOUE9qNFlySk9B?=
 =?utf-8?B?NTcwRVMwYmo3TXJyRS91UUhXa1Ntc2lSWmpSbnRBQjBnZ1I4VnY4UExycDhE?=
 =?utf-8?B?a3p6TmtDVnFuLzdDc01zT3RiY2pvQzRnRVdEZGxkZzYvaXBIUXp0WGE3UzJj?=
 =?utf-8?B?VWkzRFVIbnBtZHBkWWQrUFhnNHpVL2swbmJtcVlTYU1CQ0JMM1VJcFh3ZlRG?=
 =?utf-8?B?cXR2OXZUZm9vUjhMOW5XNHAyNWhPekhoV3JITDlIcURvcWl3bVh6VmVxR0Rz?=
 =?utf-8?B?cFp6K0dnbzFDcngxbjhJc2h1MkMwZndNQ0hJN3Vtb3dDT1hmRHRaNjFzZzJK?=
 =?utf-8?B?TW9haW1FYlhTWmpUWlNQSXV4Vnhhby9NcXRsRFdWTU93THFSVWZVdnBMUU9D?=
 =?utf-8?B?cmRGTlBvL29kWU9HZFVpZmhpMjBRb0JHVzBWVWpFWGord1pQMWdGcWVIWE9l?=
 =?utf-8?B?ekJyZS9OZFhZSTlCK01DQmZ0R0lpYlZhREtPV1JaTDdrcEVPZ2d3bmgveTJt?=
 =?utf-8?B?djFlbWZZUndjaWMxaUFmTldHUElsem9nbytRd0ZMV043MjNEMDgxaXNNRW9z?=
 =?utf-8?B?bHBnbndHWDBhaVR3Vjd3VFk5eEtBOG91Q2g2bkw4T21KaXFEV25DUTQzQjU2?=
 =?utf-8?B?MjF2QmlFRU9oM0svV0wvclh6SHp4R3c4TGZlZXcyeHZTYlM0VTZSVVMwb2oz?=
 =?utf-8?B?WDBCRHcyUXhLSWVnYXZNOXZBY1lzaStsV05QQ0RQcDVlVEtqOVRLRnlCZ2tT?=
 =?utf-8?B?R21TbUFnT1NRRzFhSVJHeHF3Mk0zY0RRbzRKRlM4dSs4a05uQm5DNTF4TDVu?=
 =?utf-8?B?ZVI4N1QwclBBZUdLbjZaVVZ0S0o5cVFORkdNWjN3N1d5REtEbmhSWWVlcFl5?=
 =?utf-8?B?UnFDNWJzUGwwVzY4MzYvczVjTXo1RExmeHVlckcxMmVFR1kvTWhQYzN5bXgz?=
 =?utf-8?B?RGk2ejhDN3BQWjYyTitPRkZuekluenlqT2hac2Y3ZjZ2cFF2aHB6ZWR6a3p0?=
 =?utf-8?B?MVZIL1FrQkJJdmk2VnlBYkpCYzRmeXpTYUlEZEwxZjduaURVQ09QSjJxMEoz?=
 =?utf-8?B?UzhuT2JiQXpWWlU4ZGNjaGZaTWhOS2F3R3hHdGpRZC9XMkltKytwa29uWlor?=
 =?utf-8?B?VllrcGpSNDlRU213blBsSWIyWXR4UWozL1dMQzRlQ3VPUFc2aE5oQmI0REpr?=
 =?utf-8?Q?Ti50k18HeYfJv2tqMadJnbsGPBcBZc87H6TannIl0qWE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fafd299f-6573-46b0-35e5-08ddde50d5cc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 12:14:52.3726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWQu1iTrciy8mK5lVEoZi+Qw4yERBVAxpx8GSgC55Tyuep4hHCK68TojSlJ2/f0g2uB27qZx44lZ/S7pqL/5aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7788

On Mon Aug 18, 2025 at 9:07 PM JST, Danilo Krummrich wrote:
> On 8/18/25 2:06 PM, Alexandre Courbot wrote:
>> On Thu Aug 14, 2025 at 6:33 PM JST, Danilo Krummrich wrote:
>>> +/// Trait to be implemented by types, which provide an [`Iterator`] im=
plementation of
>>> +/// [`BorrowedPage`] items, such as [`VmallocPageIter`](kernel::alloc:=
:allocator::VmallocPageIter).
>>> +pub trait AsPageIter {
>>> +    /// The [`Iterator`] type, e.g. [`VmallocPageIter`](kernel::alloc:=
:allocator::VmallocPageIter).
>>> +    type Iter<'a>: Iterator<Item =3D BorrowedPage<'a>>
>>> +    where
>>> +        Self: 'a;
>>> +
>>> +    /// Returns an [`Iterator`] of [`BorrowedPage`] items over all pag=
es owned by `self`.
>>=20
>> This is almost obvious, but maybe specify that the pages must be
>> returned in ascending mapping order?
>
> There is no requirement for AsPageIter that the pages need to be mapped i=
n any
> address space.

Yet, isn't the order of iteration important even if we don't intent to
map the pages?
