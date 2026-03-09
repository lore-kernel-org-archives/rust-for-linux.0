Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E2E349AFC;
	Mon,  9 Mar 2026 18:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081265; cv=fail; b=ehLqzT+/0FauS+v6ppAp4mnAyIF3AWlfbtv/M+J5AO7JhyvM59xqQd1bkUD6PwPajPm1wuhQFmGgtAc/hgGTobSvjKHPvqhdNmxXd1mWW0pJuvqR9CBY5AsO4RgiCm6ur/M3VGviE96FWjHyZzz3ZDx+cQQVTaoWSdpw0nRZHW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081265; c=relaxed/simple;
	bh=1orAvaAmIdN9llPLmtchcSbN/J1fxNYvMZxVaZtH8IU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LOruEX7PoH3w1O56afTU0FNGHwNt8Dw30n6234dYNBwWPu2R/5khilUsTWsUH88R1Uwam62UyeKKNRwbQJ/p4W891dGP0JP7vuH8PqzGVA9mOUc4Z6jkrD8Wgng+0sWlBEk0tIGC5/Xhfq0E/mO7ZWlsmOU43ZgOwxFs2tEQ3pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TJwJH6MO; arc=fail smtp.client-ip=52.101.53.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TJwJH6MO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l34o1lLvO9KeBAjz32ZVTL8p/6JyMb4030Ur9S4fKrairu5NaJEezVJpYAGypKUt1vTu6c4eXH4t+VK27nRk2t3vQN3jLDKxNFzE59NFBLs2XvxRT5teZTCfyhgbUgxX5KhO1apD4O6kmMTmj9SRFpfvSccsYztYC21iLdSU72+JAPxKUPLSQBH9SlwtKkOluJbyEwm0zLi4Y4zOmSx+QDSRUk0j0J7swhdbiBlHCEjh51tUsCt4N5ZTpfOABIJZ2zo0r8DysjeixZlGyCdBLLxP9b4KyIX7VlY6mR4VJrUAIOk6NFwzc64Jy/jIjWmk9MKEoCFy2/pgyuLs3+H6IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggkNlxifBbaJuMjKFTLPKiGpGBM7GA9/FfoiyziV6aw=;
 b=FVICzTip22DrARGqyTJbXAQ9PBogwpvbogIapEIpOoGxgoTm/73c6c+37E1M6acFwmDRaFH2Mu9WCDLwovNOnr2whaOgHOTMf8kMEuasNZthtPbU4RVfE8cyQjWcKp63ee6/jU0D+1YdnfywPRAlLjC0YNIeIU4I547MFKvl2wTyhfNTUjtoHh3ZjEq3fiDa0ebcpxiGgJ7FScWly/Whap3fwZNcYm9NW8e3pH5Vc+mvh6IWOrL3pkwXZz17pMr99l3ewqJX652XR4WevixRRmUJA5zBmkzGR1nQgRkOumQs9Wd2zHNpTXcDMLK3CLs9kkCnaoZ3yEv786Wv+bPjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggkNlxifBbaJuMjKFTLPKiGpGBM7GA9/FfoiyziV6aw=;
 b=TJwJH6MOJoFbHf2clxma/hK4QDHW1ECITBFprXC/HMWxMt3RYJIcSC73/C4WLYcZiSFqcHRxiwHNIgw/KKdyRnhGwEGnmEm6oJsuZBJmsJHPdGwM02/nArXLZsNVhjVX/bjGpBxxNArbpZZVva75I4wNx3QeJR+NAb+c22SYNhuDGyBV5Zxnc8/6pTtHOChWtxHdQQ5q83f556bXdX5U2HNY4KblLRV4vCAKbW5V2chPszZWDP65pwJKGze3VsMteww0J65pDxSBX3Hi7ZJKWW/Zwe6PDbAunfv/RXFlzzTPweI3MuePJG/D2mVhm22S5prvvo2eBXFSwmQETP9lyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4483.namprd12.prod.outlook.com (2603:10b6:5:2a2::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Mon, 9 Mar 2026 18:34:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 18:34:16 +0000
Message-ID: <3212056f-f1ec-4454-b07d-ec96ffeda266@nvidia.com>
Date: Mon, 9 Mar 2026 11:34:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH FOR REFERENCE v8 10/10] gpu: nova-core: use the kernel
 `register!` macro
To: Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>,
 Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-10-424f80dd43bc@nvidia.com>
 <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
 <d85a3776-4a73-457d-8722-82d8dfc58591@nvidia.com>
 <4f7baebe-e993-40b5-9cb2-3d4699da1299@nvidia.com>
 <fd45410a-43cc-4d8a-a750-6f3211dd2797@nvidia.com>
 <DGYGQ78QQUDO.1TVZTLEWVG6HL@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGYGQ78QQUDO.1TVZTLEWVG6HL@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0053.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f94d7fa-6d7d-471a-03ce-08de7e0a783f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	TXH32u6PIukPB4C4YrRK2JEq7heXx+CsQ2OR8dHfOE1IhF/Q/DXb4ZlIgLp0vAdYe4YKowGOr/Rrj0vLgw6L27sSzA4nzEcz5870Ow/F/V6aH2rtRUneDcnnBjntKPiGEcxqrmPUr1WzPegfmr8fwrCUnU3zuo8YfMLZivXIKQv/fxSJhrhX9C5HQRcGHmdNfgYt60X88crdDrhkxLpREUh3a0KehKNh3JnOhRskQyrjAZzCjt+vM+3IRixV8Rj6H62suJzPJUwKwC9XbDZrFvnzLO95AotD9a42Dbj6ivg2tKMbrySqRWU+XPX+K5RdCHAzhLsM4HWoVHFjcTM9DB/Lt9H5csbl0TFiue4Q4NjJo6XgL4mUoH20mM/eXcwn/p2vJlb5X1oyBAt1XAWL3ZDBktHWErpO/G+87T9W9iyNapw33Gjkaag6DFK1vDDN5OTiSgPsWqUVNwM5QKVwbCdGpowBmfemIHJ+uvBxCtxdYxM9kTRxAJ61WzsDjHRw7mL/CvXb/ApA4bpOFcJsWZsunmCdOKA/UpGsnc4m3a/uSCS3w44ysK2eBJ3b99RbnQyYmmdPs5rLyFjP58R/Mj5/wlrxUnVTPZ/15EVH+7oxePDGFeLQuR/aIJpBc3BoA2kirzBfoSmu7+RBB3Rm0Qt4tCZBxIBjEtogaFO8NaaIZe84RiyjMw14KHLSMfqDq0eukq2hbQFRinh6NxXlvCrDTCJ0ZCKHpF7BWxCt5h0rztHjrTbOPBKMAj5CL7pvAIBtChymN75sWOE3lbckpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2ozMlRpbTVSb3VIak9JZlpkV2xJZ1dQUVZvbGhRUkt2ZVpXWkVBVklPcmZJ?=
 =?utf-8?B?Sy81QjA3dTVLay9JSnJPT3NSczZzSzluN1Q0SkN2WnRXclpIOHlYdi9TMHl6?=
 =?utf-8?B?Ull0WloyWXY4dE1Zdi9uWXA5bkNEYkI0Y2R2YTZJZnFmY0xvdkp5UllwSktN?=
 =?utf-8?B?UkU5V1E1V0Nld3ByaUVpRVBaQ0N1bktUdjNBcVNsNllkODdOTFprcGZoQ1dN?=
 =?utf-8?B?MllJTjVtVXBNa0hERHNrMWxyN2VJd1JNWGhHajRDdU1nSDJWUlpHV1poTWJw?=
 =?utf-8?B?ZjA1a3ZNV0xJcHpSLzB0d1RmU0VKcjBZeCs5MEJwVHR5a2ZQeXMrMzQzUnFq?=
 =?utf-8?B?d3Y1RWtGaVgrWWd0UmFDd3ZvSnI1WEE4MTRZN1MzbGl0YWc3V0ZZekEvTFhC?=
 =?utf-8?B?a3pkQk5rQVhhc2VtL1krTnlaeXJTR1A3M0F6OGZmQndMcERFTEdmbnRrMkVi?=
 =?utf-8?B?RU91b2lxWlZFWmhwRmFjRzJaSW5NT2t4cW0wemZ2N3BONGxsQTNZWmM1MXJB?=
 =?utf-8?B?OVdNNEk2eTR4M3IwdGw3U0I3ektRTHZ6SC9TMWdLd05GckdHTmlJNFJxd2Rq?=
 =?utf-8?B?aVJmME1uRitYa3QwNm1rSC93MXc0d1NwSkRaWnVpcWRmc2ZoM1EyVVh6eHNh?=
 =?utf-8?B?bjZjZDJIai9HNXJPUjVkT0RWd0ROVDl3YW5wTS9LNGQvVkVHREZ0UmxHd3VJ?=
 =?utf-8?B?SXJyWnBRZUgvSG45dCt6Y0tNNmpnNEk0RkxXY0pVenFrQzZ5dFh4QzdvUUxG?=
 =?utf-8?B?SnJlMnUyOThkYzZpeHRaajhuQ1RvUmpLM0FCM1lKMC9HdUNqWlNLTnFUNUZl?=
 =?utf-8?B?T2hYTGVSeDJLTDk1bkc0eWUydHpudHBocCtQTyszckhSQXdYUWFxaUU0VFhp?=
 =?utf-8?B?WUJsQWJLRVVmOHFEbmR1UWM5ejdwYU5scGJISEJNZGtFazNxYjFQR1FvaWVX?=
 =?utf-8?B?UXVnSnlHM0VkM0dabHRCeVdaQVpwcnJFN0p1YTFBNXkvVHlRbU9OZU5HenRa?=
 =?utf-8?B?R2puZXNhZEZ5cU5xN09CTWJkL1Jsem1rMk1SV0lrMkdGakZldHowOWtmcm5N?=
 =?utf-8?B?b0pCQWZ1enVrZWE4U2ZtRFhxTkhwbHZldG4rcHljMjZGVEY4RXNLTDlmWTNB?=
 =?utf-8?B?Y1VVRWxiMEtTWVV5VlpHNG1md3REd2xIdVJoNG1rb3AvNE9KRFZKOGlNMmI4?=
 =?utf-8?B?SDdUUlArUmlLck5JWkVGZHB2YWdKbEh1WllJdVgybnVobU9mN3pXOGI5cmNL?=
 =?utf-8?B?eGJnVitTU1RQTE1TSVpFU0FFVmhSRnZCSFNBcEUrMHNqVkZNNzlHREpOV2NS?=
 =?utf-8?B?ZmFCQy85Y3VqVTR4Y1hSdXUyTlp3Vkd1ZS9kdnd5QkV3SkhyYkNCMGppc01Q?=
 =?utf-8?B?UXlrWmxUek1Id09URXg4RGp0VEE0TTFmZlVoK3FHdC9QNEJzeW1mWXdibVIy?=
 =?utf-8?B?OW9BYnJxWkV2UWd6cHZhVDNJMnp1S0pWeEo0UWRmUHVJenN4Ukl6aUIyYXFC?=
 =?utf-8?B?blVncHZCUk01REZtV0VPYVB4Z2xOanFkL0hXU205dlJyVDYxaWlJd1owRG9N?=
 =?utf-8?B?aWViVVQ0R3E0Yk93RkNWSHlXM21oYUJZTEJ1MG5Md0RyeWkvWDRwSUNXTkJL?=
 =?utf-8?B?QUhkWk1BSk9lWWcwaVhIcitBZGZXSi9NME5wZHI5b0RIMUFyZ3RLcXFGTkIz?=
 =?utf-8?B?TFdTTlJibHJGS3hWQ0U4b1VwQ3lHTng2ZE41RWVZeTJxNStHR09XUSs1MG9q?=
 =?utf-8?B?c0NCUEczZWVKK1JWd0hRQVd2QUYvZlNZR2tiNVhpejB4ditVUHQ0RjV3MG9I?=
 =?utf-8?B?LzlrUTVIQWdZZTdaK2RmbktBQUo0RDVMZWZrdGJVWndzNjRzVWhlVGFBQjBo?=
 =?utf-8?B?aUR0YlMwS3RpUXhVdDhMdzlMempybVBqYW83eEVPazVubVZRRDRkWUt5VG1F?=
 =?utf-8?B?a2lPR20rUEJLUlp2bkVudkRJakE4dG80M1RNOUlJaEhsNFQ3ejF3SkR4ZVlP?=
 =?utf-8?B?YjE1YWxPY1lUcnZJdU9KYnVFWjlHZXdOR2JMN21HZVlJTGJqdU1NbWdJN0Rl?=
 =?utf-8?B?MGU5elZPVkpYU3lod2R5WmJaUDAxVFZvZUFKK3k3U2phTjRrTHBuZUJhTGxQ?=
 =?utf-8?B?OTBCY256dFF6TW80T01ITTAwQjhIei9CdFF3cEduUGNIcHBBUDJEWk5OTmNG?=
 =?utf-8?B?K3VKMXdtVGpIblduN20zRXA2N2NGVVJ4OFlTSGQ1ZGJoSnE2WmxnVFg1UXJM?=
 =?utf-8?B?QjI5YTJncFJucFRyU2pzWUNSa1pGQkxTcDZJTXd4NnJKL0V5ampWZHE0REJ5?=
 =?utf-8?B?dWliYUFaK0VHREhwcVdxeVZZMmg0ZnJYdDhGckFpZzJLaE43MG92dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f94d7fa-6d7d-471a-03ce-08de7e0a783f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:34:16.7229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQCg68XM+SSD0p3P8hHjHyW/iGTGnh7BVaoAro/GJEFVvGIZadK+2494t7dl8O+rlVJ27/cnbHBb6gKtfS1SSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4483

On 3/9/26 11:28 AM, Gary Guo wrote:
> On Mon Mar 9, 2026 at 6:01 PM GMT, John Hubbard wrote:
>> On 3/9/26 10:51 AM, Joel Fernandes wrote:
>>> On 3/9/2026 1:34 PM, John Hubbard wrote:
>>>> On 3/9/26 8:43 AM, Joel Fernandes wrote:
>>>>> On 3/9/2026 11:14 AM, Alexandre Courbot wrote:
>> ...
>> What about this instead (*very* approximately):
>>
>>    // set up or construct NV_PFALCON_FALCON_MAILBOX1:
>>
>>    let reg = NV_PFALCON_FALCON_MAILBOX1::zeroed(&bar);
> 
> This doesn't really make sense. What does "zeroed(&bar)" even mean? You're
> neither zeroing the register on the bar, nor constructing a zeroed value?
> 

The idea was to separate constructing with a zeroed value, from
the actual register write. I am not surprised that the syntax
is All Wrong at this point, I'm just hoping to spark more ideas
about how to make this clear and nice to read.


thanks,
-- 
John Hubbard

