Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021119.outbound.protection.outlook.com [52.101.100.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404E645D1B5;
	Tue, 28 Jul 2026 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250358; cv=fail; b=K/MiGeGHhwbdP7SYu58FPQpj9YZYan9f9k3G1gb8fYmLvl6AlmcH5xZ7PLDG89jqKf+64yl4KZrlOSEL7KICF3S8Rp2PTp1cSji769gdJLzPd3d6W5ISwLFruY/wVOvlZ7fhn9Db36fe86pD8h0Zt1Mk47fZZykMiJvQu7sAxHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250358; c=relaxed/simple;
	bh=4bAiOF+byQpfqLzT79JFYNpLIAf4RWDiNp+b/b68jDQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Fia56a/2RmGsHLhoG8uHQESjxivTu09/TYQ2nmzPO0FB+c/6UgHJk0lzB0ubqhcNiRKSsNia5xYrb6q8DHtbPvMPrkz2s3M+6VGk8ZHR9u7aDbNsSXsW9nGPlK4PEe47bRmYsY0IsTUooUcjd3w0VhX2mQpbEvY7MfCm4SXK8wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dvxKENRo; arc=fail smtp.client-ip=52.101.100.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dvxKENRo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qm6pITnMs6n7subb2SqiEExa+InH0hQDVeOJx6AyRICQxoU33HbwUJF4iIhGYPNH/V0reZgdjI/KFIBTYW9Bdzb1WJuSYrSDRLANoiiiHE9fq0GQtZ8W0ZVKnvi2oN1FoUNI2UDrUELtOG61bvw1AJe356DCIh/U3ajp3qte/Th4CoTMXaN/29wtI4Q6BkmGKorExhXE8i9liNEROTi+MT07krk93kCpwAMISvpV/LyTpA7DKVL345eQvEjJsk1z2moBt/gR3ZBAbco9LWU9iVVi/GidQyyLc17sE0t8djI1dP4cR4OPeo8ETDoTcnVwRWUmVsrHhn/DBddVNt/ENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOSyk64fqXJPRCrShwoi3NmoCNo28uVdkxYjfqAHYW0=;
 b=pIvlfO65re5B4RuROB9tGFyhRE7KdTk5XAzZQK1gSQIPCbIrwUBt+lB9/b2oorcvmajCG0sXJ4u0Gd4URxCXGvph68FAo6n+gSplTCQw3AG7k9cNG7N+3cpp83Ii3O+GzYgSG5NTpXby9zG0KKdZ0GRWM+aWW45i3vKva6/0v3KlrxKIVo+s+RImnzBTufpyf6/jxx1zgdu1N3MS7nxDukqcEICk8mXxMKLsr2Zy5DTVJl1K2TqZ+VuA28aiVFUVQXuoQonBkXYO4kyqacRyRi1UW147L1RoGgvESNGl2hTj7jm9iD8hCVvCUh4BzU6bnnL0a/5DSK5K4FSg1awz4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOSyk64fqXJPRCrShwoi3NmoCNo28uVdkxYjfqAHYW0=;
 b=dvxKENRozu5C9b5Z/a80JvIiA8rkhtMDBq2DSPgi+4cVUDaucSO/HOAehImCoMcXq1mENOQCjFeuyEYFgkYDUyPVuryKYU/kpYa/0Nicfb0aBDKqc6157ISAbkZPF/RKe4J91zc0+/zjoMq/6/K65ERFE2RoGur77s/QowjoC1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB7374.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:31a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 14:52:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 14:52:23 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Jul 2026 15:52:09 +0100
Subject: [PATCH 2/5] rust: print: use `CStr` for __LOG_PREFIX
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-printk-v1-2-855606634d70@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785250342; l=3729;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=4bAiOF+byQpfqLzT79JFYNpLIAf4RWDiNp+b/b68jDQ=;
 b=kxh8q+pSrkvUVcHoiFpW//fbA2UZnY69KZ0xDfBRmlc6DMFUShnB8jkX+kHuYBkwqB9Vw9MWR
 2cWnWIjO+H3AyIDq+TLUnXYNi5Gb9lD0F6f8dlKH7tAPsYHpPOOxF0B
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
X-MS-Office365-Filtering-Correlation-Id: 1e294744-2fdb-4819-0faf-08deecb7d554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|7416014|18002099003|10067099003|22082099003|5023799004|56012099006|3023799007|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	Q0WevSZhkERKLOvgsJzankc086fgXpXiLGzZiNsI9Ed3aHqsKquI7NH6icvPxmYu0ujue71ziTuXztLezU3YtcSx5gvS+54Htp05tK/V9Om/9udQM6a7linlGVNrxZAUbpl3mqLzIipS6tTkHIinVvo72iTUgD+p5PRH6RqkZ9ASfo/AE5TIorc36eH1rYXfbcPEqZs/0NiwMx7zAirHXLeZWk1V7AYfkKgsgDg4rNNt0S0+gND0P7Jtn0yIzOZlOmntejrAKrbB7v3Hxn8eEYFPV706ff9q4UzNtqsEmU+odLmf1K9eWyQVI5DA9rMWbg1hJizWtiumDMphRbvVxTe/xQyAra1yI7LoCoaGOlGSzdQ16W5p21XtjmrAUwuOHA76Q2BQmgh/dkoURnNw4TcuwqORn8L2w+48mbn9N0szgL+llKcdra7meTZKiFcub21FitC5D+PT1cekXqE3BiO6rgbBoIdBnlpoFq5OUi3X/u0ErkiABwvimyKPCi/p88F5S31InSer7D2Z6vWl/u6TwhvaKz7EpSUz/FL6/jpaxpU8wO2z3iMIjUdLEOfAp5w4N8PHBG2CaurU4P2vb9oPbVb+MtR7V8s/2ZUgP7uo+cWoVfNEvQp7Df+0m3BsWhJ808EGTomSnOEHa70krppB9ddK0H8KUIDeISGgDssekTSq5OJSuKoj7bn4WiornkJ5dqbRgLd4KWG2qyDPDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(10067099003)(22082099003)(5023799004)(56012099006)(3023799007)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGM5OENzdUZ5ZmErZVNwN2dkYnB2LzJCb2NMb1B6TEYwVlJjdlpaM1NBSDBt?=
 =?utf-8?B?WDBSYjJzYmE1OXE5N3paZUVITlFkaVAzdGc2TXJlK3d5T2xpa21JbzhMUzBP?=
 =?utf-8?B?WEdLQ1RncWxZQ2V0ZlBOU3ladFRDUnliMUNGTVd1MU5KM1N1YkRxR2RrTm5Z?=
 =?utf-8?B?YWt5VVhnU1dNOUE2N1FBdzE3WGwrZnowT2xJRHlLaisyMS80cERtK3FZYXlJ?=
 =?utf-8?B?ODZjVUF6UFBWMGxqZENDSFNTaGFESGlZK1N5S1ROQkF5OGYyS3ZaVTE2KzRC?=
 =?utf-8?B?MDBnWjU4MHNGcDF0MjRsUHBGUU1Sd0xXVXJONGZMOVdaMWFjTzFXL2lxWE5Z?=
 =?utf-8?B?ZG50RHFvUTRVM1lWZVdiSFp5SnArOTljWTRjWjRBMDRGNXpvRVBLcG5jVWhu?=
 =?utf-8?B?NHV2WjZEcWVTbWhETjdrcTRueEJtVDBDWHVSMi9pWEZuVjBwYkQwc2wzZjJo?=
 =?utf-8?B?SFdVU1o2OFYrTG5tYXVHVithVDhybVZNQXZXRjBqUGJTcklzdDMvanNaRmlZ?=
 =?utf-8?B?OWZWTWlUODZXWFlSL2Q4SzhHVjRhSkRZa3RrKzM5THlvd0JXU1ZDemZsbWlX?=
 =?utf-8?B?RGtHVHd1U1RFSjhreTgwVll6eXlFYVZOSWlmL3JwVFc2c3ViUWgrdUtxMmQz?=
 =?utf-8?B?dnBFN0hvbStIN0hnSERHdFhWTnNqbE5ZbHQxV0RSTmhlbjRMQndEWEtIYXVR?=
 =?utf-8?B?RFJtaVY1V0ZNelJ0eW1wVTFXMk1iY2MxRGIwRzlvZXJJeW0waHJLS25BVnRh?=
 =?utf-8?B?czl0dUJPL0Jrb3EzUDRrRW1qeVIyZ3A0R0JnVEZWcHkwTmU3T3lQeHVhNmhH?=
 =?utf-8?B?R1pKNVd3cnkvRjl4V0JvWFhOL3RGd3RPOEYvL1B3dGFSRVdkVXhkM25QYjlE?=
 =?utf-8?B?V2IvUzBZd3dEUUYzdkNPR3crcFN6OUZBaEVEQkZidncyWFI1RS9KcTluYkJ4?=
 =?utf-8?B?Ti9TNVdqd2RIUzBpTUFrZXZHWmdJaU92SmdESmhoMHFkdW9WRkk3MjNDcnIr?=
 =?utf-8?B?RitGcURhcnJxK0pNSlBBVVBmK1RqbVpQalZycWhpV1dKd280RTM5Y3VRUmty?=
 =?utf-8?B?UjJnTXhYZ29FVzE3TURuWXEwa0NRdFI4NytNVmp5MDZSVi80RGJYRlNnblZa?=
 =?utf-8?B?MWRSRG9vdVA1dU4zazFEYmMxaHZaSis5T3ZvTzI4VUJaYmlyR3AxbXBvblhi?=
 =?utf-8?B?QnNCMHcxaFdrMVd1VmZ6TWJBY3U3UWtucldYUGRuUVZYUzY4VnlBS20xMU94?=
 =?utf-8?B?Z0dXK1NMN1kwZWowYUs0QnMrOEh2WnM5SFh2V1BqWUVqOGpnK3ZxdGJ5ak1t?=
 =?utf-8?B?SHJkV0ZvMnNmMFhDZS8xdTEybDdrT29WSnRRUEpNTTV6U082SXl1endLQmJj?=
 =?utf-8?B?NjVjZWFlYlU4eEw1dXVBQ1JFVjlsR1pidklJTkxOYmNmcDYyMEs1WkRsQnB4?=
 =?utf-8?B?VGVlaENEYTk0MzR3WkdwdW9FTU8zNXN0MUdjSENoS0ZHdEh5VFlkdXNXUWRS?=
 =?utf-8?B?dEFRa1NuL2xVaGFac3U5NnpiaUhhczUwcVRLekhPOHZ3SzdDWHcrVVAvQVRq?=
 =?utf-8?B?bUwzaHRtNVlTcTQ2T0xHY2I2VDRUMVRKOTNCaWgwSmx1Y1lwQ3pvTDgxZ01Z?=
 =?utf-8?B?U2dkRGtwNWxnQ3FPYmJ2OGpEM0VuMVFiUmZ5L25EcjcvQ2JvQ1Q4YWdmdy83?=
 =?utf-8?B?U3h1allaSWlXaDlaT2o5Wmd5RzZETTkxQ1lyWlNVNVYvZmQwNGJwNG80SFIz?=
 =?utf-8?B?ZXlxc29uNTB3TGo5QnVmeDhCbUJIZGNaVEhiakRYMHpGZWlCY3pwcmZ3citK?=
 =?utf-8?B?YjZUbGczNTRFN2tvaXVmM2NRZzRsdmpoMVY0MHBGOUlNbWlqMndUTmVreTFm?=
 =?utf-8?B?MnFGNCs5aTJpclRtYXNLdDQ4VHc0eU9pN1JwZTFaYytqVE5nWTFld29odGx2?=
 =?utf-8?B?c0Q5MmJiVmNOZU52UnB5QnlPdjcydVN2V0prT2xqd1Q1a3g4WEZIMkdPRlhv?=
 =?utf-8?B?bC9LYkJBMndjWUdaUWxnZGhhUkJ0UjVRV2pIZUFSalBkWkZENnFqOENoSlps?=
 =?utf-8?B?NDVKSVhFZDk0VnV3RHVUOTlFRTBjZUJNYUlMTnpTZnQzVVZSb3dYUVBMMktP?=
 =?utf-8?B?OWRJTXFNc1o4UDJEUmQwY1NlUVMyaHlJNFRWdXhpUTFDMGJCK1RDSHFGa3Uy?=
 =?utf-8?B?S2U2MFdrS3Z0a2E5Z3VDRkh0Nm40QnVTUVBWMThNTmJoOGNnWVMvQTRvbDM2?=
 =?utf-8?B?OE5FeEdSenQvWXlVazdDQ3E3Mk4ra0phUlc2cFJxejJoRUVPZi8zbmN6SkNj?=
 =?utf-8?B?Q1VTMk9mZHA3SVFQaWc2WWdvak9Ld1Z5RXc0aENqZ2Y3eXZWMU40UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e294744-2fdb-4819-0faf-08deecb7d554
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:52:23.6137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QO+6dFSmxLQlTLwY5fEuncPgQLUmsLp1t2+GSbYFK7ES7HGtKJnOgjXGjMNZPsZgwuFsIvvtDrdpJvi3HD+Kmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7374

Currently `call_printk` uses `&[u8]` for log prefix and as a safety
precondition require it to be null-terminated. Change it to use `CStr` so
this requirement is encoded in type invariant.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/lib.rs          |  2 +-
 rust/kernel/print.rs        | 11 ++++-------
 rust/macros/module.rs       |  2 +-
 scripts/rustdoc_test_gen.rs |  2 +-
 4 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 68f4d9a3425d..5436daa48ef5 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -146,7 +146,7 @@
 pub use uapi;
 
 /// Prefix to appear before log messages printed from within the `kernel` crate.
-const __LOG_PREFIX: &[u8] = b"rust_kernel\0";
+const __LOG_PREFIX: &core::ffi::CStr = c"rust_kernel";
 
 /// The top level entrypoint to implementing a kernel module.
 ///
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 066ef7a7d5ce..470c1001f37d 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -87,15 +87,14 @@ pub mod format_strings {
 ///
 /// # Safety
 ///
-/// The format string must be one of the ones in [`format_strings`], and
-/// the module name must be null-terminated.
+/// The format string must be one of the ones in [`format_strings`].
 ///
 /// [`_printk`]: srctree/include/linux/_printk.h
 #[doc(hidden)]
 #[cfg_attr(not(CONFIG_PRINTK), allow(unused_variables))]
 pub unsafe fn call_printk(
     format_string: &[u8; format_strings::LENGTH],
-    module_name: &[u8],
+    module_name: &CStr,
     args: fmt::Arguments<'_>,
 ) {
     // `_printk` does not seem to fail in any path.
@@ -104,7 +103,7 @@ pub unsafe fn call_printk(
     unsafe {
         bindings::_printk(
             format_string.as_ptr(),
-            module_name.as_ptr(),
+            module_name.as_char_ptr(),
             core::ptr::from_ref(&args).cast::<c_void>(),
         );
     }
@@ -157,9 +156,7 @@ macro_rules! print_macro (
         match $crate::prelude::fmt!($($arg)+) {
             // SAFETY: This hidden macro should only be called by the documented
             // printing macros which ensure the format string is one of the fixed
-            // ones. All `__LOG_PREFIX`s are null-terminated as they are generated
-            // by the `module!` proc macro or fixed values defined in a kernel
-            // crate.
+            // ones.
             args => unsafe {
                 $crate::print::call_printk(
                     &$format_string,
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 025323fb030d..cfc27a40b7f1 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -496,7 +496,7 @@ pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
         /// The module name.
         ///
         /// Used by the printing macros, e.g. [`info!`].
-        const __LOG_PREFIX: &[u8] = #name_cstr.to_bytes_with_nul();
+        const __LOG_PREFIX: &::core::ffi::CStr = #name_cstr;
 
         // SAFETY: `__this_module` is constructed by the kernel at load time and will not be
         // freed until the module is unloaded.
diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index d61a77219a8c..18fdeac305a7 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -230,7 +230,7 @@ macro_rules! assert_eq {{
         BufWriter::new(File::create("rust/doctests_kernel_generated.rs").unwrap()),
         r#"//! `kernel` crate documentation tests.
 
-const __LOG_PREFIX: &[u8] = b"rust_doctests_kernel\0";
+const __LOG_PREFIX: &::core::ffi::CStr = c"rust_doctests_kernel";
 
 {rust_tests}
 "#

-- 
2.54.0

