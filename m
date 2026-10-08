Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021110.outbound.protection.outlook.com [52.101.95.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF24509F15;
	Thu,  8 Oct 2026 19:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487663; cv=fail; b=kpgkuFqmLG9zxjW0df81PoEluSDGwSJQA4Yq0cBN87iEpx+LfChqvYtQrfXIuPmiIZsetJNjWeW6mqs8YGcZ4smiRS6fBqNYsJeKjL6Gbyc7b6p/d3wEQ89hoQlOYin6JD7CuwO+R0rVEKS39juiIOAOBBjEidFIOUSkRB6ISws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487663; c=relaxed/simple;
	bh=i6shRD4FuJcTX6l/SYnvvOkl3OClHDi2U/YimENXy+A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=W0BmuAj0H4j/8zuR03sAchiQSaylfqC5LZaTKL1g8oD2VHI/v1zUJK0QB9VDPD5gdx+FxtR5zljvIIfSyQXAaecnUbDr8SzlnLQv0kwz0hMl2RAAdGf8SN+Tm3jLcF22EwcnVswkZNm9pt6N9Dl0S8nITJx5S338bI6cUJRzw2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=nHS34v2y; arc=fail smtp.client-ip=52.101.95.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nHS34v2y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWq65faK1zu6YBRCHHhK18T//cLLpmY2YHHTwiIF2aMuVkVzOBq+AuwhZ6qSU44PltRVJoV0tYogH7aKV1VTRiM50/zdAL/MIPt7aXVAE7l82BX6fpEWveY2BvribnjS3uANnamMmt1BwYGWuIQkkYa3HB6SlDkFem8mDR8k9zi+8uebURpvn7EmEoOkRx5jwwuFcfWmsjsUyqhv6wqGMmLx4Qn2meWhI5f1baaWNuKFpv6vJeF4kKHyMsuAVgHiekcYLf2WRymlVPGGJ3gVLml3y/tTv8Nz6TsUBRG/m3WUAE5rN62PcwwmjyXn21nbFjz2gB555QNUdA1cwN58Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM0/s/jtar9QAkX6Ir5kaPbZPMUdaqon8triuO7ffQ4=;
 b=iBmlsqKkp9hJnWdKzfAbmlGmdD68tCWfOtqP5NqAmwbA2talsUqLSSC23YRHIQUdCtrHNces28+pPylHGoDwzRVUK2VHopR+ToAJ0QQe4RqHesO/wJqW2Ksb/2ln4TpfSdbrV/jSs4Das5n5vHwRg/p2QO0Y4o48N04dU2KREnV3WfXolxwgoWxSB3iUMIX2DfYFHpy842Lc5rGEy3tRiGjef9fBqdc0ZhZYG/8OJd62tvDXHIFCEx2FsO0Q1jQcGlzBjZ435kjMHNeLiYpi8euMj+zTDCvY18GWeVRohOXZfOrmpRj05UNu5gyfCtSxT67GWtJKhRwHqK/cVslQSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM0/s/jtar9QAkX6Ir5kaPbZPMUdaqon8triuO7ffQ4=;
 b=nHS34v2y52fgZ1GXtv3ICgzFzzZYzqK2fA6hVOjE3a9Aci23W0F9K8Cl7JwEPy8fZJ7mt2WNgsr6YsCLup/Gryl047xGxUpWpbwWbPFpZE6F/XtSYHbThrih97ZYD77eRHTmFpy3CX2cTLUdKji2hzbuPQGsi2goJCvR0I7/1XM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:49 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:49 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:42 +0100
Subject: [PATCH v2 18/20] rust: pin-init: internal: pin_data: perform AST
 lifetime replacement if possible
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-18-e280b3c8fba5@garyguo.net>
References: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5595; i=gary@garyguo.net;
 h=from:subject:message-id; bh=i6shRD4FuJcTX6l/SYnvvOkl3OClHDi2U/YimENXy+A=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcffFRrf9zU+aGX7jctTl9F4pYHxVpeD8idFzSbrP
 zp3++HZu/0dpSwMYlwMsmKKLB7djGmbGGfLXtYqfwkzh5UJZAgDF6cATIRnH8P/LL7D1beORosI
 spy669w4c2riuUdfOgT2SLzsN/3uZhYcycjQrRu6oWJvtIHFrFYV15XNtz6kbl7zSWm+Ru3dlhu
 H961jBgDsa0it
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: b69b6c23-e5df-4f9c-7499-08df25721939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|18002099003|10067099003|22082099003|3023799007|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	/yiVT4sKapIkZaAy/zX1Ke5BTRlIXYjbu876SZA8yrImOye8vILAo2bY+upnjxa2MRYfAC9rzRC1aRGvONELJUG4KcDUP5GlqSfgShuL0ZkCOJT+DksHioMKht2jezE7RMtJrRzbNgAU5bTw28ZQYsRRRHX8MSyUfC4G4xwFPaRIAj4JEeSWe/ACNAA6ChDlnvm1yamcnBvGjVw4yTgtpPsURFzpmbLVZTy9Ab2zQ5PTOEZx2XI+jQPtlv3YqNXoNinO0IR6KzhesJ7yn8+dwUvIP0Nj81fk3L6S0b+hm+ao++1BmxjAXiO86tNS9ZA66OWhHKTfFizN7rMN7fPZVbKCVAKLJiJtbDzrCqD55RgumScEgL9SRlWXz6qzwhTZkdKH0MgBJx6WG+5w9P0zWf/rVcA5/hj9JifS38UB86cvFOpn7mltzM+Q5I4RKluSeuOjZoXnzRTudgGx46vOpXWmTZjIafi2LwiHKCMBp4wDChG8K/mGnKqJFZ4NJ6u3eUuZV4j7Y0tsNPywnv5D9UFSrZ6euAVHjfey6L6RyxWsuT8b2/bR51Tn5lrWxyPZaBKa+JTdO5BxcUl8LlyrzK/DNZkG2cQ0Jr/PYfsVx+p7LgcNBFe5N3LuucWcD7QRiyIchbcLlQO2zoCasp5ogU44T/byrzpgQSwxp2yE1+TuRrh6C2axEZoSKFF9h6dcs9ZyUkxQLL9UGRiRx+nNUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(18002099003)(10067099003)(22082099003)(3023799007)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aitJTUJDYWhMcXI3UjBZRDd2bko5NERnd01ueUtDMUdnNHRzYVpYOWN6V0RH?=
 =?utf-8?B?VGJET09qdy95YzlmOUtMSFU4akxUR3ZmdTJySnVnc1JhMDVKd01RUlRMaEQv?=
 =?utf-8?B?ajdPUllyT3VBR2xuTnR6d09tZGVFb3liZmx2ZVJXUy9FTEVlOVJmZVg2bEpY?=
 =?utf-8?B?ZGROaFEyRGVSNVp4dUY4cWlxUWlBOFQzU2pEMm1CbUtNNjQ5djJtTUNKZExv?=
 =?utf-8?B?Ymt1aXhDUGpCdzhoRytLWEpObDhxamVjbmVtZDNGRTYxM0hUbzdSUUxoU1RY?=
 =?utf-8?B?clZ4WHVvbGh4dkFNRWp4NXZFKytQUjdzUlpJeGlUcnlsMDNQUlF2enBzM3NX?=
 =?utf-8?B?WnZiLzljSFVacDdzSitkcW9OUVlJRUhNajk0OStiQnFjQ2dhektNODFnSExU?=
 =?utf-8?B?eFFqekErZ2JORTF2YmxCS0l4NGxLamZvWWN0d2JaTjhuYm56cnhHSVBBWUF5?=
 =?utf-8?B?bndacDVmWU5yWkcyMzZoMUwwVjRpandBTjR0YVYrL2VuMHMyaFd1OWlsMGxZ?=
 =?utf-8?B?aWs1MzNLNkdXNGZqQWFzeTFwN2ZUOG9FZDFCTkpNRXZxdmJCQW5NZEJFNzg2?=
 =?utf-8?B?dSs5dWdhNWI5ZzZrZ2FPUGhqOFJpVENROVpNOEM5K1IzL0lMK0NIK0F2V0t1?=
 =?utf-8?B?QXQ1TXhMbW9tUWs2ZklHamM1dlhjYlU1QjRVRk04SmsvTFRrZ0t1ZzNCWnBP?=
 =?utf-8?B?cktkaGlUd1ZURGZMWGRZMStMWlB1OUhBeGJHOGdnS0xYL1Aya0VKZWI4Q21S?=
 =?utf-8?B?QnplQWNBSnNZVWMwRUg4eWJzMCtVYjFEWStybVM1eUFLMjZXV2QwVzRrTEJ3?=
 =?utf-8?B?b2J6STd3bHRUOFVlenRZT3lFdDdUTDBTQTRYQThQMktuZHU2SldybGkxUkJl?=
 =?utf-8?B?azU0akhvNmRkak10ZS9jeVFCTk5nM29xWFZzK09oVjl5VjgzamxiWHYrUW5i?=
 =?utf-8?B?YWdXSDhPZ2tyRFVkS0k4aHQzZnUzU1JRMTc1UXQ2UzBLQUN4VDc4Y0dVN0tm?=
 =?utf-8?B?b1dvTFpIb2xoWGRrZEFQRTlYZFZ2UmY3VUljRHU3dWJteDlTWkt5cDJ4OUkx?=
 =?utf-8?B?UGVRNGJuK1RIUGlDRTF4TEl5YUZyVmpoQXBtNFdqVjJ4N2RRbDh2TFE1Q29x?=
 =?utf-8?B?cmppbWRFZmx6VGJ6L24xWHN5Um9ycHBncTVNa3BablpYbEROL1RLQnZMVmJj?=
 =?utf-8?B?V1hkd3hlZEI5QldXamxRV0dDUHRrNEtkZ0ViSDRJYjY5SnNYZUhTMHBWczRY?=
 =?utf-8?B?d2ExOXNYNExSVEUvZitUMG1ta2lxc3Y0Q3hiUlBYZ0hWcWtmZGhJLzdGL3JF?=
 =?utf-8?B?aUhIL3ZGS1paZTNZZ2ZGTGJGT0o0bEtuK2hYN1VyYVRpTWI1QmsvSDlOSDQ3?=
 =?utf-8?B?YytiQUI5ZkZETURicmlLclByYU1DdkliMVVtY0hZU1RiUnIzSnJDQUhIVmwr?=
 =?utf-8?B?aXhFcWttWTF6cHFaWU5DUmJEcFBiRVpUMDRVeWNjZlc1U29zeDQxL0I3enRV?=
 =?utf-8?B?eFhPL2pBVXVqOEJsZDhjd3NyWE1rRTNPUHBQU1doOEFIeS9mNGFYNDFmUWJI?=
 =?utf-8?B?Yy82N2lUNmlaY1hGaTE0dThUZm1WWW5CSURiUjd1cEZNUUROYTU1K3JFM0FE?=
 =?utf-8?B?dDlxdnJlbGhLWXBNT1E0YUtUMDZ0UVljYkFYdFBRS3hqZXVsSVFybkdrVjBw?=
 =?utf-8?B?dWhTbFZ6Y2xpSkpvOGdvVlNDNTgrYXJnT2ZoT3FodWF5VC96bXEvRkRydERJ?=
 =?utf-8?B?ZEJJTTVRZXJwNGZkcU1hR1lVZlpIZEhHcGhHaTB3c0E3cHpMTUltVlRzaHpU?=
 =?utf-8?B?cHhzb0R6UjIrcW85SFcrMThBMTJUM2VrK2s0VUowYzZ2NlV0YmlvUGxHQXQ0?=
 =?utf-8?B?eTZJVTVaczlsVDNjVmRxMFhyNUpKOGgxc0JQVCtJUkZqSks3SU9JOXhpdzMw?=
 =?utf-8?B?T0dsRHNCNzdTdHBlSUNKcVZ4ekIrM0xZSEV5aDdhQy9iRzBjdnN2UnhRZXNp?=
 =?utf-8?B?b2hJSmVFUjFROFE0d2tCZTBTWGZTV1p1S3ZBZjdZNFp0S1dudXhFemM5ajVk?=
 =?utf-8?B?ZldGVVhUNDEvZlJacnF3OElaWnNJWCs5N3VBMUViVzAzbGpBRTZHM3RXc2tv?=
 =?utf-8?B?Qng2RUE0OTU5THg3dmhxQzNyaCtDYmwyU1NrZ3J4ZURFam9sWHM2YzZEakRm?=
 =?utf-8?B?cmV0Z3NacmVwSkFTMjBOeWhIeHgxektwQmRJclRXQU1FSWxYcEwzRUdWaHBB?=
 =?utf-8?B?ak5oeGhjOVRIZWRUbm1SZUx3MEhSbW9ZQzRzU0xENnVHNForWkIrMXN3R2RY?=
 =?utf-8?B?QmphKzdybjJYNkZISjI4ekxGV1h4Y252NkFkS2RxaVRhVkdrWWIzbG9LWi9m?=
 =?utf-8?Q?L33a07K1X6q81UKiXPeUInlxhVE4o/cZBvvt1TH7KRRng?=
X-MS-Exchange-AntiSpam-MessageData-1: yNokAKDhtOrBOg==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b69b6c23-e5df-4f9c-7499-08df25721939
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:49.0227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtNow358RUvGoOMww/igalm4kWrn3QX2rb235ulcXig6HPd/XDTe3BfRTLoHdE09cRKkqivfoJs93/CV2bXlbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

Currently lifetimes are replaced via function type and `FnOutput` trait.
This is very general approach as it uses generic associated type to replace
lifetime, so it can even work when macros are involved. This does cause
more generated code, and does not render in documentation nicely.

Thus, just replace the lifetime in the AST if no macros are involved.

Acked-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/util.rs | 112 +++++++++++++++++++++++++++++++++----
 1 file changed, 102 insertions(+), 10 deletions(-)

diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
index 59054f5934fb..4d3331b852b4 100644
--- a/rust/pin-init/internal/src/util.rs
+++ b/rust/pin-init/internal/src/util.rs
@@ -1,12 +1,12 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-use std::collections::BTreeSet;
+use std::collections::{BTreeMap, BTreeSet};
 
 use proc_macro2::{Ident, TokenStream};
 use quote::{format_ident, ToTokens};
 use syn::{
-    parse_quote, visit::Visit, Attribute, BoundLifetimes, GenericParam, Generics, Index, Lifetime,
-    Member, Token, Type, TypePath,
+    parse_quote, visit::Visit, visit_mut::VisitMut, Attribute, BoundLifetimes, GenericParam,
+    Generics, Index, Lifetime, Member, Token, Type, TypePath,
 };
 
 use crate::DiagCtxt;
@@ -388,21 +388,113 @@ fn visit_type_path(&mut self, ty: &'a TypePath) {
 }
 
 pub(crate) trait TypeExt {
+    /// Check if the type includes macro invocations.
+    ///
+    /// Proc-macros cannot expand macros and peek into them, so if macro is involved sometimes
+    /// special handling is required.
+    fn has_macro(&self) -> bool;
+
     fn replace_lifetimes(&self, needle: &[&Lifetime], replacement: &[&Lifetime]) -> Type;
 }
 
 impl TypeExt for Type {
+    fn has_macro(&self) -> bool {
+        struct HasMacro(bool);
+
+        impl<'ast> Visit<'ast> for HasMacro {
+            fn visit_macro(&mut self, _: &'ast syn::Macro) {
+                self.0 = true;
+            }
+        }
+
+        let mut visitor = HasMacro(false);
+        visitor.visit_type(self);
+        visitor.0
+    }
+
     fn replace_lifetimes(&self, needle: &[&Lifetime], replacement: &[&Lifetime]) -> Type {
         if needle.is_empty() {
             return self.clone();
         }
 
-        parse_quote!(
-            <
-                for<#(#needle,)*> fn(#(&#needle (),)*) -> #self
-                    as
-                ::pin_init::__internal::FnOutput<(#(&#replacement (),)*)>
-            >::Output
-        )
+        // If the type has macro, we cannot peek into it. Use some different approach to replace
+        // the type using GAT.
+        if self.has_macro() {
+            return parse_quote!(
+                <
+                    for<#(#needle,)*> fn(#(&#needle (),)*) -> #self
+                        as
+                    ::pin_init::__internal::FnOutput<(#(&#replacement (),)*)>
+                >::Output
+            );
+        }
+
+        struct LifetimeReplacer<'a> {
+            to_replace: BTreeMap<&'a Lifetime, &'a Lifetime>,
+        }
+
+        impl<'a> LifetimeReplacer<'a> {
+            fn with_bound_lifetimes(
+                &mut self,
+                bound: Option<&BoundLifetimes>,
+                f: impl FnOnce(&mut Self),
+            ) {
+                // In case the type includes a lifetime binder, e.g. `dyn for<'a> Foo`,
+                // temporarily remove them from to_replace if they're.
+
+                let mut removed = Vec::new();
+                if let Some(bound) = bound {
+                    for lt in &bound.lifetimes {
+                        let GenericParam::Lifetime(lt) = lt else {
+                            continue;
+                        };
+                        if let Some(entry) = self.to_replace.remove_entry(&lt.lifetime) {
+                            removed.push(entry);
+                        }
+                    }
+                }
+
+                f(self);
+
+                for (key, val) in removed {
+                    self.to_replace.insert(key, val);
+                }
+            }
+        }
+
+        impl VisitMut for LifetimeReplacer<'_> {
+            fn visit_lifetime_mut(&mut self, lt: &mut syn::Lifetime) {
+                if let Some(&replacement) = self.to_replace.get(lt) {
+                    *lt = replacement.clone();
+                }
+            }
+
+            fn visit_trait_bound_mut(&mut self, bound: &mut syn::TraitBound) {
+                self.with_bound_lifetimes(bound.lifetimes.as_ref(), |this| {
+                    this.visit_path_mut(&mut bound.path)
+                });
+            }
+
+            fn visit_type_bare_fn_mut(&mut self, bare_fn: &mut syn::TypeBareFn) {
+                self.with_bound_lifetimes(bare_fn.lifetimes.as_ref(), |this| {
+                    for input in bare_fn.inputs.iter_mut() {
+                        this.visit_bare_fn_arg_mut(input);
+                    }
+
+                    this.visit_return_type_mut(&mut bare_fn.output);
+                });
+            }
+        }
+
+        let mut ret = self.clone();
+        LifetimeReplacer {
+            to_replace: needle
+                .iter()
+                .copied()
+                .zip(replacement.iter().copied())
+                .collect(),
+        }
+        .visit_type_mut(&mut ret);
+        ret
     }
 }

-- 
2.54.0

