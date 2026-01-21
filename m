Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022106.outbound.protection.outlook.com [52.101.101.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C5040F8FD;
	Wed, 21 Jan 2026 15:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769010980; cv=fail; b=hXBAKFUl3lCUzhlG0Z3aw1m/5o0993BVPy4fHIK9SLI4xzuZowF8ds9quS10sIpbz7sTzBA4ooAsalxlaDo4jGFdZjkL02CpE/i5bgZ+4KdVuiiLB2og7S5/iBSgz6EALEh4W+qoVg7XJ9Jw87XjU/8yHNO282aJeIRTW8a74jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769010980; c=relaxed/simple;
	bh=POcsyQ7y8mQSsaj0kNgTcgZc0fWBsILtbmF5NsITgOI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=uLCiRbTdpa9xFHHj7KNtYbULOoKNwkXU/fskviMxlAYHaHZ88swo88EUGUEwQYHnJ/uXLZSXwWrGKv0E+vCSZAflbPCeWCfxlkyc3PWvyTwgotRNiOoAIudE8sprIVyeRJr4L7NlgYdtmWlhCMLQFbG1M8/twsKb8BNFm/smmYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=vED/929F; arc=fail smtp.client-ip=52.101.101.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="vED/929F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkYwLwIZw2Hz3hrt7SJSlBhizes8xDbeZXn2vGi54aWWTazZwGDyKkbI075PNF6BcEqpMQoqtjtA7vYjLpFKT04ySsf5tfgexOPJg8z7HD0WpfimUMYMw/aiUHw6osBTwtZnQQ4pSrssT7W4lwtHUDaYWwsbLZRQBme5oIHJcWej3wJHF6kddcJovvbZFvmZcmaL1LT6ei7Wa1DCO6LAet09G5WEArVx5XPo6CTdEmwSXRg37RV+Fxsy0FaJLMLEHiEatX4LiUtWEqWvEo8G0b16u30OngUsJAE7c84mggCMH+bD56jmxzurAwC/l9a0Xv2eNlxS1uxoikQGs0zqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmB2F4+19YvLyKLJjjkvt3IyBDrb/Wv7ijwAZgcCbTk=;
 b=NJb07+XtC+D1Mf6NrFoBjnLtHU56lJXqqgo5qBgW56YDlN/KtBiEp6HR82hVPcYYqLhWv17PtKL23O9wmZxePXH7SdEjwHyT1jBFezhP/Y0CNZWISKZWQS4+Ia/vN1arGIfvyvfZhdd2f03IJ/qLEuxjwSF46uaHTH5kxlbatGpBrTcDRWhW6xhCJiRSWJ+dR6J12BMJxS+aulCvPZEDPIdZ4KmhkEJEm6D+pUG4pJn/lscJ7RPqObFwq85aeuewwq8/lCdM0w0kvl3qNaD75DE8mcNmcpmBdXhC4u8av2/hTQz7NY0Vy66KAn/A1m1SEf8NAObX82URDOXDxtsHvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmB2F4+19YvLyKLJjjkvt3IyBDrb/Wv7ijwAZgcCbTk=;
 b=vED/929Fekn6pqFWnYseJINEzGuxyC4RWSoQj6yvnwBIS9Qm8hnhks2V5Xdp16tWbAVlcY917KIs1K4uBSZ77RDZzfkbuE5NfOc4mfSwYsYY89zjoJuAZYI4IolsSDORRNYHYrbv6Kg1G9ae/bMWPru8jNihCmB5p7p23+UN/1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO8P265MB7564.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 15:56:14 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 15:56:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 15:56:13 +0000
Message-Id: <DFUE1Y1SLI19.DR47N9FFG12X@garyguo.net>
Subject: Re: [PATCH 09/10] rust: xarray: add preload API
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Tamir Duberstein"
 <tamird@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: "Daniel Gomez" <da.gomez@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-9-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-9-9e5ffd5e3cf0@kernel.org>
X-ClientProxiedBy: LO3P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO8P265MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f6ba45-0532-4f6e-eb67-08de59059aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWp5dlVidGwvU2w2My9ibjF4ZDB2L1VIRVJDSlVRay80K1hoVW1yK21JdVVp?=
 =?utf-8?B?c2tpTlh6b2FOQmMyZXRFaWRZTVIvaE9QU3dOMGxLb1hyVmRqdkhHU2t6RHl2?=
 =?utf-8?B?SVBlY3VRR1pHL1NKc25lTXhkK1dUVzFHcnpQNmxHWnFvZnNGMEN4TmJNeHR0?=
 =?utf-8?B?M2tCNnR6LzJVbXBCWjNsQ1JMamtrV2gxM3o3cWNFTW5ZSEx1YjZxRXc4NXhC?=
 =?utf-8?B?VXRqRm1TMXRMWXF3MXhKV3ZvTDlJYi9mOU5QckRCdjVQd1FUdDhTS2t0T3p0?=
 =?utf-8?B?WU5POFM4dHpwaUxlYVY0RTNGYmFxTnBpcXNOeVVDQkV1QjZTbzBGUXVnVnUw?=
 =?utf-8?B?VmZUdzhTb2NWWWQ3ZnBhN0tyYzJvUTcxOHluNFJiSEthb3h6bkNUNVE4NlpE?=
 =?utf-8?B?VHVweFZWSXEwTW1TWktFUk5GMzQ2RzBZT3k2Q1pBSDd5cms5Ty9sRWJRUURh?=
 =?utf-8?B?NDVLREdPTXN4NHJFdStwN1gxVHIwZGRiTzhLbkxmMWg4TUdheUpmQ0tIVkRq?=
 =?utf-8?B?UG03QnNPcndjTGhRd1NNeksyRW1rbGVyUkorM0RMejd0dHd1eWxhVFI3RStR?=
 =?utf-8?B?TlF5bnZKeHpoSGRIaXF1QkZrWWVvVVFyNFUxNDFEQjg0T2tTdHlRZVRVUGxI?=
 =?utf-8?B?RVJCNkhGSzhrVEh0eThKUXoxVzlTbG9OenJpOUpWSit1V1M1VWJ3b3QveWJt?=
 =?utf-8?B?UW1MNnB4WkVYRmNJNXI3M0wyWFJvWGNBSFkrSXBwVDRwM2dMOFpOeFNob3Ri?=
 =?utf-8?B?TjJoZmZwQlZoK0E4ZnllejZpLzJkeTYrbTNsblNNYnFhZUtTSmVkdGFGVjhX?=
 =?utf-8?B?RjRQcmg1SkUwd20veTQ1eXV3TjFZZFZKT2xEUzg4WnVTUVg2YjliSDlHdG5V?=
 =?utf-8?B?dWFBQWJVUm54ZjRFdDZKUG5JNnlseXNzU2hVL29ZUTRSVDNoUVA0MWRhSWtT?=
 =?utf-8?B?YlkxaTl1emprQ2lsZG5ZR1BId2YrZzMrRHhRRWJ0b3BsWU9oT3VkNjhWRTIx?=
 =?utf-8?B?NHNGNWVGSmhBT0JSTDg0S25CU2g2VDNKbDdPdWRybHVCaXI5Tms0NkxNcm91?=
 =?utf-8?B?RHpCWEhrQVlaQnVBaEJ0dFJjTm1lQTFWbldFSTZrN08wcUxuNnhieVRRRC81?=
 =?utf-8?B?Ymc3Qm5JMG5sYStyZElYTWxhMitHMFJ4RVlKYUNtYXJuQllRZk5EMUJEbDQ1?=
 =?utf-8?B?a3BZelNvVmI4bzdnVm1BNnUyT29uUStaUWg1cERzeWp4bU5ueGppZnppMzZp?=
 =?utf-8?B?WW9BTGtRbkx4SnNvVGgxcFZwRkV6Nitka3haaUZGWkJ6amJycXIwNHJqUVVi?=
 =?utf-8?B?OXBkMUxHYkJBNGYwODMyRVVvVlZ4UitXL1luUWVvcWQ2a3BNOGRqUGRzb0o2?=
 =?utf-8?B?Wlc5ZnFCTUFDb3F4MkdjTzJLeGQvMmxLYXN0MnZjZWlHb2d2ekxZWTZTVjFM?=
 =?utf-8?B?UU5TS2J1dHd5Qi9pNmk1SHRTMUp0VDVrdk1vd294QkhpUitVYUczbnRWQUVt?=
 =?utf-8?B?NjNtVU1RNENkQmQ4SkNBZE1OQytUMEYwTHJYRk4rUnFJck1USTFKN2trdWFo?=
 =?utf-8?B?R2FsR0thVy8rZGtVbGNXOXdBbE5pS054S3FDT3QwMWs5eW9OdndQLy9YbnA1?=
 =?utf-8?B?enluUmxsMGx4L3ZhYjBmaUJsRkFCb3hJT2JwRnFtanM0TnhvSVU0Q3Z0K1dQ?=
 =?utf-8?B?YmxWUlNQNGc4QllzOFg3K2NCUWZnOHk2SWgxQXRsaVBKYTliWEZmcng0RUt6?=
 =?utf-8?B?bzBZZ2NuUzluRCtMbXRUUThaUTZXejYvWmg5a2g1aVR4K1I0MzNFc0tMcTF6?=
 =?utf-8?B?MjVReHFoSzIrZ0pCRXc2UWo0cjJWMFlsdjladGp4all4Q09ON3VwaHhOL1Z3?=
 =?utf-8?B?bU4rbmxCb0hmRWJXRmNJU1g3UU9NYUFHS3FxWWQ4VStiWDBtLzVacWRUK0xF?=
 =?utf-8?B?TW1HSE1KdmhwdUg2Mlp6SENDK2lpWHd5TC9qOHljWDZjOC9JTTJLTjBKUFFO?=
 =?utf-8?B?dUhIVGdTQVovbE9zRVdzSjRXeCtvYzFHc2JrRDR0NGFtT25kVUVWTnpNSHVL?=
 =?utf-8?B?d085R1lkcXhEVHJyNlUrcjFPallSRFJNcCsrS2g3NkE3QU0rZzZyaEduSXla?=
 =?utf-8?B?d25yRmFFdTNDNjBQMCs0emFwRnJabWVyK1VBd2VValVWQU9IS3ZVNVVieGdq?=
 =?utf-8?B?OXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG1CS2Nzc0IyV1MxMVZFcGs1c1Q1K0wwM3NqTkNldjROaXJpKzQ2akIwUUgr?=
 =?utf-8?B?dE1rRnNPQWFublpNOVNPVk0zYU1IYjFGSlI5aHQ3OEQ0UlI0Y2IvV0VReWRh?=
 =?utf-8?B?ckFITWpuaG41UWxMUnJtN1ptUmkzZFZhMGROaG8rN1pmbm9RaHpLdmRXNXh2?=
 =?utf-8?B?dENhWEZzajF5eEwva1ZnQVVpenp3ZGRhUStWaWFTY2VUOStlMXh1VUtxekF6?=
 =?utf-8?B?bnFlNHRlSHVLM2NCVHVXbGNHVGJydlFoK3paMys1UUFFTDBCZW40VWs4NFNs?=
 =?utf-8?B?SlZLNVZoS0ZPL1E0NTJYT3dpUkhWNFZwMHV0Sm1RbWNnekg5NGlNUGVyMTR1?=
 =?utf-8?B?OTdKeUw5OG41aXF5TDRMYTRIUlpPR2lnekFHeGNCUmc2ay8yalNyNUtZb2lE?=
 =?utf-8?B?dUpwV2hjUmxja3NIOUNFRy9IbUZ0azVhNVhxdlE4NjgvN0RHamozcU8yREpN?=
 =?utf-8?B?MlV2TXRYY2hrTk1Ubm9LQTBkMlJXL2ZDUnF0dzkwZm54c0dwL1hRZm41Q2hH?=
 =?utf-8?B?bHkydTZobEVzYjNqRjQrOUJhWmx5emxRRjViY3ZBRTVPSU9KS3dROGY4VzFH?=
 =?utf-8?B?VSsvZVl0UmpMa3JQTjN1dk1DQnRHYkZWKytEN1Y0MjFJUGRoNXNiTE56VGRW?=
 =?utf-8?B?MHRpcmRNa2x4RmF5NG5VUjJycUJZY2R0MTlvVXRFZ3Vvd0RRNmdUdlMwL1RI?=
 =?utf-8?B?aGZUelpFYytjemtaZ2Y1bGliTDJBUWljMFp3R282SjlsUlFxQ0Q1OTRvelFh?=
 =?utf-8?B?c3lWb3AzSm5XRnltNGZVVEl1dXV2cWtvNThxczJwa3drbVdYOU9DeG5hdVZN?=
 =?utf-8?B?T3MrRlRmK3VtMmV6Mnl6dmw0OVpIVi9KZ1FNc29CTnU2TVp3VHY4Rmp4ejFQ?=
 =?utf-8?B?Vm9YRWJmWXJHOGx0KzAzQ3NSRWtCZU8ydzdtS0FPbFZ3d1hubWlGVlE3SUV2?=
 =?utf-8?B?bGVpMk9KQmlkVVhMY2FEa0NXaXJYSklKUTdnRytpNUhrcTFwdUxYVFRYbzVy?=
 =?utf-8?B?UmNPVE9pRG91eW9nUzFaNDlaeE4zS0ZpWFhkb1dqNk5TQkhYUk1vWTRuNml2?=
 =?utf-8?B?M2pURXVYdXlmRUhLVXo5MHZNNXZJNVRuNy81a3VHUXJDbk1XYkVsS2luSWd0?=
 =?utf-8?B?bndNM2YvTTlpMTNJTkxvdkp2ellnSXFqR1p5MUZobURqZFNlQVNlendzYTlu?=
 =?utf-8?B?UjZxSVhFc3YvYzF4bHdYaUZUc0VkSjNiQlc2UlVrcURabVJuRGpLczVMUnpk?=
 =?utf-8?B?MDNJMVlKRmgwYzA3d2NjM2p6UjI3VXd0SEVQM3ZyU3p6K0xTdGRpYVJIRTNo?=
 =?utf-8?B?eGl2N2NYT2pleWlqL1AwUE04eVJFSW16R2dsUFVtVGt1bTJZdVllTFEvVGV5?=
 =?utf-8?B?NDkvWVJUQnhCUk81S0c2djdpandLNm9DL3NEblNZU0dzbytkT0pnVk9rdmRF?=
 =?utf-8?B?M2xJQTF6OSt2Z0NFWk9RRzFwSEpmdFIvb2JpMS9ERWI4WjZzOGZ0bFljc201?=
 =?utf-8?B?NVJCOEx5aHNqZjJDcDRueGhYTkgyQ3hlbXNTWXhGK2hRaENtR05hSk1CUXha?=
 =?utf-8?B?b1pVQjBsOFloZ2JROE41dXdNVVJDUEh6Y1NLdTN3RzA5SWgxdTdDa2xFTDFv?=
 =?utf-8?B?ckViZlp4dy8rc0xFSzV6b0hUdkJEUnE1bjlRK0hDUVkxbVFqeWxMbFhFckZs?=
 =?utf-8?B?cUdhbm15bkNhS0l4VnNjYlpJRG5KNjVCdnQzMUYzYmdVMExQL3BZb3BzaHhY?=
 =?utf-8?B?a1ZnQXNXTnpFVy9kSk1IcXVOVGo3Vk5jTUNZUjlHTm42c1dIS3ZHbmRUTmFX?=
 =?utf-8?B?SHpsdldHSG56dDA3TmdHNCtUbnhNWDlZYStsRzNTeVNVQVRYM1o4VmttVU9n?=
 =?utf-8?B?VVRNSVV6ajAzaUtkbndzWE1SWVMxcXRlN3ZSQytGaXZEWkxaa3FaNGdaRm9t?=
 =?utf-8?B?bm5MaC81TlZvRUpaL3h4OWlmZzdwTU5IMTNuSXUraExacWVpTkovMG82UUpN?=
 =?utf-8?B?R1FXcDVYMTJ2cWx2anU5eld0Z3ZrOUpwbWJCV3pYR2lIdllnK2xWeGtTVzBY?=
 =?utf-8?B?Ry9BT1paUEhBaWY1RnJ1U1ZDV2s1d0JYNjZlaUliSTZzM1M0MUxxazhGMUV3?=
 =?utf-8?B?cEZNK1dYU0F3RmxoY0E0UVQ1VVdwOGhVVjlXNDZpM216RGtRTS91Q05jY1lt?=
 =?utf-8?B?RWNQalA0dmI1NzBhbFlXd1RHTm0xRlV5Z01QTVZ5VjZ4Vk83bW1GZ1FHbWNG?=
 =?utf-8?B?UDRLd3VrTEY2UDNCSHJuYkh1UThYU3ExVTY4T2s3VXRDaE54b3RveWRKajNv?=
 =?utf-8?B?ZVQzY3BTakEyL0V0RTJUVWxaelJXMmhHcTBlMnRSb1h2V2RHUkxpQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f6ba45-0532-4f6e-eb67-08de59059aa5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:56:13.8189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCiee57hBbJ/c7B035z7XBc109HexN0WCkykcCVnk6yPzEKe2bFgMrGhLW0YDT2phR3CmhRmsSnMAet78/4YXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7564

On Wed Dec 3, 2025 at 10:26 PM GMT, Andreas Hindborg wrote:
> Add a preload API that allows preallocating memory for XArray
> insertions. This enables insertions to proceed without allocation
> failures in contexts where memory allocation is not desirable, such as
> in atomic contexts or where reliability is critical.
>
> The API includes:
>
> - `XArrayPreloadBuffer` for managing a pool of preallocated nodes.
> - `XArrayPreloadNode` representing a single preallocated node.
> - Integration with the entry API, allowing `VacantEntry::insert` and
>   `VacantEntry::insert_entry` to accept an optional preload buffer.
> - A new `Guard::insert_entry` method for inserting with preload support.
>
> The implementation uses a circular buffer to efficiently manage
> preallocated nodes. When an insertion would fail due to ENOMEM, the
> XArray state API automatically consumes a preallocated node from the
> buffer if available.

It looks like this code doesn't neede to be XArray specific. You can provid=
e
a generic abstraction for kmem_cache and just use a specific instance for
XArray?

Best,
Gary

>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/bindings/bindings_helper.h |   3 +
>  rust/kernel/xarray.rs           |  58 ++++++++++-
>  rust/kernel/xarray/entry.rs     |  64 +++++++++---
>  rust/kernel/xarray/preload.rs   | 217 ++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 324 insertions(+), 18 deletions(-)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 86bca946faff0..8e9f8762d5e6e 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -110,6 +110,9 @@ const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_F=
LAGS_ALLOC;
>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
>  const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;
>  const size_t RUST_CONST_HELPER_XAS_RESTART =3D (size_t)XAS_RESTART;
> +const size_t RUST_CONST_HELPER_XA_CHUNK_SHIFT =3D XA_CHUNK_SHIFT;
> +const size_t RUST_CONST_HELPER_XA_CHUNK_SIZE =3D XA_CHUNK_SIZE;
> +extern struct kmem_cache *radix_tree_node_cachep;
> =20
>  #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
>  #include "../../drivers/android/binder/rust_binder.h"
