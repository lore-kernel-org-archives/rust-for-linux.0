Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011009.outbound.protection.outlook.com [40.93.194.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C153A1CEA;
	Wed, 24 Jun 2026 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782292813; cv=fail; b=ocKKZiKS14eTR+eB1HZqw4QNPj2TCFhIn/LxFQ5SCX6UM3I52qGF8aZMAGcN6qDZg+3MpPd1jNwMOAo4zOd6HenoIo6sZ3wjTZQg4nFPnQekIJow6snLG+dvevSBo0E0i6oSNHYYuXJYq6vCgyod93y9iGGo9qoie1Y2AqdtIxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782292813; c=relaxed/simple;
	bh=yW/nPKz0IsT9SdQxuX5OX59KXDjXTSx8IWBunYogre0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V6wpG+zqRYZEesEZPAnefSB5nztdoSlqlJLBJ86VypSdskD2lSuH+nLlH+t1uf7aJ4b26moYWS59wMqCv9MGXmMmJ1+TUwMgcfUKxMds3rPCDmG1new/ij3pbe1zYbPA9XogDE8+4iY1xkeec3mOvTks3XVaY5zjVb56ouf8MQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KBIf5aR5; arc=fail smtp.client-ip=40.93.194.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KBIf5aR5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfRMeimDOhI9+Qyfn34hexC/yMu0+PAwF2uoZ8T7ltiXqkcQgspaI5DSJXOYToSnfRYFQELKDt1CYfuO+EIyn9ORd/86gRfWo/84LoAz7SRk1Zu2XEtYaxLivekPIOuyUNAYEwiB13xw357Qi+Ri2dEbaLHJ7QW9wCcM0Zk1yIT2fRvlCmySDoQH3wKYDKCv4WihlmOMHYYkuGd6FpV1J0x8elK4jiYOuqcxo4KyPqwCLhg5dNem5KrGGo5jd6g3JzdAueIeeyrRF13syWuGJmhRK7EKYwAmy5plcj2HQf2vajpc3VueJ7mzVOTKCriSTjydXWcJkohTQ4exQGj6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdML71pZw0+pJCGsqDKVQ40o8EkBpouiIjYZlJkeRl8=;
 b=aZmZr0GEakrWKeiH1zDRBJV/t1d7qz2dZt164DYFOizJY2vxTLCvZavFByLXcCYv7lIlurwfdRsuJMBHtzGApiduZIuuVt5t6++uaBr75diy2dS2wsvfqnREryq6+nigdSRQW8UK32x2Y+71x8sB2O4ZwEFhNtHIjLELsIuqEJjoe6cimeMPXcHBczY8bb0s7mJfAq+wlTPvR7S8a3+83UrkKJSs4VcYsBvedDO01hkJLffEsijZoSCK5OOkHu27G8bjkLKpz+qNZbV+izJpn7NXdsTHGjUaVSOg7gK9avzKmHp+Zq7D2xrVqsTB4q8hFL1FRTbWveD6fnPhkTm5uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdML71pZw0+pJCGsqDKVQ40o8EkBpouiIjYZlJkeRl8=;
 b=KBIf5aR5i/QsY8eHbLzT8NjqyKBwNbnOyQMaoYhsFp+eUblWT7yCaIg5TPUMDmAJY7pb3zEf/HpVTCzpppZeJmFO7kEawJD0MIdh+6/LSxffIpK+Va3+YznVsBOGkY2kV1JF+m4rOYEIt2QDW5prFuZx6SZBVTE2hed3kObPq9Ofjz1188ea1nGcSu9NK+anCOX7vKWGfmDK9pTaEd3cMu3aq92HJVk7mvBIhGPyW+iedjn3kaWr4WloFKeIWs+m0hNRnnvu1zq0/v3b7Zw4siM23JPq5nbgIhIczsNeYlpDpr1oLW3jJ9ckhcKnJIyE50QPNMijV+gxPfeh3xNCAA==
Received: from MW4PR04CA0096.namprd04.prod.outlook.com (2603:10b6:303:83::11)
 by BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 09:20:01 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::48) by MW4PR04CA0096.outlook.office365.com
 (2603:10b6:303:83::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 09:20:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 09:20:01 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 24 Jun
 2026 02:19:48 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 24 Jun 2026 02:19:47 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport; Wed, 24
 Jun 2026 02:19:39 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <dakr@kernel.org>, <jgg@nvidia.com>, <gary@garyguo.net>,
	<joelagnelf@nvidia.com>, <aliceryhl@google.com>, <kwilczynski@kernel.org>,
	<ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
	<tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
	<ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
	<targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
	<acourbot@nvidia.com>, <jhubbard@nvidia.com>, <zhiwang@kernel.org>,
	<daniel.almeida@collabora.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v4 1/2] fwctl: add device release hook
Date: Wed, 24 Jun 2026 12:17:57 +0300
Message-ID: <20260624091758.1678092-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260624091758.1678092-1-zhiw@nvidia.com>
References: <20260624091758.1678092-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|BY5PR12MB4066:EE_
X-MS-Office365-Filtering-Correlation-Id: df2d75be-3304-48cb-6472-08ded1d1c4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|23010399003|1800799024|36860700016|11063799006|5023799004|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Tdy1MQqT2BOXNGRs6/q+NWNNAZFDhyafEPYN/F2AIOZHKcHEtSdRPNORh1WyBs6tGRW4VH6v/9tl9jtMvsEIHIKS78cbTsM94kWI59StwZhxksqD08AQ2bpfINj4aeRlZouIVJKPaLOR58q1xoCsCxhR6NZCfGkWo+V3zzSvSbyqUYYfMC5w90LTeIUx58kgc5fz/1Wl+4oP8OLJDCBEbxM187US/p9gsAVhojBcVWakw5C7uNsXl7Ywj0BvGb1rAcKkTdMKBHHJkqTGs62xbmtFrwCKsxrafssK2ISidqEwGiZzeovXQwSf8EBCBmE50VTVSd2dAS3pWkqSCqK46o/Zll1MoK3yCdiPIHPycUDna41lBv72sRElNF/MjBaedu80TJHWnm8s/7b5Zi/eP5yDQJho7dnEodpmZCqAz5AZQtss7iVrU3bHx8RhwPCbyOe/Ma/X5PZutypFCY1BhhyRVLelIIaez0ZwSn2i2ElREGP/2lzNgPplRJ7ZqTF7Pe3OW1exTPmuCv+UXYu8gr2HJ9Hoqc7SNiXeoi2TPbPmbBwjxsgWHhcHamjiVU409CwOljMlyHuhuRzt4cy+9r2gTjzvFZz1A6vRhG5h3AHjA0IrlLaV5HsPi4y9A54oN157e0GVcxpqxWdgfU74XCAz5IuHTQ1zfDIEh9+QdT0epAS8Mb51sAqPxqXoz8+hIcZyqwIylULyKgX6A5pu3g==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(11063799006)(5023799004)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z72uoU0TZdZGIRS4cFxLpjU+tAUdmrkjPeJVfbKX0oFU+7YHfji79svUH2WxxkiM6YEZb+1yn6Dr6v8RFXvojzGWOHpHa+jd2VvE5NM6tzZmeAdGyHeab211dxkxMwSjT3uLrLpMN+RgMKTRTkTDcFqxY9DhKOfRNPibGbBf9g8rMlGf5UG3fw+EjEJwHoPdTj6HKE9IQcYEuuY/IXvlqBx+p/k3gZIp/Dn7fm0ZkVLoFX+7gzvcFd8EWgQ9CluMnyct+8T+06+X9EEiTmwXD7IAq89ejhphB1vj4LE64AgsgBYvPa9dsTyluzUjF/ISmO5lOyr1M8fbuDAKvp1cY5ebvgnxutT6Vad+5fxjOLvGvBGDYmyKV65AePL5HiNEsN9RqApWxB3quoa+2SOsGsPnND/RLle/iPRRdeAA34jbRqRf0NNzdYRi5FoYLkNK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:20:01.2327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df2d75be-3304-48cb-6472-08ded1d1c4c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066

Add an optional per-device release callback to struct fwctl_device and
invoke it from fwctl_device_release() before kfree().

This gives higher-level abstractions a final teardown point for tail data
that requires explicit destruction.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/fwctl/main.c  | 2 ++
 include/linux/fwctl.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/fwctl/main.c b/drivers/fwctl/main.c
index 098c3824ad75..7bc76e3a5306 100644
--- a/drivers/fwctl/main.c
+++ b/drivers/fwctl/main.c
@@ -275,6 +275,8 @@ static void fwctl_device_release(struct device *device)
 
 	ida_free(&fwctl_ida, fwctl->dev.devt - fwctl_dev);
 	mutex_destroy(&fwctl->uctx_list_lock);
+	if (fwctl->release_data)
+		fwctl->release_data(fwctl);
 	kfree(fwctl);
 }
 
diff --git a/include/linux/fwctl.h b/include/linux/fwctl.h
index 5d61fc8a6871..25834f6b79a8 100644
--- a/include/linux/fwctl.h
+++ b/include/linux/fwctl.h
@@ -79,6 +79,8 @@ struct fwctl_device {
 	 */
 	struct rw_semaphore registration_lock;
 	const struct fwctl_ops *ops;
+	/* Optional release hook for driver-private tail data. */
+	void (*release_data)(struct fwctl_device *fwctl);
 };
 
 struct fwctl_device *_fwctl_alloc_device(struct device *parent,
-- 
2.51.0

