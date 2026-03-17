Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010031.outbound.protection.outlook.com [52.101.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA0E3A7F62
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 23:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773791678; cv=fail; b=nNTy14oP/qJ1YmQcV7azsYz+JX1dOLNu0xAJebgd2IJW2mKOADr/tIjG8MeBJZPEvAn3AiT6i4zQC04yEIkpdsasIddgKJuznaZJ0eev91O/MKVmkm/qamzT21/b7h8QTl+j+BnH3wM/zbvB1NUcf6VaHaKx//4qoGqa8yydqVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773791678; c=relaxed/simple;
	bh=rNwqcjNgl35HNKGhG2IYFiAK1HItLDyCnV2S/C107aM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u2vTPq/1iGa/M6Mw/scIU5yuMJ1CD52JSUD8cnzBAQAOkWK4lnVMnlGKs5mx69fXVaQ0uSq64tHF7WC2RUHi8583/fnwwg1d4ZDvQCr09x5fz0Ctg0t1/c8pTeEjfQdZpEkV4U3iL1XcZI0FQLBtpXGirBUzikQrudIW2XAT5Wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OL6ohQ+8; arc=fail smtp.client-ip=52.101.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OL6ohQ+8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4J9zNCB8RlRog9orEmPrciiIay4kokv/hTVQKNXbp96ihvmgpZ7ZXb9sEktyx3M+9m7mWfsDeWB/LJ4ghp3vpbrnZ7A0hfp4cpxJOkhuUNC+SQ6xWY2PQzCJIabk+xTFt4OLiv2a43ALdXa1okd4cNI2HHVc3cFzTHe9MLSdepT5w+dmDfNXupBZCYQtYU7yrP1lpeD3MnmgOKD4puuhyWi1I1JsDaGTDejzEP2kWBv6dMJq1L191U6O/Jis2tWBu1EeR+MgwHD5sP0MryqZKKFLibhs9yJGl+2Rn005OuiVINaulqNmMJsphItnhBeFStxTC/bT5nimVbsqAXJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqqhF+Zyf4M/XIWPMtddvnoZ+9s9qw9Z9wPX/orjNfw=;
 b=wEF4mIfqtOzytYD3GIODQmdKv90fzDftnzB9/wb2roGtWfus5t+Hij+aOoWJphkgtKKx8v8UIW9k+BaFjdIVXHpcD27ca5WEnIozRXLwLtkifrsjjr9QJIxyAp1c/6Z+E84GjmsBWOiQfKze5VDJFUXgbHQNUstx1sqrrp1vOKfdt/KZbqdbSh3VS4rYiknZFEK3u44b05yS19eaG52BD13m+nl4PpvIJcRORS7bHAux9lk5pUCKwiiLFDqDbr9J+GlkY4of1yPrhXh3Li/v+KrPRlUp1g5DBVQK0gVot/uOtpMG/NbAGALcwIrR6FdomInZPG+VXGm1uc5noxEAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqqhF+Zyf4M/XIWPMtddvnoZ+9s9qw9Z9wPX/orjNfw=;
 b=OL6ohQ+8p57FEXMt9ZjqQr5NIn6/+D/Kmh79iVd1EEun+4uQx7FfxiWrhdN5ugIKa8JOJslybkBeNSvcMuDtpQG9U7YCorU5C9DDP8+m81qZugALjNMub7l+lcSgMF3i+S8z6kcshgqQSi1+ujkrFAtVcFgHwCtLrIoZurInbRiGeHt91lNHc9VhkoJbVCoy/5nzQZ6Z/8G3dZ7rWzJzlglljtDHQM0ob/v5/vOXSvJRVv8Zch377T9teTeBNSILZj+oO+3Lbb5gFsi8MI7w57lkObW9/XwGXcBhdTCS1bUaMv4SpRqE5fcNqX5/5B7ZjGueuot3/mqn8DMrOZFtYg==
Received: from MN0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:208:52f::27)
 by LV8PR12MB9668.namprd12.prod.outlook.com (2603:10b6:408:295::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.13; Tue, 17 Mar
 2026 23:54:32 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::4d) by MN0PR03CA0020.outlook.office365.com
 (2603:10b6:208:52f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 23:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 23:54:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:14 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:13 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v10 2/6] rust: uaccess: add write_dma() for copying from DMA buffers to userspace
Date: Tue, 17 Mar 2026 18:53:59 -0500
Message-ID: <20260317235403.1094713-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317235403.1094713-1-ttabi@nvidia.com>
References: <20260317235403.1094713-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|LV8PR12MB9668:EE_
X-MS-Office365-Filtering-Correlation-Id: 6778a851-8d4a-4394-5470-08de848088fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|921020|22082099003|56012099003|7053199007|18002099003;
X-Microsoft-Antispam-Message-Info:
	Q6VM64oHopIsfOCqbQPQSOR6KDpfi53ZiHZTPAn2PtMt4I/1v29Dy2Rik7TbXd9QDkg/3PABHemNaTjl+B6nckE6quzovV0CmRZzdmWVkbcyf+dNEL8Fg0GxGiZGmVygRuHzPC08yUG39h1xkxHTVmxtHJPA8zeJrXk1ldbnM8e5V/FK1nvjyUJ+6ToGMB16+MjU7JDrahZfbKOSTwe2WxGLvRw18owlLWezJ3W8+ylo6H+u/MBl/oLBsJPVCmBzfrtik0xj4uc3f/12bUsNTeaasG4Tm5RpaG4mF6xrzAYt0kCCt0c6GQqiJoazNhhEeMZpvgfc6tL+HGz8iD1MBh9pCBjCgPuk4ny1Qiu6zTDRjl4FuEYxg9jYsMESCrExVKheZTgHQSpT5IVy264s2RWduZ7kmE1rN8642prRiS73qdYkfy8dCU5ErYXNwQVwy7vc1tSm9mmi2kunqd+Z7q0oNjOvSMmLzKOai/1zYbDibSCAUGDomFaOXGQpb5Sw2/il7vy9ij0yEAgkDvW25acEWnuJ5KT4XXUs/eIQU6ZJVbUKvH0hKdMoKlOdNYq3xzUjDifdNzWIf2bVyn7BmXhouHCuH97DwU9WGcMjyxKjWihjB/xsJ88wBsZW0OQxkF7Zv9dE363mhu8I8W3d6sJAunWbK7eHqN0BpmqsU4TY1DV8a1MSp2OV7JXhjsUZb3HdQd1CGmlQY9gaE8MvkrnL81oBpHa4eiH5Pb7g7o2hSTmWx4tWsiwXvVAGfy9EaLwnAKZKwvkWmc95TeioCzZmGGKn0QhAdvhQeK+7CNtr1HS+OirGvMHT+wQsX9Wn
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(921020)(22082099003)(56012099003)(7053199007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hMrQQuWc/4nfFzOGCoPY+u1hpCfDte8lnKmpU6sqQ9tuaExvDushoDnvOBoQQZKiN4gWjD1u2Qzy7FQCMkaJOTDre+s4B2D5JCeCycrI+Xd2CMyHY2fq53PMTtbLPkHCz51RXbHcy2Vg5TRi7ZXdMlFKJDiKKVLydIEP7gZo+qAYIlL3bCyWVahHQ7lyKCUFvUqpWnTyQQnK54SLZWbD5f0j/tHZ6dndc0ITwy80B0wDTkmPktpNkb/UQ00XVpVHCr4b4tS5+ORKu+zz/gPtkxlesp8WvZPtKWN0IsbrU38QDKeti/tDgTOTgRDEK0Dai5sudcdlA/C8iSqSzee3ybtFnpfEC5IJ6Gkd0ou6kBZ0q6MlMO3yArK3YQMQRS0RzNe15RznKWIfoaGB59T2TQ6xqfj9mnBY3oz+6c+F0feLFoXUxdDMCkdyBcJB/jVy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 23:54:32.0318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6778a851-8d4a-4394-5470-08de848088fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9668

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

