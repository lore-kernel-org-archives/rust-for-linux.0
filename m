Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022082.outbound.protection.outlook.com [52.101.101.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737EE46D551;
	Tue,  6 Oct 2026 15:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300604; cv=fail; b=tdkciX87j+D/ZyQ6Pt2ZwhpC9aLPvaomnP5nXGQzJwsz11FaGwvlngKMFKsn1mS3SUIOCqU+Ig7UN3ikHPNaNLKxzZK7qdeRcGKmnc404KqYaXPVMnPG33vQaMSIwXC/XOPYUwLj62S9Elp5j6qOuHfnRfjZKydJ5bqf9HBva+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300604; c=relaxed/simple;
	bh=D55QkvNePqPNr/wdtn4D3Z2dH+E+kavkCrPs/c8yCLk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WoffYwLPF4iroE5ty4SCGF5HPRTkEeq0ZPhfc7k1N/mwvUUtxqzP46eK7BbHO5O4QS4rUhrifJO635GXaMXn8o8HQE2lQ8xLtaXKsWFkoVKlfFXZum2v9M4YbYmj1HUFKqCbk5iokiKGCVt02840xCwPfoq5srrEC+Erx/kd7vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=JG5nCvoi; arc=fail smtp.client-ip=52.101.101.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="JG5nCvoi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSuntSSgU0UmR+MV+fwQkOTR6VDcxdMncGorTnIqAWadxYWdz7JdL77o5BBqbY0pK+Cz5X/SKY5uPM3GvAkHqCXVfjrjWHV/Ak74NpraQdPLxM/Pf86QUbDjP51ZN4sXF5KiNocar0hZoczInu2aM2sW3NpUBXvsxmA9F5m+d66iV76oWyI0vCF1rPaU09wYtANOo+EP5zeJ7DbG9qVrN/kovDu415KQUO0pAth1Eyw2n74FGXqeWBIspxIan53XeXZyF71huQMLSes0B5fBVr/u2zLsVqBxycIrzazMxjiResmNeZH7SyHHwyd2Ltftgs92d9hMakVGeLkROebF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ep9zC75BZKS5AnuOnxRZlWvahQfcf7NjyzMQhtXQsQA=;
 b=MLvFSQoWB3pBTNh4gttM9X4tgCJLSeFaGKK9Mi9P4mf7GbuPZ8kcJgKnBEb3sg4WCW9aBgOfaCURUamR2GTapB1AJ5g3h6IRQSsLBCT/5cZZuN51THnAtSa6vx8pUwUVAN7yQsaiqFKqyRHNWKls4IK4kxzvXaGa6ze4nXf92xCJUEjZ61pffhFIXkqrMcy/nRzfhWVaYvcJ5ItEP9losl6/+qfEn6263taf3k6JEQG2uj1KlscQcCRnnwa6BJRFP4NiaTpO/3LUjg2a/O6WJFd4TtWkN+pTsxiprPYaZRBAnT3my447A6oPmQR2YJAkm4gYPSzz5xakFCzaUA5FGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ep9zC75BZKS5AnuOnxRZlWvahQfcf7NjyzMQhtXQsQA=;
 b=JG5nCvoiUGwtMq3duI6QX4aQlK0xwDwhh7WyNjIyWuv7SKL7ORk8/aTPv9iYj0S7urgIlIwyThvY7QjirsxrPsbiVLftfq/y8tdZ8KViTePnibzFuLhssbeARf53nPdd7vC3RUEgIWmtp3O83qxIsIeI7OhOzig00XkJS0v+8Lk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB1817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Tue, 6 Oct
 2026 15:29:55 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 15:29:55 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 06 Oct 2026 17:29:34 +0200
Subject: [PATCH 4/8] rust: pin-init: internal: add utility for extract a
 single attribute
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-dev-selfref-dep-v1-4-da716f740d6d@garyguo.net>
References: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
In-Reply-To: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3080; i=gary@garyguo.net;
 h=from:subject:message-id; bh=D55QkvNePqPNr/wdtn4D3Z2dH+E+kavkCrPs/c8yCLk=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWUeF3zFNPBmyM4lHa+fKNGGpS0U2Ue+MQ5gW73VLL
 OaXcVi5NLyjlIVBjItBVkyRxaObMW0T42zZy1rlL2HmsDKBDGHg4hSAiVjlMvx3qRHhum/M6iSo
 1c68LO9aecXtAKFHHwu6T50qaH5g3c3GyPDxfvlGuYt+1f5hFpFXMxR1H9xrVbcO5b5z6nSBeS+
 vKQMAM8ZBzg==
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: VI4PEPF00000161.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::86e) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB1817:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb947b4-315e-4ec2-54dc-08df23beac63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|921020|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	FLnMMnr5tdtfT64VTRChvtOjHOfdwjyKmTwbPl450QqoHNBMQs80hIakOhvUZm5zXFx07RXB7qavI9iiK8KKHR+RibyfcEniU1orERUbLC8DhCvjI7NqS+2Yf0nMDPa4UIcPRxA772r8uR/lVywAmKIHLHsWn1W8faxuSUzwCRa9zfINwwjVpmRyH27nvgi8gxyTGux1cXBUDLhPq9iiTBtQpi923QtZn+6AkIhd+TLwUB2I0Ci5+52qoVMJjD56c1UZmzEQuN3yqEM9rmvZAxyuyjUXZmN6QXxttkJ0bdd/YFqMV6WSQ5RiHkxG2cminzEpbTz8Aoo9tquArR3PDIwNwcvrZAj+yEV7Vkv7hosUXlEWXPxXOr+GT7tgPo3bJjiEtDGVVM+tJt8pEqjFuZ6Nz8mwIIGWvu+eg29/oRzxYcXM9mzY2dz5ljOdlmCqrDp7nbj90Gu+NQdRQBLkX7UHX+zjIN/jTCte+GNEmEZ8BpuD5qELH/Wwwg1cwoXiDS9biTsMfF7SiiunK9dpBiczsojB11BUjxLYMoYN8xW8nB2t0VMlDqhwsa/STQCIUpPtAZP4yJ8wSiVdEib/4il2pd+pC/LFySvfcLQFPZV0VDWQM2sIJcokYxQrNzTTMPt/yExAqRoPlitTf/b/9AkiQIo1K1uZomkSe0Xa44/bwNwzXfY1PtOVY+HrMDEF8g8Kxtp8K/jKWYgoNPAwYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(921020)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHc2d3lrSVdIWnIzSUdhNWtFcUcvcUtKUWhmUWd4d1BKazhkZ0JRL1l0SkZ2?=
 =?utf-8?B?THpndVVYejhwV09DdXVhZno1TnQ0RUI3NVBpQkh4UGRSTUw4elN6V0dTLzBN?=
 =?utf-8?B?MDNSV2VCbVdrNVNrTXdBWXFjUFJmRXBGUDlqa2lXSjV3cmpzYU1JS3NraTcw?=
 =?utf-8?B?T0h4RldyS1JCOVpHTjV5L3hxMExIeWtLMVJaanB1RVljOWYyQTlrWG4yKzNR?=
 =?utf-8?B?c1VoeEhSWHB5L1VwbXc3RXVzdVN3SE1vd1plMUZGcVZWVjlXUG9tUmZUR1kz?=
 =?utf-8?B?MFlxYkl0ZjVVZTFzdWZqNTVIKzBDcVZrendtVm1wajVpVk5HZTVVYUkxVFdW?=
 =?utf-8?B?VkE3TUNkSXRkOTBMRjdyMHF2aGxFcFFrL1hsc2R6QlRjcmZDa0pBNEdid2ZC?=
 =?utf-8?B?UWVwSGkyeVRMNTMzaTJZNW9XVXRabi8zSDAzYm1yQUJ0Vis2SU4xWmhNWGNR?=
 =?utf-8?B?UmZRRG54bWg2Q1Y1SzJiZkg4OURDMWhKK2FrWjRpU29oSlA4ejBRZnpDU3hw?=
 =?utf-8?B?Z0szY1JLY1R5eHFOTmNZMVR4MnRYdWEwNmErZjhDZWJiZkpkZHFXTCtLdEFi?=
 =?utf-8?B?OTByWXJzV3dPRG9US2Jhek5hN002RzRFMktyV1VMYnkrZjR2RjZpQkpNd01u?=
 =?utf-8?B?WjJ2dmFBNk90SFkydDE4QkJUVXRxTXZTcUZ6emtFVHIvZWgwWmFuc29wK2Ri?=
 =?utf-8?B?bFJrU0xhQkIwNWdpVzMxc0wwQjRVT2pldjN4U21COS8vZjVZUXBiT29aTWN5?=
 =?utf-8?B?bExWMFJRZGZCOVNJUFJNcG9xdHdLU0d1Y0htTWx3L0RCSThuemRTS0dPcDIy?=
 =?utf-8?B?TlZSaWVaMi9EcTBWQWR6ZmZVSWtRcDM3ZW4wNG1pa2dLYXBQR2c1WWZDZlJD?=
 =?utf-8?B?VjlWSFlaVlJmQmVmcFFVeTV0M3ZlT3piRXZOTkl6MWlER0Rqc3V5WXVaRVJC?=
 =?utf-8?B?VExJUVYyNk41ZzZlbmJRbGxFZ3YyTUNwYS9sOFVoT080UFVwUFVSQlg5SjQ0?=
 =?utf-8?B?SDhHVm85RHE2Z0prY1dZeWRJMWNMVS9vemxMbCtOS2FrSmVHK1ZXeU1HdEUy?=
 =?utf-8?B?aHpBMXZqNTdPRllpajhJUk0zaDlNS2xGS1RocnlOUlFFKzZCc1F1M1NaQXk2?=
 =?utf-8?B?dHFLNytkQ3hLRWVHZjlHYXJQNStpaTExYmF1cWtvMEN4WU5NVG4yQ3BGTEJy?=
 =?utf-8?B?SGFlSXBvUDRlcmNTRVoxQzVQMzRCVE45WmdydzJSM0pEdHdPT0hTQ2tvYXdi?=
 =?utf-8?B?bUEyNzNEQ29SenMvL05oRC92SE41OGp3anVJTm9RS0hndWwra3FsaWl1ckE1?=
 =?utf-8?B?Vzh3OGxiUDJyTitzTnBheCtOREF6NkJpdW9XdkxBdEtZS2FTd3VuQk1pd2ox?=
 =?utf-8?B?TVlqbjdRZmJLczlZYWVMd29hdnhZYU5XTHBtaVErS1IzVUVqRGVqMUMva2dZ?=
 =?utf-8?B?K25TVzkzRGxVd2NkSk53SDBSalVnRS9FZTMreDhRck1TaUk1QXJRTUgxUnRj?=
 =?utf-8?B?RVkzZDlPWGVqSlRkSmdXYjhaSXRUWStBTTNJWFl2VSs0ZE9kdkJQQ0YvZ3Z6?=
 =?utf-8?B?SWI0ZDY2bnNYVEQzQnQ3Y25TMmxibWZrM3ZNRzlaYi84Tm1kbmd0V1ZZRWNK?=
 =?utf-8?B?cUNoL3pCdFNoRjIzWDlKTXVFUnBwQmZUNXFpbzE1UGUxa00rbkVXb0wzbzNJ?=
 =?utf-8?B?Smw2aUNGVnQwS3lSSUUrQ2I0b1NSeWliNnE1SkhNVm1wWDliNWRDSEgyQkdy?=
 =?utf-8?B?Wk1MemdGZ1ZxbFZFSExNcTNLZ1AxeEJVTkZrc1hEemdJbGJ1N2RZYnVtdnpP?=
 =?utf-8?B?T21kclJkKzJwSjBhVno3SnUzOG9iT1dZZmFWbmNhZXorNGdtak1aZTU2cm05?=
 =?utf-8?B?QnZBS0JuL3Q2NW5QZ3ZXeVUvbmg1eWU2K0hhQ1I1d0g4NVRRR3pLS25DOEJo?=
 =?utf-8?B?U1RXMDJEYUZnTU1RUkE3cis2UmtQQzNsYW5tQmp1MlNPNGJNbGxJZkw4TXVJ?=
 =?utf-8?B?aUp2dzQySm9Hc1dBaVp4TTFvVTdjQUlmc3ZoK2luRk5ZelBqL1RnTkpaSDYy?=
 =?utf-8?B?QTdYU04rcXc0T0ZjMjlDb3ZVNHFjQU43UDlGSmZwdkVTK2xEeDZmYnh5V3JC?=
 =?utf-8?B?SEI0MEtFbE5zam5EVWdkZ3JHUnNxaVNIWXAzQU9EaDV0eEkxeVhIek83TndK?=
 =?utf-8?B?d3FhQlFLeGhLeHdkVjh2RnZuR0JRSXRKdTgrbjhQVU9Dcldjbjlua1RJeEdL?=
 =?utf-8?B?L2JYZEU5b0tac1g4aXZLaXFnKzh0cmZiQ1prYWo1L2Y3aGRDUThYQVlpdjhm?=
 =?utf-8?Q?kO1JcWJeCD8JHBHKrW?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb947b4-315e-4ec2-54dc-08df23beac63
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 15:29:55.4123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCHaF82OU/CeWbuCQpRasZop1rn1OJdMHSCvVv+aP1C7cSJTYZrs0tbI416oBE0ymcT6l0UQSWipacoJyvwvuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1817

More attributes are to be added which has the requirement that they should
only be specified once. Add a utility code to extract attributes for a
specific path and report error when appeared multiple times.

Convert `#[pin]` parsing to use the added utility.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs |  9 ++-------
 rust/pin-init/internal/src/util.rs     | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 4ffa35bbbccd..ac83f0f73e61 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -137,12 +137,7 @@ pub(crate) fn pin_data(
         .iter_mut()
         .enumerate()
         .map(|(index, field)| {
-            let len = field.attrs.len();
-            field.attrs.retain(|a| !a.path().is_ident("pin"));
-            let pinned_count = len - field.attrs.len();
-            if pinned_count > 1 {
-                dcx.error(&field, "#[pin] attribute specified more than once");
-            }
+            let pinned = field.attrs.extract_single_attr(dcx, "pin").is_some();
 
             assert!(
                 !field.attrs.iter().any(|a| a.path().is_ident("cfg")),
@@ -159,7 +154,7 @@ pub(crate) fn pin_data(
             FieldInfo {
                 field: &*field,
                 member,
-                pinned: pinned_count != 0,
+                pinned,
             }
         })
         .collect();
diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
index 2a57a25b70ae..3ce498cea754 100644
--- a/rust/pin-init/internal/src/util.rs
+++ b/rust/pin-init/internal/src/util.rs
@@ -4,8 +4,15 @@
 use quote::{format_ident, ToTokens};
 use syn::{Attribute, GenericParam, Generics, Index, Member, Token};
 
+use crate::DiagCtxt;
+
 pub(crate) trait AttrListExt {
     fn extract_cfg_attrs(&mut self) -> Vec<TokenStream>;
+
+    /// Extract attribute with identifier `path`.
+    ///
+    /// Report error if the attribute appears multiple times.
+    fn extract_single_attr(&mut self, dcx: &DiagCtxt, path: &str) -> Option<Attribute>;
 }
 
 impl AttrListExt for Vec<Attribute> {
@@ -25,6 +32,24 @@ fn extract_cfg_attrs(&mut self) -> Vec<TokenStream> {
 
         cfg
     }
+
+    fn extract_single_attr(&mut self, dcx: &DiagCtxt, path: &str) -> Option<Attribute> {
+        // FIXME: Replace with `extract_if` when MSRV >= 1.85.
+        let attr_pos = self.iter().position(|attr| attr.path().is_ident(path))?;
+        let attr = self.remove(attr_pos);
+        self.retain(|attr| {
+            if !attr.path().is_ident(path) {
+                return true;
+            }
+
+            dcx.error(
+                attr,
+                format!("`#[{path}]` attribute specified more than once"),
+            );
+            false
+        });
+        Some(attr)
+    }
 }
 
 pub(crate) trait MemberExt {

-- 
2.54.0

