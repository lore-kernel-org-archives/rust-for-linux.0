Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022085.outbound.protection.outlook.com [52.101.96.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFF92F7EF3
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 23:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784850011; cv=fail; b=MVw/MvHe54irQtsfoqcXc1cXDC+sSFI8LYbL7YXGNexSHCygbJk60ZtBdIDMOlWlhSS6Rn09MCLsxuI2WJM78fEERaleTE3N4i89Csk5Om3bmJAQqysxQ9chax7bC+lkf5BxVDIjmrJNW81DlZNAFu/OPv2C5MOYJHPK8yFkDMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784850011; c=relaxed/simple;
	bh=1AkZ1tLfgo2d6unUChwQuie14y158jXuZT22cW+jMsk=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=gQXOdEL438egVCvv5Ke+yw1SXcjOg2QsK0VsjNdaUHcchuZhu3uaiN6cIGdaXxKNOpgP63lrR+ILg0JgFLc4qx2pKK5sA6xd3bH1gdx4yVamTFxwdiG92uYtaujuVWpg3ieoSKZ6HTHxQeqvv7r5cn+a+KMVvOiTFui0CaGL0Ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Ia34gMDB; arc=fail smtp.client-ip=52.101.96.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Ia34gMDB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pe3aES+f1HmzE5Hii8rdmt0yYRe7gNcvQzQNg2ADGTmekKSZHki1XZIPd23fRwE6JPU0p1swVt8HDL05WXEd2SKOhJyJEGt8maQWQhBE4ESPvHpcrILQxjd0np40Jw6Qj8P8oTZc+wkj4okvtvUB9EoSRzgo2u+OBsQPyVgX914FzmQyff/oLy29nWiqWMO/nsc7Ywtub59ogQcX/8VfqVRbzAOeU/r2KFaCgLkFrDXgHyDwK3xfs9GniYCLNvUCPk74Op3QFhtJqoHAO27B1UcxTaxRmMtUidOoZHO1T/h+8FQdZY4frOe2M3wNK7+8BxiJInilIW+5JurRWdINMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVZH3/6fuwZZqgdY3vHdvIy55nd/8FYhDNF3iIHlVDo=;
 b=IJfgNxekfa1wUKKHrp08hBLm1SmdDhCbNSD8fJvV3AtEFJeiCILYegn/ryVSTSnzqUREhK7419BjvTixRs5mvFafUzmGycVAzhilpgvUj1Nb+OWrvvvnSpWwokk1lBilk02vL99Y3EKqy6+GahSlF0UAC29N95CCAu4LDJkuwmRpJtVWRvfeZ5hMofQyvQfRFgvpv76koF6gEu3WuL5Dge7IjOUPjN80eetil0EG3NtbD8JhUmUvy9ooRhz0CroompoowIF5IASYFW0TJ7IPuCr09Z/c2UcgkXrokPSSB6kcaQKtrr3SDTtnsrEIRcH3P7Wvk3a+pUuGy+Bv1ErM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVZH3/6fuwZZqgdY3vHdvIy55nd/8FYhDNF3iIHlVDo=;
 b=Ia34gMDBLQ4a7L1vqrcImW5Xnjs4l4p5bYQDzMq/Sd3JczlqlNymOe9zL51NblrXbee/PLHxUl/NxzUggwciQ92n+GkGTXeyV7LcLOASFGSWsBHw4Z+GM1SqwoQfYY0CEqyrAYjjqXOUIVoTRfi0f+DQZz1y5onDWKq15l9Ul9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CWLP265MB7211.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 23:40:05 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%3]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 23:40:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 00:40:04 +0100
Message-Id: <DK6CISNRMHJD.391EZL08Z6HM0@garyguo.net>
Subject: Re: [PATCH v1] rust: bug: prevent dead_code warning from warn_on!'s
 flags constant
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <ojeda@kernel.org>
Cc: <a.hindborg@kernel.org>, <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <boqun@kernel.org>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <gary@garyguo.net>, <lossin@kernel.org>,
 <tamird@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260720035510.4048145-1-tomo@flapping.org>
In-Reply-To: <20260720035510.4048145-1-tomo@flapping.org>
X-ClientProxiedBy: LO3P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::12) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CWLP265MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: 3156c080-21b1-4e35-dc1c-08dee913b923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|7416014|1800799024|6133799003|56012099006|5023799004|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2Ps7Wh4LSWkCZNXVSB7o2ObFaJzT8jnmBoBPUrT9C7Zet49BwRSNCOJ1wjt5z3Gwx6ygchemt9Fw+r/F/zT8LsFNz/a8iTQ/9ZT7R3un8fZmFDq9GIH7OGlNZbDxTNButuE4F8I3UnCwCtCL4woj/PbghR7ntDaQnGUgU2Mf2kez3czB2ZVASbqKYx4niZWmkNiqug5cog/TKg/k/PqToNpXN29trAF/Wc83DRATLA2wroJX0F/aOp/2EPpOQ3hZKJdKL5JC2mdhhES/0JbxK8VfoKeGL4tjct3RuKYAN32dlTabLy1jUdc6QUijzLKmT6adOD3eaTKLwgeaSN9DdyYdXvfa5ekXu3EUfXbUNAAB1BpYyfDYWP9RVW87YOdidlOc3Nr3f3rzVY1WMoOC8ffTzcTU3Ow2Uf8IX69wSAsZMKCctEKhyDNBmM6iTlKhlhFkHfKPqcTmwtgpSRkjfzFYLTMC2PElInLIi2xxYJWj18GfWt84dznlOALii/+G8FIMJJZY5nt4dYmY62U5qcUEyAXGKh+kHhwp8aJAItKdBJGa5oO3pbY0ROAS+QFl4rwoYVYaocJeVnlxa++lt/GNgAq7i4JVDofllj0rBhPhizJnd7heCdXjmL+VL8PMFtTPWNRmr3kNEblpGiJ701TjWTwe/ikg+4BObPFnaS4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(7416014)(1800799024)(6133799003)(56012099006)(5023799004)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THhqRE0weHVINW1odTdvbjhKdGRqeXRpNng3R3JES0xaeXd1Uzl1VWtZS0lh?=
 =?utf-8?B?R0lwbmh6K1JsOWlvVlp6QktJTERIdGlGK2VMRXNmNkM2OFpHeDRVY1N6dDVE?=
 =?utf-8?B?UHBRa1FqVVFpTkpaeS9ycnBSZlNKR3ZoNzZBNCtQZGlWZ2pNVHJGSGVDZnkv?=
 =?utf-8?B?ck8vVmZRL3BlbnpCQ2ZMNEllSEdlRCtvdW1GaWRFL1RWbE1xMHJQWTRZODRh?=
 =?utf-8?B?OWlxcHBaS3M2MnlPN1N4TGUxanN5VDNseHdEbno3KzQ4Z0xpckRrVmpXRW9i?=
 =?utf-8?B?L2c4ejd1bExFRHFnWExqazh1bkt4SnhNSzZGSFpEL3owSjRBWXVvRWNqckd0?=
 =?utf-8?B?ckZ6NUsyVmlWMkp1ajlBdkErRzFOdUlHSmwwaWZkN3VZOVRxd293T0wvb0Vr?=
 =?utf-8?B?KzltSjVFVXJqSlFseUpPRzYxbWQ4QWJucmhPTjVGaDRlT0JDcTRHR1hhUThU?=
 =?utf-8?B?RS9rUUE3QXVhWGhWbmNrMlpkUnAwenZ4R2NBdUpHdDJ2NG1kdjRyNk1YclN1?=
 =?utf-8?B?R1JMeXVWcmRaMUM1TkZaM0hIQ0ZKUWY0NTVLeXl2S093ZVZxWXB2VWlpOE43?=
 =?utf-8?B?bXlRZ1ZHNmhjZHVUTGh1b3VQZEdvVGx4bjkwc1d5VXRXQmRhV096WWswa2la?=
 =?utf-8?B?Z0F0RHRhNnhwa0lNWW1VZG1ybkw2Q2VUTFJvRG00QnpJTUYyaGVzM0QrYk83?=
 =?utf-8?B?UDlQRGNmUllXOEFtK2tWenZzZXBoSWxqY0U0eXc4QzMrQndwc0ErN2RJQmdN?=
 =?utf-8?B?SCswSjlOVTMySFdDTDZjRm5QNU4wV2M0VTYvV0Z6byt5UytNbDdLV1pRQjM3?=
 =?utf-8?B?OWROK2hLZGtmSkk0WkVBK2dyZUxGV2svanRzem9IdVFwUzl5SzRFZWgzWERV?=
 =?utf-8?B?eVBXNWhMcERZRU5JTFFTb0MzMUFXbzRXa0VHK1JVSWlJLzNOK2ZjbmM0SzVI?=
 =?utf-8?B?NlR1SlBhOGhZdXVhR1NpNGhYbHdYYVA1eXZpK3Zmc0c3QUFicllmZFQrTXZq?=
 =?utf-8?B?c3huMVZEdDdLOUVESWcvYjl5K1pvd1JRclA1OFhDdlBzSVhYYmRYTXE4eUc1?=
 =?utf-8?B?U1NZdWxkdEJ6MEYzMWRzcElldjgrTUxXTGY0SWswL215YUdIL1RlZlhTdmNl?=
 =?utf-8?B?Skx2UENrU2o3dEhyZUlFM3k0My9BckVpNkE4ZHNmSm5NN0NxZkIvbXhDNHYr?=
 =?utf-8?B?SnRydmxQa3MwZjE0UVZ4bU5DVUxYYUNDbHlHVUZTbGVnMlozUmRiWlJXaEdk?=
 =?utf-8?B?VXF4ejExUjR2SldRbWI3M2Z3bVBWK3VXcnRrRXNqamNXNXRxL3Yyb0hWZzUy?=
 =?utf-8?B?ODR0U1g5SFFJMkJUY0R5UDNPYmVncHUyYXdGWStGZ2UyY3NRRk9hL2tKNXU1?=
 =?utf-8?B?NXZTOTNXLzVwVlNFRjBuMUx1TmVpTER5czYvTm41czJuNC9vci9RelVEczc0?=
 =?utf-8?B?czVBZU9QSzYvTFpoNUVub25GcWkyeDFJMC95LysvT1BSeEhPT2FoK1laYjZM?=
 =?utf-8?B?aHQyVzUydDlqL3N6b21iN0hoeUVQcmFPWkxZa09iVWpHY25zd0R0UjBZU1Jr?=
 =?utf-8?B?eVZaMUwxLy9hbWk4RjEzbThyNjhUY3dyUytPWHMxVVRaaG9FMUhGaGJkYWZG?=
 =?utf-8?B?Ni9NdGl6WkMvQ2NZOUtlOWdOT0hQSW9CcDJ1N2xQTTlJSzZQdW1KTkErK2Q4?=
 =?utf-8?B?MWUrOTF6Y01CWlAxdGQ1Nk9GK3ExZkl1SU9LZFdtQzlTS2tYVVZXcU1XZ3Qy?=
 =?utf-8?B?MWF3NEwyblRETVhrUlAzdUFrWjljWkdaMVgrbTkyOXRIY0toUGdvNEw2YVc5?=
 =?utf-8?B?WnFBcUZGVlJYV2FhWkRNamFEY2Exd3FabVFKVjdSZ3dvZk1FSjV2WG44S1gw?=
 =?utf-8?B?Z3BXWFA5clVDK1ZoWFJuYnNabHNnZGxUYXVBaklEbHdUdThxK3pxbjZOaFF1?=
 =?utf-8?B?K3JWeHJITUxRcndYdlVNeDRTbEZ4a1h0R0pMUklqbCtzUEhSV2w0K2k1bFpw?=
 =?utf-8?B?K3NqRE83Z1NocnBGZ05VUzMyRWFXMHJwT2EybU0rN2ZtM21CMXdTSDRUaFRx?=
 =?utf-8?B?ak9mOGJNWEIwVUJLbXk2dDZicVhjdURXb3RUbXlvS2l6ci91cUp5Z2ZHZUJu?=
 =?utf-8?B?UWNVTTV5QUFZdVZFQWpSdmxMcTA4cmJWK3NKQmpzT3FXRWZWU2lRbmlUTDFw?=
 =?utf-8?B?c0xnTVF6OEVuTDVkREowa0kreHRoV3lQK2wyclBIUEswNnM3QUNNTDgyMzFH?=
 =?utf-8?B?QWJGZjFudWp3MUJwN0hCdWdqYkM4UkRldmtpY3N1RU5lZDVWZWJ0azMzWVZP?=
 =?utf-8?B?NjQ3SHdRKyt5TWc1TTd3Uzh0U1h3eDFXcHhTUmtQUkticGt1Vkd4UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3156c080-21b1-4e35-dc1c-08dee913b923
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 23:40:05.3658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSL3YeHNkmYA97kL7CkgRlorN5JAcM02NG+DfzCFVbyBjFGlS0oT4XSJQfOQUGk/6bXFgz7PT+apT4EYTxFgCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7211

On Mon Jul 20, 2026 at 4:55 AM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Fix the following dead_code warning on some configurations in an
> atomic development branch:
>
> warning: constant `WARN_ON_FLAGS` is never used
>    --> /linux/rust/kernel/bug.rs:126:19
>     |
> 126 |               const WARN_ON_FLAGS: u32 =3D $crate::bug::bugflag_tai=
nt($crate::bindings::TAINT_WARN);
>     |                     ^^^^^^^^^^^^^
>     |
>    ::: /linux/rust/kernel/sync/srcu.rs:106:12
>     |
> 106 |           if crate::warn_on!(
>     |  ____________-
> 107 | |             // SAFETY: By the type invariants, `self` contains a =
valid and pinned `struct srcu_struct`
> 108 | |             // and `srcu_readers_active()` only checks the active=
 reader count.
> 109 | |             unsafe { bindings::srcu_readers_active(ptr) }
> 110 | |         ) {
>     | |_________- in this macro invocation
>     |
>     =3D note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by defa=
ult
>     =3D note: this warning originates in the macro `crate::warn_on` (in N=
ightly builds, run with -Z macro-backtrace for more info)
>
> The warn_on! macro always defines a WARN_ON_FLAGS constant and hands it
> to warn_flags!. On configurations where warn_flags! does not reference
> its flags argument (the LOONGARCH/ARM variant, which only calls
> WARN_ON(), and the !CONFIG_BUG no-op variant), the constant is left
> unused and triggers a dead_code warning.
>
> The warning only surfaces for callers inside the kernel crate itself:
> uses from other crates expand an external macro, so the lint is
> suppressed there.
>
> Rename the constant to _WARN_ON_FLAGS so the underscore marks it as
> possibly-unused, matching the existing _COND_STR constant in the same
> macro. The name is still referenceable, so configurations that do use
> the flags are unaffected.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/bug.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
> index ed943960f851..2fd7ee25abcb 100644
> --- a/rust/kernel/bug.rs
> +++ b/rust/kernel/bug.rs
> @@ -123,9 +123,9 @@ macro_rules! warn_on {
>          const _COND_STR: &str =3D file!();
> =20
>          if cond {
> -            const WARN_ON_FLAGS: u32 =3D $crate::bug::bugflag_taint($cra=
te::bindings::TAINT_WARN);
> +            const _WARN_ON_FLAGS: u32 =3D $crate::bug::bugflag_taint($cr=
ate::bindings::TAINT_WARN);
> =20
> -            $crate::warn_flags!(_COND_STR, WARN_ON_FLAGS);
> +            $crate::warn_flags!(_COND_STR, _WARN_ON_FLAGS);

Hmm, why bother adding a const for this rather than just invoke

    $crate::warn_flags!(
        _COND_STR,
        const { ... }
    )

?

Also, the proper fix would be to mark it as used in the `warn_flags` macro
that discard the expression.

    if false {
        _ =3D $flags;
    }

Best,
Gary

>          }
>          cond
>      }};
>
> base-commit: 880c43b185ca52239e75bc546cc4f4d9154d0fed


