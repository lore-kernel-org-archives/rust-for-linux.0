Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020125.outbound.protection.outlook.com [52.101.195.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8968444DB6D;
	Wed, 27 May 2026 17:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902417; cv=fail; b=TUEzjH9uKWOpVoP+mpWob8c2ZfqSzSXwu8ThlTJ/tPKB4FOiG8uSuzwJo5by6Dv8E5WudnjgeTzJl20baQV7arCJvdZ9b+sZiEqT/r32t3a/vm9t85StayWNW1RuKqc3Jeq41et2ag7kW+ncvY+bBIhpNHbx8H0UaStR30+swQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902417; c=relaxed/simple;
	bh=70UMeDcL/4xezQUvB6VGnMeGFSx8WkPM/B3RdnNUXmo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hzUYI5ZzkshuMcB1NL++Kql18wJPq8PMCzSkhAMpq1lzuk0Ztsv0+y/NmBb8g/Meu9u4zKkZKZM6suE1X14UoO8xm6/Wl+iya+wgy3xjCm3rjJJEZLDvlL1G6lD9UNiXPh1TsnKkLknD2FM+JaMQKnqmjA43C62D8gcfp1ZWyqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DyscUV/z; arc=fail smtp.client-ip=52.101.195.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DyscUV/z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNrN4mubJxDA7xyQNbOLDFN2ynawTy0CjAaTUf/Ie9iTDWPDbVsOEtiXlIerjtxS4/ixnY+BUMt+AV4uvpWosizj4RsJHr5oypk4R1jOJWoEZYF8kRx0Qs+IfkSpofk7r4YDf5joMR3ZfLi3LG3qnkLtw2MhuyXNzfQ/9NR8cIO0Rcjc2rymd8zGJhhY0DJrnUNitiV9hcsFkRO/5epAgefu0ZxIgcII/9yw/sdokmkLoGXPEmQ9Ixsx0zJRdNoHApftMNE1qHEYjbOBPQvz9K17aBnj3pruixBOH11LE1pAVxskJziz08aHv+DcHaMM87w/3B+ja7Ybi9bSgJcc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIu+52lsUa5+E8dZVDO7qyE7ZdjuBnZ1VLkjgWCvNZE=;
 b=EF+TOSlqIgekrylX/181jXb3nWfaPSGG6u4pyFmfFqCe7vsknqZFJYLi/NzdO4XvCiQGWjEWW/hJ5bk/1SNaTwtYPHKC3mj4q3w2iRY1Xx219OQf52sCNR6I3XleHQoDrySucjo5Lmt28u8DELtZ9ykByPtVTnsRl05sgqMAvfG1RGD/ZXTwekzBGBfuIdimxxF4rnbwFANdUqq3s6eLlNpPViA3/y2GC5sak4m4bL2YPMNnuIt84r0tBFI/0yOCWxQHUIUZxdrpTJb1vr/5KH9aEeWvZR3O/r3Q81eHJub5SpW22v7WRst+Vf38sSI7cpiOzNmpuXiJB4fjdHhzMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIu+52lsUa5+E8dZVDO7qyE7ZdjuBnZ1VLkjgWCvNZE=;
 b=DyscUV/zgeZo6flNcYvIy1iu68B6jQuN3BsA4iCWec2VUZNLx66SCxFH+YmSxtHCgmmq7Dtu8Z58QOcn+XRzV5zSHRb7Gj24/39UKZUCrpRTLDBp0CuUV5sc+W21iFALH349QrOknB1AZTgyyedMoIPLzxwv4L9SrXVgQtlYhMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO8P265MB7781.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:20:07 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:20:07 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 27 May 2026 18:19:56 +0100
Subject: [PATCH 5/8] rust: pin-init: move `InitClosure` out from
 `__internal`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-pin-init-sync-v1-5-e20335ed2501@garyguo.net>
References: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
In-Reply-To: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779902405; l=4235;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=70UMeDcL/4xezQUvB6VGnMeGFSx8WkPM/B3RdnNUXmo=;
 b=XJJw6iwccqfEGqjZN1b87LGbw0BXa5I6oxqiX8jm3lA1or49WtAGpCQkAmr9nxOCrQqgtVFBg
 /JNwfHjsGzsCdgeteZBrIodhBWeQBZTWs237W7VpsN7InorFNQeSMG4
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
X-MS-Office365-Filtering-Correlation-Id: 5d5ca10e-8041-4c07-c48a-08debc1432df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|18002099003|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	lVE24Dp5vAr1y/9X8vUsTk2Yd6LsEPkup8fRkkZ1M7VhHj62bwU9CacFyYxjxgAvOF2Z2lMLxK4qPdfKoIJFBzFzWN7Sjcea7ZZ4NG/zVb8qW/FqzN9AJcUDCdHrShMZVd39sedVKr5UinaSPeW0b4/+eP83PltowPHpqg4xL6PkvFZwYf7OxhSHFDj22KcQBzVkTBBDcJnpiS+aGs3Fx0JIiLTVDMRMFmU1DLA7yWzWEgDTVsZ7UL+bbz57SUXmydXJrIIU7CS8DqLU1ch/yCasUidFpJiMs0umgE58A+wmlcBZh50OwFM5d+n0wc7yyqQxm1gdQJ8IrrDx4KCc2m1QCpz0lAqmq5+HqKWiG+BwQuQh0wx2aRy1r43tebEbGpBL7CTB9ZcHolMLC4pRf5VvTxqFNiVXVreVwhzGeiosRReseZxrtNMOKgA7+SJiMx9x0aApEonbH6C6RNrU45ku9xGFlVwieK8cfp0GfeJhAEjDbmIONNBS291wgUjQ4Lkaka2wFjJxtD4GG33pfZhEovesjWTjoBZhgLTNfL2Qu+jrI6IQcUdXvYct7VDzHRN15LtF9Umz7G75drJNgotNgZmy+eG5GpPqAKzkVN18moWXP02Jqp2rxd7IHKNboxvOZRZMdUaT8jaDb8OxEbF+HTqIdGFquZ3s0cOg+NJuDjGNFWMM3u8s6dR2uMGY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0hsaEttOU1zQzNYb1ZDc1RJVzNGSkRMaGpvZTRpbGRkSW5PN3Y5bjV0VFZX?=
 =?utf-8?B?Q291UXVpYlp3NlJPN2V6YTJkU3NxSmpQRDcvS1ppMGlNTmRVSmdrWmhCbGpO?=
 =?utf-8?B?QTlST2tkK3dacndDWG1rZUhldWpMc3ptRWJDWHg1Z2RnSUpoalMveHNUcStj?=
 =?utf-8?B?MFBPOHc5QjhlWVFhUHdrZkI2Y3hCZ2EydWQ3c3NYbHA2RU9iYUpLOG9HQjVZ?=
 =?utf-8?B?b21CNS9yaGlVNXN4MG5CaVYzZ28xeWhsbkhmMGhYZlRiR2JyVGk4RHhWR0Vx?=
 =?utf-8?B?a3VPSm5LeFVtc0s0WnJuTVNMd0lldXZsMHFpVHZpZ2xrVE52QlhYSVZIVm5P?=
 =?utf-8?B?V1hrRHRDcVBSdFNCUFdZUzVTRWV4SFMwUG1RaUllWmZSVEJUMmNEc3A5bTNz?=
 =?utf-8?B?emRGL3Z0RDY0VC9oekdLREIrdUNRWVY3WEg1SEVFU09DTXlpai90NnRJQVZw?=
 =?utf-8?B?UUZ4WEQwWHd6WlJHOTNnTGlNUUtzbWppS3V1T2FJU1h5SC9CV3NkUWxWeU5P?=
 =?utf-8?B?a1U2TDA4VFZkbHVXMktFV2ovZXhkeXV6UjZqN2V3cHhGblAyeTNKeUJmMlRn?=
 =?utf-8?B?blN1cnlUSHF1enlpU0ZVMGxwdnFiejhVMFRDOUNqbUVabnFFYnFVNEtjc3RM?=
 =?utf-8?B?TzJMekI2L3BOcjVWT3hwNjZYdzFrYXhRLy82aVExRDRGdU9qVzRoMTJNZkc5?=
 =?utf-8?B?Zm9TalBEYmk4VkJnMnY3eWJKYmh2ajdDVVhXcDlzcGE0ZGR3Rks4NHhMdEQ1?=
 =?utf-8?B?TUJ1amxvUXpPM3pBSnJrRHMyalF0K0tQKzFGS0k0RDR3N0hHdk5Yb2VJVmRJ?=
 =?utf-8?B?L09oOEhrMVlrSXUvMnpuamcyMEo4clRTZVcwK0hGeDFCeDB1RE1OemZaMXlW?=
 =?utf-8?B?WXpESUVXK0lkelZRc3FQYnk3d0lEczN1Y2FFYUNHYkVITmtVVThnWVNzVThY?=
 =?utf-8?B?NUxYUGJqMjZ4QTNCNzhxQy9LUnQwQnNpSU8zdHlONTZtcmVWWDY0TWljSENM?=
 =?utf-8?B?eUtUYW1TMEVKUEFDRytJOXdzVlRSR1VrdUhhM0JXbTV5YWRjSml0NzJZSmFT?=
 =?utf-8?B?cW9rdFRzWnA3YzdFRWRYekYxWS9VK2M4cDFxTGNURVFLUkVTcWJzcS9WS2Nq?=
 =?utf-8?B?a05mRWdpSmc3c1NrMWpxQzU3eG5Ec29QZ0g5UDZSZmpNTjJVa1hUUjNmSVNj?=
 =?utf-8?B?VERUL1FPeklZL1ZYY3EydGIzZEp3NExQTXU3UmFidE5zS1pJMzRrTXMvckdh?=
 =?utf-8?B?MXpKeWJQd1RrcXJ0L3FpUlFVTVVVejBTa3FKSjNVbU50RjJab0VpaHhaRFhl?=
 =?utf-8?B?VXlrWmZEQVRDYkxJUE5HMCtHM3pwcGFQbTFnL1ZWRnBsWlNzVi9HSStNQTU1?=
 =?utf-8?B?bmJZTU55eC9IS0VmNG8vd1B4WHdBSlJ4R3ROZTlrN1RucnN4bk9HVDFzbXNt?=
 =?utf-8?B?Qmozci8zTktnbzhZYldsdkZuYktMRVA1Q251ak9rRHNzOHBQbWd4VFcwTDlq?=
 =?utf-8?B?bWxjelFCK2hhY2V3a0k5bjRWdDRGTGNhR3VSTWRha0p5OXhnVFdRaEpUR3NS?=
 =?utf-8?B?WWZMQTJYTEdaL1dQZ29CbWR3c0UxSmlIVDhnTVNaaFphd0xlaXJXVWdaWlFn?=
 =?utf-8?B?aS8rT25oQVhXWDhtOEw1M0FBRmwvUXB6R2NuUTlUQ2ZlMC96TDlDaHFaVmtl?=
 =?utf-8?B?U20yVWlhSWFVS0V2UW1Wc0pBaFk2YVY1SE5kLzVJS25YbWJiQlJQOUNxVEph?=
 =?utf-8?B?M2dXblFFbzJJT1lrVjFyNmZwOFY1T3dGQzNYcThWNFlxWUVaM21IRUwxMWV3?=
 =?utf-8?B?ZlBUYkJUUk5VZHZOZTBsMFZrbFZzVnlwZ2g5T0t4Vjk0TDdPOXdXMXMrODZV?=
 =?utf-8?B?ZWMxeUF4YW1GQlpKVTVXRWJsRXZsSXYxaE13TllHK2hnRGFpYmNTMWludkVI?=
 =?utf-8?B?aDc1WFJrUVViaUhkR1pWYnNkenJKcVJjMGRYOHk3UDRpZk83UnNRVnlQQW5C?=
 =?utf-8?B?UjZrTnNVc0lvV3l1WGRuekR5UFpaVllER3BGY0llcmo0SW5QYm9OY3RzZTdI?=
 =?utf-8?B?ZU9iZ1Q5bjB6TEFxdGVnRTJRaFBlc1c4MWgwL2FUSEkxaGpyNlByOSt1c3lB?=
 =?utf-8?B?cjF2MHZmdStZanB5azJ1WEQyNXdkSFZNQ0tERTZtVzBaQjRtc2J3aTNWUU5P?=
 =?utf-8?B?RVlOSk1RUzFxMjVoanhIRmFFSGNFdnZyYy9udHFIWVVUbkJXeFJ0WUYxR0R2?=
 =?utf-8?B?bnZHT3pHdDVKaUcwKzhjeStOaWgzL0lTOXdpMVZEQzlVdzdqMDNBRTBHcHFj?=
 =?utf-8?B?dnMyQ1JTWTFqcS82dERUY1NRNnJMdzdpbXFIMG9WQTNlRUFiNmJsdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5ca10e-8041-4c07-c48a-08debc1432df
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:20:07.2978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJp1Ls0/hCDEBcrlIfhrH2C0mapJ8DbRlBviO3SoIWBbFpzV9CXCgiFfR1KBLIA6DUo6IKI6iVj+YFzh2iitbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7781

The `__internal` module is for exposing internal items publicly to
procedural macros (pin-init-internal). Types that are crate-local only can
just have proper visibility and does not need to be in `__internal`.

The type name of `InitClosure` can often shows up in symbol names, this
reduces the length slightly.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/__internal.rs | 30 ------------------------------
 rust/pin-init/src/lib.rs        | 34 ++++++++++++++++++++++++++++++++--
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 540add6cee8a..56dc655e323e 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -58,36 +58,6 @@ pub const fn new() -> Self {
     }
 }
 
-/// Module-internal type implementing `PinInit` and `Init`.
-///
-/// It is unsafe to create this type, since the closure needs to fulfill the same safety
-/// requirement as the `__pinned_init`/`__init` functions.
-pub(crate) struct InitClosure<F, T: ?Sized, E>(pub(crate) F, pub(crate) PhantomInvariant<(E, T)>);
-
-// SAFETY: While constructing the `InitClosure`, the user promised that it upholds the
-// `__init` invariants.
-unsafe impl<T: ?Sized, F, E> Init<T, E> for InitClosure<F, T, E>
-where
-    F: FnOnce(*mut T) -> Result<(), E>,
-{
-    #[inline]
-    unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
-        (self.0)(slot)
-    }
-}
-
-// SAFETY: While constructing the `InitClosure`, the user promised that it upholds the
-// `__pinned_init` invariants.
-unsafe impl<T: ?Sized, F, E> PinInit<T, E> for InitClosure<F, T, E>
-where
-    F: FnOnce(*mut T) -> Result<(), E>,
-{
-    #[inline]
-    unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
-        (self.0)(slot)
-    }
-}
-
 /// Token type to signify successful initialization.
 ///
 /// Can only be constructed via the unsafe [`Self::new`] function. The initializer macros use this
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 84099474324e..9732af32795c 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1092,6 +1092,36 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
     }
 }
 
+/// Implement `PinInit` and `Init` for closures.
+///
+/// It is unsafe to create this type, since the closure needs to fulfill the same safety
+/// requirement as the `__pinned_init`/`__init` functions.
+struct InitClosure<F, T: ?Sized, E>(F, __internal::PhantomInvariant<(E, T)>);
+
+// SAFETY: While constructing the `InitClosure`, the user promised that it upholds the
+// `__init` invariants.
+unsafe impl<T: ?Sized, F, E> Init<T, E> for InitClosure<F, T, E>
+where
+    F: FnOnce(*mut T) -> Result<(), E>,
+{
+    #[inline]
+    unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
+        (self.0)(slot)
+    }
+}
+
+// SAFETY: While constructing the `InitClosure`, the user promised that it upholds the
+// `__pinned_init` invariants.
+unsafe impl<T: ?Sized, F, E> PinInit<T, E> for InitClosure<F, T, E>
+where
+    F: FnOnce(*mut T) -> Result<(), E>,
+{
+    #[inline]
+    unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
+        (self.0)(slot)
+    }
+}
+
 /// Creates a new [`PinInit<T, E>`] from the given closure.
 ///
 /// # Safety
@@ -1108,7 +1138,7 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 pub const unsafe fn pin_init_from_closure<T: ?Sized, E>(
     f: impl FnOnce(*mut T) -> Result<(), E>,
 ) -> impl PinInit<T, E> {
-    __internal::InitClosure(f, __internal::PhantomInvariant::new())
+    InitClosure(f, __internal::PhantomInvariant::new())
 }
 
 /// Creates a new [`Init<T, E>`] from the given closure.
@@ -1127,7 +1157,7 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 pub const unsafe fn init_from_closure<T: ?Sized, E>(
     f: impl FnOnce(*mut T) -> Result<(), E>,
 ) -> impl Init<T, E> {
-    __internal::InitClosure(f, __internal::PhantomInvariant::new())
+    InitClosure(f, __internal::PhantomInvariant::new())
 }
 
 /// Changes the to be initialized type.

-- 
2.54.0

