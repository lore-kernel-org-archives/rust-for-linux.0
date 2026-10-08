Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022078.outbound.protection.outlook.com [52.101.96.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176104915BF;
	Thu,  8 Oct 2026 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462278; cv=fail; b=K4KWBMYB41GMyMtve+lnafI2PDSmWG1QTOpXGuA10383BVh/0QrXnSY7EQIRlRXx8blsgf8lNVdyCemMgUhqcqlbVj71wtTg5vg5l/SIKWuxUhbrRLOq+3AQTzRaZ/+6BYKeS01a/DbqEzfQSFgWjw4XXNgsxqCV4zvx+CJIfs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462278; c=relaxed/simple;
	bh=xdmtw7FgwAOO3NBHYo6F4EoVPDCt0zinnHs5twXfVuY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=j0r5biWgxWSA5ihdlqc4Lt9XYosCPmhkDqypcMSo25vNnXozBxCokQafwqjA0jBAtCO4efah8uJlIPRTJpkOJCd1SBb5aUmL6nOrE05dXzeKcwxjz8CPfLNxf3LbNpBg20KpfLJsr0UhyNcgNmvS6jql9XsiIB7WAzxexhmdqEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Ny0a7UOK; arc=fail smtp.client-ip=52.101.96.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Ny0a7UOK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgQEks+QDWhPUzuO+XNCrdmnV9FIOiLGFC64s5l6hke5TxJlOM8bwz3Fi4xTevFXnDETkg7Iwe2xvYVCcEV1ReWBU0Fms4MDckH0lhgQlaLLXknk2M20QIFzpjwjbDUFdhNJ38XMmb33D8TmzfsrLSX3mPFpJlMeombIsIwUE55/zk6cKX2AbDsw0QxmJsU9O/39Nre9EIIpC9q92tJJ7mqnHELxlB9x7bpIizrWrgU3z9MSwZ9MXp1ZaQEzVPe/M64PdWk3PRj+jQYg5xMCJ63+lBbFRBDRR9f5sxMxRgTq1f+8lVL5WgbJDQAT3RLreC+ZY9XZM9xnvBn9NDYNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/c5r4d4XeTP8eVlWP6xgOsSuAKeDQfKikEqlsehFDA=;
 b=WXfpU+FIm5hI6BfnyeZKmPQgMBea4PVohjmzvGxxVycXud1mYuBP+hF396VkTWrg/oDvtaMkedNQNf1BsEDK+tKiA5dN3W74XA7MsPYFy/RKq0xO91N1Vceh7we8KVSQPHYNSvpQZ5Jd3vRYHoHX3vBDccfsuG9bd0wiqWgLkXCpff4ruEbLlF5d8CdiRb/19SEM/OnN36lsf4/fPmYhA68rA0sgH1bYRmOsJ+K/hMVzRG1F2aq0gSEAtUr/dhnFbQJ4VTgyMxmDspHfFImZluDDXP7pJCi4oW3516iJiIfbtAx5p1mYRbZ0S7kjxGKeJ1lNpnCzb8gzqe0JA38dVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/c5r4d4XeTP8eVlWP6xgOsSuAKeDQfKikEqlsehFDA=;
 b=Ny0a7UOKNLUxc44CHaGo++v2x0Z+hj3cRzL/puN6RiVJsDI1UXiN0zG/PVuX0Ahzy226eDnYDUlNc3yv5yYizA4IOkhqhgxJGH2/tGua5Oa0+RvtU33Zpck6YeojFKojuen1doOkV/zbA8Dx5f71y/Rw1fs7jCHWuo2w87WjhsY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:31 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:31 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:23:54 +0200
Subject: [PATCH 07/20] rust: pin-init: internal: pin_data: check covariance
 of self-referential fields
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-7-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5414; i=gary@garyguo.net;
 h=from:subject:message-id; bh=xdmtw7FgwAOO3NBHYo6F4EoVPDCt0zinnHs5twXfVuY=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce7025N7VOeYxiptOjZz35rUTvN44VLpBZ0drC93
 XvdrnRC9cOOUhYGMS4GWTFFFo9uxrRNjLNlL2uVv4SZw8oEMoSBi1MAJrI8mOF/MAv7sytdK+wz
 3+5QEWXWX22j8JfTXOBi4/ppHoUGsve5GRlWMFsd5hRq7mj90/ubR55lSnOu3LWf4s8iFPb+/XD
 ySigjAKq3RSY=
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
X-MS-Office365-Filtering-Correlation-Id: e2f6f16d-ace0-4266-8606-08df25371ace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	LplbS72bcn/xhQLvd6mb8PJLFOaiMopgSWu60r7KPLkX6whAavohfB3guqb/L3SZYJBgapYI7Toh/F7WNzGKNf9zQTz3NbsJ20sis9L5t89R3TIhifqU0MXMXeEbEuTNJJMr5lL/voHMiJvp2fzqTZUzwKNlzKKHti/cUiKFCG7BhDOE0kd1e/qU/9LA+SMcWFN3V6BDe7P7r7N1/RZMABCqgZdobokvdo3Zb580IfbdLFhKVUSPYWFDpzMrdAl9gqKRizzaTxyj4t1FMAR/nfMdY7VZNE0oJY/zxErk0dA99RFNLlLpMHomQklCweDSF1dpabLQjcsEnRSn6EGWJIu7UA1er5R3r5llEZgVQZ3QqneG23Hx/1ZDyTSG89+HdkwzK+z3UKM1jNjzSsFU45AFYrIsep1q4p0WJElh2KV41xvTnfQbhtgmm0prNkIgsl5QIqNBzL8HD+iyvz8cuKzB0qw4Axmq12pbMH59xYztg3xhoZKzRlfKItkKkHmBKvxRjeLFS0yQSomM2/qe4AIBgwPCK871tg3X9C/+Ob9qDA91gHp9jZ0SaWU9EHF0y5i1/v8fRTbPvINl0RO58LIARKJrO735xJk9rbJmofJa3ifMvZZe+H4jxqJ11zZr0YD57FswKn1tM7s48Tl0JsiZsNJ7/HFY8WzCgULsQok6ukcFL/4TUA1IB2sioaAQR5AUuXMZOpjIYLYZvDDQ9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHhiSmRkQ0ozZmt4NFZMZVR4UU00YXNQUkgyWUcxaGhoRkFzYWc3UnVCZFlk?=
 =?utf-8?B?S1VMSmh2bXBaYXJuakVnZ1B2Q0ZYK3ozSFNmNC9WWDh2Z2ZmbHk3VURXUmha?=
 =?utf-8?B?VkcwY2psSzA4SGozRElRYVpTaXUzU0xvSm9WNEZyQzdrT3lLRnlzN21kZ0py?=
 =?utf-8?B?NjlRVXVESTNlS2diWkp4M0NCZmN0RUhGK21aZzhhNUlRTXdlUHpmZDRoa04z?=
 =?utf-8?B?MFp4VzEzUkRVLzNEbzdoOXR0Vm1mRTBzZ0x0L2lVT2RSZ0F1eS82bWxCVjhi?=
 =?utf-8?B?c2Iyb0dXVXJxblJYQkxNbEw4R1hHaVQ0dnNKQ1JQV2VYc0tRVitkOCtJQ0ha?=
 =?utf-8?B?R253UFlQanhXRzZTVERaTkFaRElHQTI4MEpCSU5vcnVZOVd4dXlLREV3NUxM?=
 =?utf-8?B?UklsNFE5Q3cxMHY3Znk0cnpFL2xab0ViRTl1RWFFRFBLdEgrTXZoeU4yT1Q3?=
 =?utf-8?B?ditRSDVXb095eDRhcnRqOXk5blJzN0VRSWpDUEYvZ3RuVHFUaWNPdVZzNkMr?=
 =?utf-8?B?cEkvLzdzMm55UWt1bTE1UjBFN1JEc1d0U2doL3NJaG9KN3JiTGtSVDJWQUtZ?=
 =?utf-8?B?b2ZsZFVNRldXL0N0R0FwSHllSzJIL2VPMVZtVWViK0lyYWdnTGJrejNlN1FO?=
 =?utf-8?B?U2tQeThBSkNyUlhoVEZqMTdPWHJ2dkFFZkJZc2RCb3VZVDlORUo0MXRwZFhI?=
 =?utf-8?B?dEgzQk9KN3g5YkVxWGJEODJucVRmc1ZteHFCM2l6MXZQcUhOL3A2MW5hbkE1?=
 =?utf-8?B?UDEzODc3OHFXbjlsM2pVbkdjTi9yZlZxbTViSnprUVo3QTZZVUgvcEVOM0py?=
 =?utf-8?B?M2RhOW1lcTI2U09mcU0wd2dEeXdvaWJiM1pvd0gvL2VWeXZKWU5MTWlRZU1W?=
 =?utf-8?B?UUNtTFRpWDhNOGFJZkJxK24vL1gxMnZLd1BIZTJBV2pLeHlxdHNnbEc5WDJq?=
 =?utf-8?B?Z3FMYUQxaGZSbmJmQTJoQVZST0loMUdXMkNqUEJFRWRkWE5nK0VYek0rUEtV?=
 =?utf-8?B?TGt0UzNqaWNYKzVyYUpiWEZ3dFlHNnB3VGFmcVBZMk9ROS90SXBwZ0JJMGJ0?=
 =?utf-8?B?L2E1U0p6S0J1UzdHMEVoUCtWMnRUMm55em9vSEU4TElEc2Z4azgrWjVQTFhS?=
 =?utf-8?B?L0ZtUzZrLzdySmpQMjRaSHpiWkRibjJldGY3R2tjSC9WSW16NGdTUURzLzBl?=
 =?utf-8?B?MWIyUmV5d2U2YTZCL055WDU4YzgxZzFtQTNJSEk3VGVOdDNoajlhSUhCMWtn?=
 =?utf-8?B?d0p5cjljdERKS3ZJekdmM0JyK0pJbmRwOUsyd0JIQytyWUJMaDdFNTJya1JN?=
 =?utf-8?B?TmQxYVNGRWt0QUplR1FqSTZyUlU0clVpN25vVHM4MDFQNXJQM3JIMGZtV29r?=
 =?utf-8?B?U3lxOURnSG8vKzlwbHlxaFVQbUZpd003c2dUUThFeldSWVV1Y1lLZjYwdnYy?=
 =?utf-8?B?Z1Z0Tm9mTk96a09TcCtCQ2xnYllOTTNhNDd3empWMXdVUGNRaFR4N3hLdmhC?=
 =?utf-8?B?SWYwc3VUcEhPbnpMTkN5N1l3T3psQ2JqNVcySnBsMzE3RDFYdXNFZCtzOG5t?=
 =?utf-8?B?RGlGaWZvZk9yQS91ZzlSVys4aHhvN2xuU0NFUk11TTNGMmxhMWt6ellleTMv?=
 =?utf-8?B?WmhxTEtkMG5pbGMrTmpBc3dZQUxWd1lZVG5CQnJ0WFhtNXVnNHFsNWdKUmt1?=
 =?utf-8?B?SS9pcEZUSWpsQVNjeTkvNVprMXk5MXJrc0pIS2JoRkd2L2RpaitLUnZUZU41?=
 =?utf-8?B?OTF0ZStzQmtxT1BPeU5GMVhWSWFLeEVPVlhvVFNnNTMwSkVzT1BrVnFyeVkr?=
 =?utf-8?B?NU9ycmw1ZE9tODFid3haL2VHdXFLYjdDS2pHUUt6SHJ0M0R3UnJGRlJpSWg5?=
 =?utf-8?B?R2RzYjQzTnJzZGpFZ0hSVUNSNndHMHFoeS8ycUVBRExWUDJQL0dXeUtXQVI0?=
 =?utf-8?B?SExBVnc5YTFSa3FVUm5jcEdjcXdrMldwNnQ2ZWFyRTJVNld1b0N0QjJTS1JE?=
 =?utf-8?B?eFUrRTVHTVhSRURpQ0dFNkVqb1dPNlk2TFdEZnA0anBQL2ZWMlF1TVJlQmlP?=
 =?utf-8?B?emxRdWdjWTdXUVRROWIxSngvdlFHRkZFODl2cGF1SFNpSEpwdkhLc2h1K3Nk?=
 =?utf-8?B?YWJtcllXcmllVi9VTVp0WmN0eHRheFB0ZG5sSkhyV1hmVHBiRUduNUFUTHhI?=
 =?utf-8?B?VzJqemI5SXdreFQySUR5MVphcktRbElINXhoRS9VK3VsYWdYZ3FibFRPVlNI?=
 =?utf-8?B?Uk8wbVdrSjRKUldhckFMMnhCcXJsS3VSN0IyNFYzSUtpaG1RK2FSMTkvaHM3?=
 =?utf-8?B?VVdrVFRoMnIvWHFUNTNrdUhkQzB2RnU3NWZwYlJYM3N6OFY0T3VnQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f6f16d-ace0-4266-8606-08df25371ace
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:31.3989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34UwwnMLEG4DtjlWtXzqw6vzspM/j4YRppaDCWkjQ311XQeAWc0WaONE+7bJ0R43WoxhyYQFYpZnkcOALSiaMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5471

We implicitly infer covariance for fields that self-references. This needs
to be checked to ensure that the fields are really covariant, so the rest
of expansion code can rely on this fact.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 74 +++++++++++++++++++++++++++++++++-
 rust/pin-init/internal/src/util.rs     | 24 ++++++++++-
 2 files changed, 95 insertions(+), 3 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 8a7a4f6d230a..0b2ac2ca856a 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -76,7 +76,6 @@ enum Variance {
 }
 
 /// Information about field lifetimes captured in a type.
-#[expect(unused)]
 struct Capture {
     variance: Variance,
     /// Lifetime to be captured.
@@ -435,6 +434,7 @@ fn expand(
     let unpin_impl = generate_unpin_impl(&info);
     let drop_impl = generate_drop_impl(&info);
     let drop_order_check = generate_drop_order_check(dcx, &info);
+    let variance_check = generate_variance_check(&info);
     let projections = generate_projections(&info);
     let the_pin_data = generate_the_pin_data(&info);
 
@@ -444,6 +444,7 @@ fn expand(
         // outside.
         const _: () = {
             #drop_order_check
+            #variance_check
             #projections
             #the_pin_data
             #unpin_impl
@@ -770,6 +771,77 @@ fn __drop_order_check #impl_generics_with_field_lt (
     }
 }
 
+/// Produce variance checks, so we can ensure that the variance of lifetimes captured by field types
+/// actually match our expectation.
+fn generate_variance_check(info: &StructInfo) -> TokenStream {
+    if !info.self_referential {
+        return quote!();
+    }
+
+    let mut checks = Vec::new();
+
+    for f in info.fields.iter() {
+        let covariant_captures: Vec<_> = f
+            .captures
+            .iter()
+            .filter(|b| b.variance == Variance::Covariant)
+            .map(|b| &b.lifetime)
+            .collect();
+        if covariant_captures.is_empty() {
+            continue;
+        }
+
+        let ident = f.member.as_ident();
+        // Use the span of type for better error message.
+        let span = f.field.ty.span().resolved_at(Span::mixed_site());
+
+        let other_field_lifetimes = Generics {
+            lt_token: None,
+            params: f
+                .captures
+                .iter()
+                .filter(|b| b.variance != Variance::Covariant)
+                .map(|b| GenericParam::Lifetime(LifetimeParam::new(b.lifetime.clone())))
+                .collect(),
+            gt_token: None,
+            where_clause: None,
+        };
+
+        let long = Lifetime::new("'__long", span);
+        let long_ty = f
+            .field
+            .ty
+            .replace_lifetimes(&covariant_captures, &vec![&long; covariant_captures.len()]);
+
+        let short = Lifetime::new("'__short", span);
+        let short_ty = f
+            .field
+            .ty
+            .replace_lifetimes(&covariant_captures, &vec![&short; covariant_captures.len()]);
+
+        let check_name = format_ident!("__{ident}_covariance", span = span);
+
+        // Add `<'__long: '__short, 'short>` as additional generics.
+        let covariance_check_generics = parse_quote!(<#long: #short, #short>);
+        let combined_generics = CombinedGenerics(vec![
+            &covariance_check_generics,
+            &other_field_lifetimes,
+            &info.struct_.generics,
+        ]);
+
+        checks.push(quote_spanned!(span =>
+            // Emit a check to ensure the type is *really* covariant for soundness.
+            fn #check_name #combined_generics (long: #long_ty) -> #short_ty {
+                long
+            }
+        ));
+    }
+
+    quote!(
+        #(#checks)*
+    )
+}
+
 fn generate_projections(info: &StructInfo) -> TokenStream {
     let ItemStruct {
         vis,
diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
index 3dc72e162e1e..9f5dddbde9ef 100644
--- a/rust/pin-init/internal/src/util.rs
+++ b/rust/pin-init/internal/src/util.rs
@@ -5,8 +5,8 @@
 use proc_macro2::{Ident, TokenStream};
 use quote::{format_ident, ToTokens};
 use syn::{
-    visit::Visit, Attribute, BoundLifetimes, GenericParam, Generics, Index, Lifetime, Member,
-    Token, TypePath,
+    parse_quote, visit::Visit, Attribute, BoundLifetimes, GenericParam, Generics, Index, Lifetime,
+    Member, Token, Type, TypePath,
 };
 
 use crate::DiagCtxt;
@@ -385,3 +385,23 @@ fn visit_type_path(&mut self, ty: &'a TypePath) {
         TypeParamVisitor(f)
     }
 }
+
+pub(crate) trait TypeExt {
+    fn replace_lifetimes(&self, needle: &[&Lifetime], replacement: &[&Lifetime]) -> Type;
+}
+
+impl TypeExt for Type {
+    fn replace_lifetimes(&self, needle: &[&Lifetime], replacement: &[&Lifetime]) -> Type {
+        if needle.is_empty() {
+            return self.clone();
+        }
+
+        parse_quote!(
+            <
+                for<#(#needle,)*> fn(#(&#needle (),)*) -> #self
+                    as
+                ::pin_init::__internal::FnOutput<(#(&#replacement (),)*)>
+            >::Output
+        )
+    }
+}

-- 
2.54.0

