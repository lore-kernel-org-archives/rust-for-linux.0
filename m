Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012049.outbound.protection.outlook.com [52.101.48.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A17E7260D
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 03:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766029529; cv=fail; b=dxVEIvVWZ2uIGBBc+pGbv3Y5vQ34VFRjQPTFbJYWheNAitTOB+OzHZmaWhE/JJV6zsdVmQMs3nCI1bK4iGUolGKc/jBbBOnvJPVdoUXVFgJih82kztOwqSHkPavXuNRRNXH3f/V2WGfYL4dnbJ4+I8sdrlO7Fnb4Ao5dH8nd0WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766029529; c=relaxed/simple;
	bh=MYALbvSVbQZhVZyxO/bebE2DG3Y54pVXdVQVtZyN6FM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oF9N8GPSMaFjflMEDcsHNE7ZDCV9T17vGMmSkda+6ivCjpeYxzQRoZr9ABpmaJ+kM+2wSy4wARctgxMDW7mmjddwSYv5PwtFLmFc434fGzw0hdfS7Il5bSS24kB5OGocLObo1Y0t1zoKrkJsn2MW/owhKfNl5GrazhiaXoVX9Fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W0u5eok3; arc=fail smtp.client-ip=52.101.48.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W0u5eok3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8+beHqMI4szDFpE5KtEtMVtf03dW3JwW8BllF3lfX+KIyuXz5DW8eKMQ7E5drkmz+9IKy4lLH73KNyFka3gr1k0IMkpsOc0mTX0Jg9AUr4PqLl1837SSpxQv8pcaSmwBjNrgwhwTuT3QkCyuIVjGwiNKfUYG5cR/Fi/53hiDVKr8/1A2KWV+4NHXLWqpw9img6lYQ5wIYvN9q5g91+zgp9LYmSU6KfP20ZOe1GRy9AWVdscZQqWg2cUB+AmMQmbIC3yIPyaat2l+4HaUPyf1vyLYCLO3wWvteTqz0UgMSc6idll0qq7XN8eeMiiKUvJY/HN3tvYOFBDoxniJA8MBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVzwdXPG7jOAjEXpkrMTXKL21CMI3OVwF93KpTsD5gI=;
 b=xK9WWjyiQOaYW/wNIBXl1EUQcmoITU+dMv/sKYS29DFvtVYI35xaH5bx4iTrgZG3qzVpT5TVovaX4uYvfYZVNWtIvsadG7f7F6YyjxwEohB6WPIf4zVAQnkhF1EKT6hKHBfGG3tcQoBzgaTWVPcQAk5A2xuDKG/VqURApUKscNo4kLiMQCm+u4wDrFjkgdUp5b7K6h9+gTPSpkpAVaUFimAALDxBMpxWk2QXQEj469ZhQ5hhmeBvBFIXjz/7Oo1/NM5nGGTwMaaVMnnxvpFN0f5Vd3MnK6vpGCyBAMzhb02FepvJXoykrQn71ZDXIIHQjZGiaeanl7BsjqKcVWsHZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVzwdXPG7jOAjEXpkrMTXKL21CMI3OVwF93KpTsD5gI=;
 b=W0u5eok3UeTcy9RFi8zzBZ8atEy4rgkAiurZ9phU9WRz5xj2EiJaH9WxMbor7dBjd8wF1hMr+HpmSaFGxwteCxAFVc9MEP585tNX4VqCI5Zp7ff6xmlayl5nZsT8UUe69wTOuKxBU/7Pc8qA5OzSIbf+Fdk9mmxYrEFC9fFCWyG/+TTEHO0CC3pIvDHxRG1VvTVLvb5X7Zau1QdJuoJzXq817x8LCx5K2NsyOJnV/cBZ8rPcauGXzJSdhBJZBlM4N9acO4O2xkOSrAssGNzbMT8YluFM+idWS7o/dxQkdMHEzD1rAM2m907q/xfw1D+0zSeZd95U3gojKgVHm8YFNw==
Received: from BY3PR10CA0003.namprd10.prod.outlook.com (2603:10b6:a03:255::8)
 by CH0PR12MB8506.namprd12.prod.outlook.com (2603:10b6:610:18a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 03:30:30 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::e4) by BY3PR10CA0003.outlook.office365.com
 (2603:10b6:a03:255::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 03:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 03:30:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:12 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:10 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 08/11] gpu: nova-core: add Falcon HAL method supports_dma()
Date: Wed, 17 Dec 2025 21:29:52 -0600
Message-ID: <20251218032955.979623-9-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218032955.979623-1-ttabi@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|CH0PR12MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7d2666-5d01-4bdc-dbfc-08de3de5cb44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bPhqXQ/aUXjA7c8PD71m9JnHAUp9zpNiT0/LknlSlRe6x/+0jmOlbG02zth8?=
 =?us-ascii?Q?MO998gYRbUVwdIwpRF87bYy87zSdZiiFthj1EfTFm4Z6CLylCrayuYPPMv4r?=
 =?us-ascii?Q?vvLT9C+CRboksbJGHoDswWIN2edsfhXTefKpmV55CxV05wTZ3PSwaZopxZpq?=
 =?us-ascii?Q?aXKF9qHhGrGvfKiGn2O3lNpiMz/tAElR4u4k4fuj5dWe4R+pgq6Eg2+HRoXh?=
 =?us-ascii?Q?l3enpzwrv94PKjebzl09HO7tOu1JHPZ6qg43F2dffrIyDGAVxYqb5QhZLzmM?=
 =?us-ascii?Q?VKvqyG9NWWaHOKyEhjrvYE+4aLa2sjb7HHMFJGftI/ULUBMe9g6LlgIENBfb?=
 =?us-ascii?Q?/0uhOPE2WCPqu+yvpuLB7cman2hSRJy6IzZsgfmgz7xEG/jy2xMcMkuHzSM5?=
 =?us-ascii?Q?VHEuKF6kq27qUiASxFqrY6n042BvBwsHu4eYqXN3jRCrUKwKJ8LUVt6QrgKN?=
 =?us-ascii?Q?Q/pQGfTf0rKRYjIiQfpura6J2z+6AfeqsVvQvDbDT4+XOzIsfj9vWBUw4i9Z?=
 =?us-ascii?Q?3UREDiC3nH0xuuUHO7Mj2QxLWiIqXyZRXQOZWtiK2TdgXGsxyRwdpsfmCMar?=
 =?us-ascii?Q?RmVwTb5JdzWrqsrKqg1kWNbo7ZsuqpUuIuHvz2hn/G+VbppeGwGwRFqWECWh?=
 =?us-ascii?Q?1BCM6HCkgiiQMP2TSqkaCK5/r1Y+NRr0yc/TrxvU33auYrywYp2y9eIHUU/I?=
 =?us-ascii?Q?q/HLeUjXcK8Gkci8Z70/Sqe9DpW/GOHwikkaOjS1gx8iUIx90qpdkvCrly1Q?=
 =?us-ascii?Q?x+N6VC6rTg/g+yyfmjUl2sfU5pNs0TT1uyEa3oKQd24oiW5vCJQNyfBd/BUX?=
 =?us-ascii?Q?bAaAQxBfULiRz1ijJIyGi8JjKh2WcqUCdi/lsz5buDRGhTH/evwyiWE1kgT1?=
 =?us-ascii?Q?DpsY/DkfNiL5+XPyGWZOvY2pjL/hTFc9fSaPv9OSGn19f55aIyu4YEbIfOol?=
 =?us-ascii?Q?bhbVmc8p9ncuh5pdJDgMewTxFeZN4NZKviAYLKHB4LKe23uuy+TYI2WE4Seg?=
 =?us-ascii?Q?PKPOvLjXdSjg04+YOENfSQh9+sAYLdvcPWie3WpUa1ttBmKAXDhY4Fj3GMID?=
 =?us-ascii?Q?7cLP/HbfTmqwBvLzgaZOC7LM1EPjjZqB0GdnscOec9/wq6GFRPb2gEy6XXfc?=
 =?us-ascii?Q?hKbOfwVvv3pyS5raJQh37ufRYE33fG5bXw9Gk0tyxdbMu0fwjcZBMNI+g67f?=
 =?us-ascii?Q?b6Vod1mJrHg1N6GRN0r7ODB7Kfe7bhgQrhtNsrsatDqcqcUNKECBlPSA+FWz?=
 =?us-ascii?Q?/EUcP+um1dGcubpum0/UMORsUWGeB8TnT/KIL//8nPMAIEjCayO7l3c6EKBn?=
 =?us-ascii?Q?oDFDphBQVcbr7bmJeZm0IpaLZI+T3gCGpeXReuzyPWGcWBv8QYcnbk8xv+BS?=
 =?us-ascii?Q?LJBAIJkyjXPS5fXQE4S7WxcMS3G8h2+PRZtU1DTHfEfHwT4/CsCXrjymD8j7?=
 =?us-ascii?Q?euNM32nv3HJQFpPD8+cVput99r51uB1jbtuma7DiQkuezvlZBZbjj3EI9dwU?=
 =?us-ascii?Q?fIzM5c0yNGA8JCpFPeaXPIkHpscVP8hVT2eoq+20gEPO9jaqXaXPWbt4mQF4?=
 =?us-ascii?Q?yjBmqARcuPcRjBkr4wQ=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:30:29.9880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7d2666-5d01-4bdc-dbfc-08de3de5cb44
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8506

Some GPUs do not support using DMA to transfer code/data from system
memory to Falcon memory, and instead must use programmed I/O (PIO).
Add a function to the Falcon HAL to indicate whether a given GPU's
Falcons support DMA for this purpose.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 7 +++++++
 drivers/gpu/nova-core/falcon/hal.rs       | 3 +++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 4 ++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs | 4 ++++
 4 files changed, 18 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 6b54c0ca458a..50c87dadf2ea 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -630,6 +630,13 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         self.hal.is_riscv_active(bar)
     }
 
+    /// Check if this Falcon supports DMA for loading firmware.
+    ///
+    /// Returns `true` if DMA is supported, `false` if PIO must be used instead.
+    pub(crate) fn supports_dma(&self) -> bool {
+        self.hal.supports_dma()
+    }
+
     /// Write the application version to the OS register.
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
         regs::NV_PFALCON_FALCON_OS::default()
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c886ba03d1f6..49501aa6ff7f 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -48,6 +48,9 @@ fn signature_reg_fuse_version(
 
     /// Reset the falcon engine.
     fn reset_eng(&self, bar: &Bar0) -> Result;
+
+    /// Returns true of this Falcon supports DMA transfer from system memory to Falcon memory
+    fn supports_dma(&self) -> bool;
 }
 
 /// Returns a boxed falcon HAL adequate for `chipset`.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 232d51a4921f..684ca72b7cfe 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -160,4 +160,8 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         Ok(())
     }
+
+    fn supports_dma(&self) -> bool {
+        true
+    }
 }
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
index ac8f58ef6789..e549fbd7d1f5 100644
--- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -70,4 +70,8 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         Ok(())
     }
+
+    fn supports_dma(&self) -> bool {
+        false
+    }
 }
-- 
2.52.0

