Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022125.outbound.protection.outlook.com [52.101.101.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BA6349CC1;
	Sun, 13 Sep 2026 19:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789328275; cv=fail; b=MfKeeIUQDyW71HT1a2sMmW4eByGwYEyBlxAPGs0hecen8Nwm1fi3t4dSxVWI2qXzk3XLcXbVunJRs3pG7StZ8DTqd//MW0xB+iM2SYTuQohrwRH6+YspG8s0rq9en6F8ZMgGBKVP88a6B29FPVL16x3lF1mTpbENKnSOQaziJXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789328275; c=relaxed/simple;
	bh=HoEqz1rRdBK4asl/mRma5i1KaZtiUQODkQjQ5V1ooUI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jtKiz5ZTeMoxUBUJa31ETm1kQWuZEDO4xGhZnEAxeAnK9zCn4eHp7p60rIbXPqVNiIfFhscOu+hG9MYN+yKFV2co5haZ1oKyqYn89jWV04RKVZH8d+LnvoixEMxfk4mUbHFh1omY884DDoDh/VbW5QCObENj2sZV0Gy8cUhos5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iQWUuZpH; arc=fail smtp.client-ip=52.101.101.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iQWUuZpH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coNSm2cC+x3XFE+75kkaSqSoN1vKvZKIVJ2Q0oAP8EWarytOVx5IGrNO2dNMGb9IacEafZIbKEOmO08dorlDI+76+7KKkuKh1XMcfVZ8P5lEAafqY43WVHFAWu5XU5sheS6681Ru7YHE8qvvjse+yHIxx4LYVewwtBBzLvLoToO/q6OABU4B1xb8eoZpNBI8cnSY1ZWBoCXfvm019iES0dH3k6Prp+BbSwemBh/3Akph5CVd3pVeH44KfBHtFFRT6+6VmwqGrh+8BGRSA9vanYSUipjWbNogzc8GYTc7q5aTEdzfFXRYfNrNKED3rdWvuvN5NOkZ1APbI0Rv9NdGYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zm4C379jvKCN7l8vEn51YQeS5WRoy0a/VxdhyWbnqQ=;
 b=JZlXw+MFg6bG3cCzuEqeaAsyHsuej4wJksDzm3pXzVrhKnjkxChdV2xI2EDyPier4b/5IQfyFLBMEDe9M0OrXLRerFhtD6RSFiAF3XvDKdnUy5ZjN45JL5SQfnEsJuolQgPlAsflW9TALtr9/5f/dkj6zcc0kmZVMMS5jqCJGJPWnz8wphEpIvXCulrEhwTwnQKKK/yPuT8l65alZhRRsbYug5wdClG9kJnBFEY5IdlhqvYAxUK4Lm4Z37m4AYwVwQhRGT9+7uui2vceCF9nQ+L//icS+V0cHkG7rkb8mAmndICW31auAckbN/r+B26kDSOeJr85YDktkTCSP978jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zm4C379jvKCN7l8vEn51YQeS5WRoy0a/VxdhyWbnqQ=;
 b=iQWUuZpHlaq50DWqilg3fXNNMIrxGpeXIPElSghvYcsW8Jv9lU8VcaZc4JewznFl8PynKG1TCYzZtM2ED82L9f+wVeY5cUT1WtSEJhz7PqeYafA2XAdSNjUOppQehJ67sMZ3NT5WDLW5BTcryMsb98yFE99zLBoxYdTGP16y0gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO6P265MB6476.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 19:37:50 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 19:37:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 13 Sep 2026 20:37:49 +0100
Message-Id: <DLEFXN8E20PU.3GJN24VECD90Z@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <acourbot@nvidia.com>,
 <yury.norov@gmail.com>, <ojeda@kernel.org>
Subject: Re: [PATCH] rust: bitfield: require Zeroable storage for Zeroable
 impl
From: "Gary Guo" <gary@garyguo.net>
To: "Yilin Chen" <1479826151@qq.com>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <tencent_AA30574AC78ECFD88D7E042A49371119ED08@qq.com>
In-Reply-To: <tencent_AA30574AC78ECFD88D7E042A49371119ED08@qq.com>
X-ClientProxiedBy: LO4P123CA0341.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::22) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO6P265MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ece404a-84c1-402f-2a78-08df11ce7f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|1800799024|366016|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UJMfj/xXcTQEDNmnYhd8V0MvGPGoeBVcCf3fBG/icDIoIgXM/TmMiZUA0x0sO2tpUuynm4mWFNchkpijhsithpi5gY3jbeKlkn+6dKg3SpNnyJhFx4qVYJVshSYM9NDt9PRlOLnp8uP3QqRqPYLDvUFVXqoSOtK2EBvKoJEzbEcPaCI7WtNn0drUOFh2LU/7P6592QIQ+I5C3E6Qc85rwYvigOZmN56oXeTfz21JV24Dd8XcUuT3V0AWm1HfgXo0cWW6F/xp/wbL3aoJOuYqnn+n7Zv0x9vOpr/Ost8MZBu3HyVXpKUygARakGMaWvcOcFf7kMSL29cB09nDXlevtVMpRQnz1bx4FYze2Zut8ZpIjdjNeiNr6wsbGvg7gT3QP4YK8MBML2vF9jEqa5XqbDTOqrGhJ0dgi7wo1M/W+hj5HymROP7x9umFsygNqENXfaf0mnONc13NGEymQEkTzIGj4Z0hJCXHsF80QOBtUlJoMvntkqC1Jj+P0bgePCngLSx2EJCaniXP3DD8cLDJPd1tbxXSall//jdYPn0Gm+pjFJHycl11USM1iJ8IF5t3YJ9gvMZJCjAP5xtqGQQYWoV5qO98/+F3+Bmo+refjW3XSSciGHseZ/I/ZywxlnqnSrehnYgXNWGFHUmke6ipBKdZmX99hfgE5AR54cZ2GOw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWExUnpsOGp4OENJcG15TE1ka0dDVXQxcDM4c3pRejMwaFA2MFljWExvMUt1?=
 =?utf-8?B?enVtZWNQb3p5elBLZWhwVkZRaDFwUm5EZk5XNmVoTnJrMGRoMElzZDV1SU9q?=
 =?utf-8?B?OEZhR1QzaFNZSGRCOFQwVzJXTVFxVE80ZUQwZ1lJZFNtdnJkVjNVNkZ5NStu?=
 =?utf-8?B?VVdqTFNZRjcrTjZlb09JSVdyNm5lbkY0SXR6MVcxUTVwQWwxYVZpV0RBbHJZ?=
 =?utf-8?B?cDRzcDFnZ3RPdVNuc2Z5Yk1nUFlOcW4vMENGTFB2aDBsZWFiZHBoU08yNEFF?=
 =?utf-8?B?bkQvaFRJVGI4M21La3Y0N0xONWlSZVluZ1lyWXBwaHRhYkV1TW8ydmYyQzZM?=
 =?utf-8?B?blMxZkx4SUplTTdHclpTcmpBSjBlVWl4NFBrc2dkRFpuemdGL2NwVWExcUNz?=
 =?utf-8?B?NFlETWVIak5HYVYyd2owWGo3b2t5OGN1ejlPMXJZMVEzTzgxT0R0MmU0ck5S?=
 =?utf-8?B?YVZDZ3F3WDREWkQydmxicVBQWjg5T1ZOTFNKdnNZb0VWSWFvNG1PSjhnME03?=
 =?utf-8?B?a3VHc2dpUG5tMEdCdjUrY1NTTGhscjJaSnExYWxtL3ZxanpOMHhTbWV3WGUv?=
 =?utf-8?B?MWt2b05yRWswU1JubTVkS2NXUDlCb0Z4V21qSGsxY1RhaWFNYXd0WmpSTFlx?=
 =?utf-8?B?REE2K2lvVDJ2d2hvM0NkbDUwd0tFSW9QQTFrOWFReGVEVTFIZklTcXh4UTZZ?=
 =?utf-8?B?cUpJWGV5N0Jzbm1nb2Qyb0NQbHRkNmRuNUxiVWtiRXhWbzlLMSt5emg2dEJG?=
 =?utf-8?B?VHFzSFJrNlJ2azZlcU9XK2F3Znl2eVJtSjIvS2VjU09iKzNORmttbXROYUk0?=
 =?utf-8?B?NG5BdXVETHFabEVxYmUwbE8rOUVCeE9BT2RneGlYU0FURkNzVVpVUW5BMzk5?=
 =?utf-8?B?bWIvemtkY0xHNUhZaE9mcTZzVDRibWhlRGN2NzlmNU5mQ1NoRS9UcEMyR0ZF?=
 =?utf-8?B?WnR4dFplNXZ6WUdwM0tRYm9PRzlTbXZWRGY2UnhHeUhVRyt5TnkweHJQbXBR?=
 =?utf-8?B?TnFDMTNYV0pGNXVYZFNjZ05RblB4OTNkVkxnWFRlUFNDdXliWlRBOFVsT3Jz?=
 =?utf-8?B?R1RDbkZhN01XZzF6V1NJekdqSTJ6OC9iOFVabkE0Wm9xaW5JSk5xWkxwYnFD?=
 =?utf-8?B?MWJWaFp2UlJzQUZXSlRhTFBubENjVUx2T3lhWEN1MkM4QXZLQUI3TTV6bWhw?=
 =?utf-8?B?bERydzcwbW5oRFp1MDhyL3lrMkV6ZytzZmxGeE01S0lTeEpESlRxbFpZRDV4?=
 =?utf-8?B?Tlg5c3pQTm1mRkxqaW1EbitkU1JLQ0RSWExjWFZHYWlXUFZFMmhCZStmNEZv?=
 =?utf-8?B?Y1N0eGZrRG1XUXRqVkZVKzBDZzd4M1phVk9VL3lLTFNzVEIvU2JnR29nTGNv?=
 =?utf-8?B?ZVRZRkdEQjdnVGYxZ1liL0hPWFFBSVY1a2x1NDAwb1R3RWN4MVNyWi9KVnRK?=
 =?utf-8?B?WXJtV1BlakNPa1lqTEVnVk1FeE4zMkh6Mk5teTBxSXhzWm1hdGZVYTN5dmp1?=
 =?utf-8?B?bHBwYit6d3pnOEhORGpKaFFoZzk3STNNODFVeGJTQ1F3KzFwVHJsczVqMmJZ?=
 =?utf-8?B?LzAwOVF5ZDZwYy81K2lsOU5EY2xWb3prRjYyVEdpZ25OVWl3czBXblo4dWd0?=
 =?utf-8?B?V0UxT2JyNXNVaFJVak51dWV2dDRkLy9WUEVQYzB0MS9INm5UOGJxTG5EUmJ4?=
 =?utf-8?B?aFJtRHFUSUFlK1JWZkdWc2NPY2lad2lOc2lUeWh4cE1sVTZ5a3VscHVZOW9r?=
 =?utf-8?B?enMwS3dQaUpSQ09iMTFFOE9DUnJDWExJaFliN0RxWGtNdDhlNG5mQWxQUk1D?=
 =?utf-8?B?VTJIbTMweC85T3J6UlF0b1lHNXB5cnlMVnJNRnBuU1ZKUjhPTHhXaEM1bi9j?=
 =?utf-8?B?UUJ2eVUybW5aYVlBUEtkKzN1RVFJU2s0eEtCeVY2RkYzZjdiaU8rU241R1Vi?=
 =?utf-8?B?MEI4LzlZNHNpN2t5aUZCbVNERE5wQjM1bHJldUJINWVIYm5iL0NYb1htVHla?=
 =?utf-8?B?NHFSRzFKTXJnYXI2eWt6a0E5Zkx1ZGRuNGt1b3BTeHRUWEEwaXlET1kwbW9L?=
 =?utf-8?B?N0JMNG10dGJqY0pmZzc5eUt0REpsR0s4enNYUU9pMWlTZWhlSVJyUDdyUWtp?=
 =?utf-8?B?WWNtKys2cU93REd2cWNVTmhXaVVjZXpqZ1h4aWp1TkdlVHB2aTNuWHlzSktJ?=
 =?utf-8?B?eXJWOVdIL0ZwT1NvTVZXUEtHTlZmZnRNWUpUaVkwWWlGc0tLb1BEVkZLS0Zw?=
 =?utf-8?B?dGtsZXBCWThhM2wyRFRiWXN3VFBCUVp2TXp5N1ExZTcwMzNGMkJxMGp4QjNW?=
 =?utf-8?B?VXg0WlA5RWVBeGxIbXREVTVIRVVOYWtZOVUrSUxSYllBaC9lYWoyUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ece404a-84c1-402f-2a78-08df11ce7f15
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 19:37:50.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRE48swFVR93DWm+7QqJyWmSb/roKR+KvNL8QFryc+cRK42VRkvJ7V09WDMGSDM/DASNw4kmkj6UjdLuvzC9GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6476

On Sun Sep 13, 2026 at 4:34 PM BST, Yilin Chen wrote:
> The bitfield! macro implements Zeroable for generated wrapper
> types. This assumes the storage type accepts an all-zero bit
> pattern. However, the macro accepts any type and does not encode
> that requirement.

How? The bitfield macro will fail for types other than primtive integers.

Best,
Gary

>
> Add a Zeroable bound to the generated implementation. This prevents
> invalid storage types from obtaining an unsound Zeroable implementation.
>
> Fixes: b7b8b4ccdad4 ("rust: extract `bitfield!` macro from `register!`")
> Assisted-by: Codex:GPT-5.6 Sol
> Signed-off-by: Yilin Chen <1479826151@qq.com>
> ---
>  rust/kernel/bitfield.rs | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> index a0d0894..3dd4dea 100644
> --- a/rust/kernel/bitfield.rs
> +++ b/rust/kernel/bitfield.rs
> @@ -330,8 +330,12 @@ macro_rules! bitfield {
>              }
>          }
> =20
> -        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
> -        unsafe impl ::pin_init::Zeroable for $name {}
> +        // SAFETY:
> +        // - `$storage: Zeroable` guarantees that the all-zero bit patte=
rn is valid.
> +        // - `$name` is `repr(transparent)` over `$storage`.
> +        unsafe impl ::pin_init::Zeroable for $name
> +        where $storage: ::pin_init::Zeroable
> +        {}
> =20
>          impl ::core::convert::From<$name> for $storage {
>              #[inline(always)]


