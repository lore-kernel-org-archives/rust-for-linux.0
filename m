Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022078.outbound.protection.outlook.com [52.101.96.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F30548E0D9;
	Thu,  8 Oct 2026 12:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462267; cv=fail; b=ZaiPBZLpbVmc8rIvJ/EEOML20t94hl7NsyQH3sBAcghJzkj4HO6StGHrKK9rDiIhKJbaQDeGmjdvEMJq3y7nZg9ZEwcceRiUfKhakxysDGqNnIoR4OXyzFw0wlNWCMrZP6dUxIEAJ5Dq1LBa5o3Ls+zHY56ZLn07b43NnvICdec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462267; c=relaxed/simple;
	bh=s/jKZwor0cnLX+rPQKeu/4BTGXgjDZhvsMM8UgDTLF0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fmUevmAAYzaLxv8IVvwWYXQ+FNrwO1TxfRPO7/7g0CChgFjHfWSZjFAH5Na+LD+7ksLlneh8OWAcUY+veTvjNlX+fXyjuv20D2TxXQOyXh+SDhyFU0iqc0U6geANMxDwbdvD0HizTHgEGBMVhEaxBRH0TBjVmKmM99CxrynOY6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=QdRCWtnQ; arc=fail smtp.client-ip=52.101.96.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="QdRCWtnQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3bmTnCQfisXFSHHLzdeihMK3ZSC3y60zcOYSHeYmZYssmG/HsEO9uyUaRHqqTiDTtWlxEs2spFPxHfgjT9uoz1TU3Y3r0F3wAf3Fc9ByVqORy0vBU/PjSdsm0mHx7HLzpwqT6c9/143Kz1QSJK4RfaXhHnniIAFg1lV6XeQL4nApYE2RIUZdHOyJ10XHkSkaVvoIxrn72edTJvb4jEITQ487LYuHRMP7cR2EEdon9/fTZKbYRyJBcsI/lCzXG2zIpxMupnr37+frBt20O1jRckFLa1X577eCoFgVrmElURc8f4wMh6MIYBjgE+DdObfr2R69Z+ziP37nim+iNModA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwBhzuicF0//u8lkzel1BMD0/ysArLBN8J5QMn2BwmE=;
 b=Lvy7D93fF45YKgM3FC8wXpS+dzAPD3dAmQsU3SCBRCieIZ1ffEl2tWhlktQJdTPgR2CBtjY57wHphAVS/A3/6Hwr3kL4XwZ5xFkRBAOTo5RkmOKyi4IsUTHQks2mmcJi26xQ7T3HVqhKuA2uym9DMO9XjN92Y6Fms8tGxIq6zj4X4/pxQ7LcpzB6mmcwQD7PfkOzamsfen0pBHzULfiONaYVDKbBwZlXaET+t9I0L0+jOw29WilcZzUTg5oedYOOIrXKncQCsMBns4heysUUtXqRtO8Nd6TygyGiZR41fpCeowr1r/2K3dMOm/Wm6SU0jshg/Kq/sRdwR9U2jBPAAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwBhzuicF0//u8lkzel1BMD0/ysArLBN8J5QMn2BwmE=;
 b=QdRCWtnQmZltWO12uUaYHj+cvVTd1fDiq7ou78RpzHn1FNTDP/3PBPWahoMhx5WhnqsxX92mRMeccYz5zLna3C/aCT4J/6li+3YEWnAMpUcnsM1+TJHTZya6gCmVH8W0Zo/Hwxs2pKjxR/+UDSpikLqGB0g0Qf0Ty7RDwcW6A5Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:21 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:21 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:23:50 +0200
Subject: [PATCH 03/20] rust: pin-init: internal: pin_data: rewrite fields
 that borrow others
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-3-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5421; i=gary@garyguo.net;
 h=from:subject:message-id; bh=s/jKZwor0cnLX+rPQKeu/4BTGXgjDZhvsMM8UgDTLF0=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce7046d+BWxt7e/Kry/TTdf0/nLIiau2Gh1x275x
 ot3tStrJ3WUsjCIcTHIiimyeHQzpm1inC17Wav8JcwcViaQIQxcnAIwkanpDP9d+uzSbuy9+k72
 4OVpPVcF+VN2Xb0cLPT1K2P305P+thrbGf4neocoLhB/MHn6p5MeW1r2XxcOmuRWffO++8HLe4x
 YXrvxAQBbvko4
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
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a1cc258-15fd-466d-c815-08df2537146b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kYJ61ouB+z3c0KNWggDJIMwU1lqlBr6Uh+zFGyWE51VMPI9dtU7yYfm7CcyI7a3ksGCzyKR78BDEy8UD/LYqX8e6d4yjtEp1AXiecsRgydFSU/DJlYIBHDDkHCScfkx49ik2/qr1FOVo35gf0t1knnBKOrLy7nEJAiO3mWPm9G/duQ1k15yyQaHyxoMYIfHGHDjH9sRMSb4m1vI1cTErZYkUZFDywR77ZAxfukMrvo/17aCYDarW8W0SpGjRiLiKaXhrYznhQNuy34X0nXkFlB6Wqg0YLPesst/gNAOgcW6sMiRod4re9sqBfeCoEEGd4lyPe26kwElEzaYrdnbvgQwlg9F7KFjXg28cNZxmIwQNav6lI0dUnTflksn1dWTzjcLqXQuxlI56SXfgtJS2maa2N7IHQKWjU3wP9TmzAEvoLlAFEDAow0LRGxYiCVYicw+84cRnXKxPswZDllKGlc1f3Ed9FlzOKbFRAjJhhohYS0btP4tsft3F/Wmb8fbCmxIh7emP6arCoxdyz0b01rthnBgC7BKki1Srnv1/4gFxjzX+TnwdFD4LgyLkQZYVXJDxIrqb+cOu6D1SCZc1misH08Y/NVVWm1zWvRW1kWtRWlNx8NK5DtjdiEG5fljU5/vBcOGeF9YoyAbHeeHwZfgiiv26i2yFsgeeMlZo6Cq7YuMmM6iaOmmI4O96EaB8dvPt2eQ9IU/UUg2lBlrXEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2wwNWtmVGxmaWNNcDB1YmovOHVtT20vWndIdVpQRW9PU29HRlNCU0t1bEJ6?=
 =?utf-8?B?ajY3bCt5RHlXTjNXZWtYK00wQmtDdkpVSGRiNG9tWGZsM3NpUVRWdVpWWG9n?=
 =?utf-8?B?aVNjV2hwYjBpajBpUXliZ3FaN0grU25saUdyWHVFZ29jdW9ZN1VVbmdVV2Fx?=
 =?utf-8?B?eDE2SGRWMDBPYktjVEttS0pHTjhsS2hHL0NwSUo5NVNtY0Jod0FmNmhnNHMv?=
 =?utf-8?B?S2M5M2NKRjBIbFVLdFJGSmhJN1dmWTlmdjNJbjk3WnNybjlYWmN1cTMwQ1dp?=
 =?utf-8?B?YjhYUFU4OFcyTFhGNFBaNVBOdUxjWi9YVndXNTJwODlWY3BkK0VUV3I1MC91?=
 =?utf-8?B?VkttNnlYeGo1cHJ1bEtnaEFXY1lIVXBqQlBZWW5icWFTbnFHbm83ZDhUbDNK?=
 =?utf-8?B?SzFhNHhsQy9GcktXVXAzQks4bGpaSlQyWWV5a3J2aXlCN0d4WlI1UDZHekdj?=
 =?utf-8?B?eVkvUm44ZjJwd1J6TDVFUkhHM255THIvU2VSbnJIc3ZMeWkzbll4aGVsTWlm?=
 =?utf-8?B?bTdpVmluNnJQV2RYS2tnVGdHOHA3WmZncXdIeUhSNlROTUFlYVNYY1NTSXZO?=
 =?utf-8?B?NlpWcFBabmt1MjRxS1lzc01KY2RYU3NGZURPTjZLb2l6MWpBMkRzR1pkZGsv?=
 =?utf-8?B?VllkRjJJY0o0OHJ1eWpQbmV3SHF1SnVSTHRUb3E2VEhkeGZSUE05N0VHbnFt?=
 =?utf-8?B?V2RpZ0FjeWhsTlFKdjlHTE5sWVk2d1JSRndiV1ZlOHMwek54aGVzcGlieVYx?=
 =?utf-8?B?MnV3NlRUT2xXMlVSb2dFMDlCMjdDVEM3Q2VLbk8wTXdGTnJVVi80by8zVHc5?=
 =?utf-8?B?bis1VXRkMWk4emtlNnpJMUEwWVJTUVhPOWtHZzViZEgxYjJFa1IrWHB4UGhK?=
 =?utf-8?B?UnpSZEI2NHRsbklYakV3S0pSRVl5Uko1a1lraGxLdVJJbnJuQ0Rnc1JpZzlu?=
 =?utf-8?B?UU5oL0pFTEZCKzVqK1c5M0V0UHZkYkxReU83Sm9IL3R2MWV6OWpScnh4bXlP?=
 =?utf-8?B?dFhpckNzN04zS05WT2JhVWszMTUwWnBBOUd4SlpVMERVOFFSME5zSHdqOVI1?=
 =?utf-8?B?dVpuTXpNeFF5RC96M2hIajd2OEtYVzBHZm1YdEE0c3JQUWtrUFZYRXpTNVRn?=
 =?utf-8?B?OGVwdGZZRCs5ZU0wSGZhRFBUS2NFdXhzVnF0SXFRNUF3UVFqVWZaQksweG41?=
 =?utf-8?B?TytLY0dYQ3BIM2JWZjNpemkxR3AwQWJvVDEyTnpuUEUvVGdBdWd5QXpYYUdk?=
 =?utf-8?B?NkkxQmhISmZEUStCQStNRVlNTWdhcTkwb1E3Z09ibm5IeWVDTVo2c3VwYkRC?=
 =?utf-8?B?VVJ0dzBXZHNRZ3F6L0V4UVFSNGsxRVdNbzl0UkFYeWJpOE94THQ1KzgwVFFo?=
 =?utf-8?B?Q21oajhPcVRUaC9iRlo4WU5xMWN4SnRyR0Q2bW93SWt4N3dXRnVzVjVDclo3?=
 =?utf-8?B?SGZnVEkySSttUU5QQzFJWWRISExEZG1JUExPQ05rcFMwSFBOY092aW9FM3py?=
 =?utf-8?B?c0Y2SjhmU1JXblp5enhYZW9YMFRUNkQyd0xrRTA0bXo4ZFBLU1gwTjVJU3dy?=
 =?utf-8?B?Y2pZajc2WnU0aUpQdFBaaXZsSVptbDQxVTR5MjIybWg3d1Q0K2VqZVkzL2Qy?=
 =?utf-8?B?bW5JcnhXanlDWnNJY09WWXlBTnB4Q2hacDMvNEJXRkdNWjBQNHB1dEo0djB2?=
 =?utf-8?B?bGV1M3RaeVRMamZ5Y0NvR1BNV0pkV3V6cExhNzFKVTZIbzJWd3kxNjV2dkNl?=
 =?utf-8?B?ZC8xa3cwcHU3dVQwczRyaU90MTRLUjFra2UzTjJpTm1zcVJxRGJSbktBVC9n?=
 =?utf-8?B?ZGlzNTRhVlU0alNIK2FGY0M2SzJrNU5XOHVIZk9mb0hhWXVvVE5ybVNqR25l?=
 =?utf-8?B?azVjN1RCRFBiKzFvaTVodUpXaUY5a3hwNm00eU1Fd2JNOUVURWNpd29QQW1D?=
 =?utf-8?B?b1hrYjQ5N2dTa3NSVVBBbU5yOXU4am03V1lQRy93VGpqMktVVDlLcnZhaFUy?=
 =?utf-8?B?ZjJhQ2JUL25JcmMwbGRsQTcyc2V5b3hoUmxkdllEWHVmZ3AyS2JucHg3OXE4?=
 =?utf-8?B?SThWNUozbFI0bDc2aUY4VXp1LzkyTzNuR0ovbWVYemVHTXhNY2ZKQXAwa0Zv?=
 =?utf-8?B?dFNBY0xSYWYwRTRrWEE0ZkV5bUFaK3dYL0RtYUtlcFhieVl0Q2ZvUzArUVNQ?=
 =?utf-8?B?LzkyV0hMUWx3dUtXN2d6U0ZCdzZQWFpnemg3VkpRdU1JRDBpQTVpYXprZXpm?=
 =?utf-8?B?WWdlVVorMVYxT0NFOXZ1TnBIODYvdHJyK2RqSkVVNUppaHZLb3pyVXRlaXJx?=
 =?utf-8?B?T0xwN0ZTbkRPVVZwb0RSMFBuNERBUmhXanhvM0tqNkFydzJqdDRuQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1cc258-15fd-466d-c815-08df2537146b
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:20.6529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JbqMZ8O07rXKwwSa7NDlscAyKcSWtah6BZy39ikgR1Z/OGhRuiMCv53r1C8I5BA0k2w8lzayyIYBxZ+MF2zGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5471

Fields that borrow other fields have lifetimes that are within the struct
and these are not part of the struct generics. Therefore, these fields need
to have their lifetime erased.

A naive implementation would be to replace their lifetimes with `'static`.
However, doing so is unsound for multiple reasons:
* Users may directly access such field with field access syntax, and get
  exposed with wrong lifetime;
* Auto trait implementations will cause the struct to be implementing auto
  traits when the type only implements the auto trait for specific
  lifetime. This is similar to how specialization can be unsound if
  specialized on lifetime.

Create a `Erase` type, which has `for<'a> fn(&'a ()) -> Foo<'a>` as generic
parameter. Internally, it uses a helper trait to resolve that to
`Foo<'static>`. The first issue is solved by not exposing any public
accessor on that type. The second issue is solved by add custom `Send` and
`Sync` implementations that requires `Send` to be implemented for all
lifetimes, thus closing the lifetime specialization hole. The actual
implementation is a bit more convoluted because it supports erasing
multiple lifetimes.

This is more or less a stable polyfill of the unstable `unsafe_binder`
feature, without `unsafe_binders`'s no drop glue requirement.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 16 +++++++
 rust/pin-init/src/__internal.rs        | 77 ++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index cf6142cd656d..868701c9a986 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -417,6 +417,22 @@ fn generate_struct_def(info: &StructInfo) -> TokenStream {
             ty,
         } = &field.field;
 
+        let mut ty = ty.to_token_stream();
+
+        // Replace lifetime for self-referential fields.
+        if !field.captures.is_empty() {
+            // Build a chain `for<'a> fn(&'a ()) -> ... -> (Ty,)`. Such type will have a `EraseTy`
+            // implementation and thus may be used inside `Erased`.
+            ty = quote!((#ty,));
+
+            for borrow in field.captures.iter().rev() {
+                let lt = &borrow.lifetime;
+                ty = quote!(for<#lt> fn(&#lt()) -> #ty);
+            }
+
+            ty = quote!(::pin_init::__internal::Erase<#ty>);
+        };
+
         quote! {
            #(#attrs)* #vis #ident #colon_token #ty
         }
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index cba53b8c3c94..80c5624d78c9 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -385,3 +385,80 @@ unsafe fn __init(self, _slot: *mut T) -> Result<(), ()> {
         Err(())
     }
 }
+/// Polyfill of `FnOnce` trait to be able to reference output via associated type.
+pub trait FnOutput<Args> {
+    type Output;
+}
+
+macro_rules! impl_fn_output {
+    () => {};
+    ($ret:ident, $($arg:ident,)*) => {
+        impl<This, $ret, $($arg,)*> FnOutput<($($arg,)*)> for This
+        where
+            This: FnOnce($($arg,)*) -> $ret,
+        {
+            type Output = $ret;
+        }
+        impl_fn_output!($($arg,)*);
+    };
+}
+
+impl_fn_output!(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U,);
+
+/// Lifetime erasure facility.
+///
+/// Say we have `exists<'a, 'b> Foo<'a, 'b>` and we want to store it. There's no concrete
+/// lifetimes we can use, so we want to erase the lifetime.
+///
+/// Such erasure can be encoded as
+/// `Erased<for<'a> fn(&'a ()) -> for<'b> fn(&'b()) -> (Foo<'a, 'b>,)`.
+///
+/// This can be considered the stable version of Rust's `unsafe_binder` feature, without the
+/// no-drop-glue requirement.
+#[repr(transparent)]
+#[allow(private_bounds)]
+pub struct Erase<F: EraseLt>(F::Erased);
+
+/// Helper trait to resolve the erased lifetime.
+trait EraseLt {
+    type Erased;
+}
+
+impl<T> EraseLt for (T,) {
+    type Erased = T;
+}
+
+impl<T> EraseLt for T
+where
+    T: for<'a> FnOutput<(&'a (),), Output: EraseLt>,
+{
+    type Erased = <<T as FnOutput<(&'static (),)>>::Output as EraseLt>::Erased;
+}
+
+// The default `Send` and `Sync` are not sufficient, because one can use lifetime specialization to
+// implement `Send` or `Sync` for a concrete instance of lifetime. Use HRTB to ensure that the type
+// will only implement `Send` or `Sync` if it's implemented for *all* erased lifetimes.
+
+// SAFETY: Trivial, no lifetime to erase.
+unsafe impl<T: Send> Send for Erase<(T,)> {}
+
+// SAFETY: If we erased a lifetime, then the type needs to be `Send` for across *all* that
+// lifetimes.
+unsafe impl<F: EraseLt> Send for Erase<F>
+where
+    F: for<'a> FnOutput<(&'a (),), Output: EraseLt>,
+    for<'a> Erase<<F as FnOutput<(&'a (),)>>::Output>: Send,
+{
+}
+
+// SAFETY: Trivial, no lifetime to erase.
+unsafe impl<T: Sync> Sync for Erase<(T,)> {}
+
+// SAFETY: If we erased a lifetime, then the type needs to be `Send` for across *all* that
+// lifetimes.
+unsafe impl<F: EraseLt> Sync for Erase<F>
+where
+    F: for<'a> FnOutput<(&'a (),), Output: EraseLt>,
+    for<'a> Erase<<F as FnOutput<(&'a (),)>>::Output>: Sync,
+{
+}

-- 
2.54.0

