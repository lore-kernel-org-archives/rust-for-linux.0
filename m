Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020125.outbound.protection.outlook.com [52.101.195.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD5F44CF56;
	Wed, 27 May 2026 17:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902427; cv=fail; b=h5wORaU5PYWDG8yspGjJu5hhIgUPZ2A6y9OQ5eY0PK4tSTUFDdxChGwSFhJfczQ5UNMYCC+5EbYecDWEDeVd8hQv25hWkVIUPCU26/9VUQKvoCzFyvssN5OoSI1lzU+4Msvrvv9iYza9pf2P3nrhC0DoYeCvBgzHsIdoe8pKYEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902427; c=relaxed/simple;
	bh=6llyztURJmhahUxoKrYpj516sin0qEZla1z6Wyy4M1g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Y9Gh/nsRtaLPvRIaAmFaSasGichqDQfkNbVvF/dDDGrF6vsL5HR0XTLiUhTAsUafs4d3ibGKOBKmDw6P6biiUq5r6tQuEwJ8Wmltqk4Q7brCxi7gTa07Rk/WPwgS2hgH1Aa0SNv5mi0Tqm44bwTxhmTuW7XRd1VwluYJqzQrcjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DTpMKK7Y; arc=fail smtp.client-ip=52.101.195.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DTpMKK7Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yM3HJvFu7+oen1xdxZbixYyErqq9ADVlVl8SeCeUyzwHjztJP2uz5BufTgfkAAi8mXM1pLvNMLu8dY5kFVrkVBshBNzY5QwbtF1N7ViQZiaiyivDyQMq8fBbAHWUWJulx72crNHa2Pz3I+wy/7970yMAlAyPOyMI7sM0xSvU+dPYoE+3KTlZ2vC+vIzWRs3/EKqwxbSyClu4zn8AeiuA1w6yBEsefc3JbnDSaVLslqCZ1zVrxZyVmRO58mKkXb/FA/L2XgNojqvR//7GuzsQk61Hq5umefaZJ6ZqT3PTmKNbOukaGpYWhMBeM/eoLQaiK/vhYpGUQZJCGdrlfYvhRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7t8V301t+UQEptToANWEiMsECg9txwurLeYKjIwSq8w=;
 b=CWsKyGCD0XRL7XkMTOBSLml37NfOAVRch9LtyEBX9zxZiIc3cP6PUiIhYABgfz+i67CtYn3zC6NagBOiOzCXMU6aACZxAd8XrgxNEdHYDk1fD5OZrj0SR6FpNoq+Tw9kgmbljGEQ57EW1oon6d4DatfJ2n840YX08CbiBkmeQeoP/31W1ejvz2ppyMx3EVPg/IoIYhPJB1cfOE10MNSlGDQx1g3iMGeve5vNjeLZ32eCPUp2t+mju707QDptd2xn+TKp5F41VVorykF/z81EjL02kPXO/1wFYbgX/49zJ06xUEEDASjTlr7Tznv5o1lzXu+QTcnhc3pusCoC065yfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7t8V301t+UQEptToANWEiMsECg9txwurLeYKjIwSq8w=;
 b=DTpMKK7YWi0Iv4xTWPYTByVRxO57I2KuAUwllufdTVcgMHyfmasYAYPZHRjF/qmwLADk++EK9iOT3m3bODMW34wvX0CKOKF1yQebOWSzwm9/i2vZhU4uhuESybincvrP9o8B3yvA3mLTRwfJHhh6NlVjgJYwyX8Wel+ONu9J+zM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO8P265MB7781.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:20:09 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:20:08 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 27 May 2026 18:19:58 +0100
Subject: [PATCH 7/8] rust: pin-init: make `[pin_]init_array_from_fn` unwind
 safe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-pin-init-sync-v1-7-e20335ed2501@garyguo.net>
References: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
In-Reply-To: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, Mirko Adzic <adzicmirko97@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779902405; l=8925;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=sELLWy14SmP6t5JZ0JJw1J2MIb+IB3PGAdLM0rO0FgA=;
 b=GVng5CouifM6SZIIi8xIxWW6WnWhhBKNCdASrtm3n2nLfspy/xxedtHRfKSNViZzsYBbBrLFq
 dCA1Djy5g2bCZphRwtLVx+5LY0fPUmK5ll3d3WaBLkcs4C7wdKrrQf8
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
X-MS-Office365-Filtering-Correlation-Id: 6743069d-2b08-4d9a-224e-08debc143353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|18002099003|22082099003|6133799003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	QqKF2lerK3c3j4r5uMg7DEZP04uwwOCAH5fCpVgf6wHInw+sU1qYqmz3bEVOPl/66t2UdAjueXl2gwv0zw4c5bfnSgwFTVRDfFtICkLoj679vF2WdmJKzBOsA6NzzohdLxQpBIc+DKcXUUBnqUIuqyfzrw60AzEYvZKMEYhyJGMPyO28YB0nIUlzRWKAaw6atoDox2s/SDRDJ/r2iNifUZnQswu0ytfwUPbmBSUUHuWc8pkxyuWH3m/aqwNIXLlcZkom1+hd4/EOUM+8Ya7W5fSrQYN9Su80aDJ0gCmh2eVjTVYt8ziL0svjEWj1twcgpsYv2Ci9k68/FqoH37+7OKksg1XBonfVD8DtVICk20EhYyZz2Zvm6xbXFRPuaTjXyZ8tFdphoY+gZoqX97o9NkoEepIHT5iLvbtNjSFAKraX+CfJ0gbcvQWtq8ihD3Hp06yLpC+DOawJFR6P7Mg5QVQqbvnUYXplylsGcTewi9r5GJkEVtqsEZ/d+LwoT2IMbo8QF1LH+o6YQtIO29xIjfeACjFiulR6F3x3X4KOQAGbJu6g41LXAAgywgmgMspsf1uf/CIFmWiLw+hWmrzwqaRvHT3Dw9N0+UXPG33anWuSBnQgsVguTHP1VTHQbc9uh6pkB1qrY7YKgO3Y863LxOI3vVzktyy3wMkgkleD+en7Wcr6ttOIQ7K0IdWs0ulz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(18002099003)(22082099003)(6133799003)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cE5OMytJNS9CUG9hYzRhaXIyUVFuT1FTcjRGZThOS0Z4TWZiOW5BS2h1ZEli?=
 =?utf-8?B?ekpETVU3bml1SEpkdTRiVkFZanZqWWpnLzUyV2xIa01aSzR3d0RSbVd5RUd1?=
 =?utf-8?B?VmlBeWlwaTVhTy9ZUFArcmdSL3dpSTJxYnFyc1REa2FZK1ltVlRnbUQ4bkpa?=
 =?utf-8?B?elVjVWtVV202cEdobE45SlJkZW5FaitCOFhWUkJKTkJxcm1GRURzVlZEd2dz?=
 =?utf-8?B?SXBxZEhla0lSN2paR0VRMlJpczcvVnZ5Q2dFMkowdTRab2NkKzlWMkRZTXRx?=
 =?utf-8?B?dFJKaDIxZ25UWGVUcHBQSTlVeWttY3hva0EyQXdvdDlza1BqRkhIQU1rTEdB?=
 =?utf-8?B?aG4vaVNzVXdFTnNhaTJOQlVqUEgxNzlCUURjZXhkRURpRmw0TG96N3RYWjBj?=
 =?utf-8?B?OW1rM2tla2V4L3YzR1ZMR1ZLeU01OWZUdWhSNlQ2UVRpVy93Y3pxeEJ0MlMr?=
 =?utf-8?B?U1d1YTFodDcyUkEyWUFWd3NaYVBjRFVkNmx4Zm9hdzEyMTYvekkxYjgvWUVM?=
 =?utf-8?B?b3dlR09zTFpXbEpyU2hqUWtWd29FWFNKOWh1bng5YWZRUlJOYXVXMVJMWVph?=
 =?utf-8?B?bklJT2E3NmN1cUQva0tvZlRBOTlnMEduL244WWRyWmx4UTRTSmErdXhwZXEz?=
 =?utf-8?B?VVA0a2YwNnE1ZTVsSll4UlZXZWtuNDVPWitJMUhYemhFaVg5UGxJQXpyQTB2?=
 =?utf-8?B?RXUvOWtmeU5XZzhuY3FIWE1xSlVGVWtTYUZYUHNGNExJSmRvcjIxRksreHIr?=
 =?utf-8?B?UHgrVUsxVEJ4N2ZFeGZtS3ZoaFBYcVN0NCt4RU43NUlOY1NieWdjekV3dllZ?=
 =?utf-8?B?M0QxbEdwY3MyVUo0NWpTOWVOV2psbUZRMnlQV21ZRThRaTg5ZVF2dVoyVFl4?=
 =?utf-8?B?YlZlcUE4SDlyQjdNL1FTaFNCOEdJQ0ZINGpNSHdLWE9sYUI4MFhGd1RYT3RN?=
 =?utf-8?B?anpwNFlSNGdZV1M2TWNtMlJJMFcwUlFJbHovMDkrRFBSRjZ4b3hBZGkrMERo?=
 =?utf-8?B?OElEcU54bWtiaGszVHN5SzBsN1BBMkNxalY0emJuTGRna0NUVE43Kzd3Y1I1?=
 =?utf-8?B?Njg2amV4QkxKbW1FZGpJL0NZYmE5R1hxK1BFRXhDaCsrK3ZhZWRQRnBuam5l?=
 =?utf-8?B?dXpUYlRxQXRtU29XYlV4UUpEMzBvVy9STk5qL0JEV3FGenJieWYyaUI1dWRX?=
 =?utf-8?B?djZFcmgvVUVKTEVWeTBSN3prR2RTWmdWU0dCV25pQWRTd2JZK0dpa0hWYktQ?=
 =?utf-8?B?UTdWamdQNjdWUmxYdUJXSzBnYmdhWUc5VEhnUXV5a0RvaVhvQW5EWnRPL1lC?=
 =?utf-8?B?MjNDNU5jYk82cGFyc21PT1oxdlg0SVdkekIvRGk4VnBMQmNMS3pnMFh1VVZv?=
 =?utf-8?B?bTNpR2NDNXphSFp5ZStZdkRvdHNqMzB6YWlwYmlPc2J1ZkF0MmxBc3JQekNT?=
 =?utf-8?B?SW9KYnRtMlpyNUhCdVNSWW03ZTVrV09ZblMxZmNUbUFwRTMzYnA1d0RQdnkr?=
 =?utf-8?B?TU5POGNLYm9mK2xtc1lFRzlRaWhueFFZN1Q5V0EwYzcwNmE0R0diVkJQUWYr?=
 =?utf-8?B?ZDBIcW9FVHJHODJxMVViR0htelhGS1ZQSU9jWDk4dDhsd2ppZzBHb29uYTRm?=
 =?utf-8?B?ckhraEVRWm53cFU0SE9RdmluRmZENnEvRENyUDIvT3BMNndMbCtDcjF5UUc4?=
 =?utf-8?B?cEdVYU1WQlRubDUxbFRDM0dpOEJJUCtyRUVaVDlaQi9tNXZuSjlYMHBNWGxL?=
 =?utf-8?B?bitLY1NGaWlOdyt0Q1ltcDBqSElYcSttVndkTjVjUVk5My9uZ2dHUWljZ2d1?=
 =?utf-8?B?VkRQQzkxOWN0TlZwemxhOTdNTEJkamNjVTlnT3I2T0ZyZWRQNHJMdkVRUnp2?=
 =?utf-8?B?WWRmemhjWThiM1ZueE14TnNrTVhBdVc1WWJNZXM0OWYwU2ZNdWUvUUlKNnNV?=
 =?utf-8?B?TXdoR2gwNXA0c1RQK1RxZXBWU3lhb0JVSDJWR1J1ZnRQS0JFWFZ2SFl6RlFP?=
 =?utf-8?B?MFZnVi90VUlFSnhlSTRBOTZzK1JKaEtRdSszWmoxdFZwenN3Y1hhSVVJaEFW?=
 =?utf-8?B?aHBJbEpudDJQWlhXdGRqSE9yVjZKYWg4Z3Q2M215a2hQWHlnNFJSYlp6czhQ?=
 =?utf-8?B?bzV2eXB3c0ErbHlTTENNWEw2ZVFleXpOUlJzVHZwYlRiU3JjK3VSTDJkNXJH?=
 =?utf-8?B?dHRDeGFWVTN2SWhxanlvVEVSL09jQTFHVWRERitBby9yYTFDVHd5M0J2UmxY?=
 =?utf-8?B?cVR4Z2srdHh5dFVYUjhwYkxEYkZQUzFhL1VzY240cFVFMVpCN0hiVjhBUnBt?=
 =?utf-8?B?S0hEOUl1ZldOcXFjS2p0WGtib3NrZC9FWlJIU3Zhdk5jMC93STdZdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6743069d-2b08-4d9a-224e-08debc143353
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:20:08.0714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdpY0BtWAGxJfLcIhA/S2TmMuuAESYF8gAjlXfC2PxxZALa5dZBtKJFbOR6UHhPVrlWF+pCG4Jn6V2Qu/rc3Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7781

From: Mirko Adzic <adzicmirko97@gmail.com>

Adds a guard type that safely initializes an array by running an
initializer on each element, keeping track of the number of initialized
elements. In the case of a panic or error in the per-element initializer,
the guard drops the already-initialized portion of the array; nothing is
dropped on success.

The previous code only ran cleanup on the explicit error path. If the per-
element initializer panicked partway through, the elements already written
into the array would be leaked: their `Drop` impls would never run.

Reported-by: Gary Guo <gary@garyguo.net>
Closes: https://github.com/Rust-for-Linux/pin-init/issues/136
Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Mirko Adzic <adzicmirko97@gmail.com>
[ Add `#[inline]` to `ArrayInit::drop` - Gary ]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 157 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 115 insertions(+), 42 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index fd40c8f244a1..1fdf9c2366ff 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1193,6 +1193,117 @@ pub fn uninit<T, E>() -> impl Init<MaybeUninit<T>, E> {
     unsafe { init_from_closure(|_| Ok(())) }
 }
 
+/// Allows safe (pinned and non-pinned) initialization of an array.
+///
+/// Drops the already initialized elements of the array if an error or panic occurs
+/// partway through the initialization process.
+///
+/// # Invariants
+///
+/// If `ptr` is not null:
+/// - `ptr[..num_init]` contains initialized elements of type `T`
+/// - `ptr[num_init..N]` (where N is the size of the array) contains uninitialized memory
+struct ArrayInit<T, F> {
+    /// A pointer to the first element of the array.
+    ptr: *mut T,
+    /// The number of initialized elements in the array.
+    num_init: usize,
+    /// Initialization function factory.
+    make_init: F,
+}
+
+impl<T, F> ArrayInit<T, F> {
+    #[inline]
+    fn new(make_init: F) -> Self {
+        Self {
+            // INVARIANT: `ptr` is null prior to any initialization.
+            ptr: core::ptr::null_mut(),
+            num_init: 0,
+            make_init,
+        }
+    }
+}
+
+/// SAFETY: On success, all `N` elements of the array have been initialized through
+/// `I: Init`. On error or panic, the elements that have been initialized so far are
+/// dropped, thus leaving the array uninitialized and ready to deallocate. The `Init`
+/// implementation executes the same code as that of `PinInit`.
+unsafe impl<T, F, I, E, const N: usize> Init<[T; N], E> for ArrayInit<T, F>
+where
+    F: FnMut(usize) -> I,
+    I: Init<T, E>,
+{
+    unsafe fn __init(mut self, slot: *mut [T; N]) -> Result<(), E> {
+        debug_assert!(!slot.is_null());
+        // INVARIANT: `self.ptr` is non-null once initialization starts.
+        self.ptr = slot.cast::<T>();
+        for i in 0..N {
+            // INVARIANT: Elements `self.ptr[..self.num_init]` have been initialized
+            // thus far. This hold true for every `self.num_init = i`.
+            self.num_init = i;
+            let init = (self.make_init)(i);
+            // SAFETY: `self.ptr.add(i)` is in bounds.
+            let ptr = unsafe { self.ptr.add(i) };
+            // SAFETY: The pointer is derived from `slot` with a valid offset. It is
+            // thus valid for writes and points uninitialized memory.
+            unsafe { init.__init(ptr) }?;
+        }
+        // INVARIANT: `self.ptr` is null after the array is initialized.
+        self.ptr = core::ptr::null_mut();
+        Ok(())
+    }
+}
+
+/// SAFETY: On success, all `N` elements of the array have been initialized through
+/// `I`. Since `I: PinInit` guarantees that the pinning invariants of `T` are upheld,
+/// the guarantees of `[T; N]` are also upheld. On error or panic, the elements that
+/// have been initialized so far are dropped, thus leaving the array uninitialized
+/// and ready to deallocate.
+unsafe impl<T, F, I, E, const N: usize> PinInit<[T; N], E> for ArrayInit<T, F>
+where
+    F: FnMut(usize) -> I,
+    I: PinInit<T, E>,
+{
+    unsafe fn __pinned_init(mut self, slot: *mut [T; N]) -> Result<(), E> {
+        debug_assert!(!slot.is_null());
+        // INVARIANT: `self.ptr` is non-null once initialization starts.
+        self.ptr = slot.cast::<T>();
+        for i in 0..N {
+            // INVARIANT: Elements `self.ptr[..self.num_init]` have been initialized
+            // thus far. This hold true for every `self.num_init = i`.
+            self.num_init = i;
+            let init = (self.make_init)(i);
+            // SAFETY: `self.ptr.add(i)` is in bounds.
+            let ptr = unsafe { self.ptr.add(i) };
+            // SAFETY: The pointer is derived from `slot` with a valid offset. It is
+            // thus valid for writes and points uninitialized memory.
+            unsafe { init.__pinned_init(ptr) }?;
+        }
+        // INVARIANT: `self.ptr` is null after the array is initialized.
+        self.ptr = core::ptr::null_mut();
+        Ok(())
+    }
+}
+
+impl<T, F> Drop for ArrayInit<T, F> {
+    #[inline]
+    fn drop(&mut self) {
+        if self.ptr.is_null() {
+            // Since `self.ptr` is null - either no initialization has been attempted
+            // or the array was successfully initialized, per type invariant. Nothing
+            // to drop.
+            return;
+        }
+
+        // SAFETY: Since `self.ptr` is not null - the initialization has failed
+        // partway. Drop `self.ptr[..self.num_init]` which are initialized per
+        // type invariant.
+        unsafe {
+            core::ptr::drop_in_place(core::ptr::slice_from_raw_parts_mut(self.ptr, self.num_init))
+        };
+    }
+}
+
 /// Initializes an array by initializing each element via the provided initializer.
 ///
 /// # Examples
@@ -1204,31 +1315,12 @@ pub fn uninit<T, E>() -> impl Init<MaybeUninit<T>, E> {
 /// assert_eq!(array.len(), 1_000);
 /// ```
 pub fn init_array_from_fn<I, const N: usize, T, E>(
-    mut make_init: impl FnMut(usize) -> I,
+    make_init: impl FnMut(usize) -> I,
 ) -> impl Init<[T; N], E>
 where
     I: Init<T, E>,
 {
-    let init = move |slot: *mut [T; N]| {
-        let slot = slot.cast::<T>();
-        for i in 0..N {
-            let init = make_init(i);
-            // SAFETY: Since 0 <= `i` < N, it is still in bounds of `[T; N]`.
-            let ptr = unsafe { slot.add(i) };
-            // SAFETY: The pointer is derived from `slot` and thus satisfies the `__init`
-            // requirements.
-            if let Err(e) = unsafe { init.__init(ptr) } {
-                // SAFETY: The loop has initialized the elements `slot[0..i]` and since we return
-                // `Err` below, `slot` will be considered uninitialized memory.
-                unsafe { ptr::drop_in_place(ptr::slice_from_raw_parts_mut(slot, i)) };
-                return Err(e);
-            }
-        }
-        Ok(())
-    };
-    // SAFETY: The initializer above initializes every element of the array. On failure it drops
-    // any initialized elements and returns `Err`.
-    unsafe { init_from_closure(init) }
+    ArrayInit::new(make_init)
 }
 
 /// Initializes an array by initializing each element via the provided initializer.
@@ -1247,31 +1339,12 @@ pub fn init_array_from_fn<I, const N: usize, T, E>(
 /// assert_eq!(array.len(), 1_000);
 /// ```
 pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
-    mut make_init: impl FnMut(usize) -> I,
+    make_init: impl FnMut(usize) -> I,
 ) -> impl PinInit<[T; N], E>
 where
     I: PinInit<T, E>,
 {
-    let init = move |slot: *mut [T; N]| {
-        let slot = slot.cast::<T>();
-        for i in 0..N {
-            let init = make_init(i);
-            // SAFETY: Since 0 <= `i` < N, it is still in bounds of `[T; N]`.
-            let ptr = unsafe { slot.add(i) };
-            // SAFETY: The pointer is derived from `slot` and thus satisfies the `__init`
-            // requirements.
-            if let Err(e) = unsafe { init.__pinned_init(ptr) } {
-                // SAFETY: The loop has initialized the elements `slot[0..i]` and since we return
-                // `Err` below, `slot` will be considered uninitialized memory.
-                unsafe { ptr::drop_in_place(ptr::slice_from_raw_parts_mut(slot, i)) };
-                return Err(e);
-            }
-        }
-        Ok(())
-    };
-    // SAFETY: The initializer above initializes every element of the array. On failure it drops
-    // any initialized elements and returns `Err`.
-    unsafe { pin_init_from_closure(init) }
+    ArrayInit::new(make_init)
 }
 
 /// Construct an initializer in a closure and run it.

-- 
2.54.0

