Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022094.outbound.protection.outlook.com [52.101.101.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABAD49DB87;
	Tue,  6 Oct 2026 15:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300611; cv=fail; b=Y2+/xAZIToEP2oTVV3k8KpfPYY3X5AJdGcVR7jvwTO4kEcisrPLcMNI5XEKBbdl0R50LppGrXMjmA7FnsuQLeVL1aQhW00WDGjtTw66z+L1NfUf/zM/kFlapUosaUhPlCqsnyuLU0PbnZ87gx6q2B/dmdJHw0I5bSciUMSdoEJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300611; c=relaxed/simple;
	bh=g9OLoJXRJl+BNN7kK9XUAS9lpfhJTYGEkueldXs9WEU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oFM8md1jdwo3UEv0ZC9+lW8Bb+cY5qO+ook1cQe6/jm3Oi1kK1fV9Dv29dIksSqUo04SrneyTO8X4W/GgfUv3QC8eDcVosoSs7X610Kn9cVnutiKYNtwcbT0Y07M9SKa+NB+9vNg/jsbc2jb/bqGt14eLlhrS71WxJbiZ9xiyjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZA1nzhk2; arc=fail smtp.client-ip=52.101.101.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZA1nzhk2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9hAyAHDc3NXO52SYqLUIN/nffj7yMaANA/GcZ6fD9x9MGUrwcQYa6Cdp2dXcHEBKq8rPcj8uUFskDHc/S3JYope+HcNzpi4BD3Uf8E39pl/hfODmV6mO2lrdpvgdWwImdVEMY6OEyDAjJfCIiwzKv116eyJEWIbJxIEXsa6fv4gi/aCbj+xqpP9ulkBxlZNE0sAtVSuiZQvzOoxw/tk+Ua4yUJFTdnxXpMzI7pk3ylRSLg9QDnNBLaNjSIfK9ApLwgUkrWWRu4TsJ6q84DY6Kkfs2ZkV5HhkNPTDp8R1e2Ut6GVdq8B1Q5i/AyVy/WsG4eRDB5zEm2c0ls34uOY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDw+kB4abFJhmgFxKZkilD46mccDLKBK7PolXHmQgI8=;
 b=EOLVVakZ1BNGwANcZiQ0J17gi0IXj2lFRg05bw+qgiu8y+ggC957qHaYGMkNIGZi9gY7mSsv7DGQL8cKHo6P8cvYgrh6zOqdCBGC9OOOFNiJitMGujH+I87pwdHtpnwn427q5c88LM6pgOt0YYw6bD3uSeLvntLp2qeGUV2YFXbL3O/x25RWnaJ/otOGYHFEGxzxM0Pv7aoc9ZjpAzH7BpWe2YGvToNRiyojJnXvBEW+60KjetAcYpQup0MAv7s5Sj26bEwHbwvADiD82H65+WQh0ORbxy9kJDkIW9O5c1DtKRbeBYH9VTkX/4skzmioowWETRKiiTLqg1MO1rKxSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDw+kB4abFJhmgFxKZkilD46mccDLKBK7PolXHmQgI8=;
 b=ZA1nzhk21QTp8eHs3kTcm8iEVr0NjBMSPat7HWxbFo9DrLocD2mjwPFpeJYvK+CNavX9PA55h11UemjzQu2vOKW/kUk6oTbxhjp+Cq1kUr9CIG1m4aG/hkh/vajVleTViR2vhiC1wHy/FvBgW7Dys8QTjosPp9DZnIcRKZEiQ8U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB3101.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:162::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 15:29:59 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 15:29:59 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 06 Oct 2026 17:29:38 +0200
Subject: [PATCH 8/8] rust: pin-init: internal: pin_data: parse into
 `StructInfo` before generating
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-dev-selfref-dep-v1-8-da716f740d6d@garyguo.net>
References: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
In-Reply-To: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10095; i=gary@garyguo.net;
 h=from:subject:message-id; bh=g9OLoJXRJl+BNN7kK9XUAS9lpfhJTYGEkueldXs9WEU=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWUeF3/1ff/3YjDBf1ahN7ZklKRttPs9OPSVj1fzkg
 0L+P+bLL6w6SlkYxLgYZMUUWTy6GdM2Mc6WvaxV/hJmDisTyBAGLk4BmIieAsN/9wDzA2ud7b5H
 f3XsWrX4LC/rwe6uI/oBluvWlXueXX03mJHhr87XHQpFaxh/e7W82SN/t1HW8O+c7J07EoWeFju
 FWU3hAwAVh0mk
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: VI4PEPF00000161.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::86e) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB3101:EE_
X-MS-Office365-Filtering-Correlation-Id: 350958d0-0b2e-49d3-c667-08df23beae8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|921020|22082099003|18002099003|6133799003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	f3Zg4LnEDfzZqDo7tTyll+Hr1RPrytlO9tWxjVryn7uD+wwaMvogATSD8RC7RuTlhbSdm8fVYVLdq42/1CZ6oWUNVa7Ec+MaE3kml9LWoVnMmgXeWRxK/VtdkNjcAYP8P92jVva4aLpbcgpcGnUPPCDzDDKQPoGganHxquviJBoIpuFyBqBCPINkhs5FpGQhMGze2Pz09iNxaK4mFc62Bl8BjTwPSGspL4XteC8ZjFYYGo3uw6RFnlQFF0tZm6z8APS4V9J23VIPHUzMiT0y24odAHPuPSUhE8vLvyYfd+w3b4GPDYtdVT7D1HMoExlqF86IOUxJdi0v66s8zQhE5QJqKOcNG9rPvdeAXMe4CuTUs2QMj/M+O2a3nxsSBMzphETHNJmnp8/6zJnFsoWI8lUkvUHcPJHn1L9CS9EON1yaBenzBRaK1mH1Gq3rp1SdCX6VBtH3mEABn3FCqVwcCfAZxg1Xime1GLcwlvZ57snAUl/T95uU5ky7q7diDOKIjZn2OqTGzaFLy8wGeNH0Pg/AsgUKpulM51T64sy6DjgBTtlMRmO9VjB4MUD1qkEK011HdbjQWagjiI4yenCvkl0f1nRpAQ34ypzfynb64TpzYY2rrakl2hQcDJDK9YkKN61pkBGLcQ3HRsQFZ2hbZnJB8j31+eu8iq7ycGgsEQwOLJYCcV43i7bbOFe3cWNJ0fkdl0634aNLP93WZewH6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(921020)(22082099003)(18002099003)(6133799003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGQxSFJLS3VRY3dzQkYyb0RTd2I0MVM2M09obUVWaEtMYnZkeHEyQ1ZKVVZC?=
 =?utf-8?B?bmlISisyN0VrcUdDbjNndnRaUEtHWVVEVTc4UWFsbkR3Y2EyOVp2Uk5GZDgx?=
 =?utf-8?B?WElDVGlmcjZubFJoeFBpUGRPNUFIQnhZNjRiR2hNWlVlaDhPNUxTMnRPZEVn?=
 =?utf-8?B?QmRyNkY4U2ZWbHdMdDZvN2k0MzFySnRycXhHMGJDMHBGUkhHaWlIL211WlJL?=
 =?utf-8?B?dmRNV2dxZVZjUUtUd3RqTHl3bmR5YXJacy85WTU4RHpRZXZJc0gwdU1OTUp2?=
 =?utf-8?B?bG4yOU94ZFprRDdIc3hmMU5BUDZha0lWb2hmR1BKa0RLNVh3WFBmZ2xKR0Iw?=
 =?utf-8?B?WWV6ckgrSXVDWTFaeHUycGsvcHcyQXdnQjBCSmpydzM0V1FEYVpWWEVVcVNt?=
 =?utf-8?B?Tlp2UmhhLzlvdWFtNXB0L1RkS0dOeDU1eTdFcUc2RG45YzYrV2E4ZTJibjFY?=
 =?utf-8?B?Z1lkZ29yWjFKYm0yTXVvZC8zeXRJRVF6aVZ0Q0hsSTBsQW9MdjU4Q1N6dU5N?=
 =?utf-8?B?OGxKVzQxRHY2NHhzTDVuV202bUdKWTRqK0VCNjh3MDI5TzcxM1Nuc1JQTVY4?=
 =?utf-8?B?QVJ2ZVBHTThqS0VBbFN0YU1iUzJDUmwwQTY3NVZLV2FVbHZLR1o3RktjMG1L?=
 =?utf-8?B?LzNGa3FjWEdZWGUrSUw3bCtjN1ZVeW82TWhCOGkrU1JWM1UyMm1teThtV3dP?=
 =?utf-8?B?amIrSkxFNFhuSXN2QzhXdnBQdDhaSXpYdXFWVnNoSStqdnA2aFBpRHZpNjlM?=
 =?utf-8?B?WEVzTjlCeFN4b2ZKVlhkdSs2WUVSZGhQdWVHTlZwMFhHTUJ5Mms4S0hJRXl3?=
 =?utf-8?B?dkE1eldJeG0vNFV2SmVqbVF6bzlqWHV0b2JnSXJ2cEFJU2V6MHdYVzRhUlhi?=
 =?utf-8?B?RXNFZm5YcTZjTTRzaWJqRktIZnhqTVdKYmhFTkNVek1XZE1oRlZabWtFdk4z?=
 =?utf-8?B?QmlMUW51UlBPY1pnVHZUOHlLTkZGSHNobUxXdXQ2UkNLTFpoRjRrT3pIY1N3?=
 =?utf-8?B?WFhPdTN6a3N1T1Q4Z2ZhdWhhZTRIMUN3aGczZER3Rnp1azViOTIzRFVveFMv?=
 =?utf-8?B?OUNMamxjTHZBRHZ4L1dDQ1Qxek9tWGdkYWpBZzVJOFdTYmhnTE1kTHdFcnhl?=
 =?utf-8?B?eFFUSUlkSWI5SFNoZTVvdDEvTk1IZy9LUHpYb0JLdzRtR3lYYVJoamRJL3Fm?=
 =?utf-8?B?NExIVkR3dHVnZWMvL2ZEVFg4VWZmRC9INTN0QTdpT1hoMnk5TnVVKzZIN2J6?=
 =?utf-8?B?azFIaGZ0dTRqVEhTUS9yY1lSNkkyallsamQ1c01sREpKaGY3ckFPZGdGV2R2?=
 =?utf-8?B?cjRheEgra1UvYjY1Ym41dGMyQ1IxUm95TGtWeVNGWHpDT1BvSTJ0N0FIeXVp?=
 =?utf-8?B?V3Qra21xakFFM0w1Y0NROVBQMHdyeHFkNGZaSXJiNGwrdWNIRXphQ3cyMkpG?=
 =?utf-8?B?YlBEdXdyTVFxbk5RSlZGdEdhdHZvbEM2c085RTVZc2ZUWHZzZVdJVUdUOXR3?=
 =?utf-8?B?dkN5TitIZHNOQ3Q0em9KTnROK2VKeW5zOTZQVDJ0MUY0UnFJWGZDNGlRbHYx?=
 =?utf-8?B?S2ZuUVhrMkFSNExSSzB4ZkZ3NjhDQmpHTHAwTGxicFR6dk94MFBDamlrVkdI?=
 =?utf-8?B?UDVoSlVBbVBGcVdoYUpWZHRFWlhXc2RYUEoxTGNwcGVNVWpTUjdmRnJzUkND?=
 =?utf-8?B?aUREZktub1FsWEVETkVKamw3bXRpMTkzaG9XUTJPa0NPMTlFcUxUTFJsY25a?=
 =?utf-8?B?MU1oK29UVWtVWDQxR0RybU9zdHV0bDEwUmplektoNTBGcXArOG9SUmtOanZG?=
 =?utf-8?B?cXJjQi9vSHhVQVYwYktjNnozMFJtaEgvaEMzS1lVSXEreE9ndDlUK1Jmdk1Y?=
 =?utf-8?B?eng2Nm82ekJNTko4OVZtdmRyY0llc3BMY1VpZDFFSlF2L2JCejNtZG1Pa1p4?=
 =?utf-8?B?bXhNblJ5T0M5cWdNaVA4V2hqc3BvWFpBdGczM3p2US9nVnZMTGdxWGxxd1BZ?=
 =?utf-8?B?cng4TzM1MXNheVk5OTdRbWFNemZmT2ptaEJMaE1kRnNkbDQxdUFZQ05nQ2Vq?=
 =?utf-8?B?d3FkVmVMZUM4QXRZYUU2WW5DSm12YjJWaGQ3M1pGa3RVRk1tVUZndnhkb0lG?=
 =?utf-8?B?bVh6OVpna0JhaFFXNjFwOVFxL2xYZGVEM0ZmM1ozcEJUY1JLbmU1Q1h1REgy?=
 =?utf-8?B?WXloaUhRbHFnbjRxQ0F1YTZIRVhhOVIwM2Jra2kxV2M0Y1RXSjdrMS9uT0ZO?=
 =?utf-8?B?Zi9wWUo2U09Xd1lmRHRvYk5TaXFxaHlEU2lDR2JReCsyMFcyUVpvazQ3OHpi?=
 =?utf-8?Q?HPjuJkD2Q7jDgO+3B7?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 350958d0-0b2e-49d3-c667-08df23beae8e
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 15:29:59.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDGBNgWEBnQZYvY/XsNmU4/1nN1VehUOs/3wkrZ25xGIT38Nx1SdWQrOaRQobFWTPnu0wereXh7bd61VaRFARQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3101

Organize parsing and generation into two separate phases, with a single
`StructInfo` in the middle. This allows analysis and processing to happen
with a single struct and avoid having to pass different information into
the token stream generation functions.

A drawback of this approach is that as we consume the `Fields`, we cannot
expand the original struct using `quote!(#struct_)` anymore, and the field
needs to be re-constructed in `generate_struct_def` function. However, this
is only a temporary drawback, as the upcoming pin-init self-referential
feature will require modification of the generated struct anyway.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 162 +++++++++++++++++++++++----------
 1 file changed, 112 insertions(+), 50 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 6e18bc9e890a..03e893cf5475 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -8,8 +8,7 @@
     punctuated::Punctuated,
     spanned::Spanned,
     visit_mut::VisitMut,
-    Field, Fields, Generics, Ident, Index, Item, ItemStruct, Member, PathSegment, Type, TypePath,
-    Visibility,
+    Field, Fields, Generics, Index, Item, ItemStruct, Member, PathSegment, Type, TypePath,
 };
 
 use crate::{
@@ -49,12 +48,19 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
     }
 }
 
-struct FieldInfo<'a> {
-    field: &'a Field,
+struct FieldInfo {
+    field: Field,
     member: Member,
     pinned: bool,
 }
 
+struct StructInfo {
+    args: Args,
+    struct_: ItemStruct,
+    fields: Vec<FieldInfo>,
+    is_tuple_struct: bool,
+}
+
 pub(crate) fn expand_with_cfg(
     args: Args,
     input: Item,
@@ -141,11 +147,11 @@ fn expand(
     replacer.visit_fields_mut(&mut struct_.fields);
 
     let is_tuple_struct = matches!(struct_.fields, Fields::Unnamed(_));
-    let fields: Vec<FieldInfo<'_>> = struct_
+    let fields: Vec<FieldInfo> = struct_
         .fields
-        .iter_mut()
+        .into_iter()
         .enumerate()
-        .map(|(index, field)| {
+        .map(|(index, mut field)| {
             let pinned = field.attrs.extract_single_attr(dcx, "pin").is_some();
 
             assert!(
@@ -161,17 +167,25 @@ fn expand(
             };
 
             FieldInfo {
-                field: &*field,
+                field,
                 member,
                 pinned,
             }
         })
         .collect();
 
-    for field in &fields {
+    struct_.fields = Fields::Unit;
+    let info = StructInfo {
+        args,
+        struct_,
+        fields,
+        is_tuple_struct,
+    };
+
+    for field in &info.fields {
         if !field.pinned && is_phantom_pinned(&field.field.ty) {
             dcx.warn(
-                field.field,
+                &field.field,
                 format!(
                     "The field {} of type `PhantomPinned` only has an effect \
                     if it has the `#[pin]` attribute",
@@ -181,20 +195,14 @@ fn expand(
         }
     }
 
-    let unpin_impl = generate_unpin_impl(&struct_.ident, &struct_.generics, &fields);
-    let drop_impl = generate_drop_impl(&struct_.ident, &struct_.generics, args);
-    let projections = generate_projections(
-        &struct_.vis,
-        &struct_.ident,
-        &struct_.generics,
-        is_tuple_struct,
-        &fields,
-    );
-    let the_pin_data =
-        generate_the_pin_data(&struct_.vis, &struct_.ident, &struct_.generics, &fields);
+    let struct_def = generate_struct_def(&info);
+    let unpin_impl = generate_unpin_impl(&info);
+    let drop_impl = generate_drop_impl(&info);
+    let projections = generate_projections(&info);
+    let the_pin_data = generate_the_pin_data(&info);
 
     Ok(quote! {
-        #struct_
+        #struct_def
         // We put the rest into this const item, because it then will not be accessible to anything
         // outside.
         const _: () = {
@@ -230,17 +238,63 @@ fn is_phantom_pinned(ty: &Type) -> bool {
     }
 }
 
-fn generate_unpin_impl(
-    ident: &Ident,
-    generics: &Generics,
-    fields: &[FieldInfo<'_>],
-) -> TokenStream {
+fn generate_struct_def(info: &StructInfo) -> TokenStream {
+    let ItemStruct {
+        attrs,
+        vis,
+        struct_token,
+        ident,
+        generics,
+        fields: _,
+        semi_token,
+    } = &info.struct_;
+
+    let generated_fields = info.fields.iter().map(|field| {
+        let Field {
+            attrs,
+            vis,
+            mutability: _,
+            ident,
+            colon_token,
+            ty,
+        } = &field.field;
+
+        quote! {
+           #(#attrs)* #vis #ident #colon_token #ty
+        }
+    });
+
+    let whr = &generics.where_clause;
+
+    if info.is_tuple_struct {
+        quote!(
+            #(#attrs)*
+            #vis
+            #struct_token #ident #generics (#(#generated_fields,)*) #whr
+            #semi_token
+        )
+    } else {
+        quote!(
+            #(#attrs)*
+            #vis
+            #struct_token #ident #generics #whr {
+                #(#generated_fields,)*
+            }
+            #semi_token
+        )
+    }
+}
+
+fn generate_unpin_impl(info: &StructInfo) -> TokenStream {
+    let ItemStruct {
+        generics, ident, ..
+    } = &info.struct_;
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
     let predicates = whr
         .map(|x| &x.predicates)
         .unwrap_or(const { &Punctuated::new() });
 
-    let pinned_fields = fields.iter().filter(|f| f.pinned).map(|f| {
+    let pinned_fields = info.fields.iter().filter(|f| f.pinned).map(|f| {
         let ident = f.member.as_ident();
         let ty = &f.field.ty;
         quote!(
@@ -271,9 +325,12 @@ impl #impl_generics ::core::marker::Unpin for #ident #ty_generics
     }
 }
 
-fn generate_drop_impl(ident: &Ident, generics: &Generics, args: Args) -> TokenStream {
+fn generate_drop_impl(info: &StructInfo) -> TokenStream {
+    let ItemStruct {
+        generics, ident, ..
+    } = &info.struct_;
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
-    let has_pinned_drop = matches!(args, Args::PinnedDrop(_));
+    let has_pinned_drop = matches!(info.args, Args::PinnedDrop(_));
     // We need to disallow normal `Drop` implementation, the exact behavior depends on whether
     // `PinnedDrop` was specified in `args`.
     if has_pinned_drop {
@@ -318,13 +375,13 @@ impl #impl_generics
     }
 }
 
-fn generate_projections(
-    vis: &Visibility,
-    ident: &Ident,
-    generics: &Generics,
-    is_tuple_struct: bool,
-    fields: &[FieldInfo<'_>],
-) -> TokenStream {
+fn generate_projections(info: &StructInfo) -> TokenStream {
+    let ItemStruct {
+        vis,
+        ident,
+        generics,
+        ..
+    } = &info.struct_;
     let this_lt_generics: Generics = parse_quote!(<'__this>);
     let generics_with_this_lt = CombinedGenerics(vec![&this_lt_generics, generics]);
 
@@ -333,14 +390,15 @@ fn generate_projections(
 
     let this = format_ident!("this");
 
-    let (fields_decl, fields_proj): (Vec<_>, Vec<_>) = fields
+    let (fields_decl, fields_proj): (Vec<_>, Vec<_>) = info
+        .fields
         .iter()
         .map(|field| {
             let Field { vis, ty, .. } = &field.field;
             let member = &field.member;
             // The projection of a tuple struct is a tuple struct itself, so its fields are
             // positional and must not be named.
-            let name = (!is_tuple_struct).then(|| {
+            let name = (!info.is_tuple_struct).then(|| {
                 let ident = field.member.as_ident();
                 quote!(#ident:)
             });
@@ -367,16 +425,18 @@ fn generate_projections(
             }
         })
         .collect();
-    let structurally_pinned_fields_docs = fields
+    let structurally_pinned_fields_docs = info
+        .fields
         .iter()
         .filter(|f| f.pinned)
         .map(|f| format!(" - {}", f.member.display_name()));
-    let not_structurally_pinned_fields_docs = fields
+    let not_structurally_pinned_fields_docs = info
+        .fields
         .iter()
         .filter(|f| !f.pinned)
         .map(|f| format!(" - {}", f.member.display_name()));
     let docs = format!(" Pin-projections of [`{ident}`]");
-    let (projection_def, projection_init) = if is_tuple_struct {
+    let (projection_def, projection_init) = if info.is_tuple_struct {
         (
             quote! {
                 #vis struct __Projection #generics_with_this_lt (
@@ -439,22 +499,24 @@ impl #impl_generics #ident #ty_generics
     }
 }
 
-fn generate_the_pin_data(
-    vis: &Visibility,
-    struct_name: &Ident,
-    generics: &Generics,
-    fields: &[FieldInfo<'_>],
-) -> TokenStream {
+fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
+    let ItemStruct {
+        vis,
+        ident: struct_name,
+        generics,
+        ..
+    } = &info.struct_;
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
 
     // For every field, we create an initializing projection function according to its projection
     // type. If a field is structurally pinned, we create a `Slot` with `Pinned` which must be
     // initialized via `PinInit`; if it is not structurally pinned, then we create a `Slot` with
     // `Unpinned` which allows initialization via `Init`.
-    let field_accessors = fields
+    let field_accessors = info
+        .fields
         .iter()
         .map(|f| {
-            let Field { vis, ty, .. } = f.field;
+            let Field { vis, ty, .. } = &f.field;
             let field_name = f.member.as_ident();
             let member = &f.member;
             let pin_marker = if f.pinned {

-- 
2.54.0

