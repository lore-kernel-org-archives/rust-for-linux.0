Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021138.outbound.protection.outlook.com [52.101.100.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E724E420465;
	Wed, 23 Sep 2026 18:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187643; cv=fail; b=qadOv0YJ1bsHkNN8ASpQXy1ralyUwlbee+SY8cHpMP2dkf3v/qmCFCV4ZgRgRGgWZhvdnGbkWRG7Z9ym2HhpGo+zgiRsy3qAvuqj/621mDrnI2u9nR7XFGS21o3s10FliwyqHnKYxMvJD8H8n+lZo9bLP+iVox6BoAnqf7ZdIu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187643; c=relaxed/simple;
	bh=YvZfdNwUOwsQs5UFHn7sZEmhY6YcE48I0OYS7o9T4zY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UxiPkhOrkBQ9KHJwY4HDgnri8eZD+m5k2kaqaxLFhba5X4wVDk6+ynU4HGbWBcovrqun+mgoQ23BuP8lVTnVZoUKnYPoZKwF+duprIbwAFHrzkaRqg09JBQKbOktpw570zfqJhezH/9hJFhvjvt7617+bYVHPdpzkrxMsL7YMc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=hzvkNrcQ; arc=fail smtp.client-ip=52.101.100.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="hzvkNrcQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPpkUw4FV66LGZv1lHdeBuLUBYSFqxoDaf2Rb/D3wv7zzIyuoHXrKND/c2pK3vb4EzPpg0ORfdgm/cz8ztDnvsr9NSkn75bdzLlAOHBzoksNplOWMDoCg4RI+VpSCly2j3CK3VuEU7567PDuONPeKfVnf4vjrFmt+rEDbbmB4WAGPJTGez5Otb6k3dxmFYMxaJeTVBlr9u7Jb9gcK4rMexPSZHOCe0fDNldYqrU/q5UPEa95VPyE3EN7UcCyWLaIOAY34h3Grnm5qId+IG5YQxXRWR8QHadcy5Yd4zvR+L11FrOCTXuH0aQPw5FrCSvDrfio2DcNrFBnVZdjGBDUfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUsp1/YjtYQF+4ZL5P0BMlccI5QrFymNSJEjTkLK2U0=;
 b=ZORsoBe66XhuRbhrXQcT2CzjDs0RJ254l/UGzxw7SQig/44JxQGhOztW3CAPcGiG5lcbyqw1Vjf+OtKzhq/9kuXsV19FmF672Up3Oi2DpuBNbK/bw/UuLNFmxG64NG5bIc5ZrnoUb9LKKR8s+8CFqHNm4JPpCAvmQ1BZp/hmc85deYXOVsEMpxpYLGxIwWbJ8o/+bI+OIosLN+2kdMp4qUOUxWKyIw/dvd/ZosO5nmrxf56uKMR+cS8m0ixlww/1WCPm1wVuQO5G3UekDOtRN8jcptmssDKSxejTvikqef5Rmucq9GQaCL92mIXoRK3nyxFcw6k0ytojYVrr340auQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUsp1/YjtYQF+4ZL5P0BMlccI5QrFymNSJEjTkLK2U0=;
 b=hzvkNrcQhsGnUiPA4xgrO5++j1W+LBRHc64wXRpWrQQISo9xASh+MOCeJxySqTWF7o4evjvA9qZWEpEKOEPDzp85hv8nJoij9VR3XPTYyYM9KOLc9eloK6S4Q6F26aoQM+JpqpQ5LnMRhi8d53+aSdRjCX9RWA5DCXKiBfqrU+8=
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
Date: Wed, 23 Sep 2026 19:20:18 +0100
Subject: [PATCH 5/5] rust: pin-init: add diagnostic attribute for `PinInit`
 and `Init`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dev-pin-data-diag-v1-5-e4d7193569e5@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790187630; l=3057;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=YvZfdNwUOwsQs5UFHn7sZEmhY6YcE48I0OYS7o9T4zY=;
 b=nebaay/Aev9X6j6FlgjvZBv4tCRq5gWm16SeEMHEO3wJf0ADVSz8SCz/Gpmgvxmt9O333eb/f
 ZIqhLC3Ve65CipLCOM9vWQGJ6qmnY6EvWh0iSrERfX7NLkklyaefb+H
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
X-MS-Office365-Filtering-Correlation-Id: b7dbb0c2-91cf-4f2e-2684-08df199f5b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10070799003|921020|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aoxBAzWe/4p6zFC/wWfNzzUBbFShVDdCWIhICrx01dulAhba9+X8ERNW8xfiFf2iFEJxbXdBQ/ynEf38zhfsn6H4FqVPoUgGqblNW7Q8VZaYWqltssHV6myx6G9GkmuH5r9J/4s4JKSMF2nlsazLCCSFiHTMj+W/dEuPS5bQtfW44zDcgTvuk0FJGwDaZqh9WD5+eBqJiJZBP+VVkDNQF6t8iRIRgphvz1Nwb/hwXyCQ0mNS3/4F4J1Q6OYaI+49TQgwkpfH1EBuqSyACkoMtGY4cwvFtcqlHocthZE/paMQgXb7+hupszvgl8FbfWhzhAkTP1TyzrUQmc4sfMRgoOOX6uOd1zqpS0D8zvXKbkkGdFDsPkkwJDlAzMp1JJIgpKBnvEl8ztiHkXAviDCUTD+3DTXWFU9DCBELjq1DBkVR7AgSVs+va7d/0vMlJQCYBYXUrZsGbgE5Z/WpYa4vTIt2t8mu5T0drNyJpfr9N/prL/wL8J6Ay0PKtp3d8JHRurcT+LDj0fRFGpG7SUVuIgve64YMTLqDmpRpKSyuUpI3asUh1NYko8TR3UBMbEvVQwqnfouRdQuGSITaHE3MZ0OjlCSmh9ey8dZ5WUKNhz6QSvVuPMLGX7PJVo2Isld/cMs02uyMhz5Uq4WLqAMY2s6dv+e27oxdx1hfyw2DRx+oKRbpDGPbCOLtujeWRSLtoRWdxdKt2INIMiVJhZ2xAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10070799003)(921020)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXgreCswN3Y2U0lIOFVGdXZFRVJUN3hpazgvaDBjYlhjZ1pEWmxZNEhVa01z?=
 =?utf-8?B?em9pUUVCRUNqdkN1cnR5MDJyNFNNUHpCNmt4TU9iUi9TcGZWNTdjMFBhN0k3?=
 =?utf-8?B?dkd4RlYzQ2pYREZqVVZoVzN0Uzc2WnVQWXQ5NTU4cWE3WHZrdTNVdlBGNWwz?=
 =?utf-8?B?Q1lIdnFNRUJvUExWSUVMZWhYZ2tDMzZwcFZjVHlwVERHOUtXekhrcWNlWmhq?=
 =?utf-8?B?V0d3dTRVWWFWNGxGM2FiUG1iMzA1bVlCZ0REbnlUWGtiTTRKTE9IZlVwMFJV?=
 =?utf-8?B?T3RteFNaYUxLQUg3Nm0zRmxXRlZzMUhKckc1bDdNUGl3dk5ZSmJHQ1lZdUF2?=
 =?utf-8?B?NnR6aFZpZFZWVTlreisvOEUvaXhJeG4rRmI3dlM5MUdRY29ndUc1T2plOVdl?=
 =?utf-8?B?RUh0czlaSW1TVlVKeUlMRTVGN0o1emdyZkQ3Nm43NGY3NjkxakxVdmE4MDBE?=
 =?utf-8?B?cE1FWUxLYjEvbmo1KzdYbzJsR0hDV3VRVm4zQ3VZdGU3Vk5JQld4L3VWL29w?=
 =?utf-8?B?SXpYRXpia1o2b2dJWFNCRDVxdGpFVkM5S1dGVjE1di8yTUFXaTkzQk9iRXEy?=
 =?utf-8?B?QyswaytIMDc0SjhQNUNlSjZva2wvVU8xdjU2TkVtSFUyN0lYcjNseGU5OENP?=
 =?utf-8?B?bE51TGxJZ0NwUlNJNmU5bE82b1lxWHJ6ZC9tSTlCRVBNN0ZCK3VSRG1XYVlE?=
 =?utf-8?B?eWJvK09qQlQrRS9kOE4xeEMwbE10Uzc4akZ6MnJUb3ROWEl5MTI0aXpDODd5?=
 =?utf-8?B?SWlWNEhDNVpkUVpid3FqS0JPREZ2bG1sNHR0V3JFV3BmajFFOTRJMGc2c0tS?=
 =?utf-8?B?VHV6MkNWMElOWXNuMVAyT05qM3RMRm1COFFVNzNrTmx0b2Y2L1A1ZmRXSmtL?=
 =?utf-8?B?RWxiRm9HK3RhcXFGeFBKcnJKUEltNk5rT3gxMlRlSmxGTUtrdlVuZHdDYUlC?=
 =?utf-8?B?emZCYThobXliQXdzbGFIbUkzMVRocDd0WEdwdzFXNjJsZjFxS1RVZUxVbXpx?=
 =?utf-8?B?Q2NkRXJ0RmJaczJmZXB4WlFzbjJBdC96SDducUtQZEpOVUthbGdNaUZ4Qm05?=
 =?utf-8?B?djBKSU1Wbm84S0V5YXJBcVdxbCs2RWJwcTJRRkhhTzBuTFdPTmVJdVlJNWFW?=
 =?utf-8?B?VlBpU3dkaThYSGxOMmhWMGd5THVKeTRDRnZzUWFIcFpoTHVyb2hrWGZSUU1X?=
 =?utf-8?B?TEF5SG5WaEwxbmluS2JMWi9CNXd6NWxUN0U1NTM3ZFZQZlI2ZmtXYXE1b1FQ?=
 =?utf-8?B?ZElxaktKRDhtcmZObFJ1RTlxY1BPOHd6cDhPUWpvdnRqd0p6QkJNVGdxalRX?=
 =?utf-8?B?b3AvQjU0MGc4ODIxaWQ4NHNYTkw0S25vT09pdkhYMlVGUndJelFzc2dWK2dm?=
 =?utf-8?B?cnhrU3JZV1AxZm91cGdtcUh1WmJVQzZaZWJQOEdodytGSldieU05alJ4REtP?=
 =?utf-8?B?Y0N4OTVtWDFvRi9NcnFLZGIzN0J5Mk9vTHQxcHZLT3lOaUhzYXFCVHJvdHBt?=
 =?utf-8?B?dXJkYVFRSzc4NElSMm4waVBuVEpvOG04QVh4ZzVXb0tGM21MVFBJa0Zna1FG?=
 =?utf-8?B?YmE1b01qd2I1NWd1QXBnamxBeTZmem9MSitET3JnSWwrYXdVSUx5bjd5VzhT?=
 =?utf-8?B?UTgxeG5DZmFxdERRRkVOS2NaZEdLY2taN0hOMm14eEpOZjkvbEo0K21WbzVk?=
 =?utf-8?B?K2w0S243N1dzZ3d4T3lrNUhoUmNSVC8yZHhyQ21Hak5uZmZXdVFobUxTVlVY?=
 =?utf-8?B?bVY5MndOTk5HV2xHR1VjK0Zwb0hHNElBL2lXN0pveHp1SEdZeGlObW5ia0NV?=
 =?utf-8?B?Zk1iZTV0Wld0enh6aHljaXQ0UWlaODZoRzBMNVhEdDlVd1hEdFNibXZ6RjA3?=
 =?utf-8?B?Sjl1OUxSL1BWMzN2cFJQb2lUdkdNVHk0NGVHTUh4UmlPQThwbkNlTnpjNUVv?=
 =?utf-8?B?MFVQcTdJUktteERWR3dFMytnUitJV0t0Zk8za0JodElpNXRXa1NRdFBjUFBn?=
 =?utf-8?B?TmpBU1YxOW9pc0c2NnVlRW1hN2dQaDZrMGhvSktLanRxeDFKN0FMYkxBdEtu?=
 =?utf-8?B?RlZSWDUwTEU5QkNFR3R2dlk2bzd2QXJUYUlYS2hFdXlUMWI1allqSTc3aWFq?=
 =?utf-8?B?d29rZE5JdjV5blpnc3pZajVsOFIwV2FneFoxVHV2eFBIMGZaWkRVbC9uZVpj?=
 =?utf-8?B?REwxYm1sM1VvWGRPZ0ZiZnFIdE1BMGwyZDR0T2tQekcxTkl0c0UrbEdkcnlU?=
 =?utf-8?B?MllhSSt2WUR0S09hYkpHQWtvU2ZCRHRuN2tEQkx2Rm0xYlNFRUdoc09acVdE?=
 =?utf-8?B?dHZQajBPR01lZVIyM3NwYUVUMHhKYnBKQ3lDVzZGLy8zdVpkdXhzQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b7dbb0c2-91cf-4f2e-2684-08df199f5b04
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:20:32.7995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YX1BmGHLA25VwEoAoWt2rWeYB2lI/cEv4VWZtUvFd+wz67m4l4lS/kRGqs4I/I7cYOx2fQbW2IsqBpliHeIx5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6382

Give a slightly more useful error message when these traits are not
implemented.

Before this change:

    error[E0277]: the trait bound `impl pin_init::PinInit<Bar>: Init<Bar, _>` is not satisfied
      --> tests/ui/compile-fail/init/invalid_init.rs:19:16
       |
    19 |         bar <- Bar::new(),
       |         -------^^^^^^^^^^
       |         |      |
       |         |      the trait `Init<Bar, _>` is not implemented for `impl pin_init::PinInit<Bar>`
       |         required by a bound introduced by this call

After this change:

    error[E0277]: `impl pin_init::PinInit<Bar>` cannot be used to movably initialize `Bar` with error `_`
      --> tests/ui/compile-fail/init/invalid_init.rs:19:16
       |
    19 |         bar <- Bar::new(),
       |         -------^^^^^^^^^^
       |         |      |
       |         |      the trait `Init<Bar, _>` is not implemented for `impl pin_init::PinInit<Bar>`
       |         required by a bound introduced by this call
       |
       = note: if your type implements `PinInit` but not `Init`, you might be forgetting a `#[pin]` annotation on fields

Ideally, we would generate differnet message when `PinInit` is implemented
but not `Init`; that is not feasible with today's
`diagnostics::on_unimplemented` attribute. However, the added note is worth
it because in `init!()` is more rarely used compared to `pin_init!()`; in
most cases `Init` being unimplemented is the result of missing `#[pin]`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 319485dc18ce..d1ed0561bb27 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -966,6 +966,9 @@ macro_rules! assert_pinned {
 #[cfg_attr(not(kernel), doc = "[`Arc<T>`]: alloc::alloc::sync::Arc")]
 #[cfg_attr(not(kernel), doc = "[`Box<T>`]: alloc::alloc::boxed::Box")]
 #[must_use = "An initializer must be used in order to create its value."]
+#[diagnostic::on_unimplemented(
+    message = "`{Self}` cannot be used to initialize `{T}` with error `{E}`"
+)]
 pub unsafe trait PinInit<T: ?Sized, E = Infallible>: Sized {
     /// Alias of [`PinInit::__init`].
     ///
@@ -1100,6 +1103,11 @@ unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
 #[cfg_attr(not(kernel), doc = "[`Arc<T>`]: alloc::alloc::sync::Arc")]
 #[cfg_attr(not(kernel), doc = "[`Box<T>`]: alloc::alloc::boxed::Box")]
 #[must_use = "An initializer must be used in order to create its value."]
+#[diagnostic::on_unimplemented(
+    message = "`{Self}` cannot be used to movably initialize `{T}` with error `{E}`",
+    note = "if your type implements `PinInit` but not `Init`, \
+            you might be forgetting a `#[pin]` annotation on fields"
+)]
 pub unsafe trait Init<T: ?Sized, E = Infallible>: PinInit<T, E> {
     /// First initializes the value using `self` then calls the function `f` with the initialized
     /// value.

-- 
2.54.0

