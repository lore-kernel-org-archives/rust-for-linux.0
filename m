Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AF048986A;
	Thu, 13 Aug 2026 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634653; cv=fail; b=BV4Ad8lYoK4oZ/cZOVHaHFALYjiLr6pUkYCGbp9yCxvnoTM3zz8BMTcSM38dMcrlzr79WcuqAFl0cq2fggEaTeU/Fpk2a/QqWcEK/5GsLRxKRaG+6xWsP9scQa0DIygVNu/mDIXiqv8vwNjj60oyu8gC2xHRANjd3Ds4YTmdu1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634653; c=relaxed/simple;
	bh=5HsslXC+kDVxjVOVdttsmPYL0M0VZHN07yAUvQzRjeI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bsWlA+mg91BnhorK08jVhzdZW4ny7h3fEHb6kS5qctmMNwyJ2+ywH9P4qK4GZM0uhLsuDIBbDlOhBcqxCpQKNK79C/jTcFJZDfd39neZkCasIExhgTtb1838M85f6mT67J6/WxoT9ErizFHDZJaEoHzXyQOIyBIF/T/imeYwhUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mp+wwm4b; arc=fail smtp.client-ip=52.101.62.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mp+wwm4b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUvQnOGiWmYYNnNwdknSuIkClb6WIz8Dhye55XzWltacNL7jolPktpfvpXMAyl7J141weIJQtM5iZhDiSM/e8HSTXpJlRvuN7UM3yG7dbIEWBTUb05rLI+GEKr5FJSujheVTn/AH6eH1LPfTtvOsaGOXSb2s9oYSA8nj93Tu7XO/V19sep9s4s4m4RbhbbJtMYfBbFgnmAc8wTzgLVWIxFK+JoKhU/ybyccteKnR6E7j45IpF6v89am71Sr7MWMBKGfFcEbTK/DWJp5+5yQS9Fo4ocgMIigMyTl4d/Mkiu07NcbmbrVFirfKyUhrCOUH+b1n0KFwZEF0jB9F+vpbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2r1kMtmNtrZM5Jdwr85owgQycpqJdjRzW57MBOc1/pI=;
 b=m/iM8j8mV6HiDhlZmcGf94VGOehwB28WclWpzEjGkRqg1ygLnDQbfKH3uAV2jKB8FA5GHdwMR9WBbnHk7fJR7PAVgVCBPiBbrdjxn3PW9ZvavOl3HarXBaEtl5oZwmSbZTBaxd8HXyDrVul+LgyIlAy7BZ0n7Y9s1BCRbbNc64VqhXA7i0zO2ABmXDGUkmYt7kHgNkSwqB/KK+YzkmrTu5SK9ksIg/kmx9NhaNV4twQzuh2tVU7zVqpnh81PU5wJjPTuAudfMk5qh4GXDjazwoNl4twy/e0tRDfHCvi2H1ttFKTvrnc1/QaiDJwrgpyF8o/6q5zf8fQRfGo5iwj4Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2r1kMtmNtrZM5Jdwr85owgQycpqJdjRzW57MBOc1/pI=;
 b=mp+wwm4b5S2XcY5fkFzaYySD32Cw7GtCaErok/0zXeo1xUj+Yw/lrsXCd+5uhS5SZmkV33AGyh6Xh/t9bPH8ZVQ6sEFEuV3ZwwD4EaMQxnqJVG1QFobvOwZgSbdT8gcxjzr+XASw/YyMnXOlMG5HGhFSByh2AnxE9XBBmQl7ZeRSUtRhgQrhKFLlm1YDOz8NXbbWPfef7MDeEq8XtPy/cHrAgQ6VEVgfKktOydEBEsvrsT2M0FlE9joGbYo+4634m6QhH3l6YX9QAzF0E3Y2ZFXibnJASOyvbzLKZ+YDaScLXDj5P8ml1m85k0mTqa1tt7NbE56OA0WdJFWMrfzuTg==
Received: from CH2PR18CA0008.namprd18.prod.outlook.com (2603:10b6:610:4f::18)
 by PH7PR12MB6612.namprd12.prod.outlook.com (2603:10b6:510:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 15:23:58 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::6f) by CH2PR18CA0008.outlook.office365.com
 (2603:10b6:610:4f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Thu,
 13 Aug 2026 15:23:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 15:23:56 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 13 Aug
 2026 08:23:29 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 13 Aug 2026 08:23:28 -0700
Received: from inno-dell.tail1d44c7.ts.net (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 13 Aug 2026 08:23:21 -0700
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
	<acourbot@nvidia.com>, <jhubbard@nvidia.com>, <zhiw@nvidia.com>,
	<zhiwang@kernel.org>, <daniel.almeida@collabora.com>
Subject: [PATCH v8 1/1] rust: introduce abstractions for fwctl
Date: Thu, 13 Aug 2026 18:23:12 +0300
Message-ID: <20260813152312.1311142-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813152312.1311142-1-zhiw@nvidia.com>
References: <20260813152312.1311142-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|PH7PR12MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 42467ae6-0cf2-42b2-bbfd-08def94ee491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|13003099007|6133799003|10067099003|11063799006|5023799004|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	MSGFNvdRXQqbxNd0e2VSNphm2hYWb/SjPHorqNg4gYHZPkCbf/U3KOM7+dTtIC0IW2kCjW5O+UsKWzDxz/lwmGXub35VL0nsRJ13P3vyOWdKUblUYzJWKR/xQk3LKqm2/I8vlLmRjPYjbUlD51sc0FEKfQ8Dc4+/flXBkH/OvUhLiSsLDTSgXJyulw8qyjcCPYhk8LEJZGviG/2++LQbz8Na92MM3ezWGDVKMVieGsJmdIYVKTP4Z+bGaDCtkxfNbI/wMKhYGILY9t8VLK+1cNZaQE4CSSfJVxm7JhsTK5u/GhMJVEE5yGh5ZQaRmuYXzKn1QsVJarM2LVjqYOdQBPO8XPQKarEilPt6pqvOIHTLMyC7N/uvFAIZf7kQp/GM2k/sA4J8FslzpjcdIchTFWcBgbc1MkBVrxHTaLP1fpBGNCMDOhijLG2sqx3u4k+dbXdheK/paazo+7b5GUT9BFrZ3MkaWtc99ikyhQqnRtMG7T8g2DkxhaulJxAjVTRtoSMheBv/UJ7+FMrp26U/IYyCinIEssgHwPOTYxrAKGJDvoM6pFKeLIHX+/Nem3YvLovknsZopgUyOPg2iig5XBpJG4RH0ciZCqDxQPAqpIVfmyYtSWGi+ZvqgXKL3RyiRH/ynWKZVq6Kc1lUcLif9sV9BXM5z8J7qOb8NL1m8ceg5StTu+Kcd7nMWNVLxuoq+wAZm2BLDosj4BoJYLTg7A==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(13003099007)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mLNHi1CPd8QPPXIgvUwQ5XqMOBb31Qa6eAlNxQI9lZbJ73i3kML51kBO/Ui+G2Tq/SUUoh3nK6+SdHL4JsHxIkBgI6xUpD2okxjzJ+6pVij3AKRhlkpC/U3VXS2pUT/gJOVlU8bJCqK1pqOq1L/nSfeaTYMeN7S/ek/HHMfh6tVl/w8C3cjdlkkYR2uJVE4mFg2wTMUo2fFgpgABxVDFkwmBiKoTBvnCuD7qMG/4xgTy+NaKqbmDbRwXYPYsh4wNJGDbBru31ZOQNFNZr/uCrHVHDTMOp5XCAslELU6VHSN8k/m99CE+HsOr9jxYWSo6O47jPbPXkb6kOZRk/uuQyQu9585uq2uz6DhXGq9EyMuuI8F2KN2qXxEVrw4+ELwN+Z1ZEm2b5uCmpIei+OM0E04ELAuEvV47WCi+g7/VfxFe91qtUZtpsA0Z481T9xgQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 15:23:56.8844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42467ae6-0cf2-42b2-bbfd-08def94ee491
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6612

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

Add the Rust sources to the FWCTL MAINTAINERS entry and add myself as the
maintainer for the Rust abstractions.

Co-developed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/r/DJJW7X4ESDSM.QCVYK2FC7ZR3@kernel.org
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 MAINTAINERS                     |   3 +
 drivers/fwctl/Kconfig           |  12 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/fwctl.c            |  17 +
 rust/helpers/helpers.c          |   3 +-
 rust/kernel/fwctl.rs            | 593 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 7 files changed, 630 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/fwctl.c
 create mode 100644 rust/kernel/fwctl.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 5114e6db7307..bf487b8b8e9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10737,12 +10737,15 @@ FWCTL SUBSYSTEM
 M:	Dave Jiang <dave.jiang@intel.com>
 M:	Jason Gunthorpe <jgg@nvidia.com>
 M:	Saeed Mahameed <saeedm@nvidia.com>
+M:	Zhi Wang <zhiw@nvidia.com> (RUST)
 R:	Jonathan Cameron <jic23@kernel.org>
 S:	Maintained
 F:	Documentation/userspace-api/fwctl/
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
index 000000000000..e6a8513a47d0
--- /dev/null
+++ b/rust/kernel/fwctl.rs
@@ -0,0 +1,593 @@
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
+    ///
+    /// The callback returns `EINVAL` if the output length exceeds the input buffer length.
+    InPlace(usize),
+    /// Return a newly allocated buffer as the output.
+    NewBuffer(KVVec<u8>),
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
+/// - `registration_data` is either [`NonNull::dangling()`] (before registration / after
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
+    /// Returns the underlying `fwctl_device` pointer.
+    #[inline]
+    fn as_raw(&self) -> *mut bindings::fwctl_device {
+        self.dev.get()
+    }
+
+    /// Borrows a Rust fwctl device from its raw C pointer.
+    ///
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
+    /// Borrows a pinned Rust user context from its raw C pointer.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must point to a `fwctl_uctx` embedded in a live, pinned `UserCtx<T>` that remains
+    /// valid and does not move for the duration of `'a`.
+    #[inline]
+    unsafe fn from_raw<'a>(ptr: *mut bindings::fwctl_uctx) -> Pin<&'a Self> {
+        // SAFETY: The caller upholds the `UserCtx<T>` embedding, lifetime, and pinning invariants.
+        unsafe { Pin::new_unchecked(&*container_of!(Opaque::cast_from(ptr), Self, fwctl_uctx)) }
+    }
+
+    /// Mutably borrows a pinned Rust user context from its raw C pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must point to a `fwctl_uctx` embedded in a live, pinned `UserCtx<T>` that remains
+    ///   valid and does not move for the duration of `'a`.
+    /// - The caller must ensure exclusive access to the `UserCtx<T>` for the duration of `'a`.
+    #[inline]
+    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::fwctl_uctx) -> Pin<&'a mut Self> {
+        // SAFETY: The caller upholds the embedding, lifetime, pinning, and exclusivity invariants.
+        unsafe {
+            Pin::new_unchecked(
+                &mut *container_of!(Opaque::cast_from(ptr), Self, fwctl_uctx).cast_mut(),
+            )
+        }
+    }
+
+    /// Returns a reference to the fwctl [`Device`] that owns this context.
+    #[inline]
+    fn device(self: Pin<&Self>) -> &Device<T> {
+        // SAFETY: fwctl initialises this pointer before any driver callback.
+        let raw_fwctl = unsafe { (*self.fwctl_uctx.get()).fwctl };
+        // SAFETY: Rust fwctl devices use the offset-0 `Device<T>` layout.
+        unsafe { Device::from_raw(raw_fwctl) }
+    }
+
+    /// Returns a pinned reference to the driver context.
+    #[inline]
+    fn uctx(self: Pin<&Self>) -> Pin<&T> {
+        ::pin_init::assert_pinned!(UserCtx<T>, uctx, T, inline);
+
+        // SAFETY: `uctx` is structurally pinned.
+        unsafe { self.map_unchecked(|ctx| &ctx.uctx) }
+    }
+}
+
+/// Static vtable mapping Rust trait methods to C callbacks.
+struct VTable<T: Operations>(PhantomData<T>);
+
+impl<T: Operations> VTable<T> {
+    /// The fwctl operations vtable for this driver type.
+    const VTABLE: bindings::fwctl_ops = bindings::fwctl_ops {
+        // CAST: `DeviceType` has the same `u32` representation as the C enum field.
+        device_type: T::DEVICE_TYPE as u32,
+        uctx_size: kmalloc_aligned_size::<UserCtx<T>>(),
+        open_uctx: Some(Self::open_uctx_callback),
+        close_uctx: Some(Self::close_uctx_callback),
+        info: Some(Self::info_callback),
+        fw_rpc: Some(Self::fw_rpc_callback),
+    };
+
+    /// Initialises a newly opened Rust user context.
+    ///
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
+    /// Closes and drops an opened Rust user context.
+    ///
+    /// # Safety
+    ///
+    /// `uctx` must point to a fully initialised `UserCtx<T>`.
+    unsafe extern "C" fn close_uctx_callback(uctx: *mut bindings::fwctl_uctx) {
+        // SAFETY: fwctl keeps the owning device live for this callback.
+        let device = unsafe { Device::<T>::from_raw((*uctx).fwctl) };
+
+        // SAFETY: close is called for an opened Rust user context.
+        let mut ctx = unsafe { UserCtx::<T>::from_raw_mut(uctx) };
+
+        // SAFETY: `close_uctx` is called under `registration_lock` write (from
+        // `fwctl_unregister`) or read (from `fwctl_fops_release`), so the device is registered.
+        unsafe {
+            device.with_registration_data(|device, reg_data| {
+                T::close(ctx.as_mut().project().uctx, device, reg_data);
+            });
+        }
+
+        // SAFETY: close is the last callback before fwctl frees the allocation.
+        unsafe { core::ptr::drop_in_place(ctx.project().uctx.get_unchecked_mut()) };
+    }
+
+    /// Returns device-specific information for an opened Rust user context.
+    ///
+    /// # Safety
+    ///
+    /// - `uctx` must point to a fully initialised `UserCtx<T>`.
+    /// - `length` must be a valid pointer.
+    unsafe extern "C" fn info_callback(
+        uctx: *mut bindings::fwctl_uctx,
+        length: *mut usize,
+    ) -> *mut ffi::c_void {
+        // SAFETY: info is called for an opened Rust user context.
+        let ctx = unsafe { UserCtx::<T>::from_raw(uctx) };
+        let device = ctx.device();
+
+        // SAFETY: `info` is called under `registration_lock` read, so the device is registered.
+        let result = unsafe {
+            device.with_registration_data(|device, reg_data| T::info(ctx.uctx(), device, reg_data))
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
+    /// Dispatches a firmware RPC for an opened Rust user context.
+    ///
+    /// # Safety
+    ///
+    /// - `uctx` must point to a fully initialised `UserCtx<T>`.
+    /// - `rpc_in` must be valid, initialised, and exclusively accessible for `in_len` bytes.
+    /// - `out_len` must be valid for reading and writing an initialised `usize`.
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
+        // SAFETY: `out_len` points to an initialised `usize` supplied by fwctl.
+        let max_output_len = unsafe { *out_len };
+
+        // SAFETY: RPC is called for an opened Rust user context.
+        let ctx = unsafe { UserCtx::<T>::from_raw(uctx) };
+        let device = ctx.device();
+
+        // SAFETY: fwctl passes an exclusively owned buffer that is valid and initialised for
+        // `in_len` bytes. It remains live for the duration of this callback.
+        let rpc_buf = unsafe { slice::from_raw_parts_mut(rpc_in.cast::<u8>(), in_len) };
+
+        // SAFETY: `fw_rpc` is called under `registration_lock` read, so the device is registered.
+        let result = unsafe {
+            device.with_registration_data(|device, reg_data| {
+                T::fw_rpc(ctx.uctx(), device, reg_data, scope, rpc_buf, max_output_len)
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
2.53.0

