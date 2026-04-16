Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012037.outbound.protection.outlook.com [52.101.43.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1829E3A3E6C
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 23:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776382318; cv=fail; b=Ju0Yc4ZCEmnK1OZP8HOmm0PuHNVD/20Gsbx8nTFU4YIzUSp3UMFcJGXbrgwpEM+dO6vRLwdNK4SvDY6OT+slrezPhqJN7Z1gn90+sG13Sg/pjavJ7x0l9eI01az5+638v4fidkKiTtPXIZ3UgrAamB+QwDV7gaIKVi/RZi4nfeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776382318; c=relaxed/simple;
	bh=lxBBxkpth9aCkgNlJwu5EoEGrTs1/rYVe+ChzpjRNlg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VMT8m+gJ0vPx4BKdg3s1eNC/Vu9ViGj88tGRbJqYBI+nDgqhzopByBhcM/dRRqnBkt3xznxE5mE3VynwHJppIIwLA8zttjQZEN6KTdfF0WwMP1D1Mh+xqAmWNIimLUlrwea8zDg4sUTURUlqGSFfb5YCPsDXa1lkDvLv+N2fwm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Qrd2rK7u; arc=fail smtp.client-ip=52.101.43.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qrd2rK7u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERX9ruTa/fNrTmdy3Ek5Ed+w2PVguiQkCWqkJSUusuyDnGv45aUATSVlvwyw8CMUooVFHl66jBeNchQci28pj3LGzRIbZzZ/pjjM5mIoMU4gyaLTQdRIMXIP7eddX8M+bViJ46dXeBySiiRcFSqCW7fwbmD9thna2u+tJhjctsFk6ySDQs45bOciUeFt/idleCMk0BO4XYjtLr+822kVPAJ3OZ7QaOojDyTRa54idPEuqu+Epu2fZFEVVOCVQN/K/XYN1/CYms4vagoMaPaS0EV2RQsX5YHHVa2txoDlWMDLagwDWg2vhiU4YJkHVYx8VLYygrudffS4Cjcgod3wEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IacRIPFJkCcDFGE4mgmNHsQVerYlxNeE7OZEAAGRxs0=;
 b=oT1bigOsaAx6lL/PbASJTSShZIaH/hDEWnVCAjgrZsohAHb3oJ5OKBJ8SXu9JR6uiV0QCedo1x8/itfCTOk0Ot6yaa6rsf2c+8LYKPCtb9TAoKWiQKYBBBXWWVgW5h68oQUbV66yN7ghijx+PhKJVsSleVUg1mJa/7gSET8jmMoN34n48sKQcVc9wUmz4pc6CyLLq/46N0B8ePkqwOlGnrH2NsGhoK9QG+D93nT5blJoGdp0EDMKKmOPq4dgtUMYmoEzqbDI5qTMFKiGPne+v9RxadyBUXWRLA2pjkMNgFcUMoz4H85/iNcdlgImllAL5Vg1RPlzrh+gk6ywRCRcuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IacRIPFJkCcDFGE4mgmNHsQVerYlxNeE7OZEAAGRxs0=;
 b=Qrd2rK7u8+iG6WKKFTGz77nRcS80hD351n9oZz11JbytBXGFiQmV3dCictvl+cY7cCRNCNiCg1lJlVqzDXGa4Lk2j6FwJsDMO+5nqoB13znLxmCg+m5+TrfE7IAqKpS+AmlwLG/QCtRTPdTA3uP+dDR7BKPusM00qjdvWDZy0elhqN4lFB6tGDNXprzUJCahpLpj8gzcDY+Qqmj9vF6x0ma96T8GAObB9txr/IEf6SqVeRp1+F2LYKzSdB3hJ6ll119NxG9OZbUhcu0cdtgbqOuQEf86MgXtPTT7CyD26vAOzF38TMqZMXtTA6RMqoWA0/0ERuAq+mlWOXjEfDeDnQ==
Received: from SJ0PR03CA0130.namprd03.prod.outlook.com (2603:10b6:a03:33c::15)
 by MW4PR12MB7190.namprd12.prod.outlook.com (2603:10b6:303:225::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 23:31:45 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::5b) by SJ0PR03CA0130.outlook.office365.com
 (2603:10b6:a03:33c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 23:31:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 23:31:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:25 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 16:31:24 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 0/6] gpu: nova-core: add GA100 support
Date: Thu, 16 Apr 2026 18:31:11 -0500
Message-ID: <20260416233117.1057427-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|MW4PR12MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: d48a074d-8ce1-4e0b-60e3-08de9c1052d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	b+kdTXugOLBeBTCuJC+mhizQf09Q1I3/Q3TD2mjipLikgc4w1f5zLZKS6P0mJ2iA3Vx7oLzrIo6zeIASE7QXYhaJH2V37CNBIuYnJtlzNYBBwl3l+cZkAtticUs8nGZlsZP00DhP8BpUNhvz+H74SnHxXCo6BiBduSDlGZVK0tX0wrBtLReJKFhx3xehWKzlPn6fKq5q6gDUtS/28V+/jCcZYhw5HOMOKZI3rnm3FIW/bynpPlCTFRWnQBdnQr2Gu2YNma3OqHTwSayKPH+GfCctbADGt+PMyBkENFsyovZ989Tv+gdNWzVv3VbwBirV2f0etzQhiTQD4rb/2+syovAwd6mnT2ekR0jR+CsYxGZA4uFcHFvuyOb7xWON78fSBSbvLjr9qRcth1GT3vQo/LQeSxnwYkz3B+3UKSWmezruRPl9Z+OmxhKgKd5ve7/+DSAlD4d+EZ75joGDkBeKvZghBl6ClKC4mrCuev4KhiCY942bdHOaj5JQr1fGNvJJ7G1+XgaA74iV1q60zICNxW11m8xlQ7HHngd9+/p0AK1QbHDcYYbArfukhDOfgLRFhr4fnXAgWVsc6lIM1mMwAjb5ROzTUx0RfG9QAqrMqoZx/tIlBjj+HyoYHYDUMRrFhnEuIKTI0ZVFmizCJAh4YetlLA3ZfyeJVtUkRNdcXc40j2h66yN54xm2h1PSY3UFbJZskzFw5CA+4ms/S6DFV5cN/U4UchD1wzuWbS6qRUJajvNI9vMbz0U/VGsIDYV89wbGiny7xK9yZTgWfvHaAw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ld6Ub/J77X+tsN9sW3QLbjBK8c1P9dSodZSoZIs24ZMyCA5WOpEq+UwQT9jriZmTnBouS4cEYQ7q6OgKM8fHVNMHqnSjqd/YZ/wxxC49y2PVrnPYquyIPJZtFdlbbOyq6F+LBch3odPiLC2EEldhuZesGOg2drI/i16+EeQu1VpKPFJrhnQqYTDKiCyvimO1UXQWXjMr2sN5/ncyehiv/7q3ucccsZu3SKMs9VqQkXa6q3EyRnllcDOa0YsmDFpi/2r25kyLe0eVRwigrfErSHoG17YRnoJ65h5jpxlHY4kUq1gifLywBnf9APP8P4tT0MCSAh3O6MIMQk20firAEHm0KHntFa+GVsWRvMjDExJmN+YlTjVYrobZHcByJLcpRnqvYDty6J5DzVWhUkYPWuyT/xWAOyAi1Q127qgizXNV+rZZ4MYvKNoRV+/p5Rm
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 23:31:45.5206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d48a074d-8ce1-4e0b-60e3-08de9c1052d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7190

GA100 is an odd GPU.  Architecturally, it's an Ampere.  However, it
uses the same GSP-RM boot process as a Turing.  Its VBIOS, for whatever
reason, has an IFR header that precedes the PCI ROM header and must
be skipped.  In addition, the FRTS window size must be set to 0 just
because it's a GA100.

So add all the missing code that GA100 needs to be supported.  There was
some infrastructure already for GA100 (e.g. the FbHal), but it was
incomplete.

Changes in v4:
1) Added a couple missing reviewed-bys
2) Removed IFR header v1/v2 "expect" comment

Timur Tabi (6):
  gpu: nova-core: use correct fwsignature for GA100
  gpu: nova-core: do not consider 0xBB77 as a valid PCI ROM header
    signature
  gpu: nova-core: only boot FRTS if its region is allocated
  gpu: nova-core: add FbHal::frts_size() for GA100 support
  gpu: nova-core: skip the IFR header if present
  gpu: nova-core: enable GA100

 drivers/gpu/nova-core/falcon/hal.rs   |  2 +-
 drivers/gpu/nova-core/fb.rs           |  6 +--
 drivers/gpu/nova-core/fb/hal.rs       |  3 ++
 drivers/gpu/nova-core/fb/hal/ga100.rs |  6 +++
 drivers/gpu/nova-core/fb/hal/ga102.rs |  4 ++
 drivers/gpu/nova-core/fb/hal/tu102.rs | 11 ++++-
 drivers/gpu/nova-core/firmware/gsp.rs |  3 +-
 drivers/gpu/nova-core/gsp/boot.rs     |  5 ++-
 drivers/gpu/nova-core/regs.rs         | 21 +++++++++
 drivers/gpu/nova-core/vbios.rs        | 62 ++++++++++++++++++++++++++-
 10 files changed, 113 insertions(+), 10 deletions(-)


base-commit: 8884dbc1fd174315b406027375bb7a4b211a8fae
-- 
2.53.0

