Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021110.outbound.protection.outlook.com [52.101.95.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9638502769;
	Thu,  8 Oct 2026 19:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487640; cv=fail; b=JcUjoEAP/1jZo8Qo7x29qDaf9BAieWlCzdIcgOHzn7JXRugomS0Tq3eyYyVaFrV5TKWRu5r8Qtf1RKmrueRErEk+UdPOGSaRAsG4N6TuOuaKKM1QS6VF54oVvBI/0Mta1VMKU3AUmLnfuZzh6eCBVxpAD6dxV/aS35arRtCQpH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487640; c=relaxed/simple;
	bh=31M0vC/2sq7Awh0mK5cDils5Ux00lhwZ/djTzSKLrts=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tPiTX6qZhrxNCddGrTGnuWVgaOloePt39R6k81VB01UYu2XNDNYApUkcIXyjbe2+w/vC+GNhZK/BLnB6zKr65ifomyxfpPMqzNio6tu8OD14HM/YVIVjkqL5h0YF7TFpNiBsAHIDp1eKBNcq1EbjTDglg1mUR7a5qFLIkBWXEoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=JO531Bt5; arc=fail smtp.client-ip=52.101.95.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="JO531Bt5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9jqAm75yJN4BCkNUkWaIbaLR3ZxgvF8GWHoxhKC27K48PXcp/EZmBpHPXDtY81a60Zp2VJ139mXbl0i/qkxahz08t3eCiIwRclJkPfIxGQ2mqnwfCuZ2RJh4fCCR3dJ53Rky8YZC3zcYKbBHfa5yJFuiZh4EpN18ZL6IAeYQ6K54fzsQ+lgPD73fapuJswWMyO9YG+07zbO44Df0Dqa6QpTIMRsw+LL+v+f1rbW+9G4qqWqbPI1rjePQVDWYlxfD9/CmNdo01ubGnw/5Y/ssMHI/1RQQ0UVTOMu0VQbK1uvlu8D3garw4AJDciHId+KCMZgW9tCcigeD6rAQKfCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OC4pNa3ZMpZx+JY2uZO41v+ADaZd7nfLdAtEU6tlaE=;
 b=Y2KPKflugc+c2RienLtRC2Wv0qLfZ+jwkG7fsyfVLRfG3f+3ltdxsmR+8K9HI+TvDl9+YCKxj7UvURywkUq4eHwoBc4/8O8NtfG86IG+MrwKey7HXxwZogM+sKHFcko+rJ5vkS0jAqPECTgqt6Pt6m3b6mr83xWOwK+X2aQ1M4mf9r0d4ocPTO22h7EFuaacTDkpN0hLB1sGhtk1PC1R0X3lKkHzE95gdTm1DGHOaH6va+3WwKccajE2Oo5UYerrKr+iF84ph311bIPvv4AHgkarOVZZwhPAucwgi/tM2HxC5UKN8KLsY6IYGAhOcYrju80vHRu8yDoLnf490H9UBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OC4pNa3ZMpZx+JY2uZO41v+ADaZd7nfLdAtEU6tlaE=;
 b=JO531Bt5oblLAYeowxbIeV0z4ehVD7VB0yvTtiHcMA9MBfd898hdabOWwjSo+x8m62AZZRwzT8R+IPd3wi7k00roRCzPaRHlASDoy9o02g5JOqm8JiJ3tdJFpoqTsO3DT+gs6B1alnW92ejxMEBg/tuaL4N0POb1o1+qnT1kyus=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:46 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:46 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:36 +0100
Subject: [PATCH v2 12/20] rust: pin-init: internal: pin_data: allow
 lifetime to be shortened per field drop order
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-12-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6800; i=gary@garyguo.net;
 h=from:subject:message-id; bh=31M0vC/2sq7Awh0mK5cDils5Ux00lhwZ/djTzSKLrts=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcffFUxVP/Tefu6L7NzeC1fUjyR5suW/8Hwnfa9Lj
 dev8GR9+puOUhYGMS4GWTFFFo9uxrRNjLNlL2uVv4SZw8oEMoSBi1MAJuJ2nZHhaJ6YX5FQnnJR
 3KUTh8sfJR3l770055e8tOhOsRzDK0srGf7HCj1pCVu2stvL927nQ4mtznMX2p5PZnCdMVPtqXe
 BrAgnAL2DR1c=
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
X-MS-Office365-Filtering-Correlation-Id: 4d9c0c6f-05a6-4278-c5df-08df257217e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|7136999003|11062099010|18002099003|10067099003|22082099003|3023799007|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	cL3MNFxSXLBwVB3q5SLkNHLHKB+Zjh74RNXo38eR5HIHdd2trgrDGCdWXvKSI9wweG7Ya8DnEjvo74mu9vnp84my8ONQhmIdS2g8MuoUrLxsFmT8Q5OvksAAMKpWeo6epJHiEF4e2gBONxl20iYH7/EKURjlXv8UC+I1Gj7PlHGHkE7+KYT8UzeDt8yJUuNEn0ElkWxmFYhQfNl/psiscXYsV0ZXgIhDGf6ON6tmyhTf7AJrghXnwK4w0JHClw+SCY7lyPDyB3csK/sIBA65O+4d6Sm2cwVTg1CQCTj4PONvtmOrHLgbhHBm29AmQUYNfyREhb/Er0xlIpChwX/zoAXyjBDEj8N3MZSXPjBYUaAwe9WvoCE732lvq4YIswlfK3aO0Sq2ZgkwrByH2kjGTc4rzFYycqOobeCVaz98kJPluJgv6F9uOZBwb7RMHfwtqx9TvjWVNmU9urLTmuqT/8ed902rJ+3gZel3XEN76oRsa7SXw55L/6OVKfuMHWKlB8OFMrya4vzk2jMoHsS131LTqKxmvgrIHneDN+2lOfadTlZ2Kt5nHRdlrR86QW+G8NqRY9Vl1lQQalYw7+TDfZkuAQKWC/KgSHF8QS4GgUWoxeeK2TrEBmS5W2DZWeRlq75XD3TgaNmSAGGlE8RjNglPlzujPTXtDTNgY30LCUFAnL+XkTK29rgwPBmebd3hi4EzQp35FesPq1mDtzZBhQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(7136999003)(11062099010)(18002099003)(10067099003)(22082099003)(3023799007)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlJrT0RrYkVVWnFoK0poaWNFLy9aRjVnbUFQSHh5OEc2aDZsQkk0aCtUb05u?=
 =?utf-8?B?bkRsQUhJZDJkejZYdjlXbnB5MU1LRzhnOXhDUFlvdC9vRDYvdDBiVHdXYkRQ?=
 =?utf-8?B?WHF3eWpyQmxqR0ROVldIS1VLOXFZK2JFSUlBZit2a0hyOEVsRUtsUUd5MXFI?=
 =?utf-8?B?MEFHMU5xOU5KUldjaE1hdG5MSGxVaVRlSm5kQ2gzY0Q4U2FDMkdmR1VKN0Z5?=
 =?utf-8?B?YTFka2E1cStaQW1pQ3ZQYVJpWVNPNFJMOVRkVGNPVHBpNWwxQVR5WkNidzRV?=
 =?utf-8?B?WUVEbURWcWZzN3FBVWZJczEwWk90cURxaysydXZPQlc5M1p2WTd2U1VkMncz?=
 =?utf-8?B?YmllRmxtNWFPcUJmaGFweTNsOXgvVldnYUZ3bkEvUlVhSmNEbXo4YzlaRmhm?=
 =?utf-8?B?aUhLaUVvUHdoWkszdG1UOGh1T0U3MU1BanJhWkRMTml0alZjY1puUkFpMGRh?=
 =?utf-8?B?OHBLcWFKTzk5YytFY0EzVmZpWmNjdjBlNHRDY3ZVbFFIUnNPVEY1amU1TjFa?=
 =?utf-8?B?NlUwODkzcm5DUVUydU4rdzJZVW5YVlVsSm1BT1Z0RUlzYk1Kcm5IL1pKYmF5?=
 =?utf-8?B?anJNV2l0ajcvMXQ2eERkMXltUWdpSW51a3l2M2hjZDZnRncvNFdIbzlFNHlO?=
 =?utf-8?B?bmQrb1lhQWd2cHBTeVpBb1ozSS8zQThPUkdVRHRTQ1lqejViemY4d0xhQlVY?=
 =?utf-8?B?N3dQTy9RT1NPMnpsTDNLY0xIcXdaWkl3UG50d1VqSmVwRExtM0ZEUDlkQ0NV?=
 =?utf-8?B?aU5TTS9SZUtta3BodldwTVZ4eSt5Wnl5ODFTSmhpTVVvK2NEdFRXUzIydTRV?=
 =?utf-8?B?V3dEMmJHZnBMYVhDT1hNR0tzV0ltemk1YzduOVA1V1RVck5JRkdDOTVWdjFv?=
 =?utf-8?B?OVhrTFR2VlBDSXBTeENwQWVrU001dFFKQkt4RlRORnlDS1VneE1sSndQam40?=
 =?utf-8?B?S1F2ZWh6RDdNK1V1d2dWbGpEdnlNc0w0UTJldkJRWXhzNy9PT0ZTY0E1Z3RL?=
 =?utf-8?B?aENaaXdYNnZXL0R2dHlabVg2Y0lMQUdPNGwxeWEyeGdaTUQ1bVdManJZdW40?=
 =?utf-8?B?ZEFWNFBBa0RxZ3AxOG5HdFFoSWFoTjlSUkt1eTFJbnROY1JsS2JXRkYvamMx?=
 =?utf-8?B?OVZ2UEwyOGhuajZ2alhDTHZTOFprcDIwaTVxeC9qT21LUjdPbEJoMk1QNkpH?=
 =?utf-8?B?d2QxQmZzeGd1WktPNTY3UytabFlQZkEwUWgvb3lsRjNobjdqU0FFdDZFN1VX?=
 =?utf-8?B?Q0lYMHhIMHlJR25HUWdGNzQ4UWhKaWMrQ3E3ZjE3eS9FZ3ZXMGNTWGFvRXM1?=
 =?utf-8?B?TlVxWTVYdThLVmRoT0xUcjU0TUN3aFFzYnI1VnNaT2xXaWdXandBYThYMTVM?=
 =?utf-8?B?WEtHZmhHQjkyRXFzTk0wTG9RSlUwVjlxc2lJQmRyZkZhcEtsem5KcUNQL2s0?=
 =?utf-8?B?SUZNSUhDWnViSEozVHpTY1NYS2N2OFErVFphMklpekxxdi9kYSs3TmpxYVk2?=
 =?utf-8?B?Q0t6TXdVcE9CMHc1b0ZMUTdja0R6TUlBZUNnL3NsZDlwZUZFWUwvRkFSSU9m?=
 =?utf-8?B?Uk9RQmJUd1VObGM4elE4UkVFOS95QzI5akdsUnNHZFNmWHhTcFdsTTUzcGFt?=
 =?utf-8?B?Q0tMdjl0ZG5SdWVZVkw2VFVjMkJZRXJmcElZdi9QcWk2NWtlOXNPRzh5REo2?=
 =?utf-8?B?MFR3dTNlZ2hlQlBVbU1xU1k2NFRrb1NESGovUDU0UVp1ekQ5TkVVV0ttOHRV?=
 =?utf-8?B?cnZHd2VuRGhIRkxTSy9MZjdITEY5eFcwbzFDYzFCV2xlT3dUclJsTWZZRlQr?=
 =?utf-8?B?akNXdFlKazVRM0VqWE5VbmYwdVFlTDM0M2JqUlNLOWVjMXRJcHpIWTlVeXlp?=
 =?utf-8?B?WFh4ZUNRV1dXSklSYkJ1WlFaUnBSME1RTW1KcG90Z1pJbWd5N0cydFp6Q092?=
 =?utf-8?B?U3FIam5peEpxQ3lYSW9YOFNSVCsvSjlYZVJPdzBYbnJHSUJSNWlaNTdEMlpZ?=
 =?utf-8?B?UWVuKzNBWlg0RURhZnNDUUsxdElsVDZsY0tSUDlva3lLOUltaXpwdFJCWXNT?=
 =?utf-8?B?NkdsQi9FNmV6N1NLQkhjdUhLVCttSXZ3ZHpIQ3JTZkcrZkVyMWVJWGlmekdk?=
 =?utf-8?B?QlQxTlAxVGQ2bVpObHVRZ3pNTXNlRjBEYmFucCttdmlFckl3S0VFUHNLdHA3?=
 =?utf-8?B?eFd1bjJkdDNYd20xK1kwK1BNaUkvTXdOVXRyMkUwYnlJL3NKcGc4UEpKQ3ZC?=
 =?utf-8?B?bGNJa0krWnd4TUNVQ3JHbDM3czlqSjcvMTUvSGdGV3NwdG9IbWtIaENVVmV5?=
 =?utf-8?B?QmRWdE1jMC9NUW1mam9Tb2J3czdmTTczbnZ5c0ZMTG9GT1NkajRYZkUxT1Bo?=
 =?utf-8?Q?tRTgEBEqVDeKVfkUFOTrQICrwtuO+wI1eJF5zxhQXB+sk?=
X-MS-Exchange-AntiSpam-MessageData-1: bmuT0bAi1AI+SA==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9c0c6f-05a6-4278-c5df-08df257217e0
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:46.7515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkDB7qcfxNjckbDlYfYbK/WUbvncekXApN5rDHJd/yd5BREEwm0bm8h9uah6O2PhMIbjtLw4X6Bgjdx/56oAMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

Add the outlive relations per field drop order. This allows a single
lifetime to be used when a field potentially borrow from two different
fields, by allowing the longer-living field lifetime to be shortened to a
shorter-living field lifetime.

Acked-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 82 +++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 6b2c0b1f96b5..6af1f7ae0a08 100644
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
@@ -847,10 +842,13 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
 
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
@@ -1181,8 +1179,8 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
 
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

