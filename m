Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573503D6CBA;
	Tue, 10 Mar 2026 08:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130031; cv=fail; b=qOxIPUSAqs0vRDFpNNSzG06PhP3PDTDTlKBvrps1vXEm8N179i917h6S4WKbv94LhECh8VHsXGHTDG9fr+sTthhX14REzBDd8GaOp/QHibiCMs389x12pMtvfVhf8RLA9mzV7hpjf+IHGN+IKCkBn+WkE2ZvfEeskrRoNl8tOJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130031; c=relaxed/simple;
	bh=Vc1ESxQeYMkH4Lk6lGryI+0+PjbIYXXBnDgnVLpcFGw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NSWdHT4hJq5wCxhW/GZaO2qWLQ8CW4DqOJN1reyFR/sb05KheIpDM8hb2SrB7M6veWeSZU446Ay7zvYWAQppNx611/AtVSDa9O8EgcLoYBLBIcnP9EqOLf40Yp3iHmmNUm6uhmP77M0HvQyyQ8WvmdqkJdy90Fcl6jXYwVnSb0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uOWiSK3j; arc=fail smtp.client-ip=52.101.62.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uOWiSK3j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfuQbQLDB5yKYbnrJDi9RZ/Xme787TQQRa9xyuXEczVG02Eu7jX3Qg40ik030hAUKgWMa4ObDS9ga9rkiHbS9+IrqMUOwuUSlZ8nJCwRUNKjsmfJmHQwNF+3YpMbpORgZ2y5eyDHBXCKGgCJoY0/dgqSbGE+ZydgqJGJJ6M55FYK+f32JZF5C3wqkURvzRGS4kQylzXPQsl2ppyIXRTCkqWqdEPsbU9szGvHyJOA1VoRrhA3o/5t5SSGpQDCkemBh00HQUpt1pb3KUJoXY+fVRujMH0edH20UKZiVMCczL2wjgwOM+Qlz8bGkFwmjU3/WqmcRzfDN9XLyQ/pvJKpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dILYh8SwYXD5AAhTNsEmIq56L8T+ZPt8PhETuEx3MI=;
 b=A52YJ+2OR8b8xd93APpvZVbMghj/CH19aw42d+4fY4LRN6tf30szthK4XJUQLFWmcQcUYNuNEJFwVoMTGZnTZ6/aJIbmpuAXbdyDb1fd/4ns/R02apoZPSTGSb7QDP4fdcd8hE7V43BVgq7A+dXMyWlXlXkU49yMG6YPBIOGDzCd+ijmL4CT6C86nOigQP14retzH3wS8zM3n9aDBm9cO6Qt+FxrRjVI5djsLfgvzirEtTqTlj16vSVwzsIW749WfbGh3fQaWn7ggFBYRj0aG+j7etV38A6SoeDCRLvyqfYU2S39d8HIZ+NIkhzrENprZA4lIe1KTLgvhjoJ6P4pAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dILYh8SwYXD5AAhTNsEmIq56L8T+ZPt8PhETuEx3MI=;
 b=uOWiSK3jgrO+0k2uXOICR0svKFnyDwVNwbVIIjif100uMbDA2//btNx4FIkSV1d8QVNVn/la8Q97M4fmdmKmUjWu8oCLhODKASt/YjGTATNAYnZUds/vKHplZy6QtJknJ5TRd81zt6r6s5tAWKFHCLi9ROSKTfQBjQlRs+4mzPK2cCEDBsFLw0jykB7P3evPurd4VzEVnQrHoV/hYyaLMPJyv40OSbOwj2aqw8VOVi1/ryp1l8XoOHZ20yKGViYvM08QmpihIFQ4/kKwwBTZoPyprHJezzC+9YSRKJDR/Y2m3rUjgygdohnf1xkp0nPLtiQPfd4Rm2xM92TtfdJtEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7512.namprd12.prod.outlook.com (2603:10b6:8:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 08:07:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 08:07:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 17:06:57 +0900
Message-Id: <DGYY4SVKBYUK.2P9ZLCZPVOLSI@nvidia.com>
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
Subject: Re: [PATCH v6 03/34] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-4-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-4-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 3466cfb6-259c-4329-77af-08de7e7c0223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	+J77Baa00vSNfd0nlWGVLMwe1ZYwON/kK2iH0PoqFwj00Zznf9paKHfY/YYXNqDnb+bgEWEG2aXAArPmqG4V1wEPJcEuqWAmJ5cMcxh3KfPuSMQ8PtF9VWE19lgj83itjH+bWD8V00HWorAzSKIv5fgPOXJN0sPQ9l7TPXg926ouTkmEBiZFxdouja76VMAK3ClWp4yJ7Ka6ubWW5SdJ0euXc9F0xTzc3VUa5nIij9S773rST/U4SbmufzRup5j3YJjTDZayFZu4mK2CYL5ndvq3GOocwfhEWaMVyp/XOgDt90fWsNidCt/JIKA6zlJZyl9QATAxC16X8KgCYcRZ4+UD+r1a0o9pST2JMwswAAY/OX1oiSIGBIpHGb627NJNwJBTSxsCQl5W8niSqvPnGYCLZVsivU5F2Mh9F7HtI6Q6yMoiI05VIq70OC9U8sTkAXIefe7/hlGx1L72Q5EFlcJUD1wxWe0WDzBjeRar9aInaiMNAf5zfvNU2qwwkAhlX5DvjLLTjbyOSJSDE2A62mMqvCEryDwUZPjtCY8ZY6Pa6+QBj4SmC/VlJ7xR5pQL3wKo+Msm7u+kVMZmw8xe4p/mL7z0Ae2YSzmoULovZUqYjXTwp5NhcUAnLQS3p1hupsqjXVRcLu9y24N6VOWpYIdTYSN/0XN3SloTcp08hf8+KdanYrWqMDPQmM4zxVrJnRh/6L0frL7QdhZqvKXBte6fjZgUaBYMzb8VtP1+oy4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHZacEkxc2lYQktmV2ZkZFZWMVpNVVh5azUyQ2p6UE9iRklDRjRHWW9pUlBo?=
 =?utf-8?B?S3E5Zm11R21CZWwyaUhId0htWjU5RHN1N3RDTHJsRmxmTTFrUFN5MU9VcVdS?=
 =?utf-8?B?VTBzckIzbEVaQ0xzbVBSTmI2cGRQNzhOSE9Rbys1VXl6bnJUUkJDNzNzY1B0?=
 =?utf-8?B?SlFtR2tDelVUUGx6aTZ3anJZZm9FNTJDQVd3OFJlVXg4M3llVTdxMjlTZXpD?=
 =?utf-8?B?MkY2K0V4YTczWGxhTDBoeHovRHNudHVLVHkwRmZlV253Ny9ncmozNEFRKzhx?=
 =?utf-8?B?QTF3RzREQnl5bVNlSERJM1FMZjJ6WVNEeGcyRWtUZVJIdTVkNCs2SzQra3RH?=
 =?utf-8?B?ZjlmMExiRVlmUGVCU1ZiVUQ4Q1RrSWt0b1B5a1hoblIwTk12ZU84TGM2bHoy?=
 =?utf-8?B?UlNxclJtRFRrUGdISXc2MWFuYkUrWDBEM21zekhFVWtSZzBoK1FOaW4rM0pZ?=
 =?utf-8?B?WXBibk9sNEwwUGI2NzE0bG1GRjBOY1pYKzNSSHErNmdwOUtiQUp4dEhKQWdj?=
 =?utf-8?B?VVZKcVhoZmlnZlA1NWt3VGNrYzUxVUhkeHh1bEpEM0c0QnVvVERGdXRnMnEw?=
 =?utf-8?B?MmN5OGNDeWlzeUZrT0w1U002YjlFd3JQb0xacXRaZTBLNGFSajVnQmcwVE5R?=
 =?utf-8?B?cHlxSjB0ZXltajI5QkVMSnM1RHhZdEtUQlFLL283aXVNQlppMDloWENNWjVt?=
 =?utf-8?B?cUhybXRZWnluTk15aTFHREVBUkRtNlJOL21pRUJJRWxYTUVuZ0c1U0VHaldw?=
 =?utf-8?B?cUY2cnQ3ekhCWWhWVTJzakVhTm1NOWRBVVJ1NFpnRG53VHQ4OUdIVEg3Ylhr?=
 =?utf-8?B?TUVGL0tZcG4yQ1Nhakg1OG1IU1dtUWdheUtMbStzRFA2aGpZZGY1WlB6aTdS?=
 =?utf-8?B?K0p0MEovWjM0R2w1SVp6MWUraW8vRVVuYWpUa0pnSm43VEg3c002NVZDbFdM?=
 =?utf-8?B?TlpsRVZhZHhISWdJSC9CaG12Z2Q0clQ3VWQvUTBubkVWbHMvWkh2MFBQTmE1?=
 =?utf-8?B?RzZSaENPemZWbmZ3RTNvdkcydzBoNDBudCszdjRtTGZ3QXpIVnlvUXloYTli?=
 =?utf-8?B?dWt3cEVIU3NpSFR1WUkyU2ZmYVdvaHBBM3RCa1EzSTVnd3lqdkQ5S29uT25D?=
 =?utf-8?B?WWpDRWpicGtMRXJUbVRYZlNkVUJYOHgrRDhhZk1TZ2tBek15a1hHZ1dDNnRU?=
 =?utf-8?B?ckJWUEh2VENsWFQrS3pUVkpKOTE5aWVCY0N2K2Y4cldtL3k3K05aL292eW1E?=
 =?utf-8?B?NWlmNHl0eExSRWZwb3h4cWpnUVMyYkd0V09aWW8xemhXckRDWjhJTUE3b25T?=
 =?utf-8?B?NjY1N0J5TXFyczdkM0NRNXBzTnZsbk5hRG5QNUpuZWxOVldpbVUySHJYY2NO?=
 =?utf-8?B?Yi9CRWsvNVNDMUV5RGt6V3pabThGd3lEbXJheVJXWTNRSkluUDhRRUtVeVEy?=
 =?utf-8?B?cmtnMmtvRkFmRkl4MjgyWlJjbmRUc3R6NzdZNjJ4eFR6blpOWmI5cXErV1J4?=
 =?utf-8?B?UGxFd3c1WDF6SExrMlFlK0c4R3VVbEVvU1Y1K3VyRDB1TVVyS3FVYzgwUit2?=
 =?utf-8?B?RzlrME1US0ZORFRYS2dqRWp1NFF5ZzhWN0Y4OFNHOGticXJVakwvblZJUmJD?=
 =?utf-8?B?KzZHbXlzWDUvYzB4T3Q1bFNUMXFZNlcxZS9mTDRYelZXNi8vV1ErY0hkbDl1?=
 =?utf-8?B?eFJIQSsvb01jQ1JXa3Vqc0VwdWd2VnJnOFVTVCs4UW1IcG5ZOGVsaHQ3SFln?=
 =?utf-8?B?eVNWQ3hENERucHVrUUErY3hBenJaQWtyZ1RKNjVrbVloQitSMDhyeDBJT1Fi?=
 =?utf-8?B?TGxTYm1XS0l1VnljSXlORGRNMGpYMHgrb3p5dlFYNnRmSmRqeUtiU3dLakRn?=
 =?utf-8?B?K3MzeFA5VHNGSVBERWxibGlLTlBqcmRyYkNDZzVQUlZYbnNudGhQRzZYOUpB?=
 =?utf-8?B?SGVzNldGTVJzaFhHQW10cDI1dmhqaWJvdTFJU1g4dzlzUVlRTGREN24rU1Uw?=
 =?utf-8?B?NFJVL0hKZzhSMXcwMDhKeEF1WFVFU2tOUytnK3d0NjZKNjdDSnlYWHRJQVZx?=
 =?utf-8?B?d3U1S3I3Y1hpMUZVZFI2OUk4S3VIWHpWOHNnMHZYak5ORk9WcmI0TFoydm5r?=
 =?utf-8?B?eUR6ejJuQk1LaG96UmxMV3NaUVlxK0FxL2c1OGhnZUNxSS9TZElwZW80NW9a?=
 =?utf-8?B?SE42UEU4dGkrK05aZ2p0bnZ1WnJheGRZZUpMV0FKWEtBbVp3U24rRVZtN0xO?=
 =?utf-8?B?V2NyNjdRaStXbmF6alV3aFRMY1M4VUNLYkJwZ2t3NkllVUJsSW1Ld05GL08v?=
 =?utf-8?B?U1hXZHltbmRxZkZRVXMxUm83ejJPeGZsR3VaK2lVbTRCRjdRcW1pR2dsUSs5?=
 =?utf-8?Q?wWo19FfOusd+sETgOKiHfzgJKoGhhb0eKVUCcXx4Xs34g?=
X-MS-Exchange-AntiSpam-MessageData-1: eqhjoxZa0JO32g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3466cfb6-259c-4329-77af-08de7e7c0223
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:07:01.2021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+vGNafpJ06PjSTRs9ZLjyOT9JU13eVpy1QVoPZPyF83deTXmLiZXr3myEI4eBp1PIfRdeK58CxrQ/IADTvgFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7512

On Tue Mar 10, 2026 at 11:10 AM JST, John Hubbard wrote:
> Hopper (GH100) and Blackwell identification, including ELF
> .fwsignature_* items.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/hal.rs   |  3 ++-
>  drivers/gpu/nova-core/fb/hal.rs       |  5 ++---
>  drivers/gpu/nova-core/firmware/gsp.rs | 17 +++++++++++++++++
>  drivers/gpu/nova-core/gpu.rs          | 22 ++++++++++++++++++++++
>  4 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/=
falcon/hal.rs
> index a7e5ea8d0272..c7f12f2a7a35 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -80,7 +80,8 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
>          TU102 | TU104 | TU106 | TU116 | TU117 =3D> {
>              KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn=
 FalconHal<E>>
>          }
> -        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | =
AD106 | AD107 =3D> {
> +        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | =
AD106 | AD107 | GH100
> +        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 =3D> {
>              KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn=
 FalconHal<E>>
>          }
>          _ =3D> return Err(ENOTSUPP),
> diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/h=
al.rs
> index aba0abd8ee00..e709affaa7e8 100644
> --- a/drivers/gpu/nova-core/fb/hal.rs
> +++ b/drivers/gpu/nova-core/fb/hal.rs
> @@ -34,8 +34,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn =
FbHal {
>      match chipset {
>          TU102 | TU104 | TU106 | TU117 | TU116 =3D> tu102::TU102_HAL,
>          GA100 =3D> ga100::GA100_HAL,
> -        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | =
AD106 | AD107 =3D> {
> -            ga102::GA102_HAL
> -        }
> +        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | =
AD106 | AD107 | GH100
> +        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 =3D> ga1=
02::GA102_HAL,
>      }
>  }
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 9488a626352f..bc2243450989 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -222,6 +222,23 @@ pub(crate) fn new<'a>(
>                          Architecture::Ampere if chipset =3D=3D Chipset::=
GA100 =3D> ".fwsignature_tu10x",
>                          Architecture::Ampere =3D> ".fwsignature_ga10x",
>                          Architecture::Ada =3D> ".fwsignature_ad10x",
> +                        Architecture::Hopper =3D> ".fwsignature_gh10x",
> +                        Architecture::Blackwell =3D> {
> +                            // Distinguish between GB10x and GB20x serie=
s
> +                            match chipset {
> +                                // GB10x series: GB100, GB102
> +                                Chipset::GB100 | Chipset::GB102 =3D> ".f=
wsignature_gb10x",
> +                                // GB20x series: GB202, GB203, GB205, GB=
206, GB207
> +                                Chipset::GB202
> +                                | Chipset::GB203
> +                                | Chipset::GB205
> +                                | Chipset::GB206
> +                                | Chipset::GB207 =3D> ".fwsignature_gb20=
x",
> +                                // It's not possible to get here with a =
non-Blackwell chipset, but
> +                                // Rust doesn't know that.
> +                                _ =3D> return Err(ENOTSUPP),
> +                            }
> +                        }

Can we use the same trick as Turing above to avoid the double-match and
unused catch-all statement? That would look something like:

    Architecture::Blackwell if matches!(chipset, Chipset::GB100 | Chipset::=
GB102) =3D> {
        Some(".fwsignature_gb10x")
    }
    Architecture::Blackwell =3D> Some(".fwsignature_gb20x"),

Note that this is not perfect either, but it is at least more succint.
