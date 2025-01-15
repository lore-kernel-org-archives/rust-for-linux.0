Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2053.outbound.protection.outlook.com [40.107.100.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F38D1D88CA;
	Wed, 15 Jan 2025 20:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736972461; cv=fail; b=IcgFGkuy3o9+FnfqlwmMJGx2rlDNqxz9gy7CVJ4NwmnVccOLbqDf3TWrUg4YrfXpTSZtac5jwHeGYlTNC+TJ9Qt+RW56QIpBGrxQYw+B+p1IzIRQVYivwQ/2GQA8xZA63npYl6GebowARMXDfvTN1CtzjRBIip/+t1UZkFrrVsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736972461; c=relaxed/simple;
	bh=5wHGz/H1XK/wVRJ0kq3xHiUUp5bDiZ8FXJkpcAfQGbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KgDQPaBvZlvxVx/MdrqDnGeC2srvK0GerzpG0ADib/tFDUYW/4MCoP3TGAy2BPbCHI8lX2GJJErfBi9xM5Aa/l4ykjD9qARRdMr9qf2ZEXacIXOV9e68ULi3Cstx2REfqd0uNKNE4yVpfgkhjq3jIylkHODtiLRo0t/KnOJy558=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XmSlxGc5; arc=fail smtp.client-ip=40.107.100.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XmSlxGc5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaKu7ebuZEYWw55vKMHdrwPOcQ4voUdkM+Bv+CxPjuNia1ahYwzXHQ1MPuxph5BOKXvEN0qtSV0rQ2JNuOGiY2o+UjHIBefoTukqppIcd9Byvkhws45xsqjDwymJdFH6HfVyEDiurgl4fNNtRVoGQ66IaVpMCkU4u2b5iJ54+kMlcoFLIrSIeqg85oyzYAN1rQZvAEQFXZVQEYIMXQouJFD2BECzVYGpBhuznZgPI0boOozNvy3Jmt0bpofMj9MqEaTLXkNwg1etxJeM/rGRQ7uzpMyoOLs0nw9NzWxe86AtMQ9BqRVlKHhosB3oPiAEOpbLlcXI2JjbcyxoesqJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUWM+BOqztMAyBfw2xpMKjrtZ4A4+9nPIVDSp2MIin4=;
 b=TCBhRn1JlrT9VWxzBa9BRtUFIKgm16ufELNbA4uzrMHLSXAgcpT3JxvnpGiLDdTsDz6u3/Oped/hECbLxi45OAjatjScn4GRgCXfPjx9RPiFETXLOj5JhMkuqEjAa8906Xnf+KFPnXeCNm3MN1wWM6A2+hghZbVFtjAKBKoM8/Hwhedj67LlEoigo5DY5M3f6lNQODSz0ZQINFoEDwCCnFsWskszV55h9BgP2O5Rzyy/6hZLNLHSPXysq2wBILmxiyK3189TDb+RyTSq75BQlf8eFCVBAVzvBU/TzIl/Ca1WyL58BjNEOGX3YMNwhj/F/45xOCqZgY3FKl4XNfAhrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUWM+BOqztMAyBfw2xpMKjrtZ4A4+9nPIVDSp2MIin4=;
 b=XmSlxGc5BdiRooc/ws4Ylfc7gl+lqzsYw1Gdpy3f9AXLknojuzP4uYUh0crJU4GQqAvawnkV5vuufXzbNUnYDJsd8flZWQiGPquwRy2oeKqV1GsMtpNgl4o842bBaWDRQaQ5QWqWRgoIdBsd36NJ3CzwtUnsoCudOozsI3FrUBBlQ6DQeX2g7n3ud1t10nE3dCqZ2IO+BoYEM8jYyoy2pDUVVpBC1BSFn1AO7SdfoT1/aVQ5N9gCEQrPXhc28No+ErZQ1uXFo0IRqN4pZ3l5NaxU1mrsCHyCvjG9FV+rlnNDe+GQDRgHulKqkGxpUy9tbtK/443RKIdNUr6E3XJUUg==
Received: from CH0PR07CA0023.namprd07.prod.outlook.com (2603:10b6:610:32::28)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 20:20:56 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::8e) by CH0PR07CA0023.outlook.office365.com
 (2603:10b6:610:32::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.14 via Frontend Transport; Wed,
 15 Jan 2025 20:20:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 20:20:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 15 Jan
 2025 12:20:41 -0800
Received: from [10.110.48.28] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 15 Jan
 2025 12:20:40 -0800
Message-ID: <9d2a7149-445c-4084-b88c-4c7833afa894@nvidia.com>
Date: Wed, 15 Jan 2025 12:20:39 -0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/8] mm: rust: add abstraction for struct mm_struct
To: Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>
CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Miguel Ojeda
	<ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, Vlastimil Babka
	<vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton
	<akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, "Jann
 Horn" <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>, Alex Gaynor
	<alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Trevor
 Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <rust-for-linux@vger.kernel.org>
References: <20241211-vma-v11-0-466640428fc3@google.com>
 <ZzO0HNA5jlZZgU1ib_SP36HWHny8QNidES3cXM_ogVTtqArMPzPfDlQCFslPrZAVESJzfzFOVfOkoZHKiG-ivQ==@protonmail.internalid>
 <20241211-vma-v11-1-466640428fc3@google.com> <878qsfdftg.fsf@kernel.org>
 <ArX-UzegU4cf4AOS9ENB7MdrYE35c_oYLBa1Q5kq7S0e3nQt06TDKyZblbuXYY89G-qbqo444gu7uEhGzr4r9Q==@protonmail.internalid>
 <CAH5fLginc=uNPVp1-T-oBrgtE1oi_cBMd65sPkDgqSDjH_CNfA@mail.gmail.com>
 <87a5bse52v.fsf@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <87a5bse52v.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|MN2PR12MB4191:EE_
X-MS-Office365-Filtering-Correlation-Id: b362759b-e23d-4fc5-ee3b-08dd35a21df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3IxbkxSWkdkYk04di9LS1Y2aWVsbDVrQWRPL2VsOGgxOEkzeWlJNW9QSUJZ?=
 =?utf-8?B?Tkx2amI4clpESkdWaXIvRjdjYlFzdFdlZVYwYjdOcVEzNDAralNGaEhwVkp4?=
 =?utf-8?B?ZTBIUXFVVmR1MUFnMk1zeHRwSVhBSEwwd2c5ak5KdWgwZlNIZTc1K3BkQ3Bi?=
 =?utf-8?B?anZKUHl2ZjFXbFBOdjB2RmFPYXpCQ0o4WXJYV3FXcGtyYlM1cW9Sc2hINnFW?=
 =?utf-8?B?bFZaSVY5SG1JUnF0dnhyOVh4M2ZxVjZ2V3VRR2ZaSUxHSHVEZVd4SzlVa2dY?=
 =?utf-8?B?RGd6by9mZE5NY3RUbDgyZnhHUUxxc0V6Q3JZVDZBNzJrbE4zSmlkbXk4bzFs?=
 =?utf-8?B?Q3RLY2NmSTFXUC9aai9CQ0dReEF2Vi9hVTV4MHJaTDd0Z2k3MkJZZUNmU2s1?=
 =?utf-8?B?TEt1ME9UNXhSNUFKMXprZW5UZjRtN3hCVC82N1RINlBESmdwUEE3akFXS1pG?=
 =?utf-8?B?YTgrNVVWV3A3YWhXMlBwTDlJR1NSTE9GWWV0L2RvRTRhWU5CcUlWZlJDVmRL?=
 =?utf-8?B?UmZ6bnl4YldqTktHaS9MZzJVdlZSM2RsTW9SYzMxY1pDbzN5Vjg4ZVlaZ0E3?=
 =?utf-8?B?aXl5NjRBU2kwNEtDTGJLSUYzalA1Y2lmWVdYbTIwQVNoZHlJZXVCSW9GT1NI?=
 =?utf-8?B?Vk42ektENUNsOEE5M3d5UVZEK3lJS1dGR3hCbzZXNVg0dlN1NTUzMDU2VTVq?=
 =?utf-8?B?STFEUEJHQ25ycWVnUi9PUzFHNmtBRUk0TGl6bUFWVHh3eDY5ejZSTUJXTmhO?=
 =?utf-8?B?WTVvZTBseUdOZ3JjLzRSQko0QjBRbWQwSGhYakFtc3ZMc1pGRFlab3B6WGJY?=
 =?utf-8?B?OUgyZUlhRE9yWCtYNWI5ajZjMFNyMnJsekJ6NXhsSFJCemFEQnNNbEd0V2dv?=
 =?utf-8?B?dWR2WHVack4xeXMrcmxBRm5pSHFOZE03cDVIZjBOWmhzd3hQTG9lZkpnT2Ra?=
 =?utf-8?B?TjRnaWYxTGllZDQ5QzVTd20zenluZVl3ZVhudHhlVkpYYmpDZFgweFN1elNy?=
 =?utf-8?B?WlVlVlhFQWxTS2pmWWsvVDVhTFZhaUxNNTZERXcxL0VLMGJHVGg2bzFtOFZM?=
 =?utf-8?B?NlYxRzZ6NFRoUldJMkYvY1l3Y3RKblpNUWVzVU04NTdvU2lvOHBMU0Z4VGFp?=
 =?utf-8?B?MWY5OHlsYlFQbnhGL0NHcGJMai9UZ2tLU09wYkxvWHpaMEZLaXVSWitLZ3Ju?=
 =?utf-8?B?WitrYUJaOS9Zdlc1MEVDNzV2eEEydGN0MVlTVXh3UUV5RzRJK1BKRHV2Tkdv?=
 =?utf-8?B?cEtDd3JLdmhnemhDb3N6Vm11dTgydEJQcUwrZW15QkZ6cWd0QlQ3MitqdUVE?=
 =?utf-8?B?Y2cwV0R6WHIrNE5vdHh5MTh0QnhOZ3VBbE1keVJmcmhDRjFWM243RVBPbWlj?=
 =?utf-8?B?KzFrc2lvRVk2RWxmUWUvVGRiYU8xdGlQN215NitlRzljeUt1U1ZlTTVzelN4?=
 =?utf-8?B?ZUdPTVRnYUhhK0tLNHE5b211RE04SDJkSUNFVC96UG1iMnBmbU95MEIrZEd5?=
 =?utf-8?B?cVVsd0lSa0NrdzcvRFJWMU42eHpXckt1YTZWMHU0eVlIUE5mZXFhRTlJU0pY?=
 =?utf-8?B?bXhMb1BCSEg2a29GYlRGRzNtMFAycEU2VmhIKzEzL1BmcHR4d1BRKzBQa2FX?=
 =?utf-8?B?TnRPelZnOWppK0NGaDAwRUt2OVFLd3E4RnEyZHpabTBlakJXWWpyWEVOa2xm?=
 =?utf-8?B?MlpLVUhJWnJ6SGhYV0xVTFltdGp3TDYwN045SGxLT21zZWpxdCs5R3FnMU5X?=
 =?utf-8?B?Y3pLWUdUR0dMREx1N3AwYkIydzgyVjFoMHdaWlRDaFpOcENyb0VyY0cxRmpy?=
 =?utf-8?B?aS9qL2VhdW9ZWHczUE0yNEw3UzF2eDM1ZFpFMW5KNVAxd0VkRHRQMmNJV1VC?=
 =?utf-8?B?STV5SlVqRDE2TDY0a2dBY2dFTkFmWUNxN3Y2azJQRU5SYWNwNVVyakZjWDlV?=
 =?utf-8?B?WDRyeWVGeERndFhpK29UdjhTRmdDN0JzaDVJbDlVYWEzSzdwSUlqTUV5aG5l?=
 =?utf-8?Q?pqlpW7d4Epf9Q7xFq/wysPQ3BOJxxw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 20:20:55.8743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b362759b-e23d-4fc5-ee3b-08dd35a21df8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191

On 1/15/25 2:36 AM, Andreas Hindborg wrote:
> "Alice Ryhl" <aliceryhl@google.com> writes:
>> On Mon, Dec 16, 2024 at 3:50 PM Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>> "Alice Ryhl" <aliceryhl@google.com> writes:
...
>>>> +/// [`mmget_not_zero`]: Mm::mmget_not_zero
>>>> +#[repr(transparent)]
>>>> +pub struct Mm {
>>>
>>> Could we come up with a better name? `MemoryMap` or `MemoryMapping`?. You
>>> use `MMapReadGuard` later.
>>
>> Those names seem really confusing to me. The mmap syscall creates a
>> new VMA, but MemoryMap sounds like it's the thing that mmap creates.
>>
>> Lorenzo, what do you think? I'm inclined to just call it Mm since
>> that's what C calls it.
> 
> Well I guess there is value in using same names as C. The additional
> docs you sent help a lot so I guess it is fine.

Hi Andreas!

> 
> If we were writing from scratch I would have held hard on `AddressSpace`
> or `MemoryMap` over `Mm`. `Mm` has got to be one of the least
> descriptive names we can come up with.
> 

...but, see the other thread: "Mm" is actually very effective in the context
of kernel development. And we are doing a perfect mix of kernel and Rust
development here. So it's not from scratch at all.

Kernel engineers will immediately know what "Mm" means! Really.


thanks,
-- 
John Hubbard

