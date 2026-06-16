Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020099.outbound.protection.outlook.com [52.101.196.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7D52EEE68
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781624902; cv=fail; b=EfoI4bu9ca9tLPvhD7ElN2YxqVJMkvRlm4Rx1w0n/jvTAgVZc8AcP7tZfXBGQcLc4KdXu05UY/JuxhyeRboBcBdHibtF4I1hh3jtlzmh2PSUSAVApyWwwmvo3a7VhlSJaPEM6feZCxr7pasgaqlvyoLRvM12TpohNIILvsBzmp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781624902; c=relaxed/simple;
	bh=76722t+u/fyVq/S/LOgY5fC7LGsYEy8quJWGxPuxvWE=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=qrYG8zWNibQGIcPdTPzkusL7TxsBnjJOTKEUlG2NXzcKWjPn6+Avc6meHmfvDxdlo0hzzVsySvCqNGS3xvhqM8of4RTgqq4Po8l4hg4LM08z2iuInXamUoqqbVucYQLltrakpO8VhTh1N5jhkV+A7JZtW92XyhvaX6Z1oM4Ihog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=b/lNG3W7; arc=fail smtp.client-ip=52.101.196.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="b/lNG3W7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ap2h1Pt58vVE42YPbXxVYrsRNRqswTNSnpIf0rFoiMDXuBiEpJnZY63VHWfPKpnZxRWLSF1YEruDKKFAVal7PIMfKeR30XG8Sgd/h8qKqq93ornM733lOYjKOJnxaUj3wcCFxCLB6nCYb1LCvdNyUYFWWvA9zuEWHxulkG5rVl17haxpkkdrpvzhALf0Dm7dnyUzyzeVbkU/VeoRqFEp0REmELHKIMjp4f+RMDmrCJuaLRTnWDDn3SHmCmd5VCLiq/fBquiZHcr4Vbn4Yb+yl4Vz7rpZ7ulUzId3GDkXpS5rDrsguIQZmTvema2boZSr3WnlvPj5h5UbMHlyY0dD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nMJ65ghbfQsIZeSGoMx0CEGlZ7VotfwDakX0owrF7w=;
 b=dqY3hjzi0tlhRQf3AGzA8D8kiaMdDa28qbYI/WP8lIDZr+bB50BvpuvduSj59S/MKvoJLHN6W9acfld4hx6katd4CfiohEGBKvEtGXrvtwH7NedNfY8+QruDfY1BZpiL0QSxFm6vxaOgus+59CkvTl55bg1VXj8bTLXCFlkdfzCFBTqLpa8RfncV7lIwhrYn/8G2KaUwkdXtEXfeAPuY1PaYrIeXeFEZjpZlCFU+n/qvCB6kgZ6XIK9HHxbKdW+Gnj+eMF2UHjCXs+3BQbFHXhhuBb7ikemCdLKf5P8jeCxsLsnUEIgw87AzubDYKORDI6d0WhXLlwPjd/GEsGWJ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nMJ65ghbfQsIZeSGoMx0CEGlZ7VotfwDakX0owrF7w=;
 b=b/lNG3W7Iy2vWOjZOA4RkvQg5SsYqpaaOQAp70iaQ16CKVS24ZuizvStvo4JVBhIpiVaIj8Ual+arXcYv8MceOUD1tVxWuucKb//IAZdspWe7UBqLY1ZUphldEB/SLNkIDobZrTNeBOJmHRTFYppsS8bc5DqU78QYbzDWIQw6YQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB9111.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:497::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 15:48:17 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 15:48:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 16:48:16 +0100
Message-Id: <DJALBE5W3ZZ6.2NRHWTDZPOC41@garyguo.net>
To: <sashiko-reviews@lists.linux.dev>, "Gary Guo" <gary@garyguo.net>
Cc: <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/3] rust: kunit: use `line!()` inside `kunit_assert!`
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260616-kunit-v1-2-b191604a8d6b@garyguo.net>
 <20260616153845.32B241F00A3A@smtp.kernel.org>
In-Reply-To: <20260616153845.32B241F00A3A@smtp.kernel.org>
X-ClientProxiedBy: LO4P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 6544e933-195d-46cc-0ba7-08decbbeae67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|10070799003|366016|56012099006|3023799007|5023799004|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tiDdWxHEqDa70LrzKvwZbWIDjINns+uVCb5AgbPs6Rg8BKB5z6VDEwKu21Z5TjCCMtHBb/keB4DRepi3AGofVxphx4CnV+qiTkQGJazseRVAC6OOUfVe02YK++l2+6jzPC7Z3nJ/xnErFdDmVJSg8af/QZL8k6K+MNYQ1oraHqcqj9MHV8v6GChmRDVbpadT9ZqXZkcCpkhLA9x5mfkrTetOpwdscCT22g12RcQj1vXXGlOu4f1LjMPEtqe69cCkg0x8WK8mbg7Sk5TqTMB3Imv3fcjrHD3EZunQs/EpIJAxdsoDHqdtOikpHaq55OtEjUTpwLmynZ6UcB69uixkbfV/+X+b8VvZ6NRFzPAsE4JAZk9+xVOVww+KCoYz6V+ylsxwwOaSEGRaztvKDJ0Wrn9q99KkzoziPwQyjnSyc03wSOFtRMB6Xs6+2gF25ObUlz0OZ5TIW9/BNgugW6ylYvfBmnj5Inj2fa2vzJEdIjXg8lUYh7/V1h4ekPaG8DJUuVXYToO9BuWbFa8lC47wPnu725LjML2QM9wu3t+HygIkoFJIc7OHusWC4+bRMGF6xS59GLvzL1dYooUkjHGk1Sa6I+jOXoaXroe7uGidPT0Zud5DCyDoJTmnB4jvqXhdWfc/b5AEkpZU0uE7C/mLSduj+KFkjrtFk5CK9bA4VzenKEoSqlY+/zZoeCWeobMp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(10070799003)(366016)(56012099006)(3023799007)(5023799004)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHBFTFRZUVB4dVlVaEJwRDNIcGZwUnFodDdjUEFzbmRZcm5xclpBR3ExS3Fq?=
 =?utf-8?B?V0MvNVpVSHhmQjdwSW5XWmxDME85SzgyT3BFUDcxblg4dGpXamp3WndtMHc3?=
 =?utf-8?B?K0x2ZmJOcy9LN25PMDBkQmVpL3BJTHdldmtiZVNNVnZhbVNobjhzQW93LzFy?=
 =?utf-8?B?RzlxYitnc3Y2eE5pakR6SUlZM3hTY3M3R2NrMVVmem0xb1gvNjJXeGwrNlV4?=
 =?utf-8?B?YnU2cmdvSnlBZGxXdXRNY3dpZ05tWmNsbGNKbHplZUp2NUQ5aERYZndkV0dV?=
 =?utf-8?B?c1NlVE4rWjdUYy80VDUwaWdZS1dXV0ErRHZDdi9BYnlyTmViT292NGJEWTlZ?=
 =?utf-8?B?aUFIdkZLdWt5UHhJQUJjWGF3VWJpN094MFlDTlZqSEtSQnNQMzY3RCttTy9h?=
 =?utf-8?B?OFc4Mkxhc0xOT0JTL3ZDM2pPdklhVERZK01QcDd1c0U5Wm1GeDFsM1Q1azJ4?=
 =?utf-8?B?VkU4UTlQT0FZazQ4aGVvZWFESGFKM2EyNGR6dXBPUll0UkhGMEdaT1B6dlhz?=
 =?utf-8?B?bEFydk83Q0NZaEI5UWpNNEk3TTdjc2hxeEp3QS9DcXdXN0svTGdrb0pid2FJ?=
 =?utf-8?B?WDdZZVFheG1qV2ZrVHFWaEU3N3psUVExQlRKK09sQUFGL1V3VzFWei9pQU5E?=
 =?utf-8?B?ZEJ3ZldhMk14ekdpbjVWTjN5ZmNzaSt0TGYrZzZSa3hlcE9VeUx0T2VydXVa?=
 =?utf-8?B?TExQdmtnZENiK0plOW0rekEwT3F4ZXlXdGlUdXV1QXdMeU5zSHFnOG1vVVUr?=
 =?utf-8?B?K3pQQlAvemRJb2VBUFlFcC9ad3cwZXMwdnZmZ0VxaHhlejhheWllRU5XbkRN?=
 =?utf-8?B?cGlLYnc4SGFhaUY1aGdxSDVMUTRiVFVUbEcvYmk5OFF5TGpyd0ZWQzE1TFVR?=
 =?utf-8?B?VjA3aHltZnFqMDBqYTRDR2I3SE1VdVBiZjB0S0tFVzlQY0lDVHZKNjRiN3Ex?=
 =?utf-8?B?SUMrdHVVeEo2ZzlYQlhKRUlUaG9aalJxRUZERjZia0xBeWZERkh5d2JKcTND?=
 =?utf-8?B?MEJONVliL2ZRTzJXbnd3WTB2cTdjUkdXWUlPdVR6NERKMkV1eWdPK2pMYTRh?=
 =?utf-8?B?WTFvM0ErQ0xlVGJ2RFVjcU8rUUNvaXFqd0lvT2g0dUdSMHZmbWtoWVhMc3Vs?=
 =?utf-8?B?aE9XdE5vT1JWaUFIT2VScnB5Vnh2Ty8yWFJBMGlNVE9aN3VtcktvQUtFRkFQ?=
 =?utf-8?B?UGlLUHZocFlpVGRNVjdiM0Exckt4TGpHN3JJRXNNaDg0NU1EUVEvZG9jQmlt?=
 =?utf-8?B?TmpXZ1NVbkdJd2xnaHJGRjlyY2NpWlJwQy9yNWl2NDZpTFVIajRPcTh0Uzlj?=
 =?utf-8?B?K0pJZ3g0UnVFbzE3QzZjQ0RtVnB1MkJ6R1A1VXYvTjhXZUc1RHMyNVVhcUxz?=
 =?utf-8?B?a0JLdkY0R1VLUENOYmJLeUpZbml6NG5yKzlKK2JRRW5LNVAzbUFuTGlUeTdw?=
 =?utf-8?B?TjhjR2JqVnNUMVY1VWhJcCtiMU5OM3prKzhSdlJObW8zSkRsSnA5UmVHVjFK?=
 =?utf-8?B?VUtNYmpUSnVoS2pFSUFzeDJQekt4ZUlKM2NVZVNkcm5MQ29sT1AxU2o0eGpy?=
 =?utf-8?B?QysxeUtZVVpBUDNQT1ZTZkpkNDFDUmo3RWY0anlTQnpCWjBjeDVJM2w2YTRE?=
 =?utf-8?B?Z3BSUVZxOEptcHRrVFpJZ2xMelozQWw0NUtlVEFrS0IwWW9GTHYva2tSVW15?=
 =?utf-8?B?Q295Mjd5MnB4NzViQUNoTEI2eEhuVkc3UkhUcG9IM2h1V3Fta1JnQzBLdE53?=
 =?utf-8?B?SHJKNXgvR29hVGx5ay9oVWJXSXZ6RnZqbWY2enpNd0RBL25FZGg3aWl6Nkd6?=
 =?utf-8?B?aUxTT2lOZkRac1YvNFQ4TGhiMVIvcmNQL2hYbWN1WkNlbHA0MHBkZ1M4cS83?=
 =?utf-8?B?QmNYSWx2YzRPVGRHUlpTVC9OOVdmeDFrZGxWaEdGOUx0QUFITXFlaDVrREQw?=
 =?utf-8?B?VjNpakgrc1hIeTNaQjlBY3l6aUVIdmVWNHNvcFVWV2x1Rm8rYTdlZzJXbDlO?=
 =?utf-8?B?YkJhc3dQRXR0Vi9BSEh5OTVKTDVIS2dncGVqTitSWkgzWkdnaFVZR1ZleHFT?=
 =?utf-8?B?U1k0QTRmSEZjUmF2cS8wTkVBT0RkNDUxR09NRk52YlJyQTRlNU5rUGZ0d0NJ?=
 =?utf-8?B?cXI0RUUxUDhQV1JvSEVCU1J4ems3b2Q0QVM0UnUzVFMrVnEyWjBLR2hzTWFt?=
 =?utf-8?B?S2pMRG41SDdnR0VLRXhHM0pDbGx6TmVSYmNrbDNleUtZVHJJNEVpb2Z4SkhE?=
 =?utf-8?B?YnJQTFZpVjMxSzdCQ1Y1aUlmVzJSL2xrL3FMQmdnc3puOVdEbS96MUU1eFl2?=
 =?utf-8?B?RklWZ0pFWndha2Z3aHkwcElxTXVBay9YdmtBOUVVWTdBTWE2dzVEQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6544e933-195d-46cc-0ba7-08decbbeae67
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 15:48:16.4273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgtoxAuDQVpez5FutM2wbJOmLnChe/YdSikheyCBZGNTeZLeJBiVxBrAt8qCtc75SJ5PKXra+0taa0D01wDVJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9111

(Cc list)

On Tue Jun 16, 2026 at 4:38 PM BST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Medium] Macro hygiene prevents `kunit_assert!` from using the local `l=
ine!` override, breaking line number reporting in doctest failures.
> - [Low] Compilation error E0013 due to referencing a `static` item within=
 an inline `const` block in the `line!` macro override.
> - [Low] Compile-time unsigned integer underflow in the overridden `line!`=
 macro when invoked before the main test body.
> --
>
> commit bb46da20c6822f21e525800928a1b682691c33c6
> Author: Gary Guo <gary@garyguo.net>
> Date:   Tue Jun 16 15:24:50 2026 +0000
>
>     rust: kunit: use line!() inside kunit_assert!
>
>     This commit simplifies the kunit_assert macro by removing the diff
>     parameter and using the line! macro instead. It updates rustdoc_test_=
gen
>     to override the line! macro to correct line numbers in tests.
>
>> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
>> index 157fd0634708f..58dfec66b4f69 100644
>> --- a/rust/kernel/kunit.rs
>> +++ b/rust/kernel/kunit.rs
>
> [ ... ]
>
>> @@ -67,7 +67,7 @@ macro_rules! kunit_assert {
>> =20
>>              // Use file!() instead of ::core::file!() here so it can be=
 overridden.
>>              static FILE: &'static $crate::str::CStr =3D $crate::c_str!(=
file!());
>> -            static LINE: i32 =3D ::core::line!() as i32 - $diff;
>> +            static LINE: i32 =3D line!() as i32;
>>              static CONDITION: &'static $crate::str::CStr =3D $crate::c_=
str!(stringify!($condition));
>> =20
>
> [Severity: Medium]
> Will this actually use the overridden line! macro from the test wrapper?
>
> Because kunit_assert! is a declarative macro defined here, wouldn't macro
> hygiene cause line!() to resolve to core::line! at this definition site?
>
> If so, it seems the local macro override in rustdoc_test_gen.rs would be
> ignored, and failing tests would report the generated source line numbers
> instead of the original ones.

Not sure where Gemini gets this hallucination from, with mixed site hygiene=
 only
local variables, labels and `$crate` are resolved from def site. There's no=
t
even a way for macro invocations to resolve from def site at all without us=
ing
macro 2.0 hygiene.

>
>> diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
>> index 37f4877f52e2d..acc4debe85923 100644
>> --- a/scripts/rustdoc_test_gen.rs
>> +++ b/scripts/rustdoc_test_gen.rs
>
> [ ... ]
>
>> @@ -169,18 +169,26 @@ fn main() {
>>              r#"/// Generated `{name}` KUnit test case from a Rust docum=
entation test.
>>  #[no_mangle]
>>  pub extern "C" fn {kunit_name}(__kunit_test: *mut ::kernel::bindings::k=
unit) {{
>> -    /// Overrides the usual [`file!`] macro with one that expands to th=
e real path.
>> +    // Overrides the usual [`file!`] macro with one that expands to the=
 real path.
>>      #[allow(unused)]
>>      macro_rules! file {{
>>          () =3D> {{ "{real_path}" }}
>>      }}
>> =20
>> +    // Overrides the usual [`line!`] macro with one that expands to the=
 real line number.
>> +    #[allow(unused)]
>> +    macro_rules! line {{
>> +        // NOTE: This does not expand to a literal, but a constant expr=
ession.
>> +        // Therefore code that depends on `line!()` being overrideable =
needs special adjustment.
>> +        () =3D> {{ const {{ ::core::line!() - __DOCTEST_ANCHOR + {line}=
 }} }}
>> +    }}
>> +
>
> [Severity: Low]
> Does this code cause a compilation error if the macro is ever invoked?
>
> Since __DOCTEST_ANCHOR is defined as a static item below, referencing it
> inside an inline const block violates Rust rules against reading statics
> in a const context, which would trigger compilation error E0013.

Somehow Sashiko is still pretending that it is the compiler. I've checked
Sashiko GitHub repo and it has already contains prompt that instruct it to
assume code builds cleanly. Somehow this is not working?

>
> Also, since the subtraction evaluates left-to-right on unsigned integers,
> could this underflow?
>
> If line! is called before the main body, ::core::line!() is less than
> __DOCTEST_ANCHOR. This compile-time subtraction would fail.

Impossible to happen.

Best,
Gary
