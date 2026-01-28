Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010023.outbound.protection.outlook.com [40.93.198.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE742BD5B4;
	Wed, 28 Jan 2026 02:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567868; cv=fail; b=d45PRkyIHQ41MztvRx4RUdXGeL2xLIFe7KE4KAacFt1VFmU06yaEoXSO8UWmWgUajJLMUH5p8dayli25LqNKbbGJkGJzrCJT6dVTJFLBOT8gGYspJYJAcWF9O2++Ikq14hZDaE+xxte2HfEttBNSR2y7YuhQfb3uOOaXwF3hZug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567868; c=relaxed/simple;
	bh=gMwZJcZwnz+Dwmq6yPXR4f62Bn02pJRf7vCz9aclv9c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BeU20tRp+I/YekCL2JRgtMu4Hl46+R/4XMt43TDZn/y0qDSPyovpXK9E3omjOTQp7HLg3jJEo35P4D5IgdKCrk9w464GgLKcDG74EamaTS83S4iVGudRu1LqXXSSGfOzo793l/u5X1s6etEN7cuFukXiZSZjZ/cK860r5ns6nqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XW8GglUA; arc=fail smtp.client-ip=40.93.198.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XW8GglUA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cc1lw2Kj+vP7fpWIWGXn8DXEGRqNmjkx4oe5A9t/n0wo1I0nRRdHYyRY76v1ucS9X7PIlYk94UEaeh9MCoT69SQfSRtuAHxHKKwMPJbZuOw0XLpoqkAhNgE3RBAtxVhWenYzsQaTvnF8NHCUXvCSelo7wigtRWbEiBtZBJKm0aYpouCjxm8AsyK5wulzbMV28Kl0rrJUcXLXCiQjnvHPLPYL0v/F+DLSNoWFpi0AQJYObXV2nexk6a722SpDOoXpFWVRhZAbVjdBZgtToSn6Q7iacF8u7Iy0QNe0sEPgD0tcFlFr0XUZBJm1OhV38vRNyXVP06hTvUz4yhhsoUx/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5i8MM7XGusRzleGPGBqvmgJJGtc5boefXrw/KDKRlPQ=;
 b=GTgHQ/gUpKRfDqyReuOtfbZ4usDV4jNVFq68r34DB9rsbY69nJBb3wVnQk9wleBPKw+6Lu6Wol3nNd2vIruHc37TM/JzQnvB//uix6BZFAOwLYtlDnLDNsekwjV5trGvbagZCesH0fyMAdkk0ytpPqkKTet9ZOItDZOdgZqgKKLcPpyjsh7Qs76r/6suNiiTRq7MQY5m7Avyk1vRwHZeXwIpYCzvl/ItRi178uabWe4guIJd6hPMY6xupfDsOvVwd7IWJ4E9bpJQSyhYhPO37l7ZbZL8zsHiXwqXpsAd5L1Eum9pYlnZAG+3Ijg8dEo4PuRpWsNrTy9jMCZlg0s7Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5i8MM7XGusRzleGPGBqvmgJJGtc5boefXrw/KDKRlPQ=;
 b=XW8GglUAZ36yaNjhUKwy0tftCnTdKGWWQkPVsrhp4n1o1GOoOWAZxpmN907xL4JRYwOMioZQpecWOKwG6tFP/S0DkKaIcbUzdrRn7tqEXlhaPmFUZuNh2oeX+mucmEKgg254Qiadi3EbSXT60PdJa0Gp5tciLiWTFf6udSaZXZLFOVu60Ri1kIeF1696wFdU0LAPjo8eGj27mvUag4xYFbI/ZYkyqbBHKEnHwRPqmzGR1fBkGPpljMWwFfu0/MpCcW3ehB+AJUVj5cYshdwtoSmZIgVBvHKPn6+lA8x40ulZGMHbIkCCZAjblrxzXmVJDLDC8E58ZsIi8FK1gNB/Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5654.namprd12.prod.outlook.com (2603:10b6:510:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 02:37:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 02:37:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 28 Jan 2026 11:37:28 +0900
Subject: [PATCH v4 2/7] rust: num: add `shr` and `shl` methods to `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-register-v4-2-aee3a33d9649@nvidia.com>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
In-Reply-To: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0003.jpnprd01.prod.outlook.com (2603:1096:405::15)
 To CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: ee098fbd-11ee-4dff-c002-08de5e16364f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkNaT21jTGRlcEFxRnZ2NUtDN3d4OEFsUjJtcXR3WndrcExDTW5vUVVaMzlL?=
 =?utf-8?B?RWNJNmZFcFhHK0lDNzNlNmRJa2NqRitxblU4ZDZiUWlncVNHQ0ZqZ0lwQUR3?=
 =?utf-8?B?Q3M4cnZZMzRrMUpZTFhDd25iTzljbmg5dEdUY2c5bjNnSmJGUWhrL1JBOFFL?=
 =?utf-8?B?b2pFdlI5T2d0WHcyUXRkRldReW00QUV1MW1jeEQzTGtsZy83dUd3VzJHVU5I?=
 =?utf-8?B?OWhaME9uclVZdjJLT25GWTRqYXVGaStLdldxMXpuOEFURlAxU2NWT1ZlUzZw?=
 =?utf-8?B?RWc1MVl6djlXWTlMeDVaS0pyU0MrR0xVbHRCNDJTQlJUaVdrSzZOMVp5akVL?=
 =?utf-8?B?dTJIVEp1M1dJZnlVRXlWc1JlRnZiTDhqVldTbVR4Z2dnbWowdUVnU1pxWEFC?=
 =?utf-8?B?bzFRN0FDb2xTTnd4bGpLRkdlMXpkNmwrODNLMHorZlJRTXdCaCs4R283ZTVG?=
 =?utf-8?B?d3RyTkZkb2dpTWhFZGZ6Y1hlWHhpaFN3cS9VaUpoZi80ZVF1WGNtMUJDNUg5?=
 =?utf-8?B?cGROL3dLdk4vVkhvc3pVbnc2R1RYcHczRXFBeGFnOStDcEhNRUVtcU94MHdt?=
 =?utf-8?B?bm9KYlM2YU01K3VDMGpWZWdwaklUTGkxSk8rbGhVVGgxYUc5SzU5OUdJYmtW?=
 =?utf-8?B?MTBSenhKVHF1NTdWTXk3L29NRzBZNE44VXZDb1JYVnFycUxmMC9GamQ4TzR1?=
 =?utf-8?B?bGxmbXJDNGMvZWhKa3VRbVJ4ZG5xR0paMThqUGttTUZuVXJhWUJnUTJEOERi?=
 =?utf-8?B?cEZQK056Z3pzeXFQUXNYYUxGUUdEUUlyT2p4M3VpVHhJSkxzTHVYcGhmMEVp?=
 =?utf-8?B?ZGpQMjluKzhsYUhFTUptV29Qay95V1V2OXlTOFdSZ0d4bWpSMC9Xc3c4QU42?=
 =?utf-8?B?WnJCMDNNUjZRZWM5QWxFeEllM1pBUHdtWHBTSkRTK1VyRFMxS1duSzh1NS8x?=
 =?utf-8?B?bjRLSU8yYWtpUHozUThCcGx1QUNBYjhjRlhEYmtBcC93SVRQbUM0SEdDM29m?=
 =?utf-8?B?WUp1Q3crczg5N1dEdUFJYTE1Mm9NVCtrdDJrRTVLSGJSRG82MHduRVM5eFZL?=
 =?utf-8?B?QlhSc0tKV05lYXJHM09QaCtnYnFjM2Y3TGx0NXJNVEo4RlRHdVdSK3psbHM2?=
 =?utf-8?B?aXZxalAyT1RJZWRzYUJKMVpuQlBXdUpINXAveFB0eGZmblNYcURxcDVHZm0z?=
 =?utf-8?B?b1g2Yjd1YSsvSlBFT1BPOGMwOWtSQXYwNUc2ME5HUmxNRmprd3RtaVFOaE10?=
 =?utf-8?B?WWFJaVpWczJ5QlpnZnM2U0pmaWp6TnRLaWxlRk1KcnJMMFZnbWNTdkY3d2M5?=
 =?utf-8?B?Q3RYbGRJYjZOdmNCSERVQVhKSDdWNlF2L1JqYy91K0htTk5MaUJtYTZ4RGxN?=
 =?utf-8?B?NXRuUGJFOTh5S2JHYlkwam9UdUg0Mi9NZUVGK1Z3QTB5dU5IVXBuSEZrbUU3?=
 =?utf-8?B?SVlzdWl3REJzQ09uTHIwakNnYlIvVGRKWTQ5aFlyMW0wMkJMbEk0dXkzbk1u?=
 =?utf-8?B?eFNPL0RDcitjdFIyQTZxREFnRFlnYy82L1JoT3BvR2orVUM3NWtLNFNLclFp?=
 =?utf-8?B?dkExRnVKUE5PeTJaMWRuMjZiK2lHc25JQ1hZMGszUU03Z0VIeld0RnJYZE5D?=
 =?utf-8?B?NEdUWGNIWlNDMnRTRUdSOHFGSGRwQk1oUTVmdUNlREFkYlFkSXBvMFR5VHRM?=
 =?utf-8?B?SlloOE1wZGppak9XRjR2YXl5bDJ1SXJwNjI1MmkzODJaVFVZYlZUN21wZnNx?=
 =?utf-8?B?ekVTdmFCdXh6cEU2UEZ5Y2JzczhIVGNKTXpZMXVjU0NlaE1vSHI1cTh2citQ?=
 =?utf-8?B?ZGhVditKYkdSRDc4dHhKTlhrem80S0hiNVN2YlQ4NnYwWmhKdmt3L0d0ZEV2?=
 =?utf-8?B?V2ZkR2MxZFNzaTQ2aEY4OUhEY1ZZOS9mUzN3VWN1ZWNwV0dMbmlmN0JFblZa?=
 =?utf-8?B?MUdtcTNERm9ZOE1oTnNOZjJtenFIYms3QTVjdHJ2RWtma1pBRkhzWU5FbSs2?=
 =?utf-8?B?d3F0bGFjYjlGeFBtMHd0VDFWczRWbG1pSVZrQVFmVzdzK1VtNm53RFRDcVFN?=
 =?utf-8?B?ZkQyQkM4dkFERlg5S1F0YURpMWs3SzQreVZZdU5yYnMxQi9BeXJUUUxMZS90?=
 =?utf-8?B?UHBtdDdWWStwU0NBMnlpRklCblVPVzhXUDVPVEhadmxuNlMxR2Q2ZDZJR242?=
 =?utf-8?B?aXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnovWmtuaWNjK0NGdjBYREJ3VXNxaTQwQlg2OHZYOG5xWG92WWpBNFltMWFC?=
 =?utf-8?B?Z245Mm5LbUlJblFSeUpsaWc5S0tLUlk5SEFQcEtscmtGSFhDUHVtTWVUQ2gy?=
 =?utf-8?B?VTRHbzlOeGJ3bWtTemY3TkoyZ05DY3B0L0dQQzVyOFVBR1J3WFlEemZlQjA2?=
 =?utf-8?B?Z0lDUFZOM2l3SkllMXVaWlNVaFFQNjEwb1c5dnE4LzRVNjN6cDNzTnNYNmxy?=
 =?utf-8?B?YXo0bHAyUDNMWWRteTFmL1YzY0J3VTdDbWJlaE1FK0piYW5uTlVTdlFZZERl?=
 =?utf-8?B?UTZWeGV6ekZyWVlpREFpOGJoVDBnMWE1V0NlRGJUb2d6c2tiVTVkb2ZRQWFq?=
 =?utf-8?B?SEpRUTFTQWVQWW9ibnkzdzNqeE5iOVdXVWVpME1hcytHNFp3R0JpaVM4Z2dq?=
 =?utf-8?B?Q1h0U0N5T05BMjFaUFhSb0dRYjBFZDVvSDJkUThSWUlUOU95dTUwNGw5L3hz?=
 =?utf-8?B?cGdJaWJLNGtEUjlKZzZLMEdablR0VGRCL1hxT3JqTXIxcHhzNXRQRTZTYzE5?=
 =?utf-8?B?WDZmZnBJbnV0U1orODU2Q2ZpRlI1dUZUMEVvL3hpdkpWVnp4dkZ1R3V6Umkv?=
 =?utf-8?B?cTYxOGJPN29CNHNrM0U5b0NUWVlJZlpqQWxrUVFPalgwV2FxalkvZ21PQlBD?=
 =?utf-8?B?K2psTTJNZCtGTVNDaDlvaWdnRXg5TjYrR1E0bWRDOTNkT2Z3N04zdUR1cWJN?=
 =?utf-8?B?Y1hvU1Bubm9wOFVZWHNtaHB6Ly9yT3BWNnQ3SFRpQlVkZTd1MzI3ZWpDL2Ux?=
 =?utf-8?B?dzUyU2dEY1plYjFMc3ltSndRQXIvaTFSNXFNU2dmZzl5Nkdvd0NWakt3SFRO?=
 =?utf-8?B?WFROelVJTEFtR3JtYXFWSXBJSDQwUWJGSW5OTjlKZVJGb3d0RitzczdMelMv?=
 =?utf-8?B?dUwrV3hKYi9XVS83VlV4NjlZUU5FTG1ZUGFrcGxjblhQRlBEdXh4QWR5SXlR?=
 =?utf-8?B?VThrRm9HK01scGxoRUNDWHAxYzlVVXBxVG5Ja01nRlhjVmZDZ0h6MlBUTTdG?=
 =?utf-8?B?UHZpRWVDZGN2cTZUb0ZZSjN3NVMxdmJUKzZzZHp0am1KdnJPZEN0ZHNCV00v?=
 =?utf-8?B?ekdOMFZyNGVOd0lVclArZHh6YkdSVGRIb2U2S2dvVUhhMXJkTU1abzI5NGlx?=
 =?utf-8?B?NUpCMW82M2pGNDRYZFVTUFdRQmxaR3RGWFBpM0hOUmpmREhPaWJ1NW8rUmc3?=
 =?utf-8?B?QURJL0Zrekd3Z0EwUU5nOTEySVBvSFhHUFBlakg4WVhFNG5wdUs0dEpXbjZR?=
 =?utf-8?B?U1FRL3JnMU5CWFErSFlQaXRudmxMbmlmY3dnS29YQ2dqL2RtNmRMaVYxWEhH?=
 =?utf-8?B?S0RGcEE0WW1FUHQ3bi8rUXVkLzc1NGtJUjRYMyt1S2FRRkl0YTZxeHd2ZGNt?=
 =?utf-8?B?bDY4RW5yVVBUelFyZ3FQcFNJbjNkTkNxUnlsZ3RISEkwaUMrUmZEZmFLNDF2?=
 =?utf-8?B?T2N6VGNEczliTkc1bHI2MnMxMFZaaUVFM1JiN0FndU1tQnZscG02T3BzQTFB?=
 =?utf-8?B?UXlnRm81MURYeGRPU1lMSVduN1R4S0RGN21DM29uYUsvdHlRMU9lQ0lWUTd1?=
 =?utf-8?B?bEk5TjFFWDVHYXJsTm8wQlQzVjhhMWU5Z3psc2Z6b0liSXpPalhLN1V1Z2hG?=
 =?utf-8?B?VitOUnRlQVlrUXNUbGVhVzByVzVlZHFYQlR2NWMyc3RINXhSOG80L21TKzB2?=
 =?utf-8?B?anYvZzl6UkRFQUMwTlozRllGT0s3ZHZUdkltOVJMT3Y4aFhEQVd4K3dLTVZ0?=
 =?utf-8?B?MjM3RFE0Q0szVzRBZjZpUVdndS8wUXlvWG1CU0RocnVqVlFWR2g5YmEwaHZZ?=
 =?utf-8?B?aEEraHBkNGZFb0pWK2FYRzBOaGxzWHZ4Ti80M3BxWnN1VEpJTDMzelJseGND?=
 =?utf-8?B?RzlsQkxoL1Q0QWRCMDNwMklTbysrWTNGVkhSdDUwNThXa1NEdHBjVWcrbkV3?=
 =?utf-8?B?Qy9uYmZVd0VDSVFTaDBVeUpLVE53bDZHL2Jmd2ZnZ0tSY2NwWUhwZExzR05r?=
 =?utf-8?B?eVhiZXRHM1o4emhnZDdCMjlFYnNnckRsZitLdi95aXYxMWkxMzhiaE9CTjFp?=
 =?utf-8?B?aHZhcnRYT21Ia3RmSHlDYVFYRGdhdUZzbEdXQW1oT1VTMGx1c3lhdHRZdWIx?=
 =?utf-8?B?c1hRTzlZNVIyQWdpWVk1NEpETnQ0MzZuRTlqQmJoVVovSllUd0h0cXhhdWU2?=
 =?utf-8?B?dVZBaEtqUGhPbkhubVJXUGlza3pZWDJxTUpJc0NsanVjT2M2b21KUHVyMGRP?=
 =?utf-8?B?RW9SNDRlbWdpbU9rL2FrQTA1bkhaTko4UXd6VDVjcUMyNE1rekVqWk5PZEYx?=
 =?utf-8?B?RWNTbEJLczZlWFFJOERZY3h4M1IzNjhmb01hdmIzdFEzZlgraHpWcTgxaGlB?=
 =?utf-8?Q?DmBM7MiA3cHaK8WgYsyUMFofBcREEBPYlcKrts0dDoDeK?=
X-MS-Exchange-AntiSpam-MessageData-1: fGGmUttQ2mhgUw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee098fbd-11ee-4dff-c002-08de5e16364f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 02:37:42.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTaBiwBVYajaGYnncTv/zS0+isNWIdNLaWgRbbOhU5jMWQoG3mv4mCVtfkjup0kBxMeFPuEeZSaafkhZ0fRtfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5654

Shifting a `Bounded` left or right changes the number of bits required
to represent the value. Add methods that perform the shift and return a
`Bounded` with the appropriately adjusted bit width.

These methods are particularly useful for bitfield extraction.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index f870080af8ac..4b929762d5c2 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -470,6 +470,48 @@ pub fn cast<U>(self) -> Bounded<U, N>
         // `N` bits, and with the same signedness.
         Bounded::__new(value)
     }
+
+    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N - SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 16>::new::<0xff00>();
+    /// let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff);
+    /// ```
+    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES >= N - SHIFT) }
+
+        // SAFETY: We shift the value right by `SHIFT`, reducing the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES == N - SHIFT`.
+        unsafe { Bounded::__new(self.0 >> SHIFT) }
+    }
+
+    /// Left-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N + SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 8>::new::<0xff>();
+    /// let v_shifted: Bounded::<u32, 16> = v.shl::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff00);
+    /// ```
+    pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES >= N + SHIFT) }
+
+        // SAFETY: We shift the value left by `SHIFT`, augmenting the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES == N + SHIFT`.
+        unsafe { Bounded::__new(self.0 << SHIFT) }
+    }
 }
 
 impl<T, const N: u32> Deref for Bounded<T, N>

-- 
2.52.0

