Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013044.outbound.protection.outlook.com [40.93.196.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DB83E1683;
	Mon,  1 Jun 2026 18:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337790; cv=fail; b=gyHZ8MIWDabb9L+ey5LOBtlQZuvwUN6WM86IIOjc04rC8IjLawQgDnqxXtbCf9WGmlRuekNh57thlOgA6lWPl5xYW6EA4QW60ZPyzopIhQ8r2yKLUqjmilBGWUzFTY0eO7OQUo4/ypTiKIFDrH9jQfdfC/6gqy1yteHdr3MVuG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337790; c=relaxed/simple;
	bh=+1Z45cjQdk7lEyBfdZne5OZ8Vy/coX80/9mWW7ITIWQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P7h2Otqubi3TBi7OZC44xVz3ej4UyL/wcPD8VyeMrYhgi/ZnjziArf5lZx2RhGgY7DLuChlr42E1NdYMjQPdia07pKl0xaFDLE970UlHJBRkfClNNyfiqazvfX4ZiDVXPZWR0gtsBaVqK6RBp6iIJJqELrwyh6BqFifojhfXVGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HBX4xkKX; arc=fail smtp.client-ip=40.93.196.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HBX4xkKX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBnvgUxeQ1Uwg7CzHDa6TRmma3Trrx+yDSlP/LDl7+gMaOJX+6q1t14PrrfoZSkoNyfqEAoRnNKMY97Nq2QEJ1+EfyGlhqjQ0LJoc6Nz7AXC+M/Vo/qhJ9+KI3znK1CAaKxuux5C5HTD67tdTpB4NLrSTggUXX5tBqjv6zS9ch2P8c5wIwHvlvLWWZLukqmMlmO/7Wy67aEsZBy0MBYr7QTuUxlXlMaQS3/GVpwQeO6FMrYoSxaEUgl0mfGOOfphHG55vxcZEyNgyxbJTuNevZBVclF50NZO6D6DqXIB1nWb7Q0SHm7NOCLEfvJsT+s4ggcM4AfrBS0X1+F2X90sVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+CHaFhxipjuvl0mquYdJBoJXBLv6FjOyGB1fpX6GnQ=;
 b=o9hsK0N5sDADYnkUrRxaAYuNwJwU1mBOX9JQxskB1m4FeWdhNq5H+y56mVoPl4/5grbmIzcSsWv4uo0tzAbeSt4NMMINeUurmsda6B5VWo2L8Q39zHffZcweDFJSeTniPlqc5BmcV+gBf7hInMJ7oFjWg7On/IrIt+bnA5Gq8e4lJHZxcTgba99A81Bd9dOCzR9NTKmJzR0MPnobTxM0MldLgvPU4p3wvuSVRy4mJUMxcj7AEgSmAPCBIjVaRLXV0HoCiuNFdCLHsN1QGYrIp39o2ecQRtVFpbpcONRY6tzejwClKvD+kWBw7wNltjITux7cZ1pWtcFuDUAg7SnfKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+CHaFhxipjuvl0mquYdJBoJXBLv6FjOyGB1fpX6GnQ=;
 b=HBX4xkKXKZwJY11ahAhOn04FFfS/pbJjWUEGZ/mptS+I01P+s6aqhZOI0MGI820REhhhJjMZxKNhCixbU1p2N1sW3x2oWn9N7ZocKV8/8wJEbhVJcU+8MCbmSZQYwn5p0sVpexC8JxraaqQ1JDTNufabzwpbjMXlol8/HL2sqRLg1RLyn0EGmfmoZigEP4ZP2weSXAhfkE9ZMVWBq/NWVmZKTURug0981bDVmQCJwjpLQu4EvJKqXovUVeXWS1Ofx5wZtJFiSTjbPw5RZdLasN/4w+iBnFtqLKVQsT3ADb5rOYo1eJUAJz7N5mvbwqX5jA59OK/S+/oUQYtCE83Kvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB999088.namprd12.prod.outlook.com (2603:10b6:510:38d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 18:16:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:16:21 +0000
Message-ID: <b70415d9-2a87-41e7-bb1d-b24389717d05@nvidia.com>
Date: Mon, 1 Jun 2026 11:16:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 06/22] gpu: nova-core: Blackwell: use correct sysmem
 flush registers
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
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-7-jhubbard@nvidia.com>
 <DIXIPYPTGD6E.2U1DJ6SDQJVV5@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DIXIPYPTGD6E.2U1DJ6SDQJVV5@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB999088:EE_
X-MS-Office365-Filtering-Correlation-Id: 0977a920-24fe-4479-f2bc-08dec009e1d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	cpdRhnL+ESVOOG7SuOdFmPqDHUQSqFnBVsxkPsrz9qXK70Dzy4lwOuj4RuhqiTKZaLfRLvA1ICtnLozg6OddhlCEJgRdFo7RQrQOwqc2H3z17ouqD/GzDMdu6MD4Y86ozPJdUSgwBbOHJ5zM6rqASQFWqME98f0M1JToevk0CS+aFuwtoVdgB/SAiHY5lM05KP+W3A8B5Wm4/9+rK4lkisaIbnlxdjFBWrHQTvJaIalN7yP1G+9PKt6hpWh0bOlDAUlM+Xrm3t3KIZZjJOxu0N2xKovah3RfYEOwHh1sCr00aD6qRN6fSuFXRqPrw54aJQK4HY6cNSQ3xAmMNDPHxNEbBL+5gqGunzNYF2OugACPUGaCMBE7S1rEmB+84D7r/6aPTJbv95Rt8wFch9stVr/Aib06kwt9wXn6DzFchcnEqwVyXBvgRFIEYjrYMXFiYWLJjR7MasDaE88Gob08COnDRzVZxnE7R7bucs7EktCnDRtwyNCtpzh8c9Oej8skPXVseBVWzyTWmOfK0hBFgU9QRvBPjDgnyIhujyKzUMM0hxSXSltbA/4sQEL5MxSsKQP/7tzpHPgTJ+h6F0dOH+lI0oc6BrRU/6HL1UM/IdRkKjamgm8E9XWYntV88FdmS70xfe85+2UrhA5V8Fv5WFnO7bF/RwSCRWB71BXkpKc1DV3DXJXzUsh4r+Iz4JtzF6JJoMC82Q53jxF5DdkA1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWMrM25WNXNmejFFV003SHBVc2I4TFJNcUl4NlVVdGI3cCtjTkdPcDcrYnI3?=
 =?utf-8?B?VWhDcDNMNEUrbDdzQjhVenQ3U1hTTW4vdXRGWk14NWZjVzZyZWNqUW9Xc1Nv?=
 =?utf-8?B?aGFtUUMvODUyK1lLRjVzWVo2OFJReHNEaEpoVFZkd2xtMkFMOGxWMTM5b3BO?=
 =?utf-8?B?RWNONE5HcVl3UGFwUVdGbmRGem9oSVJCUU1ndnFXblVVejVYZll6Q3VQUzA4?=
 =?utf-8?B?SW1MWkk3K2FtUkNtajZnalgxM0p6Qm0wakhuOU01dEEzRk1SSlVLTFFJMSth?=
 =?utf-8?B?cVM1NUNKMzRqMFkrNXZpS3VCdHkwYm9iWUtQRmQyNkpTT3RMbDdocGZxU2dE?=
 =?utf-8?B?bVhZU0FZYVh1VmZ3UHhsTDlMNmthUUJYbWxzK1dKZnRoT2c2MTdRcWt3UUI4?=
 =?utf-8?B?OElha2dxcGJkZnBSWEZOTHdMZ1dqZ2lyWWlLTU5pZlp2eUwxeEVJR0lVUGRP?=
 =?utf-8?B?UWNuZ3lFemd0bUZJbG1ubk1DNDFHdXBuSEx5TlVkZWIvOEJuUHQ2RFViOEdF?=
 =?utf-8?B?TlZsZkxJZHVEb2VSZUpsa0NxbVpGOE54NWxCUGk2bTNTRmVhZFppZ3IybDA5?=
 =?utf-8?B?NGR2a3VkRTlzOTFLUnhuTUhKN2JzQm12MGs5bndhaWk3SEYzUDRzR2hqcjVQ?=
 =?utf-8?B?U0tOLzJDc1d4ay9oZGo4RVYwY1g3NzJGVFBhNGtOT1dvTnI0UEIwOC9uMWpt?=
 =?utf-8?B?d2cwM3VOZ283b056Wnd6UVRDZit1Z3VqOUVlVEswL0ZwRjF4cGc3YWROekJl?=
 =?utf-8?B?aVo0ZUJRMGJwM1oyL0R1S056MGt4Sktpc3V3dm96RVNWVW1tVkxrTzcxUGk1?=
 =?utf-8?B?Sy9FMU9scXhnZG1NMk5Jc2ZBZzlWMFk2bU5pSEZGWUZLNVNZMnpOd0kzcENw?=
 =?utf-8?B?cTN3V1R6amR3cXk0Z1lPMWdHZ0FHOHFzY1J5RmZONGdUSFlzQUVLTUc5Tm9z?=
 =?utf-8?B?WGRYNVMvem9LU2h5MTJMcEUxZkxiRm5NVzg2VkZwVG1pNW1Jd1cyZXRreGpt?=
 =?utf-8?B?ZnAwRHloWUpkNFdsdU4zTmRFT3QrQXdYMThiRTRzK01ScC95Rk8rSzZGM1pJ?=
 =?utf-8?B?UTV6QXo3dFFMTGpHZFhFaTFrL1AwbElmNDR2V0tJTHE0bFliL2ttSXJKS1gy?=
 =?utf-8?B?VmlzV3RWWWN5R2hiR3NvYlZFV1NsNHpBc2FXQ3EycjZWZFZhRzZ0MEswaVBT?=
 =?utf-8?B?WjlXRUtQU3RTZVJLblBySkZXaDAzYTVtckFmMnl3L0FKSnJHbWVXS3FnNkZD?=
 =?utf-8?B?dHY0dDAwMXZBVGlFVHZTWndWSGJsb1RRQnBjUlpucjFOSi8weUs2Vk9aQVEz?=
 =?utf-8?B?ditMeTJFMUc4cmdNaGpkRDd2dzV1bjJHUGsyOHl1UnorWkF0ZW8wd1d3M2Zv?=
 =?utf-8?B?NG0vVGl1eFlnSkJSTGhMZ1FtQk5hNWhlQWcxRVNwSjQ0MWJhUzg1QXdoRkJq?=
 =?utf-8?B?TzUvM0kzQ1l3aXNlVmVwMnJaTzhoNVhYbDJQZy9LcjVSNnpvUktoWitLaVUx?=
 =?utf-8?B?NnlhdEsreWRUa2NQeDB0bUhpbGo0Y2lqZVJDN3lvTUw4MG9xZG82cWZlSU1Q?=
 =?utf-8?B?WGRWa2ZZSEV6QzM0VzdFZWU4dzdYcG5rZjFUdWcrdHpGUTNDUXR6dFQ3Tnow?=
 =?utf-8?B?a080RVZpcXZEQ1huWkl1MC84cGJoRXluZVU4SVJKSjhPOXZUbE1GbDdxNW4v?=
 =?utf-8?B?ZVpXblRZeW5sWktZQ0VwNDF6N3NJSk1MYnJEdElZTCtBemVNWHFlTGxidWxZ?=
 =?utf-8?B?QnJVT29aUFh4LzFoU09kdE5WOFlHcnI2aHkxRXBMYjJIY2hMOThXWWJ1NkVm?=
 =?utf-8?B?cHcxdUtOKysyWHV2ald1YnRkNnhwVHhobHpscWVySmxLRUludFk0ZXNiSXc5?=
 =?utf-8?B?ZkJXSHVFbDBwbEdPVjRjYmhpMkl4eFhhdHRybmxrMjYxNG1qVGZBdUNsa0l2?=
 =?utf-8?B?OVdEVVpKRFYwZzNYb2V6TUdoTHJTR2o3RFJGRTkvTkxScm5rRngxdncrTmQ5?=
 =?utf-8?B?b1NQTS9zRVFCdytrUVRvVk94UjJaeFlQS2dnZmNpdFVCeEE3aXRSME9ITm5T?=
 =?utf-8?B?N1Yzd0xMRjVlWXROUjZkM3FsR2ZpU05kTjBUbjJaRnRBS090bExLYSt0cHZK?=
 =?utf-8?B?Z2IrNy9uRVFIV2U5VlpnbDRDcC9SYk1LNWFtVW52TCt1VHorN0tveGNnczFG?=
 =?utf-8?B?bmxOQXNob2NpVTZySnZmNjBCSGdza3BZYUhxWml3SGhKeVZFMUZWTEVmbFBz?=
 =?utf-8?B?LzhBYXNLMk1RUkNvUjFPdjhING1Nd1JjenVlTFJ1NG53QkJPcXVIN29pQ09r?=
 =?utf-8?B?WjhEbEdKN2VvWFNWcDFJa3g4K0F6WHlGaUpIbVVUQnZEdzM5YXZOQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0977a920-24fe-4479-f2bc-08dec009e1d5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:16:21.1182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCjHjhCE9FOTnG0MPEE0f6p6ZfMJjtwp0D+pJtvEJBHV5Dyxv9gsNCiGyysyi1LGBnbpSPV5cCfElH6h7u3Sbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999088

On 6/1/26 12:01 AM, Alexandre Courbot wrote:
> On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> <snip>
...
>> +    pub(crate) NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x008916c4 {
>> +        19:0    adr;
>> +    }
> 
> I am still a bit uncertain about the addresses of these registers.
> OpenRM seems to use `0x00870000` as the base [1][2] and use relative
> offsets from it; that would make the address of e.g. `SYSMEM_ADDR_LO` be
> `0x00870e500`. I cannot find any reference to a `0x00891000` base. Can
> you double-check where it comes from?
> 
> Ideally these should also be relative registers with the same names as
> OpenRM (e.g. `NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO`) for easy lookup.
> The `Hshub0` base can be declared in the `gb100` HAL since it's the only
> place that uses it for now.
> 
> As I mentioned in my v10 review [3], there is more complexity to the
> HSHUB module that involves runtime-detected values, but for boot it
> looks like it also does rely on HSHUB0 as a stable base, so thankfully
> we don't have to worry about this for now.
> 

OK, yes, Let me get to the bottom of this.

> [1] https://github.com/NVIDIA/open-gpu-kernel-modules/blob/570.148/src/nvidia/src/kernel/gpu/mem_sys/arch/blackwell/kern_mem_sys_gb100.c#L54
> [2] https://github.com/NVIDIA/open-gpu-kernel-modules/blob/570.148/src/common/inc/swref/published/blackwell/gb100/dev_hshub_base.h
> [3] https://lore.kernel.org/all/DHY1D4IOXGRF.UQMCOXYG78CZ@nvidia.com/

thanks,
-- 
John Hubbard

