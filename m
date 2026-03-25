Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021105.outbound.protection.outlook.com [52.101.100.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED93AF64B;
	Wed, 25 Mar 2026 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453366; cv=fail; b=MvIGOssXoINP4S6ARZ4BjwkmEUYpIiG/LoS9wGT66DX9MJM4o0gvuHsZ/mbqeEpvZKCjNapMfKizjmMAXuD2tihz1y6hT8KhmVFyxU8jzzJTUqwRnzV1CuHHakV/QJ4qHsTq0Lefx6bTqDXvkP8VrKPfILZrfcSYyYt58rPoa2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453366; c=relaxed/simple;
	bh=EEoBWea0gv4/SfFjyTrJkk0sNKEZE56mKcH8M4GwAtw=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=aM8/EuYGftjezX1ryu4/oAen81CmaoWRGzW/wRKEbcI5VART+nyLMbJaU8zK1uwRoCtm+kov7AXq1tGmVj5ctK5q3LincYwucORM+GyRRw1nque4Ejj7+Kt1SxpsMeT3UmQ2O9STiar9f9+DVNs+4OA++gTGxICq/6JtYNgNeDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CtTjXumX; arc=fail smtp.client-ip=52.101.100.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CtTjXumX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qd3Su9P7RFqx6AryX43KotRKIgsZXlZaL1IfR5OLFzoNR7tg55fBqemFS/zZW7hGmH8bjd1jv4fYl9ZosZVNQN/O+kxte58Kx89yXlG7h8jgYcsBEnGxTJsd5cy2TXRlhTv2BE9AJ5tG1KYfGlHzacNjj2eTwTHazOOBWuHuS1Clu95hxRIFFkqldjowtqaU/LyrPfcoI9R4ortjDbhhVgA2DlaHzCT26XhEcdRIUxJUj0u0Uaw9GPjuQJrEfTyGhNhUR6M5yjkv7/ZcaOPJnsBrfmzaml67gNkSZC2AiFQJ+afbOE81RBl4XIBQKPU5DU/Z5J9t/BZ63Pv4+PWRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0EflpT32fWQLS3kXIbdNFWG31F4vfBmgmnTZuZKZn0=;
 b=JbctK7olMYTxI0UfMAx+2AkzxiiMKWcvp0tfTxGCRnBgmJ61WAip+vnVLz7YCNpfzf/Foit/Ms/1OFPpmh/HbpnavUSqtrJAmDpd+brti055+2hJ0Qf8Vm77UlaX02eQdjBbbXhTTceb5uFDsTwyoQN46hA2Yx6P20dO8uCNoI8DsSR9D/PadRCwUUrcN5egu1y9UUBq/zO8i8wB7hDJhZYesRpq8O+x+9IklFgfJG+V66Em8zwnJpDEIwTAPMChdF6sC3WSoTYOyH0YJA9lC5RX1algo3UGv05Q321bnE5pUrrR6zh4x6A8zWP6MxjhaIHQpD8jz8bpbwhJBP3xeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0EflpT32fWQLS3kXIbdNFWG31F4vfBmgmnTZuZKZn0=;
 b=CtTjXumXIlEonZHdp+g16ZuGdS/DRcfVnUdcZbztWIbaP861Db06hAVUKmPPtR643S1B05+zLLxY/ca+QMA2wjdArenkj/iWRgH9Ue3qe8oYyYub2KkdmwasQ8defhCJ8c0d3VWngPUHQLUzv1DPoPhoFRSI/SRTX25UOYA9W04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5377.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.24; Wed, 25 Mar
 2026 15:42:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 15:42:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 15:42:40 +0000
Message-Id: <DHBZ7W9YXXKP.2PJ1UM4E6TYTW@garyguo.net>
Subject: Re: [PATCH v8 04/31] gpu: nova-core: add Copy/Clone to Spec and
 Revision, add chipset() accessor
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-5-jhubbard@nvidia.com>
In-Reply-To: <20260325035242.368661-5-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P123CA0192.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5377:EE_
X-MS-Office365-Filtering-Correlation-Id: f2813c79-a303-43a7-0de5-08de8a85267f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|7416014|1800799024|22082099003|56012099003|7053199007|18002099003;
X-Microsoft-Antispam-Message-Info:
	unynQ2aPgSgg6uK7jfLajgn16d3pB+8J4uN5kUpHGe5s8uHJsPjT84cV8lZEhHA/WjlwdkZqPOmTiD80xuzovtFkHGjjQoNLnL7VlllV8Wh/yKPIp11hy/4MMQS8c7jaRfbKqWSKyq9GEVbifUBzO4xE+FDzNLlqhmoyvHP45Dfy6u0ECjNFyo5dxd2+2G6iLBR9qqtiQ1RTHuT7e1O3podZbHEzc1yStsIyp+3TR1h1QlaMtnJ1C9yVpOfjB4NADOVufRpLBFlydvB+WVkHo+sbaS2mca1VH/GJSnus/w+SnyEOCHIX2hh3Mo8brIX88PJFau+hvO6a+W8SxMIhOOvm0SOyyWNzWDuBMCewzF//InQk5VLoaFh6HoIZ5/Z+BZhfWYB/T7E/NgRww48J0eMZWiILvOyQEIAeLpb/blrml0gpjcnCPxfycXA+IHAEqsR+dRNqap4HlrwR5ATLROvJ2JeOSK7nz55v8KNWhjHmYb88gXXfu8SN69t2vb4hciCsxM8uGjyBUiCxr0fm76ODgEBj9Mwic2ONOsmHYTNuy/w3jo5w21teoVs2ZrYMq0iDAfVK6OSyhdJs80uqJNzh7GH/NaH0rbcwyOjrfgQAMzGRIUyP5nrX0goT0wlzkwXDa1lEUHabVxmHKyTK+pJP87AQcW8+BjIm7W33VGdPLEATFtH9BOivdL88PyqzqPrDAZdJGYIKE6SVEDgqWVgGSxzCOonSiKlD8E5AgUo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(7416014)(1800799024)(22082099003)(56012099003)(7053199007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cklqUHdraStDL2JTODhKeUxIeDJtTUNrZ3BYVGNRNVRKRkJ1UEc4SVFnNHJ2?=
 =?utf-8?B?SmdXdXh4elN0U21TV0hlSWlha0ZTM1hGM2FqWkJBZkVxeVpDVHcvRnBsOGxO?=
 =?utf-8?B?NVJSYTNsZmNwMWhlS2U0K2VWRWwzcUF4UmJIalkrdWttVUUwWkhHUE4rajBV?=
 =?utf-8?B?MXl3ZVhrRFNWTTU5bVJXTkU0STJ3OUVlclMyYlkxWmxFSVlMRGhDeFdQWXVv?=
 =?utf-8?B?OUFIR2xIblpzZURuNnNsRFVubVhPR3o0SzhTS04zbmdmcC9PYXlFbzFHV3A2?=
 =?utf-8?B?K01Kb1RPYmVPVlZUOGcvdW04RmNDMGFUSGtnVnVZS1hBS2xmY1hzSUs2RXFM?=
 =?utf-8?B?a1E1VWFzbnRMZTYvNXo0dkpkcUhIUXpZRnhFZEc2bFliYlM3aFRXUC9xOXVu?=
 =?utf-8?B?MDkyT0VhQmxsYXdSTy94S0Z3bGN2YkpRNnVYK1AvZ2hldXFvWW9uT1hsMmpt?=
 =?utf-8?B?UHJ0a0tOQWZQZGQyU2dVNEhOblZkczFzekg3Q1Y2QUN1ajk1L0VCZzl6QXc4?=
 =?utf-8?B?bmVua08zM2UxNWZkMmo0U0tSb0RQZ2NLdm9XbE8rcW5TTnNiSVRIQzVFL241?=
 =?utf-8?B?UERGYjhMZG9hV1gwZzdaa0FiK2U0VE5wSXFIOTVRLzhhVm14Rk5pZTR6L0FQ?=
 =?utf-8?B?RHBsai9hWkNnbTY3WEg0MzlwaTBaQ0dWWFBOc1h2ajYzREQyNlczaitycXVJ?=
 =?utf-8?B?RGNNUFRrajgzQURwNjRSeTRLOTBJaGZCaEJUcVFxbXJXWmZ4Z3VPVEJ5L0o2?=
 =?utf-8?B?UFVWTHNjandzTGYwYzhHenNMT2lDOGdLNTNFTERSZUFKdk9jN3hiRDFRbVF0?=
 =?utf-8?B?MElSUWhoa0ZBSmtvNzhOZnJ6U25OemZ0QXdweWNDeFQ4RGNuVVY3WHM3ck1I?=
 =?utf-8?B?aTJGZ2VJMWlyZjAvc0NJUjg0eVpteWNJYm5tQzRlVy9adUV6RDVOenVmMURN?=
 =?utf-8?B?MUs4Wm12NTIraTJiMEllNVZKL24wcXlRVTAyMThpSHlMcVNTSDdZQzdyczVV?=
 =?utf-8?B?bFFSeUVtMkJRb0E3YmxGU2g0bys5dFBRc2dJcXMvRWJFTlBvMk1OVll0dEla?=
 =?utf-8?B?Yy9XY2JhcDY2S3lpV0l3ekVlUHo1UngyclY1VEJLZlN3MEJEMkJQeWd0YVJS?=
 =?utf-8?B?KzVjRGUrSGtTdW14SVppSEtjUDhseG1Dd2ZQRjYyaWczVFNYUTA3czE3bHpw?=
 =?utf-8?B?L3NFbEhvSE52OGZtWVhUTVNyckFaNmhIL2c3S05uOUhENmxqM2QrckN4VDUw?=
 =?utf-8?B?blMxS2d0QjhjWkpMUDl5bGdiRFcwZVdrRTJGU2dxYjJWdVlKVlRPbmdFU0N3?=
 =?utf-8?B?bE04UjUwdFpocHNUVlYxblUxYTFlR1V4Q01HTndZZTNkSjVBSnNxT2VHR0tP?=
 =?utf-8?B?Z3BzNUpKNElCV3VXY3Z3VFlieUxqSytDT0hmL1grSnRjcTlwZHVlaHd3dEQ2?=
 =?utf-8?B?UWtJNWNFdTdyS1Z2bWZIQUdhaVBnZjBRNHlzLzJLZjBLZXhnNUs0MXZjNG11?=
 =?utf-8?B?MkJ6V3dxNXFrc0RiMnZBUEVkL0tDanNCVlZXajh6S0tnZzVtaGxqeFZRMzJD?=
 =?utf-8?B?SjFvSmFtK2xhRmZBV01aQWVRZlZBVWE1bEFKY09UUDFVZmQ2RkNFMXlKUmdp?=
 =?utf-8?B?QkhyOWozQTloakFHSU44QU5DTUlyaW9pUWQ2RjdoUHZLejNvbFV2REFIOWtR?=
 =?utf-8?B?UVhHUUlueTdQOUhvNnlzQ05jM25iczNMcVk1MzhFek1uN0I2NGpYK2tXYUt6?=
 =?utf-8?B?TlNJRnoraERIckxCYWRzQWdsRHlFaXBnd2FBZzFORHBjSU85aWIyUDJ3SFpN?=
 =?utf-8?B?R2I4dUF1eHdSVTE5cVJUYi9nMnFrcm9Fa0tDVWQ4T24wNUhNQ2JZa051MTRx?=
 =?utf-8?B?UnBpVklpaG5XYTZoT1NTZ2d3c3BFWit5OXhvelRpTWNiT21lOHY2K1dwSXRI?=
 =?utf-8?B?VHNPQzk1Z2ZtN3IrVDFROUNGMzdncWR1MGVKMlVvclNRRnRqUEc4YWtlY3VY?=
 =?utf-8?B?Wm9WdCtmb0hYWlpaRHVkYTFPeDAwWHA0YVN1VldSTkF4UlpDMDFycnh0eXNM?=
 =?utf-8?B?cjYzbkMrV0lreCtvWU4rV2VwU0VkQWtvZzJUUzNHYnJra0hEaHZIN3JXL1ln?=
 =?utf-8?B?akNaZUVhUU9KeHRpVmNwRHk1VWJwUzFyaVhqOG9zUVNPQ2ljUE80MUR2WDBo?=
 =?utf-8?B?OFdzM1dkWnQrOHZYTElyc3IyaStSSnM5WHlEV3ZKTW5zeG1qcHhPcDBwekZk?=
 =?utf-8?B?ZE5ycGVrcXBNdUkxbTFaV1lUcWdpa0JZdE03dHhyWmY1OFo2bUlYZGRGSkNW?=
 =?utf-8?B?SlFObmZ1SWZNSGVjWXFqeERmNTk0MFZWWkppSUpmVTBhck5tRzZQZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f2813c79-a303-43a7-0de5-08de8a85267f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:42:41.5034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhJzkfQ7ZsfiA2sp4hyuy1ju81Xy2ioPPJBOH4HKb4bO0yC2TlBQWi8VGmvB26m6WzhHWNPwgknyhMufzSwXsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5377

On Wed Mar 25, 2026 at 3:52 AM GMT, John Hubbard wrote:
> Derive Clone and Copy for Revision and Spec. Both are small
> value types (4 bytes total) and Copy makes them easier to use
> in later patches that pass them across function boundaries.
>
> Add a Spec::chipset() accessor for use by later patches that
> need the chipset outside of gpu.rs.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 3b4ccc3d18b9..3cd7709883be 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -184,6 +184,7 @@ fn from(value: Architecture) -> Self {
>      }
>  }
> =20
> +#[derive(Clone, Copy)]
>  pub(crate) struct Revision {
>      major: u8,
>      minor: u8,
> @@ -205,6 +206,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Res=
ult {
>  }
> =20
>  /// Structure holding a basic description of the GPU: `Chipset` and `Rev=
ision`.
> +#[derive(Clone, Copy)]
>  pub(crate) struct Spec {
>      chipset: Chipset,
>      revision: Revision,
> @@ -241,6 +243,11 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<S=
pec> {
>              dev_err!(dev, "Unsupported chipset: {}\n", boot42);
>          })
>      }
> +
> +    /// Returns this GPU's chipset.
> +    pub(crate) fn chipset(&self) -> Chipset {

Given that you mark the type as `Copy`, this could be `self`.

Best,
Gary

> +        self.chipset
> +    }
>  }
> =20
>  impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
> @@ -291,10 +298,9 @@ pub(crate) fn new<'a>(
>      ) -> impl PinInit<Self, Error> + 'a {
>          try_pin_init!(Self {
>              spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
> -                dev_info!(pdev,"NVIDIA ({})\n", spec);
> +                dev_info!(pdev, "NVIDIA ({})\n", spec);
>              })?,
> =20
> -            // We must wait for GFW_BOOT completion before doing any sig=
nificant setup on the GPU.
>              _: {
>                  gfw::wait_gfw_boot_completion(bar)
>                      .inspect_err(|_| dev_err!(pdev, "GFW boot did not co=
mplete\n"))?;

