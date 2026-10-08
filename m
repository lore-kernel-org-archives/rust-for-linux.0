Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022078.outbound.protection.outlook.com [52.101.96.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46D848FF8E;
	Thu,  8 Oct 2026 12:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462276; cv=fail; b=knImae5nEexbFbZmkInnd7ee5Bx7N7VTEOcuJZxNsYrG54fcILDqdlxPDlZ56ol3H1VxXhXOyPPv/B/Aoe1z5TK7edLHD/AdZiBvoN6LVgs2ALfbHMggcpXTHqcUDYh3/Gt/eOYEyinhgRwNUfnv8cHnHJEzvxYXUKa4MLDZjzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462276; c=relaxed/simple;
	bh=p8bINO1e9mnjzqlKH23m+oo0gzrdIrmJvXABbhld7wU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Nmv235LdLw3e899DSJGPq3LK/3+0Kbqqnp+vvQruoc4qGBNDDP8nBY4okA1kJoSJmRUveec5hmlJPaZNi23uy06ULIkg/0Lcg253c9ATrnSoqarX+z2Mp0vmGl08kNXRcJr75V5RbkWyqmKAWO8Ylzi6OnzpZGbSAlwtRvr8+t4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=VrZ1wcHT; arc=fail smtp.client-ip=52.101.96.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="VrZ1wcHT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCENBoLu/bhbb4bJxDR9oDYTzGr6NtB3KdHs8ICEEgdYEHqcXGn2fLerL/Eawcf1X6RMd6Eq7JQEZy8aY0D6irWw9DhnpxAQwRLuWRcBpSD9a6Prj6aoUxGaX+LEx74VTq6UIAsCVAAkMt56Qy0sA8u6fzb7j3NwBqn4MakYRS2Ycc0CE6/tvuclRm/bnhtzS4F5A49cxJxYSWXo/zoSOAssR51+bw4wzdL4dzsX7DdM53S/cX2LY1bVd5GFNvpitCK/hyVlP9VcjxMv5SecqnLAFvlDU2pyyJBsyAGVwLsgjK7XGyRavJZmwFf1lHd5hCbSXPSeUzyO/J3w6PdQ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGHK3CFBqHQOzzYOSzK0SSN9J2qHvcKfEtQbGtzmsak=;
 b=M1FKqVCNAFvr6kHBKWyVv2bFKedSzQA++gHQlBHBTnomfvnNOGhnzkDkE/6pDD1Ce34370O8HNg3QzN6v1/3dVsu6+xypceVrsK/bm4QvVRS+VMngRjS2XKi/sLaqABZczpdIkK/E+JnNfIuIsmTTUiujfugYTUxTDFoLGe337OCb8X4NBhTcePGhtxjIm6eZ4fD28IA0T+HtlJe+6uUQ9zTs5EbYbO/VdKN/kPmH5zIAugjKVAhtkA1SKeAxw5OOY3warZKzsDt1Venhjg5jQeQTp7zu9+MVAP2zGpUte3KLjNEyfJ0h4hqOz6EDXhEdT9s/6aesu3g8kFTQVGiRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGHK3CFBqHQOzzYOSzK0SSN9J2qHvcKfEtQbGtzmsak=;
 b=VrZ1wcHTmHJG2rIKgz6Bae4o9+tKTUOBxM23Q0v6ntMXzNewgc03PuojojclA/By32eCHHKs6k9ghrVuQ7/TD1/QcKVLe5/yaPJC63ltyQ9pZaWo+ynYeUf5RkjwXsRv2siJpdynqN+bWX/JA/x0N1lRda54DvuBiTMDASIUjDk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:29 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:29 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:23:53 +0200
Subject: [PATCH 06/20] rust: pin-init: internal: pin_data: self-referential
 drop order checks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-6-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=16883; i=gary@garyguo.net;
 h=from:subject:message-id; bh=p8bINO1e9mnjzqlKH23m+oo0gzrdIrmJvXABbhld7wU=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce705Ks739ZF9kYIfpXYnldbGrVSX2ZUKPgB85R8
 xLqzpmc+NVRysIgxsUgK6bI4tHNmLaJcbbsZa3ylzBzWJlAhjBwcQrARH7tYvgfO6N8kUiKPbdb
 00mFrJbP7jGu6bxF2x8tDts86cVWt9/KDP9Mynp6N037LtyZuVJTyvUSfxHPh+V/o9awZP5WMGh
 4F80JACIOR8Q=
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
X-MS-Office365-Filtering-Correlation-Id: 38085ff3-233e-4be1-454b-08df2537199a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|5023799004|10067099003|56012099006|11062099010|22082099003|18002099003|7136999003|3023799007;
X-Microsoft-Antispam-Message-Info:
	XavTZN0Tpon6enw+lZ2dDwEWCd/0bJ77F7YTAIzS7hSngvC16qFAnyM+y+l/aW9YpqGAfi7Pm3tPDhuOZ/ohlwpmmBxrEIhbLKZdLppN9SORiNTE5bpUKgvqC5/k3r63Ih7HEgodNZ+gO/kP5voY13oEpkG981lwgK2A5YwdBCRvjIjAc48c683GX0PR5n82/2gNnL1PqzUJ4zpBsbw3FY9iWDtMrHxtz06qzm5qweNVZ12c/L29hrJbNx44pmqIrOndI6hLlrQPyg5kZqosZmYEvSyEKueRCgp7ug3QL+3YjkAQssUk1C8oU6Vvysc7xhjqPBT08iPZ25OQYnQohlMd4agzFaBgMHAsyw1NBBIZNSjPZwuzWFXPSkTJcPL04X8aBb7ZbdAwglBa2+dUplhFYKMJjPSZ9TnXjEW6m3zQ90U7wfrRqTr88jfA8bywJpJ9tfocdtrmDqFUUeX9r6O71i6gGAt982tnJ0bsnXISHI+RAXqayqY00Vf+8qSONadB3cyuneszoQv8DtLU3PN9wfXff2EVySwQ1KGjyaZZjjWa/l4ehovSpK81i7nNY6sIEtzZOrZyZNn1ET7FEA7u5hjTUkvHCJrg6lkk3I4vFDj6rr4gLUB2Ku8oj+wvCW2Siln0KRo7gA89r4Hqz/imL8eZc6S8R4VASR7vA6eJYz2Z8zg8rJefMPZ2mx5Kxr72wzWS8MKshIUJgB8u8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(5023799004)(10067099003)(56012099006)(11062099010)(22082099003)(18002099003)(7136999003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekVXQVo1cndVSFBYUW80bi9pKzBrY0dTeGNwMTRWQkJwOGU5VzRPR29RVnZs?=
 =?utf-8?B?K2Q4WFdYdDMzeGdwWEs1ZzF6dzlyT2oxenF5Y2dRTWQxSHJvQ0RzRFY4SjBR?=
 =?utf-8?B?dE9jd1g4Um43SFhMZ0x6YW1OWDV1MitwSk05MDJMTGw4RGZOV296QXViTWxD?=
 =?utf-8?B?YnFPWVJPUTRsYW5NS2ZHc3lJQUNxa1ErQlNteUtaaHZuS1RrcFZEMEJaN1Mz?=
 =?utf-8?B?SGZGTDU2SWM5ZEFaRlBlbUdHK0MrRC8xdmpVTXRiV0pZMGUzU3hHUXYzZVV5?=
 =?utf-8?B?WVJPMnVKVG1DUm9qN3FDZkh4c1RsQkd5aVZWMmFyaGRPOTh2K3U5dTdURjlP?=
 =?utf-8?B?VVdUN2ZXbW1sa0pEbGtyY3dwemhTRzFaWG5XRXN6cVVnUnJIVlpycVl0cEdx?=
 =?utf-8?B?VFQ0WUUzd2lMcFQ2dFNKOW4zMFd0T1diYWRCTy85Mk5Sd2lNWDE2TmcwOGZn?=
 =?utf-8?B?aWhUc01aQzNKTStTZ1kvRzBLbXlicDQzdmJiUUhlSnYvdGhCSWtsNWtjUVMy?=
 =?utf-8?B?dkcvWU9nWFNmWXBGMEVYaUo4TjdOdHhEOExyMnJMOWplRW5OL3JhN2lweXJB?=
 =?utf-8?B?eWVIdVJPT05oK2RXbExQQXdZdExob0dTQjRZL29yUWZPNkZobFJpK1lFOXdt?=
 =?utf-8?B?cTVXYlB4TzJxVFEzSk9aQVNIc2NLVnlqUHVMZzhjOTR0alpEQjZvdzAzVkRi?=
 =?utf-8?B?ZjdCWEROK0s2Qjl4TFdQTWNsMm1KZUtxZGJNdWl1MVNZS3lFSDBFbjdWeEgw?=
 =?utf-8?B?d2RLY2ZWWG4wWmtqYmF2ZWZteUF5eVhxek5IaHlTckpUeUlFa1BESENJa2ZV?=
 =?utf-8?B?WkI1L3o1T0VQOHdhcHBrMGNhVlZYUHFCWHoyWEZGdk55RHozUU1kYTNRRThk?=
 =?utf-8?B?ME92blJqR3RVZUlMdTBldVVHVGNVRUUzbTVRZU9IRGo1T3Rib1ZxMWYrMGh3?=
 =?utf-8?B?YytwOS9NbnZyY3hrTUlJR0g5VXpIV1VlelkyUzRLZEExWkk5TzlhOW1Cb2RX?=
 =?utf-8?B?NW96RG5rYnZ0TWFsalVtSy9yZ2diZjhwMUhyUmkrTGM5NDlnbmpYU0NkbDAz?=
 =?utf-8?B?eWxuOEtqdVRqckp0V3VncTJlbldiN1FXZUdHSG53T282c3pBdGhINnppZ2Yr?=
 =?utf-8?B?V2hKQVkwMlZhRW93dzVnY09pcGlEdUliMDdsc1JYSzBhSFlEbWExQVpCRVQr?=
 =?utf-8?B?VXpWQmdmR3RKL255ZmFsV3ZGYngvR0F6bXVLeGFZVUt2RTVyOUhXZy8vZFFr?=
 =?utf-8?B?QkpKMlo0TU5OczhKZ25hU0dZckt3Y2FGakh4OHN1TEl1c055RFFIK2tXNGpl?=
 =?utf-8?B?K1RCU1NCaXI2TEVxVWJQRXNzd3NPdkdRNXQrcXV0RmtKcGpMMkZ1T216VDRz?=
 =?utf-8?B?dzVGQnZtVWowdWp4djRQMjFNcGhBUlpYM3czelJoWm1QaFZ1dXI4bkVKRXN1?=
 =?utf-8?B?aWpmMkhFWU5QUXVvTTJ3ajQzN3NkYWxRKzRJWm9YUEo2UnZ6N3JURXdZbEdS?=
 =?utf-8?B?K281bWM5aG9VelY3UTNiTHZsQkE4U09yQmNDNEw0ZnlZMjdheFoxWUJjV2Fo?=
 =?utf-8?B?SVluT1l0aTRKd2xBemI3N29ib0ZNV2svL0dHeEk5cWowdzQyM3l6aEFvUjZY?=
 =?utf-8?B?NzZBWUZtdEppSkl0Zm9lVlBhWmpsUStQVU5OWW9mK2dIK1dXWE9aN29XbjFz?=
 =?utf-8?B?MVU5NHdMTEMwaWF3L0Q5cTRoUzJIdm11VWdLeXppMnFsNWV3NWJMalV6VzBq?=
 =?utf-8?B?SldpVUdqamVvNUNkM0ZKY1hUVXE1UFZPTVovTVA5a2gxbisvWU1jLzJaYjd0?=
 =?utf-8?B?WWdvQ2NhVjhnNkd1eU9sNFBWaG8xK2xjeDg1TGcrd202UkVMZ0Fzd20yQ1Ni?=
 =?utf-8?B?OFd3RDgyWExIL0hhbUwxaFlkNHhTYVh2OFFxMVBINmYvblllY2JoQ2ZSR1ZP?=
 =?utf-8?B?Vkd2WGZ0d2pGRjB6d0V5c05SWm9NaVNCVzBkb3llYlFLeFd3bzkyRXpmU3l2?=
 =?utf-8?B?dGNBNkh5R2E3blI2NVNCV0JBY2RBejAveEFicFMyTFZnRDhubWhaejBWSmpB?=
 =?utf-8?B?OWRrclRWNk8vaXB3NjMwbWk5Z0V5MG9aYmg4eFIzMWo4VlRrZlpZc0hHczdN?=
 =?utf-8?B?WU5FaXNhelBucjdHZk9ZWmo2cmhDbWRFVHhFT1NMUjl5TzQ2aVVRaFBqdVI1?=
 =?utf-8?B?L0NqY3VCVWVhdjc5MDFYNnRQVVdJeSthalVWZXRWN3E5UWl4Tis5bk53ODMw?=
 =?utf-8?B?Wkt2QjBNK1p5QlRXTDh2S2gxMHp1dUQrMWJzTm5BKysyWStDckd2c0dsWFQr?=
 =?utf-8?B?ZXZCYUhBdlJuc3lMdkNLWUg4N3lwZVNrK3NYU3ZHdCtyNjVTVUx3UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 38085ff3-233e-4be1-454b-08df2537199a
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:29.3814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucBN0uBZZm0AuHujcbhcsUZz0L69jlkhNbSEm4Sx04W1RTFEMkpBxwBZ3cqwrZ6S6Q39f3H2RDbREe17SFbrzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5471

Check drop order to ensure that usage of lifetime inside self-referential
struct is consistent with the order that the fields will dropped in drop
glue.

First, fields are checked according to their index to ensure that if `a`
borrows from `b`, `b` must outlive `a`. This is simple and produces a very
good diagnostic when misused.

Lifetime bounds can also be indirectly crafted with implied bounds that
make fields well-formed. For example, in this struct

    struct Foo {
        x: &'b &'a (),
        a: String,
        y: PrintOnDrop<&'b str>,
        b: String,
    }

`&'b &'a ()` will imply that `a` outlive `b`, which is inconsistent with
the actual drop order. For this case, create a `__drop_order_check`
function with field lifetimes and outlive relationship of them as generic
parameter, and ask Rust to prove that the types are well-formed inside the
generated function, to ensure that the bad implied bounds cannot happen.

The `__drop_order_check` also need to correlate lifetimes or types captured
by generics and the field lifetimes. Do this by inserting outlive bounds
when a field mentions a specific type or lifetime parameter.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 212 ++++++++++++++++++++++++++++++++-
 rust/pin-init/internal/src/util.rs     |  64 +++++++++-
 2 files changed, 267 insertions(+), 9 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index dc8f530e00fb..8a7a4f6d230a 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -2,8 +2,8 @@
 
 use std::collections::{BTreeMap, BTreeSet};
 
-use proc_macro2::TokenStream;
-use quote::{format_ident, quote, ToTokens};
+use proc_macro2::{Span, TokenStream};
+use quote::{format_ident, quote, quote_spanned, ToTokens};
 use syn::{
     parse::{End, Nothing, Parse},
     parse_quote, parse_quote_spanned,
@@ -11,8 +11,8 @@
     spanned::Spanned,
     visit::Visit,
     visit_mut::VisitMut,
-    Field, Fields, Generics, Ident, Index, Item, ItemStruct, Lifetime, Member, PathSegment, Type,
-    TypePath,
+    Field, Fields, GenericParam, Generics, Ident, Index, Item, ItemStruct, Lifetime, LifetimeParam,
+    Member, PathSegment, Type, TypePath,
 };
 
 use crate::{
@@ -115,14 +115,19 @@ struct FieldInfo {
     pinned: bool,
     borrowed: Option<BorrowedInfo>,
     captures: BTreeSet<Capture>,
+    generic_lt_captures: BTreeSet<Lifetime>,
+    generic_ty_captures: BTreeSet<Ident>,
 }
 
 struct StructInfo {
     args: Args,
     struct_: ItemStruct,
     fields: Vec<FieldInfo>,
+    field_idx_map: BTreeMap<Ident, usize>,
     is_tuple_struct: bool,
     self_referential: bool,
+    /// Field lifetime generics.
+    field_lts: Generics,
 }
 
 pub(crate) fn expand_with_cfg(
@@ -215,6 +220,8 @@ fn expand(
     // Collect all bound lifetimes from generics.
     let bound_lifetimes: BTreeSet<&Lifetime> =
         struct_.generics.lifetimes().map(|x| &x.lifetime).collect();
+    // Collect all type parameters from generics.
+    let type_params: BTreeSet<&Ident> = struct_.generics.type_params().map(|x| &x.ident).collect();
     // Collect all fields.
     let field_idx_map: BTreeMap<Ident, usize> = struct_
         .fields
@@ -248,6 +255,9 @@ fn expand(
             let mut captures = BTreeSet::new();
             let wildcard_variance = Variance::default();
 
+            let mut generic_lt_captures = BTreeSet::new();
+            let mut generic_ty_captures = BTreeSet::new();
+
             // Infer lifetime based on the field referenced.
             // Bound lifetimes from struct generics take priority.
             //
@@ -261,7 +271,12 @@ fn expand(
             // would not be inferred as self-referential because `'a` is already bound by the
             // struct generics.
             Lifetime::visitor(|lt| {
-                if bound_lifetimes.contains(lt) || captures.contains(lt) {
+                if bound_lifetimes.contains(lt) {
+                    generic_lt_captures.insert(lt.clone());
+                    return;
+                }
+
+                if captures.contains(lt) {
                     return;
                 }
 
@@ -284,12 +299,21 @@ fn expand(
                 implicitly_borrowed.insert(capture.lifetime.ident.clone());
             }
 
+            GenericParam::maybe_type_params_visitor(|ident| {
+                if type_params.contains(ident) {
+                    generic_ty_captures.insert(ident.clone());
+                }
+            })
+            .visit_type(&field.ty);
+
             FieldInfo {
                 field,
                 member,
                 pinned,
                 borrowed: None,
                 captures,
+                generic_lt_captures,
+                generic_ty_captures,
             }
         })
         .collect();
@@ -322,6 +346,58 @@ fn expand(
     })
     .visit_generics(&struct_.generics);
 
+    // Create a lifetime parameter for each field.
+    let borrowed_fields: Vec<_> = fields.iter().filter_map(|f| f.borrowed.as_ref()).collect();
+    let mut field_lts = Generics {
+        lt_token: None,
+        params: borrowed_fields
+            .iter()
+            .map(|borrowed| {
+                GenericParam::Lifetime(LifetimeParam {
+                    attrs: Vec::new(),
+                    lifetime: borrowed.lifetime.clone(),
+                    colon_token: None,
+                    bounds: Default::default(),
+                })
+            })
+            .collect(),
+        gt_token: None,
+        where_clause: None,
+    };
+
+    // Insert necessary bounds to make types well-formed.
+    for field in fields.iter() {
+        let Some(borrowed) = &field.borrowed else {
+            continue;
+        };
+        let field_lt = &borrowed.lifetime;
+
+        // For each borrowed field that borrows from other fields, we need to insert outlive bounds.
+        for capture in &field.captures {
+            let lt = &capture.lifetime;
+            field_lts
+                .make_where_clause()
+                .predicates
+                .push(parse_quote!(#lt: #field_lt));
+        }
+
+        // For each borrowed field that references a generic, we also need to insert their outlive
+        // bounds so they can refer to generics.
+        for lt in field.generic_lt_captures.iter() {
+            field_lts
+                .make_where_clause()
+                .predicates
+                .push(parse_quote!(#lt: #field_lt));
+        }
+
+        for ty in field.generic_ty_captures.iter() {
+            field_lts
+                .make_where_clause()
+                .predicates
+                .push(parse_quote!(#ty: #field_lt));
+        }
+    }
+
     struct_.fields = Fields::Unit;
     let info = StructInfo {
         self_referential: fields
@@ -330,7 +406,9 @@ fn expand(
         args,
         struct_,
         fields,
+        field_idx_map,
         is_tuple_struct,
+        field_lts,
     };
 
     for field in &info.fields {
@@ -356,6 +434,7 @@ fn expand(
     let struct_def = generate_struct_def(&info);
     let unpin_impl = generate_unpin_impl(&info);
     let drop_impl = generate_drop_impl(&info);
+    let drop_order_check = generate_drop_order_check(dcx, &info);
     let projections = generate_projections(&info);
     let the_pin_data = generate_the_pin_data(&info);
 
@@ -364,6 +443,7 @@ fn expand(
         // We put the rest into this const item, because it then will not be accessible to anything
         // outside.
         const _: () = {
+            #drop_order_check
             #projections
             #the_pin_data
             #unpin_impl
@@ -568,6 +648,128 @@ impl #impl_generics
     }
 }
 
+fn generate_drop_order_check(dcx: &mut DiagCtxt, info: &StructInfo) -> TokenStream {
+    let ItemStruct {
+        ident: struct_name,
+        generics,
+        ..
+    } = &info.struct_;
+
+    // If the struct is not self-referential then we can just skip.
+    if !info.self_referential {
+        return quote!();
+    }
+
+    // Make sure fields are dropped earlier than the fields that they borrow.
+    for (i, field) in info.fields.iter().enumerate() {
+        let ident = field.member.as_ident();
+        for capture in &field.captures {
+            let borrowed_field = &capture.lifetime.ident;
+
+            if let Some(&borrowed_idx) = info.field_idx_map.get(borrowed_field) {
+                if i == borrowed_idx {
+                    // We need a strict outlive relationship, in case the lifetime is needed by the
+                    // field's drop glue.
+                    dcx.error(
+                        borrowed_field,
+                        format!("field `{ident}` cannot borrow from itself"),
+                    );
+                } else if i > borrowed_idx {
+                    dcx.error(
+                        borrowed_field,
+                        format!("field `{ident}` borrows `{borrowed_field}`, but drops later"),
+                    );
+                }
+            }
+        }
+    }
+
+    // The check above is necessary, but not sufficient.
+    //
+    // Consider this case:
+    // ```
+    // struct Foo {
+    //     x: &'b &'a (),
+    //     a: String,
+    //     y: PrintOnDrop<&'b str>,
+    //     b: String,
+    // }
+    // ```
+    // we need to ensure that `b` will strictly outlive `a`.
+    //
+    // Rust needs to ensure that types are well-formed; in the above example, `&'b &'a ()` is
+    // well-formed only if `a` outlive `b`. To avoid requiring everyone from having to express this
+    // bound explicitly when declaring a struct, the `'b: 'a` bound is inferred by the Rust
+    // compiler. However this causes an issue, where now `&'a str` can be coerced to `&'b str`
+    // because compiler thinks that it shorten the lifetime. We'll be able to put a reference to `a`
+    // into `y`; but `a` drops first, so when `y` drops, it accesses `a` and causes a
+    // use-after-free!
+    //
+    // Therefore, we must ensure the types contained within the struct has their implied bound being
+    // consistent with the actual lifetime relationship. We create a `__drop_order_check` function,
+    // with known lifetime bounds as bounds on the function, and asks Rust to *prove* that the types
+    // are wellformed, given the bounds that we understand.
+
+    let generics_with_field_lt = CombinedGenerics(vec![&info.field_lts, generics]);
+
+    let (_, ty_generics, _) = generics.split_for_impl();
+    let (impl_generics_with_field_lt, _, whr_with_field_lt) =
+        generics_with_field_lt.split_for_impl();
+
+    // Prove the wellformedness of struct fields with regarding to the bounds of
+    // `__drop_order_check`.
+    //
+    // Consider this case:
+    // ```
+    // struct Foo {
+    //     x: &'b &'a (),
+    //     a: String,
+    //     y: PrintOnDrop<&'b str>,
+    //     b: String,
+    // }
+    // ```
+    // we need to ensure that `b` will strictly outlive `a`.
+    //
+    // Rust needs to ensure that types are well-formed; in the above example, `&'b &'a ()` is
+    // well-formed only if `a` outlive `b`. To avoid requiring everyone from having to express this
+    // bound explicitly when declaring a struct, the `'b: 'a` bound is inferred by the Rust
+    // compiler. However this causes an issue, where now `&'a str` can be coerced to `&'b str`
+    // because compiler thinks that it shorten the lifetime. We'll be able to put a reference to `a`
+    // into `y`; but `a` drops first, so when `y` drops, it accesses `a` and causes a
+    // use-after-free!
+    //
+    // Rust needs to *prove* the wellformedness of the type below, taking into account only the
+    // explicitly defined bounds plus the bounds implied by the lifetime-erased struct (but not
+    // the full implied bound between the field lifetimes).
+    let wf_proofs = info.fields.iter().rev().map(|f| {
+        let ty = &f.field.ty;
+        let ident = f.member.as_ident();
+        if let Some(borrowed) = &f.borrowed {
+            let lt = &borrowed.lifetime;
+            quote!(
+                let #ident: &#lt mut #ty = loop {};
+            )
+        } else {
+            quote!(
+                let #ident: #ty = loop {};
+            )
+        }
+    });
+
+    let struct_span = struct_name.span().resolved_at(Span::mixed_site());
+    quote_spanned! {struct_span =>
+        #[allow(non_snake_case, unused)]
+        fn __drop_order_check #impl_generics_with_field_lt (
+            // This must be present so the function can *assume* the implied bounds on the erased
+            // struct. For example, if the struct has `&'a T`, Rust will infer `T: 'a`; we still
+            // want to assume these bounds as they are not relevant to the field lifetimes.
+            _: &#struct_name #ty_generics,
+        ) #whr_with_field_lt {
+            #(#wf_proofs)*
+        }
+    }
+}
+
 fn generate_projections(info: &StructInfo) -> TokenStream {
     let ItemStruct {
         vis,
diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
index 67ebb333710f..3dc72e162e1e 100644
--- a/rust/pin-init/internal/src/util.rs
+++ b/rust/pin-init/internal/src/util.rs
@@ -5,7 +5,8 @@
 use proc_macro2::{Ident, TokenStream};
 use quote::{format_ident, ToTokens};
 use syn::{
-    visit::Visit, Attribute, BoundLifetimes, GenericParam, Generics, Index, Lifetime, Member, Token,
+    visit::Visit, Attribute, BoundLifetimes, GenericParam, Generics, Index, Lifetime, Member,
+    Token, TypePath,
 };
 
 use crate::DiagCtxt;
@@ -85,6 +86,7 @@ fn display_name(&self) -> String {
 pub(crate) struct CombinedGenerics<'a>(pub(crate) Vec<&'a Generics>);
 pub(crate) struct CombinedImplGenerics<'a>(&'a CombinedGenerics<'a>);
 pub(crate) struct CombinedTypeGenerics<'a>(&'a CombinedGenerics<'a>);
+pub(crate) struct CombinedWhereClauses<'a>(&'a CombinedGenerics<'a>);
 
 impl CombinedGenerics<'_> {
     pub(crate) fn split_for_impl(
@@ -92,10 +94,13 @@ pub(crate) fn split_for_impl(
     ) -> (
         CombinedImplGenerics<'_>,
         CombinedTypeGenerics<'_>,
-        // A stub type so `split_for_impl` signature matches that of `syn`'s.
-        impl Sized,
+        CombinedWhereClauses<'_>,
     ) {
-        (CombinedImplGenerics(self), CombinedTypeGenerics(self), ())
+        (
+            CombinedImplGenerics(self),
+            CombinedTypeGenerics(self),
+            CombinedWhereClauses(self),
+        )
     }
 }
 
@@ -242,6 +247,31 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
     }
 }
 
+impl ToTokens for CombinedWhereClauses<'_> {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        self.0
+             .0
+            .iter()
+            .filter_map(|x| Some(x.where_clause.as_ref()?.where_token))
+            .next_back()
+            .unwrap_or_default()
+            .to_tokens(tokens);
+
+        let comma: Token![,] = Default::default();
+
+        for generics in self.0 .0.iter() {
+            let Some(where_clause) = &generics.where_clause else {
+                continue;
+            };
+
+            where_clause.predicates.to_tokens(tokens);
+            if !where_clause.predicates.empty_or_trailing() {
+                comma.to_tokens(tokens);
+            }
+        }
+    }
+}
+
 pub(crate) trait LifetimeExt {
     /// Get a visitor that call the provided function for all unbound lifetimes.
     fn visitor<'a>(f: impl FnMut(&'a Lifetime)) -> impl Visit<'a>;
@@ -329,3 +359,29 @@ fn visit_type_bare_fn(&mut self, bare_fn: &'a syn::TypeBareFn) {
         });
     }
 }
+
+pub(crate) trait GenericParamExt {
+    fn maybe_type_params_visitor<'a>(f: impl FnMut(&'a Ident)) -> impl Visit<'a>;
+}
+
+impl GenericParamExt for GenericParam {
+    fn maybe_type_params_visitor<'a>(f: impl FnMut(&'a Ident)) -> impl Visit<'a> {
+        struct TypeParamVisitor<F>(F);
+
+        impl<'a, F> Visit<'a> for TypeParamVisitor<F>
+        where
+            F: FnMut(&'a Ident),
+        {
+            fn visit_type_path(&mut self, ty: &'a TypePath) {
+                if ty.qself.is_none() {
+                    if let Some(ident) = ty.path.get_ident() {
+                        (self.0)(ident);
+                    }
+                }
+                syn::visit::visit_type_path(self, ty);
+            }
+        }
+
+        TypeParamVisitor(f)
+    }
+}

-- 
2.54.0

