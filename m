Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020084.outbound.protection.outlook.com [52.101.195.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6974401496;
	Wed, 10 Jun 2026 11:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091753; cv=fail; b=a9+FsA70dg61I9D7+/nir3OL5rt2Mkqt+xXHXFsAqV0aSRLuoBbuVR5bLAUJCdEaesRTpCuvXHi4gxDN9wsbKCAJYOr44HN7nQ4eleVpu5u01iLljdUziO6tBfOZkAbEY/gOwMWVoKAZAUCp/+cRl3A8uZFAuUiO1CjzoN01nlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091753; c=relaxed/simple;
	bh=qWrzAa+99jyEwLkqeupNmH0kURQAtqY/f56Pom0QQEc=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=I5Y8aEhOYedWaOm3Al4RNrTuNCfBsierol5J4R772O63XsPsgJXzb0z77J63bGYbZ+ku4Q7HccGJ3/JPGqh7la9r6kHSx5iEjOkYZaPbXNruzvRs6L5lL6LlSZT5xlKYD3GhoZB7W5LA8kkY5KPhucsyDwEkG5Dze3izEYGphvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=atL2JrMb; arc=fail smtp.client-ip=52.101.195.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="atL2JrMb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NC8VIbncA75Le9pzXqPpqiXQO3CMpH0JwcTt/TRXz2OyDgCXM1OKE24g+fu8F9XCNgmkSJ2Qlw89tOdZ9YYR5vxLV9M+n6DwGgDsY93Xqa/4Ekr1+FdIZwB+bf4Wpis6WH7niP8FySPcP2EXTD4xE8eAA89a36ABElfPlsf1JKwjU88Cmo9VdWU+SYRgTU3fTzmG2tFUKDtX/jerH3hyZ2GRy1zlbQ9rDfFDdQUfLs1OEjEKobDVbBUmPpeYwEAB1qKtUEl4QEHJCZjEzgWE4/d973gRKgosoFYSkDnjOFEddzURYhOqJoRIaH5WZhewQjslkYeLmTrOg8Inhu7uJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SX/trqBV68VJdKO5l6OAlWbAPH2VpS7+W3TWbP+uxrk=;
 b=TAp32pPsUS6KT8METtOhlOZpL7wg/KDpawY9d34KDQvlTWh21iSMRBOUyDMrtwUKODecKdY426k/ab4mMsp5f/fYfZQwCp5a9v+VpO9YqIVN2bls/0i4OZAHkqSb04MY/EdWt0woBlgd5zg4F+yQsRS7Hp0i0gwKFdybzAFxUEFT/4o4fFKvIEcQdfWRjmXJnI8MaLO5UOj5kWn3VL2bgpTKxlKxtS//E5ryi+ChIpNB1RNiaf5j4p74sWvb8dMrD1JTMB84rtNDKAJw967OXB27vOg/DvN+HWlj5O37E7cr4UJ+Q+13zM5UfNImbo0sZTsAXaVoVANNjH02xrI2/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SX/trqBV68VJdKO5l6OAlWbAPH2VpS7+W3TWbP+uxrk=;
 b=atL2JrMb+n2TQ+ZlzPd3UEgjqqrR4Y2DEP/6ix7kLaPjorASwOSoc6EDM+fvb7TIFAU79M+55TFdfy96crTtlv9ZVc83fAUOowU35Fp/HkB4ZWbpGSytp0XwGKXtTsANYMDGvyM+0CQpjLrgLZjAORa3REEEvqmPlUEbaVvBkNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO4P265MB3536.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.16; Wed, 10 Jun
 2026 11:42:26 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 11:42:25 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 10 Jun 2026 12:42:22 +0100
Subject: [PATCH v2] rust: mem: add `Align` type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-const-align-v2-1-ccd12f0aedb7@garyguo.net>
X-B4-Tracking: v=1; b=H4sIAJ1NKWoC/y2NQQ6CMBBFr0JmbUk7jW105T0Mi1rHMkpa0iKRE
 O4uoMuXvP/+DIUyU4FzNUOmkQunuAIeKvCti4EE31cGlGikUVL4FMsgXMchCitROmu0sZ5gXfS
 ZHvzZa9fmx+V9e5IftsRmtFyGlKf9blSb9y/Lk0Kp8Vij1haVUCK4PF1elCN1dcoBmmVZvsD7h
 +6vAAAA
X-Change-ID: 20260610-const-align-7020a76367ce
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781091745; l=3170;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=qWrzAa+99jyEwLkqeupNmH0kURQAtqY/f56Pom0QQEc=;
 b=oDN7OSxWBsoN2wrxaMzqOLiO4wf6DUmt15e1HQrecxlE3ZklohPxR0n06Eg6BHiushCtfZn22
 feaEUOpmuGOAJzoabwwt4zI5kShhC17w1sCkVndOnym58/JyLrgIEMI
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO0P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::8) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO4P265MB3536:EE_
X-MS-Office365-Filtering-Correlation-Id: 121bd85f-330a-4133-054c-08dec6e557d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10070799003|56012099006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
	i3//s4rWWymj+A6J9mPH7GMVbPDAPBpz8YBfRVTn4GdEVFOC1wqpQ1bAaYy1QrB5gz2B/Zgc9yeDKwJi+vGzYpYV5fzLyu8KslP7LrrMf9Oc9kuG0ci8reNyVrxtHh26dPmnPkZYqsnA66pITB/QfY5OyCxtObSRMmp7ATzAvISy51yD+etXBZ6b/sOW2B1M51M1W4lL/mUav4lHn9wwHaQG+52ur+bfQK/MTJ3mEf3eFdeTFJAOer/kD7hxHZUoQZ8l4PWXN06+xibCD6OMKU1PE1Fgi4lFbHHou6uX9Ff5ybyAu/BCFztfTZImcfKRp1j9JNEC0XxLZGVo3bqi4weEfC8DwDxfin4wks/N4LDn5sd9X5/KZEolgSq6HemXjPXpHigQtUZA/jfjflgAp10SbpbQ/RQlsIlNuODVKuZD7ch7eJPKJtDU7sava30dLRTo+kT0kwsavBpHxNW39LGwFQTOrh3cDUyHhvDBw/O4ZTO9xjwNmgOkXMo21Bhq0ZpTd8NG0v2fo4ChlFGWPkPwy0WrRoHRfWvIXhVIz9eACkEpvJFjPviglUxsPgdye/Zb17R6ahgtCGXw24fqeAYfFNuY12U1DQSUKA6HyK9xsHBSi9BV08+g42CX4fhvOjL3KCaLQ3l6j/tzX/sFEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10070799003)(56012099006)(5023799004)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEhYa2ZpZkpZR0lxOTBvM0tlRmhvRmtndUlmU2M4NlZxRmJKQ3h2V21md29y?=
 =?utf-8?B?engxbFl6a3g4MWpWdGEzeEQ3MjRieGdCd0FiaFBBWFhxRnB6NHZWVXdod2s3?=
 =?utf-8?B?OVN1aWtBUkJMQVBmcmJ3WkQydUdMOFZoVVJSL1hHVm1XUGNPeHVpRVhmSTJ2?=
 =?utf-8?B?WksycXJQaHE2aERQR1pYZ2dIZHhCNE5XYmtoTFZsRVZyQXl1cTY0VzcvV1l2?=
 =?utf-8?B?cnczMDNRSFNtTDViRzc2QlhUVkY2SFNQdlVIRWJTdy92RUlja2VZTnpUc251?=
 =?utf-8?B?VEJOUnUvUmJnMnpyakNWK0tlMFU2dHdwcU1JV1I4d05PYTFFZHJlN0kwaVdn?=
 =?utf-8?B?RDlncVM3L2xNaUVWcGZaeGRnQjlUakovSEFSNnNUdUwrQzBpSTVKUnB0NEdC?=
 =?utf-8?B?azRyRTJSMXdIQlJSYitzQ3diT3BmN0dCYTJVV2VlUWxMdFpaY2ZWQXJBSkFE?=
 =?utf-8?B?eVFjWm9kRVozaHY0T25tc0VDVGNhN2g2eVJtMDZveE5kYmpKTHRaandyNnJu?=
 =?utf-8?B?aWRxWGhWZUtuNHFicXBLTHNncHVPbmtadkQ2Z1d0UnRpL0RXV3N4R2Jyakl2?=
 =?utf-8?B?RDIvaXJnanlHbEI4dnhEblB0S2FRY3BKbE1ybjVFUGpSVHkxUEluQjc4c3B3?=
 =?utf-8?B?bVZqSFI0NmVrcm85ZnI2allvejQyZWtGK0lPNy8rcHVjODZ0ZDdDVVhROXRR?=
 =?utf-8?B?eGdHODNiZjFHVWoyWW5UNnJoOWl0ZDE2RXo2dnlhVTczOGZlbGg3ZHhJZVg2?=
 =?utf-8?B?WjdjR2J6WmxVaHBFcVNwWkdXdUlXTVpPL3RGNFQwTUpNMGF6VE43bXNBai8w?=
 =?utf-8?B?bnNsd3o5MFV2cEx0R2xLbG5sZFB3eEFocUV2di84eXF4NCswZUJCZ29pUDJM?=
 =?utf-8?B?NVJ1c1dRM1NZVWhFcndWNHBTSWM0RWxsOGFBSklWUnJmb0RST2pTaWtWckhY?=
 =?utf-8?B?cnVEUWVKaW1MU2FWZ1FJaEIrbHBIempUb0gxaFEwOUJxUFpEWURaVnNwQ1R1?=
 =?utf-8?B?cEJudWJoZ3lCYm5GSHVUdlFXRkpNTkdQTWhFTWxLaXkyTk1IUldwbGJiYnhZ?=
 =?utf-8?B?UnZab3ljVkpzeU5hK2FKaDNjc3M2dk4rR0F4bnRUTVF6TDZGUXlHeXZSYmJX?=
 =?utf-8?B?SWlIaHhWTDBvZnpuZ253MkpVMS9lRG93V05RYUVHdm9BdXNFQk1nRWFET0kr?=
 =?utf-8?B?WXBEbHJBQUFjcm9yZzF3R2l5UTF1VkxFcmJ5MnIvQXg4VHJCZHRYQkNDSWFs?=
 =?utf-8?B?Yk9jMHZ2VzVxWmtleldQRTZ4MmZtSlFpUXhnNnRnRTRWcE1lb29FQTJ3L3Jw?=
 =?utf-8?B?bVVkVTZ5TGhyTW91a2Y5VXA3bmFxUURTbnM4YzFhZkVjL1FNMG5YV04zNkdy?=
 =?utf-8?B?WlRnVCtaVzNNUm8yeXVwUFFSeWYzRFlodWZpbUFuSFQ2NHdnQ2JvUXhDd040?=
 =?utf-8?B?UjVKRWNJZVJQRzlTVElXcUM5bURJclA0WGZRalY5YVN2aXdRVjY5STNmUzNs?=
 =?utf-8?B?dnY1cG4zVWJ1cUtMdnpNWjZNRllaNFFQRitzSXEwbERxaXBtcVRYZ3FpNERW?=
 =?utf-8?B?Z0JUdWtxTjljNDNpNWxQenM4NlJOQ2hwR0ZwbHJWamVvUk1CNitZNEd0N3Zz?=
 =?utf-8?B?T3ZRRGZpL1FTbGEwTjcwb0NSTXptYXdUYWxob0ZQUFY1bmo1Z0hLeWljd0ZK?=
 =?utf-8?B?R1lYWUFnTEY1UGdwazltdGMza0RQdG9OalRBQ3dLSk5UWE1rakpWbWtPLzBZ?=
 =?utf-8?B?eW1adlM4ald1dURlT3kxZlBEazR3elZBL3YyMzJZcnRQcW1Ja0RrQko1SXJT?=
 =?utf-8?B?MjNPODAyMkVIZEl1QU1PdGRrN0J2R0lvWmxob0VWR2pPblBZSVRxS2d3UDR6?=
 =?utf-8?B?TVBjVzFsUzlsZWNHMTlmVG9rdW5LbGowelV5ckpTamtlMS9PMmRCcDNCeXQz?=
 =?utf-8?B?eUpFUlhSbVNHYU5kVTdPdVZvZ3hEOGRseXdwWHp3Q25YTkpvNEdFNXY5MjAv?=
 =?utf-8?B?MDIvUitqQmU1RFExZHRLb01RS1BScDVEMWJZRncyTnFvZHBYWWoyMjd1ZzdJ?=
 =?utf-8?B?dTVDYjA5TzBlSGtjajBUd0dCMGxuR0MxamlwTkFQZ29SS0pqVEFvT3dkOVhl?=
 =?utf-8?B?ektYV3lJdm9GRXFMaVUzVGJ3WXRiZEhmeHNKWFFRMHBHT3VzOVZGTWtkMGlk?=
 =?utf-8?B?NVpFbHpXQlVwZTJtSjE2aXlnT2QwV1VNVXI3MTVtazEvTzlVa3JaM2x1dTBz?=
 =?utf-8?B?UTJ6SWx5TndsSVJEcVoyTUs2ZWt4TG5JV1Z3blFjRExVMTZkY0IxOWZuNFEv?=
 =?utf-8?B?S0htU1duZW9takxGb29qKzNROWNFWVI2N1U4ZGYzRllUdFB0d0Y4QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 121bd85f-330a-4133-054c-08dec6e557d5
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 11:42:25.7531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYnXls38+2wSHTKdRA35rXos2nbYvn/QTautZksxAT2WfJ8w+SuZ67unb6CJN5aJ1idy2nEY/lVscE3SNSUtJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB3536

Rust's `repr(align())` only works with integers. Add an `Align` type so it
can also be specified via const generics.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Andreas, could you see if this patch meets your need for cache-line
aligning?

Changes in v2:
- Added `Clone`, `Copy`, `Debug` impl. (Sashiko)
- Expand impl to 65536, i.e. PAGE_SIZE_64K. Kernel technically support
  PAGE_SIZE_256K, but it's uncommon enough so I think there's no need to
  support it unless a need arises. (Sashiko)
- Use `_align` in example, as usually the field is not going to be
  referenced.
- Link to v1: https://patch.msgid.link/20260609120325.233721-1-gary@kernel.org
---
 rust/kernel/lib.rs |  1 +
 rust/kernel/mem.rs | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9512af7156df..0a12c3011c61 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -92,6 +92,7 @@
 pub mod kunit;
 pub mod list;
 pub mod maple_tree;
+pub mod mem;
 pub mod miscdevice;
 pub mod mm;
 pub mod module_param;
diff --git a/rust/kernel/mem.rs b/rust/kernel/mem.rs
new file mode 100644
index 000000000000..7f7545c6e545
--- /dev/null
+++ b/rust/kernel/mem.rs
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Utilities handling things related to memory layouts.
+
+// TODO: `Alignment` should be moved here as well, Rust moved it upstream in 1.96.
+pub use crate::ptr::Alignment;
+
+/// Trait indicating that [`Align<N>`] is a valid alignment.
+pub trait ValidAlign {
+    #[doc(hidden)]
+    type Repr: Copy;
+}
+
+/// Zero-sized type that provides the alignment specified via the generic parameter.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::mem::Align;
+/// const ALIGN: usize = 128;
+/// struct MyStruct {
+///     _align: Align<ALIGN>,
+/// }
+/// assert_eq!(align_of::<MyStruct>(), ALIGN);
+/// ```
+#[repr(transparent)]
+#[derive(Default, Clone, Copy)]
+pub struct Align<const N: usize>([<Self as ValidAlign>::Repr; 0])
+where
+    Self: ValidAlign;
+
+impl<const N: usize> Align<N>
+where
+    Self: ValidAlign,
+{
+    /// Create a new [`Align<N>`].
+    #[inline]
+    pub const fn new() -> Self {
+        Align([])
+    }
+}
+
+macro_rules! impl_align {
+    () => {};
+    ($a:literal $($rest:literal)*) => {
+        const _: () = {
+            #[repr(align($a))]
+            #[derive(Clone, Copy)]
+            pub struct Repr;
+
+            impl ValidAlign for Align<$a> {
+                type Repr = Repr;
+            }
+        };
+
+        impl_align!($($rest)*);
+    }
+}
+
+impl_align!(1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768 65536);
+
+impl<const N: usize> core::fmt::Debug for Align<N>
+where
+    Self: ValidAlign,
+{
+    #[inline]
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        write!(f, "Align<{N}>")
+    }
+}

---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260610-const-align-7020a76367ce

Best regards,
--  
Gary Guo <gary@garyguo.net>

