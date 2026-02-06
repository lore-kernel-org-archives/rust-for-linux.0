Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013025.outbound.protection.outlook.com [40.93.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07271346AFB;
	Fri,  6 Feb 2026 04:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351727; cv=fail; b=Xi1ObiKX5P+37B4qcFHoGFInnsKv1kdsaPSInBLdNb9FQsm46t53aM3AeU4Ywyb7bhipXRulRV+4/GtbmOyeVE5zF5LRi6m+4vPIvSEbrUvzGSfIp0ZtOfvl82HrdmT8Ly1qCHY/gbeAA/nVlZSszRJ5RngvEXKOxnBnyQF/K7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351727; c=relaxed/simple;
	bh=NL8P7JYlMokAmiGTRI+XvYzi/ECDuIvkU7klyVr8y8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R1FF0A58EtziijamipHMSV+iBXSQEpid8u5tpLZj78nTkGjAuoh/jAwwnp5yJHOVIkEuReB8Ewyg+XpYzlYEPt4liYqMaU6Vd39hVt8xsNK0wRuDnzzfbogrpzleD0MZzvmaSDYfTGzWYNSKUWjNMJphxRG8BjrVMeg5FvCjLjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UAfDsCFv; arc=fail smtp.client-ip=40.93.196.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UAfDsCFv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuNiIsZb59bPRChYV7Z8qukTSClXA+3tiCyJr56RIcsnBEk1J863y2CjeSN4ZmYOcgooxYrLha11uoQLrEKhLOArIsmc6dFXznS5hqNdrSVfDuqvqs0TvyeAAb2eWKFyuapRBLoXaFtrbEcNmTd4QJEOsKzG6b86mI2a7gIVPpGirAm0FxnatL2QZZgPkvqi1dGXvXxM4nm9ZB/cnIH5PJCBSUVdGvdIoARSmXvP6PWdGSe164f7o8QSuUMKUZ4riqxWGUjWcA7HjIxVRsvqxCNHuKQ4hY/nCKSpPcTR9dqf3cYtQvg8vEh2/sMwneY9K1Q8coJfzoCPBGBX0XpFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lj19PGDcdvvm/HxBKs22piF9pke+pQlVxkPHG109S7M=;
 b=iEFRjE7G9zlnzNzcfU8f3ZdPpKQol/fWJPV6jrvZ1sbxT3vkesbMQaDZMN7pHp7dRXkNzDHOgrHSeXxK3Eki/8nya2p+dzEMTMzpRh0B/13MflAsCX4YvMigwt+HEkd182AxtHllGb8GouzWPkDL0nw72R2D0Ugdo4NH+GG9p2vmzC4rwgdK//ATy+3ETxYq2EjudN7h1vOJ8vLJ47QSe2xz/O15N0+fM350HlWQhvTqs7gt1tpvlu9FgsbLv322KfLmqOT840/poJvwsLIEsN6JLdIFPLCUvqf7W2GKxkB5OX63adrUrPzGUsFjE851gMPiWzfJxwYBeUy4od2jtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lj19PGDcdvvm/HxBKs22piF9pke+pQlVxkPHG109S7M=;
 b=UAfDsCFv/rNeWpwLz+1Ea3A9LIWnkvtj8FLGGY7twrZlRi65bQstxnwBaZdKT9/DWAl5/Lfp/GNori1GdVHCFS4Smb4SSaQ7TvhDopXaRAmyjkvAQRw93p/+ijxjzZD1BkRSq93OqyKNtbtK9dVSQ5UNK6kZdWGElGvwjFuSDhYIb3+P+goDbqa7/TQrubRHGSTxhRVciyZm9ksziDizaDzo7OIfvtw4N9ZDea+E79IZ5U+htVk8EPgPnqLJPrGK6L6t+xRsDC51+zgNTSSVFVas6bPrbeFOrIew+VqI1oli9eEIVpWGHlJpg/QA/kVLDWu3wJu5Hfc0/cwvn8+0vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 04:22:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:22:04 +0000
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
Subject: [PATCH v3 29/30] gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
Date: Thu,  5 Feb 2026 20:21:22 -0800
Message-ID: <20260206042123.303281-30-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a793687-61db-42f9-48ec-08de653747fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jm92qXakX2WaHs6/Idvw0STHP11+W4yaNohKtLEna6JycxItypkuFTnueMGe?=
 =?us-ascii?Q?OVCdE9RUCdrSte/xUf3KIWRfKskbv5z2whSLi31kQxekKUmCpFd/szaR0g7p?=
 =?us-ascii?Q?RamULYzxOy/cFGkELPSq5YUoFvEC/fP1YIpapQoZSrx4+7ovJth+TnYm4zeM?=
 =?us-ascii?Q?dgPIFmopyxbaxoLTGGAKy0QyzvbqQ9QGtd2aJhAr68Tb0MhFZIHuCm0XcRAn?=
 =?us-ascii?Q?slPSKR2v7fDgCMJmYYWUsZqtbJg7tuBhannausKQwO6QL+tqGNk4yWV3a+b9?=
 =?us-ascii?Q?8ZpuKHjRLHeJ0r+UqtyQ2eTrmHXS7rvfR4EhRScd/Xc7HyBXm9jEHWSuGyM1?=
 =?us-ascii?Q?PPdRsuL5YBDJMo2dUw7zrQWHyZ4XhaAM0eicnrijWgwDiUd8ASPJn2hVZY+K?=
 =?us-ascii?Q?PCOZu+xO5M91A+/WfoFV4zyriMOAvUMMD8F3ZIKhNM5Arg90/UVyfGoMy+2j?=
 =?us-ascii?Q?MuPwyWy1cD6SQL5txSoeUNw83adWwAAGLLyfYk7jhKx7KkYr3u1CxEvoI19W?=
 =?us-ascii?Q?i2dJ+ni9VovRDnYm6oHubfGENVe7V00UHopfNPt5b3/Az32rYbwaKrUBR9xG?=
 =?us-ascii?Q?o77bazcWv3RRZxlRmssPvMysvZJLDElqBeo8lin8TitxE0OC3kyC8aJaHtR2?=
 =?us-ascii?Q?RyHYxElohb1pSqnkb8iRAkgC5GbXhhYqFzlQjtppRfVTrVSaYMM2JXlwcLcA?=
 =?us-ascii?Q?uj8Ii7C7AOTy/SOwwBv9WOJpc3ARtmQDv3THKb/tRCMGxbi9w96PWjw1Y0kn?=
 =?us-ascii?Q?MXT7EQ+RZwjYwhVzwfdLh7t/Qg/hTZFCFir6rOETRFbXClg2e8hp4kggh4Lk?=
 =?us-ascii?Q?P3Trl1938Cz+wQAb9hKp4N+EFW3kGg+LDY8v6RApplS33SZQ8UrWcv0OcbpF?=
 =?us-ascii?Q?iYy8XwVCmgYsLzA5sIk6vn59kjBu3ngDsOBWvkeYI2sYPn1Tb20DRawFcZRp?=
 =?us-ascii?Q?k3R9WSEW2UwFFp3YvxKx2uVupBUWiObtxz326sMvsXC8RAAEgtU3o+duw0W/?=
 =?us-ascii?Q?i8Vfh3Kk+DbbLJkxMw2rgYZMyIUj9jSzq9UQkFQadEAK5G1ErIkyApJUwxP1?=
 =?us-ascii?Q?VZG9LuSEAM1TCafN+/BSis9MPsa71Ijh6arFqZnj+DOYervaQA2bwchT0TtB?=
 =?us-ascii?Q?KMFhr9WnPhpuh41MF7KyyiTrqgzmP19tQkE478Mm09L1haT801E0puI+dQql?=
 =?us-ascii?Q?7HAyBWl3JiNFAcmqJtwT7OcHRAfjhryR8kEZELGu7xRtmZoZjr6oPXJbNTpV?=
 =?us-ascii?Q?3aHZTTg85jeoWGVFf4fsnvelcfoqvkpnGXIe/sL2w5OENrIJHRkCSPwDwnlR?=
 =?us-ascii?Q?ETMDrSxPrv3LIl8x5N9bvH53UpQL+5d1In7xCA8XV19I80O+qBOmznwKRlQa?=
 =?us-ascii?Q?EGxCd119t82LPY7KXa8oMAReIwdbWeM374ugihLfqgTuBXob/4LHLQpDo4u7?=
 =?us-ascii?Q?nMawjyWDA5LzKzOpkeSYq2XFqaQn5dLCtSDkty+KhQZ0s0X+9lEfTU7ZEZ4d?=
 =?us-ascii?Q?oTj8JOPdCTjOoqcIwjujCydZ2QkcmaVJZ28nSarcBvm86hi4WVaWgXhEG2F4?=
 =?us-ascii?Q?BtZCPrrXasyEvYQgs1A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ciS7pvxArD5Dk3rgExZ/JoeFL7WjLZIPO2UMZs4UuejNUiShqyWj8yxcjdxN?=
 =?us-ascii?Q?tqWMF6gYA+a++qNVqMm7HKU8d3f6vAtpCjZr4jXDnyt2aEYHCU3pwa/FGgoe?=
 =?us-ascii?Q?kpXA1K9mAUsLxZXdVIE0+z8LgFgCd/0YK4aMghjoYdbrYcr2O0ovE7mn4ygM?=
 =?us-ascii?Q?5rfU54ReLx/YlmdYdTLMduWrPftQiPDMrQBEiPquZPjDhrm35MuuoQVJEz+A?=
 =?us-ascii?Q?mc89pql6NY6sxfUbC5tHjI09I19Pt4tj3L1yQZiYUWSZ+RO8rBYF8CbsvYro?=
 =?us-ascii?Q?39BNE+u5eOnIEpDtEXzADXo4L0oboO8EaIrqS74Zb+CtwxpU16eyz24PczYx?=
 =?us-ascii?Q?w16dBGBJzKqxqrlEPfHS3dzOTlHk68nDmSn4pIPaNmjdbePzHzYbABQIEUA7?=
 =?us-ascii?Q?TF0XH4lApsIZ46YK41tnsLOOoP8ExDJU7ZdxDKuw4g22D0pGYgARyUd4jsr+?=
 =?us-ascii?Q?Ui6aJX+WvwmYRyf1s/96MuP0BOlqJNW4c7/WHIBP63l4TNEFDtQjmuVMeyik?=
 =?us-ascii?Q?vi0sqsjJ8W1Od6JWsBDADsjn3oqWAGckhSVUv5Ti8edwc8EQnd725l0YMUAJ?=
 =?us-ascii?Q?NkFy5vR1536ocpkAP7J3jcf3UQcOGFS+xD9y+FYjzbMf098OylnoUKBK0lVd?=
 =?us-ascii?Q?5HMhvM3SZJUZFumoK8reeSj5+UnqyBPeGkt8NCTcMYqAuz8Pz2HhDeqs91jK?=
 =?us-ascii?Q?6IfPtGB5gFzJTXT241AIkfaEjOstzEkraLwWvNcA2Nwnxx17E5r9vcH/xUWX?=
 =?us-ascii?Q?YjhPBPpvCHqmLLQi2nKZ9V2erYfuMdTriPkXEAvcU7tsdCoDnjgqyizVvSHn?=
 =?us-ascii?Q?vgTimMoJ343ojvYwmOPqAbeGk8R1gX99pj2ixS4ieBwDqr3a+fxiW6j1ErTn?=
 =?us-ascii?Q?KHzN4Qz/wYcliIV9r218e1cB/TWsamp9MwcAerfa+J0kuQvxo8CxT4itvqCx?=
 =?us-ascii?Q?j+kLJhjatBSph4ik0aPGgfoXgDODB6aWIpQSdzn6xu4tquII6JEdgHKj0QNu?=
 =?us-ascii?Q?Q+v28stYbd0WL6Sut4UlAjaLcuCLpqD7s9G3fsrEGXrxTuw7EDFdZDJo6jVI?=
 =?us-ascii?Q?Jjfws1m0iTZJP3zPBm8+FQK7/7/5+FPNQnkJtGNoueRiFGjbrAIG7SrcieO2?=
 =?us-ascii?Q?504nnzWO5JxZupsjq6PBISiP3HRDUwAktz32z5heok7kRi6EjROC7mRLZGaJ?=
 =?us-ascii?Q?Lk3pbgyIPdQtn449ZuDhXm2Iwf7iUQ6fVwS/sLwKfME4rxdYZ87g8nt76igi?=
 =?us-ascii?Q?cOu7owTT3LbQvQKJDckZGdP0xcUDNdOtjFJQyhp7iasXr9Ypv9tSjKhYpyIQ?=
 =?us-ascii?Q?SuB0WBG1ISmZc5dVdwwX1c/e4gRuLSfJ9iNnD0nGd7aXqxuXZ+HmBbqUIDsi?=
 =?us-ascii?Q?QZj8Dv4sSzNRUgQ6mJwbslHRgbG/rBOyH65jX+Zh0XTORI4kZGtcXAYI00mY?=
 =?us-ascii?Q?/WsR6kjKHNbp3BEgy4l4GOmJkqgFHO7FeKf022kGnLyyETZ9gbc8J0Zv3hiN?=
 =?us-ascii?Q?JJsFBcm01fTXKX1sGdMscBilRKSlkUoaU6UP1zem5LIYKgucjkzd8ZMBW9nV?=
 =?us-ascii?Q?w31B0cVIugjcgfIEtk5Hp0wYSsVJbQhwGxZKp4aH53lubgjP65KJLLDH6dg/?=
 =?us-ascii?Q?faeLMHiNNaj1IpYPg037GbSgT5qyBDQQRhJbQq+XQrKf4Swr6tnDi8vq+kJP?=
 =?us-ascii?Q?molFdHakouJr77oC6SJuoql9BjN+iJzFlUvIjlwryTC4CVp7vh7v47XwTUr5?=
 =?us-ascii?Q?PN0gYAjQqw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a793687-61db-42f9-48ec-08de653747fb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:22:04.0066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9uPIOYDDBIiYj5ARcHHiNYZURR3twoybnSh+Styi7EBtnQFtl6R0csGjmizCrWqINiAY+YCqb8uI93ckBhCnhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468

Hopper and Blackwell GPUs use a different PCI config mirror base address
(0x092000) compared to earlier architectures (0x088000). Pass the chipset
through to GspSetSystemInfo::init() so it can select the correct address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs    |  8 +++++---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 18 +++++++++++++++---
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 5284a35dcc2c..04b6141a9c38 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -388,7 +388,7 @@ pub(crate) fn boot(
 
         // Now that GSP is active, send system info and registry
         self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
+            .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
         if matches!(
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 8f270eca33be..e6a9a1fc6296 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -20,6 +20,7 @@
 
 use crate::{
     driver::Bar0,
+    gpu::Chipset,
     gsp::{
         cmdq::{
             Cmdq,
@@ -37,12 +38,13 @@
 /// The `GspSetSystemInfo` command.
 pub(crate) struct SetSystemInfo<'a> {
     pdev: &'a pci::Device<device::Bound>,
+    chipset: Chipset,
 }
 
 impl<'a> SetSystemInfo<'a> {
     /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
-    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
-        Self { pdev }
+    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Self {
+        Self { pdev, chipset }
     }
 }
 
@@ -52,7 +54,7 @@ impl<'a> CommandToGsp for SetSystemInfo<'a> {
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        GspSetSystemInfo::init(self.pdev)
+        GspSetSystemInfo::init(self.pdev, self.chipset)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 470d8edb62ff..fe8f56ba3e80 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -10,7 +10,13 @@
     }, //
 };
 
-use crate::gsp::GSP_PAGE_SIZE;
+use crate::{
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+    gsp::GSP_PAGE_SIZE, //
+};
 
 use super::bindings;
 
@@ -24,7 +30,10 @@ pub(crate) struct GspSetSystemInfo {
 impl GspSetSystemInfo {
     /// Returns an in-place initializer for the `GspSetSystemInfo` command.
     #[allow(non_snake_case)]
-    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
+    pub(crate) fn init<'a>(
+        dev: &'a pci::Device<device::Bound>,
+        chipset: Chipset,
+    ) -> impl Init<Self, Error> + 'a {
         type InnerGspSystemInfo = bindings::GspSystemInfo;
         let init_inner = try_init!(InnerGspSystemInfo {
             gpuPhysAddr: dev.resource_start(0)?,
@@ -35,7 +44,10 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, E
             // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
             // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
             maxUserVa: (1 << 47) - 4096,
-            pciConfigMirrorBase: 0x088000,
+            pciConfigMirrorBase: match chipset.arch() {
+                Architecture::Turing | Architecture::Ampere | Architecture::Ada => 0x088000,
+                Architecture::Hopper | Architecture::Blackwell => 0x092000,
+            },
             pciConfigMirrorSize: 0x001000,
 
             PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
-- 
2.53.0

