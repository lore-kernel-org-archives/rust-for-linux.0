Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020101.outbound.protection.outlook.com [52.101.195.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA514AA006;
	Fri,  4 Sep 2026 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531165; cv=fail; b=Aud+9uWRZmWP6N7iqzQudGARYy2bwxWmycytiA6mWeJfyZQmnKsuHj1dxkPXpy6VCXYN3UD+cPJe/bBW848OqDveqbCkwdhQO1m5c6UNlHvuFY1hQ3HV7JYU72zUCdBYcTQ+F/upsaSIh51w2ebjw2KUlmKMfFYJvyxbevT86tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531165; c=relaxed/simple;
	bh=djkkMmraWl4WThEKEaE91m6SpYS6HRLs7EldNtzvEOc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hquG/s+9uhWy8M3R71UzH4vLTn5qxEwY5aiRoOuJ28zgfFDMW2PAEBVTrYhLYtS3PGhqxYLvi5nWGh1SgbFz7y2/4cD1Xa6OQr0ITfXd/OPr4k1SoyrQO9AANhgsUikjp7Lxxra5j0Poacr3nV6nPmJ2qM7sxf6yQKwv175qp6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DRywfOCu; arc=fail smtp.client-ip=52.101.195.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DRywfOCu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjVGO69xDYfOlvPIWXDtQjvF72mA+6pM/IDvUUbtkyEOnpTdXQJIEl5HfNplM1QulMaPbdoOaI0lgk18BPvaJk2TpDUHeyQpEzbSBbmRTj1MFgQYR0y9OzK3I2TF4f2MOtsj/DWRmxar5fGhZyF6Fk6flcSS/oEyvZEKtBoe5n/2VgSHHkAmT651hB+tMICVaAVDvmlEY06YghNPJ4DFOGZlKYRT7ofzxLNYBDV5ZyS5l94dnFs67esB2WEUPVeRey6juCv6Lbsvw04xogiOwqQv8MD9mohAsAdkIaH7HC9iKt9cxzvyQ6d+ijXR5FmVnW51E1vdm/qENrYUU5jqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vHiSxYq+BCBFy6DR4TMZGRcSBhwOZcWcO8GHEwqbzs=;
 b=d3gkmHGkRAVuN1ovxKvcBprfd7aM+JpNcp1Z2bt8s0zpiepTz+vtLJGL9905+fK+tr3meEZcpyEut5NQXq3dAfWfVDzLf3I5w7xhvC9GB8Ml8pQz2vAMjq78EsmlDXWcEb63ByA3mGNCBKAc38blzB6rl12umSMV6UWKVm8dDaqLaaP8Fue1m/x8wN9anAbDjp5fuY2HiDjzqI1+BEG3f1Fl2j4PyfJIAROjSs+dMuK86Vjl8MZ29sjU4iW8OnCctIRmPqAsg1gHGdcB19P3MFKJhmNXSWnK4YEjXDWSBUPqoO6Zb0uu92ZjsY8qMYSf0lhX8oUzx9eQAhwp1Muh9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vHiSxYq+BCBFy6DR4TMZGRcSBhwOZcWcO8GHEwqbzs=;
 b=DRywfOCuL8Rpo/NryQo/knminOmcPk5HLDk3qZiXlx1xiQxkvQJPyX3r42QNrp5W7xr5WXORnJxo6E/9goHOQa5Y6xP6nCHajwZ5dv/CiTl5GsHX9iYNSu9VwHtvzCIWcAj/r2UD7WZBjK8a2BKDQlpUrEW3f9BhdF6kTmTwv5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6690.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:12:37 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 14:12:37 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 04 Sep 2026 15:12:31 +0100
Subject: [PATCH 3/4] rust: pin-init: internal: init: support tuple structs
 in `[pin_]init!`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-tuple-struct-v1-3-72c50bd037fd@garyguo.net>
References: <20260904-tuple-struct-v1-0-72c50bd037fd@garyguo.net>
In-Reply-To: <20260904-tuple-struct-v1-0-72c50bd037fd@garyguo.net>
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
 Gary Guo <gary@garyguo.net>, Mohamad Alsadhan <mo@sdhn.cc>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531156; l=12396;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=LyHwjjF7Z5aEqauFHUSqo3KF4drjz/2/gytD/pO8hzU=;
 b=p7na7fxZtXzOmdZ7D+uGiNnhYqkxKtMNUI6+j1lxL7mC16puacJA+XvyGLeTRgteRh/0n/MNj
 02TO0x0LIAhCR3daUCeW7IG2jFjo2O1EQr270oB166U/cQeuWHpDW8L
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0690.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: 39cc9fcf-3755-4f31-2f27-08df0a8e92fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|376014|10067099003|6133799003|18002099003|56012099006|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	MQzAmzr3eau3hPkWWK6NDYvmIf06oCsYS2VGMrPBIkrVPFNZ6KLbk/6WZd2+W3b8k5+xnpqjp6iaJ9c/WftBWjqskVCHKGUO3CmBuvJvoG2kR0c8/EsQKEOXZF2fPCTHssshvk06903Q+/5C7S1THR73RmuRGC9w4gkciTMlwBXREbPtuftm67WuV8V+X37/z8eF8GQ8BsJ9B4BFbHRPXMHLUiH+tgTyS53rXZkplwB6ZwaQerTvdFa26C8jGBRp1a9NgCUHZUEnBTXtULpMHYlhv9QLtNWKSkWR2BMPrfMRBm8GWtZ9KxyDPlFDF4g5/V1CpfeD/cCDeBqevH4PQRqVdFuDEgyzNCS56UI/eY/Q65UQpbHtNb4tDVWKN8dPDzpxx7RicXLAbhPCi7wKdkkODs5bAeRz0SvvJ0iZu4AhB/y89OaTiDh2ngTLXNSzbbGwLlwUSfYeGL5ieQ03pdmj8ZfQ5edNIx4lszHKdl6e4Zijjr62ee7xzOhEBKVt3SB9wb38t8NI2XbPuIYpBVgvxY8PywncnKweoJKhMoCd32eEMBdXljMZRZv4qppWucMGZJkQIa+EwW0+zthGTrUxTdo4Dd4mrInXBWcldsp/IGmO6Vnc8/laNrTczTDDaoxfTvLJF9icPgQ/nOwtNRaKo94t+fCz0S4+aueFVvelV5RId+JpBMyGYYDe04xUt/69WDLxwhQjGwEB/EZfuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(376014)(10067099003)(6133799003)(18002099003)(56012099006)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVFoM1hsVUFSTDVKOWY3bFZndzcvTFlkT255TW1yaTdNN3ExeUhXVDlYOVZP?=
 =?utf-8?B?dEVTVCs0d3M2bjN2NUdmVXUyV0tud1NQUE56Wis4ZHQrUGNDY1p5SDNzaVl2?=
 =?utf-8?B?SHRHSG41RUFMMHlOTjljeVhJczl0UFAxQUd6eGYxeTJsYXhBdmdMU2c2WWZl?=
 =?utf-8?B?c24rLzlUQVYwNFlVbW1kb2lvTXRQbS9uaDJhbEdISDhyS05KQkVKQjlDSjMx?=
 =?utf-8?B?V3BxV3RzYWZXL3ZJOXVoU2lzT0FndmdUU2YvR2YyQVVVQndtb01Ub3ZDL1l6?=
 =?utf-8?B?YjJ5SjV5SDl3OUZlUkdGVUJGeGxvQk1yZ3NTWHRQMEFBcWF3NjJ1UE0vc1lW?=
 =?utf-8?B?eFBUVWE0TjJPcDI3OUJNdGE1dVNpZDdmUHYyb2tFcWowUjVwR3g1UkhScUti?=
 =?utf-8?B?SGNaQjB1Y0IrZERjc1BPOVFNQzh1L2RKUGRremdraEN4TkF0WmRoVXdEeGQw?=
 =?utf-8?B?bnB2bmFGd2lDWFFkV3hvUDBYUCs0cFFTRS8wZjlYMzZYckU3UVpKNFhYR3F0?=
 =?utf-8?B?ZWR0ak8vRFRveHJBU2JDM0FXMmdrTWpmZk1zQlRFUFNlb1ROYkxXSDZzNnVK?=
 =?utf-8?B?ajQ4NXpRZzVOTVh3UkNjNnNVR0dVY2EvWUxxUG14S2F1N3k4ZUkyQXhJTkZ3?=
 =?utf-8?B?d092Vm9FTXJnVXg4cmxGbCsxWDBLRlZ4Y1FtUWd3aGZTRFllRXk0eERJQThW?=
 =?utf-8?B?dTVwV0xOUTJvWDBTd1hWWTNNclAyaG04SkIrdzdMb1pjSWJNT1FqZUpaQmRX?=
 =?utf-8?B?ckprblhKdTB1OUJGU3hpM2I0VzlyQ3l5amh2S2ZVVDNtYzhmRFErNWpCUUF3?=
 =?utf-8?B?ZXR2bG9iNFh5OWsrYWNJQXRWTlY5eVZOcVhiTWdqUlprTW53MU1Pd1RxZ1Jj?=
 =?utf-8?B?RzA3MFE4RVZiRXA2anFWVzVJaWRFQjR6VkJlYmxPVHVTN3ZrSjJZWHpxU2Rr?=
 =?utf-8?B?bDZHSjI4b1ZCMUxoTVI2Q0dLRTJPd2JXTmFQRnBadUUzSThEVWdFWWVmSElR?=
 =?utf-8?B?eWJhZWJRdXdEb0RFbXQxTjlrYlBoV2ZKSktpRUF6QmxTZnRVU1lYQjVnZVc0?=
 =?utf-8?B?cnpKVmVrdm5CTFd1R1RNOHM2T0pwaitUMDBGVXF3elFCbjdFYkFmOFJ2Umky?=
 =?utf-8?B?RUxoS0VxSjIrZzU5SlphWGhraFhpU2RoSnhmdjdvT1lCQUttL0VSYWk1bi95?=
 =?utf-8?B?ZUF3Z25meExsU0lqNlIvRFNYSkpDSzR5dERkQkVldnd6N1g3Ykt0Q1ZheUFU?=
 =?utf-8?B?dzlqVUlhbG5TcUxaSEFOU3U0RmdxY3c2cHprZFRXSTJvdUxkUll0ZHZjM3pG?=
 =?utf-8?B?UWwzaUlkRUFZZ29pZ1NaVVp1RjUrMjF5a01iNlJnN3ZOOW9waUxDQnpENFRY?=
 =?utf-8?B?MHVsc0Nyd3JkV3I0Y3krUGtkTXhiY3k2OHBhY2IrMm41SGU0ei81aEEzcENx?=
 =?utf-8?B?MEplTEwwY1RMSk1GU0QxaTZZVTQyb1RWVHlQZnBkNDdCbVd6MkthZzdxR1Ax?=
 =?utf-8?B?SktBQUE3SVUrNldJMm1VYVF2dHhtOC9FdkFRdmh0VVlJTy82KzRLdVM5OUpW?=
 =?utf-8?B?Q1Z6RVBiczJ0L25pVGRKZkxnaTAyWi80czBRb2FGYzBNQXEvdVNFN3JjeGZp?=
 =?utf-8?B?dThsZkYxMkVKbE8rMDVML1JxTEVZZWJrWklQTkVlREprb3lsWW5jSFdGSDlx?=
 =?utf-8?B?Mm5qeFgwMUJHWXBETGNkWW8yd1VxMTMwZU1BTlNUYXBSMU1sRXlHRGxoallj?=
 =?utf-8?B?TGExelNCZzl6UDMrV3pUMlNyWG1Ub1pUNUpmS1lvbUtnSG5qdVVEcVBsUnRW?=
 =?utf-8?B?akRacnVXa2tQKzVCUHhFZlVWaVFGSXZFYWpYZ0psRmprYmtDZmZzUXo3eUJN?=
 =?utf-8?B?UkxKaE5FTkxKT2p0eHNEN0tCZk9sMDBDbEFwcHZpTE02bVYwU2hYT1VZSEN4?=
 =?utf-8?B?ZSswOS9DZWVuelZST24xc3l5ZStGWCt1RkZ1b1l0dVV0ZDM5SmxvUW9BMHJI?=
 =?utf-8?B?RTNaR05kZnBWaWdJdGZVQTJ5WmZkSzVuUE9uVytvRnlJcnMra01BdkxZT3VI?=
 =?utf-8?B?Ti9YQ0MyS0tZY0dwMVV4T08zUHlicEVOaGpmc3k4aEtIZXQrckZCUVVqTDZH?=
 =?utf-8?B?eXpjNk5mQ2w2Qm1rZDg1QVJnMk1TYUJ3eDZ1ZnhqUHFMUkRIeThicU5Ka1Ar?=
 =?utf-8?B?TzlZUVc5YjJsSmNUNXdXYTZXZnJTbVNZL240N1c4aVpEMnVHMy9CdXgzNnpG?=
 =?utf-8?B?dzJibnRNalNUN2JteGN0aktuMHp0YVdsQllzSnM5UXRKcVpKSGpwdzFyc2to?=
 =?utf-8?B?VUNIS2VSQ0E3K05HOTNKRFljYTlLOWE4bG5GZGJJaTNVUFB0eXhndz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 39cc9fcf-3755-4f31-2f27-08df0a8e92fa
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:12:37.8077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsUqgFfyqgkj6J+r9z0s8te+FNPkVk1WfMuQ4qxOmsk5XaP2PQKsGJ3R4AkjOEdOcRxTCTPirYOnM9YwOQbRTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6690

From: Mohamad Alsadhan <mo@sdhn.cc>

Extend the initializer syntax so that a field can be named by an index,
addressing tuple struct fields the same way a struct expression does:

    pin_init!(Foo { 0: value, 1 <- initializer })

Tuple fields are not exposed by a `let` binding to the fields after them,
since they have no name to bind; `_0` would shadow a user variable.

Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
[ Fixed incorrect index calculation and cleaned up the code - Gary ]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 115 +++++++++++++++++++++----------------
 rust/pin-init/src/lib.rs           |  32 +++++++++--
 2 files changed, 95 insertions(+), 52 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index fd0b5ea4a0a3..5920bb281a50 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -8,10 +8,13 @@
     parse_quote,
     punctuated::Punctuated,
     spanned::Spanned,
-    token, Attribute, Block, Expr, ExprCall, ExprPath, Ident, Path, Token, Type,
+    token, Attribute, Block, Expr, ExprCall, ExprPath, Ident, LitInt, Member, Path, Token, Type,
 };
 
-use crate::diagnostics::{DiagCtxt, ErrorGuaranteed};
+use crate::{
+    diagnostics::{DiagCtxt, ErrorGuaranteed},
+    util::*,
+};
 
 pub(crate) struct Initializer {
     attrs: Vec<InitializerAttribute>,
@@ -36,11 +39,11 @@ struct InitializerField {
 
 enum InitializerKind {
     Value {
-        ident: Ident,
+        member: Member,
         value: Option<(Token![:], Expr)>,
     },
     Init {
-        ident: Ident,
+        member: Member,
         _left_arrow_token: Token![<-],
         value: Expr,
     },
@@ -52,9 +55,9 @@ enum InitializerKind {
 }
 
 impl InitializerKind {
-    fn ident(&self) -> Option<&Ident> {
+    fn member(&self) -> Option<&Member> {
         match self {
-            Self::Value { ident, .. } | Self::Init { ident, .. } => Some(ident),
+            Self::Value { member, .. } | Self::Init { member, .. } => Some(member),
             Self::Code { .. } => None,
         }
     }
@@ -229,9 +232,9 @@ fn init_fields(
             cfgs
         };
 
-        let ident = match kind {
-            InitializerKind::Value { ident, .. } => ident,
-            InitializerKind::Init { ident, .. } => ident,
+        let member = match kind {
+            InitializerKind::Value { member, .. } => member,
+            InitializerKind::Init { member, .. } => member,
             InitializerKind::Code { block, .. } => {
                 let stmt = &block.stmts;
                 res.extend(quote! {
@@ -243,27 +246,28 @@ fn init_fields(
                 continue;
             }
         };
+        let ident = member.as_ident();
 
         let slot = if pinned {
             quote! {
                 // SAFETY:
                 // - `slot` is valid and properly aligned.
-                // - `make_field_check` checks that `&raw mut (*slot).#ident` is properly aligned.
-                // - `make_field_check` prevents `#ident` from being used twice, therefore
-                //   `(*slot).#ident` is exclusively accessed and has not been initialized.
+                // - `make_field_check` checks that `&raw mut (*slot).#member` is properly aligned.
+                // - `make_field_check` prevents `#member` from being used twice, therefore
+                //   `(*slot).#member` is exclusively accessed and has not been initialized.
                 (unsafe { #data.#ident(#slot) })
             }
         } else {
             quote! {
                 // For `init!()` macro, everything is unpinned.
                 // SAFETY:
-                // - `&raw mut (*slot).#ident` is valid.
-                // - `make_field_check` checks that `&raw mut (*slot).#ident` is properly aligned.
-                // - `make_field_check` prevents `#ident` from being used twice, therefore
-                //   `(*slot).#ident` is exclusively accessed and has not been initialized.
+                // - `&raw mut (*slot).#member` is valid.
+                // - `make_field_check` checks that `&raw mut (*slot).#member` is properly aligned.
+                // - `make_field_check` prevents `#member` from being used twice, therefore
+                //   `(*slot).#member` is exclusively accessed and has not been initialized.
                 (unsafe {
                     ::pin_init::__internal::Slot::<::pin_init::__internal::Unpinned, _>::new(
-                        &raw mut (*#slot).#ident
+                        &raw mut (*#slot).#member
                     )
                 })
             }
@@ -273,11 +277,11 @@ fn init_fields(
         let guard = format_ident!("__{ident}_guard", span = Span::mixed_site());
 
         let init = match kind {
-            InitializerKind::Value { ident, value } => {
+            InitializerKind::Value { value, .. } => {
                 let value = value
                     .as_ref()
                     .map(|(_, value)| quote!(#value))
-                    .unwrap_or_else(|| quote!(#ident));
+                    .unwrap_or_else(|| quote!(#member));
 
                 quote! {
                     #(#attrs)*
@@ -294,14 +298,23 @@ fn init_fields(
             InitializerKind::Code { .. } => unreachable!(),
         };
 
+        // A tuple field has no name that could be bound here (the `_0` identifiers are considered
+        // implementation detail and not user-facing).
+        let binding = match member {
+            Member::Named(ident) => quote! {
+                #(#cfgs)*
+                // Allow `non_snake_case` since the same warning is going to be reported for the
+                // struct field.
+                #[allow(unused_variables, non_snake_case)]
+                let #ident = #guard.let_binding();
+            },
+            Member::Unnamed(_) => quote!(),
+        };
+
         res.extend(quote! {
             #init
 
-            #(#cfgs)*
-            // Allow `non_snake_case` since the same warning is going to be reported for the struct
-            // field.
-            #[allow(unused_variables, non_snake_case)]
-            let #ident = #guard.let_binding();
+            #binding
         });
 
         guards.push(guard);
@@ -326,9 +339,9 @@ fn make_field_check(
 ) -> TokenStream {
     let field_attrs: Vec<_> = fields
         .iter()
-        .filter_map(|f| f.kind.ident().map(|_| &f.attrs))
+        .filter_map(|f| f.kind.member().map(|_| &f.attrs))
         .collect();
-    let field_name: Vec<_> = fields.iter().filter_map(|f| f.kind.ident()).collect();
+    let field_name: Vec<_> = fields.iter().filter_map(|f| f.kind.member()).collect();
     let zeroing_trailer = match init_kind {
         InitKind::Normal => None,
         InitKind::Zeroing => Some(quote! {
@@ -376,7 +389,8 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
             let lh = content.lookahead1();
             if lh.peek(End) || lh.peek(Token![..]) {
                 break;
-            } else if lh.peek(Ident) || lh.peek(Token![_]) || lh.peek(Token![#]) {
+            } else if lh.peek(Ident) || lh.peek(LitInt) || lh.peek(Token![_]) || lh.peek(Token![#])
+            {
                 fields.push_value(content.parse()?);
                 let lh = content.lookahead1();
                 if lh.peek(End) {
@@ -450,31 +464,36 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
 impl Parse for InitializerKind {
     fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
         let lh = input.lookahead1();
-        if lh.peek(Token![_]) {
-            Ok(Self::Code {
+        let member = if lh.peek(Token![_]) {
+            return Ok(Self::Code {
                 _underscore_token: input.parse()?,
                 _colon_token: input.parse()?,
                 block: input.parse()?,
+            });
+        } else if lh.peek(Ident) || lh.peek(LitInt) {
+            input.parse::<Member>()?
+        } else {
+            return Err(lh.error());
+        };
+
+        let lh = input.lookahead1();
+        if lh.peek(Token![<-]) {
+            Ok(Self::Init {
+                member,
+                _left_arrow_token: input.parse()?,
+                value: input.parse()?,
+            })
+        } else if lh.peek(Token![:]) {
+            Ok(Self::Value {
+                member,
+                value: Some((input.parse()?, input.parse()?)),
+            })
+        } else if matches!(member, Member::Named(_)) && (lh.peek(Token![,]) || lh.peek(End)) {
+            // Short-hand syntax, available for named fields only.
+            Ok(Self::Value {
+                member,
+                value: None,
             })
-        } else if lh.peek(Ident) {
-            let ident = input.parse()?;
-            let lh = input.lookahead1();
-            if lh.peek(Token![<-]) {
-                Ok(Self::Init {
-                    ident,
-                    _left_arrow_token: input.parse()?,
-                    value: input.parse()?,
-                })
-            } else if lh.peek(Token![:]) {
-                Ok(Self::Value {
-                    ident,
-                    value: Some((input.parse()?, input.parse()?)),
-                })
-            } else if lh.peek(Token![,]) || lh.peek(End) {
-                Ok(Self::Value { ident, value: None })
-            } else {
-                Err(lh.error())
-            }
         } else {
             Err(lh.error())
         }
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index bf77b76c43c8..f020b383851e 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -598,7 +598,7 @@ macro_rules! stack_try_pin_init {
     };
 }
 
-/// Construct an in-place, fallible pinned initializer for `struct`s.
+/// Construct an in-place, fallible pinned initializer for structs, including tuple structs.
 ///
 /// The error type defaults to [`Infallible`]; if you need a different one, write `? Error` at the
 /// end, after the struct initializer.
@@ -632,6 +632,28 @@ macro_rules! stack_try_pin_init {
 /// # Box::pin_init(demo()).unwrap();
 /// ```
 ///
+/// The fields of a tuple struct are addressed by their index:
+///
+/// ```rust
+/// # use pin_init::*;
+/// # use core::pin::Pin;
+/// #[pin_data]
+/// struct Pair(usize, Bar);
+///
+/// #[pin_data]
+/// struct Bar {
+///     x: u32,
+/// }
+///
+/// # fn demo() -> impl PinInit<Pair> {
+/// let initializer = pin_init!(Pair {
+///     0: 42,
+///     1 <- Bar { x: 64 },
+/// });
+/// # initializer }
+/// # Box::pin_init(demo()).unwrap();
+/// ```
+///
 /// Arbitrary Rust expressions can be used to set the value of a variable.
 ///
 /// The fields are initialized in the order that they appear in the initializer. So it is possible
@@ -750,9 +772,11 @@ macro_rules! stack_try_pin_init {
 ///
 /// # Syntax
 ///
-/// As already mentioned in the examples above, inside of `pin_init!` a `struct` initializer with
-/// the following modifications is expected:
+/// As already mentioned in the examples above, inside of `pin_init!` a struct initializer with the
+/// following modifications is expected:
 /// - Fields that you want to initialize in-place have to use `<-` instead of `:`.
+/// - Tuple struct fields are named by their index, as in `0: value` or `0 <- initializer`. They
+///   are not exposed by a `let` binding, since they have no name to bind.
 /// - You can use `_: { /* run any user-code here */ },` anywhere where you can place fields in
 ///   order to run arbitrary code.
 /// - In front of the initializer you can write `&this in` to have access to a [`NonNull<Self>`]
@@ -791,7 +815,7 @@ macro_rules! stack_try_pin_init {
 /// [`NonNull<Self>`]: core::ptr::NonNull
 pub use pin_init_internal::pin_init;
 
-/// Construct an in-place, fallible initializer for `struct`s.
+/// Construct an in-place, fallible initializer for structs, including tuple structs.
 ///
 /// This macro defaults the error to [`Infallible`]; if you need a different one, write `? Error`
 /// at the end, after the struct initializer.

-- 
2.54.0

