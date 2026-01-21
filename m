Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022073.outbound.protection.outlook.com [52.101.101.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE13D2E7F11;
	Wed, 21 Jan 2026 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004942; cv=fail; b=uEIpjU2ebiURI+eq0Wx7YKunCIfxHUN9e4YyIkzVRxWCVJE8th4AEua15cY0MrSKryvKL+yWrXw1zCYawu0Zd+z4L3gGGI2q9ZD/3CLRFhSRKV6RKDRceJslIgkBYio6bZu2h7AieWWy/9/fN0e6SgpTrFq6p+RidKvwBTytk5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004942; c=relaxed/simple;
	bh=jpf4OGPVnRFmY7DhIbP9T9kyITEQ9MsaSbRqsqKHpVE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=CsWelNEKjfyeATPv2xVKLz+q/ACpigEUreuhw2tagrbFq/rDY6DiezixMpd/NLO+Qyr71uBE3f/NZuT8E5NTd4hS6S0x9EKWRk0VfM+zee6Wrik3uif0G6Q63kK83XzkKLwelbfz622c/G5gfqHWgTSdA8xPEoYVPsl/kDvvSlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=EgMGKAzS; arc=fail smtp.client-ip=52.101.101.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="EgMGKAzS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8OJ2tP/H6Xc7of/cBa5zV4sMt5d1IjBGFV7D734tQcExi9tnEa2wTTwtcURROyoFx176RHs8al5MhisEJUdVVks1DX6YYttgm3BRmBAhGIj8vPDNyfG0FmLjv0xZRmAzUDajtVIdrCiX9hWfRFF5T4P0lFLSlVi/aeJIZxI4c7E42hi0qogxyaRJUVH9bobjnj9ZXGKo66QfpHrpN8MOw0w/lIDDMegnGbNZNQ7fhxLfFV0e2bLRWLpIUtpMdVViZKliBDHZZcU9CEJtYSqiwQzFUVgad/cnTNfDlU027Oy3OFbuWK6UHQ5CxhmeVNh/imiIRHRJfVtEvJJJdlnsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uyd/nLq470Q14NHAnYKM+eQd+g20IHbFKoeKVC0LMkU=;
 b=l9wpiQrHoGesvSNwVPXCn2YllLjAZx++xwsKA7aNmGziycRPd3wmtToLRCApEOf+GpgtUsvXLpyRbnaGjqz8nhreRez6SCQjjq9IEYhIStoA61vbQoOq55wCQEXyASYTzxycVnykyfDMfdcu8dFbwRX/lNWd5vVi8kokiZJlywbJz+UatYatH4JaaKG5kLhq0BT9zRLIpYgxMDLsn6Y2R5FTQlNAUbqEzjlcMAiR7jNJ/fTL0w0opC289O+4DEqUIMTM4Go6aZ32hecdMr8t9KyAMda/2nIPBqGdyzfZDNX+247aZi6bzh5sUgs4u/T2jIbu7/j38RZGnz8Yxz09eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uyd/nLq470Q14NHAnYKM+eQd+g20IHbFKoeKVC0LMkU=;
 b=EgMGKAzSO+EV+pM4Ziy6TtTN1/jvxULpZQBjk241uWJfp5GcTNcnxbGAxCF4yWtna4dgLgaaG8dS8HHsQcSBdGZWhpl28lP7Jg0ZNFab46yrGHBO2Afr+Hp4/kmK+tXdchdMru2+KQTWYbJFgsTMBliKa7iSAQZwDqxf3knTBFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7516.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:41c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 14:15:37 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 14:15:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 14:15:37 +0000
Message-Id: <DFUBWX3HTXBL.34H3IZ0OGX4IA@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] rust: io: add `register!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
In-Reply-To: <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
X-ClientProxiedBy: LO4P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e30a2d-591e-45b0-cd28-08de58f78cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mmx5RXB3VjB3SlRLR1pWNXYwMTBiZ0RxVDRzb0hDNk1rNTdsaEVvZkx1Zncx?=
 =?utf-8?B?NlVJejRmUHZvTGNLa3BPSVEzWEdpNUc1RFBGZEpnait3a09vQ0J2U213R296?=
 =?utf-8?B?SXFuaURseG9rbDFUUnJmd3Fsb0QvTlJlRDIwZS9aQ0V4UjUzTGZ0MlZIdUVZ?=
 =?utf-8?B?R09xOGFWNjlUSStGQUZIR3RpRTBDOFVMRUc1K2RpOXk3ei9GMC8rRVh3aWU0?=
 =?utf-8?B?My9rdDluMktJVFJoNHI0NkwwUENISENGOFptdjNXdXFGQnkrK0hZdVpOSlkw?=
 =?utf-8?B?RHJQU2FJTWxzOWs1TUw1TW44RmZZL1pNVmpnaGF5YXJBeGNLYksvUVhSWld4?=
 =?utf-8?B?OVRtN1Q2KzZkYTRwSy9YL2dURzdjc2lmdnVRb2E1bTZUY3A4TmtSdFpuYThO?=
 =?utf-8?B?SW5PaVpQcGFKek15TkpNZG9RZUgwL08zWVdEZXlrNzA0dHBFRStsTmVPWkdO?=
 =?utf-8?B?TVlnZTBxTldXd3Z2ZGI1OWdKM2YyWTN0N0tIbW1wWFRiYjFta3JZVzZMOW5u?=
 =?utf-8?B?d2pCY1grNUJrWWJaME9IUUJJMDNMb3BFY0ZzbmdvY2N1K2JKZ3UrWHRuL0hw?=
 =?utf-8?B?NDhNcnJqZk5xWDNhWGUrdDJEcGNrVHJJN3QwZ3FGYmdCQ0hNZDlPckZZRlR6?=
 =?utf-8?B?NHNHVzFTL2VPWEdCM2lOV2tpWk15RUU0ajV3RVcwaE9mQk5ySytEd1pxRHpH?=
 =?utf-8?B?aWQxcWMzMHBOMHVzOGxQWnpzZGtFaWNsVnVhdWF6dnJabnpuUFJTdS9lY0Rr?=
 =?utf-8?B?YW1oZGdaT0hBSVE1bEp5T1hUeVg5dUZNYm9kRFBwMUpVVUV4bWdTeWZNZW16?=
 =?utf-8?B?M1YwZ2hoWTFmNEtwdnMvWHlSdDJDYi9aMG8wT2tLOTFMeGFicXdHbXprQ3hZ?=
 =?utf-8?B?dHRtQzNnK2hNRlZqVzZoTmc2aHppWlRkWnpFMHRRTWIyOEdpUFlwbzBMV3Qx?=
 =?utf-8?B?M2RwTXltN3laZGxFVHR1MFRsZjlUOXBMOExra2Ezb25BZXFrK2lFTlJhT3l3?=
 =?utf-8?B?bTYwYy9jN0lidTlvN29vNng0OHp4QmdkeEZ6L1UvdW5JTXJoSjQranFzbzdT?=
 =?utf-8?B?WW84Q0l2elNNV3pXYmJmbmRUNUt4RE5Ea09uTGRkTTVoVUdvNFFJVXB4ek44?=
 =?utf-8?B?VDVlNmNRMCs0TUNLY2xFbzNrcm9NUU8vaFppVjhaa3IzVUI0aFlRMlpheGIx?=
 =?utf-8?B?MWtENGFacURBanNjd2k5Y1pWUGNQMG1VYXErckdCZlh0b0t3RWdZM2J0RVl5?=
 =?utf-8?B?QnVERVdVWmhKSEFOakoxTlVVZXV2b2cyZXk5cGJEZE8zRk1IQU11blp5UUw1?=
 =?utf-8?B?QWpHUEkzUHUwODRxM2U5WXZIZHJFelBjb25TREViclhaTmhORTg5MThMNzdq?=
 =?utf-8?B?YkNZMWZRMXRraDBWbk1BSkRZbVhRaEJNcEFEOFJ4R0MzUlIwbXhCU3k1aHdx?=
 =?utf-8?B?TTNpNlBrL2d4YW5TbGt1aWpFOXVRcnNuU0R5b3k5RVJoNXkvYVcwZk9tSDFJ?=
 =?utf-8?B?RWgwTXBPUXplVll3RkxaTDQ0cXAwY1JKR0FFa3JFdUtWYnpoUHFjQ0tCVTE1?=
 =?utf-8?B?MG1vU1VTRVNOYXZ1Tm16d0ZMMHBZSjdWM0E4eXRMaVlxTnB1dGZEM3JYMy9T?=
 =?utf-8?B?VW1CRHpjQS84WXdQVDk1SUZudVg5anJMbkJSenpIN1FEczhBbExwbXo5Nmwy?=
 =?utf-8?B?SzQ0M3o3ZVF4djJ3UVFJQkVsTUdUaUtnbmQxUjNFV0p3NlU5NTNTU1R6aEpG?=
 =?utf-8?B?OXF5L0JMZ1Ztd1FDMjdDT2FFYUNpUFR3dklxWVRDVWVjVWRWOHZxNy8vTjdB?=
 =?utf-8?B?ZW9ueXozS3p2Z0Q5NVlINERLV2lNYUZjZ0s2NHNRV2RlVFpQTnV4VjdvWWxU?=
 =?utf-8?B?dmRJMUw4M0g2U2RMYzV1bTJZTjdUR0g1WjAybHlpR2RnZ0NtZEZ5c1RxMFdU?=
 =?utf-8?B?YUFjMC9OSHB2UE1wVk14TUwrL0UzMnRvYmlYcmFVNmQveU5KVitxN3Q3R0dH?=
 =?utf-8?B?RStZdEVHcVJNdzBFUStKUXFrM1FVcWNuRzJ1STRxUGZjQ3Q1bmFkeFRlemps?=
 =?utf-8?B?RU1IQ0pNQjJ2eXpsRTg2MVhEZEM5ajBEVndZMGJESkhwclA3dkhqQUtrZ09n?=
 =?utf-8?B?Q3R6eVdmbDN3OFVIdENKK0J4RElIUXNIZ0NPS2RKK1Nxb2prV1kvcTZVYXJL?=
 =?utf-8?B?b3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7416014)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1RITUlNbU45UTViSlZOQlFoTGtWcE5wRGx2Q2RsUnZlUW9TMXdFV3g1YXBJ?=
 =?utf-8?B?ckowa3gxQmozUDI0K2lLNExQS2ZiY0puaVI4Nm1BUkhVNWFqaWQvbnNwWWNC?=
 =?utf-8?B?OHpFUDN5TytFTkpmVlU1S3NxS0ZkUGJhbkltektrZ3dJYStRaUFIamJVdGNE?=
 =?utf-8?B?bHBZZk9iSFNmdlJDajB6bVREbUc2bm93ZDZaTDQ5NmZNK01YNkZvNmdicHFY?=
 =?utf-8?B?Rzk5dURhZTV3c2FGUFhzS0gyNFNPM2hFRjFTV1Nzb3M2a1RRaktxbXVYRk9m?=
 =?utf-8?B?RUNOWENleUZlMmtvUC9Qd25DelgyK1ltc2hPbzhiZkZ0cFhxZERGMTBFR0Nv?=
 =?utf-8?B?em00Y0dlZlpRMHJhMUVnSkhqRlF3QzVyeUx6dmFpSytlMktwbHVOUnFuem1G?=
 =?utf-8?B?dzVNTVNVQVhOcGU5dEhFb3RLazMyOUw2c2svSmtDcE16K0hERUM4cEFQR2c0?=
 =?utf-8?B?RWx5ekFtUkx2d1VyRm9JUFdUOUtZSzlwQldIN3VxdG95R0ZjNFN1NFlYWFJB?=
 =?utf-8?B?cGU5bjdIekRWZzF6TndXamt0Q3k4aGV5RXozdXNvbzlCa2FGRVFDVkNqUXFF?=
 =?utf-8?B?Vm1MMFozUi9IbGZIVjQ0UG5IT0w1SGl5dEloM0FiWjhCKzJ1R3B2Yk8rTkxs?=
 =?utf-8?B?VDBjQThhZWdnRVYrVEhVcldUd2ExTDBLYUxEam5ic1BqSTAydXpjSkdOWlJW?=
 =?utf-8?B?QjV6Qmg4NE1pTmlXZlhzbkVNVmw3Q2dlSTljZHhRSDdoSGRnV1RvOWErM0RZ?=
 =?utf-8?B?a2xHYU9tT1AyOTNodUhaY1VFSlNhZThybHVILzAvbkpWT0s4WmJnRkxqbi9h?=
 =?utf-8?B?bFZFNUl6TDNYTG90TjRKWnVDd0d3UWtGbHhyVVVNRXBjMFEyQWpKYzliMXpx?=
 =?utf-8?B?TWNhUUtIVEVrRU9Mbkk2eGNFSG9zZktnRG1uMVcvaGdCY3N4WlRuVWxxdzdY?=
 =?utf-8?B?UG5uMjJnRWZtNmpLdVRYTFgzVWNiU1hxZGdBb0xVT2JEZEwyNUgyQzY5UTlo?=
 =?utf-8?B?WUpPa25TNUJ3Y2R5V1MwaDVSSWlJYlZ6aXdCMmhMWW85SWNWOHVlYXFkdXhR?=
 =?utf-8?B?WFJjUnIwdHpHVnVSM3lVTTdFYm5PK1VvcHhxMUVjbDRRdDVtTDVBZkFkYnpL?=
 =?utf-8?B?VllqSEpDK2dGeUJVSEVzVVVhSEFnaEN3Qms1QlNDcThJZE5MNUpjbEl6ZVZ5?=
 =?utf-8?B?YVdyK1FkZWNIOHpFblhyRngydGRzcmpqY3VJK2I3NWE2WHFGekJ3NkpuSmZY?=
 =?utf-8?B?WXE1MGlubTk3N3NPZmVIMGFDYnB3T2JDaTY0QitNWlVPUzFDWmpjMmFCbE9p?=
 =?utf-8?B?VWxGN25DcG1HVThtSzh3cWNSOHlFMGxtQXFqTnpYWkNibTRaK0F6ZEJsRzIz?=
 =?utf-8?B?Y2ZNcjhaNG1IMWpRU0tSdlF6Z3BWTVc1blhwQXN5NW1pVUxFMGUvOVJIMllK?=
 =?utf-8?B?eXlqUUpiMXFGdVkwa2c0aG9jaUJoaURhaGVwQzdLUXpLMXVVdHF4NS9ZSXRh?=
 =?utf-8?B?S1kzOW1vWXJiM2Rjbmx3NTdkS1RJUHhLU2w3V21rRTdBK3dYdFMwT0Z4YTBB?=
 =?utf-8?B?Ky9IaU0rUzFyNXZBby9zYXNwMkY4N1FuMG9YOCtjOFFXK2dNZzdHQVFTdmVn?=
 =?utf-8?B?cTFrbDhxSm90eUNvUWd5cjRZMG9BUS9YK3hZS3B0cFIreVdNdVBkZFR5aWdp?=
 =?utf-8?B?VVVUakdrbFZVcmUwZGcvdkROSXJKUnlVR1R1YVppQ3Nic1BkcTlkQkc4Y1Ir?=
 =?utf-8?B?SlZheU5qeFpSV2EvSlBDbDgzaUdUNzk5TU54eXRnR2Y4bFhGcnY5Zy9WUEJq?=
 =?utf-8?B?bmwxK1JPZ21hazIzM3NQQnc5RUJreEpYTFpMajRlUi9wcW1jemI3RU15empp?=
 =?utf-8?B?MHdQNlArZGxubWUrOHZTV01jNXpwTEx6VjV3YzgvellpeEYvajk2UUthVzMv?=
 =?utf-8?B?MjdXM2lUTlNTZ2lkWXRVenB3NW1oTWlhTVhUU3BQVEVFNmp6dTZ3bC90cllW?=
 =?utf-8?B?dFlWU09YUCswd1IzVmpqNExobEZINUgyTXFOM2xIWEd5NUxXYjJIemRmUjRG?=
 =?utf-8?B?YWpPRnRXd2MzMkhyQ2N3QUFQc29nWUQvTGh3WkttbDYzVlNpNzNiQjN0TkxJ?=
 =?utf-8?B?VmNORXVxa01FQURGYitDYkpXbnJwMDFtQ2t0TGppTlMyd3NvRVlRUVdlZWpT?=
 =?utf-8?B?bnNSNzdKdVhhVTBwWTMyU0ZsdUM2NFdyeUtMWjVSVlpRNHpMWVZid1FwbmIv?=
 =?utf-8?B?NksybExYWjhyVGt6aGVaL3huVDFhTWhPZkF1SktUTnN1aXArWXY5MUZyOTF2?=
 =?utf-8?B?bDVwdFZWMHVhUHJub1cwOThtVE8xeXNBVU0rVXZHaXJJM05nM0QwZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e30a2d-591e-45b0-cd28-08de58f78cea
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:15:37.8122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfxKXwd4zQxNejY0kZNXgxC085WVDOLkg5HvJKwH9Ld1Q5iiA+1InX5TQG+Iqiz9qjH8MgybAiA9eh6m6Qe6Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7516

On Wed Jan 21, 2026 at 7:23 AM GMT, Alexandre Courbot wrote:
> Add a macro for defining hardware register types with I/O accessors.
>=20
> Each register field is represented as a `Bounded` of the appropriate bit
> width, ensuring field values are never silently truncated.
>=20
> Fields can optionally be converted to/from custom types, either fallibly
> or infallibly.
>=20
> The address of registers can be direct, relative, or indexed, supporting
> most of the patterns in which registers are arranged.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

It looks like this is still based on the current Io impl. I think with Zhi'=
s new
Io trait this will look quite different.

Best,
Gary

> ---
>  rust/kernel/io.rs          |    1 +
>  rust/kernel/io/register.rs | 1198 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 1199 insertions(+)

