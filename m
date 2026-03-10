Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010060.outbound.protection.outlook.com [52.101.46.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97043BED75
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180042; cv=fail; b=gwaeRae5OH/oWHS2dgKv1KOrhxmT0Hw2QJS+LVcKtWGA1q2e2Zex1ZGjw6tMDDMxwqqc93GQ6sh5pICdpUvnLQ20Jh19+8RPUBNo0aqZ2v1Bc7/M37C9C2vzyZY1i1EJyXVPiZxpFNrsZKVTsur2WZmOMD7v6ixapHKTLglgeTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180042; c=relaxed/simple;
	bh=Xom3fzzAjUiH6pzWMScvjrcxMtsOthJDf4snriRIKeA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o6fa44kWPk4/XsKk3qA8Tn3Jidz6IDNXuU2lJG07K2U/+7Q12tr/gHgyqvuG0hDKnZeAN3uE6FCdOYA1bflfHeTICGIbxOKILfpBkjn1wA+h4D9t0FRL/qiLekPd4V3sQU43EgKThUP3WU6lddu4QtESImfIVwf6DAO9NakODZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r4O+A357; arc=fail smtp.client-ip=52.101.46.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r4O+A357"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slKdD+mNnQfELyILAyX68DNgV7/9eRmupZhFnr1DX6xjNHGLsa2GeKkYXGhGlyD0r5C6p17sVL781vAL4YTsq5z0U4gVkMtoAtyyFMv9CYDKvdEb7KuHcsiMnoCIpoSKY6fWERkeIYyOgTu6utnbX30JkOa75G1ZOVbNxpX8S1gxtk+WdbutQ0pvPnwJLUjl+qg2Ca+w5cAhm6pGYvMnFIz4Ry7zQGs4yqlvRY8B27iKkq/uuotCqhIlK33N80qUh0BopY/ZxAZTPvR7qDuUNgxUxkfdDaTsysPf4uL38NIVKQq3DCTYdDIyNDaA6gZlV/O+WqaMrwG6EkDJPCu7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3p4QnJavLuQNQ2a9UbxdOkRhNnwnXQieDH5vpOpBQA=;
 b=pxxrrDRVSqOSNsFvFXR4Vao7BaKyk4SKMbW2XdZ1dZvDW3oxsNmGBkfjsdAFWjJnehq9BQvI4ig1J/c/3aOTiv9ppRh7pObLIVLclIWPr0sFH0O5ejpNnaFNnDEY3OT9wTq/fnBBcvS/I0bkhluoK6fK07AUXzY86dDMF8YDJlAN2gWniML72KamLWrnAlszmdknRrGw9ikD7YuiKGOa1bGV1SmaJIWdUc6EOOF6LWUmJ/H23bWauatxYubwEdjvIaTM5eoG9KaXsYQQxv59H7EKvZr3yzlNQ9UBFsDEnM4zHaDG5QaEfLi5FQayzEb9VCqvryofc4lyfrPszK7kXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3p4QnJavLuQNQ2a9UbxdOkRhNnwnXQieDH5vpOpBQA=;
 b=r4O+A357uQxyzkRVSRXB/fKlWXnD58n2/W2Ue8/dz/KITIekSy/JepPhGAn6a+csc/Wt1XwpYi+MwfPwxSMGzHEpCFX85l7/cb0L4I70Fh1BkUBSHg7F2tPLkEYERz0lYezErMjU+my9pBx0m+XsIcQzVb5DqLlq2XUzbWFJE/nVmM7/BgDLX5sOPbw8fnN0mwO/u4T4wwbgJi4rhAOHCPfCeg48yWWySLlMzMwNxrFw/rOUTQq2n/1DjsuGbryXz5vWQ/pZN2Our1D2yJ9/TRYZmS0RQUoXYkd0r4mXzp9vXfai0UKAqe8aFloJlVEa00YHoWQgtOmc7I5sjeniuw==
Received: from SA9PR13CA0084.namprd13.prod.outlook.com (2603:10b6:806:23::29)
 by MW4PR12MB6778.namprd12.prod.outlook.com (2603:10b6:303:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:00:36 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:23:cafe::ee) by SA9PR13CA0084.outlook.office365.com
 (2603:10b6:806:23::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 22:00:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 22:00:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:14 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 15:00:12 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v8 0/7] gpu: nova-core: expose the logging buffers via debugfs
Date: Tue, 10 Mar 2026 16:59:53 -0500
Message-ID: <20260310220000.1897166-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|MW4PR12MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c671964-8759-4a75-1897-08de7ef07568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Id4xuvHbAujoJBpj1koBvqkUHicbT0E5beGUyUn/BmjAxLRyQg0nKoNxP8EuvxJMZnhK+lwM9+XZjDuTlu5qB7KEYPCIRYkYkjly0yEvIVLFiO67q3krPn3Dv8NLmDa620BQ6PGZ13vXlAGwxA72iBZ2c7GBBMnfYa3pI8Lgso/hJRPruLuYFAPqqrq5ZkYtVVOvf2q57WtzxUWeLMM7PqFdm0aOP/VWU7Cxx6GXXB0zjpzvOUD/cU0ZhSe6MK2+uJtWtKzuHmZZ0Us392NkupDP13J/l0ZAjiBpuBCYPmOqQ/uLZyZ4F3YZpCZq+urNcDLCKasOIlrGhdGToZWy+C1mHHbjn0dliAvqZ3/Iq7JBD/I9YkU3BPrlxQUqORQSsS5jkT9Imi9QF50F8DvfqcV+6lxlJX0LRtdi/2RT+8Rr766I7TNT6Ps4EVE+MK/yzcQWOft+2jjXEehij+yw4fbESH7fyq7rlGiIFeMufsMEVq+lUJUnIBLQfGTRr81QR3lzSWLxeCwoJPfzhgwrcnpLM699fPnd1nHJtNHh/SnIgyMrAl7yOkOErVb5Mu5UcIAPZKxxBodvdNVdr1G9mjLrdhRmPozG7tgZBWAE3aSBsaCg7R/HvBUszAtSu6K743xub+IQb7N8ny50c4SU94cGMoWAL/FxwCQoW89qUyRzgJI98fyqlX1zHzVx4Tc0a9hLqPmDY4yc9wOb6T5J4Eh8QOAzc5hVYeOpgc+dW+emxZr8MGAHFhj6k+pEXukyo6sxVBdOoU6A7zsoMkZlpQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IKLGyVKnAURF3Qk7Xvh0xvDYAQEg2a+Rze4GsOJVwU4SHkx8wSsF8wQO//sPrJ0Cs7ZLZ/QZimATTLf0iY/LtkjAQg4O28SgZmp+dTG7ERhY3aqkfyiz6wHZ/mEdBYBwCVnQaJM+VfZTiyK+GZ6DcHJFvO8BO1w87DnEyOAAhyUrwpZW5QWF7M4tPznP7SLUSNHYDim1qgFTOM2UiW548aOpofTD4btG4tH2ZyGmt/bGNkmzd6hbBKekKICiWR6MmuG+mjmJGEvQ5RdIVqhttSEacxIDt5yUksTTSIvVxMcVZ8ka4sTyfrywgsuNT0OrZekUKfhgSg+/b4Uz2F67E/RFHbZY5/8No2+frd2G1kUKEv9/4RsXHp31TsrMQz/y26UaT3eAag2kywBpq9EKYqJboJLFAGf9FF7bUeJHvRqrQ26XndABHUTsQXQaRN+s
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:00:35.8746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c671964-8759-4a75-1897-08de7ef07568
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6778

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

Note: the debugfs entry has a file size of 0, because debugfs defaults
a 0 size and the Rust abstractions do not adjust it for the same of
the object.  Nouveau makes this adjustment manually in the driver.

Changes since v7:
1. Fixed rustfmt complaints
2. Marked write_raw() as unsafe
3. rebased onto drm-rust-next

Timur Tabi (7):
  rust: device: add device name method
  rust: uaccess: add write_dma() for copying from DMA buffers to
    userspace
  rust: dma: implement BinaryWriter for CoherentAllocation<u8>
  gpu: nova-core: Replace module_pci_driver! with explicit module init
  gpu: nova-core: use pin projection in method boot()
  gpu: nova-core: create debugfs root in module init
  gpu: nova-core: create GSP-RM logging buffers debugfs entries

 drivers/gpu/nova-core/gsp.rs       | 49 ++++++++++++++---
 drivers/gpu/nova-core/gsp/boot.rs  | 14 ++---
 drivers/gpu/nova-core/nova_core.rs | 50 +++++++++++++++++-
 rust/helpers/device.c              |  5 ++
 rust/kernel/device.rs              | 10 ++++
 rust/kernel/dma.rs                 | 36 ++++++++++++-
 rust/kernel/uaccess.rs             | 84 ++++++++++++++++++++++++++----
 7 files changed, 221 insertions(+), 27 deletions(-)


base-commit: a544873ce0575b2fd8285a1364d3e09929d9a3ba
-- 
2.53.0

