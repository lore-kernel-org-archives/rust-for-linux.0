Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8506F2F7ADE;
	Mon, 16 Feb 2026 08:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229115; cv=fail; b=RGIG+v/CfrenvApTzYsL0/RwcEzgoVWV8NHXJjzwRQHv85/IXOXxKbE1SAhhmUN9e4+4IN1gh7TyhBTmDW8L4VPN1HxNthQ3SBmCXT5ySXMqosg8MKRb8Zpmb4Fio4CnYrX0D7vVdMA3iZo7t7wfiBSMA1uLbe0yrceMJ8QWCtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229115; c=relaxed/simple;
	bh=qwEvQuP4jrCxLMF9mIv/YjA72kw8j5dPHfvQ/k2BoyI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Iyn9E2UcLrLl7Htrknp1AWftI5gem54239txT2zN2OCDQJGXgk0fc3+o5h6EH/vWF6Gi+N6RaAZUz5jwt1zFfKV1OS5BQlB+Znixa3fKOOAG44Pj9wZuRQbPRbTQ6fO9LEPRNdEY+cigNwjlOzt/IYuDmCW/H+ZrzvmMkVh2e68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=auWXnBbc; arc=fail smtp.client-ip=52.101.62.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="auWXnBbc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMu7y4RFoWEQ9uCcWStDpwWVcR7ZSCNOTa2MwrKjkHh8QEzdmgVa2ui3yoSDEb8jLuQGHbfGE3bkCTR+7Gbuu91fpQVQ7nN1ROonPGVqC1dAE3RTkLNtBOPcsjWaZ/NyrJgcFCs5EHtO9t025ggsP3SVG44SAd+cXV46dEz79uvEq45kUVA56btukjOHdUULj6mQ8NdKpXw0nS0mQN4hpJfhjVDg2ujxgJUwrrN93pXEQU2Xk8cahcFJooMx185CYDMdRBshVidLbsdVMMs85mV2zMEmfu8IBSJX6OTpU+vhuvFoZz2sZpJqTxbiBkfon0/tUEGIm94vCBgaGGHlRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjeKUiNcT3bJhJNj1kIMm0mzjeHTIShzUnykFpJNBac=;
 b=rZenN74HmcazJJ/3a/L3wgp+624thc6uo9Bm417uJCzd6mGHOMaaHLN0JpZceqm7yfwten1uiDAQr8vXaYRJflORpQ2kUx6CS0xVcTDcIELo5QA5g5smCk6eQ7sXvfWz2AVEVjUISsfmdh9AAkQTmWWHWwFS4035Q044xwFSlGMzAA+x+3BmanCGQ8JVL2C50EyfWYVWO/66M3K9HRb0fkPqrewZMVmddypCuYCu6qqrN8fNPKkBMi3lkDqehGRaRqdl+0VXh9BLGywUPLx5r9MU6VD23DR1HVP2z3+24shi/5zDNX9CRb5W8oQ+WkXHAjr+ky82kXQg6EvNhjgpJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjeKUiNcT3bJhJNj1kIMm0mzjeHTIShzUnykFpJNBac=;
 b=auWXnBbc5/5sTF9mTaHGUuCEu0tF/pe1Hctb7olmPfjisRFGN+4zoBCBC7SzQ9buGL7MDzD4TUedUxJv0f4SiynIPa7CZiBROSYIm83Mi5ciI9RP+LfTQuPWCD6DSq0HXsknoEQfLaUGFJAUTFwARsJWOg4QoVAJ4uJdCAhjbAXCkJ7/N18BNDlX3QWerGL5pg8K+cpbWzy5ToVL8CSVeBuOE1WF1uitmIS6+OAN6V1KO93dAdj8CRuH2SnVSZNIXGLP0tZF4Z4TEVlq+SWCyEQ2qbKUF/zepRP6uVys3TeMBj7KY2GsSvvgDeA1HsCfMwYqqh6SZ+tUGoIpCmYK0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6832.namprd12.prod.outlook.com (2603:10b6:a03:47e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Mon, 16 Feb
 2026 08:05:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 08:05:12 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Feb 2026 17:04:37 +0900
Subject: [PATCH v6 1/9] rust: enable the `generic_arg_infer` feature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-register-v6-1-eec9a4de9e9e@nvidia.com>
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
In-Reply-To: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 321a646d-c990-4bdd-7c21-08de6d321bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekUyN1NzN0xVVnUxakFqR0kyZVJlenJxNEJyNG83SVJMT0QxRnhQMXFxK09H?=
 =?utf-8?B?c0RLWnJDOWo2SDlqUXJMdHJyVDdiNFRCRUtrQjFTZ2JlVFZJdUFMN0VSMnNz?=
 =?utf-8?B?SWlEN0gwdzlmdE9QN3U4SnR4QmhjNitGU2tSU0lMN1ZtdjNQZDlSWGpkeG45?=
 =?utf-8?B?cGg5QmFJVlpYQmg5OUNXeXN4SUQ3cFp4ekNsNUFNMUJmMWVrTFRYTXhHLzF6?=
 =?utf-8?B?YnQxUVdJLy9vbEpHaFhUakYyMlFoNENlQWJrZFdxWWdRd1lVWmRoTlhQMGdG?=
 =?utf-8?B?ME5zays0SFM2M1h2bWQvRmwzSWUyZmM1OThlRGNSaHprRmJMV0FTSWJ6dHNN?=
 =?utf-8?B?cTNickcyV3dhTFRkUVdIN3VhelpPVGc3Z2JRWUM4MlpLbjNVRVA3NkVXMkVE?=
 =?utf-8?B?bzV5ZUJZS3lpdnJYMENvSXZVdlNZbHVMem95QkJmY2tJOWhPVytGaFVWZDlV?=
 =?utf-8?B?Nk5SYUgxWHJVSUZKYTY2K20vNWNudHlWRFd1OTljMXVjVlRFeGJ0MmYycVRo?=
 =?utf-8?B?QlBRekl0VVBsSXFzVW12S3dsdFR4aXhpZ042eVAvaUExbnk3RitIcEtIWFNL?=
 =?utf-8?B?bXhncE9PcEVPTm94eGFuVGVpQXV0Yko3b3dNUFVqT3ZReTMxNlN0ZisvSzlv?=
 =?utf-8?B?dW1KV0hMNEpyWEJFZG15VmVyMWlGMXgzdWtNc1duUXJvN1Y5c0JLQXM3Q0d3?=
 =?utf-8?B?OU1CYVEyUTF1SHlkRFRodzNVSEhuLzB1OWI0dGJzTFBSaE9MVjAxYmhqSUVs?=
 =?utf-8?B?Z1hDUUhwamRSQUI4Tk53eE9vT3hrUjY4bFJFT3RZdW1Ya2ZPdXRVMVdDMmtD?=
 =?utf-8?B?NUxnN1BTVHJiY3hoSWh1RmhUUi9vUmlEMkM2bm5sZ1h4bnNLb3N0dHBMdXNt?=
 =?utf-8?B?MzhQZmJrbS9jU212dE1SQXl2TllZeWVrczB2Ti9uVGthYTFrbXlMMFF6VHNN?=
 =?utf-8?B?a1ZaSHVoSWIzTUF1QTRaKzVJUklRTEVuVTFvMU02Ymk5QVljOWY5bnk0bTNF?=
 =?utf-8?B?S3RHWlVFaHNVYmd2VVAzVm5wVzdaWkU2bUY3S0dxclNrajd1bjdEb1RlWDh5?=
 =?utf-8?B?dmp2eER5ZUw2Z2RPVG9nU2JPQVNLcnR5L04valJGVXF4T1dXemJDRzRTbkhX?=
 =?utf-8?B?dVNPb3dUVFZ2c3hPSzIvTzd2VE1NTjUzVWRLUDhoUGtGZi9FWlY1QlhKWGJa?=
 =?utf-8?B?cXYyM0VKdTQwN0lkYU9lVFFiaUp2amZOVTJ0WGR3ZGdKMFZUWEExbEtDZGhU?=
 =?utf-8?B?b3V0NWJtdzAwUVJsS0ljSzlQYmFaMHVTVkVNTFIwQlpidEU4eFppTjZvR3NW?=
 =?utf-8?B?TlE4eVROYWJ5VnFyWVVXbkRKK2pIZ3YzcEx1MzJwYW1IbXEyRFhJWG5DcFlr?=
 =?utf-8?B?SVkwV0IyT2UxRXdyMVlCQUtWZno5eXFZTnJCZGJEYTY5UVc1aW1vSW5QaHcw?=
 =?utf-8?B?MUwwU0hxM0JveXVmSFU0cnlUSjlmNVFpT2FaMjQ2NHJpSlVnekY5VHpUTHR2?=
 =?utf-8?B?ZkN6eDN2bVpEaldBVUxJUHhqQjQrOUZKVE9SVDZmbzRRWm5uMldtd3Z1QWth?=
 =?utf-8?B?Rk9KbytKTDFGQWtuRjBNUUU4emRBN1Y5S1dVN2RLVys4d3NpTlkrTndXcEpm?=
 =?utf-8?B?L1IrVTJ2OGdpanp1SmFBMVVONkMwbDMzc0g2QmtkSnBVbDVtQ2QvZlpjMDVs?=
 =?utf-8?B?QVdFT0RMRjRWclg2WHREcTk0VDVmZG96MlhtMEc3eXJMRXliRVJoUnFoMm9r?=
 =?utf-8?B?c1NBa2JWOEpWaS9HUnlUS3Vmdy8rektiUGhtNWVqN2tQOUtBcjBFUTRidVY1?=
 =?utf-8?B?QUNvc3pKeXVPSHR0ejBVbjFKOFgzOCsrMnQwSXFGM2swUnFqQktRa3JjTk95?=
 =?utf-8?B?Rmt1ZGJ4NkYxSWRpQmdPeG9lMnl4T1BCSXFIU3ppTUVYWk9reTNKVHJVa3B6?=
 =?utf-8?B?SkFrT09FN2t6c0JqZmFncFk1NGRRS1FiUkZxSnluMHV6QzVTckNyS2FXcDgy?=
 =?utf-8?B?ZGdsSkhSVE1PbUFNaGxYNG9QQ3ZodEdleXFNN2hBYXNna0NkOGhXQTlTWmtW?=
 =?utf-8?B?UUZXckYydnFFTERvdHlTWHQ3Y2VmS280Zk5PYWhRTDRNYlBPTTRkNDBiLzBK?=
 =?utf-8?B?NU9DZVFoeHNORUt2NWFSNFVqNEhuWFM1NDI3U3RuZEZqVDZIR1RYZEJlU2tx?=
 =?utf-8?B?Q3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk9zRGVDeFpvTDllcXNzQ3cwdEhDZ3JmQVhYVk5XYklKVHliTW53bnArcVdM?=
 =?utf-8?B?ZE1tWTdReWF5aklPMnhlNE1iTEh0L1djWHZtb1kyWnZET0pBSGh2cTREbGtt?=
 =?utf-8?B?RzFkOVBQNGZTekFZWDh1V09vdk1yNVpiMlBYTGQ1YWREOFgxRGwvV1F6MW5t?=
 =?utf-8?B?Y0FsRGV6Tm9ENExENnUvelVWODZYdk1ibXE4dnJiRjZtbFgvK3dUWTd5amky?=
 =?utf-8?B?ZFFHRk9sN3lqZE1wdUZHRHY1ZzFPUWRpR0lDRWl4cXhFQjJqRmJWaGJmUDhj?=
 =?utf-8?B?Y0NjRTVKdlIrdXJxbTlOWTZ1Mncrc1FwZ1l0NTd4UmcvQkxGUm1UZklqM0J4?=
 =?utf-8?B?clpHbkJpNHdOV1lsZTRGOEdZUytSdWdmM0k2RlZsRm9oTGdmeml6YWphNGpD?=
 =?utf-8?B?YnFKcWQwdjVmem94cjlPR2d0VllUb05Xdkh0L3hwTUZ5ckN3ZDJuVktEYzVC?=
 =?utf-8?B?RlZURkVkVHh3RE1vaThsdWpJNFpLZ1l6U3QyVVBGTGpXRnFaZ1hoNEVjK2xo?=
 =?utf-8?B?aVdKclFyb0l5aTF0Nys2UVo3aEY5WUdxdmQ5T2JNc2JRMnpVZnZzYnY2T0Js?=
 =?utf-8?B?T0VrVTRLWlNucGROWElEYXpLbC9UZHpsRTBUZCtTYzI1UFFGVVJRVzRsV3FF?=
 =?utf-8?B?b0UyaE9JYnB1TTQ1YktEOUFId3VtZjFEakdQUmxXWXo3N25xd1dYZG5OUTdx?=
 =?utf-8?B?QmV1V1pIMkNBcDNScXVxK0E3RmhLNzgyMUxHK3g1eUdqK2pISWZuc0JXMkhO?=
 =?utf-8?B?cWV3RXM1dldreVRKYlY4OHdtbDR1N1pkRXo2MVpyNUJPby92ZitsN2FFUDBr?=
 =?utf-8?B?cHZmOWNJamt1UXliSEVRL3VFZHlTVm5LQk1iSnFkL0tyYU03c25MenNpNHdB?=
 =?utf-8?B?U3h3dExJUkZPTzF0YWE1VFpHYmJNdjJFUXZSQ2c4M3U5WnJlTUREYnVSbHNB?=
 =?utf-8?B?RnE3NkNOaEcwOSsxVUVxd0R6SFVzN09peVFEUmIxaGNaUnVFNWdGMHAvY1I2?=
 =?utf-8?B?VWlBT2tSRkZnMEtUV0FGbUZGR1o0SWhxV0FFenh4YUdFRlFxRlhTU0lVemt5?=
 =?utf-8?B?cTcvNTM2eEFxYWR2OFZNU2dnalFNNjZXSXpoU1hqUVVBUk9QTDk1elI1Ukkv?=
 =?utf-8?B?QjY0ZS9EVndyUloxZHdiU1cweXBjNk0rbHJEYy9ISUFTbFNPWnNEb2NZSmRW?=
 =?utf-8?B?eVdDeUEzMkxCaHhRVlMySnlxVDV6UzBockZBK0hIUDQrdlBjUURWRi9aMEFw?=
 =?utf-8?B?UUNsbE5FM1UzTzlPYnlWdDhjWWhMQjRDS25NR05RT1k0aGZrQllrM0w2K1Zj?=
 =?utf-8?B?K2pEQzVrL3o4Z2J6bEMybUh0Mk12NHJWcVo5eDV2K1A5MkpyVEpJUUMveHB4?=
 =?utf-8?B?L2h0b3pJdEtkeTVsOUxaaWVQQlgwcEM4WXZIQlZTcTZDWU5xQklVcWlyM21R?=
 =?utf-8?B?K3dENHRhT2VlaG9UNGkyWFFoWXlMVEJFakErcDAxSW5lOXNRaXlrS2pYZ1Fa?=
 =?utf-8?B?QlF1UDM1MzNYekp0ZXhyTDR1dWhReHovU1VPV2w4RW1MVmR4dzQwc2traXJJ?=
 =?utf-8?B?eGkvcjJlSUp1UFYwcUd6UFVqbEJMaXRHMVpDZFhaVFVLTGRMUGVtN0N2MFRp?=
 =?utf-8?B?OHNMOXgyTk1BUVhHYVFLT2ZvMHZJYTZNOTl5OUYxNHF2aUpyaktyQXRQTzR5?=
 =?utf-8?B?RHNWTi9OZG52RC9zTVg3YmgxNmppdkJkVXhLSzdsam1lTjV6eGdhbUhTTkZs?=
 =?utf-8?B?Q0ZpSG5jMkpJR05IazlHTS9mV0luQ1Qxdm5CQTFLRjZYMEFUNEZEREQrbk95?=
 =?utf-8?B?eTZlc0tHOTV0V2x5TE10ZDJhMkNIRUhvK0l0bjVucFpnV09kTlRJc2Z1cnJ1?=
 =?utf-8?B?QlQ5dTI5bkFSTERCVFZJV2tRR2JXclRlNVNoNzJhcHllMytPQVdtSDhMUmpz?=
 =?utf-8?B?VWdseDBseWJrbTJuWUFldDdUa1pjT3V3M3N3L2krbW5kaTFMbWxmTGpncGlB?=
 =?utf-8?B?a2hPeHdRWDZNTEFrbmwybVRRV2FOejdicEhtcStCT1hPd05hR3U5czJIbFRn?=
 =?utf-8?B?aTBUYnAvbkZORWE0RGVzNVM2K1R5Y2R5S1Z3VFpZSUVNV0dQRkZ3cnU3bGh6?=
 =?utf-8?B?YXM3MXhGMVlQc1hDYndIb2hGbjZQRVhaVEhYVTEycGlwWmIvREhYTnJGMHcr?=
 =?utf-8?B?K3FoWGV3T0RtVlZPUXA4RWZBYXlGQS9aNkV3Z3N1MVBoaHNTWEtseVB1VU0y?=
 =?utf-8?B?U09lalQxZm9BWHBhdFVOdXU5RGNTWllyamI0REZCM1dZdGZrdXU3Y0E4KzBq?=
 =?utf-8?B?ckdub2JVUmNvZEU1R1ZFRmZvd3REdW9Qb3JsNTN1Z0FPektoNjFlbUNidDBB?=
 =?utf-8?Q?79DDgzse7N3jW82b6f30Yc3Df1mcpCRpUxkq25YqVweZY?=
X-MS-Exchange-AntiSpam-MessageData-1: pHe9LELjzZfT6A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321a646d-c990-4bdd-7c21-08de6d321bf9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:05:11.9772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwwc4P2gCyHFgh/cWIg9yOvuA+HE7N9AqZyKYWwsUfwLhnOg7qqvTzfPsZie2hI6cwLS1CCLgfJMb3ipQ2oyvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6832

This feature is stable since 1.89, and used in subsequent patches.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs     | 3 +++
 scripts/Makefile.build | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4ee..cddeae8b6cb2 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -37,6 +37,9 @@
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
 //
+// Stable since Rust 1.89.0.
+#![feature(generic_arg_infer)]
+//
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 //
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 32e209bc7985..923886735299 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -314,12 +314,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
 #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
+#   - Stable since Rust 1.89.0: `feature(generic_arg_infer)`.
 #   - Expected to become stable: `feature(arbitrary_self_types)`.
 #   - To be determined: `feature(used_with_arg)`.
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,generic_arg_infer,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

-- 
2.53.0

