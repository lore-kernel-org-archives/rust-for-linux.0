Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E51126FDB2;
	Mon, 24 Nov 2025 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763992216; cv=fail; b=aDNhzTYHVrIeYwfQavqIW71H3ERVkHywyM98/5eltb9i1VYXSetjfJeUVY7O/oUf12BY9KpKa9tC1NVhF/OcBJoEbBSs37Tae0Cnd6mvRO9G7B1irOSaWvcqbxOhdlLbxeqexDcFGAV06KAsQiuzZcj4esAMvNZOYnEFNKTb/2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763992216; c=relaxed/simple;
	bh=T1/EJxjiAUpI8CWUQPkvoD8wteTQHS+78HCG3sCDJGw=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=KtULUVqeTtqFxCg3yMAwHVG3/saGuOJcVNXdSIbTYTH1SDyMkEoOLuDSbICIhVRYNEexHSTp0Rq3Ufc5hU6f3cht4L0lHwniAW42ml03NzrUd5oCdhyxEDDmwUQ8meHlGvDiiF8jPCLM71hWoGwffeI7YXGgAO6DlcmtDICD4Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NjVus7j9; arc=fail smtp.client-ip=52.101.85.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NjVus7j9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irjxrSrpp29fP6N6mUpFcNgcouSb6RlJCjcnl0UqzU26uNPQzzEryFc/Mj2h/NRLxbI/qX1j3T7zTk4tpaCX02gwW5w/Rc/h9qeH6+aoVW4kLmC8o/ODdgsMhvHFdlHw94sOdAUpT5gYeReGKbophebhZmqQy8kmk52DmxyWsXuaTz28RG6loH9eJF6EPrD2BF0mTWorUbEM2te590RLBxjvdQN0OWMeMWoaQMw2JLNmAUAzoV07t0i+DjWLcNdKNgQ+Sb1nYoAdQLAya2byAl41L23mt/0yzSJjo/JyH79ncqhXImNZFoFnuEtYWUl6AARmAgTyJwy2vMHzYwTcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34xGCoDmz6XppxKuAM7f2D2tWMSnoalIKM2K5J2ZDpQ=;
 b=LI270zccyDUCWUEhMhuy9S5TSyM96TzyQjAWScvREEN0r4PPjNdhJEwOkK4aDfP7ddoY/0BWiRGlutEAmVvM9uGqvD3O8c6IZX1zOqrqRt+FmObxh9Oebpqqi7dVXHyjKFni485hNCyekJ89uR3HffBtbxjTlWbMa54Gz25Qy4YjgWECrB3RveJaPpyZ4O84H5ooRYwiKjaM8BK7Qkum0WWrGU3eArwsGpTa+J8BXgMqaW1zpGMws7x2TneymsNb8d41qSDCwZXxntCABUQOS240X9TsWlPqGMFPVskReZGHUBYQOdomLNh/pWch1wJD68exhwm8vQkxCzJl3fLZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34xGCoDmz6XppxKuAM7f2D2tWMSnoalIKM2K5J2ZDpQ=;
 b=NjVus7j9z1Z4yVQBx+6KVJy6wStazzSBLIYqRpxIyExfWsg+9M4bEj7iEYUlYdXiN+sJqurv2H/ZBxnFHQHZeLz7uRrC7j51AqYp9ea0fMxFl9kuYFQtYP5p93duVHJeoXx+3u5iia7DxiYhy59tGvBMupy6pfCxk4Zbxi6U45gGgYOvDSRP1WwiqQZiIBCOkZiaimfCnJqKB7yRDYD2vauY453Zj7ttoTealANiqVgRwGvXznPU8am1Hytli1z4z4AkyLoXPwfCbODdK5CbCWnhuoGh/T0LP43AOrkhYjHCYa8BN2P+hEZMKtv3g69CQ6ckobsZtihnpIFEEg7qyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB8140.namprd12.prod.outlook.com (2603:10b6:a03:4e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 13:50:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 13:50:10 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 24 Nov 2025 22:50:02 +0900
Subject: [PATCH] rust: num: bounded: rename `try_into_bitint` to
 `try_into_bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-bounded_fix-v1-1-d8e34e1c727f@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAIliJGkC/x2MQQqAIBAAvyJ7TlAxxL4SEZlb7UVDKQLp7y0dZ
 2CmQcVCWGEQDQreVCknBt0JWI8l7SgpMoNRptfaWBnylSLGeaNHxqCcCta74B1wcRZk/d/G6X0
 /c0Vr4l0AAAA=
X-Change-ID: 20251124-bounded_fix-db070b497b97
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: fcdd0168-ed55-4011-43e9-08de2b606282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXRqZmdBQ1N4OEZ5UGF0Vk04aWZsdEZHUVVmQjdxbklLS0RTbTMvOVBaKzJz?=
 =?utf-8?B?bk9rb05DTFF4VG13N29FaDV1NW9ncVR6d0JsRmRFT0J5Q3p0WXpMZkYrUUx6?=
 =?utf-8?B?Q1h6NWpnbXZGUVZRbnRpVVVjenVRSkpjT1UwV284ai9OZWo1bXE1a2hZUTJX?=
 =?utf-8?B?TnBsbStYNU5LSHJuRHdVUlJiMDhTcDR2QTV5OU4yNElNUXduMUhhR0lSdEly?=
 =?utf-8?B?VCtaQ1I0VndqYW1EM0dlQmhkK1o1Y2MyR1RkY1gwOHZxbWV0dk1qNEVaS2Fr?=
 =?utf-8?B?VWgxWmVHRzRXL1BNWDRvNUllWTUwejg5Y1dKaDB6SXV6Y0pXZ05iMXQvS3Rl?=
 =?utf-8?B?emYwVmV3RzZLaE8vaHlaZWtVcDB1VVRFVytOaVI4TlZaUVBiZUtTWEFwT2Zy?=
 =?utf-8?B?Z1ZLM3Z4UzRtQlBMYUNnV2QweXkyL0IzYXJYQlFjQmJ0TnV0RGVBd3d3aCtE?=
 =?utf-8?B?N2F6Mm9pR1krK1pCRG8ycmFTNWtnYjBGZU0rRWNnOGY0SlVqcC9CL2tibkxJ?=
 =?utf-8?B?RFJTaHIvOURac3dqVDNMd29Jbjl5SlRxZFFVZXRRNjl5eThTTmN1bzJwYysr?=
 =?utf-8?B?aDBuTHlnYk9ralZWUFJ6N21TNE81TzBKZnZRSDlaUFJSaVhUUFYrM21hUlZO?=
 =?utf-8?B?MFhlMzFaWnVxWHFhc3Y0K2dSVU16VlFqemk1UDExTU9PWEpIckhWTjRBTVI5?=
 =?utf-8?B?bWsvNHM5QVhrcXVTQ0hHdEFvVlhrUWdBRVhvWEtCaTR2QlZmQVhFS2dTckt3?=
 =?utf-8?B?ZXJvczBqQktVd2lOc1ErWk1ubGx0SlFCWUV1S284UXVaSTJERUxXNUJqb2tI?=
 =?utf-8?B?a0k5cWdHVzltUFplOXJQSVZWdndlV2p4MVlYTFhzUGo3aGlqdEM3aDlWY1B3?=
 =?utf-8?B?K253YU1pQk5weG14Q25hTUZRellDaHVaNk55MVZIWGV1ZldMWHJ0QzArdW5m?=
 =?utf-8?B?TS94MWhHQ2ZPTnVDSXZzU1V2dythL2x5bWlicEF0UTE4Z2thMUVLc1c4ek5i?=
 =?utf-8?B?ZEhDTEl4Z3Jqa2JXckpRNHJSYklFUTdmUWNZODJ5UDV4cVlaL1Z5ZkNPV005?=
 =?utf-8?B?SnZmcDZab29OV0xVR3lFZmkwVXZLWWVOUEdEdURTRWRqeS9FZXp4ZTBQaThv?=
 =?utf-8?B?TVYwc2NZNzFBYUovYjA1SEJoNDNXWXp6VTNXc3haeHVKYWR4YkRnUU9BdVVa?=
 =?utf-8?B?T1IwSituYlcySGVkRExONnV3OEg3cGlidmRYTjlSaHdqVmpyUi8rTWZIbFBU?=
 =?utf-8?B?bzNpTUYvWVdMN3dMZVgwTWxURXpQNWVxZlpnd1FKUWZQNGpmTnlWa2VsVEt0?=
 =?utf-8?B?S2xWWnVZZFRMcHFGNTBYeno1MU9tWVBKSFhjaHRIVk55d2RMaWVxQnVxVWE0?=
 =?utf-8?B?czh6c3F1a1R3ZVBwdWlHVS9TcHJtTHhpSW5qck5xQWVrOEprMVZFdmVBczRv?=
 =?utf-8?B?WXVWL0FCOTFVdEZJckhobHhVdlp5N0dBNXRKZCsrZmZuMFl4UXZDd0dQRVQr?=
 =?utf-8?B?TCtSblBjQ3JMYlE4Rm1wMTlQeEVxVVBrSU9Ya3JPTnNsYk10c1lEcENaYy9N?=
 =?utf-8?B?V0tYN0FDblZrUGVoSW1jSWd2clR5OVNMZ2ppRjV5aGZGbnFwV2I3endGck1P?=
 =?utf-8?B?dXZvSjhTNTZlKzg4Y2lmNDkzZkNNSjZpSzJxYTUwWjNzVC8vNTd1cktjNnk4?=
 =?utf-8?B?R1BWdWVEMGhrbHFuTUZmUE90TVhNa0NBQVhlMnlLOGd1V2tXTDZscHgwYXox?=
 =?utf-8?B?YktManN6aVhJalhRd0J2SHBPWVVyTmJIWmtsTHNVTHlGbUdtSGxqVHhOcW1O?=
 =?utf-8?B?SHMxU1kyeWI4YkVvVnZNaUE5cXRTL1MyV0xjQ3F2c0FNUWhvb0xDTTcrRTN0?=
 =?utf-8?B?VVlwU2hqb2VEb3dSem1rZzdTbjJNaXpBTm5sdS9KMzlSUTZaelN1V1owNFM4?=
 =?utf-8?Q?GA4rnb9QyhQjBCPkCeokGtwGjfOsBAgS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnIxWHFBczZqNkcxbVpscS9XVEJzVXM3Z2l5STlYeFdnNFR5bmoyK3oxZVJE?=
 =?utf-8?B?bVl4a2lTOTFPN0dpOVQ3dzFSd0V6QkgzWm5WU3lwY3JpeTB1RDViK1dFR2Z0?=
 =?utf-8?B?ekw5cXRibjJPUjZzbi9UVllRZmhxNERLQnhnendmL0pDd0lVQS9vRW5PajEv?=
 =?utf-8?B?YnFZQlVEUEZoRWhKYmRGTlRkMTI1Y1hPYjZ3bmV3WTFpemE2M1VwYkRIK29U?=
 =?utf-8?B?LzQ4MkQ1TDlFT0RFVHZScnl6V1pVczVzc2V4dFFNUjZhcXdxbG1JV0dQcUVN?=
 =?utf-8?B?dWxwMW4vQU1BWEhabGJRank3QWFRK2NJTzNhOTZwdXVVVWFDVFdZTkNKVk4v?=
 =?utf-8?B?SGY4VHJUcndQZnB0MzBGMHBWWkxhckxJRG8wdWJPWGh6NDRyNFVFeW5kMG83?=
 =?utf-8?B?amp5RERzOFlOclZJclZsT0kwc2M5cGV1ZUZ2aEJtODNIRkFEclh2L1ZVSVIx?=
 =?utf-8?B?VmhrTGhqY3V2Z0tmRE1rMkpCOXJCdGUxcFNwUjlUMnhOVEl1RWM3VktuMW5T?=
 =?utf-8?B?enBoV1B4RjY0MzYvajdFYmdJNjdNWVNBdG4ySDFjckpQeVowNC9Tb3dnQ0ho?=
 =?utf-8?B?V0xpRkRPeUxqOUU4ZGl1VEgxS1ZjTVM4azhxUVNPeEp6a0t3TUhNMW15MEtR?=
 =?utf-8?B?ajRuNGdHOHNIcHliV0NDdGZqUlNsZi9PSVdrTllIbFE1MVpseDZCMHFQZ0hS?=
 =?utf-8?B?YWNBNS9Ob216RzVBcWZtV2pQdHVGYWFyT1JPMGNVSm1UbWpDVkRYRVFmZDd5?=
 =?utf-8?B?eitPMFY4Nk90dHdGNWlUajNPdzY3R1ZDOFBneGdJOGpQaWNSK3FoWlE0bzFt?=
 =?utf-8?B?WldESmJlRDdwQmlWYUNLMUVuMUM5VmlSckVPajNrQUNUb1I3d3BBYnFmTUJ1?=
 =?utf-8?B?UG1BWlRRcllGazZ2ZjQ2TmFndnhOUGlFK1FGNUxHcWs3SUJzN3paVG43K29x?=
 =?utf-8?B?elBlR1N4RHRodGlsd3NCYUFRN3BIbzlEN29vVzYweDdqTE9NdzlHYXkxQjhH?=
 =?utf-8?B?STVmWU8vaGU4bmhrZ0NvTWc3REFLTlUxeTdsemh2ZzZ4N1NCbk1YRlR0VU14?=
 =?utf-8?B?dG4vaWlhaXM2RFdhR2RWeEpWQTBJd0JQbEpSMDhUMjk4czA4K2wzZlFHNm9u?=
 =?utf-8?B?VEpTbEJHc1BsMVVFUG5KNmR2RWVpemZlZ25ITzU3a2tmektLR0dUVU1zQWJG?=
 =?utf-8?B?SjQ1TEF1bDgvY3BnbTZSQ2xnVW9Zcnk0ODNPUjdycXd4dTE3ZDFKcThmSlpw?=
 =?utf-8?B?c2FuaGJyakNROWI4UVNLNjRWWkVFZXkxSVozT2d6S0NuV1hQQ0Y4OUN6N0V5?=
 =?utf-8?B?ZG15MHI4TVE3QXRCOElFUlpVcUVnam9wQ0hQLzJaekg2em0yQ2ZWZUxhSlph?=
 =?utf-8?B?dHB3WURPcUlSUUhaMUhYMDhFcHpLdHNVbllPY3o1RHI1em9ubWpxRTByRHhF?=
 =?utf-8?B?cm40ZS9LZm9ocXFzUlV5akpTZU1MV2daK2xDK2ZEbXRyUkpvUEFPT1VZRFhU?=
 =?utf-8?B?K3Q0dEVNZDdwYjRDV0Eya1ZTM1NXbEpYYlR1cHZWR1VQYmc1NXZnOTU4LzJP?=
 =?utf-8?B?VFlTSjhHUnVaeGxsM2gyaFljU0xXMTZua0pHeWp5ZzRTNWdRK3M4WXkrVkRB?=
 =?utf-8?B?Lys0NEp3bnpldEdkZkZCbnNDd2xPdkxZaktHRFQzWmQ5SmJaeFRLUGVORklN?=
 =?utf-8?B?MGREVjFRaDBkaEJnUEFzOVdtTUxoK1JHaHRlbmF2aUJqeFRtazR0Y2xCNW9F?=
 =?utf-8?B?N2REcHRjOGZRWitZay9lcTV4YXh5bGF0UnBjM0tXNzBHYTZRa1BMY3RKajda?=
 =?utf-8?B?MzdGM3dWaHdHUmp1dW14NEpzTy9KbStIMmJSbGxydDNCNHB0ZGtvR05MaHFY?=
 =?utf-8?B?aU1CY09rZVlTQkw5ZDdibXMydG5KTUF5N1djWkRlNzA5OGVSMVdiZ05ZNG5v?=
 =?utf-8?B?VVdybmlWci93bGtOcjBaVThoQ1BqWnZhY0R5cGc1TzFXT2tBWk9HNmsvVWc1?=
 =?utf-8?B?ejljcWtNcDB6UWl5clZDdDlpQktLVFFnZmMwaUdKSEE3TG5xSnQ0ZEVoTEda?=
 =?utf-8?B?K1JueGdFd2Q4Ky9XVHloNVBDTHNYSVVGb3JwNlNOOGcrUEtRQjZrRUEvN2pp?=
 =?utf-8?B?Vi9LM05ONDZ6N2MvbjZ4dE8xRE4wT2tLT2FuVnNOTVBTL2dQWFlnZ0IySTR6?=
 =?utf-8?Q?IC2iK+UdIfuILWXt2gE6G+cfvgiduvtSObnzcYgLoue/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdd0168-ed55-4011-43e9-08de2b606282
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 13:50:10.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZG3Du6J1Atp0Hwb4Azdwcc+BmRZ2oNZWa6HKPhc0uIPMD4zE+pYc9GoJG30Ff9KOBVfyQY4kPYX3rrZoF81pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8140

This is a remnant from when `Bounded` was called `BitInt` which I didn't
rename. Fix this.

Fixes: 01e345e82ec3 ("rust: num: add Bounded integer wrapping type")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Not sure how this happened, but let's fix this early. Feel free to
rebase/squash if that's still an option.
---
 rust/kernel/num/bounded.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 92c41b2eb760..f870080af8ac 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -218,11 +218,11 @@ fn fits_within<T: Integer>(value: T, num_bits: u32) -> bool {
 /// use kernel::num::{Bounded, TryIntoBounded};
 ///
 /// // Succeeds because `128` fits into 8 bits.
-/// let v: Option<Bounded<u16, 8>> = 128u32.try_into_bitint();
+/// let v: Option<Bounded<u16, 8>> = 128u32.try_into_bounded();
 /// assert_eq!(v.as_deref().copied(), Some(128));
 ///
 /// // Fails because `128` doesn't fits into 6 bits.
-/// let v: Option<Bounded<u16, 6>> = 128u32.try_into_bitint();
+/// let v: Option<Bounded<u16, 6>> = 128u32.try_into_bounded();
 /// assert_eq!(v, None);
 /// ```
 #[repr(transparent)]
@@ -498,18 +498,18 @@ fn deref(&self) -> &Self::Target {
 /// use kernel::num::{Bounded, TryIntoBounded};
 ///
 /// // Succeeds because `128` fits into 8 bits.
-/// let v: Option<Bounded<u16, 8>> = 128u32.try_into_bitint();
+/// let v: Option<Bounded<u16, 8>> = 128u32.try_into_bounded();
 /// assert_eq!(v.as_deref().copied(), Some(128));
 ///
 /// // Fails because `128` doesn't fits into 6 bits.
-/// let v: Option<Bounded<u16, 6>> = 128u32.try_into_bitint();
+/// let v: Option<Bounded<u16, 6>> = 128u32.try_into_bounded();
 /// assert_eq!(v, None);
 /// ```
 pub trait TryIntoBounded<T: Integer, const N: u32> {
     /// Attempts to convert `self` into a [`Bounded`] using `N` bits.
     ///
     /// Returns [`None`] if `self` does not fit into the target type.
-    fn try_into_bitint(self) -> Option<Bounded<T, N>>;
+    fn try_into_bounded(self) -> Option<Bounded<T, N>>;
 }
 
 /// Any integer value can be attempted to be converted into a [`Bounded`] of any size.
@@ -518,7 +518,7 @@ impl<T, U, const N: u32> TryIntoBounded<T, N> for U
     T: Integer,
     U: TryInto<T>,
 {
-    fn try_into_bitint(self) -> Option<Bounded<T, N>> {
+    fn try_into_bounded(self) -> Option<Bounded<T, N>> {
         self.try_into().ok().and_then(Bounded::try_new)
     }
 }

---
base-commit: bc197e24a3acd13dd0b7b07c1448c5c225946546
change-id: 20251124-bounded_fix-db070b497b97

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

