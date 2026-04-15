Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789537648D
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 06:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776236064; cv=fail; b=E6PQ2fSJARiaPlFUHvHLDk+s+yB614gOGYI3+LI/SWo3SEmRZEqqMCJPaq49pP+RZ80WyZ7F54L7r1DJTY8CveaBCdovEDrJe+98CGh+JgXbMMHNLI/xEmC2UN5prux9d+fLOGTeL3eWrXCVeDOyUfmJKP3LDEMS16Befo3Dy+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776236064; c=relaxed/simple;
	bh=7snu7H/+lnvJDEbtBJr8meujjN7WN5bsSpSz83UPknI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=atgaZumv0XEtoqDaNFAshuxYPs7gkMMmiEg6jlebDhNs6LZizKhv0J/HBIsVy3wzhmKPht1I44XJ59ACsERYaA7EpEnEIkzN8xYx8KEuUaTu80uYl4bmnMqyX5x6KWdFotQHEXzKYnsV3IHG6RCRYX2WLFgMzZ1hJvwaUSlohFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=amRvja1A; arc=fail smtp.client-ip=52.101.48.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="amRvja1A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qf3YS4g+juxbwhhU+kxEIlAISFIdBwCrg+fI3F4qlMDKkZqpC981Rgng+0Lk815I7LV7/KY+PxNBlVCRUtNScV3BwRjYSh//XkFBDek4jv5lNLvpvJm2TIW6Gq09q6j58e75LaE0rHjXY/IA1Rkz742x+cTfuhE1daslrqqSkQPNAPbLXrr7tYIGyxgDANZUzAbFqaFtA3i/6DRSfK+rO1C467qfOwBFfQzUbjQmdh6FtlWQnamlXgjJcks1kQtOI5D/gsLCJ+FGQYi3qtX/5ZBzxM94DkZfZWopxeqarF/9RJuTMco8hV5/tBjzDuVrSM7v+V+fUll0HysdgA36Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAo1OxxwiQwCNKvixmyDcPdENoRYlLtNrJUofj7rRwk=;
 b=UI2GxQdOjOIELiigRP/Ijc3ZMq2qbwkCewURInEsbPocTC1YtdXQnV9H0LrImCPFGONf5vo1pZh9E+XRtNqxe6znPBcwE66aY0FLkga7k1jfE+wHTQIYu7Ps0wYnsn21N5+BHZXVZHNSHf9TMyTkHhc6KZmZqohdTqadRUnL+WHHV8mO8Qpt1hFXTxEn8jglLRVFA20NNZWxzTDL2jMgvTSEHPUPniM3fLexMfop0/Ah0t06px+OGOIIia261x0quvQB5TJLW38inQxdqYknRq/cFyRxrCLpT15SsK//feTqeaDpK193BMvifHIQrD7UiEfOKTWaxyrKMhBjjSulgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAo1OxxwiQwCNKvixmyDcPdENoRYlLtNrJUofj7rRwk=;
 b=amRvja1AEicVMBSZrBfyeyMqRunI+K4mO5Qi47QwY2idEblGMBUd5VJARncR3qgJlY2kTfaw72e93najhWM3MJzeIzCvrl8WyQdK3CpT4lSahrlbztHz1ZGx9oonA7wpPMux9idKLj8EWbY4XruB81FaP8gEGbYDAdDa6AUn78lZ0igFWx7UiG4A56YQDOsK+mBasO2B2RIOLFey1R6EC19D1kGLmcKcXtKQwgU19xuSMVzM1QXPw2j1rNqFmcBH2/1w8Ribc53nvDLTUsW4Ozmt0ET6vwXWyuAySQsf0TbrbTra+gfyFcLUYSTznMfs95elFHZaHmEhdMyBcw2lPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6628.namprd12.prod.outlook.com (2603:10b6:208:3a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 06:54:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 06:54:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 15:54:14 +0900
Message-Id: <DHTJ4QFHI5AF.6DE3UQK71HAK@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] gpu: nova-core: skip the IFR header if present
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-6-ttabi@nvidia.com>
In-Reply-To: <20260414235047.439322-6-ttabi@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0078.jpnprd01.prod.outlook.com
 (2603:1096:604:25b::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a131d92-e3b3-4b0e-cd6c-08de9abbd0bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	p6pH5xmCiqtq88+2q7p1IIBChCNYCQTZakR2Wh3hAQGhtaLv4d1gAa5p82voyfQZxJGitjQrH2A14HscxaS7V2KS+DzMG4Ej+kVYdc3lJEf49EK6d+BNnsx2Qoc5VVi1qfwsB7tJ9Py8zSrXxlhqqi64ppWWc5BSXcOkOf7aEUmaUe7G98oWf9K1lnaaznBa2wU9QQQO804HKURFCsgOcsAK1qs4m4KSi3H4q8PUvpF1TOdPA6anCLFlA+XJ7kZpTlGkWGdnfuS6Isg9s8SyA48gmmVlb2Q3OGtnnZsT35oLYEcCDOd9LUYiTysXqF+K6B6BQ/FgfgLa992TbizyFAB6rIogd3gj2ubFMa96wMsQ3G+STLgbZiNQBiFRdi76etbaEaWb5fyJNSEouzqUtxgmziLWHVMYU+mj/PSCYo3SsHA8H33zGKRZTB/Wn5iUuPKxe/v6Shz4rpqUs4wNl5GTblH8uRy3bqM/UiCez0EbjojD+NQR+NfSRwZA3HxbdUtmwVXdk8itN62zwCUL3eE+07zgAjEWYOFIjBUUtQI/YrihI3Ioo9JTIuCbIfYl8gPLCv89Ry1U81Yud+O3xMKpJoy2HGcraUGlolCR0TH5Q4OIeKh37bubwu/Gobdv0ohRrT+Rt6xt+YpxKah3hUwsZWJtzGTiX3wcdvPDWFQlJiPIHMniwuZ1KUvyUtjuLs0QUV6wD7lSll7VlknRzfaZCoxmIqRARPCvqVo1sAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG5ibEVkUmJhdlRWM2J0RWwxbmNobWZQbVl3b3h0cGM4UktJWlJNNmMxbFpJ?=
 =?utf-8?B?S2t2cndiZzJKTnV2eWdWTDIzWTRCd005UGUrNWNQSTRpS0JwK3BXeFZFenZ5?=
 =?utf-8?B?REwySVpJanByWGFWbmpEK2c5WGN4YTVtNnRYMUc4Rm11OHVvczNUWEpKNytp?=
 =?utf-8?B?QWFoRW8rUVI1dXVod2hEUjRwOWNIV1VjL1dWa1l2ckVXSjdwZnd0VUY0amFw?=
 =?utf-8?B?QkM3Y3lDZmpSYlhPeXJub1FNOEdzVWMxa2JtbkNMU0h2VDNjS2VVS0NDangz?=
 =?utf-8?B?RjJhL2hIM1ZnOVB2Q1lLTlZ2QTdOM2VzU3NwL2s2V2JQcWYwYzlLcHg4RUlx?=
 =?utf-8?B?YmJOa2VMbDNXQlNKRkhraWRoVUV0ZGpmLzZFK3N4d2orS0QybVY1bTFHMzl1?=
 =?utf-8?B?blVtcUV3V0pkZ3hUZVlTNkMxRmVEOG45Sy9VVWxZcWs3MU91M1VRclhsSkRK?=
 =?utf-8?B?WFdmVFdndHkwK28wV0dvSGF5QWQwWlNLYVZkMWpjb2ZPZlVPYzE0V1R5WFFS?=
 =?utf-8?B?NmpuTTRhdUtZeFp0SGw3TE96Q2hyVjA0UG1XTC9wUHVUWWlESC9UY2RQZDVB?=
 =?utf-8?B?OXNKZTE5aWdzeTQvbmR2SVlFSGkydHhsRTZsMUk2N0JWMTFXakdFMmJzRHJN?=
 =?utf-8?B?ZUZ5S1pSVFJtV1pxM05RZlR3Vm5vMkJ0VmpFMU9VZ3FiWDNHTTFIY0orc0Jm?=
 =?utf-8?B?ckhpN2hEaHVYYXp4MzFodTFrRWltYTVUZzdyVUFVNlNQUFBmRzVENTc5N3Fa?=
 =?utf-8?B?TXhCejlaZXdLU1N1Vm0rOFBHNmNOQ0NISS9wSlZFSmJEVUhTNTlDdkRhUzlq?=
 =?utf-8?B?TEpoVk4zeE12Tm02aHRHYmkxS1hmWXZMVmIvU1JSYS9qMEhYY09jMXR1UDIv?=
 =?utf-8?B?U0VBR2JHVW90VkxyR0dTYWt1LzE5K1NUYXAzdWVmdC9tY2JPUE41OVp6K3I1?=
 =?utf-8?B?djJpWlFYNnd1bExoZnBVSDVMWXZaaWVod1l3N21xUEtXKy9hVGlZSjNPK1ZP?=
 =?utf-8?B?YWZXcVowVXl4eFkzbVJxSksyZTdPTHJlRUtqSHV4QVZYWjk2U3JzVVJpSldY?=
 =?utf-8?B?YmZHcXJ1djhWU1Z0ZVlVZTFPcm5pR0hIN3pvUW9qRUxWZHJQMkxCSzRNT0hH?=
 =?utf-8?B?ZmFLMVp5REtJay9jcUFtU1JwanZka3IvdldIUDVZWmU3YXhaUlBCQ2tuYU81?=
 =?utf-8?B?TkV2V1dhT2t1YlowUUFCa0grbmIzT2ZvWHIwK0Z4Zm8xQjhod3hnT2tuMjZn?=
 =?utf-8?B?enR4c0NQOVlwa1cvRlZWSEJCMnh4cTY5Yk5LRUNkMVFaQ1llUFlrL1lFN1Ur?=
 =?utf-8?B?TXhORlMxVGdQV01xNTJFQ0U1YmJqQnBMRy9JcERZbG9OSmZHNkFURGRDMTRk?=
 =?utf-8?B?V1NJY0hYRnE4RnlaeDZZaUNab0xXMElwNVhReFJMb3VmRFBxUFNIVmtJK1hQ?=
 =?utf-8?B?RTlGcUhVVWxJUGl6MnJ6ZWl0WDFQM1FmNzltZEdodFVSWGNWNWJlcWdBa2Zs?=
 =?utf-8?B?OHRoQ1dQQm5CYWtnZktwNU9iaGlZcklMQU5MT2NQVm42VHRSZEwyYXdsaEhU?=
 =?utf-8?B?b2NoTUwzRzVpazJFODFWcExvZUYyVW5PS2hvWUdWYW5HbEhkYS9jdkRMU2dJ?=
 =?utf-8?B?RXBabDlDSUdFV21BNDlOTWpEQjdHYlRnbjR5ZWYwTVRJYmM1M2hURTAyZU9V?=
 =?utf-8?B?WG93LzVsM1ZzV1Nadm5TTXYzeEJDdHk3dGJTYlV4S09nS2ZhS0Zkbkc5aC9G?=
 =?utf-8?B?TXJpUldaaVhrMk1QdzZzVVJoYnpPL2JkU1RIUmpWVHZwNE1MMTZ1Uit5bmV4?=
 =?utf-8?B?TnBoaGdadmR4MWlZcnYwb1k2YTVrdFpUai90K0ZzVWxCWkJ5cWdvRVN4YXVz?=
 =?utf-8?B?bjRaUG9JSGxZWGcwWnFjL2ZwazFmdXQvTW1KRmVzcTRvbzVFNTZ4RHJwdzVJ?=
 =?utf-8?B?TkRpZ1ovdytia1Z0WEM1VkZwQ2xkQjdleEd2ZzdaMnZVWTF1d2tWdENSd0dV?=
 =?utf-8?B?eTFWbFhQRm9tMHNuaGRhbDFXeXBYcElvRG5xYVJtSE9GaG4wQzZZMzMvK0pS?=
 =?utf-8?B?a3hpb0RpbDNsTGkvenE4TnhUa3d0RDVrb0phZTlkeVNNSWorWEd2SC9JazdN?=
 =?utf-8?B?enRMWkY2NUk2T3FocHRyaUFoZU5mQWJTNm1TeisyUDB5R0JqM0FmeXh2Q2Rj?=
 =?utf-8?B?b3ArNjkvTmcrcDVHcmp1L04xaUI0THhVbS90bWx2dGkzbFdDQm9HM1psMVZ3?=
 =?utf-8?B?Vlh3N3Jkc0svTVlYZXhRTWhhQkQyeDgwUkEvd2NLcDdMQmE1RDdSZFBxMklz?=
 =?utf-8?B?ajdUZG5XVUpLWEZMeTlNUjZFVTdhblhOcXdXeU1uYjg2YWpuUHU1N0Y5WUFH?=
 =?utf-8?Q?lM/m5Toh9bePN650Ly/6NKI7Ev4m5/ijVqKpFwCez+OBR?=
X-MS-Exchange-AntiSpam-MessageData-1: 0t1O4CaCDUG9iA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a131d92-e3b3-4b0e-cd6c-08de9abbd0bc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 06:54:18.6951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/aGOQOFhrw2GC26Loen1jxk0HUcMmIt22G9cq01gMCcqyE/nRCMboBomVfunAXtqZcvbZ3ez6CXahOWbYDj4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6628

On Wed Apr 15, 2026 at 8:50 AM JST, Timur Tabi wrote:
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

Given that we are reading `signature`, `IfrFixed1` and `IfrFixed2` from
a fixed offset in the BAR, how about turning these into registers? While
they are technically not from a hardware perspective, for the driver we
still access them the same way.

Since they are local to the bios, I would declare them in this file
instead of `regs.rs`.

Also I'd move the code parsing the IFR header into a dedicated method so
its name informs us about what it does (and provide an anchor to attach
the documentation to). That way there can be no confusion of `new` keeps
growing for other reasons.
