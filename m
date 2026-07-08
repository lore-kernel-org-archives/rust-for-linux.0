Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022086.outbound.protection.outlook.com [52.101.101.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F5434E49;
	Wed,  8 Jul 2026 11:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511495; cv=fail; b=IUd3Ik14vZrqpMAaONBTMFW4JfGHuS+6z3K92iREcsQmWc8/y+lhDYTlIw+CX8s9fHG7UfXq2MKpFOMStn8teEbbAPw5U+u33d/tpjIseUw8QCMg6KlIwV5vySSk49ycAbNCMXIcCmsjiWkHCHvWbvkwgfeZd7z8+8wux/gTG9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511495; c=relaxed/simple;
	bh=rS6aBXdAe0eR48e1jM0FXGov0FRVgXQKpeFmY5l9GdI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=GT07m8QteZVZmdf2q7nXLs813su8olYYYejKc2gJ5u2VQA/ZCATrRjuOFSSa6FcMVQhRysf/pLnIMOuICSKabSdstyp+XUz74cHLVDOz0Qcaw2UbjcmNXvWrtIW+2pFMHJiXc5lr2Cd8pmSjDTtSYhoF4ybHwx/r2nUilSvF4pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=MNpKxCmG; arc=fail smtp.client-ip=52.101.101.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="MNpKxCmG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+6mPlaeNVJJXrRfywWOYu91DY2BFkYJTINJzzH5xTtNTJo1EaOkZzWdXDO4TPmzWRWRLylWcd9TcOpYI78igrD16pPfBqjLkYUZ01SKs+UIFOw6sZo+4r5CoQkn+Q0GgLjVbEoiRFvKv5C8M1C8FsLTxH3tFOFJODwKMHlku7x5STpvUqubIlkwZgXYI1/5wFGDWyW6Zw728/xSwoeW2crTx9euk7V0Rt6SYpNKDBen6Y7rBelZ+ZYUURLFHILCNUD7pNjH/ihqwKOWbbBa8HCBOpxBtbcGclb/NqhAAcOdTofrJN3Jfgid6tFVdbGCH+OIfa1XkC/JM+FgRTyw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfufud0jpya151guvN1ESRU9bRFiCD1wLz/xGgI9N8U=;
 b=RUz42qFEHXue0eB7Yu6BBZLj76C0x4DaSBRmBxepKFyGCGI6WT2yB7UA/LDaoTdDrOjxtjJaVPfk0fGV07kF2kH0NBNwdzvzmZMNknUrnOanqQQeyaRlGRbQ7JQtIfF0KPch5CnLde1jjR3GgxhVawdbcoZpTODuBNlpE6uWQG6C0sYrtEp8jfx4DzddHF72iR6a+Td3H5rAJ1JvhQhn4yFb3vfLzr0SsOhQbN7tEnmkLI4NpYFnqaNQK8aXwMmKGgoXODygmDg7CJ2NJebwlhvf1s9F2aw+mdLy76ZX04opDc2xm2F3EOj29LVBAyj8XWuDLNsM406Coz1MIcvuRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfufud0jpya151guvN1ESRU9bRFiCD1wLz/xGgI9N8U=;
 b=MNpKxCmGJuqTFPlLcad4nFTiESGjg4yMKTqUEgMfR+P7NWgNnStiy94KGXqZT823fCGDoCPmP6iXQk2iAdF27zoSwunnCSly1MbklFDK9g8dLkQa2inUzikTJOA2m64FlmRZ10v4sxjzvXNpnw8ZxzQaQ2PWc0EfnMFji75BWIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5605.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 11:51:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 11:51:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 12:51:29 +0100
Message-Id: <DJT6235B3DOV.222XR5O6VHG4M@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: export zerocopy symbols to modules
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260708-zerocopy-export-v1-1-2bfc355853c6@nvidia.com>
 <DJT5P43GJ9MT.2527G7CFCEW46@garyguo.net>
In-Reply-To: <DJT5P43GJ9MT.2527G7CFCEW46@garyguo.net>
X-ClientProxiedBy: LO2P123CA0096.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: e603ae8d-2ca0-4bf9-8d68-08dedce73faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|10070799003|366016|1800799024|56012099006|3023799007|4143699003|22082099003|6133799003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	oyNdor8aHtVqgFdxdmlmMjw972UWBoGIoJC0AMMPGkpN8Z0DWaa4SN89STeFelR3ExvomNCDcEH4JCVa+zG6c0si1YfivD3PM9Kz27xB4B/lj+dR/w1S3EoQqq1sj5YGaBzvp5kMwgPchr4ZgYmJULMrp5xsLU/wgrw8grRoClB/5sbMVIaPLo5FpbXrMDB77hMRC7ViWdobH6WkHT/HAf5WClcdmSys+G6I9VVXTZFcI2/i9aYm1i2ZkqjkqQ1Pw3qUVgjJoLTyTGwHXy6FX5tCC8TKfHLiRCkYaD3ZU6ToU4Qz1L3coggrd2vaGW2qmn+LCXEmLNupFraepSjPd/NS18G0TlHnX9MAsQw0M2m5YB3uB4VlE8AGD9W5Gpmtzkgi8f8vGQYmqgBy9tcWYXkqct7kP95DBuQHk+DtC6o51+4ww50jCdapq8cPEcH2je4KngyK1410g94IwtkKK8qMkbm/WTV/EO2fAeMUA13vyRy8EhPzjWEBhzLCXgS6UVPWT/2bhhQCagVoW+/Qo8R8uF0yXpPXevB/guujr/ri2ZcAG+VNVfw+1Fq396NM7IR93idd9bOafrnkFnVMSWh59wn/0wJ8UpUI6zAMLvoewTg1j+jfkB9jlWlJjkmZxW9uyABzEdtwq89Ji8NqkQPlIitRM8pOPA6w22f/rQ7wtxCI7KqWmB059gHJhaK58oBQy7Yhm3XrL/EGK8IcKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(10070799003)(366016)(1800799024)(56012099006)(3023799007)(4143699003)(22082099003)(6133799003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDVkeGxOa2k0d2E0eFAxSlBEWEVDazdmOFZBQzVOdTlvOVExV2NtMXphNGVi?=
 =?utf-8?B?YTE1N2VKN01lRDB5SVYzU0hFejBVamJtMGVZRFQ4U0JNWHlNMlo0aUhnU0xX?=
 =?utf-8?B?QlJiRnk5dDBXdTJHYmdpeUhRVTd2QkR0OThuRllnTm1jM210R2FWQ3BBdmw2?=
 =?utf-8?B?WmQ3RzNNdU90WENYRGg4Z1diS2dlcUI4OURKKzVqTlAwYm5TelZDT2E1MktK?=
 =?utf-8?B?ajNZRC9rVjRHUDRiZ1A4SVVWMGZZVU1maTN1b3h6T1BYMlVqZlA2eVgzUnc0?=
 =?utf-8?B?NHVpUDA1Qnh6eSt6VkljK3V2a1dzSnI5dlpzV3FtNTlDTE54dHBta3lzSFBy?=
 =?utf-8?B?dzNmZnVKZDNFZFFUbWprRG9JQkRocmwvNVdJWGljS2tsQUVFQVk5dDZVZWlC?=
 =?utf-8?B?ZmRrVmQySVVDRm9UeVFQSlpNaUVyQ3NINHRpUnN6U0JFTnZ4UU5ZY1p4SGI4?=
 =?utf-8?B?TThiT1Y3Z3lMM21iK2pUYnVVQ0xEMDJ2WFlWYWJiOTZ2KzNFYkVZVGJZY2dR?=
 =?utf-8?B?R0Nsci96aEREQmJ3aVdTckxkTDVsNGtBRjZWbDlqMVpsdGZWOGNKUzlyNHdU?=
 =?utf-8?B?QkZCNll6anhqTnh6aUV5d04wTzFBSUdPNVFGZTd1L05OY0lRams3OEh5Um1u?=
 =?utf-8?B?UWgyMmgyd2tTc1pudDc0dE8zRUplbUZOa2FXVVNJUXNoUlhOVzkycW55Zmgw?=
 =?utf-8?B?ZmJjNmZOZFNNK1RrTkFVdnhIZEJON1ZJZVdMYjFsdmozOTdzMGxyWHZiMzFq?=
 =?utf-8?B?OExsbkphY3FMNERQcWR5VmhHS1ZEWG5WSWFFLzZRNVpITERjayszVjBJbDB6?=
 =?utf-8?B?YkpJZXYzR1dmd1B0eDFNcFhUbjZqTkxqZUVUNGRmazMvNEJjM20xeW50RW10?=
 =?utf-8?B?YXA5ZFkxSk4rTk4xZmJiaTJXODNlZXFpWE5NU2NFQzBrWm55VUcvaFlNT3Zq?=
 =?utf-8?B?MG1HdkxDL05ybFlFUmtZMVZERWFYWE5lVTlVWHRaaXUzVVlaVkZzSlBsNUdL?=
 =?utf-8?B?TUJZR3pkVkk3WkJ2L2RXanpoTHZsYkxUbm1pVTJVZEJ6Wi9DQlhzcFcxdEJs?=
 =?utf-8?B?U0RyNEhJZE5IZFBLL0RFaVgxSFMzWm83b1lkVmFsSVZvN1pURkVKeVJCM3dp?=
 =?utf-8?B?RTNZYUNvcWdYMVNRcVNtekZML1g0WXFGYTNWc3g1ZWxFMXNTa1MydlRlUnd1?=
 =?utf-8?B?Qnd3N0dIWUpuV3R3VDhsRWVLLzNVQW5iUnZBUm9YODFzR3c4S2RFRUdnY0lE?=
 =?utf-8?B?TXdEZFZPY3FpM3l1VUlhRkgvQk1jR1FhekVudGxMYmJnd1h3YUJ1eUdDOGZR?=
 =?utf-8?B?djJNeHN1dlVPdXBFcjRqT1VacXAvT0RESUtrb2dOb0JERHk4TlF3TmZHTm9C?=
 =?utf-8?B?ckRJaWxLaCtqdXJucjlCdmRjNEZjbmVwSlg5RXNMbGVoMkwvSlR1RXgyYy9B?=
 =?utf-8?B?bkZFWEdDNngvaEJsRjRZSTR0Qnd0Sk8vc2cwR1hvQSt6ZFhlaHZBcEFZbmQ1?=
 =?utf-8?B?N1lHS1pHSVNJWDJpcUhIK0prRmtpQkFnaXZmbGFKSWFXOXFNNEJYS3ZScTNO?=
 =?utf-8?B?SGF4aXYyczRucWxJWEtwc2M1VTJZM0g3TmZqc0RMYVh2R1FZZ0tHTGNrVW9Q?=
 =?utf-8?B?M0M2NGFmbW9Cdm1vdzBQNmFRTnh3NHRIOVc2cjA5WUdXVjZwZWYvQStSR2VY?=
 =?utf-8?B?SUxXTmFvSktvV0xkbjU0eU9IQndaNlhYYytEdSs4a1d3UDRCSzlmNnF6cUgr?=
 =?utf-8?B?dis1OTUxZkE4RnZ6eW9YZXhKazFjaWo1Q1ppb2QwQnl5OFlTRmt2bFhkYmE5?=
 =?utf-8?B?cm1XTFp4VmpaYktPNzhQMStyUDBDeVRGcEFNdzczSVVrVVVCbDNJTnB0eGY0?=
 =?utf-8?B?YmVxeUY1L1AvYnlsbTNmRUhnN3dLWE9SbWtGRHpZN0toVnk3NUdFU1pXOVg2?=
 =?utf-8?B?ZWZENkY4U2ZZUlE0TzhCL1Q4Nk9YU1JELzBBaXlLVExxeWxmNUt2WVRINUVt?=
 =?utf-8?B?NHBHUFhkellkUEFzV3RmVzNZVGduRkQvR0VZK3psKzV6UzBDdVV2a0VReEgr?=
 =?utf-8?B?U29DM1BZWjZJWkhYczNoQ2dWVUVGK3V4NjdvbTN6QkFJS2ZleXlQSlB1WVJu?=
 =?utf-8?B?ZU1ONUZ3SUZLcHJDUmp5V1lrK0Q0M294OUVMbDNwZ3hWekd3Y2tLQlplK3h2?=
 =?utf-8?B?MFdCakx6WXJqeHlFNXJ2RE5KeG4yQXBxem5xdHdxSldPQTFTK1NIU1VreVpk?=
 =?utf-8?B?cDZnSTRzSmRBS1pTNlNIU25jT2w1eDB1czJsUEdVMmlzRlppSXlDYnFGTmxM?=
 =?utf-8?B?Y2lhb1FQamplUjNqZFpzRFROZjluTEFvTlA0bmJwL0RaSklMd3VjUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e603ae8d-2ca0-4bf9-8d68-08dedce73faf
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:51:29.8174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5LJRNBufeerT2TTIJVsV4zqSKueq5ez3lYJTZS+e1taeGH5xzS9EBeZeGJ7znBftziUd62BHnOJcKJ1ugxW7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5605

On Wed Jul 8, 2026 at 12:34 PM BST, Gary Guo wrote:
> On Wed Jul 8, 2026 at 11:37 AM BST, Alexandre Courbot wrote:
>> Non-generic, non-inlined functions of the `zerocopy` crate are only
>> codegen'd into `zerocopy.o`, with their symbols currently not exported,
>> making them unavailable to loadable modules.
>>
>> This can break e.g. nova-core built as a module when
>> `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy`:
>>
>>     ERROR: modpost: "_RNvMNtCs5wX7wwEUCR9_8zerocopy6layoutNtB2_8SizeInfo=
24try_to_nonzero_elem_size" [drivers/gpu/nova-core.ko] undefined!
>>     ERROR: modpost: "_RNvNtCs5wX7wwEUCR9_8zerocopy4util18padding_needed_=
for" [drivers/gpu/nova-core.ko] undefined!
>
> It looks to me that this should be done by fixing zerocopy.
>
> Both these functions should be marked as `#[inline]`. I would expect zero=
copy.o
> to be having no .text.
>
> Instead of exporting this, I would vouch for going to another extreme --
> completely leave zerocopy.o unlinked, so we catch cases where code is act=
ually
> generated.
>
> Best,
> Gary
>

This should do the trick. The only other unexported symbols are f32_ext and
f64_ext, which we never use. We can mark them as `#[inline(always)]` as wel=
l,
but figuring out how to compile them out completely might be better.

diff --git a/rust/Makefile b/rust/Makefile
index a870d1616c71..98c6086342a7 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -6,7 +6,7 @@ rustdoc_output :=3D $(objtree)/Documentation/output/rust/ru=
stdoc
 obj-$(CONFIG_RUST) +=3D core.o compiler_builtins.o ffi.o
 always-$(CONFIG_RUST) +=3D exports_core_generated.h
=20
-obj-$(CONFIG_RUST) +=3D zerocopy.o
+always-$(CONFIG_RUST) +=3D zerocopy.o
=20
 ifdef CONFIG_RUST_INLINE_HELPERS
 always-$(CONFIG_RUST) +=3D helpers/helpers.bc helpers/helpers_module.bc
diff --git a/rust/zerocopy/src/layout.rs b/rust/zerocopy/src/layout.rs
index 6015d0f2de52..1870363adf10 100644
--- a/rust/zerocopy/src/layout.rs
+++ b/rust/zerocopy/src/layout.rs
@@ -71,6 +71,7 @@ impl SizeInfo {
     /// Attempts to create a `SizeInfo` from `Self` in which `elem_size` i=
s a
     /// `NonZeroUsize`. If `elem_size` is 0, returns `None`.
     #[allow(unused)]
+    #[inline(always)]
     const fn try_to_nonzero_elem_size(&self) -> Option<SizeInfo<NonZeroUsi=
ze>> {
         Some(match *self {
             SizeInfo::Sized { size } =3D> SizeInfo::Sized { size },
diff --git a/rust/zerocopy/src/util/mod.rs b/rust/zerocopy/src/util/mod.rs
index d6d4c6c2fcd9..ceffe8b5510d 100644
--- a/rust/zerocopy/src/util/mod.rs
+++ b/rust/zerocopy/src/util/mod.rs
@@ -150,6 +150,7 @@ pub(crate) fn validate_aligned_to<T: AsAddress, U>(t: T=
) -> Result<(), Alignment
     // Ensures that we add the minimum required padding.
     kani::ensures(|&p| p < align.get()),
 )]
+#[inline(always)]
 pub(crate) const fn padding_needed_for(len: usize, align: NonZeroUsize) ->=
 usize {
     #[cfg(kani)]
     #[kani::proof_for_contract(padding_needed_for)]
@@ -251,6 +252,7 @@ fn proof() {
     n & mask
 }
=20
+#[inline(always)]
 pub(crate) const fn max(a: NonZeroUsize, b: NonZeroUsize) -> NonZeroUsize =
{
     if a.get() < b.get() {
         b
@@ -259,6 +261,7 @@ pub(crate) const fn max(a: NonZeroUsize, b: NonZeroUsiz=
e) -> NonZeroUsize {
     }
 }
=20
+#[inline(always)]
 pub(crate) const fn min(a: NonZeroUsize, b: NonZeroUsize) -> NonZeroUsize =
{
     if a.get() > b.get() {
         b

