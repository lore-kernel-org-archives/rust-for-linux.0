Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022118.outbound.protection.outlook.com [52.101.96.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E9338E8C9;
	Tue, 12 May 2026 12:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587802; cv=fail; b=WFzpWVe9OnCdIIcaqrV03oXTaPAuAnQj9yr1RgwfFD+LAForPjlcICkTvBqjWkLJ9S43LCd+QARlD2+6mKXGx1xqjoTg66nj27g7ans0EG1CbTVOUeWNgrf5SBuoFI7RcbBY46JmA8uuOLIQdh6ECAVXkgY7l/4mOqKmg2gHl2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587802; c=relaxed/simple;
	bh=itRGc0wrNeniKTzrtActFm4JfxtGYQhm6cmi9a1K7y8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=bV5VrHVCkHcBMQINYgm2KHYtyIcXh/8Z6Lhqd7eM1x1jM4O1/VEfuyVYleXuLfoJHYFZe/VJF7OD+kAa0GJStXgTKlib5lG/t+7TvND7sKX3vbmLmntYj9rxExQTOveN3lfxdvUAeIKBsjsc7zmnoXZ8TLMsrys4NDBbvOIYcq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ryAJyptb; arc=fail smtp.client-ip=52.101.96.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ryAJyptb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIIbQlQ5iXAiQM3gYICT4mbnomxnogVVwWWrHEwhXP2gu3y9AjIqlPt0oLvBCmcEKGrZ03ypb4fcf9dE9RKWANUT0hb3vKOqhruHNTXufIaX+NsIwi8B7705iqqltLADYmSMQCWfksqhtBk2eF68Ufyv1AwQdy7C0twuE57TS/cQZvrE30P78cKAOvOUlNTt0Qo0gy/wgrrjpT7qrlzZZfy2UCqkgfXbuyNI7T3d1iOyOXIwGdr2jJQcUoa3LjGu7gVwDn/P4sEXSyOG1Xt276OGmUfPPifhuZW9dGcmxu+MtMPu0/3rhDVWZwnhPsfdxqxuyKjF7SNS1rqstZA5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiOnjnI3W/OdMat1YBSUiMSalFC6X4Itv1eN2jhoMG0=;
 b=PfSMt3mmhzI4mQvqbc8T1ZCfDMrGk9E9pSCFQ6m8ZvGzhtr5hBl+MiHFk6bbcArvyv5aJWE0Qhj8aKkhDW8nxs+KvGl316/5FT6acLATzkHPpThy25yZuJuHmBmMqaM3tJ4UdAiHyNahKF0a0zH0vW55WmdZsi/9GZC62AC9gUG5+sBRsJsRG6ehpkWoojT96OZUa80hw5ACiQK9mhA1dJMXaexESD3GrG9zdZHtC8QfOd2aXhuWWyhi54miYJvQhEukjUDyItsbsIbVDb+RT5STTkqud32UkMGNb7sghoDK8SD8FRPOAGTSQYf9Tst4ZR0xmbIEfVcWSybKusCi9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiOnjnI3W/OdMat1YBSUiMSalFC6X4Itv1eN2jhoMG0=;
 b=ryAJyptbJnhsB2mLmDkJjz4ecIRRF4TLgMXl/rULbTlEBuh+bYdZjr7MbQJk77gRLUdRnW0yshhYMr+b0EcS5hSROF/AYZ21he9XWKowX0fhY19KshVUPd2MFGZg9Mjo3IQeRa+p7wMuZ1z+Ru9HbA7RAcGJRp95lIdh83dVIec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 12:09:55 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 12:09:55 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/8] rust: pin-init: internal refactors
Date: Tue, 12 May 2026 13:09:45 +0100
Message-Id: <20260512-pin-init-sync-v1-0-81963130dfbd@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIkYA2oC/yXMQQ5EQBCF4atIrVXSLYZwFbHQPYWyKNKFzETcX
 WP55eX9BygFJoU6OSDQzsqzRNg0AT92MhDyNxoykxXmYy0uLMjCK+pfPJLJfR8HZ6oS4mcJ1PP
 v6TXta93cRH69I3CeF/0czbtxAAAA
X-Change-ID: 20260511-pin-init-sync-e04cf605b097
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, Mohamad Alsadhan <mo@sdhn.cc>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778587794; l=2022;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=itRGc0wrNeniKTzrtActFm4JfxtGYQhm6cmi9a1K7y8=;
 b=v2czEtguiANrOjArs69RWBHHurT6bNAgVW4JDXU9Z2SBQwGs5DqXoNiKZ5XaiWKNCxNys2/6R
 9hxya7MBC7sCToTfyq9xyfK4i3n3gzHIqu41kIVPNO5JUZq61I5bABg
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a2d071-153c-47a5-717c-08deb01f60f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|3023799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	0I/YR01qqIEo6+qS2RlFw8EC3OLrRS4C/VLeQ1WZb+maoutBGhy9xSGShsqLrGJkQBfPmT6dU7lvUeMfUkhLc0opiNs553k7OPVvqo+uWjkscgcKByiZQwo+l1ZQi58yfC167tQVWM4GZ9IC8WgdtdbshB4Q+42wtD2Z/eMWZlStdUxFt1KT7SKjgpYfAr6N6kCnmBk6YHBam6+hAM75rxqrqVScrQAptnyZDmPXA9EQpFb02gAjmrFGrFq10opmkZHrN0m+4m4N2Ek1FPjnYg+Kf/dhVIduGlOnuhZGhqzyaLWdaHkqx6EWoju3nbvzuAZRmjVZrx8LmZxcuLjc2dwYpw0ok58hTbA0m453/WWUZ4BQkKPnLYhAUW7SmFQxLRTEEPAOIni6ex35E4qvQlNKUnw+mgmWZecyatuoMZGMpUo+3kn/CLkr5oM7v3dbl5p4QL9jpdBFiIeuNBJ1BsSXSA4MYmRSej2nyk3Wg184sVPppXoeVOMIawCkBinpvEam028aX0iw/wi7W3h+mdX05AU6tqv/luDr6lb4dbVUj9Vq2FxMG+IAwCy0seGKau6V7ekUY4cQjAKZx4bqn0T7eiSLR5qdJC8uotPM7IUoIGhxQ52tPot722HnaGsWCffFoyu+veYn4aOXU+NuJgvknAU2kajbIj4bUoDQLS94CBBYRPV2fNguO0R+3FNc8U2IItZhh/LuLM9zdFWOPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(3023799003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3A1b3RiSFBoOGFZbklSMHBuMlZpWE9CK3JSbDhYS3NXem42SVd2ZGZWWEl1?=
 =?utf-8?B?RnhNMVlibkRzSWhKdWh1OTBndmtIeGRvTHFLY1J1VExDZVNpb2o0a0Q0ZDdM?=
 =?utf-8?B?YVFTNUthbjN0cEJPeDlGMDhXNFZBWEorUXpRemRNVVNOdFpwR1lBQ0NkMXNZ?=
 =?utf-8?B?Q3FoOERpRm5Ca1E5Z2ZBQldlcDdNTk5EM3NYQ1lFbGh0UHI1QjJoeUhwQThP?=
 =?utf-8?B?Lzc0dE9mcXRPQjlyU25tMzhnd1BrS1JIemc2QnV6VUFtbkJ1K3pwZnY1OWpp?=
 =?utf-8?B?dzRvaHVBcW9OM29memR2VjBpZk51bTdUWE1UZ0VIbWV5ODlLV1JoQ2NyQSti?=
 =?utf-8?B?MWQrME1KeXVxeThUam9UU0hRZFpqL1JQVzdZS08yTEJlTkJZM1Q4ajlIMmtG?=
 =?utf-8?B?TmZYUDBaVWt3UWFsdjRBTlNLYVhEci9STjdxNGNtUVprblBTNWk1THFZWjNM?=
 =?utf-8?B?RnEzRndoNURyRlYxR1FrMnpnMml0cE54Z2JVKzI3UTRvem54ZXBXbmNIMC9C?=
 =?utf-8?B?VmFGbC9IZXRsR2Y3RlNUOFRJV3VoMmNicmNDNzVwVTRINHQyMXl6UDVwYTZx?=
 =?utf-8?B?MTlRVXc0U25MdDNnTXAwZVpKVkIrM1Npc1ZJR3VtbWdvNU13R1ZiK1JWWDMx?=
 =?utf-8?B?M1NZdGRteitPWkhTaXQwYXFnNkp4bnhxcjhodWZDUWMrOGtyRVc0ZVRFbVZK?=
 =?utf-8?B?dWMzQmpJVU9sdWI3U1FzMjJ6UXBVWk1rdWdlM2d4ZFozVjlNWEw5YUFEbzVl?=
 =?utf-8?B?aENNbzdnSnZqb1FyMi9YZ3NBc1pKZDZRSVd3WGMyRE5NSnROcGhWMGxlc25q?=
 =?utf-8?B?SlRkNE5mYkhnT3N5L3loWTEzNlBTVDRuV2NFU1NFeWhFYmRFZVB4SDRIeU5C?=
 =?utf-8?B?UUliTlMrWW5DQndYSlI1K0JyaW5yUlk0QTZUMy8xcUFzWWN2VC82OEtNMXA2?=
 =?utf-8?B?U0xEMGx1bGpicmV6TnBkbzN6a2IyR2pWK1dLcUFnOTdTRUVjSCtXQ2QyRFBQ?=
 =?utf-8?B?TktvWm9rNE54eGFIVjFieUdaeXlMN05lWEVEVmQ0UEhjdDlyMDFuUUtFSlMx?=
 =?utf-8?B?a0NOVVNZcnhTaTRDd2s0OTdQM1FLckhBY1orRFBzeGlzSXFUNjd1Q2hsdThx?=
 =?utf-8?B?M1hhU1hxSXQzRHBKRkFzUE5obHZZU2VUVnQ2Zjk1T2dVWDNHRGhQT3c2T3Zu?=
 =?utf-8?B?T0J5SzZkOU84U1d3NDY5WE9Kek1jS256SnF0RXoySkNhbjhONzZyZnhDVkdr?=
 =?utf-8?B?Q2xpSjc2UnpLeTV2RUVPSjdzV1BjMHlLRURrTUdMUHBrTmI1cE1TeDV2NGlH?=
 =?utf-8?B?VE11NlMvZGxDTno4ZUxpNVJCbnpnRHBkU3FrVnFYOC9Kay9QVU9vZWhKaXow?=
 =?utf-8?B?cVJ1SjhDQ2pIM0hVQy84Vkh4SDgxQTVSVkJISHR6WmFpRm5ucnRUZEtoSzNZ?=
 =?utf-8?B?Z1pTT2NTUFNYNlFHV3BMSEk0U1I0ejMzVFluWlZJUzdEdVJxR2ZNZVd4YUVl?=
 =?utf-8?B?U3BQZnBZWThlSEsyOWJFZWRJYkR4eDZqQS9KWURDUDVndDZqMDBtOUwwNkx4?=
 =?utf-8?B?Unp3YUlCRjVrR0UrdDVHOHpJVU5zRjV4b0wrN2hKTGFSQnRtRDZ3Zm9hYjJn?=
 =?utf-8?B?NkhDNEFBblk4QnFhc1RBbENZQWJvUjZhYWZmQkx6WTBMd0RKdm1JeTJaZDlJ?=
 =?utf-8?B?MGtWbGhjQmZJV0xsQ1Z1TWMwRHRCKzBkNldSWnNzMldwcExDV2dCQUhUd1Er?=
 =?utf-8?B?dm1mRUt1TC9qYWFYTElDeUFnakZxcGh2MG5xNTIwQTFHOHdFQjBJekFvSGlU?=
 =?utf-8?B?dHAzNDl1UHZQVkNtRUd2Ykp5N21XMWRVSDBOUmY3STFnVllHWEk3enR5eXVO?=
 =?utf-8?B?eXJkT1VwZFlwYXQ1ZXNMOVp6U3FWT1FkTTZTWWkxYi94ZFJLNVJld1F6L2NL?=
 =?utf-8?B?QnVIQnR0UWVobW4wUVc5RENwTmdnWWdwaEhQa1VHTzdWUVFmcm1hUlF5SGZD?=
 =?utf-8?B?U04rWS9uRFcvKzFleWdqYmFCek1KSU9SN21wTVR1KzlvQTExaFZSMHVFYXlk?=
 =?utf-8?B?RExMZG1Fd2RKREZ3Qmd5MnpHOTNKVXozK2VxWUhZM0JrS3l0OFpYa2NWbjYx?=
 =?utf-8?B?LzBTcTJRTkl2WDFLYzh5cDVScFhqWUk0NkpDdDgvaXlpRk9RV2JHUnNGSFdB?=
 =?utf-8?B?QUdzY3NpVjljdHhkNGk1TEs5YllnQ3plaEx3aExVbWtkYzVucTR0RDYzK3lj?=
 =?utf-8?B?dnlGMmJVUjFnRDQwQjZveFdyVFBNOUtzTHl6Q1EvNlk1eTBtQlZDRnBUaWkv?=
 =?utf-8?B?d2IyY0lDZlhtZjFaaDRvOUpTSWl1WldxcFREeVNneUQ0TG1md000QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a2d071-153c-47a5-717c-08deb01f60f5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:09:55.1684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDGrIrSc65JexbRhTpFk2ELlG5fNi9FvD++xZmshEkiGcqJu9bXoOREdDq2KoD2Dle1sJkesA1mTO0uk64/Dsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6214

This series include some internal refactors to pin-init macros that
simplifies the codebase and allows new features to be built more easily on
top.

This includes the following upstream PRs:

- internal: pin_data: add struct to record field info
  https://github.com/Rust-for-Linux/pin-init/pull/152

- internal: add `PhantomInvariant` and `PhantomInvariantLifetime`
  https://github.com/Rust-for-Linux/pin-init/pull/150

- Rework initialization and accessor generation
  https://github.com/Rust-for-Linux/pin-init/pull/143

There're more improvements/fixes/features upcoming that would benefit from
this refactor, so I would want to land this relatively soon. Benno has
looked at them and is OK with the approach, but didn't have time to do a
full review; if someone else would like to take look at them it'll be
hugely appreciated.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (7):
      rust: pin-init: internal: pin_data: use closure for `handle_field`
      rust: pin-init: internal: add `PhantomInvariant` and `PhantomInvariantLifetime`
      rust: pin-init: internal: init: handle code blocks early
      rust: pin-init: internal: use marker on drop guard type for pinned fields
      rust: pin-init: internal: make `make_closure` inherent methods
      rust: pin-init: internal: project slots instead of references
      rust: pin-init: internal: project using full slot

Mohamad Alsadhan (1):
      rust: pin-init: internal: pin_data: add struct to record field info

 rust/pin-init/internal/src/init.rs     | 156 ++++++++++--------------
 rust/pin-init/internal/src/pin_data.rs | 195 +++++++++++++-----------------
 rust/pin-init/src/__internal.rs        | 215 +++++++++++++++++++++++++--------
 rust/pin-init/src/lib.rs               |  24 ++--
 4 files changed, 324 insertions(+), 266 deletions(-)
---
base-commit: 430654211d566f86e8ee533ff1b01a42be6b602c
change-id: 20260511-pin-init-sync-e04cf605b097

Best regards,
--  
Gary Guo <gary@garyguo.net>

