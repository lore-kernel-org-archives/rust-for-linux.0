Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021088.outbound.protection.outlook.com [52.101.95.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C79502D7C;
	Thu,  8 Oct 2026 19:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487653; cv=fail; b=hQmG5n5qaAeSeIoWrh/zwkzU9pRverFnPRXqmtu+XC4CZbkgFslteumMfc6rWw0pdSNu9382I/7mzaZCIGU7tYzWkTyWhTRbg0itYHV7xV6CUaF2ciJNO5IAP+6L1SwWp9A5MttgfxOn8OaJOmn028odGz59XHEvxRE3YXx9acs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487653; c=relaxed/simple;
	bh=TVT+GaCEuaT3ezZcAB7SGjkWR1Zq6xOVYzLJn8ux/eM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VnfNOmXlCefIHk3Vk/qZajI+WZvcZp1gSVQiyL4Y9USZKSOBdbipWo0TT4potGMp+Mb3ZDgJgjMYRQh/icQrBeUAQlzasNu5f5UI+1+4nCkhppk9wNKE43GViZ3jLVbcvDaAkH1hg3Vagxv65W4mGTYojqkoOCjDkwxRGPE1bNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=sURd33Gp; arc=fail smtp.client-ip=52.101.95.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="sURd33Gp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbSMwP72aLRZxA5UkC4aGRJIzL/D+n5kCk/KqQvXxkA3gsyTU/wtrQGJhqvmq4sSpG5Ek5ZiUKxqzvZbzwXCQ0p2zc6ykbfjnpzoaV0KO7H/dWui7/N0Xub1+Dtw5DSpsEJA2aMsAXyiitK7IS621gclVnRlY4wvDlaHVuXql9W3sHRpnn6prU5y+NKpOUa3K4RxZPnOhzGAFqQTnQiOvEqZ6bWu/lYIv00eUmAYJI1Xwt4NMEsxdY062cim7+YLKDe32lJ7SVhoUVvfRTtxdCytE+xK2QVUWgtlPRtUR6TEwinAsnnX+uWm3RX3BVUEMY6zgCeUnWATWyFKU52Piw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JojKme6JRDRyVM6OqFfbbVK6IyaUNjfnCVoFUeHDVw=;
 b=l9gDEcBRpnIbPUsbtqX9i6LWp4IiVdq7EVLjeXZsa3cAyjyrKuzZAOns8zK6iwmT3Z9QGdiH+8NBQ3soAlMIifTZEziEHhzjSCelbJWYqoUDlyByuhmQ5PUu+g0E6tJgVLY8mcHS2YDXI/UQXf+yDiqjrdHrTj4VVmCNI2qhhAEuC7HqKRIkCGD/DKGqOA76JdviwQMxcWmesy+FKo6sEbSWLe1XA1tlHXFahdXZo+egxWDOwapjYLzEvcg2pOztqNpy4G1cZdCE/W1tMEXxovhtWz0s5oAihIdT5YGtcDKcjuZWMZBVfVEN6U7bvuhSnce89Sv4vSFVA96Hl5zwww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JojKme6JRDRyVM6OqFfbbVK6IyaUNjfnCVoFUeHDVw=;
 b=sURd33GpQKxrEQ2gCzKg8HManTADRwbXi/xQLRwpGNE6eiHpXGLc4lUuZlaAdsB9bao4lzJynIrPm3rPPjOdv12m/w1SiSqLJjLVGedg8D8FyoMsUdQgDuDa6KGsqEaQny8mmbkuDtvtITVk38tFeUvXHTXtALxKJAMJOSTy7Qg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:48 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:48 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:41 +0100
Subject: [PATCH v2 17/20] rust: pin-init: internal: pin_data: complete
 invariant borrow support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-17-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2806; i=gary@garyguo.net;
 h=from:subject:message-id; bh=TVT+GaCEuaT3ezZcAB7SGjkWR1Zq6xOVYzLJn8ux/eM=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcffFSqsz1nnwbDWamH/77s72z/vS/XI5Hf5GMXNn
 NLAsWWL7LOOUhYGMS4GWTFFFo9uxrRNjLNlL2uVv4SZw8oEMoSBi1MAJrLbjOF/hb0le7ro5lf+
 gXz3bis5LhJ55ZnJpew/afNqB0HGX/O/MDLMT+c4mG7IuWXeMc3A9n0Rq1u8jzhvZXy7/uhkhXJ
 u2aOMALwbRIc=
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
X-MS-Office365-Filtering-Correlation-Id: f8de41e0-3ccf-4849-a1f4-08df25721900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|6133799003|18002099003|10067099003|22082099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	aV8UJFpSIV6HjMIuH+oEKIHeKNWScqV5A16UHh+g4RrbteDShALu8jDjO+MNh6bhi3wzWSzCMxrgIEE2XfWHp73jLwAphSiZzsQJ5+92kj+kau+mp52mgzAqRKtrq6NHP1XngGm193lYvqrstJgLS+IjR//PAs6gI/1aXrODg02bma0Pylhq1i0wJ8qO3PcC8Swe+hP/Vz2aNVeXii0oRdeX7KQX/Kdfm4Xl4MneOmBX39ehs3S8rriWJ9aUDhc/9fj3++OqHyHEKsmiWXvWcpoWV6VBjro+mBI5EuGvHRDfwHthLTboUB+ovUqrK+Ipw77hLlIeamEjd6OjcwPmKl1c9je9AsRlSc4KKQl4m+WUc28XUVYl2aC477QHH0NSDgMR3hjhucLl6i1f1f1ueqS6bAzrbDxNngStOv6MTefa0gwIEbC+GaWmgWKiVKJUiOPZS+v/TnfgnmfxXMAnHTCpDH16GO3ugLSY0kPPDd2EGEdUW6CAfKBzZ1Geu2CX6TkzYdw8JJpf8Mu75vD/M2anSfB1GFZ8XXkQ1jSKS/B0QaDc3XmRlhxExoON14w7FYk0YTcQv7U1pN8XueBW/awIOeFG3/bOrn2+DEQpBZNiae9ayVwOL+l9+DXp4eynf3zfbbE/752+B+woXMoQCHGxJYniCCTdeyeQO/qCjAsYmjzer9z7vmHqqB6ydHx4z/d2LZNQXhtKo32Xt49BJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(6133799003)(18002099003)(10067099003)(22082099003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXlJcnU3c3dCdU5ON0twdXNqL09Xcy9RdVNORllpdkdNOHdRek1TTU5qdDlS?=
 =?utf-8?B?ZGhvcW5DUnZ0ZlRIb1BvcW94SGNLY1EyaHpwSVljeklCMFBLMTNZd2thWkc4?=
 =?utf-8?B?YmozaldRenNPMHAwc1JNdnIzVUhkcWJNTTIzTXF4dkZscm4vUjdUNnJrbEpU?=
 =?utf-8?B?VktUekM1dGdTMjRZRUl5OGl0KzZKRFZUY2kvdTg2TkE4cHNjRlNUbVVVWDcz?=
 =?utf-8?B?TkllY01KOTJpV2x1TUhHa0RqTXQ1cCtDSWwrbTdFNGlFNE9SWlVIQnp5WVdE?=
 =?utf-8?B?VytDWUEzcXBLYTNWQXRRNnVNTXloekY5cjBFWVh5aXhPMnBWVmFGSVNFSWtR?=
 =?utf-8?B?OVRBTnVrUVdvNlEzTDFWT2JXT01qSXFBY1Q3WVBNeVdEUnk2OUlQaDc5QzFp?=
 =?utf-8?B?cm5KNjh4VWxrTTBKUC9qUDhTR0FpVW9MMzVNM3ovV2RWSVpYTHp4U3pqeTJD?=
 =?utf-8?B?SnltVkFLSnR2Ynp2cVBrVVZvY1Jxd2J5MVBubjZsTHdNZG4xcDNTMjlkaXZ0?=
 =?utf-8?B?NnFSTUl6Z2dwbTd2eitTcyt5WGNMV1N6RmxEcm85WjBCWGpLTDQ0bGd1L2lM?=
 =?utf-8?B?T2E4bEhlekhKNUdLelc4TXloQksrVElJTHFVQ1V3d25xTGY3UHYvN1ZHOTMr?=
 =?utf-8?B?TnVVKzRROTVLbXVuWXYrWXRBWDhnUXdTWldXZmpuMGtqUmNXM1NrcWVSVDBE?=
 =?utf-8?B?SXowQXZBbG1RWnFjSXBTbEg4NUFrU3lwbXI2L2VFc3F2OWcvanA0ak1xdWZG?=
 =?utf-8?B?VllYSXZ6VzArOTZ3V1VuWFZLRlpJY3BncDZZR3BWQWxKUGRaaG5KdTNhQ1da?=
 =?utf-8?B?aTBrL2RQd2VvU3YvNGlYN2dNVHpzT2dBWldoTk05ZFFOb0VIUEN5cVVPODJy?=
 =?utf-8?B?M0wwZk5Qb2t2WEZmV2tpL0V2MUhLdWJXL2pXTkZmcXd0b1JsUk0rQnkzbzAw?=
 =?utf-8?B?WHA4WktUenN3WUJ3d1pYS2pvT2lnTzBMYk9qSk9OdjdlZ0Q5NXlXbE03b0w0?=
 =?utf-8?B?TlNQeVBxTnViR0hGdHE4c2dVTzhBSWRuazB1RTRycTZWWE04V0xVcnBXWTJE?=
 =?utf-8?B?dHpsSUMwalI4VTl0TmZyaHhIL3JMMnd2ZDRZUEoxY0NCZTdjTzdtdWdid3JX?=
 =?utf-8?B?c0lKd2tJSUxsVEJLeVozSW5nS0ljVVd3T0REQ1crTll5Vlp0Q3FTTjVDWGEr?=
 =?utf-8?B?cHA1YlZuNVVwRWsvWGRhRkZhMU1sSGRramlheDJOMnBMMHhuTkxjUERTZkUv?=
 =?utf-8?B?QkFWbUJERTRVNEJVRG9PdGZRZU9CdjdmVUNWZmN5NzgxQmVwWGVvaEM0TVEz?=
 =?utf-8?B?dDVoNmV0R3YrQW91YjhZNVh4Slpzajh2Z29XQVdHeU1TZ2VBeXhoMU9icWtw?=
 =?utf-8?B?UFJhSTBDMU9vcWxyeEpwcVQ1S3ArZ3Y2WWhsN2RaY0Z6c3p2MlpRWDNxYkQ4?=
 =?utf-8?B?QlBRUm5qMmJwRW13TUlVUDlCL3I4N0N6aDJxWFMycjhONldrTlBtbmhyUXUx?=
 =?utf-8?B?RjF0T1ltWXJVSHp6WWNwZ3pZeUczMXFHa0M2R3ZYMC9WNXJzNnprdkk0czVN?=
 =?utf-8?B?MjEybFFNeHo5N1Z1NDc2NW12bzVjUFJIakRQZTk4YXVNMDFRT1Bnc1RXVTl6?=
 =?utf-8?B?dXlYZUJkSXJIeTFKR25RYngrT1Nma0FERjl1RzFoYTdxK0laTi90UkVEZXJl?=
 =?utf-8?B?MnBHSktVMmIyd3pTdEVlZEFhSlVMdzhEdGRQTGQrRkJ6OEp6VGlKWlYxanln?=
 =?utf-8?B?SHBwNVlGQmExREhrQ240Zm15V0RobU1NYkMxd1V5TkJocS9sK1ZKUU00L1B0?=
 =?utf-8?B?elo3Z1RtN2RJbC9jNElXaUtvYjE1Z2QrSVZZMUdlZkRhdmRKRnVXaG5IVkp2?=
 =?utf-8?B?aTVjU25HVmhYQWpSaFgyb1psMHRHSVlVQUlZSWZ3UzNTZFhYYWdKcWdRRThD?=
 =?utf-8?B?V3BBMWsvV0w5ek4ySkluRU1aeUFyTzhFWFFKdld4QkRucklOa2N3b254OHFO?=
 =?utf-8?B?N240TmJNditvMmY5c1NSNlA0aDJCemJCT21Zb1dDYThSUHdGS1hobkhlVG8z?=
 =?utf-8?B?cjRWVzkvZC9MNk43R041SjhLRms4WGQyWUF0RnEycUZLenJSWGtvSG1qeVoy?=
 =?utf-8?B?NDBlcDdNaExqWXNScTFOYkZNZnVGeUtsc3A0QnZKSFk1M1liRm9GSlJVYjhs?=
 =?utf-8?B?RlNHWVZIU2FvdUs2bGZHL2JEK0Z5WXBER0RhMjc3aUM5elcvQmMwYkE0L0o3?=
 =?utf-8?B?aEI2dUwwNXlPM1QvbXRMZ01kUk1FYk1lcUg2TEJVaU94UFdjQkJIRllMNldP?=
 =?utf-8?B?MnEwNmcvZndqT25IUWNtNm1UMW4ycmdPek15TUQ1UDIwMU5Ed0sxVnhNQXJV?=
 =?utf-8?Q?ck/KqQoN/EX0buAvtNh0j/HBkMLD4mj2E7JK/mejeR5LH?=
X-MS-Exchange-AntiSpam-MessageData-1: l0Cn4GXDWOwtqg==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f8de41e0-3ccf-4849-a1f4-08df25721900
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:48.6435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: al2xCThJpml7q/3uK1srqwa1BoQrFzt4oohd9FfTgSW5aQfBikX2uWGg9Xy+5Tp+jF0/YtCozxQsZhM9sD88YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

Non-covariant types can already be accessed inside projections. As
projections are only generated for `Pin<&mut T>`, they're not accessible
otherwise. Add `with_{field_name}` methods so fields can be accessed using
closures with just `&T`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/examples/selfref.rs      | 12 ++++++++++++
 rust/pin-init/internal/src/pin_data.rs | 19 ++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/rust/pin-init/examples/selfref.rs b/rust/pin-init/examples/selfref.rs
index 5e9494dcc17e..5212b9255b75 100644
--- a/rust/pin-init/examples/selfref.rs
+++ b/rust/pin-init/examples/selfref.rs
@@ -6,6 +6,9 @@
 
 #[pin_data]
 struct SelfRef {
+    #[uses('_: invariant)]
+    not_cov: Box<dyn Fn(&'str str) -> bool + 'str>,
+
     part: &'str str,
     str: String,
 
@@ -20,6 +23,7 @@ fn use_self_ref() {
         part: &str[..5],
         mut_str: "hello world".to_owned(),
         mut_part: &mut mut_str[..5],
+        not_cov: Box::new(move |s| s == str),
     }));
 
     // Access via projection.
@@ -41,6 +45,14 @@ fn use_self_ref() {
     foo.as_mut().with_project(|proj| {
         proj.mut_part.make_ascii_uppercase();
     });
+
+    // Access non-covariant type using `with_` accessor.
+    foo.with_not_cov(|not_cov| {
+        not_cov("");
+    });
+
+    // Access non-covariant type using `with_project`.
+    foo.as_mut().with_project(|proj| (proj.not_cov)(proj.str));
 }
 
 fn main() {
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index ffebba98526d..3abd06ca92dc 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -1446,7 +1446,24 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
                 }
             ))
         } else {
-            continue;
+            let f_doc = format!("Access the `{ident}` field on a shared reference of `Self`.");
+            let vis = &f.field.vis;
+            let with_ident = format_ident!("with_{ident}");
+
+            let all_lifetimes: Vec<_> = f.captures.iter().map(|b| &b.lifetime).collect();
+            let ty = &f.field.ty;
+
+            accessors.push(quote!(
+                #[doc = #f_doc]
+                #[inline]
+                #vis fn #with_ident<'__this, R>(
+                    &'__this self,
+                    f: impl for<#(#all_lifetimes,)*> ::core::ops::FnOnce(&'__this #ty) -> R,
+                ) -> R {
+                    // SAFETY: we have `Erase<..>` which we know is layout compatible with `f.ty`.
+                    f(unsafe { ::core::mem::transmute(&self.#member) })
+                }
+            ))
         }
     }
 

-- 
2.54.0

