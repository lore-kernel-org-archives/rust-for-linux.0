Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022082.outbound.protection.outlook.com [52.101.101.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC1349DBB4;
	Tue,  6 Oct 2026 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300614; cv=fail; b=OvfImvtTGokPcWUPG2VF51jfRhvyL7HUQs17gvs8HBx43WD04Ynd9ZFpBvnZK7HVcpkamUUsHmr+xJ80CUSIY/jFJYcE0rEsdB1vycQd9RILWtASinnGo3Yo4bqBPphUGycGENGhPuvgOc7TyUY3uwOArpoL0mKpJvPQ00uIB4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300614; c=relaxed/simple;
	bh=OcBcjGWNlrebvdGIIrRLPaixfokuxpmkoJTUKlAZ82g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=h8Xoavrmc5nVG5O/pZSVquvqhLnfwOpSC+R21DGIbZWGthD38YEEY1p1+W20M2bPTWCE/ssZwEjxsCQnqMEgs7YfIOK41Cgv/CO4yplbSlXZPnuCKF4xeB5dPT/7y+iYiI26BlsCPOs09reVpiuv4sq1pYjJpw58YpWc1v3/Bg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dNA3627v; arc=fail smtp.client-ip=52.101.101.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dNA3627v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ariEhXr4w4REfP6UxoyBfn9OPNBrE1k2KGcLc23GhTBrB4THm0Fbc7YpF4hf7o+EQBtocG+nbhqtyljC4+7/sf/yQRHSS23ua+x3A7u9B4SPsqUXMl9uty0Jj97AnX0G3P0mwG2shmUvi2bvPn4J5qfBl+nruOwdByU/c3YcSwaxRcFdy4Gm7ccm6Egd6JO2t8A5XGOe+tk2Kal8lU9iy1aUOQZvEyCDD+4w0JVMD2PYaar9Fy15JHCuz5/m+RFl/bgUvL+u6+WF9y2MGoyR7/jxo1C+Ahd4T1ES0LoZf/cAyca6ZvGxk9IEGGbOcEiPPpbY9F61Rno4rM2Fy3hLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymrZGE2s3jKkywzUf2tU+kcKratbcS5pvQtEtR8tbj8=;
 b=VMDMsAnYnKT4Dw0aeLLsrvWYhuLPtOIZbr/QcQmKyJ3UEGVs6qu+yfRceDX0J6PhQi1Om2L45oMhg7kAz6TZMDRrWoKs/vIME1F1tGlzOrowS3Us4pPFcH1otcgQnDfHn5AfKiqNN10EnZl4q8Tn34QEjG7pMmaZuDsB+ImoFV3W8+8Qr35C+5yCTNPkC4OPBp9g1hTKi78qJyZP9V10Vz4K29cEQLW+fTWDhkzuGQnEF18WqT7X2pcq066y+S8xW+mZ/1sWhfLGLxvVnL63tTPa9sXUjmLu7lKR4O7bcQHG2BtINu4eMXtnDj6zeIMAAyXfrDh1M/ev5sImSEJE6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymrZGE2s3jKkywzUf2tU+kcKratbcS5pvQtEtR8tbj8=;
 b=dNA3627vmey8vTrREV/DxqtI3E4yYZ1V647x570zZQ1o/YrtB7JB+lRr+lCACRWtzEi+M1qeXDjD3z2dTct1XqPTHvhZzxu0ixL48Kjdsb5EowncFRo/XWI3HoFzwvlbd93RxQCCn6yuBUhbtgaoc4quokMXUZPO5Ote+WTOX0k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB1817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Tue, 6 Oct
 2026 15:29:57 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 15:29:57 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 06 Oct 2026 17:29:36 +0200
Subject: [PATCH 6/8] rust: pin-init: internal: pin_data: extract `#[cfg]`
 processing to its own function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-dev-selfref-dep-v1-6-da716f740d6d@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279; i=gary@garyguo.net;
 h=from:subject:message-id; bh=OcBcjGWNlrebvdGIIrRLPaixfokuxpmkoJTUKlAZ82g=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWUeF381/xv4xKDBE/Li70/3HN4vY/luVqrPr6728N
 cm2fsXkjYkdpSwMYlwMsmKKLB7djGmbGGfLXtYqfwkzh5UJZAgDF6cATOR4DyPDl92hZyUW5yxM
 sJbL0H9x4NKSkolbXFazbDh6ZteWBzXpPgz/s/bPPT0lM79b9MNTfkmFJ91SOs9Wn1atW7hC1fj
 9+y0RDAB2VEoo
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
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB1817:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d081c90-edd6-4d74-195b-08df23bead86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HzUlyA6J5W1usFzf2LQpxwqKusOdNYHEprWm2q9LCtgCzc/nua63kdcycczhiBR4yBM5n8Bpd+mI2jBaJT7sMx7WD1IeQt9w7txDU5I4IQAwCVrpqHWpLfAH7BxScc1j6I754Tif4XfdRHixuuDYUXS7K7tAdqWvW7IIBdfjDalLiKJxtR47vQIMAY9czA6PFS24cUvAy2DBX1vWVa5nywW8w+a1ToGlcwrrGnz1os64mR92OoC/IaYnzQ1nx59BBS2aoTkRMhOH+r3irBr1I/U7NaZHL6q8twfyoo8m1u57W2MZgNL3Eo68Jad7U/mKCA4zByilZCPJuf757TM7jrOPAEhCka6a9WizWApj0om/zgDKqZ5H3b5UR8FtcJ/g7S58jU6cdYsxqGFI4Q6BWGJhhAmZSdRDR3he3OfXKix25NfCWgtMdIM/3aLyGwk0aingW0p2GNsbR5s0R5gMjkaeQjbgWzG5fez6gJ3wfEFbyZj7bqJa52lkuPtyD2+sCNyP9uEV+puxOMHribGQTDfMDUgvpvDJmKPts+clPiOznEL7UfghIugACc0IaLEvaXdn6s/DaL4Z870lzCtv/H+x1oqWOjSDxEaZ1CFElWlb4txGXzlMnfy4hHKbvTZ55XXRc/gR4VjLPnTXdFdu603WgFYjS5mUXAgwQ1AUDIKMIYbq8wQ57BvObYfDU8aBdNpKcdS2KhZ95Qwtr1qRHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVdQSklKcDg5cldmTm9Tc0dHSnoxNkUrVzVubWt6cDl3NmFNc09mck8zWEVa?=
 =?utf-8?B?Z3d2RWlza2xmUTYrcWJNR1ZmZ3ppY1lWbTFjeG1oQ0J3bEljemVBRnBEbm16?=
 =?utf-8?B?NDVoNHF0YmRvbzFkUndDUkR6MlpIanJ4MFJUcjliTVRaYzMrd0ZZekhzblpJ?=
 =?utf-8?B?N1J2WXNQOEVoYXJsMUorMGRiNDFGTzZvVVBzbFJ3NlVwWjlXQWlwZEM4NDNj?=
 =?utf-8?B?c0EvTmkyQ25FRFQzbTBIU1JmY2dYc1pjcWU4RVk0anJxQ21scnU2b0NDUUQ0?=
 =?utf-8?B?cDEvemZlZkxIQkoyTURwOFVKR2o5VS9LdUJRK3JUOXRwRzVtKytsVFBWWTZJ?=
 =?utf-8?B?YWhxeE5FV1VqSXA2M29yMko0bldWaVBFNThtZ1ZLZ3BjbTR4M21KSnROdWlC?=
 =?utf-8?B?a0pYSXhFWG00VGhqWkxhaExlMDZJUXV6NWFhbVRYelpyQzZLU2lZVEt4R3dn?=
 =?utf-8?B?WXhDSzRKMS9SOW11WjhXcnZVWlBCUFdGckxsQ0I1L0JGNEtwRnFpMUNSZUhR?=
 =?utf-8?B?a1lFUzBzQUtrQjlhbzI5TmpSUDU0MW5aTTRnWGVuQ3pUWlgydWE4M1psSlM0?=
 =?utf-8?B?T09LMk10OHNEc251YUhtYWt6em1HeXJSSXV4NkIyd1YvcjFOTnM2ZVV3RVA2?=
 =?utf-8?B?YVp2RWlXWHErSHpiUk1EeU1ReEh6MG54WWtRd0p0elNHMXp4TzNuclFsVDJ3?=
 =?utf-8?B?ZU5uNVVILy9KS1BkcG13UUNvNkpvc2Rab0laaDFCS1hzbGowRTRONURydXBt?=
 =?utf-8?B?SlFkLzdvN2k2TzYvTCtlUE0zOW9xSDBVd0F4VGNEajdXQ0FUdWNZSWlzamcw?=
 =?utf-8?B?TW1rNlVSRUI0WVFlT0gxcjl5aGs4ZlhtWDVRZVhTYnZGcFVrclRYY3hid3pR?=
 =?utf-8?B?cUphdzFDcjJOTUNZeEFQdkNTM2RuYXNKQ1daSWVkNis0ZFo0aHRXR2dTMG9T?=
 =?utf-8?B?Z2FJZ1JrRXVqZnVtWjEzUC84SnpBTEkwNUdrSTJFM2ZpUmc2cUpURWZ1dzFL?=
 =?utf-8?B?eWtpdmFRc2xieEFQM0tpUGFJaUlpK2hyYmkrNlpVM1kwNS9nTVN5TlR1KzFu?=
 =?utf-8?B?dmRMNkxhdVVWcllPb0JqL1lHbVVqMmR4VXRHS0UyajE5QjZQcFBhMFFtc0ZT?=
 =?utf-8?B?eUpxRjNwYWphd2R4U0VRYVNSaUJxTWtoWktXTGczRmVmR1Z0N0E5QXNUVlpa?=
 =?utf-8?B?Z3JRKzdqd3V3OS9ETTNOWWMzYWN0NE00N0pOTnIvOFJscUx1azV6bVJLM3N0?=
 =?utf-8?B?ckJOOVBicXJDN2ZqTUdtblRFREhwWUM5QTZzN1B0ODZWZ0xpay9LY0VkSXRj?=
 =?utf-8?B?ampoT0pNUGVtMWFrdzFKQ3JpMmRIMFdSU1M3MitON2cwY1hQSWxEd2RtcWQ1?=
 =?utf-8?B?SmxKejNLRnN4cmxJcXRsZTI3MUZhVDFTTGpEeXk3L2VFQnFISGQ4eEhBVjZQ?=
 =?utf-8?B?d2RBUWR3bGJrR1RMR0dxMEttY1VOVDZKcjRvcjVRTlMvaTVTWHJYUUx1aVpY?=
 =?utf-8?B?Qy9RbWRwdWg5QWcvdGJlUWlOMjUxRlVSdzkvdmt1NWpEQ1lCV0RKcmVEN2tE?=
 =?utf-8?B?QXBDYXNwZ0FTU0RYZ3lLOCthTWhwOTQxQ0xUODg0UjJ2dzFPdllPVmxlNUZ5?=
 =?utf-8?B?S2ltUHphL1h6QjBDR3llcDg2TlcyOXVHMGFBVzc3c0VBbWVhM0MwbXpNdTlY?=
 =?utf-8?B?RmVCVktkNDUyaHI3Ri95bnpiZmNqaWRXeFNoaEFIRklXZ3daZEU0Z0tmcldq?=
 =?utf-8?B?djNhcHNzdjZOT2owRk9iazN5TGdLL01icmNmcEEzNUVuY0lrTTF0NjUwOFFv?=
 =?utf-8?B?UzA0RVBpUnBjWEE5czlxalVWVW9mdmh0Yjg5SVBMUmdWczBEVTU0L2wzNTdz?=
 =?utf-8?B?QVEySnNDQTBsblB6dFg2NFdsZmJhZVNOL1ViT3FKWldQeWhnTmRDUVJUVUZX?=
 =?utf-8?B?Y2F6ZlhvbkZTODVKMGpDaXNTMTlMTWdBYU1wcVoyckNXU0dvMWFSbFpNd3Fp?=
 =?utf-8?B?WE1hM1R2cGhCUjhzOWI3UkRFb2RvUXhRV1c2TkJGWWJKZEpNeWxoZ1c4TW1P?=
 =?utf-8?B?YnhiQ0pES2dQcU5KMENEYXpuOWdLT3Y0elpzcU50WGhUZEtaeUpqbEJGRU83?=
 =?utf-8?B?UC8zaWU5SWdrVWFVT2U3RG14RkRQM1NRczd2ZnRONDRXKzI4c0N0NWFIT1hs?=
 =?utf-8?B?Ni90YWkvR240OVhBNkdtSk5FWlhtY2RSRXBOSHk3bDg5ZTFJZFdTNjZWcEpR?=
 =?utf-8?B?bUFFZTdBTUVtbVdDT0xOL202WW5sRjF0aWFXUmZUNTcvZ0IrdXZHOTVHT1dt?=
 =?utf-8?Q?YrNRNTVR68LwFTwHan?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d081c90-edd6-4d74-195b-08df23bead86
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 15:29:57.2871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AbnDcQxcuhLVZ2zY7V0cWiNIdDDtxd1lW2qfzFqUI5YXZivM7NEiuI6UFz0dPDsOLGJF/8hC+rfGFomi4eW/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1817

The `pin_data` function is getting big. Split the `#[cfg]` handling which
does not interact with other part of expansion to its own `expand_with_cfg`
function.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/lib.rs      |  3 ++-
 rust/pin-init/internal/src/pin_data.rs | 13 +++++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index 07b3d33d2282..01e19fcd31fb 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -22,7 +22,8 @@
 
 #[proc_macro_attribute]
 pub fn pin_data(args: TokenStream, input: TokenStream) -> TokenStream {
-    DiagCtxt::for_item(|dcx| pin_data::pin_data(syn::parse(args)?, syn::parse(input)?, dcx)).into()
+    DiagCtxt::for_item(|dcx| pin_data::expand_with_cfg(syn::parse(args)?, syn::parse(input)?, dcx))
+        .into()
 }
 
 #[proc_macro_attribute]
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 3acced1fe806..a4d6965c1572 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -8,7 +8,8 @@
     punctuated::Punctuated,
     spanned::Spanned,
     visit_mut::VisitMut,
-    Field, Fields, Generics, Ident, Index, Item, Member, PathSegment, Type, TypePath, Visibility,
+    Field, Fields, Generics, Ident, Index, Item, ItemStruct, Member, PathSegment, Type, TypePath,
+    Visibility,
 };
 
 use crate::{
@@ -54,7 +55,7 @@ struct FieldInfo<'a> {
     pinned: bool,
 }
 
-pub(crate) fn pin_data(
+pub(crate) fn expand_with_cfg(
     args: Args,
     input: Item,
     dcx: &mut DiagCtxt,
@@ -120,6 +121,14 @@ pub(crate) fn pin_data(
         ));
     }
 
+    expand(args, struct_, dcx)
+}
+
+fn expand(
+    args: Args,
+    mut struct_: ItemStruct,
+    dcx: &mut DiagCtxt,
+) -> Result<TokenStream, ErrorGuaranteed> {
     // The generics might contain the `Self` type. Since this macro will define a new type with the
     // same generics and bounds, this poses a problem: `Self` will refer to the new type as opposed
     // to this struct definition. Therefore we have to replace `Self` with the concrete name.

-- 
2.54.0

