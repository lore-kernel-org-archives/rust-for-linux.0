Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020111.outbound.protection.outlook.com [52.101.195.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944EF4FD7A3;
	Thu,  8 Oct 2026 19:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487644; cv=fail; b=Ok6HGOK7hBp8V6fM/D9PgCpi9QGCGX6MEaDT2kG5WPPkx8NCpv/4Z5FBP8luBmDR2qUMZUezAFDAwLhpzJMiOeYVGCJh9w6TRdNGg1yeSIlTeg96ywcJ5fQ+RdfSJe3oZ4c2EWgAOZ3ddMjvM0LVwM26bhl9uskAH4mieqdSQrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487644; c=relaxed/simple;
	bh=5piKxiaRfSTja18aU4BuW+ydcd7vasgW/SmBg2BDJ5w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=q5/B7IGdFzN/s1f4GVSawIrjJVgse0WXF2/oC8rievHoNx7CsARkEGqzwXYvv80QqJoKbRQCqbHQbTRY5/4hQKva8WtGMLyXfiQp1Ep41B9xBjQV7BAVIQLcbmZPFLyOz06Zlu69O/dYHMl6p57/TTlOUDhxaR+7XBxctvTmJg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=x/Fp4EVt; arc=fail smtp.client-ip=52.101.195.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="x/Fp4EVt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBDIeUtUBgWmEyr7pJrtpqKTgk42ROzRQPTRruPqWaQZlN7DziGtqBk3VuAxjEEZETNmKMu7FviTY5ShyN/QsTigXDOQ73RSvj1Ke42RRei8e8nGhnnyw3kFqxCGyayMcXP6Idk1Y7Vri5kKdQfc2w+s5YdIarbzfwI3GsLkPk7k/Kg7fwkOqXfsCQ0vfz329LDuKIujUJmNhqL0kxcBMMryBzcHQ4G+zqvU8MmgljQVrPniLkjVnnRhWIIYI2GE5n1HV3FX1S5KOklysWB88V85rSRt3BWg5HPgrZ2GGJK3fJjhdqX6LNWqcW+F+FvMtUh+WxTDeJZTNCSMtiUQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Thkl33RZFpMlH2TuxYk3mk9CLV679Ul6ggE9vbTkEvE=;
 b=u0AT9dZPZCp7WA2aZuKFqvzlmXwwXVhCTMRh3Czf5+C32zKXb7z31EV8kAnyvVHSHAQ+Tmv1lOoh3ZSZ97my94JZqVw7r0qAaA/xkp41zw8xsXjDfXzxAAKYXLMTHpC3QSxEaYGV9HLosROMM2NPQi/iujr/Dps/zIXehrYhNGbV7gFH5JWsjKGOx1v4Aq5qH2LyaUSFihlWJvRuxALHMtdK0YvmfQoVAwOOG8AhbB671CTGYhKB3fXkpfMInv55Za5yQe/vuUI8a4r6k8f7Ue8Km2MOoa6p/WZ0APDO065iEkIux6RBe2TAN4YVPlgGoBb4mgkPhgy/9gn2cU27qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Thkl33RZFpMlH2TuxYk3mk9CLV679Ul6ggE9vbTkEvE=;
 b=x/Fp4EVtV0isYLkKtekak3928sqqEmS+gYN6t9ZRFha1wpX3XXBRO0RLScEUna9Wfjl+rUWuoXFN8h67ImuIsb2c5YuCrc3acOXXsjDg2D8oD0tV2dM42QxEdK5+LnylNzyAw4KjT9m0AmAF0fzEIXYBzpPb7TxduOR7yQf6FRk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB227702.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:608::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:54 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:54 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:44 +0100
Subject: [PATCH v2 20/20] rust: pin-init: internal: pin_data: support
 existential lifetimes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-20-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18547; i=gary@garyguo.net;
 h=from:subject:message-id; bh=5piKxiaRfSTja18aU4BuW+ydcd7vasgW/SmBg2BDJ5w=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcffFTo+f5920sFl7Z8+zh1W9YWnGHozhdymfPsQt
 mVN6sb4G5EdpSwMYlwMsmKKLB7djGmbGGfLXtYqfwkzh5UJZAgDF6cATGSHLiPDsleZ3SJaBfGz
 shjNQ9lfzVSLqDys3OO3076w/V1PpDcXw/8on695vJc4drLJW17d6Xt3KdN1I9/yrPUcZ0pdd3S
 eMmMHAICIRgI=
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
X-MS-Office365-Filtering-Correlation-Id: ff686472-8e9c-432f-fe2d-08df257219ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10070799003|6133799003|22082099003|18002099003|10067099003|3023799007|921020|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	q0EmkSKUZ2PEUnbf2Cqvj6hMURtSeazCyNV/SZULpcMbbxrbMO9a1BkRphwOjEh+ZJcwuy3B/cMYQFfjTTUX4PgR7dfCE7VYvQH+9bXC/7StS1XousxcZDI+qkVQHJg9RjOP2xo9BoPgQU0tHdnakv2MKxdu2nU7E7qtEC+ZQw6e5O/ZWrs9uZKgdWlR8Dp/uJlZIUSiVucHy818xjIu61laQRrpC3UDsEs7AUujpN8LvlkwdP74hEK4QXOZw3s78ch0KS/NQsvNnQIY1QMtWj9yWb4KqWslJ2i0qrPCngoM1OAuVGpEyDQ8l9Q3HW28wlD0mc322XFYZx3NlLvk469KsmrbJvVOrD00qTNb8n2lPtIT1dBBDdf32EYvCCnwLi1aeB/UHUqoGwQ8qb3NzN+7Fl1cApsemAfDKQyp4tPKt4q5lSQlghmEjjmJN3ILOWDt5AporK1r9yk0GmZSp+WanZraJLac11M/QdK0aioh/UduTcJLejbKVgT0t6o9gKgDDJMpO8CDrNB/5XcGecMvFohy0VPX2Qc35nPE5z4vIUY7Lm/QVcJBPTUmDE406YZZ+4+yj1fcnT6xrHwtn8CCsHL4WyG9AhkjaJz7A0bKmWuYM1vHZzGvXKxI7qzmQqDs66xi1rOvJQzVU40lM7KT8P2B2TY7Bk3HyR6UnummWzTrQ0UiwPLc+OAtVsRL5PM0nNCTAiXIH0iItXPDtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10070799003)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007)(921020)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVY3TmhrYklBUUJBTEtLd2ZkOGdFRXBWd2ZkTzRrT0ZkZ2JZUk04REI4L29R?=
 =?utf-8?B?U0I0Q3IzbXpFWlFEdkErWWxBUGRUVTQvRnpvYnpYTFUreFlzdmIxN2h6OVlm?=
 =?utf-8?B?alRmTEFjeVZmY29iYmZObzJ3UXFvTmE4dkRHaGRnc0tYYjh6eUNoTmFsZ0kr?=
 =?utf-8?B?RXhDMndYY3htUjJ4eWtLZFNDV28rbW56NzUyVEJDY1ZpdnpZdGpEM1JEdHlt?=
 =?utf-8?B?WGJFZ0V3VUl5M2s0YTFaaHZWNlo3VGJNZjYzQVhWR3Bzd1ZWcENTZWNUR1NX?=
 =?utf-8?B?QTZDL2dwYUhGOGxDTStWTkxoYVg4VXJHN2QwRzhZMEYvT0RpU3MweXQrUkdC?=
 =?utf-8?B?T3Nud0FueEVGaGk2anZka25oTnU5bnJuRzlzOEk0eUk3V3lLdjN1MWI3N3Zh?=
 =?utf-8?B?bnUxcHE2cmtWb052NklXUVhjdGFtSTRvMG55dWN6bWxPNlk5NG4xTmZJTVNX?=
 =?utf-8?B?eEFzeTJMejBwMUwrQTMrR3BnYTQ1SHJST2FFclNZdlFXeDkyaUw0a0xVOGpt?=
 =?utf-8?B?NEpJRmYwdzlSWEJ4aGtmdVpqbk9pUEJyd0ludU1PVXRjSlZXVFFIUFlEYmRK?=
 =?utf-8?B?cnd6MGdLSHhwRW1IbzJ6aDdBWENXbjR2SDJia0srMVo4OXZLSUR3RkFFN3BQ?=
 =?utf-8?B?UmlHbEJFWkhydjZITnpYR01VYXludVRYamdoYlVuRTU4dFovcndMbS9heGE5?=
 =?utf-8?B?VXUvNXhqa0JPTkFyREo3bmdFZHliKzZlN01DRTlxMytJbk41U1J0NFRGamkr?=
 =?utf-8?B?dElLOTNQczFMZVlsZVV5M3puL0hxaWZKbXdNcFNkUEFuUlFsVkdRc0lqLzJE?=
 =?utf-8?B?T2JraXU3WWVBU2EwODl4NkU3aEd1RDFvYS9HZ2ZmQnN0Zkcrb2pUd2RqMzJl?=
 =?utf-8?B?RVFWWE1KcDFzaWYva05qZkRxaDFpbVRMdjd1SEhZSHRxaElFZDhodUdtZmF2?=
 =?utf-8?B?SVQxV3pZek81YjlJZktHTCtLTHJRQlhvbzhhQnZoa0x0NDlNRnFmck5Rc2Mw?=
 =?utf-8?B?amJObFV5cmR0Mk5kUWcrYlN4c1RuMDlmWm1PVTQvaWxCaUgwbVUrOEZCUU92?=
 =?utf-8?B?TVRITzhHd1hQc29LVVp6bjE4cG5aMHo1Q2JjOG9ZZXcyalYrakFmMy9IcUE0?=
 =?utf-8?B?QUxRRlYzcXloNy9kSDl2VGVrWFdqWCt6SkVKRzhUUlBPR01pUXNYQ2RGQlhm?=
 =?utf-8?B?Z1ZmUnFhQWN1RXpkVWdTVXYvUlI5VFc4ay9MZU16bVV5K1dvRVBobVJBUTRw?=
 =?utf-8?B?cmpJS2l0dHVpTVhMZU45NW1ob1gyNWUvWFBqTktxV1NIVWxpa0VOSUJoQ0N5?=
 =?utf-8?B?dmtnK0JIWUwyU0htT21MWG9CbzNCcGpIL0V4TXNFcXpCZERpckxxd0FOd2kw?=
 =?utf-8?B?U29KNnRnS2tjQndhUzFlWDlNMVZaNngzamZPb3BYYTA5bGJXOWJRTWNyQWZR?=
 =?utf-8?B?R0lhZWZmbmRSOElQREQ0ZmVudnBDSHFpcG5nOWljQkUxUkxoU2VpaVI0cWRQ?=
 =?utf-8?B?R2crODZoRzltcHkyRU9MSGFBZ1hMZ0xJNmFiWUhKYUY4RUt3NVl2TnNGbkd1?=
 =?utf-8?B?N0xYMEE5c0hoUzBOVkU1cmFqSzR3aVc5VEllaDdGdVh1aFhhS3hnMkY5a0FB?=
 =?utf-8?B?bFFLU0IycERybWR4b005bUcxOG5HU0R6WnZ3Y3FqbzcvK1VCM3RwR2QyaERr?=
 =?utf-8?B?cHEyS2s2ck45L0pMQWhISzlLOWVuVmZQeEdiQXBYdUNhc2tpbHh5VkRjQjBB?=
 =?utf-8?B?M2JzNVJmQVlyc0Zadk1pV2cvZDRSRE5OaXA4MXliSlZVWWQ1dHprMUJpa1lo?=
 =?utf-8?B?TzJWV2FWZ2JJZ25XOWpOMkx4S3RGdTRSNlR2SDVGMjc0Sk9NOW5GKzlITTBI?=
 =?utf-8?B?ZEpxS2xaRmdxRjFHWlptVHVlUWNEMFBRcWY5a05yOXFaVmZpQkRJMk1OQUxQ?=
 =?utf-8?B?U3E0aEVZOSt4d3BlM2dCSm1UWlUwdGdkWTJxRGFZWWs0c1FnRnBsbW91OHNa?=
 =?utf-8?B?cWFmTFJSN2NGNGNyc1MxTCt3MlVaVnYrcFJHeGliYkhCNlhmOGE4djJTZDdX?=
 =?utf-8?B?Nmt5MUp5d005ZjVRSno4V0RhNkRDVFV2R2RKYytwRk1NTzV5SnlFVTRmd0pJ?=
 =?utf-8?B?RnVaRGFGdUpjL05aRDZCcDJBNm5mZnA5Ly9jdW1zbVdrbVFFd09Vem9iYzFt?=
 =?utf-8?B?UGdmQ0lYcjNvRXdLZFpPU2ZHUkJsTEtjZ3BncktjQmsyQnZBMDdEaGJoTlUz?=
 =?utf-8?B?YWlmMHpSNGJVK1hJSEg3LzFMbzN2aDIyRVN4YkpKc2p1RmVpdUZaTDV1L3NT?=
 =?utf-8?B?N1RhL3l3WlB4aE1pbllvZDhka2U4T25jL1VsV0pwRmRLVy8va3RUYU12em11?=
 =?utf-8?Q?ZqexoCc6qx3REDNRcuSyPdl5DGn8M6Ku3T83H/tOa7CLy?=
X-MS-Exchange-AntiSpam-MessageData-1: FOo+gOKtIe0YEQ==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ff686472-8e9c-432f-fe2d-08df257219ae
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:49.7924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcU/YIs9a4JjZaUFtXykz9726UQNA6qpKukp1nOJdNFKYTZYh49XaGErYX4CcMVoFL5dUdA8Zskl6o7sgofvYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB227702

There are many cases where structs that have interior mutability, but they
do not need the invariance over captured lifetimes as the lifetime is
captured upon construction, and new data of that particular lifetime does
not flow back into the struct.

For these use cases, the same mechanism as pin-init self-reference may be
used. Add support for existential lifetimes, introduced by having where
clauses such as

    exists<'a>: 'b

The lifetime `'a` above is minted similar to field lifetimes. Because `'a`
is an erased lifetime living longer than `'b`, the only variance
requirement that we have is that `'b` cannot be contravariant; that defense
is fulfilled by adding `PhantomData<&'b ()>` so the struct is either
covariant or invariant over `'b`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 253 ++++++++++++++++++++++++++++++---
 rust/pin-init/src/__internal.rs        |  15 ++
 2 files changed, 252 insertions(+), 16 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 3d7726e12b3b..df2d2fc5aa2f 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -11,8 +11,9 @@
     spanned::Spanned,
     visit::Visit,
     visit_mut::VisitMut,
-    Attribute, Field, Fields, GenericParam, Generics, Ident, Index, Item, ItemStruct, Lifetime,
-    LifetimeParam, Member, Meta, PathSegment, Token, Type, TypePath,
+    Attribute, Field, Fields, GenericArgument, GenericParam, Generics, Ident, Index, Item,
+    ItemStruct, Lifetime, LifetimeParam, Member, Meta, PathArguments, PathSegment, Token, Type,
+    TypeParamBound, TypePath, WhereClause, WherePredicate,
 };
 
 use crate::{
@@ -183,6 +184,7 @@ fn parse_list(
         dcx: &mut DiagCtxt,
         attrs: &mut Vec<Attribute>,
         bound_lifetimes: &BTreeSet<&Lifetime>,
+        exist_lifetimes: &BTreeSet<ExistLt>,
         field_idx_map: &BTreeMap<Ident, usize>,
     ) -> Option<(BTreeSet<Capture>, Variance)> {
         let attr = attrs.extract_single_attr(dcx, "uses")?;
@@ -208,7 +210,10 @@ fn parse_list(
                 continue;
             }
 
-            if lt.ident != "_" && !field_idx_map.contains_key(&lt.ident) {
+            if lt.ident != "_"
+                && !exist_lifetimes.contains(lt)
+                && !field_idx_map.contains_key(&lt.ident)
+            {
                 dcx.error(lt, format!("`{lt}` is not a field name"));
                 continue;
             }
@@ -240,11 +245,15 @@ struct StructInfo {
     field_idx_map: BTreeMap<Ident, usize>,
     is_tuple_struct: bool,
     self_referential: bool,
+    /// Existential lifetimes defined.
+    exist_lts: BTreeSet<ExistLt>,
     /// Field lifetime genercis with outlive chain.
     field_lts_outlive_chain: Generics,
     /// Field lifetime genercis with outlive chain, with one chain for covariant fields and one
     /// chain for invariant fields.
     field_lts_split_variance_outlive_chain: Generics,
+    /// Existential lifetime with their outlives bounds.
+    exist_lts_generics: Generics,
 }
 
 pub(crate) fn expand_with_cfg(
@@ -334,6 +343,12 @@ fn expand(
 
     let is_tuple_struct = matches!(struct_.fields, Fields::Unnamed(_));
 
+    let exist_lts = if let Some(whr) = &mut struct_.generics.where_clause {
+        ExistLt::parse(dcx, whr)
+    } else {
+        BTreeSet::new()
+    };
+
     // Collect all bound lifetimes from generics.
     let bound_lifetimes: BTreeSet<&Lifetime> =
         struct_.generics.lifetimes().map(|x| &x.lifetime).collect();
@@ -347,6 +362,16 @@ fn expand(
         .filter_map(|(index, field)| Some((field.ident.clone()?, index)))
         .collect();
 
+    for l in &exist_lts {
+        let lt = &l.lifetime;
+        if bound_lifetimes.contains(&lt) {
+            dcx.error(
+                lt,
+                format!("existential `{lt}` conflicts with struct generics"),
+            );
+        }
+    }
+
     // Keep track on fields being implicitly borrowed by being mentioned.
     let mut implicitly_borrowed = BTreeSet::new();
 
@@ -370,9 +395,14 @@ fn expand(
             };
 
             // Parse `#[uses]` attribute.
-            let (mut captures, wildcard_variance) =
-                Capture::parse_list(dcx, &mut field.attrs, &bound_lifetimes, &field_idx_map)
-                    .unwrap_or_default();
+            let (mut captures, wildcard_variance) = Capture::parse_list(
+                dcx,
+                &mut field.attrs,
+                &bound_lifetimes,
+                &exist_lts,
+                &field_idx_map,
+            )
+            .unwrap_or_default();
 
             let mut generic_lt_captures = BTreeSet::new();
             let mut generic_ty_captures = BTreeSet::new();
@@ -399,7 +429,7 @@ fn expand(
                     return;
                 }
 
-                if !field_idx_map.contains_key(&lt.ident) {
+                if !exist_lts.contains(lt) && !field_idx_map.contains_key(&lt.ident) {
                     dcx.error(
                         lt,
                         format!("`{lt}` is neither a lifetime in generics nor a field name"),
@@ -414,8 +444,10 @@ fn expand(
             })
             .visit_type(&field.ty);
 
-            for capture in captures.iter() {
-                implicitly_borrowed.insert(capture.lifetime.ident.clone());
+            for capture in captures.iter(){
+                if !exist_lts.contains(&capture.lifetime){
+                    implicitly_borrowed.insert(capture.lifetime.ident.clone());
+                }
             }
 
             GenericParam::maybe_type_params_visitor(|ident| {
@@ -495,6 +527,9 @@ fn expand(
     let mut worklist = Vec::new();
     for field in fields.iter() {
         for borrow in field.captures.iter() {
+            if exist_lts.contains(&borrow.lifetime) {
+                continue;
+            }
             if let Variance::Invariant = borrow.variance {
                 let Some(borrow_idx) = fields
                     .iter()
@@ -510,6 +545,9 @@ fn expand(
     }
     while let Some(field) = worklist.pop() {
         for borrow in field.captures.iter() {
+            if exist_lts.contains(&borrow.lifetime) {
+                continue;
+            }
             let Some(borrow_idx) = fields
                 .iter()
                 .position(|f| f.member.as_ident() == borrow.lifetime.ident)
@@ -581,6 +619,23 @@ fn expand(
         }
     }
 
+    let exist_lt_generics = Generics {
+        lt_token: Some(Default::default()),
+        params: exist_lts
+            .iter()
+            .map(|l| {
+                GenericParam::Lifetime(LifetimeParam {
+                    attrs: Vec::new(),
+                    lifetime: l.lifetime.clone(),
+                    colon_token: Default::default(),
+                    bounds: l.bounds.iter().cloned().collect(),
+                })
+            })
+            .collect(),
+        gt_token: Some(Default::default()),
+        where_clause: None,
+    };
+
     let mut field_lts_split_variance_outlive_chain = Generics {
         lt_token: Some(Default::default()),
         params: borrowed_covariant_fields
@@ -642,6 +697,16 @@ fn expand(
                 .push(parse_quote!(#ty: #field_lt));
         }
 
+        for borrow in field.captures.iter().rev() {
+            let lt = &borrow.lifetime;
+            if exist_lts.contains(lt) {
+                field_lts_split_variance_outlive_chain
+                    .make_where_clause()
+                    .predicates
+                    .push(parse_quote!(#lt: #field_lt));
+            }
+        }
+
         // If a field is invariant, then the invariance closure rule will make all borrowed fields
         // to be invariant, so they're already captured in `field_lts_split_variance_outlive_chain`.
         if borrowed.lt_variance != Variance::Covariant {
@@ -681,8 +746,10 @@ fn expand(
         fields,
         field_idx_map,
         is_tuple_struct,
+        exist_lts,
         field_lts_outlive_chain,
         field_lts_split_variance_outlive_chain,
+        exist_lts_generics: exist_lt_generics,
     };
 
     for field in &info.fields {
@@ -745,6 +812,129 @@ fn is_phantom_pinned(ty: &Type) -> bool {
     }
 }
 
+struct ExistLt {
+    lifetime: Lifetime,
+    bounds: Vec<Lifetime>,
+}
+
+impl std::borrow::Borrow<Lifetime> for ExistLt {
+    fn borrow(&self) -> &Lifetime {
+        &self.lifetime
+    }
+}
+
+impl PartialEq for ExistLt {
+    fn eq(&self, other: &Self) -> bool {
+        self.lifetime == other.lifetime
+    }
+}
+
+impl Eq for ExistLt {}
+
+impl PartialOrd for ExistLt {
+    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
+        Some(self.cmp(other))
+    }
+}
+
+impl Ord for ExistLt {
+    fn cmp(&self, other: &Self) -> std::cmp::Ordering {
+        self.lifetime.cmp(&other.lifetime)
+    }
+}
+
+impl ExistLt {
+    fn parse(dcx: &mut DiagCtxt, whr: &mut WhereClause) -> BTreeSet<ExistLt> {
+        fn parse_one(
+            dcx: &mut DiagCtxt,
+            pred: &WherePredicate,
+            result: &mut BTreeSet<ExistLt>,
+        ) -> bool {
+            let WherePredicate::Type(pred) = &pred else {
+                return false;
+            };
+            let Type::Path(path) = &pred.bounded_ty else {
+                return false;
+            };
+
+            if path.qself.is_some()
+                || path.path.leading_colon.is_some()
+                || path.path.segments.len() != 1
+            {
+                return false;
+            }
+            let path_seg = &path.path.segments[0];
+
+            if path_seg.ident != "exists" {
+                return false;
+            };
+
+            let PathArguments::AngleBracketed(p) = &path_seg.arguments else {
+                dcx.error(
+                    path_seg,
+                    "existential clauses require a single lifetime, e.g. `exists<'a>`",
+                );
+                return true;
+            };
+
+            if p.args.len() != 1 {
+                dcx.error(
+                    path_seg,
+                    "existential clauses require a single lifetime, e.g. `exists<'a>`",
+                );
+                return true;
+            }
+
+            let GenericArgument::Lifetime(lt) = &p.args[0] else {
+                dcx.error(
+                    path_seg,
+                    "existential clauses require a single lifetime, e.g. `exists<'a>`",
+                );
+                return true;
+            };
+
+            if result.contains(lt) {
+                dcx.error(
+                    lt,
+                    format!("an existential clause for `{lt}` already exists"),
+                );
+                return true;
+            }
+
+            let mut bounds = Vec::new();
+            for bound in pred.bounds.iter() {
+                let TypeParamBound::Lifetime(lt) = bound else {
+                    dcx.error(bound, "only lifetime can appear in existential clauses");
+                    return true;
+                };
+                bounds.push(lt.clone());
+            }
+            if bounds.is_empty() {
+                dcx.error(
+                    pred.colon_token,
+                    "existential clauses require at least one outlive bounds",
+                );
+                return true;
+            }
+
+            result.insert(ExistLt {
+                lifetime: lt.clone(),
+                bounds: bounds.clone(),
+            });
+
+            true
+        }
+
+        let mut result = BTreeSet::new();
+        whr.predicates = std::mem::take(&mut whr.predicates)
+            .into_pairs()
+            .filter(|p| !parse_one(dcx, p.value(), &mut result))
+            .collect();
+
+        result
+    }
+}
+
 fn generate_struct_def(info: &StructInfo) -> TokenStream {
     let ItemStruct {
         attrs,
@@ -783,12 +973,23 @@ fn generate_struct_def(info: &StructInfo) -> TokenStream {
             // implementation and thus may be used inside `Erase`.
             ty = quote!((#ty,));
 
+            let mut exist_lt_phantoms = Vec::new();
             for borrow in field.captures.iter().rev() {
                 let lt = &borrow.lifetime;
                 ty = quote!(for<#lt> fn(&#lt()) -> #ty);
+
+                if let Some(exist_lt) = info.exist_lts.get(lt) {
+                    for bound in &exist_lt.bounds {
+                        exist_lt_phantoms.push(quote!(::pin_init::__internal::ExistLt<#bound>));
+                    }
+                }
             }
 
             ty = quote!(::pin_init::__internal::Erase<#ty>);
+
+            if !exist_lt_phantoms.is_empty() {
+                ty = quote!(::pin_init::__internal::WithPhantom<#ty, (#(#exist_lt_phantoms,)*)>);
+            }
         };
 
         if let Some(borrowed) = &field.borrowed {
@@ -998,8 +1199,11 @@ fn generate_drop_order_check(dcx: &mut DiagCtxt, info: &StructInfo) -> TokenStre
     // with known lifetime bounds as bounds on the function, and asks Rust to *prove* that the types
     // are wellformed, given the bounds that we understand.
 
-    let generics_with_field_lt =
-        CombinedGenerics(vec![&info.field_lts_split_variance_outlive_chain, generics]);
+    let generics_with_field_lt = CombinedGenerics(vec![
+        &info.exist_lts_generics,
+        &info.field_lts_split_variance_outlive_chain,
+        generics,
+    ]);
 
     let (_, ty_generics, _) = generics.split_for_impl();
     let (impl_generics_with_field_lt, _, whr_with_field_lt) =
@@ -1143,20 +1347,25 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
 
     // Wrap in `CombinedGenerics` because it's ty generics will always output `<>`, so it can be
     // used with `for`.
-    let field_lts = CombinedGenerics(vec![&info.field_lts_outlive_chain]);
+    let field_lts = CombinedGenerics(vec![
+        &info.field_lts_outlive_chain,
+        &info.exist_lts_generics,
+    ]);
     let generics_with_this_lt = CombinedGenerics(vec![&this_lt_generics, generics]);
     let generics_with_this_field_lt = CombinedGenerics(vec![
         &this_lt_generics,
+        &info.exist_lts_generics,
         &info.field_lts_outlive_chain,
         generics,
     ]);
     let generics_with_this_field_ref_lt = CombinedGenerics(vec![
         &this_lt_generics,
+        &info.exist_lts_generics,
         &info.field_lts_split_variance_outlive_chain,
         generics,
     ]);
-    let (impl_generics, ty_generics, whr) = generics.split_for_impl();
     let (_, field_lt_ty_generics, _) = field_lts.split_for_impl();
+    let (impl_generics, ty_generics, whr) = generics.split_for_impl();
     let (_, ty_generics_with_this_lt, _) = generics_with_this_lt.split_for_impl();
     let (_, ty_generics_with_this_field_lt, _) = generics_with_this_field_lt.split_for_impl();
     let (_, ty_generics_with_this_field_ref_lt, _) =
@@ -1670,10 +1879,19 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
     // Wrap in `CombinedGenerics` because it's ty generics will always output `<>`, so it can be
     // used with `for`.
     let field_lts = CombinedGenerics(vec![&info.field_lts_outlive_chain]);
-    let generics_with_field_lt = CombinedGenerics(vec![&info.field_lts_outlive_chain, generics]);
+    let field_exist_lts = CombinedGenerics(vec![
+        &info.field_lts_outlive_chain,
+        &info.exist_lts_generics,
+    ]);
+    let generics_with_field_lt = CombinedGenerics(vec![
+        &info.field_lts_outlive_chain,
+        &info.exist_lts_generics,
+        generics,
+    ]);
 
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
     let (_, field_lt_ty_generics, _) = field_lts.split_for_impl();
+    let (_, field_exist_lt_ty_generics, _) = field_exist_lts.split_for_impl();
     let (impl_generics_with_lt, ty_generics_with_field_lt, whr_with_field_lt) =
         generics_with_field_lt.split_for_impl();
 
@@ -1783,6 +2001,7 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
         })
         .collect::<TokenStream>();
 
+    let exist_lt_generics_params = info.exist_lts_generics.params.iter();
     quote! {
         // We declare this struct which will host all of the projection function for our type.
         #[doc(hidden)]
@@ -1838,7 +2057,7 @@ impl #impl_generics __ThePinData #ty_generics
         {
             /// Type inference helper function.
             #[inline(always)]
-            #vis fn __make_closure<__F, __E>(self, f: __F) -> __F
+            #vis fn __make_closure<#(#exist_lt_generics_params,)* __F, __E>(self, f: __F) -> __F
             where
                 __F: for #field_lt_ty_generics ::core::ops::FnOnce(
                     *mut #struct_name #ty_generics,
@@ -1849,7 +2068,9 @@ impl #impl_generics __ThePinData #ty_generics
             }
 
             #[inline(always)]
-            #vis fn __with_lt #field_lts(self) -> __PinDataLt #ty_generics_with_field_lt {
+            #vis fn __with_lt #field_exist_lt_ty_generics(self)
+                -> __PinDataLt #ty_generics_with_field_lt
+            {
                 // Generate a zeroed to avoid naming all fields.
                 // SAFETY: `__PinDataLt` only contains phantom fields.
                 unsafe { ::core::mem::zeroed() }
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 516dd893746e..b9aac6e4bd37 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -725,3 +725,18 @@ pub fn new() -> Self {
         Self(PhantomData)
     }
 }
+
+/// Marker type to capture outlive bounds coming from existential lifetimes.
+pub struct ExistLt<'a>(PhantomData<&'a ()>);
+
+// Dummy `Drop`, same reason as `Borrowed`.
+impl Drop for ExistLt<'_> {
+    #[inline(always)]
+    fn drop(&mut self) {}
+}
+
+/// Type that allows additional `PhantomData` to be attached.
+///
+/// This allows changing variance of types without introducing additional fields.
+#[repr(transparent)]
+pub struct WithPhantom<T, P>(PhantomData<P>, T);

-- 
2.54.0

