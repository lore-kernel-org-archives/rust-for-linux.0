Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021119.outbound.protection.outlook.com [52.101.100.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3960D45D5DA;
	Tue, 28 Jul 2026 14:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250360; cv=fail; b=NckNuRv/XruqmFsha6G9VJxa82qg6KxWmqniVi2BTUbceIPraiyVCrR796beiMtIe6ZE2GcokDybq4l9sbR7UhKpkzrwDhpLZDo5l2fiqgZza8xW+tD6GwdsuZC+XYVzsKE2v/24lI1lsUrQVFlKWlmZT43LX5mJs1niBZACcm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250360; c=relaxed/simple;
	bh=s/maS8Tj5jTxL4dsRiNqst5K1duXbyqebEUh97MYpYU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RVVebjrVYgsohy2EPjlvXkuoOD05MrsPc6KH/7cVTqSOIGVIjb0xwV/bDIoZ9Fibo3CGKMVcFZG2aA7sBlLscM41+PdBfCZjCAOx6w+TZSRCGQercszG2ztD7nMZ/cZQ0Y9oF5q3qYdvWmOrG7KT8pD778ukhFMJ+nyNSNpheMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=W6xSY/F8; arc=fail smtp.client-ip=52.101.100.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="W6xSY/F8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J00nxKpuwdW9LAvYvsHvtcFZPavkrLuzzZ2PW82mM4NKEqRHWxTWQik7E4L62f0WCAlBCMMhxZ5FgGILlX3I0BolK4gAsn70VttZtDGPvNB9T+whdqBI2ArPKQeEKwyvmk34QBkd/hkAoIaCX4Lz2K6T8A47hcyNfhGcmDvQ58IkXMUxXhnXRB5mZUew53qnzXfmc7ZyIAntN7mEhqthj+7LJSuDBYUsDzcFxI61g7cog2ck9nqWJCI3u0dRyEc+0KGXDpkUVIWCLjotSpAs8jpIYDj3e6DmkkK4VAW191M8wFnHHWeYYov8Ggy2Q9gwuNim9I1mwN0gQtMV2QeU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaW7sErLov+Xe3gqULvq8nopcYt7W+KspCFdOeh77F0=;
 b=tmYzwm4KMKatEgYbNSMczCBqjHmCdcJVY72rGwQB4mnA/ewqd70QP8VOA3RuPwIRiGFH0EOidu3Ii+9+JIpkgDcb6fFk8lHkN0jR2nExoWpNIMaePfKb3RZqmwIxZzn79xx4atvz6W+8aeUWN+yfdDezGikibODmSAYSr074ExMOF+Ab6Q1L0jc0EplNSM37XdExPzSMjzLIePMTPfK1XxYlXLpbPj2mQQqDo2DW71zjedZ/5IlUbAW/SUqjovpSdjVfbCHATxEcKNDn42iG21dztmIYsrYg7Q2SoXpyqI/0TCtBsj8v0CCFHXWJt+6kkPx5Sd55ZmYYsYz4loK2RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaW7sErLov+Xe3gqULvq8nopcYt7W+KspCFdOeh77F0=;
 b=W6xSY/F8IpVsufp1kdSgPKcEaPZ9cXYGbz/QvIBx8SGKqEBpAXiyZs7Uaju3Bm+14O9AYdfJhRfxE1np60lUAy420+WeDnMJnmI1zSZfhP1nU4lmLjfU9A3L8GcZ7CcpA0jIy0S7a5fu26sUWaiujT61wgAp694bzYw+L4mWXtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB7374.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:31a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 14:52:24 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 14:52:24 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Jul 2026 15:52:11 +0100
Subject: [PATCH 4/5] rust: macros: use `syn` for `fmt!` string parsing
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-printk-v1-4-855606634d70@garyguo.net>
References: <20260728-printk-v1-0-855606634d70@garyguo.net>
In-Reply-To: <20260728-printk-v1-0-855606634d70@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785250342; l=5549;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=s/maS8Tj5jTxL4dsRiNqst5K1duXbyqebEUh97MYpYU=;
 b=8eJ12xmwoc5ho2rL/eCPPqpVxj0Zcj9G6FzMwK/kQeCYJBLjuchnbY3CKZ1a/FyM8KQipPeDH
 XXDeQLicvF2AiYYrQ0frG0lQi+F4hJUW8W4BifEN/FonsC6ukKSKvBG
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO2P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa9ee93-110a-4f5f-12f3-08deecb7d5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|7416014|18002099003|10067099003|22082099003|56012099006|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	0P+4EUGo80DtFrQUWFW/kznK0VuFecUgfEQLKdZvYsM6K6K2H91PLsQjhqkhhIE0cp7GiXc0DKFGxmFD8cV02vW3kWlslNJLd2r8AOxMD1yjYqxtXMbc76sR43PLiOsHJItvoSbCZ955L1JYpwQZ/skhGWzaBcXsPoYRnHMR5EMc2rM+k4lax6mUrrym6QKuq32lXOQcYqxbJE1bN01113UgfRfBivzzXc47DK5QWoUQTQZYs/IjPCt9FX1r1uqm10OJgb4BOsx09k5uop301FJ1SJK0M+QZG+5Ii4iwhL3l63btlC1HSGw7HVqhkUd4OJzkIgwa2FWtH0miTHguBJJXQb8Bqpnc/7faA219l0tAYgEvJg6cWxyAEZw42axn9AeBL3UT1GiaPUGbnDnMupa9EPyDxU4Gx9c5bQj0y/tLqQA5HTx1MdRvtZXvz6WNg5XrUPMTVBvf23ceQyFg8BluK+B6Rs6JlrRdYKrgSRO/qX6HQ+3sKIIAwyux5WjyAQeR/nkwBvJYyq+3kpqcp0PyTk12BUDlDuZ4drx5f0mncU7a1UxUnrJv9koJeFOnDUcvHKcxCRt8urIZNsCqmYW2mPgzVJ+upAcWPO6O0IjMWb/yLGUMF0wEnTcz5327xg4KNDEfX7bKIWRNwvWJ3sBNdCIq4OIr7WTN88PEV/Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(10067099003)(22082099003)(56012099006)(921020)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VURCV2FvVk1iK08yRzhCRHRsSjh5RjJrTnAvM0pHeWpRNFlQK0M0ZUxSZ0FC?=
 =?utf-8?B?Tm5Ya2owZ3BvNUprdEVDS2lPTHU0T3h3aG4rL3VMb0J4UDFsbkZrRTNtWlYv?=
 =?utf-8?B?S29qWXBpanZnUzJCMGN6RWsyWEdHLzZ3TGpoRWE3SnRwMk9ZOVV1bE5YTkJo?=
 =?utf-8?B?VDdrYVJFdmtHZXAvVC9nT3gzSERvVTNWSkk4bG1uQlF6RXVQaVdHMXdyNE1L?=
 =?utf-8?B?dlRLQ1BNYXYwaThHNjhCWFJSM1JEWFB3S1R3Y1EwWXBjWm85c2MyVWlsUTBM?=
 =?utf-8?B?VytPTlZ0ckgxTS95SVQzMGM3NEJPQjRIWjM3U3J2QkxOcWhPZmZrWkQxSk93?=
 =?utf-8?B?WkJHTkRQVGwzYkZBVW5JelczNHZ6MnZoMGRubzk0ZFFGdSt3dmhBSmdkWnkw?=
 =?utf-8?B?eXE4TlF3WHNTdGdQaXVxMTBZM01leVIybXhqZkMwajl5RFBKMGxUd1hpaG1N?=
 =?utf-8?B?MU10MmoweHV2UmEvMnFNbDFPTlVCYTdoeGVCNno1LzIwaTZqMk5UcHdlNHBI?=
 =?utf-8?B?VHRQNkxsNVlSbTh4UHNhd1J3SU56QkpPTWxkQnZGYUFUK2JhbVJlL0JLQlZM?=
 =?utf-8?B?M0VJWHE3dEdPQ0d5cUZlZGUvZVlkRDI3cERIVDlaaysySWZUdjF0UTZmczBB?=
 =?utf-8?B?WnArQmdwMEdORmREd1IzaVNNNUpxc1NKaytwRzZMNTgxaWRUUlNQczZzNzRo?=
 =?utf-8?B?MmhEem1RMG9VL2hVNWcrM24zWkQ1c0xyNnhVZVdhZEFlcEJNWWpEUUhVQ2R0?=
 =?utf-8?B?aEU1OUdJcmwycG13SURBUm9yRWlKOURGdGQ0TS9xdUhwNkJIN1ZDdFQxUW54?=
 =?utf-8?B?aTdRdGl5T2VKSmlza1AvSDEyRm82OEp0YjAxRG9rRXdHUkRzOGpaQnlQL1RO?=
 =?utf-8?B?TkdSSVk5SWJWbDkvYUM0RzFieC94dzV0cGc4YVo5V1k3aGlidlpldExnQ0Mx?=
 =?utf-8?B?SEt6YnUxRDZNL1JpVFI5M3FabXA1NTNWcmpQazFjbDRDQWpHRUFMUmtRS0hk?=
 =?utf-8?B?azd6b2kxNk42cmlHdjM3K0hWaHFaZGtSTUlmUVQvR1RmUHc2dUkrdS9tblpJ?=
 =?utf-8?B?ZWx6TFJhUUFJeE1aYWlWZDZIeFBMUjYzbTN5OVZCUVpMalhmdXoxUUJBWm0r?=
 =?utf-8?B?bUxoQmJFcjZQQitDQVF0eml6YVA4a1l3NitkazN6QmEyQkZhOFVmWUpvYXZX?=
 =?utf-8?B?K3NVZVB3bEpaMVY2WWhsLzBnKzRBNFlITndhMEdmd212aWt3QVNqNU5TUFVF?=
 =?utf-8?B?UzFnZWlabTdscFFCV1BkZmFoVTdPVUNuUnVFVXAxVTlaaldCV0tuYkVPYTJ4?=
 =?utf-8?B?MWZOMzZrUjZoTzZPdXVtZDNCK1dvOHVKUTVLdE9MV2RWSFg4OUNObWIzdzd5?=
 =?utf-8?B?bGhLczlhM0hrYno5ZlNYeGNaeHJ4Uzg4U2huRUIwTEhTbFZjZXpiQTVrZHMz?=
 =?utf-8?B?eTNvRzBBd1BKcGh0SjRyaWQ3N1BOcUkxWGRWdHJDNkloZ1BiNkVodEE3OU83?=
 =?utf-8?B?VHJ5QTVMdTU3UWd5Q3g5cGt2RUtmYWpFL04yYW5Qa0I5R0tYajlQSFIzenhz?=
 =?utf-8?B?YzJtSWhnNjQrNkdMZlgyeWNUaVRjbFNxZ3AvYW4vWTQvbDJ4a3VEdlZYNGlP?=
 =?utf-8?B?ZXNsT2NOdVFmVTJOaUhJTjlxSVBoZW55RG1hRVlmaGgvRW56REhka0pOaUtr?=
 =?utf-8?B?Rk8zUEtDRWlEelJEd3lKWGtSSmIvRGtYdWIwaHVrYlFpQmI4T1owNGp2MEZG?=
 =?utf-8?B?MmtZYWovSlpmMXM3OHFkd0MrWEVLU3VqRFp2WlljM25RTUZRRHZXTEJGWG1m?=
 =?utf-8?B?LzhVVFZva0dVZWFEZDc2THljMEx1ZWRDRjJWUFF3MlREaUxpZkdiTlQxTlRX?=
 =?utf-8?B?eDdTMlRBZUZ3akN4K1VXMGl6K1V2bEhXejFHQmZLWHVGOUx2YjE5UDZkc0pN?=
 =?utf-8?B?a1liS3RqS2E0aVRzOTRQdG9mN1N0UnBMT0dVaFNrZFd4bldYeUFMbW4ra2Vj?=
 =?utf-8?B?UDhIUm9abS9rZmhLMXFUMUdtMG92YWNzYXhpcnFKR3lOeGhLVFBOMjc4ekhy?=
 =?utf-8?B?R3lRMGdvTjFkaFF3SU16TUdOK2x6eGNEYjlCRjdkdEF6T1lZQXlTWjVmZEVR?=
 =?utf-8?B?Yk1BVEYreTk0VDljOG90ZTZrd0tuR0pSalRndTFVdnZMQlpMTU5tK0c3QzBq?=
 =?utf-8?B?WnVRYjNWUGhvdi96eFpMRjZZR09GOVlWZnlTZmR6TkxXOU9iR3p6K3VTZGlL?=
 =?utf-8?B?aG1jRjRuOXBNWkladFBDSWRiZVhlWjlwbUN5UDBuTTY3dnlnZURyREMwTDhn?=
 =?utf-8?B?amwwSkJoR0g0djc3eVljOVZKSVpWZmx5NWRFeXFTZURXalcydFM3dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa9ee93-110a-4f5f-12f3-08deecb7d5ef
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:52:24.6251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAyw4zkE1Pm7n8T9wC7iF5uptfdxiMgwY0kEuawfL566/e02M0z2HSofFMGkAuikuBdgqGaUmlR7pE4bC0wPkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7374

Use `syn` to parse `fmt!` string as it handles string escapes properly and
is able to parse when the literal is wrapped inside a invisible delimiter
group, which can be added when `fmt!` invocation comes from declarative
macro.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/macros/fmt.rs | 92 +++++++++++++++++++++++++++++-------------------------
 rust/macros/lib.rs |  4 ++-
 2 files changed, 52 insertions(+), 44 deletions(-)

diff --git a/rust/macros/fmt.rs b/rust/macros/fmt.rs
index ce6c7249305a..0b9b2d328650 100644
--- a/rust/macros/fmt.rs
+++ b/rust/macros/fmt.rs
@@ -2,54 +2,60 @@
 
 use std::collections::BTreeSet;
 
-use proc_macro2::{Ident, TokenStream, TokenTree};
-use quote::quote_spanned;
+use proc_macro2::{
+    Ident,
+    Span,
+    TokenStream,
+    TokenTree, //
+};
+use quote::{
+    quote_spanned,
+    ToTokens, //
+};
+use syn::{
+    Error,
+    LitStr,
+    Result, //
+};
 
 /// Please see [`crate::fmt`] for documentation.
-pub(crate) fn fmt(input: TokenStream) -> TokenStream {
+pub(crate) fn fmt(input: TokenStream) -> Result<TokenStream> {
     let mut input = input.into_iter();
 
-    let first_opt = input.next();
-    let first_owned_str;
-    let mut names = BTreeSet::new();
-    let first_span = {
-        let Some((mut first_str, first_span)) = (match first_opt.as_ref() {
-            Some(TokenTree::Literal(first_lit)) => {
-                first_owned_str = first_lit.to_string();
-                Some(first_owned_str.as_str()).and_then(|first| {
-                    let first = first.strip_prefix('"')?;
-                    let first = first.strip_suffix('"')?;
-                    Some((first, first_lit.span()))
-                })
-            }
-            _ => None,
-        }) else {
-            return first_opt.into_iter().chain(input).collect();
-        };
+    let Some(fmt_tt) = input.next() else {
+        return Err(Error::new(
+            Span::call_site(),
+            "requires at least a format string argument",
+        ));
+    };
 
-        // Parse `identifier`s from the format string.
-        //
-        // See https://doc.rust-lang.org/std/fmt/index.html#syntax.
-        while let Some((_, rest)) = first_str.split_once('{') {
-            first_str = rest;
-            if let Some(rest) = first_str.strip_prefix('{') {
-                first_str = rest;
-                continue;
-            }
-            if let Some((name, rest)) = first_str.split_once('}') {
-                first_str = rest;
-                let name = name.split_once(':').map_or(name, |(name, _)| name);
-                if !name.is_empty() && !name.chars().all(|c| c.is_ascii_digit()) {
-                    names.insert(name);
-                }
+    let fmt: LitStr = syn::parse2(fmt_tt.into())?;
+    let fmt_str = fmt.value();
+    let fmt_span = fmt.span();
+
+    // Parse `identifier`s from the format string.
+    //
+    // See https://doc.rust-lang.org/std/fmt/index.html#syntax.
+    let mut names = BTreeSet::new();
+    let mut fmt_str_rest = fmt_str.as_str();
+    while let Some((_, rest)) = fmt_str_rest.split_once('{') {
+        fmt_str_rest = rest;
+        if let Some(rest) = fmt_str_rest.strip_prefix('{') {
+            fmt_str_rest = rest;
+            continue;
+        }
+        if let Some((name, rest)) = fmt_str_rest.split_once('}') {
+            fmt_str_rest = rest;
+            let name = name.split_once(':').map_or(name, |(name, _)| name);
+            if !name.is_empty() && !name.chars().all(|c| c.is_ascii_digit()) {
+                names.insert(name);
             }
         }
-        first_span
-    };
+    }
 
-    let adapter = quote_spanned!(first_span => ::kernel::fmt::Adapter);
+    let adapter = quote_spanned!(fmt_span => ::kernel::fmt::Adapter);
 
-    let mut args = TokenStream::from_iter(first_opt);
+    let mut args = fmt.to_token_stream();
     {
         let mut flush = |args: &mut TokenStream, current: &mut TokenStream| {
             let current = std::mem::take(current);
@@ -69,7 +75,7 @@ pub(crate) fn fmt(input: TokenStream) -> TokenStream {
                     }
                     (None, acc)
                 })();
-                args.extend(quote_spanned!(first_span => #lhs #adapter(&(#rhs))));
+                args.extend(quote_spanned!(fmt_span => #lhs #adapter(&(#rhs))));
             }
         };
 
@@ -88,9 +94,9 @@ pub(crate) fn fmt(input: TokenStream) -> TokenStream {
     }
 
     for name in names {
-        let name = Ident::new(name, first_span);
-        args.extend(quote_spanned!(first_span => , #name = #adapter(&#name)));
+        let name = Ident::new(name, fmt_span);
+        args.extend(quote_spanned!(fmt_span => , #name = #adapter(&#name)));
     }
 
-    quote_spanned!(first_span => ::core::format_args!(#args))
+    Ok(quote_spanned!(fmt_span => ::core::format_args!(#args)))
 }
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 0514fc7c0a55..81f6a6ed696b 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -259,7 +259,9 @@ pub fn export(attr: TokenStream, input: TokenStream) -> TokenStream {
 /// [`pr_info!`]: ../kernel/macro.pr_info.html
 #[proc_macro]
 pub fn fmt(input: TokenStream) -> TokenStream {
-    fmt::fmt(input.into()).into()
+    fmt::fmt(input.into())
+        .unwrap_or_else(|e| e.into_compile_error())
+        .into()
 }
 
 /// Concatenate two identifiers.

-- 
2.54.0

