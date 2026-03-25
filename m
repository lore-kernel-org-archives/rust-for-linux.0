Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020106.outbound.protection.outlook.com [52.101.196.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55D30E85B;
	Wed, 25 Mar 2026 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453944; cv=fail; b=bBNYz9A6H43Kruiuyq7V4F30SqFQGm1kIQHDl+kgwKPOZ+sq+z6CI4njy1aoix0Lu/AnTGWJDF53iGFM9qOaFU/MTgnFXNt1rTHT3BgDNsss6q1gA74N9jrTTZa7hgMZxjYw0KAazgJEvUjFdWBZ5FjgCAAdU5tD+dms/oTEmK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453944; c=relaxed/simple;
	bh=bqV79BykLcRZymqUWF+yS6NlCCJRbjDdVcZP53Kpyx8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=tboZonwTR/wjfpelG8kTJ4XhcPA1nQq1tZvIAN22f716Kav5OgLNwQTFRLfuS+JKBuaFdUisBJVJSkaCUbfTsUARrgAoIEN9bkBRhEChlKZq172Rl4Glg2mQvtAOKHuwPxUQ8/7LMesgD+KfK8YZ8pb7y5QfcZEtNHiP1Yg75GM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dT0WAfPZ; arc=fail smtp.client-ip=52.101.196.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dT0WAfPZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdRgIHdPfEgHOmsf2f/tzQzP+61h/ROXcG/E4zovfiri4GXJDs4+joUepXCiw3kn7mNv7wTYjhdb3nYCdibTSgYCPwSMdEBT/ngH83Ib5fEiHX8LBf38xSvsBNmPRQ9jmZGKtSDxcpukxth8l3mbG1hKiWKOQqJ92oNs16Sm9t58fQMR2VvOWxAueKPRQD6ldSN4mTAMYpsKEmfESgsRFHeZPVPzwN/43WBqvyvB8fLO6yDtzpST8Ge7TNyvQOmYyiMr7GeBUplD3vZnt9M1gjCpYyjIqgEkGG+TYOmRkBx80KQRZjjoib2nISPU0Hs8e0CWcwRE0RM7fQfLrXCn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9aGpLK+k9kFlJetFrvELyL0fRLg6INLhVdVXqYY5Eg=;
 b=fLPLd+Tnrzy0fofcM3lYHRgfMztWbzRRT233Manp8vEnziUpOlTRjwpi2+kAdk/57qqBZqtOl6uPN2q9v4zv7nBfVE+ljDx7lkqa1OTYHUJ6AKZCKve8Gy/9+8CqDGYltE8v24FwJ8EC7z4ViJ0IAmKLVUe0wtWSybkF9QRyZMQ6iYhd26JWXWLmse2QPfz7x3heKatXsKJ8s6/4TiamSW7P1rYV4CeZzuDlpIh9KxvZURJTFJRA15XizNHJxWUPdmaye/8kBymSPDIgLtqanNtHSk+YI/fP82ebJkqNaeON7YEEzZMU2vwUEUQZ96MfghDfOhxz3HvDDC7i9vTSiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9aGpLK+k9kFlJetFrvELyL0fRLg6INLhVdVXqYY5Eg=;
 b=dT0WAfPZpfRl7BphucS0RbO7d65NHp7ukHLHO9UvmotagOdxsePBgGq0MdssU2pCPHdaIm1zGXVI/I8HNvo0wmCvqSMQNNPSw8rj+A6XWjUTYzS3J7hqq+D9ynGWh7OuD4ok83FM/I1RKi9UjeG1TjYeAGx+xJSK+Lcw4UVQhHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6247.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:181::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:52:16 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 15:52:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 15:52:16 +0000
Message-Id: <DHBZF8OMKTXR.3SU4C77OS4WR@garyguo.net>
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
Subject: Re: [PATCH v8 12/31] gpu: nova-core: Hopper/Blackwell: add FMC
 firmware image, in support of FSP
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-13-jhubbard@nvidia.com>
In-Reply-To: <20260325035242.368661-13-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P265CA0250.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a219121-56fa-4af7-8ac9-08de8a867d63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Qf8u/ahem4tvxLrxLOXe2bBfPUECCmHuicTtHAkv7yRQYfU8kqZh/AMpvftXtf1zaq4zvSBI0JrVNQMNc/3VwzG5tsWdrWxz8cyXn4t6cDG0AUVEE+uYAnvoPigWohMvB25gSQnJMnSEYTNXSU3bqOpjQOWFvZdGiprApuZv/SExhCHbkRCSnOj+cVrZPKBFfBgR/puTKyw1nIGO1LIX+p4FN6BlnhJxsKDOXkT6EGwdqnybsaNzC6U+Tww25QYit/ebJtxn10R+EccA6xGifT1lu9T1rbXG+2F63UwybTi6dZWi0Wei9s8l7K2BdrPMQsxc1Fegy8b/X9/PZTEc/nyulnk1lzpoKfY8OYWT0Ak0XlEZCkRFiqeQ+IG2/YRXWO9Gt52/e7zT0IYWp5UheDip4V35Q0qhsgnRa3LNJQaVwBDF3LlHsi5JJHR2+84JzSnHOf4cJ3YfDwoMRNZIfwJSr5eLdVVvsRO83+YjQj3sPdRnKP8doDnTYMHaeSRao1zLud1DekkSifj+HTX8Hh7NHyDb39Q9Ev1u+90FwISw5oe/d49zwGE+hMtxckV6oPe8CkUExN2OPJpBOG1StXanK5NXw6nCHgaUXv0i6c2rwUJnRY34GSf6jp60PpB8t4SSE35rrkBu3QWysSJ/iRtw3pWszd5qHsvrjBB1YV/F18r4DH3h28UV07B4aLyjj9vD4SIMWQnRSLq6k23wdKg8rIVKbXgpuWrtlIWBwpU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzFaWVIvc0ZRVnJkWk82RVFwOVNaaExFVDZDQjUrclN2eHIyRTlEOXpHd3l3?=
 =?utf-8?B?Ti9vdEx6RTJnNFVJK0lvaTlJeCs5U3dkOWN5WXNiZFI5ZUhLL1FLU1I2Wm1I?=
 =?utf-8?B?ajdmVmljWThzekFOeVBjbGg2NEI1ZXVkVEVpVFRwRUxqV3VpeS82a0Q3OHRU?=
 =?utf-8?B?Qm9HcytlWk1XaDJ4Y2tHbzVsRkpWMCsxVGYrSUo3T0M3M2RzSnpyUXJmZXhK?=
 =?utf-8?B?N2NrQ042UFNRZkVDczIzZ1BwaVRsWFdpa0FDZGxjVkFjK01ZRTdaZkFreDBK?=
 =?utf-8?B?cnluMjBnVU9waHdlcUh0Z1FYcVZSSmVUNzBndlFFaHB5QklqeFRBNHBmSk9u?=
 =?utf-8?B?WXdYd3c4bFRMbHArK0xuSlMzT0xhSXZ2K2h6RGJzdmprUnhNMUhtdnNpbFhD?=
 =?utf-8?B?dE80LzVVRU9waUwxdjJtdjhTM1NESXI3a01YU2traXpBUjN5cWpMNk5UNDVW?=
 =?utf-8?B?WjlHc0pZRHdITk9DNWRuT2lhdGdwL1ZjZHVjNDBRM1ZyaTBlS0lNRUF5MURB?=
 =?utf-8?B?YUp5N3c0UWhReFRpQjEraWVMa3ZBcTh4aXROZmZFWWtDVWhCNXhkeDM5ZjFF?=
 =?utf-8?B?dEdRQ2NudnY4UitEWUJxMzhqTmdEcGdFdDNPMllFVitlVnRjZlBhaGZ0Sys1?=
 =?utf-8?B?eTdsQ0hVNlNtd1Bhd3podU5ZZ0d5Z1lQbm5xWHhSNm1pdnZydkdtc3NaMTcz?=
 =?utf-8?B?V29FU0Fnck9Dd3U3UUFzSVMrRDRLUHNqSm1LQkhCdDIxZmg3YlZCUU5scksy?=
 =?utf-8?B?bXhyL2w5WVpjVmVIcDM0cUQxTG9XYS9jZWV3QUQvRXU4R281RkwrRXJReS8v?=
 =?utf-8?B?VjlMTitGOFJGY1gweVBxSUpCZzBueHE1YXVRZHE3d1BxQnRNSC9TMThKUFdh?=
 =?utf-8?B?MXRudm5SbisyN2RONXpJVURGaUZhZjl0VlVVUWkzZjd2RkE4S3NXc1NxMXR6?=
 =?utf-8?B?Y2o4Qzd3V0ZRdnJ0WEd2Mmt0RlZsUU12Wmo5UmR3RFBQV2QrdXhmTnUxKzlY?=
 =?utf-8?B?YUhERjdkUXJxTm9Sb2ppOFZhVGtWRHVoL2cvaUtneUtzNURZejFjOWVBSGx0?=
 =?utf-8?B?N2lwaUJsektWaVlQQ0thOURXaFl1WDdKeEVtblBGUjl0S2pwZzlpSW82cFZE?=
 =?utf-8?B?S1NWZEZLb1gyaHdQZnRwN0padVoyQU9SUmRVano5ck8zOXg5N0NtWDcyVTU0?=
 =?utf-8?B?SGRRK2dIN2JGeU0yTVExVEsyUElha3dhRUdheGM0VzRFc3Z4TDVpVDNzOC9Q?=
 =?utf-8?B?RzhqU0JpeDJHZ2dMS09jQWlHQ1Jha0VNQ3RzcWdVaFNFdjQ3Ky9ZVVNXMU1q?=
 =?utf-8?B?K3dqUFVHK2FkZDVHTlp4MCtjS1NxUk1tS0VSQmIvRDM0Z2g5QXlFaXAwVUFQ?=
 =?utf-8?B?U0ZwaXJWSUd6dzEzTEZ2bnY4QXBwQWl2UENGVVJQVEhKVTEzTWViTWQzKzlZ?=
 =?utf-8?B?WmxEK210dXlGMnk5TkxNVWYzZmhOL2RiSmxvT0hJN05uaXFWNnRVZGVPd1c5?=
 =?utf-8?B?OWlINVRLYUlWUFA4R1hucW1iWnZ2bitNaHA2RmoyTFhMSU44ODZDT2tKaVdQ?=
 =?utf-8?B?UkdubGU5M3krZndTV0pYTlpiQ0xFUHlCNDJBU2I0UHUrZEQ2ZCsvdkpXdVRy?=
 =?utf-8?B?RHVqSXM0RVFaWUdCUitiMExWbndhdU5YNCtYNFJPWDJSZUxvZ2lYS1NKT0Mz?=
 =?utf-8?B?a1V4bnhXaHZ4OFNnUytwek9rMlA2ODBVbjZVK0w0cU5lcFNFL3h2VE5XS1Mv?=
 =?utf-8?B?dnR2ZGlWdm02QUhXdXducS9zaEVRR2t6NlNNNkNZSmg2eGRqdTFnVWRtM2la?=
 =?utf-8?B?NEd4MnJHYjVYTjAyYXFtQ3M3TitOM3UzRnphWEIyNXVxcjZQaTZ1d1k3S1By?=
 =?utf-8?B?K2hVa2FQbFBUZFZiT0I5QlR6S2lqemMxdjFMalFjY2ljb2M4UWpkMW1UTUt0?=
 =?utf-8?B?d3hwclhLcVhGY1FPRmhxOElmUVJKSnprTEZWMXVZMU5qem03TGdLcWNFVzN2?=
 =?utf-8?B?TW85V0l0UnhCTmFtUFZ5NUtTWHYvL0FqLzFIeDFQcENKV21wcEwyOUN0WXgw?=
 =?utf-8?B?cG93YXVDU3hwTjNMdlVLSmIvN1hNZHQwUkp0ZXN2L20vd2owOHdhL3ZQT28x?=
 =?utf-8?B?WWE3M3VKOVVXYmQ1Z2FUTlZwVE92U2J4NUlCSG91a045bHRLNDc3SnBqRmE2?=
 =?utf-8?B?ckppYlNiblgrenpSVXlZeCsxRVdSQ25lWkJpbTFsWjlyanRYcE5pSTRka1Fp?=
 =?utf-8?B?N1Q2Q2RjRTZiSEx6a0FFeUQxUjZEcHFoZ3BLd3pENzZqY1p3c3hmd2p0UGxs?=
 =?utf-8?B?ekovVFVaNUptU3FWakYxYXFuNU93M2JpNnUwSTB0VWc1cFY4T1JGdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a219121-56fa-4af7-8ac9-08de8a867d63
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:52:16.8118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjUzJRNE9SgPvkJAZFo9wHfTYOpZWgCRmSZvgZtlrrMsLhIi/KcIaBts9QYHAFvj9GUE/aJeXLI2G7ivvcXG7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6247

On Wed Mar 25, 2026 at 3:52 AM GMT, John Hubbard wrote:
> FSP is the Falcon that runs FMC firmware on Hopper and Blackwell.
> Load the FMC ELF in two forms: the image section that FSP boots from,
> and a CPU-side copy of the full ELF for later signature extraction
> during Chain of Trust verification.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs     |  1 +
>  drivers/gpu/nova-core/firmware/fsp.rs | 47 +++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index bc217bfc225f..bc26807116e4 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -27,6 +27,7 @@
>  };
> =20
>  pub(crate) mod booter;
> +pub(crate) mod fsp;
>  pub(crate) mod fwsec;
>  pub(crate) mod gsp;
>  pub(crate) mod riscv;
> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-cor=
e/firmware/fsp.rs
> new file mode 100644
> index 000000000000..5aedee8e6d41
> --- /dev/null
> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! FSP is a hardware unit that runs FMC firmware.
> +
> +use kernel::{
> +    alloc::KVec,
> +    device,
> +    prelude::*, //
> +};
> +
> +use crate::{
> +    dma::DmaObject,
> +    firmware::elf,
> +    gpu::Chipset, //
> +};
> +
> +#[expect(unused)]
> +pub(crate) struct FspFirmware {
> +    /// FMC firmware image data (only the "image" ELF section).
> +    fmc_image: DmaObject,
> +    /// Full FMC ELF data (for signature extraction).
> +    pub(crate) fmc_full: KVec<u8>,
> +}
> +
> +impl FspFirmware {
> +    #[expect(unused)]
> +    pub(crate) fn new(
> +        dev: &device::Device<device::Bound>,
> +        chipset: Chipset,
> +        ver: &str,
> +    ) -> Result<Self> {
> +        let fw =3D super::request_firmware(dev, chipset, "fmc", ver)?;
> +        let mut fmc_full =3D KVec::with_capacity(fw.data().len(), GFP_KE=
RNEL)?;
> +        fmc_full.extend_from_slice(fw.data(), GFP_KERNEL)?;

What's this copy for? It looks like you never need to modify it, so keeping=
 hold
on `Firmware` should be fine?

Best,
Gary

> +
> +        // FSP expects only the "image" section, not the entire ELF file=
.
> +        let fmc_image_data =3D elf::elf_section(fw.data(), "image").ok_o=
r_else(|| {
> +            dev_err!(dev, "FMC ELF file missing 'image' section\n");
> +            EINVAL
> +        })?;
> +
> +        Ok(Self {
> +            fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
> +            fmc_full,
> +        })
> +    }
> +}

