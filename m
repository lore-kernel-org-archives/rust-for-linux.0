Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010058.outbound.protection.outlook.com [52.101.201.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6525226B1;
	Thu,  1 Oct 2026 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866821; cv=fail; b=Fu0txunQS90C7UPMEA8O0WZaipDEmsq8A4w3E5Wql67g660l9SDjT3q4NO2NxQ8XqAfsVVRaDen4YrfnMDAWJoLXvGkWI5YiBc/9luYbi4TBtz3/zZzxwrlUKYyDlGjXCh0+GWDWgkx4kpsouDNdc9ylaR+ekwWt6K3gRBlAuwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866821; c=relaxed/simple;
	bh=kVc3EEyw1W64e5OL1fai6+lVX9Jjtm9oY8tin3jqQDI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pP2R7P1Sk07Q9ZeaMbR5Imm54MnrEqPfGj6kLMRyraxQq3yRvi0/2sEJX3K9OurZ7XqkW9ayPS+HSz5qKP9nlNzd+bZQasKENLgAAHvloMcIVznEquHp8U6pCgay/CczqdbUeEEI6jrpSUiCLfdzANjAvzHis5EPoWoTA1jJvv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ppAq/V4T; arc=fail smtp.client-ip=52.101.201.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ppAq/V4T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDh3QCpK/Glq0qWL5p//8N3WMnAnGR7Wn+tYryjGMWZagzPZ6Muz+vpeV9aQ/Bf8XFZ22wwzAGPZfmErjVJnjyCIHvFwxfZquZ+zT/pXBRG8WZTvxTIzfN9hpSe0A6I8XmY/UoFqXDLAFfOP59ZKVkgYm9Y8baiE8tYDArEyPazmtAP41Ehk5ENXs99P/xHtCbIbj2Wol2jjQNm5T0+26J7c4t+d+vHamhi3zJ8FZntpxCwUfl2o7c+scQJw7HEEf0T+n1EEBxArOs6OK16KELpw6aFW9joqjetxQNU17RKihQ/75e6WTy+69n9G4//9frG17G8Yfi+cpmyh/VTF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0a12GrYiBxbKxIxo+tKFENx39Z7MWzpgmWyb0rbFENM=;
 b=nvTFZLFRD/PyO3iizBFTgZwmMbB7gFRjzuxrmF7Rjtl9VKTzxgD+2wqF98SomNBmgyUVI4LbPDmiUmDp66WLdgSjeJmbOnmHZlDjLaoa1xMrbtoEp1+G8p9TA7+HgXPKUUWUGHeqASUDAp9NSfBdm38o5fFw92if0EU0AaWBXrfKlDUdXR/LZMp2EeJ996Ee53d5CuomdfKncq7K2X8lslRGR7/txlHjr+ljJbBNNqQpDMABjbUhyxMEyklvgqZECf3SdcNdzMP5z2I4JH8cyy2CagBMA0XB/xIgLEqANYZ4LkBLSqVu27xC8camA/tuXQ73bQ90TGdIYY6B5Fui/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0a12GrYiBxbKxIxo+tKFENx39Z7MWzpgmWyb0rbFENM=;
 b=ppAq/V4TkXnXhIxvNAyu6rYIm9QjX1c37O6Bd2wRuNvAOzMeNk3X+OcmQxYs3mImsjZjFmfvowM2aVqYsCIcl0pMNA9wIRc36cWae0SX2QxR/JsLGd6NTWiWlmJ9wbzbnkT9b+yKhLvjfw2gS+5XkPsdSMALciIM/yy7jlOnnpFyY29ua6RH7oo57jgTWStwly7Ibei4AUl5R78Xg/ZusiVd+olzv3A5EGBAkPxu2UWAkLbNr3O2cRFQClq8G2ImrcDSvrRg/ZSmTerLkko/7WPiuWFpZnKoS4QZ2i6GuwTUpq8/75H+OVWHZEkQ/h9VrcPkZurI9u1e55OsPHCbaA==
Received: from SJ0PR05CA0119.namprd05.prod.outlook.com (2603:10b6:a03:334::34)
 by DS2PR12MB9565.namprd12.prod.outlook.com (2603:10b6:8:279::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 15:00:12 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::a5) by SJ0PR05CA0119.outlook.office365.com
 (2603:10b6:a03:334::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 15:00:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 15:00:11 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 07:59:48 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 07:59:47 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 07:59:41 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <andrewjballance@gmail.com>, <daniel.almeida@collabora.com>,
	<dakr@kernel.org>, <aliceryhl@google.com>, <ojeda@kernel.org>,
	<boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
	<aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<kjaju@nvidia.com>, <alkumar@nvidia.com>, <acourbot@nvidia.com>,
	<jhubbard@nvidia.com>, <zhiwang@kernel.org>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v3 0/5] Rust dynamic debug support for pr_debug! and dev_dbg!
Date: Thu, 1 Oct 2026 17:59:35 +0300
Message-ID: <20261001145940.1077801-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|DS2PR12MB9565:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7f2564-3f06-4d76-bcf9-08df1fccb12f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|7416014|1800799024|10067099003|11063799006|56012099006|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	FtVC4fMhvV1V3/tv/PoyDIz2ZQUVfUB6IXZqlhh/PbvYTyNEJofnY28BABa1lixGW4HAPQmJFo4rT0z55RB5kkwwsSDQZrDdJTGUq7N3La0Kq3Vy3tnuMcHMFDLGHq4QLnPNTcdnWkHtgDg5m40FQ7PaECFbBF6mSwmQniiM2S+yroZgGoAsDgBDFrOO2tk5HH4HpYkwErvMkXQSc2S+ROG5QGevMCipDlxZTh3KZ9rc/Iv2VdBAIGofSyA4XHTzWgIF+Er8UqugIQEOvoRl4/Y8ti5qkVus78c+9c1FEH/pKFLedbvjqzuPQy07Qm7c5Xq3z3FEpmEffyfuoIbcA9+h6qUPGQcDroWeeWg7P/QbQfrr1qWnxLKJPCBfGCcqJRYO1GKUTCBsC9zuSrOvgpy0DShm3nhv1qIXvcaWlhy3K4W3pmY+Ut+xBrV/kdfctm2KOerH2du53S8PMGb1YaBwxq9iUtZguBmPSYbRIs+lXBX++xZJx3HHp3Zgmy/nEgBGnC7SYt8dZlp82mDcdS4FwyCuyyenfePGiOeBfIT9/UbsQGoAWCwDhigW7b19AinwkPkGRMTVpicGhjtUrcLStB7iy4t1QDg6uhEtGZFqdu84v2VQoZUEplXb8ZiI2inzmaZA7Dvtm/ScSId/TvZIpuNPq2TgUCUgkt4x5Npyp5df+UtWCRGcD9nO8XoaGnauv/cJSkybbv7kQlh3ug==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(7416014)(1800799024)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y9HL34Oz+XMq22QgfQQKs/i5E80q3hLuyXF5BiJjjIdmcLL2SmdzdMQi8C+b26lmllwV04CRD70nJNdmSlaRsNUBrP3VYXAI8AhUoNG+AGM5cxQdCLUPGueAs4jgcfikNuNLvHVNRjyAib+mGGG9BZVvzdDJfuJwusPo+vIAcTQXkri8q+TbpJQ8U1ukzCmN1HIRbBvkrlmMIuyJ6LjL/TgTJ1YpIvUSa3Z5iFI4q/oOdWtOpM4GNkCtW/K6YQ0ZyLMMETOUYS13p9TdXbjqHxaMPhNimZpYRRcesV+nFimwb3tVNv4slFjTt+yn7axVpOiu3jTb9ikyBNNWCrbRws0jSIgVrDkHAbGZAXMxV9qCdEMpjgM5mjmiAVFo27o9Wbyes/qML2JzCY7FHa4kFI1ku3ivOPiQFFuaVuwxX80YyFnrfcsQCYV/uVSL3NR8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:00:11.6144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7f2564-3f06-4d76-bcf9-08df1fccb12f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9565

Add runtime dynamic debug control to Rust pr_debug! and dev_dbg!, using
the existing C control file, boot/module parameters, prefixes and jump
labels. Callsite flags and static keys always start disabled. Users enable
messages with dyndbg queries; Rust debug assertions do not affect whether
a debug message is printed.

This continues Andrew Ballance's RFC v2:
https://lore.kernel.org/rust-for-linux/20250620210533.400889-1-andrewjballance@gmail.com/

This revision retains RFC v2's nested-field static-branch macros and
static mut descriptors addressed through raw pointers.

Changes since RFC v2:

- Make debug logging independent of Rust's debug_assertions setting.
  Both pr_debug! and dev_dbg! start disabled and are enabled through
  dyndbg; without dynamic debug support, both remain disabled.
- Keep caller expressions outside unsafe blocks and avoid implicit Rust
  references when reading descriptor flags without jump labels.
- Correct big-endian bitfield layout and keep module descriptors writable
  with #[used(compiler)]. This fixes the kernel write fault when
  static_key_enable_cpuslocked() tries to write the static key.
- Use Kbuild module names and actual format strings for filtering, preserve
  the crate log prefix, and support +d stack output.
- Complete DYNAMIC_DEBUG_CORE-only support with per-crate opt-in.
- Port to driver-core-testing and preserve Nova's firmware validation when
  debug logging is disabled.

Limitations:

- Function metadata deliberately remains <unknown>;

Andrew Ballance (3):
  rust: jump label: add support for nested arguments
  rust: print: add dynamic debug support to pr_debug!
  rust: device: add dynamic debug support to dev_dbg!

Zhi Wang (2):
  gpu: nova-core: validate firmware versions before debug logging
  dynamic_debug: expose printing declarations with the core enabled

 .../admin-guide/dynamic-debug-howto.rst       |  41 ++++
 MAINTAINERS                                   |   2 +
 drivers/gpu/nova-core/firmware/booter.rs      |   8 +-
 drivers/gpu/nova-core/firmware/fsp.rs         |   3 +-
 .../nova-core/firmware/fwsec/bootloader.rs    |   7 +-
 drivers/gpu/nova-core/firmware/gsp.rs         |   3 +-
 drivers/gpu/nova-core/firmware/riscv.rs       |   7 +-
 include/linux/dynamic_debug.h                 |  16 +-
 rust/Makefile                                 |   3 +
 rust/bindings/bindings_helper.h               |   1 +
 rust/helpers/dynamic_debug.c                  |  33 +++
 rust/helpers/helpers.c                        |   1 +
 rust/kernel/device.rs                         |  42 +++-
 rust/kernel/jump_label.rs                     |  17 +-
 rust/kernel/print.rs                          |  53 ++++-
 rust/kernel/print/dynamic_debug.rs            | 192 ++++++++++++++++++
 scripts/Makefile.build                        |   1 +
 scripts/generate_rust_analyzer.py             |   1 +
 18 files changed, 386 insertions(+), 45 deletions(-)
 create mode 100644 rust/helpers/dynamic_debug.c
 create mode 100644 rust/kernel/print/dynamic_debug.rs


base-commit: f1850e443b0e4f2429ddf42a8d5033ea54ae8a90
-- 
2.53.0

