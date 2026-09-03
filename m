Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021099.outbound.protection.outlook.com [52.101.95.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292FC4D90A8;
	Thu,  3 Sep 2026 15:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448921; cv=fail; b=fPWZbLRHj2nU4NfCCHcrozotEEOohMjy1Ju8qz0TR5lc93gOtEwEkqJ83ThIibqHySKXrAPNyrUd9DCT2/hwF9GBhqcvHWb5m6qF7bkxI/R/hNZpFOxIlTfHjkIeqc4rICpGQk1A5pRwACOFUyLD563sHe1Jbos+hZZ3t1Fs/U4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448921; c=relaxed/simple;
	bh=cHHOFwNhG2S2hgtB5D9YJmVHBSKMDEkbJMIUnplldSI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=D6vTum9PNq4Yxos1ELKcsdIRz/q3lpJ+w+mQt3eFEGDHeK0IXjUm2VRewGyNkiV+EsIRjHoSf9lrwW4Dxad8BYcrG+MWWGU4um+NsBuWnN5k/ElePuZSEpETLB3jgLrSj+Zm3278T44O1ljk8OiNHukXDOv52IL9hoHYXb6fPTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Zo5iq77h; arc=fail smtp.client-ip=52.101.95.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Zo5iq77h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRl2MQxlir0hQaTy2RwfzGts+pmHLwdNX7kGR07Yk+oX64lBdJ67ZuTNErpRQX2tGXuFdZlXtGp44aLSzU6+3RWcaamDu+oeHS16Qonc4Zg+7skKHnKlYOy8XNHbxyqlAhJQ0UYYxPKYVhWoulA+lKfltGhHvU/yBUbEH2pZ+A3rIzgjaYA1KSeC1NwGO7m90bmuKc3X8vKiP8xqRgMdfl0ZlxX2aTxDc0QDCU0j0pHe8XslGdB1T+KOnGKfCzjUjBCAqvyJ9Ep1yQHb6n5ISxuqEfwm0u/XMTL6UYqi9aBJcrTfG6vCh6YRF8oZTFi/KvQzpvJ/KfTKMI1A+plqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NHFKeethaqEdt91o1x9gN1K0YggbLq4SqNrt02DRss=;
 b=QZ+DIYBuxbdmKB2YHSoHuiy0EC1vsceoVKU9dWqVtfR+Ys3rR1UZmZt5PBYStb4hHLRd4G2GqHbNJNu+MOqBAyLvy97xmH3DiNFTg9Svuk0LO4UYmeaPi8IpQ7N3CDllIH+stITELXcgAigyAc6Rq3ZWSGonSYRhH4ZOy5F1RrNT2W2tZpOVbbZnPG3MQrfb0Td+W1Qnnmm73bNq40ycvE4HoX7lOoDV1pmuVHY9m/s7AR0WO4quOnGQ0V1C5muexkzpTrzNMu/aGVtZ90WaKe1VjRUcDH1Sg2vNn69AsmE4azAl6LhneVzX/WbvoNqEI7iMXjg4z89xVRdODmDpsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NHFKeethaqEdt91o1x9gN1K0YggbLq4SqNrt02DRss=;
 b=Zo5iq77hFA+T7gJgAvIvprWV7hHi+R2kVzCNhBzgGQm4Qbf4crKdVOX8obAhbvXg5IzQBfxJvzEMybo2pslQdAw9+YGsFCp9IRI5yPnr53S6paAay/z9+/coCQkfsOsKWRcybPeBilZ4uR0dQuOmJ7B6hAGH0ES++YD8WxWGAEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOYP265MB2223.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 15:21:55 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 15:21:55 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 03 Sep 2026 16:21:44 +0100
Subject: [PATCH v2 1/3] rust: const_eval: add `#[const_eval_only]`
 attribute
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-cv-v2-1-e93b1613e40c@garyguo.net>
References: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
In-Reply-To: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
To: Eliot Courtney <ecourtney@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788448914; l=5242;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=cHHOFwNhG2S2hgtB5D9YJmVHBSKMDEkbJMIUnplldSI=;
 b=7rxPPrwRcrKyiHi+58yOUcLJtNWQpxBZ8ZtVaEo1Fo3S8DWNqLoLY0MD8RrlGNZIT3WYUFTT1
 d4bV0cES3meBjtGa+9mt1bGJr+mQ1j1EGLN/EAV4U052VzfxWIgBRDv
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOYP265MB2223:EE_
X-MS-Office365-Filtering-Correlation-Id: bf26b6ee-11f5-4fe2-09db-08df09cf168d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|23010399003|366016|921020|10067099003|56012099006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+qcuUn+xBr8yQ2gSliUHwqv0gkRkNEjnx4vjJNJCzYGaj+aV8dIKmGvycGgwL9+gUHsfNL4Ev1X6sZPiRHk8coLdBA5c42fVZvN5yC1RdMwClD47AkPbp3s7yqADrlKndg8aVEegk+JtFUFRHqsO6uvcncKlZDo/eSHFJCkpU6K234ZTzuXi/zdtEB/02zTW7+i1uN3+kOw8TlsmCvHuoUSisyq0MrDSbv4SrQUdYRKoSUJD643xJLc6c5R2q/wmVdO1pJMsAqoVH/aUa/0yNDAOK3IN8z+wsISzJyN47HkJBYf2FfvTwCKrxmeJNwsNLsCX9oOGJBBxdVm6SAgfEIqMUpGZ9bg+1knEM0OopNLiBbGtpM7Y336JkRUV6qhu5P3SoHsiRNu+B9zhq8r1gHHIlM8r0SwLK5PE5ym+BRDF4XvQ55P8Xujye+j56thpAbVAkGDd9bHq2roCGmIwfD/2uO8T/pmoIcSsnrtf+F9frcoBkjjEPcfmoY6vwNUl2iQDiP5fRbRnq2JyGAgLUihJOE9UlBm2Z2+fgTPUfHb3jAxfk+zOx0ScddTPtCs6LJ2ZLAHCSIUSz5D2t6+IX9BhTIViDotX/P+kH53fBvA0FQHec9odzfHnFlXINGFfVBbalsOs9vYgbVF6AcAZfsQPsBoOpQLb3kczaopvaoyiZ/kTjkkYzrs0TW1cFf3SkRR125aiKJgK4BNR5FVlnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(23010399003)(366016)(921020)(10067099003)(56012099006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFVQZ2JseGdQdTRqbGpwYnJZVTdid255TmtMaWZ4QXA4TFI2eXFyZXdlemNq?=
 =?utf-8?B?dy9ob3Y0MllYMFc1c2NuZHhxYkdEeDBoOFdlMDZrVFU2bE80SmJkUXRTU3V4?=
 =?utf-8?B?L3lEYnJoaU5oTk5laDA5Nk1DUUdDbFhaTnVpejZOUjh6Wmd3QkdmdzJ3Rjkr?=
 =?utf-8?B?WlA4b1N1U2RqTC9EanpTMTUyYWxkMThJWjA4dUJpejl1bW5WTjRhYm11QTha?=
 =?utf-8?B?SDZDeUNUOWduQ28rK2IzKzRPaklja21HWHJoUS9WSFM1Rmk0UCtPK3dscXNV?=
 =?utf-8?B?bHRjd3Z2RWtWVmsvb1VQaVNjcVpCZEduUldCNWlGL1MxWnpZdFR3dUFmS2Z2?=
 =?utf-8?B?THd5SmVValdvTmQwRWx4dktYVTRPOCs2bzRUQW9GcjVNNmo0aTlqWEo4K3Jv?=
 =?utf-8?B?K3JhTHdOSkI3ek1EcHBiZWFEOVdZVlpKNHI5WjdNdUQvSHBscm04OFgySW9Z?=
 =?utf-8?B?QWYzNjl6ME5JMi9EZGxsTFRYYzFsT2tIdlBGSXk2SGtBOEZjMXpBMnZvMy84?=
 =?utf-8?B?eGpuKzRwQkxwNmo3d2owdGl1RjhLdkFRbE0wUVc1ZkxVYkVJTDNZcjUyM2JF?=
 =?utf-8?B?cG9ZWXB6VkF1TFlaZ0k4R1EwUXRlUUlpUkIydGRoQjRydThLSVRmRmxmQ0tG?=
 =?utf-8?B?aVR6dFpZY2grZTFFdDlSQVA5ZVdEcm1GNHZ0dEZUNXZHUlRLa3hZZ0NhRmFJ?=
 =?utf-8?B?MHdERFZmT3JsS2UvbzBpYzhKamtmZHRiVFcxZjFHUXRCYmtOQjcyQWtYUHZx?=
 =?utf-8?B?bEIyZnp1VTBGMHdQbE9IcnhzRWExRHZxZUR4NXRQOVRrSURxMFM0NjFRVkp4?=
 =?utf-8?B?cFMvNzFjTzN5aEt1R1FlNGs1Wm1aemFGWGMzWnBKZE1zdnRiQzVOT2FWclZt?=
 =?utf-8?B?Q1ZDMFNPUDJ5Ym5Eb2RlZG51YzEyMlZPSENHWXd6YTZVU3JEQnhtaEEzVUU3?=
 =?utf-8?B?dWV4cGVEak9rc2JtUk9wUFd0bHAvUGNkRkxqbHVYWVZDb2JiQTZXRXRpV0Ex?=
 =?utf-8?B?WmJqbHVKK0FmWERwaGNRZzBPWEhYd0pGbVYrZHF4RVdpVlY4TjdHN3VTVW51?=
 =?utf-8?B?alRQVnMvNWdMWmU0cERuTytNOEFYbFNWc1laMU51c05CVVhsNHR1Y0lzUTR3?=
 =?utf-8?B?UFRnNC95UEord0x1QTA2OWl6OVBPUHprOVBLNnNzcFd1YWpwOENrbWN0MDJW?=
 =?utf-8?B?ZU5aU3dZeGZJNHcweUdYSlhONU1SbTNmQi8zcklPUEpCVlhMRFhxcWJQY0Nq?=
 =?utf-8?B?bXBiUDRzN3ZHZ2t6TkpoVUNOdzVDZmV1U2x6VkY4bnRLalg5TzllVzhOdjQy?=
 =?utf-8?B?MjIxT0pVVjhvTEdZQlo4K0xhb0M4R2xrSkJkQ09udXV3RUw2bE1ZYnlYM2JB?=
 =?utf-8?B?SWFGWnJob0d6RXdzOVhhQ09ncURCZHF6UmEweFV0Yy8wYWxBZHdNQWh4VnpU?=
 =?utf-8?B?eDBFbzdNREF6WDlTWFFERHo2S2hEbTAvWko2dXRPUGllRXN3VnRySlFBbW4y?=
 =?utf-8?B?MlZ3NXVFTWcvRlI3YjNBblBqN1J0UkVrNUtUT1hrMnNaOUgzYTZCTkwwcUho?=
 =?utf-8?B?REJ3OUg3azBUZGVreU5VdWhVbzdqQStRZHhLWFN0bWczUzRpbzRBR1dUbkcx?=
 =?utf-8?B?SDRkOUVyQjFsd1U5ekhacmY5NlAvYjNZM3dDZEgwYURVaG1VcGhobEZGeEJa?=
 =?utf-8?B?VjBnQUF4Z3J6K3YwZ2phUVFjS3hjVmI3WGNWUU4rQTZPcndCSTJleU9SeWg5?=
 =?utf-8?B?aUljM2hUZXhIRjIzNWt0eHVURVE2ZnZJTVZUNHAxaTdzSlBLNWJ1cC9xQjJI?=
 =?utf-8?B?eDRZYStHN3RHSitHMjMrd29DVkFGRFlaTFczall0Z3BDUks5K1hGSUdaS2Ew?=
 =?utf-8?B?WTlUTjVQTTJWdmlrc2pMalJjMmdsUnpNV1MxNmhuUnpPOXJkWGN5UytZbnFR?=
 =?utf-8?B?eElJSFZrTjF0Y3lodDBUUzZkWXd0UGtjbC90azZ1U21QYlNsbjgzNVF0cjVw?=
 =?utf-8?B?Z0FPRmVCWFZzTmlDNEhablk0TWFzQTFKSzRTRkpiSXZBWG9vcEJLTHN0MlYz?=
 =?utf-8?B?VDFpN0FETkxpbUNlaUs3MVlzbzdNSUJaeTJybGtwSWtnVUUxQk1qaGdHWFNU?=
 =?utf-8?B?SzZ3ZHZ1L1piV0hqTEMweFRLUkZSVndreDdnMXRKR3UraGlSblpjUFpvVS9a?=
 =?utf-8?B?Q2dUNEp1YzdFamk0dktoQUFvSVNiMlFLR0NScFZ6Ui93N3BUcmhLSlk3USsz?=
 =?utf-8?B?Y2RvcC9uUzhmeWVoSWFsdmxibk50RTB4L2lvVER2TGVoaWp0ZmV4elJLbTNo?=
 =?utf-8?B?Ylg3QkR3azFSTGt3N2tjZm5GbTJPQVU2em5KNjRqcDJkMzZ2NlBVUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bf26b6ee-11f5-4fe2-09db-08df09cf168d
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:21:55.2082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMicdmGVZEXHt5TKSsK6ZEJx7r6Nz65mP2XoWe1DCNIE5Uh9PSs/X2BzJ2MDJx+2nURbxqtEZV9i5IYlCicvvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2223

We have a lot of helper const functions which are intended to be used
during const evaluation only and runtime calls should not be generated. Add
a macro to denote this explicitly. This is similar to C++'s consteval
keyword.

Convert device_id.rs as an example.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/build_error.rs       |  7 +++++++
 rust/kernel/const_eval.rs |  9 +++++++++
 rust/kernel/device_id.rs  |  4 ++++
 rust/kernel/lib.rs        |  1 +
 rust/macros/const_eval.rs | 24 ++++++++++++++++++++++++
 rust/macros/lib.rs        | 21 +++++++++++++++++++++
 6 files changed, 66 insertions(+)

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
diff --git a/rust/kernel/const_eval.rs b/rust/kernel/const_eval.rs
new file mode 100644
index 000000000000..f1b79d82549d
--- /dev/null
+++ b/rust/kernel/const_eval.rs
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Utilities for const evaluation.
+
+#[doc(inline)]
+pub use build_error::assert_in_const_eval;
+
+#[doc(inline)]
+pub use macros::const_eval_only;
diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
index c81fca5b4986..dad9cadaeb1b 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -10,6 +10,8 @@
     mem::MaybeUninit, //
 };
 
+use crate::const_eval::const_eval_only;
+
 /// Marker trait to indicate a Rust device ID type represents a corresponding C device ID type.
 ///
 /// This is meant to be implemented by buses/subsystems so that they can use [`IdTable`] to
@@ -108,6 +110,7 @@ impl<T: RawDeviceId + RawDeviceIdIndex, U: 'static, const N: usize> IdArray<T, U
     /// Creates a new instance of the array.
     ///
     /// The contents are derived from the given identifiers and context information.
+    #[const_eval_only]
     pub const fn new(ids: [(T, &'static U); N]) -> Self {
         let mut raw_ids = [const { MaybeUninit::<T::RawType>::uninit() }; N];
 
@@ -144,6 +147,7 @@ impl<T: RawDeviceId, const N: usize> IdArray<T, (), N> {
     ///
     /// The contents are derived from the given identifiers and context information.
     /// If the device implements [`RawDeviceIdIndex`], consider using [`IdArray::new`] instead.
+    #[const_eval_only]
     pub const fn new_without_index(ids: [T; N]) -> Self {
         // SAFETY: `T` is layout-wise compatible with `T::RawType`, so is the array of them.
         let raw_ids: [MaybeUninit<T::RawType>; N] = unsafe { core::mem::transmute_copy(&ids) };
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 4d5c96ddc49c..d9ed25e96ff3 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -57,6 +57,7 @@
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
+pub mod const_eval;
 pub mod cpu;
 #[cfg(CONFIG_CPU_FREQ)]
 pub mod cpufreq;
diff --git a/rust/macros/const_eval.rs b/rust/macros/const_eval.rs
new file mode 100644
index 000000000000..0664888d3b38
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
+pub(crate) fn const_eval_only(mut input: ItemFn) -> TokenStream {
+    // Prevent code generation as the function is for const evaluation only.
+    input.attrs.push(parse_quote!(
+        #[inline(always)]
+    ));
+
+    input.block.stmts.insert(
+        0,
+        parse_quote!(
+            ::kernel::const_eval::assert_in_const_eval();
+        ),
+    );
+
+    input.into_token_stream()
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 24f96feaeb34..e47a8c35ccff 100644
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
+/// #[const_eval_only]
+/// const fn call_for_const_eval_only() {
+///     // This code will be executed only during const eval!
+/// }
+///
+/// const _: () = call_for_const_eval_only();
+/// ```
+#[proc_macro_attribute]
+pub fn const_eval_only(attr: TokenStream, input: TokenStream) -> TokenStream {
+    parse_macro_input!(attr as syn::parse::Nothing);
+    const_eval::const_eval_only(parse_macro_input!(input)).into()
+}
+
 /// Paste identifiers together.
 ///
 /// Within the `paste!` macro, identifiers inside `[<` and `>]` are concatenated together to form a

-- 
2.54.0

