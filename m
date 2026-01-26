Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1261333984E;
	Mon, 26 Jan 2026 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434158; cv=fail; b=p3cOsBTSl1BmIizgIT2AU2/bK2FVCrzzriP/OPqGqPF2jrrmMEy4rXFvZsEAoLk3efG2TcDi9j8uu+XqexbSRKmo1Q273kTS8y9/wXb/OOj3Jvj+QyE4UaOEh4RaDbxRyMMkqEA7cDpecw9qp6QeNU5oZQxU54cwhbvFd0Arc64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434158; c=relaxed/simple;
	bh=jnflilpLiKX+TVKHkAg6Qql87jCk4oerEonJC4HJtXc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=emSJPC6PUk1FnXbSok9m2Hqk4uO9s2gIOttrz6gift5ncxvEKVuFHaIwTUWNio7ipI1ASN+gpePo++I4TYFic9RdPMY22kdiT5J+6ZoDaiK/QGZV1ZenRBGMAfrAWLmpvm1E74BhFIRMZs7AAcY3/rQTfPtSz9eUHySxPuKeJ6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YBOCguCw; arc=fail smtp.client-ip=52.101.48.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YBOCguCw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkG1QNGU6Bg4XPOl1qCY1TO2lEVC6wS1ade+lftyoVfKpsWnG8VJTAUTvEtSZYDB3zfCapY0iy3E1x4m1kTQq/Mrc66enO/YE6nz7gaT+RdV3kylFLaR6gvJIWiSQLqgRQVA73MOxEPYhnnhDyePBBMhWFD9wux7E/0XfEg435/bEeDkPmePOUOllAT03eMeC7BpIZ3N80v1fzNfljL5431H8HPodbCS3CWJE8mhlVRdSOjn8VbiJ1E56tnQBntWn3S+YASKMZTChDD2Jm0I98yqI6RfIkkk+0nzfohYPEX7W5UlxasUJTPvXgWu1E3zwX+y8ThHuliMx/Bptadg0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otgn6OT1DxDnwPoMIHj1l4EFVJY4Y9u9pszrXUdtBIk=;
 b=Hmz1Kz01F92DF1Zqbv5r9Rb2Jib+6cYxASTuG4y9h+fuQwi/elh3bDGVKgY9AKfjHZwgCI9310MLF9NbI2PXruOcV1tCK/8TgC7ial1cc9zJZf5aZNGms8Ut16UZu0acusz8VCx0t0TRWGhTOOpQ8qgi9xIrdR6MsV2J8H4cy8FHrrQ/fZsK+sUb1xpo8EzDa61AyD2CML6nGZRfEpGl8QpK439bZvNj/oXLiofrFfDz/HOdYhgtiw7v2M6bhdiC2okOLa568NvYPCLjeSPpbqYbRUBmL9ttsbqLKRYnQrJg/ABy6QyP8MDK2tok7NsVZxqBGs/NFKzu+xIRAfKcvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otgn6OT1DxDnwPoMIHj1l4EFVJY4Y9u9pszrXUdtBIk=;
 b=YBOCguCwrzco3nv3uWDQiJCl0FVI8n5j4oAif4Znej4Pw+SvpCziJDdRXCAJ/UAKy2biJ/O4ZRWdzWHYzH5f8+KIG/QkbGZnPtDFXCCCg7bijvLUUqRDhUMk48N/Pt2eAFtaNuyOXFq7u/KcNvZ6XpQF2xJWELWgpxgxDxTRH59DeLrgdBwxzPdiyt3MyRceU6WfJ4SVIbBcP8FK8ThaAxKvzsk2s1huh1yv/9pgZKCAE9nlQnkNN2DQ+ldNvvSZXLN9Yson3GCcCSv7b1qNL4WgkGIqEX68P7n+fn/R1Ky6M+bujdK3UN6lab4f6IqwU4qUoDZ/ThYs02jUSAkIWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5942.namprd12.prod.outlook.com (2603:10b6:408:171::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:29:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:29:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 26 Jan 2026 22:28:42 +0900
Subject: [PATCH v3 3/6] rust: num: add `as_bool` method to `Bounded<_, 1>`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-register-v3-3-2328a59d7312@nvidia.com>
References: <20260126-register-v3-0-2328a59d7312@nvidia.com>
In-Reply-To: <20260126-register-v3-0-2328a59d7312@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: b080a44e-67f8-40b7-75bd-08de5cdee12d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEJzYXVDMU94Y3NoK0plcUM5M3FRWGM4KzA0L09Pak8yaDMyT1N5a2dYRGo2?=
 =?utf-8?B?OU01SFFpR3FjT2JHZGtiTWhtTVVmMGJXdUlXZ1JLRVNsWnA1QzM5dDRWMG1V?=
 =?utf-8?B?SDhhNDUzY21PeEZZd1ZUL1pESDcrKy9zSTBHNEJNZ3ArSUlZaFV5czUzdUY1?=
 =?utf-8?B?ek5MdWZPbmkyYlptK05USi9tdFpocUQ5K3lidE1rVXUvN1lCS0lTY2Z2RGhx?=
 =?utf-8?B?bTJ0ZmZPL0lwM0pVdEpvWmhvdGNkRWRYWmVNZHgwdFBFa2hPaGx2SW9uWElU?=
 =?utf-8?B?S2prbDMzWUpWWVNiWm5Ya2toK3IyajRXWU90N0ZTOHVUbEN6aXd4Tkk0Rkpx?=
 =?utf-8?B?UXNpR2xnSm1XZC9oK1RJZHNtUE5SbmdvTmYrZEhsQVllQk81TjBRRldHb3U5?=
 =?utf-8?B?aFlTRCtxTnVhaTRUMUVsbzlyakJUdzQ1V29seXM2REVUSkExNFFqRk5qMDJE?=
 =?utf-8?B?R3lyNW56RmlEQTk4cUxsTStLaEl4ckVneHFQWnErUVdrb0VjdS9jRytBdkx4?=
 =?utf-8?B?bWF1T2g4Z0NqUkxxcHBNZERSUWs2Q0Nkd0huYytjVVdkOWtneVQ5N3pLVXBU?=
 =?utf-8?B?WDFmTmVkRG84YXpzTkx4c1ZEM3g0SUpZd2t5UGF1QXp0VU9COXc2eVQ3Z2pm?=
 =?utf-8?B?M1ZBWUczUWdZdEFXeEsvMGNIVDZmWSswemliSkRrWi9FNFJVTitLRlBSUTdH?=
 =?utf-8?B?L0Q5bVJXeVRqQlNuOW51Qld0TlM0TGt5czJML1Y4d2s3dkx4d05Uay9VZlNt?=
 =?utf-8?B?ZkJYRzZnSmFPVGlYck1YajRlZDI0Qkh1VGt0R3JmVHdWVmxQT0kwbUV4RGZu?=
 =?utf-8?B?QXpMYUdFQ2U1OElwZTlpNmhibHZlQStiYnJkdVhVM3ZTTXZ1TjZqKzY1RGVV?=
 =?utf-8?B?T0s5QjBHWFJSNzM0bjFSUytrNnE4VkdOdk50RUFvdW5LSkdWaXJXVlZseHVE?=
 =?utf-8?B?ZGNreDZQZncyRG1wejVLNDcwbzVMYXRrL3hCRXduVEYvWk9qd1VYblFZWGlF?=
 =?utf-8?B?Nkk0YUZsOWt6Yjk0MHp5R2dsMUpqM3hmV3Q0WTRIVEQya2k2aWJ2MzFiVXNp?=
 =?utf-8?B?RVg5MUVuWGJMbGJuajBVZE9yekFuWHhlZFJ0L1BaZE1CWFhMTExPdGpzc01F?=
 =?utf-8?B?S0haWEFRaGtBSmF5ODJiU1l3OXJSdHVqcU90VzdSMHliWnlyay9DT1JxUnNl?=
 =?utf-8?B?dzBacDRwbHkyR2JzSDRGNWg0UG9vcmF3eXFoL1ErNVd6SlJoR045WHh0REZC?=
 =?utf-8?B?aU1YeWNQTmhGNmc3YXFsK2dhUEdEUU4zSEhTS0gwTG11S2RobjVxeElLV01B?=
 =?utf-8?B?a05WcFRNajNrczdkMml2SHh2UlBrWXBrZS96Qko2bUhyOWFyRDNKOEU1UlYz?=
 =?utf-8?B?ektCbEV1Ymg2dDd1MnRaZ0N3SmhHc21DcWlHMW4zcTdFNW9HajB1aW81aVJY?=
 =?utf-8?B?L0cvdGtOSXNINzVHTEZSR095VXJlYkc5aUJrbys2WXcyTGhFcDh0SkxhMXVP?=
 =?utf-8?B?UXNsaE9GQmxUaEs5MUZLUEJERG50c0drWjJIaVpuRE5KT3ZLNTdsb3dYRFJt?=
 =?utf-8?B?WjJXR1ZDZEsvWlA3czBWd2pOaDk1d2gwdG5YVmZpSjQvVlpwVHRUd0dBZzBX?=
 =?utf-8?B?NmpSY3JhdkJFREcxU3JTaWFiem9XdHVJTGxmNitydlR5ZTV5ZWZFSTdrVFBO?=
 =?utf-8?B?WmlMcW83MVNCQWRiSU5KN1hXZzFxcWxUbEtWd2MvbE5ySkFNMHU2dXFlbkZt?=
 =?utf-8?B?czR1ZGZBZlVydDBsZ1Y0Zm84OGNLTEpWV01DUVRodFVwM25RZ3c4VllxK2Vu?=
 =?utf-8?B?TVNHTjJyaTZsdENvazB6RGs5WTBZMklidmRkWFptN0VnSHhGQzAwUFVEMk9K?=
 =?utf-8?B?djRMWU9JaTFMS0JKUjN5cmFEVUIvYzYxUjhzTDNBRy80aFMyeUdCZjh2NWcy?=
 =?utf-8?B?aHV1b2xSTGUwcjhNeWdPRFdTRmlWWklHcFJpclhyMzl3SFg5ZUtaamFSZTN3?=
 =?utf-8?B?SWNPbjF6cXFnMmRDWUpqbEtBYzZ0cFd2bjRVN0llMWpwK3lLWEpTTDUvbnJS?=
 =?utf-8?B?YVFCeW5CaHFUMzdnV0hBS3ZNUUJ0S1pRY09YYURpVmhWVjFtWnBNVHRTa1pa?=
 =?utf-8?B?Y28yUSt2SlE4VENRT1NuVHAvbktQdTVjWm5MU0Uzc3ppVElrVGw4UDQ3Q2JZ?=
 =?utf-8?B?aXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1RoM1ZHY0pJaG9zWWNiaEE2T0NXRktKM3kwd2hNR3k0ZWtnRzgvTnRkczcy?=
 =?utf-8?B?L3RiSWcrZTNLTm56N1hvVjZMM1RhSy9qbG0zeHZBb2ZtbVdoQlRhQk5PSXNj?=
 =?utf-8?B?QnNoVlNHbmphS1BOREFqVklDSWtLRGFXVzhNWXZhb3gxbmRsbjdDUy9wRitW?=
 =?utf-8?B?UzJRYTE3Y0dLN0EwaGMyWXNvSURKVk90Snp4UWFOQ2FYa2RTOVcxOCtQcmJI?=
 =?utf-8?B?WGJHTXFHRFA1bGlkSkVPTzBnTWxYL0VhemRpV0hTRWpZT3pYQytOVXFEVWNP?=
 =?utf-8?B?Y3ZpelVtbzQ5bjRvcGVZY3c2MmtDbjFxUlpGMllMUDBqVk1PUEdtaGs5R2Jy?=
 =?utf-8?B?TkhyMHlsZEZCUTVjVTI4MjJSMFBKM2R6YW5pV0xvTldJRGt5T0N4MmsxWTJv?=
 =?utf-8?B?MzdwWHY4b0pYTjVhYklPMkF5MU82WVJqRFczS2Vnd0JlS1IyMnFQa0hid3A2?=
 =?utf-8?B?cUFYeUpDS2J2MFRXYU01UXludWFZYWdYNWRjdnVvNlJUNVlqNk5ZbGZMZ3BS?=
 =?utf-8?B?eGcvUHdtNlArYnlmRlV3YUYwSG5UZWo4TFRFdHdqNDNndi9FNmZUbG5EU1Qv?=
 =?utf-8?B?dmtEV2ZsZzRuRlNodWNQa05OVlVPVlI0MnZkVGlVZGZXRmNkbXI5eDdLMi9L?=
 =?utf-8?B?WVcxSW1xYXBMUVpCWXNScS91NDlBa2JFY3JSNEhVMTFQeGZoVnhRd2pDR2VC?=
 =?utf-8?B?amhDcXFjZHhKWUlXNUNyUUpwdjlCSEVCNDlSbXl1WnZTRnoyZXMzLys2RmIy?=
 =?utf-8?B?L1o2YktUSXpNYUFIeGR0QnZ4NDl6cmZheUpTUUJJQmhNaVloOStZekh6aHJI?=
 =?utf-8?B?ekRyN0ZUSlJRc0JOWk1Xbk1PVzZHUExQMitrNEVuVUhyOUdjVHZpV1U1Rkhs?=
 =?utf-8?B?Vmg3dFZBbUQ2S2UreWl5MGtuSGpqSDhuSVBJTGp2LzhEQUFSZWRQaHRVdVhu?=
 =?utf-8?B?VEtjWnptWWt1NEE0M2JuR29sSmc1UFIrWjlrL0dIUVVHYjZKaGZ0VXM3NzI3?=
 =?utf-8?B?Q0IvUkhoaGRYam1laHphU1BZZm5OcEdkNkFZcG92dzA5bUZIL1NSUjN5SGNT?=
 =?utf-8?B?UVg4R25aeXdQUlNEOUl2RHdjdTZ1QUFyMTNRL242MXhydkl0QnhJQ1pDdkI0?=
 =?utf-8?B?cTFYRDVGTGl5dWZtRVd4RU5VNFV0ZUs5R2c0bXJCZEdBeWtyVzFJTC94YTh2?=
 =?utf-8?B?MXRVQ0FQaVVucklpTFBLbkhwSGlLSXdOZEE5Y2lPamlFbmhjQ0U5NWlrSk5t?=
 =?utf-8?B?dEV4YWJ2Qm54bnp0KzJuSzV4eGVDVW84akFCYWIzV0NTQVdHOWs0YkU4bnBE?=
 =?utf-8?B?ME54REJ6SGFSM1VUSktpRGlCRW9GNTlUY3Q5bU4xclIzenJWUFcxczh6OHRH?=
 =?utf-8?B?VTU0QTJpaWlQT2xFcDNLdG5EMEpKdWNMZ2pKWlAwa2FiS3h5N2dEOWhNSkVP?=
 =?utf-8?B?L0ZZcThZY0YvTkNoeFVYMmJ4SWZhWndqVENCNVgzTGpzdFRYbnRaT0I2Qmg4?=
 =?utf-8?B?QXc1RCszQXB1dmVQc3Nhc1M0NFNvV1JVMUlpT2pPbS8rNFBndVcyUG5LVGpN?=
 =?utf-8?B?MGRCc1BmaTlSRjBjY0tyWTQ3QnlYL24yWjhTS3dubzNKTk9rcmdCdlRVdWow?=
 =?utf-8?B?TEk1aUw0VUp6QVQ4bElyNkJqRHh3TXVxcGlPQk9ObjhiYlA4cENUTUwyc1U1?=
 =?utf-8?B?a085L2pGSWlQV1ZDYWpRVWZNUzlZaHVxNzNnQVdNT1gyWUdYaVRxUVNFTko3?=
 =?utf-8?B?NDFySWRpbCtwSmJqcno3bVdhc0hGUjZtQ2NnOVozaWtBU1Q1eHU5VjVHTmIz?=
 =?utf-8?B?bXpxVlhjS2IvcEYwa3FGcHRveW1LTlFPV1JubnJjN2s4eDNTdEpLaVYybDIw?=
 =?utf-8?B?SWlXQ0ZHdVVka2o2dG5iendkc3FFeGk2Y0haZzNQWS93aTZRVnZhUFlpREdO?=
 =?utf-8?B?TDEvVUZSSzR3emszUTVoN2dzOFRtaXRYUkNCMWVRUC9jajRneWgwaFlkeHBp?=
 =?utf-8?B?TWlTZEtzWEFxRHc3MEEya1dwYnNraVozMkpmS0YzOXRmZElYZ1pEVHBONEto?=
 =?utf-8?B?NFczQWJOcHZobWZkUnhicjRLVFlBTG1RakNQWFF5ZlBDVXYvUXk5b1NDbGM2?=
 =?utf-8?B?dzQ5bGdyVmhSeWpJWU05NmJFWDEvYVYyZFgxWFo0WG52ZE9Icmt5TVFmNXhI?=
 =?utf-8?B?b3ZtTkxWRnRBMWFnVTBIbDBmaVAyTW9BSldzTUw5aUtweVFRcnpZK1ZtS2Jq?=
 =?utf-8?B?STN6NzBrNnhuZ0Q3V3pKUXNsd29vejlSNC9uOTZVajFIUFNQdmR1ZEVuNnhK?=
 =?utf-8?B?SFdxOERxZTdReUdjZ1Jjd29XdzU0SWdrdHlEUitEOXhvZDl3Q3BwZmtYTUFj?=
 =?utf-8?Q?y5IK19cAHbyQeOCCSQjbPqQ+ARy5/3iaCerHC3X619CIx?=
X-MS-Exchange-AntiSpam-MessageData-1: 3hwJ8pi4EjZzMg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b080a44e-67f8-40b7-75bd-08de5cdee12d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:29:06.8284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVbruLhqytWmIF6DR5abmXtnef7y58IlZzpfU7UME3h2VTx1FMTEniAes8I2ndK7xntLrimgxsoF5NS2CZkUTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5942

Single-bit numbers are typically treated as booleans. There is an
`Into<bool>` implementation for those, but invoking it from contexts
that lack type expectations is not always convenient.

Add an `as_bool` method as a simpler shortcut.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 69e718153137..a629931915c1 100644
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
+    /// Returns the value of this `Bounded` as a `bool`.
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

