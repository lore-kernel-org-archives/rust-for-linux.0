Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013030.outbound.protection.outlook.com [40.107.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A9233689A
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 05:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773640691; cv=fail; b=SXGQtaGMb5wvb6J5L8ENJRt2rbpuQtnKr+Vn13g0HRIQz6JzhVQYgcAu9hvWUA54tbfmVlhD8iV7snhuo7VpnkXwTI1Mm7d74/w7xzCysXEuKP1QaU59tesF0ZQRNoZW/nW5gR2aFygBhlaRiThwwL96xHzJ6DBDDAygqZpKUU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773640691; c=relaxed/simple;
	bh=aKJt2FNYDhTNakjqzpL/dtWSLrCuZo+d6FWPUI1yAWY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Enn8fRWLD/Glszg5gxFJizDy0kUSQ9m+QW7seM36k9dSDwA/B2/eejDcJEcr4h7Q/j6+ciViRaYJl6Mlv8ny0WL8EnrD9/UmptTrk7KTz8xhPgq9fwUrLTL51GochR0TJVqcjeKRJR7+ywNBBq3eN3/uLM6A89/6G+W/5o12Le8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tjrUSUFB; arc=fail smtp.client-ip=40.107.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tjrUSUFB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECAGk6Bsm84eZwuXq8hHFF1YWn6hZPIBUXv7sAdCB7R6SEGDHli1/uojpqfLL0HL/7rfGm6AkPQ/xqfGZmOHtwKATIN0PT4uZj3fvzmoVVBlGzw14nzcco+KomEHuGdEusb3eHxaA8dvU2giDarYxfsYjx8Ief0RTzB0g21U7j/KX44FC9pyQ1j8Lzd82Lg1xVJ2BPhW8CcHE1sLIZzWc1+6723dThEmGjCkGGeLlZYkyhbQFSW1CovR7vHUHM3DfndWB/UgYOPWnv3ZZmR1RV1K7msg9gj/aICbE1BctTxA7cQblr2801upYHJqFTrf/1g9qtRl6L+uVczmkWVIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVAKw0YQ1CLceS2ZgRQGaXT1dfqNu5sFqnQ+RZGSvnU=;
 b=maG7WQLkUNDVX2/4RL7ky27tftateeQSPLkJF7eZJrqb4q5cPR/zTEtEt9eCmfoz2+M8PBI3EU1Y9n3M1OiNNnIBGE04xbPcrrtwnRlriP3BB3QyCDDuzyhKBUiw29EypzPvEASpghfBBb631jlbPNXU56++uq2g2Fb0c88E8xgVtxR06m0TBM47niS4MbbQvQOkYAcRdfcjcPLf8CulQIkezMVpE62fRRoBkq+eLKieSd1DsNUBq7pg2hrUgrKu/3iCwgFryTHnQSebSiEABV7/tJWkBoRRXujIu5VVBdWOXdwpp6zYFT7AZTxkhM+6VVR8juVcm/qzweJWizlm5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVAKw0YQ1CLceS2ZgRQGaXT1dfqNu5sFqnQ+RZGSvnU=;
 b=tjrUSUFB1UpZns5LAThpTV33VJ0NptJMEfcD82WDnR6oqmVhoU1QkhHTegZq2Ii6ZMAQkocERKu4J0j+BflyKOkESZyTlnfPdo+udPU2PZvAl1SL+cNBY3Hy7YOLvU60+eDf6l+2MJ8Lo/0uaTO74/mbx809OKthMjUtjWxB+T6en4CZokFY+6wIizm+W6RdDdcdPsgLEwgL0UOUSVnq5xQhMW+aOIHmqtuxBQch4IhwqwCXeuB4s922u61N0Tnen5ylh0cr88RsKO9Kj0h4m8F3kLPBahvAC+5psf6nHkjYXdvuH8qttITKyIbOpf6PfKtNLOmrF8ZkV7uW2NZHNw==
Received: from MN2PR01CA0033.prod.exchangelabs.com (2603:10b6:208:10c::46) by
 DM6PR12MB4452.namprd12.prod.outlook.com (2603:10b6:5:2a4::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Mon, 16 Mar 2026 05:58:05 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:10c:cafe::5c) by MN2PR01CA0033.outlook.office365.com
 (2603:10b6:208:10c::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 05:58:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 05:58:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:51 -0700
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:49 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v9 2/6] rust: uaccess: add write_dma() for copying from DMA buffers to userspace
Date: Mon, 16 Mar 2026 00:57:32 -0500
Message-ID: <20260316055736.1690546-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260316055736.1690546-1-ttabi@nvidia.com>
References: <20260316055736.1690546-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|DM6PR12MB4452:EE_
X-MS-Office365-Filtering-Correlation-Id: 25bd2ef3-0286-48af-d24f-08de8320fd65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kLSeVbx424V8UwWK6FBI3T6LiuBoSLu9oPH6w0Uv1lL2YJ9oUiwu0qefvkwDniJhZkk3Y9jXhWWdc7QfSixkBwDbHV8222tAZ1Jf49//5t42JzXC8IxbJXlPspeWT7W/pQt1/E3dPOBcS/MGenQ3xqwL560W6biBSxDslCQoIr2etLvsvRVNh8wPKlIL3W1N5fBh+6o3MC42GuF+FPXu/T22GBfyJN/kmGXHL8ISFw2gbeJbXgNB56zWjO6PRucCmNQ8fUZpxEdzqM29FPJvmIyzuB7QWqcZMaIzD3h/5pG8tmxLcx8mECvDVOF6f3IpP/vzz+hqy1SSWcxiaScfZOoP+7OzVWI3TSSrPAqt0BdwhIw4COVw847czxqxSQTzlVkfXPGcIIwewXJAsX9QN3RaIs14hFK7t/Z1roPm1TLVkG8SQbIyZjXWbAcm5zNLilw6j6J1xqnFvhFLyO/YaAenM3FkEHdZvpk46AhnMb/rYZskZ1T4YV8Xe/F/YgH5Z4Qz+0/a1TeOlRZt27EGaIwP3kZ71t3Mo3lknOX50fDx2RiqWfjyN9Y1gFmHh6mvZ23vAgmut8BLYI5LxvvS4hSFLZ1dAKcCAkPQdk4iEF5jgz87VqbK3fMcbqKCmlf/rA5x+IGoPwJlsJFp3mc3NelQVaW3i5BcFQZOt71Eiy9ui+PPCVvDp6kZ95x6sVhxXhZv9vzWpHMfeK/0t9A1swjt7e+DDwRYIym0o6aX9PPb5w8OBD5kk92iWghJMCH486pMBn1PsIxMOHStwJhaXaVnTy8eYO/oiJetvlHtLu36jm1THN479NDafKFmQi4i
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oOTrkuq49rETaTZ6blQPiNv1CJ4BdRGc6MBCNXiS0kjTRz/sY0hfKjarHniq63DaGa/M6I7TaKnmTE49xY2dfkzS84pe+yoPHfMYrMe+llJAePYa9A2Ri2+7oii8b/SSUx3ZhYtWsH5eBLnWK0+fifHShbpHwumecXo+a/i3ziQcs6thbMpWd/+lHMM/FumMTTAw39/DNMWQbnL1Oy+XHTuJXT0+z9SDEWKph9kQ/eUbWkdTF0yzYaWExgduceDAji2I3HPWK+zm7oVIpvI7eLClGZjH61i3HabVeVJxgmjC4EXcqxSa4HNolH7Kzscl31D7GzEyaeY0mMGRLsAdL0lE/NrMzZOlmdr3ZNBPinzsaSjclVHf2iF6PaFrrjrfpqAG5feI+/Z0HTzr5thDoSzhGcB6DBZEJ0mg2kDbdkeYjTmGjeTP4pHcm9Ih/XwM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:58:04.4839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25bd2ef3-0286-48af-d24f-08de8320fd65
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4452

Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u8>
to userspace. This provides a safe interface for copying DMA buffer
contents to userspace without requiring callers to work with raw pointers.

Because write_dma() and write_slice() have common code, factor that code
out into a helper function, write_raw().

The method handles bounds checking and offset calculation internally,
wrapping the unsafe copy_to_user() call.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/uaccess.rs | 84 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index f989539a31b4..6be7392ca9f7 100644
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
@@ -459,20 +460,24 @@ pub fn is_empty(&self) -> bool {
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
+    /// valid for reads of `len` bytes).
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
+        let res =
+            unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(), len) };
         if res != 0 {
             return Err(EFAULT);
         }
@@ -481,6 +486,65 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
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
+    ///
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
2.51.0

