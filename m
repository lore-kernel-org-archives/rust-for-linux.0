Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022100.outbound.protection.outlook.com [52.101.96.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC71A2DEA64
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261005; cv=fail; b=lXBV/2lTmTg6xL8cGf5Aa4yNkkqM1UXAeFrkLH9fc/0xoY81O6Y1BxyQ0fVCXagKt9VkResUoonIr3Wti/eG7GRF8cAVZun6EodNZd/ApP2/3rSGugsXIRVuDCacc4P62JN4ZJvBZtMXa6cl5v3OaWvAuz9Vf73IVBTy5+eqU48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261005; c=relaxed/simple;
	bh=lKJSiT3J6uvWQTYPkhKQhSPNaGuE0x4PYhh1h4+L5z8=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ZlwkJu/lwDXnpA9lluuqrnyNdBHxkebs7hL+8N/ccTifEr+WMtYbJP+yvP4tAaR9CXMCx2ns4f3c7dYDK375QxMBSfAzgWRKBPgHMFycmAHvwyFxzywszxer4QXutQJf1YRHywqJO9HdAca+Qj8pnjUlPKX6c50hH5JupkiBWZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CG2obA43; arc=fail smtp.client-ip=52.101.96.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CG2obA43"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTzIPQpxJ5zTRsrseixF41smM+dH5PZ7avXINjIRokD0+4EHbHJRrGAX5BIXiMUl7m1CXSFsBja8z5pW74JsGjRGNnoReLFOCO+fLe6c+a/fBjpCYYruWAcQH6XKz+qYX+vQ/kTdDc1fHM27amwQm7gnmBPrNu6HJnj6qd2e0AmkEiR8CFOkK6CyoNoR6YZSKEAdTbb+Yo9yxYNPWxyzONryZpD5gr6DrD2pw+4B08vD4wgwE1d2O/PRq6AkmtGfSd4qZIxQRl2pTnoKHxZibGq2+1iIK2CDBRdkJw37JL7V7EXhW//gRco8Ym3hz6BcxkYFDWOZCp/QkvfBSs2UdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7V+ym7SUhe74IN+n/h27c0v5x7kC6Js/pzNAGGZ+vTs=;
 b=e1U0sd4CKgqo/nCSELLzaUWnnsiaP07n1Epdjk8/nNtyC0Oo2n+5cK6mkEjO3WAo85r/cRgiBDcOTjA72M0V1PInVtz5h7dxCJIB59uUYm+2hhtbp1HGKo5axd6Jc/XtVmFynRNFt9BAgSXciuMAD1PiPTW4bhjECsrd7vFaS7bmUsDDoBsMFi+xiAkrB5MCL76EaVBCrVRbFSX94n7AdUiB+34U0f60Ty24YPAUebHYdgGy4jQZJ51LFryOQgMB3X9Kh2iG+ZHyIuUDoNSHAcUqbjwBKtmi5AOVZw5HEz7CXu0E9YHPwRAoI/bjpL2HavQVT0FDZtzhvSg+Y0cFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7V+ym7SUhe74IN+n/h27c0v5x7kC6Js/pzNAGGZ+vTs=;
 b=CG2obA43Gs1zit9Q4f/Ovyg4bK7azEHlpI139ZhV3zffPkrF/q/5yj4xIfQKuJbGmqxSKASTrWvxnEjjG6CJ48g3/Ew/XITfaCZUCDmlMn0ICCrkIbbWg61dloZ8EoGYV14X6KHVFEVhhefaGQqouqbS8XujBDQl6icysQmCgA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3671.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 13:50:00 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 13:50:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 14:49:59 +0100
Message-Id: <DHTRZ25VIPY2.2U103EYI05YHH@garyguo.net>
Subject: Re: [PATCH v2 5/6] gpu: nova-core: skip the IFR header if present
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-6-ttabi@nvidia.com>
In-Reply-To: <20260414235047.439322-6-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3671:EE_
X-MS-Office365-Filtering-Correlation-Id: c21f40da-30b9-4ad3-63cd-08de9af5e30f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	dbLiuYdIByguGyCGXpg0zqYvo9nlesaXthq0ih3zRsXovd46/ieBY8JJoh2gruxaBm4BM2fU3j1caR9tQ28fU3egG+tdkL1xcRnwbM3LHmxxxPnAEH3V/+WGN/LG4rTwfxiSuwRaTxYxsdoQBDFW2M8MS1BtYd4wdy5rx18f8u5Cz7u+v46eRxfjLV8bxOaxkiG/eXEz/i/e4KyVklOP6+RxmADIP6n0o1R5ovHphl/j4E2WhAQzE9uPud3sEmilcvJFZnK+UAu5Do6Uam042pf5jICBj9l7N9LAJvHdfySq+xTt76xZYQA/Sj1foc0d7onFOVGgB0PFEFnhInbd5+RYZj0/pYVH6w2QHASlVpQ1TC117zcwJ8b2eQiHjMA0lojKckHy5rkX63VDpUnulAyIVwoW0Pggq+MH2V/XitJ4dF8BdA5YskgfB8eXV3upjExdWVLrn/b8eyXBnDrQBK7pZKUo8fkrRWd0j9j/QrF3WZCGBmB/RZq85i6J14UYYAr79tNEvN4vbwM+iNQCFItqMvfW2XHWuZ31ZDJgw5CjUWORklW0ZmyZA1e/4IPIzsqqhqsMYsSUJVNlfaEOxucVeazl9Z3DFEQevngW4nNiKC1YIVlYLvpOtIF/5jWweiXShh5+KaXZsTE6CDaSNYOrVeE4wkUlipRZkHjA7u8svBCG3+TQlY1yXsNg3v9kjpW0vgFmfylM05KAnmU1cYdhFOXKDZTHAYNlnJBGtrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2tHVHFFZHhVenhQV2xMeEo5bythdUNpN2NGWTdiUjB1bGtIejNjZnJscEZX?=
 =?utf-8?B?bGlQVXRpbk9Ibks3TEFLYUxaNGRySEY3QzRqeXdyZG9SQm5wRXAxSlZicVRr?=
 =?utf-8?B?cGloK0dFVXMyOG9uS3dmNHJnemRKQjlOWm53QmNPaWhWRnE1ODdMMDBhTlMy?=
 =?utf-8?B?R0V6TEZZeTlpY3ByUUVvamtQcVJwZFpiWTJNTGE4bDk1V2JOc3BNY05tVmFZ?=
 =?utf-8?B?RlNUc3FvTFpGc1o5MVRhTjEzZjNscWtGZ0wzL3NScjZDRzVCWXpwcE1QT3dR?=
 =?utf-8?B?UXhTNlpvVDJPZzllQTEySDFaN1VHUVlxYWtEdk16OUNQdXlIZUNaQnh1bDNi?=
 =?utf-8?B?S1pmSGV4cVVNK3luVUxDbWp0VXpmd0hkWE51bFp6bHNKby8zS2Q4UUsxTHJu?=
 =?utf-8?B?c2Z6NnhUZ2QzUkJLUnJkeUh4RWpFV21LM0grRVVDSDFJalZuMnVPTmRxUGp4?=
 =?utf-8?B?UWJzTDRVdnZjUDQ2Nmo2K0hldUdzR3Vqck1INWw0UHZRMHJpbitkSXBiUU5E?=
 =?utf-8?B?bFRrbVV6UEN1RFlNVkk4L0p2anJBQUdLaFhvUnNPaG03TUVjazIyK1p0MmRO?=
 =?utf-8?B?VThnTFZwNFljS1ZYNjB5eWNDNi9BNXdMRjN3c0lUMkdOQXVjSndPR0tSdlV1?=
 =?utf-8?B?SDFGdENrb01COXRVQ1ozUHNQdXhLU3V1bUExVXBsaGR1RWJxNjVtdkF3cXZF?=
 =?utf-8?B?aG9wOU1Ha3BBcHZuWFpOdzNZMGNPWGVqWXd5RVg3aERmRGs0NlU2WWMrSVVa?=
 =?utf-8?B?dGs0WmpFb0RTbTdOdnoxWUhURVVvZHFMNEZmcnJ2QmtsckYrMW1hK2pVeXQw?=
 =?utf-8?B?dDFLWlU3Y3RvN3JZSnEzdDVGbC9JOU5DbER2T2hBK1hHbEx2SHdlTitLeElh?=
 =?utf-8?B?UVlmaTVGT1BITTREaVFoeTZTT0grMzIzbFVabEJLNmw2Rno3eEhTNDRzSFo5?=
 =?utf-8?B?R1I1MXV1bFJuMUNmMi9GeEVGYStxK0ZsdENyR3lpTFphVEhUeXBhb0dGZCt5?=
 =?utf-8?B?US9ORytja3FSQW9YbzJyZHZIRExOVzhSRU85cXE3TDh4Vkp4MER6OEttY3V0?=
 =?utf-8?B?Y2NUNENybjZaWGJ0emxKZEdXQWRTYW5TOW1XM2pFRno3OWF2bnQ0amlVVWxm?=
 =?utf-8?B?M3BGS3ZpNW5xT2dacTJQOUdXZElzYmNGclY3dVdWLzVzSzVGUVViL01kZFdF?=
 =?utf-8?B?cytHcjAxWlB1ZUlucENCaUxJbHBvanRFUE9scFFORzNVQXhIRFUrbll0Wjlh?=
 =?utf-8?B?c3NreHgrbFlHN3JrT0FDOWdlU0h3QXpsczhXeUlRMDYzaWNvb2ZRK1RPTjRk?=
 =?utf-8?B?SW5nVi9VOGJrVGFobUM5V3d0ejJhbnJjT1d1ZjVWK2pEOXF6ckp1Ui9PR0F3?=
 =?utf-8?B?dlpCUTlSR05FMGJEQkFUMllNRG9ZL2xvcVQ4MjZkSTNocWpCc1pFem9YYVMy?=
 =?utf-8?B?aFhDSHVTdy9jTlBQN1lHTm1XdkduZWtnbmp2eEpNZ0NzcGxoQzJVSzFhczlP?=
 =?utf-8?B?bmNaQ2kxMzNIMlZsTTlhTit6bEFnaGpERjNHZUxOcjNWSmNGQlVIeWVqcDBs?=
 =?utf-8?B?Rzdja1ZjNmZhU3puSFNoTHFmSTdEbVFYTjJvWCt0OE9qcnAzblEzZklrK3RI?=
 =?utf-8?B?bHF2L0dOUnhDMW1YQlJOOTRtZ3NTN2FXL1pBTWxsUk4vdithelQxeDdYWDhR?=
 =?utf-8?B?VTg4SVRVUmFZeXpETFBOSjVKM0k5bHIzVUluODArZG1BcHVyUDN6dHNVQWlL?=
 =?utf-8?B?S01oVkxKdlpYZjdDVVZrSElPSFVNNWlubmRRS2NGb1F1d0tBUmpiZVdrYUph?=
 =?utf-8?B?Q0YyMy9odGhwb2ZmcStRSHN6NHYzTlVBdnNCR2hJdVVUUHpNRXIzZEZBeTR1?=
 =?utf-8?B?OU9WUXdWVXJvK1NhQ0czYkdjU21zN2dBMFZlTW9PZytpMG1jcnc4eXNpQlk5?=
 =?utf-8?B?aVpVbUlXWlNLeDR0SDlVRGZCZXVkV1M3ODRKYys1MnRLaEdxbDQxMzV6NnRl?=
 =?utf-8?B?aVNSWFYvUEI2cFVKell3Z29KeCtUanpHVFhza1Nmd09rbVl0SDhPMnF5ZHFF?=
 =?utf-8?B?dDlhTFNyQlVCUFFFeGhWVi9MamN3T0RaM3A5MzE1Zmt0akQwekRPZU9ieDZU?=
 =?utf-8?B?dTVaYzZrQmlzN0owT1JMb296MjE2U1lScW1CYkoyZHVnTkl3dVFNVmMzR0lF?=
 =?utf-8?B?QmhvVzNpak0vVjRuOEpBRENOams2cE5xdW9UbHM5YXdPS3RMRUtac2V6dDRQ?=
 =?utf-8?B?Yi9FaXdybWo2ckVCd2hCbUJUZ3lRVmdUZ09XQkhQRFhTRUJQbDRUb1NhRVRr?=
 =?utf-8?B?L01YQ0diNUR3a2N1VElndXlMUkdCMWI1d1ZhanRINDkrRTZoekpNdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c21f40da-30b9-4ad3-63cd-08de9af5e30f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 13:50:00.1129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZsku9n6WwvDDU/HjzVHqApnUcASONiI5yM8qr0HVu+LSn180E23FaaFtl+nAMZA5kZdolymFrqDac9U+qSaTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3671

On Wed Apr 15, 2026 at 12:50 AM BST, Timur Tabi wrote:
> The GPU's ROM may begin with an Init-from-ROM (IFR) header that precedes
> the PCI Expansion ROM images (VBIOS).  When present, the PROM shadow
> method must parse this header to determine the offset where the PCI ROM
> images actually begin, and adjust all subsequent reads accordingly.
>
> On most GPUs this is not needed because the IFR microcode has already
> applied the ROM offset so that PROM reads transparently skip the header.
> On GA100, for whatever reason, the IFR offset is not applied to PROM
> reads.  Therefore, the search for the PCI expansion must skip the IFR
> header, if found.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/vbios.rs | 67 +++++++++++++++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index e726594eb130..000e823b9e47 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -89,13 +89,78 @@ struct VbiosIterator<'a> {
>      last_found: bool,
>  }
> =20
> +/// Offset of FIXED0 field in IFR header
> +const NV_PBUS_IFR_FMT_FIXED0: usize =3D 0x00000000;
> +/// Offset of FIXED1 field in IFR header
> +const NV_PBUS_IFR_FMT_FIXED1: usize =3D 0x00000004;
> +/// Offset of FIXED2 field in IFR header
> +const NV_PBUS_IFR_FMT_FIXED2: usize =3D 0x00000008;
> +/// IFR signature: ASCII "NVGI" as a little-endian u32.
> +const NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE: u32 =3D 0x4947564E;
> +/// ROM directory signature: ASCII "RFRD" as a little-endian u32.
> +const NV_ROM_DIRECTORY_IDENTIFIER: u32 =3D 0x44524652;
> +/// Offset of the NV_PMGR_ROM_ADDR_OFFSET register in IFR Extended secti=
on
> +const IFR_SW_EXT_ROM_ADDR_OFFSET: usize =3D 4;
> +/// Size of Redundant Firmware Flash Status section
> +const RFW_FLASH_STATUS_SIZE: usize =3D 4096;
> +
> +bitfield! {
> +    struct IfrFixed1(u32) {
> +        15:8 version as u8;
> +        30:16 fixed_data_size as u16;
> +    }
> +}
> +
> +bitfield! {
> +    struct IfrFixed2(u32) {
> +        19:0 total_data_size as u32;
> +    }
> +}

Shouldn't this be using the `register!` macro instead?

Best,
Gary

> +
>  impl<'a> VbiosIterator<'a> {
>      fn new(dev: &'a device::Device, bar0: &'a Bar0) -> Result<Self> {
> +        let signature =3D bar0.try_read32(ROM_OFFSET + NV_PBUS_IFR_FMT_F=
IXED0)?;
> +
> +        // The ROM may start with an Init-from-ROM (IFR) header before t=
he PCI
> +        // Expansion ROM images. Most GPUs apply the IFR offset transpar=
ently, but
> +        // GA100 does not, so we must skip the header manually if presen=
t.
> +
> +        let current_offset =3D if signature =3D=3D NV_PBUS_IFR_FMT_FIXED=
0_SIGNATURE_VALUE {
> +            let fixed1 =3D IfrFixed1(bar0.try_read32(ROM_OFFSET + NV_PBU=
S_IFR_FMT_FIXED1)?);
> +
> +            match fixed1.version() {
> +                // Note: We do not actually expect to see v1 or v2 on th=
ese GPUs
> +                1 | 2 =3D> {
> +                    let fixed_data_size =3D fixed1.fixed_data_size() as =
usize;
> +                    let pmgr_rom_addr_offset =3D fixed_data_size + IFR_S=
W_EXT_ROM_ADDR_OFFSET;
> +                    bar0.try_read32(ROM_OFFSET + pmgr_rom_addr_offset)? =
as usize
> +                }
> +                3 =3D> {
> +                    let fixed2 =3D IfrFixed2(bar0.try_read32(ROM_OFFSET =
+ NV_PBUS_IFR_FMT_FIXED2)?);
> +                    let total_data_size =3D fixed2.total_data_size() as =
usize;
> +                    let dir_offset =3D bar0.try_read32(ROM_OFFSET + tota=
l_data_size)? as usize
> +                        + RFW_FLASH_STATUS_SIZE;
> +                    let dir_sig =3D bar0.try_read32(ROM_OFFSET + dir_off=
set)?;
> +                    if dir_sig !=3D NV_ROM_DIRECTORY_IDENTIFIER {
> +                        dev_err!(dev, "could not find IFR ROM directory\=
n");
> +                        return Err(EINVAL);
> +                    }
> +                    bar0.try_read32(ROM_OFFSET + dir_offset + 8)? as usi=
ze
> +                }
> +                _ =3D> {
> +                    dev_err!(dev, "unsupported IFR header version {}\n",=
 fixed1.version());
> +                    return Err(EINVAL);
> +                }
> +            }
> +        } else {
> +            0
> +        };
> +
>          Ok(Self {
>              dev,
>              bar0,
>              data: KVec::new(),
> -            current_offset: 0,
> +            current_offset,
>              last_found: false,
>          })
>      }

