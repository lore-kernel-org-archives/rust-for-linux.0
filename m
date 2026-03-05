Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DD12DB79C;
	Thu,  5 Mar 2026 19:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772737810; cv=fail; b=Lhd1NtgPV6e2O65PcVd7P15rtZK/xXfyssgE1//bKsG0gFuyfkhm5CfTxQ6Ej33RYzEtrm8BT23l8MpqJ/mSqFNpc237pWCTizVVKs/9B8JLPGuOx86+iPAcDOa5cGc+qCkO/B9F55tboTXJEbdfMCCiYAL2XMkJ4cdX4w0NNV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772737810; c=relaxed/simple;
	bh=+8RnG3Z8lRec8zrOKtZbdopKwRe95Fw1REyoo0GKd28=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qQp/NgTqqLIJoD0eLrt0+CQpQLppCZOIssEYvFz5+CXS4WczaIk14qI5pUKjsAzofCp8iwcXwALWSUCZqyIdQ27sWFZkXWmdDySS+6w6o7BJkz0WYhFvIHYTwbksMV+ocXBabQxNTG7kLPcatUzCCCSN9TQwvs0kUQWYUBkvI/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pRd0CBGp; arc=fail smtp.client-ip=52.101.52.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pRd0CBGp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlbQ2qcrINScZstBGHxCMhv1VU5EEgn96f8rikPTlkHz4cwXiM3vYacJgVEmvnnXUa2w3qbOcty3LGBoLpkq9/tqFnU+cfLO7wtp8IEAW8ChkWymdqImwJ5Bifk/9uJmk0q9gIvYQxmWm7NHia4G53YWSYSsD/ZDVPSVIkaBNs+yyHVpRFj+sdNgTv50c+b2YnADZw9T4rrfrLbhCpnTfxvJ5fglUhLFZqOjvwL9Fgjul8Nx3KESXRYqZXierLR+k8zLRiesnL51pxisMIs8KA5oK2/4cqehyCTPIPPxiGdYdDRLQaJvDpRw5rhxfd/QMEcaj5uc5PoT7nabxfAfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fO6yMNQ3siE8peIUM4QFRYoVZ+a/19/wy/uRNtHDJRQ=;
 b=GjwiScGGXCVF010qTCXnHBcKoqExMedhpDn9RTvb0NpnH2wXCbfRtNk25Jb3WyN/SHpvh7OuSyWtu+qXq2oFupQFUBdB6uSANZVwd8z8zEmArNOO7AbF5QdrG4WCPMU5goHaGyMD930rWv4AtCVR3D4jihpcRnFsKqkUK3cn0JvVbpLCBV/FlUyjheF/A5UtxizyS9Zy3fetbTyGSZIZuCekkJ8EcFJXLfWTsBW40AXkpyYBv4LaaTOO6dULE/xiEJZXClVp4jqlU5/dwJBlonv+rdey7OqmwGKLr46ucdtfIhogWzMD3f7CNLY+iQvjC2hVO/fBfRFAvcaNljQ51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fO6yMNQ3siE8peIUM4QFRYoVZ+a/19/wy/uRNtHDJRQ=;
 b=pRd0CBGpHLlbEEZ2h8L2Ky/X8yBi+3+0xvIOYIqoGY8ZDR0zO0aM/q7EAF7eGO9XBkUN29HH6GZHi0+Gpp2BaFZWtfZYgDrKNL+xpdtuHc5n7fDK9zUME6aGQbbaeA5BC92S7/SEpQe0Nhc5JvgdVb6rLxAggt8YpJ8bfLAcb+8/F/JLDgsOjPvDli4xHe65SzzPjrNJTiI3UuaQYNRLeVAz4NtcnxuWZmQLVbmfY24SXTDmZc5DdeDyTUkW7tOkj1bH/XlY5f99EGOhp4qfkqB89b7CjJuqz/yG29woqEnaNJ3wVtCDaBcx6UGVgR43IpVcl1HmoGHVAYo+B/0TFg==
Received: from SA9PR13CA0115.namprd13.prod.outlook.com (2603:10b6:806:24::30)
 by CY8PR12MB9034.namprd12.prod.outlook.com (2603:10b6:930:76::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:10:01 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::12) by SA9PR13CA0115.outlook.office365.com
 (2603:10b6:806:24::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 19:09:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:09:59 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:09:38 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:09:38 -0800
Received: from ipp2-2316.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 11:09:37 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <dakr@kernel.org>, <jgg@nvidia.com>, <gary@garyguo.net>,
	<joelagnelf@nvidia.com>, <aliceryhl@google.com>, <bhelgaas@google.com>,
	<kwilczynski@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <tmgross@umich.edu>, <markus.probst@posteo.de>,
	<helgaas@kernel.org>, <cjia@nvidia.com>, <smitra@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <acourbot@nvidia.com>, <jhubbard@nvidia.com>,
	<zhiwang@kernel.org>, <daniel.almeida@collabora.com>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 0/2] gpu: nova-core: add fwctl driver
Date: Thu, 5 Mar 2026 19:09:34 +0000
Message-ID: <20260305190936.398590-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|CY8PR12MB9034:EE_
X-MS-Office365-Filtering-Correlation-Id: ef68f2dd-877e-45e0-1126-08de7aeacbb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	+zVm94bQRtmffAWsHS/iNc5sICFshqQiTXvmBJpcNeLRzsyKnKlAoi7QouNvmbeVPbNgqpwBut7hMXVjiGEBf9SoOGHvMUpFI0G9JDegDFxegKed3Fl/WDDmb98/ADGZZ0d8ZofahF6+3WmTSBRkH2JWIFM6Ek9gP1BQ5m3rJhGVfFTifE46ZXHgCHEozfOGQDi6GEKCST3RMxFRYJxSkubLyhPSYqo7NFi+xEd/7Urc7f9SnosmyqH98eQV46IQ5xjHCM4gbyXeJXOGDHxqjJaNl5QbUBGRykYDupXnksSfu2YsfTP9DoaPj+ePq0kWVdxCGEYkZbHU0z2oNSHxkjeiip7EBYtJDBewU5DHAE9OpWUcXbQsb3chANPrryRq+QLt9a+mhb1+A3LcrBtWx+VNH1WuYwTuqm6X0Z6THpSAk+Nfoak2fT87DgojhO2Aojvor7UMRC1qKP7XlT4eejOamECoC92s+gT1nZzF0QZdBP6dXqeu1xwDJhkoZOlEICzO9AXL504YfTSkcGIEFRooGH3ItmF2a79ibanA1b+TTXJ7SEsbt19FmsVNiiWM/xWb9v9AM3Fw7PDUrtcTYtJRRT8wIhkRM4ks4yHNKrGbxgEB1nmJ7Qis9wb9mcopUsmJG3Na16SWbwO2Nlj4A4BhaEYlaokR6WOeIiezG9+8L3TjvCoKLX1Rhq6iyrH/ECSq0/UPwDyMfH/wAGawnDICmgwYLFhnMkS0UuR8KAcsRcdrjNaX0cO/SPkwd9RbdFpYffARfjtQkQaEfDJly3xNq25LyNkceYZvUvM5Zqs=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JKss4kFgmn+kYMpeUIXCIbyWQnN2IDZq4P+r12jp3UQBnBNVE/+0Cb1XvVOlkS2cjQSCf+bgDoKD0+yA8LWgLpV91iyheo5HtoUZeyeHWJTuptlZem3DVemnAWPpJenC1rTxbRBUAhqrowzY37R9DST5WXYL1F9nq3e9ZZbAd67+9wkYIlnI+QHN8s40AHg7ZvG6a+SnCmHolJqlsFgdsz63w+9lGP1dRw0HMgsg0lfuo6VMiwBfP/+nF0Ir59otUAtfMnWAC6saQtJ5lSzwFkqYZVuyTHb2CJbzC1X6pzxTWUOv8P6vp8vZIFKVr5ipSOzWkwo/oWo8ihGskSBD0nF+0eY/MxCCuBnwdjjz0rzYodCsO0Z90/xCbJxOv9HR1sKvyShTBlKuieKroEpzY5q6bREVDd/FIT7BdrB3XuLwkDifwvqmS0/7KQsJcuqM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:09:59.0222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef68f2dd-877e-45e0-1126-08de7aeacbb2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9034

This series adds a fwctl driver to nova-core, enabling userspace to issue
firmware commands to the GSP through the standard fwctl ioctl
interface. E.g. uploading the vGPU type blobs and managing the vGPU
lifecycle, which is previously implemented in sysfs.

Patch 1 fixes a boot-order issue: since Rust fwctl abstractions force
fwctl to be built-in (Kconfig bool), the fwctl class must be registered
before PCI drivers probe. Switching from module_init to subsys_initcall
ensures this.

Patch 2 adds the nova-core fwctl driver itself. It defines a UAPI for
nova-core specific RPC commands and wires them through to the GSP via
the existing RM control command infrastructure. As a first user, the
UPLOAD_VGPU_TYPE command is added, which uploads vGPU type definitions
to the GSP. It is a required step before any vGPU can be created.

This patchset depends on several series:

- [PATCH v5 0/9] gpu: nova-core: gsp: add continuation record support [1]
- [PATCH v3 0/5] gpu: nova-core: gsp: add locking to Cmdq [2]
- [PATCH v3 0/1] rust: introduce abstractions for fwctl [3]

And a tree with all the patches can be found here.[4]

[1] https://lore.kernel.org/nouveau/20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com/T/#t
[2] https://lore.kernel.org/nouveau/DGTZATU21WV2.1YRBLUAXFHMVJ@nvidia.com/T/#t
[3] https://lore.kernel.org/all/20260217204909.211793-1-zhiw@nvidia.com/
[4] https://github.com/zhiwang-nvidia/nova-core/tree/nova-core/fwctl-driver-v1

Zhi Wang (2):
  fwctl: use subsys_initcall for built-in configuration
  gpu: nova-core: add fwctl driver for firmware control interface

 drivers/fwctl/main.c                          |  2 +-
 drivers/gpu/nova-core/fwctl.rs                | 99 +++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs                  |  4 +-
 drivers/gpu/nova-core/gsp.rs                  | 25 ++++-
 drivers/gpu/nova-core/gsp/boot.rs             |  6 +-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  1 +
 drivers/gpu/nova-core/gsp/fw/rm.rs            |  5 +
 drivers/gpu/nova-core/gsp/rm/commands.rs      |  4 +-
 drivers/gpu/nova-core/nova_core.rs            |  2 +
 include/uapi/fwctl/fwctl.h                    |  1 +
 include/uapi/fwctl/nova-core.h                | 52 ++++++++++
 rust/kernel/fwctl.rs                          |  2 +
 rust/uapi/uapi_helper.h                       |  1 +
 13 files changed, 194 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fwctl.rs
 create mode 100644 include/uapi/fwctl/nova-core.h

-- 
2.51.0

