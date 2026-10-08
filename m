Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022078.outbound.protection.outlook.com [52.101.96.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A354915BF;
	Thu,  8 Oct 2026 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462265; cv=fail; b=kY7ygW4lpOzrKIljavWhKikD/PrkEnnMnnFGi38tDUO53GApbkbSJ63In9hkSb46hERsLkawX7N6lvZQpbUn7tpMA62s0w2Pic/drCSu5vfbPxhu9g42aMpcwNxu2uLk0f40h0e9Hpt6D0ZDtOB8GjYBQ1DEY9MeMd2QL57S4HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462265; c=relaxed/simple;
	bh=ce27vOStqyTnGiDdZN+dt5FFHnwPbwprresNWlmfJIk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DMKZjzkli9Mo356K7NRL213xHi+gklZmWU5HcoMoPasXpz34l/CuQaj6kQUjfvBCIDXGUIMP8Nc9LTXW5fF+JVOt5STstJf14gl9l70XubrUtJCPgtbWZ3Zo0gcXfOzx0MrQRjc4F1D6thwcbdrGM6TK+/FScTkgsnXggcwUoDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=KfbMe2Po; arc=fail smtp.client-ip=52.101.96.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="KfbMe2Po"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABnZIwOTx0vpVxJ+l9uSd/VZOFUJsGitDoId4bMH2L/PHQVMF3HKK/AXX6Ig4BmBKAM99TJtU+rdggLn7SDDLNoH1MLDFWoV2w1fFb9tMqYptnq7PoYG/50FOc1bTjSnzaWENV/jG0cfWplmlVhnWIqojVp1Nhqsx+Q7DQ8Ym9rG7KB9RlTFkR10IqK4qPNWaNIOcK1HSARNi8PIGSDiK9UNGjtpVgnvxvY6hLmcpG5TQpzCLQZM66psCduc7sHDomjr4eet43nXsdxm0MRaHf69hqBswCp12EnH9pK/wLI5yFMEATPwf+NhkMb/thg0gCW1E2bw1aVj/ta/Gbf93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpI/FbcqJaStcSLvJ3wj+/PeYm+K8iV9LNflUUdWM1E=;
 b=Mb4LwJDsL9M95Om8AFHL6+O3NDTsrOD6FcLl98I6M3k2zivVT95vOWu1RC1N0z9S+bKWEngTKt3zcYg1TBeOEgLtfyhcyZiM1jBzje+I4W1m9w3eNOd+nkGAvVg3mCbzigxNyfwysH06mDSJuDEa0a7ejgqqV96C9VRsoOFkCEy2ncN/KP3t0rG7ndgqgBSdvfb0ML5OWP86jkdWF3xuWAut5Ui6kl1ox51U+I0Xpot/9I2FGUOJ9/IcgG9uUHskhvpUh836SFpNz2bQkCtoR1mqBYWK4yfNcEGO4Fp4XTLcEARjrzyY8ADPf7nq27aP+LQE8XlItr//5epo6MFubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpI/FbcqJaStcSLvJ3wj+/PeYm+K8iV9LNflUUdWM1E=;
 b=KfbMe2PowCPM2ygwyxDgITxri8U+s3xynimNmk7rxuEfiLOcf9+EdN5w5HF2bWpYGqli+061VCjNRoCiQKSoCIvnHuTD20/rHz9evXKS0BZsWxEsp9G0eBcMKtS3PbAyW1XHTvDg9zAVNH1dsWo6C+Cg+BAMx/V8tn6PdYsbsJk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:18 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:18 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:23:49 +0200
Subject: [PATCH 02/20] rust: pin-init: internal: pin_data: infer
 self-referential struct
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-2-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10762; i=gary@garyguo.net;
 h=from:subject:message-id; bh=ce27vOStqyTnGiDdZN+dt5FFHnwPbwprresNWlmfJIk=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce70075rXIOdjcM/FIfUfn6Q4NFyrF5e1oZBUS/R
 rxl9JzR59BRysIgxsUgK6bI4tHNmLaJcbbsZa3ylzBzWJlAhjBwcQrARKS1Gf6puDR7KhsVF6nX
 Tpn3SunqvrNuhRePKHf31jT2R9qkLHZn+CuSVhzFtaT043vXRNsgRwFf/pZglz/v1xq3KUclHmX
 Yyw8AXfNDyQ==
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
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: 3638326b-0eb5-41aa-2fd1-08df253712e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	WrHaXuUSSWyQ5Mpo9/vkjXiTQHiOxoWHOW/jHub7/MdU/fJG5q5WgJGuXMsxLtowl9MqPzwebnBDHtNRVSmZCF8QKDv118hwSoq9zlLmtTv+UgLTNDOz9rBobIHtIHJoGuGQ8JS/glWpxB2nOkv2H8oH13P+6hUZQ+3DVohf/JHomDkcbHWDrM+fAHZAtMx8atycK7BoYpIE7NzxCmfU8kiektwSiln+ocN7mZ79FFaQBf4OfRxI4eWuoRT9YTuTBCypU5+OJOcPklOIKEm7xI1e4yTrjsjiMNFbW437hs6DGKhjHz9yYMYPC2ycOQfjAqW0xnNQ1KtsmJuse7kpJT0L5Ym7PtSBajMvp3tg8Can90gjEZ+BnPo2nikZnXnwd8e4d2Yjv9yMOThUrxWvGuZEybeH+pyYMfImIyKpDw7eWMk1wb4dpwTfmu2Bh34PI/O+pOstqcn8L5f3njXow2UAc14boJiVQNsIkiQ4DF4ibR2wMibPUWPzPMNt2aKeI73gfKht249uZgFJ4kJDlPVuB2ix22t4+zscXF4RiYZl3IldkosP28AE24JxnacbnjmFV69nmkhf8H9YIpH86LImnUrey5KSoi1e6DxrXErXkI/3jmdhV8DTT1ZR5jl+rXLJsTXYOjSiIblh3jEpXD1eQhQrs6s8eTIFRlt6R9b56GdCELARDgJYt5Jj9hspU2mkOMWFog7yPFshn2DbyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXRsc2h1aHZnVWlMSnNtdmFkSk5rQ2lqNm54YkhuYTNoaVc0OWJocngrYVZE?=
 =?utf-8?B?a2dWcW1BMzdLdG9Iak42SC9QVkZNMkt3U3ZrNFBTTFJieHU2V0cyN1lEVEVj?=
 =?utf-8?B?MUtmKy94YkN4YTczUkZiM0xpMzV0WlRsL0dGbFRBbFltQW9GLzR2SWhHUHJ5?=
 =?utf-8?B?TzNWaS95WkdNRXpGMzlGd21aWGRxRW5TUVBXSURjZy9EMDdzZ3ZzV0xWVEYr?=
 =?utf-8?B?ZHZjM0p5NkdjQ2RuKzRjR2gwQXpZcVBJeDJyekJxK3c2WWZDaDdBQkViNWxS?=
 =?utf-8?B?UmpLakV2Tjd1YkR2dndaU3pQSmh6KytTdFk0My9JMU5XemxQSmJDSG9yODV5?=
 =?utf-8?B?aGVFd2VSWDJ1aHVGMzBPS3hiZHQxUEFKdEFYWCtrWkdZMTlLRXJldnY1YXNz?=
 =?utf-8?B?d3FjanQwKzFtSVhpWHZvNVN1MVNhemFrdmtXTUM4YkRDdFJGWDdBdW14Vm1M?=
 =?utf-8?B?Qll1bGp0RkxqNjhzQlF6QmFlc05YVDhVajhSQ0J2TU0wSEZzS25TaUduNXhF?=
 =?utf-8?B?Q3FUcEx5emlZNjAxZWtaVHpXeGxFZ2RybGhDMWt0V0dDOFF3WWZuK25rR0s3?=
 =?utf-8?B?aTF1ZVYxaU1CREQ5aWJ4MXIzNFY0THF4ZStMTHg3bjUzbHRWQmR6bnkwNEQ2?=
 =?utf-8?B?OXFOeGJqMUZ2MExkZ3dDYm0vMG1zT3VUc1p4VTlnY1FQREt2cUtaNzAycmxy?=
 =?utf-8?B?OCtHWlVlUjVxdFZwQ210RFdHalRPanQvc3BiL0RnOEJ3VHdrOEdZa1g3Qkto?=
 =?utf-8?B?VkpydCt1MFI2MzY4OFNtT0cvdW5yYzZKUTlRVWpTdlhucnFJMHF6VEN4b29k?=
 =?utf-8?B?WjUwZUpkTlNRMVBlb1pmRE9VYkJkblE2UW55d3p3MFM0QXZVbHRUZ1BDSWxV?=
 =?utf-8?B?SCtBR3FvMDA3a0Qvb1RqbFJpK1c2bHhTVkNxRnNNVjBTZlpSTlQ1Q3ZPeVZ4?=
 =?utf-8?B?NTFjN3pwdjljRWUrcnk4S0RWNWZMVTIvMWRIQm1NQlppdUt4TzIwRk01ZEtH?=
 =?utf-8?B?cmxxTDl1MGVyeDYxOE1VbGpkK3diL2tKS0UzSzVoMVFkRlVsV0dTSkFXZ0Jz?=
 =?utf-8?B?aWtKVkUxYTlaa3dkcU1Td01lZ1UwK09ERnl6M2ovQ2huU1NUaFBYNkhDV1pT?=
 =?utf-8?B?RmpDaUt0dkFmQ1JqMnd0cXJCRzF3djJEOUhDWFJqMmpvUXdnbk5zNkJiRDkr?=
 =?utf-8?B?UjdIUm5PWm15Szh1ckVyRllpdTJJM2tPbGs2eElDZ2RyenNXTm9KeE1FWnhZ?=
 =?utf-8?B?NityWVZzTXVsVFZuRWhqREFVYnNkS1hrSGVBeUdqMEJnS2NMa3loT0JRdkRn?=
 =?utf-8?B?Q1J3Z0J4S2dnMXk1NzJ4NDhLTGJCaVFXS1FLcDlRaVJVcXY0a0tRa3I2YVVB?=
 =?utf-8?B?eGZuRjduY1RpN0hJOEk5dVVqR2l6OEhpMzdka3BjYUg0emE5dW5aMG9mbFVt?=
 =?utf-8?B?U3U4Rm1sN2pTZFpuTTJYeVhXMFgwS3k0UlFXdVl6S1Q4TTJSbWdjVGN2M3kx?=
 =?utf-8?B?b0d3SHpaWVA3cUFpZ3JDU3owZ243ZzJUeGFTMzZPMGlRMFJrZTEwRlN3RUZz?=
 =?utf-8?B?UnlHVmFhWmhqaEFkU3JBbjRBVzFiWlZDUEJRK2k2c0ZPUitlMmdMbkxvWXFN?=
 =?utf-8?B?THc2U25PR1oxZUZRNERUblRLd25LOHpCY2xOQWlJMXM2clB5WERuTCt4RXlp?=
 =?utf-8?B?WEJDTzFtbmJRNit3VnpGeG5ERXJGaXJWQU92WnlmRTYrSkZrU0s2ODZobkFI?=
 =?utf-8?B?Q3R2enNERnNkOGdQeTJoWEJ5TkVMd0tVSDgrdVorNFM1cjBZMExlNHVHcWVm?=
 =?utf-8?B?TjM5dzYrMWdONGMxSXdhSEM2WHU4eTNTc2lyU2dqY21WVzhsSUl5enhSNnR0?=
 =?utf-8?B?OTRpSTZIbkVkN1k0S0RYN3hXK1FoaHVlZnhuVS8zNFlKbmxaT1Jla2JIREJs?=
 =?utf-8?B?UVNad3lQYXRnOXc1Nk5NRThRUDlUaG9CSEkzUWZ5V1hocm54ZlVMUk1OaWE5?=
 =?utf-8?B?alVwN2ZQd3RYd2hiOVpTdllDYWdnR1FsWjZ6WU14ajVYc0l6NUJkVFlOUUJQ?=
 =?utf-8?B?T0ZxRmsydSs4SzVqblpYekVTYm1BdktpSDNpQXpzZ0ZvNU9FcXVRUnBEZWZB?=
 =?utf-8?B?UkpFK2d3dXI3TjZscDRDKzFiR2gvMGdvWGU0cFhqaFV4NWRLOUJDS2I4eWZY?=
 =?utf-8?B?Rkt5UHdLaVI1WC9kb3BEYWVMcE1EMlFBaVROR3o3UWg0cXhpdXRJUUZtT1Jy?=
 =?utf-8?B?LytkUXg4UlR2RVFsVitvVW15VGlzOWRwckxLaGlHbUZ5YU9rdUxNTjB3UXZI?=
 =?utf-8?B?SzNWQm5lOGVuUTkwcFl1emF1L2YzbjBRMGJJdXhMUHBOd08xUy9kZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3638326b-0eb5-41aa-2fd1-08df253712e7
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:18.1096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d09fYcd0Y8pqnCzzw6GV/kkObIjLfrW+kHJfnYdYwmgcLfvH6qL8vq/X9q/1+7p7t4O7S3EKoltdNG9OwxWWuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5471

As a first step towards adding self-referential data structures in
pin-init, add parsing support.

Scan all field types for unbounded lifetimes, and if the names that of
fields, it is inferred as a self-referential field lifetime. No explicit
annotations are supported yet.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 162 ++++++++++++++++++++++++++++++++-
 rust/pin-init/internal/src/util.rs     |  94 ++++++++++++++++++-
 2 files changed, 253 insertions(+), 3 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 03e893cf5475..cf6142cd656d 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
+use std::collections::{BTreeMap, BTreeSet};
+
 use proc_macro2::TokenStream;
 use quote::{format_ident, quote, ToTokens};
 use syn::{
@@ -7,8 +9,10 @@
     parse_quote, parse_quote_spanned,
     punctuated::Punctuated,
     spanned::Spanned,
+    visit::Visit,
     visit_mut::VisitMut,
-    Field, Fields, Generics, Index, Item, ItemStruct, Member, PathSegment, Type, TypePath,
+    Field, Fields, Generics, Ident, Index, Item, ItemStruct, Lifetime, Member, PathSegment, Type,
+    TypePath,
 };
 
 use crate::{
@@ -48,10 +52,69 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
     }
 }
 
+/// Description of how a field is borrowed.
+#[derive(Clone, Copy, Default, PartialEq, Eq)]
+enum BorrowedKind {
+    /// Implicitly inferreed.
+    #[default]
+    Shared,
+}
+
+/// Information about a borrowed field.
+#[expect(unused)]
+struct BorrowedInfo {
+    kind: BorrowedKind,
+    /// Field lifetime for this field.
+    lifetime: Lifetime,
+}
+
+#[derive(Clone, Copy, Default, PartialEq, Eq)]
+enum Variance {
+    /// Implicitly inferred variance.
+    #[default]
+    Covariant,
+}
+
+/// Information about field lifetimes captured in a type.
+#[expect(unused)]
+struct Capture {
+    variance: Variance,
+    /// Lifetime to be captured.
+    lifetime: Lifetime,
+}
+
+impl std::borrow::Borrow<Lifetime> for Capture {
+    fn borrow(&self) -> &Lifetime {
+        &self.lifetime
+    }
+}
+
+impl PartialEq for Capture {
+    fn eq(&self, other: &Self) -> bool {
+        self.lifetime == other.lifetime
+    }
+}
+
+impl Eq for Capture {}
+
+impl PartialOrd for Capture {
+    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
+        Some(self.cmp(other))
+    }
+}
+
+impl Ord for Capture {
+    fn cmp(&self, other: &Self) -> std::cmp::Ordering {
+        self.lifetime.cmp(&other.lifetime)
+    }
+}
+
 struct FieldInfo {
     field: Field,
     member: Member,
     pinned: bool,
+    borrowed: Option<BorrowedInfo>,
+    captures: BTreeSet<Capture>,
 }
 
 struct StructInfo {
@@ -59,6 +122,7 @@ struct StructInfo {
     struct_: ItemStruct,
     fields: Vec<FieldInfo>,
     is_tuple_struct: bool,
+    self_referential: bool,
 }
 
 pub(crate) fn expand_with_cfg(
@@ -147,7 +211,22 @@ fn expand(
     replacer.visit_fields_mut(&mut struct_.fields);
 
     let is_tuple_struct = matches!(struct_.fields, Fields::Unnamed(_));
-    let fields: Vec<FieldInfo> = struct_
+
+    // Collect all bound lifetimes from generics.
+    let bound_lifetimes: BTreeSet<&Lifetime> =
+        struct_.generics.lifetimes().map(|x| &x.lifetime).collect();
+    // Collect all fields.
+    let field_idx_map: BTreeMap<Ident, usize> = struct_
+        .fields
+        .iter()
+        .enumerate()
+        .filter_map(|(index, field)| Some((field.ident.clone()?, index)))
+        .collect();
+
+    // Keep track on fields being implicitly borrowed by being mentioned.
+    let mut implicitly_borrowed = BTreeSet::new();
+
+    let mut fields: Vec<FieldInfo> = struct_
         .fields
         .into_iter()
         .enumerate()
@@ -166,16 +245,88 @@ fn expand(
                 }),
             };
 
+            let mut captures = BTreeSet::new();
+            let wildcard_variance = Variance::default();
+
+            // Infer lifetime based on the field referenced.
+            // Bound lifetimes from struct generics take priority.
+            //
+            // For example,
+            // ```
+            // struct Foo<'a> {
+            //     bar: &'a (),
+            //     a: u32,
+            // }
+            // ```
+            // would not be inferred as self-referential because `'a` is already bound by the
+            // struct generics.
+            Lifetime::visitor(|lt| {
+                if bound_lifetimes.contains(lt) || captures.contains(lt) {
+                    return;
+                }
+
+                if !field_idx_map.contains_key(&lt.ident) {
+                    dcx.error(
+                        lt,
+                        format!("`{lt}` is neither a lifetime in generics nor a field name"),
+                    );
+                    return;
+                }
+
+                captures.insert(Capture {
+                    variance: wildcard_variance,
+                    lifetime: lt.clone(),
+                });
+            })
+            .visit_type(&field.ty);
+
+            for capture in captures.iter() {
+                implicitly_borrowed.insert(capture.lifetime.ident.clone());
+            }
+
             FieldInfo {
                 field,
                 member,
                 pinned,
+                borrowed: None,
+                captures,
             }
         })
         .collect();
 
+    for field_name in implicitly_borrowed.into_iter() {
+        let field = &mut fields[field_idx_map[&field_name]];
+
+        // If field is not explicit marked as borrowed, infer a shared borrow.
+        if field.borrowed.is_none() {
+            field.borrowed = Some(BorrowedInfo {
+                kind: BorrowedKind::Shared,
+                // Obtaining from `field` instead of `field_name` for the correct span.
+                lifetime: Lifetime::from_ident(&field.member.as_ident()),
+            });
+        }
+    }
+
+    // Check that field lifetimes do not appear in the bounds.
+    Lifetime::visitor(|lt| {
+        if bound_lifetimes.contains(&lt) {
+            return;
+        }
+
+        if field_idx_map.contains_key(&lt.ident) {
+            // Forbid the use of field lifetimes within bounds.
+            dcx.error(lt, "field lifetimes cannot be used in bounds");
+        }
+
+        // Otherwise this is completely unbound. Let Rust compiler produce that error instead.
+    })
+    .visit_generics(&struct_.generics);
+
     struct_.fields = Fields::Unit;
     let info = StructInfo {
+        self_referential: fields
+            .iter()
+            .any(|f| !f.captures.is_empty() || f.borrowed.is_some()),
         args,
         struct_,
         fields,
@@ -195,6 +346,13 @@ fn expand(
         }
     }
 
+    if info.self_referential {
+        dcx.error(
+            &info.struct_.ident,
+            "self-referential support is not fully implemented",
+        );
+    }
+
     let struct_def = generate_struct_def(&info);
     let unpin_impl = generate_unpin_impl(&info);
     let drop_impl = generate_drop_impl(&info);
diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
index 3ce498cea754..67ebb333710f 100644
--- a/rust/pin-init/internal/src/util.rs
+++ b/rust/pin-init/internal/src/util.rs
@@ -1,8 +1,12 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
+use std::collections::BTreeSet;
+
 use proc_macro2::{Ident, TokenStream};
 use quote::{format_ident, ToTokens};
-use syn::{Attribute, GenericParam, Generics, Index, Member, Token};
+use syn::{
+    visit::Visit, Attribute, BoundLifetimes, GenericParam, Generics, Index, Lifetime, Member, Token,
+};
 
 use crate::DiagCtxt;
 
@@ -237,3 +241,91 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
             .to_tokens(tokens);
     }
 }
+
+pub(crate) trait LifetimeExt {
+    /// Get a visitor that call the provided function for all unbound lifetimes.
+    fn visitor<'a>(f: impl FnMut(&'a Lifetime)) -> impl Visit<'a>;
+
+    /// Obtain a lifetime from a identifier.
+    ///
+    /// The created lifetime has the same span.
+    fn from_ident(ident: &Ident) -> Self;
+}
+
+impl LifetimeExt for Lifetime {
+    fn visitor<'a>(f: impl FnMut(&'a Lifetime)) -> impl Visit<'a> {
+        LifetimeVisitor {
+            bound: BTreeSet::new(),
+            visit: f,
+        }
+    }
+
+    fn from_ident(ident: &Ident) -> Self {
+        Lifetime {
+            apostrophe: ident.span(),
+            ident: ident.clone(),
+        }
+    }
+}
+
+struct LifetimeVisitor<'a, F> {
+    bound: BTreeSet<&'a Lifetime>,
+    visit: F,
+}
+
+impl<'a, F> LifetimeVisitor<'a, F> {
+    fn with_bound_lifetimes(
+        &mut self,
+        bound: Option<&'a BoundLifetimes>,
+        f: impl FnOnce(&mut Self),
+    ) {
+        // In case the type includes a lifetime binder, e.g. `dyn for<'a> Foo`,
+        // the lifetimes in the binder are bound and should not be visited.
+
+        let mut to_remove = Vec::new();
+        if let Some(bound) = bound {
+            for lt in &bound.lifetimes {
+                let GenericParam::Lifetime(lt) = lt else {
+                    continue;
+                };
+                if !self.bound.contains(&&lt.lifetime) {
+                    self.bound.insert(&lt.lifetime);
+                    to_remove.push(&lt.lifetime);
+                }
+            }
+        }
+
+        f(self);
+
+        for lt in to_remove {
+            self.bound.remove(lt);
+        }
+    }
+}
+
+impl<'a, F: FnMut(&'a Lifetime)> Visit<'a> for LifetimeVisitor<'a, F> {
+    fn visit_lifetime(&mut self, lt: &'a Lifetime) {
+        if lt.ident == "static" {
+            return;
+        }
+
+        if !self.bound.contains(lt) {
+            (self.visit)(lt);
+        }
+    }
+
+    fn visit_trait_bound(&mut self, bound: &'a syn::TraitBound) {
+        self.with_bound_lifetimes(bound.lifetimes.as_ref(), |this| {
+            this.visit_path(&bound.path)
+        });
+    }
+
+    fn visit_type_bare_fn(&mut self, bare_fn: &'a syn::TypeBareFn) {
+        self.with_bound_lifetimes(bare_fn.lifetimes.as_ref(), |this| {
+            for input in bare_fn.inputs.iter() {
+                this.visit_bare_fn_arg(input);
+            }
+            this.visit_return_type(&bare_fn.output);
+        });
+    }
+}

-- 
2.54.0

