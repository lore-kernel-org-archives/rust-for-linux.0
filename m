Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010042.outbound.protection.outlook.com [52.101.61.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634A846A;
	Thu, 13 Aug 2026 15:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634628; cv=fail; b=DeKmiYBp9wOza3qmaOh+KSVuz0sWz/Dz217Bwx5NeBKtdDPPJWVfin0uMcxqAm/JrHxNXUKYtGeby2cbco3oXYXXJyvGnatw+VZh3JzS1SGbSzAe1NMuspVBVooul4rQTpOU0uuFhHzeFIDnT7xkpPSGZvjc4FVH+C3c/KjZv+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634628; c=relaxed/simple;
	bh=RoXYW1Js005q4IyZ/KO8RWZLKfNCLTJMAyDvrA3/M/c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DHRb17bRX0epBmnP+KhExd/1m3ad1gBW6S7cyyBOq07ik6yrijMM3YqDHjijw4Mlgb3lXn9+12yjPqpxBYoC5LaM2TDnMND555kiTvN9TtHc7PQk4npBvcsHDexEMDeVP9wwMsOLIsWj78e78z1tLiUOntS4Kra0c5D5TnMEqc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ut0Ach1+; arc=fail smtp.client-ip=52.101.61.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ut0Ach1+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwrW1xn1MRoPKdSmFuV/PKG9CX2Z0+XzgPRzvqqARg+wNaOhs8loU2lhXEbN8GK6EWgCRzVGnRUGEX33Ep6VZA15BHg3qLb/cQq75Pj70lOIzrWyavEnUp31B5gDPlviSbxwZSt8/GR1HOgyidwX8ZLqRbcqbqqj8g1a4pJiyIM8HcNOfuhdoQZh6ZgGKjrGmOaSFCE3JmnCAwfIKNhnX54ed0zESY4b6Hw2RGJPiW2tCRmKCxNtkyPi7XZP/8Q317CKIPVNJxYbL++EgSbDbxrmmnXwGozbyRsR8nFjpb7SF89OwMPpeKJRiVj10xRURI2g1Cpnb8yoeADzfgyiHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0l3Bek/VY7FHTMTwbLMFan8YgwzSIaJoKw60dO7hG8=;
 b=g6I/e6BbweuSRofTQtGJPTWQBw9NFTL4UsJpMoSM0E5fEWQW/JP0765gOvTJsuctFGnOfRUMMVNoRmY3pAi7Oj2xjQGd/KLe0SrhNqzafpPtoEB6n3j3KrS9nQsa6f+ncsufbwDui5wIB1HhZJ8jRzwMsHMwVF1kAMklrAsm37dhYx5+AEn0MPq5hliCIYBe62QAZl7TYtVwXjF6gLsd2ZOZuiBbT2slaAulZV8wiAP5nUaJrDTrV86FtA8fiTrNxgynfBCPobgUipYZ0RfUTTSjuOm8MzgY+AgkMGDc0+FSd0paR3xMEm3UXtitvMFkHk/qzTvBe+Kpy6fPMRjT8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0l3Bek/VY7FHTMTwbLMFan8YgwzSIaJoKw60dO7hG8=;
 b=ut0Ach1+B291s/YtpiwAr3fr0ynE8IyXSOqga311itdoZhLFdfUYkhVzCeube3IlKlTC9n/h9T2P4ARd3XzsnJO2EgadCOdnhAT3/MZpMQHLxdWncjIXoSxtEZZ1YpVUG28gdrUuo1VpcR1A18QVTxouKdK7zRUj5Fcl7RRYsSGdr/yyXilO+pLQxi7eNoPQGHXgO5NDSTt49pF8bwYRmQoR078hLWRLAYhmBToi8Tp5xH6qyJ3T2JltS2U7+P76Grtp44Wiy2tFHKprZghH8ikA+T19RrHbV4b2Q5h7qTsa6ZljJJKhb/86lrmT7qiyv9lxhD6DU7qB+vKD8sUybA==
Received: from MW3PR05CA0030.namprd05.prod.outlook.com (2603:10b6:303:2b::35)
 by SN7PR12MB8170.namprd12.prod.outlook.com (2603:10b6:806:32c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 15:23:38 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::a9) by MW3PR05CA0030.outlook.office365.com
 (2603:10b6:303:2b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.4 via Frontend Transport; Thu, 13
 Aug 2026 15:23:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 15:23:38 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 13 Aug
 2026 08:23:21 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 13 Aug 2026 08:23:21 -0700
Received: from inno-dell.tail1d44c7.ts.net (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 13 Aug 2026 08:23:14 -0700
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
Subject: [PATCH v8 0/1] rust: introduce abstractions for fwctl
Date: Thu, 13 Aug 2026 18:23:11 +0300
Message-ID: <20260813152312.1311142-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|SN7PR12MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: f110fbb6-51e6-412a-d44d-08def94ed944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|6133799003|10067099003|56012099006|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	tSJDhPRrmJoZSE56RX7Mol5PCFO0sxFOsMVUbMz7TaQElDrKMzgEIAHUk7ZOXNyprhfFXapm6pAzw3gljkrhdJZ5OTytS/NDBvghfRu5X5Jqvb4zgv6ttXwD5FZkkSEjYDcHko79bLr6agJuOrkeMKWFk/CL6cIYjGYeI95hr7yuVTlZyH+2TivbbldyREz3HXx77dugX2jDrGuRfqbvCuIHQAIaarJJ+pEaGOdaFoS3CAWM5aeDezIqzlhue8zWPTZo27GsZjFA9kdNGLySVzkQ1Ll+lLmg5Zq9QcM48ip9pCm75pjyZKWB2YPKY3wIBonMCzIgHup9B8ROMtew486nzFeQRZwGrLyDJzC/eCR+6uwwCgIsYaFLLZIVFuwVdBCkkU00WGqOUMB9FVx8oAhL7Dv4M/qHHN516/IE8y6u1nBo62ytv70sSwehrWPmKRpPeD9KJGMLZXog+ihJkOLxqrkdFJ8EpyA7ghky0p1HuWleYN52k8R46RlFU01KEtbClm4bghaKMuBIRPt2Z2YxKm/2W6SRBcZm3RmzYexyQwfXA8LNYfnwAB3rp8wKNI7IEp2zhgiVQWSZfOIgi3KzYggxl4DM4af3sQs+EKzK34qlyE3Mnul3E2qYcZm+4Tv+SSqTnycRajZPtZno4zyrFJKuXoKMnJi33eV0uNwnA7cbZdYzRRLlKi11zl0/GAbGgr+lahcYjaIl/0eAlw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u1XoF5jT9J0OG8AznsUmJo4j3efcAnnytx+wcj5JIh8E0+UF6Qk52Bi0Y4IF7YprbkUdGJQAPseAT0PUhSO6iHiEA2qnqC94u/Q0wB5t0GcpLqdRd/aQ99qjtXNe/Dipbb3HLSUj3fdjYq/paenPjtwsLAVFZhmI+ahjWq8jR5Saq/yv2fczbmd2DO7yuraYWo1AEZ0LP+XXXVV5mWTWVz9NEZEkq/SAgEl/qeaHjayiDF19CFS284ogiieNMm7RJ4+U3WTi7q7zvBXG4lWI9aPptegQ93kTzSDdH8zDFo0h5hKTpzef9FqJKJHx/12QyGHzhC82fvjC24o5CS92UQCm2npCMkCx98Oka69ggU6An1n/Tubd5dxCS1CzadEYn1q0Jpy3uRSnVSTVhVeVAQFjgd6ryZfDSu9GMPHNiBvUrK7uucU85t+KNWTeyx8K
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 15:23:38.0967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f110fbb6-51e6-412a-d44d-08def94ed944
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8170

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

This series is based on the fwctl `for-next` branch and is intended to be
taken through the fwctl tree.

v8:

- Rebase onto fwctl `for-next`.
- Use `KVVec` for newly allocated RPC responses. (Alexandre)
- Encode the user-context pinning invariant in the raw conversion helpers
  and use pin projections in callbacks. (Alexandre)
- Remove the unused `DeviceType` conversion and document the `InPlace`
  length error. (Alexandre)
- Tighten rustdoc, safety comments, and cast annotations. (Alexandre)
- Add myself as the maintainer for the Rust abstractions.

Link to v7: [11]

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
[11] https://lore.kernel.org/r/20260708155951.699564-1-zhiw@nvidia.com/

Zhi Wang (1):
  rust: introduce abstractions for fwctl

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


base-commit: ee1c26323eeb01bca825d102cb7fff6921fa314f
-- 
2.53.0
