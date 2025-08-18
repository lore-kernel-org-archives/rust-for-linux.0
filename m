Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62A427B32F
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518562; cv=fail; b=UQQz5GspbvqaOXRhEoTtqogSu1NXKmCAouju0dnKIWprVQpsK7qT1xoBmw1EnsxaXx97VGn9FYLA07OxtvUMn3J6mm/idDzQAnpKim03QNU6WAYfbb5nLZ7K4ph5Ssa3XapTc1hoTInXtdHa+6Kf9EQSlF63Vxkp7jJU9FJTjQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518562; c=relaxed/simple;
	bh=u5/TYAVDrRlWqw9bmvI2o1yr7xqz7TwxzrJjUIWeiC4=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=cweTtN17nRRLeu4I3s2TBLdgfQQKfXW2Z6w6EK2DmnlrZjJUhftdikpWpmk5dQC6hQcTqoMeyXxCooAtciRc1zzujKtkhUNPohzQAOobAbp9OYYCTWqH2e23rM0IhG8QWv9yH3bTPsS5xAxxHRw8/krOANn5HTLEP0uBi35AQ9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qjSEdhrP; arc=fail smtp.client-ip=40.107.101.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qjSEdhrP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DI8iWj8nKYot0zgeP33Rdoe6gXtgdAct1837EuU7+thBMkdSiKmc49U6STvgQDP1WjSZT8N35jOo6rCvmERz7Mz9PNXuBq4aYYLiebI3WeiBE+H/X4QBTiJOdGpkBTxW5NpJR/rcnQa8MUVTJf6mf0JyLXVokszHIuKrxrsN1GWN4tI/eoHwLPvGq03afaYEmAKdkbxXEiqkhqyrrl86aJABY/IORIxH7ZuNxIcsiUtcBoNmj8zTR9Ssb1FwUv20wCltUw/8YCvaSLDH3sEU/ETrpbOFsSERLumce7srPkEZ5JQWbN3a2+xuLnePx7kZMVUUEjkRQnm5PwObm3pLPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oT6fcYes+AIrIY9PEGsy6TSjcwnt+/UTeQWZOrQZDuc=;
 b=jBcmBP6gcfbiic8g2//hVor9XITT0XRhsWTfnqVM/4sW2JVgg8x8bK7SyF8zv/5EPULqPw5JfuyPPqBSnXybUQVJZC/UO2h1rq9BpooEpCHCSnkkbrz9mvzd79wTyxTSrvCBBqVNHIPT8+dyLcixIfi3pVdAJcoDBRTeyu87DM1/XbwOJ2qjiQsR3aDc9VzpIxSAqGcey3wSulsd6/wTfoLDZM2UMdVlJ3B+Ph9fPwMA41LTlKa1RoOXVH6NkMurVmEgt2HnTpZuBIIx7BnzZPP35GjNvEFPtfO9XBYDAyBUryRU2jlagj0bXJcLJNRbR9qBtR53ANb43rpjUklXyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT6fcYes+AIrIY9PEGsy6TSjcwnt+/UTeQWZOrQZDuc=;
 b=qjSEdhrPk4kEjO9PnS03rQ1f5/EHFtEWpe9MDA9xRmqnagwDwil8asVVxtvjFLUz8itHW8wr3jrO27BZiDRiXYfh0kXYVUKye8aO28Jzjz2T0AtJaefyn52b5g499f0uq5cWA3IJV7nbqyqa7m1qWYU82mdg5Jzhszwna3G/n+q1UTF6V6ezDwC2yjIqGSQe02PRxWGRW1etD46//B0g0/foJ307eyEkqjCTalM1mElWeh1yi0kiW2IwhfnEvKbG499DWQKu3rgyKBU/6bol9EWG+g/JX4aK84n4U1kiKrVAxQX5uujWALl2t5dqXTRE6mnfgWj/iaNvI8Q75zCU1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 18 Aug
 2025 12:02:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 12:02:35 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 21:02:32 +0900
Message-Id: <DC5JE1B1KFMM.3UMGKPIO4FF6F@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 3/7] rust: alloc: implement VmallocPageIter
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-4-dakr@kernel.org>
In-Reply-To: <20250814093427.19629-4-dakr@kernel.org>
X-ClientProxiedBy: TYWP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::23) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: 599dd53e-b2ce-43d1-b099-08ddde4f1e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjJYb3FyYm0xVkFnbUozZTJ4TUg5MDU1SGw0aWNaUXBPajZUeHVFZVpIMWRw?=
 =?utf-8?B?QkNQVHpVQ3daTFJGS1dPYkFtUTV4Rytqd2QwRDd1b052WTNqc002ak5LQmJz?=
 =?utf-8?B?SGNLakhSTlZBdDNDbzdJckQvRHJtVmlRZmg0Wm0yRVU0K1piT2FaZ0VMbm12?=
 =?utf-8?B?a3lrM0VQMDhtUXBYYXJ4eU5XREx1MWU1VmFaVDlCV0hZaFJnYzN1UVNiMXhJ?=
 =?utf-8?B?ekJYdllrVC90RjFwRFc2NUZQUkF5eWNPVEFTYTlpRDA4d0JWZUpqQnhOTGdL?=
 =?utf-8?B?eUhzL2JwWDdPLzhQUmUzTHljcStHWUdRVSs1VHgvaWFuZ1YzMHAvT0p1eFpX?=
 =?utf-8?B?SlJoWVdUZUR5Y21CT2hFU2hQc0FNc0V4a1lVaGFNWk9wcUtYWU1OSVIzZ3VO?=
 =?utf-8?B?MVhiWDdzSmZRcHU1YTF5V3dVamRUdVRrc2xHb0tINlg0NVh5Y1AxZlpmL1pL?=
 =?utf-8?B?V2Z3Z0R5MU1pTzRKQWZ6aTFlekhDTGJ2WDlDeFJ6dE1nNFdDcmhjSkJ2bnlU?=
 =?utf-8?B?UUsrWXlqcVdFdXNQalgrR0t3OXAzOTZQc3M5M2ZoSGFlNE92K1VTbzQ4eHB1?=
 =?utf-8?B?U28walh4S3VNRnNwTmp4cWczbVdPMFJmQjYrakYwazlEbE5kUjdzZHBKSGQz?=
 =?utf-8?B?TG1oQWp6bHVNbkVUdUtReTFQVmxiSFN2WlZORTdoTFJFaDk0UlpUaHpENkpl?=
 =?utf-8?B?Szd3UTBzQW5yQ1RKaEFMeVV2M2IzNmM4UmF4SzRZNS9Td0xMcGJvbkpNUHUr?=
 =?utf-8?B?Vko2bkREb3JpdGdJNWRtbnNyV0lmcnoySmIxUFgwSWNxbkxpaEVMSUwzQTVD?=
 =?utf-8?B?a3NzVVBZNi9YVitRZlIxeXMyVStkTzVaUVJVVzAxQnM1c0ZxVmw5Mk53THpS?=
 =?utf-8?B?ZFFWU0ErM2NveXR2N0pvT0tkUnlKL2NYRit6T1pQTGpRaWVRRVVyaE5jMEU2?=
 =?utf-8?B?UHZZaWhZQ0NxV1pmdjhXYXhNeXlhbHVVMlM5d2xSaVFJUDdiWlFTYUYvdjln?=
 =?utf-8?B?U1lqWSticjJnZ0I2Vjk1QW9WNHc2bkh3a2lZWS9ENlJuV3JlMlpTVFNFZlAr?=
 =?utf-8?B?S2VTajExSXNmeGdWUlBqY3l3L0tnRy9ZYUcwN01YM0x3WitVVVJ1VWUzdkNC?=
 =?utf-8?B?TlQzczJSclllUTFoQ3I3ZCtFbG15VGRZQkY2M0YzU3BibUhMcnZmNjI1cHVN?=
 =?utf-8?B?RlpkaEMyTWV6NTJpdEZxaEhmNUs1djFNeG1PNFVTK3o0MWkzWVg0NEkwQmM2?=
 =?utf-8?B?bHlvRWpIQnNSRkt0UXVLSzcyWFhuYmJTTG5WZW9WQ3ZxUjZlQ29VWm9aNW0w?=
 =?utf-8?B?OTdPNXJZR2IyL0N4a1l1Mzd1UnpyWlRDNnFOamhkZnlNZHpORTJ1bFI3MVJC?=
 =?utf-8?B?THhYc3lRQllhb2FGSi9HWitiMG9IMVhUZThtQy9pUXRzQ1hUT29sYUxoRXNZ?=
 =?utf-8?B?MWFBaEswVE9QWEl5S0RTWE5Vb2Z3NWlpTit5TlFvdHE1NjVvSEJtTHA5d1hY?=
 =?utf-8?B?cGZyWlZzSE50UjczZFFUaDNGcHJHNEFBTTlnelNEZ0xWMnZxcGsrLzlWVldh?=
 =?utf-8?B?Z1M5ZjBuL25tc3lxczI0NUd0VmdzczlybjhZM3czL2diYng5YTNKRndBMnlj?=
 =?utf-8?B?MnFVVGxtamwvamRPZ09ZdGJYSDkrdFR5eE1rUFdCcmN5VDFyYUhFelVIUmI3?=
 =?utf-8?B?a040Q2EyL3g5V0x4ZmJIS2VnbDgwMk9SeDAyeng5YlNLWEJpU0Z0UmxwZy8r?=
 =?utf-8?B?cVJRMjJmclF6NFlYbWlWczdMSzM4T0JkekxTdy8zcklBaENwSSt6WmQ2ZGZJ?=
 =?utf-8?B?SE1qSnE4VTNuejJubm9TMXdUUzYzME1RcWdNY3YzQWRMdXFGdSttYzNYK0N2?=
 =?utf-8?B?ejVQY1Y4YSs3WWxzcXZ4VEY3cnZsSFAxendHalE5bHY5NUhLRjdTWnVNQjl3?=
 =?utf-8?B?ZkdFemtvdlYrR3IvcWVhTzRXUFlmTWJwbXV4dmZWUzgrSTQvMFJGU1VUMTho?=
 =?utf-8?B?d0pycjVzc1R3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajBFWEFyYStGTkNnWTBxcTYvMkE2Y2Z5b093MGIrbEtoL1lzZlRxL3RZaFBx?=
 =?utf-8?B?N3VVY2JVd1FLM1pvMkxFYzJiY0xicDUrbmczdFA3T3Y1THZFUXlhaUEvZjk1?=
 =?utf-8?B?WkhZY3RUbHl3U2g4RFUrd3R1eDlOakJYTTlaUUdEYUtySnJnTDNUNHppeGds?=
 =?utf-8?B?WGhvSGMzNnhUVjBKQkZRVTJDalJhcjl1MGI4WnlLbm5uS1F2MUgwb2JTZ2RG?=
 =?utf-8?B?Q3NoYU53clhVNzArMDVYcVN4Ukp2amZTWFduM3pNVExmZmNxd09wRlYrVkNz?=
 =?utf-8?B?LzZyTXlsME9kT2JTTFJWQ0lSekp4bWptRm5na3pLcmo2SDZpckUva0FUT0tP?=
 =?utf-8?B?T2Y2MEdISi84LzZCUDFtQVFCK2FxS1lwdmFQQUR0YTdhUFVRYlVJQWpjaWds?=
 =?utf-8?B?Z09taDQzcVRVeDYzbkwwL25DZUpnWXJUcTVIMXNpMkJudlBTYXdXdmt6UXYx?=
 =?utf-8?B?dGpBVU5MOTdvT3ROZlRWd0p4S3lKU0JEZy85MUEzTmhXemZ6a0NCaHdHaG9r?=
 =?utf-8?B?Q2pKRVNXb2RCWlJMV253Q2tMTXdvajdGL3RLVGRiK3JGY0h3a0g1dHdpRlNO?=
 =?utf-8?B?UnBoZDNhcEN5YTBZUTUycllqWGlIRDRYUXUvM1ZobS9KTjNRR09lRTkwbE5i?=
 =?utf-8?B?ckxpQUo0by9lY2s4RzRHQ3FPbjh5aUxhSWRnZEFuZkRkMlc3MlJ6NUxMZUJh?=
 =?utf-8?B?bEx4ckZGWCs4aFdGRTM2UDlHWmlsd2RRSlFnOC9aTUp1Sy8wSU1GWE1oNVlQ?=
 =?utf-8?B?MXU2djBrNWhmMW1YaG1pdHJaeGpoR05GQ3pZeWxvNEFEM0ZYRk5XMjF5MFFh?=
 =?utf-8?B?Y3Z3WmpObktKbWFpUXNGcWJOMENPR1RGWE9ybzNxM29UYUhsdmZvUVMrTk9Z?=
 =?utf-8?B?UUNPMFBna3F0UlVqSmVaSjQ3VVdzWkRvK2dDZVJtd0krUXVlZjhjaHAvYStW?=
 =?utf-8?B?dmpQL3pnMHRWbTdLODNpSEVFemcxTm1pak5jUHNuRmkzMElFaGQwU25vN3Mz?=
 =?utf-8?B?ZFAxNXNTVTJJRTc3RGRFZHVpRXhnbE5SOFZiOVR0VE1wQjJJM0NuTXpSUUJ0?=
 =?utf-8?B?UEFHdU5MVDVPaWxQbjA1ZVlYRHFGeDQxOUVqdWdtb3hWck9nVENrQmJqeDNZ?=
 =?utf-8?B?SmIwWUk3RW1iTjdTd1ZGNXEvOXFyM0QzTnNCZUJWNzdGYkdnOC9aT05CR2li?=
 =?utf-8?B?SmNrd2l5T0c1ZDdVdE02ZkdyZ1RKQllncFR2SGFGUDJsNWQvaTZxNlZMQzFa?=
 =?utf-8?B?N0dGcGZXNC81ajlvR05SNkxLQXVXcXF3QzZScnFXVHlwc2hTZEE1LzU0Sm10?=
 =?utf-8?B?dm84TVZOZVpRdVI0WndJZ0ZhS0Fsa21xeFlQZndGNndxdEZ2NC96bXZITTlm?=
 =?utf-8?B?MnBXZUpnWEZ5dWRZMXByQ0p0UlBlQXZ1N3N6eXZ5SEc3WExOSzlDbEZwOTJU?=
 =?utf-8?B?MnBOMFJMOWVNUHJzdGd3SGRpaG5lNUswRUV6Q1VwUnprUGt6b0xQZXRTQ25j?=
 =?utf-8?B?YkRXckg0Wk9lL3c4R04rZ3pTeEhlZ2ZOcWp6VE95WEI5YXdmSGFyc2hqak9v?=
 =?utf-8?B?YXJod3dFSTdCcmFJdWVWT05NRTFUL0U0eGZIWnpHNEVQV1kyMjE3SHZOT0RJ?=
 =?utf-8?B?Q0RGRVduVFhrcGc0bDBqMCt5Nko0R1YyVDJjMFV3cm5mT29YVU11ZjBYUkxN?=
 =?utf-8?B?bVUySEZzcUNteThwNWkwdUVYUlVCOFI0US9YeHZlbDNhZi9hdjVDR2pqSlE0?=
 =?utf-8?B?NkVQUk5ZNFk0SmtxMjdYd014SVhxRHZPZTVVMmdJVENJNWhLTzQ5RngvbWNv?=
 =?utf-8?B?L2pvVTh0eGI0YjZtQ1V1cjJoV2ppK2hJZ1NRK2MwaFV4ZTNvSGZvRURBTTBx?=
 =?utf-8?B?bHZtVjdmZXNXOXBKdU5UQkFsVVJQS1VmT2ZOOUNJL2ZLUXNyN2tMMitnNmZ3?=
 =?utf-8?B?akdpZVY2bThnWUxxK0p2dmJ0YmwxVEk0VWk3alVlYTVtTHFsWmlBNWtFWDNJ?=
 =?utf-8?B?eTBzd3hRaW5vN1RDUFRrTkZhWkszL1RaU0Vvb0dFOGJycHRhcC9rd1pIcmlk?=
 =?utf-8?B?M0tJV2tmRHJzQXA3bTRLVnVQaGlSMnVmenhGVmQzaHV0OTlZNURxelczVE1W?=
 =?utf-8?B?Q2FxOGUzSW84L1oyc3pRWWFvVEhoTmFPTENRZW1iWi91Tk5IOEhaNk9XSjFJ?=
 =?utf-8?Q?BYIWMq15to6kcynPkjiE3jEI/F8NraD7ZtpjqQYhptVz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 599dd53e-b2ce-43d1-b099-08ddde4f1e58
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 12:02:35.2718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2DlMys5y30rT5fXpmbuUeE+ol7jF3qdY+F7+XtvLRM2nULn92lVc8HKQj2iHGPvKWfS5WIbtlJgZfMq0K8NYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308

On Thu Aug 14, 2025 at 6:33 PM JST, Danilo Krummrich wrote:
> Introduce the VmallocPageIter type; an instance of VmallocPageIter may
> be exposed by owners of vmalloc allocations to provide borrowed access
> to the backing pages of the vmalloc allocation.
>
> For instance, this is useful to access and borrow the backing pages of
> allocation primitives, such as Box and Vec, backing a scatterlist.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

With a minor nit below.

<snip>
> +impl<'a> VmallocPageIter<'a> {
> +    /// Creates a new [`VmallocPageIter`] instance.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `buf` must be a pointer to the beginning of a [`Vmalloc`] allo=
cation.
> +    /// - `buf` points to must at least be valid for the lifetime of `'a=
`.

"the memory `buf` points to must ..."?

