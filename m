Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012006.outbound.protection.outlook.com [40.107.209.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CF92550AF;
	Wed, 25 Mar 2026 03:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774409180; cv=fail; b=oDLsAlXkwZggfyRMPc22jjYtr490rce2RMwf3AeoLheQT4GsKL7hxFovXIT7GNr36Tev3tHxdJ7EabR3EzYjm5ZnF8lHgP9iR1ps53dX9pk8Kcqo74ov9qBnYOm+VBM2WiSVLNjBk163yXzAVEXCrnvAMyF7UvF0EuJYuUIMsDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774409180; c=relaxed/simple;
	bh=zyyvROmYNCct86mNfiwg2Wphgdb78k8V7cuVNWFwMfw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HCdfnYAe1FIwLg1Bs+ks/fcnsRt2f3RHs037pj3EQilcsv4OZJZn7z0nqXFvv7E+pFB1VGl/bOGIdbb24MUkW1eXU6W5vMIqXiFOZJtC1MMxX7r1N1iGgx4/1aEpv44OBrT7RP3R0+wJVeeEYuPbJRcPiGngCAP0L2uqEHC0odk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uD+gyiqR; arc=fail smtp.client-ip=40.107.209.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uD+gyiqR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIo2aJziph7kFzz6xQ0M2KkZg20AppDVt89a/C8HcqR3b9pIdKLm0A8KvJhPsuXZBIckUq0k4o3qA/RRKDqpeWTXMJQTUMKZ+JXK3tPoYSoLc0MyZA9awxBX9szTsjMf8QqPYoK4wCtW+XKxiRF7lq9s9sPTW/XQPGAZcvGse0PlQSyZ92wd8UdyBcQg9pALxyKmxtbWfDPS6d1mmaXOCe4O/hJmLv7J6R4bEtrkQkOjngE3mS+2wuqK5vnyfBlDYDun554+yQ8jOB6i4WeBmdTvji24NHioU86mz9PqvHT7WJp4DoUTjB5thHAT9guW6baIv0ErXTXzFEuLD9IErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCcHhwqL5H4Ba0Q5Udo00GBmc6e9aGmnmrG0+4b4d8I=;
 b=wwidSv0HI/jE3kePQkkn3hTzH4O1ygo6g8VEhpaeT7x5WzbQ5igF3OjPk2PHGThNbMnnV4i8lOGnKT/krdSEy/kMSBWVeRC4yJd7KJak0i4iqEJydPHz5tMSYsB+eXkizpczO1eoSn5SEmnFUm8xEM/f4UcLGvxxGJKaFXA8s6T7QaFZJAmApA0aYwh4GAvQ6TLF+WBy9E8oI4xE9V65Gx+SsZe26leb10NyvYt2+/0KzyDmcothM2KDKjCAirKbD6nTJi06IkRtGFCeeuHVALNbcJTa2/Ri8iHtc+8GhDVu8BBbTqDPcjGuTfjZZ95jH4fHHAtiD17Gtg2S42waGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCcHhwqL5H4Ba0Q5Udo00GBmc6e9aGmnmrG0+4b4d8I=;
 b=uD+gyiqRb1h1rQh5BmdGSsQgUx/udUESKyGPNC5fEtdbvMyWfs244etTEDiGmgXCILDU+zzIlgnG92suuPfe4yeP6q5KzAnFCd3GifH8HmwwsnKndBxE2o4H8IPmT0zyjRpsg9kEf5JRDqSaB9APdRZq7duBHaSRo+cmk1O3J6/HBnTqrobfvX55voYE7H5haT89ScKKDYS7PQIGPs3SjT2uAYzQJKXihoLaRtn7BgWUUUnEgAvju/7oYwUCevkTzadNDBR8lGa/iRnTLQGw5cD84FUmUsXWYpwV4WzqDNDxKfSA8IDDMwOW+pZfBcuFiXzIc5T+QC2BmS6xgn13Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH1PPF7A6EE32B1.namprd12.prod.outlook.com (2603:10b6:61f:fc00::616) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 03:26:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:26:12 +0000
Message-ID: <08439ac8-d609-424f-9918-20a340d7dfd3@nvidia.com>
Date: Tue, 24 Mar 2026 20:26:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/31] gpu: nova-core: set DMA mask width based on GPU
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
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-6-jhubbard@nvidia.com>
 <DHA6KDURL8OU.LW9IJ5G6SWFN@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHA6KDURL8OU.LW9IJ5G6SWFN@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0070.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::47) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH1PPF7A6EE32B1:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bcf615c-14b3-4b10-fc13-08de8a1e43d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info:
	581Bily36w3cHsWMtbPTZWldK51uvnAVUpzjiGdHPG5TWrYoH+jeLdyY6pKzRWZ08ZDf0+GxH4fhDBmUyH+Cer4nh3uU04qd5ra7+UJ7XpKyAX+mTZW7K4NI9c2RRPHfJgE5ssGdGlIYVPqlzDm4BeoAgi0DsLQ8EhhOhRxvnm/orXlm6Dne5bEO4bMxqiUjvi8jMiLkxkEPV2YJJ4qHYqZWemmv6O62S9uBHhRqVTyc+VBSuS3s32gGy3GYybFuQSpMT+zb1PjIGS1rMzEnjqcNe/+/DDGF75mrXtxF+7u0IfK82ipkrKheA071Nu2SMGfI+FA47ANpsiRdtSkcr5/XtTHOzVs+Yl+2RQv/FDEhu+4Jbwg78D3Bt/FNQfN91EbRj5cy+cf5hy6+AXjpjM0L6SONJlibBx4ZdNP5rmr3sy3RrNQbh5FOqDrWvZAjI3cAPoxK8atr+jqr5SNxPoPj0nS9XEX3ra2vLhqiFX7UY9SjmLLpbiz1grgYr2VePx+yXHJy+mmBOC3vyvjU+qTWzUu0Y4CTifXRN0ST87ImHsPhdWu70BTVZH7xOnWk7hvMbpPr8d68SBDxzWTZi8NZKJ6tyl4UgdyxNPZrjQkkZhY85LkZZtUgCQ5L4LfqCgn21BEVMm9YPYFsylVzJqnu54pjNwkgp/dzNCdbIh5wAbcoRyq1DyIFNqyCgnbp9nfziqHSNSbaXm8kI/eaHFzAIGeUjdmyJVp60TDQbto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(7053199007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjR5ZURYcDRYcS9yZWpzeHc3emtuYXBVYkpuWjMvRkFwTFY3eVNnRnpGRGdS?=
 =?utf-8?B?N0pJSnhyMHl1Uk53bVVBMS9qcTlwOWphMm5wNm1rRzNWQTlPSklQa0c3blZi?=
 =?utf-8?B?c1Bka2R4dEsrVkhlT054bnE1SCtudjN4MWlrVHpaR0lMYmpmRG5pZGFBakJ1?=
 =?utf-8?B?U1pHV09GMDl1UHJPMkgzK2RsdWt6NUdKT0ZLQ3VCeUQ2dVVNOHBEVlFBZjRn?=
 =?utf-8?B?TUpvdkg5dDcwT2ZuVjNnbHJDOVZuRHM1Y0ZMRWY5V2xYU0N4Q2lWejlPSm41?=
 =?utf-8?B?a3lOdDd3NEVsaTVCWTArWjRrNHdrZ0dpb1JwVlRENnlONVNTNk5aRkI3V1Fr?=
 =?utf-8?B?RUVSWkVhYm1hNmZFazI4RDM1NjBGeEFyL2k2KzhSc0ZTUEN2MHpBVGZVWnZH?=
 =?utf-8?B?cHM0RXRucnBRRExKRGpJekdtWVJGN0kwVmYzKzg3SXVHeG5CN3V0NTZab2ZI?=
 =?utf-8?B?eG45MWFWQlB2aDBtUW9KbTdoTi9Sa3NkYnQ3alIyeDkvM3N5TTd4L3ZBMlZV?=
 =?utf-8?B?QnIwdjhMZCt3dXBNVzdyVVk1aVJhZE03RzhvOUNQUXh6aHZISS9ZUnhrRnBz?=
 =?utf-8?B?aEhCWURqbHZMWWZGQm1DWEMyWFE1RTVBK1RYaTN0Q29wVEl1M0d4SWpJMk1I?=
 =?utf-8?B?aUFYMmVac1pnYThIZmJDdXlFV2RhaUVHS2VMZFNPVEcvTjJzYXY5NWVSNW9J?=
 =?utf-8?B?V1VzZWxGeHZxUFdycEE1bmZUV2tnN3VBTGdCYlhHVzZQUTJXYkJ1WUw3UHlH?=
 =?utf-8?B?SmFNbmEzMk1UVlhtYnh0bjNiNW1YSlgvMTlGekdTZDRRdmtuNVlmY05RQkdV?=
 =?utf-8?B?OTFOQVNIZ3NxOW03ZFNPOFRoaFdWQzBvZG5VaFFnam1kMFYrYnp5MWhUR1Rv?=
 =?utf-8?B?SGpUZk1rSnpPb1lRcmlKUUlWTUlPQzY0N0EwekZ1ZCsyNDZwZTVTYnF2ZVcx?=
 =?utf-8?B?Vm91dTFTODhFOEh3K0o1dmdpQkFDdEx0WEhNem9zUzFBb3Urb1BnWjE5MmYz?=
 =?utf-8?B?UFdHTlNZb0JqNVcvVnpCOFR4cmJIWWJZRG9ITUpOMERBQ3ZMVzcxVDcycXF1?=
 =?utf-8?B?UjNCUSszVkhkUmpWa1YwdHVYb2owV0VDeW9LSDlDRm9oMG9iL1pMM2R3dHAy?=
 =?utf-8?B?L2VOeUExdlpLR0JtZTZEeXBqNGtLYWs3M3hNZm9Ra010ckZXN29nMkpqa1JH?=
 =?utf-8?B?YjJRbnpxOW1ib1FrOTNINVpZekJzTEh6VnhnY0o2blZidWpiZGJsK0dXZ0lU?=
 =?utf-8?B?dlVvTGhqVE5kbmxLLzIrUXM3dVQrRnhidGdrN1JYdWd1amZLUk95NThTNVhw?=
 =?utf-8?B?MkppSEtscHBmMkdhZTd1VWJCczlHM3dnQk5iTThSNE9MZEtocWwyZ1U2VjZI?=
 =?utf-8?B?bXZpS2VLQ1krVE1yRGIzTzhQMHRoN1NoQVFaNUY5WS8rY2VlTDBkZDVuNGdH?=
 =?utf-8?B?a2dadXU4eEZEeFZMTXBXV2NVM0NNZjB0Nml6SVRCelIxNkd1cEhIRmRmRVVF?=
 =?utf-8?B?cW1WWXVPbGk5RlZOS0EyVElhRzJoemNlTFhiWUk3WXdVOC9LUGowTUdybHZ0?=
 =?utf-8?B?SmJCVVRrZnh6MVZ0bFlXZ0N5S1RaSmwxaGpCWWwvYm03cFhsdERYcVBCZzVC?=
 =?utf-8?B?MXNUcjMzKzFCSnZxZ1hNaXo0dThpZjZudGQreVJvMXRFdi9hQkdsNVFLcTh5?=
 =?utf-8?B?MVJzY000eitiQnZyeER5WWJkM2pJMUxhd1pzRkF0bmdtRE9lNXRLam5wUlhT?=
 =?utf-8?B?L1p6VTQwMldGL2hmQ3dCaVJIaS9KbllGVHR0KzJGaE1GemltVU5lRUlWY3pz?=
 =?utf-8?B?eGM2S3RoMDBHcnJLYitITEtqYzhYemN1dDZTTVl5c3FoRW10REQ1RkMveFQ4?=
 =?utf-8?B?cnBrYmszVFdVR3FuM3JaZE5JZ1R5SzFYQWNBbm9SU2xWSlBKc3h2eURjVEth?=
 =?utf-8?B?aG5mTHpEZ3lUbHNtRzVhQndWcHRUMFQya0RrRjNSRkQva2F2aGMya3lXRVhl?=
 =?utf-8?B?WE1aRVA3cFQxR2tsaVFxNEx6SUNFaXFZd3FjaFhDOFFtak9jUG9yeU5oRm5J?=
 =?utf-8?B?QnY0S1hUVWdsYldQN0hBRFF1WW1JV0I0QTB3dGZlZUJzVEc1YWtQRUZsVzFW?=
 =?utf-8?B?QXUrM1ZjQVNncGVYUThkN2F4UlgrUzFINjhSRjM1VUwreVpjK2Fic2Jsczd4?=
 =?utf-8?B?NjJ6bCtaZGg1bTZiN1RvK2kzRDMzYlc0RUV0V0x3Sm9vVkpPOGNEZzlHSTVl?=
 =?utf-8?B?emtQNkFEcm5Zb21mZUdLVGR0TDlQWjJrTjRaSHA5ZDhDRVJLOWtIbDBhdXhh?=
 =?utf-8?B?OGZiYkRwZE9ZZkNTMWlvbXhxSW5sQjZvajM0SW5jUmhaNjhwQ0VVZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bcf615c-14b3-4b10-fc13-08de8a1e43d5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:26:12.6696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lp7qn8yBmJ5WHGWvWXpnl/LqEGqcSDiIgdo5exs2dALF0PgvprwlHgdj/RNtzzqlUyh6V/tHCoyTOyD6SAP+yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF7A6EE32B1

On 3/23/26 6:02 AM, Alexandre Courbot wrote:
> On Wed Mar 18, 2026 at 7:53 AM JST, John Hubbard wrote:
>> Replace the hardcoded 47-bit DMA mask with per-architecture values.
>> Hopper and Blackwell support 52-bit DMA addresses, while Turing,
>> Ampere, and Ada use 47-bit.
>>
>> Add Architecture::dma_mask() as a const method with an exhaustive
>> match, so new architectures get a compile-time reminder to specify
>> their DMA mask width. Move Spec creation into probe() so the
>> architecture is known before setting the DMA mask, and pass the Spec
>> into Gpu::new().
>>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Gary Guo <gary@garyguo.net>
> 
> Why the Ccs? Some patches in the series seem to have random people Cc'd
> to them.

Many many months ago, I wanted to follow a convention of adding
people to Cc if they had responded with comments. Several versions
into it, I just gave up, it's too much trouble for a large patchset.

So I'll just remove all Cc's for v8.

I've fixed all of the other comments below, in v8.


thanks,
-- 
John Hubbard

> 
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/driver.rs | 28 +++++++--------
>>  drivers/gpu/nova-core/gpu.rs    | 60 +++++++++++++++++++--------------
>>  2 files changed, 47 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
>> index 84b0e1703150..41227d29934e 100644
>> --- a/drivers/gpu/nova-core/driver.rs
>> +++ b/drivers/gpu/nova-core/driver.rs
>> @@ -5,7 +5,6 @@
>>      device::Core,
>>      devres::Devres,
>>      dma::Device,
>> -    dma::DmaMask,
>>      pci,
>>      pci::{
>>          Class,
>> @@ -23,7 +22,10 @@
>>      },
>>  };
>>  
>> -use crate::gpu::Gpu;
>> +use crate::gpu::{
>> +    Gpu,
>> +    Spec, //
>> +};
>>  
>>  /// Counter for generating unique auxiliary device IDs.
>>  static AUXILIARY_ID_COUNTER: Atomic<u32> = Atomic::new(0);
>> @@ -38,14 +40,6 @@ pub(crate) struct NovaCore {
>>  
>>  const BAR0_SIZE: usize = SZ_16M;
>>  
>> -// For now we only support Ampere which can use up to 47-bit DMA addresses.
>> -//
>> -// TODO: Add an abstraction for this to support newer GPUs which may support
>> -// larger DMA addresses. Limiting these GPUs to smaller address widths won't
>> -// have any adverse affects, unless installed on systems which require larger
>> -// DMA addresses. These systems should be quite rare.
>> -const GPU_DMA_BITS: u32 = 47;
>> -
>>  pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
>>  
>>  kernel::pci_device_table!(
>> @@ -84,18 +78,20 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
>>              pdev.enable_device_mem()?;
>>              pdev.set_master();
>>  
>> -            // SAFETY: No concurrent DMA allocations or mappings can be made because
>> -            // the device is still being probed and therefore isn't being used by
>> -            // other threads of execution.
>> -            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
>> -
>>              let bar = Arc::pin_init(
>>                  pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0"),
>>                  GFP_KERNEL,
>>              )?;
>> +            let spec = Spec::new(pdev.as_ref(), bar.access(pdev.as_ref())?)?;
>> +            dev_info!(pdev, "NVIDIA ({})\n", spec);
>> +
>> +            // SAFETY: No concurrent DMA allocations or mappings can be made because
>> +            // the device is still being probed and therefore isn't being used by
>> +            // other threads of execution.
>> +            unsafe { pdev.dma_set_mask_and_coherent(spec.chipset().arch().dma_mask())? };
>>  
>>              Ok(try_pin_init!(Self {
>> -                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
>> +                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?, spec),
>>                  _reg <- auxiliary::Registration::new(
>>                      pdev.as_ref(),
>>                      c"nova-drm",
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 8f317d213908..9e140463603b 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -3,6 +3,7 @@
>>  use kernel::{
>>      device,
>>      devres::Devres,
>> +    dma::DmaMask,
>>      fmt,
>>      pci,
>>      prelude::*,
>> @@ -162,6 +163,19 @@ pub(crate) enum Architecture {
>>      Blackwell = 0x1b,
>>  }
>>  
>> +impl Architecture {
>> +    /// Returns the DMA mask supported by this architecture.
>> +    ///
>> +    /// Hopper and Blackwell support 52-bit DMA addresses, while earlier
>> +    /// architectures (Turing, Ampere, Ada) support 47-bit.
> 
> This last sentence is unneeded, we describe what methods provide in
> doccomments, not how they do it or what the result will be.
> 
>> +    pub(crate) const fn dma_mask(&self) -> DmaMask {
>> +        match self {
>> +            Self::Turing | Self::Ampere | Self::Ada => DmaMask::new::<47>(),
>> +            Self::Hopper | Self::Blackwell => DmaMask::new::<52>(),
>> +        }
>> +    }
>> +}
> 
> I see you introduce a `Gpu` HAL in the next patch. I think this should
> also be part of the HAL - there is no benefit in having this method
> const since the architecture is probed at runtime anyway.
> 
>> +
>>  impl TryFrom<u8> for Architecture {
>>      type Error = Error;
>>  
>> @@ -211,7 +225,7 @@ pub(crate) struct Spec {
>>  }
>>  
>>  impl Spec {
>> -    fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
>> +    pub(crate) fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
>>          // Some brief notes about boot0 and boot42, in chronological order:
>>          //
>>          // NV04 through NV50:
>> @@ -292,38 +306,34 @@ pub(crate) fn new<'a>(
>>          pdev: &'a pci::Device<device::Bound>,
>>          devres_bar: Arc<Devres<Bar0>>,
>>          bar: &'a Bar0,
>> +        spec: Spec,
>>      ) -> impl PinInit<Self, Error> + 'a {
>> -        pin_init::pin_init_scope(move || {
>> -            let spec = Spec::new(pdev.as_ref(), bar)?;
>> -            dev_info!(pdev, "NVIDIA ({})\n", spec);
>> -
>> -            let chipset = spec.chipset();
>> +        let chipset = spec.chipset();
>>  
>> -            Ok(try_pin_init!(Self {
>> -                // We must wait for GFW_BOOT completion before doing any significant setup
>> -                // on the GPU.
>> -                _: {
>> -                    gfw::wait_gfw_boot_completion(bar)
>> -                        .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
>> -                },
>> +        try_pin_init!(Self {
> 
> What, and now we undo what we just did in patch 4? 0_o; What was that
> all for?
> 
> I did a `git diff` between this step in the series and the state two
> steps above, and it seems to confirm my intuition on patch 4: you just
> need a few more `Copy` implementations. They can be added in this patch,
> and patch 4 dropped altogether.


