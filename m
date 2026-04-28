Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020087.outbound.protection.outlook.com [52.101.196.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8563B19C0;
	Tue, 28 Apr 2026 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381876; cv=fail; b=pcqv4hiEDiIUjEcaYal4GIzHrgRV4qJ0CWSq1LNOg7C1ZddOq8Xaqz+wHJcHVJto+DMUieLVEHTokDsGPnn/KPKZuf/bImesdv4Q9QeGuhFgvFAUihSo/x16gs22xfLaelwWU5PRpoJxmPL628Ecl33USFVpli8VlktSpZqbEeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381876; c=relaxed/simple;
	bh=Kf/N0paQ7XX909ZjgmpHr0Tfx6ffyg8Ro0lY9itfpLc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LYd/n4L99fyT7//hOrOpAz9FKAs7pAdKvkLnhkY2MX9EMxBfuzMKYd0MrOa6wu2DOXN2/zAZ5bRooEKCPZl44E8tVPMyCGjAglbjM0D7PzzYpoG833htV6YbFK1bCH3UC0U/kv/fgkWujm0HwHJ04Vs7jhN2p8BHBPJU3IbV89w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=bVy/t/QT; arc=fail smtp.client-ip=52.101.196.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="bVy/t/QT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVYu0K9qF5iXjPJbssuoFgSMQ4yKxByHzT7C9EsjQQzdxdYIiruPNctPhKAu8y8fDZV/C2U1PAuDr8XhMXaAZSISSOlkqLzR0RnIYMuvPEHD8fSrrmmNVgO9OqpXMP/c2CbT4+LRCxsghGA0KP1C+oeHwFmRvIDb4EnIxkQHdfHoc53u8s7FzF+Cs8bdxjjDbtQGG/qdQlUWvfGxAYCAzG3rQRSLUVJrYgGr63wb3SrPYN/DqQtkeCVJgIk2VLAKNrpElKiRSlstOb4kKCpYNAof8yEqBgEUqVroC7qPmoZMuT7svrxf5MgLOC38+AlWW87EEVqHOHancKxGJlxfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/Nro99t7JF4FNkaBvGYRrBubLNU8/NFEUvBvMc7N3o=;
 b=DSXIv6w97TZogjd9YVDZeBOESl564TZTVYSI1Luna3pavAi7gC76F/FhLpcLViayY9kRpmvwlRvnvp1Lo7z3JBZv/5sj8dxJ+aMsK2JQ5IeL+ei3VQb0oQfe7wBZDjw6nHpTplqXixspZrQuUdM8g8VpQxHVVA5Q61Zn3yqXtHbMJv8jH/IJd12FjQ/YJyC3O5DzccPymcK7M04C84cLX673vkVLjaisgzHLJR1J1OBGtNTWY21gBv2jNhZAizqXX2yySfnv4/JxXc7qirqlT+qdxt7mNu/vj9LlbxYB8Qt7K5gRoIh2rnfU+Q7oi1pWQgFmnP/OrUs3uPVAmj9sSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/Nro99t7JF4FNkaBvGYRrBubLNU8/NFEUvBvMc7N3o=;
 b=bVy/t/QTcoEyb6vgnP+CgBl2PuTHXRp8nZdzy1UIjAwL/djPs1KCawUsiZRgxY9HppKg7VeSv6OrV35XTtq9laBn3FdOTevz/r+wybsQacyGzwvIcp3I/XC/GtyHRy/Yzlfsi6RoGdEQ+gBQoen7iSTO5t58PuQOzsW0EY5mK38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5969.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:11:11 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:11:11 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Apr 2026 14:10:53 +0100
Subject: [PATCH 04/10] rust: pin-init: extend `impl_zeroable_option` macro
 to handle generics
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-pin-init-sync-v1-4-07f9bd3859fb@garyguo.net>
References: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
In-Reply-To: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mohamad Alsadhan <mo@sdhn.cc>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777381869; l=3545;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=mtIRdXbj+B4CsCp7xZxjzcpmKUlJ0VKLK/u5aWLR7DI=;
 b=zx7detLcz9Sq2fZoNuz6nJ9Dx/j3ofakZhxzJZAr+2Muvi1s1oF1BeHXqTuX9ady2MVHOAI1c
 6rMn9kuyzdJDFtnCamBCah7Hp/0MtI996ey+EV5kryu9UzYvdcjTLGJ
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: a9071ba0-7e10-468a-7a65-08dea5279e70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DzQfKItskhLqkQVtDlbwb6aCP7UXuYdYHGBTQz7ywlG7Vnf6E8JNTu3NLba4CGkKe/sz8bkSud7G1QzRxSuiYt6UktIF6cIr0XOl2Hx3TyZVzV6mjHuMyNtDwTxokalb+cRW3cgKFdmFP76To+Cl/msmOAADiprLimTGsusKQCuezJQy0MYRjDnunLH1jfXGw4fzGHmwLmSGl5Uj2f9BwJymAeC63VcqldsNIaMwT91UEukGTS9xj25ZpQ/KBBWawvzB3Rhaee8K0RLOY/gedYx/XEchBSHDbLFWoFV/gVJfy/lzXIzxcvfPbnBfdutbqMff6Uzg2I8b7ef9ftzWu2iE5dQrac04iBooCNl0GJzkIrn1ZzhX2TyEtWE9VyqYMntgol8KRxSCXzeuKzP2HW9nKs2pSQAn3Ennebfswc+AONMd3wqvggP0wLupFn8VqX4Y2NyWuh804qPkKSBnaG0qpnUimVOPz7qyFzlWhzFf+cFVUiKnxAjG6RpYT3ETnRmW8IJDLwUCry72n9K/xwSeKJ1xyuMDVQEI8ATlU8OWk1a9kOMSRGe7xKDR+7bsAlDbTlkHPO52sk9+praL/5Rqx1MvrdEsSAQGuyDN1Elts2RrCPpWyw/Kz4uIqdAwmNlm7zOEzkihURGhArnTAdqeKdLK2SYXRqMqMBb+af1OKQgjhUc0O+9aTczgFy/4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFRkYkU2bG5DNHVZdTBRRlI4TXBNZVFMY2p1TTNkMjVzZ3NTdy9TYklSUXd1?=
 =?utf-8?B?SDNVOGxsck5NM0hlU3pZL2VsaUVRaDZPSHh1T0hwdUpPQmY0WWEzRTg4NWJV?=
 =?utf-8?B?c3FGRjB6SGEvdXJUbG16Mlc4VTNrdnZDd0plZCtoNjdza0VrY0VBa21XWkJS?=
 =?utf-8?B?OU5nUEFzODh0WlVPUWZjVksybDJYWE1UVmlxRndMa3VWeXNYUjNQaEw5ZnRw?=
 =?utf-8?B?RVZiT0FKMGh0eUhFbFlBZlJVdENMT0RFbnBWNFEwZVBGSVljKzR3U3REelgx?=
 =?utf-8?B?RXI5Y0dSS1dSdkxieWxpRnpFMzdFaTBYQjBxRnpjRDJnOEdzcUsvU1RIT290?=
 =?utf-8?B?NjErYlo0MTJGVm00c1BvUkJab3dmcXh3SUozdUgrNkwvWjE5VmJDZlJHaHAw?=
 =?utf-8?B?V1BneTNqTDJCMENPVEhyMmhZUmZMOGlDM093Nmtvek1tbEJmZ0ZFdUR0bnN3?=
 =?utf-8?B?Y1JrNWJ0bWlHUVZzUE5CbDNuUEpjd1g4TGJrTnhwa2VKTDU4Z2RCSHhEUTNH?=
 =?utf-8?B?ZXNWQkVMQnJvVW1scWRQSFlDK29DTGxyMVJGYi9QUnc4L1VaRVBZdW5xOUhz?=
 =?utf-8?B?cldUNnpFMEhKN2JQNndlVmxCNGp0ZzMrQ3l5dnVuNldnVmRuUlJqQWZUSHNl?=
 =?utf-8?B?ZUpmQUNZaGdKdlNZL0VVMWJkRldJU1JCaHNWMDREVEJ1M09ZU2VnaDNOeTdL?=
 =?utf-8?B?OVJpdXcwQS96SENYenhLVEVFRTFVa1BDZXBGeThxd3Z6S0RPUngyNEtxcmdP?=
 =?utf-8?B?eHNGa2RTcFhjekdqNk1McFRyUGtYUzVqd2FUZlR6M29SYVBuVzRSZm82ZVll?=
 =?utf-8?B?U05IWXhnbENyZlFtTVdBWDQ2R2JmS0xCd0FPVFRFb2s2RFduUy9PM1dHZmg1?=
 =?utf-8?B?Sk16MmJQazF5ODIrSEpHUExINjZrTHZaTU9zR0dFd3A3cFdRVml5V0dCRnQw?=
 =?utf-8?B?RCswMENUbjNpUitocjRFakhCcXMrbEM5ZU8zaGNLeVQwa1FZOUVFSjVKYmEz?=
 =?utf-8?B?cFZUZzZNM3dHMUFVVTVoTkVRMGpNK0pWMmx6QmEyb3dOcUlsRjdwdWVDWEZa?=
 =?utf-8?B?WE9mN1FWMTFlOGRnUEpnOVA4Z0FCajlJZUdhNlcrUXlXM2c5cjJlOUhIMFNo?=
 =?utf-8?B?Mzg5amd1ZW1XK0F2dktsZC9Ub3cveEdVZlowMEMzWXBvcUZtbnpFYTRWWjVj?=
 =?utf-8?B?dXRMMDJjd1FpTkNzZjJ5emhUSzk3TlIxS2xtQ0FzSkRnMWVoMzYwVFpNejd6?=
 =?utf-8?B?aVRxOWZXc0I0d1JsZ2V0TmJPUzJkWFRiRDlMOUJqczY5MFhnOFE3bjNOZ2cr?=
 =?utf-8?B?c29DTFJyT3g3WDA2d3h4NTRaSzQvNFgvRGdBb1kydTlEbEVGQmNnTytVYVFV?=
 =?utf-8?B?WjFNa2JaK0pObDNCbDd4T2FRODIwUTVoNG9haE5tV25DbWRlRDFNYWZxeHRN?=
 =?utf-8?B?cXBYNkJlK0hEREVVVWpYdi9RdmM3czByQ0VBeVhLbmt5YWp0YlU2aGppeVpl?=
 =?utf-8?B?K25LZWR6ejMwOGl3TU14L0o1eTEvSXdLdGthTTZNMWdlV0w0eVNHOXBIM1M3?=
 =?utf-8?B?NmY5cTdLNHVKNTJZNmJCRHNxM21PcGJCcmpxaTN2YlhMbHVjN3NyVTd6KzNO?=
 =?utf-8?B?RUpQTUViZnpjbHN1ZGt4Q1BPSEV1WVFpMmp2b2kvT0hLNEI3QkQ5V2xETGFL?=
 =?utf-8?B?N0lhd2Zla3ZVNlVoOXBiS0lPOVd6S0ZsZ1F1NVJhZXJMSVVtbU1rNVp1cHJL?=
 =?utf-8?B?RDd2S3gwTm5POW82MTRxbDRBRXY1WjRXT29SZEE5RWROV2oybytzamFDZkdJ?=
 =?utf-8?B?VkszU0wzbHlRSVQySDNHSWd1OU5pSHlnQS9RenJuTDVuVndZYjFQNUVYSUF6?=
 =?utf-8?B?eHFJYWFzdlBmbmdVU1pjUXA4UWFTR0FNakRtemErK2hMcmNoT1pLeEc2aWlZ?=
 =?utf-8?B?c3JtT1ozTHZYSkp6VmhhcGYzajE4QTdhSlpBVHdraTJTV0k5TUMxVm0xNXRw?=
 =?utf-8?B?VWJ0L2Y3U1FUZmtEVjhvWDREY0NSVDc2ckpnWlBmd3hQWWJLYUpvZ1hUOUU4?=
 =?utf-8?B?MWdLR2k5cGhodmpsVVNSb05zQWRVbXh4ZDdhNGtDTUtycjJqNng5WFVSNEh1?=
 =?utf-8?B?LzRlb0EwM0E0MjB5S2kwWUQySGdUK2V4MXRFQXlVdEFGUHUwZkZQU1gxSXF3?=
 =?utf-8?B?NE9lTVlpc2dETFpWMWNFV3Q3bjc3ZHc3Zk0zdlhxenBFc3NnNkVSZGNpTkwr?=
 =?utf-8?B?WUN0aW40L0V1Z3gyRC82SkFESmZWYzBKcVdmdklOTFlaQW1rL0JOaHVVcHJt?=
 =?utf-8?B?VUtJRTF4THRBRzlncTNkbkRBemc5YUhaVUgyWXY0b0lzeW11alRxQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a9071ba0-7e10-468a-7a65-08dea5279e70
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:11:11.4265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TK+1uAz8nJ4+Y4uspIspIprZAk1A2gdVWK6BVwdyAQtbF5Ar4kb2XMJwJ7/opShcz7cwdNIbWthjzVQ6HPiMSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5969

From: Mohamad Alsadhan <mo@sdhn.cc>

Improve impl_zeroable_option macro to handle generic impls for types
like `&T`, `&mut T`, `NonNull<T>`, and others (for which `Option<T>`
is guaranteed to be zeroable) with similar approach to
`impl_zeroable`.

Also, update old declarations to use generics e.g. `NonZeroU8` to
`NonZero<u8>`.

Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/src/lib.rs | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index e34c9bdb88c3..9b76cf5597c6 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1633,16 +1633,6 @@ pub unsafe trait ZeroableOption {}
 // SAFETY: by the safety requirement of `ZeroableOption`, this is valid.
 unsafe impl<T: ZeroableOption> Zeroable for Option<T> {}
 
-// SAFETY: `Option<&T>` is part of the option layout optimization guarantee:
-// <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
-unsafe impl<T> ZeroableOption for &T {}
-// SAFETY: `Option<&mut T>` is part of the option layout optimization guarantee:
-// <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
-unsafe impl<T> ZeroableOption for &mut T {}
-// SAFETY: `Option<NonNull<T>>` is part of the option layout optimization guarantee:
-// <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
-unsafe impl<T> ZeroableOption for NonNull<T> {}
-
 macro_rules! impl_fn_zeroable_option {
     ([$($abi:literal),* $(,)?] $args:tt) => {
         $(impl_fn_zeroable_option!({extern $abi} $args);)*
@@ -1669,17 +1659,26 @@ unsafe impl<$ret, $($rest),*> ZeroableOption for $($prefix)* fn($($rest),*) -> $
 impl_fn_zeroable_option!(["Rust", "C"] { A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U });
 
 macro_rules! impl_zeroable_option {
-    ($($int:ty),* $(,)?) => {
-        // SAFETY: Safety comment written in the macro invocation.
-        $(unsafe impl ZeroableOption for $int {})*
+    ($($({$($generics:tt)*})? $t:ty, )*) => {
+        // SAFETY: Safety comments written in the macro invocation.
+        $(unsafe impl$($($generics)*)? ZeroableOption for $t {})*
     };
 }
 
 impl_zeroable_option! {
+    // SAFETY: `Option<&T>` is part of the option layout optimization guarantee:
+    // <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
+    {<T: ?Sized>} &T,
+    // SAFETY: `Option<&mut T>` is part of the option layout optimization guarantee:
+    // <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
+    {<T: ?Sized>} &mut T,
+    // SAFETY: `Option<NonNull<T>>` is part of the option layout optimization guarantee:
+    // <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
+    {<T: ?Sized>} NonNull<T>,
     // SAFETY: All zeros is equivalent to `None` (option layout optimization guarantee:
     // <https://doc.rust-lang.org/stable/std/option/index.html#representation>).
-    NonZeroU8, NonZeroU16, NonZeroU32, NonZeroU64, NonZeroU128, NonZeroUsize,
-    NonZeroI8, NonZeroI16, NonZeroI32, NonZeroI64, NonZeroI128, NonZeroIsize,
+    NonZero<u8>, NonZero<u16>, NonZero<u32>, NonZero<u64>, NonZero<u128>, NonZero<usize>,
+    NonZero<i8>, NonZero<i16>, NonZero<i32>, NonZero<i64>, NonZero<i128>, NonZero<isize>,
 }
 
 /// This trait allows creating an instance of `Self` which contains exactly one

-- 
2.51.2

