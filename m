Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010040.outbound.protection.outlook.com [52.101.193.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C820837EFF8;
	Tue, 10 Mar 2026 02:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773109787; cv=fail; b=qnsw7rkFBofNnrOlN2doaw/wN9HX7B5S+p3diDdDsrDY2XHjNluWvP1BfVyJjSkQ5cqnEXHZ9x/5DCyfgPDkSqjeJ5yLmcrpv2QdfOYlIXplgcjvq2EaCgjtaj5zcWg93GYJbiqda8o3tKLDbgfAkZ1pz5sD8E6s22eOahQ+RDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773109787; c=relaxed/simple;
	bh=xO/DZ5dmxDVYJ9WojpY3OVAXf8nRA3ZghSANyKRn6Mk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HG0ckLU/OIKy+HgJg5ja6Gn9bu9I57S0CmUkPdb0UEWKW2uRtIb/UdACEgF1NDB6nXyfKeYrPD/sQ98tjX2wq5gG3QA7trdMYvs9ZoQQmA+eqAHbgjr6kKPSrhuBXh+Hv2S1QR1T8UWlOWlkAW7r/kJmZBhyr7Xbts30XnZQ87k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T44TeJOk; arc=fail smtp.client-ip=52.101.193.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T44TeJOk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fajuysiXRRvnuAchi++GqgK8a1XRQAAdnwzQ59WOwqQ34BiVouIqCEQgc326gfXLQ0Av2NxshklOJFzM3a5mzvy1G2EjDG4ktPb+YplLBwINVlntxDKmIaBhN3SyCumuY146dDVh6+oPwzAvY9Iw+FoQdl4ZkpXHwzaw17JKZrSq4WqAbttGuuuutUJoprwk7rhx/JLf14+BXTT88JDbiGFo7ebusmn0REQSzqYT0C1pU9gb5YSkPNiD78j9Rl/qNvVfI9cWHIX/SSpqwEMv8+Ogx9c9OyFxw5n4179aPr0QfCVJmAsVYoFXygJJ/PF5j+MS6sBeIfS3sHz2/tvgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gufujShk4YmYqKjhGDK4zqGhH1G6g+niLh2FXakA9cU=;
 b=wucntisTdLFsL9AO9DwTPbK2bPeJafpHhIeJKIwC8NZAKEAhFR7axFWvIdCAWJJGdtgOYb6U8JOO8NHfc0+/IoykNTPJUwhq22UliOjuwsYxGdOeDw/9Cpc3RBUXLoYFLWDYDQ3GeRSVFc62raXmjEZb37txwjdhpEkyBHLP38amdTpsKL1g8YqqeFs8uQ9fU6R2Suty0uCFUkw0K9NoyRSqEMOJl97m+hHRKIQHP1Vp+q7NIckQ63MlIslmHCSOPALIpCQacKHv8DuuHhyvCH9Lfon0H5oKj4O1YmKw3rzdX85O6Qofzn6FJ6M3yUdWJjhVgCgdjZUr/ucL7awItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gufujShk4YmYqKjhGDK4zqGhH1G6g+niLh2FXakA9cU=;
 b=T44TeJOkwCr+ZIlTDfGPc96GmvfPRrHxMXtyed8eA9pnfMsuLY6gB4Xjpqy/sTb/Np5yi+7zOLAOdwYTSYIsuTMWhJRFgOlxcWNcSnn7lFRP6kVoHoXqaKRdzgFlm/yy4CgJw7xzX9onHyUpasZlDwvzQTWXAAzRJXvF9ENCxhVTIUznQIt2m2TVJ8ZtIwa6E6YFZRttABz5kdV4yuawUmbHvHL5WhmVkKNlwvqapQKJ5jmBwrd3PeyiQ1qSZPpHvwHFV4jN2Z5HTR0gWWxe7vx/ZaqVB19/hou1DkaigvYQCot2aG720VtAPWahqmD0Vu+OI2cO4mQvkEqSVhRcxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB8142.namprd12.prod.outlook.com (2603:10b6:806:334::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:29:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:29:38 +0000
Message-ID: <a8a2b89b-807e-47e2-9eca-2bed0c71602a@nvidia.com>
Date: Mon, 9 Mar 2026 19:29:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] gpu: nova-core: gsp: expose GSP-RM internal client
 and subdevice handles
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <288fc58b-657c-4e8c-b6bc-d07afe14bb97@nvidia.com>
 <eaba411f-d882-4175-ac43-a9217fbb915b@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <eaba411f-d882-4175-ac43-a9217fbb915b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0202.namprd05.prod.outlook.com
 (2603:10b6:a03:330::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 172c3141-1d73-481b-8f8c-08de7e4ce050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	kQENwp00KjVYpRkBpzJZcOykpN8fC64V1gof8F6+OJTbO32gNRIoMYFnO6xweuKZSrYoSFZA6MZBOHQgqurxQzsoSY83FslCKI3Xx+uH8omSd0z+5esPH1Q0IeRnTu0IY/Zi7dkGt3LZu8HqhOwK1Bb18QhEVB20nSaNtolIBMCb9yidr4Xki0jAIgrI7TnIVOPDX46eopoXW7uM29tJXkAM/K5jlS1v2gEQ969LlhUWgOsY5oRGvxCFUQ1k2VfpKlrYRQZADq7Q2XPQRS7iEpXoh7RDDxO6Ixg7cOfhSqzcx0xdYNJX7zUe7WrWHJ60n8OaNJttWImfEOtpCdFk7+YUAV4VF+yyQ9X0HHoRNJjcLxUD6BPV4HMzmkbR/amWI8aufktF0lm7VS/RRv9iSqGErbtUOquU0zAhTdaECGiy+Q3d53rUv/++PTiW0hImawPpbpi5t8B+UbR7crcTkRY72Di9DCHb1RYgFv3FQrcAGSWMgR+mkqkzt6ha53lfJQye5ShK/2uxtWk1brttSgX5FlKwl5aBTTsyNey1erqCgKdlETJx6gcp+4SxvOMYGfVaRPMpagL6jYTXd6g4T8Na9G27IO8z02d+IrRRNc5s9G0k+UvkpvkG0+UHsEANoS48BFC8f0l2OPNvI7zFZyuxqD6yLYd0oKnYgsSH6dij7A/O9EqDDTshWIyTcAP/8pp/YZskaxbKwu/VLW3nWnaRZqx3pcbFTyQNbLIHfUE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blhuNE9jYlgzT1I0ZEZ4NTZyZFpnaENtOVkwQkYvR1NRcEx1aTZWY3dLUmFW?=
 =?utf-8?B?SVUrRjV6dW9TZGphMmhVRXdpamlCWHZlbGc1K3hEakh6VS9MQmpVSHJEZTRQ?=
 =?utf-8?B?cGlEdWZzVWxqRmZ1bnFTZFpQaUhhMjlkTEpBK1NORXpKbVVFamdPdC84WVZz?=
 =?utf-8?B?bmJ1WC9ramd1WHltWWxQQXdPbWFHRVR0SU1xTXRCcHZROE9IeEc2ZE1sZXZj?=
 =?utf-8?B?NWwzTGU4ZkZubE1aekpqbWd2UGF2VDl4TFRnYlYyVEh3Y2QzcE51TDk4UTFr?=
 =?utf-8?B?enBUbVNVNm9WTVFXbFFWWFdoS2M3TXllUFhCRktFeTlzWWRlTVF2QUF4TldY?=
 =?utf-8?B?ZXVuSUNGZ1lrZHV2WS9QWmQrR2R3RFA1ODh6OUhCejF4OXBnSjg1eXlHMDIw?=
 =?utf-8?B?S25KOFhCU25LWStWK1ZJRFk5L2VwWnBpVDFkS0pGU3NVbXh2NVYycmY4VURo?=
 =?utf-8?B?MVZ5ZzhjVlZFemtZVVJidUpBbmR6UFM4bEJOaWZFdEZ3RlVBbzZFbmRVZkRz?=
 =?utf-8?B?ZS9mUXBrMWI5LzRJcnFGTlo5czRTbEo1eFo5b2xLTFdhbFJjQUh0NUhrc1Fa?=
 =?utf-8?B?UWJINk12R1p0VDl0d29Xa21aZzdvVUlGenk3NzNuWjRuenlIVmt6MUU5WDlv?=
 =?utf-8?B?UGI2ZHFqZjlJVGtIaTIyRWo1ZVpJTEZOWmptL1l4VnBFaXNvV3dvVXI5Tmlv?=
 =?utf-8?B?QVcwcm5HTTFnNnRqSjNvcE1MZHBNblBtUHA2eVRBdGRiMmRGV2paNFJicjZm?=
 =?utf-8?B?ZnM1Z2JwZ2VXRWNlWHpwUFAyUHBlOFFQV0tVQ1EvQlYwWWU3L0RlZEZTT29m?=
 =?utf-8?B?QjNQSVVlZE5kNzA3aTJJWEovbVVud2VMM3F1MVdxZ3JvMkI5c0Y2VnNLdHJ4?=
 =?utf-8?B?NzBSc2VIb0wzaXpTRFBNYTh6RjA5T3RnUnlETFFQNlJ2RnFab2F4TzdmYk55?=
 =?utf-8?B?L0dSRTFJT1hqNXpLSzhJRDA1MlByUmVKclNxWTRtS1JmOUtRUWF4ZzloZ0Ja?=
 =?utf-8?B?cFlRRVR0UmpweWVlNlY0ZUdJTVhLRE9rR0dldkk4dFdjQTFzL3FWSE5Xd1Bn?=
 =?utf-8?B?U2tvSXBUQ0p0Uk9OQ0FEcSt1YmFHUFcxQkN6bGp6eThTWFhXdmFjeDJoUU9t?=
 =?utf-8?B?UzVTNSs4eTFLQzZ5TERtaUVycmhJc1o3aHNyKzNJK1dadXNYMmtxZmZNMFNR?=
 =?utf-8?B?clJMRUpib0Z3ODBOWTVhdkdMVE1HdStzVVBSZVM0a2xCYVFWWjlaSHlMWmFB?=
 =?utf-8?B?NVRxNS85RFBCRHlDcmNBWjF5UFhPc1JqMlYrc2NmN3hiSHZXdnRuN0w3WjBH?=
 =?utf-8?B?VzEwZ2h2RHFZU3poVjc4dUZmWk04T21JUzVYTlRPMXVrU3NYSllHZ2FCN2Zu?=
 =?utf-8?B?d01hRVZJUWJrbHlkaTJOTnd0ODFCTWF1N2JpQ3RJenE2NmRESlgxVVp0U3dr?=
 =?utf-8?B?b3JTd29Eem9KYmVMYTh1dzQyeEthcktzeDY5b0hUWmpYNlNOQXZKVXQwS3NY?=
 =?utf-8?B?bHZWL3BLRDhrVHRaVHExQ3hEOFRqSzNoOXowL0Y0c2Jub2RIOGlCd1NuR3ZD?=
 =?utf-8?B?WFB6ZTZHSDBSa3RvRzJHUDhOalpzTFhRdHNKTVhHTTV0Mi9oTTFXTkx2ZGda?=
 =?utf-8?B?eVYreldCeU8wMzMvM3BpYkpWdzRROEd1Q0FDVE9PQVd3TXpKN0w2YnhGOHFh?=
 =?utf-8?B?RmxjMGhzOTV4TVkxN2dBa2NubWc5emlEd3hUdnJpN055VXdVMWJGUVFUYnlw?=
 =?utf-8?B?dkpCQVRmL2dpa2dMSWFvNFlGL0VmSTNRWWEyeEVsSnAyWERZYW5FTnExbzQz?=
 =?utf-8?B?OGZVY3VaOGlaelBYZTV4eHlWak9xRlBQMW9MRUJRVmxCWGREZy9Wc1hWNG1n?=
 =?utf-8?B?YmU1dVQ5OUZDY0tyMkJDQWMzWnFwTC85WFY3c1FyTy9SVjhlVTdabzVERHhN?=
 =?utf-8?B?clZBMExXaWZCU3FSeE5MRU5iZFlRVGgzMEtBbW1YKzhxcFA3UzNIZ0NzV1Fm?=
 =?utf-8?B?d01PYUxUSGRpMTZmZklRTzlidk9GZDFtUzhSZEdPTGdqSmVkaWcvUnFjdHhk?=
 =?utf-8?B?aytnbXNpWkw2MDl5THZLcnpIenZYUzVyZTB5RDI0NURZME8ySHE1MFgyT3da?=
 =?utf-8?B?MktkNkNlbnhkYUZUTDBoQzhLQzI5citGeG5UR2UrOUEza29neU90U2xZeVA1?=
 =?utf-8?B?YlJxQ01HcVFUUlkzRFZPbXVOMXFwZitKWkhWRVQwTVlianFmRVowUGM5SHdt?=
 =?utf-8?B?cjlUdE1ORzUrVFlNUFg2NE5hcUF1VVhDVmU0ZFduYVhHVVlwNElaSVk3cEMy?=
 =?utf-8?B?RWxjNG5nSmxDdVgwd3VRaUpLWHBNL0tuVHVtb0tQejFIRldwcjdrZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172c3141-1d73-481b-8f8c-08de7e4ce050
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:29:38.1271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rigoy53VUINCRtFwwvRMtt8TsZpHNJnnOj+mhn24i1TNUG+lFV/5SPTlKeWDIAc9rwCzn1FWtGIpx0/ILfyfbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8142

On 3/9/26 7:17 PM, Joel Fernandes wrote:
> Hi John,
> 
>> On Mar 9, 2026, at 8:06 PM, John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> On 3/9/26 4:41 PM, Joel Fernandes wrote:
>>>>> On Mar 9, 2026, at 5:22 PM, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>>> On Fri, Feb 27, 2026 at 09:32:08PM +0900, Eliot Courtney wrote:
>>>>> Expose the `hInternalClient` and `hInternalSubdevice` handles. These are
>>>>> needed for RM control calls.
>>>>>
>>>>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>>>>> ---
>>>>> drivers/gpu/nova-core/gsp/commands.rs    | 16 ++++++++++++++++
>>>>> drivers/gpu/nova-core/gsp/fw/commands.rs | 10 ++++++++++
>>>>> 2 files changed, 26 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
>>>>> index 4740cda0b51c..2cadfcaf9a8a 100644
>>>>> --- a/drivers/gpu/nova-core/gsp/commands.rs
>>>>> +++ b/drivers/gpu/nova-core/gsp/commands.rs
>>>>> @@ -197,6 +197,8 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
>>>>> /// The reply from the GSP to the [`GetGspInfo`] command.
>>>>> pub(crate) struct GetGspStaticInfoReply {
>>>>>    gpu_name: [u8; 64],
>>>>> +    h_client: u32,
>>>>> +    h_subdevice: u32,
>>>>
>>>> I would rather have more descriptive names please. 'client_handle',
>>
>> Maybe it's better to mirror the Open RM names, which are ancient and
>> well known in those circles. Changing them at this point is probably
>> going to result in a slightly worse situation, because there are
>> probably millions of lines of code out there that use the existing
>> nomenclature.
> 
> I have to disagree a bit here. Saying h_ in code is a bit meaningless:
> there is no mention of the word "handle" anywhere near these fields.
> h_ could mean "higher", "hardware", or any number of things. The only
> reason I know it means "handle" is because of expertise with Nvidia
> drivers. The `_handle` suffix is self-documenting; `h_` is not.

Maybe if we write h_client in the code, and "handle..." in a comment
above it? Or the other way around. Just to make the connection to
the Open RM client code that is out there.

> 
>>
>> However...
>>
>>>> 'subdevice_handle'. Also some explanation of what a client and a sub-device
>>>> mean somewhere in the comments or documentation would be nice.
>>
>> Yes, although I expect you can simply refer to some well known pre-
>> existing documentation from NVIDAI for that!
> 
> I apologize but I am a bit concerned with this approach because it feels we
> are drifting into black box dev without encouraging more code comments,
> documentation and cleaner code.
> 
> We need to make the driver as readable and well documented as possible, we
> do not want another Nouveau with magic numbers and magic variable names.
> 
> Very least I would expect at least one or two lines of code comments of
> what is a handle, what is a client, what is an internal client handle
> versus not. I guess I do not understand what is the hesitation?
> 
> Sure external documentation is good but to clarify, I am referring to a few
> code comments. That's not much to ask right?
> 

Sure, a short amount of comments would help, that sounds good.


> Elaborate documentation files in kernel can be optional but there is
> probably no harm in citing external references from in-kernel docs too. But
> again I was more concerned about code comments and variable names.
> 
>>
>>>
>>> Also just checking if we can have repr wrappers around the u32 for clients /
>>> handles.  These concepts are quite common in Nvidia drivers so we should
>>> probably create new types for them.
>>>
>>> And if we can please document the terminology, device, subset, clients handles
>>> etc. and add new Documentation/ entries even.
>>>
>>> Thoughts?
>>>
>>
>> This has already been done countless times by countless people I
>> think, and so we don't need to do it again. Just refer to existing
>> docs.
> 
> Not sure if you are referring to nova-core repr or docs, but the repr
> technique to wrap raw integers is pretty common in the firmware layer of
> nova-core.
> 
>>
>> btw, as an aside:
>>
>> I'm checking with our GSP firmware team to be sure, but my
>> understanding is that much of this is actually very temporary. Because
>> the GSP team does not want to continue on with this model in which
>> GSP has to maintain that kind of state: an internal hierarchy of
>> objects. Instead, they are hoping to move to an API in which nova
>> would directly refer to each object/item in GSP. And subdevice, in
> 
> Even if this is "temporary" we can't just say "Oh, I'll just add these
> legacy things and badly write them, because they're going anyway at some
> unpredictable point in the future". After all, this is the Linux kernel we
> are talking about :-). The bar is quite high.

I am not saying any such thing.

> 
>> particular, is an old SLI term that no one wants to keep around
>> either. It was an ugly hack in Open RM that took more than a decade
>> to recover from, by moving the SLI concept out to user space.
>>
>> So even though we should document what we're doing now, I would like
>> to also note that we suspect a certain amount of this will
>> disappear, to be replaced with a somewhat simpler API, in the
>> somewhat near future.
> 
> Sure, but client handles are a broader GPU driver concept even if this
> particular one is GSP-internal. We are certainly going to need a rust type
> to represent a client right? Other GPU drivers also have concept of
> clients. The point is not that `hInternalClient` represents a GPU user
> today, it may well be temporary as you note, but that using
> `#[repr(transparent)]` new types for raw u32 handles costs nothing and
> makes the code better and more readable. This pattern is already
> well-established in nova-core itself: see `PackedRegistryEntry` for example
> being a repr type. IMHO, there should be little reason that we need the
> struct to have magic u32 numbers in Rust code for concepts like "handles".
> 

We will debate this when it shows up, perhaps I should not have 
mentioned it, other than to remind Eliot to make it easy to delete.

> All I am saying is let us think this through before just doing the shortcut
> of using u32 for client handles, etc. Rust gives us rich types, lets use them.
> 

ohh, that's a whole other topic and idea. I wasn't going into that,
but feel free to explore if Rust can make it better.

thanks,
-- 
John Hubbard

