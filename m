Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B280932E130;
	Tue, 10 Feb 2026 02:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691610; cv=fail; b=WdywvPhTXBrMIYWhyaiKuenEZzxiF9m6bZcx7Ql6vIr31HU78BlGtsaH+Gl1AXN8AHojBA2TS79tfx4kTakKWKYvi8w6aCumz0o3szSaIwasVPZbKvahthKCeo4jpnHYLCuGY6/XZFde6HUqU35pFMItfUcZl/LVoQr+lzMW9qI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691610; c=relaxed/simple;
	bh=NAlutS6lYKu49LqpvAln8mayE8s5hwTDWJLFyq+/XEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kX+JB/sfYsu5yrez8QZOJYM/2vhHr/k5zFqAQ8NZmS+TKzYvqe+JfscbNFAixDLvMWHAtoSJpX4AK0o8xoi5mkMFJ/4QyL0Y9sr1NCp9BeTOD9SZ+DjhwUhrNSWHcYZPM54K9iZFUQsESBGfvLtoq6NrRUEQew1kXDw1ajVAFeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YK5c1Zz7; arc=fail smtp.client-ip=52.101.85.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YK5c1Zz7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUuHqNcNGviZAKatkIxw1GDGRQaZXqOE/t/ZWUZpbO1mu4pZ53bNadCMIBdNKXVTDIypMMqU50kEwFxv1cTjcPuMZ0J6hpzuVnSo1fmmQDA+fXFPkY6k63l0jiAqdqAAyIvRxIMt1TCwwBVOVNjVD1pilNfIJ0iNe33ew5r/bCwSsYV8T4/IApG4FgHOaZYQApyOtfYVu81hzBtm5cdNdWg8qudyciB0FQ6K5u5mupfc6aFvtWg6v8Y3VU1onUNmW2o4JabrTVR/j/atalivcb/Dr2TAV7BSTXCReNg7d5UadEWQ2EI5Q87K1uK4bnuvdnu2ONHdv/PLm8zBwlZYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WM98imav+bXAUzgwdOnP1TzoHN6WbVhh/DQsig0OY4=;
 b=sk7tV8bgg5sCUONo1exP4avnrLE4NJreauMEOiN4hLq44QclwRMB1kYlDBVNGQaHsmDcLM4zSm7vfPtmPqoYA6usSV7JvNrW2r2NWzgooSjenMev0duXjldCnRWRbAs7mVXqkInlw/DF/starJ6s28dl0UYad5Ke4h/eQlbvdfRW2Ck0V0Y/nVPg1++TlqH6/2eY36RRTZwbs7pxvLFwd3buClOZ9G7DAECsqRHibw4vlva8rMtEkxw+8oiuUKl7i1kf7hc+A5nCy+W/b31Vtxn8tU9wrsSic01cAJHkwJ8J7VMHQZEbY44xTgqXNNytTGJ6C8/+zSGUABVv3NZPAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WM98imav+bXAUzgwdOnP1TzoHN6WbVhh/DQsig0OY4=;
 b=YK5c1Zz7x4FsHy9HoqaFZpDIk+yC3VvYTWy9F0byE/npsebpRyFVpF4CmVvJ/NFjzCkSAGFCzB0wgtNhGZkF8texrVK2bYyFF3U8B5Khs5xmLx6JKMl+BtuA7sJLAOFU5rqdKmpAXcbTd+HaO/WlboI2UHGWpWGQE5EfXNY8t0s0UGnHGuSunS48LEi7QyAa7uwPMf4TDppeet6lgThLfNxbsGTZXcq8rH8tsiwb11Vk7EzjBboqhR5XbAOejHx6/NiPx704YyLexrJLCUkJTE0HNwbz6/XPsM3proLA7hlVsLZYnNZ0UGROJ/j5GHOkVfJfl23QEmc9mjHWGsQomQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:34 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v4 25/33] gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
Date: Mon,  9 Feb 2026 18:45:52 -0800
Message-ID: <20260210024601.593248-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c05f747-0fe2-49af-cb54-08de684e9a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OS4PR0DJcS5LbobpBDDcCKfAnWiLyNnOiIZQi0n2foHayZFFmRwH6BRoqw0e?=
 =?us-ascii?Q?3HTWZVOSE4A670HYyGnjhj6edGoUqJLROKAZztuZwam/jg2ela+Rjc0Btjg3?=
 =?us-ascii?Q?RKQLGdsB4OGeyzRWg49HmF0sKyoL/MYLBzEiOSRt/1fctC4TJv3gW7S0sel2?=
 =?us-ascii?Q?Rbq5m9by1les+QgJLVW/hjAnx+fF2dEtTL57SNS2Fvv8RtU9a4R0+Sd0u5ck?=
 =?us-ascii?Q?tja5JaFhk3F9Xra1fRZoQKOf0wMWnQJDqtBGoT12a2JFXtvizTLJtC5KcQiN?=
 =?us-ascii?Q?PkwyRhBISnHNdd8oAwQwldof6rvufuCj8djBN9Oxs92P6p1FQyEJ1KhTCgCm?=
 =?us-ascii?Q?7cQIkkpBIBaiI2SIU3WbR//0v6jWvyXAHHbLZA7r/gIO42Ab7B+GD8W/am0J?=
 =?us-ascii?Q?U9kfZWPEsQsMiKFWYtndpMBwId5iuYvQFZSzlML0TBo0HnSM+GYP5GDBivqx?=
 =?us-ascii?Q?bwobjMT/1r+hgJOQmVJxpChlnhv4X3Teth2hcz6nec4dAOWzl8bR+GnIv1Sa?=
 =?us-ascii?Q?+ckkeXdCEZI6WPaj1xq8q77K3diF3xhCrxy3q0pPAWPhWKCYAVd+OsxxOBZw?=
 =?us-ascii?Q?FgeX8rlA6z5a61TZIMUqlb4u6ExSfPx9xZaTcvKhoQDCZOlXlU1zMd20u6Vr?=
 =?us-ascii?Q?2l4xx0XgGymr1OTw4KnsIGQ6p+M0WzZh4hqo/VLCqB4NfYt+y6fT6UAFuLEC?=
 =?us-ascii?Q?8nIhV5mAtopGdTT6Ag+iSfOPgFe2e40LIf8pg551FAlOGn0TlErFzHVnTPxr?=
 =?us-ascii?Q?yPJS0UgOxbJcgF3uPcwgT1lMx046ueHwQIKCEEZbAGcYJ0v6k2FlqZtupuMf?=
 =?us-ascii?Q?shZg8dOr5+SjfVLKiyU9kVd0F5/NswMBuZlc0eSbpgfgjZHyk10Grb5Fgv+k?=
 =?us-ascii?Q?WEP5D0N/JW5upiRWJLpJzgk2Y9rwJHEY7zw9QNGbiW/NkzB/FveT2AlwdlHU?=
 =?us-ascii?Q?Qhkw83mtG5DK9N4UrisnCCf3YnY5xICK+AdCs05EwCmIPm2iiLo3NTEuKcwB?=
 =?us-ascii?Q?R/ISjLy5si7WYOiT6/WiiXpn6B9n1DB1aJEsQfdXrdPiHOTVurO9Y4MxUyxj?=
 =?us-ascii?Q?66WxK8qh/OqMZqAw5j/NL54R6Hu7pStWyfieLWIxrGXB4FVbs1OMMrDA/2u7?=
 =?us-ascii?Q?pXQ5m4xMZMFVDbsmboRapo4xDd1PV6FzG3ksoJaJObskTlQG247C0IiHEvdl?=
 =?us-ascii?Q?IKiMua87+QT/NN1sCENNPfqsZs70PLVpScZ0iEgswgMexukE56K3gK26smxC?=
 =?us-ascii?Q?nX+ssI3uLikuTaJ6TNoVmqgOweWAH3EBR98WYXZlrJcrypX/c5Tg4BSJIZvG?=
 =?us-ascii?Q?yzLi6ak54eQ/YaP3d3B9vnfEc+vLvYFa+zLiO39DgC/e83Xf1/4aGKa1mwAW?=
 =?us-ascii?Q?rLwNbsXmnbSdKVI9bOrT6koe2cqjHhAIrRlHbvhq6zEW4qCVAT2Sa1HBt2Qb?=
 =?us-ascii?Q?rkZ1J5gpPiUhbLBHfsUN7BrZNAufztu3iThqC8t4d36/c8knkedrNEkXMdnF?=
 =?us-ascii?Q?KcAMJUS/XcV/s/o8SvCpD0X8+Sj4RbbpRcW9yLoXl2yBkJ8CfAxLF+ATYTi8?=
 =?us-ascii?Q?Gd8vWSfU/jm02pIREKM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6q1ingd6vr5QydE9rBD1RgCFsomU9thorhAe4UPm+fFsYrK8yrc3LK66kbIv?=
 =?us-ascii?Q?bY2YUG3TzDu21t7Tda73v0ibqAFcHhbJrz9hyXDnd/2TI/Sl2fhoP9hEqj1a?=
 =?us-ascii?Q?M/Ce4AWsMAy9SZaUtxya4fe+hOoiVB3dXsuwKVMZf7caG7zD85+duF/yOA80?=
 =?us-ascii?Q?HdDZAsnHwKUNCOjXiv/0rbQSNIofX9bztMFpxexoYt2i05WwLPvWt3ZUA5X3?=
 =?us-ascii?Q?IGJiQ8BL9n0HFPj0S04TTrkMNxIZ9NHeEaO0LGBRX0MI16cgxxcmAsRNMR3W?=
 =?us-ascii?Q?GwzoSyb4Vdd3p1zHCoKKwlenmAFveXG5wBpQ7RH2hA4Ats1lrQjqAY/ndXT8?=
 =?us-ascii?Q?Ljr0WCJg3uHJBL+mHPQ2zGunLGxnpLUMNAIRP+hoNcLSUBjt89anYqu3krGC?=
 =?us-ascii?Q?fLEYsjF15i/TKOMDXABabMSZc3Ba2pXNvPOzZH/Qu/LwE1M/+UZUyQGGTn4w?=
 =?us-ascii?Q?1S0H1H93rX6GexvY1/BB29YWfDfCCdNANWFatzJzbkR9qxq7tqTid/FULPRZ?=
 =?us-ascii?Q?HSoRL3R2YD+lJdMahU9Mx0g1sFPklPaFsA3AjxKyY2BKPyCRKl21EBRmkWM3?=
 =?us-ascii?Q?egKeMf61mGQNR4FD31xxBae6FEV0pIlJuhLTeD/WlzXhvzIfiRb/Kwd/L8uJ?=
 =?us-ascii?Q?y3HDsEcB81Z07BCUcCe50Rxb32SEV7n53FBMgaiQCBl6SxvXq+V+xxnuVl0+?=
 =?us-ascii?Q?MIX57ZPlQ+6Iu+1kzTCbSgb1GdWWHaQTrvF6FOOa1xw7Dr22Jpanwdn08n7U?=
 =?us-ascii?Q?oDpIhyr1s4vSIT4Y6G/pBL+CyDAHPheEyyABzhNET7/v99D4PpVtGWocjeG9?=
 =?us-ascii?Q?EwEKOv8DWfD4KaOGWTaiEzRN0a7h2U0C2eYpjBC5TXV+ameZqVTi2pXWjYAz?=
 =?us-ascii?Q?6fKNgdFz8UZN+wLVnITWV4s9CA7zIg8mwnVuyBUxujexF0dZGB8mk4siLi8j?=
 =?us-ascii?Q?9Kmucvj2HCIyfAmw+tpK3F38YY8h8uLe+GdxH6kTSeIzcUYnpRhVqus/Wgf3?=
 =?us-ascii?Q?MYrEtl975aBW6xpmINcrcJY4O9IlVO0ubWmCw670XTye2aPgGq/IXli1TV43?=
 =?us-ascii?Q?G1LoUjVN8WXctO3TkPQyujqC3BA5wZeAelcxnnf/3XOzC2QbqYrZpXlcI/98?=
 =?us-ascii?Q?7oVMvK5T4EoDMQiKaZbXSHzetBsCEPJFRbysGDlZcjifrjqdndFVxzcDoXPt?=
 =?us-ascii?Q?50Odmn81fuy8baXtK44jumhqMTI8abEaqst9RciL6iRsJU5f516Ide2s8qt3?=
 =?us-ascii?Q?eM2mpXnT79aLHk+oeqN3jGeq7WPY6fdH5NsKQyR85bDqYZ5DraGl8gE4aHU3?=
 =?us-ascii?Q?+egTfq52ir0FqIqO9rzJXQuQnb8g9gk4t1tUjC8+HvOIVnaYO3LmGlitsLbP?=
 =?us-ascii?Q?aBRtpORRkVjrrVii0EVaVlz9ATdCw71aHmh6ddMEr6QIWHkSHHdaxI03rC12?=
 =?us-ascii?Q?643xejkG0hD1sL1V9ecfH3fEEmQdfqYOFreWZii+Dvspqx3n1a9n3IhukKon?=
 =?us-ascii?Q?lX8HaNFRi4iC0r2F8vwbck7ZaOMd1OxX4DuVtNrrDMhjuVoqr6O2TRD58cXf?=
 =?us-ascii?Q?IOWh8AboEGQEE9jv7lWZPDiBg7H6aZefOQBWnRgpWieI1tzibp/k27VK1AxM?=
 =?us-ascii?Q?pbEQZBlaEipK/96qP/YbIKz8JyIFsJDKgoOktn+OuhYli5tt5N0VAGQDWBC2?=
 =?us-ascii?Q?GqX/I6stArUT0K9/5Pd+JpeN1entA3s5ctAvLK5hzHJcLNDVcgI34XleSpu5?=
 =?us-ascii?Q?01PdIpW+OQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c05f747-0fe2-49af-cb54-08de684e9a4c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:33.9719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7isrOq9OT09kxjo+vxUkLd5t/CN+haxgebaMPCLtKVY33iCcEuZGrIAmi8J4Xz4F1umkt2x6z2Sxldiu4Xu0fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Hopper, Blackwell and later require more space for the non-WPR heap.

Add a new FbHal method to return the non-WPR heap size, and create a new
GH100 HAL for Hopper and GB100 HAL for Blackwell that return the
appropriate value for each GPU architecture.

Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 14 +++++++---
 drivers/gpu/nova-core/fb/hal.rs       |  7 +++--
 drivers/gpu/nova-core/fb/hal/ga102.rs |  2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 37 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/gh100.rs | 37 +++++++++++++++++++++++++++
 5 files changed, 91 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 3a2b79a5c107..7c502f15622c 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -98,6 +98,15 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+/// Calculate non-WPR heap size based on chipset architecture.
+/// This matches the logic used in FSP for consistency.
+pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
+    hal::fb_hal(chipset)
+        .non_wpr_heap_size()
+        .map(u64::from)
+        .unwrap_or(SZ_1M as u64)
+}
+
 pub(crate) struct FbRange(Range<u64>);
 
 impl FbRange {
@@ -255,9 +264,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
-
-            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
+            let heap_size = calc_non_wpr_heap_size(chipset);
+            FbRange(wpr2.start - heap_size..wpr2.start)
         };
 
         // Calculate reserved sizes. PMU reservation is a subset of the total reserved size.
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index eaa545fe9b08..ebd12247f771 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -12,6 +12,8 @@
 
 mod ga100;
 mod ga102;
+mod gb100;
+mod gh100;
 mod tu102;
 
 pub(crate) trait FbHal {
@@ -42,7 +44,8 @@ pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
-        Architecture::Ampere => ga102::GA102_HAL,
-        Architecture::Hopper | Architecture::Ada | Architecture::Blackwell => ga102::GA102_HAL,
+        Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
+        Architecture::Hopper => gh100::GH100_HAL,
+        Architecture::Blackwell => gb100::GB100_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index 734605905031..f8d8f01e3c5d 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -8,7 +8,7 @@
     regs, //
 };
 
-fn vidmem_size_ga102(bar: &Bar0) -> u64 {
+pub(super) fn vidmem_size_ga102(bar: &Bar0) -> u64 {
     regs::NV_USABLE_FB_SIZE_IN_MB::read(bar).usable_fb_size()
 }
 
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
new file mode 100644
index 000000000000..eaab3f934f6e
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gb100;
+
+impl FbHal for Gb100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        Some(0x220000)
+    }
+}
+
+const GB100: Gb100 = Gb100;
+pub(super) const GB100_HAL: &dyn FbHal = &GB100;
diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
new file mode 100644
index 000000000000..6c56b8439276
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gh100;
+
+impl FbHal for Gh100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        Some(0x200000)
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn FbHal = &GH100;
-- 
2.53.0

