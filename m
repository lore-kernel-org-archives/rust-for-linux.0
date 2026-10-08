Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020111.outbound.protection.outlook.com [52.101.195.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4620501F45;
	Thu,  8 Oct 2026 19:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487632; cv=fail; b=c12vMQi9ecAKVrTmw4HXwwenqVV6cjSeS6mzudwSHXGtoUCTQcRhdrmdyxiWJS/fUF0rHPnanxEXA23fpPHYLPmIQDQ+pW4RLyPVGVu3K3s5ozzI65wlI+vHhrslYLp8y76dKsodYLt0RMTBCaxVajyVfXxja54udQvWdq0V9sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487632; c=relaxed/simple;
	bh=6l3PGFCv14lqDRIVALoXT/kZXndzUZXgQSh3Q0vVdes=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dWFdkpYMV4oq+gO4OyNTKd/ZfVDfuzlSF/0pXlf+x216DPaiwLnFJMujtiuRkyqG+QN45KYk8zMRMfjSQGOq+uIEV40h4D+NtMWoQDzcZVurZMLhVxrA46ER1hPBAipWV+PRly5AmmTK9p63KD2ysiJViEhVOULx81aSW103D1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=KXPn1MpA; arc=fail smtp.client-ip=52.101.195.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="KXPn1MpA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9bqczRrPURKENQnJbIQ8mTzJVHggYuGP/lLfXM0bkzlsonQidoCHCiZFxTnJR3D9/rlxM7kS6JXoNte6+ut6YLUCp6d0qRuQh811spzo98kucgQN04Wq51Jsv6Hi/ga4XYGtrtrMwwk3Ur/dcb0aV3Y9yEQaInIUxm1CG/tXVT9RfMSNcnchF0YFsQN5b188zuHrITQCJlkO4vzHqZWG5e/cTIymDNHUjXh3pHztjG17lEM1KDXwoDJtJRw9P3juoimupU4ZkFFBSTHOm+323SnAiLJj1jOx3f+joxOgBIAAImmRGxFI1cA75tU7WKroHJC6RlJUE9LpAv0lvXYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGM/Sa1dmSts1EgDF3xVmWc7DjXO/dVGjbWfqe1bpQ8=;
 b=cAJY6a690Q9Q/U7HcdbK1sGjdwUo4Bwgd0da/n+/WNM4pViWZc0AtHJu0IWC876JCklC/lTz8ijBq01/Q4dN2krtW+xINTINtA5J5HZt4gVdI2L/Ldmu5DJldAEAdPIyxgzTwa4Pw4lfJnmshmwNmC8QMPuHQcftd6+op/9bTLqWGUXERKwDCN+FF9yZqfjyMPo5SUXYFQqv9yPdkQcAqGFSTQppPyQ3+1Kb6ecTpHzrij/G1pop8xdUI2XqkDCVUPDzb+rc1/zr2hc7HF5cxQgRUVIhx34PapIlG+GxVOwOlRM7LeJMr0F2h54NaeUA//k5WrBkEV+WRDUQqta6RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGM/Sa1dmSts1EgDF3xVmWc7DjXO/dVGjbWfqe1bpQ8=;
 b=KXPn1MpAR2bomZ2pkmms/6yc/O7Z1OntJzdKIE2M2xP/OOwYCBb3adcUwoSz6YgR5mCTYblV4KuKf2PVrlL+G0cIeK8juuqk+S46rzjLAcoaNsyUI8y8+DOtnfcT7xYJ/Dg4L3o20xzzJH3MXin/VjYIYVyc4BShKPEpfCnq1G8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB227702.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:608::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:49 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:49 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:43 +0100
Subject: [PATCH v2 19/20] rust: pin-init: internal: pin_data: support
 shared projection
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-19-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6882; i=gary@garyguo.net;
 h=from:subject:message-id; bh=6l3PGFCv14lqDRIVALoXT/kZXndzUZXgQSh3Q0vVdes=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcffFWr9b16bs2Pr6sKS47afV9ncsQsQM0tbO1uli
 UPsacXOr9c6SlkYxLgYZMUUWTy6GdM2Mc6WvaxV/hJmDisTyBAGLk4BmMjzDQz/I66lGt1cLehr
 7bp5xUeWRdYmHYuqfofM/TZ30cvnpmYXrjAynJqouiPOReJ75FMPl4ObwnKn6kZzn13+fkVv29Z
 DX+ercQAAfqdMeQ==
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
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO7P265MB227702:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee2d97e-746f-47ad-3206-08df25721971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10070799003|6133799003|22082099003|18002099003|10067099003|921020|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	qNX+FVEeI/+4AoofVzqEUg8+FzFgJavN/Pltc7HE0xM1hn3f7+AFE+OZEgpG9vXyS76vEa99ZuW8YRfyZyGQb0r5/KdLrptqXh1XK6dKAxtZQZIgNj5QnsNK5XXGPpxxR1kHydBP9scOegvy5i5nxVilBMiZyAEPEDsi3abqa53ggDOHLT4YYr/eQfKKoDFTa9UZNwJjz5el24o6jdNYTybQFV/PNhdI4LLiP57kGtC+3en86QdZ20PahfnnWJEoG4xHKMydIWoI+a0g5t/3KwcL9HAb+Va+pz5bB+VejL5lGf8TSMYiLE0u/ljnrstJFVwEBAJYRrZUhYenHXOfecn2/mR/naezWPR17rHEXqq1oTh++uManAiO0Sm7nXb4zln4mFnsWZfHtUbll3Z3PfVi8aDXCa/tLYdVevpthZcM6dUxx4vz4/QxJ9BOuqdaF6XhQLrr3cn3GnoNdzo3gmyujZk5fUb3V6mjgCDUbo5IsJDQDvNgrQMn+Q8teSjTKUH3mzr/Ijbo9bQUbYG16hdiLJP40Nq3lNzRV8WyfBdwK1352nUcYowjbKXXe5ji1LsnDdLmm9mm1uUQSQPHxRqWbZZ/EDSDihQ2tGWPjDuJ6sYm34nHsrkujwzbbbxWvAFGfMabFhmUpsdi0jlyRF1LYCCnX3LV6BsI4SvC5TZiMYNij13iARbvjhwed8GpqG7FaWAgvmydxnPlHOAkHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10070799003)(6133799003)(22082099003)(18002099003)(10067099003)(921020)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnBsUCt5U21qQ2c0RlBwMU4zN1dPS2RhVnhFaU5oV0xmYzNBTGpiUEZXSklI?=
 =?utf-8?B?bXBHY1oyMmtOa3VoTlFpRDVRWEgxZnRWRS9oNGhOb1g3OVBPbC9lb2luZndV?=
 =?utf-8?B?dzlYUEtDTU0reGZQNHZ2Z1F3Q0M0YlRhQ3lmblJvZFN6S0k5bHErZUx5L0dI?=
 =?utf-8?B?cVl4Ukl0czg2M1JzQmFyM2V0QkRrNTRUcUdLcjk5WFIxanU2anhlUm5uL1dK?=
 =?utf-8?B?K2pIb1lQdytPUXVkRmloVERkSFg1R25VckdCYTNMbUMrM3R6S0RaMUVtU0kw?=
 =?utf-8?B?VnM4Q1VKYzBkb1p4dVQ3NDc0dkNMaTJxVEFzd3NGVk80L3ovY0I1UTF3b21N?=
 =?utf-8?B?TFJnZERabDNMaDJkVWk5ZHNVSHdWMllsZDB3N25iY0hTTllFMnBwZjlobitK?=
 =?utf-8?B?T3NqbUVUU1lTbDJhNG9VNThWTURsQkJLdTMrdGlQcmVEUnhBbE1UMm5NMlBI?=
 =?utf-8?B?dzZDZGVCSUloNXhIQUFMaUpYTTN4N1BtTXU1QllUL2hlcWtwYjF5bHl2WENJ?=
 =?utf-8?B?OTNOcnVZaFIvdG5qUGJQNnJCNStmWi9sbEpvb0ovYWV0VldzY2lwQUVnUDd6?=
 =?utf-8?B?QWVTT2V6bC8vMnltZ3pwZDJaaThuaXhJUWNjcHY3TGFLZDhXYzBwU3NWaEJU?=
 =?utf-8?B?ZlJHNVZzVDIrM2JNcHl0MFlyS1RuQ3dUT2k0K2cvai9vYmY1S09YcG1EWVBl?=
 =?utf-8?B?dGhNcENUa2tsSUo2OWNiUVVxV0d4THo4MWhIQXlPaXF1aC9MRFh4ekh1UWc3?=
 =?utf-8?B?OWhwcXVNMXczVG5mc2xjem1YU1JUazFiMlI1MTNLSjJMSHBtOFZ4VGpRbko2?=
 =?utf-8?B?U2VibThvYmlrUXNIc2VtVmo0SkxZTGd4UHNnQVVCRUdqQ1A1WXNjMTlFcWE1?=
 =?utf-8?B?Mi9EVm4rZHgvaHY4TkRyTng4eHNMMFVOUW5jWG8yRURpanFRU3pkQVRkWFZZ?=
 =?utf-8?B?M2ZZZHg0VmhzQ2lGS3dFQllDczNpNmJRK2NJSnFKVTd5ZmxBeTFWZmtKYzdI?=
 =?utf-8?B?amlEZExoNEZkTjNHVmc4a1RBMnF4dDNNc091ZjY0UE9pM2NWa2I1S1dxVXNp?=
 =?utf-8?B?VnJVV0RmVklnbDJnMi8wWkU0WEJmYXFCenN5a3krZStDVGhrL3BBZjI2NTZu?=
 =?utf-8?B?SWRJQzhJL216NnRqbUFYL3JKWGQ0cGpBekNid0JUWVMvN2E3VFpsSXdPVFN0?=
 =?utf-8?B?V3YwVFNaMlRqOUxKU24zVlBDN2lQUkIrZDNRci9LdzNXK0NuY0pOOGY1c1Nw?=
 =?utf-8?B?UW5RblcvV2RmQU1LRWVnQkxkWU41Rlh0c1RKVm8wWVNPc2V4VEwwWVdkMWdO?=
 =?utf-8?B?MWhDNGhwUXhMZEpqWXlwdGZRNGMxdkpreTRpMVU5SGM3akdVekFGejBUR2p1?=
 =?utf-8?B?V1NSS1N4REhjMDdhVXZsTUhlYmFlekY0MVlhajdkVHFRNHl1SlhZYVRNQm5E?=
 =?utf-8?B?U25pK0lBenZlRTdTLyttcG1MOUVZeDdyVkd3WlhVbWpzUjE5bFpFQlpGQmxY?=
 =?utf-8?B?bC9Uam1TQUpISW1QdGV2czJZclY5UFlDTGh2bTJmSFFtMEF4MWRCQUx3T3ha?=
 =?utf-8?B?bFBMRzFwdi9MdDhVVWxUOFBOdTVVMW5lamhUZXFEWVRhcjl1bG9zWnpIWjM0?=
 =?utf-8?B?aG0rc3JxT2xIUWJZSkp1Vko3ZjZLYm9EbUZEOENoS202VnUwb0NHd0ZQOEVq?=
 =?utf-8?B?UTlWNmtpRVVIcStYTWpWOE9NYlJxb2M4Yk1HN0RXd1JXVVNGNjZpcTVpNzRZ?=
 =?utf-8?B?cEFkV3lSdFJLdHNiemFnRC9xSzE2L1IrT3pyTE5Rd2hLUnB6am5lSDB0c05O?=
 =?utf-8?B?SVI1V09CYUpBcFVLZG03NzQyOWFzbUNaQmhHbmVKMG9yOElxZUpSVklTQ2Rs?=
 =?utf-8?B?Rnkranl6ZXA0ODBLQVFQRjZJaHlwNGJ1cnJqR2l4R3hjcUt0Nk01SWlZWVpC?=
 =?utf-8?B?OFdYVDZZdnpNRC9wUjB2L2RMVEZNS3Vhd1A0L2dpUWFmR3BTZ0x2SkZNMHRW?=
 =?utf-8?B?VDYxcUZUSVZuRWFwcCtJUTExNW14djNCSWNpL1BRdlpCRXRDd2ZHWjY5SWxR?=
 =?utf-8?B?S1l1dGlPVzcybmY2S2pUYVVQajdmL3RRVVZBWFVaN1lXSUZKUDVDZDBJTm9m?=
 =?utf-8?B?N1YzUWtpSThrZmplRDZ1Ni9zTmk3NE0yVkNSVVE3REEvOHFaaVpHVHZQSFhj?=
 =?utf-8?B?aU5xRlFyUUt1VG56R2s0aFo0UEhMdjcrUDdKNGZFRUc5M3NFdzEyYSt6WTN0?=
 =?utf-8?B?dmpRZllFMUxCb3RReWtZRVAwZkp2eElWT0JKTk5hZWZJL3lxdWMxWUlSN1Ri?=
 =?utf-8?B?RFJmcUpmK1VVOEtSYndvaUJsdVFVSjY3RFUrTjZ5Q0FLQ1VnSU0yUTNPMFRt?=
 =?utf-8?Q?wcLzz83HU55xA8oY5j9hFJOzCd1d+RFbmm8QTASo61NYm?=
X-MS-Exchange-AntiSpam-MessageData-1: P9zBUhNgTeCgdw==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee2d97e-746f-47ad-3206-08df25721971
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:49.4042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBayjIouQ5Aesd0do41UruNpB01omQJOMqq5yn+UtzXJyhaKljbWSL9Q8Lnp6OfTFWuoY6w2POEtRgXkxZAE/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB227702

For fields that self-references, it is desirable that projection can
happen on shared references too, so lifetime between different fields can
be correlated. Add support for that with `with_project_ref`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 134 +++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 3abd06ca92dc..3d7726e12b3b 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -1150,10 +1150,17 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
         &info.field_lts_outlive_chain,
         generics,
     ]);
+    let generics_with_this_field_ref_lt = CombinedGenerics(vec![
+        &this_lt_generics,
+        &info.field_lts_split_variance_outlive_chain,
+        generics,
+    ]);
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
     let (_, field_lt_ty_generics, _) = field_lts.split_for_impl();
     let (_, ty_generics_with_this_lt, _) = generics_with_this_lt.split_for_impl();
     let (_, ty_generics_with_this_field_lt, _) = generics_with_this_field_lt.split_for_impl();
+    let (_, ty_generics_with_this_field_ref_lt, _) =
+        generics_with_this_field_ref_lt.split_for_impl();
 
     let this = format_ident!("this");
 
@@ -1467,6 +1474,109 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
         }
     }
 
+    let (fields_ref_decl_lt, fields_ref_proj_lt): (Vec<_>, Vec<_>) = info
+        .fields
+        .iter()
+        .map(|f| {
+            let vis = &f.field.vis;
+            let ident = f.member.as_ident();
+            let member = &f.member;
+            let name = (!info.is_tuple_struct).then(|| quote!(#ident:));
+
+            let ty = &f.field.ty;
+
+            let mut accessor = quote!(&#this.#member);
+            if !f.captures.is_empty() || f.borrowed.is_some() {
+                accessor = quote!(
+                    // SAFETY: we have `Erase<..>` which we know is layout compatible with `f.ty`.
+                    // We cannot include explicit type name here as the field lifetimes are nameable
+                    // in this context.
+                    unsafe { ::core::mem::transmute(#accessor) }
+                )
+            }
+
+            // In `with_project`, borrowed fields have their field lifetime available, so use it
+            // instead of `'__this`.
+            let lt = if f.borrowed.is_some() {
+                Lifetime::from_ident(&ident)
+            } else {
+                this_lt.clone()
+            };
+
+            if matches!(
+                f.borrowed,
+                Some(BorrowedInfo {
+                    kind: BorrowedKind::Mutable,
+                    ..
+                })
+            ) {
+                // Mutable borrow must be omitted for aliasing reason.
+                (
+                    quote!(
+                        #vis #name ::pin_init::__internal::NotVisible<&#lt #ty>,
+                    ),
+                    quote!(
+                        #name ::pin_init::__internal::NotVisible::new(),
+                    ),
+                )
+            } else if f.pinned {
+                (
+                    quote!(
+                        #vis #name ::core::pin::Pin<&#lt #ty>,
+                    ),
+                    quote!(
+                        // SAFETY: this field is structurally pinned.
+                        #name unsafe { ::core::pin::Pin::new_unchecked(#accessor) },
+                    ),
+                )
+            } else {
+                (
+                    quote!(
+                        #vis #name &#lt #ty,
+                    ),
+                    quote!(
+                        #name #accessor,
+                    ),
+                )
+            }
+        })
+        .collect();
+
+    let projection_ref_lt = format_ident!("__ProjectionRef");
+    let (projection_ref_lt_def, projection_ref_lt_init) = if info.is_tuple_struct {
+        (
+            quote!(
+                #vis struct #projection_ref_lt #generics_with_this_field_ref_lt(
+                    #(#fields_ref_decl_lt)*
+                    ::core::marker::PhantomData<&'__this #ident #ty_generics>,
+                ) #whr;
+            ),
+            quote!(
+                #projection_ref_lt(
+                    #(#fields_ref_proj_lt)*
+                    ::core::marker::PhantomData,
+                )
+            ),
+        )
+    } else {
+        (
+            quote! {
+                #vis struct #projection_ref_lt #generics_with_this_field_ref_lt
+                    #whr
+                {
+                    #(#fields_ref_decl_lt)*
+                    ___pin_phantom_data: ::core::marker::PhantomData<&'__this #ident #ty_generics>,
+                }
+            },
+            quote! {
+                #projection_ref_lt {
+                    #(#fields_ref_proj_lt)*
+                    ___pin_phantom_data: ::core::marker::PhantomData,
+                }
+            },
+        )
+    };
+
     quote! {
         #[doc = #docs]
         // Allow `non_snake_case` since the same warning will be emitted on
@@ -1482,6 +1592,12 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
         #[doc(hidden)]
         #projection_lt_def
 
+        // Allow `non_snake_case` since the same warning will be emitted on
+        // the struct definition.
+        #[allow(dead_code, non_snake_case)]
+        #[doc(hidden)]
+        #projection_ref_lt_def
+
         impl #impl_generics #ident #ty_generics
             #whr
         {
@@ -1520,6 +1636,24 @@ impl #impl_generics #ident #ty_generics
                 f(#projection_lt_init)
             }
 
+            /// Pin-projects all fields of `Self` from a shared reference with proper lifetime.
+            ///
+            /// These fields are structurally pinned:
+            #(#[doc = #structurally_pinned_fields_docs])*
+            ///
+            /// These fields are **not** structurally pinned:
+            #(#[doc = #not_structurally_pinned_fields_docs])*
+            #[inline]
+            #vis fn with_project_ref<'__this, R>(
+                self: ::core::pin::Pin<&'__this Self>,
+                f: impl for #field_lt_ty_generics ::core::ops::FnOnce(
+                    #projection_ref_lt #ty_generics_with_this_field_ref_lt
+                ) -> R,
+            ) -> R {
+                let #this = ::core::pin::Pin::get_ref(self);
+                f(#projection_ref_lt_init)
+            }
+
             #(#accessors)*
         }
     }

-- 
2.54.0

