Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010020.outbound.protection.outlook.com [52.101.46.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DF9126BF1;
	Wed,  8 Jul 2026 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526426; cv=fail; b=WA+CQOr7zvB8rn5Xl8QJUwTVLB3snNgjw9AbYKODTxzAwaxnuyhJKmPK9LE2fOFAo8CdnrtDbYAkq/MQFl5lRQzCXYHf+PmV+Om2gtdWVcAtxB3Dvgx2UuNxBgUHcME2U2CETNiH3lhL6KMn9x5ZZMVqw7cdK/CfS52UFZxyYCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526426; c=relaxed/simple;
	bh=l7uJ051JcCE2js7Mf1HsUJcR10nTh9dCdT8XlbFFbeg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rx5j9PyueT8x86phdwboUKJ7gMClPVoERW2vt+8MQ8u/q0F7Bogoi1veimVPvAbQ+cL/ISM0L14C8HILs4aMhOjOmsQxsl12aH6Wik4CVc2UJ5/Lgna95xs8tOlysw7gZcaJLBmDU0n5D5wEtK1+lRk3HDVvfVECeBOu8kvFvkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M9wObSab; arc=fail smtp.client-ip=52.101.46.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M9wObSab"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8ionQL8P4AoP2cdopeQuNlrDTtj84Z295XuPNbYUFpSJcDJYYpKTC7lwaUXaN7r40aT3BfpvEap9P0/0sKQXwAcBhcxp5rpeJYrY9FONY+4sRC62kicfcrnPPl1hQazqBZlEzYA4Vu9KCArL4Wkby2kL8cEhVU3gLtAkyRU31H3guSFh7rVS0vHlRdcxcsp0bsOkFYh6D+K2HKCPT5z+/FwWQZQNNMKBU0c1MWVgTZM7jcgFWf56dHbYjPDOSGolv0oUhYhqkEZwtq3uevMnLAmpt6U8PaJkqLtSJWbwBJlGvIGVsBKZMXmhkHrpcIOdEcxMSFepxWEFBZwv3pjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSTub3rCie3T2Fvt5ngl8mkV5QN7VamIRUEwNGXZnso=;
 b=dzdqGdL+zLnpYZphrZfY/Aod0fx8kUI3MWjc39AZbtsKkrqHj1qPkmuRWH1i1vKTjY+aIyw4ZoY0ls8y1bMqf7w/tQ+t4naAc9ItbnqqplSCkCkO3W/yjCguNX5758dv8PflqkbJ403F0kbO7n3vgIm4aEkp22R/YjZnjeHSZ2HUcBh/lGGMdG8fl+V01PVuuLoX7lv/LQE6e87QtotqchYcde38+ZzwHiV9+qDsDi7EdbJyUcxR04kX7qXboQEXc9doq1ii+pmio+SJzlUCem15LnowKq596NSwXJ+HXlKUUnA+ClWi/Yf4Fz3aLYXNRukKmBFfNsRNjz5/hTHPRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSTub3rCie3T2Fvt5ngl8mkV5QN7VamIRUEwNGXZnso=;
 b=M9wObSabyqgo97qbhKLsqKOy+yRUaCwDPT/O/YaT3P5AtTNt7G7MOa26pDmVrq0B6w/5Dd7ljTJjrdu6AEBXFFjMj+YeI8Hh1bA/042+GGQcegojJFW2zPy7zCDu3ifVlnFh0qn18ooGQK5pMpeWCDUHt2Ih00HmMCWXHQQ4PAEd69yAhZqkayfZqVE8voDNBkAxRFyz1/Cf0E0GFvWzQ1zCYBVdscuaqUC0Wr5QVMImyZocXT55zIsVFDVNJg5vc0iQOSg6EqjJcfaNFfCjwYOtonfFKSM4Pv7qfVZUj5Ni3XVZBP3MMAGD3MyFWgFUYDerIBdi/+Gh15nqMBg0SA==
Received: from BL1P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::14)
 by CH1PR12MB9717.namprd12.prod.outlook.com (2603:10b6:610:2b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 16:00:15 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:2c4:cafe::48) by BL1P223CA0009.outlook.office365.com
 (2603:10b6:208:2c4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Wed, 8
 Jul 2026 16:00:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 16:00:15 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 8 Jul
 2026 08:59:59 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 8 Jul 2026 08:59:58 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Wed, 8 Jul
 2026 08:59:52 -0700
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
Subject: [PATCH v7 0/1] rust: introduce abstractions for fwctl
Date: Wed, 8 Jul 2026 18:59:50 +0300
Message-ID: <20260708155951.699564-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|CH1PR12MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd570e1-d22d-476c-fcaf-08dedd0a0042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|1800799024|82310400026|23010399003|18002099003|3023799007|13003099007|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	QTf8nq05+2BnvIpRTja1s02pd2OjEHlOQ8/R6tmsHN7/bNqWBqvoNjXWIGnHBFjPxoe4LTWLy/nOUUgxB5DF3pY2+cBzes2S1Nw2TBI8ciGu6E/cpDoxTHPhat1yOXy4aKzioRSsyuyO7gXXbfxuAWAgPIe0FrXibZxRuxFqz6wpFqvJSW0jAczoc4YIFkY6fsfW2QYtMqNFw96sQM6xbCuTNOJdeCVFPtX8wn9GttE5F8ZijB2MxayWc+VtTBwCEqO4wbspypcWBcrZwpY3TzYhnhCJVabVyAAGw9cM8+6lHqeerpXxF2SLSDjCx1DZRsp71u7jcOYkqDaGPBpTpHAcnj+Iglmyxx48cm/rJ1Cp7LrI9Zw3xLRirPXyJoZ9P/w3tnC3ew3KrsgrGvUTLmO/FYtzdtkfrHLHoMkTu+/7wOdjiJ+BhMzPIFdPZTEf1HKlRBcxl7OA6sh/ZsftoOk1Y7CD74dP5daRBAHHLU2Vmt0V8Z5wz2m2WNmWjHvmcA5ollQ5IC1zncfCnAsoX65DcwVhcrHOqi2BYg4LkHMJ7659sfJHJRxHzS0pot9bIjqxcr1ph4iMEGr8eZtsUNPaSHGWEwky88BwOnsjpIKlzfb8IVwzT8DlgiGelfVnjda+yxa64431xiFifwRvJIE4Y7e/tcXvfoCSc9ScY4Y9XzdxukUmBaQ6HLyQzAA2LLT2S4w7bNVVvvR13Jb2oQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(1800799024)(82310400026)(23010399003)(18002099003)(3023799007)(13003099007)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZPO0NczsJubCV+NHtR9dWD69M19LCa4I1+P8HjX1qYKMpeE9ovcKSh4XaM5jWiFVvW9UiNBcprfTX/MyrSkXaeauy/0upUTmvbERq72uyisk70E4YBtic1WPLKpuQ1WRmdB3+1HGbX910++8p1qbPSsepHFxgSaJrpKlapj5Jwv5jdFyHqFMWUm1C4o9yLIKqY9nWdGWTvQBvhkeefNrwC0EbzAm9l3SQCL/uqzU78jo/22UkwY5Wu38UEfvHts6aYW/ZDjVm/Ra+iOeGFjr+o9avdumTZs6Dm8bgJWN8aftQkI+ciuhEBi9OKJnBJuFfxsK9taGRvGcWQbbORReg7+s8gkLYiqG3AJ2SA/oTT4EGwGxusXE4o1HFvomZR+Se5ITNsuI6FUOPgCoFHvEkqnlvwCwEWkW245WUGTCzh2GHCuTijSRwPBcL36MxGOy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:00:15.5190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd570e1-d22d-476c-fcaf-08dedd0a0042
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9717

In the NVIDIA vGPU RFC [1], the vGPU type blobs must be provided to the GSP
before userspace can enumerate available vGPU types and create vGPU
instances. The original design relied on the firmware loading interface,
but fwctl is a more natural fit for this use case, as it is designed for
uploading configuration or firmware data required before the device becomes
operational.

This series introduces a Rust abstraction over the fwctl subsystem,
providing safe and idiomatic bindings.

The series is a single patch. `Registration` owns the callback-visible
driver data and ties it to the parent device binding lifetime using a GAT
on `Operations`. `Device<T>` remains the refcounted fwctl object, while
callbacks borrow registration data for the callback lifetime.

The Rust fwctl module provides:

  - `Operations`: driver-specific `open()`, `close()`, `info()`, and
    `fw_rpc()` callbacks. The implementing type is the per-FD user context.

  - `RegistrationData<'a>`: a GAT associated type owned by `Registration`
    and borrowed by callbacks under the fwctl registration lock.

  - `Device<T>`: a refcounted wrapper around `struct fwctl_device`.

  - `Registration<T>`: registration and automatic unregistration, including
    verification that the supplied bound parent is the device's actual
    parent.

  - `RpcScope` and `FwRpcResponse`: type-safe RPC scope and response
    handling. The safe callback receives the userspace output-buffer size
    as a numeric value, while raw output-length pointer handling remains
    confined to the abstraction.

`DeviceType` intentionally models every valid, non-error
`fwctl_device_type` UAPI value rather than the set of existing Rust
drivers. This preserves a typed interface while making
`FWCTL_DEVICE_TYPE_ERROR` and arbitrary integers unrepresentable.
Device-specific Rust consumers can add new variants together with their
UAPI allocation.

`rust/kernel/lib.rs` conditionally includes the module under
`CONFIG_RUST_FWCTL_ABSTRACTIONS`.

This series is based on drm-rust-next commit d85845b64c00
("gpu: nova-core: build SetRegistry entries dynamically"), so Nova can
build on it directly. Danilo suggested taking it through the DRM tree;
Jason, please let us know if you would prefer it to go through the fwctl
tree.

v7:

- Rebase onto the latest drm-rust-next.
- Pad fwctl allocation sizes for Rust alignment. (Danilo, Alexandre)
- Validate the actual parent in `Registration::new()`. (Alexandre, Danilo)
- Add an HRTB helper and remove the lifetime transmute. (Alexandre)
- Pass `max_output_len` to safe RPC callbacks. (Alexandre, Joel)
- Write `out_len` once. (Alexandre)
- Return `NULL` for empty RPC replies. (Danilo)
- Convert allocation results to `NonNull` immediately. (Alexandre, Gary)
- Simplify callback lifetimes and raw pointer use. (Danilo, Alexandre)
- Make `VTable` and `VTABLE` private. (Danilo)
- Remove manual `Registration` `Send`/`Sync` impls. (Alexandre)
- Tighten the rustdoc and safety comments. (Alexandre)
- Document `DeviceType` as the non-error UAPI domain. (Danilo)
- Update the FWCTL `MAINTAINERS` entry. (Miguel, Danilo)
- Add Danilo's `Signed-off-by` trailer. (Danilo)

Link to v6: [2]
Links to the v6 reviews: [8] [9] [10]

v6:

- Use a GAT lifetime for `Operations::RegistrationData<'a>` instead of
  requiring `ForLt`. (Danilo)
- Require `FWCTL=y` for `RUST_FWCTL_ABSTRACTIONS`.
- Add `#[inline]` to small forwarding helpers.
- Return `EINVAL` for an unrecognized RPC scope.

Link to Danilo's GAT diff: [3]
Link to v5: [4]

v5:

- Rebase on top of drm-rust-next.
- Adopt Danilo's higher-ranked lifetime model for callback-visible
  registration data.
- Drop the fwctl core release hook patch.
- Reject `FwRpcResponse::InPlace(len)` when `len` exceeds the input buffer.
- Add the missing BNXT fwctl device type.
- Document the registration exclusivity requirements.

Link to v4: [5]

v4:

- Rebase on top of drm-rust-next.
- Split out the fwctl core release hook.
- Drop the already-merged fwctl init-ordering change.
- Add compile-time layout checks. (Jason)
- Use `const_assert!()` for generic layout assertions.
- Require `Operations` and its data to be `Send + Sync`. (Danilo)
- Pass pinned shared references to `info()` and `fw_rpc()`. (Danilo)
- Return an initializer directly from `open()`. (Danilo)
- Fix clippy and rustdoc warnings. (Danilo)

Link to v3: [6]

v3:

- Use an enum for the RPC response. (Joel)
- Remove the test UAPI and sample driver. (Jason, John)
- Remove `DeviceType::Error` and add fwctl reference helpers. (Gary)
- Refine device-private data ownership. (Danilo)
- Separate allocation and registration. (Jason)
- Tie registration to a bound parent device. (Danilo)
- Make the implementing type the per-FD context. (Danilo)

An example nova-core fwctl consumer is available at [7].

v2:

- Use a Rust helper for `fwctl_put()`. (Jason, Danilo)
- Guarantee registration lifetime management. (Jason, Danilo)
- Rename the main abstraction types and use a typed device identifier.
  (Danilo)
- Improve pointer casts, reference counting, safety comments, and clippy
  cleanliness.

v1:

- Initial submission introducing fwctl Rust abstractions.

[1] https://lore.kernel.org/all/20250903221111.3866249-1-zhiw@nvidia.com/
[2] https://lore.kernel.org/r/20260629150156.3169384-1-zhiw@nvidia.com/
[3] https://lore.kernel.org/r/DJJW7X4ESDSM.QCVYK2FC7ZR3@kernel.org/
[4] https://lore.kernel.org/r/20260629103946.3117152-1-zhiw@nvidia.com/
[5] https://lore.kernel.org/r/20260624091758.1678092-1-zhiw@nvidia.com/
[6] https://lore.kernel.org/r/20260217204909.211793-1-zhiw@nvidia.com/
[7] https://lore.kernel.org/r/20260305190936.398590-1-zhiw@nvidia.com/
[8] https://lore.kernel.org/r/DJQ1KX0O60J7.Q3RUZ46V153O@kernel.org/
[9] https://lore.kernel.org/r/DJR76RV8NEKN.2MP5M9Z66U4TY@nvidia.com/
[10] https://lore.kernel.org/r/DJRH022OWTTK.1KPQDQHKG7CTF@garyguo.net/

Zhi Wang (1):
  rust: introduce abstractions for fwctl

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


base-commit: d85845b64c0020b2812243a22fa79d57cc1c1e38
-- 
2.51.0
