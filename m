Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40871CAA6C;
	Wed, 28 Jan 2026 02:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567872; cv=fail; b=ldCxfojzDlkIdTiyhqvLAsy4wHxBV0jRkIlsPBlZeE4zXF7UciaAr/S3mLcmOeWa04zxjCmn6cof/fs+SmjuLqpSGPZ+kmuAM9U45Rsl+0AmPoXlEl+3h8rY1dyI7BC3Vgl95sItGoLw1FbgwrhcupmLm+TFpqnOA2cAtBqKzts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567872; c=relaxed/simple;
	bh=dkzuEw31qGUX95GaaYlhqJ3i8VuHE33Lnqv5Skh8PtE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jdJ35uBQr9zelpneCwGO3T3TnKm99g1q3f9i2JFygxE8nPZ8KUOmCA+Rik7XAbe71icG91VEDyP0IwXSk5w4/XGcANaZ14P0U0KebyY8k4PwXPE/V5fl4up+WeN1X99Nxy2dXLUGH/gXFEHo5M2dnrvF8bpRcRDwPg3lfbZof+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Pn0LucXF; arc=fail smtp.client-ip=52.101.43.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pn0LucXF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRWVDOPHacAsopwagDAps8Spa5v5176RqTi3bSHj0/GyWRm4BkDkM2PoS64sCT2cdc+ifF8/4KAXxDLXuDc9w1G3ZdpE0N3LdMMnk44GGciid3iyZXICkPUpu335NTDuFvA7cG8+Yjzcg5cWkSsD5oLR7FxHoDum2I5WvLSk8E4Hvz4jJDSMyc4uwaEN4dMrajBTLDL4KTj0Tg7NHvGbHyWXwZYU+iR6rLQKvkfHUI4m0VJ/gvNTRMy3sBx9ijEwufUS22iYI12q9SKvf5dLNOUFCCYMuIDi6WetUFXMoqNStkSVZXHCQg7ZdBc0DS0CJ/vY2fkJLjYTHDTdQE3/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXxG/pJR1S9Wu2Se3FnoEPi63iJcl7H5qAdi7l7Ci3g=;
 b=VDAfLdrJGKLYPIU6OwrwBY/sJYvgThdVJMO5lo6PV4Ea+tH95H8ljD55oiWU3lMJ1IzPo1cGXMyrO7/HwvBcj2jyEcnIKTHcO1HzXHq165fw7TOAh/KD2McioKgh14RuHf28HWpNYYmwWIyq+ONfscNG3YMRmaEcv8GLu2RpKwGK9L134aQY1N/zfxucfjuSOaEzOyNSJMjnUpzXhc5Wx33lhbH/oriMFYqsf3YAnUTlIXDXYP5u9wytRiaqzudjrr2T6lADL0fSM3Vgu85EfCqS+GFtDzZ37aXPwlxYOHM8bdH9F3iVvyDLC5VzcEvS3soJm56+8hNgw+pdN2n53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXxG/pJR1S9Wu2Se3FnoEPi63iJcl7H5qAdi7l7Ci3g=;
 b=Pn0LucXFfM4rCkrx1Y4FV4SfQ6etCWuFsDNFpCXe/ZtEnvQQYwZvuGDrviB9kod9GKk7efxS7qCWUliaAvQMSQErRjhlOHyEiT6CXG4mXzYZ5j4YGhA9YbL4Z4kDHcP3Ac7MsUMzBTxmoSCZQwzNg2iSnrBwZzNmTNS4j0d+/72GbD5nJ/chPzCGzlmwitvgCVvOH1LZDhnGVSAPBkO+mawt+5NAAselWZmQtvoQOcFrSj6wGBmzYfB4ElSsURtRNJJmb0652aGlvmq9AZnQv+QL3tRswX5mIq2bTH2RdJ7nF9Rc4EiiM6AhaToWxb9Gq5eL3EXAXdSqmSjMXwIDNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5654.namprd12.prod.outlook.com (2603:10b6:510:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 02:37:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 02:37:46 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 28 Jan 2026 11:37:29 +0900
Subject: [PATCH v4 3/7] rust: num: add `as_bool` method to `Bounded<_, 1>`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-register-v4-3-aee3a33d9649@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: b85aa5f2-07c8-40b3-6581-08de5e16388f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEdrOEdXWTJ2d25tTldYSWhMMWl5Sk1GbnFaT0dWOVNKbUdVUnJEb21rbmNM?=
 =?utf-8?B?MUtDbkZrQlNFTy9aRUY3NFl4MCs1cFJ4WUZzVXAwb01jN25DVmx5cytsdG10?=
 =?utf-8?B?ZGlERCttcExaZThyMTV5bk9RTXNSUk80M3ozdWlnUXM2dG9nSllVSHBkMm5U?=
 =?utf-8?B?cXNYdHd5S1JqT0lNZnA2ODZFbUFEeVduMmtDV0l3Qjc5QkJIeWxYRTdDbi8v?=
 =?utf-8?B?Uy9PRXlhZ2IzWlpCeW51VnBuK0lpQUxXVXpHRVlXa0FqYStxcHFtN0RBZ1E4?=
 =?utf-8?B?Vm14a2lvNnJEaG9Zc3RYOGwvQU5lM3pUbjBDZE9QNTh5dnJqZFh5cGFRUGww?=
 =?utf-8?B?eU9Zb0ZoaDJZQlNkOEpwN1RXQm9IUm1kOFU1WW9DUEd0Tyt6MmprZ1JQVVQy?=
 =?utf-8?B?L01HanVGSnlxZEF2ZGorNzFPbCtiYnJDVkFLZXBDR2h2T2luTERYQi9SRFpJ?=
 =?utf-8?B?VFhSYm1pYzFxaW1aSytqNlVyVGsyYk8ydm8zZVJ4b2plSVJkcWx0OGtzclJq?=
 =?utf-8?B?dEhZdDM3ZnFucjZoRDZ5ZlJEV2N2dVV0bmIxRm9ieGZPWGIyaCtjenljYnJC?=
 =?utf-8?B?OWNLOUpEamJQNkNEdWNKNytGUHhRRGh6VkNOaU5YamZRZ2Z1a2tqNmkzSjVV?=
 =?utf-8?B?cjlsdnZoUjByUWE4dnJTK1A4Qk1YUUtRamFQVXloVDU5K1U1M2wwa0VnUjVh?=
 =?utf-8?B?YzJtRjhVeEVnM1NEY1lselJ0eUNrU29od0k0STJHWUtZdERpa3VuMEdYNDhq?=
 =?utf-8?B?a0phSUNab1BZblYvRDYzSURoUVB1a0xWM25GaDNMdFpOOFlBN1kzYXBMUW1J?=
 =?utf-8?B?bUMzQklWUmcvbmJRUk5aV2lsaFhDT0pYTGJFQS9SR1YvcEQyeEVraDM5djhR?=
 =?utf-8?B?aWV1SytvTTdaUXMrU0xxSDBKdkJRVkNwUEVsUEVkRWcybmY2dEhjcjJnU09r?=
 =?utf-8?B?VFhja0RzNVMvbGxKdXZBN2lEV2Vob0d1ZDNoZ2wrWlNMRm1SQ1RPZDdVVzM4?=
 =?utf-8?B?SmpGZ2ZjUTgvWHcvVVVnc2dLbEdUdTlodVFBWnBETi9wSkdrUXpKeERxVnBL?=
 =?utf-8?B?Q3dzS3A5ME1Fd05ENmx2ejNtamZ3cjhhSk1TbkoyYjdKZ282YUtsR0Q1b2hq?=
 =?utf-8?B?YmpoTjFKMDlUTlJhWllKZkl3eWtTUHlLL2lmL1JsdUt3T041OHI1VC9rZ0I4?=
 =?utf-8?B?dzRXdTI3NlVWUW1zdXBOaVg5NzBTSStzWENXeWlBUFpIVlE2Qy9OeVdxbVVw?=
 =?utf-8?B?Z0FCN2tsbWdhYjBNU1IyL1pEbW4wdDRrc3o1U0dpcWlGc21EcTBCOWQxeDdS?=
 =?utf-8?B?VnZORzZyWEdMOTRvMXBaQXB0R1B5VEQvSm91Tys1VlhOMjBUS3lFT00xcGRr?=
 =?utf-8?B?YnRQb09yNWVlNjhXcXBENXMzUk9WUTRkRlNQYlVrUG01eTQvZjBVSWdQZDN6?=
 =?utf-8?B?cXdOTXVLOHVpTzA2Ri9wTjVVN20vUWVKZVZhb3RZU3lBTXY2UkcrZ1dteHpk?=
 =?utf-8?B?QXA3VzNlRmFKMER6a0QyYkk5c3VoN25ZT2ErQUU3RTZickJhU3BKbnNBT3B0?=
 =?utf-8?B?Vm41TEFJWFpjVnNFeDMwdUZXbTlsc3VNSDlKS3RkS1J0MWpTdjk5VjNOSEg3?=
 =?utf-8?B?MjZmcCtJaUplLzJzQWpuQ0xPWFhZZkx4RVpQY1JsZkVFdE1wdHJEK24zNy82?=
 =?utf-8?B?c0VBUU04ckJ0cHErMW5HMjFmSUs5MmVqSzJEOUQ4V2h0TExhOFFSWXBZTFRK?=
 =?utf-8?B?ZGZaVmplK203bUROaWV3MXMzNkEzdUh5bjR0eWF3eC8xZ2IyVWNadlY4T1hJ?=
 =?utf-8?B?K0dnNXlNa3dMb0pjdjlPS0ZXbEtqVzhYejB5T1J6YzdHR1J1V08wZ2NJSWsr?=
 =?utf-8?B?V1FUQkV1V1dmd3dDRkwxNG0wVUNyTzJEUnNuVE5yaHpoVHhvT0ZXcU1YVUQ1?=
 =?utf-8?B?RG4wN1ZQT0l3NHFpbkE5b2k1ckt3bGRtZFQ1SjRkc3cvQkQ0eHFvTHVVYlhl?=
 =?utf-8?B?QXVwY1IwY05KZkJVUEVDSGNGejRpTmlBVDBOQ0Mva2U1RVRCWXJ0a0Nrd3h6?=
 =?utf-8?B?STVUMWNZU01JODNMTHlYK2xPQWVSOGFYait3VEVjei9QYWh5Yzdja2xEelgv?=
 =?utf-8?B?MjdlUVI5UU00WkNMRTlnWjlsOWxKamh3K3lVV2tZWEovNXplcnJsR1ZXeW9P?=
 =?utf-8?B?Ymc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlNtM3hkWjhlK3UzREprL0NsSitsc2ltUHZUcGNLRXVQN0dLM1ptKzNpLzl2?=
 =?utf-8?B?K2s1ZlBkVFFkdGgwS2FUNkR2NWxTYmlnRG9CYnFkNWQ4WDhyNVlORDdzOG1k?=
 =?utf-8?B?QkR6MWFMQ2ltZnZ4NWM2VytCR09CNUx0eUN4Z20zdStQeXo0MENhUmNCeWt6?=
 =?utf-8?B?Y3ZYOGR4Rmg4ejdDdDk4OXROUms4QTZUTVBCWHlnc1V4RXAzZHlKaXphNnBM?=
 =?utf-8?B?bzVNS1VIcThhSS9XR09jdmxFWXNXVDVjZnM1YTgvSzVLb0dJYVAxRm1NQW1u?=
 =?utf-8?B?RElpT2YvSzg3Z1FlN0NuejhmSkE5bUViYmNHNG5BRWVXK3EyU3RjRnk0Y3Jy?=
 =?utf-8?B?VjUxL2ZvSTVQMEZmWkJJTHU2MjE0aWREc05XZ0R6VSs2SmFleGgxaWYzN0Va?=
 =?utf-8?B?Rm1uYlVVY0gyK3krWjR0c0JvbHY0WXZyUkdWcnVEZ21uYTlPNHlYbFgyL3pp?=
 =?utf-8?B?N0VYRG5SU0JiazV0VnQxZDJBM2hWNkZzeWU4TFQwWXJ1LzVXOUhGSWY5VGN3?=
 =?utf-8?B?YThIRGNIZFZVWFFETk9ESkJJRk85RzJCZzAxV0JJYjE4S0pxS0RwTUZ1VE44?=
 =?utf-8?B?S0lRT1JLUHBRanJja21VNTgrWXp6Mi84bTB6dENkV1NtdEQ1V3l2QTVucXBJ?=
 =?utf-8?B?Y2tzaDB5RUZqekFleWxUemFISTV4VDVoNHhIRXhrRlFtYW9Rbk1Hc2FIVk1q?=
 =?utf-8?B?VFlhdmZld1ZQZGNrNzhsYlNJc2F0Sk1HUFZYQnE0N1FqbzU4eGtUQkh1SXpO?=
 =?utf-8?B?bDdGWndMSVh4TTFDTEVrN3NXRXJHZ2JDNkY2cy9VQ0N1TlptNW9hdXcvYUY3?=
 =?utf-8?B?UnpKeWNQeGtZZU5NVjkxYnFpUHdRYXNGYjIzQTRGRStwQ05xVmxweVo0dEhV?=
 =?utf-8?B?ZEpMa2NrY1VmN2NXaGUyV0pNeDZ0V3MwVEZJcFk4WmNyVG1RUEtaQlU3cFlD?=
 =?utf-8?B?amVsb015Ujk5ekEzaVZNc2ZZVUJ0c3d4VFViV0tjQjJPTi9NazFQcDI0MGJM?=
 =?utf-8?B?d1FuK3FQbUU4My8welVhTHdJOGNxUFp6TVliemx4R2ZVYWlGUVE1N1N6SUp6?=
 =?utf-8?B?Z1lXNEFHNm5hMldWR2Zla1M3Q1JJRkVZbWZDREZRcWFDc1lNYmpDQXFSdHFl?=
 =?utf-8?B?MjU1UVJOZTh1d0VudTZicFJWeFAyUWduVkNvM3ZVd2duK0JHT0JHV3JaSTBH?=
 =?utf-8?B?TllndTE4MkIyM1ZwSnI2VzVQOC9SSEVBQzlxQW1ZVVFVa0hJNjJBcytMNzVT?=
 =?utf-8?B?ZzJYQnZwenM1Q3AxQ25wZ253MzQ4THhGQXRzZmRjdC9PZGw4K0VJaHRhZmtO?=
 =?utf-8?B?eTFpZFByQUhUb3BSSWx0bFl3RHdTTVZ0SWRPR2ZRYzBjVExwNC8yTG9wR204?=
 =?utf-8?B?b0xzdWdtcWdwUkJkME1BZW9OU2NFcFJ2MEM4c0pBYTA3Zlcwa2poRTlxZnVm?=
 =?utf-8?B?MDBsUFZOTVlKWVRFc2x0TXV4M1JubVlteHgvN0hsSVFMWXIzODM0WkdtYzU3?=
 =?utf-8?B?NmVrQjY0TmVsNHlmYnErc2VReUR3a0dZbHRHdjhKaWRZK0hxWTRSTHpkQXlZ?=
 =?utf-8?B?OVIvYXJEeG80bUZHU1FzcFhMd3haNHF3K2hmbmN6eVNmZ1NIN0dPSWhmOW01?=
 =?utf-8?B?SWd2N3FQeFIyYmdKWWYyVVRIQ3ZoK043bW5VSE1iWWdlVmtRSnJqeHlYNGdy?=
 =?utf-8?B?VThmcExibWhVQjA3RTg5YzRBZ1MwYjRieHBHNGI0RzJsMXdaMHVTM092WnZ5?=
 =?utf-8?B?SkN4Snh3a3ZXa2dGNkRHMjNFOEdhYXdGWnppdkJPTTAxVEJaNkNDak5sNklH?=
 =?utf-8?B?RlVjWm5iaEJVc1FGNUFUbzdtRWJEenRaZ0VmSVdWVXBCTEoyTkQ4UllqbHc3?=
 =?utf-8?B?QmRFMGJ1NjBPUDZrc2hwdW5CRHF4c0VNUFIrZ1pxdHVCY1pmQW1HWjF0c09G?=
 =?utf-8?B?TThUbzg0Y2hpc1RUaTVmYWhVa212K2xoaHUzdDZaVE1xWlR5cXhTN1h3ZFBX?=
 =?utf-8?B?dzczYzBXSEFvUHYzbXhzbW9pZm1PS3JjSklyTm9lT0pWVkVrUnE2dERWLzhK?=
 =?utf-8?B?amFrQWVtSk1JMWVvbkpRVXYxUzNVencxQ1BRc0QrNHJibmFTMWJoVGsrUnh6?=
 =?utf-8?B?MnBmOEplbUhoUDZJMWtYdWJwYUw3N0RITjVpVFZvM1F1QjZGakJzcHBSVXM5?=
 =?utf-8?B?aVZvQyticTVlRWRrYjJZa2pJVDArcmtHZDdWWXhqRS9JOU93SW9PVzJ0ZWdX?=
 =?utf-8?B?ODNYeThHRWtOOWdXenNXemN3UTJUNWIySnJYNDJYZ1NFS3ByUDh1K0VNT1ZO?=
 =?utf-8?B?ZHcxQTUxcWlCUjNWMENDM3Izc0hOZkxlOHhDSE02VTkzVkMvNVpjWmM3L1hW?=
 =?utf-8?Q?OoKCCSE8Mq7Bz4muHSiw0xftpHrKyw7TvQ0+SrqLrd+Fj?=
X-MS-Exchange-AntiSpam-MessageData-1: HZMbs2uWrC7sFg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b85aa5f2-07c8-40b3-6581-08de5e16388f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 02:37:46.5678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwwMs/5EjGHmVfJa49CBrU3ZpdJa2dlQabKySCgaLuaTgCauOCIoc1aoYatwjtTZwDeksmJaLADILvoAJGuIbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5654

Single-bit numbers are typically treated as booleans. There is an
`Into<bool>` implementation for those, but invoking it from contexts
that lack type expectations is not always convenient.

Add an `as_bool` method as a simpler shortcut.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 4b929762d5c2..b41ca6df1525 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -1098,3 +1098,24 @@ fn from(value: bool) -> Self {
         Self::__new(T::from(value))
     }
 }
+
+impl<T> Bounded<T, 1>
+where
+    T: Integer + Zeroable,
+{
+    /// Returns the value of this [`Bounded`] as a [`bool`].
+    ///
+    /// This is a shorter way of writing `bool::from(self)`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// assert_eq!(Bounded::<u8, 1>::new::<0>().as_bool(), false);
+    /// assert_eq!(Bounded::<u8, 1>::new::<1>().as_bool(), true);
+    /// ```
+    pub fn as_bool(self) -> bool {
+        self.into()
+    }
+}

-- 
2.52.0

