Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012045.outbound.protection.outlook.com [52.101.53.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A704F3939C6;
	Mon, 30 Mar 2026 18:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774895755; cv=fail; b=TpEwZlHmOQodXPjiVyB/h02GgZAJfProGwwSyMGTAWZ1d4i65r1MwSPq57OW4051uFDmXOj7eX+lB0l1vcOWx4KTMF7oA9LAWp1La155IFLihVYKHygYz8KN5msbBbON/AE7v2ococrBbD1ExePuFpt9nrFPx0sKq6rS+8nRFqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774895755; c=relaxed/simple;
	bh=XLDl0oaJnCEovEX8DMbQPXKZXHNls8sdhT3Vmrf8eEQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CeSU40nHsYO1YqlpDpS+Ql2jUiyeVLofCPYHGDp9QJBmwvxVtLvDksQzcZ45YIZ/lifcDGWEFKyy0dTs5HZVuZp+hQPqouDnpC7/Xn+gtlv5hguLQ8xbDiwOTF39KeR9zurpQn1v0gXDWpkOcy538Lv9zyycPltKTD1RIlsK8BQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ex+v3OMP; arc=fail smtp.client-ip=52.101.53.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ex+v3OMP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZsQXcjBiBcb6kyaHu+uvcOmEVZDio2wRogF4Cv+lt8n6seEVbdR1aK/0KU5TWCr8+lDjAaF22T69CkFHd1klVnS5lLzGuMSRT6HAvVy6k00rd3lSmZ1dhap4wEh5IRvtNadyhhT2+lTP0+okd1E/p6RCtUqNpuMYI6UKPC47bG/HPWHkUdAavEaswW2tSHWqsFk0FWjBgSus6MzhTgjG0kqAAgj8aaXxmdLI0hXrD3nasmJVrsYZ6Wv71l8gYl1B9XIZTwVJlgYN5uJrJnMHHlVtJBTSmlxj6xQDAQHD7SNc/Mm/lpxmlMvDUV7wW/gPLnQaToUgxYj6xWyDJgdQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8QxnkqGjED09sPq3wiwBly3rHkrR2edU1dpjY8LIz4=;
 b=uRRjvIuzOm3Rf+KDikPg3g97QSpnWkcVp1a+Z7ioyIB+b7yGQNn/d3HD852hCnPpehKbIcwC3HK41GT3dqn2DFZz0SHwKT9L9OGwaH+k7844oWMhhK3bVm4Rl+RzoK56OxEbShbbFT25skYIHyMHBXv8WnT2dr75qMLpNMk+ZlOcDIoeU0//9Mw4jZjMQU1MH/VqBsSba7t9GYf0rWo5c6fDDM+sS8x/eLPa+jNAhnPxYrlobqgtxp4QRptYE1jljEMjZa1SIGuqNYeXt4dns/ME7Ak6s1J64Bvp1y/sq46U6jhA1oAJ3w1TMKrP9cuVACEitkycO5ZZgNJZofHJDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8QxnkqGjED09sPq3wiwBly3rHkrR2edU1dpjY8LIz4=;
 b=ex+v3OMPbP36wldcV/fgXlx+S3ajiKcVRzL7+BWQ4n/JdNDS7usk6YfXPrW4uN5xK9zAVFPsns+3gp1y7ahLtt7vFMzpQtI2OBYShXhEwCEYu9Ba+eUKN5sIL+e3xQuqLOtb0QUMAdw8ds4W17MMjc36SebT8vKA40M8ggsLKuGq4Al2fkHUo3oYFrR2Pj7KpXcJr+VkFV8hHfLKo8C3gMVwlvvK9PjyvLuXCCMI8zrTG1Kdca5FkCiB6NFv/TA3QAKYGfp1AjT9ncn7jd/Xa+KXvQbZbgSH/UHLzIf2eXUVIpprUOcpiXHnz5DyDqAFzd5wq/5rbZmRLXYuGOkCjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ2PR12MB9085.namprd12.prod.outlook.com (2603:10b6:a03:564::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 18:33:21 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 18:33:21 +0000
Message-ID: <79c3a1f1-50f4-475b-8a56-282289164ee3@nvidia.com>
Date: Mon, 30 Mar 2026 14:33:19 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW boot
 waiting
To: Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
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
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-7-jhubbard@nvidia.com>
 <DHG7AEASTW6E.2QTXB1D0GA0UF@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DHG7AEASTW6E.2QTXB1D0GA0UF@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0010.namprd22.prod.outlook.com
 (2603:10b6:208:238::15) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ2PR12MB9085:EE_
X-MS-Office365-Filtering-Correlation-Id: 34890bfc-9e74-43b3-db11-08de8e8ad1d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LduJ7M6qdbHxqQ1AIfgchB1TjA+wnuhfSanuA6IHX8u8JxwzFCQlgtNO9n2r8eDEe8RCobkZJyLZQpfyN+JZW0OP38RFULetANOMg8Qt/3KDZUMnWReQxtLktdioTpez24SuUfsq8JdEZPVozWppIR5kn2z9VX4Ozh44Xh00z+cafi9NoG3sSqu739VDpizIdhY1rH5A7LEC0IYPEpjGEs1rbPczuQ2XQXb5RpRcdKUFR8zgNZ2jO9mf6UN1QL6cIB9gM0/Ii/q4GtPdmmqRpPLKJrvOnW9IlXsQ7y8vUFwXBkvy13SplNBQ2MFUtoj/hxlhZJThQxEXsnrbqr1AkCjNchUNmWCD0t8kfQO+glFOgmwPsEytM8LhJ7a59biSSRG1fEhUyFi+GGmtp/ZEm1DRhg2pMFQxmB2LGtilsK0r/Wi0aFwzFu4GPMF0t7FjATtHCbCnd8IUYMv1NO7t6+5lxQnS+EygPvlAq9TJG6SJPBsfgC86VGTrNyMUM1qkBqKrJkyPcgzL7L0iraiLf9M5fcBnPd6dGBZ4KqffMbt9JwnKeqltwuulsOh462K5MgCVgoiiBSnf/cQlVrDioh8U1Ujlshc9rktNo05tMfzWE9YYHxZBeqAI5ZOUi24FQNcjHmA6I+kkkhO28BJlk6uTqlrv677Alhi5owWmIKNsqUIrKQ5HXRIv4YCnp1V7UE5a0IlfVlbAaX7W7VKKCo6gAASf/wJhyOLHeFxddLg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3AzcytsUzNoWlZ6YVVib0FFVEtjVEJlbDJGUTRpcVVLdnZZV2h6YW5BdG9u?=
 =?utf-8?B?aWM3dm9GK0lxZHhoUEdJYk9sL3NsNXl1R3UvMVA2NmVFeEpSZ1JWaWtieFNs?=
 =?utf-8?B?a015RXMramVJMTBBSmpMK1IyMWNQYkJJSVJWUU1RMUZCR1R4QjkrRVdCVDNC?=
 =?utf-8?B?SDkrejlycGxFeTh3d3VtL1ppQjJwT0tnQTJJNWhDb2gzY0JvVkhrTzg2SVRB?=
 =?utf-8?B?c1RmQTlEbmhLWHJiSWRzOFRMVFFMTlRmWjRaWURGd1Jna0dvV08zeUtwSzRi?=
 =?utf-8?B?cmdoVTVIUTk3U3ludVlvdXpQUGs1SGxHUVJnZE9aRjZTbloyUFVoOXh4bnUr?=
 =?utf-8?B?Ui93Rkp3djZtdnRpQ1JEVzc3YjJQM0hvVlpGa3VKRkh4YTJQUGNXeTcwQ1p5?=
 =?utf-8?B?WitoZzBSRzBNU0hianllSXBGYkpzSStrQ3JWcHpUazdJVFJyUzJJczdybFdk?=
 =?utf-8?B?dFV4cVhmQnlJRWZybG5WWTlTU1Blb1kvaVRlT1pRL0hGZFlpN0llM1daRklZ?=
 =?utf-8?B?d0ZKZnRWTjZVaFJVK2dMZVN1RmFnN3lYMUhGR3pVOUNiNDRJQzEzZlhZMjNj?=
 =?utf-8?B?TFFJZjlQRWNweGZURk1yOVV1QzF5NWpxeGZZalNpQ2dFeEFXckJ6SVRxbDJw?=
 =?utf-8?B?Z2JKVkEwZjJqRzhIVUdrQklmbVdXYXB5dmNTeFhoUytnYjRBaXB6cnpvaDBR?=
 =?utf-8?B?TXcrM3lGVlRPWkVNSjNaQ2lUQ28rcjllUldlK3V4TWJJUURwd2pJSWZ0VUt5?=
 =?utf-8?B?WnNFOE9WMnlIOFBZL214NllzaE05M3RVZ2VjZUw5TmxXU3dZUnpPZmFYSnJS?=
 =?utf-8?B?MHRtbnFtVklMK2VjRU9FTzRkV2x1WnJqbDYybmg5eTAra3NteHJxNkRUMkI2?=
 =?utf-8?B?a0M3ZElaZHRqeUhWcitBWk41aDRKY2JQUHgrd29mM1RGT3BGcjB3clEzZDBP?=
 =?utf-8?B?ZEdlSXlCY2VDc0p2dTIwNElNckhYenRveTBvRmZQNU1GRjh3TzVyM0VxODVH?=
 =?utf-8?B?RlVLRTBBWWdGTFBodWFHbTZwalpDUHRnVXVXeGtYbUF6VUJnRC9wRkRLODVh?=
 =?utf-8?B?TU1iYTlDZklNQmxxOStiNVJoaGdNK2Z4TkpoSVFwU3JnU2tvYUl2Y2ZxdVdL?=
 =?utf-8?B?Z3ExYmNPRWVkamtrcGJ0Qkt3K0xDeTF2dHp1enowVHJPUHAvdTJ6Z3ovN21j?=
 =?utf-8?B?MFpuZVBBc0xpSVVjNjd3WDVMV0tRZ21MZ09peEJEN3lYUVFHZFZaWDduZDZ2?=
 =?utf-8?B?V1ovMFNTVGNqWHNjenZhQTlnNUlONFQ0Q04wK0I4T0xFeTdlangyMThBTFRJ?=
 =?utf-8?B?bFQ4SzhUMnNGeUxST1Q1Zkt5UERUeWoyUEJFTmxKbXJnRWpGMCtDL3JQeGFW?=
 =?utf-8?B?akpYS1lzbGtjWmFMSVcxQk9wVy9Yd2xBZkdqRmZLQmZuTm5oNFMyWmF1ZWxZ?=
 =?utf-8?B?QXFDdEoyclE3eU5KRDBnc3F4RG9ZZ1RETDZ3YjkzVS9lN3oxdWh3cmY3TndF?=
 =?utf-8?B?WTkrTStnWUwxR2NDK3NTOGZRcGJjc0JXUUUrd0hwVmFCeGRYTk9Bc3ljVnV5?=
 =?utf-8?B?Zk9sVmZrSU14Tno0dnE4c1Y3OVRoM0lycU5kUFB5Q2pobHBwVXVTaWRaRWhS?=
 =?utf-8?B?U2FWZFZEbkRVQ3VZSzNFNGhqR0lQbEkrK3pENFZkMDBuR1ZLSTBZWDhMeDdY?=
 =?utf-8?B?cTJHR25RcHZHQUNKOTBvaWU4cmJwMmUwMjE3a1d2TDRoYlVEWkJ5T1JRTlFo?=
 =?utf-8?B?anRpaHphMFRQa1VQdlJJMUp0MHNGTDd2YktjOFFYTExOZDRpQXIxYkMyQ0gx?=
 =?utf-8?B?d3BwNi83REYvSmdyQ29JcXROUVFZZ1FYTDNrczRHbGZrUGtmVXo4WVUvbUly?=
 =?utf-8?B?MUF1U1lPU0dhM0E3OUdIUloxaXRONm1iazNuKzdFbG5pQldSNXFyRVFjTHFn?=
 =?utf-8?B?VE45eU82U1JTL24reFZlNHVqYXJjeFFrTVA0eUNRQlNDcGt5U1hoUzlPdU5S?=
 =?utf-8?B?MlNIZ2xXR1kyVks0bDdiZkxadVg5SDl2aEY4cVF5TElFRXdETTQzUzVDWXVh?=
 =?utf-8?B?c0JCN24yRE5ISVp4czNIeGNIZmJyWk42dktuRUpRS0FVT1NEaVdSZVNETTNo?=
 =?utf-8?B?L09CQXlpRnBFRVl2Mk1VY21OTGhTeTcwOEhOeGtpK2NDbndGN2M1L29lcGVq?=
 =?utf-8?B?dWJDalNkNWg2ZEMyOElpOWRJdGY3Z3RyT2JtWFVWMCtJcWpvTkFibm1meXVq?=
 =?utf-8?B?bWozdVozSXM4elJ2bHlNWFNodTRHUml5QmhwbW1meEREU0RRRFVKQ2pkYWxv?=
 =?utf-8?B?Uy9BVlBiM0lXeEY0S0l5dXpxdCs3bFlIenJJZk1qN3A0MVN1RHRQQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34890bfc-9e74-43b3-db11-08de8e8ad1d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 18:33:21.1952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDD1gCAY97dRnrPi0xF4w0sZUp28oRqAGo97dpDEE5w5Hiv2QNcaMrHbUoYysWVCxjhWRxNCEy4DrIUScnj2MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9085



On 3/30/2026 10:52 AM, Alexandre Courbot wrote:
> On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
>> Hopper and Blackwell GPUs use FSP-based secure boot and do not
>> require waiting for GFW_BOOT completion. Move the GFW_BOOT wait
>> into a GPU HAL so the decision and the wait both live in the HAL.
>>
>> Pre-Hopper families (Tu102 HAL) wait for GFW_BOOT completion.
>> Hopper and later (Gh100 HAL) skip it and boot via FSP instead.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gpu.rs     |  6 +++--
>>  drivers/gpu/nova-core/gpu/hal.rs | 41 ++++++++++++++++++++++++++++++++
>>  2 files changed, 45 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/gpu/nova-core/gpu/hal.rs
>>
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index f70bfbda1614..8332ad67c0af 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -21,11 +21,12 @@
>>          Falcon, //
>>      },
>>      fb::SysmemFlush,
>> -    gfw,
>>      gsp::Gsp,
>>      regs,
>>  };
>>  
>> +mod hal;
>> +
>>  macro_rules! define_chipset {
>>      ({ $($variant:ident = $value:expr),* $(,)* }) =>
>>      {
>> @@ -311,6 +312,7 @@ pub(crate) fn new<'a>(
>>          spec: Spec,
>>      ) -> impl PinInit<Self, Error> + 'a {
>>          let dma_mask = spec.chipset().arch().dma_mask();
>> +        let hal = hal::gpu_hal(spec.chipset());
>>  
>>          try_pin_init!(Self {
>>              // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
>> @@ -319,7 +321,7 @@ pub(crate) fn new<'a>(
>>                  // still constructing it, so no concurrent DMA allocations can exist.
>>                  unsafe { pdev.dma_set_mask_and_coherent(dma_mask)? };
>>  
>> -                gfw::wait_gfw_boot_completion(bar)
>> +                hal.wait_gfw_boot_completion(bar)
>>                      .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
>>              },
>>  
>> diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
>> new file mode 100644
>> index 000000000000..164410992659
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/gpu/hal.rs
>> @@ -0,0 +1,41 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +use kernel::prelude::*;
>> +
>> +use crate::{
>> +    driver::Bar0,
>> +    gfw,
>> +    gpu::{
>> +        Architecture,
>> +        Chipset, //
>> +    },
>> +};
>> +
>> +pub(crate) trait GpuHal {
>> +    /// Waits for GFW_BOOT completion if required by this hardware family.
>> +    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result;
>> +}
>> +
>> +struct Tu102;
>> +struct Gh100;
>> +
>> +impl GpuHal for Tu102 {
>> +    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
>> +        gfw::wait_gfw_boot_completion(bar)
>> +    }
>> +}
>> +
>> +impl GpuHal for Gh100 {
>> +    fn wait_gfw_boot_completion(&self, _bar: &Bar0) -> Result {
>> +        Ok(())
>> +    }
>> +}
> 
> Please take a look at how other HALs are implemented: each HAL instance
> is in its own module. That's not just a cosmetic choice; it allows us to
> keep the chipset's specific HAL struct and its helpers completely
> private and forces us to make code-sharing explicit. Furthermore, this
> particular HAL is bound to grow, so let's split it properly from the
> start.
> 
> If you do that it also makes more sense to use constants (contrary to
> Gary's feedback on v8), if only to align with the rest of the driver.
> 
> Once this is done, making `gpu::hal::tu102` absorb the `gfw` module is
> trivial, so let's do that while we are at it - having `gfw` as being
> driver-wide makes little sense since it has a very limited role for a
> specific subset of the chips we support.

I feel a HAL might be overkill for this. Looking at the series, this is also the
only method. I am doubtful future architectures will have to once again wait for
GFW boot (is that expected?).

If not, we can just match or conditional on .arch(). We do that already in other
places.

Something like:
  if spec.chipset().arch() < Architecture::Hopper {
      gfw::wait_gfw_boot_completion(bar)?;
  }


Thoughts?

thanks,
--
Joel Fernandes

