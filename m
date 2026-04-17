Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26FB35AC1C
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 04:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776399010; cv=fail; b=aBhj08qTwHZisCYTVJAaUHSFH/rj2TH7GtHP/YlbOkdMMnV7Z3lBJrHnAONSvIYvb9WrXznjNFI3cfN9Lx7pg8BwrGJ3mPWs010MBgNXSx3kVHB2J7p9yqzcZs4/ZztKje1bvQalPJz+6Zvys06dfWypdADmhKIltRRLt9Wjd+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776399010; c=relaxed/simple;
	bh=E84gZ0vKrwDZPkJIBzkqHyVB1j1vIs+GRlpPh3fU0PU=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=a4OX1B1nFNq1MQMO63YIqOfJXyI1ja2331M/V8b00cmJ/y2g1IbU1Bt0sqHReaTGwr/UgJ+YQPOl6HiqhCeG0g9+yjpIuNjg5Km5cpIqN0VA5bDXOfpPxIO6pG0arfG9erZoNEU+F6Rgnuo+3JdX25/kO9hrzLoenQT0UkdxP+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VIOUQHe+; arc=fail smtp.client-ip=40.93.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VIOUQHe+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGO4jqj4n+vFfXooDWbsD8ZkULt90z3Fb+eWJOMqNNu1JCtLFOdGyR6xdze7/91upxwh+fLLJJ0939pC/wA8hNMhojYASQXD1fDaqBrCD+8Rsei3/uILPgy0kLkkUb5k8HgorTR7VVMsjvkaqHW93o8ta+nau5MQDZBj4EnBLigzwPRdp/ctcXyjUIxdqfk8RKbsTqN0fskpuqV3CSSsUnSuuwrwcEH70FCVfOubj8jNv6ElSO2hZIKvEQzzQVFCbaWgRnmAvTFoD0v9Rsgt9uFtENQ5LSqkTAEnhZHh7xQXG5Z6J0Bc45SSlxXmsTRaXJSKKMZkSTftCEVSoSdcUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncpvFgwRFCmu43ISCmbvvZ7bArY2vX9lbWCuvEF/0qs=;
 b=o+VG8QHEUhOWN4+W1kW5oSRpfRx1yPb8mBUupj9U2hYl6HMzPqzGOS9fzXx+mfUPn9uZYYlSF+ydJ52ECOeFeXpVe0BQJ2t+sGjENwDhE1K7VF8hZroqV1Dl/XdE795x3ZnbdDrz6JRTUM8MBx9KpUPgUi7dyQiDkPVlYSRq5GYu5UUD1RnvrX0lN9uSRfoameRWGPCU1YXjI8Ge2gLYUKvUH2T0PCqMvBYJC3Pg+Qv5XM1sl/F38Pq/Ut0SCnjl9igtLkrbwvGw9Wg3YHUinOt9OMNLgQpDw0kOQ9T1EQYr5ITfJDV3qkGOFrrwkY02gHAd3u67bDgSdtbL5jaXjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncpvFgwRFCmu43ISCmbvvZ7bArY2vX9lbWCuvEF/0qs=;
 b=VIOUQHe+IMJ/c3PeVmLj1wbUAWAY1MIErQJ5rZL/B1Lp3m+dYFxYI9Ht9TH9qLQtlkIPzFlM/9D/gsf/+mKN3YwzF1K7KO8brN53tBAVzSuTV8fVFukn28DDLasBpUzKdaen3NBtP26KwNNIxNXPepqAirisqyf8XdP79ZXn0W9Ks929N41hLKhS8wT5ES44TfoGojO0gQ7nLI5KTDo7v0Vpqw1VQ4ZdZCx1speIP4ZCNtX0KakHZYaOgddfrHSOlmwul7ilnCvHXbCT+adrvCsplr2oNLRWkJ3nS9bzGwPb7Bp/vmfDNEkA5GIV4jj/FBDwzxNRjIGr1ODy0/WF1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6282.namprd12.prod.outlook.com (2603:10b6:208:3e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 04:10:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 04:09:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 13:09:53 +0900
Message-Id: <DHV4VZTO4SE9.1X39BC8X45X5J@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] gpu: nova-core: skip the IFR header if present
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-6-ttabi@nvidia.com>
 <DHTH70U5666G.1ZGXQJ5TSNN7Y@nvidia.com>
 <025756bb7dab3527b3070a94f8b4f70b5ba5622d.camel@nvidia.com>
 <c5729db265dbab17735f50cc41afce555db12e6b.camel@nvidia.com>
In-Reply-To: <c5729db265dbab17735f50cc41afce555db12e6b.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0354.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: 706671a3-4ad5-40c1-729d-08de9c372fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VXR1B35K+VJrGKfcVEcQaiUec9lgUYejY4frfTjT97OgKehg5jijqrA7QD4HiqEL0DE+pGrDy+QLqCh1MeP1j7+cMRQ8EKytZ98n3ibK24CZ3aHuANqtC/Et2DLQJCU1vuLroEfI973ZQ8JmozXw0LpIkKVI2pR1TpW1X4BVwmT/Yu99nA0i+3SNqYUMWLL7Xfag/uv2J6eZw027KUWpGo3S0ARQFvmT8lb4LRsnZigghG/bj/na5pgxRVZ9twVJdUgAPltZLjdFerbKNJknIFK+iaoz7aI7EiXoHGZ8ymGhTmZYYRy01/kyQE9ADfXZjJHHCjbjAC/FKEsm+8fi9pr1XKuTH1a3kuDjEwz2sgjuh67ONIL6sCsCaAhVl8ZNkK7SdnyzW7APPav05F4c+dGPsVYAMEq6Jk0PrqxnygpdkZV1iLbYbHQWhW7moEVYso/+prE0iDTM0BNLAqNuGYPjO/bm/+tva69YQQmGFN1iM8hp+RxPcV7nyFS61EAixq+L9HpP9H1OhIm7NhGXMEY9g9aVbDWe4hFkezRKEcWCp5u59fsQWQC7AAGKpYwgFccNnIEESeosBaszTjtE9ghUoTC00YIW0eSPBhH3XFNRp6xit1+/V2cUGQ/QRgv8/ZaaMVgBCYnPy1B4C8BJMzTCxePsJE0VGcZBb5Ez4jz/lBFZbDKTWASr5HXPj7L6iWs3wrLo1HiXG15jyXNtb4so6iiLe6ew85Uz0x4w87Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGlOZEdWVFp3alFFb2tzU0dhdXJRcTZDV3RXS3dLcWF2VytUOW1NNk44dUhx?=
 =?utf-8?B?QSs1NWNiUDFHajVRQlRTQ3R6eXV6MlpTSXFnN2VDZjFTOWFWUndxdWdkaEQz?=
 =?utf-8?B?VUx2NnBYRXJEdE1OOGNFT0xXV0QzSXVaNHJ0Q2Y3S0dGeDlURjVwbHdYb29D?=
 =?utf-8?B?U2pJT2pUL3pIb3FkZGZLWURhWGN1MTN5RjlxbEdSVkZZMGhKRFFaRVdCWEF0?=
 =?utf-8?B?NzdDejJZTk85SThQODhPMG5tRVJiSVlsMmgxZko3NndIQURVRkNiam5zOVVv?=
 =?utf-8?B?b1FodzBLRktkbXMxR2Q4TUVVaUFDOGFUOXNWVVBiUVdkblcrOVFxYnVqSDJt?=
 =?utf-8?B?bDJ4eTQzMHlIbzZ5eU10Rm5DQTh3NlhlOHBkbEVsNUJtM05PMHRpVnRYanRV?=
 =?utf-8?B?YU5OcjZTQm9CaFY4ZXFqcnFXeHdXWFVpakh1c2s0eGk0eFdGOFBQVXdOVmR1?=
 =?utf-8?B?WFppMnFUT0JxYitNdDJTNW5yVTNRU3BwSjZJdkdIa2lQekFXVGxJSkhFNVFK?=
 =?utf-8?B?ZGJlWEViYnNkNEpyVnVDVVZpY1VkWXNpN2pSQW1NOTdKVVc5MXNEbG1rS3JG?=
 =?utf-8?B?dk0yOGVCZ1JCekt0QjY5TFJCY0VGdloxNnFDTGp0MHhGMkR4SDNtL3ZOVkpr?=
 =?utf-8?B?cHdmNkp5UkE3d2xadjBmWTlCSGdUVXlzVDE5Y3pybytQcUVTNWFndkFPaS9r?=
 =?utf-8?B?ZnNZOFhBejJNWnVSRGFZRms5QUtFK1Yrd215YkVYU1JnKzNhSWlTNFFSMUg2?=
 =?utf-8?B?RU5XQ0pWUHIrMTUxYUpUK0dMcFFFb0V2VDBRWUE4bjFycWxjUUY0QUR1SXVj?=
 =?utf-8?B?VDdqYkNzamhvZlZCZEdXUzFjb241WkUxZEJKTDArT0NJTC9GZkpzY1pLZjNy?=
 =?utf-8?B?VGVtclRveHl2Q1JBOFFPSWgyTS9TS3lkU1RNRitOMzVjZkhUNFU2TFNSS0p3?=
 =?utf-8?B?ZkQ2ektnU1E1NnpuNlNhbHkwNXNsMEs2RUJNSGtvblFadWdoMmhYa291d2lG?=
 =?utf-8?B?NS9JUjhDb2UvdHZNYStLNFlpcUgrcWlzd2hPdXo1SFhjYmZMY1FVSDlFd04w?=
 =?utf-8?B?K1FtMklYZE04cVdJT05FOGdxOHdqNmRlVSs2MmJoWXlEaXN2UGpQMnVDT2JF?=
 =?utf-8?B?Ykd0NDJEaVRsdFJwRGVNUGRMTW1UQ3c5T3lEaHJyUGp6TWQrZ0lXZHBVNlp4?=
 =?utf-8?B?YWV2a2luWGhETmlwQzJYZGdHVHRCcitaTHhhZ2VIU0ZmSkRxdWhuVGhvVGdG?=
 =?utf-8?B?c2lBOFhUSVBlT0svbDlVNjVVUituY2UrbUVrU0R4ZUtqeDlxaktGT0JicU44?=
 =?utf-8?B?aGd1RFlETkhiUWUvTDIwWGV2ay9VenVrQXBoa3RIbkJ0S0F2S1c5SUhka2Rv?=
 =?utf-8?B?b0x4SFhHMHFXTTcrWmZnS2hYbFhzZGRReFlCdlp2ekR6UnFWc1M5V1hYRDlN?=
 =?utf-8?B?S3ovN2hoT3NxeXFVeHQ5Skh2bThDYUU4dUFWblIxRUtQSE1UQmV5REszdm96?=
 =?utf-8?B?TytHWUhYak5WRW95K1V5NEk5dEtQcEwrUHhCaTRjUWZkeVRkV3NwRkF4R1Vo?=
 =?utf-8?B?Z2hOMi9BVUlkZ3FiRS9kV1lwL2V4eml3WHY2QytGVWpDa044NVUwT3dWaWMr?=
 =?utf-8?B?ViswcWVpbld4bTNJVngyaWhiMUFieUMycktiYklXdTRMVzBVSlQvdCsxRlJv?=
 =?utf-8?B?a28vOHhuZHhpNDZyNWdDUXYrM1lvNnlOeStSTkFBNnd0My9La0o1Z0Q5bXMx?=
 =?utf-8?B?THdIRXBOOXhDblAwWXcwaDMrbjZEeVRFWWFNVU93c0ZmM0lLRFltSzBNamJv?=
 =?utf-8?B?Vy9IcEZ1a2JIaHFUS3lPeEp1bnh6dUlKVHoxcFFCNHVDWFdBaWlPYlZHTWV0?=
 =?utf-8?B?R3EyUUtLWEdjR3ArSmFzRFQ4cXJBaFF0S2tFR2lsclFYbGRTQ2JDL2Zvd05U?=
 =?utf-8?B?MG1wNmpJMGtxejl1cHZiWEdBQU5OeVJQQXhKRFhGaGNUNDNrMWtyeXg5dUpn?=
 =?utf-8?B?WVNWbTJvR3JhazlyODdzUHU3RkV2VVIrYnRvZy9FZmEzUHI0czBIRlNpWCs3?=
 =?utf-8?B?YUF4Mnc1cEtwMDZWaDR0WWlIUlJ5VlJndnlqSjJmakpZSjJ3MGNGUWJrU2tv?=
 =?utf-8?B?OG9QOFAzVDJ4QUsvUVdrT0FKY255d25CbjVPQkdOR3NKTVpVRldpWlh6ekd6?=
 =?utf-8?B?OW1qTWJQUVlmbkN5RVJ6eUx2a3M5N0JGVmZ2ZjNLSDNxWGlsaVFnempOR2tq?=
 =?utf-8?B?N0lMdFdHTU1hRVJHa1BWaGkvNUM2RVBzTmdwbDRXL01uazZGS3NRWnBLRitR?=
 =?utf-8?B?VGFNUm5KRVJJMHVCanR0NHJ0MFdoQVNTZFdodGNXSWd0UUhUYk5uTFNReW9D?=
 =?utf-8?Q?0cWbMRymuqx5bMibImv6r+G8jtj+GuXELxCz6fRRfXBga?=
X-MS-Exchange-AntiSpam-MessageData-1: m7X9TVJC1CCW7A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706671a3-4ad5-40c1-729d-08de9c372fb2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 04:09:57.6239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvGm9bC+VPvlK7AkFD6lhk1SdSN3n+K/cG2qNuFve4AF+dKXRsfAgGpF4n6l4bvpFOKSVYWRw2l1wYmJ0nWMNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6282

On Thu Apr 16, 2026 at 9:00 AM JST, Timur Tabi wrote:
> On Wed, 2026-04-15 at 21:08 +0000, Timur Tabi wrote:
>> The second two I made up, so they can't be imported.=C2=A0 NV_PBUS_IFR_F=
MT_FIXED0_SIGNATURE_VALUE comes
>> from dev_bus.h as you said, but NV_ROM_DIRECTORY_IDENTIFIER comes from k=
ernel_gsp_vbios_tu102.c,
>> so
>> I don't think it can be imported either.
>>=20
>> Also, what tree is your DIFF for?=C2=A0
>
> I've given this some thought, and I don't think it's the right approach. =
 It has the side effect of
> having vbios.rs depend on constants that are defined in GSP version-speci=
fic header files.  It's
> also a convoluted way to add just one constant.
>
> So I think I will just keep
>
> /// IFR signature: ASCII "NVGI" as a little-endian u32.
> const NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE: u32 =3D 0x4947564E;
>
> in vbios.rs

Yeah, thinking again about it, these values are from the VBIOS - thus
they are fixed irrespective of the GSP firmware version. We use the
bindings to shield us against subtle changes between GSP firmware
releases, but that's not going to happen here.

Getting our values from the bindings would also extend them from being
pure-GSP to covering other stuff, which is something we should try to
avoid.
