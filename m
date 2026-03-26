Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC27B37996B;
	Thu, 26 Mar 2026 01:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488159; cv=fail; b=o7M3G0GFHJ6pu+QOUiC2NQC5g24gh20PaixkWtRdFkJF03K2mXB076/wIEqIvD5bg83xvkSgJ7+XDCZOFw6G6MWGosQ+hBGWNLfRjYH1Ht5agncMRX6cvAfHKp2J44sQuBI1aRMrQVXLutRM4gXD+DuVaIMFayFU5quiQFJjzRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488159; c=relaxed/simple;
	bh=rpWn9llCityOe4xpNSWoQboJFocDklRbGe/UJgunIAE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZVHNHVjUbloJROOQW9COOkcomjDDwfHeW4MOhR2jDLwvOkxRAQfwotYrQbka6iutALrl16gvCtHPAln2LKhpErkIoE0VTuU7pVtMTwHMKymAhCU30aZze55v/D/pgxCChYR37jYHjGVMPFoWJXdSTEJ0uJXd/v6l5sTqRzlThUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CcpolQqD; arc=fail smtp.client-ip=52.101.52.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CcpolQqD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O785S/Rc4HT8vMyIykvff4q+gOHWVbLVBQKgElmIMbjpx9jPvvp3pyTNe1F27OylQGc4IAd9IrEXDjgyX5KmdMC3O7FrbkZ3p+XWYQLHF8e0zSBvEi9mAMZM6vk0VGyc9mcqRGWIsHOE2FIfeh6HBwX5f+ao7UoC7Ppf21GSWLAlBj7lA/X90gN3NjpfB5t4hF9qbbVYJQU21xkHxgheLFslQALSDG46QOLBtxf+/G0VKcvLC9JPZBS2DPAsaDBV556NHOQBYwSdGOv38I3akLWArndVu17OahQuSGii3hHL1KhJBFcCIDa2Ro0DbV3numG47nPTwWgSWh1JuNtdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHrzGyXGSxNP/0NSFzU3/DwqRIlCe1Z1LS0aSGIqsSs=;
 b=xUIi/PKL75mUD+RJYqJGQlL1kWMNWOaBEneHLvqeGWx+fUWN9Eyal8DjJ8OeQEbIIZf0CeI6J2MR3alXwVHBWEfZFicbdBrhkchkARYplUnT7wB8Z06DcaSg1wEZGr9DkPAV/GrYXsyKYHO+xF6hRPiA3mHxEAIPYEY6+b0w7hxcfq3zAL48CqKT5NGGxNbtnCjgXjJSwPxiRCIs77ft5KFy8gFAuKI81dtaF4OJD7Wh52hoNyuFAanPaBuR2MzEq9h4c3kJD3i3gv6eF76uE37z6Y1/9AxMcvD1wzyPIxvn+DzXykOngANcaANTF7QQlhuT7VeeyAyMp4tCPPotkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHrzGyXGSxNP/0NSFzU3/DwqRIlCe1Z1LS0aSGIqsSs=;
 b=CcpolQqDmw2UN8hdz+6dECepIop4vbNVrDFNVDe8j+yTfnr6OPV7lQXsw86ChNojgSApZ0n4uzvogk9B6UYO6Sp62MIGYV22m7gDlA2Hyc8QE6R4gXbXaDxfEWz088+GF1b+6aP6LvPSZ1vAtHOXr+LkSLMaNzTsu0ReDgF9p4mX8dS8VHBrUhXxkbdNSeVQD8OD0cs1YFTMHPsEpfJuSHffVX01edfsaUef0qm8fZFSx4IyYqYmh4JumuWMse6pX+1RbhQ/+uvLHF2MOswKWfPMgpGaEb2AW/alaLPWPBoYyipsUdY9FRYCg5LdWy6Br+zo/Ii4vN8vEroOvq1Grw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB8354.namprd12.prod.outlook.com (2603:10b6:610:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 01:22:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:22:31 +0000
Message-ID: <b00ca951-697e-45bc-b93b-bc3c4c5da071@nvidia.com>
Date: Wed, 25 Mar 2026 18:22:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/31] gpu: nova-core: set DMA mask width based on GPU
 architecture
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-6-jhubbard@nvidia.com>
 <DHBTVQ5C8GWH.22YI7TVB7RWN2@kernel.org>
 <DHBU6553UHPI.1KNLKA6TPN79A@nvidia.com>
 <DHBWKM7YMGFP.2BDTKGCGRGTUA@kernel.org>
 <DHBWY8LT8I4V.6G9V1VPIB4DR@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHBWY8LT8I4V.6G9V1VPIB4DR@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:a03:100::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: b490186c-6669-4c36-1eb5-08de8ad626f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oT4S+dRMpib9sshdSFQrETxypdITlfT6Q7mj37SuEm0JriKHQtmhrz90s/DIEyocbcOcigMqlBYCF14z+6P5XUhTiy7TdNsORmG5gMlYAedi/39b7GCDG+s6j89PBeM7syuROyEcQMfBVjLGkOc3k668s14we8ImpNXfB6ClKI2+8MPaNqIv3t07dEAtooAImdv1wADUj+E2Cexb6rqiwfpfdXQ2/fe2p68z81pS1bk3dKfXW2vLHecUsvmhGK3JRfWoC+hadHMhuSlwPlhGOu6EQoGL0FFCtfCThYKwex+OCMkWxSnmI3gBlrwDAlsNEufDo9nO1VbDm97RrJfloqsJgytobAC8voOpprdhmUvVr2Cll89XMvZqv8U83wrIlzn3ZW/QRKeXZVJELYW+7ohYGpou8ubmDquZOmL8fLgwEeIt6UQEB+Gc9jrJ+ZeiQGqW87Iz7nXJM6ovmTOZWJ+W0a/oGOs6jgr4fUyU7XNl3NUO6HLF94bbaVbf1epGdfVzBYkmD81ltC3Ko6Xbfjq7pq0MIRSB4Q9xjubBTT70HJ7Px2Ncd68Undj5uTEvyZRe5IQuFNCuCCZA4pIo/ayuoO9ZyU+GIgiPXrZd+/8S3gTWwtSM/3qx6ykHJTNGM3WJc4jghPr9q4EkKk68uur8Oub1+Z/8nQyaWHS2pQZJlhajy+PfJ8E3YA78+6SltWcvFZ1PHhmOiOfA/1G+4m4xfuvcpYidfmFZj09lZ8l6EsdJvpbxwHv5pbm9Ojit
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3RBL05PTkx5UVkvVExhSGJRRWhIS0U4c1FIRDZ6akVYU0g0MU5udkJjM0xW?=
 =?utf-8?B?QjNQNW5qTmx0OSs5ZUEvQUdwZjJheGhvQS90ZzNiZkVxUkg5QVg2dTZXRGJu?=
 =?utf-8?B?QlhwV21sRTMxelVTRFhkR3VFTUh3YzkzS2YydmZlR2xNak55UEFDYlZzNWhM?=
 =?utf-8?B?VFc0akxwbTdZS0w4bDVVVU5pSzZNOXIvSTF3QVIvRjhCWDl1aEhndmNMYUdM?=
 =?utf-8?B?b3oyM3JVeXNkTTgvT09EY1VOdTBMaGc2L1RqNWRHbitoQjN6V2JlSW42cHZq?=
 =?utf-8?B?VW1YYWI2S3lYbXc2WmFmclRpcEcwSDlqYmd0WVNTSDNRbVBLQ1ZGQXFhV1hk?=
 =?utf-8?B?Rm5pUVd5SUNsR3hOaUs4RnZKY2F4K0RJMWdnTzJ3ZlJIQVRXUjQ4TUdGUGg5?=
 =?utf-8?B?czM3LzZaWDRGNHlKd21ERVpOeUdDeVZQRE1ZRG5LTklsRHJjUVlsbmRCbEZx?=
 =?utf-8?B?RGlTZWorMXdvcDZaN1NDMDJkbW9la2RtUE8wWm9mTjdGZ0VwTm5EeklQUEVi?=
 =?utf-8?B?cG5xcERxa0xGajltRC9pS05waG9qYjZYb29qMHo3b2c3c1huSVNWZUlzcDJn?=
 =?utf-8?B?ejJLSkc3TDJONXRvZjNrbE1YY3hYL1B3dzhHZWNyd1UwcmVaY2FsQVVEMGdH?=
 =?utf-8?B?a0FrZVJQdEZBOXFoSDNpSkxDQzE2RXFsbmRTeURpVVdzaEE3MHpJbVBMdnpD?=
 =?utf-8?B?dGo2dk9xTWg3eUdOYnZ4ais1ZDZQRmVGOUJrcWZsR2UwR2taUHpTOW93NkFK?=
 =?utf-8?B?NTNXNzNUOGlIZE8wRUJqMUttUFZZSWxoWEdIMkd3OE1HMkplOWFUZlRBc1lk?=
 =?utf-8?B?UmdrdG1sZDhUbStUUG9aZWsyRmZ4c1M5eUtHWC9hcEJJVmpaM0RPK0pDTVNG?=
 =?utf-8?B?NHdmdWh3WTdqVlZqM1JteHVmV3Y0azZSNnkwV2gxT3hVeVZZQkxjQU5VK1N1?=
 =?utf-8?B?VEQ3dmZsdlNRdXJMSE5zKy85ck9saFdMTHpXczB0K2xSc3FJOUxRNytYL2p0?=
 =?utf-8?B?V0FxcWZwaVY3Sk0vZGNaeTJwcTd3NHF1a3pmK1RSS0hrWTNuZ2tMeW4rdkpX?=
 =?utf-8?B?bEhzVVZXY0t0RklJS2xJR2x3cDUxVG5LeCs2bmNlTzNOQ09DdS9KclV6WDlR?=
 =?utf-8?B?ZHdlRmhEdFZIS0FtczVaejk5ZTVuUVNZN1RKcXMzZ3Q2eUpaVSswTEVTZjFi?=
 =?utf-8?B?a1cxTHJHWTlHMGw3UUhNUVpaYjc1bHdTb2c1UXVuRk1kL1c2aExpZkVVOHdN?=
 =?utf-8?B?VWFSQXordVMzY2FKNjBpckh3NXc0Nm1xampmWTBQL1N5WndQNnByN2VCc3BS?=
 =?utf-8?B?OVVCeUlnR01PQlFJN0JtaGF0aW85cUFPbzdMTkQzdjZ1cVBjNkhRcVAwcWhT?=
 =?utf-8?B?ODVFbGxMTEQ4Nk9ZemtBdStpbXozejhWUmV1V1hPVkVxQkFEWUJDdmhmT2NK?=
 =?utf-8?B?aW9FOXMzbmlHVGMyR1lsbmxsNjVwNGVoR0dGNHR0dFhOa3BBRUgzK1k1ck9i?=
 =?utf-8?B?NHRhUWZMTyt0RlFiUkpWT3d3REg5Q3c0ZTZHaXFmRm8xRm9uaW53NyszbGRi?=
 =?utf-8?B?MFZHUXNYQzU2Mk5vZnJlM2xaNHIzTCtVd1BRSW9oMHFMTVQzeVNKempXaVNi?=
 =?utf-8?B?cXdCUWlsNGx0RDlLazJkdHlsZ1ZmWllQWm5BakRoSmlEYUhTUmtwVjR1UVln?=
 =?utf-8?B?cTVHL2J3VWQzL1lZUlVPRVpDK1MxVG1wdkgrbkV3TGZ2WHdIblBmSVBxc0lP?=
 =?utf-8?B?SXlYQUFnTWZZeEpYaUN6Ulp2aTlIVkFOcWJ2WGVycnRDVHRKSEpjNlNuR05V?=
 =?utf-8?B?TXkycjhBRitBdXFZeEhnaWFmS3BHMTRCMHpWb3Bhb3FRTmdmVEFMNEg4TFJD?=
 =?utf-8?B?ajRmdVlQRFVrMzJLQXBsRXpvZjZsTTZQbktNNGduWXdjVWtSS2sybXZJOWk3?=
 =?utf-8?B?cHlEUzM2d3VrOVhVRG4rZXNOR3RKYlF0YXFuL1FKKzlYS0xqdWlxUjByYkdk?=
 =?utf-8?B?MFd3dWphdWNLVlIzQklkTkdreVpRYzZsMHpLS1ZBL3ZkMmNNMUNONlRXaXdD?=
 =?utf-8?B?dFVoSjR2T1FVWWFsNzMxaEZ5d0NEanZac0FYOENVd29BY3N5L2JyM3Rka1hT?=
 =?utf-8?B?L1BDelQxc3VUWUdLYzcvQkRORWw1ZlFWK1BLUmlQR2Q4bzhvZ1c5bkZkR25O?=
 =?utf-8?B?QTUzbkhiS2QzVjdBMW4zNVVONkVUY1ByeXp3VWdXZ3A3Y1N1dmNBRWJYa1RM?=
 =?utf-8?B?WHJwK3g4Tk9FUEhBQTBlVHUyV25FUkZnWUVJcC9SM1l3L2pUNnF3bWpMR0xN?=
 =?utf-8?B?RHY1U0xXeTNUanlFY04xdFJqSHhBQTNoazBvbnd6RWdad2YvQmFSQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b490186c-6669-4c36-1eb5-08de8ad626f1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:22:31.5619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rW2muiinXvI2vmoeTUir7r+S0ofhem7/P+Nmq6K9EpQmFa/IoFliYKFZII/soJwDWR17kQn4WpvOjQ6mJSJMHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8354

On 3/25/26 6:56 AM, Alexandre Courbot wrote:
> On Wed Mar 25, 2026 at 10:38 PM JST, Danilo Krummrich wrote:
>> On Wed Mar 25, 2026 at 12:45 PM CET, Alexandre Courbot wrote:
>>> On Wed Mar 25, 2026 at 8:31 PM JST, Danilo Krummrich wrote:
>>>> On Wed Mar 25, 2026 at 4:52 AM CET, John Hubbard wrote:
>>>>> Move Spec creation into probe() so the architecture is known before
>>>>> setting the DMA mask, and pass Spec into Gpu::new().
>>>>
>>>> Hm...this is not what we discussed in [1]. You implemented the change in v5 and
>>>> v6 and v7 reverted it. Why?
>>>>
>>>> [1] https://lore.kernel.org/all/DGC28K8J39E2.1X173NHT9ZJDI@kernel.org/
>>>
>>> That was on my feedback [1].
>>>
>>> `Gpu::new` carries no guarantee in itself that no DMA ops have been
>>> performed so far; whereas in `probe` this is much clearer.
>>
>> That's not what has to be justified. Having DMA allocations before setting the
>> mask is not a violation of the safety contract; it is about concurrent
>> allocations.
>>
>> That said, all DMA allocations are on the Gpu object, so there can't be
>> concurrent DMA allocations while we are still in the constructor of the Gpu
>> object.
>>
>> Unless...one would try to create a second Gpu object from probe() (which
>> obviously makes zero sense). nova-core already relies on Gpu to be unique per
>> device, as attempting to create a second Gpu object causes UB and actual memory
>> corruption when there is no IOMMU. :)
>>
>> [ 123.966391] pci 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000e address=0xf7fef000 flags=0x0000]
>>
>> So, I think technically Gpu::new() already has the safety requirement that it
>> must not be constructed more than once per device.
> 
> Yeah, I guess that's sufficient indeed. John, my apologies for the
> back-and-forth.

Not a problem! :)

thanks,
-- 
John Hubbard

