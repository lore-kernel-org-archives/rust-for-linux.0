Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021088.outbound.protection.outlook.com [52.101.95.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA884FE2D4;
	Thu,  8 Oct 2026 19:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487631; cv=fail; b=lUWwj8w4bD5uZC2CjSUugMCkVOg/ggcHsyQlI5Xqsyq3ZmIfX3bdp48XkIPfPvStHkRGHWwvQidGN58L6SZ6RVG7kBZle50KGuLiycwC07MjF4ImicVhQmYcWG30wglhmF0C1foipBSEuHcRC+xYgsQQY5l6O0QjSBmI6dc2XUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487631; c=relaxed/simple;
	bh=483Mygow3jdHCVmZohOu/aLX/vO5epnrYRnwDw+jWjM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=U2EeDZ0xz4wg524E0jv/aMOEAbGuHR8a+3gthSVe6Q7BFhsrmRNfne43ofHcO80GxTjAAKHp2Ax/qUa+YgJ/4G015QZcGmGOw3l+inBtofFqnTm/Yui3YcKkNuvVmwNuVstlXJ13dh+z2UaQLFZmuumx8cZMmgMUI7Waz1rInio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jo7CrlRw; arc=fail smtp.client-ip=52.101.95.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jo7CrlRw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCN2I8s0O4dvYS2xiCvE+AxB5Dfa5/jCLsKfEhpuighP4qHTQUNTmVtYyQAJo/kqW83N7ZOBLM+9mNMRtLnC4dHgiSr3ZsLvf40KPZwqmSZhIgdqumi/GG8/YF0UQZ1F6pxFtIibB5AWHDz1b7IH5W0673zA7BwNmw3/6Gp5CftyHI5k/PtkDXwW3+J+knHYJOnwd8Zavb4ZG1Ybts7DkSwXeSJoJ53JrT/a8WytJ87DaxfdGFVY+9NIBmIL8/LzVQ3In/jroPTrHz44glt8GMV+ZF1WnBleLdo0S1IUS4iPOIrvXeWxOaxC51o70pUDDEO8/UPYEw+vwyHLXq5seQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDPP6HdbPQvWoje76IBIUQnPUWG7KR97z08Ei9g0mY4=;
 b=y4luADWHBzBEX+3XZWvMrmSqalOaySsKrlWYugXGiEFzoMvn3XB2zr6vIeDAT6+Z0J9s+B1AESKrB3zvEbTI2hCiEdgLrLPNRJzRR9Ba6VCIH+njk/XzRX1w+BU7tG3bW8fAcuwxEiakUZHLQ0Rjg3Ms8HDF+GJKY75RDbG31GziSPe4hNlXBFm4EbOovQp3hHJ26brxXO1wxdWIlPhIvm8mcJz5bn9TFi3hzQZQM5hx5BSEJb4ghxJaZ2oEv4frmJuZFnK5iQcxb+d+vGmiuE9cPaMFsUkHSWUz+uldSQISRXUM3mClDSvr43vPvLXhVsz/uV3OxCQXLhM58DEgiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDPP6HdbPQvWoje76IBIUQnPUWG7KR97z08Ei9g0mY4=;
 b=jo7CrlRw51ZBmU01j1gzQukw1ATDMSV/8jmTNfP+d9oy1TTsyDlptsbWyZIrDXsF7X4DoyITnw6gRjzDV+h7/9TRRESxspDOqj3xONy7lkd6qlrOkx/qFC3yvYnzODtLr5TAxG6Xnicw42+NP0mTOlP36Y6PuPPry6AcvxG9Plc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:44 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:44 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:30 +0100
Subject: [PATCH v2 06/20] rust: pin-init: internal: pin_data:
 self-referential drop order checks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-6-e280b3c8fba5@garyguo.net>
References: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=16951; i=gary@garyguo.net;
 h=from:subject:message-id; bh=483Mygow3jdHCVmZohOu/aLX/vO5epnrYRnwDw+jWjM=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcff5bfkXbBw2yjPEf0m4XN18VzO5Eee5o7/c7Ov9
 ml7Zqn/utVRysIgxsUgK6bI4tHNmLaJcbbsZa3ylzBzWJlAhjBwcQrARKy/MfwPLfnMk1aS7szX
 zyOxwPJxtL2Q9Q6vmzW9Dl5fV89Ku97M8Id/h9Icfa0+ZbVfF+/NDt4v8TcjNHn3LePY3ELnN0W
 MjxgBEGtHDQ==
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: e3187e16-0818-4d86-04fe-08df25721697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|7136999003|11062099010|18002099003|10067099003|22082099003|3023799007|921020|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	gyMi+TTzZl0egkCieao6sFrJrVTFbAi+gbox2a+mIyCtRT3398eZ72ZN7EekesrXumK44EllLjr0yp2MbCdiA7YaOyY3NV5Q+o0kguhfIsdAKSs4TbNstHjzxbygD6wcsq3Ah+jVLhtiazHJPlE+iPlrGbRd+KCVKEKEnSdO7ZlTFl5TW4wvXA+LbFIIgvQd+w6a87JdAJG7gnr5FmvFE3harREIVecHmOagf6/xwUid9m0AZNrY/gFgQC6Mtdw4y/Mp9EXMBPfk3Rf8TC4ApXhP5dGSScLxklAGjpZiod3gc/FNtBjrGnhgHMrayHyk1Loci3Ah0nFnbc7fBPe85OO72Mg7ptPG4u05f6TyaHQDV/fdg0mmITJBsnyAXA9nu6qDNoQyDJK4BwgVccuOW+wnEdCy0PJmLyMfnqtsvJblBJKnAu+udrekEnJdBhtQGTFGbRjy9UTt4MMaKQEkRK3n07zkSrjgH+Ypp1GtANfIb/bknI9lKeKCPJKbB2P4PEts5mu9a+giTvEy1hmci5IfgQAOOEwGg6sgg0w+hIzY5jF5xIl5lohWt32TxESfFTp/757zGzKpkSYAul63hCqJWcohEA9y/YsLoANwz/raq9fCLGkEGs4aIjOPtouLlxjhLzeZhhoKOBYBFhmZ84JS0icc3tREDcdtfCulc0uzECvnXlX2s5tpeq0I1r6ItvMSly8vbKWvGnvubVemZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(7136999003)(11062099010)(18002099003)(10067099003)(22082099003)(3023799007)(921020)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmxpUmhCeWNPaTVlRDcrenZsNmNpWE9IaThvKzBwM204cFJKOTBHUWptRDlk?=
 =?utf-8?B?aHB6Y0daOHFJWURqUE4yTDBNdVN1K3BkTHpmbEROVG9uNE90THRyVlk2bFpz?=
 =?utf-8?B?S2JZNG9lL0VJQW1zeTJhQkRpQWgrMWx6Mlp3KzdoaUdKeHdOZk1vRFNmZFFT?=
 =?utf-8?B?V1NPa0VKS2h5ZTZKSFZmUXhNQUx1ZThpa0p0bXhlYVlyQVJNdGpDNmhqNkpV?=
 =?utf-8?B?TVpETFZ4b2VyWFVsaWd0aFdjcjQvc0lKYm02NnJybU5BMDJBWnlSSUlMT2Q4?=
 =?utf-8?B?MW1TRTJyWU5BZStZdjd2azlJektzM1YrUDVuNWxXVy8yYmFEZnliT0pIZTF1?=
 =?utf-8?B?c2pLNzNHQmVObjJMeTNDRlRPdVFDN1NRL2VPYmxrWng0VldaZ3p6eW1qcDJL?=
 =?utf-8?B?QS80elAwNFdkbjJrbytORUttQVRrYmpBdDQ3ekRsNjc5TXpEemlWM24vODdV?=
 =?utf-8?B?WGNqNlFqamlWWTB3QkpjV2dNQUdXTWZyMHZtK2N0cU5TT0VZUG5KcEZkSDJj?=
 =?utf-8?B?L1djN1I4emRUZWtGSCtoQm5YTEZFcUZJMWNpcmVzQXdMdjc0VWFiUGQ1U0pk?=
 =?utf-8?B?RmkxOTg1cW1GcnZSMjRFam8wb0VwSWJTZDJvQW11UTVDQUVVN0VZbS8zLzZX?=
 =?utf-8?B?OHNUQWp3UjRwRXdXM1VRYVRnTVJscDFHYjloTzBremhiMUJ5QW5TOGhISDJI?=
 =?utf-8?B?eVhyejNEUmdHUGo3RVpVTWlZUkxlOTBrcHk1ZFJub29CbjRLd0pPRnlZOG5W?=
 =?utf-8?B?Z1BjcktsZUxWTUJORlZzYW9Ub2tuYWRHYlBxcXlFZVpVazRGUXhzaklxcFg0?=
 =?utf-8?B?alFZSGZrRG9aN1FHNlpackxqbXY5cjZKU1dycHBnNWE4cTg4UWtWVTE4V3hP?=
 =?utf-8?B?SnVqNVJxUkZkVkhHSFk2amxkcFAxek8wQW16ZWsyMDl0ZkhUZnkzMzA1UFJq?=
 =?utf-8?B?eGYyR0lSWW9BcEVJSndici9IclRjWG84aHRFd2wza3BFWnJ6WXpWSWJmWjdT?=
 =?utf-8?B?QUdFVm1CamV3OXY0WDhTL1FvVVdGTHQ1OTVJcEpSdGEweG5ZRTRRNkNZaDZj?=
 =?utf-8?B?RFhwQnBGUjhBVXIxVkYvZXY0Rld6eW1aNnlXQ3VPcVhQbmpYVjVFck1CcjJi?=
 =?utf-8?B?bFlCL2ttOG0ySWFkUk1KUzVxakt1RWZVMjN6cWVxeFV0aFFRNDNvNlZFMDZk?=
 =?utf-8?B?ZE1IZkV3NE5Gdll4THRlV3RBTVlXSzA3UUVwaFhEMDRQUGh3M1l3VDV5MHpo?=
 =?utf-8?B?QVhZUm13VmdrcjlTU0h0VmMvS0hEU0g2MllTTnAydWU0aHVTQW53MDBTTnAv?=
 =?utf-8?B?Z0tSY25lKzBzSnRha0tTYnhqUzRNWllrSGZrNG4zL3VnbWRxTzI0ajVuVXAy?=
 =?utf-8?B?NHg2aGYzSlhxemIxbWpDWXR3U0RmbTJiT2xyZkNwVm8xbXRYUi9WVW94K2dR?=
 =?utf-8?B?SWM2U1BuQ3ZYZmI2R0VVZDJBUmY2ajBCZVd3QmExb1pPbTdLYlltT0xoWENp?=
 =?utf-8?B?TEFHbEduTzB2eHhDRHZkZm1GZU9RY0JjdUFlb0ZsQit3Y0F6Zm1xUjhwVHdN?=
 =?utf-8?B?RE9FNGU0WmZxYVhvbjB1cnZ1SHhJajRnL2FTZjRia3dBV0E0Q0plci83V1p0?=
 =?utf-8?B?N3YzNXdWMmU4VEdnc09qSTBHN2lyS2IwN0w0WW5pYVA2RnpReXlqMEtCQk9k?=
 =?utf-8?B?ZDNXSlVheTAwNEFROGg0OE1WSVA5VFdyV1V3R3NNamR6TEs5VnJaU3NWbWxW?=
 =?utf-8?B?QTEzbWoxZ1J5MEFVSTFVY1RjZEpsd3lwbE9NN2FNMG1EbE1ZL3VMWklWajV0?=
 =?utf-8?B?YzBiOE9zTERydEpDcGhvVS9vaWR0a2Rqcm1VSU9wbmtqYTYwRndUeGlnckx5?=
 =?utf-8?B?UTU0VndqMnNpQ3NmTVZremZETis1ZlpSSHAvdzMvY09NS2JSOXBrR3NKTDJo?=
 =?utf-8?B?bS9ESWpZeVJuUkVudlZGUXErLzNCcEJ6L01Ja0Rvd2RzNjdpY0lBN1k2Z1lG?=
 =?utf-8?B?QWNmRVovUHE0N2RiZmdGZEJVRFBiYnB3V0pzeVhXaXJ4SVhvR1p6U3o2UUpo?=
 =?utf-8?B?NUdwL290dnZEelZ2czd0RVU0eDZmWE5pMnZ6OHBCTCszeW8yckNXSkRLWmtU?=
 =?utf-8?B?d3JhRmQ1VUFmRzlDZXRMWk5FcitXTDVXbWgzODhYZGJFMzNZQnUvWGJyL0xJ?=
 =?utf-8?B?TzgxWlpld2pFaG8ySDdRZElVMGtrV2lZUy8xaTYrWVJtaWV1bTJSUWNCbTRG?=
 =?utf-8?B?bEJsOU00RmVNeGZJbDQxUjlXMDdXYW92U2pkYUZyQ1B6WkVWeTdDNlBSUEt5?=
 =?utf-8?B?SUIzMjA0Rzh4WXRoMnUvcTM0dXpUV2ZFbldyakErbGdkMXdHYUJyV3FxV3hq?=
 =?utf-8?Q?2Of5TtLkAjNKu5W7RrZxohJxhZjKXdBcPi6rJrUI6IAJK?=
X-MS-Exchange-AntiSpam-MessageData-1: AwBCGEoz5IUyQg==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e3187e16-0818-4d86-04fe-08df25721697
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:44.5985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OE5z9B93R2sVU3v9sHo4UWUbPnLPmFflU69I/3HhpmNhrpx8bcoIPHYWTFmvJjnUHwSShw5Io3vu0IBmVTILEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

Check drop order to ensure that usage of lifetime inside self-referential
struct is consistent with the order that the fields will dropped in drop
glue.

First, fields are checked according to their index to ensure that if `a`
borrows from `b`, `b` must outlive `a`. This is simple and produces a very
good diagnostic when misused.

Lifetime bounds can also be indirectly crafted with implied bounds that
make fields well-formed. For example, in this struct

    struct Foo {
        x: &'b &'a (),
        a: String,
        y: PrintOnDrop<&'b str>,
        b: String,
    }

`&'b &'a ()` will imply that `a` outlive `b`, which is inconsistent with
the actual drop order. For this case, create a `__drop_order_check`
function with field lifetimes and outlive relationship of them as generic
parameter, and ask Rust to prove that the types are well-formed inside the
generated function, to ensure that the bad implied bounds cannot happen.

The `__drop_order_check` also need to correlate lifetimes or types captured
by generics and the field lifetimes. Do this by inserting outlive bounds
when a field mentions a specific type or lifetime parameter.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 212 ++++++++++++++++++++++++++++++++-
 rust/pin-init/internal/src/util.rs     |  65 +++++++++-
 2 files changed, 268 insertions(+), 9 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index a3e492c455da..ec0b1aeefe7f 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -2,8 +2,8 @@
 
 use std::collections::{BTreeMap, BTreeSet};
 
-use proc_macro2::TokenStream;
-use quote::{format_ident, quote, ToTokens};
+use proc_macro2::{Span, TokenStream};
+use quote::{format_ident, quote, quote_spanned, ToTokens};
 use syn::{
     parse::{End, Nothing, Parse},
     parse_quote, parse_quote_spanned,
@@ -11,8 +11,8 @@
     spanned::Spanned,
     visit::Visit,
     visit_mut::VisitMut,
-    Field, Fields, Generics, Ident, Index, Item, ItemStruct, Lifetime, Member, PathSegment, Type,
-    TypePath,
+    Field, Fields, GenericParam, Generics, Ident, Index, Item, ItemStruct, Lifetime, LifetimeParam,
+    Member, PathSegment, Type, TypePath,
 };
 
 use crate::{
@@ -115,14 +115,19 @@ struct FieldInfo {
     pinned: bool,
     borrowed: Option<BorrowedInfo>,
     captures: BTreeSet<Capture>,
+    generic_lt_captures: BTreeSet<Lifetime>,
+    generic_ty_captures: BTreeSet<Ident>,
 }
 
 struct StructInfo {
     args: Args,
     struct_: ItemStruct,
     fields: Vec<FieldInfo>,
+    field_idx_map: BTreeMap<Ident, usize>,
     is_tuple_struct: bool,
     self_referential: bool,
+    /// Field lifetime generics.
+    field_lts: Generics,
 }
 
 pub(crate) fn expand_with_cfg(
@@ -215,6 +220,8 @@ fn expand(
     // Collect all bound lifetimes from generics.
     let bound_lifetimes: BTreeSet<&Lifetime> =
         struct_.generics.lifetimes().map(|x| &x.lifetime).collect();
+    // Collect all type parameters from generics.
+    let type_params: BTreeSet<&Ident> = struct_.generics.type_params().map(|x| &x.ident).collect();
     // Collect all fields.
     let field_idx_map: BTreeMap<Ident, usize> = struct_
         .fields
@@ -248,6 +255,9 @@ fn expand(
             let mut captures = BTreeSet::new();
             let wildcard_variance = Variance::default();
 
+            let mut generic_lt_captures = BTreeSet::new();
+            let mut generic_ty_captures = BTreeSet::new();
+
             // Infer lifetime based on the field referenced.
             // Bound lifetimes from struct generics take priority.
             //
@@ -261,7 +271,12 @@ fn expand(
             // would not be inferred as self-referential because `'a` is already bound by the
             // struct generics.
             Lifetime::visitor(|lt| {
-                if bound_lifetimes.contains(lt) || captures.contains(lt) {
+                if bound_lifetimes.contains(lt) {
+                    generic_lt_captures.insert(lt.clone());
+                    return;
+                }
+
+                if captures.contains(lt) {
                     return;
                 }
 
@@ -284,12 +299,21 @@ fn expand(
                 implicitly_borrowed.insert(capture.lifetime.ident.clone());
             }
 
+            GenericParam::maybe_type_params_visitor(|ident| {
+                if type_params.contains(ident) {
+                    generic_ty_captures.insert(ident.clone());
+                }
+            })
+            .visit_type(&field.ty);
+
             FieldInfo {
                 field,
                 member,
                 pinned,
                 borrowed: None,
                 captures,
+                generic_lt_captures,
+                generic_ty_captures,
             }
         })
         .collect();
@@ -322,6 +346,58 @@ fn expand(
     })
     .visit_generics(&struct_.generics);
 
+    // Create a lifetime parameter for each field.
+    let borrowed_fields: Vec<_> = fields.iter().filter_map(|f| f.borrowed.as_ref()).collect();
+    let mut field_lts = Generics {
+        lt_token: None,
+        params: borrowed_fields
+            .iter()
+            .map(|borrowed| {
+                GenericParam::Lifetime(LifetimeParam {
+                    attrs: Vec::new(),
+                    lifetime: borrowed.lifetime.clone(),
+                    colon_token: None,
+                    bounds: Default::default(),
+                })
+            })
+            .collect(),
+        gt_token: None,
+        where_clause: None,
+    };
+
+    // Insert necessary bounds to make types well-formed.
+    for field in fields.iter() {
+        let Some(borrowed) = &field.borrowed else {
+            continue;
+        };
+        let field_lt = &borrowed.lifetime;
+
+        // For each borrowed field that borrows from other fields, we need to insert outlive bounds.
+        for capture in &field.captures {
+            let lt = &capture.lifetime;
+            field_lts
+                .make_where_clause()
+                .predicates
+                .push(parse_quote!(#lt: #field_lt));
+        }
+
+        // For each borrowed field that references a generic, we also need to insert their outlive
+        // bounds so they can refer to generics.
+        for lt in field.generic_lt_captures.iter() {
+            field_lts
+                .make_where_clause()
+                .predicates
+                .push(parse_quote!(#lt: #field_lt));
+        }
+
+        for ty in field.generic_ty_captures.iter() {
+            field_lts
+                .make_where_clause()
+                .predicates
+                .push(parse_quote!(#ty: #field_lt));
+        }
+    }
+
     struct_.fields = Fields::Unit;
     let info = StructInfo {
         self_referential: fields
@@ -330,7 +406,9 @@ fn expand(
         args,
         struct_,
         fields,
+        field_idx_map,
         is_tuple_struct,
+        field_lts,
     };
 
     for field in &info.fields {
@@ -356,6 +434,7 @@ fn expand(
     let struct_def = generate_struct_def(&info);
     let unpin_impl = generate_unpin_impl(&info);
     let drop_impl = generate_drop_impl(&info);
+    let drop_order_check = generate_drop_order_check(dcx, &info);
     let projections = generate_projections(&info);
     let the_pin_data = generate_the_pin_data(&info);
 
@@ -364,6 +443,7 @@ fn expand(
         // We put the rest into this const item, because it then will not be accessible to anything
         // outside.
         const _: () = {
+            #drop_order_check
             #projections
             #the_pin_data
             #unpin_impl
@@ -568,6 +648,128 @@ impl #impl_generics
     }
 }
 
+fn generate_drop_order_check(dcx: &mut DiagCtxt, info: &StructInfo) -> TokenStream {
+    let ItemStruct {
+        ident: struct_name,
+        generics,
+        ..
+    } = &info.struct_;
+
+    // If the struct is not self-referential then we can just skip.
+    if !info.self_referential {
+        return quote!();
+    }
+
+    // Make sure fields are dropped earlier than the fields that they borrow.
+    for (i, field) in info.fields.iter().enumerate() {
+        let ident = field.member.as_ident();
+        for capture in &field.captures {
+            let borrowed_field = &capture.lifetime.ident;
+
+            if let Some(&borrowed_idx) = info.field_idx_map.get(borrowed_field) {
+                if i == borrowed_idx {
+                    // We need a strict outlive relationship, in case the lifetime is needed by the
+                    // field's drop glue.
+                    dcx.error(
+                        borrowed_field,
+                        format!("field `{ident}` cannot borrow from itself"),
+                    );
+                } else if i > borrowed_idx {
+                    dcx.error(
+                        borrowed_field,
+                        format!("field `{ident}` borrows `{borrowed_field}`, but drops later"),
+                    );
+                }
+            }
+        }
+    }
+
+    // The check above is necessary, but not sufficient.
+    //
+    // Consider this case:
+    // ```
+    // struct Foo {
+    //     x: &'b &'a (),
+    //     a: String,
+    //     y: PrintOnDrop<&'b str>,
+    //     b: String,
+    // }
+    // ```
+    // we need to ensure that `b` will strictly outlive `a`.
+    //
+    // Rust needs to ensure that types are well-formed; in the above example, `&'b &'a ()` is
+    // well-formed only if `a` outlive `b`. To avoid requiring everyone from having to express this
+    // bound explicitly when declaring a struct, the `'b: 'a` bound is inferred by the Rust
+    // compiler. However this causes an issue, where now `&'a str` can be coerced to `&'b str`
+    // because compiler thinks that it shorten the lifetime. We'll be able to put a reference to `a`
+    // into `y`; but `a` drops first, so when `y` drops, it accesses `a` and causes a
+    // use-after-free!
+    //
+    // Therefore, we must ensure the types contained within the struct has their implied bound being
+    // consistent with the actual lifetime relationship. We create a `__drop_order_check` function,
+    // with known lifetime bounds as bounds on the function, and asks Rust to *prove* that the types
+    // are wellformed, given the bounds that we understand.
+
+    let generics_with_field_lt = CombinedGenerics(vec![&info.field_lts, generics]);
+
+    let (_, ty_generics, _) = generics.split_for_impl();
+    let (impl_generics_with_field_lt, _, whr_with_field_lt) =
+        generics_with_field_lt.split_for_impl();
+
+    // Prove the wellformedness of struct fields with regarding to the bounds of
+    // `__drop_order_check`.
+    //
+    // Consider this case:
+    // ```
+    // struct Foo {
+    //     x: &'b &'a (),
+    //     a: String,
+    //     y: PrintOnDrop<&'b str>,
+    //     b: String,
+    // }
+    // ```
+    // we need to ensure that `b` will strictly outlive `a`.
+    //
+    // Rust needs to ensure that types are well-formed; in the above example, `&'b &'a ()` is
+    // well-formed only if `a` outlive `b`. To avoid requiring everyone from having to express this
+    // bound explicitly when declaring a struct, the `'b: 'a` bound is inferred by the Rust
+    // compiler. However this causes an issue, where now `&'a str` can be coerced to `&'b str`
+    // because compiler thinks that it shorten the lifetime. We'll be able to put a reference to `a`
+    // into `y`; but `a` drops first, so when `y` drops, it accesses `a` and causes a
+    // use-after-free!
+    //
+    // Rust needs to *prove* the wellformedness of the type below, taking into account only the
+    // explicitly defined bounds plus the bounds implied by the lifetime-erased struct (but not
+    // the full implied bound between the field lifetimes).
+    let wf_proofs = info.fields.iter().rev().map(|f| {
+        let ty = &f.field.ty;
+        let ident = f.member.as_ident();
+        if let Some(borrowed) = &f.borrowed {
+            let lt = &borrowed.lifetime;
+            quote!(
+                let #ident: &#lt mut #ty = loop {};
+            )
+        } else {
+            quote!(
+                let #ident: #ty = loop {};
+            )
+        }
+    });
+
+    let struct_span = struct_name.span().resolved_at(Span::mixed_site());
+    quote_spanned! {struct_span =>
+        #[allow(non_snake_case, unused)]
+        fn __drop_order_check #impl_generics_with_field_lt (
+            // This must be present so the function can *assume* the implied bounds on the erased
+            // struct. For example, if the struct has `&'a T`, Rust will infer `T: 'a`; we still
+            // want to assume these bounds as they are not relevant to the field lifetimes.
+            _: &#struct_name #ty_generics,
+        ) #whr_with_field_lt {
+            #(#wf_proofs)*
+        }
+    }
+}
+
 fn generate_projections(info: &StructInfo) -> TokenStream {
     let ItemStruct {
         vis,
diff --git a/rust/pin-init/internal/src/util.rs b/rust/pin-init/internal/src/util.rs
index 67ebb333710f..f19712a46a30 100644
--- a/rust/pin-init/internal/src/util.rs
+++ b/rust/pin-init/internal/src/util.rs
@@ -5,7 +5,8 @@
 use proc_macro2::{Ident, TokenStream};
 use quote::{format_ident, ToTokens};
 use syn::{
-    visit::Visit, Attribute, BoundLifetimes, GenericParam, Generics, Index, Lifetime, Member, Token,
+    visit::Visit, Attribute, BoundLifetimes, GenericParam, Generics, Index, Lifetime, Member,
+    Token, TypePath,
 };
 
 use crate::DiagCtxt;
@@ -85,6 +86,7 @@ fn display_name(&self) -> String {
 pub(crate) struct CombinedGenerics<'a>(pub(crate) Vec<&'a Generics>);
 pub(crate) struct CombinedImplGenerics<'a>(&'a CombinedGenerics<'a>);
 pub(crate) struct CombinedTypeGenerics<'a>(&'a CombinedGenerics<'a>);
+pub(crate) struct CombinedWhereClauses<'a>(&'a CombinedGenerics<'a>);
 
 impl CombinedGenerics<'_> {
     pub(crate) fn split_for_impl(
@@ -92,10 +94,13 @@ pub(crate) fn split_for_impl(
     ) -> (
         CombinedImplGenerics<'_>,
         CombinedTypeGenerics<'_>,
-        // A stub type so `split_for_impl` signature matches that of `syn`'s.
-        impl Sized,
+        CombinedWhereClauses<'_>,
     ) {
-        (CombinedImplGenerics(self), CombinedTypeGenerics(self), ())
+        (
+            CombinedImplGenerics(self),
+            CombinedTypeGenerics(self),
+            CombinedWhereClauses(self),
+        )
     }
 }
 
@@ -242,6 +247,31 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
     }
 }
 
+impl ToTokens for CombinedWhereClauses<'_> {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        self.0
+             .0
+            .iter()
+            .filter_map(|x| Some(x.where_clause.as_ref()?.where_token))
+            .next_back()
+            .unwrap_or_default()
+            .to_tokens(tokens);
+
+        let comma: Token![,] = Default::default();
+
+        for generics in self.0 .0.iter() {
+            let Some(where_clause) = &generics.where_clause else {
+                continue;
+            };
+
+            where_clause.predicates.to_tokens(tokens);
+            if !where_clause.predicates.empty_or_trailing() {
+                comma.to_tokens(tokens);
+            }
+        }
+    }
+}
+
 pub(crate) trait LifetimeExt {
     /// Get a visitor that call the provided function for all unbound lifetimes.
     fn visitor<'a>(f: impl FnMut(&'a Lifetime)) -> impl Visit<'a>;
@@ -329,3 +359,30 @@ fn visit_type_bare_fn(&mut self, bare_fn: &'a syn::TypeBareFn) {
         });
     }
 }
+
+pub(crate) trait GenericParamExt {
+    fn maybe_type_params_visitor<'a>(f: impl FnMut(&'a Ident)) -> impl Visit<'a>;
+}
+
+impl GenericParamExt for GenericParam {
+    fn maybe_type_params_visitor<'a>(f: impl FnMut(&'a Ident)) -> impl Visit<'a> {
+        struct TypeParamVisitor<F>(F);
+
+        impl<'a, F> Visit<'a> for TypeParamVisitor<F>
+        where
+            F: FnMut(&'a Ident),
+        {
+            fn visit_type_path(&mut self, ty: &'a TypePath) {
+                if ty.qself.is_none()
+                    && ty.path.leading_colon.is_none()
+                    && ty.path.segments[0].arguments.is_none()
+                {
+                    (self.0)(&ty.path.segments[0].ident);
+                }
+                syn::visit::visit_type_path(self, ty);
+            }
+        }
+
+        TypeParamVisitor(f)
+    }
+}

-- 
2.54.0

