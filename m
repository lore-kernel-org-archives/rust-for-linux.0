Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8098B350A05;
	Sat,  4 Apr 2026 21:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775338510; cv=fail; b=DG4zvGxaoh1920qzIIDdnv4m/cx4wYSV0iuNShlKXWn3Q+2H44AUqXwSiHb8wBoho85RCYlcX7HvI6t2u6ZXJUECBuMAgC+PuxLXUL9miP81p1ta8Fdz2+kxadeajIGpYi9nOeBu8gkuKV+HZ2otL1+ZIA+9QiuPhDs2dXd+dLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775338510; c=relaxed/simple;
	bh=HoUdUH+2Tnw2PD1ZkuRxMnwKiJrNOItxBw8fZZAwcEU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ENZ3FaI+OAypx9DCEECcoPgsyivXVmdXyMXErODAX37Ee1GYux3RahLngah9SS8s5xaDhjMuA9efGZ0DpVH/NmxnggFl5YTFkjk0IA71JJkSOI8Cq8M5r8w6v+bI3x4oqsheZtNRZnax+k4Vf9q+X5P3oPMvksSuR8WK5tvQWms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k5Rwllpu; arc=fail smtp.client-ip=40.93.194.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k5Rwllpu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+6pnoKfSYPDx0zAx4+72NVzRK0JyRT3RfNUii8aITEd9p1x/+luC7RHg194uJnmI2+N3t5bZoB7Olv00fzhfJ8NDVR+BnZk+1d7hauTVWzkrRnsO/4Fp5fRdDERy9LeS82PGUyGGuuimbJxBUjIDe4849gu3m6Lmn7HRW2mG0W4H4hmMef/XdO8iNdPBazl+Ec/3WhNgXLeVW7duZ+9uOMcU9buOmcmkzakDarqBWE8NVs8dAVoE2ccgu+z5XlIF9/3VonvK+DfgX7MIgUzV7/YPvt8D03V25WquB9v7qNS9tFtw5EBJxFJ9ncecu0Z8si5OM3eaoyRu1RJy10gOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRw6dhLNoTUMckxNOIpQLa6q6ZY3OYaspizFUF9OXKA=;
 b=RNXY6gIx1p1ynCrTLJiWUcWbJwsK04hw4aw0akQFzZxUD8d6j38DVdOmzjZ62rWNhtADiZ42YD6e/UtRINpQLp5VFHfYj7JwiLerFVEpyTuqafcpNBYEbrcfEImi/t2AsGjjyqBJGGPoFKVDSsEW9bKKIfE8uETtvMt+i9qg4vtfHtLRn4wYrFkmBIuATf2LORElrLZ2lGTYxUPiRKPRbLjkAbq/av4S/WhwWDc5GiHJxR7gBBv3AC2UqDnifCl+bZxhVIIjc0e78BOA+pHjNW8tQaHiGyluMMMlXKhY/rX0UEzcDwlEjNXn2uQnIWtAF8atSwA+xs34/URMxYVsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRw6dhLNoTUMckxNOIpQLa6q6ZY3OYaspizFUF9OXKA=;
 b=k5RwllpujtaIpCAJOkGYkFnRFRig8UlrJU9O3NvyJPEwbz9mjQkS0bxAMJBdINuG/80Ch1edjDYuDJgJq/27eWCx6TS+VZrbOeOkqLoQ2sgmZ4z/eCdwtoUtfbYYrXJClHA2xwGkNuSreOUemGXb/5m8SrEnuVDar2B1I8GB6y/iMQjtB3hUOejPKioZ0xY8R39xT7rMRXl8Ng/q65a6byjXo5tWvEvSOSTkaCCjb1nB/HQmmDnwYe57Q6rCNSen2aVXsNMytoHi5hrex6ps4Et52G/lQ5hyv5SVAGrpUet1ZCUQ9XiK7MJW5emnYLsIqb6h6LGdyuUNGbDFUoye6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8455.namprd12.prod.outlook.com (2603:10b6:8:158::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.18; Sat, 4 Apr 2026 21:35:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 21:35:05 +0000
Message-ID: <33128320-a33c-4020-89cf-9b8313b7d9fc@nvidia.com>
Date: Sat, 4 Apr 2026 14:35:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] gpu: nova-core: fb: fix clippy::precedence warning
 in read_sysmem_flush_page_ga100()
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
References: <20260404212831.78971-1-jhubbard@nvidia.com>
 <20260404212831.78971-3-jhubbard@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260404212831.78971-3-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af37317-ca28-45e7-d42b-08de9292096e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9tbVc2boeSsbRJbf5yITYxOPnlpbymzZK1y+uP9Frlke8yKmRci6AbfP7hXdJ4zd8DHPCMF1kDiF9/j1/TE+Mt8EQvXNexPxVMSpL6Ox0UO6C/NFtvfD1ErKsrTTDiRod0PYFeSWkDAgHLIGiCnxMugWrL5lUtrkE0eNt/CKt3NvOKzjj/h+vyrdNL2ffUrzsWj8/QLpug+cp+2Hl2PHQkrxOkRjhYDuBbYH37qrJ3aIHmL2XbZspN7PmHUuGaAW6W2IdsUTZ/oVaYsRORUtLswdRAtirt8VIQieNsREPvcDmeBKnxjKjqH9vhqOmNUWL0doy5jTO4/UL7O5L1jhR6jCePiNYfy+c5FflOHQD3uxUNRkvMGkA3MBS+2yAkI9COMOCn8iAhIK9xS7coiQiDNZe1BmdKusx9oy1Mflm3vKAAQYqBFskuQ3X8t6bF4cGptmnpawUYFhDC5QZHYJRTnpylZFc8rPVN+oywYvdtf5D1liEDMy4xfG5siSYsDTgaRRqn29MaX7GXvA+6KLMsk+Fr2r7Kguyoy8g9h19trKsQFS5jybYRTIHBCJWscGxos6bajYspcgiUGYMckXIKj2S+u/zRl5sa0xtALm0+86U6QSDwnf+Unnu2Jcvx3+2uM1QkERdHxZ3I2ulKNchFVGaINGbiXnR2d9P8QUzeZPX1eDor5X2sedUJ6ZG6rfQnnpp8mEtDisyJ2+qHya5QpuG8LQcy9T2sXvjvo+pzU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1ZMOG1Pemd6TDZ5cm0wd1VLWklDZU15YkpXekN5NlZoUU00dXJFSnJ0K2V6?=
 =?utf-8?B?SVVzUHRLV3NYVlNrR0JEdlZJc2FQZE5EamQ5dTVOdHhRdDk2KzBSWXMyUXBS?=
 =?utf-8?B?MDVPSGxWZHlNd0I1SXV5OERTSHNQcXYwbGVqUXh0eW5ERkhoRjVwb3IzMkdR?=
 =?utf-8?B?TGJuOTRCSWMzb0NaVEJNYnFDcG5za3I2ekxPMFFYbFlWU2FQcmVKTVI4cnR0?=
 =?utf-8?B?R3pmTDQ1U1dlT3BobFZvTFgrVUNuZlh1dUFmck1Nc2NFRzhuNTkyZDFKd2Jl?=
 =?utf-8?B?aHZXVmxnRzVvOXZEQWhLWWtQeWFYalVWUmdQOHU3NVVjbGNTekpmaDlIaUJS?=
 =?utf-8?B?ZVRYM1I2ZjNkYnRQNXJzQmJTK0Q4Zk9vU0UzUDcxaWk5ZUpyU3JTeGhrZ0s4?=
 =?utf-8?B?MzFYZEI1MGQ0ZzJzSml1TlR0akhWcmtiZHplUUV3NHpTc1FLR3VmZEdYTzB5?=
 =?utf-8?B?aENWN04vN1RHS2ViV1JHMVhMM1NZTFgxNU1ERWFUMENlSS9aTjZwYTR5Q1pE?=
 =?utf-8?B?QjhFU3pINkdiejM0ZS95VU9FRndiTVJUVlhqYkpLeHRUNnN5T1B1SjVHV1Zq?=
 =?utf-8?B?RXJ1bklMa3p6YUVJUytSTXA3T1VYVzdpQkpuQmZkNG9VR2ZGZ2s3dEFwSzVX?=
 =?utf-8?B?cmpnL2NGMGF6VFgyTmprNUtJYjBRejd6Z2dlbklVSlpSS2xpak1XRDNiOVM5?=
 =?utf-8?B?UERoWloreVhSZ0hUQjR2Y2F4MDkvcUZZWVBzNUg5MXJ4Q09BRkIwQ0hKRk0x?=
 =?utf-8?B?eGVNSjVyKzF2WXhaT1JVQmZoR2lLTjNZd1VWelk1SzgrQ3RZbThFb3ZEUnAz?=
 =?utf-8?B?ai9iMm92RzI3WE9MY0NnUERhSFNhMXpIMUR2NGRXUzJveVg0WUl2ekE5SWN5?=
 =?utf-8?B?by9GK0tEY1NQeENCTTBINnAwMERTTFZTenA5MGNaWlhNZ20rb0diWWVZZDAr?=
 =?utf-8?B?allPdHJoTEtsQlFIb0w2bytQRmw4eVNqQjBQeDFyZXR5Z3BjWm5Kd2hueDBm?=
 =?utf-8?B?SDRrTEthanNWOTdTSGtHc2FUVDEycGU4ZXQ0LzJ3bjkyY3RRbUtXTnFtY1Rx?=
 =?utf-8?B?VFRnYmVLem5CaHVSMUhBR3pIT24xdHJ1UnVGYzF0WGNGMTFIWjVyRlRqTDFR?=
 =?utf-8?B?cU5uZnkzdmhkTWZST0wwcWlGbEFzM0tYZDBOR3dUYlNiUzBJc09LdG5NOWE0?=
 =?utf-8?B?Mms0c2U3Q0xXVXh1eWJBSXhHd2VmcWFaNmtNZ0R3SUZINGRpSGJac1VtWnZx?=
 =?utf-8?B?ZGtEY2k1b2dNdWNuY3o0TzFIMWRCZGVtQUZFbndtcm1CdW5tcE9DRjZkWDlR?=
 =?utf-8?B?c243U0QzOTdvMURZeStOMTlKYkhvLzZEc1NlaFRqTWZQUkhHdkI3SDlIQ2E1?=
 =?utf-8?B?TlBPcHluT05XOGxHWC9lS0xtTjYxdUMxSlE1T2RrQVNDVk96SUN1bGVKQ3Nz?=
 =?utf-8?B?OU02dG9PbWhnRGZGOWVUQjY1Y1dhQ29xTzVLWWJMaEJGcjFHWkt6VjJleTRN?=
 =?utf-8?B?cDJwNkhPR3NvYlMxTVpiVEJIMVVkZndZSHJvVzBUSFVYRGFjV1dTOWxuYzNs?=
 =?utf-8?B?V1E0VXJHV3JWTXNTNWV6Z0ZhTzR3cGlyRW1DUVIxSnkvU2FZY2swdXdyYXli?=
 =?utf-8?B?cWlEdVdPaGdyMUhwYWdIWXdDM3hHSUxuUEdXVXhpOGZad016bmZqcVlGVzdw?=
 =?utf-8?B?TjVpakNIUDczam0yelhhdUN2ZFh4ZGdvN3pIamppM1NsdEZVY3JaZmhvU0hO?=
 =?utf-8?B?bFpCSGU4QUdQODgxQW9EclpFaklSdERmYWIwdzlibFp1d25wbEVDNTdWTllT?=
 =?utf-8?B?ZnNzY01teVhaejRCeGRteWVqdHFQTkR2djR6Ui8wd1ZPbEFjZERhZk0xYVpV?=
 =?utf-8?B?NzFoMC90WFBBQlI0YktZVWVKTS9MN1FoaWpoZCtVYjVaM29wdzUxUngvbmMz?=
 =?utf-8?B?S2c3eFQ2UCtuaXlaUlVuZEQ0a3pVQzBTNE9HbzVPSmhVMG1iTUpST3c5bmNB?=
 =?utf-8?B?LzBTU3NOMGM3cGt5MkRSbFRsbG1Dc2Z0dDhiVUhqZHNDTFNNOS9RVkxGUFBH?=
 =?utf-8?B?TWpvVDdDZkZEcnd6YkkraFNKQXIrdnc2RkNuMTZGYmFDZWx2bHJUZXMxeHVa?=
 =?utf-8?B?SGFhS2ZadUwvNFVZMTBuQTVTOFN3N1FIQTZ1RlNoTTRFcjB4ZWRGVlpzd2VX?=
 =?utf-8?B?eUk3eU85ZUthOVVQazBBWTcvYS9IekNValoxMEl5Nmo5VUpUaUl5UnJzeTlX?=
 =?utf-8?B?OXJRR3VDb3dDUnhKTmF0WGR4RENlcVpTMFBLSHBDL0tqUTY4Nnl3WW90UERk?=
 =?utf-8?B?N1RoVVBWSzFETTFWUHNTZXViRnlZYWFKRXFMaTJtNFhNdmNQR3ErQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af37317-ca28-45e7-d42b-08de9292096e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 21:35:05.6151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52E6STIjUAfiSakjHuzmQqoyiyRkqK9k7/wc0yh7C5nryYikpqEXVz7pu3iaD64C1+UR6X+rzMWbR4GABZxZIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8455

On 4/4/26 2:28 PM, John Hubbard wrote:
> Clippy warns when shifts and bitwise-OR are mixed without parentheses,
> because the relative precedence of << and | is easy to misread.
> 
> Add explicit parentheses to silence the warning.

Please disregard (drop) this patch 2/3, because Miguel is removing
the associated lint, so we won't need it. 

> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb/hal/ga100.rs | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
> index 1c03783cddef..b5d0f04198f0 100644
> --- a/drivers/gpu/nova-core/fb/hal/ga100.rs
> +++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
> @@ -17,9 +17,10 @@
>  struct Ga100;
>  
>  pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
> -    u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
> -        | u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI).adr_63_40())
> -            << FLUSH_SYSMEM_ADDR_SHIFT_HI
> +    (u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR).adr_39_08())
> +        << FLUSH_SYSMEM_ADDR_SHIFT)
> +        | (u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI).adr_63_40())
> +            << FLUSH_SYSMEM_ADDR_SHIFT_HI)
>  }
>  
>  pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {

thanks,
-- 
John Hubbard

