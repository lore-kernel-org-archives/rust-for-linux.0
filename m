Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021090.outbound.protection.outlook.com [52.101.100.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455543CEB9A;
	Thu,  8 Oct 2026 19:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487653; cv=fail; b=RzuhPdGPH5vrFM8KRqep8Vz/gBKJMPX1H+igemMr+yhhORE4DPMktSvhaz6QN+hl6pJOpj+uFh/zi1HJN/P8UVLYG6wt+7yvoSHBT77nESTUJgCInsor4bCL3axhX+PmQnt73lb/qEw4Y72CvEk/OnLFeSwfl7H10JvEwGTkuzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487653; c=relaxed/simple;
	bh=HkvMcR9fEeKcwgkd2GzG8qPYUAxN/6nScxY0L6mi9RU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IT99GQQjO58Os0NQF6DZNQjsuQOy6N7D0BMlCdcZp3wNU+OA9UziNThTrm+cVAz0BpUekOv1FM8aNAAfatlhr9ePBav466094SHl8whAY3rhL34P4VOFpCGrF9O4/7F5ksB8l2mQLyrPnia2sO2Eh9MQht/lVISTx6NfqczPK40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=HVfcNJho; arc=fail smtp.client-ip=52.101.100.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="HVfcNJho"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fx4KtG8nBCUe5Nr4xIkvn2KRYHBkXWAyZtfR6/AgyF6uUIb7c0aS1ZFEmgy7oM5wfkfoaf0blKrGjc29zFxu3n7xvNgbSCCm21J2jGvFooD+I8rXUum3j32Izp3lJ8wixKKLBgUyuQbvzrTkjwdfXhdpSx6TWB8B1q5WuN7zUvnB8rokMwxtHZC3JCf6eM7TfrtcSnAOqk74fhwMBArcFIRtAI9BlM4tu20s9e4habpx/F+L10NKFqm4lMlX6dUqQUj7G3Md1+0A+cKnupLVCKfbR3zmcZnGYtRHxB4SbiVSrG8scaQYiwlgAnfLlDgCd2K7eUlZ6TehBXuUex+xpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRNwHtq1s3gs5k5wQOVSqVGDuoZN0t722XO2sVsSK9w=;
 b=wd4Bx8GgipboYGDjb0AXjxZtV6eOqJkepZHRogbsZlrqSCAHhD5q7z+/f2BD9w0XfYPsEqE/nqrO8E2+KZZ3qnYU4TLsdUFoFq9Egc4Ro++WTczhBuogwBTFIwxnowQAo0O3d0zHUA0z6EC9Zrke7NO4jS5VHsL8oQvcCzrIDniT7+m+Xt54uWCc96DLpc4H2yeBuzplyRKfEx3EOlKWSBdeOW4/XUwjmVy8mHbGKNKIShkEXVHCJzN4P04inohb+4idbhtC4hK36IY2QSV3z0CFvd8IDOtNFpHTaYfQLvlwQbDXtm5RsyrZVrzi7tLt+G9V6afFmDaxewD5ka3qKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRNwHtq1s3gs5k5wQOVSqVGDuoZN0t722XO2sVsSK9w=;
 b=HVfcNJho8H4bA1O6fi73f0TEdzAl9wH5VGs1rCOYNk9Lv89J8c2KLQaDltNKgmqMcdMA2jLsTrjJ65nBN2aitTX3sX9sGUP/MQvC43cZUL4Hx8aUtOS6tzT5GrrdXE2oTsoHasBsAFjWFVLqX0iTmgHtLsABPNM2/lXB3CQs2b4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:47 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:47 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:38 +0100
Subject: [PATCH v2 14/20] rust: pin-init: internal: pin_data: support
 mutable borrows
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-14-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13876; i=gary@garyguo.net;
 h=from:subject:message-id; bh=HkvMcR9fEeKcwgkd2GzG8qPYUAxN/6nScxY0L6mi9RU=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcffFVy2fmazTKf2fZFL8OHqQ/6iXh9NSy8UHdfZ8
 iXlP7+VrkxHKQuDGBeDrJgii0c3Y9omxtmyl7XKX8LMYWUCGcLAxSkAE7mcy8iweFpmbK7cJ8U7
 592/BHgGzAh9psR2V3mC1b5PN5atLuVoZmTYcff+jNRp1uHeC/YbTEjt8dmz7P5bfpF2nnzflNX
 t/ad5AIKWSF4=
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
X-MS-Office365-Filtering-Correlation-Id: ead1e619-2859-499d-c774-08df2572185b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|6133799003|18002099003|10067099003|22082099003|921020|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	lnNvYzLEZYtod3eSEJyzShGwnnf3qnMGd0yy7Aj6tqEFEqraWU3qzitSUscBPTlIktUE5VXozyH1z38eQe3tYxUopLJmZuZl13Z3Q/r9eplBIpXoV0zIKZHwBnM5OvkeYyDYF5fTZdg/scpSx6+1I1gI6tJhAuJkp+Tpl1r4l7SkLQdOXbDCv8DcC/EkEdDPMCpVTbmyVO1B+p0zyx0GSZIGKbz5rPDek6Vpf9pb4u7Tz/txe568/c1FxD3hHZO2o7JKH0k60CO06avwL4mhzuEdLjGLncVay7Mmd8EMPkTCmnlWIreBjChL7LWMN/r5X2HSe5RE0oaZzDSPanIzNgdM5l92mH1dAm67hLej11Hkb58thsiPsfvPeX0oGIEIk+PPxjL6BFl5mtZ34t1RoQYJ5LJWip0tWfz7ecyaNGfNEtSokBrqdZxj04T7E/n7M9vH8zlgITcnvg75o3tmGK3MYNFIGQ+O7Zxc+d3uyCkZ/lZlkiFBgAYTjq1e++YqsFRYJ6ZPhth3nLfYwEo5/c8s0LOAJZx9Eqzhaiijec+2uFrgUefTTCTQrZVmY7u/gKPgKQCniy/8H7mGzD8T3vL94nQC40jkbKkQvrxLgQCYHKU1J7tdg0rnG1VSRtyAF4Zc/eoEG4FLwIW7p2dzBrYEp5jJwMsmhjJdLy33tZqNM4vvE0Yd3VLs84mNVmrcXF3GhJP7tm4iirw6FsDCqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(6133799003)(18002099003)(10067099003)(22082099003)(921020)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTgrQUR4NE05aGFGcGkrVG9yR0t2Nit4bWFGTUJjZmtiUEhMOS9Camd0VW5p?=
 =?utf-8?B?b2xZMG1SR1FCYk8wMnYzb2xCMHJ3eUZsQW5WY2VMQW4rTENxdlhNRVB3R3hT?=
 =?utf-8?B?VWo5UklFaEo5bWliQkx1WXFjamwwcXErUnY3UkxlOForQ2ZhdWR1T20wVnFx?=
 =?utf-8?B?WXNwRTJlSjJtVEE4UEpNd2pkWmQvb1Q3cjNXSzJGTGFESVprUEVmRTNRWkNo?=
 =?utf-8?B?SFhHRC94VVNKMGpDcG54blpvZDI4ci9nMEZhT3ErSXRYOWF2cnlFYTRRZHRI?=
 =?utf-8?B?bWVNY2c0TEhpakttRWdHMnhFMXNTZTRpTHlWdUpmZ29lOGhaempMVmFFMS9M?=
 =?utf-8?B?WXdSZVZHSFpNSFY2K2wrS3FnUUtmdHRBRW5nT3oxbkg1Ty9kUWdxWWs5REFU?=
 =?utf-8?B?cXMwNGg3MXRrQk50dnlON2VtTVBpbTNlbmIvS1JPK3ZFKzdrU3pxT040UUFu?=
 =?utf-8?B?SnpFbEZnbkx3Sk9mWko1OXZTcTFicHdQd1QvdWlCL1VJUWplc0FwNjdCdEJ2?=
 =?utf-8?B?QXY5TlZibURqVlQrdXdqZE8zRkVXbS9lT0JtZFpwSWt3V3YxS1p0bEJUWlda?=
 =?utf-8?B?MEl3THVDWDZpS3QxUWV4TithMlJBRFR0UmZBTFdZWHU0NXd4U0J3KzNyU2wx?=
 =?utf-8?B?NDI2TTFkdlVxQ0lEUHJKYld5V2NFRjFZYzFHcS8xYytQcm5lT2N3bWs5L1ND?=
 =?utf-8?B?WXduQlBrekFieDFycUloQzJWcHdCN0pDMTJwZmgxaHlTYS9hTFljaGFqVkN5?=
 =?utf-8?B?ZTQvQjhoWVREMG51WmF1VVFLN2JKazhVWE1sZFFnaXdGNWlqbHByWDdIT3ls?=
 =?utf-8?B?RVhWekdOOFJ3MXVwaERvWmNUcTErZlUvSDBxc0ErdWZiZGdqMmlZekpNbjZp?=
 =?utf-8?B?SU5Cc3BqNDZ2YlJLczg4Y0tNclByME5YZUJhY1JZaFdtOTNCQXlMeDZweHRH?=
 =?utf-8?B?aXR6b0NEeUs0YTFPNmhnQ0VNY2tvb0g4Z2VyNFhKMGVXcUEzV3lGSWo3OTQ3?=
 =?utf-8?B?STE2UEdWOVVpejBZOVhDcVhQMEJMUTlJNi9OK2tJdlJGL25HKzJHOUVwRnJH?=
 =?utf-8?B?V1BzUnZabW8xL0h5UXN0ZEdudHFuNkxvdk9RS0xVTURmUUdpQ0NHU0t6dTRu?=
 =?utf-8?B?ejIxd0oxVk9LL01QTlcwRmxQV1NKcXFWU2h1bzI5N0EwbTd6Q3VCTkNJbVEv?=
 =?utf-8?B?SWtlbFNGTnFXUi9HTWxUWnVSQzR3TmZhdkRHeXFDRk9UbytQd0UvYm80K3p2?=
 =?utf-8?B?MS9tSnRSMGJaWXRITkxneG5qNzlTVFE2Z3JLOWNFN3p5SWpQM3gwZDlzbmFr?=
 =?utf-8?B?ZS9XSFVYdzFCbFByU1FJV3VSdXNUT08xRDNNblBLUUhhbXhIMjhUNWgxZjlE?=
 =?utf-8?B?VjFOVG45SC93VCtQekVGZ2dkWk1aSE1HVVB2RmJLQlMrL1dMMnN1ZUxaZGlx?=
 =?utf-8?B?YncyUlh3RnljdWg0OWtKMHRnMUh4NXBIaUo4LzFCUGpEcnpmTmp2b2F3SVhV?=
 =?utf-8?B?ekZaTWNiVllHODczVVJ1eDFPSFFORUVPTXZvWVVKb3VydjJ5NjMwSWtOZ3NX?=
 =?utf-8?B?WDZuRWJ4bXU2bytzWGt5TnpWaERZNGpqUDFxVGkzZmtjWmtpazhpSTQwRGda?=
 =?utf-8?B?TVJxQ05XUENFc2JMRWZnVUpiR2xHTzN3bW1adG42NVBBQWlwVEppcmVXV3lB?=
 =?utf-8?B?Z21kcWVZdXJIeVNUVEJhcTM5RE8xcGxBZmFQM0twbDgyU3ZHSWpRRXZoQWlh?=
 =?utf-8?B?Mmp1KzhpSkR6L1FYVGl6dVJteFRLOVhBZkYzam5DSnplK2RQdWxTUm16YWVq?=
 =?utf-8?B?b25yajlueXR0TWk3STBQVHhyajQ4STlzK3NkMVZ4ZkNBbWZWK2VyVjVITWwr?=
 =?utf-8?B?U0lJWXRndkEwTFk4UmNHcnVNbW4zb2QyQnBlNDk5dDhLQitsQWhkSFJNMGFV?=
 =?utf-8?B?OFlNMU5qRWVaUWd2dTY3U0g0WldPR1REbW1qaUZIazYyZUtJWktxOXloMS9p?=
 =?utf-8?B?SzZFZ0hQd0tMREhXQ2RjOTFaVlU5d1dqalFXRk9LeUs3NnVZWlduVStPWDQ5?=
 =?utf-8?B?TjdFYVpONFFKMXFNWmZQNzhxcUhpRG9IY2tmTFRaaVdyOTBGRDQ3ZUxJOWs3?=
 =?utf-8?B?TUJwVC8raGtJUnB3aVd1VUM5L0ZqWWZiYjNzR0F6Q0lULzZJRjQvek1vV2li?=
 =?utf-8?B?VGM5LzZoWUVVVUFZSUo3S1crQzdRSkJyMi83UmQ5aFRuS0dCVmZDUVVlT053?=
 =?utf-8?B?UUtnQUFQTGNpelRQRDB3cG9DVWVRRHdSb2FqN0lpNjVXOEJsb3lpekdyTHJQ?=
 =?utf-8?B?M2I4eEQzd003dlNQZnREODhnYWIxeitMSHdVN3N5MFdBUDVyN3p3dFFOU21C?=
 =?utf-8?Q?U+RHvOBOtbOSw//SPi1BeLS7JxY/OQ/bX/2foSFdUYK/c?=
X-MS-Exchange-AntiSpam-MessageData-1: JLSym3fM1Kb75g==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ead1e619-2859-499d-c774-08df2572185b
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:47.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uf6mVLt0laCwfUbL7pGHF9o05z1495bIvpJvo2M1Bj1jwrl5ozRmcuJw2eP4HrNqabvAFh9TwzDDxCSoLRv10Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

Allow fields to be mutably referenced by other fields in addition to shared
references. In order for this to be sound, the fields that can be mutably
borrowed are blocked from being accessed via field access syntax or
projection to maintain the aliasing requirements.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/examples/selfref.rs      | 13 +++++
 rust/pin-init/internal/src/pin_data.rs | 94 ++++++++++++++++++++++++++++++----
 rust/pin-init/src/__internal.rs        | 66 ++++++++++++++++++------
 3 files changed, 149 insertions(+), 24 deletions(-)

diff --git a/rust/pin-init/examples/selfref.rs b/rust/pin-init/examples/selfref.rs
index b5cdf96b6d1c..5e9494dcc17e 100644
--- a/rust/pin-init/examples/selfref.rs
+++ b/rust/pin-init/examples/selfref.rs
@@ -8,12 +8,18 @@
 struct SelfRef {
     part: &'str str,
     str: String,
+
+    mut_part: &'mut_str mut str,
+    #[borrowed(mut)]
+    mut_str: String,
 }
 
 fn use_self_ref() {
     stack_pin_init!(let foo = pin_init!(SelfRef {
         str: "hello world".to_owned(),
         part: &str[..5],
+        mut_str: "hello world".to_owned(),
+        mut_part: &mut mut_str[..5],
     }));
 
     // Access via projection.
@@ -28,6 +34,13 @@ fn use_self_ref() {
     });
 
     println!("{}", foo.part());
+
+    // Access fields that mutable borrow others are similar to those of shared borrow.
+    println!("{}", foo.as_mut().project().mut_part);
+    println!("{}", foo.mut_part());
+    foo.as_mut().with_project(|proj| {
+        proj.mut_part.make_ascii_uppercase();
+    });
 }
 
 fn main() {
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index c5b664349caf..5f37628fdf0a 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -5,7 +5,7 @@
 use proc_macro2::{Span, TokenStream};
 use quote::{format_ident, quote, quote_spanned, ToTokens};
 use syn::{
-    parse::{End, Nothing, Parse},
+    parse::{End, Nothing, Parse, ParseStream},
     parse_quote, parse_quote_spanned,
     punctuated::Punctuated,
     spanned::Spanned,
@@ -58,6 +58,8 @@ enum BorrowedKind {
     /// `#[borrowed]`, or implicitly inferreed.
     #[default]
     Shared,
+    // `#[borrowed(mut)]`.
+    Mutable,
 }
 
 impl BorrowedKind {
@@ -67,9 +69,17 @@ fn parse(dcx: &mut DiagCtxt, attrs: &mut Vec<Attribute>) -> Option<Self> {
         Some(if let Meta::Path(_) = attr.meta {
             BorrowedKind::Shared
         } else {
-            // Swallow the error and recover by inferring shared.
-            dcx.error(attr.path(), "unexpected `#[borrowed]` attribute");
-            BorrowedKind::Shared
+            match attr.parse_args_with(|input: ParseStream<'_>| {
+                let _: Token![mut] = input.parse()?;
+                Ok(BorrowedKind::Mutable)
+            }) {
+                Ok(v) => v,
+                Err(err) => {
+                    // Swallow the error and recover by inferring shared.
+                    dcx.error(attr.path(), err);
+                    BorrowedKind::Shared
+                }
+            }
         })
     }
 }
@@ -515,8 +525,17 @@ fn generate_struct_def(info: &StructInfo) -> TokenStream {
 
         let mut ty = ty.to_token_stream();
 
-        // Replace lifetime for self-referential fields.
-        if !field.captures.is_empty() {
+        // Replace lifetime for self-referential fields. For mutable fields, this uses `Erase` to
+        // block direct access.
+        if !field.captures.is_empty()
+            || matches!(
+                field.borrowed,
+                Some(BorrowedInfo {
+                    kind: BorrowedKind::Mutable,
+                    ..
+                })
+            )
+        {
             // Build a chain `for<'a> fn(&'a ()) -> ... -> (Ty,)`. Such type will have a `EraseLt`
             // implementation and thus may be used inside `Erase`.
             ty = quote!((#ty,));
@@ -921,9 +940,18 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
                 )
             }
 
-            if !f.captures.iter().all(|b| b.variance == Variance::Covariant) {
+            if !f.captures.iter().all(|b| b.variance == Variance::Covariant)
+                || matches!(
+                    f.borrowed,
+                    Some(BorrowedInfo {
+                        kind: BorrowedKind::Mutable,
+                        ..
+                    })
+                )
+            {
                 // If the type is not covariant, it must omitted, as projection shortens the
                 // lifetime to `'__this`.
+                // Mutable borrow must be omitted for aliasing reason.
                 (
                     quote!(
                         #vis #name ::pin_init::__internal::NotVisible<&'__this #mut_token #ty>,
@@ -991,7 +1019,25 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
                 this_lt.clone()
             };
 
-            if f.pinned {
+            if matches!(
+                f.borrowed,
+                Some(BorrowedInfo {
+                    kind: BorrowedKind::Mutable,
+                    ..
+                })
+            ) {
+                // If the type is not covariant, it must omitted, as projection shortens the
+                // lifetime to `'__this`.
+                // Mutable borrow must be omitted for aliasing reason.
+                (
+                    quote!(
+                        #vis #name ::pin_init::__internal::NotVisible<&#lt #mut_token #ty>,
+                    ),
+                    quote!(
+                        #name ::pin_init::__internal::NotVisible::new(),
+                    ),
+                )
+            } else if f.pinned {
                 (
                     quote!(
                         #vis #name ::core::pin::Pin<&#lt #mut_token #ty>,
@@ -1111,6 +1157,17 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
             continue;
         }
 
+        if matches!(
+            f.borrowed,
+            Some(BorrowedInfo {
+                kind: BorrowedKind::Mutable,
+                ..
+            })
+        ) {
+            // Mutably borrowed fields cannot be accessed directly under any circumstance.
+            continue;
+        }
+
         if f.captures.iter().all(|b| b.variance == Variance::Covariant) {
             let f_doc = format!("Access the `{ident}` field on a shared reference of `Self`.");
             let vis = &f.field.vis;
@@ -1266,7 +1323,26 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
                     // assumptions on the lifetime except for those implied by the struct's bounds,
                     // and we have validated them in `generate_drop_check`.
                     quote!(SelfRefSlot),
-                    quote!(#lifetime,),
+                    quote!(#lifetime, ::pin_init::__internal::Shared, ),
+                ),
+                Some(BorrowedInfo {
+                    kind: BorrowedKind::Mutable,
+                    lifetime,
+                }) => (
+                    // For borrowed fields, create a `SelfRefSlot`, which after initialization
+                    // turns into a `SelfRefDropGuard` instead of `DropGuard`.
+                    //
+                    // They're mostly the same, except that `SelfRefDropGuard` returns `&'field T`
+                    // instead of `&'guard T` for let bindings; this allows it to be used to be
+                    // used to initialize other fields.
+                    //
+                    // The soundness of doing so relies on fact that `__make_init` requires a
+                    // higher-ranked trait bound on the closure. Within the closure (which is the
+                    // caller of the generated slot projection functions here), it can make no
+                    // assumptions on the lifetime except for those implied by the struct's bounds,
+                    // and we have validated them in `generate_drop_check`.
+                    quote!(SelfRefSlot),
+                    quote!(#lifetime, ::pin_init::__internal::Mutable, ),
                 ),
             };
 
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index ddd99e705c93..56ea6d927c9e 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -361,6 +361,9 @@ fn drop(&mut self) {
     }
 }
 
+pub struct Shared;
+pub struct Mutable;
+
 /// Represent an uninitialized field in a pinned struct that will be referenced by other fields.
 ///
 /// # Invariants
@@ -368,12 +371,12 @@ fn drop(&mut self) {
 /// - `ptr` is valid, properly aligned and points to uninitialized and exclusively accessed memory
 ///   and will live longer than `'a`.
 /// - If `P` is `Pinned`, then `ptr` is structurally pinned.
-pub struct SelfRefSlot<'a, P, T: ?Sized> {
-    pub ptr: *mut T,
-    pub _phantom: PhantomData<(P, &'a mut T)>,
+pub struct SelfRefSlot<'a, M, P, T: ?Sized> {
+    ptr: *mut T,
+    _phantom: PhantomData<(M, P, &'a mut T)>,
 }
 
-impl<'a, P, T: ?Sized> SelfRefSlot<'a, P, T> {
+impl<'a, M, P, T: ?Sized> SelfRefSlot<'a, M, P, T> {
     /// # Safety
     ///
     /// - `ptr` is valid, properly aligned and points to uninitialized and exclusively accessed
@@ -390,7 +393,7 @@ pub unsafe fn new(ptr: *mut T) -> Self {
 
     /// Initialize the field by value.
     #[inline]
-    pub fn write(self, value: T) -> SelfRefDropGuard<'a, P, T>
+    pub fn write(self, value: T) -> SelfRefDropGuard<'a, M, P, T>
     where
         T: Sized,
     {
@@ -404,10 +407,10 @@ pub fn write(self, value: T) -> SelfRefDropGuard<'a, P, T>
     }
 }
 
-impl<'a, T: ?Sized> SelfRefSlot<'a, Unpinned, T> {
+impl<'a, M, T: ?Sized> SelfRefSlot<'a, M, Unpinned, T> {
     /// Initialize the field.
     #[inline]
-    pub fn init<E>(self, init: impl Init<T, E>) -> Result<SelfRefDropGuard<'a, Unpinned, T>, E> {
+    pub fn init<E>(self, init: impl Init<T, E>) -> Result<SelfRefDropGuard<'a, M, Unpinned, T>, E> {
         // SAFETY:
         // - `self.ptr` is valid and properly aligned.
         // - when `Err` is returned, we also propagate the error without touching `slot`;
@@ -421,10 +424,13 @@ pub fn init<E>(self, init: impl Init<T, E>) -> Result<SelfRefDropGuard<'a, Unpin
     }
 }
 
-impl<'a, T: ?Sized> SelfRefSlot<'a, Pinned, T> {
+impl<'a, M, T: ?Sized> SelfRefSlot<'a, M, Pinned, T> {
     /// Initialize the field.
     #[inline]
-    pub fn init<E>(self, init: impl PinInit<T, E>) -> Result<SelfRefDropGuard<'a, Pinned, T>, E> {
+    pub fn init<E>(
+        self,
+        init: impl PinInit<T, E>,
+    ) -> Result<SelfRefDropGuard<'a, M, Pinned, T>, E> {
         // SAFETY:
         // - `ptr` is valid
         // - when `Err` is returned, we also propagate the error without touching `ptr`;
@@ -447,12 +453,12 @@ pub fn init<E>(self, init: impl PinInit<T, E>) -> Result<SelfRefDropGuard<'a, Pi
 /// - `ptr` is valid, properly aligned and live longer than `'a`.
 /// - `*ptr` is initialized and owned by this guard.
 /// - if `P` is `Pinned`, `ptr` is pinned.
-pub struct SelfRefDropGuard<'a, P, T: ?Sized> {
+pub struct SelfRefDropGuard<'a, M, P, T: ?Sized> {
     ptr: *mut T,
-    phantom: PhantomData<(P, &'a mut T)>,
+    phantom: PhantomData<(M, P, &'a mut T)>,
 }
 
-impl<'a, P, T: ?Sized> SelfRefDropGuard<'a, P, T> {
+impl<'a, M, P, T: ?Sized> SelfRefDropGuard<'a, M, P, T> {
     /// Creates a drop guard and transfer the ownership of the pointer content.
     ///
     /// The ownership is only relinquished if the guard is forgotten via [`core::mem::forget`].
@@ -472,7 +478,7 @@ pub unsafe fn new(ptr: *mut T) -> Self {
     }
 }
 
-impl<'a, T: ?Sized> SelfRefDropGuard<'a, Unpinned, T> {
+impl<'a, T: ?Sized> SelfRefDropGuard<'a, Shared, Unpinned, T> {
     /// Create a let binding for accessor use.
     #[inline]
     pub fn let_binding(&mut self) -> &'a T {
@@ -487,7 +493,7 @@ pub fn let_binding_in_dropck(&mut self) -> &T {
     }
 }
 
-impl<'a, T: ?Sized> SelfRefDropGuard<'a, Pinned, T> {
+impl<'a, T: ?Sized> SelfRefDropGuard<'a, Shared, Pinned, T> {
     /// Create a let binding for accessor use.
     #[inline]
     pub fn let_binding(&mut self) -> Pin<&'a T> {
@@ -503,7 +509,37 @@ pub fn let_binding_in_dropck(&mut self) -> Pin<&T> {
     }
 }
 
-impl<P, T: ?Sized> Drop for SelfRefDropGuard<'_, P, T> {
+impl<'a, T: ?Sized> SelfRefDropGuard<'a, Mutable, Unpinned, T> {
+    /// Create a let binding for accessor use.
+    #[inline]
+    pub fn let_binding(&mut self) -> &'a mut T {
+        // SAFETY: Per type invariant.
+        unsafe { &mut *self.ptr }
+    }
+
+    /// Create a let binding for accessor use in dropck.
+    #[inline]
+    pub fn let_binding_in_dropck(&mut self) -> &mut T {
+        self.let_binding()
+    }
+}
+
+impl<'a, T: ?Sized> SelfRefDropGuard<'a, Mutable, Pinned, T> {
+    /// Create a let binding for accessor use.
+    #[inline]
+    pub fn let_binding(&mut self) -> Pin<&'a mut T> {
+        // SAFETY: `self.ptr` is valid, properly aligned, live longer than `'a`, initialized,
+        // exclusively accessible and pinned per type invariant.
+        unsafe { Pin::new_unchecked(&mut *self.ptr) }
+    }
+
+    #[inline]
+    pub fn let_binding_in_dropck(&mut self) -> Pin<&mut T> {
+        self.let_binding()
+    }
+}
+
+impl<M, P, T: ?Sized> Drop for SelfRefDropGuard<'_, M, P, T> {
     #[inline]
     fn drop(&mut self) {
         // SAFETY: `self.ptr` is valid, properly aligned and `*self.ptr` is owned by this guard.

-- 
2.54.0

