Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8D01917CD;
	Mon, 23 Mar 2026 12:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269938; cv=fail; b=lY5i9SKUXvjpP/rUhLmxP6RsDLS5IPKx090A2TLfXGlDcqT36ZLOXGxccpCDAEaBxUjZUkZgUITIrDuTtsENEMbacS742MC0NxOuRxksVM3hYF21aSj3xv3lzVHgX0whXdHQYv4EC94Sb0wRvhluMZGBgSzHVLfdz0YaJ0pC2kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269938; c=relaxed/simple;
	bh=+itw9b00/eKaIqubwX9A1PSMeR5ZuxgvYgA6kZKUuuw=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=nAC0lH5GSJSXQsLz7IMInNS4X1hz5dJMkjl4sp9xzJwJ/RJzEoIbONnlhKu7FHZkE5N1L+fYkJAP50YkmoOh0iC8RH+p39SbA9fMn2MUa7EUUB29Grwvjbd3QSf4Mt3ALuSIPSGiZnT7IEroihF5EIdeWCOG+n343xSbgU8tgMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cKfyYFO3; arc=fail smtp.client-ip=52.101.46.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cKfyYFO3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUg0CdETGOG3XsIilwEr0utRoAarSzp410+moyYoMJFFC9dOg3Nm8OQx7b/ujNE9jUtSfBKKmb+hwz4YlBfi08BrMQUog/V6vwEBMnyM22zBZP/46uIpW76UNDFLVet0pTWwNimuOihhxeYHoVQdE1DEtF+lAwdN5+oEjwnzfR3L6fouIjvDygrMcsycy1YdlIlfPO6tzEQ0uGOqRVHMDy5Zt8kEEWNaeXpib5qk4Y3Kmezbank9H+w3jWcPmN1CNOleHU2oHp1zbAHAXnJpfYPSpAaAUswQecSygCffiLS41p1iL3m+dhcAhoETtinzWjo3jLngcTEf5U5Ifb6LCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLt4f0fPfhi+JdihsCQderpeQW3cytokH62I15gMCak=;
 b=YTf9B3SIaYI0ebE7wtm6qSMsZsZrRjkktF1uNfQj9jyKSVKvpw/7QOyTgcEWJFa8/JSDKoA50/U/DLROti2rwtx3eC62zwTAh+RN3wV2JXnOIbvwz1mFoHvdsdpg4sExu91giImBHilI0vhF/b+fepjqat7T3Sfj3kHZJ1U5o5vfc75hDbpi3JCJfhkXCZBIipIlTC1d8tMPAQXoV6FnAgsFr9pyW+y/89AzZ7PXM3ggxfaT1qcuTJcXDjn9fhLyQPm3SQQofypM/lMPk9XwRozE3vFxfANInPBSXII6JYaMs3zebKnnorQJ/PivtOXA9H/zq2Pr5XXMBAVY/BcYWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLt4f0fPfhi+JdihsCQderpeQW3cytokH62I15gMCak=;
 b=cKfyYFO3y3Oic5Jkth+JRj6joM/31hREhErsZ2KZmwZ1PeTy5fUB/WZbQb16g/V+Uf72QRvWv/PBWmbdQXd0ox1dJyo54c8htbmYOdlBNndxjYc8nnQVb5tX5x3uSYS079xeHiXPe2OyN6ZYvcnOhmPVm5vkELPjCFIqU2XnGJcLvIRzF+tcwgR6xm47jVa4Wm0ZSztrGAsXovpfK3yuG9SNMNMGvHGDu92QW51xzqlPeaYGCU48wXXxgL/+P/J8nc/w0NNCntcqrb2Iz/mX7hEmMADPCL8rNLpmU8lHqEFQSG89QjNCNXlmIr1nGi21TdK1M7L4Ji2k0qeRdYtNiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8875.namprd12.prod.outlook.com (2603:10b6:a03:543::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Mon, 23 Mar
 2026 12:45:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 12:45:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 21:45:25 +0900
Message-Id: <DHA6738IO21U.27VI3S3XSRNZ2@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
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
Subject: Re: [PATCH v7 04/31] gpu: nova-core: move GPU init into Gpu::new()
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-5-jhubbard@nvidia.com>
In-Reply-To: <20260317225355.549853-5-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8875:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e961dc-7791-4b3f-5014-08de88da0fd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8iFbkLkekXqmZtxHhqeQDNNx8y9uHRLhMEOzVdcJDlniMfCZqkhrRYEn5OL0eJ8AvZNLfPe4UiF0ry2PtTze/AYzsR4WdNWazxbrAyVSc5Manr67Wm+wVVdl08ENAAmChqZmlC+JDiFN97D1bYLbcm2s+E8Gv83UID3BHH9VODgNGJlr01j3yS1VaAjdY/eiMIXgkrdLDMIA9IJtnoI4xj+dQPkJWtNQzcOIyR3X/gyJxheoZXmY7T2V+z4Y5DBoahVqpq5UOnOq33l4W0QQ6vepLu3Re4hJ4LsVCqYHUKP8jv/IDuIQCsUmPcBfyVHLCudCk2q39q/j8q+pb3Ku6WNwN47hSTtznYHplNgX46xWbJiRGzzVVVVPP0YJ/R4OZBgP5eGiqp3WADc6ETQ0plS+8BQFXuzn5Xk21k9y6GP8XCqAZiUS/nx1TbI1NTQtUIi5hw+T5DDZgs+EOibou7fT/niHayzEv7tr+cW4w+A2xErLOtlstuUYATo3Fedoee7GuuwzDHn2VgFR7twUHh3VRcOkzwhIO+atZI9VhvZIcZD8+s+3WWAdIV3J3Hhg4AHF8RTfy+TGzXyN4zQsRCOIf/5oa4+esb9M2gONQYd1ezBmHE/cF//xMci4L4+iikdqJD4uN6AqiE10wO9ykG0GmKRwGifXdpI9yPiQj+mKGM923BRBkXBlyJlwaj3pk5kBt49Nbj44mzxR65fPTE2Vd1i20I6KDenqknFWMw8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzAzK05EREEwbmR6cE1DRlltZ1poaW9UbWtZV3ZCMlZTSnA0ZEpOTGVHWmtw?=
 =?utf-8?B?YVJSVisvdkZML3dqSEZ0dzVKRWxrOGg3VjUwZWR0VHJRRlRPNmNkb0tuOGFZ?=
 =?utf-8?B?aHJ1Qk13dlUyekQwN2p4WHhMVGllQnpOazFHMUkreVNUMzFZSURIY0pxRHVp?=
 =?utf-8?B?ajNUaWhnOWxkY29hcWt0M2ZkNURVbTI5YlQ5S2haZTRndzQvUW1TN0pDa1l3?=
 =?utf-8?B?VjJmTVFNUG8xbnlnMi9PNUpYZ243L3BpM3ZvSDJsd1h2ZlE5ZGdsM2ZpNWhR?=
 =?utf-8?B?TTRSVDZ3OTczS1pOckVrYWVZUVRwZU5QUllmaVlqRFB6dVV0MTJyOCszUyt6?=
 =?utf-8?B?ZTdYNEx5TnpwZGRRemlWU1FIOEJKNkFsNWRITE56S3NyNUhGK0M0SWgxejVy?=
 =?utf-8?B?VW9VQ0tJSExDR3ZmSVNmOVJYT1lpaFBFR0M5OU12TWJxNWFGZXFWQTNzeXRk?=
 =?utf-8?B?V1ZSVnNScy9RTG81aUpNZDlHRjlSWGJJMUc3bTVpNW5SbEUycjFTeXJUY0lG?=
 =?utf-8?B?MmFGWlBQcHFoZDRiem0yY1R6TzhyVzlMc05aQ3pwclFYMkJJUTQ0WlNhd1Fy?=
 =?utf-8?B?Tm1hOW82cnAyeVUxOXFHU1VjUWRZNGFQaGNVRDBHWGpmUm1XUC8zUlVaV0t5?=
 =?utf-8?B?QzhXSXdRMGs0bVVMbTV1ZzVTck5GWmNZNkx4Y0hMdzlaTkpUbnZKUmlYZitC?=
 =?utf-8?B?SVdqTHFOcWpCL3BNek43ZERxbi9Da09rL3VnREFzcmVQazRNNlBaNDZLa0gw?=
 =?utf-8?B?RnlONGEwTE5SYkpsTzlzOStiYURNTmU5dE1OWVE1SURTVHE2NHk3ekw5OWt0?=
 =?utf-8?B?YnJnSGRYOGc3RmFEcTV1Sld3cWZXK3hzOTZEQUF1WjZRTVV4UTdSZFRaWVF0?=
 =?utf-8?B?WUdGWTVjVEJDSVRHOUtEUkswVW9FOHlrVlV1U2ZrOUFBd0JBUjNOSEFTaGlY?=
 =?utf-8?B?VmJiUHVyYzJ0SkVNWXYvNkZPZkhIYWdIRWo2SndVSHdSYzZQbEE1enhReEh4?=
 =?utf-8?B?TXExcHM5ZmhCOGtpNlBDZTFXcHl5dG1rOUo5WkRaWjZuc1h6NTRBZllDZFh2?=
 =?utf-8?B?UFRsTDFPVzlBWWtweVVpRnFJVlY5SGtvRnJBRGRpeEJNM3ppNE1VM09OaytQ?=
 =?utf-8?B?KzVpV1FJTk1vRll0ZVBKNlRQYVhhcU9ZVkYxaFFkdGF6NkZmNjFhdlFoNUVI?=
 =?utf-8?B?allybEhLMzkzM0dBcDhTVXFzd0tTVHhLRFR5ZGN1eHp2bkZ4T1laZHpGd3hQ?=
 =?utf-8?B?OExUUldKdFVvejRydnl0WktpVUM2TUJTeXdpRHZ1a3FPZzd0OWU3aGZPY01K?=
 =?utf-8?B?ODgzUzIwREZFcmJIdEFYZzlabFdjZWcrVUhyTWZDR2NWR0RubW0wVWdSMFUr?=
 =?utf-8?B?Sk54SnMzeXFjZkwwMXN1dVhYcFJMbDZCWTFVZU1NcWp0QktTZUc1bHYyODQ4?=
 =?utf-8?B?WUhtNkp1WngvMnFmNWp1OTFaV091d2toYXVwZjAzQmZ3OGtUcnFyOXpiNURQ?=
 =?utf-8?B?dWFBMFo1b2ZPVlg0TytWZFpQamVpWC9Kam45MWxxUjU0am1wUEloWm5lVWxZ?=
 =?utf-8?B?NGxMOFhhR2VjVVFjUXp0NGNJUlNVdmtsekVyYWlJbW40SzlVZC96NFZFMnNp?=
 =?utf-8?B?OU9OY2h4TmNnYTVzd0JsSVhjYzg3b01KSkpTNnM5b1BpRUFMbUZKZm1NbHhz?=
 =?utf-8?B?aCt3QXFLUk9NZ2NXU2Z0SWNEaUlPdy83N2RmalFKTjZxYTR6SDZyRGR0S3hO?=
 =?utf-8?B?RkxPaWVwY2d1RlYxMis3dEg0Sm5jSUl2T2Z2akpRbWRVVTBVS0FoY2VjUEdi?=
 =?utf-8?B?Z2w1RWV1QWNJRXdIZkkrOGowY0QrZUVRMEdqbHZCZzAwQlZBc2o2bCtmNWpt?=
 =?utf-8?B?SW45dEtlcDZKMGJ4THYvYzREeXRFVlB6ZEJZYjFtODRaa3IwNU00eGpRZWti?=
 =?utf-8?B?R0M2R2x0UThsTXloY3RNclBlNnRiQVRLdVV5NWZIMUJJSEc2dHZWSHE5b3F0?=
 =?utf-8?B?bWdWNEdvNFZzU3dxQmx3Ykl4bkp5SWJVejRaK3FrWHREdm54NWh4cFB3UDFF?=
 =?utf-8?B?SWZJa1k4NUFyK3dqV3hzMmlydmhxNEtXbVZBcUdCeWRzTHlJcHFoK1IxczA1?=
 =?utf-8?B?MlBmb0VwUjNpaUp2UE95aXZ1Yy8zVFl2Tkg4a0daZUl3QXUreVpUM2gvc0lD?=
 =?utf-8?B?U1ZheHc4Q0hyamhLcWtNaGMyTWlEZDhwdDJ5Mjl6ekQyRVMxaUVUWFRqRWtU?=
 =?utf-8?B?RWhFMFliVkIxMWx0M1Z2SHE4cktkNE9LOTd3R000VWFwMEhpMG13MHVmdFhZ?=
 =?utf-8?B?MUtSN3VPelhmNWE1dEx5QmFYK1JNcnp3M00xVC9WazdvL0lCUnB1SXYwWmxE?=
 =?utf-8?Q?1AcWeBiLM+6eTgPDA0nUxuoom548WZNo6R90jHpzNQ9EH?=
X-MS-Exchange-AntiSpam-MessageData-1: EMA2lJMk0+Jixg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e961dc-7791-4b3f-5014-08de88da0fd2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 12:45:28.5363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukqeIM9Ja+S3ZmEC49Q3s9rPw0I9VaOHvNmjBwldQrY8gLvmL1ubHtGdaDpW5FTt4pPwrV3q798f2uKOsyObzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8875

On Wed Mar 18, 2026 at 7:53 AM JST, John Hubbard wrote:
> Move Spec creation and the dev_info log from the driver's probe() into
> Gpu::new(), so that GPU-specific identification lives in the Gpu
> constructor.

That's not what this patch does - Spec is already created in `Gpu::new()`.

>
> Restructure Gpu::new() to use pin_init_scope wrapping try_pin_init!,
> which allows running fallible setup code (Spec::new) before the
> pin-initializer. Add Spec::chipset() accessor for use by later patches.

What is missing is why we are doing this. It looks completely unneeded
even when looking at the following patches.

>
> The DMA mask setup stays in probe() where the safety argument for
> dma_set_mask_and_coherent is straightforward.

Knowing the history of the series I understand why this sentence is
here, but as of this revision it is not relevant.

>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs | 49 +++++++++++++++++++++---------------
>  1 file changed, 29 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 3b4ccc3d18b9..8f317d213908 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -102,7 +102,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> =
{
>  });
> =20
>  impl Chipset {
> -    pub(crate) const fn arch(self) -> Architecture {
> +    pub(crate) const fn arch(&self) -> Architecture {

Why are we taking `self` by reference now? `Chipset` implements `Copy`
so this should not be needed.

>          match self {
>              Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self=
::TU116 =3D> {
>                  Architecture::Turing
> @@ -241,6 +241,10 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<S=
pec> {
>              dev_err!(dev, "Unsupported chipset: {}\n", boot42);
>          })
>      }
> +
> +    pub(crate) fn chipset(&self) -> Chipset {
> +        self.chipset
> +    }

Short doccomment please, even if it is obvious by the method name what
it does.

>  }
> =20
>  impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
> @@ -289,32 +293,37 @@ pub(crate) fn new<'a>(
>          devres_bar: Arc<Devres<Bar0>>,
>          bar: &'a Bar0,
>      ) -> impl PinInit<Self, Error> + 'a {
> -        try_pin_init!(Self {
> -            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
> -                dev_info!(pdev,"NVIDIA ({})\n", spec);
> -            })?,
> +        pin_init::pin_init_scope(move || {
> +            let spec =3D Spec::new(pdev.as_ref(), bar)?;
> +            dev_info!(pdev, "NVIDIA ({})\n", spec);
> +
> +            let chipset =3D spec.chipset();
> =20
> -            // We must wait for GFW_BOOT completion before doing any sig=
nificant setup on the GPU.
> -            _: {
> -                gfw::wait_gfw_boot_completion(bar)
> -                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not co=
mplete\n"))?;
> -            },
> +            Ok(try_pin_init!(Self {
> +                // We must wait for GFW_BOOT completion before doing any=
 significant setup
> +                // on the GPU.
> +                _: {
> +                    gfw::wait_gfw_boot_completion(bar)
> +                        .inspect_err(|_| dev_err!(pdev, "GFW boot did no=
t complete\n"))?;
> +                },
> =20
> -            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec=
.chipset)?,
> +                sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, =
chipset)?,
> =20
> -            gsp_falcon: Falcon::new(
> -                pdev.as_ref(),
> -                spec.chipset,
> -            )
> -            .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
> +                gsp_falcon: Falcon::new(
> +                    pdev.as_ref(),
> +                    chipset,
> +                )
> +                .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
> =20
> -            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
> +                sec2_falcon: Falcon::new(pdev.as_ref(), chipset)?,
> =20
> -            gsp <- Gsp::new(pdev),
> +                gsp <- Gsp::new(pdev),
> =20
> -            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falc=
on)? },
> +                _: { gsp.boot(pdev, bar, chipset, gsp_falcon, sec2_falco=
n)? },
> =20
> -            bar: devres_bar,
> +                bar: devres_bar,
> +                spec,
> +            }))

This diff is basically a no-op? The commit message should help me make
sense of it but since it is incorrect, I can only guess - and I suspect
you are doing this dance because `Revision` and `Spec` do not implement
`Copy`.

`Spec` is 4 bytes, both it and `Revision` are prime candidates for a
`#[derive(Clone, Copy)]` (and `fmt::Debug` while we are at it).

I expect that just doing that will simplify the following patches as well.
