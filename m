Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175FF402459
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 21:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773955657; cv=fail; b=qYHp49t3A8FPP3Is3t6IdVuXgU4Teb6w1FHcrOzJw0yZLdVlXO9vN7pk9E+UD8AkXKgMtllNmoFR0ym2pEeMEUB6r1rpBWAsG+MX4r+2Z28JARKSJ73IMABC5pGFKr++hWr5EjomCFa+dkJh7DYeyQqGoKFzaSG3WHe8BQuLq6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773955657; c=relaxed/simple;
	bh=sjIfGtY+NBNy492SqtXJBjEDxJeYgIZ8B8lrpPenLMI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h/ghkfiq6pPhPdELTbuou8mdrHoBJzp57ZoW/ukzypBAA/3nwPYeZZyqjNocQPEBIH4MtCJebWWivYNy/ltwsulEucgnTqC4Q0ZPMnL36upGV6Rb4asdkwfuFW9LfZN7N6NLBBpi1Nl/rJnpFs1APTHUmrLiCWNvvMNxMYxmG6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dzbnM4Pb; arc=fail smtp.client-ip=52.101.62.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dzbnM4Pb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMBh+TzedQBDpGwSNdfTRoiLWe/VAFL5nAO2ox9TMSyWRaqVdYjFPSgyNRsDS9wVwLoqEJ2SeItC6o8J2hdgihvc3jwXX0ELJQqXoQ0Ke3yDjw4KLjSTs3aATQWaxdpms0VIBR+68sxbMotm1f/zzCAt1XjqGVqZbScbCnhtwcDynjQTaiRNq4k2BK2aPN8iPQwr7FOoIE4T+84XSqYcTzSzAxo6lxBL1y687vlRVnk+WBneNcGX5qKwRqV2ZOrMcZ2YARSaUgw7yDUww/W7AbmDfqn51SzAeCg2/42dzW9V3XL18sWuRvrlRegEwM7UWcKWb2d5G9RS2LBEGCmhbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrjcR1GoYY2U8a1idUsVBnU4sKNkduVp3MeKunaZ4P8=;
 b=Kx1Bp1PAnAeBu3yX16m6Pk+oNCwqi/0g+7hPh8u7Z+IrDm23erxEWQfsd0uZvCCQY8SK77x0KZd0oJUf4nNPo0tYvLekqdA4wck6ylTnoQJMPwxN2JF+sFm+Vy92KZHQijcGecK7QKlAJq24uILZ41yG9v2t8L9hqSjFr/uYE24dmzBmE5LWNss3ohXx77x2CkjmRGFPLUahjt2c4j9um8I2NaC03HhtrpF7dzem+hhwxeptK/BbPrmWeBF8sj5GR1UDX9CPDLg91rwqpiRrtOuBWJaIoUc8bj3GpeDPxZ2dMfl9guOLYJWmZiCSn+aXn9JVY9Z7tJe6ucy48q68QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrjcR1GoYY2U8a1idUsVBnU4sKNkduVp3MeKunaZ4P8=;
 b=dzbnM4Pbk3b+r4KDC5L+1FioVTpkTGNzoW2TOeu9eBTSfY1yFo2rFg1VzzzcXYqK85sB4st419ufaVANkTqzXvOdi0D0Reitm/VeEphp0+gYIUxAGELWZXhZTLvUtXKQItMLnfkfeokGYih1UkGqQDghUZ9D0brwqLMCXkuCKYw1q4FPqeqxK/2Z8oXaW27PXSaJ2Odxh6YpOQmo1Uih7iJzcA6GXQYA13yoBOhMBJTcMtEtIrIi+zcM9JqUSEfX9yJrfgPQrgNEIVlMHzwRXHUx11IvSrR9havgTkms47AoA13nH+K5w/lKkwCXud/WywAUQoUe5ksP1mBQaPf18w==
Received: from SA1PR04CA0005.namprd04.prod.outlook.com (2603:10b6:806:2ce::14)
 by DS0PR12MB9423.namprd12.prod.outlook.com (2603:10b6:8:192::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 21:27:30 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::a8) by SA1PR04CA0005.outlook.office365.com
 (2603:10b6:806:2ce::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 21:27:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 21:27:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:12 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:10 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v11 3/6] rust: dma: implement BinaryWriter for CoherentAllocation<u8>
Date: Thu, 19 Mar 2026 16:26:55 -0500
Message-ID: <20260319212658.2541610-4-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|DS0PR12MB9423:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a23cc1-eacf-4bff-2a1e-08de85fe5375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	awRFUA/Y4CGtMSpMVUCS6vlauC3tfm/+Wilg9TegndnZtG6Hp3VPQivykFBvJ6+7tyxJw7F59d14kl5mG4StKuLzSrHH+PpgmBf/6vMhahptMcLhNUkDTutI9zngUuaacl22g82JuVxWtkWC9B10QXNmRVlaIRLKbNXFeuPVQ5wM5/wpG5XRIM6LJKK/cVGfkCVJH0GaWS1r2DIcoSGhM6n+O9xjlKLu/aYfcsXwA9LV33xbhSUnjhbK3cvfUpMt/O18w2MzmwFWL1fBNcX8AN3AdaW0wtcyftI7ZZJ8Y8UD9zTtEFwTZFSK6TzYaYQpDkMN+BV95weHxCtCVOAvCNgOC1yE9SwbivfLTdIbW7kAeFTgKz6+bKRD7BNmyemw8OhgpQcm2XRgzoFPvznI5rMao7GEgSRE1pomhX+DjT0gwHxDdNVd4aCiNZIegNsv8d6j/5DeFOrog6hfI9j6KkGC35w/ylcizzZKiDmt7FB18mbEVCGYVVubGGGn66eC4zjKZ+VjaF5jf9Y9czJBWq+lMStM1DEs0FtCxbubKHCh2bW0kvPwyjtaWCOtZJ8OR7WAcfC7d/+yi77Xx/LynWNvnWu86syUcYAE3sEQl2HDxzzTr+IOc6kQQme4OT0RRo3t9zUQ6sol/rwlsT+e+dTfoh9fcJMnsDjiigNeUlRmLRAePP6kQwL4FAO/TCvonO3l4chaA7KgrBDsZLR0lBS0KJQnT2TYTM+uVmoE4q1iQzCHyv1XWRMeWGmZf+UdCRQpxAUoCQmn+lqBEBqL2WCdd5Z7IuP5NkhohwleCGnflNHaO7jFILgiMV/SXVoL
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LprQLdmGmWn1kzpl6dsh3tf0ggtxyX5wKBiXVEcfbh1Tloauc+sHfGBvlljZOCtXVYEWlzWKdMhP7/ROuczV87w1A2nFuHhh63K1BoDbNger6THH120MBEqLdBmc/qcMgA2A8cP9xQr100l1tUL8nneOS6pW77Qq1OOIgZiN8Pj1IAaPwKNlcf6ShpjsDgWZur/opvh1hxMAflGcaROFK7RibGElfvCEsgcjTZm8rjItrpfgCHS6dUykbqXkwP6f+cdWOvdxDuysdlx6UkE3yWi9R6y2V+n7stGFFi0lnVAgn+cbJpOhSBAGTkR1IoR2/NpMLRh3bUpa5iTI3Fl7zjhhbROJvzp9W61te2nkUOdkGn8dh1Az/c9lge1A1GdxPYKuT58NgahXSLGZdrCvW0dN978irpbIfZAm5ARdumyUy5idGpnLsNM+v/xBhiEJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 21:27:29.9989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a23cc1-eacf-4bff-2a1e-08de85fe5375
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9423

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

