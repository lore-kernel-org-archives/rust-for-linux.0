Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022083.outbound.protection.outlook.com [52.101.101.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744DF2BEC52;
	Mon, 28 Sep 2026 17:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616762; cv=fail; b=Tw83izHZmZVZcUOfQbv8gGHIFEPe0VGJ10GyfBrQEuDH4mlwqD2oupvMQcKj0CSouUbf0tAf4Fk2MJilnStdtd2evfuFFbJveXZhuWXvS2oLD2fyRc58jlpDK8t5uR0pg7q2jm9fa3U4Ort+YYHoP68kQ7+ojxpftdngqq3uk0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616762; c=relaxed/simple;
	bh=ApeR7OQoKw1Q+3Xu4XZ+Azn+EoFoZ8FYYR4peLah5iE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cYz8bvmcvbP9fHqdk5U5zl1m2pIQydczwKVpQy63fUhoQEXvpxqte2OuTvQ3IDC8R8FpWG63ODBdyn+9wcCf2stSoCHvjg5fOF3al7v7Iae5FT4x5QwI8fo6qeD7JAPW4v/Zcq3EGNt3PA0+P6z5t+8HkztH0vz+xVYQsrC2Miw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gGg2QDhK; arc=fail smtp.client-ip=52.101.101.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gGg2QDhK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4s/fQeeEDxWYs6OodmWr6rLYK2LWQY+1jE4rh3aMkQwpro8aEW/wwKLvkV8J1MY7BDNUkfbhPs601O4y2nnSM/E9rVBL2931vjfFKMpXGKqv25SL5IpYG7WfneqwrNkv2PrGvLg5PSSxbHdI5SQPB9psxHMZw54pnbMBlVZfMKUDQG0d+vXQDw09DlSykSij2yqq1J4GQwqTZ5WybD3SSto/YzynbNy9MLnMnPPNU/BOgbN2Nk4UF+KcYx+jZZyrG58dRU2CiwHyzfXrzPTBKowYXkDyQYa9BGoDYSKC4JLYPbt+/w0e2ahEOSEya/IDBhfu8CfeG2bFzAwP9aodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svu5yWq+wID8jpupOxjxu0zPydm8ZoYRwT83CLR5COQ=;
 b=bdLFSl2tDm7KQ4oUocvf2oYrJT5VwMhd2duQham0gL9JSxulCe45qp07vASu86vKut7+8JnaoodjuE8S+awqjMGIkIx3q8kZqMBhabhEbe8riIuaRnQMzAoBRZJGFPPDVkXJLiuSgk3aALrp6vRTZpaY4Y2QAvI3HzEr9K/hOMIE+UJAP9Ca96ZnM0gS+/5zkIjB1dRs65+RHS4eFDcJQE/Sq4LTQ63gP/pieh7z02HvZotNO7VA5KxloPMcomgT/RlC8s6rDAr637Rm1h6Vp2Ka0P6+b0JhIHMrm6lTYKjIvx39m/x6GJ4JQQFb9MYNwdvQ34qCX5m3m61RhK+ghA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svu5yWq+wID8jpupOxjxu0zPydm8ZoYRwT83CLR5COQ=;
 b=gGg2QDhKzBMypm8mEpqsWbmzFbc/poZpfMY1CvQ6EMXK67mXFc4PgiE8+ma0wrCgVupBtOYVM3Rwaq3WO8DN+EWComxVN2uTvFBC7JlEGHUFPah6bnVDxu8IyaHLzuf2y8na71rvGtCm1ilvc4QB6jadWSBlgrhVGIqTSAD26kk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6824.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:348::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 17:32:29 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 17:32:29 +0000
From: Gary Guo <gary@garyguo.net>
Date: Mon, 28 Sep 2026 18:32:20 +0100
Subject: [PATCH 2/3] rust: pin-init: internal: init: improve diagnostics
 from field checks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-dev-pin-init-sync-v1-2-e591c8e9cf0e@garyguo.net>
References: <20260928-dev-pin-init-sync-v1-0-e591c8e9cf0e@garyguo.net>
In-Reply-To: <20260928-dev-pin-init-sync-v1-0-e591c8e9cf0e@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790616744; l=5129;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=ApeR7OQoKw1Q+3Xu4XZ+Azn+EoFoZ8FYYR4peLah5iE=;
 b=NwPpC6lywQQ54tEnMoF+7qIC4S4ZjL/929H6MFDAUWOPD0xfzXMwPI7YWIKYsmaVAvO/8MQko
 glE4B4nnPLDDljGyF0D2LQMeLsOTP5aIsackUNSD+Ks5h/KyBpehwP9
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0110.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc122c2-86fb-4abe-ab1a-08df1d86766a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|23010399003|376014|7416014|921020|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UWED2zOs+SJjh4KIbReFfM7YnlMlaefxvcab8N9wCsjC2oRCWVlYI9efYy3z6E/Q4BR6Q4VEhR0W6pSdbMwVormPSsvtPoc5fo3/ai//E5QW4OleVofKUGSRMyEn8u3X5m9KieBZBbf9R1T9ODB3FRP2BC0HLeaRCBbMOlj7HnbuSpbas+GTcyEr6Hfol1foTwanO0A4b57Yp7+SRBYUw0A6qPKMSMAZXFN2g67wEdrFO5UOi/sbn/OB6OSlnnAEOhb/6fTcSSvDMrWmJxKUHz9qNytS0jauy7DDASs4cUb2vmLCONpOFCIqfjyk/HjLOi8OtUOYjuE3IGbClON8VinWdhbvu6nOVXSAM6IOHDIf8cmwhs5Lck4oMDm25NaMXWvxOYWSUBLrw3AtL1ZltcXTHtfjLezJ0hleEY93/KgGQYFWYebuLTmCVdIwdeRSgxfongcpDu9p6iE84cKm4WuG7Z3w/g3YJxKPTF5Kxgsn+SB5Zm/aXNavBq/kAOgB7f8vJHtW3ohIAREfT/h5YyMV4gDiBX2d7UknRRXQmAWiHDyzjJqX4rLmZHXyWBCGd6G5no3LcX+OzyuZLpoplyV8Clxthe9YhI+Fs+ui6UAdAdhqp08/poWioT12FgNb0hVKhQlD0rpcpGBN9OatqjWCM1f1gqfO8yFpAsf9w2wz5CZfPqppy+CzQYVKIo9sSG5mlP5PCnPn7vTg+iw7vg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(23010399003)(376014)(7416014)(921020)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1NRT0pEeHd5N2lnSjRNQ3YxQ2kxRnZBMUE0cXJ3RjVYNWp0TFJnSGtGeUlD?=
 =?utf-8?B?SVkvRHlvVFdXdnFyS3JsUWl1Y1M0QnpsdFlCZy9qeDBDaitsQ3I5YUdSWklF?=
 =?utf-8?B?WjQ0Q3djVDF1WFlSTzdKNGhYaVpTOUJFSVlaWmVZUWdodTNOVXY3VkVoWnlJ?=
 =?utf-8?B?bmJtWFI3bVFYdHpKQmhQRFdMOUpCalBkOEtBSEhBWVF0ckxPU3FTcGlVY1M3?=
 =?utf-8?B?T3VwMDQ2MjFxQ2N0TXlyWkk3c2hzaXpiaGlpRWdwdFBiYS9pU0xZZFRJeVkr?=
 =?utf-8?B?MjRzOWxRdDgwV29lczN4a0hQbVZBd05vbkx2bDg3ZGltalQ0NE9IMEZ2cGdp?=
 =?utf-8?B?VExJcVExaXBBS2hoODlteHBVSDRkam1OSElBakVaajd3L3dzTytNa2lQbG55?=
 =?utf-8?B?aFpXM1hudk5JcG9TQStJZ2Q3YktDOUY5SXJaQnpmNnp6eXhnNFZDYlA5dUxo?=
 =?utf-8?B?a2NpUnlOMW9hbXhSVk84OExzTWo1clhSY3p4OUxoYzhSN1kzTmxVa3dpRzhv?=
 =?utf-8?B?c3dJVUl3bWc3TVg5eG40MjBiR0oxTUI5VkwyMi9kQWxSUXNPL2VoM05CTlRV?=
 =?utf-8?B?ZlpoeDdOY1MyOXEwc1ZLRFE3RmhaZ240aU9ONStPZnRyRFBNMEZONVQyS1Jr?=
 =?utf-8?B?cXFYL3B1QnFUMG5taFF6S1l3Rm5oazR6emcxZGNHMUxHT0FPVWJiOHlNeGk1?=
 =?utf-8?B?U1U5ajJxNndqL0VUV25mRy8wWEFEWWh3MkFBL3NkK2t6OFdXTjM4T2JVbnMx?=
 =?utf-8?B?Mmdubm8zc1ZYT2I4U0FMUmswMEFGVDM3S0ZYWXBIRVpsdUlmYURVUzJuSVg2?=
 =?utf-8?B?VXFDRmZzVER6UDNGZTlWcmZQVGtHMWlrWWxYRGVJdThubzJ2UVpBdVZ2djRt?=
 =?utf-8?B?N0FodlhycWR5TkcrUnNjKzFJSTBtcEtFU0F0dC9Ia1NRWVQ2ZjcyaUJVM3dD?=
 =?utf-8?B?UmJQTWxyVEhDVzZVS1ZPZGFwQVgrNFRrRHNqelZSZTdhL1NZckw2aE0vQk5h?=
 =?utf-8?B?RGkzMGkvbFJIUi9YUHB6S1U5a01IeEZ1U3Yyanowb25HOThNeFZONFptYU1v?=
 =?utf-8?B?QXRJOG9KMDVaRDZPMHZLMXMxR00vTE5MalREeC9kVVRwSytIbnlJVGxFcEZv?=
 =?utf-8?B?OVJyd0lPUWZzUnhjT0t1UVBSRllGamhnT0xJcFlvZ3NTR1V1RmFRSDR5a083?=
 =?utf-8?B?VHlzcTkreGlkNkpHcnJrbG9xeXZVVm1JZnBNVU5iRVNHVC8wMVkxSjdEMWZj?=
 =?utf-8?B?cjFLTmtPMlNQVUlucjA0cm8raFYxck5mZmNLSGd0L0JFeWIvUGxrRC82UEJT?=
 =?utf-8?B?MWxrTE9oclB6MFpLNVhNamdvTGtSWE8wVGNaYjlLOHJ0Z3JvbVp5OTI1MVdo?=
 =?utf-8?B?S0NUOVVDUm12c1Z3MjZCaWNFaThneDdzaHhWQmgxY3RUd2krOXZBVEN1c280?=
 =?utf-8?B?RlpHNXd1cEIwMlBiV2JzY016aVMvcExTa21OcVdqaHNiUWd6aDd1U1hwVDdh?=
 =?utf-8?B?NHdjRVg2N09DQmxsbUNKN3FrTlpCQ0g3bmtMNVpkR3FiMmFEeXEwRG5UdHc4?=
 =?utf-8?B?N3g5Nk1zUTdCcUc1OXJWazBuZjJwS0lUTHJXOFFFdkNHS1dMOEJJOCtvTHlG?=
 =?utf-8?B?U3BXWG1qcDl1T01BZEw5MzQ4OFVmazRJRE5TWWVkSnlISGpIL0JnZklJN0tB?=
 =?utf-8?B?NHNVbmxYOUI4WE1wbXRZT25YcWo1dXlienlnL29icjFBSVdLMUxWWWp5WmVC?=
 =?utf-8?B?VC9ITnNrV1BXZDNVdFdZNWRCa3E5WklGUDd3cERoRWlzdUlOeTlZQnFTK21a?=
 =?utf-8?B?M2ZWSmJTdUpHYXFGZnFnNXRvaFp2TXJ2RWo4UzBudWo5Y080OWZpTEpaM0Zv?=
 =?utf-8?B?Wk1rVVp2RVk5ZkQ2SFNvVkJHVUpZcVJBdTFCTmRlNW9RVlJXa2hQOXFOQ2ZK?=
 =?utf-8?B?dU12bHhiQ3h2enNlbDlEcjVUZkNwTTFVSlpaUWxFWjkycUUzTXZ3ckpheDdE?=
 =?utf-8?B?dEJJNnEyZFp2ZEFnUHgrbTdzc2s1UW4xcVRHYWo1TjRobWFWdjBTVXRmNFk0?=
 =?utf-8?B?V1NUbmJ3K1JxZytsdHpxVXlNdzhtM1FxOHlOcUN6bHg3cFZlTE1ZMFZaNU1C?=
 =?utf-8?B?QnRPeTF4cS9kbkJPZWt2S21vMSs3UldLSFk1OWVVV2dvek1zeVZoNVdmL2lh?=
 =?utf-8?B?ZkpzdmE3ek9PUWtXKzN2aFZDOXdPYWNmS0k2QnFES2Y0cjFFb3FEUVA4Uis4?=
 =?utf-8?B?SnFIVVZXNDNKUDBzZVBqSXQ2MkNyenhib2ZNU2t2Y3Vsa0NKd0VGZWxqZnpF?=
 =?utf-8?B?QVpFUG9BQWxRaFQ3OXdSN3NwOUNmbFlyWEVXOWpsQzBlc3luQjhhZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc122c2-86fb-4abe-ab1a-08df1d86766a
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:32:26.0033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oD872utJvu3oxhMClDA6HnP4u/UyxPBCW8T8B+LNgGOy50i8ursvdpr9+cftHSwH0tptxl4aliQab5q5+GcG+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6824

Use span of the field name for generated alignment and field duplication
checks. This avoids pointing diagnostics to the full macro invocation, but
just the part of it going wrong.

Before the change:

    error[E0062]: field `0` specified more than once
     --> tests/ui/compile-fail/init/tuple_duplicate_field.rs:7:37
      |
    7 |     let _ = pin_init!(Tuple { 0: 1, 0: 2, 1: 3 });
      |             ------------------------^------------
      |             |                       |
      |             |                       used more than once
      |             first use of `0`

After the change:

    error[E0062]: field `0` specified more than once
     --> tests/ui/compile-fail/init/tuple_duplicate_field.rs:7:37
      |
    7 |     let _ = pin_init!(Tuple { 0: 1, 0: 2, 1: 3 });
      |                               -     ^ used more than once
      |                               |
      |                               first use of `0`

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 65 ++++++++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 4e77c7af86f9..f6f3e2f8cda6 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -478,42 +478,61 @@ fn make_field_check(
     init_kind: InitKind,
     path: &Path,
 ) -> TokenStream {
-    let field_attrs: Vec<_> = fields
+    let align_checks: TokenStream = fields
         .iter()
-        .filter_map(|f| f.kind.member().map(|_| &f.attrs))
+        .filter_map(|f| {
+            let member = f.kind.member()?;
+            let span = member.span().resolved_at(Span::mixed_site());
+            let attrs = &f.attrs;
+
+            Some(quote_spanned! {span =>
+                // Create references to ensure that the initialized field is properly aligned.
+                // Unaligned fields will cause the compiler to emit E0793. We do not support
+                // unaligned fields since `Init::__init` requires an aligned pointer; the call to
+                // `ptr::write` for value-initialization case has the same requirement.
+                #(#attrs)*
+                let _ = &(*slot).#member;
+            })
+        })
+        .collect();
+
+    let fake_field_init: TokenStream = fields
+        .iter()
+        .filter_map(|f| {
+            let member = f.kind.member()?;
+            let span = member.span().resolved_at(Span::mixed_site());
+            let attrs = &f.attrs;
+
+            Some(quote_spanned! {span =>
+                #(#attrs)*
+                #member: loop {},
+            })
+        })
         .collect();
-    let field_name: Vec<_> = fields.iter().filter_map(|f| f.kind.member()).collect();
     let zeroing_trailer = match init_kind {
         InitKind::Normal => None,
         InitKind::Zeroing => Some(quote! {
             ..::core::mem::zeroed()
         }),
     };
+    let field_dup_checks = quote_spanned! { Span::mixed_site() =>
+        // If the zeroing trailer is not present, this checks that all fields have been
+        // mentioned exactly once. If the zeroing trailer is present, all missing fields will be
+        // zeroed, so this checks that all fields have been mentioned at most once. The use of
+        // struct initializer will still generate very natural error messages for any misuse.
+        ::core::ptr::write(slot, #path {
+            #fake_field_init
+            #zeroing_trailer
+        })
+    };
+
     quote_spanned! { Span::mixed_site() =>
         #[allow(unreachable_code)]
         // We use unreachable code to perform field checks. They're still checked by the compiler.
         // SAFETY: this code is never executed.
         let _ = || unsafe {
-            // Create references to ensure that the initialized field is properly aligned.
-            // Unaligned fields will cause the compiler to emit E0793. We do not support
-            // unaligned fields since `Init::__init` requires an aligned pointer; the call to
-            // `ptr::write` for value-initialization case has the same requirement.
-            #(
-                #(#field_attrs)*
-                let _ = &(*slot).#field_name;
-            )*
-
-            // If the zeroing trailer is not present, this checks that all fields have been
-            // mentioned exactly once. If the zeroing trailer is present, all missing fields will be
-            // zeroed, so this checks that all fields have been mentioned at most once. The use of
-            // struct initializer will still generate very natural error messages for any misuse.
-            ::core::ptr::write(slot, #path {
-                #(
-                    #(#field_attrs)*
-                    #field_name: loop {},
-                )*
-                #zeroing_trailer
-            })
+            #align_checks
+            #field_dup_checks
         };
     }
 }

-- 
2.54.0

