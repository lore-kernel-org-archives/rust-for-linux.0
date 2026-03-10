Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013069.outbound.protection.outlook.com [40.107.201.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503D93EF665
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180051; cv=fail; b=G+HrYrQGJqOb7O2V95Yyp0ezKxU4OE4mHTYHLVl0oClIm4UixLMAaPLkMdGEf3YEoabHDkmoE5vujEafHU6TqjCeRo4/4VOhCxoUXpoANoWywILPSGh/n4tkI+SSZQaK3J0Pan+pfZdopkzcxSCFMytugz94Q9UcRzSVdgHQ8UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180051; c=relaxed/simple;
	bh=dO6MHTLfhLo41Tnamuek22nJREPUCp8G4SA3yvJN8JA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZLfsFtqJLqqnDXbP2srVgLfgI0DXTDla5HhHnPGswPQrrT2cHN2Vl1DTsPatqCrTqnT+jikcH8hd5wiS5CZd872uxpotScmHSwMxeAXG9o/U8Pid6CxlQnLkn8r+mLxJNblh9lpJEVh5gXVPk8g2zRNN1WSG5qSI3gzdiQGjNfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o3tJvF1y; arc=fail smtp.client-ip=40.107.201.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o3tJvF1y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQZxaSqoyGPcQzewhteK1qiQrwWLQ/LKqhMICTax30yzqm34CqKibQVr1GdMZ34onXImZW29PQ2NSHHrNRFb1MOw5f3J3lifvnIp1KRgEfRDX6SuiDPMNDAPYbOcgGXqSa8BHH9KidHk9w5X1nlmFVy/i3RXFdXugtljZFnjGcJRiE1d4/N1bDpKKqWWy7TOLOJJsUdrLZ+/Zi8Mo5ZFOFUgWRkWYgB4FvJNrtKV3Oy/QDqgS1kxDgCUdFgsQXPQY433L1hxJ/D1cZl/1W4JfGv1b906ReyJifysDelLEusOGbnDHnZ6UsbzGbGElK9d3CXPdA1n1EV0kRbM01TETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvvXv5Na20i7NRea8ijMg6GfaVJ18mctugrtleY40xA=;
 b=c47+zunSKsSg5sRc6tZPPRSNVnk3AJFPvmF3I5vu6kF4gPrvkNqmZL0kyA2LByhmP1frxA2AlOU/xStp0G2qsfem7xZHwApUByIMsajGdYOZsSsJuSz/wdMP5S1UWNK7slLDOYZlwcb+tNyJiTfTxgUBZJbm9HpyKL+4sdnKvUaccY+b0rxxgmgLuckGxblk0GEznhuQ8504WKk8y3HPgzUvVkQk0TzUEUQmDuRnvTOVh7W9d6AgwoLDEhz57wKBjzwgGIecp+bfK4gLTSCFs1X5dYH+kxiyGUScF/jc8Jpf49VwRUUEEdTDlKnRFjgwSYDLbuCrJnQLkN0gLtk67Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvvXv5Na20i7NRea8ijMg6GfaVJ18mctugrtleY40xA=;
 b=o3tJvF1yKg6xCkAXQ2YCriYpSywNm5JiWSRvGIGg9x5e7Rn2A2wixKjn/7MF7W7oVwpH/rTtSXMZLzLFvvXWpE6+zdG56pJ2hAk2oCSmLlKo5WQBetz76JLGupPv5QBzY00gxMLzHu6CEIo5qbaZ3KnnmOjcqFU0AEeYgttnQq0UzpnSj2H0iQ66A6K6uO8CCzJ6zogThYouxRtyvZSI631/3PV3gVKgW1snR8mVNkn4n5mIqu4kV4YThSsPysNqa1LGHv4trWTb6hwMLs3HNdcT9xrfoCb+ilp4hwaePRcGAzJJ85Tj0aGJGq+VzQoMkNf01MRgEkx5TexN6a9jog==
Received: from SA1P222CA0177.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::25)
 by LV5PR12MB9827.namprd12.prod.outlook.com (2603:10b6:408:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:00:43 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:3c4:cafe::85) by SA1P222CA0177.outlook.office365.com
 (2603:10b6:806:3c4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 22:00:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 22:00:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:18 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:17 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v8 3/7] rust: dma: implement BinaryWriter for CoherentAllocation<u8>
Date: Tue, 10 Mar 2026 16:59:56 -0500
Message-ID: <20260310220000.1897166-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310220000.1897166-1-ttabi@nvidia.com>
References: <20260310220000.1897166-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|LV5PR12MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 98617a4c-4199-45f5-6237-08de7ef079d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	hHZwdd00nMTer9wCuB9v/v+Yw8iysBu9yp1MLu6cErZozxLurhhCqkfTuT4vmL3exYEQ1hMRTOITWAMCIv/hLgISLGOvKZsRqKJlCuGsEE9IeOfBRbMyPptcE1mXaI/XHCkVbnueuvEGF1kYmZi7X1gzJRawgKljP4bWjDXSivwX86PKHPL0yOE2OCIDmDxglmLFZ1h+hvAXwZYmQFyqHHKoYl7i12CC7AYKAPsiy6QYmh0kXGkx8AioBo5F6Gt4qiproH6Qwg1w4WHle6RQQdBA4lSEQ8VcMcqctombH/JHActxsVOgIatlVMHSyKtDev6Ns3evE3sbmAI4oKQZVSUP8hi8hdatUa/dyKxWHf3xN+CQdKKj2WXj+2BR7P0kgs5OIQ3aHTLlkttyVeu11mnJTCLCYZWf0UJeCTvjS4APryh+kdSSdT44c9zQ7lf84oDmaj1LTaTF5ZLYzZafwqqAk6kVFa39FoFV0mZgWKpFasPrjkseTOmRyxg7t1l62S5MGqLuJEAZl0OnsIs38t0Bsax+THYv2cAIkxBRT5bSKH/MaUSVfgBQ5ksPupanZktVGhVS62XHhioOaFqv9jxM4c1puavqX3SdIMCb9hFuzNpY+TdwaRKH2Cgy7nUjlFbEE6jVXZKUOIyHaV9eTDlCHf4ngsx/cmKv9z4dQpw3Jx0g4q7iCeGBztoXPhUYvXSJgu67PSfQhhmm2JAo55nFttU8FW0GZ3a2N1Z086yqkU25R/72xXkGx8cTDtdIC+0dIFPxkiehrNdvw49ZNA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AIFPk1QO1PyATMCATS3T8kxbqwipq6VncKCTRGS+HuDDPMHxiUKhaxv/Dn+shZ3cv8vg/c2MzwmKkk+9iNUKuD4MTb06h63fjolBTF9rGquKajVEv6gPOYaZtJDCzRb6Fz+i2h7Q8MnKDJEAj97nES5dzBY0eeBP/8LRpCoz+LCk6GP0+wQ6+IHqtI7gU1rsrYR/brrlcHlfTt+1INzWw4TDmHRQeoHRY71sQBOoRj5rLuuhOpR3FtW2U+xF97T45s3sH0/6Qbyi3vg9cl71UhPe0QjqjdlI/HAdrAtiu4yhsz+7/ypAXq2FRRLAXsNMpQYwomHyw6JcmynFt7hQIFIM6VczpvAypAJK4Ed3IwCb5S/CBCAJOVxF4HyjHEVipTRSesHYXOlzscd/aTHAFXtH7BKo1oreEUFHUIwKpCKeHdxZA67kAHlrUwZZpPYU
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:00:43.3225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98617a4c-4199-45f5-6237-08de7ef079d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9827

Implement the BinaryWriter trait for CoherentAllocation<u8>, enabling
DMA coherent allocations to be exposed as readable binary files.
The implementation handles offset tracking and bounds checking, copying
data from the coherent allocation to userspace via write_dma().

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/dma.rs | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 909d56fd5118..b1cc39756dd8 100644
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
 
@@ -668,6 +670,38 @@ fn drop(&mut self) {
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
2.53.0

