Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020091.outbound.protection.outlook.com [52.101.196.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55650417356;
	Thu,  2 Jul 2026 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003812; cv=fail; b=pmYhIdVefThSDmQgiHbPgE+yGuLve9ivqlldagCNYSx9TiEeBqRHf85A3ROOUC0cg7i6arXgo8CqKFVZHjq1ZkrqGUE+4ulY9uBxxvFCrMqZTfzZyNN5r3tiZ+gJYJGtYvCOUc357H5YPw1GccL9ONcFk51haQmnT+aZBsTSuoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003812; c=relaxed/simple;
	bh=2KiyZp/WfLkILSPf9owSGYKSnU9dqs2LtbFouJZMx/k=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=iExEVoEqku94GtDcgtLXFYyKbH4xNVbjlQE6fmVbiFs+vvIHl3gPZBVYC53e42gNeXE0NpE3E4/HIqs1a1JioQCcrzy8P2BhQOdAqC9dQrx1ZgT0GLFLSJLVctbeBe2DgarN/8hoX121o4Qcj271ZHtCVO+o/I4o0yJ0tDLrI7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=WhCZCdZI; arc=fail smtp.client-ip=52.101.196.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="WhCZCdZI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgPUQAuE+O5mV9I9f6chsUMYT8HIkx799HdW1NhWC6+0wGkX68QwTkHkQziN63p21Dsgae8tTntXTmnNR/Gge3K9o3pxx+B8ztMQuuasUW5I0z7f85Lno1ejUCbEAug+VKYTLUY0LGRjwdk8EvmNNgPZ6vZj+i+/mSDhGUKWYCHN8jOSK8LFscqZn9DRye5NrsZ+1iK2OEqrD7nunQBB56m5Ch3PkuK/5SZ2FDtnASa6mwe2TVtcEEevmpWHRSeQIo1QDODscuZTZfkcc/1mi+aonP2jz8vIhLFsWY3KgRHHYGT9Nubn30FH+2KmCGsa3fEwGUtkMMPNcAIHHQp0hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkagXA6p1QrrpQpX7xLc25ohTcoL2PcpMsL1Iukkkic=;
 b=zMQIa2pnmUYxLQ1OkqsIn8Ji9yGZOW04zLUieOsb1G0bL8//ld3Yno/OebJUJYuwOOEUO18hZb6eUyPxNI/Y3Apl40Zv6QPPrpwcZKGmfYZrAIWEROfgZLLsSvtUH4wDPL9WxeNUbSrRbd29E9OJCV5uDPW46u2zgBZ0sTRR5o0IrtbMFDjb4z+0v9GQBCR21p+PD1RjhcU4lP5K/jJ0zVZQvdQrDkYsZWfP7zeO6Lr2B7Fm+59QecJGQ1R7CeixiFzXksxAW6tQkry0MCz81KEc+bCN6IdBwNeqpl/J3NU2kpVilzUFzO+vV6fWy6Npmy6I37Bcv4oP9bLTQOSrVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkagXA6p1QrrpQpX7xLc25ohTcoL2PcpMsL1Iukkkic=;
 b=WhCZCdZIkUizM0oZVYl/J2Ad5WPLbo2sLX/7jFCA7vj4ZewR6BDRjS4X1WHCN/b1qpdQFB82B8+5vPDtf9ooN8q3iSx9++Pvc/LG8DGMIQo0P71r5mriWwaamIqHnlB/i8lp8eGq3sxtTzhW0g14Etoa1Uq83dddid4Wl2askvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6957.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1f8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 14:50:03 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0159.018; Thu, 2 Jul 2026
 14:50:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 15:50:03 +0100
Message-Id: <DJO63JFIYJ85.3K7CFXE3XK023@garyguo.net>
To: "Antonio Hickey" <contact@antoniohickey.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "Daniel Cote" <danielstonecote@gmail.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] rust: kernel: create `overflow_assert!` macro
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260702021811.758731-1-contact@antoniohickey.com>
 <20260702021811.758731-2-contact@antoniohickey.com>
In-Reply-To: <20260702021811.758731-2-contact@antoniohickey.com>
X-ClientProxiedBy: LO4P123CA0185.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: f965104c-6ec3-42d6-f312-08ded849333c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|23010399003|22082099003|18002099003|6133799003|56012099006|5023799004|4143699003|921020;
X-Microsoft-Antispam-Message-Info:
	/RwAy+vpvvj9RxUEEWWjCJdKelde2h6UdR/ZZR66k1u2ykAfZKZrx2NAzgJstNjy3Ol2deh3kwrn3WWf1ZbWx8Wf6C/8VMJEkDm5BYohut72hRr66/zD+4JqqBqVsUyOQWxuekZ1yrJ8YE2qlMCxmQmiivTZOgJ0cUIWpioFkpTCHFxk25j7+XF5xMecWR9twScDCwQ+GR3MsynIIIT8Y4k/92QE8VGQr3h8/sA4K8dDOm1GxOOfzupH3+8FgIKJRDC/9m7hVyuUR38dTovquwgnARN2s3qLAQyd5HAUuEkS16121/5I952NOHz48K3I2Wx2/0LJAPz4c5roWfeZoWSfvYm4coIsAsAG9j4hipwne/GTGCt1iSR+oK3VWJSAnrYGkU+4jJNcGBfKms5S1KrFfyRmW6BVdw9HpCFGjcuyF+mL/0Mri0ePrm1dFQAhNDY/Sq/+MnWDIX3MA22f8Ja63OTbZh3X8JeWh+99OjEAjlkUxLuxLGPtlO1YnGUMmXQR/HQ1ZfZwcIc9u9QphNUj5mY/ztXYMwck1m8nsrWubBx5EWbaKpPp6DTaW2OiKz8Q/VJHiXBc1QnlrZMTACoKDvxmVUxbZ2AuwckBrBWyMahJfqljpvYGQi1NeVrG5Hv0C0p5jf55yGNJVsDLgOPnZBfFIUwvOHmb6xA92MGQAvK504rFxd7yokzZPspK7vvS5z1DsUu3JEAijTE8jg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(23010399003)(22082099003)(18002099003)(6133799003)(56012099006)(5023799004)(4143699003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW9zRE1RaGNONFk4TEtsQ1h4K1VMcGZCS1JTNEd1VGY2elhzeEVkVWxGOWpp?=
 =?utf-8?B?bUVzYzV1cEJwMFB6a1FZaGt0UDRJeTB3aXRyQ2RnaFlvaFIrblZRM3pVM2lQ?=
 =?utf-8?B?b2hvOVpWMWhTaFc2MjhYUmhFaTlFTEg1dTVzUVluV2haczlmbTRKQzlqN3ZO?=
 =?utf-8?B?Umtsa214RFlPbVZ6YXNRaDVPTnljL3BCRUIyZFNGclg4QTdpYUhQaWJGck5F?=
 =?utf-8?B?bzRzRGsrWnV4MUwwaGtDWjNJWDFTb0U4Rjh1c2FCYnk2L0h6RlN3VVJMWFNx?=
 =?utf-8?B?NTA5MEhvdWVWbzlGcWxYR2huZjVMSlFZNVNrYlJFS25sNU1RMHJaak5HSUZT?=
 =?utf-8?B?RFVZOUI3TmxvWGNKSThPNXFZK3NPSS9KanFNVUZLVEM3MG5UVzJ4dGJnYTRi?=
 =?utf-8?B?SlZrRGtoUDBMcjQxNW9mbm5QRmF0ZDFSNFAzUmVzM2h6Z25iV2hDQ25RTit4?=
 =?utf-8?B?dldoUkRxMXRSNUxTbXNPWjZkcUNPb3VlNm1GdVArM1NMY05rZGdkUTBIQ201?=
 =?utf-8?B?YXU0S3c0OXVkS3FNdXBXQVBrTFRuekt3SGRNNStyOS85VVhPQVUvSUpwMDhp?=
 =?utf-8?B?N0pVQ3IvOWgzZ2tqcktWVElKSHdCMGNJUlNSYWdicFFDT0ZDL2VGWHFwd1pK?=
 =?utf-8?B?dEd6NFZkZ3o2WlNKVTdUVE5JNThsL1RmUXR1bitWLzZYT1pyWVZOWlFEUm1I?=
 =?utf-8?B?M3c2RjBUbUw1UERkcVU3UU1RTExPSldINEExb1p0WmVjekQvc1RMS3hHcUJa?=
 =?utf-8?B?Z1ZUY3NSWHpBM0R4cEtVVEdCa1ZpeHN6MW1sSFBHclRXY3RQUjkwbUJTNUla?=
 =?utf-8?B?bEcxQmtaYmppcHRhWmlZYXU4WEFtSVdXY3d2akRDbG1QS3hzMVErS3dScHAy?=
 =?utf-8?B?eXpJYi80TWhBejluaXJVSm1IUnVzUDA2YW5GbzBocklIOUovc0dSNTBnRWoz?=
 =?utf-8?B?QTg4M3RWSGdjWFpXRnl3dlE1RVNXRys1VmJ2ZjRMdExMVVlIRjk0ZkdkQXRZ?=
 =?utf-8?B?ZkNPUFVqWFNLVERRUHlQZHNPNmNuVE44TzJreGY0Ujl4c1AxNkl0MlpNVzNm?=
 =?utf-8?B?VVliRnIyeUxxeHRGZjIwUTAxZjlRMWJJVUtIUlg1UU1xQTFHZlExbGdhK1FG?=
 =?utf-8?B?MXBLOTZJOVBNZVJaNFBjdDRnYzdpaGc1eG9ZWDJjNGt4T2Evc21kM3UrdHZn?=
 =?utf-8?B?a2RhM1ZsQzVwclpuMTVNOWRDV3BvOW1vdWFCK1VOaldhOVJMNy9vaTlZOThv?=
 =?utf-8?B?U0wwTnlkbXVtdVpWTzVOSkM1cStvWmJsaFBzTTJxUlZQNkI5dzR2a2s0eUpG?=
 =?utf-8?B?a24vVmZNVUQ5bzFOdjdKeisweXFndmRlZlhrY212RHRuY2p1RlNwOStBem9E?=
 =?utf-8?B?bEJTMTdHS2syeC8yUjhPUDZQR1lhc1lBTkl0M21ieDVSVEFNeXptWVYxQWpa?=
 =?utf-8?B?dUlNSWxjNWhRZ2xLQWJ3L0J6T1N5U0RKKzJkdm9CQlRsYXF1eEowa2VMNGo3?=
 =?utf-8?B?NTdOa3QwK1JaSHg0amdrWk1BendWU3IxcG9KTWt3bk4vSmxCSE1rQW9tMTlZ?=
 =?utf-8?B?c3hGWXVZM1VVblkvL3RDNlpSWmxnSzIrV1ByZzViY08vdU02MzN6Q1l5YjVE?=
 =?utf-8?B?TzBoRytQTnB3Wm5Nb296N3JxNkVvUlFzenR6a3Y2NFlVVUd3K0JtR2VJUjB0?=
 =?utf-8?B?YjYwNFRxV0x2RFRuVHRTemtXaDhXQnE1T3AvUkFKM3p3T2NkekhzSjQzcU9N?=
 =?utf-8?B?SzJnaWhwRmJUakNMZlNmWFBZY2NkRjlFY0lkeXNuazQ1NzRUV01WaStONDZF?=
 =?utf-8?B?MEZxeDdnSmVuc0NRazVVUmpzOWY4YnZkQzhRckpkMlExTVRDWGVSUFJkcnE2?=
 =?utf-8?B?ditFY1A2blF5LzBubTZUQy9PcHdlYU94NXphTUkwMGptTkFqaUxXRnNjSFQx?=
 =?utf-8?B?SVdJRU5MMG9Sc1FITUgxOVZiNVJmZDUyMGlnNm90Rk4rRWlId2IwQ1hqM0tW?=
 =?utf-8?B?bTVHOC9zTHhSQzJxRnZzcXpXSUNRV0lFUUl6TnpzRitBWHRlQU1sRGtTMDdZ?=
 =?utf-8?B?elZ6SisxOWFUempJMTFpcnEzdjEyaXhIVUxHVnFOcksxaThOMExlK1F5OHph?=
 =?utf-8?B?Qkcxb25OSEpNTVdCZnAzUmhBQ1UwRlFNdWRmR0xuY3p6NjMvQ0NFWWR0RWpO?=
 =?utf-8?B?eEx2R2lKNWw0elF2K2VRUHhpZ3B3WUdlTm1zbS9SdmVFUGkrSnpjM1M4UDla?=
 =?utf-8?B?dmtUNnVxczBHaVc4ZlVDSEVYNjNxVitKV1A3ZEw0MXBzNEhXQUJhUWV3UUdE?=
 =?utf-8?B?d2tsSEFIOVByR0VRYTJ1aGp1MmZ1NWE0SkFTK1prcE5XSk91VU50Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f965104c-6ec3-42d6-f312-08ded849333c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 14:50:03.7700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zrv9XyHASPYrwH5rkN7NYiIkwL6gTj5aVtGMYSAhX09IrGrttyPlI+5x6Rn/Eju4G/GCmlB5g3yUUb3cOiXiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6957

On Thu Jul 2, 2026 at 3:18 AM BST, Antonio Hickey wrote:
> This commit creates a macro for overflow assertions, the use of this
> macro will avoid local `#ifdef`s by encapsulating the conditional
> behavior (like `#[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]`) to the macro.
>
> In addition this macro allows us to document the intent of the assertion
> more clearly.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1159
> Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> ---
>  rust/kernel/lib.rs             |  1 +
>  rust/kernel/overflow_assert.rs | 43 ++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 rust/kernel/overflow_assert.rs
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 9512af7156df..3a562b517952 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -101,6 +101,7 @@
>  pub mod of;
>  #[cfg(CONFIG_PM_OPP)]
>  pub mod opp;
> +pub mod overflow_assert;
>  pub mod page;
>  #[cfg(CONFIG_PCI)]
>  pub mod pci;
> diff --git a/rust/kernel/overflow_assert.rs b/rust/kernel/overflow_assert=
.rs
> new file mode 100644
> index 000000000000..e3e822edda73
> --- /dev/null
> +++ b/rust/kernel/overflow_assert.rs
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Overflow assertion.
> +
> +/// Asserts that a boolean expression is `true` at runtime if
> +/// `CONFIG_RUST_OVERFLOW_CHECKS` is enabled.
> +///
> +/// This will invoke the [`panic!`] macro if the provided
> +/// expression cannot be evaluated to `true` at runtime.
> +///
> +/// This assertion is intended only for extra validation within
> +/// builds and environments where panics are acceptable. **Do not
> +/// rely on `overflow_assert!` for checks that must *always* execute**
> +/// (e.g. to prevent undefined behavior, perform access checks, etc).
> +///
> +/// # Examples
> +///
> +/// Basic boolean condition:
> +///
> +/// ```
> +/// let a: u32 =3D 10;
> +/// let b: u32 =3D 5;
> +/// overflow_assert!(a >=3D b);
> +/// ```
> +///
> +/// A guard before doing a size computation that could overflow:
> +///
> +/// ```
> +/// fn reserve_for_concat(curr: usize, to_add: usize, cap: usize) {
> +///     // If enabled, these will catch overflow errors early:
> +///     overflow_assert!(curr <=3D cap, "curr=3D{} > cap=3D{}", curr, ca=
p);
> +///     overflow_assert!(to_add <=3D cap - curr, "would exceed cap: {}+{=
} > {}", curr, to_add, cap);
> +///     // ... then proceed to grow/append
> +/// }
> +/// ```
> +#[macro_export]
> +macro_rules! overflow_assert {

Also, please avoid adding new macros to the root of kernel crate.

See
https://lore.kernel.org/rust-for-linux/20260312174700.4016015-1-gary@kernel=
.org
on the way to avoid this.

Best,
Gary
