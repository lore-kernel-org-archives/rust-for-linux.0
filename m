Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A583C225397;
	Wed,  1 Apr 2026 20:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775076371; cv=fail; b=YDjjiPHw3fL071ypJcAqySO0pFH2OwqSN31CCVp/6LAUtDf+p4gGMPYw3In1gM2t4KfGra9YPFfvlJSAxxHUE5xI1pbqh9hdWp+FPjirWevIWVwaf2qDJqlJ9CohBYyrGT73zlfhS0RNExU2eiwGmv7xcaMIRyZeovMpSksDC0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775076371; c=relaxed/simple;
	bh=Lv6tMCui/sWpZN+ck+H9ks8pVOnA8wcvl0Y6cZcQIUk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZO8igBIwxmC116WcMwxDKt2mIqadKAQh9v+pD2rpbNVzU6HfoVDYFLWObAUIGewkO0gLxssiZZrj0aNyjetuep+VLHBGcYGHCzBlSXskFJFaMUdiBXi/YfpOTTmwws6pshkkJ/qaA47f5Z6VRgwVJkFJJvvoo46qjf7xiF5W8U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RqXlRmIJ; arc=fail smtp.client-ip=52.101.85.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RqXlRmIJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1mchm4GjRk7CFOov9wmRwoVOS6pW9AGFMbkuKxF5lg5EsPEWGSJz6eSJV+t+RLl8fn/6xLOnXMYAvmCeBaxKCeotGEiRKI8lTJTMK3GQSnVuIJkZihwtu15ZT/NhY5S4v5GjyMSGMm9ZvECGXaiWmyUtndqhT2F5cgvI9feroTzy60PYZBfjMtcJ2e7Fk4/IwEzc06uwm10E78p6/EkOA10Lc+ZK01OmiaZDBbyrP/NsoHcmrrZlmRi3hBp2c+fLK80LZX1Da+cSWq4nX7jLRpDIaMbRd1y20x2HfGP/X+M+DQ0ZNsXI7vI8qnE55Ca2VJS7XjBv1ZiHmLFvlAa6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S164bazk2TWLG4wKAdFRSjM2vHZBajslqd0LP+osF4M=;
 b=O/oezyPSBOZzQWbRAcXAsCoePiVB9B3pe/CnPYXP+8jfjEXOjuf9n9xjzba7+rvlrvuoVF0B+ALZk3C+MoMWP48x6sV2BwfJ92trsVqxzOHGiW51hXogTIsPjkbn4TT1ZjSsN75tfbKZVYDX/dAVF3yzwE/QPJDp5FuhGaOw/axV3A323meH4HZVrM9sgs2fMPjj07VtrwiurBan/SzYQu98P1s6YjH1Mq34JTVQwGdwMicRlqJ5HcUCgUx0gHGyYBqXJzx8uXpAKt4xdNEaN125CcJt36gi71a574E2hQZqvJxRU4ofA6+USypZu2LqN90mB74A3KQl5NRZ3ZbO8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S164bazk2TWLG4wKAdFRSjM2vHZBajslqd0LP+osF4M=;
 b=RqXlRmIJ6DHYy68QPFfmr8g/AeDKivy+YZEaTRLB0nLfWevFbIV/4MHkI57rmsEwkMYDh4IwP+2jSfUBzkwsBdl7yD0jeDOIIE3kpL7ILeeUwAT0EBxgwf/XsTVUywuILBFgr/lWHpS3Wg1vyUyGhJeD91l6/tMqZOwWAw7vjk5j1vTjgzu/sHkX5FWkQNYsKrEECUvZgXDeBtZwr+O5kelXm0XOoeAIF4mI7wLyr5VwkWkTfkW6ikOjNYSEo6iFq33BEUSC7L4FeBgevGul0tpRzQAyE6fTK3o9vNKMt1W4ypxR/8/kbTiYnDOMpXcifNDxl0NTCGChbgzF0FxGUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6954.namprd12.prod.outlook.com (2603:10b6:510:1b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 20:46:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 20:46:06 +0000
Message-ID: <17e7a92d-c421-425b-8da3-39ae857c3f95@nvidia.com>
Date: Wed, 1 Apr 2026 13:46:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] rust, nova-core: add DeviceSize trait for SZ_*
 constants
To: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Shashank Sharma
 <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260331224319.107082-1-jhubbard@nvidia.com>
 <DHHMII9OBE1R.3DFDGQW58X9DJ@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHHMII9OBE1R.3DFDGQW58X9DJ@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0032.namprd08.prod.outlook.com
 (2603:10b6:a03:100::45) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b89c362-f322-4b57-3147-08de902fb23f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0bGWIIWeICGAjfpPrIVA8idMkgX6J53mrcS0wXG4wTZpfOGv5kue+dflhsqrv7PhoyUkqTOMSifEV/9CJ614AbGjhYn9dA9wywq3WApnnud4Th0H+XHaaYTnzxRkCuVJReUR4dWok2ouJJt4QGAkfATcW+ma/htuJOGlLd+VYGZ8y00Q63McMFZXmI6TWsuE1taXnJ0UsTKyBdXBFfAIM38z5sd4gLuh6dSBoCzh9SbiFjEhEqp91OXKA5s3I+SvGQz7r3b2wyZAoD5zZCfaWm5kxZ4MCnUVOksglOreATwBX/AMyWjl2nJ0umP3dThy77awnNXRoPpMnXSFnczFcW9tvJnMh50HnzMzKlHxQLcubbT/cek9gXJHE8Ix6lE0f1/eBXLZTEPigyot/xGmFLKYfoyHJZNrOmLRDZ0whhgeqrlOCIA1QjMkwY+YkI5PVWh3Q3qShz5jKNVxayrMsVmcAJR8TKrCflS+PoiVahHQnaJy2oOZimBnHQxmGGaMEok9cE0kjhSfQjbTKmxr+hXJhoV3OzCalrzHy6EiS7qzehsR0VnzCYP0g3sSazGI+K/pR3dQUnv2GzD/juSx3ubqyQArj92sTqQCcYXlxwtvYP+CkRVdaixPQxx+4mvORN7EM+9vScafhixm5VHlLgQhqTOFHGeay27nU9Iv59glT4P8IXryj9h9pq+FzrsSTlvp1QrsTak7YTc/fQIpNBUfbVKMd4TglAA4gdwoj+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3IvVDNhS24xQTExSEhSTmhKYk0yTHFzYmY1QXV4VmZOeXVTUkE4SjJJNGFX?=
 =?utf-8?B?aXBKaGJNbjBaeW1JYUVIYm5ZM0lJaFF3cTd1Rm9IU2tseHB2OWhndzRYZ1FZ?=
 =?utf-8?B?UldJMjFSNTBiQzRvcGl3N3MzWFdQOGF6SHE1S3BvY2tBS2M0bkFaSnQ3WUU5?=
 =?utf-8?B?VG1CMk1tT3BNU2RIaFZ2eUdLbjBUNUFZc05SWkZnRzZVanpFR3gwd1l5K2hv?=
 =?utf-8?B?MVRQVXFhUDZKaWE3NGw0eFU2RW1yekQ4ME5lZVNJT2xxemNXdzFTYWRabXRx?=
 =?utf-8?B?dmdLdERFWG10QWh0RkRHMDRHeFBYTXl4OGNITlVJZ1FxTm16bkFYOUxDaStR?=
 =?utf-8?B?ZGJiVDBYU2dEZnpMMG5sZC9EZmxVbXBBNkQrelc1YWVaYUtkaTU1WUs2RVJ2?=
 =?utf-8?B?VmEzT3pxbFlYOWlLWmdTU3ZmMkEvTEpuVHNtbXd6TlJxRVdEQWNlRng2MmVW?=
 =?utf-8?B?VlR2OHdsY1Vqb3FBZTJoNVB0MlRZeUs2TTlVN083TExoS0h2SDVaNWh5OERI?=
 =?utf-8?B?NCs3NzBzUFhpem5Xc2NRTkl5SlN1WU5rcTVhS01qckF5Zzgra3ZpUlk4cmpo?=
 =?utf-8?B?QWlVQXVFV2hBYk5jZjVXU0lBNUJVc1MwM2loTHNMalNwQ0N6eXJKbWFuZ0FI?=
 =?utf-8?B?Mnd5ZlQrV2pCa2NjNTRCdk9EallvZU9rTmx3dVRHbjlJUWNwTktWalN2Z3My?=
 =?utf-8?B?TE9vdzR4aFlKUjVFWTdlWWdUWURWVkhrU283TTc5VW01QUp6Ynd5Y0syeSsz?=
 =?utf-8?B?ZzhTeFBvaUgwRXV3Z2VZbXRvWlBOdnhWc3VwSEg5aTZOSWJmOVJRcjlJWUJW?=
 =?utf-8?B?SHViekd5WDg2UmR4U2w3K2RJSlQwK1NkT3AvYjZCdnJ4VWxvN2hUM3JaNXZq?=
 =?utf-8?B?ZnZsQ1FFUGlNZzd0ZmJCL2xzSUh0QzlTVStWMjVYSzVsRURxTWpzbnRUV2Fq?=
 =?utf-8?B?QlZjUk9vek03K09VZEhOZDdrcW5GUkxzTXVaeVJlZ3ByL2t6blFWbnZ1OXo4?=
 =?utf-8?B?RWNMWksvWHdQUmp5Y0tYUWZqNjBkd3E4ZDdvektLdzZidXFnLzVvS0NhQkFi?=
 =?utf-8?B?bnVDVElScDhiUjFCRFNNa2FPZmdqVCtOaEVIbEpOU3J4SEE4M2p3TUNzLzhR?=
 =?utf-8?B?QlVXMGZFanR5bE5MS2tiRmZua2lDUm1zVWdmVXhJekNPZEpSNXlub1MxbjlD?=
 =?utf-8?B?eXlZTFk4NkI5UXBjcGk5M21Qc2I5dXU1emlkbWp4bjdtWjVVblU2VGthSm1L?=
 =?utf-8?B?bVFpcnFmdXhvbXdUYmVNQUZWZERMdkZBSVl6VjJBMXJXQWtSQ0RhMi9pZVpt?=
 =?utf-8?B?Y2lQRndDbzJDQUxOTVdRNk9QMlp3MWFMSXpvQytBQURVVGI0MXhaMlhEbzE1?=
 =?utf-8?B?amk0bWo1TVZhb2grYlJ1dTIvcEFzay96eU5Jdzh1TUNKZTluSU1JeFdwa3BF?=
 =?utf-8?B?TWV3czJEc3czN0U0OW9Tcm03RURJOHRCNEJnMDcxWlRLTlpXeUEzcEl4bjI3?=
 =?utf-8?B?ZWIvZmZORi9waHc1bmwrdy9yRW1xaktBak5OcjArSCtBY3RHaFFiSFZEeUxt?=
 =?utf-8?B?eERFLzdSYlV1OE5Gc1l0OGMyUnRYMUZyNXQvWFVIVHcwWElCRkwwbllobDZ4?=
 =?utf-8?B?V3o0YWhTNWRWVW51d0hGa3BndmxZUjJNbkxTd2RzMVZMV3pDbnJVRmtMcFRP?=
 =?utf-8?B?dkI3T21NSm1pWUZqeWh2OEhXb1hka3ZGb0t5ZldmMGxWQTU4dGZEaUxOMUI2?=
 =?utf-8?B?bmowQUlCY0t0SWhkeE95RHBGaW9qQ05kVzVzSmdhb1JOWkp6TEEyZGlCNURL?=
 =?utf-8?B?SEVFb1AyKzBleGxjaVFhU016Vnc0ZmM2c1JOSEFNODNqNThDeWw1enJ0WCtk?=
 =?utf-8?B?OUhoQWtkTStmV1ZjQytRT1pNUVRzSnRpbzRHbktYQ3JHNnBzRXFEanJkRU84?=
 =?utf-8?B?aWlvait3QUc1a3BlaWdpM3owbGhRZlA4VVFFTFprTjgyNkNNcE0ydFB0dEV3?=
 =?utf-8?B?TC9mbGF1b1paaEZieHpCK0lTQjYyRHpmMkU4dDVvUDkrZTN5QVBITXFpeUt4?=
 =?utf-8?B?WnRYcnQ0SHNYSnF2VDVXek9aeWVRUXB4a0NiQWIvbkR0cWN1bHJHUmJzZEZ3?=
 =?utf-8?B?T0lVTWp0TGlpLzFBbXBjR1B4ZWlzaTFUOUtTeFJ6NDhEMDlxejdTREQrSXVU?=
 =?utf-8?B?bnlKL2lNR1h1T0N5WDhQeE5jSUhtTEpVZUhxa2FuaEFVRS9EZllrWWVoZmFy?=
 =?utf-8?B?eGJ6MGM5VVNvSEZycmR6R3ZsV1hOQVBwazlPMFlkMHRaaHpMeUJLRjdKd0xS?=
 =?utf-8?B?emJaUTRGRmEweXhBWUEvMXFmbVU0OVZLaW5ITWZxYkdLQWVpS2N2UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b89c362-f322-4b57-3147-08de902fb23f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 20:46:06.3474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCfNxvp11bCf+DE7R0hbEMp28l+fuBdmQVa9090gcuQkBXPyXPjPt7XFWE5cJzN3aJq9wjjPd7RYYRTNdJvLMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6954

On 4/1/26 12:01 AM, Eliot Courtney wrote:
> On Wed Apr 1, 2026 at 7:43 AM JST, John Hubbard wrote:
>> Changes in v3:
>>   * Dropped the Alignment::from_u64() patch.
>>
>>   * Reworked define_sizes! macro to accept target types as arguments
>>     (define_sizes!(u32, u64, usize)) using recursive macro arms,
>>     instead of hardcoding impls for u32 and u64. Overflow checking
>>     uses u128 casts so the same assert works for any ("reasonable")
>>     target type.
>>
>>   * Added usize to the DeviceSize implementations, so the trait
>>     covers u32, u64, and usize.
>>
>>   * Hex values for each constant are now proper doc-comments
>>     (forwarded via macro meta), instead of inline comments.
>>
>>   * Rebased onto latest drm-rust-next.
>>
>> Changes in v2:
>>   * Replaced flat SZ_*_U64 constants with a DeviceSize trait that
>>     provides SZ_* as associated constants on u32 and u64.
>>
>>   * A define_sizes! macro generates everything from one list of names.
>>
>>   * Added Alignment::from_u64() so alignment values can be constructed
>>     from DeviceSize constants without falling back to usize variants.
>>
>>   * Rebased onto drm-rust-next. No longer depends on the Blackwell
>>     patchset.
>>
>> v1 is here:
>>     https://lore.kernel.org/20260310023145.120037-1-jhubbard@nvidia.com
>>
>> John Hubbard (2):
>>   rust: sizes: add DeviceSize trait for device address space constants
>>   gpu: nova-core: use DeviceSize trait for u64 size constants
>>
>>  drivers/gpu/nova-core/fb.rs     |  21 ++--
>>  drivers/gpu/nova-core/gsp/fw.rs |  15 ++-
>>  drivers/gpu/nova-core/regs.rs   |   7 +-
>>  rust/kernel/sizes.rs            | 166 +++++++++++++++++++++++---------
>>  4 files changed, 141 insertions(+), 68 deletions(-)
>>
>>
>> base-commit: 7c50d748b4a635bc39802ea3f6b120e66b1b9067
> 
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> 

Thanks for the review! 

thanks,
-- 
John Hubbard

