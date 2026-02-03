Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010038.outbound.protection.outlook.com [40.93.198.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663D3310763
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 22:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770158922; cv=fail; b=PHnXF7Fu4iDyNlpyOpWPimS+QMi/8q9nepbRIowu0l7YU2r84w0h8WsNgMM3YpzDFQoGhcA1eZy5uw/nAk3aYHCQVWIGE8VDFEPriEIaux0gK1VNZB3nMGQw6FT3FUbVYK7PmtMpjeljgNSLrLUENcxGFdlfwbr4JIqqZje7k2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770158922; c=relaxed/simple;
	bh=vHmvxEeN0LZGvSyikWn77ZZ/sJIZ8GrL+xDyU3ha7uU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PNaW/M/kWhBt8VyUZ8/P69LWVN6TW5PjKduexm8+O9vHrh5EnfbwWMOTBUiLfFOnG1IH7EnZQSEtCgIJOR9RfiyjWtpJE1XxY2eFJ3svr6PIBls6Vsm9Yx7mkhEF5GOa5CVyiCGYnQjJLimyiTsyGrgjipQYfCuoFsTob8l8KVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HslpBaZc; arc=fail smtp.client-ip=40.93.198.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HslpBaZc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIexiBMN/kwLmAHiaVGM0RiZIb5gOsWe5ypWe/N9nMLUbQ/SstLqDQqAfxWspIqHoXi0ZxKtxV2bnA8YdEmXoDzmj0BXxZUd7aTymILymDhZBLdnlVoC+5iVQ6CGCs2yxmZNoxKFE1DzaE/43qRypoivk65wR7U2BlY3kG3Rmx6FKipE+35v50p4NwkDotRNOV3VrbGYbU/eDD3G1d3dXyDgl7PWGNrLumqBosya019sdK7dNdcimT0Vz6q8E6b4/8H0q57HrQTHLOjalrKPytJaoJlMUvRD37KKYsy8Ol097rbfh/LzsxfgDLQW7LJbbibDSDbs8hmVrUYZGnFjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QL/wfpkmEPpSccAQF8mCUxXpa66Eyj2XUxNNOWrJ0XI=;
 b=Eq2XX+LlNTvp+UwKFwOBJSbn6StZQbWnqjYCY3lLt3oHQhkhs2/3kXz6MoRTNyyXyPcEqSFdKBHGdQNeq13heXrIq/0IjPw1dFCt/ZbJfcTLrp6IAjDvSOL2atX0h0LtShtLzTHPBrTNE2fMf9ZTDcm7A161kwhYU+xo32ANYgK+x3tbxq9s5Ukf1lpxyueTZs7ktm5JAbwUw9YCSbKP3B++fKqMR1ePIStLKC0xjSa7droo9SsBK8hLL6u4y3UW1R6w8Y0Jfh4bhIjhOx+2fHH49XnpoWSjeKe/w1anjOOICgGDUDNpZ3OmHTSE/23Qlh+80Co3CtVyyGOKc+Lwgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QL/wfpkmEPpSccAQF8mCUxXpa66Eyj2XUxNNOWrJ0XI=;
 b=HslpBaZcxnJg/w24cEHRoaYY8skfVlCOJr+j0xaS36Xq8VsT/eGdh0rtTgDus5BB4VTAVALQ0zoLdocWODYTVfuprdj7Pnq5lp5HQdp2iJtwZB78LdJ7c/tZZSYVVwQ9Shy8BEv8kFcseb41urx5UeXTp+1002sVA7dhC/T6slId2zdSw91Ffou0jeBvJuIgWBEiVeRqMz3XepxqMOyqbNEbABkjpHMzpkATm9Mwot79Hw4oW+/DbyzYdxi7i5JSBkRiV5fcRfPlS/Rt1zOgq9S+Td9qmcmmXSdUZnzDEgs5gn7KA13IekbiEaO53jAit3VW8Cl8Rv9ovTtngEsaug==
Received: from BN9PR03CA0556.namprd03.prod.outlook.com (2603:10b6:408:138::21)
 by DS2PR12MB9591.namprd12.prod.outlook.com (2603:10b6:8:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 3 Feb
 2026 22:48:33 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:138:cafe::1) by BN9PR03CA0556.outlook.office365.com
 (2603:10b6:408:138::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 22:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 22:48:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:06 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 14:48:05 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v7 0/7] gpu: nova-core: expose the logging buffers via debugfs
Date: Tue, 3 Feb 2026 16:47:50 -0600
Message-ID: <20260203224757.871729-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|DS2PR12MB9591:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f638457-17f9-4e4f-1514-08de63765a82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p/Js5yq9UKQZa2o/umt+SAbsO5G98AY/F1gT1x462pLwM3Tj/AAfAyZyLdWn?=
 =?us-ascii?Q?PnEXkX0PbXPDlugGOEkzsBrLeMjCIfJk0tiZNBnoEHL0pVwdLwMeGd56rYqL?=
 =?us-ascii?Q?16sORpwa/3ieu/qZ8qUKgQoDCFg++eVPM32XQNKCR4CF7nM0sMOZjNdfRfEG?=
 =?us-ascii?Q?QAlXy0NZE7LEpYfvlW49xxdqTkNjltpW5uRKgtVrPIy8H21LtR2a2tma/P55?=
 =?us-ascii?Q?mim0VqrGG/MTGQqTOSWac8eTtepT2OFhFnwCF8leFPVJrCO8swSr9EY8ciqy?=
 =?us-ascii?Q?6VHM+lPQ+AXygIY2jsEIwbQ241JURTm//OSjbUJBTcgQ1y5b9bEb3DSiO0pl?=
 =?us-ascii?Q?cLfjdH/UegjIm42vE/pbwYpOlztWn3ldy+k/cTZJyYUJG4laSb8JlnyflxN0?=
 =?us-ascii?Q?Rwl4sjtaPhCakyrRAIrgHE75ke5apIrZh5wRnqlKlNSay4MwbOhj+2hKiaI0?=
 =?us-ascii?Q?LFchNlAoT2eGn+iyFOQvNxUtyJjS5dt6hHBm2H/PQRKcxZIh2qM+DbtObhNk?=
 =?us-ascii?Q?JhxymJ9cqC26AOq8J+EDVh1M97z3++rqeCb4qW9pWMiT9ZUUuc92kpYfiWdG?=
 =?us-ascii?Q?ftrNSeln2hcH88YkantftgtaUuZlIOZpauP4doKLGGoRoNCoq+ji+anI99On?=
 =?us-ascii?Q?yXQ3oY/2Rcn978qovcQDaO6wqLe6q7TvP7LsGaPAFKLBoM/pn9ixBeKbbKH3?=
 =?us-ascii?Q?ihDBB9l1vNCt1V/d+B7Bd3zot/kCGFXgxbFuzZKa875kTFw6V473NhgBGWPA?=
 =?us-ascii?Q?bMyLJI4R9OkF1P7kCbmVYCkeI20NHnYG9m+eEPVFmF+LPmiDi4bOQIbclk4A?=
 =?us-ascii?Q?SFnf4p8MglbLry95UDUcwJqIG0V8qqaUH44VUp9rKlsZXwiws9sLUIHkCdYJ?=
 =?us-ascii?Q?beEs3eapRJOJ9TXPsp820XYWYwCdH1vOqjy+N6MHtpjgOgZ4sVLi5cZFiL/3?=
 =?us-ascii?Q?0Yv6aSgiqZS6EbmKZjWdM5slQbJ/25u3XXf+EQ+G0UoR2mm9Vl2BPxTBWeYi?=
 =?us-ascii?Q?Kv274B3quIO0waMb+c0HCcprdxtlOBPKVSv490NbVF3vO7PObkByzacCya/J?=
 =?us-ascii?Q?3Ld6sW9yX7orPDfzUDp/Qnn1+WiuQ3MhISQUTrkFmtnDHLVPzKLB85Au1giF?=
 =?us-ascii?Q?NBTFOllXIM8KH9D3neOYcJyaLpYQKdGY+G7KgKXcayatEiq8a3CIXagmP8v7?=
 =?us-ascii?Q?VVC7kmp3fjvZDQmBppZ9klXAnJjE9IzXJs+vOat0kgsjQGxLxilNiHYQGyUU?=
 =?us-ascii?Q?PUmwBrLXht9LA6DNZzRCEINDHJ5w5o+1V+U/9ohFU+2RLziX1IF053eRHhxa?=
 =?us-ascii?Q?LKGIKd+41jAMwI9WLhH7QUotghfGGTO2TXOietPTynLlvgB5JR9lODa6rTBk?=
 =?us-ascii?Q?fMdkLDyNze+cl6IZbduLUXnDCdh+DYN+dJPZEu1qYvs77bW0rNLOZOIdgTiV?=
 =?us-ascii?Q?QZynoYQ7PD9sV13wJc/Yv1thalTsPNV4FRH7qPwkNPj1LqaubYp9lFAwZYxQ?=
 =?us-ascii?Q?vJvWin+5WZlYodI0ahd+EwNWp5TVP83+F3vX5CUrzgtMqBloGr9+APOoKTrs?=
 =?us-ascii?Q?YZC8a4yTCpONiRqH7O3QscczmJG6Um++OesE7Cod01V5TbxxFXFeIYiXwR0E?=
 =?us-ascii?Q?1yT1kKvrwxdgHtCqTAB4OBo75j5qcfiDRy0fIrq7UCDO8VchYJTZ1UU7GLcm?=
 =?us-ascii?Q?0RiTyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E+WUwXwr5r9gSg5P9x/PstZ26DB14dWIKYfuYN7kcrBUQEdLsOc2BSp4p70vC90up/11McMhNFAaTOmiuhWNBvWLaaS12XocyK/tEzVWHBl3VfNXK+qf06pC6nmz33wn7J7tiDXW/FL9RyLLWeiyPJybu7HRuS1yjr7UK3i4GQK4cVTY8iN5ZMQMFlTyOmv9gdmdayHqtldcJvuAh+nCuBZEZkaG3p5nFBQO+UABuVS2W6c07v4mjbZyXUl9BKAd7dbJrxtT4Y+5rV1uGgp3pWe46H+KGunDr/3OzpYiR7NtjSoWXZ10Mt6HJbbA6BthHaYqd20OjCVjhbCUAvZNeGn0oEWe5hurmWpLbwSVkD4vhyYlBVRGeKDsU+xoC0gi8wfOaJ//OmG+Hx+bTFPRMQ15gpVOPJ1RGINJfzmIDWYWc2TuKVPZILROPbnxYL4d
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:48:30.7106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f638457-17f9-4e4f-1514-08de63765a82
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9591

GSP-RM writes its printf message to "logging buffers", which are blocks
memory allocated by the driver.  The messages are encoded, so exposing
the buffers as debugfs entries allows the buffers to be extracted and
decoded by a special application.

When the driver loads, a /sys/kernel/debug/nova_core root entry is
created.  To do this, the normal module_pci_driver! macro call is
replaced with an explicit initialization function, as this allows
that debugfs entry to be created once for all GPUs.

Then in each GPU's initialization, a subdirectory based on the PCI
BDF name is created, and the logging buffer entries are created under
that.

These entries are gated on a CONFIG_NOVA_CORE_DEBUGFS Kconfig option.

Note: the debugfs entry has a file size of 0, because debugfs defaults
a 0 size and the Rust abstractions do not adjust it for the same of
the object.  Nouveau makes this adjustment manually in the driver.

Changes since v6:
1. Removed NOVA_CORE_DEBUGFS Kconfig
2. Expanded some SAFETY and PANIC comments
3. Added write_dma() and write_raw()
4. Renamed BinaryWriter patch
5. Moved misplaced diff in BinaryWriter patch
6. Miscellaneous minor changes.

Timur Tabi (7):
  rust: device: add device name method
  rust: uaccess: add write_dma() for copying from DMA buffers to
    userspace
  rust: dma: implement BinaryWriter for CoherentAllocation<u8>
  gpu: nova-core: Replace module_pci_driver! with explicit module init
  gpu: nova-core: use pin projection in method boot()
  gpu: nova-core: create debugfs root in module init
  gpu: nova-core: create GSP-RM logging buffers debugfs entries

 drivers/gpu/nova-core/gsp.rs       | 49 ++++++++++++++++----
 drivers/gpu/nova-core/gsp/boot.rs  | 14 +++---
 drivers/gpu/nova-core/nova_core.rs | 50 +++++++++++++++++++-
 rust/helpers/device.c              |  5 ++
 rust/kernel/device.rs              | 10 ++++
 rust/kernel/dma.rs                 | 36 ++++++++++++++-
 rust/kernel/uaccess.rs             | 74 +++++++++++++++++++++++++-----
 7 files changed, 210 insertions(+), 28 deletions(-)


base-commit: cea7b66a80412e2a5b74627b89ae25f1d0110a4b
-- 
2.52.0

