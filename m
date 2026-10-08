Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021091.outbound.protection.outlook.com [52.101.95.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA8849B5D5;
	Thu,  8 Oct 2026 12:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462302; cv=fail; b=CNXHh56g2yWRD6zqpvsYVXR3QsrLxvThWqpQRXSPLlukmA5HOxDMStGMQJzbgJ1KOsSFoMnB1nc2VpY3GBZ8gq2PmHBLzmhxy8t/tiHEV9eKY7/Y/CuqpTd8a4SQoFcW7ZFNRRveG2Bg5BhGUm1LeaYDfc3SkqMvt/dQh45pDfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462302; c=relaxed/simple;
	bh=SG0OTTt6AulZdYxZF/NZ1BDrTUIAKB3RXZRXiuGpom8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eRz2Hy0qTYStHq9RlbKW9nB0xq4yMdNh9Du/cw9FA9KJTXMCSlv7IHwChZF4LHmggZsexuVJ9kvA9cjvXnZCVDWXk1Jw7iu/lWZf/CAfo/66UaSOswY5lMeoNh5rI/BlwqMBndTZI769Wr/eC3dS9nIdlvOsFw44fqTNMsuuXBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=KEJXMrJK; arc=fail smtp.client-ip=52.101.95.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="KEJXMrJK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8bEZAWNr3D/RLDYW26vEQKkizWBms987Koazq9lR5W6ekHnAQMfo8IJpHkzHrYzQCnHXE6ogsxpEC7egix93GjEqlhfOlsWskXiUG7SgFWGsqrF3Wq97NcB3SwxwF1T5ce2OafCHvfe9t+ihDTomfVCy2c9CZq8KYTewueYbIa8f5JECmRhWusc8YpGpawejXQLF7CmAD4rELznMUlrtEYiexJmb70HM7ZCois2IFRD/QdMMeQJT/KmJVakknSLlVZ7fuy1fBf91kKfpNevi3TCUDMYi8ynuuJk7aqdDegx8BYkcFYRjJLOk1/wU1uh+kYYu7bQtGJQ2e63Gh0FwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jt1JDcIlfIkjnmbUSe0AWjB6P+3JZtngy6PaqnwGvCg=;
 b=IMHAyL+DLZ5AAoQH6HGPWT+kvKKrJLaGpR0SPwtQfh5mar0cUbv4DVXnEtPdM/XwQKn1dnSc0BN/COT9hv/y9d+58vNy95cZ0ZphR6vB5u5+fN5vfXbUVlWFVNPj0xA+AepEdVghwKhcdmNvtYFZQwLIEX6Ao1UzWvgdz+7pwsQbeioLLd0Jg4Gfnv3pHIxJcVLU2t+L99otpcBNb37e3zGB+GLa0qv1Of8gW5SWk06mSN+aDHqwJfxH6hzcvnsVHmXudyAeZKD3DgtZViTTFBarU7TEIBj6+DWrNcVQcPlIySyN0S5ok8K8kWf3Y8Gh6v+FaGNsnj9uXge7M9Abqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jt1JDcIlfIkjnmbUSe0AWjB6P+3JZtngy6PaqnwGvCg=;
 b=KEJXMrJKstu8c9G5rHEMfOpmuCP02EP0Xl0ocxXSVIGBCudfrcq+0BKMjL0TaUHUJ3nIHwCFdCxw8UO40s0RVcyF3U/HrPqoD5U9xYJRIQVjub12sBbWGo94vZhOfFDhS8Yf8fSKJFWDrwLXWYp9oMyMpxOZOeIsNSD0S1c0Axc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:24:51 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 12:24:51 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 14:24:01 +0200
Subject: [PATCH 14/20] rust: pin-init: internal: pin_data: support mutable
 borrows
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v1-14-6c1eb269fe57@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13861; i=gary@garyguo.net;
 h=from:subject:message-id; bh=SG0OTTt6AulZdYxZF/NZ1BDrTUIAKB3RXZRXiuGpom8=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWce7M24s2n7n7I+Im2837oqT/6wtFRDyYXVByqTAB
 7/anjwQcj/YUcrCIMbFICumyOLRzZi2iXG27GWt8pcwc1iZQIYwcHEKwESevGdkONDTvlHtrnVG
 11Hnx97PjzX9n6q04OHUZW/FGSsbrNmy2hkZHoX9Tss1eb9yTUf0fh+99kuTueW250Qd6JGoPb1
 XXe8pNwB5qUx8
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
X-MS-Office365-Filtering-Correlation-Id: 98822cf7-98aa-4df2-3485-08df25372568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|5023799004|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ROdEdXbcUMlL3FmKBMv+1oftWGAy9PQ2/dJLSghecDP+2njUHYEn7wMErfIHs7jUG44k9jmL+uXn1KToWAtORx1ThqTrhXhXDR9xv5FsH7V9QsUKK0E2SgL+Sv+yAxf8nO2iKgW/5c/iS35wnCyVJD4jEAzaWgnCJ4D0dn9MgIjJHEYeff84G3vhuyAOxVkta8Sox6teBNnedfCiPsQGFfpGI79bQv6+Arz/vGGQIQ87LGWnYib2U02vjIu0sQFVywkTzaVeKxYsV3IL3wcxW03erqp4LB0ECk+m7gG+XGyARy4lBYCTKGsRYf3rfZ2pvw67cKCrTA9WxJvX4rt7AIuRJ9oG01JfQy+ZUVLPYv5JgN/RW6c4lN0FZa7N0901KEJIVNpoHmbqqd0lYKtCoQXTVaFWMixGqrip2J0j2wrg3j48krijRHf/xQI3nNgQ0p3v4oprj00/er5TpgUqUrJWk7C5BUfoOStnBkjA6tUIcxCzra9qpxdCTgdGwTwvIMzUKyfJRC1tOHBFAFx599GPkgAZDOIIJgELDbhsY1qKIdu0I/eUNKZOMjfr1D3RbRBBIm4e/2dXcLPzxQGcLqShpYD/VRLFRBeVLIzaghpuHBUUzQtRcP9duK1KAmw5esp8p9iprHKo3lBxw/FycxHoNXkPAt/+clyERwe9c/aQ2e+bKHaNsuhwwkQsvB3WYw6u6/kXet3n8/7aG0Nz/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(5023799004)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk5OVGRJSDB6K0tFUGVJRFZ1YWFYOTlFQnI1M3c2RjJhKy9ZaDA1K2NERERI?=
 =?utf-8?B?WHQ5dHdlRWZzcXRsdE5ST2oxeGliRUErd0o4aFZRK3dieHhEYUl4VWY2a3p2?=
 =?utf-8?B?RjdXUHpCM1pteU1JMTd2UElDbkFQbmlPMmVxSzQyU3VqOE5URW4rQTcxcG5w?=
 =?utf-8?B?dTJhZ0Z3dnpEY0dweTM3NVFJeDlUaUZhMm1DeUY0R1hBUnlKOXVtZkpnNzNW?=
 =?utf-8?B?SUE0OC9iS3h3dUl2cTlZU2JxenFvR0c3a0FlVzJXOWx1cDZKUGhwT0NibTdj?=
 =?utf-8?B?VzE5SHV6UXVJK1pmcStoNllIV28rM1hubGFxMitCcHVFRjRYOStXSTdYY21D?=
 =?utf-8?B?U3dZK3F6ek55S2tub2JGUHJBbm5pMG5ISWRvdEp1amhGNVRNVS9LY2hQdTVL?=
 =?utf-8?B?Q0o5Z0ttdXJuVWFUTFFFQ0FMb2hqU2pTYnhPZ1RydHYrdm5qRE9yditSbnBG?=
 =?utf-8?B?VzkvcHR4UEFJZVhpUG5La0JidjFVaUljNXJYaUVJbGxCY1lYbWFEZmpPVWho?=
 =?utf-8?B?MTU4SnpyMWE0aW52Skh2SlBady96dEhpYVJLYzFuSlRGcExGblJwMUVQWTVG?=
 =?utf-8?B?MHRLT0dVV0tHckEyOWllWmRWS3RCcHNidlBwNDJTc0F6U0pDTjlzUXlBUFJl?=
 =?utf-8?B?ajZ2bjM5UTl3akR6c1YrQ2Z0eSthcUl4TnE3WVBwSFNjRnBsYTAvbDZBQ2th?=
 =?utf-8?B?bEVsUjQxV2MveHMwV3RGSE9MazNRWWQwT2ExNnh5ems1aHZkalJJUXAvMk16?=
 =?utf-8?B?cUJjbVNIQUR2blZqdW0vcHNvMTBmL09CZFgwRkdhdHVvemdDMjJLMzdwMnVK?=
 =?utf-8?B?UjJCQVVENlJQekpxdElpeDBPK1lCclJSK294NHQyZytGUTFBcjFHTFNvUlV2?=
 =?utf-8?B?OHZnZnhvQ2pGQTV4V2hveW5BaENTVUJ5dDlia3pIZmFUdTYwUXo2d1lONlBp?=
 =?utf-8?B?a3dHMitlaGEyc3NVZkNkblFqZ0tEZklma0lLVDV5UTl1TWVOU2tyWDhXUUtz?=
 =?utf-8?B?R0hqZzA5d1BydWlQelRUUTJwOTdrWHZmalFUNkNoNGZEZVR4Ri92a2F2YWtS?=
 =?utf-8?B?M1kwQmNGSTlOeDY3bE1CTlNjMENGYUNQdFVldHEwUWZKRzBweEFPSjJPUXhU?=
 =?utf-8?B?eHBocVB4eC9EcStlN2dUYlJMdWE0c3JWclJrbEVkQXJURkFCRnBmS2tsTjFN?=
 =?utf-8?B?d1huVnhpQjJnK2JjVStXUGJCYlBzR1J2K3g4YXVqSGQyeHFwd2tBN3dIWWFx?=
 =?utf-8?B?ZGZZdEFRVTZwbUlHVXZUYXdDbHhvdzRTUCs4bmR3Q2FjMXQ0a0doRjJsTDM1?=
 =?utf-8?B?T3h0NHJRUi9uQnNRMys2UDZqSUxMOFlRMU9INFFNOEFjZm8wQWxqUm9ZK0Rq?=
 =?utf-8?B?YXNZb3A1RmFzdzBYT3V4TjhzVEFocDNkUFZ2TU0wc0pGeG5zdGN6UUFXU0pj?=
 =?utf-8?B?aGJPZS9LRWEvUWJPY2QrWWkyWVdieXJyN1BkOXpKV0NJdXE2WTl1RDJmK1FB?=
 =?utf-8?B?SEVSR0pCK05BOW4xT2pUdU1HMmYrSWV0RkI0bHAzRkluTkdyWWhJUHFsYzVS?=
 =?utf-8?B?MkVPZGFaM1g4eVJLbm1JOGNTa3VSRzM2OWdSWkJZK0FiZWkxcm0vYXZPUjFP?=
 =?utf-8?B?Y3V0WUY1NjNGa01xVEFuUHk5VVFsYzY5QitMRC9TdVZWMFZ3d0ZYbFUycTc4?=
 =?utf-8?B?aHRTTjRzVE9aL2tZekNSMDVEbFFmVUc4aHBjMWhBNnBxeDdmcUNmR2VIRE8r?=
 =?utf-8?B?dks0NndNM2VmNG1ZK3pxUVFKY0pNazZwWmNMRHZPOWJjd25BdWNaVnpHVzIz?=
 =?utf-8?B?QldkcWppL3N4Wm00S0RGSUVsa0g5QkNEWVJzMlhUeHZySE5NeHhCVzJGMXIv?=
 =?utf-8?B?QlVMcCt5eEVrMHlEeGtGU2ZOc1A2K0pKRjl3eHVodld3SmxVZENvVVdGVEtW?=
 =?utf-8?B?YXdxRTFlS0xid2ljMitOUGE2VE8rTk1VTDhjVlljeHRBU1NvWFMwTHA4bFFo?=
 =?utf-8?B?WjNVd1UyODA0UjBMYUt6cGpibTA0dVp2NEM1SG5GNVBtaGhMZ1VJMWVHbzh1?=
 =?utf-8?B?VkpKQ0dVVkhXRXd1WElwUWJxNjN5R1poKzU3SWdvV0pTOW9aS2FNdEZUb0J3?=
 =?utf-8?B?Q3c0MGRVL01YRFc0QWNHRWlvZExDN3VwcVIxWFJiN0VHb3pBRWU1QmFzbFJq?=
 =?utf-8?B?d3k4S1VhL3NxTS8vancrQ3hGaThOZWVWVEpwT0EyVWt2NG5OZ2FlK2V3YlF4?=
 =?utf-8?B?U1hkZ3pyMTRoeE81UGVhVUJmdFpyTVlTY1d0OG1nd2dzMnRodkJLVHBibGJm?=
 =?utf-8?B?OTZ3dmI0c1VKMG9jRXdVOStXWTZkOG1qZHk0b3dZbFFnVzNMd1Avdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 98822cf7-98aa-4df2-3485-08df25372568
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:24:49.1643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M67APY2IX06hTWaLmOJ5+TORLBzZfwtRrf/1ME/zIpUTbXDVdhVRpjtTGieYfmjREpH76bFx/uEDqQqlA6s7Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5471

Allow fields to be mutably referenced by other fields in addition to shared
references. In order for this to be sound, the fields that can be mutably
borrowed are blocked from being accessed via field access syntax or
projection to maintain the aliasing requirements.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/examples/selfref.rs      | 13 +++++
 rust/pin-init/internal/src/pin_data.rs | 94 ++++++++++++++++++++++++++++++----
 rust/pin-init/src/__internal.rs        | 64 ++++++++++++++++++-----
 3 files changed, 148 insertions(+), 23 deletions(-)

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
index 908c0773f791..54f0efef3226 100644
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
             // Build a chain `for<'a> fn(&'a ()) -> ... -> (Ty,)`. Such type will have a `EraseTy`
             // implementation and thus may be used inside `Erased`.
             ty = quote!((#ty,));
@@ -920,9 +939,18 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
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
@@ -990,7 +1018,25 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
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
@@ -1110,6 +1156,17 @@ fn generate_projections(info: &StructInfo) -> TokenStream {
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
@@ -1265,7 +1322,26 @@ fn generate_the_pin_data(info: &StructInfo) -> TokenStream {
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
index 2410156a0c99..ada07197acd9 100644
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
+pub struct SelfRefSlot<'a, M, P, T: ?Sized> {
     pub ptr: *mut T,
-    pub _phantom: PhantomData<(P, &'a mut T)>,
+    pub _phantom: PhantomData<(M, P, &'a mut T)>,
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

