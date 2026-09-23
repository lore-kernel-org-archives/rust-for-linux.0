Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020120.outbound.protection.outlook.com [52.101.195.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CAB4219F2;
	Wed, 23 Sep 2026 18:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187642; cv=fail; b=lFU/1LyWhVb4PHI585BraIkp6vABiD3nW2Cgnc5MDYHf8hjLsKKk6f8R3AIkj27GIaXpDIGWdp1VnJJ6nsIboX+WDXYxFASOO0KfuNo7jfDJH92pvnfoMaP3XvW0s/bnd6yUW9qE0dd2JKzv8hAEZCBYNn8mrt7QHv/J3g+Vmn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187642; c=relaxed/simple;
	bh=nQk3jpJS7eMH5f1YADWdfTUgEjq+wQ0mPHb6IMyjU6I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iiPHUq5gUTHjvf5YU15oCK/M+uXovb2KEzqU5/gGQdXrbPVMom2lE2N6x/n46nDJXb49z2LuAV6mAX22LlwNy51S5D1Do3qlAuyV6/zADojm3cAMt7gfGlCn+S+/744bR+4ud1QKRWzpFgL2FAGH4wOwOfyNDirINPukZoSH7pY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=baoZ8SqA; arc=fail smtp.client-ip=52.101.195.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="baoZ8SqA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puqw/IZEVdgdbSjVMo8FXY3LH56wlpBmyWbs8flyKc709zUcEtsHiiLyzahN1DExuIQRRhd3hopWVMey5pcF/0macLQJgQ7DS6jKsh9MJLGo4Tgr9ep3JFWWJnVQqogX9tJJka6z44+AUq0FSC/RT/17U4AnlJq0dim78tGXEfXWZ0xQZJDvYlbSScRaP1+4VSuh/jZUtL8n2b6FxWsl87DX1IQqQA0l7NsVCOLyQ+VRwWJR8I9vxvBrJLCrQ2sm7uGwqG+Yp+6K/myqbAJpTZMTMKRflEkluqkNNHfY7awx3vgIzW+zhjh+YlLUuCABN/ZwOYfFLF5bw6+tgVz9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EF00u9IrOQMvS3KFMLkZ3B78w/I/6SQVEAi601lDhb0=;
 b=slN+yccq+uSRTzy9sDlXAAmXJd6wFvNuNzkO8DIsbmyujtu4roXx70owJxR2Mb1zFIz2HV5QX4AZEu8ju8gno9RUGnTHTJt0CrLtIf5+r+sPNTauZzb8QQYgSh/RCmXwtdmmXoux7FpjTMI0HbsnKTxKR7jwBHfB+u9wlVWPMYlzRbppGfeURyhkXOLqabKEt9KWox926m6Bo70FYmWgn1utLNAyk76RC/Paflque3H4/j7/nuF2ekf6X4CXatGK2cw5Bbt+Wp6a+BzJZIaPr/882C0Uk5KtUpTRM/lipoNs+ihCnyqcsT8JUbzUgQJV1o4OLf9z1nKcLwh1xaLy+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EF00u9IrOQMvS3KFMLkZ3B78w/I/6SQVEAi601lDhb0=;
 b=baoZ8SqAWGOsM3RS3pCK5maHwzP7WylUIBbwYhRxoAB7uOMqZGCP7T6ltDnrJtmvbiNd63LT92dRizkoDhnmPhtx7Nov8QV3rV9Bur8V7/4nQ+ZIK1ERK3fk8N/wiSMaM3FRzN4vxMLPP5zoopZnEYTTM53w84lQAb84kWxvEMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6301.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:187::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 18:20:31 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:20:31 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 23 Sep 2026 19:20:14 +0100
Subject: [PATCH 1/5] rust: pin-init: internal: make `__init_data` and
 `__pin_data` safe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dev-pin-data-diag-v1-1-e4d7193569e5@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790187630; l=3276;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=nQk3jpJS7eMH5f1YADWdfTUgEjq+wQ0mPHb6IMyjU6I=;
 b=N3bPosS05ilpqQzFVxbqAUawgWNKtk1vpSuZEAwcu1cc1DXvc64jFha8Xr0D8x+MAAgMkettr
 gB5KJJfFqQQDsd2B6d+fvXNjMBY2MiQlSSspbIrLoc4kwY+/8Vc6r8X
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
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 66efa7eb-8059-4a4d-99a4-08df199f59e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10070799003|6133799003|18002099003|22082099003|921020|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	xFI0jiTQEdtPJlq93d3PRbc+xwg4aLv4AXT5NayPa2X89M5hoZgzhlYn88a8ZAkqGBAfWbrl7hSp5Fpt58KDF+Y1asrUIFe6wNwgA5m4WLWv9Hj7DrSiFvwHfMcFSfEjWV4qCfHuuuuttqmyrupgeyDlOhLEe0rGfhgaPpMg7qnBGHwUVaHvobJD3zXBoAjYjRMlHQ3AcJYVJw1xLO3J8u20DXAcTqHHNTG6NYeukT4mXPmEiyGSIVAD6jHv1tKNLBnkqYK4imhP5C1SE9UKadphD9wHkOxurlHi7dNcigFWKmooShIKKdDnB4GeTrjjawl/fbQyMU/nbkUJsSVAx6+2aP4EC+k8OM54K/LZg6oXjBZjLE0cW5cOX6LovX86+3Tb0Y1ktc17Hhp9gBkMkHuq2m7ijN7rAD02snL5JwtzcFL2/RoW4uo3lrP3VmQHGiELwUIqGwdW0fpsPWpBGxTbuGu10l7mwk/d2NsTh7bdu16oXyDsu1kmC062si2zQ6xKueETUKaL3s+9ZvpLOg0128jv4pm6qJ0jxyrkUUYZB7zNr3pe2l0uF14WnCEyUnoYt+zKQ2OTBoI/177DGfpYCJNnNuv41s76EBICFBmWZHPUd4GGsGvNx07pPzcHpuBOaByUd22chFHKsivtlRBo1c6+CEb1xR4aGUqmRMz3oW/f20NWdL66uXudTmBUcwUw9/5epSfNTZvFlp7CSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10070799003)(6133799003)(18002099003)(22082099003)(921020)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THcwRlJqWUY1b2JyL1JiMmQxdmFQaGpqUzU1WldoTkNBaS83YjB0Y2NTOUgx?=
 =?utf-8?B?S3lFTXdXaHFvVUt6VXZYRGF5R1BzRGtLRXBxZ0NyUVZsYVdXbFFqenp1TEY1?=
 =?utf-8?B?SjNGZG4zTm1WVzU4Qk9FQkZpZlA5RmZhZ1hPU3AwanlkRjFqUjU4cWtTTDJ4?=
 =?utf-8?B?SmE1SWFndmpqK0VoaDR2VysyeHYveUQvdS9uK0paN25RZFdLUEljb29ObGJj?=
 =?utf-8?B?cVloMFR6a1V0VDZXWlJiOE5hT1lIRW9LLzdHdlphdVlRaS9UVzhFTS91SDRz?=
 =?utf-8?B?MXZxVnpvOWpENS96Tnh3emlieEhQZ2V4RHZmZXBiODBvbk43WVFyQzVROVh6?=
 =?utf-8?B?V2dSSEwxdmZydVFlSW1qNUdacG5YUm94YVhZTkxYU2trKzZZRXRub0dhRXJw?=
 =?utf-8?B?VDNhTVlJa1ZiaDZNNVJoR1A2U3pUZTA5WXpZcXVzOCtFY0xXZXVQQSsxTW1D?=
 =?utf-8?B?anNtT0VvaGIrVlFIS0oza1dTTGJuQ3ZPMUdCZ3VneXk5OWdZR2RWNlZuRjRG?=
 =?utf-8?B?clQ1VCt4WnZoV2RweGhHdXlWMjUzUHpXcFUzNmhxL2hTR0dnT3JkZlFzNEoy?=
 =?utf-8?B?dzNIRlI5OWVRVmpPQkRRNUVzcHdqZTRlUFpMbEgyeEcyVXNkTHc1QmdiY1Rs?=
 =?utf-8?B?MHFtbGN2VEdobGQ2MmRMMTYwL3FobFBmUjhkV01YSjdmUHVqSGxPb2d5TjBa?=
 =?utf-8?B?Q2RCWUtBZmx1K1NZaTY3eFZEelRhMEkzSHhtYmt5N0RZejZxVEhWRFdEYUJ0?=
 =?utf-8?B?YW5uVm1POTRUMXlydzZkL2JPalZ1UmVidW1QdE5ESllVY3lndTk4OFlGZURP?=
 =?utf-8?B?TUcvOGI0OTc5OWFWS2lqNlpERExFd0gva0VCTnJQRFc3MDRMZTN6ak5zZHZO?=
 =?utf-8?B?Qlo3UjQ1Z0lhTTd3akMrLy9HczdBVTA3c1RmS29ZeHZNazBrd1dJSTcrL0lp?=
 =?utf-8?B?ZkdZWTRFeXpKTGt6MnltWk03REV0dTBhT3gvYWdrOUI0d0ZXNUdueWFCbStN?=
 =?utf-8?B?MWhsZDgveHAvYVJUZTFXanBDQko5cGxDZXRSNjlxTWtnMTFNdjFMbE5XZkN1?=
 =?utf-8?B?SVkvWlhnYXNrRUJvVEhKckZYQjhoZU0xVEl2TU1tSXgxMDlPTnhIMnRTWXFN?=
 =?utf-8?B?L3BDeHoxb25JWDNmbFZWSjN5dmpsV0YxWUZOYjlxS2VYL1UvMW85SHJQZXlk?=
 =?utf-8?B?RS9GbnlqYTFqOWFqOTJmZkN6aFRtSW04OTBhNUtEL0ROS0RSMWRzNDc5a0x2?=
 =?utf-8?B?WGRxN21KWGsxaU9iamovTitld29mNmRFZ0JaTDg3L0F4VWNadjdGWjhjaENj?=
 =?utf-8?B?N1dycnFyU2l6U1pkakFWT1FDYzVsVE51alJjazVPRzg0Tk92SkRCci83NTJR?=
 =?utf-8?B?WVJXRVk3SUl4WGwyK1g3Q205ZE50bVNjVzhxVlllM29NMHR4V1l2elVXTE45?=
 =?utf-8?B?K09VL2NqSDRqRXZMbXZzRWQ1UUdRSEx4QWlPSlJsNU5qQVFuc291NGErRXNY?=
 =?utf-8?B?dzEzZHY5TE1EcEJRQXNoYkZvMGVCMm5WT0Q0bldMaEJMRVFGUFliY3ZZZHow?=
 =?utf-8?B?aXRvSXFJNDF4Ym4wVVUySFdacHNmb3BGbEJ2VXJ3dUJId05Xa3R0WGtFeE03?=
 =?utf-8?B?L1VyZTBnZ2U2Z00xZE5VbTBIbGhINXdhR2NOdVIzQ0twTXhZMFpzWThCNjNn?=
 =?utf-8?B?VjQyeDRFY1EySUFaRWwzdjM1UnNUOWF5NnBodHlYeDhuMWFUb1NBVmk1TVhN?=
 =?utf-8?B?dEdQaXVFZEh1Vk5MWGhVWmJFSDE5M0J5MnZYQTh1VVRNN1hWblIrRGpaS2dD?=
 =?utf-8?B?dWwwLzRxaEcrSXZGOWNHOFlPNEFFZTRacjIydXEwM2dkRUQ1STRNd0lRWnA5?=
 =?utf-8?B?NEtyRFE5SGhsMzZERXZsRkxkaWhCUzZHRzhNVk5KZ1g4MzVCVmdrOUNWYzdz?=
 =?utf-8?B?REVvUFYxbFpjQng5dnNUbXVOVzVFd05DQ093VTBDYWthMC9Yc3l1aG5mNW14?=
 =?utf-8?B?WGJXUTJhK3VNVFB4dVJvMUdQRm5QckdMVUErb2JrS0VjSlRpWEtYZWhzVCth?=
 =?utf-8?B?NXRzZmJZOVprQ1FjbUl3OXhrQzM0SFdZU0RqRzBIRitIVUVZZVVuTlZ1U3o1?=
 =?utf-8?B?ZWkwWU0wanRtVWhUS0R2ZWo4bDlqc1VJeTFLNm1ucFRoUkk2bnFiTHF3bWxn?=
 =?utf-8?B?cm5Ed2lGRnlkckpsK2hsNWtwbXNJdXkzK3BoN0picWpVTXNoZ3kvRmQzM3BW?=
 =?utf-8?B?WEsyQzZ5R2dQZXpSQ2x2TE1XM0o4Yno0RlBlMXZmN3Jkc0wyVHBzT2hMOGoz?=
 =?utf-8?B?bnE4aHNNUHFLZXl0Z0x4QUNhWGNVaXlIR05UR2xUQ3Njb21UcVB1dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 66efa7eb-8059-4a4d-99a4-08df199f59e8
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:20:30.9447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blaT1TXfIAGlL8PsokgSdHD/gzNVV3iu2dfXjs4Qgidi8XNVkYa1kqK+yZ6seWKhY6Shs8/zcIyM0rNt5oBOLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6301

Remove the unsafe markers of `__init_data` and `__pin_data`. These methods
are for inference help and does not need to be unsafe.

The `HasInitData` cannot be implemented outside pin-init, so the `unsafe
trait` marker is not necessary.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs     |  3 +--
 rust/pin-init/internal/src/pin_data.rs |  2 +-
 rust/pin-init/src/__internal.rs        | 11 +++++------
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 1d2db93dd33d..1957be83a196 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -312,8 +312,7 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
     let field_check = make_field_check(&fields, init_kind, &path);
     Ok(quote_spanned! { Span::mixed_site() => {
         // Get the data about fields from the supplied type.
-        // SAFETY: TODO
-        let data = unsafe {
+        let data = {
             use ::pin_init::__internal::#has_data_trait;
             // Can't use `<#path as #has_data_trait>::#get_data`, since the user is able to omit
             // generics (which need to be present with that syntax).
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 8cd9bf139567..30d9b8b54d8a 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -538,7 +538,7 @@ unsafe impl #impl_generics ::pin_init::__internal::HasPinData for #struct_name #
             type PinData = __ThePinData #ty_generics;
 
             #[inline]
-            unsafe fn __pin_data() -> Self::PinData {
+            fn __pin_data() -> Self::PinData {
                 __ThePinData { __phantom: ::pin_init::__internal::PhantomInvariant::new() }
             }
         }
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 8e9fd18b993f..51f6b40daa9e 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -81,12 +81,12 @@ pub unsafe fn new() -> Self {
 ///
 /// # Safety
 ///
-/// Only the `init` module is allowed to use this trait.
+/// `pin-init` relies on the correctness of the helper functions defined on `PinData`.
+/// Thus, only the `#[pin_data]` can implement this trait.
 pub unsafe trait HasPinData {
     type PinData;
 
-    #[expect(clippy::missing_safety_doc)]
-    unsafe fn __pin_data() -> Self::PinData;
+    fn __pin_data() -> Self::PinData;
 }
 
 /// This trait is automatically implemented for every type. It aims to provide the same type
@@ -98,8 +98,7 @@ pub unsafe trait HasPinData {
 pub unsafe trait HasInitData {
     type InitData;
 
-    #[expect(clippy::missing_safety_doc)]
-    unsafe fn __init_data() -> Self::InitData;
+    fn __init_data() -> Self::InitData;
 }
 
 pub struct AllData<T: ?Sized>(PhantomInvariant<T>);
@@ -129,7 +128,7 @@ unsafe impl<T: ?Sized> HasInitData for T {
     type InitData = AllData<T>;
 
     #[inline]
-    unsafe fn __init_data() -> Self::InitData {
+    fn __init_data() -> Self::InitData {
         AllData(PhantomInvariant::new())
     }
 }

-- 
2.54.0

