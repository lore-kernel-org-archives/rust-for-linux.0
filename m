Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020087.outbound.protection.outlook.com [52.101.196.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29284611CE;
	Tue, 28 Apr 2026 13:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381886; cv=fail; b=sAP2GdLmEtRqppLvRgX1YSYwlL9/8BTnrV1aP2DZk03lcdtncPtmcZxeIOZL9RmUClUWfNiAS8HpbXlwTsB1YJvRFKvvv/QVXpFNQSxDjxnx4c/YcpwrLIzAHpBK2mWKTlD3CXvtFPJvksC4WG4lUQGKwA52BCN3tOB8QKyaA4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381886; c=relaxed/simple;
	bh=ryR8NMIWDwhV9VSIkG5gm5Xgx82YFxBQLW3qGHL7cQs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CDUdAOIRmoM3MxHTodOtbpVArqM8JwU9Ukgn3ruf6yxd3dVjQRK99iKj0JyntjeTaiznNvjcZXCUvNxX4FgjpRPcc8PfOxkYVr8psGmFAqs7d9RLyDJFUOzU3WDmJ8mSDMbKedyWBkWJdippXPhbjev3iGow6nAi3RgiZ/MRbKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=hWMBWwtA; arc=fail smtp.client-ip=52.101.196.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="hWMBWwtA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=By2bXoKbWnsc/tFSXJ6e4/0nCje2v4EOok0juD/+ev9T6exAyK9sbQsNNtFG95xfvAYophuc5H6+viA02x4L2LNgwO9El4QASNehNWHJTjatSN8neGjs6Eevqegsct1UTsyKnPmsFovFI+2hyWcGEJtZBYvl5W/qTAEd6tAFsXE713IGcNUoVhV3YlvHG09Pp2oCbJTwJryc5BwQhFDiCYqJkeyRE1O/VWPRiqhttfMkRusQuqVkU4eL5KY+yqaj47zFBbV5gAt/Rf5dyKtWT0/jzGXhfp931v7TyjoQ/7ikJHmTZ1vB/w2tQUj1ZFOp/8djBgO6vOtnppLM3565tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYs+nGdAVxb/9Kzebt/wE7fwSkzjXzYRnjI9jcD9i/M=;
 b=rXYGSMdlsRXzzKdqF5P/aRVAr7bqDpiVLOjhEWwHsZnZmtDuCDkRb4NYhIve2YqiygdMjeTEiTh+dLbt6xlMrl8OLupk1ZcyElm6FkoTQXw7FikFzd14BWm62IekIG/qMxM8sqrPhQN3UNFDlPXnMCoO5y0XXibR8Ay9GXX/cKd3VuDvS1wZQcXXX3X3KtugxmznQnsvi1B4MGjTyqIOl7r1bPLGF/mj6waVCw7NmoPirPbItTi4y4+m/lEnkFYtJB4WB19mU74UAXjo0Mw59zJd5YYEYHZLSLW202dPcSUTwEb52xIHuqTwMUt22qayKhDrrU2zb1jUIyw8OGejqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYs+nGdAVxb/9Kzebt/wE7fwSkzjXzYRnjI9jcD9i/M=;
 b=hWMBWwtAVpKqMGBZWItzXMrcewyT6pxX3AP4JtbHnQ5L9qd1eu8LWeSo+NICVhYPfd/hfISGD7NgevoH47vBi6ud6/BhVjQNNt2bXnVrJwGETvTdEYMJbjBbqxO4/HkiHNYSM7yfLKV39eWEysTwgWUqEhiaKUMiCUtkJpnCGhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5969.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:11:14 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:11:14 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Apr 2026 14:10:58 +0100
Subject: [PATCH 09/10] rust: pin-init: cleanup workaround for old Rust
 compiler
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-pin-init-sync-v1-9-07f9bd3859fb@garyguo.net>
References: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
In-Reply-To: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777381869; l=3124;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=ryR8NMIWDwhV9VSIkG5gm5Xgx82YFxBQLW3qGHL7cQs=;
 b=AOYDDOUPXiuXQRV3KOVOmKhN/UhS2IKRQUmHMwlSX4G8GMpo5OykYI0HpqKN7jirL7GsAqk1X
 F066hJ8P1MbDn97Rw4nHhZ+RpjMlhD8DfDW/DihpdcaQRX2VL0sKJzT
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ccc6c9-46bc-4232-19dd-08dea5279f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RpkoxSsRNTWGzVA9PBvFLAfZ0NIsO/ZNHhI+DqgkeRMVX63SR4A8KeQwoOEsbj34bxeFwmPvl4maZeqPU1aVPGmnlW46FZUYfBkBIPJhWxZGk04jXV7crcNqo1eyJPS7AAZ84MvNzb2wHhMxfjQGR1SIVfHIKfto2tP0nd3R6Fbd4mGYoafamp1gIM77HrAnEzIFW3MWuvIwMEbHkCmpAv/Mc+cwYj4XHKXVfTaQ8L7pyAYYUSi6O8ci/QF3mu/TNPr+YiSIeoYSfr2X3oghUjQ2pzdtalDdoSY2Sj79KQgQ/PMsKW2rEwOxaute77SQiWmjcwYv0jKQg4EFnLWfqKEDTigYZvNt3xvcj9kAO+ZoEymy4aEgoI4KB17RLaMKouvOgKw2X+vJMUJwKrRxAI4k1uLlP3JkwhmDFTdteAnMPfnL6QA0H2SYFcZmuixD9L6GvWawwFnIKTVYS2H6SA/c8L0EiDv8I0jg/xyxrni+Q+31bVURNSjg77+ZMMKsbAxkRH3zXxGmoa0L78NCwYIXbGqgY1nklJUmB+eWRts77nrA9Q6apMh3EcB2taOwdJXqqTq9p19ZkeQyk/8CFpSstwTN7tA6G/EwbkaHbaQsWybIdrOvJ7KpFC8NDywM6k0bR1rjtEcLMUroRvnxJt2zl7iX+71lxIr3tq2aa7iHCEWLJ0MZri71kx1+puRjzNewnNI2eQJhn+nv/XKgnEfijO3dSwpZMyRD5OdXnKs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE45NFhnS095U2FUVDdTVnFKa3pELytFb1IvZGNFUTVvT3B0WDBuS2x1dUh6?=
 =?utf-8?B?ZXZZRmQvMlBBU1FNY3NNMytFNlViNnlCM2x3UG1rZSsraldVbHVSTDZjWlQ4?=
 =?utf-8?B?V1NpZlpHVjFzZ3BvYVhsbm1GbFQ4ZWxHV2FwTFZFclFwWTkxUDkrVVAxZHg0?=
 =?utf-8?B?M2ZGRC81UWhqWGx5am9XU1ZrdDA4LzJiMm5pb2NZUjNvOWl5bFBXTHlsK1JM?=
 =?utf-8?B?ZjdzVnVDSlRacmMyWDRkWGk2QnA0Y01mYTh6QVRMM2RHOHJMcDNxZFZiMTBL?=
 =?utf-8?B?VkxZdWJlbzNGMUpFWjkrN08zY2x3eG9NREtjcWpQZWhIek5UYXF4NnRCbXR6?=
 =?utf-8?B?V0tCODdxbEQrWUVxOXZTQS8wWGVRbTRvQXVyQi9ENmF1U3RUUDM0VTN2LzBU?=
 =?utf-8?B?MmhtbmJwSTQ3V0N6MGxuMCtyMHppK3c5b1NzVjJWRE5JcFY5YTBma0JLbXVD?=
 =?utf-8?B?WjkwRE1wRGd0ZStsZTAycjhPdjkzT0pybzU2Q21JRjJ2WDljSDNlcXJLRm9E?=
 =?utf-8?B?MVpobVpZTVVwTXliN3FFbkpQdFlzTitCQ3N3Nlp1MUFqa2s1NCsrRGduREhQ?=
 =?utf-8?B?QjZJeVd6SktvNnlEKzZFVDlHQVJMQWZ5N1JmRVY1MjJNKy9yc3d0NC9jKy9y?=
 =?utf-8?B?UTN2U25PTzl4UE1za1duYSsrV043NnIySGJKc05vMm5LNk80Y091aFMxMmpQ?=
 =?utf-8?B?SUlFYVc5Vnp5SjA4UVJKWTZ5MlcyVFA3dVE0bXYxRTRpT3VrT2h5cE9HMW5B?=
 =?utf-8?B?Sk0ySE5lNWl5VHZHaS9ZYzJ6cXBwS0RaUXV2ZFJEcUl1akFkaWwrY2t3MG0x?=
 =?utf-8?B?bFV2TkdzMXhTcDd1UjZNTVFac1kxRXhTSFlQbDRPK3d4cUt5ZTd4MWNqNnJi?=
 =?utf-8?B?ZXNVNmdmRWwyS1FQSjNmRG1qQi90dHJmZlVLR21Dblh0UW93Rm11MWh4VnRM?=
 =?utf-8?B?ZGEzcG1XclRQNnVjV0xQRmd4Tkh3bzRCZHVMc0lDUmZFR25UZGphOElSK1Z6?=
 =?utf-8?B?R2tYSG5idEZLQTlsY1pzemx6NzBlTEk0VU9iNnBZZTFLbzVabXRoMGwvcWhX?=
 =?utf-8?B?Q1NOSjJVbkxIVlhPS05rZUVuNHcyT1hRbVRHb2s5THRxWUoxRTJPSjVQYTN1?=
 =?utf-8?B?MTZWYytYWHFrWUJ3TW9IR3F0QkluNTh1SkpsT3dXQTFON1JjMUJaaHpUb1Zy?=
 =?utf-8?B?N3ZsazhHY0tpSmpnaG5VbU5jTXN2KzA0UDF1MmpVVXJxdVlYY1Zqald6Y3RH?=
 =?utf-8?B?b0syRy9lUm5TcUl1NVNGSmRBTjdDSEtheTU1Wkl1RkVHTGE3MC9ZeG1sMEI1?=
 =?utf-8?B?YktORE1KUENjbFR2RktTbitkT0tPNmpTeFlMWmF4YXR1S1JqWTl0TlNrMys0?=
 =?utf-8?B?Rm56OWxsRTUvM0Q3dlI2RTlKR3M3bjJTQTczK3I3MzU3cEQ3SzRQL0s4N3RE?=
 =?utf-8?B?aWQyZlBjWmowUzJpOGprbWpOaVRNUFFOU3l4MDV0NzBlWlUyWjcvWGZySnlT?=
 =?utf-8?B?QlF4R1pTMFZMMU1TTitGY0huQlAwVmtvcGtaNVNjc0t6WG1sc3NEYjhoeDZv?=
 =?utf-8?B?aVVPVzRna0NlTXNJbmk5RS9LRkt6YWpkWTBIRnlxQmpTSmNiZEpLVUFROGd4?=
 =?utf-8?B?a1N6VlN2bUdhWm1iMWRuYUp0ZEF0ZXFVSGg0VHVRaGdpZ0czeXVhMnFSdS9Q?=
 =?utf-8?B?eVg0QmN0SnhjeC82VmM3N3ZoRG5jS0tnMk1ieFluMDBVdWhFTG52MmRpa2dn?=
 =?utf-8?B?cG9CQ1BETUljMjVBeEF6S3dXak5PRzZsdEVybmxSUUk1RGI4RTduNXRBQkFL?=
 =?utf-8?B?U2tEc1M5aWZEYmtVbTVxenNlTHVsTEQ2akJXRGZiUDR0b2pkVGhJRjBRNjB0?=
 =?utf-8?B?UXdaZ3oyQ2M5ek5ZUnIyOEJQK0N1SEVUU080TjBZVkJ4VkVkZXdaL0Fyb2Jq?=
 =?utf-8?B?QlBZbzRIQjdHQjhidDdOaFc3a01aYTJSWlVSWHZUYnVER0dBRm03SHpkb0RI?=
 =?utf-8?B?cDdPaHl5YXcwQUIzNElQeTArVjhBcTdUZFJlSTZBb0lqaVZXdXZRMGt3Uit2?=
 =?utf-8?B?Mm55QnJESm9WSDFHWFdMbkdqVGd5anVONDFweTF4L2NsbFo2d3JvL29rOTlX?=
 =?utf-8?B?bEpLWEdoWG9QdFYrVExVOWN3bEdKZ3kwT3VnMUJZVW5zbFRmeWxlL21TaXRU?=
 =?utf-8?B?VmdWMlFCSWkwVURCQ3AyTURNS0g5bURDUzZJeWErNk9YUnM5ZTJPbFJMSno5?=
 =?utf-8?B?YmR6NEhOY3dycFVmRXdDYzJPbkFIN01CaWNXbE1JS1BBdGsvajVmcTZzdUVs?=
 =?utf-8?B?WU1ocEoyVk52Ynd0K1BlVEtaVmlja3lJMm1LalRYNjBycmNLeFRTZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ccc6c9-46bc-4232-19dd-08dea5279f5c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:11:13.0207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DH+ciz3NYFRyVuEL3IfsU1t5m0a1N3JSYmeWnJ79BHsJ7WEepqKxrGyQpwnLCzbtvkY2J/58661AkCi7JQfMJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5969

The workaround mentions it's for Rust versions before 1.81. The minimum is
now 1.82, thus clean up.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs |  9 +--------
 rust/pin-init/src/lib.rs           | 18 ++----------------
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index daa3f1c6466e..a37309e7b10a 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -172,14 +172,7 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
             init(slot).map(|__InitOk| ())
         };
         // SAFETY: TODO
-        let init = unsafe { ::pin_init::#init_from_closure::<_, #error>(init) };
-        // FIXME: this let binding is required to avoid a compiler error (cycle when computing the
-        // opaque type returned by this function) before Rust 1.81. Remove after MSRV bump.
-        #[allow(
-            clippy::let_and_return,
-            reason = "some clippy versions warn about the let binding"
-        )]
-        init
+        unsafe { ::pin_init::#init_from_closure::<_, #error>(init) }
     }})
 }
 
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 9b76cf5597c6..80c476e605f7 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1139,14 +1139,7 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> impl PinInit<U, E> {
     // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
     // requirements.
-    let res = unsafe { pin_init_from_closure(|ptr: *mut U| init.__pinned_init(ptr.cast::<T>())) };
-    // FIXME: this let binding is required to avoid a compiler error (cycle when computing the opaque
-    // type returned by this function) before Rust 1.81. Remove after MSRV bump.
-    #[allow(
-        clippy::let_and_return,
-        reason = "some clippy versions warn about the let binding"
-    )]
-    res
+    unsafe { pin_init_from_closure(|ptr: *mut U| init.__pinned_init(ptr.cast::<T>())) }
 }
 
 /// Changes the to be initialized type.
@@ -1158,14 +1151,7 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) -> impl Init<U, E> {
     // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
     // requirements.
-    let res = unsafe { init_from_closure(|ptr: *mut U| init.__init(ptr.cast::<T>())) };
-    // FIXME: this let binding is required to avoid a compiler error (cycle when computing the opaque
-    // type returned by this function) before Rust 1.81. Remove after MSRV bump.
-    #[allow(
-        clippy::let_and_return,
-        reason = "some clippy versions warn about the let binding"
-    )]
-    res
+    unsafe { init_from_closure(|ptr: *mut U| init.__init(ptr.cast::<T>())) }
 }
 
 /// An initializer that leaves the memory uninitialized.

-- 
2.51.2

