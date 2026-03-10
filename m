Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010034.outbound.protection.outlook.com [52.101.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1CEF507;
	Tue, 10 Mar 2026 04:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115353; cv=fail; b=tM+kuFnWYjQxnM2ncAuouLVANx4CD/YA/yhfeqo4L5qv6Hn0U/cBpDZuOWHSai8K1MHmknRdd+8iWI82uj2DnjHctgY2ZXTiYWC7u+2zTFZXZ38qlEO8taA8HYvFUzTXzJR6L4+tVigvtojUYPyByI6d1xrSw0Iur05OTgR3R4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115353; c=relaxed/simple;
	bh=PeBjLIH4vOgqfbgughH0rCdGuRIrdD11JHxq1wrqYO8=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=VmHGji3/ke+3u7BugdW0xfKXCwTPKROCGSqGqIKlkWYCod/bhUaINebDrF9ULVHwDw19EVlpdT/giyjJbxEBclQPSuCG3OzqzwYyNzSAi14+RIahfEhXiCWUjlqP75KEwoYQWSi5OJwsd259yTLEWeBL23DiG/U0D67mKFAbNZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e2enOHwX; arc=fail smtp.client-ip=52.101.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e2enOHwX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9lLOkQJBXSkhz3+9nfRzr/iPi59bZYEXiu4XrEDSSWiMxlk4sGPiBx1JUuR25M1SV0uN0Hlfn70wX2FWlGgjNZK0gCnx9PznwIUPyANXkz9qWzdvxve67/QTVHKQjYazDq+9WEH++dor/g0lO8UK+KZc77hCTCnSfnwbl4bc1l2RDJDe/LuCXlxRYxhS6hjtSEn1mj6HZFC+ginUSs+hIu5uP7ob/FwwzcdeoyAPvpuqo26jWNKQd1yMQrV1UbHVmttRBbWTHaEykeAyJk2oCYThw4FHonTOCq7Ys3DNEovz7FRhEJojykgZtUeyP8FaH7xHYPKSIkgp33I5dWt/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Yt7jMKyGv0gXMus0Z+n0x1cEziGROB7XfW1EUCvVog=;
 b=Sx+wrH079b9BFSjT7R+ugAuZDu7iDDACSuJipbFgqrlEAv/TQ2K8eWfG0d9mYcYvorQUitpUx1+xh+cDPEa9HcwXvehVsICymO2yoMCTSBj30U8wQc7ddgZghXOS0IJyM3BclllOZpYwTf+ldVKFnIKWC2ArFDAojb8kNNyz91lEzt7dfw1iRyxk1dAmYJBwNgY0UkW7Kq9OTL/uuFPmsg1Sl65WUR3nPQeZRdwYMS22ZiSid5rt+46+2H7Q4CtKSvuEac1ivjTbHUE+8oTI+30HEvhI5+XnxlkNQrGlvL/esTKYssIsDmVEOTqn0u8v+6bTzKZQ76R704txywKCnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Yt7jMKyGv0gXMus0Z+n0x1cEziGROB7XfW1EUCvVog=;
 b=e2enOHwX/riK03laPiQC8PQ8jhttPPlPj5u8qR1dAUzJWVDo85l7uTLIMlXGVuuaHtTr76P339tq9pry2PTmgBuQBRIpTmsUTN2uEB7xiwffUEtm2qSYnu8mV+VfHk8z8B9qNSfuWyfr8Duuf2cfiNlssmxtn2ipOgG8wcvqpoRi3/JB0QugY1a7PD47MKv/2ZBZnG1b/+lCysFUtHMhMOFX1Xz1mHr4OJoRQWU5g5y24fK7JGOzfHQfw4+BfGFUkqbAZqybnSRk3p29SwHsd+oMe2pFQR8TxqCC/xd75GFvtErRHOzcsImBGL56auGku+vtDk75Xo88SZfDa38TXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7822.namprd12.prod.outlook.com (2603:10b6:a03:4ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 04:02:27 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 04:02:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 13:02:24 +0900
Message-Id: <DGYSXKA569RE.2KZUJR434RNJM@nvidia.com>
Subject: Re: [PATCH 3/9] gpu: nova-core: gsp: expose GSP-RM internal client
 and subdevice handles
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <288fc58b-657c-4e8c-b6bc-d07afe14bb97@nvidia.com>
 <eaba411f-d882-4175-ac43-a9217fbb915b@nvidia.com>
 <DGYR3ZICOYFB.2ZHQ2CTUO2UIP@nvidia.com>
In-Reply-To: <DGYR3ZICOYFB.2ZHQ2CTUO2UIP@nvidia.com>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b37269d-a35c-45f6-755b-08de7e59d815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	0A0ugC0G2rgKRcO4vCUMT3fG7v8NBTkzn0+cSKi2B2YRNIrzEzlFlf1fwSqtAn1rAUt6lBVL/478IySDGsgqVul5GZCxRvbo17Ok8LmVaI7hUn9+lWM7TpnA7OYIU91LX6AdzDlZKFEZxILZ6GNvxV5F2b+lKTfMV2cNuHxJZx7ujSoPub+C31htHnziLAEmDp9luzL1n2Yr2f7qmzqejpAKQf5g4POUMU1cUQueuifPKQ/2uIF7bI/illiTZeA2ERWB992UMNkXjAaa777FnPaC8uaxzdPHMDhz7jZeAlkyLGUdMYCea9vHhttq6+QUKSBrydxKPxfEqTrhzNvGjTGGRxP+LwNF99lV7dytQbDn172S/dD2SAbSWlOI0SU/VT3pkyaZH0wmjHynZjYKecd58PKC7s4EZFV/g0dHixWW2eaLFG0P3c2UnNVy37ttsOeyMBkDdmVpUnj5HPIemWdtW8qoF3CvytmQfJJPOiJiOwULUm0W6mo5AIQpMJtSyJUesP+/Crf5pdWARITomyvWVdBjmNXNKbnitKVdZIE5MUfd8eHhz5hCKpugsRZKzT3vYIapw3MPoFePCXzRhA627hSg/75XpNBTXQRkwbhBsQgMDhAnPJ+a9ER0f6PC7LVMbuyXxJ95nRTBai1hclZ4v63JQDPnmMsNXqkPDvO/90V/h84mDwxjv9gT28ppUhwhnZ5FxyGEq/d0V15hpzIxQgdD9uLe/sTnQeBcnVE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yi9aOFVwUGVHM3RNNEdkWEJpaTc0WTNYVndzMXFFV09rdTlVTzBkUlFhNlVE?=
 =?utf-8?B?d3JQWlQyN2kyK00rSlBoRDJMQ3ZDaXJPc09JN3V4U0lPNzNHTGN4a0ZiY1hN?=
 =?utf-8?B?RmkxYU0xd0FWblZibXl6Uk1SOFlhcWZobTVFZER5WWdXUzlKZm5ZRXJ4S20w?=
 =?utf-8?B?ZVlXK2l6dksvbTRPdlpuM0RCY1hHMlh6UnEyT1EwbG5RVmwrUGhiMk91Mjlu?=
 =?utf-8?B?dy9uVUk4UUtpNzRmOVJLbno4TzFZdDhjVFcydlRVTTRoYVlVVXYwNHlrOVVG?=
 =?utf-8?B?WjZSUEE5K3BnOHZMQ1pGeHFKUm5mcVRjSkpmcyszZjJ6SC9vaitad2NyVmVk?=
 =?utf-8?B?WUhWQzFTUGdDNkJYSHhVNXhCWFE3ZjJJRjZKYndPWlVIRjBmMlZIQzJSQmJY?=
 =?utf-8?B?dlVUcnJVYUt6aXlWSnpLZ1BBMnl4SWxOSjRtUmxCWkxXQTdtaUMxcTNJMFN1?=
 =?utf-8?B?RTkzUjg5ZitUY2hEb0dKQk9sc01QT3pENVdOMnQyeFQ2R0UzMDhuYW0rVmVv?=
 =?utf-8?B?QURiYUg3NDRuYmRSL1hzM1I1NkVIRnFSYVJDemJmVDd6SW1MdEd5Q0g0WVdQ?=
 =?utf-8?B?bk9McGlkQVhkdWFQd0dKa1dGa1VremFtd1lGV2Iza3VaazFoQ1dIaldxRS82?=
 =?utf-8?B?Qnd0ek9zOXkwK3BrOUh0SUpmTitsRFdUMzRlUVBnWllza1J3NUgra0c1bmVF?=
 =?utf-8?B?eDJxYjdDblZzSFEvWTNlSzMzUmdNQjg1ai9iVGpzcTBGK0JoM29zSWE5Ris5?=
 =?utf-8?B?ajBNTWgrOTY3TDlPSlZYQ1VJUzNtUlozK1k1VFN1d3ZNSnRjTEhaLzNjRHQ3?=
 =?utf-8?B?WEUxT1lrRHlTV05mUEdub2EzMG1QSFI5NVYxc21iR2RnbVlGaHVHdlNDNmVY?=
 =?utf-8?B?RytQT2tiNnZBaFFQRnNIVzR0WFFtK01Gd2NpNUxlamRoZ0FPWUpBc01rcm16?=
 =?utf-8?B?amlPQXk1bGgwSlJnMm9aTDM2QURhckRVdkNLUUc5Y3BBenJzcWVqK2UrUzR1?=
 =?utf-8?B?ZkJGeVVma3A2TmVwbzllbTNXK0VvWmcrZmRUeEYzM2ljRWUza2ptMDZjclZs?=
 =?utf-8?B?ak1UZ3FVck9aeEQ5UTRlakN0VVBvcjUyWUNEd2x6UE4zT0xwTmVJeFo1VTlj?=
 =?utf-8?B?MTVUYjFlUUUvYWhwdEdJTzNsUU5HZU9wcTgzRTk5RHM5ankxY3hEUEpaZVd3?=
 =?utf-8?B?SnNJQW9PRDA0UUQ5a0FaTnRSQzNyRWl2U2MvUFJsbE9GYi9HdFlxaTBUaFhk?=
 =?utf-8?B?dmY3Tnd5Z25icXpSR2Q5SGpYM1haeER1UDJNb0FhOTdyTlJSK3N2MlMxV0dI?=
 =?utf-8?B?Wi9VeW9mRHgyajBEUjNDVUlCaHZoclVCMzUxVmpGbEJWUm1vd0hZaUZSZkVG?=
 =?utf-8?B?NUl1WVJVMnJ5djhKaXpGZk5TbUpoTFIwblA5YUYvT1lNSE5Oa0VyVS9iS3NB?=
 =?utf-8?B?bG1FUnM5Um5RcUdvUDk1UDNvNXlVVVIxMjYyKzVFQktqaS85V3A3anBycm5R?=
 =?utf-8?B?Yk4wUlpGV2lTbTRzZ1E5RFlEVTA4SEtqZWJwcE9aTm1MbFNvOEd4Qm1IY05a?=
 =?utf-8?B?VEFFemNyZWRic1lLVEhDYi92cGd2QkRsdE5ZdGNzN1pnbGpHM3RuS3JZZEVI?=
 =?utf-8?B?Z3IyaytnY2EyeG9BbTFkRXd6ZWpyMm9XWjBTdmpzZjhYemlRWGhyTnBaT1JC?=
 =?utf-8?B?MWF4L3NyMTRJQjlEU09obmM1ZUtyTkp3TkRZdWZTTEJoWmRlUk14NURvZUNP?=
 =?utf-8?B?ZlUzZHl5enYrbkNxNUhjVUlxRy9sWUpqaktNQWg1ZUIvalFzcmkyc1hBVTVE?=
 =?utf-8?B?d2VpeWF0TjBoME1Eaks4dnFaSWFJSktjS2tQa3RnMXJGa3pjd3IyOUJYdTU2?=
 =?utf-8?B?RmFvSm9FK1AwK28zOFc5ck05L2MrTWFycjJlOW11eW04NXVwNzdyNTFyMWV4?=
 =?utf-8?B?YWdMTGV1V0tPWGplNkkrZHM0eXNMUTYySjVmc0FnanJVWXhBU21QSk1nNUFh?=
 =?utf-8?B?MFpNcGMxZFRmWStmRW05bkdTOE4rVDlIK1NmYmxzaWQ0RS9WZDhrY3dIREdW?=
 =?utf-8?B?WkY3bUZxT3lQSUVyOFl1eFJHWkh1UzR0b21neGxHcjh6REtQR0xPSE42STZY?=
 =?utf-8?B?S1NFNzJZb2x6QTRnbUlIYXh6K25KUlVKOE1mVmhILzdnTUIrajF0cExueHBQ?=
 =?utf-8?B?TE1ETmZrN1RGL2IzNXdJdlpFSFJmK0g0WkxJd1lWbkFadS8vQi9YSjE5dXNM?=
 =?utf-8?B?SmtsWDVvNWp4WGxGd3ZORi8rYU1UZG5WMjd4VHRjSHRMSDk2SXQ2QWZHQjUx?=
 =?utf-8?B?SUtZZGxObm9vMis3UlhOL2lQakJEMEhLWHovS3R3YTR5aXl4TjY1MEw3L3Ro?=
 =?utf-8?Q?WBe4s3T2IK32wu17zVa0P6Nyra9nDhbdHJ8qqYvTBRj8C?=
X-MS-Exchange-AntiSpam-MessageData-1: SGM1+oXA5WPfeQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b37269d-a35c-45f6-755b-08de7e59d815
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 04:02:27.7786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMwOVxPyNItDW4oARCe6H8OAMAAIFtL6oPAzTiStHd7ATeqpfNDuKU3WMFuKCnwdCxXcNE0ANguDKZTSj1yQNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7822

On Tue Mar 10, 2026 at 11:36 AM JST, Alexandre Courbot wrote:
> On Tue Mar 10, 2026 at 11:17 AM JST, Joel Fernandes wrote:
>> Hi John,
>>
>>> On Mar 9, 2026, at 8:06=E2=80=AFPM, John Hubbard <jhubbard@nvidia.com> =
wrote:
>>>=20
>>> On 3/9/26 4:41 PM, Joel Fernandes wrote:
>>>>>> On Mar 9, 2026, at 5:22=E2=80=AFPM, Joel Fernandes <joelagnelf@nvidi=
a.com> wrote:
>>>>> On Fri, Feb 27, 2026 at 09:32:08PM +0900, Eliot Courtney wrote:
>>>>>> Expose the `hInternalClient` and `hInternalSubdevice` handles. These=
 are
>>>>>> needed for RM control calls.
>>>>>>=20
>>>>>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>>>>>> ---
>>>>>> drivers/gpu/nova-core/gsp/commands.rs    | 16 ++++++++++++++++
>>>>>> drivers/gpu/nova-core/gsp/fw/commands.rs | 10 ++++++++++
>>>>>> 2 files changed, 26 insertions(+)
>>>>>>=20
>>>>>> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nov=
a-core/gsp/commands.rs
>>>>>> index 4740cda0b51c..2cadfcaf9a8a 100644
>>>>>> --- a/drivers/gpu/nova-core/gsp/commands.rs
>>>>>> +++ b/drivers/gpu/nova-core/gsp/commands.rs
>>>>>> @@ -197,6 +197,8 @@ fn init(&self) -> impl Init<Self::Command, Self:=
:InitError> {
>>>>>> /// The reply from the GSP to the [`GetGspInfo`] command.
>>>>>> pub(crate) struct GetGspStaticInfoReply {
>>>>>>    gpu_name: [u8; 64],
>>>>>> +    h_client: u32,
>>>>>> +    h_subdevice: u32,
>>>>>=20
>>>>> I would rather have more descriptive names please. 'client_handle',
>>>=20
>>> Maybe it's better to mirror the Open RM names, which are ancient and
>>> well known in those circles. Changing them at this point is probably
>>> going to result in a slightly worse situation, because there are
>>> probably millions of lines of code out there that use the existing
>>> nomenclature.
>>
>> I have to disagree a bit here. Saying h_ in code is a bit meaningless:
>> there is no mention of the word "handle" anywhere near these fields.
>> h_ could mean "higher", "hardware", or any number of things. The only
>> reason I know it means "handle" is because of expertise with Nvidia
>> drivers. The `_handle` suffix is self-documenting; `h_` is not.
>
> I tend to agree with Joel that we should try to avoid NVisms when they
> get in the way of clarity - that's what we did so far actually. We can
> always mention the RM name of fields in the doccomments.
>
> The only exception being generated bindings, but they reside in their
> own module and are opaque to the rest of the driver.

Thanks everyone for your comments so far. I don't mind about the naming,
I can see both arguments. But we have two votes for different names for
h_client/h_subdevice/etc so far, so I'll go with that for now. If anyone
has any other suggested names keen to hear.

Having newtypes for client/device/subdevice/object is easy to do and
will help a lot with calling functions that take a bunch of these as
arguments so I think that is a great idea.
