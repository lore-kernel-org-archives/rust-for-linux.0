Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25943A16BD;
	Wed, 24 Jun 2026 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782292809; cv=fail; b=kShWd+e3gnsHft5PStn6+Kie+i/RbBruT9ltjYim6xbOubCqgO+mwQdeIry/GRGwrF6UYnSVLoWYv0Kqss5i6vXNrLgPHANYPf0v74SzDYAw8KbFSJaY7uwgzlHNDt1Z8vN1f1uo/NNQxP1UchXxz9DXc37uTTdvy1U2rkROKY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782292809; c=relaxed/simple;
	bh=2Urp+fwoY8UI92Xb7H22zvxx7z2pOhTC5JdtusOIY6I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eKfeJaceU27Su5DnOrRylRO4duMIbe1z78narC7FWhMbiozwAu0NBRFomjzprqbLhf0lgDYUym96hEnVawBPDJoTsn6RXN0C/i1mfUTimxwXzPQ1r9N+IgYhFy6YL16WjsklFZCvqfo6+51VIiSySU2YILFKMincuHjuOKHdqUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gHKGsh0H; arc=fail smtp.client-ip=52.101.62.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gHKGsh0H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHEkGDU5C2SxiyNeuXBj9eqpxQHtZ7Ch97oioE6hF/J3mBYQmZYd70kHgb0iD46jBKqD1FHTuICYkdvqaJ0pRV/jx5Nr509T+G6Fpt0cwRF0oSGJLtJChNgDSZ/5H+8MLcAT3DtqCMOjB3Vo73Agbe4XnWIoMaJr1/8s9IyG37mW4lnX70KWppAsPyNQWldilzp6PlQjuGIvAAV+erSuRNfctjDJqMEsXooELVPuASLJeOvAh7w+pZT0t3A8M/5FpIc7oyWbBoKdUOiTfXyEtOrEylxtPhKNoMtLfppTEhujQBoFQUSApQS3sOAuMguYLR41XzH6TeWPh81h6M/+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CHZpqoBVdJae4IG3z/F233ni+FspIPjpnLMWh54e64=;
 b=Pg8zvmo/EjVeWRxX+UMCajK7KXSa3RnOU8CAanA6UUAq41OUJ4Phd5yJLljFb2sSQa/ByaWgvZNF1ikngUJnIzN7uGlbafgkjvqbjUCEqACvq8nsxEngn0k8dSV7WlbwCFUfkNkC75cvFkvpPahbm2MtdkXD1bvKNzJDHQafZXOqhZ3C98o1+W482PtIkzA+pk+phZnAHNa1Sv/gW9z3d+8fY3CFDm21Grg1N3GfC/qID1TKD/5jgmPCXGIQ7H4yq/THIrx1rDmYhjTcFRIca3i4mbh2Fs3CLmj+q6LsXQozBuAOZLl//NEwZmVikdXxLSa8G8TSBztn/2GN7vnaiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CHZpqoBVdJae4IG3z/F233ni+FspIPjpnLMWh54e64=;
 b=gHKGsh0HtWDGCt6gZ+MminJ7m2eLTG3A/psZeTsblECu4VuW/Q1cJjzYM0SgBpYL+GIbOF2PXcgIe4vBzogEdgu++88Cn8dbiu/AOW4ooraXadxN7v0nwZ7GeMHSTDnKUVrPzSm9BhgRL2a0wZtbD9JBlv/IgaOzEUNgW9WHKCno0SVx4HhmRudOnCGb3csif4bbiYoKHwre7WhiM+LNWhxSIPOiR2btxHpNJCkfounwBpXWA/CjolJQl18/VqdxQ5BvOQLZdu3yikd/+EzqANnEroQVvMpHomUWI36l1/yDyNGJbK+feoPIy7Sx9aKzb7OsUxq3JvpsHc74jjiTPA==
Received: from SJ0PR03CA0073.namprd03.prod.outlook.com (2603:10b6:a03:331::18)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 09:19:52 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::14) by SJ0PR03CA0073.outlook.office365.com
 (2603:10b6:a03:331::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 09:19:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 09:19:52 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 24 Jun
 2026 02:19:39 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 24 Jun 2026 02:19:38 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Wed, 24
 Jun 2026 02:19:31 -0700
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
Subject: [PATCH v4 0/2] rust: introduce abstractions for fwctl
Date: Wed, 24 Jun 2026 12:17:56 +0300
Message-ID: <20260624091758.1678092-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|MN0PR12MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3f9e98-648d-4d26-0ab1-08ded1d1bf40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|36860700016|23010399003|13003099007|18002099003|56012099006|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	V61RTW8rNh5U/EX/MUWZ+r1xzKyBRVYb7GrUI4ReqheNCan+gI42DuV5CPg2m44VPCtmPxZTNhyZq72/y5LhcQnvOr4Rb1+YBtit80bZ2LskHvhEk0XWugQnwoax0aMOVj+4jP9zVrPrtQJnfmVypxP1Jyyxc+Ue0H4IXOjNeI84RKhrgY6BH1R9rU0p81UclI0QLaiFSl3zZx65SMDVzd+fYxhvqDuykouVBKHUUZ2HyPH/GxKNa+IATCUx7ropnDrNl8LF/1hBlw8bNstV6JhbHlMRegP1fxTg/ZkrN0luHdKI2UNsDdqiX+19v2/dVtMuoGtsxLS4hVuBltJMN6+2Uan/pFj1KHa7lshMWwXWhNmmfDfVhj4E1TG7GLAIjrUspk3IXuUmCb435Iu12ZH49L875PtJP/88k0SMMu/QeRFzSxzHmYlI4Tq4zAFz5DwwcRBp77zGTNiiolWbq/yZeY76wyTHM0dG88TlofzimoH6cfzSoU+fTqYJDBSgn13l9z27Vr5GF4Dr39PHQJCtyf7GRhOfTvUKUuZqh5Alg+vBujSlhwh9+WzKv9OgYumKJoZaQkxXX8cb8IBDIcK5czcPoMcB8PKyUq5zBmRTzDJzEfKDCVQ2WX/vz3/X0pv+NCOKQpH0oqwNbNwylm2FSJ14iQ1/3A0mrnss7HOUA8h8smDVNIgcvKp7sWAvMeTLHbhF10wI1rZUGRpkKw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700016)(23010399003)(13003099007)(18002099003)(56012099006)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o7PE1E4XQXTSbdPZtlmS9qjdxgrKhkLNxjePYJYgxd2IFMZZvxHpNlKnuENPGDbYEgkjIsG3AkeqQomxg6CxozKzuI4B+jCVQrqltlMSsfzfvPVFDFNfwAglGAa5WovzLHUD/ha/5C9th8Ek4L0yKug59DdleLfCnXPDUd1V3apf8eANBBmSAGpNmVE1U8n18JF0UAfdz3FZkffZNGq9ZXsE5P3Q2T4L6jqSuU9zwSeqC8PSocUt+vHW9FoCw0MOPKX7DOJAJJ0AkDEjNaGg3LzSyQ8rzQMJzivh5zhyX/l+UiNWjjUU0jcKanLLZcx7fk6AFjYtvDj1/8taUB2WSCd9ruoJxaqucUGO1MzAk/9ZDkflXYzOABiRH1OfSPxrH9UeYRCps+GciwXu8fJcHg5SnA3TPI/yxjK446NLD+dOjaRPup+pU2XuLi6f6NZQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:19:52.0049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3f9e98-648d-4d26-0ab1-08ded1d1bf40
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881

In the NVIDIA vGPU RFC [1], the vGPU type blobs must be provided to the GSP
before userspace can enumerate available vGPU types and create vGPU
instances. The original design relied on the firmware loading interface,
but fwctl is a more natural fit for this use case, as it is designed for
uploading configuration or firmware data required before the device becomes
operational.

This series introduces a Rust abstraction over the fwctl subsystem,
providing safe and idiomatic bindings.

Patch 1 adds a small fwctl core release hook for private tail data. Rust
wrappers need such a hook to run drop glue for data embedded in the fwctl
allocation before the allocation is freed.

Patch 2 adds the Rust fwctl module. It allows Rust drivers to integrate with
the existing C-side fwctl core through a typed trait interface. It provides:

  - `Operations` trait: defines driver-specific callbacks: `open()`,
    `close()`, `info()`, and `fw_rpc()`. The implementing type itself
    serves as the per-FD user context, one instance per open().

  - `Device<T>`: wraps `struct fwctl_device` with embedded driver-specific
    data (`T::DeviceData`). The data is dropped from the fwctl device
    release hook.

  - `Registration<T>`: safe registration and automatic unregistration of
    `struct fwctl_device` objects, living inside `Devres` to ensure teardown
    before the parent device unbinds.

  - `RpcScope` / `FwRpcResponse`: type-safe enums for RPC scope and response
    handling, keeping unsafe pointer manipulation confined to the abstraction
    layer.

`rust/kernel/lib.rs` is updated to conditionally include this module under
`CONFIG_RUST_FWCTL_ABSTRACTIONS`.

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

Link to v3: [2]

v3:

Quite some updates in this version. Here you can find the example
nova-core fwctl driver [3]. The interface is still WIP so it is just to
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
[2] https://lore.kernel.org/all/20260217204909.211793-1-zhiw@nvidia.com/
[3] https://github.com/zhiwang-nvidia/nova-core/commit/2068da7e8caf58da9584b0aa6c81fed8f547d59f

Zhi Wang (2):
  fwctl: add device release hook
  rust: introduce abstractions for fwctl

 drivers/fwctl/Kconfig           |  12 +
 drivers/fwctl/main.c            |   2 +
 include/linux/fwctl.h           |   2 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/fwctl.c            |  17 ++
 rust/helpers/helpers.c          |   3 +-
 rust/kernel/fwctl.rs            | 486 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 8 files changed, 524 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/fwctl.c
 create mode 100644 rust/kernel/fwctl.rs

-- 
2.51.0

