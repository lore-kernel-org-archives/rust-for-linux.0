Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012001.outbound.protection.outlook.com [40.107.200.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD303033C0;
	Thu,  5 Mar 2026 19:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772737810; cv=fail; b=cG4d+ivC4g65L7sktWF81fDb3qtAGEi21SP3j/oPQyvrKO6g9JsQV+IizkyRHkI69nqqWjoaKjamCXPZ3Cc2cXSIdE4LvzgaWyZnV2zjb0CS74g7ymKPHUKWdr8ySS/LSM6v7favwbanW+tIi8K8Eyu+SzxhE0gsvALiPvtqdN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772737810; c=relaxed/simple;
	bh=+9wiMDTumsM/+ewZVDbUyBPt9CnJLMUt6Y4YCS+ax3E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sblNIBTbnsPxW6l1FlGYT1Uv1T65U029MCpzaAMxgHVtQhgM3yfo3uiGaHB4XCBnnwnetVHr2GmNykxjd0yK2GjG5QSP8dwCO8i/XLn7nviJFJScXp7dGLo8D9BNNqU7CcNLF5MriWisVm3lKIEStfo1mBRTvpnHdOjUs+iRqFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OnH+mb/W; arc=fail smtp.client-ip=40.107.200.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OnH+mb/W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2CzPLIIeujvRLTA5gPXYu/ZsSQZCiSMahL9lZhbZcetwa8GkDJ7Ak6X4jlZJj+AMnoMh3q0B8nMavdjitcVM1k3ymIId87xOGrW+zgO6qwLOkMq7ng5oAFxe3Fa1QPTPbNRMTx6sDDX8fTxQS4+ZGU7QjvJnS7fvEXZUvRlFbPQCq53+A1bQq4WSttK+jx4wwTbRli9phQCocLEvhMlzMoSWXcDng/i27yWnkt2f6BAft9AMJsXW1QZBM3/55xV4PkBUU8LJWtnF+U5PIVu7ACPcjcT/AVLw4szfr0C7RpNZ67tEVeT6I9B1KjcxqbbgtxHzY1AtrzkLG5ZP0BWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4zihCMvxVZVrBbJ3dW66Lh/18Gi+m4R1JqBUNAGyeo=;
 b=npU7gk1ctM17p3ecArUT/o2+FdEv/NVyX1mo4MXDLmviUGcd34t7HNbL/s0wuYjbSUpyzi1AN5U3Ar66qPjCd8i01gJIbx0m4LIHI3k472Vl5NMchY7A6PiK94Xi7+fh5y4DEzuWzfS6TCV+JaspdaN11UM7WtmSmaEa97i91AjYNXjsfWXkey4Mh2FcF3VIkDtLVofS42eDRVbAXmeT/Iss+mmkJZz0ze9L5LYa/E+U//iIBPE42CNSgpzQPrG02sStDAF/vYl3nPML1Q4QaOSPy1qE7zg28sqA4iVN4VJPM9kJpnbpmjeBxb0c5W23dlQHbxRnJdXS5h5OaWmUNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4zihCMvxVZVrBbJ3dW66Lh/18Gi+m4R1JqBUNAGyeo=;
 b=OnH+mb/WOaJJUlah6zM7MPydWoaocF8Y+xJ2DWnN/yc0C5RSGiaogkLDFNI4/yRoZx+BvWtP3It/TD/tcJ0miwKKgQ/Hr1nV+MBa0hhc+vlpx7+J8W+YOIEI9lOH+5LidRSI9IgUpWIZUoGk4cyLI9miOXTYGqcTaEr5UM90f/8aiVCBMgrzE2GiIU/rS6F0CjgbaHiyNz9kvyfNPWZkoiktoKYQRRRU+TRJUzmBtI+6E137VPfUZyBjOPewz6Uo9+KaXGNOi8o3OflVlH9VwNVhNBLl7c1Bc/NVDaMweq+2Tuj/UauN76Xh4iHWuwyVJszn2I3a6S5rf9abTeaX5g==
Received: from SA1P222CA0069.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::29)
 by DS0PR12MB8365.namprd12.prod.outlook.com (2603:10b6:8:f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 19:10:01 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:2c1:cafe::18) by SA1P222CA0069.outlook.office365.com
 (2603:10b6:806:2c1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 19:10:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:10:01 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:09:39 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:09:38 -0800
Received: from ipp2-2316.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 11:09:38 -0800
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
Subject: [PATCH 1/2] fwctl: use subsys_initcall for built-in configuration
Date: Thu, 5 Mar 2026 19:09:35 +0000
Message-ID: <20260305190936.398590-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305190936.398590-1-zhiw@nvidia.com>
References: <20260305190936.398590-1-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|DS0PR12MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6d0363-1c3f-49fe-61cf-08de7aeacd52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016;
X-Microsoft-Antispam-Message-Info:
	kkgkKGt11dBLyfUDsKKDGMdrHgaA5wPdATNuJ3ejxvaWZTlNnw+iR4xgwXZYOZxnVRM93gyBK8L6943G+lHt8jXxJnSqa9HWwV2xcEBeay925wmMbLLEV9rDrnRxxlLIXIy0eck9rTzj3Lj8/OxNnlicrPRh205KmDzK0QXmguVPSoYmKLvyl2Csm/14hrLiGzprO+8d8MlkInZbXG3vZYEcwKYJx/30DC/otnuAkpQZAHrHID9Oi4vUYdY7O7XJE+s3NvD8Qh/MgDJ9nwWEfjHQ/5f8KqJYKbROGsx+cLDxTcYKa+oBlwy/r6n488kYtOkS0jVYxoiav+AMEqHEKrkYCO/E/pYqm28xVkn3Sl+t0sA3XhW9fT9GAtc4dkQCVPjVbPQVxkOPx5F9GuWaI5fhpuilOdhiB9/sCf52+wNJNXTwSge8ewFxUVhczAtHej4WSP/3FGkRx22IR6rnjnnpR0xFpFRBlW1NrWtt70I3/6gu+LWhkur2jwRZWRdUHVsEGQjywzzxL/LNJqyWG8nlIA+84QPSCD3nOq7ZEIZo0cAQvUkwFESqq9KxeWJO6spnc3cH/Cy3YRYvQyDXUuT2IYOSjzdyq7JT4nBwQXhSokceoqlz4FQtbNuer4re+mHwsQjTC7jTNICcv6tEfZVTMfundAw2jcvOLFByTrElOY3olnkCWjotOTkaZVBIDNamRrXmnYuR16m2EiJLIJRp4kLXgf/oMvh2VSxUhNQ7n2e+FLd8DCoASAD9k/JFRLBfMtbmfM2STC+JXNMm/g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dR4G6ylUaZU1zUyDau64T742gaa8jPkytyGb/O7QN1LI6CJWObOQtbvr27Enlc797qMiWkuTerYmdh5Dly3OqQ2AtfyEaf6mS58JeKGKaIvqiRkh/BS4YzdChS8BVTprhTXyoWUdx2JTV+Vy8q+4P4QjrBDDf4qfSzQh95NpJbYk1/nCqGQS50v7BdrmuLvB+7oWmfDrq5quE2yXeu17YOAdvDU+izuQOG6GwxIvNBZJikPWJ5KfupAYyBw/nlagaBFatZPhO+cTkAw7E3iNggP8ph1nEStaErpltvD6gmNqsC3sIbact4e4a1NDFwlKZcCJkJOrKsMxhw91V/EWtoI98HIwXU/39l/Qcvf43IKoSyOkPdG4LP7DWR/QA96DzIskPeNCRmHPTpXx0yNBJ+erjnYzRuok8luJKxRuR94CBu+AIPYLQX74JvR2qvQm
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:10:01.7343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6d0363-1c3f-49fe-61cf-08de7aeacd52
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8365

Rust does not yet support loadable kernel modules, so
RUST_FWCTL_ABSTRACTIONS is a Kconfig bool, which forces fwctl to be
built-in. With module_init, fwctl initializes too late and PCI drivers
probe before the fwctl class is registered.

Switch to subsys_initcall.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/fwctl/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fwctl/main.c b/drivers/fwctl/main.c
index bc6378506296..098c3824ad75 100644
--- a/drivers/fwctl/main.c
+++ b/drivers/fwctl/main.c
@@ -415,7 +415,7 @@ static void __exit fwctl_exit(void)
 	unregister_chrdev_region(fwctl_dev, FWCTL_MAX_DEVICES);
 }
 
-module_init(fwctl_init);
+subsys_initcall(fwctl_init);
 module_exit(fwctl_exit);
 MODULE_DESCRIPTION("fwctl device firmware access framework");
 MODULE_LICENSE("GPL");
-- 
2.51.0

