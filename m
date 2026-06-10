Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021112.outbound.protection.outlook.com [52.101.100.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934DB285041;
	Wed, 10 Jun 2026 13:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098799; cv=fail; b=hLtl6x+ND9p91dm1BECeVV52UvbBUqYmh+WA0NuHx3xOovGyzrImH4YHSgmGBOqqygSMDnbPoJXrdgOVAL+WLM0CV/ciDl+Kyb7Wm1NJh9KapdM/5tUmY0GZZBDhiZXpJLxSefp3x4XjDttfRfhuuUoLFtjTT+VaiXFlE/PkA9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098799; c=relaxed/simple;
	bh=NwIajFWJHSpG8VsHOaHxSn4vpb5ucM4Zjbe2Vkzo2mo=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=PlyQLwhtvN8UsJt4sav1QZn33/CjX9jOeGsdxWghQk/6VE+VYgZ7XBExXIF/3/Jr/3/Wna2Qh3E7gmpZ5D2w0a+Q1NqcrusJjWOYvKnBQKarzL2ddkHxYG+YqywC+49f0bcxmxXSG+SyRcm64Ub0RE2IepBrpYO9RkQ5fYHLD3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=udNr39ug; arc=fail smtp.client-ip=52.101.100.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="udNr39ug"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fjh3w8QzoCannpjtmUr6tC/kWiy1A0wDyxwiGJGfeBr9YChu8UteOsBskStnj1pQvSN5VxFur5zsCC/uplRcPp7GEX/KBxI/lI2ZVFC8OHu6WSTzsOJ0Ux8K5hB3B62tp0zL/X6YK9YdV5FLAhuhwcNhJKOHij6vlOY09ZHGcyqzr/VrCBzA4POsYtMrVm73rdd3UoU4mS4QJd0KG0poHE1zBQwvMWnFe6KRZP64zWtuDAb/gg4JY0niy5sFF+6Q4zTbJ09IUtZGkv3/LQ3QvRJg6mMhv2g2yZI0GuxKOwjaEOSpQOsDaqO+zS1L9r1uv9+Oe1LrbyGXJLZhJRHCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwIajFWJHSpG8VsHOaHxSn4vpb5ucM4Zjbe2Vkzo2mo=;
 b=tTNKkNq5sFfKeKrjpthiv+zDLfUkx32qh0Svm+lL5hIMYBmgeJQfpxOfafp8Yur7SoXCx4vkxg6KTmaLHe/Jbn8/Jn2HNe0iAVJZvBPcw93SKMOhY6ToExZ9An7dDY+1EN5OtyZkpfywoMoGnDXiYIIkHKPglw2Qz1Jcxs6IJ38SbHuKJ2Mt4OdGSlOtE63ylWSjj7572d5r+5G1tbbMLve/qAbHXy6xS/Hu6rqMQTxX34LSttAeFOcr98UwQspRElvq+aeveTvlphtjsEtZdePAsOWGH2ZzipPdI5VSmDhtpUVffn8WVeRDOGrf1z3LBZ6jWHjw3NhI7sf9vl18Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwIajFWJHSpG8VsHOaHxSn4vpb5ucM4Zjbe2Vkzo2mo=;
 b=udNr39ugCAoksnGmUnMkxLlGO1NaMVgVA7sBjL3Wz2QsKqkXC5drgL96kFsHsULn6/kw6dtsHO589rqew3gT0XAaPhilhabXhLL5/cFEx+xKh99Pd3iVSawI72job8cydOy1Rr6a1oWX3yW1DNkQt64p3MkarHylZcDJ/XrPLT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO4P265MB6982.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:34d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 13:39:47 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 13:39:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 14:39:46 +0100
Message-Id: <DJ5ETQTN0B4N.G35D5N46VX13@garyguo.net>
Subject: Re: [PATCH] rust_binder: add ownership assertion to Node::add_death
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "Georgios Androutsopoulos" <georgeandrout13@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Carlos Llamas"
 <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <brauner@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Paul Moore" <paul@paul-moore.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260610035544.3333022-1-georgeandrout13@gmail.com>
 <20260610054503.27046-1-work@onurozkan.dev>
 <CANiq72mVH4NNfyQOESf8uPxZhvbDv0MoQY48Ad6K-yfmXFcY+Q@mail.gmail.com>
In-Reply-To: <CANiq72mVH4NNfyQOESf8uPxZhvbDv0MoQY48Ad6K-yfmXFcY+Q@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0140.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::19) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO4P265MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: aa4bc7cb-89b8-4ca5-917e-08dec6f5bcef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	rUxLlzwjqExFRylsEnfK4s2ez8ZtIxVJUq1nB+t8KbUjQTdOK+EMgKQUiPTUJHpoN7HummF82vGQrrWwfQfY2iP9VX279yTVJJbZXo2luoA1TO5j6YvGFmNbDTdbamsp/9/5oiyu44xCeRsDASLcUNG/GMe+oW0mnrZYZnNa2/KTdhmK+st9u6A7LKKzPvxZPWIhtCKak4Ak43kz5jBtc6Rni6FeaLiXRNVcqEfHM+3DojLgz0k8sLuOR9zp/xX6tSg2E2L1s2oQugCKQFyq2cmn9e8pb4YhVx7jpsSzjS6ez0RyiyN1vBChPmnjUvvFWVhoxBWyvb2ox9S9JMMT7TDC8nx5NJzbBNdNIW5FE9EFtJ8Oq7HM7FTkra8TdZBcXmUFnYCu2itOJNP2Gck1JPvjDVY9Dso5xs9ztvBH1Yu/vd7eOtbVNGeuAs5e4PapU5Zd1gmYAnhG2WxLiuS7eHuetQdzuMq+36FGxF7oTvWpURMD+RiWVprUsokNjwgKOUOYZ4wKL0cT0CE+xq0Xyj2Uc1Rpins5leTu6pvhYEJ0BkdZM0IGHnHVNTsXR7/Dq8OJxvEL///awy2LmyGqMRxYazJaEwaVKEudsmQbaQVgrW01HIoWj4JDynABVhFfo4rsLCQkg+6rP0mF3+z5BiXiCok1xVjDeW7LQv1RFuXOhhnyq1Glj6djmlySFpky
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vmp4TnBldjQyd3VyZzZZTm8wTzBGSUJSaGhBenNjYWtOU1V5cENCK3E5czhI?=
 =?utf-8?B?R1ZmMmlyS2Y5c2NpUmQ1Z1dOdy9hYTlpdWthWnRLcjR5NHhNVXhKRXE3OGRV?=
 =?utf-8?B?a2JrVDhHb0JGcVVtTDFLMFVyUUJwRGNJNUxLZUc1UDlVNEFkVDdBenpWOWpy?=
 =?utf-8?B?eTNacm1TQktnaFVtQ2RmUGhod2pBd0FrRmp3bUhuNEhHYnpvUjJESk9GYURv?=
 =?utf-8?B?VnNWM0ZYcUdjSkd0cGptYytyaFJDdVdsUnJhOU5EZ2NTMExJVEhTYWdtRHlo?=
 =?utf-8?B?bnRTTisyK0gxRDBaRThub3MwRlBQVkNmdTFCbWZrS2hsdjQrUUFhQm4vUzdn?=
 =?utf-8?B?SVd6L0ZPUDJUQnhUb1JKRWVsUzlSd1N6THZZWnJOc1FSaHJDdjlTaDVhelc1?=
 =?utf-8?B?aVNERUFQL1hyV2FralVDYktWTVJuRlB3anY0Lzc1VmxOTTAwU2xRM2tXNCtt?=
 =?utf-8?B?OFNvTWxVazFid2cwTmltTkJXWk5sZFdtR1U2NkszM0xWdnJLY283UlFRa1ow?=
 =?utf-8?B?Wnh4VGNSTFlScHhSNkVyWXNDamxXOFg3cjd0VnE5MUtzbk1KOU1OTFdGOFhE?=
 =?utf-8?B?Q3FPTGZZWlRZZFNmR3R4V0w2MjJOYU90ZFpwbVZSRGdrTzdrVzNvK2dmS3VN?=
 =?utf-8?B?RmFYMFd0aG1zbXFLMjYwSVJtaTlCNksxV0xBRlQ3NFh2ZThTenZMZkNBVExI?=
 =?utf-8?B?dFlKZ0swbUYvb2I1cmViSTBOa3Nzd2lVQnBMZVB3dXQwYm9VN1cycjBPZThS?=
 =?utf-8?B?ZmlvRDNRNFJuQmtmcmxPbjQ5R1d1aEIrWW9NNkgwK0NpS1R1WXFoQ1BhSzJ5?=
 =?utf-8?B?S3dmY29mNDhiampicGJpeklMbU9SRXBlM0xFVllTK3Brd2wydWN6K1krTnEx?=
 =?utf-8?B?a2ZEc0NBWElDOXBVc3F4YUQwTTBidEg2WFhVd2g4TUVrL2haNlhjTWhVMFRv?=
 =?utf-8?B?THhhWm5lQUk3Y2diWitKUXNJaVZEelF6TFlId29pSG5pUmZNYkJ2Smg0SmVN?=
 =?utf-8?B?YysxUks1eS9DZWUvRTdKNytlaFJZTGV2dlVsUnBsQ1J0cDduWkRnQ0R5eXBq?=
 =?utf-8?B?YXNUQm5UWXpZcUxDYU5helpsYUR5d3hXRkVYbUQzSGoxbU9xZ0lld1luMjhk?=
 =?utf-8?B?MEhCb3hjdk4rQndVNkdzaElHaEJlbE51MmN0cERRSTNKREtBQlp6NzZnQnN0?=
 =?utf-8?B?TmttRHhGTVVmQkJNL09WRWx1ZUZ2THRKMWhidEo1Ym9UWnBUOWZUb1dZaHJ4?=
 =?utf-8?B?US9raEdYdUZod1JLcFRzeEQ2SEFUNnBiT0VhSXZGR29PcDJsUmlpeHBHdFVj?=
 =?utf-8?B?U2ZkdXR1ZnVrSFpQVmpwdzdQWmk0UDZEaDBXK3c5MTJybnFPOCtJM1NzRndU?=
 =?utf-8?B?ZGdFZHNMMDNuZ0Q1QUo2cFdUZWxWT0U5bUxvNnVxVnExa2tKcHBvMU4yaUhq?=
 =?utf-8?B?djNIS2IrS052VEZFWVlrQTZUQXliYTNGcTFvc043WEkxMVFVSU5XcWRCRmxD?=
 =?utf-8?B?aUQ1QSt4aXM0b2tmVFF5bUxFZk8yOUVDaFFxdCs0VWtaUU9hOW5sR3B2dG9s?=
 =?utf-8?B?NEFUQ0l0blBPVjVmenp4TFNnRDhmcnM4WVlGbVRldWlNaWFoTHJTeDhKb0Nl?=
 =?utf-8?B?c1hxelpwWm16cEZkc2lxRVcvSWh4U25xZERMMVRFdVZUbVhSanBLMkVnQks1?=
 =?utf-8?B?SGZ0WWVGcytjV3EyRmhqSjZRQm5Jc09JQWdqVUdpbThUVjhyLytlV2NNYUY3?=
 =?utf-8?B?WTA0TWJuZFozRWxiVzYyNm5xMTRsT0lkOUl1VUxSclBaS0tJeXZMdWNFR0tZ?=
 =?utf-8?B?a3FUNXlUcFczbFZTQ2RDR2J1K3k4aURNQUpudGtEYkFyeUg1WVFyc2RyT2Qv?=
 =?utf-8?B?QnlyeVlMOWNLazBpVkt6N29HT21tZTR0b1BoVWh1ZWtIM0xiM3pneHJqNnNp?=
 =?utf-8?B?Q1dQVlBWREQvTVNtWkxWc0J5aVRWY0ZkUkRPMkxDK1BVc1l0djByWDRrbUZQ?=
 =?utf-8?B?d2xMbUtETTczbm1acjBNaldkS2hDQmxEUk1QRmFIU3Z1RUdzZzRhZ2VYMXNz?=
 =?utf-8?B?cUtHajBOZ093QTN0bUxWVDlXWmVhdVVqZ1BUUkJzbUhYeXQ4OGhlRW9nNmJD?=
 =?utf-8?B?b3JFZXpFY0swck5pOFdRdGt2OWlabXd4K0xaekw0clo0enZuS3N4NjNaVTVk?=
 =?utf-8?B?ZjNkR3BidUxGQ25EWWFxZ0EyVlJHM2pKNFl5N1Z5N205QU5CVndGWW5WRi84?=
 =?utf-8?B?eG5hUnZWYkFUUE00TlhCd0pxWlhMY1kxclg0OGd2UDBVR0RDOE1yZ3dwdHlG?=
 =?utf-8?B?MjdHQzEyUDdROWVxVm9vbHNZK1FTUG1zWGZrczdMZngzVjc4YVRUUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4bc7cb-89b8-4ca5-917e-08dec6f5bcef
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:39:47.3105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LBkblG2rbZ8ixiv/TvMNLmAl5tWhGnAkET5PLKHqwBgqogzC7LKKt8kX/bGkmG5p4Uk3KoSgtiKY6Rc1cLo3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6982

On Wed Jun 10, 2026 at 7:07 AM BST, Miguel Ojeda wrote:
> On Wed, Jun 10, 2026 at 7:45=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.d=
ev> wrote:
>>
>> I think having a `debug_assert!` should be fine. That's also your sugges=
tion in
>> the GH issue link above.
>
> Yeah, there seems to be confusion about the asserts.
>
> If there were a soundness issue, then an `assert!` may "fix" it, but
> it would usually the wrong way to do so, and a `debug_assert!`
> wouldn't be a fix it at all.
>
> And for other cases, `assert!` is typically too strong for Linux
> (outside const context, tests, special `cfg`s, etc.).
>
> In addition, please consider whether a `pr_warn(_once)!` or similar
> may be a good idea to pair with the `debug_assert!`.

pr_warn is probably a bad idea here. Given the code relies it for soundness=
.
You're either sure that it won't happen, then you use `debug_assert!`, or y=
ou
are not sure, and use `assert!`.

There's no "I am fairly certain but the code should keep running despite
invariance violation" for this one.

Best,
Gary
