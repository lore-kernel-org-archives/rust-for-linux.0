Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021090.outbound.protection.outlook.com [52.101.100.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3B44FC8D3;
	Thu,  8 Oct 2026 19:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487616; cv=fail; b=bLcOWWjGNNpmJMtcTc+eYGWTZudqJXyQg6P7LTJdohq6QDlq2tyfL7FmCgV6MtvzQb35Y6z/45KJwFW6RW9Dq2ca7bJ2WqGnm6gzNl/SebwDZSV8S3k4LvI50sP+lWR01dwPf6ijsc6hja/zDaQcsT3vM7dRiPixkJ/a2ZMuRdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487616; c=relaxed/simple;
	bh=VfmOat1MZBhAR1pAD/Qoay47RqAoHRPceCgVbCWemf8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qzCr29UkIZPPuYVB5RC//UYp0AL1Wz+1JzEpG6KV3MKBQtM28aeDDOrgH9txP8Bd4+ywCIdw+gAL3vN8gzORBqIYRU0vhKB49Gc7LWlalsiIL6l1jUNJS3+hphr4YQSnkM9MGKRUR9X/1KDsNJMDjJDaIr5rucjdRWoPNNRoVFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YB60ak/k; arc=fail smtp.client-ip=52.101.100.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YB60ak/k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aL53v7mKX5DESSnRalyMaSft59tSdo4Lc4cjRDWRWzwHgyBD3QxcCvXyR0BldCQeYzMwLZlutmU0ZBh+yyLhgWLC8BqxuFBaU08AaSI7SlwbfnCZ8bbIjMKFu0F9VgvqGm1551fljfziCU8/BP84XjFeeg0xTc3jj+q2Cx9O4h33gaaHUbQhO/RLXDLwTfG4/rGJB0Kq3/nMz57/Qv+inBwDTLK+UNYoFG1FGAaldWP1s62X4cqdh+y70YMOlBkBP//37dGCOJt2lRlLXpi2/I+dGtRFYNjYV6v39wYjlLUfPN2kYNr8Q9wIapvtj+Yg8tmInFwa2+Ki07XsEJ8XTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2BuENh4yQv/zTCUzf2WjskKdk7z5mXwV2p/+o64Sbo=;
 b=tD3iVsapb2Fl3C/m6QHw7gqVEr2Hx2isdm6A0EqJFPcbskWX3AzH6Agmot10Ubv0WcTVuM/78WsmiBvtBl920iA0D34Ig7KVnHJ24wZL7tFsZWzioRqWDjwTGB12UDdwpwltwZxxt9A9qNMQKM6JtrLZiUhpkbLAQ+BWhbmVDjllbUik1a5Fd/pc1YpmNX4Gjh/j9lsiL9ZBpB68OK3pSLtYpzoNDQNJlUQgm1avrM+teB84/WzU/eFw94NLQpTer0LMMGDSSyK1f+R5XOj/mxAKprilrqQAQvz1EzWRucZ6mxhltPBQ3UArkf2/Ubk/ZPv0TvQVEgdopgt3Ka7Pzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2BuENh4yQv/zTCUzf2WjskKdk7z5mXwV2p/+o64Sbo=;
 b=YB60ak/k00s/5InLNXEBGAdLBxUrszSd3uGvv3s4Q3UB3m5S/KTlOK9DdtzUyHGVMXMNX+fDRQfGdiYS5Hp2TUCk8teWHYcwsuxocYZzRqgrsdpEy27g2PTmsDWduGjzmlVwM1f2WQGqHi8Bs0AHQguoSGBj/axgLzag8fReeaE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:43 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:43 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:27 +0100
Subject: [PATCH v2 03/20] rust: pin-init: internal: pin_data: rewrite
 fields that borrow others
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-3-e280b3c8fba5@garyguo.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5420; i=gary@garyguo.net;
 h=from:subject:message-id; bh=VfmOat1MZBhAR1pAD/Qoay47RqAoHRPceCgVbCWemf8=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWcff5QemvmrXlHt5eUJcm7L6vPlL19zd/MmyxqliQ
 cT9M8wv5fQ6SlkYxLgYZMUUWTy6GdM2Mc6WvaxV/hJmDisTyBAGLk4BmMjBzQz//dyS9N1is5p9
 ti0vO/s7eW/t6Z3VfaZd2zqKbbIDZ0YIM/yV2Xs+9xd7qXz7p1tWy84XH1vWsPf6h0ezwv3XKmQ
 tuinPAgAtj0wM
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
X-MS-Office365-Filtering-Correlation-Id: 473603ce-2e15-45b8-62d6-08df257215f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|6133799003|18002099003|10067099003|22082099003|3023799007|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	ufQbiQL2TLwLgdyAWLL3o+e7IaL2J1yO1QHyaP4xIa861HGHNv7YUTL9nN79WUQUHIpGxb3RzyLQCU5Ts2SM0z2XphG+m1Y1jO4DWLqWEsQdOc+D7teTFN+CBegr10zIrvxx448CUZjiwYGzbBbtAdvK8UVUz85RoUXLOsu/X6tTHCUEtBAb/YZMqOhKt1IZr9PSDHbpSA9A9UA5YNaDEs0vQmzdURowqOhFzzo59tbbzYt0tKfZE5qgqPtLCjj7rkV0ATc3iNpQSquoce3PApRzLePafzpC//kFBwWWzNSFzDF9odP4XnaVNi+7RoHdNVFUOLewq82JmSltOGjxLmFfN+Cp+LnOJV42+99X9z8c/yIJhXhmKxtz8xM8ZgKW0zBge+Wqnl5tcOkbo7SNqpU0ewGYnBfER1KIeA7UGwjcoIH8di7fZwOIQ7m3elWRxXbj00AtT1l2U9OTzNdqqL+f4ef4ytvvJPxMLv1gdQmzIdKG+4GPHIhGKDgYAHED5LSvRklubyH+U8A5fAxhoDuG4V4mKQ2UHFpdJsejmu2xMKy4wGry9GgS7kYuoiTbrdAfiQn0J9UxIQw/EiWQqWQEGPb/v1iVOfDFht1i2o6fq6Enq0yXWQltTdmbLb6MACxsHjFjWRDfJcvt04eRC5B4Q3W6Vzy/e0c3EZBkzfS9Rzs7nx63evTgnlHPmJgoafSns6AzrvdeqWeZN6c6vw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(6133799003)(18002099003)(10067099003)(22082099003)(3023799007)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkN5aGxPd0JmSXdxcEJpZmNmZGluaFNiTWtxMVFiMkRMRVVqN0IxaU5DSkda?=
 =?utf-8?B?QTNydHBNYW5FSDZHcC9tV0JDK0owR0NLODhHNnpDUEJmVjJoZ0hjaXhkVk91?=
 =?utf-8?B?ZDNMb0wwamZuK1dCdXFDVmxXWUZUNDhZcnkwc1NheHVRVERDRGQwbDRYOUMx?=
 =?utf-8?B?ODl5Ui9heUx4VzF4U3ByTU5TWTcwdWg5ODY4NW9qYk5OejV3M0pNSnJjR1FP?=
 =?utf-8?B?RGZlcmlYVHI5UktXOURoSzZKdDM1TTVzcTdYcW1xRnROWVRJTUxTcDRyVVV5?=
 =?utf-8?B?c1NBN3pyVXRYTEwvSkJINm1hV2Rrb0Y3ZS9wOXU2QW5GT1pZYWR6LytWYmU4?=
 =?utf-8?B?eUQxTFFtaURtcW9MbmUzaDY4OEtBaDhOa0tYaTdQYnVDNFI2TitSeWZnNW9x?=
 =?utf-8?B?TzRmZzdnTzRnd1h1Yk9pOENMTGMrNnJqYU5zSDBQU2ZBM1J2a1RQbVRWM1R4?=
 =?utf-8?B?WGFOZnlNY1Bzamd1dHRhZHJLQW1vc2RDMjJTak5ldHNBYll0MCtkTm02b0s2?=
 =?utf-8?B?eEZSNFpUQlNSRzk0c05vL2J2cldoRzh1bVlpQXJHM3NVSlY2Q1RaZllqd3pq?=
 =?utf-8?B?QjlVeDJ3ZzlrbmpIYVNwdUpPM21QNjZCbkd5eXd0R3FnbnFmV0NhSzBKT3Bh?=
 =?utf-8?B?dnlCY1BHZjBYbVpDeGpNK244SlRRSGEwZzFHd2pxSUJIcmhDdk16eFNvV3R4?=
 =?utf-8?B?RzR2RVlxTGM2VkpXM1lUVVdxVGZaL004aTk5QjVDTXZlL0UzQ0V5ckpnSnU5?=
 =?utf-8?B?OE05eHdNN09vOXJqQUo2dllHaHl6cWNSU3dtSmhmY20yVkllWEVNUUNjSk9Z?=
 =?utf-8?B?dlJsbThCYTFCbGRURU9HbGYwQjdaN243Z0F1S0lnNEdTemlqTG1aN1g2TitO?=
 =?utf-8?B?U0V2NTJ4Q1FEQ0Q3eHRIRE82SkFoOVlZTnFsaWRtTXE4Y3QySTZhUzkweXRW?=
 =?utf-8?B?d1p2N0NMVTMwT1FSaE5vWXdZczZXeGwvOU1IcmxLSmFRdUNyaUdhc28xd3FN?=
 =?utf-8?B?UXRnNlFOQmVtdVZGeDU4bkVOUEw4WmlHZ3pLcWprSzB4U1FtWnFEa2MrZk5w?=
 =?utf-8?B?VUw4QWx4c2xod2ZYVHlwZlNsVEJmMERaVDNsd0RKNy9TZmNyWjVQdHVmR3Fq?=
 =?utf-8?B?TGxkOXhtYzZVOEVOZi9kQUhpUkhCOVJUbFIyTjBFQ1c2aFdaTGJ6cTI3b2hz?=
 =?utf-8?B?NFEwdTdDTFA2U3NlL2ZhZzJIVHNGM2Vpekw4b0ZHeFk0NVlvQlprQnhXTEk3?=
 =?utf-8?B?eHcwWGRONUY5L0VmYlV3QXBlcGdGOWtFZzFEUlNnc2FGVmZZT0cwTldiMElk?=
 =?utf-8?B?SVRiUVVYYmV0bTBGeENyRDNFUklMVldyVTlrOEorOFZ6ZWdENlMxNFhrS1hE?=
 =?utf-8?B?aVljaWtEbjlCWFNhU3RBeTMvTGlEOWZFbkNkSHFGQVVJT1JUaDZCWHVvcW55?=
 =?utf-8?B?VGswQ3E3Smg1QThLNDNNajFrUCtrNWlacEM1Ri93cy9pTENoQi81T1JaQ2E3?=
 =?utf-8?B?TTRuTXRtZEk5cWNKbldSbFV5WHVIejJzSGJrNVZsckd1alhPN2tRNDg0d0hZ?=
 =?utf-8?B?UXBqZW1tWmx3L25sSUpoeUh4ZlpiSms2ODMxR3IzK3Fpcm5YQjZNOWtpbERa?=
 =?utf-8?B?cjZlMDhkanU0NlNhZDFGK3F6RnJoWjRrSzJNNU80YnZ5eFROU0hPY21yVFdx?=
 =?utf-8?B?U2g1WlMxYzVvUURnQXhJblZuWUFlL3VlV1pCQk5tWUl3NVRkL0twWEo0bTUx?=
 =?utf-8?B?cy8rSE5pK2c5eWJQd1VzVjgzeDdUSE5JUldJMWk1NWU4QVFRNHVMSnlyc2NL?=
 =?utf-8?B?ZkY5Tk5RVUw4M21XMTZKNTgwWWVQRDBXVWJ2blM0TzhBVXB6QU1ZS0hSMEts?=
 =?utf-8?B?TjR2b3RLc2JMSjc5bmR4SkFaZjk3NjF3d1E1Y2lFaG9BKy9jUm1sbDhRbnd0?=
 =?utf-8?B?dTBNZlRJcDAxZDVSME1PMzBXNzBYa2wxekRNVXVWWWl2UGViMXVLSVNJdHNl?=
 =?utf-8?B?Znh0N1hyZCtHUmJvQWRXMVdZaUNTZW9GTVl2US9wd3BQQ09wZnlwK09aZ3Mr?=
 =?utf-8?B?eS9jM3Jpb2NvZlNmR0lzSDdkejdTUnAvekVuNEFkanF1Z2NpdG5kMk1EM1dO?=
 =?utf-8?B?dkFsQ25YTVlnWVY0Nyt1aEJHWG1hZUlWM0xLcjJQUHg3dHRRd29ib3VTV1FX?=
 =?utf-8?B?Qnp4U0gxd2xtTW05QkxNTys5Q2VZOXNmUlZBcGdJTlYvVnpCMFRoVVd5VW5P?=
 =?utf-8?B?eDIxTVZTNUdTdENhdVpqd2FxTjZBL28rV0JRN29aWStDWmVMcjUrYTIwd0Jv?=
 =?utf-8?B?Q1BiaUFoVTRxZThyUUgzNzFFdzVHUkQzRXJlWU43YVlrSnhicHFhdXRrVDhR?=
 =?utf-8?Q?Fc2M/CcG+FllHUHW0vyWV7tG6QZSluAuznAMIzz/qbqYk?=
X-MS-Exchange-AntiSpam-MessageData-1: mVaJxiqbqx+l1Q==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 473603ce-2e15-45b8-62d6-08df257215f2
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:43.5126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dVU1rlammej9/SHsNigIQZnvZYlP0K7KrQZlactyv4vavdwxsz5dik+YG4nqaHRcA6+YgKohePmmrIlADld0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

Fields that borrow other fields have lifetimes that are within the struct
and these are not part of the struct generics. Therefore, these fields need
to have their lifetime erased.

A naive implementation would be to replace their lifetimes with `'static`.
However, doing so is unsound for multiple reasons:
* Users may directly access such field with field access syntax, and get
  exposed with wrong lifetime;
* Auto trait implementations will cause the struct to be implementing auto
  traits when the type only implements the auto trait for specific
  lifetime. This is similar to how specialization can be unsound if
  specialized on lifetime.

Create a `Erase` type, which has `for<'a> fn(&'a ()) -> Foo<'a>` as generic
parameter. Internally, it uses a helper trait to resolve that to
`Foo<'static>`. The first issue is solved by not exposing any public
accessor on that type. The second issue is solved by add custom `Send` and
`Sync` implementations that requires `Send` to be implemented for all
lifetimes, thus closing the lifetime specialization hole. The actual
implementation is a bit more convoluted because it supports erasing
multiple lifetimes.

This is more or less a stable polyfill of the unstable `unsafe_binder`
feature, without `unsafe_binders`'s no drop glue requirement.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 16 +++++++
 rust/pin-init/src/__internal.rs        | 77 ++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index cf6142cd656d..36678843251c 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -417,6 +417,22 @@ fn generate_struct_def(info: &StructInfo) -> TokenStream {
             ty,
         } = &field.field;
 
+        let mut ty = ty.to_token_stream();
+
+        // Replace lifetime for self-referential fields.
+        if !field.captures.is_empty() {
+            // Build a chain `for<'a> fn(&'a ()) -> ... -> (Ty,)`. Such type will have a `EraseLt`
+            // implementation and thus may be used inside `Erase`.
+            ty = quote!((#ty,));
+
+            for borrow in field.captures.iter().rev() {
+                let lt = &borrow.lifetime;
+                ty = quote!(for<#lt> fn(&#lt()) -> #ty);
+            }
+
+            ty = quote!(::pin_init::__internal::Erase<#ty>);
+        };
+
         quote! {
            #(#attrs)* #vis #ident #colon_token #ty
         }
diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index cba53b8c3c94..0a8247473cbc 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -385,3 +385,80 @@ unsafe fn __init(self, _slot: *mut T) -> Result<(), ()> {
         Err(())
     }
 }
+/// Polyfill of `FnOnce` trait to be able to reference output via associated type.
+pub trait FnOutput<Args> {
+    type Output;
+}
+
+macro_rules! impl_fn_output {
+    () => {};
+    ($ret:ident, $($arg:ident,)*) => {
+        impl<This, $ret, $($arg,)*> FnOutput<($($arg,)*)> for This
+        where
+            This: FnOnce($($arg,)*) -> $ret,
+        {
+            type Output = $ret;
+        }
+        impl_fn_output!($($arg,)*);
+    };
+}
+
+impl_fn_output!(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U,);
+
+/// Lifetime erasure facility.
+///
+/// Say we have `exists<'a, 'b> Foo<'a, 'b>` and we want to store it. There's no concrete
+/// lifetimes we can use, so we want to erase the lifetime.
+///
+/// Such erasure can be encoded as
+/// `Erased<for<'a> fn(&'a ()) -> for<'b> fn(&'b()) -> (Foo<'a, 'b>,)`.
+///
+/// This can be considered the stable version of Rust's `unsafe_binder` feature, without the
+/// no-drop-glue requirement.
+#[repr(transparent)]
+#[allow(private_bounds)]
+pub struct Erase<F: EraseLt>(F::Erased);
+
+/// Helper trait to resolve the erased lifetime.
+trait EraseLt {
+    type Erased;
+}
+
+impl<T> EraseLt for (T,) {
+    type Erased = T;
+}
+
+impl<T> EraseLt for T
+where
+    T: for<'a> FnOutput<(&'a (),), Output: EraseLt>,
+{
+    type Erased = <<T as FnOutput<(&'static (),)>>::Output as EraseLt>::Erased;
+}
+
+// The default `Send` and `Sync` are not sufficient, because one can use lifetime specialization to
+// implement `Send` or `Sync` for a concrete instance of lifetime. Use HRTB to ensure that the type
+// will only implement `Send` or `Sync` if it's implemented for *all* erased lifetimes.
+
+// SAFETY: Trivial, no lifetime to erase.
+unsafe impl<T: Send> Send for Erase<(T,)> {}
+
+// SAFETY: If we erased a lifetime, then the type needs to be `Send` for across *all* that
+// lifetimes.
+unsafe impl<F: EraseLt> Send for Erase<F>
+where
+    F: for<'a> FnOutput<(&'a (),), Output: EraseLt>,
+    for<'a> Erase<<F as FnOutput<(&'a (),)>>::Output>: Send,
+{
+}
+
+// SAFETY: Trivial, no lifetime to erase.
+unsafe impl<T: Sync> Sync for Erase<(T,)> {}
+
+// SAFETY: If we erased a lifetime, then the type needs to be `Sync` for across *all* that
+// lifetimes.
+unsafe impl<F: EraseLt> Sync for Erase<F>
+where
+    F: for<'a> FnOutput<(&'a (),), Output: EraseLt>,
+    for<'a> Erase<<F as FnOutput<(&'a (),)>>::Output>: Sync,
+{
+}

-- 
2.54.0

