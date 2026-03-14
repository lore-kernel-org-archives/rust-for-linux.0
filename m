Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011071.outbound.protection.outlook.com [52.101.57.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5085C2517A5;
	Sat, 14 Mar 2026 01:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450446; cv=fail; b=uhGPDleEpJ0Ww5AuR70Gx2pCZvSE2HHcFYRXcWY2UGneH75ecHvArSP1idKxCyJxA7y8VhCqBTGFX04WdD2gTiJUKXYKB72oyizd3vCNUHoyOn1qt51Rb1tSws0SPcSLlM/Qlej6+g/DoJfMW9Xu9DF6n89vxXm9wZJKwn9rSIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450446; c=relaxed/simple;
	bh=WSuL7Cff+sG6+t0dxlqZ/c5IjCd3yXT6OFq9nGHfa30=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oO3qL/SOZi77Z0JKlDMzxDmnGq5DZBKWU8AWE7ctm5hyVvoR2SewWL6UfuGEFMx7UUqWVLAZtP0LcOopymMSXsgfrJJ8Svkcxjj4an249N0egj/sp416lk4DEYTnqcpBpbO3bmkGQFDi2YC8i8PpZ/cSWj53pkITdxV6J3vfWO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O2ickR3j; arc=fail smtp.client-ip=52.101.57.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O2ickR3j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFnroBLJ4pts6W3qHjWlVmB8uosE32BwbqJDEDcZry5Qqi/EQnr2b5LdFR1NPY5U86/oLZbJrtnT+5EKU7Weu6gpMJqpFkBzJWxahpjil5m2Zky3x04rzxiodpTZ9NnnfYH4XJGI/CeBrU6y9+6jM4W4CkEkEhJQp40pKDRJybnAX/hsSHCinzatZ+RCNHE0HO7HYRIw0zeQ3tt19hl4qW+1eNF67hGgZ9Kt0loA43oVutMqd7QLvNoX8CRI94hb7+7gcUGHKx/4XwDz/fu9qKg8jsWqO4+sdhC787yhxsXYh3AK0FBiC/e2rAzWesacPYDgmMqaqxs8bmMNpqFC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naqeIVfFZul1OKJcUBggfUhhgjJPKHzOmX41oecRCY0=;
 b=LnagQgAZTUdEzYn8Yy4gYPSxjj8TPzBXdO6tu1gVKpLX99uIhk9z7jjoeTMoiRAcR6GkMfoN8QeZYgxo85v0Gei5zCsaSju0kAyyw14eAuafzKl85GRa45Nu57jD8SUJvjj0AYE9v7mEHIntuq8KxdaTB+KbvCNQ+9XkpRbeOtWdNLObdPEu8B42L4dEyX3ojxTRoNzHXJW2jKTNjEVTiXAd5qfMro2cbY1bVxiNOG84PMOHhLRYTfc8YZKXdKey+LADME0zO7pr90bXZ/D3M11baTplss/A9vqcOUO1Z9sxnYVgQTqnUE2TMH8rNqzFj3VCJkvK5hIsftJY8xtI5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naqeIVfFZul1OKJcUBggfUhhgjJPKHzOmX41oecRCY0=;
 b=O2ickR3jh0CHRY2DgoTswyJw0Iz/+Gmi7P3T5kFZHGKwQQ0ULVTo6R23PwwhM2955gNd82uWvSA5Hxofj7eOBA5Mi87PONvD/momMTLXzD9chvasE5Y4X3X3G63hsUcr7HhjgKeF94KFSUROjBkcmVzngCMs9Ik8c8Lqkw0qB040z4i48x4PWaVt1PjmLKdRz74KTxkcM2ChnecNHC1rScLN+k6DX0DvFZwuc4i6eWZGGcwk+Xt+Ok2b0dvU9N9254nb6jXTe7wx/6CZ8M8Oq8jCD2cmvaMmucNcRBFSIQ2MSqke/gIYt4zp4csPc/DWYtKdLJsQQkj7+BnZif6yMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sat, 14 Mar
 2026 01:07:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sat, 14 Mar 2026
 01:07:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 14 Mar 2026 10:06:20 +0900
Subject: [PATCH FOR REFERENCE v9 10/10] gpu: nova-core: use the kernel
 `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-register-v9-10-86805b2f7e9d@nvidia.com>
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
In-Reply-To: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:405:379::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4ea98f-2194-410e-f6f4-08de8166024a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6Imimyap34Hw9JgCDo2dkgv0v29Fj7ZZkUQ6s1gj4o37tT7RGM0od9XgoYNVfF7lSOkApwUCcu6HOHwTdA6M/0BcjebXaSRsNuzKmu/VX1JAScDuR+pqQLeoSxobnDlQBwgW8nWmU9C2qxMGrO7Z9gXXD1XI1MeuCbGbE5hiAgFcyQVRfFuS4jt0Mlv88UkI3vmXgP+rdjF8+e8HMJ6T44nFaxjxaxouNfT/KCRQxs9McwEepdUO4YD30r05PUIG+XYA7gPFVc0IjCLFRiUfDc83d0f8l0cfNzkuC1RP9MRkgoR7+zjI2dvmKOSPj2ZgFhN8lReWRxqB2S68LL1bqWZRqY3fK1SAyoId9wUHbBeOBKn/cRB2SLYO51t/dh/zaqQoyLb4N3wlypVf+mV85N2nNCkWCSLuaG4h8AulhJ9ofV5C1LdNsbWc2ot/i7FGg/OIOD8lHml6IeqvWPqf6D9beJdxS5SUp4vOwCD+q9Ott0/14GBo5LilJ3QFTH3n0vhjYnhORFnTIr66nBvWiU+2ax2RL4cvwCDbAYRvWS3L845Rd4dAauwZf8TKOGOwMtDG60T1IaqyR2WqMtZWW2YAB8WIrh/WjvU0a70O7YdGKHdaJHq/wzzmefiSNvYumrk0CacniHXF4RTgLNZV6kiKJJKsUAL3Ps2Z5TiK4DGvQUth8m/X8GFtoFmMz6RhWQLYUsP7zZ7w72dplnq7FMdifNULvwblHEIVg6JQvt+4gkeJ7SO2V8C2y6qwxnpg6URB5qxleatNDtMBpFagYL+ria85Jn89m9/TdTM73N8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2VMVDUycVBpWEp5bHhuWGxlbFNQOEdlb0RPZ0lSVHlpc0xJVjNUenpBNmp2?=
 =?utf-8?B?OVZqSlB1UXgvbjM3Z2NoRVA3VUk0REpSQmFiSnJjMXozVEp1akNJRW5EYmc4?=
 =?utf-8?B?dG9FZmppYVhXc2Q0N2puT214YndwM29UVzgvK21ta0VuOFRNVCt4Tk8wU3Vh?=
 =?utf-8?B?b3FDUWdnMWd2Mll5d1YyanNyWUNlSG42UG8wU01mUCtnU2QwVTFZTzFtQkxk?=
 =?utf-8?B?cnpVQVVhRWVxWkswWm1pMlpNMkhWZWlqb2wxc3V4MEg5emhZSU5ZMzFtcU9u?=
 =?utf-8?B?eTZvbUZIckNsZURZOGc3NlRTT01BRkxqZjJyNTRHRDg2Q2hLS29wYVF2cFoy?=
 =?utf-8?B?blVFR1oxNjltMFplbjJoUTA3d256Y1RqREQ3WEZqajFiaElETFhKc3dBa09F?=
 =?utf-8?B?aHd4dkhla1B5UkZHZGFWUGsyNkRBLy9wRVUxMTQ0alNBck4zeHcrVkc5bGJI?=
 =?utf-8?B?L2V3a3JnWFZQaXFiR1ZaaTRaK3c4NHlnS1NEdUdPSHZwQ1NUelk5b3JxRUVu?=
 =?utf-8?B?Rm0zdlVKNlVoZjlsMUw5R1M2ZHhKNHlhakpPN0Zhc1dFb0dBOXFFVldHR0lQ?=
 =?utf-8?B?UUF5NmtWSDk4d1hDdTVBSmRwbmEyZ3E0Zlg4Vk90UXNDVmllM3RUNVdXRngz?=
 =?utf-8?B?UGNTdHNQWHZzQWExTG1NSExSUnVOWmExZ1JpczNFYzlXeG9WY2YwWU52Y3pI?=
 =?utf-8?B?U0F6dzg0cjVFUTMwdGNsYjc4bWgzYTlyVUc3dWRFcVBzSzBEOWp4SnpMUHlT?=
 =?utf-8?B?Ti9yTEVDVmxmNXg4U1JhQ055NkhDQ0huWEF3TkdOSllwUUdYZXhlNnB0NDl5?=
 =?utf-8?B?bDZsRnFibFdTaTMyVXJqWGJrcXFQbWgyM3ROV3hDbWg4ZXJpM1lySWJzbkRO?=
 =?utf-8?B?Y091TWFReGFFUWZkUGx3WFduZjdqd0RpNEw3VFRxbmtNV3grTHlLUkxpdktx?=
 =?utf-8?B?d0VwSUtQZFdkdXNMQ0ZScDNFN2Q4ZXpxUVdOMVlNZkJHS284bDdVampXOEgv?=
 =?utf-8?B?OUJuclkzN29EblZGLzZSYWFrZE9XNVpOblRWbXRNUG9TMmJlSzQ0VWg2djNs?=
 =?utf-8?B?VWtUUXNKZTFKSHFUYy9JU2VkNzBLWHhGUlJKK0NlSE9NM0dad3AvZXE2TWxC?=
 =?utf-8?B?b0hqU2Ira2dqYjFxMlhtSjJyeXZyV1RCN0FpUEk2ZGkvWmx3dEpXTytVTFU0?=
 =?utf-8?B?anVPQ2FLRTYvU0FMRzNENHlSbUVEUGFCbnJCOFc0RjQvOGVtck1hcUI2dnl2?=
 =?utf-8?B?ck5ZK0pvRmpKQmJRWDNhakJ3RVlGcmpQdzd1ekpPOUhxQXYrRWd0WVozdnI2?=
 =?utf-8?B?RzExSHluV2NmWUtyTHVDSnBpUzk4Mk9uVlNLRDU3TEhudm5CNGliQmowOGhv?=
 =?utf-8?B?Yk5hUURYL2w0Z1RXWVF6WXB5ZjFGYkc3anV0Vkl1SHhoUDd6Qy9DL3NmdzNl?=
 =?utf-8?B?SVBJb1kvaTlaS05wQWRmMGR1dVZzMWsrd2hFRG9DOG5HQWhRT0dOL2JPR3Fa?=
 =?utf-8?B?YTJFOW1PRUt2TERIZStyVytGY2kxb3pOTkdqV2Iyd2YzeGhyNnBVb2tEWndL?=
 =?utf-8?B?ZDdTK0xpQ25BckEzbFB4OWtHWUVsTHlZUVJsL0dycE9OK0plQXJxZFJLb2pu?=
 =?utf-8?B?Y1MvTEJHc3Z1U2ZvM1JkM1pCYnIxMlNPaHZ6by9BTW1BS2pURFhQSHVaUkk2?=
 =?utf-8?B?eElRRzB1RHJubzJSUUFaVUtRVTFPRkxvQ3J5ekExSlo5eFg1dzgwKzJ0L3ZN?=
 =?utf-8?B?aWdmMExsRmtaQlFOamVzTW1KNUFQOVYzRkRXQ1c5dW8vamxHaHJxQTl3YVY5?=
 =?utf-8?B?bWgvbDl1QTJPRkt6V2VGVnY4RUtsRzhxa2VQMkxTdDlnV3NUd2Z6Z3FTaUZh?=
 =?utf-8?B?eFFzWXhQaGZ3SWNuZTF0NllRTjFBYkFQL1B0SlVKc245R05ZTXVUZUQ2SzRT?=
 =?utf-8?B?eTZuOXBUZm81UWVYUi95cStTaHVid0xQSWsvWXgwNFRMV25vYzF2RUVBbFZH?=
 =?utf-8?B?R0MzcW96TTBHUHBxU3cxbVVsSmpoSUtRQWc5YXZXdmViVlliaHArd1VQS09z?=
 =?utf-8?B?U0FZOEFDYm1QdG91TFRVbmR4R0tkdU9INWhmZk9RQjdIRzNjeEVWMHNHK25O?=
 =?utf-8?B?TE5iQjFEUWVsZWNKTG1FOWx0RmdIUm45aitsR3VQL0QzK3NmZkNvelZ1Q1o4?=
 =?utf-8?B?eTU2a3pUeU9pNnNNOFcyMWg5VlZpYnVQVGVQSCtzMWd2VFJXa3JDNzJhU29k?=
 =?utf-8?B?YmZGVTFWZklUTHdiSkxyN2hDS1BqU2Q1Mm9zeXV4dzQ0bk90dzJralFRTHJr?=
 =?utf-8?B?bXB4TGsrTDJJTVRHMm53eGJxVlQ1Rk5GaXE5dzBaeTJoTFF5R05UOHJodWVa?=
 =?utf-8?Q?cKpjnnv5lZuiEcCaaTorE5fIsL66aKszJoeWTOb8AdC2c?=
X-MS-Exchange-AntiSpam-MessageData-1: LMCrneA9DVFeIQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4ea98f-2194-410e-f6f4-08de8166024a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 01:07:06.2821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfRZZb8/ONqVct+3Hz1RNNhCjWSvNazqL3AtV50hvpwAITtJnToL3i/jrRTaSZ0eQZyF/Nw4yI63ORc/1nnabA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033

Replace the nova-core internal `register!` macro by the one defined in
the `kernel` crate and remove our own private implementations.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs                    | 333 +++++-----
 drivers/gpu/nova-core/falcon/gsp.rs                |  25 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs          |  70 +-
 drivers/gpu/nova-core/falcon/hal/tu102.rs          |  12 +-
 drivers/gpu/nova-core/falcon/sec2.rs               |  17 +-
 drivers/gpu/nova-core/fb.rs                        |   6 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs              |  37 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs              |   7 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs              |  17 +-
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |  19 +-
 drivers/gpu/nova-core/gfw.rs                       |  11 +-
 drivers/gpu/nova-core/gpu.rs                       |  36 +-
 drivers/gpu/nova-core/gsp/boot.rs                  |  11 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                  |   9 +-
 drivers/gpu/nova-core/regs.rs                      | 616 +++++++++--------
 drivers/gpu/nova-core/regs/macros.rs               | 739 ---------------------
 16 files changed, 676 insertions(+), 1289 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 7097a206ec3c..f812c131d313 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -13,7 +13,15 @@
         DmaAddress,
         DmaMask, //
     },
-    io::poll::read_poll_timeout,
+    io::{
+        poll::read_poll_timeout,
+        register::{
+            RegisterBase,
+            WithBase, //
+        },
+        Io,
+    },
+    num::Bounded,
     prelude::*,
     sync::aref::ARef,
     time::Delta,
@@ -30,7 +38,6 @@
         IntoSafeCast, //
     },
     regs,
-    regs::macros::RegisterBase, //
 };
 
 pub(crate) mod gsp;
@@ -41,11 +48,11 @@
 pub(crate) const MEM_BLOCK_ALIGNMENT: usize = 256;
 
 // TODO[FPRI]: Replace with `ToPrimitive`.
-macro_rules! impl_from_enum_to_u8 {
-    ($enum_type:ty) => {
-        impl From<$enum_type> for u8 {
+macro_rules! impl_from_enum_to_bounded {
+    ($enum_type:ty, $length:literal) => {
+        impl From<$enum_type> for Bounded<u32, $length> {
             fn from(value: $enum_type) -> Self {
-                value as u8
+                Bounded::from_expr(value as u32)
             }
         }
     };
@@ -53,10 +60,8 @@ fn from(value: $enum_type) -> Self {
 
 /// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
 /// register.
-#[repr(u8)]
-#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
 pub(crate) enum FalconCoreRev {
-    #[default]
     Rev1 = 1,
     Rev2 = 2,
     Rev3 = 3,
@@ -65,16 +70,16 @@ pub(crate) enum FalconCoreRev {
     Rev6 = 6,
     Rev7 = 7,
 }
-impl_from_enum_to_u8!(FalconCoreRev);
+impl_from_enum_to_bounded!(FalconCoreRev, 4);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconCoreRev {
+impl TryFrom<Bounded<u32, 4>> for FalconCoreRev {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
+    fn try_from(value: Bounded<u32, 4>) -> Result<Self> {
         use FalconCoreRev::*;
 
-        let rev = match value {
+        let rev = match value.get() {
             1 => Rev1,
             2 => Rev2,
             3 => Rev3,
@@ -91,46 +96,38 @@ fn try_from(value: u8) -> Result<Self> {
 
 /// Revision subversion number of a falcon core, used in the
 /// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
-#[repr(u8)]
-#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
 pub(crate) enum FalconCoreRevSubversion {
-    #[default]
     Subversion0 = 0,
     Subversion1 = 1,
     Subversion2 = 2,
     Subversion3 = 3,
 }
-impl_from_enum_to_u8!(FalconCoreRevSubversion);
+impl_from_enum_to_bounded!(FalconCoreRevSubversion, 2);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconCoreRevSubversion {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
+impl From<Bounded<u32, 2>> for FalconCoreRevSubversion {
+    fn from(value: Bounded<u32, 2>) -> Self {
         use FalconCoreRevSubversion::*;
 
-        let sub_version = match value & 0b11 {
+        match value.get() {
             0 => Subversion0,
             1 => Subversion1,
             2 => Subversion2,
             3 => Subversion3,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(sub_version)
+            // SAFETY: `value` comes from a 2-bit `Bounded`, and we just checked all possible
+            // values.
+            _ => unsafe { core::hint::unreachable_unchecked() },
+        }
     }
 }
 
-/// Security model of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
-/// register.
-#[repr(u8)]
-#[derive(Debug, Default, Copy, Clone)]
 /// Security mode of the Falcon microprocessor.
 ///
 /// See `falcon.rst` for more details.
+#[derive(Debug, Copy, Clone)]
 pub(crate) enum FalconSecurityModel {
     /// Non-Secure: runs unsigned code without privileges.
-    #[default]
     None = 0,
     /// Light-Secured (LS): Runs signed code with some privileges.
     /// Entry into this mode is only possible from 'Heavy-secure' mode, which verifies the code's
@@ -144,16 +141,16 @@ pub(crate) enum FalconSecurityModel {
     /// Also known as High-Secure, Privilege Level 3 or PL3.
     Heavy = 3,
 }
-impl_from_enum_to_u8!(FalconSecurityModel);
+impl_from_enum_to_bounded!(FalconSecurityModel, 2);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconSecurityModel {
+impl TryFrom<Bounded<u32, 2>> for FalconSecurityModel {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
+    fn try_from(value: Bounded<u32, 2>) -> Result<Self> {
         use FalconSecurityModel::*;
 
-        let sec_model = match value {
+        let sec_model = match value.get() {
             0 => None,
             2 => Light,
             3 => Heavy,
@@ -166,24 +163,22 @@ fn try_from(value: u8) -> Result<Self> {
 
 /// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
 /// register. It is passed to the Falcon Boot ROM (BROM) as a parameter.
-#[repr(u8)]
-#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+#[derive(Debug, Copy, Clone, PartialEq, Eq)]
 pub(crate) enum FalconModSelAlgo {
     /// AES.
-    #[expect(dead_code)]
     Aes = 0,
     /// RSA3K.
-    #[default]
     Rsa3k = 1,
 }
-impl_from_enum_to_u8!(FalconModSelAlgo);
+impl_from_enum_to_bounded!(FalconModSelAlgo, 8);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconModSelAlgo {
+impl TryFrom<Bounded<u32, 8>> for FalconModSelAlgo {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
+    fn try_from(value: Bounded<u32, 8>) -> Result<Self> {
+        match value.get() {
+            0 => Ok(FalconModSelAlgo::Aes),
             1 => Ok(FalconModSelAlgo::Rsa3k),
             _ => Err(EINVAL),
         }
@@ -191,21 +186,19 @@ fn try_from(value: u8) -> Result<Self> {
 }
 
 /// Valid values for the `size` field of the [`crate::regs::NV_PFALCON_FALCON_DMATRFCMD`] register.
-#[repr(u8)]
-#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+#[derive(Debug, Copy, Clone, PartialEq, Eq)]
 pub(crate) enum DmaTrfCmdSize {
     /// 256 bytes transfer.
-    #[default]
     Size256B = 0x6,
 }
-impl_from_enum_to_u8!(DmaTrfCmdSize);
+impl_from_enum_to_bounded!(DmaTrfCmdSize, 3);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for DmaTrfCmdSize {
+impl TryFrom<Bounded<u32, 3>> for DmaTrfCmdSize {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
+    fn try_from(value: Bounded<u32, 3>) -> Result<Self> {
+        match value.get() {
             0x6 => Ok(Self::Size256B),
             _ => Err(EINVAL),
         }
@@ -213,33 +206,24 @@ fn try_from(value: u8) -> Result<Self> {
 }
 
 /// Currently active core on a dual falcon/riscv (Peregrine) controller.
-#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum PeregrineCoreSelect {
     /// Falcon core is active.
-    #[default]
     Falcon = 0,
     /// RISC-V core is active.
     Riscv = 1,
 }
+impl_from_enum_to_bounded!(PeregrineCoreSelect, 1);
 
-impl From<bool> for PeregrineCoreSelect {
-    fn from(value: bool) -> Self {
-        match value {
+impl From<Bounded<u32, 1>> for PeregrineCoreSelect {
+    fn from(value: Bounded<u32, 1>) -> Self {
+        match bool::from(value) {
             false => PeregrineCoreSelect::Falcon,
             true => PeregrineCoreSelect::Riscv,
         }
     }
 }
 
-impl From<PeregrineCoreSelect> for bool {
-    fn from(value: PeregrineCoreSelect) -> Self {
-        match value {
-            PeregrineCoreSelect::Falcon => false,
-            PeregrineCoreSelect::Riscv => true,
-        }
-    }
-}
-
 /// Different types of memory present in a falcon core.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum FalconMem {
@@ -255,10 +239,8 @@ pub(crate) enum FalconMem {
 /// Defines the Framebuffer Interface (FBIF) aperture type.
 /// This determines the memory type for external memory access during a DMA transfer, which is
 /// performed by the Falcon's Framebuffer DMA (FBDMA) engine. See falcon.rst for more details.
-#[derive(Debug, Clone, Default)]
+#[derive(Debug, Clone)]
 pub(crate) enum FalconFbifTarget {
-    /// VRAM.
-    #[default]
     /// Local Framebuffer (GPU's VRAM memory).
     LocalFb = 0,
     /// Coherent system memory (System DRAM).
@@ -266,14 +248,14 @@ pub(crate) enum FalconFbifTarget {
     /// Non-coherent system memory (System DRAM).
     NoncoherentSysmem = 2,
 }
-impl_from_enum_to_u8!(FalconFbifTarget);
+impl_from_enum_to_bounded!(FalconFbifTarget, 2);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconFbifTarget {
+impl TryFrom<Bounded<u32, 2>> for FalconFbifTarget {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        let res = match value {
+    fn try_from(value: Bounded<u32, 2>) -> Result<Self> {
+        let res = match value.get() {
             0 => Self::LocalFb,
             1 => Self::CoherentSysmem,
             2 => Self::NoncoherentSysmem,
@@ -285,34 +267,25 @@ fn try_from(value: u8) -> Result<Self> {
 }
 
 /// Type of memory addresses to use.
-#[derive(Debug, Clone, Default)]
+#[derive(Debug, Clone)]
 pub(crate) enum FalconFbifMemType {
     /// Virtual memory addresses.
-    #[default]
     Virtual = 0,
     /// Physical memory addresses.
     Physical = 1,
 }
+impl_from_enum_to_bounded!(FalconFbifMemType, 1);
 
 /// Conversion from a single-bit register field.
-impl From<bool> for FalconFbifMemType {
-    fn from(value: bool) -> Self {
-        match value {
+impl From<Bounded<u32, 1>> for FalconFbifMemType {
+    fn from(value: Bounded<u32, 1>) -> Self {
+        match bool::from(value) {
             false => Self::Virtual,
             true => Self::Physical,
         }
     }
 }
 
-impl From<FalconFbifMemType> for bool {
-    fn from(value: FalconFbifMemType) -> Self {
-        match value {
-            FalconFbifMemType::Virtual => false,
-            FalconFbifMemType::Physical => true,
-        }
-    }
-}
-
 /// Type used to represent the `PFALCON` registers address base for a given falcon engine.
 pub(crate) struct PFalconBase(());
 
@@ -321,13 +294,10 @@ fn from(value: FalconFbifMemType) -> Self {
 
 /// Trait defining the parameters of a given Falcon engine.
 ///
-/// Each engine provides one base for `PFALCON` and `PFALCON2` registers. The `ID` constant is used
-/// to identify a given Falcon instance with register I/O methods.
+/// Each engine provides one base for `PFALCON` and `PFALCON2` registers.
 pub(crate) trait FalconEngine:
     Send + Sync + RegisterBase<PFalconBase> + RegisterBase<PFalcon2Base> + Sized
 {
-    /// Singleton of the engine, used to identify it with register I/O methods.
-    const ID: Self;
 }
 
 /// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM)
@@ -521,8 +491,14 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
 
     /// Resets DMA-related registers.
     pub(crate) fn dma_reset(&self, bar: &Bar0) {
-        regs::NV_PFALCON_FBIF_CTL::update(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
-        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+        bar.update(regs::NV_PFALCON_FBIF_CTL::of::<E>(), |v| {
+            v.with_allow_phys_no_ctx(true)
+        });
+
+        bar.write(
+            WithBase::of::<E>(),
+            regs::NV_PFALCON_FALCON_DMACTL::zeroed(),
+        );
     }
 
     /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
@@ -531,9 +507,10 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
         self.hal.select_core(self, bar)?;
         self.hal.reset_wait_mem_scrubbing(bar)?;
 
-        regs::NV_PFALCON_FALCON_RM::default()
-            .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
-            .write(bar, &E::ID);
+        bar.write(
+            WithBase::of::<E>(),
+            regs::NV_PFALCON_FALCON_RM::from(bar.read(regs::NV_PMC_BOOT_0).into_raw()),
+        );
 
         Ok(())
     }
@@ -551,25 +528,27 @@ fn pio_wr_imem_slice(&self, bar: &Bar0, load_offsets: FalconPioImemLoadTarget<'_
             return Err(EINVAL);
         }
 
-        regs::NV_PFALCON_FALCON_IMEMC::default()
-            .set_secure(load_offsets.secure)
-            .set_aincw(true)
-            .set_offs(load_offsets.dst_start)
-            .write(bar, &E::ID, Self::PIO_PORT);
+        bar.write(
+            WithBase::of::<E>().at(Self::PIO_PORT),
+            regs::NV_PFALCON_FALCON_IMEMC::zeroed()
+                .with_secure(load_offsets.secure)
+                .with_aincw(true)
+                .with_offs(load_offsets.dst_start),
+        );
 
         for (n, block) in load_offsets.data.chunks(MEM_BLOCK_ALIGNMENT).enumerate() {
             let n = u16::try_from(n)?;
             let tag: u16 = load_offsets.start_tag.checked_add(n).ok_or(ERANGE)?;
-            regs::NV_PFALCON_FALCON_IMEMT::default().set_tag(tag).write(
-                bar,
-                &E::ID,
-                Self::PIO_PORT,
+            bar.write(
+                WithBase::of::<E>().at(Self::PIO_PORT),
+                regs::NV_PFALCON_FALCON_IMEMT::zeroed().with_tag(tag),
             );
             for word in block.chunks_exact(4) {
                 let w = [word[0], word[1], word[2], word[3]];
-                regs::NV_PFALCON_FALCON_IMEMD::default()
-                    .set_data(u32::from_le_bytes(w))
-                    .write(bar, &E::ID, Self::PIO_PORT);
+                bar.write(
+                    WithBase::of::<E>().at(Self::PIO_PORT),
+                    regs::NV_PFALCON_FALCON_IMEMD::zeroed().with_data(u32::from_le_bytes(w)),
+                );
             }
         }
 
@@ -586,16 +565,19 @@ fn pio_wr_dmem_slice(&self, bar: &Bar0, load_offsets: FalconPioDmemLoadTarget<'_
             return Err(EINVAL);
         }
 
-        regs::NV_PFALCON_FALCON_DMEMC::default()
-            .set_aincw(true)
-            .set_offs(load_offsets.dst_start)
-            .write(bar, &E::ID, Self::PIO_PORT);
+        bar.write(
+            WithBase::of::<E>().at(Self::PIO_PORT),
+            regs::NV_PFALCON_FALCON_DMEMC::zeroed()
+                .with_aincw(true)
+                .with_offs(load_offsets.dst_start),
+        );
 
         for word in load_offsets.data.chunks_exact(4) {
             let w = [word[0], word[1], word[2], word[3]];
-            regs::NV_PFALCON_FALCON_DMEMD::default()
-                .set_data(u32::from_le_bytes(w))
-                .write(bar, &E::ID, Self::PIO_PORT);
+            bar.write(
+                WithBase::of::<E>().at(Self::PIO_PORT),
+                regs::NV_PFALCON_FALCON_DMEMD::zeroed().with_data(u32::from_le_bytes(w)),
+            );
         }
 
         Ok(())
@@ -607,11 +589,14 @@ pub(crate) fn pio_load<F: FalconFirmware<Target = E> + FalconPioLoadable>(
         bar: &Bar0,
         fw: &F,
     ) -> Result {
-        regs::NV_PFALCON_FBIF_CTL::read(bar, &E::ID)
-            .set_allow_phys_no_ctx(true)
-            .write(bar, &E::ID);
+        bar.update(regs::NV_PFALCON_FBIF_CTL::of::<E>(), |v| {
+            v.with_allow_phys_no_ctx(true)
+        });
 
-        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+        bar.write(
+            WithBase::of::<E>(),
+            regs::NV_PFALCON_FALCON_DMACTL::zeroed(),
+        );
 
         if let Some(imem_ns) = fw.imem_ns_load_params() {
             self.pio_wr_imem_slice(bar, imem_ns)?;
@@ -623,9 +608,10 @@ pub(crate) fn pio_load<F: FalconFirmware<Target = E> + FalconPioLoadable>(
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
 
-        regs::NV_PFALCON_FALCON_BOOTVEC::default()
-            .set_value(fw.boot_addr())
-            .write(bar, &E::ID);
+        bar.write(
+            WithBase::of::<E>(),
+            regs::NV_PFALCON_FALCON_BOOTVEC::zeroed().with_value(fw.boot_addr()),
+        );
 
         Ok(())
     }
@@ -694,36 +680,42 @@ fn dma_wr(
 
         // Set up the base source DMA address.
 
-        regs::NV_PFALCON_FALCON_DMATRFBASE::default()
-            // CAST: `as u32` is used on purpose since we do want to strip the upper bits, which
-            // will be written to `NV_PFALCON_FALCON_DMATRFBASE1`.
-            .set_base((dma_start >> 8) as u32)
-            .write(bar, &E::ID);
-        regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
-            // CAST: `as u16` is used on purpose since the remaining bits are guaranteed to fit
-            // within a `u16`.
-            .set_base((dma_start >> 40) as u16)
-            .write(bar, &E::ID);
+        bar.write(
+            WithBase::of::<E>(),
+            regs::NV_PFALCON_FALCON_DMATRFBASE::zeroed().with_base(
+                // CAST: `as u32` is used on purpose since we do want to strip the upper bits,
+                // which will be written to `NV_PFALCON_FALCON_DMATRFBASE1`.
+                (dma_start >> 8) as u32,
+            ),
+        );
+        bar.write(
+            WithBase::of::<E>(),
+            regs::NV_PFALCON_FALCON_DMATRFBASE1::zeroed().try_with_base(dma_start >> 40)?,
+        );
 
-        let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
-            .set_size(DmaTrfCmdSize::Size256B)
+        let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::zeroed()
+            .with_size(DmaTrfCmdSize::Size256B)
             .with_falcon_mem(target_mem);
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
-            regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
-                .set_offs(load_offsets.dst_start + pos)
-                .write(bar, &E::ID);
-            regs::NV_PFALCON_FALCON_DMATRFFBOFFS::default()
-                .set_offs(src_start + pos)
-                .write(bar, &E::ID);
-            cmd.write(bar, &E::ID);
+            bar.write(
+                WithBase::of::<E>(),
+                regs::NV_PFALCON_FALCON_DMATRFMOFFS::zeroed()
+                    .try_with_offs(load_offsets.dst_start + pos)?,
+            );
+            bar.write(
+                WithBase::of::<E>(),
+                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed().with_offs(src_start + pos),
+            );
+
+            bar.write(WithBase::of::<E>(), cmd);
 
             // Wait for the transfer to complete.
             // TIMEOUT: arbitrarily large value, no DMA transfer to the falcon's small memories
             // should ever take that long.
             read_poll_timeout(
-                || Ok(regs::NV_PFALCON_FALCON_DMATRFCMD::read(bar, &E::ID)),
+                || Ok(bar.read(regs::NV_PFALCON_FALCON_DMATRFCMD::of::<E>())),
                 |r| r.idle(),
                 Delta::ZERO,
                 Delta::from_secs(2),
@@ -744,9 +736,9 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
         let dma_obj = DmaObject::from_data(dev, fw.as_slice())?;
 
         self.dma_reset(bar);
-        regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
-            v.set_target(FalconFbifTarget::CoherentSysmem)
-                .set_mem_type(FalconFbifMemType::Physical)
+        bar.update(regs::NV_PFALCON_FBIF_TRANSCFG::of::<E>().at(0), |v| {
+            v.with_target(FalconFbifTarget::CoherentSysmem)
+                .with_mem_type(FalconFbifMemType::Physical)
         });
 
         self.dma_wr(
@@ -760,9 +752,10 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
         self.hal.program_brom(self, bar, &fw.brom_params())?;
 
         // Set `BootVec` to start of non-secure code.
-        regs::NV_PFALCON_FALCON_BOOTVEC::default()
-            .set_value(fw.boot_addr())
-            .write(bar, &E::ID);
+        bar.write(
+            WithBase::of::<E>(),
+            regs::NV_PFALCON_FALCON_BOOTVEC::zeroed().with_value(fw.boot_addr()),
+        );
 
         Ok(())
     }
@@ -771,7 +764,7 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
     pub(crate) fn wait_till_halted(&self, bar: &Bar0) -> Result<()> {
         // TIMEOUT: arbitrarily large value, firmwares should complete in less than 2 seconds.
         read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID)),
+            || Ok(bar.read(regs::NV_PFALCON_FALCON_CPUCTL::of::<E>())),
             |r| r.halted(),
             Delta::ZERO,
             Delta::from_secs(2),
@@ -782,13 +775,18 @@ pub(crate) fn wait_till_halted(&self, bar: &Bar0) -> Result<()> {
 
     /// Start the falcon CPU.
     pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
-        match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID).alias_en() {
-            true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
-                .set_startcpu(true)
-                .write(bar, &E::ID),
-            false => regs::NV_PFALCON_FALCON_CPUCTL::default()
-                .set_startcpu(true)
-                .write(bar, &E::ID),
+        match bar
+            .read(regs::NV_PFALCON_FALCON_CPUCTL::of::<E>())
+            .alias_en()
+        {
+            true => bar.write(
+                WithBase::of::<E>(),
+                regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::zeroed().with_startcpu(true),
+            ),
+            false => bar.write(
+                WithBase::of::<E>(),
+                regs::NV_PFALCON_FALCON_CPUCTL::zeroed().with_startcpu(true),
+            ),
         }
 
         Ok(())
@@ -797,26 +795,30 @@ pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
     /// Writes values to the mailbox registers if provided.
     pub(crate) fn write_mailboxes(&self, bar: &Bar0, mbox0: Option<u32>, mbox1: Option<u32>) {
         if let Some(mbox0) = mbox0 {
-            regs::NV_PFALCON_FALCON_MAILBOX0::default()
-                .set_value(mbox0)
-                .write(bar, &E::ID);
+            bar.write(
+                WithBase::of::<E>(),
+                regs::NV_PFALCON_FALCON_MAILBOX0::zeroed().with_value(mbox0),
+            );
         }
 
         if let Some(mbox1) = mbox1 {
-            regs::NV_PFALCON_FALCON_MAILBOX1::default()
-                .set_value(mbox1)
-                .write(bar, &E::ID);
+            bar.write(
+                WithBase::of::<E>(),
+                regs::NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(mbox1),
+            );
         }
     }
 
     /// Reads the value from `mbox0` register.
     pub(crate) fn read_mailbox0(&self, bar: &Bar0) -> u32 {
-        regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value()
+        bar.read(regs::NV_PFALCON_FALCON_MAILBOX0::of::<E>())
+            .value()
     }
 
     /// Reads the value from `mbox1` register.
     pub(crate) fn read_mailbox1(&self, bar: &Bar0) -> u32 {
-        regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, &E::ID).value()
+        bar.read(regs::NV_PFALCON_FALCON_MAILBOX1::of::<E>())
+            .value()
     }
 
     /// Reads values from both mailbox registers.
@@ -881,8 +883,9 @@ pub(crate) fn load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
 
     /// Write the application version to the OS register.
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
-        regs::NV_PFALCON_FALCON_OS::default()
-            .set_value(app_version)
-            .write(bar, &E::ID);
+        bar.write(
+            WithBase::of::<E>(),
+            regs::NV_PFALCON_FALCON_OS::zeroed().with_value(app_version),
+        );
     }
 }
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index 67edef3636c1..41b9fa49414c 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -1,7 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use kernel::{
-    io::poll::read_poll_timeout,
+    io::{
+        poll::read_poll_timeout,
+        register::{RegisterBase, WithBase},
+        Io,
+    },
     prelude::*,
     time::Delta, //
 };
@@ -14,13 +18,9 @@
         PFalcon2Base,
         PFalconBase, //
     },
-    regs::{
-        self,
-        macros::RegisterBase, //
-    },
+    regs,
 };
 
-/// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
 pub(crate) struct Gsp(());
 
 impl RegisterBase<PFalconBase> for Gsp {
@@ -31,23 +31,22 @@ impl RegisterBase<PFalcon2Base> for Gsp {
     const BASE: usize = 0x00111000;
 }
 
-impl FalconEngine for Gsp {
-    const ID: Self = Gsp(());
-}
+impl FalconEngine for Gsp {}
 
 impl Falcon<Gsp> {
     /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
     /// allow GSP to signal CPU for processing new messages in message queue.
     pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
-        regs::NV_PFALCON_FALCON_IRQSCLR::default()
-            .set_swgen0(true)
-            .write(bar, &Gsp::ID);
+        bar.write(
+            WithBase::of::<Gsp>(),
+            regs::NV_PFALCON_FALCON_IRQSCLR::zeroed().with_swgen0(true),
+        );
     }
 
     /// Checks if GSP reload/resume has completed during the boot process.
     pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
         read_poll_timeout(
-            || Ok(regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar)),
+            || Ok(bar.read(regs::NV_PGC6_BSI_SECURE_SCRATCH_14)),
             |val| val.boot_stage_3_handoff(),
             Delta::ZERO,
             timeout,
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 8f62df10da0a..e8c8414c90f2 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -4,7 +4,11 @@
 
 use kernel::{
     device,
-    io::poll::read_poll_timeout,
+    io::{
+        poll::read_poll_timeout,
+        register::{Array, WithBase},
+        Io,
+    },
     prelude::*,
     time::Delta, //
 };
@@ -25,15 +29,16 @@
 use super::FalconHal;
 
 fn select_core_ga102<E: FalconEngine>(bar: &Bar0) -> Result {
-    let bcr_ctrl = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, &E::ID);
+    let bcr_ctrl = bar.read(regs::NV_PRISCV_RISCV_BCR_CTRL::of::<E>());
     if bcr_ctrl.core_select() != PeregrineCoreSelect::Falcon {
-        regs::NV_PRISCV_RISCV_BCR_CTRL::default()
-            .set_core_select(PeregrineCoreSelect::Falcon)
-            .write(bar, &E::ID);
+        bar.write(
+            WithBase::of::<E>(),
+            regs::NV_PRISCV_RISCV_BCR_CTRL::zeroed().with_core_select(PeregrineCoreSelect::Falcon),
+        );
 
         // TIMEOUT: falcon core should take less than 10ms to report being enabled.
         read_poll_timeout(
-            || Ok(regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, &E::ID)),
+            || Ok(bar.read(regs::NV_PRISCV_RISCV_BCR_CTRL::of::<E>())),
             |r| r.valid(),
             Delta::ZERO,
             Delta::from_millis(10),
@@ -60,34 +65,43 @@ fn signature_reg_fuse_version_ga102(
 
     // `ucode_idx` is guaranteed to be in the range [0..15], making the `read` calls provable valid
     // at build-time.
-    let reg_fuse_version = if engine_id_mask & 0x0001 != 0 {
-        regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::read(bar, ucode_idx).data()
+    let reg_fuse_version: u16 = if engine_id_mask & 0x0001 != 0 {
+        bar.read(regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::at(ucode_idx))
+            .data()
     } else if engine_id_mask & 0x0004 != 0 {
-        regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::read(bar, ucode_idx).data()
+        bar.read(regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::at(ucode_idx))
+            .data()
     } else if engine_id_mask & 0x0400 != 0 {
-        regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::read(bar, ucode_idx).data()
+        bar.read(regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::at(ucode_idx))
+            .data()
     } else {
         dev_err!(dev, "unexpected engine_id_mask {:#x}\n", engine_id_mask);
         return Err(EINVAL);
-    };
+    }
+    .into();
 
     // TODO[NUMM]: replace with `last_set_bit` once it lands.
     Ok(u16::BITS - reg_fuse_version.leading_zeros())
 }
 
 fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {
-    regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
-        .set_value(params.pkc_data_offset)
-        .write(bar, &E::ID, 0);
-    regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
-        .set_value(u32::from(params.engine_id_mask))
-        .write(bar, &E::ID);
-    regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
-        .set_ucode_id(params.ucode_id)
-        .write(bar, &E::ID);
-    regs::NV_PFALCON2_FALCON_MOD_SEL::default()
-        .set_algo(FalconModSelAlgo::Rsa3k)
-        .write(bar, &E::ID);
+    bar.write(
+        WithBase::of::<E>().at(0),
+        regs::NV_PFALCON2_FALCON_BROM_PARAADDR::zeroed().with_value(params.pkc_data_offset),
+    );
+    bar.write(
+        WithBase::of::<E>(),
+        regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::zeroed()
+            .with_value(u32::from(params.engine_id_mask)),
+    );
+    bar.write(
+        WithBase::of::<E>(),
+        regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::zeroed().with_ucode_id(params.ucode_id),
+    );
+    bar.write(
+        WithBase::of::<E>(),
+        regs::NV_PFALCON2_FALCON_MOD_SEL::zeroed().with_algo(FalconModSelAlgo::Rsa3k),
+    );
 
     Ok(())
 }
@@ -120,14 +134,14 @@ fn program_brom(&self, _falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParam
     }
 
     fn is_riscv_active(&self, bar: &Bar0) -> bool {
-        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
-        cpuctl.active_stat()
+        bar.read(regs::NV_PRISCV_RISCV_CPUCTL::of::<E>())
+            .active_stat()
     }
 
     fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
         // TIMEOUT: memory scrubbing should complete in less than 20ms.
         read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
+            || Ok(bar.read(regs::NV_PFALCON_FALCON_HWCFG2::of::<E>())),
             |r| r.mem_scrubbing_done(),
             Delta::ZERO,
             Delta::from_millis(20),
@@ -136,12 +150,12 @@ fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
     }
 
     fn reset_eng(&self, bar: &Bar0) -> Result {
-        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
+        let _ = bar.read(regs::NV_PFALCON_FALCON_HWCFG2::of::<E>());
 
         // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
         // RESET_READY so a non-failing timeout is used.
         let _ = read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
+            || Ok(bar.read(regs::NV_PFALCON_FALCON_HWCFG2::of::<E>())),
             |r| r.reset_ready(),
             Delta::ZERO,
             Delta::from_micros(150),
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
index 7de6f24cc0a0..c7a90266cb44 100644
--- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -3,7 +3,11 @@
 use core::marker::PhantomData;
 
 use kernel::{
-    io::poll::read_poll_timeout,
+    io::{
+        poll::read_poll_timeout,
+        register::WithBase,
+        Io, //
+    },
     prelude::*,
     time::Delta, //
 };
@@ -49,14 +53,14 @@ fn program_brom(&self, _falcon: &Falcon<E>, _bar: &Bar0, _params: &FalconBromPar
     }
 
     fn is_riscv_active(&self, bar: &Bar0) -> bool {
-        let cpuctl = regs::NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS::read(bar, &E::ID);
-        cpuctl.active_stat()
+        bar.read(regs::NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS::of::<E>())
+            .active_stat()
     }
 
     fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
         // TIMEOUT: memory scrubbing should complete in less than 10ms.
         read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_DMACTL::read(bar, &E::ID)),
+            || Ok(bar.read(regs::NV_PFALCON_FALCON_DMACTL::of::<E>())),
             |r| r.mem_scrubbing_done(),
             Delta::ZERO,
             Delta::from_millis(10),
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
index b57d362e576a..91ec7d49c1f5 100644
--- a/drivers/gpu/nova-core/falcon/sec2.rs
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -1,12 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::{
-    falcon::{
-        FalconEngine,
-        PFalcon2Base,
-        PFalconBase, //
-    },
-    regs::macros::RegisterBase,
+use kernel::io::register::RegisterBase;
+
+use crate::falcon::{
+    FalconEngine,
+    PFalcon2Base,
+    PFalconBase, //
 };
 
 /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
@@ -20,6 +19,4 @@ impl RegisterBase<PFalcon2Base> for Sec2 {
     const BASE: usize = 0x00841000;
 }
 
-impl FalconEngine for Sec2 {
-    const ID: Self = Sec2(());
-}
+impl FalconEngine for Sec2 {}
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index c62abcaed547..6b392588f766 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -4,6 +4,7 @@
 
 use kernel::{
     device,
+    io::Io,
     prelude::*,
     ptr::{
         Alignable,
@@ -134,7 +135,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 let base = fb.end - NV_PRAMIN_SIZE;
 
                 if hal.supports_display(bar) {
-                    match regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar).vga_workspace_addr() {
+                    match bar
+                        .read(regs::NV_PDISP_VGA_WORKSPACE_BASE)
+                        .vga_workspace_addr()
+                    {
                         Some(addr) => {
                             if addr < base {
                                 const VBIOS_WORKSPACE_SIZE: u64 = usize_as_u64(SZ_128K);
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index e0acc41aa7cd..1c03783cddef 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -1,6 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
+use kernel::{
+    io::Io,
+    num::Bounded,
+    prelude::*, //
+};
 
 use crate::{
     driver::Bar0,
@@ -13,26 +17,31 @@
 struct Ga100;
 
 pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
-    u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
-        | u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_63_40())
+    u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
+        | u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI).adr_63_40())
             << FLUSH_SYSMEM_ADDR_SHIFT_HI
 }
 
 pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
-    regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
-        // CAST: `as u32` is used on purpose since the remaining bits are guaranteed to fit within
-        // a `u32`.
-        .set_adr_63_40((addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI) as u32)
-        .write(bar);
-    regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
-        // CAST: `as u32` is used on purpose since we want to strip the upper bits that have been
-        // written to `NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI`.
-        .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
-        .write(bar);
+    bar.write_reg(
+        regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::zeroed().with_adr_63_40(
+            Bounded::<u64, _>::from(addr)
+                .shr::<FLUSH_SYSMEM_ADDR_SHIFT_HI, _>()
+                .cast(),
+        ),
+    );
+
+    bar.write_reg(
+        regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::zeroed()
+            // CAST: `as u32` is used on purpose since we want to strip the upper bits that have
+            // been written to `NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI`.
+            .with_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32),
+    );
 }
 
 pub(super) fn display_enabled_ga100(bar: &Bar0) -> bool {
-    !regs::ga100::NV_FUSE_STATUS_OPT_DISPLAY::read(bar).display_disabled()
+    !bar.read(regs::ga100::NV_FUSE_STATUS_OPT_DISPLAY)
+        .display_disabled()
 }
 
 /// Shift applied to the sysmem address before it is written into
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index 734605905031..4b9f0f74d0e7 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
+use kernel::{
+    io::Io,
+    prelude::*, //
+};
 
 use crate::{
     driver::Bar0,
@@ -9,7 +12,7 @@
 };
 
 fn vidmem_size_ga102(bar: &Bar0) -> u64 {
-    regs::NV_USABLE_FB_SIZE_IN_MB::read(bar).usable_fb_size()
+    bar.read(regs::NV_USABLE_FB_SIZE_IN_MB).usable_fb_size()
 }
 
 struct Ga102;
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index eec984f4e816..281bb796e198 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
+use kernel::{
+    io::Io,
+    prelude::*, //
+};
 
 use crate::{
     driver::Bar0,
@@ -13,7 +16,7 @@
 pub(super) const FLUSH_SYSMEM_ADDR_SHIFT: u32 = 8;
 
 pub(super) fn read_sysmem_flush_page_gm107(bar: &Bar0) -> u64 {
-    u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
+    u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
 }
 
 pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
@@ -21,18 +24,18 @@ pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
     u32::try_from(addr >> FLUSH_SYSMEM_ADDR_SHIFT)
         .map_err(|_| EINVAL)
         .map(|addr| {
-            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
-                .set_adr_39_08(addr)
-                .write(bar)
+            bar.write_reg(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::zeroed().with_adr_39_08(addr))
         })
 }
 
 pub(super) fn display_enabled_gm107(bar: &Bar0) -> bool {
-    !regs::gm107::NV_FUSE_STATUS_OPT_DISPLAY::read(bar).display_disabled()
+    !bar.read(regs::gm107::NV_FUSE_STATUS_OPT_DISPLAY)
+        .display_disabled()
 }
 
 pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
-    regs::NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE::read(bar).usable_fb_size()
+    bar.read(regs::NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE)
+        .usable_fb_size()
 }
 
 struct Tu102;
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 342dba59b2f9..3b12d90d9412 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -12,6 +12,10 @@
         self,
         Device, //
     },
+    io::{
+        register::WithBase, //
+        Io,
+    },
     prelude::*,
     ptr::{
         Alignable,
@@ -33,7 +37,6 @@
         Falcon,
         FalconBromParams,
         FalconDmaLoadable,
-        FalconEngine,
         FalconFbifMemType,
         FalconFbifTarget,
         FalconFirmware,
@@ -288,15 +291,15 @@ pub(crate) fn run(
             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
 
         // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
-        regs::NV_PFALCON_FBIF_TRANSCFG::try_update(
-            bar,
-            &Gsp::ID,
-            usize::from_safe_cast(self.dmem_desc.ctx_dma),
+        bar.update(
+            regs::NV_PFALCON_FBIF_TRANSCFG::of::<Gsp>()
+                .try_at(usize::from_safe_cast(self.dmem_desc.ctx_dma))
+                .ok_or(EINVAL)?,
             |v| {
-                v.set_target(FalconFbifTarget::CoherentSysmem)
-                    .set_mem_type(FalconFbifMemType::Physical)
+                v.with_target(FalconFbifTarget::CoherentSysmem)
+                    .with_mem_type(FalconFbifMemType::Physical)
             },
-        )?;
+        );
 
         let (mbox0, _) = falcon
             .boot(bar, Some(0), None)
diff --git a/drivers/gpu/nova-core/gfw.rs b/drivers/gpu/nova-core/gfw.rs
index 9121f400046d..fb75dd10a172 100644
--- a/drivers/gpu/nova-core/gfw.rs
+++ b/drivers/gpu/nova-core/gfw.rs
@@ -19,7 +19,10 @@
 //! Note that the devinit sequence also needs to run during suspend/resume.
 
 use kernel::{
-    io::poll::read_poll_timeout,
+    io::{
+        poll::read_poll_timeout,
+        Io, //
+    },
     prelude::*,
     time::Delta, //
 };
@@ -58,9 +61,11 @@ pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result {
             Ok(
                 // Check that FWSEC has lowered its protection level before reading the GFW_BOOT
                 // status.
-                regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK::read(bar)
+                bar.read(regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK)
                     .read_protection_level0()
-                    && regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT::read(bar).completed(),
+                    && bar
+                        .read(regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT)
+                        .completed(),
             )
         },
         |&gfw_booted| gfw_booted,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8579d632e717..bb1c6bf88657 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,6 +4,8 @@
     device,
     devres::Devres,
     fmt,
+    io::Io,
+    num::Bounded,
     pci,
     prelude::*,
     sync::Arc, //
@@ -129,24 +131,19 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 /// Enum representation of the GPU generation.
-///
-/// TODO: remove the `Default` trait implementation, and the `#[default]`
-/// attribute, once the register!() macro (which creates Architecture items) no
-/// longer requires it for read-only fields.
-#[derive(fmt::Debug, Default, Copy, Clone)]
+#[derive(fmt::Debug, Copy, Clone)]
 #[repr(u8)]
 pub(crate) enum Architecture {
-    #[default]
     Turing = 0x16,
     Ampere = 0x17,
     Ada = 0x19,
 }
 
-impl TryFrom<u8> for Architecture {
+impl TryFrom<Bounded<u32, 6>> for Architecture {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
+    fn try_from(value: Bounded<u32, 6>) -> Result<Self> {
+        match u8::from(value) {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
             0x19 => Ok(Self::Ada),
@@ -155,23 +152,26 @@ fn try_from(value: u8) -> Result<Self> {
     }
 }
 
-impl From<Architecture> for u8 {
+impl From<Architecture> for Bounded<u32, 6> {
     fn from(value: Architecture) -> Self {
-        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
-        value as u8
+        match value {
+            Architecture::Turing => Bounded::<u8, 6>::new::<0x16>().cast(),
+            Architecture::Ampere => Bounded::<u8, 6>::new::<0x17>().cast(),
+            Architecture::Ada => Bounded::<u8, 6>::new::<0x19>().cast(),
+        }
     }
 }
 
 pub(crate) struct Revision {
-    major: u8,
-    minor: u8,
+    major: Bounded<u8, 4>,
+    minor: Bounded<u8, 4>,
 }
 
 impl From<regs::NV_PMC_BOOT_42> for Revision {
     fn from(boot0: regs::NV_PMC_BOOT_42) -> Self {
         Self {
-            major: boot0.major_revision(),
-            minor: boot0.minor_revision(),
+            major: boot0.major_revision().cast(),
+            minor: boot0.minor_revision().cast(),
         }
     }
 }
@@ -208,13 +208,13 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
         //     from an earlier (pre-Fermi) era, and then using boot42 to precisely identify the GPU.
         //     Somewhere in the Rubin timeframe, boot0 will no longer have space to add new GPU IDs.
 
-        let boot0 = regs::NV_PMC_BOOT_0::read(bar);
+        let boot0 = bar.read(regs::NV_PMC_BOOT_0);
 
         if boot0.is_older_than_fermi() {
             return Err(ENODEV);
         }
 
-        let boot42 = regs::NV_PMC_BOOT_42::read(bar);
+        let boot42 = bar.read(regs::NV_PMC_BOOT_42);
         Spec::try_from(boot42).inspect_err(|_| {
             dev_err!(dev, "Unsupported chipset: {}\n", boot42);
         })
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 9a00ddb922ac..d9d999519183 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -5,6 +5,7 @@
     dma::CoherentAllocation,
     dma_write,
     io::poll::read_poll_timeout,
+    io::Io,
     pci,
     prelude::*,
     time::Delta, //
@@ -57,7 +58,7 @@ fn run_fwsec_frts(
     ) -> Result<()> {
         // Check that the WPR2 region does not already exists - if it does, we cannot run
         // FWSEC-FRTS until the GPU is reset.
-        if regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).higher_bound() != 0 {
+        if bar.read(regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI).higher_bound() != 0 {
             dev_err!(
                 dev,
                 "WPR2 region already exists - GPU needs to be reset to proceed\n"
@@ -87,7 +88,9 @@ fn run_fwsec_frts(
         }
 
         // SCRATCH_E contains the error code for FWSEC-FRTS.
-        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E_FRTS_ERR::read(bar).frts_err_code();
+        let frts_status = bar
+            .read(regs::NV_PBUS_SW_SCRATCH_0E_FRTS_ERR)
+            .frts_err_code();
         if frts_status != 0 {
             dev_err!(
                 dev,
@@ -100,8 +103,8 @@ fn run_fwsec_frts(
 
         // Check that the WPR2 region has been created as we requested.
         let (wpr2_lo, wpr2_hi) = (
-            regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO::read(bar).lower_bound(),
-            regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).higher_bound(),
+            bar.read(regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO).lower_bound(),
+            bar.read(regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI).higher_bound(),
         );
 
         match (wpr2_lo, wpr2_hi) {
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 87dbbd6d1be9..fe723e400166 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -15,7 +15,10 @@
         DmaAddress, //
     },
     dma_write,
-    io::poll::read_poll_timeout,
+    io::{
+        poll::read_poll_timeout,
+        Io, //
+    },
     prelude::*,
     sync::aref::ARef,
     time::Delta,
@@ -488,9 +491,7 @@ fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
 
     /// Notifies the GSP that we have updated the command queue pointers.
     fn notify_gsp(bar: &Bar0) {
-        regs::NV_PGSP_QUEUE_HEAD::default()
-            .set_address(0)
-            .write(bar);
+        bar.write_reg(regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(0u32));
     }
 
     /// Sends `command` to the GSP.
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 53f412f0ca32..c3905879f5b6 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -1,13 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
-// Required to retain the original register names used by OpenRM, which are all capital snake case
-// but are mapped to types.
-#![allow(non_camel_case_types)]
-
-#[macro_use]
-pub(crate) mod macros;
-
 use kernel::{
+    io::{
+        register::WithBase,
+        Io, //
+    },
     prelude::*,
     time, //
 };
@@ -35,20 +32,64 @@
     num::FromSafeCast,
 };
 
+// All nova-core registers are 32-bit and `pub(crate)`. Wrap the `register!` macro to avoid
+// repeating this information for every register.
+macro_rules! nv_reg {
+    (
+        $(
+            $(#[$attr:meta])* $name:ident $([ $size:expr $(, stride = $stride:expr)? ])?
+                $(@ $offset:literal)?
+                $(@ $base:ident + $base_offset:literal)?
+                $(=> $alias:ident $(+ $alias_offset:ident)? $([$alias_idx:expr])? )?
+            $(, $comment:literal)? { $($fields:tt)* }
+        )*
+    )=> {
+        $(
+        ::kernel::io::register!(
+            @reg $(#[$attr])* pub(crate) $name(u32) $([$size $(, stride = $stride)?])?
+                $(@ $offset)?
+                $(@ $base + $base_offset)?
+                $(=> $alias $(+ $alias_offset)? $([$alias_idx])? )?
+            $(, $comment)? { $($fields)* }
+        );
+        )*
+    };
+}
+
 // PMC
 
-register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
-    3:0     minor_revision as u8, "Minor revision of the chip";
-    7:4     major_revision as u8, "Major revision of the chip";
-    8:8     architecture_1 as u8, "MSB of the architecture";
-    23:20   implementation as u8, "Implementation version of the architecture";
-    28:24   architecture_0 as u8, "Lower bits of the architecture";
-});
+nv_reg! {
+    /// Basic revision information about the GPU.
+    NV_PMC_BOOT_0 @ 0x00000000 {
+        /// Minor revision of the chip.
+        3:0     minor_revision;
+        /// Major revision of the chip.
+        7:4     major_revision;
+        /// Meta-variable `newbase` repeats 0 times, but `offset` repeats 1 time.
+        8:8     architecture_1;
+        /// Implementation version of the architecture.
+        23:20   implementation;
+        /// Lower bits of the architecture.
+        28:24   architecture_0;
+    }
+
+    /// Extended architecture information.
+    NV_PMC_BOOT_42 @ 0x00000a00 {
+        /// Minor revision of the chip.
+        15:12   minor_revision;
+        /// Major revision of the chip.
+        19:16   major_revision;
+        /// Implementation version of the architecture.
+        23:20   implementation;
+        /// Architecture value.
+        29:24   architecture ?=> Architecture;
+    }
+}
 
 impl NV_PMC_BOOT_0 {
     pub(crate) fn is_older_than_fermi(self) -> bool {
         // From https://github.com/NVIDIA/open-gpu-doc/tree/master/manuals :
-        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u8 = 0xc;
+        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u32 = 0xc;
 
         // Older chips left arch1 zeroed out. That, combined with an arch0 value that is less than
         // GF100, means "older than Fermi".
@@ -56,13 +97,6 @@ pub(crate) fn is_older_than_fermi(self) -> bool {
     }
 }
 
-register!(NV_PMC_BOOT_42 @ 0x00000a00, "Extended architecture information" {
-    15:12   minor_revision as u8, "Minor revision of the chip";
-    19:16   major_revision as u8, "Major revision of the chip";
-    23:20   implementation as u8, "Implementation version of the architecture";
-    29:24   architecture as u8 ?=> Architecture, "Architecture value";
-});
-
 impl NV_PMC_BOOT_42 {
     /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
     pub(crate) fn chipset(self) -> Result<Chipset> {
@@ -76,8 +110,8 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
 
     /// Returns the raw architecture value from the register.
     fn architecture_raw(self) -> u8 {
-        ((self.0 >> Self::ARCHITECTURE_RANGE.start()) & ((1 << Self::ARCHITECTURE_RANGE.len()) - 1))
-            as u8
+        ((self.inner >> Self::ARCHITECTURE_RANGE.start())
+            & ((1 << Self::ARCHITECTURE_RANGE.len()) - 1)) as u8
     }
 }
 
@@ -86,7 +120,7 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
         write!(
             f,
             "boot42 = 0x{:08x} (architecture 0x{:x}, implementation 0x{:x})",
-            self.0,
+            self.inner,
             self.architecture_raw(),
             self.implementation()
         )
@@ -95,35 +129,46 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
 
 // PBUS
 
-register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
+nv_reg! {
+    NV_PBUS_SW_SCRATCH[64] @ 0x00001400 {}
 
-register!(NV_PBUS_SW_SCRATCH_0E_FRTS_ERR => NV_PBUS_SW_SCRATCH[0xe],
-    "scratch register 0xe used as FRTS firmware error code" {
-    31:16   frts_err_code as u16;
-});
+    /// Scratch register 0xe used as FRTS firmware error code.
+    NV_PBUS_SW_SCRATCH_0E_FRTS_ERR => NV_PBUS_SW_SCRATCH[0xe] {
+        31:16   frts_err_code;
+    }
+}
 
 // PFB
 
-// The following two registers together hold the physical system memory address that is used by the
-// GPU to perform sysmembar operations (see `fb::SysmemFlush`).
+nv_reg! {
+    /// Low bits of the physical system memory address used by the GPU to perform sysmembar
+    /// operations (see [`crate::fb::SysmemFlush`]).
+    NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
+        31:0    adr_39_08;
+    }
 
-register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
-    31:0    adr_39_08 as u32;
-});
+    /// High bits of the physical system memory address used by the GPU to perform sysmembar
+    /// operations (see [`crate::fb::SysmemFlush`]).
+    NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI @ 0x00100c40 {
+        23:0    adr_63_40;
+    }
 
-register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI @ 0x00100c40 {
-    23:0    adr_63_40 as u32;
-});
+    NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
+        3:0     lower_scale;
+        9:4     lower_mag;
+        30:30   ecc_mode_enabled => bool;
+    }
 
-register!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
-    3:0     lower_scale as u8;
-    9:4     lower_mag as u8;
-    30:30   ecc_mode_enabled as bool;
-});
+    NV_PFB_PRI_MMU_WPR2_ADDR_LO @ 0x001fa824 {
+        /// Bits 12..40 of the lower (inclusive) bound of the WPR2 region.
+        31:4    lo_val;
+    }
 
-register!(NV_PGSP_QUEUE_HEAD @ 0x00110c00 {
-    31:0    address as u32;
-});
+    NV_PFB_PRI_MMU_WPR2_ADDR_HI @ 0x001fa828 {
+        /// Bits 12..40 of the higher (exclusive) bound of the WPR2 region.
+        31:4    hi_val;
+    }
+}
 
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
@@ -140,10 +185,6 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 }
 
-register!(NV_PFB_PRI_MMU_WPR2_ADDR_LO@0x001fa824  {
-    31:4    lo_val as u32, "Bits 12..40 of the lower (inclusive) bound of the WPR2 region";
-});
-
 impl NV_PFB_PRI_MMU_WPR2_ADDR_LO {
     /// Returns the lower (inclusive) bound of the WPR2 region.
     pub(crate) fn lower_bound(self) -> u64 {
@@ -151,10 +192,6 @@ pub(crate) fn lower_bound(self) -> u64 {
     }
 }
 
-register!(NV_PFB_PRI_MMU_WPR2_ADDR_HI@0x001fa828  {
-    31:4    hi_val as u32, "Bits 12..40 of the higher (exclusive) bound of the WPR2 region";
-});
-
 impl NV_PFB_PRI_MMU_WPR2_ADDR_HI {
     /// Returns the higher (exclusive) bound of the WPR2 region.
     ///
@@ -164,6 +201,14 @@ pub(crate) fn higher_bound(self) -> u64 {
     }
 }
 
+// PGSP
+
+nv_reg! {
+    NV_PGSP_QUEUE_HEAD @ 0x00110c00 {
+        31:0    address;
+    }
+}
+
 // PGC6 register space.
 //
 // `GC6` is a GPU low-power state where VRAM is in self-refresh and the GPU is powered down (except
@@ -173,29 +218,30 @@ pub(crate) fn higher_bound(self) -> u64 {
 // These scratch registers remain powered on even in a low-power state and have a designated group
 // number.
 
-// Boot Sequence Interface (BSI) register used to determine
-// if GSP reload/resume has completed during the boot process.
-register!(NV_PGC6_BSI_SECURE_SCRATCH_14 @ 0x001180f8 {
-    26:26   boot_stage_3_handoff as bool;
-});
-
-// Privilege level mask register. It dictates whether the host CPU has privilege to access the
-// `PGC6_AON_SECURE_SCRATCH_GROUP_05` register (which it needs to read GFW_BOOT).
-register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128,
-          "Privilege level mask register" {
-    0:0     read_protection_level0 as bool, "Set after FWSEC lowers its protection level";
-});
-
-// OpenRM defines this as a register array, but doesn't specify its size and only uses its first
-// element. Be conservative until we know the actual size or need to use more registers.
-register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234[1] {});
-
-register!(
-    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT => NV_PGC6_AON_SECURE_SCRATCH_GROUP_05[0],
-    "Scratch group 05 register 0 used as GFW boot progress indicator" {
-        7:0    progress as u8, "Progress of GFW boot (0xff means completed)";
+nv_reg! {
+    /// Boot Sequence Interface (BSI) register used to determine
+    /// if GSP reload/resume has completed during the boot process.
+    NV_PGC6_BSI_SECURE_SCRATCH_14 @ 0x001180f8 {
+        26:26   boot_stage_3_handoff => bool;
     }
-);
+
+    /// Privilege level mask register. It dictates whether the host CPU has privilege to access the
+    /// `PGC6_AON_SECURE_SCRATCH_GROUP_05` register (which it needs to read GFW_BOOT).
+    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
+        /// Set after FWSEC lowers its protection level.
+        0:0     read_protection_level0 => bool;
+    }
+
+    /// OpenRM defines this as a register array, but doesn't specify its size and only uses its
+    /// first element. Be conservative until we know the actual size or need to use more registers.
+    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05[1] @ 0x00118234 {}
+
+    /// Scratch group 05 register 0 used as GFW boot progress indicator.
+    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT => NV_PGC6_AON_SECURE_SCRATCH_GROUP_05[0] {
+        /// Progress of GFW boot (0xff means completed).
+        7:0    progress;
+    }
+}
 
 impl NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT {
     /// Returns `true` if GFW boot is completed.
@@ -204,16 +250,17 @@ pub(crate) fn completed(self) -> bool {
     }
 }
 
-register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 @ 0x001183a4 {
-    31:0    value as u32;
-});
-
-register!(
-    NV_USABLE_FB_SIZE_IN_MB => NV_PGC6_AON_SECURE_SCRATCH_GROUP_42,
-    "Scratch group 42 register used as framebuffer size" {
-        31:0    value as u32, "Usable framebuffer size, in megabytes";
+nv_reg! {
+    NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 @ 0x001183a4 {
+        31:0    value;
     }
-);
+
+    /// Scratch group 42 register used as framebuffer size.
+    NV_USABLE_FB_SIZE_IN_MB => NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 {
+        /// Usable framebuffer size, in megabytes.
+        31:0    value;
+    }
+}
 
 impl NV_USABLE_FB_SIZE_IN_MB {
     /// Returns the usable framebuffer size, in bytes.
@@ -224,10 +271,14 @@ pub(crate) fn usable_fb_size(self) -> u64 {
 
 // PDISP
 
-register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
-    3:3     status_valid as bool, "Set if the `addr` field is valid";
-    31:8    addr as u32, "VGA workspace base address divided by 0x10000";
-});
+nv_reg! {
+    NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
+        /// Set if the `addr` field is valid.
+        3:3     status_valid => bool;
+        /// VGA workspace base address divided by 0x10000.
+        31:8    addr;
+    }
+}
 
 impl NV_PDISP_VGA_WORKSPACE_BASE {
     /// Returns the base address of the VGA workspace, or `None` if none exists.
@@ -244,73 +295,162 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 
 pub(crate) const NV_FUSE_OPT_FPF_SIZE: usize = 16;
 
-register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
-});
+nv_reg! {
+    NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION[NV_FUSE_OPT_FPF_SIZE] @ 0x00824100 {
+        15:0    data;
+    }
 
-register!(NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION @ 0x00824140[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
-});
+    NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION[NV_FUSE_OPT_FPF_SIZE] @ 0x00824140 {
+        15:0    data;
+    }
 
-register!(NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION @ 0x008241c0[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
-});
-
-// PFALCON
-
-register!(NV_PFALCON_FALCON_IRQSCLR @ PFalconBase[0x00000004] {
-    4:4     halt as bool;
-    6:6     swgen0 as bool;
-});
-
-register!(NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase[0x00000040] {
-    31:0    value as u32;
-});
-
-register!(NV_PFALCON_FALCON_MAILBOX1 @ PFalconBase[0x00000044] {
-    31:0    value as u32;
-});
-
-// Used to store version information about the firmware running
-// on the Falcon processor.
-register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
-    31:0    value as u32;
-});
-
-register!(NV_PFALCON_FALCON_RM @ PFalconBase[0x00000084] {
-    31:0    value as u32;
-});
-
-register!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
-    10:10   riscv as bool;
-    12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is completed";
-    31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
-});
-
-impl NV_PFALCON_FALCON_HWCFG2 {
-    /// Returns `true` if memory scrubbing is completed.
-    pub(crate) fn mem_scrubbing_done(self) -> bool {
-        !self.mem_scrubbing()
+    NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION[NV_FUSE_OPT_FPF_SIZE] @ 0x008241c0 {
+        15:0    data;
     }
 }
 
-register!(NV_PFALCON_FALCON_CPUCTL @ PFalconBase[0x00000100] {
-    1:1     startcpu as bool;
-    4:4     halted as bool;
-    6:6     alias_en as bool;
-});
+// PFALCON
 
-register!(NV_PFALCON_FALCON_BOOTVEC @ PFalconBase[0x00000104] {
-    31:0    value as u32;
-});
+nv_reg! {
+    NV_PFALCON_FALCON_IRQSCLR @ PFalconBase + 0x00000004 {
+        4:4     halt => bool;
+        6:6     swgen0 => bool;
+    }
 
-register!(NV_PFALCON_FALCON_DMACTL @ PFalconBase[0x0000010c] {
-    0:0     require_ctx as bool;
-    1:1     dmem_scrubbing as bool;
-    2:2     imem_scrubbing as bool;
-    6:3     dmaq_num as u8;
-    7:7     secure_stat as bool;
-});
+    NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase + 0x00000040 {
+        31:0    value => u32;
+    }
+
+    NV_PFALCON_FALCON_MAILBOX1 @ PFalconBase + 0x00000044 {
+        31:0    value => u32;
+    }
+
+    /// Used to store version information about the firmware running
+    /// on the Falcon processor.
+    NV_PFALCON_FALCON_OS @ PFalconBase + 0x00000080 {
+        31:0    value => u32;
+    }
+
+    NV_PFALCON_FALCON_RM @ PFalconBase + 0x00000084 {
+        31:0    value => u32;
+    }
+
+    NV_PFALCON_FALCON_HWCFG2 @ PFalconBase + 0x000000f4 {
+        10:10   riscv => bool;
+        /// Set to 0 after memory scrubbing is completed.
+        12:12   mem_scrubbing => bool;
+        /// Signal indicating that reset is completed (GA102+).
+        31:31   reset_ready => bool;
+    }
+
+    NV_PFALCON_FALCON_CPUCTL @ PFalconBase + 0x00000100 {
+        1:1     startcpu => bool;
+        4:4     halted => bool;
+        6:6     alias_en => bool;
+    }
+
+    NV_PFALCON_FALCON_BOOTVEC @ PFalconBase + 0x00000104 {
+        31:0    value => u32;
+    }
+
+    NV_PFALCON_FALCON_DMACTL @ PFalconBase + 0x0000010c {
+        0:0     require_ctx => bool;
+        1:1     dmem_scrubbing => bool;
+        2:2     imem_scrubbing => bool;
+        6:3     dmaq_num;
+        7:7     secure_stat => bool;
+    }
+
+    NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase + 0x00000110 {
+        31:0    base => u32;
+    }
+
+    NV_PFALCON_FALCON_DMATRFMOFFS @ PFalconBase + 0x00000114 {
+        23:0    offs;
+    }
+
+    NV_PFALCON_FALCON_DMATRFCMD @ PFalconBase + 0x00000118 {
+        0:0     full => bool;
+        1:1     idle => bool;
+        3:2     sec;
+        4:4     imem => bool;
+        5:5     is_write => bool;
+        10:8    size ?=> DmaTrfCmdSize;
+        14:12   ctxdma;
+        16:16   set_dmtag;
+    }
+
+    NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase + 0x0000011c {
+        31:0    offs => u32;
+    }
+
+    NV_PFALCON_FALCON_DMATRFBASE1 @ PFalconBase + 0x00000128 {
+        8:0     base;
+    }
+
+    NV_PFALCON_FALCON_HWCFG1 @ PFalconBase + 0x0000012c {
+        /// Core revision.
+        3:0     core_rev ?=> FalconCoreRev;
+        /// Security model.
+        5:4     security_model ?=> FalconSecurityModel;
+        /// Core revision subversion.
+        7:6     core_rev_subversion => FalconCoreRevSubversion;
+    }
+
+    NV_PFALCON_FALCON_CPUCTL_ALIAS @ PFalconBase + 0x00000130 {
+        1:1     startcpu => bool;
+    }
+
+    /// IMEM access control register. Up to 4 ports are available for IMEM access.
+    NV_PFALCON_FALCON_IMEMC[4, stride = 16] @ PFalconBase + 0x00000180 {
+        /// IMEM block and word offset.
+        15:0      offs;
+        /// Auto-increment on write.
+        24:24     aincw => bool;
+        /// Access secure IMEM.
+        28:28     secure => bool;
+    }
+
+    /// IMEM data register. Reading/writing this register accesses IMEM at the address
+    /// specified by the corresponding IMEMC register.
+    NV_PFALCON_FALCON_IMEMD[4, stride = 16] @ PFalconBase + 0x00000184 {
+        31:0      data;
+    }
+
+    /// IMEM tag register. Used to set the tag for the current IMEM block.
+    NV_PFALCON_FALCON_IMEMT[4, stride = 16] @ PFalconBase + 0x00000188 {
+        15:0      tag;
+    }
+
+    /// DMEM access control register. Up to 8 ports are available for DMEM access.
+    NV_PFALCON_FALCON_DMEMC[8, stride = 8] @ PFalconBase + 0x000001c0 {
+        /// DMEM block and word offset.
+        15:0      offs;
+        /// Auto-increment on write.
+        24:24     aincw => bool;
+    }
+
+    /// DMEM data register. Reading/writing this register accesses DMEM at the address
+    /// specified by the corresponding DMEMC register.
+    NV_PFALCON_FALCON_DMEMD[8, stride = 8] @ PFalconBase + 0x000001c4 {
+        31:0      data;
+    }
+
+    /// Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the
+    /// falcon instance.
+    NV_PFALCON_FALCON_ENGINE @ PFalconBase + 0x000003c0 {
+        0:0     reset => bool;
+    }
+
+    NV_PFALCON_FBIF_TRANSCFG[8] @ PFalconBase + 0x00000600 {
+        1:0     target ?=> FalconFbifTarget;
+        2:2     mem_type => FalconFbifMemType;
+    }
+
+    NV_PFALCON_FBIF_CTL @ PFalconBase + 0x00000624 {
+        7:7     allow_phys_no_ctx => bool;
+    }
+}
 
 impl NV_PFALCON_FALCON_DMACTL {
     /// Returns `true` if memory scrubbing is completed.
@@ -319,147 +459,81 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     }
 }
 
-register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
-    31:0    base as u32;
-});
-
-register!(NV_PFALCON_FALCON_DMATRFMOFFS @ PFalconBase[0x00000114] {
-    23:0    offs as u32;
-});
-
-register!(NV_PFALCON_FALCON_DMATRFCMD @ PFalconBase[0x00000118] {
-    0:0     full as bool;
-    1:1     idle as bool;
-    3:2     sec as u8;
-    4:4     imem as bool;
-    5:5     is_write as bool;
-    10:8    size as u8 ?=> DmaTrfCmdSize;
-    14:12   ctxdma as u8;
-    16:16   set_dmtag as u8;
-});
-
 impl NV_PFALCON_FALCON_DMATRFCMD {
     /// Programs the `imem` and `sec` fields for the given FalconMem
     pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
-        self.set_imem(mem != FalconMem::Dmem)
-            .set_sec(if mem == FalconMem::ImemSecure { 1 } else { 0 })
+        let this = self.with_imem(mem != FalconMem::Dmem);
+
+        match mem {
+            FalconMem::ImemSecure => this.with_const_sec::<1>(),
+            _ => this.with_const_sec::<0>(),
+        }
     }
 }
 
-register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
-    31:0    offs as u32;
-});
-
-register!(NV_PFALCON_FALCON_DMATRFBASE1 @ PFalconBase[0x00000128] {
-    8:0     base as u16;
-});
-
-register!(NV_PFALCON_FALCON_HWCFG1 @ PFalconBase[0x0000012c] {
-    3:0     core_rev as u8 ?=> FalconCoreRev, "Core revision";
-    5:4     security_model as u8 ?=> FalconSecurityModel, "Security model";
-    7:6     core_rev_subversion as u8 ?=> FalconCoreRevSubversion, "Core revision subversion";
-});
-
-register!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ PFalconBase[0x00000130] {
-    1:1     startcpu as bool;
-});
-
-// IMEM access control register. Up to 4 ports are available for IMEM access.
-register!(NV_PFALCON_FALCON_IMEMC @ PFalconBase[0x00000180[4; 16]] {
-    15:0      offs as u16, "IMEM block and word offset";
-    24:24     aincw as bool, "Auto-increment on write";
-    28:28     secure as bool, "Access secure IMEM";
-});
-
-// IMEM data register. Reading/writing this register accesses IMEM at the address
-// specified by the corresponding IMEMC register.
-register!(NV_PFALCON_FALCON_IMEMD @ PFalconBase[0x00000184[4; 16]] {
-    31:0      data as u32;
-});
-
-// IMEM tag register. Used to set the tag for the current IMEM block.
-register!(NV_PFALCON_FALCON_IMEMT @ PFalconBase[0x00000188[4; 16]] {
-    15:0      tag as u16;
-});
-
-// DMEM access control register. Up to 8 ports are available for DMEM access.
-register!(NV_PFALCON_FALCON_DMEMC @ PFalconBase[0x000001c0[8; 8]] {
-    15:0      offs as u16, "DMEM block and word offset";
-    24:24     aincw as bool, "Auto-increment on write";
-});
-
-// DMEM data register. Reading/writing this register accesses DMEM at the address
-// specified by the corresponding DMEMC register.
-register!(NV_PFALCON_FALCON_DMEMD @ PFalconBase[0x000001c4[8; 8]] {
-    31:0      data as u32;
-});
-
-// Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
-// instance.
-register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
-    0:0     reset as bool;
-});
-
 impl NV_PFALCON_FALCON_ENGINE {
     /// Resets the falcon
     pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
-        Self::read(bar, &E::ID).set_reset(true).write(bar, &E::ID);
+        bar.update(Self::of::<E>(), |r| r.with_reset(true));
 
         // TIMEOUT: falcon engine should not take more than 10us to reset.
         time::delay::fsleep(time::Delta::from_micros(10));
 
-        Self::read(bar, &E::ID).set_reset(false).write(bar, &E::ID);
+        bar.update(Self::of::<E>(), |r| r.with_reset(false));
     }
 }
 
-register!(NV_PFALCON_FBIF_TRANSCFG @ PFalconBase[0x00000600[8]] {
-    1:0     target as u8 ?=> FalconFbifTarget;
-    2:2     mem_type as bool => FalconFbifMemType;
-});
-
-register!(NV_PFALCON_FBIF_CTL @ PFalconBase[0x00000624] {
-    7:7     allow_phys_no_ctx as bool;
-});
+impl NV_PFALCON_FALCON_HWCFG2 {
+    /// Returns `true` if memory scrubbing is completed.
+    pub(crate) fn mem_scrubbing_done(self) -> bool {
+        !self.mem_scrubbing()
+    }
+}
 
 /* PFALCON2 */
 
-register!(NV_PFALCON2_FALCON_MOD_SEL @ PFalcon2Base[0x00000180] {
-    7:0     algo as u8 ?=> FalconModSelAlgo;
-});
+nv_reg! {
+    NV_PFALCON2_FALCON_MOD_SEL @ PFalcon2Base + 0x00000180 {
+        7:0     algo ?=> FalconModSelAlgo;
+    }
 
-register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ PFalcon2Base[0x00000198] {
-    7:0    ucode_id as u8;
-});
+    NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ PFalcon2Base + 0x00000198 {
+        7:0    ucode_id => u8;
+    }
 
-register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ PFalcon2Base[0x0000019c] {
-    31:0    value as u32;
-});
+    NV_PFALCON2_FALCON_BROM_ENGIDMASK @ PFalcon2Base + 0x0000019c {
+        31:0    value => u32;
+    }
 
-// OpenRM defines this as a register array, but doesn't specify its size and only uses its first
-// element. Be conservative until we know the actual size or need to use more registers.
-register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalcon2Base[0x00000210[1]] {
-    31:0    value as u32;
-});
+    /// OpenRM defines this as a register array, but doesn't specify its size and only uses its
+    /// first element. Be conservative until we know the actual size or need to use more registers.
+    NV_PFALCON2_FALCON_BROM_PARAADDR[1] @ PFalcon2Base + 0x00000210 {
+        31:0    value => u32;
+    }
+}
 
 // PRISCV
 
-// RISC-V status register for debug (Turing and GA100 only).
-// Reflects current RISC-V core status.
-register!(NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS @ PFalcon2Base[0x00000240] {
-    0:0     active_stat as bool, "RISC-V core active/inactive status";
-});
-
 // GA102 and later
-register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
-    0:0     halted as bool;
-    7:7     active_stat as bool;
-});
+nv_reg! {
+    // RISC-V status register for debug (Turing and GA100 only).
+    // Reflects current RISC-V core status.
+    NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS @ PFalcon2Base + 0x00000240 {
+        // RISC-V core active/inactive status.
+        0:0     active_stat => bool;
+    }
 
-register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalcon2Base[0x00000668] {
-    0:0     valid as bool;
-    4:4     core_select as bool => PeregrineCoreSelect;
-    8:8     br_fetch as bool;
-});
+    NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base + 0x00000388 {
+        0:0     halted => bool;
+        7:7     active_stat => bool;
+    }
+
+    NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase + 0x00001668 {
+        0:0     valid => bool;
+        4:4     core_select => PeregrineCoreSelect;
+        8:8     br_fetch => bool;
+    }
+}
 
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
@@ -467,15 +541,19 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
 pub(crate) mod gm107 {
     // FUSE
 
-    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
-        0:0     display_disabled as bool;
-    });
+    nv_reg! {
+        NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
+            0:0     display_disabled => bool;
+        }
+    }
 }
 
 pub(crate) mod ga100 {
     // FUSE
 
-    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
-        0:0     display_disabled as bool;
-    });
+    nv_reg! {
+        NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
+            0:0     display_disabled => bool;
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
deleted file mode 100644
index ed624be1f39b..000000000000
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ /dev/null
@@ -1,739 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-//! `register!` macro to define register layout and accessors.
-//!
-//! A single register typically includes several fields, which are accessed through a combination
-//! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
-//! not all possible field values are necessarily valid.
-//!
-//! The `register!` macro in this module provides an intuitive and readable syntax for defining a
-//! dedicated type for each register. Each such type comes with its own field accessors that can
-//! return an error if a field's value is invalid. Please look at the [`bitfield`] macro for the
-//! complete syntax of fields definitions.
-
-/// Trait providing a base address to be added to the offset of a relative register to obtain
-/// its actual offset.
-///
-/// The `T` generic argument is used to distinguish which base to use, in case a type provides
-/// several bases. It is given to the `register!` macro to restrict the use of the register to
-/// implementors of this particular variant.
-pub(crate) trait RegisterBase<T> {
-    const BASE: usize;
-}
-
-/// Defines a dedicated type for a register with an absolute offset, including getter and setter
-/// methods for its fields and methods to read and write it from an `Io` region.
-///
-/// Example:
-///
-/// ```no_run
-/// register!(BOOT_0 @ 0x00000100, "Basic revision information about the GPU" {
-///    3:0     minor_revision as u8, "Minor revision of the chip";
-///    7:4     major_revision as u8, "Major revision of the chip";
-///    28:20   chipset as u32 ?=> Chipset, "Chipset model";
-/// });
-/// ```
-///
-/// This defines a `BOOT_0` type which can be read or written from offset `0x100` of an `Io`
-/// region. It is composed of 3 fields, for instance `minor_revision` is made of the 4 least
-/// significant bits of the register. Each field can be accessed and modified using accessor
-/// methods:
-///
-/// ```no_run
-/// // Read from the register's defined offset (0x100).
-/// let boot0 = BOOT_0::read(&bar);
-/// pr_info!("chip revision: {}.{}", boot0.major_revision(), boot0.minor_revision());
-///
-/// // `Chipset::try_from` is called with the value of the `chipset` field and returns an
-/// // error if it is invalid.
-/// let chipset = boot0.chipset()?;
-///
-/// // Update some fields and write the value back.
-/// boot0.set_major_revision(3).set_minor_revision(10).write(&bar);
-///
-/// // Or, just read and update the register in a single step:
-/// BOOT_0::update(&bar, |r| r.set_major_revision(3).set_minor_revision(10));
-/// ```
-///
-/// The documentation strings are optional. If present, they will be added to the type's
-/// definition, or the field getter and setter methods they are attached to.
-///
-/// It is also possible to create a alias register by using the `=> ALIAS` syntax. This is useful
-/// for cases where a register's interpretation depends on the context:
-///
-/// ```no_run
-/// register!(SCRATCH @ 0x00000200, "Scratch register" {
-///    31:0     value as u32, "Raw value";
-/// });
-///
-/// register!(SCRATCH_BOOT_STATUS => SCRATCH, "Boot status of the firmware" {
-///     0:0     completed as bool, "Whether the firmware has completed booting";
-/// });
-/// ```
-///
-/// In this example, `SCRATCH_0_BOOT_STATUS` uses the same I/O address as `SCRATCH`, while also
-/// providing its own `completed` field.
-///
-/// ## Relative registers
-///
-/// A register can be defined as being accessible from a fixed offset of a provided base. For
-/// instance, imagine the following I/O space:
-///
-/// ```text
-///           +-----------------------------+
-///           |             ...             |
-///           |                             |
-///  0x100--->+------------CPU0-------------+
-///           |                             |
-///  0x110--->+-----------------------------+
-///           |           CPU_CTL           |
-///           +-----------------------------+
-///           |             ...             |
-///           |                             |
-///           |                             |
-///  0x200--->+------------CPU1-------------+
-///           |                             |
-///  0x210--->+-----------------------------+
-///           |           CPU_CTL           |
-///           +-----------------------------+
-///           |             ...             |
-///           +-----------------------------+
-/// ```
-///
-/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at offset `0x10` of their I/O
-/// space segment. Since both instances of `CPU_CTL` share the same layout, we don't want to define
-/// them twice and would prefer a way to select which one to use from a single definition
-///
-/// This can be done using the `Base[Offset]` syntax when specifying the register's address.
-///
-/// `Base` is an arbitrary type (typically a ZST) to be used as a generic parameter of the
-/// [`RegisterBase`] trait to provide the base as a constant, i.e. each type providing a base for
-/// this register needs to implement `RegisterBase<Base>`. Here is the above example translated
-/// into code:
-///
-/// ```no_run
-/// // Type used to identify the base.
-/// pub(crate) struct CpuCtlBase;
-///
-/// // ZST describing `CPU0`.
-/// struct Cpu0;
-/// impl RegisterBase<CpuCtlBase> for Cpu0 {
-///     const BASE: usize = 0x100;
-/// }
-/// // Singleton of `CPU0` used to identify it.
-/// const CPU0: Cpu0 = Cpu0;
-///
-/// // ZST describing `CPU1`.
-/// struct Cpu1;
-/// impl RegisterBase<CpuCtlBase> for Cpu1 {
-///     const BASE: usize = 0x200;
-/// }
-/// // Singleton of `CPU1` used to identify it.
-/// const CPU1: Cpu1 = Cpu1;
-///
-/// // This makes `CPU_CTL` accessible from all implementors of `RegisterBase<CpuCtlBase>`.
-/// register!(CPU_CTL @ CpuCtlBase[0x10], "CPU core control" {
-///     0:0     start as bool, "Start the CPU core";
-/// });
-///
-/// // The `read`, `write` and `update` methods of relative registers take an extra `base` argument
-/// // that is used to resolve its final address by adding its `BASE` to the offset of the
-/// // register.
-///
-/// // Start `CPU0`.
-/// CPU_CTL::update(bar, &CPU0, |r| r.set_start(true));
-///
-/// // Start `CPU1`.
-/// CPU_CTL::update(bar, &CPU1, |r| r.set_start(true));
-///
-/// // Aliases can also be defined for relative register.
-/// register!(CPU_CTL_ALIAS => CpuCtlBase[CPU_CTL], "Alias to CPU core control" {
-///     1:1     alias_start as bool, "Start the aliased CPU core";
-/// });
-///
-/// // Start the aliased `CPU0`.
-/// CPU_CTL_ALIAS::update(bar, &CPU0, |r| r.set_alias_start(true));
-/// ```
-///
-/// ## Arrays of registers
-///
-/// Some I/O areas contain consecutive values that can be interpreted in the same way. These areas
-/// can be defined as an array of identical registers, allowing them to be accessed by index with
-/// compile-time or runtime bound checking. Simply define their address as `Address[Size]`, and add
-/// an `idx` parameter to their `read`, `write` and `update` methods:
-///
-/// ```no_run
-/// # fn no_run() -> Result<(), Error> {
-/// # fn get_scratch_idx() -> usize {
-/// #   0x15
-/// # }
-/// // Array of 64 consecutive registers with the same layout starting at offset `0x80`.
-/// register!(SCRATCH @ 0x00000080[64], "Scratch registers" {
-///     31:0    value as u32;
-/// });
-///
-/// // Read scratch register 0, i.e. I/O address `0x80`.
-/// let scratch_0 = SCRATCH::read(bar, 0).value();
-/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
-/// let scratch_15 = SCRATCH::read(bar, 15).value();
-///
-/// // This is out of bounds and won't build.
-/// // let scratch_128 = SCRATCH::read(bar, 128).value();
-///
-/// // Runtime-obtained array index.
-/// let scratch_idx = get_scratch_idx();
-/// // Access on a runtime index returns an error if it is out-of-bounds.
-/// let some_scratch = SCRATCH::try_read(bar, scratch_idx)?.value();
-///
-/// // Alias to a particular register in an array.
-/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
-/// register!(FIRMWARE_STATUS => SCRATCH[8], "Firmware exit status code" {
-///     7:0     status as u8;
-/// });
-///
-/// let status = FIRMWARE_STATUS::read(bar).status();
-///
-/// // Non-contiguous register arrays can be defined by adding a stride parameter.
-/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
-/// // registers of the two declarations below are interleaved.
-/// register!(SCRATCH_INTERLEAVED_0 @ 0x000000c0[16 ; 8], "Scratch registers bank 0" {
-///     31:0    value as u32;
-/// });
-/// register!(SCRATCH_INTERLEAVED_1 @ 0x000000c4[16 ; 8], "Scratch registers bank 1" {
-///     31:0    value as u32;
-/// });
-/// # Ok(())
-/// # }
-/// ```
-///
-/// ## Relative arrays of registers
-///
-/// Combining the two features described in the sections above, arrays of registers accessible from
-/// a base can also be defined:
-///
-/// ```no_run
-/// # fn no_run() -> Result<(), Error> {
-/// # fn get_scratch_idx() -> usize {
-/// #   0x15
-/// # }
-/// // Type used as parameter of `RegisterBase` to specify the base.
-/// pub(crate) struct CpuCtlBase;
-///
-/// // ZST describing `CPU0`.
-/// struct Cpu0;
-/// impl RegisterBase<CpuCtlBase> for Cpu0 {
-///     const BASE: usize = 0x100;
-/// }
-/// // Singleton of `CPU0` used to identify it.
-/// const CPU0: Cpu0 = Cpu0;
-///
-/// // ZST describing `CPU1`.
-/// struct Cpu1;
-/// impl RegisterBase<CpuCtlBase> for Cpu1 {
-///     const BASE: usize = 0x200;
-/// }
-/// // Singleton of `CPU1` used to identify it.
-/// const CPU1: Cpu1 = Cpu1;
-///
-/// // 64 per-cpu scratch registers, arranged as an contiguous array.
-/// register!(CPU_SCRATCH @ CpuCtlBase[0x00000080[64]], "Per-CPU scratch registers" {
-///     31:0    value as u32;
-/// });
-///
-/// let cpu0_scratch_0 = CPU_SCRATCH::read(bar, &Cpu0, 0).value();
-/// let cpu1_scratch_15 = CPU_SCRATCH::read(bar, &Cpu1, 15).value();
-///
-/// // This won't build.
-/// // let cpu0_scratch_128 = CPU_SCRATCH::read(bar, &Cpu0, 128).value();
-///
-/// // Runtime-obtained array index.
-/// let scratch_idx = get_scratch_idx();
-/// // Access on a runtime value returns an error if it is out-of-bounds.
-/// let cpu0_some_scratch = CPU_SCRATCH::try_read(bar, &Cpu0, scratch_idx)?.value();
-///
-/// // `SCRATCH[8]` is used to convey the firmware exit code.
-/// register!(CPU_FIRMWARE_STATUS => CpuCtlBase[CPU_SCRATCH[8]],
-///     "Per-CPU firmware exit status code" {
-///     7:0     status as u8;
-/// });
-///
-/// let cpu0_status = CPU_FIRMWARE_STATUS::read(bar, &Cpu0).status();
-///
-/// // Non-contiguous register arrays can be defined by adding a stride parameter.
-/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
-/// // registers of the two declarations below are interleaved.
-/// register!(CPU_SCRATCH_INTERLEAVED_0 @ CpuCtlBase[0x00000d00[16 ; 8]],
-///           "Scratch registers bank 0" {
-///     31:0    value as u32;
-/// });
-/// register!(CPU_SCRATCH_INTERLEAVED_1 @ CpuCtlBase[0x00000d04[16 ; 8]],
-///           "Scratch registers bank 1" {
-///     31:0    value as u32;
-/// });
-/// # Ok(())
-/// # }
-/// ```
-macro_rules! register {
-    // Creates a register at a fixed offset of the MMIO space.
-    ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_fixed $name @ $offset);
-    };
-
-    // Creates an alias register of fixed offset register `alias` with its own fields.
-    ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_fixed $name @ $alias::OFFSET);
-    };
-
-    // Creates a register at a relative offset from a base address provider.
-    ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_relative $name @ $base [ $offset ]);
-    };
-
-    // Creates an alias register of relative offset register `alias` with its own fields.
-    ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_relative $name @ $base [ $alias::OFFSET ]);
-    };
-
-    // Creates an array of registers at a fixed offset of the MMIO space.
-    (
-        $name:ident @ $offset:literal [ $size:expr ; $stride:expr ] $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
-        static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_array $name @ $offset [ $size ; $stride ]);
-    };
-
-    // Shortcut for contiguous array of registers (stride == size of element).
-    (
-        $name:ident @ $offset:literal [ $size:expr ] $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
-        register!($name @ $offset [ $size ; ::core::mem::size_of::<u32>() ] $(, $comment)? {
-            $($fields)*
-        } );
-    };
-
-    // Creates an array of registers at a relative offset from a base address provider.
-    (
-        $name:ident @ $base:ty [ $offset:literal [ $size:expr ; $stride:expr ] ]
-            $(, $comment:literal)? { $($fields:tt)* }
-    ) => {
-        static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
-    };
-
-    // Shortcut for contiguous array of relative registers (stride == size of element).
-    (
-        $name:ident @ $base:ty [ $offset:literal [ $size:expr ] ] $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
-        register!($name @ $base [ $offset [ $size ; ::core::mem::size_of::<u32>() ] ]
-            $(, $comment)? { $($fields)* } );
-    };
-
-    // Creates an alias of register `idx` of relative array of registers `alias` with its own
-    // fields.
-    (
-        $name:ident => $base:ty [ $alias:ident [ $idx:expr ] ] $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
-        static_assert!($idx < $alias::SIZE);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
-    };
-
-    // Creates an alias of register `idx` of array of registers `alias` with its own fields.
-    // This rule belongs to the (non-relative) register arrays set, but needs to be put last
-    // to avoid it being interpreted in place of the relative register array alias rule.
-    ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        static_assert!($idx < $alias::SIZE);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
-    };
-
-    // Generates the IO accessors for a fixed offset register.
-    (@io_fixed $name:ident @ $offset:expr) => {
-        #[allow(dead_code)]
-        impl $name {
-            pub(crate) const OFFSET: usize = $offset;
-
-            /// Read the register from its address in `io`.
-            #[inline(always)]
-            pub(crate) fn read<T, I>(io: &T) -> Self where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-            {
-                Self(io.read32($offset))
-            }
-
-            /// Write the value contained in `self` to the register address in `io`.
-            #[inline(always)]
-            pub(crate) fn write<T, I>(self, io: &T) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-            {
-                io.write32(self.0, $offset)
-            }
-
-            /// Read the register from its address in `io` and run `f` on its value to obtain a new
-            /// value to write back.
-            #[inline(always)]
-            pub(crate) fn update<T, I, F>(
-                io: &T,
-                f: F,
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::read(io));
-                reg.write(io);
-            }
-        }
-    };
-
-    // Generates the IO accessors for a relative offset register.
-    (@io_relative $name:ident @ $base:ty [ $offset:expr ]) => {
-        #[allow(dead_code)]
-        impl $name {
-            pub(crate) const OFFSET: usize = $offset;
-
-            /// Read the register from `io`, using the base address provided by `base` and adding
-            /// the register's offset to it.
-            #[inline(always)]
-            pub(crate) fn read<T, I, B>(
-                io: &T,
-                #[allow(unused_variables)]
-                base: &B,
-            ) -> Self where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                const OFFSET: usize = $name::OFFSET;
-
-                let value = io.read32(
-                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
-                );
-
-                Self(value)
-            }
-
-            /// Write the value contained in `self` to `io`, using the base address provided by
-            /// `base` and adding the register's offset to it.
-            #[inline(always)]
-            pub(crate) fn write<T, I, B>(
-                self,
-                io: &T,
-                #[allow(unused_variables)]
-                base: &B,
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                const OFFSET: usize = $name::OFFSET;
-
-                io.write32(
-                    self.0,
-                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
-                );
-            }
-
-            /// Read the register from `io`, using the base address provided by `base` and adding
-            /// the register's offset to it, then run `f` on its value to obtain a new value to
-            /// write back.
-            #[inline(always)]
-            pub(crate) fn update<T, I, B, F>(
-                io: &T,
-                base: &B,
-                f: F,
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::read(io, base));
-                reg.write(io, base);
-            }
-        }
-    };
-
-    // Generates the IO accessors for an array of registers.
-    (@io_array $name:ident @ $offset:literal [ $size:expr ; $stride:expr ]) => {
-        #[allow(dead_code)]
-        impl $name {
-            pub(crate) const OFFSET: usize = $offset;
-            pub(crate) const SIZE: usize = $size;
-            pub(crate) const STRIDE: usize = $stride;
-
-            /// Read the array register at index `idx` from its address in `io`.
-            #[inline(always)]
-            pub(crate) fn read<T, I>(
-                io: &T,
-                idx: usize,
-            ) -> Self where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-            {
-                build_assert!(idx < Self::SIZE);
-
-                let offset = Self::OFFSET + (idx * Self::STRIDE);
-                let value = io.read32(offset);
-
-                Self(value)
-            }
-
-            /// Write the value contained in `self` to the array register with index `idx` in `io`.
-            #[inline(always)]
-            pub(crate) fn write<T, I>(
-                self,
-                io: &T,
-                idx: usize
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-            {
-                build_assert!(idx < Self::SIZE);
-
-                let offset = Self::OFFSET + (idx * Self::STRIDE);
-
-                io.write32(self.0, offset);
-            }
-
-            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
-            /// new value to write back.
-            #[inline(always)]
-            pub(crate) fn update<T, I, F>(
-                io: &T,
-                idx: usize,
-                f: F,
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::read(io, idx));
-                reg.write(io, idx);
-            }
-
-            /// Read the array register at index `idx` from its address in `io`.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_read<T, I>(
-                io: &T,
-                idx: usize,
-            ) -> ::kernel::error::Result<Self> where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-            {
-                if idx < Self::SIZE {
-                    Ok(Self::read(io, idx))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-
-            /// Write the value contained in `self` to the array register with index `idx` in `io`.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_write<T, I>(
-                self,
-                io: &T,
-                idx: usize,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-            {
-                if idx < Self::SIZE {
-                    Ok(self.write(io, idx))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-
-            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
-            /// new value to write back.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_update<T, I, F>(
-                io: &T,
-                idx: usize,
-                f: F,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                if idx < Self::SIZE {
-                    Ok(Self::update(io, idx, f))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-        }
-    };
-
-    // Generates the IO accessors for an array of relative registers.
-    (
-        @io_relative_array $name:ident @ $base:ty
-            [ $offset:literal [ $size:expr ; $stride:expr ] ]
-    ) => {
-        #[allow(dead_code)]
-        impl $name {
-            pub(crate) const OFFSET: usize = $offset;
-            pub(crate) const SIZE: usize = $size;
-            pub(crate) const STRIDE: usize = $stride;
-
-            /// Read the array register at index `idx` from `io`, using the base address provided
-            /// by `base` and adding the register's offset to it.
-            #[inline(always)]
-            pub(crate) fn read<T, I, B>(
-                io: &T,
-                #[allow(unused_variables)]
-                base: &B,
-                idx: usize,
-            ) -> Self where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                build_assert!(idx < Self::SIZE);
-
-                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
-                    Self::OFFSET + (idx * Self::STRIDE);
-                let value = io.read32(offset);
-
-                Self(value)
-            }
-
-            /// Write the value contained in `self` to `io`, using the base address provided by
-            /// `base` and adding the offset of array register `idx` to it.
-            #[inline(always)]
-            pub(crate) fn write<T, I, B>(
-                self,
-                io: &T,
-                #[allow(unused_variables)]
-                base: &B,
-                idx: usize
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                build_assert!(idx < Self::SIZE);
-
-                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
-                    Self::OFFSET + (idx * Self::STRIDE);
-
-                io.write32(self.0, offset);
-            }
-
-            /// Read the array register at index `idx` from `io`, using the base address provided
-            /// by `base` and adding the register's offset to it, then run `f` on its value to
-            /// obtain a new value to write back.
-            #[inline(always)]
-            pub(crate) fn update<T, I, B, F>(
-                io: &T,
-                base: &B,
-                idx: usize,
-                f: F,
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::read(io, base, idx));
-                reg.write(io, base, idx);
-            }
-
-            /// Read the array register at index `idx` from `io`, using the base address provided
-            /// by `base` and adding the register's offset to it.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_read<T, I, B>(
-                io: &T,
-                base: &B,
-                idx: usize,
-            ) -> ::kernel::error::Result<Self> where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                if idx < Self::SIZE {
-                    Ok(Self::read(io, base, idx))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-
-            /// Write the value contained in `self` to `io`, using the base address provided by
-            /// `base` and adding the offset of array register `idx` to it.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_write<T, I, B>(
-                self,
-                io: &T,
-                base: &B,
-                idx: usize,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                if idx < Self::SIZE {
-                    Ok(self.write(io, base, idx))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-
-            /// Read the array register at index `idx` from `io`, using the base address provided
-            /// by `base` and adding the register's offset to it, then run `f` on its value to
-            /// obtain a new value to write back.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_update<T, I, B, F>(
-                io: &T,
-                base: &B,
-                idx: usize,
-                f: F,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                if idx < Self::SIZE {
-                    Ok(Self::update(io, base, idx, f))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-        }
-    };
-}

-- 
2.53.0

