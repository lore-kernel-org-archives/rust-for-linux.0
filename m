Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012064.outbound.protection.outlook.com [52.101.48.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDC43A453A;
	Wed, 24 Jun 2026 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782292823; cv=fail; b=X6vU475CdRM8Pz7yvwwZ+UzE2YpaQZ4FjAc0kR4vD9M+m08FTtE53aDSObqbUI7J33jEuAUn+rSLdrrPYNFnFpbj7l+WmP50xGYgUoJruUzZc9z6E/xTVb8IJth8952xwLzWSzXs8PyRQ5vnQm8UvioDA9dIGqxNIYT3ExliLJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782292823; c=relaxed/simple;
	bh=XkhDMZgV7fHq61TFpjYxc2HjoofmWZ33OMHFi4dv+7w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TyTCn3Y0kCOiJadOKYNqU86o650yh9kNs+6bYZzptkJRI9iWJlFlHpK6l5kkUCZKrqaYbvjtnETNeGj8U0xic7lYmsJYmjVf9HEYcfdcHF0wkvl4M9sOCMYAPsc8wILSUGq7eux252ZvwqF593TkISV01sl1rpFHVgPCC+4Q2tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M80j0evJ; arc=fail smtp.client-ip=52.101.48.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M80j0evJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNpXA12rJil7CUUyn/cLBUPkPujmueu/UDHK0JIwK58ktjsBZFkIVBWQXQyazEhgBtpULtwejotG9hrOdl71PfwkRQfyu5fb/eUnzqdoc1B5BWmAIoAw3AZ0d0cAlYqZVMrZfSraAUOe9Goh/mtKXWUSRs3CJrpboTvLK6rSv3NAh3Sd4kKU6C/iarwdeNDz2xFAwAzB8bTrUFuo3r1Tccc/HQo/q1GT2hZr+mj49lhZ6c4K6FnGwkVcMI63WfsDO3NYNr9RTes8SYxnMPc6dCw7k9bJvH7pox0zchWqqf6IBmDjSmyw2XVnofQu1B6e9xzUyRiW1zb2N1Mf3H6c9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kA71JXFMX9RW4kOv4xtYSvlHrUszMC1qBN/c45iG0es=;
 b=lTL0x+7NvIGkneVGt3sG6MEDv4y2yhihIUx1/RGTh2gaAKdkQ/0W0bko8aQlt+wnC8Pn9c40AumoTaFe/l6pCZbjrXNKqvVC4rQMuzf4G1QZIXYIwgxbw6hsT7juT1UWn/E+I5YCfkFBVjaXY3gw+QjaHQPsor7NIu7eMn3cRbEYHhqnDn1yJDijiTEvvgj/tUvNA7iQIO6i5C7DqS6WkqgmFkiUmiifraWfZBCHdOzc9v59E3iRVx47A7Q+2GxJSrJms/Bd+gFYM+aWkf4PzLU+pR1vD42eTlJQo/ZqwCMKeWtOnVIko/BbbAf7b+oiviUqQVPjPMYGF4cfOR3KWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kA71JXFMX9RW4kOv4xtYSvlHrUszMC1qBN/c45iG0es=;
 b=M80j0evJzxpeGki8BmDbWML5+xtnH+slIWlpUw+LC/1SI7clfAHRPaepfym6gImtGXb1xIOst78A1XEglqkk9Ylm1w4bEPZ2K/TkXZpILtr6w7gDqSoVt+YBYEEqDb4Tp4D0yZFZgTKCKBNN96ycWG6nyCFL7fspe6aex55pCKWltxEazzdq9wRdgdV+sfkOFZQ4yS131WtQTrhmd4jvFxtLfx9kkdg9mwXSvSI5vyZQD4wlHy/md7ByK3kGD3hUdJHoPF+KIYXSwmaPSK6rpfni3oTogr1MRVdctFY60LFvmyh1/y+bzGb7YFZ1nOzvnBj9U4bUbzRMtjsZPJ/cGw==
Received: from CYXPR02CA0036.namprd02.prod.outlook.com (2603:10b6:930:cc::20)
 by CY8PR12MB7731.namprd12.prod.outlook.com (2603:10b6:930:86::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Wed, 24 Jun
 2026 09:20:07 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:930:cc:cafe::98) by CYXPR02CA0036.outlook.office365.com
 (2603:10b6:930:cc::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 09:20:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 09:20:06 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 02:19:56 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 24 Jun 2026 02:19:56 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Wed, 24
 Jun 2026 02:19:48 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <dakr@kernel.org>, <jgg@nvidia.com>, <gary@garyguo.net>,
	<joelagnelf@nvidia.com>, <aliceryhl@google.com>, <kwilczynski@kernel.org>,
	<ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
	<acourbot@nvidia.com>, <jhubbard@nvidia.com>, <zhiwang@kernel.org>,
	<daniel.almeida@collabora.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v4 2/2] rust: introduce abstractions for fwctl
Date: Wed, 24 Jun 2026 12:17:58 +0300
Message-ID: <20260624091758.1678092-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260624091758.1678092-1-zhiw@nvidia.com>
References: <20260624091758.1678092-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|CY8PR12MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1ad7b6-7201-4f38-56e7-08ded1d1c838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|82310400026|36860700016|3023799007|6133799003|18002099003|22082099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	YxvmRpL15FDcbJ4ZgB+M0oi3/CDX+hm91pDw8hBzPRIlSDH38PBPm3j8SbQVYPLoiDYq35yWLy3b0vAdhtv6hB3hURRCSv4Ic4XlWCQ/Eo+L2HEjuWkCz3ycFZX4UNEGRjcYSq4ThW8d/GwFV0t3CQe4V8QioCludKpqoH5z+1VU3J5yEchntlN7il0NAjB36MVLCSHdCUeQX+hhiahsJXnaSiNGwM4qmDSwLsC6EqrC1OkW4TwFPXofJLT4OM3AIz0MdvbzO6h9DHNikpAt5njvc6ymySlBndACMrEPJWANvmOiUIzQGTJs1lwHshHES6gCL9vWBMZgmnZujdGzmjBe+V9qF+R9KLZodEVAhSbrasSyZ6xv+s6l5gp3BTEdmd8EkUgnegBu4j3y03X2qaRevPCjgxsFLZwz2Ov08cDZuR5tohUt0EdwY5SVUg/VdHgz7td4hpZw9+rQR7QcpFiYuHD5W7mV+fa45yD3gbMwvfkWWEY7vXulDLNFE8qMumScNaEKDNBOolQMM4FmpfAQlLNywqQ03MolOJA8HEJrdrUwXEJFOWsOhcFkV6ysAf+knSqfjUM6ZFslU2aBtNIqqH1SagW5zwAs99YmyEZup2jkmPkFs9OG7At/iA3taXH2hFxcS0hXxBa9PdgwNYi2DYR+4g+KHnr1VoDTHOcDTc+fE+bLjZFcdj+Tyejvtz9+PTNSOHbgplzd4Xrp0w==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(82310400026)(36860700016)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mHhS0IERsOjxH8clbXVPUSmoGUiHoNbr6YIdgqP+vHQQcCaWF01OL9nm7TRXO8IuBA0/mKqZ+rKAAq0XmctGLWN471/qOCPRX7dnheRGRspFbBSInnM+sHWZGWK+CNE9eiyzpCWRhwuI+EGoJe+6gWVvVH40RLofVnNrZziYylPqLpNZuqfmdY3WqGAHv12wzMjvOim0xjZwOnLTrBDnBpXKwUAKVaurJu0T0VVNqYKnQvfOESFCXYXT3oLLdSgsi8jPXc99I0cQLtPQUxF9Fp+0ExHrfjtVqm4fOxJBUypoONzXPEM2ytS5V09r223qGzrcgQ8alYa2edipwh/OB+jLHZkQ+Y7WWWm3c5nUkNbeowIgtwxtg6YqBjX43GBD579eE3jIZOo2OrLMD6HVia42TTSTVdZXkqyf3SFUHBRfJ4bgzSAT8wKneT1cASWp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:20:06.9334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1ad7b6-7201-4f38-56e7-08ded1d1c838
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731

Introduce safe Rust wrappers around struct fwctl_device and
struct fwctl_uctx. This lets Rust drivers register fwctl devices and
implement firmware RPC callbacks through a typed trait interface.

The abstraction keeps lifetime and reference-count handling inside the
wrapper, exposes pinned per-FD user contexts to drivers, and validates the
layout assumptions required by the C fwctl allocation model.

DeviceData is destroyed from the fwctl device release hook, so Rust driver
data is dropped at the same point as the C allocation is released.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/fwctl/Kconfig           |  12 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/fwctl.c            |  17 ++
 rust/helpers/helpers.c          |   3 +-
 rust/kernel/fwctl.rs            | 486 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 6 files changed, 520 insertions(+), 1 deletion(-)
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
index 4488a87223b9..b360bd837569 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -61,10 +61,11 @@
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
index 000000000000..f5f802f5299c
--- /dev/null
+++ b/rust/kernel/fwctl.rs
@@ -0,0 +1,486 @@
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
+    devres::Devres,
+    prelude::*,
+    sync::aref::{
+        ARef,
+        AlwaysRefCounted, //
+    },
+    types::Opaque, //
+};
+use core::{
+    marker::PhantomData,
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
+    /// Driver data embedded alongside the `fwctl_device` allocation.
+    type DeviceData: Send + Sync;
+
+    /// fwctl device type identifier.
+    const DEVICE_TYPE: DeviceType;
+
+    /// Called when a new user context is opened.
+    ///
+    /// Returns a [`PinInit`] initializer for `Self`. The instance is dropped
+    /// automatically when the FD is closed (after [`close`](Self::close)).
+    fn open(device: &Device<Self>) -> impl PinInit<Self, Error>;
+
+    /// Called when the user context is closed.
+    ///
+    /// The driver may perform additional cleanup here that requires access
+    /// to the owning [`Device`]. `Self` is dropped automatically after this
+    /// returns.
+    fn close(_this: Pin<&mut Self>, _device: &Device<Self>) {}
+
+    /// Return device information to userspace.
+    ///
+    /// The default implementation returns no device-specific data.
+    fn info(_this: Pin<&Self>, _device: &Device<Self>) -> Result<KVec<u8>, Error> {
+        Ok(KVec::new())
+    }
+
+    /// Handle a userspace RPC request.
+    fn fw_rpc(
+        this: Pin<&Self>,
+        device: &Device<Self>,
+        scope: RpcScope,
+        rpc_in: &mut [u8],
+    ) -> Result<FwRpcResponse, Error>;
+}
+
+/// A fwctl device with embedded driver data.
+///
+/// `#[repr(C)]` with the `fwctl_device` at offset 0, matching the C
+/// `fwctl_alloc_device()` layout convention.
+///
+/// # Invariants
+///
+/// - `dev` is embedded at offset 0 and is initialised by fwctl.
+/// - The fwctl refcount owns the allocation lifetime.
+/// - `data` is dropped from the fwctl core release hook before `kfree()`.
+#[repr(C)]
+pub struct Device<T: Operations> {
+    dev: Opaque<bindings::fwctl_device>,
+    data: T::DeviceData,
+}
+
+impl<T: Operations> Device<T> {
+    /// Allocate a new fwctl device with embedded driver data.
+    ///
+    /// Returns an [`ARef`] that can be passed to [`Registration::new()`]
+    /// to make the device visible to userspace. The caller may inspect or
+    /// configure the device between allocation and registration.
+    pub fn new(
+        parent: &device::Device<device::Bound>,
+        data: impl PinInit<T::DeviceData, Error>,
+    ) -> Result<ARef<Self>> {
+        const_assert!(
+            core::mem::offset_of!(Self, dev) == 0,
+            "struct fwctl_device must be at offset 0"
+        );
+
+        let ops = core::ptr::from_ref::<bindings::fwctl_ops>(&VTable::<T>::VTABLE).cast_mut();
+
+        // SAFETY: `ops` is static, `parent` is bound, and `size` includes the
+        // offset-0 `fwctl_device` plus `DeviceData`.
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
+        // SAFETY: `this` points to the allocation just returned by fwctl.
+        let data_ptr = unsafe { core::ptr::addr_of_mut!((*this).data) };
+        // SAFETY: `data_ptr` addresses the uninitialised tail data.
+        unsafe { data.__pinned_init(data_ptr) }.inspect_err(|_| {
+            // SAFETY: `raw` still owns the initial reference.
+            unsafe { bindings::fwctl_put(raw) };
+        })?;
+
+        // SAFETY: `raw` is a live fwctl_device allocated above.
+        unsafe { (*raw).release_data = Some(Self::release_data_callback) };
+
+        // SAFETY: `raw` owns the initial reference and `DeviceData` is ready.
+        Ok(unsafe { ARef::from_raw(NonNull::new(raw.cast::<Self>()).ok_or(ENOMEM)?) })
+    }
+
+    /// Returns a reference to the embedded driver data.
+    pub fn data(&self) -> &T::DeviceData {
+        &self.data
+    }
+
+    fn as_raw(&self) -> *mut bindings::fwctl_device {
+        self.dev.get()
+    }
+
+    /// # Safety
+    ///
+    /// `raw` must point to an offset-0 `fwctl_device` embedded in `Device<T>`.
+    /// fwctl calls this exactly once from the device release path.
+    unsafe extern "C" fn release_data_callback(raw: *mut bindings::fwctl_device) {
+        let this = raw.cast::<Self>();
+
+        // SAFETY: fwctl invokes this callback once during the final device
+        // release, before freeing the allocation.
+        unsafe { core::ptr::drop_in_place(core::ptr::addr_of_mut!((*this).data)) };
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
+    /// Returns the parent device.
+    ///
+    /// The parent is guaranteed to be bound while any fwctl callback is
+    /// running (ensured by the `registration_lock` read lock on the ioctl
+    /// path and by `Devres` on the teardown path).
+    pub fn parent(&self) -> &device::Device<device::Bound> {
+        // SAFETY: fwctl sets the parent during allocation.
+        let parent_dev = unsafe { (*self.as_raw()).dev.parent };
+        // SAFETY: The parent stays live while fwctl ops run.
+        let dev: &device::Device = unsafe { device::Device::from_raw(parent_dev) };
+        // SAFETY: Devres teardown keeps the parent bound here.
+        unsafe { dev.as_bound() }
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
+// SAFETY: `Device<T>` is refcounted by the fwctl core and may be released from
+// any thread. The embedded driver data is `Send`.
+unsafe impl<T: Operations> Send for Device<T> {}
+
+// SAFETY: Shared access to the embedded `fwctl_device` is protected by the
+// fwctl core, and the embedded driver data is `Sync`.
+unsafe impl<T: Operations> Sync for Device<T> {}
+
+/// A registered fwctl device.
+///
+/// Must live inside a [`Devres`] to guarantee that [`fwctl_unregister`] runs
+/// before the parent driver unbinds. `Devres` prevents the `Registration`
+/// from being moved to a context that could outlive the parent device.
+///
+/// On drop the device is unregistered (all user contexts are closed and
+/// `ops` is set to `NULL`) and the [`ARef`] is released.
+///
+/// [`fwctl_unregister`]: srctree/drivers/fwctl/main.c
+pub struct Registration<T: Operations> {
+    dev: ARef<Device<T>>,
+}
+
+impl<T: Operations> Registration<T> {
+    /// Register a previously allocated fwctl device.
+    pub fn new<'a>(
+        parent: &'a device::Device<device::Bound>,
+        dev: &'a Device<T>,
+    ) -> impl PinInit<Devres<Self>, Error> + 'a {
+        pin_init::pin_init_scope(move || {
+            // SAFETY: `dev` is a valid fwctl_device backed by an ARef.
+            let ret = unsafe { bindings::fwctl_register(dev.as_raw()) };
+            if ret != 0 {
+                return Err(Error::from_errno(ret));
+            }
+
+            Ok(Devres::new(parent, Self { dev: dev.into() }))
+        })
+    }
+}
+
+impl<T: Operations> Drop for Registration<T> {
+    fn drop(&mut self) {
+        // SAFETY: `Registration` lives inside a `Devres`, which guarantees
+        // that drop runs while the parent device is still bound.
+        unsafe { bindings::fwctl_unregister(self.dev.as_raw()) };
+        // ARef<Device<T>> is dropped after this, calling fwctl_put.
+    }
+}
+
+// SAFETY: `Registration` can be sent between threads; the underlying
+// fwctl_device uses internal locking.
+unsafe impl<T: Operations> Send for Registration<T> {}
+
+// SAFETY: `Registration` provides no mutable access; the underlying
+// fwctl_device is protected by internal locking.
+unsafe impl<T: Operations> Sync for Registration<T> {}
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
+        let initializer = T::open(device);
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
+        // SAFETY: close is called for an opened Rust user context.
+        let ctx = unsafe { UserCtx::<T>::from_raw_mut(uctx) };
+
+        {
+            // SAFETY: fwctl never moves an opened user context.
+            let pinned = unsafe { Pin::new_unchecked(&mut ctx.uctx) };
+            T::close(pinned, device);
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
+        // SAFETY: fwctl never moves an opened user context.
+        let pinned = unsafe { Pin::new_unchecked(&ctx.uctx) };
+
+        match T::info(pinned, device) {
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
+        // SAFETY: fwctl passes a valid in/out buffer for this callback.
+        let rpc_in_slice: &mut [u8] =
+            unsafe { slice::from_raw_parts_mut(rpc_in.cast::<u8>(), in_len) };
+
+        // SAFETY: fwctl never moves an opened user context.
+        let pinned = unsafe { Pin::new_unchecked(&ctx.uctx) };
+
+        match T::fw_rpc(pinned, device, scope, rpc_in_slice) {
+            Ok(FwRpcResponse::InPlace(len)) => {
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
index b72b2fbe046d..ee0ae6d9f1dd 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -72,6 +72,8 @@
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

