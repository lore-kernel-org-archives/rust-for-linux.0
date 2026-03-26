Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012065.outbound.protection.outlook.com [40.107.209.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050EF37996C;
	Thu, 26 Mar 2026 01:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488140; cv=fail; b=flfGkpvZHQuBdAci02xn+XOHTOSxfeKvVAoqYWwOLPA3yWzmjns8pJ81SQufSGELuZNHZFGjhL80vrxfPtoZQFvWsAGUVTnKR6nWzw1Kz8BooH1RyvrRf+EKfOII5rYEF6jwI/2iDh4snxo9QBLYqZa1sZmwFMf09cpenPY8zkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488140; c=relaxed/simple;
	bh=Mqa6FwZtZz0eP2uegWYecExTx1Wbq4ikjQhFkr66ST8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XOWQxlvuPZbE0LU8uMzXN9CT5nEzrWuVnogyZBh1AFM0feJrQxYnPtIhlR28vy5zK7Ih6qq/OFP67BPIf1ZKl9bZ7I/g9wcS/oreFLpXC3IHZDXohKOCQmJX432Na0cicRwlkvQP3WoHWdsb6sJIEcUv7RfaJHh4FzvuoOi1R3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MfCwQTst; arc=fail smtp.client-ip=40.107.209.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MfCwQTst"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1wvYqJsqnI8aHQMhgoSWgDUQAfINYs2t+If9DN7eJ4kfbyYWKEiKLi6/R9UYJULljFdhMte171aj+MHfp6WT4Ruv+c5nDcFiJsJpBeKd+9m19Ki9k2gzj2SWoUdW0MT31tCrJtE71gNQLbuAjQ88vgXXFZLgBfNRTFSZl/6SEDAht/DnN8KZ+REd77VkIv4XPmTP0/vOJSsREVkL339z+nSLaygH6QkyWnqp4VRTl4JQiSaKtkvDajdfZxq1iEmO3S/4kH6s5utekrKv3K56sL3fkDDKMnL/+7Bcv0Kwv+Wo7j0LvJkJF+qmiNvE26UpV3VzQ72veQIDPQYnLZGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h20kyf45mq3zvmtrxF2Pw1/awfMkHQvYAu1f1ynUQKI=;
 b=eTGiEVJh2dKrN7dgjJ9TOC0/1tD6cQ7SvMh7Yd4zw5mVKPXnOG0bi6iiaFKjYiZy7pHvZsfna/NHkFejXaTrJ0L79HqT3zYk1X20mTbaNwMB24wZ6EKhzO/BQKyltRrg7slWQJTCsrn1FQqkaiGlzu4kpBsewQJ3sEyPm/Q6GXPqQq4nGKGUwgynM4FqqJi+nxEUJMWFo1uzDckFJosoEhd65b0yIxtQAiNIAEyRQ2kkYo/twLAros0IOYWpblJP/KzvftLa6oT8wBWwp5H7CFvC7k5RIIUj0MHyYI2L+Nh3f9lheibSaJ03M56rx9O9lI1fcPvdDnjpLT/USLe51w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h20kyf45mq3zvmtrxF2Pw1/awfMkHQvYAu1f1ynUQKI=;
 b=MfCwQTstJeBx65E47kngP7axAhXK3dEZNevFk5N23U99r0Zzc1DCH60cS1k2U5NWTUG7RW1JKlJM7jGs3JzS4VWaCFjchIf+7TkSeVsDQp2MgTn1HElparsFoMgejJxzxKdPOHlcR/+9vBUza9CtHWjsYzAb2g+R7GOHvNUpgNue+Dg+WNZFgY9k0HTKzjkCwdOZuZoywpA9Wg/nLzsN93GZuzVe7+zoJLvrLQIZ9wVAZIjN2zFfLFkRnHf9rWZtG/4xerHNwKkh2kUkX4E3zMWWsKG/JIMgpXAZzXmYPjECcZ5SL11adRTRl0kIsEACZP7YAe/a9dmgKWDPZKUvww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB8354.namprd12.prod.outlook.com (2603:10b6:610:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 01:22:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:22:13 +0000
Message-ID: <31a279f3-5832-45c7-ada5-0875c6a7fce2@nvidia.com>
Date: Wed, 25 Mar 2026 18:22:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/31] gpu: nova-core: set DMA mask width based on GPU
 architecture
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
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-6-jhubbard@nvidia.com>
 <177443602196.105362.15426109878373353153.b4-review@b4>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <177443602196.105362.15426109878373353153.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 57bfbb58-0216-43b9-5b97-08de8ad61bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	q7RUmbxPOcyrayTKfS6t+0NSzwQ0t8MJoITClpr/RBvyrDlX6qWxGoQF/cNyQ1HSnXwupWZd2FVA+guc9ib8aZzdgy+g4qPc2J8tV/n7mVx9PLAWGt5CRC1221szF8b5dZgrLm58MQndEIzj+Ap2YphUH6JIAH5MdINvDO5k5OVKtJ2Qx/6tspz5pxUVGLLDfC338u2LRDHReOPFCkmVsNJMBNbmkWMsH0h4quSLtQAFxII5Ql9nDZHAcKHiWPXfvHIJmMTHCRwWpOWkVwnezP2Asrd4xSW3CDCdKZWC9jcRoXPRzqWfw7FvR8L+OLG+5Onk8DNHZ9Zfe+tNPj9LKsq+L0pjyfZbBwvLtNebBql4zTMfWZ4PIJfOZhB3L1z44FlC2t/OPZJw/fgqKDk7TQb2OIHYSC+uEC6nrx0bLH1lSvjTZW9qwk1DdoAsUJipd1RalnkNZrkinkmsUOmOR4wdgmILoea/QZPeVHUjZhvuoa+HnqHq+VDsY0OAHM6iD64HZa5KCFqUTJWe4oqGFCUWizNHQvw9t0GIcbbC39PmA8FmlexAsBE3YtdQlyvmq12QtpvQBkgKUvmYBUS3EBa5en0MDoYJuTy1RU6Kdv9e+IBkHiXZZlQ8eES8TJ7afYl36ulpXFlkUE60dCha97a8er1y7MO7lhXY819UYI7MCbmfMKi1Ia0a1GeCDpnwVRhzTPiVEyY5SJcYCs84x77Sxn7/XoT3SEuexaFwywQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWpuS1FKSlIzYndqYUJHNlllYjYzM0x2NWV1ODJiL0lKNEhiUkE2SjVXS1V4?=
 =?utf-8?B?cmxpQWUybVUvUGcyQ0ljN2tIODIrZzlrZlZ0NVNWcXhWL0c1Y1ZjMFpoRUJ0?=
 =?utf-8?B?a2lhWEtJTk9aV3lKTUxkb2hIWk5aSkswUGFiMHlDYWU4TmE1VWt0bmtHTG5E?=
 =?utf-8?B?YzZ3SXg4eXJhdzNPTDNPdVN4MUp2MDE0dWN4UFVhdjJGK0lmVmRtL2liZExE?=
 =?utf-8?B?UjRFZmRsenptdk9zVzh5RW8rSk8yUW1qNEtQOGlBREI4Z3BFbDhqSU13VTRt?=
 =?utf-8?B?L0loeXlmeWhaTnVkYjVrSTlFMVNGTCtOZVlaYkhCUTZyTkZrT0tPV1dWK29N?=
 =?utf-8?B?eXpZdFFmNlhzN3dpRGZSNlh4L2Y1UXhvQXJTdjAzb1RBRkp1eUFSV0I4UDZz?=
 =?utf-8?B?R24wS2pXSVhnd3FMbDdyYlp3MWxkWXRwclBQOE83OU5QTEEyVzFCdkpIUW9Z?=
 =?utf-8?B?ZjdsdmdFL3JHbmZ3UXRmbVlmdllkN25YNzF6MnduQ0IrUHNnMzhKRklZR0Zj?=
 =?utf-8?B?aGhnS254Y1FRcEhUMzVoUXV3anBkVS9tY2RRTG14ZC92N3JXMmQ2ZDJsbTht?=
 =?utf-8?B?OVhubWxSL0VBS21PZlBZVlhxY09nQ25XdEVCRUI0RXZ5cUJ4T1VEeWFPTXlp?=
 =?utf-8?B?QWt3bGd5MCtNdTRqNkFvTCszRnNlaUczUnlZRnB5Q25lenVyMUJ3YXZFMUJ0?=
 =?utf-8?B?c1huYy9zSGtFT0kxeVNaQjhDOEppSHltVVhLY1MxaUpjS3dyUC9yT0NBR0VJ?=
 =?utf-8?B?TnpYWXZBWnJMQjNMNUxDR0lIUklOUFVLV1RlSnFRaENrdmU1QkhybXplSURo?=
 =?utf-8?B?S0xLK3R5bllEdnhSQVJjaVU3ZDFvejJSNWtPTEJXaXUxcmRRRlBZWnhoL1dq?=
 =?utf-8?B?ZTVIUVJtQXNEbFVZVTdIVytTb0hmamh5VU5aa0pVN05HVFF0RU1tQXp4ZCtZ?=
 =?utf-8?B?aGdjUkFFR3crYzdWaWs1YTdwdkg2UmRYU2ptZFhnN0oyWE5FVEh2MnlJcCti?=
 =?utf-8?B?b0xRcnM3ZUpodGIybHFMRXlock1iVzdkMVBHQkRqa0djSEpQVDMxdGh2TTRv?=
 =?utf-8?B?T3B1bUplOUhEMWhKd2lKTlRJZ1dIMko3ZHl1YW1JQ0tpTnNtajRLUVFNbFhP?=
 =?utf-8?B?L1ZrK1dPbC9UbU9BT0hyTm1ZYVdQTzFJMlhyRmN4dnA2SUlYRUJUcU9tZWxI?=
 =?utf-8?B?ZE1va1h2K2taU1JicEpUMlFsOUdGUHNFeUhoY0wzOEYvV0FhcnhIU1loU0tx?=
 =?utf-8?B?cndhZnpvMXdaaldpK1dUY3hnY3pTbkF1MDRJbDJlcnpkMDZROVIxMFpWL2cx?=
 =?utf-8?B?Ny9Cd052WmNicGw4d0dPcmZtUTFOUis0Z2wzYTRHK3FLemdHS0VqWk5iRHZu?=
 =?utf-8?B?TWYrT2UrTlh2UjZTYTB1MEFjWkkrbCtWYmhjeVVmdFJoWklEZ0tHZHlzV3Zj?=
 =?utf-8?B?cWVIN00zZHNqdE5VYk1TVStkQ1lCOEhNbkI3ekY1VHcxN1lDUWRqRk5TaEYw?=
 =?utf-8?B?TS9UcmhYRVdCMVpQdlh1S2dtbU1CaW9LcGFaazZFUm1TZUdMOXp5L3BSeUgy?=
 =?utf-8?B?Rm5yYWorcXQvTkhNZkJubUdQUWxjOVAxMWF6a1Nwa0lBRnlzNjh5akZvNyt1?=
 =?utf-8?B?NzlkRVdWNWlkV3U5c0llS1RHOStvdDd6SHllOWFMNWkvYzBXdmhreEZ3Vm5W?=
 =?utf-8?B?TWhDS0R6NUdxWnB2MEhlbVRWZk9Sc09UNHhRUllNaHpJR1RoNlVGSHl2YVBO?=
 =?utf-8?B?Y0xtZUFsOXh2eHpkb2RPOHJJZGxRY2txSVJINzJPMklFNGhzcTBIMWg0RG5W?=
 =?utf-8?B?azdFWjFYOGZJY3YwU2tvNHlDTUhnNHZiRlFlTzhqbDlqb1RxS0tZMDBWZ2RM?=
 =?utf-8?B?dm12VEVJbTl2eGdtVEZwM0IxaHMxcjhpOHJyNEZVajdtVEVBaFFSbkN4bEZZ?=
 =?utf-8?B?YkxCUFE4dm5kYTFvdDY1OGJPSDc5Lzh4YVBMWTJCZjFVdWVTOUhXV3hlTSs5?=
 =?utf-8?B?OFUrdDg2VXdjOUNXQkEvVUVydllkVkkrSUFXb1A3dGZOM1dicmJ3VmZ1NGVs?=
 =?utf-8?B?eFVwaWxoM0JJVm42U1A4MWYrVDV3QzB3c3plcnl0ZnNoYnpqb0I1eEZiRjNw?=
 =?utf-8?B?cmxXMiswSlQ0ekZRcm9ndDBlZ0x4M0RGZURtN09sUTlYc2RuN3M3TFN6d0F6?=
 =?utf-8?B?Yy9SbnJxK293SzljZTk3U3M3YWp2THBTM05VMEZZSFJrakowWHk0eW5SMnFE?=
 =?utf-8?B?OU5BTlVxS21JS2ZENjIybXZESjA5NFNodnU4K2ppNFBtZWlyY3I3UnRYQzZt?=
 =?utf-8?B?d1g5QXlqK1pWdlJtUXVWNUYrZFBtN0J6Q2ptTVBaU0hUZ2NVWGMvQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57bfbb58-0216-43b9-5b97-08de8ad61bbf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:22:12.8113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89DznQ0extxtBpo4l8rm9gGb3tbE0SAlWKB6q10RTUvPOQzsuS0aU4+ouXqTSJY7CS2C1o5V27lO3CCsxmuEHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8354

On 3/25/26 3:53 AM, Alexandre Courbot wrote:
> On Tue, 24 Mar 2026 20:52:16 -0700, John Hubbard <jhubbard@nvidia.com> wrote:
>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
>> index 84b0e1703150..41227d29934e 100644
>> --- a/drivers/gpu/nova-core/driver.rs
>> +++ b/drivers/gpu/nova-core/driver.rs
>> @@ -84,18 +78,20 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
>> [ ... skip 13 lines ... ]
>> +            dev_info!(pdev, "NVIDIA ({})\n", spec);
>> +
>> +            // SAFETY: No concurrent DMA allocations or mappings can be made because
>> +            // the device is still being probed and therefore isn't being used by
>> +            // other threads of execution.
>> +            unsafe { pdev.dma_set_mask_and_coherent(spec.chipset().arch().dma_mask())? };
> 
> To limit the unsafe block to unsafe operations, we should store the DMA
> mask into a local variable.

Done, thanks.

> 
>>
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 3cd7709883be..e7c3860cfb28 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -162,6 +163,16 @@ pub(crate) enum Architecture {
>>      Blackwell = 0x1b,
>>  }
>>  
>> +impl Architecture {
>> +    /// Returns the DMA mask supported by this architecture.
>> +    pub(crate) const fn dma_mask(&self) -> DmaMask {
>> +        match self {
>> +            Self::Turing | Self::Ampere | Self::Ada => DmaMask::new::<47>(),
>> +            Self::Hopper | Self::Blackwell => DmaMask::new::<52>(),
>> +        }
>> +    }
>> +}
> 
> Eventually we may want to move this to the `Gpu` HAL, but let's do that
> as a follow-up patch if we find it is relevant (which I am not sure
> about yet).

Ack. 

> 
>> @@ -295,32 +306,32 @@ pub(crate) fn new<'a>(
>>          pdev: &'a pci::Device<device::Bound>,
>>          devres_bar: Arc<Devres<Bar0>>,
>>          bar: &'a Bar0,
>> +        spec: Spec,
>>      ) -> impl PinInit<Self, Error> + 'a {
>> -        try_pin_init!(Self {
>> -            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
>> -                dev_info!(pdev, "NVIDIA ({})\n", spec);
>> -            })?,
>> +        let chipset = spec.chipset();
> 
> `spec` is now `Copy`, so we don't need this local variable anymore.
> Removing it and accessing `spec.chipset` directly simplifies the
> remainder of the diff.
> 

Fixed, thanks.

thanks,
-- 
John Hubbard

