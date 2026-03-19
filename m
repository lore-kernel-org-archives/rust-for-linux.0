Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011011.outbound.protection.outlook.com [40.93.194.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E428B3FB7E3
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 21:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773955654; cv=fail; b=mTH0I4by6XgK+/FTMLVVOmH+O6KYW1gcTIBbgAM0hfmaqTBwhV/y/savRvHSP0HFJ8AiX1srGyXTTSm5H53kJDEEP5oZWAINY32QVafS74phsP90oZPscYq6rt85xz4F+ucn4XBHfg/YGP0aR9B72Ouh7zmjNWCRDKbIA5jUEE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773955654; c=relaxed/simple;
	bh=rNwqcjNgl35HNKGhG2IYFiAK1HItLDyCnV2S/C107aM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VBhfwzeO9EoGCKsMNwyasJCzRGFdFBD+IJt+8zmVENNWHwbui57zORa5yaoq3fOgc/EHSXOsUeSVjjyvKXo9yb/yWg1GqJyoOyI+cf7J7fIR4symc5GvmvRJvy1VJi2ewmF5aD58MNTSQlMAQXmTzAI4gFSj3hr/PmJ2UUiDkG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cT4usCdr; arc=fail smtp.client-ip=40.93.194.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cT4usCdr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeeCZBydR6tIUGil9xO0UGNovJEY9gKxleXmAU1qYcl6rUxpa6WdBDygB554aNOzd/BEPdiYzCx9BIRK7mIrrSGvkVK2pMkAitVJNceVuKB6VFR5Qqy6kyO5/6hyZuGmfCDSJCyHFeb/d6uDASo8Sns+daNDXA96a45ohxvljl7tUBJ6pSmD9/iFRBZON1tmQ0hhlroTLMJ6rbXxunedBR2+8deWHndkT5qjU076dW7SjfN5X6DVrIdCcWie2laHYAXgldAQZdkjbmfNV8OYIgM323Hbo4nvsELLCdFFx5UA5IpJQ/MQ8mZtbOFjytEJ4B5c7JzQhdFbJN1zwOBkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqqhF+Zyf4M/XIWPMtddvnoZ+9s9qw9Z9wPX/orjNfw=;
 b=Ze+q5JFT4Wu3W6gSpFYAjIQLB7aCxzyTZjAVN+KG8LN1hEhc6ya+8nVFIoK/k4Gk4vJLnK6IxqT6UYZSq1/rYpw5GqnnfsbTk18qZEmlSwN9UjrnD4Uf8EO2k13U65mQvx532KFAk/T2g5+QMsuy56kXTS4tNlU3ECYAdP/OErPCJhl+D8X1GreFjZ4R0DIHJ/bNOuqIQrva86FbxRcPhfyq/jTfHel5pj4701e10/zTmaXpoMD5MH9ZwfVxtfkkN3D2UIANn/aeZ0NeFts2KlqberntHJczMiVa8w3OnamjqJ11eZ05b2DigHAWOuXEUyXE/AlxDo1K+U4cBs9aBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqqhF+Zyf4M/XIWPMtddvnoZ+9s9qw9Z9wPX/orjNfw=;
 b=cT4usCdrfOwvh8KV17GUNevrpfA2y1/IG/qgxa0+tPfrcz3/S3xuJ0t3liWHOnr+wpzsWAMvdxFfuBo6Pvmlb9JRicJgZaiL+S47DPA2ZJMqjJnaoxA88SoJUhsGA/9xFQNWIP/u9tRyegh5aD3reUTSsMF+aGuKDaQqTekxeJmrOUChmfvteRlsq0C4YINxaQISm9eCra8NH8L3KJgUyMnGiQ9o9fAqbwWgUp96ZeK6GVra9kFqimTXwzN4Df/l4ntSWo45zgW6v3SysWlHtxXVPruN5rtzI15zJd+Lntidm1h/Gfqmkgxu+KCz7uWixVTIQcjtDJSmbgLh2YWF1Q==
Received: from SA1PR04CA0011.namprd04.prod.outlook.com (2603:10b6:806:2ce::18)
 by DS7PR12MB6071.namprd12.prod.outlook.com (2603:10b6:8:9d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 21:27:27 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::10) by SA1PR04CA0011.outlook.office365.com
 (2603:10b6:806:2ce::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.29 via Frontend Transport; Thu,
 19 Mar 2026 21:27:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 21:27:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:10 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:09 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v11 2/6] rust: uaccess: add write_dma() for copying from DMA buffers to userspace
Date: Thu, 19 Mar 2026 16:26:54 -0500
Message-ID: <20260319212658.2541610-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319212658.2541610-1-ttabi@nvidia.com>
References: <20260319212658.2541610-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|DS7PR12MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: b094a7c1-7bf1-4dd3-23fa-08de85fe51b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|921020|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	XUB/+T2GXFUrf9DliR7GOJLY/bLBBfsLPMgMstfVqgLicHkeu1+tEzkmZGGb31kzCc9CUjkfi5Qkq1AX/s+2RMemGKdn+vAjXrhCyZK8loURbRvFygkgif4mL0Ybyz6/SnoFUUlUhfuXsDfJxLJOWMmXA38+QMCdSRDmiS8Qi1J7w0w+Mw0LCRuuiqUT4JR07+9HbZBInlz2gspHnL29C0ZeWrLSrdSkmIjjbtiJ1lLzWnFu3+Y6DjdCVFoD3BdlBiD6S5gP+n2K6OfXLvaP6bSnFf2F5gmZBlxtjVFtrxMYK5IZRTllI2Mcd502qIYoOlvFhnP//fDvbzAz14V1wC/zpiqKgp0Ejpe3uMYapYF2I9vV7GcyTiPTd2MRG8iexB1HbKkA6fPCblwXcs++6ZOKHVgAvjXZk8a+QKpkJVKXuDVx3gp7Enkt5FsF1N4hSKl999XuU071eWt2H/1FTFRkuawmX+VT/sfAoBxxFYjPCqnneRbhJdS7KspwKM1+j9huOnAxHGAdhuCG5zbTHkTjtZa7YVMGISf1OhuyiLatV1gxbXkaeY6OXGl604WptRrZj9Lq1ZAY69grFN8iypHobqEGBhjU/jBml56MCg49mjjt4gPJiigswuXC4YxoRl8li5snf942sTWS7jvQ8Mjf0OFuZ8NgkERRJBnwqj/G3seybthpSgEdOTiE+htHfPwtOeWaBCaPwEbkXgFCCq3oC1QpryGglMsVoof/+fsDpH/e3CE4ULe6FMvwYQYIv4prTCKi54VTT17e4waAqC/NyiaQYyhhy9fhqHFf+XDn+SRfPvUdPIawELVlYllC
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(921020)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	On8jkjSqxfL82olJCd0WyY/YCVnJ9gL/9Tzm92C+sryXbDS3SL/WgSAbwQrS+kTfut1efhG/meuDxvY2+bvaG64TYY5rEAoYvbad8KSa69qG86UpptjGoAa0isc0GcqMbj6QgB3cB7Uq7Yhh/tQj8eJ8DrRjuFy35j9ZQjlHYFc3Y+H3MhuAi/oMvtOuVe0vDSqlAShTeVgGyybo9N1Oc8kAAKMQ6l/4+023NI4q4Eyov7brItp9tVkxsQUFajpAIw4NLMa2qYOr7JLWgoGDXoyhtRPb2NzVks6FlwGyR7pOlhEJXDYH3JH4dC/gKRJttSaDutNLdZmxq5RyOOzHOymgoHvzpRxL/9qDHk/sqdJ2slrIS18tWKjgY9U1wgvwwij6mZXMnUlffDS1LaSkfxxy2kaSJLgtS18nXPSXfn3I7MP8tyM+sgQI3MHAsl9n
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 21:27:27.1341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b094a7c1-7bf1-4dd3-23fa-08de85fe51b9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6071

Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u8>
to userspace. This provides a safe interface for copying DMA buffer
contents to userspace without requiring callers to work with raw pointers.

Because write_dma() and write_slice() have common code, factor that code
out into a helper function, write_raw().

The method handles bounds checking and offset calculation internally,
wrapping the unsafe copy_to_user() call.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: John Hubbard <jhubbard@nvidia.com>
Tested-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/uaccess.rs | 92 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 82 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index f989539a31b4..c9004167c08d 100644
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
@@ -459,20 +460,20 @@ pub fn is_empty(&self) -> bool {
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
+    /// The caller must ensure that `from` is valid for reads of `len` bytes.
+    unsafe fn write_raw(&mut self, from: *const u8, len: usize) -> Result {
         if len > self.length {
             return Err(EFAULT);
         }
-        // SAFETY: `data_ptr` points into an immutable slice of length `len`, so we may read
-        // that many bytes from it.
-        let res = unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), data_ptr, len) };
+
+        // SAFETY: Caller guarantees `from` is valid for `len` bytes (see this function's
+        // safety contract).
+        let res =
+            unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), from.cast::<c_void>(), len) };
         if res != 0 {
             return Err(EFAULT);
         }
@@ -481,6 +482,77 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
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
+    /// Copies `count` bytes from `alloc` starting from `offset` into this userspace slice.
+    ///
+    /// # Errors
+    ///
+    /// - [`EOVERFLOW`]: `offset + count` overflows.
+    /// - [`ERANGE`]: `offset + count` exceeds the size of `alloc`, or `count` exceeds the
+    ///   size of the user-space buffer.
+    /// - [`EFAULT`]: the write hits a bad address or goes out of bounds of this
+    ///   [`UserSliceWriter`].
+    ///
+    /// This call may modify the associated userspace slice even if it returns an error.
+    ///
+    /// Note: The memory may be concurrently modified by hardware (e.g., DMA). In such cases,
+    /// the copied data may be inconsistent, but this does not cause undefined behavior.
+    ///
+    /// # Example
+    ///
+    /// Copy the first 256 bytes of a DMA coherent allocation into a userspace buffer:
+    ///
+    /// ```no_run
+    /// use kernel::uaccess::UserSliceWriter;
+    /// use kernel::dma::CoherentAllocation;
+    ///
+    /// fn copy_dma_to_user(
+    ///     mut writer: UserSliceWriter,
+    ///     alloc: &CoherentAllocation<u8>,
+    /// ) -> Result {
+    ///     writer.write_dma(alloc, 0, 256)
+    /// }
+    /// ```
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

