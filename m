Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010033.outbound.protection.outlook.com [40.93.198.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93D823183F
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 22:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770158931; cv=fail; b=uB98S+v20BoC9FdzPtRHZh6ApWBTyvdyWjVX2qbG+ifK6LGFp7p+ZbsD4TC7/1Vf9SU696K36VeW1t1QK8A7oH1q7xDFIP990hvvR+PcE05ZnMpT5VwG+3vYKdmCufTIfrpXyhZlbMO71ieXf9G2RGQ4vcHfhhb/oYyFKY+Wd3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770158931; c=relaxed/simple;
	bh=nuhxiAelvnyyFk2o1k0TYXRJr8pDEd+8O70w49d52hk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ss3q1LzcpBJ2LUeo4WAHtklko2l16ed5MsIcnpap7arxemC9ZYOdWvMv1YPK3md99LnwCWyQLNOwPiDw/sopfdfLfebYpVH+nd01HD4F5/rXmahVTemZIJ/Xp8cCmhaD+dHhjY4J5nO2Mu+nRbRkBAx17cIbPdMWt5DjjtAr+6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hSDNM//m; arc=fail smtp.client-ip=40.93.198.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hSDNM//m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxhT8X3gvDmDb+7LzkHWrLwcmhjZ3RYccWSJ28mSHoWfRM5ouCgxkpl1vW2NKNOM+W+WQm3QEq97jFAN3UZLHzIDQd77ANijlpblyTgfQo6PWpR3pA1J8UrlxcpI4sc6fZVmr76qe+ikV+/rtm3rvlmZCl7f5fadlwr9C7Aa1PlO08hSfz+Stw5tc+jkjLcmEjQs72KtC+yJhXCn3LzskSq9lqEbse6UwsXKZTlMyAPRS8bxpgdGDJ4a0SUE/XwxU0xM8HP1fdTiKoZGNaFiTsalet/+/1I0ya0j3wt6vUxV2bQy+yvoaro5BMqcM31hdb2uoM/28TBo4SGzzTFMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p50pjUC6rikvdXW+PJ6DnJzTC9Z5+24IkyFXfJc/hEk=;
 b=H5fWgtmPXGZEvV6J9lEhpGpNSy8zJo7M6xqB+UzPpHmA/tecV3BuzH5rK2RTpPPfTdk/+OsYvsOszWG50ebz8KrMR7TwI4yU1arJSVYtCUxuTx2ZaFPMsqqgfJ/Q8kJeBGATEaI15smJj9tXiJTx23ZWDTbWMOjEVlhMChIuwC4RZVB+hM/IqkKjFdncz95eYpu8U9mY/w9vHYItBvw65/r/Af7BNxcA6wGqxOf+TnIuTJEhUQuUt5bMqaJs27gYzSxs3mSjxCMZB6jPEknfR/d1oLvAwBIU3ToWnkeJxAry3Mk0epKwJrN3yHgAIt0K1yxx492+UYwyQiYuREvHgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p50pjUC6rikvdXW+PJ6DnJzTC9Z5+24IkyFXfJc/hEk=;
 b=hSDNM//mNRVHWVxIoq1vxOz+5S2lnJQiNh6+s6DtAxWfSmZip/N/wPrb+IvItI37subpHUJE41fsnO3n8bUXB0OiGw/FZW2HnUa//xfKnngJie4xA0tjXn5MFF5736MhcyqhKwbxeURo8sGVROnh44eDHmA64botOdNJ5te4vgsxKvbtDDovQpAUaRDhLYcqAMhaLIUjsV8o8SbncSmmd3A9URQjwQigyDNRKUVQ8/RkO/tnNdyC//Q7V6MPZdbm2XGAhLIIFrczVCQ+W1jMpyoahtJx5HF2J+mx7H4X6iZPdR9r69XD7KHYWhFq+pqMKr6trMHjDapQYUoyIOCQtg==
Received: from BN9PR03CA0365.namprd03.prod.outlook.com (2603:10b6:408:f7::10)
 by CH3PR12MB8511.namprd12.prod.outlook.com (2603:10b6:610:15c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 22:48:40 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:f7:cafe::f5) by BN9PR03CA0365.outlook.office365.com
 (2603:10b6:408:f7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 22:48:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 22:48:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:15 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:13 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v7 6/7] gpu: nova-core: create debugfs root in module init
Date: Tue, 3 Feb 2026 16:47:56 -0600
Message-ID: <20260203224757.871729-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203224757.871729-1-ttabi@nvidia.com>
References: <20260203224757.871729-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|CH3PR12MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c770118-3b8d-4351-4182-08de63765fc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J1RIwHxKL7/SWOBWdzm9Qu9PRVhpA0bB7MwPlXyWygKHzIgv/KHZDH6gqnp5?=
 =?us-ascii?Q?S5isx0rGPnjsHkgO0L83QI4EbaTj3Fnzd4MmYGJRXFzeMwoJZsmRZtVvgkqA?=
 =?us-ascii?Q?wtRV1+BR+zVqsPPU8J4Oib9ajkZ1CxudSHdDIIRzKeTPHmL5h4B2qgayFUVM?=
 =?us-ascii?Q?zmGpiIoinW1W0ujY/QKGeuU8na+rSOivFdfhBXLpp9ge0LLBEHjS5xiia24b?=
 =?us-ascii?Q?gthDdoNhLgngDuxYFtW1q2kB02XOI6Nt+xdFTUoHwWmDOZNHXF7vTy3jXCNT?=
 =?us-ascii?Q?WnKIcjElh3WZ/6vguEeQwwL4gC4fmOP24Xuv0wwzeL7fgR/Eq5yKaL2MOlR+?=
 =?us-ascii?Q?u4qvnf3uoCVmhxtot2OZOdsd+ITKWwJ1VrIn9+JS3TpNR/qQrWQZG5qcWPrS?=
 =?us-ascii?Q?qKEjgDbClpu67FnDBCb1X7+n0WYNGckM8UkgwBo16HseXv8UEO4JJUjjFhkJ?=
 =?us-ascii?Q?emEd18UdZ8yEx0YrX7ktSfMSfFaozh362ILpLqOuBnkMYs6lajcAwXPreD9I?=
 =?us-ascii?Q?OI+IPPSRcgx857oriC1pObUiPLXzwFIJN2DB+TpAFTCovheD9XlssHg8wVgV?=
 =?us-ascii?Q?iVNpcZi63hsphpJZ6wNJT/3EDWC15aq5KMZqD0AR51qKUNvp9Ub1/ePxArq7?=
 =?us-ascii?Q?ESdrR4IJijYNguW1Z4NqBa4Q0g8qP/c2nxq2cksM+OCcFjW4x6VtPgZl/Jzx?=
 =?us-ascii?Q?dYBYSpo+C5rlIkk+rG+e8iZNvxU8pzC4dVkED/UyIHCebcRIf+QiIwAUgxiz?=
 =?us-ascii?Q?v9kWaWgT6juA6p7NadPusolpxbh1R4GzNqbgR54eZNZZiWcdeiLn2aK+EGlu?=
 =?us-ascii?Q?KqLFAnwlVRQyAKRyYKtTwKA9YEOsuL5uQqXJ5gUVgKWbg8xOukcUXDX0VEos?=
 =?us-ascii?Q?SNk6Zl9LgMFt9177yXX91Q0xVRBxV2kJ+vIe9xx9rXuzeeZsRBs/+oQE4iEn?=
 =?us-ascii?Q?SdcYmgWBe2Q5cPIjienEeiSBA7ImrHzE7GcwQ4m9ZZyBm3WOOAR87tQn5uZp?=
 =?us-ascii?Q?3xtTtkEHMEqahM7XrvKwEYBb+y1iuZQQZ8vTQLcBpfchDK6gx7Fd3UL0L0l8?=
 =?us-ascii?Q?Nj+DF+7j8BjwoieV4vwuKq8H8UPVRg084EhDShnYa8KDZs+LFjEfuN/wC/Sx?=
 =?us-ascii?Q?sJGJ5o1oiJWEtvNDX/rN8IBBvWVC6TzJm7x8NXE7/AkEsucAT2ZAQvTjZH+N?=
 =?us-ascii?Q?hnwpTeGjv9CeEyQj0/p7MWV0WPSnl4hqipGOlc/uOtEUwL9L0LJIx1tU10JT?=
 =?us-ascii?Q?FwfrHbs5SygMiJxHZ3kynOQeKfg9Z6uCGFbJ68ErBJZIUrz3Ao9B+19zlTqS?=
 =?us-ascii?Q?P9iZEpHAl0N8VPHlmV0WLKSWiE7v2o2O0Zk3k1J62KoXyY1QX7PJANnFC+Xx?=
 =?us-ascii?Q?LyfBV9T62zCaP96qEuJY/U90xfYpFJmS4NUUmpnNi/UJjzMw45aaNpEN3EjI?=
 =?us-ascii?Q?SGNMnWqV+OnJqvhtwwuCsFZZ4u8CpZykfpoDCWiY/l/uGTbPjR9Gj3FOaoEA?=
 =?us-ascii?Q?9g/WCb8tqZDYxYINVmE77H+hoVuk8rn9WTZ4unLLZKRFe2K8s2LphmVf/bfu?=
 =?us-ascii?Q?JybbfcToxHJfqJxyv6CZ/aHqDC9WPuI5BWr2vCMog12HZNj01vcVekjiVOE5?=
 =?us-ascii?Q?298u4Urs9kpb1xEt6ERFh6+JE2Xahef5tbOoQEzZ7X5a97ctTILmFIKHWK1W?=
 =?us-ascii?Q?Plwsgg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I3d9eueZXbD00C8Ez1MbZRsAxPBvKQErmHKRAidZg37ROCmzwsgjEPrlB+GzywBICFARVfSxGuvpGoYhzGBgPcJmC/cLzUilfpCO9UkW2iUZERPe7P49WY6OakK9rOeA2yFujJ2+65tg/J1jaqalCCHASoZaJA/W5RiEVOaASG2zsUpkf7z1m+yKC0jy5DGq7++r0Bpo7ocdHEfWeJuePygaCkL/Oxa91OV2XLlM8HBMzGyz0wg6nzj3L8mYrNeH12Sw0gYjIEF9fcDdecA/ohdb2VzfkgfUsd3nZ6TKFmaphkABVUmVngxSSLpcIaid5bt7RaPd9evKzQ1wT8L90MIga9ja6dawaw7iIRevv7i4qIk0t5CM5MvVDAXFHFHVjIMM8tUg0nXxdrTKOW7I/4bigK8EBFOPw/u39hIHEblS1JCksnn4gF50dY8gQhui
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:48:39.5217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c770118-3b8d-4351-4182-08de63765fc4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8511

Create the 'nova_core' root debugfs entry when the driver loads.

Normally, non-const global variables need to be protected by a
mutex.  Instead, we use unsafe code, as we know the entry is never
modified after the driver is loaded.  This solves the lifetime
issue of the mutex guard, which would otherwise have required the
use of `pin_init_scope`.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 80ecbb50ec82..c0864be2c156 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -3,6 +3,7 @@
 //! Nova Core GPU Driver
 
 use kernel::{
+    debugfs,
     driver::Registration,
     pci,
     prelude::*,
@@ -27,16 +28,40 @@
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
+// FIXME: Move this into per-module data once that exists
+static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;
+
+/// Guard that clears DEBUGFS_ROOT when dropped.
+struct DebugfsRootGuard;
+
+impl Drop for DebugfsRootGuard {
+    fn drop(&mut self) {
+        // SAFETY: This guard is dropped after _driver (due to field order),
+        // so the driver is unregistered and no probe() can be running.
+        unsafe { DEBUGFS_ROOT = None };
+    }
+}
+
 #[pin_data]
 struct NovaCoreModule {
+    // Fields are dropped in declaration order, so _driver is dropped first,
+    // then _debugfs_guard clears DEBUGFS_ROOT.
     #[pin]
     _driver: Registration<pci::Adapter<driver::NovaCore>>,
+    _debugfs_guard: DebugfsRootGuard,
 }
 
 impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+        let dir = debugfs::Dir::new(kernel::c_str!("nova_core"));
+
+        // SAFETY: We are the only driver code running during init, so there
+        // cannot be any concurrent access to `DEBUGFS_ROOT`.
+        unsafe { DEBUGFS_ROOT = Some(dir) };
+
         try_pin_init!(Self {
             _driver <- Registration::new(MODULE_NAME, module),
+            _debugfs_guard: DebugfsRootGuard,
         })
     }
 }
-- 
2.52.0

