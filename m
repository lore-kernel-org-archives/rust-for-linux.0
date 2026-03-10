Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013059.outbound.protection.outlook.com [40.107.201.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9542DECCB;
	Tue, 10 Mar 2026 01:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107369; cv=fail; b=jmSY2aocEf4w2ieQm+FvPAyf2BhD/QipgLCfYF6d7MCMEc2J409HfnSTZAmrF1w4EgUZJujnZRZBodJjmz83ekd3b1sBtQ1uEuAxYxFb6CgJT2lYy/GcsJ2nFVGHZjDZNhzLlwzZWhZdap6/BOLwBpmMEz4XzyXviBajc4DBOos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107369; c=relaxed/simple;
	bh=TN8rvKDSloG7U75eRlgzC5ErKPhLswI3M3O2IqdOFpM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TDyQXw0DpENM1FpkBeYf7LovdfEFYEBN0qPXyfRPvjJMW0ix83m9CPG9ZNi2PA7fHlrcRCZ3Q3BEnntCO6rkSKYLaQhABhhGi1GkQZ01stj6ogOYCKDdu1lA7PqQftZllNJtQCwGhzPFVe9TZbfwtNCRjNRyyFTNPs+AquS9Dvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h3xIO31l; arc=fail smtp.client-ip=40.107.201.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h3xIO31l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2Uec1zGcnpW93wEC2FstXS0rG5qoKxEPP7dTG9/zQ1a08PGdKiW7WI2xyKFlnaY+rcuI4dYsPW3QfzS+ziufWRq0MyWxEnCkweBF64JQc9opwbx+h4EH6U8jqajcHXR2ONFk2MSxYFLeoY0m8O/LYXP+DWC8X38lGDb5yuDJ7oLUf5brujm6zTsFmQfvqKoubg3XVh8Mbgc3wPji1nL2zyyny/BWZb7lz/CvQVIylYwiGEsctE8PmLSjLnq98nZtkskpNqmA2ORmYPDbvg/RfYsOyCmjqEHI+w+gnsiq+jxr2Rb3XIpbcni6G44cRtNVE+ASTXu83oTQHkXhIKZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PxYbxvvh1NgeRnR9BQMX707pq6R8tY+dsKwkxIdxBc=;
 b=K1IuG5v+zJQmQzts+Xt6IXX8i+ngTtWa47YHA1BggErvas71NNKLTznyDZWq/fXv4KTbkaw63uIG2AMGqLn/Soww3ocqAyqUPVqzbzSln8red9pVtMz1O/SeEeTWc3pyRlvgc7tiL/FzTANBGIlL7Ca84JdOFMOOLL6ciwEBn3V/+w6bePr1TGiP8NJTMM87AapJ8LSKHMDlVwykZH6wQ8Y0pZpYVnxKJSpUMIsJGk8LAvuXOwESZ5tYxAkm8CsaVQco0I+FENZkyTHH+c+Va7OsrIs27gk6OahGqS9dW4nLs+yh6J/Rj9TjOodOtRDYxpe49APibqHFo/P1XnFTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PxYbxvvh1NgeRnR9BQMX707pq6R8tY+dsKwkxIdxBc=;
 b=h3xIO31l+iQ6JAz2sYuoIDn4YuXZ8/kb+JQsUOPzXWZM7vwQjWEx+6gE7GNwhPLpFCglxUyXm9LpJTCu5QOH9jqerHML6HumJoj2jeIVJ8stJ4LBXl5CHCu4eaj9Z0UJNKjHWIo4m8aPG9bhGjUCBO883PC8PD+6srL5s8vqcWRo7EV7sF2+M5oH3cWZcEDshY2yIwb/f8fLmRJlZ9P1VS/mB2zB+Dl2iQumVlLpUYQa69HI9YgL7fS74lmLL3OmCAqraBskYVO6cKLkzNm+fKllY6upDqS4bKEerv2RoBNxecvApW378J5n4MFENjIGczbJOMm4TlbGo20+Wzfe2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB7918.namprd12.prod.outlook.com (2603:10b6:a03:4cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.6; Tue, 10 Mar
 2026 01:49:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 01:49:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 10:49:20 +0900
Message-Id: <DGYQ3OB7O4QT.1Y2BNWVBPRFRY@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 09/12] gpu: nova-core: firmware: fix and explain v2
 header offsets computations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <20260306-turing_prep-v11-9-8f0042c5d026@nvidia.com>
 <DGY8OSWDD5XN.2S6NSBDDDJX4@garyguo.net>
In-Reply-To: <DGY8OSWDD5XN.2S6NSBDDDJX4@garyguo.net>
X-ClientProxiedBy: TY4PR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: b78f906f-cf88-4ae9-1657-08de7e474139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	i13bfXB3y88Zz4xvKZUryfO50MAGDBOnSLNYchR8+iQ/DvAQMDc99u3eIxNRw+69YAOQt6nohvFuPSPDObBLWL8DX6k1oIJnF//uz6DwIO/TVxX+7m2N9tukeTkbRKGSMQk+crTqDBGSc9/pOAA4651xUdyHB1dker9MtvaCMRTqGppKWD3ZbANK++tMeCZynNYfI6uOmOAsKV2shEglsYn4PiOpE5s3JHjBpvIT8qQTy/pKQnw7fq9CVI29ZF/talIEiWOYJr3rAkvI+3OUqqYyZvolUOUSrzJFy75Bt/oAiPn5wl+23w42jm3nOEVa8htHNdSHdtuIel6eN7A0+NV4ahgLr/3JsakWTG3YWlv4vMZVGLA5d18oAJCrMeillAIcV8cQBzN8ORA9dYi1eR5xbpC9ivEEeB+toZYTzDiJpE3jyyfjK4aQilDflmInLeUPErkH+s9qYSuUGn6enF5s5Sd7A0bWTfYlMvFiS17ppnEIgeh2UzajosQD64wWnsoizrxjBnDWMjCSNFUTjr4UExIP4bvo2S1ZJOsgT5nyRDagc32rzyR8mVjcJjEQ0HqaSoWQG7cwtbZgfgphDU7Ldt42BzVyfgo07WElQq6g9sbx+qhcCJFTMG7VA9f5MPk7r0Be1ScGMWw/Aov8eLMtPT4NuB6NvvenoGOmhgOhccwKzfKePbaQQWarD4orBZXIXAB5zHyVOqghyKZtyb1/xGGMUAQciUxxlTKyAF0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzNzb0RLNUpiVnFsT0EvQktvR013VzBuWjVobjQzdEUxdlk2UVh2d0NWZGNB?=
 =?utf-8?B?a1BCNWJZbklSTytkemJvNVNKbTNBMER1dmpuUGxNSnlmbDIvZWpJckM1UVh3?=
 =?utf-8?B?YkxBOHJoR256WjdwM29sUFM4alJpNFp6SjFYTUcrMTBxdWlXcU54RUNsd3FF?=
 =?utf-8?B?N0J1ZlVMOWdVY0pQSlpKOFN2VHhSUUVyQWtzWnI4RmpzdWUxZ3dtU1c4bmls?=
 =?utf-8?B?Z0FrRDN0L1QxSWNGT1hCWVp4QjhQdG9FTzRvK3FJdnZqWnFrQU9Zc3ZzekUz?=
 =?utf-8?B?alBHeFZsTGd2M3FPRjV2NnVQUml2b3ZPTWt1VVVra2JWQ1lOMElrKzNQWldw?=
 =?utf-8?B?VGsvWlo2SnRZa21SNW94Qm0zRDdGWHdtN2tieFBRWlpIVGJPNW1naWtZR3pm?=
 =?utf-8?B?Y1FpNUM0TkRZeWk5REp4WE02UXZaWkR3dDRjeHJqUHkwMnlzcFI3M1NIVml1?=
 =?utf-8?B?QUhuYnMvd2ppVkoySE9LUFIwOU42dmY1akFjd1Rydk9Rc1BRTTU5MU1aQ3JI?=
 =?utf-8?B?Z1l5c293MER0ZXlGTU84TGtSSmNBcEoyeGNPMUltdU12NXg1bEtkdnpkZEVO?=
 =?utf-8?B?T0VPQVk1Z2x3Nm1FcGlaZ3FoT1p5Zzg3a1JWVXpnR2tST0ZBdC9ZRDRFYmdp?=
 =?utf-8?B?a0dCU2ZEdjFrMGVhZURaWHIrQTFvOUZSVUFrMmdNOEtSdTZ6aTlpMXRBVVNh?=
 =?utf-8?B?d0RBVlplWnB4aGN2Yjd6anZRUHc0QTRac3gzYzBoLytCMnF2c3hhSG00VmxV?=
 =?utf-8?B?UUEwOWpOVGhmYndiRGpvVFBHNXlHVm1pT0NDUHVQRU1pUE0yUjN3YWtpai9h?=
 =?utf-8?B?Mkt1YTEyTmNqbzc3N2N0cXJEcnFVS1dZbFZObC9Oa200VWVOM0pVMG93NkFr?=
 =?utf-8?B?SFlRS24xVEU2LzhmUXhBcGtQdHFVNUhQR2JIblhoejBYbEVEM0JkS25GSG5o?=
 =?utf-8?B?ZlgyeGpPMGJCL21LbHhhcUpTTUZNN05MVFhBVHExeG5GMXRQSmsyWWh5NWhX?=
 =?utf-8?B?UFRIZXo2T1dwc2JoeWo1eEY2ZUhyY2orMVV4bllUcVM1dERaZ200b0VKNHla?=
 =?utf-8?B?ak1jb1Ayc3ZkV3o3Um1KMklNTGM1RVVnYy9XTjIxNk1MNXU3ZkQ1NlNnNFgw?=
 =?utf-8?B?VjRwNXBoWVhyalhxanc2Q2J3TXBiRzFDWXJHMUZIcGdRcmlpaEt4N21kL0hk?=
 =?utf-8?B?ajVBQjc5S2lGeUZzMEhma3pna0Izc3FZWHhBNXgvOFZUZU1EZjhBUDdFazZK?=
 =?utf-8?B?Y0FxVUU5eVhjR0xUM2pac1N1M1ZDQTlHYjh4WDdDSDhBelpzbnpQL3V5emVK?=
 =?utf-8?B?YTFVdTlPb1Y0bmVNckI4UVhiaGo2c0NKNFd4eFM2UnRWTFFBY2NpVFpVcE5K?=
 =?utf-8?B?L0lnUlRDMlg2RStPRmxJRGtodUVvMlN3L3FuZEROWWN0TFpYbzQ1Ym9wUXdS?=
 =?utf-8?B?dHpNQ1Y2QW1kNFNZejI5b1dtcnIzT0JmYVFXT2RHbzZnUDJtR0pRWjBVYkhj?=
 =?utf-8?B?MDVXWStQNTVvWjFxcnlyZitBODNiL3J3dTRnQlF2N0dyS3J6M3ljeGpmUEJO?=
 =?utf-8?B?ZVFZTlFmL25VcjZhMmRyamk0OWFLalIyMmpIaXhYSFhYejI2eXVWRzZmMWV1?=
 =?utf-8?B?cVBkRldYblFQNWdLOGVKL3VvaTNDT1pUdGdCV2NJbU9KQURhS29uK2M5SENZ?=
 =?utf-8?B?bjJDdEsydWhTdEhYNStHTW9vYk5aRWh0TWVRQjA4aDlVWXFhNjRVMkRMVW5s?=
 =?utf-8?B?MkJqajIrcEJTdmpobGo3WWFxa2M1amN3dVhmcCt3dnF6ZmVhMVlSY2ZXc2N6?=
 =?utf-8?B?QmZOVEQ1THdsd2F0SEdPazY4bi9HQ0xrb1lSL28vd0c2LzVEc3QyZjF4OWpz?=
 =?utf-8?B?RFpQaUU0RG5IYjZTTlR2WlBLM2pSWDY2bGZYNWdlTkMwZ042N0tJb0RuWitr?=
 =?utf-8?B?RlcrSzUzdFMwV0NJUnJRTmV5L2FSNEdUVDhGYTVCVnJlZkkxQkQrVjExVkND?=
 =?utf-8?B?WDNKeGxRRFN3VHQvVjJ5WUhCYmQ3cDArQjhIYjhWZW1qQlk5Z2wxb0g4aTlS?=
 =?utf-8?B?NklETFVzb3puMWR3aU9pWWQvaW9xQjZEQmsrcHk1RXF5Y2VqL1M4Q2dZYU1X?=
 =?utf-8?B?bGYzN2tLdUo5QlkwdlJCMHRLYXJ5TkJZdStWZG1TK3k1a3pidTFCMDhnU0Zm?=
 =?utf-8?B?R3J1UTFJUXM4bHRWUVI4dkFoMGl1YVplbm5kK3d0cnhSZVdHMUl1dnhlVTZy?=
 =?utf-8?B?YlRUME1pZHdKQWMwbEk3S3NIK3BaL1lpekhxTWV5dVBXLzY1WUVFUkd0RWk1?=
 =?utf-8?B?VWNISFFtWVlDNnZvNVRmS2RBbi9HRzBJYzhMQ1Y4NGRuYlkvMExwUjcyM1pk?=
 =?utf-8?Q?V1KS0w99J8UnwdydzbrnH9cpTMzfdF6VLOQOMhzuCjAkB?=
X-MS-Exchange-AntiSpam-MessageData-1: Cvz0Ps8Un/b9Qg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78f906f-cf88-4ae9-1657-08de7e474139
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 01:49:23.8131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9F2C7/4wPjrRWxNhHCEd/OjdUPUQTqKlllmJmOKMT9jXrnm7FDOJze2IEezoU/kA8CpuVfY8J8lTtKeFSVY6eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7918

On Mon Mar 9, 2026 at 9:10 PM JST, Gary Guo wrote:
> On Fri Mar 6, 2026 at 4:52 AM GMT, Alexandre Courbot wrote:
>> There are no offsets in `FalconUCodeDescV2` to give the non-secure and
>> secure IMEM sections start offsets relative to the beginning of the
>> firmware object.
>>
>> The start offsets for both sections were set to `0`, but that is
>> obviously incorrect since two different sections cannot start at the
>> same offset. Since these offsets were not used by the bootloader, this
>> doesn't prevent proper function but is incorrect nonetheless.
>>
>> Fix this by computing the start of the secure IMEM section relatively to
>> the start of the firmware object and setting it properly. Also add and
>> improve comments to explain how the values are obtained.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware.rs | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/f=
irmware.rs
>> index c2b24906fb7e..5e56c09cc2df 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -63,7 +63,8 @@ pub(crate) struct FalconUCodeDescV2 {
>>      pub(crate) interface_offset: u32,
>>      /// Base address at which to load the code segment into 'IMEM'.
>>      pub(crate) imem_phys_base: u32,
>> -    /// Size in bytes of the code to copy into 'IMEM'.
>> +    /// Size in bytes of the code to copy into 'IMEM' (includes both se=
cure and non-secure
>> +    /// segments).
>>      pub(crate) imem_load_size: u32,
>>      /// Virtual 'IMEM' address (i.e. 'tag') at which the code should st=
art.
>>      pub(crate) imem_virt_base: u32,
>> @@ -205,18 +206,25 @@ fn signature_versions(&self) -> u16 {
>>      }
>> =20
>>      fn imem_sec_load_params(&self) -> FalconDmaLoadTarget {
>> +        // `imem_sec_base` is the *virtual* start address of the secure=
 IMEM segment, so subtract
>> +        // `imem_virt_base` to get its physical offset.
>> +        let imem_sec_start =3D self.imem_sec_base.saturating_sub(self.i=
mem_virt_base);
>
> Why is saturating sub used here? I didn't see any explaination on why the
> saturating semantics is preferred over checked ones.

They let us keep this method infallible, and an incorrect value here
will just result in the firmware not booting.

But, maybe we could compute this value at construction time with a
checked operation and return an error there. Actually that would
probably be better. I'll see if I can follow-up with a fix for that.
