Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012035.outbound.protection.outlook.com [52.101.53.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8870E374E7F;
	Mon, 30 Mar 2026 21:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774906909; cv=fail; b=q5MVo31SpU8lSkVCO3+KLeW2pn5xJ+u5YOEiadg/ZKZQ/qFXocYPAdxPgbagdIheHGUJ6c4z65B/n22CjdQbfKm4vdmMYXoRBuEmQvu4l411RR3IWVGElcAsJWmgZCoFHgGdBG4h9TluL1PuGfay+vRkdd5QV0NuaCuLSrp5E80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774906909; c=relaxed/simple;
	bh=ZwZCe92Gf3aQvrOc932Xzgcg9JUy64Li6NQdZJVrrt0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hai/j//gX9W1dNgW8JjQUaLopOVQVOqOKNLiKPIw3LybECIB3bcAzXzCrk8QBgZjyntYU+lvuqWHwKUvsWnZX2jExPlZa6mmgDiZ1xe5tRMzhF3k5GK9mzfeBMDAx0KGCicsStlZZ63Gt1u5jaqgCrRfaFZ3kyg/V3sm+I1Mbk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q/HxxTmq; arc=fail smtp.client-ip=52.101.53.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q/HxxTmq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H14fL2TPqwrIGgDQXGN3LFj3HpEmCLPXy7QPMJvJYSQQzJWKbCaBqE/M9StVTZ+fnXZ3o1wZuh+t6k1rm0bBSF76M07ohGIyFE8TQ35S7+4GvVWH4v+P4uiKjboicfjF6uKTfD/iWwRTJGqrAfzUmcmuI3PF8MZ1xVo6OmbodF5FAcBrjF3dCEwG8vyxEl7Ujl/uih7ojMpaO3qszj+zM3aisqahh0kbs2BQF+y970Gf3636VK0CU7bvPIN+gnbTzQ+dk7bIio6KGm4j5N2hGmsGpzMj1cEphrsn8M5/mlB8/UuDsiLi5AFRa54V2eOYfTqgAH1ZnEWVd/5MRSynfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LD2oYwm4CZULr6MM2fyygTQha2bIZ1rt4o8CtVLd8j8=;
 b=D/UL3HNiPBv8kHe/wwu5Douz1rqyggpOOWETuTyJ7hyIdsPRGm3tEpHsl+t/l3aSMTeQZ4fMUJ0UbF2pZYloN7Y9ia+gEnCOGk3Bwbv2+DOaIrkhiP+cBQLD5ELPz/2M/JCNBSP7Z30rvaBKKIq32+4ySvWFSmWFihfEmtYlz6yfg3W9QYfjdSG8FzdCOZR4rtxqYc3+slpOuBdjUkrTMpneWsvMxM/LizTigKWlMqhP23wan1J6qfukD8UvkhBRo6qEfOi7BcpmhQdfXks0CSee1VXk6jNh6xi04UmZxTaFBsYsoeBmHVuDsD4q0WvcTGWWI8jtO2eHmynPOlRa/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LD2oYwm4CZULr6MM2fyygTQha2bIZ1rt4o8CtVLd8j8=;
 b=Q/HxxTmqPO8qYPP5Pt9ThtQ0skdKhZDre+cHRLnTCAXxKX5JHfgh8N6tm+bygUcssjvdGjG62uZsaSYSt2KPUYxEdp9vqDW/SzJwNfuB2XwP565E1W0+IKQ9S0RVp8NT+WHA6L7nIjYpCYM/5qUC14b+ciQUo+vCvz77G8lyOMg6Mt46imwi1K1KvQPDdmKpC7xkeDO33KCLj60HAh50yZ1xAQp2R+baBUM8xBq9+0bZHvxuIL0ACORRIFHmsm+hIsy9TOK4lNf3lZShTcDgVZAp0Ij3rRsKGhGtk+0Ea/1D8/fiB8BXgfW8BD3pSVwcvi0FPxKMXsyRUQCgCXGLzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6482.namprd12.prod.outlook.com (2603:10b6:208:3a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 21:41:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.011; Mon, 30 Mar 2026
 21:41:42 +0000
Message-ID: <0c9af1c5-b3f2-442c-9af5-c156926442e2@nvidia.com>
Date: Mon, 30 Mar 2026 14:41:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/31] rust: ptr: add const_align_up()
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-17-jhubbard@nvidia.com>
 <CANiq72mwC9K3mOaTUsfrreJqiE7WumqcwqhXQK=nvhsb=024=A@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72mwC9K3mOaTUsfrreJqiE7WumqcwqhXQK=nvhsb=024=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: 354948fe-f30d-40a9-cfd2-08de8ea521dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5UuqS3q1ZLem+1xhwj/OxcfQI5ILSGW5UAsDz4kmiXHlp+TU8AVx4aPWQZDNMeYnAzUpXXL7i6yrSJpcGm76hoUJ1hG2JaADmOrsfptYVMdbf4SMrQRoUSmEYiwuR4NB/+eeSNvx80s9JXUm6sMJsk0gMqAoHhsxPxWliViUosdPv6I4bQdBNUqCEVn4a8cAZy68tXle6itglRavyqFYWNN8QfHwPVVOAbf3506x4T9Jec1XwhHRK2DaO9hFbbjJm98pQXnL7RYGooqnQcxUxf4sdav6FGeFtcRNw8DdJI09v0k1SZeF73rwmh6KgJ1FjkAd1+Q0Kxss08khhVHMcK4NOJ21UM2aHE9EcJj9PwXRu7XXsLlPH+wQXLlWicjSERjsTQQyR8ZoixpoyFPbaldmILa0DprSPaEOWynSncfMP71cZL4fU9atQa+1SDtGdgKLspPQJLEK4lQWre4+5gLYhpUb/52fXvoKlethgrloQFlyxJUPYk7RXoQp9FC1uKXHYB6XzTkWdAdbXEo59ZdDIVdJ3HIdvcUR9MQVspnQEe+QhhlFaYeFK2M1XbpRH7oVqDZzic6YD8nb8V5EI1VTi5VXL2l8jWp6MJHjOVeH1uhgzy9sXJNecuAd9fYdFsz5ilBuYtLK9NxcHfumFFXZxzGSucrwekEc22kJ1J0yVxKfitxtVbz1l/OTQY5X3oK7QuUJm3ZJDSugjj+EtTFPtMk8MJtDqgE/b7fRvTE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTFlaHB0TjMzbWo0QXViOERIczZ1LzdhQ042MUduTHoxY29LcUlPSXdqMElu?=
 =?utf-8?B?S3c0dXk4a0Fqck83bUtBdkZES0tpamNpcXNnbm1hOEZibkdZdkpZUE1ML3pT?=
 =?utf-8?B?RzlhWHNLUlU0UmMybGRqajN0VURDQy9STnh0SmNJd2d5QmlhTWZrRng1aUIy?=
 =?utf-8?B?OHZoK2UzNWFENjZjTVFrSFh1N2tNMk1aK0FCWDVDR0V4RGVUdlJvaFV0Uisw?=
 =?utf-8?B?SG9TbDZqMU5sTUtyS2ZwOGF2QkpodGRoVXhWZG9WU1RTbXpLOTczWnV4cnlF?=
 =?utf-8?B?TnFad1ZPOWVCQnlkTTkwU3RWb010c3c5Mm9ka2R1NmJmQmVKNTgwTkVKQmRS?=
 =?utf-8?B?dGZtSWtuaWZqU0RBNEhFblhpdEV2YnNFb2ZNb0YwbHJMQ2JXT3J1NXJabm9S?=
 =?utf-8?B?RFlTK1ZnNTg1dkdlb09uRm05QjFoSkRUWDhDNGdVYW42ZG9rTTcyKzdGUXls?=
 =?utf-8?B?U1ZKSnhvbFZGbzNsNCtIcndMUmtQV3lUT0N5aXFTVk5sRWpzcWl5WDRoL1g5?=
 =?utf-8?B?YWlwRHE4R2JWYmFQS3VvZWM5WGs1SjdaNjVOMGxSeGlBRWZzL0hoUWEzWHd0?=
 =?utf-8?B?NXBtUTJ4YngxMWJpcUliNzV1ZkN2R0FFWjU5dE9SbVZYOE1zczdObCtFRElj?=
 =?utf-8?B?Mm95YjdmL1BNbG56ZG1sYkt1N3JSQzNQN1R1RTE3MHMxYitkQU9TTVBIWTQz?=
 =?utf-8?B?aXRVa29SUUdyTTFia0pxbkhKNDR0VWlNSnB4a0RGc3hhR05pQm1zSWtlNnU0?=
 =?utf-8?B?Q0ZBSjVEZ2ZjeGhOZWN6RDU3d3Ayb0R3aUNqbDlXU2VMM0dsNThSdnduY0Zl?=
 =?utf-8?B?ZWtsTVIxOW02NFdyRlFkSVVQYm1yaWw3TGEwSTVJRjVKVHJZRXpjRXIyR3Z2?=
 =?utf-8?B?dDFvWFkxR2RYaW9zZjQzVXAyamhYRHlOSFJTb1B4VW5yeU9Tck1sR0NVWUp3?=
 =?utf-8?B?eVRHSkR6ajROVUlXN2FLOGVMb1FpNFIxN3Y2aDFLRGtwMmRzcDBKSTJTbGt1?=
 =?utf-8?B?dFlpdGFvdVc3LzRsWUJKNHVKdDFUV2RjdjgwZFpFKzBRTlNOSk54bG0rRkx6?=
 =?utf-8?B?Q0tsbVdWQWc2WXA3SU5PRCtxMC8wK0UrVUhEVkxoV1RnWWlSQmJDRm9mWXRt?=
 =?utf-8?B?bFB6L291aVhjNlhEVXltL3BEWS96TUJjTmFGbForZUdnQ1RYUGZoMEJjeFd5?=
 =?utf-8?B?byttNCtPYldpWXUvejFJOWR6RU4yV2V1bEFCQTR2a3F4d1RuQTlxLzJyT2hP?=
 =?utf-8?B?NEZzalRxZVMxSnRzb0pjbjhhTkFLWG0rTVUzNTdnNWdjbnRYd0dORzhDdk54?=
 =?utf-8?B?THdQL2RzY0Z2Z3FVMERrZmhPdzh3c1czbnlLOW9iRzdscTBzQXlmT2dVZmtN?=
 =?utf-8?B?TUQ0Y2l6dFhYcU5uS2FrVnA0ZVRLbWcwQzFJeHk2eVh0c3h1c3pNcVNNOVB4?=
 =?utf-8?B?ZEorNE9lcjlZcWgrUE11R1lOQ0h2TzZKRHlqVm1OcjZMc0pXWEhva2JQNHVs?=
 =?utf-8?B?cmYzQmV6UnJuRXNLS3hRRURkazJFQTVCQWVkb000NDErcjJ1c0RBVlVoN1hx?=
 =?utf-8?B?VUFValFZbksrUTd1TW12Zmw1VkE4azJrZE1seDFoczNSWmN0MmtjZnJTaGFU?=
 =?utf-8?B?U0Y1L2ZTaUErQ0VnRXVEdUtlT0F4NHVwT2lZMXBINWhCSzlGSGF0UmJJZ0g1?=
 =?utf-8?B?dldDVjJ2Rzlxeml5aWJvNVo2RkV4VHV0ZzlHM1o4REI2YVRSekIxYlJ0SHM5?=
 =?utf-8?B?eHJIQjY1YXVGM0dTTWphQ013ZytiaG9Pb0JWSGR2ajliZ2czS2NVai9UcDFP?=
 =?utf-8?B?Q1JxWjd2b2NyY1orNUJnd0MrZ3lPK3NVbU4wcFh0VW1yOGlCcEdPL2hCc25C?=
 =?utf-8?B?azZOcGlGTStKMmxDa2VubVV6R0tDNGw2VkUwdFkrdHcvaWh2TnNJVi9peTI4?=
 =?utf-8?B?MlFWcUEzd1RoYzdTZzdyL2xUaWROLzlEWTdRU01RRkpPR1AzNEswVy93RmQ2?=
 =?utf-8?B?VUdIaFBWcVVkREhiUnpGczZqV2pKWmV4WDM1a0R2MmdsM0diZ3RxRmthZ1hQ?=
 =?utf-8?B?U2liVEJJY0ZCYnNkMjZiWWtPQlhHamRlMjFhQVpQUE55UmRUeHhiNDJXbVBV?=
 =?utf-8?B?TXRFazg4SVFJdnQyRDZ3U3lyeUFISUQvaWdiU042S05vV3pORTdQK09yanJF?=
 =?utf-8?B?aG1Ib09RSHNaWFNkaE5tZnBiem9KSm5DWDM0ZVR1Vkl5dUtYYjhKcGtLbzVl?=
 =?utf-8?B?WlJsVWYyemlMcUUvcWlzNXVJVHByVU5TTERRSVBGbXZDZE5VRFdWWjh1MTBW?=
 =?utf-8?B?eGFhUHZXTExLRFJCbElRdXhFZmE3NUVGdGZ3ak5OR2JNTnVqcDRNQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354948fe-f30d-40a9-cfd2-08de8ea521dc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 21:41:42.4222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N12hdaK9pyEegn5H89EdVhbK0N8AMbQo4VflvHUDBzis8TIWogZ6+1AZGtOqSvpgW/W74fpirtvdSnsa11dA7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6482

On 3/27/26 2:33 AM, Miguel Ojeda wrote:
> On Thu, Mar 26, 2026 at 2:39 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> Add const_align_up() to kernel::ptr as the const-compatible equivalent
>> of Alignable::align_up().
>>
>> Suggested-by: Danilo Krummrich <dakr@kernel.org>
>> Suggested-by: Gary Guo <gary@garyguo.net>
>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 

I probably should ask this out loud, just to be sure: is this
patch on track to get merged though one of the various rust-*
repositories? Or more to the point, is there anything I can
do to help here?


thanks,
-- 
John Hubbard

