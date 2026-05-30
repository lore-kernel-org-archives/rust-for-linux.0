Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6BE345751;
	Sat, 30 May 2026 03:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110631; cv=fail; b=Lp0rEDmWT7v/VUZeHc8UuS64csPxQhUozEgv5X3S/rM1IDPQIl+Emzi5SkINmgTCV6PhtbcrqURh95wSVYcXuuUJ4nhkXmDfCxBtB/FcJD/MAK1bJNU09hD9nDQBnM41Cy/njWqtdpjOLW8IRaqZkfWygmlnu0AzaiLgeuHWZx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110631; c=relaxed/simple;
	bh=CdayAdjeOqL6QVaa5LpxPI+GeL7UUW3pU6Zxv1iZYXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kTyFoHDDra/cWUSsqwSqdRTjnvU0Qxd6xOxDkNRNNJ23Bt7sxc8iEc9Wy8ydBEULx1b6UpXW746AVfACIMo/pWe5lkTxR/RctEBhY61H1Qck7zz5qqVxcApl9dSA/EaQ08ZtmFn+Vsx6bg1c82T4PWm6CRsqkbbkXBwV2oew9qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KdR3AUXz; arc=fail smtp.client-ip=52.101.85.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KdR3AUXz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVDjKlFTgRv+QIzrpVDYBdRjCoC9SdE8h6BK6h9GwXynx733cXWwElvp1VNRwTsjfVlealVoMyJZj0+LwDTGjfIHzzO/VLK/3NTd6AvAumGFlggpZx17IxLWFu4vlJpeaJFEBuZtuH1CHkY833A5TYX1QydD+rHFUfVBbwDCmWjplCky09zJYuPQ3aAxW9LolOEBd3VGYgXk5N/6BqrKCfaCgBLrMYi5O3o85+z/IUqF9mugJv+2eqnlWjHY5A5l3VHInvZoZ180qccpfmyvt51DuH8UzmR5n1AU7ISxDwV1ndgh28FQP3QfoA9iSqY0HWqJsAltTENxIcubM+JhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7S6k/noCgrLfF0Cg5++7FtnVPbMFVn9ttcq8d0vhEoc=;
 b=Pd3hEpOPsUn5EtNfW70uG5S18GY0mlS/mf/dMdhBIIRqbFdgCUY2IoGmnioxjhWt0AGP/p9nU+c3+DZ6LSSrWPS0in1C+Wfx7NqvL/OQAYPydAZSTvtZNwjc/68iqOHFb8ZgewvC0gc8I8RQiLh19zHcG+vXD1RBcvcjC3MrwoUZXNzyTCwcPEyNEB68FwMM2NNeldmU35SNHj3LEsPZPJU76dVtBI8YIJgA4K+3Q07uWs3MXssbFA0F90P+kjO6fIeo220iWFmlmzaSRQ+vMXG8356POhWfVoiR+o2woKTcATgL3CDv02YjsNYVlpXB/KGLao7VLn0IvE7Lzwn0rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7S6k/noCgrLfF0Cg5++7FtnVPbMFVn9ttcq8d0vhEoc=;
 b=KdR3AUXzgKcDKZ20o5+lin2Jus/O8pkuLv2G0yFJh0DriR696uCcWX71jyPHez9vJQEOqPP79dMyXL6g1lPzNcQRR3sLmv0LkgpRKT2/+4O3WAIgF97TrxVoMqLhcd6ms2M5fKQYtvv6YWdR3PDN9ByShNFDteY1Ixr9wkQrWniCV07RcWYuupV/+bAgdhSqcUj4TADJJCcXcyZguDtfqayy50M+wud1EsiCllokTVIfsAJ5dM7JBLkNrOZkBJPpvY9cbEv/VQnDYwZ0XN4ImZ1Sfs3tSbvyR62UEiWSKVPe6vHf0eLXL726nYO+1aZ6y7FCX9Wv6D+/dXXJddsu+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Sat, 30 May 2026 03:10:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:02 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v11 05/22] gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
Date: Fri, 29 May 2026 20:09:36 -0700
Message-ID: <20260530030953.740561-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 57296e18-fbef-4ce6-9044-08debdf8f0a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099006|6133799003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GQYdWSdw+lAyLzqSXZNxXZwXJWnYk4pnhDSjOxwgNOhNeoHJEg9s1QQt+G6YjFZ2uzWZJGWMgNNd4KCHf78dfCdcjtlopyMrZasp323y1QQ2bj7xficlXSA1OyQEZBy/wN9X/Bs9aCg90G4BaCOCen+m9uNHhXFsaN/NiDRW8zK1iPH1u3V+0CXbtIVBUyfUIyDOUVcgMzJKM1bcC4+ee5LD/B0tyXI9pD0ncXU/dyvF6H0E8paER9y0t034mshoTW8rsP6k9/xHp9x1wzk34nwkDCiqXfZhP4vfrYJeGJ8eZL/3D6fvcItdmBbspU/hI1SWZ13FFnw03PNJId/MQKZSd1E8x8TYrgsi8Up2Ueyt31bnR2LHnF7f9hCieMMx5dfqAlEueqJrO4SqTIaiue9NgJtEm9gD0ogq78D/lL6akC31B1RnKw8s47OPXsASQDje6Xq0/LFvMKT/qoPfFXzkJ8Izd/bkfaozf0arz8ANPtnjgs+Qxa2ZV+gc8YgVDb8GoahUPl9Yir6T7+hf6Nd/7sYU+9SnyPhxg02UxozSZjlzXZmWIFmmgkEyZmkYlYrDW8UMCzaSv0j3OH2ZS1p0MnZ+F1EJOFGLZtmZNMBMCwI139VGn0BIf2Z2OFhVDq2doCuUGI7+p6ka7sGPL3FbGNwqwB+flM5f7tsdwcSZMzQNb+3rPnl+TsylLEg4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099006)(6133799003)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NbESc7Qbta1f5F2oNB2yD1f7XpH+FjYNdD7lVD/6ZDlsET2M3Llf5DzRxjor?=
 =?us-ascii?Q?5Eywr6j+5mwxP4cZNBmpLr5IywX8sjqSl66slEKfEfvZ+2LGSV0ozcTuADh3?=
 =?us-ascii?Q?eourOfnu4Tp7Ky0U46+M0Y5vQbOvv06StKwlEO8jLaCTT3HtXIOXIKvarPn/?=
 =?us-ascii?Q?1caOWqdIY+msMzxJmg80Ki40rZ5vS5mebqR8o1YIzBCYUwqhNFQesU9RBVok?=
 =?us-ascii?Q?cZy43uwWpnk7qmqPGFAryEtpaSCQ8aDCTD28tsvfo7VtAQgloecKdjLVG6ZH?=
 =?us-ascii?Q?DakNbk2Mc8m/QprhLEeqfuQ+ISW1o/VOrs33tAw0t4yl/yVaIC50sYAAI6eU?=
 =?us-ascii?Q?Ols+SGXzPpRjuXsEInpWPFvuxAPrI8keS7v/2trP24WE3uVYIb9z4xwL7Ytm?=
 =?us-ascii?Q?hWdLa8O5EfwM0YlwFrvXuVpb+c03XcQmhlX2Xugy/8CH9PqxgjKTUItj32R4?=
 =?us-ascii?Q?EMmMBNQepWTiWNMs4Cnl/ChJ2perCY6Ios/5JkHUGq5Hk8Og+k8cOTzC4uLM?=
 =?us-ascii?Q?DKL092F31F1cf959Agzmq0K8bRVGnL+T6GJoOTU9nlyI7moOR0CqyFcOruji?=
 =?us-ascii?Q?OzbfWxs6lU0w0X6YpFS8XGTBPQTCbeFndkAwrZBB8rf3geuWIY86dIyTxRL2?=
 =?us-ascii?Q?5gK9vWhEQHqsYcGZsgesQ7XZm6K21f/MisQ2BaH5Pi2MbRMggh1WG6eqc2w4?=
 =?us-ascii?Q?koO+P+rQotrXLd72j8XzC1EzPpDRFBB/MkXRY+T3DfELUdw1l4GrwEE6Q3rF?=
 =?us-ascii?Q?/ac9WRQ+dUKknqQ7hYOQr//opVaHniwKJsDUQqSb5OiFxgDffK05hk/SPWfC?=
 =?us-ascii?Q?XjCPlj/FLbkAmMDQeM7scvgnTIp/DpYKb6BDAyvQNoaUoOmKtF6fcNGd8/rz?=
 =?us-ascii?Q?zS7xjJ5eeYTYtLseJk7KXHwrpNqc3bZk6WnikYr26I+53WXdwy+gUV7PFy07?=
 =?us-ascii?Q?S8yO+q4H8UFfYeuhJVdr4hA5iYcI7APxXbi8UprRjEftE6hxeG8ASIh+L0sT?=
 =?us-ascii?Q?eV34lUx9eT6cSgjal0jxZ0JTkUPhWwmF0qopsOTBKqIPAAXt0ThyQIYrHy2l?=
 =?us-ascii?Q?1YzcEeKaCxjkk2BS2bU3y11qFhaT7Mc0gnSJaS6okKL3coCP3JQD9Ha+jLk8?=
 =?us-ascii?Q?fL8s1L2AbvQhbF8mEw3Nz7n1q6MhYt3ORyLsF0O69iSoNH1G/7fwB07x0o2f?=
 =?us-ascii?Q?dcjmgv+EGXNSAQAHgCpkj0N6p9wA1FYWGlA+Mg82JwrgNX/lgUGItfQSjVvH?=
 =?us-ascii?Q?PBbHdNiQaK37ownIV7IiVJO/3EcZivrnK0OigM7axpUrW4n9tPWl7BoW/Asd?=
 =?us-ascii?Q?VXBBiIxlipcOz9pJVkt3W3T5pVKZntIexM3W+iLbrOFdPG9mqVXIsxQC1r1W?=
 =?us-ascii?Q?nw7Pw5gHcQU9axMjy46UbomEu/dlMyXnBNa+ONLBJNhCE0C6uOl48nd5Tgke?=
 =?us-ascii?Q?rxZ6gzYsDQMldk/LecPfVOkeJnxySe7qsH3r230L5OwgDJYXzTQ73rfV88md?=
 =?us-ascii?Q?qcGI8dRAny5aSACg1w1SwGdWcXGrVsVrFfx3MggyxLgonU0815oX+ypHG6sV?=
 =?us-ascii?Q?GYz0QIcwWGvHCujoDU9mZ/US42ecNNwpKUd9EUtiDz4YdpJNFzunw0q7OafJ?=
 =?us-ascii?Q?z5h8UGnuHfzkoYWeQnntspYQUDcfRPimJEREGwEJbEh4SWZD/gMXCVE+ch2y?=
 =?us-ascii?Q?+CwNSwd8bg7s2wnRHmcFKjATuF9g/HkDmgRs8WaL3nSPiViS+7BskhdjAkJE?=
 =?us-ascii?Q?cHgHTLME3A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57296e18-fbef-4ce6-9044-08debdf8f0a5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:02.1521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPEiWNUF0qnHyYE8djYPqasGPHo67tVFpXlPB+XNLh2/jY1cu8cALEGWzmSa85CGcEfG/JhfRv8Poq6MYv45XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863

The GSP-RM boot working memory portion of the WPR2 heap must be
larger on Hopper and later GPUs than on Turing, Ampere, and Ada.
Select the larger value for those generations.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs               | 20 +++++++++++++------
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  1 +
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 919d3ab00075..0c54e8bf4bb3 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 pub(crate) mod commands;
 mod r570_144;
@@ -29,7 +30,10 @@
 use crate::{
     fb::FbLayout,
     firmware::gsp::GspFirmware,
-    gpu::Chipset,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
     gsp::{
         cmdq::Cmdq, //
         GSP_PAGE_SIZE,
@@ -106,11 +110,15 @@ enum GspFwHeapParams {}
 impl GspFwHeapParams {
     /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
     /// and including the first client subdevice allocation).
-    fn base_rm_size(_chipset: Chipset) -> u64 {
-        // TODO: this needs to be updated to return the correct value for Hopper+ once support for
-        // them is added:
-        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
-        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+    fn base_rm_size(chipset: Chipset) -> u64 {
+        match chipset.arch() {
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada => {
+                u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+            }
+            Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+                u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
+            }
+        }
     }
 
     /// Returns the amount of heap memory required to support a single channel allocation.
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index f82ed097b283..1d592bd3f9ed 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -37,6 +37,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
 pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
 pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
+pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u32 = 14680064;
 pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB: u32 = 98304;
 pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 = 100663296;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 = 64;
-- 
2.54.0

