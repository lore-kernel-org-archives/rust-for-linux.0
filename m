Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4B318BA4;
	Mon,  9 Mar 2026 23:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773099692; cv=fail; b=PLzC+sIoOH7eHQp0pSrhtgeZxnDHQg5zwpuXN7VV44ggE8j90SGmvcrpW+Ybl9A+5p2kbeqwnb6TOeQt7W9aUOJ4uCopIBnFSzDMZQLhwtzIv/ORpi3Va4sR8wioWiCjPvDQOCsw9NPVSi0v6iBcDD/NHsHQdQ+pNy8u+d3ZH1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773099692; c=relaxed/simple;
	bh=BOLzZIfOCQK4t7m+O09y81wwOEVXobBIU4V+7HTCxwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qJ0r5YoHiCcBtxyQPTwiY/fW+Cbs5CXjGG/aR/VTEWSKLBP56dWuH2V0m9JFdwX3aicMX6lBbI6beKUO6Te7RBOFr5FNuE8EMmekipZ0+7Ds+ZSmhzfWIvj3Yz8IsEh6pquevMgEFnwFV06gIMV2rLbK0iRZ4eS8cw9I3+D6uSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CgKSag3n; arc=fail smtp.client-ip=40.107.208.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CgKSag3n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMq0yMa4RJqY6St5tb3hSka5bRDfBt5VJU1UXR8MCOTqdc7DUqIjsNOY8JQqfLDDCcxVqHQTR4Neh2xHONeKDv4WRPiGWHFxD356q4yGSxVkeLwAypfboIjaTa4R63zepa+5zuS9YVWXacGivXXnT2aFMn65IBTaG+fzfwaWc6lWHQbBim9xZ1pV2pb8cI4QUmdQnQgIwe2DeW2Wmrs4G9e2neWmTCt+a79viyWRx3sFczL0vVo+2j+LstwGlnVOLVujlekBLASFxsKNieHyRm5xNqv2dhvgqT8Lhup/zQB+FPvxfuJo6LDLZ78kCWwg1pQesg6lVpucrnF0hnU25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvFqCnGV94iz9nIAK+QU9O1JobJx5eO8gPSqA5F7f1U=;
 b=OG3+rMG4/d4iF1wQLJ1VcUTtWX+i9Y1BVGYBrCQS4wuvFeq4xMf+QQsQ52Y/pTYAaNlRQ+Iuj5Q0vpDiSS4YtyCnS8J2ULFui95Dd10Y8MRnaHUP2yKSygEBSZ109XQucS7WRHCgZtcI1KTYijmCGNZ53erSVsfN7p7ZKHpqiD1xVLkfhVPoC3QPrx7/jEVEqqgx/wuFvJH/gwKnWr0TD5NE1+4Pwy6qlkD3elnanQQNR56N6baxEFr0UAWKzpcCGvEG0RFQUS4FIa6d4R3Ku0Vvft0KaRAdeSOV3Z/R7JO3kjXSIsTu569nwJkdZMon/ZPUuxgT+zzIw4JtWSu6Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvFqCnGV94iz9nIAK+QU9O1JobJx5eO8gPSqA5F7f1U=;
 b=CgKSag3n6rrquEUlEw342UADVei8k1Sf0XgsnpMF6Yfxc73jiAzc86fmG+iQjtTafqXztXW2d0UGiTfXAiP/C1SfVMAggWXtozozlgA2adHScVtcS2AaHcKzU9K61n+rHKhwbn9PSto8JnQO172ZQvRxiLm+12NTZ9NgT74xFZsKrnsBL/J2i3Dbmp9E7jNBABTpiBXHvZMkAn0IiseYb0PXTrJmUND8LYqOB4CfEnwfrnik7mm17Mlx1SlbnITyTkmJwpGpDPs9EeDlN6Et1wW3Y5OIr/k59jcNYjlCgF3F/dg529NZ2l19s0fhJzPeCYeLa2M//uoajcbWMMRQTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM4PR12MB7693.namprd12.prod.outlook.com (2603:10b6:8:103::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.5; Mon, 9 Mar 2026 23:41:24 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 23:41:24 +0000
Date: Mon, 9 Mar 2026 19:41:22 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] gpu: nova-core: gsp: expose GSP-RM internal client
 and subdevice handles
Message-ID: <2A3368BE-26A8-4F8D-A0F0-F078FCC06CB3@nvidia.com>
References: <20260309212249.GA2889394@joelbox2>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309212249.GA2889394@joelbox2>
X-ClientProxiedBy: CY3P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::11) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM4PR12MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: ba7b71bc-26d2-42ac-05d0-08de7e35600c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	ud/JkeUlJOzbtfGHar0opDFjRZY65DubWR6JFkpj6DV6cLXJaQGZTYUrfSDI8vZmIYFVPRMRVdT3kKvPxZNbs+TaGUh+M7cZgkdaLB6iEptnhcm14Tg5PFcR6kLCF3CuMavMJZhjhIXtZqufzhG4Shmf9sXc38tttujFhPanBO3idPvdhnNVg5ytAi+F1TvRIRPIQiOhIuRJrPjJx1NhBaXoNUeXglNUJOrcdu1wHom/d410+szl44gL/YOddfCVScIRCWPvMzP79qoXvIdOhrKpVVNeBFyRW5HF6LBsagAFTHLnLxaCRzHgF04bXT393c0VHcofiHMlkBrGLBRlnKXhum882f9u+vo2BeJGzUmzcnQL0/JCbykyHozZlSsKyg9MGN0IndHib6kTgk0jG8DGUEKoAvxPOoURXYzZfzwMxA1QwYv/eOGzYyL44fIz0LxZN/XXo3Ml1jqn+CCGlYRmKNnYn2zKhL07zHMtUVsjTiWNmGBfgA1NVdcowvtwfgrOESBylEWoxmW9r3E/e/ot4nqlZ5ewjRqtRVNiDkKhapoJcLa42LbDwOARSxcUqPndhakmCep0wb3FLuSQmqM+1+Vk64/o5UgpsrKfkzmtzVApSdufU72aSXMjTE00efoZWE+67k8IHbtXpfsn7oY5ehsxVYjhSsgWFXB1mLjKrYz43Aibt6bdSs0NuLI8hxTbmie2PM4yGvRZTglReWOkBH9KydOhSt6hRN9vXFg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDlQYmZqOHFJWE5Ja0dUdXRqZFR1MkZLN3h6Wm9jb3JFd3BWSmhBSmF1UURo?=
 =?utf-8?B?L2g3ajAyMm0wOXUxd2V1QXF2VlRWekc2QWhkeFdiTUVSckgxT2NNT0lMZWpP?=
 =?utf-8?B?Rk8wc2cwUzZrOUtDZkRnNVE3VDIzbm44NndFWUE5a2RpV3RFWEsxMk51bUhL?=
 =?utf-8?B?QW1oYlJUUGtMY2hjSFMzZlZmenIyVllNcjd5Q2s0QzlKMWswNUdqRFlhYzls?=
 =?utf-8?B?K0RaOW1WbDhDRnBnUUV0eWFDSmxCZGI5VnlTekdLeUNXUXRrRFpqMFo3NDNY?=
 =?utf-8?B?TmU0NVRrOGdiQThvenZtbUFRTGowQ2RDTi8weCs2ekRHVDZpMkhob05OUDFN?=
 =?utf-8?B?WGc3SXlpdUZKVkhZVHJVT3ludGN1MkZJdUd1OWQ3dlQyNGNBRG9VNUhINUtB?=
 =?utf-8?B?RG0rV2R2M3psWDJVa2tOMVBzaXNCY1hvZGxZRXVEZjd3eGQrMnh3N3IvaUJV?=
 =?utf-8?B?U21FSHdpckptNVB5TTgxSzJFUmdaSkRraXc5bFhwcFc3eG9WQWQvWEd6anRX?=
 =?utf-8?B?emxrcW91Vzl6d2lVSXdvcjJ5SXNUUmdzOCttNFpMcjJyL2x6NVhPdGhsMHNS?=
 =?utf-8?B?R2FJWE91TVZIMWptM0I2VUNzeGlWMWxpSHRwakUyTGJRWFQwUW9PMjJlSkhw?=
 =?utf-8?B?ZkNZdHoyMTlWSFl3Q2dyL0UvNVpBakJReDRUYXkyQnU3RFMraXZnOGJ2OVZH?=
 =?utf-8?B?ZnpKMDF2WU4zWnZ5V2pNZ1VtQnhQYzN3SUpIaEZqRnpqZVp4OWpOd2pibWwx?=
 =?utf-8?B?Q3BJM0g2MkQvL0RHNUYwbkx5NlpXb3FkNWpXZ0RJY3lGSWZ1Znl3SHc1clNj?=
 =?utf-8?B?cktwOWlsYkdhRlpaL1AyTW11alJkTUlkbm9lekNsZ0ZlcVlNVDJzODlmVVdj?=
 =?utf-8?B?c2J1bjdHUStGcUxsWjIvSzJKK1hQakVDa3dUWUpwbm8xM0xHQU03UVBqNEJS?=
 =?utf-8?B?bkVHV1JXOEJwOFY3eUJZd0FTNkZGWmNCcjJQRWFqQnBzaTl3bzBDbmpCZy9H?=
 =?utf-8?B?SzNZdWdLeXpXV01BcU5CTlpISjBaUDdSZ1FnRE9rd2o5NmVBaFBuY2YwcmxX?=
 =?utf-8?B?Q3VLa251ZVM4c3BwY0wxTjI5WG1sR0dpeDA5MEdPWjMyMXVLNjMyQ0NtVTZl?=
 =?utf-8?B?WWQyajBjWnNJMGtMc000ZEhSY2dCKy8zNVJqTUIzQVVUTHFBK3J1eGNIRS9T?=
 =?utf-8?B?eG9sN2h6cC8vTlZmcEhvMHk2R1V3cTB4WUlSenMwOHNKN1ZLOUtjVUFwWWxL?=
 =?utf-8?B?NVZTMFY1Wi95Vm80TUE2eDJpQzFOd3R2Y1dNN3BaYzNhTTJrS2FvL1hiMFNh?=
 =?utf-8?B?Ty9yazlFMmdUSzhnZkxnWTFpbjlYMGorZThwNUo1V2ZqU0ovUXRVZFRMNE1k?=
 =?utf-8?B?dStTSXlCazlzcWtic1BRZUVTcFAzYW9rZmxhSU0rK0tXM0dmbFl5WmRnRDFm?=
 =?utf-8?B?WGJjQ0lvdGQxb3REdzZwd2dBamxEcmpURmpKNFg2NFAwdGY0cGlUY0x1eHBC?=
 =?utf-8?B?Y1BRUUhBVUVUVGp3djUvTzk0bWxDdXFHeWFWUUh1eFY5M2Fxa1V0TzFaYS8z?=
 =?utf-8?B?UDFvRE5XSzVhZWhaUWhIN2FZQ2ZBRWdmUmxwOERhYkRCUXMwMnk3UVBGOHB2?=
 =?utf-8?B?YldPb2xkb1J6QjdPWEpvM1dFeWNRa3IxQ0VKREdTZFdDUVR2ZU14alF5UnpL?=
 =?utf-8?B?VzMwOGpOWHlrMENTQVArSm5GWndpNUg3Zkd1R2ZBWE16aVI2ODRDalo2TkJr?=
 =?utf-8?B?Ri93ZjJza29WZ2E2S1BtL1lXajRFQlFlakdiYkhNdC9udXVvbmxsUlNTTHdI?=
 =?utf-8?B?dzVaMkR6ejV6N01iSUxKTTNrdCtwYktHUUFjd0pMMTFyVGEveTRRU29wemZR?=
 =?utf-8?B?YzhWRXlrdFhCWUtiK3RlK2IyOXVIYU93bnl3MDJkU2p0aTZ3aTdxZzA0V3Jx?=
 =?utf-8?B?UjRKTGkwV1lLT2FOTzdVLzdCc1lFOVpmdlhSbG43WFJuS2NCZFZ5aG9Lbm4w?=
 =?utf-8?B?WXUyVkpUMUxROWpyTjBmeEJYS2ZIdWsyek1OSVdONzRxUGcxZlloVDVtTmxW?=
 =?utf-8?B?ZjhEdE1qZVFmZ0kxcHhtUFRBWmpwdU9IWDJzN3R1UVJnMmUrblhLenB2ckF1?=
 =?utf-8?B?OVFZWExYaFpOcklGUjErM2hVMnF0c0l5R3FSSTV6RnZwQW9NbEwrTEJMYm5o?=
 =?utf-8?B?aGF2bHNzdlpsTHg0Ny9DTWQwcmZqZW5zeHREQTlpWGt2U3VpbzFyOUcvRGlX?=
 =?utf-8?B?VGNNWVlDQkxJNngrU2hqSkNIVUV1akFkMC9STklaUVFDRUZIMThQVDlScWhF?=
 =?utf-8?B?OGJ1WG4vaTZMSmRNb2ZCeFpoNitEQ0gwRE5odGJvRzdNckdvVXNkQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7b71bc-26d2-42ac-05d0-08de7e35600c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 23:41:24.4405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UIi9torEUK4XZ37NAeWh1InArJHgf9TMy8X/JKMj59KpHumAo6AjYpVRWuswchIXT3h1pIJ0pUC8Oh2PyDukQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7693



> On Mar 9, 2026, at 5:22 PM, Joel Fernandes <joelagnelf@nvidia.com> wrote:
> 
> On Fri, Feb 27, 2026 at 09:32:08PM +0900, Eliot Courtney wrote:
>> Expose the `hInternalClient` and `hInternalSubdevice` handles. These are
>> needed for RM control calls.
>> 
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>> drivers/gpu/nova-core/gsp/commands.rs    | 16 ++++++++++++++++
>> drivers/gpu/nova-core/gsp/fw/commands.rs | 10 ++++++++++
>> 2 files changed, 26 insertions(+)
>> 
>> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
>> index 4740cda0b51c..2cadfcaf9a8a 100644
>> --- a/drivers/gpu/nova-core/gsp/commands.rs
>> +++ b/drivers/gpu/nova-core/gsp/commands.rs
>> @@ -197,6 +197,8 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
>> /// The reply from the GSP to the [`GetGspInfo`] command.
>> pub(crate) struct GetGspStaticInfoReply {
>>     gpu_name: [u8; 64],
>> +    h_client: u32,
>> +    h_subdevice: u32,
> 
> I would rather have more descriptive names please. 'client_handle',
> 'subdevice_handle'. Also some explanation of what a client and a sub-device
> mean somewhere in the comments or documentation would be nice.

Also just checking if we can have repr wrappers around the u32 for clients /
handles.  These concepts are quite common in Nvidia drivers so we should
probably create new types for them.

And if we can please document the terminology, device, subset, clients handles
etc. and add new Documentation/ entries even.

Thoughts?

-- 
Joel Fernandes
