Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011049.outbound.protection.outlook.com [52.101.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9738833507A;
	Tue, 10 Mar 2026 02:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773109045; cv=fail; b=pRM5sjM8koN2l0YNc0cifyUMu44Tg4+YbQeSezwlbRdoO+4GFBpWRP3bx5IHuY1hwoQvXQtiUwSN1tAR5wBa9GolWSkRiyGSdyD7iep8vwrjZRTM8jf9kxX68TpI+sa7Dw5qZBVwhRC1I6zdU15uUDEBBwTb0TnHN9HjkWP7tMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773109045; c=relaxed/simple;
	bh=n+sDl9FBtbRLKGN9hNGGl1T8+B+XWQpo8006jaG+lGw=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cUeCJ31UH1pb1oINpDQsoaM/khpf/vUmlUlbCKjiCzamEENzfJrhbNHwGfWtrszjZbeCeoZy0tuEWoQ8ZhlYVss2mInlaIVRkB3s8Ger73rddSEmQPlB34fuxxHjzRS53nlINhOrXkM391bnCd++xrIMuYi/+m2Ql6UpTt37YwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CMAszBej; arc=fail smtp.client-ip=52.101.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CMAszBej"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQC+kfxRymXxBIFAQw4ImJ0sIxkA1pql06PVVCK9g7pkTyPidi5quTvWsaseRQ3gIWv0H23+qsbYNF2/eYsqmbxmmr1kdDjMF+Elrlok5jGHebmvenbYnZ2rXsdqfSFi17ReU0tZeHhqDNZ4dDr+rhMd/nKRuhXAA1MOCMnhzXvJs7OeUHEurZuYPGsS6Prthh71qc7jRlIjSgOHNfWzBmprBxbY5kjH0ANu3K1w5/EW0SCsZs8S0gfqKhHmqrh6gdabv3U7D44zB9T/UtYOftHLUzONAbiesH1qNZxSd5EPDmUc+8XgGAZmA3xWyi62gVXg8L5ALbideS+u2ENsZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CReEVYBM9gctuSUw4hgF2AwhnUIgsZUpWCnraayOfk=;
 b=s+FOOqca6yHnMGJfA1ZD3ITMUZRVyahb3k0lYIbcj8J/tSROcKSe/j2fp8JaxDZ1GY9da9OXXBP4YXRsqIQL63lSDZduJi4HKkOHsWaBqSkUA9/iNKNp9sZt6Eq0p1cU7j7G19xQcwb1vUqTesIN56OFFXp7DQvqUtPm5lChLcOzy0tTUDK+WQZaIGjs3A1NmTNN5yf/OAKE3ios40DWTc+mvjD0Jzdd679MbOT5S9cISGk4wwEBawU3JFh/6x0MDrTZRejwnd2/0X4QRwIvpVyvUGaJPMh5nBiW0zhxCL4+YGaT8/InTt+IAbyHUGA4gsb2aRgRqUfq34BehgxMLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CReEVYBM9gctuSUw4hgF2AwhnUIgsZUpWCnraayOfk=;
 b=CMAszBejJnD15VQXjMcoysIex7j8QvIP9uIftHitmtok8Hf1jQP1WD7vV7AkN8dB4YmDtaET1p7z9PP6jPGJKztyaMTgn/B0TnwPEbyrGC2VQcGrfXhiXq/cp90Dgx16N8nDB8NU/OyfHM8nwTAqDPVUs9XZOmBLy+JBzITL5VSfCUVB6A+JnqwsE1s/wMUMYzDQ0O+BEyXqfIxbU7XWJ2GMGta6NsFFZ2HUidaCUcy/oo8/ZXtLBtkOi7DGRMleaTOjLhKCRNTjBUWj6BT2V7edJU4KHOXbYVwnkcuh9JUoSbeQctxon5md+CBLAfgnEgEQxgwG8khhxCtaqID4VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6612.namprd12.prod.outlook.com (2603:10b6:510:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 02:17:18 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 02:17:18 +0000
Message-ID: <eaba411f-d882-4175-ac43-a9217fbb915b@nvidia.com>
Date: Mon, 9 Mar 2026 22:17:16 -0400
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH 3/9] gpu: nova-core: gsp: expose GSP-RM internal client
 and subdevice handles
To: John Hubbard <jhubbard@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <288fc58b-657c-4e8c-b6bc-d07afe14bb97@nvidia.com>
Content-Language: en-US
In-Reply-To: <288fc58b-657c-4e8c-b6bc-d07afe14bb97@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:208:32f::14) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: f63ed1dd-379c-4afb-d439-08de7e4b2727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	txKzG9pY1QB34JIU42l8u5hFMlsBCnLkTdIdRe6Bk/4+JYxxKY797Zb2IAvV0Yf3WyxCHEbgrpzuMphZNuNTMGhrlSNXonb4qvEtIirI6J8N09k/PVkFwmk4CjPUbKtu4dFF9KqJKeqcDvMJUr+XB9DVz57KksHokd0Ogl9ZaHTyfyS/jSKqRbbwcjg7lNoWegwu/JI8GE2CC1YhY5ei9nY+Ys3aZOKdqQNShqMooa5ZG5HWeEXU0jnXeQUSyJo5OdIv9tYZEPZRSjJjFSYsGEImh3vXIy/McOk28JzK7dmmuOY+g219f0kKH3Sgobt3VixvyKc0zErKUF9pQJMkNjQuPTYGrOHrn3zEAXYp/ClrWBZtq/+6HxI+Ax3Tf4XYx2eskC690Afd3w1Ymh3icknaa2cv8jAlQfT/SxaRqGNMWy0sU93YfhgSE9GM2zilZAiMGbLnZXcttFD2+khxsnjynMTE5hxzo+DSB0Ecu9KPdIdW5BGDHucv9POddoOCNHhSu6j3nrOu/eou1dxNTJ2KlD0QeuOdT1zjikV8vtNEmsLjuTDWdbfw7gj9PyDxOvn5xSFbgT+B2dFyRZCAU0iJinlkgwRXSGPR8Lfqkzyu6aRhx8e+jPg6AyMfPD/PhmH+4s8l+wcMtwKCa7vm63ZtUhy9xr/RDj8PQ/VRHsGE8iTLSjYIiqhSgcIpRGjnqqHSXwTMwf7hLU7fu7KHBl6c/5ChaMpXEgqXMFeI3Bk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2NvNGFoSi85d0YvWHptbGRuNlI4U0ZnNTZMeGhrWnFtS3huV0NYQm5HcERm?=
 =?utf-8?B?WW5KUU13enVKZnU4cFJ6N0ZqMXFPeWRENkRjaGVCZmtGbXNKMS82S3ZTbEph?=
 =?utf-8?B?cUtKSVc1UjQyaFBCSlhhT3k5RjZYc1JIMklhT2JXNFpZRGp0SGFjTUZ2dzNT?=
 =?utf-8?B?N203bFAvMmRXbU5UY0tpblpJT3dFZmliTUx0L0prSzloM2dBZXpwNlUveUpj?=
 =?utf-8?B?ZlFXUnVZK2Q2bHYwL1RhMm1ySlhqTE56OGdDSkdhcEhjeE45UjJwbFZET045?=
 =?utf-8?B?SzIrcjd6S2t6VncxWlB2QnpPS3RHYnk5ZW51R2VobWZpRVI1Z1Y5bGtCN3M0?=
 =?utf-8?B?VEUzNVVRVWhjRHYvK1J5SUtlSW5TcVVtaEx5Tm5qV1RjWlpObGFpTFdnanoy?=
 =?utf-8?B?bkFhdWJuOGZxY2t5a2k1OGllS3pUeTQ0RVBpZG14ZC9DVmg0VDV1QjQwSGFp?=
 =?utf-8?B?eGxpRXNQSmZ0TC9BdkhQeGRwRHZoNUxubnVVTktJQm9MRlJ3UW1iKzB6YTFO?=
 =?utf-8?B?QmhKZ3M3b1pRcm4xeEp2WlFDV2tqaXJIZUE5Q25DbjIrVmdFaWs1VTdEUUlD?=
 =?utf-8?B?Y3pHU3VLb3hETVd5MnF1MnY1ZHBpYkEwMHp1WFpkSE8rbmdHVmdxc1FZak9G?=
 =?utf-8?B?akJ6VFZ4ZzFNdU1zQ1dsRDdjbHhTSCt1WE1BeWcrVVFML0w2RHVnZm5xZzF4?=
 =?utf-8?B?MkdnVVFEV0JkNktyRFJwekhGMlk4M2h0aWhVQW1lV3RnSys5K1B3VUs3MEg1?=
 =?utf-8?B?SEJDMkJaUUpqUFdEOUFyU1dIOXR2REZ6eTNKVWFmdDFLWmNQYndZNVRJU2lM?=
 =?utf-8?B?T2ExMFRFcmRrbnhKRTUrbkxwRzlTZ3VUZXhXYmU0QkcxNmp1eUlia3JpV3VH?=
 =?utf-8?B?N3pSNGhZNER1bFBKQVFqWWs0RWI5YmtmVUV4V1dmQ0JPTTZYc1dET0dQWlBn?=
 =?utf-8?B?VUIrQWNRdjlIK0FDOEFJOGhuWjNEWEh0YzRHTEszZitGN3FzS3VJUU9UYXJ5?=
 =?utf-8?B?ZTNFbDY4aGF4eUFtUWZ4UUhnb0lzVm9qRzJ3VXIvUi9mSnRPRjIxcDZ5Zjcx?=
 =?utf-8?B?dGhBMUF0cnhJeEdadnlsdFhiTVlVUW15SjFQWk1seXlxSFIxaVJobURnWXpR?=
 =?utf-8?B?TXlwTzFPSnUyR3ZnYjdFSExsWVJlNk50VTFRT0JsTkp0cXVITGIxWVY3Zlph?=
 =?utf-8?B?Qlg1ZUVRVFNYaTlsampvdG5RTDdUOXdhdTlkK2RKZ0FIVzhDVUhDK3k0eWE0?=
 =?utf-8?B?K29GOS9FMFZxd3d4TUdFcDZFVjhTTWxQZndRdHRZMXNEbU00KzB3eE5waHdL?=
 =?utf-8?B?MVI2NmRXVFUvQ04vOURGUVpQVVRqNHdRbjV3TlpSZ0dKSjEwQW4ydFFOeVlY?=
 =?utf-8?B?andCSkF0dkJFRkxLdG5Sa3BVZVpXUkFIT1QwUnVnS0pwekJTZWhFOGExaGdE?=
 =?utf-8?B?UjcrMG8wenhRRWlxN1l4eFYxNFdDNmdNNk4vVmxrUDlwWWpZeUpGT1RNSWVa?=
 =?utf-8?B?VXkzTDdVcVNvQm5EdHNURThSZ1RzdDAzanpKODl3UCtkVVlXcXZ3bFdyYmMr?=
 =?utf-8?B?N3NRdjhHRG5vem5nVENVYU9rdlg5aVVyMkF5aXJoaXVhRHVIN25kK0RkeDRP?=
 =?utf-8?B?QlpqYW5RQWhra0J6SG9vWDZYZ0kzZzJnK1U2NWthOW9MTVJsV29lSW5xNUE5?=
 =?utf-8?B?Wlg0SkRPd3NHbElncE5wamNSRG5iQkhkaFAvbzYwd1ZTbU5RN2djVEp4VDVS?=
 =?utf-8?B?Vmo0WDZqVVVueXRMaEV3RGNHd2pLYjNhVjRLQ2p4eExWNTFIcUdVaXpYeC9m?=
 =?utf-8?B?eXVhd1dmaG16ODl2MWlSMWVkYmN6eU9kRTNram9VSjRKY2hNTlp0Y1hxWGNV?=
 =?utf-8?B?N0w2S3gxVEZNZU5KWWFVbzIyTENvVmEyVXowdFdBSzZIM3FPbDloTjRtczgr?=
 =?utf-8?B?aDdKODFlRWdYNFhmZXJ2Qm1TS0tBWDZ2SGJ0KzZ3Snd2THlMT0lOUEdGTEpp?=
 =?utf-8?B?UkdaMEM4QmUwaTRSNlcxU1ZVQ1NPaGU4WWZiWDlCUWFFK0lmRFhYS0xqQk02?=
 =?utf-8?B?RGZXMWRWWHVvemk1OXNVN1YxS3N2d3ptRHdEUTlxZ2pIUXROWWozQ05jK1Bi?=
 =?utf-8?B?eWNyRGN0Z3ZBRzJ5cS81UklleUZvb2dwRUNhUDVMN1NuVGNxRFRISHpBamh0?=
 =?utf-8?B?bWVJK3p3NHBQQU16WThteStxYmZCSGpRdC9ySGZxY1Jqa3Bma29xRHNQQU5D?=
 =?utf-8?B?cHJuc0I1Q0FQSGlWcDZYZjY0Nzl0UGltSkZWcVhrL0orM1pTbzN1bDVscUpM?=
 =?utf-8?B?OW45N3cxNGZ6QVJrckJTblpTZlNHMFNkVk1IQ2ZRNGhVUlcyUXdiQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f63ed1dd-379c-4afb-d439-08de7e4b2727
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:17:17.9816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dRMsm1Jpcp4AZxXyIY/P1IvxlhbjSztZza9/sx/UtOhK0ftHZ48CNzZnSSuC1M2HUTBUP/d3vENDxGU1HLuDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6612

Hi John,

> On Mar 9, 2026, at 8:06 PM, John Hubbard <jhubbard@nvidia.com> wrote:
> 
> On 3/9/26 4:41 PM, Joel Fernandes wrote:
>>>> On Mar 9, 2026, at 5:22 PM, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>> On Fri, Feb 27, 2026 at 09:32:08PM +0900, Eliot Courtney wrote:
>>>> Expose the `hInternalClient` and `hInternalSubdevice` handles. These are
>>>> needed for RM control calls.
>>>> 
>>>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>>>> ---
>>>> drivers/gpu/nova-core/gsp/commands.rs    | 16 ++++++++++++++++
>>>> drivers/gpu/nova-core/gsp/fw/commands.rs | 10 ++++++++++
>>>> 2 files changed, 26 insertions(+)
>>>> 
>>>> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
>>>> index 4740cda0b51c..2cadfcaf9a8a 100644
>>>> --- a/drivers/gpu/nova-core/gsp/commands.rs
>>>> +++ b/drivers/gpu/nova-core/gsp/commands.rs
>>>> @@ -197,6 +197,8 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
>>>> /// The reply from the GSP to the [`GetGspInfo`] command.
>>>> pub(crate) struct GetGspStaticInfoReply {
>>>>    gpu_name: [u8; 64],
>>>> +    h_client: u32,
>>>> +    h_subdevice: u32,
>>> 
>>> I would rather have more descriptive names please. 'client_handle',
> 
> Maybe it's better to mirror the Open RM names, which are ancient and
> well known in those circles. Changing them at this point is probably
> going to result in a slightly worse situation, because there are
> probably millions of lines of code out there that use the existing
> nomenclature.

I have to disagree a bit here. Saying h_ in code is a bit meaningless:
there is no mention of the word "handle" anywhere near these fields.
h_ could mean "higher", "hardware", or any number of things. The only
reason I know it means "handle" is because of expertise with Nvidia
drivers. The `_handle` suffix is self-documenting; `h_` is not.

> 
> However...
> 
>>> 'subdevice_handle'. Also some explanation of what a client and a sub-device
>>> mean somewhere in the comments or documentation would be nice.
> 
> Yes, although I expect you can simply refer to some well known pre-
> existing documentation from NVIDAI for that!

I apologize but I am a bit concerned with this approach because it feels we
are drifting into black box dev without encouraging more code comments,
documentation and cleaner code.

We need to make the driver as readable and well documented as possible, we
do not want another Nouveau with magic numbers and magic variable names.

Very least I would expect at least one or two lines of code comments of
what is a handle, what is a client, what is an internal client handle
versus not. I guess I do not understand what is the hesitation?

Sure external documentation is good but to clarify, I am referring to a few
code comments. That's not much to ask right?

Elaborate documentation files in kernel can be optional but there is
probably no harm in citing external references from in-kernel docs too. But
again I was more concerned about code comments and variable names.

> 
>> 
>> Also just checking if we can have repr wrappers around the u32 for clients /
>> handles.  These concepts are quite common in Nvidia drivers so we should
>> probably create new types for them.
>> 
>> And if we can please document the terminology, device, subset, clients handles
>> etc. and add new Documentation/ entries even.
>> 
>> Thoughts?
>> 
> 
> This has already been done countless times by countless people I
> think, and so we don't need to do it again. Just refer to existing
> docs.

Not sure if you are referring to nova-core repr or docs, but the repr
technique to wrap raw integers is pretty common in the firmware layer of
nova-core.

> 
> btw, as an aside:
> 
> I'm checking with our GSP firmware team to be sure, but my
> understanding is that much of this is actually very temporary. Because
> the GSP team does not want to continue on with this model in which
> GSP has to maintain that kind of state: an internal hierarchy of
> objects. Instead, they are hoping to move to an API in which nova
> would directly refer to each object/item in GSP. And subdevice, in

Even if this is "temporary" we can't just say "Oh, I'll just add these
legacy things and badly write them, because they're going anyway at some
unpredictable point in the future". After all, this is the Linux kernel we
are talking about :-). The bar is quite high.

> particular, is an old SLI term that no one wants to keep around
> either. It was an ugly hack in Open RM that took more than a decade
> to recover from, by moving the SLI concept out to user space.
> 
> So even though we should document what we're doing now, I would like
> to also note that we suspect a certain amount of this will
> disappear, to be replaced with a somewhat simpler API, in the
> somewhat near future.

Sure, but client handles are a broader GPU driver concept even if this
particular one is GSP-internal. We are certainly going to need a rust type
to represent a client right? Other GPU drivers also have concept of
clients. The point is not that `hInternalClient` represents a GPU user
today, it may well be temporary as you note, but that using
`#[repr(transparent)]` new types for raw u32 handles costs nothing and
makes the code better and more readable. This pattern is already
well-established in nova-core itself: see `PackedRegistryEntry` for example
being a repr type. IMHO, there should be little reason that we need the
struct to have magic u32 numbers in Rust code for concepts like "handles".

All I am saying is let us think this through before just doing the shortcut
of using u32 for client handles, etc. Rust gives us rich types, lets use them.

thanks,

-- 
Joel Fernandes

