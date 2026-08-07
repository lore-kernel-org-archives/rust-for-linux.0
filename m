Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021111.outbound.protection.outlook.com [52.101.95.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D25D46D57D;
	Fri,  7 Aug 2026 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117739; cv=fail; b=SNVj0ph6IrWnsUt1ANoN90mWxEnsUAH77hLwBfccDTQdvFtP4YYXZOayFMgXiAfIeINLzFYVs9FjOTmYPkFvGNGCYmkKYC1yHjKlMkllh3PP8ubstra4XSAHV8nCNjQbkOEHk6Tm4N8ERS9PU0cl5WX28xrprdN9/V4PtkSVlZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117739; c=relaxed/simple;
	bh=x+xb5Kj1Zi7JyBeBkA2BuN2S+g64upkN9GKAnBisKiE=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=aRZ6DOTwfy9z2Ya6K3kewu6Sm5LYCfGVRJj8o7HXeVYtvesWczoRtltVMzAkie9JEVeI3C5ZB2YW5huXq/7cXn0xWAG+MrmSO+3KQasP9t55bKICHI904DctWWZoiQLjPRzBqERbrSQ4EFqAegPwkD6L8b0t0sOwL9PbVCZfTjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jiEo1nI/; arc=fail smtp.client-ip=52.101.95.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jiEo1nI/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ys1xNEXTBGIaqLKFLNavV1+IzA6I7Pr/1/5ozTIpu0MNvxnNcjoC19zMzJmgPMis2iZ8cNKOekv0J1GDZ5lbiK6KAg5WFbn8Gk/ASgHYiAVUNCWmyorIcCrIbhzB4YDR+QRe+uaZRW79+nKg7pjz30tBRob5MtrDjAXqbZKk3PT5q57mQgpJc9ELWGG6MHyVecgaZuhP5cDt0pDq2qGvj4J1dWnc/6thJReRf380HsAWLttiud0R/iZPG0sjI189n0sX4/8ludRAvD4rQApHkZcnfyhWKh4aVl3pMv33DwNLdkF4xFfG35vgVIYlNItl3AesZoeQaits99J9grgDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gt46dom26TwNktfsi+f600TKSVhWrqdOziz7gml4jw0=;
 b=Lf/IMw4Yzl+piwFh1t6AI6cPI3rI2aQuwx/p15p60NzQ6h/UmLbLNjFJy074ZT4zaP5w83MJCOqU9SJb3DawlU254HnPQW+4WHxZ2qDbiEuGWw7rpJdMoZIJy8/NuhJDS5p7fyLIfkCnAldETvMHlzIg4behOJcO9emYbT7yP/WlwxoG1kgmTMpzVFy/FIJgAtg9HroX31jpiUIq4wu7Dl33FY4eLPQPFNk42IDq+DShsbzRepOdDdv3/Tcn37QfZJ3W4D7tX/Y++5LIadUGAVpKjXPcWEzKPe6CuJTkz2pUsg+mOyTZ3c0YqoHE+lPD/qxkbazJR7UP0JQGZVNTgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gt46dom26TwNktfsi+f600TKSVhWrqdOziz7gml4jw0=;
 b=jiEo1nI/ueE1UeKBW9Nwyc7V5OqsT4dHwprBCOpaMGXYXJqexoItB3wjCcY2NUfsABksZfzQdNI2YLSmRqAWsZSalVJBPqJj0qU1fbcbokdVXrdJPe/YFvEK5aSntdXX2FJjZkn3/1s1b6ARgFnJb9djL2Rwflq3g4eYzKXkCCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB3527.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 15:48:54 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 15:48:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 16:48:53 +0100
Message-Id: <DKITW7C1POAV.QX2CZS7JQ6BM@garyguo.net>
Subject: Re: [PATCH] rust: miscdevice: add registration data to MiscDevice
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260807-miscdevice-data-v1-1-43c4233e0b03@google.com>
 <DKISHUP2OL6U.1NEMCW4S0Z9FR@garyguo.net>
 <CAH5fLggVkEYB0_SXcSGVBgs2hDejSU8P_y-5BvbyNhEvBPY1eQ@mail.gmail.com>
In-Reply-To: <CAH5fLggVkEYB0_SXcSGVBgs2hDejSU8P_y-5BvbyNhEvBPY1eQ@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0188.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB3527:EE_
X-MS-Office365-Filtering-Correlation-Id: 2516d9b7-f90f-4f6c-4a97-08def49b626f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LfC0QwswTYy97ux0socVCRPcdK+iKI9gNypjxMbZDUWqHMyT6aRJWz8ERHwNg9EmvkUjIBF1jr1zilFiBUK9kxODGHaCfbutKSNnGe8T/q9wvIB0LrVarm0AFf1U/gecBbTUyS1iCZIuIh6EllvNoLYzmtkzLfHZJO3mP++WbDmnidg/Z7l85JTy3tlha82Xe+FJpu23EK+ujL8YipVxt7hxRJ8xb+VDIsrqLX9DjmifaQb89mPDkzBBIw3Mb/cZPogw6A2YfalLIPiqkBnFoe2DtdfKI1JV0p3oL7EjkFoEvciwSqRly9w00pktgrfTp9dIJ+JcqUWxti+CNJduqbDypaxi7l/c/iNZadgHq5ZAtN5D6MYBTBVvaIvx68MsoeYOiPYmWZeVRlFiAENeISAuurdTQQCDFH8Y8lyorMQEHBIZrMYAf88vxqb1KM2j+/+8TK0+Mox51L/no7WqQ+/Ri7neVZ1yXjNkkT79+OkY0XMuP1DJQpyBh0NosDiAMYqt6kUP2WRQ4qqVwOG9gnNgiQacf38YekvC9sx9iCq0yOEN5Sb8A8JCyWsfukfPo7E6NQZ+K+kOaPUvOSPQAgU5eJTK5eYNSpMVMcJC3n42MIq9cYT9Yjb82LZwyFIe6DO3Gzbz3B9h73zQ+4meb2tCyW4tfKeAGJ8cDrtOOCA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2IyUG43QXNGQnZ3UHhJam1ZV0dOZytHWGJyVUVSNTVmOHZoZW9uaGpRM2ZI?=
 =?utf-8?B?S0kyRnl0cGlFYWg4dEtRd0VGV2QxanVyTVVNU1IyY3ZOV01MUEgwbU1Ed0Ez?=
 =?utf-8?B?eEhFUU41Yk5yTktEam5FSy9lMStKck9pWVo5MjZ2YjBTSUJnUE02QkYyRHl0?=
 =?utf-8?B?OUlmVnp4REdDOFdEZEZndHJyZjc3dkF5blhaVFB4SCs2ckcxa0ZWMzZvWmYw?=
 =?utf-8?B?bzBrV1ZTYllHUFFZdWVuNnJSM0FwYTBoZXhEbk5KdWxzV1FxZTJWZnBPVG1S?=
 =?utf-8?B?S292cmFwdzc0eWljL0dubVY3WWJ3V2Nhd2hiMEl1cTFpODFHQkI2MU5SQUdM?=
 =?utf-8?B?R05LSEZ1eWtSc0pIMEZ2QnBTRTFzMmpNTXcrU211ZEdVTEJ1SXArZmpwK3Js?=
 =?utf-8?B?aEFsQW1zcU5YaXFzR1Fub3pWOTAvbDFvWW5wQ1lVcjJ0Y0ZSWDh2VnJVRHJI?=
 =?utf-8?B?UmJHZVBkamNHNm51MGpVTi8zTGkzMGM5c3lxVXJUcTlibHE2eTdjcXV0d1kz?=
 =?utf-8?B?ZnZQaHQrbGprb2N4OWhDaW0wallwa2JmaUl1MGY3YTZGMjNVbmJsTUtjRnhk?=
 =?utf-8?B?LzZocEZzSWJWTk51dDZLeTlWcGsway90VndrWnVZWW1UQ2RBWVgrWXdNSFhj?=
 =?utf-8?B?YkkvNGpDZS9xZllXQnRaZ09NTjNOaDBSOHZlNDRGVUNmeGdGRGtZUU9RT0hG?=
 =?utf-8?B?U1RmVk8rV245bHRFUCtzYlZ2QTEreVptRXJySUFUOTF2SEdQZm1DcHpQV3dT?=
 =?utf-8?B?V01wWWpNQkNmaDhxNFBMdmRQdkFmSnpaTnN5R09kVWNGcEpUS1ZNYmlEYjUz?=
 =?utf-8?B?WkdyZ0VzNU9xN0hhNmN4RVRqL1VEUmpTQkwza09EUkxITFBjNnIrZGI5UWZZ?=
 =?utf-8?B?a09CUTQzTTFHWFhvM2FqUlZVbkdJMDVJS3dvKy9MYjB1UEhPNEo3b2dxdU16?=
 =?utf-8?B?cFErYXV1ZklLVThDRzhHYlhsOVorZTFiUlBCMVRrQVBGYm4yNmRZVlh6TmhC?=
 =?utf-8?B?SllqNXc4dnp5YmNPa2NqaUJXVnpocFRqVnJhKytBZ25XYjZMbTZkaDBSM1hP?=
 =?utf-8?B?d2sxWFpyb0pWVkVuYlQ4ZFZQM0QybEE5aTUxZkVZeWNlK1kzcHdFREx4UWY0?=
 =?utf-8?B?dzd4ZmdaV3cyRUhta2I4cU13YjhNNU1BRnprdUxBcUN3RFZFWnZJamM1V3lo?=
 =?utf-8?B?MlExQUl5cnN2bEJqaDdPTzhQdDB5ZGdiNHVkU3ZMd0U3cllIbVZ6Ti9YbDc4?=
 =?utf-8?B?aXV0Yk13NGVGZ0xrbUl5UWZYUGovUFgzV3dtMngySWFveFdvVFdFRit4RE93?=
 =?utf-8?B?Z1liY0F4akpmUFhheEtQQnZRbUFCUkZZUURGanJHVzc4Q2VtL3RwWWdIa3pr?=
 =?utf-8?B?ZHQxcTVtTnYwMG5zWG8ybkZpZys0ZmJjclh1cFRJS2hROEdpRGhCemEvaUd4?=
 =?utf-8?B?akZ5UXhtdnlXN09xSTdkMTlzZUxVbnNFRCtzYWdLUy9RWU15dXllbnlXb0xh?=
 =?utf-8?B?ZEZVQlQ1OEJMTkwrQzEwdzJnQVNjWkExS3UvVlMzMzR4a2ZUVW5zd1dPWC9o?=
 =?utf-8?B?OVBHNENOTG84KzJKZnhiTFZ4MUg5QUdrYU9rbG5DQUhicU9wWHdyNFoxbWlG?=
 =?utf-8?B?N2xUY2prd2NEMkRNd3VTalQzQy81eGtxdldhaFM5YUdQb3h4QXE5QUIwdUxt?=
 =?utf-8?B?anVaRnRvM0pIYzJFUU1aNTBKMUVKS0FQbEIrRlFDRzQyVEtuMDBhdGV4V2tR?=
 =?utf-8?B?TmhYWk9KZVIvN1Y0eEp0WXFlZEFMSWNaS29tM0JUWUQ0ZTNub2g4TlNMSllG?=
 =?utf-8?B?UkIzSFBuMzQ0Z0FYNXROdEREbytEVThSUkdaV2o4SjA2TXpZRmp6OFFqdFdX?=
 =?utf-8?B?RnVxMHYvcDRmMVUxRkpxeDUzSlN5UE8zdlpaVElvQzBPZFNRSHVXL3ExNm10?=
 =?utf-8?B?dFlEeDZqTDV0Lzc0dkoyUHgzSU13UlMvZkR5Y3BMUWQxVXd1aEtqZXBKVU9Z?=
 =?utf-8?B?UWMzVDlsNFdCQ0U4MU5nd2VBM3o0SmdLZmVNZy9RR1didkZ3OStTblNTRTdj?=
 =?utf-8?B?Z1d6cU5CTWdrNTRWZ2hKdThMV1BYRm51K2pZRjFMSVdrVHBFNFNRMHJ5Mmdt?=
 =?utf-8?B?eVhHSDdURldQcnkxSUw4b01LUHpOakxKczcvK3ArVE80TldBbytST2tGbjlM?=
 =?utf-8?B?UEtvMlNKZFNpUnU5TTZzbjRvdTZoSjdLTmRkUWFtcGpNQVVoaklUUTFudldw?=
 =?utf-8?B?UDQ2NldOODVCYUFLL2xqWFZ3TmpqMmhwVjJsWVpydy9HZGYxelJCUUlZY0FH?=
 =?utf-8?Q?toS5k8p5nzBkGK+gjj?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2516d9b7-f90f-4f6c-4a97-08def49b626f
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 15:48:54.2743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8D6CHmjXwu0DQdiWWZQifu9FiiR9q7QaY0HZ4CJlnoeV3BDWM6jcJfQsVFr5Y7ewg/C7nJsK85iDXDBeWzhFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3527

On Fri Aug 7, 2026 at 4:44 PM BST, Alice Ryhl wrote:
> On Fri, Aug 7, 2026 at 4:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>>
>> On Fri Aug 7, 2026 at 3:22 PM BST, Alice Ryhl wrote:
>> >  impl<T: MiscDevice> MiscDeviceRegistration<T> {
>> >      /// Register a misc device.
>> > -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Er=
ror> {
>> > +    pub fn register(
>> > +        opts: MiscDeviceOptions,
>> > +        data: impl PinInit<T::RegistrationData, Error>,
>>
>> We can just skip the `RegistrationData` and use `T`?
>
> `T` is the type of the data stored per-fd. We do not separate types
> for those two concepts.

This is getting backwards though, and won't work when we need to introduce
lifetimes.

Per-fd data needs to be able to reference whatever lifetime is available on
per-reg data, so it should be assoc type of the per-reg data type. The way
around you current have causes `T::RegistrationData` to be able to referenc=
e
lifetimes on `T` which is not okay and would only work with `'static` data.

Best,
Gary

>
> Alice


