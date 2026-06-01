Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A0F32B9BB;
	Mon,  1 Jun 2026 18:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338220; cv=fail; b=EuOwdz9Jio9xA1EcJfu6oCYGqj4KZ7Eiy/8YIdSwNMOMwJy2iQmuwUuSVbUbZBpGjRjjUBdC1vie5MPrW6QkKf7NgAor/lnZQbiEJFDldhQ8fjCdcEjJgNpM1xiOnXpxFrELyztR7PNZuhKPuzJ3uY2sdTz3kvC1H13GvhCikqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338220; c=relaxed/simple;
	bh=LVm3i8YQOrKcAjoiK8U6d+zk+zooMljBv9maxeH014Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tLbwAJLNrerLqgQdL6hsy4NrCG70kTqkJgKpSoJqzN7ZRsNQiQTowMraz9qy4ROcnJSAKG+K9ofR5z0YZ2d6YYPLLxmGORdKzUKFMaKVoHwSvosZfY732yyUbWZ39wRbrLZKOfHqrnZoc9uoz8CfSYjDtKcPiJAa8UPhQNgomSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cERvmqK/; arc=fail smtp.client-ip=52.101.62.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cERvmqK/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxlP27aV1HgUqxHFbwHVwd8HUH9EJwfwwYnnpCWXpHbj5qyyI82rLLee+6lmjULg2bTT9xdzUvGjH3j2GLdvHhvcJ8MgnAMJy4q9Z+FwmUxRY7N1MywL8iTo2CaFEx5yNzt6K5WJejfOMZ41iUVrEJNFraYyNW2ijR1vS8ZRYoeKELWBTh6/926162fdA2MF0KtRk4oiBXtgm8GLRojUoQyLssux76nyzn1cW03vm/nkh4rLjMQAy/sXq+2ZY7EXVOU2s5teOLppKH4bGhzEtg3FyO+CdldsD9cQRjA/wHbPflmjyq1V/SYpufs64brniDfPIC0ev3ZcRYpu2UX1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFtRvRoGutTQYMRfGU5QyMODtq3E7sZJi6CGikTBVMo=;
 b=fldIoEicuUByJ1KE1PiDt9XofguAzzYkmdMmaf7LszSPTq6DMGyCJ65CNCJL7xwjEyXYj9v9x/Baa8qGOglH39z7/MxIPEmnC8uq55J8TO+SEWVQpiuilsNQyUOzk2Vkdj6wzVjw+oUnXKi7f9pHJWc+B9XOfMSERlbtykFmCnA4le/Jo2Z7fpMI8jRJrNzJi4BdvG6RR4U4a+pV/xoGgRgTM+41crfJzjfR1r/xQPFpprbeFiJYLzq3MxX70HfkOSTuh8harbiUDbZVdNeCI4HVB4naI1gy6Xf4tomf03aJeXtrlkTdkrYJwumyjJ9W6JfRiA68D4qUUHs5TRx3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFtRvRoGutTQYMRfGU5QyMODtq3E7sZJi6CGikTBVMo=;
 b=cERvmqK/TvbKPQuG+7H0M1IZwAlklslP5Ud0KN99qG7rpi6QL2kLdQy9i5gCSabHMLsm3gjGL28Yn+2fiIs969pwyTuI1PFAzwiyam7p0Fup+cIZAqXEsNP9WjPmEX6Ic9yK+cKq8j3kJLMzk/lqcqYe3aFey2mslIHeaYZlThHqPn6/DjsY9nzrZuJJrRiYNx5Lg3WEZBWRttlIPYLLZAI4DasA375s5UH4OvIOQ7BZCHdN4SXu2ECRZLlljfl8nnSlcLSKBYV4aiwzR90MAdmeUiUatKrT3zW+vuYfb74UuXbvJnrrYItJZnGcKWZi/C2MtJ9/3sS9u/sQoOFlsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4234.namprd12.prod.outlook.com (2603:10b6:5:213::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Mon, 1 Jun 2026 18:23:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:23:33 +0000
Message-ID: <b20b1814-c9d5-4910-8905-7ccb8c8f2548@nvidia.com>
Date: Mon, 1 Jun 2026 11:23:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 18/22] gpu: nova-core: Hopper/Blackwell: add
 FspCotVersion type
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
 <20260530030953.740561-19-jhubbard@nvidia.com>
 <DIXRS4BZL90Q.2D6KSYH2S0O65@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DIXRS4BZL90Q.2D6KSYH2S0O65@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4234:EE_
X-MS-Office365-Filtering-Correlation-Id: 412d1a66-88dc-4081-024c-08dec00ae371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|22082099003|18002099003|11063799006|56012099006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	1y3tdrAa8aVWWkdiXzqizbAvrq0o2IbFX2IHPf6pJ8DgyaZiPHKQuXiFoxoChoYArnDSLrpyj1aD2G6sGB99Yvq/efbn/Swwv8JkdRwh0h4I45dxbkbI4XfXoWnXvI1F7VVXYNIJZ7znQEe0lPDJtaDNwI+T7w3fjkaQtqxh62QtuFXD7EVBwKpKODXIPb3pCbcWdztBYXo41KwBdqVg2UNxT/017ggaU1TJaPyRxC6LqAHq+WBMI+mpwiudZDB9kgG66YidAVG6BkTG77Ngnn6B/xxRI1wSNFbPsZSeO2uQomo6Sf9hpuX5LOYThfEWdu80tNfRkpy5q/ck7ZwESOMQJGWseI6UYEicr81KwZAqDSV2u2lwzbODUZrAu18S6c7OLUZNVTfUmlREVq6cb2HVpOplJR1NAgWw1Y3lfXdK4If6zizA8ANikt2tpOIt1yaHzKSkR5S79lh1VzO6WP6M+YCUhMh+3jelvi3Z6HuESQAP33Y2BhLxNc9yJcOLjdWSVFxgJ0LYN3mxhBFiSYFUV6y7mgDdyNhQjzttVmz//pbYhKRZLC7O6M0NUFbOWhnpNIWjI5K0AJCnOa1LlCIV8rSIKQj1w52pbSTkP4Ul4shwA8u2BdckNFc8CcqMwnfhn86uL7nxJzDwAG+0wqX8iXWDg+vV7gOwjFAFhtPwycK7C69aBHDD0NFQPp9C
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3ViNjcxS1EwU1VTZjlaQkVEeDJiNzdLZTc4ajB3MTNYZEZickdXeEUwWFJW?=
 =?utf-8?B?ZFJYTTViWXBRS2VMelpmSkdhdG9HcTBKL1lEeWhBWTNvSkFOTmJZUDQ3ak1w?=
 =?utf-8?B?UlJadnI0RUFBRlNVZFYwOXNYbkIxUUhoSnNnOTE4WHV0bzBBTG81a25jSGh0?=
 =?utf-8?B?REFSbXJ0WlBuYzM0ZkE3M2lqR1QwZlFwZ2YvVmdjVkFYcHR0UkxPNlR6YTBM?=
 =?utf-8?B?UW01T1NPSVNKTjZFRDA1Wk5zdGU2OTFyZ0srcW1MM1JFVWxva0MxZ09OakdD?=
 =?utf-8?B?QTJHNjY0dUtnR09hR0gxUzlQcUZuSG1FL2lFVHFod3ZzejUyU2JsazBMdVY4?=
 =?utf-8?B?VUNSamdEaUtmWUxIZFNGOHhkS3QxQnpvYjhaT3A0eHhHWXZNWDVjRCtCcmh2?=
 =?utf-8?B?R2RkOVI2ZHBpT1llYThJcElHSkJWR0RUeFcycmdjeFI5QUlqMEhTaU1MT0pt?=
 =?utf-8?B?OUkxb0VHTkJQZm9sZUpwQnZwR3VmcDBtdkdFYUVKSU5YTVRIK3N1TEV6YVRM?=
 =?utf-8?B?MHk3ZWt3cks5NlVoRjdFbjExWFVHTk45VHppdU5mSHBETlpzNm1vbUlCSXNh?=
 =?utf-8?B?dWxsSGp3REpzdTJBTnBGZkI4c3YrUDdwYTc3cWdNVkJPRnpab2duR2ZONE4w?=
 =?utf-8?B?M1dndjlaSFVEaldnSC9JUTNqODlidzZ4R2U3dHIvUEh4ci9teExZZTRRS2Q4?=
 =?utf-8?B?a3dpT1NYSHlUdW9xMGVlbkJvclJXVytlSi83a3BBczhWaHArR0NMdmYzUndN?=
 =?utf-8?B?TTJkanRUZUQwY0pQSHFrdWtzTWxDRFMxaXNlSjdOVkVORHZUQ3hxN01XUXRS?=
 =?utf-8?B?cnZTREg4aWZZSU9iN1ZwS01nZmNSbm9MRGdsbnVwd3FjREZLeHoyc2ZOeGc1?=
 =?utf-8?B?T0JXTjBZUEI5Wk5EVlFJbDdUWmViNitEanhpTWsrbEFGMitGblVvd0xGdmlu?=
 =?utf-8?B?bzltSWNlblRCWGRWWWlvM2xIanNrZEtPbzBKV3NQR1psMTVGK0ZBNUR4cXlN?=
 =?utf-8?B?MG5LcVFXL2ZaMCtvNStpaXdWSGExT2ZDbU9pd0prZ1lRY0hXNG9LbkdjcnZQ?=
 =?utf-8?B?K3FGREFsbHBmOHZVZ3BJMnlNRnZpWlNJalovTm9TMFo1RkZ3em40Sjd3eW1X?=
 =?utf-8?B?SEY2dmlGZGY1VjlKYkd4R01hR2NkNmtlVnEvNG40cmQvZDJSMDl5Tkc0U080?=
 =?utf-8?B?UDgwb3JwQ1o0ODFybE1CTnVKMGdXODY2QktMZUM3eUZBTDgvV2JpMklkUjA4?=
 =?utf-8?B?STM4SG1STFI4R1E3MlNRcExlOFFoeE1aVTNOM0U1SWQwRnVPN0lIaHd3ZFUw?=
 =?utf-8?B?a0NtTytQQU84SDhxRnQ0cEtpS1dhczBnVDV4Wnc2amkzc3dwZ1dSSkV3ODlR?=
 =?utf-8?B?OXFsMXVmRmFGZGFoMXowYVh2Y2VuY2FIaWlEUmZBTkVxaEJSL1ppSXp4WFNR?=
 =?utf-8?B?NzRZVlo2Q1d2RHZFQVUzNUluZFVrYVA1dk5EclpXUFlYaytORTBmTFV1SjE2?=
 =?utf-8?B?aDdmVGpKTnhPUUprQkNiRGFLZEVRZ2FOcTZsZlE0cFRQNHlHZFlMNjRWUlFk?=
 =?utf-8?B?THh5NXRnZnVIVm4xL0V5MldtWDR4VkpKaTFXdlhmT2FyOHlaald5LzNRL3pq?=
 =?utf-8?B?MjR3WU9pTEtBQU1lRFlhY2JjRG5SRXJFMURRY2QrVkQxZFU1ak0zNEhETTU2?=
 =?utf-8?B?UlFVTDdLbmdLV2lWODU3VkpxVlFOZFZHQzhXbkRQY21hd2I1THV0RURsb0JW?=
 =?utf-8?B?Qm9CTElwbm0xRmpVUXlEMnFIR0IvYTJCdjF4cnFEb01ybGUzQ3ZCWHdta29Z?=
 =?utf-8?B?SzM1ODVoeFF4ZUZhSy9uNk1mOTh6NXQ5eGppODNhWmRrblJ0UTVjbUtYc29T?=
 =?utf-8?B?WUc3Mmc1cFEvaHo1OWZ5eDRUbjhRTnZrTG9GejkxYUlhMmlrbHI4Lzg4Znd1?=
 =?utf-8?B?Q2NBSnoxT0tTWjNyMTZqU3UrSlhUL2hxWmJJTzB2WVRpLzdPV3JRamIxMkZ4?=
 =?utf-8?B?blFZKzhqU3BFaFJpVUhuNmVwSXlmOS85eVVWMmRlVUxtckpQRGw2bTRwUHNn?=
 =?utf-8?B?VEpqV2VwSW5RVmhMb2FKM3RJNFYvVW4zUStGRVQ5c0ZaYW5jaVFJY1NOSVRw?=
 =?utf-8?B?K0hWN29KMjZMSERtT1c5MG84VkU0Rll2M2ladWRXRy9mNnJiai9hZWpkMml1?=
 =?utf-8?B?emNHKzhQdHdidm5HZy9mY3hvSWlGOUVqRUMyOWNTSURzZlM2aWNkYjZxNFVJ?=
 =?utf-8?B?eWNvSy9mMVJ1QTZ0dGRPSzIzeU1CNFpyUEZTM1BrclJOMG8rUmdzVnl1d2pI?=
 =?utf-8?B?a2N6ZXVrdmRHdWVHQVNqeVZ1Yks1Q3F1LzBLWUUxVDN3QkNTa0RQZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 412d1a66-88dc-4081-024c-08dec00ae371
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:23:33.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbEMo59dZvCkjgFPlcebUlIp7WT0sbnTumCCEYvaw8l6qyHuqKLU4r3SBMW37ZBlpZOm1T8kKgiQQcPjT3ExAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4234

On 6/1/26 7:07 AM, Alexandre Courbot wrote:
> On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
...
>> +impl FspCotVersion {
>> +    /// Creates a new FSP CoT version.
>> +    pub(crate) const fn new(version: u16) -> Self {
>> +        Self(version)
>> +    }
>> +
>> +    /// Returns the raw protocol version number for the wire format.
>> +    #[expect(dead_code)]
>> +    pub(crate) const fn raw(self) -> u16 {
>> +        self.0
>> +    }
>> +}
> 
> This type seems to just wrap a `u16`, and return its raw value without
> any limitation for its range, or other functionality. It is just created
> in `Chipset::fsp_cot_version`, to be immediately unpacked by
> `Fsp::boot_fmc`. Why not just use a `u16` directly?

OK, will do that.

> 
>> +
>>  /// FSP message timeout in milliseconds.
>>  const FSP_MSG_TIMEOUT_MS: i64 = 2000;
>>  
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 7dd736e5b190..6cdface3c618 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -21,6 +21,7 @@
>>          Falcon, //
>>      },
>>      fb::SysmemFlush,
>> +    fsp::FspCotVersion,
>>      gsp::{
>>          self,
>>          Gsp, //
>> @@ -141,6 +142,21 @@ pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
>>      pub(crate) fn pci_config_mirror_range(self) -> Range<u32> {
>>          hal::gpu_hal(self).pci_config_mirror_range()
>>      }
>> +
>> +    /// Returns the FSP Chain of Trust (CoT) protocol version for this chipset.
>> +    ///
>> +    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
>> +    /// Returns `None` for architectures that do not use FSP.
>> +    #[expect(dead_code)]
>> +    pub(crate) const fn fsp_cot_version(self) -> Option<FspCotVersion> {
>> +        match self.arch() {
>> +            Architecture::Hopper => Some(FspCotVersion::new(1)),
>> +            Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
>> +                Some(FspCotVersion::new(2))
>> +            }
>> +            _ => None,
>> +        }
>> +    }
> 
> This is only used in the `fsp` module - can we turn this into a FSP HAL
> method? That way it also won't need to return an `Option` since
> `fsp_hal` will already have filtered architectures that don't support
> FSP.

Yes. This was one of those snippets that I had flagged as "might need
to be a HAL", so I'll go ahead and make it a HAL now that you've also
suggested that.

thanks,
-- 
John Hubbard

