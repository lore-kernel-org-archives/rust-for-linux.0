Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012005.outbound.protection.outlook.com [40.93.195.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1AB2343BE;
	Mon, 26 Jan 2026 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769414945; cv=fail; b=roZKnp/+otMNDpVexnQVx4kZloVmum/voix6vv/yG15f+gXzqDx+kh64K/U50RA5lx22G3sPzxIHD3aH8cRVLsEi+idVjWQOUAznPhpGLZeYG+PCefmHIYx6ZuOcJrsHonXV2pVAKs4nBI3t60Ydf8hXrLxWn5J9avqYRDVp3iA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769414945; c=relaxed/simple;
	bh=16wmsqQbn+HeABoEXAZ+QRNswfOuuNxscht10gjYDtY=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qn2tieRXFV73KjSQNYP2pO5y2fnVwzrqHGiRtybJTnTLuLhKoObYxtNmC4wGMkRBRQywnGNsuVbbAjV6EoICYoCSOZYnkQBHxYPCBvB1JANCvKi5NOUaXOI5ZtiaG5ZvT1MGV0fsFR1rRfDbvYPHKu7n2Hi3QINJwBRbVTuJ8FQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MBd9rViY; arc=fail smtp.client-ip=40.93.195.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MBd9rViY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYQ8dmb0eo3WhMRHZW5Nok8GZ/TlSQps4pHi3gQjLXaM0voSfm9OhX8MGK4qhLIwvFcmGicvxEe9hpnJIxrlQDK9VnpmiIidUISZIG9ZbnfcRCehVOQsempvhBeYUMxh4sUe2TPRQxCmiNfBClUQvOrj4sV+mUamLxv1eLQ2i7Jj2r79zK3wteEUMMf1XURmZhw5Qxa3i+wX8RKxLHm2yIuBvdJWocomjzIKoitKzieKko7nK9Ml8822eIqO2OpLizUAldn++jsyzyH0puyOPZ8HBJNO5Sb85muDsyR5XdokWG1gxGGvDJcGkVFahI8YlW8JWYOh/26m9HfKz24bQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh4/MyU3zGsVeUAmfGzJr19Tarl5+pAQyqXrIegE1IU=;
 b=DqFMyI55+AHl+ASq/G+y7IsvypUz/fInQagy7bn2sIfAe7DkLcVuBagtHmeDePvZDjINLFMnfM6F7HqPQnbX5wd/YexWRHJP0TCWgks6eQKTIi04epJ3Dy3Vynx8zw3QQb0nkS30rDxSWFELW+NTc9+jfYYqc1Uw6rzyE9rUhrRQC7/IjqPza1pqdQR9sOMPE1AdchaNkAiJ7j6YkKr1BbvdmO0GF9B0U39TO4/tAVNeCk21dmlCrv9X3uTwf61v25BM3Ut5BT2scW1Pe5mG66osufhOHU833GdGumKR7XfcTUxS96jITLoTKnvzeDZsGsUYj6L5bDl2rf06G2R7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh4/MyU3zGsVeUAmfGzJr19Tarl5+pAQyqXrIegE1IU=;
 b=MBd9rViYKtWCoH7+LO4Kaq5moH01xFMLEEajV/Pd3BQ5Xk6HrzDzESIQICx8S45Z/M6ekV55r6h+jJHTGtnASygS9xN8UHC7C6J0oxPVSCnQcGrJERHYtEz4RfBpRQDo7ejIGx1AIj6Rn8BKwmn8XF79yWnQm9VVyxUJk9U0LIpYUeH+R8PF7YslmZH/J+0LihFNeEBdngKYDt/alRCNLOkgYiPuvSb/OmicQx/IKMp/y9XR/GnJbt6cIZ1UCV8iHFh5srchNK+mbdF39OvEi3zwuVBGgKU4MeXw2h3GTqtjoDipMXNicb9JjpK76FoXfrSSzBWcE/C99Bgu8uKJ4w==
Received: from BL0PR02CA0075.namprd02.prod.outlook.com (2603:10b6:208:51::16)
 by BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Mon, 26 Jan
 2026 08:09:00 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:51:cafe::50) by BL0PR02CA0075.outlook.office365.com
 (2603:10b6:208:51::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 08:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 08:09:00 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 00:08:45 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 00:08:44 -0800
Received: from inno-thin-client (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 26 Jan 2026 00:08:38 -0800
Date: Mon, 26 Jan 2026 10:08:37 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "John
 Hubbard" <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	<alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	<nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v1 2/5] gpu: nova-core: use checked arithmetic in Booter
 signature parsing
Message-ID: <20260126100837.74c8597d.zhiw@nvidia.com>
In-Reply-To: <20260124231830.3088323-3-joelagnelf@nvidia.com>
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
	<20260124231830.3088323-3-joelagnelf@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|BL3PR12MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b2784a-a798-4667-40e2-08de5cb2297f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QnnDC6OPrxhj+Ax4NzYYk1uznSPrmJKvLtQmv/l8mB8se0hQ+mGSZMyz8HcZ?=
 =?us-ascii?Q?WKRv5jguheYUaAdWXcKqajEtCP9YmPFUOtPs/cP2UUEFOy+roSJ0Vp/B1TSk?=
 =?us-ascii?Q?xXL3ysqq/zYhOApKFHsSGn5wIT99NTFw5iFnvrkmJoVlDUilNLOyIiqG202y?=
 =?us-ascii?Q?P8xm/4Npylom6dunO7PmcJ8/I6sqj6Kiwb668keBdDmECDfz+//yV+a7Yr3L?=
 =?us-ascii?Q?NF5dXZValwoGRAObL7ON42SPWxTgrcOha1D1G0BPrOckkctFwVHFk+nlssWv?=
 =?us-ascii?Q?6GzSNSXskFdyNeLYTbv+NLBAVLUldxBVNfaKqhbOUbC3UvxxT4s1hPWEvHjF?=
 =?us-ascii?Q?uZtWcQ7BimijOhkH6+eHfZ7HfLNQzwUYWNWm1bnFIpoyAY98EDGezdJM9hoW?=
 =?us-ascii?Q?18gSz02Ycs3aRAPi+p8INW9CbjnIX5hXL9k7QoqGNFQMNdSaMJ/ov9KVTjq3?=
 =?us-ascii?Q?ZWUDLBZO+JxYfYFtJAhMdk8ayExdWbm0SE7WAkF1iZrk40N2VKo+b7mw3vC/?=
 =?us-ascii?Q?JeBevBTkOg8jXA3HJus5tvqIPCNlTmJs6sm6pxvQnHAgJ+Nq9wcTcxnwDMlv?=
 =?us-ascii?Q?lQbFpZ4VywERlZfYaGMEGNgkfHItJ2VU/i8ut4HKzk41MaCsemCQ/5vFEOgE?=
 =?us-ascii?Q?k9tFhbyc5iLa7ZzLnGmsGaFuO7ExeB8K5elP2f4LKz9gCQDspzSSkbAOBvFw?=
 =?us-ascii?Q?nkg+uI8bBolEsocTSMMxYjnNF8CKd35JWSvDTHHE31Eb0aGE9AZTDwgPNGMs?=
 =?us-ascii?Q?kjgpK/GuVXQ76B9LdmO+jGV7NcDcQnngd5hVU2HsGjaAqO7hGLQ5LBkx0xqJ?=
 =?us-ascii?Q?OwZ5Gs//ZoQCxTir8EDBOXZ0SDXiSmdhqUvzxHPvkisYZMdISJiE9gWbskQF?=
 =?us-ascii?Q?LV+q1TC4nScVvLC1GgaLiw8Q1t3aMrUZIcS8Q/6aacc2Ix8XAe4DlPmy4skm?=
 =?us-ascii?Q?5V2IIa4VzPmiFzsMn7ySQaNIifjZF4JKlUvsTBggy9axIhNEdP8Agn671a5+?=
 =?us-ascii?Q?RQVpp9gT8mMPIvbK/BjSBgbQ7NEvhYPnzERWRVKjBPWzm5NYFVQmP11ds0UF?=
 =?us-ascii?Q?t2+rZQOUpIKLyBRiMH4TesiZ/N5/wbWrxE1aUV1EklLMwT4QuPqLWSH+OPjI?=
 =?us-ascii?Q?h3oAdWEx1V6quWAHEowkB4GQDFbnTYKN6PXbCtY85X/FJAe7SXrQipTTQLDn?=
 =?us-ascii?Q?oLH42V2uZHEf1waSRvkespN8pIwv7PjANTMzEHuXucW8gUrmvuQQSLO2Eqye?=
 =?us-ascii?Q?DUv+8ZAjOCX0XUDnW/eMMCsCYCKBWACPeRjaTUCMAeo1tre2EtT6E5ssAMbI?=
 =?us-ascii?Q?Ty3UvSCBhGH6Oi6E4mooCuYhkbgeUmvpr/3lsv0gRCkhbqCa8xFqKsnZoCrp?=
 =?us-ascii?Q?uhP8pXPseuhS46afj1fc39ZJvDMmFJcDq9QPYoJLJh+GeUQML+5iVlbsTZj3?=
 =?us-ascii?Q?Cj3xvZrgmUQdIpS/Q/BMqeGkvwK7y+0L7NAeTVe8BMi21wKYQboQ98c1wq2/?=
 =?us-ascii?Q?Zuw8ECW4oqcIq3ym2H7d1ARx/rr8rw2XKVjS/lyMc4Bh6IhKwDwo4nqll7Ra?=
 =?us-ascii?Q?9Fo77pSYGmV610DTnF39fWvub9GvRSKYfdLBQ4nqAux9nVXtn6XpEq96rWBY?=
 =?us-ascii?Q?lF3R7lJyL36wQYuLbA4nVtCginJJkofltPlfmDcyDFjxfY9WJEwFFwSecHm3?=
 =?us-ascii?Q?k09qIw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:09:00.1561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b2784a-a798-4667-40e2-08de5cb2297f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547

On Sat, 24 Jan 2026 18:18:27 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> Use checked_add() when computing signature offsets from firmware-
> provided values in signatures_iter().
> 
> Without checked arithmetic, overflow could wrap to a small plausible
> offset that points to entirely wrong data.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/booter.rs | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs
> b/drivers/gpu/nova-core/firmware/booter.rs index
> 86556cee8e67..f5ad619dc055 100644 ---
> a/drivers/gpu/nova-core/firmware/booter.rs +++
> b/drivers/gpu/nova-core/firmware/booter.rs @@ -119,14 +119,23 @@ fn
> signatures_iter(&'a self) -> Result<impl Iterator<Item =
> BooterSignature<'a>> Some(sig_size) => { let patch_sig =
>                      frombytes_at::<u32>(self.fw,
> self.hdr.patch_sig_offset.into_safe_cast())?;
> -                let signatures_start =
> usize::from_safe_cast(self.hdr.sig_prod_offset + patch_sig); +
> +                // Compute signatures_start = hdr.sig_prod_offset +
> patch_sig.
> +                let signatures_start = self
> +                    .hdr
> +                    .sig_prod_offset
> +                    .checked_add(patch_sig)
> +                    .map(usize::from_safe_cast)
> +                    .ok_or(EINVAL)?;
> +
> +                // Compute signatures_end = signatures_start +
> hdr.sig_prod_size.
> +                let signatures_end = signatures_start
> +
> .checked_add(usize::from_safe_cast(self.hdr.sig_prod_size))
> +                    .ok_or(EINVAL)?;
>  

The same concern of comment format in PATCH 1 raised by Dirk, With that
addressed,

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

>                  self.fw
>                      // Get signatures range.
> -                    .get(
> -                        signatures_start
> -                            ..signatures_start +
> usize::from_safe_cast(self.hdr.sig_prod_size),
> -                    )
> +                    .get(signatures_start..signatures_end)
>                      .ok_or(EINVAL)?
>                      .chunks_exact(sig_size.into_safe_cast())
>              }

