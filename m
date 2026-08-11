Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021122.outbound.protection.outlook.com [52.101.100.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B8C446064;
	Tue, 11 Aug 2026 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456581; cv=fail; b=e2360yh07Hn0lDi0E5NCsP6/+Atr56yGEEsP5kV40e8JB0h+UQN//BN/TKLlL4vA7oqRbeFHwFsp+A+xsdkWQKSiChXoeJOOTw+lIu8au9S7x6ZiCuMQHsptsJ0L9w2x0/3ghTidtS6cun24K6+PjmMSQgBoG8E0y8qOXXgW4Dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456581; c=relaxed/simple;
	bh=2ShW/uz5p4KMVIeqHJ6sN+Z4T5sacEeGhHK9xABQFms=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hzmTXzUiCcuyOWmgcGoBNPq0P4lO24Av+saB/o3sxk2zKhAuzt1yj6epScHs8+0b2ZA84E2/PyfccU56ZY80CJjFho9XNschoLtr830EkSBMz5IkAexbts8Pi9maQvsmLgV8MiFzq01xD1nItyEL8nEUms9NLtHojZpnhI7IrMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xB7PjpjO; arc=fail smtp.client-ip=52.101.100.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xB7PjpjO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwVmGkCmF68vs9cPlNgGtMH0xhFQBa781aSMlgoWwMebkoxSGOTPb1r8IJOllfOLpDELELZvwNBd6wGlKGwL+fZdwYmkuFy8PM1eJSpsPvLejC0TzEhqrCLJzEziU7t7AiH1b1p4tk/3pWsyWjAeBjohHkf5ju/WKWn1JlsDHV0yZ0oJI4hhGaX4WkfPMYEViWlP4A+Oy9efmfBc5JTRcqU8tCXZAkz/iyI82h2wjZSNGc9boyWb1DvOslwYz637pynKNygGZ2JlJzdu1uVu7Kr8udDQYR2PjbQB3QgjBMIprUYXxYGqAzSHo1ZFuKUMEwKDeWKXc88N90+rFJC9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEaMDarfK1cjzKGIQErIKfnI16uiEzzNhtp0mHdjIpM=;
 b=fDmRUDaQkxkkGvNoSgb6C6Boz2fGf6SwxTYNNXITHPBdXHGBV4UwW3rNGW53iv7R5Yix1cnbsykxTVXFBTWeDkVrgVBcohQ4iqIaOza2CRuQ3/m9qcF4O961bQvR3jBWsNI0eZFIGR5t23TPpxoGVc3nSnmPc+D2WN9JzAtL1hg3DdaBKZaGPSf3Du8ABJk4uvMSrYhiCRSmhG7n4r37Bf6jUOcTviR70otcL7e556SrW03ZEgn244vTdgtAIVV1DCvL1e4KkyXJjf38ODhiN7RcFtlq1EgpBQB+wTSIPlKiqCrTr2WWagLhtroB9IIiR0bemIHNYP8RniT+356j8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEaMDarfK1cjzKGIQErIKfnI16uiEzzNhtp0mHdjIpM=;
 b=xB7PjpjODPmdoOkLztSZ3svz0wO2tAGmnc5TQRHqEEeXBPxm6PUQh1hB/RdzymMVn5I4u8dt2xU09iEOu3Vbeo1J1a1TlJbZo7sa1UedLP++7a7A9hcgxJkMCLPIvlXAduo5sJ5O6Jlpu9gms2AzIWwHDuJ7NY+CVreM7HjU2s4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB8765.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 13:56:01 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:56:01 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 11 Aug 2026 14:55:55 +0100
Subject: [PATCH 1/3] rust: macros: vtable: hide generated `HAS_` constants
 for required methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-vtable_macro-v1-1-50c5aab3c211@garyguo.net>
References: <20260811-vtable_macro-v1-0-50c5aab3c211@garyguo.net>
In-Reply-To: <20260811-vtable_macro-v1-0-50c5aab3c211@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786456560; l=1833;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=2ShW/uz5p4KMVIeqHJ6sN+Z4T5sacEeGhHK9xABQFms=;
 b=LJC94zdmNK9g760fwxegwfUAxjn0VkAGM8AbqlNM5rwVLSJiAQOk1C0vEng2yrZPZa2OjIA95
 4tnxcHuxI4pB/0fdCr9UVhz8tv4TLUJjCV0wcDdtmXhyEdZO2lscjZn
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P265CA0207.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::20) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8d505c-cf08-4470-9bab-08def7b04706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|10070799003|18002099003|22082099003|921020|10067099003|56012099006|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info:
	q2P7cAUSMaaegp+AhDPRXfjXoPdxT8oVpuU8nbVz9zOTd+Ib9bfvknW0i0vjylrRugn+U06SSVjUu5TVGCwrIpyBSjUa7iQTuzDegY4ciOsZ5i1/eIDUm+Si4zWcnTBZeLpTgJ9DV2YIzCyr31JnlyeGQLJ0XC3JcaPyORDoz08wB0SfVno0NzGiLIqeSplqx+/wxNAdjpL+U2z3va3K7fxjmDAUb3B4+CkRYZNLzaFqLEUtIII36AfTlmDyON14Is4Dm+wrW6D2hdRW/0ljyF7Fgdk7IYVNVDno5EcOoD8T8W11B0E01aInS1ldziOX26pcuqaGvU+esXovQyuLfr+RSGNvzqa4jSx17b9HfwVv+OwRhLQLeBMUUXfmcna3X7teUWU2eOshkLBl4T2jT8RM5Y1/PRQglg9k6JZ1nCzWEq/p6QLZ94KVS6/t8Xj55LvJPlibD/TjtMVzzrVOuFSjs9BSX8dEe2bV3O6xgDXFiEHbA7bRGHTZcJBoPOtekSHltoxV0soSYjhnDh4beMdlF1PXTFz83E9G0VMjrtedtazaPG59zItMX8x4C0Bua8ZJAHiU54klF5+3kjmh0s5SRZlkbNX6G40LjAY+i4bEDdKq/SgCFnsiioyMxTgxTnAzUmh26pYIxTa+svqLPX0CrRUayiKCV+h8xqWho0uPlycbIku3FCgIHujjmoYE9zUqmX9Q2CfWGnYIa/oVdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(10070799003)(18002099003)(22082099003)(921020)(10067099003)(56012099006)(5023799004)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUdLOTY2OUYzK2kvNFN3T3AzU2thc0FHRHlwS0NXVnIyVUZtSytpbkdZL0Ro?=
 =?utf-8?B?TzhES1JNNWYvTmRaUXU3d3RaS254czhmZ3d3aDlianFoL21XNllsS0h4NGFn?=
 =?utf-8?B?K05NTHBwa1dIcUpMbDRzRXh3YW04ZTc4b2wyc1I3U2tHcmtrMXM3M3pRajR3?=
 =?utf-8?B?bWRMcUVhUUJ1QUo3L2FyTkZEVFY4NHhMNUxNZFBWa1p1bzZZemRwK0VPbitI?=
 =?utf-8?B?NGljdjRzeGJ2T2hxdjZ4cTFXbVNNY1Nra0NCYk1BWnhUcHNoVCt1cVdRMkZi?=
 =?utf-8?B?UUVOU1BpeElKMXpuTktkbjlWbWMxc280ZkwrcXptT0YvT0dJNndjcFR2QSs0?=
 =?utf-8?B?UEpQdloxaEFpWDVJVUMzQ21tZWlOZTNGN0Rid2NqQUhOai9qSjVPNTRDZU5D?=
 =?utf-8?B?bmNBTHRoeVhDNjFac3hzS1ZMaWk1QzVwRWdOeThlbUJEOVFITHVBb3NoZFhX?=
 =?utf-8?B?U1ZvdzdFZHlsNVE2MUg5RlJhQkp0K2FWUFl5MlZ5cTAwOGpJekY1SjlCcWMy?=
 =?utf-8?B?bWRIaFQ4UWg5a2VvKzFBU2ltWEJYWDZnbEhBK1VlZk1KSTJNL0RodWpUb2x3?=
 =?utf-8?B?VVE3dXJMNjNqMFRJL2daaW80ajFHdkpYN2lZVmJWazh4Y2JKN3pNZWdLNG9x?=
 =?utf-8?B?M1lYWWxLRk9yRnB0eUtOOFJBVnBCU0lSMkw5cWRDUGEvU0tnbzlxUjlia0k4?=
 =?utf-8?B?dXR6UmlkeldJSlpZMDliQnc2VFdZVlZkbmxOSUtjYnY1a1dWVXlGN2luSXRR?=
 =?utf-8?B?aTRTa29ld3FlbnpCZE85RHJiVmxyc3h3TTRWbXh3aVZqNUs4UnNFZmJJNzFs?=
 =?utf-8?B?by8waVhQVERsYmx2RVJFMDNrQmhRUzA3eGdCSU5jUG5GNUY5TE5rdUpvcDgz?=
 =?utf-8?B?WU1hTFVSZy8wRi9yK0VGVERYaEVzSS9GZHRvcUl4cVVLZFA1SHhjaWZWdDZW?=
 =?utf-8?B?OTBLYjc4OHVxYU9WR25MeWdINjBjY3g2bGh0bGNKb0RwTDRxTnJWNm9CejlU?=
 =?utf-8?B?ZWFtVVZqRXRWTnExTk9LWUNtQ2R6Y0xUS0xzdzZWNXBuT3F0YnFkblo2UHMr?=
 =?utf-8?B?WTlmRUZISmtuZHNzai9vdFN3WVhQaW9GbEJ0Q0FMeG13MjFzNGllYlBNWldO?=
 =?utf-8?B?dFhwNWlWY1p3NUtqY0RNY1ZFaHFOa3dOU09IcmdYNEIyaXozVmxuRnpFYkFh?=
 =?utf-8?B?elJZZm9DT2NibFpiZmhYUDd3REtwRXlLZEhGaVlvYWt3RXh4MUJuSVpkV2NB?=
 =?utf-8?B?ajNJc1Q2dnppUG1hWmFsdEdyZ25kYUc4RTRRRXlBdndYdnNFRG05VDNaVHVN?=
 =?utf-8?B?WXR4RWFPRjVSQWxLazRqZkpIbEdaVEdCTlFaekVCRW9wRU8yaVFlQWZoSWs2?=
 =?utf-8?B?UkFUcnlSTlp1MWFhbEZLN1hSTWZYQzRWNjFoUXo0TWx5MlZoamEyVm9odWNB?=
 =?utf-8?B?eXN0RDdGLzRudk9wd01NOWNCK3FKY1Y4R1IvbUI1N29UVUt6bjVlS2dLV0dG?=
 =?utf-8?B?WG5ZTjlmd0h6VXg0WmZWUmpCam94ZmtJaXNYcWRvUWpXS013RnZSdUxHNTJh?=
 =?utf-8?B?UVltQmp3WmVMNVQxNTgvY0tYaUxEdFpCdUs2SXpHNGxwMWUwUmpRTTZmV3Y4?=
 =?utf-8?B?V1NuN1AyRlVSL3lSYmY1U2IwTnc1blg0WmZHRUVuVXduY1d1QndhSjlJYVF3?=
 =?utf-8?B?UGd2bFpHZXFzajVncVluRlZGYktlQTd6NTFCZmpuTjNhdlh1cSs4Mzd3eThL?=
 =?utf-8?B?dnZPNGFGWGZLMERuL1lQWnFwK0tWUmFRRytaRmJnbDIyazMvRXI1dVduaW1F?=
 =?utf-8?B?ZGxCUEdPR3ZjaXZtSG0xWnVhL3VzYXJTQktLRWlEcUdBcmR6bHByRE1UcHVN?=
 =?utf-8?B?SG5nQjA0Wnk1UW0wcXlQZ0RZYkdpd3o5bk5RYlQ4eTJ5UzJ3L0Y5YjZGRWI5?=
 =?utf-8?B?OENQYUpDNDNZVFJHSEdjQU1Ca1p0NHEwd25lQmNkRVp5Y2Ivd3BKc1JiVVhJ?=
 =?utf-8?B?b0F3TCtneHhQYzJKSFZFaFdZVGVsS0IrUXFiUlQyZlRFRFlGamp2UkVqYmNU?=
 =?utf-8?B?Vlk1NzdMTkxHeTJVTGc2ZXVIZnB4S2JZL0dHL0pmQWZXTGNTdFRmREhucGUz?=
 =?utf-8?B?bXpKSFRUeUE1QTcycFBaRkpiZFl5cEpDa3NwUTVPblozRTh2aENQUjFhUXlN?=
 =?utf-8?B?Q3NqWEFZbEVsblAxMmhLdVJaL0lMMWFxTmI3K0xvajc3RGk2MStyb2VxV1Za?=
 =?utf-8?B?ejVNWkp1bkVyS29KQ0FaU21mdGtuV3RnOXl5UDU1UFBNTVJMR3JSbkdiSHJv?=
 =?utf-8?B?TW01SThUclNMcE0xVkh5RG9IcTJpQjFQL0w1eXB0NFdNUEp5SzNoZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8d505c-cf08-4470-9bab-08def7b04706
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:56:01.2164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vYZtaXGL2gm7xq66iHeXt97tRNgE8XawvyzSPFGfszxhH8oCQZmweyP1TGNAzyTevAX2XB1Q+cqOU8qF2Q3uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8765

These constants have to be generated as the implementation-site `#[vtable]`
invocation has no way of knowing whether the methods are required or
provided-but-overriden. However, these constants will have a fixed value so
shouldn't be used. Thus, hide them.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/macros/vtable.rs | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/rust/macros/vtable.rs b/rust/macros/vtable.rs
index c6510b0c4ea1..e28976a5919f 100644
--- a/rust/macros/vtable.rs
+++ b/rust/macros/vtable.rs
@@ -9,7 +9,10 @@
     Ident,
     TokenStream, //
 };
-use quote::ToTokens;
+use quote::{
+    quote,
+    ToTokens, //
+};
 use syn::{
     parse_quote,
     Error,
@@ -40,12 +43,18 @@ fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
 
             // We don't know on the implementation-site whether a method is required or provided
             // so we have to generate a const for all methods.
+            // However, hide it for required methods as it will always be true.
+            let doc = if fn_item.default.is_some() {
+                let comment =
+                    format!("Indicates if the `{name}` method is overridden by the implementor.");
+                quote!(#[doc = #comment])
+            } else {
+                quote!(#[doc(hidden)])
+            };
             let cfg_attrs = crate::helpers::gather_cfg_attrs(&fn_item.attrs);
-            let comment =
-                format!("Indicates if the `{name}` method is overridden by the implementor.");
             gen_items.push(parse_quote! {
                 #(#cfg_attrs)*
-                #[doc = #comment]
+                #doc
                 const #gen_const_name: bool = false;
             });
         }

-- 
2.54.0

