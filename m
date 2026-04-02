Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011009.outbound.protection.outlook.com [52.101.57.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94FD2E2852;
	Thu,  2 Apr 2026 14:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141727; cv=fail; b=aFFnGdtMbWE0NlJKKXbA/rWSrm66aXFdCKWTSkYYc6xjWt2hF7K481XQhUd2X0KQ6wQKbi1CtY6DplgFVBPs29CJNH9iYvOq/BvXg9xJH/XTPIRQEvqi+uTnDY3UagTWHqFRNg/tiFtnXZQyBWTOUQ62cvaUiJNcrYf3SzdnG9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141727; c=relaxed/simple;
	bh=1Jmno2EuM2Cnd/oU4zvgOza07of/IYxhI4cwXXIyy08=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qrq5GFyDQdyiUiMpc9s9eTpAU2V5AeS5hKdJz0HnTdaiMqjuuFTpJPSJMcHhvFfAMRqpbT1yPj1fgcrPQBvH/EGsMrOukPcHQuf8eb+ePPOMPNPBeUJZwWaZZ8sv+TKm4XYpAHLYdzH+Fzeq/cVV4vmLs7rHEe7TEKd7BkD+QGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hd0xVB7D; arc=fail smtp.client-ip=52.101.57.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hd0xVB7D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8DDm4OEfimN1AdNWyE++5PVMvHNJZ89FgUbKpNJOC/3G4yQ9bCXgXfOiC/jBCgUqpFCoFbP1LH3rXxqa1fraOpBx8jZ8JuiK0QiPH7YYxrFs3BaNlURFuV2v0TWkzTj/C8uyUaO8WL1FRJYVw0Qxs917bBHiXQkOQxH/Rc6UsPthfvyyJwcUZN2Zgeu3WyPBpUSWEFk0mNNiUNyGQCCQekWdqcsiQVCrpoJ1Il8E7vBMfIiZe46YppgqQsvXL8lQ91yVmYpUw4OgWNgwY9nQhXGFDlHZvNZ+/1TpM36CLw7/Ikz3MvUMz/XMeeIkI8R5K0dA9XEJbxf7thNYpMgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65B3yr9Cw1UakJf2in0PISFK5P6czjc83kvWXK0X3aw=;
 b=WMfqFqN9/27xqBQv+/zBBMTRpDu8/RvqF1EkxM0gCatYT54Odn3bcad6p5JkCNJ3OsHSs0+jCTiTWQiqZ5HQF5lLrDHjM5n8O5JU0jNT0MFoepC+/xiEpB2I7UAlRlDQaGy2j+Pysi/ZCRzDZUSL0HDN4lmNP5VbFKaC7fUEBGGeW5Uxp5NtyeW3LaAtrEYgvZ7b6bBNxpfsDfBkV8egP5ANbncNfFAWfyIEzOhXBjtJTDJNDDUq/GWqNyr9WGloj6X6b3M97DFp55I8xcX0acvuFHLFLYW5A08qvJ7/Rfzm1vc8qDbbWj7jsqwVJpUarIwBMDWD3CuEbUZZBe0/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65B3yr9Cw1UakJf2in0PISFK5P6czjc83kvWXK0X3aw=;
 b=hd0xVB7Dt+xdJDQElQ2Tt324tCzoff5KQaNayTVLlhpm5vSIas6MGt32LwVtvBQb2Dy+5wzSwnncRgZw/g4nfktqA4SFcjM0qO1D1ltv+lL5QoZGTTU5rCzvuO+K7FPXqbFdv7e3rSWsWoLY7KZDI93jlqLxMLUjrl+uZdFd5ScpJck9ppG6wYD4UnnlpmH8WQEV0h6Lfg8N1w7x+wRFJo1zDwN3dQAk1mCHQL6cGY2jjTPoP9YYEvS1+XUGyxUK4+I1R0uO11MZZc09yMUnNdGoWgRQo38h1L1PXZSCU6NucJzhg4i4XbnrFmTYcH1eYEHI0fv6nLN7cniohh3MTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 14:55:19 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%3]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 14:55:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 23:55:15 +0900
Message-Id: <DHIR7Y4FLM2H.ENO8SJ92Q24J@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] gpu: nova-core: use SizeConstants trait for u64
 size constants
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260401222743.148710-1-jhubbard@nvidia.com>
 <20260401222743.148710-3-jhubbard@nvidia.com>
 <b1c23169-9368-4ec5-98f9-f73fe8128305@nvidia.com>
In-Reply-To: <b1c23169-9368-4ec5-98f9-f73fe8128305@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0001.jpnprd01.prod.outlook.com (2603:1096:405::13)
 To MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|DM6PR12MB4203:EE_
X-MS-Office365-Filtering-Correlation-Id: e930bc5f-fb22-4666-4bf7-08de90c7db8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nFdvmbSJx259n6KeNnjxrvuHfhKpagUScm8wEYYnQ8FqchvHpO9eiyjl1PP0F+ylG3l8R0WwchXrBcBgG0Zl+jrUHzVrp9xgbDg6loKGH93Atl8Oi/zmKNaSaNsy2Edbm5Y5knSvAT65bu155pia252hTcJa7zvOFtr0yo3TWOjWQKAbe0dl2UfC2YQhDN+wdQtmUbWvY/T90nfhxo0bQ9EogUbq42rfypG0wkFQfhyD0YOnNk1Brd54KNsSzXNqecJkIpthwZyAINvq46TJWjuwQaWUXgS6aaI03PeaCLWJVJpGdKWayGXEpWrRKAhuuT5TMFeRzrYT9Tm/AgS4KhZsN+0J4Oy6BoyoC9WeG3dS54pDvLMbig5cDe9cByx9Cobg+EpRBf9kASy7bU67nx9DIGoqCW/jKZnKzAywuDE+SbxCzOcYclpmiWoRQyuQzkXX3p5q9fPMjgjXMH4YE2MCsp2eAQXu3Icl52+/cw80mQvNHOFr6HjcdyqeIz8PAPnO7GI6kdhAmaKhnDwnmucQnW2utdWcs7Qf2oeQ4a1GdzGW+WO0KasZdu0nwxtX+LsIpKzfNKmgdJWZ/6z1AT+xVtbMyJqjeRLYLqLlD3Us9hYHj3N22zkt/6zME3PuX9DReTR/xM3o1eUgAa5COyP8z0k4wJIoRw5NaZ7AFa3UPYQNSldhhHnh3yrSBmyPZ+Mt3d8jpLMrg/2d1pP1OQkvgZALz7/UXnebNh3druY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0Z1TXhhdG01eThaclJPMFJ0NjBYb1p0OFpHbUZuVXJjTVM2QW8wd1JBZXpP?=
 =?utf-8?B?d0ovbkpYQnBLeTJ3Wmc3QXl0VUFiTmY3OG85R043dGp5T1dEek9WWmw2NzJT?=
 =?utf-8?B?YnVvMVZHdWo4N1N2aitCWjhWZTM2YmkrU2k5Z1U0VkhKSGd1b1h4Q0NtbDlk?=
 =?utf-8?B?bkpLRGQxbjBIbHNGeEQzUkwvNGVIc28rWmY5ZS9ucE1WR3F4OUxPUzFndTdi?=
 =?utf-8?B?T3ppS1FPQ2FFUUlHSVl2UVgvQkF4QnV1K0pYYkdQdlFzVHdPeTRWLzdDSnRY?=
 =?utf-8?B?WjN4OWphaVRzOWlsa3lENDRuOXBsYWlUcXIrVXpxaTlVMzEvQTBtOU9jNE5a?=
 =?utf-8?B?STZtODVwTW9KRlliaE40VDk1Y09DWG9CZlhKbVUvQzM2MnpMRDR1c01FdHRS?=
 =?utf-8?B?QytYRnZ4M3ArazdHbTA0aStBL3FqY0xqNStQNHI3ajUzTVpqdW4vZWU5K1da?=
 =?utf-8?B?NExONWFjMGxTTndvdnE2VDNYYWVwdmxPQjJ1bVVkb3F2WXpGMk1jUVZYS0x2?=
 =?utf-8?B?Nkx3N0M4NXljaVhxNDR6M29WNG5PdVc2U01sb3FHM0RlK0IzeVFyNG1BbGph?=
 =?utf-8?B?UnloMDZSaEY5b1AzOTJvT1Q5V2R3Vy83cSsrYm5QUE5QeTJHc21oRkdjVTAv?=
 =?utf-8?B?bkoxdjlyRXQ1dlJaejZXb2lMYTJZL1pVRnpUNkRYQjdEb0RJRjF6N0tQRmtG?=
 =?utf-8?B?QXh4KzRBVis5aGx3WUFaZkdsemIwTnFHN1EwbWNmb0puTmNzem1GVWs5WkFz?=
 =?utf-8?B?UkZyYUVSNXRRTnBzMjFib0JVais2YkNkM0RyV1l2bXVBZ1RRU0pnUkc2dmVx?=
 =?utf-8?B?SjM2OSt6aVl6K2FvUUVWbWN0OHFYeFJrcHk4VnZaWVQ0SStsSCtqdEcxOWpx?=
 =?utf-8?B?bzU4UGkwNmtEUmlqbEJRRkRhZjRmWHl0bkFXVzBuQTBCZHFkZlFQcy8ycWpo?=
 =?utf-8?B?V3JtQUt4YWdnSEZZZGwvbjI5L1VuME05VVU5Sk1NM09oM3FNdW0vVjJCbjU4?=
 =?utf-8?B?OHRrNHpqblZxbk5mYmN0MXg3ZE1WZ1k2RjRBRjFIMllLdzFpbmVzdklaTk1p?=
 =?utf-8?B?RVRZVjNTayt2dXFGMTdiZENTNVR4Y3BoTUt1RVNMMzBiTUsvT3FGL0pQb204?=
 =?utf-8?B?YTd0RnFVaFNYT085NGxCYzZWOVRWUEhjOHZNVnVhNkdFNnYwVXA5a2NCVmZC?=
 =?utf-8?B?K3IwNHowOWZSaSt5bWdhWVBuZXFLaUx4TGFYVExIbGNqVGkyUHBieXB6YUFY?=
 =?utf-8?B?cmpLK29RejhBK1lSWmlYYTJDaTdVUEp4MjIvL1preWtjeG9IaVUwdVJQT0Yz?=
 =?utf-8?B?ZG5mZjRiZWc3SmZDeHU5QnV1c09OWHlocDNjOUpRb0w3clBDTXZyaEJDdENI?=
 =?utf-8?B?STRKNDByc2UzSlRBcUMrelRZMyt6YlVZMjVPenhTSWZHbUpOeXJXc25FdjJK?=
 =?utf-8?B?RTRKd3luejlpek5GTDI5ZFFMU0hTWWFCMXZmejJyNkJNS3FJOFdsMW8wdldp?=
 =?utf-8?B?enpqMFFGK1ZGU0VvSVN4Q0JIVkxWZEpUbGhjSlVHbGdTWWNRbDNGdGhJVWxH?=
 =?utf-8?B?VDdFSGQvNUpGZEIra3pZOWVuYkVEL1dWSkE2cVc4SFA1ODJMWFVGTElhVTNl?=
 =?utf-8?B?NGJlYUxnMkJlU0lMZUV0N0psbGlhQ2J3NEN3RlozVUNRWC9ZZjNmT2FBbStu?=
 =?utf-8?B?RGtONUdiMUhTSFNmajdZckVuNHBNdXA5M0FIZ1NFdGJSTUdmMllxK3pYRElJ?=
 =?utf-8?B?T1Uwck5GZHZDaHVCUGJnSjk1UC9yb2dyNEJ4c2IvcGJwMEVTQlRkc0EwSGRV?=
 =?utf-8?B?U1ZvTGU0R1lRQndJcG95Z0VJZ2l6M1RFQk4xTEhrRGtHNU1WaUIyeXQwL0lh?=
 =?utf-8?B?RjJ3RU1yM2pXUG1vL0hKeS94UStJRk1CbXVpb25YczlhL3hOalkwSE9aMkNT?=
 =?utf-8?B?bHJMaWw2aDdZSVk2WDVUbHZBSVJXbVB6RG9PSDcwSmdweEwwbFFFTXRhckxW?=
 =?utf-8?B?NGFDcHZsTWVESHVXNHFFWGp6R05TZUtzRitZS21SQTllamZGa0puK1pacGdn?=
 =?utf-8?B?Snh6aTV4cVFNN0hBbjc0eGowSGhVWlBpRTBlZ3BkeVdkYlVwZEZJSWxlWUtF?=
 =?utf-8?B?QWxYM2FCenVBVjFMS0RqeVVTdEplSnRsNWswR2VIdmFqU0t1RnZXUHFRajRs?=
 =?utf-8?B?dWpQWkY1NlZWSGVud2MrcXl3b0JLME5ZbHFjRUNGZXQ4NHk3VFRtMTFoSmxG?=
 =?utf-8?B?cHZYVTNNNjRzZWNDSGJ6NTV6MjZZMzg1a21jRlNJVUtmUlRTdmppRDhxZzFH?=
 =?utf-8?B?ZlNrTEQzQy92V3h4NDdYdlFUTGx5b3dNTUJUOTNHYno0UWEvekIvTzVxV3c3?=
 =?utf-8?Q?4pXrvHhyu0RZrRxz6QpESR0ZQItBKrkGq7yly+jQ7qje/?=
X-MS-Exchange-AntiSpam-MessageData-1: 1ivFa6ZYZBIlpQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e930bc5f-fb22-4666-4bf7-08de90c7db8b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 14:55:19.0506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgEgsZ7kbkt50se7Lxx/0xpKuru+kPBNwdkMZWsRzsWS7ZnIH/t4+pqs6WxIbv37MPD64XD65ilj2+/KJSjrbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203

On Thu Apr 2, 2026 at 11:33 PM JST, Joel Fernandes wrote:
>
>
> On 4/1/2026 6:27 PM, John Hubbard wrote:
>> Replace manual usize-to-u64 conversions of SZ_* constants with the
>> SizeConstants trait's associated constants on u64. With the
>> SizeConstants trait in scope, u64::SZ_1M replaces usize_as_u64(SZ_1M)
>> and similar.
>>=20
>> This removes several now-unused imports: usize_as_u64, FromSafeCast,
>> and individual SZ_* type-level constants.
>>=20
>> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
>
> I am very happy to see this series since I have these issues with mm
> patches quite a bit, which this series will resolve. Should I update the
> nova mm series to use these, or wait for it to be merged? The issue with
> updating the nova mm series is, then I'll have to either:
>
>  a) carry the series as a dependency.
>  b) wait for it to merge into drm-rust-next and rebase
>
> I could do a) and add a [REFERENCE] prefix to the patches, similar to how=
 I
> did for some drm buddy bindings patches. Thoughts?

There is no need to carry the series into yours, just add a link to the
cover letter to your dependencies and folks can pick them up.

b4 also provides a dependency management mechanism, and will even fetch
them automatically if the people applying your series also use it.

I don't know which tree is going to pick this series, so whether we can
use it this cycle or not will depend on that. But if it lands in
`drm-rust-next`, then it's just a few weeks until you can drop the
dependency link from your cover letter anyway.
