Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020105.outbound.protection.outlook.com [52.101.195.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9715F451069;
	Tue, 28 Apr 2026 13:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381883; cv=fail; b=m1UDaPmO4NZJ2oJdgVRa/RIMiqzhb4EXuBjXJhgP6Df/RY3GPc/wczj/ffXj31ZNmwiGR5056tYoaHsxFJFF3+J15sIk9yV+6wlCdFs63RcObVCIZs4cu9NkNYBNIMmBYLznoEjP45nus8yrpqhgJ5TQKe2NJL3GueIxBlQRJOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381883; c=relaxed/simple;
	bh=2zD7rENeWYECm/v0h7v8fvXpUA6s6H3xWjO1IwMe/N0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZBuf+1XYQkIEGL/a1qZswRXHeFmceXsI0KTYMsUFl76xmfQgwLSfgzuQka8QFIH3NYJ5HcyL++pK6ZndI64Hf1nuJXbQu8HQnDpwzwr1drYdCiQqY18JNl4neq4SMMt37/vngyKIg2fQVIp/LjOoN3swwBJTFI+gL8/XJJJkPOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=QSvoRgwA; arc=fail smtp.client-ip=52.101.195.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="QSvoRgwA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgLFeZ9wVlPnyQ4NToDXDfWu//9fdldheIj10rURUlMk/ChGnmlyeraw0Sidd7hbE90GrY4VS+d0pPGBzzS6YNItehG+cfhBS1QFHfrAPXsVysxiNkf+jW7eMZnJbTkiGbbB1uGscJ+2m45AvNUv+agLK1jj3jlSoTOEJVGc95XBEs6dHQEiK5WQTLm65y7FZ7hOksQ4dTU45MafNPKtTAyqXEGoKjcWF9AE5tmRWe6iE4gk11oy2sUJPXnnkUlV+5Y2vinyKl2wHMpV11jmS+B6VqY9TijrAyUCdFX7jzcXSI/btYjkdLxRvbcswuAm04lJyqI1eJt4K2PBXc6Ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3mjyX2YWd+oF9rfmuRPY5bic8lJ8hWEd+02s0UHsKw=;
 b=Pys8TfHxaZlqZ6YEXoOTXdKv0aemdpiS7N+tHqlzJnv3sAW3tWlTDtoh0k0mISmsH8IFLNXoDs5bYvCr3QKyP1hcxDaMx+ul9z1rUlk+T7NcZksolGqb9wHgTs56lUbuWyOk941c9vtl8TYaMAtTGR4Q8volnNy9ErrNZZa0qELKS38L19E+I2GJd6O4VdeJ805YmTQNKadS7W9xoaDZsle9hDHFJ7TdQKhjF/efgAdPX7kNRiQMmx4Q/B0pBB2kwrq7i4vb9JaRvRBWoME52Fo7jeNJ2HUcw1/+WkiiYY3S2aYI5EtmAf7VRcJ4bGITwtS+3hU34ExG2xT+tIUenA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3mjyX2YWd+oF9rfmuRPY5bic8lJ8hWEd+02s0UHsKw=;
 b=QSvoRgwAiZ7+fJV0kKij8gWHyFMMIdE5yuffhe4RDmJLWyv001malkLrRJgXudR2RGj6i/YigouSWBR2NSdb/JACpfmJ7dc/Ejzru1YfYYK3f+ndy9EUPFj6TponEmIxv+To5BnJ3ur9lYE4Ajm9QO2i7JtwC3Rbm9I0IXd2F6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5969.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:11:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:11:10 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Apr 2026 14:10:51 +0100
Subject: [PATCH 02/10] rust: pin-init: bump minimum Rust version to 1.82
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-pin-init-sync-v1-2-07f9bd3859fb@garyguo.net>
References: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
In-Reply-To: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777381869; l=4783;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=2zD7rENeWYECm/v0h7v8fvXpUA6s6H3xWjO1IwMe/N0=;
 b=J+cmGwOhMeQku6Kq5jI5H9dO7pFsBHXSuAk+zNAC5eYuPumUs9A11X6tEFzf/Y0j7P3QR32Wz
 AkuAdyXIL0UDK4JpDfNtBZewJyT/3DvDhc81fyduFUKJwHLTEHlTN14
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
X-MS-Office365-Filtering-Correlation-Id: 2378ed0e-0470-4b01-9004-08dea5279e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MvSks9W+miEQJnyPopc0Q/bp9BeKkhkSQyfZlxTllTYxz7E28nms8XouDRTkS+IEJUgPFCqoqwi6HBP11jqUUoqDd+RWC39uCQ63GKkMr/PiPIN7nekm/RPyB9KxqUAuSAocUAQBFwt1U0vN2Plh+DMuBaqVMdBQTDpFc3bqDWFCih1xFj4v88yFo+c+IukoxK5guEivVBSoUQsvXmbrSmMsqtQLsxSWDQtiqeNrG0Xb3lhYoQ6oIN37gioDMJbyzEfsIi9xYIKLWC9pRmu6OWqNBo54lnDaBFgMUAKXiT6Z6kP+J7VsbtMJQLVe1N6+pCqywZV6G44Wo6NqfjxoELFnC+j7RGwkKui3tTOcAWU2BTDpJ3H2ov7gv/1o3aBDuK9ilB7y727gsr9KsMm9TwF6hwJnFAHGyDsu3urn4TQIz64RQhXGfxdDTOZ3u+1cMPDVLQ+AD6UiTBcVwFDMGDmjlUWnTB8y8hYZ10Q3dANfvjVukkkHrn7T9BmytPsBe02Q9hg9vCsogKSRzEHUfmExX0n5CM2mQdpBeYp9vFuSCG8PXKt4IDJ2TNxC/iz+CoGWglQXIE5Iw4c6Lv5ZiV9M9cBGVOUhcXO3OCfS6MGGhACHFSBVrpCBk5efH4WbnYnmnBsZBAuHhC0t0jkgdOVhyagBhg2jEX1J2EdSex8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2tFL0FKWU11WXlXS2xHV2VsSFRHdWRCYnBacnhQZ1BoL1ptcVR3NGV3THd5?=
 =?utf-8?B?c2ZoRUhjaXRuekUxSGVLdkVtNWZZT3JvTndJaGdnYXhYb0IrWWxraDlyNSs2?=
 =?utf-8?B?MG5QL0loQVFWVmh6ZmduUndoSnZ2aU9HRUVDT2NVdW5OTFJEeDFaUzRGN2E3?=
 =?utf-8?B?M2ViK3BWa3hkRXFSRWRPbDhHRCtLanNFbDJmZjlCMzFHR3ppZUVqaWpiWitO?=
 =?utf-8?B?aU5MQm11aWYwcWFGd0RMMGlxbTFLRFdyUFpJL1JzNHd2UkYwVFpYODA1UTho?=
 =?utf-8?B?dXFQbUp4UHU5a0JvSXJMc0owWXRiV2FjWnpkcE9ZNTBuU1BUQmJSV3FDU1po?=
 =?utf-8?B?YWdBOTdTTGhqU0M1MXF0WXJYL3pvVDh6UDF3YlNiSW5aYm0wclFVZ2FmTXRV?=
 =?utf-8?B?MHpMWXFNS0VtK2VFcUZNVmdicG4xaTF2aVZ4VVVEYmRpZURJekw3Z1hjMkZj?=
 =?utf-8?B?bWR5dDVlZWh3cTQrMUF6UFJwaGlZZ2VhL1hRZXZPVjFiOE9IVTRseVFMN0Zj?=
 =?utf-8?B?UDlHSlptYzZaRmQvaVhhYk9aeUc5MDk1b0Uwc3FLN2U2Q0ViMGNYZ1hyRHB6?=
 =?utf-8?B?N2g3Ny9xZHBYQjFHcUJlVnBTMS9xa2NuV3B0OVM4azdreDJETGM0UnNJYjZk?=
 =?utf-8?B?QUVqQnE5YUcxemUxNkxzbHB2R21uYzZycXo3ekFVMWdmSi9rRkMzcktsWmJ2?=
 =?utf-8?B?bWNLVEluTE5EdEZRZTBuYmhjUllneVBzV2JPYkk1OXJqUE93amxSeHdZbUs4?=
 =?utf-8?B?ZktqZEFRMkJ4QVdTTlJoZi9DUXhIT25ZUm9aMjBIbE5vUUVvNC9sK0JRWnZD?=
 =?utf-8?B?NG5ra29RQklTZDlFTmJxbVZWVzRrYjVGNWZndUk5dTBtc3l3dEVvNnJVeXFh?=
 =?utf-8?B?bnh5eXZjLyszM3orU2FXZk5jL2VVMWkvYURad3UwUUkyTTkzRW8xZzRYMldj?=
 =?utf-8?B?WFVLTm1yd2RQOVBhQzY5QnFIS0t6QlhzM0hQdlhlVkJtZHRjVHE2V2lVdnZt?=
 =?utf-8?B?YzZQbGlYa2JoOTVqcVlZOTVMcFZrbDNYS0VJUnV4K21VUmQwMGNiaXpiQjM3?=
 =?utf-8?B?cUY2RDgxZ2FUQXluM0FyaHRvajI1bWNPb3orb21UekFsT0ZtT3VkOHFYMHFV?=
 =?utf-8?B?YXR5SFRyejRRTDl3MkZ3RkdNb2NjNXdzeGxnQU9NZkk1ZUp0bFQ2M0dmQ0w3?=
 =?utf-8?B?aklBVGhrMW0zQlR1T0swTENpQWp0WUI2VHd1OE1jcnNaNGRVWnpkZzZhWjNZ?=
 =?utf-8?B?SVZ1MFhtSHFhb0hNS1o1Um03YW9Fa2VlUjdpZTRObUU2VDhIclhRcEhQcE8w?=
 =?utf-8?B?ZVowWW0wM3J3TndOTlpBUVhmMUQxSlI3Yi96QlBNVWU0L0tabVVLT01id0pQ?=
 =?utf-8?B?RnU5MmUza1krQVdGRm9UcVlqU3cxM1FKYmRNWCswTHVTeCs1MUsrdzJGVEF6?=
 =?utf-8?B?S2poQkU0ODN4T0t0OFdJcEFJeklYVkpaQlBISG4xN3FTa2pHYXU5TDJ3T3Er?=
 =?utf-8?B?dE53b3dyZjNkNkc5K3NDVERvZHErSkRXaUJoM1Ayd0FMODh2VzAvYmtONUFY?=
 =?utf-8?B?Mk5hR0RyS1ZPWXNleXFXTjRXNmhYKzVjdmE4VTZ5bkxmaUhBUU95KzBlSzEw?=
 =?utf-8?B?bEY4SDhhdGJZRmlkWXpRWW0rSWtmc1EvYklrZStRZEd6SHZzTERHa0pMSHhY?=
 =?utf-8?B?STNUZ0NmbG9HM0RpMmRKcGRFOEI1VVhvdC9ma0Y2OUdBajgwQXFwZ2hKYkgv?=
 =?utf-8?B?eWJXQjFjK3lqOHUvOFM1dWZQNDI3K21JWTB0SFh1ZFVqRkwzV3ROQ2FkeXpV?=
 =?utf-8?B?Vlk1TzRNM2dxSWVib1JqbGZNNlI4NnRLTXVrNzZBY1dSYi94NGR2MHdaYW13?=
 =?utf-8?B?Z1RrMStweDYxSmFHWGpYcVhUWFJsZFcvZDg3dHZPR0FVWUdzR2V2dDhHQkdN?=
 =?utf-8?B?QVozVXlCUXJvKzlOLy9oV2YxRG5aWWgxNmxOTWtuSUNKTkRnV1NBQ0dTdWFF?=
 =?utf-8?B?eTJkTEtRM0RnVG5XVzlBN05hSU9UZk05UXdoWFUrUXFZZTZlU2IvWEQvUWVh?=
 =?utf-8?B?YWFZN3Y5NlBIN1VGdE9sNFBtVUFLWUxGN1ZGUHRQeUdTdWJIc1ZsQW1YTVNm?=
 =?utf-8?B?UXZlMlhwekRPR2lvMStQaXNiTnZUZms5Y0paVjlIbURySW5vUE9rN0NteEhk?=
 =?utf-8?B?U2RrbnJFQU8vRTNxckUvcHl0UVBsVml1K3pjd1FuQXBaSTVEOElRcm1GSU4z?=
 =?utf-8?B?SzFXWG9XY0RoSzhLUUk1VmRoUnM2R3d1a1FiaXRNb3JmdFQ4bHhWVXR3bnM2?=
 =?utf-8?B?eTZsQm9sMVp5WFBXbTEzZlR5MGdVK3M3aWFsOUlsR2h5c1FLSTdZZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2378ed0e-0470-4b01-9004-08dea5279e08
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:11:10.7440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEjeHhD8ckDafWLs126boNYM5BMwX0CS+NIlCLrEML451JUTJClTNxYeidy832MzmHxtmgumOaMdNuuRjryKaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5969

Following the kernel minimum version bump in commit f32fb9c58a5b ("rust:
bump Rust minimum supported version to 1.85.0 (Debian Trixie)"), bump
pin-init's minimum Rust version to 1.82.

This removes the `lint_reasons` feature which is stabilized in 1.81 and the
`raw_ref_ops` and `new_uninit` features which are stabilized in 1.82.

Given we do not use any features that are stabilized in 1.82..=1.85 range,
and pin-init crate is useful for other projects which may have their own
MSRV requirements, the minimum version is not straightly bumped to 1.85.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/examples/big_struct_in_place.rs | 3 ---
 rust/pin-init/examples/linked_list.rs         | 2 --
 rust/pin-init/examples/mutex.rs               | 2 --
 rust/pin-init/examples/pthread_mutex.rs       | 2 --
 rust/pin-init/examples/static_init.rs         | 2 --
 rust/pin-init/internal/src/lib.rs             | 1 -
 rust/pin-init/src/lib.rs                      | 6 ------
 7 files changed, 18 deletions(-)

diff --git a/rust/pin-init/examples/big_struct_in_place.rs b/rust/pin-init/examples/big_struct_in_place.rs
index 80f89b5f8fd6..c05139927486 100644
--- a/rust/pin-init/examples/big_struct_in_place.rs
+++ b/rust/pin-init/examples/big_struct_in_place.rs
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
-#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
-#![cfg_attr(USE_RUSTC_FEATURES, feature(raw_ref_op))]
-
 use pin_init::*;
 
 // Struct with size over 1GiB
diff --git a/rust/pin-init/examples/linked_list.rs b/rust/pin-init/examples/linked_list.rs
index 119169e4dc41..424585fe226d 100644
--- a/rust/pin-init/examples/linked_list.rs
+++ b/rust/pin-init/examples/linked_list.rs
@@ -2,8 +2,6 @@
 
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
-#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
-#![cfg_attr(USE_RUSTC_FEATURES, feature(raw_ref_op))]
 
 use core::{
     cell::Cell,
diff --git a/rust/pin-init/examples/mutex.rs b/rust/pin-init/examples/mutex.rs
index d53671f0edb8..8ed2d3219eb1 100644
--- a/rust/pin-init/examples/mutex.rs
+++ b/rust/pin-init/examples/mutex.rs
@@ -2,8 +2,6 @@
 
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
-#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
-#![cfg_attr(USE_RUSTC_FEATURES, feature(raw_ref_op))]
 #![allow(clippy::missing_safety_doc)]
 
 use core::{
diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/examples/pthread_mutex.rs
index f3b5cc9b7134..4a66316471af 100644
--- a/rust/pin-init/examples/pthread_mutex.rs
+++ b/rust/pin-init/examples/pthread_mutex.rs
@@ -3,8 +3,6 @@
 // inspired by <https://github.com/nbdd0121/pin-init/blob/trunk/examples/pthread_mutex.rs>
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
-#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
-#![cfg_attr(USE_RUSTC_FEATURES, feature(raw_ref_op))]
 
 #[cfg(not(windows))]
 mod pthread_mtx {
diff --git a/rust/pin-init/examples/static_init.rs b/rust/pin-init/examples/static_init.rs
index f7e53d1a5ae6..906b96c5d4b9 100644
--- a/rust/pin-init/examples/static_init.rs
+++ b/rust/pin-init/examples/static_init.rs
@@ -2,8 +2,6 @@
 
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
-#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
-#![cfg_attr(USE_RUSTC_FEATURES, feature(raw_ref_op))]
 #![allow(unused_imports)]
 
 use core::{
diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index b08dfe003031..60d5093f3128 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -6,7 +6,6 @@
 
 //! `pin-init` proc macros.
 
-#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
 // Documentation is done in the pin-init crate instead.
 #![allow(missing_docs)]
 
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 64eec095c859..4f50994bd268 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -263,12 +263,6 @@
 //! [`impl Init<T, E>`]: crate::Init
 //! [Rust-for-Linux]: https://rust-for-linux.com/
 
-#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
-#![cfg_attr(USE_RUSTC_FEATURES, feature(raw_ref_op))]
-#![cfg_attr(
-    all(any(feature = "alloc", feature = "std"), USE_RUSTC_FEATURES),
-    feature(new_uninit)
-)]
 #![forbid(missing_docs, unsafe_op_in_unsafe_fn)]
 #![cfg_attr(not(feature = "std"), no_std)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]

-- 
2.51.2

