Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020110.outbound.protection.outlook.com [52.101.195.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B4033FE12;
	Mon, 30 Mar 2026 15:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884059; cv=fail; b=OPVkwFSzwiijeXfFZRLaWcGcuMNaANDQ5hfp4paF1n/+1wxS7s0NPNV37TSAw99eY6JzOmfLNR+hDBT/PQ8jcvmySRqkHiPHcuuORntY+whpm8AEBKyfbj/SHjJXu1E0ur7XGJyLqkFL5Cg2DL808bXRGKC5CZIj6ccrPZ5cGp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884059; c=relaxed/simple;
	bh=h7q4xXeRH2/T2kCyNi/F7qSPCFS3UlmYG0YcQnqHHuI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Tt0FKO6h9ulIEpVvrOaDifktYF3J8hCoVhDX9NRoquEH3H3iYREbp9dxViDdnnaSIU0zoAVnbFBZ1Y+T8F6yQnuw+jFFmDUsSEsTk5tHkv/f/shsdiOGTsoWNd4rKIdk4IexenFp97WlAz0h+MzHwikqWeMkCgD+sXs/T64aS20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dgCVHp4I; arc=fail smtp.client-ip=52.101.195.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dgCVHp4I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hY0E9m5EVBPinb+GDV6bfSipEZJbEAWFCIWjnm0Hec7NEN+ukz0UUIEw2lAnjY6vHeYnbzxo1BCu1439z0FxkKtywHq1b+RiYvm6/kmJrgCJ86DuNdPJi2KJZohIeJODVrPOtz3i1agtE6C85t/A6V9R7er1rUEZ1qS/8LGghUk8KYOJNi48r+d87U/eIme8VYnfvF9QhwG64I5Vixy/BJ7hcVQn+TLEqRX2xtf6LRA4j4KR7OjQvmY8TPYBeSzL/CI/cBGDivVGNbD9L2vRqBAJRp5XhjasUyuyKiQt9pWv5cIvQDO9TrpzsVLmDTyUYTuIQ1fvcJ16vrEMOJfAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWy3bqHywASx684GSK8MtnFNoUqanEo6Sqn8pelrTgM=;
 b=Yx2RTWdsCDfnzVmva/CuNVeiIZW78dBte9pV50cYeHI1ieCJq5oeC54KZ1Rk25EmiqSXGit18Ee1cO6O4fXI/7Tp3sI3sKSkvdpvwKBFs86Wzp2Yf4q6LKXV6pMMaeZagTuXbPHzyEiYyrjV5JfOvJoXdR+ru5AWxfhpOcofLdMJRg7ErriWoJul/Y2r88sLy3FZwiDou5efVp/eOZ8lpY4MTAzeBdF7iuNt4D5HuRW2HLFH+Y3dZuYlRM7WrihLN7Zi1gSXkyY7024wvGdtMBsPQ0qy4OYxC3bumPTA3RYxPoRXlo1Hd0tsQlGkc8pWvffqCahUTQksCUScifeB3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWy3bqHywASx684GSK8MtnFNoUqanEo6Sqn8pelrTgM=;
 b=dgCVHp4IH+d/6kFKc9+bNfGaHiAUgcyx3fk/Cxjf26/45dp4kn3a541JUWuqupGvPlDTNwNSMNIr5Oi22z1gTbNAao67sQL3W/HqgnVfMGA0DPPzKyRFpfC+LeuoNu25keddKGz0IMlAdhV/4R5BsF+b3rZHFJIMU5N1uE/NkJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3638.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 15:20:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 15:20:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 16:20:49 +0100
Message-Id: <DHG7VVSRQFF9.2MSMXAR9X61CA@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW
 boot waiting
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-7-jhubbard@nvidia.com>
 <DHG7AEASTW6E.2QTXB1D0GA0UF@nvidia.com>
In-Reply-To: <DHG7AEASTW6E.2QTXB1D0GA0UF@nvidia.com>
X-ClientProxiedBy: LO4P123CA0064.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3638:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c724fe6-7ccb-46b6-47ea-08de8e6feca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wF4+YDd/9PvAzDjLOpLiGQJMr5aLuaD8RN51RK10c7OfKj+AiF5ZSQOQ8wwHvUvyamt3TMAGC7lQdE85EPHyQfiI3PAYMTUW54d+LtlajgIMXgxIG0PWvqwb3sfLaxd3xNpFDptabvb7HdaK4I5oy+G11N0KMmod9PhSx556exvteTOLcutmBISMKCJXP7Q1bzwDLB3Jc+ckkoIt4z8VLnlwlSHByAC8mp40dHSBG2XV7yZBFvL/6LSegNGm0AiZ7DxIK5vncET7h7/3+uDpBT8rzPgtElrDOiAugY1XIuCVUGQesZHIHIGx9lrAe4pcb3xAYjwX9/YvTeWeCUpiLL25vA75aHgrHjLGEpOusmgvVhtu6Z13dfvdkNI0si0OaTE06gZoNWOq+5w/BhJz3Ty3LJmUzg3+f5NuPa6Vrid2h7EU/V+XmgotlwmB7LsGNIZH3mURY+YJR+vDeyXnHHh1MApncijCc9wp+pQheEprsdjvNIpcTQBtCJ9+2U+NNls8rVtZMpzzZzFNA9qqvoNfRoN58xquBV58guKJ5tpL5v7MWpy2SeGSN29Pp0O1KurYob9s5qA6fPynM1OO/6PYFyoM9YJQatSYwd8jJ15AV0AX47uzRUwdi6LzWY4AK0JSYZRWZSxwCmEDktiAJOZnFYerTbWa1EQmi/ZuPbW7QnQh7XZBLURHVYc7ptjhtK8xIwfshgEHjV7k0u6XZyHRKY1lhSBTA4CMi1lcaMk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjBJbTRQeDZUQ3RKd1JoZ2dRM1J6Q2tibmQ3d0hwREVSNDU0bXRHUUNybWc0?=
 =?utf-8?B?QURCWTZrVW9EZ00yMmdQY1U3enk4UkliMVgxUXpQMFpyS2g5VGwzR0ZMOCt1?=
 =?utf-8?B?aU9iNUx4a0VNcS95TEdCOGt5czdnTzN5VktxQ0dJb3BjMFB0Zis3Q2NtVGFk?=
 =?utf-8?B?MmZnRjRGVGF3SGhnRW03dEE4c2FUNFFLMFJnYkhpQTc3cmtESHlhRE5ndm5D?=
 =?utf-8?B?R0d0dHN2RmpsQ2ZFR3hOYW9KVUhCU0tLSFNrV1pHSzhoTk92WHJmTGNNTEFj?=
 =?utf-8?B?TUthbUJONE5RWXZmeEk2MzVaZWFhTEdjVUtIa2poMEZpZjkzZWI2R3IvWnFU?=
 =?utf-8?B?dklTM2xqVGppM2tJWEptK1JHMU9NRDNVVDBJVDlVWi93NkZrKzl0VGtrQXFz?=
 =?utf-8?B?UkhtMG4zYUhhNmNqSEtWU2dTMXc3blVMVzFCSTQ5ZjYxUkZCa2tEL2FCd1pl?=
 =?utf-8?B?ckVHVGllVFZJSkFiQ05kRDB0djRINWV5NitadkFVN0J1Y3A4MmlGZWIrc052?=
 =?utf-8?B?YnB4QUxsMHpmNG1TK01HaWhRQnc0OGFoaVMxVWc5cGxwdWJ4ZTQwY0xCL3ZZ?=
 =?utf-8?B?bngyeXg3NHlPLzVsVi9zYUJBK3hKcjNLVVlpVVdVRkFNZUF5Y2pHZlpBWXo0?=
 =?utf-8?B?bmliWXJWVk5aTHY5Y1lZYjU1enR3bGJ1OVphY0hhTUtoSzhKUnc5OGxDalJo?=
 =?utf-8?B?Q0pCVTdFMjZoUkFab01vTmlQQmh6TXpWUVk3enltdDc4eU51ODlNTmxyQjgv?=
 =?utf-8?B?bGNoNVY2L21TM2hxZXlqUGZXdXc2ZnBFUE9KQWQ0RXlyTHltRmRUZ1R0QXFm?=
 =?utf-8?B?bXEzU1RnZ0dqQ2RObFhRWThwblErWjU5MUlTT2ltZ0pzSVdsaEE0RjBUdzBQ?=
 =?utf-8?B?a1NreStwSllNV2p0L1JuRlFQTDFZeXNWelczQVdzak80VUQ2bUNTQXBvdS96?=
 =?utf-8?B?L2dIZzJjZXRwellMNVgwYStsTXkwS3B1VG82SWNTdm04V045MkJoWGE2RS9Q?=
 =?utf-8?B?Mmg3Q1FrU1ZLRzkzcVpPejNybWJFUjJEVlp5Y3BUMUllOGRIMTFlZzI3enBu?=
 =?utf-8?B?MlYrTFJHVEJqVFhBRnAyRFhOd1RvdG9HTUxqazFxTG5YdEdQcmEycmtCMkN0?=
 =?utf-8?B?U2wyUHhwZjBJV1lpWHZjd3p6WlN0YnU5VWtYWGRvcmRBU2tFNEIzWnFsRlRi?=
 =?utf-8?B?SDVNcGo4TnJwMS9qQWVSWFliaGF1RExvZjJ0V0U1TENSNktVUFh2dHhHMnlY?=
 =?utf-8?B?NDZ4cGpLU09qOEpqL2crMTBEZUZteGtvWmpnMmhaVnUrQUY5WUZZZGpuU0Ja?=
 =?utf-8?B?Y0VZQXJVV3grNFhmL2Z5ZHF5ZGwwUmtiUHVjWkFPU3FKVk5KUGpJM2xHUEcz?=
 =?utf-8?B?YWxMRzRVNjBGZy9kUE9YQld0ZCtwdVdtOWxDUDFKbEh5VVJsZWwzUHZZaXlM?=
 =?utf-8?B?RjlJcDNqUDFNbmhDQzVOK3hPZXNuOHhBcFRHVVhwYmp0SFp5OS91Mjhhdlkx?=
 =?utf-8?B?V1lwQloyWU1qNlZPN1hBWEtkYjlFdnpZZjdPWmd4Vk1NNFdvYVdmbTIwellu?=
 =?utf-8?B?WjdlYWFxNjliQXh5OUdUNVkzcUNkeE5ydXRVcFpEZ2wvM3B4eEgvQmVwNjhs?=
 =?utf-8?B?TFJnSzdDTzBmS1NxaytibHUxMzB4MTRlYVZTK2NLTk1qa1JydFd5UjdxYWMv?=
 =?utf-8?B?ZGxOSkNDQm1WaVZ6SWt1OXhTdmFtT3dPRVpzT2puUWNzb1BrS2E2SzVvODRj?=
 =?utf-8?B?encyWkZMejZsOFNZY0Q1U3Z1OTR2eDh2TWlQRkl1ckVHSExuSGJ0bUhka0E5?=
 =?utf-8?B?N0x6dDgweUpiOFVsVWJHOFd6cFRvYmEvQTBRQm90ZllSZ3RPUlB1OVdWNVp5?=
 =?utf-8?B?T1FzZlNmSG5GanpucjBtNVo3RWR1WGNiWlNrbkZ5WHFmUWhHWnd0SDZ5d3FN?=
 =?utf-8?B?c0tMVmtBdUdqSlBSTVVOdUNnVjRZcGRicTRuWXlucEhEMXhkM3RNOU5CekZ3?=
 =?utf-8?B?Nmw4UWFBcmJNbXNwNXBmSi9qamFLS0xWQWw2MlZzc3lwM1RxVzEyWDZSY21n?=
 =?utf-8?B?S0xRcGJrYzdPN0pVTDVSMURaa213SEFGNVVVYlNveXB6d0h1dE1Jakp0QVFj?=
 =?utf-8?B?ZWVHTXlEYzlLam1TcnZaVmErbE4rbnpFKzVTOVZtY0RGaGdqOUtFTGd1WkdZ?=
 =?utf-8?B?TmNjRC9iQUNraWIyYlFERXRkMFB2cGVGMXVRS0dUSVo0RHd5a2o3VnI2MGpE?=
 =?utf-8?B?QkM1U2hxS3NMNDEzVHBOYkpsVUcvMWVNTVJyTHRTeWt6UjBmb0piNnpTWWkw?=
 =?utf-8?B?N0F3eEtnQUc2ZnF0OTV6NFVhT2d4MXViTzkzZDdUMmJYdHlockVmQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c724fe6-7ccb-46b6-47ea-08de8e6feca8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:20:49.6898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsAN4wZMPl1761FjN+cCyMTLUYOTxViYH/kpQhYumJSpude0rqapHpMefaDwFcPUXiUu9g+Ot8XbNg51ytbsZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3638

On Mon Mar 30, 2026 at 3:52 PM BST, Alexandre Courbot wrote:
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
>> =20
>> +mod hal;
>> +
>>  macro_rules! define_chipset {
>>      ({ $($variant:ident =3D $value:expr),* $(,)* }) =3D>
>>      {
>> @@ -311,6 +312,7 @@ pub(crate) fn new<'a>(
>>          spec: Spec,
>>      ) -> impl PinInit<Self, Error> + 'a {
>>          let dma_mask =3D spec.chipset().arch().dma_mask();
>> +        let hal =3D hal::gpu_hal(spec.chipset());
>> =20
>>          try_pin_init!(Self {
>>              // We must wait for GFW_BOOT completion before doing any si=
gnificant setup on the GPU.
>> @@ -319,7 +321,7 @@ pub(crate) fn new<'a>(
>>                  // still constructing it, so no concurrent DMA allocati=
ons can exist.
>>                  unsafe { pdev.dma_set_mask_and_coherent(dma_mask)? };
>> =20
>> -                gfw::wait_gfw_boot_completion(bar)
>> +                hal.wait_gfw_boot_completion(bar)
>>                      .inspect_err(|_| dev_err!(pdev, "GFW boot did not c=
omplete\n"))?;
>>              },
>> =20
>> diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gp=
u/hal.rs
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
>> +    /// Waits for GFW_BOOT completion if required by this hardware fami=
ly.
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

The exsiting cases in fb/hal declare the constants without even exposing it=
 (the
only use case is to pass it to XXX_HAL.

These looks redundant and should be changed to

    pub(super) const GA100_HAL: &dyn FbHal =3D &Ga100;

etc. instead.

Best,
Gary

>
> Once this is done, making `gpu::hal::tu102` absorb the `gfw` module is
> trivial, so let's do that while we are at it - having `gfw` as being
> driver-wide makes little sense since it has a very limited role for a
> specific subset of the chips we support.

