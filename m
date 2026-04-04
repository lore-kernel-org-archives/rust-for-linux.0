Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B402C21E8;
	Sat,  4 Apr 2026 06:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775283280; cv=fail; b=dYKPjA1PAKsRBSqm8qH1yyEAgRxoLfVs6X3NfP+GYe8LT8vX8HcFzmD3gv7Tlr9IdaZIHfs1ulQdq1Mcz3VoojIfPumWidI2sxQaufn6Bx/6nDHPfumL3SyqSHNL23evlU6xsLzoFSaC2MGI7+2UFDUZ+XbhoKpc+HdI6F6hdRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775283280; c=relaxed/simple;
	bh=Eu881hQgdtwOXOf0gPHPrtFNnaTRdYcMTqkYmd/XDeQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aSmeiHkPrLEvbbFi+ExTafPkT2g9LbqMJ3UAGcbNIFZ8pWQVquGT7m8PuCfGFJat4Mlj01CdPqeU05o7YaEs3bKDjvNJ6fbcmnxItPAs5P99Ptz9OXxIQYuzbxR85+03AOf0/lC0jReWPr+yUz7MjTgnyKYmSsMTOfvgG7B4Dlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U6zeP3e/; arc=fail smtp.client-ip=40.107.208.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U6zeP3e/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRCAsPTlj3akikECdX9Gziu9M5aHyOHb1rGP60ku1a//r+IajGXhinRBqTvpauj0gUJlRvrIODxqGl8rAwbQH0VPqjS8Fypuu5lOmkCN4wKHiLh4gSMNBW2el9CBsB9UAa/hK2IxnjpsX62ppiBGO0T4okXF51n1aKgnUZdVCZiYlXUjOnCyEG/tCUKNH91gAOsvbWQ8TUywMr0D4YBtofm1uoyDlX3aIW1y73pOAYbb23Qi+cjyNezY1xOKhnnU9ehFa4o51IBFbakyVreqvwpFJOG9pxg6o6UvZTyWPeBYNV6BUFFZREkb4E+btiL0ktTCeKV2EzULhjHFzTDBag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPJBTDmcD01UhDgXEQM+nNUC9uvCe11gJPnmtfrL0wE=;
 b=jAJyWiDhBNZKkugu2N4ruQgs7+CBbJvg6oQl3aP7uDOERKIklDtpDwa9iSLd2kX5xQRmwBbnMdz1XnxVoWMZwdJQxtblJHwwIdmnev+wG5PJaCOd2aRChtgUmA877jfT/nLmIu48vH/hyHGJ6KRW88F5ebwsAwsQXladkc06hEgpuW8N+gtWRYMCFpdZE4npTz/uWXjr3fysxoe1J615UiTgKeTCVK1bikcESpTv4jR2C7rXj172J4is7xfFYqStUu4G3fPWMJ7X9eWbMjKY2lxgwjbBDLrRCxbVqBOTYbZv3UpVLNGGpZ2pLWJTWB3R5iuSv5xOXjhy85yRSW4jbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPJBTDmcD01UhDgXEQM+nNUC9uvCe11gJPnmtfrL0wE=;
 b=U6zeP3e/Os2ha557LlnXzvA2zyr331gcGnBHthQj8FYcHNb0d0uZ8wMgHiySeKmBhNF2TPR7l/9pHiI6AfJy0ytr8naKlef5OOAt6kahbWwwBT18irNrWoSKBYzhAndwpWBbRRW7Jqmg2ItGrjp2CpOH3thkQMypqEWuKeBR/PZfK5U9AG+ag7YPxTdXAoBV2XIijGgm8dTsfOMgNhlsHa6aTfEcWKR5Z5ppAjv9oOzhl0nJLO65tmlzzCayCcQSQTP0ImqZB4TtJWbC1nnJNzxufcYKNbXx2mdjRK+h24iV2nV2n2wPUKHr4AdM3AVcB+zECydr76c40Af72ZJJnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6886.namprd12.prod.outlook.com (2603:10b6:806:262::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Sat, 4 Apr 2026 06:14:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 06:14:33 +0000
Message-ID: <c23f9b20-5ef8-4952-ad80-265edc2874e5@nvidia.com>
Date: Fri, 3 Apr 2026 23:14:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: fix three clippy::precedence warnings
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
References: <20260404025821.386514-1-jhubbard@nvidia.com>
 <DHK4RWSLBFFK.2UL1M00W89TNL@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHK4RWSLBFFK.2UL1M00W89TNL@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 0251ab72-a204-4098-e87c-08de92117095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3t1MxMGyHocLu0nDGj0jsl3Y23N5xjY7pGgZ4FPxwDFX4ExKivwaZZscpWVJiXjedtlIivIdkxikEkUe+kMqKLdAdJIDT84MmTRMhuD3PntXKELWezbiCIJuMO3x5p9AurEhBlQ1GQlhfUmV7jVmTypGhUtF21jByPhtfKM1Il1LsiS736kBsQtlQ0GOOQrDheq7O4dKHrsyqP08F8P+yt+i812zqq48SdpOkYYqTc6i1tp/QTAwm1K2aymkFbx4AsJuvMi0bfy9ZNqkRl0H8GGgut9Ygw3MD8MPWbP1XVwF+dI2E1liHCOxwtigLTPvMfx1FwsbKdSMxs0weJ4L8+95pRRSMuOYE19FCSQTWNVkjF7UTokXLzXbUibHDbdAqmP9gfZx0WYEWs3lIvZMbje5VqM1QOfP9seCaI5YPFsL7afG1u/H3LtTZ5geS7enafg+vlYm/zpXpe7bB9a2mRJ46ArXbsNspEp1LXO3DLaJxT/uDXyWkpUeq9lb2bsxJ3b1qmhcopRzOByQMhNwkbgjsEbMuMz8va3+EbLKBqP96MjcyWyQCNzS50UMsCG2BdHhhWmzJY2yfhabL0DqAmVkZgSCNsG7SunMuijPi+9yhiIPvBXlxA5PwMAs+Yi1H+Hz43P/21PqnYOR1Smmdma4ySn9NwW+h7qCPmq9W+5jZt2p7FqF1TwifuOGE7SAhXEiNYa+2Zr4LO0absW42AyGlrsfnYXoLv0MiTM9WzM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTRkL3JVU1l1Y0p3T2RldnZxeDI0K2NkaFFFR0NJdk5NakZLRmlQWDh4aE8r?=
 =?utf-8?B?R0dlYVVmK0hOT0hSMlBlcmZMZFJqd3lkWDR4RUZKc0pHaHR0c2wxT1NrN0RO?=
 =?utf-8?B?SUx1VUwvQi93a1h1TktSOThrTUIxQnBkL0pUOVlMdmZ3RHJpbWNGcDlXY3RJ?=
 =?utf-8?B?ZXpONVZMU0xYcHFrTWl6aTFDejFCbG9BWCt6REhpTXpsbmtwbGp2eXFrbEZD?=
 =?utf-8?B?ZkFscUczREVoNU9OdEd1YkEvZFJqcFc0NTJUOHFDRjBMbjB2YnI2MlJYMlg1?=
 =?utf-8?B?M0Zkd1VXcmYzZFpXU2ZVV0VCdldBdTdia3E1NGVpREJOSHFJL2k0NG9hY2ZP?=
 =?utf-8?B?WjdpTllLUGFGNVlDNjRsNGJxZWlpNEVmQzc0ODY3ckxXYld2d2tFUHFMSWpM?=
 =?utf-8?B?N1dHck4xT1ZKcWZrcTVIQk04ZzBaN3dwM2REUmRtOHBuVGNXRWlYNzVLTEdF?=
 =?utf-8?B?Ui9WcHk0WUsya3gvWEtZdU4xWDJTOFFkUG80SW9vNzkwTXdJbzY0cVhYMGdk?=
 =?utf-8?B?bGJ3b0dYL1QwVTUzUXlBbEN4bk1pcGwxNkVzOGg3VTNRTEM0Z29YaHBiZzJz?=
 =?utf-8?B?RVZaQVJnTmpLa3ZEWS9yVUE0bmVrbG1iUXRQdzcxOWJDZWt5ZkhBTUx5R3dR?=
 =?utf-8?B?THdqOFpoN2tURFdKQW1LWU0vc2RtTWZpcUFQYkx2MGRvK3RGOXJ5dzEwem5M?=
 =?utf-8?B?U3o1OU5PUStYUGZhWFFVUzZFSDhNbHBnb3FUdDFMeVRxVG9CTHZtK0lVOXdh?=
 =?utf-8?B?OVdNakZWalhxQXRXTEZIU0lsL3NpRkkyZDNOcU9EakFCNXlJVEJ2c3BNRDVK?=
 =?utf-8?B?QWpIaG1yUDhvM0luaFVwY2VEUWIwditMbEdzMmJ1ZjRzTTZoc2plNGdsOE42?=
 =?utf-8?B?SEs2c3BqRVN6RzRmVjNWK2pzQ1RZUThZeHREUmdlNUVEYnFhTHlNRFh2emcw?=
 =?utf-8?B?Q09hVkJoZWV1bzJtRGEyZE1aR2h5OFVWc1hhVURZczQweTJCVlJuekVjT3BE?=
 =?utf-8?B?SjZBYW95NXlZK0cxaklrdkJ4S3dHclAxdVpXdm9SdG9nODFBT3RrVDI2OWF0?=
 =?utf-8?B?SFo0Y0EzanFDZHdEcm83SGNsbGFNQzV6ZnRnQ21KMGpqUnM0dENGRzlUNnVY?=
 =?utf-8?B?N3dNSmpYZGxxY3pPTmVFYnk5RCs0THMrMlRtaWJlZ05iNDFnS3lIK2F6R3NY?=
 =?utf-8?B?WklFKzNnTURkOVJHQVhCZVZKZktUWDZkMDRQQlVwdUZPVGdZQWI0ZkdpS2Ur?=
 =?utf-8?B?dE5iQ1M1UFR4NUo4bE1iSGxVd24vcHZZK25VNUgvVGJDa21SSERzUlJrNE9W?=
 =?utf-8?B?dkl0Z0IraUxJSXBLOUpicjltZi9yc29EMDRFVTBuR3JjUzNFVm4rVmtTeHVn?=
 =?utf-8?B?UUdCRmpTN0VUYVorZGpDZWs2T2lkTWIxNlVBU3laMVdiSTNDM092WThpZDg3?=
 =?utf-8?B?M2czRnUyN3d4SFFqUk5oMjFFUzZnYXJwNXlCczcwbncvMFlhQ1NoYkFUeUNB?=
 =?utf-8?B?NWxpbGlWQVJYdnkwVUx0VXVhcSszSmg5TTMyVnFVNXZmQzYxZGwwVUhaS2dT?=
 =?utf-8?B?am1Ucm51azJraXU3Uk1nRGlGYm9XbzlhcnRTbm1uSEtvRkVWT3FFZGxlT0FW?=
 =?utf-8?B?VDhQbUFSQlJFbTh5R0hqR2R6TFVkeGRmRW1waC9tYWcrUVM0cFVhdkFsRTEv?=
 =?utf-8?B?d0VHWS9ISHBtdDdrTlkyU1RNNXRWZllWNmFWNzJaeW45WjU0K21lUXdtdC9U?=
 =?utf-8?B?WUpQYmpCSEFjODFMejJ2VmNtcVdLWGVwdGs1NVd1bGdYb3ZTa3FBbDJ2UDFS?=
 =?utf-8?B?MEd1WitUQUF5dVJETUJ5SG9UYk85VCtGRCtvS0c2R0l4RUI3NGtnaDZSZk9i?=
 =?utf-8?B?YkdnQTJsVnpxWDkreTNLWVNkbXlZR3RyL01STndBUEdiVlJiVkUvSHcvSzBL?=
 =?utf-8?B?NjdaR3cyZHgzMmk2d3JxZHJVVzhXNlNHS1o3RkZUS3NreTdnZnhObVgwRGFo?=
 =?utf-8?B?OHlCNG9tWi9hRExWL0pMWWVOdUhkdExUWlZmaDZaaXBaaHoxWS9BRkRZWEkz?=
 =?utf-8?B?VE00Tk14c0FSMytybFRrOE5JQmc1RHJvVTVSRVVsdWFCN3FBN3cva1E1OVQ4?=
 =?utf-8?B?a09SYW1tajlaM1A2TVkwZ1psR3J0ZG5JN3J3eEpPcmYxcUdlcHV4dHYzT2Zx?=
 =?utf-8?B?Z2VnQmNwbnc2NUpTQXZZVWF3cjRxV0Y5V1pUMUR5bm9mRXRkWWgzbDFRckZ2?=
 =?utf-8?B?TG8xTTFCc1pqZGJja1JIcXZ5QjFTaWJVOGg2OFByeVlVcWdPUUErSkpaS0hn?=
 =?utf-8?B?NTFiUDVjeUtlQlQ0bU11MWZ1dnpvMUxqNytnWTF1NGZqekJkVjJZRTVvZEtI?=
 =?utf-8?Q?XN0vGMimyPTTCecY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0251ab72-a204-4098-e87c-08de92117095
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 06:14:33.6206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +v6JXtbX4HfAUlD4SKznHl/yA9ceNwrcJbXzOLgcBBRnIrCLvm0UeofJmJhyHzqzTFEKrq3Ib6xbEqTPlHwhxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6886

On 4/3/26 10:45 PM, Alexandre Courbot wrote:
> On Sat Apr 4, 2026 at 11:58 AM JST, John Hubbard wrote:
>> Clippy warns when shifts and bitwise-OR are mixed without parentheses,
>> because the relative precedence of << and | is easy to misread. This was
>> causing 3 warnings in drm-rust-next.
> 
> These don't manifest for me (rustc 1.94.1), can you share more about the
> build context?

rustc 1.85.0

> 
>>
>> For read_sysmem_flush_page_ga100(), add explicit parentheses.
>>
>> For the PCI ROM header parsing, replace the manual byte-shifting with
>> u32::from_le_bytes(), which both fixes the warning and is clearer about
>> the intended byte order.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>   drivers/gpu/nova-core/fb/hal/ga100.rs | 7 ++++---
>>   drivers/gpu/nova-core/vbios.rs        | 7 +------
>>   2 files changed, 5 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
>> index 1c03783cddef..b5d0f04198f0 100644
>> --- a/drivers/gpu/nova-core/fb/hal/ga100.rs
>> +++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
>> @@ -17,9 +17,10 @@
>>   struct Ga100;
>>   
>>   pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
>> -    u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
>> -        | u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI).adr_63_40())
>> -            << FLUSH_SYSMEM_ADDR_SHIFT_HI
>> +    (u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR).adr_39_08())
>> +        << FLUSH_SYSMEM_ADDR_SHIFT)
>> +        | (u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI).adr_63_40())
>> +            << FLUSH_SYSMEM_ADDR_SHIFT_HI)
>>   }
>>   
>>   pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
>> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
>> index 3e3fa5b72524..ebda28e596c5 100644
>> --- a/drivers/gpu/nova-core/vbios.rs
>> +++ b/drivers/gpu/nova-core/vbios.rs
>> @@ -507,12 +507,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
>>   
>>           if data.len() >= 30 {
>>               // Read size_of_block at offset 0x1A.
>> -            size_of_block = Some(
>> -                u32::from(data[29]) << 24
>> -                    | u32::from(data[28]) << 16
>> -                    | u32::from(data[27]) << 8
>> -                    | u32::from(data[26]),
>> -            );
>> +            size_of_block = Some(u32::from_le_bytes([data[26], data[27], data[28], data[29]]));
> 
> This chunk looks like it should be its own patch as it is valuable
> regardless of the clippy warnings.

OK.

thanks,
-- 
John Hubbard

