Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013044.outbound.protection.outlook.com [40.107.162.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C149F2727FC
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769411910; cv=fail; b=ubPCW5aBNbll1gGB/IjqFg9siJ3y+gjMHpgiZsVg53hamy+S1albMvI6TAIW0ipRoCHDLXABDtWg4IiqW9EKVO7JYKnjs7Wbb8yLMZUXuefXVcUTExtU6HGj/DFpdR0MxEPwuexKdV9rAOJHr/wydkOm3NP/u8x/LH/QdpJhSqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769411910; c=relaxed/simple;
	bh=MXBZDNbOnxFburLgszbMdNR/Z0whhzuC27Z2Pz8ZLWc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AlgHnAo4t3Cu+qpjW3QENLR4cIXa+aPz/Q5sEazt2dEex7WyLV26dG3d0IGz/YhF3zE/KM/ytwFnk8T7iXKD4laCzgLnxHLuGu6SD4NciKOcOYU/NJzQjF5d9Cnwm1MAniRQJciSlUDbvcxvq4DLY98eRdoFWDm/HmgMmHbUUHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=AWbw7n3j; arc=fail smtp.client-ip=40.107.162.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="AWbw7n3j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLQO963DnjycuXBv+ewXehGcWuVjDJ6Dbqd+SVhEe+Jl7BO9iS54QnouZw/ZVZXZzc6eOxngOUL1uXcKb9emix5OEPwcgfRO/SHvNTqY17Kk68mZ98gYNMFh02lME9iHINRQnG2pRNHodvkJpUD/f9F1u5jdn/rkxtcNswuX0h7UYgA55YD0KyPnb3wZ1HoOrwWtHkM0bEvCiHf0BD1ZBydYFhRKmZi9gew55jlgUgjB2SROpeTyX9FOq4rcvSAInFc4Czz0rutfpzPrUhGUYBRiGvWnLXZG9BIpTmuTto67J/emHFxjB1ljz0vZ+1T7BaUHS0SuxJa6WIcGhOGAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YC+XSd1ncaTmSaIsn9IrOIYkhjxjipASep/IbkYl/k4=;
 b=WHuW1wGq0sRJ4vGQIkync8J65DYhdSEmDjwFT3dOB5XtF6KZddHmVazmqpG8SpsJ22mAVgKcj2DeieqfbI44hwLWF8wcPg2wqEOfbcrXbLyNS6U3wL2Wb0iUmErebhn8B5Dtje9aLNTNEosmY9cEkjs0To7Min5+eYBzFNlfSF6wVXPbHJf6bauZKULvwuYlnDRbZ6z+pcfo/F5phTnFv8oqpA81KMRJcRpPCROa5GthVwT2O8Mh4x/KSnzvlYfzI5HZhp+SxCpsz4ZqS+wA2vMZQV26W4xBO3JXmyZmrUe7Dbus6Gp4NbsttX6igGWCdGNVU5w+CUfc0pHGaGxCdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YC+XSd1ncaTmSaIsn9IrOIYkhjxjipASep/IbkYl/k4=;
 b=AWbw7n3jDGvsk+wIxd6d8IL/nUYlj3u8JAFf788Z1k6WE+K0d/6q3Y6E8QJjcuYe5YJc4wBVppaFd8n3iL6QGSMXYt2nl8rye2vk5RIUepI831waecqDms3IJKCh/xKZd8GlQWfDqL9JkqNB2Bzjh9NZfxM2DY6GznX0L+DdLQhwBipHbQwVSpKW4ujp0ctqCISgeVYEOJKtVrAf6LN7AhLlS69q0N8d8I7JzpwHbcnsoBFsF1MyLedLNgSAyrWU70btZIWZfmsmTsuOdx5NdhC3Wz2Y8U23ZJYwxnDBqRPPHp+z/v7iVexhiuAelnGCWehNR6Ys7pArO5OGevW/cw==
Received: from AM0PR02CA0195.eurprd02.prod.outlook.com (2603:10a6:20b:28e::32)
 by DB9PR10MB5787.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:37e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Mon, 26 Jan
 2026 07:18:23 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::ca) by AM0PR02CA0195.outlook.office365.com
 (2603:10a6:20b:28e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.15 via Frontend Transport; Mon,
 26 Jan 2026 07:18:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 07:18:23 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 26 Jan
 2026 08:18:11 +0100
Received: from HI7-C-0001H.de.bosch.com (10.34.220.0) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 26 Jan
 2026 08:18:10 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>, <beata.michalska@arm.com>,
	<gary@garyguo.net>, <dakr@kernel.org>
CC: <dirk.behme@de.bosch.com>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
	<a.hindborg@kernel.org>, <aliceryhl@google.com>
Subject: [PATCH] rust: dma: add missing __rust_helper annotations
Date: Mon, 26 Jan 2026 08:17:38 +0100
Message-ID: <20260126071738.1670967-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78F:EE_|DB9PR10MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3e3f76-fd34-4872-965c-08de5cab175a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+NvUodZB7qESsrWteWdt3uVN/5KFcQLzuf1g0VCyib+rgCHa2lIucl7lJ8+q?=
 =?us-ascii?Q?ccF1jgcdqd3qiAK0nSUS2G+wlXKFWVAk2nFOMLhjVx0e4T0cK/V7nRqjXk98?=
 =?us-ascii?Q?NAE/QlYXm1bTTqNSZIQgxdKJaBsK+7I4Uq97QIdjMDZMv3QuM4n3CaCiFMgv?=
 =?us-ascii?Q?9PFs5TVuOqZVUH8BuPVSoJRa6glpVT+zSjXroU78waTzxT48B//xdoTb07vO?=
 =?us-ascii?Q?5Av+oGw1J6MAwxFuSOZPRKpHLM6rWZ7J2mxPdvwofVfbTBd081qSGo17Q6H/?=
 =?us-ascii?Q?yOpIBq5mLcBVX5JREy9BV6xAMY7FFrMSSxYbZF0Jh5Jx85d5IVqKL0gJDsu3?=
 =?us-ascii?Q?m/t/lsx7dg/38zQ/38yPUk2+Ol+U8uY1JH7ZHX3LIPcanS9uHUmnT/P9cWVz?=
 =?us-ascii?Q?dXgslxfZucJ+Qb/Jpiko2RGrz6AA9tjse8kns2GX+jXHoq9bi/6RnaVEjddJ?=
 =?us-ascii?Q?NUc/4/9Sgu9kUjUP+FHXHXnBK8EBfsnVoSVM9BzqCDAR0e7jiPWQu8QRVMxa?=
 =?us-ascii?Q?Y6gCjIcJcWYvapxpqOJpHoQ8sItnkTZ8x3kYL8O25OBW7CKSkVUjolRptkyF?=
 =?us-ascii?Q?fK7iZPYRsieYxvGofQwc/VxnCHuFbDwkavGFTUAfTBtaFhy7/wz/epiC44Xd?=
 =?us-ascii?Q?Faayx2jMgwOnkqjFUOKJItbN88jjr3ak2Xw/aXOx3+blztKj7p1tNyymvTLC?=
 =?us-ascii?Q?QHaTqrU9oSfUrMJr3zeBpOGIdpwQHTj93ZfJZhRtExgUwEOkMG7ROHSgZhs2?=
 =?us-ascii?Q?61s5GKbMxXQlK8JA7gIV8wksDfAGeqqH692qC2YlEft6nEDq4imAAlUyCPEC?=
 =?us-ascii?Q?bJr0aAGQDp7ADiwYSroOfth8ABwSoqWFVivPsZqalPcasPd61XCXDddZQ3Rj?=
 =?us-ascii?Q?TEtomBtnfK23HGaXtSh1LrqJS5YPR+MLWGmupxWcxdq4lmL8e7i1YqwsZETS?=
 =?us-ascii?Q?g9Zxwh+XXd+OxnliiLKWw5mYsLZI18goFhmlb9nlLgAop40o93bw8effGeYc?=
 =?us-ascii?Q?ZoVz2P+n6L4G/ERnKznij3XYLQA16gQGQzLl0s/WbAVoc7IOhBDAqh+wR60r?=
 =?us-ascii?Q?JTJsvMT355BByOTWVblVb7XdTj///w2LuZHboklWSoMWPxXvW1Ye/Oo2xiRi?=
 =?us-ascii?Q?J3GSbE+KfMhW5nLgeRtW5MqcLwhblomC2NxzRSl/0EWC69kOJt3s2Pu4KMRt?=
 =?us-ascii?Q?lRNEysdx4hKT66DXe4BM8yDUa7Be5yxrk8OSZjRT/sZXgs/4xi9E4KDl+mMI?=
 =?us-ascii?Q?EvqO4CaLE+30Hm1Fu7JX7wjT2VWHYtuKrvjQENezlBHMDLduQ+8WfdeSW6f9?=
 =?us-ascii?Q?mcyh/pcMlgSyeiZc4dF72V9gvnstkMHKx3NCydN/mTtw99lqvmUvBjynuWv9?=
 =?us-ascii?Q?11ZE1vaV6BtLCb7N9ZllrJpf7sbLNrvVEJLyrD0ZtExq94g/F+rk1DDUITL/?=
 =?us-ascii?Q?0pE/2SJlltDB//3ZB47a+qd+DQTuA8swOs1ZFKqJffOxC00+9qSFaQcLyDYX?=
 =?us-ascii?Q?/oDn1O4zzCZMHQiOjh6yVmtF/6EY4QdFvQerKT8TwIZxY/NHsLePsNKOQ/64?=
 =?us-ascii?Q?EyPVUeySSpvDed50fkgkYaVsGRmRzKjFOMypRyYdQDIiXYQrWVmM5Bc+iXJI?=
 =?us-ascii?Q?L/Oi4muZJ4xvx1FdKPfiwMMKTByu1gZ4WwwYD1Gj9Vcta8t2ZKvP15TbnKl5?=
 =?us-ascii?Q?CkvY7A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 07:18:23.3416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3e3f76-fd34-4872-965c-08de5cab175a
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5787

The commit d8932355f8c5 ("rust: dma: add helpers for architectures
without CONFIG_HAS_DMA") missed adding the __rust_helper annotations.
Add them.

Fixes: d8932355f8c5 ("rust: dma: add helpers for architectures without CONFIG_HAS_DMA")
Closes: https://lore.kernel.org/rust-for-linux/DFW4F5OSDO7A.TBUOX6RCN8G7@garyguo.net/
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Note: This is against linux-next.git next-20260123

 rust/helpers/dma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/dma.c b/rust/helpers/dma.c
index e7defeecda71b..6514ce1647950 100644
--- a/rust/helpers/dma.c
+++ b/rust/helpers/dma.c
@@ -23,23 +23,23 @@ __rust_helper int rust_helper_dma_set_mask_and_coherent(struct device *dev,
 	return dma_set_mask_and_coherent(dev, mask);
 }
 
-int rust_helper_dma_set_mask(struct device *dev, u64 mask)
+__rust_helper int rust_helper_dma_set_mask(struct device *dev, u64 mask)
 {
 	return dma_set_mask(dev, mask);
 }
 
-int rust_helper_dma_set_coherent_mask(struct device *dev, u64 mask)
+__rust_helper int rust_helper_dma_set_coherent_mask(struct device *dev, u64 mask)
 {
 	return dma_set_coherent_mask(dev, mask);
 }
 
-int rust_helper_dma_map_sgtable(struct device *dev, struct sg_table *sgt,
+__rust_helper int rust_helper_dma_map_sgtable(struct device *dev, struct sg_table *sgt,
 				enum dma_data_direction dir, unsigned long attrs)
 {
 	return dma_map_sgtable(dev, sgt, dir, attrs);
 }
 
-size_t rust_helper_dma_max_mapping_size(struct device *dev)
+__rust_helper size_t rust_helper_dma_max_mapping_size(struct device *dev)
 {
 	return dma_max_mapping_size(dev);
 }
-- 
2.48.0

