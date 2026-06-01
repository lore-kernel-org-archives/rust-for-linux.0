Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD6733DEE9;
	Mon,  1 Jun 2026 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302780; cv=fail; b=EUkRY1PvSeh/Fb6QWU9aKKL20EWGU4xHOJXoyNSvrkz/zOBR04OyAMXCtuypg00q0tgRt12Jw2fBOCpad8Pq7bHmJ/NtCqqgy33MlA3/8MZVvIVjhhGn7VkHgOmBxL2UQSD2U/as4BU2wfLwUF8Giu9OK56XcyX84b0DK0LGGMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302780; c=relaxed/simple;
	bh=ZkZtKPy7O13AbdWVdg2b+JnEJAcXbeutjHMZWW8RaJc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=MVnLm32srmE1rIUKpqThvKKXUr8zfB99XaBQZtFxbaeEHS4Oso+ta7HShDLWL7XkaYSNBZPvfMM3KhUNyf9qwlTae0b4/X+F3V+oHu+5Vgqu8NrUuOtG0ArulqMPdDiC+wltFrMOmGE30JcVofrG0JrqsdJ5h5+btuy4uMsu9kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BX0tpHi8; arc=fail smtp.client-ip=52.101.52.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BX0tpHi8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qi4muQwwXVuTnc2kEasmBPuJBn/Q5ID0JsqozqxVcR3nbqu+xEzuwtAfjZ8OHFX71dPI2vhr+qGvXSnG3He1WKN5SpjyqJkXJXob0wrQnzQFvv8DehyOAyJkGz5eQTfjNRpJsDDeoD1at5m0+PB9gpSezUWnXi7+zEC0lO5sVGKUTm++ihY9chV6+6k6xQeyqCgs251h3/DoCUFlvDfzQ8iAvVJIONvMgpoqDMuh8JBvh0RVJWPgd0pYgpMuwz80rBmDEYcrnRbQJvKjzkts7jQ7INAX+DpwQyTE8g0UlmmuN83bXwe/gnWl99Yi1nAEMaVWbGBMIhcPugPODo2wOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVnF5T+xaOXTDERVIG8llvUpjIb5bXaSJ3w5X0xq1hU=;
 b=dj6abXrV7z/m7r6XY4joCOqzVuXfXExtyY7NBT2kLowmPH3Fri4+PhyZR0MiL5YxDjWawCEDeJDwkKpWOtNuk1seYsVVz/agJd23rk3b4KPngGF0ARQKInB/P0fAY5kfpviQVV3nvqdu9sjywaZv8VnK2TTp5zu7rxsKqlhlsi75VZF8CjWzhq1bKc7MrCYewzYApUhpb4SCF8pH6ZmNEuD72CEk1NfZ98hyG4/9SEgKisGhksnIIEEmSrE9ZpKjonA6CRYHv3avlFkoIWhDM41Mz5ryPxnX9hdzoXVTn8R9A3N7KQMX5R930wvDYz8cGr6jb8Dr5xbyEPu+fc5e3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVnF5T+xaOXTDERVIG8llvUpjIb5bXaSJ3w5X0xq1hU=;
 b=BX0tpHi8/BEKbo3x7VGQBADWe71IucBrYULC8AbHJnIcai9GB+7GuZajE7tMvUwatu+Bkf3t5UBjWBalOpe9iRad6MumqgRTCOusIa4NmzKCS5SOMKWdKPJKgBemjjRIURmk7qbV8V13dz8vxLf/Qv5QIR+LZKjHGB6y3hILW22ipZyBhDGJgNGSP8wjKFYmpBb3eDGpBwIRkHInaYRKG0iGCBETawG38xZkebvlXUGVf8K7I786CpQQwW15T5lceTGrwgj86ioqMO87RGwK3IADBqSyNPN4LeWe59qdlVJhZynW5/W8u/D7+MSz+H4cOEHegYP02G5n3sQX14XStg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA5PPFCB4F033D6.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 08:32:51 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 08:32:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 17:32:46 +0900
Message-Id: <DIXKNSBMSIEB.3SURNUK64U50U@nvidia.com>
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
Subject: Re: [PATCH v11 12/22] gpu: nova-core: Hopper/Blackwell: add FSP
 secure boot completion waiting
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-13-jhubbard@nvidia.com>
 <DIXJPV5RWRNK.OLQ2M3QL908W@nvidia.com>
In-Reply-To: <DIXJPV5RWRNK.OLQ2M3QL908W@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA5PPFCB4F033D6:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a05703-fa7d-41c3-b0d2-08debfb85e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|7416014|366016|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	dLHCJK5ENB8zDkz0XrLrctsXdJTfXkqnCbGt/s6webFAjBH/C84xNu14jNt/ueG3ZVBGd1pKOxJ7AFvf6eqWDj8TRktiP0+g3oir0UoLypJCs0cIWNgi+nMrKhY4lS6bCmU8e9/HVpmkSTTxODmF+0bMt80hfSSIZsL+68uw3C/sp9bD4cwkcRAiUT9g+0tU772Erem8V/1YL+GsBOEheMU8LTLt857466nOgzjk6girDMv4kGV7gbi6yqr6p4vqIg59Mg7tHiYsftGOfUWwqtZDSymllZYIfWsa7Qs4kSeQX952WQXzUjGLaN+xGIh2p2Vaf4PPPG08Kd2e0hiDA10PKzraIXcFlvVWaxnALOYxyvOm/t8P4fEaE8K44sNTlc+tu0mL9qplqnUavwON3A7dyW8MO0ycxhZsshykF/YXVVfIoS+pcWT5WQmd0NkYD0sXicXcHrnVJAZ01zpH/FwTcynV0AIM+V4wq9TUYxnJL/yMbsXlBbQ/6af1XOwLF7fq2hlUfS9zE4KtckzPEkkBT/H1zDK3QFSt52GS1fv1DyGowBslaiEzk9V43IpdDiNa4Hw9kgrwhvUf1DjyJu1U8jIQLQmdWSujOlpWNGBzFMdCkmPjcPPqSCdtNAMPjyijsCYRQV0c1L3RbfbgDj6aMY8R1GykUpXjg2DwpwODmY4WXbBIEevqxJIl5+W5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlF3aG0ybkN1a3ZjT0hycXNJNDlRL256aDFETU1qV0o5dXA5WTZvNXhJTldo?=
 =?utf-8?B?QkZiYlNlRUdQTFd0OThlQ1ZYNDJGVlRhd2ZWM2pNQ3k5cVRxVWhkS1hHaTdK?=
 =?utf-8?B?eXFBV1RaOHN2ZXFpbHpVNml0QnBjRFg3ek9jZ0laYmRkeWFtdmZkblI2R3lo?=
 =?utf-8?B?QURTbmtrckw1NnN5QzBvTTBzSG5tVVZGQmJPZHRYNkZkSnhWc1JtekVZUHFJ?=
 =?utf-8?B?VFp2OFc4N291VXE0VXFiNzB2K3hGS2d3RENWTTJxTzVXQ3owVkU4OHBiS2J4?=
 =?utf-8?B?STBMQTF6Vk43MUtiZTJNcUt5aTVMY0VrZ0gwaVlmWlk5UVZVMHo5dXRYUHJC?=
 =?utf-8?B?OHNweUg2TlNRcDd2S2F3Nk1EZEQxaSs5Q3RlaHZuYW5ta1ljYzRjZ1ovK0hG?=
 =?utf-8?B?OTk4a2pycTU4ZjloM1l2c0U0MWVJVXRPbG5sSXJiNSsrUU9tdzNFTUdOSUpD?=
 =?utf-8?B?SjVDMFRZZytFSzdqRmFRdG1ublc0bEpydkd6emZISFRCOEFPdWFoYzkrQ25t?=
 =?utf-8?B?SGkwaFZaaTQvNkdVay8zRGNvZFpGUFg3RXd0NksxVnF5VGdTeUU3OGNOS1RO?=
 =?utf-8?B?eVMyRWh4ZWRZSytnN2VweVhUaWhjLzVKYUJQaXNLa1ErbkFhN3lkRWo3cEVz?=
 =?utf-8?B?dDllOXZ1MjNWSVptZ2ZWbHNENGE4dm1hMGE1SzBJaUxvYVcwSEl0dWFUYUNW?=
 =?utf-8?B?TExrd09hV0YyOGhReTVJMEQrTys2OUROelA3RlkzUURqTkt2dDlYMGdEZm5m?=
 =?utf-8?B?QitqNDlpZVR6a1l1Q2tzWUY3YlYveGVUWnR2SWxYNmE2aFUrN1hzL29ua1Nm?=
 =?utf-8?B?cXBrN1NtSmFTdzM5NlNLZzRqWXZZVlpEeFhLUGIwME5Oc1VFTFp4Q3R5NnEy?=
 =?utf-8?B?aXE3OFpDYkZRUXlwcVE4NE1haUxHZWp0L1JJU2FGcjJTSG9ac25XQ05iMXNW?=
 =?utf-8?B?TVVHdjNjeFR1T095TVA5Wk8wUjhrVDFBVDZSSTdSZVM0NUwvaGltRHJWSDMw?=
 =?utf-8?B?QWNDOG1aZCszUGJZeXVLa29vcHkxNE5kcjhiQ09MeVdkaUZRN1FPOG5qWis1?=
 =?utf-8?B?aHZSNXI0cXg2ckQ3WnAzMFhXdFdoRkxxZkc2M0FnNVJ0akExT3RRVGs5b2hG?=
 =?utf-8?B?d1ZHR0ovYjkxTUZManNqQXV3bTlDS1JZUjVEM1FTZGhZMFUvbDExeWFIem1T?=
 =?utf-8?B?OUNzak5PUzUxU2EwQkZZQVZNcmc2c290MFR5LzZod01CZEN3eUxEbXpveDE4?=
 =?utf-8?B?YkRWK3REM0trUjZGSE5PaFFDMDl2ZHlISjV6NFdIeE94Q0xnSG0rRDdYZjZ0?=
 =?utf-8?B?TCtKd1VyTFM5RERZaWEzQ1hLbGd2cWZBNEFlVXlVNmhFOEI4RDI5bDk2bDR0?=
 =?utf-8?B?c2Vsd0xiaFdHcFFlVm5LdG9Ga0VlMHdWemllTGM1aE1VSE5XMlZ1V25oOS93?=
 =?utf-8?B?cEh1Z2xqVTNzbDliQXVFdEtKNDNCTkpTdUZNSmVNK1BCYUZDN1F4TTIzSy8y?=
 =?utf-8?B?Wm8zc3ByL3N3M1dMNkQrNGVDNUNGTjdjdFppZ3lqMm9SOVB3MzRVeCtOQnh5?=
 =?utf-8?B?eTRnRmJIM0F6MjJBTWl6MDlZWk9CdUFUcjVCNlNuU0F5Nnl6QmhLUXVRb0pP?=
 =?utf-8?B?c0dhdHIybjNidi9xTGNOSVppd05FWkxCYjhmNXRKeW4rdHR0ODg5K3Nab1Yz?=
 =?utf-8?B?dGQ1NmxqMFIxU2ZlbXpFMWpLL3dMTHdBSHZRRmNXRVZSVkVJZERWRkthTjNu?=
 =?utf-8?B?d2o5UFNTakRoaXgxZndxTUtPUStoRUlJa0F6WjdNZnlkMlk2cXpsc2FQdTN2?=
 =?utf-8?B?eGZNN1BIOUhNOThQOEZSTkRuUFE0TG5FdlV6ckN0YW4rT3A0dk1rYkRiSWIy?=
 =?utf-8?B?RUZhbG5RdkZCTURyS0g1SDhrSlFOdzFDYlI2VTcwLzhDQW4vdTZESFhpUmFG?=
 =?utf-8?B?YllmdS8raUtGTDhqd3VyWjNkNlQ1bng5a2d6SytHeVRuQjhzWVIyMWp2NFZQ?=
 =?utf-8?B?ZlB0TW9LeVAwaldGYUxzOFdRMk5OMktuQmU0K001aEoxMWo1OHRtTzNhdUhZ?=
 =?utf-8?B?azk2dTQzdVQwcFIzbGRFdER4Rk1seGU4VTEwZGt4akZnZjVLNHU1dmNab0c0?=
 =?utf-8?B?TVQ1Q3g3clFQRTN2NHMxd2luREFxUkdnamNmY0pNcElPVkExR0hCV2RjK0dh?=
 =?utf-8?B?bnFwU1lhRWoxOGVmdmVQbC81bk44RGJYalJyVHNhM2UwalRZZm9tWGkrVFRI?=
 =?utf-8?B?VGhSdWxlRmJ6Y083VlBCVzljUTB0OW9RL2xYTG1PejhxTlJackRzNXBFV3Y4?=
 =?utf-8?B?ZWY5bTJrenNtNU4wRm52T1FWanVCYmtVdnJNSjREa0dHc1BNTzYzaXpHeXZB?=
 =?utf-8?Q?tZdLClMMW97z3SubUjWMf7gkbL5BFxta7UJ5ZgiEBlTYF?=
X-MS-Exchange-AntiSpam-MessageData-1: jMye0G4s11sN5w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a05703-fa7d-41c3-b0d2-08debfb85e1f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:32:50.9057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +v7n8jWIw4DrroH706bcpra19vgdN/3xwnBL1Y4ihBHW5NuquQVZhqjtq8BP/G9I/UaPZ+eWHuI3IwFC2Xs9hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCB4F033D6

On Mon Jun 1, 2026 at 4:48 PM JST, Alexandre Courbot wrote:
> On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
>> Hopper and Blackwell use FSP instead of SEC2 for secure boot. The
>> driver must wait for FSP secure boot to complete before continuing
>> with GSP bring-up. Poll for boot success with a 5-second timeout.
>>
>> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/fsp.rs           | 51 ++++++++++++++++++++++++++
>>  drivers/gpu/nova-core/fsp/hal.rs       | 27 ++++++++++++++
>>  drivers/gpu/nova-core/fsp/hal/gb202.rs | 23 ++++++++++++
>>  drivers/gpu/nova-core/fsp/hal/gh100.rs | 23 ++++++++++++
>>  drivers/gpu/nova-core/gsp/hal/gh100.rs |  5 ++-
>>  drivers/gpu/nova-core/nova_core.rs     |  1 +
>>  drivers/gpu/nova-core/regs.rs          | 36 ++++++++++++++++++
>>  7 files changed, 165 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/nova-core/fsp.rs
>>  create mode 100644 drivers/gpu/nova-core/fsp/hal.rs
>>  create mode 100644 drivers/gpu/nova-core/fsp/hal/gb202.rs
>>  create mode 100644 drivers/gpu/nova-core/fsp/hal/gh100.rs
>>
>> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
>> new file mode 100644
>> index 000000000000..ee8fc384fe38
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/fsp.rs
>> @@ -0,0 +1,51 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFI=
LIATES. All rights reserved.
>> +
>> +//! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs=
.
>> +//!
>> +//! Hopper/Blackwell use a simplified firmware boot sequence: FMC, then=
 FSP, then GSP.
>> +//! Unlike Turing/Ampere/Ada, there is no SEC2 (Security Engine 2) usag=
e.
>> +//! FSP handles secure boot directly using FMC firmware and Chain of Tr=
ust.
>> +
>> +use kernel::{
>> +    device,
>> +    io::poll::read_poll_timeout,
>> +    prelude::*,
>> +    time::Delta, //
>> +};
>> +
>> +use crate::{
>> +    driver::Bar0,
>> +    gpu::Chipset,
>> +    regs, //
>> +};
>> +
>> +mod hal;
>> +
>> +/// FSP interface for Hopper/Blackwell GPUs.
>> +pub(crate) struct Fsp;
>
> Throughout the patchset, this type is never instantiated and is only
> used as a namespace for static methods - something that the `fsp` module
> itself could also do.
>
> But I think it could be useful to create it and pass it as the `&mut
> self` parameter of the other methods in the module, as doing so would
> make the module more resilient: we could request `&mut self` for its two
> other methods added later in the patchset and guarantee that there won't
> be any concurrency issue.
>
> This should also probably create and own the `Falcon<Fsp>`, as it is the
> only user through this patchset (and this makes sense from an
> architectural point of view). The `FSP falcon engine stub` patch could
> then refrain from creating the `Falcon<Fsp>`, which would be created by
> this patch.
>
>> +
>> +impl Fsp {
>> +    /// Wait for FSP secure boot completion.
>> +    ///
>> +    /// Polls the thermal scratch register until FSP signals boot compl=
etion
>> +    /// or timeout occurs.
>> +    pub(crate) fn wait_secure_boot(dev: &device::Device, bar: &Bar0, ch=
ipset: Chipset) -> Result {
>
> ... and with the design proposed above, this method can return
> `Result<Fsp>`: we are not supposed to use `Fsp` it until secure boot has
> successfully completed, so making it return the instance that enables
> the other methods guarantees that this has happened at the API level.

I think this is a good direction. I think we can also make FspFirmware
owned by this fsp::Fsp object - i.e., move more control of FSP from
Gh100::boot to the Fsp object. You might need to change up FmcBootArgs
and e.g. return something from `boot_fmc` to keep the DMA allocation
alive.
