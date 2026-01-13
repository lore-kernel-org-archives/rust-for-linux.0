Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A8035EDD2
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 22:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768344886; cv=fail; b=kNoWkHc7P1VCtg/ITJjV6HM3D9LBOzVW44mlWOHx175tLcDW6dGJ/a15miDeDjz1pbUTcxHihqHBs148aAvKhvHKtlMgvrdFPG1nitjfqv1cquZ/8bBQ2xcJGBKWvuhYYaULrEVUU4sf3Bj5E2um+U2XfG674h2z4yU0nZesF5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768344886; c=relaxed/simple;
	bh=whXVgV9g31kq3gp5e/C2T5Jt80arLOJoymXEpES1NoU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aYrJeDrTw44WUud0LHO828Fko+b6dW+FtymuSPSg67BwEil7MK4XjqxcNzEM5EsgGEOQ4cVR+eqaFB8zQo+AZYttf/66zEePQ1q0CGxnt5qVigNU7jpVBqIOe9RKljZpJEX5npA9CaseE443rorqSgpmbV2v8yLlrP27z3I9k/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dBo/D+YI; arc=fail smtp.client-ip=40.107.208.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dBo/D+YI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOiOImTtDIi+CtrT04esUsF0uP2wIsJMqpWIC9zo9nT7zHFs2q1DFQWPr2XwNRQNJSikzK0ILKWZiu+ACyttWzrSGzlJLuRMn/jjcMe86enp9cO5wXgFViNGiGMz1qY8k1+jYCZ5XtIuv8B5z7LWtuQ2uuiCkMsSnKlTXi3ucY1awFDD+pSsX36N3jORHBlp/FGs2Xe+IcQH+8/kCqXGPsMDYVLa/J0YEjV+i3DKUe+JBYTYI7SVI8bPkcFIEKGLK91RMZ6DAIbnI+oYnkStqTE+vL+rX4bdXfEo8gpsMW1OLlEsCvm+0AaiX+lZW7L6wezHq+IISlUY9Q7MrtT3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6OHKTZxWhBvXk4EcUwnEsSYwmRlbNWv9Qc6LBIrIEk=;
 b=nWAnRp2IQeukBKAxvvyVH4KCWmlx2xNc6jNAVW42rQ+NQEjF2N8Jjoc0zGDv+v75MlTbX+5K805rfamudBYCqWqtJnmD8pqe11ntMv0LMvnXa7eTaadgAtqDdW3v/12Emx553XNt3Rj6MdyAvr5hJDiFJN2CSaSDviufFrToZM5FHhbLMpEAXdU4QRxlBmQbyVGavpQaNzBcuANLMDxCrM9kHicBt+HM6FOxn+gQHXZf77bNMmX/boJ6FK+lcR1YOWQRQrGPTEOZbrMl75aQazjque0rXIAvt8FKmMcDlGgDimUv8WyiDHYSjtdarAtaKwrp3FnBJ147Jy8fYUfCmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6OHKTZxWhBvXk4EcUwnEsSYwmRlbNWv9Qc6LBIrIEk=;
 b=dBo/D+YIQnzH/YWbmaPgmNDcFICjK9rzxCxiELxvClrphY9fJyhrjO2keKTS64m5bdhlUd5EYu/C/SldW9acIo0lBrOz5A5DATjJPdFS0B1YMOIQt+QVMFSh7+Wogbhp6N3tKz3CEEq4joj9cYO1i1wB/8qGMPsHNBBg5fKNybqlA48KRq+GaLgfvVvfu1lC+WRNolRKnbirDrJeCqtPRhJHD3oULzi6BzA7D7m99K03hJWZYn9psrCr1XpiiWLhjt6xEI9k6c7x8k41VijM+onW5ST7gggUVgmTSUjpknVT/s2sPLTpO8DTjmlwCOxJ3pknJpCHGHsLUupujH8TUQ==
Received: from CY5PR19CA0003.namprd19.prod.outlook.com (2603:10b6:930:15::20)
 by MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Tue, 13 Jan
 2026 22:54:32 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com (2603:10b6:930:15::4)
 by CY5PR19CA0003.outlook.office365.com (2603:10b6:930:15::20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7
 via Frontend Transport; Tue, 13 Jan 2026 22:54:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 22:54:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:18 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:17 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 1/9] rust: pci: add PCI device name method
Date: Tue, 13 Jan 2026 16:54:00 -0600
Message-ID: <20260113225408.671252-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113225408.671252-1-ttabi@nvidia.com>
References: <20260113225408.671252-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|MN0PR12MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b53482-706e-43de-cfc1-08de52f6b6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SAFLPNCFHr0DWOJPl4CfjG5RSS0jrGZpC5HcXw4r5neLOWKEc09x9ithgYU5?=
 =?us-ascii?Q?ovHRBf8vgIQPVMbyfx3xJHMddI+FWKKKcs92xYk3FoS2OuvoyDKvgs+wEATZ?=
 =?us-ascii?Q?UhwMTrdPoks17nlgYVRYGJ9WD8SJiRh1uTneUYyPAw9tzp5F2mj72vhhIwSm?=
 =?us-ascii?Q?bGN58NP0rWlS+BRtvqVemaZ9rhGMf01PwFVPOtONhaj3+G9uY6FFcHV7sr6N?=
 =?us-ascii?Q?BV6p6EHlFWTY8yRfpCnni04mslQSU/YIEmfYtVomGAGwCKM07ucN8YtaBFdw?=
 =?us-ascii?Q?W0mluUKvPzpLVN+NgyRHOp5odMR3ZDP0XLy93ZV8wM9QzE1obO3NhbHvosTt?=
 =?us-ascii?Q?6UptfySAn8WCcVdoNU3l5dy4ACStkEzqOoQgto1X8Zb1inkTW88JZtwaShfj?=
 =?us-ascii?Q?HoC+p0QIAjgvs179PcqOMmmM53rlHpXlqRfr4P/I9CnDL0f7qgil7jjzloZB?=
 =?us-ascii?Q?HJyuyA5aN7KeyBoXBrNnXZR+JnHYU3/HF3SGj67Kg3OJZ6/GbkJluCFg3Ofe?=
 =?us-ascii?Q?zPmPLTYNK4FYx3P9E5OMVdt5QUcG+3JEMsVnDqJmgwApEicx33487HCU4Xeh?=
 =?us-ascii?Q?j4lsB161ov69kWKygeJn/Al+uOR6oYempaGhvBg1klx7LGZUMN2fvaSfPJMP?=
 =?us-ascii?Q?+d4USnmSMJgif93WHUNpXvxeajayaTB+cdPI3li5ZP9p8wj1vs2KL+zvN8ls?=
 =?us-ascii?Q?q6HNyinUMAPubunJTwj7yqDNaHsa75+z2/9sBDNYA3MSSoVh4hFpoIkJnBXF?=
 =?us-ascii?Q?EWdEMxuXmXyklnMoUZsh60xsUgG3/tY6T4qqYph41QmJryN71Vx4Nv+QAHua?=
 =?us-ascii?Q?rmBr5sb+WMyQaSLlzhADVOd4XaOgDWoDWOvDuoAZu29IVeUY8/14MO2ngW5j?=
 =?us-ascii?Q?piJQsKMMgDNDdC3QOFPDBIBs4rKJufHGLPtVwh3l/LrSgE+L/l4atCqy/Ap6?=
 =?us-ascii?Q?zAQCQ+mVuNhU5i6PpROBgQGO13gDbuZDNqxS0cxudP5NgWrwj+ZWHqglbXZG?=
 =?us-ascii?Q?CarwJJCRWVKoFngjI+dYwdGlXSiebpgRPVomU/X5GTZ69/t/ORYsUeN5hVMi?=
 =?us-ascii?Q?JFfN0uHBmJPYjymnLepO7Y+9Os8adVDUBEPLEUUgjyVKoaFQAb7d308NfuG6?=
 =?us-ascii?Q?GmeMHQDDV5LZm5Y2ljsh60+nT8AUPHV00UQuHiUV58zwzNNkVD1f0tOc6UbR?=
 =?us-ascii?Q?mMffkMwmCXM10EL+anQEVu/aBabHVFYL5/5RPKFtRjT2ORzzFVST/75E+XIx?=
 =?us-ascii?Q?rJR7AM2zDxIx8V/XDTqCDxJOA1k1zlawt55rm2DZofCE8gRLd0+eGyHKokVg?=
 =?us-ascii?Q?1ELrahcNfd5zZ8rjfxGElBry69Dxr75RFiOl9G8Q0+JqIiKjZK5Z+CUHyBc7?=
 =?us-ascii?Q?Zcol+QQgOC+Y3WwOqzPn7hdYxTcvLDXiu1xgzrClQBWxbPEpVUYvHyoc1q8n?=
 =?us-ascii?Q?Q+5KQhAFJriCE6E+RPxnu9HJvw4gEvDEKkFT+yW67Ucu58ChARvDdJni3j2g?=
 =?us-ascii?Q?bnE3QbNHd66AdA/JIz2icW1zuDvogxHIatnxx4Cs4R7ShUbXIi/BMB0cawAt?=
 =?us-ascii?Q?FAjmC+wZ5742VEur/X4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:54:31.6309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b53482-706e-43de-cfc1-08de52f6b6e9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246

Add a name() method to the PCI `Device` type, which returns a CStr
that contains the device name, typically the BDF address.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/pci.rs | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 82e128431f08..125fb39f4316 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -427,6 +427,43 @@ pub fn pci_class(&self) -> Class {
         // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
         Class::from_raw(unsafe { (*self.as_raw()).class })
     }
+
+    /// Returns the PCI device name.
+    ///
+    /// This returns the device name in the format "DDDD:BB:DD.F" where:
+    /// - DDDD is the PCI domain (4 hex digits)
+    /// - BB is the bus number (2 hex digits)
+    /// - DD is the device number (2 hex digits)
+    /// - F is the function number (1 hex digit)
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{c_str, debugfs::Dir, device::Core, pci, prelude::*};
+    /// fn create_debugfs(pdev: &pci::Device<Core>) -> Result {
+    ///     let dir = Dir::new(pdev.name());
+    ///     Ok(())
+    /// }
+    /// ```
+    #[inline]
+    pub fn name(&self) -> &CStr {
+        // SAFETY: By its type invariant `self.as_raw` is always a valid pointer to a
+        // `struct pci_dev`, which contains a `struct device dev` member.
+        unsafe {
+            let pci_dev = self.as_raw();
+            let dev = &raw const (*pci_dev).dev;
+
+            // If init_name is set, use it; otherwise use the kobject name
+            let init_name = (*dev).init_name;
+            let name_ptr = if !init_name.is_null() {
+                init_name
+            } else {
+                (*dev).kobj.name
+            };
+
+            CStr::from_char_ptr(name_ptr)
+        }
+    }
 }
 
 impl Device<device::Core> {
-- 
2.52.0

