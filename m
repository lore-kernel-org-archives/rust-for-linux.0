Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022141.outbound.protection.outlook.com [52.101.96.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D77800;
	Sat,  9 May 2026 12:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778328942; cv=fail; b=cd5lLKFle/v/0V4NkeRSjdY4CGQVj6nOjO1aiTZe1pKuVtkhvFfxhekj2oPX5jY+nJ7HpEcXWU2JtsbmbyJr4tuF010oizYY3kIUQ7MB1H2rHunbPXyIccZe0LL1Pc8NOQJ3zbQQ2jIHPHfIcqEFGmcj9r+BRRdqSOcJlc6noOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778328942; c=relaxed/simple;
	bh=wuXIrwLVvutkwxYhdKuCxRbdAyIT2otMa0BHD2nj/Yg=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=qeVNvWyY1N47oFajGTdQR0tDjhkcUikSZ+JiEVNNBEFoZUl7EXM7/PWg/QT4+IixE6P39HcR/SNR0blVGXD/wAYAO64fysXqKg3Yl3yhAajOq3ql18aPabOfejJA/PwPyKUJbeeVUsdcVjNxQQNmWr6E+jsBHiN0u9jQ6QNjaIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=r1JSaE1I; arc=fail smtp.client-ip=52.101.96.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="r1JSaE1I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnf9+gepbu3u8eMQQiIGEEssfow4kzPzwLdfM8ILBUUFJ4B42lyBI4kjIZgz2ieDh2hXmZj1uPoVbzc4Yq10H0NP4zRF5RMGxyNlhWofbvd5LgXZ802LW/HPPaTwvm1855UQ1dxn9oMICFmi1WaSMqRc7eW/4AElQkcmtRSLb4iWrlo3UCuQ50OQitFlefbWJ63Tn/Zofb5HpVSWMV6IjoHQNT2RfqS1nUpmCxuwz13joyuHcYYbdi12Y7A/vOub2fNED3HXLHlYL4rsyWHr5t1P6uBadMkpzjWXcibilR8e9hBYshktf1f5L+kAHRDS3f31cT8l5qpaeWUPC6jx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkGD8rFrR6/o06VoFGyAwUXymdRcpToxX3zaN7xncfQ=;
 b=AtCqUBbPeExr0j33o4t5QnyerBtvNWlwgSKRuaEkPjwJw8C/v9lwJJjtfdTpDBD9j4R0HzK6sx7lLM6+mHu8JXcZ6e1D6TnFNwR3ffrzwCVbA8LxupIn5BbT9mZoJZcaxYN6YVPPFh/pKHsolxzJvLIwVo83NICVfXMsKkWdvUZTlmIxM5UuYP0wlwxTzNzSDMtphpFIVelDYuNE8g2V0ohUrDxNAaChHk9KNPkn6L1+D1qraxxFGY0mJRH4LY37VsZ+UGUEl3EXUoP/GoZvHRDBtvFQVirAEKuumrEb/cuLJcldQvvgJO2SUJDnv25eubMds5rbJV9dUdUXbkc8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkGD8rFrR6/o06VoFGyAwUXymdRcpToxX3zaN7xncfQ=;
 b=r1JSaE1Imz6trjEYRb7vSKCEPPAGEBJd7wfzWpg36GKHmo5aX0h7Mn+0Io344BmTrgKHlyFqu4/ZEui5POwF3IjpuHDJUjjLgVBVxa4WD7Lqxm9FupJiqLqXeitChnr+fWJyq1ot6qmhARjgDr1a7WMqwxF9uXg6KNqdivlITWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO0P265MB6696.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Sat, 9 May
 2026 12:15:39 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9891.020; Sat, 9 May 2026
 12:15:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 09 May 2026 13:15:38 +0100
Message-Id: <DIE4ZW566U0Y.MNANAA8G8W6C@garyguo.net>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Gary Guo"
 <gary@kernel.org>
Cc: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: pin_init: internal: use `loop {}` to produce
 never value
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260508152950.833635-1-gary@kernel.org>
 <20260509064905.536777-1-work@onurozkan.dev>
In-Reply-To: <20260509064905.536777-1-work@onurozkan.dev>
X-ClientProxiedBy: LO2P265CA0488.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::13) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO0P265MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: 8398adcf-2d19-449c-aa83-08deadc4aeae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|7416014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QEeJoBSxNQmKsoLoCofAfG3UAJdy56U09mbMCZLdH0pucvfOfvwpnLyhYkjRR0Tl+yxlsMMnrgVq8kVYlPi7wzRf3U7pN1V8aK8yot13+zAzYflK4AtkAgG6d89PYnUBXR17SLPyT+H8ZBnIAxNBMZB8YGs6RhjUEuz2EKLXe09pI9bK32fD7RUWD0o7SPDeVRSJ0MHMAWoSc9bQFFVbw39tSRg+LCBuak+kwiWtq2Sjci0rv4PlnHhtaijlRJmy0YZHRoX/ybTcWjrgl0pAvDlnEBHTs6MO7JmfR24yH9aWXjT5J+nw6/73IES5/GgrIiNG53Ce0AwguCgF+TXTLEFPknFW6WTVaQayJBkvq+KNUTSLH32+XNuLIe2zARqB5at26X6BYVbubL6TCw+3mE0fawPk3BaHFMM4Cu2d/AGNPzHFFV8Jh3A+dGN8bv9+ke5ut6tMIutQKVR/wUN3EurAXvzNe5G6wI8PZlZg0Cv1lfs040fWKSDc+khrjPPz/lbEIt5C9QVsII1bSRWig/Jwag4NjwUEYY1VSqwTJ5+YUih8KW3k2PUq9qh45jNish+KsHyvK88EPeVwJFr/lRRW5VffEINrEV37mtleciBsK9ZeM1sKHLwscO1z0Bt3Nr1A/PyPX5dYLDyL30pcWAUY0+wPpf/7ViTKMQJJ1vS2kV3453q3lt1uXrHXpGMC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHhjQUtjQXh2S0dOM0MvSXM4bmNLbC9nVGRRTUpYWWRCbEpkbGRreWorSWJn?=
 =?utf-8?B?T0lSbHJPQXd6elNqeU5LajRNNHNKRlpROUw1ellMcmpBdENieURQWW5xeEpx?=
 =?utf-8?B?MEhKM0NFY295Qjgrd29HOHBiZ2VneWcrRDhMdTI0WVBGbjIvMUhVRy8rSHFu?=
 =?utf-8?B?UzlDV1FGN3VnM3RNTjRqd2F1VGhTWE9aWTZPV0dpSU9WdmdPTWpDaGgzdzc3?=
 =?utf-8?B?MlZ4dDJBQWY5T0VDeVZveWNZZUE2YkFXLzFJbWVabEZiZWVBQjdjZHBPbjND?=
 =?utf-8?B?a1dPcEI0cm1tRVhoZC8vUkFCRkQzcW1iVjQ3VkRYalM5ZHRuSFRwOW1nOGVX?=
 =?utf-8?B?a0dSVkkrck5WYSs1Tk56dUdHeDR1RWRNYlh1OW5kL0VvMGhyc3p3YWJOdjVX?=
 =?utf-8?B?blFWM3NOQkpHN3E3VVJKTk5NcHRFSWpxOFdkODFPcjkwbTY1Y0p0eS9KbXRo?=
 =?utf-8?B?SFVGQThLdjRSUGowcnhsbDExM2tDTkpxOFlsVDN0VW1SdTcwSnJIaFhlc0Nw?=
 =?utf-8?B?elhsRFlBNENhN20vU3NxSVFpM2xoNWYyWDNuT0tFWTd1a0wzUWNLMmtaSXVC?=
 =?utf-8?B?anltYWVjSHQ5Qk1rY0ZEWkRWMCtBOXkzcFhKdHFNem5QQ0ZkN0RJY1B6RkE4?=
 =?utf-8?B?TGI2cm5ZZTVQRnhLWWg3RW1HYUgwWEliVkcrNnhrRGVwNnZqejltUkFxRDdr?=
 =?utf-8?B?NitxeTEzV2txQ25BTjR0TWZDTFdXRlZwbnc4M0U5RzA5NWgzVy9ueGpoeFJY?=
 =?utf-8?B?TWJKR3k3dzk1TUQvcnY1a1FFcUY2RHFZeWlrcmtCTDZscVJqOFpUQThYYUZy?=
 =?utf-8?B?WXN6eGUvZWFTREtNeit4QjZxUm5qb29pWkNteVJtMnJpVXdCWi8rTlJsQVI1?=
 =?utf-8?B?cWxaVkNRTU91bGNNV0ZZRXMxVlNhMGM4MnBBa0I3bktEcmxqZ2FJSnRFenBF?=
 =?utf-8?B?d0N2V0ZSbEV6b3E4WXhtcjc2ZTVBd3YzcG1jL0thVDU1S2pJUVcxeHFVUHI4?=
 =?utf-8?B?ZE1kbVVOL3F6cVNvekxDdnR4YW8wT0ZFTXFPeURleVQrQjdCbUZJQWc1ODRU?=
 =?utf-8?B?bW12RDdNV0FBOWdENkNnM3ZWNkswdXMyN0ZJeU45S2l4L2FzT2k3cHB1R1Zt?=
 =?utf-8?B?TU8rOUZ6UEZPZmxHRkIxajBWbzVhWGxiQTJ3Y0xQMnh0S2tTdGowdVpkSWRY?=
 =?utf-8?B?YkhPemh1cDlQaHlTWTlvTU84VU1UNU9NTjZscnlYeEdRbE5zZU1lenIxRkNK?=
 =?utf-8?B?MXMwalFicHVGMDJkQU1tSXVNbUVPQXdZdFE1ZjZtWk9veGxsdkU3azQveVhz?=
 =?utf-8?B?TG5KOTBIVTRCZ1REbTltU2ZPb240UnJuVUI4dmJpemVoTkFGeURYS2J5WjFp?=
 =?utf-8?B?VUZWS3Q1eWJMcG5KaG5idmNCdWExejZqQ0YzSWtiMGZnNW9NQ25TQ1Bab0o3?=
 =?utf-8?B?cGc4b29YMlluNnBwdDRmTXlWWVhSZVhzckxENDZvNjhFOFBoeHhFQlZOOXQ1?=
 =?utf-8?B?clFuVjRXM2dRMERkNFRXWVFMYjNkUFBTVURDMVdrclloTkloTDkvc09EWHNC?=
 =?utf-8?B?d3ZXcDd2MEtYT1ZwQ0VrUzBNSEt1eFpFdzdCd0ljMmpVUTFZWGpmU21BRVN5?=
 =?utf-8?B?Q0VuUmdheE1abjNUQlRWNkpLd25RZUd5ZXV0UFB2c1dQN1FxWFNHS1FHYmxR?=
 =?utf-8?B?S24xMXMxM0d4N2Q0S0dnaVBKTTk1NVZYd0tvek03NlZNRnZ4d0UyUnZqR0J1?=
 =?utf-8?B?eEN5Rk5UMjZWQ29KWkFjZ25ETjM1LzZ3VXVUZ21KbTBWdDI4TkxCc2xwd09p?=
 =?utf-8?B?N2dxc2xoZWZielZJQWpSaE9VYSsvNDg5N2I1ejRWZjVrcTViSDNxZEVBQjhp?=
 =?utf-8?B?NExFZm0xVDFUbWlQQ3ZBWlA1aHpJQlFjN25SZW83RHZXQVlJQjB1MDdOTUxW?=
 =?utf-8?B?WndtOCtJcmlubzY5VkRvdWFSTEhSQUd4amV1V2N0cEdwd0FINXFmV1IrZXlw?=
 =?utf-8?B?cHJ6ekhrT1FONnhuUklMOU9qY2FkeW12V3NiM3lSM3VSVDA1c2FtSTVNMG1R?=
 =?utf-8?B?MlZQYWZVRXlZRlhxNjFJTkNDOTJXcDFJUEVzY2lDQ3dVeEpkcUpoZmlJKzlV?=
 =?utf-8?B?MXZ3ekFMTjQ0UUpmWjllNy9LVHlyUkxTcDBCSmJuL3I3MDRyRDNMTVRsUlJ4?=
 =?utf-8?B?aTZoU2lCNHQwcVZwOUtmcDkzVXVnZ3VVZUY3V0lYUjZ0TDlHNWpoYVJQYzM1?=
 =?utf-8?B?bmVCdFpNanY4cTlKWWgvL3pBYTFLNEsvd1lCaXpSYnFzNHZrR0hzWUFpWE0v?=
 =?utf-8?B?dzdKRkxrNGFpdE9NWEM4TStFWWdJeFRCRXJnU3JzTStUU09NR1cyUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8398adcf-2d19-449c-aa83-08deadc4aeae
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 12:15:39.0265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pM8KwXFgBo4TNtLbX2fKA/Tk+0JWsq5RfalETs/sDR8+wZOumTrmVCU4QQ+1T413fEi7uY/YM/yfQ0L4DveNFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6696

On Sat May 9, 2026 at 7:48 AM BST, Onur =C3=96zkan wrote:
> On Fri, 08 May 2026 16:29:49 +0100
> Gary Guo <gary@kernel.org> wrote:
>
>> From: Gary Guo <gary@garyguo.net>
>>=20
>> In the `init!`/`pin_init!` macros, we rely on a trick that assigns never
>> (`!`) values to all mentioned fields in never-executed code to let the
>> compiler check that all fields have been initialized.
>>=20
>> Currently we use `::core::panic!()` to produce this value, but before Ru=
st
>> 1.91.0, it creates outlined `panic_cold_explicit` functions which do not
>> get removed by the optimizer, thus leaving dead code behind in the binar=
y.
>> This has been fixed by [1], which lands in Rust 1.91.0+, higher than the
>> kernel minimum version 1.85.0.
>>=20
>> This causes ~200 dead `panic_cold_explicit` instances being included in =
the
>> binary, with ~90 of them from nova-core's usage of pin-init.
>>=20
>> Work around the issue by using `loop {}` which creates the never value
>> without macro expansion or function call at all. All instances of
>> `panic_cold_explicit` outside libcore are removed by this change in my
>> kernel build.
>>=20
>> Link: https://github.com/rust-lang/rust/pull/145304 [1]
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> ---
>>  rust/pin-init/internal/src/init.rs | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal=
/src/init.rs
>> index fbc8286263b2..b1cb2e53ee6f 100644
>> --- a/rust/pin-init/internal/src/init.rs
>> +++ b/rust/pin-init/internal/src/init.rs
>> @@ -338,7 +338,7 @@ fn make_field_check(
>>              ::core::ptr::write(slot, #path {
>>                  #(
>>                      #(#field_attrs)*
>> -                    #field_name: ::core::panic!(),
>> +                    #field_name: loop {},
>>                  )*
>>                  #zeroing_trailer
>>              })
>>=20
>> --=20
>> 2.51.2
>>=20
>
> I don't know where this patch is based on (on current upstream there's no
> zeroing_trailer thing), but at least on the upstream side there's another=
 use of
> ::core::panic in the same module.

zeroing_trailer is introduced in
https://lore.kernel.org/rust-for-linux/20260427-pin-init-fix-v3-0-496a69967=
4dd@garyguo.net/
which is currently in rust-fixes.

Best,
Gary
