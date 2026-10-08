Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022091.outbound.protection.outlook.com [52.101.96.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81B4498920;
	Thu,  8 Oct 2026 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462281; cv=fail; b=Lyl1SDvrbEWy0tNVJttkeIearnvdcvvCJISIO0+hml3FAcdMypPjLsJVJYuMXSkkyz5Cqe7pqC3przAjhI2vJmmjuNJ7Yh5XOrZiY1KPkwkIeIO1g0YGMC4McYRA8tflpTQjCcJGXrk9XCmyMnpT12CEGvVQVQsehdeffgqaHLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462281; c=relaxed/simple;
	bh=TSRK3vbkWrnoEXaclKjIi/+U4B8mIlqPTls4w5jKzo4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uR0ngIrzGeEI4sZm/CA/EGKVkQALO5Q7znY51ZGoXYRf+3yZBS1np7CFL+k/pU6+vyi9yIR1Jfw9mNIOnxVTsOLLPZh9zmbnciKYhYPeDD5g+LC9Dd6xX4CPdT46M1a7a5vQDiR4bojy7hG/DpeOJQvgxu+6oh9UuYZ7NMyVCsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=uIPXogTG; arc=fail smtp.client-ip=52.101.96.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="uIPXogTG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HN2TCSzLrdeHFFjhNsdPcDwnKHwffK7ng/YT6KQmqIDwPBVe6zbBp6Uz+/X1GrMZUsTilpLBeX6+khxUS0G2ztfdqctPXQ23p/gc4ArPGP3BKayS3CTlHUMjmhw2HGE5tG3b/f7dQ7g+a6GJxWuOMdketU1RYqvL67ZyVerYXqZNcafK+raPjesU1SsSEGAV/0SYET1DEz8YSEMOOFvH1cs+qYSD1whYkEkRdWWy9R3jVg5EWp3Wpyw/Z78YzmCIcpwyN6ThbxVkGyPuTAQd+O9MTl+2hLEKBwl8Vo+a5OQ5W6FsYFMwkbvKbxskku4CJ3uJe8FzKbTML9bdkwuNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFECXioiibmLst/rmyWu1+5SQBGCMf7vQwgHHvp1Sww=;
 b=lr8+nOfDD0V0KLKOGH+Rr07n8yMEtGu1ji1pBKTztvbQsTvqa4vWK7iDShGb9vJoiOvyECTO6bMvurGv/yMjzhHKJSbuB71+4/Dx2+Ag3pfF/TglzIQozb74IsvAWPGF9vZXq2OqP2g/TKpQWZGy9kl1DpaiFUv4xetSRxbdzpIj5YBYRN+EYMwydh3kyM0/Yn4thp3pFpYSZgtGeylhS9s457rsFDx9vol3k3Fu1PZx3hXDivOjp0I+zi5MZ41Yuo5lR/RWgdJq+ydQZhGsMjtL8NmF02JvadzXv4+AApmxT4KArrdwwJRvT3ChmvFMaoq0AqExo5D61GdYj1gOoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFECXioiibmLst/rmyWu1+5SQBGCMf7vQwgHHvp1Sww=;
 b=uIPXogTGyS5xN6eye4hupx2qt4wxt1A30QzFHCgj4UtCW7XsopcUJ0SAsgWVl9hybGFb7orUZcozOFjcYdi9buL8DREc58oU958aIfrW/armaHX4rXuJRJgu8XUDLH21Uba+S8uAdBYNOnI0RRDTbTrO3qi1pciN6ESXRy8FKbM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB8795.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:36 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:36 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:23:56 +0200
Subject: [PATCH 09/20] rust: pin-init: internal: pin_data: project
 self-referential fields
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-9-6c1eb269fe57@garyguo.net>
References: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9181; i=gary@garyguo.net;
 h=from:subject:message-id; bh=TSRK3vbkWrnoEXaclKjIi/+U4B8mIlqPTls4w5jKzo4=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce709dNjHiZn1rJKehl23XPevvmUzxP/0WJVLdoz
 /jeyX42TqSjlIVBjItBVkyRxaObMW0T42zZy1rlL2HmsDKBDGHg4hSAiZxXZWTYyVdc4DBRSiJr
 /Z7dx+sWfeFL3+E6b2f6Z0P95HaRirWbGf4ZxDtaTwucWqIvsmlVQC1nw6n25YJPpoY8Ca/0e8H
 6z4ELAIn2RVc=
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0578.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::8) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO7P265MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d497619-0499-416c-ba22-08df25371d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|10067099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	VAhV99F6D2T+iZMOWL5R4+yIhJytL1ANoiftr4p8N67NJxaws/Iw0oVLcpNZXoeDyn7Zbb3Q1vckPXvXxW4s/t8C7UWdsM/VOz2pa9UrX1r8WAYvF9zm125dvTFzqSGBFQ9l6IJAkj1cub0XYZ7iSiAWERSyi7d/er+J12gI2IRrTkekxNL2bYwgcFOMMYod47GvxLaMt6HEo5Si+iun6qq/FlHvp2LbnK6nbtWFWgM9eA8+2fpDamE13XnXYmVWe1N5CmEID7rKBjyJxvMkUqd9AvmNWy5hCX/hh/bmwwh5QDWIJpGIm8+G6ippXnSnFPqmMRqV8STFWiotDkXl7HXTNNr+ESfaWu029Lq/NGHXC/7dy0AhKeYmryfWPi3Ae0CyRH/9gTWT9r7zlu7mQDEPIxZ6kdWFWq/f2528cvHHsRdF7/nKrdGuWp/Q5J7yFtYjEMmI2wmnZwvRRwtcIVN0zW1+a3kpyW9Sn+J9KmI+XTR7gqubL22QWJm6y30TBHOKCwr7ODenfTinqByd2pYGSQL8kiBE9Z5M0BTxxdEYC6WBc6GpgK5tkUo4TVHkrQ5XrKvAN2zGXL88TQAtYJf7YBPQTdLLf2M8J8ahfLYTwd+zGvl+Bn0G60h0DBn8yw9oTkvKdypGHOa8FzGUEcnj392gI2ppV05+IZT8S/k0P3EkZY9y+YlhlRx65uuzh85BUnHSVWIo4Iw1YCwQgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U09mQ1FSN0JJSExpVVorem5PM25uak4zbmxHTEZXa3JzS2hoK3pwampVc2Nr?=
 =?utf-8?B?Ukpwa1Brd0VFcUQ2N2R5ejcyVlJ3YVF2TDFsOHFhRG1saWdNbURrMEhVM0hE?=
 =?utf-8?B?Q2EyQ1NUSDZrcFVYc0tIRnNXYUd1VzZ3Nmc5NnBUQXVpdmtLWmQ3Z2kwek9k?=
 =?utf-8?B?L1BCTVMrdlkxcHkrY1pkZWZnLzVESkFheTBISjVrYXF0RVBNdlNTYnJtZ1Qv?=
 =?utf-8?B?aHMvdVd0emxnVEFDdUZsYnkvdmxiSGtaWlk2YUFOUmxRMHBseHVqa2Fjeklh?=
 =?utf-8?B?MnBpckFVcHQwNlFod2Myb3NHV0hXQlR0WTVpTmxONXozRENYTmJlTkNnT2JG?=
 =?utf-8?B?aHpQQnc4VnFvcXFUWG53NnBFeC9HQzAwSzlqYm1YSGFRK2hiNFVPUXJ6ZWI5?=
 =?utf-8?B?UDlkaTZ0azRhQ0lkRWZ1Nms3U2xxNUpiU2NCUWpWWURuUXN5RThtR00rY05n?=
 =?utf-8?B?QXlncjk1czVVbFhieDJSbFhFUEVQRkswMnhJVDc3bCsvVHQ3Kzg1MUtaMThv?=
 =?utf-8?B?VkZCaVBsU2V1M1BEQ0Nudi82Z3BRQTVjNVorTEU1V2I4OWE0bDY1dXRBaFFh?=
 =?utf-8?B?RlZ4NDF4dG5UUnBMbDd3eWtRRTgxL0ZkNDNRWGR0NkVseW1EWVFqMml1cWtH?=
 =?utf-8?B?MDRLZnYvbXcwWVFqQmVZZnRaOFNob2NuUjZqRm5wYmplekNpbkQzdXZFckla?=
 =?utf-8?B?dGE0MmZ2eGNFUlVmeGE4RDlUWnAvekZTdWFNZ0JNNVFrUUVmaTE3eGs0VmlZ?=
 =?utf-8?B?cDFJZU44WUcySnhxSnpTZVZxQUlNQS92OWdHOHVpUlphTGtFUzVvYTFobmN3?=
 =?utf-8?B?VEp4UmMxNVZRWGRCcHlCTEtnM3c3dkYxT25aWmhCN3YzbklOeks5SnRPejFC?=
 =?utf-8?B?REI4N1J2aTJmcXgyVXRQMGdZZzJQMFFEMThEUlZPZ3VJYVd2Nnh2RFV4eWoy?=
 =?utf-8?B?eWVGaG0xSytmaWZ5NmpsTXB5U2s1QlUvZlRXU2ROZWxxQmNsUGxlZHNyRjFG?=
 =?utf-8?B?SjZrRGVSTENCTUJ0ZkV5Vy8vZFRyR2hrRS80R1I3OFczWnlIVlNaNDgwL1o4?=
 =?utf-8?B?SzhHRFhNYlVlT084K0VJR0J5SHFMWG5lVmd3ZGpyTkMvdXdOTEh4azYwSTk5?=
 =?utf-8?B?RHZUNzdLSkI5aDZSVzlWbEt2UVpPbE9GckFGaW51SUZDWWpueFh1SldLWE9O?=
 =?utf-8?B?NkRJQkdvcEJHR2g3VVR5M1dCZ3BCNkI2dkxpRTV4WlFIWlRIczFaVEorOUNt?=
 =?utf-8?B?U002VjdBbHZlZG9yMDQwQm5FMVNnTkFFQ1VRemltVTR6RFVkVzJmekxJdndO?=
 =?utf-8?B?WVpwR3Uwcm9BLzlzdy9vdG4veHFZTXBWVElrcWloVnhidUlGWG4vNzhuQ1lp?=
 =?utf-8?B?N29IUmVnS2s3bFV2bFdUWGdSbzNpT3ZWYnBhMi9kN2hkZHVTUS9qbGY3THpH?=
 =?utf-8?B?d1dMSmRFMjQ2bjNyTXhwbkJad04zVHRQeklSQk9nM2VLSSs4ZU9ja3hTc3J5?=
 =?utf-8?B?blMzSEFNRTJLYlk3blI2clJtYk1QSVJ4dHpzZ2FIL0FwWUdsNWhXVDRFS1JO?=
 =?utf-8?B?SkJ5dHE2bUdRK2F6cmhrWUhGUUdSNys0NWdZOWxKUEg4LzYrWEx5UXhiTkw1?=
 =?utf-8?B?Z0daYjdVMWNWOThSTzNvWlRzMzFhR0ltTlVkWjkwNHNCRkZxQnBYc0VYSWh0?=
 =?utf-8?B?bUVSMTJ5SlRHcFh0VnBqdjZUYnk2NWR3cUc5Q0FsUVM1MDBOZzk2NG5heDly?=
 =?utf-8?B?UUVRUGhrbkdSeWh6ZHpIb3dMT09FaVlPeUFhT0plQUs1VzZPUFNCYjQyNFRs?=
 =?utf-8?B?c3JYZE4yMGpJbXR2R2JNTHMzSXlHK0ZRWmpiamhEZUI5aXI5eSs0MW1VMjA5?=
 =?utf-8?B?OHRBM0RVQzF6Qmc5TG8xWEhoSE4rOU1vODZSKzhsVGZtb0JVWDc3dWlaTDJ4?=
 =?utf-8?B?TGRBRjcvbE9pN2F0UWJBTUJ3NFM4VVJSY3FnbDE1SmwvNGJjU3h1WW5JWVNa?=
 =?utf-8?B?YTE4SERwT3daNi8xSkFpVUd0QUE1a0N3SDJ4TU4vWUNYekhFTS9UN1dxMXcz?=
 =?utf-8?B?Q0tOaDFXbVI2MzN1cFllNW9CTFpUckd6OTZYZEFTV0ZvOWxrU3FLQ0hWa2dX?=
 =?utf-8?B?dXNNbDRkMmpYZzk5UmhIQ1Z6VG5zVkgxUnNoRmpuczY5NkloYXF0cnlLY3BE?=
 =?utf-8?B?MnhhZ2JrYUw5MzZZNVF6QWgzYzVMNGtEekk4Nzg5OGdCdlgwVmY2SnJ2R25w?=
 =?utf-8?B?bkczeCtKamxRbnBmWmIwQ2xVc2NDU3dZM1lNWmJJMk9TbUFEKzlqQ2RLZEVq?=
 =?utf-8?B?a3RhUlc0dytQSDVYTXc1UTZMMnFOQ3ZPNXNsODIyc3hTM3dNbFQ2UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d497619-0499-416c-ba22-08df25371d9d
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:36.0884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nasFjN+LtOhvX+luQApA0JGJG0Rp85AsT5BXjMLGrpRYhzL8axKtGAjINA1gGf5EIVilmfXpto/BTdrH6WOrlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8795

This adds the projection for fields that are shared borrowed or that
borrows other fields but is covariant. Both cases allow a shared reference
to be accessed.

No mutable references can be created for these cases for different reasons:
* For fields that are shared borrowed, aliasing restriction prevents
  creation of mutable reference
* For fields that borrow other fields, their proper type contains field
  lifetimes. These lifetimes cannot be made available in the returned
  `project` struct (because there is no way to represent existential
  lifetime in return position). For covariant types, it is possible to
  shorten these lifetimes to that of `&self`; but doing so requires the
  reference to also be covariant over the pointee type, so we cannot give
  out `&mut` as it is invariant over the pointee.

Due to field-referencing fields being wrapped inside `Erase`, the normal
accessor syntax stop working; create accessor methods for these fields
instead.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 109 ++++++++++++++++++++++++++++-----
 rust/pin-init/src/__internal.rs        |  12 ++++
 2 files changed, 107 insertions(+), 14 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index c837241241af..6b39355c43ea 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -12,7 +12,7 @@
     visit::Visit,
     visit_mut::VisitMut,
     Field, Fields, GenericParam, Generics, Ident, Index, Item, ItemStruct, Lifetime, LifetimeParam,
-    Member, PathSegment, Type, TypePath,
+    Member, PathSegment, Token, Type, TypePath,
 };
 
 use crate::{
@@ -848,7 +848,8 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
         generics,
         ..
     } = &info.struct_;
-    let this_lt_generics: Generics = parse_quote!(<'__this>);
+    let this_lt = Lifetime::new("'__this", Span::mixed_site());
+    let this_lt_generics: Generics = parse_quote!(<#this_lt>);
     let generics_with_this_lt = CombinedGenerics(vec![&this_lt_generics, generics]);
 
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
@@ -859,33 +860,68 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
     let (fields_decl, fields_proj): (Vec<_>, Vec<_>) = info
         .fields
         .iter()
-        .map(|field| {
-            let Field { vis, ty, .. } = &field.field;
-            let member = &field.member;
+        .map(|f| {
+            let vis = &f.field.vis;
+            let ident = f.member.as_ident();
+            let member = &f.member;
             // The projection of a tuple struct is a tuple struct itself, so its fields are
             // positional and must not be named.
-            let name = (!info.is_tuple_struct).then(|| {
-                let ident = field.member.as_ident();
-                quote!(#ident:)
-            });
+            let name = (!info.is_tuple_struct).then(|| quote!(#ident:));
+
+            // if `f.ty` contains field lifetimes, which we need to replace them with shorter
+            // `'__this` lifetime as field lifetimes are not available in this context.
+            let all_lifetimes: Vec<_> = f.captures.iter().map(|b| &b.lifetime).collect();
+            let ty = f
+                .field
+                .ty
+                .replace_lifetimes(&all_lifetimes, &vec![&this_lt; all_lifetimes.len()]);
+
+            // Fields sharedly borrowed by other fields can only be shared accessed. Fields that
+            // references other field and are covariant can also only be given shared reference
+            // as mutable reference is invariant.
+            let mut_token: Option<Token![mut]> = if f.borrowed.is_none() && f.captures.is_empty() {
+                Some(Default::default())
+            } else {
+                None
+            };
+
+            let mut accessor = quote!(&#mut_token #this.#member);
+            if !f.captures.is_empty() || f.borrowed.is_some() {
+                accessor = quote!(
+                    // SAFETY: we have `Erase<..>` which we know is layout compatible with `f.ty`.
+                    // Field lifetimes in `f.ty` can be shortened to `#ty` due to covariance.
+                    unsafe { ::core::mem::transmute::<_, &#mut_token #ty>(#accessor) }
+                )
+            }
 
-            if field.pinned {
+            if !f.captures.iter().all(|b| b.variance == Variance::Covariant) {
+                // If the type is not covariant, it must omitted, as projection shortens the
+                // lifetime to `'__this`.
                 (
                     quote!(
-                        #vis #name ::core::pin::Pin<&'__this mut #ty>,
+                        #vis #name ::pin_init::__internal::NotVisible<&'__this #mut_token #ty>,
+                    ),
+                    quote!(
+                        #name ::pin_init::__internal::NotVisible::new(),
+                    ),
+                )
+            } else if f.pinned {
+                (
+                    quote!(
+                        #vis #name ::core::pin::Pin<&'__this #mut_token #ty>,
                     ),
                     quote!(
                         // SAFETY: this field is structurally pinned.
-                        #name unsafe { ::core::pin::Pin::new_unchecked(&mut #this.#member) },
+                        #name unsafe { ::core::pin::Pin::new_unchecked(#accessor) },
                     ),
                 )
             } else {
                 (
                     quote!(
-                        #vis #name &'__this mut #ty,
+                        #vis #name &'__this #mut_token #ty,
                     ),
                     quote!(
-                        #name &mut #this.#member,
+                        #name #accessor,
                     ),
                 )
             }
@@ -935,6 +971,49 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
             },
         )
     };
+
+    // For fields that references other fields, field access syntax stops working as they're wrapped
+    // behind `SelfRef` because their actual lifetime is not on the struct.
+    //
+    // Generate an accessor method for them.
+    let mut accessors = Vec::new();
+    for f in info.fields.iter() {
+        let ident = f.member.as_ident();
+        let member = &f.member;
+
+        if f.captures.is_empty() {
+            // They can be accessed normally, no accessor to be generated.
+            continue;
+        }
+
+        if f.captures.iter().all(|b| b.variance == Variance::Covariant) {
+            let f_doc = format!("Access the `{ident}` field on a shared reference of `Self`.");
+            let vis = &f.field.vis;
+
+            // Use the span of type for better error message.
+            let span = f.field.ty.span().resolved_at(Span::mixed_site());
+
+            let all_lifetimes: Vec<_> = f.captures.iter().map(|b| &b.lifetime).collect();
+            let ty = f
+                .field
+                .ty
+                .replace_lifetimes(&all_lifetimes, &vec![&this_lt; all_lifetimes.len()]);
+
+            accessors.push(quote_spanned!(span =>
+                #[doc = #f_doc]
+                #[inline]
+                #[allow(clippy::mut_from_ref)] // false positive when `&&mut` is returned.
+                #vis fn #ident<#this_lt>(&#this_lt self) -> &#this_lt #ty {
+                    // SAFETY: we have `Erased<..>` which we know is layout compatible with `f.ty`.
+                    // Field lifetimes in `f.ty` can be shortened to `#ty` due to covariance.
+                    unsafe { ::core::mem::transmute(&self.#member) }
+                }
+            ))
+        } else {
+            continue;
+        }
+    }
+
     quote! {
         #[doc = #docs]
         // Allow `non_snake_case` since the same warning will be emitted on
@@ -961,6 +1040,8 @@ impl #impl_generics #ident #ty_generics
                 let #this = unsafe { ::core::pin::Pin::get_unchecked_mut(self) };
                 #projection_init
             }
+
+            #(#accessors)*
         }
     }
 }
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index d06583e236a6..2410156a0c99 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -5,6 +5,8 @@
 //! These items must not be used outside of this crate and the pin-init-internal crate located at
 //! `../internal`.
 
+#![expect(clippy::new_without_default, reason = "private API")]
+
 use core::marker::PhantomPinned;
 use core::ops::Deref;
 
@@ -677,3 +679,13 @@ fn deref(&self) -> &T {
         &self.1
     }
 }
+
+/// An alias of `PhantomData` but with a name to aid user in case of misuse.
+pub struct NotVisible<T: ?Sized>(PhantomData<T>);
+
+impl<T: ?Sized> NotVisible<T> {
+    #[inline(always)]
+    pub fn new() -> Self {
+        Self(PhantomData)
+    }
+}

-- 
2.54.0

