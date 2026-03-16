Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013004.outbound.protection.outlook.com [40.93.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA91235063
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 05:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773640682; cv=fail; b=N+1HdnLBzk0q6/XzFRF2wzyXKdbum1lf+cvMVIc8hnlOoaHv2eldnWaDJ3pUDMGd//2TxounbdsgANjqFSRa1t2eLFpR5gwNkuO2QH5YcIHTvowDokgq2DLQnxOc9i+wpW0rHXVESm8rPP8VUpKIih+/AS/Asyd7hOC1/5o8dCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773640682; c=relaxed/simple;
	bh=7ozLYMQALEuydPWGtFJY7YF/1lYxjMCMJM3Scpx+3Ho=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JTAxTTMi4P0stB7undUfDTuGS6Oc40d4ag+TqQmAdZqpiAFK8/zCYGIFVOReFaCTEyofydU014X3Xj0NoA7n2WUhpmznT8Jf4zO9eQdahNHRCv51doWvDHNdR/rw4ruW4uT3kHnl9Fe8F61cDTvdhfvighSqg7hIjSLfgTuNMQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nQDFQHb1; arc=fail smtp.client-ip=40.93.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nQDFQHb1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0vMPqZh2zlMH2HYiE99ATW8do4aUALeXChuPKHTniIwHV3b4nxe2PW/7ZiWbHm7nTZ/KaIu/R6aN4aP20xaMoQt+d0zD+XYLcpg28dZD6m92YWWhbEumVZ5F0PyqulqsCtlze0XbZUhv+dWGZQcYpa4E0BOdV4/dEjc3iWyS+9rL4q6Eb9TWdetK584M45s2s+b5K++7/xG1A/D1pUmo4Fcy1Ylpi4FLTRJ4i7GpWIIOBz5TBfTxqZd2bpbAbCqNtzfz2jkAWs1YaRsut6ZPlAyY4GvjJmhis1ceHpdXNZgxHZY0CGxos4+dPknBhlSj6+Ubjgl7LjVkjj2Qm8ixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1weMqM1HCSCUaCEjZgZqEbprYvaSfqvsEInA7IHC+Ic=;
 b=h7HJbTU8EuAimWydIuBzIlsH0tzvKbeJzehH5m8EH7fpgLSFL0ZOKSOrTwYuIRFvGoPtq0I2ii8gnumzPNyr2m2KJr0vn2IBob8y8l7iAI0PxDP06iob+Mkis9hSwUSQJmc1FW0GU3W5YQqP1UacczM9tE7olhCcg8ZWKe8uiMwDAeYm/eu04xx5EMi1vYcKR/B+W0oA5jc5u7F1vchJUtcZWOrvHcNcqqX5M0F7VJRvhEgos4JqZ4x7/W8gNEnYv5zztWBEA9MS82VbcBLQo/++hKozntex9YUPgjyaueRQEXE803YHa8pS67joc/L8SyJZXk5KoygtoBEwiS55Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1weMqM1HCSCUaCEjZgZqEbprYvaSfqvsEInA7IHC+Ic=;
 b=nQDFQHb1eRWrrji4PM0Ompb+IDIgzDJA2YqtIF9M3c2RN2ZKRvjYcQdp7J69Gu9pvbbVIeeTQV5LIIwcJOKoi+Z1BrtMYtE0wZNs1Pwd0YA42V+ueiifwEQASr3csjGoXaARq36dXm6wb0xJyo87vtlvHjOFCpN63wi0f8X7hrbtjK5+smOLR9g8ktNi0RFkiMQUEeP9UNlmQDYflqjZdKgW09UVN1gvsDRv5Msb6KoUBYc69VPuUsowwJp+LxIPpJPQ2Lnitowl5ksV8X8dKFswJBi5Yd7R/YZbzNJGiqvBbSrppYLupkmdD0GZHxFyz+hYuaPoDKWzmgGNrWqsbw==
Received: from MN2PR08CA0019.namprd08.prod.outlook.com (2603:10b6:208:239::24)
 by MN2PR12MB4375.namprd12.prod.outlook.com (2603:10b6:208:24f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 05:57:57 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:239:cafe::e4) by MN2PR08CA0019.outlook.office365.com
 (2603:10b6:208:239::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 05:57:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 05:57:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:47 -0700
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:45 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v9 0/6] gpu: nova-core: expose the logging buffers via debugfs
Date: Mon, 16 Mar 2026 00:57:30 -0500
Message-ID: <20260316055736.1690546-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|MN2PR12MB4375:EE_
X-MS-Office365-Filtering-Correlation-Id: f368f4cf-722b-456d-4e51-08de8320f90a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|921020|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+oj3mnxKYRXMGOQMqAYwzjXwzeI8gfNVNXFQFi8fngbuiiEi3CPJJE6/gsE63Yg07bCHbF4liXFW9zYl1Z7rY3+BRBqWea4Zmc6hezvgdxuBrY+PhinFfyhAExDA5zemmFeu6ykSYzHMWEn2c8KKklJ6O/x6uRQU50gWqlLburKJY3doKxhG9ZTfS55glV/pxjsS0q6OAFZCqrxKyUkAJxVlWcXBLfBSi/lu7eWzleGR0j5Nle2XmnW4DrlS6AHruodUrgbx2BpmNODZynGVkepbmecqUkc5vfhhlv1KHF3p65spvi579FTdH3JivWBxNoNApsXlfw1goEmzRpt2gkz2TcA8tbhuVjS/x863GcUIS42PAPbUnNH2V3j0foNUla3jZRTKNLKObuuYw/AXhPrl8TdIYGK3bmxNSf9T0kYHCBlJPgfyAZcjmMCkeSCUEOn8LebXVXp6UDDMttsBlopotMYFQVgMdk8PbibNWh6crzHmKHfoAAXV3xGKyL2GmZpFW4orEdZTZexRukXUFF7PTrd5kzxvNZJ8T/3BDuVGoqRnvPIt64HJuj5cC6UxdGj7qrrRRALyYbn9GG6u8idyLa0JypPSU054doEptWcZ1hTVwurZ8H4KjWcmlYUMK2bgTx0ZJDuQtYLfhVYP3M9TfMeQgKnhZYqIKrtScgKFlpeIG9YUF6CrnKDRAeEvOXYpGAi0JGSXAV4QJzlE12OLAyE9gQQJ+VXNSupBBjkS7tKploJ276DwAfSLe3XrPGykpQ69H2VEnmukkN2GFL2F047RBr7nH3ohB39dxPpPkllU6lLhTUBhqdzBj/gY
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(921020)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jUCRa9YjrNiOkilhfl0t2Pa6Jk8jo7BnFvFWnnvxDIcZhkQjDtfAgNxhF0kukOEl6bgFT4n6TbrCMSDpz++PsY1KOTGQi50SMRfpMGfvDfXlXpuDGWkAQsI+FhsiM9bgW+zRttzFLavNeiBdADBB1b4ssbdoCuGsb+NwT2fTQpZNIDzgb1wMZqIhzFCDiU35M0e0ZHvkr5geKP8D7R4aowUYncbWV+t/5pSxM353KuWEt6uXB0+UbOOySErhv0yOyg0dr++ni2k2VIcyk3rNI720s4AzMZv+4wN/o5fChQ0H3FHOdJLdf7r5QCco070CYbNRS416mjTvGcD/CwlnEfCBjqXbCnHZu/VcbM5sec4Gq2WJIWalQXPTvayRBrbIlZnnruW2nm62O+wVpeNLTWmz/YPJheMZn3VPTHBENlpjNo037EV/y3JBsEUkYFSl
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:57:57.1775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f368f4cf-722b-456d-4e51-08de8320f90a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4375

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

This series depends on Eliot Courtney's Cmdq patch set [1].

Note: the debugfs entry has a file size of 0, because debugfs defaults
a 0 size and the Rust abstractions do not adjust it for the same of
the object.  Nouveau makes this adjustment manually in the driver.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: John Hubbard <jhubbard@nvidia.com>

[1] https://lore.kernel.org/all/20260310-cmdq-locking-v4-0-4e5c4753c408@nvidia.com/

Changes since v8:
1. Added #inline to Device::name()
2. Fixed rustfmt issues again
3. Updated write_to_slice()
4. Dropped "use pin projection in method boot()"
5. Now depends on Eliot's Cmdq patch set
6. Misc nits fixed

Timur Tabi (6):
  rust: device: add device name method
  rust: uaccess: add write_dma() for copying from DMA buffers to
    userspace
  rust: dma: implement BinaryWriter for CoherentAllocation<u8>
  gpu: nova-core: Replace module_pci_driver! with explicit module init
  gpu: nova-core: create debugfs root in module init
  gpu: nova-core: create GSP-RM logging buffers debugfs entries

 drivers/gpu/nova-core/gsp.rs       | 49 ++++++++++++++---
 drivers/gpu/nova-core/nova_core.rs | 50 +++++++++++++++++-
 rust/helpers/device.c              |  5 ++
 rust/kernel/device.rs              | 11 ++++
 rust/kernel/dma.rs                 | 35 ++++++++++++-
 rust/kernel/uaccess.rs             | 84 ++++++++++++++++++++++++++----
 6 files changed, 213 insertions(+), 21 deletions(-)


base-commit: a544873ce0575b2fd8285a1364d3e09929d9a3ba
prerequisite-patch-id: fefd403caf8af386276351dd12397dda8ae8553f
prerequisite-patch-id: 3e02192944c4dde97e6895a28371479aa49ddc96
prerequisite-patch-id: de85fb30b65233210512b8295d7fe811f485f03f
prerequisite-patch-id: 4232928e15093c74aa6d2a6519a4d7ac5e109607
prerequisite-patch-id: d4f34f7eda8f5dcad2464f1bf3789e78556eb51c
-- 
2.51.0

