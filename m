Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013058.outbound.protection.outlook.com [40.93.201.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DAF3FCC
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 01:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767749086; cv=fail; b=oicUVeDT+s/RFHbHwrjeSZ63+wctqD5e68sWqn5sLlPQL27ZnDqgFuYy/sXuU31tgRbKsgYXWMYjQeIj7Lkf6weqKKMPVrRFDNDL0dmiJ25WbS4NcfGwYOpZxj+mB/ubRB3Emjdp4OwtrGNN6TwHDunHx8t12xBlav1xNbYKuuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767749086; c=relaxed/simple;
	bh=loxr1HgvjkwYR1jcoeXwkXWzFclaX0uQqcYsMJyVhCI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IoozFx8wdrSHhkE4kwUbO6rjos8ldGB7yu+CpCF3ncmvnX45nhFpF2TccoQRVEGAfobleRg+2b6gkHXM+MQjr+lcfPctxznTRLJXKon+d+wRa0rCYeR1pL5BvxdycjfkNTbRlNFsDfISxVN9EjgNai6T2tD5/Jzwe2xhXIl542M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tiIquXJ4; arc=fail smtp.client-ip=40.93.201.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tiIquXJ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZW0YKKSCfmmaZ2Yi+zxFBrBnv4cniHV9/1ecyHNehs1RrKj3BUAlabNNRKCaIMrMZKYfUZ0gHN4zvCcnvJCzmHXSOZLTJkLjaIb9yTOJQeraSMIzhGh1OuTJhdx7Aa1bbIyFPwjp015G2SLsBBuIRUkYGjJpOnhCVm+3FVClUx9Uqidq7TegAUSYu0v7Wo7xLCxIw7+jSSYLZueanRCv7jw0ezNljmoDvzO09vxIBWjQr4HN6SystIKqcEYHVyhWk0Z8G/a/PVXLDf5e+Umlhh5JYJY+WhyAauiCRdb0+HPd2A+mQ3TbPW8tthD1HM1tcrWSggkNWF2embU/9KuPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3Gj9Cn8r0nNvl+oD3dgM66b97vGHcw5eOrw6qCezgs=;
 b=gzZfxBarbiR8g+Pl9cb4Ztmm8rBzh0E/2MDL1x+x314+3H49OkXBbiGvWUZm5+O0fCgKN66q81bfcnga/nfFh7sQUL0g2F9fjzyBoWSDxrzwPqYQAR887Fm2ueEqTj/RLzBDI/Jez6BQmharPY8VNSXu3J63FGyjugmAeiK2AfX3t1mkyBUaHGLH5fT1FIryMhPeYOeObqz8dHdD6TorpgQOefqIxMwC7a/zIXTr22VPWGEKRMhOlZU33vLOfYelU95MIZJJXo9JhFcf+XzSXZAwltbkTEJcz3S2uL/UhEB3elojPebh4g6QpWdHvj15o7sDIZkUxH6xIFv5r5JejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3Gj9Cn8r0nNvl+oD3dgM66b97vGHcw5eOrw6qCezgs=;
 b=tiIquXJ49EyT15btfPXZ3xzW1grSOLyf6S2l1+7gXh0xcrySVs/g19D7OGN30HQyDhBtcN1k2Sc3h9BmgOMSYjUyAFoXn9drsaRNWJsbCbI9wNbbtNXt7mRwC7+5Ny3sjSz/w4EMueYsaQVuHgG/dn/v8LCAjje+773Hs3oFApwJLlSHPDHBfNNOwCFR87PCgUfTFfAeP8Algodu1UZLVnHJJO3DX9PwrvtfcfCym3ExBzslceWpxxUCL3XlTME7FhxdU1kJfR7ZWM5/UyXTe5rO0XejTynOD0xD3ZvCkzJQEk14LGCMttph7tinvrr5DeRTydbQQ/CTN7i7PLZ3vg==
Received: from BN9PR03CA0475.namprd03.prod.outlook.com (2603:10b6:408:139::30)
 by SA5PPF7F0CA3746.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 01:24:38 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:139:cafe::e8) by BN9PR03CA0475.outlook.office365.com
 (2603:10b6:408:139::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 01:24:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 01:24:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 17:24:22 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 17:24:21 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH 1/2] gpu: nova-core: check for overflow to DMATRFBASE1
Date: Tue, 6 Jan 2026 19:24:13 -0600
Message-ID: <20260107012414.2429246-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|SA5PPF7F0CA3746:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8e6173-eba0-4589-64d7-08de4d8b865e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wSp0B2RHzxSiToBoutBv3DHonEOIBp2xAl6tod8HOGP2Zi/793gfdRcXcKql?=
 =?us-ascii?Q?yb25PV99SSd177c3Bbaw7njAQtOxjwMgStQvlQ1D+AkLC+JbFwU5kb3LaoqR?=
 =?us-ascii?Q?rzha0PuOnK1tWf8E2zsUkeFxhQjS/V+hYlSdCC4HMuSXEnWq3KIF+/x1B8/U?=
 =?us-ascii?Q?JWZ5bkg9xaF/adqFOg7xuPBjYmSSnay5fXG+zfJMDQNdK5FiJL79xY1gLZIA?=
 =?us-ascii?Q?4nmK7ub7m/Xf2cZscun69SAT0u/9lPPH3PcGW7gLM65u9n5y7eMUnqimDb+2?=
 =?us-ascii?Q?U1Q8qNijlml/Yd0orq8pl4D85PXY0mNwJCbkOlCnwEG88JzadyN9rPGcSIUv?=
 =?us-ascii?Q?8NDk5k0LAz+YyiGEkRRf0tq6CI1zh+BagPFyxefjHAhVpiRlhSjjgJ3r5YNz?=
 =?us-ascii?Q?RkYF9Cxs6fFWyNb/R8OUew2ZBTjzm74xSLc04xvmxFY0w2ULKhxvKKPnr+y8?=
 =?us-ascii?Q?L3SYuQoF4QmrSDBgPK8Nxfwy9cCNmxQ9Kf6PKO06u/5edyVkeJQR8t1Ap9b8?=
 =?us-ascii?Q?nmIsnQVtZfhfECmjRoWMrQMWTcemW05xFfNCBeeJh2T/4lojOgTjx4JsF+Lg?=
 =?us-ascii?Q?cbb58K46CIaE6ep2j4XZSgkWLnQtRMD2TsE/7n9xKAa3YYvjRqvsUI+9KpSn?=
 =?us-ascii?Q?C7tt8lJ2cuaBhMl21k2vsrro7tVzFPJHl7v5nBxQrmYIqYR5CrjiIgXjSvQa?=
 =?us-ascii?Q?z6SdlcYtZ0tu3r1Pnn/QaeiwEdHB6OCF8wBJIH74mkJKETibbNycbE7w9GT9?=
 =?us-ascii?Q?44Ef875ayWu4py5SkUhKTsqDoyNCsXN0vLX2cNlqJWFEMdJ5ff6RL3xyxkBJ?=
 =?us-ascii?Q?DYmS09HfGqVIXUTREQoDBBYV/ZrecKrCdATiSxhI38ZtnFnUj/pediLapYtr?=
 =?us-ascii?Q?QG6QyJJtwC+Irisi5/dm4z4RAO6Z6zSOFqLRaLKOROiQxGspCNyWML4a2isc?=
 =?us-ascii?Q?dwHFjxUl9bXEnNUWmALEZ58QhntPTW13babl2Pa7zvF7ZvZVXka9fKG3tPRO?=
 =?us-ascii?Q?R0RFCHMLprEShwsCRGfqMJOeQwgH8KK5wxPBv+7cZ8x6gUmoMGnCIFGmqytY?=
 =?us-ascii?Q?eyQG3g40+J2XdTDBbVdtZ++nRJp1EY1EAH4DPSa3vWyez3erUuN4v4M3PuUG?=
 =?us-ascii?Q?7uuySVyiy5NQ02YkBS9nepYGE45vO4tRoBrP4Gm2XJ+yc5i1Aasbs6QiQC+9?=
 =?us-ascii?Q?y0pX4tEmT/mesK+DeO7KQhm3hmeNmX6eH6B6FtUdcAwkvXjYwFTFNNWq6JWE?=
 =?us-ascii?Q?xsN5ch75hJBrLIn6dND+7k1j64uEvabDUc3GnQ5pp2kimyf5RI3lCYJuUmb/?=
 =?us-ascii?Q?5z39syv9AWl4e0ZkWy9lohCLHiC7c4AH8t3rmrGK5MiYTEJ9VlvAt3YLw6QG?=
 =?us-ascii?Q?q+x/MiNbq7uJhTPlBkOzf5a5iGy1ScAQdkZr2vvoi48rSupVrW8X2Pdkk3k4?=
 =?us-ascii?Q?SWIvvGGAi79xn8IV/LsNlH2ZaNhY+HyaVj1sXv1L4AbuDcPHJt8CukADMtAB?=
 =?us-ascii?Q?a9MH/Zf4r2OPaNVCjGP10oDEaWrREDd2S0IhAZQgTdKGuRf9YGQRLuL3nyhD?=
 =?us-ascii?Q?ALWSwGWzqkbEASHlni8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 01:24:38.1505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8e6173-eba0-4589-64d7-08de4d8b865e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7F0CA3746

The NV_PFALCON_FALCON_DMATRFBASE/1 register pair supports DMA address
up to 49 bits only, but the write to DMATRFBASE1 could exceed that.
To mitigate, check first that the DMA address will fit.

Fixes: 69f5cd67ce41 ("gpu: nova-core: add falcon register definitions and base code")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..fe5abf64dd2b 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -493,7 +493,11 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             Some(_) => (),
         };
 
-        // Set up the base source DMA address.
+        // Set up the base source DMA address.  DMATRFBASE only supports a 49-bit address.
+        if dma_start > kernel::dma::DmaMask::new::<49>().value() {
+            dev_err!(self.dev, "DMA address {:#x} exceeds 49 bits\n", dma_start);
+            return Err(ERANGE);
+        }
 
         regs::NV_PFALCON_FALCON_DMATRFBASE::default()
             // CAST: `as u32` is used on purpose since we do want to strip the upper bits, which

base-commit: 4348796233e736147e2e79c58784d0a9fb48867d
-- 
2.52.0

