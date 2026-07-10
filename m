Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020128.outbound.protection.outlook.com [52.101.196.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AE13358C4;
	Fri, 10 Jul 2026 16:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700472; cv=fail; b=eOUGYujMuiCCkGgKEu4TjNWcXLPti1k3/KszXq0S4Ijamg2djpw+s3/VcefY1QzR1ZH5wIwpNEp1kbUS2DYWk9j9QWUmJ936miwWMT+ejmsIaaj4b/Ufj0Qu3XD1gRhMEWyo2Cr/JgHUPuMg0r/OILghPPiR6hFskZAFTW52qq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700472; c=relaxed/simple;
	bh=3B6wBygM7XH8co+VJTliw9UrOmluSGLeeqXszjpkylg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JhdwsA442+NQ+AvYTCq5eUHU2npFTwgUc7jHhmvWLiKzM2Tzq3xpbvJx0oP5no10YKoGhWRTjPtL59wPs6iij/Z7qRmKXU97zOe/9p97ImRabAu2NSfEntTokAHv8nVUD5JvX5qSlA3tswulIfF6xHF23CYSp8lDKvyZ0X8p0nM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NoJXosUW; arc=fail smtp.client-ip=52.101.196.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NoJXosUW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uw+CB1WTQbejSA0L22gGBbzPg9UjzgD8ldGu9ZmEIwBAvfqyL7h+oL5UiVK3xg78y/Ko7syBDPNcbe/+LKVs3y7kvPY8xKS0RrrVnB5yVlvCVAa4GtYoVK71f5pn6Ca0wFTh+6xz9ttkge0+Y9Ug0vpmHNF1J+paw9VClXrX/i/jBmWyHrCp/dfp9RiXfJICNeX4RW55xBKsxmi7MZy1KuTraK5OceqHL8ExaGM1C5yPMMFQt6WIAsHfgnAmhU7iQ+SmPp9kB+kCHuR+A1f0f+bvtVRnCDco5PNdyoSD5Cyf+xFnHyfACkAFY7rBvJRmRIK4yzvw5saTyGP7FbI9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Q5H9OLuDit2wvRyc8/CjA/GLqsh2/+9dkbWIxRUvTo=;
 b=gKgZBhkZv2MhFAC9Ybh0JrHZvQMbUVFnygIHGfoF48T5vKWPr//Quq+NlBv3JzQtipqd2RXfOrzv+1kpzSaTYVDOPhpECF+8vk/dYCVQEevrMfPJNkhfEEHCgd67p7//o/kgIf1RFax6xf32fwtDeTvhfXllp674A1RIt5DE0oElKkP0bA8fQii9YdoNLbEGNcoNOL4foWqAnjudkNy05IiDtKs0DK+pGh3DpGLXCukpysSZR5aYJm9aRrNduQRmNv9b07ax6dofWhnv+WPRUeSY+qxcjlLJFHrXzX5EJjC2EYAGsR08FwQa6iFD7ESqX0kwzmJFqIJ3VtQs7sYaHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Q5H9OLuDit2wvRyc8/CjA/GLqsh2/+9dkbWIxRUvTo=;
 b=NoJXosUWMzRNHozpDejSWaHTNqJBjDlArnbDtLG14eci8dfVPlu1i8Gj7AJ+177AZkRIingpEER3r6uxuOKgD2YCfjn0xw+F0w4Aoclyib2Pl8HfLeEnKQLhBc1esbq54tRwTSw19rV55kHC2CuNHB68/9wMw/gZsK8VHRQABxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7266.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:225::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 16:20:50 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 16:20:50 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 10 Jul 2026 17:20:33 +0100
Subject: [PATCH 3/7] rust: pin-init: remove redundant clippy expects in doc
 tests
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-pin-init-sync-v1-3-8fa16cde87ae@garyguo.net>
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
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783700449; l=2490;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=3B6wBygM7XH8co+VJTliw9UrOmluSGLeeqXszjpkylg=;
 b=9leeCD+dt2DIQ/Zf/7iRVa/eBp4M8send3C8Xy8KPXLp0TDfE8Bf/H9N8AVKE8dfRc3kGw6Ye
 P/+gmjV8ncSAGGldF2TLvxbvcb27QZsFxWVgVTq7lvyxjwHAXLaY7h7
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
X-MS-Office365-Filtering-Correlation-Id: 3bc7c854-412d-4d47-73ac-08dede9f351d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|23010399003|366016|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ka8QvBlxbNUe7h/eIDq/ak9reAKNvuXI/WREmW9JXhEsFTTawy/J3jk6QAajEChHFMDxg6t/SSEXe6IZauqPQjkB3XNTfiVgdNt6GXQwl26zNeN6jLSbxeq9E6v7hZL1bt4PSQL2j+N3uVCkwABeFmVQzqUG5ess27X4LgDXbQmfer36BL8kyJOB75rIv9thmR8TrWpz/MoSMd+CMuGRVAt2AuO20/7vLTAcMQ4mKNEcrRxTN0iO13BhoTOdTWdiw8Wc7bg/bBVBCQnU0BU/2+nlrZ/yIqGNxyPsXFswmUqZ0ZulSJnhwbDNukL7WBm/cUo62SRDigmF9+Ay+0NRHJ7bVmjXFqaEwDlwdx8bZlSLjPM+neFFKPzoQBTRt2iWg+FGuiAm4QW024+if0zEFZzorfzzDaWBQv8Wy/9pCKmmG6eD+nwR25eFP7i9YLZlq8ySZ9kn2FoWn7n0sSLEa4kA7xZeRFhv0VQr0Ts2mMumJiNC++gBHerHemuiPW3FKqDdquUkkGwFKNevio4FgLkhye1lM7JCbkKt2Gm+tuOOG1HgBMiRuDjAv4CXoCSzoj1EVAxMwcHtW0qil03mZaUdVyanJTNxfdJr+v7nTF0thzaTQnw+MJJ81zpJol/mk3w5o+2XPxt4E8LEakKt2ThMT1r5uYmK2UCwlH3nY4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(23010399003)(366016)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUpHd2tIV3hEV3NzQTk4djBGNlo4K0FlUXhHK2ZEUFBJM2JqTTBPMWtQSUVH?=
 =?utf-8?B?N3c2VFVzQ2oxeU9PRXhydVYwRHBZTklTL2lYTmFQdlJhUWtVTjdXdHF0ZW9R?=
 =?utf-8?B?U2N4Y0Z2SkhHMkMrWlJnUk1PdWViYVNYUkFyODY0N21vSmQyU2FGdVg2VElK?=
 =?utf-8?B?Y0QwK2I0RTFIdTRKbmNRckk4a1hvV2hYVW1salVoOEdlMysvSTlURENhYUtB?=
 =?utf-8?B?a1JYdGpIVTNaSEJ3akZYRG04eGgwMGxBSkNLa25Td2FsVGZYRjZFYUlwOGhi?=
 =?utf-8?B?WmljcGVHekp5WmJRR25aRkVsQWdYbmNMM2ZVbmlITGxVbnBOK0YwaHRUK2du?=
 =?utf-8?B?OVd4c1RWdytvR0RmTkQvcXo5YWM5aXRvUjFFcFJkbDBoNGs3aDNIVkNuTlh5?=
 =?utf-8?B?Q3BmL1BwTVpWMktySSsrdHFCVlN1VnV0dTNqNnhCa21oV3F5QjREMGh1VGJq?=
 =?utf-8?B?Rm10Zkd4cEQ5eFBmMGdkbXhHelBmZUVqbEhQeE52bWJ4OGxxdE9RTWZVYkNF?=
 =?utf-8?B?eEEvUmNnSkd3UkE4aG9pZHUyamdzTEsvb2NiMmRwQ3FabXNnSEkyNlJSUDUw?=
 =?utf-8?B?K016R2lXSWRreGVwZXpXRlFMZEIxVGplL005ajJGQTZnM1VXT0p3SWNNM1Z2?=
 =?utf-8?B?OUtsL3Zhaks3U1BQQ3pqVHpVQWlaRkJ1ODJyT3dWbGFuMEpVSzBCVGxDRkxG?=
 =?utf-8?B?dDRYUXRsQXkwczQ1cjk5RjZqL3BudTZHTkJRcngrcE91SXNTTHcyM1VMci9V?=
 =?utf-8?B?KzVYWjgwQnovbGx4U3ZkNFkyT0IrUWI3ZVh2MEpGYXVLc3ZjcE9PaE11OWNF?=
 =?utf-8?B?MXRBLzdRdVlMbXlVS1JjWjNaUkUraUg4ck1KdHpjSXFqOFFaMzVvQ3lyaUFB?=
 =?utf-8?B?b2FYVU4wMmRjK3laU01KREtQK21KQitEczNhWU5WaUFyWTd2czV0aDh2UXYx?=
 =?utf-8?B?eTZsT29VSnU2dkNkanA4TDBmL09TNUhHdzl4UXBwVWRxNjNTM1ZUdVNHR0dr?=
 =?utf-8?B?ZlFyUTJCSzA3NjczWnYrZjNiSmo5RE93TllHTHhDUDNTc0hSTmRGay9adG02?=
 =?utf-8?B?RXJ1NFBMTjQ3Nlp6cXJFNkxSYVRjV2RoQlRCbTBmWGM3eDZ3ZVF3MFo3ZlVm?=
 =?utf-8?B?SlcxeGMzeVJ5eW5uRVBpRzZSVnZ4UmtjcGF0NW9KWFF6RFR3WVoxSjNqem8z?=
 =?utf-8?B?RUgyNy9kL0dBV1ZENmxRbzc0RDRkOVZoTmV6MnMySGZSMlN6OHUyak5UenFB?=
 =?utf-8?B?Y2dXL0dGbTVDOTZyYWhBaUw4NXVyWnU3Z1FReWVlZDcvM2lFd204K0NuTEo0?=
 =?utf-8?B?ZWY3V1NvYTdMTm8vQ01MOWI0QnhQM1hyT1YxeWZocXdrVStGZEtRNGlsa21t?=
 =?utf-8?B?MXpvN2JLbUN5TW1zQnBheWJJcUdrMG5hK1VtWC94YXhhQndoMGhCWDB1bVhu?=
 =?utf-8?B?bXhuajNPZ3hHV2FaM1YxWHJpdG9NeGk1RCtYMGowemVaZkZoWktLYVpMbjlh?=
 =?utf-8?B?Z0Z0eERFY1MydDFUS2x6aVludjlMUk9rSTFOMUR1TnQzbzJ1alhEY0hZMmxG?=
 =?utf-8?B?dkoxb0lHTHlaVzFTTXl4MUd1cDZKRER6ekUzR0orZlM5bWRJVUlKTklJZitY?=
 =?utf-8?B?THZKOE5EMWNBK1VNeFRJVXJoS2JwTUFDZmx3VldNMHAzOUhmY014MkhFaC8r?=
 =?utf-8?B?MlBqWTk1eCtSa2RuUVR1YjVMTlhLWUZ6dENKUFh0K21GQkdvSlE1aU5rUlhP?=
 =?utf-8?B?a0NmYVNUKzF3N3gvNm5XcFhOY3VFcXFLVW1pNitkU2ttRENZUkVKSEpTblg5?=
 =?utf-8?B?UHcrNXZOa2lNV2Vzd0g1NE43MnRmS3QxMEZ2UDBaNDJkSGRySWw1SFhTOHo1?=
 =?utf-8?B?L1RVRDZRY2xNenVnbGZCdVBTYXpDbXRtc29UZEVUQXp3cUoyL3J5cG1mVTN5?=
 =?utf-8?B?SFhaYUs3a29aSHMyMzFyVmZqQUNZRWlDMDhRR2JxeGhYLzdYdExWMWxXRUcz?=
 =?utf-8?B?TzZaLzd6NUZNcmozNnZOQXYwS2lVZU9EdG1SOTQ2TUQyaHdkdjZzVzd6QTVZ?=
 =?utf-8?B?bit2Z0RPSmcyOEhzdE16WmZqNmdLaHRmSHUxUnVzcVZLS1Q3ZUgwRW9zQSt6?=
 =?utf-8?B?ajBMUUhPaGEyRXQ3eW8xREYzdFdVSFkzUGF0V2hYUGtsSFhYTFFmamh2SHlK?=
 =?utf-8?B?YmVJQTg5ZjA0UVgwYTZtZ1k0aU53WjAxaDQ2enhSVmxEcmhua0F3L0poUk5L?=
 =?utf-8?B?NTlmOCtpR2w4ZmRNaEFpamlvbENPM3hJd2xIWlFiSVVKcitPUkRGZGk0aWhl?=
 =?utf-8?B?aDlwdXg5NHgrdUlPNXdvSUNVQlFBdnNtRGpkSkd0a2xKUHlJMGx1UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc7c854-412d-4d47-73ac-08dede9f351d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:20:50.5907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyYbLCrW9j4iR1/K41kROYt5OtME2GfkpdkGwjGM7z7AUcsBek41ABrJML+WpZ4wrM9QEMUdrVOCsOLOcCWuGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7266

These lints are automatically suppressed inside doc tests. Previously this
is needed because kernel builds doc tests with the default set of clippy
flags; but now `clippy::disallowed_names` is globally allowed inside doc
tests.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index fd40c8f244a1..90e9d501d44a 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -70,7 +70,6 @@
 //! that you need to write `<-` instead of `:` for fields that you want to initialize in-place.
 //!
 //! ```rust
-//! # #![expect(clippy::disallowed_names)]
 //! # #![feature(allocator_api)]
 //! # #[path = "../examples/mutex.rs"] mod mutex; use mutex::*;
 //! # use core::pin::Pin;
@@ -94,7 +93,6 @@
 //! (or just the stack) to actually initialize a `Foo`:
 //!
 //! ```rust
-//! # #![expect(clippy::disallowed_names)]
 //! # #![feature(allocator_api)]
 //! # #[path = "../examples/mutex.rs"] mod mutex; use mutex::*;
 //! # use core::{alloc::AllocError, pin::Pin};
@@ -456,7 +454,6 @@
 /// # Examples
 ///
 /// ```rust
-/// # #![expect(clippy::disallowed_names)]
 /// # #![feature(allocator_api)]
 /// # #[path = "../examples/mutex.rs"] mod mutex; use mutex::*;
 /// # use pin_init::*;
@@ -508,7 +505,6 @@ macro_rules! stack_pin_init {
 /// # Examples
 ///
 /// ```rust
-/// # #![expect(clippy::disallowed_names)]
 /// # #![feature(allocator_api)]
 /// # #[path = "../examples/error.rs"] mod error; use error::Error;
 /// # #[path = "../examples/mutex.rs"] mod mutex; use mutex::*;
@@ -535,7 +531,6 @@ macro_rules! stack_pin_init {
 /// ```
 ///
 /// ```rust
-/// # #![expect(clippy::disallowed_names)]
 /// # #![feature(allocator_api)]
 /// # #[path = "../examples/error.rs"] mod error; use error::Error;
 /// # #[path = "../examples/mutex.rs"] mod mutex; use mutex::*;
@@ -658,7 +653,6 @@ macro_rules! stack_try_pin_init {
 /// Users of `Foo` can now create it like this:
 ///
 /// ```rust
-/// # #![expect(clippy::disallowed_names)]
 /// # use pin_init::*;
 /// # use core::pin::Pin;
 /// # #[pin_data]
@@ -1031,7 +1025,6 @@ pub unsafe trait Init<T: ?Sized, E = Infallible>: PinInit<T, E> {
     /// # Examples
     ///
     /// ```rust
-    /// # #![expect(clippy::disallowed_names)]
     /// use pin_init::{init, init_zeroed, Init};
     ///
     /// struct Foo {

-- 
2.54.0

