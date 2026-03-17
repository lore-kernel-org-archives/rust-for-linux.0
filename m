Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010032.outbound.protection.outlook.com [52.101.56.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D94329E5C;
	Tue, 17 Mar 2026 22:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785834; cv=fail; b=sbMY7//LKEY+v57MpHvuMRgDe0mNwZxMGau8y9XNw2KOmcfyagjkmpM4HAVdUlFEfdXWlcNW6p8uDKPp1RNXCFsE27/j0aIVFxC6uclpPx3gRYCsitxmW5dmXs1IAj2iI/BSiHP1vlg94oIcYPqRUCMWQdSjVbOmDApgKEsjflc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785834; c=relaxed/simple;
	bh=BVKMmSdx0+ZVVBMxv4NV6fZmS9qSHVm3pHsoSltDNAs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QbNSV+Pu92DpWokc//C7lazsXXMC0odwWZqHqYN8abGIMtVU/QWa2WF6tdnXD021c9KpjiOtJlthbSlndWLKi8I78U7HfICA6BFX1LYe8+lY7xkekp1FMCNMJ6iSI75lSy9Q/7Nan9B4H1TPKiC/Ryta19u2GX/azNpUgp/jXis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lDBchbjj; arc=fail smtp.client-ip=52.101.56.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lDBchbjj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSXkyCmGb+VNMWAGPZ0VxAxyvZ8FUpPWFx5+t8HXrPJ34VWbgZlY5rpCka8ElP2SEKdk5J1Ldjr47Vbtlww/uN8GcBFUywzkN08aIA0VPFV9g6kTjX1o2rgWP9UN7B5QHVseCjRI+yBMBRsJpgitkLk3KwFk06KK5PEtC71Kwhb7Afq1gHmNF7NCRlGlWlZ16mbDcL9NceUAofOEr0GckvrogEfoqGEx3oaOWK7IBBXbQkLP+LDHx2VZVCVs7dVFP1LlnUMjNZzTR6I4WOV7nkRMQyR0Gdgzg4oAQJuAwGTPBZky1HRRSKG6KGNu+7oC7m67iBG/xZPB0OtE9Hf15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpwtOtSFpjLB6FTnmC0u5sJUdAmyxwHELHNA1iKd2Cc=;
 b=ROkf1ZQNaQg2oByfDptxdPlcNGG0+ZsO61P4Bljozcu3qIrxMV86UUo9Eone5z7GOLIbJJ01TDlOeufMmPZbEmZwa9QDtQUdX4fVkLN3uxCcVYyE047zd3FbBPJCh/Z+2pglrvmOnjOqhB8FHvv+JByZ/uwFAWP/K3n4dMIwISuKNBU9Bw1Su3IqhOh6PvWv1Bqc1RXWCQjtE42CR+Ze+t8TXFsF7PaFiLNn/K1+6rZcsUBa3CwKq8MK+7z1Sn0pLClNGZw2OCLJMWPEOLL9ocYB6ak5g93XtQmx4euCsUEAf+WTCOA6n4H8a+8EGnbA/eB0s5ovX1FTaowXXko54w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpwtOtSFpjLB6FTnmC0u5sJUdAmyxwHELHNA1iKd2Cc=;
 b=lDBchbjjhNKwUSd9KQmur2ZR51jsPit4wrXEP+G9hR8G2dBDLiKaGsk/dTwHcwHz9fbP4mUq/OsFzISZa4wR5IJF2KEds4HLxfKg60NJ9m8LTvuSpfWqtOSIwptyvOLhDvRJ/z1GitKIdCifGGgvAWUat/8tC5nFBhPkhmQB+879F5e0ub7bGEDcUuBbF+NqW0Drs1tdDt4B6jero1VRKnIlFPqT4LBIgwVyLwlKy+lTn9Ov7DXl2Sheo+GMVtpHVcrOXXBorSjEJkyTRR6Xt3POaWtY8EkCFomywaXulnH7PPR0lncWnl11RJkC2sFRSLnt/HB3FPWfTd7N1CtdZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB7560.namprd12.prod.outlook.com (2603:10b6:8:133::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Tue, 17 Mar 2026 22:17:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:17:04 +0000
Message-ID: <7b73e895-e743-47ea-b151-92d5cd66ff5d@nvidia.com>
Date: Tue, 17 Mar 2026 15:17:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 33/34] gpu: nova-core: Hopper/Blackwell: new location
 for PCI config mirror
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-34-jhubbard@nvidia.com>
 <DH4WYLLI4W3H.FR6JJLVTN171@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DH4WYLLI4W3H.FR6JJLVTN171@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:40::41) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b25d16-9d17-4bf9-e285-08de8472eb44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	k9TdAAHzIIe9jYVvqrIiNVifrXssFjB9uz4Y0+M+oyou6kS6Rn84DKUPaKL17GwjzIQa6GtbZI5lEfYyE3N8p7/kd8rwWzrNEVh/CWLIaBptVgOdbHMwKxKhD9crsnOGAAlbuhD5gS/TR7TO1LV7plGgzOWrYTFPN/TbToc9enqhsrGnVlzLklk61rNHSjMO+IHrNX973KvsGbNWN+IoPrYki2dZY8JcusAKk97AfBT9CdwpNXGPVdiKOw/ltCtEUN24N1izc33NV/mdHKL4FLhqLIbWhhGMq9qwLc94ZXDkiDzwmGeSSIIexBFAhc6H9xVrcrjmnWnuXSzMGWMR7YsVjQet18bijqSI4OWE9cbkaq0sw0+Bso6243lPilaw0WYxHghqrZUR3MTagLFDGX0A+C6YBw/3G4O5ziREiQUluEUF/u02xUtlf5IzafMAN+/jBdaxdb6rRooL1+LScJRG1+6UkWe5nE9Rs+XRMGeCgPFh5l2CJm7fRs7kwSZAY3Y5YUU8LITENdFncrigw2jGPt6EUdMao2Zbet9Jc9C8t6csFuNFui+d6lIUR7PLHERLARrBywD3MqcEPjLLergRJi793SuP2GHI4brWq0gCbVzVJootXVjc5RYxE9Wf7tDAdP64FfSgtbuzD8HZtKW6iUQKu6/ljFRnArs4BVYIxpL7Zbprylqy8wq+pdUCA4NRtUfaZ2kc46FWOQ6TWZq6vttE8SJfI/fXWaEUpO8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGc1VlBzTyt4S1RUYnhCV1Z6cEF1ZWVWZUpWeVdad2VUMFFRMFpwWDR1by9F?=
 =?utf-8?B?ZkNCb3QvRVl6QTlwQndKbU9ZVjhtdkRWNEZFbEFheDVYYzdnVlQyUWpNeXA2?=
 =?utf-8?B?VHlPb0t6dGVKdFFkTlkzWUJVa0ovZUNwazJQUDM2Tlh4ajBzWUNicXNlZUxM?=
 =?utf-8?B?bFQ4aDZpU09KanpLR1NtTi82N2o1OGNBNjA5UW1nQ29zMnRFMjFITElZNWYr?=
 =?utf-8?B?cWpYZkxOandMbE9COEhVQlg1elhJN1pqUEk2bWpINlp6d3poaVZ5a0NzSWRE?=
 =?utf-8?B?YWE3NEthRzk0M0NYdTdhNlBVS01QQ3BVUjZ5ejhmeC9NQlJ2aHloZXFSUmZw?=
 =?utf-8?B?TlBQZWhLajNLRDNOM3p0M05NK3IyOG03RU5qa05rcEtiWlg1eitmQTNLRzNi?=
 =?utf-8?B?OGFvdVZPa1dQdTVnQ0RpUkpvUlhMMncyYWRJQ3Bpd2R6a3Q5UzByaUpyeWNJ?=
 =?utf-8?B?V1lBZWNld1pmMUhCS1F1V240dDhvRE56eHJaUVFPTWFScjdFSFBvVXpIcnB6?=
 =?utf-8?B?RTlXY09JcGx2Q0JwTHdqelFnZEM3WklYaDh4aENDUXVmRFd2MnZ0SHB5Y1I3?=
 =?utf-8?B?UEpLcFBZU3FHSFI1V0FtaXFSdmNNeWR6UTNiYUpYK2szYlNzL0E3eFVLTGs1?=
 =?utf-8?B?Slc4VTlwbFlqMUJIdTJwaFlhb1ZzZ2VkYzkzMDZmc254dkc3eWhlVzJnQ3F5?=
 =?utf-8?B?c2VhM0kyeVJJMXZJVnl4dFBtU3RicTdqOERnZnN1M1pGZFpLK21tblNDZlVH?=
 =?utf-8?B?OS9CRW1tVmpCNlcxVFdwU0c5Znl2bWZRbHZiRVEyRVgvZ2tMWTdTSW5GT21Y?=
 =?utf-8?B?V1JucjJ6R01ad0FNeU9MVlhPdVR6V1VJZk41eStWczFTRUNYRnJlUUNqbVBZ?=
 =?utf-8?B?QjFNSmdyTmxaalczV2NNeWJISWFsVU4rcCtKbW9oaVlHNW9TTS9QSEZmSndy?=
 =?utf-8?B?YnBHeVdKUTRBa1RQS2EwbjZxRm9EcXYvUjZVNEREVWJxcEl6TDEzYzZ5S2xV?=
 =?utf-8?B?OVdsRmMxeStmd0Y2TGFDYW1mNGQ1dFVkdVVDMWFEN0IzODhmLzVxUG91ZkVW?=
 =?utf-8?B?L1NNSzN2YzZxekJ4SDMxSDE0MkdxWDBqNXVuc0I0RFdBZEpHVlZqMDZ5UXJw?=
 =?utf-8?B?R24rSTEvd25iaWZ1RHcremVUa09MbThVMERZM1QzUFJzWG1Od3F1ZS96bllG?=
 =?utf-8?B?MkJxZVgxaWl3SWEyYjJqTVgrSHQ5dVVVQ04vajhlU3AwWjljenNpK1JDNUYy?=
 =?utf-8?B?Q3M2QjU3b1JvNHBzbjJBOTdCOHJidGNmRG1pNXJxTlB4ZlU2QUdod1ZOQ2NV?=
 =?utf-8?B?L2l6MUx6U2ZUank1T1M4TERFNnU3Uko5UVZZNGZIbDNGZDV1NnFuV2NKdGpD?=
 =?utf-8?B?NlprWVJ6anhZUjlldUk3NDVXNmEyQkQ1dmJPd1BEcmd0N1YwTlF6VGJxeFN2?=
 =?utf-8?B?THlOYWRDUUY1eFIzUnVwNVBlUlV3NnB6TThXUjh3c0hLUzhlUDA4K1ppWXcz?=
 =?utf-8?B?aDF0d2JLWHN5OE5LVGRGN2QzUGFuOSt6akVvclo0bDZHcmFVOGdjTStUd0Vw?=
 =?utf-8?B?Z1JtSy8vS1N6ME1SREppUmpnT0ZzNHhka1Bhc21lM3E2QklwQWZDVENyd2FF?=
 =?utf-8?B?RDVWWVFGOGJOMHhZejdrb2hlc0tnTEhidGR4cmxNcXlhQytyUzFxdkVLRGov?=
 =?utf-8?B?aVdBeVBrL3VRT21QSG1mWkRWb0t5dlJsR2c4RmxsRVFGT3gwc2ozVytaTE1o?=
 =?utf-8?B?ZmdnckFlcTN6bjBMQnhzeVMrMi9SbmZtc2RYWll5U011Z01vL2tzeTNEcEFi?=
 =?utf-8?B?V2Z2aGVmZ2VPUlFWbVUybVlObzlkeGxoL3dXem44WndwTm82WEhPUkUyRmlN?=
 =?utf-8?B?RmZuSXZuNG5Sc2hNN1lMdFhOMGltVCtlWk9UUk5udXRHNFRjMXEzR0hoQk9U?=
 =?utf-8?B?OHZNbDRCTjc5MlljSEdSeVlJNWZsWlIxSXNzZGgyMEJ6ekIyVjZkS1JnT3k2?=
 =?utf-8?B?K1VnWDZsRk9wQUkrQjhvMkMwTmhpSHYwc3hJL2RuTFF4b1ZKQWR5a0dCT1Jt?=
 =?utf-8?B?WGNkc253R3lYL1hMbDhqNmpqeURHL1c3NlBvakMwZFdyeGtuVCtMR2tIeWJy?=
 =?utf-8?B?bjFCSFRNS3pkRElGRjZUb2ZJQlV0ZzA5UDgzQnVwWDZpaWxTMm9rMWtXZHQ4?=
 =?utf-8?B?WFowYkprV2lmdHA1TjhrZjFYL0xERjVGcDN3cmRSWXdmSkZ2VmpBTFZpczZR?=
 =?utf-8?B?NUFLSEFwNFEyclc0bGZiNTJpdC9kMVpmTXVKOGVpbEpJSWRwSnJjUldxUHBk?=
 =?utf-8?B?NDFMQlppdXFCVUxhK3VFYjgrWkpOVjhOYTQrc0RRODR0cWtqK2Vtdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b25d16-9d17-4bf9-e285-08de8472eb44
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:17:04.3663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dwnUPIXd1MdDcuHBJ+36FxJ32upJNUll3tq/967Ltc+xrh6Zz23/0dQM1sfgOl/FMQEzgl67UN8qS+eShFzDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7560

On 3/17/26 1:27 AM, Alexandre Courbot wrote:
> On Tue Mar 10, 2026 at 11:11 AM JST, John Hubbard wrote:
...
>> @@ -35,7 +44,10 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, E
>>              // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
>>              // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
>>              maxUserVa: (1 << 47) - 4096,
>> -            pciConfigMirrorBase: 0x088000,
>> +            pciConfigMirrorBase: match chipset.arch() {
>> +                Architecture::Turing | Architecture::Ampere | Architecture::Ada => 0x088000,
>> +                Architecture::Hopper | Architecture::Blackwell => 0x092000,
>> +            },
> 
> Can we document this in the code? I.e. is the new mirror space unavailable on chips < Hopper?

Yes, done.

Thanks for all of these review comments across the series. I have applied all
of them, and will post a v7 shortly on the very latest drm-rust-next.

thanks,
-- 
John Hubbard

