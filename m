Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013056.outbound.protection.outlook.com [40.107.162.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF11E346FB3;
	Fri,  6 Feb 2026 08:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770366723; cv=fail; b=Gxck1XFLes5HPBszw6AKBVEtT3YGJOekJvSBK0v9kFMrWLFNt38NsFFZR3ffu1PrI0TuBDodGx2ioftADA1LjAkcJQiQfv1rgyO7FYVsY8rp39HBDoe68h/h0RAuQpaHA63eWddTDYAJuWNnMoL1ilAdGNqqAiW/eJu2KznFAoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770366723; c=relaxed/simple;
	bh=MZ6VbLJPmGBKMEAFxLWUbLI3+Al939IssPX6KMtiM0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WILAAtzm6QyhxozoKhCmSmqHIaUofb6FFH+22qFaj0W2kX3oVdmEXa99qEkmsetY7iy+wg9TMDpTjn27IsmlIMoV3daYXaP0ylFRBJEwfdo38rsDX/aJp7KR94QM+ww2qz5x3+yjcWtsoB8H0IQuTiV/gV1gvAyz0bqrqwWZM0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=mkRCeJAr; arc=fail smtp.client-ip=40.107.162.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="mkRCeJAr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jq9KQo3UdyRNAKP7V35U+2Qf8p+2RbmT+cL9V46S5QRRiubGJInQCwa1rKaA0S3WckFha6IOf2K20TAI9Fyx7RajPIZwGHLEU7TB0aT0Z2JmVZ/PsYOF4r1zAgzjcdhrSwuioX4Dl98zLAr4U4DsSx+txopkGStMexlBByi75GvaSIiumAC0idFUEIp5ENqx7u6N5W2j9EN+UtEIryjlG3oH/Y4d9Qf+QKLjJOLxA3yOzjweWQ+5QJxt+2QatZkaYwceUuEq5vMIlL39ZTwB2sx0zEmibLv08V2+XhxCHtNzGp4qQNLDbm5hfF6MMWbnaX8UQPFZ20CvVb3iOSOhXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2/vBiwjZ67z+Q863H6ochEKy2E4rP+2Lx6hGM/oci8=;
 b=LXsTJYX+fRKBWWd/0fQNGN+FKkwWW0AXBi3V5wcyn/64svm1eHQ7sBJznsscW1p9yjYSOZMW4Q9Bdl5f16juNc9Q2+XQi6b5BY8Y4RbdXNYrku2cp5WRT2Rb9p/CCPqk0dBN3o0y68s6l3TmKtS2VpdEArFz/brpBHE0WqgX4/EPhvVUNjkq4PusT0cowi0VerS/yFKxfZZNmg+ZLv0CDIjboeUGRIuGPwoO1vTSSRL3Iq4ZX40kwGovg3+ZEBnii5bXaBOoq0J1+8UewEaMgZXCDRZKhWnvxxdU1tD1/6uYI+vHe3C8JsWkqzDZ3ITIgdmS0iFsEq+tfqk9RCjNkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2/vBiwjZ67z+Q863H6ochEKy2E4rP+2Lx6hGM/oci8=;
 b=mkRCeJArmQ60oDregDmlFnKX6kdNcZDRk4y5TgT9eU3+1d7Gqz55M/76qdmhkEBAEulwqXEHE7Rq/jt3q08qg+teQrDTbbXiHWQtqkM5Ztu4pQ7ydY7KcW2Ro8Kf9hVhob4RTNQn/9dyo91ZltuBVUjs2WtnLdgSgLuR/y8p4J92VAIcua/9YpauU0grGd99B4ywRgVTbos30kbdC9wv94ztSSAjGE2SpSMR90M9lqAd7o3O4VQn8hT2nPMDKVyUlCdygMHmIAqy4gXMG6HsHOo/8B6a2tq7lXz4p6TzyCvwA7mpPD9RFdPHujwOrwXSq4eJE4X1mkJjGkj81JZbjQ==
Received: from AS8PR07CA0048.eurprd07.prod.outlook.com (2603:10a6:20b:459::22)
 by AS4PR10MB6064.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:583::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Fri, 6 Feb
 2026 08:31:58 +0000
Received: from AM3PEPF0000A794.eurprd04.prod.outlook.com
 (2603:10a6:20b:459:cafe::c1) by AS8PR07CA0048.outlook.office365.com
 (2603:10a6:20b:459::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 08:31:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM3PEPF0000A794.mail.protection.outlook.com (10.167.16.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 08:31:58 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 6 Feb
 2026 09:31:51 +0100
Received: from [10.34.184.244] (10.34.184.244) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 6 Feb
 2026 09:31:50 +0100
Message-ID: <4c278599-66ff-4b56-a66e-1c7c94eba469@de.bosch.com>
Date: Fri, 6 Feb 2026 09:31:49 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] scripts: checkpatch: move Rust-specific lints to
 separate file
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Jason Hall
	<jason.kei.hall@gmail.com>
CC: Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>, Dirk Behme
	<dirk.behme@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
	<rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Boqun Feng
	<boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Andy
 Whitcroft <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>
References: <a798e6a368639f7a1ce633a6dfecd088d6ed4123.camel@perches.com>
 <20260205014218.2202385-1-jason.kei.hall@gmail.com>
 <CANiq72=38f0dcyt6f3XDf4cZ809cLYghWj+72p+j=w3mFLv=aA@mail.gmail.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <CANiq72=38f0dcyt6f3XDf4cZ809cLYghWj+72p+j=w3mFLv=aA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A794:EE_|AS4PR10MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e2ab68-66fb-41f3-6a61-08de655a31a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0ZJckZzWEprT0k5eFNUUHUrenM3ZTg0Zm5JcHRKcFkwNkxUM3p5Z1NpcU0w?=
 =?utf-8?B?QjJ3cDc0cDBwMDVMdFBJRlk4RDh1TUpWa1ordjlIb1VkSE04MVJXdWdmSmdX?=
 =?utf-8?B?ZXlGVW1qQlQvNGtHSzVXZy9KdnBXR3dzNGtycjJlYUZhU0U0Ry9oT1pGUDFl?=
 =?utf-8?B?MWsxd1ZaRTIrSWROcEwzcW5jdHRoQXQzMEFxT1ZhS3JHVi9WWTlWVzJXM3Y4?=
 =?utf-8?B?L1JoVHJlck1ObktvMXBxR0wwMG9MUFN2Q2tabEUvdWZjdmJPbUR3VVBZTWhU?=
 =?utf-8?B?RGwxc25NTXJEMHZTSGhOcWJjQVltTjc0QTEzMVIwWUpzRkhuSklUMkViVUNG?=
 =?utf-8?B?WXp6bEFMR3Q2V0NVT3d0TmdKbDVFaWdzYkVNa0FUVk5rbUlMZjFzY0k5VUtq?=
 =?utf-8?B?alh3eFA2dlBXQ05WVUhsNVhuUm1UZzVtdlBNZzhCY2NvV0FVcE13Yk1NRDJZ?=
 =?utf-8?B?NGtOVzVVcU1jTWxScFFuU052TXBNYTJ5VjRHNHRzcDB6OTNOblc4OHlNTlBG?=
 =?utf-8?B?VTZXOGNvenl6NHZNSjNvZ2dWb2R6TlpERFM3N0VST2c3RjZNSVV3QzZWQnlT?=
 =?utf-8?B?WlJPMkhRYTdQeTk1aWZ4Sjd2aTlpZWpJbmJMRjdpM3VzVkJpdGZNOUowM3JY?=
 =?utf-8?B?VFpQUEhrKzNxdlpxTjduWHNFejhUbDFaaElZdlBWZmUzdERuUDdRS2JwVXhh?=
 =?utf-8?B?Qlc3RmxJK0xqWC92cjFSbllVaVVFdFl6czdIV3BZbU01WW9XYVQ3U1gyNnRU?=
 =?utf-8?B?OURITTZTUzdtNDMxQU1SYzZlN0RyQUc4UVU3Q1prR1RUdlNxaDJZd0hSWXlv?=
 =?utf-8?B?NXkrUFVVTmVlSWVJZnZlc0FwMEc5Nmc5S0w1ODd1Tm83NlAxUVBmbzR1R2Zv?=
 =?utf-8?B?eWJlWjRsMGVjd0I1VGVWQWIvZlAxTGNHdXdsWHNHVUNZbk5UelRSVWt4L0d4?=
 =?utf-8?B?L09FeEVma2IraDNvQ2dSTEN6OXptbHVaY2loTHB5L3l5c2VSZmlvb2lCbThD?=
 =?utf-8?B?UzNTclA1M0M5SUtkaDRkN0h5UkhhVFZjeE1ERTdLRW52NUY2WFh4TWRPNk5M?=
 =?utf-8?B?WDMrdndpTkJTVWlldy9wZDY3cEp4Q1l2MkRZaDdBenU4OUZ3ZXBKTFJHNzJS?=
 =?utf-8?B?bG1ydVdTa2IrdldXV1Nzb05lakFsbWo4NXRVZ1lUYk5wUzdUT09xYkdLZVBr?=
 =?utf-8?B?Z0RQK3F6NHpMd3c5RUdHYnB3Z0k3NFFmbW1Pdm1IZEF4SGtXWHVlMmlmSENU?=
 =?utf-8?B?VVBqWGRmY3RBQW52bEd5RWQvVXFvcnRiYytWZERXanJnM0RXTTllb1AxN3Fh?=
 =?utf-8?B?bXE4TUdFQ3V4OXpybGN4US9PMWwvRUI1YnUrN1JkTktYeXVsdVg2aStFaXNm?=
 =?utf-8?B?ZDVJVlVzMXVZZVhTdkVBMzljSWxXaUFWVHJLamtqU25uVEFHSE1FSmZ2cGhk?=
 =?utf-8?B?Q1NoUkJqN25zWWZ4SmNOcnNMOU93a3MzS3liZmo2NkRuTDZXT2E3dDd6ajhq?=
 =?utf-8?B?bnJyckVzZ3BCUk9Fc1R3VnI4VUxCZVg1dTZkUE8zbFByZDVjNmVqdTdqRTUv?=
 =?utf-8?B?Szh3UkRsb2pHYWtPaG1ybGZjaTBsb1YzWm9Ya2svYjNCMWVPRVFHUkpUNmZD?=
 =?utf-8?B?MEhHNVpUMVpTR25pRldNblZ6SFBndFo0a21YYXZjejg3akVTUVJObGRMSVJx?=
 =?utf-8?B?NW1FWGR3WW9UaVhtN3ViSy9qR1ZqcVFkY3p0cjdJSHZVZG4wMHRqcGxzSDd0?=
 =?utf-8?B?cXQ5SnM4N1lrTmNMT3FGMWo5TVg0YWNtNWZJOS9xNXVxeFJWUHI3TkJ2MGRp?=
 =?utf-8?B?SW5OQlVjdVkrOGpRT1lYTDBMRXZzNUhyQzlndTNRVGd0M3U1QVRDRDFhY09M?=
 =?utf-8?B?WEp1Qkc3bEpndDYrN3lIVDNTbFdIOU9scDA3SHBsdzhQUTZzMVgyTjhIeE96?=
 =?utf-8?B?Ym9PcWZpdTVvSDFCNWVOeFZDdkJpd0xvY3JFT3hhbXg4czUwSVUyeW1raENp?=
 =?utf-8?B?Zm5lS1BYVHU4bkVlcWNhMjdLTnZVZnRyZWF5anJZR040TGN6OWo3T0xrWEVJ?=
 =?utf-8?B?bFJhaXBPTXViV3JodGl5SjlQUDh2ZVpnelVUQzVGeENyVmVHZ0ZuWUdYNVZV?=
 =?utf-8?B?andNN0JqSzhIS3hhckF5ZFpNcDBsZkFZU3dXd2NDSE44TFRSNjc2WjhoRHUz?=
 =?utf-8?B?dEFseW5Ob0JJNkt1cXo0aklPOXpzNU1hcU1HRzJEaWdKRDZBZS9nVjJpS3U4?=
 =?utf-8?B?YXhBeG8yQkFlYTZLaHd3dzlhTXFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yYT+QaGT32Qp1D2j0NjkMqEUCjYm4mJWgLY37tDrqhCfPE+1/hF3qCb1ybLIBpq5DcB1E94ue1Gm05pviw65hcZ6fJB6Yts5xtZbDJ7ZYK829TD7VesrwQPNZwuBFPpdSHc6FqCpBbO94918jpXQLk8c5SlOb1/98BzGYYZaJNVdFbkaWXhTbzoPNCGwjcQB+W2a3uVQdwxT3Vm4PKmUF9Oa+AlnXkKCMaW6hjlNzU+5cxZ+NKxsuzARfR6kAQbyfBZw83LhiFcZ8hzzYSF6HPwpv15jutUTALHqHpG+0VWaJgC3ZIn/WhAOfdFgOPywWCP7wghkmXd+v53TZThaoN0LUQKFkUTkMYPbqPVSYZbUbAjUlZVUtdIZI8chaRzEWGSxJZTO4rke7IwFO14eoMUklwKa6Gl1ontfR8b+iF2o2ZlH8cig/O7X3tQSas94
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:31:58.6929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e2ab68-66fb-41f3-6a61-08de655a31a7
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6064

On 05.02.2026 21:55, Miguel Ojeda wrote:
> On Thu, Feb 5, 2026 at 2:42 AM Jason Hall <jason.kei.hall@gmail.com> wrote:
>>
>> Move Rust linting logic into scripts/rust_checkpatch.pl to prevent
>> further growth of the main checkpatch.pl script.
>>
>> Warn against the use of .unwrap() and .expect() unless accompanied by
>> a '// PANIC:' comment. This enforces safety standards in the Rust-
>> for-Linux project until upstream Clippy lints are integrated.
>>
>> Suggested-by: Joe Perches <joe@perches.com>
>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> Link: https://github.com/Rust-for-linux/linux/issues/1191
>> Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>
> 
> Ideally, this would be two patches -- one performing the move and the
> other adding the new lint.
> 
> Either way, the file should be added to `MAINTAINERS` -- not sure if
> Joe would want to maintain it or perhaps have a new sub-entry or
> perhaps a co-maintainer etc.
> 
>> +                    "Avoid unwrap() or expect() in Rust code; use proper error handling (Result) or justify with a '// PANIC: ...' comment.\n" . $herecurr);
> 
> By "proper error handling", I guess you mean bubbling the error up
> with `?` or similar, right?
> 
> There are also other options, like using `unsafe` sometimes etc.
> 
> I think perhaps the best is to keep the message a bit less strict
> (since there are cases where it is OK) and put the details in a link
> to, say, https://rust.docs.kernel.org/kernel/error/type.Result.html#error-codes-in-c-and-rust
> (Cc'ing Dirk who was involved in that).
> 
> I am thinking of something like:
> 
>      `unwrap()` and `expect()` should generally be avoided in Rust


Gary had some concerns about `expect()` in

https://lore.kernel.org/rust-for-linux/DG3VYAW3TXEO.1YG8N99YWCDR6@garyguo.net/


> kernel code modulo some exceptions (e.g. within asserts in doctests

... and `tests`)

? See

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/alloc/kvec.rs?h=v6.19-rc8#n1355

).
> If the use is intended, then please justify it with a `// PANIC:`
> comment. Please see ...


I'm totally fine with this. In consequence do we agree that this will 
result in some follow up patches annotating the existing "allowed" 
exceptional / intended cases (e.g. in doctests and tests) with `// 
PANIC:` comments?

Best regards

Dirk



> But I will let others comment...
> 
> (Also, please Cc all the maintainers/reviews of Rust and checkpatch --
> doing so here).
> 
> Thanks!
> 
> Cheers,
> Miguel

