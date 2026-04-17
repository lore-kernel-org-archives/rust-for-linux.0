Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044F229A32D;
	Fri, 17 Apr 2026 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776435851; cv=fail; b=h6NFBqldAQPUKkNJvqXxQWF2fKyxSCKoQTXI1mNdBJbNNsvPwOLttmmr1MfmwSxecGMBk3M0VvqO5hvGevjESzemxvxMGIK0O8HHS8GgUfDuRIHEfoKOWOBtHm3fT/TPeczodRQiFR5BOU5pRBl9RrfKGBViY9H6KEAb9qpfv38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776435851; c=relaxed/simple;
	bh=c0KTxL6YlsXO+ug62RwE1PncYDSO1qR2cLDfCWP58CI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ErhWYExOLnH7ybibpg/i0BqzRkCCEZcNfh12wiVghEnz2/TmYQ+HEyKwZRjfE1V9OLSxtDpkkLJjbefNzRUtcvASl2v8IoRV9hyu2kFkDwMEOAMQR171lhNyCDZCxZFt6vhtIckJQLtECDPLoT76VnnGqxRkrnenmMsJQC9uJLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JtjIDD1U; arc=fail smtp.client-ip=52.101.201.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JtjIDD1U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U72stZAmyCej+Md0/WRZ+NIQOxYlIyuvd4DRljN4QDfSI2CLd6szsZ2XLPVUZMdisyUmQXZF5q7VixWlhhBvJ9sA9ft7pxaJPCOVRNAi7IveP31PV6OL9FcynTtyHxnSWFKoYXFOT6efaZyScKYlwWKVlrpMx9swqVlYXdlyHfrEhy53ToonB7e7yB0Vs75tRunbK2Mwp0DlchWvvV7h+SgJxRROYGuvEKs5qI5ec26QH38TsLskVdVQLiyB4oD8DJFURVQJXLnPQYKs7FBBZ/KoyFpk04VFDLS7EvsHWy7k9zzWbJaLmiKLwfif6KOKd+qhBy4py4JsxLitdHtVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlT9HF08wmVg3aWGAzCAUoU8SP4p6GF8SYqhIpk6sB0=;
 b=c21gyUix/XIQD9kET4BfdzmAp11v7afIEQqgkWtfXhrd4orkmvWOGrqLPAgkdH+LHdESpUOGHk13dhdN95cPA101WH70iF4bj2Y7n/xYL8wHwJu88pmlb+3nQiGG4NaiYGav+IL2AjF4dkcM5LHtdFftA6/HD87cS7/PwVl8hBtcRbTqsABg5FLHbmqz71jFPe/wmfQ606j1PqfZMVFLhNHRkXTJ6V+l2Tr8pyA/hn36jSltFtVaOc9DnymiHBBS5xOeoHnkPLQQDOXGnGk7G9bxeRr9Wm7gbIygRVMFdw7p9ue7hXARB2BUkrSC4b1CeeWSHWUDjY/gvmsJ9/2ZRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlT9HF08wmVg3aWGAzCAUoU8SP4p6GF8SYqhIpk6sB0=;
 b=JtjIDD1UEFLfc9Pk50PYOJGXtqmjphDAiZ4sgxcI3IJKp6k9gYaAZoL1i+OLkw4eGxzPDyVDUPnbaZDOIPZU9KSEsbhXrNuJnJLC/90onxHy+X+ryE96DQSsQCiKSSTZbV4nT8JY/wJIMJOQNE+g00IXLd/1RD8kfKTHWZX8RlNaeDFNYOv5Fmtoc/MYYFE211NyRO4ctv5nVylP0jGu45erQBE/dbGmLplRTULGVUyHHEkaa2DoKBVU1YZrP4y9hL6Hv51IwjcmqZLxUEYBsYRR5mOML6BAha6WTsA+ISLv83d7aKQ8v+oboApZwunc2C6PmUwpUahWLRCO2yPrAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8135.namprd12.prod.outlook.com (2603:10b6:a03:4f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 14:24:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 14:23:59 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 23:23:56 +0900
Message-Id: <DHVHY4WIJ66W.1193DRXT7CFPE@nvidia.com>
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
Subject: Re: [PATCH v10 09/28] gpu: nova-core: Hopper/Blackwell: new
 location for PCI config mirror
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-10-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-10-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: f953d091-0c1c-46f5-8078-08de9c8cf798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0iobzeMdfxGQCrNG/J+62UvjLqcL8ZTg9Ff7I9uGZoRya4wFudc9JmbAG7emzs/iPy+2vgYQCwi+BkXOSc98w0zTemKRrb/4WOpJmk1TLooh1BM3fIlE32bVvlfsDor6RcUBLqqcEvbF3leTJOZ1QRVQiFZoDBsyd+T/gFxYnviE8IzySrbCbcBr8PLkXOvFCml+uOPkYU2Dx5Q86Hr2I8kmvJeq4xDiZmUDYwlTor+S/HK33bTrVTCoMlQ+0k/4ExCBa/kDvQwje1qo4d8Lpz/TuBQYOVYuwyHzIb+xInYUtWQh/2ZJ1PhT0lZCtcKTbEF/uAV5y72mvtZBsHOu8lwYmxQ0XREP57+pVGnzR1PJW12AZ5eaIZqop45WYnkgPg1HpRPe5BJf5QqdZoQ+/LSro4t3nz0Dnn6UfjI+zwc/SKPrPDNlEfs3TbVyln2CSVHRs+wF2f61xIuxFBYU4WNSRAh+GrNOimXdwI0QD6yWn6BYlBOq5ryv/JSBYIXkGOcvlcHTX46rCsJ7DvbFT7KV6ALIiEgF7mVBLusKbVwN7len9eMeqVX6M4/FmOvwXwqYFtwTCmJJ+e1D2uOiGZmR7MGmNXS+QMPyWNuD2dsGiYSJ74GyK9VMOEawgbMdAwcAguwbURaAmVo4GEEnluyowb3SQmriv9q8g6NgRNkQ2TND60ZvwpUNJIEFjr0+dmVwikq8pjXw+R63UGj11ww+D0VEsF2tWQ2gP94vnAc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXNZdjZvenc3QTdkcUNXWmk5TGRxZld4WDZPRVRYaW9NQVdvYitzNE9zRVlW?=
 =?utf-8?B?ZWZGL1JYZ1hSc0I0OEU3dDNqSEcwZGNjVW9DOWFmUE4rRXRDNWMzLythMFhJ?=
 =?utf-8?B?dER0Ym50cEVZRDNGVERJamw3RElJbEpOWkErWVU3b0M4cGZOYUVkS0kzZndw?=
 =?utf-8?B?bnVzRExOdm9GY0U5ZThzanFWSWpiL1dwQVorQ1NlTW9ERi85MEYvcXhoRHpB?=
 =?utf-8?B?OUtmK1N1eEZsY3lvZlhTQkdsZXI2dXZtR0lyMjlTNENtSU9Hd2NBNEwvK3Vr?=
 =?utf-8?B?ZlpvWUtGSnQ0bVRNT25xVVN4UENQa0h1R0d1L3I1QWE5ZW0xZ0ZUWVZNQ3pM?=
 =?utf-8?B?YlZVNWxwLzhQQ1BNSVVnL2RNM1hoNjllYTBxNDNHNTNsZExnZTh5RW1hdHpQ?=
 =?utf-8?B?V3ZGa1FRbHZ5SGNkKzdobTl5MHRMV2tyck9hQXJZM0hKYXVFRmtGY0RGVGZO?=
 =?utf-8?B?ZWFrbVpzOGZTZ0hRSWxKZzlYdXlCUUFENjBPdXJKYW4ybllybnR0Yzh5RlJR?=
 =?utf-8?B?eFVQazhCMEVYN1diMjVrcmg2dGFvRXhhQ2ZaQUM0bnYyTFBWUFJsVC9EMURa?=
 =?utf-8?B?VEtZVUdLak9jcmRYMHArbXdCTUZ1cEFpaGhnV1JxNUs1UXhkLzlNK2prR3Iw?=
 =?utf-8?B?ZGo3R3BjbFpiZk5ZWGxqc2twQ1dOclNkNTN5TnhWeG9QWmZkWWpncXpHZmVo?=
 =?utf-8?B?TlNCcmlhaGFZWktlOFJqOXdvYlhqN2tDYm9EZTZFZjJrSHIwRlNCWU5QMHg2?=
 =?utf-8?B?ZGkxbWZrM2ZsRXhUQnROek00SytkTlZQWTh0VlFRUWZaVmtCMUEwd2R5R2VN?=
 =?utf-8?B?M3hYbWYvbWhLMG1sK3RzRXlSZ050c2p2NXVMNFJZbEp2THNQZEZBRm50QzJQ?=
 =?utf-8?B?eWc5U3NQRXordGZiVkdHdTdNcEI0N0FIRnZKbGxndTk2RzArSGR1dDI3UG9v?=
 =?utf-8?B?SGd0WUZNQzZjL0F3V1lpWmRPQzZNbmIzTEE4bzczNFF2cHhGTklXNFE2QkdL?=
 =?utf-8?B?dDBZcnY4NnhCZkxwZGdJcmZEK25sdk1yb2YvQ05WdTVGUXVnN1lCUXdQb2VS?=
 =?utf-8?B?SzdXMW5hZXRlc2NUbDd3STJPVEx6cjFVNFpjTm9WMTNYMFFPNTVuWjRNdC90?=
 =?utf-8?B?MUthVmE5Yk42R0NMSHUzcDhvbWhtOFo4M0JQMi8vaDY4U0hyZ1lOZXpNbkNF?=
 =?utf-8?B?d2lSSWh3K2pRVW1CTTZMaUpZQmZQSTVKTWtsY3didmd6cFplelpIMm92M2tW?=
 =?utf-8?B?Tm5KaU9vVGN2VGdBaDBOcW9qKy8zUWNtVEtxSGJzNzNmdUJkSFRzOUJpWjFZ?=
 =?utf-8?B?RjVKK05NZmlJcXRvRlJCUFFMcEgyVW50bENOSnhsTUxqM2YvMTdDTE5uNjQr?=
 =?utf-8?B?NXZHb1lGVWVuUFRWeWdVeEJmU2thMzR4QkNFYWJrNTR5eklKQm5NTkNvdGZE?=
 =?utf-8?B?YlJscTRuWXJLYUhWVXJ4M0Y1dEZKdUNSRmIzYWcrTDA5VW9KN0RSTkI2VlNM?=
 =?utf-8?B?bHdOL01lMThDWkxZVTRObjV5VlB5SzRDTVpXbHZoWnJMRmFsc1BoOG51YXZn?=
 =?utf-8?B?WEtiUEMxWElGdXc1YkZJVTN0b3VncFlrU1RjZG9aWFdFdXVpbWh0d2kyVWVF?=
 =?utf-8?B?bVNLU2tYbWNIQ24zNUZJdEcxUktzUHBlZSs2QmttalF2eHVjUEs4Mmx5Vldx?=
 =?utf-8?B?NFY3SWJDUjZuNXlqUU15eTEwY29PTFJxcnNVTVAzZFRqNG16bHBOV201QVRT?=
 =?utf-8?B?b3FZbFZPVmZaK3ZwbVNUTE5kNVRCYkpmejRPWUNaUlRUZ3dldVV0QkpyMUYy?=
 =?utf-8?B?NlRLc0JNa1hucHlmcmZyVmNrTkxROW5UMGRLajd6SG5XbVUwL2JnWE9GSGxs?=
 =?utf-8?B?OWd1M0dpVWZKU3RMcElFMzFHbmpPTjZ0bjFVYmU1dnMvN0s3VjZZQStyUGhS?=
 =?utf-8?B?eEtNalRhMG5vTm1mb0VJSDBqaURodEJwNEdrWndXTHpCcDAwSXFHRzF0UzF1?=
 =?utf-8?B?dG1Ta1R0MlZENFBubXpabU9DaHRCR3NDTGJHaFllMFZNYS96RTdkaW1hSXhN?=
 =?utf-8?B?V1pkU0oyOVJFTTFJZWpNRUxlTGJvVEdqeXBsNUUyOHkxdXV6MUdFL2hrREZR?=
 =?utf-8?B?eVRvZ0RoMVd6bE5rM0NCZmZQenpXS3c4UmZubE8yck1VVTJaRk5pRDFzVGMw?=
 =?utf-8?B?MVdscXZvS291Q3ZNSzBDb1c1YXY5TVVML2sxYVZETzc4OTE1a0pGSGp1bGF3?=
 =?utf-8?B?M1oycHBKUEJjOVhVYStjYnYvM0R0K3M5K0JUOTFQOXRrWTJYMXlPV24yR2Fo?=
 =?utf-8?B?cm9QNEE2SFYyV21sSzVFSTdBekZhRDNxVjRZY2NrbGtrTlVPREZ0R3V6a0xs?=
 =?utf-8?Q?k0h+OxOmq5jHoz3DPpw4UiSQKnTzIpI6cYjbcDJWN5PYK?=
X-MS-Exchange-AntiSpam-MessageData-1: GxWwdS0mwtIziQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f953d091-0c1c-46f5-8078-08de9c8cf798
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:23:59.7810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNxq9GjJX+il4GaU8Yh+ABgMtseDf8Kn50oFK/8pxuhGZ0ciuZGkp1bAzlFH5mAfseaPH/EBdeEOJpiu4XnAww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8135

On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
> Hopper and Blackwell GPUs use a different PCI config space mirror
> address (0x092000) compared to older architectures (0x088000). Update
> SetSystemInfo to accept a chipset parameter and select the correct
> address based on architecture.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
>  drivers/gpu/nova-core/gsp/commands.rs    |  8 +++++---
>  drivers/gpu/nova-core/gsp/fw/commands.rs | 22 +++++++++++++++++++---
>  3 files changed, 25 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 18f356c9178e..1aa869693b75 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -169,7 +169,7 @@ pub(crate) fn boot(
>          let wpr_meta =3D Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::n=
ew(&gsp_fw, &fb_layout))?;
> =20
>          self.cmdq
> -            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev=
))?;
> +            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev=
, chipset))?;
>          self.cmdq
>              .send_command_no_wait(bar, commands::SetRegistry::new())?;
> =20
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index c89c7b57a751..9551a789433c 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -19,6 +19,7 @@
> =20
>  use crate::{
>      driver::Bar0,
> +    gpu::Chipset,
>      gsp::{
>          cmdq::{
>              Cmdq,
> @@ -37,12 +38,13 @@
>  /// The `GspSetSystemInfo` command.
>  pub(crate) struct SetSystemInfo<'a> {
>      pdev: &'a pci::Device<device::Bound>,
> +    chipset: Chipset,
>  }
> =20
>  impl<'a> SetSystemInfo<'a> {
>      /// Creates a new `GspSetSystemInfo` command using the parameters of=
 `pdev`.
> -    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
> -        Self { pdev }
> +    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chi=
pset) -> Self {
> +        Self { pdev, chipset }
>      }
>  }
> =20
> @@ -53,7 +55,7 @@ impl<'a> CommandToGsp for SetSystemInfo<'a> {
>      type InitError =3D Error;
> =20
>      fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> -        GspSetSystemInfo::init(self.pdev)
> +        GspSetSystemInfo::init(self.pdev, self.chipset)
>      }
>  }
> =20
> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-=
core/gsp/fw/commands.rs
> index db46276430be..c16acbb0237f 100644
> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
> @@ -10,7 +10,13 @@
>      }, //
>  };
> =20
> -use crate::gsp::GSP_PAGE_SIZE;
> +use crate::{
> +    gpu::{
> +        Architecture,
> +        Chipset, //
> +    },
> +    gsp::GSP_PAGE_SIZE, //
> +};
> =20
>  use super::bindings;
> =20
> @@ -24,7 +30,10 @@ pub(crate) struct GspSetSystemInfo {
>  impl GspSetSystemInfo {
>      /// Returns an in-place initializer for the `GspSetSystemInfo` comma=
nd.
>      #[allow(non_snake_case)]
> -    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl =
Init<Self, Error> + 'a {
> +    pub(crate) fn init<'a>(
> +        dev: &'a pci::Device<device::Bound>,
> +        chipset: Chipset,
> +    ) -> impl Init<Self, Error> + 'a {
>          type InnerGspSystemInfo =3D bindings::GspSystemInfo;
>          let init_inner =3D try_init!(InnerGspSystemInfo {
>              gpuPhysAddr: dev.resource_start(0)?,
> @@ -35,7 +44,14 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bo=
und>) -> impl Init<Self, E
>              // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems w=
rong because
>              // TASK_SIZE is per-task. That's probably a design issue in =
GSP-RM though.
>              maxUserVa: (1 << 47) - 4096,
> -            pciConfigMirrorBase: 0x088000,
> +            // Hopper, Blackwell, and later moved the PCI config mirror =
window to 0x092000.
> +            // Older architectures continue to use the legacy window at =
0x088000.
> +            pciConfigMirrorBase: match chipset.arch() {
> +                Architecture::Turing | Architecture::Ampere | Architectu=
re::Ada =3D> 0x088000,
> +                Architecture::Hopper
> +                | Architecture::BlackwellGB10x
> +                | Architecture::BlackwellGB20x =3D> 0x092000,
> +            },

Mmm, similarly to the previous patch, I would prefer to have this behind
a HAL, but I am not quite sure which one would fit. Any idea?
