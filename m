Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022104.outbound.protection.outlook.com [52.101.101.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE5D3A5421;
	Wed, 16 Sep 2026 12:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560730; cv=fail; b=LCl0nYtxfg+csk17F0CYGYtl9kbmML2Hh2iDpdisw0B4SpXuEXUJ/1ZCQpToRvqh2r+rD8wRxbjyySpWzSFr5NVSSxpnEaPDgHn9oGyclePNeKhdKSmwkRi5zNWGRzP5lcxq/qQm0PeGQRIIepqLnxHazmuI9nUkin2zrGkP910=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560730; c=relaxed/simple;
	bh=TUpCJi89VK2o1Ffe/xiz6Ld3TJn9X3cvMsu16eFc9oc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ATUk0sAw9MUkvm12ztWoqAtuc+i0yMLuRh9hQ+o3lT/Cc2e5WAtTg6vgtcLByfGRLp83UAbczZ4ED7EV7YnbF05xQEaiT1iAUH7ev5TMSBxVvhu5keMwQvoG7LJskRnjr0CBkwXoc1R9Lwu6JgpeIA3TP4zr7wQwMHJZ013Zo5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=tdZRuGoM; arc=fail smtp.client-ip=52.101.101.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="tdZRuGoM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xA4Mww2Z36jUJjWfn9aTvAcBSrQkedt8hBu0xnBnTCiZQyWBA7LNwDBwmaZPYgLCyGRSj/Q0JEPvnaAvnjrruBtCzbCJQShWK8GqlJnpF9iIwLtQAxvVsGOvmZNivsyGpofAx1leKUaRcqK8quxciaHajzw3tRRQB3v52vX30prCG7Ehxyx910JWlysfQDL5DzbUEm4By11fLaNuH1AkBamHSCKfSmg6jPtH6u1eE1J+HUxol140jGYZeoThs9BuUIiV5E1dzDwqp89Lm4l1BGW0uc/lMaIGk6P6hWU7PDIEkFXwbN0wS4JJ/3lLA/n3aiBXnIYPSs7kPTUvg4j/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ro0STTuK1KOsYMforwrE/9ZxHNhXFuJyKnXcsohBwC4=;
 b=FMgyxUVrFghlzdPA9B6jru6//aVc1PE6hjnfDmAYLD9V+TLhnz6gkMV8JyqOT/swYumrJ65wwSAM/gWjPIiUOSUCg+YnLzpDrf9XNR4u4EJIBxLUCV4WbaRqm/cCLUC+k1n7lARnd8Mytokjjvh+r8c8s5RvYG7sibaxki9c2smMv2aF+3hCNQuIuk5yHOJjvxT3IhqMdnI7hA9Rszbovxz6R0JctBC6ku18Jtcc4pvgXjDkYkn7ZfdCAHeJPH7Vmp/o53uhKxPGTHp9YLSV7JtrkaIVVKMeGQHYpEmKwXeR7eg1bRb2IySmZuShHU3OmbSktFt1MYSUUp/TQvNaNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ro0STTuK1KOsYMforwrE/9ZxHNhXFuJyKnXcsohBwC4=;
 b=tdZRuGoMGtfoLwa/uCGmGvx/Qp0JbNm9j3+EBHNow9SZpEg+weRPfN+ajlh6iE79NyaL5+Ootrx8a8Eb5uy3xB2WIdwy2WBKpAziZAAjW0uXhffD3mYIh7Y5A1KJPMD4sgbOFIzOA9qsOJ9bmWCuTAWPjhL8SLU2zajHhAjYdLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB3421.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 12:12:01 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 12:12:01 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 16 Sep 2026 13:11:33 +0100
Subject: [PATCH 2/3] rust: pin-init: internal: pin_init: use `slot`
 identifier directly with mixed site
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-dev-hygiene-v1-2-dfb6ae2588ba@garyguo.net>
References: <20260916-dev-hygiene-v1-0-dfb6ae2588ba@garyguo.net>
In-Reply-To: <20260916-dev-hygiene-v1-0-dfb6ae2588ba@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5464; i=gary@garyguo.net;
 h=from:subject:message-id; bh=TUpCJi89VK2o1Ffe/xiz6Ld3TJn9X3cvMsu16eFc9oc=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWavaexLqs7YyM/19qX06/eSqu5omX6anHvhn9n9Km
 V+Q4YoTX7Z1lLIwiHExyIopsnh0M6ZtYpwte1mr/CXMHFYmkCEMXJwCMBGeiQz/I66fcdqhnr8h
 0qfHzmrbLs3767dba6XtO2kop8QgvXy6PSPD258hn8UMK1sVLU7+E2B5b9cwZcVshjR+1kuJN/j
 5NM4zAQDjUUYe
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: MA3P292CA0014.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::15) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB3421:EE_
X-MS-Office365-Filtering-Correlation-Id: 218bd64e-fe3c-4f50-911d-08df13ebb660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|10067099003|6133799003|22082099003|18002099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	XE59xB59kdSN7b0giOrL203FZSc4N4vkHEPBHyIXycui1pM9LUYkeXUuI78x/fIq68j3EWogF1muFozZGtgoeprbLVIQOJrGo3Gvqn83on0w9uzS6cs3XFTrNlKNrXtnD9CCGQNFgE8UCW0RLOjZMNpQwqv6ZVji3EM7sTCRqKDkRStkumhqaUwS9sQbEdwUYDMdaCdOPmq0pvIn86Z0MQjbn5XLkFb1pdRNicOTRR2Iae4zQDFOuDJLZOKjdtzE2S59CfxZvAOb8QfMwuaBu74/xKA6fPbj5wJgdUQw3P2HoAeuu2wvFzxp0dxU5ojQQMrtLGUUPYiB+7k7jxs3V2bK+9+VH7J+dywCzA9BXvvye14unOAXIVCZpAvyJa1vOrXlLzTMKgi4eKiVlDp8HVpJvLMps40h29nr7cFMHhmDEbRhSqch6jcfw91IMm2F4dM6Yx17WCDklBghNLbwoqmYv5usRcwUXB7w1KToLARyQ21dawD6M/gJ/u1tnwZKMu2ZDrqmJMxHv4bqLFFAnzJsPxxIYnLu84UFKcjyQaLqqbXJye1uNt7+HP/8C6P6CYqWOhr0/7SF5dTGsUOtbHiXH4IfZGrOeKi5ySfFdma35chadErug2xp6rWa/P1fSNwPofk6ZTW347ZKuEUnKZzl9+A7pUPKEzU2luPV6LbUAW6ptv2kjzIrcu7NRyo4bZnNj4/zdfMSmchgA6tAAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnZHRldWT0hVeFEvcDdQaU93MTBlQitqZEtHejREZkQ1TEpnSG9mM1dseHp6?=
 =?utf-8?B?cERIRmh2WFdpbGZObGVsV1Q0VldsUEQrMzlwemZGeWVWRktWYmlYb0h3bDZ2?=
 =?utf-8?B?RVBrRUc0allKNWxVWnUzTEw1TCtOUFBOV2N3c205cTFlTlpNRjR2KzRFelR6?=
 =?utf-8?B?aE5ocm1wdlhhemVjUlZxWWx4K0xyTU80cytENFpTeGJmdFk0TUVCVmFtOGNu?=
 =?utf-8?B?cU5rTkhGb3FsbjQ3d2tzNFdTVFpQYnEwL2tKSEdnT2VveVRyVDJ0MVA3dkJn?=
 =?utf-8?B?L1lyT2h1cWdhMWNMYnFrTk9ZOVZJRnZNRmVxMEtKaHZyaWVCMzBTRy9nTkVU?=
 =?utf-8?B?ZXhyR3VqUDdtNWt4bys4eVZ2Q3JtcHdrQ0p4aktjdGZnNitVTmZCSS9XOHdp?=
 =?utf-8?B?eGhZYzNJdmZ2amJUR0p0ZmR6WlNQQU1SbW5uUFlaS0kxRGRpbkt1WldZZi9I?=
 =?utf-8?B?OWc4ZjUrMzlBU1REKzVyZThlVnhFZUx4RXJSZERPZ001TytRTEpEN2dZR01Q?=
 =?utf-8?B?enRVeU5ubFQxVmpaZnNmMWJDRnZzc0l0cGtrbTcxZTdwNGZ2eUxmcTYwOGtB?=
 =?utf-8?B?cm5sd1N1eEt0cWN3RmVaTXA3NjA2NThnTmErOEN5cWlTOWY4dkUrY3lqV2Ix?=
 =?utf-8?B?YUx2Q0tMM1ZjM1dleGlGTitrM0k3UjNiUERPUUJlRE1MeG9vUVhMVWM0aWsx?=
 =?utf-8?B?RmtWZVh0bEVCSmtLRnpLSHhqMnJjdjg1RmRNZnd5bnZlWGNWT1FUSzdNUE5m?=
 =?utf-8?B?S2hVZzlUSTRKUDQzNHovdURlZ1NBMDA0RUprdk1BTWVsTWYvLzhoZWdOQVZO?=
 =?utf-8?B?b0RoTXhxeHlJMGtPQ25vYmFEa245RlRsN1hJZWtkZm1RZWZ0bU1qQWhCSkFU?=
 =?utf-8?B?dWtKd000bGpFSGVHTGVOL044YjR2elkreWR4QzlRdUlkSEQ4bWd6eTlNelhJ?=
 =?utf-8?B?b0F2U1doTzlTeWhVNjBEZldDeS9vMjhJWGJqTjQ2ZmcyRHhuKzNDRXZUSC96?=
 =?utf-8?B?ZkpUUzBVaDAwalJLWWlOc1hYM2o1Sm1PZDM0STM2WlNPayt3SkdqSlhTTElK?=
 =?utf-8?B?aDNJOXpqQ1loeXplYUpvT1RqOUdlVXg5NW1sZVZQL3FjK3BVVkZmVmpjb2t5?=
 =?utf-8?B?Z1VzUVEzUCtJbVlWNzF4MUd0WGRIbnRhTDUxdU82Z09MWE5lTTBNQ1UySUVt?=
 =?utf-8?B?UzBJRDR3OEg4bVpqazJ4OFRIYk1uaHhoVzNPYkJIUXNGODBOZHhUUFNkY3Fq?=
 =?utf-8?B?dUIzaWhNeHMxQzg3WkdLQmFRUEZyc0t2VXpZOE41LzBXL29DN011ZXBuRzdw?=
 =?utf-8?B?QW5hMHRVY1ZsLzlKaUhCalppc3FzYnQxNVZURWw1eWdkUW1wQlZTTEsydmVI?=
 =?utf-8?B?R1U0dWFBaS9NS1hwSUkwZVppMWNUd3Joamk5MDRPcTkxdmtoNXNjY0pBTmlB?=
 =?utf-8?B?K0NLRmZVb2krMEhVenY1Nzg0b210SDRib0d1VzlRdVoySDhEOHVtWnRMV3Yv?=
 =?utf-8?B?R2JSNFpZYm90cmlxNlptVXBVbnp1V2prN3VobzkvT01DNk11NDVFa2Z4cjJH?=
 =?utf-8?B?VXNOYjh4RWpGVllaZG9xWGlEMWdxaWF3M1VNNUxyN2g1dy92cjlSSEx6U3hk?=
 =?utf-8?B?S3ZhSXRPZkxwMnJBbnlIbmkwUk0vanhyRzlza2NKUzJCa0NKRndwaHUrL0dP?=
 =?utf-8?B?QUJ1bnMwNUJLUHFiUWpzTEdGUTdrUURlV01JaUJXUlVHbzlKeGo1aE1nSVUz?=
 =?utf-8?B?ZUI4c1VwKzU3WFpsZytadWlPeXBHeWUyVWFwSE1VbUN1TEw5ZTYxMDY1bmI0?=
 =?utf-8?B?eFh4N29YUmdWbzVpb0RQc2VsRGd6aHNqS3ppLzNRd2NzN0hDMzJFcGlDenhU?=
 =?utf-8?B?WGFRRWVWMm9zTUtrcTRHRUx2d2MwaTBNcWdPRWZMTXBwL0tsQXcwL0RQMkFV?=
 =?utf-8?B?OWY0SkkrQ2p1b1ZLNHRXTGdLQTVzeDg0TVA5WGJHM0twdDg4U09lRmpKajUw?=
 =?utf-8?B?RTNhbE5MaHQ1ZStsV3pWVklJVWN0UjhzTGhpWGQwcm9jR21LamNpYWljdmV4?=
 =?utf-8?B?VElROVUzc3BGZ2h0Q3ZVS1A3Z0FZcGFEOGlMZGZhRUF1SHpjQzJpejAyRWFM?=
 =?utf-8?B?ZDczUXA2OUV3MmM5eVF0ZVlnQTBqY3k4bXVoTXZhKzhzSlNrdVdEdlc0TTVq?=
 =?utf-8?B?YmF0a0xCWjlGYytYNEh3V2kwbTRIa3JVeEZVVzc3YWxLdm9mTG9YNjNrWDNm?=
 =?utf-8?B?OEJWcVg3bnNTUkVZdURycUhRTUhWTVNZdUlpQWpQTWpEdjQydTRRbDFhTDZN?=
 =?utf-8?B?V1BrTFMyaGdoQWFJRzhkajBBdlFPWXF4amRuaFY1QlNIbnpIOENXUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 218bd64e-fe3c-4f50-911d-08df13ebb660
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:12:00.9190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMmeIdgyK1iYRfDJcSCUtKMePNWWRMUVQtyl+PeQkDDnO2PWxo87N4+KvBOZ2e7/KqIPrm39g50SWoPQSJNsYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3421

Use `quote_spanned!(Span::mixed_site() => ...)` directly instead of
creating `slot` identifier and interpolate it later. Do the same for
`__data`, too.

This is needed so that we can customize the location of the span without
having the `slot` identifier getting in the way. For example:

    quote_spanned!(Span::mixed_site().located_at(loc) => ...)

with `slot` mentioned directly will have the diagnostic pointing to the
desired location, while `#slot` won't.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 6ade192d27e6..a77ffef9926b 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -269,7 +269,6 @@ fn expand(
         },
         |(_, err)| Box::new(err),
     );
-    let slot = Ident::new("slot", Span::mixed_site());
     let (has_data_trait, get_data, init_from_closure) = if pinned {
         (
             format_ident!("HasPinData"),
@@ -286,7 +285,7 @@ fn expand(
     let init_kind = get_init_kind(rest, dcx);
     let zeroable_check = match init_kind {
         InitKind::Normal => quote!(),
-        InitKind::Zeroing => quote! {
+        InitKind::Zeroing => quote_spanned! { Span::mixed_site() =>
             // The user specified `..Zeroable::zeroed()` at the end of the list of fields.
             // Therefore we check if the struct implements `Zeroable` and then zero the memory.
             // This allows us to also remove the check that all fields are present (since we
@@ -295,9 +294,9 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
             where T: ::pin_init::Zeroable
             {}
             // Ensure that the struct is indeed `Zeroable`.
-            assert_zeroable(#slot);
+            assert_zeroable(slot);
             // SAFETY: The type implements `Zeroable` by the check above.
-            unsafe { ::core::ptr::write_bytes(#slot, 0, 1) };
+            unsafe { ::core::ptr::write_bytes(slot, 0, 1) };
         },
     };
     let this = match this {
@@ -309,20 +308,19 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
         },
     };
     // `mixed_site` ensures that the data is not accessible to the user-controlled code.
-    let data = Ident::new("__data", Span::mixed_site());
-    let init_fields = init_fields(&fields, pinned, &data, &slot);
+    let init_fields = init_fields(&fields, pinned);
     let field_check = make_field_check(&fields, init_kind, &path);
     Ok(quote_spanned! { Span::mixed_site() => {
         // Get the data about fields from the supplied type.
         // SAFETY: TODO
-        let #data = unsafe {
+        let data = unsafe {
             use ::pin_init::__internal::#has_data_trait;
             // Can't use `<#path as #has_data_trait>::#get_data`, since the user is able to omit
             // generics (which need to be present with that syntax).
             #path::#get_data()
         };
-        // Ensure that `#data` really is of type `#data` and help with type inference:
-        let init = #data.__make_closure::<_, #error>(
+        // Ensure that `data` really is of type `data` and help with type inference:
+        let init = data.__make_closure::<_, #error>(
             move |slot| {
                 #zeroable_check
                 #this
@@ -380,12 +378,7 @@ fn get_init_kind(rest: Option<(Token![..], Expr)>, dcx: &mut DiagCtxt) -> InitKi
 }
 
 /// Generate the code that initializes the fields of the struct using the initializers in `field`.
-fn init_fields(
-    fields: &Punctuated<InitializerField, Token![,]>,
-    pinned: bool,
-    data: &Ident,
-    slot: &Ident,
-) -> TokenStream {
+fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -> TokenStream {
     let mut guards = vec![];
     let mut guard_attrs = vec![];
     let mut res = TokenStream::new();
@@ -413,16 +406,16 @@ fn init_fields(
         let ident = member.as_ident();
 
         let slot = if pinned {
-            quote! {
+            quote_spanned! { Span::mixed_site() =>
                 // SAFETY:
                 // - `slot` is valid and properly aligned.
                 // - `make_field_check` checks that `&raw mut (*slot).#member` is properly aligned.
                 // - `make_field_check` prevents `#member` from being used twice, therefore
                 //   `(*slot).#member` is exclusively accessed and has not been initialized.
-                (unsafe { #data.#ident(#slot) })
+                (unsafe { data.#ident(slot) })
             }
         } else {
-            quote! {
+            quote_spanned! { Span::mixed_site() =>
                 // For `init!()` macro, everything is unpinned.
                 // SAFETY:
                 // - `&raw mut (*slot).#member` is valid.
@@ -431,7 +424,7 @@ fn init_fields(
                 //   `(*slot).#member` is exclusively accessed and has not been initialized.
                 (unsafe {
                     ::pin_init::__internal::Slot::<::pin_init::__internal::Unpinned, _>::new(
-                        &raw mut (*#slot).#member
+                        &raw mut (*slot).#member
                     )
                 })
             }

-- 
2.54.0

