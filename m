Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020089.outbound.protection.outlook.com [52.101.196.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EF5330666;
	Fri, 29 May 2026 21:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088736; cv=fail; b=rCdCpoEiHt+Ly0sinP/Sflfqtm8fCsbFh271JZphTmj5Hr0rSShxlg3TsPk2A2b3qOsykXEWU6W0fz2yQG5ku2W9jkZ7V5Lhko5vEvLGrR19BshQSJnP9+0hYMoz3e+s1omx2Va4tUFHDVqsLDKKdIiUTerQA7EDg7F5YxfaRdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088736; c=relaxed/simple;
	bh=e7OzFuGoGP3u6K0VRbkIqGN7beCMNKjU2xEi/CkuB8E=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jgd4voSjucnnuCqGQXTEGilQBOTiNY/TALhId8UYZvYiPfJDdNsiYs2xYfqcF48W4LZQVMcAHOe5zeZw6fyBz2CzPciHFmaGDTSfzRiGBs2h0fV0qEUpv2L77Yysqt7W5JvTtItvBIcI1dVuVjDkpVPUK7SlVCKTb0hiJw+9K1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iBiojZbH; arc=fail smtp.client-ip=52.101.196.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iBiojZbH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDDKHp88nvDafx46kGlt0ebkIBnLSHS5zz12muMCsOsnVEwetYVnb391hxQxxdt4JuHNUg6T7BsZgeKwLU15AxQy+b+Y6L6EI/a5+XQFsywneIMvgcARqlxKrijY54Pj7tnvOyrLIsocSf3zAhwJ3AkuJPw2m67imYAWpABkaC07c6jo4gl9CnMBxlguIu9oJjZVAyQzxXyv5XrlZYT6tMAXbAV4TNYls0mT0B5Fsg/pUW3yYaWDU6ewQC420+n0xkqUi4ctBf2i5MS64d93t/Y7hcBqd9Oiasq1dTlq12ShJxPClR/ojAtvFs29OD6sIw17ZOe2gUd3oScPxKvJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3HXL3fnaF/rSCXoSOg5Xb8n6E7EvUbF9fGf0ZAEm0M=;
 b=qbycZ8FH4z2LJmmEsyr0N9gfhXg9b00PVf8jE3E5By6XNWXHpSV7NYGnpmrlIl+7wnk71nXVunqNb0Rz+mFXgKNAvBJcGZagHFJ3JEflEPn3uQpBlYjLj2KTKVNAW2Ws4FXtNMCidUVfy+te3HknM4xSpj/lU4Zv7F+BFkhTGU+ZfpSDfYQbnsag683GosM0NEcyUsrzMHU/7K4BoUVKs3zeLpdP1RF9AgqP1mpiqF6vbTowaIJ+fz5WBEbp99pk/5cIbc7xMFS/+DSyNXxg6Zavi1D3TjNdxWQI5mE0DkeyJsMg1eZbIfNmG5zhlTTFbje7Gh9Qyfc5fsRGs9jB/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3HXL3fnaF/rSCXoSOg5Xb8n6E7EvUbF9fGf0ZAEm0M=;
 b=iBiojZbHB+p2Ur8dW/QPMwZatgR2BakgC5BUw3ppNNGKT5QrfzsHB238UPW65cd9h5r6ExBLUp05LZzUSN/jjPszEbUHBBPvFxCCgcZY1OQtTa0e+4d8pFuQOnfOYffCaKvQzJFa3HL+rodql5otTfPDKVLlYz5OYE4GTrhbVS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB9404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 21:05:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 21:05:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 22:05:32 +0100
Message-Id: <DIVGSI93PLOE.2UJANKGVF9GWV@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: pin_init: internal: use `loop {}` to produce
 never value
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260508152950.833635-1-gary@kernel.org>
In-Reply-To: <20260508152950.833635-1-gary@kernel.org>
X-ClientProxiedBy: LO4P123CA0347.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB9404:EE_
X-MS-Office365-Filtering-Correlation-Id: d58991a8-8a0c-4614-0782-08debdc60566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1LqZHHgXsQY6cJEg9yeOVjTFbB0wDIR8TmG2UvH9qntpQeZ101f751+SIXFRQuEQPuf8d7nS2io24iYc6Re0nVw/ET2CO5sfpYuHSatEjwI4UngexORm6ZxM+WLiztJ9BL9Cf4JOXcvh1j9Au763NSZOhqu7s18/WUHhHkPZC1TNxZcgnpfQRIuQK5ILe8WalTG3ALDXhH5QAcprNzz3Y4QTBlN7GY5+BYSg+P+z55KJJQVTCvWSQwJh30X+gDnZNJHp5KQwoq1FVbbxaIwNYKdgp1U7dOYEEzWyI2vMhmMyA9lgdoQ3eK3EddUBUzhGm3Q0bPzs5utM8xmNJ1m6yNWwtFJABv24WcChXqKKGw1JrCzlef5qMt0cca+gQKytQsYTAWOp2ff00cc02WS5wzWxKzJttP8yidkE7EM5W2vRWQFsU/U4uKsdsTLiSJ9RY41bWImsUJFcMX1F5MN18t4x/j6qQcATxfBZxik4EADAgvmtapaMr8M1+GdE2lLvV60rEX6PP+GVAzwIP1l1RDVhzrr8NYCTlABmVEgN8DtzLJFr6cKnktHckTOkqvVj3m55DBXaekQ3uKLSVNVuT4c0lmVTI7bp6v5LCyvGgP9UoBCMZ+/RszdIPOI7S7B2vDYEBDLvmO5Ysk2Zoq7wqWvs6vgyAggpF6hAomZzIzVFKAgyEEAYp8Ixzdp2FPmQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzlyN2Z1ZG1aTERBY1R5dXQzbUZMaGp2Y2g4VEJYUklYbXE0Y3hHWmw1dDNG?=
 =?utf-8?B?Z2VQbWY2c0VwQmpxbEhlMUFySjdlNE9oamtLc2RFWWVVTm9FZ2xRaU43ZDkx?=
 =?utf-8?B?aVlnRno5NFVkcWxWbmpGVlAyakJHWVpONFVGcVNFUU90T0pYaUR2RFNCbm1o?=
 =?utf-8?B?Q2FhclI0T01HNDhQSjZ3Nmg0dlYzMFphWU9EV0hJajVnRWhjNjRaWHpGeExI?=
 =?utf-8?B?SnZRTFE1QVA5dEFXbnhEZzlvL1I2RFNFT2Q4ejliSkdlVGQwcDhaWVZreWZP?=
 =?utf-8?B?OE9NR3FWZ1JYVHlVajNYUGIzODR1ZVZRR1hPUFgyQVBobXNwbjhleUcwZnk1?=
 =?utf-8?B?T2x5eU5HNkdINDM5eGpERm1lZXBqQzNhaXp0cHd6SnhzeUNMbGVzZ3MyNzRk?=
 =?utf-8?B?b1N4b2dpd3B1MFU0Q1hTRzlqTXVBa1lPWUErSU1TWGtOYzZvVWxvTEQ3Y0R3?=
 =?utf-8?B?bjltc0xSdXlpazU1MmpHcXB3dm52U1QxOEpQeW41WmJLVnhaRUl3KzJGUTN0?=
 =?utf-8?B?cDNqeU1EU3JtdDVjT1hQM0hqRjE5dFhhMjZuek84K1VXZ3Z2VmJEc3NoMnNO?=
 =?utf-8?B?YkovZ3BlYU5ia091ODl6YXBPaWR6d2lremhPYi9FQ3hQODc0QlNMWTVzc3hM?=
 =?utf-8?B?THFva1BGdGNLYktZU2hNQXVsZjZ3VkpodzRSYk5GSHovWjZZM2hzeFNJR2Ru?=
 =?utf-8?B?L0ZjQVBKdi95RHdoUGo5Unh0TjY5NEdSZWsyTWlnelM2cE1LNnBKQitPZ0oy?=
 =?utf-8?B?Z3d5Z3REcHBrN1ViTitVMEtUT3dBVjRmNUFEM3JwWGF1ZEJWVnRkblE2Z1hq?=
 =?utf-8?B?Ri93aDU1Q3RvanBBSEN5bG5KV3dpRWRQeUJEWXJqQldhRlJ2amZTdU9iRWtW?=
 =?utf-8?B?eEpKdmdqRkpTUzVsKy9ucVRPOXFzZ0ZMWnpobS9xVmMzaW44NlVJZ3kwZkc3?=
 =?utf-8?B?Y3RTL05GZ1NYMi94czY4bUt5MjNLZHVwTUVKaGhyNTZER3JsbTJWTE90MWk0?=
 =?utf-8?B?aGxBZzk0Z2I2WGk3bVBibkFNNWJOVllxbUtvVGE4bk9hcU1tWTlrY3BORmV5?=
 =?utf-8?B?d29ETmc3cjNwdGVvLzE1RVBDM2VQVHpUUUFHNG53V09Felo5ajZsOUdkZkhY?=
 =?utf-8?B?SWlQTE9tWHBXZjBXeFJtUmVCWjdJVCtybGNzZzZnaG9PUzloRDhJbXhiNWtW?=
 =?utf-8?B?TjdsNU9SR0ExamN4eGdQdDFOL3F5L2pEMlVZUVlSaUV3MDgxSU1NejNmdjNo?=
 =?utf-8?B?R0E4blVpOWdna0QwN1hselhram9scCtjeHBmeXhJa25sa01sUjN6RlhiK3BI?=
 =?utf-8?B?U3I0TFZJRkMvMDB5SGRmWUpxcXlFMlMvMjNlYThQY3AzeFlBbk1WK25lS3I1?=
 =?utf-8?B?cmVqUUdzNllXeTk1ZE91VDREUTM1NjVQVjlidlZnZVdncUtiVmZsb09MMGYr?=
 =?utf-8?B?RUFEclYvM2RlQ1duallJbzZXeCthTnFRM0l4WkRZVzBiOHZ1VkRVbVpNNWZi?=
 =?utf-8?B?czgzV0ptV25qUUl5MTJ5ZmxzT1l4MHpYcVorMlNXSnpUVFdHdHRLRFRhbEhp?=
 =?utf-8?B?WXBpcXRIVGU4ODJKREZ1VGVtWm0xRGJkcnBLU25hZnRCcEUxd3gzU0VJYkdk?=
 =?utf-8?B?b0hWVW0zWS9WVGFBSnp6eDJGV3cwYjY3Ymk0bDdUZytiajV1Y1pvT3QzNlhE?=
 =?utf-8?B?WWs5VlVvNVVpOEVlV0ZScmVxN0FuN2htOWZlendwOXFpcDVFNkx5SFBlb0NM?=
 =?utf-8?B?cDZjSE5HUTR2K0xIR3lRVnJ5VVdZaFVvcGk0dmlkU3lNR25FSkRGYXMyRGh2?=
 =?utf-8?B?ZEQ2UityekZxdFZBVm5VbVNWYXlac2w5ZHQ1Z2ZsRXNOUE80aGN2d1hPVGZO?=
 =?utf-8?B?TXZqcEZ2ODUxQUR1VkdBbFVDRjE4RUJQL2g5MEplc2NWWEhuYVVBUyt4a3dx?=
 =?utf-8?B?T3g3R2R1Q0lUQ05leHZqZWZ2b2lndlE5MEZkdDNnTU9sajVRM2Z4dWZ3ak5v?=
 =?utf-8?B?cnFBTUkwd2xHUU5TRHVZUkZZMm5MUitzVXdta1lXRG9Rc2haUXc4UmdzUVFl?=
 =?utf-8?B?RHVCYnNacFZPTUM5cVQwLzVTbHZlWXQ2WlROMHVpRGNNZ295QmdUbGlJNVRp?=
 =?utf-8?B?dnR6YloxcnQwcldZOGpEYjBqWmtxWk14M2g0WHJNQzRVaUxDc3VUemd6SVNF?=
 =?utf-8?B?Yk03Q3kxMGZlSldxbjl2YnIxbk84Ry94Qm5MdWY5QTRxUU9MQXUxTTY1d0tl?=
 =?utf-8?B?WGRLOTRkbHNWdFhLR3NYNXliQytEWk8xOXFBcmFoQ3BxNXcwSjBYcWlueVFt?=
 =?utf-8?B?ZHBDRnRHeVFhNytaVlhZS0FJNjMvcDJSWWRYWlROc2xWTGFXUnlVQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d58991a8-8a0c-4614-0782-08debdc60566
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 21:05:32.5448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovAe1X6rX/qxTKfFAZvADR41ouF/y6+ic67cs10O86cGFBZ8WcMioIJZb/3ltkptu6/jLMYN9Y90L65anN9G4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB9404

On Fri May 8, 2026 at 4:29 PM BST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> In the `init!`/`pin_init!` macros, we rely on a trick that assigns never
> (`!`) values to all mentioned fields in never-executed code to let the
> compiler check that all fields have been initialized.
>
> Currently we use `::core::panic!()` to produce this value, but before Rus=
t
> 1.91.0, it creates outlined `panic_cold_explicit` functions which do not
> get removed by the optimizer, thus leaving dead code behind in the binary=
.
> This has been fixed by [1], which lands in Rust 1.91.0+, higher than the
> kernel minimum version 1.85.0.
>
> This causes ~200 dead `panic_cold_explicit` instances being included in t=
he
> binary, with ~90 of them from nova-core's usage of pin-init.
>
> Work around the issue by using `loop {}` which creates the never value
> without macro expansion or function call at all. All instances of
> `panic_cold_explicit` outside libcore are removed by this change in my
> kernel build.
>
> Link: https://github.com/rust-lang/rust/pull/145304 [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to pin-init-next.

Best,
Gary

> ---
>  rust/pin-init/internal/src/init.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/=
src/init.rs
> index fbc8286263b2..b1cb2e53ee6f 100644
> --- a/rust/pin-init/internal/src/init.rs
> +++ b/rust/pin-init/internal/src/init.rs
> @@ -338,7 +338,7 @@ fn make_field_check(
>              ::core::ptr::write(slot, #path {
>                  #(
>                      #(#field_attrs)*
> -                    #field_name: ::core::panic!(),
> +                    #field_name: loop {},
>                  )*
>                  #zeroing_trailer
>              })


