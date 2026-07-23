Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020132.outbound.protection.outlook.com [52.101.196.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF53ACEF4;
	Thu, 23 Jul 2026 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784830813; cv=fail; b=meHXHlAZvZKtMpLiEAjkUnPUceNS+IHG9VgrmAV8bOH3KjhP1/DmKFIKGjLNZGeuw+nYBXCBlwVwDwtqzF5kx1oFl1TSEQQl/Dt2727jMfWCehqMiYMDRfJ2kZDfLh+DYlni6KmqTe2My2vo25PVfPC35Y8wFz89+DecDtBIWMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784830813; c=relaxed/simple;
	bh=1+lvbRuuPYTAzwgjwLG+/9MwJXt2qVme9pfGJbjBbXM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Pc+NV+pEQCxEeINSfsv1fUTRh/Q9bpw/0cAuTrQJ6hy5I9G++ZDdAmEEwU2x9hzqTF9A3pP8RSfpekEmRkDe+QEG3OGcwZeMgirnK4kS34G/FaAFUUYYVv7+cIHM7dOFuxATtmnqOrSMoP9nF2Dm/yW4VFF25CWBRi78fTa2810=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YN8T63yS; arc=fail smtp.client-ip=52.101.196.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YN8T63yS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncgjlcrCFmpEgtFXgyS/IsA/Ma/LmkSNnW//96RuNOO03od7RNk9fS3qyCBvBq2NzHOtE5O/w/arA4TE+0gg1ztwSw+UxTr++dkNBcSZgWAGTFL/bVPdM0wGhLKExvn5KQUZWexCqzZCdyXOSL0F5ab3D0ZifWiuVWVN27oHCo4Ffi2V/jFYiBVMUezqrli51D7HJT6mw8AKLH2oz9P16olfajF1+3rREagVaPNT6mLxcU2v3GzY58Px4mWaNYd2oBGxhKTexYoO3ikE9wlBB7p3O+0qnqRAOaRDO9JJ8HD8bryUjpp3X2F4GkxJbJobyeaph894FppEMJG/m1PZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16+5Or+5jbmW4ekV5zxPTqBgYxOrYLztkChvKOiwHqQ=;
 b=Zy+nTaFj0zwelWHoJ9Bf8lh62/SqtkZC2qcpYxWDqEtrvvVQ8ABRlCzvGlxnD/mdkJKFSSGuJOT/ZHAJT09bbMiJ8Fy0J5y2ko+b9GtS/o6xF/5az/des0vKoHMSauNU5vFo74iWSAU4QKbCc77IKvxQMJxGGy5miW9iRgSNqrU8/svaoJn2knCB1Qpb94wL50ToQRdMySMj+hl5gnlUpKKZKEy/qZ9Aa/pnusUGXeXvQwD1xvofiWMdwsgAoN+o/tdAZRdQb/gh5x8e7ONEJ4eaTgO2F9LO7MaCn1sB+xqDIsORiCaO4mUFpJoB3bk9bpF1PrSecbA0zjZp8elygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16+5Or+5jbmW4ekV5zxPTqBgYxOrYLztkChvKOiwHqQ=;
 b=YN8T63ySc+bSfDH5+Wbm5Hv+TCsaqvnElSlqjffkF3DlhawfaJSgZAVl3mbm1YZIEx4TngeO83u+IFBa0reZeoIF/p8das7ZCUiH58qMyInEfdDVYbR3ItMZoVIJiO6IcFCxn4PF8S4E1p+1dT8fFocnQX1Kas+OftyhxYh2e8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2549.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:4e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 18:19:52 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 18:19:52 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 23 Jul 2026 19:19:44 +0100
Subject: [PATCH 1/3] rust: pin-init: internal: rework how `#[pin_data]`
 handles cfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-pin-init-sync-v1-1-dabe7f902cef@garyguo.net>
References: <20260723-pin-init-sync-v1-0-dabe7f902cef@garyguo.net>
In-Reply-To: <20260723-pin-init-sync-v1-0-dabe7f902cef@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784830791; l=7556;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=1+lvbRuuPYTAzwgjwLG+/9MwJXt2qVme9pfGJbjBbXM=;
 b=Q0v27zf3q3n1AjhZdWIgyHBsEXTIxStZg+B8KJIZ3lVOA5Qw1IvhEWioPk1ES9GDNKQurJSuS
 sqxWijpnocJDUXyu/pKUHAc2tl0dPzdPoOkUh4BOgfN+MCzVaboiF6k
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO3P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2549:EE_
X-MS-Office365-Filtering-Correlation-Id: e3345df0-68b5-4cde-8cac-08dee8e6fced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|7416014|921020|3023799007|5023799004|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	swdu9FKFCY2OPHZ7GNzTqHYwj9uzazyOCaGpN5ZQG3vRNDPhrcEnB58D6RIlCJQCHwOsv4hyRovJMhukqDgdkv+PGpMiSq+hEu9gv9RmSNv2RaOIJQaUJ3IdZFsd4dnmfEZ+5dcmF5/yjNqfVG0BqYRCtLvykFF7sXq+pUHU1S21kG4sWouv4vOz/JfeYUDLh6t70DJuSgJ4IApZcXe/J5EuwQSFF3JNepswbI5jTD3C5yUi4j3cCCQjapR4nL1OyHYx777kIm5hFf/84WRQJigZV4kFzCHfuvHRsVPcdQ4kMPyN4y20rnSyEznpj0pU5ds3f1kMNfDAheSfpGV1sSA6JF6h9b0sw8GbcTmk0TYmMb8hEzg9YGvEhW+7ewRGMv25ATdeytvv9KYdshfJ5/wxaLfEmaVb3jkTp1DuUgtwn9pYhVNmHAuHCoBIGIdW3nC9DzyN2Uy8INzMtY0l+qbi1BenUhiSNqhCTeGIIIf3Rw55WabG4bcmxTgRl/e6Mio16VCuLpRYNPbep4GWl5xo2T7woywOEf/Lrw4/s5z9jiSMALqP5ypFBMfMl982bIFD29ig5dKUVsM0lAlE5aVl5AoxnY1Q30Db3xdgAfHC8yEkX1dcS6Y4h3UQK1jarRrvgTbbKn14zSWD6oO1PT464KLB5MFIlpwr4GWRjmgegmve/VGnjurvOCcdy57xrclpYDcgiu8dOgGauRtC8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(7416014)(921020)(3023799007)(5023799004)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGQyZGZJWDQ3a0RtTVhWSS90U0t2NWRyWmZDWmJJQmszMWhxUnJhVTM5K0M0?=
 =?utf-8?B?dlRHdTNoNFBFcGlWVjRnLzdWaEk0MCtydVdIam96NUpYd0VUYXBJZzVwbGtZ?=
 =?utf-8?B?M3MwWUF5alZsQ2pVenFobWUyVmM0MTNzeGcraFUwamVWTDBkaGo4TnJoVlE4?=
 =?utf-8?B?MERoN0pHWjVwN3FXUzJuT1hGVFAzYnI2REVBd0psSzQyR1QxUWxqNnZ3RGRy?=
 =?utf-8?B?TER1cVMzdTgvWGNSMlVWMFFZdlRvaFlRenBMV1JRVDBINHExMWo1clVWcFZB?=
 =?utf-8?B?emZxOTljTStLTHlpeEZQSHM5VkJ4MjJmeDIvTFpkc0J6R2V3Y3pJTFFBRkJR?=
 =?utf-8?B?Wm5nbDI4TjhoZzZENDFjMXFINEZPQUQ5UDRJc2RoZWtMWWlpdVdHNjNrdk9o?=
 =?utf-8?B?WGwxbmpkbFAxdnRCM1Ewa0dKSU5sVGdLaEhBdktKa25jdjJ3QTBqY3BObVlD?=
 =?utf-8?B?czZKTDIzUUhMRmVZS1FSaWJFODBYRjg2RXUwUnFUdHp3MWl2TzBSU0libUVY?=
 =?utf-8?B?Rml6RUxodUtqWWpmRVJJdTBQdGFsSnFhd1AwcldKbmk0NUhTcUFSSld2M21X?=
 =?utf-8?B?dlRkUm9vUjNSSDNVcHNodTVuQnhFOG5tMHBkU0NnWXBEVWlhM25ZOEtDbEZY?=
 =?utf-8?B?SzgvcnFUKzhpZkdEdGNqbVgyaGFZczIrb2MzNk1xcEZTYXQvTERpemhsSSto?=
 =?utf-8?B?V2pLWFVpTTJ0UEkvMy96bG1qVGZCTFZ5N3M1VDRsYWx6S2VoKzZsNmZSanRJ?=
 =?utf-8?B?aUJ2YVgrakR4T1MzVU9iOFFHL2RGTDRMZkQ0V0JDcXhaRTVpZlkvNkMvVE03?=
 =?utf-8?B?WFF4MXg5OGwrRmpiMjJXV3dZQi9FaFNGeWdQM0xzSmFrZFl6QmdXazUwZ20r?=
 =?utf-8?B?d01Gclp3SkdQMnVEbDgyZC9ua2tLcHF5U2gvVHk4QVF6ell1MjNWUHBsTFJ1?=
 =?utf-8?B?THNZVEkwTmpSRmtnMURUMjk1bWczUkF0Y2JuSExhMEdvUHpzZDRqc2hvOHNW?=
 =?utf-8?B?SlFVTmlYS0lsVElJbkVKTER2Z0ZubUJEc2wwdXUwY2R0VnlMTUx4QUFSNmpi?=
 =?utf-8?B?V0JQK282MGxDQ2E5T0lyYmdTdlFVTkR6ekIxOFdIQWhQZUZWMEZTRG5SR1BP?=
 =?utf-8?B?OG5WVXdyem5mT01Ha3hESWVBV3RRWHZZWndzeFJGdDdTY3JjUEszOElKNkJa?=
 =?utf-8?B?SjJiVzhGdEo3Y2RrT3V4WGIydGMvZTArN2lyQmxrUW1acFdSMzJ6Nm1xdW1y?=
 =?utf-8?B?VU5sOEM2K29RVjY4MitDQUdpWHF4QWZ0NmZvdytleUZFSWF1NmVaa0VmOGVw?=
 =?utf-8?B?T3NDdTR2Q25Icml6Y1ArWmFteitYMGdoV1NOSmlTcUV2a2FTbXZldVB6VEw5?=
 =?utf-8?B?dW9WemdVaEJnY3MxRm5vaUdxUWFiWGMxTnNVRmpTTGpPYVRWc3pwNDI1NXRw?=
 =?utf-8?B?ZmxQc1F6S0ZjNEwzYXl6V2ZhSTVNdTFPOVJTaVVrOTBCYzduM2UzSjUwdnc1?=
 =?utf-8?B?eDJhUXdrYUl3VElvMEtZQUpVS0NaMmE4TU1UbFZlaFR5VW1IWHkxKzZrOFAz?=
 =?utf-8?B?VS9JMUJrRko5OGI2MUs5R2VzcHNOTzJyV05UYk91T01weGdMKzhuSkxDdHhk?=
 =?utf-8?B?UmVUVE1VVlFzeDkySmloQUFUZVBrLzN2ZW9tUGJqUXdvNmd5MTRQL09xbzg1?=
 =?utf-8?B?T3k0OWxJaVlaNElJcldqNG5ublQyMFNhR1lnWUd2d3czSkZzcXdtTVJZaEVN?=
 =?utf-8?B?TU03NVdQSGdZeS9qeWJDK2RwTVlMMm9ZNjRGaHpCRU5VU0JoNzJ2ckFRNXpD?=
 =?utf-8?B?YVlFUlhMMXJFQWd1dW11U3dUcEF0dG94Q1h0cDc3R3JhazRTV09ETUhBL21K?=
 =?utf-8?B?RWdTRm1LSUxZanp1Z1VGa3RwYmY0ZWJSTlFTanJIeENKbVFzbU9HbVNTNmlY?=
 =?utf-8?B?b3c1ZVk0SlB6cUZ6NGVLaWp0c0Y3YXNqN293WUt3SXZmQjVGbHJUYlVyN2Y5?=
 =?utf-8?B?WkxHNlVCb3FuV1ZLSmpDbit3akg1VEkydm1zMnZSZHdhMS9BQzNmVHh5Q2Qz?=
 =?utf-8?B?cUlqWHhFZUdSVlZ0RnFlbnErclVxOHdRcTk1SmpRb053clNtVDJ0ZVU2WFox?=
 =?utf-8?B?K0dWYkJjUDBjVXlCWXp0ZTFHdTBJTnI1K3owVU13allKbjNqS2ZVZVkyamNj?=
 =?utf-8?B?SW5PczRiN2NmUWg4OXBrYkRiT1M0SnJKblNMZlJ2dlpUcW9oU0Ivek42clVB?=
 =?utf-8?B?bytvWDY2YWFmZ0RBaWZDQ3U4VFpVRmpjNlVYN0tBblUzdDZONklWcEZ3aEFG?=
 =?utf-8?B?Y3hwZmRKVVJvZW5nbk1TK3dsMmsra0hyVjk5R0VLS09wK3hwNXVBdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e3345df0-68b5-4cde-8cac-08dee8e6fced
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 18:19:51.7237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9E0ZdsGBInhZHqhTvzZEg9K19rgZFE5qyLhN6UZmP7Y/LUr1J+NSKkd8F6ZpSP/ADHi/C6QA//xBqpsfzITa8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2549

Attribute macros are invoked without cfg being resolved. This adds quite a
bit complexity to the macro because all of the macro needs to be careful to
attach necessary cfgs. This becomes especially tricky for tuple structs.
Thus, it is convenient if cfgs are all resolved like derive macros.

The most optimal way to handle this is via `TokenStream::expand_expr`, but
that is still unstable. We can also create an internal derive macro and
transform the attribute macro invocation to be derive macro, but doing
requires us to serialize all extracted information in a form of helper
attributes; it would also make it more difficult if we want to make changes
to the struct (which the self-reference feature would need).

Implement an approach where we generate two cfg-gated macro invocations
with cfg resolved within the invocation. This would mean when the loop
falls through, all field cfgs are resolved, so remove all handling of
cfg_attrs for the rest of the macro.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 82 ++++++++++++++++++++++++++--------
 1 file changed, 64 insertions(+), 18 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 4438107682e0..3c9d9c7364e2 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -1,13 +1,13 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
 use proc_macro2::TokenStream;
-use quote::{format_ident, quote};
+use quote::{format_ident, quote, ToTokens};
 use syn::{
     parse::{End, Nothing, Parse},
     parse_quote, parse_quote_spanned,
     spanned::Spanned,
     visit_mut::VisitMut,
-    Attribute, Field, Generics, Ident, Item, PathSegment, Type, TypePath, Visibility, WhereClause,
+    Field, Fields, Generics, Ident, Item, PathSegment, Type, TypePath, Visibility, WhereClause,
 };
 
 use crate::diagnostics::{DiagCtxt, ErrorGuaranteed};
@@ -35,10 +35,18 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
     }
 }
 
+impl ToTokens for Args {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        match self {
+            Self::Nothing(_) => (),
+            Self::PinnedDrop(kw) => kw.to_tokens(tokens),
+        }
+    }
+}
+
 struct FieldInfo<'a> {
     field: &'a Field,
     pinned: bool,
-    cfg_attrs: Vec<&'a Attribute>,
 }
 
 pub(crate) fn pin_data(
@@ -68,6 +76,55 @@ pub(crate) fn pin_data(
         }
     };
 
+    // Handling cfg can gets very complicated, especially for tuple structs. Therefore, resolve all
+    // field cfgs first before continuing.
+    //
+    // We need to perform this after parsing so we can reliably detect field cfgs.
+    for (field_idx, field) in struct_.fields.iter_mut().enumerate() {
+        let cfg: Vec<_> = field
+            .attrs
+            .iter()
+            .filter(|a| a.path().is_ident("cfg"))
+            .map(|a| {
+                a.parse_args::<TokenStream>()
+                    .expect("parse as token stream cannot fail")
+            })
+            .collect();
+
+        if cfg.is_empty() {
+            continue;
+        }
+
+        field.attrs.retain(|a| !a.path().is_ident("cfg"));
+        let cfg_true_struct = quote!(#struct_);
+
+        let punctuated = match &mut struct_.fields {
+            Fields::Named(fields) => &mut fields.named,
+            Fields::Unnamed(fields) => &mut fields.unnamed,
+            Fields::Unit => unreachable!(),
+        };
+        *punctuated = std::mem::take(punctuated)
+            .into_pairs()
+            .enumerate()
+            .filter(|&(i, _)| i != field_idx)
+            .map(|(_, p)| p)
+            .collect();
+        let cfg_false_struct = quote!(#struct_);
+
+        // Resolve one field at a time until we've got no more field cfgs.
+        //
+        // This is linear time because macro invocations with false cfg will not be expanded.
+        return Ok(quote!(
+            #[cfg(all(#(#cfg,)*))]
+            #[::pin_init::pin_data(#args)]
+            #cfg_true_struct
+
+            #[cfg(not(all(#(#cfg,)*)))]
+            #[::pin_init::pin_data(#args)]
+            #cfg_false_struct
+        ));
+    }
+
     // The generics might contain the `Self` type. Since this macro will define a new type with the
     // same generics and bounds, this poses a problem: `Self` will refer to the new type as opposed
     // to this struct definition. Therefore we have to replace `Self` with the concrete name.
@@ -90,16 +147,14 @@ pub(crate) fn pin_data(
                 dcx.error(&field, "#[pin] attribute specified more than once");
             }
 
-            let cfg_attrs = field
-                .attrs
-                .iter()
-                .filter(|a| a.path().is_ident("cfg"))
-                .collect();
+            assert!(
+                !field.attrs.iter().any(|a| a.path().is_ident("cfg")),
+                "cfgs should be all resolved at this point"
+            );
 
             FieldInfo {
                 field: &*field,
                 pinned: pinned_count != 0,
-                cfg_attrs,
             }
         })
         .collect();
@@ -185,9 +240,7 @@ fn generate_unpin_impl(
     let pinned_fields = fields.iter().filter(|f| f.pinned).map(|f| {
         let ident = f.field.ident.as_ref().unwrap();
         let ty = &f.field.ty;
-        let cfg_attrs = &f.cfg_attrs;
         quote!(
-            #(#cfg_attrs)*
             #ident: #ty
         )
     });
@@ -280,7 +333,6 @@ fn generate_projections(
         .iter()
         .map(|field| {
             let Field { vis, ident, ty, .. } = &field.field;
-            let cfg_attrs = &field.cfg_attrs;
 
             let ident = ident
                 .as_ref()
@@ -288,11 +340,9 @@ fn generate_projections(
             if field.pinned {
                 (
                     quote!(
-                        #(#cfg_attrs)*
                         #vis #ident: ::core::pin::Pin<&'__pin mut #ty>,
                     ),
                     quote!(
-                        #(#cfg_attrs)*
                         // SAFETY: this field is structurally pinned.
                         #ident: unsafe { ::core::pin::Pin::new_unchecked(&mut #this.#ident) },
                     ),
@@ -300,11 +350,9 @@ fn generate_projections(
             } else {
                 (
                     quote!(
-                        #(#cfg_attrs)*
                         #vis #ident: &'__pin mut #ty,
                     ),
                     quote!(
-                        #(#cfg_attrs)*
                         #ident: &mut #this.#ident,
                     ),
                 )
@@ -374,7 +422,6 @@ fn generate_the_pin_data(
         .iter()
         .map(|f| {
             let Field { vis, ident, ty, .. } = f.field;
-            let cfg_attrs = &f.cfg_attrs;
 
             let field_name = ident
                 .as_ref()
@@ -391,7 +438,6 @@ fn generate_the_pin_data(
                 /// - `(*slot).#field_name` is properly aligned.
                 /// - `(*slot).#field_name` points to uninitialized and exclusively accessed
                 ///   memory.
-                #(#cfg_attrs)*
                 // Allow `non_snake_case` since the same warning will be emitted on
                 // the struct definition.
                 #[allow(non_snake_case)]

-- 
2.54.0

