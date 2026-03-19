Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010053.outbound.protection.outlook.com [52.101.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D76C2ED84C
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 21:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773955648; cv=fail; b=s5MytRaoQ8yyYgUxcBhHrVsekZdnUPJC3wehDh07yS1dBdzglnECSM1SiDCUYDOThL1zEHWERRB0epBtTPXssV2klvQCehBTPM21Xgk981xe6CU9k8XxwV8ei2CpxEqkqX261hFJ1Htt6VxqmvAzrl8RjFkRTmNbAxITV5675oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773955648; c=relaxed/simple;
	bh=IOHUs2VjoRn+5MRIA9H6+N94DpKNqJDtc/e6Z4ctnyU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ojhllODEze/Uvi0kL2qC09kJsGkvBg1eMnSuK5ff49VgLAqZawke4nd4L+iJ1QCjsVPlv6FGdZM1KjPXxbJnWXiL2VumpFKSlaFq/yAQrw98V8d3fVVnU6NSZoG4/8fjo3ZbdQ+p7lar1RmLbFTzOGyvvkowVruYPvTuIbiFImw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G76v+qpt; arc=fail smtp.client-ip=52.101.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G76v+qpt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnrEBSETGSqnvn0bp9UgA0KyCZsiFP2bCiOBrO6ZPJrpyfFh0LxlXEzpeSEKRjl4+VMNrHc4lIQiRvXZxLrTDDEqrt9A8rZkx1EeVhn67xPxkOtuzmpUU+ZNarABD2a2Yn5P5TT7+uFYKAYZFJRu2F8MOpIFzExKxiIwhfMlpHhcPx/Eekz+xgQ+6TEbhUXiWQ7B5UMwXPZT6KN7X/tPAx9NNruCq3YWjGXKNC5VEqFMyYEK/i3lbrLallfw3xuezBixxXH8lq1ZBPKahzFfxczCkTeOgmATqdXEHwNbvfcPHClKYUN7WieoJrKglzzp9rMq2RNyXGjYW1uzdmZ+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnehXMXcn6iuaFEa9syURLZPi3H+KXBR6VW+q7hKQH4=;
 b=H+rB63sK2hJwVbZwmXGBXTga57iGIQwh6lCqvH8lWgu8VU3LP6iLJT9x6iHwpEaD49Aueghpy2QZtt6ZSicXaiS0tb3gnaR6fstTojEJjKLbxw94D9Hz36v5AWpf9CIEtzt/I7kgzYV4LbddN/aVLzvZkBgkedc+ekvGiD7Q2PnH0QDEClilx4e5654tSN1OXtbGZ4By6yc2JaX+yvgHdmAS009KfIjbFOa8HvfyTosHZmdOaxWLScquL/d7+tw9USNQpmI18vsQGtTsErAIxl1pvVPXaQGZu7SYSLYfXhqDmWhcCklGemDfHLko4zoWFjWR5r5Ks0dUieqtLfZJcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnehXMXcn6iuaFEa9syURLZPi3H+KXBR6VW+q7hKQH4=;
 b=G76v+qptKpg+ui/J02GLWEms66PnLNjl0wTC0gRtED1Q1/KDiNIOxLDugDisRyx0HPwgUxcVhG0lA6CuLdce9ww1ddCVBitEFK6TB0uYrrXmKg1srisXBRZUbF+ci4RVdHXBN8xVIMOV/p7Nk0rfqtltG0xknKjcKGOTlbLotmRA8/JvIbYrXOPyK1kO4U6+l2OvLFXnwS+jbeey6latZ6V2dfAhs+gC7kXeAAdR2WUXEMfoW/FnkP3mBMv88Eg3k9gAg7TnueXCk7Qr/nRKcNXhuY+GkpWWkgvyEBHgzjfGD2tJmK7P/xTCOwwhQkxW1b+mfXWnnPZo0Cjn9RhjLw==
Received: from DM6PR02CA0091.namprd02.prod.outlook.com (2603:10b6:5:1f4::32)
 by SA5PPF06C91DA0C.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8c4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 19 Mar
 2026 21:27:23 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:1f4:cafe::8) by DM6PR02CA0091.outlook.office365.com
 (2603:10b6:5:1f4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Thu,
 19 Mar 2026 21:27:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 21:27:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:07 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:06 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v11 0/6] gpu: nova-core: expose the logging buffers via debugfs
Date: Thu, 19 Mar 2026 16:26:52 -0500
Message-ID: <20260319212658.2541610-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|SA5PPF06C91DA0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1cf4b1-13d0-4099-1374-08de85fe4f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	n7TIMITbkBImKuGYW1ksa2V3Mf4WPBF1vOPVAYdG2xOcDIXx8ZeSNABC9ExBqLwb0CGkHgjH2aI7iiWuHTwSwe3cHdNac6H5eOdH6JyptOZ9/hNzr8IVK49TtXzF3YZ9cRebZqB0ZfEqXnbSZJ3GpiZ0z3Cv4sMoceZ+ffY306BE79I9fhJ7z5z+DWaScCTwAbbtqdNPscF/PTTILOfLropcC+hJZl8yMFoAiytUEprOcOyWGZ5MNs3nx8uKArmHlttjZkk9uTbHwVjRnngivpHhlvQhkD766bheXNGgrTVc3eT51APfB3Yc1FL8oaov/2V+PxRCO/piohsw24y9zvef3t+/AdMDhDUlVJu6Nn7Afn8I5MKTEuOTA6V0nKEFgIo0bKVmkCuf3OGUCZegnBWqyknvdZSzhCyeVv64de+ttkOGv3LRcQ6AwG0Re1YAjIawXhsyXfxMRo434BK1wrmjdueEYu4yIwsaJCHmvRltJ/1PD6wH7dyK19mLAdKzMHnwoJIK9pZYRFC5x8awQL0j1Rqg++SrQKl3vtchmajPnoZQu86a+A4aLC394EiVvWp169Ne/dvHnIKNnjxLIYIf7JDfF90PPL02fZTzX+hexSIE4O2nmebadKFh6qfDNeyTxu4K9/xxc6Tx3VMzpCgJwjwFoNWhwO3ectuR6M0XDeRWb0mHu0A2qiGZYrWEuE8Uc4RrU7wBVxFhNoRzeHVKP3CGvDAcu/vHMXH4yRSFuo3FJ+WwTn5r2t0YLsXu4HAkuIXwSM9dFRazisXcbqz8/uwUUjIm5IRs+i7aLKAMbA9aHguNHR9/lkRG0atk
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pjSo4omwTZkBAN0xoopvaPEusWjtr/imYKu2/VClgVx4AAmAaZKwwD/bfRH3gEudfAFrXQFR0qaOFNfoDBLYoCmz7DZJW+zoqHWk4oio0dRXokPS2lA81sd2vOboMg4KzKdTVmzHap21xkFYRHRvhy/SnSUdJPI54+CFnqp2Muw00FkLjVM91Qzn4M/mH9Fq9mZbP/NpMGPwEFY0VSAiZCo6Ig3v8VCEJO5nw82cbuBN65uiC6TP1E9nR8GAvWrtPIWK8SJGa2PrAFlu1ICOGcJkT7w5C2NJWqYL4Ub0rQgHvidCnF8QwYDpBkP7pET01n4xJSF/wpJWA3YJsYw1dv8ND/pZPJ1PG12oyGGssIvkKeR8rGd6gHmLiKRdVzLxTHV6qZ3OcNc78PXLS6Q/344Pp86tFMhtbPfY2PM4vHm8+PQJ3l1o4fhdOFxglPqD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 21:27:23.0111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1cf4b1-13d0-4099-1374-08de85fe4f4a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF06C91DA0C

GSP-RM writes its printf messages to "logging buffers", which are blocks
of memory allocated by the driver.  The messages are encoded, so exposing
the buffers as debugfs entries allows the buffers to be extracted and
decoded by a special application.

When the driver loads, a /sys/kernel/debug/nova_core root entry is
created.  To do this, the normal module_pci_driver! macro call is
replaced with an explicit initialization function, as this allows
that debugfs entry to be created once for all GPUs.

Then in each GPU's initialization, a subdirectory based on the PCI
BDF name is created, and the logging buffer entries are created under
that.

Note: the debugfs entry has a file size of 0, because debugfs defaults
a 0 size and the Rust abstractions do not adjust it for the same of
the object.  Nouveau makes this adjustment manually in the driver.

Changes since v10:
1. Rebased onto drm-rust-next. Eliot's patches are now in drm-rust-next.
2. Fixed some comments in nova_core.rs
3. Added missing Tested-by's in patch #6

Timur Tabi (6):
  rust: device: add device name method
  rust: uaccess: add write_dma() for copying from DMA buffers to
    userspace
  rust: dma: implement BinaryWriter for CoherentAllocation<u8>
  gpu: nova-core: Replace module_pci_driver! with explicit module init
  gpu: nova-core: create debugfs root in module init
  gpu: nova-core: create GSP-RM logging buffers debugfs entries

 drivers/gpu/nova-core/gsp.rs       | 48 +++++++++++++---
 drivers/gpu/nova-core/nova_core.rs | 50 +++++++++++++++-
 rust/helpers/device.c              |  5 ++
 rust/kernel/device.rs              | 11 ++++
 rust/kernel/dma.rs                 | 35 +++++++++++-
 rust/kernel/uaccess.rs             | 92 ++++++++++++++++++++++++++----
 6 files changed, 220 insertions(+), 21 deletions(-)


base-commit: a19457958c3018783881c4416f272cd594f13049
-- 
2.53.0

