Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010044.outbound.protection.outlook.com [52.101.56.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1091130102A;
	Tue,  9 Dec 2025 02:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765249105; cv=fail; b=bNYrTGpplKqbxadVG6NnFPZR4g520QQp7j4o2xbDJhYWCOQUfD0DmzA5qfkGK4zjNZLOnSLmTD+DlS26i1UdTAkP5LTAPfmH435U19jvFX+SoATHlRLdpirCZyqxBjVCFBXtKSfsQ9C0XGTPj+yC+antsVeM0Drbq06Lc9C/kNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765249105; c=relaxed/simple;
	bh=CVvdxmmioBD5/zFfL2bOrEo1q6Tj8CqvyZ5IIiYx3AI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=b1YZ6a4UHlY6YpmW1uhfpezemSYH/Og92wz6tjBHdxlmiDRIko8eEeUMGemiAqGBGwziB4Ky6grAbLQmWXVx57E28m2ALwZWl4k5ugukxXRXq6NlDsHKbiZuPwmQSGi45yGkWtRYTMj/6DVZzo4XWqCGFA910GfJquF54ppkU5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oktwF2Os; arc=fail smtp.client-ip=52.101.56.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oktwF2Os"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OsMeX9HFohpiw+ewOPVYv91iwsH/wuIfRDhrEX2TnWv1srgOgSGkSCyhAoQrSQBxs5DpnyR7dDY8sgf+PwQDRsCEpTaykUUnqtDu/gEjLuZ7OjBZOKc/Wgkzrc48UCJsP8+nypYx/heDkdmeDvC9DL3+nSLMq4zcUh8YtLO4XaoIoqo0cZGloGyT42t3TTuftQo9dwalNWW1n1og03HvEnRayay0FBrQiNc23aEJ7roEpvfuS5h+YtG+wlS/2RJYkNj6NwpyczWk+g2mvP7XJw+OGQpXYs2MwwBnYFYlJdqceYmACV8vjxxB0vF1ce27Q0I5J8DtPN+Y65Z1y/VnEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4sFjwTioeJinVT32YRM2sBVZl+frgAsKMvgXeoW0hM=;
 b=fSX8gbPATYJT+KFu3zcQebi3FIDajkgSWzsxA7Flu2c23fOcnbb+qiiI2l3A03QnUk2wr2TRsIFHtTO47jiSVQFWe01CVDQ3uJX3iNQKYwRXJlPCVzOZj3xKvJuVewqJfPhxbqU98A4F9MqeKkB23LmLOUSdWXoEAyLa8w5CBRfULQMfXNA7XPTXzOSKDzHCkn9NhuuGCAGvlGQ1aLeN7or4OVeVdFo7QWPWJ8E/zFNq8QMLGELshub+/YMVKRue1QAbzp+AK+RgZGWbpSgdEO11LKOXYEuRGH7YeddSeP0LQxUkyymeJOY0+YGB2P0nJ0uRoZa1yJrtTSzqvejr1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4sFjwTioeJinVT32YRM2sBVZl+frgAsKMvgXeoW0hM=;
 b=oktwF2OsA4RctClj/Y5eYDcxFbKk+Jvw58cuV0qBAqUjvWxcI5iu466fLw0w7C8si61KreJkm1PCPqI60OcpynbaZmn9fT8rsXuC4HPwdQeAPCiQcagaN+SxsW6WE0vl1rAkRd3w+Ynw3kgNE7SCZJuCc67GMOz9wnuHTPrYa3MdQMqZRqfcsPtVsYL2TMg61mduCWRxlT9Dw/Iyq/MWFhAh7cKYiGrX/r3EQsiI9wH3TpT6xLvr3Znc9t6hTgARbgkZUbgDt0SXZ0vCUt4N0z0ZYQtgooqIOMn8Xln1z6t5kRrj1zfuP3GABQywqpTXdwi0g4sxw+GOYaBo+x+1wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 02:58:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Tue, 9 Dec 2025
 02:58:19 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 09 Dec 2025 11:58:00 +0900
Subject: [PATCH v3 2/2] gpu: nova-core: gsp: use () as message type for
 GspInitDone message
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-transmute_unit-v3-2-819fe584ba06@nvidia.com>
References: <20251209-transmute_unit-v3-0-819fe584ba06@nvidia.com>
In-Reply-To: <20251209-transmute_unit-v3-0-819fe584ba06@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0170.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4e5308-9566-4398-c5b1-08de36cecea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzVaVEs1QUxnV3o2aElNcVhYaWRQLzZVLzV2a3BTWElJb2xDMkorNGtvelll?=
 =?utf-8?B?WUplb1VqV3JFdjZQK1QvVTk4RnNZdGRhTHBZQkpFU0xSRjAxMm5jcy9PUGZq?=
 =?utf-8?B?b1hUN0o5SXNlak4rOStnemRxQ2xnTVc2K1BFQldYQmc4WTU1eG5neEc4T1l2?=
 =?utf-8?B?cWhmVkJIZkhha2hEM0hTRzNZaFBaUFN3TThPSEkrenRFbTJzMk5hNm1nTWdL?=
 =?utf-8?B?V01Sa1R2ais1QlR5T2R4bUNUaTVzM2ljSVdOc1ZWNlNUTHFiZEFuNXkyaXQv?=
 =?utf-8?B?YUNsTjAzMjZ1NkZ5d0hUNHE3UjlRTG1DZkNxa2ZDak90eE04MG9OVlJxM2Uv?=
 =?utf-8?B?dldWQk0rcGlGYVJmTUtuM2pBTDc5d3FqSUo2NERobWJsSzJVM0tYTTRLOEFC?=
 =?utf-8?B?QnBSV2E4YzREN0pBdUpmMXpkVUJmdkdpaml2Ung1T3EweHpMSkIvZGtBYUVV?=
 =?utf-8?B?aUJNVC9lQktjQWFkeWJOcGlzNkJsb3IyekJqaThMT09qQmhtL1VkMjRrZzdq?=
 =?utf-8?B?V0hGdlh6Z0VSM2lpbmE5UTVOdzkxdHRYcFgrcDMrSFNWNmFZQmV6MDdla1Z0?=
 =?utf-8?B?RGgvU1ZSY2pnK0tsRk9iekMwSlNPeVkwRGoxYXNJaFRVTzU3ZFVzUHArY1Bm?=
 =?utf-8?B?VUJTNDMva1NiVTZHN1ZuTnFoZlVpcmNnSk9xbzRJMytjZUxOYlIvVlBkY2Jj?=
 =?utf-8?B?enRyRlZpQkl5WEJZK09tZ0hSdE51L1NScGtjTllpUWlVUWJMOHNtYmtYdmE4?=
 =?utf-8?B?bjFpTkk2Y3hSTFFKUFJ4SGZpVVUvY3NOT05YbjFSMDVRd2hvM0RVTkU0YlZ1?=
 =?utf-8?B?UTY3TTZWV3FYQzNETVljS0xJN1RtaUpyU2wyMzZiUEd1WHJXNC83QjlXYlo5?=
 =?utf-8?B?QnZVblphT3AwUjQ2eGFEVDRVM1RVS1dmY3NMUGpRV3kySnpycFFBdE0zY0lB?=
 =?utf-8?B?K0FJSjNpM1dRemw1Um1WcmhQcUY3dmQ0Si9DWDdndzFUZEg1K1dDeDlkRjR5?=
 =?utf-8?B?UFVBN2RJVmt2TkZSZW5kZUxrQmc3RnRmZEpMVW00TUF1ZGk0SmxUN3UrRnRw?=
 =?utf-8?B?ZXZXbGN5RUVweFVuMW0wN1dnSXVvTGJ2cnQrTXFBSlBaWHZEd1dWQm5HZ2pM?=
 =?utf-8?B?aUUyWmhFSlJtWkR2SVRHQU9zQjhTTW90YnFYQSttZmtsSGpSeTVib3hmZUpZ?=
 =?utf-8?B?RWFBU044bWMreVNsZG1kOC85a0gxNXVYdlZmRTZtRkpnbE0xV2tiMS9IeFhR?=
 =?utf-8?B?SjdvMFFXQ2NINGVUSWRpWDlBais0QnBCdG5oV1JmR3VQSU90eTM3LzEycXpz?=
 =?utf-8?B?eThVNlkrRU1oNnpGVnZZdkVXUk1RaUtKOFAxaHMzT1JLV2YwQ21zTnpCblBO?=
 =?utf-8?B?UzFBbnJhZHQ4NVZScC9QeGFFMFNkUkZ3ZmJaaDZVcU9sT1JoakN3MGtQRTVr?=
 =?utf-8?B?SEQ2QUxTM0FHcmYvMHNFQWVjYUxoTzFIL1J1S0lIdWhqcEl6eFJHeGhHZlBL?=
 =?utf-8?B?aDNlUUdHbkE3ZGR2dklYcGV1ZzZJRzlsbGp0c3NLTWtyZFhTa245djlycUpx?=
 =?utf-8?B?YkV5SW8yaFdZK0RJUEtZeEZURzltTFM0NkdraFRBSEFHenkxby9Mb2p6aUNh?=
 =?utf-8?B?eURJSVhwQ1hqNXIwTTkrbkpqbW1UeDhQU2l0WGJuRnlrWStJQkdPY3NYbllX?=
 =?utf-8?B?T1Q1MUIwcjRWd2hobi81Q2I2SHBaY3lTV21YTUlHaFRRZlAzZzgyTFhlL3NL?=
 =?utf-8?B?bVphZjBmL05UTGlQRmNxOWo4N1p3WUVSMytFZDArQnhQOXRnNlRhdVJGVldw?=
 =?utf-8?B?OWlYa0hKeGFjQ3E2Snk4M2ZNSERkbUZPczJuKzdhWXRSRlF1akxDeGR1QnR2?=
 =?utf-8?B?L3JVVXE2dXJ4QXlMOFJpSXl3REhJRGduQzJGMHk5MlFwcUFyUENTbDFDWEpl?=
 =?utf-8?Q?cxxxu1CnTSWIRPG8DmLo5z0a/osvlofD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnIzQ21FOHVJa0FOVVZMOXRDTFExRWt2bElCcTI1YUtBZDJGbkRUUnRZVEdu?=
 =?utf-8?B?MlFWSXQ3SWpiSGUrQWt0VWRxeENJc2V1eWpJL2w2dm5NTHZHdWVWVy9lWnNO?=
 =?utf-8?B?NFdjOVdJdlAvOWxXMnBJV05KVWNCbkI3aXhwUSs0R08zWk9PRjlFdlJZUGNv?=
 =?utf-8?B?Z3Y4aWVHRVNUTGZTbkxkZHE1M05zU0JRQ0hUUy93UlJEWFVXTzVZSHByblIx?=
 =?utf-8?B?WStaVEloQXo1TlYya2ZiRE15cER4ZWxqb1NGZFhLTm5VaDVxL3BKQ2s2bEhU?=
 =?utf-8?B?L2lXcUdEYlVoN3prMVBuUFduSG1jSkNNMU1KOXdjS0VMWjRZTmIxU3RGblV1?=
 =?utf-8?B?TGx5b05Nc08xTWtNNHdMUUVSdk9zYmNuTmF1MXBTUlJJcHdKaWJ5dE9BcW01?=
 =?utf-8?B?cEhjdnc2dnVadEtTVkcreUd4SGV4a1hVUUh5RENaZVJjQld2VDQzV2FlZFI3?=
 =?utf-8?B?YXNlVEoxMHFTcE9ZSFVUOTl1UzQ1QlFsWmFmWER5NTVSQmNuZDVsZzFwMW9h?=
 =?utf-8?B?TWJpRldGSDlyQy9lNG50dndLRitpemdhc3cxcXpYNXRmRlRqckR4T0FNQW1w?=
 =?utf-8?B?TVFEQWE1SnN3Wk5wMHlzdE8wUWRFNEtIdnNWN2s3OEM5ZDR6azR5bElKeHl4?=
 =?utf-8?B?b3J6V3c4QVVtcTRkZlhJMWxRTkU0cTk1V1NPdGJzQlBIdnJsNWJjUlVqOW9k?=
 =?utf-8?B?bTd2QTAyZWpTTFU1TXNFSmhiS1lXNW9kMndLU2I0WGNsVW1nREpiYmZLQjRx?=
 =?utf-8?B?ZndpdHErMldGaG1vRWJYdGVtSytyL0tJbnFCUytKZ25KWU5vSUhRNXBGUGdD?=
 =?utf-8?B?aXQ5QWlaTzJnalN4K0toWHRkRGVWWHZITjB5UHZsSVJqcmQ4UXIwb1V6Q1BB?=
 =?utf-8?B?am9IamdZZnc0Q01HUEJ4emNaUTBSd21TcmZhdWZtS2JUQUNQd2tmb2ZsWVhn?=
 =?utf-8?B?UUZ3WWJWU21MdDlhK05VM0Z3dWhtSkZ1REI3RTB0QjY4ODYyWEJSTllPb1ZI?=
 =?utf-8?B?Qk95U1lrYUZnVVBIRXgxaU1XcHFXMXhXQWNOZXcyZXFDd3JyYmE0UUhIVU1V?=
 =?utf-8?B?STJZNEhOa3Zmcm03bm1UYTBGMHJDSUwxZ0ZKT012RkxGM2hleUM0TzczYUtv?=
 =?utf-8?B?d2JBNWYzZDkzVkZyblVMRHZmaVBTVjBYY25JUlJ5ZjY5dlUreWZqVnM1dksy?=
 =?utf-8?B?M3lUQzBPVzFSOVI4amI0NWtWWmJOMUdKOWRXT0dsL1FObkRoclZPMTU0Rk4v?=
 =?utf-8?B?SWwyV3RZaCtMVzNyUHVVQjVhSkZINVBmZFcwSERMcnVDaUFQMCthL3RuTGY3?=
 =?utf-8?B?bWpGdVdDZHV3YkV5NlFaQlhSK0x3ak1lSy93ckt4alNaOFo1YWltNnhSeDVD?=
 =?utf-8?B?THdtUlhMczFTU0R6WlZyakFYNFRaQ1g1a2ZXS1ZGN0RLV2VhSlhJL3FFWHR0?=
 =?utf-8?B?eC9Uc3VQQkk3Sk5JNnpCMHFQTEd4dnppSW5VQlMwNXM5Q1ZDZVhSWXRvOVVv?=
 =?utf-8?B?VGxkRzJZMG04Slg4alVuUjhqRjVDVnVKaDlZN2doMUhIZUNVYXBoMjJJMkF0?=
 =?utf-8?B?eEx2SDN1MVB5Smp1dmxWN3BITFNsVVBibUkrOEZTVG5XaHF4MVphMGdFL3d2?=
 =?utf-8?B?MysvS1p0T1pwV0xZN1czdC85THZ6bXU5SC9zN1RldkVScWVRbHhZZzlNQXJa?=
 =?utf-8?B?Qy8wZCtWQnZKcTZGbTVGY051ZVlRRU5RR2dxcUFrMnV0VHN2RGpzbk5UZkZN?=
 =?utf-8?B?bGZDbnNuUjExaHBaMjk0V0tuNGd4SXByWUdqWTRYZHU2QXNaSzZEODlyakRD?=
 =?utf-8?B?bmxzOHBlYkhPcXdpdEJDQjMvbDBqWS9WenEvdWZKWXdqYUVmTXNVUklBWU5o?=
 =?utf-8?B?eTFxSUlIdjRkYXNZU0RoTHlSd0FRNW9VVHgzdHJtcmpRWTRGc2xjbGtOaE9K?=
 =?utf-8?B?S1ZzMkFvamQ5ZVpqb1U5RDFLSGxDdnBBa2FNSmRGTGlnRVhWL1BVU0ZCZmho?=
 =?utf-8?B?ZVhJVU5yVEQwbHhOMlpoT1pZcnFNWlAvd1pBbTk2bUhWR1hsc1V2UC9tdUJN?=
 =?utf-8?B?MHN2L0FhWE8zNVl0bkJkVWpscnNCZ241ZmpxaHdGeDJKT2pkQ0FYWmhCMHNS?=
 =?utf-8?B?VHo1OGFiWk5KMk81ZW1uaUN2UFhxRitwdnBTdDB2R2hlKzVPbDJ0SnRBTHl5?=
 =?utf-8?Q?1N7CdhIlbQoE+rnyPWDCwvlJhjeXBjoD3a5FzYA4Gm+9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4e5308-9566-4398-c5b1-08de36cecea2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 02:58:19.2446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbg+ccxXAMs7RJVIiTNAcF+ST83cR7X6D+irDIXozeHfeRXJcTeEM8Vk+MLzfPVwf7PV/67VEFSVck5nivKr4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309

`GspInitDone` has no payload whatsoever, so the unit type `()` is the
correct way to represent its message content. We can use it now that
`()` implements `FromBytes`.

Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 0425c65b5d6f..2050771f9b53 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -142,7 +142,7 @@ fn init_variable_payload(
 }
 
 /// Message type for GSP initialization done notification.
-struct GspInitDone {}
+struct GspInitDone;
 
 // SAFETY: `GspInitDone` is a zero-sized type with no bytes, therefore it
 // trivially has no uninitialized bytes.
@@ -151,13 +151,13 @@ unsafe impl FromBytes for GspInitDone {}
 impl MessageFromGsp for GspInitDone {
     const FUNCTION: MsgFunction = MsgFunction::GspInitDone;
     type InitError = Infallible;
-    type Message = GspInitDone;
+    type Message = ();
 
     fn read(
         _msg: &Self::Message,
         _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
     ) -> Result<Self, Self::InitError> {
-        Ok(GspInitDone {})
+        Ok(GspInitDone)
     }
 }
 

-- 
2.52.0

