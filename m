Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021119.outbound.protection.outlook.com [52.101.100.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FD245DF44;
	Tue, 28 Jul 2026 14:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250363; cv=fail; b=HvPzFfT2Vay+9ppvHfEiHPJZKkfkz4gwwJhbr+/lDtHixFYsqe3GCOw0jmpNlm12SeUhgPZs2a0FeWPfIsSS64Fh9w8hFMBSVLbEmlZVDN1txnCGyZfGF7usJi9JSj+IclZqzGKpQDheZS5R7h8L+EZxgyrHymPfjsrSiRzVIvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250363; c=relaxed/simple;
	bh=NyvYVrUxrWGCIgg+i6LU3meVb7NncVfPP36ld2bSlno=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JMxyBvp2EZRi9Hh738HGJmlwUw7zLzVq6d2DpWSLaOhoG1id0F0T4VIRvv7/DIeY4Dk35DZFZ4cpFNYhyYSuTsN0ApVLPgdacRBC14HwKY4UE0ldMPinhndqVceYT5SrXJlSUM+nIcXfWYSLODnj/JdocAqljPZUoBBmUmgfXk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=d/AfBsK4; arc=fail smtp.client-ip=52.101.100.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="d/AfBsK4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbzMegR2DM1FCfDGbXvSK3CB/rMmAcUKmPt00+o/q0/Duw4BEMgak+kym6hrnMlrCOw0Rpp8AeaVoeVWuC1lP+aYmdKqh7/rYycQQ31G+mdIZJP4ThitbGGjCDC8qbem7gyEu1r//eOnEBkiNF+EVr6PkIeTTNGy3vbu/uWOLJRC9NnJGi9pVeZQnVMMWo8TXgRG8+7r+RJd1l9/WASrQ/j+2h9sd4mmojldK2JvYPQZeijSnlZf7vGzZ1aDioxU8G7VLlQWY09CUEmhN0UrI8wG39yRHE6yS/qcQfE+7e/UiOEcgYuxoplZJ75Gx0JgPLGoqRkf89pDm1PDkah+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i62rzc1Pk6J2RaDHY71m1LAI9ifPM/65/FFv4Z0YlX0=;
 b=vTG+ikHGmNOlODfR785J4JKcctmcPoTArF+9LQRFFFMGDh1KxX3ALW8zBG39YPlGSwBun110R+RZiTTy5pfK6xdImgHHG13O82NeuMCqD+IpzuOo/RcMlhq8zmFzI/qio6NYQVf0VQtStWcwU7jzVrJevsdeYOPUFWv4+B7WEiM/SLyWrXcikZ8KIu7EiAbKJn6Zit3ByVWleQdpaOmmxLhRHEnXoxODVhOGxyJkORbzuRs7WgDlX0RE++TDLficr3BdG7QccTqqCHCk3C1wv6Ktku43cxbMVhdcdB7SjaMwGEJtlujItczS2NbziCdwIfA70R2AE8st2w9oI/+SsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i62rzc1Pk6J2RaDHY71m1LAI9ifPM/65/FFv4Z0YlX0=;
 b=d/AfBsK4dZRcwr9FCfQge2+cD/MS25NxSodXOdcdJf4whzCk1f2esc/SJQTlp/Py6L33D8t0eH4WoeAnbSd/+Mfq5VRpjjKii9t0OCN7vtdJQ07XnuHcal3qWj++lPjdoK+2kgKpYbDMdT+0mGfL4CtQegE28FgclgtubgAggc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB7374.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:31a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 14:52:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 14:52:26 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Jul 2026 15:52:12 +0100
Subject: [PATCH 5/5] rust: print: add `continuable` as option
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-printk-v1-5-855606634d70@garyguo.net>
References: <20260728-printk-v1-0-855606634d70@garyguo.net>
In-Reply-To: <20260728-printk-v1-0-855606634d70@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785250342; l=7928;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=NyvYVrUxrWGCIgg+i6LU3meVb7NncVfPP36ld2bSlno=;
 b=qC3puzp+vyssHURgKWatS3c0VT39Ut6pYcx6LU1wiap6aaM1ovEsIJxxKpHDR3wHivSLfkAD6
 qaHgw/ksOteAP4nxpe8PaJa1Eap+OIuXDs9pqADmYBfulwgVcxw3L6n
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO2P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 068fea42-5806-48b8-b79b-08deecb7d63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|7416014|18002099003|10067099003|22082099003|5023799004|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	A64crxRfjAFyrNRtvCtlaM7bqY2VriNHXWHNHD+giKW21QzOKahrqtiVrJir6YJAsA5S3Vhwr4HJcDrrwVDhAwh+7wGVEuuG5NAWR6ShcCRhGkDibkwbtkWyQy9wb1yqtl0PXgfxjWPTRBweOWuG/zeZ5601af6Wm4gVrvjBh20iYHf7lcwqiQBo7JKb/u1QJzrSvaOj+VwU+kEJiL/+NHTyuT/EIr3670acKaC4+aHfyB5DdTHz/kf2FJO8EifsTWm+A+zsfaLpbOfbDrf1sAwnTWskLP2NtktRuhjjhCAxd3y9dFXv3b/dDS7MtLOl6V6A6mdJ8ssfK/2sx98tvgUUcQFjQ8SO0roPxs2dJAS2kQoUIQad+qAdVd7HMGHGRVxq7TnOcelUS2N/ywCwhK54BuYy4cmBKNvgr2IC61sYoAqn7rzk+xjhpJMF9J+kCeec/XpJpV48Mong+tHkR0fwD3fWJrVmMMJ/d4XrCzTqeilMaxW1yl1RcYptngr6uVo8iYYFjjgVNK/Ga1Onum9iPnUl6olio2xQ8qu/ydmuO2tLuiejixaOZxxiGhxCDu9bzl+HhtPXA124/bkWScGe+XQfz7w+TeAVt2OysIrfSyPsuRpNAopvpjna6HPqqmkStLTSDeaK2Go26yZbjOcNH7sIwxfDBw9goWWGzlbYXYZjsX/29PeRqDhek/gWhoxLediJ3mzhaJKA4eYumw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(10067099003)(22082099003)(5023799004)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTI4NnZYTEQwcmVqVEt3ZWNsTFV0cnQ0aEhIWHJsc3M1dlFHblBFU0QxN3Zv?=
 =?utf-8?B?R0djZnJxWHNaYitsUE5INWV3ZmdtOHJRQmxTOW9sc1pzaEJVU0ZHUlVPVklM?=
 =?utf-8?B?V3RJSk50RHhpTHh1Vm1sdllmbGQ1NkxLSGxTbTlBR3cwVGJXenhCd3Byd1g4?=
 =?utf-8?B?QTRtcHAwY09xWUUrUURTSGx3bWZFRjE4UWs3VVNOclV6OHlQaWRwRFJUMmhL?=
 =?utf-8?B?dU1PMEkrRDRnTCthSVRESWlRamx5em55ZklGMDUybVhCZm4vWUR1QlBjeHJZ?=
 =?utf-8?B?dXJpWFd1dkdjVXBURlcyeGl1QVBKTGxqay9KdXZvbDV2SzNyTVd3RWxIWU9Z?=
 =?utf-8?B?N0VzaWJoYnFhOUZ0dTh4VGRsaUxLWkFDTStiL2JhZG9YTnNwN01kdkNldlVs?=
 =?utf-8?B?OXlVemVBR1dxczhUdTFtbWFSbExjUVE3cGVpelRJT1kwTEFRU2ZiL2lJemNK?=
 =?utf-8?B?dDh4WkVVdDBGRVdQRjU5b29LRHQ0eUpLdHZXZkVUazVNNW5mSkxnbmlta2ln?=
 =?utf-8?B?S1E4N1VzMlc4eTNqSUJMOEg5QVlJTXE4MStEcDgwSFZPLzhBOG1qL1gvT3RS?=
 =?utf-8?B?OTlQUFdxVm1jYkViaW1JcXJvODNHYjUvVFRhWVNFUmN2V3YwY2IrMGhBQzlG?=
 =?utf-8?B?S0lMY3Z0anM2clVLYkhBSHVOeHlNd2NrdWdDS0N0K2grNlRmd0poVEc4VVdI?=
 =?utf-8?B?TUptaEtQYVV5ZUhxSjFuU2swV1hYTjJjTVNlUVBlcm0xazJZRFk2bGJkeTJo?=
 =?utf-8?B?MGhzVHNjS1RVenpsUm5FeVE2QWh4cHZibTlpbXpLNEYxWTdHb2c4cElHRkRy?=
 =?utf-8?B?ZjduTnVJc2hBMU0zZTZSSnhqWmx0QUYxRS9KSVJicWxmS3dQbElNSzVkSDEr?=
 =?utf-8?B?cXpsUEx4MDQzRHRmSUdxVUh5V0h2NkIvU21pbnB5OHVBRVQ4MStIZGFxN3Rj?=
 =?utf-8?B?L3l4MkRwVkdHc1NBZXJiUXIzV2xrZmVGNzFWbG50ZFoyZERsT0hueWhjUDRO?=
 =?utf-8?B?ZFhESGpDVFRoYUhobzMxZloxY2l5eCtwS1hIdkljUndwbXVUR3V4WFgxWXF2?=
 =?utf-8?B?TnFwajZZbEZDUU8xSFZzLzZHSzRGNjlDYW9GaldYT3c0bG1aU2dMalJaTlRy?=
 =?utf-8?B?R2Fldk5pa2tLamM4eEtNS0lDMkNseGovNzBzc0xIMnA2S0FwL1RQQkt6aHFR?=
 =?utf-8?B?WTdlRHNJd0JBZkNBZ0sxZkhOdkROSTlDejZUbVdtb1pYRTdER3I1QlVwcVJI?=
 =?utf-8?B?bXBPb01tYWtmUjhXb1dsaGxmMVplMzZRK0RNNW9VbE1UMWF4RmxnWWpQWEQ3?=
 =?utf-8?B?L0poQjFRcUZUYmpnUTBoaDJvWGRWeklINHhtMklnS2I3VVBlZkdPUzlQbGRV?=
 =?utf-8?B?bmx1SlJtZnk2RUk4OTZiQTRBZ3pPemRZR3lWYkdId2VydzljRVpnem95NHl2?=
 =?utf-8?B?WG0xUGd0Y3h5T3ZoNjJ2Nnh4dnI3d1JHT1RhZHVFTjg0MmJvNXROY0lDRlBk?=
 =?utf-8?B?N3lOWTFGaXNJS1FVUUJtQXM1bFZmS2RNVnlWelRYa1FPL3k0eTEyeEVob0l0?=
 =?utf-8?B?cXUxaVNpS3llbXh0T3ZrU3l2amowWGcwaWZPbFc5ckhqakRRazVIejcveEJ5?=
 =?utf-8?B?bGRGc2JTd25PdUdRTncyemttN0JVZWpwZU9taEZJUUZjUkgvaE5OcTRLWUJz?=
 =?utf-8?B?cFRVQUw4SjloZkdCVmhHbzErd1IrclVLRTJYVHBLNkxDU2xoWWtuZm92YWti?=
 =?utf-8?B?djhvSFlvdzJKU0Q0SmF4T2hJeTFFUm1RMkxZaGR2M25FV2UzbUUvWGtWYjA0?=
 =?utf-8?B?aG0rNFQxdFNOelZsVkMrV3JuVmxhdVo3c09NRjVPeG9ZaGEyZVpEcmlZNkpX?=
 =?utf-8?B?bW5MbWlhVWxXYVBINXRpenpFYlZNdVVDVW9QU1RXL2w2VVdEYlNDUlB1R1hJ?=
 =?utf-8?B?YVI4Vjd5SGhxWTU4QkZPWElKbjFFdmxGVWprN3R4U05PaGQ0QllGeEIzcVNk?=
 =?utf-8?B?NWh6SFI1SGRoUnRURW1mb1pvWDJLNGlneE5YREpRYUNTWnRlVGUyWEI4THFa?=
 =?utf-8?B?VEJoTkF6a3RJZjhoNmpKSFdXb2RlSHVaQ29MYWh4Rkx2d1c2alBUVElwWjIz?=
 =?utf-8?B?QmNHU1BvT1NVTmprRHE3ZElRUkEvU2Y5bkw2cHNkRkxIVjVxVkY1cExYaWth?=
 =?utf-8?B?YmdnMTJaUnFPcmFPdTFxanNyZisrWEcybTl6aHNZZXBKeUp1R21RdEtxbU1E?=
 =?utf-8?B?TUtlTnlYRXJRdkkwSnZqZ3RTTnA0R3VlQXNhZ2ZwbUI4VzdERHhCbHIvZHB1?=
 =?utf-8?B?cDhBNGY5ZzVnZStqbmFsQVN1QXowaVN0UDNTZTkxMkk1MEIrVHRWZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 068fea42-5806-48b8-b79b-08deecb7d63a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:52:25.1207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 901SdOaIa5Vp3we6hh5F7E7frh2NSLsAysJCPhAxrd+xc70gNgHI3LlCAHXb5+DOeC34S9yMG5/Ecfivvub45g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7374

Most users do not need the print to be continuable; have users that need
continuability of printk mark themselves as needing so explicitly.

Other users are assumed to actually want the log lines being committed
immediately. In printk, the trailing newline is treated more like a control
flag rather than actual new line. It is stripped way eventually. With
"continuable" not specified, naturally we should add "\n" automatically to
the print to convey this info and without requiring extra "\n" to be
specified. It is also natural to kernel developers with userspace Rust
background as neither `log` nor `tracing` crates needs trailing "\n". On
the other hand kernel C developers would add the trailing "\n" (or maybe
not, given many C code is missing trailing "\n" too), so it is not ideal to
require it being not present (or adding a redundant newline). Therefore,
make it optional; they will mean the same thing when the "continuable"
option is not present.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 lib/find_bit_benchmark_rust.rs  |  2 +-
 rust/kernel/print.rs            | 82 ++++++++++++++++++++++++++++++++++++++---
 samples/rust/rust_print_main.rs |  4 +-
 3 files changed, 80 insertions(+), 8 deletions(-)

diff --git a/lib/find_bit_benchmark_rust.rs b/lib/find_bit_benchmark_rust.rs
index 6bdc51de2f30..7fd7d4b26d0e 100644
--- a/lib/find_bit_benchmark_rust.rs
+++ b/lib/find_bit_benchmark_rust.rs
@@ -62,7 +62,7 @@ fn test_next_zero_bit(bitmap: &BitmapVec) {
 }
 
 fn find_bit_test() {
-    pr_err!("Benchmark");
+    pr_err!(continuable, "Benchmark");
     pr_cont!("\nStart testing find_bit() Rust with random-filled bitmap");
 
     let mut bitmap = BitmapVec::new(BITMAP_LEN, GFP_KERNEL).expect("alloc bitmap failed");
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 2c82f5e82700..0382a0bf71ec 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -42,6 +42,7 @@ pub mod level {
     use core::ffi::CStr;
 
     pub trait Level {
+        const FORMAT_STRING_CONTINUABLE: &'static CStr;
         const FORMAT_STRING: &'static CStr;
     }
 
@@ -51,7 +52,7 @@ pub trait Level {
     /// given `prefix`, which are the kernel's `KERN_*` constants.
     ///
     /// [`_printk`]: srctree/include/linux/printk.h
-    const fn generate(prefix: &[u8; 3]) -> [u8; 10] {
+    const fn generate_continuable(prefix: &[u8; 3]) -> [u8; 10] {
         // Ensure the `KERN_*` macros are what we expect.
         assert!(prefix.len() == 3);
         assert!(prefix[0] == b'\x01');
@@ -63,12 +64,31 @@ pub trait Level {
         fmt
     }
 
+    const fn generate(prefix: &[u8; 3]) -> [u8; 11] {
+        // Ensure the `KERN_*` macros are what we expect.
+        assert!(prefix.len() == 3);
+        assert!(prefix[0] == b'\x01');
+        assert!(prefix[1] >= b'0' && prefix[1] <= b'7');
+
+        let mut fmt = *b"\0\0%s: %pA\n\0";
+        fmt[0] = prefix[0];
+        fmt[1] = prefix[1];
+        fmt
+    }
+
     // #[rustfmt::skip] // Rustfmt formats the macro awkwardly.
     macro_rules! define_level {
         ($lvl:ident) => {
             pub struct $lvl;
 
             impl Level for $lvl {
+                const FORMAT_STRING_CONTINUABLE: &'static CStr = match CStr::from_bytes_with_nul(
+                    &generate_continuable(macros::paste!(bindings::[<KERN_ $lvl>])),
+                ) {
+                    Ok(v) => v,
+                    Err(_) => unreachable!(),
+                };
+
                 const FORMAT_STRING: &'static CStr = match CStr::from_bytes_with_nul(&generate(
                     macros::paste!(bindings::[<KERN_ $lvl>]),
                 )) {
@@ -89,6 +109,26 @@ impl Level for $lvl {
     define_level!(DEBUG);
 }
 
+/// Prints a message via the kernel's [`_printk`] without newline.
+///
+/// Public but hidden since it should only be used from public macros.
+///
+/// [`_printk`]: srctree/include/linux/_printk.h
+#[doc(hidden)]
+#[cfg_attr(not(CONFIG_PRINTK), allow(unused_variables))]
+pub fn call_printk_continuable<Lvl: level::Level>(module_name: &CStr, args: fmt::Arguments<'_>) {
+    // `_printk` does not seem to fail in any path.
+    #[cfg(CONFIG_PRINTK)]
+    // SAFETY: TODO.
+    unsafe {
+        bindings::_printk(
+            Lvl::FORMAT_STRING_CONTINUABLE.as_char_ptr(),
+            module_name.as_char_ptr(),
+            core::ptr::from_ref(&args).cast::<c_void>(),
+        );
+    }
+}
+
 /// Prints a message via the kernel's [`_printk`].
 ///
 /// Public but hidden since it should only be used from public macros.
@@ -147,16 +187,48 @@ pub fn call_printk_cont(args: fmt::Arguments<'_>) {
 #[macro_export]
 #[expect(clippy::crate_in_macro_def)]
 macro_rules! print_macro (
-    ($level:ident, $($arg:tt)+) => (
-        match $crate::prelude::fmt!($($arg)+) {
+    ($level:ident, continuable, $fmt:literal $($arg:tt)*) => (
+        match $crate::prelude::fmt!($fmt $($arg)*) {
             args => {
-                $crate::print::call_printk::<$crate::print::level::$level>(
+                // Perform a check on the format string to ensure last byte is not "\n",
+                // otherwise, the continuable option is pointless.
+                const {
+                    let bytes = str::as_bytes($fmt);
+                    ::core::assert!(
+                        bytes[bytes.len() - 1] != b'\n',
+                        r#"continuable format should not terminate with "\n""#
+                    );
+                }
+
+                $crate::print::call_printk_continuable::<$crate::print::level::$level>(
                     crate::__LOG_PREFIX,
                     args,
                 );
             }
         }
     );
+
+    ($level:ident, $fmt:literal $($arg:tt)*) => (
+        match $crate::prelude::fmt!($fmt $($arg)*) {
+            args => {
+                if const {
+                    let bytes = str::as_bytes($fmt);
+                    bytes[bytes.len() - 1] == b'\n'
+                } {
+                    // Format string already have newline, don't add extra ones.
+                    $crate::print::call_printk_continuable::<$crate::print::level::$level>(
+                        crate::__LOG_PREFIX,
+                        args,
+                    );
+                } else {
+                    $crate::print::call_printk::<$crate::print::level::$level>(
+                        crate::__LOG_PREFIX,
+                        args,
+                    );
+                }
+            }
+        }
+    );
 );
 
 /// Stub for doctests
@@ -400,7 +472,7 @@ macro_rules! pr_debug (
 ///
 /// ```
 /// # use kernel::pr_cont;
-/// pr_info!("hello");
+/// pr_info!(continuable, "hello");
 /// pr_cont!(" {}\n", "there");
 /// ```
 #[macro_export]
diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
index 682207c81fc2..b42a9e6c9d72 100644
--- a/samples/rust/rust_print_main.rs
+++ b/samples/rust/rust_print_main.rs
@@ -70,7 +70,7 @@ fn init(_module: &'static ThisModule) -> Result<Self> {
         pr_notice!("Notice message (level 5) without args\n");
         pr_info!("Info message (level 6) without args\n");
 
-        pr_info!("A line that");
+        pr_info!(continuable, "A line that");
         pr_cont!(" is continued");
         pr_cont!(" without args\n");
 
@@ -82,7 +82,7 @@ fn init(_module: &'static ThisModule) -> Result<Self> {
         pr_notice!("{} message (level {}) with args\n", "Notice", 5);
         pr_info!("{} message (level {}) with args\n", "Info", 6);
 
-        pr_info!("A {} that", "line");
+        pr_info!(continuable, "A {} that", "line");
         pr_cont!(" is {}", "continued");
         pr_cont!(" with {}\n", "args");
 

-- 
2.54.0

