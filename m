Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013034.outbound.protection.outlook.com [40.107.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB89355F36;
	Tue, 10 Mar 2026 18:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773168513; cv=fail; b=LhUQ13+t1pexKyRHgz0WhCvheAEU69V4TJlOxOztCYidjPX82dy886UtPflxWVuxgDMyoMv+c4lCvIqp6ILDC9eP3NdjJmn56OFbMXmTLXnbekwuKwCog+q+anhKGHrhUgE8/iTX/NEihjf+CJmpEy1hTQxtEBwUuNZaVa9j+Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773168513; c=relaxed/simple;
	bh=nKfrEnbAhi6JbKKlJ4ycMKnLC7q+1NSvqqvW/0Fhw2Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CTV8jkPOmESlVbh5pN9Yhemq5uZrQIAGid8cSGuSej/xmaNZNEd3+MActNrt81PODrdBkzm2AlMrR1eM4YH3OzAfUIs+spa19m17Mf6gcnJMPLbmyiBYgFJYgFtU7WxfzDkQY0SPvRJ4sXU0EzTJ/d4TWFQxnSMuEMfK8UjfTC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sLzHPFrx; arc=fail smtp.client-ip=40.107.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sLzHPFrx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyMzowo5Aka2hRHP6SkY6KounlnHJWXK3J5ltJ5KC3Br/dD+CuB6BB17jzFW2uFkyy+2Of5hhkKSMHDvWE90eRI/HYZihG17SmbqkSUmlIeKfPgPZren7WzHXTYXRgMnttKRyAee1AVLm98wnPPcEF7L8fHMBY0hWWFVFR6n6vXY8cdoIbxlSejRUP01OBhjij+iONK1eapM0DF4xV5Pt7BYZ/NciG7xPniQI34XXGI4Yo+Yb6Ts+WdabNTEBJd6/g2SfUbUwHCL1/+Gwsc90QYKUhLf8ukoawlD9jENKDOaptrmMvtxpTWXC8QRtCFwUXsHIPwsNVis6HoVYA9HpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mlQMMcx079I4zQZrWvI5r9A/HcKjvsOpJ+WGTe3bpo=;
 b=zJccOZ98krV07BZ2FP9zVATz2NMTlbPqHlvqQAG1DClgRq68eb95JqHO8x1eGA9v6hvEsiECgBwwf0g92+l2LtI8yTtBKHHyT9lPvTv1UUqd+uTfT+yj94TARnB5CFoqTwb9yvxvHToDqxxdt1KFXuJOWYGZcAOXm3ST6ItUqHPrjQsC2H0vORG31V5CxpfPNGMsrp6wJ08b8nr8mnYbdNRRObdg6yivUv2XTRlvsBRXdCr//+L35r64apJLQAF0XJULDdlNWa0+G9LTPgwHJ4SUQhYf8zVYZIAyCqW1Rxb/EZJKutjVnJpy5NV8otzSXMbDSsiP62cPV0Se28LDuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mlQMMcx079I4zQZrWvI5r9A/HcKjvsOpJ+WGTe3bpo=;
 b=sLzHPFrxU/hwq5s4Fi73llPP5d4tlmVMbVP8Qw847MRNW3gEsWOGZswr+B3CNq4orWEsJgsRp4g/UBn0uq+UpRFsOIKb+Sm2chpvRW3rNwbJwg0kpbSAInayGy9hPQtCS/qoI21Ic0pd6NS3XmdtNjM3hFtvauCZV4h1wKQPozm1/L08FjiDLRwWgjuQgc0djZCsPZN9Oi/+2MnMMc3NCfic9PFPsnLZO26P5qOlfIcPJpEc56ITceGRUIMz23Rx49PnM5+AxmepgO+R9BoSV9PbHYsEBOOMgccEd1JfwLDuU8RhUOhWXJTyCiPReaRBiInE5NzsVvPm0alo9cUd3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS7PR12MB8345.namprd12.prod.outlook.com (2603:10b6:8:d8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 18:48:23 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 18:48:23 +0000
Message-ID: <c48c0602-74be-406d-97b6-f3931346412f@nvidia.com>
Date: Tue, 10 Mar 2026 14:48:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] gpu: nova-core: gsp: expose GSP-RM internal client
 and subdevice handles
To: John Hubbard <jhubbard@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <288fc58b-657c-4e8c-b6bc-d07afe14bb97@nvidia.com>
 <eaba411f-d882-4175-ac43-a9217fbb915b@nvidia.com>
 <a8a2b89b-807e-47e2-9eca-2bed0c71602a@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <a8a2b89b-807e-47e2-9eca-2bed0c71602a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P223CA0037.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::14) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS7PR12MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b6f57c-8eb1-4bbc-f04b-08de7ed59b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6QLVVQJ0fGRaH2Ty6Zz1sqM5bCVEkNZR3Q8C33lAnqAg6CFAri7QH/sfsSbPyrLjRCRPz5t2HBIjnK6KxbpN7YxgclOGxSrWq9HFloAlLLiH+YUWB+aeN7RX1hDZQyoW4TB1oGaymxNOV9JremgxJJY0OYk3JUWfbUtsd4m5DEKwHkKFLEm9nM8orObzFwM3PhGc+InFUy5YtSRXGoSFfrbbyNXEhfdosPnERXn5hMG3oUrWao1700xlw7kTrEwVIqB00XC/0GyawVO8z8N7u+19/Xvip+li3DagwZCNdKNHH25W4r2+uIZ/mQn8dNW/1HQ6w8Q5t8JWrUJNXV/dG30VH5CRpUsg4pKT9vFNK3Yo/VathSlh8m9m3DBh8zZvI/WpBn8MOK4ZdjZHbVR0c5g1Le4PgO2+ToXDqgY7rfCfCCHSv5YivMlPbhFr+uI8WSwOK8PcWZkOHiA3/fs+uDoLNI8ViCVJSkOV5W5UhLSOT9fuxowKy4BpPT9Vzu5/mmFOeCO5Q7awam9px+ZW+C90tPTLGsJ25VmNQe8ATJLAS6l0OevH3ocUURId2KOoAvtzuVD5/FiozUsTNjmqJkHotjoQhjIbpMqgcUfxSWsqYdWpuN0wYAHGze0ctcuSacJdP1+f+30zp8QOzYcuG6JWaGSExw883mbAeI/Ii1oa+t2zlTuwXq91jeknCrjHfXw28EJICja5UgS3+IOp5jTKB+NnZT38V/MQm0lRlbM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm1OTmQ3VmhUY3pSMmF2cy83OHU0c0dQNklGb3BsWDRzb05Jd3lOeVZNaTdH?=
 =?utf-8?B?eHJEZjRJRDhDRit6ZkkwTE5TUHBqWXltOWplQjFzZ2RQQ2RvaWxRZm04b0tZ?=
 =?utf-8?B?enBudjA5R2g0eXk5dmhtTTVuM1U1bk9MSjc5UFBrdWRQMU4weTFMZjdmR3ND?=
 =?utf-8?B?TGorVWJzTm8yOW9aTHpnUUVNaEI3QlpSME5ObXhVYXNURGJJaUtacHRNN0Ix?=
 =?utf-8?B?SnQrT0RmZ1RhK0l1VjU1UG14cmQ1WkowdGFVUzNSTDhzNGVwYit2MDEzbWQ3?=
 =?utf-8?B?b3pyT3JBTjh3dmR4Y2h1VjMxL1h3cVFDR3NtRHd4N2Nhamx1dXdiaDEwUG1H?=
 =?utf-8?B?aDY3aE1vUnpSQmpTM1JjTkxudjJSMGt6WTFBTEp6VVA3MVBjZi84L2tNcTBE?=
 =?utf-8?B?ckRrK2VZMTk5U3QrNnhuaDZvNGRJcWdkSWpkMzJnOHBXdGd5VGVMb3VKTjhY?=
 =?utf-8?B?clF4MFh4U0ZZY0poS0oxQzBQcGYrRmZLQ1ErY1hVOU5KNm1lSTBsVHMxNTNw?=
 =?utf-8?B?b2kraWJLZXFOakZ2Wi9RMVV0Ny9xZnRhbklSemw4dkl3TFJJNlRnS2Q1eGRx?=
 =?utf-8?B?Z0hpTFBSVitXT3loaE5rb0lWdVZJbWN2QzlieXJrL29lSXM4MjNEcWtGdDZF?=
 =?utf-8?B?eFp0QkdMcTZwcEdYMTVnVGo2cysrVzJOMU9aekZyWTNrYTdxSTBsMDdGeklV?=
 =?utf-8?B?VVlUczdOaG15N2YyNDJhaVE3WU5aZnlKb1VNUEJ5Z0t1UzRibnRFa0F6anFt?=
 =?utf-8?B?NlhFNXd5SHliU3o3K1lEZ2dMQTFGNEZ0SEhBOTJJQUh4Q2JFUmQ0ZHFOb09n?=
 =?utf-8?B?ME9tMXRWTFdWeVlmV3ppMkVuaGM0TC9BSlRna0IrUUd4VGc4a2QwcGFYTVJi?=
 =?utf-8?B?R3l2cXhCc3ZaY0VNQlFETFNkQlJ4WUk0WWtDcnJpZWllSjFNWEx1R2k5ZGN5?=
 =?utf-8?B?K3g0cTBOWFVWcHRla09jZWJBenJFQStDbWd2NjBrS2lZSktGcjYxdUpqOEEw?=
 =?utf-8?B?NFF6VFZodHRYUytuazgxd2Yvd3NpbVVWZXp3eEMxZWd5bnpPQy9xYnNEbkg3?=
 =?utf-8?B?SUpESWRSZ3l0K052Y0VySFFONEFSNTRRb3dyTzdudVE2Nmg2Y3hORE5QZ2hC?=
 =?utf-8?B?dXpTdGc5QzZldDViNnN6MWdNT3M3R2NJc3NXVVJ6WVB3dk0vM2MvMzZRVlcv?=
 =?utf-8?B?Q0tJS2VaZ1kvd2JCeExiMm82QXA0UUlvaTBZTmJGNHhzSmJNdk96RXhFSWQ2?=
 =?utf-8?B?cWpwd0pPMnBmY3ZxK1lEWjdmS1RwRE1NUENyRCtSZEo0UHA1Y0FyMjlCMEh4?=
 =?utf-8?B?eGVXQTBVbDI3VElvTWVCSktnNkgraXlFOHh1N3JCYXJRRkV3UnJWZkFLeHM4?=
 =?utf-8?B?dzV0SVVHWDNqRkpOeXpxTUpvR25MR2pKNTJmZkpMQUxBWWdkVEpIelZ6L1gw?=
 =?utf-8?B?aDJBVzVJZU9kNUxjVWFXVmJML3loNVlvS2hXNSs0UXhaejQwVDRXZFE0bXN0?=
 =?utf-8?B?bUhJYmZrZHAwMzBqZ25zZnZ3b085cVduYTZIRVhKY3gzeGJSTnhML2hJMllh?=
 =?utf-8?B?aDJzUXZuUHV0TlJkRmR5VjgzQUFnSGtPV09kVCtVVXVsditaeDBkbFllOXRm?=
 =?utf-8?B?ek1pc3p3bzNKUmloNloxOStoQmZtbUpZbUk4YnM1Y081ODlxcmUzanBKWkx2?=
 =?utf-8?B?OFRxTVk3QVNGUXVYUXgrMXhlRHN6T1VsRHRJQktKWTY4VUk3aFRKSGVMYnc4?=
 =?utf-8?B?MHRaZkxIcDg3ZENKbGh4SE9HNS94N1hHVVd5VFkwSForSDhRa1lRRGZNUzd5?=
 =?utf-8?B?clMwaUNnNzJmSWZLR0xSalN1TE9tUnlhK2pwK0tVbWE3N2dIVTJLbitqYVZx?=
 =?utf-8?B?dDBCVnhtV2xUUU5ERlNTNWVxRVNvV1NJTkFnODlGV3lMV3huYS9OSCttRk5G?=
 =?utf-8?B?Snhuc01ENE00ckFNZ1NKanR3WU0vMVprZzB1SFNSWFBGeGxpZGVFVVIyWWVh?=
 =?utf-8?B?d3FrMEFyekdCSlJrcCt2cFpwOEk3R2lGb1dOdUp4V2wzZ1pRWTBxTGVjMm0w?=
 =?utf-8?B?KzBOZkRUa1JZbWVqK0JvTkMydjBQNGlBZ1F4TUFzbjJpRkt6cEUwcUgzZHlN?=
 =?utf-8?B?UEFRYUVUSHN3NmpYUnZ0dEN5aGdod2NaSkFLL0NsSEY1ZEhML1pWRUZ0Y0ha?=
 =?utf-8?B?MkRRUHg2a3h6SUZPNHo5YzN6b1BtUmM3SnlrcW8zeDRYMWFCamxuZW1zeFg2?=
 =?utf-8?B?dkdoYVFFSVVmd0NQaXdQaTVncks0bC9DUXBLT3VWRXA3Z1BMTnNaNzRWbTZ3?=
 =?utf-8?B?R1paZzVFNGpZc1NzaHVjMTdtWUxuRXM5NzMxM2hZdVhoY3lJL0h0dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b6f57c-8eb1-4bbc-f04b-08de7ed59b58
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 18:48:23.4452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dz+vlrLCEKFYJR8r9zWoxYUDbdlFCozN8sa9KGTSew2/7W8mR11p5/qNkDLWrnMZXNI1X5+xal3lygvwujejvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8345



On 3/9/2026 10:29 PM, John Hubbard wrote:
> On 3/9/26 7:17 PM, Joel Fernandes wrote:
>> Hi John,
>>
>>> On Mar 9, 2026, at 8:06 PM, John Hubbard <jhubbard@nvidia.com> wrote:
>>>
>>> On 3/9/26 4:41 PM, Joel Fernandes wrote:
>>>>>> On Mar 9, 2026, at 5:22 PM, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>>>> On Fri, Feb 27, 2026 at 09:32:08PM +0900, Eliot Courtney wrote:
>>>>>> Expose the `hInternalClient` and `hInternalSubdevice` handles. These are
>>>>>> needed for RM control calls.
>>>>>>
>>>>>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>>>>>> ---
>>>>>> drivers/gpu/nova-core/gsp/commands.rs    | 16 ++++++++++++++++
>>>>>> drivers/gpu/nova-core/gsp/fw/commands.rs | 10 ++++++++++
>>>>>> 2 files changed, 26 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
>>>>>> index 4740cda0b51c..2cadfcaf9a8a 100644
>>>>>> --- a/drivers/gpu/nova-core/gsp/commands.rs
>>>>>> +++ b/drivers/gpu/nova-core/gsp/commands.rs
>>>>>> @@ -197,6 +197,8 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
>>>>>> /// The reply from the GSP to the [`GetGspInfo`] command.
>>>>>> pub(crate) struct GetGspStaticInfoReply {
>>>>>>    gpu_name: [u8; 64],
>>>>>> +    h_client: u32,
>>>>>> +    h_subdevice: u32,
>>>>>
>>>>> I would rather have more descriptive names please. 'client_handle',
>>>
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
> Maybe if we write h_client in the code, and "handle..." in a comment
> above it? Or the other way around. Just to make the connection to
> the Open RM client code that is out there.
> 
Sure, a descriptive name is better but if we're going with descriptive type
names instead, then perhaps a comment with a descriptive type name would be fine
with me too.

Here are also some sample comments that could be used (Eliot do confirm
accuracy, but this is from my notes/research):

A client is a handle that provides a namespace and lifetime boundary for GPU
resource access. All child objects (devices, memory, channels) are scoped to it
and freed when it's destroyed. Under a client, we have Device and Sub-Device
handles.

The Device/Sub-Device split comes from SLI (multiple GPUs acting as one), where
the Device broadcasts operations to all GPUs, while the Sub-Device targets a
single GPU. Today with single-GPU setups, the pair is still mandatory but always
created together as a 1:1 mapping to a single physical GPU.

>>> particular, is an old SLI term that no one wants to keep around
>>> either. It was an ugly hack in Open RM that took more than a decade
>>> to recover from, by moving the SLI concept out to user space.
>>>
>>> So even though we should document what we're doing now, I would like
>>> to also note that we suspect a certain amount of this will
>>> disappear, to be replaced with a somewhat simpler API, in the
>>> somewhat near future.
>>
>> Sure, but client handles are a broader GPU driver concept even if this
>> particular one is GSP-internal. We are certainly going to need a rust type
>> to represent a client right? Other GPU drivers also have concept of
>> clients. The point is not that `hInternalClient` represents a GPU user
>> today, it may well be temporary as you note, but that using
>> `#[repr(transparent)]` new types for raw u32 handles costs nothing and
>> makes the code better and more readable. This pattern is already
>> well-established in nova-core itself: see `PackedRegistryEntry` for example
>> being a repr type. IMHO, there should be little reason that we need the
>> struct to have magic u32 numbers in Rust code for concepts like "handles".
>>
> 
> We will debate this when it shows up, perhaps I should not have 
> mentioned it, other than to remind Eliot to make it easy to delete.
> 
>> All I am saying is let us think this through before just doing the shortcut
>> of using u32 for client handles, etc. Rust gives us rich types, lets use them.
>>
> 
> ohh, that's a whole other topic and idea. I wasn't going into that,
> but feel free to explore if Rust can make it better.
Oh ok, yeah it sounds like we are aligned on this with Eliot's other reply with
introducing new rich types for these, so we should be good there (with abundant
comments on the rich types). Will explore this further on my side as well.

Thanks!

--
Joel Fernandes







