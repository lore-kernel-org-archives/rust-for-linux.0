Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965EA33DEED;
	Fri,  6 Feb 2026 04:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351711; cv=fail; b=n/qzooFfVxMdQ+Q4XL0/++lcmikr4EEqJm2qZhgicfPOuDA39zJ8KlSJVXu8QVaZFzF1S74ioNIuyXKNWQJ+Rn2N4Y+cUu3hqiXmCz/XA/THILkZw+LLMFPtnOfli4UGECWa4QXMQgcLGrVGJqRZAr5zG4nwqIpwnQGY/YHWdTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351711; c=relaxed/simple;
	bh=pMNWIOGkMNcRZJujfJdu1t+wLoh4kHDAx1LehMw7hEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JsohsLApoQlN7XmxUr1fzs5fEituskXbDx74F+fOlvJNp08sMpX5X5DQoE62c7AMGZQUExdmnlDLwIyMe8MjCu29Q318tKNWqZAwptyop2w/c2kSzMLXYeaqSQQWBqFKxTITOmNQJIq3QeKomzpCeHMWEyP0d6owFiWmkD+JugI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JCPdfDAT; arc=fail smtp.client-ip=52.101.53.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JCPdfDAT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECoQaecS/efS/sgqSsaJcNhbnOyfInikOQCKyKKyUN17i8D3tDwHzIbDyNsV4pEmv+YOLhTHVIVEuBl/5ETmAb0OeEftVRz3KTbUiUSEk2GM+EOGPleA02upbdvt27XfARt7IAfasp4ZNm2SueKQ0l5L8ZoNH0wyACM2Xdm3WLzmOyMFUiELIyrJH0hWrRx+Mo+M+CFC/OVKWjgIzp4r1/OMjzRUWIFDn79C7nWtrRMKZ0gMt4Cc3Cg70vcPsEouyQHtz++IFEQcrsbxHyX2jGDpkbkpxfNoexJ6nG6i3um41/qQ81xfameaknkSLZlQ8amj3DKT04W04S5jnUlHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Nnh06xZpBy9j8MMYzvGcFhEP6psIh1DI92+gSg1kfY=;
 b=gcuOb8dysvMOXibkOvYlUhaXJZkCXdrdQllJkel5TEmAwE9acg75MUSJ28NJ5NrnwQSzpI0gBlNn34E6/aPrZ9Y9N1m559kMTXSACpU+eKiR1NNI6ccHksskIYCUBbFCk3mEqkQ11oHUGh7WGtuKMuyj439DP9pIz8HdvNrS9M6gZlI8CJwd3p7yeB22zRyLXhNE92EIZRTxGwbBHe7D9AwyOgfp+dsCVLe9kjjOGaaodNx2nLC7jzZAPUbW6BvvyWo/A7ZpoOi+tBG2yLbD7vKauF+VQGtUaCYtapd6XWJyhOeNM2oiEvJxz6NE3/YvjTISacCLFUa/+5htC4e5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Nnh06xZpBy9j8MMYzvGcFhEP6psIh1DI92+gSg1kfY=;
 b=JCPdfDATKxHfJPbjwGNQFKOIr8zYccpkOMikJisMZQtew6hkR7fIwlLj5ijUXCmZlBKZtAa7pdaob8cMm8M8zRS+H2cT1azpELxOVcGwM5j6L7L58/RTqZtfWLCHN0aSNgRHVN2bd8aEEbd+SL0tY1mw7yw5hGwwsoZtelQe78S6BIRywcB6T/1HWCa4QIGQ0YI4e1FWI/Ba7I91Ia18UGCi7EV1j6kXkS404raWaMkfsBTeH1wPiMfgwrOG2edF+t2p4eJEquzICc/1Xg3rfs0/gGUXLoqiYCSye3KMeov9v4Z0s1GqDil/zn5Rf0QOjvUodexz26FUPUmim6bJgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:46 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:45 +0000
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
Subject: [PATCH v3 15/30] gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
Date: Thu,  5 Feb 2026 20:21:08 -0800
Message-ID: <20260206042123.303281-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: b8bb0a50-40b1-4a4b-c89b-08de65373d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QP2anLNihxJPDTle0SKVi+ZzM+lNLMSHGHxdHCJgWDRc0gtZg+7Js8hJyeIg?=
 =?us-ascii?Q?18FgjgyDo7cFxopddC+0uCehwzY9CGvpwR3R1hvw03nbjGfg450AD5i7+p2/?=
 =?us-ascii?Q?3z293uc99v7BMzllJd2EtEPFrMjpqtYSFYFfFnLbWKxdbdkDVlFqIb0mRrfH?=
 =?us-ascii?Q?mgTWJ3/2hZpZ8ofmHZzLn5vCUxKuSWPcTnWbxHaOWufDO83/nofGV6wZ2E4p?=
 =?us-ascii?Q?vUKMsHseXeCrO57zilW7e2JnxHhvlWoPtY3yPzbatXGSfVqi8Wb8VJbgMs9P?=
 =?us-ascii?Q?Tug/BnqfLq9uVr4M6LoQhwjGzuPcwg+V+oQxRQHvWuVsfnZHbXjICyEBd6Bv?=
 =?us-ascii?Q?DMIBPVRC3OVWewhWos0ppt6tFJDEgmyEDiQT+yeDnRhKfiePzunXY/epl3AQ?=
 =?us-ascii?Q?Y++DEKO+OywRqoQ9zvCGgNq+velOd/cy05e9lH53tAoMpMLLMnqgpK5p5Pw9?=
 =?us-ascii?Q?SN8QhPkQk9FnWTiPGFRpzZgjP62ytMMSmyR07T6qVB229FI2u2RiKhME9HCW?=
 =?us-ascii?Q?vQD8ztA2BJiK6FxvJ9B2qPUHHnaJymzlrnO0UYpjd6nz4YU0mFg5r75dxhe4?=
 =?us-ascii?Q?POMUXlF6kuKMPKmfx1tSfE1t6D7oWZ2dvQ0HK5EVnoDNsvv10S5jpFmwgV0o?=
 =?us-ascii?Q?KQ5WAg2zGSVfQfEHLqnsWfv17zbu21ClPbl+4gLVcbcUdTx2XSFACCkCGzSM?=
 =?us-ascii?Q?Aqkyvyz/yPkcghsOZXqoGSQ1J8SuHnpLjD9rl7kzw0M0wG6tUWdLbu5W5efz?=
 =?us-ascii?Q?Ep/5v+6gsCzkOScfjMHnQoAze6OgbO/D3CcBbH1OYjY+fZ2hhP8dsODsd7AO?=
 =?us-ascii?Q?YJZX2WJOltn7iGEtL1DbwSvwG+fTNQ/umYmdh1mBL9HYvLllfefWqqI/y2Vz?=
 =?us-ascii?Q?PKIrPqoN5zpAtsfFsHaMsIflj311lCNiKcP0JOL6FDfAajWuMmXFt0VLIi9D?=
 =?us-ascii?Q?qsdsyZ4xfwn7DIlCnDQZjIp94nxM9T6vDuTC5w+DYk274nuBfcrD8timrhsD?=
 =?us-ascii?Q?vogJxvR4P8ZkC+JdAByVU8fsvXpa7IcVe+z5swRlzhTxgI7rsYfpyYGSuOuA?=
 =?us-ascii?Q?kA7suQRSy2Zp/G5NC1pXDkRv8M3EKkGUrisGeYKTDU/ANiYw/pjFeKnXCp+y?=
 =?us-ascii?Q?AR7/Dxosfnf+4cFbSYBk7VSXA6SNyyuWATaaQVGu+CYFx2yS5dkJUp25U+3X?=
 =?us-ascii?Q?pX6u9MZyMtfRTmpbKqvkidlGqJuH93wzGl9PPSsmXnarM7gq+KmjdfEngPgw?=
 =?us-ascii?Q?0qzj6JwzlUxm142BIujEsSkkj2UmhJ/imehdOXPFFRp1WA8GOo0p+LgpkkVQ?=
 =?us-ascii?Q?y2lH3Hjg+9h4iTngNVdXXTafEnufouwau7TfBJX4cS+9lBiUnRCmZbCQgxO1?=
 =?us-ascii?Q?HB0ifXHjAkjpy4FuJ2HtelVkkqM8dfU2qctJcILbIYVYSlelaBLqfp2t90ZO?=
 =?us-ascii?Q?gjPc0YZHfOShPYKPlwqWUz2VCrKBzxJvgXJoY9Zs0vMrrwaboOJxFI1Jg6Tt?=
 =?us-ascii?Q?MrUvElU2+NzBKph1gOVuuqG/mRuaThxw1BaH3LUlchvF1rLXb2cb6MndYVpK?=
 =?us-ascii?Q?+kxqI0s9+126DwH5ADY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8EXqGbKzD+tMNdalLXNeUhJdRE9ZH4F33qCGlN/dYFscXYvzN20EyigYv53X?=
 =?us-ascii?Q?vX1wq6/QtnqYsz8IaW0yRH0BKvC79RwECzy2sW9Ss9rhV57kjSHc2lwuIBq5?=
 =?us-ascii?Q?dEWH+bYUPnSwkalosu/+FysqHB8u6f/Xnn3icRt6nOrcsT+x7B1Ob+sSE3ow?=
 =?us-ascii?Q?oYvaimdBQmG+F7AYdu1Km0GNeNr0epF4GUiVaA1RVbQ7uSHF79lxltBQ2yrx?=
 =?us-ascii?Q?j/93jxFM3OCXStTQDNksP9RRPKuYZ/2ASzexv1nzvztTFET7xZaOCLcSntQU?=
 =?us-ascii?Q?ZG8rkpRg+FC8e0gbDsq5SBwaAMMCb9uW95vVpwaLr9NWsweFNr8lluiCRYnS?=
 =?us-ascii?Q?bKsMd+HJDGiuG740gWEkrgUSqtX31wSvI6/Wg+y2pPBGgFl6OL/0gi0mVK9C?=
 =?us-ascii?Q?jNlwkRl945ZWeBuOtuiHjEUezYfwaH4IZk+Sn/nZleaGcFa3BKrRJFqs6Wfi?=
 =?us-ascii?Q?2F4601LxJ8x62EB74EVkxqbR07QZdmFksRM+ipoMkUeEPIf6NcRfY9h+mn54?=
 =?us-ascii?Q?dQ86+iCMLcDxJUyfzJ0mtb7BVRtycGsXzV85J6Z5IeNTsAWmHIHtDD31ztWD?=
 =?us-ascii?Q?FdcX9GnQq3WDQGMvLidT6Z756KW2QHiowI0UpylbuyZg6k+FNZzdqJ6UhzOl?=
 =?us-ascii?Q?nohUY0ZNGAsRF3FbqZ3hqMxfBbFXZeQR31KlZ3c65C8uum8Fo0sxXvL25sys?=
 =?us-ascii?Q?SIcomns9QgLhUvdUAmmX0XLfkyK/Ze9ykF2u2eTZ5st/a1f3mJald6acjBdM?=
 =?us-ascii?Q?UBOXwL9YNDVNg993TN7Tm0vWHtBfUjfgF7eqynv6naTxOLTeDbHMrIWN6tw/?=
 =?us-ascii?Q?UWrShrG+47Uk8DB/mAPNst9KE+YFtSzTQR81IZsWDE7uhB0dSy7FkxmaS7a/?=
 =?us-ascii?Q?ogX/pRMrv/687LcRn1F1t5dW5fmsNO2pDYFaTtWGFwQowpgWFIom4E6Cq1eX?=
 =?us-ascii?Q?7flWxyEFdHuSJJp0VOqxiCYlxN0LZIVupbJ1jZGNnA9pHWudASxhXjnLG4mL?=
 =?us-ascii?Q?1K5ec084JtDvG1vx7tzJg7TBi+r438mySnbLGrBWJJVUD47ZBFH7S1zgXNj7?=
 =?us-ascii?Q?F9hpXt8Lyd1QbeMFKTdr6M49kQh1No8iS4a0+6CWvMHkCsX9HjM5qRanI6yn?=
 =?us-ascii?Q?TSdOqR2amGrvibAsDBkH/Tk1VnueCSm1X4blEIJ+XQiq+XtECha38r0//WWL?=
 =?us-ascii?Q?Vrv3aHBbm0+b0ejVAnNojVQYqYJnVvA4r0Kw1yEjCBSESpefkyhAA3TX7yYu?=
 =?us-ascii?Q?/IeR8/0AXFllLB4zynNGLOiPL2MpSoXhqwMuFbVpU/yC8SKX+PxpglSN53eU?=
 =?us-ascii?Q?U2kV4leyB5XS9Pt0bbhkeidNasyN2ZuVkTpdfJrdD8eidAOa1BFr5zXFpxri?=
 =?us-ascii?Q?J1WtXqvJDCwJIYhCMaobjruxUSUoll5lp2p+TdhAmcIHIgiN8ArRzEvV1lcO?=
 =?us-ascii?Q?weFXicNrYGuh1k7AXaYsR2pPXloW0gVTQs2yIYFkJipbAPxx/MwRBaOEH7x4?=
 =?us-ascii?Q?XT7R9Ue7rwYRI3hGX/d2K1oORddh5S1C881kNEl4zOzjOTPorv/1Cn4HjOQk?=
 =?us-ascii?Q?34b52NFcUhfJsq28TOSk91XcipWXCYACoAWVPdvHv3oI/3WwEwjOL6EewoFK?=
 =?us-ascii?Q?bMi1f/VKxj2BRffqpHtNdpnNUAZtNc4LCj2d77R5zXKAYzJxgb5MQzcu1hgy?=
 =?us-ascii?Q?IkP2wZsjOOqPr9aArgwj3eEKrOcDOnVh6mDQ+BBkUxIA4ySqP0eZbI/h7mqj?=
 =?us-ascii?Q?cxQ+NwuM8Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bb0a50-40b1-4a4b-c89b-08de65373d2e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:45.8756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwhfA5avmQ9H7bzqjBh+FEmBmOcuoSCMVMtrMA2slDijC+r9oPQA/w47cygRkkiE92fup0bFQyhSFUE5PSWLxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

Add the FSP (Firmware System Processor) falcon engine type that will
handle secure boot and Chain of Trust operations on Hopper and Blackwell
architectures.

The FSP falcon replaces SEC2's role in the boot sequence for these newer
architectures. This initial stub just defines the falcon type and its
base address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     |  1 +
 drivers/gpu/nova-core/falcon/fsp.rs | 31 +++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37bfee1d0949..a0cfb4442df1 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -33,6 +33,7 @@
     regs::macros::RegisterBase, //
 };
 
+pub(crate) mod fsp;
 pub(crate) mod gsp;
 mod hal;
 pub(crate) mod sec2;
diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
new file mode 100644
index 000000000000..cc3fc3cf2f6a
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP (Firmware System Processor) falcon engine for Hopper/Blackwell GPUs.
+//!
+//! The FSP falcon handles secure boot and Chain of Trust operations
+//! on Hopper and Blackwell architectures, replacing SEC2's role.
+
+use crate::{
+    falcon::{
+        FalconEngine,
+        PFalcon2Base,
+        PFalconBase, //
+    },
+    regs::macros::RegisterBase,
+};
+
+/// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
+pub(crate) struct Fsp(());
+
+impl RegisterBase<PFalconBase> for Fsp {
+    // FSP falcon base address for Blackwell
+    const BASE: usize = 0x8f2000;
+}
+
+impl RegisterBase<PFalcon2Base> for Fsp {
+    const BASE: usize = 0x8f3000;
+}
+
+impl FalconEngine for Fsp {
+    const ID: Self = Fsp(());
+}
-- 
2.53.0

