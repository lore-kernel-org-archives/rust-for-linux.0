Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021097.outbound.protection.outlook.com [52.101.95.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E207D49DB99;
	Tue,  6 Oct 2026 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300610; cv=fail; b=ObywRY0eVbGLj7nX70kuNe5PPnwOXmCQCb7slN8qclIdBPup4pWbuOBU6ty8lwbZ4MDxkhJcbrxdIBe5Hnlw1O7Qktgw7+aoCLdvhHT/MoVcab4RSePOpmmGTQmwcQEitJO28K4cSRbYCK989UFtl/HuF3TC75A3FKhc97iP+U8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300610; c=relaxed/simple;
	bh=NrsINGBe8q/2d7sEPXqFEU3dDXCwHHUmEQHS1rGxLkk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VgMWZVPvfTSiyEoZtTUGunZ0opr5KoqZidJfc3q/UEQ0sSLdL0DU05+haLDok0nOKaQAqV9i2NP8JYuMq4kj+0s/BkxFZQdaOFJiSv/vPABQW7ANd264GIJSleL8A4UCoK3KVySN7WHdZRlecU+qSKhk0qCrnI/gAULmUVWtM1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fLACjsba; arc=fail smtp.client-ip=52.101.95.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fLACjsba"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCP1od2YgUjpgN2fd8/y7vui1X9JFaATfgqKwmJa8009UGd2G5dyidkv+x677dHJaYlJHCFRZeTcr9xQe21IdjKRmtxJhjSOGhC3pV0pVM9zFVyIjKGBXOJSwHvWmJkSDI5Mi1sO9ztX01P2hekvMmtuSBOfCz/Jm2oPk11yoS6iQykVy9fADFbFUVv4SMilKDAHKl7D8cBem5tCT9oxPl8TpF4K8kRRwlWuJf65ZSQ5eaObOxvHt35EBDQDTIP79hoHSq3L/783LIlJAyJGdUid795EkymEmPzLyNkXyTaV+hIeeBDWnl0RuM02Srq+nCN1qSWwX0/B32lvtz+Qpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHBd8eRK2fdUvC8dfhdj/MI5MNZuMPPcD/sNJR8uVzk=;
 b=mYHh6cbWuu4kLja21gb5nb422sIw9XbLnz4j3GIZwbpfLD2Y/bIb/OV+TCM+/IwRxTJEbmMpOqMfHbx/Ld7BqTo9Os2yeohreGg75Ccc4SZlQGg62LzQbdNl9ntj/oG6KL6WJr2Abp+gelo78a8BTQHfWiw2jO/UfPhkXFzyYP1ddsNx2MBO3HY000HeqAS9SPdlqLPABPFW9UtnXt5x8xj+N2pI3B10ZmFfUjY8uY13nLBFe1gy0UeORTuQA5P9vC2uGvBJJxG7w2qTq0d6i6BJXr5xefUST9UU5h9EXAFZsCLFtfp5ixXsmfNWkM79+Bd+bwQg1gxFCYtSabXghA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHBd8eRK2fdUvC8dfhdj/MI5MNZuMPPcD/sNJR8uVzk=;
 b=fLACjsbah3enl+EUJs0SEFqiYCtNMe07EYXzI3IyWZlt4cyTbEquknQOiMtMH9tXssxXfEUD88DHMT09UnxU9PmGiLQDvo1u+zULRYR87d2oTdzzzjEOqK1FXHZuSbgtRLXXJUQpsqC5J8M9nVIMRtCny4U21jkItDSUDeevMlY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB1817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Tue, 6 Oct
 2026 15:29:56 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 15:29:56 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 06 Oct 2026 17:29:35 +0200
Subject: [PATCH 5/8] rust: pin-init: internal: pin_data: move projection
 struct into `const _: ()` block
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-dev-selfref-dep-v1-5-da716f740d6d@garyguo.net>
References: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
In-Reply-To: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3310; i=gary@garyguo.net;
 h=from:subject:message-id; bh=NrsINGBe8q/2d7sEPXqFEU3dDXCwHHUmEQHS1rGxLkk=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWUeF3wlGyD3+3BWoXPjr8kzJpbvif35s0Z/nuuxFW
 Nn1ldWmYtc7SlkYxLgYZMUUWTy6GdM2Mc6WvaxV/hJmDisTyBAGLk4BmEj9e0aG83YVVh+CJJ8u
 OLeEb/r/3Cg2x7lnZYL8D01cqSJ9OufmfIb/XkVv4xcyl039Zu1nF5IW8rT+D4dGcuLUOUvXqM2
 8yGTHAQDaDEhY
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: VI4PEPF00000161.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::86e) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB1817:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f2cc9b6-75a8-4ada-0725-08df23beacf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|921020|56012099006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	R2/ijNOrzC9QG3xtnCWr44ywRPbwCpTiLuLdVAImWAVbY/5nuxuOjT71KEgzQ+VLQ4dPenkDzvvYteZuB+atBzFmZ1yzr7Mp14lAwEP1LtmbnXgMoWTEPevZCZnTgGyUR/MFhdwxh3szb96roBVpoyrZ59nWat9Krt2ap9M8fk95TH6inTzSD1NVxD3sHpiWNzt0tS/UIe4k2tHgKrOOPq/pS3unu5qBaXBa7j5D3bQbx/NoTMtmaC//FUybUZjOmXhysnzNoN0H+5oBVVjvLbDsfFtXNEKPwWjTuTvqUpcxAmV8lqA1VS9mmtP3rqfX9572U7gAgGKVk19uOvmme05NTLzzKaUwpggyaW5no9NZf4mX3CbdU+jGxAEVN6bhDJbQoyDiVc798aw4JREZRVHLQJ+Ei/s9DT+x7GRDdaxy0TN0XG63uuuYZdduB2ZeacLYYe/pXwSzNDS2ScVB0pSVKeHYE8VppAYQV/EH5cApKZ+7E2uWEg8bHihFDdUCvnZknWUporBhZtWZZvE8C6hEAfBkZA7OSowMcCptLM9BNSLrxdrGhpAbnnNFnuTRygDklQjMNMvmoYYCgAqnz4Uhd0/1FpKWc94IAXTm6Ocn+KKp1hiXMPKa5DCzf+ErzQZmMvwVTS4ZImPXiTzI69HELIc1BXpIq3/fIgeaTHZy84ZLB3hl93xWm6WMzIJU0B97dbUiiJQzYa8Q8GSwqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(921020)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTMydzNKU09MeFFCb1hnQXpqS2tmRW9icEZHYmxPelFMV2hqQU1CNC90VGN5?=
 =?utf-8?B?cUJ4bENjVHVRUWZ4MEhlc3B3TmF5VU01Z3BXZW5jK0Z6cGJFMDNzWnN5NzR1?=
 =?utf-8?B?Sk5DS3pXOXNFMVNnRjNIZzRmVE1Na0RSY2hxOXJiaE5CR0UrQWNvWmh3Zktl?=
 =?utf-8?B?YVFTM01LL2Y4aVUvenlHYVlpVTQ4QWNGczlBZjU3eEw5WnZTY2xXRzlXcXBM?=
 =?utf-8?B?bzRXU2xIL0NEUld4eGYyYmRtSHZLRTZteEx0L1RtN1NJWThuaGpTajRaTVFq?=
 =?utf-8?B?MWRya1VSdFQ1RGFEcXkrbWY3UUJZamkrUFYrQmdDRXZhYmxSODArQU9TTUhr?=
 =?utf-8?B?b1N6M1BhMDVVVXdSSlZVNjRQL21ZM1Y5MFRHMXVqdmFzUkpZNU1HVXZZaVRR?=
 =?utf-8?B?QW1uc0laNHNpZzJFcVNOZG5kc3EwNTUxaFU5ZUFqMnhRUFIzVnU5N3BCcnBB?=
 =?utf-8?B?NWs4TGxtYnRoQ2xpeENodGtCOHZJelh1aDJNS1BLSDcrN3VKMzJJQzJVanZs?=
 =?utf-8?B?WlRUVEJNTWZ1cXdIR3hWSWpUN2s1bzBWY3VZTkdXeTRRWjdja3lBd3RPM0Nt?=
 =?utf-8?B?cS9qYTZMZVBOUS82dTY0RmNtenVwR1EwbWhYbW03WVlkK1FTUmFMczlxTENa?=
 =?utf-8?B?cWk3ZXRHaFRXaFFIY2RCbDlnTjNpR24vNXZaazZmaGU4bWhrN2ZmaU9McTNF?=
 =?utf-8?B?ZXlqVlZnV2lyZ0lZaFJxZktUb0dCYWt6TVBxazNTVVlrT3BoNWZ5anBmaDRJ?=
 =?utf-8?B?S05GdGFiY25ML1FtZmNCRGExVEtoNFFxQS9lNE9BL3R0aGxLWHdHb2VHSE01?=
 =?utf-8?B?UjZqenJvYTFGZ3V6UGtmRHVld1lTS055VVBVWmhiN3Z1ZlloOGRjcERhaDh3?=
 =?utf-8?B?VFZ4dmIxVTNrL2pHeGxGQ3lmYmdENVdvWWwrK29ubnRIeFFIc1ZxelkyZDYw?=
 =?utf-8?B?NkRrN1RzUHpSaHZ5WER3T2h6VUlKRC9DSjZCYTNhMUhQdkZWMndpTXNjSG5k?=
 =?utf-8?B?bUc1TUVrZUsveWJZZlg2V2RxS3lWelZJb1R0SUgxQ2d3TTA2NXpyVWNaVVp1?=
 =?utf-8?B?WE5HRWo5V1dCbjZQbEVETDZFZHZYWGVyRjlHRUpLT091WEc5V0ZOVG9RcEVT?=
 =?utf-8?B?K0tnYmpRMFZMNE04ZXlGaVJzS2tKSG9JOHpORC9TVFhQSVZDSE9RUkMwbERz?=
 =?utf-8?B?SDdHTXh3VlRIaE4yRVhzTFVkdVd5VDNHbTNDTnVIeng3S0lSM1c4bW1yaUlF?=
 =?utf-8?B?UTBxSzdtRnFja1N3WWhsWmcyY2lzWlNNQ1RDdmliVkNKMmIwdXlVOWtWdHlG?=
 =?utf-8?B?aVhVYnVac3hadFgvUGx4eDhINFpZMjMwZjFNaHZiK0RscHlUOXR2azNYT2h2?=
 =?utf-8?B?a29yUFVJdkZyendDaHQxR3lqMGVUd1ppZmY1d0plVW1kRHJrNG1jdjI0RlNk?=
 =?utf-8?B?WFV5TFpiYklKZkJnQUtRYUdqVFhjdXFjVUVvUHpIVmpzeFpqR29DTmNsbGl0?=
 =?utf-8?B?WWdzaEUwVys5WlNpYUgyU1J2eVB6K3A1a1ZpRXJvZ1Ixell4YmNWQ2hUS3lQ?=
 =?utf-8?B?eDhIQjBGY2d6aGVBZTl6bkp3RmkrL1ZVaHFUZ1BRMFpWcUhOd2c3U05rNXFH?=
 =?utf-8?B?NCtwY2tMZEtBRzE4eWpuSlAzMXN0dnpKbHE3Yms5TERnWWx3bGk3aFRkRUdp?=
 =?utf-8?B?aGYrNjBpTGtFU0RhbXllWXllTFZWRi9vOXpONlMxQUYvVU8wYllqblBDM0pX?=
 =?utf-8?B?V0s4d2d1bm5lWTBldTVmK2VhanNMQ1FRMGdxYSttT1pMTDNqY3NtQXovRkVP?=
 =?utf-8?B?Wk4yeWNmTkxMT0doSm90aE5kNlpIUlhwQTFnZkl1NUx4a1BsYVpybkdGTXg4?=
 =?utf-8?B?TElWUnpRSkVXNitkWTByd1NOVXQxdmwwMmg1UzRzckp1Um40emRMMm5td1Fa?=
 =?utf-8?B?bXVtWW13MTFtMGp3N3hBaWthcHByZ0NkbU5RMS9FOGVONGtUQVhlQUJVTXNE?=
 =?utf-8?B?d2w1ZUxRWUIwUG9DU2NHVUQ0SlFwTkFra0FOSFh3MXNWeUx5WVdPZXlweERF?=
 =?utf-8?B?YVJsdFIyb0JsL1czQTNWSDRrd29aRDRhcWJ2T1gvUzhyQ0lFbkEzS3FTM012?=
 =?utf-8?B?TmpNWkl1cXp5TEtma0NrQ2oxekdTSDVyYWVXTkJJL3d1NHNpQnliWWhiTDF1?=
 =?utf-8?B?M2hpVlozR0xySXJ0T0xFRU4vRGZrQzkyMm1JcGhBUWt4L1ZtRGMyR0FVcEFI?=
 =?utf-8?B?U0xoV3FveUhTZGdoSzRkNkh3ZEJuTk5YMHBFd2taTVpZSk8xK0xwcDhkOVhx?=
 =?utf-8?Q?tAvysKxk5LNH2A9Z5A?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2cc9b6-75a8-4ada-0725-08df23beacf7
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 15:29:56.3688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9wUQHwfhTQoLKZ7XtkxeISpbevYDjzi6dHn5E9MFEkhKVa8FgdUSR3r4L7g/fckDCnTFyHdMEa2G0H8jgaAmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1817

Most users would not need to mention the generated projection struct. With
the upcoming self-referential support, there needs to be additional
projection structs. Instead of give them publicly visible names, simply
make the name not publicly accessible.

A heavy user of pin projection outside kernel is for async programming.
I've checked tokio codebase there is a single use case and that's for
enums.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index ac83f0f73e61..3acced1fe806 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -186,10 +186,10 @@ pub(crate) fn pin_data(
 
     Ok(quote! {
         #struct_
-        #projections
         // We put the rest into this const item, because it then will not be accessible to anything
         // outside.
         const _: () = {
+            #projections
             #the_pin_data
             #unpin_impl
             #drop_impl
@@ -322,7 +322,6 @@ fn generate_projections(
     let (impl_generics, ty_generics, whr) = generics.split_for_impl();
     let (_, ty_generics_with_pin_lt, _) = generics_with_pin_lt.split_for_impl();
 
-    let projection = format_ident!("{ident}Projection");
     let this = format_ident!("this");
 
     let (fields_decl, fields_proj): (Vec<_>, Vec<_>) = fields
@@ -371,13 +370,13 @@ fn generate_projections(
     let (projection_def, projection_init) = if is_tuple_struct {
         (
             quote! {
-                #vis struct #projection #generics_with_pin_lt (
+                #vis struct __Projection #generics_with_pin_lt (
                     #(#fields_decl)*
                     ::core::marker::PhantomData<&'__pin mut ()>,
                 ) #whr;
             },
             quote! {
-                #projection(
+                __Projection(
                     #(#fields_proj)*
                     ::core::marker::PhantomData,
                 )
@@ -386,7 +385,7 @@ fn generate_projections(
     } else {
         (
             quote! {
-                #vis struct #projection #generics_with_pin_lt
+                #vis struct __Projection #generics_with_pin_lt
                     #whr
                 {
                     #(#fields_decl)*
@@ -394,7 +393,7 @@ fn generate_projections(
                 }
             },
             quote! {
-                #projection {
+                __Projection {
                     #(#fields_proj)*
                     ___pin_phantom_data: ::core::marker::PhantomData,
                 }
@@ -422,7 +421,7 @@ impl #impl_generics #ident #ty_generics
             #[inline]
             #vis fn project<'__pin>(
                 self: ::core::pin::Pin<&'__pin mut Self>,
-            ) -> #projection #ty_generics_with_pin_lt {
+            ) -> __Projection #ty_generics_with_pin_lt {
                 // SAFETY: we only give access to `&mut` for fields not structurally pinned.
                 let #this = unsafe { ::core::pin::Pin::get_unchecked_mut(self) };
                 #projection_init

-- 
2.54.0

