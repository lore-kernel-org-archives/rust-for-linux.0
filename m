Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36693A7F45
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 23:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773791676; cv=fail; b=Y8q6TZI9l4qQeHClAMv7aYYbTIHHhA/uS4tFoWePqMLYwWlGH3c6rHRbYuVPNnDdYS2yhyh75DzJaqei69D8XZt9PWy4JJR6EN4OZe06aA3afMWgjcaYbdyjR2u0eYLOVPn5HjNlSP3S6RkxqeP1rW9PsooSMA/lTCXgCIvC7hU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773791676; c=relaxed/simple;
	bh=RVr48aCaoHLRBSIKXyVjPQA83ZrDaqJNH2f6CV5yF6Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uYgKtb2laMxHYno/rDUNlgIDDr3nPxURmhcXxdlAWxe+kZQi4PWx8L5xiCHHiE35EwKinOhRNddXvPf667iU4arsHah+K1zjfdWA4/akMluFseMYANppzWeDLjzBuOBb8cEgO1jhulWN5Yf8f/1BOwlo0Jl7urUYFmMT6WEt634=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LXgne0kq; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LXgne0kq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWt4fbHDUmmagOOrpITfvKz8cQTwW1ulWZwMdseg42hrcfw0HMPc5eu17aKba7wIE9De5ZajZXjTHZZvuSY+MJQOcJI1f36wP06YqDs9mQHot12w2/j2XJ48vjRK0MlKQq16VlELdjIThnyOkTuaku67Vq2Im3GZ84ejtrIGGN4k1qnFpMcRUxjT+bZ6XdU+HBMjM9cEYuMAcllIOWUZdD07ubhxBcI73JlCzwRAbXizgU/mBl5/IwkN7Ok006skuwMa997C+IIKcOXRlE6B1WgDJTv0E9U7jp1c7XCt9K+ZYTBZyp3Pj/lgytxChNNtxhomVdpM9P5M3VmgX5kPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WiOEN44HVWVIuSvBDA2sXlGqEfMO1gcdciVRMQCo00=;
 b=YCqCQIsPQVBqhxQs3VEKXfDZYyQc8qWRu4hUUnT71tRJWUfYi+9S3LWUKWWPPLBKFQHnbWRkMum+N9tXpUTn4y4rGHM0wMfUG5FT6jVySJlZrRfq3NnT3fl/vqTM1Crlpqm2MHmy+OOjFcFUrcEd9rAdVEok3Ct4rREk6qx63ihycp92Lzf3eSC855OdrgIqlXy02pEWsm8C40vZJOWTYLYedRgOfm445T3H9MZs6s+4jF1SBdNYK7UFJE4XF+XvLSI8xEoLObtr9YOqUF0Cb2F2g+/Z0YVsZp7pmluKtkfJzeOgHmXqucn3VCAZI9MiPm42fVAb0lB/68fgDPgcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WiOEN44HVWVIuSvBDA2sXlGqEfMO1gcdciVRMQCo00=;
 b=LXgne0kqkhXlqj1yT2m8+CVM2i3cRi4emQKVl8NEPsgbO4855Za+XALAqRLrb1CBgE9i20J0MCOCCa7C7PYJ+mAq/tJ+yPo5cucEiVNt4OJb/3JJO0fVfowwn9K1AeikRoXsqcWgjqqluKG4P53OxPUa6MY25p6gGESVio9pcq9m9C6xF5cjTCG+WT3Cz4HnrYn8853dF9xzYJ0MGMcFWIKojeKTVwUr1FTblNCjO3pdwEJZn8CbxuRvgAAdydyLzBhR5sNcTZKQcSxlOnRS2hkJKSQ1QXEstXzcvp/RUDi9YZDnS8s4RuHZQMWYt0PsyiDa2WKDJurAJ9TItEyowQ==
Received: from MN2PR20CA0001.namprd20.prod.outlook.com (2603:10b6:208:e8::14)
 by SA1PR12MB9516.namprd12.prod.outlook.com (2603:10b6:806:45b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 23:54:30 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:208:e8:cafe::36) by MN2PR20CA0001.outlook.office365.com
 (2603:10b6:208:e8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 23:54:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Tue, 17 Mar 2026 23:54:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:12 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:11 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v10 0/6] gpu: nova-core: expose the logging buffers via debugfs
Date: Tue, 17 Mar 2026 18:53:57 -0500
Message-ID: <20260317235403.1094713-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|SA1PR12MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: 04fec476-3933-4b1c-f87b-08de848087d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|921020|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o2kk5zMkKsX0krTxc9nbwSQtWgq3S+6bxvahbMw7uDzGopGTgacVPz3EBRcTnLpuqyJ3CUyaMfo3CTKUCC/lqskQ61pVTqS51rWGgwAka1+nfyvvjx97nuCo3c3YHawUGgoF6VFsi68qCRcT7XgjxSpy5tPpju0X9eepM2pbkil5iv938l0t5yet5XLYIRqS68A/iNOssipk8juvwJeSvERzHNU38YYaSnZroKup8O/Frk6pyuFGYgEAwJyBIKXcUVnnawA4vk7CL0rnYGwy2aoTootLGySTmMT+IB7Mehcp8vXhcOEjWYT0FIcRtNhbDfSADkzD73aaXKCtAdZIKrnnHkQCi3X1QoSu94bnemMDcIc0HuvTtzUF1MDy6RucR8s9piQbfJrLHtzw6YMYRzH9SLim3B3aeJn1xaOiOI+iLqEsWyakVEQ1Yz7IfRGObp3r66Mtpc3jxNcMqM2135VPfW1AOOWJVaTaVJibwV4aOz4ch7BrZhahQ6O6fYtK3DRplChHXG3eN/qCIE7SybmytkQAOEHoCiTAFXDoYe5aAJ+LStU8kS8eCwRfC1XJiwBB1KtLA9KEoNgAMUdQQHkISTe5nUr6PAzhBnb5prjFMTTy4n6ji0eijA/d9LyouzRNqqMLGWcz6cbFp4myT24tzVjyDe3bUDSva+zJcygYuuEMQi/Vu0H3enevkAiLfWrASxkrcX9vOrChSdHCsNSw036DTudn9bfqzQYLrKUU2u9vwiYO85LN8cjPmQIdawo6YTJRkFShhyfnfkvCbmpoMOf9QaeT8iDsUs3LezY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(921020)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vO2jfzXsHlVjMDT+UyV0D3oy8VQO1WCQuoUzugu+xXjaUewVPif6dckg/iiPFLKP9+jLXb/x+hKiJDkfsQS0rvPZLcDO6FUpzyDWl+N5i2Z/fw4/KIY6px/7DywzSqMLI0fB0J+OJH2Ex4Ix2a1XfrlfmT6tO0tgkkZZvM4sW4KLiMsuHvfG5Bucz/tpAdLlgJGb9yNtChrybQPHGWUUksVl6yIUjcy/OPL5STALizYBTnFE0ggfCBi1xHKqU5ZVDd8xzRUViEsWgJsyAozqlO/BjsmP25Xxb7ch95xGPj9Ki0r+L1mlSkLa2oWYGjykUcvfbchL2rqGG1+UJSTsMiyiTXxEYizEObv61C2KQFHe095Zxny88mGfbyUplaek3cKY4Y8qEiuHB3u742HOVcs5i+qOayk0esfudGnySDi9tVNtvlKbU+Jn1LAnWvPC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 23:54:30.1144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04fec476-3933-4b1c-f87b-08de848087d8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9516

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

This series depends on Eliot Courtney's Cmdq patch set [1].

Note: the debugfs entry has a file size of 0, because debugfs defaults
a 0 size and the Rust abstractions do not adjust it for the same of
the object.  Nouveau makes this adjustment manually in the driver.

[1] https://lore.kernel.org/all/20260310-cmdq-locking-v4-0-4e5c4753c408@nvidia.com/

Changes since v9:
1. Rebased onto drm-rust-next and resolved merge conflicts
2. Replaced c_str! macro with 'c' prefix
3. Improved safety and function comments in uaccess.rs
4. Replaced self.count() with more appropos self.size()
5. Added example to write_dma()

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


base-commit: 76bce7ac51673640a4a46236ea723cf5543268d7
prerequisite-patch-id: fefd403caf8af386276351dd12397dda8ae8553f
prerequisite-patch-id: 3e02192944c4dde97e6895a28371479aa49ddc96
prerequisite-patch-id: f5f44c25a817e1e539a8418c88fe1e99d06b2c34
prerequisite-patch-id: 45041e4ac74e3ea76ea8dd0632e7746418bdf822
prerequisite-patch-id: d4f34f7eda8f5dcad2464f1bf3789e78556eb51c
-- 
2.53.0

