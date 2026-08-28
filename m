Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022142.outbound.protection.outlook.com [52.101.96.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879EA449B1B;
	Fri, 28 Aug 2026 12:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918672; cv=fail; b=dU2V2mfALxOgYOuvFAvaR3pP/08PBPgYGhsELTgUfn+VCBX6b956P12o3ngkJEw3f38mG67zS8gK9gXbOVb0xuw9RYay0vxz2LA73K5ytQ4SZHoceWKfgwheqCZ18Bddj9B4tnGvMVn64Q1Dn0Xezap31wFpwElZcb/wMOdw4bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918672; c=relaxed/simple;
	bh=yZGogexCjShD7hqd6zqoxvKB5JMTmxvmNoRCzqD68X8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VUTZuYTybQOV5Nw9ZvOF1+5iM1iqHNfAgXNlU3e/7eIj6hpvLg7FhyQ5mlzO7lSb8iHAdvUAja4tgJJ2Fk2/qOvrAQ+h5x5BD2VX6EhH0u97sibqrsdhQW4rJorEKJvY7J6vhhfF9UeNCmnFgWg8ZzL0YKthaS96b73uiRT46C0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=RZVmuGzj; arc=fail smtp.client-ip=52.101.96.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="RZVmuGzj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVdbTDlf1t96i5zqNGH2ulNPgFkSDgJ//XFKq9oRq8C5CSLAH0NOl6K0sDAmXpCqCTqjybWvgJlg8rJ4fHfR0ZyuJjogcKzo/aWD3y45jpBtveKMdWIEsoLgnRusc795cpGMnYf+67srx5n0qW7mlzmjkDwrebDADrmB+7FVozpwctYlvJ9T8QKblhgLGoKyT/lPbPtBgE5GUd/0fKLTKbMh0ddbozGf3yimuyFpbg0/ZUE/KRWV80GFpch0/uz0N47fTARtAcZ5izAAcyPgi6asv/nxCpcp2/1Ok5vwAiJQc0a2XzkxiSQzk2uBNXj3gDgrWAybImv/NWz2UA5L9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVxXxWCbVQz5zK60lCfDt2EncRxJW4BkFQATHPNwfh8=;
 b=CxoSvktPvG6WNRjACIB/32zB0a9Yq0k4eqiH0FaDpWXA/OGZO3jh172ziQHX2dP5/usqjzb99J2KJi33DtF7sxfs+lsL2ToOIDUho3aBnbKH0yVn3bCkd2wh2U9vxh6tW5W8dcMrjr2v2l75CI8BZKVszsxA4jom5FOOfXJisrXYD8MBkxwKAJbjgBlcagR7kWICRXEFOTHX7NnmW06ZO6wD3A8RwtcvcGCb/QrewpvA38/N4afmqFFtlcrtIFPQ4FgKDzWuBVTCWAAhxPR+58FpbFdQ/x9FahtXmbWygO/rOkn6dtaSBUtJTtlnCEE963/17Uci6GjKL+hy7YXbOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVxXxWCbVQz5zK60lCfDt2EncRxJW4BkFQATHPNwfh8=;
 b=RZVmuGzjgEIwvJZPaF6T2MGIPCiXwCCMtV/J675KoZmzkxXVSVl7zKuRzZTi4WwVFozy85h/HtN5T3b+awCTzGndfp2gM8bAsyOlhq88RVYJbGI9Hd5sQZuV+8J4iE0Y89mZFZin1Na5ngO7iLtsWietaSobR5a0XbJ2syt1UF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by CWLP265MB1762.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:5d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 12:04:08 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 12:04:08 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 28 Aug 2026 13:03:55 +0100
Subject: [PATCH 1/2] rust: build_assert: add utility to require const eval
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-cv-v1-1-694a695ff17f@garyguo.net>
References: <20260828-cv-v1-0-694a695ff17f@garyguo.net>
In-Reply-To: <20260828-cv-v1-0-694a695ff17f@garyguo.net>
To: Alexandre Courbot <acourbot@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787918647; l=4991;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=yZGogexCjShD7hqd6zqoxvKB5JMTmxvmNoRCzqD68X8=;
 b=vBK8F233wweIf7q55NDnNFSRRiFm79x6ra2mUH/qT5JRVBddzbCAOJNIcCHDViut3BDodOTcJ
 Hxr13LmczO3B86tr8A5pueLbLMjkiPrgjaLmihtB8YdXETCjA8OQbMp
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO3P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::7) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|CWLP265MB1762:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db87c96-30e7-452e-7c39-08df04fc76f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10070799003|10067099003|5023799004|56012099006|6133799003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	WtHlHbIo9F/xtXVkja9FEYAjvZxhDEvMa3GJ8QF6PRjVCA4LF6q7fN74Jij89F9EaNkqcrmEKbvE1E/x8KSHixMYZUhWi6DxbSMxVpc71Jl1JfDOQsdjT0Iy3qpmYurt9VEqJDJGlRwtNemMzyb3CqZ8MLZMBGfxC06hchuh0vJ51H/tAvQQ1QvHg73MC72Lw7YYk0iC9D76e/oWVsgKWNLb1ZerxweGRRZ1B/9WezZvAQiZTUC+6l2w098MjS5gX8OxJFejPZ61U49TuGhkV7xzC8yP1YFeeP3sJzBEAB8pUzqSX3m3A4kP2/VCAe1HJy4uJfgwtSuxEkBjFI1qrK53FFrVuj2uNiR4gUSV6oiYG3N1DRzX+NbKofCxfZSfII01RlX0y22r79DReAqlS0ry5db849+2icClUcM0ZM+c2zh7Va8+hUoTRN0ZgRwxO4DXCj32Zk2mC6+1akrkRkqp4LkfOdNGeIXM+kxqift3KW83mJzWcxqV0HTKqtYIxlmzob3sdWdSzaCkXyE4Ng/hs5ydW+qWdk/XhE5vDoTUJteKHUYc5ak0pQw8rl6eXnY60JhRuguo+dhGadD7V0cL4LZWredKdA9unv/8aCqW472RZLvfAeWABam0/Dwbl8fIFu6Jqma4Z9DIVQjpMAGLCxD7JVKW+r/MEsB6rtersoaLROqLwdAjNH5JKsVM1+FE63ScOiTD3x5oMFpxwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10070799003)(10067099003)(5023799004)(56012099006)(6133799003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDhNZzVEQjlxYmE5NjNhby9vZzQzdjJqWDM5UDluSEh3SFlsU2hpTUwyQktQ?=
 =?utf-8?B?MkRtTnUvMXFSUlBmbUljZWpoNWc4c3NLLzY5MFViRU1aWEpaeGMwS0Q1QktS?=
 =?utf-8?B?VWFJSkJVMUVxRDZuQU9PUXFtVWNKdEIwZXo2T0Q1ZXM5VEttNGRveFdzOEdp?=
 =?utf-8?B?am1FeHJzNzdTZVJQZ3VVZlpBTFNvRXQ5bmV1bk5tTWkwTDRqaUJxSVhVdXFz?=
 =?utf-8?B?V1ZJV2lsTjc0UjNhY2lVR0VJM3luYmp0WThSanNTNTdiK0RHUC8yRis3RDU4?=
 =?utf-8?B?czZwaUsyakRBYzF1SFZrUEY2QktmMmFjZjJvN0t0Y0NybHlOR0g3a2xzdW9L?=
 =?utf-8?B?cnY2dGlxQzk0dXFvRFNJM1NzaThqemlza29WZ3pxRFJqNEpMa0lkYnkvNnFi?=
 =?utf-8?B?NWJQQldWTUJ1WTh2eUpjUXpJNXRLL3l0aDA0dlhLUit1L1BqTVVkTkR0MVIw?=
 =?utf-8?B?ajRob3RXMy92bW9lTlNpQ3JOUW9PaGZDMHgvOTRHOE11RVk2RGloMGVMZkx0?=
 =?utf-8?B?ZDVWZnpjU05WV01KSVRMQ3JzRkpKWEwwbXNsYVdVRW9XaFB4YkplTGNaRDVa?=
 =?utf-8?B?WE9YUDJDK1JPajJ4MFZLRGtsSmZiRjlnbk1UTU9HT0F1SXdCVnBEYS9teDNk?=
 =?utf-8?B?SWdranUrMmR4TEFzeHVYUzl2TjY1bXNNRlNoUk9pOEFER0o0Z3lOdkpaejlu?=
 =?utf-8?B?c1dYVUhCMVlFUm1uTVdaN2E5NkhNMVpCdE01NjRQT0tOV3RlekUyaHFNR05J?=
 =?utf-8?B?MVlTNFRqNFA0aU5HbFlYK3E2bk05U3puN2s3cjI4bmtWMFFGQVZ0SXdRZjlF?=
 =?utf-8?B?V1hlUitSeWxBUzBLSmQ3eEpLbEJ1VndvVHpNQWZVWWtORU9MbVV0MXh6bm5S?=
 =?utf-8?B?aGdyZEU3TGVSWTRzRzlaODl5V3pJUWlUZ2xaVm1STmgxb2JXbkFMQ3dTYUJh?=
 =?utf-8?B?UkNrYk5KcWFUcGxSUXN5eWlhTWRSZ0tISWZtRy94bFprK1F0UFpaclBTQ2t5?=
 =?utf-8?B?UUE0MmNIRWtuZ2NwMDllMjF2cDlQOWY5dmZJUGJBbHZCUDF1cTU5bGIrQ0pi?=
 =?utf-8?B?OVpKajFtWkhCM0c1b284eEgrbFdzbXZTb24rbUFQQ0MxR2NXdytpcS8yRzNi?=
 =?utf-8?B?WnFaa3d1N2l5aGJGUnFyb1VRd0h1MEdqMFlaMlo4MkFuUC91eHFmZGFVaTZZ?=
 =?utf-8?B?b2NwYmN3U2p2aWVXQTNFaUNjZmRHQThKUnNYUUdOcXJZaXFPeVlQcEpBSlNW?=
 =?utf-8?B?UjNkTEtQQmYxUXpZR0Q0Y3A1T0RVMTRhT1RDQUtMdjA0bFI4WTlkQlVkUHN5?=
 =?utf-8?B?SWVWWTNpYmJBWlg4RFM1b08yL0RpaUx3WnhqTGJxR0pKTWNWK2pET1NRYWhJ?=
 =?utf-8?B?RnpySStHTUd4R2JaSnBmN0tLZVlWaUZnRkQyV3F4VzlwVGJ4ZjFhSzVLc1Fk?=
 =?utf-8?B?TFhQNWVyK0lING5ndU5BQ1V4cFVRR2t6TmFNOHhWRmZVdnhQeEdPZVByZmpC?=
 =?utf-8?B?UWhncVBRbW51UEVvWStJd0V1YVN4RWIrVjcweTBnUi9ORWdUODVqVkd4ZDd5?=
 =?utf-8?B?VTdoY2U1QTNLSFVGYXNUVG9WaGszQ1ZxU0c4b01VRWVRaGF3Y1NOWTNIMUFC?=
 =?utf-8?B?aFoxc05DcUdQZ3lHNlZRbmNWMVZ1VFZVc3EyK3VyOEtYczg0LzJFQVJMdW9l?=
 =?utf-8?B?Y25oT1RGVWFYMGVTRGFOUWdNNWp3RXJ0T05lcXlxdnJ1OW9NV3ZmbjhENW5o?=
 =?utf-8?B?R3MvK0VoQzNla1dsdWl3MVBEck5Vd3FIbFg3S3dNaHVTb1lmZVJ4RUpJNWlt?=
 =?utf-8?B?QXJWdkhteGR3WXRKQUVjSUE3bjgwVWJ4WHlSQUlENFp4NEpXZ211T2YvQWdE?=
 =?utf-8?B?RlNJNG5aTlh4aHBjbGM0RE0xb3VwaDBXc0VlSWhPOTFQaGV4blBqQVpPaXh1?=
 =?utf-8?B?ZGNFclJVQ3V1akdONVQzbzBWWUlxY3FMME5XUGNPNkJ1alNYUE1YZ2dkeW1u?=
 =?utf-8?B?bkJOdTJJcGhIc09qYzRJeHhwdm9OSXhDMW9RZi94bHRyNk53OXFTaUdUbTNR?=
 =?utf-8?B?aHQyTEhVc1VKMzJiSW81Y0J6b09oRWJpS0F3SGllekd3OUVrUEQwaTNNZkk3?=
 =?utf-8?B?NzVERlBGZ0ovVTdiZU1BYngvMjZWci9FcGx6bkMzQURGNndERVFBSHpCUWhM?=
 =?utf-8?B?NDNyWFY4RVF5cG5nMVB0OWhQMktRZVREUEZXUG1pTjVpUVFYa1FWQWgxVzNX?=
 =?utf-8?B?V0NmRzhqWFNCUzhwaXpJcnNQQStGQU9hWXYyRGgzQSt5dmh5TlVxQW5rWW5I?=
 =?utf-8?B?MVFiNzVhWitjM1h3VlFpNkluWEozSmxYVzliSWZ5UEx3ZVJXUVZjQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db87c96-30e7-452e-7c39-08df04fc76f7
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 12:04:08.5120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlDc6ZPuZ1zElqWYsXFBTRn51Ij+s/T38rWgpt5gLbrxX7hb2pkgeNPE0UrKaKXlFIy9N0CEed+St8yaANiVAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1762

We have a lot of helper const functions which are intended to be used
during const evaluation only and runtime calls should not be generated. Add
a macro to denote this explicitly.

Convert device_id.rs as an example.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/build_error.rs         |  7 +++++++
 rust/kernel/build_assert.rs |  9 ++++++++-
 rust/kernel/device_id.rs    |  4 ++++
 rust/macros/const_eval.rs   | 24 ++++++++++++++++++++++++
 rust/macros/lib.rs          | 21 +++++++++++++++++++++
 5 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/rust/build_error.rs b/rust/build_error.rs
index fa24eeef9929..b7ef80596f1f 100644
--- a/rust/build_error.rs
+++ b/rust/build_error.rs
@@ -29,3 +29,10 @@
 pub const fn build_error(msg: &'static str) -> ! {
     panic!("{}", msg);
 }
+
+/// Assert that the code is in const evaluation.
+///
+/// Triggers a build error if called at runtime.
+#[inline(never)]
+#[export_name = "rust_const_eval_called_at_runtime"]
+pub const fn assert_in_const_eval() {}
diff --git a/rust/kernel/build_assert.rs b/rust/kernel/build_assert.rs
index c3acb9b68a65..4cab4e1a796f 100644
--- a/rust/kernel/build_assert.rs
+++ b/rust/kernel/build_assert.rs
@@ -66,9 +66,16 @@
     build_assert_macro as build_assert,
     build_error,
     const_assert,
-    static_assert, //
+    static_assert,
+    //
 };
 
+#[doc(inline)]
+pub use build_error::assert_in_const_eval;
+
+#[doc(inline)]
+pub use macros::const_eval;
+
 #[doc(hidden)]
 pub use build_error::build_error as build_error_fn;
 
diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
index c81fca5b4986..476f44d31b79 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -10,6 +10,8 @@
     mem::MaybeUninit, //
 };
 
+use crate::build_assert::const_eval;
+
 /// Marker trait to indicate a Rust device ID type represents a corresponding C device ID type.
 ///
 /// This is meant to be implemented by buses/subsystems so that they can use [`IdTable`] to
@@ -108,6 +110,7 @@ impl<T: RawDeviceId + RawDeviceIdIndex, U: 'static, const N: usize> IdArray<T, U
     /// Creates a new instance of the array.
     ///
     /// The contents are derived from the given identifiers and context information.
+    #[const_eval]
     pub const fn new(ids: [(T, &'static U); N]) -> Self {
         let mut raw_ids = [const { MaybeUninit::<T::RawType>::uninit() }; N];
 
@@ -144,6 +147,7 @@ impl<T: RawDeviceId, const N: usize> IdArray<T, (), N> {
     ///
     /// The contents are derived from the given identifiers and context information.
     /// If the device implements [`RawDeviceIdIndex`], consider using [`IdArray::new`] instead.
+    #[const_eval]
     pub const fn new_without_index(ids: [T; N]) -> Self {
         // SAFETY: `T` is layout-wise compatible with `T::RawType`, so is the array of them.
         let raw_ids: [MaybeUninit<T::RawType>; N] = unsafe { core::mem::transmute_copy(&ids) };
diff --git a/rust/macros/const_eval.rs b/rust/macros/const_eval.rs
new file mode 100644
index 000000000000..0629f2708319
--- /dev/null
+++ b/rust/macros/const_eval.rs
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use proc_macro2::TokenStream;
+use quote::ToTokens;
+use syn::{
+    parse_quote,
+    ItemFn, //
+};
+
+pub(crate) fn const_eval(mut input: ItemFn) -> TokenStream {
+    // Prevent code generation as the function is for const evaluation only.
+    input.attrs.push(parse_quote!(
+        #[inline(always)]
+    ));
+
+    input.block.stmts.insert(
+        0,
+        parse_quote!(
+            ::kernel::build_assert::assert_in_const_eval();
+        ),
+    );
+
+    input.into_token_stream()
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 24f96feaeb34..3865619139a5 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -15,6 +15,7 @@
 #![cfg_attr(not(CONFIG_RUSTC_HAS_SPAN_FILE), feature(proc_macro_span))]
 
 mod concat_idents;
+mod const_eval;
 mod export;
 mod fmt;
 mod for_lt;
@@ -338,6 +339,26 @@ pub fn concat_idents(input: TokenStream) -> TokenStream {
     concat_idents::concat_idents(parse_macro_input!(input)).into()
 }
 
+/// Mark a function as usable from const evaluation only.
+///
+/// Build will fail if the function is used for runtime code.
+///
+/// # Examples
+///
+/// ```
+/// #[const_eval]
+/// const fn call_for_const_eval_only() {
+///     // This code will be executed only during const eval!
+/// }
+///
+/// const _: () = call_for_const_eval_only();
+/// ```
+#[proc_macro_attribute]
+pub fn const_eval(attr: TokenStream, input: TokenStream) -> TokenStream {
+    parse_macro_input!(attr as syn::parse::Nothing);
+    const_eval::const_eval(parse_macro_input!(input)).into()
+}
+
 /// Paste identifiers together.
 ///
 /// Within the `paste!` macro, identifiers inside `[<` and `>]` are concatenated together to form a

-- 
2.54.0

