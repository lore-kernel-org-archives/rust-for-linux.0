Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E158F3A0B29;
	Tue, 24 Feb 2026 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942968; cv=fail; b=tW1RuW8AU4TSuv/5wq7Vz+m0q5PpLNYlTTmgtiFhE9Los7IoFgjhzYz/7qTuivzAI/+wK1hGVE6bBHb5w4hBmlj/k84En9gb6EM/eRpLwEMkDDXI0n4GTtkYuCPKBPgcr3u8xvY+5xya7+PLzbHKrhyZqb8JU7fma3DOastdKSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942968; c=relaxed/simple;
	bh=1t41KhOGMrCuvNQzZPYAxm6BbF/tPWND49QvJ9YbdwQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=V9ebGiW0/EjGM9kbnJGk6x6iVu9f9uLye5LJfIlVa1K5NfiShNOOT9Xv1I5hDrUmf4qUxyXOjgo8XNDmHfOz31LHFcD02oD/lMqLkbkqD5gxpOjSa2w35iBq8vMEeNZwBq/vpjMcoT+FKPNj20CsecpQzAIu00zXk2Q1LupeMHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NmJnkheI; arc=fail smtp.client-ip=40.93.194.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NmJnkheI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8Rt1NaxzoTEUsO19fv60ShP0QbCJf9rjYQegzqymXPCy6RtS62+224WbZnPb7EPIH7j3NqQHUVvh+XttUZbcY4TuQP+k7/8R6WPnKfh3HIjapUoZDer8rxw0OYqOZowxGDbLzNBeFmKMNM8HXJLcQTbLh//QLjJWN22xDhBkoxJYShYMmiqptXeWXdCbtcasrDNWnUpIC5MGeHtDH86fC2TKdrnYC4orhwHTTgH8pwwedGWKMqwJj+QhAOOBzcu3CswcsBRnsszF2GY0FM5GnIqFph7c2WRSzhAzZ946qUK3GcrtgVElAX78UjzuyHzAGBWCZg1wYCtis40O+68hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crjP7qZHploSN/6qwQRhwleK98enPPXENR8gQor8DP8=;
 b=jMqHEWxrlV1qa19TrnPzQerW+nSZEJ1zImCIv3YmF1F6yzBpJ3ziV/Lk+pB+uZq133kDLAFPhSW3uC3tlRsSlVWCvm69DxxE/DQtEtGY83+71rMf3T9Ojz85DTLxmWuNW7eqLmnNPqqeGDTwF0d7XMK7z3Q/OjypGsrTBw68FjQKJOS6MVWhwGJDg+pQZ6yugP5JMss7MODpen2vX1Dq5pm7lkR76bwcMaHPDyu1X8TsIE6UBibOg6P7hN6HNrj27kAWIZjp8fJrmZOQgd1DOcnx9IKA7KKinQasc1T6krd7iopjrXkQiwAAJ28VKdUqFG6mAyVYYF/A+TApktnaGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crjP7qZHploSN/6qwQRhwleK98enPPXENR8gQor8DP8=;
 b=NmJnkheIUb/g48cdzPtfjARVQBEiq/NHaF/GtTKs+1gqcZRpHQpn7Cj3038dW5QMKCShBR4h9Of+xWlib1IfD0d1DIcixkNKvgXSomqqqmphVw0BAoQGSPgl6Rzid9lKnsiWdy6VsYyikYxcIANqVXqcRGivGBw45oNcwRrWSlwlN9cfbrhvUYKALfpNH/y5kQ7QDb26n50Ihf9hWqZYck8Mu/53h91geMWXWzKkb+/LOtWVnuvpdnLidEbYLN8DXUv42aMCk2yZDhJx9mKfp8UpaBk2WBICrBlyJg71TAz86l5z5cqJRhhNKDF+zMVr2QxXUaDa0dztLnaqJUl3Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7811.namprd12.prod.outlook.com (2603:10b6:806:34f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:22:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:22:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 24 Feb 2026 23:21:45 +0900
Subject: [PATCH v7 07/10] rust: io: add `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-register-v7-7-aad44f760f33@nvidia.com>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
In-Reply-To: <20260224-register-v7-0-aad44f760f33@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0162.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5197bd-3af9-481e-c646-08de73b026fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmpYMVo2N1hHSmhFeUVLcVBtV3BBSzNnNnYvdDhWdzNGQmZ3bm9TYkpLTnBV?=
 =?utf-8?B?bHgzcjlIcXBxTmdwZUxlL1BMWlMzbHAwcFc5MXFzVnFoeWZIcm5iMTBlYTA1?=
 =?utf-8?B?dzhIK3RXYjFYdm5BaSs3bFF2N0x0dUkvL0VPTFovQnVoWWVocW1Nbk1EUENB?=
 =?utf-8?B?dnhYbEtlbkViTmxDQVhFVU8rY043NUthRzFzOVpTb0dLT2tieVBNNHVabVh3?=
 =?utf-8?B?Sk5lU0YyOUdkN2F4elg0azBJeE5zSS9rSExKZnltUm0zOXJsWUdwZnJqaDFC?=
 =?utf-8?B?aVRiYXduNEt5Qk5lOFRHQ3FxZ1Awem9DdGovamhpSnRWR0V1NVlydUd2V2hI?=
 =?utf-8?B?ZS81OGhHSDVsMVJsaGZUZDA5N2tHdXdWSVZxVHB6RnArVjBVQVlvUzFVb2hW?=
 =?utf-8?B?MmFaWTNqa1BIdlNsM3kvNXlYbUlmQm5SQ21ubHI0TDQrTFNwdU94dmdVd0Jj?=
 =?utf-8?B?VXNhUCthSGc5eUZYTnY1c29qL2FkWkRBSE9sYUprZ0dPdkxJOHdUOXkwL3FZ?=
 =?utf-8?B?SXhFQWM2YUVoNlpiNUZOK1hvZklHZmFoNzFqRGFwdWNudnBxMHFLa0VvZlND?=
 =?utf-8?B?UWlSNy9waUljRVUrYW1neHFPNTJ5OHhJN0x0L0wra2s2UW53K1Bja0VybW83?=
 =?utf-8?B?MmxjMEJRWGhpSmxxMVY5WnBLN1A0RzJ4SDdmK2dhUHMyTHI4ZFNobEUxZ2Vp?=
 =?utf-8?B?WUpBVmpWR1VhWUNjWCtPMGRKdzdDWlg0aEt0YVFZMU4yTC9rcVZ6ZW80QVVE?=
 =?utf-8?B?MU5jZU5PY0dmeER5bmJvYXZuVzRHSTZQWjVEK3dTN3dKSDBuTXBGYnFHMmpo?=
 =?utf-8?B?SXovS0pBbW5hT0tnR0ljQk9mV1VQK1k3K1FlcW5pVi90eThyaDB5T0Y5aDl1?=
 =?utf-8?B?Z0RhemR4SGQyajZLN3N5eUlITjhzdHhEb093U2FKNTlZMkZpajlkTk42bWMr?=
 =?utf-8?B?NFFXbTFUSG1EWkFhM09sWHJxVDFwVVVkbVM4Uk4xVHVES0ZXMDAvUXhaREhR?=
 =?utf-8?B?RDJkT1ZTOGhjVjBXbENNNTdQdmdBcmVQUWZoTjU2dDQ0bEFIall1VXdNNVBL?=
 =?utf-8?B?UFp4WERWMzlDL0pzMzdWUTM3cFVMYWw3YkFnOFNkcDMwUEloRUsxRVNHZ3k1?=
 =?utf-8?B?Q09ZcGtWb2szbFZueGxYc1k1UFpUWFI2ZGkrN2pvbzlBZjlKMHNvaHltTkdx?=
 =?utf-8?B?Q0JyV0NOM2tZRmN6TlF4SjIwVVBNZWdIM1dpK3M2MFRudnZiNGNWcUZEZlA1?=
 =?utf-8?B?TS95UWZNWjZ3TTc5QzgxOFVhZlF1eGlpL3l0bE9tWlRlMmM4R29TWUZNdlZk?=
 =?utf-8?B?ZnFNYVJyb0l6MHdDcGZWbWNDRWJjd2psVHg3NklKSlJmaCtsbTg2KyttM29S?=
 =?utf-8?B?V0QrQTdCRmdDSElHWmtCSXJqbmdkWCtEc3RLdWkvZ09jWFRZWVhMRlpvZ2du?=
 =?utf-8?B?U2hXK3libGpLdGNzbG91OG5ZaDI2WCtsZDNJMzRFN1NrNmVtSlFVbTU3cHhS?=
 =?utf-8?B?ZFVGckw0ZnlYSTRCNndkZk40ZVd0ZW5ha1N5cjJia09seXlaMGVWTndZTDkv?=
 =?utf-8?B?MEdWUUZuKy8vL2RqREljL2xUdWUvNW53N0FuZkRydWtiQi9nWjUzYmFQcGdn?=
 =?utf-8?B?ZXVJMnp1T2JGMVZtb3lXbE9JTjRGUndvc25qYzl0U3RNcDFMVlFFVFlvTUda?=
 =?utf-8?B?YzFRMi9KczFxWUhYeVBWUE8xNGpTL0ZpeHBUbEdmaU9xYnA5MUxGVmVGK3J6?=
 =?utf-8?B?SkFndE1VWk9EZHgyeitWeGxoc0kwVHFuakRxUE1LT0kzSUlvQldHTzBYdnJ2?=
 =?utf-8?B?bHJGeC9BVENKVDBpRnd0KytaWE1XV0JtcWJLREdVVzZ3em9qci94anpzbDlz?=
 =?utf-8?B?MXlRNDFLYmZWRVEyVU1wMHdrTW1qckJEemxsaENQMDVMR2gzUlZ1emhKcXdQ?=
 =?utf-8?B?WmpjOFM0NjlaeitSM08wdGZWd1pWSkZDRlZ2SWJWM3krTmRoTWtNc01YV1ZN?=
 =?utf-8?B?YXp3YmVxS0Q5ZkVvcW4rcEo3Q0l2YSs2TzNyQVFWbTFVcDM0MWdEMitpcWti?=
 =?utf-8?B?OEV6dkhNQlhZcS80TU1aNGVMVG81MWJpMTVGYWtsektJeTJITUlzUk1wWG14?=
 =?utf-8?B?MHpTUmg2dzY1cVhJT2VqOEFjdlJBdTIzajFLZHZuMFUvUFVsL0ZTVUlMaVZ0?=
 =?utf-8?Q?CHg4Ehh/wTxhzV6takaX/3I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTJ1dXdlb0FWK2dRSWV4UFJ0eUxBUVUrR1I0dnJxVWlUQVJSZXlZLytiWnNF?=
 =?utf-8?B?am5zZG8vS3hNOXF6dS9ZbWJUQVk5Y0xlNVNESXMyeHoyaThYb1hUcVRkWjFZ?=
 =?utf-8?B?czJ5S3R3eWpXRjBtRHVBdUZkMjJUL1QwdWlqR1hBYkdNdEdENk1ySi9iK1p4?=
 =?utf-8?B?Rmg0bHJlQUFUOEpLWXFlVWZoZjZBL3FBUVJnYmk0ZnNRc3VrSXlrZHliVTBQ?=
 =?utf-8?B?SGFsMHZYRGloNGU5UW11YUxKbUpUSEJUeDBadE92UzJhV1hQbElBc01YQWhW?=
 =?utf-8?B?NlduZEk2dHVubXk4OGxsa3ZNd2tQTE9KejRQQ3pZeFlGS1A3WUhRb1JiREVY?=
 =?utf-8?B?dW1CZWZ3ZlhBc1VCQnhsVHp0cDhaWWtLSGFrbk55c1FtRXpQRHRFTHJ5SFh0?=
 =?utf-8?B?TXlZWWFOWFYzMkJRWWZPSFhHc0ZCbVpGSWtBVnJ5ajdlMy9nR00vZ2lFOEtC?=
 =?utf-8?B?Mnl1ZTQ4bTd0TnVQQUorekZCY3pWK0F5WitMK1hCOGNhZ0MrTWVudW1Vck1l?=
 =?utf-8?B?aXByaHg2TDRVc2R0REppUlk1bVRCMk1GV0VQcGZON3dBS3dwdmRIckxQbWU0?=
 =?utf-8?B?eGZiSk9EZUZWTzBGd1FDdFhoUExNWDZVSElISUd5cXgyNjNZM0dNTm5uckha?=
 =?utf-8?B?R0wvWTMvVTBTS3JaN0VlL21XdGVTN2hQMlUvYS9PUXZPN3F1dmdvQnhjd1Vt?=
 =?utf-8?B?MmM4cExjWEQxTkNwM2NXaWZjTC8wM0I2UDRVNEFxOWVsbkFrL2ZQaEo3TFBv?=
 =?utf-8?B?RXRGdjF2cFg1c2JVWjBxMVlGMDVRVStDdGFaT1BqYUxRVU5jcWVpT0tlUTJK?=
 =?utf-8?B?TW1DSkRVT0xTdG10QTBYbWZmOWZhalorWGtyNldYVU5PMWNpaVY5dm1vZTVq?=
 =?utf-8?B?dzJmaXdSK1IxVUx6Mi9WV1VxQTNWOEtnV1czWHBBU1V6REJrT0p6ckRsUTR5?=
 =?utf-8?B?VHFCbDA2ZFN4SVBRTlhEUjZWN1dUNGJtdW9BcnlJOENNaHo0Z0piemtWK3hL?=
 =?utf-8?B?SG1BQkRONnRKdDBTZ0dWUXhnM01heFVVYzVnR1E4VXMxWWk2NDNKai9KKzVs?=
 =?utf-8?B?eDZJdXVneE5QbXBSc29HSWl6UEpsSXhwK2ZjNlVSUDRHd2M0T2NDbzNBUFV4?=
 =?utf-8?B?bHF2SkloYjNxNmZLN2F3dWhpaHlySmMzK0lyczNqMWduUzZPVkZFdHpIYzVl?=
 =?utf-8?B?VURFTi9pQUk4YzEvWkpVWnNmZXFQRStpNFJxTlZnek0wZUozT01qb0dRdjY0?=
 =?utf-8?B?THlsM2JjelMxRVdDdmJHNUtvaHdoemY4M2x5MTdKaEJQQ2c2Tzk5VWJhb0Y2?=
 =?utf-8?B?VGR1VnAyeHVHalFjZS84Mk9HWVpBdlF2Y09MYlBXWkM1SSt0cXFjdHEzajhZ?=
 =?utf-8?B?N3ZIWFBaOExmZVdocVNLSVRMT3BoNzZrK2h1U1V0RjVZRHdIZjNHd0J5dnJX?=
 =?utf-8?B?L2thV2VZeDBMZ21LY2NLanJyNTdxK3RlRGFBSjMxWG15RnAzSjdSY3dsbGZU?=
 =?utf-8?B?cVpVWUlqNXRwOThHRy9lTDQ2aUJib3U4NDI5bllSdFdpRVhvR1F5bjZ4ZkFP?=
 =?utf-8?B?NGlXQ1pMOXh3d3N6UlZ4cHVOWVVCRVpjL1orcDQ1aGlQck9MOCswNTluTDJz?=
 =?utf-8?B?KzY5SHdtQlh0MFJsOGZKZForYWxqMEluRGRoUXNtanowZWlKTmViZGZRNGtO?=
 =?utf-8?B?WWRWYTFFMktzOVQvZVFxL0pCQ3lNTUdxeS95TEdwVTJuYzQ3S2pJRTRKOFBx?=
 =?utf-8?B?dG5FbzJJeVplVjdwU3drdnFBVjRiVGhOcngycE5yTFpVL2M2T29YRXFOMUNK?=
 =?utf-8?B?MTFONGlVSlFGY0tJSlhkdVdKQ0VsaFM1Ly8xYi9uSmhPYi9hUjZreEIrN3Rp?=
 =?utf-8?B?UHJkU1FYSXNRT0dsMTBOSFpzamkvQXNlTXZMVjRKK3lPUlNtdS9DaVhlUm1n?=
 =?utf-8?B?R0lDN0tscjlxVnJDOWE0QWVDQXA3c0FLZ0d6N0tXOVc5OHFmQS9mZ0t6M3BY?=
 =?utf-8?B?NjNRZVBpTVVWeXJlTTZyTmQ3YXFSNWtSQ0V2RExvK2lwUXVMNkdzMXU1RlpH?=
 =?utf-8?B?QTZadU5rT0dLaVNrRU0rMjYxaDArT2plQ2h0bm5yUUpqbXB1TFJ5T2ozZ3Nj?=
 =?utf-8?B?cEhhVDljMkNSanY3dkVhZ3JOSS9wSjEyQTBhTGFLaGpkNkNveDFNUVFmNDh1?=
 =?utf-8?B?OSttOG44TmF2R0J1Q0J0dGN4dVRYZDZxNnVUZ2RVczBOb0ZydDhTNnR1QWxC?=
 =?utf-8?B?R2tzQ1oyOE9KWStiYys1S0drWU53THI1a3ZpWVNSbHRXZjZpNFN3QTBsSE5L?=
 =?utf-8?B?ZnZUc0RPM0xiZ3A3Y3dMSGc3SXQrdDNXS0huMlc2eC8yQ3dvSTM3UU5YWFFF?=
 =?utf-8?Q?yWu4dajw3eHQ4s/Zz8nxGUBcgC13qtYTbIUnvk+IlSk6W?=
X-MS-Exchange-AntiSpam-MessageData-1: eiucoW7XfsDPig==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5197bd-3af9-481e-c646-08de73b026fb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:22:34.1783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /10xs/iHgCGOgq6xquVbZ0rZJiZcpd5bn92qO3A3LhA7JoZF8jPoMLNMkpmd339R5/GD9wAzwiVBeoEbST2XSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7811

Add a macro for defining hardware register types with I/O accessors.

Each register field is represented as a `Bounded` of the appropriate bit
width, ensuring field values are never silently truncated.

Fields can optionally be converted to/from custom types, either fallibly
or infallibly.

The address of registers can be direct, relative, or indexed, supporting
most of the patterns in which registers are arranged.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/all/20250306222336.23482-6-dakr@kernel.org/
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs          |    5 +-
 rust/kernel/io/register.rs | 1125 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1129 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 256eba16ccc8..690c25de979d 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -11,6 +11,7 @@
 
 pub mod mem;
 pub mod poll;
+pub mod register;
 pub mod resource;
 
 pub use resource::Resource;
@@ -177,7 +178,7 @@ pub trait IoCapable<T> {
 ///
 /// This trait is the key abstraction allowing [`Io::read`], [`Io::write`], and [`Io::update`]
 /// to work uniformly with both raw `usize` offsets (for primitive types like `u32`) and typed
-/// ones.
+/// ones (like those generated by the [`register!`] macro).
 ///
 /// An `IoLoc<T>` carries three pieces of information:
 ///
@@ -192,6 +193,8 @@ pub trait IoCapable<T> {
 /// An `IoLoc` can be passed directly to [`Io::read`] or [`Io::try_read`] to obtain a value, or
 /// turned into an [`IoWrite`] via [`IoLoc::set`] to be passed to [`Io::write`] or
 /// [`Io::try_write`].
+///
+/// [`register!`]: kernel::register!
 pub trait IoLoc<T>: Copy
 where
     T: Into<Self::IoType>,
diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
new file mode 100644
index 000000000000..498cb3b9dfb5
--- /dev/null
+++ b/rust/kernel/io/register.rs
@@ -0,0 +1,1125 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A macro to define register layout and accessors.
+//!
+//! A single register typically includes several fields, which are accessed through a combination
+//! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
+//! not all possible field values are necessarily valid.
+//!
+//! The [`register!`] macro in this module provides an intuitive and readable syntax for defining a
+//! dedicated type for each register. Each such type comes with its own field accessors that can
+//! return an error if a field's value is invalid.
+//!
+//! [`register!`]: kernel::register!
+
+use core::marker::PhantomData;
+
+use crate::io::IoLoc;
+
+/// Trait providing a base address to be added to the offset of a relative register to obtain
+/// its actual offset.
+///
+/// The `T` generic argument is used to distinguish which base to use, in case a type provides
+/// several bases. It is given to the `register!` macro to restrict the use of the register to
+/// implementors of this particular variant.
+pub trait RegisterBase<T> {
+    /// Base address to which register offsets are added.
+    const BASE: usize;
+}
+
+/// Trait implemented by all registers.
+pub trait Register: Copy {
+    /// Backing primitive type of the register.
+    type Storage;
+}
+
+/// Trait implemented by registers with a fixed offset.
+pub trait FixedRegister: Register {
+    /// Offset of the register.
+    const OFFSET: usize;
+}
+
+/// Location of a fixed register.
+#[derive(Clone, Copy)]
+pub struct FixedRegisterLoc<T: FixedRegister>(PhantomData<T>);
+
+impl<T: FixedRegister> FixedRegisterLoc<T> {
+    /// Returns the location of `T`.
+    #[inline(always)]
+    // We do not implement `Default` so we can be const.
+    #[allow(clippy::new_without_default)]
+    pub const fn new() -> Self {
+        Self(PhantomData)
+    }
+}
+
+impl<T> IoLoc<T> for FixedRegisterLoc<T>
+where
+    T: FixedRegister + From<T::Storage> + Into<T::Storage>,
+{
+    type IoType = T::Storage;
+
+    fn offset(self) -> usize {
+        T::OFFSET
+    }
+}
+
+/// Trait implemented by relative registers.
+pub trait RelativeRegister: Register {
+    /// Family of bases applicable to this register.
+    type BaseFamily;
+
+    /// Offset of the register relative to its base.
+    const OFFSET: usize;
+}
+
+/// Location of a relative register.
+///
+/// This can either be an immediately accessible regular [`RelativeRegister`], or a
+/// [`RelativeRegisterArray`] that needs one additional resolution through
+/// [`RelativeRegisterLoc::at`].
+pub struct RelativeRegisterLoc<T, B: ?Sized>(PhantomData<T>, PhantomData<B>);
+
+// `Clone` and `Copy` unfortunately cannot be derived without requiring `B` to also implement them.
+impl<T, B> Clone for RelativeRegisterLoc<T, B>
+where
+    B: ?Sized,
+{
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<T, B> Copy for RelativeRegisterLoc<T, B> where B: ?Sized {}
+
+impl<T, B> RelativeRegisterLoc<T, B>
+where
+    B: ?Sized,
+{
+    /// Returns the location of a relative register or register array.
+    #[inline(always)]
+    // We do not implement `Default` so we can be const.
+    #[allow(clippy::new_without_default)]
+    pub const fn new() -> Self {
+        Self(PhantomData, PhantomData)
+    }
+}
+
+impl<T, B> IoLoc<T> for RelativeRegisterLoc<T, B>
+where
+    T: RelativeRegister + From<T::Storage> + Into<T::Storage>,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    type IoType = T::Storage;
+
+    fn offset(self) -> usize {
+        B::BASE + T::OFFSET
+    }
+}
+
+/// Trait implemented by arrays of registers.
+pub trait RegisterArray: Register {
+    /// Start offset of the registers array.
+    const OFFSET: usize;
+    /// Number of elements in the registers array.
+    const SIZE: usize;
+    /// Number of bytes between the start of elements in the registers array.
+    const STRIDE: usize;
+}
+
+/// Location of an array register.
+#[derive(Clone, Copy)]
+pub struct RegisterArrayLoc<T: RegisterArray>(usize, PhantomData<T>);
+
+impl<T: RegisterArray> RegisterArrayLoc<T> {
+    /// Returns the location of register `T` at position `idx`, with build-time validation.
+    #[inline(always)]
+    pub fn new(idx: usize) -> Self {
+        ::kernel::build_assert!(idx < T::SIZE);
+
+        Self(idx, PhantomData)
+    }
+
+    /// Attempts to return the location of register `T` at position `idx`, with runtime validation.
+    #[inline(always)]
+    pub fn try_new(idx: usize) -> Option<Self> {
+        if idx < T::SIZE {
+            Some(Self(idx, PhantomData))
+        } else {
+            None
+        }
+    }
+}
+
+impl<T> IoLoc<T> for RegisterArrayLoc<T>
+where
+    T: RegisterArray + From<T::Storage> + Into<T::Storage>,
+{
+    type IoType = T::Storage;
+
+    fn offset(self) -> usize {
+        T::OFFSET + self.0 * T::STRIDE
+    }
+}
+
+/// Trait implemented by arrays of relative registers.
+pub trait RelativeRegisterArray: Register {
+    /// Family of bases applicable to this register array.
+    type BaseFamily;
+
+    /// Offset of the registers array relative to its base.
+    const OFFSET: usize;
+    /// Number of elements in the registers array.
+    const SIZE: usize;
+    /// Number of bytes between each element in the registers array.
+    const STRIDE: usize;
+}
+
+/// Location to a relative array register.
+pub struct RelativeRegisterArrayLoc<
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+>(usize, PhantomData<T>, PhantomData<B>);
+
+// `Clone` and `Copy` unfortunately cannot be derived without requiring `B` to also implement them.
+impl<T, B> Clone for RelativeRegisterArrayLoc<T, B>
+where
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<T, B> Copy for RelativeRegisterArrayLoc<T, B>
+where
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+}
+
+impl<T, B> RelativeRegisterArrayLoc<T, B>
+where
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    /// Returns the location of register `T` from the base `B` at index `idx`, with build-time
+    /// validation.
+    #[inline(always)]
+    pub fn new(idx: usize) -> Self {
+        ::kernel::build_assert!(idx < T::SIZE);
+
+        Self(idx, PhantomData, PhantomData)
+    }
+
+    /// Attempts to return the location of register `T` from the base `B` at index `idx`, with
+    /// runtime validation.
+    #[inline(always)]
+    pub fn try_new(idx: usize) -> Option<Self> {
+        if idx < T::SIZE {
+            Some(Self(idx, PhantomData, PhantomData))
+        } else {
+            None
+        }
+    }
+}
+
+/// Methods exclusive to [`RelativeRegisterLoc`]s created with a [`RelativeRegisterArray`].
+impl<T, B> RelativeRegisterLoc<T, B>
+where
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    /// Returns the location of the register at position `idx`, with build-time validation.
+    #[inline(always)]
+    pub fn at(self, idx: usize) -> RelativeRegisterArrayLoc<T, B> {
+        RelativeRegisterArrayLoc::new(idx)
+    }
+
+    /// Attempts to return the location of the register at position `idx`, with runtime validation.
+    #[inline(always)]
+    pub fn try_at(self, idx: usize) -> Option<RelativeRegisterArrayLoc<T, B>> {
+        RelativeRegisterArrayLoc::try_new(idx)
+    }
+}
+
+impl<T, B> IoLoc<T> for RelativeRegisterArrayLoc<T, B>
+where
+    T: RelativeRegisterArray + From<T::Storage> + Into<T::Storage>,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    type IoType = T::Storage;
+
+    fn offset(self) -> usize {
+        B::BASE + T::OFFSET + self.0 * T::STRIDE
+    }
+}
+
+/// Defines a dedicated type for a register, including getter and setter methods for its fields and
+/// methods to read and write it from an [`Io`](kernel::io::Io) region.
+///
+/// # Example
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     /// Basic information about the chip.
+///     pub BOOT_0(u32) @ 0x00000100 {
+///         /// Vendor ID.
+///         15:8 vendor_id;
+///         /// Major revision of the chip.
+///         7:4 major_revision;
+///         /// Minor revision of the chip.
+///         3:0 minor_revision;
+///     }
+/// }
+/// ```
+///
+/// This defines a 32-bit `BOOT_0` type which can be read from or written to offset `0x100` of an
+/// `Io` region, with the described fields. For instance, `minor_revision` consists of the 4 least
+/// significant bits of the type.
+///
+/// Fields are instances of [`Bounded`](kernel::num::Bounded) and can be read by calling their
+/// getter method, which is named after them. They also have setter methods prefixed with `with_`
+/// for runtime values and `with_const_` for constant values. All setters return the updated
+/// register value.
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::io::IoLoc;
+/// use kernel::num::Bounded;
+///
+/// # register! {
+/// #     pub BOOT_0(u32) @ 0x00000100 {
+/// #         15:8 vendor_id;
+/// #         7:4 major_revision;
+/// #         3:0 minor_revision;
+/// #     }
+/// # }
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: T) {
+/// # fn obtain_vendor_id() -> u8 { 0xff }
+/// // Read from the register's defined offset (0x100).
+/// let boot0 = bar.read(BOOT_0);
+/// pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot0.minor_revision().get());
+///
+/// // Update some fields and write the new value back.
+/// bar.write(BOOT_0.set(boot0
+///     // Constant values.
+///     .with_const_major_revision::<3>()
+///     .with_const_minor_revision::<10>()
+///     // Run-time value.
+///     .with_vendor_id(obtain_vendor_id())
+/// ));
+///
+/// // Or, build a new value from zero and write it:
+/// bar.write(BOOT_0.init(|r| r
+///     .with_const_major_revision::<3>()
+///     .with_const_minor_revision::<10>()
+///     .with_vendor_id(obtain_vendor_id())
+/// ));
+///
+/// // Or, read and update the register in a single step.
+/// bar.update(BOOT_0, |r| r
+///     .with_const_major_revision::<3>()
+///     .with_const_minor_revision::<10>()
+///     .with_vendor_id(obtain_vendor_id())
+/// );
+///
+/// // Constant values can also be built using the const setters.
+/// const V: BOOT_0 = pin_init::zeroed::<BOOT_0>()
+///     .with_const_major_revision::<3>()
+///     .with_const_minor_revision::<10>();
+/// # }
+/// ```
+///
+/// Fields can also be transparently converted from/to an arbitrary type by using the `=>` and
+/// `?=>` syntaxes.
+///
+/// If present, doc comments above register or fields definitions are added to the relevant item
+/// they document (the register type itself, or the field's setter and getter methods).
+///
+/// Note that multiple registers can be defined in a single `register!` invocation. This can be
+/// useful to group related registers together.
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     pub BOOT_0(u8) @ 0x00000100 {
+///         7:4 major_revision;
+///         3:0 minor_revision;
+///     }
+///
+///     pub BOOT_1(u8) @ 0x00000101 {
+///         7:5 num_threads;
+///         4:0 num_cores;
+///     }
+/// };
+/// ```
+///
+/// It is possible to create an alias of an existing register with new field definitions by using
+/// the `=> ALIAS` syntax. This is useful for cases where a register's interpretation depends on
+/// the context:
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     /// Scratch register.
+///     pub SCRATCH(u32) @ 0x00000200 {
+///         /// Raw value.
+///         31:0 value;
+///     }
+///
+///     /// Boot status of the firmware.
+///     pub SCRATCH_BOOT_STATUS(u32) => SCRATCH {
+///         /// Whether the firmware has completed booting.
+///         0:0 completed;
+///     }
+/// }
+/// ```
+///
+/// In this example, `SCRATCH_BOOT_STATUS` uses the same I/O address as `SCRATCH`, while also
+/// providing its own `completed` field.
+///
+/// ## Relative registers
+///
+/// A register can be defined as being accessible from a fixed offset of a provided base. For
+/// instance, imagine the following I/O space:
+///
+/// ```text
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///  0x100--->+------------CPU0-------------+
+///           |                             |
+///  0x110--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///           |                             |
+///  0x200--->+------------CPU1-------------+
+///           |                             |
+///  0x210--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           +-----------------------------+
+/// ```
+///
+/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at offset `0x10` of their I/O
+/// space segment. Since both instances of `CPU_CTL` share the same layout, we don't want to define
+/// them twice and would prefer a way to select which one to use from a single definition.
+///
+/// This can be done using the `Base + Offset` syntax when specifying the register's address.
+///
+/// `Base` is an arbitrary type (typically a ZST) to be used as a generic parameter of the
+/// [`RegisterBase`] trait to provide the base as a constant, i.e. each type providing a base for
+/// this register needs to implement `RegisterBase<Base>`. Here is the above example translated
+/// into code:
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::io::register::RegisterBase;
+///
+/// // Type used to identify the base.
+/// pub struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: T) {
+/// // This makes `CPU_CTL` accessible from all implementors of `RegisterBase<CpuCtlBase>`.
+/// register! {
+///     /// CPU core control.
+///     pub CPU_CTL(u32) @ CpuCtlBase + 0x10 {
+///         /// Start the CPU core.
+///         0:0 start;
+///     }
+/// }
+///
+/// // Start `Cpu0`.
+/// bar.update(CPU_CTL::of::<Cpu0>(), |r| r.with_start(true));
+///
+/// // Start `Cpu1`.
+/// bar.update(CPU_CTL::of::<Cpu1>(), |r| r.with_start(true));
+///
+/// // Aliases can also be defined for relative register.
+/// register! {
+///     /// Alias to CPU core control.
+///     pub CPU_CTL_ALIAS(u32) => CpuCtlBase + CPU_CTL {
+///         /// Start the aliased CPU core.
+///         1:1 alias_start;
+///     }
+/// }
+///
+/// // Start the aliased `CPU0`.
+/// bar.update(CPU_CTL_ALIAS::of::<Cpu0>(), |r| r.with_alias_start(true));
+/// # }
+/// ```
+///
+/// ## Arrays of registers
+///
+/// Some I/O areas contain consecutive registers that share the same field layout. These areas can
+/// be defined as an array of identical registers, allowing them to be accessed by index with
+/// compile-time or runtime bound checking. Simply specify their size inside `[` and `]` brackets,
+/// and use the `at` method to obtain the correct location:
+///
+/// ```no_run
+/// use kernel::register;
+///
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: T)
+/// #     -> Result<(), Error>{
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Array of 64 consecutive registers with the same layout starting at offset `0x80`.
+/// register! {
+///     /// Scratch registers.
+///     pub SCRATCH(u32)[64] @ 0x00000080 {
+///         31:0 value;
+///     }
+/// }
+///
+/// // Read scratch register 0, i.e. I/O address `0x80`.
+/// let scratch_0 = bar.read(SCRATCH::at(0)).value();
+/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
+/// let scratch_15 = bar.read(SCRATCH::at(15)).value();
+///
+/// // This is out of bounds and won't build.
+/// // let scratch_128 = bar.read(SCRATCH::at(128)).value();
+///
+/// // Runtime-obtained array index.
+/// let idx = get_scratch_idx();
+/// // Access on a runtime index returns an error if it is out-of-bounds.
+/// let some_scratch = bar.read(SCRATCH::try_at(idx).ok_or(EINVAL)?).value();
+///
+/// // Alias to a particular register in an array.
+/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
+/// register! {
+///     /// Firmware exit status code.
+///     pub FIRMWARE_STATUS(u32) => SCRATCH[8] {
+///         7:0 status;
+///     }
+/// }
+/// let status = bar.read(FIRMWARE_STATUS).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register! {
+///     /// Scratch registers bank 0.
+///     pub SCRATCH_INTERLEAVED_0(u32)[16, stride = 8] @ 0x000000c0 {
+///         31:0 value;
+///     }
+///
+///     /// Scratch registers bank 1.
+///     pub SCRATCH_INTERLEAVED_1(u32)[16, stride = 8] @ 0x000000c4 {
+///         31:0 value;
+///     }
+/// }
+/// # Ok(())
+/// # }
+/// ```
+///
+/// ## Relative arrays of registers
+///
+/// Combining the two features described in the sections above, arrays of registers accessible from
+/// a base can also be defined:
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::io::register::RegisterBase;
+///
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: T)
+/// #     -> Result<(), Error>{
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Type used as parameter of `RegisterBase` to specify the base.
+/// pub struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// // 64 per-cpu scratch registers, arranged as a contiguous array.
+/// register! {
+///     /// Per-CPU scratch registers.
+///     pub CPU_SCRATCH(u32)[64] @ CpuCtlBase + 0x00000080 {
+///         31:0 value;
+///     }
+/// }
+///
+/// // Read scratch register 0 of CPU0.
+/// let cpu0_scratch_0 = bar.read(CPU_SCRATCH::of::<Cpu0>().at(0)).value();
+/// // Read scratch register 15 of CPU1.
+/// let cpu1_scratch_15 = bar.read(CPU_SCRATCH::of::<Cpu1>().at(15)).value();
+///
+/// // This won't build.
+/// // let cpu0_scratch_128 = bar.read(CPU_SCRATCH::of::<Cpu0>().at(128)).value();
+///
+/// // Runtime-obtained array index.
+/// let scratch_idx = get_scratch_idx();
+/// // Access on a runtime index returns an error if it is out-of-bounds.
+/// let cpu0_scratch = bar.read(
+///     CPU_SCRATCH::of::<Cpu0>().try_at(scratch_idx).ok_or(EINVAL)?
+/// ).value();
+///
+/// // `SCRATCH[8]` is used to convey the firmware exit code.
+/// register! {
+///     /// Per-CPU firmware exit status code.
+///     pub CPU_FIRMWARE_STATUS(u32) => CpuCtlBase + CPU_SCRATCH[8] {
+///         7:0 status;
+///     }
+/// }
+///
+/// let cpu0_status = bar.read(CPU_FIRMWARE_STATUS::of::<Cpu0>()).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register! {
+///     /// Scratch registers bank 0.
+///     pub CPU_SCRATCH_INTERLEAVED_0(u32)[16, stride = 8] @ CpuCtlBase + 0x00000d00 {
+///         31:0 value;
+///     }
+///
+///     /// Scratch registers bank 1.
+///     pub CPU_SCRATCH_INTERLEAVED_1(u32)[16, stride = 8] @ CpuCtlBase + 0x00000d04 {
+///         31:0 value;
+///     }
+/// }
+/// # Ok(())
+/// # }
+/// ```
+#[macro_export]
+macro_rules! register {
+    // Entry point for the macro, allowing multiple registers to be defined in one call.
+    // It matches all possible register declaration patterns to dispatch them to corresponding
+    // `@reg` rule that defines a single register.
+    (
+        $(
+            $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+                $([ $size:expr $(, stride = $stride:expr)? ])?
+                $(@ $($base:ident +)? $offset:literal)?
+                $(=> $alias:ident $(+ $alias_offset:ident)? $([$alias_idx:expr])? )?
+            { $($fields:tt)* }
+        )*
+    ) => {
+        $(
+        $crate::register!(
+            @reg $(#[$attr])* $vis $name ($storage) $([$size $(, stride = $stride)?])?
+                $(@ $($base +)? $offset)?
+                $(=> $alias $(+ $alias_offset)? $([$alias_idx])? )?
+            { $($fields)* }
+        );
+        )*
+    };
+
+    // All the rules below are private helpers.
+
+    // Creates a register at a fixed offset of the MMIO space.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(@io_fixed $(#[$attr])* $vis $name($storage) @ $offset);
+    };
+
+    // Creates an alias register of fixed offset register `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(
+            @io_fixed $(#[$attr])* $vis $name($storage) @
+            <$alias as $crate::io::register::FixedRegister>::OFFSET
+        );
+    };
+
+    // Creates a register at a relative offset from a base address provider.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $base:ident + $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(@io_relative $vis $name($storage) @ $base + $offset );
+    };
+
+    // Creates an alias register of relative offset register `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $base:ident + $alias:ident
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(
+            @io_relative $vis $name($storage) @
+            $base + <$alias as $crate::io::register::RelativeRegister>::OFFSET
+        );
+    };
+
+    // Creates an array of registers at a fixed offset of the MMIO space.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            [ $size:expr, stride = $stride:expr ] @ $offset:literal { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(@io_array $vis $name($storage) [ $size, stride = $stride ] @ $offset);
+    };
+
+    // Shortcut for contiguous array of registers (stride == size of element).
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $size:expr ] @ $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            $(#[$attr])* $vis $name($storage) [ $size, stride = ::core::mem::size_of::<$storage>() ]
+                @ $offset { $($fields)* }
+        );
+    };
+
+    // Creates an alias of register `idx` of array of registers `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident [ $idx:expr ]
+            { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < <$alias as $crate::io::register::RegisterArray>::SIZE);
+
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(@io_fixed $(#[$attr])* $vis $name($storage)
+            @ <$alias as $crate::io::register::RegisterArray>::OFFSET
+                + $idx * <$alias as $crate::io::register::RegisterArray>::STRIDE
+        );
+    };
+
+    // Creates an array of registers at a relative offset from a base address provider.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            [ $size:expr, stride = $stride:expr ]
+            @ $base:ident + $offset:literal { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(
+            @io_relative_array $vis $name($storage) [ $size, stride = $stride ] @ $base + $offset
+        );
+    };
+
+    // Shortcut for contiguous array of relative registers (stride == size of element).
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $size:expr ]
+            @ $base:ident + $offset:literal { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            $(#[$attr])* $vis $name($storage) [ $size, stride = ::core::mem::size_of::<$storage>() ]
+                @ $base + $offset { $($fields)* }
+        );
+    };
+
+    // Creates an alias of register `idx` of relative array of registers `alias` with its own
+    // fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            => $base:ident + $alias:ident [ $idx:expr ] { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < <$alias as $crate::io::register::RelativeRegisterArray>::SIZE);
+
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(
+            @io_relative $vis $name($storage) @ $base
+                + <$alias as $crate::io::register::RelativeRegisterArray>::OFFSET
+                + $idx * <$alias as $crate::io::register::RelativeRegisterArray>::STRIDE
+        );
+    };
+
+    // Generates the bitfield for the register.
+    //
+    // `#[allow(non_camel_case_types)]` is added since register names typically use
+    // `SCREAMING_CASE`.
+    (
+        @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty) { $($fields:tt)* }
+    ) => {
+        $crate::register!(@bitfield_core
+            #[allow(non_camel_case_types)]
+            $(#[$attr])* $vis $name $storage
+        );
+        $crate::register!(@bitfield_fields $vis $name $storage { $($fields)* });
+
+        impl $crate::io::register::Register for $name {
+            type Storage = $storage;
+        }
+    };
+
+    // Implementations of fixed registers.
+    (@io_fixed $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $offset:expr) => {
+        impl $crate::io::register::FixedRegister for $name {
+            const OFFSET: usize = $offset;
+        }
+
+        $(#[$attr])*
+        $vis const $name: $crate::io::register::FixedRegisterLoc<$name> =
+            $crate::io::register::FixedRegisterLoc::<$name>::new();
+    };
+
+    // Implementations of relative registers.
+    (@io_relative $vis:vis $name:ident ($storage:ty) @ $base:ident + $offset:expr ) => {
+        impl $crate::io::register::RelativeRegister for $name
+        {
+            type BaseFamily = $base;
+            const OFFSET: usize = $offset;
+        }
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Returns the location of the register with base `B`.
+            #[inline(always)]
+            $vis const fn of<B: $crate::io::register::RegisterBase<$base>>()
+                -> $crate::io::register::RelativeRegisterLoc<$name, B> {
+                $crate::io::register::RelativeRegisterLoc::new()
+            }
+        }
+    };
+
+    // Implementations of array registers.
+    (@io_array $vis:vis $name:ident ($storage:ty) [ $size:expr, stride = $stride:expr ]
+        @ $offset:literal) => {
+        impl $crate::io::register::RegisterArray for $name {
+            const OFFSET: usize = $offset;
+            const SIZE: usize = $size;
+            const STRIDE: usize = $stride;
+        }
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Returns the location of the register at index `idx`, with build-time validation.
+            #[inline(always)]
+            $vis fn at(idx: usize) -> $crate::io::register::RegisterArrayLoc<$name> {
+                $crate::io::register::RegisterArrayLoc::new(idx)
+            }
+
+            /// Attempts to return the location of the register at index `idx`, with runtime
+            /// validation.
+            #[inline(always)]
+            $vis fn try_at(idx: usize) -> Option<$crate::io::register::RegisterArrayLoc<$name>> {
+                $crate::io::register::RegisterArrayLoc::try_new(idx)
+            }
+        }
+    };
+
+    // Implementations of relative array registers.
+    (
+        @io_relative_array $vis:vis $name:ident ($storage:ty) [ $size:expr, stride = $stride:expr ]
+            @ $base:ident + $offset:literal
+    ) => {
+        impl $crate::io::register::RelativeRegisterArray for $name {
+            type BaseFamily = $base;
+            const OFFSET: usize = $offset;
+            const SIZE: usize = $size;
+            const STRIDE: usize = $stride;
+        }
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Returns the location of the register array with base `B`.
+            ///
+            /// An individual register from the array still needs to be addressed using
+            /// [`RelativeRegisterLoc::at`] or [`RelativeRegisterLoc::try_at`].
+            #[inline(always)]
+            $vis const fn of<B: $crate::io::register::RegisterBase<$base>>()
+                -> $crate::io::register::RelativeRegisterLoc<$name, B> {
+                $crate::io::register::RelativeRegisterLoc::new()
+            }
+        }
+    };
+
+    // Defines the wrapper `$name` type and its conversions from/to the storage type.
+    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty) => {
+        $(#[$attr])*
+        #[repr(transparent)]
+        #[derive(Clone, Copy, PartialEq, Eq)]
+        $vis struct $name {
+            inner: $storage,
+        }
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Creates a bitfield from a raw value.
+            #[inline(always)]
+            $vis const fn from_raw(value: $storage) -> Self {
+                Self{ inner: value }
+            }
+
+            /// Turns this bitfield into its raw value.
+            ///
+            /// This is similar to the [`From`] implementation, but is shorter to invoke in
+            /// most cases.
+            #[inline(always)]
+            $vis const fn into_raw(self) -> $storage {
+                self.inner
+            }
+        }
+
+        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
+        unsafe impl ::pin_init::Zeroable for $name {}
+
+        impl ::core::convert::From<$name> for $storage {
+            #[inline(always)]
+            fn from(val: $name) -> $storage {
+                val.into_raw()
+            }
+        }
+
+        impl ::core::convert::From<$storage> for $name {
+            #[inline(always)]
+            fn from(val: $storage) -> $name {
+                Self::from_raw(val)
+            }
+        }
+    };
+
+    // Definitions requiring knowledge of individual fields: private and public field accessors,
+    // and `Debug` implementation.
+    (@bitfield_fields $vis:vis $name:ident $storage:ty {
+        $($(#[doc = $doc:expr])* $hi:literal:$lo:literal $field:ident
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+        ;
+        )*
+    }
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+        $(
+        $crate::register!(@private_field_accessors $vis $name $storage : $hi:$lo $field);
+        $crate::register!(
+            @public_field_accessors $(#[doc = $doc])* $vis $name $storage : $hi:$lo $field
+            $(?=> $try_into_type)?
+            $(=> $into_type)?
+        );
+        )*
+        }
+
+        $crate::register!(@debug $name { $($field;)* });
+    };
+
+    // Private field accessors working with the exact `Bounded` type for the field.
+    (
+        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        $vis const [<$field:upper _MASK>]: $storage =
+            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        $vis const [<$field:upper _SHIFT>]: u32 = $lo;
+        );
+
+        ::kernel::macros::paste!(
+        fn [<__ $field>](self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
+            // Left shift to align the field's MSB with the storage MSB.
+            const ALIGN_TOP: u32 = $storage::BITS - ($hi + 1);
+            // Right shift to move the top-aligned field to bit 0 of the storage.
+            const ALIGN_BOTTOM: u32 = ALIGN_TOP + $lo;
+
+            // Extract the field using two shifts. `Bounded::shr` produces the correctly-sized
+            // output type.
+            let val = ::kernel::num::Bounded::<$storage, { $storage::BITS }>::from(
+                self.inner << ALIGN_TOP
+            );
+            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
+        }
+
+        const fn [<__with_ $field>](
+            mut self,
+            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
+        ) -> Self
+        {
+            const MASK: $storage = <$name>::[<$field:upper _MASK>];
+            const SHIFT: u32 = <$name>::[<$field:upper _SHIFT>];
+
+            let value = value.get() << SHIFT;
+            self.inner = (self.inner & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Public accessors for fields infallibly (`=>`) converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:literal:$lo:literal $field:ident => $into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) -> $into_type
+        {
+            self.[<__ $field>]().into()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>](self, value: $into_type) -> Self
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields fallibly (`?=>`) converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident ?=> $try_into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) ->
+            Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<
+                    ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+                >>::Error
+            >
+        {
+            self.[<__ $field>]().try_into()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>](self, value: $try_into_type) -> Self
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields not converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+        {
+            self.[<__ $field>]()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the compile-time constant `VALUE`."]
+        #[inline(always)]
+        $vis const fn [<with_const_ $field>]<const VALUE: $storage>(self) -> Self {
+            self.[<__with_ $field>](
+                ::kernel::num::Bounded::<$storage, { $hi + 1 - $lo }>::new::<VALUE>()
+            )
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>]<T>(
+            self,
+            value: T,
+        ) -> Self
+            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Tries to set this field to `value`, returning an error if it is out of range."]
+        #[inline(always)]
+        $vis fn [<try_with_ $field>]<T>(
+            self,
+            value: T,
+        ) -> ::kernel::error::Result<Self>
+            where T: ::kernel::num::TryIntoBounded<$storage, { $hi + 1 - $lo }>,
+        {
+            Ok(
+                self.[<__with_ $field>](
+                    value.try_into_bounded().ok_or(::kernel::error::code::EOVERFLOW)?
+                )
+            )
+        }
+
+        );
+    };
+
+    // `Debug` implementation.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::kernel::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", self.inner))
+                $(
+                    .field(stringify!($field), &self.$field())
+                )*
+                    .finish()
+            }
+        }
+    };
+}

-- 
2.53.0

