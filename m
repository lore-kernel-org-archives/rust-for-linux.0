Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220E134EEF4
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 19:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768419030; cv=fail; b=Ofk/IkosmLaKuH3Uq1Zkg57pm0iMBbAp9xSoGVCWZJO/c9xuS0y9og3nYmbvqpUWMepT8ShX4L2cyBwcq9cc7jmpE1j3X0IIFewhtPIj+0+Fsc6DlprK4L3e+3hlH94L2yaaDXYr8f98db0qaWFXJTc34NkQKUCVj3DyGBoWDiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768419030; c=relaxed/simple;
	bh=wWfb2uCLSn5kbWKl7zwP4ZVZmc5qlgQfLxCzut66Y+Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jcWzUu+HhdVeektfYPVvUuT2AgaeLj3WEZ++XH5Je+r+N/h8Sa4D52tYmGkIwY6oIrVJkd8sBH69ugWgXGncaHOm7fCMj7IRhmbkEYm7WqN9PKh6kTKxmRTzokrWM1x7OZHZGhn7UT4qaSHS8B5wsiXaKg7ZwjbYP6FUVfzGW/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VKp4BRUe; arc=fail smtp.client-ip=40.107.208.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VKp4BRUe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Taj6lQloWcS+Z7KJfsbzFKhAualQ7LJkyumCZwASPBO/1LVjxmqwFsC/BieJc5dJ2eX7m4hA1RjWhHwngmr5ahtEbQm+SgHdUow+k59ef+Dhf/CFfSJ6g+TVsPMT2gKl+uapxgoLQ71CI0iXKGQrXJKjLIuZoi/xYLDE1Pf3CvNdLfYpKh2qdAEJF4buBDgjcgn1LZzm7q7p3MgK+swMUe1mlXn4byjjjnTxsT96PmmXr1Ds68fMuMjFAoUtpN98ZiRlefpYLY0QTcz8dLRCyrsLXDyJIgCq7k3aHJQTxfEi/Dku/OTo1wwrHwtvy78kRqEvT0XLUe5mWmJ4qf7Zlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6ODgQEjMJ5PHkXaXNmGGX1X1xRGc20rfD1wsjTFHpI=;
 b=WXv7x7seIew4hvrLlqoRst1ySpS8HB+yGZgKaiQhrCHnv0KD8gdg7NuuNyNZcpjzhjXJC09BQW1Ax5wjArPeobb9KM+iQT+H1Cx95DpDtz2HcwU8gBN43s9NJHV1wTx0psUYTepWgM79xdOiEqi3KD5kK5BXOob/RqvYOec9vuJ/Lw20c81dWxm9W+gvVE1MoL/16iQC4XDkv1eFKP1stbyAOWKMek1cUksyQu3LqOMeUHUiksfzdkCTz3ztDyLyuIQjwZiTzerVhlElsEQNkkewWrYXbr7k5BQBEIPahvGplHHkZAFCP5LHuI8bzjQNeE+dzC8mwG/CbnRzvW7ahw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6ODgQEjMJ5PHkXaXNmGGX1X1xRGc20rfD1wsjTFHpI=;
 b=VKp4BRUeV/2XGWXouNfrcRmaW46w+67NcQVlRyQDgg4cGY5flzokdnhqyYbNDLn+7feGtbKO/2UbR/V011Gnlpk/7r5KeY7xr78FFxLHCDRvS+Wl1C0GCO68OEo0EuMq1TtCH6OJbwDSZGBCjZIMhNlrcque3jbbC5uOpUp4qpxqGpE4Rfgeo0E85UyrsDOzbl/8nMoXIagQaXQjxJNakC31bxI0NeE3nwl4qRKtrB4+UU9hqF3G6UCUjCHLgMblhpFZ0gbqdAXoTsk+L3pNX8UpMfN/iGqhhjMv5Mj8T23qB8f9C0rC4WhygaIl16EZceydZjfyX+34LA43xLrCKQ==
Received: from PH5P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::12)
 by IA0PR12MB8253.namprd12.prod.outlook.com (2603:10b6:208:402::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 19:30:26 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:34a:cafe::42) by PH5P220CA0007.outlook.office365.com
 (2603:10b6:510:34a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 14 Jan 2026 19:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Wed, 14 Jan 2026 19:30:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:03 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:01 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 04/11] gpu: nova-core: add support for Turing/GA100 fwsignature
Date: Wed, 14 Jan 2026 13:29:43 -0600
Message-ID: <20260114192950.1143002-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114192950.1143002-1-ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|IA0PR12MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc3701d-f301-4d33-185d-08de53a35e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jgia2Q+VVjAl9TbYlo6/ahNkj/fegIPzB9lwWcTOdE3irttIy5oOqIybJp3X?=
 =?us-ascii?Q?XV+3qjqpyd4F1F5t8OzYB36T12LeCrTWG0+dQiteXSoXFUg08zRuc5or9mXY?=
 =?us-ascii?Q?lVlKCUcWPYyDI2Jb2vxj97+/1ezsWyftH6osG2mBGi2EAwQEE7jCgJStBlaC?=
 =?us-ascii?Q?Tk1id8x2tVLCEY1OsDiuIv5hUvJ/XU+56di8QvNfMx9HsEL9qWMCsQQCA2ay?=
 =?us-ascii?Q?4GTHOxHlMmumuNnTlY8LgDpdJSGn3o5DyuHl/562FuPJe9lhW+MQWxVA2mDK?=
 =?us-ascii?Q?GrPmPMTzE7EtvGp+Xk0BWi/uuMp+V7uhXo16P4TWuFwsYEY06/PyWQIHSUZy?=
 =?us-ascii?Q?1wZMUXZO6I2kjk18N6TLRHoHKHwK416c3mdrgfNMEVvAreMqEn2gRkFtmQcS?=
 =?us-ascii?Q?bhmqWU6KSK5r9/RAq0Iy9FqdcfEIq1xpxycvRpjbQ5bTjkS+UajaWsyC0qpo?=
 =?us-ascii?Q?w9HJ2bFipf6EiNwgnZQV0iB81xsAARll7+QdGSB+PRLKGubKlKd7wJovHb2t?=
 =?us-ascii?Q?zSXgBxs7UpmfRASBfSJFzVp+EZ26ddjQts9vxaE8LYhTsekAI3sC7IHjZu4n?=
 =?us-ascii?Q?HYZpAsPwJDp9rqOPeKFJaMRXXKmHmhTAYMYe8+5+xMZ3A5/rOasGxFfv2zEi?=
 =?us-ascii?Q?S3cLquZf8O5O3kQqRszLs1QFTAzXkC96zlfNeCnP6tn2z4frfUXA0M3yDWiR?=
 =?us-ascii?Q?XBQfNs7nBNdcz8oZAH2j53265xQTN3NuwOOVAWP8itIltMDtNC4WqlQeNgd/?=
 =?us-ascii?Q?8OeB+4rjN4wnlQEDZ67gph1aQYEx+PfQv1IkLEIEyQIiOOxn/GHaWmkV1mZI?=
 =?us-ascii?Q?FpoPg1fkS4hcm6YCs0q7OPkv7xdbhF9eFA/G0ycLsNSyZxapI4iJQw+fwsAH?=
 =?us-ascii?Q?xdE5yfbD8fSyuMoRXCnoAb9qxMWcCrNcAHtyk4dCih/A2xZb/EXviOZ3SbPs?=
 =?us-ascii?Q?vEPMEMbWzOIc5m55Rb73ReXX2bGimDAk0bOdH0jVkJlyIGEcRVXfQsF8Fhrb?=
 =?us-ascii?Q?BauPuRbWmVTRaOMDAJ3lqIwPziyFImkLjEtL1DOqd7EwTbdOK5Thc2C0N64u?=
 =?us-ascii?Q?bIjbqYpWEKKB6U8vULn+ufozcNEQJkMmeHH9o/uASrSdf1BKPzI9TXEovdIR?=
 =?us-ascii?Q?I7Su73z35FI4mqCXS4nBoqvm1r7yvu4Xx1/YlAwpgXnyLTUGln7Zl0UbvTrK?=
 =?us-ascii?Q?uSGZTk8ls+w3j/5T7L+wzs16zdMZ4p9y5wNZtTXEQbzdPviEQQdCp/EY6mrZ?=
 =?us-ascii?Q?sDFbmQESwUDnE1NuVmMY9GZhmOX0HZ/Qfb9zf74VkpU6/Vs60QLs9a/nNXAW?=
 =?us-ascii?Q?jvbq9cbUcbuplHypMumpx4j2+xxdhl3gIyVT4LQjDq+PfvYQct//kZrRhIg6?=
 =?us-ascii?Q?1oful5VPnNzVnFU+O81gXDNFKG4GmnjNSZhx16QldXtGevYQ7EjsVr+QCMNV?=
 =?us-ascii?Q?0SrB4xLAZ4XaHJtvNMNj3x4bfBhV2D/ba2p2AJEe4EHzQqHpok/PLlOA2iZx?=
 =?us-ascii?Q?Kvivl/vIZwrNzyrAGd/64LUHjK1fYl/BjsvC8roGn3vq+yHS+3Fw7+UR2Y+e?=
 =?us-ascii?Q?h07PtpLeIymal/Vyic9P/gB8nfywOCAcogWSCJrJvURzyXXpFAIRvirozdfj?=
 =?us-ascii?Q?3CHkAIt6O33dpa2lt1+IsOoBKjzin8anhuyhNv0t7gVCpVTp1E2IyToSIszN?=
 =?us-ascii?Q?AL9aYQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:30:25.5161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc3701d-f301-4d33-185d-08de53a35e18
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8253

Turing and GA100 share the same GSP-RM firmware binary, but the
signature ELF section is labeled either ".fwsignature_tu10x" or
".fwsignature_tu11x".

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 1025b7f746eb..3f75398954be 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -214,9 +214,13 @@ pub(crate) fn new<'a>(
                 size,
                 signatures: {
                     let sigs_section = match chipset.arch() {
+                        Architecture::Turing if chipset == Chipset::TU116 || chipset == Chipset::TU117 =>
+                            ".fwsignature_tu11x",
+                        Architecture::Turing => ".fwsignature_tu10x",
+                        // GA100 uses the same firmware as Turing
+                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
-                        _ => return Err(ENOTSUPP),
                     };
 
                     elf::elf64_section(firmware.data(), sigs_section)
-- 
2.52.0

