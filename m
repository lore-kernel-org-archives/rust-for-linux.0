Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020105.outbound.protection.outlook.com [52.101.195.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630414657D8;
	Tue, 28 Apr 2026 13:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381886; cv=fail; b=pRscwJ84RIgLVEZXVPVGm1EdTu9cjs5d8EiTm8JbiQo3KgoACTDGlrVIO8lY4hIWl2Go1WakYG1CnMvDqjeYkyVhz2FQTwjgDU7YWOyf5aBHHTE1VOIHGoJH2oP0RidE7Ek1sfEIiy7Gi+Y8UlFZiSi+0ZliVTWxwa+vlS3rRbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381886; c=relaxed/simple;
	bh=Ybk6X0XlIMBayIxBLPgmos320s4ffcfFDqJ5T0tEwko=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=f4V9fB0WEM+wOP5NEomRkK50rDiO2Tf/qCZe62mzsM9vTcNm6SKYUkV3yQV327Hryy5EVY+vI1voO/Pr+4oRMiLlC0f9l+S9203FdWwHAKaqwPZlQekFCt0qxSk4ll/S2Zf6faO/YlyAc2BVssTR929RiUMSRae0lgy9PdUihAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=g+d+wsYi; arc=fail smtp.client-ip=52.101.195.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="g+d+wsYi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFremwOZLGzYfTgmkthf8O/6xmPj5SiyVmC7hXhBgMWl3B7zYEZE0dZU/tQk7IDNxdf3mYUWE2IJBEQknNNiT7unORKciwEIN/y4YJ9J0EUMWgXCAmsS1rcFWa1NDsVj4Va2ZrzyG4Ru8yAuRJxY+iLaCz6Z3gXYFbN7XveZUWr+SFWjXrid2dW8YpDJQepQs4ovTpuwa0303pbjrW5Miw/pxzSkDb9TJJAHAdU3NW7OwIM5BSYlfS22wIVI6OH/gckrc7xBUCz7HXRMkGhTmZB4kyr2Th1xVln0diWXILYvxOONh/P74sihnGpkL7kIFHLIDWxrRFV6G679jcOjaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiEoQSea4Po//6wyvE7YH7TusmVlmM+5eEVPIiTBDuE=;
 b=IprsQp2TIDp3yMvK8yXDnb6K2FL1LqBLFGzOLW+70YfgMp86xwqJhALjynvawjGuLnvx052U2kG+g3DcR9lIFO13rniDg+quikx/CN7pvYmEwK0dMennzNaWQU23aI8qL5P46HlIZTweyvbUmwJTlQRCYXY614ToRf5QMGCFNEPSmXKtPOmeLdxTT4q3k3r7+PE43qvI55OcvnxTPEG7cA91BNUrpYAYRztgayAiRmXdVMhNjJUq0WiA/I+k7vZPdwmg7B/gzlGK9W5BSQgNDRZUcOMzd27Wd/ew7LfidAOk/3JA0IsRor2cV3qvV06ImgD09DgVX1z3pkXWk1oLvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiEoQSea4Po//6wyvE7YH7TusmVlmM+5eEVPIiTBDuE=;
 b=g+d+wsYidcp3fPhqrzsqqeMtdiFJfdop+d09cD/2yJG9bu8R11NgMN/N8rC6M+bihn84CUg9R/b241hnR2oVJNF3FpTLtLTbiD574hXBBINvyV3AZZ8wbnGuvrtN383Ir15vlaCyvpFXfpynbqrSUS/nImNtxyPRxLfBX6EsAy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5969.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:11:14 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:11:14 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Apr 2026 14:10:59 +0100
Subject: [PATCH 10/10] rust: pin-init: internal: turn `PhantomPinned` error
 into warnings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-pin-init-sync-v1-10-07f9bd3859fb@garyguo.net>
References: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
In-Reply-To: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777381869; l=2748;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=Ybk6X0XlIMBayIxBLPgmos320s4ffcfFDqJ5T0tEwko=;
 b=EKGSsqx03FAj1Y02KRow8JqkrvQk54wu9vj0q89cbHQ6MV7k5AOSSyLm729Ev+ZM5xgvLUx5R
 wUrXX8Zbx6TCeQcIeYmf2y/Z8HuplkUu55nx5S2jrrnKjrIa47qadJf
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c95a08f-0948-4074-7453-08dea5279f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fWLwKI2FqVpbCWJTr+ncHapqwFUfcMJGPD1xUnPQcZMwOSiy6E5LEh9h0oyd3oD3nIq5VtTEsTdzqjmONRLW7GiaN9F9gbJ9PrJq5VMK9NUjwrTMwXzRU4dcMstRez0uUDnWsyFibsssw7uWvT170qZvqP/tkgHcnMSKA9G4TTLq/FqZ6dqojFigemqnYxh2uvv9sqNWK/6R36MXTimPtHDJHEgsPwEaloPFDz/V0FAghbccOckcp8Jy3FsFci+o0mnqlBvTp178CJCsbkAyDDwkIwlNu25Csejc8DUZVGdHX472ZtaY1PnPRZOdn8mV1p7Jq47osRARKgI9qYxEa+g+NmXaIEFwGboGJ83uVbDe07qki6E6QvbWQgrnb9fkSsMAFPWIJAAbaYEJ4Vki+jnxeMUAoEzyG30WZNy/23Ng8qfN8AU01hfCv6oF7DbnRkrmRhRmXNlgufn+GAIE8ifRpAO7jwiTaX3PoSX/wRW759rVfLfyWHxogruHjOspstWcWrAU7aoveU0NcZFNlMGmG0mqYScWrQoIL0ex+f7EdcTaubbuI3qmcmFGxpIiWY7vdWqslR/zuV4WUSLZPfRz3Y2nyXZPQxbOjx84KLWfro3FNP66pVGraYxO7wdJCm/l2zZZoEh8O4FmOq276WbHhmEQBXOlRf8DR0pUSgHZCr+TAoBt5hfLWTvWtuX4sweic8sx2GFtBOKdjtkhGX8EmpLsppi0DRo69YRtOqE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zmd5dkpBTDh4NnlyMVFhVUU0c2s0UE9mNVdQRXdSK3hQSkpmRUhqdXlPblBt?=
 =?utf-8?B?ZlBMSzlVTlZiMnNIQW1oWE1UY0twRHVKL2YzalIwSzJ6RnUvU3dsMjVwbUt3?=
 =?utf-8?B?SmtqRm1maStHYUlJT3pITktFRG5FcWtGK0R0Y01TK2JTWGVWb1VBc3lJL1lp?=
 =?utf-8?B?RnhoQjFwNnZncE03OHlQNW12YXdIelFaaUdTWjlabjRna2ZNenRUVjhFaUY1?=
 =?utf-8?B?NWVhK2d3Tjc3Uks2Z3ZXUmZRakVHcWlsNUg2eHJ4bDdEQkljalc5YVJaaldk?=
 =?utf-8?B?NGFHWkRseVVZVDNONHFQZncrbDRkZy9URG90TUx5UW1WSDhSbEF1M2xEd1A5?=
 =?utf-8?B?WHpJRVV6bTh6bnlXb0JqdzFPM2x0b2FNRDdwNG13OStDOUxJUmg2bzc3Lzhw?=
 =?utf-8?B?Q3ZjZ3NkbDBsY2NWMHFFQTlJQ1ZoS0NJaWhKSEEzNDIvYnZQbFJGRHIwamFW?=
 =?utf-8?B?bzF2cGt3VW5PbVpibGRNK0RXaVpYelRObmd5Z2c1akRhUHBYY0ZJRlhhNk1t?=
 =?utf-8?B?MDV6TVpHaVRmZ2RUQ3FkUHFLZ1hDcHQ0ZU44ZzVhZmMrZWtSUlcwK3FIZXh1?=
 =?utf-8?B?SEpMdkl4RjF1aWg0Tnp6Sml1R1JWcHNuaWxKTjdIcGY0T0xkY1k0Q3Z3aHls?=
 =?utf-8?B?K0lXejRvejdET3R0dW1VWTJkcEZZbUlGd2JFRy9EMEZuZ2UxTUZuRXRhUzRo?=
 =?utf-8?B?cXFUWjJ6Uis2MXptUG5yYXpBMVNKbFhQUXFwaHFKRVBYTndzTHBMelJMOHk0?=
 =?utf-8?B?c2d5TUlSVWpyMWUwZUJEN1VNc2plQzFBQXR4clY4RDFsNXZqdE5MNm1nb05v?=
 =?utf-8?B?djN5d0xkWmxTK2VKTGFBN3lNQjhIZmpKa2c3MTFkQXM2L1o4RDdxNko3Nm44?=
 =?utf-8?B?cWprWU80cFpOSWYvQlFtcVZoNDhwdW00bXJ2aHNTN0NMbmJrWEVVRCs2MHo0?=
 =?utf-8?B?Y1JIUTM1bnJUbTJoN3NpV2VrbDIxRnlBOFJqTUFjZzIzbXpUN25KVUU1cDhO?=
 =?utf-8?B?azc4MW1wc28rcndaTDFvTGxYS2VacmlucnhxeGQxMmZzeHV5d05mbE5oNEFa?=
 =?utf-8?B?ZVhQd3hzaUhKYklSZGxwV0FweXd6bmZ5QVVFTlJoUzR2c3RzT2hmRTcxUUc0?=
 =?utf-8?B?Zk9tZ2VONlBnbUJIblZnbGZxbWEycVdrWUdXRkNYVFFtU2QyRDE0Q2g2eGlG?=
 =?utf-8?B?bjFUVHllVlI0WmZRNGdtRGYrSVlVT0hWN2dzUzhqa1l4b1BVY25Uam5RajlH?=
 =?utf-8?B?WGd5R2E5dzZua25nb0tKcndDcFZmZUpJY1dvWkJXZzY4T2xrWEQ4K0Q3cjNN?=
 =?utf-8?B?TzBPWUIyZy9ZWFdhMlltWU1WbHgrOHJaajFpWVl0dTBzNEg2K0RFZXJYR3Mz?=
 =?utf-8?B?MGtpR0F5Mkg0YUtabTNPdHFacnUreXNUVERXYmRyNVNTZFZFcVc3c0JOSDVN?=
 =?utf-8?B?YmxBWUpPcGVjVlVtajdURFUrekhQSnQyaDFEczZ0aFQvdnZtNkl6L2E1S1NQ?=
 =?utf-8?B?TUZIZzFtNzE4dU9QcnpodUh6WlVIaXE5RlVmeTJCTkVPeHBtSlRHa1dXWGlB?=
 =?utf-8?B?c1NmMFJMVlZVQ25LSVIzL0E2YnJuOHozQUxJMDhrRE4xTTZ1UXZxVFN6K0Vr?=
 =?utf-8?B?WEI1NDRXVFJheTBnTy9LNG53ejlFQk10dk5aaUNYQXp2MkhWUjh0VXFoMVlP?=
 =?utf-8?B?bEZqbStCNk9PNHhMRlBlUENlRjVlYk1reVFDV0tZeURIMHZVdFk5UW1VV25J?=
 =?utf-8?B?VEJMOHlVcDhUTU9WZ0xaQ0x4TGY3RmI5SUhSazRmNmxZWWljazRvV1VZMG0v?=
 =?utf-8?B?WTlCT29NbzI3MmpGMUZMZnNsNmdMMStqZ1JnVXNLZGd3UjNLMEMrYk90Q2U1?=
 =?utf-8?B?VXdYVXlWTC9oemxXeXRONlFTYndhbEpIb0JvdXFSRm9mMnBHRFk1VTdnS0ZH?=
 =?utf-8?B?NkVMZkpod25raERueStSeU55cjRUMkZ5dVZyV2NCRUxMVS9aODFRTjNNeno3?=
 =?utf-8?B?RE1HY0gveTBwOFpOSEF4Vk5GVFVlcGRHYU1QVzE5UnBFQlpEU3pHNUROS1hm?=
 =?utf-8?B?eTNFZWZSUmdzeW93Wi9pK2hUNDFmb3VwZUdtWUtudzZUNFVGNGNwSkZxSTUr?=
 =?utf-8?B?OGtuR2hIQ0JPeEtwNERxS3drVVZoQUQ1cGV0aXhmZnFFOWkxNXNEL043Wkg3?=
 =?utf-8?B?Y0dvMnNoTVAyanJIVEdJUVpnbDg5NVFPaGd1R1JJK3l5MVBQRjdmcnMzWUti?=
 =?utf-8?B?UXkzQjVkeWZzUTV5WERnNDFsL0dtMUZZKzYrV1gvNjVjRC9EbjVxRVJjQkxW?=
 =?utf-8?B?WnJMcVpLSmYyVXNONkxRZzllUXN2YmwwbmxJZytUdFVSWWRtK09mZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c95a08f-0948-4074-7453-08dea5279f95
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:11:13.3395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ofAJaBf342naBKApgmhEQlCkdu0n4hOxVMaQpKd1RDsUqYxIXlAfqgNbKKoOje0C6swOjQm35/5ysnOfRiwIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5969

The `PhantomPinned` detection is just a lint, and is emitted as an error
because there is no `compile_warning!()` macro, and
`proc-macro-diagnostics` is not stable.

Use of `#[deprecated = ""]` attribute to approximate custom proc-macro
warnings. A new line is added before message for visual clarity.

An example warning with this trick looks like this:

    warning: use of deprecated function `_::warn`:
             The field `pin` of type `PhantomPinned` only has an effect if it has the `#[pin]` attribute
     --> test.rs:9:5
      |
    9 |     pin: marker::PhantomPinned,
      |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/pin-init/issues/51
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/diagnostics.rs | 14 ++++++++++++++
 rust/pin-init/internal/src/pin_data.rs    |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/rust/pin-init/internal/src/diagnostics.rs b/rust/pin-init/internal/src/diagnostics.rs
index 3bdb477c2f2b..c7d9b3e624fc 100644
--- a/rust/pin-init/internal/src/diagnostics.rs
+++ b/rust/pin-init/internal/src/diagnostics.rs
@@ -3,6 +3,7 @@
 use std::fmt::Display;
 
 use proc_macro2::TokenStream;
+use quote::quote_spanned;
 use syn::{spanned::Spanned, Error};
 
 pub(crate) struct DiagCtxt(TokenStream);
@@ -15,6 +16,19 @@ pub(crate) fn error(&mut self, span: impl Spanned, msg: impl Display) -> ErrorGu
         ErrorGuaranteed(())
     }
 
+    pub(crate) fn warn(&mut self, span: impl Spanned, msg: impl Display) {
+        // Have the message start on a new line for visual clarity.
+        let msg = format!("\n{}", msg);
+        self.0.extend(quote_spanned!(span.span() =>
+            // Approximate using deprecated warning while `proc_macro_diagnostic` is unstable.
+            const _: () = {
+                #[deprecated = #msg]
+                const fn warn() {}
+                warn();
+            };
+        ));
+    }
+
     pub(crate) fn with(
         fun: impl FnOnce(&mut DiagCtxt) -> Result<TokenStream, ErrorGuaranteed>,
     ) -> TokenStream {
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 76cd11bf28eb..163a31ed1556 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -85,7 +85,7 @@ pub(crate) fn pin_data(
 
     for (pinned, field) in &fields {
         if !pinned && is_phantom_pinned(&field.ty) {
-            dcx.error(
+            dcx.warn(
                 field,
                 format!(
                     "The field `{}` of type `PhantomPinned` only has an effect \

-- 
2.51.2

