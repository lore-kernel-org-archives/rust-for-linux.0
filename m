Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021118.outbound.protection.outlook.com [52.101.100.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84669497B9C;
	Thu,  8 Oct 2026 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462293; cv=fail; b=lqjBaQyikF+bJrTeT02WBWgS5LOuE6OuVgScB5WY4JiZgGc5Pm7x+foxIF5RYQKK2MQpTR23hgZ6EPfT5v4OR31Jmaz4hU1JoeRPO7NUQlLpPFUQ9TwaTzSG9P+WG29sIhlVJMCy7EeJFMbPxIQ1s8CY90YmZxlhu49zTFYUgQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462293; c=relaxed/simple;
	bh=uLJCM4Wwr/hWpkJiFmjWRWzQuU2Za5EW7ZBnResD4aw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uttv66HNIJVnoPQabMeviZ/c5uVqnUUdngY0g2g0zfSZpDfXASlrKMMErcZMIs2PY1Kcqh7lAIz7TKFQyx6ANdFEmSLduy4F5CB3HtmwVzZy10Ugt5ofbKwYnwnQC8Wx3MXGHjMmO/6kVXes57Nt/MTXnsBB/0E32EHS3M0i6uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xDAjXy4Y; arc=fail smtp.client-ip=52.101.100.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xDAjXy4Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=un0MadBF8rG/zS/ivvfxw2fFVkVLRj8cmYlTQ3xX03PB9m17SvqCALaMda9/sFsw+qoX0SI/kzcJwrN26k+W13ssfZybWQ6AWK0acoqXTF7bXMhay/PXFR62lFX8pVlX+fhZQlbEYX45xl7ZxBnFygBuomtstTksuwg5gWEDq5qApvT6o1rAryBkKuyVm74+W0cxsnmjTBWSyS4oTogzAPnYplMaZxAVNZbwozG/IaTKdtWUnJgzIB9FUlIkI/0ohpv/K6UrgMW3B6EEEEisYdkTiTMXUvrYZW8hmj7aP4zoWO2U/i1RYv2HM78j0mDAfg13PDdwoLLPy1mqVQEN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYbA0ZYrbfTljl+9bN31/nh5kq8/YYiEEZYk6zIXvk0=;
 b=LJNCksReoEm/HnYB9ETudRXSsuXNQXeCSfxk+Md6yKsmcQm80ickeK1uj28XZhD6qAye3ZHxsuAjVYmuQCo8Fe8bdVyKXFrPnJS648f3SoWq9rP+JvARDbVlUtV8wIyr4p5co3WYyhN9fF0+aYUG4/HJ1B22v1e1eX4wrj8Z2BW9EMNKz+wfXo3l+Jm1ZGUVjiwFUSAGVvspfir+jQi7vN8ksT1d9SXpH6eX50ySVV+kSR69qxN5liqyX5EK4vFUr6fvWTWwH9S2ttoAJN6V4bnfMMz0LLeuz/I4AOLZlcmHInltdVmiHlOQtYl5aubwH/bBkFQ1ThjCRQA0uCFnhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYbA0ZYrbfTljl+9bN31/nh5kq8/YYiEEZYk6zIXvk0=;
 b=xDAjXy4Yz7aeL34GNHrf4WnLy2TW1DSaXWd9iHWq2fbpY/v/qHUkKoZQLrlbiTnmbXGtMRKn+QjxpfeHWnILtBy3f7jaX+pG6vH2IbL8r+feFnvv5zpIoZlAxO4JRoLfitVTIhzsQw590BG+Gtt0I/br7wa0opCv/P43sz5FEfo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:45 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:45 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:23:59 +0200
Subject: [PATCH 12/20] rust: pin-init: internal: pin_data: allow lifetime
 to be shortened per field drop order
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-12-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6756; i=gary@garyguo.net;
 h=from:subject:message-id; bh=uLJCM4Wwr/hWpkJiFmjWRWzQuU2Za5EW7ZBnResD4aw=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce70w81T1LnnKEaFm34y2Cq/dxpWWf0/27YLvBtz
 vQQphdR3v4dpSwMYlwMsmKKLB7djGmbGGfLXtYqfwkzh5UJZAgDF6cATETuHsM/o5V9k440XY+7
 oPO37O6kDbWy2k/22e1aH/b3dfsNRdXGBwz/K+Pk532U7jtqLTvv4HTHueH+f/QNWPNOykfo/xa
 209nFDgBbnUhh
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
X-MS-Office365-Filtering-Correlation-Id: f7d4e0c1-e176-4569-1be1-08df25372355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|10067099003|56012099006|11062099010|22082099003|18002099003|7136999003|3023799007;
X-Microsoft-Antispam-Message-Info:
	FNrTWMYAAM4sGjJtC6M0iZZWGxWJs8pUHSOn40lchiz22Xkd4VBDYaIYrC04h0cIWWxRj73wGGqTGI5C/OmLOI4u6KChT5DvO0X8F/NuQJM+6IiZB9WU9TLGJfbPT80ieh9IU6pMGylB8wtx6ytmFxc2WkvWgtmAMIIQdA+/ujQLwp8CNqs1ca8BNb3JHJPf9LfIeTH4wTed4YM+ZQgQhcEwgSZ0LfBwJeEfJ54ZsM4MvpZPRKrJ/HuEeEYGfLkPDH5voNgi4usZuZxIw0IBQI/aCUXcZjzgz9+kcKCkrQUH0CjQFTwBfLt9xtta56pNFviHByi9f8U2gerB1deGyeDtje5QBzisJILq32g7pD4LSP4cX3jAdUM0thXhNOUo+4h1vLRk2Nb4Sb5ADzFRU5uaLD37yKPqsVjy52xnmOvVHcTEtnyfFTds4oAkc0x3sFe43C1YH+aXIiUvg93kSdOTAO5a6mYK6kIEXozlMzFjCdqGF+mEyFlgXx7i3EnV6W+GXmZxZ0DpdMnE8PVzWcEnOhog48Pslzk5BnnXQdmUDyDQPIg48WO9xUdZxKUBgPt9mb+IN6PxgH8k/YSUw4w+++K4Oals/jfKSe/+GOxphnI2c6UwoZZIqPzAAyL1IHWTDNihobWP1qLGaWgopkPrnevQVWsxOOX6gp1U5iNUWrsTs37hYk9c+mym7Izs/kfjczxq2eo6HEnFvxngHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(10067099003)(56012099006)(11062099010)(22082099003)(18002099003)(7136999003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eC9palBFbks3U3lwRXpGV05ybFBQL3EwbitHRWpyZkFsWXVUa1Bpa2FnUW5K?=
 =?utf-8?B?OGNFU3ZiMDl6MFFVZVhpWURxa2VwcWpjZ1ZKM2xSMlJsNVMvK1lqWVovOWll?=
 =?utf-8?B?dloxQzV1S2hnNS9ORmJPTXhqNEd6WU5nSUtBMitLaGUxYUdKdEZMR1MrZ0Y5?=
 =?utf-8?B?WGRRM1RxeUtEWkNIcXRpR1d2WWdkSDU1Yi93UjhPS2NPL1BuOHJQWDliQ3Bs?=
 =?utf-8?B?ZE00T1o0ay9kMW9RbEpBemk2T1ZWYW1HK1ovSlY3VkZSRkF4TGtUYy9TMlNH?=
 =?utf-8?B?czJ4b1NUeGNHY1ZtdEorTlYzUGlHa29zOVlQekJDS2xjc2hhL2JSay8vcU1Z?=
 =?utf-8?B?VlZGSXpGTW54NHdVWUFESFBTdFJWWFo5R1pnTXF3MG1BbzI5SHMyU0FEcms5?=
 =?utf-8?B?aVNFZTNydTJCb0RBT2ZvaFZLL1REYjZQNGFxME1LQUxuckZ3U2F0S00xd0Vj?=
 =?utf-8?B?WUpjaFQ2dnpWTnJpVW5DbnRnZzlKd3BlYmg4ZDZqSGVCRGtXdGtQT0VscXFL?=
 =?utf-8?B?bkV5WCtzSU5TS096NGlDY3Y3dWdCNkZ4bHBtdE5aZGMzSDhXSG01TU9DQm05?=
 =?utf-8?B?aUEzYytjTUtZTHc4QnRvT3ZGODI2dlJVY3d2em1oUzNiQ1hBY1U0bTNUdHZo?=
 =?utf-8?B?Y3A5VHhBUS94NHVERyt0N1UyU2VPVGxOaDdBUGNFalYvdUNPaW5vdS9ZZ0xV?=
 =?utf-8?B?dnMvc0pLMjBZT0lJTWIzZzV0dXVBc2JURUhzdXZJR1NudFR5QXdFODQ3eDBO?=
 =?utf-8?B?RUdrekRwZHo2YjhXc0JmSmlYWFJ2SnpOVEpSRTdpbVN1SzRzRmsxWWVOaXN2?=
 =?utf-8?B?NzBhWlJFMW9DYTc1SDdjSW53a0JqMVBLWGdSR3FSUks4SGdoR2c1UzZHbXVj?=
 =?utf-8?B?Y1VQYStMcE1RYTdUWFovSzcyQ0wwbXM0Mi96YUtjRWNaV2k2V0duYUM1eEND?=
 =?utf-8?B?WWU0M1hoTmhjbUdTNFhGZVc0UW1LNWFvSEZvajF4NEVmNmlPSjRpVjBHbUtx?=
 =?utf-8?B?QjE5Ulpma3BNNmltbi81YlVmaGJyeU1XczBSSFoyVUptWU4zVVBSNlc2ODY0?=
 =?utf-8?B?ek9zb0tPT1o4Skc0eWdvNWtaNDVGRU5vcUQ0TytFKzBXQmFxZUJuY3VnWmla?=
 =?utf-8?B?WXRXb0RSaFNCYzZ0K3pQSFI5VC9qbUl4eDQ3UDZUYTdKdGdsZjRyNmNCangv?=
 =?utf-8?B?SXlZYmZuN0lHN2lwd25DMEhRaDJmRU5vZllMWGlOcDdrb1dDT1R0aTNMM3VJ?=
 =?utf-8?B?Q3FCUUVxTGNwUXZ2R1U4b0s4SjhhdkNOampWWnRXM1FqSy95QjViZDY3eFg4?=
 =?utf-8?B?WHZZUTRlZmdhdlN2OHZXWDJYWWJHcXU5MGxiZGluK0dYREpqcFMrMEcyZmtE?=
 =?utf-8?B?a2w2amlKY2xxbG5QSEtCUHd0MmFJVDU3dFZqaXZDWThibUQ3cUtWeU8ydWN5?=
 =?utf-8?B?aUU3Rlg4eWV2SmphODhkQml1eTRRZEtTMUE5RFJqOVRNcmJvbzEwQ0NrWnNY?=
 =?utf-8?B?b2t0dzlPQ3dGeUQwdW1CNDFUdlAyejBwd3lxZTA3N2U4cUdqU200eWs1WDEy?=
 =?utf-8?B?YXgxTDEyQUcyVzZ1eFBNNlFGY200cm9tNWV5SzlaQld4amFUbllkQ001N2Vl?=
 =?utf-8?B?OVBrUm8xWXRyQTBYZEtkaDZXOTNZQ1F3US9WeU0rb2hka2VSYS9IZ1VhUjlu?=
 =?utf-8?B?bFhTYkE1UytnVVRZanlmaXRzNC9BLzNnZEM4QmZYU1BWSm9sS0VmVXpmU2g5?=
 =?utf-8?B?WDM1NmpNYkxCUVFUeVFmOWJDekxraDEveUpLczYxQ0ZpcjVkZWQzbnh2S09o?=
 =?utf-8?B?R0kwMHlqUnhPVEhjd09keXcxLy9HeG43d3ZvVnE2eS95NldJeUVMdHd0dWdw?=
 =?utf-8?B?VkowMlBZYmRvL1p2R2MxeTg1QnRSOGJzNWlVVzdVcHdocHVUcTYrbDNNME1o?=
 =?utf-8?B?bXh6N1c2MVpUcjJXTUkzU1hJR1V1YXpWTkh3RHB0TWJ4dURCK3k3Q1VaaFd4?=
 =?utf-8?B?UHJiclZTMXR0NjVLcFRRK2NMYzFoRGVlZE1IRGpQUjkwa1NUNXVQNXYwYVVB?=
 =?utf-8?B?MUZ1ZDRWc0gwU1c3Y2R1OG9MMjU1TkNnUFRZWVFEQzlSTlljUGpnN1puRWVC?=
 =?utf-8?B?dzBidXJlcytadkxKVzNDc0lFRklnWUc3dUFnTTZlb0dZMU1vQjZ0SzNGQzJO?=
 =?utf-8?B?WVdMdXhqaHBFV1lMeE41SEdnenpiSER5d2QzWXhkM2NvVkVOV2l2ZmREekpQ?=
 =?utf-8?B?Uk5aT0t3aStoUWFvRU91cGNER1hxSmFoVWpKcWlWclFhb21BZVpOMWlsQWhH?=
 =?utf-8?B?UFVIbm5XUVNmbGkxaHlRb1VOZlBXZEFVcEU0VXBaSXJUU0V3dzFjZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d4e0c1-e176-4569-1be1-08df25372355
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:45.6945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrCdSmsa9+kZb01Upv5wYrhe9c/rPyL+djpO/ChAU09hjpCry1zrp49Oh7yjIf1azQLZRNNLnDPWroPQwIJLBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5471

Add the outlive relations per field drop order. This allows a single
lifetime to be used when a field potentially borrow from two different
fields, by allowing the longer-living field lifetime to be shortened to a
shorter-living field lifetime.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 82 +++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 91c27e1aebf3..0f132a99f366 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -107,6 +107,7 @@ fn cmp(&self, other: &Self) -> std::cmp::Ordering {
     }
 }
 
+#[expect(unused)]
 struct FieldInfo {
     field: Field,
     member: Member,
@@ -124,8 +125,8 @@ struct StructInfo {
     field_idx_map: BTreeMap<Ident, usize>,
     is_tuple_struct: bool,
     self_referential: bool,
-    /// Field lifetime generics.
-    field_lts: Generics,
+    /// Field lifetime generics with outlive chain.
+    field_lts_outlive_chain: Generics,
 }
 
 pub(crate) fn expand_with_cfg(
@@ -346,16 +347,20 @@ fn expand(
 
     // Create a lifetime parameter for each field.
     let borrowed_fields: Vec<_> = fields.iter().filter_map(|f| f.borrowed.as_ref()).collect();
-    let mut field_lts = Generics {
+    let mut field_lts_outlive_chain = Generics {
         lt_token: None,
         params: borrowed_fields
             .iter()
-            .map(|borrowed| {
+            .zip(std::iter::once(None).chain(borrowed_fields.iter().map(Some)))
+            .map(|(borrowed, prev)| {
                 GenericParam::Lifetime(LifetimeParam {
                     attrs: Vec::new(),
                     lifetime: borrowed.lifetime.clone(),
                     colon_token: None,
-                    bounds: Default::default(),
+                    bounds: prev
+                        .iter()
+                        .map(|borrowed| borrowed.lifetime.clone())
+                        .collect(),
                 })
             })
             .collect(),
@@ -363,36 +368,26 @@ fn expand(
         where_clause: None,
     };
 
-    // Insert necessary bounds to make types well-formed.
-    for field in fields.iter() {
-        let Some(borrowed) = &field.borrowed else {
-            continue;
-        };
-        let field_lt = &borrowed.lifetime;
-
-        // For each borrowed field that borrows from other fields, we need to insert outlive bounds.
-        for capture in &field.captures {
-            let lt = &capture.lifetime;
-            field_lts
-                .make_where_clause()
-                .predicates
-                .push(parse_quote!(#lt: #field_lt));
-        }
-
-        // For each borrowed field that references a generic, we also need to insert their outlive
-        // bounds so they can refer to generics.
-        for lt in field.generic_lt_captures.iter() {
-            field_lts
-                .make_where_clause()
-                .predicates
-                .push(parse_quote!(#lt: #field_lt));
-        }
-
-        for ty in field.generic_ty_captures.iter() {
-            field_lts
-                .make_where_clause()
-                .predicates
-                .push(parse_quote!(#ty: #field_lt));
+    if let Some(last_borrowed_field) = borrowed_fields.last() {
+        let field_lt = &last_borrowed_field.lifetime;
+        for param in struct_.generics.params.iter() {
+            match param {
+                GenericParam::Lifetime(param) => {
+                    let lt = &param.lifetime;
+                    field_lts_outlive_chain
+                        .make_where_clause()
+                        .predicates
+                        .push(parse_quote!(#lt: #field_lt));
+                }
+                GenericParam::Type(param) => {
+                    let ty = &param.ident;
+                    field_lts_outlive_chain
+                        .make_where_clause()
+                        .predicates
+                        .push(parse_quote!(#ty: #field_lt));
+                }
+                GenericParam::Const(_) => (),
+            }
         }
     }
 
@@ -406,7 +401,7 @@ fn expand(
         fields,
         field_idx_map,
         is_tuple_struct,
-        field_lts,
+        field_lts_outlive_chain,
     };
 
     for field in &info.fields {
@@ -703,7 +698,7 @@ fn generate_drop_order_check(dcx: &mut DiagCtxt, info: &StructInfo) -> TokenStre
     // with known lifetime bounds as bounds on the function, and asks Rust to *prove* that the types
     // are wellformed, given the bounds that we understand.
 
-    let generics_with_field_lt = CombinedGenerics(vec![&info.field_lts, generics]);
+    let generics_with_field_lt = CombinedGenerics(vec![&info.field_lts_outlive_chain, generics]);
 
     let (_, ty_generics, _) = generics.split_for_impl();
     let (impl_generics_with_field_lt, _, whr_with_field_lt) =
@@ -846,10 +841,13 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
 
     // Wrap in `CombinedGenerics` because it's ty generics will always output `<>`, so it can be
     // used with `for`.
-    let field_lts = CombinedGenerics(vec![&info.field_lts]);
+    let field_lts = CombinedGenerics(vec![&info.field_lts_outlive_chain]);
     let generics_with_this_lt = CombinedGenerics(vec![&this_lt_generics, generics]);
-    let generics_with_this_field_lt =
-        CombinedGenerics(vec![&this_lt_generics, &info.field_lts, generics]);
+    let generics_with_this_field_lt = CombinedGenerics(vec![
+        &this_lt_generics,
+        &info.field_lts_outlive_chain,
+        generics,
+    ]);
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
     let (_, field_lt_ty_generics, _) = field_lts.split_for_impl();
     let (_, ty_generics_with_this_lt, _) = generics_with_this_lt.split_for_impl();
@@ -1180,8 +1178,8 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
 
     // Wrap in `CombinedGenerics` because it's ty generics will always output `<>`, so it can be
     // used with `for`.
-    let field_lts = CombinedGenerics(vec![&info.field_lts]);
-    let generics_with_field_lt = CombinedGenerics(vec![&info.field_lts, generics]);
+    let field_lts = CombinedGenerics(vec![&info.field_lts_outlive_chain]);
+    let generics_with_field_lt = CombinedGenerics(vec![&info.field_lts_outlive_chain, generics]);
 
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
     let (_, field_lt_ty_generics, _) = field_lts.split_for_impl();

-- 
2.54.0

