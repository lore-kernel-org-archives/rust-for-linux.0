Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA843559FB
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 02:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769653750; cv=fail; b=BlpUM1PGmRITAR0p763nm1c56EyOnmL4rhSgp0QkvlopqCcvH2a2eJ9sjDcJ5QNSLjRCaTGk2ZqDq6KPyuy2l4/h3YVyt0eH4pvDeVh33psiuK+NiWpCzTZbUuQix2/grmmHZKWu6D39h/JD4OPJGtsGkgVHRB2xgrZ5HVaN430=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769653750; c=relaxed/simple;
	bh=lB320JTj1RkJJTqfhaV31bdsdaoDTPQ8H5LuYyI+sHI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d9KNBrUbBVwCkkALvqvb8OCjNOJBMxlecsu00qitl8qpf48CfcuK0WN49J+ln75/ekxmIPJL058jMby0grOz3j9oJsxxbU7SVHizIICIdts5ghkOWuBfRk1KQ7Hq0uK7wXgy6Sx+HiW3QLIX2KRhrxytgIVFdYADV789CJc+9Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=doG7fNzI; arc=fail smtp.client-ip=52.101.46.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="doG7fNzI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xbtbw0O2/td69tYSPgqXzCIeiuMqhuiLey+rctFotSHBAJjLzsS+IFEhx4rGPbv9pef/rT4j+5moQlZwwNcFKAwt+mTSPcB2a3QhelTxziPmDFSwH7TMBzZ7gOFk67jJjoSSb1n6laeU3vjmduVHIaF4/eDVUy9aLZnwot0bZI+g87uAmGMD3Ameq8kcnQhvcofslTW9Jf6NaJDO3h8cDhgiZ3I/bsV+CnMHvhsZHY6t+vlYyYjgJcYb5TK9GOLyy12hpjUDmyPd4fS7Hz9CZY8TWxtPQQZHro+bDilJ/wV1sbh6Mk+Lj1zddvdCkRDjhIHFoDP7inmXOtF1iIyVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZ+o6QU//I9Jw8ojZLtFiYBWvPVHF+fN74bb8AfVZes=;
 b=l/QTkmTw2MzQFrIKsyuKkQV0ZKrFiaDi1vUHPf2LD4PaIgnTQuCB5CC6eJOXAINCB0GHYSqRhTM23dV2XCgwIZHIZzrkni/+JavQa2xYqGvl4yP12StJ8t4DBTAIRNp24awy8dvHtLO6F1QL8ug+ERHHrqeXdcuV46gNCFRUCNqSYc9tLW1Ci1EwskvWehTVdMolGdj9zUSysNU4zhgcNA+CQl4M0Ad267+34dAV+L3b1wABH2M/gu23Y9j41cnVO58Nil72xnknotHLZYwbDOJZcBfqjKurCx/dpwIqBYCzz69x2armDbAVVjPuA4TyAz+2XeOztNuBNUzLe3mfTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZ+o6QU//I9Jw8ojZLtFiYBWvPVHF+fN74bb8AfVZes=;
 b=doG7fNzIu4nXdKyhfGxl9Jrl4xB5QwDbc/PsrSl23H2W0EM3p3JPDAN9SCqcbR0FhChEK0UjzqDWNNnife/9yqapimioNtHeJ257Aq/rllLX9NSEIJP4Zr9fRdPRw/tA2U1dKA12LCJ/ack5QSgholT3XfMHB3fhPUVJZWoEkqhAtuKZofM5U2BUlbjNU7I9nErXUvi3DzbE8+2z6OKoT7cinnyVzgMoOcSdNAHXdCVg8ZAptjP1igyqlkBqcs1X9h6r3jxQqFXEFPNr3I1u6dshyV/LWDaeoyqn/UmA7ZIW24dwU5b2FwUMJeAoZJXYj0V1ANrduWXULgWB4QLVlw==
Received: from MN2PR07CA0018.namprd07.prod.outlook.com (2603:10b6:208:1a0::28)
 by SA0PR12MB7462.namprd12.prod.outlook.com (2603:10b6:806:24b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 02:29:02 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::c6) by MN2PR07CA0018.outlook.office365.com
 (2603:10b6:208:1a0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Thu,
 29 Jan 2026 02:29:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 02:29:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:48 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:47 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 2/7] rust: uaccess: add write_dma() for copying from DMA buffers to userspace
Date: Wed, 28 Jan 2026 20:28:32 -0600
Message-ID: <20260129022837.4133832-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129022837.4133832-1-ttabi@nvidia.com>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|SA0PR12MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa88336-7a95-4c85-79f8-08de5ede2a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pKSW6mJvZ4Tt2ZIXOV7v2825ba73+Dxw2KJElqrls5KmXVVQInjXSUdixvN+?=
 =?us-ascii?Q?MBRMt7RnEwFmsoOP0ikEXK2maYB8e28+udJSKuXXDKTw3dKgANAnJQ5c56lY?=
 =?us-ascii?Q?gbndj3WcWj6yBZ2zdYs9cqoeAVi5btBOPzFmd0Nf49dqpn7xLC2s8cwOy8VL?=
 =?us-ascii?Q?kevMd6tOWEQeK3YJP3G+kKmuUMCv1gQQyxmO0m8y0AeczM6TnVAqiFKPYZSZ?=
 =?us-ascii?Q?6gguE4HMwskntng3Izb+Gctm1KXbMKXW8kgzkPB9keMJ1wOFRfvKaz13rkU7?=
 =?us-ascii?Q?XWBimczqrB3+/zdYeBzttYo5eqJedHVX3g8+0gT3uXHYVr2PIjNUPayqyOkD?=
 =?us-ascii?Q?eRAFEzKzkUmnH3HJFEXnXQ1EsqdZYXdAi4+rWwfLrxy0vPHOedDzY28t3vTy?=
 =?us-ascii?Q?FrbWkinQgurGUkRvV8GwICJPg+4fduLghseBrPVNnRVhLZ5Jrxuwptba1BTj?=
 =?us-ascii?Q?9LsoTzH/EEW0OR+WUoMmxaGr+PmcxPtWFsF4qeB85GAgWx2oX0fLtTItfQUZ?=
 =?us-ascii?Q?QQhhhMOZgZhDX/8gLz0DQlyqLatHAB+PReKNDNzzI+TgZUJU5vK+NZxGPnsb?=
 =?us-ascii?Q?HOZFCAVuhXvlFiI3Bv9UGpgptoXpM79AG4Th2ZvSyBphS4qyjVybrsTP7Jv/?=
 =?us-ascii?Q?YyfcetoEsfN6KDWOviCbX87YJui93etLyNoTwQsoW2ezTEsCDYXKm67Aj9Pd?=
 =?us-ascii?Q?TI1yA3c42npz1Bw/CGt08o9Pw5reHmdensHTh+991WQ9CCatEPLRQlQBxpBF?=
 =?us-ascii?Q?Es+r4yeAUVinNHBy1lNIFLa4Ut1jNQtG/HY5wMiMJ1gDtjND7mi1HW2njPnP?=
 =?us-ascii?Q?49xozt54ynT6giOiuQ4bltVPtVez8G1x4O4oWWxyoNx53IaYHVe1YLAW0U7z?=
 =?us-ascii?Q?MrdmmyO7XVi4tC8t8BIocuh0zvb0/lr5OANvsy3q2rzUC7ECi5Y8iAr1lQV5?=
 =?us-ascii?Q?MAAS0Fo293cNn4G7z1hsJaWbFzRGSqZjeEnlDx2q+cN7GCfDSLnEOWLmYXFy?=
 =?us-ascii?Q?5LlNM1xS8YHzFIuB9Ep/XIiEd2zxH95BNQGCzKyHJabonJALyzjGd+jgt93Z?=
 =?us-ascii?Q?9/YQLRwP/lhSmdDFhiD+zlkiuqYWTtbTyPsRZF/eLTSpBFo/zz879qYjSJuN?=
 =?us-ascii?Q?3PXP79E6vzuREAgg1alqzAaenlxgJnmNGqStLo/7EFcKxMzlBomR8/Ux/f01?=
 =?us-ascii?Q?Msi2ACfdif3pZkLyMgm0WtabFtm5Jwy0v7l8OeWmoA8N+hqamwGsj0Bonw8h?=
 =?us-ascii?Q?l333QPDvMTLKzkRE1XAGffHIMibw+DorabAHyYcTK82VHpHN7mJtiEb89UnG?=
 =?us-ascii?Q?dRvoqYyazaOi/RAXM7dmpjzJu9deCG6i0r1FQOZRdwNPSxzcKquKY/14Wl0G?=
 =?us-ascii?Q?KcnPcu4eWDZwyN8Oh/Ow4411G6PZTsVVnIZRP/bs9j27cA9byYVHyHyPE18L?=
 =?us-ascii?Q?kz0OqHOUm3Dpl/n7L+ppbBNXgs6L5omUPpTyna2mYCV1687A5anpHZOavF7p?=
 =?us-ascii?Q?HO0tlB6+kawHHfWDenCRrE0E5F+0t3YtWDMrCTwi3oVL6C/dQhXHtng/tOKb?=
 =?us-ascii?Q?YYvUnm7mDvh1Z/m4J+ojr5R+HE0OSnOq3oNFh59z8xWnjGqzRRHsSY+tvPhr?=
 =?us-ascii?Q?FXp047cSIfqoXJMefjt/DUyLRzzxtJF/t8peW8y7OgX00mZBhcOjq3guf3ZL?=
 =?us-ascii?Q?ZceuHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 02:29:01.9407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa88336-7a95-4c85-79f8-08de5ede2a74
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7462

Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u8>
to userspace. This provides a safe interface for copying DMA buffer
contents to userspace without requiring callers to work with raw pointers.

The method handles bounds checking and offset calculation internally,
wrapping the unsafe copy_to_user() call.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/uaccess.rs | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index f989539a31b4..f9bb88e47408 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -7,6 +7,7 @@
 use crate::{
     alloc::{Allocator, Flags},
     bindings,
+    dma::CoherentAllocation,
     error::Result,
     ffi::{c_char, c_void},
     fs::file,
@@ -481,6 +482,46 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
         Ok(())
     }
 
+    /// Writes raw data to this user pointer from a DMA coherent allocation.
+    ///
+    /// Returns error if the offset+count exceeds the allocation size.
+    ///
+    /// Fails with [`EFAULT`] if the write happens on a bad address, or if the write goes out of
+    /// bounds of this [`UserSliceWriter`]. This call may modify the associated userspace slice
+    /// even if it returns an error.
+    ///
+    /// Note: The memory may be concurrently modified by hardware (e.g., DMA). In such cases,
+    /// the copied data may be inconsistent, but this does not cause undefined behavior.
+    pub fn write_dma(
+        &mut self,
+        alloc: &CoherentAllocation<u8>,
+        offset: usize,
+        count: usize,
+    ) -> Result {
+        let len = alloc.count();
+        if offset.checked_add(count).ok_or(EOVERFLOW)? > len {
+            return Err(ERANGE);
+        }
+
+        // SAFETY: `start_ptr()` returns a valid pointer to a memory region of `count()` bytes,
+        // as guaranteed by the `CoherentAllocation` invariants. The check above ensures
+        // `offset + count <= len`.
+        let src_ptr = unsafe { alloc.start_ptr().add(offset) };
+
+        // SAFETY: `src_ptr` is valid for reads of `count` bytes per the above.
+        let res = unsafe {
+            bindings::copy_to_user(self.ptr.as_mut_ptr(), src_ptr.cast::<c_void>(), count)
+        };
+        if res != 0 {
+            return Err(EFAULT);
+        }
+
+        self.ptr = self.ptr.wrapping_byte_add(count);
+        self.length -= count;
+
+        Ok(())
+    }
+
     /// Writes raw data to this user pointer from a kernel buffer partially.
     ///
     /// This is the same as [`Self::write_slice`] but considers the given `offset` into `data` and
-- 
2.52.0

