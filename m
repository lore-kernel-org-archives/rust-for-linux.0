Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021122.outbound.protection.outlook.com [52.101.100.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361D4338936;
	Tue, 11 Aug 2026 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456569; cv=fail; b=bEpepnBTh7gNFTBTWYGCPYIm1gHyH0QDnxfqwxP2eAQ7D0Buqt7eEKHjYD08gzeuBnKHVf8mvIvx4mOiefANmZrY/7OFCI2wQKfnOCJQvZDjqMIJrpL4s04Ew3z89kd0vKDg/JVcidEE1g/QdWAVGYjKGKQaetTT2yT2Uy0Yqmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456569; c=relaxed/simple;
	bh=DGqeYGJbOZC5QOnNInNezUiW6itP8noeWPvF08pVCd0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=e9s+7TChWiMnQDA8hXivn1GJ6n2Rzwaf7Z7M+FQlfE60E9ZHCRovYFP5CpnwH5xX8kPDDzq1xPwkUsy4t07W5AhXeahcx6+0VY3B6l8AV8bol0KKxO6j3LSh9nWqDnlPtg32wtnSOyj+PaNz+ijRMXF+5NOIV/LszLyUPn83WqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=p41NNQaF; arc=fail smtp.client-ip=52.101.100.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="p41NNQaF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjTr4iBIu9heVvbJgi7kKlvsNIsmDBgkdldcnpq6N0bex12IIbRDmkG5wwUZf8UrebSvztTlPorMi/Q2Wox0QFxe5P0apuDzKHSWMo6SH+zP9ekjSIfSdH7R6tTMlEL8FRK7fivU+9X1CDCSeUaVfk4h07EqFWDpoReOphlcGPn+gkdJKZeyrSKIzxRLYheLeBUZ8qz+4mr+Cz66Pe79xCdJtgPQCcKFn9IhFT6MPEBA4dUg7efHidh+XxwtaVFE/G7kvh6vKp5ZCOc0lCcoN7ypZx/tH+/nHrgYrJUAtGYhYCFYrxRBNb9V6pZYcUcJHAXWbQ5Adgma68DzkTWOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzCX0njC8JZvAA8vL8VGbbs0mK22c/XWYVtmiGXDM0g=;
 b=tnEmFTQlRKL85h1wSjcNBWZJ48Qh8z+O0xtKiOoGtFNO/aaXRsiI4YWFCPj0dpObI4yf8dldySdEqkyHFlYtEF5u74U2qX8QvmZFfyl8KL1065z8uqonnIocQ6e6uSqdXCNdlzkSWhZ5CdStibWMf7/Srnro6PPp6yuojpzN2rZ8b1ngmHwkXBF6+1S+wkOqaDbs8bp3/sfR7EjH5XwoHkCt3mpb7bruhfB+py6+vUgEGbtv2+zFk5193VGp7ED5tWLFI2n6zCzo+FUIdfjpbtI0813UsqpZm8qLGohfHkK5cJxZJePzBRQo4L/6umGGwytPBeuE20FPG7waj/yRBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzCX0njC8JZvAA8vL8VGbbs0mK22c/XWYVtmiGXDM0g=;
 b=p41NNQaFztUc71gGtmX0jht1XkQB6yeNs27VVFTSERUkqtjzcnRZSVGBE/BlezR72b4b/fQao5+RbPq64SBgIJjxcbq/onXnCPL84RJZsbeOxP526ra5EXFrIU35J/KTheaKRepsqwCR8TlqDV4Z0EpTSONrTb87LqXm90UcDi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB8765.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 13:56:02 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:56:02 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 11 Aug 2026 14:55:57 +0100
Subject: [PATCH 3/3] rust: misc: use `#[optional]` attribute of `#[vtable]`
 macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-vtable_macro-v1-3-50c5aab3c211@garyguo.net>
References: <20260811-vtable_macro-v1-0-50c5aab3c211@garyguo.net>
In-Reply-To: <20260811-vtable_macro-v1-0-50c5aab3c211@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786456560; l=3150;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=DGqeYGJbOZC5QOnNInNezUiW6itP8noeWPvF08pVCd0=;
 b=C0QKnyiM+sMj7LXJKmLmL2niz4dMVDPx5ksoVzv+C4RFUtP16caUTc4yOqaP4zSuY0sf1tc7Z
 08M2PgGAc7XDT4S98eGMBvte63CCw8Lw9PcLdC2qgCHw4SHHtQ8KKN1
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P265CA0207.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::20) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: 12231852-6dd5-49e2-f8aa-08def7b047bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|10070799003|18002099003|22082099003|921020|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	n5TBYVLYKsjuDFDbC2A/SP4oJbCXZt624u+NiZo6JWViAz+YIPZyIR/RwyQpY7UTwaD5aHRBKxK53jNjG/uXF7oSs4yXA19Pw13W93C9d8f9gUzVWCUPi16QyQmjjagv8aU3qd4cxi+4DN2LlulCrglu4RtWLQM/MmLt2kx+mRUFIgAYN6YwHHjGnjfhYc31H6SXzNa1F2G9F1YTzfDoK+5gmx4xc25C4sZCZKz209DotjoA9HLI4lZhI5sns70LYwG8sQs2EKRD6KHePCJXyv9N9xMhDGVp7dANel/0HGP/64yaCxY91JV+OJfE9yW0Be3jvOE1BGInpGFx3I6lMpias0Q5Sqf17E6YG5k1jlgHrUCobUdYxhIn29eCV9wxmJrVR0uGkViEx/tu57qHvL3jJJdTqw+rZ7rqdqaBSVoL3bPFTHEhCNNVQxVDhvizAewH6JF4Lz+6CViUuTS0PbLt/BXuKUR6AeCL8LQuKzw2KtHphbQTodN+PYiSqvD0bq7jvOPif3B1TBhL7INsMMKSXN7UlrfLW/Ess32hi2sjBSajyAH+YqvXVD3JMBDhB5xIieu+IuXLIqW+YE6MJTonie8EggbWmeFoPapkXIpZOioNcH7GQ5omu0La6q5WQfg3BNsNO5hL2tt+wHFFm0mbqT7t/3+klmNrjKR5SXp83xqemZzYoflcrsojV0Ri0iI6t2GQCLxt0/UltIh+vA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(10070799003)(18002099003)(22082099003)(921020)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czJSeCtjWmRndXc2VE9oOEllMkF4cEREYXMvck5pQllRSEFKWmFaWm5LRUVl?=
 =?utf-8?B?MWgySTRhQ0ZVMElEL2UvYThvTzdjeGtDSnU3SzJoMElXUll1MWVGQmZ6NFFs?=
 =?utf-8?B?MjJzRTY0UUZyK2tjSGFTVHZQY0lVeCtYNHAvTmMwc1BuMHdaWmEzOEhRWDh0?=
 =?utf-8?B?STlSdVF0NmtuUUxJbmlWaU5GWU5wWEZuYlZ3TXFGNFBBTU1heWNYRTVPUnNQ?=
 =?utf-8?B?QWl0ODlJVmw2KzJxa2Z6eUhGOG1WQlFzenhYaEJSVjh1cGQ0Risxd0p6NklB?=
 =?utf-8?B?WURjUW1MWGYzOVVoM1FRTmNGQUNnM3ZSNWhTYURPTEhZR1VRakNDc2c0a2lM?=
 =?utf-8?B?a0FzNVJVNmNzci9meWZ3M2x5L2FWM1RiRjZhaEZFT1A4WVFqbTUrN2N1ekZM?=
 =?utf-8?B?SUNQUFo4cFBTR1JRbXdJZHR5aW1yKzdUUlg0VEt4cmUxOVR0cEtYY0dFNGcx?=
 =?utf-8?B?SGg0dmxSbkZqTk5ObkJabHN3SXFnT1B1TXJLMTNHdEJWaGlnZ1h1NFhSdzZo?=
 =?utf-8?B?ZTNZZXdHM05GQU1MRWpkeDlCb09KNUgyOEpzNUhaaE9ZL20vTXhEdWtJd2pr?=
 =?utf-8?B?VklZM3pqR2g0dlVSU3piRDkrc1daS3IrUVU1N1dkNGxPWEpKd05UcEhMdHVj?=
 =?utf-8?B?ZjdSVWZSMkxOa3djd2tsbmRibGk0OGlmN0Q1NWQvVWJab01EaTRrbDlXYWhw?=
 =?utf-8?B?T25BeTBoekRFVHRIcEFIdFN6YkwzNmRacU5zdGlFVWd5OFBFdmJBVUFMdzR3?=
 =?utf-8?B?RWhXMUQ5MHN6aFZFcFozdVNUL2JXK2QzcXBtcW1ZMFR2NjVhNm5kRjBsUUQv?=
 =?utf-8?B?a21WL2t1MkNDSElxdysrVnFMZGQ4bzBNMFhSMWhXZG5mTitjNHRKVTRDaEo0?=
 =?utf-8?B?T3orV1R5QkhSaUNDNWlVRXNzcXFqazFrY0dXUEpHQWtLQ0xWWURrekVNWFpL?=
 =?utf-8?B?TmlQc2laRWdPOFVXS0w3MjM1Ti83eVBxdDZOaFBkeG1VTi8zck9RTFRRVDhV?=
 =?utf-8?B?VEJJQ01nOXFwMkVYWTM1NldpUFppT3lLcitYYXpIK0V2OWwwb09zcElzRGcv?=
 =?utf-8?B?NnkrTUdPR08wcW9rRTY2MW9PdHRWQ3hHbkJvRG56dEUrTXYvNkljV0ZXTjY0?=
 =?utf-8?B?UWVpdEphWUhTTnZ6d3duMEZBWS9kdVROSXRCcXptZ1c1MzZWMWNaNDg3eitI?=
 =?utf-8?B?eVd5M1pzODZ0NDlldEg4SXRqbVU1RDdIKzdSYXZoeXI5cCt6OVlIalJKV25n?=
 =?utf-8?B?Snhzb25WWDQ0bUFoY0VwUlBTOS9FdG41QnpOSnczS0VxWDFJL1BpUkwycnhh?=
 =?utf-8?B?QlVueTh0aWpmaHliYkpZMndYNnZyM0RFdzBIcnRkVGtxYTlQUk9iSEZrdTd1?=
 =?utf-8?B?OHRTSmt2Mi9KRlZDRHR4L1BjRGJQc2toSUhMWkF3MC9NVEUyL2hnekVZaXVz?=
 =?utf-8?B?K2RWaDA0UDNFS01lQVppZW0xQ1N6QmFJWHFsei90Z1A0WlorTW9wZ25yZjVN?=
 =?utf-8?B?L3lycDZDRDNZT3ZTMng1czNRSEZLNzJKTjM5TDZGclJPa1BFUnR3ZThmcDR2?=
 =?utf-8?B?RTBjWVRPZnZnNEprSFRBZURjb0VoeDVWU3liVG9HUHh1U285QU1NWGhjWFNr?=
 =?utf-8?B?a0Y2QmRWekwzT0ZEdTB6bURyNG9IWkFoUzYxUkJkd3ZSbWhmc2w2MFFMeTA1?=
 =?utf-8?B?Sjc4K282SGVVNDNzY1BoOW9raE1YYU41eTNzd2d4SGhFV1k2TWpMT21OWXVz?=
 =?utf-8?B?TFQxUGkyaUhTeXNnQmZqWWpDK28rSkYvbk9Pd1lNRVV5WXZZSldhZ1I1d1lk?=
 =?utf-8?B?VnZHZEhucDA4MUlCSGFtTHFhQTdiOUM5WUZyeG8rL0IyWERPR3dvOFcwY1Az?=
 =?utf-8?B?Nm10dzlsSTBZR1kwWnFodDZRTFJxWlg2Tm1qSEJmSUExSVMrWmxGeHV5ZUdN?=
 =?utf-8?B?NU5PVGpMNjdDSHlNUlJTdldmbTdhYS9aM2thMU10QmlyNmJNdnROSURqbnJG?=
 =?utf-8?B?VUZ0WkdxUG1iOUhaUVRIQXNhS0RaWHlXblhSL3ZqYUlnTmZseEZxZ0J0Q3FM?=
 =?utf-8?B?QXVUZnRrclVFUHBjY0NGeHU0elI3OE9rRjZvcVFLV3Z0WTRlaTBFcUhVUy9t?=
 =?utf-8?B?U2VlL3FhK0NRYStGamhyb2JROXE4d2RZNUNNRlIrN0U4aGN2SmxmOStyUW5C?=
 =?utf-8?B?NnIrWUs1Y3Bzb1VRZ1c0Rmd2c2loL1kvTVNKVVNkZXhpRkpkMlFTV3BXU2U1?=
 =?utf-8?B?dlhQU1M4YmRNVG9vTzEzUU96YjdLWm10OGlzeEV0T2pHT1E0cDBtSStOaVIy?=
 =?utf-8?B?UjU0bEVnQzZSZ3IxRGJ3LzNyaGtJZXNWRWJSckFPbDlaWEF2Skg5Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 12231852-6dd5-49e2-f8aa-08def7b047bc
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:56:02.3725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrCaPjpPIEf8OG2UstVObkegBtcqYPuKTofl75PBcT/OwajcnSnEQt0lf1xXJOE9/GJ1zapd6ZuVOnwYxRinCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8765

Replace the `build_error!(VTABLE_DEFAULT_ERROR)` boilerplate with the
`#[optional]` attribute.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/miscdevice.rs | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 3abef1b8543d..76cb45e2a5ee 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -11,10 +11,7 @@
 use crate::{
     bindings,
     device::Device,
-    error::{
-        to_result,
-        VTABLE_DEFAULT_ERROR, //
-    },
+    error::to_result,
     fs::{
         File,
         Kiocb, //
@@ -144,37 +141,33 @@ fn release(device: Self::Ptr, _file: &File) {
     /// the VMA initialization by calling methods of `vma`. If the function does not return an
     /// error, the kernel will complete initialization of the VMA according to the properties of
     /// `vma`.
+    #[optional]
     fn mmap(
         _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
         _file: &File,
         _vma: &VmaNew,
-    ) -> Result {
-        build_error!(VTABLE_DEFAULT_ERROR)
-    }
+    ) -> Result;
 
     /// Read from this miscdevice.
-    fn read_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterDest<'_>) -> Result<usize> {
-        build_error!(VTABLE_DEFAULT_ERROR)
-    }
+    #[optional]
+    fn read_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterDest<'_>) -> Result<usize>;
 
     /// Write to this miscdevice.
-    fn write_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterSource<'_>) -> Result<usize> {
-        build_error!(VTABLE_DEFAULT_ERROR)
-    }
+    #[optional]
+    fn write_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterSource<'_>) -> Result<usize>;
 
     /// Handler for ioctls.
     ///
     /// The `cmd` argument is usually manipulated using the utilities in [`kernel::ioctl`].
     ///
     /// [`kernel::ioctl`]: mod@crate::ioctl
+    #[optional]
     fn ioctl(
         _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
         _file: &File,
         _cmd: u32,
         _arg: usize,
-    ) -> Result<isize> {
-        build_error!(VTABLE_DEFAULT_ERROR)
-    }
+    ) -> Result<isize>;
 
     /// Handler for ioctls.
     ///
@@ -184,23 +177,21 @@ fn ioctl(
     /// that have different layout on 32-bit and 64-bit userspace. If no implementation is
     /// provided, then `compat_ptr_ioctl` will be used instead.
     #[cfg(CONFIG_COMPAT)]
+    #[optional]
     fn compat_ioctl(
         _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
         _file: &File,
         _cmd: u32,
         _arg: usize,
-    ) -> Result<isize> {
-        build_error!(VTABLE_DEFAULT_ERROR)
-    }
+    ) -> Result<isize>;
 
     /// Show info for this fd.
+    #[optional]
     fn show_fdinfo(
         _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
         _m: &SeqFile,
         _file: &File,
-    ) {
-        build_error!(VTABLE_DEFAULT_ERROR)
-    }
+    );
 }
 
 /// A vtable for the file operations of a Rust miscdevice.

-- 
2.54.0

