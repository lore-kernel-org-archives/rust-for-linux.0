Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011061.outbound.protection.outlook.com [52.101.57.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB873B995D;
	Mon, 29 Jun 2026 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729633; cv=fail; b=kCg/v3rc4wHq2YtEJnt2LUx5R2RynnFj+OPYTii4mRo16snmUNo29h76LN3YFD6SVn9tjHL0u9RWYh86ucpzHuK27hDBoflxHyAaiCoiHv+JK787GSKI0OY0qriQVlp+HtLm3Sy6w6ge5RFmGo4As4RT6MkmsPNzgWx6Gh7OUU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729633; c=relaxed/simple;
	bh=VfWYNhrohu/nfzwEgh0LMzMX2WWxbDSxhp/I4Bv2oHg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E8rMItcZ3hs0Y1u2p8bRyL9G0Yf9M9kLaBr2B+WcEqQW01QX57alQ1q2Cvr7mfNHp0ocxGgs0p4GhRSVoQ/5kGaVzbu5pOY3lLjAfa9/3DrfxQdKF1aJe5rr2LUOtketNIfwQgIRzxJP3JMtpbn2rgZXPJoVvt/7tACYUVz6JZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mO8Ga8BO; arc=fail smtp.client-ip=52.101.57.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mO8Ga8BO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNCA69qBDcA7tHMEZEAl5kyRBXVC2nnWbTwBASXhVqxHobyBj1xH6G0G1xeDv4fDyZ5HJZB7RXC2wVmABZK5svzORG5SQhjtiKLgkg7NDPV9bFNQJu6TNYeeLQA0oGocXBzwPb4KB06wE5D7GovzDuGoo/UwueH/p+ThTuboWYoD7GQD/aYBJqGAy/L59AI0eojHyL35rcArqm+R8EY4SOdMYz/OlMv/Y3VHHrIW5icLbzbyjgQMOlUHyF5iBbiEj1F8R7akuIagNOJ7w6GxMT9zUqivxxr0Shs67pIgDbQl83hFBgcdVQTTjXYj1IQceP1YbE7FF9cRJ3uwovhUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RWnqGO9K03oSgVSKNk6y6gOtRyqzJtJN3dZ1tV+W60=;
 b=eN+GqXs6setGaM4ImDDVQ7SLNNp6g8w4oHjCjOyDp6aj9UuF8/Zldi6RYayIzIubjkLOB0uUQ6NHP0nxQ2vE95cqmqzgJRvYzkWazABVFsyrprKC9f/NbooEDPCV9ZSmpzRk3P8ZJlntmF8xCi1kN4KhKDDRl6OWcPOC5tOBQ7Sk5pIX3jzpI32TzrXHfyaDGWWM82IVmBFXhIWdfU17X6wxmc9nXx84v2Ux0kkX0DKNZlnCldVnLuRZy7y8sRILAniE17Y1Q6jhIqDV9RpBmOeRrXklkZ53e2Nya0Qb/49pKcfqPqokM4Arg94EWhMXG2dgS5X8uwT3CD2j8BNEeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RWnqGO9K03oSgVSKNk6y6gOtRyqzJtJN3dZ1tV+W60=;
 b=mO8Ga8BOugidrSkqAjuzUSjns5Rm+AbugtaYhZyTb07eFjH7eokRRsVVaklgiEQL7SnLC3whpufls1ae/dh37CBP+zVwfEOr5UjARaRJBpRwQfVOblqv5PYOPgFWN9bt/6cvLWsp2vnfbzHlenoHCprXdxMFoRiOvLO0y1bR9x9iXLx6Wibd4TQZW2GEcpy5B8uTdCoQrG6rMhGKDT0TGTkvO7Xu7S/n213vQkfnOGuBRXBtYsxwk32sXUlXxXfB2deR0S2CZN6hwAnOYfJwvH3ce/bIvzTq1xMrJhGCeH10Fb36baRGnLOb8st+4bHvFGdrbWwJPH1VHUxiv/bPuA==
Received: from MW4PR04CA0376.namprd04.prod.outlook.com (2603:10b6:303:81::21)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:40:19 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::59) by MW4PR04CA0376.outlook.office365.com
 (2603:10b6:303:81::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:40:19 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 03:40:04 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 03:40:03 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Mon, 29
 Jun 2026 03:39:56 -0700
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
Subject: [PATCH v5 1/1] rust: introduce abstractions for fwctl
Date: Mon, 29 Jun 2026 13:39:46 +0300
Message-ID: <20260629103946.3117152-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260629103946.3117152-1-zhiw@nvidia.com>
References: <20260629103946.3117152-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|BY5PR12MB4180:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a370a85-3d1a-4ff4-e617-08ded5cad0c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|1800799024|13003099007|6133799003|5023799004|3023799007|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bzVqUZZixKuQCwBkt9Hc7P/YeWP6OkMfEfX10G8K/5GOj7Xjng1t4X73Gx9DSQ5BFQaa/fMNxgA5VsfsO4XdCB5lh+kkSawA6VxQkV5ekGLs3Bco6Gduk0onxivsABj9b3VaFDIfOY4b00rT7qwnZ6yFuNpm/+NHLWRL+EUwzNcIJpdqc5hxXZZyPXlpQqqXxwSQv+2W/cvVp8qQKbAYSqgkZRVI0ZMKwUERfvjwQkvtyG70L59CBg0sW6s87/kurVfe75VbU93cmQD+37NE04zhHPfjV5COVkf40/F8S7YoIFeqSwOhHD99Pk49l7Dzo7ULbCgw+t3HN6APKnkgzdeW7Sa9rw6YzxmkS7z6/Hn9rd/HqGwaX7AKEUaq5Rw2a8hbozGBGgm8l5XA82s1sPOPTgmqWSuck7Tc3tBgIyVPpd+TOmQD+0cLT79HAtUyrVRLLa1UNagJTZJbYEgviejFMN8DLZzMuI1oP9Qml5v+D4dkKbBk/2WPmUBv7M4rqiK8G1WP0/5bf8noJgSazNWKEe5toIR1F+z1HhRMDBxnK1qwhQPG4Oq0ckXOXDaLrnee8gXfnFe/3jnyFmeRmTDKahJ+n9yYTw816VMxhCrRMGt3v63pWcUHq4fSEytJMni7XuJ9DokN8YxPWq6XsI1k5I+44ELE2jWvbz5owL6EzJh4C+a2iw4s11jTMbemUltdlAUqIjdy29Vg2L5OuA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(1800799024)(13003099007)(6133799003)(5023799004)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	98IrH0KqAr6fcm95urtLdkHZ9XQVSrvgPKTrlyawx0JiPN4uifl1rwi4nmbKy11YBDvARnLemYc7Ej8xeOz37mExX06HwMMSe59ZtYTSjDIjOJvQy0PtMY2uEKzGd1z/n0CAQnRikHVGlQBs9ktHPY2yJTLfL/aO6yJfoJTJPfDSZMynbaPty0IgNhZjsT1Af3ELiAXiATkAN+zJ5fXWTwNBLKdMdT13bYmcYNIoFI8m++U3tkJHa0Xmh5/VSy4+BP0iH1pJsHs0FEQnjqgH1/pF3FQUmEP76yi3gx+usiKuCxF3v3Jl5y0oMFWpqGDsrPzVWuC/zSlVfibtQuOoZzSPHs6rE5L5F7lFObeXSiuhQrX3CZ2B+B0iY9lL2e5jSTPPBxrXBxvE4bTmUrt9xPzk1MxZ4oN28zqppFX+xlSPQaCFQ8Lk6Vnf2pNujb7M
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:40:19.4275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a370a85-3d1a-4ff4-e617-08ded5cad0c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180

Introduce safe Rust wrappers around struct fwctl_device and
struct fwctl_uctx. This lets Rust drivers register fwctl devices and
implement firmware RPC callbacks through a typed trait interface.

The abstraction keeps lifetime and reference-count handling inside the
wrapper, exposes pinned per-FD user contexts to drivers, and validates the
layout assumptions required by the C fwctl allocation model.

Registration owns driver private data with a lifetime tied to the bound
parent device. fwctl callbacks access that data through the Registration
lifetime, while Device remains only the refcounted fwctl object. This
avoids requiring Rust drop glue from the fwctl_device release path after
unregister or module teardown.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/r/DJHGQN654CJR.281FZSV2S5AI8@kernel.org
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/fwctl/Kconfig           |  12 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/fwctl.c            |  17 +
 rust/helpers/helpers.c          |   3 +-
 rust/kernel/fwctl.rs            | 540 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 6 files changed, 574 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/fwctl.c
 create mode 100644 rust/kernel/fwctl.rs

diff --git a/drivers/fwctl/Kconfig b/drivers/fwctl/Kconfig
index d1b1925bdaec..bbfc31b0681c 100644
--- a/drivers/fwctl/Kconfig
+++ b/drivers/fwctl/Kconfig
@@ -9,6 +9,18 @@ menuconfig FWCTL
 	  fit neatly into an existing subsystem.
 
 if FWCTL
+
+config RUST_FWCTL_ABSTRACTIONS
+	bool "Rust fwctl abstractions"
+	depends on RUST
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
index 000000000000..428e1dc38320
--- /dev/null
+++ b/rust/kernel/fwctl.rs
@@ -0,0 +1,540 @@
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
+    types::{
+        ForLt,
+        Opaque, //
+    }, //
+};
+use core::{
+    cell::UnsafeCell,
+    marker::PhantomData,
+    mem,
+    ptr::NonNull,
+    slice, //
+};
+
+/// Represents a fwctl device type.
+///
+/// Corresponds to the C `enum fwctl_device_type`.
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
+    fn try_from(value: u32) -> Result<Self, Error> {
+        match value {
+            v if v == Self::Configuration as u32 => Ok(Self::Configuration),
+            v if v == Self::DebugReadOnly as u32 => Ok(Self::DebugReadOnly),
+            v if v == Self::DebugWrite as u32 => Ok(Self::DebugWrite),
+            v if v == Self::DebugWriteFull as u32 => Ok(Self::DebugWriteFull),
+            _ => Err(ENOTSUPP),
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
+pub trait Operations: Sized + Send + Sync {
+    /// Data owned by the [`Registration`] and accessible during callbacks.
+    ///
+    /// This [`ForLt`](trait@ForLt) type is tied to the parent bus device binding scope. Drivers
+    /// use it to store references to resources bound to this scope, such as PCI BARs or typed bus
+    /// device references.
+    type RegistrationData: ForLt;
+
+    /// fwctl device type identifier.
+    const DEVICE_TYPE: DeviceType;
+
+    /// Called when a new user context is opened.
+    ///
+    /// Returns a [`PinInit`] initializer for `Self`. The instance is dropped
+    /// automatically when the FD is closed (after [`close`](Self::close)).
+    fn open<'a>(
+        device: &'a Device<Self>,
+        reg_data: &'a <Self::RegistrationData as ForLt>::Of<'a>,
+    ) -> impl PinInit<Self, Error>;
+
+    /// Called when the user context is closed.
+    ///
+    /// The driver may perform additional cleanup here that requires access
+    /// to the owning [`Device`]. `Self` is dropped automatically after this
+    /// returns.
+    fn close<'a>(
+        _this: Pin<&mut Self>,
+        _device: &'a Device<Self>,
+        _reg_data: &'a <Self::RegistrationData as ForLt>::Of<'a>,
+    ) {
+    }
+
+    /// Return device information to userspace.
+    ///
+    /// The default implementation returns no device-specific data.
+    fn info<'a>(
+        _this: Pin<&Self>,
+        _device: &'a Device<Self>,
+        _reg_data: &'a <Self::RegistrationData as ForLt>::Of<'a>,
+    ) -> Result<KVec<u8>, Error> {
+        Ok(KVec::new())
+    }
+
+    /// Handle a userspace RPC request.
+    fn fw_rpc<'a>(
+        this: Pin<&Self>,
+        device: &'a Device<Self>,
+        reg_data: &'a <Self::RegistrationData as ForLt>::Of<'a>,
+        scope: RpcScope,
+        rpc_in: &mut [u8],
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
+    registration_data: UnsafeCell<NonNull<<T::RegistrationData as ForLt>::Of<'static>>>,
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
+        let ops = core::ptr::from_ref::<bindings::fwctl_ops>(&VTable::<T>::VTABLE).cast_mut();
+
+        // SAFETY: `ops` is static, `parent` is bound, and `size` covers the full `Device<T>`.
+        let raw = unsafe {
+            bindings::_fwctl_alloc_device(parent.as_raw(), ops, core::mem::size_of::<Self>())
+        };
+
+        if raw.is_null() {
+            return Err(ENOMEM);
+        }
+
+        let this = raw.cast::<Self>();
+
+        // INVARIANT: Set `registration_data` to dangling (no registration yet).
+        // SAFETY: `this` points to the allocation just returned by fwctl.
+        unsafe {
+            core::ptr::addr_of_mut!((*this).registration_data)
+                .write(UnsafeCell::new(NonNull::dangling()));
+        };
+
+        // SAFETY: `raw` owns the initial reference.
+        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(this)) })
+    }
+
+    fn as_raw(&self) -> *mut bindings::fwctl_device {
+        self.dev.get()
+    }
+
+    /// # Safety
+    ///
+    /// `ptr` must point to a valid `fwctl_device` embedded in a `Device<T>`.
+    unsafe fn from_raw<'a>(ptr: *mut bindings::fwctl_device) -> &'a Self {
+        // SAFETY: The caller upholds the offset-0 `Device<T>` invariant.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Returns a reference to the registration data.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure the device is registered, i.e. that this is called within a fwctl
+    /// callback protected by `registration_lock`. The pointer cast from `Of<'static>` to `Of<'_>`
+    /// is sound because [`ForLt`] guarantees covariance.
+    unsafe fn registration_data_unchecked(&self) -> &<T::RegistrationData as ForLt>::Of<'_> {
+        // SAFETY: Caller guarantees the device is registered, so the pointer is valid.
+        // Lifetimes do not affect layout, so the cast is sound.
+        unsafe { (*self.registration_data.get()).cast::<_>().as_ref() }
+    }
+}
+
+impl<T: Operations> AsRef<device::Device> for Device<T> {
+    fn as_ref(&self) -> &device::Device {
+        // SAFETY: `self` contains a live fwctl_device.
+        let dev = unsafe { core::ptr::addr_of_mut!((*self.as_raw()).dev) };
+        // SAFETY: The embedded device is initialised by fwctl.
+        unsafe { device::Device::from_raw(dev) }
+    }
+}
+
+// SAFETY: `fwctl_get` increments the refcount of a valid fwctl_device.
+// `fwctl_put` decrements it and frees the device when it reaches zero.
+unsafe impl<T: Operations> AlwaysRefCounted for Device<T> {
+    fn inc_ref(&self) {
+        // SAFETY: `self` holds a live reference.
+        unsafe { bindings::fwctl_get(self.as_raw()) };
+    }
+
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
+/// Carries the lifetime `'a` of the parent device to ensure that [`fwctl_unregister`] runs (via
+/// [`Drop`]) before the parent driver unbinds. Owns the
+/// [`RegistrationData`](Operations::RegistrationData) which is accessible during callbacks via the
+/// pointer stored in [`Device`].
+///
+/// On drop the device is unregistered (all user contexts are closed and `ops` is set to `NULL`)
+/// and the registration data is dropped.
+///
+/// [`fwctl_unregister`]: srctree/drivers/fwctl/main.c
+pub struct Registration<'a, T: Operations> {
+    dev: ARef<Device<T>>,
+    _reg_data: Pin<KBox<<T::RegistrationData as ForLt>::Of<'a>>>,
+}
+
+impl<'a, T: Operations> Registration<'a, T>
+where
+    for<'b> <T::RegistrationData as ForLt>::Of<'b>: Send + Sync,
+{
+    /// Register a previously allocated fwctl device with the given registration data.
+    ///
+    /// The `reg_data` is owned by the registration and accessible during callbacks via
+    /// `Device::registration_data_unchecked()`.
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
+        _parent: &'a device::Device<device::Bound>,
+        dev: &Device<T>,
+        reg_data: impl PinInit<<T::RegistrationData as ForLt>::Of<'a>, Error>,
+    ) -> Result<Self> {
+        let reg_data: Pin<KBox<<T::RegistrationData as ForLt>::Of<'a>>> =
+            KBox::pin_init(reg_data, GFP_KERNEL)?;
+
+        // Store the registration data pointer in the device before registration, so that it is
+        // visible once callbacks can be invoked.
+        //
+        // SAFETY: Lifetimes do not affect layout, so the pointer cast is sound.
+        let ptr: NonNull<<T::RegistrationData as ForLt>::Of<'static>> =
+            unsafe { mem::transmute(NonNull::from(Pin::get_ref(reg_data.as_ref()))) };
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
+// SAFETY: `Registration` can be sent between threads; the underlying fwctl_device uses internal
+// locking.
+unsafe impl<T: Operations> Send for Registration<'_, T> {}
+
+// SAFETY: `Registration` provides no mutable access; the underlying fwctl_device is protected by
+// internal locking.
+unsafe impl<T: Operations> Sync for Registration<'_, T> {}
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
+    unsafe fn from_raw<'a>(ptr: *mut bindings::fwctl_uctx) -> &'a Self {
+        // SAFETY: The caller upholds the `UserCtx<T>` embedding invariant.
+        unsafe { &*container_of!(Opaque::cast_from(ptr), Self, fwctl_uctx) }
+    }
+
+    /// # Safety
+    ///
+    /// `ptr` must point to a `fwctl_uctx` embedded in a live `UserCtx<T>`.
+    /// The caller must ensure exclusive access to the `UserCtx<T>`.
+    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::fwctl_uctx) -> &'a mut Self {
+        // SAFETY: The caller upholds the embedding and exclusivity invariants.
+        unsafe { &mut *container_of!(Opaque::cast_from(ptr), Self, fwctl_uctx).cast_mut() }
+    }
+
+    /// Returns a reference to the fwctl [`Device`] that owns this context.
+    fn device(&self) -> &Device<T> {
+        // SAFETY: fwctl initialises this pointer before any driver callback.
+        let raw_fwctl = unsafe { (*self.fwctl_uctx.get()).fwctl };
+        // SAFETY: Rust fwctl devices use the offset-0 `Device<T>` layout.
+        unsafe { Device::from_raw(raw_fwctl) }
+    }
+}
+
+/// Static vtable mapping Rust trait methods to C callbacks.
+pub struct VTable<T: Operations>(PhantomData<T>);
+
+impl<T: Operations> VTable<T> {
+    /// The fwctl operations vtable for this driver type.
+    pub const VTABLE: bindings::fwctl_ops = bindings::fwctl_ops {
+        device_type: T::DEVICE_TYPE as u32,
+        uctx_size: core::mem::size_of::<UserCtx<T>>(),
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
+        // SAFETY: open_uctx is called under registration_lock read; the device is registered.
+        let reg_data = unsafe { device.registration_data_unchecked() };
+
+        let initializer = T::open(device, reg_data);
+
+        let uctx_offset = core::mem::offset_of!(UserCtx<T>, uctx);
+        // SAFETY: `uctx_size` reserves space for the full `UserCtx<T>`.
+        let uctx_ptr: *mut T = unsafe { uctx.cast::<u8>().add(uctx_offset).cast() };
+
+        // SAFETY: `uctx_ptr` addresses the uninitialised pinned context.
+        match unsafe { initializer.__pinned_init(uctx_ptr.cast()) } {
+            Ok(()) => 0,
+            Err(e) => e.to_errno(),
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
+        // SAFETY: close_uctx is called under registration_lock write (from fwctl_unregister) or
+        // under registration_lock read (from fwctl_fops_release); the device is registered.
+        let reg_data = unsafe { device.registration_data_unchecked() };
+
+        // SAFETY: close is called for an opened Rust user context.
+        let ctx = unsafe { UserCtx::<T>::from_raw_mut(uctx) };
+
+        {
+            // SAFETY: fwctl never moves an opened user context.
+            let pinned = unsafe { Pin::new_unchecked(&mut ctx.uctx) };
+            T::close(pinned, device, reg_data);
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
+        // SAFETY: info is called under registration_lock read; the device is registered.
+        let reg_data = unsafe { device.registration_data_unchecked() };
+
+        // SAFETY: fwctl never moves an opened user context.
+        let pinned = unsafe { Pin::new_unchecked(&ctx.uctx) };
+
+        match T::info(pinned, device, reg_data) {
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
+    /// `rpc_in` must be valid for `in_len` bytes. `out_len` must be valid.
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
+        // SAFETY: RPC is called for an opened Rust user context.
+        let ctx = unsafe { UserCtx::<T>::from_raw(uctx) };
+        let device = ctx.device();
+
+        // SAFETY: fw_rpc is called under registration_lock read; the device is registered.
+        let reg_data = unsafe { device.registration_data_unchecked() };
+
+        // SAFETY: fwctl passes a valid in/out buffer for this callback.
+        let rpc_in_slice: &mut [u8] =
+            unsafe { slice::from_raw_parts_mut(rpc_in.cast::<u8>(), in_len) };
+
+        // SAFETY: fwctl never moves an opened user context.
+        let pinned = unsafe { Pin::new_unchecked(&ctx.uctx) };
+
+        match T::fw_rpc(pinned, device, reg_data, scope, rpc_in_slice) {
+            Ok(FwRpcResponse::InPlace(len)) => {
+                if len > in_len {
+                    return Error::to_ptr(EINVAL);
+                }
+
+                // SAFETY: `out_len` is valid.
+                unsafe { *out_len = len };
+                rpc_in
+            }
+            Ok(FwRpcResponse::NewBuffer(kvec)) => {
+                let (ptr, len, _cap) = kvec.into_raw_parts();
+                // SAFETY: `out_len` is valid.
+                unsafe { *out_len = len };
+                ptr.cast::<ffi::c_void>()
+            }
+            Err(e) => Error::to_ptr(e),
+        }
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

