Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795809910;
	b=saZPvwbqb3SNZUIwtWata1JPkK5jlkpBaJeYuszw0ISge9xKVdMwmw47gL+GLTVscz4R
	 CDRK53s2/1E8FWQVbAEw+bbLL3YgM+AEPxL2WKQ6j1nqHO5RvkbTyl2INl7JwzVfurlTx
	 Oqum/ZCdgoK3c7ZM4O9SvpkCyGo3UkyOPxiN0hFprtcSrkMORwlww1LvJoMARwn/J/m9k
	 OT9jtyHiUE8by3/+GZGHDgNtz4RfDB49jGGp24D5k8NT+kP4q7GJ3rPuO3BjoYSLjd4E4
	 /ZwGu6Y7egM+c2C12FZNSlsdf8E8th7O55OWZKckbczyGH8M0kfrUwj3vQOtdvYcohg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809910;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lAZQFmbKg3JPDnaeTVvIm9esLOmvxQcc7FTS1v/Rbz8=;
	b=ChCX9IteE0E3Bc9QZXlf3sz0jAkv3CdP8Q/YqVUUHmHI2MBu4cpainBhfvER5MzIrQFS
	 OkfDyxfmRMnGjeSAQ7DURHjcHGT1m83+bcmkmbCCbB7Hxhinon9xZBFw4rco5NYH+oZgC
	 OcEK+HdG61NjUo0LrwpZtBUSRDFaiXdsIjikYPgi4lnoUbm5pxVO13dVe7VsBE09rKuAT
	 kMZrXduPCcaMQwoQcA/zxWBj7rJPIPP69mGpLB6YiApPYvKck31xzTq3LicKHSYz6j4L2
	 1D5q/ouSKVx7onmm6T+ysc8h+iPInq9RzNYz7+qyy8mUzZ8hnRnU246SUgJWFtIHODw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=V3JwjyD5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.123
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020123.outbound.protection.outlook.com [52.101.196.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5153606A31C;
	Fri, 27 Nov 2026 20:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5153606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=V3JwjyD5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJUlpbIdb0jJfyBzWih3Gu+2/znspl6hGCFXctLmqLrDS/aUvudqjb7ooIJAqxr5zeHlzSogxoxWQGAV3DZQizVcRHzNa0hPUvu5cnctTZC6QKXpu8cT5PKfyhL6HSq/8ZjnWoFhN9pc05Ngog2FcSnZr51qQZe7sCmwEdnNXkOe8jifp9ebch2pCEZX5iBs+AUcAviVB7j9AYGkxr+cTW3aZRWqnZs857Yeg4bZMr3jLtpEIbBnjDSUCTUWY1FUkmniT9H3xjRYRhGOV/p3k8LkYmfHlfr8KUrqUMJnZ8evF7A43y7pNruqM4B2gSKvqc+4X3E8qimuAz6SQSJD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAZQFmbKg3JPDnaeTVvIm9esLOmvxQcc7FTS1v/Rbz8=;
 b=RwlehLPuGavZcybAUIy/WZKF4lzGz2pJMZH2zVpFetwOJtjqeP6AisHyHGYX5D2q+tljL6GrhqIupvxzMlBcUZL/8zhR3e5T2H5igbelIZIz0E85t4pmfMZY0A4W/oVRYw7NNm+QcstEIHlxEm+sjLsaRovd5KEyHw31Q7GoTeM39knziQSfalpd0jTX3LY74gIFb96xSuyVHAMMwcsZ2oXAjf3lT5Tdl0g0W8zFo2GjoNXkSn9bpzbBy/XlOKls8eU8ZIri0qdyEkwkH0arLZQ4YLNEAuZAnUnmvYEuB98Lknjw7i+WG83AIryEsntcs33pNLHy0xNqZqvLoBpijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAZQFmbKg3JPDnaeTVvIm9esLOmvxQcc7FTS1v/Rbz8=;
 b=V3JwjyD5TkM+Q9HDw//nggR01Q9QzwsZwJwrDQFb5Bd19YRjD7TmV1n7ZIzV2T609OHvI0fTZmJtL0dsGFvWXJf7r7C/2yGi2GD2A1dG8toNkaBz4t9QJKMdGOzm+03KbhsSup9O81N1Cmj7nTuxjWsiypFlJ32lQUWFW85mahs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO0P265MB6054.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:289::10)
 by LO4P265MB6432.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.11; Fri, 27 Nov
 2026 20:05:06 +0000
Received: from LO0P265MB6054.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ebd6:df88:f3f2:ddb1]) by LO0P265MB6054.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ebd6:df88:f3f2:ddb1%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 20:05:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 20:05:04 +0000
Message-Id: <DN69HD9F475C.2WM5C5Z573NO2@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: bitfield: add conversions to Bounded of matching
 width
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Yury Norov" <yury.norov@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Tamir Duberstein" <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20261127-bitfield-conversions-v1-1-2f0b127c0857@nvidia.com>
In-Reply-To: <20261127-bitfield-conversions-v1-1-2f0b127c0857@nvidia.com>
X-ClientProxiedBy: LO4P265CA0128.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::16) To LO0P265MB6054.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:289::10)
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
X-MS-TrafficTypeDiagnostic: LO0P265MB6054:EE_|LO4P265MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0a099f-36ac-48e5-cabd-08df4cc1bab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|376014|7416014|261009223027099003|22082099003|18002099003|921020|10067099003|56012099006|261102123227099003|261026121527099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	xaj3cRFUAFhTYd5GebIE/Nn1CIKMnIrqyA7J7DS+4EqV1Ay8L+vfZdL6QFRbwncPEEHNYyZVSbnw1npIH874oX7ZGSO6l+cGCZ804B7lb/KBKHJJc+w6D/vQatDGyub0ceNpk1ZKGKi1uZfRzUpBxA75Wl8Sbvm6Y1N53IhwYWqV/ABaYlwAxmmwv2Eu3pkd9Qo3fpHum9E5E989JoUXCqu7Q8l3Qb6v1TppcvRFC9q5cYst9+DeDnJcx+/hmvLKKeTPsIUEblvHOD1gU5C0QEilTj2KgkR35K53ROykf6nG87mesSkCp9e8jShTZ+An0D4AIKKvtOpUHjkRdFyMHh3EOp0UoYzYBrvRhbsjLLRBM4QGOsifhnu1HmlSy8gMKbe9vml97CnS5kqcfCMzPedHRFP1nHlRupG8Eg4s5+Prz6aUXoX9wiYpKvsTyop92rJ2jDmzuV+7GIyX+CqUbFhpC56ALHo80zeK4CoYq5g0zvzqm0y3BKyutq5dNs6Kyj+eipZCciL6q5XKVTp5Vf1fdQqBtJGkoR3t262NNu0y/WtrJcGMIZ7ASz9ddcmZxaBe4EGOxmqhPN1lzLGzEENKFZ5Z6KzclPcREAh6Ed2VUEAKfqMKzBWIICf0FRzYVqGCG+Hy71qQVGNHIGWdkfKX/g7VvJLK0RC1N9joaoIgm1Pf1Nvy7ZAXY+KSKC2G45PBPXv6z/mrL51BS0bKVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P265MB6054.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(376014)(7416014)(261009223027099003)(22082099003)(18002099003)(921020)(10067099003)(56012099006)(261102123227099003)(261026121527099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmRwV1lCbVNIZjg2aGs0YTVCeFh2YkZvZXcxdG5iT2U3V0ZaWkZvUzhxRTVG?=
 =?utf-8?B?QlRmMDFPNlpBRUJMOElCZE4rV0NWaWtueWJjaXo0Qzh1Ukg3OEtqVVIyQmtW?=
 =?utf-8?B?czZ4OEFXQW9yNkxSVXV2RE10dS9YZ3RDM3NBUjg0VE12R2UwVUE4L0VIQVV3?=
 =?utf-8?B?aXRpeDN5REdySFhyOUw4eDU1ckc0UytRb1FZZ1FZUVlCdVJIcVdJOWlKZkM1?=
 =?utf-8?B?NGh4TWhJVmk4bHNGMUFEVEdPNkVmVUt4Z1pORHdHMDhoSTZmVENoaDdmbjBk?=
 =?utf-8?B?ZGZhSE1VVTh1MTRUVzFNcmp6M2tVaDhBRHdDSG1DcW0xanBvNEJUM1NCMmEr?=
 =?utf-8?B?cFZZNnVUSVBTdXVMK2hUZzJYNDU1MCt0cVpxQjRXbWVvL1hpckllWlloMGRK?=
 =?utf-8?B?aEw4K3NhZ0VLNzB6MGRpejJhL2lXZzdsWVFubFV1dkRkeEt2R0xRWnRmOGtp?=
 =?utf-8?B?dXNjRTFVS1V4Q0dZbXVJR2JWcisvMDAyYlZ2VnpmTWVpbGttVG9Ob0V5d3Bs?=
 =?utf-8?B?a000QkFMSWQ3ejQyRHV2YXBtazVWQmZsUklWSitTWWJFVnVwRlFYOWxkVjZt?=
 =?utf-8?B?bG1nRGZnZFk2a3RNYzNFekpIL1E5VlJBZk1hWlpMYVZWaFlBVnBUbDYrckVM?=
 =?utf-8?B?N3NkektzMEdzNURoVUh4Z0xCSFpVclJUUUdrbStXMVp5djJEMFFhVG1NbS9w?=
 =?utf-8?B?RUU4ZDgxNTQ4cy9qVkFwa1BJZkl3U3NCWVYyZC9xVzhhS3RGV1NPeFFNWEZK?=
 =?utf-8?B?NXRydnF3NU9wSlM4TzRKcENDMUd5V1hZNWdzdHF5QTNPbGtSc0ZQeFRTYWQw?=
 =?utf-8?B?SHoyb0hYaGwzWHo3OS9iYTVmQ3B1b2Y5ZXZuNDF6N2V6Z0hQY0NET0QxUkxm?=
 =?utf-8?B?VnlGR0Q5aUZjM1lSTGs0dHFoN0FXZHNKQlMzb1J5MWF5cXBKa0pmRWQydjRG?=
 =?utf-8?B?YVMreXpydTU4RCtxUzdpZlAwREZPd0lkWWZ4SjRyQU1LMjc4dm9VejZIUld2?=
 =?utf-8?B?d2VBbWxFaGNaTnd2OVpNTmE5dGQzQzA2eE5WVmhRNDkvWkQ4dEhPMlhmd0pO?=
 =?utf-8?B?UFVvNHN0NHlBakFmOVVLazlUZjJIQ0NJakVUbUVUNUViMERqOS9TQUptZ2NY?=
 =?utf-8?B?Zzl6emtNUjhJWDRJeWRDZzN1Njg2V1VMMUtNMlE4emNEVmFrZmgwdkt1UVB0?=
 =?utf-8?B?NVlzRWtjMWtWRFFXbm1tY3ZXbzMwbENOOTJhd2p3ektGQStidXFtYUhBeGlp?=
 =?utf-8?B?VDFFemdQbzRkY0VTU09kU0ZCN3NtWmpHT0lCbXpiNVJpR1JRNVBTT2VMeGZ2?=
 =?utf-8?B?YzladlJIS1RQQ3llR1J1QmdMWnYwcVFvOTkyNjB0ODV3dGk5blNoc0pXWnU2?=
 =?utf-8?B?NkpuWmRsUmFkTjNsR2hRM04vV21kKzlXRHNndUZWeTNadHBSektsRVFYUjZC?=
 =?utf-8?B?b2tpZUV4eFNyRjlNRm1uL2xSRFpCS3k4bG9Bd3ltbkpPZ0c3cE5DaXovamhu?=
 =?utf-8?B?YisrRjhXK1cwSGhTaUZSUHZlTTN5T1pTMHFxSEY0NjZieFM4YWhWTHkyaEVO?=
 =?utf-8?B?bmJYSjNUalcwalhtTWFudUNkTVlmeHFFNHA1OUtsNkx3eVFMRkwrd0p0Um53?=
 =?utf-8?B?cXJJdzEwKzhuaFBjY083WGs5eWx0cGd1aVJCZDhOSGZkVjVTNzJSbHdveCts?=
 =?utf-8?B?MVMwQWlPdU5MMXd1MmlJRll1aUR6ajN1WXo5Nm5DSnFQQk9FWlVleG1JV2x0?=
 =?utf-8?B?T1A2bFpUK2EzRXF0aHNWc3dCSHJhcThsQStFQXV1VE5ocXNTVi8rZE9yMFJw?=
 =?utf-8?B?T25pbG1lbVRvVmN0Q2d0ZTliRW5sOE0zYllIcUhPNTlseDRwK3RCdk9MYzJU?=
 =?utf-8?B?VEN1SEJWMW1JZlNGNFpmZnpLWVFEVXFIc3FFRHQvQWUxSGNkdnh1WmJHNDdw?=
 =?utf-8?B?VFFHaEc2cGo2NUtxamhuTGRPRGVKSTcyR3U0OVM4ZDJxWVIxSlNzUEdGeXU5?=
 =?utf-8?B?dzB4QVhmQmErbU9vTGVVL3B0c2JvU1JzajlWRXJLa0RyYS8xNDNmMVl5VUVz?=
 =?utf-8?B?NEFSVXh1VGJ1YzJGNFdmdHhhR0lScWVwcUpBOXJvV2ZuMmVQdkZQNmphQU1h?=
 =?utf-8?B?VlpOQVhNYjRPZ25QdWVKQkdZUUFMNGd4MlYrOUhtYzhCOUpITkNMcG5Bck1m?=
 =?utf-8?B?b0c2QkxSdTRhNDU3alZpYmJEWFBaaUNreXoySXRVaCs4MG42Zjd5K1lVcTVP?=
 =?utf-8?B?OE5YOXNMV1h0MkJmSDNOZjdXUE1DWjFjc3VxaUNJbEpsRnN1S2NVSjd5Kzdj?=
 =?utf-8?B?K0NWbUpvcDFqK29rWk9YLzJpWHNidms5anVmSjJtcnVuNzU1Z1MvUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0a099f-36ac-48e5-cabd-08df4cc1bab2
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB6054.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 20:05:05.6405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xj3lB2CFHDYZPkYDu0nAN9wlrUzwXtTcmuAv3HmR7uj3v1gCmDLj6rYnMjqaSdaWUv0reFkmb1/RMyKxY31eRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6432

On Fri Nov 27, 2026 at 12:05 PM GMT, Alexandre Courbot wrote:
> `From`/`Into` implementations already exist between a bitfield type and
> its storage type, but these are not enough to support nested bitfields,
> since every field is a `Bounded`. This resulted in some ad-hoc
> implementations to enable this kind of declaration:
>=20
>     bitfield! {
>         pub struct Version(u8) {
>             7:4 major;
>             3:0 minor;
>         }
>     }
>=20
>     bitfield! {
>         pub struct Id(u16) {
>             15:8 vendor;
>             7:0 version =3D> Version;
>         }
>     }
>=20
> Generate these conversions automatically through the `bitfield!` macro,
> as these tend to be useful.
>=20
> Tyr had such ad-hoc implementations, so remove them to avoid conflicts.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/drm/tyr/regs.rs | 30 +++++------------
>  rust/kernel/bitfield.rs     | 82 +++++++++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 89 insertions(+), 23 deletions(-)

