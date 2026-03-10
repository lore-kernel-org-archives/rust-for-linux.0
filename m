Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012002.outbound.protection.outlook.com [40.107.209.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A273EF665
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180049; cv=fail; b=fzDQig4oIeU/n6BqojW1agAPmkZi3NBR7ekMYCjZ2Lqif5t//RqeauLvxpErX8xkH3UjiHUjfEg1Quoa/0Ii/TkVNifCHuj/1LEji5SchjOWxA25Jtu8+irdfHGwkLN1f4h5kce2wyY0GHv6RrLmJVNMTRMwy02/Mx6QDN/Diog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180049; c=relaxed/simple;
	bh=AE6w7axZdUs6Qq7HogVPzPE4m8YoGamJYdsSLRBVbq8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RN5ClTQsFo/DxIz4zCf2vLPlfvisbE0p3ZczREEsK+BUfoLOdHwGE8arezcvPMEkDnAUEfKkVoTLE7V/VIjbUM18vhGrkAtS0NU3NvJVL1zPh9qWrNOZv5Tqa3iF6zp77+R2fW79ZOCvlvBvqFAmjGB/Ldg9JPrw1wISHYR4kUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z50u5oi4; arc=fail smtp.client-ip=40.107.209.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z50u5oi4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bh4EQSD4+Ydn5kjEqi863prsKIKtWtcs8T+CcLP46MvDbrR46nwIBVHgYNnDt4ZLOvy6jo2ptfWf8qWKmrVqSkknOGD8nuh5c+hdQtFlsn/iI4JyPb4sZMpDUU5M3DioqrQ866TJ4S2/8IE2DthesZF6017mMdl9NO6zXJ3DxcCL/92gn7GwRWEk1hrfDiq3CccO8jzgfOudAQkYMXoCQXbyJYsGUrgwoEmaIuJjWTcXhYDhXPtKHE2KazUzHnwrjxkArvGluXdNQfjc+isXD3k9gRRoKl6RRXDeXtn3yR7ZzF42Rb62/4kfdZD10ucc4Y9YCznR3UURWxv9WEqjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VwEBcvVrcXNLnTM7samPrWaHs+InmdbbkjjmB13lVI=;
 b=Gir7AaG2vgENaQxDo7I+8Hzk0azL0k+5oXecs/4FRkKJdNHLIX4U9Wv+i/pgJptDGOkHE/jTMRzf62BXd6CTV4v6ULFtzo+4XYYU4Z/hFeWVNfFAcIwX2I2+/0UXYXsmkcHJ3Qpf+kjpCeqrXMOfz30UFTrdAXkMJPLb9BGo3umt2YVFdLK6tikI95Nl1VRsMP3cWIcc9grYV3yloE0Euv9eUTaam8zcwI0TwESGGZuuRgGJh1CUgjj6u5+997ZpwO+XkcYcroBJ4lA9IlJeQkh6AtudH+8ZUOyyJSTHSI80dp5V2UNtyEaE1er9ajHE/vK2c8Pd6vvw26RRyVkABQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VwEBcvVrcXNLnTM7samPrWaHs+InmdbbkjjmB13lVI=;
 b=Z50u5oi48viXBdv/RtDAWjvcYyUPOZP9G1IaT1QiRtxxFliiW62P0E/zy9sS9X6mqER4QlzoaVBGVe2X4ur4/XvnW47WDzr0+ZoimkmYuh0vvXwbB2M1LxrYiR0cF2rVpBcHbCyHeJx4jh603tznyX+eAXHg0/fY54B9sdZp7yFfm3EMmz1r0+VS3BbKz2O4H90OD51Em8RFQA8YhcDyiQck8qC7sTC/e8x1YyT0pwqWOpAbHXTIuKbgFz1xNaadHWUiitxKeDDSs6jtJig2/ZMHbOZOaZN60nQ7LzZ7eic1118XzEPu6VrUl9k5EYmoZxLZT267TUkLtogakDHKBQ==
Received: from BN0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:408:e6::19)
 by LV3PR12MB9185.namprd12.prod.outlook.com (2603:10b6:408:199::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:00:39 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::df) by BN0PR03CA0014.outlook.office365.com
 (2603:10b6:408:e6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 22:00:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 22:00:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:17 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:15 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v8 2/7] rust: uaccess: add write_dma() for copying from DMA buffers to userspace
Date: Tue, 10 Mar 2026 16:59:55 -0500
Message-ID: <20260310220000.1897166-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|LV3PR12MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a18773-ea6a-451f-4910-08de7ef07747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WO8v5hhwignjQXzHi//cpfiWxa+6gHdjSOKE0r0JfmUrfFyjZa3+T1VXPicgjF7AWLlZXSHq9L0eSLy27mTAcccsZvH5pZW30kOS1xbaNHu5sEtbWI9UrQWemBoo2kuSjgzGzQNhWXQgy6JChqj/AlQWdNbXOjCmgJoa31V3cEfI5r6FyY0UZbz52XJqqlxj9CPTgk+vIo4cuzW8sn22B/kSvpKxXOkq98vGW/6VsAFawhQLLZf5H4bjOjbq4wQNPvhbsIFeL+f3fA1LKK/ZSWrqYatuPlT4le+rbpKd4LI0ClRiIyvAkrSEdLJLUZFtyiEKJch2oQxcXOYNX1Ts9RvPMMevS0KcwmR/RK43Y8L1AMnWYGoXL/U+1jTWpboaPPYX9qcq6qnOgromyTga8xoxtapp3Fp9Hj6HLqemQtRRgX1AQZRrrBC20dWm0+R8j2Yk6ZFOwg5gPfUDY3b/YrAw3y8zW4MZTxsDdhc0M3LzCFtN/SaErcPxKyYpUNNQ6ZLp06jJoSvI6osFMy3oIUkjWpTtXh0YLqucFxDe1fnrA1E6QQBpe7PwsOn71Lw/nFGSv9WjOV5uhomUrkFuPomGdyX/cJgYNmDCkHjoIUmGKq+Pg/BkzjzVGn1nf0bt92celb4AYTfszCSKyQBX4h6D+vV1KA3YwnpibN4h+JIxLNaghN3g2jfL5O+ilgzuYvj0XZto86ug12Yw8KE8pzNTNcG3209plXZp7rG2Iw72PCB57lcIFR6Y7Y0v2ik1+BakWfgTKRH5d2PL+sNrHA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q1H9TgpJlXjcanAdWdJASh9IkbNGvSkd4lgLVQDoqgTBv0QUtOQX2mmsGlqq/DBtOg3ucyJX97xErT27xjd4Qmie9vrsFAIpC459hc5psnyoirM73Di5hSoYKhDaikijoexQXBXTLgkHORtNatmojSLus68eJ8MgDuF5zO0UbLYIy0MWI3/TsEFWrTaE/0BYj/X830c6J7Dg/Ute1hVRlWgmAgSYTzOVdSQ0r/dJmESdHKwwquOJ0553fbKzXyAHRWUcB4iraityNa1L2voAxzm3tCKF35KHBJoGNPGyw75YncsMii8YlpApjtpP/Z7mzlGkBS72OqVW3HLMWONJmlPyfC10NWA9B2BUjXnwjpVHUtYhOHYAlBkTHkeksYBBlgBf+iAvTfA+qoN5ca3bIlthYoTnuuX6q+plCky6bbxkIikpfvGx/fuXW2V9pHaX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:00:39.0173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a18773-ea6a-451f-4910-08de7ef07747
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9185

Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u8>
to userspace. This provides a safe interface for copying DMA buffer
contents to userspace without requiring callers to work with raw pointers.

Because write_dma() and write_slice() have common code, factor that code
out into a helper function, write_raw().

The method handles bounds checking and offset calculation internally,
wrapping the unsafe copy_to_user() call.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/uaccess.rs | 84 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index f989539a31b4..3f569acc3718 100644
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
@@ -459,20 +460,25 @@ pub fn is_empty(&self) -> bool {
         self.length == 0
     }
 
-    /// Writes raw data to this user pointer from a kernel buffer.
+    /// Low-level write from a raw pointer.
     ///
-    /// Fails with [`EFAULT`] if the write happens on a bad address, or if the write goes out of
-    /// bounds of this [`UserSliceWriter`]. This call may modify the associated userspace slice even
-    /// if it returns an error.
-    pub fn write_slice(&mut self, data: &[u8]) -> Result {
-        let len = data.len();
-        let data_ptr = data.as_ptr().cast::<c_void>();
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` points to a valid slice of `len` bytes (i.e., it is
+    /// valid for reads of `len` bytes and is properly aligned).
+    unsafe fn write_raw(&mut self, ptr: *const u8, len: usize) -> Result {
         if len > self.length {
             return Err(EFAULT);
         }
-        // SAFETY: `data_ptr` points into an immutable slice of length `len`, so we may read
-        // that many bytes from it.
-        let res = unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), data_ptr, len) };
+        // SAFETY:
+        // - `self.ptr` is a userspace pointer, and `len <= self.length` is checked above to
+        //   ensure we don't exceed the caller-specified bounds.
+        // - `ptr` is valid for reading `len` bytes as required by this function's safety contract.
+        // - `copy_to_user` validates the userspace address at runtime and returns non-zero on
+        //   failure (e.g., bad address or unmapped memory).
+        let res = unsafe {
+            bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(), len)
+        };
         if res != 0 {
             return Err(EFAULT);
         }
@@ -481,6 +487,64 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
         Ok(())
     }
 
+    /// Writes raw data to this user pointer from a kernel buffer.
+    ///
+    /// Fails with [`EFAULT`] if the write happens on a bad address, or if the write goes out of
+    /// bounds of this [`UserSliceWriter`]. This call may modify the associated userspace slice even
+    /// if it returns an error.
+    pub fn write_slice(&mut self, data: &[u8]) -> Result {
+        // SAFETY: `data` is a valid slice, so `data.as_ptr()` is valid for
+        // reading `data.len()` bytes.
+        unsafe { self.write_raw(data.as_ptr(), data.len()) }
+    }
+
+    /// Writes raw data to this user pointer from a DMA coherent allocation.
+    ///
+    /// # Arguments
+    ///
+    /// * `data` - The DMA coherent allocation to copy from.
+    /// * `offset` - The byte offset into `data` to start copying from.
+    /// * `count` - The number of bytes to copy.
+    ///
+    /// # Errors
+    /// Returns [`EOVERFLOW`] if `offset + count` overflows.
+    /// Returns [`ERANGE`] if `offset + count` exceeds the size of `data`, or `count` exceeds
+    ///     the size of the user-space buffer.
+    /// Returns [`EFAULT`] if the write happens on a bad address, or if the write goes out of
+    ///     bounds of this [`UserSliceWriter`].
+    ///
+    /// This call may modify the associated userspace slice even if it returns an error.
+    ///
+    /// Note: The memory may be concurrently modified by hardware (e.g., DMA). In such cases,
+    /// the copied data may be inconsistent, but this does not cause undefined behavior.
+    pub fn write_dma(
+        &mut self,
+        alloc: &CoherentAllocation<u8>,
+        offset: usize,
+        count: usize,
+    ) -> Result {
+        let len = alloc.size();
+        if offset.checked_add(count).ok_or(EOVERFLOW)? > len {
+            return Err(ERANGE);
+        }
+
+        if count > self.len() {
+            return Err(ERANGE);
+        }
+
+        // SAFETY: `start_ptr()` returns a valid pointer to a memory region of `count()` bytes,
+        // as guaranteed by the `CoherentAllocation` invariants. The check above ensures
+        // `offset + count <= len`.
+        let src_ptr = unsafe { alloc.start_ptr().add(offset) };
+
+        // Note: Use `write_raw` instead of `write_slice` because the allocation is coherent
+        // memory that hardware may modify (e.g., DMA); we cannot form a `&[u8]` slice over
+        // such volatile memory.
+        //
+        // SAFETY: `src_ptr` points into the allocation and is valid for `count` bytes (see above).
+        unsafe { self.write_raw(src_ptr, count) }
+    }
+
     /// Writes raw data to this user pointer from a kernel buffer partially.
     ///
     /// This is the same as [`Self::write_slice`] but considers the given `offset` into `data` and
-- 
2.53.0

