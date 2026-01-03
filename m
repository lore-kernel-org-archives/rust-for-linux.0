Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010017.outbound.protection.outlook.com [40.93.198.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A226265CA8
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 05:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767416414; cv=fail; b=XI/Zm3JrGjlvNGxqY45kl8Rd1J96rQ3n6G+oI7xtnSjZcJkrbrM68kxiFUW+ujByjK2J5n5UzPvKQhVmdJhyk06LrtO6+ByGnH7ZenwzAy/lZHjq8hdkIJUwEvZPOE3LgnVOGvlYA831wuPTesMLziHSoed9m8SGGx6vzJzRbe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767416414; c=relaxed/simple;
	bh=SLMyApbYsMP9cuWE6cJcpT873Gw9siK59PnGBL89Ugc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4QVJwypE1T0tKInrR7cXVSPc7swPDAzPzeHouixwSyAK45G2y/JqVKhBzjnOuaaav51HCBMUAb+jXZHkMLP3kZK3c86Vmv5TKuJ/gmjhcQ8ciyZUGyeX0SJ9l5+6JmZ/xDiJdhQ73HCa6xlTXVZhgs+y4DHiW0hmofnE7vdfvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qOHtZy58; arc=fail smtp.client-ip=40.93.198.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qOHtZy58"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjxZbhblpOusRE+yKqsny3PpcWu1w82VET+/uAn3eHhcYUmRTkHh6mzOgjIKkUnQrpPGaAvp04WVJaCUqRXHoP/Rmo/SLHqohsmlXkFbjuNVfbbrowRPCg85DKIouMNgnFrnhqfYcPUfOrFX574/egqT51cS849fw2ZzCtDlpGQ6erGGmFCkADaZ2HQUG7PV599tkVpPvrg9Gj11EZ0gMsWis9iNRKNx0wqQMV7yh4Ltair2JgzxcAB18toQcT0JBuwXC7nccH0M0H+irwlY/rX0R0HSFPe0WmT3TizEQBF3egBrnMyhIiyBYdDEvl0jFAug6oyU6WPP+UUDprXkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voqCUq/7sUhZ7iccnBINe+VE4AwQvQYI8s29C0jgzQc=;
 b=NqQrJcLf2zyfDiEPPWp2Y3hxTDQzoQ+Ilo0hOY9cjkYCNNfDmQYynfILheBbObAnjUOI84id3j5fCNITJC7Nmb8c+BFJ22qCpRz26OO/4w5Apn0YAesjcF5qeG5sGkywB/j8ohVEqoEKdk7/42hOPTptXAt517QXg5a4TrNiyQ8ZjhvqQ0jSzKVnyQeixbUzsboD9hoK8FVmk1CaNCeueI+7+E3216E8TgmwchEp14/q1QD2O2TFiC4eKgOyQVhzjBYa9G6/npWx5Qr3Krv5vtmbC90XVV5H0qhuenyf8zIgLddhTrmzNu+pAHrhuvK8OcXq6aFyoOFnMDEJwH9yUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voqCUq/7sUhZ7iccnBINe+VE4AwQvQYI8s29C0jgzQc=;
 b=qOHtZy58nKdXHeP91OmesSquoM+8X9NFY1FzKRkpYSbBfNwuI77jNPCJTQOe6Zg99XCjx8im/AbisN5OtaJiMSrRJfR+eqlsF9gYw64gEjxrFNvVM027hrSb7CwXjJbrDYRgftKbbvF0JaPb60WXAkCyZ7k2VWdflEIxYbCQCXdmJqr4w03JZ8B5QMVm3xeixh3txXVWfjFKWhsXdGqwH+ke+lfxny1lqwwhMYEx9bMrvc6CL03/W6I9omFp7iHtDV4RO1NEbICXpxCJn3yAP6eyOCZCCAnmWrGT98VdOhpCFvb4VumdtDu0+RMtD6XNZiXG7lZ+XlIc0uGiL7fSfg==
Received: from SA0PR11CA0102.namprd11.prod.outlook.com (2603:10b6:806:d1::17)
 by SJ2PR12MB8717.namprd12.prod.outlook.com (2603:10b6:a03:53d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 05:00:08 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:d1:cafe::61) by SA0PR11CA0102.outlook.office365.com
 (2603:10b6:806:d1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sat, 3
 Jan 2026 04:59:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sat, 3 Jan 2026 05:00:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:55 -0800
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:54 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 10/11] gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
Date: Fri, 2 Jan 2026 22:59:33 -0600
Message-ID: <20260103045934.64521-11-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260103045934.64521-1-ttabi@nvidia.com>
References: <20260103045934.64521-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|SJ2PR12MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b1dc0d-9ff1-42b3-8254-08de4a84f768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6TDXR1ztRZK+SHHXUv1qI+HDpedPgHYiHRuIOKRGwzs7jpm8kom2yFAAgDjc?=
 =?us-ascii?Q?DrOdwyOgIaIRQaJja4NB8Xcqgr6EZOhbEnx9F2uPAOIgUZm2LjTVgtXDjAb1?=
 =?us-ascii?Q?Dp4I4tLrlXBZ0uFOOcBHq3ZbEt0VS5ujmuqgMP0NJmxrB4XcoemKmvCNV2hP?=
 =?us-ascii?Q?q5kA+w1IZQxIO6mLkVFpsBQhuV2QkBqsXhFSwqfXVNi7boOSXTBetfgITcLr?=
 =?us-ascii?Q?Kfa0hKhZYODO0T1n/6MKVWsIOhgeheUODNI5BG7Le3ZWQC2WR6ripiVtCcJK?=
 =?us-ascii?Q?tk2Q56fJ4ubyhifYmeXB6nL2xcyatSZY2jbwLoYflQIyn8GaTiizadCv0WTt?=
 =?us-ascii?Q?sbU6Pv3b9u0ChF/D2pmmbMMjlrSoJA0hyD7ng0/lOs1TyH/mfrEafAReslgo?=
 =?us-ascii?Q?1vzrU54NDBCO5qq9uE5gx/Sg9dmCmqKCIprA2NGNZ9c1d9GK+n21bvgGMud6?=
 =?us-ascii?Q?/EhBcy/H3ZuqiZSRHb+DvVe7aVsinj1vd0gMsrUhWlDfmf+pcCISP5hnyWWh?=
 =?us-ascii?Q?BOAM++rpyPL8iFu1XOGPrL/yaKaJzdowYsIlD9xjObTD/KABeCLJ2OodWH2p?=
 =?us-ascii?Q?yq2yMOEzEXHlJQcb1VNQzgHXhTPG3cAEtQIVzS7/3CRrWdTBM20G3mRb1jc6?=
 =?us-ascii?Q?Vt6DODEX65Z+pKuhrAT4u0fc5ksOYFdhPRHWOAgZS1iw8LtZGZObbfPqQGlG?=
 =?us-ascii?Q?ory+ctLUilv4oTGrrTnW6aHS9t5vSoiJ/Wp4wjKcMla/qGw8zxoVG0dygU2n?=
 =?us-ascii?Q?0sxtVnobwiOyd4eEoKHEKMW+aSWhdXmkKrsYNsCxnKru2fhTcmOd6rrP7R58?=
 =?us-ascii?Q?NPcn4oFEJaRcIZ+1y1Z5W7Avan3YMBO6hGyoeIuIUx7n4k+7ahRnHqILQo+H?=
 =?us-ascii?Q?zm0UgNLxbXhhexpN/HNSDXqFfVWxO0WwPyJvMdHk5YQggflHkgYFdNFOvkaN?=
 =?us-ascii?Q?t86Xp483vU/F0+Wj1JTVfaiyjQA/QRvhgdOdGjN4BdUTj9TcT9rLXxtQgB9R?=
 =?us-ascii?Q?1PW90iirscKyAh3BIo2a8hqqrn0/bd4xmESmKbLERn9dXOODQJvVPuWcpZZm?=
 =?us-ascii?Q?8oF2Z4lapVSuQuB+gDaJmOU7aJeAdyLORb9nNIiORUnc2lCs+rbhJXPkTx1G?=
 =?us-ascii?Q?0ZTXcY+rWUz6Ou+PFbvl0K+nf3VbVCnapFFCGssDGfqsHnG5wQC0BCgDvSfe?=
 =?us-ascii?Q?Xw3/t49RPl+clsRD7cktavxdM+DcWfDhEW2rHc8ZpNO8OAjxK/DQGpKm3ked?=
 =?us-ascii?Q?/2TOaha+yHMPHzPI1VMjVdkNdmnEBHUrP0UiVVJkvNWHZqRSp2KmOrzlhOxB?=
 =?us-ascii?Q?8KNFD0fpu0iNiyfRz3cl0sz+tQ0f9D9o6LJ9a/LyLbkMlY2yoL3fOOOuont4?=
 =?us-ascii?Q?GorlPCApPcchhr2x29n/9Mim+v9GYQdWuinZeJgVVEfYufbevXMQV9dC09+a?=
 =?us-ascii?Q?kSD+sTFhuxkNQusiOj/vjgyNNR7b3vtO/KYIjihx8fqeqKU4sJ6ToVuPxYkL?=
 =?us-ascii?Q?v6dxvjoPkNM0x2AYEDUPGGkCTJJGA4lEMgs9FNO1024QzpZeUK4vRqfKbwzZ?=
 =?us-ascii?Q?8kmBEnDJ36XchCUamPI=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 05:00:07.8784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b1dc0d-9ff1-42b3-8254-08de4a84f768
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8717

From: Alexandre Courbot <acourbot@nvidia.com>

On Turing and GA100 (i.e. the versions that use Libos v2), GSP-RM insists
that the 'size' parameter of the LibosMemoryRegionInitArgument struct be
aligned to 4KB.  The logging buffers are already aligned to that size, so
only the GSP_ARGUMENTS_CACHED struct needs to be adjusted.  Make that
adjustment by adding padding to the end of the struct.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec.rs |  2 +-
 drivers/gpu/nova-core/gsp.rs            |  8 ++++----
 drivers/gpu/nova-core/gsp/fw.rs         | 14 +++++++++++++-
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 1c1dcdacf5f5..5d2323b07241 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -433,7 +433,7 @@ pub(crate) fn new(
         };
 
         Ok(FwsecFirmware {
-            desc: desc,
+            desc,
             ucode: ucode_signed,
         })
     }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 766fd9905358..bcf6ce18a4a1 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -27,7 +27,7 @@
 use crate::{
     gsp::cmdq::Cmdq,
     gsp::fw::{
-        GspArgumentsCached,
+        GspArgumentsAligned,
         LibosMemoryRegionInitArgument, //
     },
     num,
@@ -114,7 +114,7 @@ pub(crate) struct Gsp {
     /// Command queue.
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
-    rmargs: CoherentAllocation<GspArgumentsCached>,
+    rmargs: CoherentAllocation<GspArgumentsAligned>,
 }
 
 impl Gsp {
@@ -133,7 +133,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                 logintr: LogBuffer::new(dev)?,
                 logrm: LogBuffer::new(dev)?,
                 cmdq: Cmdq::new(dev)?,
-                rmargs: CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+                rmargs: CoherentAllocation::<GspArgumentsAligned>::alloc_coherent(
                     dev,
                     1,
                     GFP_KERNEL | __GFP_ZERO,
@@ -149,7 +149,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
                     )?;
                     dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-                    dma_write!(rmargs[0] = fw::GspArgumentsCached::new(cmdq))?;
+                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(cmdq))?;
                     dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
                 },
             }))
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index abffd6beec65..15ca9c183ae1 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -906,9 +906,21 @@ pub(crate) fn new(cmdq: &Cmdq) -> Self {
 // SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GspArgumentsCached {}
 
+/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgument`
+/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to force it
+/// to that size.
+#[repr(C)]
+pub(crate) struct GspArgumentsAligned {
+    pub(crate) inner: GspArgumentsCached,
+    _padding: [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGUMENTS_CACHED>()],
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspArgumentsAligned {}
+
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
-unsafe impl FromBytes for GspArgumentsCached {}
+unsafe impl FromBytes for GspArgumentsAligned {}
 
 /// Init arguments for the message queue.
 #[repr(transparent)]
-- 
2.51.0

