Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022091.outbound.protection.outlook.com [52.101.96.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C5648E0FF;
	Thu,  8 Oct 2026 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462279; cv=fail; b=aqiTkQFUlGu19hhjbtU2VIl9Wm7LA1RBCsmCcUyLropmV3x0K2pZQR86muYSZ+eoGK56KAPpOi+X8ZXX+yCbek3a/T6kbAXvhQIORqS/YKkeRWAuilfi4FMmpmgpud2I2YEPOzH4dNUvecQronAl2m5bS/MpzrutVO8gwcIsXRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462279; c=relaxed/simple;
	bh=fsFZqGDU7WDmMnULtSnMVSXl83VKZfJ5Di25gLjVaK0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ruMPAFT4hrRbocnLY374dIyFQv3dP6rXI3U8+BjoG0hG/RXV3LxJ/hYVZbp3ydSxGMcSPM2Gyip2eXWOZVpKi8g/bjfvY0QdLl1tsDfwzLI1u4IX1+g2ewVuRz98MPDSkUPT9TI0cz907jTVnu6CwTemjOuOtOpnntbhjVzL5fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ebX7KZw7; arc=fail smtp.client-ip=52.101.96.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ebX7KZw7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYbwdVN149tsWS4Bz7O6gLiguZuRbR7qH/a0tsYSYOl6gaTXEZC1aYRugK7v94Q2V71GZH6LUrOI9L0zjNE+aN4/xwKTtwRs7VD4fqUOs/XETNgTx/SRHSg9hjC338/3HETavBSIWwqD/Urf2Fdvv+oI0kNfnij1u2rhOKyKSWKtH3S/a+c0nVx0STq2VFMF1Q0TBtDezkBTwQE1Qor5R5+lOmlYb4EQl1gxLc4D5jXoUfB2VxBMsC662CVGmDi5Uycye+U/kdigriSCBQf59IASIwVBkegYLckR0H5a2TDzoh37ErSReYPtxbnYReWoFNo8Q5wbm8tAanqz+mJUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TZWSGTntFdJb5u4mRtPhjIfTMFYFVUSuoyOQWUwzwY=;
 b=yZr5m35fu/7H6I2myL6HLMr4NQEUTb33TbdmPZ0wIeenT4W0yGE9Yfe0scqg6OFAVVR8d9i0+HtKyAY+Qa34LIdrPcxAJnp1OeoR8ad2V6VhHmU+S/Q7H18xo5z9fGYefDIht22o2pnhe4V0TkYY/a2lJUA5BxHtl9S9DVTV66vjcKEWysv531Z52/TDU91cLL5ZNakN7sZ9NHnknfvhIpZFRgJl9NXOe/FZTN2HU4pCcEPuZjTyLtTkdZs5ALNxiuJFQ0Tg3w3RH5fGvoWmsJc+jh+odFUPX1ptbqBJj9cUaR4fAGLANtQjMtAFA92JCjsr8i27vtwt9dn4NGrwRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TZWSGTntFdJb5u4mRtPhjIfTMFYFVUSuoyOQWUwzwY=;
 b=ebX7KZw7prtTXF2RvUYrA1CqiykSxI9YThAetuXegMJesunxdZITmjgkSR/sdr7JurL13V7lPZN1fmFEg4/sHR3BZXanrxpFVngB+HAdl4dxRvrqmd4JKox/0MmKy9hY0DRkklF61U9TSPYFv8oeHrBp0TNYkyvyyiER2IX0dG8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB8795.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:33 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:33 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:23:55 +0200
Subject: [PATCH 08/20] rust: pin-init: internal: pin_data: implement
 initialization of borrowed structs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-8-6c1eb269fe57@garyguo.net>
References: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22133; i=gary@garyguo.net;
 h=from:subject:message-id; bh=fsFZqGDU7WDmMnULtSnMVSXl83VKZfJ5Di25gLjVaK0=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce703u4d59f2OyUZX9+0tpnVdXLCg+FiijrRPWe7
 PmleVb63LaOUhYGMS4GWTFFFo9uxrRNjLNlL2uVv4SZw8oEMoSBi1MAJnJtC8M/Q8cHN/Q3OZY8
 bm63vSbkX/z06u59ajOuizYsP3JGweuQMMP/iM/71nEcygg3Eu/0c4q0FI4Jm/mw2uOjZsHbJ5v
 /KV5lBQDsX0ps
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0578.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::8) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO7P265MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ad7fe6-2d71-43d0-f851-08df25371c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|10067099003|3023799007|921020|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	dVxxB1qfGb3yUjGFYPtAlpwijaZoIwLL802LEK66MUgrqAdENtIi0OlNWXpSLcOkb9lwJAY3XRoVT0noIB/d2m8FRDVCXVFaj6jQgw8vz2DEANREDB+xW3J8ZocMqyAJK2t8d/ruU8ssJ3A7ROSyiuMs1tZfUqqaaQfy9SXqmkxbkOBMxqaeRORWPfKZv8hOs4KZIP499FDyBo38VsT+urh/sQD1610SdHXU96Cz9e53LfJBaAx7RYvwA6IVko+iDLos7NUih3iQ1Bcs67c6+qbH3/sxRBLd5N32AeSkxvWHQOfaw1/LPnVixwW5VOJZPsG1cLvic2rpspDxSke8wjCKfSeRdJa+A0y5QbI6zxq7F1Oo+C2RdPP/1QBkB1q8CW4aOc4Bv/cP7M6IBOCVbZ5A6f9XmDQofjazPJ581KDFBC7cyRN7qVJFsUw6Mm8UAa1wMD7+txDtD87eZA8aES41JAFgMDT+D3eIoKF7QoMmRLQKrgw73oLc744Bs19Iv2phGM+zc4ElMkHF+wuuhNmasdw2WG6xvt5Rr5WAXU0yD9jMvYoQe6Qi6hKfV6lE4smikEQMhLqrldHZ0lUTihl+duyIvELGe6FovQDbo0uXFKVyEA1DwAZLZ+sMoVrR1tgHGXNqriDq5BOxkLJtPl8NauP71N9TQMWysU1iFGP/doerWCuAhBNY5eIkpz5wrAJXM/UT5/ebkVkoGznIYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(921020)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHc1eXVJRVU0VUlRUWhDb2JmTWE3NjdjTFdJRjJnZUp1WGRTOXdBNHBXbVpv?=
 =?utf-8?B?ajREWG1YV09SMmx3b3pDN0NlVnRsbXpnRXozWkpBdm9JVFpBOTBlMGErMVdq?=
 =?utf-8?B?aGNheTFXSC9qdzdnOU93b2NqRStSeUtET24zSXRrZ0h6SG9jUHZ0bEMzbmda?=
 =?utf-8?B?RnNibjVYN0xUOEtrQTZha1prcWhBUzE5UFJUaldMSGJpNGhYZ1YyWkhrVy9X?=
 =?utf-8?B?U24rRlRVS2ZTaWxjK0M0ZGtqK0JBZVYvbEgveGpId0hjQTNEd09pckEwR0pY?=
 =?utf-8?B?QmxUVHdYQ3RHZEdQcDh2Um1TM3d6NTZHYk9VM0k2R0hVd2pZYUdwL050UE50?=
 =?utf-8?B?NWlFNmZzVHZvZDlXcTZOZ0tQR3ZzMTBjSEtCenZVd0ZPR01qNmdkcUpmNWhi?=
 =?utf-8?B?NzlJWkY0WVpPMXNrR3B1VjVsOW5uNkZnOHpGWHBScE9tOFl5Y2VVVlUrdHp0?=
 =?utf-8?B?UlZUOE5kVXRsMUhFZHJpRmRjQkFnckxvSS9uM1BrY3lIVHZncEJDSTVpSDlT?=
 =?utf-8?B?M3JDcFE2VzVNSXo0NzhSb3VBK1dDeXZRRXBva1lmbHhlMURZUktrV1VkYmZn?=
 =?utf-8?B?NkgxT3FOamhRMTZiUE96M25kUTMwTmhGdlNEUWx1MTFWY1dTOGFhaVFKQldV?=
 =?utf-8?B?dHE3TDRqaWxMWGdRNUwvSEZ2dWdQTWt1cmpTTDJkUmQrNk01NHorYjJiV3lD?=
 =?utf-8?B?b2VhditkUWdqT0dSWHk4VkpGT3RNZWRUcjJOSEhIR29oam1qZGVJZXNCUFFt?=
 =?utf-8?B?RVlCa1dpblBRMi8wQUl5R3pnQ2tDNUhvaDZHY1ZDb0ZXZE84dWllY2ZETE5Y?=
 =?utf-8?B?NStVWUNCOWJ3UzFmTzlpcEdldm92Tkh0cTVMR3lZZEpKVDdRMVpTSUMrcndQ?=
 =?utf-8?B?ci8vdUduazhZNlo5UmhzVEl6WThnWFZYVnQvektwOVhuT0czUEtzVGNERWxu?=
 =?utf-8?B?QzB3UTllNUU3WFZSYUY2Vm9taDd0cVdGSDIrSC90WGRWNnVQRDlFNTNtUjFU?=
 =?utf-8?B?WFdTcHpnb29PSG5MT2tIWWVVQ29EMnY3TksvSjR3SExrV1YvQjRBV28rVWVL?=
 =?utf-8?B?MXZIc1pIWDVUdXYrVG4rOUtyVnhvcTFseDRWY3RrT0E0bjFhMzMxSTZPVTZT?=
 =?utf-8?B?YWtZM3RZZzhXUU44NGJWVGpCL2hSZ25BUTRER0lXQnFMTUhwL1JoUzZKQzBp?=
 =?utf-8?B?VW0yRHJ3Zk41NEdKM2ZzY1orTm1Da0NtUTZ6ZTFzVGR6Qmc0V0ZNWEhzSWpu?=
 =?utf-8?B?azBVKzU2WGIxOWFpTk5jTFYxSFduN1Nzc0ppancxMWg5VHQ0OG5nbmtwY3Zt?=
 =?utf-8?B?QUF5S3dYdXBSak9ZQ2wvSTNvMmpKdHhGWWJ3OEFQRjNMMVhvM0YvL0dOM2Np?=
 =?utf-8?B?OHNYMTg5bVROOGtQb2JKNFZlZkRZc0xYN1hqalR2dGx3dmg5SUFheFF6L2Vx?=
 =?utf-8?B?cFdjZjNudG96M0FNZHJWdUxrWkt2MXNHNzVGblk4ZCtDcTJNNUtjd2Mya0Y3?=
 =?utf-8?B?L05Namk2S21vV0tTNHVNb20xM0NuUmJhL2NaQWJ2cjN6ZHRzRENwaWhWTUdu?=
 =?utf-8?B?cEhoVjRWeVVBcjlzamMrMkZVZnE0ZmtLaWxnN1U2SnR1MlpoUGRyL1RwZUFM?=
 =?utf-8?B?NElqSy91VUlYY0g3cm5WemNxclNUaVZsU2V5eFd0ckJpSkdLSU1ubG11YXJU?=
 =?utf-8?B?bDdqRCthY1RTSVdWRFJ5Zk9CUkZSbEd4K2tlVUNvQVZ5cERTR1FrUno2MThT?=
 =?utf-8?B?eWMxSjVYQzY4ZklpOU1jR3g0WlJyV1ZIenpLVFdPRXNWcE4xbU5KRDdHWU5u?=
 =?utf-8?B?ME5LQmFhMVArbFA1V3o3Znp5NTFCODNPR2xHeXBoZzNxbkpGcVRyeDYzK3Ja?=
 =?utf-8?B?MEx4S2t1S2JlSXZ0WHdEb3pKcFVhQmNicGxBZzJKbU9uMmxrbjFjT1FjeE9Z?=
 =?utf-8?B?N3FXVWJ3b3ZJSzF4bUwxbUtHb2orQTBqcHdYODJhS2hlNFhWbUFqaWRhdFE1?=
 =?utf-8?B?VUZ1ZWJiTjRuMlUweklmQzFMREJWbW1IRytHcjdWU1htb2FLWW9jb05MdXJS?=
 =?utf-8?B?TlJSYk5MSlFXN2srM2xhOGt4andPNi9YeXAzTFNLaTZ5b3huWGp3NmhXamk0?=
 =?utf-8?B?ZnkySlgyWFVEY3lwbHVML0RkbzBham4yMGcrUG1GOVBNSVNVQ1lPeEh1anNw?=
 =?utf-8?B?bFZoQ3AvNEFXR0xicGo2V3lRbVdQZi9XVFlMdDY3TWxwdldjWUdRanZmQVZn?=
 =?utf-8?B?SlIzYzl3dUNNNjQ4aVBjb3JZcWNzVzNhSVlOS0loUkpxenczZitqWVliaDRJ?=
 =?utf-8?B?Zm1BWG1uN1ppeUc0VE4zR2dNMjZ2aStpczFzdDBvc214OGhvOHVJUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ad7fe6-2d71-43d0-f851-08df25371c3e
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:33.8086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pps8IAdbS43SSn3rBB3w4B9MDOW+97zQmWHlwx7iFLHR6KNfACn3qx0grlAQLu+dQN6UJ33EpOd2pTJ1ERAKVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8795

We now have the checks to ensure that lifetime relations are what is
expected, we can generate the slot projections in `generate_pin_data` so
self-referential struct can be implemented.

New slot and guard types are defined (`SelfRefSlot` and `SelfRefDropGuard`)
which gives the generated let bindings longer lifetime than the guard
themselves.

Have `__make_closure` take `data` back as an argument. This gives
`#[pin_data]` an opportunity to change the type to add lifetimes.
Higher-ranked trait bound on `__make_closure` is used to ensure that the
initialization closure cannot make arbitrary assumptions of those
lifetimes.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs     |  42 ++++++--
 rust/pin-init/internal/src/pin_data.rs | 114 +++++++++++++++++++---
 rust/pin-init/src/__internal.rs        | 169 ++++++++++++++++++++++++++++++++-
 rust/pin-init/src/lib.rs               |   1 +
 4 files changed, 305 insertions(+), 21 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 80e4dc068d2e..ded2b5283376 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -288,8 +288,10 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
         },
     };
     // `mixed_site` ensures that the data is not accessible to the user-controlled code.
-    let init_fields = init_fields(&fields, pinned);
+    let init_fields = make_field_init(&fields, pinned, false);
+    let drop_check = make_field_init(&fields, pinned, true);
     let field_check = make_field_check(&fields, init_kind, &path);
+
     Ok(quote_spanned! { Span::mixed_site() => {
         // Get the data about fields from the supplied type.
         let data = {
@@ -303,17 +305,29 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
 
         // Ensure that `data` really is of type `data` and help with type inference:
         let init = data.__make_closure::<_, #error>(
-            move |slot| {
+            move |slot, data_lt| {
                 #zeroable_check
                 #this
-                #init_fields
+                // Generate init twice, which is mostly identical except for lifetimes.
+                if true {
+                    // In this path, we use the field lifetime from HRTB to prevent environment
+                    // lifetime from entering the fields, and to ensure that the dependency of
+                    // fields is consistent with the field drop of the struct.
+                    #init_fields
+                } else {
+                    // In this path, we use local lifetime, to make sure that if initialization
+                    // fails, the destructor execution will not cause lifetime issues. This is
+                    // separate as implied bounds between field lifetimes can be inconsistent with
+                    // that of the drop.
+                    #drop_check
+                }
                 #field_check
                 // SAFETY: we are the `init!` macro that is allowed to call this.
                 Ok(unsafe { ::pin_init::__internal::InitOk::new() })
             }
         );
         let init = move |slot| -> ::core::result::Result<(), #error> {
-            init(slot).map(|__InitOk| ())
+            init(slot, data.__with_lt()).map(|__InitOk| ())
         };
         // SAFETY: TODO
         unsafe { ::pin_init::#init_from_closure::<_, #error>(init) }
@@ -360,7 +374,11 @@ fn get_init_kind(rest: Option<(Token![..], Expr)>, dcx: &mut DiagCtxt) -> InitKi
 }
 
 /// Generate the code that initializes the fields of the struct using the initializers in `field`.
-fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -> TokenStream {
+fn make_field_init(
+    fields: &Punctuated<InitializerField, Token![,]>,
+    pinned: bool,
+    dropck: bool,
+) -> TokenStream {
     let mut forget_guards = vec![];
     let mut res = TokenStream::new();
     for InitializerField { attrs, kind } in fields {
@@ -388,13 +406,18 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
         let span = Span::mixed_site().located_at(ident.span());
 
         let slot = if pinned {
+            let data = if !dropck {
+                quote_spanned!(span => data_lt)
+            } else {
+                quote_spanned!(span => data.__with_lt())
+            };
             quote_spanned! { span =>
                 // SAFETY:
                 // - `slot` is valid and properly aligned.
                 // - `make_field_check` checks that `&raw mut (*slot).#member` is properly aligned.
                 // - `make_field_check` prevents `#member` from being used twice, therefore
                 //   `(*slot).#member` is exclusively accessed and has not been initialized.
-                (unsafe { data.#ident(slot) })
+                (unsafe { #data.#ident(slot) })
             }
         } else {
             quote_spanned! { span =>
@@ -455,6 +478,11 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
 
         // A tuple field has no name that could be bound here (the `_0` identifiers are considered
         // implementation detail and not user-facing).
+        let let_binding_method = if !dropck {
+            format_ident!("let_binding", span = span)
+        } else {
+            format_ident!("let_binding_in_dropck", span = span)
+        };
         let binding = match member {
             Member::Named(ident) => quote_spanned! { span =>
                 #(#cfgs)*
@@ -462,7 +490,7 @@ fn init_fields(fields: &Punctuated<InitializerField, Token![,]>, pinned: bool) -
                 // struct field.
                 #[allow(unused_variables, non_snake_case)]
                 // Include `mut` so that `Pin<&mut T>` bindings can be reborrowed via `.as_mut()`.
-                let mut #ident = #guard.let_binding();
+                let mut #ident = #guard.#let_binding_method();
             },
             Member::Unnamed(_) => quote!(),
         };
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 0b2ac2ca856a..c837241241af 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -61,7 +61,6 @@ enum BorrowedKind {
 }
 
 /// Information about a borrowed field.
-#[expect(unused)]
 struct BorrowedInfo {
     kind: BorrowedKind,
     /// Field lifetime for this field.
@@ -973,12 +972,36 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
         generics,
         ..
     } = &info.struct_;
+
+    // Wrap in `CombinedGenerics` because it's ty generics will always output `<>`, so it can be
+    // used with `for`.
+    let field_lts = CombinedGenerics(vec![&info.field_lts]);
+    let generics_with_field_lt = CombinedGenerics(vec![&info.field_lts, generics]);
+
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
+    let (_, field_lt_ty_generics, _) = field_lts.split_for_impl();
+    let (impl_generics_with_lt, ty_generics_with_field_lt, whr_with_field_lt) =
+        generics_with_field_lt.split_for_impl();
+
+    // Wrap each field in a `PhantomInvariant`. For borrowed fields, additionally
+    // use `&#lt mut #ty` so the `lt` becomes associated with `#ty` which deduces
+    // implied bounds.
+    let phantom_fields = info.fields.iter().map(|f| {
+        let ty = &f.field.ty;
+        let ident = f.member.as_ident();
+
+        if let Some(borrowed) = &f.borrowed {
+            let lt = &borrowed.lifetime;
+            quote!(
+                #ident: ::pin_init::__internal::PhantomInvariant<&#lt mut #ty>,
+            )
+        } else {
+            quote!(
+                #ident: ::pin_init::__internal::PhantomInvariant<#ty>,
+            )
+        }
+    });
 
-    // For every field, we create an initializing projection function according to its projection
-    // type. If a field is structurally pinned, we create a `Slot` with `Pinned` which must be
-    // initialized via `PinInit`; if it is not structurally pinned, then we create a `Slot` with
-    // `Unpinned` which allows initialization via `Init`.
     let field_accessors = info
         .fields
         .iter()
@@ -991,6 +1014,30 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
             } else {
                 quote!(Unpinned)
             };
+
+            let (slot_ty, slot_arg) = match &f.borrowed {
+                None => (quote!(Slot), quote!()),
+                Some(BorrowedInfo {
+                    kind: BorrowedKind::Shared,
+                    lifetime,
+                }) => (
+                    // For borrowed fields, create a `SelfRefSlot`, which after initialization
+                    // turns into a `SelfRefDropGuard` instead of `DropGuard`.
+                    //
+                    // They're mostly the same, except that `SelfRefDropGuard` returns `&'field T`
+                    // instead of `&'guard T` for let bindings; this allows it to be used to be
+                    // used to initialize other fields.
+                    //
+                    // The soundness of doing so relies on fact that `__make_init` requires a
+                    // higher-ranked trait bound on the closure. Within the closure (which is the
+                    // caller of the generated slot projection functions here), it can make no
+                    // assumptions on the lifetime except for those implied by the struct's bounds,
+                    // and we have validated them in `generate_drop_check`.
+                    quote!(SelfRefSlot),
+                    quote!(#lifetime,),
+                ),
+            };
+
             quote! {
                 /// # Safety
                 ///
@@ -1005,19 +1052,54 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
                 #vis unsafe fn #field_name(
                     self,
                     slot: *mut #struct_name #ty_generics,
-                ) -> ::pin_init::__internal::Slot<::pin_init::__internal::#pin_marker, #ty> {
+                ) -> ::pin_init::__internal::#slot_ty<
+                    #slot_arg ::pin_init::__internal::#pin_marker, #ty
+                > {
+                    // CAST: `as _` is needed to convert types wrapped inside `SelfRef`.
                     // SAFETY:
                     // - If `#pin_marker` is `Pinned`, the corresponding field is structurally
                     //   pinned.
                     // - Other safety requirements follows the safety requirement.
-                    unsafe { ::pin_init::__internal::Slot::new(&raw mut (*slot).#member) }
+                    // - If `#slot_ty` is `SelfRefSlot`, the lifetime `#lt` represents that of the
+                    //   field.
+                    unsafe { ::pin_init::__internal::#slot_ty::new(&raw mut (*slot).#member as _) }
                 }
             }
         })
         .collect::<TokenStream>();
+
     quote! {
-        // We declare this struct which will host all of the projection function for our type. It
-        // will be invariant over all generic parameters which are inherited from the struct.
+        // We declare this struct which will host all of the projection function for our type.
+        #[doc(hidden)]
+        #[allow(non_snake_case)]
+        #vis struct __PinDataLt #generics_with_field_lt
+            #whr_with_field_lt
+        {
+            #(#phantom_fields)*
+            __pin_phantom: ::core::marker::PhantomData<#struct_name #ty_generics>,
+        }
+
+        impl #impl_generics_with_lt ::core::clone::Clone for __PinDataLt #ty_generics_with_field_lt
+            #whr_with_field_lt
+        {
+            fn clone(&self) -> Self { *self }
+        }
+
+        impl #impl_generics_with_lt ::core::marker::Copy for __PinDataLt #ty_generics_with_field_lt
+            #whr_with_field_lt
+        {}
+
+        #[allow(dead_code)] // Some functions might never be used and private.
+        #[expect(clippy::missing_safety_doc)]
+        impl #impl_generics_with_lt __PinDataLt #ty_generics_with_field_lt
+            #whr_with_field_lt
+        {
+            #field_accessors
+        }
+
+        // Declare a type that serves as the entry point of interaction with the `pin_init!` macro.
+        // We use this type instead of defining methods directly on user's type to avoid possibility
+        // of name conflicts.
         #[doc(hidden)]
         #vis struct __ThePinData #generics
             #whr
@@ -1036,7 +1118,6 @@ impl #impl_generics ::core::marker::Copy for __ThePinData #ty_generics
             #whr
         {}
 
-        #[allow(dead_code)] // Some functions might never be used and private.
         impl #impl_generics __ThePinData #ty_generics
             #whr
         {
@@ -1044,13 +1125,20 @@ impl #impl_generics __ThePinData #ty_generics
             #[inline(always)]
             #vis fn __make_closure<__F, __E>(self, f: __F) -> __F
             where
-                __F: FnOnce(*mut #struct_name #ty_generics) ->
-                    ::core::result::Result<::pin_init::__internal::InitOk, __E>,
+                __F: for #field_lt_ty_generics ::core::ops::FnOnce(
+                    *mut #struct_name #ty_generics,
+                    __PinDataLt #ty_generics_with_field_lt
+                ) -> ::core::result::Result<::pin_init::__internal::InitOk, __E>,
             {
                 f
             }
 
-            #field_accessors
+            #[inline(always)]
+            #vis fn __with_lt #field_lts(self) -> __PinDataLt #ty_generics_with_field_lt {
+                // Generate a zeroed to avoid naming all fields.
+                // SAFETY: `__PinDataLt` only contains phantom fields.
+                unsafe { ::core::mem::zeroed() }
+            }
         }
 
         // SAFETY: We have added the correct projection functions above to `__ThePinData` and
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 276b14a02d17..d06583e236a6 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -109,10 +109,15 @@ impl<T: ?Sized> InitData<T> {
     #[inline(always)]
     pub fn __make_closure<F, E>(self, f: F) -> F
     where
-        F: FnOnce(*mut T) -> Result<InitOk, E>,
+        F: FnOnce(*mut T, Self) -> Result<InitOk, E>,
     {
         f
     }
+
+    #[inline(always)]
+    pub fn __with_lt(self) -> Self {
+        self
+    }
 }
 
 /// Stack initializer helper type. Use [`stack_pin_init`] instead of this primitive.
@@ -322,6 +327,12 @@ pub fn let_binding(&mut self) -> &mut T {
         // SAFETY: Per type invariant.
         unsafe { &mut *self.ptr }
     }
+
+    /// Create a let binding for accessor use in dropck.
+    #[inline]
+    pub fn let_binding_in_dropck(&mut self) -> &mut T {
+        self.let_binding()
+    }
 }
 
 impl<T: ?Sized> DropGuard<Pinned, T> {
@@ -332,6 +343,12 @@ pub fn let_binding(&mut self) -> Pin<&mut T> {
         // pinned per type invariant.
         unsafe { Pin::new_unchecked(&mut *self.ptr) }
     }
+
+    /// Create a let binding for accessor use in dropck.
+    #[inline]
+    pub fn let_binding_in_dropck(&mut self) -> Pin<&mut T> {
+        self.let_binding()
+    }
 }
 
 impl<P, T: ?Sized> Drop for DropGuard<P, T> {
@@ -342,6 +359,156 @@ fn drop(&mut self) {
     }
 }
 
+/// Represent an uninitialized field in a pinned struct that will be referenced by other fields.
+///
+/// # Invariants
+///
+/// - `ptr` is valid, properly aligned and points to uninitialized and exclusively accessed memory
+///   and will live longer than `'a`.
+/// - If `P` is `Pinned`, then `ptr` is structurally pinned.
+pub struct SelfRefSlot<'a, P, T: ?Sized> {
+    pub ptr: *mut T,
+    pub _phantom: PhantomData<(P, &'a mut T)>,
+}
+
+impl<'a, P, T: ?Sized> SelfRefSlot<'a, P, T> {
+    /// # Safety
+    ///
+    /// - `ptr` is valid, properly aligned and points to uninitialized and exclusively accessed
+    ///   memory and will live longer than `'a`.
+    /// - If `P` is `Pinned`, then `ptr` is structurally pinned.
+    #[inline]
+    pub unsafe fn new(ptr: *mut T) -> Self {
+        // INVARIANT: Per safety requirement.
+        Self {
+            ptr,
+            _phantom: PhantomData,
+        }
+    }
+
+    /// Initialize the field by value.
+    #[inline]
+    pub fn write(self, value: T) -> SelfRefDropGuard<'a, P, T>
+    where
+        T: Sized,
+    {
+        // SAFETY: `self.ptr` is a valid and aligned pointer for write.
+        unsafe { self.ptr.write(value) }
+        // SAFETY:
+        // - `self.ptr` is valid, properly aligned and live longer than `'a` per type invariant.
+        // - `*self.ptr` is initialized above and the ownership is transferred to the guard.
+        // - If `P` is `Pinned`, `self.ptr` is pinned.
+        unsafe { SelfRefDropGuard::new(self.ptr) }
+    }
+}
+
+impl<'a, T: ?Sized> SelfRefSlot<'a, Unpinned, T> {
+    /// Initialize the field.
+    #[inline]
+    pub fn init<E>(self, init: impl Init<T, E>) -> Result<SelfRefDropGuard<'a, Unpinned, T>, E> {
+        // SAFETY:
+        // - `self.ptr` is valid and properly aligned.
+        // - when `Err` is returned, we also propagate the error without touching `slot`;
+        //   also `self` is consumed so it cannot be touched further.
+        unsafe { init.__init(self.ptr)? };
+
+        // SAFETY:
+        // - `self.ptr` is valid, properly aligned and live longer than `'a` per type invariant.
+        // - `*self.ptr` is initialized above and the ownership is transferred to the guard.
+        Ok(unsafe { SelfRefDropGuard::new(self.ptr) })
+    }
+}
+
+impl<'a, T: ?Sized> SelfRefSlot<'a, Pinned, T> {
+    /// Initialize the field.
+    #[inline]
+    pub fn init<E>(self, init: impl PinInit<T, E>) -> Result<SelfRefDropGuard<'a, Pinned, T>, E> {
+        // SAFETY:
+        // - `ptr` is valid
+        // - when `Err` is returned, we also propagate the error without touching `ptr`;
+        //   also `self` is consumed so it cannot be touched further.
+        // - the drop guard will not hand out `&mut` (but only `Pin<&mut T>`) it has been dropped.
+        unsafe { init.__init(self.ptr)? };
+
+        // SAFETY:
+        // - `self.ptr` is valid, properly aligned and live longer than `'a` per type invariant.
+        // - `*self.ptr` is initialized above and the ownership is transferred to the guard.
+        Ok(unsafe { SelfRefDropGuard::new(self.ptr) })
+    }
+}
+/// When a value of this type is dropped, it drops a `T`.
+///
+/// Can be forgotten to prevent the drop.
+///
+/// # Invariants
+///
+/// - `ptr` is valid, properly aligned and live longer than `'a`.
+/// - `*ptr` is initialized and owned by this guard.
+/// - if `P` is `Pinned`, `ptr` is pinned.
+pub struct SelfRefDropGuard<'a, P, T: ?Sized> {
+    ptr: *mut T,
+    phantom: PhantomData<(P, &'a mut T)>,
+}
+
+impl<'a, P, T: ?Sized> SelfRefDropGuard<'a, P, T> {
+    /// Creates a drop guard and transfer the ownership of the pointer content.
+    ///
+    /// The ownership is only relinquished if the guard is forgotten via [`core::mem::forget`].
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` is valid, properly aligned and live longer than `'a`.
+    /// - `*ptr` is initialized, and the ownership is transferred to this guard.
+    /// - if `P` is `Pinned`, `ptr` is pinned.
+    #[inline]
+    pub unsafe fn new(ptr: *mut T) -> Self {
+        // INVARIANT: By safety requirement.
+        Self {
+            ptr,
+            phantom: PhantomData,
+        }
+    }
+}
+
+impl<'a, T: ?Sized> SelfRefDropGuard<'a, Unpinned, T> {
+    /// Create a let binding for accessor use.
+    #[inline]
+    pub fn let_binding(&mut self) -> &'a T {
+        // SAFETY: Per type invariant.
+        unsafe { &*self.ptr }
+    }
+
+    /// Create a let binding for accessor use in dropck.
+    #[inline]
+    pub fn let_binding_in_dropck(&mut self) -> &T {
+        self.let_binding()
+    }
+}
+
+impl<'a, T: ?Sized> SelfRefDropGuard<'a, Pinned, T> {
+    /// Create a let binding for accessor use.
+    #[inline]
+    pub fn let_binding(&mut self) -> Pin<&'a T> {
+        // SAFETY: `self.ptr` is valid, properly aligned, live longer than `'a`, initialized,
+        // exclusively accessible and pinned per type invariant.
+        unsafe { Pin::new_unchecked(&*self.ptr) }
+    }
+
+    /// Create a let binding for accessor use in dropck.
+    #[inline]
+    pub fn let_binding_in_dropck(&mut self) -> Pin<&T> {
+        self.let_binding()
+    }
+}
+
+impl<P, T: ?Sized> Drop for SelfRefDropGuard<'_, P, T> {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: `self.ptr` is valid, properly aligned and `*self.ptr` is owned by this guard.
+        unsafe { ptr::drop_in_place(self.ptr) }
+    }
+}
+
 /// Token used by `PinnedDrop` to prevent calling the function without creating this unsafely
 /// created struct. This is needed, because the `drop` function is safe, but should not be called
 /// manually.
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index d1ed0561bb27..9ffa76434310 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -923,6 +923,7 @@ macro_rules! assert_pinned {
             let data = <$ty as $crate::__internal::HasInitData>::__init_data();
             let data = $crate::__internal::HasPinData::__pin_data(data);
             _ = data
+                .__with_lt()
                 .$field(ptr)
                 .init($crate::__internal::AlwaysFail::<$field_ty>::new());
         };

-- 
2.54.0

