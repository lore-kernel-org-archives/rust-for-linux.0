Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020128.outbound.protection.outlook.com [52.101.196.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8682043B4A1;
	Fri, 10 Jul 2026 16:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700461; cv=fail; b=hHhf6y6jqkl7bU4uE9lNDF9KJwO45tViy8JD/XwknxxNCn7EeTSseSFqGfWycVUZ5fXyTrfhdX8oGITtGpovcq573+rl3aWLLN//uMTZze5NZlhXHju4JUvnLR3w7blvZGg40XLn2dNVd1Moz3gs6kRpcgGBj57727PPMduXX2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700461; c=relaxed/simple;
	bh=jxTFcQ6KPydP9XRKVphmvID3qJQqsPcD2lgOsvLgG4w=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=KUb5jLhvQh9B5sZEQIjgoFx/mQbDrwQ1pUFX+LBRUWbYuwDvs55IuYKiCOwrCfO8nYKiZ2EMyOyEavTRYzyH3T0LLgCkLHaQ1i9Rr27HEMBSvRt1BxbHnMZ9vwOz8AIMt8cvJje/5e4SUpDOk8K6RU5Furr2bP9AyGdKAEZY1sI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YiQqZvgh; arc=fail smtp.client-ip=52.101.196.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YiQqZvgh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTmyqnyC/zPZtwflDAaUhVDyHNxOZdqCGX5vTBlLTnfAcHLuYsTLUvb2JUIlG30aA2plk7E/GaZYfKgfVO11kzUn0oa4M6dos6iTBdUcGs4w/Tb9XaqNEFQlM/HWQz0AaEErx385rVqfVU/N1u0Arl33Mp7LSWtrCr6083Vgs00irNG8sfMhEFElk053ItsWCMCSGadoul5I3oxPaJQ/0JiRqqCsiBwH0XhL8halkRi4pgJ0OB0PBd3Mc8KZLpBL1zCTM70iA1/ZaSv3RAbSEPwysZOhmlpQ/0cvxM1SwJtOKSlD0pL8ptJIXts6y5zJLSp7Y/JOXpzppilGeu0zwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzAuzjqn32gRgzckzXYSqxqxTPhY/QjW7RGkjpDsBdY=;
 b=mMNMP8jwvmgak/HNMp9PajpYuVrkznl2OIVS8jFnzI9p+Dup6RLpeu4WDY6QonWPfok56J6C3E1GXhszySjAbQaoPOYEQPzAAwTIx3E4+2wpYD5iOTVgAv2qzbpkjOWzwjtp+QtGYYKRzgJuMvtq2L/wx9siX5iIWN1k59V8GtvT/AWgVSEAob/jlcRBr71NAYFew2E+it1qGRZjGKPnMBQlRp3AxHWT6qRUp4Pk1coH1gXyqLKthvqppmnz/AXwWce3x3dPPPDzKC+TdBV5A5fk402g2vm8gCueKMXS4kIDQezeimFJGyZxkbyWpacIZKaMObOgj2Rh0B/LIVs01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzAuzjqn32gRgzckzXYSqxqxTPhY/QjW7RGkjpDsBdY=;
 b=YiQqZvgh9TwtZo9AVQ1eRSV10GMYiDF75tG0Rc0dsKSG1LqLMF8J+W2RFB15cVG06V8emzrCWR4ktTFOyZtW6szt0KgrPII/FJ1Q6LD3weJtu1qupVpViwEhD07Mg6Zu9PexvdcDUKRN9At9UtUxkxVjk6o4A+xnnlEPT84nPsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7266.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:225::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 16:20:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 16:20:49 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/7] rust: pin-init: upstream synchronization for 7.3
 (round 1)
Date: Fri, 10 Jul 2026 17:20:30 +0100
Message-Id: <20260710-pin-init-sync-v1-0-8fa16cde87ae@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4bUWoC/z2MywrCMBBFf6XM2mBapD5+RVwk49WOi7FkUqmU/
 ruJgstzuecsZEgCo1OzUMJLTJ5aoN00xEPQO5xcC1Pnu97vW+9GUScq2dlb2YUdA/7AfXtkKs6
 YcJP52ztffmxTfIBzjdRHDAYXU1Ae6pQTsP03FXOmdf0AgQGacZYAAAA=
X-Change-ID: 20260710-pin-init-sync-a4cee08c619c
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, Luiz Georg <luizgngeorg@gmail.com>, 
 Mohamad Alsadhan <mo@sdhn.cc>, Mirko Adzic <adzicmirko97@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783700449; l=1426;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=jxTFcQ6KPydP9XRKVphmvID3qJQqsPcD2lgOsvLgG4w=;
 b=PQPWpNAUD7e+ut9+G0QU4nsVrvjsmb++0KNh4Tgpy/MZ3fJPnFdV8WTQvOqIGEiTkWcJJwunl
 Dnrc/lg/Pl/A9twxBc7OSoRYe8V9HXNC8/80m19uxVwMONxVl/PSVAi
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc8cd5d-3d07-4b6c-9a18-08dede9f347e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|23010399003|366016|56012099006|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	WxnauAqnLtLaY/LIndU3DYjAYps4I3r5YtQRQ2QAR+2pTP/DJGERyPqnthjkf4wOTunVcYABMkw1hbxZkBBfQYsa4r3x9FtPGua9djb/Wxdp8RH0/W9H7OmHKN05L1f4A+WCdKld6SF7Ow+vOk15zihEp1J+SAuIgXKRCyP+nphdOPoeOZDXEOvulYAJKQYxhXI4ENQJSqWdJWUURyPzrBLcqhOrnUgtC87r5SVi/57IFg/Xiwz2rgrDYySbe/yXz3zm/7pHeW91fJXEm0L6GNhturpOo+T6k6KVwTiAcWE/fgaI7ii20Lcu31IJNaLjNSy5rcF4cjQTk4LL1KBJHX3bMlp7JBvDwZ+x6CtqXkS1uQSWh9ZSMF72CmY5EaZKqutpTACDjg2sfRLm1CJTrNVmM9HQ+RHYcAZ2GaZ1bGs5Gx5rO07St0QnBZMoiY+x6i4PENahUPQLMrIHK9Ycm/hejwUgX+Dfi28ZbgLErRB79oNA7YH3VTOz3WSRiOtqX53imHbjaB1N8dNUSB4pPjToVU8SCCp134PSgW6Oc2ZakPPlYHDFZUdZ9awVMQJCzS9nrg3HEGKVHucWqhdNyTLmRK8xSdiLBtqCuoNL1KuiCAwCHIA8Qi8PEKaGldqumWjfvKicWBdGQQ5Y0gh0Ki0vshD7ZOc/GkiYGwAZ4YQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(23010399003)(366016)(56012099006)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGFra1kwZDFub21LYVNvSFpVK09HdHh0OTNUZGJwT2t2VVVFK2ZTSmk3R0x1?=
 =?utf-8?B?KzVBS1hyMVM3NmhmY0hvaXdzQ21EdDJnMC9yK2lKTGJkMEhrUTRtN0NReGdO?=
 =?utf-8?B?MFpqUjMwYnFQYkxtRUxVRXNiWFdJQWh6RVpEMC9DN3BueVUyTnVvdVBGcExK?=
 =?utf-8?B?VllWZExYMTl1Ukkrc0dLY2M2VzBJQWFKTGc3MnlmUWlmTExobEc4YndWT2JM?=
 =?utf-8?B?WlZ1Z0JWUWt6OEhOYTlMdnpHaHFlRStlc3FscEwvU2ppdWg4YjdsaU9tYzNV?=
 =?utf-8?B?alZZNXVLYkVBZCsvdGJFSGpydnp1UTFCRWlaaSsrNmNVTmVUd0J2WXcxZU4v?=
 =?utf-8?B?a3ZTRE83UVN0RldacjQxV2s1cDlPZHZHcnhFK3RoUmMrNGZDd3lHNVVJMFJu?=
 =?utf-8?B?bHJDTGd6d05rMkxMbmM3YUN2MVBUZFJiRUVqWHFSWU4wR3ZuNjI1YU44dUI5?=
 =?utf-8?B?eTVXWGNJd2VLQVkramI0b2dFV3JmQXUzWU1NakxaQy9XUUpJeHhOWElNVkZw?=
 =?utf-8?B?c1NaQVh6ak1HVG9BdEFZYmllMWtid0Y1QlRub0xkRG5NY21WTUpCVmVrSkxx?=
 =?utf-8?B?MmlIeTFCVy9sRUdwcnlBRmhXSHVYRlQxQk8zcHBRR01UUVcwNGVoTkNJaFBW?=
 =?utf-8?B?RFlmdjlyNjlZdVpkcWlSMy9DbVJEY3cyTWlsdWw0Zng3SjJiUlY3bFZkZ0t6?=
 =?utf-8?B?UkVVWStZWUM5c0psTXVsbjhmOGl2SStLV3c3NEY0b3U4OEllUkdrcisxeFha?=
 =?utf-8?B?RXdveXBLOFdmbEpVQ2Fqa0dJSTRkbmJDanFMZFEwZkxhODVvd3FtSXUrNzNw?=
 =?utf-8?B?ek1sZ2lRNnRNazdEUExDWm5IU1dZcVpwb2pESE1sTlY0aGFRbUxrQjhuRzZl?=
 =?utf-8?B?WUtVajdZRndnckxCOTdxN0NIeWdEc2lMbjFObDI4Uk1kajh3Q1htMnZUMHZl?=
 =?utf-8?B?bDBFeEhHQ1p1bEd5cTNHbjRmeThuVzFqNVZjNmtZbWpTZHFpeWJkTU9Ld3Rs?=
 =?utf-8?B?UWFaS2ZuVS84bk5Memx1ajU0b1AyWlJ1SGFnZDRJME5ac1hsMEVqdEU2cGFZ?=
 =?utf-8?B?WW9xQW9wYVhKcG8yeGl0VUJuanpLa01RQ3pjNnAwcHlIaEltRnlzQmxrR1Ax?=
 =?utf-8?B?U28vT2VvZkdNYm1qOHNCelpPc05yL0E1OHZLeDVCREFhVkNrNGJheVpsMU53?=
 =?utf-8?B?MmVIMXovOHFwVWE2OS9PVEtqOWxyTTRsUG52REU2bU1GeU5ER3RSSS91d04v?=
 =?utf-8?B?bkd1UGROV3lhV0RKb1VuWEt0RDRGdWdrckQ5Z3BLS2Y5VUNTb0drLzFQNlFL?=
 =?utf-8?B?alJCdlIwVkdqanVQMTJ3ZG9kcmt2L2tFUWhaUk1QZllydEpSeW1mL1lwUWx2?=
 =?utf-8?B?NFlNeXpNT0NpZlpLRkJPRzU5UE5NYStTTGxUeHQrWk5paTRtWCtRZFE4Um92?=
 =?utf-8?B?bDJDT0ZuMFYralVWRjdzWjh0N0lTMC9QTXVPZTVhTVM3UmFudVdaZHhmeDRE?=
 =?utf-8?B?TkV0eDNaYkdMSWdpa2JVQjBlTHhPZ01iTGtoMHJpVGg3OVRpVmwzM3lnLzFa?=
 =?utf-8?B?QXN0U1UzWTUzdkpLSFBDeHlQTlUwcE41cDFnTHhteEZOYzZDd1hEM2Nna1l6?=
 =?utf-8?B?Qzh2TXN0dzlTMVF4b0lERHJkbWpoVmtod2ppV3ppcUpnejJUaDE1cmVqSXZu?=
 =?utf-8?B?RWkyUUg0aUhRalJ4Mno4MFRIN01UaE1pYTNqcytpTHpRMGRSY0JGSzB1WGZO?=
 =?utf-8?B?RVVGTkhVK2V1YnpucGJYREZJcW10cHpjek13L1pVUjkxeXNLZnlzN2d6NFdh?=
 =?utf-8?B?c2dWc05kQWpZWkgrejhqYUV4ckhPdEpSbTVIVUQzSlpZV1BiOVFzMWVKU3ND?=
 =?utf-8?B?SklvTVpvQ05LTmVYL3BUMGpydnlLaFZUSm1XcFFmT1VQc0NLOFQ0eWJxUGpu?=
 =?utf-8?B?bjFUWXZycmNNbXhjUUJtL1Bad1ArUDJyNjVKYTY1RGhQSklNU3l5cy9xVVho?=
 =?utf-8?B?OVBtb2lZK2VFUkovVWMvbFFxZkk4dld0UnlBWnlsL05CbzlNbXJGTVVqa29Y?=
 =?utf-8?B?ZTY2RkNCeEE5RGZtU2RTZjlYR3BMb2xnL3oxR3FydGVQaEFhYVZzRCtWdHI4?=
 =?utf-8?B?UlJNSlR1TGZPa2ZrNjl5by8wVExVMnRMME9zVno2QU5saGxqWkRrVG03RU1I?=
 =?utf-8?B?eDFSUTNSZFhXWXAwZmFpTmRyMnRVSGN0a2kwbGJHbGNoY1h4cmp0c0Z2N0Fr?=
 =?utf-8?B?dXFjdGNjT3ZVeG40VnJ0VU53UUJiWVJXR2NoUXc2bStiSmY3SmE5YmpvQlEw?=
 =?utf-8?B?ZjErM0dpTC9PM05IY1N6RXh1OGpPSGRPQloxSW1FbHY1V0w0Z1JNQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc8cd5d-3d07-4b6c-9a18-08dede9f347e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:20:49.5752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Jg5HHeiv7PW2tA9W8wOa3wVh4t6pMJ50Ye1vcFvS39iXIaBuv4B61oe1ks/LM9+Vxs/UXksPRIY8eBWwHIbJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7266

This is a series that synchronize pin-init upstream.

It includes the following merged PR:
- internal: error on duplicate `#[pin]` attribute
  https://github.com/Rust-for-Linux/pin-init/pull/120

It includes the following PR that I intend to merge soon:
- Lint cleanups
  https://github.com/Rust-for-Linux/pin-init/pull/160
- unwind safety fixes
  https://github.com/Rust-for-Linux/pin-init/pull/140

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (4):
      rust: pin-init: examples: fix incorrect drop
      rust: pin-init: remove redundant clippy expects in doc tests
      rust: pin-init: internal: stop using `expect` in macro expansion
      rust: pin-init: internal: generate brace in macro for init code blocks

Luiz Georg (1):
      rust: pin-init: internal: error on duplicate `#[pin]` attribute

Mirko Adzic (2):
      rust: pin-init: make `[pin_]init_array_from_fn` unwind safe
      rust: pin-init: make `[pin_]chain` unwind safe

 rust/pin-init/examples/mutex.rs        |   5 +-
 rust/pin-init/internal/src/init.rs     |   8 +-
 rust/pin-init/internal/src/pin_data.rs |  10 +--
 rust/pin-init/src/lib.rs               | 151 ++++++++++++++++++++-------------
 4 files changed, 101 insertions(+), 73 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260710-pin-init-sync-a4cee08c619c

Best regards,
--  
Gary Guo <gary@garyguo.net>

