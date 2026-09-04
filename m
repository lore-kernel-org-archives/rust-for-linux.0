Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020101.outbound.protection.outlook.com [52.101.195.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B413D4BAA0B;
	Fri,  4 Sep 2026 14:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531173; cv=fail; b=d4/1t96Sb9GLWkNNh1qGBrFvTt5vSpY/dQqxeAmPO07d9UrFtuvvQ1FU2R5SBzpmEBHt5av4xDT7DQz5AiKmudtNmJLWkURwnjKPOUt/DAvqDdDVh2GOIxgS7Op2ak9p4dpr/yhxbTzUl0aa6xJLFgecPXw2UpAJHWFkuHZtaIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531173; c=relaxed/simple;
	bh=RLK0b8eB9ZSo1/0R+Ph8XQcJ2dU5Aqv20n2lULZrxVU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t1BfzIgDs9lZJ91E4f3rQPK6EqqsYzn/wRph2nqsD+kFRd5nY8wMZYmCRvMIc/ydPcXXJ1S2UN/BDtMhKpnCQD8gIkUQK7vffgAcu1npF/ZqN4FV/aEsxLrzyNCxCx6elWzn4nBDVbX83ks3B3foroInVFpq/k3NyDe5wdCD3c8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=n2Gdaqt7; arc=fail smtp.client-ip=52.101.195.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="n2Gdaqt7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PU739MBfk/stZujTEaWMtQRFfuWb07y5sILdYwgyc/mxuue5Ty3HfJ7Ed9yVKLg8MD+6agvs2ayHAT9c34xY+S/IKCs5yKM0sf/BtJiMbKf8qrcASHvaZrEVi+qJf9v8LpAlFNW/7KHWfPCeITREOImgRY+MdVKTtYgslTHdHRMpGyWprrle5q4VoNbOlJe9gdlxiLCmlIsv2z/jY6CUfsWq2WvUvBKu9mtGVSl1+0p1BeT+lO54SJ7Ah3MfQRTIgkTaZt1ZAd8D/MjcSZKxQAnYkiqxaztIDI7R8pb/SVlgtUEZFp+Z1DbZpnArAicRoIl8UH20G2z5BthIbkLhRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7cGaE+NoD13JUaFexXjy2Fl/jVhHJUuwRfTIbRVki0=;
 b=KDjlfocMq1Z66PEsjL9DFfJge9WeKH+lomCMSsohxPMPBno5QG/shh/hZ4G12AVuVWuYSqUhsDDnsWlPs1OQQ70i4aJtb2LxBmvovljp+AiLEzkS5nA1PAMlRq4BPQ+t3MpZaV3HcqoJFMX9NPY/ZwycDqItxdVKRTQfG1/TFSF0kwDuuYFVPxRvTFsBOK6X2frKWKk1KRt5vjh9f7qhLal/Kul2FLsL71Rj4kEGmliejI9aN6cIhDXpFsR79nuSXXiBWkPPL0EYWJ+qFiZsIOsCIgYkNnZjtZWE4Xeu+PdzcfCoiO4Rd/oC04tKM/i56kE9WTkDENSxMjEm39gx3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7cGaE+NoD13JUaFexXjy2Fl/jVhHJUuwRfTIbRVki0=;
 b=n2Gdaqt7NoVTSA1LdgPL5QgsdrOHv3t/OfoDZixUuu9lPzG8AR+Ujg5YoZ4lUg+qKM9NLtPcQlRk74wuqXyPghkJE70iymmlFfQQQx6f4G1JKvWHm5wYURD3DYkaE5Rt58/kGn3ztRbvaMCqDlnMuwPM56oy6sPWhtI3YlMrl5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6690.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:12:38 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 14:12:38 +0000
From: Gary Guo <gary@garyguo.net>
Date: Fri, 04 Sep 2026 15:12:32 +0100
Subject: [PATCH 4/4] rust: pin-init: internal: init: support tuple struct
 constructor syntax
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-tuple-struct-v1-4-72c50bd037fd@garyguo.net>
References: <20260904-tuple-struct-v1-0-72c50bd037fd@garyguo.net>
In-Reply-To: <20260904-tuple-struct-v1-0-72c50bd037fd@garyguo.net>
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
 Gary Guo <gary@garyguo.net>, Mohamad Alsadhan <mo@sdhn.cc>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531156; l=19350;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=+RadHJsY5Xbi85OLnSHLYUzQBC08O4r6yyxtXElk2nk=;
 b=gtn1twVzcrRKD/CsMSZKuJuUNeT9ffZblZVS4RjpsWrizBNgQrFnoE3UcDbeIrA/nHpYE6rzQ
 oDevjvZYrSaDMybeaywH90wtyvfjEwf7upp297h3+iiJXN1fiLLpw+7
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0690.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: 0368b0e2-b1a4-4404-934a-08df0a8e933e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|376014|10067099003|6133799003|3023799007|18002099003|56012099006|5023799004|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	i7ZBLxhCePS7hV9psBOnM6xBdKKL50zMzANbavQklgnCiEW9ACZUcRR451344OWposYX2f6hvp58wcgJg5mSwVUiu40CAWBNoUpyRVLJCS/QqbRb7i75LqHvaJZ3y9E8m4D0ndOsYmp9sY2BDyP/NAmnsnYgG/Z2RJXjpalNsO8NiLMG129mHq7GgMQ1u+RaVFqVofp0LISfnQOBF2n+BKOFNdaZvESSVl5GzSeV011vsu6mypBRMvoNTxY6syyt+JmJV++SzK5OkJNbuOsCs9QJsURHv/XkrmnyngDX1xkZBfCQ8vhjFykYLJ6YxQX07pZy49A03xl5Nc+He6pBLztc8aB0xnNuo74jBkh7ZyuLGbaaZ2uZ1BMeZ6osiJudO3Vys7tljgNWE8yRhiQ7fmxNc3Zmi6AHc2ze+/VgDc8IjW1ihHB86pUPjvhRFLAfwZZhqNgs9fHUYZTa46lxRECzEFe6QT5tv8vz7ywDTrzZsM/98SEDwHyyQBMjPPevfgvyOYMqsy28fBBtHAqfXyx9S084NlOdyQkeXi5fdcuSR/ACCPNMEbJ7NXR2oWsi9vT/oxqf49pkYNmTs70UMLdu8IszZvqZ6hrDpqStb2DNvWGPeS80b9KoZkRPfLd4ovMWnuymG1kbWawvgAUDFSV70xdRgQtVZZl0PSNZStdQbqdilGgkDWJS+E79USSR6VVTvtM54cBDrpOZLx9L+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(56012099006)(5023799004)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlFNWFdzcXFhTE1uUW8vMnVXaitybUZqa1N6ZlpMRWp4R0drdmFmRWZyV21C?=
 =?utf-8?B?M2VwQm05TUNlb3FFdHJHUUpud2ZObWZTTDIwRUVQNEtYVWdzanNHRlc2a2pC?=
 =?utf-8?B?dkpBckVvSlRSK3NQSmZKUFpmcHpLQWVQTW5mY3dwMGNKK1I0YmxXMW9jOHpq?=
 =?utf-8?B?b0JpempOeExsaG00cTdyNnpWQVNQMVhDVys1dDRwVVZzV2VVZXQ4TFpMaHpm?=
 =?utf-8?B?NXo1WFpxZFR5WGdFbTc5L0Q0OHZOcm1NRUpRTS9wYkhWb0FTNXhudndWNGJz?=
 =?utf-8?B?REJlZUE2bnJEeGlWalh6cDlldUtlc0doQ1JzbmRCK2ZvUGFzU3dIQ0lEcVg0?=
 =?utf-8?B?YzRuaXp0T2k1ZW5zNU9JYUJEdnNWNDlCTnpNd2txaW1Gd0hVWjI0dS92UmVF?=
 =?utf-8?B?bzZkTitoNmhCUVFNV1ZRMktFUnBoQkRqbktPTVorbVpzeVQrVThIZWFiK2hI?=
 =?utf-8?B?U0RoY1J3dGJMVW5YSDNPRnNQdjBhZUxJZFF1YjhFcXJUeHFXcThWK2laelNL?=
 =?utf-8?B?emZUdjhLUUc0T1ZvNjJJNm5XMENSZWFSNG00aVF6YWw3dldhZFFrVUFvaVV5?=
 =?utf-8?B?RkY1RW5PU2wyejd6ZXQ3N29lVVg2TGxhUnBMenZSRldoVVhWOTRhSmVFbm8r?=
 =?utf-8?B?bTlybmFyZlY0aU5RNGVSS2kxeWJTa2puV05kYU1KTHhrVzFqWEVMWWRPTEFW?=
 =?utf-8?B?Y3RrMXczQ3o0b0g2NUdJclliNlY3K0QyUHY5V0J5R2NaTkpFUWw3Q3FrVGZY?=
 =?utf-8?B?M0V1VW1UVEVXN1A1b09GWTFIZGNheUlnckVRUmQ3NXpTbDJlVFFCcVg3R3h2?=
 =?utf-8?B?ZzRhYlZCWG5yOU9SOFQxYllMclNuM1d3WjdUNnloMWhSN1BPMkpnano0bUE3?=
 =?utf-8?B?bEhmS1l2Mll4TWdsMjVMT0VFVWhtTGVpRjg2UUJvUktCR1A0VWxMZ0dZQXdD?=
 =?utf-8?B?RGFJekl2R3pKcGlFVnEwdmQ5SFRsWFhJTTFJNjBRTC94WjZqSUVMa2Jkemc4?=
 =?utf-8?B?U3QxbEpHcUV2eFZ1cGo5TkdvWjJPazNncWtpZ0s4LzRWKzYxaUFZUVhpcU9D?=
 =?utf-8?B?a3FRVG5aaHl1UWgwcHdFdFBmV2trMjMrdjhPVXpuaGtyclNnRzIyM3JVbHNS?=
 =?utf-8?B?VUVEUHdIRkwwaTRXZG5weTcxNVpXeWQ2TzVKRXhGdHIvaDljdHFKWS9EaGRV?=
 =?utf-8?B?WW1wTmFCUnZvdVV2bHFkZWxSK0M1b1VvVGVJMHVIRC9xY0RFWENDZHI2UmJK?=
 =?utf-8?B?RmVBZ1k2YXJWemhBV0cvUGY0TG5tem1pZWQ1Z28vS1NnQ1ZxZjlRTWhXZnN5?=
 =?utf-8?B?VnY3RGMycXFtYVlDSXVUWUlQUzdIdDc4eXdGU3pPdjQvbmx2Z1MvUnhVSTZE?=
 =?utf-8?B?L01NblRQeEJmYTN6MkNkUEdadVYrWUx1TUIyQ2ZaV1BmR3VCWm1OWGtuVEww?=
 =?utf-8?B?djRYZG5JNDl5VU5VMHF0V01FMVFDbkNIZ3BvcFhQc3hyZldPclRHOCswVTh0?=
 =?utf-8?B?Sk5adDVrVk1vbzhvSDhiMEZoa2VWWmN1NFFZNUViUGcybWZjTkREMWZVMnd6?=
 =?utf-8?B?SlMyMUxNYlRUR2wvZkZ0RncwZDVtaWpwSEVlMUdRUHVSU1lUTjlldzBmbnlJ?=
 =?utf-8?B?ZFVtU1VNUHM3a2JFUTZJdVRLdEdtbjQ5azdiZEVCSVQ1UVk0YUV2UXpVVWxO?=
 =?utf-8?B?N1BCeEMxSFlXQmIwSzFRQUlMalk4NDl1NnFCZlBOUkM4STIxYk42UXBGdnla?=
 =?utf-8?B?L0RGY3JtNHhjbmhDN1NQeFhwcUNtY2g2bFZvL2cvTlZmZWdZM1lrQlovZ25y?=
 =?utf-8?B?V09KN0hMRXJLTXJRa1ZQampmNE5jc2hkajdISFlVQjE2bFJJa0d4VHFiczFi?=
 =?utf-8?B?WG5IOFpTbmx5TTRtOXpuZU9DY1h4M0tuSFpxVkhKcS8wVGJPOXBkRmFPUUsr?=
 =?utf-8?B?cjg1ejMzZ2VnUzJVeU9nQ3F2N0huZGJ5WmsyU0FiVk1rVXFFNDZnYndwdHhu?=
 =?utf-8?B?Zk0zM2tVZkVXa2Rud2p5RDFDU2RGOXh3SjdNamhqMmVWZlZKanZJSFRjRDhL?=
 =?utf-8?B?d29CSGRXWWFkYUtSOEpQZzI3WmJWTzVkdG5RN2I3ZnY0d3FSWTVJVS9LMmt0?=
 =?utf-8?B?K2lpNUc1NCswL3ZTL1VOMGsybVFDVFE4cW5OSFVYdkFtanQ1SDYvUXpxRkdH?=
 =?utf-8?B?V1R2akg2YUs4NE5EbFpVOWIvU1B4RWRhYmwySFZObk5CdEZsSXo2aS8rZE1Q?=
 =?utf-8?B?L1pIaE1RYm9BVUErbzdCUXdXdksxcmxsdE83OG1mdVpPc0lDMkh1Y2doQzVE?=
 =?utf-8?B?bVpFeW1BQkkrVi9YTGsvTmJXTUo1a2xGQzVUQXo0bGZrRmpWdm5kUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0368b0e2-b1a4-4404-934a-08df0a8e933e
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:12:38.5688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQ9ORLdU67znpAmqPW5isNNwua6ZVj43HVsoi3c2BGoH7oJ+xZ4FnM1tpGO7HC+kCYvrbu3zT7vqOkAqquanRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6690

From: Mohamad Alsadhan <mo@sdhn.cc>

A tuple struct whose fields are all set to a value reads better written
like a call to its constructor than with the indices spelled out:

    pin_init!(Foo(value, value))

Parse the two forms into separate types and rewrite the constructor
arguments into the indexed fields they are shorthand for, so that only the
parser has to know about the second form.

The arguments have no names, so they cannot use `<-`. Parse it anyway and
reject it afterwards, which reports the position of every offending `<-`
rather than stopping at the first one.

`cfg` needs different treatment for tuple constructor syntax. As non-derive
proc macros are invoked before cfg is resolved, the macro cannot know
whether a field survives, and dropping a tuple field renumbers every field
after it. That cannot be expressed by attaching a `cfg` attribute to the
initializer of a single field. Thus, resolve tuple field cfgs up front
instead, by generating two cfg-gated invocations of the macro with one
field resolved in each. This is the approach of commit 5bbf2b2deb94 ("rust:
pin-init: internal: rework how `#[pin_data]` handles cfg"), and it is
linear time because only one of the two branches is ever expanded. Struct
expression syntax do not renumber, so using tuple structs with struct
syntax can keep using the existing attribute-based handling.

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://github.com/Rust-for-Linux/pin-init/pull/165
Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
[ Pre-expand cfgs for tuple init syntax. Use generics instead of separate
  types for normalization - Gary ]
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 381 ++++++++++++++++++++++++++++++++++---
 rust/pin-init/internal/src/lib.rs  |  11 +-
 rust/pin-init/src/lib.rs           |  16 ++
 3 files changed, 383 insertions(+), 25 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 5920bb281a50..dc5dfb2ca114 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -1,14 +1,15 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
 use proc_macro2::{Span, TokenStream};
-use quote::{format_ident, quote};
+use quote::{format_ident, quote, ToTokens, TokenStreamExt};
 use syn::{
-    braced,
+    braced, parenthesized,
     parse::{End, Parse},
     parse_quote,
-    punctuated::Punctuated,
+    punctuated::{Pair, Punctuated},
     spanned::Spanned,
-    token, Attribute, Block, Expr, ExprCall, ExprPath, Ident, LitInt, Member, Path, Token, Type,
+    token, Attribute, Block, Expr, ExprCall, ExprPath, Ident, Index, LitInt, Member, Path, Token,
+    Type,
 };
 
 use crate::{
@@ -16,14 +17,87 @@
     util::*,
 };
 
-pub(crate) struct Initializer {
+pub(crate) struct Initializer<Kind = InitExprKind> {
     attrs: Vec<InitializerAttribute>,
     this: Option<This>,
+    kind: Kind,
+    error: Option<(Token![?], Type)>,
+}
+
+pub(crate) struct InitExprStruct {
     path: Path,
     brace_token: token::Brace,
     fields: Punctuated<InitializerField, Token![,]>,
     rest: Option<(Token![..], Expr)>,
-    error: Option<(Token![?], Type)>,
+}
+
+pub(crate) struct InitExprTuple {
+    path: Path,
+    paren_token: token::Paren,
+    fields: Punctuated<InitTupleField, Token![,]>,
+}
+
+pub(crate) enum InitExprKind {
+    Struct(InitExprStruct),
+    Tuple(InitExprTuple),
+}
+
+struct InitTupleField {
+    attrs: Vec<Attribute>,
+    /// `<-` is not valid in constructor syntax; it is parsed anyway so that it can be rejected
+    /// with a proper diagnostic instead of a parse error.
+    left_arrow_token: Option<Token![<-]>,
+    value: Expr,
+}
+
+impl InitExprTuple {
+    fn normalize(self) -> InitExprStruct {
+        let InitExprTuple {
+            path,
+            paren_token,
+            fields,
+        } = self;
+        InitExprStruct {
+            path,
+            brace_token: token::Brace {
+                span: paren_token.span,
+            },
+            fields: fields
+                .into_pairs()
+                .enumerate()
+                .map(|(index, pair)| {
+                    let (field, comma) = pair.into_tuple();
+                    let span = field.value.span();
+                    let field = InitializerField {
+                        attrs: field.attrs,
+                        kind: InitializerKind::Value {
+                            member: Member::Unnamed(Index {
+                                index: index.try_into().unwrap(),
+                                span,
+                            }),
+                            value: Some((Token![:](span), field.value)),
+                        },
+                    };
+                    Pair::new(field, comma)
+                })
+                .collect(),
+            rest: None,
+        }
+    }
+
+    fn validate(&self, dcx: &mut DiagCtxt) -> Result<(), ErrorGuaranteed> {
+        let mut result = Ok(());
+        for field in &self.fields {
+            if let Some(left_arrow_token) = &field.left_arrow_token {
+                result = Err(dcx.error(
+                    left_arrow_token,
+                    "`<-` is not supported in tuple constructor syntax; name the fields by index \
+                     instead, e.g. `Type { 0 <- initializer, 1: value }`",
+                ));
+            }
+        }
+        result
+    }
 }
 
 struct This {
@@ -71,16 +145,103 @@ struct DefaultErrorAttribute {
     ty: Box<Type>,
 }
 
-pub(crate) fn expand(
+pub(crate) fn expand_with_cfg(
+    initializer: Initializer,
+    default_error: Option<&'static str>,
+    pinned: bool,
+    dcx: &mut DiagCtxt,
+) -> Result<TokenStream, ErrorGuaranteed> {
+    let initializer = match initializer.kind {
+        InitExprKind::Tuple(expr) => {
+            expr.validate(dcx)?;
+
+            let mut initializer = Initializer {
+                attrs: initializer.attrs,
+                this: initializer.this,
+                kind: expr,
+                error: initializer.error,
+            };
+
+            // Removing a tuple field renumbers every field after it, which cannot be expressed with
+            // a `cfg` attribute on the initializer of a single field. Therefore, resolve tuple
+            // field cfgs before continuing. Struct expression syntax uses explicit numbers, so
+            // there is no need to pre-expand them and we only need to emit their cfgs on generated
+            // code.
+            for (field_idx, field) in initializer.kind.fields.iter_mut().enumerate() {
+                let cfg = field.attrs.extract_cfg_attrs();
+
+                if cfg.is_empty() {
+                    continue;
+                }
+
+                let true_initializer = initializer.to_token_stream();
+                initializer.kind.fields = initializer
+                    .kind
+                    .fields
+                    .into_pairs()
+                    .enumerate()
+                    .filter(|&(index, _)| index != field_idx)
+                    .map(|(_, pair)| pair)
+                    .collect();
+
+                let false_initializer = &initializer;
+
+                let macro_name = if pinned {
+                    quote!(::pin_init::pin_init)
+                } else {
+                    quote!(::pin_init::init)
+                };
+
+                // Resolve one field at a time until we've got no more tuple field cfgs.
+                //
+                // This is linear time because macro invocations with false cfg will not be
+                // expanded.
+                return Ok(quote! {
+                    {
+                        // Use `{}` delimiter here so semicolon is not required, otherwise the
+                        // expression becomes unit type.
+                        #[cfg(all(#(#cfg,)*))]
+                        #macro_name! { #true_initializer }
+
+                        #[cfg(not(all(#(#cfg,)*)))]
+                        #macro_name! { #false_initializer }
+                    }
+                });
+            }
+
+            // No cfgs left, we can normalize the initializer to the struct kind.
+            Initializer {
+                attrs: initializer.attrs,
+                this: initializer.this,
+                kind: initializer.kind.normalize(),
+                error: initializer.error,
+            }
+        }
+
+        InitExprKind::Struct(expr) => Initializer {
+            attrs: initializer.attrs,
+            this: initializer.this,
+            kind: expr,
+            error: initializer.error,
+        },
+    };
+
+    expand(initializer, default_error, pinned, dcx)
+}
+
+fn expand(
     Initializer {
         attrs,
         this,
-        path,
-        brace_token,
-        fields,
-        rest,
+        kind:
+            InitExprStruct {
+                path,
+                brace_token,
+                fields,
+                rest,
+            },
         error,
-    }: Initializer,
+    }: Initializer<InitExprStruct>,
     default_error: Option<&'static str>,
     pinned: bool,
     dcx: &mut DiagCtxt,
@@ -99,7 +260,10 @@ pub(crate) fn expand(
             } else if let Some(default_error) = default_error {
                 syn::parse_str(default_error).unwrap()
             } else {
-                dcx.error(brace_token.span.close(), "expected `? <type>` after `}`");
+                dcx.error(
+                    brace_token.span.close(),
+                    "expected `? <type>` after initializer",
+                );
                 parse_quote!(::core::convert::Infallible)
             }
         },
@@ -377,11 +541,8 @@ fn make_field_check(
     }
 }
 
-impl Parse for Initializer {
-    fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
-        let attrs = input.call(Attribute::parse_outer)?;
-        let this = input.peek(Token![&]).then(|| input.parse()).transpose()?;
-        let path = input.parse()?;
+impl InitExprStruct {
+    fn parse_with_path(path: Path, input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
         let content;
         let brace_token = braced!(content in input);
         let mut fields = Punctuated::new();
@@ -408,6 +569,51 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
             .peek(Token![..])
             .then(|| Ok::<_, syn::Error>((content.parse()?, content.parse()?)))
             .transpose()?;
+        Ok(Self {
+            path,
+            brace_token,
+            fields,
+            rest,
+        })
+    }
+}
+
+impl InitExprTuple {
+    fn parse_with_path(path: Path, input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
+        let content;
+        let paren_token = parenthesized!(content in input);
+        let mut fields = Punctuated::new();
+        while !content.is_empty() {
+            fields.push_value(InitTupleField {
+                attrs: content.call(Attribute::parse_outer)?,
+                left_arrow_token: content.parse()?,
+                value: content.parse()?,
+            });
+            if content.is_empty() {
+                break;
+            }
+            fields.push_punct(content.parse()?);
+        }
+        Ok(InitExprTuple {
+            path,
+            paren_token,
+            fields,
+        })
+    }
+}
+
+impl Parse for Initializer {
+    fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
+        let attrs = input.call(Attribute::parse_outer)?;
+        let this = input.peek(Token![&]).then(|| input.parse()).transpose()?;
+        let path = input.parse()?;
+        let kind = if input.peek(token::Brace) {
+            InitExprKind::Struct(InitExprStruct::parse_with_path(path, input)?)
+        } else if input.peek(token::Paren) {
+            InitExprKind::Tuple(InitExprTuple::parse_with_path(path, input)?)
+        } else {
+            return Err(input.error("expected curly braces or parentheses"));
+        };
         let error = input
             .peek(Token![?])
             .then(|| Ok::<_, syn::Error>((input.parse()?, input.parse()?)))
@@ -426,10 +632,7 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
         Ok(Self {
             attrs,
             this,
-            path,
-            brace_token,
-            fields,
-            rest,
+            kind,
             error,
         })
     }
@@ -499,3 +702,137 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
         }
     }
 }
+
+impl<Kind: ToTokens> ToTokens for Initializer<Kind> {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        let Self {
+            attrs,
+            this,
+            kind,
+            error,
+        } = self;
+        tokens.append_all(attrs);
+        this.to_tokens(tokens);
+        kind.to_tokens(tokens);
+        if let Some((question, ty)) = error {
+            question.to_tokens(tokens);
+            ty.to_tokens(tokens);
+        }
+    }
+}
+
+impl ToTokens for InitExprKind {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        match self {
+            Self::Struct(init) => init.to_tokens(tokens),
+            Self::Tuple(init) => init.to_tokens(tokens),
+        }
+    }
+}
+
+impl ToTokens for InitExprStruct {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        let Self {
+            path,
+            brace_token,
+            fields,
+            rest,
+        } = self;
+        path.to_tokens(tokens);
+        brace_token.surround(tokens, |tokens| {
+            fields.to_tokens(tokens);
+            if let Some((dotdot, expr)) = rest {
+                dotdot.to_tokens(tokens);
+                expr.to_tokens(tokens);
+            }
+        });
+    }
+}
+
+impl ToTokens for InitExprTuple {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        let Self {
+            path,
+            paren_token,
+            fields,
+        } = self;
+        path.to_tokens(tokens);
+        paren_token.surround(tokens, |tokens| fields.to_tokens(tokens));
+    }
+}
+
+impl ToTokens for InitTupleField {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        let Self {
+            attrs,
+            left_arrow_token,
+            value,
+        } = self;
+        tokens.append_all(attrs);
+        left_arrow_token.to_tokens(tokens);
+        value.to_tokens(tokens);
+    }
+}
+
+impl ToTokens for InitializerAttribute {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        match self {
+            Self::DefaultError(DefaultErrorAttribute { ty }) => {
+                quote!(#[default_error(#ty)]).to_tokens(tokens);
+            }
+        }
+    }
+}
+
+impl ToTokens for This {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        let Self {
+            _and_token,
+            ident,
+            _in_token,
+        } = self;
+        _and_token.to_tokens(tokens);
+        ident.to_tokens(tokens);
+        _in_token.to_tokens(tokens);
+    }
+}
+
+impl ToTokens for InitializerField {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        let Self { attrs, kind } = self;
+        tokens.append_all(attrs);
+        kind.to_tokens(tokens);
+    }
+}
+
+impl ToTokens for InitializerKind {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        match self {
+            Self::Value { member, value } => {
+                member.to_tokens(tokens);
+                if let Some((colon, expr)) = value {
+                    colon.to_tokens(tokens);
+                    expr.to_tokens(tokens);
+                }
+            }
+            Self::Init {
+                member,
+                _left_arrow_token,
+                value,
+            } => {
+                member.to_tokens(tokens);
+                _left_arrow_token.to_tokens(tokens);
+                value.to_tokens(tokens);
+            }
+            Self::Code {
+                _underscore_token,
+                _colon_token,
+                block,
+            } => {
+                _underscore_token.to_tokens(tokens);
+                _colon_token.to_tokens(tokens);
+                block.to_tokens(tokens);
+            }
+        }
+    }
+}
diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index 4d8ff86484b6..c488019d6250 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -49,12 +49,17 @@ pub fn maybe_derive_zeroable(input: TokenStream) -> TokenStream {
 #[proc_macro]
 pub fn init(input: TokenStream) -> TokenStream {
     let input = parse_macro_input!(input);
-    DiagCtxt::with(|dcx| init::expand(input, Some("::core::convert::Infallible"), false, dcx))
-        .into()
+    DiagCtxt::with(|dcx| {
+        init::expand_with_cfg(input, Some("::core::convert::Infallible"), false, dcx)
+    })
+    .into()
 }
 
 #[proc_macro]
 pub fn pin_init(input: TokenStream) -> TokenStream {
     let input = parse_macro_input!(input);
-    DiagCtxt::with(|dcx| init::expand(input, Some("::core::convert::Infallible"), true, dcx)).into()
+    DiagCtxt::with(|dcx| {
+        init::expand_with_cfg(input, Some("::core::convert::Infallible"), true, dcx)
+    })
+    .into()
 }
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index f020b383851e..4a1368741329 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -654,6 +654,20 @@ macro_rules! stack_try_pin_init {
 /// # Box::pin_init(demo()).unwrap();
 /// ```
 ///
+/// A tuple struct whose fields are all set to a value can also be written like a call to its
+/// constructor:
+///
+/// ```rust
+/// # use pin_init::*;
+/// #[pin_data]
+/// struct Pair(usize, usize);
+///
+/// # fn demo() -> impl PinInit<Pair> {
+/// let initializer = pin_init!(Pair(42, 64));
+/// # initializer }
+/// # Box::pin_init(demo()).unwrap();
+/// ```
+///
 /// Arbitrary Rust expressions can be used to set the value of a variable.
 ///
 /// The fields are initialized in the order that they appear in the initializer. So it is possible
@@ -777,6 +791,8 @@ macro_rules! stack_try_pin_init {
 /// - Fields that you want to initialize in-place have to use `<-` instead of `:`.
 /// - Tuple struct fields are named by their index, as in `0: value` or `0 <- initializer`. They
 ///   are not exposed by a `let` binding, since they have no name to bind.
+/// - A tuple struct can also be initialized with constructor syntax, as in `Type(value, value)`.
+///   Since its arguments are not named, they cannot use `<-`; write them out by index instead.
 /// - You can use `_: { /* run any user-code here */ },` anywhere where you can place fields in
 ///   order to run arbitrary code.
 /// - In front of the initializer you can write `&this in` to have access to a [`NonNull<Self>`]

-- 
2.54.0

