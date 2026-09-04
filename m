Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020101.outbound.protection.outlook.com [52.101.195.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA08F4ACC75;
	Fri,  4 Sep 2026 14:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531170; cv=fail; b=aV9r/XW3a/7UgtHxyMmSI3/ifgE8I2i/7uubX+Eq3Ep0R0r/Y1cC6Ygx9zVetFyKOJ1PeWJGJT3Za9zQataNrK6id8kgDA5DyGhqFt5HndpUqDESHDLAP31J6t1in3lDR2PiAH6flVsplNO/pTlKkU48sTt8D4zFu9GnHZqm4R0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531170; c=relaxed/simple;
	bh=z2m2pH5QymFTxl9lX2nrBsBHr933wTMg3TZl5cpaDys=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=i675B6Mo+3BusLI/j/lzVaqcxTtjXovjxlpGVgiu/RbNIyyVuY5VGfxBBk66f7U+U1SxdpI7brDxxFsHAd4YgVKMMCAQjbeKf1gm33uIXK0ytg2v+pA2rr2BpS6hENIMtoJT0tTgI6kpajcJSE2vFUAXAQvQXIfooUN0eEEDjBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=AK6xyRmX; arc=fail smtp.client-ip=52.101.195.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="AK6xyRmX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRg+hWmZtsFDEmwjkp933E500XrRy/+orbsECJVz/UfrD7vK7sQO9uf/BZfJAFcPBojAqtT9HNr56Fbv4+EyoxfURwKP0DjiCTyrm83oT42Cwdp5thzvSxyxJwQgDenOXzKjgKlyIKhieDKE2rOyuM7FhB059bbNP+Vl3/jpKeV4ZqJisPOmSgOETpQ3TJ4/wVGSpQuk7RJcmIGDlnk5+k1oOaDrfyr/QtVW7D+SQG5IfArIMNbe2jImdKyZd3LnAGt2ehWE82f1UBh5yBNwXQXNyZDR3bEH0F1uETiXFphL4eAwsOOXq+j880LabdQhtTzhqB7J+erB5SpW55zi4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acBuirXj+oy1DXSEQu8Obok8b81IDGs9J8W2HTwHLXI=;
 b=LhQFeEzhMgWMPzovNw2Pjeeo9Irjk7qMTPIJBpvLBZSW/7SLWwNMnEIkGsarpJv+GcItPcc6x8VGWQGK7Buh8acghy5nDIuUh2ENmpCufGPg4Iw6oxZkhDtdeWLnBocmCTmIbH6QN+xtK6WVlNsMKWzv8U1K+eP02c6QKBTv+o43NRL7jBf7/tRRlvnpmUBZ8IX4yrwLzdn2vT3tB6dZ9+3DVBhYbQBriBFtMZCPVy65Lfui5Ure56XhizIozdzF5nw2L0mOoxZZM3EFj8shRIiUomwDnk2xow7x38iWoV7JmEY8gxGsF+CEEamMJGUDWJzeKOB7nx2CxQIapsbIig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acBuirXj+oy1DXSEQu8Obok8b81IDGs9J8W2HTwHLXI=;
 b=AK6xyRmX8sE2WUCsBHiFB+c7ym8tRl+RzGb00230GE0lXuhfUfXWSS2rKpno2lGr/yksQ8I+olTcz0qBV89zjnYldRgBH+Q3o0Bb8W0LQbofzMA1oDKg7/uY4LI8IX0FeC1ZHAg/61LcidqRjknWOW50PfIHRJARPBMd3QDKwxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6690.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:12:36 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 14:12:36 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 04 Sep 2026 15:12:29 +0100
Subject: [PATCH 1/4] rust: pin-init: internal: extract utility code to new
 module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-tuple-struct-v1-1-72c50bd037fd@garyguo.net>
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
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531156; l=3058;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=z2m2pH5QymFTxl9lX2nrBsBHr933wTMg3TZl5cpaDys=;
 b=WztIzjsmkoQ9CSm5blXwjwVUfATXW+7ROKOGarQzGm4ewW1YKu/IF1yyZk3YTUiYEQ3eL240J
 dusG6KKkklvADKpRLjggDsDvi1MngddWMhmy2cethp7qzrb6n8p9dir
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
X-MS-Office365-Filtering-Correlation-Id: 6f5da472-047e-47e3-f61d-08df0a8e926e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|376014|10067099003|3023799007|18002099003|56012099006|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	6xedqbNqIGq0t4Tu8EzJAzEr7SXp8Ny5hXqwFsjRsW/S2eM+0E+LMiqgrq8WjqIcUOCDPEDfckevve3fyR0mgJVEBt8sVeZ1T0pWGkZOOAikhCRpIkpCijLd0EPMKlJH4M3JFGiOqAbljX+B77JhpiEo0YDo4APyHNXy4dwPJriGDU+T8/RBXyKQMjC3cMNjsIuJVLGQ2eNNndGbrTvz/0UuALd1Yqj4U/yXjyrJ9rhlG10dctzvh5AnBH1g0IFlY3s3B16zHJyu52u3lBo9y/jF95HZHASOwVlvpQPUcrno8jG3+PdFxfNQK91W7L2BJhlsZ2EePODrgrfCwQ6vJk+WSkEr+zpshvXBEVrEhPsJa4eVgoQmGSeRk7ARmWRC/BFTUrrbS/ravbkgI8aSDS7GyJpHO8Fq24UcIxj8Pu3PXHCBkl7bsEAC8Ue2y5oKTynUXob1F9K1ypeQO6/QQXNfdk2OF4Q9e+CMYljW7isznt92Bt1B5JhQWlFW3H3jc7HWl74QGo7aW4NRfokkpbHVgCyOGX8uT+G57cfTY06kFOvGACEU4v3N91DoHI5hMs+PMrZrUXlWxxXbiJzXc6GfWMQE/bJjgAlzxPY2CqzMjzIZIKRk8+yvf65nygLVjJ05VqeNd2Fu91BFraeABwpU+kHba7KllMqQHZTHxJW/0721ldR5p27QjGqcA6nKiprcJMZ90hcLp8LYVrfulQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(376014)(10067099003)(3023799007)(18002099003)(56012099006)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1VCNktqUiticnhzSHhtd0Foa0c3c0VEbzM1d24wWlo5M2ZhZGwySUdLVFdF?=
 =?utf-8?B?MjhjUDBYUkhESE1lck13SDVJRmloMThUSktUK05FSXhuWUpHbFZiS28rRit2?=
 =?utf-8?B?T002Z0ZzWWhPTU1ZSDdhZHdHMzdRVmlJVloyMWQxSUJyc096WmtvelpGckN4?=
 =?utf-8?B?amtJUGwvSjIreHE0MU9pWjdwUSttLzgyMUN4RXBUdnBaZThkV0M3RGw5S3NH?=
 =?utf-8?B?Smc2UWszdDhOcTZ2Y1pBd1FyeFFGVGgveWtlWTdyc0t0TThUR08yOFN3L2oy?=
 =?utf-8?B?UVFXWjNuUzZVbHZualVpNlBydHo4S0RvQS9sU0lvMmlsNXJKeGJ1bHRXOG9Z?=
 =?utf-8?B?ek91RUpmL3N5clpPMWxYUlgvazNvYmtORHg0TUl1VkdDVDhqcVNVaFZMaXlF?=
 =?utf-8?B?RFZXck93UDF2aXo2V2FscjdDZk1Pcm12N1NEUThpaUdLdzdDVTc3SWZ3T3o3?=
 =?utf-8?B?cUZKdnQ2RVQwQnJHUkZYOTZDaGl1RFg4TkZmTlAwbGVMS1IrdnhpNVE1SHpD?=
 =?utf-8?B?b2FwY0ZqSFhjdjFPSnRoeE9SRUZoTnZrekRobnVXQ2RxOHVqZ2tEVDM4dnZw?=
 =?utf-8?B?S21lUUxjNy9iL2JBaHNhT3NNVitUbzV0YXpzRVJmYTdKMThoZHVpNGt5VWNN?=
 =?utf-8?B?M0Y2bWNMeEFhVEt5YkN0blN5Q1l1bkdFV2tTNkVaOUZENS9kQ1BMMFd5eTBG?=
 =?utf-8?B?K2FITXNZQldJalRidEtnMEgvZStJaDg2cTJMUUJidDYzejlkY0RuTG1zbUpS?=
 =?utf-8?B?MWFyMldYMHR3Vk94cFBkL0FpaXpUN1VOa2JGTnhNWk0rZTNvKzFCWDduSG1l?=
 =?utf-8?B?NFYwdFNVUjB1Q0E3RGVQZnZ0Qkd5ajBnd216VDEzRDZ5ZzZrMkd4WUdmUzlT?=
 =?utf-8?B?TGEydm1LVUhobnJNRUZIQUp3UndzckRhamVaWXZvRGRja2p2empFcVV3MkEx?=
 =?utf-8?B?dGpUc0d6b25RbzRVWE0vOG90dEtHaHVJVzZnWWdTbFQ5TlRGdDVwMTZqbGFQ?=
 =?utf-8?B?SjczWUxPSGYwRUNRT1ByZ3hKSkNSSVRCaDV4V3d1TW5MNHN6WjhDZW9ScUdW?=
 =?utf-8?B?OE5GTC9FMkVLMHdBeW9lR1I2YlNnVHpaeExmcWF5dUp4UU13L2VMQzlMVEhL?=
 =?utf-8?B?MTgrTzVVUldROEprU2tKeFg2RnlITG9kREt0MEc2bmZsZER3a2xJMXFlaWo0?=
 =?utf-8?B?WStjQTZxbHVhNjNGNkNmUUplMHQ0Q3N2bG5EV2xjdE1SUndDN2NmWlQ4T3R6?=
 =?utf-8?B?RjNWbXZUQlpYZ0tRbEtpcEsvWWlSeXNrckdybzNvYkprbDdhZ1pHRWdNaTQ4?=
 =?utf-8?B?NzFIZHMyMTNjZnJpbmc4NnZkQWJpbUhjM1g2cE1GU0RyNld2Unc4dWhmdzlC?=
 =?utf-8?B?WFpjUGtPMnNnbUEyQWJIbGU0UzZXaldUUktyYWNoNmlWOEthbW50ZEduUUs5?=
 =?utf-8?B?YlZJVFFaUjQzTkMwbVUzakxZNjg1VHFBL2JJMFlBZGphdkF0dVQ3NU9BcTdp?=
 =?utf-8?B?SWNoUXh1VXo2UXRYS2tQbVl3UFVNMU1vSFcwUXNrVi93MlNNeStFMDhSNVVL?=
 =?utf-8?B?MUc5ckVTT1ZISmh2WVpjNnloUTdIT1FiSzloVXFLVGxuSWFjOWMyaXhnV1VY?=
 =?utf-8?B?SndTN2xNU3UwY2czcHhiR1B1MnU2Rmtmc2MwZmdBY2FPakk5eTFndE45VHpP?=
 =?utf-8?B?MDkvdnFoUWp5YkJWVENHbGdoQkNuSkk2UEtsMDR0NXhWNUFtcnl0a0FYYkJC?=
 =?utf-8?B?elR1dFJIa1kweGF1MWNNWkFWaDdsMkNCVHRjUCtCcExRNnFlcUIzSitrdDNY?=
 =?utf-8?B?TjZ0S0h3VlBiU1paanJIbGpiaEVDVWhZdEFsUnZkNTY1a1VaL3FKTkZtUkI4?=
 =?utf-8?B?cHBscnVuTnBXU0Y4UTE4ajZWZ2ZzY2hKQVYzSlFvTEQrNHcyNG5ZSFVSTUdL?=
 =?utf-8?B?N1AwV0FLS0ErVDV3dnNzRmZFMkRVTEFoQjZQS3NBbUJ3Nkpwb3lqem1KTE1o?=
 =?utf-8?B?L1dlaWFGLzZpWTU0OThzYU11S0dOTE5HREJkUVVkekNqeTh5OWs0K2prYUdC?=
 =?utf-8?B?V1l0ZXVQdk9MYVZ1UmE4bkVIYy9XVWRWNGZOdXgrbUFhaE5VSUhSM3cwRUZk?=
 =?utf-8?B?T3FSR3Ryc1Y1RiszYzdGVFJPeUYzc2IvNEljOWVkcFJZWlY4NFZmeTZNa0hs?=
 =?utf-8?B?UDkxc1ArVUxTWW0xRDRUWmJOVXBBS09Kc2ErWUh5YUU1eDhJaStvODJWMS9S?=
 =?utf-8?B?UEU5ZVRGOG9QV21QYmJhd21hbS9PSGxta2pOOW10UjRjR1IzZHNCTlgvQWR6?=
 =?utf-8?B?VWEvdHEraTdlNFVueVpHRWQxSzJaVkY3QXdzU0pBQkVaUzQ3bVpkZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5da472-047e-47e3-f61d-08df0a8e926e
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:12:36.9063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 045afwZ9x6+frZJGT34nalboTB7UCXraheGfsfaQfAWDhqF0QMAZDSYOeD0BY/mYk0GCawLrGg6eot+44pe5xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6690

Create a new `util.rs` to host utility code that are generic and can be
shared by multiple macros.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/lib.rs      |  1 +
 rust/pin-init/internal/src/pin_data.rs | 17 +++++------------
 rust/pin-init/internal/src/util.rs     | 27 +++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index 60d5093f3128..4d8ff86484b6 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -18,6 +18,7 @@
 mod init;
 mod pin_data;
 mod pinned_drop;
+mod util;
 mod zeroable;
 
 #[proc_macro_attribute]
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index ff194d27565e..074bc6b3091a 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -10,7 +10,10 @@
     Field, Fields, Generics, Ident, Item, PathSegment, Type, TypePath, Visibility, WhereClause,
 };
 
-use crate::diagnostics::{DiagCtxt, ErrorGuaranteed};
+use crate::{
+    diagnostics::{DiagCtxt, ErrorGuaranteed},
+    util::*,
+};
 
 pub(crate) mod kw {
     syn::custom_keyword!(PinnedDrop);
@@ -81,21 +84,11 @@ pub(crate) fn pin_data(
     //
     // We need to perform this after parsing so we can reliably detect field cfgs.
     for (field_idx, field) in struct_.fields.iter_mut().enumerate() {
-        let cfg: Vec<_> = field
-            .attrs
-            .iter()
-            .filter(|a| a.path().is_ident("cfg"))
-            .map(|a| {
-                a.parse_args::<TokenStream>()
-                    .expect("parse as token stream cannot fail")
-            })
-            .collect();
-
+        let cfg = field.attrs.extract_cfg_attrs();
         if cfg.is_empty() {
             continue;
         }
 
-        field.attrs.retain(|a| !a.path().is_ident("cfg"));
         let cfg_true_struct = quote!(#struct_);
 
         let punctuated = match &mut struct_.fields {
diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
new file mode 100644
index 000000000000..ed18ab7d45e6
--- /dev/null
+++ b/rust/pin-init/internal/src/util.rs
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+use proc_macro2::TokenStream;
+use syn::Attribute;
+
+pub(crate) trait AttrListExt {
+    fn extract_cfg_attrs(&mut self) -> Vec<TokenStream>;
+}
+
+impl AttrListExt for Vec<Attribute> {
+    fn extract_cfg_attrs(&mut self) -> Vec<TokenStream> {
+        let cfg: Vec<_> = self
+            .iter()
+            .filter(|a| a.path().is_ident("cfg"))
+            .map(|a| {
+                a.parse_args::<TokenStream>()
+                    .expect("parse as token stream cannot fail")
+            })
+            .collect();
+
+        if !cfg.is_empty() {
+            self.retain(|a| !a.path().is_ident("cfg"));
+        }
+
+        cfg
+    }
+}

-- 
2.54.0

