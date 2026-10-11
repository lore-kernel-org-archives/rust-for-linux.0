Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020087.outbound.protection.outlook.com [52.101.195.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7014D374186;
	Sun, 11 Oct 2026 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791715084; cv=fail; b=fxxYE/njIZSqfaZw5bs+VmunLTakqKAqFOSaDsOsgapahP3CIh5nHkkjEh4vz/N5kn9W2ifwUj5ZTNzav3oU7GXBESyulWIgMT5HNoJ50GGRxuvZudnZKJP023wDrw+3VQhiTxR/gZwFOf0iM1TRKStXawR4+Lh/aV0Pn2+7AgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791715084; c=relaxed/simple;
	bh=7+Is/dxPqlYIsdTG0/8dzjRBClzKGMH6DGYbOauV0ck=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WcC0iRxM05ximd2ygBke+DExMVn8mOazj1C09dilzNgOazXwi9s5W1k0SDamjJEYWbmlacFcAoJ/OZjUaCe4n1tASJNwPGAeRlXZkPGnIOgRVSNRDdDE9LPX8cZ3zo8E6Hd4ODaCqxfRDo/3pusFruoSQpl//dZjHTzV+rtAIRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=G5P6+OVB; arc=fail smtp.client-ip=52.101.195.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="G5P6+OVB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kevvn/8nlMr8bKMwfpGFtFxmLy0ybpkuTFJYfSqcIDVO9JuAhlzxg+6/OjHhzr09U6aFbuINORT1ZhFYvGpe9Ud9jnfhNVCac1pdokAaBjndwzvG0F3GRut9GAnDsGO+kwqB0Ti5X19tMgeXsFkYjYiYwKyJQF/5tT0PRRoEUez+qtntYuacmmzv8MCa0hSR0ai6b+XA4eajLWNl0JYuObvCq3oy5j+rWGiaafj3ZEzn/se+1MUf5GvA68uS2UC3X9cvcD737L+qYmz02vII8HC520OqPoJVpBOgLGXnPwIUURsrjtUe7PoEYs2+bCACHUDwmXTLC+0QGOvnUlF4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezKj3U3/MEXsoTwXHy6rgSQ84LUXf7fLoucMAjzXXXk=;
 b=iQS67A1OYdXg+ODVouSwEySSMoJoBn6XI3IcFQzYHOeLS475QPIjAHBerwt6abdw+9dDTAc+f4V5WCATZmCxsT5OiOkvdIbRo5cXOkHufNRArh+QWzMZoRoSyvxJVVjXfg1DR6dFrAzK6dtyYBMD2VZJYMOYs2voNyJGot1Kyf+acQWq2YAGDR+q86ZeKT9LSgNJRfF40gCnVddrz7fzkmKl5BA5TkEZkCGdd89aNYhD/43rw/XcmUpiRDmHLMbN46lY395x6QTgUHo6FV0iZxhYoSt92cnpV/MJ2jHM7aOIb5pHs/q4Wd12hqw83mylHHq/qr/LDWn2yCjqUAoa7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezKj3U3/MEXsoTwXHy6rgSQ84LUXf7fLoucMAjzXXXk=;
 b=G5P6+OVBAJTFVtNzvy4uEG4c4BnVTMVHsBbZSsInBsKgprUzrgo2jVMJsJzD7ozcR3ud5JjLTUoieOuzVJulcnXMFqsRBrWyNeKZD6l8qrfiRhGmphNqTqiQ98askn0vsn7y/vXHvlnRVDbJzmAVPeRcnKOnPPH4ZuRCyyfPxAw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOVP265MB8692.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 10:37:57 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 10:37:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Oct 2026 11:37:57 +0100
Message-Id: <DM1XZJDB2TI2.ZH49FBYJ98W1@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 00/20] rust: pin-init: create self references safely
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
X-ClientProxiedBy: LO0P265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::14) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOVP265MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: cec5a141-42a1-4e97-0e31-08df2783b710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|10070799003|366016|23010399003|921020|56012099006|261009223027099003|10067099003|22082099003|11062099010|18002099003|6133799003|7136999003;
X-Microsoft-Antispam-Message-Info:
	tbWSiRquLeJOyWXQm0KigA1L3ZCTPWzEl4Cs2rrMeHQzx9UtAo7yj3GoJkOcSrVoBTErLngVgftnAiUte/H3TKhQnpX6+8CW0tPUCSqEJqOkZM4j0eFfhTLnQnZhyDVq16ZLXFRHfV7FRsV/soYIPHW7jocwrmSWA8Y01lIgXTsfhTaUAx3UiHTacp0qtv1vqwXVIhTTGlxvMUqKQQeWg2+j2nlYyIOYLtvItQDiBO0JgMkTbSfZgLl15VhRETTQKGgp8LRL/+57pHz7qdIwR8MGLYfI8XB2GMXnluoVtcxNx9KiT2NiF/oGrIIIULQ+2YRdo5gCEKdUeh0aZvyIzXISv3vTs0YckRaX0vwi/0MEwsZvOl8CCoPIvBURM+kESBymQ901bAvuV67cTmTnic9svCtT2FRNBBBIN3ZLQ7c07Bp79uBgt4Bx1njZkwZ8CNWYLZG657XVqGRdHkdzcIdw2AaBeKcs/3rUNGkICpBLaRkTstftgl+7jORY3WPmigopNHvyI9z9qXxpbjdYX9Nctz2wvkoqtlNiaqTU4UqNrcj+myVlkRR8yGhICxHpb8DagdZvK4V5e97So3CNWdrup0EVBnZbw/Y0/k/ccEE7aRJ+/UvQr2iOWUS61OsCyOAYUCQAlranrMiKjJUGGn03grNpWF+Qjs4Z79pSKsNZqxfCuLfz7gxTv1UyT7FfjzU8NGUEkMBew6gvSU5kzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(10070799003)(366016)(23010399003)(921020)(56012099006)(261009223027099003)(10067099003)(22082099003)(11062099010)(18002099003)(6133799003)(7136999003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elYvTlZkM09oVmQwMnpVNEhsc3lMR0pmTEVmWmlkbmdNUFZlRHY4SGpqU3pQ?=
 =?utf-8?B?OUo0TG0yeDA0ejN1SWFrRXpuQlhUWE9teXNUcktQdlpKTGl4ZzdpUFVQWG9P?=
 =?utf-8?B?SmZUYXVNRU5Fa1dKSGlFRG5ZaytTUlNLK2hqL1k2YTNLSVJGN2ZTem9HbFdG?=
 =?utf-8?B?cFo1bXI4T1JoS3JBYTl5VmpmSDNqdmJVeFNYeDB2aHVQUDFNWC9ncURhbzVC?=
 =?utf-8?B?TTYxK1lmbUd1eE9CT0xHajZZVHV0ZzlNODNIUUxtN2ttR0Njc1crU0JSMDFv?=
 =?utf-8?B?aFFsakRPVWFDVW1IVzVrY0dLNEk1Ry9GOWJXQmxzVFJxdHFLVm9sVmljdGdF?=
 =?utf-8?B?N2ZoQ1ptLzJ4Zjg1K1NzcVduNC9XdHNtREJyd0dHaGVyL3l3Q3FnbmhNRk9o?=
 =?utf-8?B?VnlsS1RSMFltU0xhb0JOUU1Pa0dGNk5qeFpUaU9SbWJCcTBQQXlWL0NHc29D?=
 =?utf-8?B?TGQ2T01IU3Q5bzlGNVFMaUcrcUhDQzFLcEJuTlUvTnlnVGlNcEM0L0RYZTd5?=
 =?utf-8?B?Y0xvdmVoM09JV0R5YjJFOTYxM2tRbEM2RllaYkJkamdJazBMTFM2RHdMRzBF?=
 =?utf-8?B?eHBQUUo4blV0dVAzUnhSR0RsSm5BbWJORHdMdXVQSWVxOWk3aDVVWXBtRVFC?=
 =?utf-8?B?ZzFpZzNJZndKQnNlWGQ4RVVlTHJlQXRXUUkwd1BDV3FCd0g2ZGhOeWVFeGlJ?=
 =?utf-8?B?QVhIVE5KQ1F4a0JiNlhRdWw5K0pmbFplNFcxS25aU2dSTDFBdnB6MExSUWhF?=
 =?utf-8?B?MEhXUEtBVmNFUmtNVDJEa0Q0Sm9kQnhhL2tHNis3Y2E5NWRtbStwZGIyQy9w?=
 =?utf-8?B?Q0s3alFTQi91NkY4MnlKUWFkV0gyV1F6RW1ZWHVwaFdGWktOSU85ZkN5Mlor?=
 =?utf-8?B?V0wyOUpsL1c5MVVjaEtBMHFmL2pIbFduQWdhSnRSUU1ZVVhlb3JpM1FoM1Nw?=
 =?utf-8?B?bHVWTE1DZ0h5VndVZ3NKc1VqOTNHdmVKd0c1QmdkMmRKcnl0eFNUUFRib25s?=
 =?utf-8?B?aGxoUGxlQ20zNnNVZHNHa1RZRXpoelVTYUxpbFRRZkU3NE0rdHNRRGR3VXJQ?=
 =?utf-8?B?dm5QZXVDT2Mxd3dCWDZVdXFrQ1NUT0psK1djVVRzdS9ObER3SHBYQm1jYUN6?=
 =?utf-8?B?QlBRNGk4NElOUitvd1hsRHN1NjBNK3QyQkE5KzhRSUtFRERKSGUyNnNVSS9v?=
 =?utf-8?B?QkxlYU0yTXhqb3g2ZEF2QTR6WFp0R0hSbUhLL1hIUFdISjJQbzRrMGhoWGJ0?=
 =?utf-8?B?ajJUenpyaGVhQ1BzbHVYWkV6Nkc4YWRxOC9NdTU3RnEzQ1h5UXJMLzY0dk5I?=
 =?utf-8?B?eDA2UXh0dDVKOUFsT004NXVkM3Jwb2VNcEJUbFU4cVgyUW1yYXk4UWpCYWdn?=
 =?utf-8?B?UE1uc09jZHB0TEJxdnVwYVA1NllnN2Y1ekpNVW4rRkk1UGo4a0JhQmEzTW44?=
 =?utf-8?B?cEhvS2lUOVFDWXZDRlp1a2N1Wk44d2ZBaUNhZTFOQzM1aTlJdzJWZ0dsamZv?=
 =?utf-8?B?eDhWejFsTWpaUEtzTnNPaklwdVJ2UXhxYUEvWVlaVXptNjk2MDFjY3NxclpF?=
 =?utf-8?B?M3RYeDRsUmZQaW1Tc1Q0aWFqVlB1UmVjMGxUd1RDeFg2b09qS2k1VnZGUURY?=
 =?utf-8?B?QXd0bnI5NHNPN25kK2Rwb1lIOVlSVUQ4QXd2YmRFSkxTUTNvSTlnWExKck5h?=
 =?utf-8?B?aktIYW8wT0FOWGkyVGNFd2w2ajVZd3FLZTdYM1JWOWdNaGRxdEVISzZNaEZ1?=
 =?utf-8?B?bG5TUkF2dHF6Q3kwU0JKM0tRRFgrbFg1d3ZZSXVZTXZBWDJrMGtnZTh3YUd0?=
 =?utf-8?B?ODV5cGYvRmtkMGMzekZrZmR2WlNkV3lYS1l3QnFITHQ2T1ZBaHRwaFBGamVn?=
 =?utf-8?B?aWNyclhYaHcxai80akN4NFQ3ck12NnhPSU1uMkhjWWozb0lUbVFUczJ4M25G?=
 =?utf-8?B?dnFEUWlBbE5nUm5FN24ySy8xTzg2WnVQQ1BFdDhDKzVlRmxhYTFSQU1uQmpD?=
 =?utf-8?B?YWprMTNLQnZKalJhZ3B0bWlvbkRvWkRDNVpWUDdkVFV2c2U5S1AvQmkrY1BN?=
 =?utf-8?B?UENXckxOS0FwNTlEeFFaVzVhTjJxT2lVM09PMzFJV0xoL0t5T0xwWUkzc0pI?=
 =?utf-8?B?UUM4TTFWdUhpZHRCdkRjSWdJdmduYWRlcnNnSDA1bDhWRFp4Mm1JeHR1bnk2?=
 =?utf-8?B?MWU4SWV3S1ZjNjhyQ1V4YVZIZ3RiRWtFeVFTQ2dhWU16SEFFWVhTd2M3MUp3?=
 =?utf-8?B?cTN4UE1jV0ZDblhRQjJtUWwyRVdmSWhNRk9hdzJ2NXBMZ0dtN20wVEhBRW9L?=
 =?utf-8?B?azdJRlVWQzB0ZVg3SElHYVlFa3BiMGxlT00zWVhKZ3AxclpEdlp2YTdjd1B3?=
 =?utf-8?Q?yeKfBZGrLOa24wbyax7K1K/i4japV2hHGRUWk?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cec5a141-42a1-4e97-0e31-08df2783b710
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 10:37:57.6300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hg+f3MtWtMbjTOXH9axIquzgRWTS44mfSlCV2jKw55DzPdAT7MlRiIAUqflc3+IEbKFFJcQJTC4XyeZGH2v8rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP265MB8692

On Thu Oct 8, 2026 at 8:24 PM BST, Gary Guo wrote:
> Gary Guo (20):
>       kbuild: rust: allow `clippy::comparison_chain` globally
>       rust: pin-init: internal: pin_data: infer self-referential struct
>       rust: pin-init: internal: pin_data: rewrite fields that borrow othe=
rs
>       rust: pin-init: internal: pin_data: pin borrowed fields with wrappe=
r
>       rust: pin-init: internal: pin_data: teach drop check about generics=
 that cannot dangle
>       rust: pin-init: internal: pin_data: self-referential drop order che=
cks
>       rust: pin-init: internal: pin_data: check covariance of self-refere=
ntial fields
>       rust: pin-init: internal: pin_data: implement initialization of bor=
rowed structs
>       rust: pin-init: internal: pin_data: project self-referential fields
>       rust: pin-init: internal: pin_data: add `with_project` method
>       rust: pin-init: internal: pin_data: enable self-referential support
>       rust: pin-init: internal: pin_data: allow lifetime to be shortened =
per field drop order
>       rust: pin-init: internal: pin_data: parse explicit `#[borrowed]` an=
notation
>       rust: pin-init: internal: pin_data: support mutable borrows
>       rust: pin-init: internal: pin_data: parse explicit `#[uses]` annota=
tion
>       rust: pin-init: internal: pin_data: make field lifetime invariance =
imply type invariance
>       rust: pin-init: internal: pin_data: complete invariant borrow suppo=
rt
>       rust: pin-init: internal: pin_data: perform AST lifetime replacemen=
t if possible
>       rust: pin-init: internal: pin_data: support shared projection
>       rust: pin-init: internal: pin_data: support existential lifetimes

Applied to pin-init-next. Thanks all!

Best,
Gary

>
>  Makefile                               |    2 +
>  rust/pin-init/examples/selfref.rs      |   60 ++
>  rust/pin-init/internal/src/init.rs     |   42 +-
>  rust/pin-init/internal/src/pin_data.rs | 1563 ++++++++++++++++++++++++++=
+++++-
>  rust/pin-init/internal/src/util.rs     |  269 +++++-
>  rust/pin-init/src/__internal.rs        |  357 +++++++-
>  rust/pin-init/src/lib.rs               |    1 +
>  7 files changed, 2246 insertions(+), 48 deletions(-)

