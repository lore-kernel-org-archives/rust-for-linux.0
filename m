Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020085.outbound.protection.outlook.com [52.101.195.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748E643CEF4;
	Fri, 10 Jul 2026 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700490; cv=fail; b=A0k3l6aKFZODJEEjT4TJr858n6daViOyN71rn9hA+RRjW28pmcMlmLQ9rwOs3Mj2OWvj7UivH3rpEsMstHYtPqwkXCNHXs8/m+up45YtMgEx6oPih2n/H3/f4ONrIxzMCLkoqegoJzHRxqmgVI0XJa9EnBqxvyhksVwuFbFs+CQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700490; c=relaxed/simple;
	bh=r+eRuRK7oALh0nANLMNRVXSRB6aZ3nAtRMvyY/C8Ou0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ptpcl1bJWFzXU/hQE8NSj/jtY4ohPQDiG2zUDTADL8znT2ERcDXu8bWD4V1KcZ4fCjOQmGZmPvgON0NTbWYEciseTrB12LUZGCfFIh/1O8OU2HAWEgvskWCtXivPn2fJZUSNOa7BJ7QCwec7vh9NP+IiV1SBE3l/XYyYS0ilNus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=S2XROsqj; arc=fail smtp.client-ip=52.101.195.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="S2XROsqj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yq70W6eQxBqOCdR6ihZSrRxal4gc7eg5zg/0eoax8Gw/8QGorLnV1eA7ip2EVKnVLa2IRAuhZYf0HeqRfrGWFTjCPdYpV9BuO3Pu5iW90SKt+/FSqHyBQC1ZyT9vqPQY7501hg7ieukxB7pTmb0RmSzUbUc2b/dSIIb3HX2iyi/hts0gkD5LH1P+XqSYgNwyM87RQ9P28ALqf4/m025pEdfrz4QJMDNotGATNyOSCwPCTbcS/DtWozkPwm5jM9Pwa3mZXc2rG6BJv02kRR/x2SdZOsgidPVTd7Nsu9vYWXGhQsaX1dng5gnbzOZn3oAEsSXZ2aDcSnvTURPeuUsofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0W92xuUpeu5/pJ/bomc3UyY87I4mtEygWoVPjn6bNw=;
 b=EjHgqqwcifgC+3s6P0UCZ0WTFNH77dPEggPKkiwZXMtlOA4Y6izz2taSR8yiSRIZkGZZGDZuz+VPhXSZYgx55h6mtHZzLFaw6DqlD7oSwaRsVJrEeNQmDTsWeHM9mJseM2S17BnYyeRxwGb6t8jbd9Z/mObKpwpgWVlSqUy7dUgSXsaLcQVWp7RPBiD5v8dWCGH1UgluPQXZmUvPwrJ7HqVmbP7PNCxmDC7WnIi0QWkey8uTk23PdMusJXgOfoFYsKJN0KdJNgMraQwtrDD5YYzQ/kTx+KKERRiAgcCYhETWkVcNTTt1bMJU5pyeD87ytW3V+NF67DKS6G2P9hbEzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0W92xuUpeu5/pJ/bomc3UyY87I4mtEygWoVPjn6bNw=;
 b=S2XROsqjUrUkfUuIObru6na8TUfmj/O0dbjrnUKUz8KHlidaZ4eUc5/yFVd+Dv6slagSDwzNER785bD0bPsSGzdXt32HYemgk2JsbUFNPETsW7XQbKleSaHmK5oOOfUBjs6g1ynkeU70dYgUyCg0LQ2GI0QcavW5cyog/4FrzLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7266.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:225::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 16:20:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 16:20:51 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 10 Jul 2026 17:20:37 +0100
Subject: [PATCH 7/7] rust: pin-init: make `[pin_]chain` unwind safe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-pin-init-sync-v1-7-8fa16cde87ae@garyguo.net>
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
 Gary Guo <gary@garyguo.net>, Mirko Adzic <adzicmirko97@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783700449; l=2706;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=Pkk6Yum2nzmWmA2LAwLGyGWoThcn+xWvd4U5MbxeMv0=;
 b=qp4XVikxB78Msrz1rpzaYE24VLOZY9pgBYNZHV3VErnwbVumqgg3pSoB/S26tCkiV19m7pvsV
 FPrnXnkw+TRCSMTSdYy8AOwBFG8Kbq7/zY/4wdmzzZpyiF1Hpt+qymS
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
X-MS-Office365-Filtering-Correlation-Id: 0ada1913-23d9-43ff-103d-08dede9f35e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|23010399003|366016|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4tY6gpKYTQf0e8GtswI6Okep/zVrmcVAuQZpCClyg/ipXRQaAb2mXvYuG5sbtW3e1s5E5zNsmwu7gC9IVbEy8fhkAwiI26kGvYJrB5ByCQzfXoxaU7WfVTtR3dwU/7D93AZz1Hi5RVutPMujx7AJlmZMo93/jnd258J+qg44+JQHUTGNyoKozkzkdQtksm5smWGtX1vmCklJasGv0xp3evkgNa4aejcik/+Fc7AJLyOt6g7GJy3XeAhvnAXkKR7Mm2CioCid3qCj8LoBtZfEDroTKElPuTc6w2ReXzAozG8I90zNlwdBxxeJEMZ63fklTA485NpXqKD0+0ZrTBBgcDjEU7mYVd2CVD0hf7v8N+67H85bVPvDdVF9GIMtpepdVYMjyOeSB6hzvKw5JDe48sDuiuN/c0++VZ+xbxUf5fPTVOjXVBRxes0GykbkFbWz4X9n3IokG+mN5K0MpPfsiGASUvY86kQkUhSA7J0QXrIa8pZ7wc4RvU4eS9NYtKCL/0y4qH9tpa/rth56uOMdbDCXEyXvDbqkDL388JU76ZSlWLMoH2ITvK2+KWx+EZn7wU3O4ZabkVbwu88bc/V9yNqpzXfU1eQnf6+ML+pq4UUmB3BMJ1P6BpnKzBzmmITMkXeGV09guPPdgwRwK5JZiBu+rqzESxsq85uiR+dkp/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(23010399003)(366016)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akRMS0IzQjhJbkhNWjFXVllKaDZ1UjJMejJUZGpyVUkvUEUzU2RDblI2MGla?=
 =?utf-8?B?Y0VZMlZ6N2orc1lOdHJPVkZhdUpQbCtWQmcxOGdzYVhhditFUmRUYnc0TGl3?=
 =?utf-8?B?ck9Yanc4VVlNeUQ0ZzNFSXRhMk5kYTA1S1R0blVGOHlLZ0tPY2FWN1RxVHdD?=
 =?utf-8?B?QTdFUnByTW56Z0lSZE5FUXB0Tkk3MWJZR1M0L1RkalRVcVQxOEJVeUNka1Nt?=
 =?utf-8?B?WHlOYlJmRm9vNDJ5Y00xQzV1cUt1NFJ6QkJBNXZLc3Z1YkdkUjdYR2wxT1Jn?=
 =?utf-8?B?REo4UDFSZUFHZ2RtNFovaVJPT1lKY0xLTEIrWVZFemlENEFyd2xyanMrck1E?=
 =?utf-8?B?QWVwaFQxa3I1TSs1MzFYeWZiTGV5WFNPdVBqUkdISExOVDlqNktROFBHbitM?=
 =?utf-8?B?Vi9tY3RnS2diQ1FvY0FxdVM4WHNnSjduWmo3b2MyMll0ZHVkRDdJQU9sMm1U?=
 =?utf-8?B?YkVJYmVNcmJTUS9ESmt2RkZMbExNNWpla2E1eE51VHpRWDJRZHVweEQxZjM3?=
 =?utf-8?B?T1lwdW9KVmN3VGQ4MTlsVkxxUEl3YUFValBCelNoTWMyanBTU1pMcmNROFR0?=
 =?utf-8?B?QzlpY0MwREM2b0VKTkg5a0hxVHgzanpEcVdneER5QTNvaWNVQ0lSbnVyNzAz?=
 =?utf-8?B?UkFIaVZxNzd6U0Z1dzNSQUhKVUVUdG9RcllDV3Irc0JYcXk5cU50U0JoWjlE?=
 =?utf-8?B?bTdoODFHMzNmOFVHK09Kc29GdjN6NWpKQUpYWlM4QVBUUzluSTQvQkN1enYx?=
 =?utf-8?B?cm0yK0ZmeXc3RFVabmxwdGFoMy80SXBHV09PYmNwaHNHMVR4cHkvLytDaThl?=
 =?utf-8?B?OTYyZGZlUi82WUxFMTNVNWFDY0dxQVc2ZkpQVjQ2ZUZ2QjBKUzZZeTNydVd5?=
 =?utf-8?B?UW0zNktmbUpramNDcmZCQ3l5YWFtZk5hRlFCb3pwaWlIdE4yYk40b0szWm1R?=
 =?utf-8?B?K2hrQTVSajRyc2tSWS9xQ3R4aDd5YkQrWXNNeisraVZISDZ6dkE4U25ERGZp?=
 =?utf-8?B?NFRMQWJGSU5xOWp5NDNDZmQxaUljZ1dFYkhOSyt4NXVBWDRVbnJtZHdVZmdV?=
 =?utf-8?B?N2FwdmZWT2ZqRDNZQXQyRGlXYnhwbkZTRCt6c1hvZzB4QU0vdm8rZEJhVUFX?=
 =?utf-8?B?SWhTSHdrWElkV0ZnNW90WFQwd3BLL1BZdU5aM2ZOR3dQUWljeXVERzJjNHBw?=
 =?utf-8?B?ZmtEYXhsQkRKQWRRNUpPWGF4RFI5NWR2Q1VCNTd4WDNqdzlFVkV2NzNuZVFQ?=
 =?utf-8?B?YmZ5WDF5VmZhUHFUakdab3pGWXlXVElQcjJWemNudVVLSEZRWURBLzg4a1pY?=
 =?utf-8?B?b3dZM0FOYWtkUERXazdybWpwL1RWNnJkTEtiK3BHcW14YTViN0krb2d6RXov?=
 =?utf-8?B?Si9SVnhoOGlqOWRSY2ZqWVlEczh4Sk5YQnUybXBQKzFHcGtDaUFsSC9wdkpF?=
 =?utf-8?B?RzNzMDRjVGlvMUVHcUxwaHB6TS9rWW1RU2Q4N1JjR0lSbC9uekZ1d2JvUzl1?=
 =?utf-8?B?QS9Mc1ZKaFk4Lzl4TzVkaWd1NWpBelkyMDBjZ0tjZFhhRnFMTEtmRzdiYjd6?=
 =?utf-8?B?WXRlcC9RWHYrSVpENWtYMUZWQ3htWktscE9kdEEzejYxY3NiUklxU0dzL0Vh?=
 =?utf-8?B?azF3REM3Vk9BMXErWTJNSjJ6VURWOTI3YjdyRWhNeUQya2NWS2lOL0R3bk5H?=
 =?utf-8?B?TnRmZktyL290emlGZnJ4SDYrYW5sWGtYR1ZBVyttUnlqSytVdllmQkxOWTB6?=
 =?utf-8?B?RUJCRFRPczBpcFlkQTBvY2labmdrS2RwVEJRS2NuUkgyaFo5VGJGSUFqRmRu?=
 =?utf-8?B?ZFlCUTIwSkZEeW5iUlJKNzRBMmRuT2tXa0cwZm5ieWJBS0NFTGExTGRHQTJ6?=
 =?utf-8?B?MmoxMzNVSDVoOGI3b3FvR1Y0enFUbUM2cjRwd1laSHhuRHZWdlFXbGxTMTBH?=
 =?utf-8?B?TVFOMmxCbUM2Ry9MS1dBQ0RndDJlTHRRbDU0M2JCRTB3QnJxU1ZucUQweDhr?=
 =?utf-8?B?eXQ2TXBVQUhoSU9LMXovWkVhWFIxQ014NCtnL3lYUDFwb1gzNXI1T040RXUw?=
 =?utf-8?B?QW5nSzhRbWlMaEVYTUsxbkhSMXZLY2p4NmZGSnVNY1dqc1d5bU82QWl2Unl3?=
 =?utf-8?B?YUJjWDA1OVlxWU40N2Vob2sySWRuYmNCRGh1YjMwcGRzOUZvRXpPMEhYUmVT?=
 =?utf-8?B?MjZDZ3hVaE1SQ3Y5c0o3d0pwYnBHbG5JZWR3d0d6b0JyeXFWZW5mTFFZTGpU?=
 =?utf-8?B?ZGRWNTZtZVlUam0rbUpXeVd0d2Uyb3liQi8zUmZuMkVPaDRQa2dVd2JISHR6?=
 =?utf-8?B?OFJycnJBODFvV0MzZ1QxbU15azB1aEN0dkRYS0tMWU9EZld4VGp0Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ada1913-23d9-43ff-103d-08dede9f35e6
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:20:51.9161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CgnFZE++3PawrFWO4hIOyEcn51RM1PubocjhFlb7dyWrduhfzgjOww64gYGDFf+c5NdyNPdO72VCZ0fzZYMxbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7266

From: Mirko Adzic <adzicmirko97@gmail.com>

Add a drop guard before the call to the chained closure so that the value
initialized by the first stage is dropped if the closure errors or panics;
`mem::forget` the guard on success.

The previous code only ran cleanup on the explicit error path, leaking the
first-stage value if the chained closure panicked.

Reported-by: Gary Guo <gary@garyguo.net>
Closes: https://github.com/Rust-for-Linux/pin-init/issues/136
Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Mirko Adzic <adzicmirko97@gmail.com>
[ Fix Clippy missing safety comment false positive when `slot` and `guard`
  creation are merged in a single line. - Gary ]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 3fc4a674a487..ef9f20b11034 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -959,13 +959,11 @@ unsafe impl<T: ?Sized, E, I, F> PinInit<T, E> for ChainPinInit<I, F, T, E>
 {
     unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
         // SAFETY: All requirements fulfilled since this function is `__pinned_init`.
-        unsafe { self.0.__pinned_init(slot)? };
-        // SAFETY: The above call initialized `slot` and we still have unique access.
-        let val = unsafe { &mut *slot };
-        // SAFETY: `slot` is considered pinned.
-        let val = unsafe { Pin::new_unchecked(val) };
-        // SAFETY: `slot` was initialized above.
-        (self.1)(val).inspect_err(|_| unsafe { core::ptr::drop_in_place(slot) })
+        let slot = unsafe { __internal::Slot::<__internal::Pinned, _>::new(slot) };
+        let mut guard = slot.init(self.0)?;
+        (self.1)(guard.let_binding())?;
+        core::mem::forget(guard);
+        Ok(())
     }
 }
 
@@ -1065,11 +1063,11 @@ unsafe impl<T: ?Sized, E, I, F> Init<T, E> for ChainInit<I, F, T, E>
 {
     unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
         // SAFETY: All requirements fulfilled since this function is `__init`.
-        unsafe { self.0.__pinned_init(slot)? };
-        // SAFETY: The above call initialized `slot` and we still have unique access.
-        (self.1)(unsafe { &mut *slot }).inspect_err(|_|
-            // SAFETY: `slot` was initialized above.
-            unsafe { core::ptr::drop_in_place(slot) })
+        let slot = unsafe { __internal::Slot::<__internal::Unpinned, _>::new(slot) };
+        let mut guard = slot.init(self.0)?;
+        (self.1)(guard.let_binding())?;
+        core::mem::forget(guard);
+        Ok(())
     }
 }
 

-- 
2.54.0

