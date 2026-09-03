Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021099.outbound.protection.outlook.com [52.101.95.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB804D90B0;
	Thu,  3 Sep 2026 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448923; cv=fail; b=fxzjTgCcBoAg3jh2lI989vLbJNhU0PbLqxvE+pGYqFYN/EOd78ajs+mZK00L/3WvICCZL6Hp8L+2aZEH2N0bUhfWKm5C8qkvW+huKzavm8KsOIN1cr7I5KEoADOYsJgzbhJmNXVg2z4fM6WVizH0gXEWy3ALuCgvx0JLYAEQNoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448923; c=relaxed/simple;
	bh=IEau3PB1AzziebJR9htwnouuuLIIK8ZRMhRD8RotZvk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VTIRgJjee9M+UONL1ES/QPW5fP1UPQ8FX0KcwjHcbTRoa0sFI/UHvSTHbx+u/faGCozOWRl96xgWjPyluUWRK9j3GYgxtipUs+NKmnkpJPqr0Jvw1LvtgltqCsCu6hxsJgwVc74EvDazdepLEcfIlVr2qA3QhaSKfERc2YEvDO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=N9thQmet; arc=fail smtp.client-ip=52.101.95.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="N9thQmet"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epILXPHmOtc13dYGSTJGEA8lRePS6GQR+vmM9ggXvCcMGKQ/q4D6mmo5QDYkUMZerZtYp61z3ygcoCSP4kGjYpwdaA07Q3lw+R+D0NlGvz6W+rzGKnw3G3HqZ4QaWV2dGIljUw6rLWAVa+9Yed8gJzQ8qLSi6pincbh0/fVGdhP0poJY3V8Rl68oUJwiT1eeWu03zB98r6k91tUqgBRCTcNfyEg5h7U3zP9nDDNPhOJa5E8b2xv/E+QZFzBm2fbxEusBgNsh0zT6abbh0u8IUtwyVuloupKIhZ2WapFYwYVB371pncKKFnvfLad8a3HjrII5jjGyPi+rSG4QLdYtsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zsru1u+eV11/IlCxkNqrzyeQiy3X3b3BhXjXAOf4RZU=;
 b=A1ter/dkInhX7bpPaTXW4M1aOvOquaMgaoYpW4d2jAvgN8Myj58SqRqvHA9JZwRJTjZsmk8Mu8AEbsn8Z7A0z5tAvLddJExCgv/KlPKjPLL7LYSSDy+CF73jYVHA0rFrMOrU/kcaeigT+KUIXuj8QxsT0UQPqXm8rooCDImtkdYQh4YDRkijejMoe4RVuLd/U3yBznWTR6MlU6J+/yd7mtwNxNT2+whT5EvLjO5f7Z1WuN2NZgSK01ox2TUu+UHg1lEaS93WE339VBfrenVGFYoX7/IPvKhwSN5hTjGZWGU6CcC5plo7L5vEbRTzpxTynsbJOZo3eLlVBKneUHEu/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zsru1u+eV11/IlCxkNqrzyeQiy3X3b3BhXjXAOf4RZU=;
 b=N9thQmetDfA/eS5jPTnWdBZwAtZ6bG33pWpsAaDve6L+x09GIXRpKgvs2Lam8YxedNJGTY2vJDeGM1kljUAd45DFwJkQXozhNxs6NPb7CCFTHQn9A1vkODQ14E2CFWCnYACY5y+A0nm1Tbmv9wBcS9LDAGzWyjjG5eXfsl/XHbA=
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
Date: Thu, 03 Sep 2026 16:21:45 +0100
Subject: [PATCH v2 2/3] rust: const_eval: allow const trait method
 invocation in some contexts
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-cv-v2-2-e93b1613e40c@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788448914; l=6701;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=IEau3PB1AzziebJR9htwnouuuLIIK8ZRMhRD8RotZvk=;
 b=+HbUGP/he15nUZ5lPHJGvyETo8dE7KMT9aToRUkg4fT/UOqjcu7MuCZcaAUC53COC+cQN2E6h
 rdXkn+GIQ/VAZgq670rEvbTqlxhuCIcPkSKsznoMSgeDG+2ECzes44k
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
X-MS-Office365-Filtering-Correlation-Id: 0ebc8baa-68d0-4cd5-8d6c-08df09cf16da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|23010399003|366016|921020|10067099003|56012099006|5023799004|6133799003|20052099010|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ki4FdnBfmX9G/mqVE6S+TSbB3ZHswaK78wA11SRR8uhU/+90R4p9ANLsoHqEoxleSsV6PMkanJAYw09DlNSzTYZGkwAIDub6v5m8fu2oTamQ8MeKh7BABzoGL/GvyyM9XRe5FWYOGBaYGixED8uOj2k7HaLq94yG6FmP0yvgRE6Kh0NoI9s0fjmIDe2jZhi4Y/M9HR1Ge/HPa/Fy+NZlf18Af9cS0yzzR8Aug+8FNWpQOlSQJQdPLG8Gcf8nXOsQEDXMBh4+U1ZDnciaIk4dTA48hlEg6eoYuueRJdAwnfYGJvdj+tFNFkdoU0VouBXtF4ZTV5Wp0O6FALzC/fE4Yx2wmkGr2g9Uw6wdEvZgJee5GhEhCXNjo1mbw/UeluMvmVchyL37Y8Pqh7sC4DNftFcmT88ITxHjLfYLRWKKYJs0jVDcP973SqYst1F6SH1Ke1dfg5sg6JBTFgsWLIp+QAL7/sJ4FLJvfxvQ79bPLHDKsT1ek+0PKm5y3AZ+nQMyTaJlArCOCne2b8Qoa8RtRHMIoUP1ky6c7Lthx1i021iyMp2yqQW+UynOL3fzfX2HqHVFLfQlp8kmfKyXEuyAmR8WAXuQ5qtjhihsUeN9DFAWf8y8EBl6n3wRignnyMfRhqsR5+uOwy+eEt8EqvWU1vn90mCTHA2NefVBFLyS+4WPZ7D7EJKgPEDpoI1NYiSQLh+xfAedsCUye8mrtPAozQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(23010399003)(366016)(921020)(10067099003)(56012099006)(5023799004)(6133799003)(20052099010)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDVTaUhpYWZ1S0R1K1NrWFY4ZENjWDlycDB0TGJadGtuVlF1aFpTZmRpejRK?=
 =?utf-8?B?VmNyNjJ0R2NGcDFFOUw2dUVFdkVMczcyY003MWYraUduSTd6b0xyQ0JSaEVY?=
 =?utf-8?B?Ym5Tbnp3SW1TNEEyN3JnL2xrYTNyalo1ZE9RakNLV295NnNCOVliVUxndkRN?=
 =?utf-8?B?aU1oaWpuelNVdTBrUmZSN3B5REtjMXp3V3BhekkyVlRJT3dGbjBhdytSMldZ?=
 =?utf-8?B?aTRtVDRtdmVyR3lDRm5ldi9oaWxmM0Z3R2JjVkxLMTA2T2EzSGhxWFozRCtK?=
 =?utf-8?B?V3YwMTN4QlB3TG4rYTFORlJOaC8vVmF5SnIxRGp6Sng3d1NWSEFIWXFZMWVD?=
 =?utf-8?B?S0tUVFZlVTF0RElTbWo0VSt0Z1plcUVTb1J2eUpwWHVxd1dnb29ZekpuZVVq?=
 =?utf-8?B?cUlZdC91Zmk5b2RxdThtalNXWDJhNnAxdkFKU2JHN3lqTDZaZ3l3N0RlQlFJ?=
 =?utf-8?B?QzN6OEU2VFpIYzVFaHd1ZUlEL3AzM2lDUmd5V1pYQ3BKNU94aVFONFQvVWQx?=
 =?utf-8?B?d09yWTBtRUJ2TXJ0eEkxZ1JwdGY0L0lnRW9qZGZBZ0FNT0xHMnhDMGJBTUlJ?=
 =?utf-8?B?cTJQblNVcGpTbERZU2hKbE1CVTlmczNDM3dRYzNOQWJNU3VJemRmRUdpaStx?=
 =?utf-8?B?R2taem5UZ3FOU1pZRWdYU1p3NzFqT2dEeEhVTzNjMmlLKzl1eUk4ODdRWWhZ?=
 =?utf-8?B?ZG51Q0VRNlIwSExxT0hXc0NRRkcwZDdaZy9EWCtlR0tneUI1eDdsVnRtd0FZ?=
 =?utf-8?B?TkNzdlZHNEpXS1VGVHBVQTB2eDA3V2krQ1JIdzR6SVlweHUwbkY1WUI3UjhT?=
 =?utf-8?B?U1UxS3NWaWZoSW9UU0puZFRqQzFId01kRDNxWk9zbEpJMEpSbWd1OHFScmo3?=
 =?utf-8?B?S2tkWlZiOE80dXpwOVpQYkxFMkJ3dHZzaStabWRZQzNIZzk5OW5qaGVkeEtu?=
 =?utf-8?B?Z3p2aVdzOHNOaFVSVS9nTUIwQjRVUjBSc3RncFFGcGI4bk0rcGk0NFdEdCtq?=
 =?utf-8?B?cFlhY25naVVwM3pVR1doTGVBOGN4MjROc0hmVytaeDdOdjV4Z2FtdUF2R0FW?=
 =?utf-8?B?eUEweThva2tBYnBzdjU5RnpuWTBpQTI2THA4SGttUWRaZWhZNkNwclp3cTVF?=
 =?utf-8?B?QkdDS3pSVHV6VHdMMGEvZzgvWWJMdUF3TlQ5dFVMRkdwbU9jeldxY2lTaTVz?=
 =?utf-8?B?YTdRNWNzWE92aEg4M0RCWSsyYXYraEN3OVRTTjcveG1pZ3B2ZmJFRkVkWHVh?=
 =?utf-8?B?cWN2SVY2SEk4cHFYZUsxOFRTbGIzQWNocll2T0NydEFGS3AybjJzMG1HWDF3?=
 =?utf-8?B?aVVJVmdFZU9Oc0toNFIxNWVlZ003SHlLMnZvL0p5elBrU1hlY2svazZ5OEQw?=
 =?utf-8?B?T1NGVTFwckhqRzFqK3FXVjl4dytWL05SZGM0S1VMUVhPWmJnVzE2bmFPSjdH?=
 =?utf-8?B?L25Tbjk3WDNBTVJhb2hadW5jR3d2OUxhckIyZ243MGJRcWhqbTlNdnZNZndl?=
 =?utf-8?B?bUtzT0hrbGlYRTVnVkN0dTFtTFhwZ0ZsR055bGhXUVpacys5emt0OVZNZ0lu?=
 =?utf-8?B?aExsbmpQK0hLNzNtSHltTFRPMTZ5MVZFRVR3ckE0Y3BMTVBoVE14emNYRExB?=
 =?utf-8?B?NlhqU2NocWtTNnpWb0IwYlFITEdYSDZpQ1VKOFEwYzV1MzNLNkFTMGNaUUVp?=
 =?utf-8?B?aldVeHJFdCs4WTROd2gvK3Uyb1FvK0ZGNFM1bjJUMENsWVFtenJJSVlaaktR?=
 =?utf-8?B?bzVDNHAyak0vdHJjMU93RWFZbVByT2JNa3Z2QTkzZGdEbG9GN2x3bWZZUUNF?=
 =?utf-8?B?dmdIc0JBV2NLS0ZKMzJBV3pqYkg0dWpsYjlzeFFSNXcyT2ZkZUhFczluOUFE?=
 =?utf-8?B?Q2Q2bEJqdzNJbFo3MXFybXNBZVUyc2tKK0ljME9nUmhxSUlrS28ybGpYUlE2?=
 =?utf-8?B?L2VIK1MvbFZiQnhvakdzWE5yNlQ1bmMrNGxtNzUvc1hTTVJuQzVRSEpnNkJO?=
 =?utf-8?B?bndpb3R1K0k0blNoN21UdERRMGt1Qm9jT2ozNjF6NXhVVEpEYWlOUHI2Rm45?=
 =?utf-8?B?S09SMndPa3lHRWhwdVVhNWVuM1ZBM1JKbkxHSUFJUkZmV1E2bFkrZW9tRGEv?=
 =?utf-8?B?RG9XSmh4Tk5na3lBOG5KRTBBb2xSUUhHLzJnSW5JUmE5YXJJVXVYUGpjTEpa?=
 =?utf-8?B?T2RiVml1VXJFN2hYUCt2QmEzL1B5QmEyRGFOYitnOWZRMzJPbXl5elorajhK?=
 =?utf-8?B?ZWZUaGdDdFMxM0M5SFhWOGZFKy9KSks0ZElhTW1uSVdJMjduMlRUSjFOYzQw?=
 =?utf-8?B?L0RFTkRMQlQ5b2tVOTNQQWRwTTU4SDA2MG5iQlFITk5zZUg3bXhDdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebc8baa-68d0-4cd5-8d6c-08df09cf16da
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:21:55.6909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuFDzAOMkk0bsZIyvHZr0ZQnMKMstK/qahhYkY08awSrgYErFY3O9v+1E1MtPQn2g7Z/4T+Pm5687HelNdZs6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2223

Rust does not yet (as of 1.98) have stable const trait impl support; on
1.85 it does not have unstable support either. This leaves us having many
free functions that do the exact same as trait methods.

Create a `Const` wrapper type as the central place to put const trait
methods on as inherent methods, and a `const_call!` macro that dispatches
to these inherent methods as opposed to trait methods.

`const_call!` would check that the signature actually matches, and provides
some additional inference help. Once const trait impl is available, we can
also easily just convert the macro without having to touching all users at
once. Implement it as a proc macro, so it can accept the normal method
call syntax.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/const_eval.rs | 108 +++++++++++++++++++++++++++++++++++++++++++++-
 rust/kernel/prelude.rs    |   1 +
 rust/macros/const_eval.rs |  31 ++++++++++++-
 rust/macros/lib.rs        |   9 ++++
 4 files changed, 146 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/const_eval.rs b/rust/kernel/const_eval.rs
index f1b79d82549d..2a6ea3f7b693 100644
--- a/rust/kernel/const_eval.rs
+++ b/rust/kernel/const_eval.rs
@@ -2,8 +2,114 @@
 
 //! Utilities for const evaluation.
 
+use core::{
+    ops::Deref, //
+};
+
 #[doc(inline)]
 pub use build_error::assert_in_const_eval;
 
 #[doc(inline)]
-pub use macros::const_eval_only;
+pub use macros::{
+    const_call,
+    const_eval_only, //
+};
+
+/// Constant wrapper type.
+///
+/// Rust does not yet (as of 1.98) have stable const trait impl support; on 1.85 it does not have
+/// unstable support either. Only inherent functions can be marked as const. There are a few const
+/// methods that we want to add on core types; and this mean that we cannot use extension trait on
+/// them.
+///
+/// This type serves as a middle layer. This type is local to the `kernel` crate, and thus we can
+/// define inherent methods on it. For core types, we will define it for `Const<Type>`. Other kernel
+/// crate types or even downstream types can also utilize it by defining inherent methods that
+/// *receive* `Const<Self>`.
+///
+/// Caller should use the `const_call!()` macro so it also checks that the type signature matches
+/// the trait.
+///
+/// # Examples
+///
+/// Say we want to define a extension method on u32. We can do
+/// ```no_run
+/// trait MyTrait {
+///     fn trait_method(self);
+/// }
+///
+/// impl MyTrait for u32 {
+///     fn trait_method(self) {
+///         /* impl */
+///     }
+/// }
+/// ```
+/// but we cannot mark it const.
+///
+/// Instead, we can do this
+/// ```ignore (doctest is outside kernel crate)
+/// trait MyTrait {
+///     fn trait_method(self);
+/// }
+///
+/// impl MyTrait for u32 {
+///     #[inline]
+///     fn trait_method(self) {
+///         // Forwarding impl
+///         Const(self).trait_method()
+///     }
+/// }
+///
+/// impl Const<u32> {
+///     pub const fn trait_method(self) {
+///         let Const(this) = self;
+///         /* impl */
+///     }
+/// }
+/// ```
+///
+/// For local or downstream types, implement it directly on the type with a different receiver:
+/// ```no_run
+/// # use kernel::const_eval::Const;
+/// trait MyTrait {
+///     fn trait_method(self);
+/// }
+///
+/// struct Foo;
+///
+/// impl MyTrait for Foo {
+///     #[inline]
+///     fn trait_method(self) {
+///         // Forwarding impl
+///         Const(self).trait_method()
+///     }
+/// }
+///
+/// impl Foo {
+///     pub const fn trait_method(self: Const<Self>) {
+///         let Const(this) = self;
+///         /* impl */
+///     }
+/// }
+/// ```
+///
+/// For caller of the method, one would simply replace `expr.method()` with `Const(expr).method()`;
+/// although the auto-ref coercion will be lost, so it a method expects `&self`, the caller would
+/// need to explicitly use the `Const(&expr).method()` syntax to call it.
+pub struct Const<T>(pub T);
+
+impl<T> Deref for Const<T> {
+    type Target = T;
+
+    #[inline]
+    fn deref(&self) -> &T {
+        &self.0
+    }
+}
+
+// Provide inference help only. Should never be code-generated.
+#[doc(hidden)]
+#[const_eval_only]
+pub const fn would_call<T, U, F: FnOnce(T) -> U>(_: T, _: F) -> U {
+    todo!()
+}
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index ca396f1f78a6..8f4c8cd2d8a2 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -91,6 +91,7 @@
         const_assert,
         static_assert, //
     },
+    const_eval::const_call,
     current,
     dev_alert,
     dev_crit,
diff --git a/rust/macros/const_eval.rs b/rust/macros/const_eval.rs
index 0664888d3b38..10a4a93f905a 100644
--- a/rust/macros/const_eval.rs
+++ b/rust/macros/const_eval.rs
@@ -1,9 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use proc_macro2::TokenStream;
-use quote::ToTokens;
+use proc_macro2::{
+    Span,
+    TokenStream, //
+};
+use quote::{
+    format_ident,
+    quote,
+    ToTokens, //
+};
 use syn::{
     parse_quote,
+    ExprMethodCall,
     ItemFn, //
 };
 
@@ -22,3 +30,22 @@ pub(crate) fn const_eval_only(mut input: ItemFn) -> TokenStream {
 
     input.into_token_stream()
 }
+
+pub(crate) fn const_call(mut input: ExprMethodCall) -> TokenStream {
+    let expr = input.receiver;
+
+    let expr_ident = format_ident!("expr", span = Span::mixed_site());
+    input.receiver = parse_quote!(#expr_ident);
+
+    let would_call = quote!(#input);
+    input.receiver = parse_quote!(::kernel::const_eval::Const(#expr_ident));
+
+    quote!({
+        let #expr_ident = #expr;
+        if false {
+            ::kernel::const_eval::would_call(#expr_ident, |#expr_ident| #would_call)
+        } else {
+            #input
+        }
+    })
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index e47a8c35ccff..262539cccf38 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -339,6 +339,15 @@ pub fn concat_idents(input: TokenStream) -> TokenStream {
     concat_idents::concat_idents(parse_macro_input!(input)).into()
 }
 
+/// Call a trait method in const context.
+///
+/// This is a polyfill for Rust's const trait impl feature. Only work for specific methods that have
+/// dedicated const implementation.
+#[proc_macro]
+pub fn const_call(input: TokenStream) -> TokenStream {
+    const_eval::const_call(parse_macro_input!(input)).into()
+}
+
 /// Mark a function as usable from const evaluation only.
 ///
 /// Build will fail if the function is used for runtime code.

-- 
2.54.0

