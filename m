Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022132.outbound.protection.outlook.com [52.101.101.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4312C4E3246;
	Fri, 18 Sep 2026 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732412; cv=fail; b=EAvgqaD+NlMLz/H/5UhprVLBzKLdTe3cpll/iuX15RxMI89w6tEd8I/467Mr2sKakLo4TxinAfkxEEb0JudX0ABDMbyWjfxNAIEQP63EH+OEaZDf48wMCcjunsyb9olIix0WcE0u1LonZ3fCShiHn+juxaVAn4/mat7n/mbUBnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732412; c=relaxed/simple;
	bh=QxkxMQIX0bpPLQbqDNsSMiis2CqHEIBwRsLXVNe19SA=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=VBhqQWDsSq797tBWiuHLEAMnN+COPKJqWGBq8LwsYb/1XUQPkYKPF471ZiF0HLMlsHYdBfJJHpyv1wa/3woa7Kwl9IEEED3EUy5sV5UIIX6IaxoT17nVwhMfZ6FDhXUkQVfmJLTbx2NbJM3pivdke3R0d6CIATuiYhwcwKT68fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=oBDd8AKW; arc=fail smtp.client-ip=52.101.101.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="oBDd8AKW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFYB7kHwKbGtew3AhpQ0SFGANsHkjbK1/qB/CqIEc1hr0B6J7/t8SbdXCUVkoNlD5uwQyozx6FAY9LiZh9vSo2kX3S70UiEme3fUv2kwZEqE8UXQUrJqLLo1Ztpon0kKgr69Mfe71PD1JNo7yTeoWwOAUhryJ1+/I3ReuBziSGmkgORvgagKgDeHDKjCylVC95jba+XC1CpG2EPg9WH5zZSukNWiel/XdYzeuPve5lnwAMS/NP9wkLJmVmMcecn86aEPian+P3qVAxVuu6yWaSSQxEsqZwLaZ2paRBAxjli0mnfNAc1YLWvmUYcPYKknbFa0DH9A1GaW0zKicLV8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0CUCtSW+QbK+yzrdswguT+UrWcGz68jZFbpOIDvtRE=;
 b=gP9+zIqAZtMgB6aY1Ffz1ZObK4kp1jrUjOZ17WZC9tMxYT1xP/phJRzPnQSVqUr2utIwcNEARUGJ2ckb6ya5oainnHmSBU5NkSMbGhogvu82QKBA6gskRB0+iyw6mMc0ZGNkW7VAJbN6Wh3HIg3zQ2gXHnsDcWV2SSYr979GIbfH44m7uSKumMEhyRK/cz2+Jr5vOYVJmVW3EUjqi5pouN8nlwbZTPIcc8k5cpS2xz44C5lNF9dHtuDbCXwp/jxWrDLF++kht5/RTWebpKm/VuyN9WN48xoiEiu6spFFM394qJI/FvpIFe8gDEbvoy97qtukUJXT32fWOVE827hFqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0CUCtSW+QbK+yzrdswguT+UrWcGz68jZFbpOIDvtRE=;
 b=oBDd8AKWcNNs+1hHD+WT2EwRVwyM7a+jtWOErFpno7ypCgn+KIq3OlOtqnw+4CQazIV11qaMOkG+cgadEOne5dhQWUepCAgVnXxV91Pbo9k9gb7dvzErMlBDgjZGMV65ajus+uU2Ny2AM0wisevpT+5C6AfUAovAhuc6qPKgVw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB7595.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:204::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 11:53:25 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 11:53:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 12:53:21 +0100
Message-Id: <DLIF6QOTMWNI.15E2WHG0VI4MP@garyguo.net>
Subject: Re: [PATCH 0/3] rust: pin-init: provide better span for diagnostics
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260916-dev-hygiene-v1-0-dfb6ae2588ba@garyguo.net>
In-Reply-To: <20260916-dev-hygiene-v1-0-dfb6ae2588ba@garyguo.net>
X-ClientProxiedBy: DUZP191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::27) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d44439-b6e6-4495-0517-08df157b7273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|921020|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZTSBnu4r7CnznSOfwsF4e1w5svVEP7UfhkqFB3TwaIJq/4ESKyxKhLA/U5p/7oIA9j6blMG5tihsW7wzhy7nhSX6sb2OOStOEDyL0fI/EtgMEE9Z06v3rZI+sGH9TfW3I83tcafulpR0TSuhbDuirEYZqRClMP15ws2eIO6gakTJS3zMBcXmBSzy/GbyqRXlCS/1iTFESgkGwbyl2a6qbmaLI/5GzORemWPms4g782A26jYgX9kitvJoyuPyYYuyqTd9xSamxAlvxAoIu9jQorM41NZqgdrxszBfUzKjCbzbqhP+F1QL/fGprqC9DX4VrHr68v/fCuULZZ3YfoMm343PKiUV5TStEa1dP7g0AA0ILQuWC3J0BEhmxz0qwjF1Uxxzbazw8293pVrYWlCt9JCm0opVJDFut4G2DjwkPzN0SVOJ5F298oxIvqHSTiKVm/uIBDQleXpHriWPwn1qtOZyT+g3l9l2xdTLd8gobVfl9f+nH5PPe+JuCUsz0GKk7MYRGeg1ydMPRdp6EuWmEEuS4Z3tIPgcFLeJP/WR/0bSdyCZlN/3zJ2WwOmMmSjjXFx5J7hYVGH79YaEqqV7rsKsk2/GL51Qi9gnhzSoc11ZkRu6BEo0bRmA7iC+wOJMR4lEKe68qHBwcwKxOJhq0DEVcBQCkoTxXuCElyRbobmWPjgTpifGeYzzoWVOqR5yqXEDTbqqLahjqMAiCr+FXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(921020)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHZMbTN4S0dibDRRV1NIempDMWZOMkRkWWlxTURRbmtxeWpsSzg0L0h6YkVQ?=
 =?utf-8?B?OGU5aktVYTVTZ2tGT0l4WWNGaSs2STJKd0JqalZaaGtVU0hPMlVQSFhzeUtT?=
 =?utf-8?B?czM2ZEVYeGRUTmtTM3RCdVgxeWlZNnpBM1Uza2I2cUpQUXg0a0FEL3RRNHZU?=
 =?utf-8?B?aC93ZkpRK1hYRHBmcUNFMGg3OGNUeE1ValV6KzlpWFd3TS9YMnpDRDJPY3JD?=
 =?utf-8?B?OTFWU3pRUzcwUksvUHphY0tHWnUwZVR6d24vV2Jpc1dzaWF0dTNqMDVyV3Vo?=
 =?utf-8?B?QUh2ekNTeVFGY29nM0dmcDR5SFNka2N3SzFEbGNGWk4zS01NMzMzWTltN2s5?=
 =?utf-8?B?bGluUU1Gb09NbDhqcEwwejlORkQ1ejhEOFJINEtpME14cEloN0xsMlY5RmVh?=
 =?utf-8?B?ZW54bzI5djF6R2RNcXVPa0tkblUwL0c4KzNaSkpxWkVwM08zUzFaSWw2SXB5?=
 =?utf-8?B?NERnU3E5MDM2M01hZENDM2xEdG52VDBNK0k0T0tZcnhKZmVGNS9TRS9CaGta?=
 =?utf-8?B?Kzk2TlVSeHNiQlJJSzVVb2UyTktkcGgxMm56a1R0Z240VkJhSlo0Z0VIU3R6?=
 =?utf-8?B?NnNkUlhoRWZpeUdlMDNielo0ajVnTjhhYVltRDlkWXlUbDYvbXpTK2ppRUNy?=
 =?utf-8?B?aTdHSk5MMk5sUEpUajBmbDEvYTRSYzFncmlIeXRJOEx6RzJqcGNsMC9qUUZl?=
 =?utf-8?B?TmF6UVN5WHZ6Z1hMN3JkRHBtWXVmUzR2aTdSbkM1ZEprZXBlS1dRdEdVZmNG?=
 =?utf-8?B?Q1VHWkgxY0pkTXpJS0xHdS9PblFMdkoxem94YUROdk16ckRNWG1NVUF3U1Aw?=
 =?utf-8?B?ZFBGOWxaZ1RDY2Z3NDVtUysxbldmeWtjdVRFeWxabHM5Vlc0T2pKMUJzOEZr?=
 =?utf-8?B?SGo4LzlmbXZvcksxWldvRHR3dVZKR0R3Q1BnK09LVzRpWFJUZHg3aCszRXEx?=
 =?utf-8?B?RXlJSFFHdGJVL1JwR1k1VE1wbkpYMVZCbmdYZHZDbWZEejBoSzBSOHlnYU9q?=
 =?utf-8?B?VnBVbDVKTFFrUFAwWnJsNmxGaTRYOWFUOU1tcklVMkZ4T3V5WlNRZkdBYkxt?=
 =?utf-8?B?dEUxQ3RJUGR0Q0x0Q0F5dWhtOHpDUWpTbDFlcllsU012aDhwTC9VNHNBZldF?=
 =?utf-8?B?Nk9kYnE0RGQwS2k4bU5XVEZKNlFhUWplNnNpekliR2RWQ0RFSDg1bFhBNkRp?=
 =?utf-8?B?bEo0RE1VR3JadnNVb1dhM3d3QldzZzVhNmtJN2xIUFBuMDc0Zzl5MUkrNkRn?=
 =?utf-8?B?U3pjeE5tb3RvVG5TSkZUL0dPT2s2M1kybTFpNWhJa0tVcXEvMUtRUnR2TWpp?=
 =?utf-8?B?TyttMjhwZ2twdGlXQmp2QXBaNi80clVsUXozdEZkOUdQR3BuakdnS3VoQ3Qx?=
 =?utf-8?B?cnAxUXJNTkpxamJsKyswcUZLbXBPeHhtZWE2QWZQbVpyWjIzUVFGQlNnSEVh?=
 =?utf-8?B?Z3ZXSnJjN2hHL3NpeE9xZjU5QVM4UGJhNysxTHZUdEczTmU2UkttRDFzYXV2?=
 =?utf-8?B?a0tDYy9Ca2VoaS85ZW91UllhNjVEVnVFZy9EWjROWGZJTm41all1Q2VUb2cr?=
 =?utf-8?B?MTNoMkVya3J1akkzbmcrOXJHdHVTdm5tU0ZheFRtYmRRSmRrSjVGd2J0NTdH?=
 =?utf-8?B?MTBvZ2NtdmJ4bDFqclVrK3dmeU5JdTdWTDFqNVBlaGVBdnpiTWZjSnAyS2xO?=
 =?utf-8?B?UThWTWQ0WVgxZTU3QndJVWg5Y2cwWkNyZFF1eVlycHZzelZzNktPM3BHQlFW?=
 =?utf-8?B?Q1lkL1VjaFV1MWxzdlB1RHlBRG5iZkM1RkRvYUZ2SlBueWJ3d1JHM2hGeEV1?=
 =?utf-8?B?RUFldXFySHc1bDA0UVB5T2FTZ2daOFJOQTZqTzdZTWRsQ0NGVHhjSXExM0pC?=
 =?utf-8?B?ZnlWRVNsVWdDcTB2NURhUVp1a0Nzc2RVODFnM0JvWnRvdlVMTlptdFlaeGM0?=
 =?utf-8?B?SW4zRlJNL0dyKzV6MnFORDNFMDR4N04vZXJUbkRQY3ZWaUJManhyTTlRWStM?=
 =?utf-8?B?UFlkSVdFWkhtREdmM1I2NVM1cTRWZDhUVkdwa25Ha05hZm51TTNtM2t2Z0V1?=
 =?utf-8?B?UzhsbjY5cVZ3RW1RcGRncVpFN2NoMlpDRHFCaWZBSFVvU1JwN0dUOXUyV2lu?=
 =?utf-8?B?eUhXNDJDcVhCd3RlZ2tQMG0xcDV1eEpaeEw5RnJkR0JMeDhCMExEUHlKd2VT?=
 =?utf-8?B?emhBa3RJNUJPQ01VRmVPaEVKeHQ0MkM3TU5hSk5ZY1ozTGFLUTZQQ0ltNVZS?=
 =?utf-8?B?Q3BhZUdaMkRQUUl4K2d6OUtRZUtJeWRTLzFHR05jb0V3akpacEdxcVBkYkV3?=
 =?utf-8?Q?Pqk3DPsFfBQ6d+9i0a?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d44439-b6e6-4495-0517-08df157b7273
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 11:53:25.7084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdF1WPuUAYHe5VfrWzog4ZuSa66nOCca4NBPgKdVIyzIrQFlotBwWsWCRinKbzxCS8NoleGPN69Y7rBFjCcyQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7595

On Wed Sep 16, 2026 at 1:11 PM BST, Gary Guo wrote:
> When initializing a field, pin-init first projects the full slot to a slo=
t
> of the field, then initialize it by invoking a method. Currently the span
> location is not explicitly set, so the error message points to the full
> macro invocation.
>
> Improve it by provide a span, so Rust will point to the specific fields
> causing the error when type check fails.
>
> Old error message:
>
>     error[E0308]: mismatched types
>      --> tests/ui/compile-fail/init/field_value_wrong_type.rs:8:28
>       |
>     8 |     let _ =3D init!(Foo { a: () });
>       |             ---------------^^---
>       |             |              |
>       |             |              expected `usize`, found `()`
>       |             arguments to this method are incorrect
>
> New error message:
>
>     error[E0308]: mismatched types
>      --> tests/ui/compile-fail/init/field_value_wrong_type.rs:8:28
>       |
>     8 |     let _ =3D init!(Foo { a: () });
>       |                         ---^^
>       |                         |  |
>       |                         |  expected `usize`, found `()`
>       |                         arguments to this method are incorrect
>
> ---
> Gary Guo (4):
>       rust: pin-init: internal: init: emit `slot` using mixed site hygien=
e
>       rust: pin-init: internal: init: use `slot` identifier directly with=
 mixed site
>       rust: pin-init: internal: init: provide span for slot projection
>       rust: pin-init: internal: use span of Index for generated identifie=
rs

Applied to pin-init-next.

Best,
Gary

