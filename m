Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022118.outbound.protection.outlook.com [52.101.96.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E453655DD;
	Tue, 12 May 2026 12:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587821; cv=fail; b=MpoHId7hg4qi3+yU3eO+Xd8s30KxZyDJ2sVd1I37N0RxpDidY+2e8PZM6g2pwyca/zFTjahyj0YSQXLiSvY1TdcVv2BhXlmYYMKhr8As0l2NgcxUa/DcyFaiYrXRT7ZHDPZYNUlmEaxVmqugnxv/IV89kzPqIFyqQ8KmrIMV+AY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587821; c=relaxed/simple;
	bh=Vo6V01Fhj94yZyW43dFjZfz/SVYXi6zvs5dXn9V1yCE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fSYwZzFEOfqrh8LG1VWf/BEMGBEsPauQD81/SQgsYNv923LAWuW5Rc4Y1lqMBWydECGUknbglNoZnPZbHq3UZwXOfug/ppYf+Q1JJaMeDFViTwH9t+/DRO+V5SFlfBsGnMpOFnh9cZHrxyT1CvvDG3Gcx5nylcO+S3EvtjPiueY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xhLbTqWj; arc=fail smtp.client-ip=52.101.96.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xhLbTqWj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygrcK1We3YRiVUTCdS2Tx5WT8mEEdMGSUB2ONrP7YUo6YaTWhaTl15r466ckzIeUHj/Xp3RE76EznKTTA9Yv1Eq+VD6DiI0m2PO4QtQdQvGSUYaC4iJdJgcysIbknaUxEKqHcYWbKq70U6kkaQctZfgE2IlDMq8FIqFoPNp0yYYxYIDTplndY8rIAPISRxkZSPE1zm+zTp+u5wRgaMQH5sUaL+qYod4PeqNRdfgNLhC82/cKGEJJKUC8rdF2oZOggjV9NemY4CrUS3DWQie7I98anY30KFpOX+ofHEVVqHLunCSrww/SXxnIWHiLGLjdhjz3Gg6dpc287FD5vir+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+HhlVoRwmFDZCMWEimYCl1mcr0pdkVcFl2SqieMajk=;
 b=Ctigvj8hu/1UmwqpbHcjtMlFPeBwn+yMDF9ATWg63rcX7/oUbGwDhwMra1CKXHFk8V27TjfSlLCfCsF+Qfh1knF10s+GOFm/QCGK+K3sLE1U/C5Wn1NFo0mwvhS17pExg24I9SCUKjw9f++0cyr5iRTgqU9Pp2Dr94+zfZeS4aFjHQlGXqARCLNAXDS7SZ++fzZnCoZBqZstWFiXCNu2zuaW5hTxFOqgvnzt+IThlaioSZYKOFfCipu3aLWEcYXrzWvwTzHLa31ELccLzwUNz2tqbQ3Gm7uzBbKzzhSZ4CJcbjvgIKa+H3yiaRfLRPgEKV6AF5s35bjB/fxQDleplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+HhlVoRwmFDZCMWEimYCl1mcr0pdkVcFl2SqieMajk=;
 b=xhLbTqWjN9aLGhpy2Arv7lTOA7yjMTbfI0YnIDF/9UxQUpWoi2soSpaAy6jkOW80/Pdg4bBI5bdiCMQHM6DKQhGzivgfTKpQTtm4kNMXNYPfU2sap1ZCvg7sU2zsxeFHNz8skJr3DUhSHlti8p/P7MGIbBQGXyo2xpfr/FfdXQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 12:09:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 12:09:58 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 12 May 2026 13:09:53 +0100
Subject: [PATCH 8/8] rust: pin-init: internal: project using full slot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-pin-init-sync-v1-8-81963130dfbd@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778587794; l=4230;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=Vo6V01Fhj94yZyW43dFjZfz/SVYXi6zvs5dXn9V1yCE=;
 b=tFZa8GF+JQizmGG+wibAINtzrvx95BJdp8HtwrjT7TpZCFX10WKWOdQtwjF75wJfBMfTe0URH
 dkq4e4SXcjcAacZ90l4Da425fPdqTmxWzugERSWPitCOGVEKNKyCqfD
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
X-MS-Office365-Filtering-Correlation-Id: 3a01aadc-898b-40e6-03fe-08deb01f624f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3CelxgcNPd/Av88ELXS+iy5ZAvhPeSWsmu/kpSU74Wcm7N11BRGOBYo6WW+KwKk8qbOzCaiPp6/nq94j47SZguaQbHgL3d81TmVNbH9bBZQd+TPPVuOOlaeo1j0nycfkfRYl478tLtrwM43TGiTA4EAXQCKHDMx2KjTqaiaTLF7BAy8pr9AJ+R53V59xd4hwLA4bj76cGkCQocGnbpMWzxmjtBUtu2wVmnUOa5N0MaIXRTqySaF5/s6kxbw/+RbjarQAcryqZV6YYzCQQv/M4VIWORrr1/xJ9JeXToberPz8ne6vr2a5vKX9CEcj03yr7ljE8fFbppOnH5bSnFMf9fjpzzbIbW+ggtLaqtymHbqQ4IjkZKOBdWMCViW3x2xH/rXegWZ1qW8DIQNg4tcbUncF/2LCX9fhZW+5MuIcN/h3KqH+9cQ4XT7jw7PqpIEsuEUkqPZvO6+cjm5Ot6WmY+YvyndVc3+R3eIx4ZGbsxBjxpxg/0Ln7CVNCHprPATkVcSmGC4Ybte2SYLB1Tc2CE8q5uRkDuTVWk1Ek+js1li1tRhpxo0bUt2p/5DDzIDaORNhzhXO19yKlFAyYBlPIYBexbRwiO1uHqJA6bHSj20UD+ID5L5pyfDEnviVqUZBN57705hHeJOVycVA2sOOvVIzNOY/T8zuHGi0eaFb2uHKWPMAdBwgExRYewCkR2XQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zkc5YkxrZjk0QjZPdW5DalpSUGZRTE5JZDQ5TlUyakpwcEE0OXJrMXYrTDJw?=
 =?utf-8?B?RkZtK2tuMmpSZUlxcTQxcFBnb2FjV3MxYjBXUkx3eHJ6Z3BtRkoraXBZRW1l?=
 =?utf-8?B?ejF5S05meG1id0VmeXFuZ2FpZE5hU1d5VStOMEFlMTZ4QitOdmdUa1NreG91?=
 =?utf-8?B?TW1iclBlM3dNK21vbEh4QWNxaUVaQ2o1V2NlTzJkVmVJZGFGdEZvc0FWclNT?=
 =?utf-8?B?ZGlwdFBESVd5djQyVldvRXE5VWFlejFhbVdyeXNXRnJBdDA0QWJpa0c4ZHhY?=
 =?utf-8?B?YXA4YksxNGRYUFVHczJsQURTU0xkYUNpalU5TGt5WlIwNzhiK0ZDTkNhV1JU?=
 =?utf-8?B?cDVXT09HM3R6K21uZUt2TGZvb1pZRzY2a1ZvN2F1cEo0bGZEbGhhWCtKcnIx?=
 =?utf-8?B?bk9IM2lwTUE4aFFJWFJDY2NSVlJKTmxXdVlKRGg2L1lWeHU5b2RlV25td1VJ?=
 =?utf-8?B?RTVqN2NzYzFKekd2SXlZdEhJTTc2QjN1R0tvVkdLVUhwTWdkVjVRYU93Wmc4?=
 =?utf-8?B?NndrMmUvU2tTVXRlTHZ6aDNlY0FPSlBDT0srdnpZZnVhdHl2ZHBrTGl2a1JI?=
 =?utf-8?B?QkFIbis2WW9QanNrOHZ6NXdwUWdFaUR0NHdNanUwVFlSS1Uzd0JWeFVPUTVL?=
 =?utf-8?B?VTJ4R0VtcmlMa05jaDU2QWd1WkpzK0hnM0d0MWVJRG93VjdyQlNJTGJMd25r?=
 =?utf-8?B?Z1M4eEtiUzFERVk0V3FtdVpxMXpIeEtRYWw1M05DN3c0SWJxU1I3OHJ1STRX?=
 =?utf-8?B?UHdld0pROVpBSDl4c3FoY3lKWVZZbkIydEFheFNMK0JoM1NheGgwV1ZiQ0l6?=
 =?utf-8?B?M2lVSmVFWkVYWDIyeTlvOUQ2elhrNyt6ZVRGYzVrOUhubjY5M0FnYWw0bzF4?=
 =?utf-8?B?WjUwbHE5Q1Z3cmtoRS9VMFB6TStGZ3pSSlFiUitHU3FiaW90RWxiSzdQVzBB?=
 =?utf-8?B?ZVl6RE1NRE9YM2p1UlpnVlhVOHZJVUNFTGtKTlQ0a0FmK3haK0RpT21ncmRh?=
 =?utf-8?B?TUxXRjZhbzZ1QUZsNFV1MlR4WmVCMmIveG9qRzdGbVluTGtXVzI3N09DZmpo?=
 =?utf-8?B?UDhqK2ZkeVFyeGIwZUJ0cUlOZ0ozV0p3WndwbmtGbTFULzV0Rk02bk5IOTdI?=
 =?utf-8?B?cldEc0Z3MDVsQ1VESmYzY3dneWMwNEJWSk82cXhXYWRxVnFvY0JtcmlpcUxt?=
 =?utf-8?B?RUV2USszR0tYOTBjWHZUUm5sL2hCMHBQM0VCN2gxM2NZOFplRktMR2tPbENn?=
 =?utf-8?B?cXBWbmxRbkdpUG9XbjVyVTVHMGQ3bkNaay82am0zNC8wRXN6bWo4M0JWT1pt?=
 =?utf-8?B?QkxzbmJNK3VUOGVoaWNGalpBU1YyY2V1VkxNQ2szSS8yTkxGTmk4bkVneUpN?=
 =?utf-8?B?NyswVGtKM2UrUmp0bytPVEs0YmlMcmpzQ2d2Y3hlS2hoQ1QyUHNrOWhITWdk?=
 =?utf-8?B?ZzlQdmhRcWlESG9XSWlnVk5TZEZkUTBNaUlHaExHQUhkL1o2QWFHNno3cE4v?=
 =?utf-8?B?Um0wa2ozVE1vbzQ3UWVUclR6YytmdHpuSXBibWc5dUZ2aEczeExsOW5GYTdv?=
 =?utf-8?B?OU5mZFkxckVxY3RBVzh2YUZDYnY2Qlpmcy9Ydi96Sk0zd2c5NnVqU1J3enpp?=
 =?utf-8?B?Y05kb3daM2VnMnE5WVdMM0VkV0l5N2k2aXhiVHlPZ2JRSTFMZGJSeUJHRUdq?=
 =?utf-8?B?WmRwRUtVMXRBUnFHTGNBK24yZGVJVlg5YVF2MytLM0dublFqeHBQdDV6L3M5?=
 =?utf-8?B?aVRNdVNOOXZwd2xKRUVvanpRR2ljRnRCZy92ckEwYXFuTVZoWTNiNndSSFMw?=
 =?utf-8?B?a3dnY3NOTXNHd3daL05MNnFGbU8yblUvc0NTUjRJSDFEMUZ6d1ZPYzMvT0tJ?=
 =?utf-8?B?SGUyREdMOGtuME9YckxCVlYzQ0s0QU9OTWZUWUZKc1hWQ3QzM2Rqd2lOQ3RC?=
 =?utf-8?B?WWR4cGVPYlZxY3VlSVhZZ3lRWWJ5N054T1FkaENmbGlaUlhtS2tXVzkwOWFS?=
 =?utf-8?B?LzhpdlRidTFjRlF2UzNna3NrRzNKZkR5UjUydVU5anNwUDBad1kycUtzL0Fm?=
 =?utf-8?B?cGY0S2VDZlBoamRvVjBxNjVESzh2dTg4V0tlSVZ6Z2Y3eUJKc3BYb3daUEk1?=
 =?utf-8?B?SVJncFJaRHo5YnhFSFdOSVJ2Ukl1ZUNoeXJYTERkWXdzc2plWmlEYzZIZUVq?=
 =?utf-8?B?MTNmalV1K1FiaHpOSGJMN0swZVREUUVwSFpTcERDYTBKVmZQNUIwcEZUcjFh?=
 =?utf-8?B?OFRPNnI4VXoyQUxsajErSmZWak1GMm1pdzA4bXRuajFKcUVPdExlb0lid2tx?=
 =?utf-8?B?NlVya2xBVUZzb1ZuRitHSVVPM1NQZThLd0FkRW9aSEZMUU1YWTBEUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a01aadc-898b-40e6-03fe-08deb01f624f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:09:57.3755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uA7G4O8d2I9hZN4rgG8ZTDvzQgNo+w2FwyzIx4ms+RkfU0RqOxs9CZtPtE2dgYGLGdV9Mqbc0O8Yo4bVB9+pMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6214

Instead of projecting using pointer to a field project the full slot. This
further shifts the code generation from the initializer site to the struct
definition site, which means less code is generated overall.

It also makes the safety comment easier to justify, as now the projection
is done by the `#[pin_data]` macro which has full visibility of pinnedness
of fields.

The field alignment could also be checked on the `#[pin_data]` side;
however, since `init!()` macro works for other type of structs, we cannot
remove the alignment check from `init!`/`pin_init!` side anyway, so I opted
to still keep the alignment check in init.rs.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs     |  5 ++---
 rust/pin-init/internal/src/pin_data.rs | 12 ++++++------
 rust/pin-init/src/lib.rs               |  2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index e6f5ea06f91b..699b105570a5 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -245,12 +245,11 @@ fn init_fields(
         let slot = if pinned {
             quote! {
                 // SAFETY:
-                // - `&raw mut (*slot).#ident` points to the `#ident` field of `slot`.
-                // - `&raw mut (*slot).#ident` is valid.
+                // - `slot` is valid and properly aligned.
                 // - `make_field_check` checks that `&raw mut (*slot).#ident` is properly aligned.
                 // - `make_field_check` prevents `#ident` from being used twice, therefore
                 //   `(*slot).#ident` is exclusively accessed and has not been initialized.
-                (unsafe { #data.#ident(&raw mut (*#slot).#ident) })
+                (unsafe { #data.#ident(#slot) })
             }
         } else {
             quote! {
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 3278a54510e1..a3431863f5d6 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -377,21 +377,21 @@ fn generate_the_pin_data(
             quote! {
                 /// # Safety
                 ///
-                /// - `slot` points to a `#ident` field of a pinned struct that this `__ThePinData`
-                ///   describes.
-                /// - `slot` is a valid, properly aligned and points to uninitialized and
-                ///   exclusively accessed memory.
+                /// - `slot` is valid and properly aligned.
+                /// - `(*slot).#field_name` is properly aligned.
+                /// - `(*slot).#field_name` points to uninitialized and exclusively accessed
+                ///    memory.
                 #(#attrs)*
                 #[inline(always)]
                 #vis unsafe fn #field_name(
                     self,
-                    slot: *mut #ty,
+                    slot: *mut #struct_name #ty_generics,
                 ) -> ::pin_init::__internal::Slot<::pin_init::__internal::#pin_marker, #ty> {
                     // SAFETY:
                     // - If `#pin_marker` is `Pinned`, the corresponding field is structurally
                     //   pinned.
                     // - Other safety requirements follows the safety requirement.
-                    unsafe { ::pin_init::__internal::Slot::new(slot) }
+                    unsafe { ::pin_init::__internal::Slot::new(&raw mut (*slot).#field_name) }
                 }
             }
         })
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index e891d65cc469..c9e2cbe27915 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -868,7 +868,7 @@ macro_rules! stack_try_pin_init {
 macro_rules! assert_pinned {
     ($ty:ty, $field:ident, $field_ty:ty, inline) => {
         // SAFETY: This code is unreachable.
-        let _ = move |ptr: *mut $field_ty| unsafe {
+        let _ = move |ptr: *mut $ty| unsafe {
             let data = <$ty as $crate::__internal::HasPinData>::__pin_data();
             _ = data
                 .$field(ptr)

-- 
2.51.2

