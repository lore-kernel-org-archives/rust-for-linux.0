Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011005.outbound.protection.outlook.com [40.93.194.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1DD423A97;
	Mon, 29 Jun 2026 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745378; cv=fail; b=OiyWsKkqA3Dk+vm24a6Gbb6BLBZMN73Griy62kPPmKP60YEkLehEdxg22HQPx4NJ2QDKvRoeoxrZpPDlqwTLY6xPuPdRO90RGVd75D3ETKDOS71r0tIZDBH3T4ZMfrrbtjyJjjQoL3os21ABzKiHOzzhxYcoB8DggYLrviR240w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745378; c=relaxed/simple;
	bh=pQ15EACDWO86+Y7gubmoY2zQgO/mxuJoINeBnIRv1Rg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SqE9Z5o9Ya5OTEwGfRz4JZ+gs07N9u6b911hegTyyHqNRQwCeOk5Z8TS/ven/mJvmcLMtFBLpHSBNUPXBEGeHRUSCjT9DB4izPCGIA7eA3iYLFvfP04GqXxxgNbf7G+AXRY3RUpmYeFcZQzg5ShrCqp46pXpquJSFH/jmqMyOXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MoXmUDyT; arc=fail smtp.client-ip=40.93.194.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MoXmUDyT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsw0x/eOFx4pRnVua9w0jK+3SaO8UPXqBVTIqLZr88AdzIx1Xgat0DZvu8S/dSLLNB4qMCctIVs6U1iPBuXTN9EHOlZi71GMjf3yrhGHL73VROdhOq0zm6T7D7dykn+1Hx0BXBY7tE4hX2V4dOpAI/DdrBrjnTDi4HNKygIEKI3kB8yMD7wC8OlmgIT5jNokKd4mPzeZSIPwyfd+YHMrqk3fkVu8xXVdWh+c7b1/YMxZ03shCAoPYwn2MzCNpL36ddf5az15krStOq1z8UQ7yCof2nvEXBhBtUrmKAFZORAK39XPZhb5iW5/peTNKoLeXtPBIx1DxhjINHtP9faxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4j6R+VEAqfOXZxOIG2xnD4YM8jZfJDRddw2nHl/ils=;
 b=J5qi6egj9AwegXM44MTjj7lA2wDtRpOw5LxmsnBZDNeWaktcaTFIhycs6udSM5WlGDFCzVeLK32V5cwKO+WwnRq0YQuL06RLzrut1SxsNKvZvhRMGt6fdrk53v9nEB2RgYOAJVRFsLTVHjO85GLae5Ou5rGER2jJdtJob6MYWH8w7b6fcn5jzQSzyDxSm+8sVWwgN0nThQz4xWoyfoV3nVqZHT/BnQY/vYaBwFMae3iLFgkeZx2OwRxyb+DXwQ4LLp5fY4Hk45Xyo0Btfai5hM8AH8jLD+IW/oXYhW82WYr6BfbGMsp0+V2dN/VWGSOu3ox/bGi0zGql4Ccv95cXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4j6R+VEAqfOXZxOIG2xnD4YM8jZfJDRddw2nHl/ils=;
 b=MoXmUDyTczjklBCJzIOLkMZ1uiN5ipiUWzo/948bRqKI5d/wRHXiOBFLxK66kUX1pNfMEVmu03ZiGu02pwe/6O2EXveQZPFdtzOqRC4irZ/rMZ6eU9dJRBIDpUuclZa6L3G+154/RKm3lOBQnGsUT9cPrVH1yUpYYl8ERAa2DzsPlIa2laBfs6TFOFJz6UpZa1imFd+RFOea8WUQrdOYKiYo451teD/YfdPXe54bOlH1BURDsS6jydusTyWizu1iWomsX1ZjUyjlB8IAFRPdV49D/OnQaZOCwz3sYbr34bJwOCy5dNaaD/QCJnUkf2hjcuCxLES4AYmj6EvyNHzcIA==
Received: from IA1P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::13)
 by SA3PR12MB8046.namprd12.prod.outlook.com (2603:10b6:806:304::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:02:46 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:461:cafe::f) by IA1P220CA0005.outlook.office365.com
 (2603:10b6:208:461::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 15:02:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 15:02:42 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 08:02:14 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 08:02:14 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Mon, 29
 Jun 2026 08:02:06 -0700
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
Subject: [PATCH v6 1/1] rust: introduce abstractions for fwctl
Date: Mon, 29 Jun 2026 18:01:56 +0300
Message-ID: <20260629150156.3169384-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260629150156.3169384-1-zhiw@nvidia.com>
References: <20260629150156.3169384-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|SA3PR12MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a4c4dc-ac1a-4822-445c-08ded5ef781d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|18002099003|22082099003|5023799004|11063799006|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	WcQdmZm/msUKjHoOuSlihysNPL007XDjsYqLMGaIaYn/BF3Y5tsTMnNEIRFW6vjVf5vieMh1gnp0IJ9/PlRqU1o6YGL92olh14Nc/85Gat7fu3kfVQBiNtom/J5WU3FEgzoPtNoJGSW6cu41Qw4fEcQLahUzOyV9a09wp/LUqZ9Pxy2GvA5hx1ZAhN2ZfkCDJ2vDUQnUJmedshETBVGC8B4dVdSdMcylUXGuak8kmWPaXLlts/jeYJrt+Oy6cwaVuzEPFNc/7VUaf+5aq9FlQfWY4c07kciSlUckq6EJ3ET/VItKK2XDcmCAVP6zvkZ6+pPxC6zHpegHJ08QqN96zf6J21NVvqHDIOp1ELEKO+hBnOc0PX0l254BylVHK7KRH1yYeYMZkz6fGGfSvVKASqEEXUuW7dtfJptFmi6pxu7ozdbFqgprvyCNJx71ao0kS1gqWrKfixjzp8ymiFPrrIEEqSJN9V1ZQrcLlJTmX7e4mtlUyu3D+v3uHHPdvXcrG+RG4py6Li/XSgTCyuXZ3CRFbjiQ0qSo7pcSEkkXK6o/hd1TJUHPvx8kYTwMTBroK5bnrhqHvgijSw6PTcZoUHC1m4O7MxBfwKHjGpi8a6H5objtZAH8cgoTQTqL3yx1Ad/D5N/UfZP3ju6gBdhosLjMD8s7yxW43PUJL7wBBeMGz3eclGMPGq/8lLSKiz7h5Ark2cpuxSNRuDLEJ/pthQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EZ9PPzJSFIfvUzfLzpgxQ4zzj6Ffvh93Rd7JDH+Hh/+joKkiYbXSgCtzNZgdx/ArkScn1M03jWgHsExpUbkinOvoE64KZGEEUeFvRra8IzI+JjXd2jwMV9QvcMeXhATVi8MlmaalK1KZeSD4dqa8ojVLvHqEsMFLutILtu5ovOhF0T5F9JTveU7qoGzwEsgOyt/HM0K7iLmu10l0KXFXMLXHJKABVdKyZkSHskqH8dlUcn5qutyXkdXoJRtb+/XjflWhBFLGjrtC0+WamdU68w1kdh5j/AASBpFu4GQKTrq+dX5wNENCxs5tuJ+tiJefJ0MQQYZDI+unzBhmyRckxpSyI/Cl4LYaclNi/DIPNUdrcQTuCcP9uFiKhYbjqwNPJm4gwrjAxSyj5MdjDkjZwJ/+4zpiB0RBhWyu5Hm/CdW1RivmR46UFx8eeiM0Z3KQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:02:42.0491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a4c4dc-ac1a-4822-445c-08ded5ef781d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8046

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

Co-developed-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/r/DJJW7X4ESDSM.QCVYK2FC7ZR3@kernel.org
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/fwctl/Kconfig           |  12 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/fwctl.c            |  17 +
 rust/helpers/helpers.c          |   3 +-
 rust/kernel/fwctl.rs            | 546 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 6 files changed, 580 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/fwctl.c
 create mode 100644 rust/kernel/fwctl.rs

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
index 000000000000..f59ed1ae6c7a
--- /dev/null
+++ b/rust/kernel/fwctl.rs
@@ -0,0 +1,546 @@
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
+        device: &'a Device<Self>,
+        reg_data: &'a Self::RegistrationData<'a>,
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
+        _reg_data: &'a Self::RegistrationData<'a>,
+    ) {
+    }
+
+    /// Return device information to userspace.
+    ///
+    /// The default implementation returns no device-specific data.
+    fn info<'a>(
+        _this: Pin<&Self>,
+        _device: &'a Device<Self>,
+        _reg_data: &'a Self::RegistrationData<'a>,
+    ) -> Result<KVec<u8>, Error> {
+        Ok(KVec::new())
+    }
+
+    /// Handle a userspace RPC request.
+    fn fw_rpc<'a>(
+        this: Pin<&Self>,
+        device: &'a Device<Self>,
+        reg_data: &'a Self::RegistrationData<'a>,
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
+    #[inline]
+    fn as_raw(&self) -> *mut bindings::fwctl_device {
+        self.dev.get()
+    }
+
+    /// # Safety
+    ///
+    /// `ptr` must point to a valid `fwctl_device` embedded in a `Device<T>`.
+    #[inline]
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
+    /// callback protected by `registration_lock`. The pointer cast from
+    /// `RegistrationData<'static>` to `RegistrationData<'_>` is sound because lifetimes do not
+    /// affect layout, and the data is guaranteed alive for the duration of the borrow.
+    #[inline]
+    unsafe fn registration_data_unchecked(&self) -> &T::RegistrationData<'_> {
+        // SAFETY: Caller guarantees the device is registered, so the pointer is valid.
+        // Lifetimes do not affect layout, so the cast is sound.
+        unsafe { (*self.registration_data.get()).cast::<_>().as_ref() }
+    }
+}
+
+impl<T: Operations> AsRef<device::Device> for Device<T> {
+    #[inline]
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
+    _reg_data: Pin<KBox<T::RegistrationData<'a>>>,
+}
+
+impl<'a, T: Operations> Registration<'a, T> {
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
+        reg_data: impl PinInit<T::RegistrationData<'a>, Error>,
+    ) -> Result<Self> {
+        let reg_data: Pin<KBox<T::RegistrationData<'a>>> = KBox::pin_init(reg_data, GFP_KERNEL)?;
+
+        // Store the registration data pointer in the device before registration, so that it is
+        // visible once callbacks can be invoked.
+        //
+        // SAFETY: Lifetimes do not affect layout, so the pointer cast is sound.
+        let ptr: NonNull<T::RegistrationData<'static>> =
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

