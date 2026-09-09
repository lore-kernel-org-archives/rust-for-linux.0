Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022116.outbound.protection.outlook.com [52.101.96.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3F858039F
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963925; cv=fail; b=LGu8LY4Q7EK85rEgjIkFW1GHTadc9TLFIqZtJ3IpZmn+HoDsDskv1FE5iSwjQMzpeQhtzrHRE+aF6QkbGbATiPzQPIYXcFQUEncskX3Iip9yV9ovsZ1IMh2dMReqqWTjuWE7dhlFszDhW8Ci0iv8unhA5ffghMVTqO2qNLDmy6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963925; c=relaxed/simple;
	bh=AvHrGawOfVaFhZKMuu/q2dTVCIs0Unsb90r6oasUJPw=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=AHl4JT3W+/+T9PprydvRkySVBZz1GvdB7k1NvcAgHnaoe+ECiAVpcFrlmgABWix2RuGOuouM4EbTBpgDSU8f2qhAYVsVMsSzefIiAoZc9zV0teJQYavCdDk71E54veheGAOrm/mKZYzhIwa/b8vyVCUD3DvFdgSJcKB7VD450WU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=y6ZXiSom; arc=fail smtp.client-ip=52.101.96.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="y6ZXiSom"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E560TGDJCdeACq0RPZ45rB2pQ/IEnSaJbbViM8ehfrT1u2Jmf0qYGOJ8a2iNw+E5PcY5h6vo9lSx3UL1+3sqjKn1Oj3vwaGPa5XaaBGnUoPtnWGNkeo8l45qZbXFu1xtTdWg6mOpFuymv9diDBbBzI44qJjlBOWKlu6PMgd3ctDC7Afdpl/8Ge6x5mQ03qP90CbSJYlRDEIbI8EUvr98Cg76pDGp9NNohyP0pGNWLoQHOPFqV0bp8ldO2Lf/vXFRWEiX5RNe8xSVNOoj2uu+1O5cGceROoyjhpF2hhaKPlBsm2pRX/ndCp1ubCBiIS/D47mfeBeacslF5t9p18949Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuSZjar1QlDGrY3m2YO70Op7Y9iBcWfKZhVllkjNXno=;
 b=asKxojlJ6jfdpXECP/BhAbclyxCjZtKOubqhhvpKJE+tnkvKMm4mxMd/zcyLDYNPkceYSu71xKo2RZcttZvnj0ahRDSZnXApJlPL+87UgsJng4mFfhxBIH/m3+TFJ5yDKWBHFepuGRKLp9ULEGwxczPp/R7WHJaafwx5Ci6wT08thNKSm08UKhEOIaCLES5HLhdOM9zIZb3Q4GrVCJHDf8KfohZx/w1uGLGNbBTyxMIqD6A/Jga38lsQegLOktPepcIr+Slo+C+XrPGAaGCLjinDwALF14uHf0uGTKyzbOT/cFEEAYpjrie81mYIToc7fFiPVZUlRecG4ilDDR9GRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuSZjar1QlDGrY3m2YO70Op7Y9iBcWfKZhVllkjNXno=;
 b=y6ZXiSomIs5k5ZSfMTsyeTOhhrxXvwc0USElL0h4W/sFWlD+enks1lQhkGwJrsV1WHPd5GRvTK6IS42ruYSdl+6rIjrqkCOFbiElbF6T89TV+OHS/sWh810MMjnBBycATDZDVMLAeUs2C7F2wKQU7Si1MswfyDP4pQjQ7odt2zw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB3602.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 14:25:19 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 14:25:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 15:25:17 +0100
Message-Id: <DLAUS65AAH2A.39ZT3OE05AR1K@garyguo.net>
Subject: Re: [PATCH] rust: kbuild: export symbols from the `uapi` crate
From: "Gary Guo" <gary@garyguo.net>
To: "Alistair Popple" <apopple@nvidia.com>, <rust-for-linux@vger.kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Asahi Lina"
 <lina+kernel@asahilina.net>, "Martin Rodriguez Reboredo"
 <yakoyoku@gmail.com>
X-Mailer: aerc 0.22.0
References: <20260909060623.888777-1-apopple@nvidia.com>
In-Reply-To: <20260909060623.888777-1-apopple@nvidia.com>
X-ClientProxiedBy: PAZP264CA0081.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fa::13) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB3602:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f9c977-a3aa-424c-6fbf-08df0e7e2cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|10070799003|7416014|376014|6133799003|10067099003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0BEqObCaoFDodkPb87V9nbid6uoBryIcNhVSZ9Pw+cZ9l8ZSKVPQidT4a/N2DRLg22p5TRNvnxPepdXb8ADb4mS+1Skf4ZhBdEEpQWBPh9nI5vGSpjwb6NHqjDBls8SZ0i76F4rv5g42EuuQk7OAfNQM8qg7C24Fdq5x6tdaAPNVZm2orURq4wh9PMbWcCsq5v2risbDZ3if6O+/A+F8xiFGVokGCp7tq95Df5j5RK9eHihIwepXALILrUmpsDrgGFT3bnG0FOHmMM+jR11LdUsc4bL1VkKqw6Dz9oEcJ8jM6yRSaOwmCu9PQx4sa7EoLpHXw1gIeRs7xh8gm3ieV+2kZ39oFQR7TCcNHj2AQ9NDiSUn1o9Lj8IM1BtXN94r45r4LhkrZ9s+cF+BmAASBwdp/blFXrJX1T38Ldmdvj62jtTjhYgNtqqfpfaNyicxVe8tkbL7f2Sva4gt5eh1A71fOmFaMUFgx/NceSBuRN0yMW8M10GWQkDORGNvMD1JVBMm/3nXj5pCHq2fOSrKwyHLqgqMQQKKxnY8W5n6Umg7eK9zpH1p4D6Fd1u8IxmwfVZOckbijmip6ewIuf07fyLl4iuW9GsMeVhKN6zIBoyEuXpW3G6+VRtGnSDujlkQ2oZlQw49jZjZfb6jPjR9Wh8lS/eQczVzrszrHGio/gA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(10070799003)(7416014)(376014)(6133799003)(10067099003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlBoVHBBeEZJNlJOK1J4Yk5OUDVEUFgwZnFpKzYydjBVRXhVQmdHSEttL1M3?=
 =?utf-8?B?QXVweVhkSzRYd09FZzNJY2RaOElKeGlDVDlJZXlTL0FvZmNuRnRQTjZHTzJT?=
 =?utf-8?B?TDVpUTN3MFB0UklEY3VCVktJTmlhNE9zVUd3SzhOcExTYktHYnFYZUFzTWpT?=
 =?utf-8?B?Yzc3Z3JKK3JZSzAxUVA2M0hWZVh4WGRBUnY0NFU4WEpxamVJeit2aXZJd1My?=
 =?utf-8?B?a0t0czhvNlo2cllDTTUxMGpRN2owOW5NNWpic2dMdVQyN3lqY0RvVkt5UlNQ?=
 =?utf-8?B?ZDBCak4wdTAyUHl3MXZrSUlrajdJdVNMSkNxK0RESU9ZQWplMFMrTGZSeFFV?=
 =?utf-8?B?RUo2bmg1U01IeUpSUndOT1gxQXBKQW5kemMxUUxUdHVteUtlNmY4dEVZTE5p?=
 =?utf-8?B?VG04OU8xeE9hVzRqdmI3M0FiV3F5b0oveWp0dGxUS2dqaFNYbDJZYlp3RTUx?=
 =?utf-8?B?aFN5SitTTWkvV1VnWjkzLzMrdlJaOGNmZ1ZqeW5BUGFDVVhMSXV3cjlZeHF5?=
 =?utf-8?B?RWNXaVhRZkhVUTJ2YVdZeDFkem1PZW9MeFhVV2F2SnNGUnBrNlhTUXpNUU1a?=
 =?utf-8?B?L2tsSlhGRExVRGRDK0RvajBKdDJjbVJxdy9WSkNmK1dGeG15eXR6WFFmRmpy?=
 =?utf-8?B?MDc4UmtwQ1FkWmRSVFNoUVpLUkF3c29xK3piNGJPQ281VjRSUGd0U0tHZkhl?=
 =?utf-8?B?K044eWsxUlJYa3pPMHBVdzBjYUNnbTRtUU5pTVN2THhPelE1dGNHaC8zL1lh?=
 =?utf-8?B?ZXl4YVhFUnhYODdHTXcxSlRYRUlDWTVESGV6WTZnN3BubDJVb1M3NlM4NjVr?=
 =?utf-8?B?Mis4dzNEQVlGdnQ1c0ZITkZYTnh5NXlsSU9ISCswenErZ2ZqSS96SXltT3hM?=
 =?utf-8?B?QVZqdk1nemtHZlgvdCt1aklCSjM5ZThQRTh3cFdGRE1RY3g0bkJxNlhNd2Rn?=
 =?utf-8?B?N29SYVdLcitaUnBoQVdDN0dMeUMzTlo2WUFVbUNXWGxXVS9WamZJQkZUa1Jx?=
 =?utf-8?B?clFjNElhcHNlWlVBa1hVRjlyNlRuSzgxU2gvRmF6cHM4ZU9OU0tMd1plaTdP?=
 =?utf-8?B?OWpVSE5JMjEyRkswcXdTVk5YRHNGMU1UbmtLa0VsQ3NxdlpJcFB3MCtVcFdm?=
 =?utf-8?B?Mkh0cTdZT2FoUFVtWnFFK3dkdFRVK1JsQ2djOFJFaGNzTWtkMENrUnpKVGJ2?=
 =?utf-8?B?Ykd6M0VodHpBVVl6Y1k2c0pjV2hINUNzM25mRlBpdHArcSttbDljMVlpeWM3?=
 =?utf-8?B?bGRSWDVQd3Q0RG4wMFJ4U3JZelozRWhVUjhlY3VkWkhSUGhvYnZSUHVvd1p2?=
 =?utf-8?B?R2RxdGpxZmFQU3BDNEorT3NXWGswU0xybWtabnNYQlhEbSt2L0lWdisyMTcy?=
 =?utf-8?B?VU1SS1JLWVR5dWhQUGViSTNGclRKT2tJdkxZbnk1bk1Jelh5T1UwQ0UrNXJW?=
 =?utf-8?B?K2NKZXhPUVB6WE1laExLYXk3OEdWSkpJOXRtY1owR1RSOGk2bkcvR0s0MVVC?=
 =?utf-8?B?U0JpRmwycWQ4dUw4ODBqakxFQXAyR2EwcmNIRk9peldlenJBbkxXM1VPeTFT?=
 =?utf-8?B?Zm54NVprTHlUbGF0RE1IRkd6bVZBZDFsYTNJc0ZBY2dSYzhKaDBTbThZTXRP?=
 =?utf-8?B?U254V3MraVpHaER3cUJjbXRESytsazRVT2pja0htRFFKc3YvSjBtb2ZXYnNp?=
 =?utf-8?B?Q0Y2NVNld3VYUjVDRTZlWjY4YlFKRE1xajNVaWJ1Rk8vY3A5V001NkJhQS9M?=
 =?utf-8?B?dktiOXljQVZubEp5SEtJNU8vZEprYTgvekdVQk9OZzJKWlBpMkFYOWN5NkJT?=
 =?utf-8?B?MlVOYmNlYlNwM2hRZWZFR2NuUVJYTk15aWk5Yzk0bUlzN1NsNW9leEVqVml3?=
 =?utf-8?B?OWFiZFhKandIMVU5ZDlTdVZUcENuano5bUFucDY5ZS9uTGFXU2NocmthNDRW?=
 =?utf-8?B?dUpvZ1c3Wlo2anZpa080cWQ2SjNoN2k2T1VrQmFOQVBZaWVwVEhOaDVwVU5u?=
 =?utf-8?B?MjNpbzV6KzQ4d1VQYUtGMVdGcFR2YmJpUmQxaEd2VmRMZ01ZSFJ4d2ZaYUZy?=
 =?utf-8?B?UjRpdExJS3Q0ak5TWVh1L3o5SkF1SnFvR215amYwWFFpY0FQamRRaWtqUG5P?=
 =?utf-8?B?ZE5VcjQvK2tkUFRFWExya3IxdzFwVUJNYkpiaHpFcmVjOGlCZ0pJb3BIcmx1?=
 =?utf-8?B?eWhPOUpJazExWWJjQ3pnZVRsdThvR3d3MHJFVDg0ZHhQUXlGUEhmeUt1VEtl?=
 =?utf-8?B?WDFwaGJuNTNPcXRDZE9kRWg5ZjNkTVM4QTlqTXM5dXhFLzBNc01tT0phUlZh?=
 =?utf-8?B?Q1J1dUNkOHJ2bjNoZ0hmVklPRHBxT3lKUDk2ME1LQktMZmE5S3loUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f9c977-a3aa-424c-6fbf-08df0e7e2cbb
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 14:25:19.0718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZXgDPPeniNTZxDK4DsghKL9QetIVqR0HB3ZFEVwiY59eAPnESQiU6SfrzWnhnjjp1duUAxviukiaNtV97li6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3602

On Wed Sep 9, 2026 at 7:06 AM BST, Alistair Popple wrote:
> Symbols from the `bindings` crate and the C helpers are exported so
> that loadable modules can link against code the compiler chose not to
> instantiate in the module itself. The `uapi` crate has the same problem
> but nothing from it is exported.
>
> In practice this goes unnoticed because the only functions in `uapi`
> are the trivial `Default` implementations generated by `bindgen`,
> which rustc inlines across crates. With CONFIG_RUST_DEBUG_ASSERTIONS=3Dy
> however, the `Default` implementation for structs can grow past the
> automatic cross-crate inlining threshold. The module then references the
> copy in `uapi.o`, which is not exported, and the build fails:
>
>   ERROR: modpost: drivers/gpu/nova-drm.ko: symbol '_RNvXsH_Csk9v2ZIpWbWt_=
4uapiNtB5_17drm_nova_info_gpuNtNtCsfr3MPOfBGpN_4core7default7Default7defaul=
t' undefined!

Hmm, uapi' ideally should just be type exports and produce no code.

Default implementation should carry `#[inline]` annotation so they're
only codegenned in actual user crate. Rust's `#[derive(Default)]` would alw=
ays
add that. Can you check if that's bindgen-produced manual Default impl that
somehow misses the attribute?

Best,
Gary

>
> Fix this by exporting the `uapi` symbols in the same way as `bindings`.
>
> Fixes: 4e1746656839 ("rust: uapi: Add UAPI crate")
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Assisted-by: LLM
> ---
>  rust/Makefile  | 7 ++++++-
>  rust/exports.c | 1 +
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index da1a7409d984..083992a5c1c9 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -27,6 +27,7 @@ always-$(CONFIG_RUST) +=3D exports_bindings_generated.h=
 exports_kernel_generated.h
> =20
>  always-$(CONFIG_RUST) +=3D uapi/uapi_generated.rs
>  obj-$(CONFIG_RUST) +=3D uapi.o
> +always-$(CONFIG_RUST) +=3D exports_uapi_generated.h
> =20
>  ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
>  obj-$(CONFIG_RUST) +=3D build_error.o
> @@ -575,7 +576,8 @@ $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
>  # in the crate where they are defined. Other helpers, called from non-in=
line
>  # functions, may not be exported, in principle. However, in general, the=
 Rust
>  # compiler does not guarantee codegen will be performed for a non-inline
> -# function either. Therefore, we export all symbols from helpers and bin=
dings.
> +# function either. Therefore, we export all symbols from helpers, bindin=
gs and
> +# uapi.
>  # In the future, this may be revisited to reduce the number of exports a=
fter
>  # the compiler is informed about the places codegen is required.
>  $(obj)/exports_helpers_generated.h: $(obj)/helpers/helpers.o FORCE
> @@ -587,6 +589,9 @@ $(obj)/exports_bindings_generated.h: $(obj)/bindings.=
o FORCE
>  $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
>  	$(call if_changed,exports)
> =20
> +$(obj)/exports_uapi_generated.h: $(obj)/uapi.o FORCE
> +	$(call if_changed,exports)
> +
>  quiet_cmd_rustc_procmacrolibrary =3D $(if $(skip_clippy),RUSTC,$(RUSTC_O=
R_CLIPPY_QUIET)) PL $@
>        cmd_rustc_procmacrolibrary =3D \
>  	$(rustc_target_envs) \
> diff --git a/rust/exports.c b/rust/exports.c
> index 1b52460b0f4e..434f0b73151f 100644
> --- a/rust/exports.c
> +++ b/rust/exports.c
> @@ -17,6 +17,7 @@
> =20
>  #include "exports_core_generated.h"
>  #include "exports_bindings_generated.h"
> +#include "exports_uapi_generated.h"
>  #include "exports_kernel_generated.h"
> =20
>  #ifndef CONFIG_RUST_INLINE_HELPERS
>
> base-commit: b705c185105762676aa6ec16cf976101df87cc35


