Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2180C3B992A;
	Mon, 29 Jun 2026 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729616; cv=fail; b=nGL/3YmGuwp1kmAsiDt1j0V7gHeNNKdaMpxLF8QoQ6iecoc8T1WWr4sBDJ1NACZf5WOkPMTxfB8k9wb7jleyXaYmWGd+TkJVXNzDfPgP+jJAO4JZEFKI8LtFRhHULBGAiHBYaDql+2Ei7mhbKR6dI3kNUembPMMKDJlWoKkHHo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729616; c=relaxed/simple;
	bh=w+5RKyBgQ+C47nPzSxZf1gKvk35BV0wXKX/75n1PwIY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GqlejsZICByEB7QJQadbj3kfB4kCbZ34juIu0eK9thXXy3puv650VhbkDPR8Lr+SnTQ6OTTfOdIvDmysufS1E6u76wv6j76ISEBw9Mw9s8jJnPPxVa+DXRZU8QRxFMyp6mh3ADATFmZqLYC66BYWiYVn9T8SuGlfjo4wYbO4Tdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FDpqHbfP; arc=fail smtp.client-ip=40.107.208.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FDpqHbfP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gxjma0LAD+YU5F3ESQK+1GQFHibPK+Yu5jU4GHC1VA8RQ/ONwil4C8ZWsLSecpS4nwOn3k6EltK30X/R9L0sXlomVl1hn8HtjjNkUHS1iCtQaw6lv9kqZLwrUUcOlt5c+TtRLtN0aEmWLtZDHHJ2yIBg/ZWW8NTHvw9BgBn9J6KiYgBW20ksBP+EYIiWDLBaJuZc9YB5ITi4aH4WN4KPPmENrc8HCiN755Km3OoPLO19mgEeidGTBK4yslVQN80LRV9N19zRlkprvm3ArcYGx8O40PaZ3vF0NRFVia7oUysYe4mv8o1hha/XY8PkAnOUn9O01zMenXD0GXTzHPGJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+LlEyPa7CVaT+obj4TZNUohvgfqaCVhyMXyY8/X22I=;
 b=LnL6C+K1xuzpyBQ4uDqiXXDpsN55hhQvLdnjF3l2jywZbUYVjvvHnaz6k8AwVJaE7sz78MLSJ/zIRuU9YCRR9jkW4N6rPcdMAz64L/ZObIsg8GW4jjfyIotS9DLqlHFyAsDbY0PxHCYbQBtOBo58kCpovPi6UYRToqSd1ghtne6G29dE9kN6Aupx7DFmZHEuju8hysWXkfkwaH2H3S2SxNlItLsln5NS2q3J1nNaRkArzu3W9H70I8Pn6m7QxeGuHzVz7ojwNsGNqnDIrqqaupdsI0B0/kttbQBEBFTZTAXJWF3E5P8DmScPo8uXjNi/RzPGHBIXpEE4sNPDjBSp2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+LlEyPa7CVaT+obj4TZNUohvgfqaCVhyMXyY8/X22I=;
 b=FDpqHbfPEXiWahA9H507QcRCgtKfcP43GW14n+d/eL4y588TuAeVsrMvRfePFAZH4tF0yhjUG8QfEaIfW8ow7nYPPoO+GlLTD8gy1i6KIogfGlIfuaRxh1ZxtcRFseNV+pABoVmxZGgZ/oaZnkTLvZ8uJG5ho2HEtIbh2yNgvLoV+ml7ubEUHMJCIW7gXuflVXcjAbuFlJ9lOoVDnavakfs1eRzwFvXcem1IrG9B5Vf3VwG7KpBqzxXmWZGPzMRFkneod1ZivFDDy9KRZiZPF57iQNN2PSlSRVtG1majc2Nlfe8x/g4gGg1uoIgFtXqfwBgve+09rEH/hfd9b0zvEg==
Received: from BN0PR08CA0012.namprd08.prod.outlook.com (2603:10b6:408:142::34)
 by PH7PR12MB7113.namprd12.prod.outlook.com (2603:10b6:510:1ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Mon, 29 Jun
 2026 10:40:09 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:142:cafe::1d) by BN0PR08CA0012.outlook.office365.com
 (2603:10b6:408:142::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:40:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Mon, 29 Jun 2026 10:40:09 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 03:39:56 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 03:39:55 -0700
Received: from inno-dell.home (10.127.8.12) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Mon, 29
 Jun 2026 03:39:48 -0700
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
Subject: [PATCH v5 0/1] rust: introduce abstractions for fwctl
Date: Mon, 29 Jun 2026 13:39:45 +0300
Message-ID: <20260629103946.3117152-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|PH7PR12MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: fdab9572-0de9-46f1-69f8-08ded5cacac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|7416014|1800799024|6133799003|18002099003|56012099006|11063799006|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	StcelxL4LP3CxGItTlCxuIjBc73mHSKFlfW8CXxvfYakWVZrJURyqgoBS4eyzAv/AZY4hO0KyTt4X6hlqb0CXPbs1jMEih1ywuWJ7PD34+7RaIbasr5byo0AIrYPvWtsEO0J3Ai6IwzFCDEI93NT+0Apyh9WlGJYLwRtbuxVkHQTwk7f3xBJz5afxqDwwjJ32nWMka0Q+Bc20T2VX4uw3ogge3BBsc6mPBJhs/bMEhsjCWfEgOKOfFYBhC7bgbQze8PeQttqKySw5N2xPa+K+ww4VK9ZXAZYEcYyzxqaR2Dm6YBqATxRV4TNMeIwnRnlqW/K+eFSDWt8maLq5VlqOQ57W/h4JCJ0UrBVBauNt+fwaSJaVkoVCCBhqRpAYdBCIyffLNzM96j8QALR48EW3zIkFUA29qJzPvI13ZG6ZucOrx8YT0m0CBvuJgRY9v5YnVf+NP73KdottaBkxBO+yv3O381oXRvE5SEH2cmGdIOASxuSc65gIWhkon/cZMK5mtKbYzci2Q6Dsf6EJmwl2GmjXuRNzxZemaLi33lMXYeEYnMhCpxCFSUGNaOhcF/kIiWtuelDd3bxVsIAzWljdS01zUQgPBHcBHrl0NGYKq3lsLNu/eDMvXAdVoLnmslVRjFLgwtlyTwzKgzjz2yjzg0FN0O8VXI+sfusR4e8QCGHnzIcmnew+N9NnRsdQEN72b+ICPQrk5pXhEEMiHGWww==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(7416014)(1800799024)(6133799003)(18002099003)(56012099006)(11063799006)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QLxLN3wx9oaKwOWDSv/T6X0E3rb/mvXbybKAq2OoYJQgZu4JkbXzbKxIvOjhtJMFyOl71aw8HPeXL5O9fud29kfyGAJlxjBsWb0Be1ACsrO0grnGRueRwWL6Z+UNcMUT7Wi4hUhxLkUFjpOZQtgRIppPHVnDSVVvOkJrGQ8ptCACHC8ssQBdWNOVqX/2El5D6uxaJX9MSMbr/zhgibIRF8fYQdZjtmVQzWlFfORnrvKbsr1exu9ysk9m8sKXR/POKkTefTe6qAfYYQ448Rmgf+BjJ1+pcHH5sXbHZw8exEppLw3r5PNYWZiqtyVpZpkQlHxfLUED8+Y6ol4EkDwH49nI003deqv0iNtPcaKdT9M7YJSd3+H/wyedbge9RTt7Hv8j+8WZmNFgBdPBZg0+MqU90dYiNi6g3wBGI3umXQ3FnddHyWnf+jg3Hq4Y8nVD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:40:09.3327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdab9572-0de9-46f1-69f8-08ded5cacac5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7113

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
data and ties it to the parent device binding lifetime through Danilo's
higher-ranked lifetime model. `Device<T>` remains the refcounted fwctl object,
while callbacks borrow registration data for the callback lifetime.

The Rust fwctl module allows Rust drivers to integrate with the existing
C-side fwctl core through a typed trait interface. It provides:

  - `Operations` trait: defines driver-specific callbacks: `open()`,
    `close()`, `info()`, and `fw_rpc()`. The implementing type itself
    serves as the per-FD user context, one instance per open().

  - `RegistrationData`: a `ForLt` associated type owned by `Registration`
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

Link to v4: [2]

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

Link to v3: [3]

v3:

Quite some updates in this version. Here you can find the example
nova-core fwctl driver [4]. The interface is still WIP so it is just to
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
[2] https://lore.kernel.org/all/20260624091758.1678092-1-zhiw@nvidia.com/
[3] https://lore.kernel.org/all/20260217204909.211793-1-zhiw@nvidia.com/
[4] https://github.com/zhiwang-nvidia/nova-core/commit/2068da7e8caf58da9584b0aa6c81fed8f547d59f

Zhi Wang (1):
  rust: introduce abstractions for fwctl

 drivers/fwctl/Kconfig           |  12 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/fwctl.c            |  17 +
 rust/helpers/helpers.c          |   3 +-
 rust/kernel/fwctl.rs            | 540 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 6 files changed, 574 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/fwctl.c
 create mode 100644 rust/kernel/fwctl.rs

-- 
2.51.0

