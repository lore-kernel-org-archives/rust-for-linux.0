Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013035.outbound.protection.outlook.com [40.93.196.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8BB317166
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773181242; cv=fail; b=MTXEKqEdIASnC2qb12HZ5Mc9S1DbvfH0SGh77EL/ovGkYEzgIfyjFYr4H52UmtY/iAPEeAfU4EEe2HFGcqzl6Fy4gxm6/ykoavFTJcbBrGnyQpFsFFZATicNihiOzw7Fd2rHWbElB46qE0pYjoZHexJFcTf1JAFCOt1fg2JSiCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773181242; c=relaxed/simple;
	bh=w9eprwFkr4oTZsgkhDEvhJr1NS9YFU3nY1hXqvh+5HA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O85QgQGfF7ZNe/hgN4MpiHp67WtKRKGEn/Grq/643OEj3kZcz34g7OyGPW/rJSXqyTEORKxMByIHDJF699moowXsHJbdXrHhW6nbRswDlg9BOOgqup3KSj7xmvvBuhZVJGTwj6e/xyKSWyuBJGa7KdL4r7AgTR2IgTegxtJD6ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FNwl32Ae; arc=fail smtp.client-ip=40.93.196.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FNwl32Ae"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUEFT88DrbHiHEiRpCCpCROTSJAipazDQ3ArxThT5Yo6D4QBSk6Ts4Vx81j1co3OClFx2RtHk085QgzNjrS8xeYxrptE615IPsbCWLjCw+ix+Vbxz1+2dD07jJKHuKFQS6klr/GOodfNrp9LGx4YW/RREyf+vlo6sbE1S+98okel07Z50lz3SqO9G2WZ0nB9nXADq4bw6ZfEMu4JjjcqhT8/6p7Vl5uB+asflZvZBXnUIUQik7wvCV05Yr5kayX4ZkTJGwhT6RIwVu2Hfyjz7UpoDu+CrINN0pGbi04dmqv+2QJJzAzuYgTnBWLJn0BgiTHGFofROTqidrk+7sqKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hk6sonUL3O0iollcqyQojmJC0AZ6fl3bI6tj21+PN8o=;
 b=XA5ndRVacqevEfKJMl7dDNsLgEbOW8qeZDYkC1+y+Mn1kwByqkbmSPoLhZb4JC6dB8bUPMzOOa+Oq/8spIXI21V9YGJD5lcShNCPDwwUtRYbUt8AHdb5Ed5WBpF5wncNu1wWMdq1GVdYuZcI2kyV7fzuyP1Jz0q53hYxaxXqfL6lGsqkCII4AabqYKOVn3HangJp3LHyCSSwHzz3kf6B2Zthjs/JlGUlz3v/XdJSO3g/JsKtWuA1KAsjZyYnJDIPaNGImQoiKm/LMBq2K7SU4nT7zfgJNrDe0pGuMnZ2H6zxAoso14QOkqGF9uZA2rXm3u+ViX6nqZ1xny0CWPoKpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hk6sonUL3O0iollcqyQojmJC0AZ6fl3bI6tj21+PN8o=;
 b=FNwl32Ae+hy+0xI0sX8FMrOgltqyFwPUKLcAw7Hp0E+XI6pzomDV4c8MvcoN0YPpi+qXZoMeB3YvqUycPS7ndir+4fIZXs2HoL8hHAH9nx0fBkD+yTUzlK/qClvM+LfECJhAJsliNt6F3Ah4utdwxHGHNSX6IyqHR7hoxN+PucGyy3YgDEn6KDlYHdjKeqpu1cMEEgXrz5VqZ2524J3BnjnFV1CCE5IWLw7/QSUgvG87sZlQX63bPZvEMZQC726I/aFrLhsO028QrYRWV8L6AEWPgHH0x6QTcvAKO3au5jZ1SFROtcLYExCXPfSZLgBg98bkvd9cYWAOxghcqyQyCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB9519.namprd12.prod.outlook.com (2603:10b6:610:27c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:20:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 22:20:29 +0000
Message-ID: <ac9783ca-ffe4-431c-95d3-3c221d17c8db@nvidia.com>
Date: Tue, 10 Mar 2026 15:20:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] gpu: nova-core: expose the logging buffers via
 debugfs
To: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
 Alice Ryhl <aliceryhl@google.com>, mmaurer@google.com,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20260310220000.1897166-1-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260310220000.1897166-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:a03:255::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB9519:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2c61d9-1847-494e-5ca9-08de7ef33c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	x5vpnF5T+eKfpAMAGSq73JsCj/b5o2tV0V9fHLsLr6qYVZ9IiZZJG4Ns9pOD8eUIMsLh33iBF3oGDCHl4bbP9F3KLXa9aLbuWO0Yrtf/sojeFtJNzqd5DgJCFF//uMLUqjuOegePFgsKLJ9mGvmXDHIRq6RtPVqsa47eFJPF4voSq81kY5/Aq30Y853XzXDn+k9x6+hazLzB9XaWMjJVQ1cjrYXPJW1cV1Du/Vv8h60kO6moPCxJ+Vv1bzhqI8EFme6zVcyliMPNNb35iFtWfq6roih+3lW0Qm2iZEqsFg+FTLNiPW4kfrmFiGENYd81TMXkY5XEhmS6XA6siirIbQlCi+1m9PZ8YBsp6pJwM9HDOIw3c09g+zuVcIpgOoOoExnPmdRJGEWPpXpUhNTKcPVK5D4OOqBOVGX0URo0h2MxezNNxqFEknrpEIVHsFqmhiqeh6quRBR3n4uJYnpaNmk+JbG68LSn2mFDQlg3Pdi65Y2z1O8a0O5mpSgxqiBznC8oTYDXL+kRfGm/P9IadGhgl/+JvALlcf8q/rHLHH77zZrVVXXCl7bKSJZl3y0z5mvIFKJFY+ZXaFhQtWFB6aW9bKgd5N3MU2lTtsmE6U6QDl+/+KSQjz1fha+mDXCdSEEzn49MK1DE3NDDM0BXxYAccaoPTvy9CtE3JZLnyp4OZIX9iDx35tQbBM2NBd51R9ezgdJeotDR04y8nM0AYXEdhDRgUPI5hon+ibmWjxw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3N1ZVllRVpuNmFlU1IrZzQ2bTFnTFpCQXp1cmNadW5Na3g3VnAwaVQweVQ0?=
 =?utf-8?B?UjlyZUVoWTlqZU8vbFkrZmNlczJKME9SYVZvVU1rNS9TTG1IaGZaeFpVLzdD?=
 =?utf-8?B?L2lWNTMyVlZaeVU5Y0QvZ1Jvc0MzdGk2MGQ2b1U2VHFtNXo2L21TYVpaSzdL?=
 =?utf-8?B?WUlXN1VFRHZFbTUwZmQwdjZYVXg0aUptWFhoaGxJaGRrdyt6RFgwd083bVg0?=
 =?utf-8?B?RXZyYTB2eHBjcGVzbjhrTUhwY2dRYm0yZktQS0JZN0lwVGhPUktidFFnZVZE?=
 =?utf-8?B?TEM2bngwV2UrT1llVDBLRHY0RHN1bC8rOWc0cEdWeVJabTN6cHF5TXJZeGVE?=
 =?utf-8?B?ejBPbVJQaVJ5bnU4SDdMbkwrdDVVdmRmcUw3MHhLKy9vYzdwaDc3Qi92WGFY?=
 =?utf-8?B?R0dNL3QrVmYyOHI1Mi9RWVd5dGMyTmgxRlJMQVRJNXc1WjRwWDVoSzh5aXdD?=
 =?utf-8?B?NWxBd2IzbHZRRlYrNDZmOWlidGp6TmcwcWI5MnZvSzcxanF6anFVa2c2d0hl?=
 =?utf-8?B?Tmo3WmcwWjY2QnNWS1l3QjRpbXQ1WkxGbndkZHdjdzRjbE9MSkE1QkRjTXlq?=
 =?utf-8?B?K3lYWjZSSG1ZcTArcTVYTEwxYjA1RjVVUWIrNy90SDdsVGZHREJaZFFLdGtX?=
 =?utf-8?B?YUc3b3hFYUt3MDJJTDZMaGZMd3UrbzRCY2ZKQzQyL0ErcFUxVjRYaG03LzhD?=
 =?utf-8?B?MDk1NHN2V3JCOFp6amNhanBOS2hZeERpRUxjOWhMcGNJQkRDK1dxRTJvalI0?=
 =?utf-8?B?RTl4OTZWV3JBMktDNHM5S0EvWFF1RkswWGxBczMvdmtpbTNuYVFZQU12Sm9V?=
 =?utf-8?B?SVhRZHNQSnp5cnYySEdWU1pFWXdzS2lVbWQ4ZWNDd2R6cjdrREhXdDRhVmVa?=
 =?utf-8?B?bjY1ZSsybExUQWt0UDJVbUd5NG1ZYmg2WWdrTS94MTBHaGQ1TFEvNkM0UWhz?=
 =?utf-8?B?TjBSY0tkZDBoNlBxU0lnRHBiK2xnWE5NNUVCMHp5eE5IcUxxTjdzajhVNEpm?=
 =?utf-8?B?VjdRakFaMzhuVXZSM0V0S1VOT2lGdjlHeGtRK09tRFIwV1lJU3gyL3FJc3U5?=
 =?utf-8?B?VHJYekJjZmZWNksvazNFdGNoUS9xektFK0lTem03S3RmRHNBdnVvSHBoWStD?=
 =?utf-8?B?cDluU0FyZzZkUm85N29SbWNQcjRmb2NsSTZFaGxEd0VWK0Q2emlWMkp3UkVT?=
 =?utf-8?B?T1BjVVdWYmwyVUJ2eE8rWUdXNFFYbnV0bmJ4SFNsbGpRU3RQcXM2MmNOenpK?=
 =?utf-8?B?QzdmOGZlbjhzU1FmdUhqRUw4OEtRNnhnWWlINFBoMzVwZjVPWFNWU0lLeU8x?=
 =?utf-8?B?YUhndXQ1YUxCRXdNTm1jMVNpNm5PNkxFYjNGNCswMUNBK3A1RnVOeG1iaXY0?=
 =?utf-8?B?MFMwdUMvZjRKLy8xck9KaWRzTy9HaUdwYlB2VWZIR29VVUJnYlp0eUxFbE1j?=
 =?utf-8?B?ZVFZMDEwKzFqdzF6QUJkVWo1UjdJY1dRallrNkZiajB1eEZpdXIzelJGU1JM?=
 =?utf-8?B?Wi9RcG9QeE1KelRzQUtxU3YxNEFxUVYxY1lBd2RqcmpoWFpCanZIQ1U4OGVQ?=
 =?utf-8?B?c2J4Tmx2NVpYRFZ3czJSb2U3M3F6U1JUOVdPUXl2TXNqODJkaDIwczcwd0Q4?=
 =?utf-8?B?N01ZeVIvRXlyZ01nQUlDSTFjK3JIRGFROUV6QWFET291OHdvWG9IcEVxWEMw?=
 =?utf-8?B?Qnptb2VGM3ZDb04yQllGczNZYmFEWFk3UzVYUm11Tkp1enozdVQ1MDNUdjBB?=
 =?utf-8?B?UXg3VWRtajhUYUxld3ZhS3hwZDQvczNPeHhQbG1BejhnTUZQRmE5SjJINldK?=
 =?utf-8?B?ZFdSVWc0amFXb0E3TTRUZXAyVmxyZlJzekMvMEJFRDN1YThkK01UVjhBeVdD?=
 =?utf-8?B?YTB1VVpTZ1A0em9pQmovYkNLekdYRkRpWjhuVTI3NlVtS3dnMk5FU0VvR3JH?=
 =?utf-8?B?OWx4ZHJwRlZXYUQxdjV1a0lVeEVLOVo2cTgwc1NOdGcxMUczejhKMUlYenBD?=
 =?utf-8?B?Q0JKcFN6bE0vK21YTkYxNUZSZ1N6elZybU1HcFNaTDRpWFdDVWNRSklTVVJU?=
 =?utf-8?B?a25kaWdGS2J5b2ZkM3ZNYWpUZm8wdHp0dEk5eHlseWRBOE44L2hIbnhibDZQ?=
 =?utf-8?B?TUloMXZUcW9JeTViY05ibjFzVkl6TzYzcHMyTFpqNXJ2Z3UvMUxRT2lYeGZM?=
 =?utf-8?B?NEYwWVNMekQ1R25hSlFpSHBadEJVNU43bEZFWXgreDVoUk0xb3lBOUpCVVpG?=
 =?utf-8?B?ODZVZ2t0SHFJVjJMTjJRUmxraTdCQnNqQ3YwcWZUY1Y2cjRPQmJQMDFCY3o1?=
 =?utf-8?B?ZVkwSzVMQWt4K1FKY0dwV1ZkRDNsZzNjWllUcWZEM0Y0ZWV0ZFBBdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2c61d9-1847-494e-5ca9-08de7ef33c93
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:20:29.3485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5C5ZOAu5W21VwS6wfBCyuJSJ2Dzqrq0usBQoUaDrmnu/L4UxQbFpVhJijULs6juHkS99wf3BRllsfBpKyjXmqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9519

On 3/10/26 2:59 PM, Timur Tabi wrote:
> GSP-RM writes its printf message to "logging buffers", which are blocks
> memory allocated by the driver.  The messages are encoded, so exposing
> the buffers as debugfs entries allows the buffers to be extracted and
> decoded by a special application.

I'll give this series a quick re-test and if it continues to work
well, a tested-by tag at least.

> 
> When the driver loads, a /sys/kernel/debug/nova_core root entry is
> created.  To do this, the normal module_pci_driver! macro call is
> replaced with an explicit initialization function, as this allows
> that debugfs entry to be created once for all GPUs.
> 
> Then in each GPU's initialization, a subdirectory based on the PCI
> BDF name is created, and the logging buffer entries are created under
> that.
> 
> Note: the debugfs entry has a file size of 0, because debugfs defaults
> a 0 size and the Rust abstractions do not adjust it for the same of
> the object.  Nouveau makes this adjustment manually in the driver.
> 
> Changes since v7:
> 1. Fixed rustfmt complaints
> 2. Marked write_raw() as unsafe
> 3. rebased onto drm-rust-next
> 
> Timur Tabi (7):
>   rust: device: add device name method
>   rust: uaccess: add write_dma() for copying from DMA buffers to
>     userspace
>   rust: dma: implement BinaryWriter for CoherentAllocation<u8>
>   gpu: nova-core: Replace module_pci_driver! with explicit module init
>   gpu: nova-core: use pin projection in method boot()
>   gpu: nova-core: create debugfs root in module init
>   gpu: nova-core: create GSP-RM logging buffers debugfs entries
> 
>  drivers/gpu/nova-core/gsp.rs       | 49 ++++++++++++++---
>  drivers/gpu/nova-core/gsp/boot.rs  | 14 ++---
>  drivers/gpu/nova-core/nova_core.rs | 50 +++++++++++++++++-
>  rust/helpers/device.c              |  5 ++
>  rust/kernel/device.rs              | 10 ++++
>  rust/kernel/dma.rs                 | 36 ++++++++++++-
>  rust/kernel/uaccess.rs             | 84 ++++++++++++++++++++++++++----
>  7 files changed, 221 insertions(+), 27 deletions(-)
> 
> 
> base-commit: a544873ce0575b2fd8285a1364d3e09929d9a3ba

thanks,
-- 
John Hubbard

