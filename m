Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD9A303CA0;
	Thu, 12 Mar 2026 06:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773296614; cv=fail; b=XUzKF0amBe+beBc6nadUvhLImBsjQriC15lhDU4UdxweazgVcNwO4p/qKOrlQ/8vk4Qi8BkXyj47w4vSckrAFR+kRqMfb0x29qRaLz6YM8hqrTAiyB6qO2W6XSnC7bVyMZgHThWUrFJ/4trWDX5kOyFMPrm3F4Swdm08AgbD4yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773296614; c=relaxed/simple;
	bh=sD48bb625crilgnAkcGWMV2gSN5jPrjMT76fKUHhobk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MEkQEaqVpe3gjPGJMKb5d1g+mz2gEhBEI8fdt8b2f5ifo22sVSLXmYQEKfiukGwOzOE0x7285SPpogDyxvu+cvEMncqDtk5N91+Jj3+ZRCV1nZC7pxNrO2Cu0cTYSgDXig49i+nIuT6m0S82xlUIsHnPmqwJb2sjlvMAXXvhXKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k9WzkgAn; arc=fail smtp.client-ip=52.101.53.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k9WzkgAn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVRmnqtFzeEm1dUQ54X2D/OehIKxGS6Toh7SS8FJ1Zk36vFql0DxO6vcArpkAY/RQFiyxD5ouwu3Ibw/9KMJQEfLVcTJzPf76sWDdA9EbMiPJr1FnqEIsPmpQ2BgsFDMLqeZQ9DMXH47nlT4Wp4S9/p9YWxkYml2SmI1SMDq2uoqvA17UVpZLM6wbkz6XfkJG31lCL/rCy2L4etniWXthCYAE0vR82Ux5LCPwvXz1wAsPQrxhZqqn2Y4JkZ6s9QUDn/N4cVDTlzID2MM51n+7TEldi/GqC9/zIaferc7IV7y+ZIbKAnBG300cNmfsxR1s7lSN1Rq3Xa551RTeGnFpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCyb6Z++cwEW2On8bMOK6sbIChbT6OK8Bzb2Xw1bxbo=;
 b=jcwkhejE78UIBd+wY68/ntr34MK/66TC6l8T0HWC8eYDuQ6TT8GE4z6dwGJ1pVKYv3Y351I0h+EwIc25ZyhknJduyYZGxyOcgkIpQr2083Efcv3L9+Vj3S8sqIonlI+gNNa6VTI0xl3oaeiv44NLD2mJodYVfiuYXRmzfZZlHhrabALTX4YZOzLc6mjZp35p6ctWtFexT6fIzpUoXe8PNzF1mJKSZouBqv/3vJLUNTSisYTv+yMYArjZxcYo7YNNk/zraR7idjJo84Ytsx2T2Yl3XV5PClffrf2xN07/4fBmhCmUcCpEic2hA4L7nIoClMV5B/QoFjdbZS1SwvzjTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCyb6Z++cwEW2On8bMOK6sbIChbT6OK8Bzb2Xw1bxbo=;
 b=k9WzkgAnvBQrQt1YPBuL4eS9vHr1nY0vvgw2hos78W8vVUMfhjOPc/5T0C5nAQhPJHVlqZ6Nc0opDc0/GTPkQ6/wc8NMhf2ldQ+49hjivp3AqZgSdKa16sZ8bJciegpSD/z5YfuvyimvZyFUGublMdX8ADwWkdqyRLy6O9a6SoUXooT0zAJTnbdNSQn2D+Z8/EqDK7e5z2fsA0YvyAux3HGzS2VyIqOLTLB3I7EVnCVHVMpLndwDMkHeR+FMWENOKZh7NZsyX0yIA0br9fJxwWTd76JH7tdPkoKdcWfhzBTwcZavZ7lgzDrg0ETgN+fjDdMnVtgVeXJHNN5tZCRKAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6215.namprd12.prod.outlook.com (2603:10b6:8:95::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 06:23:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 06:23:26 +0000
Message-ID: <5afa30fd-d1bb-4cc4-a014-e5b63b7947f5@nvidia.com>
Date: Wed, 11 Mar 2026 23:23:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] rust: ptr: add Alignment::from_u64() for
 DeviceSize constants
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
References: <20260312031507.216709-1-jhubbard@nvidia.com>
 <20260312031507.216709-3-jhubbard@nvidia.com>
 <CANiq72=KjVoPJii7_i-vfe5AL4e5-Lb-qd99j2JR5ZjK1a69Ew@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72=KjVoPJii7_i-vfe5AL4e5-Lb-qd99j2JR5ZjK1a69Ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: 03493d54-cbd8-4f9c-311f-08de7fffde9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ft204BBMBfMOfGFk8sgY+6qipuxlwE43tG06XGjICWkv6emaupGPAL1oEJERPCCpfG4APaafglV/zE8LpTS70RZnhP8+/D3rSrgDk/zJ67X4GE1gZ+LYETjwMCOdrYfmS+7N8JtODjEgNx20AiiJPOaMCs5ahInxe6nI9JxhCWkmyk1ko+57q2fR0Z1/NkVSNLXu0usu4h7LSZmBFgEWI/zuYdezjgugygrslB4dXkV+2T7Fpqhd7y8czUWbY1ovCPoafA5JY2sHR/zFJbrrjsEUsLRuYJv7RlQS2jGpsQaU2dPizG0ffpkzjqvZR7Xxv642MB1D25DT+F6dlEZAdUgvRJaQ8CIBLy5kvhhPsx2H8OMIiNlo4bt+gDu2fYtZ63hAY43CQ8iZd9l6+nyc1hOaeGIgXiDLMKFkZ3r35DIeBYQIIGBNEH9cS910YAAg0bMLuWSRWIkhJIhOBPo9f+ObZsELWzjHH3ORW/DPHDuRdQNjaedsIAt9pRW9BIPCX1L2yTToG1yqXwZ8vxN3kcNCWma57R1XsIlZqcEm7wpsrHANZuLB4moDf9GAfSlPhnhHtzB2csHLEUSw3YTfV7eesBxZPY/0cRS9Oj5/rDTWB5R3wgLcbF4zoycZF9mAtTI8wArLuql6yW1DnK5O7GLz4/xDM6tOaGSahQJ7hWgklfZaVbE5HXkNRM6WZ6F6bZbvVV7spiNaISa19sM/rUbnD7XFGzYikfy6G68tQIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjJTZDQ2QmVJZFFDdGJCQlh5YXQ4RktOb05waTVWVzVrZXdsQkQ0dWNkTXli?=
 =?utf-8?B?SzlXWUNTK2k1QUhkMEZwdDViQW12cFM4V3JmdCtFcFl1b3lkMkdKMVZZb2M0?=
 =?utf-8?B?TWxZWVRDK2t1YUhleEZSRXBhSEZCeDFOWTNFVjdFc2FncFZXalp0ZFNmakVp?=
 =?utf-8?B?a3J1MnhIMWN5dFZRcVZiNUVJQ05IdUlNTXBXeEwzc3JaS1NDSnZFcDVQQ2Jz?=
 =?utf-8?B?ZWlUNktvUGwxQnJLVEdSMGxEQjFXRkNsMUNvYk9EZ2xDSHdZKzB5V0RFU1VM?=
 =?utf-8?B?bW9TeXFzRXk5UVBXWXlpcFJYaHk2S3NnbFRrTWsvd1VBR09rTWp3SlNBOS9U?=
 =?utf-8?B?R2QwQ1RqU2tyNzlSZkpSYTNGcUFsMlVvaThYVVcxdTBncURyRnJWV2hOM3Yw?=
 =?utf-8?B?YStiblNuYm1VYmJLamVQZE1qUWNxMEZid3BCN0dZT1h4V1c1aFA4YWwvVmg5?=
 =?utf-8?B?endER1RvS3hjcnhncXJuZDdVMWpMV0tvN3NFbGVwazZMQXZ1UmJUSkI3YnBW?=
 =?utf-8?B?TFNyaW5tRXd2MkdvUFQ3OXhIOXcyWDgwQW1GVFBrL2ljWVkza2V6Y2xJbW52?=
 =?utf-8?B?T2J0UTRUVENqWElVQVBFMU01NkJjOVBGL1I5eklZKzU0UFNMRzNsZHFIR1k5?=
 =?utf-8?B?eDFZN1RiMHI0eDZtTGxhcHJPVTlneTNvNjU4ckd2aURkTEhHSnpUY0ZsdFdC?=
 =?utf-8?B?RWxLakdRWFhLa05YWEErTi84TlpweGE1ZFozREJaNjVRSjhwOC9pL3U4Mmxa?=
 =?utf-8?B?ZEVrWm16ZXJoTHRRTENxOWZ6VGJjMVJxY2NPNkdoN3pycGErdWhqOS8wTmxB?=
 =?utf-8?B?ZUhhR3NuOE8rYWJsa29aeEszY0ZSZER5cUJiWTdWYlgxUVJhaXU4bnJhVGtp?=
 =?utf-8?B?VDJnY0RGakZ6cUI1SE9nUmhYamsxOTNTR1Q2VFVhMmdBM0d2YjJSMjBNTFFs?=
 =?utf-8?B?NktyaEprRkZnNlBGSllmUjdIZmk1L0lVdklqbzBnREJobmdvYTN6Zmd1S0xu?=
 =?utf-8?B?MWdseVc0QzlMdmoyblVzVDBQc2FLa1lQMGR0RmV0ZVRja0pJZ0tuTDUvTmZ0?=
 =?utf-8?B?SEV3UmlXK0Z5WjRxdENIaW16Q3I4d1UxdjhBcTVhMzNCSENnanFTVG9zU2hE?=
 =?utf-8?B?eG9NR21BcmliZ2hyUkljQkVtK3JKQkNJeWZBcEVzRGp1QnlzUUpWdjZrdm9k?=
 =?utf-8?B?cTQyajJQNnZoSWJrOHFxNmNiYkw1Tk9LejZiMDNKVlN2aFFUS3FnUHRpQmpQ?=
 =?utf-8?B?cFVFRmRpamlCamxRTEZFaHJqYWF5Y1luVTBOUzQzNFVJRE1wU1Zvd0E3eU5k?=
 =?utf-8?B?TUxNaytreWlZdU5WWi81NXh1eUx4Ylc3dzF6b0ZZOHRXRUtBYVgvUG4xS3VJ?=
 =?utf-8?B?aGl3bExrcHZSSWEwUGw2eExHcUdqdXdDV210RGVzNDB5cU5GZS94c3A2b2hN?=
 =?utf-8?B?dE4reVJwTUp4ZzhGOHVFeU1UckQwWThmU3ZLb0FZOEltVUVDSTJxbnRHYXFM?=
 =?utf-8?B?ZjJJUmRlL2dpMlc4S01zL0NsZWNQZXE4R2ZVVTZsTVZadkpZN0JSUnBoQjJO?=
 =?utf-8?B?UTk0VjFwN21HelBUN1BsRFV3Sklic09ZWjNMaXBMaHllcm5nc0VxL1BQVVEv?=
 =?utf-8?B?WW83ODkxMU1EaGVpZzBIK3YzMWZ2SWxGekdUUEFnWkNZWG1OcHZYaXlmWHph?=
 =?utf-8?B?T2plMUhGWVY1ckFRb2V4alZISlQ1K2lpWHcvSGlqbnp5RFVoWWorWWlkQWx3?=
 =?utf-8?B?ekRtR1lvSnpaOFd4UDRxR1pkMzFUNndKOGp5aStVRDZId0Q3T1UreVRkNDJT?=
 =?utf-8?B?c3Nsd1JiZE1MNHowNUdkelF5WjRuYTYxdm9qaGRrMUhCNWVybW41UEtsYm0v?=
 =?utf-8?B?QllvR0VHM1lKdEVwd21LTHRBellHUFNZMmdtUWZvelFGcGg0TzN4SCtQck50?=
 =?utf-8?B?MEw1THR3Zm9iK3ppcG5ZSktrSkNXcDZJUmxoK3oxWUhDNFM3UDRzL1VOV3ZZ?=
 =?utf-8?B?T0l4VGZqWE85UU9MRXFWWHYwUnBCcm45SFNRQ3h3YksrbTB5dW91UkFiUVBo?=
 =?utf-8?B?cWJ5V2NFNGZDZXRoOHFCT3FrdHBKY2xhQ29HVzY5Nzlxb2dPWXBacG5BVU9Q?=
 =?utf-8?B?ZGs3cHRubzl1Qm4xMk56cVNBMUpOVjRsTXRlcS8xRzZqWG11c0VURFcwSjBQ?=
 =?utf-8?B?a1Npd0UrUnlpSnZCREtBZnhkbVRWUzNzTGt4Vk9NaGZUOGszaGhqWTJ5c1B4?=
 =?utf-8?B?RVQ1cEhIeWpZUWdTU1hGdnFldnFiM1JGMHBadXBxQWFJMGpGWWRzc2hyZmZR?=
 =?utf-8?B?Z21VV2lTWloxM2tZaVZaRjJTUVBwdXpvb1dzelJsekFRa09vOUVZUmxaM3lj?=
 =?utf-8?Q?Xy2sXzoGnNPylYU0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03493d54-cbd8-4f9c-311f-08de7fffde9b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:23:26.3937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qq8MM9dR8kVI3aWjk6OdV26Ar0j2fIiWGvyFqj9klNClXoD0PE9r/8T4rX1MB7hT+zF5f/8sltR36Rw2n8mww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6215

On 3/11/26 11:16 PM, Miguel Ojeda wrote:
> On Thu, Mar 12, 2026 at 4:15 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> +    /// A build error is triggered if `align` is not a power of two, or if it
>> +    /// exceeds [`usize::MAX`].
> 
> I think this wording comes from the `new` constructor, but there we

Yes it does--guilty as charged, haha. :)

> use a const assert, not a runtime one.
> 
> So as you mention in the commit message,  it is true that if you call
> it in a const context you will get it at compile-time error, but the
> wording here in the docs seems to imply otherwise.
> 

Good catch, thanks.


thanks,
-- 
John Hubbard

