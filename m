Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010009.outbound.protection.outlook.com [52.101.46.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0845B3A8722
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 23:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773791678; cv=fail; b=qFF6ccvXcyZw5SM+MIQXOuPXEXSlzz29D+36ueuePiwni3ol7wxGNqG9Zxu/KJWCFy6NadfHGfK29Kd/c1en9eh3iQIpw1AqFPmsk0yZNNAhl79c02wcLE1G6WftBHHGRi7DcjhwVUEsCoPy/QQMh/45depH7C8PhHoG0NvWVpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773791678; c=relaxed/simple;
	bh=sjIfGtY+NBNy492SqtXJBjEDxJeYgIZ8B8lrpPenLMI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u+RX0lranRItYmbdcUAzX3WReuPaZCOjeu8rTjq5CnDbO2u7DMelK/TJ6TZPnM+m4Bx5CaXZRMCfymVzHA9GWT9Qx+wR93G7NhfdhfoZplwXJAzD2aP9MvF1EVQnN4XBWON8NztOPd/jOGAvu6tcJFvnQhgWsRDT/bKxHqk8pXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ib92vuZO; arc=fail smtp.client-ip=52.101.46.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ib92vuZO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLxxbXEDqxEdx6fY+TNDvpzE9/kMBu/kxHnaVT693gMsDKgf3yKrud0VpAHrgf+FSl61D/pJI/iBTTHXqMF93+3RXKKitIICeCV1K/td5o2G0z8U0EC4qosOkTUwVmhTKQ9XNwtciY/+U4dhumwBcIy7ne++21EFkLuHrbhWbpEXtQwIKNRGG+RcAFOnCqn0gtCm/SDfMoJ455/lSdvGVIok7lWvtMvf4vL9N/jv/zt0F6Oapt/NXUWwb8znOz2SfCg1NEsFZAvNIMtZLZdCP6nL8LRZUkghmgtEKnEjWlDj20H4TIJwEt1ki5e0i/mw+L0x/LRBMl20k967hLwrVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrjcR1GoYY2U8a1idUsVBnU4sKNkduVp3MeKunaZ4P8=;
 b=f2JkHKqDCVzCmEW2Br/4KWn8QTkUnua2vEI+60CCt+fgWhjZ+R5muKjX7PonkkZn4iW4O6m68ldSWrpUXMcrlkJ7nQYv949at0ls/8M9xn9Ss6so6y9WkyMYl+9zpFWp+CZSibCjWLTh23RcrksdklOIp3J8Y+mjDtNB/gaQ3pKlAMxg5Inky7GdnC7egxlQgGgzAwNe/baB7taF6GUGS1sX/1OObhoHDRCPK/NUXIbuIS7qfDa92cUXGwvzcIRCimUAhg7wonG6xWcqMyXaTc3gNBo3zE7ap/Oo/mHEZMfiI6l8zMPUVgzj63y5qXPf4F9ofKAWWrBDbbIChyZjtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrjcR1GoYY2U8a1idUsVBnU4sKNkduVp3MeKunaZ4P8=;
 b=Ib92vuZOw5D0MuezKuGzbXqo/cSW9iU0+vavtJ1KrBxttxv6vJL28ZPaGgu+BP3MwOt9CrWfbmnknXngevsCts0RHvFSfczeRzcybRJ4Ffa6TkSd0Uo/1iM+bnDGVM8CBKheES2P1Moc5qytE+KDi/EHx0wEtxSSv4EoghRP3fonpqGLzWBM9xt5IjGLJKvQGv47kcbWyBwrfoRUOM8P0HH+vurh/7aWcSO4x6ShtGmMWQT14fDzxgWQy63tqhl5ro/z84QItvfJhjW7zxoIFPw0CIHOnetmTSpQwTi8GHCqXP4YyaI8fzzAsb63p5Qm/YkvMTbciOGhNtxEuVt/yQ==
Received: from MN0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:208:52f::15)
 by CY8PR12MB8339.namprd12.prod.outlook.com (2603:10b6:930:7e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 23:54:33 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::b8) by MN0PR03CA0008.outlook.office365.com
 (2603:10b6:208:52f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 23:54:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 23:54:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:15 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:14 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v10 3/6] rust: dma: implement BinaryWriter for CoherentAllocation<u8>
Date: Tue, 17 Mar 2026 18:54:00 -0500
Message-ID: <20260317235403.1094713-4-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|CY8PR12MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: a06a9dda-2b91-4ec6-3e8c-08de848089c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|18002099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	DP5T1L4aq+jupYSwO8tw511u/bhg2V5y5tmock+r1kUgJySqimygFZ8qWfa8Ky9PTV33xwmM1D/nBT5rLOtrcMNmv1yGzGbvP7SQfcMcv2LYqQqqItTqWPK//C3n4LxHNCrg3HDgMnxt8qMbtKKC0W4BlDk86uiFjLZvS+TDL/3E+fhJG+pEcjxCjClUPl5hLEhYz1DsSdbbgaREsNmlWTYVznLyw6Y1Lwwy/PPWhllGTbDJF9+OnC0j8bbwOUs5fO5FXEFdcwcL6r5O1g/0QX7r9rNUwn8m6TqFFOvhB0I7hli74UtNkjxDyL7LKBZfupGAjdFH6NauEhhAk6vOFRTP0dJ4lledvnjVmf2dQYrX1PsrOUoisXWnrDpeu74fwVDRw70tcZLznzZ85tQrdw66ElqL8imhxNlAlVkQQCq2/RIv1JSXMn7S2QiesWLzcBhhJpa5LX/iGI9ON4Y1HdKx49zpLsLlwheq3MqbiScrMPCrOj0DZul/MGcYTa3Jc02dTHjVVUiJLL6UbPaG92go+JTi4YEHrlcRLnK7nyArfPu0fliL6vfkEeb+CsOi1yES2zqE466fv9T175W41rNiU50fuYb3rsxzvwsG0OLGKPqdZ/gV2+7K58UK+NLueHfsp+zwP0ro/4XvqE014MmWaDt9in/MqvGhUyxvyuaHfdCVXEltmmZX1eLCEypQwTFpvgHThSC97HzZCXWNTpeKfesEHn5l74WmZPQ86P6j0lWVgC1EtMi5mN+yMpq0NmgbeHMuWWcwruy/GPj7I0t7t/YFsdXtcfN8hE42fpnosQ/b54/We6KiGELHV+Iu
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(18002099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cPdI/SUT6sgRF4Y3BXxAICz2mk0sBRjL8Yqp+FGpn8xPIb1s38rxatBYcPzc2U1PEvoPsVIEXS481F0AoQ4o7K6ipkP4F/1p4POtkUZltMrXg2cPjdW8FjZhIl2CA8UdGSCnd1F0DsuKl6ONNzizZciipjBd6Z/l1WydpjfMSg01Hkus3W6EMA4flYrbHoe2ehtHhJz37kcMMurr4mhzRj+jGYZIkqdGBUotgsHIUPC8maeUzvsu4/1wl8C9ihgGLSRoFQpKDdH8FqgowFnfLLvotSvxQxsbPdOkAbThpdt/YviCtStUlA0xFWFvqBJbbJVh/FUb+WK68gpl8L8+5jT8/grufpG1/WLWfRqFKfNo4iFVi6uxgcwb7/bjt2NLrJT/U2Bfu/GjW/TuovH6x56udGfV2eV6Pobd5SxuD6Ri2DJTsklXfSBSQRZA5O7f
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 23:54:33.3734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a06a9dda-2b91-4ec6-3e8c-08de848089c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8339

Implement the BinaryWriter trait for CoherentAllocation<u8>, enabling
DMA coherent allocations to be exposed as readable binary files.
The implementation handles offset tracking and bounds checking, copying
data from the coherent allocation to userspace via write_dma().

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: John Hubbard <jhubbard@nvidia.com>
Tested-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/dma.rs | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index a396f8435739..453fc547a0fc 100644
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
 
@@ -664,6 +666,37 @@ fn drop(&mut self) {
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
+        // If the offset is too large for a usize (e.g. on 32-bit platforms),
+        // then consider that as past EOF and just return 0 bytes.
+        let Ok(offset_val) = usize::try_from(*offset) else {
+            return Ok(0);
+        };
+
+        let count = self.size().saturating_sub(offset_val).min(writer.len());
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
 /// The syntax is of the form `kernel::dma_read!(dma, proj)` where `dma` is an expression evaluating
-- 
2.53.0

