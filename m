Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013064.outbound.protection.outlook.com [40.93.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4251F92E
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 05:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776230600; cv=fail; b=thuXa1OVsaOoNMqCIgZsGrguXhIsVSESlZRwMaL6v883hOCuYJ2lEbtHvrfyCwSrEdZxgfZcc7Ut3sJ+e17M8NgbfuZBXgett59Ga5USo9eyl8dLwWyzy9+bzWI8+d0vZ/WCvdlKEPgTrbDWKs2ZtT4si/BGDxnuk3Ftni6Upe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776230600; c=relaxed/simple;
	bh=Ha7ZGmPJqsCzDy1gZsPB6bJhokpM63IBho97ImonIKI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AA/N3e8c669DM++ve0q3pv/kkLnKHj6tO5vLuojmXGRlaR1sfM82Xct5rhEYl2/Rseu3q8Xr8EWv1sk5m/yKuaMIDTUQJI1FXi8jR+/MzAne3ecNkWPVYkKgRmTuDikO4ju+1V19B35NwLIqcSkgbY6qLAYJ61IGkiC0mJyaJDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N7sRNiqo; arc=fail smtp.client-ip=40.93.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N7sRNiqo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AF5Gzvlazn48tVjRP3SItaUEMD3GBiJNSY2AWknO5Dk+q5uIb/DNh2r2WztfF+Bg1tjKcMLHN16gWlYil083ykQpnjKF5Yd9YjxW2kanNF+DS+bSJJqiip2jUsQdZyQ3iF5GOLHad685B5ymZYLG75+xz+trtUb/6yRzt8TCOqhSAUTsq2F02SanCAKMR9OGeawABKWHGP5YdGOvWmDP64cmONl/8tHgPy5c1dWgAsK3dcNmdRzAhhwHJEXq7sF1kVZkAolC7xU1QuPpZwIGUncDE0qQaCkJTK14+EHpgccKpTQJg18Iq+DHMmvM5aFkMy3NHECEmpOicXUzDErAjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61wxwWn3rucEkg6t+MG4FK7E0EeFIB83fbzVf8u1Khs=;
 b=dF/tI/0cdEJJnNXfpimANzULEAKJpyHnx9emgDFNNFXhqJlqVoipl/tWt0bCDTyIiZnAdbz+si/9i1rYx7ZewLBwTnwPMamIycpj6u8UzHDeHz1t4xGR80QLhcWu1iFvyJQa4yW/ZkHQdh0ZfWXXP5IZ/OSeZ4d+Nsfy0ZuCv58hOK2JuSbPjcjVVyCNrK3hTln7oVCvcqK7/bsftKvpyX8A6oeLXWuNVwzmvTXOomz33jgBAjla0+0GqIbViUl6/3kzFZwwx6iULnGpNuIuObJvKW17RiTit1u13eVa+7E4KQk89fpf2cEMgfDPoz7L0ou6m4yiNx06uejIvAmH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61wxwWn3rucEkg6t+MG4FK7E0EeFIB83fbzVf8u1Khs=;
 b=N7sRNiqohqBfCBRUNmIs+emX86567I6/1TjuuBVs+Xp1ZFjK0IN79cEgIF5/h/VjzaTNHe4ug4+8J9ixZxuNbi2T0R6LGjTw8Q/sNfXrgR1njvRsXhjQpFF6yLKj+mV+0WCx3I3pXrECj49h0Tvg3Il1pRbpXf8XdGztK0nWlh5upMfMuShIIzddQ3vwzuZq969W4w+7EQwoDlW8C8RBCqEYJntIqiruC66qMASsAG3n6c1awdVywRufNIPZnKO4O/QED2XEmpwJN57Vft1LCmZwvfa3KEZA61eXd8y6Gz+lx5oB0+QQuj4l+e+36YDrruCHPuUlI4WNR1wEBNo+Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS0PR12MB8416.namprd12.prod.outlook.com (2603:10b6:8:ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 05:23:14 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 05:23:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 14:23:11 +0900
Message-Id: <DHTH70U5666G.1ZGXQJ5TSNN7Y@nvidia.com>
Subject: Re: [PATCH v2 5/6] gpu: nova-core: skip the IFR header if present
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-6-ttabi@nvidia.com>
In-Reply-To: <20260414235047.439322-6-ttabi@nvidia.com>
X-ClientProxiedBy: DM6PR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:5:174::23) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS0PR12MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d34095-6ef8-4d44-f73c-08de9aaf17ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Sqiz5Syc5M+1rYuWcnhYEdFyEQfZjJgtp59ANydbKtREnGbQE2ogSsnexkRlZLsRrkNXHWb+07d0WT1UvTLq9VvmAWtC7Xw8jNbyuc4y6TIW/fMZAELlTGYedb7XGi8l0bnum2gl4gaVoyPIPhMoKCXsP5miB8BDkq7XbAJKOLT5IZ4wpzh9rd9D7q0S2SikR4eMLNbSGCFoGtEO1F1E/uXfnzeykdUypq7vW2Y1EtGxnDSGYeHr4ptr7tSxK4UJ2hYG1+kMXVNmf5TPgscnuzREqJc72fQbyg5yzumWQu4pYN9fqDKRDfSUlVTdmznlgy3f/q/b4zJOLpWwFuP8Rs2rIg2UK25Z8iu4DokpPzKCtvOXL/LEl4b7xDSKkJ42I7FJPphmJisWHV6XFXFK4+V0+Gafypbe9pJZz6XUbPn970xYBtX71EP12LDd4iXOp/NLRDNu8HLlHhVQfal6lUACLNFneO7pt1YR21TocoXSEbm/gmBd6fVnmYzXNJSyW+xbDPWDk2iiYRs6MpFF8MZgGjRyFgMGIrBQZkbTx+NKFJRVzrqW6iMDV0HZ+rA624Dt9xVkghmXv50n4ZiHZByG+52ab5rixd9dUhM7H9u9dq4EPzOpsE10HVZ0VUgHGlhksVa3MJlLtoDnkWoDzPprz4AFWEkBsM/fEp2CMHeiHfE6Gcn1utLcRWkPU6Z879Sk7NAeOqQcm+n8SboSxseqRriKQGDOEEFK32qrpkg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEcwSllNZFpWWUEvWVFTZUFpbzdPVkw5bCtRUEFVaUgveGFnUXNhV3JqNGZG?=
 =?utf-8?B?SjFMV0RZRXdUUk8rK1NkWGRVa1NqV2xJL0JQQlRzQTRXQmpTNmtDaWlvc2Ni?=
 =?utf-8?B?MmdWN2lSS2VHN3JUaUpyV2JJcTZQZU84MjdNQWswL1ZuOXFmY2xSUW9UeU8y?=
 =?utf-8?B?Z0NWZUtXQmFCSGtkS21EckhvNHRzd0s5Y0hQK1J1b3dJWDVNYVdRZENnWkFQ?=
 =?utf-8?B?aTdYcXhnSkNObHR6WUZkeFA2SDVURUJUUmludFdtS2MvTkNCay9GaDZMem1V?=
 =?utf-8?B?M3NKWDlOZHNPNHBxcVRIY2JYaGFtM2o3dTBqUXdzaDRTRThZalZlSzZxbDRo?=
 =?utf-8?B?Yk5HMnZKT3Jua2JCd0FmSiszQU5RamVJenNnZDBCa0ljZHhlNElpN1F4Slpi?=
 =?utf-8?B?ekMwUFVYeU1rMThOc0tCaEREZTNueUgvOUxzR3pUVkVqYnA4bU5aZnRiR012?=
 =?utf-8?B?aVpkVGdubGx3UFNUWlhwa3MvVXZzbE4yd2FVYXJlOCtMNVZHSXVvYUV3UnBi?=
 =?utf-8?B?b2UvSkhsMjNBUTF6amhBa1dtMVJmUlFJckdmUUpPV3pselNiV0k3c3FLZ3Ey?=
 =?utf-8?B?RXdZUjdGTFJmUGp6dFBkK2xWUk9ITHplMmxrU1VRaXdia2NsZDBCa0t5NWZQ?=
 =?utf-8?B?MkM2RlhvMUJmMGZWR2k0dHlSSjJjMng4V0Q0OTM1N3dKNERMbUg0dENLMmFz?=
 =?utf-8?B?TVlBZG5hNDlmWVp2SDBwd0wzb09UOXlBZU1RbUxzVXZ4MkJnS3BSTGc5WXp4?=
 =?utf-8?B?VzMxZExmUVhKeENXdjZyVjIzRDVmQnVPcVAyYk9sZUkzV3lDSFFUVTZlMDAv?=
 =?utf-8?B?cVZudXZheSsvQ1Q2MTFiM1d5eHQ5dXZGUFU4T2J4UGQyaWhlTVdwTE4yaGRp?=
 =?utf-8?B?T2Zjb3k3RkZTUjlMeC94QnkrRnd1eSsyMU8zZ0o2RjJCYkZQaHlkMXVSaCty?=
 =?utf-8?B?MmIxTkdiVjhXVUFWQ0JnN29OMzhETWpOOUlFckcxNEY1UTRwQmlkTG8yOS9H?=
 =?utf-8?B?WWM4U1dlcy9wZG10TkMvaGp5eFR1UXQwRUJ0ZWFDYkpNeEJ3Nk5WNnM4STNG?=
 =?utf-8?B?WnNCZHBIZTlCYWlGeWRPdC9oWVRKcGlleWwvMFp4Vng5dDlhS2hOYnE5aFlv?=
 =?utf-8?B?TnV2L01hZDQvc1k4b2ZYSEJmSyt5M3o0Z0xMT3UvZEtYa2pGclV4UlFlUUNv?=
 =?utf-8?B?L0RFV3AvZDBOS2Q2OWZwWHRvY1J4UC9xSE9sSFBWZ21mSm0zOER6dVlLd1Bn?=
 =?utf-8?B?cngvSjhUcVNqVHNtRlRZRkpOd3VJZGxscVViTnlQbHRMVEllbXRaaXNTWngx?=
 =?utf-8?B?Umw3b1B2SGY4ci80U3ZCWDZuZXRDa1JwRmhuL3NKbU5FalBIVTJ5dHoxT2U5?=
 =?utf-8?B?MlB4Szg4dWhXYmlsSXJzdkZlcEIyVmxMTzlyVzlhdkJUZzFacGtJSmEvSzVm?=
 =?utf-8?B?b1JZTGhOQXZ3YlVLTzdqelk2WmUyUWJLamd6ZFFZTHpmV1M2ekpENUNPcFN0?=
 =?utf-8?B?RzQreUJVejlhUUwxbFBzbFZIaXR1N0lRMXZJTWsrS2RoWWVnM0RXZEpTSE4y?=
 =?utf-8?B?dnoySkJwcnN5Ym9EOEdUbS9oQTNuODc0Tk1saTN4Q0NBRzdtS3ZWS0R6RXUy?=
 =?utf-8?B?REJaeGY0V3FnMEVkQUtZRENYSi8vT2hvNTJvWnVpOVhxcHo1TGNSZE5rZnUx?=
 =?utf-8?B?NVdzck45L3IvMTZvaVZsUDQ4Nmc3N096dUZiWHZrSDBwT3hocEVtUTFQVUZo?=
 =?utf-8?B?ZGdwMjVoWERpM2JPZ1lmdDlLV0drQkZZdFVQaVF2TjlZblpTeEUwNXY1aU5p?=
 =?utf-8?B?V2FIL2E4aFBJOEc2NHZLOVhVMnU4QnUyR3Z6ZXJSZ0lvdEZaT0Vtdmt0cEJt?=
 =?utf-8?B?S2JNWmRncERtQXRSNXk3T0swZ3k5aVVjRFo3NWc0REFEQXBuYzBGaVVRT1d3?=
 =?utf-8?B?S2JabEhlTUY3dmJweWdSU25aMDNkWGhWNlk4MDRUWCtucW9QLzJ1WVNtUEZk?=
 =?utf-8?B?eHRGREVZTSs5Zm9zTGp5dHFmQjRMb2xha2tLNDFONklGSzJiTkpJTi9IM0Ux?=
 =?utf-8?B?eERJQ3BVcUozNXphVmx3SURKeURjSEZTMlVGbWRBa29xUk5nclhVMkhGVUhC?=
 =?utf-8?B?U0pGd2oxbjhjY2w4UjhBTzYxZkhuejJSZUtyYVlNTGlBRFAzTGxqRmJSR3Vk?=
 =?utf-8?B?dWVUa1RYeVY2WFRLa1Urd3RHZHo2UFFlcEZYcmtJT0ppMGNhYlp2V1lrYmxN?=
 =?utf-8?B?MFRYd0tOV2JYRkhtR2RJTWlsSnhZOXpDaWduQVpsT2ZWSVFXakVrU3ZWaHZ5?=
 =?utf-8?B?cUtMVWEwcmdZMEpMSTJEeDRzZWVUa1VJbzlHRW5kbWpVcEY1QTJlQ0piUzZt?=
 =?utf-8?Q?iMmWxaaeXCCZOeRKpTOFaXeMxcu9i+mYXiYRUy8T7oBbg?=
X-MS-Exchange-AntiSpam-MessageData-1: JhBRqMlqTA4ZpA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d34095-6ef8-4d44-f73c-08de9aaf17ad
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 05:23:14.3369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miTRVo+sK7q5apWQaQR06EnTm3BsqCGjfjMpixyrw+1KH6xC8y6mgj/lTNa2YoctKxLwOhoH/Pb5qFQ7rq1LjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8416

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

These ones are available in tu102/dev_bus.h in OpenRM and shouldn't be
too hard to add. As a general convention for the driver IMO it is nice
to get as many constants as we can via bindings.

The diff in nova-gsp-binding-generator looks like this:

diff --git a/nvidia-open-gpu-symbols.txt b/nvidia-open-gpu-symbols.txt
index cd6835fc00b6..9f08d842a3b2 100644
--- a/nvidia-open-gpu-symbols.txt
+++ b/nvidia-open-gpu-symbols.txt
@@ -91,6 +91,10 @@ var:BLACKWELL_DMA_COPY_A
 var:BLACKWELL_DMA_COPY_B
 var:NV2080_ENGINE_TYPE_.*
 var:NV2080_CTRL_CMD_INTERNAL_DEVICE_INFO_MAX_ENTRIES
+var:NV_PBUS_IFR_FMT_FIXED0
+var:NV_PBUS_IFR_FMT_FIXED1
+var:NV_PBUS_IFR_FMT_FIXED2
+var:NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE
 var:NV_RAMIN_ALLOC_SIZE
 var:NV_RAMUSERD_CHAN_SIZE
 var:NVA06F_GP_ENTRY__SIZE
diff --git a/r570_144_bindings.h b/r570_144_bindings.h
index cb7b62a446e9..1c1024da60f8 100644
--- a/r570_144_bindings.h
+++ b/r570_144_bindings.h
@@ -42,6 +42,9 @@
 /* GP entry size */
 #include <class/cla06f.h>
=20
+/* IFR header format constants */
+#include <turing/tu102/dev_bus.h>
+
 /* Instance memory and USERD sizes */
 #include <ampere/ga100/dev_ram.h>
 #include <maxwell/gm107/dev_ram.h>


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

This (and the constants) is quite specific to GA100. What about putting
this into a VbiosIterator::ifr_offset helper function? You can move the
constants and bitfield definitions inside of that function as well,
which would be nice since they aren't used outside of this area of the
code at all.

>          Ok(Self {
>              dev,
>              bar0,
>              data: KVec::new(),
> -            current_offset: 0,
> +            current_offset,
>              last_found: false,
>          })
>      }

