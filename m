Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022082.outbound.protection.outlook.com [52.101.101.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6A149DB85;
	Tue,  6 Oct 2026 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300602; cv=fail; b=MIyGKB9IrXz02Z4YtOmMnaIzlf5Piyoh1OeeJB4ZnEKYqi1AloHdgKfjfg+AiIFYFWwU4GJgYZY9p5l7vJYGZYVEexjnweZG/jDy8jOos/SH2rfQq3PBVFM5hgIlGiFqwKA2yhZbtbIiDFZcZmFV3P/wr+PUdmKuP/zEvaI2lxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300602; c=relaxed/simple;
	bh=4C5gdl9jYfpy+gAWon/LYA8UW7Kn6+8WSqJXrowiXNU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=k9As6Y1/oRiT5aNj8aPgoT+C/cGocjIBmt/FZGELiKeTWsVD/olrcitkLphTGKqpZKSRJq3n2kSg/GziP43v73S+R1u43Cp/D64Rj7LQ3hbuBWtrWyNKF8Pe5AcdZH4vN4GE0kZOIqYnU4DVwVQ6EjiZhRp3U2aESrVyaPiB5yM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xNmS5q78; arc=fail smtp.client-ip=52.101.101.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xNmS5q78"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPE5sjf+b9xldx8KPalLCzE3KWrnrpxWgitHB/Q41kDAuEucOMXqv3wVWqZIHCfc0Hy/bBGPV/XgD018jWR/G0eGI0qNmsrzrMheiYZkoKGtKWU4gIUHTQSNBpwbaxTKovqgvxSA3f79ryS7steyOJAaM4w5bV1PVvMGDetI/x38ORaJVEBlqsSBgKNFiGm9jAQqhleCE6KXn507feGMs0Wl4oredRcc5IAL6eOp9JmrZJev/kxKorQhCReUKAKikKQW0xMkx1fDluPc5S3m1fs1JJH+NQaeC/Qn94SWYc2AOFG2vndfIcfsv2RsD/ZVrLODw6Ru7hUTcmfDYStNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJ0BF8Xtz5CCVEQqk+z2U2bdvb3INJIpxAZNqeOMAIk=;
 b=Qf2UlFCAFVMec/AN6RWGSS69QMZ9rAzqigdOcv1noXouEZtICcSjg+QTUjQJ7/UfMCJB319zHlRVV63STBwgWPWO5P1a2SKFNd8onyzBuhGPDHQ0cREAoUb6tGlMKd5n/brJzn/gn7+KeZRUzZAWurLMjGmYoULZ95t/4ZOMl1QpFURRtJvj+4RMEdHvtJcWJTnS7p0rznvOGRrHFXglc9mmPuX/MTa6QqPlA2VV/CzHWGQKUMetvMq9BoiLgQI5dIZqf1TAd4Y/7yIL8qSrxq24+7bCUtwm5h75oM22CtrZ6SlKsRKAj53Rm1zd6cXzywa0QHw7FaihIDcWKcudqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJ0BF8Xtz5CCVEQqk+z2U2bdvb3INJIpxAZNqeOMAIk=;
 b=xNmS5q78V1rvIoXySKAmzEn/3d3f6q99L6Mzr0lSjKagocEmqt/luYyyKgeBaDuEJ3/f5DK7C+29WZR0TpLF9LYpnGcv7e6Xu9yru7O4gkT5xaxfT+R0ko8o9W7EC3G0qP5qOHpDL5HkgTcB3yz1hCujbeYmun91j3mDzWuKf8g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB1817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Tue, 6 Oct
 2026 15:29:54 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 15:29:54 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 06 Oct 2026 17:29:33 +0200
Subject: [PATCH 3/8] rust: pin-init: internal: add utility to handle
 generics merging
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-dev-selfref-dep-v1-3-da716f740d6d@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7805; i=gary@garyguo.net;
 h=from:subject:message-id; bh=4C5gdl9jYfpy+gAWon/LYA8UW7Kn6+8WSqJXrowiXNU=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWUeF30pvNGb7J/N91YtJSorlMpbXQq4rrtq95ObmH
 lWVWfJaagodpSwMYlwMsmKKLB7djGmbGGfLXtYqfwkzh5UJZAgDF6cATGQXE8M/9bN6wQ/iDhxT
 CFWS+SOzd19tWukhDYVfuxmXO7BPiH/NwsjQ+ThSJDRzj1P74sL52wr0MrY2ix/6fyzBOYjxyea
 KSdZsAA8rRDk=
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
X-MS-Office365-Filtering-Correlation-Id: 6832bb9e-7f84-426f-d0d5-08df23beabcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|921020|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Yg5iiaQiar1b9vK+aPcfneGKtQoNVrYowoQIUBiKUvd19Oz3OcYv7miR2O79wdIVaALI9CXWkDBKwp3+RwzpttMl2xuJK/Txacq4FUzlUyTzvqKCwS5fgF7NeFFgq0WNSaUmu9cqRZsjsPZNa6eBYnjQ8/1h7PqbgmXfLiFvizO1S1Uaryy2JqTp8xrklBivjrJdPODUW/toK7FBgw+h/XtQiV0vHN1xhZ1ie5i65s1Beyu37uO9/9F956BF75m4QUog4a6RvYNrzSzjAzmyx44RVPZpJqmsZohAnnlim/FYMphzA8w5UONI38ln9IZDYKKvdimzsJGe248TPD35OymuOkCwZICoSzoYanyYHaQMtM/d5pJp/R4BbJvuCRVbdD4+A/GeSK1UMowse6nouh9943wKCFpQwNeaKF0+YaykB53NLylw18C+TcxBNHm81yzPImMNBBHlsEqYFhhjwO76MbS86mWTZMaLnDZKWiB1hzBI2+qMsq43JQzyiPel8dEmvQ7Zz+qUJZOevHyerdUhzSu+u69M7tHnZfIWCjXkdK6xeGOeUF6X+kCCyawTvVSf9gMWGHis039O+1b9SijEMazu+5BnXDmJvPQOBx0XQXo7pdrsutZyt83sStsSay0wRdyjWe1+QtW1Oip/jjlUAPxWd1hprdEUykxiIj6J6Zw2yRYtSytY1fwAIQfuqtPrmeUozRo46RnfgkS4sw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(921020)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk9xZlFncmRudkhZWENCUnpzL3huR3htWVlGQk1leWpyVmJOOVNsRklSZlZx?=
 =?utf-8?B?NlB5YitOc3RHMitvZHhWRE5MckVWOXdXNFRPZG5qU1c3QVcxVXovbWV1SzhU?=
 =?utf-8?B?ajBFNFhLUXl0QUh1MFJ4akJHNmxEbXVxQ3VLdEp6N3dxOEhWcGdtNDRnSUFU?=
 =?utf-8?B?S3lIeHdlTXVoaWFlVkN1YzltWk5jRjU2NVVRaXJyQUFwVjk4OXN6VjVlOW1P?=
 =?utf-8?B?VjFSMzVUUlRXUklQeU5LYTJrVnNJWmZoVGNkcjZoc29mdXlLVitKMW0wa0w1?=
 =?utf-8?B?NzQ3VGE1Y2ZsWWhsVXVIRXVWUXBTL294dXkxYy84WjBRaUhsRTJmeVR6OW5p?=
 =?utf-8?B?Z3dxalJMME5EOWxIWHZacHlsVjJiTHpNMEZXUG85UDQ5OHlrL3hna3JDdnZ0?=
 =?utf-8?B?SFB6L3NrN2x2TDFPRU1rZXprckF2UldXMkRtYW9XOUVNMUJsN0ZTbEd3Ymp3?=
 =?utf-8?B?OGVmTWpycUVZUWZMeEUva3A5dk1IcEErWnNoYnNVZXV0SE1wd2d0c1ErdG9Z?=
 =?utf-8?B?ZW80K0RBc2Y5dENDQVVkSlRhaWo5bk8yanhEZHJQV2oxZE45dTlDZTRIRHdw?=
 =?utf-8?B?TncxY0FwZzIra0FydS9oaEw2emZtd25QOCtXREdCa29lUGRVdHVXcDZBcjNr?=
 =?utf-8?B?WmdCeGw0cUVJNmpJZFd3S1BTZWRvMGgyUlRnUjIrZ0hzYWlRaG9mUkw3aUZF?=
 =?utf-8?B?dnVKQ3RVcExkVWh1dHdlUHdRSmJIa0tTQ1YwTi81UWZONENtUFJkMTY0V0N1?=
 =?utf-8?B?N1cwclZ6YXN5RTVydXJPZXZNWUN1TFJIeWNrM1F2aXNaN3AzcjNnTUVxaUUz?=
 =?utf-8?B?UEF3Y050TXZTcEdiazdxbE15SmxEbk0vZVJEbE5lZ3hXdVVsV3IvMUEyVEh0?=
 =?utf-8?B?cXArR0YvaE83L0NXb2c3bUtHRnpwYU5uc0pDWnRFODEwQ3E0cEFXZy9Sb2FK?=
 =?utf-8?B?dEhMZXBoZzQyUG56Z0dzNTdHSjV5RXJmQWgyREZHbmJhaExGc3VwVUUzbTVl?=
 =?utf-8?B?MjJFVWdMbHhubEpyOWdyVmtzblZzUERaVHJnNzdjMnBWT1FRcVhFc25JcXFu?=
 =?utf-8?B?eWl3ekNtQUZjSGF5L3FLUHh1OC95WjEzVzJOZk53TlN1djMxekpuQlRycWhp?=
 =?utf-8?B?ZHVXbW00aHVrMDBPSS9NNmxULzV6WHgzYlE1Z2V2aEpkVlM1SDlKdmtJdzEv?=
 =?utf-8?B?U1hLTXNZa2hsaFg2dWVUamFEOC9JOWc2NkJRN3lpeUhjU2lyQVVhbStjd2dP?=
 =?utf-8?B?SWlsNERKV09kTDYvRUhNRGZYODF6M0E2WSs5WTlpNVNQZEhyMEhDWDBkZ043?=
 =?utf-8?B?Q1BtbUkvbmpsaEhybmpmc1Y0YzdHb2pFUjhSRkE3TGxvNUpoTnFxaXUrd2R1?=
 =?utf-8?B?a3QyRHNReWEzMFV0MG1DSE5TcUFESFNxRlRxK2ZOYTVFYWIraTNYZCtSQlNR?=
 =?utf-8?B?ZUIvbERiYWtrK0VzMER6YTNlSHRXaGhrMUlFQTBmMGlKSktia2NrNHozSFpJ?=
 =?utf-8?B?MFI5blRFQ1V3alEvbzFBcmoyZlUvSjVNRExjOVU1TXlkYk5vcTlOYjExRVFa?=
 =?utf-8?B?eDBvanZxdHN3V3JaZXhtczUyVFhyQTV6SHMzVGR5TVZyd2tGQzllUTRrbDMw?=
 =?utf-8?B?Um1CNWlFUGdXMWZRRUNKenJLblBHSUMrWmV2R3FuVnFZaXl4OS85aC96U0ZW?=
 =?utf-8?B?MzU3b2NzdUtWbXIzd3ozdEREb284bEd1SWIyWTUrVHpqZ1BtaXFZa1Y3R0lx?=
 =?utf-8?B?VXlocUJ4MTY4clRRTnljOU1MRW5ZV01Xek9uMHptWURpYVlSNDNQRHpDS1Ja?=
 =?utf-8?B?SUczNWdWVXRqN21UbFhOMHdnQloybkdBZk11UTFiMzd1UWVzTjdvb2ttY2JP?=
 =?utf-8?B?eE0vaU52aytTa3VnTUt4cFd1eWgrRmU3TG4zSitUUlNFUGFjSktuN0ZTRFBN?=
 =?utf-8?B?SGs0T3UvN3JGZ24vRlV2dWMxbFM1bFBTWkF0bWk3c3hqZVdpUkVaM09xTmRh?=
 =?utf-8?B?UFhjVDN4T0NzYlczRkE3MDVKV1RxdEduQ0l6eWk2STBDeURzbGlONERxSGVT?=
 =?utf-8?B?RmF4VGZibW01UlNRQ2h6c0JKNjJ3NHhaY0t1MFVHVk1CRXhXZk54aFZXYnZV?=
 =?utf-8?B?b0I0Z0Nnbmx5Vy9OSyt3SHM4b01LUEJJVXVLaGJQQXlNN3dYNUdNUWVlaW93?=
 =?utf-8?B?UWVVSmRNSmtDeUFEd3VSN3lDS3VkRWJ3QTFFcUt1bkVuN3lFMElHQi9VYzIr?=
 =?utf-8?B?a0swbkxoWStJYk5oWW9tVVBYM3AxWC9hdkxUUWdQM1ZTSWN6THBTcThVMExT?=
 =?utf-8?Q?AyFMVFN62SjRXrAnOI?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6832bb9e-7f84-426f-d0d5-08df23beabcb
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 15:29:54.4109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4NSoD9Z7SKeTh7rhpiwwfoy1x76cZw0oZMDQwe3bUCsdOTr0sks9vB0CW5ydZf6H0MJjd26evJKbKKqWj6AZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1817

There're many cases where we want to merge multiple generics together.
Currently this is done by cloning generics and modifying it, making the
code less readable.

Add a utility code that allow printing multiple generics together, ensuring
correct ordering between lifetime and other parameters.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs |  10 +-
 rust/pin-init/internal/src/util.rs     | 164 ++++++++++++++++++++++++++++++++-
 2 files changed, 168 insertions(+), 6 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 982a38ceea93..4ffa35bbbccd 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -321,10 +321,12 @@ fn generate_projections(
     is_tuple_struct: bool,
     fields: &[FieldInfo<'_>],
 ) -> TokenStream {
-    let (impl_generics, ty_generics, _) = generics.split_for_impl();
-    let mut generics_with_pin_lt = generics.clone();
-    generics_with_pin_lt.params.insert(0, parse_quote!('__pin));
-    let (_, ty_generics_with_pin_lt, whr) = generics_with_pin_lt.split_for_impl();
+    let pin_lt_generics: Generics = parse_quote!(<'__pin>);
+    let generics_with_pin_lt = CombinedGenerics(vec![&pin_lt_generics, generics]);
+
+    let (impl_generics, ty_generics, whr) = generics.split_for_impl();
+    let (_, ty_generics_with_pin_lt, _) = generics_with_pin_lt.split_for_impl();
+
     let projection = format_ident!("{ident}Projection");
     let this = format_ident!("this");
 
diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
index 0b5c28b21091..2a57a25b70ae 100644
--- a/rust/pin-init/internal/src/util.rs
+++ b/rust/pin-init/internal/src/util.rs
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
 use proc_macro2::{Ident, TokenStream};
-use quote::format_ident;
-use syn::{Attribute, Index, Member};
+use quote::{format_ident, ToTokens};
+use syn::{Attribute, GenericParam, Generics, Index, Member, Token};
 
 pub(crate) trait AttrListExt {
     fn extract_cfg_attrs(&mut self) -> Vec<TokenStream>;
@@ -52,3 +52,163 @@ fn display_name(&self) -> String {
         }
     }
 }
+
+pub(crate) struct CombinedGenerics<'a>(pub(crate) Vec<&'a Generics>);
+pub(crate) struct CombinedImplGenerics<'a>(&'a CombinedGenerics<'a>);
+pub(crate) struct CombinedTypeGenerics<'a>(&'a CombinedGenerics<'a>);
+
+impl CombinedGenerics<'_> {
+    pub(crate) fn split_for_impl(
+        &self,
+    ) -> (
+        CombinedImplGenerics<'_>,
+        CombinedTypeGenerics<'_>,
+        // A stub type so `split_for_impl` signature matches that of `syn`'s.
+        impl Sized,
+    ) {
+        (CombinedImplGenerics(self), CombinedTypeGenerics(self), ())
+    }
+}
+
+impl ToTokens for CombinedGenerics<'_> {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        // Most of the time we are only adding lifetimes, so we prefer to place
+        // the user provided generics last.
+        self.0
+            .last()
+            .and_then(|x| x.lt_token)
+            .unwrap_or_default()
+            .to_tokens(tokens);
+
+        let comma: Token![,] = Default::default();
+
+        // Output lifetimes first.
+        for generics in self.0.iter() {
+            for param in generics.params.pairs() {
+                if let GenericParam::Lifetime(lt) = param.value() {
+                    lt.to_tokens(tokens);
+                    param.punct().unwrap_or(&&comma).to_tokens(tokens);
+                }
+            }
+        }
+
+        for generics in self.0.iter() {
+            for param in generics.params.pairs() {
+                if let GenericParam::Lifetime(_) = param.value() {
+                    continue;
+                };
+                param.value().to_tokens(tokens);
+                param.punct().unwrap_or(&&comma).to_tokens(tokens);
+            }
+        }
+
+        self.0
+            .last()
+            .and_then(|x| x.gt_token)
+            .unwrap_or_default()
+            .to_tokens(tokens);
+    }
+}
+
+impl ToTokens for CombinedImplGenerics<'_> {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        self.0
+             .0
+            .last()
+            .and_then(|x| x.lt_token)
+            .unwrap_or_default()
+            .to_tokens(tokens);
+
+        let comma: Token![,] = Default::default();
+
+        // Output lifetimes first.
+        for generics in self.0 .0.iter() {
+            for param in generics.params.pairs() {
+                if let GenericParam::Lifetime(lt) = param.value() {
+                    lt.to_tokens(tokens);
+                    param.punct().unwrap_or(&&comma).to_tokens(tokens);
+                }
+            }
+        }
+
+        for generics in self.0 .0.iter() {
+            for param in generics.params.pairs() {
+                // Leave out defaults.
+                match param.value() {
+                    GenericParam::Lifetime(_) => continue,
+                    GenericParam::Type(param) => {
+                        param.ident.to_tokens(tokens);
+                        if !param.bounds.is_empty() {
+                            param
+                                .colon_token
+                                .unwrap_or_else(Default::default)
+                                .to_tokens(tokens);
+                            param.bounds.to_tokens(tokens);
+                        }
+                    }
+                    GenericParam::Const(param) => {
+                        param.const_token.to_tokens(tokens);
+                        param.ident.to_tokens(tokens);
+                        param.colon_token.to_tokens(tokens);
+                        param.ty.to_tokens(tokens);
+                    }
+                }
+                param.punct().unwrap_or(&&comma).to_tokens(tokens);
+            }
+        }
+
+        self.0
+             .0
+            .last()
+            .and_then(|x| x.gt_token)
+            .unwrap_or_default()
+            .to_tokens(tokens);
+    }
+}
+
+impl ToTokens for CombinedTypeGenerics<'_> {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        self.0
+             .0
+            .last()
+            .and_then(|x| x.lt_token)
+            .unwrap_or_default()
+            .to_tokens(tokens);
+
+        let comma: Token![,] = Default::default();
+
+        // Output lifetimes first.
+        for generics in self.0 .0.iter() {
+            for param in generics.params.pairs() {
+                if let GenericParam::Lifetime(lt) = param.value() {
+                    // Leave out bounds
+                    lt.lifetime.to_tokens(tokens);
+                    param.punct().unwrap_or(&&comma).to_tokens(tokens);
+                }
+            }
+        }
+
+        for generics in self.0 .0.iter() {
+            for param in generics.params.pairs() {
+                // Leave out bounds and defaults.
+                match param.value() {
+                    GenericParam::Lifetime(_) => continue,
+                    GenericParam::Type(param) => {
+                        param.ident.to_tokens(tokens);
+                    }
+                    GenericParam::Const(param) => {
+                        param.ident.to_tokens(tokens);
+                    }
+                }
+                param.punct().unwrap_or(&&comma).to_tokens(tokens);
+            }
+        }
+
+        self.0
+             .0
+            .last()
+            .and_then(|x| x.gt_token)
+            .unwrap_or_default()
+            .to_tokens(tokens);
+    }
+}

-- 
2.54.0

