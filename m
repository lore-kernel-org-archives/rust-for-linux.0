Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020101.outbound.protection.outlook.com [52.101.195.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9504AA41B;
	Fri,  4 Sep 2026 14:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531167; cv=fail; b=UQojp6c6uTHLthTjwfv7P4S09kNkXQpwUe7IZgAJc5/0IuS72yWMSKytJs7akq6anFXkHwysYYWj7XILpx4KVsp9rXKhAkw+5FcqOnnyf8aW0RGo8pgvLPCUWxUFUINA+59gmG2u7jKtq75dTymQpAHcMNXkrxG9A6Sh9P+L2GA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531167; c=relaxed/simple;
	bh=0/6ZQKHQs9GqOQ5aPinMsD6dxy14kMOQl/17CjeeVr4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IsNLDPTxOlw4/akMwoJT1FpghKQQNvG5ybvFcxguxtauIahiEvKZJI7cP5RR9dHt95Zd1aKsGGqEpSM5CZ3DWd4LC4pjbI0VoaQ3eUuYdEQws5uUb+kO3qQw/mh1sgJvrKO/KzOzLfuF4nKFdoy2lkgpMb12Ulk7XlvVtqmMdSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iqI8LKtY; arc=fail smtp.client-ip=52.101.195.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iqI8LKtY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBVyH1RyIyEFG5g+MZFWLMaatHVdam0n6HrlHb5YLlpnX/Vw/8Nu4+IXfiuSN0HigQ3iiVtDwbsGcTfkmWmZUNqNA3fwvJKbv+/enuyQktsdI4GypA8sqGMKaEpRf4MvEhqoOR8oqIuGyD/zhOumrUnN6SwMLN7vEspNLZFc/Q6mRPKQTCZqLMmvYIQWnmtXvPdNWcImCqLGVhP8NBLukOZqjiDNULAiWwh2xgmTy5/deJqC/6zLU6BdQKEMwMbzQMP1CboxCeiTpZNcMTa0AHZUXoxgH4JsrmMvB2nJlkI1C6CSAqJj27PprPnhhNkWuS7nRiebXGiEPsVWvEJMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxcYGtn3GQa+3v3Cnvogr0xErRrUz0uD3139vMcqGb0=;
 b=TsnkBcvzqThDJP+VIzHL4OiCMNrSGnI+IeFr8HGvPm5zhiCV3Lt5AcAOwGPAlYmQsj9ECjl4j1xYRlc2iDCPlslOt7Y7uiLS4nHT30OBuYmFXrEnRbyNqYUCasMk8rMlclyJgS0+HUDFaDaFffv3ODmj3jrYfqJjgNNO+WHR+LV4g6Iyjfh1ykjsYjdNyONqYAJB3Q+n2dvck7+bXjg8Ey/Uh848lpzPxQx/bvKvRw1a7OVwpIjCaNO+xzUV8lQLpdvvkPPeddKYjwKVGvhOyBUXV75wX40P0NdQlzVi+vB7iNL79e6go47sO+FqVjORAIG85KD2TxrXYEgc6BjrTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxcYGtn3GQa+3v3Cnvogr0xErRrUz0uD3139vMcqGb0=;
 b=iqI8LKtY7IAQz0GjCv45Hwetx+Tl3+tEEOMEmCtRUvLkqM0TxCgYSBHky28qtaLDPOjuLBZR1cEtsEieihue5vy98hDESw4WDCHIJBKgnzAbw7aaxgL8Nk3vIUs2FLqw9fyBIQ/iq2Uy5a7JBCiEdzW39VFVgnP1Mdne7qg6paM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6690.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:12:37 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 14:12:37 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 04 Sep 2026 15:12:30 +0100
Subject: [PATCH 2/4] rust: pin-init: internal: pin_data: support tuple
 struct projections
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-tuple-struct-v1-2-72c50bd037fd@garyguo.net>
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
 Gary Guo <gary@garyguo.net>, Mohamad Alsadhan <mo@sdhn.cc>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531156; l=13236;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=53EC9ELB0uhcu9+blKC+zESsQ9pYPaki2Z2Lyl9cmnc=;
 b=biBrjWv2qAL0NWDtK8Ee/IO7o87wupqGTnEFrBS6fgQojMc6Ia88kFHrK7ka7yA5q5J/FKLCB
 oHc9ebLQzZ9CKDGUBadCUYoFSRVFVecA2rCWX7QTDrrRitfX65LYpL/
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
X-MS-Office365-Filtering-Correlation-Id: ee7018e7-03e5-405f-296d-08df0a8e92b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|376014|10067099003|6133799003|3023799007|18002099003|56012099006|5023799004|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	rZzoS+nSQd49tZfM2IZzQd0XSqOSJG5TmckNdS9T9s25eN7JFyUR4kECPNu58tulHZZB0LEV5cB5qvD6XS3encMJte5+XLJ/feRUr569bgBmkSzU8iSla7OMM+AAM6VW7lpx6nEnV8sIweaPBy4Zyk9v3ofIHV8DDlKW/6BLWD9bqbeDRl4nhR3CFhTAr4pP6sG6iSXlqhPTVBUSG16pu7BxJn0gjflr3XndTwmrRx805dwitFfC1OZiXKbd0BSX9a/lwVyJJ/Y4mryYs5Txsww/zCTSBEqywY+p3EGRnwLTC1t6LZ0gkDWnSzxBhTFK0LE1Zc9qqZ9hLpWEXU6TzGw6+r/PlxPt39HhSdPun0tXFlBIRu/TKzAK+boC77iZebSdVm7koiB6Eim/16/1dL2MH8LXoFA7y3mkB/XJq0Hc6WHMqEhzDeVShGo/xrvPjY9L50YlvNfViO6rkRk6yEzNdu5vGOU4ZeOTgtHxEuu/m0GmX2KuBaEuEil5d7hM7w1tVSdui5RpxiWofschtLX3Em0aS/rSDq2aZdmr7tLwArxacEX75Xpv+NAYROKK/AOdRXYbvFb21mFzJ4kaj6uecY0v05ii7SV2YqtYuwCxJ9bCp68EQAwvQv7UOys0FvLMAyChO+Uy1Bs4jdii/TxXQNEy4QAmim1cbGmc1u0jWb9KehwCoKM44P7OIZRA0OYOdHmT1PvhgE1D1Cbb9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(56012099006)(5023799004)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qmd2VkN5aHhVY2V6dlBoZE1TSlcxNWNBd1Iycndhc1E1Sng3V1l6eUNPeVhJ?=
 =?utf-8?B?ZVpVUk8raktNejNIb0VzTmdOYVJ2TkF1bzBDU0ZqbVRlR2s4cVR6UGRtVkdk?=
 =?utf-8?B?ZnNoYkV6WVE5ZzR1QXByL1FPV3ZwNlpERW50VGR4MHFzdDhrSjZQUzNqQU5I?=
 =?utf-8?B?OXIvSkVDUmloSDBaUjRBbzl5MytrM1ZGcGZxbWs2VXRYYjRtVXFEbm5vU2pq?=
 =?utf-8?B?WjF6TUF3K1lSTUIzV0Zhb0hGUGszZ2VsOTIrU0JVeEFxYzlEVFpGMWFMVWhY?=
 =?utf-8?B?UkJ3QmtEYW10Q1dXeXdndld3ZllBRGFJaEdjZW5pSWxvcXE3bFpUM0NKampH?=
 =?utf-8?B?YlQxSHpaY1RYWkhrWnRoTUJJQ1BwUGoxc3daQm1CZ3dmVHVuQUd2Z3JPSE9L?=
 =?utf-8?B?Zk1zcFozVmF3dnc4eVZMZ3ZNSW83VHc0MUtiS0JzbWFWVW1nckI5ZHZZTnN5?=
 =?utf-8?B?emJPbXdqWWs0eHhoR3UvczZIZFNHZTc2QWR0YWF3aHFPV1FpTGpnYzlmZVFa?=
 =?utf-8?B?ejFCdFBsazVvMU5LTFJLNXJCYTZCT0ZodUJXenl1eGlKMzNxb3JvV0swanNS?=
 =?utf-8?B?em1EK0I0MFVzRG1LYjN0bXZ4R0N2TFpMOE9hOEhSWmZhSkR1a1FlNkovNHlG?=
 =?utf-8?B?ZkF1VUhzbitrbnMrdGRSVDhWYStkZWJPMkUvdUVGQ0U2UjFhbllNMXlLY3lX?=
 =?utf-8?B?ZUUrSlBDN05WNFkxcC9KQ3BWeVZTWDhoNEdLT0MzUnAzRkkxWWRwNG9rUmFk?=
 =?utf-8?B?dzFhOVZzL0NuQytqZVpURmlWU243QThJUzhkT2kwMStaRnIrK25VaS9lYmY0?=
 =?utf-8?B?d29Qc0pKLzZoWEp1dkE2bmIwWGhzSFJ4NnBPQWFoS1lCaXp5aFlxTDZCT0hI?=
 =?utf-8?B?K2dyZzlNR041TngybC9FNG55YnFpK01QRmk3ZjI5K0lEcXBlbDg1aTRxSG1X?=
 =?utf-8?B?ZjRQQmprZURrV013OW91VkJTWFFTbUhyazF6YnRHenRyeU9yMFFqTjV5WERk?=
 =?utf-8?B?cXZQVjgwQzlUTVZ0Z3ZBUllXREIyeHcvQk1SNEtqaVI2K05ZS1lDdUNFOVpy?=
 =?utf-8?B?TndkTzNqNDA0S2lLVmFsa3BEY1FncG1jSytYUmpyMW5CVmZWcWNoQkQzdytB?=
 =?utf-8?B?czBFcW8yODdIRmNJUzZ4RTdRWmpiaGV3K2J5Z29pUTlZYjRYMU9Ea3hoM0Zr?=
 =?utf-8?B?Nk5kTlk4Q2FRWlNPQmxJTjltR1ZkeHMvdmpqaGtqQ0hxU0RTVGNSQkRyK1dw?=
 =?utf-8?B?TXNlVys5VXl2clZLeUR3dklXMld0N2VKVE5FdkxJaEI3TUpnakZOcEwwY3B0?=
 =?utf-8?B?OFNmS2lRRVEwOGQvNkpXb0tWMzE2RXBzQTM3SE1LQUJyaDU1T1JKN3k0MVB3?=
 =?utf-8?B?U3Y4dkNyRkxLWllSeVBWK0dTaUdGeUpHaUNvaklVd2RzNlBHZkdCMlNaUE5W?=
 =?utf-8?B?RWwrbXBDY0lOY0xZdGNWbEY3S1pmazZLdWlBTjkrcnBwNTNSNnlBMy9tNmRi?=
 =?utf-8?B?OFViNzUzMzZRZGRWUHZIZUZoWHZiZDNpQkQwbTRPdkxjMFF5REpFWFpROGt5?=
 =?utf-8?B?TkQwc1lPVU81U2VrdHBrbldJcHdFLzJtRFdGMER1TzRaRzBaeno3U3NRa21q?=
 =?utf-8?B?Vk9DV3l5S3lxTEFJNlBVNThWdDErVmYwbVk2S25JR3BoMDFIOCtOWGx6YWZh?=
 =?utf-8?B?UWs3dTBOOUNaSlBmOEF0OE9aQ2x3NXQwRzYrT0lNLzhyUkdaeU1YcTRMSVNz?=
 =?utf-8?B?TlFwMVBFSml3OE8zby9YaUIzNDJUbHEyS3hoQWJxVUFXdW0zRUxHVStCWjNp?=
 =?utf-8?B?UTRsUjF0YkFNUmpHYVRnKy9lM0laQjNKczlUOGtyaW45NVYrb295K1JSTktH?=
 =?utf-8?B?ODMwMXlmT0kzOFo1bnhSVUswWEJod0VzRFhnUkU5VzZUUis3WDE1M0xPY1c4?=
 =?utf-8?B?emVvYTVZTXNIOGxHbFp6aVMrbXVLd1ZKdlg3RzBrS0hJWUFwK1h2VHJJZzU3?=
 =?utf-8?B?dndxRHpRTlR1NDIyWHpvMGU3OWNNZStvSXcvZmkwcFRWOEhsZThncUZzTDRQ?=
 =?utf-8?B?QjRnTWh6eEpRb0dTK1EzK1c1dk1pQlJEWHBad2phWkkwVFVnWVVyZ0RYVngr?=
 =?utf-8?B?UlVnY1lFeEZlWDh3T1FQZStPN0RreEpLcmNpaXhiRmR1QmthZ2RSYkx5VVhu?=
 =?utf-8?B?aEpBWlZqQ0VrcEVnZ3U4S1N5czRrMlFabmN3cTBoblVqZjZXODh5cHd5UzhS?=
 =?utf-8?B?UmN3VEg0ZWNaeGNtRmxETjRNVVNQU2Y2VTJOdmo4Qk1OQ3BvNmpkaFdoZXk1?=
 =?utf-8?B?Y1VDT2c2dVZvRERQQ3QwUHNRUGFoSzJibExvTTJnTzNUZ2FZM0hIUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7018e7-03e5-405f-296d-08df0a8e92b4
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:12:37.3539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6derTBu5Ge2daLgCicz/utMN22JrSjMLY9ncXB6StjsC4oYFpgtGYjNfl7j+f94PWYKsNAdj0hIq0HP8t1y1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6690

From: Mohamad Alsadhan <mo@sdhn.cc>

`#[pin_data]` rejects tuple structs because it assumes every field has a
name, which it uses for the projection field, the `__Unpin` field and the
pin-data accessor.

Identify fields by `syn::Member` instead, so that tuple fields are referred
to by their index in generated field accesses. The names that generated
items still need are derived from the index as `_0`, `_1`, etc.

The projection of a tuple struct is a tuple struct itself, so projected
fields are accessed with the same `.0`, `.1` syntax as on the input
type rather than through synthesised names.

Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
[ Moved utility code to util.rs as extension trait - Gary ]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 112 +++++++++++++++++++++++----------
 rust/pin-init/internal/src/util.rs     |  31 ++++++++-
 rust/pin-init/src/lib.rs               |  23 +++++++
 3 files changed, 130 insertions(+), 36 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 074bc6b3091a..8cd9bf139567 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -7,7 +7,8 @@
     parse_quote, parse_quote_spanned,
     spanned::Spanned,
     visit_mut::VisitMut,
-    Field, Fields, Generics, Ident, Item, PathSegment, Type, TypePath, Visibility, WhereClause,
+    Field, Fields, Generics, Ident, Index, Item, Member, PathSegment, Type, TypePath, Visibility,
+    WhereClause,
 };
 
 use crate::{
@@ -49,6 +50,7 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
 
 struct FieldInfo<'a> {
     field: &'a Field,
+    member: Member,
     pinned: bool,
 }
 
@@ -129,10 +131,12 @@ pub(crate) fn pin_data(
     replacer.visit_generics_mut(&mut struct_.generics);
     replacer.visit_fields_mut(&mut struct_.fields);
 
+    let is_tuple_struct = matches!(struct_.fields, Fields::Unnamed(_));
     let fields: Vec<FieldInfo<'_>> = struct_
         .fields
         .iter_mut()
-        .map(|field| {
+        .enumerate()
+        .map(|(index, field)| {
             let len = field.attrs.len();
             field.attrs.retain(|a| !a.path().is_ident("pin"));
             let pinned_count = len - field.attrs.len();
@@ -144,23 +148,30 @@ pub(crate) fn pin_data(
                 !field.attrs.iter().any(|a| a.path().is_ident("cfg")),
                 "cfgs should be all resolved at this point"
             );
+            let member = match &field.ident {
+                Some(ident) => Member::Named(ident.clone()),
+                None => Member::Unnamed(Index {
+                    index: index as u32,
+                    span: field.span(),
+                }),
+            };
 
             FieldInfo {
                 field: &*field,
+                member,
                 pinned: pinned_count != 0,
             }
         })
         .collect();
 
     for field in &fields {
-        let ident = field.field.ident.as_ref().unwrap();
-
         if !field.pinned && is_phantom_pinned(&field.field.ty) {
             dcx.warn(
                 field.field,
                 format!(
-                    "The field `{ident}` of type `PhantomPinned` only has an effect \
+                    "The field {} of type `PhantomPinned` only has an effect \
                     if it has the `#[pin]` attribute",
+                    field.member.display_name(),
                 ),
             );
         }
@@ -168,8 +179,13 @@ pub(crate) fn pin_data(
 
     let unpin_impl = generate_unpin_impl(&struct_.ident, &struct_.generics, &fields);
     let drop_impl = generate_drop_impl(&struct_.ident, &struct_.generics, args);
-    let projections =
-        generate_projections(&struct_.vis, &struct_.ident, &struct_.generics, &fields);
+    let projections = generate_projections(
+        &struct_.vis,
+        &struct_.ident,
+        &struct_.generics,
+        is_tuple_struct,
+        &fields,
+    );
     let the_pin_data =
         generate_the_pin_data(&struct_.vis, &struct_.ident, &struct_.generics, &fields);
 
@@ -231,7 +247,7 @@ fn generate_unpin_impl(
         unreachable!()
     };
     let pinned_fields = fields.iter().filter(|f| f.pinned).map(|f| {
-        let ident = f.field.ident.as_ref().unwrap();
+        let ident = f.member.as_ident();
         let ty = &f.field.ty;
         quote!(
             #ident: #ty
@@ -313,6 +329,7 @@ fn generate_projections(
     vis: &Visibility,
     ident: &Ident,
     generics: &Generics,
+    is_tuple_struct: bool,
     fields: &[FieldInfo<'_>],
 ) -> TokenStream {
     let (impl_generics, ty_generics, _) = generics.split_for_impl();
@@ -325,28 +342,32 @@ fn generate_projections(
     let (fields_decl, fields_proj): (Vec<_>, Vec<_>) = fields
         .iter()
         .map(|field| {
-            let Field { vis, ident, ty, .. } = &field.field;
+            let Field { vis, ty, .. } = &field.field;
+            let member = &field.member;
+            // The projection of a tuple struct is a tuple struct itself, so its fields are
+            // positional and must not be named.
+            let name = (!is_tuple_struct).then(|| {
+                let ident = field.member.as_ident();
+                quote!(#ident:)
+            });
 
-            let ident = ident
-                .as_ref()
-                .expect("only structs with named fields are supported");
             if field.pinned {
                 (
                     quote!(
-                        #vis #ident: ::core::pin::Pin<&'__pin mut #ty>,
+                        #vis #name ::core::pin::Pin<&'__pin mut #ty>,
                     ),
                     quote!(
                         // SAFETY: this field is structurally pinned.
-                        #ident: unsafe { ::core::pin::Pin::new_unchecked(&mut #this.#ident) },
+                        #name unsafe { ::core::pin::Pin::new_unchecked(&mut #this.#member) },
                     ),
                 )
             } else {
                 (
                     quote!(
-                        #vis #ident: &'__pin mut #ty,
+                        #vis #name &'__pin mut #ty,
                     ),
                     quote!(
-                        #ident: &mut #this.#ident,
+                        #name &mut #this.#member,
                     ),
                 )
             }
@@ -355,24 +376,52 @@ fn generate_projections(
     let structurally_pinned_fields_docs = fields
         .iter()
         .filter(|f| f.pinned)
-        .map(|f| format!(" - `{}`", f.field.ident.as_ref().unwrap()));
+        .map(|f| format!(" - {}", f.member.display_name()));
     let not_structurally_pinned_fields_docs = fields
         .iter()
         .filter(|f| !f.pinned)
-        .map(|f| format!(" - `{}`", f.field.ident.as_ref().unwrap()));
+        .map(|f| format!(" - {}", f.member.display_name()));
     let docs = format!(" Pin-projections of [`{ident}`]");
+    let (projection_def, projection_init) = if is_tuple_struct {
+        (
+            quote! {
+                #vis struct #projection #generics_with_pin_lt (
+                    #(#fields_decl)*
+                    ::core::marker::PhantomData<&'__pin mut ()>,
+                ) #whr;
+            },
+            quote! {
+                #projection(
+                    #(#fields_proj)*
+                    ::core::marker::PhantomData,
+                )
+            },
+        )
+    } else {
+        (
+            quote! {
+                #vis struct #projection #generics_with_pin_lt
+                    #whr
+                {
+                    #(#fields_decl)*
+                    ___pin_phantom_data: ::core::marker::PhantomData<&'__pin mut ()>,
+                }
+            },
+            quote! {
+                #projection {
+                    #(#fields_proj)*
+                    ___pin_phantom_data: ::core::marker::PhantomData,
+                }
+            },
+        )
+    };
     quote! {
         #[doc = #docs]
         // Allow `non_snake_case` since the same warning will be emitted on
         // the struct definition.
         #[allow(dead_code, non_snake_case)]
         #[doc(hidden)]
-        #vis struct #projection #generics_with_pin_lt
-            #whr
-        {
-            #(#fields_decl)*
-            ___pin_phantom_data: ::core::marker::PhantomData<&'__pin mut ()>,
-        }
+        #projection_def
 
         impl #impl_generics #ident #ty_generics
             #whr
@@ -390,10 +439,7 @@ impl #impl_generics #ident #ty_generics
             ) -> #projection #ty_generics_with_pin_lt {
                 // SAFETY: we only give access to `&mut` for fields not structurally pinned.
                 let #this = unsafe { ::core::pin::Pin::get_unchecked_mut(self) };
-                #projection {
-                    #(#fields_proj)*
-                    ___pin_phantom_data: ::core::marker::PhantomData,
-                }
+                #projection_init
             }
         }
     }
@@ -414,11 +460,9 @@ fn generate_the_pin_data(
     let field_accessors = fields
         .iter()
         .map(|f| {
-            let Field { vis, ident, ty, .. } = f.field;
-
-            let field_name = ident
-                .as_ref()
-                .expect("only structs with named fields are supported");
+            let Field { vis, ty, .. } = f.field;
+            let field_name = f.member.as_ident();
+            let member = &f.member;
             let pin_marker = if f.pinned {
                 quote!(Pinned)
             } else {
@@ -443,7 +487,7 @@ fn generate_the_pin_data(
                     // - If `#pin_marker` is `Pinned`, the corresponding field is structurally
                     //   pinned.
                     // - Other safety requirements follows the safety requirement.
-                    unsafe { ::pin_init::__internal::Slot::new(&raw mut (*slot).#field_name) }
+                    unsafe { ::pin_init::__internal::Slot::new(&raw mut (*slot).#member) }
                 }
             }
         })
diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
index ed18ab7d45e6..ed2c78f0658f 100644
--- a/rust/pin-init/internal/src/util.rs
+++ b/rust/pin-init/internal/src/util.rs
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-use proc_macro2::TokenStream;
-use syn::Attribute;
+use proc_macro2::{Ident, TokenStream};
+use quote::format_ident;
+use syn::{Attribute, Index, Member};
 
 pub(crate) trait AttrListExt {
     fn extract_cfg_attrs(&mut self) -> Vec<TokenStream>;
@@ -25,3 +26,29 @@ fn extract_cfg_attrs(&mut self) -> Vec<TokenStream> {
         cfg
     }
 }
+
+pub(crate) trait MemberExt {
+    /// Returns an identifier for the member.
+    ///
+    /// Tuple fields have no name of their own, so they are named `_0`, `_1`, ... instead.
+    fn as_ident(&self) -> Ident;
+
+    /// Obtain a display name for the member in diagnostics.
+    fn display_name(&self) -> String;
+}
+
+impl MemberExt for Member {
+    fn as_ident(&self) -> Ident {
+        match self {
+            Member::Named(ident) => ident.clone(),
+            Member::Unnamed(Index { index, .. }) => format_ident!("_{index}"),
+        }
+    }
+
+    fn display_name(&self) -> String {
+        match self {
+            Member::Named(ident) => format!("`{ident}`"),
+            Member::Unnamed(Index { index, .. }) => format!("index `{index}`"),
+        }
+    }
+}
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 7600cdbbbf98..bf77b76c43c8 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -304,6 +304,9 @@
 /// This macro enables the use of the [`pin_init!`] macro. When pin-initializing a `struct`,
 /// then `#[pin]` directs the type of initializer that is required.
 ///
+/// Tuple structs are supported as well. Their fields have no names, so the generated projection
+/// is a tuple struct too and its fields are accessed by index.
+///
 /// If your `struct` implements `Drop`, then you need to add `PinnedDrop` as arguments to this
 /// macro, and change your `Drop` implementation to `PinnedDrop` annotated with
 /// `#[`[`macro@pinned_drop`]`]`, since dropping pinned values requires extra care.
@@ -327,6 +330,26 @@
 /// }
 /// ```
 ///
+/// The same as a tuple struct, projected by index:
+///
+/// ```
+/// # #![feature(allocator_api)]
+/// # #[path = "../examples/mutex.rs"] mod mutex; use mutex::*;
+/// use core::pin::Pin;
+/// use pin_init::pin_data;
+///
+/// enum Command {
+///     /* ... */
+/// }
+///
+/// #[pin_data]
+/// struct DriverData(#[pin] CMutex<Vec<Command>>, Box<[u8; 1024 * 1024]>);
+///
+/// fn queue(data: Pin<&mut DriverData>) -> Pin<&mut CMutex<Vec<Command>>> {
+///     data.project().0
+/// }
+/// ```
+///
 /// ```
 /// # #![feature(allocator_api)]
 /// # #[path = "../examples/mutex.rs"] mod mutex; use mutex::*;

-- 
2.54.0

