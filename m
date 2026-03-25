Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013017.outbound.protection.outlook.com [40.93.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B391B1684A4;
	Wed, 25 Mar 2026 03:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774409019; cv=fail; b=az6P/NmCVdHhV8gM7s469nWchmtSDQxTTU7a/gToQ5lOLmGbNiuWd+7h1gF3iI0w+MN+ReSTdwZ+OhVCXSrlUpK0SwNp12i582JmxpPGAguwWhdHv/oQ7MPTuZ4Mc9TbJscFAPudv2vcPAvk2F0aHIhCHWidgWI3KDb+awQHBSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774409019; c=relaxed/simple;
	bh=RZTGAA9D55+ma+evukq1g3UYiK7JUgy6vuU/Mwqgpfw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ODZejOhebot6l53K0LP7aUi4/EMy8B6milCmfqgWj0clLKf/kW9qE2y0gYvlQ7NEll2rPEg7ynsghZAyVjbH5Lo4SG88w6YRafMJ5YydR9FBV8Vo5mbvWm4dUJS+AWeGCi2T449CpJ98c2ZzIJSGR5M19KJ9O8Fs+L1Cx3cQs3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ox+5Jy4y; arc=fail smtp.client-ip=40.93.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ox+5Jy4y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtKrgPqr9FDrceFll6PfjNFJjiPMjLtW3o8CuWcS+ld4ew7aw+rX2ySXGVDocE0FTIXnn6UbCBh+dQNFWHkA+l4/xZy1OvrPeojO2IGTp3+cGsjjJW3/qOTPT6q9x00inD3O1PtL9qy9MJRTyD6wCfPngIyXYfYOm/94Nu0d7MBj61VqACQ4WbMZj8vG2T5TXVeYXQ0Joxfz0N3+DlLWT7G+kzezOWFzq0h+kX6jL65oxg3uU1sqRw5H92F2kuxQXtYeq8Fj80ZcujJZLDvVYbfj4BY8nTY491jIcOAKAFfIVB3jxA4hcNq9xcDVvBp7vhjyz9Ti+tu32rBkhjMo6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4zjF4E7wDL0DCY84ZzMeKPMxY9c5dRuhOLFkWdZI3g=;
 b=n3Lighd+7k7sXj7nfrTBFQIy8XzEE5bNGwk6XNj8inMFqpmG1EpMoMAP0TbmT5gOEc1PYDqkin3n8y2B0w3vzIxvZPwFGDTipWhyeqb7dnuBfqBgEGVUgDNTSlwnPCyYpp3iMnarwdAdnJLI5pTSiLbzwhNqavz5x0coit0tNhCU18IAil8R9SjD4+MFYeHVzyCSvMv1oAHi9KJNB3hfPfySRniUemFoeVZ9qVV0f7ZC6d2NQ0fe4p/SL2WuOQkr6N+9zRvAyqpnFWVs+3+6LcdfbOn1miaSKWjOGY6iZN/D9mSw7YYPVhNazR+8FsYqQNL+OSxT5rJEJRIIge9vUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4zjF4E7wDL0DCY84ZzMeKPMxY9c5dRuhOLFkWdZI3g=;
 b=ox+5Jy4ybfUyM1re+IAC6gJ1t8FSdLnN3TgrRuFRnO6Y+WmSojo6racMn1rERy4NIaGzYQ7NJlTNR3X5zjHjAZMn/+zzW+A5Nx3/IexIQQgszX/vRgGYxUW0ygEpcuig/saXF2hDHG6RuM41vMSnS1pFlL5eYOJB7kmJpzqaMYtjSin7bvW9mxNrK0LvRvV2rxQjR/xBgCMt8boXV1pQcoDQkwa+EVT4prePTNGY/dkl/eW9R5Woq9mWamVmBaehNtK6I2aX2dgarD/I3RR5BPsWpBqhZi5xwjs1fufGxe4l8a65IHZoXJacNTvTb1hSN+q0gdqVaI6/1ogZWhrQ+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8054.namprd12.prod.outlook.com (2603:10b6:510:27f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 03:23:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:23:32 +0000
Message-ID: <6be4c3af-43ea-46ad-8a3f-4c3dd8825565@nvidia.com>
Date: Tue, 24 Mar 2026 20:23:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/31] gpu: nova-core: move GPU init into Gpu::new()
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
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-5-jhubbard@nvidia.com>
 <DHA6738IO21U.27VI3S3XSRNZ2@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHA6738IO21U.27VI3S3XSRNZ2@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0061.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::38) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: 877ea42b-416d-43e6-f59e-08de8a1de402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|18002099003|22082099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info:
	jjt3oZCOff5Fe2h3acxLGpkZ7n/UnCDQKLkWF57poWQn8eLW+6udP2zOdhrti/oAZpAWFOVcIk8fOJoa5Pyp4rfcmhS3A0sSj3XgNG7fuzmDGJtlexV+GJG5TG/bqUp+M3AKJXIMM/kgmAK2WuS/jLoWO+FSNqhH3XN/Zm1v7wjuG2/2bJQonKMfeu+0esBoxBNa+2pEMLqlv8eDId5icWk0X2jX/FUF0A1LyfA+WPPIiSjeL8CygzzSfDk7sHkl3WSEVHaggI94IffgAx/8bGT2JxDWJuGLxFr/n1+yNiJ6wgtXDsnx8usWeLraYZfY67b3wdy2XyQk+8BBmJdmXrQXj2yvMnV1VrLvtcQRpc/jck8fyrwD/62fg6jCZax8qjGX1Ds4TyQmXSAPZ+Cy2xcVUAfbE2HlSLoiLLwlFIf960PhNPVJKQr8Kach8/58iu9uYZhTEheGThgRdBPhlc56cFwixX4MJOk4TWqsLovUJusDdviqdX9DnXb3sgnNlkmsBEGjf6grhozKghQQQcp5ygyBauTaUlxM+4lmr0xLOQOKa6JS/7wBLGnhG6y4SYnvIquVDCtI0HSSCrMrIfzpEUUFLfm/Gg5kt0B8piD3rAJy6mwOC4/fLRlLcRIRMNEFDDpvHYjd2K6lvDIL/E9GX2S9p9ZyUXyYFlbsUOcClnFUT5Co+4BYLGnQsYfaVaSguD8ROC8xmHaWc6oUkktqsT4mx93V3T/7ryL5ibc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(7053199007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjhydGtqOEFEbFhmbkFveVFydUxzUlU4L3RmdFp6S2JrVXQra05oOTVJTVZa?=
 =?utf-8?B?djA1REtTOUpJWG5WNkFqMVptQWxiT1JPdGRTWDQrYUtTSURHVno5ME1jMUxa?=
 =?utf-8?B?cHgvaTFXekx0c3pDNzc2ZnFiUEppcWthL3Z0NDFCS2o4YXhQZzZIWUZtTmhi?=
 =?utf-8?B?QzJ3eG1LZVMzMnpaczlzTHhBVEh0WVRKRmQ1TXprYm1mOWlBYk13QXJndVhY?=
 =?utf-8?B?Q0VpdUxPU0FjUlZVcTZQb2E2c0dBWHVsRURpZWdpY2J1NWEzYUJra1NhT3dJ?=
 =?utf-8?B?eVJpSUU2MlN2YmpxczRod0tKbWQ3ZkxralpybFhMRW5rQmhRYnFacG1LRlBn?=
 =?utf-8?B?bGxmN3BYVjM1cWUrZysyOWVuMlh5Sm9rSElCWU9QN1dxV2ZaenAvSHRPMVZR?=
 =?utf-8?B?TTduSUR3SzMzMGlnMXdhNG52VkNIWVVheGNKdTFkbkswUnA0aGlYZmg4ejVC?=
 =?utf-8?B?eWF1eVR1U09QRi9NeG9lekhNcGpMOVR4eTVvUDM1SHVNNHpMa0o2VzJLSlAw?=
 =?utf-8?B?WEhYV0ZUUUdaS3ZlZ1FMSWp3cDIwcHNXTTFNYWNHVGM1ZG9vNm5lVENNR1pZ?=
 =?utf-8?B?QjdJMGtleWxxc2d0WjJvK2NTNFNFUHh3c0xmdklKN00rWEJkZ2Ywc3FHaG1Y?=
 =?utf-8?B?bGJEVzlVb2Q4WERmMTYyeXB5YlE3ZjJzQVZSaVNUV09WZUhGdWZxSi84N0c0?=
 =?utf-8?B?Mnc0dEN6cTlKcWtmNEg5TE9UZGtEMVpqcEEweUUxMjNSYnovQjF5S0h3aHRv?=
 =?utf-8?B?b2FzSG96SzlKa2phaDUyNXdQSG1aTlJjMmVtTWMzTWo5ZzZybDZNd1dlZS95?=
 =?utf-8?B?eW1ORHNlaDcvYVg3N2trek9vRGZjOGZyYUFkMW81MmNudTFXSTVRVy92aXB0?=
 =?utf-8?B?NEZpNmVDL0V6RnBRd3plTURIM0JmcFJLOFlCS2pOWDloTjc4cGJJRHpYSHJT?=
 =?utf-8?B?cHE2U1drR2dlaTlSYWw3RmdNRHJTZkRYZW56RThqaGdZSjJ4eE1mL3Bsa0RP?=
 =?utf-8?B?RGM4bVFobytHZkVhdHJLN3JxWjBucHZ6Um1zUlRhUGlYWnFQVFE1MXpqbTlX?=
 =?utf-8?B?ak1CSzdyeVN1S0tBaE4xZWhpazh3YStLZEdpbmtOV1NWV3VDSmpLZFNPNFRj?=
 =?utf-8?B?Ri9uSy9McmRnR0tZanEvODNlL2tySkZIaFUxa3UyR2VKaGtaeTM2eitKdnZj?=
 =?utf-8?B?ckcwMzFWdWFzWkxKNWNzQ3puN0ZkSE15dVlnTTlkdnNBTC9DMTVua2hQd1FI?=
 =?utf-8?B?MWlVSlkrV3IxQ1ZwZS96dVJSNHFVQmlydENWVGZVSjhaUFlvbVZQeDBXK0ts?=
 =?utf-8?B?SG9qNWI0U0xob3BQdllSVWl1UEcrSUtMak1OejlRbnQ0eXNDZkpwREhYbzRu?=
 =?utf-8?B?VjlyaVhEbjdrUUVidUIzVUlpYy84VXprNTJTWEI2bkVwK3dXNElueGJ2YlBH?=
 =?utf-8?B?T2NKbkVCOUY1YitYYlJ4ejZ1amZzQ0x6L3U4ZjVXdlZ2NTdLR0hXR3FnbXVE?=
 =?utf-8?B?VUhtS1N0VVZUQko0SzZzWFVyRVBCeDgvTTk2eUtMczIrV2F5bzROLzBIelZm?=
 =?utf-8?B?OEJIV1FkNUt6b1pZZmR1UFpXaTRVMmIydTZ1emhYRXc4V0RMazNac3JGYjJ1?=
 =?utf-8?B?RXdFV1M0SjROYjFTRWs2a2wvamc4dmllTXhvRmdoRm8vTzZhNXFsWTN2SWpM?=
 =?utf-8?B?Z1R0ditraHh5c2ZOb29YMzFBa1J1R2JLbW9LRmczVVNNWDR5YXV6VG1QWTlM?=
 =?utf-8?B?YmZmMzVtMExJT3FJRmJuRXZkb2pIWjVkWlV4b2ljTUdDdCt4WGVxc29Ob0ll?=
 =?utf-8?B?dVJLSUxydlJLU0hqU3VtNXRRWVFDeXRwajlFMTM1V2lWY0RMeEdnbmoraGYy?=
 =?utf-8?B?aUdoclZtQ2hubXBlakdRYU1ES0ZhZ0d5OGhaUmxVbFc3MGlsVG9TQUtoT3N6?=
 =?utf-8?B?aWV6WXg4T1hvakd6TXpxSDFYUDZCc2pBOUNrd0xPNU9hdnQvcEQvRnV1a2J0?=
 =?utf-8?B?eXV2NUtPb0JiWlhWWjNFR0pSeW56TXlYTmFwSlNUOG0xUzJrN2R6aGlldDNW?=
 =?utf-8?B?K05NdnBlUVcrVWR2UlpVUzBMS3BQdms2c0crcldnaTVYbXFkZVVxRWpib0hn?=
 =?utf-8?B?bDdVWTA3VXJQbTIzRVp3a09XTnYvTlJ0NWtDdFZReTBTak1pT3E0emlmaDZi?=
 =?utf-8?B?SnBnaFZNWm5jcHRBZkhJZEMxT1FycWJKNlZKdlRuc29EbjVaNTRyOTcyRURJ?=
 =?utf-8?B?NUF5Qld4Vk1OTDZpeHl6WWc0L1ljc1R3aXVsSit0QnFxSUFWTnJ3b0dhUHdY?=
 =?utf-8?B?WTNEdTlhUGZBTmxUZkFDYU9yM2F6cEJTRjNRMGl4Z0luL21SZUhVdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877ea42b-416d-43e6-f59e-08de8a1de402
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:23:32.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJQ3EszGZseGHSLuQq+gs2g8+zSbBNDIWlIvFHa22lsP1hkncNHSPCXXSrg6V68NioDYO21InmUbVeZKQDhmlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8054

On 3/23/26 5:45 AM, Alexandre Courbot wrote:
> On Wed Mar 18, 2026 at 7:53 AM JST, John Hubbard wrote:
>> Move Spec creation and the dev_info log from the driver's probe() into
>> Gpu::new(), so that GPU-specific identification lives in the Gpu
>> constructor.
> 
> That's not what this patch does - Spec is already created in `Gpu::new()`.

Fixed in v8, along with all of the other comments below.

thanks,
-- 
John Hubbard
> 
>>
>> Restructure Gpu::new() to use pin_init_scope wrapping try_pin_init!,
>> which allows running fallible setup code (Spec::new) before the
>> pin-initializer. Add Spec::chipset() accessor for use by later patches.
> 
> What is missing is why we are doing this. It looks completely unneeded
> even when looking at the following patches.
> 
>>
>> The DMA mask setup stays in probe() where the safety argument for
>> dma_set_mask_and_coherent is straightforward.
> 
> Knowing the history of the series I understand why this sentence is
> here, but as of this revision it is not relevant.
> 
>>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Gary Guo <gary@garyguo.net>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gpu.rs | 49 +++++++++++++++++++++---------------
>>  1 file changed, 29 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 3b4ccc3d18b9..8f317d213908 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -102,7 +102,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
>>  });
>>  
>>  impl Chipset {
>> -    pub(crate) const fn arch(self) -> Architecture {
>> +    pub(crate) const fn arch(&self) -> Architecture {
> 
> Why are we taking `self` by reference now? `Chipset` implements `Copy`
> so this should not be needed.
> 
>>          match self {
>>              Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
>>                  Architecture::Turing
>> @@ -241,6 +241,10 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
>>              dev_err!(dev, "Unsupported chipset: {}\n", boot42);
>>          })
>>      }
>> +
>> +    pub(crate) fn chipset(&self) -> Chipset {
>> +        self.chipset
>> +    }
> 
> Short doccomment please, even if it is obvious by the method name what
> it does.
> 
>>  }
>>  
>>  impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
>> @@ -289,32 +293,37 @@ pub(crate) fn new<'a>(
>>          devres_bar: Arc<Devres<Bar0>>,
>>          bar: &'a Bar0,
>>      ) -> impl PinInit<Self, Error> + 'a {
>> -        try_pin_init!(Self {
>> -            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
>> -                dev_info!(pdev,"NVIDIA ({})\n", spec);
>> -            })?,
>> +        pin_init::pin_init_scope(move || {
>> +            let spec = Spec::new(pdev.as_ref(), bar)?;
>> +            dev_info!(pdev, "NVIDIA ({})\n", spec);
>> +
>> +            let chipset = spec.chipset();
>>  
>> -            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
>> -            _: {
>> -                gfw::wait_gfw_boot_completion(bar)
>> -                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
>> -            },
>> +            Ok(try_pin_init!(Self {
>> +                // We must wait for GFW_BOOT completion before doing any significant setup
>> +                // on the GPU.
>> +                _: {
>> +                    gfw::wait_gfw_boot_completion(bar)
>> +                        .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
>> +                },
>>  
>> -            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
>> +                sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
>>  
>> -            gsp_falcon: Falcon::new(
>> -                pdev.as_ref(),
>> -                spec.chipset,
>> -            )
>> -            .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
>> +                gsp_falcon: Falcon::new(
>> +                    pdev.as_ref(),
>> +                    chipset,
>> +                )
>> +                .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
>>  
>> -            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
>> +                sec2_falcon: Falcon::new(pdev.as_ref(), chipset)?,
>>  
>> -            gsp <- Gsp::new(pdev),
>> +                gsp <- Gsp::new(pdev),
>>  
>> -            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
>> +                _: { gsp.boot(pdev, bar, chipset, gsp_falcon, sec2_falcon)? },
>>  
>> -            bar: devres_bar,
>> +                bar: devres_bar,
>> +                spec,
>> +            }))
> 
> This diff is basically a no-op? The commit message should help me make
> sense of it but since it is incorrect, I can only guess - and I suspect
> you are doing this dance because `Revision` and `Spec` do not implement
> `Copy`.
> 
> `Spec` is 4 bytes, both it and `Revision` are prime candidates for a
> `#[derive(Clone, Copy)]` (and `fmt::Debug` while we are at it).
> 
> I expect that just doing that will simplify the following patches as well.


