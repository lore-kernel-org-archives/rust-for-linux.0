Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825C52F691D;
	Mon,  1 Jun 2026 07:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300052; cv=fail; b=fGxWePnpTGhMiN+CbqrirmT3/G+M/ez5Yg0HXrhZ3+zjAujqFrfF2axY53ZKtxTs5gLS1roO86untX2oWxIjzDvEGrlMS2IzY/zHkjJCPHi44pL5T4rQ9NFurnBMWkSmgGMzDhAFRm8oJfO1R2ZIJ1CVdQRDdUI16PcHKDHK+sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300052; c=relaxed/simple;
	bh=Oa5oAbCYTxrAc3EPA2OfITGZA0fxsOPfB8SPzw03ydY=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=eHZWJDsYrlJf1jyjxZmEWNYWW71InPEzqkOcJPUtowzkmBJYopbNxpllSGP1vh/GNxhSMZsbFCavx3dRwt30IxS9WjUVTZbCouRS9glsNYGF7MzzaZ/89DoS2irvETbBLTay5JSi+QABOCqeCSvVSDX6cef4A5shOZM7cfQaq9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XEBw6Q6x; arc=fail smtp.client-ip=52.101.53.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XEBw6Q6x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzE+e6X4js7u8CTPEAgipKvVW9djI+2up1Xuczu3z0VVh/Xvi47lb9SRVUR2eSpLXiigkITpfy2zaWo/+lrHAnXP/bRsR/crCsxVKKfS0fT2BN57Z7a1SKit8kmShAG6ZxZxCBmIywAH+IUm/3phENJvbUSraaqSq4IgNa3PF1yP9WpKYktCYh4MVwDUy7A8VAaAJzytXnrl4qgxI5JG2mZ6mtMyUou9fI1Dp9ewespq1eAqHF4irFnPolMSsFbIIQzLwbF3YX/mWW/wnqs3zb+0ikyBd7tSahQuLALdr/ugRDpEd5AbDucbbsWNlDwDWm8M4t+VOX556U83ckiT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oa5oAbCYTxrAc3EPA2OfITGZA0fxsOPfB8SPzw03ydY=;
 b=P0LQJKZIm8r4dR2TSqHsmSHJtm2yzvxpxNh9ZOwiBdsES9dxWSujhJbnRdTE2XVbUCjK1tg9am3+GQ1J38VgdD6zJdUsTf3wxrcr8Dblxpy/tKMTLxgas9NE+VzBM725ntJIcz2sYOJG+WwoBl+YvMghc3mzDDDFaIjxopyUt3Asai0egxYKrkNTIxsRnt4Wc5GeynJBjqMcO38JXndmnWYoisA3sIjxuII/YojJBfI45PH0AE/VSOguiMn5bUcVl3qD7olz+EMOUTYQfYs7n2Gq6G9Tx+2F4mX/IhrealXzExN6E+LUtJbAuziXn+XrvRb61RvCyx/92xMjRdezUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa5oAbCYTxrAc3EPA2OfITGZA0fxsOPfB8SPzw03ydY=;
 b=XEBw6Q6xUH5DPLtud1guOSzrh/4fmrY08RpJPEKRdoBoesBHVidd+c4c/4AetxOatLsmKOsipVlUB8JI12WwAyTnLw0b2p+sNSL0sxyJIm8SbQlM3HO7zT3QlSuC8xK5f/n8HjApWQnV7JQ1opI4peXPD76BhbDn9b6GoZo4YnUjDGn0sYpihlFytnqtkuNFWVf4Tt4c0Yu+LuPfArXbfgKOjp/f81MbtjoY2905jNOkgyAMpftOoHEQ5r2vzPlsE90y5ZUWnL7wO8qMF42zkhazRd36CsxmB7DsutJOQgWQiGSeBsSVDI51sS8nHk7/AqBLyihbElRfBD3x6ok9jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH3PR12MB7524.namprd12.prod.outlook.com (2603:10b6:610:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 07:47:25 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 07:47:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 16:47:20 +0900
Message-Id: <DIXJP01RAUZB.14ICYEZ1A7J9W@nvidia.com>
Subject: Re: [PATCH v11 10/22] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon engine stub
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
 <20260530030953.740561-11-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-11-jhubbard@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH3PR12MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: 4635d833-c427-48b1-6982-08debfb20529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|376014|1800799024|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	2GcTBcr9spvLWraDHK9smpH4rru5zN5gC7SJfHyW3f9za8Im6XTyu0iH3KRFtkXBtJrNYpuR0mveJXR0VWleSM7M2t9dZGuJxsnLyaxZlgcB2sMDKNtxv7pgaoGdspWE/5270sHXF2oaPC3mXmv7eF2mxgv7n797VmEptqo/XrDaS0oHdgPW/VI5fQIbsLHy8BhvF8j3sPW2Rzv0ofWEWlOAuQC0qwSvo1PTjEc8XYE9zNfgCPXpEb1gwUbHM07+dB1ciAK3/+3Jff/YmuYTBfrrkQKUT8efQpDRh1FhRjaVBlU4UB1+hQWAskfKFRzcLm8sAwXsxWFC95DXOd92Rhr+ojWqWmvIu0w+ML3C8f1f1Qt1PQ1j+/tymSbCErLiavcAWNr/5vVTCg55RXOTY5o6RW4ZUvz++/ZKwzN+xY8/Vwu34QRimvhrfS1ADPHIBvl5DpyPt2sQgqofjMyPj37dxIuDy6K0g3374kCdPTVnYEhszu+7XOUSwgF/oiLCX+kmYbcNQik0NvAxb8uJqxvxJecGrXxbYa/UmfYBfkScqkOXLgWfi0KweJKn4PKyONkdaB3mmjCmmnn1mgUvtOvn27OuTvhfROyMXCKb/+UWRyKMQuNo/of6l7yFVoPp2Q7dSZPg8+G//qlU1iAxA7Up3yR/RfRHmf70LaJcOJyUMb5nK8OGQbQ8nxccD2Ej
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXNGK200RjBFNGhUbk5sZXB5dzhSU3V0ZDdXWWtsTTZTRTkxamNvWk5MTDQ4?=
 =?utf-8?B?T3l0a0V5L3FXanYrSjJaOFgwc2QySlAzaUhSZWVJNjZQYy9YZm5pTEtTRlBP?=
 =?utf-8?B?NHdyaDdsNFUwblYxUHBRTjVMQWF6Yks3a2djalg3T3BGZWdybVB0bmxWdytJ?=
 =?utf-8?B?MzEweHAvRE5Zb082RlNSU2RMZVZFMEM3Qi9MMFFSME9ZcEZ1WkVCeE0xNGRW?=
 =?utf-8?B?UDR5SXBVV1N3YmpPTTdYUExDd2NVR211Mmt2ZjhtUEwxTzJTZHlpZmEzbS9p?=
 =?utf-8?B?bnN4ZWlKWG9TcUhneTZNSmVnVTJiVlFQL3dNaWlRUlJvNk10VWI3N244Wk4y?=
 =?utf-8?B?Z3VrS3R6dURLWS9wWWlHbDFHQTNvT0pjTFZ6TVBvTGZvcUlrR2lWVENONnFD?=
 =?utf-8?B?UXpubmFjU2FrTUVZRVNTbWMydG81aHlIYnNNdS9MZXZNRjE2NWgwazQwRW5H?=
 =?utf-8?B?a3g1MEhuNlBkbXZqWnBjQ3BMcVdJNzN2OWFsQUt5L1FFNWNVZDBCREZZQkd3?=
 =?utf-8?B?SUt1UjV4U2p1amo3d1JZOXY4Ri9IdFFLdXp5Y3FIbFBFRFZldi84YUd4cFFz?=
 =?utf-8?B?Q1dKMUlNNlg4SzFEaGp5TFdPSFI2eWpBd3JTNmN5VUM5MllhWkVHalpWbmFy?=
 =?utf-8?B?cDZ2SllYTDVBb2o3VjlTUE12YmY4aVA2bmVoMHdkdFNnT3RKN1BVTWlKMWRG?=
 =?utf-8?B?bFBTTUtQSzBMRUd0NkRNcUs5aVRyQ2Y1eGROK1I4V3M5c3RVMW94THNqVFVv?=
 =?utf-8?B?T0lORVpYa0xhMmZLcHN1ODdzTm13aCs4akVVSHJhRzJrb3RpL2RiVWtOUDZO?=
 =?utf-8?B?VEo1UFJRQmltWXRMYkR4cW1EbURXdVlsbDdlNGNOREhqOGw1OE1od2cyOUhm?=
 =?utf-8?B?UlhlMEJ5dCttWmJvWU5kSXdsOTdaT2gyeFB0eUpNUldzbXdzWVl1aUQrVnQw?=
 =?utf-8?B?Y01Pa3lEY3NqblNWYktOOXlaaUZRZDZnb0ZENDlWVGN4SGkrY1N5UGV5YmJK?=
 =?utf-8?B?ekwzZUNQY1o1V1NLT3MzUHh6YjBPUjZBZS9kd2pzS3RJNG9YbEFWTVZkU0pk?=
 =?utf-8?B?VUJaOVV1QWs3dTZESjNWaWhiOXpXb3VwYlF0T2luN1UrQllEVWlsN1FFaEtn?=
 =?utf-8?B?TExWNDhtSnl5TUZ4YlE2d0RCQUt2K0RjelV3dHQwdisvRkJzWlVGSUVVL2cr?=
 =?utf-8?B?OC82b3IwaG9LVUxnclE4OGg0YlJZUjQvblhSMkFjdmw0OXdjaHZQS0VJVFk4?=
 =?utf-8?B?ZmhpNHY3L25GT2dPN04zc05wUkFCS2ZNYU16UHl3V3NRRURnWXk0aVVIcERL?=
 =?utf-8?B?K0V6MVREaGZaU081TjVZOTByMWx0WURkeVBiZUp3eVNwSEZiZDQ3TTBSdGNZ?=
 =?utf-8?B?ek5hekxtQzBnaDBhL3ltbTZKeElDY0RtYSs0bHY1STliczFscVpXVlAvb1Qy?=
 =?utf-8?B?Z0hwNS8zelRUTWlRZHIvNFhOUnpRNDRjSGthMGpvVnJVUkxkWjN3a0VCN2tn?=
 =?utf-8?B?Mmwwd1c3Tm1SR2pXU2UrcUVEV2ErUEVVUWRnWXhkeEV3RlhybG5DVEJaMnhh?=
 =?utf-8?B?RFdFeGphV0Q2R2VXNDM1QVUvL3RRK0czcmpWbHZnSWFmbnk2KzlQdVlDSS9Q?=
 =?utf-8?B?SlVDZ2FEaWo5TElQRzduTzBDTXRPd3JrYUlmejY4VEFEK1dnbjlKN0lOYjY4?=
 =?utf-8?B?amZjYWttV0R0bVdrMkZJYnJMblVpb24vTHMwNmNsRUcxRXdaSjBHRzVIQzlz?=
 =?utf-8?B?WTR6OTlSOURDUFpHU2g5QU1uOFNXSlY4ckQ4dnc5c0RUdlloUnFLczlnSllm?=
 =?utf-8?B?UW1pWTdqVWxENjVmT0ZZZHdGM3J3OXJSaWFFbTNsT3NCbkk2bE9DRnhrNG1I?=
 =?utf-8?B?MkF5UXpwUEx4dFJsTzhOeFRtdXhMNzJ1TWlRcjdxNGR4NFVYZXdxKzJJVGNp?=
 =?utf-8?B?ZWErU0V4cG9WL0cyQTBWNEVjTjRjSmR1Myt6cmVIUmR3S1ZqK0xTSjNqVVFY?=
 =?utf-8?B?dzgxL2UzQkNtM2I1NmY4ZUVBeGtLQVhzRXpnUlJUYWk3NENta1hXdWNWZmta?=
 =?utf-8?B?Wi9GOTZ5MW5KSXJYVHFPaUlSWm1qeGtjRzZLaTlQejV6bGVQNTllT0hVNk5R?=
 =?utf-8?B?RWtOazlZdDVobG9lR1kzem45Zks0UGw0SGc4ejk0ZmlZREhQKzZ5cDR3RTlP?=
 =?utf-8?B?T2RTTTNpU004YkoydmVMTjFDMUFibHBrb243TmMvQk91c3ZyNjVrUnI0MW1I?=
 =?utf-8?B?SWRUUWtRQXpJbDhZR3pYMDdNa2hlQURUaWFvc1VUMCtoMmZzalF1WXkvK29k?=
 =?utf-8?B?RUFDMVZoampPcEZNOEQwTVpQZTZxWFJkam42QVVZaTg1TElwekZQc3BmUUlS?=
 =?utf-8?Q?ilDxWM4rFLCVio6C/Wnf6Ol1pCYqVibxKjRuSJ+HAt1lj?=
X-MS-Exchange-AntiSpam-MessageData-1: y5iYZ+J+dlELBw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4635d833-c427-48b1-6982-08debfb20529
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 07:47:24.7202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1a63GhRJxQFRvguAD041fn2byXf9R/9gxrILXpj/8rS3ObYdh/s4GSKhL0jlHA91wuOGgbXTkeOxX9PLemQlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7524

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> Add the FSP (Firmware System Processor) falcon engine type that will
> handle secure boot and Chain of Trust operations on Hopper and Blackwell
> architectures.
>
> The FSP falcon replaces SEC2's role in the boot sequence for these newer
> architectures. This initial stub just defines the falcon type and its
> base address.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

