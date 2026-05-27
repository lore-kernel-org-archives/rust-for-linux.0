Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022127.outbound.protection.outlook.com [52.101.96.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1033F37AA7A;
	Wed, 27 May 2026 11:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880263; cv=fail; b=TF+De2REDxL5N36QA0fp1Uk0FL9bP8C32jZo4pHa3fWEab9S1sr7/TK92tdXsfbgIbn4o6UC7mgEG3Yxo2TI5vLZhSsJYcc1K13+IEBK/Xldm7iPdWas0Tr2giBqYmFZZ+K6gqlokL8UZyMC7Eo4jRz/j3jfvga78Ohu1hRy1Ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880263; c=relaxed/simple;
	bh=Sa5IbDVDa6I/xZwKfDqEiRbbNsh+RAOAEROjAQ73TGg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dfpykTXwxZuh0FUu8jU/Z6+1J06q409O5ibIMNKOyNghJGC3SBrdp+szr+XDvB9SE3ANd0C4WpDK3+UJV1t31xcrAzXIHqomoY3nfy0amH7D7NytUNOvC+XK3SQEt3GPLWZgLWSeusg9DJVStIsIsug7SGSmiRar7i8M0GnJe4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NZAL9LWr; arc=fail smtp.client-ip=52.101.96.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NZAL9LWr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Awbb4cIAFIETss3Gjrvtj/ldAWWsZAlNt9/+rKamOIEL1S2fz6r513xjzSmjhD7bR2jp2SHPQvKP9WKAj569nQHwzYu9ZU5lSV5KnTXFBzOMuWutDcDLuewKPEm4XG+Hpw15o04E691v3Yp1srKRA97MzNCTzcV/tEUvXxqDaiZCbJSrFU6CFXVlqmZseFakppxykrELuYWXMWyO+GiGWSEARZvutMLMiBJYSyp+qryoS1lHiX8d7BGFiCc7kcQ24FbRMDAN0RwknWsPUI4hc4udMrlhmKDtafgEMCLCsLhNdoqW1BUDf2Yex9dnNjnlTPxFMNucXefDJ/ZZn0IftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LI4UFgdZMEYQ/vZY21OsRGNYe9jTVJevocwWccrKj/k=;
 b=ro/9YrmNLBtMVFv9y1aSZaGTxmN3heGPTFDxXZXvrJ1+uDBl7LjjDm8j7u8v6aGk3MjIrhiOZ/VK2HOUTaQiqeI0/vwexprvVN/+3jxf39RpoCyQ8U8o1EgWvgxglLEifrCuYUM3+hvobM1DbxRWP5xO5bwInPP7uLY6ShrXmi2FMTccHqBvLXru107J/yHnkdUteZ3ZbFxlp7IGK06ICOUq6xnagcAZHHkY3od254hfSonLWuB2wJgHw33IsBXpVDtrDrVX/g3lYBItK3hMsnceUJ36ZnwJLl22fud0Cv2205UGjQ4tiSsQ+54WSQocWq9IjP3cnyJal4j2mv48fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LI4UFgdZMEYQ/vZY21OsRGNYe9jTVJevocwWccrKj/k=;
 b=NZAL9LWrPafWebhB9EOFUKkTATH4BKLYYZjbfltdzVuf9qTieIy90zfFyw3B2iUBupl2TAMxma7jRMT3PnmoUHDITNgIvy3hYd7TedT2vPhr1c/blojtPuQSbAFwoMrcPwUS1dZFQLs1sZUlPZxAb7OLIAAVwVjnQepryOnPOhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3108.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:8c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 11:10:57 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 11:10:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 12:10:56 +0100
Message-Id: <DITEW5XE0A27.22TV20B8RNQZF@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/6] rust: binder: use strict provenance APIs
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Christian Brauner"
 <brauner@kernel.org>, "Carlos Llamas" <cmllamas@google.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
 <20260522-binder-strict-provenance-v1-1-3d6e9406e864@kernel.org>
In-Reply-To: <20260522-binder-strict-provenance-v1-1-3d6e9406e864@kernel.org>
X-ClientProxiedBy: LO4P123CA0471.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3108:EE_
X-MS-Office365-Filtering-Correlation-Id: 035d61f7-3ed1-4c57-db8a-08debbe0a06b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|22082099003|18002099003|921020|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	CfNxGFHkqTlx9DFCAsi4WlGfM9WwDtYcowK5G4RR4RbDncV2qLdUAOpfyW8C5RTA9NH4cP2eXR5mP3YgT0TqXBkhVQJ+tYhFPYWkf5vPT6wPiQXkx8QQAXxqmhwwLozbLH2KttMVLm8CF/DZZoO1FKBZ/qAJ8u6R7eAPqCwk0mWQzrHvgcxQE378nnftidykOnd5hxAHKkOrhTWPrwPcmYfGQgy2O/oppIJAdt8x9QmpcrRQFz+jGky0SBmrKZIeXFUaNmeq7uWolyrI/po9PM4RgsR39DbMA+Rn3xW36lpn0lNZf7cGIr16KTCF+WBxL9XvKggKnbtFyLKtxLHPARdEOR1BCiNz0rSs55yZyC6iF/7bY8xEQqr5NI7cKZZu3iA/GDcJxqdozLX+uSBfWHsjO0fkIOOPNxadbZrNtkyi+hSjwAX6M4y7WCmN0vVsQ8WT8tXugLpkdboaCqmCradKyVb+nkV7C1nrSBNL9EorVTh3kCWLRVwquMbPZiAsY9393SPYoa237QgWOUgjIZkCXDak5gqjWbFjalPhvNuixO4FSvePXmc8ZI1asc91Wes8KOWBJIKWWW647+X07NGfPSMl/Rnkrmmla/oCmOPfp4iaDyvvv2jeNWLqsf8zVWWQivdZkPP+hidBy24Q7L+tt4YTpKHVIe/nIFRmhv+Qj/AosikbvOVxonks9vky
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(22082099003)(18002099003)(921020)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1VYWnJ2Y2xBTHVSQk9hS0hha1g3UGNwNWFkSkUyUmd2U1ZqZXlLUllLZ3pN?=
 =?utf-8?B?eUdlTDQySjBOZnlJdjZBSGdIWjhGWFBFaDZJaG1vL0xqZVVJTE1CSlRQOEZj?=
 =?utf-8?B?eHlyODY0RVJaeDdOc0NIME9lRWpKbnpQckVSR0RhSG9nWDl3Sjd6VXRxVWtU?=
 =?utf-8?B?NUtydFQzWTk5SzNDYjAvTkx2T3p5L3VVL21CbCtjUU8waHYzdnBna2RKbkUz?=
 =?utf-8?B?RGFsay9MeDBDL2dtMEVRSnJtdTh2YnByQTRoaEI4YTJlU3RacmFnU3NMdGNu?=
 =?utf-8?B?WDA2b0ljaDYvZThvclBBUjhsZUJQTXdwSy9XeDIyL2tuTWJHZTFreDhWSFFZ?=
 =?utf-8?B?RWJSTUoxcWhyU1QyQW8wcEFmaFE1OTUzRnAvU0NyTWdIODBydjhKQXNuc1ND?=
 =?utf-8?B?SE01Y1QySy8ycVduRndkdHVITTlMaVdOdjR2T0FCeTIzNFdSMDRrc3hxK0dS?=
 =?utf-8?B?a3F5TWxHUElsVUNlSVhDTEc1ZGo2QTRhU2VicnViN2p3VVhHTkJGdGJEejda?=
 =?utf-8?B?dDlTUEtyckZRMjFLQWRKY3czZkZOVUdsYS9keHpxdGFaa1laOU9URWNyQlRn?=
 =?utf-8?B?MlVuZHJjU0JzNjI4YW01RU5Dbkh1bWkvVkEzeEpZUXpvOHJyM1R1SkZQNjRI?=
 =?utf-8?B?STYwaE8zR1Z4bmNWYjZjdDlRNFRmMlRoekN0STVKb3ZWRkJEeENLaFc1UVow?=
 =?utf-8?B?MURXL3gvZ29Kbmlkb09WS0ZFcnFKUjlLeVFVVnMvS1NNT3k1Y09IdE5OZ1Zi?=
 =?utf-8?B?K2JjdXJkbUp4Q1o5ZEtqZGJUVGtKSXVyTWtNejliTVJVbkxuMVJycXlkNjFH?=
 =?utf-8?B?eWVzWnNVUk92S0VwZEk3NjhjVEVvVTZBOE1aSUFiZ0QyVW9kY0szN04ySzZv?=
 =?utf-8?B?alN3YXlQdElyZEVCSGxWM0JFeElQcVpFSnc4Z1l2cjNjditzU2RnYzBsaldy?=
 =?utf-8?B?VTVVTm5qd1BDeUNtSDQ1M1JEcDltVDl0NE42K0V4Vm9uQnNNM2J4RXQxTzd6?=
 =?utf-8?B?ZjJUdkt5M2Zra1A2QTArbmFuM3d4cExJSC9sYXJYUyt6SU5jZXd5WVBmY3E0?=
 =?utf-8?B?SGtZMWVZNHFPMkFNY21mK2RXWjRhZlpsSGlDRkowckp3cFNGYjQyN0JOWU5i?=
 =?utf-8?B?dzMwN3FmVk5pdytxRzRrV0ZsVWhlZFdMRzJQb2pCb0I1b1VibnhCNWh3bGJm?=
 =?utf-8?B?ZjcwU2tYWUdWWlNDRUJybGRTN1ExYXdiVkJMenFqTStlMzhDZ3c2RVpGMGhn?=
 =?utf-8?B?bFM2b09uNVdCanVCa0FvbzVEMTB2SkhWUzN2cXFtdFpBWW9TeEdyUjQ0c0Yw?=
 =?utf-8?B?czdIc25IWjNvU0JuVDZLa3YwSDE1bHFUbTIwYXBLWU1oNEhacHA3b2lSeFR4?=
 =?utf-8?B?R2RVYlJqeWNpcGYxMDBrZnBxMkpwdUtvZExjUEdrUzJJUktFMXZ2a0NDR2RF?=
 =?utf-8?B?dGFJaHUwMTA3UHh1R3FLNzNQYTB0YWN5MEtEZnpIYVFXK2NPR3BhY2ZTWnlt?=
 =?utf-8?B?L1lVcjR1NU9GdTJIbi9YMTI3eTVwdWM5SVVOZmpGVHByU2JNeHRpTElYRXB4?=
 =?utf-8?B?Z2JhK2pnL3VmWFdwZUhOejJPLzlRbGRWWmY5Q2I4a2hadmlhbFVDVkw5dDZx?=
 =?utf-8?B?Q0hUV3RLM3FGUC9pOVVJVUVBaFdONkJVcTlsdmxhVC8zdk5SZ1hWalhGNGlR?=
 =?utf-8?B?SVJBcTBYcTBGZVh2aXJXaktsWWdpcE51Q2dDc0VnTkM2VnlGZm80UmozNHh3?=
 =?utf-8?B?cWsxc2t1a011ZmJjWUxRN2xqVWhFSkdGRE1ra3Jtc2R4RlJwTkdVZm52dEtD?=
 =?utf-8?B?dHNwM2Y0dk1mL2Z6RXAwU3ZEL2lVWXlKY25vdStNR25lZ28wSlpIaElGOVF0?=
 =?utf-8?B?WVREd0daRmFZbks4NllLc0h4TytwNlRqSCtWcThNQkc4dXFtRExrdVFWQ3FV?=
 =?utf-8?B?Wks4SWlQL01BUjJpeXprZklhcys2Ty9jdjRFYWxGK095UEhDOWEvRjVGcGx5?=
 =?utf-8?B?UlNTVCtkQUFHMG5ZMTg2ME1xcjBRY29QS0cvMzNYbzJHdEJsajVuTWFVSWR0?=
 =?utf-8?B?amFOdkVNbXBEMkJGdUUySmpZZkg2THVTS2xwbTZOeDFEa2w2K01lSmczK1Z0?=
 =?utf-8?B?Ym82em9NUmk1RjJCN1kwTTdiTmdjS1VmZXFJcElQTk9LTGFqM1hTYVpVR3dH?=
 =?utf-8?B?VEpQdS9qVFZmNmhmL2JvK1gzOVZWbC80K3dEa3BjT0RRTTFCQmVrRkYyeGp6?=
 =?utf-8?B?bjNHUUJYQ0x3cEhRVDJ6SVFxOHdFQVYwUEFWQ2Y3MnYxL29RbFc4cFVoamlq?=
 =?utf-8?B?UFNQM2FCTVRYTGdUc0xORlJOdEx0aHZoY1hYclRhY3RWNHREUzRTUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 035d61f7-3ed1-4c57-db8a-08debbe0a06b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 11:10:57.2471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFzdPE8t4hBRk67grsl9IkDkhjl4RlWEphHCaQJ/hEKpjTvotXYTqdcS9S3ro1lYUGtkL54eheau3R3NWz81Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3108

On Fri May 22, 2026 at 6:12 PM BST, Tamir Duberstein wrote:
> Replace the pointer-to-integer conversions in the Binder Rust driver
> with calls to the strict provenance APIs.
>=20
> The strict provenance APIs were stabilized in Rust 1.84.0 [1]. Since
> commit f32fb9c58a5b ("rust: bump Rust minimum supported version to
> 1.85.0 (Debian Trixie)"), the minimum supported Rust version is
> 1.85.0, so no polyfills are needed.
>=20
> Link: https://blog.rust-lang.org/2025/01/09/Rust-1.84.0.html#strict-prove=
nance-apis [1]
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/android/binder/node.rs             | 2 +-
>  drivers/android/binder/rust_binder_main.rs | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

