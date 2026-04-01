Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6AC264A9D;
	Wed,  1 Apr 2026 05:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775020004; cv=fail; b=LNHtDTsPXRydOiEjzz25axUJEiJAeZ6/ebNxq0js63MOGoMHuPawmpGfvfWzYrqZRJkTHw6yPUMYD3PyRFVQ8JHuoj7x56OE+4Wgq58LVQw+OxRNm/XC+BCsAoq2SiWyPTbJ3guhP+/QSpxqwRQaXUvBg9iXuOpaDY/NiJ7CvxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775020004; c=relaxed/simple;
	bh=JCAf53w+jGyMGjrXhJ446Yvg8Lmg7TGGNmGMdv1Zwu0=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=OpG432U7h5fNMUG4hvWvegorKQBRYM8ORgymKpe4wgdgE0hy5+fYNHQzIZm6TgDHVwpU3v2AUK5JWVav+AlBLOT7lWjMk2UDiuwXNm8wspKMOMqEH5lRUqZt3ORCpJN1rouZ2n/GnXyqNUUfh9yRAzKpblgjCx3jiv9AukHFvjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ee9QOe/W; arc=fail smtp.client-ip=40.107.209.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ee9QOe/W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kx//xcEuGFPp2P3AqgZi5aR5utmjIhpMoL8g0zdGi1lbSfWXu+5Vmlt+d9OvYECANPbIoDi8UNBXe61YhwPD4OayfeusddqK2/RsMNskg1GlT+KcwwElsYrQFybtyhBpERLE8LtpzaV6jvnPcvXnhDQLhwDLIbxWGDUojbopXAHoKEeOkFryzocxZ6J064kx6LEFwyfxnJ06aPMyWv7Wkyyv+im2S4XOCRDuHonKyQouAsbUow4SpD/hhoVg6b7vLjDQEge/3Y4LPI4z0LonaVgvKuPYjf3bgi38tF/8p0XqV6VY3OZxR3VIhiddrMcQ5IUeRPGF43plLEeuQa1WKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjgTiNYaukmlIeMpMsMK4+4MCrgyAO6gHHf43WD1EdE=;
 b=bCqyBSznHDsExZsTecl9H66seI3sLlouF1bD0O/fz2dsPMoH/BJyO0CW5g/IynFqzmjpFXPTVN+5mM8FDhHqB4NUe1IVcOkGyY2ulVn7HHYovaCmo7jzE5XU9JD2m3P9J8Zj00sVK4f3QV/CSWdnVvER4LDzKYlk3YEpddks70sfKxAX46SMa4RLB8Fe7cSrf3rKdPvIvq46lVP7jcq/ZjHLpxzgk97ZfK9NPXJOTIqAbnJSMvAAYj7dm6cHjBkoKSbkycBQXhhYLC0WJTd7kc1evd5M1Wn9ziOCsF6PUjurs7l67Fy9zqdQhS60j3PXla4nUHFVvtdr+7zl8Eiolw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjgTiNYaukmlIeMpMsMK4+4MCrgyAO6gHHf43WD1EdE=;
 b=ee9QOe/W3yxEv5kFnTNva5wc/B+UtENCiVH/hBZLjyHyaI+POId066i9jQSZliDDrmBNZStjTqmMnQxg/z36t12rFHY2c9QfrO5zltxMUCN38ollSGvA2hzNf23SNrb8HnbEexuNgVI8R1gBuJGL7F+bEyY4gMavVy1jdmOUQon2GkmQJ/rGp9p+VlLze9sXlpDOVsMI3nWwRsOSwhyzCmgjqHrqodz6uN7gHnpPSALJuwNziA5Q245ToEt5YGWcbBJM4M/T771dc8jhFM8PtRUs3Wa2sGrw8vJdBnCXXQgEOwP45yTfRjzRBzFO6q4aGJkxzn9/ma4mxNyAyPv1PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB9470.namprd12.prod.outlook.com (2603:10b6:806:459::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.12; Wed, 1 Apr
 2026 05:06:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 05:06:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:06:35 +0900
Message-Id: <DHHK2OJ6O83V.2MZNHRQYK21EU@nvidia.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>
Cc: "Jesung Yang via B4 Relay" <devnull+y.j3ms.n.gmail.com@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com>
 <DH7IVVURBJ8G.QP1WRFTGS556@gmail.com>
 <DHHJCEG8BC47.2VC6GLDRRZH1B@nvidia.com>
In-Reply-To: <DHHJCEG8BC47.2VC6GLDRRZH1B@nvidia.com>
X-ClientProxiedBy: TYCP286CA0303.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c303b8-efed-456d-40cb-08de8fac7493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	R5DUVp0rQPdfOR7Udx+i5XrZsGxk6jrQS0aQMt6xBlOdbb7tuvle/AaNEjccf9TGxmY984ULu6cS9fWi4Lr84bWD/T6Rbc3sJDQJREm581QXFZmskWPki4qgrp/0CJsFa4GFRzaXU4eJd+BEb1lKNdAqbaujhBS5itU3eI+Dx7QmTmivA2czG2gHotQ81QcW5lNDwzOIyrOmopsfPRFML7pUQUvdN8TcTmhGDc69NLcRtv4crLVnxoQRaOEFmpP1nQsL+TmbX7fXZEpu3J/cSKgSQ4o91t9Rv8dJMX6Mn64HRa9q7Jev04DFjaXTP814tU6InbvztfYaCKV2cPG8rTKHAJDt62KFxdkZ0L61IjrfmPy/n/Q6SVeX5j/o5cM5dYQMEY0r35jVHEdWL7cVt3AC7XvwmN35BPJXpTXBbd7OwbGaiRtt6GI0SPQNVojDwycwMEnEmrqw1cu8otGBeoYu19HbFQwjfpG9HC+KI6xdqKMbm7f1cowrLPwwbIx6sVeuWk4qwFc95wk2XB+Em/UZ75eMu3YOumU9rUWmulIPxFoWEvw3IQYkIdAGw70m2EazR7jMmk21TkVuCEZCeqqkPK9Vq8AEEsiIL0eoT1m6HIuC3YSBUXn8e2Dhs9hcMqngbdcHZ5th9Rae2x48oQlPTlU2RCy9j110fZeWh0zveI/dOOh0ytAgC5sGxp43wHCkr4+T6eEehSn9i4v9uh9ZsmmuiE1tHMvZm0iP9Qo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZityWlEvL1oyYVJwSmJtRTcxSGZRMmhlYUptQ2FEQVNsWVdpb2w1VlZwcE4r?=
 =?utf-8?B?cWwxNDB6ZTlDMmFFRHVENFdOclRXcHhkeXhQMVFWMjBKdm56aFZJdC9wMGYx?=
 =?utf-8?B?cjVEeXNOeWI2S3V4Slk2dnh2RU8rYXlQSWsrS0Z6V09nblRXUlBMNkcweWxD?=
 =?utf-8?B?Y1lDK3I0VElMU2VUTkR3Q2ZBL3FnMEt3b3JKbXMzWVF5YUEvYnRDTWFzRGk4?=
 =?utf-8?B?dXFQR2d2QTJsa0g1ZjlkdTVlTjc1Z1ExMkF1eUlGdkdveThCRkd6SURWdms2?=
 =?utf-8?B?TUNZN1IwUnFlak9IMmJkK21kb2NUY1NtaVVjZjlFRWtRNUd1QmhNK0hrY013?=
 =?utf-8?B?L29UNHNsNDhXUE5lWWJIanRRNnNTa0Vzd3lLcHVRMVk5SUZUWE5YTFdFRDR5?=
 =?utf-8?B?MnZvV0VGMk5DOHJ1RWdFaUdXMVd2RzFVT0FOV0VlWFpzSnBBRmtFMVlvT1dS?=
 =?utf-8?B?NXlyaG52QWU3U0JrbTBuVTN5MXc0dWZ5SjlQcHRXdDBoNFZOYm9iV0Y4Tk1H?=
 =?utf-8?B?RzdHZzdZa2lWTTRNbTdidkY0M2gvOEMzcGsvT0xUdkhhQmRPbXIxTmxiTTZw?=
 =?utf-8?B?ZUd1RWVwcXVBU2U3NksrVzNhcmdSTHFYOEYzZ2t6NEhQQVdHV3BVTzkvd1p6?=
 =?utf-8?B?NnFKQkZIMzBDZmFONHhhd25LM1ZmMW5NdlYvRis0LzNTRm4vVUhrRTBwZTRq?=
 =?utf-8?B?REN3V1RGZVI4OGtjTGJtMGNtY01KT1ozYkF6bHBFcDZqa01GbzNld2IvZXBx?=
 =?utf-8?B?b1UyL1M5NmpKNVcrQWgrN2VTUzIrQ3BGYkd6VlhVZXNiSVhnSTVnWFV2R0tS?=
 =?utf-8?B?eS82S0lCTmNKTW1GeUFKRm9tUzRRZ3pzRkNGZllpUGExTlFqMkFZZ1BxYWIy?=
 =?utf-8?B?QjRQeGE2Mi9oZjJMSnhSRTBVUFlGUlFPRUEyaTNFZkRvYkoyUkY2VHVLYXBO?=
 =?utf-8?B?WnI1Wm9QRWFBYmVOSVpCNlc1clhLUENQVHUrUk8xMW8wdVVQTDVJUGV6R0dL?=
 =?utf-8?B?YS9FN01BT1p6U0lYUXdYaTNsT1k2QnFlYjEvWmRsdU4ray8rNG5icmpHSFpJ?=
 =?utf-8?B?V1hVLy8zOENWSndpQzRLbHoxanhCeHJ2K1RkcWU3SjMrUi9RUkpWM0NRblhC?=
 =?utf-8?B?T2o4WnlIM1RSOWxhTGEvQlFpZXhVc1d5ZlBIN1ZOSkNrUjNPd3M5M0diSVRh?=
 =?utf-8?B?bG9XdEtJbGJLTFlwb2dqRWIrSXkxYlg1Z2pnVWVQNHUwcUVza25WUjYwRS9P?=
 =?utf-8?B?NEtPc1A1M0p2UzMweXJwaGNNU25lT1J6aDNtY0YzL1V0UHJkZ1JCVWtKNXFB?=
 =?utf-8?B?Rm5lYzhkOE5ocG12RGs1b3A5Y3cwZFYzRlJZbXR2MjUxZzBFcTlmYlRMYWxU?=
 =?utf-8?B?Y0c5YWtrQ25XYzI3bzYxU2ZOQ0IrZHJTL0tPQnVGdzIzOTdDaE9ydDUvbUVK?=
 =?utf-8?B?Q0l2d1hSZHFFSFJLNnNIUnNsZjZma1FwQWZCUlNZOGV4d2hyYnNKZG01Rlpr?=
 =?utf-8?B?TFUzdG9wdWpDNjI1aVVqTlF5R3Q2QjREaUtOOVp4cUdUYnFDbDdMY25BRFJw?=
 =?utf-8?B?ZVJrU3BzczlvaTR0ckhFZmxoVjZRQ3huUk9JUm5zYVRkWTBBcG9OMUpheXpK?=
 =?utf-8?B?dzdDUVFmVFpseGlZSVNSd3NvdFFMbFJRclJSY09JUzBzTUZWRzZ2Z3hmN2NV?=
 =?utf-8?B?N1NRVFZtMDlSNFF6UVBzOXdmaURKV0Zxd3VpRjE0NEwyRDJHY0xiY1NUVit6?=
 =?utf-8?B?a1JsMnBJRmNvM3NYWU14UzBEUEZ0OXU5VWV4MEtJUVpYbDFZbmNYNFB0SEMx?=
 =?utf-8?B?bmhwdWtvL1p6OFlqaEJ3L2FySnQvNW1aaUNDTjNhTTQ5ZGkwK2pTY3Noa1Y4?=
 =?utf-8?B?WDVEMS9pR29RMnMzR29tdUUrYktDdWIvdllxUUVSOEM4TDBjcTRRZmxFRWl3?=
 =?utf-8?B?bnEybGJsUFA4a2xtSzZ2WEtkbElNZkhnYTZYN0xDZ1RxUEZzUE0wNHJnL0Rh?=
 =?utf-8?B?TFo4emZURktqY3JVaDcwb1dsSVUzNzIwMFh5SEdLekFsa0RicDZTc2dzdmdO?=
 =?utf-8?B?cHg3UHg5ZkcxZDJ3OE1DUXVBNGdWMlRCZmxZeEx0TE9JNWRJa2ltYnNGNjFS?=
 =?utf-8?B?TVppNk9EdXNzelkvNjdhZGFoK3k4L0ZraTduY0t6L3FDQ2pXaDJ4VlVvQU9W?=
 =?utf-8?B?akNqQitQN0lhajdIdkY2Ym5hTElRWHI1bFdaYlhYWkpqQnB1dzBTWXhRL1lG?=
 =?utf-8?B?VTJWcU91NVRQVHc3WUNocEEzYkdtcUVEcEU2M2p6OWRlM3NoQVR2Q25Jem5a?=
 =?utf-8?B?Z3gzWDZOa3pyQjJMc1lodGVlRWMzNS9NYlpsS3FvNG9IZVp3Vy9YUWRkMHM0?=
 =?utf-8?Q?Kku7/+HuJPwii1C08GAukKqQmMVox2Jz8YGD9gMBjp0u9?=
X-MS-Exchange-AntiSpam-MessageData-1: a3jsUPAQ38PZkg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c303b8-efed-456d-40cb-08de8fac7493
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 05:06:38.7716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TjhbM8wnQIH6cLtM+ZmJObiP0jfsvYIoesIvw8nCO/+pFA9ZWJD8pWK2W8oKS6ipU1fndVs2aHYqswaw6LbxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9470

On Wed Apr 1, 2026 at 1:32 PM JST, Alexandre Courbot wrote:
> Hi Jesung,
>
> On Fri Mar 20, 2026 at 7:04 PM JST, Jesung Yang wrote:
>> Apologies for the delay.
>
> Same. :)
>
>>
>> On Sat Feb 28, 2026 at 2:31 PM KST, Alexandre Courbot wrote:
>> [...]
>>> FWIW I have converted nova-core to use this, and this results in -200Lo=
C
>>> delta. Obviously I like this very much. :)
>>>
>>> A few pieces of feedback for things I noticed while doing the
>>> conversion:
>>>
>>> - Very often we need to convert a type from and into the same primitive=
.
>>>   Not having to repeat the same thing in `#[try_from(foo)]` and
>>>   `#[into(foo)]` for these cases would be nice.
>>
>> I think I can add a common attribute that works for both `TryFrom` and
>> `Into`, e.g. `#[convert(foo)]`.
>>
>>> - In some rare cases, we want to convert an enum with 4 variants into
>>>   e.g. a `Bounded<u8, 2>`. This can be done using a `From`
>>>   implementation, and that's what the register macro expects. These
>>>   cases are not covered by the current macro (they are few however).
>>
>> I think you can just do the following?:
>>
>>     #[derive(Into)]
>>     #[into(Bounded<u8, 2>)]
>>     enum Enum {
>>         A,
>>         B,
>>         C,
>>         D,
>>     }
>>
>>     let a =3D Bounded::<u8, 2>::from(Enum::A);
>>     // or let a: Bounded<u8, 2> =3D Enum::A.into();
>>
>> This works because `Into` actually generates the `From<Enum>`
>> implementation for `Bounded<u8, 2>`.
>
> Sorry, I said the opposite of what I meant - we want to convert a
> `Bounded<u8, 2>` into an enum with 4 variants using a `From`
> implementation.

Forgot to mention: if you want to add a `from` helper attribute, we have
a temporary implementation in nova-core that introduces a couple of
patterns you might want to follow [1].

In particular the `MAX..` arm branch to have to compiler complain if the
enum does not cover the whole range.

[1] https://lore.kernel.org/all/20260325-b4-nova-register-v4-1-bdf172f0f6ca=
@nvidia.com/
