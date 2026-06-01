Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA74314B63;
	Mon,  1 Jun 2026 04:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780286671; cv=fail; b=A3+o4bUktiUGFp6RnHX8+mqB2A85r2cpgnxgKp1vpos46/YWbtR0e7Er3hWwQ6jcGXF12OFaMcOvZud7f/t0S3LGVtCtAGLE65Okkh9bcN17Hv+R8IdZidWMLCjr5qnHEpCs+QSJhq5fJqOC94BdTIyKW9U6z7ulmiV0xq0tuCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780286671; c=relaxed/simple;
	bh=3x6jS0Lsl4PtbUEz4AiVCIUIS36Mm4Gy327M+gWLCJY=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=YrelQX7i/aARSZL5kWT1GyeyJLM5KWUVkwJx2UuN7CMxobuNMl0oBt8llclY2LUN3L5bucX9WzHdpocOKpg7CDG5jRIWGhW9RQaClv13oin3S8nJdwWHdcrC2+HsDEFhupeECLw2x1mDcWB+BMkLQKCo/TcnwCISxhimPHTQRsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RPjfN8Cm; arc=fail smtp.client-ip=52.101.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RPjfN8Cm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQUffyYavvlvds/xrwJnF+P0rYUo6SvcR6LOiQI9nZ4q3Qkq1fHFhGX6jNPalTOFgrE6qnhL2TsP3ET6wtQ1/nurVNNIf0TFq4cBqZ3YxxHeQyDSBmdl0P26RjtLkqfJ9B/89PBRFT7iXzlVeA/c8sz3m62tU+5mpN5fG3plo7Bz42+q8fp0GyPMC6krafmxD8Q21rnLkQHpaNvI9zwAxDfOiwTuqCeo7/jes3pqm9666OLJPJn2Dd7Zu2+G3/WogY6DUWM/4tf3YKDWKyFm7rWF2+TDV9gJ5G7jpxcbVrjo6PbM6h39d4IW426MdhOLM/y5vCOl3VUcVqRds/gizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3x6jS0Lsl4PtbUEz4AiVCIUIS36Mm4Gy327M+gWLCJY=;
 b=aPW6+XumKfo6Tu+XB1RXMbWDS6/T3x+FsmQIuk/xvw2vh8j7cLeREejQNvH5P8Xwa+HREyjnDEcpHhWKC2m2Qj6VyR23bjHV/n0e5gVOzUzTemhtOqd4OAzht2Hsbj82m/8GSi3LGGIJ4w3gMeFToDK36AMasTIFzwGPoRg2W6zLSwu/S65SNTKahdzJiixcSIqkvi5hrZUwPoH95E1Cyg2ZwbjD37W4DrtoYF3QDzWhq/Hk3e9HWt15BYOn5tau2voglhe472kN6MlrZuh/b19NOXGWI6b7EUAS8OZLY9+CwZaCZHVpnt94EZyB+m8Az3bN63aiSKAiDnPOu6XuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3x6jS0Lsl4PtbUEz4AiVCIUIS36Mm4Gy327M+gWLCJY=;
 b=RPjfN8CmBj3YOkVdG2/9pWIww6xRlZV2o323huDT6lg2Mo/ZJjhNlhVQtrfGPNFeszQu3dzT/Kg+02mHR13aWe8p6XsFzf+VWz/i5y6UQ3i86ACfBwq6NvcOrgor9ZcXMW4xRflb07El0DMUctAoabVPD35ufKR7B+wQOwpKTH7u18/5dYpMM+A2yY42fHEAZM121nREP6MgC/uxjm0jAYqG8IK8Vwu63dt4VM+Gt7pvxuUuGYjVT6D7tLmY+N3IzaJfysamz96o0x4ImwoEvwheeqyk3pV3Pqc55SALB8eVHqcAO5SplzLCmdY6jlPBiSOTGIxVg0/xtrJQHF60/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 04:04:24 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 04:04:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 13:04:19 +0900
Message-Id: <DIXEY8Z7ZA5E.1R29SIDJ3MS37@nvidia.com>
Subject: Re: [PATCH v11 02/22] gpu: nova-core: Hopper/Blackwell: new
 location for PCI config mirror
From: "Eliot Courtney" <ecourtney@nvidia.com>
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
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-3-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-3-jhubbard@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::18) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa5299e-18b8-47a8-11a1-08debf92dd95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SenmVy+28Put4nkM9iz4kedMOd6dLbfQygWXTViXljKbnocP940I2u1Z5oz41u/FDarBLBbj0jszLZ8IDiXI2zmqUWU4wQwHUPDUbn2wHIsTjlXLyssv35eNvoIE6VcHtFS/rNO/3+XqsDouYIQsQAlOJDfS9wZ+5z3mSd37IvXMSiZmFOQNFOFuEGcSukfyl0GzWYcBp4D0I8zvfeVLTDmIKgFHVHp/IQrEnwImN10HRZldWmOA3m3OTcBaPOnCcdT5e1nk4rBExc9DD35ZrAoSM6/TwOAjdiBxpxyXIjx19ZwaO9FFFITrXmitAkKTijWaNLCjLuqgx7o6yF1Qx8fYKBXe+BMg7sZOpFe5sz+9JDbmtQHfPj7jwFPXax1qDWKjIU4lREMgzc9NV7Y4R9SziP3JlXGiRh4JhzijrG42bqrCilCl5wkmSkH6xn+ur0FTCdfSphKaKRvHRwQa/++KwyNWg7bSnk0ekIOB/0CtdYI0o+gSmLCcbl/G9s9+x2C6wUdBLzUvLSxM1C9KS7HYgPENhFVd1aOB4mj8lzcXXqV4p7Rg2Dy7rdRBDh+zX8I6ApHD7mxQup2F0gPn2U875Rnl7/sagUe8x8ZH4pdvbWOEI2b/lSPh+RuvgpUmFHJvwUVT6rFPPHcKdbrm0NQnvW9NZREuk5HCX9EPk69dvXsPO/44sPsGExQabRDU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkNZMjAwRTA4Yy9qSUQ2RldyV2dyNG02V2RzbkU5YzR5QlRva0pIRWRoQkFo?=
 =?utf-8?B?b2grR2NoTHVSTkloaFpIaDA5eDIwUTQ5cERHSm5kbnI2aFlMVmNvTDJQV2xn?=
 =?utf-8?B?QnVOU2lKdnBleTZYaG85NlQwWkRlbG0wOC9YcVhmU29McnFib1Fld1Y1bUdD?=
 =?utf-8?B?RmZZeWFXdWVIU0FNWDlna1M2ckk4WWZUTm9TVCtGS1ZnOHN1ZHNrQ1VrZDZY?=
 =?utf-8?B?ZTdHZ2E0aUtLN0U4OWVKQmtpQVBIc2pjNytwcm9jdzZDVzJaajhVT0lGR2Zy?=
 =?utf-8?B?R2pyQ2FUbnBaZU9haUYxUTkyU00xNTMzeGRMOWZBQTVuaGs2eGZ2ajNZRVh0?=
 =?utf-8?B?eEgxR1ZwVmpmYlhsSWN2aWx5aEY5ZnNzbWY5c0VpZWxCZ0tZTE5GanFJeFd1?=
 =?utf-8?B?VkhoTHdzQkU5WVRveThTZmxJK1lWVzNQQ3NXY2RQSmUyeExQMWd4RnZOMnNJ?=
 =?utf-8?B?YXRSU1FEK3lodnVwMjV2aE5QeGNSbTlFaWdZWXNLRGtWTXdPTDU4ZHM4VkJR?=
 =?utf-8?B?aGJCZHFHTDBNaWhIZGJkcmplVmV2RDlYeTNaenZPM0dIUVdYaUpaamdJMW15?=
 =?utf-8?B?NFVKZUJscktIakhodUR5aTBMcmxZUStyTWVjeG9TbnhSamZiSzRkRHFXK09t?=
 =?utf-8?B?bDJOV0hPMnQrM2NmTFhoWEN6YVNVbU11SnVsSkFHSzFZYWdpRkhZVmJoWDZt?=
 =?utf-8?B?YkdOUDQwWUtBZm8wZnVJOUk3VmZzSWdCVVZDekRmV2g2RjBDMW5BcVBhQko2?=
 =?utf-8?B?VWs4bXEzU0FUSzJJZzJjbW1tcmJHc1cxOHpXTGhGbm1URGxVMnVRYlplWEJx?=
 =?utf-8?B?Q29STytNbU5CdFlLWlFLUUNFbTRPNjI5a2RBTXZxZ1AxYTdTWDV6YWQzLzJv?=
 =?utf-8?B?c2pmNGhFL3IvRU5jODJ0VnJhbm1NNG9oRUtkWkJUT0RxTnNsMWxxdzNWMEVP?=
 =?utf-8?B?WW5ZWFlLQXdISVNWb0NMZkpOc3J1ckIxc1RubzNNLzJDc2hmM3Y4MC85S25z?=
 =?utf-8?B?RGZ0TXU5eDlUaUZFRmdMTUwxYkZnUWFFdkJ1UHVkUmpOR3dhVVFzckhhU3dx?=
 =?utf-8?B?WmFuOGtNazYzc2dVTHVKRWlGVGJ5NjZXK2p1b2VWVjFlZHFVMXhLMEJkeFd0?=
 =?utf-8?B?ZHpRUmVhQjE0UTNobkpRK1pQaWlydDl3T2pBRnZpMHhQSWlpYUNaTlR1Ri9q?=
 =?utf-8?B?SlAzRzFzcWxJczVtWTRFOGFSdXVtQzJmOFZEOEV5bFpsUGgxMWdoMTRmR3RM?=
 =?utf-8?B?Mkx4akt0R3JhSEJZTENiV3NSWFA4NzY5cEZwWWU0MDY1MFlwMXNEejNWREIv?=
 =?utf-8?B?azQ5cWl2djh5Vms4R1VWVmNiQjlrRGpwcDNtdSt2ZFlFeUw4bE1RSlFtazJP?=
 =?utf-8?B?RmtQVVdZNnJOVDMrSC9BNWdMZ2M2aXIvVUhpUG8xcUJxN3J4UlNjYnk2TW9I?=
 =?utf-8?B?c1JPWHVRRWdNNUNMYTZUZTBoUERJaE1kMVhORFRkZDRXd2hjRWhSMHZYRUkz?=
 =?utf-8?B?cFR5eDdveDVyNEs2NXBlall1ZDF3YW51b1dFOXZHRGJDSmhLTW9XREhrdmhS?=
 =?utf-8?B?SzZQRWNtMytZVm03UW5zOXZuNS9EM2o2MkhENWY0bjN1Tzh4YW9xYkxMWFgy?=
 =?utf-8?B?Vi9iUU5FbkJRS05lWXNHUkJEUDYvTEVMRkhsUFhncWk2T2VRa25lUmZQN1Qz?=
 =?utf-8?B?Nyt0NldONVBRblNpVDkwUnNHYmY3MGl4L095Z3ozMXhRalZVVExJT3hBVXo3?=
 =?utf-8?B?MGhPTUxFWVBRbjF2K29FTjMraktlbXVFWjVqQ2l0YSt3WWlRbUsreFNNT3dx?=
 =?utf-8?B?UENrSzZVSGkxSnJkSGR6VG4wTVpUeUFENSsyRElHRlFONTBRSlVaMEVxaHVj?=
 =?utf-8?B?aTJLTExJS0R0VnhMSVoyM3dleTZWMU9lVU83Tys0NWg0TXluSEtlWjZMNnpN?=
 =?utf-8?B?RW40TFpNQThCZm5MTndHeDhONmpjRHlTclFNZFpPMTUrMnFyT1V3MGk0bWlD?=
 =?utf-8?B?WUZKNkVPMTRaMXZwVk9PMldFY3h4WlZhbkUvYVd3U3VUV1VyYTNibDNSWlhT?=
 =?utf-8?B?UXVQNjRoblI3SVF3NnhmMTJIOVB4L2xSbXpST3JRb0pQY2dIUFIwTHRldFhP?=
 =?utf-8?B?eHZyRHg0dWRubkliM1lTbDRzUm1LdStBRGJBWjQ3Y3gvdVJLTEZJOVF0VFMv?=
 =?utf-8?B?ZytBbGpadkdRQWp1NDVXS29CSHFsenJWQ09STkk2Ymh1MnI3STYzMGl0ZFJ5?=
 =?utf-8?B?VXpHUzlCUkE4ckxqeEwybEdPZ0xkYmZSa003QjFnTjNUZUVEU0RZVXNtK2w2?=
 =?utf-8?B?TlFKTnR1SGR5azBOK0Vhdi8wNjdxdXFkWHZ0UkRRQm1CRlJRZGZTRXBUdCtk?=
 =?utf-8?Q?RtJSIYpIX78VpXNpEIAEu+TagOSuUZ1FJ4D2HX18ohw3T?=
X-MS-Exchange-AntiSpam-MessageData-1: UtT+IS8p27FA3Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa5299e-18b8-47a8-11a1-08debf92dd95
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 04:04:23.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsyWlusxdNTOsK05Biy+Cuc6JU18lUgCstMZ71OTJrPsuv7jqUJyVcdWj2QqlhOENQUoYlgXHalOr7y7DP9a/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> Hopper and Blackwell GPUs moved the PCI config space mirror from
> 0x088000 to 0x092000. Select the correct address per architecture
> when building the GSP system info command.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
