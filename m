Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022091.outbound.protection.outlook.com [52.101.96.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1E6497B81;
	Thu,  8 Oct 2026 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462283; cv=fail; b=MHfhN8OU+nCn+A0GFpGHzItfzfZmWx2eG/7adlDA9jFvsTALIrZXMgNQCab4fbRvRNHtLXkAB0lVja5fWwLMm1IaUPdXzZVaWrG3fEm8Nnp3lSqtGwccwobRH4uOiIuKI2/uAUY9OGOmTCLEXfxDAUSYy7Q6AwfSrsd305wW5tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462283; c=relaxed/simple;
	bh=KFzxzLcKuH4hXVibwMcphkx5cXopOsH0q4j12AwEZXc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JpDVpChVQiagUoth0LFkuNkFNVP6kDJ1NKyHrlRzJa3qrKuaFSc5Ds505y9lA+QMc1whA2slIsKqNTIf0BlO5nNXVjBwzVdu1ONc35VbEdv6um8sa2/ee0+v0L62bZbkt+GnY66AJdvTWlANg0yR5JhkIG+1xSj8m4wOex/Avac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pkU3De0v; arc=fail smtp.client-ip=52.101.96.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pkU3De0v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MweCX+GblMHY2gUMv0gXdbT6orEsDLP/kJs9TVeSVdgo/0lvdowl2LSukEFjl2cCR2c2eggcdlkoYhvTJlQ/Q1wsp+ldxq67jhMmvkVZ+0liF8Bi4f1PQY8pIkyoac2LOx9R7lcXpaDlOZ75v9CxT2SH0/4FJOj4zcpl89QVjuPsWw3th72Ad4tCjedlj6H1wpkUruVWSLV8lit8e/lGpG9g8MdAmeYBDuecQ9Gzo45N34qVXjErrnbgi3admzwmc+Hqem+/XMk2CO3iGny+0PZFKO0cXUAAy4rK67EPl5wjJOgy8x8Rnz72i4eOzz13OMWRhqum56WYbzAgJQdf3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulElyrz3hphWEwRghxo/kU527iZNEK0Xvr6USSuPWOg=;
 b=mY4M3GKE7JfrKavMgpw8EpNtN7V44LRKONoPWt/tdoByfrpYflA4tt0ojGft+KSp5Yj68G3IkdZKTKNV/cF4X+5yitmtjqbsXIPuLXYpr42dacK7ASRPFJ8purSPcGIy5+/I+Qc0IAdOHao5Xnd6Vguz0GrusSAQDple7J6+i27s/R/G5dkb0R7RDgIYsLC/0+6HMZ7M1N9KUtBzl7LOjvYj2Mg3gLpQQYkXU5tzK81/uP64K8Wvpt+5qqRH/D1X1kAP5u2zBLCutEsKCO9JZgW+5svvK6MjIoYlQAxe/SPCCA/4+hNPEXLMY9nWFtEplWeJ7j2NQW+xv82PbI1vPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulElyrz3hphWEwRghxo/kU527iZNEK0Xvr6USSuPWOg=;
 b=pkU3De0vJD7td2i67F9CzUi2/fyZCue7Q/XQrQqGDL8zGmDCbHIOqM9mwKkPD3R3OelZdaq8iEwVRjOZTWCJ+3l8boEc4a+GYLGJrOyAMgR3JUiQoSp2kyZzhUWleVubv7YMrAgIGW3uOAdLUNMwaGoDcsu+4azItc40RDyPIw4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB8795.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:40 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:40 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:23:57 +0200
Subject: [PATCH 10/20] rust: pin-init: internal: pin_data: add
 `with_project` method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-10-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8134; i=gary@garyguo.net;
 h=from:subject:message-id; bh=KFzxzLcKuH4hXVibwMcphkx5cXopOsH0q4j12AwEZXc=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce705P/B8zcUFY69cH1U/MkbQVbTrPs8vBMflKWc
 r3HZ2Hq1+kdpSwMYlwMsmKKLB7djGmbGGfLXtYqfwkzh5UJZAgDF6cATOSgMSPDY5GFDYGS3Cwt
 E6ZuqMkziZ+/PCvTXOFv4nLeo/WH3/hyMjKc3u2SwfP+k0TrzuS5n10dlN3Pvk6aJR3SPLmGr3h
 1aDYrAFGpRfI=
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
X-MS-Office365-Filtering-Correlation-Id: 18ec9236-d0bb-41d0-2ca6-08df25371fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|10067099003|3023799007|921020|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	+eUErwIHvMuTZuzyvZpFahXCYIj/DCAIVVAlvKuUg4gT4gW9bv+eAy3DQD7pxh7LTJ73us+zU8ALh9f3ngJO2ZlvFnjkvb6HUITpmsg+FgS49vXVUf9+nNhWOjUuMHA/0s9r+oZNLdo5EEDgYTBq+r9SsBEDlT/QqqlRLP+Vm3QIRaY1BT3aAD42xpkkqPhdfTnCMx4z3ISw+l4oiVh4T0QgQgiXvy7F1hzslcZygH4vCrJ634gzwFt5QDO/wOgydG98/qlvqsSF0OTSW0Nf2IbzWilRAbO21ckkV6NdtqVIbsTjnZCurkVJk+/D37d36ubrMR4tcp6SPkxaRaLcduxTwhyYhnSP8l0uyHnG71fAU3XkV0MTZ8XjddXyiH/R0m7JGT0D9Xj3EkmWPBXtJcjElVVZDC4ua5qs3ubye3kQfzrTPzQmpIK51r4LaqOmBs7lTSnIP9qKn7t7CRJjRhrtY7T4v/xZUAY2w9uFNmO/HDBpPumKtN/bEX/ZeZUUPX4/AdSJuykMchJrtHmdUj1/lnNNUkFhRufhU3vBcRcpH2Fkke9lo4GgIb6Jr0mkW2sCSJhFlZD9VuPjX++deWtzUm7+dmiJZgilcbkuflQGSiuXv1BD6rGKZ0VzmC9iLbGkMLH+ZcoAHx3bUD5U4QRvfsudOjkFm9daC6AO+u76yRXPVwKZfbMNsoPrJZqyA74zadAsEQfKZhu+PZNIHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(921020)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWVrZHFPOGQ2TjE1dWZjR0xtNXFXbW0zR0lIamx0WmkvenNBcEUzd21SWFdq?=
 =?utf-8?B?MlJjVGRreW5UdE0wS296WDRUakR2aW9qTmtPeWx2K1F4K3h4TDRUc0E3TzJU?=
 =?utf-8?B?L2lRekwxa3paaTR0TjVQUnRoS0VtOTRnOTFMK09PMzFxVFp2RVdPTjRmKzN0?=
 =?utf-8?B?OWViT0kxbXNwVHJTeWlrK3FjR1pUWVN5WkV2Q2M3KzE5RnhmMmVyZWVxUEJJ?=
 =?utf-8?B?c0x5emFpbWRpakREbzRVMm5HVzRGNVY3a01FK0Q4c3lXdnBRemRCKzZCbGhz?=
 =?utf-8?B?UitHamx6ZlU5RmtzcEZkNXpLM3JubmF6clRJeitHQWVGWGRkMnJjZUpxV1Uv?=
 =?utf-8?B?d0pBcXRtVnBUakFJYm1uVStIV3gvczRTY2d6ZWZmNmdvS2ExSDg3VFZPNjA2?=
 =?utf-8?B?aFJaM3o2SzRqQmJMa3NEYi9QT0EybFBUaHhEcHpIV2hlaSt6Rzd0dFIrd3dq?=
 =?utf-8?B?czhpN1RYM3VYWG9CSGhzdkY5YWE0UmNPa1dXVjJPMHVIUGdLK2U4ZmFHaWt5?=
 =?utf-8?B?ZmR1TTVTNjN6c0xReFQrRFlHVXVESjR2ZXNFZnArNlhSYnViWlBNVXRQZlcr?=
 =?utf-8?B?ZTIrOEwralZMVm9wS0lVekFrOEhKdHhQeGdIN1pUeVNVYXZtNlRPa25iK2hw?=
 =?utf-8?B?WUFzRE8weWVEVFRtQUVjTmpuTi81cGR2Q3Mvb3RQYitwR1pOTVZhek5tNDJV?=
 =?utf-8?B?UU5PSmpIOERFRVRScWxITjArZFpLMjBuRzRuUURIclRyMU11Vk03Q0RONzZh?=
 =?utf-8?B?aitVTEc0RDZOcXJNWnloWWZkOWJwZE45ZVFCRHNyV3FTYVNWVVNIRXR6bFk4?=
 =?utf-8?B?YjRLc2VHWEN1YjNMV3lMaTllblRubjA1enJuY2NnTFdiTkNDTzdDT2Z1Qmgv?=
 =?utf-8?B?OXQvNU5KOHZTVFNDSSs4VlBSMXBteFBhcUVOdFl4T3B0YVlYSFJNSDVnOW1h?=
 =?utf-8?B?RG83dVNSc3ZacjFmeWZwVHpjRVRlMEZxeUVsdGt4MklkYmQ0QnRHV2tkdWpn?=
 =?utf-8?B?Zyt5dWRIMHlkaEFQV1VoQVJnKzVIZUV3b1RSZWpuOHE3a2tUSkRrZWw3MTRL?=
 =?utf-8?B?TWkrYnh6Y1RWdVNNWHc1WGN5ZVpIS0VZVm9Kc3VjbWxZRldHdG1NSWp0UlVh?=
 =?utf-8?B?TXFYSE04NUJKZzhrZ1lDd0RlNUlpaktoSnFjQjhWQWNGQi9WZTBYbG9rZUpV?=
 =?utf-8?B?WEloTWN1cGttOENSUkk0UG9MaXAxdGl2d0tuMjFJUm8yb1VPT2NtV3lWRThG?=
 =?utf-8?B?Z2J1VnVtVkViMllpdDU4TlV1cm1yTGcwdmJtMU16Q2pwMDFzUXlPWWhOa3h1?=
 =?utf-8?B?TjI1L0pTZWxneEN3S3hjU0JaQTI0bXpDZHdwbXQ1MXFZUVlRS252L25GOHVG?=
 =?utf-8?B?U0xnMWFtRFhqQlFiS0w5TWVzRlo0OSswZHM4VU54elhCZVp5UTVHRml5L3Jx?=
 =?utf-8?B?MFNyM3FBNnhDemF2M1FDWm1tKzNISjV4S245c25ORXhOdmdRSDBMc0tseGtN?=
 =?utf-8?B?UGF5N3l5MWhaS1k0R1N2ZlRnTUhteTBkWTBSSkhZYWRkK3JYZWxPVC9Ibnpn?=
 =?utf-8?B?QlI3Qlo2SjZkbzg3R3V4bDV5VFJYMWF5cDQ5VHlURWIwV015MFVMdjBGRVds?=
 =?utf-8?B?MEtDeCtkOEJueThtQzBQOFNhWVdNN1dXSjRNejM0OXhoeWZXdlV4R2hucHNo?=
 =?utf-8?B?cmR4cEtjbHpJeC90U0V5dlJHL2xDZGJ6cSs3TFB5b2Z6Tm82NmFkbDBTdUtT?=
 =?utf-8?B?d1BvVHFDOWFiR1ZKOENXR3hTbXNLQkZUeDlSazlub211ZGpzcHRKZ2d4eXUr?=
 =?utf-8?B?WWo1RVVFOXkyZEdETFFSNEEyeGZ1K2g5UzZWZ1RIZ3RBaFlXWnAvMnd5MTli?=
 =?utf-8?B?UVhqTzA3MTc3Q3ZaUWxaVmdLM0dmQjJNd2JvcEZvem9QZTRzZzkrdTJ5RDlJ?=
 =?utf-8?B?NWxqVG1IVUF0aW9FV0ZHc1hyeUZOUEZNcE1WZ3N1QjVvdWFCZlZOaFBUcG90?=
 =?utf-8?B?aXhBV2srQTRCNHBPeG1hU0pSemNhT055MUh1ZkQxV0JrU25CQVVBMUZ6Ykhk?=
 =?utf-8?B?NUxtN2lXbEcrbHBOTkFwNEtLNldmRC9iZWVsSjJQVWYzcVdnWHNZcnFJM1A3?=
 =?utf-8?B?b3lhd29UQ0VPalIrd1l1U3FPc0VaSzJNdld2MnVtK3ZsMDJKYlJVOHRHUWNu?=
 =?utf-8?B?VVVWMDdwVmFIVlZVMmh4Q2ExNThCbUxNZ2dENzdwalRocTBTTFJvNVl5aHRR?=
 =?utf-8?B?VnNYNHMxdE1hZTdEdkpGL1N0TjVjYXZ3MG9EMzgwUlJ0ZU9ydkpkSnJRQ1pT?=
 =?utf-8?B?YXQyRVd2QjNJQnd2VllwUnE4ZXp3TW9hQnNWN0lCNHdSSitvZlZZUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ec9236-d0bb-41d0-2ca6-08df25371fed
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:39.9999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsK0h4PKq4FqdZcPr0LBkyNZuFtJkM4TmxJ7CoZwNPyN5+/cmz4pLkLOYC97oRi4uV51Y0oskIYP5igmtbEzcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8795

The `project` method needs to perform covariant coercion on covariant
fields, causing them to no longer being mutable. Implement a `with_project`
that does not require covariant coercion by using higher-ranked trait
bounds, thus allow the fields to be assignable inside the callback.

This mechanism can also be used to access non-covariant fields.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 141 +++++++++++++++++++++++++++++++--
 1 file changed, 136 insertions(+), 5 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 6b39355c43ea..8e75e1289076 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -850,10 +850,17 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
     } = &info.struct_;
     let this_lt = Lifetime::new("'__this", Span::mixed_site());
     let this_lt_generics: Generics = parse_quote!(<#this_lt>);
-    let generics_with_this_lt = CombinedGenerics(vec![&this_lt_generics, generics]);
 
+    // Wrap in `CombinedGenerics` because it's ty generics will always output `<>`, so it can be
+    // used with `for`.
+    let field_lts = CombinedGenerics(vec![&info.field_lts]);
+    let generics_with_this_lt = CombinedGenerics(vec![&this_lt_generics, generics]);
+    let generics_with_this_field_lt =
+        CombinedGenerics(vec![&this_lt_generics, &info.field_lts, generics]);
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
+    let (_, field_lt_ty_generics, _) = field_lts.split_for_impl();
     let (_, ty_generics_with_this_lt, _) = generics_with_this_lt.split_for_impl();
+    let (_, ty_generics_with_this_field_lt, _) = generics_with_this_field_lt.split_for_impl();
 
     let this = format_ident!("this");
 
@@ -927,16 +934,78 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
             }
         })
         .collect();
-    let structurally_pinned_fields_docs = info
+
+    let (fields_decl_lt, fields_proj_lt): (Vec<_>, Vec<_>) = info
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
+            // Fields shared-referenced by other fields can only be shared accessed.
+            let mut_token: Option<Token![mut]> = if f.borrowed.is_none() {
+                Some(Default::default())
+            } else {
+                None
+            };
+
+            let mut accessor = quote!(&#mut_token #this.#member);
+            if !f.captures.is_empty() || f.borrowed.is_some() {
+                accessor = quote!(
+                    // SAFETY: we have `Erase<..>` which we know is layout compatible with `f.ty`.
+                    // We cannot include explicit type name here as the field lifetimes are nameable
+                    // in this context, so `for<'field_name> ..` would fail.
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
+            if f.pinned {
+                (
+                    quote!(
+                        #vis #name ::core::pin::Pin<&#lt #mut_token #ty>,
+                    ),
+                    quote!(
+                        // SAFETY: this field is structurally pinned.
+                        #name unsafe { ::core::pin::Pin::new_unchecked(#accessor) },
+                    ),
+                )
+            } else {
+                (
+                    quote!(
+                        #vis #name &#lt #mut_token #ty,
+                    ),
+                    quote!(
+                        #name #accessor,
+                    ),
+                )
+            }
+        })
+        .collect();
+
+    let structurally_pinned_fields_docs: Vec<_> = info
         .fields
         .iter()
         .filter(|f| f.pinned)
-        .map(|f| format!(" - {}", f.member.display_name()));
-    let not_structurally_pinned_fields_docs = info
+        .map(|f| format!(" - {}", f.member.display_name()))
+        .collect();
+    let not_structurally_pinned_fields_docs: Vec<_> = info
         .fields
         .iter()
         .filter(|f| !f.pinned)
-        .map(|f| format!(" - {}", f.member.display_name()));
+        .map(|f| format!(" - {}", f.member.display_name()))
+        .collect();
     let docs = format!(" Pin-projections of [`{ident}`]");
     let (projection_def, projection_init) = if info.is_tuple_struct {
         (
@@ -972,6 +1041,42 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
         )
     };
 
+    let projection_lt = format_ident!("__ProjectionLt");
+    let (projection_lt_def, projection_lt_init) = if info.is_tuple_struct {
+        (
+            quote! {
+                #vis struct #projection_lt #generics_with_this_field_lt (
+                    #(#fields_decl_lt)*
+                    ::core::marker::PhantomData<&'__this mut #ident #ty_generics>,
+                ) #whr;
+            },
+            quote! {
+                #projection_lt(
+                    #(#fields_proj_lt)*
+                    ::core::marker::PhantomData,
+                )
+            },
+        )
+    } else {
+        (
+            quote! {
+                #vis struct #projection_lt #generics_with_this_field_lt
+                    #whr
+                {
+                    #(#fields_decl_lt)*
+                    ___pin_phantom_data:
+                        ::core::marker::PhantomData<&'__this mut #ident #ty_generics>,
+                }
+            },
+            quote! {
+                #projection_lt {
+                    #(#fields_proj_lt)*
+                    ___pin_phantom_data: ::core::marker::PhantomData,
+                }
+            },
+        )
+    };
+
     // For fields that references other fields, field access syntax stops working as they're wrapped
     // behind `SelfRef` because their actual lifetime is not on the struct.
     //
@@ -1022,6 +1127,13 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
         #[doc(hidden)]
         #projection_def
 
+        #[doc = #docs]
+        // Allow `non_snake_case` since the same warning will be emitted on
+        // the struct definition.
+        #[allow(dead_code, non_snake_case)]
+        #[doc(hidden)]
+        #projection_lt_def
+
         impl #impl_generics #ident #ty_generics
             #whr
         {
@@ -1041,6 +1153,25 @@ impl #impl_generics #ident #ty_generics
                 #projection_init
             }
 
+            /// Pin-projects all fields of `Self` with proper lifetime.
+            ///
+            /// These fields are structurally pinned:
+            #(#[doc = #structurally_pinned_fields_docs])*
+            ///
+            /// These fields are **not** structurally pinned:
+            #(#[doc = #not_structurally_pinned_fields_docs])*
+            #[inline]
+            #vis fn with_project<'__this, R>(
+                self: ::core::pin::Pin<&'__this mut Self>,
+                f: impl for #field_lt_ty_generics ::core::ops::FnOnce(
+                    #projection_lt #ty_generics_with_this_field_lt
+                ) -> R,
+            ) -> R {
+                // SAFETY: we only give access to `&mut` for fields not structurally pinned.
+                let #this = unsafe { ::core::pin::Pin::get_unchecked_mut(self) };
+                f(#projection_lt_init)
+            }
+
             #(#accessors)*
         }
     }

-- 
2.54.0

