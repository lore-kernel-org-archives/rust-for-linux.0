Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021138.outbound.protection.outlook.com [52.101.100.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702E718A93F;
	Wed, 23 Sep 2026 18:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187640; cv=fail; b=j9HRax/GVQLKNlIwmd7HJAuNZoZSAyYllZd2eU/ImlkV99/FKCO/JxBYo8+7BghIoZz/0HPgieg6rTDZZA6q3By42ia1/TAKJH8IBdKqsfkP9WgPfE32ODGEKHBMB2CByxMY5IL395yhXtLoqd2ulkN2N2Q8ZCP52NRZ9/9AkQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187640; c=relaxed/simple;
	bh=5R7NAa5HXecKYEaNTGP8SYZyncqt4Ip+CDV6K+KM3m8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eSYJhgKqYYITx2ChUdyNuWtwQv5MDZPrs3VREC3IdaIc5NxEL/pAPyEAPlSFhhmCpjynrsFKz6MtD9kUj/1Nh0Vx3xX/aKV7mD7QY3vrMMfj9lrzLlCwWSEXqEAvb5dp8Mi0vqkpbIxAR/GXGJHaA9fukbeY0J9AMHpGgstPPQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mEkVJoAG; arc=fail smtp.client-ip=52.101.100.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mEkVJoAG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZi2Oq24iIkK06bCbPuPlKL9QCjclVw2J2296szfKmJBmOraBx1Dh5ScIPaNHxehjfGwnJk7pw3MRHj9YccvdAGbALY43fDKr+zQbRKlK+tLHyNx9JDiPOAgFRUR/e5GiwW/NG5ty1lVBNAbhqg7Zhv7vx2fSCStg5MBOr9UgQ6bnGgGrS3HxLFWYyuPCdGIni83ioLNh0iMZK55fGqroXks/7OtcZJKhtX+bVSOmTP6mf+dPiUN97G7Jwx0dpZgrGUre2GliPy3ejCeTU8zDNn9pu6gl/ZmpdP2RwHGdUPZyQc4zqfz+cKqLlQ/2Xh6m8YOvexLIxov+kqc5TGcWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+4CsaKzRYfZ+WYl2rqOKVh+Whgs35scNlNJtEgG2Z4=;
 b=BDibz9eZcDJaCR17+k8ESmeb3OWyNbwqvi75+hN6B4m+B1/hn8NSqHohB458vg7x1iuxJCdnfukblxwTOlN0RJuxFVXRNvW4hdNVF5fVGbUoiEnpQw5T323A6WltY1K2nppxdIY2jzDC9ezTnbooDq0QEOoOsi1fJ46iBl8uaiB0wb7/00iyPMTXjPqc33BquTQU3BHthLvQ9FqlJREEyFfTqza4q0x6WCW4BYTwX2JnAodmA9DZJhOWpVOOndPC7kV/4CVyOjh+nm0szNFy5LnXUfg0KmNRFzyBoH3yuudlwrHPOhcR2MymEQoDiRtoaMeEdDlbYDplr+Hi5dBN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+4CsaKzRYfZ+WYl2rqOKVh+Whgs35scNlNJtEgG2Z4=;
 b=mEkVJoAG0ST8nxQB5CS15sXB+j+cMokVzDqBtvMlpKeNU5JfJnODYXK6zSNYBM1+SPnRgqiOlCb0ztjKdhWTeKiQai4Ps7O5iu7dyLGQB0Njce6ys8zaptPdWZef7cAaLGwwZ/ru+4N3+EXjdj+hrB1KU2z2nRv47pXLAP6hdro=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6382.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 18:20:33 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:20:33 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 23 Sep 2026 19:20:17 +0100
Subject: [PATCH 4/5] rust: pin-init: internal: add custom diagnostic when
 `#[pin_data]` is not implemented
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dev-pin-data-diag-v1-4-e4d7193569e5@garyguo.net>
References: <20260923-dev-pin-data-diag-v1-0-e4d7193569e5@garyguo.net>
In-Reply-To: <20260923-dev-pin-data-diag-v1-0-e4d7193569e5@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790187630; l=1880;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=5R7NAa5HXecKYEaNTGP8SYZyncqt4Ip+CDV6K+KM3m8=;
 b=6uOgF5Mox6XMfpKivU84yIVdQXsb+qx+1SAHt1s/Gtu6oi7ZRNowh5MAnNWnZpskkvxkAxQwg
 Eg66cop9ceFA6YwAlyxqtRbchghAsY0Nyrdcuj/T3esL1/1yfd88Y2I
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0182.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: 846b4d34-4dc3-467e-0d91-08df199f5ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10070799003|921020|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AIO2aFgFy52f2vtCQpY1XhLCkIAgMeGIwV1fKfW+/r4HTN6V2iDw4dSjfoWKyP5lmDdoUv42Ixc+58GgSUujl93OXKV4wqIOISJosdM3oqc5UVX6W1p9SKV9P7q/sz4phwY8JbEOnIp/iqhz5cCZnl2++0EclHN0EU2h7TSvucswGiQ81FqthHvnLHJRvpRvYjwqeHElaADx/YLFJ4ufFTqrP7qoQGox+0vBbCE5wOU7VVhG1zdtAZGgYT11hsmTBDYWtVcaP7LTpUZDUoqKk5gUl/fOadZRzkIGNAq7xiVplsVxo/rTLPbJR8E+cWwm2auMfakREejTUmvy9dYgH1+3dGTJaoJpWmhZ3okPDs5oYtpWgK4ZEHjMdmv9X2RqiPklbnnBEisb5ULombL+dA4QRzcpEPuo5nR1/56ui4Rqh0f9I+uko0J2oRgp/GspqunmKWwq3+21fC8nPfXbrv1nCj7N8VZe3/VMixZL77XVegkAb/Dth9J2EJKe2+ZY+UXYOPG2nx7NqgSgC0eVuXZbmGMRoxkGpE0ysuUjEx49FGXr5/4CIwqzeHi5UQW2/XHnae+mQVd7wZ1IpuCDl8MBVdiLkol3pRWuiL0obw9xZBRXpD6rrNHDhPE/MYlDUdwoyUNVqE1EpiU/XVBj0hOPL+8uyXhXdtY+I2tqj+QagLo+liTCLM45x3uP5OWXw8LWMyM6VqJWNM6XOQJBpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10070799003)(921020)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STRJWnl2OGlhRTZNZUJHRE00cEY1eDZHMTFBVWxLUDVxRFVyeXl1Uks4anB2?=
 =?utf-8?B?RVBTTllqZVFlQTJ3U09VRUYyMStod2tPUWRnMksvamtlSzR6OS9Nejl0M0Z2?=
 =?utf-8?B?aEhGc0ZEQ2hma3pocy9yWVNXRG5aeVJVUHpaTi8zQkJreitZK3JGcklrcmQ5?=
 =?utf-8?B?TW5BWHR5OGdDd0ZTcmtnU3RueTRTMXBOTFJia3VHZXZRZ3VzeUZ2ZVFibzNn?=
 =?utf-8?B?ay9OZ0JPd3l4T21kMEF4TXNYQ1NRNzVLUnlBOUlkU1ZyQmtEV3dwRHh6ejdV?=
 =?utf-8?B?NVU2SGdjdXRnbEVFRjEvV2U4bGJLTkQrUGVwQTd2NDhPeDlVcklxaTl0eTB4?=
 =?utf-8?B?THQrQVB6c1g1TnRZNkNnUDlUSGtvbVhxN0J1VEZqM1QxTVRwVm5rajRmM2dJ?=
 =?utf-8?B?MG01ZnBtcEdqcDlOMkFrZ0xKV3hEVllSQU10Uk4vTWgzQ24vVmRqSDFoVnZo?=
 =?utf-8?B?WnJseXQ4dFk1K2ZMb0VMSHNCdTRMRmxYR1VkcTEvenQvSXI2RFg5K281L0NC?=
 =?utf-8?B?RTgwMUJ6dnBKd3ovM2lITTQrWmkrOUJGSFgzOG1wZ2k5QnhRRjQxMXQrSk9M?=
 =?utf-8?B?UmVQNHM1aGk5T3pKVnZuYW9OV0ZtRE9kMUxteG9wMFNKajVhVitHQnRJUWFR?=
 =?utf-8?B?cTA3KzVFU09zWFVNZC9INVJpdVd1cDNzcjBhNU9ML3ROZ0tlNCsvM085TW5H?=
 =?utf-8?B?L0ZLbmVEc0JhT3JvUSttSFB5VEtnbEN1R3lYQjdIQ21mVlZFMHdYNjJDYW4x?=
 =?utf-8?B?OVRMTkRjaDl1R0thSVJ4QkIxZFJqcEk4SnExRmo2anlZT0lYSkhPVTNMMW9x?=
 =?utf-8?B?NngzL2lrWlNTaHczMFkvdkh5Z0NRaGFiR1RsOXo1ZDFwVnFqck9ScVhuMG43?=
 =?utf-8?B?MTJzdkF2cVBZVnIyNUdFSlk5aWRFdVludzd1STZTSnhsWGFoY0Erc1pyYlNi?=
 =?utf-8?B?KzJRQXBiOFllVXpSZHFWN1VsejBIM0VhTVNiL1JOVFdJTG1KTSthdGpLNWxy?=
 =?utf-8?B?R1RuTlhvbnhBTTkrTHhjUDZmdUkzampVbkplaUExRC9wNzV4Q2Ftb2lGNmE4?=
 =?utf-8?B?QWMwMEFXZUxBWVlJQ3EyTmpXVmp1aVZoOEZxMXZqdFVrUkpIbnk4YUg3aGFS?=
 =?utf-8?B?eVdrajcrYzBYY0RwNnVVZURFeHltUUpkVVJubVJwMThGSWZtNXhWR1ZBZ2Yz?=
 =?utf-8?B?blMweDB6NlJNaWNTNUdkTlN4cnk5Q3huSUZTZ2dydTJUWDJNY0lmSXZNb2dk?=
 =?utf-8?B?VGdtZDM5SXNIa0pkczFjMCtMRmtBNGdJRzBhMzQrekNPY0s1Yng4WUhKY2tV?=
 =?utf-8?B?Q2wrdytqaDR5VDB6QktCOGRSK2hVT29JTVA3eG82S1NPTUpXc2lqczdndmJR?=
 =?utf-8?B?MHBFK1l5SzQ0aGErYzc4RlNFdHFXNmtNeklBR3dWVmh4OW1tdFBIVnlkK1lC?=
 =?utf-8?B?TFNmZDN6dE1GTEhTRjZWL2MzZVJ6d05sV1lITWRwZXk3bnpOZkc3MDFpcVJU?=
 =?utf-8?B?eXFNek1hMEtSTHl4K3RMRmxQNTZLQlF2T1BQenlRSDcxOFlSVnVjMUxVTGxt?=
 =?utf-8?B?RTRlLzZJZEpMSkpuRE5XQTJjQ1UwMk91eG0wT1ZkQzUwaWRRVDNEOVVkV3NV?=
 =?utf-8?B?ZFlRNWFQOWVRQWkzdHFuaFNBRXhSY040SHZONXg1U0piQlBmcGNUWXgzSFZX?=
 =?utf-8?B?WURrbjJVWFF1S1FKbTF0d3YzZU5GQXVaMGZBZ0o0Q2RBVjhWbDBMWFhNQ29R?=
 =?utf-8?B?Z3VicHhZaU1oM0wyZnlDa3dNNWtQU0MzV21yWWxleFUvR1hLRWVYL1MyMith?=
 =?utf-8?B?LzFvTzB0a1I1WUF4Y2tiYi9mQWxoYkNDSWZnNjhYN3dWV0czMTdtM2podWhm?=
 =?utf-8?B?QmxnWUMyT1NqUFFrRm94blVqc0lnWWZFWEo1YjdsZUUwb3pKbDVLd2RRRldt?=
 =?utf-8?B?cDN2UTNCM1NWNVgrakZpZWdJU1BBYzVvNFpseDZSOTNXYUpsVnFqc04yTjZa?=
 =?utf-8?B?ZUtVQUJ2SFlFKzdLOWcxK09zbUw2UGRFYXVLMG0xRklhcys5ZFlLdGg4MktM?=
 =?utf-8?B?WTBab1NvYlRWbHV6NTdrTkRUWDlGWGlLbzNHSW9FS3RTSEw2Y3BjMXZwbkQw?=
 =?utf-8?B?ZnNZdmtObHFNSzIrMjZOSkxjRHVISEt6azhFR2JITnpiblVqSFFrUjBvbUhL?=
 =?utf-8?B?U0h2S2svVDJhNDZOSGozMXFDV3RLbVJEa3pwWnhFVFlKSFF2N2U1UGZwT1k3?=
 =?utf-8?B?MmJndDM5cVkzTUh3dVNJdlVlNjY0c2VzekdYUjV3bVIxa1UvMzRJQUduRjJZ?=
 =?utf-8?B?ZExFTjRRSFVad1FjNS9seW12azBvakRlcjgwVkNFRGZiQTBnRVp4QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 846b4d34-4dc3-467e-0d91-08df199f5ab6
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:20:32.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVfXeNU1icSR6br5KVbTDU6/pG2SWa2d3R7peYzdmKpKd7hDP6MfZsxWCBXBQOKiu/xHDxkAZZkg8QhfOoK4uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6382

Produce a more helpful error message when `#[pin_data]` is omitted. The
error message changes from

    error[E0277]: the trait bound `Foo: pin_init::__internal::HasPinData` is not satisfied
     --> tests/ui/compile-fail/init/missing_pin_data.rs:9:19
      |
    9 |         pin_init!(Self { a: 42 })
      |                   ^^^^ unsatisfied trait bound
      |
    help: the trait `pin_init::__internal::HasPinData` is not implemented for `Foo`
     --> tests/ui/compile-fail/init/missing_pin_data.rs:3:1
      |
    3 | struct Foo {
      | ^^^^^^^^^^

to

    error[E0277]: `Foo` cannot be used with `pin_init!` macro
     --> tests/ui/compile-fail/init/missing_pin_data.rs:9:19
      |
    9 |         pin_init!(Self { a: 42 })
      |                   ^^^^ unsatisfied trait bound
      |
    help: the trait `pin_init::__internal::HasPinData` is not implemented for `Foo`
     --> tests/ui/compile-fail/init/missing_pin_data.rs:3:1
      |
    3 | struct Foo {
      | ^^^^^^^^^^
      = note: did you forget to add `#[pin_data]` attribute to the struct?

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/__internal.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index f236db47d18b..cb7a0c3066b6 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -83,6 +83,10 @@ pub unsafe fn new() -> Self {
 ///
 /// `pin-init` relies on the correctness of the helper functions defined on `PinData`.
 /// Thus, only the `#[pin_data]` can implement this trait.
+#[diagnostic::on_unimplemented(
+    message = "`{Self}` cannot be used with `pin_init!` macro",
+    note = "did you forget to add `#[pin_data]` attribute to the struct?"
+)]
 pub unsafe trait HasPinData {
     type PinData;
 

-- 
2.54.0

