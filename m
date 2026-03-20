Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A094A34B1AC
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774035664; cv=fail; b=hN8i9scUa4em+LbgXdcvX6MKH6iR622EnF1/7+GXisihVXHzzhiv06UHzroHHRKqMmZ1z9EU6eRF8ZuLZ2Eit/GdrrBV7HkWqwyjQqMAfsro+RYmzcFKpUVdoYmZ1PhXP+UW5X/ZKwh+Yp18ce4qIz6EeY4Wd6sE48sFP/L9exs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774035664; c=relaxed/simple;
	bh=mQgD9YR9LiPbSHpm9zgbs/CoeZjkGGnE4BJTZiWXtkY=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=Ajmf7+OjRvPoUUM4g4UQ3+IyCJ0LJVbZABI6A1C2c3mHRYTjce3iehtPOAQESIXJPmlMa9LRjOohFpbiBJYZB9i1h4TOTDqXEL8ruxfwp7Y1VJWElV381up6agUDYZBMFWCVoX0thZ5C8sYWFXgFKEySiAnnwsMkj/+0MTeaOA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f7cCxHLj; arc=fail smtp.client-ip=52.101.53.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f7cCxHLj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alPCSZQtET6++CQAZ6jLgXTtfGZgmeUisltQUKQoYY67rMFRDyw7Nj9yRULq/zdiA4krTGSKpYcpLn7lFNTbrYVV2NtBBTrsS1kSge9qk89f8aQzApwJTTV/toJyYAJ8yGq2uSBOwt4KOnVBzBcGUkJmqkq7UAsKD/tkXmDch/2LQf1Tqk+//LZGRZHUBrrpvWJo8hnZUxcOeVT4KmyIraH6TZagapCS+8+m31H40yncRRiz9AhIdOh0u0TQf5aX2A5R9euf8Be3tFiTQv4PUg+Fd9PW/szOlClfSy4V5qTj9Q01ZTGV2dOzbeMKtsdeF78jZ0W8kbTusG6PYuiztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdtUa68cBEvuLigI9LZWDpM/kKNqFw3YQQ4jJ6Qh+bE=;
 b=fqdtHGSpd4voDNCFB6VBOmQw68nnaJFjycYkJyr3qmIu57MPOKg+onmw5PntC7BeOqf6PjHkhHBLXJBpRpiwuALAwnXlZO7ljpZUk2M5eL3flBlYPc4EcnkBV9UIyfphhjvdbMABh5q9Wpq2mwrayH7whMLAbcNxraJ3C5Q1SAaW2fmh5p8ISpojMEplZDLZjD8IvbPte1KDAW/umbP1OuI3/XvE1xg9ejbIycSmLTV4uevFsoobs67lCf9xQ5CXudSqLd977aFWaxy2i1MEQH8tJREtd7AKHkNj+7yqqqVxj1WOLgY+1MVuiS/JjR1ayYA+oCCf7et70oU7K/t8pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdtUa68cBEvuLigI9LZWDpM/kKNqFw3YQQ4jJ6Qh+bE=;
 b=f7cCxHLj6ogFs7N1PgD2pHjE40eJ0d0pDZlCg6AUczdQPeFAMb5ErTKaCpfa8ApoOMfGpouXiV1J69WUpgFCunS6VPeAUj2keDaWlhS4T3V8jZAokfnFoaiaJ1OwZFWFivGdmSM5B8aWup9IUIFTgCiRDI1q1l8J7rmU6E8w9x1/iQJvI8S+Gc1C2v2kNPvF7Jii1MsqAGpsUsjSwncIWzeYtQQS6Epl9IW7GiojHLknfPrUGb2V/fCgQA8b6GtjPPlMmBabhjnnE3XqjKyd+Hu3NRfBAX8Dmk5gkJ4sV41yPeVlBDmLlBYbU23mvIIgxGw5N0ABElYsmfbMK0ripg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7262.namprd12.prod.outlook.com (2603:10b6:303:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Fri, 20 Mar
 2026 19:40:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.012; Fri, 20 Mar 2026
 19:40:53 +0000
Message-ID: <1f94cf47-9898-405d-bdf2-29e21cd87528@nvidia.com>
Date: Fri, 20 Mar 2026 12:40:51 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Roman Gushchin <roman.gushchin@linux.dev>, Miguel Ojeda <ojeda@kernel.org>
Cc: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>
From: John Hubbard <jhubbard@nvidia.com>
Subject: Sashiko.dev for Rust for Linux
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca8555b-9b12-4812-d758-08de86b898fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XCq8RC0zee+xL9N2AAyD4+Rc1kyDqwmVPwjIDc0G8u393Vlkm8gjV1Aniun2OHmFxezmnSzqB8k1/UWCK1ifLT7gOZzg2zLDpfEnt6qOGN15q7MBwEUOd9cnpmks+d37Bq5VHYBL0FOCLwJ99MUEpOKyTuT/5HpfPf9Fg5JKUS6Y3bEccJeFGB4VM/moLDLZLzHU0uPFxdfzbxj3g5akz+Edz9oVODxyq1ucZEBB2khWL+5IIQcCYF2LpjnRY9hP8c7ozgyYKHDn1H7H/EIgqZEK4m7L+//VqKrWUIEA4wvaxKKcJziNAK0a8kFpoM9mW4slIzeH6l1b9D0cqMTv54y8u3km9it2GxQIh59RxYaxDBhOUxPwAaTWQquKskMoUUJuBRpjEdkdHWPLVAUODSg3a7IiKEHCD7kpbqEPWUe9Zk89XEdwmecEHIT7eZhZr53twOKisW9AxaXlFQYD52VAwwJW2dIE6V4iUqExEs0eQ0mEVXp53pPr54UmJNh8zn5khilYKdlzikNHCcYih8M6N8vm1WahwQaXQ1dVZQwvaxjYzMWpZAZJU3MvAIunST6gf+7vPzkbdi3GfakQozPJjkhzaELfetxhTNwsHLgoxpSzUNxqkovmpTBHEdPMlXBtbhcdPHBKjQl80nKp3MiRbHt+gA18BfxGKERlZFWHu3PmiVaSnlTjsxRMmgpProkcsZAvkTX6faGRUK9xLtbMRlNs4DKuBBpW+npNo5M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUk4RmZweURmZUlpRHNrbHErbWg0eHdqdEVuNU1MQ3pYS0t5aUI4ZDdHb3Js?=
 =?utf-8?B?TUorTVBncnp3b0FXejNnWWlRQ1BiM1dIU0ttWWdySEY5QWVQSkEyUGVtSUE3?=
 =?utf-8?B?cHJlMCtiWElFd3E3dW5vVkI4R2pZQUpiMjJZTkNIakxadWw2Qk16aldPczR3?=
 =?utf-8?B?Q3pUaFJWWTZybzIrYmIxanVWQzhMZ3lYL2NES0NJcVFPZFJoVFdMWlkzTHFR?=
 =?utf-8?B?empVOFBDYnVWN3FrNEYzb0ZtT1NoSWhXbHlxVDFUVjZoRVNsSkRnNjJMeEVD?=
 =?utf-8?B?MnBvOWNwcGtzd21qSUZEZkxEWGdDek1KTXc5YlpOdWVMY1ZsakN5TVdQSmYz?=
 =?utf-8?B?RzQwb0lUUEZwVHBRc2lSWnlNQ3dkWW1rTzVyZFhsZ1hMNWZQNHNUZkxOdFJO?=
 =?utf-8?B?bytyRXV0ZjVkSjBpUXdGK1V0QXNQazB2MWRCWG9ZRXZkYU1HUVFpdkdxSnBS?=
 =?utf-8?B?ejRyMW13NEhvV1NvOVlKU1IraDRMV2lLK1ArNkhjM3VyYWdZdlZPS0tEWFlG?=
 =?utf-8?B?aDMrcmM5WWF5UFlZbXhaV3hRSHIrUzNkT2EvRkxlclM2RE9UcEhtcFo4RVc4?=
 =?utf-8?B?bytRaTFxcVRpWFpoZjJ4bEJxcmtmRTR1SGNXTjZUaHUyeFViQjYra2xRWnE1?=
 =?utf-8?B?VmZ6YU5Sc1JLWlorZHJUVTN3YWRNZ2Fzejd1NFJXWmFTcVJqcldmcUN5Ujk1?=
 =?utf-8?B?dEVqVHlzemsrOC94NFd2Q2hFT0dGODlSK25MWFUrVnJRNnpFZUVWTUVVekV1?=
 =?utf-8?B?bDNaTFVJNUdFRDkxWHpDWGdLWk0xM25xS2lJbE9OQUpOY0g1SjNJNW9XYnJk?=
 =?utf-8?B?bzI1OWFKM0hyMkV0Q094d25XeURjREd5WERNNWdKS2VaZ1pWTjA0T0ZNYWJX?=
 =?utf-8?B?Y3o2Y2QzTElyTEZPVW5sdDlnektOc0FXMzFidVI4RnBGQmcwVGFjVzJlOHlC?=
 =?utf-8?B?ejF0QnV3V1BlQ25VaXJRQVZBSGNqZ0JVeG8vdWRiNFhOUEhEc0hrSDVNVHFI?=
 =?utf-8?B?WkV4ZllRcDZmUG9PZFIrNmIzWDFFbDEzeEpzekxzdTNKQnFRdXRUQTBmZlY0?=
 =?utf-8?B?eWdNMmJtQi92NGMyZ3Z3ZGNlU3V6Unh4TVdLN1FQSDkyejVJOFNuL2I4aUtD?=
 =?utf-8?B?OTl0Ny9idW9Ldlh4Rys4dEtkdktaaEpyWGlaZzkydWlQQkZ1WHZHQzNtZ0JF?=
 =?utf-8?B?d1I4NUFJMlNkakhSd1lkS2lvanJFNFlyMlBiQlI4cUVuQUJ6MmY2cUJ1eVk5?=
 =?utf-8?B?V1k3WFRjWVFhRXpqeXdHeWlRSnQ3U1FTMVR3NGZ0Nno0L01UZEFjVnJ1d1NX?=
 =?utf-8?B?eE1hOWtUcXVFcFczMmo4TGlqVVhKcnpiZldJUWlwbmFIaTNXWjhodVRhZk9W?=
 =?utf-8?B?TlJSTDBwbjNYRlFVUG5vaWJBWXo2TU5zQ1JudFVlRUJmN05EcEtNVSs1eDJJ?=
 =?utf-8?B?cjBzWnRXcGZJeG9DMnNiTXN1KzBNTlhGZmkxcE5RMU5SVXRhcWdUQkphSFBt?=
 =?utf-8?B?QmxNeEl6ME9xSnpiWDlmWGcvRTdwTFpTVVBnRlVvU201TGlHS0VwcEdkbkN2?=
 =?utf-8?B?eEhob1BLUzFLNTlSbnJsTU5jMG9wTllLMzY1Y2FzeHVVS3BHaHE2WlBpNVpM?=
 =?utf-8?B?NnZKZWxoL0FHWVJMaU5FRkZOcFhkNGora2xOV2p0UkFOUUNEbEtUTytKSXVt?=
 =?utf-8?B?K0RjbmVWeUdCNzZ4ZmRTQllxQ2NibTVwalgwTytlaXd1M29yS0xDVGVnK21k?=
 =?utf-8?B?NEtrcmY1bkhDZjA1RE1DbTl3OGk5d0pGRFVUT0ZjVDdPcXpmdDRjSTE3eXAx?=
 =?utf-8?B?VzB2RzBHR0xhZGU5ZU0waWF5YmxSNzY1dDZpakV4bk5KaDl3ZnIzM1ZKZi90?=
 =?utf-8?B?MjRyL2M1RUdKZVBVbE9QWEdJOHRmajVOWjNhbWxnRld4Tm1wOGgzNmg1MHRW?=
 =?utf-8?B?SWVOYlNvL21PbGk5Mk4xdWg0alRkTEJtN0UyL3B2dkVVc0lsTzFtdzgyNU9H?=
 =?utf-8?B?KzFpaVBTR2p2UnNyRVJkQjhwQ2RNMjRxTmFqZnFyRlBwd28yUnRqVUZDMEtI?=
 =?utf-8?B?ckoyRTJUWGRwWldGR1d6N3dZK3p2bXowNFhDekRKUHVYdVNuVys4L2JlUHZr?=
 =?utf-8?B?NjM4Wm85Njg3bjlnNDcyZkVUN2NkRExQY0c3WTFPSHBJaWY4VlhsYWl5aW9u?=
 =?utf-8?B?ejJsQjVUK0M5ZE9nZmJxd0pZYk1PaSsyNTBBNTQwb3VYUUNrUTYybnl2aUYz?=
 =?utf-8?B?dWJHdmI3ZDl6SGJHVEl4TmNOSVNkNE1zT0RoNmhuVVJWZWxLUHQ3NVo2Nk9F?=
 =?utf-8?B?MjF1K1dpNEt1dXdqZDhSYUJDMUI1MWdvTlZJSVZYVDJIOFVsREVZUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca8555b-9b12-4812-d758-08de86b898fd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 19:40:53.4826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bviJ8idUuud+1OrB/+5/Hm1I2t8vqojVD5cbnWLJ0VdupLu/p+cY1xgokQnoFukznhEFnteaxWWaYh/TJinRUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7262

Hi Roman, Miguel,

I was delighted with sashiko.dev after just a very quick peek at a
few of its linux-mm reviews. Up until now, the AI code reviewers
have often fixated on trivia, but this one goes right to real
issues that actually matter. Sweeeet!

So what would it take to get similar results for Rust for Linux?
(A bunch of us are working on drivers/gpu/nova-core and 
drivers/gpu/drm/nova, which are written in Rust.)

I'm guessing a combination of "add rust-for-linux to the list
of mailing lists", and a whole bunch of new Rules/Skills?

thanks,
-- 
John Hubbard

