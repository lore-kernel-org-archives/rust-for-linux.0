Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE1C30ACE8;
	Tue, 10 Feb 2026 02:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691600; cv=fail; b=nxH2y6MDkxT2sMxBcSMt6s2Id3NYNJwjYO1C4OtcLtxfz4Ne/fwlulgo8PKb+k1w2/+6n2JotcXu0BX+nrsEqjwRUIMSSL/K9C0WmBIv4cJCnLGe/qrOr5DDilVjaOLjxT0Hji4cbSjgEISFmFMUJz+SUT5iEv3q/xn+OifWLRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691600; c=relaxed/simple;
	bh=pMNWIOGkMNcRZJujfJdu1t+wLoh4kHDAx1LehMw7hEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HneYFSv8EBDYbG0AbC3cSZiYZeLHir6MHgrg3exd8wxImx0qLoeGKX4147Ev5EjE4O7jBOkSk8kZa0iaJk3TLWrXN/uy5IwJFlPSyeEaHszmGzhBPH33r/lFGoXqWTP7m07FE3ITCRBmUclUBqxjRYmw6O1qcWort0IVsXao1fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ve2AR8f3; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ve2AR8f3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6JwjIVx7T+kwToUH9j6rInZoMchbFHYmB5SK9cGM+AOrpXdKTU2X4wYKdZ16z0S7VysdVMUxhFfsL1lMtqle+BDcLaxF8a2fbAM5QH/tK8hRK1X8UIzSxSMVhGFqOKkQFlAP9wrUdIdpsiizgkZctsLEkGqJ8jlWpWplLF4TJklC+BBrPRc0Y9COMPzw2ShQwzMUHgbPcSzr0RKPdW2hzIvW5eUpCpjCtk0iNhuOnGXxxFm1yD8MmEUtZ7f6hek9XvGHGEErczXuVbM5l314cR0CmpJDg2XVaZzwXhVv6KPl20yGAGjvja+rBT/5RgdbFVTZtQwidSQUkuvPReU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Nnh06xZpBy9j8MMYzvGcFhEP6psIh1DI92+gSg1kfY=;
 b=FRQwQhBFlVEkPIGXNcJwUPS3xXJ69VGAY9sBnQgygTjHdfBzTG6AH2ksxLL+DthpwTgVSKocYPjVvaRw0MBvExcxNIKyuZ+Tzn+UaZKs7SO9kwyktX1RebAhW0kjxD3vioDL55xCXXWIYHQ0bhplmesM0osHL2NDWqfQ68ZNnIzC6ELfZbTbPW/Rsnm2PpYbtOBT+bB9xxKhLIJaUTTajIGD+VtUB33+yqduZdWkaDCXy74IEI1ZyA+ysbwKkvSNubijS37cKZqeXxuQiENcuSwYJUKJzxTuesBQNB2SuZ3S3XcUh7yD6/eokVf68I5VGKZbZFgcBHvH6KjHfbV1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Nnh06xZpBy9j8MMYzvGcFhEP6psIh1DI92+gSg1kfY=;
 b=Ve2AR8f35O+JaEMDL2YFXJA0Iek9xcWxQvScRY4Il45fygBPgH/TPS5hishSjRQmTSJOsQJ+8RzMmP6SyE26NL/3BXNzPfBL7UXi8DaoxV73rYDVc5gxA9b/xdovjjGpdzVtOaxe2mWLi7p5nzXY2zeXvpEbY5F1jVDCyy6xBs1s59zcchz3+76WyeB88LDkJMwdQnUBHMcrOrLEJ/lxxTbdYHPLnQPJdegyZho8BoegvezUVSgOMQuI7QyQpjL1LjRjIW2mTsTeQKSYHFiKMzu9njp8wXpLEOJ8TwB/2zc8szn3shqhQeStDMSk1snZkg2JxA2YYy7pm5PSd6gq/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:22 +0000
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
Subject: [PATCH v4 16/33] gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
Date: Mon,  9 Feb 2026 18:45:43 -0800
Message-ID: <20260210024601.593248-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 67025aab-38b4-4cac-a76a-08de684e938b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xFiiO/QvGawqK7Jb5Z+gln/FsxdMyyX+9ekD1OtNN9/EJWQqw80ZsF9pTaKa?=
 =?us-ascii?Q?WxvxjiSPTeJilat5H617KzTpZZLxtlk/IKTyQHE87fM9DotSVY3CPYSUqckM?=
 =?us-ascii?Q?yNVY/tl/IXfPsdTIGZw3OfXSVpluhusNb11PGTHEqCLtuBjAf1SiRxQr60To?=
 =?us-ascii?Q?6v3LE890ylKRx1kf+sA7TEyid15vI/SNeXkmxaF15D/Lxbp2iMztF3TBM2dx?=
 =?us-ascii?Q?NY4wmNBXKqWw0layU/3iofhSUKDCoVqqGFtVNRMxVLKGy2M6vIfqanwB2eVf?=
 =?us-ascii?Q?wYxfhyBt+//Wr6p79J9xhjSS/0X5XuEK0B6JyTEJOzmdcflXh2R5YIM/Gaxz?=
 =?us-ascii?Q?B5rLnnxL2+8PWVy9NTjcTd8NyoSDrFF8O4KJ7bvw+ZLBtuXX+i5GidfTIrbb?=
 =?us-ascii?Q?2k3xs6pXdOzlQLtTNnpJtuOB+BGlDOtX7bCJgecjdE0i1Bjqy15wKmgWty4A?=
 =?us-ascii?Q?Jg63+ugeM7OnGgWeYNewEeM0WxT05MylXkrErFrHeBAFRnXhkHxY+zkv2w9u?=
 =?us-ascii?Q?nuPQuIeaSWbEJUdyRT9OPPXZXSNOIO9bpJKbiw2zOXC2zEq6v2WEYtgnG3/5?=
 =?us-ascii?Q?4y1IgTmeuisH95/ywBgseWNsxGnaf1L2hQPKyBiH71XTWSc4gNdRWv0HUP1X?=
 =?us-ascii?Q?x9oaUfv5a6v4ASPd76L+//6BXt2rL3ZuV34BUFM/4eHxF7O7yeaeNNlPA1E3?=
 =?us-ascii?Q?mJBg2d2wLXeqrmfErfEPhRkG4XrA42DwfZxpGcjCr+gHWjcWQgwEKOHOMc4l?=
 =?us-ascii?Q?K2rlD5iHCf7+DfNcG/M1ONiPnseS1MiKkhRVixwEqPtbxmwE3j5Ebz7Sph21?=
 =?us-ascii?Q?L0mFuAJu3xVpHxbNYDXYe+VEFBFcx8YVwq5jXBDUY1b7IbXo8s8yk1szhVX0?=
 =?us-ascii?Q?LJBcWzgtpicFSWMwLk78naQe3HZCbVXZPZ2wvQbFrk2d1u0ubvuPv3OsU6/P?=
 =?us-ascii?Q?W7FSNB7ISfHjH/IasjS4mB/obburCbv4Ji/MJGocwSYVjd9XGVo5K1mplzWJ?=
 =?us-ascii?Q?qvYYrqFVgV2x5pRmDnwb4fiMNAo2OCpk7lMWW5RFJYXJkUiba5CoF8/J5Nyd?=
 =?us-ascii?Q?5Fv70QFGhJrUKpssG0nydljmcIWZr2bXPHGQQhSHA03tjXoUDzlqxmjkX6tC?=
 =?us-ascii?Q?Z8BTMudps232OD5D9U8drm/OzPoG/xPRqDVIsezeQuPE/koQtocw7eosmJdI?=
 =?us-ascii?Q?OYR44+OD5wFa6r2N/1PN26Kuy+cBFSE3Lochz6LfMuN3uHTrP8H9TxvxWZV3?=
 =?us-ascii?Q?dKf8dYqne4ml7dtwNtWovAYdPbqjP8Xns8xps24lZt8RWFugh43rXXKBccaH?=
 =?us-ascii?Q?VBA6tLs6zDqaDSCoQVsMVCgqbLqTHgugwQsZKj0sdoQUd3v0CFeYGFJEuDn+?=
 =?us-ascii?Q?rDtu6hwQUvlMWTXSiszyFtrZq4JeSx6qCdy6OgzguurBVEaafvHMqZmGxNPo?=
 =?us-ascii?Q?PgkbW8LiHi7uwyrsddKxuWVkuUEw3+6ucoqjeNH2OpqKnR2koMD58Km52yf9?=
 =?us-ascii?Q?sMD5kY0ZA41N/7fShUTzKMd3Lz0Cj4Q/c8mc8z3zHhr+iWrJWmxO8pRXOxwu?=
 =?us-ascii?Q?QdR3WzAfyuOBFkaAVbI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OMgv3ViFgvFTH8x+OcP8RyC8t6Amcfb8VPGslw0/0rk71i1hoMV5F+IvNB3/?=
 =?us-ascii?Q?5Dv5QrKrm2TLovsVudP0qV0dp8E8SQbX//RWBSciddKZ0XuujK8rmu+j501K?=
 =?us-ascii?Q?Hq253PsYyDkhci/KDedopSPC7EQVQTIUdFTTdqyP8ZgN8qV1dwgYf0njvGCq?=
 =?us-ascii?Q?C9MVIZ0x527gQngd9roKNN7Hbj+tcM5EIxvGU8lr+lJSe/aRdqnZHajgTaqj?=
 =?us-ascii?Q?ruwLq2kMQYRQs1FYD/bg3ojsMzbRWuEz1FnRa21c5cA8muEutwf52l69clKp?=
 =?us-ascii?Q?ksJy8yOzy2t5rssrl/ZZOfSBYLzF2gFD4JBeqhHhIEXzFGIsN1/CTweEnrZZ?=
 =?us-ascii?Q?0J3HxJRtoMBazO8m1ExX37vDBP3hTB/AtBCCjLV9EJZ7az8zcWJkHS6mxcMD?=
 =?us-ascii?Q?Q97iCyBd+yWCM7xBQKSNt6/phavZkU30FHrA260P7Qixb2PK2Yaije+sxeJC?=
 =?us-ascii?Q?CptrRXvo2mjzjU24S8G8RmpdwM8RhSQjkkN6bZsYhBIBntnJrirjOwvtfSyh?=
 =?us-ascii?Q?z+vBg6x97GkfjfA+yiCPFjRSNzLEjQaF3lS98KdSQ7GJtdsr6NTsfqaWS2iJ?=
 =?us-ascii?Q?81KD8ncZZxOfwudv2cbENTaa/z8WO+fHE8VMF2p2dyCkY6tFcQZKUV5U/FYJ?=
 =?us-ascii?Q?P1Zn7LexIQWKF5Y09DSSJtkmP2ZVr5Juiw1H/ijYo230UhF2l/yKEI7j2YXF?=
 =?us-ascii?Q?XIpwb+qjC6+OFdFfFZWq2ocO555idv5WMzhyKD3L52hf07nHNyxSRnRooB+t?=
 =?us-ascii?Q?dJg8EaC8SHYReBRrd0BwsyA6/K2O3ygRc76+82dqh7mz5EcofUwPCFTrGFmk?=
 =?us-ascii?Q?5tU0KWwwiJZutxmLt/wXyqFJ84Goeay3HFKasByk8lBz/eOcedxgOLMjcmff?=
 =?us-ascii?Q?r5f7dh20L/AKQXkZa+2eNRj/tFDeUVvqm42NBX0yc13IZkQTEek2wi/l6/EP?=
 =?us-ascii?Q?DhGbTFJYDxgYXxmME0t+2JVrR9g7SyTuBul2a+CVfv4mv+raZsQ52Q/qer6f?=
 =?us-ascii?Q?OPdYq6En3gJxj4c+lLgTHsgiNswIv3iPkeThcg36PUG1A9AkdpeRx9KwFQ6X?=
 =?us-ascii?Q?ODD/wLysEQEGYTnfFP88g1AoiZ/sy2DegMXGKxswC0Pfnx4xvCWpU2HgSFvs?=
 =?us-ascii?Q?L4qLZkkUDMJ3R3DmWCProJ9Ek3ebhOiR6rKSOmsOv0l8OWif2oO6s/WopTZG?=
 =?us-ascii?Q?baUwnqZrQdkThqLxMJlEVpsXQiBt/LCPH6kDVATRPZgj1AyTKunV7RvfHHXp?=
 =?us-ascii?Q?Cca/oynvJjxdE4VgIg0WbsZYjVMRnx7uwNAPhihrprvuZMMKjsgIrX5hooyP?=
 =?us-ascii?Q?Y9FT56C9eKmf2wIeJNqaEffAvwTlaD7YMcUJ5ywNeg1D4ZrHfNap02Dqtp0i?=
 =?us-ascii?Q?4l/889PMnK1aPRvdSPg3B5cOHpdfZfF9Zvo0nL32W+7qhfXSGOqd/RkWAmCc?=
 =?us-ascii?Q?M2PUHCOEBTwuSbcCMbMRhSCscemtgfVLN0j1sHVFLjklUduFgJjxuFIQp9cw?=
 =?us-ascii?Q?oxIwERdzb+6Kgyw912+Ko4hKFC+eNZTvyJc7ElUWKa1TWARw3AQz3s5xT6pa?=
 =?us-ascii?Q?t0fDAXwXtQxq1DOGtMcRKY5VjS5L2Oi8fdYzV+mbdfNPwSxiYCsIwWJ3Qefr?=
 =?us-ascii?Q?dltquhIA7PYD9vfgGzBHtl2Tkb6Fmw4tYhgIKGZkT+EEHeS/4xtRsXag1Fs3?=
 =?us-ascii?Q?Go6+TXTnGAzGn0VlvYxZPRCxn9qnvOlU6exTUDqM+vjVS+qFk7up11UeeDwk?=
 =?us-ascii?Q?3kOxjZYytw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67025aab-38b4-4cac-a76a-08de684e938b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:22.6945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMFOjWo9H2XVkwxWrPiCHFlBuY+9kkg6frX1ZWpu7QsHCp9S+AU1y9Aw3OqIa9UXZ+7roKA5PKwQS27bBJ5bDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

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

