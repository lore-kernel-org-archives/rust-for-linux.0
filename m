Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022122.outbound.protection.outlook.com [52.101.101.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D467837F300;
	Fri,  4 Sep 2026 10:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519568; cv=fail; b=TEu2oVRn8isBcaNz+rw8f/cLj5XXkKvjEcYggXpqfxXCr00tdxd3i/TCLdiGppuGgXHAl2cH+H+KHmv6Y6wELLUdODrfvKMxxcQP+Zs5sOKNXwTWXlNabT9tFNn0fu0fLq/nRMUTIrrMcNnUH/Brl763oXTqgn6GWMWOXUfQ/Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519568; c=relaxed/simple;
	bh=8cwK8BMARo4DWaFrW+v+WJ9BJlCOVCG2bHuhwY50Sik=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=fru3fSZLi0kpzvJdOpcR6a7nN7UaXTRFcqJb3DRVGZwjkeHjIGe8oYqS2QOKnObmntzOEVTno+R9ReBfp7iR9XNEsShndWI1eBqdgmT6QOG/gxrj2EVV9knaM9t5x83abmdIAU6Xw0vOM4BxQi5Ww90R3WfOZ5uejzooTgiU1po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=eGt7Qj0b; arc=fail smtp.client-ip=52.101.101.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="eGt7Qj0b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pACv4sFea6BSjy/CVMURgs1Wkg87ZyjiDdVZuKLsc116aHRnVOPNoHbxjP/dqq4Q4zGBmyvT4X2Vhuox+0gjkGdOLan8+Ph6QdrrbolD4CmTt6zI1PUUEkOZCxbJnPyjLM0rE0Ct48Djh5FXZcnlzMI1+ln1jPLBMZTsDjp5is6d//JU6jdTDJ5eV5mJIlwV7vu/ky8Ic3qpd5+CleJqAlVsLw7raEp6SpqjacISGacvGMg+nobfc6ztORcF15s6cE5tNYDOldf6ePxQL4Xhk6flEjylpEvJhxMpM4wYNje2ZRPrEYgeTVgGYHsCXl93mp8CxDWX3rvhCPyADdRopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjAvAVzZlfm3q0vvdKRjMwvYlTFqzzt4Su4mi/4+mTo=;
 b=HpXaCif6LX74GEkWNAMjTlhM2+xX5R6BCa28VOLwx80sJMXg/eQpSoq6UQxdGrP2Fr3a5jWR+X/4m3gshTtkXHLyvEJG9zhAakxR7rxZ+ZVUzksfP9pImS1EohHIiMbEqnShPXKOIm5KOvGdU5PlGVr1evA1OGk//Dv6c/Nrv8YJCbRIOTFwXnMAbalSxlQod/TTOJaZQa4XDMcAAoUsvfYuh3ZYVcqOvNReUM5qNtemrXWdR1wUI1qTS0cHul0ZkKvVARikZP/f2qqQ58PKBE/Uqm8B2Oa6z0qkFHHHzMLPcshevY1wqibiav7VdGWc+0AdnLN0jf8iRYeULKKwbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjAvAVzZlfm3q0vvdKRjMwvYlTFqzzt4Su4mi/4+mTo=;
 b=eGt7Qj0bMwWgxoWRemJbFftCsd8OLIRUPpUg3m1Mfxbm/DRLzIWOFIG418dToLGEl8UCvh3QHI1MHVozGJSYFAcywzP8D/sTWYIygavmGhR1bZph4jWMDtjm9qTDDmWC+E1xwD+lyBTTi8tFwlwhJXUIvEr/I8VANTe0/NBm5uY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB8527.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 10:59:20 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 10:59:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 11:59:19 +0100
Message-Id: <DL6H9QQC9NP5.RAKG9B0DZYYA@garyguo.net>
Subject: Re: [PATCH] rust: kbuild: add `no_io_statics` to `core-cfgs`
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260904-no-io-statics-v1-1-a2386eb0d255@google.com>
In-Reply-To: <20260904-no-io-statics-v1-1-a2386eb0d255@google.com>
X-ClientProxiedBy: LO4P123CA0168.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::11) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO7P265MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: cf61fd2e-6b44-4805-1da6-08df0a739220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|10070799003|1800799024|366016|6133799003|56012099006|5023799004|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cRD6Is0beyRqWb+HxBIpJMyBleaL4epDpJOhW10AkejpZJ5GuzEUotx/qD8IsPLDo0khOsHaDHOZqYow2TbGTrora2nKeGDAbm92LUTLllNxAwoRKC/9KtBP2Ib4Gz3kdPh9Sf/gg1jqqMxBMGTFwkvtu9+buamuLqzNqL3PpjI29K+8MrfPQFe8U7rH2fVux4J+bt+YRfBozs7MdlJDe0ZQRNPAFREWKpjumBrk4ai8Nu7axljam2NSf2dhw3pVfvteq0qhSOChQABzI24buQ7DTQyOvkXv+Y8mEJZ5l3UYuLsE30mmo1WN3BA7EkyzfSTrfTWtCFkpWLS4aKfgfMBeaG8Iz2oFxcsU3+j3cXgRmZQDRvDNI+gAba2z7KNzma87IaeEpg6e04Eo3/Kvntfk/uTo2GBV2Zu6LUMTxRXMdxbIj+lCeRuamKC/kQgj+0Mqjfo5T4bY+JyoOSCyGltFd+tjrJWdOdue3tAhu7prk4K5GTZ2RwqcYv5hKtGcNX9jEegGtFlxEtKN8kg+PJx9aXqC5QQIlhzO7se4DzTOhuqtZCuP0N9idCdMTqHf/55H2Qvn1rPfCWbsjHV10Qo8M+TrZ6JBnavyWXttBmiw4h2+o5ZQFYVvHWnR3xqevR6IE9IfX3wtQydNc/ARxZga4SoOYdMe7gPJoVYKSpE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(10070799003)(1800799024)(366016)(6133799003)(56012099006)(5023799004)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDFFcVdZRVo4WWFRYzVnOGRzNzRrUVc1Vmk2bVpDUUVNMEQrd3kxTVJEOGFQ?=
 =?utf-8?B?alNkNUY3YWNYWEFTdDJqaDZqdUVDS3JtN083dkp1SElvbHhlNVNxanJEQSs5?=
 =?utf-8?B?NS9FclhkQTlUbnZ4UHJoZGZ0cXE3dEFCWWdId3VkOGJQcEFEMHhVM2F6aWVH?=
 =?utf-8?B?U1RvM2gzQzJZLys0czZ1ZFJIcUE2WStTQ05qUk9HM1N4NlIwY2FyS05pc3VR?=
 =?utf-8?B?b1lIZU01N25xRGJuem8yMW9yNENrUkZFQW1qak9UdHgwbisrYjh4blZGNlFF?=
 =?utf-8?B?TlNaVlNubFA3dE9XQnFpYlFCVXA4UXVjTmpEQS9FSkJyaFo2UllMVlppNmtK?=
 =?utf-8?B?enZBSk1LbTl4M1NHRDY5RG1aclVGRnBrRVNoNmIxUGYxVnlmaE90SEN6Nkxz?=
 =?utf-8?B?aVRvTURHV2dNNkZmWU5yWTZCQVRZcXBTSVE2eld4S1ppd25oR3lyVzVWTG53?=
 =?utf-8?B?UnZaMTJmSVdka1hhMmU2Q2kxZEp0dkhZVVVCcHYzdGhPeUtwWnpXdnhCODBD?=
 =?utf-8?B?VnQvOFExNENucDlURlZ0YXEvRFVtbE5KVTV1dDZleDM3YTM2elFBZDFwbWx6?=
 =?utf-8?B?d3VwLzNQTU9wMFc5WFptamszS2tUZmFEcW53bnFZTVQyODRpVHJJdU1YQlJ0?=
 =?utf-8?B?N0l1K3ZxdnFpdzRMZGlSRlZaQVBZOVcxWE5pVWxZa1RtNVNWb3kwTkhmQXQ3?=
 =?utf-8?B?OEkrMWNkbUYrRVk4THp1cXZyTGp6eWdvb0hZemp6bjloVDhFYk0vcGorSjM1?=
 =?utf-8?B?ZU1rcTlnVFFndW9iaXFjRnpHaG9YT1pveExwL1Q2U2lBMHB1Nk9LSTF4UFpn?=
 =?utf-8?B?YzVJNDIwS0lhV25KcU40UVdxQlY3TVVGNTdhYW4ydGQvajBVcmU2UzBEcnFn?=
 =?utf-8?B?R0d1T1VNL25ZZVFQS3haaGhtUTQ2bm5PNzVvbVRIZ3B2TDA1TmgrZEh2eUVO?=
 =?utf-8?B?NklJY0hqbnk3dEhrMWkyaWdGYW1PbEltUTlRZnh6dWREL3ZNTmZGR2VxejlD?=
 =?utf-8?B?UVAramZnYWJuU0ZHNDBmdWVRbkZJYzVrMU0vNytvZUVkditMN0JaeEZ0TEsv?=
 =?utf-8?B?aEVXSVl5cUpqRWdQWGZ1a2JqTE5BRWdwdDZIZDZvVnRzOFg0WnZmZkVPQ0ta?=
 =?utf-8?B?M0NzQVVFTnNQT3NpUkkwTUlYYi9ldkZ6OFY3MkZJcWR5SnJJSEpIQzNDdk1E?=
 =?utf-8?B?d3k0bzJEQmJyRkZ6UUtwRTJ0V0R1VkNhY1BNVjQ1a2VwYmUzbGwzQ0Q3N1dQ?=
 =?utf-8?B?czRsQWlDT2NLL0FIbWN1S29MZHNpdWFyb0g4NlFUR2szR09JQmR4NDlNMTVu?=
 =?utf-8?B?dVpWbjM1WndmUGVDdEhtOFBwMnVQOVA3NGk1bzZWZFZGWjFFQ1RhMTRtL1Nn?=
 =?utf-8?B?Q2V0N3JqdmFtOFN6bk9rQWJFWjBJZW9QblZhT1NVNGYwaDJvSUdJUGMrZWJK?=
 =?utf-8?B?eUlGOG9LcnRraXRTMVozaUp1OVBUZTFYRXE4bUpQbTJMdjd5aFNTRG1lcTNI?=
 =?utf-8?B?aFJIOG5PZDBLS3BOUUVub29vYlhXei9UOHZ6OGs0WmlZUmlkQVJsWFZZY1N2?=
 =?utf-8?B?MzJNa0N5WXlob2JGL3BMaCtveUlhZ3FaQStEWWlqc0V5MVROWHZXRndVbzQx?=
 =?utf-8?B?TUd3Y05GQkNqUWc3em4wYTlsdDk5MnNpV2NoZkFxSS9LMStvRnRjM3ZLYjRj?=
 =?utf-8?B?RVp3ZlNmdUhPM09kQlNEdVR1QlB3M2s5cFljY1BxKzFwWDA2Mk5vbG0zUS9x?=
 =?utf-8?B?alE5QVQ3cExXMm9mQ3dPNWRtRmk4STNRNllrMTJNalFRQ0VhU0pzVDQ0elVq?=
 =?utf-8?B?bTNibjJuanJsMEZ1eGdaZm5ZT0J1bWdwcEp3U28vclZCQlNuOStpdXY2bGlq?=
 =?utf-8?B?clFTc3BvbFEwYS81dlFKMkJxeEF1SFk1eDZZY2Y5NnVFRHhML3lBdXdFOVdq?=
 =?utf-8?B?MkR6ZDBCU3gwSDY4SUN3cjhPSDBRamtReTAydm4xblAwUnkxa1RuMElsK0Ur?=
 =?utf-8?B?OUlBQjBjR1VoWnlROFMxcWEwV3Q4c2hpdHFLZWZSc3NxbHVncGdESGc5RTlI?=
 =?utf-8?B?ZWx1VnVYZDZjWTk5TExPK1pabjJoaU0yK0E2cTNVVGFQMmhCem5RQWV3NWh0?=
 =?utf-8?B?cE5tY3gvQW5BT3I2c2JwTnQwVTFyNW5ncE0rQ21VRTZ6MmRkZiswbENmTHBs?=
 =?utf-8?B?UWpNQmNIRGw5cTNOb1dMZW90QTdiQVVpWnJhM2tWa0dPNzV1MHBCbmg2SEdY?=
 =?utf-8?B?L0NXektmMWc5L0tqak95OG92bnNjRlFEUXRIWGlEQU1IRnhYcFpONkxQY3hN?=
 =?utf-8?B?azBxemZjVkhVQWZYYVdoYkVpT1BaaDU2aGJKM0ZYQ056WVR1b2luUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cf61fd2e-6b44-4805-1da6-08df0a739220
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 10:59:19.9927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 803Vhy1IKCBRjrCQMJMrwjtQ5HkNs5gt38Bx1hXVo0O+U/84zce2xC0XGS+5EHFiLXiotq2x1dE2Y2zNkPLdrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8527

On Fri Sep 4, 2026 at 10:31 AM BST, Alice Ryhl wrote:
> In upstream Rust, PR #155625 moved `std::io::Error` into `core` under
> the `core_io` feature gate. To support decoding and formatting raw OS
> errors (`RawOsError`) from within `core` without depending on OS
> facilities, `core` introduced a global atomic pointer:
>=20
> 	static OS_FUNCTIONS: atomic::AtomicPtr<OsFunctions>
>=20
> At runtime, `std` registers its OS error vtable with this pointer via
> `set_functions()`, which uses `core::sync::atomic` to modify the value
> of this atomic variable.
>=20
> To ensure that `core` does not introduce usage of `core::sync::atomic`
> into the kernel image, set the `no_io_statics` cfg, which removes this
> logic from the build.
>=20
> Note that changing the `OS_FUNCTIONS` global is only possible via the
> unstable `from_raw_os_error_with_functions()` function from `core`,
> which is called by `std`. There is no way for us to invoke it from the
> kernel, as we do not use `std`.
>=20
> Link: https://github.com/rust-lang/rust/pull/155625
> Link: https://github.com/rust-lang/rust/issues/154046
> Link: https://github.com/rust-lang/libs-team/issues/755
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Didn't know that this already exists :)

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

