Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021087.outbound.protection.outlook.com [52.101.95.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A41928BAB9
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 16:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773678519; cv=fail; b=QQ+gctBfuDCKEJ201gg4obq5kk14JMdx1TXmsi/keVZ866On+o9hCpnFTMvBv5p18i5NTtaVWMQ2uDWlItPz5IQ3ypsdf24g8gR2ZlwIXsN2jHD+IV4LJ3LCZSGMF1wA8wyvV4aNMo96vg8HYTKiclC8m27DmBrMgfmb66xVPDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773678519; c=relaxed/simple;
	bh=bahcSaOnIZtNpq2/a/LiLH2ZN3gKIRCMBu5mqlxzJSg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ouPkLfytAz7mIYcJgsYG3SMKdwfz45NBLYsyiUsacPYMAku18pgoG8a6DafxhoXirypMNlpQe3B8+uqlarUGGYQQSarl1ZZP7lCbpMkj8LCKxqtWVXK0Ive6Qp8XEW2NdQmnQPZ6JdUcQnc8mVuTpZbPMRu/24gsKu/PYrcwAz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=T3D7qHGS; arc=fail smtp.client-ip=52.101.95.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="T3D7qHGS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3LOLlAxpOC6o2x+2eiNFV+7tyUhV+UAcj1MxcwE72QqGhyAPJ6Egw4TooAJP1ytM+6INglDfzcPkr3JQeQhd9MLSDRpSHksIiQy2u8+KYnDtEByiYKuR5ZEBZqLUn7RuVQSHgoGUfhzixBQDevyF7D28QJi0mfTOi0CUq27X+rYzTHGIW1pHXbEicEDJ5TR9yn6iPW6m2WcUu9V2oDOOXOHDV3JFsYKqkqFIhDZbayPy1DSv/nklQcwqGmHRcOmhftYiZ2yTD7CzjBi8gBfWT1fXBqW5bEUtxl0xJ2asUZXqkTFWFcy4LNUxW4PSJ3g9Z75mJOFNdB8YMB6yh3K/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qX4+F1mJkV/XuuXWq++s4Q1rhq7BCWT9dQCN7icAWLs=;
 b=BAta9xs/0UQWx6PcnjXiqP/ZbVSdvnOcLb2pxi3TQ2lMB4Si2jRTIl5WDq4N5pcP2d9NgvPgMzuXFN30ZgJglz8W5bq47ENMU83Y0n6Seu7Nzd5ARJyfqxJEkmGUmiDxcjfSUBFtSphP0Lv5FbCffhi71scaD0CZzyslZuGMPr72UQ1T0qsgiHI56yoUvKPgeGax2OG3UT9o3IJ6OHWHa44t2i9fTGXoOTZ4t7V7sMQEA0Atb8MjkmvmQkqpeE7fpP4ffdReiZ8eSMdbiMo4/zOdeVePqW4RJCI/VTt2acUF/REgyn+lpIqUz7cpmk8xYoS4MUJSHl0pRJYAtY1xYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qX4+F1mJkV/XuuXWq++s4Q1rhq7BCWT9dQCN7icAWLs=;
 b=T3D7qHGSi8K7XbiYfAi9d4LG4v7YRO1CrX5XD2VEblF8jFChXasI/z6iNnjaD658wdvhHhyArY9t5S+zC4AwK2vZai7uhdSKRWJVWRHV6N+xahLtQTo9vTqhHGf1DUxoYhn4sdLPNMfKNzory8pOViOL6QNxHozd2ezIMV1N8DQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB7285.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:308::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Mon, 16 Mar
 2026 16:28:34 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 16:28:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 16:28:34 +0000
Message-Id: <DH4CK4RKPRF5.14FBDKCWFW5HB@garyguo.net>
Subject: Re: [PATCH v9 5/6] gpu: nova-core: create debugfs root in module
 init
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Gary Guo" <gary@garyguo.net>, <mmaurer@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260316055736.1690546-1-ttabi@nvidia.com>
 <20260316055736.1690546-6-ttabi@nvidia.com>
In-Reply-To: <20260316055736.1690546-6-ttabi@nvidia.com>
X-ClientProxiedBy: LO6P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: 293ada20-2c1d-4474-8ac7-08de837911cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5/TWg/T2HdlW1NMbQUFUY3+xT3wpDe8XIwRyeZpjPhGW5FjRa/jzggLNLOY8ID25h/x0OWgsVaTpuNwAsTtOVC/OHK4XuBRxuRVmc3xQzbaE3psnKzawL+30T4gym96Tbwh7qXdz7bNeSUFwUrR3gBUbt9ZQtnuFebkgL7gGuICr/ZEMHj0t4LpRzXVSP/7VUuO4nmhfQPxutHhwFJTaTNusFrMuohTESetXhBSy13TMZd9foXvYNoZcAk63wLI2KJ5MdEDz5+Fgr7zqqKq7aJoFKDOxwgVTU21AQqk7wr5acOD1iriEvwX2YysQ8k1ElNR1Xdi4TdO0cdrCdIF3nFR8Qiwna8mDnQGQh5+4V6pWUx6FbyQE/baTpxfxGJAy6R41Gfgs6hmcPt2S9czzXcJiHB6WE10klC5yfzlznLjnRuUfFaAHHEc2GDwDUZj90m5e9qP79Wkxd4QU2aCOts7w6nuG5fsMNe9b62UHBOn5jLLL7Pr5BNWu8MnRYUSafOVNc0vhy8rbSLrDo3PWO1YL7tFoW4xKqs3pYFx8MT961+5U0U6SAN1HZhJg5CBRdRRVKlm+Tzw/fsjijwX8n835Mluja9t9FuTsp5F1hCY2bVKzRqrkjjo45aHiS33RnVVxndtuiPeLvlxe2iIz6oo6XxAEZN8ABnD4fEx6fST/MJP+xZ6RGNtGg/0kGSgTQX3Z6txsLSCqFi0YMbkk7uas1vMTEoiOZIxqnk4dqJSXAWtJkSy2MC5uiWzM3f7u0L8lR9s08b7RpZdpINRKvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHpzamhmWmFienBvZCtNamtyTHdUdnNWeTd5WjF3eEc1cVAvUmxNWkxjVXdq?=
 =?utf-8?B?bEtmbDJRNTIwNGNvdDQ0UDhsbXNFcXFzQXQ1a0RHS0g2U1NzSGlsaUpXRTV3?=
 =?utf-8?B?dVk1UUsvajk3ZGI4NDNTK2pQdDZFUFhGbjJZL1FXWElpY2dMcStINkR0b0lR?=
 =?utf-8?B?MDBFNWZwV3dxcmNaeGVNSUk4TE9MYjFDWFhpSUFISXI4KzU5SEVDdmdmeitR?=
 =?utf-8?B?Y2FBSUkxaDgwQTdGT29SWk0xRmVkMUsrOVIzejRRZ1g4SWhqZ2p6czlLNkox?=
 =?utf-8?B?b1BiTXNVb1UrTjVBUEJQSVA4VnJhNXlwVE5XanRnWG1ISGlNVDU2MklnN2Jz?=
 =?utf-8?B?d0VoWi9lL1FqTU9sYnlDSFhPRWk0NElDK283bDY3UTd1THFiN2hWSGRIbWMv?=
 =?utf-8?B?bisreDFUTjU1bVhJeFBTYVkrNTFVZmxkQytKVWU0emFVNk1IbzlnSUpEZlRP?=
 =?utf-8?B?eWhhNHIxaGVTQ3N1dElmOVhUY24xMmdZNHZDNzA3MExoL0N3RlBVMzMxZnpL?=
 =?utf-8?B?YnduNmEzcm9UM1M1WjN4dCt1V2FQQWY1cHZOY01wdHM5ajdhN3JJWGtDY0pW?=
 =?utf-8?B?SThPSEpvWTlwcUlTelkrWWlWK3Z6VDFrQ29GTjRpUWF5QmQrbVByOEVIbmhr?=
 =?utf-8?B?M3F0TWR2Um1MTE9QRzJ0TlAzdXFyL09oUUhzakN3WFFRNWgyY2VuVkJPTlVv?=
 =?utf-8?B?a1pSdnNHOW1GUS9BbDRzcGQzZVJKSm5USjltdXZCMzVYWG93TU9CczFjTFhW?=
 =?utf-8?B?TVFMbnFvNjdiODFrVXpwRThqejYrRXlHMzlVcWMrSGc0MnUxaGdBZFV1K0RI?=
 =?utf-8?B?di9sT3RZbk5EQ2xLSlRuOWh2U0w3YUdIQ0MzeXJuRElrNXhIK1dSUS9tM3RG?=
 =?utf-8?B?N1VTWnVqTC90cDd1c01SNkszM1kwR3NBMjJyZFF5cVpscHoza1pYcXJQSFQ0?=
 =?utf-8?B?SythUVo4eFVsOTJ0VHdENUpFZDhqSVpTdTg1Nng4cExMUXdzck1qd2p4c2tM?=
 =?utf-8?B?UVA1ZkJXdEttd0NWL3VUWjh0ampseVlEQXlDZHI3ZHFrckdQdlRRYng1WDA2?=
 =?utf-8?B?TXVISERhVUJqekxoTG5zeS9NTXlLUmRwTlZyS203SjRudFhuQkFYSzdrbmFi?=
 =?utf-8?B?NnlNSVdFTisrMkc4Y0FOS0ZCSGdDVmVjTkI4WVRvOVlzM2lwMEtTdElvMDQ4?=
 =?utf-8?B?TFFKLy9FdDU0Y2duUXVIMW5SYnVwSDBnSUkyNlVtS1VxM21tQk1ERmFmR3Fn?=
 =?utf-8?B?N3ZueWlJaEVnWENRS3RCbUtQcVhhbU5XT0dZd2pqaW5wN0oxQldVUkVEZ0lo?=
 =?utf-8?B?TWZGbVM2TlNZUjZUYnhLKy9EV09hcC9xU2VpbXU1WGs0Qk1nR2FsZUpybGE3?=
 =?utf-8?B?QXF4elVVMmVub2h4cWlSOTF6SU8rYjlBdzIwd3NPRlE0ZGVmdTN1bzhFU2xL?=
 =?utf-8?B?YWkvRGdSY2NXbFJGTWdpM1VCaWNYTGhvUXlRUEc2ajR4cVFJbk4zU1VvbEZN?=
 =?utf-8?B?TUhzc2F3bVhtL29HaUhxcHNRa0d6aXhWOW9zZitXN2V3bW1nMTQzaG5DSlhw?=
 =?utf-8?B?SjI4ZzhPcE04MDNDaGx2TFN4UHo3eThFZmZwNlRSWWVxTFZFUElKVHo1UUFO?=
 =?utf-8?B?QlhFdnNpWVFrenlYVy8rZWhDU1dieUlHWmMvUFdTRG83MjRybmJnQTRFdzls?=
 =?utf-8?B?amJ0eWJXSGRrS0tacWpYRy9DVXFESmhvamp4bmJBZHgzUnFjdE8wRm1USy9q?=
 =?utf-8?B?Tlhrb0V6TjJqbU1DNVI1dmUwOGt2RWpuZmI2NWNUbTFmR05vU3hKTmxOTjM4?=
 =?utf-8?B?WkcxVHZnbWxsWGphOHNDcHhPSmNUNEJVemhCQ2ZpWG91MUFxblg3dVJxdnVI?=
 =?utf-8?B?QnpEMWlnOXRodUZNczNScklhb2M2YzVhWjNldlZUNHpmNFJtVjMrWW9obDJs?=
 =?utf-8?B?MW43bkN3SGZUMit4d1k3MU1ocEFOZy9KWmZEQWVGTllCYThtRGFzRjQrUDRR?=
 =?utf-8?B?dGdPMWhXblBsRVJrNlQ3aVVyRi83VHN1MVc1YjljZHoyTmFSWHdGSUZaNTg2?=
 =?utf-8?B?ZENwNDArUUNvQWdSYWM1WHZtNFhkRzFJeGhKbUNlb2hUSlJCSy9tdUptcy9r?=
 =?utf-8?B?ZVdoRHBKRDlOSXlIVW1PQjRiWTdFRkVyaHVOd0Z4OHBFVnVHMGlsMlF2QWxG?=
 =?utf-8?B?Zk91MWdGNGZ1ZmFuNGpoMlVycURHMjFYZkVUZEFMZ2hST1U4TzBOMFFDcDJJ?=
 =?utf-8?B?dWM2T1ExaHNTQkdVVUpsMlZ4cE12aGdEc0pNby9sWkNhRURxU1BZN1VWL3pO?=
 =?utf-8?B?bjg4eVhZbER4Q3NZNnkwYTlMaXV0WGQ5NDlLNCtaRjdwRzBtMGxmUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 293ada20-2c1d-4474-8ac7-08de837911cc
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 16:28:34.6802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mhYqjn/gFfIcjjjt6mpWlCBcj9uj2NxBHeJNVGr1QzVpxhwiUMCS929tmPzWgOiuv89O9EyNzjYFmvxo7YvFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7285

On Mon Mar 16, 2026 at 5:57 AM GMT, Timur Tabi wrote:
> Create the 'nova_core' root debugfs entry when the driver loads.
>=20
> Normally, non-const global variables need to be protected by a
> mutex.  Instead, we use unsafe code, as we know the entry is never
> modified after the driver is loaded.  This solves the lifetime
> issue of the mutex guard, which would otherwise have required the
> use of `pin_init_scope`.
>=20
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/nova_core.rs | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

