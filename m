Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013049.outbound.protection.outlook.com [40.93.201.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC69939A064;
	Tue, 17 Mar 2026 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736079; cv=fail; b=Tk3kgSWTNLR6jR9zR3znQNlhAPTMrcnIOD4OwHfcUmiEJXyAsWp77S08RfavgFeqPT01ImHWdVTBSV5bpN0K614gUsw1GEglwDxJNj5DMXizbFjx5ZdZKGELYtmB0i8gwqnnc3wEYAzwUHCuETpllOPVkprQShECGbvVh+M5BVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736079; c=relaxed/simple;
	bh=PQYUwHa1WFD75EZJikOt0Tb8h3vFE6qnM6ZSaMwUmQk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=QNSSv0crPgQX/cJ9JJfrzyow9BrGcgXywlQBUjVdUOosD4+zsdTowFTnOzjeZm5ekq0B3y7iWQ8C04AzcXU8RlvtOwDyo+xxMjR+6xHa5PlXRryZTeuyz97AmjYaSl7EIOHJrAc53H/PTbRLAmM8zwH7XKtyp3JFeFulaAxyrbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Jo/mttIq; arc=fail smtp.client-ip=40.93.201.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jo/mttIq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzz7sn4aWdiUPjdim/kfeF0ziOdV1qZbYRwbo8b4+/0wu33v+ggf9D65UWsmLd4aH2Vu+oRglvsR98T8SnrbVYKEjJoJdgT2QZB0gbuUmHnexom7iWyYYnrJMDfFPmlIDyGj0jbv3te/ahkyd+scRFl7j+T79H2P3C6A/fYYVui++ih9N9xdNpxx1EYmXTOt2uUmAqZzRnL6SWjBtr2PHTUI0YI03QXRIZauKhZsBioIGMuhH3R2JtnAcqqNbRR7GG7Nt7XuHvi9fFTkAuc2+gF0nYBKP3xRV9wHJandlrp5nBQeMyJjFaQ9IPFrYuGA83gFRLgeULuxlJ/aWTRwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TX+eCWv9XuhJmER4anVQamNS5zZA16004XmF+ijwri8=;
 b=ptmKCHAEOGTTFsEyvurcyvVkk3XGLX4PZB7SwadQf4pyi6o4CqdzWf8bC6PfPmcML/3joe9kcLN77smlVgQvZ8+c72sdr1XK5CkMKZQhg30Il2lJk40NOtPD6lAWTxnbOKhkC/k4OKx5TkOPAPLAKeHYc/MPQc/k0+lm7o9gC1fmqef1BUNTeR3vOqoMqFeeZuJ/glJbyFiGoBR3ovl80MeI4SrRGNOhg27otEPrnrvLeP5hOCl54gbX34RSuVKPzE6iC+HCG8zrH2v2dhAcLodKscWjVcOtiXmBP0/lnyoegPL+afO7knfH3Cu1uizDNhqD8FOY8gSuEArKaEsiLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TX+eCWv9XuhJmER4anVQamNS5zZA16004XmF+ijwri8=;
 b=Jo/mttIqSHu/FmP6Whob/5jujOkzVhNfB8TZY7khzw5Lrhmc0XXbG7wsA9ub6e7m7BCNri9rd8ZYVJjMR9anR0elyjpUItCoBGZCX2XMrlj594t0j5x9akallJjkyrR3tJniFLCPQt1TFjRgSFn3vPQ+cAqoNWxH3iWt4dBZEU4Xa+4MhybLlxzJC5scdoJht5+1SNG3640HF5H6nhQdKXxYVMYPB9XqrNHlevN8q6IUyKbGRE0cTu4psXh81RdsvGPIJJY6spn+TjaxT4q5V57zjZXRoYGuVjsL9GVR9ZALoIh3e9Yaidz/EJB7ZFvoLvagOno1veT2DQpVdYquwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 08:27:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.016; Tue, 17 Mar 2026
 08:27:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 17:27:50 +0900
Message-Id: <DH4WYLLI4W3H.FR6JJLVTN171@nvidia.com>
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
Subject: Re: [PATCH v6 33/34] gpu: nova-core: Hopper/Blackwell: new location
 for PCI config mirror
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-34-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-34-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f17191-7523-43ed-f961-08de83ff1551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	e8PpvQg8YrAFt3fVGFzH3KgfKfTFKTM7pfVJy5Y5fYBWxdsAV0kd0eLjm+/ZeCw/KgYRQWjmD8Ybg/rb4pvZtbIMtmsPdVnZNHA+Eow3hppn4d1IW33Ook3sjPN0ctZ6kBfi6ePuHI/0cc0dnH0zwaU34H+wC7p/K28EKkNQtPxTUbrfiM1rv24TMJkKDc5PvLle4Z6IPC2JRaCYNWopZ4i7+Wc3peTnndeeakgMcOJPvxAz79lnPhhPG0jhdlcfc+OC7y0ZDDRrNsiFCRKr2k7TUwM1+OPLP9Ojq8Gw5C3YmkS6R3D7wBeRzc9FdXr3uMNZ+4mHOJgv6VXYTsIWbHv9f6m4nuP9LnReOb+g91e69EJudV0zow6RcQOb6BABDTZIi66VFohizzR2WuBqtmxNWLA03unfljLAhqhvS0m0Uf63pYCvdC7GlYilVMVrVzku9sc+Kl2MGfxq7f/8ICLLOxcTfKQVSktZbMYtYZ6ixO2LxyYXdSWCGNenTSdwDVjydw3lujBMh08lMIy8SkMNOmy0ps/U6/3hmW1UflrGBnb/st9aJmYorkKj+zmSdnmhXmFEdk86H6MMWQbWvgx2qn6aaBFWf/dckl01cNZHntVEo2wPI+pe/ntJihYff0GEZHAHSdTHIENzcEhxIwcuz6elDFPnjSFWrJ3yyh7eyBewRaAjXxQYIyLZCvKWorRtci41PaPl8KGfmwvRi8PBWQGszOJUNxo7JvK+ma0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnFLTlZLL3BQc3E4ekNPREdWZCtpcVZFdnhWRFUycHFZWVl5eUFpdkE1VGpO?=
 =?utf-8?B?cUk2UjlBZ3NVRmYybklLSXFMSVpHTzIxQWpYaERxblM1UHU1WmErd29MY0Vn?=
 =?utf-8?B?VlZscy9IamdaWmxpYnRUSGVHbURpVzY3RXB1WnU2N3JEem1hbEVveHZpazZP?=
 =?utf-8?B?QUlGL0dOL0gxaFNMTm40U0sxT0ZUeTZmaGJtNktpaWd2S3M4OStuWHlHNjgr?=
 =?utf-8?B?QUplSGhrRHFObEpycnI5dUFWM2c0ODRQWmVJY0VGdGVnZnZXVjNjdlNoQkxr?=
 =?utf-8?B?dlFZSzVDUHkwUTgvUS9hTExRN2pjSlVObEYvS1I5TlFtWjF4eHBIczJITjVq?=
 =?utf-8?B?N0lDSlB1MTRjOGIxUXA3NzVFNWpDWGpjOGV5NGRkQ2hDNGl0NlliVVFkTWtt?=
 =?utf-8?B?ZnQ5ZEI2WDdTejhwMWJnTFZhT2MzYWdlbis0MnU1VWtRR05Iajh4c3lKZkJi?=
 =?utf-8?B?U3pySTdETzlyOFZENlBVNXB1T24ydEZ3MVh0WU5Sc01EMUVpVXREVVM2a3N5?=
 =?utf-8?B?N0VKWU5EbG91OFpBVURyTVVERE11SisxNCsyZklIR3RkMytqVm9YS1gyNlBL?=
 =?utf-8?B?Q3hKUVJCM0JQY2dHZzIwSWhvRWFnM1gwL1hpL09VMkU4d0hqVk1NaDFLOVQ0?=
 =?utf-8?B?WlpOb05CUTdKenBlSXh5cXYvUXNxTU1PQWdmZUdHdE1ZRXBZeHdWZ0RPeXR1?=
 =?utf-8?B?cXhicGlIcnc1MFlBNlk1bEdPbHVtcFNhQUI5bVN0T0I3N2xWTjNicWFnSzUw?=
 =?utf-8?B?OWQxQlFCK0tTM3k3WDhnNUJhb01MOVN4WEppT01oMngyWUEvWkxIbWI5UjhK?=
 =?utf-8?B?QVFOQjVJWGxHUDI0dk1uamZmYS9zRUhLeHN2c3FWT3JVdHdreG1vMHR5OEpM?=
 =?utf-8?B?QlRvNlJ5MURGVWhMYUFFazB4ZVlHRkJJS2NMTFZYRmhBVVhUZHhsckNGbUNl?=
 =?utf-8?B?TTFac0hYOTkvczJsQitXZldnWW5VSWdVaDFBRFNWTEVVSDZHUzhhUlBmcW55?=
 =?utf-8?B?SEFKNGFSdDluQk5tSDlTWDEyRTVZNEpNWXFuM0I0MEJGQysyUEY1cm02VVpa?=
 =?utf-8?B?REZtelljRFNHemdyY1BmN0hrUysrRjJmL0FWTy8xOEVFMGdyV1JnamRlNW51?=
 =?utf-8?B?ZUV5TVJRRVJ3MCtaODR4RnMvRzFMc3dLKzdRa0xVMGxiKzlmbHZEVnZOU2wr?=
 =?utf-8?B?UEUrcCs4YU9QS1RlSG5aNndFbXhSbmtkYWhBNXg1RkJod1hLSDdrVU9FUkEv?=
 =?utf-8?B?MExOOVVIYVpMT09vNnR5MWNyZEcxeEU4K3JZbERQZ1BxeXA4UkNHUXpEQi8x?=
 =?utf-8?B?RElmWHZQdkJSN01CYWx0U09xSCtUcy9OVENwQzMyUnIyZmxzeVJwUm51TXRB?=
 =?utf-8?B?WnNEZndVZWpJYm5OK0JwQ1Vxb3R2SmNzSXZxLzRmY0NtMVlnU2ovL2JPcGxX?=
 =?utf-8?B?TWhwQi9TbHprbzVhM0d3ZDNEN2k0VnpRbkVER3NxNzdMYnRrL0NVaG9GcjEv?=
 =?utf-8?B?WlRzc0pkR1FyaTROY2ZtbkVNelA1eFo0MEh4ZDhSWW1zQUh0dVhjdlUrZVRG?=
 =?utf-8?B?c0FTcW5aQTE1ZFpzWklDWEFtREZCQm84Y2R5aFljKzY1bTk2WkpubXlic3p4?=
 =?utf-8?B?TVF6OEJaZHBUR1lLMjVmOW9Qams0WEFZMlpWZ2VYdDBFSjV2MmNlR0FtdkU5?=
 =?utf-8?B?MlVOdUJHZTRpVWtaNmlwK29xNXlQK3VOQkVUZVhjdXZXSEJCK2FLL2lBZ1kz?=
 =?utf-8?B?UXBPYXdLWVpSalg2SlBWVENsVUJTb1M2bm5uTmJwYzNGeUZ0UlFFNGQ3NmZZ?=
 =?utf-8?B?Vm1uWGlwYmdkN1JSK0xHSWprZHFqTUlzYnpTKzZRdkxnbTY0eWpJb0w3VDRS?=
 =?utf-8?B?NTMvWmtmMEdNWVBpQ1NWY0FGSnVxMC9HZmo4RHBxSU42WHFoWnVnT3M0cFpS?=
 =?utf-8?B?MUhjVWJQTG9acjc2WXRqQkZvSkllWlZOMkIybmx0ZmNjUlVWRjVMSFZVb1V3?=
 =?utf-8?B?SjZpMTh0KzBzbERKaEtJK3lRSHZVM2l0UzFJMm1uWjY1VnFRR2t3ZUZSaWlw?=
 =?utf-8?B?OTVacEQveC9aQmlITnpwTkdmcXdFd2hERlRjRm8wYk44ZVVZbTYxcGFZVUEz?=
 =?utf-8?B?MEgzRFdOZHl5SkhvdmlrS25rOWRiVnNnT3ZlSzVyZHhjYVBkRWwzWjY2Ukwv?=
 =?utf-8?B?ck5RTmc5Rk9HYUhKM3BiWkhjaG5BU2VJODd3Y0RCOUZzK0M5ODBCODFtcVhv?=
 =?utf-8?B?bGdWMG1sUGs5UjdxWjNaZEF3SVJFQ2NSVVBrZ1JNYVFHYjZiOWxkbXBjbWRY?=
 =?utf-8?B?U3lDeTQ2WWlHdm5pdjFNRXptaXV1Q1FhYVE0K25RSnhYSmQ5UE5iU0hka0Vu?=
 =?utf-8?Q?tsBqwGUsQlBwar5o/i/cOD5qox5yJOnVlPEWX8ZtY+6Uf?=
X-MS-Exchange-AntiSpam-MessageData-1: JUm9O1K5+NAm2A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f17191-7523-43ed-f961-08de83ff1551
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 08:27:53.3411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3noin+UO6otGXCUwufL6HLAf5KkPHVcn7Lh+MkMRXbRujNLt5T5k3e2Lpu2kuP6GKISc4QY1/WlSjPaIiUiCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111

On Tue Mar 10, 2026 at 11:11 AM JST, John Hubbard wrote:
> Hopper and Blackwell GPUs use a different PCI config space mirror
> address than older architectures. Update SetSystemInfo to accept a
> chipset parameter and select the correct address based on architecture.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
>  drivers/gpu/nova-core/gsp/commands.rs    |  8 +++++---
>  drivers/gpu/nova-core/gsp/fw/commands.rs | 18 +++++++++++++++---
>  3 files changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 7bf160723acf..7b49ca6e7a41 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -257,7 +257,7 @@ pub(crate) fn boot(
>          dma_write!(wpr_meta[0] =3D GspFwWprMeta::new(&gsp_fw, &fb_layout=
))?;
> =20
>          self.cmdq
> -            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
> +            .send_command(bar, commands::SetSystemInfo::new(pdev, chipse=
t))?;
>          self.cmdq.send_command(bar, commands::SetRegistry::new())?;
> =20
>          gsp_falcon.reset(bar)?;
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index 8f270eca33be..e6a9a1fc6296 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -20,6 +20,7 @@
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
> @@ -52,7 +54,7 @@ impl<'a> CommandToGsp for SetSystemInfo<'a> {
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
> index db46276430be..c8d1e025b047 100644
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
> @@ -35,7 +44,10 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bo=
und>) -> impl Init<Self, E
>              // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems w=
rong because
>              // TASK_SIZE is per-task. That's probably a design issue in =
GSP-RM though.
>              maxUserVa: (1 << 47) - 4096,
> -            pciConfigMirrorBase: 0x088000,
> +            pciConfigMirrorBase: match chipset.arch() {
> +                Architecture::Turing | Architecture::Ampere | Architectu=
re::Ada =3D> 0x088000,
> +                Architecture::Hopper | Architecture::Blackwell =3D> 0x09=
2000,
> +            },

Can we document this in the code? I.e. is the new mirror space unavailable =
on chips < Hopper?

