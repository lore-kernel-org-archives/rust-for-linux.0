Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCBD2D6639
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767343755; cv=fail; b=BNCDtwkQs7bVR8JpoOxFLf7M8X7Afma6PPsL0lIc6r2P5erMfFA8jF1Gd+oFm9G5fl3hAPqpJ9ll8Rw3NPt2n1Oo95JNPr7fk3nNy6osV3UEKRzkqdoTcr/dmYaOqpA429sDjt6FKa2/Quzzho/CTXeJsF3ChPcCF9TTd8OFJns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767343755; c=relaxed/simple;
	bh=5up0LnAD3+E0QiRuRqYS0NNUjt3/Rq5P2wbYJVy8ig0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UWjBb3jgt74rpVrcAq0Cz47KcO12t5CQHqLYlGXsO22aMtb94DFNiWz/sHMbsc3AxHxNkT/dvR+3U2BHu6i7+U68fqBmhhpxEZsvLOa3QvUCeWik11nwY6D05Un3WG/rcdpMowJwM/ODNW0mldElxiXS7GT+7emaBIwiAThkUAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=fWx3DxMW; arc=fail smtp.client-ip=52.101.65.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="fWx3DxMW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrqVyBwZqTT7oagxzxwVIXjoQXEtUzBcJ5JuMNM+p9pkhFxRNxXqna0mYHj7WWKep3yw7FIxBlL2ri1usDv84DgFRz/yh8T9a3f0tq2eyBPJSgqGicvXXiH1BqgmduDr38dcDWcYNxhGzbIEXvSanAX+mX3EG0Xsfn8GRQQ61w9p8qzHlOvRnQvVuioEaqY5CXH7Nx0yW5qC5eewHrFmUEG5LiuqDOZm7/eprT+JRZb/roaa96w2hs0Md9AaXAlme1IlOsLoMFWFjyZwoKCeKKdqU+DFOYSAtQR4NcT2YzZ7qZyHMQOh5TjmSbwNw3qGdW24hgPiE1Z/s/QqNcl+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgTPg/lmiCkJLCoGm3ef6pFVburO/B0FyFpjTCVq6jc=;
 b=K1web78pudgorjOs3SaJkRtAIUJ0XEro6Ue5qDe5X66RdeaYO8JqVLVNnrzsuL+58QLERI8AO8seAfRJqmpTe/nzOZLX3FSb3ff1dD74xRIvCdZqPqsVzk0HlwcFpKpr6qxgya9gzBt2Vw2ET47q64wsxr8oYfxNTAildlBU16Fy/sNNNtIK8QgCajbpDwQ5DPotH9szrchGOzqKJvgKZwUEYQWREUEevQwkGqDzTw6Xd0kCd7iH171mhtwB7hVKNe8qFbzZrK98F850LP4d+GzLBA9rE3c/Lk8mWHQoMaZ0os91CFkGNVHMA/+Au6ic46Cu88/a+uLCMwk8yG7RCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgTPg/lmiCkJLCoGm3ef6pFVburO/B0FyFpjTCVq6jc=;
 b=fWx3DxMWJB0+JvVNzhqp1Jz8WdwJNDJzP3HpRz1AAt9L5dj+GoOfuAdkjTrV+2OkaJdZtvXdu+rf2D6HbLHBplyTpNVGfNNRyHo17UxrX5S4hX3wDG8XjiFkfeNOhFCBuD4PxtDeUxZFWcWRtaaLlkmXnjfEGj9bEfNrThqMqXvVGM2RUCw/2daJyHuCSX1+XliGQ/0HmFl15VO8Mf9vcLROcJ+eJzyUJ8kCRWUiKumkfggo/NgczphgWJBjzUK/kUGmt9IKwCIerAYvdJzHlCdzbxTu4/qu/xVuP1iwuo5FIO0BTDCpFf839fcZmcJJ9H+6g6xXuvQzAFDC/TMccA==
Received: from DUZPR01CA0239.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::28) by AS8PR10MB7857.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:636::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 08:49:09 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::ed) by DUZPR01CA0239.outlook.office365.com
 (2603:10a6:10:4b5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Fri, 2
 Jan 2026 08:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Fri, 2 Jan 2026 08:49:09 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 2 Jan
 2026 09:48:56 +0100
Received: from HI7-C-0001H.de.bosch.com (10.34.220.0) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 2 Jan
 2026 09:48:56 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>, <tamird@gmail.com>
CC: <dirk.behme@de.bosch.com>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
	<dakr@kernel.org>
Subject: [PATCH] rust: fmt: Fix grammer in Adapter description
Date: Fri, 2 Jan 2026 09:48:21 +0100
Message-ID: <20260102084821.1077864-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|AS8PR10MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: 64781a8c-26c3-4065-23ba-08de49dbcb5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rR4vlEQeWwSOFZPdnlPacv95I4hEHUicx4bU7iBvCitjxChD5dSW4d0M+vPH?=
 =?us-ascii?Q?G61NwpxiefHL04oE/OFtOwEgnhUPRPhSaVT1OKwjnWsu5jm43+LULZ9oC65/?=
 =?us-ascii?Q?4QRJ4UIRFIO1Jac5wtZFigaLsEIltAV+s37k9W2LN3KephmABh8+wEM4pcJb?=
 =?us-ascii?Q?kygGobyRqFN3ba47P7rBQQ1as/RDkasB1wpQQ5YKc0Dp0mx3fjSUUv+MAYNq?=
 =?us-ascii?Q?fOpDK+2qaim7sOclPMfLz5eodSIc4vDMQvsK0syffnhvtq0gSVEzFz/ZGzxm?=
 =?us-ascii?Q?3fvq6nRx+CWbmztR+W+4gPZuWnlB0XLoXdFJLKH4YzouEgG2VD/cRIzGlpgI?=
 =?us-ascii?Q?SS1kMeNu31zatTzhzrnEITXG6D3/802oboQdl8+ptslQwZU7Jd10qfU9zF9L?=
 =?us-ascii?Q?dvyhsjhpTeccMnSvZYr+pSrPYgvk6dYdxi8wo8Dc28aDuXfZWxUgXDb/2d+g?=
 =?us-ascii?Q?jnGSYXm+hpDttc59yIjVKN77hRNLO2nIC42w4wfYvQq45MM/DF70PBej89tK?=
 =?us-ascii?Q?pzXkwKIh8enh2C4/iZCiAwzdKbu96RGUwezcifUO2SMY/t4zgT0TsuyGXUCT?=
 =?us-ascii?Q?ybTf/0TbZzG3rlOmV77AKZZijT+rO2QxYVhhVbXh/POXvyLT/4FwG2JzYUrt?=
 =?us-ascii?Q?it23RbO5BYHUW+9y7eMrY96EXm4oUpZEmO+NtlZl2jZ9Y6XAvzIfj/xA3wA8?=
 =?us-ascii?Q?S5XAYkj4qjtcGjU/YHc9FTBqtCuzFgebXGpQg56ZlBsMdX7mEHk4GuDLJTSI?=
 =?us-ascii?Q?lqcs6B1e42VquMtvsKpbSWDhWT+LFYKvrhJCXfkQDtirihsF7dq44ng2LBmH?=
 =?us-ascii?Q?U0dc/3pH/Rvr9FYbsSMgUribfMFUPg2nkz0dZdeeYEeYzUkJK0CgFbKHUp60?=
 =?us-ascii?Q?E/aFYA2bZEWFwZLZ2w19JirlLkPaHi0HJw1z2YL0TrTJJZblmG/aM1pNTfGw?=
 =?us-ascii?Q?sxMI8uN2X7D6P2uNMTIb9RviNZV7TP0WO2ZksnlwfcMjcepbq4HtbR9Hzlsi?=
 =?us-ascii?Q?CS1ETBGd7mCcjlt2uds/RP9SCO/aTKL4AGWRVOKsyjbv86SYBeSclmeHpcwD?=
 =?us-ascii?Q?Vgj0tVQaKSjw2KefVQ3Vr2oqES9F+fOQRhXFDxUngRBI6DC3pMoP3Voo0ha1?=
 =?us-ascii?Q?Fn159RJKJqWeNIi70hneNREU0eBdWxquQ2CrayGiWRCoiUWsngcMDWzzXG0n?=
 =?us-ascii?Q?uHBP/57R8qRolS+HREoSXWQXOUvmdTJFQka/4SuE8zTznP1dLAn7exIIENAP?=
 =?us-ascii?Q?NJtRs2/2tqSgxpSHFW41V1edw40RWi7CRGwEifHLYOhRcRGDqWt5/FSXWgxj?=
 =?us-ascii?Q?Wb7NClWFflX3GzaA8JagnekjqTTYYp240MC8/4Sgkzo/MaQV4TEa42fLkVdK?=
 =?us-ascii?Q?L/Ou2vZHcX8kqkXzxkGhgw97vPtDBb+uXsO30YMER/11LT9eG7ZiZQf90HhP?=
 =?us-ascii?Q?LIUhE3ZwxGL0BXtuXwvYprRo20CRmBOAPDhJmQmcEdtyFnc6ZExfE1PSeVF0?=
 =?us-ascii?Q?dJX6lXNJD0zG8XC7x6OIkh6jNAjkjlFA/ZDu5vy6NIPP5BtmHZlaoHOARdLs?=
 =?us-ascii?Q?QuHe33bvSMExwTcy5s4=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 08:49:09.0721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64781a8c-26c3-4065-23ba-08de49dbcb5d
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7857

Add a missing `and` in the description of the `Adapter`.

Fixes: c5cf01ba8dfe ("rust: support formatting of foreign types")
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 rust/kernel/fmt.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 84d634201d90a..1e8725eb44ed7 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -6,7 +6,7 @@
 
 pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
 
-/// Internal adapter used to route allow implementations of formatting traits for foreign types.
+/// Internal adapter used to route and allow implementations of formatting traits for foreign types.
 ///
 /// It is inserted automatically by the [`fmt!`] macro and is not meant to be used directly.
 ///
-- 
2.48.0

