Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020125.outbound.protection.outlook.com [52.101.195.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5A31427A;
	Wed, 27 May 2026 17:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902429; cv=fail; b=lXL9iz/EJOl524UTBnIOT92DVSF9wraKqiJwNjWnsbWrLzXnGmoYPVxlXlnlZjDSnwVHa1cTqoy/TZH6CxA4/EoviRqjSffwOkS7/z5Uvf2rO4Yg2IFie1pLqpgKf0Lkjw/CXLzNKH645iMrAfpi+DBp/bGSTL7aSbbNB22K0xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902429; c=relaxed/simple;
	bh=z17V869ig6MM8rLfkUp2rDQiFuW+jWeYL9W10JDYJ4w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gOtLccpLNSOtoeLW7KHsM5eQKXX3ahDrBfBzn1Gla/2VH4hnfyqPzcl/f9tQ48qTtsynznxd3Xb3rxHEDZ/jRjseVS20BmSp8ozkcNofNFXvmAxYZgyRhCId2Dz+HdzTuFQUA2qWwxdSpYYFd8U9yHhHgya1QBfEiHX4SXbWSL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GkD1S8iJ; arc=fail smtp.client-ip=52.101.195.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GkD1S8iJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsFo6TXnKzT/o/YfBIBipyFL2oIxXgRtttyfP6VBuHYjQbqOjBbGFLscJIj5vX3SZb6y63z7NHzLieRUNVoZiOYMbIoQ69iehitGNHdR+5+pfG7g9mMATmIsP67hmt/YqFlQH7bSrr1QMJJnRhQhuf/mTx38NO5x+yZxXw0E/FGwvIEExZlFxi7HpTMRfN9J5Dn3wZQy7OB9gppLkTM9xRK2OoDn1f1YOtKgYMhUC0LwFNnAxPywMTGphK4bxHQo0ww8yigPdK6tM5rEg6z1IEXv2iOBsF/9HX7p/9yFMcba6Q3lRYH9gsjgzOur4m/I17ZuUfnSrgjegXCs2/h8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PMsvyIHmDCobe+L00gq/xhllURHepbJ6uS1ZlEjCQI=;
 b=RJfv2fVOZr7s5nmLdXcsa2L9cf+1UKbL9WcRNLvducCHNlUTNf/4gLAJKr5SFV5ucHrvzMnGIF75NaKQOB1DjXZhKC95RC6GqG2vdLqyvJwbmdI+Fx2XAQ721NL4T9n73uZZMqX66TDJ+Za+cvcPiiGKCl/dUX+Fiad747HTgYHAqzcHS62LQDMXs67fVMLpM9mSV6/PHJYdWljEycb71KRzSf/jijdWmx/KTgIPNSITJugZ+tM4nnZREUO1P/biaIQH+XgqGIA7v8F2t/wnPyYW20gwuLkRysyQfqezoyy/QtztjD8tW+WfBPTV6dzSQBoGVFZmSN0PnTveEIR8ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PMsvyIHmDCobe+L00gq/xhllURHepbJ6uS1ZlEjCQI=;
 b=GkD1S8iJP/Apj++v4V0Whhowat+vAa53g/EVVOxb9RXyQkrZixzd+oyMFQyQSYeO33MwWxh3ZAkDFq99aLIb11sWzgx4QZb49NjbGTcpZbcb9U2frt6h60RfScOxOzfF0yJEQnvsp6ot1qkMKEOVUB6J7Ak+CEjYjWrKL/N4JDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO8P265MB7781.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:20:10 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:20:10 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 27 May 2026 18:19:59 +0100
Subject: [PATCH 8/8] rust: pin-init: make `[pin_]chain` unwind safe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-pin-init-sync-v1-8-e20335ed2501@garyguo.net>
References: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
In-Reply-To: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, Mirko Adzic <adzicmirko97@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779902405; l=2555;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=iVy4JUEB9gvWWijKQRqERK1MJazdzl2rCyv/ahAoS/4=;
 b=yNtEs38MlVRY4oLERN1WPeZ9nLBharrXSIcig2D8YmouwTI7VC1NLcnHxUpjUTTDU8KNtDrVd
 6o4VcvkzRWvBEjnYVDc8FXjW4tb46ithRKLcSIBk5hLC2hiDrqzt7wv
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0524.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::9) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO8P265MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 8680ce8a-6eb9-45c1-48e7-08debc143387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|18002099003|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	rPrzHAOyMttUEL+eYf+F9Cyyends3lZp10MRHm4tEc/iAAckcEzK+7yqs2rya5CvsOSEpchJdbo7/fxqdtc2HXEPQY3056oRhFRhvpnFt2B5YAcuBNk2nby9WVIA5pMF27feFwknbPt6JBU7jWM5XCqHudzWyGQiGtzZO1l6D7hLNWrBjt95CNBiKtwbrYwxUzBl0XmnrU2AhxzGjXxIGVAm6IZCQZj05LdKeDmJxg9VAV1WYjfTxp/v4oGgxObFOvjyMwPnxXCHZw9lk8DXF2J9FslXJS40kFR/3iZyse1Pj1Z3SspbTRYnT5hwBQtTcSH8E5k3BZrsuIX6rRYNX+7UrWmdSilti3F8xmkeujps70a0QxWwt7oaHNJShgfwIoBXu3KUkfT9teuaJ4T1OPldxE53UVoMlOF2qQ5e1sy5pw68pMZm5VCj/Y5VKDJTjPniMyGXkPcXoJlrb94dv4bPIyKRQVE3Wrqa6ps2UG39s2n20kJ/FIqbCpjmpka//yKXZ5eCrOaKEu+GL5zw/mjVAKzr/FqzoQZJJm+1r5vaKmDqYmtonpB9dZ+qFECdfubTOFvnjxTRuREUEmaEIxI+8eaGYPJ7KP5UtXJWihIAScFQO227JO6qtyBnGraCQvfXgpZEil6psHHLcaf2biKD0R1+n1iz+eW873/iBLkJovBjzQzl5lD5k2CBOyt9oMxIiS2kTI3NIryQPaF5nw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REQrQlIyeitDMGNMWEdMcGRtV0ZGdVVmM0R2MHloTnBxSkhhN0lSYzlnUzVj?=
 =?utf-8?B?d1ZJWWdGYUlNSER2UHhTVzllNXlkUWI1RjBlaEFscWNSZGkxWDg0SmhWR3R1?=
 =?utf-8?B?Q2ZHaUFYTmM5dzJwTFpPYytOajRUNnBNeVFLdEk0SFVmQmtPNTR5RTV6cXVZ?=
 =?utf-8?B?azdNbDB1YlF2NXh1aHhlZVZtTzArK3RoOTRpNmpOQUhFV1ZQbW4yMFE4M2sr?=
 =?utf-8?B?bTI2SzdpS0pSTXBVOHR6R1BjeDhMUnA0NXphWVdmME93cXJvd3ZkWlJkTE56?=
 =?utf-8?B?NmNGU1dha0swenllT0JYREg4ZG5JckR3TXQ3UHlVTy90SVphS0tKcWNHc0M3?=
 =?utf-8?B?NWpWS2loQzRiMUQzbnc4TU9JUVZ6YXlJVzc5UzNRbDVSQ0V5RWZZZ0Nwc3ow?=
 =?utf-8?B?UDBtNXJSK0tpcVYzZzQ5eFFzMWluOVRkMm54N2wyNWRWYUZtd0RYVkFXZHg5?=
 =?utf-8?B?UXR3dlpUYldoUG9UVS83aWdkZ0hlcVc5b2ZZSEdtU1RCVkdNOWpPam5oaDFB?=
 =?utf-8?B?cUY1RGNqcEEyaXNnQW4zeHdLLzIySENwOWt0K2NwSTVkNW5aemlNMXZtWUJT?=
 =?utf-8?B?NDBtb0VtV2M5SVZjN0hUWlUzT09CSitodDVJVGdxZWJKZzNJOVR6MHJ6ckJj?=
 =?utf-8?B?cVdZOGQ3bmFXSC9OTlBDWldkRkh5cjdSbUtTVFhMMXI0QUY1TWpmWHBEb1Fu?=
 =?utf-8?B?eEpXNEt5cUs2V0oxNStiRTNBNDlua3dlaVJyY0I0ekJncHN4YmMyVFhkWmFx?=
 =?utf-8?B?ckZabjltNHhnRlY1d2RLeEh1SklGOFVkQWtBWGgwWk1EWmx6V1FrK2djSnNV?=
 =?utf-8?B?cERxS0ZWajBzYWxaemNuQ2hzNHdDb3ZrMENnaDRRamd0Y3g1bDVFZ3BtYkJz?=
 =?utf-8?B?d2hSdTJFVTI0S1RWMXpzMVdjQ1dNL1lTRFJ1eHByb0tnbGFhREVxRW1MRlg2?=
 =?utf-8?B?WnRCWlgwR2NRZkdUOWZTN1pJWTRZUzNBcktLUEtVb2I5Q0FkTStnL3hqdTRt?=
 =?utf-8?B?ZURqTVNBTXNVd3J6K0dac29LeWpUUTF5UjdZTFZVdVN2NzdidTdOQnl6YWFZ?=
 =?utf-8?B?WmF4cW5uVGRFVlE0M0swNUUrOFRvVGtBU3dNY2RwVDdHRXBJVjRGdTkrMHBk?=
 =?utf-8?B?NkQyK0RURDZpUVFqSENQcHVNUk4yWStpWWorZ3dzbWw3UnpGOUNOY0xHR3hK?=
 =?utf-8?B?dW8wMkhaaGhYdy9tSm1HSGNwNi9KbEFocUlWVmdWN044RFNETGd1Q3lHclF5?=
 =?utf-8?B?Nkdnem9Za1BLTUZSTmtxVkhkQnEwQ3oxbXg4Q3dKYmlCanhqcVJVMjEwNkE4?=
 =?utf-8?B?Q04zeW9ld3FhdUJ1NmZNaWNRR1RFV0xBMGZYY1NFOUxQZVNsbVE3UlREUytD?=
 =?utf-8?B?SzAxblJzRjJ6QlZOZjhNQnVuMkJwamxKbVZsUUJrUVloWjBtRjh2ZFVTQ3NH?=
 =?utf-8?B?WktPZEJGSlptM1BhalVRaTlkbmVmQ2NiSGVvUVNDditRWG1xSUFZaHlhbzRV?=
 =?utf-8?B?N29FNThzTHJYVHRpdGg4akxqaU1NRzZXMHdSak10TUkxWVpsRTlBdUZNQkJx?=
 =?utf-8?B?aUx4K1Q2Wlp4TFVpejNLWDBwb2RyUW1DazlXRndtaE1Cd2JPdVhLK245UkNN?=
 =?utf-8?B?TlRyU29oWmV5R1hGNTl0M2NTOE9GWjFhZjFaWERKZGRVWnVKeWZNSUVYeGRY?=
 =?utf-8?B?QkN6OWR2eFhyL0dsRHA2cno0OFlrRzFobCtpS1RYQVVHbFVFcmo1UkV4T0R3?=
 =?utf-8?B?STM5WVN6cHR6SWFRS1doclRiYXEwUnp0OHJrQVVxN0J5RlV5Z3dFVmxvamhB?=
 =?utf-8?B?OUw3dTBOd2JLVXVsRitzZGlZOGc3SFowWXZpSnMrRWRETWRtdnEyVWZ3aEFI?=
 =?utf-8?B?bHMzWWNXYTFaUTFSWU9McEljeXIwMGlQblZyb3FMbkFYbjhlT0pXeVJVSGk1?=
 =?utf-8?B?RHBmVEFwRC9NV01ibUdHVFNDZDlDekJ6cGYyY0M1eUFSS2llem9UbWQrR05n?=
 =?utf-8?B?TERQdk5INExEUzJOOGV6YlZUMXJwVExqdmtmak4wTGJyemU2RllGL1NmRmw3?=
 =?utf-8?B?Tm5SQW8vUHYxVkpMeUtzUkg0ejlBR2lMYVdJd21lMFp3ZDkzZDlrVUdkQmJB?=
 =?utf-8?B?UnNLRENpVko5NDE4M0lUNkR6WGFIQ05lVXRPaTdGa2tKQVg1SXo4TGpBUnFr?=
 =?utf-8?B?SjVackNhN2x1ZFBRRk1yUUo5eUtFeTB3angrWkRsQVVQZmFoZlNNVU5WRDNu?=
 =?utf-8?B?M2lTK1hDZ2RkUGk2UTNmbFNZZDZaVFVUU0JTbFRIU3VrUis5VGdOL0MrRnV3?=
 =?utf-8?B?RGZ6VGpRL2JrckJaeFJLaGJlQnZmNHpLZ3VaTVpaUXhrNnBMZ0hGUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8680ce8a-6eb9-45c1-48e7-08debc143387
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:20:08.4458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4XNMJAZqh21aZZV4N+biiaUAQx9zb2G6fOf3w6irpny/ay1shnbwQVhaIpbSShGBiK5u/bljX368F/e1AJkHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7781

From: Mirko Adzic <adzicmirko97@gmail.com>

Adds a drop guard before the call to the chained closure so that the
value initialized by the first stage is dropped if the closure errors
or panics; `mem::forget` the guard on success.

The previous code only ran cleanup on the explicit error path, leaking
the first-stage value if the chained closure panicked.

Reported-by: Gary Guo <gary@garyguo.net>
Closes: https://github.com/Rust-for-Linux/pin-init/issues/136
Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Mirko Adzic <adzicmirko97@gmail.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 1fdf9c2366ff..b5af88c9e48b 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -965,13 +965,11 @@ unsafe impl<T: ?Sized, E, I, F> PinInit<T, E> for ChainPinInit<I, F, T, E>
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
+        let mut guard =
+            unsafe { __internal::Slot::<__internal::Pinned, _>::new(slot) }.init(self.0)?;
+        (self.1)(guard.let_binding())?;
+        core::mem::forget(guard);
+        Ok(())
     }
 }
 
@@ -1072,11 +1070,11 @@ unsafe impl<T: ?Sized, E, I, F> Init<T, E> for ChainInit<I, F, T, E>
 {
     unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
         // SAFETY: All requirements fulfilled since this function is `__init`.
-        unsafe { self.0.__pinned_init(slot)? };
-        // SAFETY: The above call initialized `slot` and we still have unique access.
-        (self.1)(unsafe { &mut *slot }).inspect_err(|_|
-            // SAFETY: `slot` was initialized above.
-            unsafe { core::ptr::drop_in_place(slot) })
+        let mut guard =
+            unsafe { __internal::Slot::<__internal::Unpinned, _>::new(slot) }.init(self.0)?;
+        (self.1)(guard.let_binding())?;
+        core::mem::forget(guard);
+        Ok(())
     }
 }
 

-- 
2.54.0

