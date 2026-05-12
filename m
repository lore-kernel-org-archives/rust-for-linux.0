Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022118.outbound.protection.outlook.com [52.101.96.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FAE4F7977;
	Tue, 12 May 2026 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587814; cv=fail; b=I8zN1S7DkWwITimiKTA/Me8Z4TnlZJWptJ3rfuuCPWtTgLQam8McGNph/PEwGG2NWNJmBXfQAtwL/cNJcwnAWGiOkVgszHf9h5OJk/oF+HY+bMczqUTr3L/4XXsnysAUZVSffWwCCJ7cukStmQb8gBlhJyxG6f5RQvkf/1cz7rM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587814; c=relaxed/simple;
	bh=wVe98eXdDbBiqkvIFwgq0mab2KO/KEhWVbjROTmm7YM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MiEbjj6ANd+rKOKDajcXpkge943c5TxLaPsl/A5gixPLpk1NA/j5wteIMZscdQFB3w5hSZZpPtH5aNYfnUwMTSBWw3WUY7iK3ka954Nv2+VATXy/uaSGeU94jmPH9+k/2JWLtei2euzyGdK9Rbe9wXd3zWtnCNsl/eM3sONa8B8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mgO5hkFP; arc=fail smtp.client-ip=52.101.96.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mgO5hkFP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVnFyppKC/npGIc1hH+bxUUNHhwv6pO+7AGVPew/FSivEUUDjzEOS+/Wy3Dlm82KjEkjoozCH5ZGTswq7zr1aO88eA5fmMF5pcTnyxVmMbiu9PkQvkDyIclS1J7f508YkzmG5xiE6mmnq+JF2BkJcEtKJ6ELAaRfhzpf2vz4TigRPRfgudWAfaiEbwOay+Zao4f4pRMyG7M1HpIwRxqVexSZeIRKMtOtL+d3JaIIeXwpicfup7AvgISYO0e6DYFuawGf9drNFj8Kx0mTeyy5b1W2IrMQefs0WoQKh9oJPJDFJ9e10UwnQuP0q42K3CYsuSqrc8XJJDT5smJCVBDaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZt9c3ykUy4oOQ/U69funTbycjMwbRlAy2/Zv1F4+8o=;
 b=G+sJmr46IFT/VHkMSI90LiH1KyV56VNbdU0QiYr4v0R9cCgebTMrNjGTbyszw/YhzO2KOse4r3qG2GeEpMqbe8OCADHWK9fj1nz7LW83k2XjRhu5fV2fzPNasYqqHI23OnIQKD/E/7msa+5vBKxr45QoQynsPE0kABf3s+hS0qZ652bzFQzJ5caMCb38lUup0uQhy586HmLfHVYiJQMYT5JwhrRaUkcnFrdUBPZMN7EZkQEUSEcyT4kefsYHvQraoYHsG+afIxpc6X2o42BnhoJx9nYSUYhEHRqSPNudh9YikBbzHlschb9JX7A7a7fQOJyjhGBpAPrNexziOH5SqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZt9c3ykUy4oOQ/U69funTbycjMwbRlAy2/Zv1F4+8o=;
 b=mgO5hkFPBNtysHs3drVUfCE1fAwuv4V0Ai/Dnao3sniYdfCJQAB9pBclPeATvqq5hIpqS23ng4IHT7Jld+eNY3qCFaNhgcPQrzW5GpmdJrAx9NUgAitrTaZ8Z2/6Bfy7XDTlXz+a+pPLBl5UdWo1FejMEQ0cvrlFvGDFcAoljLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 12:09:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 12:09:56 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 12 May 2026 13:09:48 +0100
Subject: [PATCH 3/8] rust: pin-init: internal: add `PhantomInvariant` and
 `PhantomInvariantLifetime`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-pin-init-sync-v1-3-81963130dfbd@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778587794; l=7961;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=wVe98eXdDbBiqkvIFwgq0mab2KO/KEhWVbjROTmm7YM=;
 b=6VFhocP9+Q5MEvNNpaHMdRtCljB6VDTBwYKUd2Clq/oUT1i3ht/PLXjgRBRTcdEKHrC+1EN0V
 7sru98PRwp1AXlWYdy3ZI3qLH6KO7fAuV+kNj/+3BOpafe4UZmWZgf7
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
X-MS-Office365-Filtering-Correlation-Id: d60cade4-ada1-4769-9c08-08deb01f617d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sPkutFoMMil6ejwLjRcyCALiKgEPVMMiZew8gMReHS5Jts2fwS7VdUWYjcj540oDcFxoGSHzTP/Sv3QwD3e1t/m3Dy0JGSuFHdDgA/VlPLhwvN55O4vSRwYIlXKrl8Cry7xE80xPZ19d4mKx5Zc9LlM9yJ0EBlv62Fh/rQ3nQRRTS20jbRtVgH58ncWhNCWLoUmTgL3/OmmblxktV5+8jHry74YyEUt5ahE4MhmMZwos1efMcDO0WNTBbgk60DOYdCSFct7HVCJrpGV3s/E0JWKhZ/u5arS3lfsl+vux0BMpEmuEI9bAR1LhhY1cA9foCZhBpD+3jk3prLRY+cFErsdWZ43SNlLLCtGNv1BOSjnxiZjvkI+6W6EFwwmPKM36MK20yqVbn9pyzPeUtDdXfQ/XKP1csDzqIA5E7XPntBSlxbgwvfNVIv6pSriL9YkJlxlXQI+j4DlHpgScDnQ5BbpIY4DgLk7XBNonW9st4u2olcAtxOX/wZ4K7dKC7CWDaHafszSsk/ZBVvuCC2+1JR67FSp2zVhXzZ1Lsx5Eq8vCrPppncIzRe2bgT7LSu5twrOmYY6T9YFv6vFWIOt8LWVwKyCP8JoB2PMXULhs4tLSmqwPzehzxhS+Gb3EKIu7sQ9EBZrPYPpCTfLIpGhiqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWpnNzJQbUJQVktNNjRQcThpMlNpeStXS25lTHhBaGpKTWsrNWFKdnRNU0ZC?=
 =?utf-8?B?dG5ZRVNnbTduRmwrNmp3ZDU3K0U2S3hIMUQyOFF0bHV5K2dqQmNKajRKM0NO?=
 =?utf-8?B?cUlwdDdwNzlGcTlWN1QrUEhDOVVNc2t2UDRkY3ZFYTVmT0psd1NSRC9OQXMw?=
 =?utf-8?B?YjgxTXBGSjQycmlQYTlscHpPNlVtdGxzSGVUVm9rdUJ2Nk5ROFRNS2pVdmxP?=
 =?utf-8?B?bW9ZNnprU1Vnd1NORUVCWHRSYlF0dlp3Rmx2eFhIWm9SL2NqNFZHdDlvWEQx?=
 =?utf-8?B?NHBYN0lPTEpSSDIwTUFMOWFySFVlVVV2djlCZVZtT2Jwd25lWmN0OXZWaTdh?=
 =?utf-8?B?R05pREUySW1aeEpZNnBlTHpwN3ZzMkFnek9UY2QrckxQLzRLay92TnFZSGpj?=
 =?utf-8?B?TU53c3VNNGVxSDNLNW9hZ1Q5VndndlBNcVEydHFEWDQvOGYxWUtJTXU4RDN5?=
 =?utf-8?B?YjA2STBLY1p2REhZb2RhTDArUStqY2o5QlhBZEJZSGJKZSswSDVkajBudldK?=
 =?utf-8?B?TVNlcTl5U1cxZXNVa3ZQMURmaWFCY1RpWUNvNFRhTjJyNGVYdHJ0V2FtLzhR?=
 =?utf-8?B?Q2hkSFBvT3huS1VSc2dHL0pLSGpjWm90Nm1YVDJUenZJS2xGc2hTL2dlTzlO?=
 =?utf-8?B?bVNvanlMR2UvN2dKdysxNTNxZ3dwbE15Zm9CdjFMTXZWN3FvZ2hueURoRDFv?=
 =?utf-8?B?cElDOTFpanowZWVjS0hBcFVCOW50RkVNYmhNUE9OK3hDWkRkc2tENHBSWTBG?=
 =?utf-8?B?dmlDT2x3ei9BMkJJQXFDS3NjblVIT2NqVm1vZ3AvM1ZYY2xpOElFYlpmUmVp?=
 =?utf-8?B?SFlzdnc1cC9KYlhHa2JMMlVJQSthbFBkb1pDWUtKRUJQSFNsU2I4SU4wTlNr?=
 =?utf-8?B?LzR3VEFjZjY0b1F3L1g0MEs2ZVlwL1YzZlBCZUpUMTZCQm9BNVovY1Z1M3Zm?=
 =?utf-8?B?RmF6YVpGWmpkaXR3MmhsR3VtVlJYZ3JORFNoanp1NVl1RHJCS3lyMXhZdzQz?=
 =?utf-8?B?bjVQYkZzVWhGdTNWcFl4NHFhMnllVjRMdGRadTVvWjIyZWEwdll6d0Flajlk?=
 =?utf-8?B?bllFOGtkMW1CaXBEUktJU0tKeWs2eFhLSHFzdDhqcldnNTJrc3B6d0tvWUQv?=
 =?utf-8?B?SGVNKzlBcFRJbW0wamdxdHZCMVdYamYwM1VVWTdudE1jeUtZdEE0UnNONEhi?=
 =?utf-8?B?NCtTaW9sZ0VvdTREMlNnUGhyeWFTVWdBTWdlYWM1ajNSRUFoaXpQaEpnMmtV?=
 =?utf-8?B?am54bUxJU0dxMzhxd2tjTTBYRnFwN1pwdDlybGxrWkxCNkxvbFozRFNnM09Z?=
 =?utf-8?B?M0VGSDFNRTlJc0JBS2lQbExzNCt6TWUxeUJPTWFGY3BQK0orTWtkcHNYRnJN?=
 =?utf-8?B?TFF0Q1krd0ROeGdKZWdGTldOY1BsTUV1UnRxTEYyQVZFWjgyVEZlRFllRUVD?=
 =?utf-8?B?c2tDMTdlUTRsYU02QXJ0SkN2Z0xiOWEwd3RTSDRoLzRoOWd4NytlS0RmeVFH?=
 =?utf-8?B?blVvdXBlYXNXL2hHZVV1M242bWpJUzRBMDB4NE1QLzV0Z1R1aTZYbVZqZkxi?=
 =?utf-8?B?ZGFTVUk2cmpUYkhGejRUNElyUzl1RGNjUTlBR3h5K2VqMy9aUHQxaUhnd3hs?=
 =?utf-8?B?bFZsOExyaUtDK3VFV2x4eXNXcGFuOENZaFRlN2ZjVFVLTWRUTThHb3ZrUyt0?=
 =?utf-8?B?aktnR3pxa1dwb200RHR5QjRFWGNFY3NkK0NUWStzNE5qNGJwV0VDQ25qS0xJ?=
 =?utf-8?B?YlNwdG9UYVJvZ0xFYXJ5alk4ZEcvYjIyNy92Uk8rUmRsZEtQUWppbkpXckw1?=
 =?utf-8?B?YVRzbk53eUsyeTJGTU11QnY0b2pJYjVrV0ZSUnJyMUxvS01TM2NjWDdKbUVk?=
 =?utf-8?B?NTRjbkZRNXhTSHlTSEJJRHRMV0ZqTWE0YVFneXUvMmtDajllSWRSRXV0U2V0?=
 =?utf-8?B?Y2lsYlBobTRGcTRGbEJhbU55OEJoMVd2WE8rRktSUkdLanlNbXQweGFLU3pJ?=
 =?utf-8?B?T2tXd0QrT3ZOQThKN3RyNnUva1dMVEFsaGc5MythNHN0aHZoOFFsNm1WVkUy?=
 =?utf-8?B?WmxJNVpCQkpDb3pGdFhHMnZXRVpEclFiRW5wK3lGYUJHSFc5L1FPbGlUQjV3?=
 =?utf-8?B?MTI1YWdXTDVHRjBCY2d4T0tYS0I3THBXZnpwZisyanJPcXErT0N6Mk1objZq?=
 =?utf-8?B?V1dZaW1rRms3Y21mcDJ5TXRkQ3F2OWJBUUFwL1RPMmdvd2FYTWRXYnZHNm1T?=
 =?utf-8?B?eThrQXRyK0swVktiR2xjNEl4WHZNWEV5L2Uya0pMMmN3bEhBVklBVzRYcWsz?=
 =?utf-8?B?QWZpNDNUZzVSWm1uUFF6RTArTElEVys1OWZvUitoRUp1eks2RXRsdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d60cade4-ada1-4769-9c08-08deb01f617d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:09:55.9967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCJ55ptCauAB02hYIk60Wd6kakD5v20WH330+kUztoAA+8CJvTBiOiKItVvDBO/3ffsyqoXjth9NyA8XB4Vq+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6214

Currently, the `pin_init` library has an `Invariant` type alias, and it is
instantiated using `PhantomData`. Generated code from `pin_data` on the
other hand cannot access the crate-local type alias, so it generates
`PhantomData<fn(T) -> T>` directly. This is all very inconsistent, despite
the exact same use case of ensuring invariance.

Add `PhantomInvariant` and `PhantomInvariantLifetime` and switch all users
that need to express the concept of invariance to use these. They're
polyfills of unstable types in the same names in the Rust standard library.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 12 +++-----
 rust/pin-init/src/__internal.rs        | 56 +++++++++++++++++++++++++++++-----
 rust/pin-init/src/lib.rs               | 12 ++++----
 3 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 0199d0143308..44d0bd18e4ae 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -180,10 +180,8 @@ struct __Unpin #generics_with_pin_lt
         #where_token
             #predicates
         {
-            __phantom_pin: ::core::marker::PhantomData<fn(&'__pin ()) -> &'__pin ()>,
-            __phantom: ::core::marker::PhantomData<
-                fn(#ident #ty_generics) -> #ident #ty_generics
-            >,
+            __phantom_pin: ::pin_init::__internal::PhantomInvariantLifetime<'__pin>,
+            __phantom: ::pin_init::__internal::PhantomInvariant<#ident #ty_generics>,
             #(#pinned_fields),*
         }
 
@@ -434,9 +432,7 @@ fn generate_the_pin_data(
         #vis struct __ThePinData #generics
             #whr
         {
-            __phantom: ::core::marker::PhantomData<
-                fn(#struct_name #ty_generics) -> #struct_name #ty_generics
-            >,
+            __phantom: ::pin_init::__internal::PhantomInvariant<#struct_name #ty_generics>,
         }
 
         impl #impl_generics ::core::clone::Clone for __ThePinData #ty_generics
@@ -465,7 +461,7 @@ unsafe impl #impl_generics ::pin_init::__internal::HasPinData for #struct_name #
             type PinData = __ThePinData #ty_generics;
 
             unsafe fn __pin_data() -> Self::PinData {
-                __ThePinData { __phantom: ::core::marker::PhantomData }
+                __ThePinData { __phantom: ::pin_init::__internal::PhantomInvariant::new() }
             }
         }
 
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 5720a621aed7..e54d90a4742e 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -7,20 +7,62 @@
 
 use super::*;
 
-/// See the [nomicon] for what subtyping is. See also [this table].
+/// Zero-sized type used to mark a type as invariant.
+///
+/// This is a polyfill for the [unstable type] in the standard library of the same name.
 ///
-/// The reason for not using `PhantomData<*mut T>` is that that type never implements [`Send`] and
-/// [`Sync`]. Hence `fn(*mut T) -> *mut T` is used, as that type always implements them.
+/// See the [nomicon] for what subtyping is. See also [this table].
 ///
+/// [unstable type]: https://doc.rust-lang.org/nightly/std/marker/struct.PhantomInvariant.html
 /// [nomicon]: https://doc.rust-lang.org/nomicon/subtyping.html
 /// [this table]: https://doc.rust-lang.org/nomicon/phantom-data.html#table-of-phantomdata-patterns
-pub(crate) type Invariant<T> = PhantomData<fn(*mut T) -> *mut T>;
+#[repr(transparent)]
+pub struct PhantomInvariant<T: ?Sized>(PhantomData<fn(T) -> T>);
+
+impl<T: ?Sized> Clone for PhantomInvariant<T> {
+    #[inline(always)]
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<T: ?Sized> Copy for PhantomInvariant<T> {}
+
+impl<T: ?Sized> Default for PhantomInvariant<T> {
+    #[inline(always)]
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+impl<T: ?Sized> PhantomInvariant<T> {
+    #[inline(always)]
+    pub const fn new() -> Self {
+        Self(PhantomData)
+    }
+}
+
+/// Zero-sized type used to mark a lifetime as invariant.
+///
+/// This is a polyfill for the [unstable type] in the standard library of the same name.
+///
+/// [unstable type]: https://doc.rust-lang.org/nightly/std/marker/struct.PhantomInvariantLifetime.html
+#[repr(transparent)]
+#[derive(Clone, Copy, Default)]
+pub struct PhantomInvariantLifetime<'a>(PhantomInvariant<&'a ()>);
+
+impl PhantomInvariantLifetime<'_> {
+    #[inline(always)]
+    pub const fn new() -> Self {
+        Self(PhantomInvariant::new())
+    }
+}
 
 /// Module-internal type implementing `PinInit` and `Init`.
 ///
 /// It is unsafe to create this type, since the closure needs to fulfill the same safety
 /// requirement as the `__pinned_init`/`__init` functions.
-pub(crate) struct InitClosure<F, T: ?Sized, E>(pub(crate) F, pub(crate) Invariant<(E, T)>);
+pub(crate) struct InitClosure<F, T: ?Sized, E>(pub(crate) F, pub(crate) PhantomInvariant<(E, T)>);
 
 // SAFETY: While constructing the `InitClosure`, the user promised that it upholds the
 // `__init` invariants.
@@ -126,7 +168,7 @@ fn make_closure<F, E>(self, f: F) -> F
     }
 }
 
-pub struct AllData<T: ?Sized>(Invariant<T>);
+pub struct AllData<T: ?Sized>(PhantomInvariant<T>);
 
 impl<T: ?Sized> Clone for AllData<T> {
     fn clone(&self) -> Self {
@@ -146,7 +188,7 @@ unsafe impl<T: ?Sized> HasInitData for T {
     type InitData = AllData<T>;
 
     unsafe fn __init_data() -> Self::InitData {
-        AllData(PhantomData)
+        AllData(PhantomInvariant::new())
     }
 }
 
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 80c476e605f7..4098c65d63c3 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -947,12 +947,12 @@ fn pin_chain<F>(self, f: F) -> ChainPinInit<Self, F, T, E>
     where
         F: FnOnce(Pin<&mut T>) -> Result<(), E>,
     {
-        ChainPinInit(self, f, PhantomData)
+        ChainPinInit(self, f, __internal::PhantomInvariant::new())
     }
 }
 
 /// An initializer returned by [`PinInit::pin_chain`].
-pub struct ChainPinInit<I, F, T: ?Sized, E>(I, F, __internal::Invariant<(E, T)>);
+pub struct ChainPinInit<I, F, T: ?Sized, E>(I, F, __internal::PhantomInvariant<(E, T)>);
 
 // SAFETY: The `__pinned_init` function is implemented such that it
 // - returns `Ok(())` on successful initialization,
@@ -1055,12 +1055,12 @@ fn chain<F>(self, f: F) -> ChainInit<Self, F, T, E>
     where
         F: FnOnce(&mut T) -> Result<(), E>,
     {
-        ChainInit(self, f, PhantomData)
+        ChainInit(self, f, __internal::PhantomInvariant::new())
     }
 }
 
 /// An initializer returned by [`Init::chain`].
-pub struct ChainInit<I, F, T: ?Sized, E>(I, F, __internal::Invariant<(E, T)>);
+pub struct ChainInit<I, F, T: ?Sized, E>(I, F, __internal::PhantomInvariant<(E, T)>);
 
 // SAFETY: The `__init` function is implemented such that it
 // - returns `Ok(())` on successful initialization,
@@ -1108,7 +1108,7 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 pub const unsafe fn pin_init_from_closure<T: ?Sized, E>(
     f: impl FnOnce(*mut T) -> Result<(), E>,
 ) -> impl PinInit<T, E> {
-    __internal::InitClosure(f, PhantomData)
+    __internal::InitClosure(f, __internal::PhantomInvariant::new())
 }
 
 /// Creates a new [`Init<T, E>`] from the given closure.
@@ -1127,7 +1127,7 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 pub const unsafe fn init_from_closure<T: ?Sized, E>(
     f: impl FnOnce(*mut T) -> Result<(), E>,
 ) -> impl Init<T, E> {
-    __internal::InitClosure(f, PhantomData)
+    __internal::InitClosure(f, __internal::PhantomInvariant::new())
 }
 
 /// Changes the to be initialized type.

-- 
2.51.2

