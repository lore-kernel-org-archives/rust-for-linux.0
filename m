Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022085.outbound.protection.outlook.com [52.101.101.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E533033DE;
	Wed, 22 Jul 2026 18:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784746241; cv=fail; b=qsIPZW2a6fS6xVB55ox2UCREBwxx+UbDKDTg4XjVz/00Dnb33q539A4Sv7PRvVq6fv53x4hNaqn8VSAy8UZTp3j9u4nvclCMlZ30x2JF0/nZ2MvGL+B3BSgcRjCvJzhgNCctbT65na1QPyDBY/IIYBMu/sVbUHftcoQybkDJEFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784746241; c=relaxed/simple;
	bh=m0nRZfj91bHtcDU6acJX7qj11AsAFclUVDgAmfckORs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NBGpnIrfUqXk2Lz8xGpPu81WD2O012C5RABXExj8mCSeAVoE3QOBaI/QthQsK0JwH4AsvkRno5XrjAc0Ae6zby4+XjWN4lIGLUEsgjExxK0qPe9LDpNnzn28+IiZEw77/SbznHZxrhjYEy7tq0FtYYP46YqCiVCz/rW7JQ3nbbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=apil8Sax; arc=fail smtp.client-ip=52.101.101.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="apil8Sax"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQg9j9oPJKBxpN1bTq5hWLHCUQI9afiDyrmEgLpGbTr5lc36sUDigdnZ5KF3vLxqb/2W8NsLBRd2cMFsobn1oxznN2lgERjb8qdUQTTFK+I1Mfn1ARMYBkxUCHRrOco3rSOvltQw4s/fT+Ay4VtFRVBmMWzNfNtwoZGSJjWH9X6sykpeMjYzbbqToswLNL7fogFB2Xmpy5XBKnaEEjaEg1um2Qjmc9VxRJ5alG8ZvlrVD4+f1e+7gEXOLn5Iui4PDELX0WJ6U7958UNoqx1Ov+EuOzJFQA9hev5h+u5L0jBnnhpGiiwkWNItIJFwNOxjOaNne1N2Q+yFSPW30b2l1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77PsvBmgNSycN4xZY61vH5Zi8vrqlOL1X/t5Rm+Yx44=;
 b=kbJaGpQ70Hg9O3kUmH659VI/xpy7so17iHArS3/XnnnGcuD/Wa8S7uL+a+wG7e4R9N4PoDMnkebkfnhmuhDwBYvwVfe3GkfvB6d+M77XIu5roGZ9SliYE99ZNcNGEgxunO5Ga4GaTUMnw2aoZPvVbw9Mfcm3U2FRyCJudnk4JO4I3enWXO1Z277AFdgPYW8SIeUHIjVDlknjtThmfzQs5Qqb1I8AiR2rM4loh9r3mX4SYwltQJLHy2n+6fhU/UhTydL6+PF3ZwdpUPukn6eWwW5qellmSbdkh0vXmOnOIcdDciwsA9IAj45i9MOpsPOe8ltdx6wwWFeiZXOsxwa+aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77PsvBmgNSycN4xZY61vH5Zi8vrqlOL1X/t5Rm+Yx44=;
 b=apil8SaxVZC8pXDm+oNH9Q7Bc9QnOAx97xGXiM5ShhRIg8eLg/tuW20t/Ec358Df6182S2U8HKGEI2fFYZrgYOSbwou60BhNJgohdvTTMzqBK0FTG9uShhXj8anFCStr9u88gQQYK4cs1rZXpKlypVTdgCyTvcs3xv1kBC5cvJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:9d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 18:50:36 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 18:50:36 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 22 Jul 2026 19:50:17 +0100
Subject: [PATCH 3/4] rust: treewide: replace `__pinned_init` with `__init`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-merge-init-v1-3-d4594de76538@garyguo.net>
References: <20260722-merge-init-v1-0-d4594de76538@garyguo.net>
In-Reply-To: <20260722-merge-init-v1-0-d4594de76538@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784746228; l=8736;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=m0nRZfj91bHtcDU6acJX7qj11AsAFclUVDgAmfckORs=;
 b=/fib0IRjPUt6wh6ZINlQBhxlI1Z5IIyFzXifU+7VEzVBKMw8OVxB+gsdmbeGuaL31XR5txV9F
 BTlCtU78ySWDKC+lNuxm0gKuZqdzTvIfPFO6Bftw9+FbqjXgpVEkTE5
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2471:EE_
X-MS-Office365-Filtering-Correlation-Id: d2be9e32-11a7-4313-ddc9-08dee8221a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|376014|7416014|1800799024|56012099006|10067099003|921020|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7DldtFS1rOi7B1CrxOzdM9Qax9Bnt0HHfzYGMhVJX7/nkrrFhObSmTSv4ZzxafoHUY6G/E2w7+E4W00HCR8l8AUdlfZm3uxuaJ9jdHXA18jEKHTK9F0zWG0Z/Ogg5sVaFQ4BUomoD6VroAS5ji6H/kS27DdEY1J9kicF9g8pdSfELt8mfDS2DvIpm2U5WOMi9reIbpx0UnWwTAUeUMpOQ/lMxQ8tzr9ZuhO35ZP3UbKIM9fd0WIuibNvLtvOoFKw5/EgI4Qg/L3ndeUKozCSKr0HWssGpsAhy3MrYDhIRuVisWQuC/Oi9GcAgQfAPLnb4FRayKZprtThWIblSctaRVZwjCCQzSz+rrzodnIQxDEZbvD+2KYQhspCtzNcms0xz6ZpV+HXdKQ8JQ/QQhPDPfNFA63UKCnFh1KzB3dBMG80YUw77ndND6M5zdbU9T0NYnRVbM7rWafjMmEDhTg7QsVjnNGkcyOWZ9kpVXBrBwrlSex6xMZVsog5JacSCTmcbbY9v4/bVkRILFY4/CrTmOI1rkVTWEiUEylDyhIMZ/zvUCyHgZR5VPDq7J4QcxVKv14np/gW+RoS0SeXi9B0h5jQNYwmlJTbIZwhIthrI3YXAJtJe7ZDwfpLXT1bBe7KOsy+J2CIFUypjob6be78ywA60VRCjq8tODAZepQqnhat+u6O08bst8AAwnTUZKo2BX4y6O78l8GwZoTy646cOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(376014)(7416014)(1800799024)(56012099006)(10067099003)(921020)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmJ1N003bXVnMjBxeVhKbHFSdldhLzB3S3RPaVF5bXdLeENRNnBWWUxCSHZK?=
 =?utf-8?B?blhpa09nMmxTNW14a21HRGNhdTZBekMwTzlMUzNrNE1RN1U1UGh5NmxBeGs2?=
 =?utf-8?B?cHpPbGYyNGJlQkJkUXlGUmZabjU0Tlh6eTNsaVN6Y1dOV2RZYytSRC9LaVRn?=
 =?utf-8?B?VldzazNzeFJxTDRUZ0kyRVpMMGFOTGphazZsSENlcHhHdHRGb3N0YXVCVDhI?=
 =?utf-8?B?T0tCM2txcU4wRU50L2svNUJYKzVyUmpQd2V6QlNkbm1aTGVtQ3ZZZmFaM3RY?=
 =?utf-8?B?SldJQStNaUh3aWh3ZXFaYmUwcEVCS04wNDFKdVZuaTk4aEFJMGRiS2FJOFMv?=
 =?utf-8?B?K2RkNjlYZytVM3ZkZThGQXBtMmZHU3JseGdUV3puWHN2L3ptQktUZm5NTHdY?=
 =?utf-8?B?WlhQUmF0VzlLc1N1dUNCaVEzL3pYM09GUU9kMlpER0pBZlVuUVNyclhnYi9z?=
 =?utf-8?B?aHBtdWdUWGw4RTdRNEc2MnlrM1YxOWtyTVJGakRmcm0wTTczV2NIYVZWUkNL?=
 =?utf-8?B?QitMYk1pYkI1THlGZXlxU2hsM3ovZGxna1UrTWhKRVpGa1FSZWYvWUJoOHNz?=
 =?utf-8?B?eXpBSUpZcHlXTFliSVZid1I2UDd2dTMyMFpqQXRhUjE1aHI4TlBuN2U1MHRK?=
 =?utf-8?B?R0FPNkRWR1ZXMzRVQVZ4U3BMcm5aVTRTLzZBK0JpUTNvUW9LU2V5TkROYUJT?=
 =?utf-8?B?VWNtUVhFWWtZSjN6cVhhU1JZeXE5L2pxV0c3blhmYlppSnd5RjJPU3ZmQVNy?=
 =?utf-8?B?SGwvRkJ5OVRJdGNRRlpZQXNNcTVDeUNGTzhTbWJwRVlBY2xuT0w4QU1ZeTRO?=
 =?utf-8?B?WXZOeXluZzViM2xtaTVzUk5FV25qWXg2NzVGbUZET1FnSmEvS3RtbzlZRDU5?=
 =?utf-8?B?Q2lxdzZpWis4WXZJdTlqamtMRGJQTEEySWplbStvWHowR0piOUFKRkMvV0pH?=
 =?utf-8?B?MkhRTlJtbTNDT3lyaVY5Wjl5Ulp5Y2QyUWZKM2x2d25SbFdwVjZmdHZzVnZK?=
 =?utf-8?B?VlY4NHJLVnFLUE95eHpZT0trRkJ6dkEyNVM1Yk5vUWJrOXdHaUZ1NTg5Z3Yx?=
 =?utf-8?B?Sk0yS09JUlB2bzFqSitzNXJCQVljS0tCTXJnT1BqZVFRd3JVWXlKa3lCU0dl?=
 =?utf-8?B?emR2NHYxbEdkVEJXRzRoRkdEUTdaanpPcVFMOFZLSkFqSGVZcGdBSnlmUHQr?=
 =?utf-8?B?ajJuVUtRZ3FlWHBUUE9uMWtWVkJYaS9aM0xkQWpyak5wWjRJMlBwYXUwcUky?=
 =?utf-8?B?YmY4SXJISVJWdU43bXZJQVU2dk11MUlNU1hic0tUU1FGU1FCNTk5R0RrU0JZ?=
 =?utf-8?B?L0gyTXlpRDloRjZodW4zUHV0N1NmSFVOeUlONXROZFlPTURoMzB5YTlUSi9l?=
 =?utf-8?B?RWk4K2FLOWxxMmswcTJxTG1XRnZuQmNLeUlQbVUweC9VbGRRUzlCVUgvcTN6?=
 =?utf-8?B?dzNNdHE4UHlMa1JyZzZzKytkWjJoQ20vMWw4dzNDU0hoMTFoa1B1MUxHYWZF?=
 =?utf-8?B?SzJVTFJiOEkwclhseWJIZ29NdDM0V2V4Q0JpRmxjV0djMUFuelR4UWxsaUlr?=
 =?utf-8?B?bGNRcGcxZkNmRzdndnRSNUVMRHFHUTgwOWxZSUZXRTMvaGFxdnhiNkNtV1Vs?=
 =?utf-8?B?dHlrRTJTbWVBR2VnenNBaE5SaU94YTNGM05IU2NUaTFsY0VZeHBRQlQ4YUtP?=
 =?utf-8?B?M3A1S2dQZ2xlWlFGbVdLTFl2dnhlWUQ5U1RhaUtMbjVqdENlcUhqL1ZyeGd3?=
 =?utf-8?B?QnprNVFFNis1cks3a3V2cGI1ZmpvRTRFcmNaT1ZqdllpZ3EycXhjaFd5MjFW?=
 =?utf-8?B?cEdoemF4UThTWWpzeGVFUURHbkpsazdkZ0xsWjdDMXJNMkxGYXBnZEJiZ0xa?=
 =?utf-8?B?QkQ1RU5Wdm9HWGlseVVzN0xHdVdTendiN29ycDlrM3hEK2EwSjVTd0VTK0d5?=
 =?utf-8?B?ZUt3YXRIa0Z1SjFrM2d5SDZzOXRMWHUxSnV0NzZWYTJJZ2NQOFdlY25pZm1u?=
 =?utf-8?B?WkpNMk1xRkFFVENCK3RSSFM0Nng5ZHhwalFsb1UybWg2T1lBM05VT0I4WTZn?=
 =?utf-8?B?N0hxYUQwUXN1QTEwUjJCQlRXT0dqcHlVRmRUVy96dmNtKzRqZzc0aDNUWkVi?=
 =?utf-8?B?M0kxZHRjYUhKQVo4TzZrWW1oTHY4enNHaVU4c0RaWUFjYUZaNHZSUGxkWWVH?=
 =?utf-8?B?djc0WDNjbWtxYTdxb1pQdkZHb01obnVkaVhRdFcyaUdwUysxN3RrR29vV0ZF?=
 =?utf-8?B?UXFzRmJ4eXFCWkJPSnc5S29xeTZ1K2htdHVkRnhQQ0tudVZvVjdyYjY0elFQ?=
 =?utf-8?B?aUpaTUFjM3RIclBCOFlYMndsTmNiNW93cGdReEZuTm9wZktGL3hBQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d2be9e32-11a7-4313-ddc9-08dee8221a46
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 18:50:30.1218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNbUbBCPv56S9gPVz0jS1049UEhjAF1tBOkgU/mJKdJB1pHY1K+jdO+kNGyOciAL4dasRbGP3Kud1EyNL6ylAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2471

The `__pinned_init` is being merged with `__init` and is soft-deprecated
and is to be removed. Replace the users with `__init`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/alloc/kbox.rs      |  6 +++---
 rust/kernel/drm/device.rs      |  2 +-
 rust/kernel/drm/gpuvm/va.rs    |  2 +-
 rust/kernel/drm/gpuvm/vm_bo.rs |  2 +-
 rust/kernel/init.rs            | 10 ++++------
 rust/kernel/pwm.rs             |  2 +-
 rust/kernel/sync/arc.rs        |  4 ++--
 rust/kernel/types.rs           |  2 +-
 rust/macros/module.rs          |  2 +-
 9 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 35d1e015848d..78e929ed3382 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -372,13 +372,13 @@ pub fn pin_slice<Func, Item, E>(
             // - `ptr` is a valid pointer to uninitialized memory.
             // - `ptr` is not used if an error is returned.
             // - `ptr` won't be moved until it is dropped, i.e. it is pinned.
-            unsafe { init(i).__pinned_init(ptr)? };
+            unsafe { init(i).__init(ptr)? };
 
             // SAFETY:
             // - `i + 1 <= len`, hence we don't exceed the capacity, due to the call to
             //   `with_capacity()` above.
             // - The new value at index buffer.len() + 1 is the only element being added here, and
-            //   it has been initialized above by `init(i).__pinned_init(ptr)`.
+            //   it has been initialized above by `init(i).__init(ptr)`.
             unsafe { buffer.inc_len(1) };
         }
 
@@ -473,7 +473,7 @@ fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<Pin<Self::Ini
         let slot = self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
         // slot is valid and will not be moved, because we pin it later.
-        unsafe { init.__pinned_init(slot)? };
+        unsafe { init.__init(slot)? };
         // SAFETY: All fields have been initialized.
         Ok(unsafe { Box::assume_init(self) }.into())
     }
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index f43c6887ad23..4eadfefbe9e5 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -239,7 +239,7 @@ pub fn new(
         // SAFETY:
         // - `raw_data` is a valid pointer to uninitialized memory.
         // - `raw_data` will not move until it is dropped.
-        unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
+        unsafe { data.__init(raw_data) }.inspect_err(|_| {
             // SAFETY: `__drm_dev_alloc()` was successful, hence `drm_dev` must be valid and the
             // refcount must be non-zero.
             unsafe { bindings::drm_dev_put(drm_dev) };
diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
index b108ec7aa1bc..12a3d613f523 100644
--- a/rust/kernel/drm/gpuvm/va.rs
+++ b/rust/kernel/drm/gpuvm/va.rs
@@ -124,7 +124,7 @@ pub fn new(flags: AllocFlags) -> Result<GpuVaAlloc<T>, AllocError> {
     pub(super) fn prepare(mut self, va_data: impl PinInit<T::VaData>) -> *mut bindings::drm_gpuva {
         let va_ptr = MaybeUninit::as_mut_ptr(&mut self.0);
         // SAFETY: The `data` field is pinned.
-        let Ok(()) = unsafe { va_data.__pinned_init(&raw mut (*va_ptr).data) };
+        let Ok(()) = unsafe { va_data.__init(&raw mut (*va_ptr).data) };
         KBox::into_raw(self.0).cast()
     }
 }
diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs b/rust/kernel/drm/gpuvm/vm_bo.rs
index a30f838c11b8..c7305e4c03da 100644
--- a/rust/kernel/drm/gpuvm/vm_bo.rs
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -190,7 +190,7 @@ pub(super) fn new(
         };
         let ptr = NonNull::new(raw_ptr).ok_or(AllocError)?;
         // SAFETY: `ptr->data` is a valid pinned location.
-        let Ok(()) = unsafe { value.__pinned_init(&raw mut (*raw_ptr).data) };
+        let Ok(()) = unsafe { value.__init(&raw mut (*raw_ptr).data) };
         // INVARIANTS: We just created the vm_bo so it's absent from lists, and the data is valid
         // as we just initialized it.
         Ok(GpuVmBoAlloc(ptr))
diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 05a12e869a57..2afdccb67373 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -157,9 +157,8 @@ fn pin_init<E>(init: impl PinInit<T, E>, flags: Flags) -> error::Result<Self::Pi
         Error: From<E>,
     {
         // SAFETY: We delegate to `init` and only change the error type.
-        let init = unsafe {
-            pin_init_from_closure(|slot| init.__pinned_init(slot).map_err(|e| Error::from(e)))
-        };
+        let init =
+            unsafe { pin_init_from_closure(|slot| init.__init(slot).map_err(|e| Error::from(e))) };
         Self::try_pin_init(init, flags)
     }
 
@@ -175,9 +174,8 @@ fn init<E>(init: impl Init<T, E>, flags: Flags) -> error::Result<Self>
         Error: From<E>,
     {
         // SAFETY: We delegate to `init` and only change the error type.
-        let init = unsafe {
-            init_from_closure(|slot| init.__pinned_init(slot).map_err(|e| Error::from(e)))
-        };
+        let init =
+            unsafe { init_from_closure(|slot| init.__init(slot).map_err(|e| Error::from(e))) };
         Self::try_init(init, flags)
     }
 }
diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index 6c9d667009ef..ed051c1780a1 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -600,7 +600,7 @@ pub fn new<'a>(
         let drvdata_ptr = unsafe { bindings::pwmchip_get_drvdata(c_chip_ptr) };
 
         // SAFETY: We construct the `T` object in-place in the allocated private memory.
-        unsafe { data.__pinned_init(drvdata_ptr.cast()) }.inspect_err(|_| {
+        unsafe { data.__init(drvdata_ptr.cast()) }.inspect_err(|_| {
             // SAFETY: It is safe to call `pwmchip_put()` with a valid pointer obtained
             // from `pwmchip_alloc()`. We will not use pointer after this.
             unsafe { bindings::pwmchip_put(c_chip_ptr) }
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 5ac4961b7cd2..c5200cc0bc51 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -727,7 +727,7 @@ fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<Pin<Self::Ini
         let slot = self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
         // slot is valid and will not be moved, because we pin it later.
-        unsafe { init.__pinned_init(slot)? };
+        unsafe { init.__init(slot)? };
         // SAFETY: All fields have been initialized.
         Ok(unsafe { self.assume_init() }.into())
     }
@@ -810,7 +810,7 @@ pub fn pin_init_with<E>(
     ) -> core::result::Result<Pin<UniqueArc<T>>, E> {
         // SAFETY: The supplied pointer is valid for initialization and we will later pin the value
         // to ensure it does not move.
-        match unsafe { init.__pinned_init(self.as_mut_ptr()) } {
+        match unsafe { init.__init(self.as_mut_ptr()) } {
             // SAFETY: Initialization completed successfully.
             Ok(()) => Ok(unsafe { self.assume_init() }.into()),
             Err(err) => Err(err),
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 699aabe01ee5..b769c80189df 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -426,7 +426,7 @@ fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
             //   - `ptr` is a valid pointer to uninitialized memory,
             //   - `slot` is not accessed on error,
             //   - `slot` is pinned in memory.
-            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }
+            unsafe { PinInit::<T, E>::__init(slot, ptr) }
         })
     }
 }
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 025323fb030d..a922103b7e35 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -622,7 +622,7 @@ unsafe fn __init() -> ::kernel::ffi::c_int {
                     // SAFETY: No data race, since `__MOD` can only be accessed by this module
                     // and there only `__init` and `__exit` access it. These functions are only
                     // called once and `__exit` cannot be called before or during `__init`.
-                    match unsafe { initer.__pinned_init(__MOD.as_mut_ptr()) } {
+                    match unsafe { initer.__init(__MOD.as_mut_ptr()) } {
                         Ok(m) => 0,
                         Err(e) => e.to_errno(),
                     }

-- 
2.54.0

