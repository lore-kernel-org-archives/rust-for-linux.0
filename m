Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022078.outbound.protection.outlook.com [52.101.96.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439E4450410;
	Thu,  8 Oct 2026 12:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462268; cv=fail; b=KkND6SImJ5y2rtRcfYQJ4DnCHixNQGjbKGKmy/mQYtcEOaR00RqEpHwAQsbKw2TqLkzV4jPnDqUJXnuS9+r3l6pSEt18/+dPMNNPp/F3eD+jutO7RAeYyudvWO9WWd9O4Q51NLITK+mutwtjdZwBRNPLASZDcfth810DXqYDt9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462268; c=relaxed/simple;
	bh=klxmI1B8sW8+Ed4YtHf4d220s/OMeUCtJWOBb+gIQPU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UWiUCMu/ySvImq4qxXjpTv9c3sodRbAhrkVMQC4m+/xFvUJwjfvhUePhpzKYzvcpDgZtDanUBjkEBnMyT+fyGrOcOjJptFUp2jyHMpznBRPmji5fSEH7gU/aNiO9QVnCTHI7oRkfR3oQai0o4SZEJIbDDa1N7b3+BD+9NKXvhwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FHb8a4yy; arc=fail smtp.client-ip=52.101.96.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FHb8a4yy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cmy4Nl5dsE2ujetoRqKjdmXEI1V8se5UjW6tlZaCHBOko/737ArpSN0MLiOBJnxOVc/tlvuPdzqa6LgHb+uZCGEz4cDsCWzT7KhSXnmiC4vModKDslLAHzn/ZTqvlAaPJySNDtwAfLKfCNuavNC2YxFiGG7XrnLT+ERvMeL3ub0OBeNlKutdVOm1g9Ohldfb6pO8PQfU+8DKfKIrNldENd8gd24wbC9aHabjqt0rM0hpK3hYrXYQ5tk092ySFxgsjcbWcWbMvFwK6aCB9YJKB1vsElHezsAkdZ2NrtdbeyiWghSFKKNUoeLBmzA1tx5LxnZ/XiTYRpFSEzJAkyfDYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLvcLd3faH9QZdGQxa/VZAFOG0rqIL1FDxoPC5QboAM=;
 b=p4qdui96ppG+xzbKAtWczZZDRMZcgPxwALU2R4POldHWBfMgS17VIQtb7O7AkLXwUCuE34RNLFOkvvSOiSUDTMDYxcc2rzgMZJtNKV0kaaUYhhBlF9FVsUlbn6v7IMkwmPzIVa1vDrRqJ3OOwtGBZhUQEFGNtV5NzE2ikuXgHqYPE132m4pzzmMMZAjL8T+m9lUgWlNjYVWPL7uKFZs+BkaJzNtrgci3OGUx1CTFG+543C+43GFOT4cT69Y9AX/YGYeLGJA5aN2spwpM6YPJu1YGjO0LLCdAY/9vTL5z6Auu/mkOiCSolJ0zmpeofCNUfAW4DS3XIppwKZqMxdyPMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLvcLd3faH9QZdGQxa/VZAFOG0rqIL1FDxoPC5QboAM=;
 b=FHb8a4yyi/u/3oHWbXGEd9c87oF1UDMNyroQP9J8K+mldbb7uywATmlkKpRxUr3152z95ddclcu3SI8YyX3hJ5kDqq4n1/TtybEJW+mhCst42MZMhq1NK/Q3ZnuEmr9quAhs4b3lDEgRxLTLkDGTTbMCWAot/X/nBoO3a2j2LHg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:22 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:22 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:23:51 +0200
Subject: [PATCH 04/20] rust: pin-init: internal: pin_data: pin borrowed
 fields with wrapper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-4-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3749; i=gary@garyguo.net;
 h=from:subject:message-id; bh=klxmI1B8sW8+Ed4YtHf4d220s/OMeUCtJWOBb+gIQPU=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce70yRbctSlmgxy7H5PrF71dKr3954lnt1hMg/01
 E7XZOyq3tNRysIgxsUgK6bI4tHNmLaJcbbsZa3ylzBzWJlAhjBwcQrARGx4GBlm7joRd+v134n+
 9Ru/zxdaueRU2Da+KruCtwWp3K6v/PqAKpbHp5Ue2f7RZH4jr7lKyaTn8w4rGm88+Sg1Ybmemnj
 /DUYA71lG5w==
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
X-MS-Office365-Filtering-Correlation-Id: 7a7f5130-ea4d-4a36-1b28-08df2537159a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|5023799004|260925021311599003|10067099003|260925021911599003|56012099006|260925022911599003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	qRmSf/7Pi+aolGkQLdbitUmjn1v8KW6QqOoUzc22oZxvLolgtA0B7jJXlYpOWdIfCHUkaz1PmwdPUzPeVvRQYwFAdStkGqDoKljPVhaIOZmIhC7rI9WvZY07nROPVbqIEorW9yjezfaaXK/IgWK1jWxrwLmUHv/UqmgggMlG4bc8MoEPDdxu/fZIVsxpBznlT3Y5UJWtqDVF/KPHxaJL4ANxSSMIg3ZZ0SUtRsxQr0ZQA0R4fw9HOH5FFTLhSiHPGaCDf1Qpt6mCqazR/Df+/js2KyLlLR2cHEZFVtuGIOAFvydngawFlrJm92rVKenjVDdwThiEUDSK1dBWJJq0a4rVV74gIbXzNELkzbG5cJBcE2CvsO5RfZxg6iJ1Kb7VbuI3YCvTDPiXj3T5SlDdzh+jUjhAzgxSS0Dkm9P5A5Su5VyslUNlweeC1JKJgbai7I8SIDerHq5zo5xWq889YvgFI97AK3nff2Uwl+QWS2bbGHPRqNbRwK2b3biNzkSRAPc4P+BL+MjY0/szhQ928p0I7Y/QrZBw7V0DgWigR8ptlQRx1GLSCdwAsswWCzme0n6mXHSD0g3sFq4bSfQWr1fulHARH0e7gB9m185AlJZLkl+pZviw2dhVGiKgZGEuMf65XFpg8dLh0mVPeRqAZLahiKcZuHDiBf+svJjAXe1XC6e4iwkbjS3fVVW7/Kdg3eRkLvBSdmJPf7V/47uNQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(5023799004)(260925021311599003)(10067099003)(260925021911599003)(56012099006)(260925022911599003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFJWMm1BZkJkTXdnakZOS3MwaTNUM3RkSENac1FjbnlVREJ3Y1FxRzc1MUFG?=
 =?utf-8?B?OU5iN084MXpPaFd2SnE1dHZ6R3hxbGkxK3Y2bG5RejYvaW9KRG51UXdscWZq?=
 =?utf-8?B?MXQveUFFSnRicGdBZmk5REJFYzlsTDlwL3doSDdhc1NTUlJiWjBSeEtXY1Jz?=
 =?utf-8?B?b3V4SDVsbGpZQWxMK0VyNTJ4cXZhYjBERTVxRExuRUdGVTNVSmRWYjJDUitU?=
 =?utf-8?B?RlBnVnlYV1BvajZHTWtrajN6Qjh1NjVCR1d3Mmt3WWJlMGl3WlYzcFFwUUs3?=
 =?utf-8?B?dGNhb01UZnRqKzBQUGFzTGNRcmhzMm9zUnhoRVhDRFVTQ0pQU28zb09oenhM?=
 =?utf-8?B?b0ZKM2MyUElmNnptd3dFbFF4ZlhnQTRFYXFxVmt3RDZaeUk3R0RhUmhpY3lC?=
 =?utf-8?B?a2VlQmR5S3ZZM1NEM09WMmRtQTVwcmZscENCNWo1VVdMckwzVlVZUVk1UUt3?=
 =?utf-8?B?Y3VyV3V0bmFmdUhNNVpOUHp3d3FuUzA3VFI3bXZxQzZBbFNpdFRYd0xBUU02?=
 =?utf-8?B?cTlhNjl3emtPT0xXOHEvMnhVSFJLcVNWZ215aVYvSnZXNThwYkpLVzdiVHo5?=
 =?utf-8?B?Z0k4RmtKUENNeitQbTcrRnR1NFNCUHdTNmZSZDczSnlvOGFZbEpYQUViQVpE?=
 =?utf-8?B?VUxlT1ZOVVh1alVvMFlZYk1BYnNpdERtNk9kcFk5Um4vVEpZam11Z3NjNnY4?=
 =?utf-8?B?Q3Q4dGZZRmNpN0pZd1J1WFg0d0ROY1NaNGZzRTJLa1V5ZDAzR254dUZZbTdC?=
 =?utf-8?B?ZUd1L2JGVDliTlRBVnZwTWZvd21KMVQvSTBLSXlxbm9uWDlJMm9penRVb0dQ?=
 =?utf-8?B?ZlBSbk5YdHJjcTVTZkxPNnRldVhaZWJLS29YaHNZcnlicHY3Q1RXKzRDTU9y?=
 =?utf-8?B?dnNscm5MNTJrY1RVOHpBbVlmVjFHSTlTdTBCTmwzMFBlaVJiR3ZnNmhmVk9E?=
 =?utf-8?B?cU5adHV0VVFXS1p1YUQ2OUpTWjZVTEZrSmNIOWVwZWtmaUxyV05pZ3FoRXp6?=
 =?utf-8?B?SU02ck4xVk84SWl0TkxXRE9xeG94SklnRXRWK0J5M1k1WkFEZDNkeEVIRFBM?=
 =?utf-8?B?Rk9SazZiZlZ2NDkybnc3QVNDZitUcDJuSHRaRFRXTS9ucDd2U203QXFUZEJX?=
 =?utf-8?B?eCt1bzZIUW9Kbm50cjdYZmkzbGlrNlVISHZhOW9XbE5WUWxHYnUrNWRZdVN3?=
 =?utf-8?B?UEJqaWhrRkx1emh3bXN5eFdIVXRzN0VDcEZwVGZScUN4TXlQd0FmaU1OaGNW?=
 =?utf-8?B?UnRPeWkxMFVud2V1MmlJb2JoOHVkc2RYT2ZzeklKQzI5U2JCd09Gc1FxTXRp?=
 =?utf-8?B?QVI0Smc4RnhIZ1BJV05Ocmc4V0lUTXpWcy9CemZabFJSZGhPSjlDZnFnMnlk?=
 =?utf-8?B?L0RNQTFlbzBnMWlHU2FTMDdvNnIwRktQeEdaOFZKM1M5c2E1eG9zSEh3S1l4?=
 =?utf-8?B?RWg3NEl6anFFOGJ3L1ZTN0VGNEUrV2wzaXlnUm9mWWtrOGxCZzc2aC80Y28y?=
 =?utf-8?B?NjgwbE5MOURzdXo2dnJ5eSticTQrWE1FWDhVeUVaWDk0WjBjVno2Qk1iU2Vl?=
 =?utf-8?B?NWkyWFIrM0wyK2FjWitwck04N2V6NEFQejEwZy9BUnFFTm91aGsrV3h6Mkly?=
 =?utf-8?B?UWpBWm1rRStpaXQzVmw0YkhJUGxtaURLRWZPOXdCMUt4WXB3Sy9rZXpqUjQ1?=
 =?utf-8?B?Uzk4c2dwRkN4ZkZ5dFlGaXFOcHZGT2dDQUJOMzB6ZUNiMUtTb2UvUDlrUktD?=
 =?utf-8?B?dWhYZFBTUklrSGt6WkNyOUFyVEJUeFB0NisyUlR1dll6UW9YdDVNZXVzTUVh?=
 =?utf-8?B?MFRGK0JzeW9SOHYzSVkrQUpBbDRIYzJUUS9Vc21UK2VCTnBoLzFHdk5VOG9B?=
 =?utf-8?B?OG1ibkk5NWV1SjFaNGlrbDI4ZzNiWXUrMTd5NGlTY0FYUkRtYXVwa0w3WmlP?=
 =?utf-8?B?Q0UvY1RZZkNkUUFPZHRrTE1uVmUvdWxWdVJOd3B0UE00SHhIdElkc1lyYjAv?=
 =?utf-8?B?aFJlTW5GRUo5Ty9ZOVNyMnREaHBPRGFZMzFlZkN4YlhDQkJzNEc3bjFBTWoz?=
 =?utf-8?B?NzlhUEZFNTlhS2JTa3ZsTnN2Tm1LLysxekZRZFVPVWhVUkJmYlh4allrZDFI?=
 =?utf-8?B?WU11USt3b2hBUmtGcGdmdEVvNTJaZzNjcEhCMVBpS09pQXowZkxNbnpiTGpQ?=
 =?utf-8?B?RkRxT014dnczTWNyVXZJbERQUFpoZGZEOHZRQ0ZSeWlaL090UFdtQXg1U09F?=
 =?utf-8?B?NVRvM3ZwNU5IME1BaFdGMWk1L1laZk9Oak9veTZlcUhMNjQ3Z25sWTVpZDFu?=
 =?utf-8?B?MnZvZ0xHRy9wT2FQbnBRNVo5YjVjVjdJMWQ3MHIycEVBUTV5UXU4Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7f5130-ea4d-4a36-1b28-08df2537159a
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:22.6360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFiqDt1xKi+/tdNlwo6Y5p8W5n/vnD7Ra1Mzhiw6GLp4NNOrH2+jywPxSecG9wug1NM0BS2ha53p5N8YL5JPtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5471

For fields that are borrowed, a mutable reference to the struct no longer
mean that it has the permission to access these fields. Therefore, the
memory that they refer to must be pinned.

Wrap these fields inside a `Borrowed` struct which pins it. They may be
accessed directly (if they're not themselves referencing other struct
fields), so implement a `Deref`.

As such fields are always pinned, there is no need to generate a
conditional `Unpin` implementations that implements `Unpin` when all fields
are. Simply generate a never satisfiable `Unpin` implementation to prevent
user from adding their own.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 19 +++++++++++++++++++
 rust/pin-init/src/__internal.rs        | 19 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 868701c9a986..dc8f530e00fb 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -433,6 +433,10 @@ fn generate_struct_def(info: &StructInfo) -> TokenStream {
             ty = quote!(::pin_init::__internal::Erase<#ty>);
         };
 
+        if field.borrowed.is_some() {
+            ty = quote!(::pin_init::__internal::Borrowed<#ty>);
+        }
+
         quote! {
            #(#attrs)* #vis #ident #colon_token #ty
         }
@@ -468,6 +472,20 @@ fn generate_unpin_impl(info: &StructInfo) -> TokenStream {
         .map(|x| &x.predicates)
         .unwrap_or(const { &Punctuated::new() });
 
+    if info.self_referential {
+        // Self-referential structs must always be pinned.
+        return quote! {
+            #[doc(hidden)]
+            impl #impl_generics ::core::marker::Unpin for #ident #ty_generics
+            where
+                // the `for<'__dummy>` HRTB makes this not error without the `trivial_bounds`
+                // feature <https://github.com/rust-lang/rust/issues/48214#issuecomment-2557829956>.
+                for<'__dummy> ::core::marker::PhantomPinned: ::core::marker::Unpin,
+                #predicates
+            {}
+        };
+    }
+
     let pinned_fields = info.fields.iter().filter(|f| f.pinned).map(|f| {
         let ident = f.member.as_ident();
         let ty = &f.field.ty;
@@ -475,6 +493,7 @@ fn generate_unpin_impl(info: &StructInfo) -> TokenStream {
             #ident: #ty
         )
     });
+
     quote! {
         // This struct will be used for the unpin analysis. It is needed, because only structurally
         // pinned fields are relevant whether the struct should implement `Unpin`.
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 80c5624d78c9..c0a57101da61 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -5,6 +5,9 @@
 //! These items must not be used outside of this crate and the pin-init-internal crate located at
 //! `../internal`.
 
+use core::marker::PhantomPinned;
+use core::ops::Deref;
+
 use super::*;
 
 /// Zero-sized type used to mark a type as invariant.
@@ -462,3 +465,19 @@ unsafe impl<F: EraseLt> Sync for Erase<F>
     for<'a> Erase<<F as FnOutput<(&'a (),)>>::Output>: Sync,
 {
 }
+
+/// Wrapper for borrowed fields.
+///
+/// This should be switched to `UnsafePinned` when it is stable.
+/// NOTE: This type needs to be covariant; Rust's 1.89+'s `UnsafePinned` is invariant.
+#[repr(transparent)]
+pub struct Borrowed<T: ?Sized>(PhantomPinned, T);
+
+impl<T: ?Sized> Deref for Borrowed<T> {
+    type Target = T;
+
+    #[inline(always)]
+    fn deref(&self) -> &T {
+        &self.1
+    }
+}

-- 
2.54.0

