Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021088.outbound.protection.outlook.com [52.101.95.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3694F4CEA;
	Thu,  8 Oct 2026 19:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487617; cv=fail; b=aGvSyh8FAIqZp0hsscpjC0rA02jWhxgr+eD0kNo3j5wUO8SbXIFOXsWLkLGRbwfyZuCOCrJ7hX2FQ6bZPvEDYgIuNjYQIB863nIS18TBkeFy+CJIWucYeeuUCrHFUk0xT6T5hAuoCIay8c+HZ2TldqL/jb/L7RWBTv+GCsXDLcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487617; c=relaxed/simple;
	bh=6UeVs9A9Q2909oMJgmiq26eWIUegPZMy6HumAbvttwM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lhab0+jyV+rNuxQBXP81qUvR9mjCcnjW7lRxC6RaHGRf+MRFspmFg4uz3U/7Nr9UY4ORTgQ1fzSJjWmLJbME2HaQA8iiEGv26KcUGOjb1yD1D1B8qs629woReem88nKhsoBCT00enNCLZz8HdeSgBiMjaX9WYgWm/9jErI/C6Rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Kv8AVq6/; arc=fail smtp.client-ip=52.101.95.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Kv8AVq6/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dN/uw0CIvSMkK74GHl6uJCQiwwXewTLE+Hn5N5H4l5ZUscAfYIIK6XpnJ7TXhU0twDQQjTIJYJioJIoT3cIMMI128ZaXs0KjgGhC9Hlz2yLKo8HGGErFgQEJ+DzysEW3Mzaey1ddfWgmfk2V9jQYM/OGTEKlW3Xg8pWDopG0+eShtDGiHCauCVBxRfAQ9epqBlpk6qa9rAcr5cWTZOe1agpd+/D9Jj11wTLJn0uD8y3hK2NasX3KNifI5CxxVcj6uzP2L3uLaxwizTH7ylnDVV7lUCxoiBCU0z4QNb2BLfUeLrxJJyOJT4QswY/9adF07vgZB07q99kumpVOolYkDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIfZHaQmI+DO4oagHtVOsqyX/TQ5m8fI1TFgaZ23O6o=;
 b=ssT6sgLfK2w4RFhGFRl5sBKzx+W7UjA4F1/ATsjPrnAZvG4ccWYtI6VyttR1gPTNqB146+qjfXwPdx4//AFudIra9LGAAC4w9MD88155oQsBgQOyDpA74Yc84NGgNxdNaBq1+lDpvlNEQQ3VQSWTdXFFA8UdRsRuxZC3YKQ2Um2+ZlxVMzIgu6e6szXQ86eVz2MRmD9/0oW4Xxcezx2Gt3dqlXKL0VT4EySBUNYoyciAd8gUbfiWnK1Z/5E03gdGY7XdG5MhrCcYfjm4CGP1qGhg68U2UBcMlYcseTOFwposSrdshzPMpkkFJLQJ21fwDXLUt+fWsIbrgewIQqoBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIfZHaQmI+DO4oagHtVOsqyX/TQ5m8fI1TFgaZ23O6o=;
 b=Kv8AVq6/x1o4DYoyait5wwMHfAumgcSllOsBYAbVRnNxjb5heGpKDoinuMxTjBj7WRUByhxgYahij/5MwMv4UyngbsEEzKJfnk81ol+qD/5VoEMqel54443Y+bIln4tgwO5fencowKNL2RCLgsFSsSajKd5nUt274e5E8haaQpk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:43 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:43 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:26 +0100
Subject: [PATCH v2 02/20] rust: pin-init: internal: pin_data: infer
 self-referential struct
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-2-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10806; i=gary@garyguo.net;
 h=from:subject:message-id; bh=6UeVs9A9Q2909oMJgmiq26eWIUegPZMy6HumAbvttwM=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcff5R0oW7gkxma7wDNGxzOXLOa26L3l9vFxtbZ4q
 HrxJIPsQvmOUhYGMS4GWTFFFo9uxrRNjLNlL2uVv4SZw8oEMoSBi1MAJtK9mpHhrZbhlnnP/3wP
 sFnoebfsV3lkicGhR3uTDuyu+Xa6bM6uGoY/3IorZRyXPdp+dscptqBaFeFykZ7YDkFfzRNbZ69
 ek+XDBQAxv0ir
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
X-MS-Office365-Filtering-Correlation-Id: e0e86c74-ceae-42af-40e5-08df257215b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|18002099003|10067099003|22082099003|3023799007|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	yhFPpTMGQX/tuCytioOvYP6FrNCUvOAkf7L+z/cfI8ocAj4M/EFO80/F/i9XruaJRs5YtGa7AQz/ZlQv/mquoBAc1Tfh8arAE3ZMfGAyS2Ov5FUiTwSxBzulH6LS2TxAqdR7o326brO43V/2uQ+uRNhUj31aqBOwI2pKHaOuhHICfsgFk3vT3uhpAH2aVhFxqNqnU3aOU/kThtrSXs5LkwiU3pl7FnIxKAKYwSQnaFfVMCLmBWeEiK0/ICu+qJqL/MOp6AwDfDpAakYSzOJJIdkHlODjQbdTQNGz6/Au8AUFmTmigG54pSFxDvf43vd8m7826t3tsVuWFUlsvnxM5F0YmOL0P2eHp8aCOr55FJ1lwDaxNyFUED8CzPgUaeWFT6QG/i4BzNrEJK5L9iUks/qvO1ZBCpctV6ylBMJOU5BBaaIbvH5DYBp7iYNP9kvxuQtevfLoNRgUmVs6fHGlNWfDpLfVX44QKdHLybtHU45XIpHbPzGcoUThIUCH8z2hJSG9J1o+vKfQtP3e0lLj0D7FAXFZNtsm6eKiPATvnVbkYhAiLf9bsVZ+357SMAWtiKBZzHXBSBcLim37QmAqKPctChsB+BZx9iegEjWQjJBoZa4SB6+KWhUTVeIXUUtQf/RclH8kif84N9KdOahygF05piwgeKK+SQPCq0DzxQGqB9I2w6BWTUQtC2FXKtfaVTxjsbQQPuZa2HEkMv012A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(18002099003)(10067099003)(22082099003)(3023799007)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cko2RDhOVTA3c1prNkQxMnNURXdhQ0NzOTlQVG9rZUdNMCtzeE5rVkhqSGVY?=
 =?utf-8?B?OUU2UzkrVExoNWl1UWVyWndPZWxMMUJJTUpJRTFTc3FVaFZ2emc4RmRGSkg2?=
 =?utf-8?B?blE3VWdCcUU3VGQrZVpXZ3VYU3NjVHh6c0MvT0k5alMvVUNUUFBqOGQyalJM?=
 =?utf-8?B?NmVCcnI2bDVMVlU4MUFjVU1XcTM3TDgyOFAyczhaZkZGc1BGckg3b1d0VzB3?=
 =?utf-8?B?K3cycldiWld2YmJpSkpPMy9SaFFYdjJ3aC9WVVZUREhkLzRiYjAvd29sYzZw?=
 =?utf-8?B?SlFtVFdFbDFHMnkxY1VlQ0VKOVRLVW5xaGpKUk9vVWhWcHJST0lXRkF0YXhV?=
 =?utf-8?B?ZmU1NC8yMTF6d0pLQ3NMUW9FZWo1YnBZcU9UNGJYRzJQamdZQ3lnWThGWHBG?=
 =?utf-8?B?Kzg5RHZxRUFZR1Z2NG5VK2pyTkxFWWtIV2szQU9FU3NQZmx5TDRRYkxKWHR2?=
 =?utf-8?B?SCtWVDdWdW1ZVzFqVXdJeTdsTDdTSzJ4cTJzRE8vYlZGb0luT1FiMFRDQVI2?=
 =?utf-8?B?MnUwWWxPY3RZUTdXeTExWEV5enpYM3dmWHloZjBzcW91aml0SnhaMUZLRWN0?=
 =?utf-8?B?WmtrUXVSeVZ0UEoxcHlrTUVDbEVrZjM3QlVSK3V2S25JMGlGTHVKU29PNE1i?=
 =?utf-8?B?dTNXakpIRVRpeWd1QnFlS0ExVjZUTitiU3VkOXJCTlJ1WFc1cGcxQmV2NnEz?=
 =?utf-8?B?aVlOem1MRTQzNjFoQ1kyQjcrTSthZnk2akp5dWliTVk2R2hWT3Y3NDRqenE5?=
 =?utf-8?B?bXJtNlE3Zy9rK1JpWVF5aDhoRldoTDMyZ0U4YktmdFFtbldBZnNuSnRlQnYy?=
 =?utf-8?B?L2JJd3U2MmsxUXZUUzUxQWlkSUdiYVpxNmg3RFZqc1VoNm40aFQxNWtjZmtw?=
 =?utf-8?B?MGRobDRiZklwSkVCNXc5OHgxZVRxclBuN21PRzFPWGZWUGVCT2QzU0tSM3Vk?=
 =?utf-8?B?c3hYT3V4cnNJd1lNUUdaR1hpMDhkVk9BZVpMb2lMRk4xajZURnBKN0x6TU9C?=
 =?utf-8?B?dWpzcFU5YjFsTXRqM1k5TWNWTDNmNGh2Yk05VEh6VTVmaEcxdDM0YVhkTUl3?=
 =?utf-8?B?VVFMUXlkQzYxYWtTTXV0Wk9PZ3ZzNzZBb01NdEtzRTJEajdEcW4xWXhnajRR?=
 =?utf-8?B?cWMvbGFiL0xYaUNSYU1xR2srck1OUUdEa2RzNFdkem9QaGxkS2tHc2hxSXN6?=
 =?utf-8?B?NzlsMlVXTER6U0lSUU5OVzJjY1puSlFHOXBuSDhpd1pFVEJXeXFuaVVscXNQ?=
 =?utf-8?B?RVFlbFZJRE1YUFFidzNYN21laGlKUnhBL3BNNTZYQStML3JMYU5GN3dSVHFB?=
 =?utf-8?B?NW1uSmpEMkN3SktOMFBCMllVZDZuOEZrS3VoZnV5NHFlY09yYjRuVkZmOVZV?=
 =?utf-8?B?SFkxRzRZYkg5dk5hWmt0MDgzaGQ4WTRVa2hSVTdaRU1UWDFBYUhCdmk4MFNz?=
 =?utf-8?B?TS9zZXg2T0ltbjVlU1VIemxpTXlxRlFVTjRmNkE2VlROMWZKZ1dkVyswM3VV?=
 =?utf-8?B?ZUNqM2l5M3FBa1dmMmIrNkxIM1M5QXBsLys2ODdRd0Q3ODQxeEVqY25YanR4?=
 =?utf-8?B?eUw4U0QxYVhVTWVqVkJBZWlrRytFT1RTYzVZY3M0SERaMXZ4TEM2K2NGSm5S?=
 =?utf-8?B?eThGQ0tkWWN6TndqUTdxOUNNWG1La0RRMnI5Tkgyb0NaOGg1OTVvc0F2Qm5w?=
 =?utf-8?B?QVlySWlTZXltWGZ5U0dKWDl2UmdRNlBpWHN4VTZuVG1xQ3NST091QWZ3dTBF?=
 =?utf-8?B?bVlXeXBvbHVmbjZwQmNLdTk5MStEUlVFcmFja20yMURVSncrOElybmVwZ2sr?=
 =?utf-8?B?aERJUXprUllPaVFWMXZvYnJwQVhlM2dTZnhkSWFWU2FFNGZGcUx5dkY2L1gy?=
 =?utf-8?B?eUdTdklodDdlTGQ1dDNwT3g1Sk8rd1EwMDhUZ1hWYzFCb2xzT3FTS2tLMHBG?=
 =?utf-8?B?eXZzSDRDOWpubThWZ3BGY3N4SWZuOXJmQyt4aGdZbEdrTkc0d09UNGtJNXdm?=
 =?utf-8?B?SXF1L3VvdHpGWGYzZXczMit2bGp5djAzbExOcC9JOEx5UzQ3bzlGclRzN3Jy?=
 =?utf-8?B?ZGNtaGU2WlB4SExBUEVta0tUVGFhY2JCNmlKbWxQMVNraUY3WEwwUzhzR1FV?=
 =?utf-8?B?cWRWL1k3Q0t0ckkvWGdRN3BReGlETUpyWmQzeXcvaHp5NXZHK0p2VjlkMmFO?=
 =?utf-8?B?U21oNlo3ZjIyU0VSR0d2bEV3azdCSW5uV2dSOHExaE9SL0k2SmNwekxTTzdB?=
 =?utf-8?B?K1V0U3hhUnNJRVVqYlo3NjlUb0RFcnNCcTlISTE5NzA5M3VSUGJMVFd0UWp2?=
 =?utf-8?B?ZzJqVjRHcHhIT1pVcW5zWWIzM1ZrSUFEUElPNytvbDZlTlF0UERRdjlWSWVN?=
 =?utf-8?Q?kE/F/yeztsvhjVNkxd2ygKk+w2skCC65dIdhx0R0SVzm1?=
X-MS-Exchange-AntiSpam-MessageData-1: W7zDoNjons1sCQ==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e86c74-ceae-42af-40e5-08df257215b3
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:43.1365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMEisVhKpIqwPhl2bAyTIUZs+fEBKbSs7f11faBUIY5j2MWRDn/w0CRWbsitudXwypNekP+accwwFt2IV53vCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

As a first step towards adding self-referential data structures in
pin-init, add parsing support.

Scan all field types for unbounded lifetimes, and if the names that of
fields, it is inferred as a self-referential field lifetime. No explicit
annotations are supported yet.

Acked-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 162 ++++++++++++++++++++++++++++++++-
 rust/pin-init/internal/src/util.rs     |  94 ++++++++++++++++++-
 2 files changed, 253 insertions(+), 3 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 03e893cf5475..cf6142cd656d 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
+use std::collections::{BTreeMap, BTreeSet};
+
 use proc_macro2::TokenStream;
 use quote::{format_ident, quote, ToTokens};
 use syn::{
@@ -7,8 +9,10 @@
     parse_quote, parse_quote_spanned,
     punctuated::Punctuated,
     spanned::Spanned,
+    visit::Visit,
     visit_mut::VisitMut,
-    Field, Fields, Generics, Index, Item, ItemStruct, Member, PathSegment, Type, TypePath,
+    Field, Fields, Generics, Ident, Index, Item, ItemStruct, Lifetime, Member, PathSegment, Type,
+    TypePath,
 };
 
 use crate::{
@@ -48,10 +52,69 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
     }
 }
 
+/// Description of how a field is borrowed.
+#[derive(Clone, Copy, Default, PartialEq, Eq)]
+enum BorrowedKind {
+    /// Implicitly inferreed.
+    #[default]
+    Shared,
+}
+
+/// Information about a borrowed field.
+#[expect(unused)]
+struct BorrowedInfo {
+    kind: BorrowedKind,
+    /// Field lifetime for this field.
+    lifetime: Lifetime,
+}
+
+#[derive(Clone, Copy, Default, PartialEq, Eq)]
+enum Variance {
+    /// Implicitly inferred variance.
+    #[default]
+    Covariant,
+}
+
+/// Information about field lifetimes captured in a type.
+#[expect(unused)]
+struct Capture {
+    variance: Variance,
+    /// Lifetime to be captured.
+    lifetime: Lifetime,
+}
+
+impl std::borrow::Borrow<Lifetime> for Capture {
+    fn borrow(&self) -> &Lifetime {
+        &self.lifetime
+    }
+}
+
+impl PartialEq for Capture {
+    fn eq(&self, other: &Self) -> bool {
+        self.lifetime == other.lifetime
+    }
+}
+
+impl Eq for Capture {}
+
+impl PartialOrd for Capture {
+    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
+        Some(self.cmp(other))
+    }
+}
+
+impl Ord for Capture {
+    fn cmp(&self, other: &Self) -> std::cmp::Ordering {
+        self.lifetime.cmp(&other.lifetime)
+    }
+}
+
 struct FieldInfo {
     field: Field,
     member: Member,
     pinned: bool,
+    borrowed: Option<BorrowedInfo>,
+    captures: BTreeSet<Capture>,
 }
 
 struct StructInfo {
@@ -59,6 +122,7 @@ struct StructInfo {
     struct_: ItemStruct,
     fields: Vec<FieldInfo>,
     is_tuple_struct: bool,
+    self_referential: bool,
 }
 
 pub(crate) fn expand_with_cfg(
@@ -147,7 +211,22 @@ fn expand(
     replacer.visit_fields_mut(&mut struct_.fields);
 
     let is_tuple_struct = matches!(struct_.fields, Fields::Unnamed(_));
-    let fields: Vec<FieldInfo> = struct_
+
+    // Collect all bound lifetimes from generics.
+    let bound_lifetimes: BTreeSet<&Lifetime> =
+        struct_.generics.lifetimes().map(|x| &x.lifetime).collect();
+    // Collect all fields.
+    let field_idx_map: BTreeMap<Ident, usize> = struct_
+        .fields
+        .iter()
+        .enumerate()
+        .filter_map(|(index, field)| Some((field.ident.clone()?, index)))
+        .collect();
+
+    // Keep track on fields being implicitly borrowed by being mentioned.
+    let mut implicitly_borrowed = BTreeSet::new();
+
+    let mut fields: Vec<FieldInfo> = struct_
         .fields
         .into_iter()
         .enumerate()
@@ -166,16 +245,88 @@ fn expand(
                 }),
             };
 
+            let mut captures = BTreeSet::new();
+            let wildcard_variance = Variance::default();
+
+            // Infer lifetime based on the field referenced.
+            // Bound lifetimes from struct generics take priority.
+            //
+            // For example,
+            // ```
+            // struct Foo<'a> {
+            //     bar: &'a (),
+            //     a: u32,
+            // }
+            // ```
+            // would not be inferred as self-referential because `'a` is already bound by the
+            // struct generics.
+            Lifetime::visitor(|lt| {
+                if bound_lifetimes.contains(lt) || captures.contains(lt) {
+                    return;
+                }
+
+                if !field_idx_map.contains_key(&lt.ident) {
+                    dcx.error(
+                        lt,
+                        format!("`{lt}` is neither a lifetime in generics nor a field name"),
+                    );
+                    return;
+                }
+
+                captures.insert(Capture {
+                    variance: wildcard_variance,
+                    lifetime: lt.clone(),
+                });
+            })
+            .visit_type(&field.ty);
+
+            for capture in captures.iter() {
+                implicitly_borrowed.insert(capture.lifetime.ident.clone());
+            }
+
             FieldInfo {
                 field,
                 member,
                 pinned,
+                borrowed: None,
+                captures,
             }
         })
         .collect();
 
+    for field_name in implicitly_borrowed.into_iter() {
+        let field = &mut fields[field_idx_map[&field_name]];
+
+        // If field is not explicit marked as borrowed, infer a shared borrow.
+        if field.borrowed.is_none() {
+            field.borrowed = Some(BorrowedInfo {
+                kind: BorrowedKind::Shared,
+                // Obtaining from `field` instead of `field_name` for the correct span.
+                lifetime: Lifetime::from_ident(&field.member.as_ident()),
+            });
+        }
+    }
+
+    // Check that field lifetimes do not appear in the bounds.
+    Lifetime::visitor(|lt| {
+        if bound_lifetimes.contains(&lt) {
+            return;
+        }
+
+        if field_idx_map.contains_key(&lt.ident) {
+            // Forbid the use of field lifetimes within bounds.
+            dcx.error(lt, "field lifetimes cannot be used in bounds");
+        }
+
+        // Otherwise this is completely unbound. Let Rust compiler produce that error instead.
+    })
+    .visit_generics(&struct_.generics);
+
     struct_.fields = Fields::Unit;
     let info = StructInfo {
+        self_referential: fields
+            .iter()
+            .any(|f| !f.captures.is_empty() || f.borrowed.is_some()),
         args,
         struct_,
         fields,
@@ -195,6 +346,13 @@ fn expand(
         }
     }
 
+    if info.self_referential {
+        dcx.error(
+            &info.struct_.ident,
+            "self-referential support is not fully implemented",
+        );
+    }
+
     let struct_def = generate_struct_def(&info);
     let unpin_impl = generate_unpin_impl(&info);
     let drop_impl = generate_drop_impl(&info);
diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
index 3ce498cea754..67ebb333710f 100644
--- a/rust/pin-init/internal/src/util.rs
+++ b/rust/pin-init/internal/src/util.rs
@@ -1,8 +1,12 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
+use std::collections::BTreeSet;
+
 use proc_macro2::{Ident, TokenStream};
 use quote::{format_ident, ToTokens};
-use syn::{Attribute, GenericParam, Generics, Index, Member, Token};
+use syn::{
+    visit::Visit, Attribute, BoundLifetimes, GenericParam, Generics, Index, Lifetime, Member, Token,
+};
 
 use crate::DiagCtxt;
 
@@ -237,3 +241,91 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
             .to_tokens(tokens);
     }
 }
+
+pub(crate) trait LifetimeExt {
+    /// Get a visitor that call the provided function for all unbound lifetimes.
+    fn visitor<'a>(f: impl FnMut(&'a Lifetime)) -> impl Visit<'a>;
+
+    /// Obtain a lifetime from a identifier.
+    ///
+    /// The created lifetime has the same span.
+    fn from_ident(ident: &Ident) -> Self;
+}
+
+impl LifetimeExt for Lifetime {
+    fn visitor<'a>(f: impl FnMut(&'a Lifetime)) -> impl Visit<'a> {
+        LifetimeVisitor {
+            bound: BTreeSet::new(),
+            visit: f,
+        }
+    }
+
+    fn from_ident(ident: &Ident) -> Self {
+        Lifetime {
+            apostrophe: ident.span(),
+            ident: ident.clone(),
+        }
+    }
+}
+
+struct LifetimeVisitor<'a, F> {
+    bound: BTreeSet<&'a Lifetime>,
+    visit: F,
+}
+
+impl<'a, F> LifetimeVisitor<'a, F> {
+    fn with_bound_lifetimes(
+        &mut self,
+        bound: Option<&'a BoundLifetimes>,
+        f: impl FnOnce(&mut Self),
+    ) {
+        // In case the type includes a lifetime binder, e.g. `dyn for<'a> Foo`,
+        // the lifetimes in the binder are bound and should not be visited.
+
+        let mut to_remove = Vec::new();
+        if let Some(bound) = bound {
+            for lt in &bound.lifetimes {
+                let GenericParam::Lifetime(lt) = lt else {
+                    continue;
+                };
+                if !self.bound.contains(&&lt.lifetime) {
+                    self.bound.insert(&lt.lifetime);
+                    to_remove.push(&lt.lifetime);
+                }
+            }
+        }
+
+        f(self);
+
+        for lt in to_remove {
+            self.bound.remove(lt);
+        }
+    }
+}
+
+impl<'a, F: FnMut(&'a Lifetime)> Visit<'a> for LifetimeVisitor<'a, F> {
+    fn visit_lifetime(&mut self, lt: &'a Lifetime) {
+        if lt.ident == "static" {
+            return;
+        }
+
+        if !self.bound.contains(lt) {
+            (self.visit)(lt);
+        }
+    }
+
+    fn visit_trait_bound(&mut self, bound: &'a syn::TraitBound) {
+        self.with_bound_lifetimes(bound.lifetimes.as_ref(), |this| {
+            this.visit_path(&bound.path)
+        });
+    }
+
+    fn visit_type_bare_fn(&mut self, bare_fn: &'a syn::TypeBareFn) {
+        self.with_bound_lifetimes(bare_fn.lifetimes.as_ref(), |this| {
+            for input in bare_fn.inputs.iter() {
+                this.visit_bare_fn_arg(input);
+            }
+            this.visit_return_type(&bare_fn.output);
+        });
+    }
+}

-- 
2.54.0

