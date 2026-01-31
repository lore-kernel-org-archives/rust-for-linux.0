Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D130325709;
	Sat, 31 Jan 2026 00:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820986; cv=fail; b=gTT0fx2afWOj7UkOlQplobDcKmpSh2wTL7IZ0nlaHket3m7XSQO3ZpMoc6GGCib7aNAd6PRE2kftvv7+NdCkrLMjR3w2uDqbOCD8w8fpqW30kK4StaZDPjA3X3Qn33OSXaYMP4Vt6T6l7cossIJQr63X1mn/xvE9IMnDyOf245Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820986; c=relaxed/simple;
	bh=dMEBiHWrx+tuJvjLIEc9uczrl7lT/gAcKaYX2HAaXoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NrBhf1GD+5KsleWSPUlgxO5xP0Ff93ZkxVM2XjzQLekLG7qAQviNHFmxcUAIc9lciUQtBVSSvcD65pSKqeYkM4+5ufsAnqaGGN0436UbBJwZEimbAeWMO7A+ptOjMxkLEfdBlu5eZH1qn29yZF9h0cjEX21tSUZMtpy49TS7cqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hj6ewm1Q; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hj6ewm1Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAzeV0Sypzk2wcZWkSf1KRpdaRxHigVSvajq5AcxY2/nJ/E9kGC/5qn3m5ZG6ELiJgLZLgaRtxw3RAVLhueR+KuwZ8fZzASO8pIz1wD5pPq0tUyC2Ilt+GZwD8GON5OgPoFh/kIEzD1iXq79V/+O6d2SzBxmjmiiwwl801gMlYR2hPZ0PXcJZvEmtwMKn8X5ANj5YLoTyJg/12o1fz1bcbbxu8U6t6hW7LmIXGao5FYFW7hx4wilesdi23/5B9gb99oeQ4Hnj0u4YSO5vQ3u2QurjTEKYJmrXVhlVMLKMbCP0CAc3A004oXN2MNIpabx2JXxQOqJy4/Gs2us9mbWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Vrl8HwKHOnJsjheZQjsR/KZHMdpoj4LAuzuKNmlMH4=;
 b=yY6W+Nv7FmCsFdfYK855RWikekZVo8RR51Etk0k6UwreSui/z5GkBm/DDcrmJQ9XkYCoOgfuJs1etmLoOKn2sZCq0/91NWf/GUzN5mG/7OlY14xRkGY/Mb2NtZydH3QUh81AQHm01tbkyNwYR1UmCvKAYPpW4ZZaBfBjRFkKXA5MH9+xAFzxTxTD45r/f5+tp/oS1RZKOqDrTn9lbZE29hYKB5jzYruvTnsntcPIaTUBg4sUNAiJG7vNttU7LqjY7w0uog/fBf7LaKTXS8Nzrg6dkJr4baz5TpYjwlgh/UAiGylF2p1pVLaIiFJYouL/tXjK8Du1+dIvoZvgXhGfmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Vrl8HwKHOnJsjheZQjsR/KZHMdpoj4LAuzuKNmlMH4=;
 b=hj6ewm1QwlhtyJyGHIowQAHAbRqdywWPGCRRJPLis8mM3NA3imai6UdV12Oy3iooDnEVC7P4rMNg/rnnqcTdeyH1qnTOliIJJiV1nyU4VDGaOZZD0UUYy0Lyuk9gaZubIDtualpEzu/c2tkH5RuvO+vaueF6or76eI76coW/HC2epnear/1Tn4M8NX7dZ+xzhoWEwGxyf/Y3HGk5A1qstJGj4IM4ss2PDwbJliQnFmPnEoyDCLs2mq1N+ld1rGIrJtgjBHjX/oXqpHsFFwN4jAFKdr6RCC5psUUrHZvLpM9iJzRIJ0XA/B4xRB91u+bKh8Bmub4olJvB791IFGwCQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:17 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 06/30] gpu: nova-core: apply the one "use" item per line policy to commands.rs
Date: Fri, 30 Jan 2026 16:55:40 -0800
Message-ID: <20260131005604.454172-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: d184c5ee-31e0-4387-7d2f-08de60638a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XS+NpFUvbIr1NqDmWW+cWzY7QS91l3bR20bQ+CRTnamUQh28kSSiQeZDZXZ5?=
 =?us-ascii?Q?/lb9Ah1x2+F2/MpID1iVpSE28yuDmY4Q6lOMj5bYmD3HnhYr4hXoorOODBWx?=
 =?us-ascii?Q?QgY+6+eZA3PyHQ9rGKP6Ddh5/xedLLfA1yp2Keo4loDcM1OT+mYxa9pnGAwQ?=
 =?us-ascii?Q?t5sG7aQR64sHRy3k63Rube8NJZbycQ5Sp4Ydw0sUpjZ33UMfG+WNT8+p21Dd?=
 =?us-ascii?Q?Ddx5BgvnXf3T6K9anhkF1PPsshuP1IjunwATkTzizIObBPSOleZCC656FRSG?=
 =?us-ascii?Q?ht3OE2CF8CkeB9BPQNTohNzcXnZzrR1JRg1nNiZmcTM0FHN2RNXJpnST3jOm?=
 =?us-ascii?Q?ar2nTb9s2FSdk+cvHNR/+dAstuRaTOKd5h4tyxQ/lMoYrUzaGlZGGdP+VdlA?=
 =?us-ascii?Q?0IZqZhfpFzS2JqPrpD8enug2u7BRcgJlI5ob1ltfzpsz+XS+Gmx4BLXfbJE1?=
 =?us-ascii?Q?KFQI/PzSPoFOWncPL0GtGRpFi9PYmbdNHMWc7hNrd98L/0dMnK2FzzWk6nMW?=
 =?us-ascii?Q?Z6BXjZ+1zaDRFDs3lgPreBTfEhVP0JbmxBNBLi5Ol4ts1DQO3lbfzLhSFR/H?=
 =?us-ascii?Q?FCgyJbsnv24scqH8zF1cisU2UZVVgs7kDaBBNZ5zYB6xHhPrKO9WGs3kz10R?=
 =?us-ascii?Q?4YMvRfvcGP0FHT0UoNnICqOy9QxjFft2bHt7tlfxSeR9I6K7fnyveDcMk+Gn?=
 =?us-ascii?Q?1vD3tQZCElKKHrn/Yv7p0xMuj/ue137+gTw+19Oux+BIVqP3A0CfUT0oyOc1?=
 =?us-ascii?Q?/gtsofHZa7jz4zK1GEHd/jF76+QZY2OFXUePeGclObH/wOySmu7IUT3wx3Zd?=
 =?us-ascii?Q?hMILPWyzLfvjZ06eQvmKfwzvz/paEn8FJv12Gf3/mrECQB3t4hQI6pWVL7wx?=
 =?us-ascii?Q?EZCXEIw/38fUD8rr+MurNaxmt6wK+wWpc1JP6aX4R40uh1WBEh403bSnjOKS?=
 =?us-ascii?Q?vBqcj+H34umRRarJcd7/P8ZvBljAv04Ogkq5PHh4YdIp9+9SSzSUL8HGidUv?=
 =?us-ascii?Q?30D3xaEUZLz6dBsCMexDctIe4OkrBH42cCYyBPts9vmFbUSmG+cBwCS8kGRc?=
 =?us-ascii?Q?5+nXhVG7kVH5OXmPIndOYE1W4ytbLTF2esWSv6rrSmetZoVu5o+FDtpvggKE?=
 =?us-ascii?Q?0qvFp/fdAf+Ot7w+XzVv5QAii/JItinc+0jNm2UqPlOPuOEzvhDhTZN01aD1?=
 =?us-ascii?Q?T5G3waBnHpSNSPH/fzq87qv4lVKDgvLfmAQ7M6wmo/Jp3aste6fCuFzZrRXR?=
 =?us-ascii?Q?yWppW4JZhvI+XAYD2N2kxSWTR0KTqmNmZGpEbyLe5+Y1H7LQ8Q/hS4CW4qsd?=
 =?us-ascii?Q?5XSQ2BkQI87eucJb+V0pvfIigvwVcU9U2VztPSh/H72DsdpeyL1a034DmR9d?=
 =?us-ascii?Q?BnRMldbxkZgnzmbvT5z0t0TmOW/iXRCZt1RMTZKdttwaTDLgepcCsQY6PoDE?=
 =?us-ascii?Q?o8V4E6ibE1ysS67WmioKMcqygrpavnRl2Xw8cvqYZvweg5cwlkdbjE5XQKAh?=
 =?us-ascii?Q?BChhMSzucnT9FCyT97uRXXCSB5NK1o8fooQI90AtdH7cCqvku7GMsNs+4Z13?=
 =?us-ascii?Q?FDIQCzROBJhm3oMRSXI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fd3fKvLnGC9971ktgGJYyD+stjc7DAoOjM7UP3gCPJClVfy35oFaVXZgoqng?=
 =?us-ascii?Q?4VpsEMYbqIt2v+64uiUpcLXRBlcR/X77+wgXLFlSqkVknWxk7KCpVGsRd7r/?=
 =?us-ascii?Q?S35iE9tfBDz89IlJLdJMxgxqTczp2pjjoDQR7TuhpT+KtBB0G3+B+aylsco6?=
 =?us-ascii?Q?aImy5mrxg48bdQb8D6fCBbrRH4ss0Yjst/duHHYa5E92df4anMAK2QaVZy9h?=
 =?us-ascii?Q?CrEmqp9ua4maRFnvLmZcpSZyUxEX8wvMuBrHdUJ59ykcShE0UoF0ar1lFALE?=
 =?us-ascii?Q?THoiC+wdiAo1UwJTZeR5VJ37phC1X8yq9Y3Be6F0yg+4UDuheVTzmP2bsDbE?=
 =?us-ascii?Q?FU1vKXhM+thLGEvMjucieoJWV8gxX9gFpflcY96SK8yf1P+S7tQg2LuGBkKv?=
 =?us-ascii?Q?geKeGlREzHaN5+s72gFYp8R7lRrHjdfU0u5J9mV1GHsENWQ1Sj2E7uGE3UCQ?=
 =?us-ascii?Q?O8f05vwQspdUx8xkrk5gVQkUWPAPhmv6UV7yqmVxi5YeNm7i5TIvw1hx51/e?=
 =?us-ascii?Q?T2lbf0XsjEaD+QLNr6DOOe5CS49yYqaa2Ab86tG1XoeMTuhYjDP/3wEfet+M?=
 =?us-ascii?Q?MILvxoLhZpK5wJiBT1npLTmeJGwmjpr+fw2qTDz+wPu2KpegAq7gELS+CzJj?=
 =?us-ascii?Q?PD3zXCJYj5Wii6hylk22+LxOgWkKxclIrJ9LusigOtG4KyTtL3o6xb7mof23?=
 =?us-ascii?Q?APp6IKBGlVEeOvu8WM4cYVTkKyiYjoymzSC4SIRHzS1EEswgA9oUT7C1+QLo?=
 =?us-ascii?Q?nAij+hpVcjTC6MaL3n5mZSz4dqp+M+URLtzdSpkED774XgAumyOycpua3o0I?=
 =?us-ascii?Q?md6SKicJslHV85DzNY+qt+u3jsXQUM3ZVpvqPyMBHr5c63not4Chl6CChKlh?=
 =?us-ascii?Q?ghGsH/QZLyNydspvU8n5dxw2xZgFKg6wqahP4Oq8ZOUJWaKyyjf1rUsqQd06?=
 =?us-ascii?Q?ymW/Jd8GjrFaKs+J2FB8BsPwNIEVIdOPBvoFrhrpVBv3GtuNBYXzqmtg4+WD?=
 =?us-ascii?Q?91voN82wIczPjFLxkeO/pbvgldmc0P6PJsqgnbmWqg1tRm30JhfVOnV3ydvT?=
 =?us-ascii?Q?WblPPZ3U0y7tMDjvg3Pr5k42QdRXcq4cFdUgpqIH5txMR2dYPtFid2Chi9ig?=
 =?us-ascii?Q?jl93FLgqwLgZm4VRh6cYCjqi9nv5IHnjNyjCXznHxLgkzZVQd/qNJtibO0Gt?=
 =?us-ascii?Q?BZw4WbC8eCfzc0tciWONLwYvMPocCCXx4dgZRTkaAEVU0bvah30ho/mZn5Be?=
 =?us-ascii?Q?RGhKaRqwFBkms25HgaNg+dlTPIDwVlmSc6FT8gdPNrf91mBN27ZK0gtLI42y?=
 =?us-ascii?Q?g2Q7vhQ5Nd3dQICVHaysQ+CgodfhnQsjJqkCr4My5S31trVYFE9VM7rg5+/3?=
 =?us-ascii?Q?Q8zm0gDitcUG7zbB2xMkQ3NXwSwNxkgP7+yP22qoTqPuWZUgLPYgciEOJBwS?=
 =?us-ascii?Q?lLbFl18oZ9cGW45AIt3sHvmnrkOv57vZ+oL5wVzC065MTEgG3+KTeSi1DNze?=
 =?us-ascii?Q?5T5IUDCx2fQ7MWtsmG0PN5uCN5tTqloRqGfBsB7mWXIS08RMq5UlUAsDupao?=
 =?us-ascii?Q?osEKonZ5PSMDEphcdzz9iuQjpuHiNvxwD6hfuLG88v50UIWS+A0iN1ApkUVS?=
 =?us-ascii?Q?q1KybMZi10DQBWhjYDJkiDkgV7kVTTTdwED6rT80UOjScnsCTBLspL0xmSO0?=
 =?us-ascii?Q?Jf1oi41MUw0hEX5j3XFbP7oHVA/RyFnW19owbqdUMh7ak9OZXhWWs1HYziyl?=
 =?us-ascii?Q?AsTrN9BulQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d184c5ee-31e0-4387-7d2f-08de60638a39
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:17.1845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1o6xhHhg4/pckCF4rd6PqCjh66AnEphZVHcQ/sUNbsOut/Tx+5RF+AHAzWjHe0iHehjtwQdv7iwNbM02JG2mpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

As per [1], we need one "use" item per line, in order to reduce merge
conflicts. Furthermore, we need a trailing ", //" in order to tell
rustfmt(1) to leave it alone.

This does that for commands.rs, which is the only file in nova-core that
has any remaining instances of the old style.

[1] https://docs.kernel.org/rust/coding-guidelines.html#imports

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 21be44199693..470d8edb62ff 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -1,8 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
-use kernel::transmute::{AsBytes, FromBytes};
-use kernel::{device, pci};
+use kernel::{
+    device,
+    pci,
+    prelude::*,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    }, //
+};
 
 use crate::gsp::GSP_PAGE_SIZE;
 
-- 
2.52.0

