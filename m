Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07745258EC1;
	Mon,  1 Jun 2026 05:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780290096; cv=fail; b=c6Qt/R/gASXjazaKsSbfjATrQA7sVyk9ebgQLv4XrgScgMT8AGqxqqqKVXB9iHMYQ/nVbnPRWZyMl9nWStX13t6Yo/2Ia1R1viNQDHwQPhcIYU0gccISA4DfNUXTyUsAQcRflMeaasA9Pfs42YfguKksSDVWx8xAB0oi0GT0bGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780290096; c=relaxed/simple;
	bh=UxqAAJd2DL/Z9nbbEaaHL0/Z+JHx4IFxxX+eQ2gUEew=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=M/mhjg+jrnm3FX1qYdfY2NAW+wj2fo2jQokypkhVDEsM26pYCOfK51kSNXMcZJOfxgT7ahu2NLdSjok0nrnPTGpXD/JhiCv5YI1hOqsQSBn6Klk/PMXYS9sF5i+RKmBemYZy5insBCSrUsTqrmJDOodCpYWBWfvHFKHx73Jetr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RQMdT5d2; arc=fail smtp.client-ip=40.107.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RQMdT5d2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqzXDFr01Zwga7JLNsrklfC2oebdmsSnUe9uAmTv3AEYUjE4oe/QCBrNnCad5yapV11uKHQj5ahK5aU1vE72lcyC9uv+/jRYR8Qwgm6x1jyE8cRJeHjPf4m7/87b4njK4HhXaSSBzcbgu4WXE0Bg8EgIAa71QgzgoluNM34pqQHX8ZVPdPpEW20AqIG5fDLzycAycs60Dpz1IEM2qUTK/jc8Wnz3zDt/Bz07BC2+SUYHxprOhD3ID0UalzBM0wjtu9WmhwHKtYOtd1omBBHEVNPcAD5sanWF1zU5fI59HCtCA+6WgsuVvesUazm7Mqa7CI4x+soHt3FZc29ZEg04Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxqAAJd2DL/Z9nbbEaaHL0/Z+JHx4IFxxX+eQ2gUEew=;
 b=W22i2YNDtmEovkjvtHscYpTFnaEXAFws6aitRAtVxU0OeNcxRN2n9hEdoWstAicLzFNIHFYCA+klWfvPdZD3UtCIyZIyfwBiDfLJRBs/j6zkbgYc4UOalDCCS4B8AnEazTrJ6kZGFTssCKtgvwnRJSle3jCelKUjvoMVPWWmD2peaJMT4fw/qvbWsEJf4qORp6OjxcCus/a3Ny/tgmw9M38u+AK/ZMYNLcqt/GbA4Q6ZRiEnFrJhyQT2KxlZmFsm+ZLJ0nfi4C+kw2Bu+i10wr90mWaN9kLAC0KQ4vjAWxvo0kfXOBkETdICsAXa/p1Tqex2+gdMxvrcxFROYDyxMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxqAAJd2DL/Z9nbbEaaHL0/Z+JHx4IFxxX+eQ2gUEew=;
 b=RQMdT5d2cfx42wWSC+9tbZrnNQrJsBPrD8HbsetTvySV9u9hOmiPfjqwFejzugNXKq0a9mT38IOAy3aU8nHPJvnGFNd/bM6QcyKeqPuv/Y+XUqEZuV9rpCmQUr8JqLidVOQ41UtBOzR+rdSB8kTCB/7Yi27FyD6ruBDHEwnCZqTgDr0HQMQ6zppucIvDKFf8DfI8aO48WOfJfuH3nlw1USb0WwdCtY7bk2fk9dAuxNQw5mL41yVe7P2n4qkALzBuaPC7Y4RyozccYYb7I77CYAI0rh/beq/kjm+t80qc8sciFfGokEkWw1qUjpCbChNmqXQQaK1wYMga3CvFgOB7qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN0PR12MB6269.namprd12.prod.outlook.com (2603:10b6:208:3c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 05:01:30 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 05:01:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 14:01:26 +0900
Message-Id: <DIXG5YY9E4HO.1NOUWXOVPB2FP@nvidia.com>
Subject: Re: [PATCH v11 04/22] gpu: nova-core: Hopper/Blackwell: larger
 non-WPR heap
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-5-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-5-jhubbard@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::20) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN0PR12MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7faf8f-5ee5-4e81-b738-08debf9ad7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1r/kbirSPhlVq3LEehJWrXjQ/XPFvQHC8TCp69IJr3lyOA4eeU96FQph1wA4nwPt62EaGjv2oT6ThoCkHa+3KOQW0Ii46C+owg/VMewKXAJZx2axqMlyhdrFOsNmPM6rkn5Jirvc6EqVhyVQ2A+zB00e3QJ9kGCLId+6NltLRj5c16aDlMY6lBElmvsrJbPWodKcDVMKzsLjqePcI44AoB4hDGR+umKwUZTRjZDOGCYH4tbop4GBvvHPRcG//ikgSLshNgOYucXqBZu7/xmOrZShrVXKJhDUOJ1rcOqFM0PjWoLrDI1PhPikGskoVlZz6YLTJMZY4W40Dfn6dlK2hz+tc7LKA7gyVVocjlV86BI+BhscWCkucncbidB+r1+6/iziuPzRK31cAzBlzkRuUYsTtcU66dRlLfOUc3uQ6l7MvzoCLRabHgiaMlox0kQLz/S2cAkiu47IbcaO58gOmLX3fgmOr8V6yGqIFYD1dt9384ghJlV3j1k8Lbc4w8Bu+rVr8yBOvQVtZKlyORanqSe77k0zOEuxvYurymRyr06FC/mvNfFRE++hl357h22g5DpMHVNhrETMWPA1AZpjzzXwMcNdMIsGaZC4IB+chrSLK+FTvRMc3ahi6ujeHHQrMOIs8NKBSkzkX28TKSCIF1pcugJuRIuyU4N+cuth6XWPpTUiYnHPk6gc4I3tMqtnpYU8vmdtZyjSjlVaarhNPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlhoNEU4MHJqa0lzUG5zT2M1NWM5ZkRrWFA4anpBYUNPenMwOFduRUhIMUNO?=
 =?utf-8?B?UWNpVVpCOXdXQ0xTb2kwZit1T25qU2pMUVI0dUtyUzhLSDhiVTV5OTUrRnd5?=
 =?utf-8?B?UjVqVlRwWmtwNVJab3VKdXBNRk1mcngrcHJydzBGamN5b0k1V0l3RUFIS1Jw?=
 =?utf-8?B?Y3ovaVhpUkJWMnpBVGRYNlpCRDRYSWNEZ1ZtTUJLK1JZOWs2OE1UZHdPWVU2?=
 =?utf-8?B?alZLN0Q5T2NqamN5OGg3a1NuVE85N3R4a2FzNmJKQys5Rks1QmZJcjVDbkIw?=
 =?utf-8?B?NmEwQ3hkMW5ndEt4MllDUHRaNnkwNGMvOWF2NmN5TVBuc0tLcCs0M2ZvZTdH?=
 =?utf-8?B?VStuS0J5ekhzT1prL3gxRElKdkgyVzNFWWhXeHdPS3Z1TzBYUFdPdjZvUkI4?=
 =?utf-8?B?Q1Q1QjFSMWsvdFNyTW1BdEZkckliYVJFczNwTkI4SFlDa1A2TGRTUEVXajIv?=
 =?utf-8?B?NUp6aHQwbU1MWkk4QnRiQ1JpNmhMK0VjK0tnQ2dPS3BqU3lvVGVBblkxdDBZ?=
 =?utf-8?B?clZyK0dVNzd2ZXFXU2U2cEptUWtlelhjSTJoM0VPeitJNzJwMlhZT0pBbVhP?=
 =?utf-8?B?c2RRR0Z5c29tWStzQ2pXNGdka2hGU2JOUmNMczR3WkF3eC94K01qbjNlbEYy?=
 =?utf-8?B?dHdJdzNUMHp1TjJOYmwyK0xMNk1RWEdMcmVGSlQ0UjJJQ2RxbjZOL0NCYTJv?=
 =?utf-8?B?Y1lMUnhPUVREN0ZCUVFKZ2Z2blpFOEtEeUx6UHRtVUcwTkgyUWxSRVRiczBx?=
 =?utf-8?B?UjdqNmFLZXdYMzJjSVpzbjUxOXNyMmlONnIvR1dXWmV4TFhGeDdMUmxLdUdX?=
 =?utf-8?B?MS9SMXIwSWtEVzdhTGQ1cUtyVmY1MnFyMFZ2dnBVNHo1bXdwSGJEdG9wM0Vl?=
 =?utf-8?B?WndCa1hDRjE5NHFLc0orRGFoZVhOTlVZWkgyVkVpNFhNUkd5Q1VKUm9FaDlN?=
 =?utf-8?B?enBtNFhZazBxekg3V0pmdWIxRUlmWFc0Rit1c1dpU2dhZ2lVWUxVa2NKL3Fs?=
 =?utf-8?B?QXBmSzFJMmR1WFg4WVNaTmNlUjBORjZORkNWeXJHTmtFYm1jbElBK2EzQXpz?=
 =?utf-8?B?NWdTUUJSaXBaREF3aWJnMk96L0VPTlVoYnJ1RlNDZ0pwUjk3UC91M1ZxV1hl?=
 =?utf-8?B?ekt5SG9pN3FFM0lJVmczMWwxSlFWalNpYkZsaWtCWHlKQWN0Nitkb0t5TzU4?=
 =?utf-8?B?cnYyVUZUM2JtSzdxc29qNTJrNXpXWFFLVlRSbWF1UXdNSTFjY3JKWmZTRFlO?=
 =?utf-8?B?RjUxcGhPREo2OUdvL3E4NExYMXRuanZWa0hiVlhteVFJMTZxMDg1dTd3eHJy?=
 =?utf-8?B?WTVqUDhySjdJeHFaczBSRVJndTNIbG5TZGZxd0NNeEFtRExWR2V6clVrR2FY?=
 =?utf-8?B?K0hKdjZWWDhWK2RvMGdINXdscXNFdDF6MThYczM2WSs0ZVFkMVNEMDRVb0JS?=
 =?utf-8?B?aGt0UGlVTkdkemQwcTJQZDNIUnFJSWZId0VmaUtjMjNKeW9nV1NZeDhTNnJy?=
 =?utf-8?B?aFpVN0dUWnBRWGlFc1cwckJ5K0dIVzhpNTZuM3lKejROclloZFpENVQ3eTAr?=
 =?utf-8?B?QTlsbko5dWJLY1BKWm45MjZkN200elZNMDB1ZjJvempNaVdXR2xXTktVbW80?=
 =?utf-8?B?VWxHZTc5OE9vaXkxaXpScndlSkxIUjNab0w2S3h4YVVGOGhiakVuWDkvZzdU?=
 =?utf-8?B?QUI0ZXE5amYyZTc1TXJNQ0FTOEtZVVozS0RvSjM1TDZ0S2Z1czhMRXNEZzZI?=
 =?utf-8?B?aGoxaGNUTDdVREVLM3BvdExRNzBYU2p3ZEpRSmE3M1M4aGUzVkh3OHE1cHNY?=
 =?utf-8?B?M3AxK1JjTUhxVjBXZkcvNEZjT2lnWncxZVpqU3VBN2hWS3FWRjhtUWRCYVF5?=
 =?utf-8?B?bWFGNmpRSG00cm9hSnBZakZHS0dYL0FaMlJSeHBNdVdPOEJrM1BlZDUyODVE?=
 =?utf-8?B?ZWs2MkJJVFpQS0oveVRsY1F0SU9MS000NU9GZjhoRFNTSFBWTlFYSmZiWVVj?=
 =?utf-8?B?Umk5S1A4RFVjb010RHpIbS85WE9PK0k4bURXdHlwOExSMXZSbk5CZW91cHVC?=
 =?utf-8?B?L3hZU2s4YlQ3QTh1dTc1SE10WXNWbnAxWnpDcGExRGZHaVM3a1AvU1ExWTZj?=
 =?utf-8?B?aDRNZy9RUDIwS21aZGRFT0RrcnFMSjlGcXZTNjFMcVd6VXMxdVdQb1c1NDJl?=
 =?utf-8?B?OHNyVTBaMnFnbXBpQkNVYUZGdVV1cEpod2hUdWlJckZTQlJ0WFlzcXRsS1N4?=
 =?utf-8?B?YVNRMlVHd2UybXJJQ281NndzRXpDaXIySE5RYjd1UEloY0hlYVFNdWltaTEx?=
 =?utf-8?B?aWNqTnJzZEUyOVNtLzdvVkhEZ1NlQkhSWVljdG4vUFNlZ2xjczduc3ExYkZC?=
 =?utf-8?Q?vWh+3eS7uDqZEaaCvFmasXGCa7rh/9c+UsHRx8gIcQm/A?=
X-MS-Exchange-AntiSpam-MessageData-1: AQ5qiedTfptF/w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7faf8f-5ee5-4e81-b738-08debf9ad7cc
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 05:01:30.0737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xraab28jeoA5rT246M+DlE1N7+cqz//NkXnfmjYqJ1AI3l1lJM6J3ztN6maJTn8nhXPSxr206lwM+Gj1pSq28A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6269

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> Hopper and Blackwell need a larger non-WPR heap than the 1 MiB that
> earlier architectures use. Hopper and Blackwell GB10x need 2 MiB, while
> Blackwell GB20x needs 2 MiB + 128 KiB. Because GB10x and GB20x diverge
> here, give each Blackwell family its own framebuffer HAL and select the
> non-WPR heap size per chipset family.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

I agree with Alex that we should not default impl `non_wpr_heap_size`
on `FbHal`. Other than that,

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
