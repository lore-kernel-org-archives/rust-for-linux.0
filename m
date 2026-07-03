Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022118.outbound.protection.outlook.com [52.101.101.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611943DD86F;
	Fri,  3 Jul 2026 13:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086469; cv=fail; b=gHdDRNbmDN8OzTfhHIj51pAPo9mfAKZe05lULBNx0ub40snhe5YeFvKK2PBXnSKKhBr86EcF9D6EnzkFfgiQWVYwspbl5ZBVQj1kSDWPH3AvUvcjgspa14nm43L5nJ57lIq3kQM17yCBGPxpJ8NZitCOm0qAryfbDogSxoP3a0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086469; c=relaxed/simple;
	bh=cdoN+b+0MGWc9+ZpJ5k7UEJmBP2KRgwOFXk9+s5+hIs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=At109p25WVnnFH8Zcv6zuVm6d4WTCDdhp5t3szeJK4I9+/vgvdem9aH+rv1m7N9o4SQaGq8w6/8glYF9xvUHPGBaylwXHCUFgHCMcAr5VoXgDJbcKsskUqxUPTDHgj5fnzggC0vQ5edufJ1Qn9y9IRU+gHg8OhtyWhGsuXGF7vU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=HkLQkaU0; arc=fail smtp.client-ip=52.101.101.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="HkLQkaU0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMR1XCKttiIBRmIm0WZKdjwKuizQo3kemJHzjipmqlMsy29tR9GKceE2gmAk/s2wiXyqCuDD+lMH/fyFx9HHnGlcayJbzr/b2m7p41CIsVuLJb14/VzE34EKYCkKzdHXpgaWA/snzNe0O0JdQmYQ+cNbxqr9d9YCHC7Y3CnzGp2CNfA1nuRmVRXoMVWvubspT8kHgoFk2InRPDBbu+pkgLnqid+5i+ZwFQulPFylNSBTUaj3NXvWRPIwaWoAui7t7dH7nojJrh9lpTWyCrMe3ikJjy+f85mmxodKergA2NJ+/lJIfepKDcSMOVwvn+ppax9YMTZkXyKae5PO2BL09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/8QG9OXlQ1XcY0KfuvpjrQcS/R2P36tUqTRFVtNAg4=;
 b=ZpirVTx1mT7DsLMStbaXoSDIdBPcjnPiMMSRCBQ8PSUyJHct1EPDlCgH/kXAIKeMkEFHhprtXK7AJ5L1eQkJlS/I8iCHkAS0r7aYD/vCkZjSNrrnXoePtR7N5x71Zc4q2xoTqR72lUsDEkxkF5CBH/gbqpsttLQ3pXyIfJlcX2ohlCsEcsW09VFB+fbp+HSiDU3qfUltWcTIfbihvrnoPoEvR+Jp7gbpe5i0PGUsWc36ebhCLgyHq41VFwme3ixB2c3d4lyU72VyFF8qb/f8/dBkgPEqWjOKgtdcQS74rP8Ut0hXd340TOr6tXKeLh48hrfduPB1c1WWW5r1oAQg3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/8QG9OXlQ1XcY0KfuvpjrQcS/R2P36tUqTRFVtNAg4=;
 b=HkLQkaU051lEzyBPwVk9uaslPORgcZVDdODjc9Q8Wee8CApR2OWkcSOszD3bGYaV74lbmplLc1nNpW89BabH3cXXnxNo3WeVWrklcmFEih4g9+DBgXhpzbi40xkf+AJGcglTusHeRMocjjrQOHRt3LFvfsveXKTOkBTLziwtchQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB7305.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:341::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 13:47:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 13:47:32 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 03 Jul 2026 14:47:26 +0100
Subject: [PATCH RFC 1/2] rust: sync: introduce a way to create lock class
 from caller
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rust_lockdep-v1-1-1c21c62d0341@garyguo.net>
References: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
In-Reply-To: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
To: Boqun Feng <boqun@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Lyude Paul <lyude@redhat.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783086451; l=5592;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=cdoN+b+0MGWc9+ZpJ5k7UEJmBP2KRgwOFXk9+s5+hIs=;
 b=qWTgghzXb4Drp6r0KQ3nVWZ3QsKKhRkMNttVQU25q48DlmgcrlEkOdGy+6/RX5jyGNllfXkxe
 oDJRZMjsuOhDC7UTpvbFMLrEriiH7Iev0cljkHj7oU26HtDSCDrnAn6
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0502.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 0797230b-6964-4b7d-cfad-08ded909a180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|7416014|6133799003|18002099003|56012099006|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	669woihJ3rlxdFMhP4j0HSkYNXYSXjZ/umkO7CMw8+XC/iSZuqAjjB1Q+z3HEEBbFISrgbmtVY9BYFQh9jT7hkA/3WkX5z5Goje8sE8dUK/vuFJ8jOWBV7UaChJ9KDgOo1aJ+Exoh8PAK3wWIPCDw7rJ1eVc/z03jwL9rwPyXbZE4MvreFT+TZv8fb6J1+tTGsxnl4zg78FakMgwYbToR711izqLU+Tl+fV8AMCyjEP1/By2sQATcHi9LXBLe5/gEwqx27YObv1Wj3IuwgA8lfPTEV1GFtRfSjIFClAjUuBKjPdvoOLpOWqKkXAdQof0MZJUOb0PFlIhx2QezNvs4tM9WF7TNVe7cFL/s6I8uentxSqILOK1G+aPke3470VqW1RfHi2Qcue75J3m9BxNPKyt8pyh53k/p1iDfZH9DcN/cc9yS9ZI5KELxNtfkOgkwxUrBGmlveDRHGwyYYJaFfv4u8I97yK234qIV9gChkrnlK6YYKsgpJGEycK21R2SpMK2a+wmLVQEXUMwP2dJ4sFYQASdgbsNtq1pQ+b1kbDiqM7vYGNXvIBf+iQQnu6kC08CwOn1BC+QryE+bXxYYUDEXVmlVnLTYUbG0ol6ryUjB/f4QfWzHU6vbQYNx3xRPdWAXO7UwyNnfvDttPRI3qmhzSHr0L8JfPxf99gBE/QlcYCS+8umNSNhOJFjwqLjh680oBMlDzbwqqYEiDTXTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(7416014)(6133799003)(18002099003)(56012099006)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2lyZGF6ZlJaS2dkUHNORUlML1VnTDgyVkNKelVGYmdOYmczdGdRRlVZd05N?=
 =?utf-8?B?QWk3OFhLRnE0d1pqUEdDRTNaRER0bjh4b1p3QXlZRUxBYUFrNVhHdEwwVXNG?=
 =?utf-8?B?OHQrUXQwN3hzMkNwdWdtNldoM3JQSFkyOWdES1BsTkNwaFVsVkhKbEIxY2tv?=
 =?utf-8?B?L0hzSVNzb3ZPV0J5bEpzSnZGalVVbFBmRzdLM2Y3ZGZtSkluWmZOd3l2Q0tJ?=
 =?utf-8?B?N1pnUDBSL0loYU5lRk55eU9uS1k2Q0lhVGtGRktndTJySnFYTlZza3JiTFVC?=
 =?utf-8?B?bmNnTmJxMm96bXVoeXFQRE5INjRVVlE4S0VFN2x1NVRVbHNvbkgrYlc2Slhs?=
 =?utf-8?B?TnpZMG5CY2tkeEZMVGFkMHlUdXZBMUhTckd4QkgxdXZlUnVtQW52S0pRY3Nv?=
 =?utf-8?B?V1NkcmdKNVBSRVAweHlDcXpiWEpyUk9ETnU0QWdqM3l1NnhrQ2l6eldLOFFH?=
 =?utf-8?B?bW5ySEVuMW8zVjBUbVV0eStienU1RUJGMHZieVYrNmNoQThyQ1ExSE5ZdGNN?=
 =?utf-8?B?NEphWFUzSmc2N1luam8vVUxKYWJYVzBCQTZJMmhUcFhROURMRXBrcXMrc1l6?=
 =?utf-8?B?dTIzUWptSWZtaUNTRm5Zbmp2U1liTjFEdzJ3Ny9KM1FVTUdQakVxa1ZwK3Jw?=
 =?utf-8?B?R2IwNzdjaHJLNysvWlZyUC9hYVd5ZmhRdHdydnNnWUMyTVBvVzBBYmZ4eHI1?=
 =?utf-8?B?L0V6UmovckYvWnV3cDgrVi9oSkR5a29RVy91aEVXTVA3cUtRMy9ReDZSWEM2?=
 =?utf-8?B?OTVscWJjQm1sVGxURFlQQ2JxRzllcUp0MVZTVU0xbC96bStCTldUTDM1Z3Ix?=
 =?utf-8?B?M3B0dkFiTThOd1JrMmRGOUVFOEhya2FqaFgvU3JqZzhQZVl6Z1VXWlQ2OHFF?=
 =?utf-8?B?NHNOSjQ2bkxQNmExVUE0QURaM1JUUnNYMDlRNGo4Njl6RmlnLzNKazlCTEFs?=
 =?utf-8?B?WFo1VnFnMjVyeFVvR0JwNkFZa1Noc0ZtZ0xsaUJwMlg3b290TWxZRzlQWkdQ?=
 =?utf-8?B?OXVqTXhNVStCZjd6TDRNTW0rRGpSalIxbXc1TVNHc3JPanpVL2J1VDllTE50?=
 =?utf-8?B?NGNWdnUzUXBMQzNOa09SU1RLZzJoa2NMcDRGQnVlTFI3d3RERVI5VTJSL000?=
 =?utf-8?B?TVQ0V01UOTZyMTNJd0RwYVNHMzRlTFBqS2M0TmxHVFg2M1VJVkFua0Q4Yjlu?=
 =?utf-8?B?R1RqTW9CM0xUbXhjbmxycHVDazdSTWc3OVEyTVp1VlM2TWJ1c2d0WUNjcEtU?=
 =?utf-8?B?YUR0VGcrODNyTDFINDh2QWRURTdUaXpEVjJjdHpZUmZrbWt0c051ZGd1WXhv?=
 =?utf-8?B?Z0pMM3dhQVpoMTh0bmcwcitVaDJIZmw3RFZRaVpKNEdDOGgzc0dVRUpYV2wx?=
 =?utf-8?B?Z0l3NEMxS1lDeHd3QXFjYmU5ZlhEdzhSRzNrTWVHOGZzbjB4Zjd5aXM3aXBw?=
 =?utf-8?B?eGNhZ0kvQXZLY2ZsTG5maDFmM1lBZWJGMWgvbnF1MmdiRTZsTU5tMUNiZ090?=
 =?utf-8?B?M0ZPcjloTWUxSWVBSHFjT2lJTzh5QUlMMGVZdDdCRHNnblRybW95SlpFWkQw?=
 =?utf-8?B?YzM4Vnh3ZFN6elZ4ZzkyUFVaanJpTWkvZmdrQVZCYUNPcWk3ZXNNTmJLRkRa?=
 =?utf-8?B?UXd5dGZKb0V3aEl6MWZiOGxqT0ZPT3paa2pwOW1pN0xyRHpsNUdWTXdFQTcx?=
 =?utf-8?B?S1RoaXgzMmdYT2RYeHM3V3FCT0tmaTBHVUpyUzB0ZTFqSTFKV1YxYU5WZ3p0?=
 =?utf-8?B?UEFwM1p3TEhLV0dGZFhsY0pXeWJvMFlPLzZxOWp3OTRnT1lxTDhQcVc4Qmth?=
 =?utf-8?B?anJGSU5weEhYdlNrb2dhTGNuWFM3dm9aRTh1amxVSlJOV3RRcHFBWGxVMTJK?=
 =?utf-8?B?RXBQVEh4c0wyRjNYWExKamFFK3QwcGlZLzFocksvcS93NE5EV1Vjbmp1T2do?=
 =?utf-8?B?azRrVFFSa3Z5MUhEeWhkQzgvSERNU3EwSklCdFVOdUIyRzhRRHFtaVhzVVFk?=
 =?utf-8?B?blcxekpUN013UEVxbTRFZ3hYdXBUS0VZNHZrWmh1TisxUTR4ZFZVQVAyK0lz?=
 =?utf-8?B?VS84UTdaU01jSkp0dWpuckg1TUE0ZnQrc042QkxIcGZMdXRjcVdjZTBMSXJX?=
 =?utf-8?B?VlZINkVQZ0IxRmtLMkRFcHgyaHFScEo0bFJuNjRZYjJlQnBjVjZ2RzN4ZVh5?=
 =?utf-8?B?Q3lsSTgrSThoZjg3TzNWbDRpMWlLU3ZhbnlZaWlTNjlrVGtVK2Jobm5zQ3ZV?=
 =?utf-8?B?TllBU1NNUTlFbTJ0T1JvY1U2dUkvbXZVTm5zQVgwU3lxbXN0ZUEwdS9HQTR3?=
 =?utf-8?B?Ym9ZWW1lcS9zZnFGdndwYmV2bjRVbmFrREV6a0FBdEFHMTNHMlQ0dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0797230b-6964-4b7d-cfad-08ded909a180
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 13:47:32.1457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ElaxRPId9dZVfPDJ0deXFS7xtPdryW2Y8I7vQKUXmmK+nuq5ffzM1TLU5u5IOUHvZXHcujf5RR8NudcqAV5uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7305

Rust provides a `#[track_caller]` mechanism that can be used to identify
callers from callees. This also works across multiple level of calls.
As lockdep only needs the address for static key classes, the address of
these `&'static Location` can be used as unique lock class keys.
This allows a more implicit way of creating lock classes without having to
use macros.

Create `LockClassKey::from_caller`, and use it for mutex and spinlocks.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/sync.rs               | 37 +++++++++++++++++++++++++++++++++----
 rust/kernel/sync/lock.rs          | 13 +++++++++++--
 rust/kernel/sync/lock/mutex.rs    |  3 +--
 rust/kernel/sync/lock/spinlock.rs |  3 +--
 4 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 993dbf2caa0e..cf76fb37c460 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -5,8 +5,12 @@
 //! This module contains the kernel APIs related to synchronisation that have been ported or
 //! wrapped for usage by Rust code in the kernel.
 
-use crate::prelude::*;
-use crate::types::Opaque;
+use core::panic::Location;
+
+use crate::{
+    prelude::*,
+    types::Opaque, //
+};
 use pin_init;
 
 mod arc;
@@ -66,6 +70,31 @@ impl LockClassKey {
         }
     }
 
+    /// Obtain a statically allocated lock class key identified by the caller's location.
+    ///
+    /// Different caller locations will be guaranteed to have different lock class keys; however for
+    /// the same caller location, this may return different keys, e.g. if the caller is instantiated
+    /// in different object files.
+    #[inline]
+    #[track_caller]
+    pub const fn from_caller() -> Pin<&'static Self> {
+        static_assert!(size_of::<Location<'_>>() >= size_of::<LockClassKey>());
+
+        #[cfg(CONFIG_LOCKDEP)]
+        {
+            let caller = Location::caller();
+            // SAFETY: For static objects, lockdep does not touch the underlying memory, and only
+            // the address matters. `Location::caller()` is in rodata so it meets the requirement.
+            // The size check above makes sure that it does not overlap with other lock class keys.
+            unsafe { Pin::new_unchecked(&*core::ptr::from_ref(caller).cast::<Self>()) }
+        }
+
+        // A separate version if lockdep is disabled to avoid unnecessary `Location` being
+        // generated.
+        #[cfg(not(CONFIG_LOCKDEP))]
+        static_lock_class!()
+    }
+
     /// Initializes a dynamically allocated lock class key.
     ///
     /// In the common case of using a statically allocated lock class key, the
@@ -83,7 +112,7 @@ impl LockClassKey {
     /// let key_ptr = key.into_foreign();
     ///
     /// {
-    ///     stack_pin_init!(let num: SpinLock<u32> = SpinLock::new(
+    ///     stack_pin_init!(let num: SpinLock<u32> = SpinLock::new_with_lock_class(
     ///         0,
     ///         c"my_spinlock",
     ///         // SAFETY: `key_ptr` is returned by the above `into_foreign()`, whose
@@ -129,7 +158,7 @@ fn drop(self: Pin<&mut Self>) {
 /// use kernel::sync::{static_lock_class, Arc, SpinLock};
 ///
 /// fn new_locked_int() -> Result<Arc<SpinLock<u32>>> {
-///     Arc::pin_init(SpinLock::new(
+///     Arc::pin_init(SpinLock::new_with_lock_class(
 ///         42,
 ///         c"new_locked_int",
 ///         static_lock_class!(),
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..447fec291cdf 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -127,8 +127,17 @@ unsafe impl<T: ?Sized + Send, B: Backend> Send for Lock<T, B> {}
 unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
 
 impl<T, B: Backend> Lock<T, B> {
-    /// Constructs a new lock initialiser.
-    pub fn new(
+    /// Constructs a new lock initialiser with a custom name.
+    #[inline]
+    #[track_caller]
+    pub fn new_with_name(t: impl PinInit<T>, name: &'static CStr) -> impl PinInit<Self> {
+        let key = LockClassKey::from_caller();
+        Self::new_with_lock_class(t, name, key)
+    }
+
+    /// Constructs a new lock initialiser with a custom name and lock class key.
+    #[inline]
+    pub fn new_with_lock_class(
         t: impl PinInit<T>,
         name: &'static CStr,
         key: Pin<&'static LockClassKey>,
diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex.rs
index cda0203efefb..3675ce244e08 100644
--- a/rust/kernel/sync/lock/mutex.rs
+++ b/rust/kernel/sync/lock/mutex.rs
@@ -11,8 +11,7 @@
 #[macro_export]
 macro_rules! new_mutex {
     ($inner:expr $(, $name:literal)? $(,)?) => {
-        $crate::sync::Mutex::new(
-            $inner, $crate::optional_name!($($name)?), $crate::static_lock_class!())
+        $crate::sync::Mutex::new_with_name($inner, $crate::optional_name!($($name)?))
     };
 }
 pub use new_mutex;
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index ef76fa07ca3a..091167ceda66 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -11,8 +11,7 @@
 #[macro_export]
 macro_rules! new_spinlock {
     ($inner:expr $(, $name:literal)? $(,)?) => {
-        $crate::sync::SpinLock::new(
-            $inner, $crate::optional_name!($($name)?), $crate::static_lock_class!())
+        $crate::sync::SpinLock::new_with_name($inner, $crate::optional_name!($($name)?))
     };
 }
 pub use new_spinlock;

-- 
2.54.0

