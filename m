Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022106.outbound.protection.outlook.com [52.101.101.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F59369220
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 21:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698273; cv=fail; b=HzDBy02OgI0/5OdqJkeFnMvhWGvno0uVLXPbYFSkcoex5Y0X4Jb0sQ0cazCHzawSXjVIt9rFdG1TRYQauZEOP2BK3K6Vfy1+LyiOIyhSNrpVuYFLdvihCNPWQoaYx8m/BfTS3LpQLwghEybGGYRAFYL2u686XMGnU/2Sv9CSru0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698273; c=relaxed/simple;
	bh=Hr+fK0/Pre8fexsgn/dAtUW1Ll/fksHL1gvZLjQV2zQ=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=fp4OMaOXbEc1GEKdr+WaaqFEOmJViHvwZnoLfmSFtFS4pYt4Vtl6lAHzg/saeQgqqV5iieX8wdJYxoatSXgJzjvUl35KDVA2DkdeLQdDqtxPMrkbGl/taGLjA2OqoaEFO1ow2hqAw0FMFlpzaraHobq5Ajs+CoKryFC7aR8MLTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=rl/fJP0K; arc=fail smtp.client-ip=52.101.101.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="rl/fJP0K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MG6YgWoEqj19lAoIhND+3667sDkEDfS5+CKdBBmTbTFN5kFxHA6DXfqjF5N5n9MnN4bjZT1uzx/97gkg5mIKFYYQsatCPc382pzrfZxLAezejUD8yDr9aE4jaBcnQjKHNzAnm7rv3wab7aKLFLCrdbYdVDiVPKrtdULZpohkJIlhf22xO0LLaSizu0ks4toeSkDpWlX3e03xGQMoHzgdDweV33kt9S7OF8UM08Dou2kuJkC0bKjfyDhjeZjR+8oAu+APKCO1YTDTLHKQIxRXQ1mP635LsQAdDCFJwGZ8gWTsUanUWJnbvpu7bdpSnMQuaLKan8IB3fjr6p3If3Dxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFqycF1NO4rRUXM9E0DYEU67I4WtQ0GG7K7mjtDYTDc=;
 b=BQTM1z5LQ8cGgPgU2NOozWMD+8bwF0TNud0ys4ZnfS8Cxx4EKX67oV69SDBkuGxO2WhXyIQZRWgisfP2JGKpE1fpWUWkTsPzS6U9UVkFP1iJpa2XXczYbnWM2DW/koDA6HR08mhNe2RCjvIPXrU+KzuC1/k2RWbFAycma5Hh2BHTnWga1DZFni6g1I/SKwTYd7JgZaj2Q02PRLVR7UpHyYRj6X9iGZjGZ5tPq4yCml3THkHybJgpQzfNjR2liZs389/byMgYgdTLqKXjhFPHanKkWob9J7+vb5Z035ljFV9RMmnG8vmhX30b5fH3okkfQrZ+/e6OLQDaNOFyWdroHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFqycF1NO4rRUXM9E0DYEU67I4WtQ0GG7K7mjtDYTDc=;
 b=rl/fJP0KE/0GgEKK1d9+GeAkll9n5v+N85gMPpuvW6ut+BxAAdKWK0KvVQIm++3KHOcYORj8WnEmAygUedg51WwaHgm07VsfKM2a/BwpUHjgo65+mI3jiAfRDwounOJXCw1jD30YJWzfVdRA9CE0DohGVvWCB28H80nbwYSUTj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7326.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Mon, 16 Mar
 2026 21:57:46 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.024; Mon, 16 Mar 2026
 21:57:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 21:57:45 +0000
Message-Id: <DH4JK6IH9W89.2I7KZVGWJOPF5@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Timur Tabi" <ttabi@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, <mmaurer@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v9 3/6] rust: dma: implement BinaryWriter for
 CoherentAllocation<u8>
X-Mailer: aerc 0.21.0
References: <20260316055736.1690546-1-ttabi@nvidia.com>
 <20260316055736.1690546-4-ttabi@nvidia.com> <abhsCSOuS3pi9qrh@google.com>
In-Reply-To: <abhsCSOuS3pi9qrh@google.com>
X-ClientProxiedBy: LO4P123CA0185.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: e15c1ad9-a76b-4261-c062-08de83a70eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	r/SvXXqnAE0QnarJU728bT/RCHOBxVIdpz8n21b59b1PMAOf1QySIJjUY9Yld9TMHc4FzNjb5hf5YkuVRAeJxmyxbI4W+Nhc/mqM29h16PhPfyP83HLJlzygGOpNSIQwnlMivJjCXa5V9UPwXFLxcEKv4TvYyZWh9N91RWydL3uaPar77JsTwc0ZDaSm3tk0SdIfFnwRV6wliYsq2oTkBb05SEOAj0mE9xJvo1wrdp7eVu2ZzvCX2OK2qaVakqA26MR2PYUl9ASxvCPok+kmN0vFZchP3Rg0vrh9vJMj6uJvY26HruOniJKlxJaJfwzbWJjBQxhvml1cqfk1vtrT+IQbH2iFRzQwXxKXS2PXaCeiWjc6/6D0mdM87TVw49Egcr2EX9rOT8xFuBpYQbtizK9B6eVmrnVApVCdEsbReBYIBsQO9Z3cS9fxgIGDncWFmoyIOeVeA+FfR/KhQ9smxLr6IFg+89UZSwhwE3ZLCv/uunQSfQaxZx+v1f54GLC9cihxygthXT6Ea1ctUNfthLXy4v+oOiYUIVWvvWPKXOzbkt4Cpfm9FYLLLx0NRBnVGV3Gdp3dfad0T528z9ZZWXpdBcMrxGzcqMsKxB/X61kZ55k35LVOCZnDHuUdYB+PlBkvjv+SDRrl6WmTXJfSvJFKZSiPrzdYNCbwBy067NeIBlg1mbRP2D5XMzd6rSn+SkJO9Ny0t4x+4scys3kgiQlXRwlvSfncnhlKsXxltJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0ZCYnA4RTZyMGhOSGllTWJmQ1hDQ241RUJjekNHM1VyL1lSQm9wNjkxZGM2?=
 =?utf-8?B?NEJ0QVpyREJlT3JGTmlLUXk3ckN5WTJLVUk5Vy9HUUl2NC9JeTZxWExHckt6?=
 =?utf-8?B?eG0wYnhISmkzZGdpbjFGUS9BdlRaWXZCWGV4TWhFVkF1T1QvTTgvVFRCVlpE?=
 =?utf-8?B?eWNkMjJpcFZpOXB1RGg1Yit5QTU2WEF1bFZ2cjdGcG1VbjBNRVhjYmMwU2VM?=
 =?utf-8?B?Vy9ad24zVDYySkdsejg1Z3MxMGtYdTkyUWJRYzZSVUZBVEpXUE05VG1jVEQ4?=
 =?utf-8?B?WjQ1bWRPdm1BVUtWRTdKOHhyVW9keVRMWnhmcVBzVWdUbkIvVmtKVlhMVC9N?=
 =?utf-8?B?NmRJbE5GWnhaTHloeG85VU9IUW5oNVF5YmpRSmxSdnQ1MlVMNlZadFYwdytj?=
 =?utf-8?B?THgyeHN4Z2V1cXZNN3I2a3d0MUM0UXNtU2d5SktrUjhMaGNYaGRPWTU2Tmhr?=
 =?utf-8?B?LzdIbjZSYjh5REpRaHovQTlESnJqSDlKT1RkS1l5QmV2bGNMZDhraWJJUDVE?=
 =?utf-8?B?c2pHeTFVbjB3MkZrbmw3SXllSnExZlNVeG8zZklyUGxBOUJDT2RPTTVCUDBE?=
 =?utf-8?B?eXFmQkYwWGdlc2tZQytpT2xiNSs0bzdPMWVDNElrM3lpU1M1SXpaZGpvNnZU?=
 =?utf-8?B?Sm1rcWY1c0UybkVGczFrMEJyTFFadU04ZkxURncwL2FJL2FRY2RLOTAwK0pD?=
 =?utf-8?B?MzV4SUtlWWJ2NkVJMHIzNnJJZ1htMmV6WFFoT29WUWI1VzdSWE1pdEhIZnJ4?=
 =?utf-8?B?M3daK3pwMTFkdzdmR3BYSnZIT1BiWktORkd6RGFSb1NaQlhoK1lIQjM1TUk2?=
 =?utf-8?B?b0IvNDg2RWhsbnk0WXpMVThNY21va1FWckR0bWJIY3owNGtWYTNaK0M5UGFn?=
 =?utf-8?B?RTlsNk1YTmJNdkljTU94WUtzMGNqN0ttYko5UWJrSGxRY3h0bmhzYkRvZ29k?=
 =?utf-8?B?V1VPNDE1RnlkRDQ2eHUwdnJFNHNDUjlrWjlrT2RpYjhWOGZueFZZVXh3Yitu?=
 =?utf-8?B?cWN1b2lNditiQkxRQjh3L1RqOE1YSVREREhzZEJWN1NLMWNzUFhBZVVsM3ph?=
 =?utf-8?B?R0Z3OVkyZ2d1RUhrcEhSTy9iaXYzWS9mbTNEbkxuUnpYRzZpZWhXbFZ3QTZw?=
 =?utf-8?B?cFZNRzY4MGtNQit2d1VONVBKcFFnd3RrbnkxSWhsTlRyNDgzME5ZcmM1NXU3?=
 =?utf-8?B?RFcyWEhDcENLdzVOaVkwWk5MZHRXcXNJUlkrTU1JSEU4czlBVmsrWi8zelNR?=
 =?utf-8?B?eDBXOS9qeTVoWkVhQngvcFBYck90VlNFSTNtcENMUys3d3czSmVwd0RISmd4?=
 =?utf-8?B?dFFIbnU3RHNOSWpmY21PS3AyclgzRXExaW1iYVdMaHZKb2s1QzVMQ0I3akRo?=
 =?utf-8?B?ZGJHenhuUzBrT21ER2E3TUNvbWVQYXRDZitQMHVvRXNjMEhPV0p4RXZwMjYr?=
 =?utf-8?B?VUhxRTQySTlUVTVQZG8wSGNpRjgvb3pKa0pRNnhuNVgveVdKUllHeFljMHRl?=
 =?utf-8?B?WkdUYld4Vi9sdkJzOHAwYWxtUXRqNXN5WVRUM1Qxelk2SksrbmNRbldDN281?=
 =?utf-8?B?WHlNVGNlNk1yd0tQQXFFWGlHMS9FOTdlVkNZVk8zYlZwdzlBVk5YZG9xUk1X?=
 =?utf-8?B?WFZLOU9WOGQxcUVNU2FWTWVRdU9Hb041UU5NOGtrMFhQSkVsaUVIQTl6UzZS?=
 =?utf-8?B?dlBCc2VyNVpjWnhMYlJOYnVkRHZxRk5PME82Qk5QWG5UNlduUjhocW5CUXhz?=
 =?utf-8?B?dFVKV2ZQMHdLYSt6aWFTRnU0Mmw5dmpVODRqRGxtZHp5MHlzS2NpYXRZNUNV?=
 =?utf-8?B?bnVBRFNYcDdsZjFDblRnUno1dGNkazIrZ2N1QkRxT044Yld0RUFZYUZnbm1r?=
 =?utf-8?B?SnRqNjQ3ZGVCa0gzZVdQMXMvYlFFWEswdUdYWlN5T1MxN3ZKdThTOU1MVXVv?=
 =?utf-8?B?Ylh0ZkVQdjFtUW96ZzZmcVA2OG9MbHV3cXdzeWJGVGlyeWMvQXhyVWFnQ2ND?=
 =?utf-8?B?SjIwTVA3ZmlhNGdSVndlT3BpMFQzVTEwb3kxWERDUjg2OTBqTnQ4WnJEL0s5?=
 =?utf-8?B?OUdvTm1URUlINHJKQ3FQZ1JsZ1NibXk2OXZCQWhzanhTdytERitEcFRYWmE3?=
 =?utf-8?B?a0N0OStPNVBVdndxeXBFNUl5MlFQT2dEODE5UXNybVQ4VjZBV2phK2xJWXZ4?=
 =?utf-8?B?VlNCbGF5ZHJodHFVQldhdnc5cEF1cEkvcXZ2NEFiTGkwUDZUQXlkUVFLN2Zh?=
 =?utf-8?B?RFUySVNXeGVhVE1TNTcyOTVXNTVyQThBYXNaclgvalh1VzdiOGVHb2taUXdY?=
 =?utf-8?B?aGNKb3ZnMEJFWlAzRVhveFA5L2RCZXZLbDJjYjQxaGp4RnlZWGRIUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e15c1ad9-a76b-4261-c062-08de83a70eae
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 21:57:46.3356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 700mBILI6FswSSU3t9Q8EJIa95ADp5LHMNroVidFQ7dA7sfljJZ6BVEwH/2ygwAXko4xDhWVXPtTWuPSafxmjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7326

On Mon Mar 16, 2026 at 8:46 PM GMT, Alice Ryhl wrote:
> On Mon, Mar 16, 2026 at 12:57:33AM -0500, Timur Tabi wrote:
>> Implement the BinaryWriter trait for CoherentAllocation<u8>, enabling
>> DMA coherent allocations to be exposed as readable binary files.
>> The implementation handles offset tracking and bounds checking, copying
>> data from the coherent allocation to userspace via write_dma().
>>=20
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
>> +        let count =3D self.count().saturating_sub(offset_val).min(write=
r.len());
>
> It's kind of weird to call the length method self.count() rather than
> self.len(). All other methods called count() in the stdlib are cases
> where you get a length by literally counting with a for loop.

This will be updated in
https://lore.kernel.org/rust-for-linux/20260303162314.94363-3-dakr@kernel.o=
rg/.

Best,
Gary

>
> Anyway, not a problem of this patch. LGTM.
>
> Alice

