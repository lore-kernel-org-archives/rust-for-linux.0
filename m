Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021110.outbound.protection.outlook.com [52.101.95.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E56502550;
	Thu,  8 Oct 2026 19:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487646; cv=fail; b=K3ucKQ05PmgVvWUH7dwl2p5nrdmD62wXH+Qm9aMml45s7EzdQBp08smXEWRm5IsD5SHWpzj83C2cVhYG3zyxuk/HTH+AHtY2w3MyT5dwkRBbup4xehOoq3CXqIA/VZ9k50vtB7pH6kJqug7FbmWyOQgisvL/k98S/95YzAdZPSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487646; c=relaxed/simple;
	bh=WcK5HvRWIyAK1UjzMDXPNBbLLRr5THL1ZGtGUcSO+P0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AvA0srT6qTc2tppJph4amm8/+mHAMTSuOMeTgU6PmzfuN8/ChzQ865ZtxzP1PeUmr5m3ULVOFLqPA1krwmz46g59Z0112dFFaI3anvKxiaP9fKGU5xf9SNphULfTEgnYUymE3Ltn0dQ9Apir3/NzcK8Qumzuv5S2dkipwNWmn4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Ef2Fpy42; arc=fail smtp.client-ip=52.101.95.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Ef2Fpy42"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zj2n+I9DCtYb2XU76nMgwF8ciBA18e9wrqzbAzpCFRJPhHS+A+HjstF/rvIQaoFCGFOWKJcIsZ8rU3DR5iT2Zdrj5y12d/dSzimSYEdRmCNhp5skAJQXExhCnGWas/UhIsA82RdI3rCnEV/UpEwi6/+3SkiIeLlCyln4sz7Ijqe1wsaY53woDJ5zpNwUNzPeeHWEzRiHCWTpTGzK5RInjsglBQQ4462kU4PZZgYi9WsuTCQjCSzNmh15sangFpErkeSgC/nQX9i6sUCO3P25LDtMDhF8bcdVjoq4QDFbOoRLYf+8yFS9AMMlNmlQ7mATba/iH3UTFD7XBHbjVnH/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNztyUOE7VA2i2fuj/MVUjaofwu3ztCGJyQX0eNbpM0=;
 b=WYmcipqu8nUIammB3oUaliwzTHAKwV3pPH1lqcc0Bhtr/kYLXJ7RZlfNcDGOzf0L9av3whCUOwHwOHEuT6q7hFSnDrXhZPhWQVxl/9KguvfhXwTMA9Md804JlS2yhyZE6NHxY/TkZFziiQcKCP+1pFJ6/TMcyA6hks10A5TwZCy1wHuwN3aCqtWUe1JIdNfpqplQuzlZYgq/5Amdbxv85Q/H+AsxKrhLcDKk1YLTyySoDYQjIX1eb2m9BZWOeNI2mElPzYs3LnNZo1y5VXvD8eh55XxDVKln3lwadmjnDSjgLuorBDXUqxJIQB77gcGvJLDixY8ts+GpyU6wAlfOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNztyUOE7VA2i2fuj/MVUjaofwu3ztCGJyQX0eNbpM0=;
 b=Ef2Fpy42sWXQYXAetqRwDgvViCtWWzjgzP9L6BPkfjYOEUZKDTtQK73kPamVirCRq3mhpI6jAJjPTRVO9c7xXO3aY9b6ttNmiTCFrc0EZ31Ka+J3cMaXSP9Yt+5YPGZxFd0l6UjSFETxhGnZW5VvtMzlZvUJ6qDOx0nRR7ZOJJs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:47 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:47 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:37 +0100
Subject: [PATCH v2 13/20] rust: pin-init: internal: pin_data: parse
 explicit `#[borrowed]` annotation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-13-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2813; i=gary@garyguo.net;
 h=from:subject:message-id; bh=WcK5HvRWIyAK1UjzMDXPNBbLLRr5THL1ZGtGUcSO+P0=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcffFew8atrcs9rdN39TfJ6O1ZIlhzvjrFL6Vs87c
 VhvYwf/lRMdpSwMYlwMsmKKLB7djGmbGGfLXtYqfwkzh5UJZAgDF6cATMSDg+Gf4cXut6FenX+W
 v4/qt3t4fuV8l70Pupk4LPfFcZ8tTbRsZWR4dPnIkcBmuX2cudJX5Ls1GiZPytu//yLXtP+Z9oH
 h+76xAAAEqkoD
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
X-MS-Office365-Filtering-Correlation-Id: 0c395b44-33b8-42e9-9d1b-08df25721815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|18002099003|10067099003|22082099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	plYItfTir8mtpaoIJffv1eIh+UZDyg4qupGJGLqYd2eEHuNiZJIjjqcIuHEizC/vK80i6YXjVQ+gwI4cE0htUV+GmG/XHNNlabaMdDcK4d1gAdH6SDQkhoE3Ad0NiynVPSW2MP1EF6uv6576RtgqnVXgPCHwhM0bL2aXS/jA1yWzYppkcc2k/1a6TYO9FUjr6+XaHRLCIAmfAlWLZm5B1neXtqnxtM6W8erk8tNfL9Gl2muD0a+/9f8Kr1FLcguNmNQXnhb0s167G9JtvgYDRO4P/v+O4pmQ5GtHVG6pWLkoZVAiXOPCN7eBr/SyAvivD0QoGdxIWzuPT2I6RqMfcLd4Tt76/nsEWFHxjsSe1UUuyuJcarxrXzSbxU64Epyu9OaTJKiYCc/sb0RZFxijjsl8xTxefaN2e93kFTkYSE/IuuuYTc71BrwqfdhE/pBkA8M2ppnn+KGcPx8isETAlZmVXdkeFn0XoDBqS+qRHt3rUGitnkQlTrYx6fbn/74bXWgLSKKgivTKQy8Fi6Bhm0QIulIsS3yBBhWnyAbvoNUVLSeAZQ7fHNXw9EbwSD9rHMXn0lUS1aw5rCGEbpbowhDYdy0veH/6zEBLf5ZED9GqhDTaKxgrtSavq4L2DHHITTDf7xX1pyBlTH9YUhbpYl8M+df4hkQ3B6lPptc3QU/rY/c/3VuwH4vndVQ4Un1TMc+NDHQDcVZ29XuJ35Q+gA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(18002099003)(10067099003)(22082099003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUgvWTBIVlNEb3gvM2RjWmN4ejUzSXhkTlk3R2UrU0poOXExa09BK2RQaW8z?=
 =?utf-8?B?ZzladDFPNnNtd28zcmhqQXlOWXQvNjQySTBQY2s3ck4vWnppMEhuWlpsMzNa?=
 =?utf-8?B?cFBCblZTbWQzdXFGaFV0VVQ5U3UxbmpzQldhYVdjbkxFTHBUT3VkaGFWWXV6?=
 =?utf-8?B?NjlYbGlzc3FhQlE0WDRvKzl5SllVaEJLSk9qQ0o2UmUrSXo4RjJCMlVCOXZ0?=
 =?utf-8?B?c0dnVTc5ZGt2eUszM0NUMkxIZTZKVW1pSExJa0RVTDREYTJjNnhLY08rMTI1?=
 =?utf-8?B?QlJxVUpDanF0bFpTQ0JOVHNPTW96cEFwOHpRRFFRRmlWZ3ZYS1FDTmZzU011?=
 =?utf-8?B?a0JRamN4OVE5VmZGb0lvQ2NVUnFnR2I1N0ZkRmdJQ1dSZHNib0xscS9RQ2lk?=
 =?utf-8?B?dFZqakdCNjM0UUhlYUROMjFPcThlWkcyM1Z3R1R2Q05NRlk2UHo4N3E3NWZ1?=
 =?utf-8?B?bi83N0ZQSE5vVUFkYUYwckZvNXkzWjEvKy8rS3hMR0NpS3pnc0Y3WG9vanA0?=
 =?utf-8?B?M0wwZXQ5Z0toL1BaWXN5b3hXNmc3ellLWEFFZHRhY1lDVXlyR0xtSVd1VXU5?=
 =?utf-8?B?NFllSWdZdUFUZXFkeXRGTHJueGgwSmUvd24rSUlNcW9MMjBpeHY4YlFiK284?=
 =?utf-8?B?ZmF1TEFqVytnQzFpNnorSUgwRDlIT1pGc3RsZ1ZOMmppQVV1a29rQXpHZmVo?=
 =?utf-8?B?a25NTWlneEIyZHJXVjhabU1wVDAxRFVYME84ZHdBekxYbEMvY3BJdmZNR1V4?=
 =?utf-8?B?UDhjQWZUTlBFSDN0RWw3QmVqczV2RVM2RzRQVjdqSm56SEpmUkVjdEJ6YTA5?=
 =?utf-8?B?ODYyNDNqWjhXcUN2WHVXeUZ2a1VrM0ZrbnFST3VFazR6R3VZZHhlNG9UZkRF?=
 =?utf-8?B?QkRTVHJFcDRmS2hybnJkeWQ1M0hUVVpBOWppNm9tUWd6WEEwanVGWEV2Wk91?=
 =?utf-8?B?WFI0T0NFWGZJcDZYbnB4NVhoR2drWFYvYno1czd1U1RFK2RpeSthOXdSdXd4?=
 =?utf-8?B?RVVqbVB2WkFiOFZyOGJkMkgwRXZUeElBeTE0b0Z5TWFHZTBqRHZ6MUFhUkVn?=
 =?utf-8?B?UFFtNFhMN3hjV2JtcWk5OE56S0dYVjloOHBsM0d5YXRHTTN0allEL1c4ekhP?=
 =?utf-8?B?TWpYalRIY3Y5Q3NSbmlqQ253Z1BOdkNHVVYzQ3Z1bE1kdHYwM3E4K1A2Sjls?=
 =?utf-8?B?WmxUb2Y1L2VXNTM1NFo4eFI1ZldHdDNpeUJtY0JVcWtxVDFheFE1STBNeUZH?=
 =?utf-8?B?ejBPd3RuS2RVQ2NJaWxCaUgvamlvcWZuS2FCMW5LWGVZTU41TDBaR05JSHlX?=
 =?utf-8?B?NkxYQXVDenVhaXg5Sjh4VitVU1h3WERROXZneGdOelRnZkthN3pFTldyV0tm?=
 =?utf-8?B?RnRFZHlURFBHQ1h1RG1uVk1UK3BCdTd1RXhPSk9yV2tXUUpndUdLTnpEMmgv?=
 =?utf-8?B?SUhKdld6RE9NRFRJeHBRZ2NqOFNOZmVOMjZjaytabm4wcm50Q1ZCSnBESFpL?=
 =?utf-8?B?d2xvN1E0OXczZEtUWUVPSEF3WjAyaVJnWTU3RGV5YXJ6Riszd0RaRkRBNmk3?=
 =?utf-8?B?Qnk0YWJnUzhhSzFDU0dxNm5nWHZHV0xYSHJhQ3ZYc2hPRnpjOWFGclcyck82?=
 =?utf-8?B?YlRsdFVQK0V6K3JoNW1SbXZ6UmxUb2hqUkxVN2JxeHpBOEVoT0syaUowRjRl?=
 =?utf-8?B?Ynl1ZlJtSXEvWHlPTjB1N0RvL0VoNldKY0N2N0RvSGJpMXgySUZnQVdOY2V1?=
 =?utf-8?B?Ry9yQlpKMU95Rmgwa3RBUXNYd1l5RVhqeGwveWlLYWtVWXlxR2hKWDQwN3RX?=
 =?utf-8?B?bGQ0US9NcW0rcVBjN0l5cTBRQ3REK3BPZlY5NkxxcTM3MkNvYS9mcjk1YUhC?=
 =?utf-8?B?RlJROGpjazJTTm9MSk9sQmdVZWkrSkF0MTVpcjZsZnIwemdEeitkYk1YUFI0?=
 =?utf-8?B?N2FtcmlxSzU2eXE2SWVxellyS29wUWtkUElHOGhVdTdOT1ltcUh1NmZRYWVJ?=
 =?utf-8?B?bDRRRHhITnRreDE3TldQMFRBYkx2T0RtcFdYc05mMUttMHRvdkMzM1NFeUw4?=
 =?utf-8?B?a3dsTjhZSXhLQXQ0Z1RRTW5DdkQxWkJnaDhYN1NBSlh2UWFkNmIyZUN0NmNt?=
 =?utf-8?B?TWJPS3ZZV29NRzdrM2ZjOTRORThCblN5UVFtUk9JNGFiRlcvaEZUc1F6VzJs?=
 =?utf-8?B?QzgrWGZQVmZhaXhsdnY2MXB2cUFnSVBQVGVsMWhzNnhMLzZMT0pJNjdIdENt?=
 =?utf-8?B?azNGVC9TTjdBVCtIK1pHam9QbWxqSjc3UTlSYk5jSXlkaWV1dHExUTVPR1pO?=
 =?utf-8?B?ZFRzVzArbDFtUW1LRUxCZHVKOFIxaS9EREdWMDd6RzlmekxMZWRaK2p6U1RY?=
 =?utf-8?Q?+IXbbcd78bqr+vs+KV1eATvAJJAhmmmLitbDDnnhhz0wY?=
X-MS-Exchange-AntiSpam-MessageData-1: 5PsUtt233bPRoQ==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c395b44-33b8-42e9-9d1b-08df25721815
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:47.1141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPdzGS8s5yHtTudKtyK4utw4QdSwo9dIZwOgmvWNsqbSKnMPh+ELQQ8OWFwt96Fy06vj5jTzSpSByLspZeC3Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

`#[borrowed]` attribute explicitly marks a field as potentially being
borrowed by other fields.

Acked-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 36 ++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 6af1f7ae0a08..c5b664349caf 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -11,8 +11,8 @@
     spanned::Spanned,
     visit::Visit,
     visit_mut::VisitMut,
-    Field, Fields, GenericParam, Generics, Ident, Index, Item, ItemStruct, Lifetime, LifetimeParam,
-    Member, PathSegment, Token, Type, TypePath,
+    Attribute, Field, Fields, GenericParam, Generics, Ident, Index, Item, ItemStruct, Lifetime,
+    LifetimeParam, Member, Meta, PathSegment, Token, Type, TypePath,
 };
 
 use crate::{
@@ -55,11 +55,25 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
 /// Description of how a field is borrowed.
 #[derive(Clone, Copy, Default, PartialEq, Eq)]
 enum BorrowedKind {
-    /// Implicitly inferreed.
+    /// `#[borrowed]`, or implicitly inferreed.
     #[default]
     Shared,
 }
 
+impl BorrowedKind {
+    fn parse(dcx: &mut DiagCtxt, attrs: &mut Vec<Attribute>) -> Option<Self> {
+        let attr = attrs.extract_single_attr(dcx, "borrowed")?;
+
+        Some(if let Meta::Path(_) = attr.meta {
+            BorrowedKind::Shared
+        } else {
+            // Swallow the error and recover by inferring shared.
+            dcx.error(attr.path(), "unexpected `#[borrowed]` attribute");
+            BorrowedKind::Shared
+        })
+    }
+}
+
 /// Information about a borrowed field.
 struct BorrowedInfo {
     kind: BorrowedKind,
@@ -305,11 +319,25 @@ fn expand(
             })
             .visit_type(&field.ty);
 
+            let borrowed = BorrowedKind::parse(dcx, &mut field.attrs).and_then(|kind| {
+                let lifetime = Lifetime::from_ident(&member.as_ident());
+
+                if bound_lifetimes.contains(&lifetime) {
+                    dcx.error(
+                        &lifetime,
+                        format!("`{lifetime}` appear in generics and would conflict with field lifetime"),
+                    );
+                    return None;
+                }
+
+                Some(BorrowedInfo { kind, lifetime })
+            });
+
             FieldInfo {
                 field,
                 member,
                 pinned,
-                borrowed: None,
+                borrowed,
                 captures,
                 generic_lt_captures,
                 generic_ty_captures,

-- 
2.54.0

