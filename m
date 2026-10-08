Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020109.outbound.protection.outlook.com [52.101.195.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6471D49B1F9;
	Thu,  8 Oct 2026 12:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462321; cv=fail; b=dXD0ZUHAOkQB0grrqYBpCvXFok+ig2NXarx8q7Xw38DP3Cv8dstrDpB4qecXnBxvMcbVW4Q8AA5PYqvPTwMtmi4oBxlT0U+i9xUfLukH5TBshYBsLMscEmTZJeEuQTScD4GyOEbBZjoc69ULMM2Q3UO+PkbPkuYd4Uqcybt3opM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462321; c=relaxed/simple;
	bh=a3EPXYvpi2iyoUIyikJ74UcN1xgvXNBTYxX3HK6Az30=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WXAdw5t9A0xhrP4ZuUGAoFfCfDzixfo/87pyljAxaG0W55xXxDN561JWqIaSB9vYN+AZL92Rj6yN25XXFKKlZ2veqHSx8c8T2VuHFBbnOyuITis+KaZT7mO6NCtSKsrm3cEoGUjAhSEx4AxsXd2FHn7stKBqktbdim3DWrA1koE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gfcpHngh; arc=fail smtp.client-ip=52.101.195.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gfcpHngh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3O+QOaFbi3VY0ikdIyl0jgaISG3NM42eXuDUA7RKU+V25CtRGz1nafdZNXBEtdbmLohGIaiWDMTPuCfOWW/P4dIvm1GvGjnNdw6ppa9ogfEm7HD75R/uMGnz6wuN6pWw/EiNzvVVOqDI6spRkBycyfJhhv6dM/H6CmKoA1zkyZWf4vVQuqa8Dd6TuspH8bKeIoLp2LhE06MU298K34/mS8c67hxk63Qm251CjIB0KWB/oHpIeood7fF7BoD6Ib89sNST2P2xvT1YrqjS7KNzlnxgi7Y1sCanQqiY+5P8vL2H/ggg3V1lWmMy0LwZdpPFEVLCyokDY1JwTcxXh1BeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpOusSX2PsIpPoWAdBgGiBPukvhYA73IYL6hWnVNVwU=;
 b=DA78PFxoDHgsMJ4O2CyIM4SvFpEnxgfjHFbx46fhA3z3VlgufVG4EactjXb8V5voNwKub0tS1EXoa0bf9T19dJ2UQbmQU0XklrmpNW8b5q8/c0BzGwTgMmz6KuD+moGexky5yOC1DSgF3X+WDntLaDkrm0VfhzGBvqrZATkNoadRXJYEk2FcstKHWJOrzCAfWQvj9CTm1IPu+ym8s5A+/ER07xoryL4Sa4HgEUDWAWldMyGSzY3zxeyrCY0QnJ63Y3puRgmAeEFDglsnhyQfId8AkktElCSBH7OF/ETqEyiFXaZyiVDZiN+c81x5QqahSMX2hIb6s0b94P0YI8pcvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpOusSX2PsIpPoWAdBgGiBPukvhYA73IYL6hWnVNVwU=;
 b=gfcpHnghfoWqiPPe/SWYRSH4TxMorSpWXDvqAunfWNzEeI9AKbka43MJUpJCdksz7KCjZB+vvYKrDSaWLMOMOdlNDGk/PQj9L+hKmJ8OO/Qwf0eIfJF6MoMPXluoEJEd3JCJMgDp56Ql6Q707z1vH9r/uIA13u5TV2odF0PA8a0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO6P265MB7245.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:343::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:25:03 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:25:03 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:24:05 +0200
Subject: [PATCH 18/20] rust: pin-init: internal: pin_data: perform AST
 lifetime replacement if possible
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-18-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5551; i=gary@garyguo.net;
 h=from:subject:message-id; bh=a3EPXYvpi2iyoUIyikJ74UcN1xgvXNBTYxX3HK6Az30=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce7M3LclXhl/sXXSdzZ5rJx5m6Ox8Gp7QuyNs3f1
 ydzbnf1BP2OUhYGMS4GWTFFFo9uxrRNjLNlL2uVv4SZw8oEMoSBi1MAJnLVhpHh2p9JxR9eL5fr
 7uPguBUus+xWQcLlvp129j0tISfcnr9byPDf2WLtrTlvsxbWXj757cOHr53VIQIH83ckb/m97s5
 +xl8STACZJE1R
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
X-MS-Office365-Filtering-Correlation-Id: a3b314b4-4282-4bf9-d391-08df25372dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|921020|56012099006|18002099003|10067099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	VNbF7pnJaE3KaUXmz/cPmBKOS2tp7wcg676B2AfnNzdXi6/Z+CiWv69ftn4LAUbxp8Zael++b03M0BbOAIB9MbqSGsAkThe/zHIC1kmayDQ9h33ZdsBow1ohuUGC0it4KPFFjhyhnMHbGu4ItaKjh8OK8idIxzNPVktq60jYTf1FRcb3rBSuPadWRzJwZo6aFiZL1BDf8AerKstwox1ol1aZJzEc/6mnlpAdoLFVaNJ7UQp8eK6Gq6LH6cinD6bHmOGCQF9rS7lp1gV82HUUrn8S7H/xRxlZzuT4LDoJ8N7pj0OyFv7g8jtZlpfG7tEHZ6m2Lt/LoiQ7kSnEJbzMPp7nckO5E3z3rLnts4H/rdh/2bIWW9BxlsotULomdDYqRQ2lr9gytZiM6NfxVrDn4TyyWEZMApA+3jAmPdlgocIiJE/MYMIrkEeLdZWSXzI76ZR+h2M4LnchA7cynepydbZtcG8XwTpKECxSdYDwcDpw5pecfVeWn7di9fx8MIX8UqUnwYSS2ovYr1wlIeqkUbyqm9RNKwhQ1/QKZrTSnqwBvwUR6pkwWfoLEco9kWLL1C8/SpoJMcUhguYg+G1xIeFs49Xn0d8HT9HrKRWrwrWsrMkHxutBItPnTS4ObBHivaSrrZHC/Q50HJuQgkjVE71+JBVP2jAKSWIM9pclBW+5gq0QkxSofdX2URR1AOjCTt5QZWv5DHLlbH9cZswVEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(921020)(56012099006)(18002099003)(10067099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mi92VWdKZHo0eGFXYmd6Q3hENUZyWHQ1QkEzMXJLMlliZTMybUdiVDlEMUdr?=
 =?utf-8?B?VHFFb3hmQ2ZqU21XN2FzVUdGbWZWVjI1UGd5SDVPbWYyT3U1VXhGbFFKeWdL?=
 =?utf-8?B?WW1xc2NWbXl0cTF4VGVTVXpNbzJYcEJyMkZtSytDLzY0bDZzdi8vRmdEeVRK?=
 =?utf-8?B?ei9nakJSRHpRdDMzOEc2dTllcFV0MWpVZ2tYNjhqSkVheW1pK0hINTYzV1VF?=
 =?utf-8?B?UytrRzBYRlBrRzdvUTRkbmNzK3Y3ZTNhQ1o0ZXhqZ1FOWWFNL0UvQW1UeU84?=
 =?utf-8?B?azdFOEtEbUFRWUJtaTVMaEJBa285eHRrWEZLSW5Kai9NU1l6MHZKUkNXbER3?=
 =?utf-8?B?M2VCTUVnYjEwOFRiZU5EMGZYQjhkeGxOZVk4YkFTaDRFZEVIeDRRbHo0alo5?=
 =?utf-8?B?TnpPMUtVd3I0K1RzZDhzU2pLR3ZiaUxzcHZ2Vm9Ec1BWdTRPcXZscFd5TDVu?=
 =?utf-8?B?TDR5eXBCMUp1RmREdzYxYU5uN3ZDbnpIUWVDOS9kLzZsOWFHaVVzb05WeUxP?=
 =?utf-8?B?djZkT3N1bTdjQWpWUUtaOU96d3E0eTN1Wi9BVi9zeHp4QzVwRktzUEE4MG92?=
 =?utf-8?B?bzNkNDB5MlFOSmJkTS9mSWpyd2lzcjYwazZtcUJNRVJHRCtSNFpPdkNZTXBm?=
 =?utf-8?B?OFRmRStURFpQVWRQV0ltSnRKSlhraWhldS84bDNSNDdFMlZJNUF2bGZXTHcy?=
 =?utf-8?B?d1A3VEJRN0RHdnljTXlRZVk4NVkxUUNYNjZva1ZkYytNbnNmSmV2MHVDdnlP?=
 =?utf-8?B?NWtzWXdaOStSc2hNVjg4aVNCUDJycUJVUXRlUzJMbURiYWRWOXZ1ZmFNY0Iz?=
 =?utf-8?B?dWxLWlVkTXI4M1hjdDU2V2dPUy9uZWJGUjFsY1VOZnJ0UzhLZE1wQW0zTnFM?=
 =?utf-8?B?azVJN1pMZXJOWkYwNGlVd0xFajVBQnZkejh4NXltNEZvMGEvWCsyMGhHcGZQ?=
 =?utf-8?B?WklBWlRmNzZscVBBV05zTDRzSllmMHQ0aGtBRjVNSElnZUNLMU8xeEpCdEhP?=
 =?utf-8?B?M1hoenhKTzFmMDFQOXh4K3U1NjMzaGczMUR2NGJiQ1NSMW45dEdybzdadCts?=
 =?utf-8?B?SGZwTFZmZm0rc0Rpd3N2ZTRhWWFXbTZ6aE1tTTducDBzSi9hSThSdVEvamhF?=
 =?utf-8?B?Wkx4MDEwanhnMWNRelArTG1iaWVIRmtva0hsYlNrNzZwWldHWDQyVm9pZTBn?=
 =?utf-8?B?c0REWENHUkJjVzl4aStVRk5KaWUreld0djZidzFXa3hsaXg2MW1ackRYRDdh?=
 =?utf-8?B?OWFMRnU0c1krVzNVd2o3eW1SRG5lcU5QK2VKWUlZcWRYWFB5cEUrVUYyRnpB?=
 =?utf-8?B?NGxNRXdlUTVLa050Wks1SDZ3QmRsNnVUbDNCMGlyL3FTdVlhaE4xaEtUNUli?=
 =?utf-8?B?QWNpd0pSTWpWQms4bmhmbkI4cSs0anN2VmFGVHJYYmhhYzJGV3MreUgxZFJ0?=
 =?utf-8?B?K0UxbUhzelZaTW5Hck5jeXA5QlBmTVZhTGNQeld4Y2hLdUp3SVdyVDRPUmlF?=
 =?utf-8?B?enRPR1dXbGFaREdHVkNBZ2R5MnJtT1pUQzl4TWtqeFFjSnFTaFNCR3phT005?=
 =?utf-8?B?OFZFNHJqdEt5MjhEUkY3OEZGV0JraWV4SWFDQzNwaUEzTTRLR3hZQzMvZEpE?=
 =?utf-8?B?a0M1c0ZZS2FzYk1KU2QzNXdXL3owbitBVm43VEtkbzM4NDVvSHNtZ1hjSisw?=
 =?utf-8?B?WWVHUmFpRGZ3MlE0YkY3Rkx3MUpUQlpXRm1hQmVXenJhT0k5WjNTVUtSdmhp?=
 =?utf-8?B?WHE3NDcwaWFRc2QvbFNOcjV1ekN2MFd4OHQrbFFyaysrbVBhd1NQR3NWcDJu?=
 =?utf-8?B?ODFGZUZqdmt6bTVaaHp3YUQwcEtvRmp3R0VGa3VZZEdvNDZrYm1TL3JoZU9T?=
 =?utf-8?B?ODAvYVEydlk2Wk42clhFWVJtVkxDakpYbnRJY1F5R1N6ZExoekZoTXVacWJG?=
 =?utf-8?B?cytsczdFTytrcENtN0pSSk9KYVFWMTh5OGh3d1JaTWdjM2Z6RTBiTUJ2TzBs?=
 =?utf-8?B?VWFZRm5MWFJyVHp1M29FZGdjejhFNGZQMlN3RTgvcUNXZzA5NlJiQUo5clJO?=
 =?utf-8?B?NElQbHJ3SFFJOXNiR3d4SVNHeUkvVGpwU0lrSWN0VUhuTXhHR1pIN0ZGUS9v?=
 =?utf-8?B?R3hvR3FHemdvUUNuTXBxTkN1UWg0aHRqOTJ4K0lTeXdhdVJ4VU56aXZsTTZz?=
 =?utf-8?B?MWVIS0tFSGtITnNySjlZRnlnSkdNVUhDRHpRN05wcWx2YW0rOC8vZEtKUW5h?=
 =?utf-8?B?L2l6NFlTUmYzeUw3UU9IczFqT2UvbmM3ZjZrWndTTDdrZ3JtTFZwQnlqa3h0?=
 =?utf-8?B?ZGxDTXJZQmpSMTBDandTZWZ0SG9NUFM0VXltRzZsR3lIL25EOUliUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b314b4-4282-4bf9-d391-08df25372dd1
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:25:03.2672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgk5dYWDF1RzFgnCgGcm5MwnFEUym9IGfKIRVFG3U6Sws9sDFBlxOEZwnyBqCtTlT0Qm6SmJbg4lUPlo4IMl2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7245

Currently lifetimes are replaced via function type and `FnOutput` trait.
This is very general approach as it uses generic associated type to replace
lifetime, so it can even work when macros are involved. This does cause
more generated code, and does not render in documentation nicely.

Thus, just replace the lifetime in the AST if no macros are involved.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/util.rs | 112 +++++++++++++++++++++++++++++++++----
 1 file changed, 102 insertions(+), 10 deletions(-)

diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
index 9f5dddbde9ef..12f996787760 100644
--- a/rust/pin-init/internal/src/util.rs
+++ b/rust/pin-init/internal/src/util.rs
@@ -1,12 +1,12 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-use std::collections::BTreeSet;
+use std::collections::{BTreeMap, BTreeSet};
 
 use proc_macro2::{Ident, TokenStream};
 use quote::{format_ident, ToTokens};
 use syn::{
-    parse_quote, visit::Visit, Attribute, BoundLifetimes, GenericParam, Generics, Index, Lifetime,
-    Member, Token, Type, TypePath,
+    parse_quote, visit::Visit, visit_mut::VisitMut, Attribute, BoundLifetimes, GenericParam,
+    Generics, Index, Lifetime, Member, Token, Type, TypePath,
 };
 
 use crate::DiagCtxt;
@@ -387,21 +387,113 @@ fn visit_type_path(&mut self, ty: &'a TypePath) {
 }
 
 pub(crate) trait TypeExt {
+    /// Check if the type includes macro invocations.
+    ///
+    /// Proc-macros cannot expand macros and peek into them, so if macro is involved sometimes
+    /// special handling is required.
+    fn has_macro(&self) -> bool;
+
     fn replace_lifetimes(&self, needle: &[&Lifetime], replacement: &[&Lifetime]) -> Type;
 }
 
 impl TypeExt for Type {
+    fn has_macro(&self) -> bool {
+        struct HasMacro(bool);
+
+        impl<'ast> Visit<'ast> for HasMacro {
+            fn visit_macro(&mut self, _: &'ast syn::Macro) {
+                self.0 = true;
+            }
+        }
+
+        let mut visitor = HasMacro(false);
+        visitor.visit_type(self);
+        visitor.0
+    }
+
     fn replace_lifetimes(&self, needle: &[&Lifetime], replacement: &[&Lifetime]) -> Type {
         if needle.is_empty() {
             return self.clone();
         }
 
-        parse_quote!(
-            <
-                for<#(#needle,)*> fn(#(&#needle (),)*) -> #self
-                    as
-                ::pin_init::__internal::FnOutput<(#(&#replacement (),)*)>
-            >::Output
-        )
+        // If the type has macro, we cannot peek into it. Use some different approach to replace
+        // the type using GAT.
+        if self.has_macro() {
+            return parse_quote!(
+                <
+                    for<#(#needle,)*> fn(#(&#needle (),)*) -> #self
+                        as
+                    ::pin_init::__internal::FnOutput<(#(&#replacement (),)*)>
+                >::Output
+            );
+        }
+
+        struct LifetimeReplacer<'a> {
+            to_replace: BTreeMap<&'a Lifetime, &'a Lifetime>,
+        }
+
+        impl<'a> LifetimeReplacer<'a> {
+            fn with_bound_lifetimes(
+                &mut self,
+                bound: Option<&BoundLifetimes>,
+                f: impl FnOnce(&mut Self),
+            ) {
+                // In case the type includes a lifetime binder, e.g. `dyn for<'a> Foo`,
+                // temporarily remove them from to_replace if they're.
+
+                let mut removed = Vec::new();
+                if let Some(bound) = bound {
+                    for lt in &bound.lifetimes {
+                        let GenericParam::Lifetime(lt) = lt else {
+                            continue;
+                        };
+                        if let Some(entry) = self.to_replace.remove_entry(&lt.lifetime) {
+                            removed.push(entry);
+                        }
+                    }
+                }
+
+                f(self);
+
+                for (key, val) in removed {
+                    self.to_replace.insert(key, val);
+                }
+            }
+        }
+
+        impl VisitMut for LifetimeReplacer<'_> {
+            fn visit_lifetime_mut(&mut self, lt: &mut syn::Lifetime) {
+                if let Some(&replacement) = self.to_replace.get(lt) {
+                    *lt = replacement.clone();
+                }
+            }
+
+            fn visit_trait_bound_mut(&mut self, bound: &mut syn::TraitBound) {
+                self.with_bound_lifetimes(bound.lifetimes.as_ref(), |this| {
+                    this.visit_path_mut(&mut bound.path)
+                });
+            }
+
+            fn visit_type_bare_fn_mut(&mut self, bare_fn: &mut syn::TypeBareFn) {
+                self.with_bound_lifetimes(bare_fn.lifetimes.as_ref(), |this| {
+                    for input in bare_fn.inputs.iter_mut() {
+                        this.visit_bare_fn_arg_mut(input);
+                    }
+
+                    this.visit_return_type_mut(&mut bare_fn.output);
+                });
+            }
+        }
+
+        let mut ret = self.clone();
+        LifetimeReplacer {
+            to_replace: needle
+                .iter()
+                .copied()
+                .zip(replacement.iter().copied())
+                .collect(),
+        }
+        .visit_type_mut(&mut ret);
+        ret
     }
 }

-- 
2.54.0

