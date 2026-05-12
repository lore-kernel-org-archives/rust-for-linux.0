Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022118.outbound.protection.outlook.com [52.101.96.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBBD4CA280;
	Tue, 12 May 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587807; cv=fail; b=XLP78oVWKLE2XsF/uzMeWcqn8zz0Rl3jJBt5uFlYZ9Q/vlojjBvyPuIb2/bJq6zgpfHnLvggmatEeAAUUzrmBjUC7mADuj5ybBnnq0nYmJorXgPFL/FiiWTGVdvKkZ2jC/p1jPsAtmjGWIJ3dkLkbuys+IPv/yAmP+mORUxvOIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587807; c=relaxed/simple;
	bh=HHHAwCty7cveQAMrxdPS3dRCliHgr1zs5SZeFweeV4w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YXyZu9RwhobUD/tm9QU0SoxWZPU9jYg/cv6zTYU86G0GHn3+6DdG8SUvyjkWM3ruq8pCmxROvkBKVlDqvh8JgxbdIkBeMx9omAiO+Za/Q2oUbbueRqUJ50POLt/NK9s9T67dY9tPQiHg4SOSfzfgP2/Wv++KpUYpLKwibww3zfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=R7DYCeRr; arc=fail smtp.client-ip=52.101.96.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="R7DYCeRr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d95rUSziSIClEUw0w4b5o8nX3+vDFHF7wyVpsD8JRVm73TTbf9ttCeljSXVJqhLS4sKI6bTXSz6Ks2ley8Z3YXHIRwLuJtHkCY08xBIZJEECdSiTue6P+Wve9v7lHx1te6zpwl4VnZsuvqzvvvQ+XCKKQQxRQnMVA10WWEe6fY9STzWd2DnEFKVOy3gjRVs3EYmlr8XEX+XS3Fv0BJGgN3f0XZYS3gKzsQS5wUh3NbgE8aQ756Zs6rEiJlyT9EgNAD8TrXsh+AIyyGZ8FieNxA/y3xyRgIjjQDaA3L09bcQ571JYnu/B6pr6Xzjlc3KIfdHSyaQKvtUhAd5p9Jk18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1f63FkkWtxHPFcrjwz3UDl/JpUdDGe24EJ1Or9q7fbY=;
 b=Z64WR+P39kdpHyxCQzfIiW2HNxKoEAWbqDggCSVDNPJb2e6QT+4BBM24UdmNk5ht9LFbDxIhtetv24g76IHSw33NED0DzJ6L5Mp+CYAdfT0yhrarcPb78nIaxxbhDZMRcJg6HY1/N4FuHKmJqqiuqDRGh/S9RDY2Pj+a2cEr3x+Mjum8JxmGm8MHlffDGIiSzZDKkDdlfAsR29V3uz9RbV8dNnxcM3cAvEE3po3wRTEX7vcyu/Rze4KeSi3a0dapqiMjlN5NUhYZ4d79ABGJ/YNcDs5gzgImaw/DqHkeeprOqJHYStLyxd290Jokp/y127dm/tUdmMYOGHskzLMItg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1f63FkkWtxHPFcrjwz3UDl/JpUdDGe24EJ1Or9q7fbY=;
 b=R7DYCeRrY+eQh0j/7/gTPTqwedKCS4JQRCimUMhYoYz68DDHYxQ2V2Z1+EoSWjCuajG36Jo5Q8YqAZu7HOwV8ieEgWS4ATx5DiKOYGNVU/0gC5g5LHXQiwumsCIYysLfDIrxiWkb/3GG4yh2Wx6SX56TKHSznIPDLCN5/xfIhZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 12:09:57 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 12:09:57 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 12 May 2026 13:09:50 +0100
Subject: [PATCH 5/8] rust: pin-init: internal: use marker on drop guard
 type for pinned fields
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-pin-init-sync-v1-5-81963130dfbd@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778587794; l=9737;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=HHHAwCty7cveQAMrxdPS3dRCliHgr1zs5SZeFweeV4w=;
 b=fpk02gPs4CSdi6Uk+uj9fvP9qSLu5FgRiUYnqRd5CTB5HK1uDxwCj5S+Jup5lw0tiNsVYtr/m
 PAbogaufu1VAf7CFYyTDG579KYn/7m4TNpirWTpMULDGYTixI9b+xCz
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
X-MS-Office365-Filtering-Correlation-Id: a060335d-9acc-4c1d-565b-08deb01f61d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	usdVjVufnaEL/ByRUnH2WKRDwojOL/1LhRfAFoH97jLe+N0uIL3Twiz2IfnTzxeslXwc5U2t0FuhUwdV9RM2W3QzdGdu3jWyBIgjbwB+xAnf1qfOTkcNdOBNiIGJDzGh8z3+lEZgRnbVLMBpMCDtvg5atnzdE7Vbs2T4x5oiwFkxHjUqUAI3Qxj7kDvPJLfkG/YEgS56q1V+WPR2zfXTade11uSIu+WxKdW7xRSHiBXrwkYfq78vanGYb+KA8FwzESVdM8s0Gt/3TLhkS+hG+PzQd8yjEEjgnWfWaxn5FPjHHBdZJ7JUY4miF2LDjEwQcIvxIjLWpMZk0cKghQLAvX/SwOwzIlz3b0eCg4atbRPMWwNirq069XsTqXZf+gKDWeohn7++YRTwSf0cxeqOMdxpsPv0JIH1wBcSYUdCr3V4s3LOkwXq8/zww0J26hhYzPbtIyt62XoeUjz8tq4bDXO7fPibB1mvteZwaYgGxojkaqVeTDWxlx3DIGzuqKbp+iDznmCfYa5bKTt1Gu3/Evv5f+8UvIGTDMqHcGuhdCL5/4rF/gt3qlgq07qIvx7+qn1CmFu7unUJEt80MerEQJDf3l6EUUNcFBQ+zRJK+kcJwwBOmMHmdlDzF/gvpHHl26E6mU0ld8MnYdUMhgByMagc1hNKt2FVgjc/rl8Bbac1tn2CQ0ozsiG6PqJVUNy8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUpXYk55NCtxRkpEVmNtZnlwY2NmZktRYlBXNVN1QmtNQ3lUTHdlOFEvY2Ux?=
 =?utf-8?B?ekxLRzVhRHd5aWhYUEpDQk9QVktaTGVGTURTbGNlYnZDRW1BdHpJS1d6cXNh?=
 =?utf-8?B?cVhmU1JlOGhqRmRBMVRrMFV5K1FVbUtoVzRCNXFERUw3QkQrM0JDZEdyNGdn?=
 =?utf-8?B?M0Zwa1FNTTdkMElsNDF1Zy85dS9pVThsU2VkV2Y0bSswRHhSbk9CcnBUYlov?=
 =?utf-8?B?UE5aODNFRmhYenFSR28xOFAzaGtvckdSTS8yNUdzMzlHUzBQak9rSWZvUUhv?=
 =?utf-8?B?OENxUVRSYTNwSStPNnNkYXkxYVdEaTd6cCtSTXNmWmxsWnBWdDJ4SUd0bGN6?=
 =?utf-8?B?SlIwbnJ0bm9YdHhLVTFvT0dCelVCVHVxcTloQmh1VUxTMHBka1VJZy83MXIz?=
 =?utf-8?B?SVpRWE04dmlsZUJ0ZXEzb3gxWis4aTRRZysxeWJRL0lBTE11MEhDVXZ0TVMv?=
 =?utf-8?B?OTNHWnZZZ1Q3RTZxNnlUMVBNUU5STSsyWFI3UWhTcDNSeGJXMDNNNTdBdFUw?=
 =?utf-8?B?ckhUYnY3OTJkbHoyZ3FVemE5MGNiR0owWWF2N3g4azlacDc2M3JnZzVwcUk4?=
 =?utf-8?B?ZC9DenNFSlNkVTdVaEsvRXdyZEFyUnhEZ3RLY1V3dlViaUxlcjNtVlNvZTht?=
 =?utf-8?B?VUxHMHI5ZjVHOC9GMjBXRzJGWk00ampZaExHUU53U3FZdlpYTnRDMXRrRnhO?=
 =?utf-8?B?anl1K3VxNW5oMXJmdGN2OVMrMkNJK1EvSHNaaHBNQmJ1d3lLbEl4SzNHSHRu?=
 =?utf-8?B?dFpkbDc5ajAxaUZjRjBKd1c4emlzZmxrVlVKYUNDUnpHczA5Yy93ZVhyWFRH?=
 =?utf-8?B?dnU3LzFLV0VDdmJYblY2aE5lUmw2MkQ4STUxQW5jaEVTdEpjYjJRY2xXaUZO?=
 =?utf-8?B?MlBzSWtWTDBPSVI5dkVFYjA4MU5Wd0pzZmhIbEQzVXpiak02dE05bWwzSlRj?=
 =?utf-8?B?WitvWmtKdTc4a1Z0bWpMN2JlTDgwWCtwL0lENi9zVUpJS0NDUUt6Y1d3amVT?=
 =?utf-8?B?VFVOZVNyOW5Qd0h1M2J4TVBOOTBTTUlkVnF4WEtyTFdIbTNrb0lNK3BpT3E3?=
 =?utf-8?B?NGxBUEYwVTBIZzVZNkEyZjY3MG1zY3IvZFkrOWNBVm1za25vMWg3NFdBY1Er?=
 =?utf-8?B?RE8zRDJydGFTcWlwM0lKT1k3VWhkalM4K0dTTmhnNDVuTS8vc3VSUWxnNVE2?=
 =?utf-8?B?YTlMc1VOcWZnQ21uUklhQ1pnbjcxT0lQWVlBd3hybGFVcU1hMldmQ2dEWHp2?=
 =?utf-8?B?UmlTQVVETW5IQjFHdmV3WitaRFNOZ2tuZVlXNHlwMFZFTVBDc1ZSdHNFb3BM?=
 =?utf-8?B?QkJ1cE82VmV3SXJuSWYzSVpvaUNIUFBMaEdVMU4zS2d4ck9FWkVyV0Y5Zlgx?=
 =?utf-8?B?elZ2TThieWwrWnp0Qk5sWnFCV0M2Q1ZlenhYTDN6eHlGN0JCcFJxMUUwM0dJ?=
 =?utf-8?B?NGxnODZNR0l2OFYvRWdqT2ZuOEV1K2o4Tko0dXBQbGJ5R1U0d2pVR2dSWlc2?=
 =?utf-8?B?ZGtaOEtxTGJDVWM0MVY0WGFhK21odmNCajFPdnVRUFBYQ1F0V2p1Y3p5bXBJ?=
 =?utf-8?B?UTVNMFpSK2E2OHI1MnVyeHc2WDluWVVZa3ZySUJVcmhzTngzMDFWdHJRVDg4?=
 =?utf-8?B?L2FRYjBRUnNueWhWQndUdFpWdEJ2T0dQZUFCMkgyNEJ4K1BkOFAwSWl6eFFj?=
 =?utf-8?B?NG95aVNxcDYvMXYvTG43UzRJUkpxSkdVdEFaRFdWUUxkT3dXNklVVmtscHRK?=
 =?utf-8?B?YnpKTzJ6NFh4VzA5eVVxZDh6aTFJSFVXTmpaQTl2MWxpQStMYkh1NVRkZUJ2?=
 =?utf-8?B?b0xFL05FdnVXaFFvU1E4U0ZiZm1tTGxhOHFESUhwdU9QU2JHd2ZDTWFYbnJj?=
 =?utf-8?B?MXN4TCsyS2g1L2g2NXFvS3l6Y3ZmckdvZGRUMHRvL0lOVEZidXB2NElkWEpI?=
 =?utf-8?B?N3NVMWI0NldrRmxlL2VIOUtNMEo4ajhRMlhYQTB1N0FoaVdqOFNvS3lRYXRP?=
 =?utf-8?B?ZnJEaHBXbW9qV1h2NHhORWRYSXExRnZvdWxnRTdCK01EQlhUZUNNMjA0Y0lR?=
 =?utf-8?B?TCsram5sMmZvQUhvMGtCYVBmTWpVdXhFMWpQanZZdVl1SG9RSWw0Ukp5WWls?=
 =?utf-8?B?aEcyUEMxZ0tub3diMnZ3bmgvS1JoY1FvelJGK3Yyd2tBY1VaeXhXSnVwVUw3?=
 =?utf-8?B?RVBwdjBnemV3dG9ISm9VcGNOS3pyZnBVVEJsUHlFc21oUWcrUHJVcXNjN3ZH?=
 =?utf-8?B?d05WTXRXbThGVndWL0N5dUdCcktLRUdRRVdQMzBaVlU5VGNQV1RiWlNxaVFq?=
 =?utf-8?B?SXIzdWhpODAwRXFYNFdmeVZyakplYkFoeDVVNUhMT2ZVNEtWWmdPZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a060335d-9acc-4c1d-565b-08deb01f61d1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:09:56.5488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLRU8jm589hx0qwAOkOzIWVDhtJU/n7/CiqJ5DmOMof8KJMlwZJqwFMrpBog8vMJCbYw+okGtd/eQYarVr/1ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6214

Instead of projecting the created reference, simply create drop guards with
different marker types and have the `let_binding()` method of guards of
different marker produce different type instead.

This allows more flexible lifetime as this is now controlled by the guard.
This will be needed when implementing self-referential fields.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs     | 47 +++++++++++++++++++---------------
 rust/pin-init/internal/src/pin_data.rs | 35 ++++++++++++-------------
 rust/pin-init/src/__internal.rs        | 30 +++++++++++++++++++---
 3 files changed, 68 insertions(+), 44 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 7eda1bcf0f28..a0b3c3790d43 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -303,18 +303,31 @@ fn init_fields(
         // `mixed_site` ensures that the guard is not accessible to the user-controlled code.
         let guard = format_ident!("__{ident}_guard", span = Span::mixed_site());
 
-        // NOTE: The reference is derived from the guard so that it only lives as long as the
-        // guard does and cannot escape the scope. If it's created via `&mut (*#slot).#ident`
-        // like the unaligned field guard, it will become effectively `'static`.
-        let accessor = if pinned {
+        let guard_creation = if pinned {
             let project_ident = format_ident!("__project_{ident}");
             quote! {
-                // SAFETY: the initialization is pinned.
-                unsafe { #data.#project_ident(#guard.let_binding()) }
+                // SAFETY:
+                // - `&raw mut (*slot).#ident` points to the `#ident` field of `slot`.
+                // - `&raw mut (*slot).#ident` is valid.
+                // - `make_field_check` checks that `&raw mut (*slot).#ident` is properly aligned.
+                // - `(*slot).#ident` has been initialized above.
+                // - We only need the ownership to the pointee back when initialization has
+                //   succeeded, where we `forget` the guard.
+                unsafe { #data.#project_ident(&raw mut (*slot).#ident) }
             }
         } else {
             quote! {
-                #guard.let_binding()
+                // SAFETY:
+                // - `&raw mut (*slot).#ident` is valid.
+                // - `make_field_check` checks that `&raw mut (*slot).#ident` is properly aligned.
+                // - `(*slot).#ident` has been initialized above.
+                // - We only need the ownership to the pointee back when initialization has
+                //   succeeded, where we `forget` the guard.
+                unsafe {
+                    ::pin_init::__internal::DropGuard::<::pin_init::__internal::Unpinned, _>::new(
+                        &raw mut (*slot).#ident
+                    )
+                }
             }
         };
 
@@ -322,24 +335,16 @@ fn init_fields(
             #init
 
             #(#cfgs)*
-            // Create the drop guard.
-            //
-            // SAFETY:
-            // - `&raw mut (*slot).#ident` is valid.
-            // - `make_field_check` checks that `&raw mut (*slot).#ident` is properly aligned.
-            // - `(*slot).#ident` has been initialized above.
-            // - We only need the ownership to the pointee back when initialization has
-            //   succeeded, where we `forget` the guard.
-            let mut #guard = unsafe {
-                ::pin_init::__internal::DropGuard::new(
-                    &raw mut (*slot).#ident
-                )
-            };
+            let mut #guard = #guard_creation;
 
             #(#cfgs)*
+            // NOTE: The reference is derived from the guard so that it only lives as long as the
+            // guard does and cannot escape the scope. If it's created via `&mut (*#slot).#ident`
+            // like the unaligned field guard, it will become effectively `'static`.
             #[allow(unused_variables)]
-            let #ident = #accessor;
+            let #ident = #guard.let_binding();
         });
+
         guards.push(guard);
         guard_attrs.push(cfgs);
     }
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 44d0bd18e4ae..90f6b05b957c 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -371,29 +371,18 @@ fn generate_the_pin_data(
                 .as_ref()
                 .expect("only structs with named fields are supported");
             let project_ident = format_ident!("__project_{field_name}");
-            let (init_ty, init_fn, project_ty, project_body, pin_safety) = if f.pinned {
+            let (init_ty, init_fn, pin_marker, pin_safety) = if f.pinned {
                 (
                     quote!(PinInit),
                     quote!(__pinned_init),
-                    quote!(::core::pin::Pin<&'__slot mut #ty>),
-                    // SAFETY: this field is structurally pinned.
-                    quote!(unsafe { ::core::pin::Pin::new_unchecked(slot) }),
+                    quote!(Pinned),
                     quote!(
                         /// - `slot` will not move until it is dropped, i.e. it will be pinned.
                     ),
                 )
             } else {
-                (
-                    quote!(Init),
-                    quote!(__init),
-                    quote!(&'__slot mut #ty),
-                    quote!(slot),
-                    quote!(),
-                )
+                (quote!(Init), quote!(__init), quote!(Unpinned), quote!())
             };
-            let slot_safety = format!(
-                " `slot` points at the field `{field_name}` inside of `{struct_name}`, which is pinned.",
-            );
             quote! {
                 /// # Safety
                 ///
@@ -414,13 +403,21 @@ fn generate_the_pin_data(
 
                 /// # Safety
                 ///
-                #[doc = #slot_safety]
+                /// - `slot` points to a `#ident` field of a pinned struct that this `__ThePinData`
+                ///    describes.
+                /// - `slot` is valid and properly aligned.
+                /// - `*slot` is initialized, and the ownership is transferred to the returned
+                ///    guard.
                 #(#attrs)*
-                #vis unsafe fn #project_ident<'__slot>(
+                #vis unsafe fn #project_ident(
                     self,
-                    slot: &'__slot mut #ty,
-                ) -> #project_ty {
-                    #project_body
+                    slot: *mut #ty,
+                ) -> ::pin_init::__internal::DropGuard<::pin_init::__internal::#pin_marker, #ty> {
+                    // SAFETY:
+                    // - If `#pin_marker` is `Pinned`, the corresponding field is structurally
+                    //   pinned.
+                    // - Other safety requirements follows the safety requirement.
+                    unsafe { ::pin_init::__internal::DropGuard::new(slot) }
                 }
             }
         })
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index e54d90a4742e..010e8bfc6cd3 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -277,6 +277,10 @@ struct Foo {
     println!("{value:?}");
 }
 
+// Marker types that determines type of `DropGuard`'s let bindings.
+pub struct Pinned;
+pub struct Unpinned;
+
 /// When a value of this type is dropped, it drops a `T`.
 ///
 /// Can be forgotten to prevent the drop.
@@ -285,11 +289,13 @@ struct Foo {
 ///
 /// - `ptr` is valid and properly aligned.
 /// - `*ptr` is initialized and owned by this guard.
-pub struct DropGuard<T: ?Sized> {
+/// - if `P` is `Pinned`, `ptr` is pinned.
+pub struct DropGuard<P, T: ?Sized> {
     ptr: *mut T,
+    phantom: PhantomData<P>,
 }
 
-impl<T: ?Sized> DropGuard<T> {
+impl<P, T: ?Sized> DropGuard<P, T> {
     /// Creates a drop guard and transfer the ownership of the pointer content.
     ///
     /// The ownership is only relinguished if the guard is forgotten via [`core::mem::forget`].
@@ -298,12 +304,18 @@ impl<T: ?Sized> DropGuard<T> {
     ///
     /// - `ptr` is valid and properly aligned.
     /// - `*ptr` is initialized, and the ownership is transferred to this guard.
+    /// - if `P` is `Pinned`, `ptr` is pinned.
     #[inline]
     pub unsafe fn new(ptr: *mut T) -> Self {
         // INVARIANT: By safety requirement.
-        Self { ptr }
+        Self {
+            ptr,
+            phantom: PhantomData,
+        }
     }
+}
 
+impl<T: ?Sized> DropGuard<Unpinned, T> {
     /// Create a let binding for accessor use.
     #[inline]
     pub fn let_binding(&mut self) -> &mut T {
@@ -312,7 +324,17 @@ pub fn let_binding(&mut self) -> &mut T {
     }
 }
 
-impl<T: ?Sized> Drop for DropGuard<T> {
+impl<T: ?Sized> DropGuard<Pinned, T> {
+    /// Create a let binding for accessor use.
+    #[inline]
+    pub fn let_binding(&mut self) -> Pin<&mut T> {
+        // SAFETY: `self.ptr` is valid, properly aligned, initialized, exclusively accessible and
+        // pinned per type invariant.
+        unsafe { Pin::new_unchecked(&mut *self.ptr) }
+    }
+}
+
+impl<P, T: ?Sized> Drop for DropGuard<P, T> {
     #[inline]
     fn drop(&mut self) {
         // SAFETY: `self.ptr` is valid, properly aligned and `*self.ptr` is owned by this guard.

-- 
2.51.2

