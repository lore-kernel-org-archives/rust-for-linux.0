Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021088.outbound.protection.outlook.com [52.101.95.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4933E502570;
	Thu,  8 Oct 2026 19:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487643; cv=fail; b=hY6qvgVZo5xTsOUp5YU5sMsG9AdJwMTuB53jz3EKsv7R+dzspGMDmt/U6WartsvA9mG1evVQv8l4spjIBJD78r4/ygwwwN0qugBtQDBiaI7LZukFNLEdUOs0nyYM3FV53qysMJyy3y7F0jofTERMh26XG50GbbFubVLHoygF0iA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487643; c=relaxed/simple;
	bh=3BsQkF3vrh+PnCKHdF7ZGrDgCSA7KR+sx/fS8Y/gSPY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ljJGqZzSJ5Jg2dtCKKMzxTElldYeuibGghSUd06yHEyzDrrR9CfK0QNY8nZoO/GzHbMtm5D7vqNkBinz/tgoduukqER1LQPyc3jG4Fti8sDwa/gzQN5zNhPgtI07ntb6EzaBRtf6fvvL9gLyG+4gJYTBkSR4GW6tOtZ6oYOZzIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=hs3wum7g; arc=fail smtp.client-ip=52.101.95.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="hs3wum7g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mW6e2k9XgYsxtKS9XFFy1+yXy2tBOC+iA9V3MTuHiEXFsSIqXFlj1FyFa4nzpsK4G2y0pAzlC/HM694le8rTYWowF/tPmzJZh9NutkbbqMctsEamBAoQx6P1ZIy4bRk8Bhyek74PK3ubycZ/WshsnfAPu9vabjnpxN0aHZlTWEqQEUt+Y8BeRMb/LBS6fboOG4QFXi1k9WxWJ4Pn1j16YONJSo8Wu/dHp+WhpEkjTrj9NCfUVxbVKyhNTJV6iVmRFE/1Hk3XaXS6Nxt1Y78rfrapu9IwJpFgZ0n6SU5zbB20cp+xNhnxBNLSl+WDpUgBQamFLcl0T+TEGkf8NplfOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJgJONmu0QJAiW/jHatjj/I/51m+qbqAVpXL5iXp8pk=;
 b=Vcqo5j8VYHF8RpQRfi5/DYsBG9VZaG1U7E3GmioZh86OcQliqoXuK+ajO1Uqx6LFPd/rLVYBDTwuE9vN2f8EN/dyA+5Gb6FqiGGB6ogf9kzJwknDGzSIiUKT+9eI1OJl72Mad8qb1E2YoSsWO6kzFExqts0ToJvfOc0MjpQx+pojc9Oz1zS2RHK/VULQNKx34plIMgFic+AADvZ+PherWmFAYOONDKIKo1t8/qOLitX9STVGkGhxb6by2hP88RLhTGVMQ6GozyPOCotlcIPv9aESi4RpdvB7wdfwSFt9V7FGtB9lfb/I0dFKLbt8QOTc24fI2vW+FOr1wlg9IztrJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJgJONmu0QJAiW/jHatjj/I/51m+qbqAVpXL5iXp8pk=;
 b=hs3wum7gPulqSj/RQj9AwltSWDoDGDlj7kFWSJM6F6GfTQ4r0eeYaUFfvkzPy17lshMrJVh36tvx47yh/ucyHyWx9CyPum9cfS/xLqvr/4bsoNZWA//DPRfvL4y3sJYxZG8WMsl+FxwsAj3s4LBYA03QZK8hdn+hwg05P1ka4ps=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:45 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:45 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:33 +0100
Subject: [PATCH v2 09/20] rust: pin-init: internal: pin_data: project
 self-referential fields
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-9-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9179; i=gary@garyguo.net;
 h=from:subject:message-id; bh=3BsQkF3vrh+PnCKHdF7ZGrDgCSA7KR+sx/fS8Y/gSPY=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcffFVwWDpt+7ou5xbpDZYZ3rvAcy1kdLsR2e+Px2
 A/zn8qe26LdUcrCIMbFICumyOLRzZi2iXG27GWt8pcwc1iZQIYwcHEKwETSuRl+Md/NyAxz6OtY
 XGk5I3xC7un7P9nvzjhlLHqr+Zta0FZuWYZ/NtkMExddUdmw/smKes6Pot2BF0PCBMS/+26yuJx
 lLH6eEwArlUjs
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
X-MS-Office365-Filtering-Correlation-Id: 94c6ff95-c9ea-4851-c861-08df25721738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|6133799003|18002099003|10067099003|22082099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	+zRSvsyTZiDnq+br+dvRyn4+WEiPpYIsGiG+HdGhlgLuJ+dCMm7bLkIxJq1TteoQCXz+vt4CzG7nZU3Gm/K4uoXxSLXGegt+pmsJ/Ap4EXUAfgQUSWX3RtdYpc0htAaqV+qHGItd66ukoOIO8K8wLrAkOxV+uFG5FqUauXpjwpHpEYfwDrh7hJWQSU5aNRzpsDnr0sZVfOFxGsMGnJAARY/wQEaKpdPSjletfnajdjYRHWKTyyAOQNMLgiARJask8R4IwgQSB5CVDOH3XrFb6DqQrVnOksIwI4FHW76tde5xJzs/bwWBUumQvnqaHA83kvmi4zi99XNqL1PR0FzN8iMMIoIVdbVganxzom1EP78BOxaRu6QwCGerSn0DklB41SZzYOizNWTqyQvg1eOfEZVQYD0HJFJd3XNRvmbrH6+CyD96Xrtqdg9BTVp0wzNo6Uus7Xz3e95G5TbwYzLjOxpjn8ZMK0FTkNnr+OPPoD5EVDi6RxUDL4LpNG/dPef4ao33o/CBjcmNnfbA+26BAfxGQDBFHcnuu9c/LditAnb269aSIyU5nn5ig8C2NxXX8s6o+Nhi+A7MjHOXCVjFDTmaiBmuEEf/Iv9WyXaQ6O/L0F9C4Wb7KOPqu9dSZbJUJBDcA/GLXq4NXtCzZ4fJUm1iLnC0AbNjnL/6VPRC2oORbkapvutao3wPJmDp50Unl2VIPrJXOG3GytFScJGVEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(6133799003)(18002099003)(10067099003)(22082099003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1J0VFNtYnVSVFN4OW0xSy94WUVTUHVWblZ3WW9iNm5oZUJ0eXd3WTd1NzFy?=
 =?utf-8?B?NE9aMU12ZWs4RWVHK0dxUW04STQ1SVI1d2R6WjJjbng2Z0NyL2tETmVaUEE0?=
 =?utf-8?B?Yml0T29HeVF5T1BrakZTT09DRUpCVzBOR1pCQi9XbitFM2dNMzdNMkJONEhR?=
 =?utf-8?B?emVHMW14QW1PcXQzYk5jNVdkb0hEMFFWR1JpT1F3eEM1K3BicVNDQit2SjRV?=
 =?utf-8?B?enJqdWFWZVlqUlpCVEdlSzlDK0J3R1QzMDNpbkZNSkxSS1EyTUd4UmxOWTdD?=
 =?utf-8?B?M2NKWk1wOEoyMmpsTWRnazVKTWhLV2kxcEdDY285emh6VXVCMXdncDJ4OWVu?=
 =?utf-8?B?L0hFUkloazlyVjc5Yk85dTJxTG9Kdnd3YTdCZmpHZ1JEVnNXeENXdzRDczFB?=
 =?utf-8?B?eVJsZWFRWkRPcXg2Y3BhajA2ZE85ZFVWQ3J4eUpsZ25nUzhkUzVRYnJhVWdx?=
 =?utf-8?B?Zk5lelRsbHZoUHBvdGhiQ2IwUjVKSFhheWs4eWJ3YzhDNjVnb1pVM2tPS25B?=
 =?utf-8?B?OUV6ZGU0cVVMSURHRk1VMXlabzR2MmNvOTZtdGNPOXdadjl0aFIxdmd2RHZL?=
 =?utf-8?B?Z3RWVHlMSlppd2RDSHk4RnhpRmtJYjFWVkFZR2xhbnVQR3ZFN0RwOTQwOVgv?=
 =?utf-8?B?cXBFK25ENGxhZkxYSlZmdFNQRmV6b1Z6ejVDc3phZGcySDlQdzJVdkxDam03?=
 =?utf-8?B?STFZMWNYS0FHbmlsSWlFaVBrSDNpNWY4dCtwcDYwRGl0blkwNDBpUGQvYTNk?=
 =?utf-8?B?WUFGNGF3bWJDWmpSZkV0eFZSVm42dkpRL0NTeHkrNHczRkdEOGhoZ2VuVWF2?=
 =?utf-8?B?bEMySE5uVUpnUkRkNExCdEpQTWZ6VzFvODYvNk5hczdCcEMxU2Vnc0NlcVNu?=
 =?utf-8?B?L0FDSHltWTMwUTBBU01BTmVubnMrVjlYVXZHR3Z3eVZmZlZmWjQycjc4VU1U?=
 =?utf-8?B?NFVWd0MyZmhPUE5DbVhlL1hoR2UwS3NyQW9iMnk2aCtmRHhzcHNGekpvN2RZ?=
 =?utf-8?B?dFNyVEFjNHhVSmdiOU5wZUp2elpETU5YakVkbVBlWnRGdk9Kek9LZUVwb1VO?=
 =?utf-8?B?ZDZGc1g5ekdxQjVhMVBKdTRTWGUzbTl5a1Via1lUNndNVGpaMUlab2dnQWJO?=
 =?utf-8?B?UUx6c2hheXBrNHZBTzdjTjMxdDdHZ3FqNE5ScnkvTjBVMW9Oa2wzTERQR3Vh?=
 =?utf-8?B?NlFxYWVMQSsxY3Y0RG5VKzZyOUN2MThzcnI0NzJUeFJKTENCWGIvay9KbE51?=
 =?utf-8?B?UlpscUFLZkRmMnFKb0ptejVBZDZ5OHJVVGZQeVczQ1BIMFVJeTEyTzU3TDY1?=
 =?utf-8?B?cStydjRXcC90cFJWRWJkamFnRkVUT0lMU2piZHRaYStDdzRlZ09FVE9jRVIx?=
 =?utf-8?B?YTUyRGV3ZnVLVld3ZHd3L2c4VUtzSW9JOVRzZzJHTFBHOW1FdS9seG5NWUxM?=
 =?utf-8?B?RmgrVUswRFI5Y1ZDN0FmZ2pNQW9XSEthTEY0OVNSVVNITVJPSy9McVY0cGZi?=
 =?utf-8?B?eFhRalJxLzVFMkFrRmVyYlJScldDYkdyOXdOa0xiSWh6WVlnUFppa01vZ3FY?=
 =?utf-8?B?aFZndWkwbGh4YlBvbVVDM1FCaC9FVmlIS0tUSWJyd3NHSkx2L2JYK0ZZZFU0?=
 =?utf-8?B?dSthbjZnV0QwLzBxeG0zbXhqV0xJMWN2UFFJWFNiVXlnS3dEQU11MTQyL21E?=
 =?utf-8?B?NEtaYjM4aE5jYkhPeXdFdmNqblFjUFJ2YldLMjY1dll1QTFvVS9WZmRpdmp1?=
 =?utf-8?B?T3FveUg3dzNIRnpTR29odzdIQW1MVG5pTnNONUp6YzhKRTRUb3FNTWE0TDhE?=
 =?utf-8?B?SnVPd2ZlVlBDNmxvQXZYYlE0cERKeVBGa2hUckg0Q3ZsSmJzb3dKd1NoL09Y?=
 =?utf-8?B?WEhYRDhmbDdTeFo4T2pac25lQnlMNllhc2pIdW5KUVVabHBwN1pxNGFVM3Ar?=
 =?utf-8?B?SHNFRmlhL25aV1R6SUFZUE8rY1B0enUzdm8zU01VM2xlUVdCVE5WWGVTSXQ2?=
 =?utf-8?B?M1U0WVdnellwNElEbnNaQTM1SXFRK3FGVDhPMlhVaXBCWVJHUnRXb0dkWnhM?=
 =?utf-8?B?czZwSDF4SzRLK0diV3VIdFVZeEk3SGljWElvU0QyU01IN2diRFljMDUzL2xK?=
 =?utf-8?B?RGxFbGExc0VZczh0THNiOTBRN3JWTGQ0czJlVHZodGU4QWFuVTJRWjU2cmtH?=
 =?utf-8?B?cjNuRmpaUXYxdm9kZkN0LzAwS2dSWEFZQ1MyQ212Z0h0cUpOanJZRkZXYmRN?=
 =?utf-8?B?VkhYaEFhTG1LVXNyL3RpTjEyb215NHlWeHJQdUMzamtpay9IZ2RZbmVsc0JW?=
 =?utf-8?B?RnZxc3BubGxJaHRPR1ZOUkVGSHRkd2hMR1RjazJ0N2UyckQ1Q2svTU11Wlht?=
 =?utf-8?Q?LmRRMsUEnXCkBfHWVEzRFi5eocQL7q/SNTgdNsR0e6x4k?=
X-MS-Exchange-AntiSpam-MessageData-1: M6N9eqYia1sI0Q==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c6ff95-c9ea-4851-c861-08df25721738
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:45.6554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqLHCy9oSZcO3cW+0sa21cAJhyfnp65gjc0Q75Jh12xcLnV5sHtqPm4yWvhbiDJwvpnn9Fzq6su5YbnRIYm4Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

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
index 307d9b36078c..aa9a848c6670 100644
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
@@ -849,7 +849,8 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
         generics,
         ..
     } = &info.struct_;
-    let this_lt_generics: Generics = parse_quote!(<'__this>);
+    let this_lt = Lifetime::new("'__this", Span::mixed_site());
+    let this_lt_generics: Generics = parse_quote!(<#this_lt>);
     let generics_with_this_lt = CombinedGenerics(vec![&this_lt_generics, generics]);
 
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
@@ -860,33 +861,68 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
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
@@ -936,6 +972,49 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
             },
         )
     };
+
+    // For fields that references other fields, field access syntax stops working as they're wrapped
+    // behind `Erase` because their actual lifetime is not on the struct.
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
@@ -962,6 +1041,8 @@ impl #impl_generics #ident #ty_generics
                 let #this = unsafe { ::core::pin::Pin::get_unchecked_mut(self) };
                 #projection_init
             }
+
+            #(#accessors)*
         }
     }
 }
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index df079e68ec1e..ddd99e705c93 100644
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

