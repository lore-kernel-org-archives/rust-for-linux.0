Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010021.outbound.protection.outlook.com [52.101.61.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA4627B32C
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Apr 2026 06:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667078; cv=fail; b=Xd8iQJCdIx2jLVqlrQbwbkDDFQCUkTw2txf4kaBX62PkR6xRd543bANqCs6EPvBQMdbogEfMone+EE29dDGqzTZjBA2ULTGhDTd664kY7ECpXHUbjYRVnMy89IU7kDvpWGkOhUaRCmWCJl9cjT+yX66EYDy0BY5WMAuVlIcbfgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667078; c=relaxed/simple;
	bh=IE014pkEu18eXPkywTKffTgHEeCYfWTB0PeeH4coLXU=;
	h=Content-Type:Date:Message-Id:From:To:Subject:References:
	 In-Reply-To:MIME-Version; b=ckrhzXDrvM28np/gP/bu76rZEkEqsBPxVAUPlRXbz47EjFYGpHMjSuIALaAOpLpqrH6rHY7VlQhgA7i4SNDlDEabwx8qQbKzcWPB1I/jWMVddUOa3zIZyTVbyDJvAw72fgX5cIb0HWSPsCjGbdLpZkicf5Zlq2rm84kk4nc41t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F2MkCDve; arc=fail smtp.client-ip=52.101.61.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F2MkCDve"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nM2fPBQy3p9eW42un8noEUrbQDyEkzR8MwNupPMQSmM49Y9rDAUGvH9Lc5SI5qbQwcaxLjW09V60PGUqIc9JWbfXweFI1+5PnjkxxlBQ99MGYtFYE0SoAdrdFXQTWRMNhEcWF7Lu9evZ4StvG0j/gB74Pz4m9V9e06rSfXHq9+p8G3XQvSdMUvlVKhHgRy8RuZ29b5cMK1s3m5mYK2J7nEaUrPtzPUgfCbnv///uQPfun0nWxxYIqYNwwWVPOl3iaNEbQvW4cdDAq4AN8l9HZrMZVYB5SmQjlkHEkRRpfpX1R7jGtyOQpzYg81ThYhs1dp66oS2qoku4FrFALAYWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOKqQkm2+sFrMxLxwvpOpLys//QPiuTcsCyY5u0yrYk=;
 b=cXwlRcMUxwr16N9kEKHWp5GVN2Pk97X/M9gT8L8z2plSUt5NirtQVdSVkGG8bdJkptT5rcAVfziXpPXLlix3OMF07nthgw+uEP8WBmzEIGG2ZMNmgvHjUuxId+zaPkZy2JjKicg3oiRv1fVSZiv5M7SUUBj3kcp8lvajgoi9iP8njp1Bxk4aCUkMbRoEMEQtJcRZF4vqAby/kdltpLxSVC2vbLsk8jAnIobrLq9Vr78l6rjcrL8vzBwQhuAnFI/rSgz+g+Fe6afZRLlF3OLg/JjzRs61RGF0QXdCZ/ARm8HG3e7LyB6LQV8dOgR6sxpMtBOqZElhcSGvAVOIBRBI0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOKqQkm2+sFrMxLxwvpOpLys//QPiuTcsCyY5u0yrYk=;
 b=F2MkCDveAb9vxQDN/noOhMpknTvpM5kM/WCDZ5DSypSg299MV3k6rnP1NrsVpLPhCTnkVBe6bRV5+l52YVW3UDylPj4ga3ItJyJzkbcYMo7GFd43/VDIzjGbiJNo/iKl8YMAxz8OskwBhnWOmApk70vn7vpBHTxRpdmx2mrneW7V8kztem3/E9knLtzouWok/JrlYhM92XkViGnM/8W3Zq5TucbqkEe2/qtfCW8VXMLC+bCuW/DRDpg9e1q82CeGDHj2VrNzWC3C6h5PzZP6XkTrzSWuvSxtl0nZ5FwF2o6V40HSHe8VYpasQGwX+22IZ6f/fII7eFQtcRR76TrhCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA1PR12MB8842.namprd12.prod.outlook.com (2603:10b6:806:378::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 06:37:49 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 06:37:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 15:37:42 +0900
Message-Id: <DHXRWT0LZNXL.3SZJR0AEB1P6I@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 5/6] gpu: nova-core: skip the IFR header if present
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260417191359.1307434-1-ttabi@nvidia.com>
 <20260417191359.1307434-6-ttabi@nvidia.com>
In-Reply-To: <20260417191359.1307434-6-ttabi@nvidia.com>
X-ClientProxiedBy: SY5P300CA0080.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:247::14) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA1PR12MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ce04d1-5f38-4f66-6678-08de9ea756e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cX9/KUM1S8JvXZnHDfF7jmXn7kDOK8uEGZvhd5GC0tCxNy5IvAMEAxkV6Rq06BkQvfmOM8TZr3moELN1LSK022Z8wx222NRiaF7U/NBlW7LiB12qzoaVT9qOQHLAyt61O6bhWIxAAi20OmC2ZjjGukEqL6Bnvq1Xo77MtANqvsr5PL/dMLj18aqjaRiI9kOqDu0WRRtRVr201pIpqommyQ4hn2czsZP+aYrl9sjKvoe0RGvUyVbViiiV7NBz0QY9IkHdUzqhBQdROk9P3VDadn1MsBKI64bVBBjICjL2WdJ/e6+1taEm84CehaLZEEa5SUvNgHHHQxiD4j7qIXoNkoAybKrSt3Z4uu6eYIaJCHvONzs8i5u2WVpAoXubrPiinaz18M++oI77XbOHKPr34M/H0XmsbiHVf+irQdWqVnLxMioQE5hJf9sc3Gz3aQVhvPwb/To7losaPAHvrCBnhDW8RAgz3JgfgD6pLklVQfakXMitD1gdn4WrRemJ7rjlR3ZhUJSfV2hI8FfCO4SstWRmXrMIHzaJ8kcj76supY6WXZmSSOfTzmCxKQvYgowN39PXwhB8go8WRoTMLe+udEqUces5dVvyyFHortNKGZLIFjdqXGr1G3tW2Dx8m72kKzlRAY408uFOSpRzmBZxgAiDDybqaDm1BwZGGgW0v70p2STC7xcf8SWqIBybulE76K1AMZO8fPLoJG8FrxYMOFZGS2NT2Gp70j+KB50hGRk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2c4eEJCTTRpM0pad2p6K0dOMjd0a2tVdWo1OXkrYWlHTDJNb0FqNnlVVlF6?=
 =?utf-8?B?cG5iZitUN2MzamtDTGxUZW1SZ1JVL0VwSC9SVU9ZMkMxV25IYUpnV0pxM2Zv?=
 =?utf-8?B?QllLZW55RkszZE00dHlGWFBlWGdITThFRlV3WGR4Mm5ZMWVGWGF2MzRkcWl1?=
 =?utf-8?B?UHBsZ1JGK1pKWi9MVUtPNTY4ZmcrOGdYcC9tcGZRNXI1b09LaWV6S3Bac3di?=
 =?utf-8?B?cE5vZC9CVmEyRTU3c3hpSW9YcXJoSWhqVEw3Q01sejdHOVNvMDduVEFrT3hR?=
 =?utf-8?B?SlVtM1dpR2RGZWpyMFJaSGtxUlZhcnNDeEwrRnVERlA4TVAvT21EQlVKNC9l?=
 =?utf-8?B?WHNySVZYK21BOTNwS2dIZTh2UHdTTEo3S0lTOUtmVXV4ZmJTdkxZSXlyYzFu?=
 =?utf-8?B?ZCtDZVJQbHl5S29tVWR5YmhQc2orRmlCS3RGMDZkT3J6NHVGenVhbDQza3VM?=
 =?utf-8?B?VS9BaExKa1prOFdFNmxDUEIvbEJlU3d1bHpJcnBFRDdhYWcxdEpVV2h0RWxT?=
 =?utf-8?B?VVphZnVFZkw0TlJ6QjNTNC8xcHJPbXFncXdJbVVpalhWRzU5NmV4TUtYMzJE?=
 =?utf-8?B?bCtCRENqcVVVMmpLejkwTmhhU2VFZTkyUXN0a3NMMXFBOHZ4T24wdWdja0VO?=
 =?utf-8?B?WndEcEdYQkFiZ1EzZVdlU3NQZGVib1dyc0JkbXNDN0JPajNpSTNtWDRJT2Vn?=
 =?utf-8?B?WmtEYmdZNHBFQ2orWFVxMjJwU2RlT05oNGxkbHNjOFBmN0ZUYVlWaU9oc2pk?=
 =?utf-8?B?VDE1d0RMbTVaWkxaRm9VTm5jYXpJVjVRS2x1b1JiVDlwYy84LzlFSXJLdGMy?=
 =?utf-8?B?M1J2SnhZaWZBcUFnZnVTWWNWV2pCN011RTJWdmY1c1dYQW9IUHF5SFJsalpG?=
 =?utf-8?B?dUoxZnh6eTU5OVJpaEZjN1FXeUNDbzdJZXhIWWVvSHhNaUpkeXppUUVyVEJV?=
 =?utf-8?B?eEJzQ2xOZVI4K2p5RTUyRER1L1RuaFdEeWdNU2hFcFA1eXdxSExObDdGeGV2?=
 =?utf-8?B?UWR0MWg1YjlNU001eUhRYmxhcU1tdktjWGxtbkJ4UU9VakQ2d0F2aVpnTlc4?=
 =?utf-8?B?NEU3SldEaGM1WkNZUmtEdU56YVJVdUJsUUwzSlRPVW1XUFJxODE0c3RId09F?=
 =?utf-8?B?SHRFaUFybExLV3JBNWRnTG8vN2ZvME5Jbm5lcUQ4Q0pTSEtiNWltQ2cxSUF4?=
 =?utf-8?B?cXUxdEJWa3IwRTlvTStNTUd1Rm9Ec1BzRU5GNlJqVGQraHVLYnMzL3c0MmFN?=
 =?utf-8?B?bVU5RGY5b1pwcVlDWThCVk9NSC9QZnRzMFlBRnFVY0RPbWFZTDJHMTYzZHg1?=
 =?utf-8?B?MmhPbnZRNFRTbHpCV2hSS0VFc3Q0MnE5czNralJ6NGNvVUk5L3QydXRVVmpQ?=
 =?utf-8?B?ZmpHOWlhdEhsZHROWEllclFpYlJ2T2dyNnpSK3Byc09iVEUreVpaRDBoZ2Zm?=
 =?utf-8?B?eE5GWkRMUlNDMFJlWGIyZHhBK3kxT2VJcmJaTkNvcWg1SDVtc1hFaWhIdVQy?=
 =?utf-8?B?VDl6dFF3OWdoYUVjSklPNmtMTTE3WEhIWEYrRzl6MmQxTkdyd2tGVlBvM0ht?=
 =?utf-8?B?b0JKRHFlUDBDNVJsZ0xYbDN6SDByOHpLOXR0Q0E0R0dzY25kcWt4bTIzSXBv?=
 =?utf-8?B?VDJDU0Zkd1BRbkVkeDJlb0JuWjk5NGo4aWlESWtnbG0rWEtWb2ZpaHNwVENE?=
 =?utf-8?B?T1FadnJNWVprT2pQeG42Z1BicDVPb0VucEloeHBXc3RLejFKZEpqMGJXUnpQ?=
 =?utf-8?B?Q2liMHp6SnE4cUNKMUJiWjNMUTZnc2lvWWZYV0JMMFRnS0FTc2IrTTlmRWIz?=
 =?utf-8?B?clFka1J0REllVGNQeGVubi9sa0dFaFVXc0pXV2hra0c2TXVtaU4rT3N4R3dz?=
 =?utf-8?B?RWpjRi9pcHpJUVJkQyswVVdhenpmUUNjQmNGUldMbUNiczQrV2ZISlRnR0Zn?=
 =?utf-8?B?VkgxMVE4WFZrNGRBbHdhQ1ZLZkxWUFlOZ3o3YVVEb0xhS1N4d2dKU2xTZnZC?=
 =?utf-8?B?aUN3TkZHbFJuY0RybGt1QUlzQ2hLSkdGY2JEZ0VBQTFJVHpsZTRLYThQRzFH?=
 =?utf-8?B?WWZIdXAzRkpmMHgwTmhNbG9IdEE3dHVOdFNmbzYrMDBTdjhiZVkrb3puMXN0?=
 =?utf-8?B?ZWE4cFo2WnJ6WVBIdUlQaFhsOVNTR24yaENranEwcGpIdnhTWWVtbjIrN29z?=
 =?utf-8?B?ZFNEK0JpY2phamlUNERBYWw2ZXZDU2kyTHZGaGhUZEp5WVNJWFBsVnBtRmxt?=
 =?utf-8?B?YlBhby90TW50VGpGVVJZdlJJcm5oeGVod2dNd2tTYituZXBidnExRnFOSVh5?=
 =?utf-8?B?M0RhOUxQQVEwa3kwb0VIRUpZVjJSdVlKQzlMTVJUOGlKQStEWkVhQTEvY3dw?=
 =?utf-8?Q?CutbaorvStI9QjD4ZNNxZZK0QmXPstuSgkH70Ww8No2vz?=
X-MS-Exchange-AntiSpam-MessageData-1: yoGU5JgxLPeKxg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ce04d1-5f38-4f66-6678-08de9ea756e8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 06:37:48.9963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQULWQPksoj9e237rDYSruYjIe7W2UclRtpaye16Qc7j3zl389/TDRzzZEIK7a0tS/eKDjE5qDmAKdQGQ9ukaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8842

On Sat Apr 18, 2026 at 4:13 AM JST, Timur Tabi wrote:
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
>  drivers/gpu/nova-core/vbios.rs | 85 +++++++++++++++++++++++++++++++++-
>  1 file changed, 84 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index e726594eb130..6bcfb6c5cf44 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -12,6 +12,8 @@
>          Alignable,
>          Alignment, //
>      },
> +    register,
> +    sizes::SZ_4K,
>      sync::aref::ARef,
>      transmute::FromBytes,
>  };
> @@ -89,13 +91,94 @@ struct VbiosIterator<'a> {
>      last_found: bool,
>  }
> =20
> +// IFR Header in VBIOS.
> +
> +register! {
> +    pub(crate) NV_PBUS_IFR_FMT_FIXED0(u32) @ 0x300000 {
> +        31:0    signature;
> +    }
> +}
> +
> +register! {
> +    pub(crate) NV_PBUS_IFR_FMT_FIXED1(u32) @ 0x300004 {
> +        30:16   fixed_data_size;
> +        15:8    version =3D> u8;
> +    }
> +}
> +
> +register! {
> +    pub(crate) NV_PBUS_IFR_FMT_FIXED2(u32) @ 0x300008 {
> +        19:0 total_data_size;
> +    }
> +}
> +
> +/// Return the byte offset where the PCI Expansion ROM images begin in t=
he GPU's ROM.
> +///
> +/// The GPU's ROM may begin with an Init-from-ROM (IFR) header that prec=
edes
> +/// the PCI Expansion ROM images (VBIOS).  When present, the PROM shadow
> +/// method must parse this header to determine the offset where the PCI =
ROM
> +/// images actually begin, and adjust all subsequent reads accordingly.
> +///
> +/// On most GPUs this is not needed because the IFR microcode has alread=
y
> +/// applied the ROM offset so that PROM reads transparently skip the hea=
der.
> +/// On GA100, for some reason, the IFR offset is not applied to PROM
> +/// reads.  Therefore, the search for the PCI expansion must skip the IF=
R
> +/// header, if found.
> +fn vbios_rom_offset(dev: &device::Device, bar0: &Bar0) -> Result<usize> =
{
> +    /// IFR signature.
> +    const NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE: u32 =3D u32::from_le_b=
ytes(*b"NVGI");
> +    /// ROM directory signature.
> +    const NV_ROM_DIRECTORY_IDENTIFIER: u32 =3D u32::from_le_bytes(*b"RFR=
D");
> +    /// Offset of the NV_PMGR_ROM_ADDR_OFFSET register in IFR Extended s=
ection.
> +    const IFR_SW_EXT_ROM_ADDR_OFFSET: usize =3D 4;
> +    /// Size of Redundant Firmware Flash Status section.
> +    const RFW_FLASH_STATUS_SIZE: usize =3D SZ_4K;
> +    /// Offset in the ROM Directory of the PCI Option ROM offset
> +    const PCI_OPTION_ROM_OFFSET: usize =3D 8;
> +
> +    let signature =3D bar0.read(NV_PBUS_IFR_FMT_FIXED0).signature();
> +
> +    if signature =3D=3D NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE {
> +        let fixed1 =3D bar0.read(NV_PBUS_IFR_FMT_FIXED1);
> +
> +        match fixed1.version() {
> +            1 | 2 =3D> {
> +                let fixed_data_size =3D usize::from(fixed1.fixed_data_si=
ze());
> +                let pmgr_rom_addr_offset =3D fixed_data_size + IFR_SW_EX=
T_ROM_ADDR_OFFSET;
> +                bar0.try_read32(ROM_OFFSET + pmgr_rom_addr_offset)
> +                    .map(usize::from_safe_cast)
> +            }
> +            3 =3D> {
> +                let fixed2 =3D bar0.read(NV_PBUS_IFR_FMT_FIXED2);
> +                let total_data_size =3D usize::from(fixed2.total_data_si=
ze());
> +                let flash_status_offset =3D
> +                    usize::from_safe_cast(bar0.try_read32(ROM_OFFSET + t=
otal_data_size)?);
> +                let dir_offset =3D flash_status_offset + RFW_FLASH_STATU=
S_SIZE;
> +                let dir_sig =3D bar0.try_read32(ROM_OFFSET + dir_offset)=
?;
> +                if dir_sig !=3D NV_ROM_DIRECTORY_IDENTIFIER {
> +                    dev_err!(dev, "could not find IFR ROM directory\n");
> +                    return Err(EINVAL);
> +                }
> +                bar0.try_read32(ROM_OFFSET + dir_offset + PCI_OPTION_ROM=
_OFFSET)
> +                    .map(usize::from_safe_cast)
> +            }
> +            _ =3D> {
> +                dev_err!(dev, "unsupported IFR header version {}\n", fix=
ed1.version());
> +                Err(EINVAL)
> +            }
> +        }
> +    } else {
> +        Ok(0)
> +    }
> +}

nit: register! type definitions can be put inside the `vbios_rom_offset`
function since they are only used there. And the function itself might
be better inside `VbiosIterator`. Alex, if you agree, maybe you could do
this on apply but not blocking at all.

Thanks Timur!

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

