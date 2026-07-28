Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021119.outbound.protection.outlook.com [52.101.100.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4496A45D1A2;
	Tue, 28 Jul 2026 14:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250357; cv=fail; b=Gr+sJPUhkS17xw6BhmLnVEcV4PKMNQDZaiOq5lpocgpsd1R0Ztn1UxCndA4B+I7NF5Oa7HtTwlTH1pJBJn6hc2gX0FlGKKPfiO/hTEcym2hHZPd1LYTy6wqi2/hLk1OqesegQi84MxND2MHOSxVQyziTMb93vNiB75IPoBLjd9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250357; c=relaxed/simple;
	bh=K4PiT+0S2oRlIs5uPEEFYBg7dDSlM7UQGLVlWMnWJpw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HwUAiuUSp20LLrpQ5yTLMYGIQ1Rohk6gs3tsA77BdC9Bzdy3ok+vi7c7OZ5BeW5R9I8OFvnpM2NGP0PoomMF7M1RrEdF/BTFSfctzTsax1Cb2ipFestYksKSgZyG0IODC5bVUfw3Rze43jyuaNo/wVQLrdrP4Th+Cbt6paOTJLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=nirWP/y6; arc=fail smtp.client-ip=52.101.100.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nirWP/y6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKDXMaIvzFfrMfUmfxudOwOWel12BidwFwYkNmKNbw1p/dEWtJ5mH+lDxGupzW2IebahFjMIPfAz1T1E+IDmf/wrV00LO2ejcqWNjHczFyx7w/w5268mTjBTmmL7e+O1sBT7Q24wsBdMEQ+JlFuMsr+hGb6SGXshKKHpQyQ6awSmHOzzUWJLftRe1X5TnOoo1c6BFXZPSgtBVIGUHY89wqSDBoJGnUXTl7yGYvIYJ7QCVpsGfYN24ixNy6EFqQw06oLfcJwg8u1GKZFjLuo+40JZSZ+suxOR4lJKywGs4ZpNDUZHnr+35llvJDRr9yFXtYUXPGYO+yf1kmNoWhlLlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtDhgN3YAH0eX+Yc20f7EdjBNXur0tNlsXU1Mc6BbWs=;
 b=kleXSnuWDhkk/c53OdntFXZZNRwYf49ve1Q8K3V0B3HxwLohzB63K4c7Db8zyX/nkb4fMSem7Q/nHiW9tgn8QhhrTGT+S7lPQEQG4l4/FbUyUBQvf4MXv3R0FFH8HvbZZpsKfyvpUpZoSm5ujuZ1f2KTsRCHVg13iD9FSJCR5kIBU1+L50mm6GuO5fqiCUqNJjti9FzNLLKarx2CpYgdc4EWnbPWCqGIKjJ1eMq8McgFoZn9rVebCV5YbLV9OYc3MZ5NKJzDmtQfhm9S+rzfXkFzQaJ4v0gIVt0946vDbL9IpXa3FxDn5gEJxm3APBcO6v80vum0Rky8459o1IB/4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtDhgN3YAH0eX+Yc20f7EdjBNXur0tNlsXU1Mc6BbWs=;
 b=nirWP/y6PYKX4gugj/ijZLhIg6gjQmPGNPXYXFAMfk9nEP1V6C+3LPw9PXzz+g/dtZ/IzbxQm+ktNTD/r+u9UcFJqgv8gTA5g6+LrrDZIYBfd1wTY3cNBOw3ttVqm7UfYpwPbX8Ub9q9buP0TDwHE2aIN6CRjxwF4AGm0nVwp+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB7374.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:31a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 14:52:24 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 14:52:24 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Jul 2026 15:52:10 +0100
Subject: [PATCH 3/5] rust: print: accept level in `print_macro` instead of
 expression
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-printk-v1-3-855606634d70@garyguo.net>
References: <20260728-printk-v1-0-855606634d70@garyguo.net>
In-Reply-To: <20260728-printk-v1-0-855606634d70@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785250342; l=7942;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=K4PiT+0S2oRlIs5uPEEFYBg7dDSlM7UQGLVlWMnWJpw=;
 b=Djw+2lJ8GyZx/a4+spZcz23zPq2dvaZyKbm7drlrmVo5duEllg78ws9YmOXSPUovs5oNcV3S4
 RZgODQ019l1DngHId4/lm02GFXQiVwpcU4m+PK6FOPrvubvEUoIvWOQ
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO2P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 7071916d-adc8-4295-c783-08deecb7d59e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|7416014|18002099003|10067099003|22082099003|5023799004|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	DLKUbeYaUxyXBdrIEDHQ8+g4NzmdpdwlG2bBymUGYXfX7SqSX8EbmPIbpqvKnaXwh0dagMKLY5G1ENzG2gkhIt1i7Qs5lUsaiAiWURF+hvlDrL5+FnfweC7SY+eBBPx7YuUe98OBxkQim/ZJNEwO2SsykwKv7ifICeYcgwEAKmKVSxs/J+FPxYM0uwwQ1znMJrzZX4XzlsBsfFByFeuPnxZrfnyRz796wCG1c1pmddaWdWPlm6+mayBgmM/kcfS/h0IOlDkEUnTk6hJDEB+KwpkTphhZor5YIrYQgH4l2bHkNDULZuerU9HN9ylxhq/2OTteZHIJXlO6jzDeEXtyolhGOhhpNvOAunGw9yLE14fyTZcXZRSQCOt7CPGlBW8pHegq573//0SCsK3e6EqNLciIYB1WqyiHQ6FuxIW4YiXjsmViFt6+0Qze0NcfOQNcrbGaiA3Iz1L/EDzpIVb71YZ1dUDj6NpueTvYEAt39s6Eeu04XveeEC6sq9mkeqdrzfY3NAKvC2hW/MzHy5q4ACPM96BpE53pRYuO+QkKHMztxhoNEUXUhIKA6DcosCEovNSefp7UQd1lM0+iGqU96PuvoBDfNFuTl1JTpyHbqHMaBUlPYiBCKg6OjNetRn+ycIO26psL7gxyElvVjYREvkmzdsTa6c5bGXLvQGeq7EmWVNSCbOaLcEMJuzz8v9abOziCrYtzv/SroGp2sdCxqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(10067099003)(22082099003)(5023799004)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1o3bDY4dFJVVldURlR0L0V6TGlnSWg2U1hpdVJxK0UwWHk2U2YyN05SQTJO?=
 =?utf-8?B?cnpwR2FhaFArRUYrU2hpNUZ1Yk5QSUpNSVJiK1lVWkhpU2ZYWnlVd2VzeXMy?=
 =?utf-8?B?QXdrN2FXUjhpTzhVdVFRTnQrcEFrczVpT0lHblk1VDlrOTBCN2lWOUFoMzNu?=
 =?utf-8?B?dXdtRjg3T1VGOWF6azA2UGpxTzFDRmRtbVJES3p3eWVCc2VLVjBkcXA3SWEv?=
 =?utf-8?B?dVg5UGFlVjNZVzhXT2xOdTZ4Tm5nMDFLL2FwbldwTEV0NndmdGgyN2hWeHk1?=
 =?utf-8?B?ZUNiVE1aQzlEWXJKZll0TWQxUXdxeVpzeUNSd3dBcFp6RGdvS2RKbDExelFm?=
 =?utf-8?B?Rzg3NEM4Vjd0clJnYnRzNFcyMFJOOWUycW96OW9Rbll3OVY3VThaaWFJRFF4?=
 =?utf-8?B?RGdYT2ZXL3BaSWxBU2tUdVRyK2U3ZGhTZWpMbkNLK1p2TGpsTWEvMHdpTTN1?=
 =?utf-8?B?OFY0M2tCZUZ5cU93Sm5CdzlaTXVzZ3R5U0NEdFVPZ0lnYnJXWFNlS05iODV3?=
 =?utf-8?B?cUtlNHdKaUNzb2krZXNURkRvdFArbkJ4VE11T0RiNU4rL2xQR09ZRjUyMW03?=
 =?utf-8?B?TUUxVVh4UitESmZ2VXc0WWxZakhISWx5QnRFWGhmWG8yYUpWN2dNcmpiVmh1?=
 =?utf-8?B?ZGlTQ2t4ZHpYcDhXZkM5RmtGSE4vSm8zRU9iRkZRNDdEY2lxWXJmMDNxNHV0?=
 =?utf-8?B?Q1lvbllrcnBHczAva3lZS2xCZzRQNE5Ydzd2THpJYzBHTEZHYUZwWXBSbmFk?=
 =?utf-8?B?MmVCWXlSQSt3cWtyMlNqV0JrK3pEa2FhM3FZaElkWXFWaDhtMEdWRmVGZkZy?=
 =?utf-8?B?R1pOSjhONFdyQjV5UERYdVFnRWpHcnd6Y2cyOU9hMkxHNmIrczRMVlFtQnRY?=
 =?utf-8?B?ZHVtSFFSUGsxcDNyUm9DS1hVeGZ6TzRvRE1KNU5XTDdGNWYzYVJYTUQ0dWd0?=
 =?utf-8?B?SXhodExZdFN2SUpOQ2NxVzI0a1Y3V3VqWDhlYWIwVnVKRmRtSUFQOUpxcWdT?=
 =?utf-8?B?MDVVL2dCZXozMm9TSk9YUjhTdGNWMmh5cnJseEtvMkhTL3pGVFZhazBrVFFM?=
 =?utf-8?B?ZjFDSWVkVVpsZ1d3UnQwOTc5eGU2S2lEOExtTmlVZTRMSlY5OFdXZVZtQk5P?=
 =?utf-8?B?WjZZM0pEQUpvbzEyVUNlK2JTSFlkMmtmWHBpTG9VeHd0Q01WcjFLODVvVElz?=
 =?utf-8?B?SnhtWXVwVXc4enUvUENMSzdic0c4bTF5V3NveW5ZSGxJaTVuTWlwMC9hdFFJ?=
 =?utf-8?B?TjEydG8xdHhuUDBOcDJib1RWRG0zUkhTVHJPS1EvUkxuaXVsV3FkR3ZlWWJP?=
 =?utf-8?B?RmtVWWNId3VSaGpGSWRhbTZoSjd5UFlRdGgrcXltanlId0NCZ2ZmZ0VjNC9C?=
 =?utf-8?B?d0ZSSXFWbElqVCtiVFprZmdEN3dJeUJjZXZESUF5ZGJnZ0tTUFVjMmZKczVI?=
 =?utf-8?B?WDFTMHQ2dWM4VEg4SUZGaFlTeVF5SVM5bjZjd2I1bHl0TTIyVCtLMjBtOWJy?=
 =?utf-8?B?ZG5pWkFyVXJLeHAycXdTaS9XT0NuZG91U2pXWHZKSGtzU3ZTMkxYMnY4ZFdZ?=
 =?utf-8?B?K25KZ2NNMFVwN2tmSFg2djV6aGwxbm1WenE2Y3dwTUl5WXp3cE9EUFpNcWlk?=
 =?utf-8?B?bkY3UzNGS1dtcGs3R2ZXQm03RG1EOVNpWnU0OU14YVJuUHdIOGxROVV6b25F?=
 =?utf-8?B?ZmQzdUliSWJnMzZjQlZING1vSmhPWVA1N0VpTkErZnBscXJnam5iYUxLSkZW?=
 =?utf-8?B?Y0Vldld5VzE5UU1GVEJoNzEyWi8wbFEzZWxXcTlRcEx4dGI2VW9pZGZFaTZV?=
 =?utf-8?B?N3JmMVlwT2FQK0g0d3V6ZDlVSkhQN1Q5bWo4YlBMVXQ3ajRBU1k3d1pzSFpJ?=
 =?utf-8?B?K2RXRlJLTTRUZm1tLzREV2YxekxZb09JWDUrVForZklkV3diUS9xaWVTVHp0?=
 =?utf-8?B?UDlGbitaaDc0TXMxbkp3U1ducHRldUg2eWYxdGJFV0t3ZCtKNDYxUFF1TDE3?=
 =?utf-8?B?N2FQb1ZrNlVrNFBZY2tiVU5qNnR3c3VHTURkK3RmUlJ5c0crVkRzbmFYekZH?=
 =?utf-8?B?NGZudXYwOTA1WUVtT3VNSVBpSkp6bDNJTHVuMHJEQk9kT21mekdyR0ZINDN1?=
 =?utf-8?B?TlVIMlNEeVAzSzdydXhlbmVWelNvZUV3Z3RsWlRUQWNFUUEyREhwUzRxb3NR?=
 =?utf-8?B?S3JxR3B6bEs5NmdxTlZsMm5nRWMrQTBUV01Ra3BOa1IvNW1RcGhQN3pHZ051?=
 =?utf-8?B?WXlNcVhhQ1VWQy9SYk55MlJib2RoM0hoeUJnNnMyZlM2eTVPRnRIdnl2ZE9o?=
 =?utf-8?B?V0I5TDMrb1hXcDIwY3RwdUZVVUFLTVBsajJjZE96eDJ5Q2ZJTG9UZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7071916d-adc8-4295-c783-08deecb7d59e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:52:24.1099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saZPxpe1iIXMP7mivfbRCnl00gkWbYEN9xZlmK5QaxafH5t86FsJmwfTolxdarsRnO/VNsGqjs7ApETexPHYTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7374

Currently, `print_macro` (and `call_printk`) requires format string to be
one of the predefined ones for soundness. Define a new marker type for each
log level and encode the property on trait `level::Level` instead. This
makes `call_printk` safe.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/print.rs | 105 +++++++++++++++++++++++----------------------------
 1 file changed, 48 insertions(+), 57 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 470c1001f37d..2c82f5e82700 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -34,16 +34,16 @@
     w.pos().cast()
 }
 
-/// Format strings.
+/// Format levels.
 ///
 /// Public but hidden since it should only be used from public macros.
 #[doc(hidden)]
-pub mod format_strings {
-    /// The length we copy from the `KERN_*` kernel prefixes.
-    const LENGTH_PREFIX: usize = 2;
+pub mod level {
+    use core::ffi::CStr;
 
-    /// The length of the fixed format strings.
-    pub const LENGTH: usize = 10;
+    pub trait Level {
+        const FORMAT_STRING: &'static CStr;
+    }
 
     /// Generates a fixed format string for the kernel's [`_printk`].
     ///
@@ -51,58 +51,58 @@ pub mod format_strings {
     /// given `prefix`, which are the kernel's `KERN_*` constants.
     ///
     /// [`_printk`]: srctree/include/linux/printk.h
-    const fn generate(prefix: &[u8; 3]) -> [u8; LENGTH] {
+    const fn generate(prefix: &[u8; 3]) -> [u8; 10] {
         // Ensure the `KERN_*` macros are what we expect.
+        assert!(prefix.len() == 3);
         assert!(prefix[0] == b'\x01');
         assert!(prefix[1] >= b'0' && prefix[1] <= b'7');
-        assert!(prefix[2] == b'\x00');
 
-        let suffix: &[u8; LENGTH - LENGTH_PREFIX] = b"%s: %pA\0";
+        let mut fmt = *b"\0\0%s: %pA\0";
+        fmt[0] = prefix[0];
+        fmt[1] = prefix[1];
+        fmt
+    }
 
-        [
-            prefix[0], prefix[1], suffix[0], suffix[1], suffix[2], suffix[3], suffix[4], suffix[5],
-            suffix[6], suffix[7],
-        ]
+    // #[rustfmt::skip] // Rustfmt formats the macro awkwardly.
+    macro_rules! define_level {
+        ($lvl:ident) => {
+            pub struct $lvl;
+
+            impl Level for $lvl {
+                const FORMAT_STRING: &'static CStr = match CStr::from_bytes_with_nul(&generate(
+                    macros::paste!(bindings::[<KERN_ $lvl>]),
+                )) {
+                    Ok(v) => v,
+                    Err(_) => unreachable!(),
+                };
+            }
+        };
     }
 
-    // Generate the format strings at compile-time.
-    //
-    // This avoids the compiler generating the contents on the fly in the stack.
-    //
-    // Furthermore, `static` instead of `const` is used to share the strings
-    // for all the kernel.
-    pub static EMERG: [u8; LENGTH] = generate(bindings::KERN_EMERG);
-    pub static ALERT: [u8; LENGTH] = generate(bindings::KERN_ALERT);
-    pub static CRIT: [u8; LENGTH] = generate(bindings::KERN_CRIT);
-    pub static ERR: [u8; LENGTH] = generate(bindings::KERN_ERR);
-    pub static WARNING: [u8; LENGTH] = generate(bindings::KERN_WARNING);
-    pub static NOTICE: [u8; LENGTH] = generate(bindings::KERN_NOTICE);
-    pub static INFO: [u8; LENGTH] = generate(bindings::KERN_INFO);
-    pub static DEBUG: [u8; LENGTH] = generate(bindings::KERN_DEBUG);
+    define_level!(EMERG);
+    define_level!(ALERT);
+    define_level!(CRIT);
+    define_level!(ERR);
+    define_level!(WARNING);
+    define_level!(NOTICE);
+    define_level!(INFO);
+    define_level!(DEBUG);
 }
 
 /// Prints a message via the kernel's [`_printk`].
 ///
 /// Public but hidden since it should only be used from public macros.
 ///
-/// # Safety
-///
-/// The format string must be one of the ones in [`format_strings`].
-///
 /// [`_printk`]: srctree/include/linux/_printk.h
 #[doc(hidden)]
 #[cfg_attr(not(CONFIG_PRINTK), allow(unused_variables))]
-pub unsafe fn call_printk(
-    format_string: &[u8; format_strings::LENGTH],
-    module_name: &CStr,
-    args: fmt::Arguments<'_>,
-) {
+pub fn call_printk<Lvl: level::Level>(module_name: &CStr, args: fmt::Arguments<'_>) {
     // `_printk` does not seem to fail in any path.
     #[cfg(CONFIG_PRINTK)]
     // SAFETY: TODO.
     unsafe {
         bindings::_printk(
-            format_string.as_ptr(),
+            Lvl::FORMAT_STRING.as_char_ptr(),
             module_name.as_char_ptr(),
             core::ptr::from_ref(&args).cast::<c_void>(),
         );
@@ -147,19 +147,10 @@ pub fn call_printk_cont(args: fmt::Arguments<'_>) {
 #[macro_export]
 #[expect(clippy::crate_in_macro_def)]
 macro_rules! print_macro (
-    ($format_string:path, $($arg:tt)+) => (
-        // To remain sound, `arg`s must be expanded outside the `unsafe` block.
-        // Typically one would use a `let` binding for that; however, `format_args!`
-        // takes borrows on the arguments, but does not extend the scope of temporaries.
-        // Therefore, a `match` expression is used to keep them around, since
-        // the scrutinee is kept until the end of the `match`.
+    ($level:ident, $($arg:tt)+) => (
         match $crate::prelude::fmt!($($arg)+) {
-            // SAFETY: This hidden macro should only be called by the documented
-            // printing macros which ensure the format string is one of the fixed
-            // ones.
-            args => unsafe {
-                $crate::print::call_printk(
-                    &$format_string,
+            args => {
+                $crate::print::call_printk::<$crate::print::level::$level>(
                     crate::__LOG_PREFIX,
                     args,
                 );
@@ -207,7 +198,7 @@ macro_rules! print_macro (
 #[macro_export]
 macro_rules! pr_emerg (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::EMERG, $($arg)*)
+        $crate::print_macro!(EMERG, $($arg)*)
     )
 );
 
@@ -232,7 +223,7 @@ macro_rules! pr_emerg (
 #[macro_export]
 macro_rules! pr_alert (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::ALERT, $($arg)*)
+        $crate::print_macro!(ALERT, $($arg)*)
     )
 );
 
@@ -257,7 +248,7 @@ macro_rules! pr_alert (
 #[macro_export]
 macro_rules! pr_crit (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::CRIT, $($arg)*)
+        $crate::print_macro!(CRIT, $($arg)*)
     )
 );
 
@@ -282,7 +273,7 @@ macro_rules! pr_crit (
 #[macro_export]
 macro_rules! pr_err (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::ERR, $($arg)*)
+        $crate::print_macro!(ERR, $($arg)*)
     )
 );
 
@@ -307,7 +298,7 @@ macro_rules! pr_err (
 #[macro_export]
 macro_rules! pr_warn (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::WARNING, $($arg)*)
+        $crate::print_macro!(WARNING, $($arg)*)
     )
 );
 
@@ -332,7 +323,7 @@ macro_rules! pr_warn (
 #[macro_export]
 macro_rules! pr_notice (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::NOTICE, $($arg)*)
+        $crate::print_macro!(NOTICE, $($arg)*)
     )
 );
 
@@ -358,7 +349,7 @@ macro_rules! pr_notice (
 #[doc(alias = "print")]
 macro_rules! pr_info (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::INFO, $($arg)*)
+        $crate::print_macro!(INFO, $($arg)*)
     )
 );
 
@@ -386,7 +377,7 @@ macro_rules! pr_info (
 macro_rules! pr_debug (
     ($($arg:tt)*) => (
         if cfg!(debug_assertions) {
-            $crate::print_macro!($crate::print::format_strings::DEBUG, $($arg)*)
+            $crate::print_macro!(DEBUG, $($arg)*)
         }
     )
 );

-- 
2.54.0

