Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EF42FD665;
	Tue, 10 Feb 2026 02:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691599; cv=fail; b=GB51pI91MaVALLnTmZwo4HUK1Uck6Z4+RS4FyaSFWjMW/BmBQGxal0zK1zHGDQ+hmmoVTuuP7wBy5UyzekosBRSTjFQIoBr2BO2j4a++LK/bQSqOdwjb+9IELmRiiJ5uDY7L0P2Wet79EyNbz70bj2kV+O3Iu70QQf80Aj6sPPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691599; c=relaxed/simple;
	bh=aapzhsbZC1IXA+5MOa42AKcuMFwmqW/Fsr6wuDnyonA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WeQdt3JzJEXOAbPu9IaapIb62jujxJeOiAtPF27b+LBuawv5QDtljZ++ue/b5Stp7LEJUpysUd9E2OVN6UU3AjA0zH2GlVh/Uujm2a5tOD6SvfDp8Ug+TYi7zzFzDBzk2u8Xu5lZxiHPkxcC4dgupPv6oukbmQDH2ejjhm8JD4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VogEfxD3; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VogEfxD3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQl6Zq70QBNt8FSv3Lle7W6caF6mTICZkSCqJd/axFp/U9Ysragimgm+zQuijMqEzgtvrwVkEY5dzoOTaenY4gPn1/PWZDaEWC231fiFRLwemFa9dzAs1RL/Tzur9MDh5GY9Og+tQRiSjMJ2SpPwO0TdQjcHbwl7z0fP+B/EAwp98kBynv9fq5eMLUcjM1ayA6/vjzUR80NVpKUx8MAjf4YV33DgY9WtcOrjrxy904KPrN5CEqCgJnphQthjz+Ts3orYV8LUfDeArhdfG5r+1MJ90WUEPgEKvZqH1wwGZSwgfZy2HSvCe2bOjU7d8331Xs9HXIumtjX6GUAYGXX4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcDBKQ0DeM6Z8BsfCW4cH5KdWADfJDFN/n7GVOaRSAM=;
 b=HYwVSsqZMGNThsxE6hXcY/N7gBPcx0FNRyVRLJGjlDsLPmyhITV1OgV2tQ7miv7jofNsd41EiFHbrw6cFO0iLBKVZRoimiVGoXwv49gQrw7mqRwK5/oaxCJ6p/BsFMCAdFflukfhg/E4aPS266/RkQ6I6djKoHAqxD+3W/sdzASE3e7D9+N+sMsRM64pIQUuNn72OfwzxuiPUEL8S5hvkQXPz+UcQaI+8I+nVzbyemNmWkpnm59YrNTZvcv2Y6Nxp3uVEwxDyxW61lQ75B77oBMsQW+wUeNw6P8BHH5Qd9YieVxdJhvXs4CxtvAW9bGP8Sn9WTNsZkl1H7xruhMAUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcDBKQ0DeM6Z8BsfCW4cH5KdWADfJDFN/n7GVOaRSAM=;
 b=VogEfxD3wk6wOIXzXiXv+Yu/OuS9ihJfvU6XS7CyLGNF6Y1CJXy5JJ5C+7UkvlEaH7bnN6jtgXqZkGCQhjHf6HXr/Rsvwri9u7V8FAvxqz+g5DFqdd6DNea0YH8u9L+SobTBsRwhWDKEfEgqQEqJCr/gT31Vog4zhLdwqTIKhjCX5z/l9y0ZbrhJQbZpdycvGbgTK1bDe4OzV+HvtxkSCdxxO9OkDv+HB33T81c+Ai+eqGYE6bTR3BMD0QBUGq566XJPzk/aIdUmdwzbqND0I6Ulhp5RIS2Ypa9IKOwlZ2OwJ1ctfH1Z4+XygE3v4B4aTqyTRFw0bnLYfPO2vE0fSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB8797.namprd12.prod.outlook.com (2603:10b6:510:28d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:46:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:16 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
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
Subject: [PATCH v4 07/33] gpu: nova-core: apply the one "use" item per line policy to commands.rs
Date: Mon,  9 Feb 2026 18:45:34 -0800
Message-ID: <20260210024601.593248-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:332::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 33be5086-8d65-42f1-ca16-08de684e8d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3fK/54x50k338BSqs6Q2W8RYomLWOwUVdLmcr4tRxJmgqyEfl0OMILVs8Yol?=
 =?us-ascii?Q?MWxi58Wt4IDQrYSdcZtEzXeJ9RQ685C/WKNn7YJ0nKNtSeYr/K8HCTR5eP0h?=
 =?us-ascii?Q?TjalJuay3gXTjWV/VRhtRSmGZ7vWWzovfj53V2tFIrveL3vb/pt3m/RQuh6V?=
 =?us-ascii?Q?LSPFHoH/GjXvs+1h5TqsaZ5NtA2mDAqXVotVepgyPfRmXn17CVRGoJzErzjM?=
 =?us-ascii?Q?6itvh3Se0Tfe/z6wm68UVCgW3TqirnQs8Aiaoop7BjSP0G39HMRW8PWQ+nN5?=
 =?us-ascii?Q?dDsDctV32/JpPWaRYG9AeLlsDso2z3yqon3wnHTMibOIFMQyol00qNuZuP3q?=
 =?us-ascii?Q?KsQnm9ZaUR3h5Sy+EL/W0fnH8rs+0TSSB/3zQjAC2tnUbbBi1U5oeo5f6Q4R?=
 =?us-ascii?Q?ONK5Hv6dxSHwc8mDttxAWdBI0esNmqk3aKWAoMbAh/x98eKBv5sJsilw/LAJ?=
 =?us-ascii?Q?/pyAdYk/8QFnEslCwTthlCr8HCOZ2LjZzq3LvLmlVTgC5/EjnF6esyjsAnMe?=
 =?us-ascii?Q?kFQgIuRnCL29tigIZil3v1wxJcOk7UxyG/pxzHKCk+7lwJaMUgZAlHQGYGaQ?=
 =?us-ascii?Q?7aBRyUxgMpH28eO5X59CehXBjUmxplzBlgA1xKIQI0z0sly6KbPoyRh/w2VL?=
 =?us-ascii?Q?Bh/oXFtKl83ukXzuW2H1zqP0XZ3p9h+XeFYhRD1LUQuLa3fxS5efz4jBhYEk?=
 =?us-ascii?Q?gG1W25aOrdM9YJj5URSk/FGSTzERUR8YcMLVWABbyegt3y5TlRfpJ7VLQ5Xe?=
 =?us-ascii?Q?BFQr5sJwq1kkfNn2sbWXcMeywaLKTAT51m/E904Sq3+eYwFxBV9BhE/n/Jw7?=
 =?us-ascii?Q?oOHHC1Qmmz5dkAVa3dHCHrEjwRCtnsyNcBES/Uirr19ww+NnsgOp7bWA1dCW?=
 =?us-ascii?Q?cGcNmlBCFKKYQKYFczVu9ESI0d3Zgwqi3/JCxNYs7BAYTayuOZz1MHxAeUlo?=
 =?us-ascii?Q?xkzMb4CZog8gJPfvYZt+w5/yoZhYrJtr5ILmhSMntTaDfP/4NaIhCnFfBHED?=
 =?us-ascii?Q?Y1jxlaLMraSz0bkv60x4CQzVIiZCcDtTgeZtbytt6XSIqsGP14j7BJd89iZP?=
 =?us-ascii?Q?RufWbZxcJN66P6MG5/MTG3d8663ulvi57CnJJpbMKH6wxO+Nv3sNAtLjM/ts?=
 =?us-ascii?Q?3v1xaz27PitUFemIVoEnDbJh8T3QNuvaQ3Mn7hDED842is2X5HVAPOAuXtJv?=
 =?us-ascii?Q?XxyVhDnhSL/inKY61xjJqhsSEZUcyeLtBaF+KO4Yqm549xzuyV274DOsM/G6?=
 =?us-ascii?Q?M0PPtD3+Jj1G4W9356rWQF19CwHaI/zQAnGI0pmAR+KOYP/iPZMVUGf84+A+?=
 =?us-ascii?Q?TDA8e36gTVNHym7iP9BHgQHo0ndZUfRpQMrYs72ZyJI6U0TCNxI4qLNGOajX?=
 =?us-ascii?Q?11hDVxo2+JXSZ1UojAITC9Lt3a0t5UGe96lm0fKAIPUGH37oH2pO6p0N2AN9?=
 =?us-ascii?Q?4baOb1xXimFeTHVD039H+wnb9Wmzf/De4ZpopoO9csSmF4UxRwHz35OlFlgJ?=
 =?us-ascii?Q?3DRxmJMD/5+k+U3ugLdpidvCCoFbY2p1QYl/jSad4iaBZBFRZ3PFO+NN0XzG?=
 =?us-ascii?Q?gELpPsLE8O0DSSTO4Rw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BWRrnbjp2cKh0WIppCoLwKgwCVIo+bmsHhCNBohnRE0tS6JxW/qYVN/moF5e?=
 =?us-ascii?Q?cxTJUoEcuDeBYhIa+6mcEGKCIhoAsz8Mh9H11v7lcAjZvp32vRbN3LPQDhT3?=
 =?us-ascii?Q?Pur0PYupl4kaeXE8zmRfOWpg8025qJpRQHhFIgxUcbddjb7ldA+VW3/a2c7R?=
 =?us-ascii?Q?ncHjeTeNzTk6dNUDOwuANYLAWE6L/7obEjt5WAdZizWX1L1B9jNTV0py15ZN?=
 =?us-ascii?Q?CIrwDndwAPZYIMEvavrXgwkTi91HAoVgu06L6JwZnCWuVfrIZ5OPJDNgM16T?=
 =?us-ascii?Q?HHl66M8hz6LQMLYJVIk9+QhvA5Lxw7WXBN9yBVsOVnG/KJEelyxsDvPe+RrD?=
 =?us-ascii?Q?lvvSKZ+ts0i6dVBr6AL6lZULurVxsyB5gQgMQjQAYLsLR5dkiJQMcl1i7PD+?=
 =?us-ascii?Q?QNXiU7zPKDq7U9yH9x1xeZaoz0WAobu3RqdtvU6weZveiWqi5DcSU1UgbKnR?=
 =?us-ascii?Q?qmNd77j+INVn2adXjiuF2wyx9bLPccSnGvanoBloarLPEwDa9V/W6JG/eHLi?=
 =?us-ascii?Q?C4UZpfM/7MBQkWXbtVy1zC0PLeo8XwKsXHDQ1k/THg/DubFNHlm0NGMqbZRu?=
 =?us-ascii?Q?USlejScF3vL0qxL7/emiwYx4rPpRE+UY4lHLYm3xM43rJKruxQdiLadXPXRT?=
 =?us-ascii?Q?6ekA0wK9rRk0PL3KAcsz0sYx2TYK9HCFcUm5fGCJAIB+ZuotS//BwmPIP9DT?=
 =?us-ascii?Q?j3RADqXgUy0euIlOKTTmbpwLe45aCNNN8y+shGhU1seQELcHvGMw1GJWXePl?=
 =?us-ascii?Q?cLJqHU5ITk2jFYlXDj7pHzaD+rpmX3EV6R8nhF4DCkPHLsbwSWP95DJmbrvQ?=
 =?us-ascii?Q?IiMV6i+CrQIMifI0HidUlNy2KM4rcTQj3oxEVcBelymaokIM88HUoWFOGCVf?=
 =?us-ascii?Q?ikRGA7LT6p6e1zpW10BVyoOkSl7RGb9SXaHyGlOaDqfZsMRoDS4mhG3noQoB?=
 =?us-ascii?Q?ZbcnGvHA/cNlRGtXO2swq/ZJLXujk10in/ZFN2GZiZa0sUh8C8juG+XCuc1D?=
 =?us-ascii?Q?Z8H26A6ehdh03pFpgSKf9JGd8eFYUZOC2DQcITT0fq2EcoEQWMBcI+7SFj31?=
 =?us-ascii?Q?mpYz2c+za3LdP08Hq+l4q0iY5/cY9pKGNPhn2rGwUkDyCftoF5pD1+wFKVx8?=
 =?us-ascii?Q?cUwqJ3dsVUlZvQ4RyzHPrwQ51AtrkmRV53wHI6gFwho+T5zrmW5cnqT+Q1jT?=
 =?us-ascii?Q?T40QIcO99Fy9echmaznJmTKsKMK9seVBz2TFbvixCWcIHmESY2QvtA8hzlHp?=
 =?us-ascii?Q?VnXIhD7OO4GGWu8bTXmWpco9FzYU2vfsprFVGcpASAX7+DHnHO88SL+3Xo+w?=
 =?us-ascii?Q?kb1iw30NtBhGhyEhK8owak14C+54ATNXmAj1WuzWUbUG6fNnKedUHb6Fwfrc?=
 =?us-ascii?Q?4EAnrZR5pm1pCnM4+BO2HMr3wZq6O7FbDZYy8rWPfvzTmN5M+1GbVuzjhSqw?=
 =?us-ascii?Q?zIy5edJiiW5iCNzGlssFbhAcf7rklTGzj1Pa9LKmjvT7U9pgcwiNWETywhlm?=
 =?us-ascii?Q?RvzkGVYwIUOxNeJbVdrTo2DDoNeADY+edccvSCVaBEdbWzXUQKdp8J/Dn/c6?=
 =?us-ascii?Q?PJOieFRtghNeEPpi8sk25/iBAKKH+OVG58NYNBMpJXKE2TlMGKXE0vuEe+R3?=
 =?us-ascii?Q?43Ka8TeycSrj8lZgQNe3fhKoE84nhiDc4xRUqso82nFXNdV+upZYE42FhXZM?=
 =?us-ascii?Q?pZL347ZSr+g7TKAmQ82NwqNzDyNwWhx3M3gkWwPpW/LGVuQ6bbyiL6q7wn6y?=
 =?us-ascii?Q?YDC8fcNqow=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33be5086-8d65-42f1-ca16-08de684e8d0f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:11.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPlClgmgGi5mRDDgObVI8H07W/Yco/pV3kVT0dhGMg7OZkmjASAs6B9/MNuHSVJfSwvAqJJwwB7tcLOS7o67XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8797

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
2.53.0

