Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011037.outbound.protection.outlook.com [40.93.194.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643A83563D9
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 02:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769653751; cv=fail; b=E+JyUzYgp2BEpWAWreig0Qr1+aeG/3wzykH9C8Y6RvLWdMwheOoZzcbNoI9gXvQB6tU0kyYBO+1fEuEsJVuYeNpzrO6WSifce8wwpvhqZZUFMVeWvSwtjQTuIiATAR+4YU22BJov3RqIoq4nZA3VX1uuzwHqv7hzLCbrcTqqVw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769653751; c=relaxed/simple;
	bh=9Nr3oub4knfcV/IMTdtD9jjQxsrdFdmOjFpzpS11sIw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SG/hale9f/ODiHGgyZmdhSvSy+N6KxivQCoUUtyUNEEBFP/KXPJsdEbABB04uJCGFHXt9btXNOCA1LbMAa01f3Av7VK9I0I8p3i+ovx6Cysx80j1YANzYT6FKHzWvhzUsIX6RG5gOkXBnMBwtIIRUUb5hutfAgvrieA/SjqbGv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uMX494OA; arc=fail smtp.client-ip=40.93.194.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uMX494OA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwqk9empXGOA20n5unSQ6ZYaZZh9zF7lx1B4+Hl0Bb8IkdkmHmtgdXwyb3/FbjuTEiO3HinTAOsIgwy72aGqq0E/SlbyY29lbAU2mhQCok/v/srcbLoBdZ0mv3qQpU3LI2wDfh4+Hd4dZpy9b5FU1MqWUvFULX8Dt/TmO0QVkqduy886Abih1bbiVUUSbbdEIZHc+9D6/X2RtUljVgJ359Tp+AyZ/V97TtSKLHQ3ql21pfDgb3i9IIqIlueaIoasocqzXdoHbGp86IL5C/3w9a7ffb59iZZKgLi9qtuiFnwKGMbwA21TVQWm4FWPU2w+iQE3tUHGJCQhOrxMS5EtmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjVK98stoF1sYQ5PfCRRrNZGjI3gxBphmdnyl6t6vKw=;
 b=PH5PY6Rc4GoZ1yrE/pxUoBduEVeIQJ1sz3DfE2Rdz+yPRtjUbIZQAvcasqwRN6YQWfsbQw0WcTSSMA01hj3HQI+YcDtti1kX1ENxQRQeyWINd0dpS9NfxDTLys6eqtCgWGHMfx/0Mx7LDSQKXOX7gI8geOMefZ3aoBAz3a47sC+yGipl4g567e3EN+2esZpj6Eys3tppyRFQY+Kpb0MOw1aBTsku1qJKSQ+w8dV2md0skCes3JpFA9WGcFmuR5sepsiLqo25cMQeIVf944aTbUTRomfIJFZ89443fFbbp6IPxOhmMvyuRaQfU2ryC/QG8LQqonPsCWvWYTQ8+KqOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjVK98stoF1sYQ5PfCRRrNZGjI3gxBphmdnyl6t6vKw=;
 b=uMX494OAy0gzpvzffnWugkvnnvB55kvxxPxBd925aNFhl75Z4ZL+xc+2XZxugbY6pe0+adr18S4u+j9lOOCPAtwbj1+zHgGUr6jDklOtg6TD89QW98V/eHToHFoyLuezf/aCpFBoLdPDJff3RCSB7Uyq2pADkGH6bhg17kR4zzoUYe6JMSIbhXDm3vNwOq94Oc6LFV3eG607cDm7FQ12B+X7IHfK9KAJe0bPpfPLshj8D6aNYNjU509fmq4rqXC78SjEohTt2rOfqflXJvE5iWjkd2Ie3XHfRqu5phcnZIWPdjzgnmShB94CY6ApyS9BVHvZ+/NN/s9vrV+RBdEyHg==
Received: from BL1PR13CA0084.namprd13.prod.outlook.com (2603:10b6:208:2b8::29)
 by SJ2PR12MB9240.namprd12.prod.outlook.com (2603:10b6:a03:563::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 02:29:06 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::b2) by BL1PR13CA0084.outlook.office365.com
 (2603:10b6:208:2b8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Thu,
 29 Jan 2026 02:29:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 02:29:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:50 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:48 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 3/7] gpu: nova-core: implement BinaryWriter for CoherentAllocation<u8>
Date: Wed, 28 Jan 2026 20:28:33 -0600
Message-ID: <20260129022837.4133832-4-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|SJ2PR12MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a7ceff-0ec6-4b41-e33e-08de5ede2c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Ip0r99c2uzoe23NjkQrK27RUv0aL23GOdGd6ghedivDzu8gLvtrk06iaZ6m?=
 =?us-ascii?Q?h6u6xVTzB4hqr/U4bNYW/r/qtRoNFIAGlsuQ9A1tjU6cC8YPPwGzdfQYqraw?=
 =?us-ascii?Q?zzo7hhx9gqTc9p0/zGDPqEq4OHt8trpsQI19nvv6TtmbwlbQARkBKgC1RLIG?=
 =?us-ascii?Q?ONaX5X4Blv7CiIBDvcHnlF/CghzpfRde5aQX5d9Up6A26Y1/v0ufC1mRVROr?=
 =?us-ascii?Q?eViU1BQk+v+YDaC4aMFczEE3HJZz6up6SzTehbfdQw/zASlDINlwaGctfQtS?=
 =?us-ascii?Q?99uTqamQ/qioEESEVf5A7eOEudml+w2F27b35TTwOk6Yb327mje5uZUVEeyn?=
 =?us-ascii?Q?CQIp3qpZenxXUA6f2Vrg6nlbwxLd0QCnbdi4wGuxhvRObwFtFJCEYBCJ86Td?=
 =?us-ascii?Q?fnz0YbryG9I1I3199a/Gf2/gcKmjlkhgvRftxAPU21ZIONKHFbu5XC7dXvWs?=
 =?us-ascii?Q?BUYZTPrccSyEcS8QLtHIzy7bDI4m8+6BT9wEg3/m8ggAXIOmZi1yA6SWNGzL?=
 =?us-ascii?Q?T624nVZA9XUOaxSYEFuITJvwtS7gD2+iVzoUtOaJi7t7C0LhLsO/C3xX8OrL?=
 =?us-ascii?Q?/QTFVpn9+HfhCxGZW3qYtbV6CniZfu8NvrANgBYt9/qvg/pI4UFbq1RL7A57?=
 =?us-ascii?Q?PW7X5UG2ThM9tCMEw9uoWWyQ1IWT8j3wuU451Ex57XoWNiXf/Vz55F0iUN1H?=
 =?us-ascii?Q?pmo8xwY7OmhkbTumOz7f4aA2AgyyNJVJMAsq0xJwwhNU3NmDQbKhM9WOgswP?=
 =?us-ascii?Q?pISCQR4Q6zlk7TB+scsZJ7eVQyfzHSYXS9LBXq9hML5tX3syDna1f7fMh/zy?=
 =?us-ascii?Q?5fZ58xu3CHQhHQlMXP5yJvdq3qUzaaHKp9LRrS95qBATOzlbdJpASztgTMhi?=
 =?us-ascii?Q?5DbwAk5vMW+f8vIOTkXRgQVc5nTafRq3m4lppmu15aRwFObLxfBf8jGsIhy+?=
 =?us-ascii?Q?ON9mVt7sKxaGqzI7lGV7bovYUkUqT53qXGKBwDOX8cIpkxXWHjeOYZBfklkB?=
 =?us-ascii?Q?YNLW6w6JFKUCNKpQw/NiUiXmjqt9hi+gukmk+icegOfONCMZ6kUFgJJIraD/?=
 =?us-ascii?Q?XdIR/h1o3Ms25D12x8/liX/KTcSmLeJd2D9fX4M903IM7zRigvBttgIAL+vJ?=
 =?us-ascii?Q?Uudj+IRImLD8EaqjSpml3TkdcNri3Vrcia+m83qFwkv6lU1o97STVNd0B7/f?=
 =?us-ascii?Q?ynRJdTg1Dyyold/VN3qB1kfboxdP7IGXz5ysoVKt7mk4kKVBRQbrPCSXYCWc?=
 =?us-ascii?Q?fEsjwjKqVMLhV/aeKcGU+OHRDN2g9JPtUdTyEDnD5z7iC07JwWbo0l2WKhMM?=
 =?us-ascii?Q?TCdkss0sNPQO2G0MaIzXWDuBqvipgKcSPKT7Sq0Xd6eLUnXSAzsV3+2cyWHR?=
 =?us-ascii?Q?i2e+XaLs1dT91b1SARSTWXqBCKSpDE2xnJLHAbzxLJk6gOaAkyFa4JlXgvG9?=
 =?us-ascii?Q?I0E4fiLQCcZSKgFX4hf9aT194ihwVCotbU6pGdaKPfQTK7xTTmVPgYRFwfxW?=
 =?us-ascii?Q?3C05Rx2ops7jVZA4KvYyoYK+u21pLfFfsQm++nxyBm2aS5/Z0rubCMo2G0dc?=
 =?us-ascii?Q?wBNbZj9mv2uDxYS5lM60SBaKsxvexQYb5i3kBp7Pzx2LGd61yVtQgaT9JyEc?=
 =?us-ascii?Q?q4R89KaspRcsGi391WYkqROxybxJKJhzu6Msunq070k7T/o/3wXFSAw42yPz?=
 =?us-ascii?Q?kPXxwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 02:29:05.3959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a7ceff-0ec6-4b41-e33e-08de5ede2c84
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9240

Implement the BinaryWriter trait for CoherentAllocation<u8>, enabling
DMA coherent allocations to be exposed as readable binary files.
The implementation handles offset tracking and bounds checking, copying
data from the coherent allocation to userspace via write_dma().

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs |  1 +
 rust/kernel/dma.rs           | 36 +++++++++++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 174feaca0a6b..f7134c75b1f2 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,6 +3,7 @@
 mod boot;
 
 use kernel::{
+    debugfs,
     device,
     dma::{
         CoherentAllocation,
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index acc65b1e0f24..dca16fb5a2fc 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -5,12 +5,14 @@
 //! C header: [`include/linux/dma-mapping.h`](srctree/include/linux/dma-mapping.h)
 
 use crate::{
-    bindings, build_assert, device,
+    bindings, build_assert, debugfs, device,
     device::{Bound, Core},
     error::{to_result, Result},
+    fs::file,
     prelude::*,
     sync::aref::ARef,
     transmute::{AsBytes, FromBytes},
+    uaccess::UserSliceWriter,
 };
 use core::ptr::NonNull;
 
@@ -651,6 +653,38 @@ fn drop(&mut self) {
 // can be sent to another thread.
 unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
 
+// SAFETY: Sharing `&CoherentAllocation` across threads is safe if `T` is `Sync`, because all
+// methods that access the buffer contents (`field_read`, `field_write`, `as_slice`,
+// `as_slice_mut`) are `unsafe`, and callers are responsible for ensuring no data races occur.
+// The safe methods only return metadata or raw pointers whose use requires `unsafe`.
+unsafe impl<T: AsBytes + FromBytes + Sync> Sync for CoherentAllocation<T> {}
+
+impl debugfs::BinaryWriter for CoherentAllocation<u8> {
+    fn write_to_slice(
+        &self,
+        writer: &mut UserSliceWriter,
+        offset: &mut file::Offset,
+    ) -> Result<usize> {
+        if offset.is_negative() {
+            return Err(EINVAL);
+        }
+
+        let offset_val: usize = (*offset).try_into().map_err(|_| EINVAL)?;
+        let len = self.count();
+
+        if offset_val >= len {
+            return Ok(0);
+        }
+
+        let count = (len - offset_val).min(writer.len());
+
+        writer.write_dma(self, offset_val, count)?;
+
+        *offset += count as i64;
+        Ok(count)
+    }
+}
+
 /// Reads a field of an item from an allocated region of structs.
 ///
 /// # Examples
-- 
2.52.0

