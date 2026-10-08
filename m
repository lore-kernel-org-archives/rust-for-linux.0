Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021110.outbound.protection.outlook.com [52.101.95.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B1B3D0BE9;
	Thu,  8 Oct 2026 19:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487619; cv=fail; b=r5meu8kqywZ/q0KIMP2tq5j9JCqjOV0rzZUP6AnIhCmxew1D80s57PJUKtAFshXSr0FvjR5iGSANaJbIWJk40GaMNOJOeg8aUP9jucKJcO1MVu7tP1bOulwrox15FCvq2U2chvRY1PORDWM859GHUeOqbhWuBZ0HcxLMRYG62tM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487619; c=relaxed/simple;
	bh=89zLsiZCbwSQSC7oHXakd/Yyhd1COjd747k+GAUZTGA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WOQzeO3La9dCmEV3n8ulh7lO0CYkiDqGUMD025o01c566QWvlq6CwIXN/MYMjgLkMlA1m3utsQoHCwm7Ih/8+6Vfxnx44wy0TPcGJXyNOLA7MPq/0iBziRTCKZky8EksiyqrjVrEofvNvSgV/2l5IxTDoPsEmOU9sVJQFYpUsws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FibwAQX/; arc=fail smtp.client-ip=52.101.95.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FibwAQX/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W92K7Ygc9IBFyAL8mEH46/Gr27K8EpzUkKomIb5vwtAFwo4iAGbOdI1gO4OkTaftyo/SEGRFl9rjDWRU1n7VtW+VzeA29LIPX4/OreS/lIJIAZfN+dMJUmWJPP+BQVjAVF3szJjEaJA2vqCHPbWnKb4lJaPBUSs6wL9YnUhV5wqvLXX95x+nQg8j4vL27iaueOy5pJCZxsLUwgL3PrIqf6LX2/ONp5fGGdY914dAQvJhP5jq+wxmlw+KLDNu2kiQ+nhYzRd5IcqEqug391tIeWSMsVYOZv7b83fzWzhFHbZSAf5IWforYFQew16BUrVIa6+NHdM/CwLvZXDGR3y93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbZAgAgUvdImKW9mdInTU7NoR8cobo/vPLAk9y3P4xU=;
 b=bwbY7knEqzo8BvsUcY7v51wC+kF4kMpBoj5bIB9ljBbXWa28ORfqBxjtYz/tuvCqQiFPHzjiI/5c/WngXDB7MDCCMNCKxz7i0ykb89QCO0t3x+QHZEZom2kTzMuTfSKfXmLRvipRPYd7Ii4hqXYSCxWmhLYJMFomFA4egKf5k/cbS5xegWHRuL2oOWQjbnVe3T5XcFNjPRzYI1RT/hXSYsdYOXZBLPvn//ujwm3puKE0Gu/IGX2/3pJttzvt3VRD8GgazGLxnmhkj/UFTrUNdCxbI5AG1ATPfw4QNywleRDDwnrDLIiWakPorRaZZy8kS5qziIH9DYgCKUD6q6C82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbZAgAgUvdImKW9mdInTU7NoR8cobo/vPLAk9y3P4xU=;
 b=FibwAQX/JjbGeLUZGvo03jy230awZhs9qX9tQoAijwNy/lKbiQ/ChCfmY+MP/HCewy4l6bymd8/UcBWvS88jXp9iL7uv5Xhw5FucORyW+XAy2OV9N6fxH+2I0jh4gXlzQF5BtrT/wTf0KFCupTUbqfkixBWFzabSdRubTPZwY/Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:44 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:43 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:28 +0100
Subject: [PATCH v2 04/20] rust: pin-init: internal: pin_data: pin borrowed
 fields with wrapper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-4-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3793; i=gary@garyguo.net;
 h=from:subject:message-id; bh=89zLsiZCbwSQSC7oHXakd/Yyhd1COjd747k+GAUZTGA=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcff5cf3Jkk8CHuXc+9zAgP7QoOg29c+zfa9JiasN
 ptJ5oYow+uOUhYGMS4GWTFFFo9uxrRNjLNlL2uVv4SZw8oEMoSBi1MAJrJfm5Fh5cxspeuzIvxO
 RkVullCUFrkf+8PkrIB22ezsON9vLjPLGf5pKVU8z/TI79C9ZHj2TNmp1fHtlg+cby0P/ZSfK3f
 5YgojAJ/kRo8=
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
X-MS-Office365-Filtering-Correlation-Id: b92deea4-510c-4bd0-d87e-08df25721626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|18002099003|10067099003|22082099003|3023799007|921020|260925022911599003|260925021911599003|260925021311599003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	RIynw66qONqaD23de0m0t2MN/A+X+XfEeXVnpC+3nRk/FqPILf0VkOl/p++4aI6qFWLFEbwo3GS7+z9LBwO19kOQbM6de9qGc4jwi7RTC2/JddLuMlseel4tmZeqI6So1P9UiLIN2w8JjUhcOuKJC2Fq6uKvfg2teHtmeTLxzR26lRVmGBvMSgr1uGEwOBjlGZz3HbSA516/rw2q+8sVFh5wAcSSTuOkpW+d3usGDRNORHfkYDScYu56Ttz3ZOHGrUMA4+hRzYhx6KPhYsL2zamA2qRHtv106snwusnryhv6j5ZOFeRMZRF+qgGVsQaVrzyCN029qhb+1Q3lPhiLxZGW1AqQxYHCj78jlFY9IX9n7vxX6s8Z7x6+NDgJJjQoHTdlSncSVj9i+ZHPFIEaoPmR0a+xYu9OZzs9GjsaOatwnioPMFby8FWvI67LyXa/ubBEfm0Azy/uTKJFP5wn24s356CkLOXu7d/33WpaH8WU+cXvgZ3oZ1GdhztvenKe9vBth6Nznt6Ir4gXga2U7ZmhQSDjb+ZRA4QdVBQUdSBXZsutj8U6DDzApR++wTn4w/yOgDR5ziSixA85ytyQvqUMsVs1L4FceEKBoo08+lhhtzMZOWepGEq2VHE0WVgK99jWPvxsm48C8kqky4ZYgqhZVLTkXC1Hq8HrdFu1PwI2RZtcVYoUgx8Ce7F8BwyMKUew7oRT7/yq/gnwNjDbYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(18002099003)(10067099003)(22082099003)(3023799007)(921020)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkFoWFVybnZkaDB4RXFWWnU3UWhybUROa2RFVzdjd3JKVGRkQTBBcmFyeFha?=
 =?utf-8?B?UWZuT3UxelEyc0hXSTNNRXJ1TXhBNG83MjgwWnJHQzcxbnR5WXJDWjRVdnVX?=
 =?utf-8?B?N1gvYWtDaG5aRENqU2ZYMGJDdmxLcXBDMExzSnNrc1FuQlF5OWRtbWpZM2Mv?=
 =?utf-8?B?Ni9HejNSdG1uaDFOVHZOQ3lzLzNUVWtVWnpObVZzU3RMZXJFNGRFdWNLcHh5?=
 =?utf-8?B?WXlqT0NZWGFGT1FhQVlvcnl4ZVQ2OHJLZ29ydVV2SlVnOHp2dUNaNDB2Ymow?=
 =?utf-8?B?N2RQVVVuNGJ5MmY1dFNkUFRDSlpnMHZkMTFXeEZ5RnVkSEUxOXpUYThnTXp5?=
 =?utf-8?B?TkwzS0dMOFNLVmRnR091WmNyR3pudWNBYzM2TW5VVkFZeW5YUWJQcHc1dHVa?=
 =?utf-8?B?b1llMXloYy9vOFdlU3ZmQ2VzeDFOWmYrdjFkQzZWOXduSVJwTDM0LzI1WWZW?=
 =?utf-8?B?d0tGUDBKcWY5aEFYbEg1eXZQallaVnlReU1TWk1obmE2K1R2UjlqY3gxMTBB?=
 =?utf-8?B?c1dzQ2RkbC9nR1g3eVNibXVmZ0Q1SGtSNGJtZk5xVUtkN1kyQXdoUmhuL1Jy?=
 =?utf-8?B?NGVYWW1WS3ZYcGU4Sk54OFk2cTk5bjRIMzRpNFVXZ0Jqb3BsZlVVQVQwSVph?=
 =?utf-8?B?a01JU2ZKMzM2dUVTV3NZdU9WV0ZneWRqQStMYnFPRjRaU05FcStEREZocDZY?=
 =?utf-8?B?eGc3VSs3VEtBRWtpNTRJNW5pazg5ZjRwem5UOWZldFVodkFSS1hGUGtlcnBu?=
 =?utf-8?B?TGtyVnpLMEVIL1BOR0VSVVR4THU3eTZBUGF4MElpZDlXZWdXVkp3VWNFZGpE?=
 =?utf-8?B?NlQwT3NYREx0Ui9MbS9DcGNWWTVibGczVlJqRVdIdXhUZ2l0ajFucmlPcXhQ?=
 =?utf-8?B?SXY3dW5INXlFMWF5aW1raHRwaThYeUw5TjNjVVNLVjFtL01TYVd1ZE9xUWVW?=
 =?utf-8?B?MGJMUWNWYVlCcXhnVTh6SHNtQXV0UGhpcGdjbFd6bE1CKzVBVE84K2pSdzJh?=
 =?utf-8?B?aGFLWmE1VndSZWV0SGliK2pJb3hPeVkxQ015bGRydFFuVk5UOElpbjNhKzlt?=
 =?utf-8?B?V1JIOGZVMGtsSDFXZ1BUY0FhVXp4WTNOSEVYOUdlRFllVHVsaE1vcStqQmRq?=
 =?utf-8?B?QmVDOGdJSHduTGpMTDJSUjdDQzk2a3ZOWEdBazBKVnNROU1yQXhIWWJqaW1G?=
 =?utf-8?B?YWF5TDlySFBOYkhOQmFVbkcvdFNvQjZlSi9OVXN6clZmK3loNFUzTnhKbHhp?=
 =?utf-8?B?ZVpvNjlRMzJoNUtLajFVZVVXQjBIRmxJRDZORUwwTjVDbUJySVloYTlrdEZ2?=
 =?utf-8?B?M0ptdWtCS2ovWWF4blRiWDNNQWN6cUkwOEZobHJqUUYxZlBnQkFha0d4SmxE?=
 =?utf-8?B?ZmhBck5NS0VrWDUveTQ0M0tvN3JsQzlhamkzZDg4YTdrVGVqU04xNzduNWdX?=
 =?utf-8?B?ZDRrN3hudUlkSDltaFFyeU11dUg3VjEzSFpvZWd5ZVNVemU4T29YR2pBazhz?=
 =?utf-8?B?VTJQYWQ3MXU1UU1vbGNteElIRmdwTm4wbWNJNU13Yy9wMjlPNEpmZHJjNHNK?=
 =?utf-8?B?RmtYQ1o5NDdySmJiQUhhSzBFVUlEZ0hXUEFkclpmUVBWKzB4cUc3L2pLZlRr?=
 =?utf-8?B?Y2NVejVFRUtjSVBlbytVSTdrOXpEUVNZME43UEVWaFVoU3hOWUlMWVVoR0JO?=
 =?utf-8?B?RUJhSnUyZ3dkWGhZcWFYSVhiY2tlN2FzR1BDdThqekFVanpKTUo2OWY0eVN2?=
 =?utf-8?B?NklrOExSM045UnQzQVhPblpxSjZLVTQ2YnY1NFJ0VGFHV2ZTNW1RK3JMZkU3?=
 =?utf-8?B?dVFIV2IxTjNxdXIyUmx6RmE1UXRtRHExcW0wNS9EWGI1TXdicHJTSEdid05W?=
 =?utf-8?B?S0Vrd01OL0dZQUtCMlhQeXRKRkl2U1laakdpa1FxOGdEN3RMZGJ1dXRnWlBL?=
 =?utf-8?B?WDZMM1MxckZzL0Z5aDNObGN3TGRHbVRveEY3ZWNseHczRmk4VUgyYU1ZbWRM?=
 =?utf-8?B?Sy9RWVB4cmNuYjRjU052ellNS0J2SS9pek9PSmRTNjV3dlJaQmZFV3E2TEdq?=
 =?utf-8?B?Z0ZWQzAzeWJpZHZocTZGVjczSTFQTE1ZSjZDR1U3bkVjLy96RVlkelk5VDNZ?=
 =?utf-8?B?ZFIxWFZCdDJITGJJZVhzL2JzUmNlMzZIL1hpbmFhWnFtQ21GOEtCOXZKVmli?=
 =?utf-8?B?dEJsUlZEL0VXTVpvSmN2NXdHV2ZqeGpoRDVqcW9yUEt6aEZKblgwQzlhUmZ3?=
 =?utf-8?B?K1ZqbjlZWlpScjU5ZGo5S0VqbWJPQUhGVVF6SnZ1cXNLUGJXc2tHRUhiL3Yy?=
 =?utf-8?B?Ym5aMUhVZEhpSTNlSHVzbFpPV0EvdHJQYmJNM0VXcG1vRlo4d0lZUzhTRXhr?=
 =?utf-8?Q?KJ12KDbH0mfW8nlw6xumpT+iRIzEMFTNtLFP7uaxYSBnX?=
X-MS-Exchange-AntiSpam-MessageData-1: oatRZerUnHB5sg==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b92deea4-510c-4bd0-d87e-08df25721626
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:43.8902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4PVF6a46bPdmHezcfmY5mZ+9K/1in7XdaVNoWGy4Fqd9HYqveDJ3SOQycqGq52zZbDs5W6TspT7iz9s5rVkvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

For fields that are borrowed, a mutable reference to the struct no longer
mean that it has the permission to access these fields. Therefore, the
memory that they refer to must be pinned.

Wrap these fields inside a `Borrowed` struct which pins it. They may be
accessed directly (if they're not themselves referencing other struct
fields), so implement a `Deref`.

As such fields are always pinned, there is no need to generate a
conditional `Unpin` implementations that implements `Unpin` when all fields
are. Simply generate a never satisfiable `Unpin` implementation to prevent
user from adding their own.

Acked-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 19 +++++++++++++++++++
 rust/pin-init/src/__internal.rs        | 19 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 36678843251c..a3e492c455da 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -433,6 +433,10 @@ fn generate_struct_def(info: &StructInfo) -> TokenStream {
             ty = quote!(::pin_init::__internal::Erase<#ty>);
         };
 
+        if field.borrowed.is_some() {
+            ty = quote!(::pin_init::__internal::Borrowed<#ty>);
+        }
+
         quote! {
            #(#attrs)* #vis #ident #colon_token #ty
         }
@@ -468,6 +472,20 @@ fn generate_unpin_impl(info: &StructInfo) -> TokenStream {
         .map(|x| &x.predicates)
         .unwrap_or(const { &Punctuated::new() });
 
+    if info.self_referential {
+        // Self-referential structs must always be pinned.
+        return quote! {
+            #[doc(hidden)]
+            impl #impl_generics ::core::marker::Unpin for #ident #ty_generics
+            where
+                // the `for<'__dummy>` HRTB makes this not error without the `trivial_bounds`
+                // feature <https://github.com/rust-lang/rust/issues/48214#issuecomment-2557829956>.
+                for<'__dummy> ::core::marker::PhantomPinned: ::core::marker::Unpin,
+                #predicates
+            {}
+        };
+    }
+
     let pinned_fields = info.fields.iter().filter(|f| f.pinned).map(|f| {
         let ident = f.member.as_ident();
         let ty = &f.field.ty;
@@ -475,6 +493,7 @@ fn generate_unpin_impl(info: &StructInfo) -> TokenStream {
             #ident: #ty
         )
     });
+
     quote! {
         // This struct will be used for the unpin analysis. It is needed, because only structurally
         // pinned fields are relevant whether the struct should implement `Unpin`.
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 0a8247473cbc..74dc23506d97 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -5,6 +5,9 @@
 //! These items must not be used outside of this crate and the pin-init-internal crate located at
 //! `../internal`.
 
+use core::marker::PhantomPinned;
+use core::ops::Deref;
+
 use super::*;
 
 /// Zero-sized type used to mark a type as invariant.
@@ -462,3 +465,19 @@ unsafe impl<F: EraseLt> Sync for Erase<F>
     for<'a> Erase<<F as FnOutput<(&'a (),)>>::Output>: Sync,
 {
 }
+
+/// Wrapper for borrowed fields.
+///
+/// This should be switched to `UnsafePinned` when it is stable.
+/// NOTE: This type needs to be covariant; Rust's 1.89+'s `UnsafePinned` is invariant.
+#[repr(transparent)]
+pub struct Borrowed<T: ?Sized>(PhantomPinned, T);
+
+impl<T: ?Sized> Deref for Borrowed<T> {
+    type Target = T;
+
+    #[inline(always)]
+    fn deref(&self) -> &T {
+        &self.1
+    }
+}

-- 
2.54.0

