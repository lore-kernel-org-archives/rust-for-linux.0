Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021122.outbound.protection.outlook.com [52.101.100.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DEC3033EC;
	Tue, 11 Aug 2026 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456583; cv=fail; b=o+k31wNbzB9ljBHU2SylKBEtu40Oy59UrR78uaF7bA+0SzF7wAHekCjz9ZYmfBo75YmoXrmqbc52ThgsbDxsAu5AtyK4InOd3yYrVtgnqP55w1wOTRwJISeJhg8iamF+JebaHPPdaStUTET6yjQXAFIu8lAEBBqjoRjpQ0R11XQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456583; c=relaxed/simple;
	bh=m6Y5y1d9XGVT7JGWsY3ZF59iUeWfw9CgHSHw+cp0T5k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DJm0pDyedqML3/GkIrOy1bbNUI2kiCk84ocOUpj7JHI4xFXAIipsHJ8X4X733h60TOBJHwdUzpL6/PWDX4ew4UPo0RQllt30aMJhCFW4lA4u4HT8EOLz9ENLivrUF2hZ8j0MNWj6wlB/LNiHzJuHVgsFbttcmmADbuF8b8svcC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=0Z2RlSCK; arc=fail smtp.client-ip=52.101.100.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="0Z2RlSCK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Avo/8pFRDCb0L/tIAsGIcLixmEajQF8ypI4q6xBUPC/f1r4mNAMGGgN0GIx0aPm4uDP4umr9GXBfsAd7+usVts6TKWrVF1VJfOOwg9NpziyoySMNxFmnhyVVn8dlhc+2hCjj/6usvo2D6k1CPMzvCj46z7POe5wW0t9GGGCJVmPOmyQM5WviSC9yKBg6GJmaGN8oYI0NHp/ZIwhCotQl41H2tOffTG6HQSToMjmoxHP6c5abGsIYUXmmfYQRqL32qHRsQyrK9Xod/Methw+s4+rMn4zBknGIuGrIMERFh098xCmUcg9GImvuTUCdhQUFiavSgWEtzRhdcUzNjtGHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IkZEkxXIwSU8wkqv8dbcaoX2AaFkukcAItPc6S2Sgc=;
 b=n6w2hEI+PYnGT0GLvCTXosNCaF7rdT3zmCCxDZe7nICeaTVP8wzK7weDtO2oqGgki8d9aEbEt+RjotKwn7WRaiEWkG9uKVA3GGCWyhdVenp4mE6jNiYFsIs8sCOn/aNGylGzCrK/UIF2a2/rMPWYjRCoqSARG38FPO6fFf9wAH6wnQ4JA0j52gG3MnYcrgauf3CtyAD+vRjU7PAKmEGiNY/DTYF8g+D3MmaeMnhbyyxAqZeKg81mQW5+MpqD7HKHvijsyTDsMHNDutfJTmKwIykbLV0R6uZS5nRWY4tOWlMEznH0DrLZZkpe2C96GYKvZWzd8+85TKyGV/NSNgFjYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IkZEkxXIwSU8wkqv8dbcaoX2AaFkukcAItPc6S2Sgc=;
 b=0Z2RlSCKyJj1QmBov43H9pfV0D4ZzgeTdkXp30/y2Q/zfEmulBBxws63KHRH3QMDNQlIGSaOTylLe0dP1v9gc88KYxPhKG/P5H0FPIckOXaHkh0IUXaxbfn1tz/SbuKwQZ6Tz8nAbKJue36AMAg+XCyM3uNlU9HlAqSg7NM8poE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB8765.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 13:56:01 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:56:01 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 11 Aug 2026 14:55:56 +0100
Subject: [PATCH 2/3] rust: macros: vtable: add `#[optional]` attribute
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-vtable_macro-v1-2-50c5aab3c211@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786456560; l=5853;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=m6Y5y1d9XGVT7JGWsY3ZF59iUeWfw9CgHSHw+cp0T5k=;
 b=XstED1Gui4XbdueGOKM1euHWW3rJOe9pmXZCAFZFATHjNGvt0NPgsVfPRHR+7puq4356nAYMp
 4//AojIsFdKBTPwDz3ls7ILGWzDC1CGiFHZ2BZuolvbzQJF2MIgu/5g
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
X-MS-Office365-Filtering-Correlation-Id: 724b6046-8466-47a8-8bbb-08def7b0476c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|10070799003|18002099003|22082099003|921020|10067099003|56012099006|5023799004|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	i5mXyaCOSJR5tUF2b6SjQKGiNZ9dsnmFM08hDqwqW+QSuhM5V5cSbmf+rlFEz8dmQJZoFQYKkIxpFLw39xetiP18IgnsIY+gVcnVv7VC/ZFaga0hpKEYb4eEZqQhGj5DaI7HfEq0Kn8JpkMtCtDXYMsQy/YTD4PKZuULamisirRnis+yyl2LrSv7611OQpuLGp6BkxQnNVkakzwAFk9S02lOM2pRKn2Dqhj+YKVctNx3LlwtCFL846VHgJAq5+DeWXGnl7s1HC129Wc2BBcvqBMDnkE8UO2ZqOmT9CyQmFGGxRFUepDJ0CzpYqLO+Dq9j37P5/fXfZ518ztuHqL1InzMbIxnPzINCDuCpygnzAi2ZmLCsgnDB22SD48LlubVXLPR+n0jU/7ktvjMUtRlf4naZ3QVL/JcBMam5JAbix4N1zjfB2BOSUhfAFvhwAl/VLdghbATS202tjYhKUlRG7ogfUqk+UGulbmD+carF0FhnktKtsAQePxRCA5HK9PgFkrneoCGhtdSPJreTL67vljC1de1P7UtMZedjcMU2n18NL4cCzQIEoeWBYqXHkWj+cKvsG963F5Tx+LODQ5djPkCxF6+sRGP9QoSToCj2HW9+u/AFPv/ZLw8ErQmKajVzG+aGBKEpbXqEv5jUlVScNhebVDdMY1XIKYgzkwAJR0HF7izFBy1cnYlkgYcsXikggLF++eCCJmibe6dcoSp6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(10070799003)(18002099003)(22082099003)(921020)(10067099003)(56012099006)(5023799004)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1pWRU1rK09pRllCalRLeUYzV0srVFVQb2FDN0p6a01TN3NJRUpXT1IrOHFj?=
 =?utf-8?B?S0tySFFQTlRxMDJrQjlaOE5NOWkxWHFxNVplQ1NYcjdrQ2RIS1dvQWVDdEVQ?=
 =?utf-8?B?SXd2STZ5T2xza01NUnlGWE8xb1ZrR1V3NjZWYkF3V0JyUG9Hci9SS3FPQUIz?=
 =?utf-8?B?SW45UnFPaXFjRnRVVk5qZUt5UFg0ZnoxOWtYcUN4K3oyS0pvM3RXam5PQStQ?=
 =?utf-8?B?T0pKczFMK0Z2NlFYN3hqYVFJNnRONi9sMFErdVFDV2x2RWwwNkZaeFhFVDBl?=
 =?utf-8?B?MS9pV2lTTmRzb2l4SGtGaXZxcVJvb3RBenhHNUtjQnRNdXI4ejVRZWFnR3Ar?=
 =?utf-8?B?U3VvNkRzRHI5bVZqbEVsQXlnaDdPMFNNV0hqQXdsSXl4RkthVmpUUStJVUly?=
 =?utf-8?B?ZVJIMS9SbEVuV1hyZldBZ0tIUU1VUmVKWFYrdTF0WVZ3eVdDK2xESUpqS3dP?=
 =?utf-8?B?Q3pzMXhBa3RVMmlYNy9RblNjYzcwaUtkT2VWSTkxVllaUGFLTFI2TVVkMG1Y?=
 =?utf-8?B?MkVYa1crYlE4ZDJLWXVydXVPeHZxY2h2ZUw5amR1RzBhNUpiZU9uNm1iWTZt?=
 =?utf-8?B?MFVOcVBXZVk0K3EwM2N1ZURHYUpXSUhaRExWWW5UdXdDNXdJaUpTZEpyOGtM?=
 =?utf-8?B?K0FFS29NT3NZTU5RUkxPT09aNTJHQkpzNmZQQzRxbmlpcGpyMHZpeEVPc05u?=
 =?utf-8?B?NFVFcVUyYkhmRWZ0NVhPTVFhSDViT3ZrYVUwUzN3Wk5lZVZHdkVsdGF1bk45?=
 =?utf-8?B?aUhKK1VxdnJieENyT203MEFBY1YxV2cxRHZjL1JKNXRKVEVWT1BQQlBoTFVw?=
 =?utf-8?B?K2Rwb2puOWVmNFhuQmVFQzNOY2xHTFpFMnp6MFF2MUxwYTZLbHgvRFh0cGli?=
 =?utf-8?B?OURFYnNGRWZaYW1OemZLUTR4NTZNVXZ4WFIxL1A4eE4weTV3QTdnTFVXT1Yv?=
 =?utf-8?B?d1pEZFNOQUlwY0pwcjBzOFY2Mkl6bUk3Q0R0MVFLYkZuZzExdEh3elhBT0J0?=
 =?utf-8?B?Y09RWVhGVWpKVHRWbUVsK2U2Tk1LVmhGOHVFcXRCRWh4bkJaM3FtakJJRVhZ?=
 =?utf-8?B?MWdMQlVTSjByZ3Jib1RmYVQwdGZEdGlWd0xPcmlja0pla3Joc3V1Y1U1QWhK?=
 =?utf-8?B?bTM4Rzh5Ri9mWlM0c2ZtR2s1OWRmRDJabUFxbEM3Wk1GUkR4TE5jeGFncTEw?=
 =?utf-8?B?RlI1Z0tRNDZ3L3NjSTZRNFI5NDJFRVJCVzBLWm01RzRtLzNMaXpvQ2ZaRkJm?=
 =?utf-8?B?Z1I1c3NNak03aWlMVEtRNFQ0RGZCZ0VOVWR3MklRd29ua1FHL29kYW9POXBs?=
 =?utf-8?B?NTJPd0x0M1lsQTh6eVpseWVhVXBoU2pZYmhUcFo1THVNQTNGVWsvdGh2Q1BB?=
 =?utf-8?B?Um05Witrbkl5R2dSbFk2ZFJpWjdJVEZMMkY3TXJKcTJZRlV5SEIxSnA4Y0ZT?=
 =?utf-8?B?czB3Y3hPYnNoRk4xdFkvZ1RxT1JPalRWaUI0L0t2dGNGMmdFZ3RlUnVNMnJy?=
 =?utf-8?B?RmxEWGYvVHV0UDcyL2xKVGEvdkcwbjVmU0lFeWpNdjRSYnlIdnF3dVU5RE5T?=
 =?utf-8?B?dHhiQ0d3MTZQazA5SHR6emdEcHE2M0IyeXAvUDVJWXRIdDhKVHRCRFFuVEcy?=
 =?utf-8?B?TkJ5NVZOV1VjWkdqb2tibWNWMUM0K09RbjEwVFBUTjBKcHJpbmR4RkxDVStw?=
 =?utf-8?B?R0JXWlNjTFJlR01hSXVXSGhsSXVqeTdoOGNxRE0yTGR2TUgwb3lxM094c1Ir?=
 =?utf-8?B?aloxempYRUc3UVpCSEVjZnZoeHhqRmc3Qld4amtxZU1BOTJNNTRvMFJ2WXRF?=
 =?utf-8?B?M1RPS1d1RzJUZU82aDhFTFhYU3FPWGZYUnlwbjczdWxyNVZQOXIzbm11RVRx?=
 =?utf-8?B?RkJJd1hXT282N2w0dUxpTjlUd255Yzg1bU5HclozTlI1Y2NDMjRQS2NQbUds?=
 =?utf-8?B?SFFzeXhUcUZZODludk91ckoyUEhjVWhUSFQ4QU1mOUxMRUc0cThRZGRqdzlS?=
 =?utf-8?B?dG9zUXltZDN1R3JQQkJGY05iNFhyY3lyWC8rKzgvN0ZhWk1QK21XdlZhUGx3?=
 =?utf-8?B?NjRUbmdZby9ycE0xc0k3VnVFam9qZldkS0ZJRFRieEZjblBUMGpFNTdad0lB?=
 =?utf-8?B?NUNaMDUycHgrYmkzTDhicFhtUVNoSEZnYzIyUmxGWTk5WEZlbCtoWjZuVUpS?=
 =?utf-8?B?S1RNN1VKbVVDZkdOb0JUMW5CU2p0aWpNUkRLQi9hQjE5YThpV05lVXNkZ1Nt?=
 =?utf-8?B?ai9oWVI0d0dCdnA0UDBOWXFIUTFWVGowZG1aQXpYT3AxYm15NGxKVmM0QzJz?=
 =?utf-8?B?cGdCbTQwbWhQQzBSMjhodkY2bDhWU1BuUS9RaWFxWFMzMmczTzNuUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 724b6046-8466-47a8-8bbb-08def7b0476c
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:56:01.8621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mz0Iexy0be1ieAlU7FaKRFBOnpjogvlXm0hHsEsS7pxV9txO/xIqC10GE6GY8wO2qcioRY+/OM0/JKIu+qQ0EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8765

For most users of the `#[vtable]` macro, the optional methods do not have a
Rust-side default implementation; a `NULL` pointer is inserted to the
vtable and the C subsystem does thing differently when it sees `NULL`.

Streamline this use case by providing a `#[optional]` attribute that does
what the `build_error!(VTABLE_DEFAULT_ERROR)` boilerplate does.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/macros/lib.rs    | 39 +++++++++++----------------------------
 rust/macros/vtable.rs | 26 +++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 0514fc7c0a55..de55dee4d866 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -156,44 +156,29 @@ pub fn module(input: TokenStream) -> TokenStream {
 /// associated constant bool for each method in the trait that is set to true if
 /// the implementer has overridden the associated method.
 ///
-/// For a trait method to be optional, it must have a default implementation.
-/// This is also the case for traits annotated with `#[vtable]`, but in this
-/// case the default implementation will never be executed. The reason for this
-/// is that the functions will be called through function pointers installed in
-/// C side vtables. When an optional method is not implemented on a `#[vtable]`
-/// trait, a `NULL` entry is installed in the vtable. Thus the default
-/// implementation is never called. Since these traits are not designed to be
-/// used on the Rust side, it should not be possible to call the default
-/// implementation. This is done to ensure that we call the vtable methods
-/// through the C vtable, and not through the Rust vtable. Therefore, the
-/// default implementation should call `build_error!`, which prevents
-/// calls to this function at compile time:
-///
-/// ```compile_fail
-/// # // Intentionally missing `use`s to simplify `rusttest`.
-/// build_error!(VTABLE_DEFAULT_ERROR)
-/// ```
-///
-/// Note that you might need to import [`kernel::error::VTABLE_DEFAULT_ERROR`].
+/// For a trait method to be optional for normal traits, it must have a default implementation.
+/// However, for many users of `#[vtable]`, the functions will be called through function pointers
+/// installed in C side vtables. When an optional method is not implemented on a `#[vtable]` trait,
+/// a `NULL` entry is installed in the vtable; thus the default implementation is never called. If
+/// this is the case, `#[optional]` can be applied on the optional method. Methods annotated as such
+/// do not need to be implemented nor need a default implementation. Calling these methods on types
+/// that do not implement them will fail to build using the `build_error!` mechanism.
 ///
 /// This macro should not be used when all functions are required.
 ///
 /// # Examples
 ///
 /// ```
-/// use kernel::error::VTABLE_DEFAULT_ERROR;
 /// use kernel::prelude::*;
 ///
 /// // Declares a `#[vtable]` trait
 /// #[vtable]
 /// pub trait Operations: Send + Sync + Sized {
-///     fn foo(&self) -> Result<()> {
-///         build_error!(VTABLE_DEFAULT_ERROR)
-///     }
+///     #[optional]
+///     fn foo(&self) -> Result<()>;
 ///
-///     fn bar(&self) -> Result<()> {
-///         build_error!(VTABLE_DEFAULT_ERROR)
-///     }
+///     #[optional]
+///     fn bar(&self) -> Result<()>;
 /// }
 ///
 /// struct Foo;
@@ -210,8 +195,6 @@ pub fn module(input: TokenStream) -> TokenStream {
 /// assert_eq!(<Foo as Operations>::HAS_FOO, true);
 /// assert_eq!(<Foo as Operations>::HAS_BAR, false);
 /// ```
-///
-/// [`kernel::error::VTABLE_DEFAULT_ERROR`]: ../kernel/error/constant.VTABLE_DEFAULT_ERROR.html
 #[proc_macro_attribute]
 pub fn vtable(attr: TokenStream, input: TokenStream) -> TokenStream {
     parse_macro_input!(attr as syn::parse::Nothing);
diff --git a/rust/macros/vtable.rs b/rust/macros/vtable.rs
index e28976a5919f..54bd32e82a9c 100644
--- a/rust/macros/vtable.rs
+++ b/rust/macros/vtable.rs
@@ -33,7 +33,7 @@ fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
          const USE_VTABLE_ATTR: ();
     });
 
-    for item in &item.items {
+    for item in &mut item.items {
         if let TraitItem::Fn(fn_item) = item {
             let name = &fn_item.sig.ident;
             let gen_const_name = Ident::new(
@@ -41,6 +41,30 @@ fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
                 name.span(),
             );
 
+            if fn_item
+                .attrs
+                .extract_if(.., |attr| attr.path().is_ident("optional"))
+                .count()
+                != 0
+            {
+                if let Some(default) = &fn_item.default {
+                    Err(Error::new_spanned(
+                        default,
+                        "`#[optional]` methods must not have default implementation",
+                    ))?;
+                }
+
+                // Optional methods in Rust need a default implementation. Inject one that fails
+                // the build in compile-time if not overridden.
+                fn_item.default = Some(parse_quote!({
+                    ::kernel::build_assert::build_error!(
+                        "This function must not be called, see the #[vtable] documentation."
+                    );
+                }));
+                // Ensure that the function is never code generated unless used.
+                fn_item.attrs.push(parse_quote!(#[inline]));
+            }
+
             // We don't know on the implementation-site whether a method is required or provided
             // so we have to generate a const for all methods.
             // However, hide it for required methods as it will always be true.

-- 
2.54.0

