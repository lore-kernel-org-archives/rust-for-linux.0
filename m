Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795781152;
	b=jJUmWjiNkExm0s9SY3FDY/+XBcTV3hdlWZ/vowo2NSXXkGGXPqdhcoDYd/BDdEy7Wab/
	 hHHKgTmkRt+31zxk1H/NXeRyHqX/f1MBMlse31tNsNvWkfjM00fgzlFIe0K42E5PUDR2A
	 AKGRSsl05OhAgFjqdvh0Jsgd1wxF8MOuMhPxgeHAhaj25V7TlB/KKtCvYbEfBfQdGYiQY
	 WRqkwc0X8jn8BrInbRv4thqeJUIdGjfI7BaUj/5uQP+ULtmVUBH/uRdtim67Ue+smnDF9
	 vVOTAvVbzC62LJT6TYY79npE6IeCvrnhVv2rGR14yLTQXSXY6/lvtPhVDk7Kp+TJ9cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781152;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=kdLItKlE5RiG7RhGTF72FO4ptjdN5A062RfBFXcc5vM=;
	b=ffa/qd+ZhgnP0fupZYd4fDmigoaY9Cadvoomb7KZ4uDwxQe8FZwbCZWc6HBrS2q9V0k8
	 aWtUnkUpydYTW3NaYZV2Y71/uYkpfgYJmmB5PyTe4gCgT6PDgjK21trqnWY4kpJSwGFz3
	 x7GodDcTM2aF9p+/AceNRv4igJsTZ++gDKTCDvGQzWLq6HQjL0ADhkcuuhUTNnuVS5aud
	 filhDKw21+CeqVheH31YL4ficb7Ypc/Sz4sNqAhkyc0mFlGGjL1s2M+mSvotq27TXWy+T
	 G0QPkZKwWvgP7MMq6Hr2QBkWSGSqZqGWsdo50Lgdpne8hb5rDLT5vT1MRkrvGwf5OCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="H275Jb/2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.45
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010045.outbound.protection.outlook.com [52.101.61.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024FA606A31F;
	Fri, 27 Nov 2026 12:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 024FA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=H275Jb/2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMEhtvXybB4KQ2nxZ9wFsGkUvqjYa+bSadZbMs4txtWF+9TubCST6+GjEdysYKzGzqLIu4HWCqXxhGR2tCTXCHSQcR0oLI/Y2Mi7B5GHon98GHFAZBbyURFzcQP6l3iwWgE+UaHy1X4dbwJdySnMJs3MrC2Nt8cF1ztmuxlo92/4tToc1Zdjw4DKQ3w9ciUNRtbUFHbiQfxx+E+uEyZWYO/fki+QUJltd8nBAyBlyZqntg5Hr5oU3QGFZUTwc8LeMR20vBgE0hs9MRjm5lCD/Fvi6/NxPu/MsxjZ5xD73tegEWz57rmBH2mB8Er/kzq18XSsFCfaqNkD1yr3rCWw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdLItKlE5RiG7RhGTF72FO4ptjdN5A062RfBFXcc5vM=;
 b=wcyeo5uekcklcCBGKM2h9J1Wg0sQxRIQQdhPYAnTkRNu7NM9IpT4FoRkaCYnOp4kKLCwr48INLLSXSEBfSUOaWrAyoGs3JE6W1PkMZJWdIsN4C+5W09e4C62DjtceRydEBN50JSpQcq+tI/tuilB/o4I4u2aLXWdEHqNIx+n1uG4FRK/xHA9k6JnobL8gBkIye+CeVhnQUi1qaenAERvEc48D8V3/bnfejRjcMD/pHBjTrhP8pf70duuMmJnbdQ516fiKzEbYkecibw95p0ZGDWqCG8OJcFwwulvXWEyC0CoNCy5xfDVgCWYLWG8pgByCU2B1onqVl1385TkvbjDVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdLItKlE5RiG7RhGTF72FO4ptjdN5A062RfBFXcc5vM=;
 b=H275Jb/2q8ks2SCAXTqmG9d5ciy6UqwtKkl62G2fxUVLTrDtw7Hg6Quo5dcg0+iGwBwAv2hjlngyeigEXDJ5hgGUboztVSR3lLk418o1G0zUaBjFl5Hkb1Cm1DvRhUZZl1RcRcnO+QMoP0eRKt5IcwbCFw8h8S9tcdDvKyKQgsgcqjdLy89TPSBGYNPjSS/rTqkdihcIkaWAFQVZ6PNKMjGzjVYn8n7AXq19ajFV4gOF6mh4drLzTepTee3gnH6fc5l8OpeHQpk2MIwO4R9mZRTp1AXBFCUwrCaK2o6DWrm1MJtdTKmm+YU5xCNl7pQ18ObQMQmo1bbg0QD52ZdC6Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA0PR12MB7650.namprd12.prod.outlook.com (2603:10b6:208:436::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 12:05:43 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0662.001; Fri, 27 Nov 2026
 12:05:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 27 Nov 2026 21:05:40 +0900
Subject: [PATCH] rust: bitfield: add conversions to Bounded of matching
 width
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-bitfield-conversions-v1-1-2f0b127c0857@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQqDMBCE4avIPjeQhGrBq0gfkjixKxJLVqUg3
 t1YHz+Y+XcSZIZQW+2UsbHwnArMo6LwcWmA4r6YrLaNMfalPC+RMfUqzGlDvvaiULvGaxu1C08
 q129G5N8/271vy+pHhOVq0XGcqMMIbXgAAAA=
X-Change-ID: 20261127-bitfield-conversions-e5a6b02f0ac4
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4PR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:405:378::18) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA0PR12MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: f5bf154a-9613-4f7b-58a8-08df4c7ec2ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|23010399003|921020|261022105027099003|10067099003|11063799006|56012099006|5023799004|261021123027099003|261026121527099003|261028144727099003|261021121427099003|261026140227099003|261021135927099003|261102123227099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	/Iog+z58F18DTHYQsmLzPjsNOHpobez+dJqLS9jvqLvdSuRRM0CdwAtiVMo+JLsbLeoLZnDEPgOrZo1kvSwkFY/EBGXhyXaiBrrSzhupTU5WpdFC19YHYuD+lCXLXkyewnHBDIPK6zXPXooENlPdeXPTyFkWNTDRJ88MQk2OosZg+GOTccPMieMCxf7xVHiHbczW3QucxrJhefJAIQRpqJWkPwn8hA8e9DzJFFzO5qJUFW0YgFpP9O+1v2R7VS1tP9YX6UULPr4UVNAvG0WjgHyWDTBijcadCsuHB30+tBln8UUS5SOX7W1mDJaaJ18BmFm8adAQelAHjZnOegWYrpVYxXPvV7HGjO6ghPE0YoRVmxTbgf1BCN/msUCe/ugpqzqK7fnII0WPQUoyy1Z+DJeQ08gBJm4D+n8md/Y4/F5n5giZYE87Nb8izJNO3cjkBf0LUpXSYQYB7xICLiF7RRPY1T7aj+c03qD7hW/kGX0HGv7cU1q/8EH1cdwJ7NN531iQWRy4LAN1gyCNc864k76xcraxyFj2mxJ/g2lv+LlmADS89oBLVcKviqo50OYhWUVrRmm7bICyaKqD1Hfl550NWcLQ/nZqgeMQDKfsw/S5eoopGll8xlIItrhDsEkERhn0CL/wE2tkuFbAdUGTE8dCrx+YJwQQOXRJaqfSagTbbGN91/aM/aOr4uVfh6LB3CQw6zdaMG9lvYgtGuQmhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(23010399003)(921020)(261022105027099003)(10067099003)(11063799006)(56012099006)(5023799004)(261021123027099003)(261026121527099003)(261028144727099003)(261021121427099003)(261026140227099003)(261021135927099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkdBRmRhVW5hS3VKTGFvM3ZoZ3FiaDVDalM4ejhBVXl2S0ZXaXh1THNUbVRX?=
 =?utf-8?B?b3NwTUdFSU5zV01Fa1lMcnluS1UwekNnbVBIUjVUdXR0Tm5nMytLeTkvNWw1?=
 =?utf-8?B?RVRsOEFVdGNweWs5ZmNNS1hsYzB6NFdFeTdqWllHWHRENDZrYnRwR0hsblNq?=
 =?utf-8?B?bGgxV21HZEdrZUhITHdZRU5haXFjTE9ObnhxM21KSlRBaTlsVmNqSVpCb3Uv?=
 =?utf-8?B?ZDkwNk9ieEJySTlvWUI3L0p3ay9seE8xMWxEeGdVSmx6SWppS0luMGxaZ2Fh?=
 =?utf-8?B?VlFGZitNMVJPUkxadWF2UVVkaTFWKzE3dFZsTkRwV0srZGcwNXFjR3ZMWHYy?=
 =?utf-8?B?SUVZZk9CK3VPNFZSQ0pmc3RQb3QzalU1ejUxcmpIalZMZ0paUWZhQVlEUUVK?=
 =?utf-8?B?ZGhJMUx4MEJEY050ZEdQZ2VKeXh0aVpheTZRMU56emVoK2UzVmJJSUdTc1hm?=
 =?utf-8?B?V0VORnc4UVRMalhvWlRQcTBSYmtFYU5pby9vTHdQWm1kVGxLQng1akVxTHQ4?=
 =?utf-8?B?LzNDQk5EUFh4cVRxL0Y5Q2p3RkRyYUtwUHdHaE9XRFh5YnZENW5YUXNjMmFH?=
 =?utf-8?B?aFR1Y0FzZUVUdGZIV08rNlZwM1o5MUkybHpGcnJFdjJ1dTF3MXZ4ODQ3T1Fx?=
 =?utf-8?B?cDhQNTdUVFRNanIvQ0NQMjkvMTQrY3hiajNKMnZiRjgyTnQ4N3BHNDlqWHFp?=
 =?utf-8?B?Y293S1pXUDN2bGcxZ3UzWFJ2TGp2VWlrMllycHZhY0pQMURtZzFLdDNNbjMy?=
 =?utf-8?B?d091Y2J2SXFTbGxhZGJHUGdNZDVLNGhuWW9vRys4TzYwYk9UQXJiZXhIcHRx?=
 =?utf-8?B?Q3hoeXRXSXJKMEZKMlBDVGZ4dlByYUlyM29MVmhseEx3UUs2Vk44SmJzbVpi?=
 =?utf-8?B?UW9zUFNQL2EvRlJjSXpSaWhYNkxiTkQvZGFPRlRaNlIrUWQxUHFPTXE0WENy?=
 =?utf-8?B?dTgrRUhrcEIxSHBncGprcWxqM1RPZW9EeXhzTm03SjB4L2srNFFDWXFUQ0x4?=
 =?utf-8?B?bzNXRG5ienlJUDIveE9MWlVKd0FRNjFBTDJtTnI1VGtVOVpBd0EyV3JUVXdq?=
 =?utf-8?B?Qk04WWNrb0x5UTIzaEFHZDVYSlI2a0htYVUyNGZndTB0dlBMU3VITWxWY3hq?=
 =?utf-8?B?TGhCb0J3ZC9BbzZXSk16WG5xN3U3OWQrVmQxNFAyazZIWTRnUWxZV29mWU4y?=
 =?utf-8?B?eHRrUGJ4NWxVa0pSTUlIem5DdmMyY2tSMzR3RENOUEYxQkoweTNWUDRnYVJ2?=
 =?utf-8?B?czN1UHZoYVB2U1dZVFRQMnhKUjRDN2hJb1g3blpGdFVsb2tlOGk2UzdmdjdR?=
 =?utf-8?B?WVpDVWRSU3gzZm5FaWRiS1lNZ2srdml5anB0U1N3UmJkbEQveFd6QjZ2ZHF3?=
 =?utf-8?B?Y001ZFBwdHpaODA1RXZpSXZOV2NoRi9BUzhhSUR1YzhuNkkrNDlUSlZBSWNL?=
 =?utf-8?B?ekhEQmRXb2hnQUxsOVJ6cWxSRG1xbHhrbnk5ZXVtRURhV0ZQRmMzZStJdVFB?=
 =?utf-8?B?QmcrdUNQWEZsZlZBSWczQnc1V2dMTnBJbUJGRGF1RGJsMitKb2FaUjErZ2Zn?=
 =?utf-8?B?V0FuRTFNVDI2L09NRjJTUUJLSFlZZGdZdVcvbzNWckY2NDhsMm9reUxVR0hM?=
 =?utf-8?B?R1ZacytmOC9FZkJDQmQ5dm1naUlOb0x6QlRYSmlISXVuQ3pIRWFsS0FHNXpD?=
 =?utf-8?B?blEya1BsNmQ4dTM1VVNTNXBBaGpmY05TcGFJWWZRc0hhL0xoN1JtN0w2a3Zx?=
 =?utf-8?B?UEVqdll1ODhQRzNZNi8wWGJIVlRSY1RIS1JlQWNwYnRTelZyYkkxOVF5cFh3?=
 =?utf-8?B?a0U1c0syTmdWVGQ3NU9DUVF6S29NdjFPRUU5YlhxVUt1eGZ6YzJEU2Z5c2VC?=
 =?utf-8?B?Y3kxRzgyMUJLWDB2RzFPdkQvaHFOTDRMSzlDWDFCcnN0SmtHTGM0eTBVQzVF?=
 =?utf-8?B?d3B0bCtwZ0sySC9sV3pIck5kZHJwT3NyeGU4YmdHcXk5TEVFUlowTHYvaUZi?=
 =?utf-8?B?S1phYlhvSUtYaVJRQ1NaTnNlMGhERURQVWF6dGtWVWpxQkZPZ004M1RXNWRt?=
 =?utf-8?B?d1JDUm1hd1Vtd0JJTUFmb1Q5OENqVkZWaUtMT0RaUXRuMVdFK1phSmU4Ylkw?=
 =?utf-8?B?VEw5d2tEblliYnJJNFlxb0c2a2dyY0Vvb0IzQk5Rby91K2VXTTVyTVFHUk1R?=
 =?utf-8?B?d1prYkFXM2xJc0dBU1ZmTVdGOUkwdVAxVnlIVlQ3V3k4NTFxSjlQOWJSVTdy?=
 =?utf-8?B?akRLS044d1BwRVRxT3VmTHAxd2lZckhWaW1HNjl4VXBHOThPS2pUeU1NODl2?=
 =?utf-8?B?MVRmY3k0ZEdLVzBDbks0Tm9tMDlMS250MHJIVjBuQkJLQ0Vham5sbFlsY0JU?=
 =?utf-8?Q?d/wzaUprt5zsJr5RCTIXsSO+MB10eqRqKRppvph3Bdl5I?=
X-MS-Exchange-AntiSpam-MessageData-1: hJg9b6DamhZTmg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bf154a-9613-4f7b-58a8-08df4c7ec2ec
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 12:05:43.1076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5Wb+kkKbZ8Y3bda+SSdehnqN5w4mZZZsQmpOkprUK8FRSeXxMiPKsswfC9JtIFSk3G+uG2cqMzhcOobucUuOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7650

`From`/`Into` implementations already exist between a bitfield type and
its storage type, but these are not enough to support nested bitfields,
since every field is a `Bounded`. This resulted in some ad-hoc
implementations to enable this kind of declaration:

    bitfield! {
        pub struct Version(u8) {
            7:4 major;
            3:0 minor;
        }
    }

    bitfield! {
        pub struct Id(u16) {
            15:8 vendor;
            7:0 version => Version;
        }
    }

Generate these conversions automatically through the `bitfield!` macro,
as these tend to be useful.

Tyr had such ad-hoc implementations, so remove them to avoid conflicts.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/tyr/regs.rs | 30 +++++------------
 rust/kernel/bitfield.rs     | 82 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 89 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 69c901afb28f..0392869adc5a 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -1150,20 +1150,6 @@ struct MMU_MEMATTR_STAGE1(u8) {
             }
         }
 
-        impl TryFrom<Bounded<u64, 8>> for MMU_MEMATTR_STAGE1 {
-            type Error = Error;
-
-            fn try_from(val: Bounded<u64, 8>) -> Result<Self, Self::Error> {
-                Ok(Self::from_raw(val.get() as u8))
-            }
-        }
-
-        impl From<MMU_MEMATTR_STAGE1> for Bounded<u64, 8> {
-            fn from(val: MMU_MEMATTR_STAGE1) -> Self {
-                Bounded::try_new(u64::from(val.into_raw())).unwrap()
-            }
-        }
-
         register! {
             base: TyrRegisters;
 
@@ -1172,14 +1158,14 @@ fn from(val: MMU_MEMATTR_STAGE1) -> Self {
             /// Each address space can configure up to 8 different memory attribute profiles.
             /// Each attribute profile follows the MMU_MEMATTR_STAGE1 layout.
             pub(crate) MEMATTR(u64)[MAX_AS, stride = STRIDE] @ 0x2408 {
-                7:0     attribute0 ?=> MMU_MEMATTR_STAGE1;
-                15:8    attribute1 ?=> MMU_MEMATTR_STAGE1;
-                23:16   attribute2 ?=> MMU_MEMATTR_STAGE1;
-                31:24   attribute3 ?=> MMU_MEMATTR_STAGE1;
-                39:32   attribute4 ?=> MMU_MEMATTR_STAGE1;
-                47:40   attribute5 ?=> MMU_MEMATTR_STAGE1;
-                55:48   attribute6 ?=> MMU_MEMATTR_STAGE1;
-                63:56   attribute7 ?=> MMU_MEMATTR_STAGE1;
+                7:0     attribute0 => MMU_MEMATTR_STAGE1;
+                15:8    attribute1 => MMU_MEMATTR_STAGE1;
+                23:16   attribute2 => MMU_MEMATTR_STAGE1;
+                31:24   attribute3 => MMU_MEMATTR_STAGE1;
+                39:32   attribute4 => MMU_MEMATTR_STAGE1;
+                47:40   attribute5 => MMU_MEMATTR_STAGE1;
+                55:48   attribute6 => MMU_MEMATTR_STAGE1;
+                63:56   attribute7 => MMU_MEMATTR_STAGE1;
             }
 
             // MEMATTR is a logical 64-bit register, but it is laid out in hardware as two
diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index 8d7d78175336..f53001a41731 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -78,7 +78,8 @@
 //! every value assigned to a field. This ensures that data is never accidentally truncated.
 //!
 //! The macro generates the bitfield type, [`From`] and [`Into`] implementations for its storage
-//! type, as well as [`Debug`] and [`Zeroable`](pin_init::Zeroable) implementations.
+//! type and for any [`Bounded`] with the same number of bits as its storage type, as well as
+//! [`Debug`] and [`Zeroable`](pin_init::Zeroable) implementations.
 //!
 //! For each field, it also generates:
 //!
@@ -249,6 +250,37 @@
 //! assert_eq!(Config::from(0b11).mode(), Err(3));
 //! ```
 //!
+//! ## Nested bitfields
+//!
+//! A bitfield type can be converted from and into any [`Bounded`] with exactly as many bits as
+//! its storage type. Thus, it can be used with `=>` as the type of a field of the same width in
+//! another bitfield:
+//!
+//! ```rust
+//! use kernel::bitfield;
+//!
+//! bitfield! {
+//!     pub struct Version(u8) {
+//!         7:4 major;
+//!         3:0 minor;
+//!     }
+//! }
+//!
+//! bitfield! {
+//!     pub struct Id(u16) {
+//!         15:8 vendor;
+//!         7:0 version => Version;
+//!     }
+//! }
+//!
+//! let id = Id::from_raw(0x10_42);
+//! assert_eq!(id.version().major(), 0x4);
+//! assert_eq!(id.version().minor(), 0x2);
+//!
+//! let id = id.with_version(Version::zeroed().with_const_major::<0x1>());
+//! assert_eq!(id.into_raw(), 0x10_10);
+//! ```
+//!
 //! # Bits outside of declared fields
 //!
 //! Bits of the storage type that are not part of any declared field are preserved by the setter
@@ -346,6 +378,31 @@ fn from(val: $storage) -> $name {
             }
         }
 
+        // Conversions from/to any `Bounded` with the exact same width as `$storage`, to allow
+        // infallible nested bitfields.
+
+        impl<T> ::core::convert::From<$crate::num::Bounded<T, { <$storage>::BITS }>> for $name
+        where
+            T: $crate::num::Integer,
+            $storage: ::core::convert::From<$crate::num::Bounded<T, { <$storage>::BITS }>>,
+        {
+            #[inline(always)]
+            fn from(val: $crate::num::Bounded<T, { <$storage>::BITS }>) -> $name {
+                Self::from_raw(val.into())
+            }
+        }
+
+        impl<T> ::core::convert::From<$name> for $crate::num::Bounded<T, { <$storage>::BITS }>
+        where
+            T: $crate::num::Integer,
+            Self: ::core::convert::From<$storage>,
+        {
+            #[inline(always)]
+            fn from(val: $name) -> Self {
+                val.into_raw().into()
+            }
+        }
+
         // SAFETY: `$name` is transparent over `$storage` and `$storage` has no interior mutability.
         unsafe impl $crate::mem::AsRepr for $name {
             // Normalize `$storage` to the canonical repr type in case it is signed.
@@ -653,6 +710,14 @@ struct TestU8(u8) {
         }
     }
 
+    bitfield! {
+        struct TestNested(u32) {
+            31:16     field_31_16 => TestU16;
+            15:8      field_15_8;
+            7:0       field_7_0 => TestU8;
+        }
+    }
+
     // Single and multi-bit fields basic access.
     #[test]
     fn test_basic_access() {
@@ -770,6 +835,21 @@ fn test_fallible_conversion() {
         assert_eq!(TestU64::from_raw(raw).field_15_12(), Err(0x7));
     }
 
+    // `=>` conversion from/to another bitfield with the same width as the field.
+    #[test]
+    fn test_nested_bitfield() {
+        let val = TestNested::from_raw(0x42AB_00AF);
+        assert_eq!(val.field_31_16(), TestU16::from_raw(0x42AB));
+        assert_eq!(val.field_31_16().field_15_8(), 0x42);
+        assert_eq!(val.field_7_0(), TestU8::from_raw(0xAF));
+        assert_eq!(val.field_7_0().field_7_4(), 0xA);
+
+        let val = val
+            .with_field_31_16(TestU16::zeroed().with_const_field_3_1::<0x5>())
+            .with_field_7_0(TestU8::zeroed().with_field_0(true));
+        assert_eq!(val.into_raw(), 0x000A_0001);
+    }
+
     // Test that setting an overlapping field affects the overlapped one as expected.
     #[test]
     fn test_overlapping_fields() {

---
base-commit: abfb640b2374e26de8ff81d488c39d8254db538e
change-id: 20261127-bitfield-conversions-e5a6b02f0ac4

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

