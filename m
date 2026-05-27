Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020125.outbound.protection.outlook.com [52.101.195.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A36C44DB7B;
	Wed, 27 May 2026 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902415; cv=fail; b=mOw1eOgGWhkuyZ3fKRc6vWNS/2eezCSdgey49VCHaEZFlx/vtEULwp2QsM756xG9PCrO9p73zdkF+++FzwhWei39zU1G4qcGYZfm0d1uk+I4X8kBbIA8vVoMJtH+pZaRZ3EQKh3ZFCwVoAgUCSAcZXHMNL8SK4uiE/JylWCeBS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902415; c=relaxed/simple;
	bh=h9r32tfaI6E0LU+Ga+wapGjMq6WLlxN85RtjLvkFCww=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Hnl7KJ4JnDYKKhG7KSkfugnGwA9YND+ofwhqMkeMBYtSWrdF7GltV4HP/oH9qOXpuc5VHa4sToCMog5voycVhpKV/vZfxTYuHAhfFjf4vbxUoVYmM0A9bKEzATFBW6icZwnOoITZXTUOc6Dx4uC2pJsWPb42ss2jNq5EsIHlWGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gRmbm+Ah; arc=fail smtp.client-ip=52.101.195.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gRmbm+Ah"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtTToMhIwWlbolQhKuXGSX6pJf2W+WV/4/HxsKJGxldLBP8LPjyKji1KvpdA93sqPwsfYrJ/BJILfuNnfIo9cXDMfRk7T8xiPu+EBnsi7SnWUK36nrRWhHePLq/aYo7aQlghwYcrR1shJdnOSlitvN8MpL0IV8i6aiFE9h0wGmEfYn0Iq7lO461Kf4nKgA35sORiwiISnyxRobXtulZj08j2HAgb8PpVSSV17TbSnmw/6kGsNoZDhQmPMmS0QvvhMtIz74IMfZXnHDSV4bYcFhzDAJ4+aRM8mZkX6oO/g3LLb4gADFW760s9azEk4hUHkBR78PZfqL+kPKkFRKU7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNG111uz6LowYpDFiZKoIX68oc2jtWnlWwoT0GArU0Y=;
 b=Bl16NJ9J89BAjSQwrszdUDUkLzXKbq56F2P9MKWIUIpmKJeVhqrVoH6MDIq1LWd5NBsJ84bm1iZhebGyslS0Wug9fQ+DCcG0zrbtTN9QbG7p9H61uXv49/u0/IDKvMnFCU8roTTlf8HRg1PSGCsw4g6g4/h7ofvlkTTeGDHbGwY4PECAhpnJ9nd0jqDYGLp6FFcJvcEpBoyyxpZwptfjhvu4CIb0f26aFbeDodJCS9zNYpVIJxd2Itr57vNvF65TkrX4EW4P/fLocVJonoEMc+FSqQnD0bCw6fJI2bF4sIZvTYNk9h3jYRPfHMzTWb/X0nfhh332eH7a8wnCBpa+Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNG111uz6LowYpDFiZKoIX68oc2jtWnlWwoT0GArU0Y=;
 b=gRmbm+Ah3kZP79DwahHl9vulgk3/NbgEZvDkN6iogEJVxEEX+Es7SyxMJ7Op2H8SI2PZlKluSe6fiRh75rCWaH3oL2duFEmAkqI2z39GEmwuNseI63IrXLp9sm40ZxFl/gNvje/ErEH6bBzc2EHnD7cYLEWYnwAsTBoMA2/zKnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO8P265MB7781.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:20:06 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:20:06 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 27 May 2026 18:19:52 +0100
Subject: [PATCH 1/8] rust: pin-init: internal: pin_data: filter
 non-`#[cfg]` attr in generated code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-pin-init-sync-v1-1-e20335ed2501@garyguo.net>
References: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
In-Reply-To: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, Martin Kletzander <mkletzan@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779902405; l=5286;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=7VF0qmHqQNL3C8uBJDTmK/5pfP+4bGzm+i+S98pq+/c=;
 b=5YoraleFjobXvo39HW/R3VzTardy1EM8JE3Q1et50Si6Es/WM+0lR9hxAKgnUd7egxlZpCfhv
 S+YEHErH6l3DACxTEdjX5eF9ARkY+mruNc8Osvi0ZHNOjk4NDdNZmS3
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0524.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::9) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO8P265MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: be63550a-aeb8-4fff-5e36-08debc1431ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|18002099003|22082099003|6133799003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	Z18YU+Buv9KPNx0GutcpIfd9RnNZ3QzFEkzns3spa447x3pBjEGYpjFzQkrslcx+zu59UYPW5rrHDlQWaN2NSWVEa0Pj2ooMtsMOUsH69RiMX81aJEWD0e5WV4WlBOWwumijXXkdAaKUuESQGxhoKqxXe2WHQp0k2HdugB9tQnrM8I0vX0GAU45cxaqBi5yAMZQVN88JQW/VSwbTlWT20ZUuSklUZBimhwA3rJqqdqpnAr8gSFSg6JFomA0Lnx7Bi7TEcbUv7qZQk2eDWyzhH5BgJ+P3l0TtgY60d6Ovj0ussuHcCz4qcU5NF/CzKgyODGQrVkd2STYjE3XIFy5IuPELRmcA7bIQ+zQLu9MPOAtqj/HzTOYsczinh9QUfdwrJKRmkOwYudVEIJTDU/pJAUyoRKovBQW/JQSWraN+9tTrh72sJ1lZkBYl22/i5Tkdy94zszXFofSJDkkuUR/0pYbg0nE2nt0i0S5aIIZHkC1oh5tIdGKhtOlIw8d+yOq5pFfzZDFwVvXMWlteTTwuDcWMTkzmrsnU4kpAKY8gILAjB8w7QzyYPJcLSsQk94gzdnQdYFo4D+zfvMhOLWr6wVT+99BxtEPM2RkfJciHFSbSFNcgY+h0usWKLes4nLImaiCKPnPAt154GKT6riP4BXaJzKmNIHY1mMJNhXUaQhss+0+xr3nz4J4cvOBd3oY2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(18002099003)(22082099003)(6133799003)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkt1bHl4WjBFdmJwTkp6TU1LcGd4WWZCM1dFZXhmOTlZRXExQnI3K1poWkV6?=
 =?utf-8?B?bVgxSG5sc3U3czF3YUZnQ3lYK3FCajRDdWJhSld5NVk3eWxqRlcwalVnWjJ1?=
 =?utf-8?B?VDhwTWhmMkd4N0NCOEt0bStBMkMrYkc0YndURStpclRRSnNUbXdDUm95WUo5?=
 =?utf-8?B?UnJoL1BLeUFIYkp3Smp5Z1VicXhPZVc5bklFdHd5NmtleU0yUjJZdVNEZnJw?=
 =?utf-8?B?T2x1VzBqK3BWVFlXQ2k3UXBtVG9KcFRWZmZiYndEYlEybHB5emZGbExITE9N?=
 =?utf-8?B?bEdqQm45RUpiRWRFbnpjdXFtZWJNbXJoSnYrWWVmOFpBTWlHc1RsMTJNeHJY?=
 =?utf-8?B?VFkzZ2pLVDh6WERyWlBka05nTkhtSFQxMEcyd0dGb2pEMFVWUGExV0xtUkV5?=
 =?utf-8?B?eDROTVVybElnTk84VXUzU3BOZHdtS1JrOGVsY3JpR01KMGdOQTA2MkFkUUg5?=
 =?utf-8?B?MnNsTXFrcjllUVVrVFJicDcrNjRVRTZubXRLVXRGWWFZcnY1WnlhZGF0N2s3?=
 =?utf-8?B?QTdXa2REKzJpQzk2RXNBTWxnc1ZxNmdHOG5DUjFZb3Z5c2RrRVRaNnZDUnBQ?=
 =?utf-8?B?VGZPRitnYWJiMGZ3UkVCL21vQnZTa2lEclJUaXVQUmNHeEVMZlpFL2drdVMw?=
 =?utf-8?B?MzJtOWQzVGNIa3dyZmM0Yzd1SGovaXhaNnF5L1FJVDIyZUw3OS9vd0ZwUkI0?=
 =?utf-8?B?cmpKb2I0ZmxjYXhxVlUxeVZkZmlrMmpMaEdIbVhwcnVUeHpaQUJRdUJhZWkv?=
 =?utf-8?B?YXFQNHlRbXJSWVV2RGdwUlBFajRvZ3JVWTFDRHlmekRXUHc0dGFOd1VZWHRM?=
 =?utf-8?B?MGdTd1ByYTdKWk02RVhyNldJdFloWHhRNkwva1pZNDJsaFZNQ1pHMmJpeVd5?=
 =?utf-8?B?NkYyM2V3SitQM0FERzgxVzd4ZEE5V0g0NEwyaEFZVlpaVUsvSzFSMHVHRXhL?=
 =?utf-8?B?MWJ4eGk0cHllM0c4bkdHZlJrRWRGaTVxbUtLR1krc3hyUlQ0SWdnVmtkMkJv?=
 =?utf-8?B?dmYrZUx6Rk5pQVI0b0c5TFVxK3BzSFErN2RDY09OTk9aVSsyWTVMR2hTQjJZ?=
 =?utf-8?B?NVVIc2xGcm1rcWF4K1Eva2ozclVaSjNiWDg2QWV2SUpPZWdsejRxb1BxQktC?=
 =?utf-8?B?enNwWmNVb0FDeUZTbDZWdTNjWnlZSGJLZ09PTFpxNmdIWStSM2hFcXNXWXFS?=
 =?utf-8?B?RllnR0ErZTAxZ2d6YXpDUS9vZWdIUXdQSkQ4d1lWK2JjSEErYmN3cGVHT0RJ?=
 =?utf-8?B?SEprZFloeUJIMlZBOW5jb2pBb0xvMmErbEZHQit6MFBQeEtkNmtRVEtXeG9k?=
 =?utf-8?B?SW8xa3VWMkNRNlNHRUlETmpCNFIvbmtzRUZ6QnZKdjU4a3I2Ty9NNUkyYU4r?=
 =?utf-8?B?eVlST1p4YTQzZjBaejM3S2ZQWklKbWxBNFl0bVNyTDUzVGF1ZGlRUUxjd2Ev?=
 =?utf-8?B?SmFCcFR6SDg4ZzNCQUVXR25nc2h2V1I2SGFnaG9ZMGh2eHcxc3NrZ1RYVzlR?=
 =?utf-8?B?UGtlNS9tdFI3elNSVExBaDhRRWNiTlVTcXJTTlZKRkdNSXRCemh5VmtoS1Uz?=
 =?utf-8?B?ZDNOV3dSMHBEQis2dW44Z2I1YU92QWNxbmswMG45UUd5dGVCVjlWeGRhNzlZ?=
 =?utf-8?B?cnpFYjFlR3Rzcm1ha0Y1U0FaSXJFVUJVbTRja0NlTjlNTTJBdWs2bXRxNEFW?=
 =?utf-8?B?cXppUVdqUXcvd0JucnNBcnN0ZjFlb0xrYTVZY1VqREYwZVdFSGd1OWc0bzRD?=
 =?utf-8?B?L3lZZS95K1RTQi9WSTFPc1ZIZm9jc01laGVUblIwNERuRmZGUjNFWG96eXFk?=
 =?utf-8?B?QWhlSnlsYjFIenpneWw5c201VDNyR094N1MyYVVBNXlFbGxQaWNzeWRRcGlJ?=
 =?utf-8?B?WXRERVJCblEwNjltaDJDenY3VlBpcENUV1Z2WXpsbkFaNSs4WW56dmVNU1p0?=
 =?utf-8?B?VGRWOG80S3R4RXFSWEJUQlZESm9KLzJsR284UG5oYXNnZXhBQWRRK0FYWjRx?=
 =?utf-8?B?cTI1Q1Z1NVRMZ2x5Smg3YnNWd1JMQTl4SVhJWUp4MWtpMmdRMFBHM2VwdW9V?=
 =?utf-8?B?YTQ1ano3RGdwcW9IQlE4K3ZpcDV3WWZQTnYvOXZwWWFGVHZXT0N1ZGhKVEx4?=
 =?utf-8?B?U09WOTM4cVFJRUUzb0J5VUpHTjJBNjMwcmVtVHk0S002dnJsRGZ6WTQ0Mjdq?=
 =?utf-8?B?dGNUUDg2TXliWE5OTDBrczBmZkNZTGRpdnMzS1dDR0diaWN3Ni9wMG1ZOXBY?=
 =?utf-8?B?ZnBtYk1oaFBrNXFYcFJkRTRNdzNPcnVPU2haMmJMMEJaNC9tcm1jU09URTRM?=
 =?utf-8?B?MFM2VTFCUGhUOGMzNFMyMVNaNndTMVRDZHBJUjV1eHpJMWE2bjJrdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: be63550a-aeb8-4fff-5e36-08debc1431ff
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:20:05.8340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KONcgbreTqkihiOshUDex+yOyY7x8JABiFVG9ZM4a5Owa4SNOSmIK521OmgW1eL+HmwF6DxM1vDmEGCgepnhEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7781

From: Martin Kletzander <mkletzan@redhat.com>

When using a macro with custom attributes in a `#[pin_data]` struct it
can mess up the generated code. The generated code needs nothing more than
the `#[cfg]` attribute, thus strip away all other attributes.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
[ Rebased and updated to only include `#[cfg]` instead of both `#[cfg]` and
  `#[doc]`; doc is not needed for the generated hidden items. - Gary ]
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 52 ++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 2284256a6220..9ca8235ed3d6 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -7,7 +7,7 @@
     parse_quote, parse_quote_spanned,
     spanned::Spanned,
     visit_mut::VisitMut,
-    Field, Generics, Ident, Item, PathSegment, Type, TypePath, Visibility, WhereClause,
+    Attribute, Field, Generics, Ident, Item, PathSegment, Type, TypePath, Visibility, WhereClause,
 };
 
 use crate::diagnostics::{DiagCtxt, ErrorGuaranteed};
@@ -38,6 +38,7 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
 struct FieldInfo<'a> {
     field: &'a Field,
     pinned: bool,
+    cfg_attrs: Vec<&'a Attribute>,
 }
 
 pub(crate) fn pin_data(
@@ -86,9 +87,16 @@ pub(crate) fn pin_data(
             field.attrs.retain(|a| !a.path().is_ident("pin"));
             let pinned = len != field.attrs.len();
 
+            let cfg_attrs = field
+                .attrs
+                .iter()
+                .filter(|a| a.path().is_ident("cfg"))
+                .collect();
+
             FieldInfo {
                 field: &*field,
                 pinned,
+                cfg_attrs,
             }
         })
         .collect();
@@ -171,7 +179,15 @@ fn generate_unpin_impl(
     else {
         unreachable!()
     };
-    let pinned_fields = fields.iter().filter(|f| f.pinned).map(|f| f.field);
+    let pinned_fields = fields.iter().filter(|f| f.pinned).map(|f| {
+        let ident = f.field.ident.as_ref().unwrap();
+        let ty = &f.field.ty;
+        let cfg_attrs = &f.cfg_attrs;
+        quote!(
+            #(#cfg_attrs)*
+            #ident: #ty
+        )
+    });
     quote! {
         // This struct will be used for the unpin analysis. It is needed, because only structurally
         // pinned fields are relevant whether the struct should implement `Unpin`.
@@ -259,27 +275,20 @@ fn generate_projections(
     let (fields_decl, fields_proj): (Vec<_>, Vec<_>) = fields
         .iter()
         .map(|field| {
-            let Field {
-                vis,
-                ident,
-                ty,
-                attrs,
-                ..
-            } = &field.field;
-
-            let mut no_doc_attrs = attrs.clone();
-            no_doc_attrs.retain(|a| !a.path().is_ident("doc"));
+            let Field { vis, ident, ty, .. } = &field.field;
+            let cfg_attrs = &field.cfg_attrs;
+
             let ident = ident
                 .as_ref()
                 .expect("only structs with named fields are supported");
             if field.pinned {
                 (
                     quote!(
-                        #(#attrs)*
+                        #(#cfg_attrs)*
                         #vis #ident: ::core::pin::Pin<&'__pin mut #ty>,
                     ),
                     quote!(
-                        #(#no_doc_attrs)*
+                        #(#cfg_attrs)*
                         // SAFETY: this field is structurally pinned.
                         #ident: unsafe { ::core::pin::Pin::new_unchecked(&mut #this.#ident) },
                     ),
@@ -287,11 +296,11 @@ fn generate_projections(
             } else {
                 (
                     quote!(
-                        #(#attrs)*
+                        #(#cfg_attrs)*
                         #vis #ident: &'__pin mut #ty,
                     ),
                     quote!(
-                        #(#no_doc_attrs)*
+                        #(#cfg_attrs)*
                         #ident: &mut #this.#ident,
                     ),
                 )
@@ -358,13 +367,8 @@ fn generate_the_pin_data(
     let field_accessors = fields
         .iter()
         .map(|f| {
-            let Field {
-                vis,
-                ident,
-                ty,
-                attrs,
-                ..
-            } = f.field;
+            let Field { vis, ident, ty, .. } = f.field;
+            let cfg_attrs = &f.cfg_attrs;
 
             let field_name = ident
                 .as_ref()
@@ -381,7 +385,7 @@ fn generate_the_pin_data(
                 /// - `(*slot).#field_name` is properly aligned.
                 /// - `(*slot).#field_name` points to uninitialized and exclusively accessed
                 ///   memory.
-                #(#attrs)*
+                #(#cfg_attrs)*
                 #[inline(always)]
                 #vis unsafe fn #field_name(
                     self,

-- 
2.54.0

