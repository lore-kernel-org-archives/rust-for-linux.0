Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011022.outbound.protection.outlook.com [52.101.62.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D60EEAB
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 02:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769221621; cv=fail; b=CA/r7s0WEBVM0jPrQ8se2riQuf8P0Riw9ZTt2PLqrkVgJBwQsnqIpUhb7ijR5JltqI77eJdUOcJY2xz4LlTd3/obcEL/6LuvLKg5lqZAsnXDxndiJvJGJOTGq9KdvSA/B7yWvHdzOaAsd2gmApbiGZDSOGwE4ULjgB57Tj+BCyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769221621; c=relaxed/simple;
	bh=kz4Cw4n47Ka258uyaAccE0oYVglaQed+C9VP04XXrJA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=oIqRaZaisjOIfwWMRP+42kK3t1iWZYjBIP58kkudM/bU/HVPsHxNgQDFMir6CJJGIziftCwF1z4oR8TOJKsiv2674lZSCJv9KwijMyptX8T1z+47m6SlxhvYi1BIw/kRjWY/V4eN8LuFAV3NGH+rY2+xs5sno5l5c+j7YwhDJc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jkexv+v0; arc=fail smtp.client-ip=52.101.62.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jkexv+v0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAA7+KTOoElQ2kx06loLmCHbcLGMFJAbLBObxueh5SeL7wAsl3csFNjmpDP8t4RCymSAKK3gmxfGZfi5pFMWq9z8GH5QWBJyr4Ty55r44cS3RFc+9Ppo3nDim1Ypj2gBvKxjnMiKE1b54+dC1SlPe7OtgdsvEGy1M5R9amx/5J7UhEFN3ibnpkcQBWJm92Ri13tI3/vrPqLgkO4GApYle1Yfh/rwQJemxxm6Sk5Ky1/UN0fgJaEftsrnCDfO3jJkeaMO4RY9V6Nt3qAvlg5betWnbLajrZykdAV4NCF1aq0jsCXaQph9JFYufV/lOB1kYXPQT2GE4fuxYwKjmFAJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kz4Cw4n47Ka258uyaAccE0oYVglaQed+C9VP04XXrJA=;
 b=t3l1b6oKKXLrCcSTw8i1fGhfSz6EJBX0tSV36szgACweE1XfCLOP1SmMrxxBhBFDMTAnXo7F/1X5rUpK2MgqvORsEPnohuJ9YpUrfdOYnTyRwNZLTDRpqXVkB9V0gli/EBjTXnNOpfnGs6NwbEa4p6fq7RjmJDtNNL6JSNXEHDLl0rKvwIRxPFx+zHPautVbZj52ZHMBj82W5/A/rR97q8hdak/Fib6IqId/RCLcCs7Vn1b5QW7K+cAD4DlQzw+GDItouOS6nD/QeIQN45ve3HQbRA8Xn4yVbpER4dVdMZ5bj1uoykPruY/9lnHgWzVy/WnvIEJ0DLInSjNllBEHhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kz4Cw4n47Ka258uyaAccE0oYVglaQed+C9VP04XXrJA=;
 b=jkexv+v0aNPZqypiTXTOgIb9qjjIIc/1LFKrLs5OYS4asvlv84VTagG8uw5XdsqnsKLEZgdWraFcoMTKQAOz5rGGE7tRssOhaZ97Xq5QoNvigYh+DFzuOZtWiVkpIxA2RrLQ0U1YoD8GIq2EshSmtUezjgmuCR2s3LRR8d7k8x3ML0rdWhv1XrZ2wZ+2S+OaGVIxrYbD3Ueh6/bL5HNOif7riBUghrW+91RHVnMnenRh6nYanB0NWoSog56ps5kS9Batar9fNcDaKmxwabAnkZoyrRgRQTVpm8krT+dOQiJGxbCPhZW44/FkdMYIrK3xbotf18O6xNPU8DcJ+kMqOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8645.namprd12.prod.outlook.com (2603:10b6:208:48f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Sat, 24 Jan
 2026 02:26:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 02:26:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 11:26:51 +0900
Message-Id: <DFWGPVUB7Q7O.XCM4MOK1SK2T@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v8 09/13] gpu: nova-core: add Falcon HAL method
 load_method()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
 <20260122222848.2555890-10-ttabi@nvidia.com>
In-Reply-To: <20260122222848.2555890-10-ttabi@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a05a67d-76d6-4f0a-be21-08de5af00bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2E4M0E3cnBZMGpsczlBck5pOW40bzBpTUxxazEvTzNrejJ2WHFVLzdwL1dv?=
 =?utf-8?B?U1BRYkNmTFVmd1gxb29PUVA0SUY2TjVVeXE2UHlyeGFQRjRqRTRWN3MvcHlW?=
 =?utf-8?B?WlBRNnh1aFQrdTE0dWRNVExmVzJ6VCtwVUEyRkkzM201ckFOMGpDMlBZZjRr?=
 =?utf-8?B?dUl6ZnNtTEFvT2w1cG1JWlRwazRqcmFKclNuUm5pMFhqRXlXbHRDUDZyOUVh?=
 =?utf-8?B?VFAwZGpka1NIcEZ3cGNpWHlkTHoyallVQkcvT2pLdXorSEthcGxVWTBxN0R4?=
 =?utf-8?B?VlA2YTd6eVpJSVlsQ292dzcyRkdSbGx0YWJFa2p4TDIrR1F1SGFJYWJ6SS94?=
 =?utf-8?B?QXJ3MGVoWnppWW1FdHMvQ1FLRzRyV015Qk5vWWh6WTcyYWxFRmk1SG1DcEF6?=
 =?utf-8?B?dXMvZHJibTc0RGlmL0tLazBrT3RURUlCZkVtNDhwVnhnZFRWMEp4emJZSTNo?=
 =?utf-8?B?OXBlQnJwMDBOaUt5SENMMThoSDAwV24xdm9YKzZQR29MSElZMG95K0VDaU5B?=
 =?utf-8?B?dEtaOUJ3dFM0VjJHVjZsWWhFVkFvNkRGTWRRajU1R0V2dUN4UGtRcEdmclhj?=
 =?utf-8?B?UXE3TWRrQmY1djI3d29qQisrTnl0bHdRU3hOcnh1UUNFMXVIRHFlTXBMdEh2?=
 =?utf-8?B?Y24weVo5cUxFdy9rVXNlL0ErenMxZUlkYTBuYjNjaTBKSUg2TXpvaWNtdUFW?=
 =?utf-8?B?YXJydTgxZk9HNkVqQmt3YUFYcVd5Zjc1b0lBcGlKOCtHVzNodWJaVzdnWGto?=
 =?utf-8?B?bHZrdWlUcDJJWm9sTXNEUEdheUN5MVAwZW4yc1c0VzJZQktpVTYrQUxaVXRT?=
 =?utf-8?B?czRpemRZVGpjMTl1MDF2Yno0VVNKSS9KZS82MmdXNk0vMGFLNklhVXhnNWow?=
 =?utf-8?B?QjZvcUJaakRFMmQ1YXNoTERkU2RDbGdpU0pVbGlmclFpb091QVNOZVNxb3M4?=
 =?utf-8?B?YU9USVdoQkJFdWlBT0djRy9WWmlwUlozbVhwcXhxZStGVWNZSFhybnB1YmRk?=
 =?utf-8?B?a3Zid2NLdnBtUEErUS9CNSsrWkREZGZVQnU5b0xrTkZyeUp4S1psVkxHMlY2?=
 =?utf-8?B?TEVsb0xUb0piL3ROa2tSY3JSUzBMUE1IU1M1K0Iyc0RNczZhNWhJVm1IZVRP?=
 =?utf-8?B?LzFoekpYd2pRclZqb0lrMEE0azNkNmNrYjlsbkVFdkJFS2xYUGdZVGhyWXlQ?=
 =?utf-8?B?WFVvN1NFdUtTd1N4QU9mWWFlM1pZVHVWSkQ5TFBXSytPcmU0azJxMWIwVTZJ?=
 =?utf-8?B?TFppYk16US9lOFVkeE1qOFp0RW5pNTV6UGNwS0VHUzZSTDZiSWpuS0F1aGdz?=
 =?utf-8?B?M2FLblNLUjBpOFJEcFFmb2hoWk83TUJ2b253a3JGa05ZRGJKbEdBQnN4RU44?=
 =?utf-8?B?Y1JnWHFhNUc3Z1d1UGlEQzhQRzk0WUFXcWcvaHExR291U2tvdFJ5QWlwUWZI?=
 =?utf-8?B?S1Z6ZER0VUEzaTVLenRKSnNrV3lZMGcyQ1FZa0EwZk16VXNNSi83eWRPMU93?=
 =?utf-8?B?NXpXMmlLUE1lR01BbEl0WGZBb0s3YlpGSk56Z0s0TzlFYS9lbUhNUHpzVTVh?=
 =?utf-8?B?LzMvd1JBNUNSUnVrWkVlVWdWYUYybW5GWkMydTBjM2lkcVA3dDduRFVrYmtm?=
 =?utf-8?B?WStYdVhtT2F1MWhJWWJWTWd4aG9pNWMvN1BCaURFeEFkemxtV0ZkeS9hWHUr?=
 =?utf-8?B?bEVYMWwraGhYeCtLeUdTT1ZjRnJWNk81OFdWTDR6UGF0WTc4UGhLQXkyVjlt?=
 =?utf-8?B?SjhxYW9Sam5CVzJQdkNHRkhvL3dmeC9rODlHYS9ZZFhCSTBuaExTWGVVLzZZ?=
 =?utf-8?B?SUVhdTJQem92UmJOa0ZOblJOdXplcU4vdGNlVlNCNm9IeFg1ZGtRL1dULzJr?=
 =?utf-8?B?UFRNWllLc2VBdEorUnRlM21tenFyTHdkZzJJVG5RNktrQWIyaVQ4VXdjRUFv?=
 =?utf-8?B?YVF5MFVuTHBLT2k2ckZQT05hakZ0ekw3VEJLNThNSmZNRldyMXY2SStibUU1?=
 =?utf-8?B?NGUyWng2QnZWYU9YeGdWVkMzTXlFWCtoVUJZZzAyaWpta2N1bDNNZnFZQW5S?=
 =?utf-8?B?NzFMQjZqeERFbUVqM1crMlRoZW5NOVZIbURDb0FLMUk0UWF3b21pUFZ4TFNx?=
 =?utf-8?Q?OZkw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnpaS0MvU213cU1oajA2QlZETmZ1N1FTYjJ1OU9BTXloanpZV216cGlGYTl3?=
 =?utf-8?B?eWlvaGZ1SW9VOVlKRDl0S0RxbzhXZ3ZaOHd5cGVHbWp4ZDNIa1p3ZXdtVGlX?=
 =?utf-8?B?YmpEK2dSVzBMbUNuMy8wcVU4SjNaY0hwODRjN3V6M25jSHVEa1ZjMlJzUWFQ?=
 =?utf-8?B?YmJYRXd2ZXA2Y3dVSk1Zb0V4T3JnZ1dGak03M2xFVnFlWUZHRkphVVUyWUlz?=
 =?utf-8?B?aXJ2Y0p5azdGNzFYakdzRjRSNExVT0FwaWpVemFXdm9neVNlRkJCQVFGMjAz?=
 =?utf-8?B?YnRMbTQxQ1BhSHFGb050MXV0dEswMVNFTENDaVJVa2hRUmFwWnhZNm93VGhL?=
 =?utf-8?B?WmNmM1NYSjUxSUtSZ1k4WXVzdThwSGlQTWx6VWVyemZobkNjRDhBS3RDZ05G?=
 =?utf-8?B?dHFxa21TNTMza2JzeFhzNjYrUTBweXVhV2loVklqM3BMdFljOUNSa1pTTjVZ?=
 =?utf-8?B?V3BiRVdzczhEMEp6bzJEakswMlp4NEo0dithTWtZQk9ZSTFsSEtmc3Fyajhu?=
 =?utf-8?B?d3BpdHdrSWpncDExYjFQWU9MaC8yWmgyck45N0hJYzVEZzJWb0JmT3ZoZFVY?=
 =?utf-8?B?cmNRbXpJZTc5TEV5S3FUV3hTc2FJYWd2K3dsUkwzTzkwVXJDRVVVU1I1ZXhz?=
 =?utf-8?B?U2FMYWg3ZXFjZVZNclp6U0VEcTFrYitjRENYSlRuNUtXSHg5YXdsK2dVeFdD?=
 =?utf-8?B?c2JiaW9rTThMbkdCNXN3cVd1Z3h6Nm5mR2phNER0RWh6Qlo5NHNkOE5KREhk?=
 =?utf-8?B?SUVKaFU4YjRCUURJWHh6Ym1LS2lSdFRybklIZGJyeHZhUDZHd0RHdUdnMFhx?=
 =?utf-8?B?VTNzNXZNTDVEWDlCcjg5TDJWaDFzQWFzQnBSNDkwUHUzYzZMamVjQlI5VWs4?=
 =?utf-8?B?WlVnbm5Pc2dERUxGa253Y3lNb29CVkZVWEVCL0Fud3IwNVdDdFQ1WloxM3Rr?=
 =?utf-8?B?Y1Z3RW5jWmdxZVpYOHl5OHNaTWw3enhDMU1wNkpWODFEWWRJbWxsWXRJVU93?=
 =?utf-8?B?bHdwWmJ5SGdzU2h6R2ZGc0s3RWFGQzlTYmhSZkpEVE5QRDZsdWRGTklaZ0hM?=
 =?utf-8?B?NTBqMkNUemZpblNXQk9Hdm5kWHNLajRpSWhaL2k1NWhNYmJjdmNNM291djlr?=
 =?utf-8?B?cStITXZZRDAzOTQ2WGZQSmFrQzlyUmtxaE9EMXU5TFBBelYwaW9qT3Q0QnhM?=
 =?utf-8?B?d2FtUzZ3MTlhemNFRVhqQ0ppK2UweUVlaFlBUWNKK0k0cGE3b2pSYWp3d0gv?=
 =?utf-8?B?MVRMOE01OUVnSjhLVFkyaU5Gc2Q4SjRveXg3TTY1YWtEcGhqN2lyVzJ3WVor?=
 =?utf-8?B?S3kzaHdPUllNa1JIQXNCWERrNWRZS2FuM21FdG5xa0pNZ3U4Q21YQzNPSTRi?=
 =?utf-8?B?ZTJMc2pXYitvTS9QWURLZzZIR29YQkh6bmU1V0QxVWdqTnpEK252SS9CUFZT?=
 =?utf-8?B?dWhpR3ZLTzQ1RmZDQjFyMU8vb1N2WmNrazhRTjhic0RtS0F4T2x4ZHYxZXdO?=
 =?utf-8?B?eWd5RWdpcGJOUkRUMkFvNFVDZ2p4Mjlqbk9iTWVNSktLYzlhc0N3N01zTHJa?=
 =?utf-8?B?Y1ExdWVjb3lBcUhwem5nT1NielBzU3VYVkVKdkpsOUNpcW9QUldNbGlFbUVt?=
 =?utf-8?B?d0QyWE4rMFM1dHoxbjEzMFZXQ2FtVGVoYWhsNC9qWEJuMkJQRElxYWdWRmZG?=
 =?utf-8?B?Q1VxWXljM1Y1ZWIrVGVuUk9yd0tWbEFxTTNRZGVQb2N3V2FuZjMxQWo2WU9v?=
 =?utf-8?B?dnZON0lOSW1XRjBjbDc3RE4xOEpsdnlTU3M0eVpYL29WZDEzbksvd28xR2JT?=
 =?utf-8?B?dVVkeU5kcS8vSTFIMlp1dXZ5SUIza0twdmVOamhIMXNOWWdxMmV2eklNMllW?=
 =?utf-8?B?WE8yLzNQaXpaU2d1ME1wTDJPazQwK1RMK04reVd4TysreTlmSUtkWFUyakhM?=
 =?utf-8?B?WlhXWHdUVDMrdDhBa2tNVTllS1NuKzhwRFBxZHlMWmJ5OC96ditHclgrbG92?=
 =?utf-8?B?bURRaTBUNWs2QWczWjVDZlpRSGpBNWhaaVBYM3VRcDZ5bWhUOHpFZEozakQ0?=
 =?utf-8?B?N05jZnpRcVgzbjIwMTJyUU9HNzQzL01Oa0ZiZWovalJuUUxKQzVCa3FNbElX?=
 =?utf-8?B?NE4vcDBLVlpUckhpRWxRVXRvUGpQclZwaGlXVEp1Z0Z3UlBOWGNDS1JFZW5l?=
 =?utf-8?B?dlhFQjBZcEdPUmNYNzZEY2lrbGF3c3psS2ZVVU5oOWVjWmY4aHFNb2s0L1dl?=
 =?utf-8?B?SW5vbnlEZ1N5b216VTdYMDlKOXg0Ti9UQThqdWNOYkhhU3U1Si9uQm9weDBF?=
 =?utf-8?B?UjJONWZ4cDEvbFdCckI3WWJCT2d6bUJUMFcxaEVSY3lpcG1qTm9QM2NLek9p?=
 =?utf-8?Q?3OBp5ujhe6LeyHJ9ulO76VOWaGxq59C7+GK7I+w0AJKcn?=
X-MS-Exchange-AntiSpam-MessageData-1: JFNYL5Z+YrO2IQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a05a67d-76d6-4f0a-be21-08de5af00bd8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 02:26:57.2802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3B+DEExfUMocj6ggI09HMeLeMNPzTcBV0Yf1MzneyHQ2Dk6gkdb3bDPVWcdTFmrbEV/I7V+phL27sy5X/vXzkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8645

On Fri Jan 23, 2026 at 7:28 AM JST, Timur Tabi wrote:
> Some GPUs do not support using DMA to transfer code/data from system
> memory to Falcon memory, and instead must use programmed I/O (PIO).
> Add a function to the Falcon HAL to indicate whether a given GPU's
> Falcons support DMA for this purpose.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

rustc 1.78 didn't like the unused items, so I have picked a small chunk
of code from patch 12 to exercise the HAL.

Also made `load_dma` private as I've seen this hasn't been addressed.
