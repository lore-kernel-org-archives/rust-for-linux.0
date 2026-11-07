Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044944;
	b=UquhFBfnxh4x3fhr2LmZ7TiT0unKNZ7iWV57rorlGpLcLgWoph2ZbjPv5oqdqYernbbL
	 uPRz+k9ltrc5IBU2T0c4dlAsuwBJbS/MPwBkLAdm+FUcfU8PB0EMCSs6+ZZ/t1gdRv+3v
	 MQFLSVkH1w1v9EHVtPXtz3sVEK8Z+CUhvR/Tq0sBD6wBlHnP5AG4g90nKt8RgoIxZ32r7
	 gOce1+o6g/flV/ThoFXLgXoa8di2gc+yDQ5vFEcwmaxccuj7m7MUmivoTsvuT1jm+7r4W
	 e8mO7M13wb+YhwjxHToYI60FZb+oi5zx5ts3vy4f7hwbJfM+Wamhu3TwqL9N8x3QsSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044944;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5xhP0P+76YUzuDOn7AUPOhUFfUaKG1gcTUhbT7wXpQA=;
	b=P1eX2Qiwctf3vZplX7ov3zw8qXTVtMuieDuFsLbrkAEVGpG0Jb1UuNYh+vtS34R7IrYQ
	 HBZ4bJFTWICNR6UVtBBWHGopIyiKv+SxL3tqAYXaYield46fJ80OmoINMSUorMrVNla07
	 /DcESGbiUkXRNd9dhwmYp98vde2fNt5bcVc80ZBTfBPaKjOqrF+qeAQ1vZOmNtWXCl40/
	 I53u5KwuVr4fanQEsjax5MmPMb2q7Su6zmdf7RsYe7uEDis1TqO+MoLGy5uMFB9j4i1kx
	 nvBUpDIftwFUZDweqVARLKL5tqYJrL3h/7jo3eQpbLNAHjakcmyeNWhxuRGYZ2pY51Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QvijMZSa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.20
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010020.outbound.protection.outlook.com [52.101.46.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B8606A326;
	Sat,  7 Nov 2026 09:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B2B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QvijMZSa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXtKH0P5JrtEbb0ZC3zh6i1ngBA3oVZ2XymZmYsSNv86tvvxF9X5TxPHl/m6VpgHnQDYMOxq5UgzFPuGWR1y00F/ZB4sCrIlXoN88XqxgVKEJhRDCU22ZVU7wOhMgzEQrdceKP3tVhKg6MZgKS8HR283rRHUa6/AUWTYMSWnFpgDpARJTjJf/14HQO9vhWN6asPUhBcPjpAW8WzQbn7YYRA8zCQI8yEYTgdmsPcvbwH0IoDNKV2t7SmOgytcwtlsjf0ISUuYzIbXassxNluKmT+NHwJQZjCCHn2O2g+RKTX3rqywuFlJ8i86G/ANo5ORbdH694lGkwowWGLUNKzvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xhP0P+76YUzuDOn7AUPOhUFfUaKG1gcTUhbT7wXpQA=;
 b=jWIFQUT1VtBHZWiQwAc5zsKwNzwcV3kkYl3zCt6Ij/G8NJ0ckjpKUnLe9vCKgGEA7dhabikuhXVMxz5FgSaHdrd+dX358jFewe71JJ8iOCRCN7+42jWuVpEs3wtf25utim76Tszdg6jgDLhilb3smzi8GIleBn/gzFiOSkM1qb1nIUIVQmQDjoxtQyUcuYCoCajudX8IvaPj/SuEvxtHirDfCk1rzh+TIGJAz3y7rikDPcvoBw75DU+SiESDD2ucnjLtqBI+mDq7QQ7kL2JHBMz6XrN0tJ7s03QNz2kTHraNtfkKBH+we8pXtDPCEfdziaxdiXASIIp8416w0juj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xhP0P+76YUzuDOn7AUPOhUFfUaKG1gcTUhbT7wXpQA=;
 b=QvijMZSaoS/SUcP6l2MkDLAdyLYIobok3VZ02sbSjcNYa04cdO9B9z03GH0iGWls0BvF9c968vqhHFGGVLl/4Bwt4ivsvzx3wt+yh46UBLAW9JrxUJFgaoAdQpqh252Q5rfzyyiJg5//mAZOjJDKBNdEU+FfXnweKr/WCOKVIAW2JgzbbpUrOXkadxq0TNr8ukK3zZeb4RqRT8qmJDob8lh5KYIKo0nbffW6ex8UOUooTrRphp78wcu7V2MhujgQkOicQQ1aYNAhHgusP8dlVRbpz3IOq091LQEVsWccK0c53ZNI4mQnbiXbLIl80uQJ9Z1qASbRGNafU6z+YLSqJg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 09:49:01 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:49:01 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 07 Nov 2026 18:48:08 +0900
Subject: [PATCH v2 12/12] gpu: nova-core: falcon: program the FBIF_TRANSCFG
 register in dma_wr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-r000-fw-v2-12-fb37cc5b20cd@nvidia.com>
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS0P286CA0084.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:b0::17) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 93145413-9726-4034-fadc-08df3cb459d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|10067099003|11063799006|261026121527099003|261102123227099003|261021123027099003|56012099006|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	hIIN267aFRuQSG6hLqFDxLQySgmyJrqv1nUoxi1Xry4YIpbGMxa2w1cD2yC21HfadCIbP45HZCc27I37AA79EkvHkd5EGTYe7mAlsu4buj21K4Gp68BB5M6eLN5qOe9zn8k/HCHDwB6FM5C64UXZo3+elgdPr3SV95tr6vHy3NWQ1xEUcHrdZ1vkNmyLR4rD1dwcjwEgeLQgDo03QpSb0IiGwNBKf6PqyC/mXkRni+Q61NzGsHBdCcZr/KYiZ02QZDp4jI5y6UWffXjyEfosce4WDvaHPlpzm3IHKJ7Ln+7hFbAhrHxHCKbAFo0/pEQFCvxcblXjDEvCWMqf+f82wt47DulMk/Md8vw157ndIlh8Tly5E9Y93U1lf4J0UshcrmG2BHQiikGE0cL6N+bKPE4imRxSpIKlOyrXLRg4jC/QJ9gfNExaqVBY7jTvNXEoKq/QdxgITWZSYcK2egQnD6f83KgbX0n2yzFgtIQRF1xHIanKA6zsjcVUIQtg6P4jfJruTn+7E3CJ1miHqyzLsb+cZFz3YmOef+8b+fPOxUcxDIPT3WeLS0YgGHT5Awdkz9ECpPjvo0dNvv4ve3mjqrgw1ICkff12YAHtZ+FaWcUB2w4Ck1StUV0GJYUBe6AOKAqrBF7tI+Ov/pRbUg6Gn7Jb8kcZxS3W2j29aPvzMp0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(261026121527099003)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXZIZXJ0UjhZcGRhSHEyWW9TV2IySDR3WnlBUzFwcFBRTHJwYVpuMGZ6NWNV?=
 =?utf-8?B?emsvUWkwSEtRTVJ3Qkk2dWloanlQV09icUh4VlBMUVU4NFBZbWtEK1QxTGI4?=
 =?utf-8?B?SjRjMEcvR0tnWi9yMEI1RlhPdDRrUVl2NjVTRndZZy9kSW56RTVqNGJJQVJr?=
 =?utf-8?B?ZGFkVWd1RS9lQU1jUGhyeTZNSkI3RUNZMnRqTVhVdW9DditDblNzS2hsY2Vr?=
 =?utf-8?B?VjVXdU1FMzBhd2UvaHBqM0hwWTZpYW0vSWRFQzdlRmNNWjRoWS9oR0p5c1g4?=
 =?utf-8?B?RVU4b1FObWNab1VXQTN4WU1wcld1OFBRYTQ5eTRYMXRLdG90N2dhd3AyRWFh?=
 =?utf-8?B?VHo0cENSODdBTVlOeUNFQkQyaDVzQks3dDlKR3JkRFVWVDlLekpqbEZPSkUx?=
 =?utf-8?B?Uy9KVVVJeWRQY1VoK0YwYnMyUTI1Ry91QmtnLzJVYjRQK2tpWUp0N1ZxVWxl?=
 =?utf-8?B?Y2NzWDZqRnpzdVVaRy9ZVEpVUXFTR0dvTGV5Uy8zL0JLMGdKMWZQZy81SzYy?=
 =?utf-8?B?QzE2VUNYVm1rZE5iNWRjM2EzME1VY3ZGN2hrRW1ST3FMbEVQV3BZTkNhQmxq?=
 =?utf-8?B?TlpwQlE5eFplTUpKNlorS1lTYUhkbkY2V2QwTlJRTnY2OXlXbU1FL29PZENu?=
 =?utf-8?B?dnhseFV4L2E1QXVPYTNNKzEyZllNRkpOQ2FHSFNTRnJwY2VCMzR1UTVERElD?=
 =?utf-8?B?ZGJPaFkwbnJaTy9CT2VqOEZqTVF1eHdKdUlqUHB5R3RoN3VtK0w3TUdUdEMw?=
 =?utf-8?B?VENMQ05pN09ib2tJamI2OVNMUW9HclR1cFRXTEw1ME1PbUtIRkFFQUlnSXhE?=
 =?utf-8?B?U1dqdzJGYURxUU1QVTBIVm5pTzRseDkzRjkzWjV5cFY4Q0toK3lkbTQ1Wm5k?=
 =?utf-8?B?eHFRQm82UERqdVV0TkNTNlJXWU16ZTFGdGw5L1VZajQ4QXFBMWpMd2RJZ1V1?=
 =?utf-8?B?N2IrZFNrSlpPMHlJRVBucjdJUTZtR1pIdmQ2cS9TQVllb01VUW9qZXNIRXJ1?=
 =?utf-8?B?VGIxREo0ckdheFJqcDZIQ1FTTk1hWk80eTRlenBsR2hZRk5ZZnIrY3N5WHNr?=
 =?utf-8?B?QkFPc0JHYXI4YVNxYmNJL2tyOEFYSlRRMVpKckZ2MUU2Qk5GTTRqUlpFb2pZ?=
 =?utf-8?B?N1oxRmx4T0FRc01PcnRaMk44OGFtb2swcWc5cU5VMHA0QkhVdFhjdmJ3dGtD?=
 =?utf-8?B?dlo5TUJZNEpkMWtDdmIzdk4wdkZqVWswWWU3Vkx6VXg4Q0lCeUNabUE3UUtm?=
 =?utf-8?B?U2ltS1lycStXbFRwY1hDK1c1eGJGVVlUUFB4TkxkWmh2b0NjbDlUalB5cWUx?=
 =?utf-8?B?a2ZWVnVPU3hmT1ZoNzdiR2REVzhBSnVsdzEzWDBzb1FCL3RBQWlIeC9kdjk4?=
 =?utf-8?B?c0Zwa2ZlYnk1U1RmNzh6dStnUmdXMjBSM01NalUrSUsyalJOZkRvbXdJQUEr?=
 =?utf-8?B?bnUzZ3RJeVZoMnRrYzlaZVRYL1VoTHBQc25lOUJySkVUSVZjUnJsYW5NeEpK?=
 =?utf-8?B?c0RiQi9mOC83aDRZWE1zeWhlVUV6dk9JejRKMlZEWkVpS0kyaitzMitYYmN4?=
 =?utf-8?B?QnN5aG5oc3lzRFdWYUtXMFZtcFNieW5GaHdYNG9kVDdia0ZVWDJLUzNBVUZ1?=
 =?utf-8?B?T0hpM21YV2ZFNGJ1Q3BwbHZ1S3lLOHVUYk5GOVZuT1N3VkMwOGRGVWJDQitw?=
 =?utf-8?B?anFzTXhuMlBOak81MDdmK1ZpNDZmTGh1TkdRQTVqNmEyNTlkZU5xWVVUZE1p?=
 =?utf-8?B?bnNTSFNDU0lSTnZEeTYzM29Oakx1bmRWN3BPZGdjTlhGalYrNEI2Z3JFcUJK?=
 =?utf-8?B?UmRodWd5dEd1elpjdzE4cG45SSt0cGFwaktVYTlKUTgzM0Y0ZlM4V0F0L21M?=
 =?utf-8?B?OWdYeUhDdzUxVjFhMHhoazBPRHJqS3ByMFBlRWZEOGlieEdiOG80MzJqOFR2?=
 =?utf-8?B?aXYwYm9WSmdBUXZNZzY4MXIwMUNrb1EyMjF3Y3N6ZnpTUFFkRnRRT3cxbEh4?=
 =?utf-8?B?aWNUZFN5Q1NnMEJ0QUh3NTlTNG9GLzZwL29zWDdYRXJNWGxOSTFSY212cVds?=
 =?utf-8?B?UE9LaVFiWHFhVU1kS3E2eW5pZlJQczE3ZFZlZkpqZkwzMTN0V1Q2cTFxbWhY?=
 =?utf-8?B?RzdMbnNrNlRQcEZXVUQrcWlVKzJ5QkJtRzdwTW9xc1J1eWFuM2lDbUVjeGp3?=
 =?utf-8?B?ZTkvbjZYUTd5elFaK3FaU0hSRjNNeFUyK2VaRDRFUE9rSW9icU8wZG9UR1VI?=
 =?utf-8?B?NFZSWUIxcWVOYTNXRWlycHpWY2hOTEZWcVc5MVVpZVA5TGh5cm13SXl0allv?=
 =?utf-8?B?dFlQSVJ4QVdHejRRaTE3b2U5V3l4LzNnY2xTejBkOXRQeVJhcGtDOUFEUTh2?=
 =?utf-8?Q?Y4hfQhqm4/EsMU84blCa8vsRc8L4J0hGne6st/dd++iFx?=
X-MS-Exchange-AntiSpam-MessageData-1: S8gZNWoNjCGbHw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93145413-9726-4034-fadc-08df3cb459d0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:49:01.0529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssB6sG788uPekX/HiUKDk/urgSF5MO69wwjB+6BQLPz3yVOut63/VH2ef3E0acDsLB8Xm3dlk52m1GIUqMTl+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

`dma_wr` takes the source of the transfer as a parameter and can derive
the value of the `FBIF_TRANSCFG` register from it. Do it so the caller
does not need to program this register beforehand, which could leave the
door open to bogus setups.

Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
Link: https://lore.kernel.org/all/DMNWO08EFJD8.D2G9X082FUKN@nvidia.com/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index da860caac20b..76f49970cade 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -571,7 +571,7 @@ fn dma_wr(
         //
         // For untagged DMEM in a DMA object, the start offset is folded into the DMA base. For a
         // framebuffer address, the DMA engine adds the start offset to the address.
-        let (fb_offset, dma_base) = match src {
+        let (fb_offset, dma_base, fbif_target) = match src {
             FalconDmaSource::Sysmem(dma_obj) => {
                 let (fb_offset, base_offset) = match target_mem {
                     FalconMem::ImemSecure
@@ -592,9 +592,12 @@ fn dma_wr(
                 (
                     fb_offset,
                     io_project!(dma_obj, [try: base_offset..dma_end]).dma_address(),
+                    FalconFbifTarget::CoherentSysmem,
                 )
             }
-            FalconDmaSource::Framebuffer { base } => (load_offsets.src_start, base),
+            FalconDmaSource::Framebuffer { base } => {
+                (load_offsets.src_start, base, FalconFbifTarget::LocalFb)
+            }
         };
 
         if dma_base % DmaAddress::from(DMA_LEN) > 0 {
@@ -622,6 +625,12 @@ fn dma_wr(
             .with_size(DmaTrfCmdSize::Size256B)
             .with_falcon_mem(target_mem);
 
+        self.pfalcon
+            .update(regs::NV_PFALCON_FBIF_TRANSCFG::at(0), |v| {
+                v.with_target(fbif_target)
+                    .with_mem_type(FalconFbifMemType::Physical)
+            });
+
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
             self.pfalcon.write_reg(
@@ -671,11 +680,6 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(&self, fw: &F) ->
         };
 
         self.dma_reset();
-        self.pfalcon
-            .update(regs::NV_PFALCON_FBIF_TRANSCFG::at(0), |v| {
-                v.with_target(FalconFbifTarget::CoherentSysmem)
-                    .with_mem_type(FalconFbifMemType::Physical)
-            });
 
         self.dma_wr(
             FalconDmaSource::Sysmem(&dma_obj),

-- 
2.56.0

