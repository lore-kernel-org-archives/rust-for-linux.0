Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022118.outbound.protection.outlook.com [52.101.96.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E7B4F7971;
	Tue, 12 May 2026 12:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587806; cv=fail; b=DjxhIJVdPvU4cKyi81b/Mo0k+2cxZkmhaV92oXtYZWy7P77IBuhvbATW443+JFxOK5sbmIMTP9hvwk4m82U5vlUoivRuW8GdRdc3PeT3YZhnk6qyuzFfhnXLGae05dWNOzy6zELwF9Hpw45m9XwOBFajqDnwQwLEtD9CbroiA9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587806; c=relaxed/simple;
	bh=IW6WSZIeMslrlvz2i2TeL2a8P+0L/nbg/s7OdhOKlLM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lv/seidU8ftn3vb3B0sgI1U/gerVh3Bt8eXEa5E13R4uGcEhIir50tdkwCnBv3JWoyumG9JnPZnZwnOBw/2qcCxWIobPEsjAT1MSmEMQs3j4rvEc0UPHHEcagoAw13okk68UxMLySxenlGKLpoU3O/NhsgM1InF+ABNVQsqc97g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=vAX4+oz0; arc=fail smtp.client-ip=52.101.96.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="vAX4+oz0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XN97ZgyIl/2XAI2/Hw/itbAAD/jsaa38tHEnL2D3K8eoe2z0ddTNJtaCp5UIXFvIkT4zDlAkEkAnwdBgYEKHP1Ne1kaCg0ZRYg4yQ3e68cpTigFIriXhWokvULHhgS3it2/5qP7xfoXjp7bgAV9LIjSWsCFe/KShWLFVRez6kELthQGGBENbwrb/ggOKk7t4ji9vj9T/QUN9x0ziSZa7rQY6R11TeuAdblf7nQ5cH/B15DGBcmDsvq7DugbUkYSnzCsv/QxoCl67JKoaYe1c3sDRS/hhSDd18W465/ycTKCjrKKHa/FuPigXtD25ar/OGsEZLIe59fjLf7JjQ/9eeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6QrgC3B4ZdrzfUI1M6XXW1LRggecbi8eIeUfyMSF8o=;
 b=b45k7VQZc2Z0Thms7H3ke609uNHli5L4oSzMXjO0ZoK3W81aNlCgVY+GU5qaFbWzamnjSFpVb8T3tkl7hSB2XyluMAiLkGfNjSSBYdwOfq8loygtMlHRmJPBSY2VJIuiOv90T9C+AKfU/HmM9xZuMziM3YoFM6yhwg60ojyo33oU8B2EMaOkKKdpf0pUA63pjyVGSVdLIjoRj8yYN96eMdxOZ8/TyuJha4C48dZOu01zZC2eH3ZjfTGHghjh6uTS2L2nkqRTpfvrot+MYRMOJxZSzSj+D3IlvhE240EL4sQL9iXO+Ut11D/RGR97+6RxHmAr5LL82eWTMhQ//QVOZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6QrgC3B4ZdrzfUI1M6XXW1LRggecbi8eIeUfyMSF8o=;
 b=vAX4+oz04R3Ptn9f24zu0JVPhYOYgnF3I+TiQzHB0xwgaxsAjwAx6diDoUsrD42vxGVIYKos35BvysDjbeLfSBKl0he/WeMYwm8susP0LLXPGDa/CpJDIMa2DnCbywwSWfz6nENYP35ebeJaRAegIpHQOxNREcGZIorT8yftPfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 12:09:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 12:09:56 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 12 May 2026 13:09:49 +0100
Subject: [PATCH 4/8] rust: pin-init: internal: init: handle code blocks
 early
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-pin-init-sync-v1-4-81963130dfbd@garyguo.net>
References: <20260512-pin-init-sync-v1-0-81963130dfbd@garyguo.net>
In-Reply-To: <20260512-pin-init-sync-v1-0-81963130dfbd@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778587794; l=5392;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=IW6WSZIeMslrlvz2i2TeL2a8P+0L/nbg/s7OdhOKlLM=;
 b=7qpVpDQf5SbdexCRaGCvepoJ7Tz7nfUwtCmQPrNYHn2w/3hyxCFJXeH5RykYR/UFI9/DWh43N
 ANHtVboGP5hDaESgnkea9lXpydY1Fy36vzUDarVbjPtS27vxoQ24/Bn
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5e4752-3232-4c6b-59a8-08deb01f61a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IT9NrKVZsD4KKgOHtN3euOZ9ZIEu41mkvGeeo5ywjYNVaSHS+sVYXSrY1S7GReAochr77sIpoHt/J/nk55aCCXl3J+3egy6bHz62G/uzI4guqosibmMGmKsTS7QBdvEaEbUsv5ZuyRs8c4yDG0NrFxbCVU3r+q9vi+VTqpM+u6Jqihseag5loEmSzoarEB5bgHzS9HwnWl6izQvT4hbyfnUVCvPZX2G3V6FOX8ft7LmG/eDeeT0QlRNDNnpiFL2tPo/e7rmgMjnpKjELWWyAZ1cCwuZcrEtZl8LOJbvjBdpt2l7W0HeGwrkrLDGgDyAwgBaHxpVqBVqikkBFd+HSBme7/dBhtxhj4lxMjeF9I2qhvZqYiy6IUjqbZt2bpNXqCQ94j34SrNHlDWA1XUckbUo5TMh/Yf817wlu+Xn2akaZxa6cJ54nVQe8/nNi/K4FBBSOXpFjCJXlUWmL/Az0O4107Fdt8ydg12Ain9nrsup/ZxaTNufVkoU9+OPUfXuOyh16xnNZMXvBCoJOfJolq8pOF3XbaJzxje69bo9rhtpSPZa3BeF/b5bVmbAxrWLu80U9cOjhjTUyZDouTUoRnEuFFaqh9PbinkSt+Exeg0hHKNpQhyv4fAQHthro2o85XQ5UYiPWl3h/ZDyuuiCudTFuiyvVy/BFcjSKCw8w2acdQD4FUqFMzqUtemt7m5m8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlNvaWJNVC9oYlQzbkYyMEtzZ2YyK0NKYzJVa2VYMGNUc0U3VEYwM09pNjRL?=
 =?utf-8?B?emN6QVptRFFvTktlSW1tUkhEQmU4WE5KNGFlNDY1NVR2bkJ4WGFvQXBVM1Zr?=
 =?utf-8?B?TitLdDNEVHMrTUVMWncrbWZ6WTg2OUtwSVpPaldNRVRuZVpwc0tTOUNVWU9u?=
 =?utf-8?B?NFBkdXc2MElqc0xnSjhaT25rSUtiazV1SWRxZXNPT1pwRzh4ZnFZQmV6VmZT?=
 =?utf-8?B?cndmU2o4Y1dYUlJoTXJKOTVxb1ljNTVhWnM2ZWk0M0UyNmZnZ3RxWmVuUzE4?=
 =?utf-8?B?ckpRbGJEVHA3K3NUK1RnZlJXYzRNMVNSVERUT2lIaFliWldEdkJ6WDR0RzFz?=
 =?utf-8?B?bHpqTHdhUHFGZGVsNGtsYWJsc0N1WG1MQVpMVktNeGhiL0xRMkQ1dERodm1R?=
 =?utf-8?B?ZlExMlNMSXlqbU5IRFpEdFh6aVc0d0pieGR0QWhNci9vNnQ3RjBiNmQ5K0tM?=
 =?utf-8?B?WENmV1NhUm5lQzRpWDNCOEhGS2hvU1loY3RhWUsySGFjTmIweVZpRTlPSU5Y?=
 =?utf-8?B?TEVuNzFzQTE2eENMZVkxZTY0WmdYZWt0M0xPdmtuSUNwekF3cmc5QU5WUXFC?=
 =?utf-8?B?eGtUc1NBK2ZlMkxKZkcvRGJRUDV5WWJzMGVKRFhCL0owUWgvdHRLZ2FnTGw0?=
 =?utf-8?B?bHVLZkJHR2M2SFVkNkx6TmpuSzBOcXBtQXNDQXRqMlhDbXdFdlV2N1FnU2R1?=
 =?utf-8?B?UHk5eFByaHpRYlRsejY0TXlyVlNXd2V2MndZNWcxRHAva0VjTXkvVGRDNWls?=
 =?utf-8?B?ZHFkZVZqMXNHT2hUbEhLUm9hRWs3aEVIZUV2RDN5bEJDdzhRdWdvUTRaMkJo?=
 =?utf-8?B?cE5KOUFUaHhDeDMxeXZ2TnZJWVM1ZUhuQzZ6NE5qNHhxUzhlRDRtY1l1bnRy?=
 =?utf-8?B?a0tFQks1YTRsU1VmcnZjczJhYnNGdVpEUkgwaEhpTTV5UDhqbkcrVUJPMWVR?=
 =?utf-8?B?OXl0YStmN0Zrei9XOWVTYkVoM0REUnBITjB1ZnpVakxkRVZKcSswSHFDay81?=
 =?utf-8?B?V0pkdjhvd25MMzlON3ZZVG9SZlRaTW40VTIxRmxpMlJvc2xwQ0RnZUU1bXBS?=
 =?utf-8?B?M08vQlVaZjhTb0JSVDZCcGpCNjFPclJkVEFveUhxYUNJaFRGeXpSWi84YktG?=
 =?utf-8?B?N1NTK01IRzh4R053eEsrOGk1bVEvbFRRSGVLWTQwMGc3dHk1WkdxL2NSeWtZ?=
 =?utf-8?B?am1UVXgrb3U5STZ3dHY4UTJnVVNDSE1mMk0yd1ZtQk1WNnljQnJBalN2Wmgv?=
 =?utf-8?B?bW85MTRqUlpwUStoWE1wZzB1TTVpTml3SUlicWJ6blVsdnZGS0hBUnBGTy9Z?=
 =?utf-8?B?QzFreFpPb0RkRVJNVkVkclpvakZBZnNKUTcxMjN1T3lydEdoZmFMOEtzM2VH?=
 =?utf-8?B?b0tucm10MzVQc042cVlaQnpnSm1GVUkvaFZYL2JKekJyallFWUdWd0R4TCtF?=
 =?utf-8?B?K1B4VDlFRkI4VXNRYkpWYVhCYUtiUFhhS1d3TGhkT0RucXBYMzZZS3ljYnp6?=
 =?utf-8?B?TTBpK2c4eE1ya1Y5UFZYMmFUaHc0WmE5bVM5TzFSUGZHbkg2UEJQWFFLaWNl?=
 =?utf-8?B?TVpNVU9ZbFRtQWlEZEVzMU1NS1FsQmtsSExYL1M4R1lyZVVUQmNxUEtCNUVE?=
 =?utf-8?B?eEFBaW1ZeER3blY3S3p2amFQajd5ajMrM3VzeWVSVEVCc1pTd2ZUS1BHWThy?=
 =?utf-8?B?cTl3WVBkZlM3QXIxMDhYZUJISDlYUzg2SDhTWERidmxuclJRVkU3QXdNeUZI?=
 =?utf-8?B?RkZwUktzVEVZSFQralFDT1NtaGNFMTFwNmQwZUhPYjBXbzFUMC9Qa0Z4UXdv?=
 =?utf-8?B?Z0xrUCtuZEF4c1R2dENhcmZtUStJRklJZEMwNSsrbnUvYVhnSjBQbVlnSUpR?=
 =?utf-8?B?dUpLbm95MlRaNSttMFhFMXIvSXplamdXSGswdXkrR3haSGRvR1h3Y29waHY3?=
 =?utf-8?B?bGNjazFpaDdudG82ZitqOVBzT216VWo0cUg1LzBVUG9YNjZmdEZnNEtoS0Rm?=
 =?utf-8?B?TnZJQ2d0bGprcSt0aFBIa3ZrTGVBTUlEYUl0amtwa0JzL214OERjYzRrTjFs?=
 =?utf-8?B?aFh4R09NUWs4ZU9Ia3I5RXQ5cUYvTFNKN01jamJQemsxY2IwTkl3RVdEK3BS?=
 =?utf-8?B?ZmdGeFpIMU9TdFYvemFrQ2VGSkFpV1F6WGN0S0dpMDBoNVVxb3E0MDZFN2tn?=
 =?utf-8?B?U295N290eWZpNlFLcHU3NW9NQXZOekg5WEFUejRjT2ZKWm9Xa0oxaUR5WEtN?=
 =?utf-8?B?TkcrZTlFVmVZOUpTSTQzcTdDdzNHbkRBV2YwbXhBcExoZkdmdTZnVmRQYjMz?=
 =?utf-8?B?dE9Xc3d2MUtCQmMyb3lTdTZuVjVxeTVzZWpBOTZJaERDRmJnRE5wQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5e4752-3232-4c6b-59a8-08deb01f61a8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:09:56.2840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INV0MvHhTIiBpYtCdB318pzS8p0VKDCahBU2DATjEb4kAeVZubOIrB99viF1iLzYDaBjh2gBcTn+QbA6w0wkYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6214

`InitializerKind::Code` is a special case where it does not initialize a
field, and thus generate no guard and accessors. Handle it earlier and make
the rest of the code more linear.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 100 ++++++++++++++++++++-----------------
 1 file changed, 55 insertions(+), 45 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index b0bfe44695e1..7eda1bcf0f28 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -231,6 +231,20 @@ fn init_fields(
             cfgs.retain(|attr| attr.path().is_ident("cfg"));
             cfgs
         };
+
+        let ident = match kind {
+            InitializerKind::Value { ident, .. } => ident,
+            InitializerKind::Init { ident, .. } => ident,
+            InitializerKind::Code { block, .. } => {
+                res.extend(quote! {
+                    #(#attrs)*
+                    #[allow(unused_braces)]
+                    #block
+                });
+                continue;
+            }
+        };
+
         let init = match kind {
             InitializerKind::Value { ident, value } => {
                 let mut value_ident = ident.clone();
@@ -283,55 +297,51 @@ fn init_fields(
                     }
                 }
             }
-            InitializerKind::Code { block: value, .. } => quote! {
-                #(#attrs)*
-                #[allow(unused_braces)]
-                #value
-            },
+            InitializerKind::Code { .. } => unreachable!(),
         };
-        res.extend(init);
-        if let Some(ident) = kind.ident() {
-            // `mixed_site` ensures that the guard is not accessible to the user-controlled code.
-            let guard = format_ident!("__{ident}_guard", span = Span::mixed_site());
 
-            // NOTE: The reference is derived from the guard so that it only lives as long as the
-            // guard does and cannot escape the scope. If it's created via `&mut (*#slot).#ident`
-            // like the unaligned field guard, it will become effectively `'static`.
-            let accessor = if pinned {
-                let project_ident = format_ident!("__project_{ident}");
-                quote! {
-                    // SAFETY: the initialization is pinned.
-                    unsafe { #data.#project_ident(#guard.let_binding()) }
-                }
-            } else {
-                quote! {
-                    #guard.let_binding()
-                }
-            };
+        // `mixed_site` ensures that the guard is not accessible to the user-controlled code.
+        let guard = format_ident!("__{ident}_guard", span = Span::mixed_site());
 
-            res.extend(quote! {
-                #(#cfgs)*
-                // Create the drop guard.
-                //
-                // SAFETY:
-                // - `&raw mut (*slot).#ident` is valid.
-                // - `make_field_check` checks that `&raw mut (*slot).#ident` is properly aligned.
-                // - `(*slot).#ident` has been initialized above.
-                // - We only need the ownership to the pointee back when initialization has
-                //   succeeded, where we `forget` the guard.
-                let mut #guard = unsafe {
-                    ::pin_init::__internal::DropGuard::new(
-                        &raw mut (*slot).#ident
-                    )
-                };
+        // NOTE: The reference is derived from the guard so that it only lives as long as the
+        // guard does and cannot escape the scope. If it's created via `&mut (*#slot).#ident`
+        // like the unaligned field guard, it will become effectively `'static`.
+        let accessor = if pinned {
+            let project_ident = format_ident!("__project_{ident}");
+            quote! {
+                // SAFETY: the initialization is pinned.
+                unsafe { #data.#project_ident(#guard.let_binding()) }
+            }
+        } else {
+            quote! {
+                #guard.let_binding()
+            }
+        };
 
-                #(#cfgs)*
-                #[allow(unused_variables)]
-                let #ident = #accessor;
-            });
-            guards.push(guard);
-            guard_attrs.push(cfgs);
-        }
+        res.extend(quote! {
+            #init
+
+            #(#cfgs)*
+            // Create the drop guard.
+            //
+            // SAFETY:
+            // - `&raw mut (*slot).#ident` is valid.
+            // - `make_field_check` checks that `&raw mut (*slot).#ident` is properly aligned.
+            // - `(*slot).#ident` has been initialized above.
+            // - We only need the ownership to the pointee back when initialization has
+            //   succeeded, where we `forget` the guard.
+            let mut #guard = unsafe {
+                ::pin_init::__internal::DropGuard::new(
+                    &raw mut (*slot).#ident
+                )
+            };
+
+            #(#cfgs)*
+            #[allow(unused_variables)]
+            let #ident = #accessor;
+        });
+        guards.push(guard);
+        guard_attrs.push(cfgs);
     }
     quote! {
         #res

-- 
2.51.2

