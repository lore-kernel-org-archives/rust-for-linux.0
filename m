Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021131.outbound.protection.outlook.com [52.101.95.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C91155342;
	Sat, 21 Dec 2024 18:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734805879; cv=fail; b=gp46Q6tKk1JpTNkeMouMbqOX1ykdI6ajvLlw9fUZaI/dXBe2jx1k0IQoM3+SMN2Rku363JnOYpnL3+CuecbD8UNtfgYPREl92cQ9XF/d4Q/+AhBjeR/+3rZR1eHjMttLv7CNnloZBvo1qeZfeno53yaHviUMrsS6a89e84EKJx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734805879; c=relaxed/simple;
	bh=CV9nhrk8BzEEd4VpN+7mmk7hb629XXBExrvz1O5fGuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DgtILRrGrNmq9DmgLTpv4X4D4jhnLF7zZ+Bhkhuy3Az1tNnzZMR63nSN1zPiZH+oJEvdR+9bskDtMb2n2rYL4afl4ixgmOENtemjKkCcdqyxB65IjhtKfbukS+Lapbbd4ZHWzPxmyGS3FCimns91UtrTAytvHZifHS5NhqAfkss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=h2aZRYU/; arc=fail smtp.client-ip=52.101.95.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="h2aZRYU/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ta9pLhnEpV1+e89oEC6c7a4/xdixvLMjZJ2/mNfgulVse+s1TZIlejIUX1z1dafGPNummX5hqlbc1jTJqLqENleD2qoXDK2q3CY4TkgGvzN683k+hIGDJCadkABrjsPoaYH3FMghbYc0Y6aOPbZvf8X8xAgMjYWhVWPKqjx6P01AA3H0wyslzzFd2Osh2eT5s2wG04Pf/Wh0cfgzIV8qhBCdfEIBON3a/l5EYPUSfoJtjBV2maE2b75z6fRuUtBRNoRT0dKYmJai+tM/bmrwb+s4s+z6Ge4iE8MECVjwaLvtythldyqTV9CniKNDaftnEmpgDdLKXeLm2L0BeVq6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qIbARBQqqFCT7y5895GEm6o9YSQNCYJ5MFPSZqkX/4=;
 b=Qr2klRsx+HrouEH3eDu+57VxpJSQl7VMcuDGtd2aZTr35B2Wb4s5eO4vOcA/X5jdtOW+ruFeiLfJQlYU59SihtRLMH/BtsHFcJxh6EdAPqXJAS3ITUE4LtuE/vHVUgJQrCj5Z11Hueh0zWw2328fkZdFOU7tKYDxFLIaHWguMSH6Szrfo2oXbFwTdYXIkOf4BNZfvdZottnCu8lJLCaIILLqAOs9DTx+v053algNqVnGN0FYwts66ijK8fbYoflRh4R6tifpdLoB30JXcQ9/iYlmUmPWVwdmRGc++jFo7OGBVokui+AGvv73/AIiJ5nsFM10OgP79FJ8rNgQYuVPOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qIbARBQqqFCT7y5895GEm6o9YSQNCYJ5MFPSZqkX/4=;
 b=h2aZRYU/6Hhp5lBPyIOPiO2Cai7zoD2Nfl/YgdpK/jsADveVouscZXk2feJPLtIdNr0wsfCq3yjMf8IF7Tt+X3LbNKUO3DxcqQjm0vvgg6BzmiAkGSc8BWod/c/x0KS9n11cHl7XWAcimJ3C/w8RKzxRyuej4AfpjeN78bhnijY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO7P265MB7439.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:41b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Sat, 21 Dec
 2024 18:31:10 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 18:31:10 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] rust: implement `kernel::sync::Refcount`
Date: Sat, 21 Dec 2024 18:29:44 +0000
Message-ID: <20241221183024.3929500-2-gary@garyguo.net>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241221183024.3929500-1-gary@garyguo.net>
References: <20241221183024.3929500-1-gary@garyguo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0063.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::27) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO7P265MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a1b291-89fc-46b7-ae13-08dd21eda475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VwfuxY2l3R7ueALJoLCkLy8heu89f/rhAOnZ00aREt05PGksHd2c/9KIfRgQ?=
 =?us-ascii?Q?h4uhYDf36XxeW1enYcOjrIvgIiGo37oiEtk90R9V0QC01kTWxDlsUC+Sq6HS?=
 =?us-ascii?Q?EZ9ZRZyhl7zKjnd8pMe7tJmUCIdTCzOxDGxOJ2l/9EgpQjjF9XBwVRLzkK35?=
 =?us-ascii?Q?NxXvHUuVP0FtbZTEUk/F8ZHk9HkVrjctrbbygEHK7XgVjcpn0lHUE8DjE++R?=
 =?us-ascii?Q?aJxlT76EFfQ57/OS+wZxDTXVD+6lMB4V9FPKGrKYscnd5oTEyqVLqoYf/UZo?=
 =?us-ascii?Q?RzB9RW+gONjdkKfHpOELRpFlXQ/HWpTTNrjTSD8boazapGrpkLeNFB4TgOng?=
 =?us-ascii?Q?W7rXJdbrcMhAPHDn1UJ2KtvEIZ/gnCeCfWGYh+cxq4pOSl1cashQ5elwDJM5?=
 =?us-ascii?Q?JDtdwod7twJd+ySgsqttnx7vY+dqkfrFA4LCMBnjlKGVNKhaBgX4zZgc43Bj?=
 =?us-ascii?Q?+IcfZrnKTaO5eK8WWKEtuNkCk0wRUtJu8cqDk2E84B/0KzTL7g5ZO/uGwZIh?=
 =?us-ascii?Q?dBPSuXazF0VYZFYjRySqDrb7QOIeS9TnS5NiOYoTlOe4O4b4vuLj/55MVYYU?=
 =?us-ascii?Q?908KaBaDM3SJxASR7KwQTu3KLTxaxM4XbCA+pavc80vjBjbbwxZf619/VSCU?=
 =?us-ascii?Q?6eJkj45R/s31bPpUv6aA8iTHlB6V5hTcrIVp3F4QUIKhTng0V7Dx/wmZAbjc?=
 =?us-ascii?Q?fCjCwJwGtaulzpaNScN7b6gqcM+ZlbCMMQPITbWPa35UOuYlay+V2Xk6ag4N?=
 =?us-ascii?Q?2omFBRE726g1YxcBbB+leHUY1h0DxowxmzbP7UG0fRrgbnVtc9ik4T0IDC8+?=
 =?us-ascii?Q?H5Lam1u1ucuUBV2+YnmVckintxbOUl31mdyCIxogkOcADZ3to99pb6bfkZun?=
 =?us-ascii?Q?oGAABsdcrOqPrFAYDhACMOjzwiVQ7M3TKo+N0NVMCUX7gb7Lw/eEbOdQrplE?=
 =?us-ascii?Q?h9Ab6Spam51wZ0IefCs2KqRymaFqJIP6CxCnH8onkhUQmoiCSI6tqqXXcb2h?=
 =?us-ascii?Q?kehrDktjfRz+LVdYm1EBO8/+ejHsiOQ6xxGETutvxmxLIJgIyecDreZi53sm?=
 =?us-ascii?Q?cHHab6o06zAtTV4xjlNrLEGbW7N6z71Mdc1FMvids8VAjX8OXi7Ctvp4WbYq?=
 =?us-ascii?Q?FimcoZd2KkUIjEO7xw8H2wt/fTWPxvcwXYMxvcdM9rWOj6DA5362Stodu0D6?=
 =?us-ascii?Q?hJPvHPHAIwcAirSaHb0j5TSqA78+dmYQ06hIPsGP1dslRTCoRdSoAtenFcGc?=
 =?us-ascii?Q?4YyzwfkuvKMUR7IaDOYSqE4uF2LA6pC99OtvpRlbKdFGTZsU+sJHlnaVAAW4?=
 =?us-ascii?Q?BDi1hS6fveVENdYoWszH+s8AVj98ARbe25T7dxHjaxGvohLbS6j2GDwfXO1X?=
 =?us-ascii?Q?K5RUVhfNtAmpW4VH+JmmbX5jv2kHx73VGWbWt4EuvXuefHYxK7kLENZLFcKc?=
 =?us-ascii?Q?mY28tPapq8c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8+dk8sAb46vHkCaYPXX0jLsnO8j/K10o0NXErX4JTisOaEZaQlOYqNA7kYy5?=
 =?us-ascii?Q?8boKvQubP4Pwe4cGiLM5Em7GGIvezFDh80k5YTkg9MnsPjsH2Zg6oCPgX2xQ?=
 =?us-ascii?Q?n50h3t2/xG056+2Gl+02q+VC1Oy8Vw+m9m8dIkWvEBpv2uBRgLqNZxivef/S?=
 =?us-ascii?Q?h2LeqkGK8Dg4srei26p5caJ354o3jOWLUGt0TF0PLFWgaNH+BTEOZfwk2wnd?=
 =?us-ascii?Q?3tQ9urnOiNUZ2wZ8FBofLK6C6yQAgrKw2BNHU7Ec56N9j6R7vMKfbEq2yYSu?=
 =?us-ascii?Q?kVdgq3wQzH8DWDBQMCMNTzQs86rtB0pHqbtx/wkvPUIgc0xL5EftMhhgA0ee?=
 =?us-ascii?Q?qJVMfrHHVdPE7d/hChR16iDzC/bvQWt0BhLdtsBV33kUntOZNTQ6J50pfjTc?=
 =?us-ascii?Q?GM0pBEeZw5iY/SysbAg1gpYMEqgbvjalfRjPRs6gV8SsMGqpyiMJDmMhLgBP?=
 =?us-ascii?Q?x3RJlcYkY7IPVZu3rVn4O/UTv0dqb0DP6NRmCvlDeCCzdlnBoCbTzlBwNDYL?=
 =?us-ascii?Q?ln0Q8qzAp5YNmfrSkM2Qfahkvgc9u4dfwGd2fSbaVb/FwealYsso/7288JqY?=
 =?us-ascii?Q?2rHbE05y5p9sPfzRRBcTHTvpP5H555kyxmyBs1we5MEbvWQAVxxcqp1mt08o?=
 =?us-ascii?Q?YiOohAgOpJV4npFNGh/9igw4rS99nd8rpgKEuiNdhnhlSQb+CTvtlaJeC6dR?=
 =?us-ascii?Q?RvniWaiXqJ6RlT1qm4oZPZHhIJYhmUJu2GI/JkrsJ3pzsDgXQmrHD8Xu+ngv?=
 =?us-ascii?Q?KMPuSh7w3VIR581fxcSdAtYvSq2MoFJWRRN6SCNYkB48VQVUVh/TahWy4fmn?=
 =?us-ascii?Q?8MvRvqgD5l6C9eMGsdhyH24OoAQ863QNFJPnoqxj42WZewPsKYWkKGCXIvms?=
 =?us-ascii?Q?713NCT4nj/2XNgFS4Vockpf7f1yYCjQK/G8TgwYhMpTyBe2rvMOpiPiQM2BC?=
 =?us-ascii?Q?Y09hY19n2pGX/Rd4UuuQCAchVXmj0P6k1i2s1WpRoc0d7Px5iuhWODgCltoC?=
 =?us-ascii?Q?ACGsS8TsAO2hT6LeSEENNOlcK68uQhMB+y9lSScq1LyQr2SKq6JMRIYCO8e4?=
 =?us-ascii?Q?CLKKpnQTRHLj9ByXGPPV/G60kzLb71MbOv1RS0d0wXkFD1aZmgX9BZAd5+Ff?=
 =?us-ascii?Q?o6wU4ajGp3kFCR+Zfb5tEOXEjbKecVp6skKgorLqlqcKmtpEJ6VGyPVkj3CJ?=
 =?us-ascii?Q?asb32vs4wSpEAkf3+uDWUsbjgzhW29eprhqGl1m0VvMStG0/zAKUWGy8MxzA?=
 =?us-ascii?Q?pbwCvszurzKRPG5ASd0oJiCyq8oSSNBJATW4zZWlXNneFrSOcji2Coyg1JWr?=
 =?us-ascii?Q?PFnP8ydj/fw6sCEEGgSlOfnCC5KTIOIGc+Zw7sZ1n6a6po4DVNyccTMrvu+S?=
 =?us-ascii?Q?QCv8hZU/aHjgnN9SfugiJ00Ro1kdXgiK7l//emOpS5jxK/x6QURr0WSXoRGl?=
 =?us-ascii?Q?FDGHgFFu4gsSdf9WStWEb0QAAKutBL2jSTd+p7yrk+gkfN2KUPyt/WON/X4J?=
 =?us-ascii?Q?A6Oq+UjUdtDSUeBBhMF54D/Z3b/OQHMcNagbbe89UBfxiB9/KQXo5HbL53yN?=
 =?us-ascii?Q?t1qFpy7YVePV1DaVj3VIEQ1j5x/UE8pfXJsTOsNMOFpy2ZGQicxrBMAsIUDJ?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a1b291-89fc-46b7-ae13-08dd21eda475
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 18:31:10.7950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UGpZliqpst8/PrXfbH04mVSLlBD+/7fJhuCyvH0PTp9XhsZMR7DiU/KduFYfoiYpiECe2z9/qznQcQ/YBpB6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7439

This is a wrapping layer of `include/linux/refcount.h`. Currently the
kernel refcount has already been used in `Arc`, however it calls into
FFI directly.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/helpers/refcount.c      | 10 ++++
 rust/kernel/sync.rs          |  2 +
 rust/kernel/sync/refcount.rs | 97 ++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 rust/kernel/sync/refcount.rs

diff --git a/rust/helpers/refcount.c b/rust/helpers/refcount.c
index d6adbd2e45a1..d175898ad7b8 100644
--- a/rust/helpers/refcount.c
+++ b/rust/helpers/refcount.c
@@ -7,11 +7,21 @@ refcount_t rust_helper_REFCOUNT_INIT(int n)
 	return (refcount_t)REFCOUNT_INIT(n);
 }
 
+void rust_helper_refcount_set(refcount_t *r, int n)
+{
+	refcount_set(r, n);
+}
+
 void rust_helper_refcount_inc(refcount_t *r)
 {
 	refcount_inc(r);
 }
 
+void rust_helper_refcount_dec(refcount_t *r)
+{
+	refcount_dec(r);
+}
+
 bool rust_helper_refcount_dec_and_test(refcount_t *r)
 {
 	return refcount_dec_and_test(r);
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 1eab7ebf25fd..b76b04e16eac 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -12,6 +12,7 @@
 pub mod lock;
 mod locked_by;
 pub mod poll;
+mod refcount;
 
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
@@ -19,6 +20,7 @@
 pub use lock::mutex::{new_mutex, Mutex};
 pub use lock::spinlock::{new_spinlock, SpinLock};
 pub use locked_by::LockedBy;
+pub use refcount::Refcount;
 
 /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
 #[repr(transparent)]
diff --git a/rust/kernel/sync/refcount.rs b/rust/kernel/sync/refcount.rs
new file mode 100644
index 000000000000..2198b1598b60
--- /dev/null
+++ b/rust/kernel/sync/refcount.rs
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Atomic reference counting.
+//!
+//! C header: [`include/linux/refcount.h`](srctree/include/linux/refcount.h)
+
+use crate::types::Opaque;
+use core::sync::atomic::AtomicI32;
+
+/// Atomic reference counter.
+///
+/// This type is conceptually an atomic integer, but provides saturation semantics compared to
+/// normal atomic integers. Values in the negative range when viewed as a signed integer are
+/// saturation (bad) values. For details about the saturation semantics, please refer to top of
+/// [`include/linux/refcount.h`](srctree/include/refcount.h).
+///
+/// Wraps the kernel's C `refcount_t`.
+#[repr(transparent)]
+pub struct Refcount(Opaque<bindings::refcount_t>);
+
+impl Refcount {
+    /// Construct a new [`Refcount`] from an initial value.
+    #[inline]
+    pub fn new(value: i32) -> Self {
+        // SAFETY: There are no safety requirements for this FFI call.
+        Self(Opaque::new(unsafe { bindings::REFCOUNT_INIT(value) }))
+    }
+
+    #[inline]
+    fn as_ptr(&self) -> *mut bindings::refcount_t {
+        self.0.get()
+    }
+
+    /// Set a refcount's value.
+    #[inline]
+    pub fn set(&self, value: i32) {
+        // SAFETY: `self.as_ptr()` is valid.
+        unsafe { bindings::refcount_set(self.as_ptr(), value) }
+    }
+
+    /// Increment a refcount.
+    ///
+    /// It will saturate if overflows and `WARN`. It will also `WARN` if the refcount is 0, as this
+    /// represents a possible use-after-free condition.
+    ///
+    /// Provides no memory ordering, it is assumed that caller already has a reference on the
+    /// object.
+    #[inline]
+    pub fn inc(&self) {
+        // SAFETY: self is valid.
+        unsafe { bindings::refcount_inc(self.as_ptr()) }
+    }
+
+    /// Decrement a refcount.
+    ///
+    /// It will `WARN` on underflow and fail to decrement when saturated.
+    ///
+    /// Provides release memory ordering, such that prior loads and stores are done
+    /// before.
+    #[inline]
+    pub fn dec(&self) {
+        // SAFETY: `self.as_ptr()` is valid.
+        unsafe { bindings::refcount_dec(self.as_ptr()) }
+    }
+
+    /// Decrement a refcount and test if it is 0.
+    ///
+    /// It will `WARN` on underflow and fail to decrement when saturated.
+    ///
+    /// Provides release memory ordering, such that prior loads and stores are done
+    /// before, and provides an acquire ordering on success such that memory deallocation
+    /// must come after.
+    ///
+    /// Returns true if the resulting refcount is 0, false otherwise.
+    #[inline]
+    #[must_use = "use `dec` instead you do not need to test if it is 0"]
+    pub fn dec_and_test(&self) -> bool {
+        // SAFETY: `self.as_ptr()` is valid.
+        unsafe { bindings::refcount_dec_and_test(self.as_ptr()) }
+    }
+
+    /// Decrement a refcount if it is not 1.
+    ///
+    /// Returns true if the decrement operation was successful, false otherwise.
+    #[inline]
+    #[must_use]
+    pub fn dec_not_one(&self) -> bool {
+        // SAFETY: `self.as_ptr()` is valid.
+        unsafe { bindings::refcount_dec_not_one(self.as_ptr()) }
+    }
+}
+
+// SAFETY: `refcount_t` is thread-safe.
+unsafe impl Send for Refcount {}
+
+// SAFETY: `refcount_t` is thread-safe.
+unsafe impl Sync for Refcount {}
-- 
2.47.0

