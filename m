Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013019.outbound.protection.outlook.com [40.93.196.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE0D2AD35;
	Mon, 30 Mar 2026 21:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774906286; cv=fail; b=GPCsBpQAq3rpkbh9JNWGWMa0ZPOWEEjZOySUPal8RZ1+DEHbYw43t7z0hQrOoTcwVXRKF9Qn3f4SjqGRxAOcJwIAI+EuxT5PJHJFOBngdT5YJnLkqxBxBY4gzU/GhMWWFClebIpyeTg5KakNM+XGP1eJiIA38uKYfng6qbq0gDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774906286; c=relaxed/simple;
	bh=oEvodPg3AyWc+Ca49Qq+N1OcQz3C6G/Q84qCvMkLWJQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IY8ylzz/sl5DxPPSdPmNZthWSfx9USZeBn3eQeZ0Dn7/X7rNyBmPY/4m2JAGt6qTLjMpEpAPT5oV+59EPCHmdRLzYTG9wCe5n7VUatQQ73jwNNJj208V1eafj450xG/VGJ1uVdEzQDT0l6obK1sOkQGye8WGMSSK+qmHi6rpMZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ry+IlNkO; arc=fail smtp.client-ip=40.93.196.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ry+IlNkO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AM8QJFS8rd4Y8i5uxDEWSfXEaTSZlkass42mlfxs/mmJK/pZlxJhuZZLWzXqPESQ5o+A2fd1QKM8+0D9S5u7T/73v0ROm9TZ4+duAE4ATLru5VwWt6loTQOBLYw8s4+Wg0HcdEIhE/zcr8od7c8g+Ui5VWtV7pFMrFOfs43xy99nmd+oBj+ELbZEzLO/UUgVWTXeBXyFms1O2j3fb5Usuj6gDNfTeM385SixU8qPkpH2+dCDLMG11f3BTtSOqzcf7FPgk0ZxTfgkb0UaNsXLcipI39K1FykIlyMmBGt/MZr0EEhwYr0f8KISZ3SZ+iy1evsW4DLqHimOECoa5KJ9Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eUvu+ItuXYpvh5x5VaqSwi8PC45Mt/WNLGjTp2JuGk=;
 b=OMQXBMP5YBvA/s+TqvPPOwRW6sLh+CUGel5ahLZ0Jg/tpHqtS+NzMcOpsLnzpMiiGwI9sqdUYmtRuneXeA2nX1xVVl9xUPI9jStFDxvFgjRz2EqjBxM3fgbBMvfvZe63ZuiUnEbKFm2NloGlEw6vOuPj9EfbT3+6K0Id8Bg07DX7owWLvRWqt5pLAIm5/YeH/3TTKQTp2pOpJa1+FslJtp7xeM1NItxUqnsueBxPzFi388niUfNm7jhKmlfw0dR/WMAjNFLxlTEQQJXS2v3CCHaSbSrFXmb8q5CXhqKEIUHcFBA1W9WtGP/coSp8r8L/dCtfsV9fkMR1FEKf+PsOIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eUvu+ItuXYpvh5x5VaqSwi8PC45Mt/WNLGjTp2JuGk=;
 b=ry+IlNkOsca/Mqn+++g+7nxnY/Vo9/Xh/iAXwwJ2z7DjrIHyKADTcaE/jd8a/XCCPdX5uwOyeN9sU3p1b+C8/jVonpkqSBS/FZYTLWTLxl1FOimtbQ9ROaHrSfyvHemZtgnWuQcdW3jnNsWrhjiNuVEB9p7fcnvhFHg+qulsy1JH04urV8CEyWIPNuHBildLZDBJ+nByPKALmF4IiayuOiYEr/fMVNycURvQOlMROEbBN5SJdWkHiU6sYRKQLMmMrTKkDrK3wMe2i4AtvPwRBtHATHfJsk+iSVBS+k2B1kDy01q5nfvKjARvX2W3BxTQrSRP86wXSzMRuhHGhQENfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV3PR12MB9120.namprd12.prod.outlook.com (2603:10b6:408:1a3::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Mon, 30 Mar 2026 21:31:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.011; Mon, 30 Mar 2026
 21:31:21 +0000
Message-ID: <f68c4499-f7b0-45cb-89aa-9712f5f465dc@nvidia.com>
Date: Mon, 30 Mar 2026 14:31:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/31] gpu: nova-core: set DMA mask width based on GPU
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
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-6-jhubbard@nvidia.com>
 <DHG6UVT0SZKW.16MQG69Y94IG4@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHG6UVT0SZKW.16MQG69Y94IG4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0216.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV3PR12MB9120:EE_
X-MS-Office365-Filtering-Correlation-Id: 604468cf-8c06-4bcb-2596-08de8ea3af7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1+OYi8C8AklTsXhph8WOWj5/4XfZLnEgrN/wgPWQBJ0ihWREhxoYTFvdA2GyVIuXuVSSdDAzct8ntRPc1Coxm5mnZmuhFrJxiTE3aISUX7aXUcvopZHP0WU+K864/gnenq3X4JNEZ9byDUKU/4IBzJoCoHSYg4qS5sLxkn0vS1k1OvMr9uBmohkH3vJqExe64nLWYUfTdf7NgbeGdWs3YHX36EmN24bM3pWoNwNgaDV6s8pt/BPF4bK7OhHfRVzNOh5DSLYsOdsZSCpLBgG+h0FJxArt/iULqZBApTpyv3HjNBQaboNx15shLGC/+cnHySBssoNkoBBHuBTQj6MZI0BL+6K5vobmzgwjakFshepmg29xCKcjO9+puvy+Eswre7KEoahplxDrclq8EWnnEwYcqKZeYV16YiBswkbaPe2n73ZMNBrIXZWwkpIuoeoN1yR7gBRVoLYVV5K4SiULhHuJwvfWYDtIb5a4LBCQZe9DwFtHJRYojzMQ/ttIw0sF/uOiLhKHRc80bqOpba5QBLI4hQg1/z0TKInvf94JeolChZohwoEsQmVgcwBac5ZHeibq43pl8mKETd/U9ddoQkvm5LSwUukg79ZQSkNB45xHwP4F61GdMKaNRV8V8m29lj2mjRdP4asjPiIva0G0iD6GWYwbyjzNNeClq6XinKtMQH6JfcK6ha2s8awxb/jiKLtJHLf6FFjbuVzgnkBkdoKhnhtWKcmR66Q9foc9yOI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clpFZzdEU0lodWx2NlBoOTdVVnpoaWhZUGxzUmNFcDBtL3NiT09ySURTUW9H?=
 =?utf-8?B?NHcvVEUyazAzQzBSUjRnazFQWHczNm1BeWZhS0c4WllBTXhYL1FUdXVCRDR4?=
 =?utf-8?B?UW1YUjk4RVEvYjk4VUVCbmJCczc1OE1TQ1FCS1ZPWmtKOEhESlkyTzVHN3BR?=
 =?utf-8?B?V3ZqQzUzOVFDc3NzRHNwSHBSaHJ3MjJYRlQ2MmpwMlVGdUpkZkNNMmI4TWdG?=
 =?utf-8?B?OFRFSnJYc3hOUFFRdUhyM2JaOVZyVXMyeXV5Qm5ZeVdYTHNpdjViODJTaTJM?=
 =?utf-8?B?RUZLK3lrVEFZQVRqenA4QUU0QkZyRXZ6UzhXZXVuRHozMVd5WTRpVW1ST21Y?=
 =?utf-8?B?LzNFOHZFdjdibU9CK0JlRE01NXM5QzJKbVcyVm5UQmV2SWliRHVqR2Q4T0Jt?=
 =?utf-8?B?QlNCS0p3MjBCai9HOWVsclBKS2FQODFDbDJGeU9EYm1ENVhvM3pvSmdYTDNq?=
 =?utf-8?B?N0N2Uy94dTZNTmZ3YXdRZzBxWW94aE9UVjIwTXMyaEprM1pXZDVCMitjUzN2?=
 =?utf-8?B?STJiSW8wR0VJM01SNHJJVHlOa2xORy9VL0JUc0ZkRktGY1FtaTZvV0pkSm45?=
 =?utf-8?B?SlpEUDdnZVFHQ3N0QVZLVERoRE9PbVNnR0pSNE1qM2RhWGxxNXY3eklJSFAr?=
 =?utf-8?B?YUNaMUJJN1l1WTlCdjhBejFpSDdHKzVjZE5Jc0xPTE0zRDVZV0xIUkxFRHpi?=
 =?utf-8?B?VlpFdHVVS2lMUWF5MnI5Y0RQcGJzTDhlYyt0Mlk4RFY4WkJxUTBJL1FWa2NB?=
 =?utf-8?B?b2srbWxheWhCY1kzanB3b28rREZLOEozaFVudDFRQ2dCVHZaZk9kckNMZzFx?=
 =?utf-8?B?TTNzekdsbkk2WHNndUFFTmF3SVNuZklTRGgwWlNOM1FXSE9QV1dyd0cyY0Mz?=
 =?utf-8?B?Z0V5T0ZuZzhUWjJybXJtUGFURlJsQ2F2UjlScWovM2hyUHV5TkZJQjF4dnU1?=
 =?utf-8?B?OEptaXVpTC80b2xOanlqaXoydkRUR2RpNTBEMzRzbGw3NjlaejhocEtSdXhG?=
 =?utf-8?B?a0NFNU16aXAyUlo4aDdCMFhUSElhdVpUR0hKOHRqNnlqek5wbU1ULzdiMEQr?=
 =?utf-8?B?QTFqWVRuc3l3M1h1Zy9nemptc2VWWTNzQnhaV201V3k2dTdiSkJjNUFOWHBy?=
 =?utf-8?B?eklQM2tnT1NiUXdLS2NURHNQTUZwRmxBbmx2aW8xcmxWY3hWWVhuMlZGc0RD?=
 =?utf-8?B?MW9RUFVzbnZIMWowQjVyT0Fhb25zdG82UmFaR1g4MjdaQTI0ejBnWkF2S3B1?=
 =?utf-8?B?U1ZiaS92cnZkdm0rOENOLzZ2VlpuK1M0QndPNXdZU2l3UkZTajBPb2tMZU1Y?=
 =?utf-8?B?VHMzdEh0Q0hiR3FsVUxGVUp2YUwyR2ZqQTB4Q0tmNkZGZnMzc1p5WUVWa0Vq?=
 =?utf-8?B?bkswRm16ZEtkSGR5TUVGT2tRdmNZRDNuWWhrTXRrUjVPc0tuenFtZHZkbkR2?=
 =?utf-8?B?U00vdXlGekoxOEEvR3BvWTFmRmljSk5GRWpVcXVuak45bDE2YmdBWEhubng3?=
 =?utf-8?B?aUR2UTVObEtZcVMrOUpEZ0dWNTIvalJHNEUwd3hweGtnM05ZbEpKNnNNUXZI?=
 =?utf-8?B?QWlobW83UzJKa1Q4My9zT0xtbVJTN2JDMGp6bHgxam9XT1YrSXBTbDROdzZu?=
 =?utf-8?B?d09FSnptOXhKRGo2QzdaWGhjbFZPZHJDY1loUDA3MHkvTnZPN0FLTGpCRGZB?=
 =?utf-8?B?enlMT0U5Qzh0TnZWcEk4MTRVMHMwSU1tSmJSeTN1aDBQaVJxRTdyVVd4V1ZI?=
 =?utf-8?B?QllHUS9aRUlRNnNUZWlQTUV1T2ZaNVh0Y2lBUDdkbkptWWxzUVZ4RzRJa21J?=
 =?utf-8?B?aHpSZ2RjQ1gzWGw3K3pqRnNKbWFkSHpMU0tpR3FQd2FYRTFENkFmdkVXMDdy?=
 =?utf-8?B?YlBINjFvRlpqR3U4a3d0WEZacGpBSzFDcmp4TGJXRlpneng4V2dUa0VKQVht?=
 =?utf-8?B?T3lHQlh6WlZjVEpLQzZZMUV4VzFQajd4UG8vNEcxdFU0NlhiN29ZYnVKQ0oz?=
 =?utf-8?B?d2FsNXFRdE8xMUt0NXc2UzJoNUpMcDMzSVc1eXJCQldhd2JVYmpPbElEY3Jz?=
 =?utf-8?B?Q3c0VVFpRmVjYVV0ZlE4L1VIdnVhU2dXNllMeE1oLyszNVdlV0U0dG8xdlNr?=
 =?utf-8?B?Vkh1MStkTnRHeGMzdlA4dTZOODlock9HbVB4R2oyblNacXcvbTFXOFJqVFZX?=
 =?utf-8?B?RmF1WVNBa3JCc1hLeUF2QTloZ0RmdGx2RnR2ZzFTUzBtZ0dHT3huUFMyVkVn?=
 =?utf-8?B?b3JFOHVaWkVWMWNEeE12OE54WUNEMHRVWVRQN0JrNENOMHJMMVNkMVNSQkJQ?=
 =?utf-8?B?VFl1MFQvcVZnbHVyMmp0dXlyeUJLTjl6ZXpNTHRqWWFadXZreHNyUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604468cf-8c06-4bcb-2596-08de8ea3af7b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 21:31:21.0705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIVYKifg68SkJY2ENWd8oAoUi3BK0ACE6fffICC7NUadcAId7l1adMzszuuBUk45t3e0Sf6XupBnMQ8Q2vNTbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9120

On 3/30/26 7:32 AM, Alexandre Courbot wrote:
> On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
...
>>  kernel::pci_device_table!(
>> @@ -84,18 +77,15 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
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
> 
> Now that we have moved to DMA mask into `Gpu::new`, what is the point of
> creating `spec` here? Its sole purpose is to be passed to `Gpu::new`,
> and that doesn't change by the end of the series.

Agreed. For v10, I've moved Spec creation back inside Gpu::new() where
it was before.

The original reason for pulling it into probe() was that the DMA mask
lived there (per your v6 feedback about the safety argument). Now that
the DMA mask moved into Gpu::new() with a better safety justification,
there is no reason for Spec to remain in probe().

...
>>  impl Gpu {
>>      pub(crate) fn new<'a>(
>> -        pdev: &'a pci::Device<device::Bound>,
>> +        pdev: &'a pci::Device<device::Core>,
>>          devres_bar: Arc<Devres<Bar0>>,
>>          bar: &'a Bar0,
>> +        spec: Spec,
>>      ) -> impl PinInit<Self, Error> + 'a {
>> -        try_pin_init!(Self {
>> -            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
>> -                dev_info!(pdev,"NVIDIA ({})\n", spec);
>> -            })?,
>> +        let dma_mask = spec.chipset().arch().dma_mask();
>>  
>> +        try_pin_init!(Self {
>>              // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
>>              _: {
>> +                // SAFETY: `Gpu` owns all DMA allocations for this device, and we are
>> +                // still constructing it, so no concurrent DMA allocations can exist.
>> +                unsafe { pdev.dma_set_mask_and_coherent(dma_mask)? };
>> +
>>                  gfw::wait_gfw_boot_completion(bar)
>>                      .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
>>              },
>>  
>> -            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
>> +            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset())?,
>>  
>>              gsp_falcon: Falcon::new(
>>                  pdev.as_ref(),
>> -                spec.chipset,
>> +                spec.chipset(),
>>              )
>>              .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
>>  
>> -            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
>> +            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset())?,
> 
> Ok, so you've removed the local variable as per my v8 feedback - now you
> can also access `chipset` (the member, not the method - which should not
> be needed anyway as `spec` doesn't need to be created in `driver.rs`)
> directly, and remove some noise from the diff.
> 

Done. With Spec back inside Gpu::new(), the try_pin_init! macro gives
direct field access to spec.chipset, so the diff no longer touches those
lines at all.

thanks,
-- 
John Hubbard

