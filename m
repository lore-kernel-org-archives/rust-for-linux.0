Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814663806CD;
	Mon,  1 Jun 2026 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780297305; cv=fail; b=VTtoqnm28Bv1+wwOHJ/Qtz80zqgfOBLSAzt0rpEIt5DxWpO+a67Mg6hvHxOQFa8lBGQdOT+my4vqJN/aO3n+k7gmODK0YRl0EhpRegBLXa0Rnt+Y6Br7xdVWq2Z3h2M7Lb/G7G5r7q68hBqQb0ukJlunsk22tVK3tBOuwi6sSOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780297305; c=relaxed/simple;
	bh=+u7LE0YZXzqwc9tHhJz1cZ5ZBWLU86+HZGgm84ekvK4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Vlz63PfbE2KqHh6IUZkTBJ2lHcaPYM478IZO3IUBjksZidPPW/1x2PmcPAbyMY9R2T/aLyON7gBboI+U4IM/5iYV5SZJe5ZGksy70sqgEgn4DklU2cnbGylx0wIlrZKqGLtRWZVJTtlMRafZCoeRIPkZdztYsyj5E1vd5PIg7Bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ci2gKtjO; arc=fail smtp.client-ip=52.101.52.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ci2gKtjO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AODZhiBLYGYNdMOf2wFVD6ymwm5rUXzAXBItucUSKY0Ug5GSMl31a9s0bxYBpAVeNVG/3iAxxvrninC1YQbjXjYV6rtBEf/KjZ/fL+BRyQyTa65x/sSE0l7lW8g0R7717yHVu7lMqJy7t5uRaPmUvLZILIrSJt96lYGPRjhVoVW9jKocmkCoaKp51guI79sddXTrpzUxPn2FpkXTELLG02daO9xLxQKyUXeNJo/o50bEwOfLORxVjfAPO3IMAoTg1HiICImRUWievGbJhnQ/SifOgtuRqH11eFWl0tdZcm5dtPR2nwOh7Sh3oYIWzVBvLhqxP5CzgV+LgDvz6BvJ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiDuYUeucMK74ekI78Rv1MvDkDfYC8bUZjihBhXk8uU=;
 b=j01j/lDAPfrM1qYcafV+uzYvU+8v6rkHY4zOyqecHKMw2/IsTAzwsD3IL5ofKXx9W1EEQ0GazRIfIbTun9WMPlUA45dtEVtGblnJcNOxEu8Eleu/Dj0hAFE86dvB7MxLvB1r4Gt8tAVBlaLFKEsFmPOfTGy1mDGNgpm3noCSSnrOX0pBvBoYyLnAhsZet36casFQJmA3vTGfZKXBKFhOsT71SL/mLvDt1qwIQx3qQOzmpk9ygvkLuyHsPTN5Sy30JjON5pbGLhFpgvznJDMbOwflRBbCZXpqMGd6HS3nv182mmTtZnMdD1QHLzh6UJxEZ1EPIJaL9GNzh4481Km2nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiDuYUeucMK74ekI78Rv1MvDkDfYC8bUZjihBhXk8uU=;
 b=Ci2gKtjODz1oUDHaZYywXms4b3BfWEx9z8+Jvq3e1Ma+MLNangpxQIRElBPENMuY96JYSefwXn3KLkjQDWnVJ8wAK/82ISrmoaRZjloK77y+zs0//e0xuD02wKiuBaknXoNfyOcVNnzJOASJZ0DywfHBVZytYBKHS+fkuSjJux3K6wtucIANCCiw0LsgBa4Cqk7sikVtdmo+VyfTU1IJvUprry7/g/W0aSTFgsSrVHWfU4ljdkalcNPaHi6rECdl18KtQ5D5z/nmWmQP5TcM5hhvtwpJciRHIPeqcqd6Os86iyw+jsXQKr+NE/u9UPTk7IcRjNvd6KuE2w6LFWBRRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ1PR12MB6361.namprd12.prod.outlook.com (2603:10b6:a03:455::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 07:01:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 07:01:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 16:01:35 +0900
Message-Id: <DIXIPYPTGD6E.2U1DJ6SDQJVV5@nvidia.com>
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
Subject: Re: [PATCH v11 06/22] gpu: nova-core: Blackwell: use correct sysmem
 flush registers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-7-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-7-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ1PR12MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9f3830-2248-4a8e-79c8-08debfaba0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Ep/p/xnZNyAAX+d2BbIAOyr/ksfFOvDFuvvZdZA0aAVhh7Ia4qMXvO44woRlTHeyFmpJJ6udsyYCQziz30SH0WYBVc7PDKFzM3iA8q814RNG3dfmK2HUH1OuXPaO7naoqP/SNNMmCedULo5Dd5ag090VwbtyxTYYeqALWhZkju+eAwGARZsUFBs3ffDAg4Flm1JvEFszHNIXiViFpyY/2jsCVQg8vmk8TtoFU/yjsGgDi7uDWI9r6V6+hddJexCBqy+0SQ0gJwuye/T0+E40RwhCx8pkjpFrOzkHCgqc10ogtCk3BGSuwl9tk4qeXKA6yi4IEI0MtBh9vREIqHkIdyitywxlUzvwsOrtf8SGVp9/6vVw6CcVMYL3y6Qy0kFbiEA8qqD3S7bVRo8tVAB/gkTWGAIhIunI3EAK4+pZvtISkJYlmetSO3WtdEUO/jo2WXOrDCCSRod9E+Ayx87TOGXWyxVGKjVPynnX/P0404KT9j7UkCjoJtT/Jm/FwJN9I0/Ap97v133bupZ7+G8z1FkFKERClQyo0rI+R4FrE9qIuvd7RG7TK4r6wUFkJg/y6c3kVrTtpkqja7oA8hUw70+jxDlezsaPxOde9FcZx5XV3FbGgO6czbbRFfSqGK06wTS4T5mkSFTfHKay1A3nFdonRWLRlH6ab5C90/E4NULL/htjjinBxB6xAewSMLQwJYFZX6vWqriyBKSrXPZPDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTlJa3Z0dmUvTytGbE8zSmsyby9iYnV5VWZPZWpDLzR0NWkyT291VS9xMEkz?=
 =?utf-8?B?cGtZc2krb28veENpODV1RTNMLy9zUFN6UllWQisvcW5RMmxGU3kzWEY2dGxa?=
 =?utf-8?B?Y1BwODBmaGI3QWszREpyNkZzUm82YUNWazRkVDlqNXREdHBkZDg0cTF0R2xS?=
 =?utf-8?B?aHA4ZnRIOWk5STVKd0dYUHkrdEFGSXNkSURKK2xSYUV0eG5iY1FGOVJiaEkw?=
 =?utf-8?B?NDZMVkQ5N04wNnFEQ3Zqbkk3aHpHNG5wdzM2N3c1QXVhc2cvWkF0ZWh1MkY5?=
 =?utf-8?B?d2RjWE5XOUVaNUdVeEkwak5heWRmbCsvMi9lRkNyWjlQZDczTWpmN2xXRUVO?=
 =?utf-8?B?RTlFTzRDRUo3SE1qZ2hPWXlka3lQRS9CWHJNNTdvVWNqY3R6UmpNR2UxTVRl?=
 =?utf-8?B?a3RkMWR6N0ZPZFpBL1VkLzRWWEhuRHA2WUE5RE5ka1ZJRVQ1OVkxVXNpRXFl?=
 =?utf-8?B?WHFraDJwMFdvc2F1aE1WMkxUL2pvQXdXbm9SUmJ5eW9hZnBPMUp4d2VJL3RM?=
 =?utf-8?B?YjBDN0FsUzRiVDNzaktsYWQ1a093clgvckVqN3hUZmhlTk0vTGtVWXBROXRB?=
 =?utf-8?B?SDZHUzZLNVlBZVpBUWh0YjZLSkF6ZWRvLzNTa016TmY0d1RWQklTKzlpL1lL?=
 =?utf-8?B?V29wcmhEN2EyYlJoN0Jidng4VmV0QWtJdVp5U2hYK0g5a3paSDhQK0MyRDNX?=
 =?utf-8?B?aTVsS0VRdmtIUnMya0ZUZmQwa3lGQ0g4K1ZYYmo3NDgrTnNBUFNGOWhEZ3Mr?=
 =?utf-8?B?UTlBbVMyQWJOZlVHNmd6bzAyd0pDSkpoaDg5Mzc2NGRLTW02VTUzUUR5aGE1?=
 =?utf-8?B?SDVwcE9vc2p5eEh1ZHR1VUxRUTJYNTNIQWRwdlVlZUNrVEJnV2dNdG1aRXRS?=
 =?utf-8?B?Z1k1Mjc4b3cwbWxmcE9hMEM3TFpwc0I1cmRWdG8vMW1IMjkvVXVPQXQvUk5z?=
 =?utf-8?B?MUVPcEErU3NKemcwRTNuRkpaQ3dLQU5WYkZrSDlyeXZEMFpJVlVSakZQdGtn?=
 =?utf-8?B?ME0wZ3pIRTR5UFM5a2EyUGZhSnlwcFZHM0RIU3g1S2JFOE4zNkhMMkhlVXp1?=
 =?utf-8?B?ajl6QWZLcnkycFYvaWorQ2N1RTdlbjlsbDcyYXVkTENvQTJPb2xnbDlhTUVD?=
 =?utf-8?B?OVY1eUFzQ0c1eXdVR3U1ZjNNL2ZpSk1HREs5T2NCZ3JkaC8rNE1WazZEQnZk?=
 =?utf-8?B?aUFTd1hqcmU0cnZlVHByVHBGbTBhZXZEUGZZeHVyNDZRNEdEOHN1YlZLWUdO?=
 =?utf-8?B?R0NuZHdML3FmTDJWL2ozN09KSGVLZTZrTWI5OGhOQ3c0a2Rkb0RVNlJkeXg4?=
 =?utf-8?B?NGJJNnJLL3RVc0JQM1lYZXgyYlMyOGdZZ21VV0UrSkttbGpzNHFDY3BLOTBS?=
 =?utf-8?B?WkkzRDlXekFjT2YwWEk2UEsrQytNN2VlUXpFSTQyOFFKNENwSTdGbnpQRGkx?=
 =?utf-8?B?NWxxcWxCbWN0MXIzMC9CbEVucFI1eGNFSVZjRjd0RlJ2TFVDYW80SCtnTGlr?=
 =?utf-8?B?ZjFhUFpCcHpMV05ybDBkVTJ1ZTZLazNyWDNTSmYxaDQrbEdMcDc5SlNHVmJx?=
 =?utf-8?B?M3I1d1Fubk96NHhUWWU3dmFzOTBoelpsckxxSTlaeEdybmZxdHFwQjFWb0Rj?=
 =?utf-8?B?UDgwUnB2eXdJVURUaXdDbkxvaDNxRUc4a0czOUVVTytCYTkzYk5TQjRVRWNQ?=
 =?utf-8?B?ZUhVSTlra2x1Q29saExWOERMRDlXN2srek5pVmR2bjFYME96RENXRGtyUVA3?=
 =?utf-8?B?RFJMaUtUdFJ2ZnBoWVBUZG1UWTF4T1R4UDUvNWY5elVFUnVKRSsyamFReHU1?=
 =?utf-8?B?YksxQmxTQlNYQnNHU2g0ZFloUWxteU5IMGdWaVRUNFNGNHJISWtmM2tJakE2?=
 =?utf-8?B?bDY2aWVpTFYvTmk5NksyVzNTZk1ESXRHcGQxa2JYclI4c3pXWEZ4TVc2dVQ4?=
 =?utf-8?B?SzU3NlBTNUdod3d0b0JpbU9qOGdJYWlNOWhwTlJ6Njg0UzlheXp3QnNmNTVC?=
 =?utf-8?B?S3BaeDd3clpXaUhlUHJac25SUnZOMk5pbjVWQVNlNSs4NGp6OUpURnc4ZWRh?=
 =?utf-8?B?RERWL1dDVHczdVFLYXViUVRYcFVpcjJQNFlNaktBMXJueVppTWt6RmEwM0ZD?=
 =?utf-8?B?WDRlYjQxNEYrci9jMXYybi90OEJOWVhNTVdRcjVIYUVUeE54N1VUYzFSd056?=
 =?utf-8?B?RHhRSU01UXdZRk9xOGgwUG5IRS9aNHk2M1Q4NzVnUnBQWGtpTTB1UFZJZXZQ?=
 =?utf-8?B?OUVpQ0IrK293eHB0NGJlUlRBZDNuY0ZvZTdwczVkNDRDcmU0VmRtcnh1MVlI?=
 =?utf-8?B?UmlBcFcwTzY3Mnk0Qk0yeDhTVkNOcE9uNFFmMFlGWXNudVlKSGh6Q3U2S3hl?=
 =?utf-8?Q?nq2Fne2pX/bDJs1S/2vRaIT2X/WyeMc2yD6maJmG5KeGW?=
X-MS-Exchange-AntiSpam-MessageData-1: cQcOJDvRXOZ1yA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9f3830-2248-4a8e-79c8-08debfaba0ad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 07:01:39.1966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/F7Ros5ooTR2hHy8AYqqLVkiMnMraN3xCA3Hjqmp5daY6gIRJas8fz3pt90hmslj1vca3WI02s8WA6QPRa8GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6361

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 356fbf364ea5..65be6ec71ed4 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & =
AFFILIATES. All rights reserved.
> =20
>  use kernel::{
>      io::{
> @@ -145,6 +146,42 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) ->=
 kernel::fmt::Result {
>          /// Bits 12..40 of the higher (exclusive) bound of the WPR2 regi=
on.
>          31:4    hi_val;
>      }
> +
> +    // Blackwell GB10x sysmem flush registers (HSHUB0).
> +    //
> +    // GB10x GPUs use two pairs of HSHUB registers for sysmembar: a prim=
ary pair and an EG
> +    // (egress) pair. Both must be programmed to the same address. Hardw=
are ignores bits 7:0
> +    // of each LO register. HSHUB0 base is 0x00891000.
> +
> +    pub(crate) NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x00891e50=
 {
> +        31:0    adr =3D> u32;
> +    }
> +
> +    pub(crate) NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00891e54=
 {
> +        19:0    adr;
> +    }
> +
> +    pub(crate) NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x00891=
6c0 {
> +        31:0    adr =3D> u32;
> +    }
> +
> +    pub(crate) NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00891=
6c4 {
> +        19:0    adr;
> +    }

I am still a bit uncertain about the addresses of these registers.
OpenRM seems to use `0x00870000` as the base [1][2] and use relative
offsets from it; that would make the address of e.g. `SYSMEM_ADDR_LO` be
`0x00870e500`. I cannot find any reference to a `0x00891000` base. Can
you double-check where it comes from?

Ideally these should also be relative registers with the same names as
OpenRM (e.g. `NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO`) for easy lookup.
The `Hshub0` base can be declared in the `gb100` HAL since it's the only
place that uses it for now.

As I mentioned in my v10 review [3], there is more complexity to the
HSHUB module that involves runtime-detected values, but for boot it
looks like it also does rely on HSHUB0 as a stable base, so thankfully
we don't have to worry about this for now.

[1] https://github.com/NVIDIA/open-gpu-kernel-modules/blob/570.148/src/nvid=
ia/src/kernel/gpu/mem_sys/arch/blackwell/kern_mem_sys_gb100.c#L54
[2] https://github.com/NVIDIA/open-gpu-kernel-modules/blob/570.148/src/comm=
on/inc/swref/published/blackwell/gb100/dev_hshub_base.h
[3] https://lore.kernel.org/all/DHY1D4IOXGRF.UQMCOXYG78CZ@nvidia.com/
