Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011023.outbound.protection.outlook.com [52.101.62.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42434126F3B;
	Tue, 10 Mar 2026 00:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101204; cv=fail; b=tEwpSC3GkdfmJ40k2QUUs4X0sUCgEGCeu056i5Apqtawc64uFctNjjbnxzOhU5j2wmqznOlrFes3Eke1h+hdmXrgWGBPR92UEfEXrRJn6eJU7P5ESpMsIu/MN2apGjiC6o0n63tJHcaa9x5XDM1gC4HzhdQEQfLa0UxAOT+q3l4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101204; c=relaxed/simple;
	bh=5jdYpi4Abjnlv27ceUun/+QMPpP+BUzs0qBAJfCURwk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mok+w/ZsJ/lZvlI3VTj+IpTce8UhOS5T5AMvWf20RRLjih88dmvXuWZAAaAsUo3R71arumqVxTFJYj7jqVxj3k187zTyeAaZDJmWFXnony/nUtnlkNXenMHUx0q8SlE0t08+1WUaCbIGKEEvVZLPUEm9rIaTP+4lV89wqHQ5GLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hq49xDp8; arc=fail smtp.client-ip=52.101.62.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hq49xDp8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLHw6dvA39crWKRpio93djQIPpoAERRsIBTuLdz2G5+iN1dq8l/enjVRqPkFerwXIXZkl6viwqUfOcCptmQgmNVaKZZZM+9UCXtN/oSYeVEyPc4tKFKEa7vmoyTBK9COixQ2vy1CdVQdCiYwnYzFAqtW/+IuhgBF9kf8H0a0gTQhl2WbV1pgczueuQ99enRBl3wZUm5/cM0xiYDwIS0vHMry5RbJzLr38Dd4AyZYa5iD6xs5SxZziB9VnKGGJ8Ii5TmbYYfb0FuTHBB+6Dj5zcZSdc3jZ2CiNdMn5DxaD8ECNGH8WnvB7m4ZoV4sPwYoNUUI6PdoPacstAgfVXqMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oprpYVf+9QF9rUSwxWX+MjIevMHpfFCrd3pZ5Z0pJ3g=;
 b=O6UbS9QUoxrilR/ccgSUHtIHnpyFNGjpoIJNiOg1VmvUnSWtSmWUP58jG6+iQlRK7/pbzJBjihDrdxX4KJpf/ul5XiOO4RzgCiYd8stxkoPrCu9tQZ7YqcbH0jLlfTW37tMiS+c0PPmtWHGQRe09lSaaWX8wffuov3jtUPrObG9itvdzk3rCpfcUJxx8dF96VyCFucKcVBKx16ZrxwBIoul3vmkemiGNp+A8PtGGz8bRgflT6gYCCOG66kZHz2n8vcUh3O4Jr3ukowqSo9zpT+W/PbDY5iYDC3NsLJ9WAC8KUm5v78vLQ8q3IpjRw4VPQFah2Pj53LldQiywQ56SBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oprpYVf+9QF9rUSwxWX+MjIevMHpfFCrd3pZ5Z0pJ3g=;
 b=hq49xDp8vkkOgKiHhF/pLsLRuq6Vrw+gZ91Ap6c3k+kIEdjt4MgR8Y8n4xWn9/bomJYO+ePZb/zXG8cmB0zZ7UYew98blycfpJ/jhryNQgXYFQgVFSU50j8c9PI3a8NhMVrqc9eaohhYFbqkJxKziBqoCM6qOL2gvIWYjpgvaotEOmg6q/1Tv3Y2ex8qxYbobrCkIr+/iWtXMDGhzEx5y78HrckUH2IZZ7COgtvtbbxGc+WbTYVz6oKtD1/FUQbJk/wJ7P67U+ONrJFzd0Zwa2C2zCOk9POyOXPm/saBimTtWhsXmJvTthHb5H+4dKOip0CwvYQGGdVPueBsbw+zTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB9523.namprd12.prod.outlook.com (2603:10b6:208:595::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 00:06:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 00:06:39 +0000
Message-ID: <288fc58b-657c-4e8c-b6bc-d07afe14bb97@nvidia.com>
Date: Mon, 9 Mar 2026 17:06:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] gpu: nova-core: gsp: expose GSP-RM internal client
 and subdevice handles
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260309212249.GA2889394@joelbox2>
 <2A3368BE-26A8-4F8D-A0F0-F078FCC06CB3@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <2A3368BE-26A8-4F8D-A0F0-F078FCC06CB3@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0178.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB9523:EE_
X-MS-Office365-Filtering-Correlation-Id: a5221708-8dda-48a0-3777-08de7e38e72d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	6CrgYEt3CHODdkS51DeMCbt/aa5eTGcqD6o2dkqP/C9jZpzp+c3cW7chmdjPXJL9eC88sUHWFKGgZjzDik5HHA+4nQJjm739W/7nGi0UM4r2L2YlnaXQX0onFzMxS1aBRMvkP60PXbpZAel6FiCZHfJK92sn7YHhq54usGJNpmxt7DECcco2CzTxseCYItI784fOlBDjwbKzhDNcxD/LU8PcweHEVtS3mLTPn7oR3tuVYE3ZceoQzhJID0e0i+UX4f/8ISu8bh0igXFWjYnMTc9Xbeg/IecbB3G0VMn2P5AHnODAoMq0fVCtMDYQysp3ULOOeBeMeCwbxbkBl6Lx5g9Ewykwxz2BmYs43NyK2AQN3081bSBsHkc3Tj8cAv3LKQHTb8eMGHWhF2ahS4A5YICxYYCG/Dz/hRTcYdH9vxSFeLKxD8mmv3wcF7uNJhtDhCmTCChMbULtK6doa67uSZOw1JD4voR0KSqlw3twqQwYdSFdrfRBlX/RH1bRia/2MCZcocaN+NHpznZ2nb6Hhptw6D3Wg/n94duiD0gIIb85zoYt/al1QZ8acFmpwjDbNG3jdjDOvmg3XVdfy+H8KewZunlGY3/xpo6hGMemEEhdtq6TMcvlJvy9mbIwJVeYMYpOp7Jcc1qgjQxUOWHX87vpzL0ZkuAUt0WwW5Bezv0h5FTdcFrz/AX0YKHKP8wzHstDpzJaOP7C29PFKQ6eY8vqZdAcfyAzfSXu47RHXYY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEtkVzFLWGVHNUhVVFp5akJMMTMrSnhvWmJMQ2E3dWc3Y29pRUZmMC9iTXB3?=
 =?utf-8?B?VzNlZWpXNFBHcmlxOGRSeEtVMzBtTmN5NFdrM3VxY3hneXBleWJpSzVpRlYy?=
 =?utf-8?B?M1dDcjhOQlE1TG1jK25jVFZIRkREMk1LUm9TUnE1UUpsd2RsTkVDU2RqVkVy?=
 =?utf-8?B?di84d1dOSkVmajFhLzZQTzhYbk9Cd2RWbmo5Zk80eVNoNUtRY1lIbG5URTEx?=
 =?utf-8?B?cDEzR0NxL1paQ0tDWU94Nkh6NHdoUGI3T0tMTS9jWVpSYmxZa3ZyVzFsUDlw?=
 =?utf-8?B?NGFaRzFDNkVYUWljWFBUSzBMZTNIelpIZCtSOHJBb0s5bVV4Nm0zMXRmSG1z?=
 =?utf-8?B?WTJMcTE2TFdTNWpoM3ZnZnJidnVkYnVWeXlwQy9xcVJwcXhZRXVQY2RrdTk0?=
 =?utf-8?B?b2czVTZIRnZ4bURQRXJsVERLaFpZZmNhR2ZJQjZWeWtGaU5jcENpUWVtTDhp?=
 =?utf-8?B?c0l2TUUxVzRUTVY0MTVJVmRBWjl5RE9pVjNJSDVlQWV6cVFhaHhrUHBDR2E5?=
 =?utf-8?B?bVRQNlNESVY4bERON29POWRnVVR1NXgrMHBuTzRtblpWTG5VZUVLUGh3Ujcy?=
 =?utf-8?B?QjRKS2NYYTB4SzMxQ2VIOUdQcVpkU0k1b1lhaEZsTFBTd3NYeWcwYzZoZ1A0?=
 =?utf-8?B?Tlc5V0JaTEZ0cXRVWWord0lnVGlLclhiaFM2N0NhK2JpSDVBOUtMV1N5VThS?=
 =?utf-8?B?YUdIdFRkcjQvVVFKRGgrajY0SGRTNHJZOGtyVzRyK0pmSng4OGJDS3VPeWdC?=
 =?utf-8?B?aFMydmpYZ0pIS0ZGWExFU1FqdmxIN094SjdaYjFjV01Zc2t6K0tMM2ZRc0hL?=
 =?utf-8?B?aC90czQxYnZpVFFQbUVrb0FCOEt0WTc5eG9VVHh1M0dBWmdvNVNBOW01VlV5?=
 =?utf-8?B?UGYzanBIUEt4S0QwZ2NkcWhmcEN3UG9XOG11MW1rdThUTzU1cVVHV1BnRmdi?=
 =?utf-8?B?eXg1MWV2MGJqMWhFZ2ExalEwUHdCSFZYTWg0TVBwSE54SHVtR1l3V3UyMkJ2?=
 =?utf-8?B?VkI2UkU0U1RvSlJERURZeGNwRWJUWHV0MFUwTU9DMHVMNlVEY2pmbXl4eXlS?=
 =?utf-8?B?OGFKZ3dFL2hwMDFYNHB2Wko3S2t4OFlNd1ZGdG4rWkJWUDFGVmRZdCtOdjJD?=
 =?utf-8?B?ZmpUUzJmQlAxWk1PM3NnNDRGSy9hU24raG03Qlo4TGtlQSttZ3o2dlRiSlBs?=
 =?utf-8?B?NlNVVVBqdHYwSWhoRjBScExuaEczRGxqM0JGU05vT1Z1MUNFNW9jYWpNeUFH?=
 =?utf-8?B?aVZGRWxXdDNnRTJ4K2ZmTUpZMjV5YzRGQXdVOUlhNG9GRXc3S3dZNXp1Rkll?=
 =?utf-8?B?SGpvbkJkT2lPU0VZUVptT2hpTlBrUXk0U0tqT1VCUVVMc3dqTFZyWGpKYjQ5?=
 =?utf-8?B?MVJoL0JRWWo0MWNZOUlNMlFKVWZvb2NtNU85RXFkMGVuTWNuWlpjRm05LzNx?=
 =?utf-8?B?YlJwbEo0YmxsbnZwN3F3SWJxOXhmL2R4R2NJRnF6ZkZwMk13V1dxZVB6NXQv?=
 =?utf-8?B?U3lFeFFVMXFUaVZuUlMwc2Y1NVZac01GYlo0NlBiblp2M3NHeWZJcm5zK3Vx?=
 =?utf-8?B?M1RQVWRuTkl2UFNjYjBTS2xESWN2YXFSQ2dSLzdyYU4xVXlUR2t6aE5oV0hV?=
 =?utf-8?B?Q3FSRWNXKzdNenpnSWdIa2hsMFJsT05oaHBkalpjNDJuOWVQT0trMzNTUDdS?=
 =?utf-8?B?RXNVR3VZei9YSWNjdVdGRlJUVjFVai8rcEhtOE11aFR3aXlKYXZLWVIrVVV1?=
 =?utf-8?B?ZC8xZE5YQnUwTFVGNFZIbnFDUUplSDBPZEJjSzBxaVZTaXBGcGlWVjFVT1oz?=
 =?utf-8?B?RjhqemZIYzB0dE5yREFyL0V6YzdRM1BQbnp0OGQzQVlTRXl2MEl4c3lRa2FL?=
 =?utf-8?B?TTBpVmJMYVROTjljUnF5anNETVFucnppNUVMV1lIVDhaRWJIb202a0RsU2cr?=
 =?utf-8?B?Vi81cU82Y0xtQVp4OGdQejkrYmVURlRIZ0NMenRwZWhub0lzdXNQTzVvUDh0?=
 =?utf-8?B?aGx0OFVENHltYnN1a2xtbVBablhpL3VTQXl6S1QybmhhRmlJeDVjR1p2MVAv?=
 =?utf-8?B?dFo4OHB0Y0U5UTFhQmVUNEFPTWJibklqZ0Nkd0VtWEdQZURpY3RDdEUyMDBK?=
 =?utf-8?B?UE0zd2FkYnBRalArUjZLTytjdlV3dUlreHZ1M0tPc2ZDSk5wS0VaTENla1Fa?=
 =?utf-8?B?NXNUWDZDZHplYzBrU2gyMG1UcnVzQVp0ZjJqMEs4ZU9Idkx6bUR1MEZNemVX?=
 =?utf-8?B?REgwRExhSkZ6a2gzVDkxV0VYYllDdDdSVCsxY2NMcGViVWswZ0ozN2FjM05z?=
 =?utf-8?B?VnRNSE9GcmkwTmYwWjI3ZGFDYXhtaDNsNUNiYWUwcDc1bU9lU0ZoQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5221708-8dda-48a0-3777-08de7e38e72d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 00:06:39.6887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4UC7tQWjz4ooC39cwXKlq8e1RGV/uzp2v5iBW6nnCrWLqZ3VUHbRJh2vmLgVd94o3j/lPkN2i8Ii7snSlancg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9523

On 3/9/26 4:41 PM, Joel Fernandes wrote:
>> On Mar 9, 2026, at 5:22 PM, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>> On Fri, Feb 27, 2026 at 09:32:08PM +0900, Eliot Courtney wrote:
>>> Expose the `hInternalClient` and `hInternalSubdevice` handles. These are
>>> needed for RM control calls.
>>>
>>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>>> ---
>>> drivers/gpu/nova-core/gsp/commands.rs    | 16 ++++++++++++++++
>>> drivers/gpu/nova-core/gsp/fw/commands.rs | 10 ++++++++++
>>> 2 files changed, 26 insertions(+)
>>>
>>> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
>>> index 4740cda0b51c..2cadfcaf9a8a 100644
>>> --- a/drivers/gpu/nova-core/gsp/commands.rs
>>> +++ b/drivers/gpu/nova-core/gsp/commands.rs
>>> @@ -197,6 +197,8 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
>>> /// The reply from the GSP to the [`GetGspInfo`] command.
>>> pub(crate) struct GetGspStaticInfoReply {
>>>     gpu_name: [u8; 64],
>>> +    h_client: u32,
>>> +    h_subdevice: u32,
>>
>> I would rather have more descriptive names please. 'client_handle',

Maybe it's better to mirror the Open RM names, which are ancient and
well known in those circles. Changing them at this point is probably
going to result in a slightly worse situation, because there are
probably millions of lines of code out there that use the existing
nomenclature.

However...

>> 'subdevice_handle'. Also some explanation of what a client and a sub-device
>> mean somewhere in the comments or documentation would be nice.

Yes, although I expect you can simply refer to some well known pre-
existing documentation from NVIDAI for that!

> 
> Also just checking if we can have repr wrappers around the u32 for clients /
> handles.  These concepts are quite common in Nvidia drivers so we should
> probably create new types for them.
> 
> And if we can please document the terminology, device, subset, clients handles
> etc. and add new Documentation/ entries even.
> 
> Thoughts?
> 

This has already been done countless times by countless people I
think, and so we don't need to do it again. Just refer to existing
docs.

btw, as an aside:

I'm checking with our GSP firmware team to be sure, but my
understanding is that much of this is actually very temporary. Because
the GSP team does not want to continue on with this model in which
GSP has to maintain that kind of state: an internal hierarchy of
objects. Instead, they are hoping to move to an API in which nova
would directly refer to each object/item in GSP. And subdevice, in 
particular, is an old SLI term that no one wants to keep around
either. It was an ugly hack in Open RM that took more than a decade
to recover from, by moving the SLI concept out to user space.

So even though we should document what we're doing now, I would like
to also note that we suspect a certain amount of this will 
disappear, to be replaced with a somewhat simpler API, in the 
somewhat near future.


thanks,
-- 
John Hubbard

