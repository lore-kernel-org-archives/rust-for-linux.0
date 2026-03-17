Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011063.outbound.protection.outlook.com [40.107.208.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61AC32ABCA
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 04:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721383; cv=fail; b=YNxdyPtA8lv8B9JU7UfdU+1RKkUdTuM8/ktdwrFhgGCHgPRkOftZvK146mZH3ZDgZaIhzcveXVedG0IwYKUjAW3lAokmhC7FIlxmnvwZCjch3cYX1p4xA0OgVze1LyUuYFyo8ff6qva3UqMfycE9QuDpmjQiGEiRUJSfKn0aQsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721383; c=relaxed/simple;
	bh=HMdPigmK0uLjGMSuRKusMVd0AlLCgI1OQ7P12gGouKU=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=bFWv2xUM6scp7oKJr6gPHJMqabJCXzaH/o69dYU5ZROiBI70jjgQ2NQOUhj7fcuBZlxz8ZXD1BCCNODma/iPh/y6xHN8dgqc2xK8jU3XPr+skhp7IEL3zQAztgvXTWGnVPooIs529CWbkZoW3uh3YvXMBf19kq4s29J6NfC8rgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NS4dkoiS; arc=fail smtp.client-ip=40.107.208.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NS4dkoiS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gjtt1aiS5bGudtV2fRpjYaRmJIXLoG3nZQfq0F6RysWxu+A8BOn1cRD0tox7t9ondGMlP9f8zZatSxLRTd7tdoLHdHdw0TUVKsWhs81egNCvEH45H1nzaH355HciG8F0LtSG2/QVHzWrQdj1m9kCcrh3cWBdYqyI4YsjqXgABC2ixZgxhwdIYiRt6SUqw2TGflJJmb4fFK8iL8shDsyrLQG7z6Pb3E8LAXa6Wa+zZJaVRFNyy6/gCbUCYSdEeVx3+eUXL6TYfg3eAsAt2Qa6tYj3apsvB5yb9pck+0W18EN1oDc1ulBOWr5HAw+g+aaiqnIs2Ji0LphctGZndCLKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMdPigmK0uLjGMSuRKusMVd0AlLCgI1OQ7P12gGouKU=;
 b=uBWaSUeXPAiF3Ys/wbqb2hAUbknwwuJJX8y1ynDYfmLJtkujtnvWcyNItQnRwO2qFBmJyy0IFTwvDviKENdvErRWvnrNHB8D50pLO7I9kVXAAy75DPbBVYd1eazHdGurEj3SM/w/oFoXfnH8wr6teN4wBkyYiaD+zwG+EZ3qDxSfTlkeYe9wGolmN6SlnFPPsxZfNvGY3iya3ukZDtOdMtwdURtjO4QjVzgeyx85R3JNu2UTePN9Moo/3DpEBGxsxM8AIVxobe8ipUfkz/k0kBsVhPlZ9OxwLqS4hNC2pbs1gaSAwWI5hdAEVPi6qsvPcCinGaDexSwwgRDWhEd3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMdPigmK0uLjGMSuRKusMVd0AlLCgI1OQ7P12gGouKU=;
 b=NS4dkoiSk6PGah7AKgZrA2YWKc/kjis20tAcDaL6b6D4iDZ2hGWEubn+Onkb3Ks7Frjk3VdlWrThwwWrbX4sdOTEpJAY56zC4xl79TvAd3vx7r3ILOg9WIHT6Ia/la42D31LYkQphuKSosL0XWKMvvnb8T9mtAd4hJROgdwVJUYowkgrWcsqPZQh/qu/Bb2G5cs1KOo3s0OfKtLIyw/iFfYiDvNnj7s4AmeZRzpvbNfqcS1nQ7DVnBZN2EiwSkOBo14RuxVbxNqjhNOLhwjW6pwb3gMTi2apfGd/quHNu2Bc25yEUYfFR0pydKC5HtUjvhACi3b6bvjYAf0bHOGC3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB9517.namprd12.prod.outlook.com (2603:10b6:610:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 04:22:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.016; Tue, 17 Mar 2026
 04:22:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 13:22:52 +0900
Message-Id: <DH4RR1QHY8QK.2KLC2NJNJZCVP@nvidia.com>
Subject: Re: [PATCH v9 3/6] rust: dma: implement BinaryWriter for
 CoherentAllocation<u8>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>,
 <mmaurer@google.com>, "John Hubbard" <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
References: <20260316055736.1690546-1-ttabi@nvidia.com>
 <20260316055736.1690546-4-ttabi@nvidia.com>
In-Reply-To: <20260316055736.1690546-4-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0129.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB9517:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e4eb36-63d8-40df-4840-08de83dcdd49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aH5ibDd6Pl9hQI6bcSFIj7qNUSU7s1e84AskbtImOlZAWJBIglnhYsIeQLeYGTeQWiVPteCZwMjB9w6YkEeF4EqdBnkizoykuEH5P4KR4uXKZM7GrjHrLJ8KABhqe67b9tNDUd0/tSVgdAlEwNucGcKcl6P+04VQ2XZo7K1Z9e59L1D2N39HQ0Bg0Wn8M1tcnH0T4eEMxUdHJTubXZNU+rSLXG7R5DjN1kfEqui4jaIjiYMEmHWCA213mhDTvgOf5C16HM0iiwexLE0d+9fIiLdgjCe+613rQ2P6E8UcJQtro3cxWMJjccPDhdlMPZpK2S5lDqgaGOmDHRdzz84C4BsBh6f9O9284y0oOrR4ZPT42bVCVZJ5HOWgnJb5xH/S8zG4Kcs+qve8v922ZGAw/Pba9yAx5/l+kO6RlfOPmI0yXwLCg8lyxZflD8MV9jDgtfGCabwTR0sKqPnIRuahfZfHWC8yh4uXk3mkA3zCxp0M65Ih0ujhsSBPi6cpSIsRfhKy6nj9AdtSurRt3RyZUQTo3m9U9KnSS6dJ5d6mVrBOyMzbN1+ZNXNYUEX0bZmtO1ewnc411O3g/9Vjxi2TrWnsiWh4AX32l3TZPlxHEjJSFoV3VgFV/CqbpmgCritX/pPcZx81jCrOmQaMDjfOgueHN/6BAM8yhQiupJjDPyXHhagzxAPmQvHHzbcMmqXLztC/Geg8N79YInCGbY5j9SDkLcekg2u1T2j3CjTEAwI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVdTQ1RDRjk2M0g0YXhKV0dlK2cvZ24vUFRMZ2JTSDZpK2xDK2t2NStxVG9s?=
 =?utf-8?B?SVg3NE9BeDBjRHVwTWdIbzRRQk5vVzhxMUZESkx6TjBCak92YWI4SXRPYVUr?=
 =?utf-8?B?ejQ3MTlIYWEwTlFYTGZNdXNuNndyY2tTV3M5emdQeEM3TmtFUXdRdG0yeDhv?=
 =?utf-8?B?b0VyQW1HVFJjM25oellyd2E3MHBVR3g1MXc1em8xVkdqUUFSd1dxS2J4MDRj?=
 =?utf-8?B?THRrTTFBempCNkE2bmxLZ2xIUXZtejNHOHhvbzNOaWZ3MDFvc0FLQmNvRUph?=
 =?utf-8?B?Q0ZQbStHbmsweFJuaFhOWmFmWHo4bjBRWUYrRXAvR3FMVktVYnJlTmd0cjdh?=
 =?utf-8?B?dU5oWHdxYkYxUDY1Q0lJcWp6TUdQODdMVTZybVBQUFpPb1hvdFJBRWdQK1NS?=
 =?utf-8?B?OSt4YTJXbnM3U3A2dE5KUHp0OWNta2VTL3l2RURaQ2xhVVZWWXhWRHdZbE5x?=
 =?utf-8?B?bTFpWkRRbXVzdzh3Mmw4Tk4xMmZjbWJWOWpsQVpPc0dJSWRkVWJodC9aVDhI?=
 =?utf-8?B?NVY2Nnl4WXRQM1IyVzEzei9RbWdpTWhpWWdhTU1PYjkzNGs2S0NWcGRjeGJZ?=
 =?utf-8?B?c1lIbHcxaDJNMlpMN1ZOUUZBTkk4OTJ3TDhkM2Foa2lDZnNPRUpwSVZlOTVW?=
 =?utf-8?B?TzdYc3FGOFhWYktKWmZsRnRWcXNVREV0SHpyVHdKTnlRQXJ5eVVQOE5iRVJq?=
 =?utf-8?B?NTB4RXFvMG10UnBWaU5ieElUN0Q3V0hJeGFRMjI0Q0hpOVRyMCs0dGZSU2hM?=
 =?utf-8?B?enBXOWtUVzl1UDJsZHVBaEZERmtsa2RkeTh0R2liOWNWelNQOUlMUkhJNS9u?=
 =?utf-8?B?RTZVWDFXNmdFOFh4bGQzUGtqYWFkc1ZjQXl3N0o3Ry9iQXBMRTBNaDlXYTRm?=
 =?utf-8?B?TUc3UnA2RjZRSDMwaGczMSsvZ1pDU2JsRCsyektvZzNSb2ZCRUFzdWt3UElE?=
 =?utf-8?B?ajdMRTZhZHNFc1VMZ2JvcFdRSk9TaHU3K1R4R3hUOWJ0dVluQVBreGNIdVMw?=
 =?utf-8?B?bUk4TXNUTlMwSkpHdktSMCtTNmMwazg4akVmbUJ4bHNRSlVDeXBGSHRydkpO?=
 =?utf-8?B?MUFaa3NPWUc5WTBLZTlJbXZIYXNGV200RDNpeHlDeVZwRVdwdkYxM1Z2Mkll?=
 =?utf-8?B?ZEFkSWtjb2xUK2JzREUrc3VMOHVUdXJXWEtVUWFvL3I1UWthRWdDMEQya1Vm?=
 =?utf-8?B?MTg3RUtQOHpXdS8yTXhjV0xmVFAxWWlxbUpGNGUxSGpNcFV4RGdFSC91emVi?=
 =?utf-8?B?NUh6TG95ajdtZThOcllNMUJobFJRMllDM0QzSFlwVm84NWFmZTdhWURlQTJV?=
 =?utf-8?B?aWZoWU12NmZvWHQ1M3FqaVM5eG5JMStxa0dSaUkvWDVTb0xLOFBINzBoa0l0?=
 =?utf-8?B?MEV3b2V5dk5uTjlVa1FFTXBnR0IyRTFobitWcGtnWld1eXphVGlyaFM3c1gv?=
 =?utf-8?B?RU1YZFVucUUySldlYzd1LzZLbjd2OG9jVXA4SHRnYWpGYzNmU0pvamdURExE?=
 =?utf-8?B?WW5RblB4VmlabWlxRVNLU0szRUlQbUR4T1ZCdStBa05DcmllNGlMNWZVSTIy?=
 =?utf-8?B?ZU44c1p0YTN4cFdWT25lSG5oR29LVExsazRhWXF6U0ZlR3ZDWVdWK3VJbzlh?=
 =?utf-8?B?OUpEQlhaNzI1T0dNNWs3dE9jT0MzZ2ZuMlBvaW9DUE9Fc2ZUMDVKNmw5eTha?=
 =?utf-8?B?M0FkZ0t5bWpZZERON1VOdTMrUWJFRFRYYkJ4MldUN0JpRDFDdkhPQ1ZubWls?=
 =?utf-8?B?RnA3SlR2US8zUWFWU3dqVE9UbG1GVTU3bUs1UHc1cjlyQmVQelFiOHE3emlu?=
 =?utf-8?B?aEdPT2pGUE9zZ0x2OXd4V00wQ25TK3haTVpOUmlxSEN3YitxWUJYT21LUmlx?=
 =?utf-8?B?YTF3K0MyTXdSb3htV2xCQUppTTl1QitOTWNHVFJSY2doaFNsU01iY3lqQVJw?=
 =?utf-8?B?STBrLzN1dGpYNUNYeGtPMlBqQ1ZDQmQ0U05xa1RlVEpsY3lqeTRmS3B5MzNE?=
 =?utf-8?B?K2FPclhJb1lid25LZmNkRDJHVk5JNEN2U3ZKa2I4UTYybzN6cW1iTlRBMGgz?=
 =?utf-8?B?eTBkSXIwcXJsNkZPeEMzdFVaL1YzdkFUVjZWR2NhWFZGL1FJTVpqb1hjVktL?=
 =?utf-8?B?Z3dxREg4cmtVd2NGSUxneXBjejBXWWR5cDBCTkd4Z09PSTZTU3NRRTZIazNu?=
 =?utf-8?B?WTZUUGtBemM5K2xkYlJrQUZQVkM2L3VPTnBwN05GVmhlM2lNWThvTlA1N0tY?=
 =?utf-8?B?bTMrWjhXWTVmcGVrcTRlNFprVW9kbXJtUkhuZW1aWWtIWjgxQitSeGxnd1lN?=
 =?utf-8?B?cE1HK09EdUZyVW9zQ054NkNLQTZPOUUwUGlhWjR2WTNLSTQ3VVhsV2p5SHFG?=
 =?utf-8?Q?Sy0xuUOfgrHtnlFGbDlGOftjT7F40kaKGoCupZ033gfL/?=
X-MS-Exchange-AntiSpam-MessageData-1: EDNSjqcKf/S8Og==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e4eb36-63d8-40df-4840-08de83dcdd49
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 04:22:56.4343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+I3pb3LkvwKBxe1SWgB7t65rUE9R++rsJAk0zA26KUEiLHLykY6ihQTqpW/Dcov8QeMfU7ej54HtYnb6/AoUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9517

On Mon Mar 16, 2026 at 2:57 PM JST, Timur Tabi wrote:
> Implement the BinaryWriter trait for CoherentAllocation<u8>, enabling
> DMA coherent allocations to be exposed as readable binary files.
> The implementation handles offset tracking and bounds checking, copying
> data from the coherent allocation to userspace via write_dma().
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
