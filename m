Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010002.outbound.protection.outlook.com [52.101.56.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9433CAE88
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 19:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453277; cv=fail; b=ADjDGlcPhovXqeh2keut6om0o0bzOLwqGxcvVnbajuvsDJuAmbsUpJNmqfXbIBzD3IQvsb6PgpnvcDnhk5hXeD4fo8tlISRCLJas5se5gkyt3l4M6qJXf7Xs9W47STpo6fOOb/8j2Cp+L64NmU6S+iMmF/56NRLj4vbPzDczRBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453277; c=relaxed/simple;
	bh=isqZo8z1M9VHPVgPxxkBhfNDtoccN5xsRg+QCf0u0pQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G3gOz/KEqqOzSWUxtgXOxWH0JoCTr4enaweFGyPA6+pFds0rRayWIle66tLzzQqsMhM92AJ16cZd2wGTOmqSOHSzLcWCTplNQ/YqAxGhyRpFwvQepnOWlV/6D+1geFCaM9ha4l17EXoThjavNVuYgJuPdW8j55HV2zbaNfIsxWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LH9U5ivo; arc=fail smtp.client-ip=52.101.56.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LH9U5ivo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEeEf9Rnf+q2sVItMuEZkQnYG4NcoKPEtTWktCqgUzfj6dsX7gXe+8UtbepeQZBALLI1P0ocWhXfFoi5L/jl63jcpMPtyaZuioBfG5x+6X3u979wYnJFb/AWdFL6cFwbsImH9FnxSUxAvNXe8iC7S/6kQWtXsCUWG1N5fcnMf7L8dHtnnhWIuNrmVXMu3Ytf2tMGPoo5enz7MzRfcpBTT4eKTtPeRHSt0Nvajz6WKR7s5j6YYd7CeyfYPKjqVYxOjbFXHt7lzDN7/mf9qadlqumjOGGhqwR6kAL/GqQaRPzz2wDjHqxO6XxYvp5BQxuXkKt2yuX4KHka0MetFCrHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljQypX3JLO1hYaGZPt/tySVIjKCc1y0lbz3Lgt2DnXg=;
 b=dqaKWfV3141EYV8DFR8F6gExZzeVutpJTeybzKF8WYu0EF9cTE+30PzArEjIdIirlD9jNNNgATua3uv3VT7xG8b58RjK3HLhwhmTgflXj71Yk2oH7uwKhDnQXeqDztbFq3+fvP4m8qZArJ75qt/mFERJxfDo3dIcqMwkVvEYLbR+omkw33xgoGjDzCkh0lZAWtwd5uBvLv5YIyMR+uwMp2r0rIFEeRc8pK14+5ZixOqiswtyBFdbmVjpulh9tTCvIOa+B9mmOfWiwHAXxuasSvo2uZCCE+byFl8mcxrxrTqqZ5fArskBC0rDjjYgZPAC0U9QuldWmZjmjz1ODjtr3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljQypX3JLO1hYaGZPt/tySVIjKCc1y0lbz3Lgt2DnXg=;
 b=LH9U5ivoJAmqpNUxBUT3GDM+zsiFheD5faI2Fu+TbMtvU8klyhiLXNXwFMtSvY1Tea45SjD1LmiRjiJlkZMk3//MVaBP8UaX2rQQ0nfmfKNViczWkohtNOHD9NPzjQ/rjt0JlP5dZD0LNHpHnRNiAk8JoAKcLFxcXmFKxeuH2xH7Y8OHXArowOWJXWTmsJv+8p0wNXcCfv387DdDw3a3AQq0jXb79RolBZ5+r/KlD8U1U8H+1h80MJXgcEa4vq+ZOLznLB1sn7j9qM+ixyK8nj87vbiVPWlQk6LuyrvFokaYpZTBg9SYD+zDSgBB9MrZEaGovaSfxu7knwk33dj3jQ==
Received: from BL1P223CA0036.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::18)
 by SN7PR12MB6863.namprd12.prod.outlook.com (2603:10b6:806:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 19:14:31 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::b3) by BL1P223CA0036.outlook.office365.com
 (2603:10b6:208:5b6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 19:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 19:14:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:11 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 12:14:09 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 3/6] gpu: nova-core: only boot FRTS if its region is allocated
Date: Fri, 17 Apr 2026 14:13:56 -0500
Message-ID: <20260417191359.1307434-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417191359.1307434-1-ttabi@nvidia.com>
References: <20260417191359.1307434-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|SN7PR12MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9e6928-be71-4d26-9695-08de9cb58d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lN39fplFNSKk2ma4gH3j7umtC/DWQSGAXOVmCXgv5j8X8repjgbrRnMzRbk8rMtDS31EEymOFOOZkEG8LlT5ycxJjcmmBa1peWOyNp8REHgxxUzQvePT4wtnojtLFXJLvKVFpIO2AsAuSckrSC6Sh7z85VODARryLzY6kr3QpMRVFULl3XC/f+YW2xDYUXXZu4vzDZRtnbIt4g0uDX3VgZaFfDV+0ccIXk9+6dOzNs8aJcrXZtPCvDcX+6qPVT/4IAmFyZZimk4lXpqnshnpaFPYhAFXBFH0KDusp5pMrqSoTrV9JdCuTDp/qdBgkGeAMIWW7mOoC+muGXPiFEPmZI88AuT16Vsk01r7svu31wsNtpw5PNT6ZCkJEGUINW1EXO9MJWTI0qpCx64Aej197Wz5ufW561Ga+D3HSKzk0q6KRcfqUD1+ME5Mk8IqN+RoZhcMZl47L5NV5i3YiAgCOhwh95Ro1o4PdBSbPHbt9HDh0UwQH/wbEOfgIbYOEcAVn225jfpA5WGcz4u970/0hoAPjTSRygagE89JCxLEnZA1b2cCUpmHfixBm3TDS5Iw3aR382s3XexibaYQ0VG9/ecRpJnOKZXL7RFdne1fGgaH2Ru6/sFx0rdWMBCKTOBlmgB2zNACrRku2iDBCfpcuJanhduXcl+LQKFdDvGB/JD61qB5B6to/Zrxua4TRv7DQHMI9QEHh5nhswvQHxw5pxVcS26XS7/gK+VNoVtgE2ZReMTSmf1MNRrdQI4zSjg/S39TMW2MjgWRc/5qoP6YVw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o4J2AvqoCSxkmb1cQJ2JzBng7PCjILseKfDKu/PyD0oJ4QhENqdwdddq4cT/NL1OXjvPZ5Tfj4fxnp26b365TG6pIw8lUB8mw/5Lj4NaI1KhlfGUVCEO1LAmUipRg5+e+zXCx12tjT8jP7rjxnrTx1SJWljJU1E2qXR0zakGzjHFInOeTpketaUhqoNkDe+yLIRsAFg7sGSlIQ1t9sWs0nMZGxmcRms/HYyOtGAZmWg5gHlCnggzNKdFOCDujkjlIUe+IuLqa10W902HMkKmq2PVoKVYKeKUtZRLfLAs5YufJLBZ3cNue/fAwnLbRygkSy6IyLQHjBzdReL2jZakSCWBBzIhjT1h8SbZ4sipkb6RVx0nmps+UxwqhwPB5g/TLheU1IP0Z4KDucx6B9OOGdiuDW2+wfq8Udv33edew2AbdI9MsV8z8UnRDACeZGI8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 19:14:31.0169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9e6928-be71-4d26-9695-08de9cb58d9b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6863

On some Nvidia GPUs (i.e. GA100), the FRTS region is not allocated
(its size is set to 0).  In such cases, FWSEC-FRTS should not be run.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 18f356c9178e..5c56f0539dd7 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -155,7 +155,10 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
+        // FWSEC-FRTS is not executed on chips where the FRTS region size is 0 (e.g. GA100).
+        if !fb_layout.frts.is_empty() {
+            Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
+        }
 
         let booter_loader = BooterFirmware::new(
             dev,
-- 
2.53.0

