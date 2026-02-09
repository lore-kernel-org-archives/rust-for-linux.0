Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0855028506C;
	Mon,  9 Feb 2026 02:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770602416; cv=fail; b=A5rjUQSZEBKRDIQc18FudkoLEH2plwAqgRxdiqCOPvl7ONSnaybJusRqA1ZLbMFRzveKHQ5a5hrlBc0b/Qm/t3PxETp+jrVUQZPJSNdnORHyY677h8SvZZcMCByFv88hEo71B2dx/rUPd/yy6vCKN9rBNsiF+D3P1mG8JlSjcv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770602416; c=relaxed/simple;
	bh=9YpcYzwVf0R4Q4TkODyp0Y/ix77EvDf9VIELWs7wnQY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nN0H2G/MYyuMrUXSkJc4QOARPNVlsbyYUHSSLTR2pfE83YyZ7E6Mui4Cumq48wkxG1AdTozPACrmjkfY+1pl9uExGWsi5fSo2Wh5kSqsFHsaRr37zu0Xv979q8HvdbBuV4BIpiiHpSolTUUpq7gSr7K9eoRpWlac12bbQwtcjG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N0DOSn+7; arc=fail smtp.client-ip=52.101.62.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N0DOSn+7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVxuOx1ThYcTCrzF8+oeGjGCFGStpgxJz72/zmXTxe+GAk0sa7yMXrv/eYhBPdDKsUpsICWzymudaEXl5r79cOe8MeJQYJgZwenM/iIn/pyDrxTyN6HUA+DYRCu8OYH6yZCVnp9w0X01YWnycyNxYifm9P4Nu1wJ8y9DUVdX49gwQ95pJYefB01kGG+xIbRq17MFJ6OdYsUcecJ5ML5M7+0PTtx99/yBirxj979NWhptZXPy6yDuxxQ8wlPTYog32OMJvFyWSWKkvP6kV+HmK3jwHdcGgbdnyK68BwA6Qu/aKbFkR94Lu6gyUK38oujT5CkoUbaZWIUUEVCZn2Y98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evU/LKvyvXUyloFK/5xRJSmOqfRO37dDu3cqsaNJSCs=;
 b=MAY7MuH2UsGj29LC1e6f6NPgV+0EDSf2vcecpI9OXFGpenAkYT23d590Hbojpnh9Xt1rBUrtrZIX+eyW4p7a8gwSdwoE/IEt9uRKuhkCY6AXfRIQ1SWgskWvT1hxZWWTaKakyDYDB2h/JEx9YYH/k5wTbMtzW6tioQAElAuuJBcCiYVeFAEKd0efbMuibm37BUzR4t0cjjZmE5DZPC8Ji1FaVajJmZ6KPHCtScuUTKRHPUu5UQlxkWCXwN7z+xtgPk2ww77dJxLdWFdARDs82VnG3hoyXF/7NwyOSjKeBDD+k0NcB2kyBGvsAzj2SwZmxjRWv0IliGb6hTdXOI+89w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evU/LKvyvXUyloFK/5xRJSmOqfRO37dDu3cqsaNJSCs=;
 b=N0DOSn+7i7/u8BS+MnxiWHAHHkmBfVDLsJa5B2GuxekwBvshgaSsN7kZ21tZUteDUgr4Hk+TPBVmixhnz76RtW0QcNMaCW1+IyD/qQNwyGZbMrSumvzrDqFC8sVLPg2JoKAK9qSsSM0C5afhlIyjb8aCeTq2uhlfkCybA426FiwlQNvyHZcCHOfXIA13+43iHKKz8ORkN2IiSmYJoVe7a0D62idCgrUxLQ9Zyn8kSkiSIYTKnUhgQ2/gGfcShARoDW+ObaIbVuwFShfrH11clVpycm+3PB/no78vepAKNcHJP/QTHSmK4AmuvHFN1JArPrObixvHNO/vQBoY4Ams2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6493.namprd12.prod.outlook.com (2603:10b6:8:b6::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Mon, 9 Feb 2026 02:00:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 02:00:09 +0000
Message-ID: <dda626b9-d2c4-4432-a669-4ae3c4c8b5ec@nvidia.com>
Date: Sun, 8 Feb 2026 17:59:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/30] gpu: nova-core: Hopper/Blackwell: add FSP
 message structures
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "aliceryhl@google.com" <aliceryhl@google.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
 <20260206042123.303281-21-jhubbard@nvidia.com>
 <5dc22163e8a6aee95e1c476428696d17b78673a5.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <5dc22163e8a6aee95e1c476428696d17b78673a5.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 067ae87c-95d6-42ef-0b34-08de677ef42a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VE03M0M1WDhjWnNkZldEOXpEOUZiTEtnTkhPQm8xZi9EdzVPbGtBNWNjancx?=
 =?utf-8?B?d2JaUXB1R2ZsczVGV3A1amVyZUdTR0d5OWN4dG00dTdVWHBEUDQrZVpaaXFS?=
 =?utf-8?B?NTl6TmN5SWZCWjdaK09SaGhWR1VKM04yYk9YOFV6NHdvWE1LVjJjc3kwelV5?=
 =?utf-8?B?bG5GUHY4Y2Q2VmhzUk9MWnB2d0NLK0VJRFVUWEpRb1JKNFhTUENvYmtEY1lM?=
 =?utf-8?B?TU90dFRJN3ZuOXJ0RG8vUVF6ZFZrOVgxYVZ3MW5hOGxXZnhSdW9JbWo2YTQx?=
 =?utf-8?B?YkhVZmlDVEhYYXdseXZ0SThUNWlHRUxRRVJqUGg3ZllKNys1L25ncHpTZmx4?=
 =?utf-8?B?Z0ZoaktiQUY3aVFHVDM2dWhmekQ0eFNqeHJmdFMxZ05GWDZGZnZHUlJrdXlK?=
 =?utf-8?B?V29CUDBSUDRGaEVqRDRmQXFRUmZqKzdpRjFXYWdhdFdOUENZTDAreEtzRHBv?=
 =?utf-8?B?aSs5ZGcrWmJiYVFSRUNzeEM0RCtlay9oNUFiVkw2bmEzMkc1YU9tcmphZml1?=
 =?utf-8?B?dTdQL29pVjJ1cjE2c2dKV2dnSTdURlphU1hFeG5KVE5EaTlacmwvbXdEWndT?=
 =?utf-8?B?a21sT3E4UFNNRHRxcy9ZTkQ4ZSs5cFNhVmt4SVJLTDdXSWZSNVZTWjY4S3VM?=
 =?utf-8?B?SUpQcjJjMzQvUFpKSHNTVm5WWnpnaFVXT1NQTGtiRW5xUHpuVy9WVTk4cmdw?=
 =?utf-8?B?Wis4MU5LK2Q4MUs3V1VNb2J2YmNETGNNREFnNG1wMit1VUk5L1BjYnJtNCtt?=
 =?utf-8?B?M055ajRhVS9CaXB5QmNUWFhMak5lVnBrVXNGQ1c0ZWsyb3E1V0toMlNvKzhm?=
 =?utf-8?B?c1BDbzcrYjlCSnFNMzlLTWh1ZmRHcE40MDN5V2wySlNZSmgwaVRyb1RhNURG?=
 =?utf-8?B?RU56N01qYy9EcitPR0tuNllWODc1M1JYY0loTEdCOGZhVGRma3RIcVAyL01X?=
 =?utf-8?B?aGw4T25MSzlXMnpGbktWd1Zsek5VeDhFUzFacTJiMUxNK0dFdWNXNVVvSlgy?=
 =?utf-8?B?ZEoxeC8vMEtKTTg4RlBwRWxTTDhmajBhbmtMSjZrVS9CbUo4SGRMWWs0VkJw?=
 =?utf-8?B?U1J6dHBVelVicTVodG56aTJyanBGNVJjYlRLeUhNWDd3SlJIb2JONU80U2gv?=
 =?utf-8?B?VllrOGdYV3EyZmZRVGJUOEkxMXVrUkRCZ1FYSXl2eko5SWRQV2lJNGlMeFEr?=
 =?utf-8?B?QkRJbjZkV3R0RWJ5SjVxaC9HTmFRblBTajdaTnNkMUp1YUlyQWxrTUtyaHJ1?=
 =?utf-8?B?cjJubS9VZnRGVklsdUhHc2pJSVVqcHpCZFdBemM0dTV2Mk5kbUZwRU55WmJp?=
 =?utf-8?B?SGwwTmxSb0YwZnBIYnhmZkNSTkJjZ1lwODFyYm1WRSttZEhMaFMrN1dGYmlV?=
 =?utf-8?B?a0wyR01sdG5KcVh4RGFvdkdQQkR3dkNkSTZOeVRFS3JNSEJMODk5amhWZEdv?=
 =?utf-8?B?ek04N1pxTmhLcXdSbVhPTXptc0Q1NkpXSW9NaUZCNk04T3M3TzdMVzVQRmxR?=
 =?utf-8?B?d2QwVit2Wm5PYUErSXR3WDdxVkpLM1ZIZjBSc3lRWjIxZUE1bnhmOFUvQ05H?=
 =?utf-8?B?QnYxQkFhaUg4Z3I3Z2ludXpTallRU1FhYVczUmhucjRMUFhBYnhlQ1kzSVAw?=
 =?utf-8?B?Zjd0ZmNhRU5MWDIwN3FKWm9EWFR1dlhFK2V6Vms1SGJlall1WWNyNG5SYjI0?=
 =?utf-8?B?bHdKY05sMTJidzRLc2Z5YUJQbWk4ZTFBUG1jN0lickRWQy8rWnR5R1VjdzNk?=
 =?utf-8?B?S2RKcTJyMEh6SE5TUDg1QmdBSk5BSG1LY1VaSnF0MEVDb05iak4rTDRBMkZa?=
 =?utf-8?B?QzRYYThuZFJraFFhYzNpVlY1RzVqOHJCeSs3dFZEMXhWdDdVM1EwbVpxanZV?=
 =?utf-8?B?TzBXSUUrWWJkd05YU3Q1cFlabUd4bmNBb1BMcjJnU3dKNFIvZTRFVjZYenBU?=
 =?utf-8?B?M0RTNWU1Y3hRZ2owZGpGalh1RSs0SnIxNldlcS9iNDFSbWlYVTkzQzFHT1Y5?=
 =?utf-8?B?U3pGRU0rTVM1MmI0akpDRmdxWnppeEM3Wmd5aFF6ajZsMTBHa0VQelFYejZB?=
 =?utf-8?B?M3lEa3JCb25nTzk3V2dLY3B3NU94T0M5UlNGZHc0emtXWnBXdEowTjlDWkl6?=
 =?utf-8?Q?b+eM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEZTeWZZL0Q0OGZ4YVBLdllkNGFId1lXV2hEM2ZIQXNIdUJjMGlRcGhXcG50?=
 =?utf-8?B?U3VwVXQ5UjRSZFFqNlQ5M1BhWFVFa0k4RWkvNUplQjN1NWNzTk8vZE5IakND?=
 =?utf-8?B?TWEybEhFRFdZcXhZV1JMTmVyWUlMM2NXZjY5RnlWR08wck84MXQyWE0wSFcv?=
 =?utf-8?B?N0RhWnJvRGtmeXBzUG5oc1hCZU1vcmNvTXBYT1g4aFJ3MlRTbDF3VHBUSFIw?=
 =?utf-8?B?UWRsakg3ZU5IMCtEeTRFNzlBR2h1UWZxeHVqMjkwODVVc1lhV0xHT0J3MmRx?=
 =?utf-8?B?MGd6Zk1tZU5HaWF2dHBxVFkwVDZSYUVJZ3pST2RkNm1XWGwxSjdpZXpkbitL?=
 =?utf-8?B?MkpZcDIvSFREWVVWRHVpbEUrY1dPVExoc3d1L2doSEpPLzc1WnlMOHM1NEdp?=
 =?utf-8?B?cWRMZEJCRVBKdkNwK1E3c2Z2eXdZbFQrVHY0YUpOaUFaQ0FwUnhwK3k1dXE2?=
 =?utf-8?B?TzN2bHBKTDB2WmdtSUYvaVJDMGxSd2pBSkxNcWhxbEdMcWVlQm51MlRoRE1s?=
 =?utf-8?B?S2xROFNpMUFkS2dJY1dWTDRWYkc3cm5uSkFrUHcvL25DakJxRHcvdjRXYk55?=
 =?utf-8?B?VDg0VzVHRXphMHNzTDQxV1p0M2ZDc1UyajdoYThYbHFnT1NoMUN0UDMyWGdt?=
 =?utf-8?B?MlBCS2lyTEhXL3RtM3hQS2RjYUhBYzBNbFZsQVFKWElUNWlIRU50d1NNM3Iw?=
 =?utf-8?B?OFhmakxaKzN1RWxuL0FCVzRyOXlVZFpPQ2NTUmRYeVRCdDlrd3RPVHNPRy9x?=
 =?utf-8?B?MDBERGlSWUg5ZUFiYUk2c0hZL3JDSkRuWkQ1bXZqRGFTV09WODhlRE9URFU5?=
 =?utf-8?B?ZXVRd3hrWGxpNWg5MEQ0T0tEbGhQaExzR2JSOVBnWWpoUm9UcmQrOTg3MWFU?=
 =?utf-8?B?Q2M3SmNDTDdGOFhzdFA5YVBoYk9ydlMvV2NjNm5rWGRPcHhZU3ZlMFBZajNG?=
 =?utf-8?B?Tit1Wmc4dWlWdGcrV3B1aFFidFIzdjRpSlNQYUhqV2FpblAzUFpIWUVObjlk?=
 =?utf-8?B?VjZWMDk1d1JPRVFheUx5bG4wMlk3UlNpekRRanpBbXJtckZJdVRsWmdCSTdt?=
 =?utf-8?B?VlJVbzVvSVVtWjZzRWVHbVkvS1VVQ1VaN25GdGUvQXlIL2hjS0l1R2NxQmpx?=
 =?utf-8?B?VmdBTE5tMm9zYkZRak8zTUJoWW16VkpFSzN3RjdRSlZrWlJzR0lpaXRwUmx5?=
 =?utf-8?B?NUpWeEwvSVFONi9La1hNZXh0K0Q2YVc3bWRkWkhlejRXNVVhREpkQ1RYVTJB?=
 =?utf-8?B?MENld05pZDRlK0RzR2YvSC8zK1ZHVnIzRkxwOEJpK3ZMWk5LK3FtSENDQlF1?=
 =?utf-8?B?WkQ1RmQ2V2Fjd2hjdExlaVprSXZKSkVpWFJPZjRtQ1JKSUw0OEk1b3hNTDNr?=
 =?utf-8?B?emo4eHdGaXBVSnJyWmxCOC8yelExQ2NjeGQ1TGJkS2kzWlYrdS9qamJxTnpu?=
 =?utf-8?B?ZlBpbEFMNXROU2ZidlF1dGVkQ1M0TFBDTERTVzdxdDN1K25aOUgrRGJmTFVn?=
 =?utf-8?B?eW5WUnRLZExHdkpHZkhqMTFIekxZZVpKK0UzZ3hNNEkvU2tGK1lLaC9tMTJl?=
 =?utf-8?B?bk5DYTJ3Wng2cFRjc2xmNmRaNW01ZGdJdkdqUnliTC8zUGVOaTdCdDl5dWsz?=
 =?utf-8?B?d1BxRnlsK2JJRFpJREFLMGlYYStoVWdjU09jR1lnb05QK2FKMVdPMFI0SGNK?=
 =?utf-8?B?V3A3YmxYT05LRE9qQ2tzb1lvTUNHcVc2VTBrNjBKWFYyaURkWjgzSVZ1Y1di?=
 =?utf-8?B?c21oa0RGYUR5amhqNitGa2dtZS9Ld29yWEkzZnZEVnJtVkI1NkhsbzRDWjFE?=
 =?utf-8?B?NGJFSlVxMTJQSm5mQUFwM0tnMWtxQU5QUVhnZ3NhZ2F3ZkRqd0FhcFB3dDVN?=
 =?utf-8?B?VFhKRVR4NGxueWM3Mi9XUjNBRnZWK05jQWNkRlE5ZmtGUnVPYW5iRG9uWHJl?=
 =?utf-8?B?N3dhUWxyekQrTjVYbVVvT3Yrb2UwaG01VlNJNXN6WGw2WGVqZWhsTmJNbno5?=
 =?utf-8?B?WURMSTQ5SFFXUk9UNkZtS1ltV1RkVjU3dFJSY1ZTa21tTG1XYW5HeVVmWWhs?=
 =?utf-8?B?VWxBczNZUlVkQWZHVWN3aGtnV1JtWUI0dzVFSHYzRDZ1MGNPUFRkdVNrdDIw?=
 =?utf-8?B?UnpFZWlkNVZLYkxScVg1UWtoUVNxUGxmQ2ltZE8xUEpoMUF1cFZHYXZhV1Nu?=
 =?utf-8?B?b1VXSXMrd0dNS3VzQWpGdDhIUFlmSTJFOC9qWUJOYUtmeE9EK0IrdnIwTi9s?=
 =?utf-8?B?QU1QdExXNnQ3RStrUGF5NklhM3ExTERudTU1WXJmNHExYUh3NDFscHZJRE1T?=
 =?utf-8?B?R0phNURnbmhaNHBreUtvQ0FtYnNxUHRBVEw5N3NkWVZLY08zWWN6UnprcG0y?=
 =?utf-8?Q?Gu5WKH939DdjYbro=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067ae87c-95d6-42ef-0b34-08de677ef42a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 02:00:09.4510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdO1qI5CB982vgESCs4Mn7w3Rc4YA+0Q9/WVOU81IGiYw2tV+/oSn0goCJeJGh51WXO40mhMVWdJgR/U5Jk5gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493

On 2/6/26 11:41 AM, Timur Tabi wrote:
> On Thu, 2026-02-05 at 20:21 -0800, John Hubbard wrote:
>> +pub(crate) struct FmcSignatures {
>> +    hash384: [u32; 12],    // SHA-384 hash (48 bytes)
>> +    public_key: [u32; 96], // RSA public key (384 bytes)
>> +    signature: [u32; 96],  // RSA signature (384 bytes)
>> +}
> 
> You're not treating this fields as arrays of 32-bit integers (and semantically, I don't think they
> are defined that way anyway), so why define them as such?  If you change them to [u8; then you might

This is fallout from my going back and forth many times between
formats, during test-and-fix bringup.

> not need .as_bytes_mut() in the next patch.  This also avoids any endian weirdness that can occur.
> Plus, you'll be able to do this:
> 
> 	hash384: [u8; FSP_HASH_SIZE]

OK, I'll do that.

thanks,
-- 
John Hubbard

