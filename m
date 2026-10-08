Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020109.outbound.protection.outlook.com [52.101.195.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68A349DBAA;
	Thu,  8 Oct 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462324; cv=fail; b=Wef6DPfEpIgf8L5o5Jx6JNyFJAPPcLWZZM51OdY8Dx6zTP7RAF5BpRJn46k5b6amaAZG0rUoxz/hcEgydWnc2Opec5U5Q6ba5E38IEDB6meOkd4a6XUqqPkJ0sbhIdAeQPow+HRB97ago78VHGTTcXpdCDrBzFoeKyraRWvf12U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462324; c=relaxed/simple;
	bh=IeRWjFLn4CMWHBPBwEDQIsgMSbkTXhCSI95TYI0Zg/0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JqOoQaofMKXqFynbbTPH3e2yCwCaOIcqUU+6/y+Zo3Dtb6/c/TCfGE4c/rCLujOunJkzKqBi+1wYVOyyCT+l3vF1HHbDniKRLQn3v8duYUXUVBRwG9PaZ/90jMsj/eJcF70uASzICvZWUHAIA3RrPe+ADDF1uLaW4TdgPgiJ9Fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Pxg4LLHD; arc=fail smtp.client-ip=52.101.195.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Pxg4LLHD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Px8AoQRwngnJraAJzpY3UAVqeYsE7EZb5ccLlRAV+8zk00XFlcDWRI/9ZnAYBUoP2vbEleuDN7L/6npbdx8+Gt+anY5I+M7+0DTd7xwP1XGlqjae+jSpBjAHRqkNqUgexT0gx8KaNvTQE4+Ds5L7hp2s3WY7gBCQFBPGYekJZq4dHlHjKAjP/5m9ALBqpAzhSXKFacnJHiMm4ADgMEkEf7ImwuKEXvjquyTGEXmiBiKjVUaTxYWnD93CRhxKp215NSHz1Bwuv1x0mLcZ77u+sVdOq6zhJMEH9Oe5H7nFfyrFNrU63a3N7z85/wixh1hty1nSbSS0+jUcYzcHW6X2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/47BreHUIZLMrt3S3h7HN4VDw5j95WD0t3OR1NAu9j8=;
 b=yAFOVoa44we8yRkGuso6JusUFVP+jEToGEMJM58j4uTAy9cYR41WM0uHhGOieAEpIm8TJIqepo6nXLHP+djq21T3tGXzN7AH1peoYTCOPmpNLE0Ndv2DvYjwS6UXQkhYI+224pKC3K5GR1sIpdDkVRdZvipADI3n99TKE/wGefL2ke1nRitOZUFWW/lSl0hMzMy//0KQjuL1kxB8QcQBV2IpzKru7Kxv/8uRFVsivWu2TGndju5ia/zSz7X6bFvS590+gcQLzWqohT/0Dwk+BptmzT3Vh2i31SN790MfNukC1ECTFj+8bNk9VZNRJkE8mklhRftCthy44WC6k/Nt4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/47BreHUIZLMrt3S3h7HN4VDw5j95WD0t3OR1NAu9j8=;
 b=Pxg4LLHDV59F6Xa1rADqBEOJzSs2TyhOtRyd/CdtX1+5jW8aK+GS5dA9watUhR6IOSFxYo/A0Nm6a6yFGVCwkgwGUdA3Qr03m7UEA3tIospqVeRrQfbAxURRld91lyhqjrn9MOomMrxJBYUPRgoPsrtlB0I3bZE4+YCmEERX5Q0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO6P265MB7245.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:343::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:25:12 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:25:11 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:24:07 +0200
Subject: [PATCH 20/20] rust: pin-init: internal: pin_data: support
 existential lifetimes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-20-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18548; i=gary@garyguo.net;
 h=from:subject:message-id; bh=IeRWjFLn4CMWHBPBwEDQIsgMSbkTXhCSI95TYI0Zg/0=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce7M9UqPFrOTV5gpzZZtoJnW8b23jWVzI86hSVy5
 dZqzTqn3dRRysIgxsUgK6bI4tHNmLaJcbbsZa3ylzBzWJlAhjBwcQrARKYXMzKszhA8bKNz6jmP
 061LLhe3H2BIXPd3deyHuB2B2w79OpcRy8jQvkLuu+q3azzXg/72/lwvn7jMmr9wxf0P0RpnvLl
 CXqXxAgBS6Ee1
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
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO6P265MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 962a85cd-b308-4e61-4412-08df25373255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|921020|56012099006|5023799004|18002099003|10067099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BLP7hwKl0HqNE+cNCllR+4oCXOyvLws/Wc3CuT5JuhbwdVM0XUND90MJ3SAz7AJH3vPzUG4qG9CpKpoburhpGvPYaRslQTj5uIdtebH/FdZqYp9/0mFY+L/w67Av6ye1TMladQAE7WPtNpW8NXK6CSXpvpHPmCFGiCmXVuH723yoUHJpbi5QIa6lZaNqF8JW8Mm2mvAwBQ0u3s7xvii+1rlx+3ypVfPncQG9HVUb3sAyTJ8gKx2JDA4OVNIVITf+NyvkvP+Jry9fdnWZLUhzcw3eXahLMYvbDpG1sNVqcuXG6SquNnJLXMzgHgh3oMaafA4162BKHuIpR1VVheaZERvWK8ijuGw6/tFZCrdGQQF3vMK1phvfzfDfP4aKueTSUbIE7IsYe3Qg3P9fBS+CDnVV+kc5tIsD0Lc5Pe+wSaKdFdwlJkDzytdmigATdtjrH4OMGvXS8J4sDQhF3qFNP/ErgnUv9eTt4utoMAU2XJFsWTf3QIwUQYZjLD+K+Q/IX/PyM2T53KfwfyepA6KXcM3bmAuc+556RlM4a5+PvBzkDdxPLWe0peyvW4R5Rmh01PK1UOKuI2OWsmyTp1GfajLMSdRFvr2L2Hx/XMtyu/tIJ9URW6Y5W3sdIjKWTvDsSugQAGDMom8Lu/mJpSiqCYxbiuCC5/+biZsEPUy15ddHvm6nXAh/tk50S2L1GSue8BQT7JClXEPYAyT5C4iing==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(921020)(56012099006)(5023799004)(18002099003)(10067099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b004eXZnaTd0OUtieHppQnpRQkY2aENTdDB1aUpaTVBwUkVmd3RsdUZwKzhP?=
 =?utf-8?B?aTVDZ1F6Z1RaQ3Y5Z2p4VzdsTk9YRmhxcXdBeTB6c1NOTERoRVF3MUlYYTdo?=
 =?utf-8?B?dGZETWxZWlFwbTgvcHRaT1FnWkU2dW5Ob3BmVGhtWThhZUk0cFAvL0g2Q1pD?=
 =?utf-8?B?SFRLaStuQWJLSGpCUTJrTkZSeTNJOExNVjY3WmNua295QXllSFZWd09oV3pH?=
 =?utf-8?B?WXFtY2FZaFR6RUxUSWFndUpSa09LQUkzT1I3UTBFejE1WGllS253YVY5cFlX?=
 =?utf-8?B?YjBLK2ZtQjZLcVNiS01FaUlsbmhJbEV6aDhydi8yTzlJL1NqeE5FV3hodEIy?=
 =?utf-8?B?SE4wd3dldkdWeE1JVnBvVXRWSUIxNkxHTThob1dsSXVTa2VoTzJsZjd1TjhI?=
 =?utf-8?B?SHM0YVF5dStHeUxleWZnVUtKUEU2dzFPR0cxNm5OWEZzWnpKOHBrSER0VjhT?=
 =?utf-8?B?T3R5T0l3QkVQZ1NhQ09MaVpFaGxROTN3cUFNQ3dhaHZGajFoOHk4dkt0NTlu?=
 =?utf-8?B?UkZacS8zcmgwNnlSTFBtRnRCSmdjNHlrenFmMzFkcUFKY1k1MWhUcTh6Q0Zm?=
 =?utf-8?B?T2s5Y3V5b3lDR2dhcS9keUZTc2ZIbGd6MDFoOHdpVE5ERjdFY3NRcFk0b0ht?=
 =?utf-8?B?WU5kdldveDNQVjlEOFJKWUhrREZZOHB5OGFlcXd5YVBpb2Fab2tqc0hFUGZ6?=
 =?utf-8?B?b3ZtM01yaTAxc2VvTDZPL2NEUHVMSXFrVEZ3Y3lhWE5menBpWlc4RHpwZTRI?=
 =?utf-8?B?ZHNBbG9LaDF5ODNIaVRTMmdUSFJXRnRDL29GL01VYTdPbW1ncHIwRWtVR0tR?=
 =?utf-8?B?SWRUZEsvSGNxTDlaa242MjZsbWJBWExNVjlJZ0NHdW4vY2lVejBJeXRPMXRk?=
 =?utf-8?B?akhpenkrZHZ6YkU1clhzOUsxQmsxNlA4Um9qZkxMeDJiaHlTUkVuUG4rV3Fw?=
 =?utf-8?B?dEFSZkVRN2t3NkNtRzJGYkdSU1dkcklpUXFMbldUT0UxSTF3TFhUUXJzRWRP?=
 =?utf-8?B?eGFUNE1HdWs5UXhVUWVrcDRlVWR3bC85bEJ1V1BBYlpsakJnNXpQY05HaElB?=
 =?utf-8?B?SmtESXJ5VlBmRWk5R0d3aG02ZDhhbEJVNjh5MFNjRTZsNE04dVRiMmFIMlBj?=
 =?utf-8?B?RHE4YkpKd0graE9oSUtTUSsyYkZjc1FGR3FxWGw4eGJ4TUpLSUhXdlBjamhs?=
 =?utf-8?B?MG4zSzB3SVNLRDJVZmZxRi9QR0dpS2xKWmpHMzNlWGlldWU4cUJ3YXlSb1Z4?=
 =?utf-8?B?MHRGcmNDY3pZU2FjaXl0MXovMGdxb1BjUUQyUTdEdHE4N1FNL2pJck9TblZF?=
 =?utf-8?B?MzFBQ3R2NmlCWHlPVllzcGtMaTFhVXVHbHdoaGZQUkxKK0RzcEJWb0lFWVlG?=
 =?utf-8?B?QmoyMGdCUDl2UW1yRkhPOGJqZnA1QlVUR2tlKzNiazBmbThuSDlBTFkwOStu?=
 =?utf-8?B?YVN0aDJtSG5qWFRvbFdadjJtYTljRjhQOS9zTVRGQllMaXZNWWtKOVlteFo5?=
 =?utf-8?B?YmJQeHRpNUJFMms1STFaOEdRcmRzcjNYYTllaWdqZVFMY01haTJTbytteFd1?=
 =?utf-8?B?OHBYNVJLVnFLa09rZnJuU3FBdmdyZjd5dkcwbnkzZDRHMSttc1dVSjlRMk56?=
 =?utf-8?B?c3RoQThuWjNPQ2hOUE13U2lqS0oveFJMYUJzcU1wYU5peUdoMEF1dHV5WmV0?=
 =?utf-8?B?UUVoL3k2WFFpU2E2NWNPYVJqZUlPcnRHZS9LVEV2UDV0TlpiR01xZ0FwS1l3?=
 =?utf-8?B?dFdzYWY3c3IzUEI3UWI1U0FHb29RdFdsTGovRzRmWkluREVEZG5HSlQybTUr?=
 =?utf-8?B?eWNaaW5BSURpWmNydGtNTHAxZDZVQStRRVh4QkxwOTIyWGorTTVibHNnTkFa?=
 =?utf-8?B?NjlYd2JkSmFIcHNqazB2bkp3Q1A3M1U5RnNHWmNiT2VJL2tTKzQvYkJMY2VV?=
 =?utf-8?B?QUlvRjFpcmVXRVZuM1NkNW9EQUFGamNvQ0I2ajEzbGtJMXZjZDN0YXNKTHV2?=
 =?utf-8?B?UHRsVFNNMVoyM0JLWnJkWWN1Q05zL0I4WjVoSVRoRGsrOS84M1FqVWF5Q0JY?=
 =?utf-8?B?a1N5OW41RHJBbVczclJQQmhsT2xXb0JxKzZtNGQxK2M3dnBEZGd0dWp1eUg3?=
 =?utf-8?B?azZDZ3ZlVzlxaHZwY1M4V3lhSzJWajFwUjdYc1dTWHpIakVVRnlKT0w4L0Zk?=
 =?utf-8?B?ZGR5VG1KbU93N0tQV2xFUmsvblZVcEVpVlprMjRzcmQzZ0hPZ1VUeWEwNDAr?=
 =?utf-8?B?ZDgxOUFrYjc1R0hGRHBqUk12VXJxaGk3a054bmJEK0xoSThEWHhNeFRrNEtR?=
 =?utf-8?B?cGd2S1lRc1JPVWwxWEhqQTk3S0JuYlpSaEZDamlsOSthS1piTm9SUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 962a85cd-b308-4e61-4412-08df25373255
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:25:10.9505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1m9EBpdu37F4eEkAK3OigVpQfkwkYj9T/dlSpb2v12zPa673ZprGnymhlR9HoPUQbz+uPA9vrIA+EoNEjLUAVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7245

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
index f7dc76849ce3..0058b5dc5dd2 100644
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
             // implementation and thus may be used inside `Erased`.
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
@@ -1142,20 +1346,25 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
 
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
@@ -1663,10 +1872,19 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
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
 
@@ -1776,6 +1994,7 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
         })
         .collect::<TokenStream>();
 
+    let exist_lt_generics_params = info.exist_lts_generics.params.iter();
     quote! {
         // We declare this struct which will host all of the projection function for our type.
         #[doc(hidden)]
@@ -1831,7 +2050,7 @@ impl #impl_generics __ThePinData #ty_generics
         {
             /// Type inference helper function.
             #[inline(always)]
-            #vis fn __make_closure<__F, __E>(self, f: __F) -> __F
+            #vis fn __make_closure<#(#exist_lt_generics_params,)* __F, __E>(self, f: __F) -> __F
             where
                 __F: for #field_lt_ty_generics ::core::ops::FnOnce(
                     *mut #struct_name #ty_generics,
@@ -1842,7 +2061,9 @@ impl #impl_generics __ThePinData #ty_generics
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
index f548f59b9b74..cd406d72f346 100644
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

