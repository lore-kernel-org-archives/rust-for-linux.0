Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010070.outbound.protection.outlook.com [52.101.193.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11C337B023;
	Mon, 29 Jun 2026 15:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745362; cv=fail; b=ONtCiSfZOuUzrS9fosnR5ZWUwbxR95rjvVfBHPI0JBYPtxBqYRJt0mge06DV8nBfuwg7K2FJ7+PzLQp7snXIhGSzdoD/dtJ1V9d6vekBBKa9R0ukigBroLZnElZTjci633OdlSTgJqZRhggZEK/EuYzbv12obbMi8r8kPQ7mLpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745362; c=relaxed/simple;
	bh=Jxa1zxjE0xhgr20T5qiKD9LuiIC28VOzvXNEiAyvJk8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gdpGVB+yQA9i3BpIyvwwRVGxnRiZPyivWTCH7z6KDSo12in9qPtBclKhJ++Jf47pFdC2ZnUOHcJDQ+309cytFGUQivZeSoBF20OifKkGCjHtVYtpK655JSmJl0RTlGCTrsMzK4CmHPZfGLkIFzCMLqeVL6goWcOw2BDdK5oCdbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f/EwyD1I; arc=fail smtp.client-ip=52.101.193.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f/EwyD1I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uy+HklpsPUwOBlfwk4FkCJrgFw79RyZD/P2LoRcMSodxkvV9+LB0iHaLTYUWsiMxkerqEUoY75ikGhS2n3/LeD8Waen7+G18Eekp0hm2i4ct54MtjZTcJ5Mh/36Ce7NEAZUaMxJp4Mn3jb324kmUTWBlTQwEOTBi91hxhmk/mPM+owYkgGGINEdae6sqO73HZk25sQCn8+5HqLalgbA/LOrlbfoymRt9W0+y5gOIisqNuF0mzXqX+0zXz9iT5K6UuTp5wqISncpJnSv7udwthNUggHC1lzAhMIhO/aDNhZdJk58LTZiMOXJQgXFIoLFHDNowzkiND2qfHrkXt+cgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELP7atZhGOyHi57CFlKz82dOzrAvw/+x7Xb8mdHLTK8=;
 b=TnlrTU66wR+MrWwGCCYQSetYIK5Pn+hEtaVEqrb6SLXLpb2LApAc9WWc8b1sndzWmZIVUot8GEIltdHQa5iicV2iLUa6UWVovWnlitNdRaGXfY4RPYd8SzLyNTs12alujuiWaMVfmR4NIIPhvn4fzkerNSQiCVxUVI9kUniHmCpmmRkHaRwUFAS1XKW3W47+ty8LoVWiG0g4PTHds2OW5awAYM+7nRGBkZ9JNYLOmweiec0Wh673bWURdv0YpoDEjFt9zih58mxaD9ucShDurVVqEf/6thSyiuwB9Ape60hC/R4XoSf+vSjvwiZlzKE8FiL96lwFRQfP8T9HLG5sjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELP7atZhGOyHi57CFlKz82dOzrAvw/+x7Xb8mdHLTK8=;
 b=f/EwyD1Is1ez5MOvTo70EGgZqg5j5V8SmHeTAFp9CsJ78kChxH2uPIzC7e5035c1wvK5PHIHiW21agIoU/bsCZuETTU1t5gGMW6rkLr8Bi+N1fv+DbouvNtwDqqpArwXg+DvlSAm8ncalbvKrJWBbK8wY9wWrjZLAfxT3ns6c1c+gBjn6rgHU4GQFUKFaE1j3fVM9Xe4ggXYQJWCaFPOqPdfNv1lLh9wNVTAhYTrS2f+ROcCeGKis/wczhitLsUxOPSb1FsdMI0UvSvuHvgDsfUMFJQNqpJBhqWGlPmlU7QLThWQZlkLpTbJoXx9TtgaX6yWyPHd5IRUTCGYiaJYlQ==
Received: from IA1P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::8)
 by LV3PR12MB9142.namprd12.prod.outlook.com (2603:10b6:408:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:02:31 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:461:cafe::80) by IA1P220CA0002.outlook.office365.com
 (2603:10b6:208:461::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 15:02:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 15:02:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 08:02:06 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 08:02:06 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Mon, 29
 Jun 2026 08:01:58 -0700
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
Subject: [PATCH v6 0/1] rust: introduce abstractions for fwctl
Date: Mon, 29 Jun 2026 18:01:55 +0300
Message-ID: <20260629150156.3169384-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|LV3PR12MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: d028e731-6c10-4ae9-dab0-08ded5ef7187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|7416014|82310400026|18002099003|13003099007|6133799003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	DLuqpooIr0YghXvzjqJgAffZPBKOAvoUVWCuhg0amSdXzVi27QoYgdDOgbQ2x8eMVAJ8naDPV4a/J51OM/wRHPqjXAPyvOw6KmoxO6HoUmZFQD2cPOGwK5WL9GOo2bdI++S0hpcu0nL5RXxNqN6A3yEhtjbiSZu3hJdaa/Z/cN0U4h+gbCknLOjXlZziS4TReWM1N5Twl/r51PmtEO7BMgUSvQsCnxuV3htMpLlXxGt7rYE0wNRVyl58FNqrits3fDm5/qi33rhhbGayt1H1U38LNV0Pq8+JWhGihS45OlGZI951I7RZ33OWr6Qf5MliX8b2rylq0Nz2XlPI7zBqgYmwOG5XwBhrc589ANJXXuO77QSARPUWgaFcOiyEBANxjAetboG/C3QcwjiB4QOekDfr5b2/DS/sBpMFbfacMwcLS52ba6xbehjGC40Lse62bIVWukSsH2W09afaEfrkOsTxZd9p5ugAadxnaF32zl7EZ8x46ybSXtREBWRdlcL+F+5UTO7CxiLpJuIpvkIMG+UV271GZm+CyvFJ+p+31yb3gkinNUNq175QKxmrE9xgZbYH0lOjBponEMmxXqcTlleHxarkVZ81JKyc6910ohgzZTNN2LreQaW8WOLNR3gbG/zNwZ6vkE1/knJVfawmRqbtQPj5EonRWaLe7+J8IqheuTGBma4sByMmJdAGKQ4cuU1GtPHOej64VPasMzClyg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(7416014)(82310400026)(18002099003)(13003099007)(6133799003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TzmVl9GHYftkX8f3E5Ybfb3DaXhawiHDLkNMIfNcOmKggKqLGx3ywbCf+5WwhIJ4LhtSCG50Zhx7HKGAfC/2lw8bADnKZGaDsCpy4NFOND3zdYggPDmTtppem+6UdGd6UsZGwqN2luJ7lpEoS7mSJEKkBAIV2DLl1piNEtV4s/MRDhNEoO/ILWrE2zk2IMb/hIPiXbMGa1odoCzJdyted/NZnfS/aUWViqlcqMmvrfunUFNxcUPJLaIAEQh4GNoz7doW7fme8DKQ8kEgPEJ8Qm73rlNkScIrJ4+5WpDngLF9AU4juszkUho+SjBO25KEgyvg+Z0az+jSA/ShZBS4Le2iFtAqjUEVzUm62Mqc3G/YciDzyPic5fehZymzgMm+6f1iOapdgiRD5VILYBmSQTvYuRd8V5P1ZYnmC76sG5lMWQ6YMMpG65dBa0rWRLlw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:02:31.0008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d028e731-6c10-4ae9-dab0-08ded5ef7187
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9142

In the NVIDIA vGPU RFC [1], the vGPU type blobs must be provided to the GSP
before userspace can enumerate available vGPU types and create vGPU
instances. The original design relied on the firmware loading interface,
but fwctl is a more natural fit for this use case, as it is designed for
uploading configuration or firmware data required before the device becomes
operational.

This series introduces a Rust abstraction over the fwctl subsystem,
providing safe and idiomatic bindings.

The series is now a single Rust patch. The fwctl core release hook from v4 is
no longer needed. Instead, `Registration` owns the callback-visible driver
data and ties it to the parent device binding lifetime using a GAT on
`Operations`. `Device<T>` remains the refcounted fwctl object, while
callbacks borrow registration data for the callback lifetime.

The Rust fwctl module allows Rust drivers to integrate with the existing
C-side fwctl core through a typed trait interface. It provides:

  - `Operations` trait: defines driver-specific callbacks: `open()`,
    `close()`, `info()`, and `fw_rpc()`. The implementing type itself
    serves as the per-FD user context, one instance per open().

  - `RegistrationData<'a>`: a GAT associated type owned by `Registration`
    and borrowed by callbacks under the fwctl registration lock.

  - `Device<T>`: wraps `struct fwctl_device` and stores the pointer to
    registration-owned driver data used during callbacks.

  - `Registration<T>`: registration and automatic unregistration of
    `struct fwctl_device` objects.

  - `RpcScope` / `FwRpcResponse`: type-safe enums for RPC scope and response
    handling, keeping unsafe pointer manipulation confined to the abstraction
    layer.

`rust/kernel/lib.rs` is updated to conditionally include this module under
`CONFIG_RUST_FWCTL_ABSTRACTIONS`.

v6:

- Use a GAT lifetime for `Operations::RegistrationData<'a>` instead of
  requiring `ForLt`. (Danilo)
- Require `FWCTL=y` for `RUST_FWCTL_ABSTRACTIONS` to avoid a built-in Rust
  abstraction depending on a modular fwctl core.
- Add `#[inline]` to small forwarding helpers.
- Return `EINVAL` for an unrecognized RPC scope instead of the internal
  `ENOTSUPP` errno.

Link to Danilo's GAT diff: [2]
Link to v4: [3]

v5:

- Rebase on top of the current drm-rust-next.
- Adopt Danilo's higher-ranked lifetime model for callback-visible
  registration data.
- Drop the fwctl core release hook patch.
- Reject `FwRpcResponse::InPlace(len)` when `len` is larger than the input
  buffer length.
- Add the missing BNXT fwctl device type to the Rust `DeviceType` enum.
- Document that `Registration::new()` requires an unregistered `Device` with
  no live `Registration`, and no concurrent registration attempt for that
  device.

v4:

- Rebase on top of the current drm-rust-next.
- Split out the fwctl core release hook before the Rust abstraction.
- Drop the fwctl init-ordering change from this series; it is already in
  drm-rust-next as commit a55f80233f38 ("fwctl: Fix class init ordering to
  avoid NULL pointer dereference on device removal").
- Add compile-time layout checks for the embedded `struct fwctl_device` and
  `struct fwctl_uctx` offset assumptions. (Jason)
- Use `const_assert!()` for generic layout assertions. (Zhi)
- Require `Operations` and its `DeviceData` to be `Send + Sync`. (Danilo)
- Pass pinned shared references to `info()` and `fw_rpc()`. (Danilo)
- Make `Operations::open()` return an initializer directly and report open
  failures through the initializer error path. (Danilo)
- Drop `DeviceData` from the fwctl device release hook.
- Fix clippy warnings for raw pointer casts and unsafe blocks. (Danilo)
- Fix the rustdoc broken link warning. (Danilo)

Link to v3: [4]

v3:

Quite some updates in this version. Here you can find the example
nova-core fwctl driver [5]. The interface is still WIP so it is just to
demonstrate the use of the rust fwctl abstractions.

Comments from folks:

- Use an enum for the return of fw_rpc. (Joel)
- Remove FWCTL_DEVICE_TYPE_RUST_FWCTL_TEST together with the sample
  driver. (Jason)
- Remove DeviceType:Error. (Gary)
- Add __rust_helper for fwctl_get/fwctl_put. (Gary)
- Refine the design of the device private data. Now it has a similar
  device private data structure as DRM. (Danilo)
- Separate fwctl alloc and register in the abstractions. (Jason)
- Registration::new() now takes &fwctl::Device<T> and the parent
  &Device<Bound> to align with other class device abstractions. (Danilo)
- Update the Registration SAFETY comments. (Danilo & Jason)
- Take self as per-FD user context in callbacks. (Danilo)
- {open, close}_uctx -> {open, close}(). open() now takes &Device<Self>.
  (Danilo)

Updates from me:

- Introduce enums for fwctl RPC scope.
- Introduce AlwaysRefCounted to avoid hacks after introducing the
  refined flow of device private data.
- Introduce default implementation of close()/info().
- Fix a leak: Drop T::UserCtx in the close_uctx_callback explicitly.

v2:

- Don't open fwctl_put(). Add a rust helper. (Jason/Danilo)
- Wrap Registration with Devres to guarantee proper lifetime management.
  (Jason/Danilo)
- Rename FwctlOps to Operations, FwctlUserCtx to UserCtx, FwctlDevice to
  Device. (Danilo)
- Use fwctl::DeviceType enum instead of raw u32 for DEVICE_TYPE. (Danilo)
- Change fwctl_uctx field in UserCtx to Opaque<bindings::fwctl_uctx> and
  make it private. (Danilo)
- Provide Deref and DerefMut implementations for UserCtx::uctx. (Danilo)
- Add UserCtx::parent_device_from_raw() to simplify parent device access.
- Use cast() and cast_mut() instead of manual pointer casts. (Danilo)
- Implement AlwaysRefCounted for Device and use ARef<Device> in
  Registration. (Danilo)
- Add rust_helper_fwctl_get() for reference counting.
- Improve safety comments for slice::from_raw_parts_mut() in
  fw_rpc_callback. (Danilo)
- Convert imports to vertical style.
- Fix all clippy warnings.

v1:

- Initial submission introducing fwctl Rust abstractions.

[1] https://lore.kernel.org/all/20250903221111.3866249-1-zhiw@nvidia.com/
[2] https://lore.kernel.org/all/DJJW7X4ESDSM.QCVYK2FC7ZR3@kernel.org/
[3] https://lore.kernel.org/all/20260624091758.1678092-1-zhiw@nvidia.com/
[4] https://lore.kernel.org/all/20260217204909.211793-1-zhiw@nvidia.com/
[5] https://github.com/zhiwang-nvidia/nova-core/commit/2068da7e8caf58da9584b0aa6c81fed8f547d59f

Zhi Wang (1):
  rust: introduce abstractions for fwctl

 drivers/fwctl/Kconfig           |  12 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/fwctl.c            |  17 +
 rust/helpers/helpers.c          |   3 +-
 rust/kernel/fwctl.rs            | 546 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 6 files changed, 580 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/fwctl.c
 create mode 100644 rust/kernel/fwctl.rs

-- 
2.51.0

