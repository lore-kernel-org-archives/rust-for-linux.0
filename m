Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021091.outbound.protection.outlook.com [52.101.95.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AA549AA43;
	Thu,  8 Oct 2026 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462298; cv=fail; b=iva/TQFTOtpscV1B19PGdID49zQJOXDa/QmpYIN7/lk8Zril/cgAKM0JhXIKL54JyxgZMSy1EEXo11i8W4fveP3vD1X0JH3BGvgJaeu8NpT7PO0et/THW1urAUE8WtMjPMI1rQw4092i2tWcsQCNY7+p5PpAs/qrdp1LxUbiBYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462298; c=relaxed/simple;
	bh=s2t1hURoFx6feMbaqkvRqzh3vQahdeACDDH7sb/USQI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AFpe237Wz+Bnb8dbVSqU+CcMTKsC19hti1Bg/B/p5nPGXjczj34UjGzTdsrMlGmfmeG2O8zVWFYy4rDBEBoKn3d6UOEEgAyWXWCZCohLP05J4TkdI9lS2gjcHO7/9ewUOT6l1DOfGcJXEIeDEiapbiobmlkZ4VDbeUqCraeBIXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Qn0AowKn; arc=fail smtp.client-ip=52.101.95.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Qn0AowKn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COipn5SntlUqtwDtNgXmYZY9tZLUJaNWJ/NQ5bcnkbCt3lBoVhblPOnFg8iDQa41QAqKkF289uGffaas4v6cxwMNzAOYkszpHpcpRt3v6bPddBPlBLtcr3wPU9zMpNWwXTVe2n9A1qtHDzeDVWmIMsZnYsK4qUp3Altp/vlWqRcj35/F61cK+YJ7nNc06x1RMq/1toiwIhLzNDhZ79aacJwSpyim3nlB2hokIaVmuCBEJfakopcUFe65umGAS38yrjNNFer1DaEwZFcZWmeYGAYOLeMfgzQmToE0uSXfra/0Afl1KmuD0PvVQyUcDErx88xo1Wm831BLIJHLQH2KPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kR9BBfVmBkyKTTIyHTeEKnYo8JVo3pRpWq4KlOdjPII=;
 b=jPZc+57M8y1WTWYqAfuRxzRhGtAtrdAx0quV327w7nq4EH+r3EF6WlD3bAhFhP+vjPZiSmRdAVk6BDPx/uodDBeLj2h8ftbV0lIJBhHkgyrLeMnKO0hmS2Y6jY0kTs3QpMYhrAlrrSsow3GROtE0W6uLSArKTljGvRFA1zeJG2wnem54bMqNoxifTF9eJvWzcGNq432FGgK3Uej68YSUSmpa1XAa34ynypmrfhwCqJy3mmcc1fIZGBUIUkcvQR1P2UU6ydh4RU/S2SCfNnnwCBlyEwCqj0kMOQJQT70ZL+FgotcUM6/dqkr9/9iKnStMgS9LQxyqlBmfJIJjIwpboA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kR9BBfVmBkyKTTIyHTeEKnYo8JVo3pRpWq4KlOdjPII=;
 b=Qn0AowKnPk/PWD9zRsaW73Uv0uy6n6zyvAhccTJdJOq1AcLTyOPATil/VKqwiZWKppmhHlNeP5ITyWh63E8wTlAJjfAQsAPBw3Dsr1wNO/KWhAovsbL9ehsVwDl6fHM9TuiuH/Cyuo+RjPk/7xt7nz8l4eKPOwQgtXOCeaT9i6s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:47 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:47 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:24:00 +0200
Subject: [PATCH 13/20] rust: pin-init: internal: pin_data: parse explicit
 `#[borrowed]` annotation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-13-6c1eb269fe57@garyguo.net>
References: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2769; i=gary@garyguo.net;
 h=from:subject:message-id; bh=s2t1hURoFx6feMbaqkvRqzh3vQahdeACDDH7sb/USQI=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce701uPHb0ueIQxd5P+gz3p5W+WntnE//SJwwkTF
 o2OC9dDZzJ3lLIwiHExyIopsnh0M6ZtYpwte1mr/CXMHFYmkCEMXJwCMBGBOYwMTTdWXVt856PR
 lOn8qpH/NaybZq7tv7r4wzL5px61C+adfMDI0K676fq7pVyyByYsNRa8+vVMZk/C8rclDTunbWm
 a53kqix8AP91Maw==
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0578.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::8) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf8faf0-653f-441d-b672-08df25372451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GP/U8SAqjKpqkhmzsOOtL8YKCXwB5xfePgxOt3zOM0VUE0vXWCpKODlkuBFWIoEU1ezj+E2n5Wzs2pEuFES8zEkJ5nWaK61AhHgRtUc+wc7SLdT7uXEulsw6/QBrzXfF09EWE+K/GW1l+c+btIS9EcOEmcTCNXH7ZrNrOMa5Ub+r/jwTJoINRPcAKbrexLXJ9+bx81r35NgMMWmPJBNO7FrVdYWhfstEvE5bjhfbgVXFIQsRWScQzkE+cgvL7Z4SjqHoiEt8zlM8dS6JLQas0X/x2O7GoQMrR4l2qW0BDmqFSDILWLxBU5uKooZvejipxORZT+gYXq/3zXW22HDjLazl9ku5JNFIOdKoU5X0rCQAUU63HVyphx4D9vute+A5ToArWqX/u9nCHtC9PHelSLtCAwfe74F0bh5tJ9B8SPA0DDp188f0RKDZ3rd0MaTPkY9cNWKhyHgCRZWdrxBmC0fObxn9NVnnuOLs0O2L/D3VLtO3HXJ0L4CtBu050HcKRKpzkGKRJ54aAKrKOuMhzrX/ia2v0HFH2rQywuSqs7BjuTPnQmxgz1hMuvZCISATPMqi5kj9abEYsIc5546gMYoY28Wxa21qAH8lhELZYSe3U4nayR6mt5y3xhxwujdyk6633jSwZWzE6AspWG/GuJ9ec2GeCIW7G0ax8uqut+qMYU5dH43/PItU9dRHuL1WiKRq90P2lRHms3cyQSBGIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTUyaE83VjhKejFXTU1DbTM4YjJCbGNKTmMxb1Z5QXRxSnRBY2p5RkxpamQw?=
 =?utf-8?B?OUhnb0gyejczOHRrZXRFUVhUZ21tRjlTWVVHcGpqR202YTRKWXg2QVdBMVFo?=
 =?utf-8?B?VkgwUzY0L2hBbWM2YXRONWluTGhiMWpNR3lUb2ZvZ3NHQ1hGRXluOFp1VG5X?=
 =?utf-8?B?enBlbVhReEp6b3hsdUNnR3FPMFJweVN3Qlh2U2JObmllR2JIZWxqYnFXakhp?=
 =?utf-8?B?TUJTaGFSdWZXaSttTXdjVXVvbmtLdnk4VGU0ZWt5UzBORGhJS2FTRm5IclVP?=
 =?utf-8?B?OUZRaisraFBLcGVERGxOK0FNbS9IRTcwT0k5S2RFWnZvUUV5RE1zeWtkRU9w?=
 =?utf-8?B?TlFUYWJ0bGRXbm5PMDgyS0RzcXptNUUxV0ViVmZxNlZsN256YXV2TUVSV0lG?=
 =?utf-8?B?WW5sMi9BQnlqSHRNTFR0akMzSndKdGZ6WDRJVW1oT1FoV3VsS2hha3ZJNWdQ?=
 =?utf-8?B?NUlydnlUNU83dW1WeTh3N3BJemRqbE9iQ2k5UUp2Ni9PZmdDa1BMNDZDUEsw?=
 =?utf-8?B?K1JmMGFOSXg3azBoZG5MZVdlTEpjOC9JSUFwdjFOUTN1M0Z0TVNieXgvVm1K?=
 =?utf-8?B?ZlF2N2xBaWNhQWJ6b3BoRkhEaWZpWVlxekdyY1VPaVViZEJTQzdLcG1WNVcx?=
 =?utf-8?B?RUdieGhMeTk1VkpPR24rdThkRHI1cmpEWHJYVTZxb2tuN081Z3RmdXB4Y0N0?=
 =?utf-8?B?QzFWWnVlY29QZFk0ZG1aTG8xSDJ3cmt2YmVBSmt2RS9iQXpqaWVWbnduekFK?=
 =?utf-8?B?a2FXdjltWlFZcTg4MHNQK0FldFVHTUNOMmFrYWRZcnc4RTE1aXJzTlJrT0RF?=
 =?utf-8?B?cmUxQmpjYmRqM0xPbkVxWk1ZT0tONGNsV1J0amRZYTU2YVJzek43aU9uQ25n?=
 =?utf-8?B?TzVjV3NtSnQ3ZktQNXBlREJacHN5Q2FVV1ROM05haDQvWUZSbHhvd2Q1TGpm?=
 =?utf-8?B?TE9lc00vaTJMelg4dHg1elFsK0VNeWZ6d1JxOVQ2disxNkZvNjEwamV1MVhB?=
 =?utf-8?B?SVZTeTJibkF4bWlSMCtuSC9sWlR4REVKVUFoa0VUYzFVaTBzbEhyZ2tKUGxW?=
 =?utf-8?B?ckIrZnZGODZMNTd6NGZkZWgvOW03OEh0WjljaU91cjNqV0ZDWHhQRWJ1aXk4?=
 =?utf-8?B?VHllUnFCblhrczd2TE9Qd3FwbnZyajQ4dGF1R05wNStScHJQZlA3cEg0TU1U?=
 =?utf-8?B?V0E0Nm8wbGUxckZQUndpbGMwRlNPZ2dYdEdTeDljeVhQc243bWI0TFhBZEsz?=
 =?utf-8?B?TkNqd0daUktQUXplc0pFS0o0ZkFiWmdyOHQzT0oxVGhja3RLaFJEbUFDL2lT?=
 =?utf-8?B?dkQrcE91RmxpRGhCMExsMmlkV25KY25nellpdlBrNkc5OHFBUkE4UXA2T3E0?=
 =?utf-8?B?b3VSaXY0WHlBcE5OVjBSbmFYYXZyOVpDejRFMVlLRVhXT3Jja2EyZ3hqaFNx?=
 =?utf-8?B?YnM4R0E1dVNScWxpcjVNd25kSCtHNG5IUSttcE9tb2lOSytYTnpHZzhWNzQ0?=
 =?utf-8?B?RFV1bXBhby8rZlFsaFRVb09FUXlwNlJrWTNUamx3eWFXbUcwd3lyRTB2a2NM?=
 =?utf-8?B?dVE5cDBLRFFqQzlILy9yTWFnY2hra3R3ZS9iWW0zT2VvN0pmZWQ0TTg4a3Nh?=
 =?utf-8?B?WnpneHJYaEo2ek0yUDBlazlPN3phSUl2NHNDVzEzVTRpZzkwWkdiVnptcnhK?=
 =?utf-8?B?aTRUZlhXLzFwSnoxWnFRd0Fkc0F5SGtubTFCbFZWZEJTaHA2cWtGZXJpSklz?=
 =?utf-8?B?OGVxYnl3ZWZiZUo5ajIvOG9ndk1NOHNQQVdVZGc0SGlIQkk1MHlwNlpZYlNi?=
 =?utf-8?B?Z1JLeUd4NW5jTXM1cThsOHV6dS9uNmoxR3hhTm5tc2JCWWI4dnJiNmovTUZq?=
 =?utf-8?B?Q3lWWjF5Q05lMFFNWm5MNWVaT2ZTbVdFOUNhQjBsaC9TTHRSaytSejNFd0pH?=
 =?utf-8?B?N1pWV3lLUWFqbk1NVERvMG9HWFJpdFFNSVpoN0wwWnJnWUhzdi9wNk92UlBn?=
 =?utf-8?B?bC9HS3FzMXhkaWNhTWR6S1lNaXJELzE5Vzd2Vy91TDl6WUR6bG5rQlZSQ3dl?=
 =?utf-8?B?d0FQVmJZNVJEcCtjTHE2Z2J4Y1JlTWN6V3kzUDg1RmVMVXo0U1Bma1cxWExo?=
 =?utf-8?B?SjZxWXhOUUt2NWh6SHNCRlo5S3VnQ0FOV1NCWk96M1oyZ09CS2tzKzNaWXlX?=
 =?utf-8?B?bTBaTVlCWFR4NHM4M2dvWHFYRE5zMlVnSXB5TFhsRkd4eU54YlR6aS95NDZU?=
 =?utf-8?B?VkdEbmY1K2x5bjI1c1hTZm1DQ3pDSmsxbGpZQk5YbGhJeitaZGhicVZxdXQx?=
 =?utf-8?B?SkdzWVRBT0M3RDVIT0hqZWdhd21UbzRwS1U0TlUvc3MxTHdPVndLUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf8faf0-653f-441d-b672-08df25372451
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:47.3311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VHD2ahGVtp3ZzKYuxVq9fL8LoL9hxs32ZLbvfVRehr1W1pDAZmN5/9uC5WwD7OQMC+RcccJyULlJXAEUCU54Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5471

`#[borrowed]` attribute explicitly marks a field as potentially being
borrowed by other fields.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 36 ++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 0f132a99f366..908c0773f791 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -11,8 +11,8 @@
     spanned::Spanned,
     visit::Visit,
     visit_mut::VisitMut,
-    Field, Fields, GenericParam, Generics, Ident, Index, Item, ItemStruct, Lifetime, LifetimeParam,
-    Member, PathSegment, Token, Type, TypePath,
+    Attribute, Field, Fields, GenericParam, Generics, Ident, Index, Item, ItemStruct, Lifetime,
+    LifetimeParam, Member, Meta, PathSegment, Token, Type, TypePath,
 };
 
 use crate::{
@@ -55,11 +55,25 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
 /// Description of how a field is borrowed.
 #[derive(Clone, Copy, Default, PartialEq, Eq)]
 enum BorrowedKind {
-    /// Implicitly inferreed.
+    /// `#[borrowed]`, or implicitly inferreed.
     #[default]
     Shared,
 }
 
+impl BorrowedKind {
+    fn parse(dcx: &mut DiagCtxt, attrs: &mut Vec<Attribute>) -> Option<Self> {
+        let attr = attrs.extract_single_attr(dcx, "borrowed")?;
+
+        Some(if let Meta::Path(_) = attr.meta {
+            BorrowedKind::Shared
+        } else {
+            // Swallow the error and recover by inferring shared.
+            dcx.error(attr.path(), "unexpected `#[borrowed]` attribute");
+            BorrowedKind::Shared
+        })
+    }
+}
+
 /// Information about a borrowed field.
 struct BorrowedInfo {
     kind: BorrowedKind,
@@ -305,11 +319,25 @@ fn expand(
             })
             .visit_type(&field.ty);
 
+            let borrowed = BorrowedKind::parse(dcx, &mut field.attrs).and_then(|kind| {
+                let lifetime = Lifetime::from_ident(&member.as_ident());
+
+                if bound_lifetimes.contains(&lifetime) {
+                    dcx.error(
+                        &lifetime,
+                        format!("`{lifetime}` appear in generics and would conflict with field lifetime"),
+                    );
+                    return None;
+                }
+
+                Some(BorrowedInfo { kind, lifetime })
+            });
+
             FieldInfo {
                 field,
                 member,
                 pinned,
-                borrowed: None,
+                borrowed,
                 captures,
                 generic_lt_captures,
                 generic_ty_captures,

-- 
2.54.0

