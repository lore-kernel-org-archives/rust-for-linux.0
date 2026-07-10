Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020085.outbound.protection.outlook.com [52.101.195.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81E43B3D0;
	Fri, 10 Jul 2026 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700479; cv=fail; b=kCKe8Y3a3ZXabz5k+Upm8vxowMIQ4L4zG79TE9Hry6BFQpLYpaduoNasuSOyzrLxuowUyJKKfAJMqX+McpklII6xEnpyPTruUIAuAwKLp2/8KEabt63nqA8+fmy+MC9G+rOcEt9f9Ow3++sV7LV8uXL4wjNWf7iIY/gTgW3Gb/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700479; c=relaxed/simple;
	bh=vJ1gXivR6TMhsUBW4ZtCx1AQyz9Q1HI69U7/CAp3rzA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=c6DNpms7cZ8K9IBobFs+4kAmHkmVklIKx+OZuwq/suAwDpPUg/6mjIDoNyukh2O23bMuqYQeBWaIINK/MmtH2cWeTASwTMEh3dEBygcm24uzHKtqBfuyIwIh1nV4JyHCpQtrpc+H1+NfzPK84KK/SD6y4rQb4Uw/7/bW9EvWMIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=v4ntKpC0; arc=fail smtp.client-ip=52.101.195.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="v4ntKpC0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOC4mCgyJscua2KoviLV4EuV2Umk3jmLAq2t7w94nRHHsjX79bYzKRn1hV0LJWnuaX3IGleBSTVt+AKP/b428K9KC8LxpFKEYafrJ68PJ5JM4Xnreb4d096R/oQlicLZJnHQl/BSDpayIl6K9sb0tgPM/MPtBwmxDfsdOj3AF/xVs080zCZ5tknkm5z7kK6GtvKgjCaMne3siYnawIhBtTjrOYCUtJnVLb/zZXb5+CmP8iZF7w1UaE1k6LTugH+v5YwvaBPQg7e+KySjV6t/tAE0w0acjBFz27+RyvI6wx8ynr6KdvECUQARC5h/2dcPlXTciDBIizriPwgAMC7sxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQg6FgP5rmLF1eW1DH08Ixkg1QKuwxQFQckdrmb5PK4=;
 b=PvLIrafP2pWqTkdgvnTX86fjOc/RrCPXsXwAkKFwvh4zwRi6/hmOG1BOnNawXTcsFRyUY2h32VnEI7yWZKrJyJgNvFuYvnHywc8luo9/RqlyeqtS1v7XvYWjlelc7a2glVQG+NKegyPpoE9z7amNs65T5/zC3EOJVPHX0ysFPL5umuTuJVgVLHJGvUrW+GX6Bnn9Dbk346uSwSavlEkrA55Lt5AsaDF8fCW3ny5AqmCVJA3WiUGUb4qzt3p4HhuzPJycWSpne+dA1PWaTyW/51wDGfFc0U+xkYgFuUuOwPpt3UvdPfg576ZZJg+IS/UkFsNh+25DKCBJjClyqbXgzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQg6FgP5rmLF1eW1DH08Ixkg1QKuwxQFQckdrmb5PK4=;
 b=v4ntKpC0T/FTLVQgOYef691kNJkkbwLQ8VVIWsrfmaMO5B0eaUHbUQXgOv85g3p5IALla0khf9YlKn8BKEtUtiJU9XxMX29n3FY0Pcvh3Q+/GnI1kYfF0B8xgfNef4RM5OnegdXiSW1+SmOF7xF4wsjCcHtwkQS7nDenLz+65b4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7266.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:225::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 16:20:50 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 16:20:50 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 10 Jul 2026 17:20:34 +0100
Subject: [PATCH 4/7] rust: pin-init: internal: stop using `expect` in macro
 expansion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-pin-init-sync-v1-4-8fa16cde87ae@garyguo.net>
References: <20260710-pin-init-sync-v1-0-8fa16cde87ae@garyguo.net>
In-Reply-To: <20260710-pin-init-sync-v1-0-8fa16cde87ae@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783700449; l=2845;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=vJ1gXivR6TMhsUBW4ZtCx1AQyz9Q1HI69U7/CAp3rzA=;
 b=Lz6ll0FsQkfWVcqFyXPV1K4KyMcBQnzfymuIW+ALhEPfz+HLnASH60wWtq8sSrgbK3SCIYhHG
 8Aj86xLWakDBA9L5ZbLsaSgMYhgv+fmZlxjCIFeLDQi/OFKADizVA2s
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: e282684c-ffe7-471e-eb63-08dede9f354b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|23010399003|366016|5023799004|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1Y5MU69IjwdNJxNFW1R6KMhMiFTudFL13FOFQRGFdIWEOP0huY0hCQs8LdxfCPzxoFTV+RndONGc1bRYBszdwjSMkYCVa//r+/EbMXCPwdWyjS45hPwjUkcjbFxD7FJ8UEGFJ8Hj2DjXgREnxXbggOhDsQPEiZ4CajorJrriWN/iHkqWl3pfyEBSvUv7G1QpNteiEOnXEAxpu/CTy/kBsBsCyPCD6DKsL48IkRWKMum4p0Ftj1xyUMZcBloIgqVbER+g3HcsHmt97EtDAgVD2wXprZLEMVzR4NQswLGQyhV+xc2Xphn9HA87hKqu5io4pRAjhCk4q7WNN0S7KprghHa+HcGaJF4cJHXektziDMgQyvOvHCdSse5/qBCpOZ7HMgQu1G5Gp2wPz6J3n6zk7XQYv/ipHtJl6bD/e3w65pG3AiTmVtnwCEcBgzg/hh5+sr5wGdAkbgTBqD1+kQZU6/AJrECi+sPB63eT+y8hMag1zeijEzk7sNtQfMZbbcRhKkXRoc3Nb/hE0wKXMlHxcgDczDeQJ6fqsCcim5bJqwMcrgSW9AVPqQ4tHeVpqLt7tt2Nt3TfJcogC2w967PPP0GJ7/DqaypHKIjHjA6juHGOe0ps/NYsImtOU5qaARBgbNiZiyy1hWDwIbgg6PkS/Y/nW6RQrvxFlRD5JW2vEUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(23010399003)(366016)(5023799004)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3lFVFZFUmVYaFAzYng1Wkt5UTdkZDl0aWx4VHlGTUVmZTRTMGplRzRON0Yr?=
 =?utf-8?B?MFNHQVFEYjY2SUE3T1hsZ1QyTnpBQkhDTng1NTBnQnBIYzdoZGM2Zk1wY1l5?=
 =?utf-8?B?dnFqY0tGNngwelB5Y1J4Y1VZekhvaDJrMXE1WXoxNGpNaGVncEFFdS9KVVNC?=
 =?utf-8?B?NHhzYWlXVTY3SXZ1d0hqWlFRWitjVnN0MlR1eVNhWmV0bVNSdFNIbXhSUXVS?=
 =?utf-8?B?UWNPQTN0TnB6V0I1QWh5RUV6UDlsR214aGEwN2JweitRdmRXZXRMR2FPZllW?=
 =?utf-8?B?QTNmK0ExQmlxaW9mQWhxeGJ0WThSMmR4QXhNdkVRQWJBQzM0dXBpYmQzOTZp?=
 =?utf-8?B?NXhUNUVkMVlabUpRVUVNMFFjYXlLUXl2cGR5eUhlcHVkWENGVi8yZStCcVNQ?=
 =?utf-8?B?Zy9ldzBGT0JPNHkzY1FDRjhrQm04T3RzL3R2b3pxbXluK2EzZExaOVF1STRJ?=
 =?utf-8?B?bmxhdHVMVVlVazNiVHRmd1UxcTZzaDBPWGVwbUp0a3RLRm5uamlhT2tVdmkz?=
 =?utf-8?B?dHo2d01COG9PazlHZk54UlR1dG9JU0hzREFCM00vSWFjUE9oditHbGFBYk5U?=
 =?utf-8?B?Tk94MCtuNHFNb2w0ODFJYWdIR0FZelZkTHMwS0thMkYrNzZzZEFQMENCYXlh?=
 =?utf-8?B?Zm5vTDU2WWlOU2VKbzJDVUZSSVp0eklNLzhqaHBINzBzam1ublo0VFVBb1ZQ?=
 =?utf-8?B?WWdvV3IrcTA0OFFYc2ZZRzZMQ2tZdkN6WVNHN3puTkFOb2ppejVrNTI1NFp1?=
 =?utf-8?B?WHlHdGpBRHZqOWxLc3h4MFI0Z3VsbWgzbGs3bmd1d0paV0pVczI1NjdRZjRr?=
 =?utf-8?B?UmV1dm1hVUU1LzRJSllmeDRVQWtmMkN4cVR3a1dMNXRPNDMrZjRYS3NZNElX?=
 =?utf-8?B?TDJxbzNveGpSSHNHVjFEOHFwMjVaMDd5NFU0OGw3bW83WllwZFN2djFVNklv?=
 =?utf-8?B?THFpWGRUbGZSL1B0QlV3VFppVTAvVlVRWDdadmFKei9Ia2thdEFhY3NLclZo?=
 =?utf-8?B?MVpXVkZvTmU4YWRnazY2V21HYkZDUHhtck9mNmcvajFYMDBXdC8wUGg1VnNY?=
 =?utf-8?B?S3J3LzVPeGkrTnlsQjNaMXkxRXJ4WXlLc3lLbUV4MkFIWFVHdjk2OHU3SHZK?=
 =?utf-8?B?RUFKVko1OFhoQXZmaUpyR09VMHNiY2hENXRHcVBRQ2g0Mm93QlRtY2ZKaG9B?=
 =?utf-8?B?OHJUaHZ4L0U5cWhzSmxTc1BCdngxcW9NaGxoSDNPZ3pBVTBZVUFjUXdyYWVT?=
 =?utf-8?B?bW5pdGFXc0FjbG56bG5YWE9Ub3kxcnRuR3orNUdnVXN2bUFWRmY0c1AvL1BY?=
 =?utf-8?B?V2RxU2lyVXhZTjBYbDVRN3Q1Tk10amVYVXVocGN5aUlQTHdvRm1TT3czd0c2?=
 =?utf-8?B?aGNwNTJFZ1BiMjJuUjAxc3VlUGxUdGYybUVua2ZLbFRRck1BNVMrcXpsaWhB?=
 =?utf-8?B?bEhrZERVa3NZRStwUk80TUp4YkcrN21MUUtwc2krOHRUd05DRFhDYU5Jc1d0?=
 =?utf-8?B?MmtIV2VzajZyZkliOFBDSHdzdGtYY0g2R1ByWmxrc1pyc2IzRnFiWCtlRC8w?=
 =?utf-8?B?OGMxT2o0MkwzSE9kUWpjZ2xWR01aVGxRRDc4MDNkREtlY1ZyUU1ZR24rVnVB?=
 =?utf-8?B?R2MrZk5yRGMyejB1ZWlxcXhBeWF3KzdVR2tUNkZUR1YwUjhTVm12R3hGVXM1?=
 =?utf-8?B?UzE5K28vTnlsbFEvZUJZdzZ3NUtPY29MdEN2V2xEK1lUQXd0VFRiMlpFei92?=
 =?utf-8?B?M3o2WnBQT296TWYya2F1dUFkUXpZcFYwUDZ0R3laWldFNlYxNVI0UmpZcmI4?=
 =?utf-8?B?b1RYTFVEZ1JERG1UZ2hBbzBPbjV3Y2pCTFJMVHd3VGpFSHhJVURMbE1BYUlN?=
 =?utf-8?B?Mk4yVVdpeDdhMzQ2TU9KMmV1MzNDQ2NHSXdwTWk1R0tkNTJSeXJqR2tBMVdV?=
 =?utf-8?B?L3o3Y0U5VkU0MDJXLzFWRS9sci9pVXBKU005aSs2aVR6c3o2R2E2U042V3N6?=
 =?utf-8?B?dWxXOGlJcE9paFFaSE5SRnhVTWluR2dJV2ExemllQzRzRmM0YjFvWmdlcW1o?=
 =?utf-8?B?T3psdXk3Vzd1aTFKRHFpYWtZdUJDZG1MdjNIV0ZseUNSTVdzUGNZMW9CN21m?=
 =?utf-8?B?NG43TXBZSDVXdFYrK2wzTDhjOE5ZWmtPQTY3L1NuR3RiNGJXckNLNnBlTW5V?=
 =?utf-8?B?VU14NWdkZWJzc3BPdWlGRnM1ZG1abVFUYkNZZ1FaUDlYQTRtcnZZWjBwSTZs?=
 =?utf-8?B?aE9vUDR1SVpUenNRdERsdTk1ai9ReWVsUDlyeW5EUE9QeHIzU3hWTzBmY0Js?=
 =?utf-8?B?aEw3d3NaYU1OU0h0V1pLcjZlR25yTTFQdy8wYVBZdjlud0Z6Y2xydz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e282684c-ffe7-471e-eb63-08dede9f354b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:20:50.8990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0HROEJdrGcRqNR7G2V5QwledDPui87Hk0EkdQggN3x34Tty29cj7XaQvjT8VPH+7aCrV4qI3pwWITAk4tfZ0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7266

Most warnings are suppressed from external macro expansions by default, and
`unfulfilled_lint_expectations` is one of them. All of our `expect`s inside
macros therefore do nothing, and actually mislead people to the lints would
be actually emitted without them.

All `#[expect]`s on lints that do not fire inside external macros (and
without spans from users) are removed, while the rest is coverted to
`#[allow]`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs     | 2 +-
 rust/pin-init/internal/src/pin_data.rs | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 28d30805d06b..c1197a994c82 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -334,7 +334,7 @@ fn make_field_check(
         }),
     };
     quote! {
-        #[allow(unreachable_code, clippy::diverging_sub_expression)]
+        #[allow(unreachable_code)]
         // We use unreachable code to perform field checks. They're still checked by the compiler.
         // SAFETY: this code is never executed.
         let _ = || unsafe {
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 263f67300727..4438107682e0 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -245,7 +245,6 @@ fn drop(&mut self) {
             // `Drop`. Additionally we will implement this trait for the struct leading to a conflict,
             // if it also implements `Drop`
             trait MustNotImplDrop {}
-            #[expect(drop_bounds)]
             impl<T: ::core::ops::Drop + ?::core::marker::Sized> MustNotImplDrop for T {}
             impl #impl_generics MustNotImplDrop for #ident #ty_generics
                 #whr
@@ -253,7 +252,6 @@ impl #impl_generics MustNotImplDrop for #ident #ty_generics
             // We also take care to prevent users from writing a useless `PinnedDrop` implementation.
             // They might implement `PinnedDrop` correctly for the struct, but forget to give
             // `PinnedDrop` as the parameter to `#[pin_data]`.
-            #[expect(non_camel_case_types)]
             trait UselessPinnedDropImpl_you_need_to_specify_PinnedDrop {}
             impl<T: ::pin_init::PinnedDrop + ?::core::marker::Sized>
                 UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for T {}
@@ -432,7 +430,6 @@ impl #impl_generics ::core::marker::Copy for __ThePinData #ty_generics
         {}
 
         #[allow(dead_code)] // Some functions might never be used and private.
-        #[expect(clippy::missing_safety_doc)]
         impl #impl_generics __ThePinData #ty_generics
             #whr
         {

-- 
2.54.0

