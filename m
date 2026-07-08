Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010011.outbound.protection.outlook.com [52.101.61.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF43749E6;
	Wed,  8 Jul 2026 16:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526446; cv=fail; b=iZy8F4TfxcxMmvLoDRUTOCBQ6qfR0xK0lz+u9cBN7Ns7SC5E8WFdnA+3U/zB5NdE3ont3iiJRxjeWD215TDgEX8eh+bykIFde3oG3xq2F3PVnF5zYRbj2Np+BdT0u1JACn//NcKygQKMxT4WpMujkQxAyOsAf7bVs1YLpaCwcp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526446; c=relaxed/simple;
	bh=gD2h1FdHGUZkTPnM9eHuK2slbZWsmjj5/Dq2VUlMfgI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cOgN9BGTuL959FPv6JxeugM1RdVmcYmzztmKNlMFtk2j041mQ1r04nmoOSkaSKgS5/MxER4I65BSxi/vLvAmV9hPyUYfJVAZC87pUG3qa5NllRtxi4to6iL2EptyUyIb7t4a/dmw+NVIVubBhUxooZ2ishMI5agLtT3ewjfZ09s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DCug6dcd; arc=fail smtp.client-ip=52.101.61.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DCug6dcd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JueBcQzJETNHaASNapjIZdVvP76fiT6acsOKLJgmkYr6w9kMkPfveDUSJ8EWBPmQcpCPajPMTj7jtqP2rXiIvb/25GLfwcGgeBpa0rbcl/T58zKOnFb2iRlMkIm6y2iBkPAKK7irNQheaRkcAf9VQvCV0QT0b5mB4j3tisp47DP6Br8yb2dM4PsDDnsHi3iuZTIyIJ931YXBcP1qcoKDGgJO35iPn6/ArwGyA2PwcipNtgOxHGEhOwsjt2tNMB3bpbhIUFxM0Yx0RSW2iAyRuE5Tr1FPMdhN5lHM4n2jvisVOEGMnvbUrHhyZHgtDgUblEZOr+MOErAo0r5iqkwWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEIB+G/iRkq6XPllwjsMYZ9lrQWiCIyt8IpfUZAozFQ=;
 b=x+jZyt8oFWQPBiPKwuKI/GnZwOGcp6qL8jFNoEO4D1ZebqHn7EmWc6O5nq/RWtbuTG0tXSFf04/H3r4QgkoXe3a7h52UWxM8nHmeK3f2XqEBwk8Ke+I+MRE5ofvGxyqu3v02Xw34/5T2WekHin98vuV5IXzDCB7TqBygU2wd7KAdVKHhV3eFMhN8eQyHIGUu8/3aDOOSgwWVswBt8NY+zJoDdw78N2OfF6eUl+1mFjIkrmXk1tF6+0tL7ddWC2Ol0J3MSBxzaYrjs4RGZR7wQ/HFEXP2efh0dYxyozp0s0KEhk8x+SJGLGOJZAXeTaJp653TVAtdMNLKy0radPknjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEIB+G/iRkq6XPllwjsMYZ9lrQWiCIyt8IpfUZAozFQ=;
 b=DCug6dcdvXzJZYjefDkze3mQi8E2KrYUuGudX7W1rBawAbmn8wR1FwFIo25MepDC1DaO4nevQ0BDN32PXg+m/51Hx2haxncHfFgph7JjqLkoRA3P7r9iQCYIESnW9Xe2x06dWuCrqckpOnn3RR4rbVgDFYZkJfpuMGbHNTWXlJ+St8BBSZW53BxJ7WCIFNxi81D2t8Vv8a75TAxi+DevHeaTztSLTvT3JUAB0ExnbFwe4NMAawzHMkTwUaJAZXfEdSDm8vWVHdEg3D/ynSHFNUL0/5BC4By8SQVk1CL8VBq6q/SK1S11RWx2ocxWPWeb0YyrCz46nhL2x/jvHcfQow==
Received: from SJ0PR13CA0001.namprd13.prod.outlook.com (2603:10b6:a03:2c0::6)
 by PH7PR12MB7843.namprd12.prod.outlook.com (2603:10b6:510:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 16:00:32 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::78) by SJ0PR13CA0001.outlook.office365.com
 (2603:10b6:a03:2c0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Wed, 8
 Jul 2026 16:00:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 16:00:32 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Jul
 2026 09:00:10 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 8 Jul 2026 09:00:07 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Wed, 8 Jul
 2026 09:00:01 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <dakr@kernel.org>, <jgg@nvidia.com>, <dave.jiang@intel.com>,
	<saeedm@nvidia.com>, <jic23@kernel.org>, <gary@garyguo.net>,
	<joelagnelf@nvidia.com>, <aliceryhl@google.com>, <kwilczynski@kernel.org>,
	<ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
	<acourbot@nvidia.com>, <jhubbard@nvidia.com>, <zhiwang@kernel.org>,
	<daniel.almeida@collabora.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v7 1/1] rust: introduce abstractions for fwctl
Date: Wed, 8 Jul 2026 18:59:51 +0300
Message-ID: <20260708155951.699564-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260708155951.699564-1-zhiw@nvidia.com>
References: <20260708155951.699564-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|PH7PR12MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e91af13-b2fd-42fb-4136-08dedd0a0a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|1800799024|5023799004|56012099006|11063799006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ycZ4K+IaezCUMHFP00SNwzoOJBHidHLXbmZvQpDQ7HK1bdMwheHIdNSKgmM3giwOaEZVR4yyqS+jJY34p/I5OpSv7c5Zw+fYtRNLsBdQuGY7a+fLTc5S87NHKYG/7s2ELLmKBp0SgkysXscLOq0+xDIfbppwqjAWR0sG07CHeA7vdYRGna/lcC3yajEFzy4gJXoZQgmkGtBvxaA2FQ+VQUi+7BswFdDf6FOi7kVFVXtWr3leBMPVQJYrxoEVMo4vfCKfhhWuN9KHkbby3nFhqlq0w/wPi7jBQtoLP9cXail9Enr+Rsp4rEUwGbsKWX9xIsIb13IxnBnDohcGGcEYF4kA457ObItnEiWiIhE+DXfSE0Dmvt8/12bsgJVQRgxEkpEjQMJ7LGINf7a488oIZ2tWVnNNNpJ1qj9o1S+I88wofo3DHh+5z6FHkLNFXh3js6tnuZIRMr4NJSqcm+/B8TWS4erJmozLIcWp2KgBjTtc7Ogjl6n8je9CWokSGVcbo+3YI8tStCt/0vaNUccMPSeBhJXISlmoQiUU7FDIXbGzpTLGJyH4HEZV4rG+7tHJCE2mFvLVLSW43I8fN/ELGfr5X9RNPhA+0e0+XOBRLfhaZ4Om9VZ3Y9pfLbn+pacLmLTlpE2vLBEGVyJUrSWWzujXAmz0DXUQR7kxqi6SX9+DM1R8+WfjITe9QMXwfaQhu3u5HRmO1/DlfFhfmLv4bQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(1800799024)(5023799004)(56012099006)(11063799006)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vFQFs3t7cxOmmCwDEGtMsqUj2vNvYZmcEpFqi6iFLFqkUInHTNZAsW8wjsF9O4mSK7iDDOjwcT/BiVSvcRcFJwjA9PZZx2+CNd+whCCAS3coNYKZGE5fZYnzssy+oxZ8TtdOYvpFzWI5U/j+dV6XBzhEVUPmPSoleIimqjzCllSY7gG8n4sa2yFIfG4vInOrxX+fLtqO8gfr6D60+sDr2Flv1r1bR2x9UQHEdPTFxyjIf9KCn2LrRUDN9MJ1gBMh4O2DiWaitjL2/VUD7wtcRAwp6Qb1XDt8cf+0hSNRXrdPHIa4IcSti7WlLtBuo9Klclcqwm4mqENOU6tm0XZRomB5Cpheqo2HlcQlwDltj3sriSKHJsnozBODfvR7BLFDac5ErevB2+lnPvMdJ/p35Lbb9+IZ+NINLda689ACJRV/A0M9mdZ7n99J3GwM4yvZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:00:32.6746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e91af13-b2fd-42fb-4136-08dedd0a0a65
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7843

Introduce safe Rust wrappers around struct fwctl_device and
struct fwctl_uctx. This lets Rust drivers register fwctl devices and
implement firmware RPC callbacks through a typed trait interface.

The abstraction keeps lifetime and reference-count handling inside the
wrapper, exposes pinned per-FD user contexts to drivers, and validates the
layout assumptions required by the C fwctl allocation model. Allocation
sizes are padded so the kmalloc-backed C allocations also satisfy Rust
alignment requirements.

Registration owns driver private data with a lifetime tied to the bound
parent device and verifies the parent identity before registration.
Callbacks access that data through a higher-ranked closure, preventing its
erased lifetime from escaping, while Device remains only the refcounted
fwctl object. This avoids requiring Rust drop glue from the fwctl_device
release path after unregister or module teardown.

RPC callbacks receive typed scope information, a mutable request/response
buffer, and the userspace output-buffer size. Response pointer conversion,
length validation, and raw output-length handling remain inside the
abstraction.

Add the Rust sources to the FWCTL MAINTAINERS entry.

Co-developed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/r/DJJW7X4ESDSM.QCVYK2FC7ZR3@kernel.org
Link: https://lore.kernel.org/r/20260629150156.3169384-2-zhiw@nvidia.com
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 MAINTAINERS                     |   2 +
 drivers/fwctl/Kconfig           |  12 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/fwctl.c            |  17 +
 rust/helpers/helpers.c          |   3 +-
 rust/kernel/fwctl.rs            | 578 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 7 files changed, 614 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/fwctl.c
 create mode 100644 rust/kernel/fwctl.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..af3281c58a1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10742,6 +10742,8 @@ F:	Documentation/userspace-api/fwctl/
 F:	drivers/fwctl/
 F:	include/linux/fwctl.h
 F:	include/uapi/fwctl/
+F:	rust/helpers/fwctl.c
+F:	rust/kernel/fwctl.rs
 
 FWCTL BNXT DRIVER
 M:	Pavan Chebbi <pavan.chebbi@broadcom.com>
diff --git a/drivers/fwctl/Kconfig b/drivers/fwctl/Kconfig
index d1b1925bdaec..cac38cf79f30 100644
--- a/drivers/fwctl/Kconfig
+++ b/drivers/fwctl/Kconfig
@@ -9,6 +9,18 @@ menuconfig FWCTL
 	  fit neatly into an existing subsystem.
 
 if FWCTL
+
+config RUST_FWCTL_ABSTRACTIONS
+	bool "Rust fwctl abstractions"
+	depends on RUST && FWCTL=y
+	help
+	  This enables the Rust abstractions for the fwctl device firmware
+	  access framework. It provides safe wrappers around struct fwctl_device
+	  and struct fwctl_uctx, allowing Rust drivers to register fwctl devices
+	  and implement their control and RPC logic in safe Rust.
+
+	  If unsure, say N.
+
 config FWCTL_BNXT
 	tristate "bnxt control fwctl driver"
 	depends on BNXT
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 1124785e210b..3d0511e4ab4f 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -60,6 +60,7 @@
 #include <linux/fdtable.h>
 #include <linux/file.h>
 #include <linux/firmware.h>
+#include <linux/fwctl.h>
 #include <linux/fs.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
diff --git a/rust/helpers/fwctl.c b/rust/helpers/fwctl.c
new file mode 100644
index 000000000000..c7eecd4336a7
--- /dev/null
+++ b/rust/helpers/fwctl.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/fwctl.h>
+
+#if IS_ENABLED(CONFIG_RUST_FWCTL_ABSTRACTIONS)
+
+__rust_helper struct fwctl_device *rust_helper_fwctl_get(struct fwctl_device *fwctl)
+{
+	return fwctl_get(fwctl);
+}
+
+__rust_helper void rust_helper_fwctl_put(struct fwctl_device *fwctl)
+{
+	fwctl_put(fwctl);
+}
+
+#endif
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 998e31052e66..b7d9512da9a6 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -62,10 +62,11 @@
 #include "drm.c"
 #include "drm_gpuvm.c"
 #include "err.c"
-#include "irq.c"
 #include "fs.c"
+#include "fwctl.c"
 #include "gpu.c"
 #include "io.c"
+#include "irq.c"
 #include "jump_label.c"
 #include "kunit.c"
 #include "list.c"
diff --git a/rust/kernel/fwctl.rs b/rust/kernel/fwctl.rs
new file mode 100644
index 000000000000..410f87b57b07
--- /dev/null
+++ b/rust/kernel/fwctl.rs
@@ -0,0 +1,578 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+//! Abstractions for the fwctl subsystem.
+//!
+//! C header: `include/linux/fwctl.h`
+
+use crate::{
+    bindings,
+    container_of,
+    device,
+    prelude::*,
+    sync::aref::{
+        ARef,
+        AlwaysRefCounted, //
+    },
+    types::Opaque, //
+};
+use core::{
+    alloc::Layout,
+    cell::UnsafeCell,
+    marker::PhantomData,
+    ptr::NonNull,
+    slice, //
+};
+
+/// Returns a kmalloc-compatible allocation size for `T`.
+const fn kmalloc_aligned_size<T>() -> usize {
+    Layout::new::<T>().pad_to_align().size()
+}
+
+/// Represents a fwctl device type.
+///
+/// Corresponds to the C `enum fwctl_device_type`. All non-error UAPI values are represented so
+/// Rust drivers can select a device type without passing an untyped integer, while
+/// `FWCTL_DEVICE_TYPE_ERROR` remains unrepresentable.
+#[repr(u32)]
+#[derive(Copy, Clone, Debug, Eq, PartialEq)]
+pub enum DeviceType {
+    /// Mellanox ConnectX (mlx5) device.
+    Mlx5 = bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_MLX5,
+    /// CXL (Compute Express Link) device.
+    Cxl = bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_CXL,
+    /// AMD/Pensando PDS device.
+    Pds = bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_PDS,
+    /// Broadcom NetXtreme (bnxt) device.
+    Bnxt = bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_BNXT,
+}
+
+impl From<DeviceType> for u32 {
+    fn from(device_type: DeviceType) -> Self {
+        device_type as u32
+    }
+}
+
+/// Scope of access for an RPC request.
+///
+/// Corresponds to the C `enum fwctl_rpc_scope`.
+#[repr(u32)]
+#[derive(Copy, Clone, Debug, Eq, PartialEq)]
+pub enum RpcScope {
+    /// Read/write access to device configuration.
+    Configuration = bindings::fwctl_rpc_scope_FWCTL_RPC_CONFIGURATION,
+    /// Read-only access to debug information.
+    DebugReadOnly = bindings::fwctl_rpc_scope_FWCTL_RPC_DEBUG_READ_ONLY,
+    /// Write access to lockdown-compatible debug information.
+    DebugWrite = bindings::fwctl_rpc_scope_FWCTL_RPC_DEBUG_WRITE,
+    /// Full read/write access to all debug information (requires `CAP_SYS_RAWIO`).
+    DebugWriteFull = bindings::fwctl_rpc_scope_FWCTL_RPC_DEBUG_WRITE_FULL,
+}
+
+impl TryFrom<u32> for RpcScope {
+    type Error = Error;
+
+    #[inline]
+    fn try_from(value: u32) -> Result<Self, Error> {
+        match value {
+            v if v == Self::Configuration as u32 => Ok(Self::Configuration),
+            v if v == Self::DebugReadOnly as u32 => Ok(Self::DebugReadOnly),
+            v if v == Self::DebugWrite as u32 => Ok(Self::DebugWrite),
+            v if v == Self::DebugWriteFull as u32 => Ok(Self::DebugWriteFull),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// Response from a [`Operations::fw_rpc`] call.
+pub enum FwRpcResponse {
+    /// Reuse the input buffer as the output, with the given output length.
+    InPlace(usize),
+    /// Return a newly allocated buffer as the output.
+    NewBuffer(KVec<u8>),
+}
+
+/// Trait implemented by each Rust driver that integrates with the fwctl subsystem.
+///
+/// The implementing type **is** the per-FD user context: one instance is
+/// created for each `open()` call and dropped when the FD is closed.
+///
+/// Each implementation corresponds to a specific device type and provides the
+/// vtable used by the core `fwctl` layer to manage per-FD user contexts and
+/// handle RPC requests.
+pub trait Operations: Sized + Send + Sync + 'static {
+    /// Data owned by the [`Registration`] and accessible during callbacks.
+    ///
+    /// The lifetime `'a` is tied to the [`Registration`] scope (which lives within the parent bus
+    /// device binding scope). Drivers use it to store references to resources bound to this scope,
+    /// such as PCI BARs or typed bus device references.
+    type RegistrationData<'a>: Send + Sync + 'a
+    where
+        Self: 'a;
+
+    /// fwctl device type identifier.
+    const DEVICE_TYPE: DeviceType;
+
+    /// Called when a new user context is opened.
+    ///
+    /// Returns a [`PinInit`] initializer for `Self`. The instance is dropped
+    /// automatically when the FD is closed (after [`close`](Self::close)).
+    fn open<'a>(
+        device: &Device<Self>,
+        reg_data: &Self::RegistrationData<'a>,
+    ) -> impl PinInit<Self, Error>;
+
+    /// Called when the user context is closed.
+    ///
+    /// The driver may perform additional cleanup here that requires access
+    /// to the owning [`Device`]. `Self` is dropped automatically after this
+    /// returns.
+    fn close<'a>(
+        _this: Pin<&mut Self>,
+        _device: &Device<Self>,
+        _reg_data: &Self::RegistrationData<'a>,
+    ) {
+    }
+
+    /// Return device information to userspace.
+    ///
+    /// The default implementation returns no device-specific data.
+    fn info<'a>(
+        _this: Pin<&Self>,
+        _device: &Device<Self>,
+        _reg_data: &Self::RegistrationData<'a>,
+    ) -> Result<KVec<u8>, Error> {
+        Ok(KVec::new())
+    }
+
+    /// Handle a userspace RPC request.
+    ///
+    /// `max_output_len` is the size of the userspace output buffer. A driver may return a larger
+    /// response to report the required size; the fwctl core copies only the bytes that fit and
+    /// reports the full response length to userspace.
+    fn fw_rpc<'a>(
+        this: Pin<&Self>,
+        device: &Device<Self>,
+        reg_data: &Self::RegistrationData<'a>,
+        scope: RpcScope,
+        rpc_buf: &mut [u8],
+        max_output_len: usize,
+    ) -> Result<FwRpcResponse, Error>;
+}
+
+/// A fwctl device.
+///
+/// `#[repr(C)]` with the `fwctl_device` at offset 0, matching the C `fwctl_alloc_device()` layout
+/// convention. Contains a pointer to the [`Registration`]'s data, set at registration time and
+/// cleared on unregistration.
+///
+/// # Invariants
+///
+/// - `dev` is embedded at offset 0 and is initialised by fwctl.
+/// - The fwctl refcount owns the allocation lifetime.
+/// - `registration_data` is either `NonNull::dangling()` (before registration / after
+///   unregistration) or points to valid data owned by the [`Registration`].
+#[repr(C)]
+pub struct Device<T: Operations> {
+    dev: Opaque<bindings::fwctl_device>,
+    registration_data: UnsafeCell<NonNull<T::RegistrationData<'static>>>,
+}
+
+impl<T: Operations> Device<T> {
+    /// Allocate a new fwctl device.
+    ///
+    /// Returns an [`ARef`] that can be passed to [`Registration::new()`]
+    /// to make the device visible to userspace.
+    pub fn new(parent: &device::Device<device::Bound>) -> Result<ARef<Self>> {
+        const_assert!(
+            core::mem::offset_of!(Self, dev) == 0,
+            "struct fwctl_device must be at offset 0"
+        );
+
+        let size = kmalloc_aligned_size::<Self>();
+        let ops = core::ptr::from_ref::<bindings::fwctl_ops>(&VTable::<T>::VTABLE).cast_mut();
+
+        // SAFETY: `ops` is static, `parent` is bound, and `size` is padded so the allocation made
+        // by `_fwctl_alloc_device` satisfies the size and alignment required by `Device<T>`.
+        let raw = unsafe { bindings::_fwctl_alloc_device(parent.as_raw(), ops, size) };
+        let this = NonNull::new(raw.cast::<Self>()).ok_or(ENOMEM)?;
+
+        // INVARIANT: Set `registration_data` to dangling (no registration yet).
+        // SAFETY: `this` points to the allocation just returned by fwctl.
+        unsafe {
+            (&raw mut (*this.as_ptr()).registration_data)
+                .write(UnsafeCell::new(NonNull::dangling()));
+        };
+
+        // SAFETY: `this` owns the initial reference.
+        Ok(unsafe { ARef::from_raw(this) })
+    }
+
+    #[inline]
+    fn as_raw(&self) -> *mut bindings::fwctl_device {
+        self.dev.get()
+    }
+
+    /// # Safety
+    ///
+    /// `ptr` must point to a valid `fwctl_device` embedded in a [`Device<T>`].
+    #[inline]
+    unsafe fn from_raw<'a>(ptr: *mut bindings::fwctl_device) -> &'a Self {
+        // SAFETY: The caller upholds the offset-0 `Device<T>` invariant.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Invokes `f` with the registration data.
+    ///
+    /// The higher-ranked callback prevents the erased registration lifetime from escaping and
+    /// permits registration data that is invariant over its lifetime parameter.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that the device is registered and that this is called from a fwctl
+    /// callback protected by `registration_lock`.
+    #[inline]
+    unsafe fn with_registration_data<R>(
+        &self,
+        f: impl for<'a> FnOnce(&Device<T>, &'a T::RegistrationData<'a>) -> R,
+    ) -> R {
+        // SAFETY: Caller guarantees the device is registered, so the pointer is valid.
+        // Lifetimes do not affect layout. The higher-ranked callback prevents the shortened
+        // lifetime from escaping or being selected by the caller.
+        let reg_data = unsafe {
+            (*self.registration_data.get())
+                .cast::<T::RegistrationData<'_>>()
+                .as_ref()
+        };
+
+        f(self, reg_data)
+    }
+}
+
+impl<T: Operations> AsRef<device::Device> for Device<T> {
+    #[inline]
+    fn as_ref(&self) -> &device::Device {
+        // SAFETY: `self` contains a live fwctl_device.
+        let dev = unsafe { &raw mut (*self.as_raw()).dev };
+        // SAFETY: The embedded device is initialised by fwctl.
+        unsafe { device::Device::from_raw(dev) }
+    }
+}
+
+// SAFETY: `fwctl_get` increments the refcount of a valid fwctl_device.
+// `fwctl_put` decrements it and frees the device when it reaches zero.
+unsafe impl<T: Operations> AlwaysRefCounted for Device<T> {
+    #[inline]
+    fn inc_ref(&self) {
+        // SAFETY: `self` holds a live reference.
+        unsafe { bindings::fwctl_get(self.as_raw()) };
+    }
+
+    #[inline]
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The caller owns a live reference.
+        unsafe { bindings::fwctl_put(obj.cast().as_ptr()) };
+    }
+}
+
+// SAFETY: `Device<T>` is refcounted by the fwctl core and may be released from any thread.
+unsafe impl<T: Operations> Send for Device<T> {}
+
+// SAFETY: Shared access to the embedded `fwctl_device` is protected by the fwctl core. The
+// `registration_data` field is only mutated before registration and after unregistration (both
+// single-threaded with respect to callbacks).
+unsafe impl<T: Operations> Sync for Device<T> {}
+
+/// A registered fwctl device.
+///
+/// Owns the [`RegistrationData`](Operations::RegistrationData) made available to driver callbacks.
+/// The parent device lifetime ensures that [`fwctl_unregister`] runs before the parent driver
+/// unbinds.
+///
+/// On drop the device is unregistered (all user contexts are closed and `ops` is set to `NULL`)
+/// and the registration data is dropped.
+///
+/// [`fwctl_unregister`]: srctree/drivers/fwctl/main.c
+pub struct Registration<'a, T: Operations> {
+    dev: ARef<Device<T>>,
+    _reg_data: Pin<KBox<T::RegistrationData<'a>>>,
+}
+
+impl<'a, T: Operations> Registration<'a, T> {
+    /// Register a previously allocated fwctl device with the given registration data.
+    ///
+    /// The `reg_data` is owned by the registration and accessible during callbacks.
+    ///
+    /// # Safety
+    ///
+    /// Callers must not `mem::forget()` the returned [`Registration`] or otherwise prevent its
+    /// [`Drop`] implementation from running, since `fwctl_unregister` must be called before the
+    /// parent device is unbound.
+    ///
+    /// `dev` must be an unregistered [`Device`] that is not associated with any live
+    /// [`Registration`], and no other thread may attempt to register the same device concurrently.
+    pub unsafe fn new(
+        parent: &'a device::Device<device::Bound>,
+        dev: &Device<T>,
+        reg_data: impl PinInit<T::RegistrationData<'a>, Error>,
+    ) -> Result<Self> {
+        let actual_parent = dev.as_ref().parent().ok_or(EINVAL)?;
+        let parent_device: &device::Device = parent;
+        if !core::ptr::eq(actual_parent, parent_device) {
+            return Err(EINVAL);
+        }
+
+        let reg_data: Pin<KBox<T::RegistrationData<'a>>> = KBox::pin_init(reg_data, GFP_KERNEL)?;
+
+        // Store the registration data pointer in the device before registration, so that it is
+        // visible once callbacks can be invoked. The `'static` type is only an erased storage
+        // handle; callbacks access the pointer through a higher-ranked closure.
+        let ptr: NonNull<T::RegistrationData<'static>> =
+            NonNull::from(Pin::get_ref(reg_data.as_ref())).cast();
+
+        // SAFETY: No concurrent access; the device is not yet registered.
+        unsafe { *dev.registration_data.get() = ptr };
+
+        // SAFETY: `dev` is a valid fwctl_device backed by an ARef.
+        let ret = unsafe { bindings::fwctl_register(dev.as_raw()) };
+        if ret != 0 {
+            // SAFETY: No concurrent readers; registration failed.
+            unsafe { *dev.registration_data.get() = NonNull::dangling() };
+            return Err(Error::from_errno(ret));
+        }
+
+        Ok(Self {
+            dev: dev.into(),
+            _reg_data: reg_data,
+        })
+    }
+}
+
+impl<T: Operations> Drop for Registration<'_, T> {
+    fn drop(&mut self) {
+        // SAFETY: The Registration lifetime guarantees that the parent device is still bound.
+        // `fwctl_unregister` takes the write lock, closes all user contexts, and sets ops=NULL.
+        // After it returns, no callbacks can be running or will run.
+        unsafe { bindings::fwctl_unregister(self.dev.as_raw()) };
+
+        // SAFETY: `fwctl_unregister` guarantees no concurrent readers.
+        unsafe { *self.dev.registration_data.get() = NonNull::dangling() };
+
+        // `self._reg_data` is dropped here, after callbacks have stopped.
+    }
+}
+
+/// Internal per-FD user context wrapping `struct fwctl_uctx` and `T`.
+///
+/// Not exposed to drivers; they work with `&T` / `Pin<&mut T>` directly.
+#[repr(C)]
+#[pin_data]
+struct UserCtx<T: Operations> {
+    #[pin]
+    fwctl_uctx: Opaque<bindings::fwctl_uctx>,
+    #[pin]
+    uctx: T,
+}
+
+impl<T: Operations> UserCtx<T> {
+    /// # Safety
+    ///
+    /// `ptr` must point to a `fwctl_uctx` embedded in a live `UserCtx<T>`.
+    #[inline]
+    unsafe fn from_raw<'a>(ptr: *mut bindings::fwctl_uctx) -> &'a Self {
+        // SAFETY: The caller upholds the `UserCtx<T>` embedding invariant.
+        unsafe { &*container_of!(Opaque::cast_from(ptr), Self, fwctl_uctx) }
+    }
+
+    /// # Safety
+    ///
+    /// `ptr` must point to a `fwctl_uctx` embedded in a live `UserCtx<T>`.
+    /// The caller must ensure exclusive access to the `UserCtx<T>`.
+    #[inline]
+    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::fwctl_uctx) -> &'a mut Self {
+        // SAFETY: The caller upholds the embedding and exclusivity invariants.
+        unsafe { &mut *container_of!(Opaque::cast_from(ptr), Self, fwctl_uctx).cast_mut() }
+    }
+
+    /// Returns a reference to the fwctl [`Device`] that owns this context.
+    #[inline]
+    fn device(&self) -> &Device<T> {
+        // SAFETY: fwctl initialises this pointer before any driver callback.
+        let raw_fwctl = unsafe { (*self.fwctl_uctx.get()).fwctl };
+        // SAFETY: Rust fwctl devices use the offset-0 `Device<T>` layout.
+        unsafe { Device::from_raw(raw_fwctl) }
+    }
+}
+
+/// Static vtable mapping Rust trait methods to C callbacks.
+struct VTable<T: Operations>(PhantomData<T>);
+
+impl<T: Operations> VTable<T> {
+    /// The fwctl operations vtable for this driver type.
+    const VTABLE: bindings::fwctl_ops = bindings::fwctl_ops {
+        device_type: T::DEVICE_TYPE as u32,
+        uctx_size: kmalloc_aligned_size::<UserCtx<T>>(),
+        open_uctx: Some(Self::open_uctx_callback),
+        close_uctx: Some(Self::close_uctx_callback),
+        info: Some(Self::info_callback),
+        fw_rpc: Some(Self::fw_rpc_callback),
+    };
+
+    /// # Safety
+    ///
+    /// `uctx` must be a valid `fwctl_uctx` embedded in a `UserCtx<T>` with
+    /// sufficient allocated space for the uctx field.
+    unsafe extern "C" fn open_uctx_callback(uctx: *mut bindings::fwctl_uctx) -> ffi::c_int {
+        const_assert!(
+            core::mem::offset_of!(UserCtx<T>, fwctl_uctx) == 0,
+            "struct fwctl_uctx must be at offset 0"
+        );
+
+        // SAFETY: fwctl sets this pointer before calling `open_uctx`.
+        let raw_fwctl = unsafe { (*uctx).fwctl };
+        // SAFETY: Rust fwctl devices use the offset-0 `Device<T>` layout.
+        let device = unsafe { Device::<T>::from_raw(raw_fwctl) };
+
+        let uctx_offset = core::mem::offset_of!(UserCtx<T>, uctx);
+        // SAFETY: `uctx_size` reserves space for the full `UserCtx<T>`.
+        let uctx_ptr: *mut T = unsafe { uctx.byte_add(uctx_offset).cast() };
+
+        // SAFETY: `open_uctx` is called under `registration_lock` read, so the device is
+        // registered. `uctx_ptr` addresses the uninitialised pinned context reserved by
+        // `uctx_size`.
+        unsafe {
+            device.with_registration_data(|device, reg_data| {
+                match T::open(device, reg_data).__pinned_init(uctx_ptr) {
+                    Ok(()) => 0,
+                    Err(e) => e.to_errno(),
+                }
+            })
+        }
+    }
+
+    /// # Safety
+    ///
+    /// `uctx` must point to a fully initialised `UserCtx<T>`.
+    unsafe extern "C" fn close_uctx_callback(uctx: *mut bindings::fwctl_uctx) {
+        // SAFETY: fwctl keeps the owning device live for this callback.
+        let device = unsafe { Device::<T>::from_raw((*uctx).fwctl) };
+
+        // SAFETY: close is called for an opened Rust user context.
+        let ctx = unsafe { UserCtx::<T>::from_raw_mut(uctx) };
+
+        // SAFETY: `close_uctx` is called under `registration_lock` write (from
+        // `fwctl_unregister`) or read (from `fwctl_fops_release`), so the device is registered.
+        // fwctl never moves an opened user context.
+        unsafe {
+            device.with_registration_data(|device, reg_data| {
+                T::close(Pin::new_unchecked(&mut ctx.uctx), device, reg_data);
+            });
+        }
+
+        // SAFETY: close is the last callback before fwctl frees the allocation.
+        unsafe { core::ptr::drop_in_place(&mut ctx.uctx) };
+    }
+
+    /// # Safety
+    ///
+    /// `uctx` must point to a fully initialised `UserCtx<T>`.
+    /// `length` must be a valid pointer.
+    unsafe extern "C" fn info_callback(
+        uctx: *mut bindings::fwctl_uctx,
+        length: *mut usize,
+    ) -> *mut ffi::c_void {
+        // SAFETY: info is called for an opened Rust user context.
+        let ctx = unsafe { UserCtx::<T>::from_raw(uctx) };
+        let device = ctx.device();
+
+        // SAFETY: `info` is called under `registration_lock` read, so the device is registered.
+        // fwctl never moves an opened user context.
+        let result = unsafe {
+            device.with_registration_data(|device, reg_data| {
+                T::info(Pin::new_unchecked(&ctx.uctx), device, reg_data)
+            })
+        };
+
+        match result {
+            Ok(kvec) if kvec.is_empty() => {
+                // SAFETY: `length` is a valid out-parameter.
+                unsafe { *length = 0 };
+                // Return NULL for empty data; kfree(NULL) is safe.
+                core::ptr::null_mut()
+            }
+            Ok(kvec) => {
+                let (ptr, len, _cap) = kvec.into_raw_parts();
+                // SAFETY: `length` is a valid out-parameter.
+                unsafe { *length = len };
+                ptr.cast::<ffi::c_void>()
+            }
+            Err(e) => Error::to_ptr(e),
+        }
+    }
+
+    /// # Safety
+    ///
+    /// `uctx` must point to a fully initialised `UserCtx<T>`.
+    /// `rpc_in` must be valid, initialised, and exclusively accessible for `in_len` bytes.
+    /// `out_len` must be valid for reading and writing an initialised `usize`.
+    unsafe extern "C" fn fw_rpc_callback(
+        uctx: *mut bindings::fwctl_uctx,
+        scope: u32,
+        rpc_in: *mut ffi::c_void,
+        in_len: usize,
+        out_len: *mut usize,
+    ) -> *mut ffi::c_void {
+        let scope = match RpcScope::try_from(scope) {
+            Ok(s) => s,
+            Err(e) => return Error::to_ptr(e),
+        };
+
+        // SAFETY: `out_len` points to the userspace output buffer length supplied by fwctl.
+        let max_output_len = unsafe { *out_len };
+
+        // SAFETY: RPC is called for an opened Rust user context.
+        let ctx = unsafe { UserCtx::<T>::from_raw(uctx) };
+        let device = ctx.device();
+
+        // SAFETY: fwctl passes an exclusively owned buffer that is valid and initialised for
+        // `in_len` bytes. It remains live for the duration of this callback.
+        let rpc_buf: &mut [u8] = unsafe { slice::from_raw_parts_mut(rpc_in.cast::<u8>(), in_len) };
+
+        // SAFETY: `fw_rpc` is called under `registration_lock` read, so the device is registered.
+        // fwctl never moves an opened user context.
+        let result = unsafe {
+            device.with_registration_data(|device, reg_data| {
+                T::fw_rpc(
+                    Pin::new_unchecked(&ctx.uctx),
+                    device,
+                    reg_data,
+                    scope,
+                    rpc_buf,
+                    max_output_len,
+                )
+            })
+        };
+
+        let (response, response_len) = match result {
+            Ok(FwRpcResponse::InPlace(len)) => {
+                if len > in_len {
+                    return Error::to_ptr(EINVAL);
+                }
+
+                (rpc_in, len)
+            }
+            Ok(FwRpcResponse::NewBuffer(kvec)) if kvec.is_empty() => {
+                // Return NULL for empty data; kvfree(NULL) is safe.
+                (core::ptr::null_mut(), 0)
+            }
+            Ok(FwRpcResponse::NewBuffer(kvec)) => {
+                let (ptr, len, _cap) = kvec.into_raw_parts();
+                (ptr.cast::<ffi::c_void>(), len)
+            }
+            Err(e) => return Error::to_ptr(e),
+        };
+
+        // SAFETY: `out_len` is a valid out-parameter.
+        unsafe { *out_len = response_len };
+        response
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9512af7156df..35094e2131d3 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -73,6 +73,8 @@
 pub mod firmware;
 pub mod fmt;
 pub mod fs;
+#[cfg(CONFIG_RUST_FWCTL_ABSTRACTIONS)]
+pub mod fwctl;
 #[cfg(CONFIG_GPU_BUDDY = "y")]
 pub mod gpu;
 #[cfg(CONFIG_I2C = "y")]
-- 
2.51.0

